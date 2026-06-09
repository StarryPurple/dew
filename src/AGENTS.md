# Dew — src/ Compiler Source

All compiler and evaluator implementation lives here. 13 Rust source files organized as a library + CLI binary.

## Module Dependency Graph

```
main.rs  (CLI, orchestrates pipeline)
  ├── parser      (lexer + recursive descent)
  ├── typeck      (affine type checker) ──── diagnostics
  │     ├── types
  │     └── ast
  ├── ir_gen      (AST→IR, strictness insertion) ──── strictness
  │     ├── ir
  │     └── ast
  ├── lower       (Tree IR→Flat IR) ──── flat_ir
  │     └── ir
  ├── eval        (evaluator + thunk runtime) ──── diagnostics
  │     ├── ir
  │     └── value
  └── diagnostics (collector → JSON report)

lib.rs (re-exports all modules)
```

## Key Types

| Type | File | Description |
|------|------|-------------|
| `Expr` | `ast.rs` | 18-variant source AST |
| `Type` | `types.rs` | Int, Bool, Unit, Box(T), Fun, List(T) |
| `Affinity` | `types.rs` | Normal vs Affine |
| `Context` | `strictness.rs` | Strict vs Lazy evaluation context |
| `Ir` | `ir.rs` | 19-variant tree IR (includes Suspend/Force) |
| `Module` | `flat_ir.rs` | Flat IR container (Vec of Functions) |
| `Op` | `flat_ir.rs` | 19 flat operations |
| `Value` | `value.rs` | Runtime values (Int, Bool, Closure, Box, Nil, Cons, Thunk) |
| `ThunkState` | `eval.rs` | 3-state FSM: Unevaluated→Evaluating→Evaluated |
| `TypeError` | `typeck.rs` | 13 error variants |
| `DiagnosticCollector` | `diagnostics.rs` | Mutable collector for affine, thunk, closure stats |

## Module Details

### `parser.rs` (497 lines)
Hand-written lexer + recursive descent. Token enum has 30+ variants. Uses precedence climbing: comp → term → factor → app → primary. Parser struct has `peek()`, `advance()`, `expect()`.

### `typeck.rs` (552 lines)
Core of the type system. `Ctx` tracks variables with `HashMap<String, (Type, bool)>` where bool = consumed status for affine vars. Key methods:
- `use_var()`: marks affine consumed on first use, errors on second
- `consumed()`: explicit consumption (unbox, closure capture)
- `leaked_affine()`: returns unconsumed affine vars

If-branch merging: both branches must consume the same affine vars (`BranchMismatch` error). Main validator finds exactly one `def main = fn () { ... }` producing `Int`.

### `ir_gen.rs` (180 lines)
`adjust_context()` is the core of implicit laziness:
- Inserts `Force` when Strict context meets naturally-lazy IR
- Inserts `Suspend` when Lazy context meets naturally-strict IR
- Cons head is Strict, Cons tail is **always Lazy** (explicit Suspend wrapper)

### `strictness.rs` (53 lines)
Classifies each IR node as naturally-strict (Lit, BinOp, Force, Dealloc, Head, Tail, IsNil, Nil, Bool, Unit) or naturally-lazy (everything else). Context propagation rules encoded in `classify()`.

### `eval.rs` (290 lines)
Environment-based evaluator. Thunk runtime uses a global `HashMap<ThunkId, ThunkState>`. The 3-state FSM detects circular dependencies. Memoization: forced multiple times returns cached result. `Fix` creates self-referential thunks.

### `lower.rs` (386 lines)
Tree IR → Flat IR. Uses continuation-passing style. Maintains mutable `LowerCtx` with fresh name generators for temps (%t0...), functions (@f0...), and blocks (L0, B0...). Lam→Closure, Suspend→Thunk, If→basic blocks with Join.

### `diagnostics.rs` (186 lines)
Rich struct hierarchy. Tracks: affine violations/leaks, closure classifications (Fn/FnOnce), thunk stats (created/forced/never-forced/forced-multiple-times), capture statistics. `finalize()` computes derived stats. `to_json()` serializes.

## Adding Features

When adding features, follow this order:
1. Update `ast.rs` for new AST nodes
2. Update `parser.rs` for new syntax
3. Update `types.rs` for new types if needed
4. Update `typeck.rs` for new type rules
5. Update `ir.rs` for new IR nodes
6. Update `ir_gen.rs` for AST→IR compilation
7. Update `eval.rs` for new evaluation semantics
8. Update `diagnostics.rs` if new diagnostics needed
9. Update `docs/book/` for documentation
10. Add example `.dew` files
