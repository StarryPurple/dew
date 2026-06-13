# Dew — Project Root

A Rust-implemented compiler + evaluator for Dew, a minimal functional language with affine type system, implicit lazy evaluation, and structured diagnostics.

## Build & Run

```bash
cargo build
cargo run -- examples/arithmetic.dew          # compile + evaluate
cargo run -- examples/arithmetic.dew --emit=text  # print IR
dew lsp                                       # start LSP server
```

## Architecture Pipeline

```
Source ──► Parser ──► HM Type Checker (WIP) ──► Strictness Analysis ──► IR Gen
                                                     │
                                                     ▼
                                          Thunk Graph IR ──► Evaluator (3-state FSM)
                                                     │
                                                     ▼
                                             Diagnostics (stderr, JSON)
```

## Module Map

| File | Responsibility |
|------|---------------|
| `ast.rs` | Source AST types (Expr, Pattern, Type, Decl) |
| `parser.rs` | Lexer + recursive descent parser |
| `types.rs` | Type system (Ty, Affinity) |
| `typeck.rs` | HM type inference (skeleton) |
| `ir.rs` | Thunk Graph IR (6 node primitives) |
| `ir_gen.rs` | AST → IR compilation |
| `strictness.rs` | Strict/Lazy context classification |
| `eval.rs` | Evaluator with lazy thunk runtime (3-state FSM) |
| `value.rs` | Runtime values (Value, Env) |
| `diagnostics.rs` | Diagnostic collector with [E###]/[W###] codes |
| `lsp.rs` | LSP server (JSON-RPC over stdio) |
| `main.rs` | CLI (clap: run, lsp, --emit) |

## Key Design Rules

1. **Closure affinity is inferred**: captures affine variable → FnOnce; pure → Fn (unrestricted)
2. **Laziness is implicit**: compiler inserts Suspend/Force via strictness analysis
3. **Thunk Graph IR**: flat, label-based with 6 primitives (ThunkAlloc, ThunkDef, Force, Update, Blackhole, Def)
4. **Recursion via thunk self-reference**: the IR gen converts recursive `Var(name)` to `Ref(label)` within def body
5. **Struct construction = function application**: `Name(args...)` produces `Apply` IR node
6. **Main validation**: exactly one `def main = fn() -> Int { body }` with Int return (exit code)
7. **Testing is example-driven**: `cargo run -- examples/<name>.dew`
8. **2-space indent**: both IR text format and Dew source code

## Error Codes

- `[E001]` file/system errors
- `[E002]` parse errors
- `[E###]` general errors (sequential)
- `[W###]` warnings (sequential)

## Dependencies

- `clap` 4 (derive) — CLI
- `serde` + `serde_json` — LSP serialization
- `ariadne` — fancy error reporting (declared)

## Design Document

See `docs/book/` (English) and `docs/book-zh/` (Chinese) for the full language specification.
