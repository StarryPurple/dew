# Rx ↔ Dew Interop

> **Canonical specification** for translating between Rx (Rust-like imperative) and Dew (pure functional).  
> Last updated: 2026-06-15.

[§1 Motivation](#1-motivation) ·
[§2 Rx Profile](#2-rx-language-profile) ·
[§3 Translation Rules](#3-translation-rules) ·
[§4 Architecture](#4-architecture) ·
[§5 Invariants](#5-translation-invariants) ·
[§6 Limitations](#6-limitations-and-future-work) ·
[§7 Reference](#7-reference)

---

## 1. Motivation

Dew's design intent includes serving as an **analysis intermediate representation** for imperative/OO languages. The workflow:

```
Rx Source → Rx→Dew Translator → Dew Source → Dew Type Checker → Safety Report
                                                                    ↓
Rx Source (annotated) ← Dew→Rx Translator ← Restructured Dew ←──────┘
```

This is analogous to Rust's **Miri** (an interpreter that detects undefined behavior), but instead of operating on MIR (a low-level IR), Dew operates on a **high-level functional language** with an expressive type system. The Dew type checker becomes the safety analysis engine for Rx code.

> The insight is that a functional language with affine types is a natural analysis IR for imperative code. Ownership (who uses what, when) becomes explicit through affine typing. Side effects (IO, mutation) become explicit through type annotations. Control flow (loops, breaks) becomes structured through recursion and `fix`. The result is that safety properties detectable by Dew's type checker — use-after-move, unintended sharing, effect ordering — directly correspond to bugs in the original Rx code. This is the same principle as "desugar to core calculus and check there," applied at the language level rather than the compiler IR level.

### Key Advantage

Using a high-level functional IR rather than a low-level IR means:
- **Ownership is explicit** — affine types track resource usage at the language level
- **Purity is visible** — side effects are explicit in the type system
- **Analysis results are human-readable** — Dew source is a valid programming language
- **Round-trip is possible** — Rx → Dew → annotated Rx, not just Rx → error

---

## 2. Rx Language Profile

Rx is a **Rust subset** implemented by the RustShard-Compiler. Key characteristics:

| Category | Rx Feature | Notes |
|----------|-----------|-------|
| **Types** | `i32`, `bool`, `()`, `f64`, `&T`, `&mut T`, `[T]`, `[T; N]`, user structs/enums | No generics, no lifetimes |
| **Mutability** | `let mut`, `=`, `+=`, `-=`, `*=` etc. | Full mutation model |
| **Control** | `if`, `else`, `loop`, `while`, `match`, `break`, `continue`, `return` | All imperative control flow |
| **Functions** | `fn`, `impl`, methods, `self`, `&self`, `&mut self` | No closures |
| **Memory** | References `&T`, `&mut T`, deref `*expr` | No borrow checker (compiler only checks syntax) |
| **Structs** | Named fields (`S { x: 1, y: 2 }`) | Positional construction |
| **Enums** | Simple variants, optional discriminant | No payload (limited) |
| **Other** | `trait`, `impl Trait for Type`, `const`, `type` alias | Typeclass-like features |

**What Rx does NOT have**: closures, generics, lifetimes, pattern matching on enums, iterators, `for` loops.

---

## 3. Translation Rules

### 3.1 Type Mapping

| Rx Type | Dew Type | Notes |
|---------|----------|-------|
| `i32` | `Int` | Signed 64-bit (Dew has no 32-bit) |
| `bool` | `Bool` | Direct mapping |
| `char` | `Char` | (Rx: 8-bit ASCII → Dew: Unicode) |
| `()` | `Unit` | Dew rejects `()`, uses `Unit` keyword |
| `f64` | `Int` (temporary) | Dew has no Float; truncate for now |
| `[T; N]` | `Array(T, N)` | Direct mapping |
| `[T]` | `Array(T, ?)` | Slice size unknown → needs length parameter |
| `&T` | `T` | Reference → owned value (ownership passed) |
| `&mut T` | `T` + `&` rebinding | Mutable ref → ownership transfer + rebind |
| `Struct S { .. }` | `struct S { .. }` | Named → positional (Dew convention) |
| `Enum E { .. }` | `enum E { .. }` | Direct mapping |

### 3.2 Function Translation

**Rx:**
```rust
fn add(x: i32, y: i32) -> i32 {
    x + y
}
```

**Dew:**
```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
```

**Rx impl methods:**
```rust
impl Point {
    fn dist(&self, other: &Point) -> f64 { ... }
}
```

**Dew (standalone functions):**
```dew
def Point_dist = fn(self: Point, other: Point) -> Int { ... }
```

`&self` becomes an owned `self: Point` parameter. The method becomes a standalone function prefixed with the type name.

### 3.3 Mutation → Ownership Transfer

The core translation challenge: Rx's mutable variables must become Dew's immutable rebinding.

> Mutation is semantically "change the contents of a memory cell." In a pure functional language, there are no memory cells — only bindings of names to values. The translation strategy is to model mutation as a sequence of new bindings: `x = x + 1` becomes "take the old value of x, compute a new value, and rebind x to it." The `&` sugar marks this rebinding explicitly, preserving the intuition that "x changed" while maintaining the functional semantics that "x is now a different value." This is not a hack — it's the Curry-Howard correspondence in action: imperative state updates correspond to threading a value through a sequence of let-bindings.

**Rx:**
```rust
let mut x = 1;
x = x + 1;
x += 1;
```

**Dew (direct translation):**
```dew
def x = 1;
&x = x + 1;
&x = x + 1;
```

`let mut` → `def` (initial binding). Subsequent mutations → `&name = expr;` (rebind with ownership transfer).

**Complex mutation (field access):**
```rust
let mut p = Point { x: 1, y: 2 };
p.x = 10;
```

**Dew:**
```dew
def p = Point(1, 2);
&p { x = 10 };
```

### 3.4 Loop → Recursion

**Rx:**
```rust
let mut i = 0;
while i < n {
    // body
    i = i + 1;
}
```

**Dew:**
```dew
def loop_body = fn(&i: Int, n: Int) -> Int {
  if i < n {
    &i = i + 1;
    loop_body(&i, n)
  } else { i }
};
loop_body(&0, n)
```

Or using `fix`:
```dew
fix loop {
  fn(&i: Int, n: Int) -> Int {
    if i < n { loop(&i + 1, n) } else { i }
  }
}(&0, n)
```

**`break` with value → return from loop function:**
```rust
loop {
    if cond { break value; }
    // body
}
```

**Dew:**
```dew
fix loop {
  fn(state: T) -> Int {
    if cond { value } else { loop(next_state) }
  }
}(initial_state)
```

**`continue` → recursive call without value change.**

### 3.5 Reference → Ownership + Return

**Rx:**
```rust
fn increment(p: &mut Point) {
    p.x = p.x + 1;
}
```

**Dew:**
```dew
def increment = fn(&p: Point) -> Point {
  &p { x = p.x + 1 }
}
```

The `&mut Point` parameter becomes `&p: Point` (ownership + rebind). The function returns the modified value.

**Call site:**
```rust
increment(&mut p);
```

**Dew:**
```dew
&p = increment(&p);
```

### 3.6 if/else

**Rx:**
```rust
if (cond) {
    then_expr
} else {
    else_expr
}
```

**Dew:**
```dew
if cond { then_expr } else { else_expr }
```

Rx requires parentheses around conditions; Dew does not. Both require `else`.

### 3.7 match

**Rx:**
```rust
match expr {
    Pattern1 => result1,
    Pattern2 => result2,
    _ => default,
}
```

**Dew:**
```dew
match expr {
  Pattern1 => result1,
  Pattern2 => result2,
  _ => default,
}
```

Nearly identical syntax. Pattern semantics differ: Rx has `ref`, `mut`, `@` bindings; Dew has none.

### 3.8 Special Cases

| Rx Construct | Translation Strategy |
|-------------|---------------------|
| `expr as Type` | Type conversion function (or identity for compatible types) |
| `a..b`, `a..=b` | Range value or desugar to explicit bounds |
| `# comment #` | `// comment` (reformat in translator) |
| `const X: T = e;` | `def X = e;` (immutable by default) |
| `type Alias = T;` | Not supported in Dew Core; expand at translation |
| `break expr` | Return from loop function |
| `continue` | Recursive call with unchanged state |

---

## 4. Architecture

### 4.1 Translation Pipeline

```
┌─────────────────────────────────────────────────────┐
│                   Rx → Dew (Forward)                │
│                                                     │
│  Rx Source → Rx Parser → Rx AST → DewEmitter → Dew  │
│                                           Source    │
└──────────────────────────┬──────────────────────────┘
                           │
                           ▼
                  ┌─────────────────┐
                  │  Dew Compiler   │
                  │  Type Check     │
                  │  Affine Analysis│
                  │  Purity Analysis│
                  └────────┬────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────┐
│                   Dew → Rx (Reverse)                │
│                                                     │
│  Annotated Dew → RxEmitter → Rx Source (annotated)  │
└─────────────────────────────────────────────────────┘
```

### 4.2 DewEmitter

The forward translator (`DewEmitter`) walks the Rx AST and emits Dew source text:

```
Rx AST (C++ structs) → DewEmitter (Rust) → Dew Source (String)
```

Implementation note: The Rx parser was previously reimplemented in Rust (`src/rx_parser.rs`, 718 lines) because the original Rx compiler is C++. The translator (`src/rx2dew_ir.rs`, 250 lines) then emitted Dew source from the parsed Rx AST.

### 4.3 Safety Analysis

The Dew type checker performs these analyses on translated Rx code:

1. **Affine tracking**: Variables used at most once where required
2. **Purity analysis**: Side effects are explicit (Stdin/Stdout)
3. **Exhaustiveness**: Match arms cover all cases
4. **Type safety**: No type errors at runtime

Analysis results are mapped back to Rx source locations through span tracking.

---

## 5. Translation Invariants

These must hold for the round-trip to be correct:

1. **Type preservation**: `translate_type(rx_type) = dew_type` and `reverse_type(dew_type) = rx_type` (up to representation differences like Int/i32)

2. **Behavioral equivalence**: For all valid Rx programs P, `eval(translate(P))` produces the same output as `execute(P)` (modulo I/O ordering)

3. **Error correspondence**: A type error in translated Dew code corresponds to a genuine safety issue in the original Rx code (no false positives from translation)

4. **Source location tracking**: Every Dew expression carries the Span of its originating Rx expression, so errors can be reported at the correct Rx source location

---

## 6. Limitations and Future Work

| Limitation | Status | Plan |
|-----------|--------|------|
| No Float in Dew | Current | `f64` truncates to `Int`; add Float later |
| No generics in Rx or Dew | Current | Both languages will add generics (Dew Phase 6) |
| Rx traits ≠ Dew TypeClass | Future | Map during Phase 6 |
| Slice `[T]` has unknown length | Current | Add length parameter or use List |
| `break` with value in nested loops | Complex | Requires label-based or CPS translation |
| Rx comments `#...#` | Parser | Handle in Rx lexer reimplementation |

---

## 7. Reference

- Rx Grammar: `RustShard-Compiler/docs/semantic_rules.md`
- Dew Language: `docs/design/dew-lang.md`
- Dew IR: `docs/design/dew-ir.md`
