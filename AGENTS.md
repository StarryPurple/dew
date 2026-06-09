# Dew — Project Root

A Rust-implemented compiler + evaluator for a minimal functional language with affine type system, implicit lazy evaluation, and structured diagnostics.

## Build & Run

```bash
cargo build
cargo run -- examples/<name>.dew              # JSON IR + result + diagnostics
cargo run -- examples/<name>.dew --emit=text  # Pretty-printed text IR
cargo run -- examples/<name>.dew --emit=flat  # Flat SSA-like IR
cargo run -- examples/<name>.dew --trace      # Step-by-step evaluation trace
```

## Architecture Pipeline

```
Source ──► Parser ──► Affine Type Checker ──► Strictness Analysis ──► IR Gen
                                                      │
                                                      ▼
                                           JSON/Text IR ──► Evaluator + Thunk Runtime
                                                      │
                                                      ▼
                                              Diagnostics (JSON, stderr)
```

## Module Map

| File | Responsibility |
|------|---------------|
| `ast.rs` | Source AST types (Expr enum, 18 variants) |
| `parser.rs` | Lexer + recursive descent parser |
| `types.rs` | Type system (Int, Bool, Unit, Box, Fun, List, Affinity) |
| `typeck.rs` | Affine type checker with capture-based closure affinity |
| `ir.rs` | Tree IR definition, Display, Serialize |
| `ir_gen.rs` | AST → IR compilation with strictness Suspend/Force insertion |
| `strictness.rs` | Strict/Lazy context classification |
| `flat_ir.rs` | Flat SSA-like IR (Module, Function, BasicBlock, Op) |
| `lower.rs` | Tree IR → Flat IR lowering pass |
| `eval.rs` | Evaluator with lazy thunk runtime (3-state FSM) |
| `value.rs` | Runtime values (Value enum, Env type) |
| `diagnostics.rs` | Diagnostic collector → JSON report |
| `main.rs` | CLI entry point (clap) |
| `lib.rs` | Module root (declares all modules) |

## Key Design Rules (must follow)

1. **Closure affinity is inferred, not annotated**: a closure is FnOnce iff it captures any affine variable. Pure closures are Fn (unrestricted).
2. **Laziness is implicit**: the compiler inserts `Suspend`/`Force` via strictness analysis. The user never writes `lazy` or `force`.
3. **Cons tail is always suspended**: even if the tail expression is naturally lazy, IR gen wraps it in `Suspend`.
4. **All implementation details must be recorded in `docs/book/`**. When adding features, update the corresponding `.md` file.
5. **No polymorphism**: types are monomorphic. Nil gets placeholder `List(Int)`.
6. **Testing is example-driven**: no unit tests. Use `cargo run -- examples/<name>.dew` for verification.
7. **Main validation**: exactly one `def main = fn () { body }` with `Int` return.

## Code Conventions

- Rust 2024 edition
- No `unsafe` code
- `Display` impls for pretty-printing; `Serialize` for JSON output
- Error handling via `DiagnosticCollector` threaded through typeck and eval
- Use `anyhow`-style patterns (TypeError, etc.) but the project uses custom error enums

## Dependencies

- `clap` 4 (derive) — CLI
- `serde` + `serde_json` — serialization
- `ariadne` — fancy error reporting (declared, not yet used)
