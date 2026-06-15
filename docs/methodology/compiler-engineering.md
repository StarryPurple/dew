# Compiler Engineering Methodology

This document defines **how we build the Dew compiler**. It covers pipeline architecture, IR design, verification, and engineering practices. Read this before implementing any compiler pass.

---

## Core Principles

### 1. Pipeline Clarity

Each compiler stage is a distinct, independently testable module with a single responsibility. The pipeline reads like a UNIX pipe — data flows forward, each stage transforms one representation into the next.

```
Source → Lexer → Parser → Desugar → NameRes → TypeCheck → Strictness → IRGen → Eval
```

A stage must not reach backward to modify previous stages. Passes communicate through defined intermediate representations, never through global mutable state.

### 2. IR as Truth

The intermediate representation is the canonical semantic layer. All optimizations, analyses, and transformations operate on IR. Source syntax is surface only — no semantic reasoning should happen at the AST level after desugaring.

The IR must be:

- **Complete**: Every language feature must be expressible in IR
- **Minimal**: Fewer primitives > more primitives (target: 6 for thunk graph)
- **Serializable**: Text format for debugging (`--emit=text`), JSON for tooling
- **Verifiable**: Well-formedness checks that catch compiler bugs

### 3. Error at the Earliest Stage

Diagnostics should be emitted at the earliest stage where the error is detectable. A type error should be caught in the type checker, not at IR gen or runtime. This makes error messages precise and prevents cascading failures.

### 4. Test at Every Boundary

Each pipeline stage gets three test layers:

| Layer | What | Example |
|-------|------|---------|
| **Unit** | Single function behavior | `classify(Expr::App {..}, Strict)` returns `Strict` |
| **Integration** | Stage input → stage output | Parse string → verify AST structure |
| **End-to-end** | Source program → result | `examples/factorial.dew` → output `120` |

End-to-end tests are the primary quality gate. Unit tests supplement but never replace them.

---

## Pipeline Stages

### Stage 1: Lexer + Parser

**Input**: Source text  
**Output**: Concrete AST (with syntax sugar nodes)  
**Verification**: Parse success/failure, round-trip stability

Key rules:
- Pratt parsing for operator precedence
- Two-phase block parsing: `def` bindings → `&` mutation bindings → expressions
- All expression nodes carry `Span` for source-level error reporting

### Stage 2: Desugar

**Input**: Concrete AST  
**Output**: Core AST (sugar-free)  
**Verification**: Desugared AST is semantically equivalent to source

All syntax sugar (`&` borrow, `->` pipe, `if/else`, `{...}` update) transforms to core primitives (function application, field access, pattern match). This pass runs **before** type checking so the type checker only sees the core language.

### Stage 3: Name Resolution

**Input**: Core AST  
**Output**: Resolved AST (all variables linked to definitions)  
**Verification**: No unbound variables, no shadowing without warning

Establishes lexical scoping: what does each name refer to? Handles imports, detects shadowing, resolves self-references for recursion.

### Stage 4: Type Checker

**Input**: Resolved AST  
**Output**: Typed AST (every expression annotated with its type)  
**Verification**: Type soundness — well-typed programs do not go wrong

Implementation approach: Hindley-Milner type inference with affine type checking.

- HM handles: parametric polymorphism, let-generalization
- Affine handles: use-at-most-once checking for `#[Affine]` types
- Closure Resource inference: captures determine Normal (Fn) vs Affine (FnOnce)

### Stage 5: Strictness Analysis

**Input**: Typed AST  
**Output**: AST with strict/lazy context annotations  
**Verification**: Every expression classified; no cycle escapes detection

Classifies each expression context:
- Strict: arithmetic operands, if conditions, match scrutinees
- Lazy: function arguments, let bindings (by default)

### Stage 6: IR Generation

**Input**: Typed + annotated AST  
**Output**: Thunk Graph IR Module  
**Verification**: All language features lowered; no AST nodes remain

Key responsibilities:
- Lowers expressions to SSA-style instructions
- Inserts ThunkAlloc/Force/Update for lazy evaluation
- Creates closure representations for function values
- Handles recursive self-reference (Var → Ref label)

### Stage 7: Evaluation

**Input**: IR Module  
**Output**: Runtime value (or diagnostic)  
**Verification**: Correct result for example programs

The evaluator is both:
- A reference implementation proving the IR is executable
- A debugging tool for verifying compiler correctness

---

## Module Architecture

### Design Principle: Stage-as-Module

Each pipeline stage is one Rust module. The module exposes:

- **One public entry point** (a function taking input representation, returning output representation or diagnostics)
- **One public output type** (the intermediate representation for the next stage)
- **Internal helpers** (private functions, not leaked to other modules)

```rust
// Example: strictness.rs
pub fn classify(expr: &Expr, context: Strictness) -> Strictness;
```

### Dependency Rules

```
Leaf modules (no deps):
  ast.rs, diagnostics.rs

Stage modules (depend on leaf + previous stage output):
  parser.rs     → ast.rs, diagnostics.rs
  strictness.rs → ast.rs
  typeck.rs     → ast.rs, diagnostics.rs
  ir_gen.rs     → ast.rs, ir.rs, strictness.rs
  eval.rs       → ir.rs, value.rs, diagnostics.rs

Top-level:
  main.rs       → parser, ir_gen, eval, diagnostics
  lsp.rs        → parser, diagnostics
  lib.rs        → all modules (declaration only)
```

A module must never depend on a module that appears **after** it in the pipeline. `parser.rs` must not depend on `eval.rs`.

### File Size Limit

- Target: **<300 lines** per module
- Hard limit: **500 lines**
- If a module exceeds 500 lines, split by concern:
  - `ir.rs` → `ir/types.rs` + `ir/instr.rs` + `ir/display.rs`
  - `eval.rs` → `eval/runtime.rs` + `eval/walk.rs`

### Interface Stability

- Public types are the API between stages. Changing a public type is a pipeline-wide change.
- Internal types (helpers, intermediate representations) are free to change.
- Before changing a public type, check all downstream consumers.

---

## Testing Strategy: Four Tiers

Every compiler feature is tested at four granularity levels. Tests are cumulative — tier N implies all lower tiers pass.

### Tier 1: Unit Tests

**Scope**: Single function, single pass behavior.  
**Location**: `#[cfg(test)] mod tests` within the source file.  
**Target count**: 1–3 per public function, more for functions with branching logic.

**Examples**:
```rust
// in strictness.rs
#[test]
fn classify_if_condition_is_strict() {
    let expr = parse_expr("if x { 1 } else { 2 }").unwrap();
    assert_eq!(classify(&expr, Strictness::Lazy), Strictness::Lazy);
    // Internal: verify cond was classified as Strict
}

#[test]
fn classify_let_body_follows_context() { .. }

#[test]
fn classify_app_is_strict() { .. }
```

**Purpose**: Catches logic errors at the finest granularity. Fast (<1ms each). Run on every `cargo test`.

### Tier 2: Single-Feature Integration

**Scope**: One language feature through 2+ pipeline stages.  
**Location**: `examples/pass/` and `examples/fail/`.  
**Target count**: 1–2 per language feature.

**Examples**:
```dew
// examples/pass/arithmetic.dew — tests literals + binary ops + main
def main = fn -> Int { 40 + 2 }

// examples/pass/if_else.dew — tests if/else branching
def main = fn -> Int { if true { 1 } else { 0 } }

// examples/fail/unbound_var.dew — tests name resolution error
def main = fn -> Int { x }
```

**Purpose**: Verifies that a single feature works end-to-end from source to result. Serves as both test and documentation.

### Tier 3: Feature Interaction

**Scope**: Two or more features interacting.  
**Location**: `examples/pass/` and `examples/fail/` with descriptive names.  
**Target count**: 1 per major feature pair that interacts.

**Examples**:
```dew
// examples/pass/affine_in_closure.dew — affine + closure
#[Affine]
struct Affine(T) { data: T }
def main = fn -> Int {
  def x = Affine(42);
  def f = fn { x };  // closure captures affine value (FnOnce)
  f().data
}

// examples/pass/lazy_affine.dew — lazy eval + affine
// examples/pass/struct_match.dew — struct + match
// examples/pass/recursive_closure.dew — recursion + closure
```

**Purpose**: Catches interaction bugs — the most common and subtle class of compiler errors.

### Tier 4: Small Programs

**Scope**: Multi-feature, multi-definition programs solving a real problem.  
**Location**: `examples/pass/complex/`.  
**Target count**: 5–10 programs covering typical use cases.

**Examples**:
```dew
// examples/pass/complex/fibonacci.dew — recursion + if + arithmetic
// examples/pass/complex/fizzbuzz.dew — recursion + if + string + IO
// examples/pass/complex/ackermann.dew — deep recursion + arithmetic
// examples/pass/complex/point_algebra.dew — struct + function composition
```

**Purpose**: Stress-tests the full pipeline on representative workloads. These are the programs the user would actually write. They are also the primary manual review targets.

### Test Execution

```bash
# All tiers
cargo test                          # Tier 1
cargo run -- examples/pass/*.dew    # Tiers 2-4
```

### Writing New Tests

When implementing a new feature:

1. Write a **Tier 2** example first (the user scenario)
2. Implement the feature
3. If the feature is complex, add **Tier 1** unit tests for internal logic
4. If the feature interacts with existing features, add a **Tier 3** example
5. Periodically add **Tier 4** programs as the language matures

---

## IR Design Rules

### Primitive Budget

Every new IR primitive must justify itself against all existing primitives. Ask: can this be expressed as a combination of existing primitives? If yes, add it as a **pass** (transformation on existing IR), not a new **primitive**.

### Text Format

IR text format is 2-space indent, SSA-style:
```
%tn = instr arg1, arg2
```

Display implementation must be co-located with type definitions. New instructions → new Display logic in the same file.

### Serialization

All IR types derive `Serialize` + `Deserialize` for JSON emission. The JSON format is a tooling interface, not a human interface. Text format is for humans.

---

## Verification Standards

### Before Commit

1. `cargo build` — zero errors
2. `cargo test` — all pass (existing failures acceptable only if documented as pre-existing)
3. `cargo run -- examples/*.dew` — all examples produce expected output
4. No `as any`, `@ts-ignore`, `unwrap()` without context in new code

### After Implementation

1. Write at least one end-to-end test (`examples/` or test function)
2. Document the feature in-language (what syntax, what semantics)
3. Update this methodology document if new patterns emerge

### Diagnostics

Errors must include:
- Error code: `[E###]` for errors, `[W###]` for warnings
- Source location (Span): file, line, column
- Human-readable message describing what went wrong
- (Future) Suggestion for how to fix

---

## Optimization Policy

1. **Correctness first, speed second.** Never sacrifice correctness for performance.
2. **Prove the optimization is needed** before implementing it. Use real programs (not microbenchmarks) as evidence.
3. **Optimizations operate on IR**, never on AST.
4. **Divide optimizations into levels**: O0 (none), O1 (safe: strict-defs, fn-defs), O2 (aggressive: future).

---

## Anti-Patterns

| Anti-Pattern | Why It Fails | Correct Approach |
|-------------|-------------|-----------------|
| Mixing passes | One module doing parsing + type checking + IR gen | Single responsibility per module |
| Silent failure | Errors swallowed, empty output returned | Propagate errors to DiagnosticCollector |
| Hardcoded examples in compiler logic | Compiler works only for known programs | Generalize rules; never special-case |
| Type errors at runtime | Affine violation caught at eval, not typeck | Catch at earliest possible stage |
| Copying code between passes | Duplicated type definitions, logic | Share through defined interfaces |
| Skipping the desugar pass | Sugar semantics scattered across typeck/IR gen | Consolidate all sugar in one pass |
