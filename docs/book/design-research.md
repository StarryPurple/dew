# Design Research: What a Programmer-Friendly Functional Language Needs

Research-driven design recommendations for Dew — a minimal functional language with affine types, implicit lazy evaluation, and structured diagnostics.

---

## 1. Syntax & Ergonomics

### 1.1 Pipe-Forward (`|>`)

**Precedent**: F# (idiomatic), Elm, Gleam, OCaml (4.14+ `|>`)  
**Impact**: Eliminates deeply nested function calls, reads left-to-right as data pipeline.

```
# Current Dew — deeply nested
head(tail(tail(xs)))

# With pipe-forward
xs |> tail |> tail |> head
```

**Verdict**: High value, low implementation cost. A syntactic desugaring of `x |> f` to `f(x)`.

### 1.2 Pattern Matching

**Precedent**: Elm, OCaml, Rust — all modern FP languages have it.  
**Impact**: Replaces chains of `if`/`isnil`/`head`/`tail` with exhaustiveness-checked case analysis.

```
# Current Dew — manual destructuring
def headVal = head(xs);
def tailVal = tail(xs);
if isnil(xs) { 0 } { headVal + sum(tailVal) }

# With pattern matching
match xs {
  nil -> 0,
  cons(h, t) -> h + sum(t)
}
```

**Verdict**: Medium-term priority. Exhaustiveness checking is a major UX win.

### 1.3 Familiar Syntax Choices

Dew's current syntax is good: `def` for bindings, `fn` for lambdas, `#` for comments.  
**Keep**: explicit delimiters (`{}`, `;`) — avoid indentation sensitivity (prevents IDE/formatting issues).  
**Consider**: `//` line comments alongside `#` (familiar to C-family programmers).

---

## 2. Type System UX

### 2.1 The "Five Questions" Error Framework

Every affine/type error must answer:

| Question | Pattern |
|----------|---------|
| **What** went wrong? | Error code + one-line summary |
| **Where** is the problem? | Source span with underline |
| **Why** is this a rule? | `note:` explaining the type system rationale |
| **How** did we get here? | Trace: first consumption site, capture chain, branch analysis |
| **How to fix it?** | `help:` with compilable Dew code suggestion |

### 2.2 Rust-Style Multi-Site Error Display

```
error[D001]: affine resource used after consumption
  --> examples/box_double.dew:6:3
   |
4  |   def b = box(42);
   |       - Box(Int) allocated — affine (linear) resource
5  |   def _ = unbox(b);
   |                - first consumption: unbox deallocates the Box
6  |   unbox(b)
   |   ^^^^^^^ second use — b is no longer available
   |
note: Box(T) values must be consumed at most once to prevent double deallocation.
help: Extract the inner value once and reuse the unrestricted result:
   |
5  |   def n = unbox(b);
6  |   n + n
```

### 2.3 Closure Affinity Explanation

```
error[D003]: FnOnce closure called multiple times
  --> examples/fnonce_err.dew:5:17
   |
4  |   def reader = fn (x: Int) { unbox(b) };
   |       ------   ^^^^^^^^^^^^^^^^^^^^^^^^^ captures b: Box(Int) → FnOnce
   |       reader: Int -1-> Int
5  |   reader(0) + reader(0)
   |   --------     --------
   |   first call    ^ second call — reader already consumed
   |
help: Call once and reuse the result:
   def result = reader(0);
   result + result
```

### 2.4 Branch Mismatch Table

```
error[D004]: branch consistency error
   |
   | def b = box(42);
   | def result = if cond { unbox(b); 1 } else { 0 };
   |
   | Branch analysis for b: Box(Int):
   |   then-branch: consumed (by unbox) ✓
   |   else-branch: not consumed ✗
   |
help: Unbox before the if, or consume in both branches.
```

### 2.5 Error Code System

| Code | Error |
|------|-------|
| D001 | Affine resource used after consumption (double unbox, double call) |
| D002 | Resource leak (affine variable never consumed) |
| D003 | FnOnce closure called multiple times |
| D004 | Branch mismatch (affine consumed in one branch but not other) |
| D005 | Dup on affine value |
| D006 | Type mismatch |
| D007 | Unbound variable |
| D008 | Invalid main function |

---

## 3. Affine Type Diagnostics — Priorities

### 3.1 P0: Source Spans (Essential)

The `Span` type exists in `diagnostics.rs` but is never populated. The lexer tracks `line`/`col` but doesn't attach spans to tokens. **This is the single biggest gap.**

**Implementation path**:
1. `parser.rs`: Annotate `Expr` nodes with source positions
2. `typeck.rs`: Carry spans through `TypeError` variants
3. `diagnostics.rs`: Emit span in JSON and human-readable output
4. Use `ariadne` (already a dependency) for terminal rendering

### 3.2 P0: Fix Resource Leak Detection

The `box_leak.dew` program currently compiles and runs without error. The `leaked_affine()` check runs at the wrong scope — it should run at every `Let` body exit, not just at the top-level. Promote leaks from soft diagnostics to errors.

### 3.3 P1: "Why Affine" Provenance

Every error involving affinity should include the *reason*:
- `"b: Box(Int) is affine because Box(_) values are linear resources"`
- `"reader: Int -1-> Int is affine because it captures b: Box(Int)"`
- `"f: Int -1-> Int is affine because it returns a closure capturing an affine variable"`

### 3.4 P1: Actionable Suggestions

For each error pattern, provide a code fix:
- Double-use of unrestricted value → `help: consider dup(x) to create a copy`
- Double-unbox → `help: unbox once into a variable, then use that variable`
- FnOnce double-call → `help: call once and reuse the result`

---

## 4. Laziness & Thunk Runtime Design

### 4.1 Keep Implicit Laziness (With Guardrails)

Implicit laziness is Dew's core research contribution. Removing it would make Dew a generic minimal language. However, unadorned implicit laziness (Haskell's approach) creates a gulf between "correct program" and "well-behaved program" (space leaks). The research across Haskell, OCaml, Koka, and Roc collectively says: **the value of laziness is real, but the cost of hiding it entirely is higher than the cost of making it transparent.**

### 4.2 Required Guardrails

| Guardrail | Priority | Description |
|-----------|----------|-------------|
| **Source attribution** | P1 | Map thunk IDs to source locations (currently opaque `%t3`) |
| **Human-readable thunk report** | P1 | `--report-thunks` with suggestions ("5 thunks immediately forced — consider strict evaluation at line 12") |
| **Thunk timeline trace** | P2 | `--trace-thunks` showing create/force/reuse events with timing |
| **Strictness override (`!`)** | P2 | Escape hatch: `!expr` forces strict evaluation regardless of context |
| **Retainer profiling** | P3 | Future: snapshot thunk store to show what's retaining each thunk |

### 4.3 Thunk Report Format

```
Thunk report (3 created, 3 forced):
  Immediately forced (unnecessary suspension):
    %t0 → def sum at line 8 (no sharing benefit, consider strict)
  Benefited from sharing:
    %t1 → def from at line 14 (forced 37 times, memoized 36 hits)
  Never forced (potential bug or dead code):
    %t2 → tail element at line 22 (beyond consumed prefix)
```

### 4.4 Laziness Design Decision

| Aspect | Decision | Rationale |
|--------|----------|-----------|
| Default | Implicit (compiler-driven) | Core research contribution |
| User override | `!expr` for strict | Escape hatch for wrong inference |
| Cons tail | Always suspended | Enables infinite lists |
| Thunk FSM | Keep 3-state (Unevaluated→Evaluating→Evaluated) | Detects circular deps |
| Diagnostics | Source attribution + human-readable suggestions | Makes invisible laziness visible |
| Why laziness? | Document in `docs/book/laziness.md` | Users need to understand the tradeoff |

---

## 5. Module System (Future)

### 5.1 Phase 1: File-Based Modules

Dew is currently single-file. A minimal module system:

```dew
-- math.dew
pub def add = fn (x: Int, y: Int) { x + y };
pub def mul = fn (x: Int, y: Int) { x * y };
def helper = fn (x: Int) { x };  -- not pub, invisible outside

-- main.dew
import math;
def main = fn () { math.add(1, math.mul(2, 3)) };
```

**Key decisions**:
- **File-based**: one module per `.dew` file
- **Explicit exports**: `pub` keyword required (nothing exported by default)
- **Qualified imports only**: `math.add`, not bare `add` (prevents name clashes)
- **No circular imports**: enforce DAG like OCaml (builds stay predictable)

### 5.2 Phase 2: Interface Files (`.dewi`)

Like OCaml's `.mli`, interface files declare the public API:

```dew
-- math.dewi (interface)
pub def add : fn (Int, Int) -> Int;
pub def mul : fn (Int, Int) -> Int;

-- math.dew (implementation — inferred, checked against .dewi)
pub def add = fn (x, y) { x + y };
pub def mul = fn (x, y) { x * y };
def helper = fn (x) { x };
```

### 5.3 What to Avoid
- Haskell-style unqualified Prelude (creates hidden name clashes)
- Typeclass-style ad-hoc polymorphism in modules
- Full OCaml functor system (too complex for Dew's scale)

---

## 6. Build Tooling (Future)

### 6.1 Cargo-Style Single Tool

```bash
dew init my-project         # scaffold Dew.toml + main.dew
dew build                   # compile all .dew files
dew run                     # build + run main
dew test                    # run all .dew files in tests/
dew fmt                     # format code
```

### 6.2 Dew.toml Manifest

```toml
[package]
name = "my-project"
version = "0.1.0"
edition = "2024"

[dependencies]
# Git dependencies only (no central registry initially)
stdlib = { git = "https://github.com/dew-lang/stdlib", tag = "v0.1.0" }
```

**Key decisions**:
- Declarative manifest (no build scripts)
- Lockfile for reproducibility
- Git dependencies first, central registry later
- Workspace support from the start (Rust retrofitted workspaces — painful)

---

## 7. What Dew Should NOT Do

| Anti-Feature | Why Not |
|-------------|---------|
| **Haskell-style typeclasses** | Enormous complexity in error messages. OCaml's module system is simpler for same use cases. |
| **Dependent types** (Idris/Agda) | Overkill for a minimal language. Dew's purpose is affine + laziness, not proof. |
| **Full Hindley-Milner inference** | Inference errors are cryptic. Elm proved boundary annotations + light inference is more user-friendly. |
| **Pervasive laziness without diagnostics** | Haskell's pain point — space leaks inscrutable without tools. Dew's diagnostics are the fix. |
| **Content-addressed code** (Unison) | Too radical, breaks all existing tooling and mental models. |
| **Record subtyping / row polymorphism** | Adds type system complexity disproportionate to benefit at Dew's scale. |

---

## 8. Implementation Priority Map

### NOW (matches current scope)

| # | Feature | Cost | Impact |
|---|---------|------|--------|
| 1 | Source spans on AST nodes + errors | Medium | Critical |
| 2 | Fix resource leak detection (scope-level check) | Low | Critical |
| 3 | Five-question error framework with suggestions | Medium | High |
| 4 | Error codes (D001-D008) | Low | Medium |
| 5 | Thunk source attribution in diagnostics | Low | High |
| 6 | Pipe-forward `|>` operator | Low | High |

### NEXT (growing the language)

| # | Feature | Cost | Impact |
|---|---------|------|--------|
| 7 | Pattern matching with exhaustiveness | High | High |
| 8 | Human-readable thunk report (`--report-thunks`) | Low | Medium |
| 9 | Thunk timeline trace (`--trace-thunks`) | Low | Medium |
| 10 | Strictness override (`!expr`) | Low | Medium |
| 11 | File-based modules (Phase 1) | Medium | High |
| 12 | ariadne-powered terminal error display | Medium | High |

### LATER (if Dew grows beyond teaching language)

| # | Feature | Cost | Impact |
|---|---------|------|--------|
| 13 | Interface files (`.dewi`) | Medium | Medium |
| 14 | Build tool (`dew build`, `dew init`) | High | High |
| 15 | Retainer profiling for thunks | High | Medium |
| 16 | Effect tracking for thunks (diverging vs pure) | High | Low |

---

## 9. Core Design Principles

1. **The compiler is a teacher, not a judge.** Every error teaches the type system. Error messages should explain *why*, not just *what*.

2. **Diagnostics > Language Features.** Elm and Rust prove that error quality is more important for adoption than language power. Dew's diagnostic-first architecture is the right bet.

3. **Implicit by default, transparent on demand.** Laziness is implicit (compiler-driven), but diagnostics make it fully visible. Users shouldn't need to think about evaluation order, but they should be able to inspect it.

4. **Primitives over frameworks.** Dew provides evaluation, not a build system. Functions, not typeclasses. The language stays small; tooling can grow.

5. **Honesty in the types.** `Int -1-> Int` tells you a function consumes its argument. Types carry meaning. The compiler doesn't hide the cost of operations.
