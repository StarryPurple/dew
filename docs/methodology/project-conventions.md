# Project Conventions

This document defines engineering conventions for the Dew project. It covers repository structure, naming, commits, documentation, and examples. These rules apply to all contributions — code, docs, and tests.

---

## Repository Structure

```
dew/
├── AGENTS.md                  # Root entry: methodology index + top-level constraints
├── Cargo.toml                 # Rust project manifest
├── docs/
│   ├── design/                # Language specification (per-feature design docs)
│   ├── methodology/           # Development methodology (this directory)
│   │   ├── language-design.md
│   │   ├── compiler-engineering.md
│   │   └── project-conventions.md
│   └── book/                  # User-facing language documentation (mdBook)
├── examples/                  # End-to-end test programs (*.dew)
│   ├── pass/                  # Programs that should compile and run
│   └── fail/                  # Programs that should produce compile errors
├── src/                       # Compiler source code
│   ├── main.rs                # CLI entry point
│   ├── lib.rs                 # Library root (module declarations)
│   ├── ast.rs                 # AST types
│   ├── parser.rs              # Lexer + parser
│   ├── typeck.rs              # Type checker
│   ├── strictness.rs          # Strictness analysis
│   ├── ir.rs                  # IR types
│   ├── ir_gen.rs              # AST → IR compilation
│   ├── eval.rs                # Evaluator
│   ├── value.rs               # Runtime values
│   ├── diagnostics.rs         # Diagnostic collector
│   └── lsp.rs                 # LSP server
├── stdlib/                    # Standard library (*.dew)
└── tools/                     # Development scripts and utilities
```

**Rules**:
- One Rust module per compiler stage — no multi-thousand-line files
- `lib.rs` is the module index, nothing else
- `main.rs` is CLI dispatch, no compiler logic

---

## Formatting

- **Dew source code**: 2-space indentation, no tabs
- **Dew IR text output**: 2-space indentation, no tabs
- **Rust source code**: `cargo fmt` (standard Rust formatting)

> 2-space indent for Dew and IR is chosen because IR text output mirrors source — they share a visual grammar. The consistency makes it easier to visually correlate source expressions with their IR counterparts during debugging. No strong PL-theoretic reason; it's an ergonomic choice that became a hard rule after being validated across all existing examples.

---

## Naming

### Rust Code

- Modules: `snake_case` matching pipeline stage (`parser.rs`, `typeck.rs`)
- Types: `PascalCase` (`Expr`, `BasicBlock`, `DiagnosticCollector`)
- Functions: `snake_case` (`parse_program`, `compile_decl`, `force_thunk`)
- Tests: descriptive `snake_case` describing the scenario

### Dew Language

- Keywords: lowercase (`def`, `fn`, `struct`, `enum`, `match`, `if`, `else`)
- Types: PascalCase (`Int`, `Bool`, `Point`, `Option`)
- Variables/functions: `snake_case` (`factorial`, `main`, `point_x`)
- Attributes: `#[PascalCase]` (`#[Affine]`)

---

## Commits

- Commit messages in English
- Format: `area: concise description`
- Examples: `parser: add Pratt precedence for pipeline operator`, `ir: add ThunkDef display impl`
- One logical change per commit
- Commit after verified working state, not speculatively

---

## Documentation

### Language Docs

- User-facing docs in `docs/book/` (mdBook format)
- English primary, Chinese optional
- Every feature gets: syntax, semantics, examples, interaction with lazy/affine/closure

### Design Docs

- Design proposals in `docs/design/`
- Must follow the [output conventions](language-design.md#output-conventions)
- Must include confidence label (High/Medium/Low)
- Must list alternatives considered

### Code Comments

- Document **why**, not what
- Every public API item gets a doc comment (`///`)

---

## Examples

Examples are the primary testing and documentation mechanism. See [Compiler Engineering — Testing Strategy](compiler-engineering.md#testing-strategy-four-tiers) for the four-tier system.

### Structure

```
examples/
├── pass/              # Should compile and produce expected output (Tiers 2-3)
│   ├── arithmetic.dew           # 40 + 2
│   ├── factorial.dew            # fact(5) = 120
│   ├── affine_consume.dew       # affine field access
│   ├── affine_in_closure.dew    # affine + closure interaction (Tier 3)
│   ├── complex/                 # Small programs (Tier 4)
│   │   ├── fibonacci.dew
│   │   ├── fizzbuzz.dew
│   │   └── ackermann.dew
│   └── functions/
│       └── hof.dew
└── fail/              # Should produce compile errors
    ├── unbound_var.dew          # use of undefined variable
    ├── affine_double.dew        # use-after-consume
    └── not_a_function.dew       # type error: non-function application
```

### Rules

- Each example is a self-contained `.dew` file
- `pass/` examples: first line comment describes expected output
- `fail/` examples: first line comment describes expected error
- Test command: `cargo run -- examples/pass/arithmetic.dew`
- Every new feature must include at least one `pass/` example and one `fail/` example if applicable

---

## Toolchain

### Build

```bash
cargo build
cargo test
```

### Run a Dew program

```bash
cargo run -- examples/pass/factorial.dew          # evaluate
cargo run -- examples/pass/factorial.dew --emit=text  # print IR
```

### LSP

```bash
dew lsp
```

---

## Dependencies Policy

- Minimize external dependencies (current: `clap`, `serde`, `serde_json`, `ariadne`)
- Before adding a dependency: can this be implemented in <100 lines?
- No proc macros, no code generation frameworks, no build.rs complexity
- Standard library preferred over external crates

---

## Anti-Patterns

| Anti-Pattern | Why It Fails | Correct Approach |
|-------------|-------------|-----------------|
| Giant files | 1000+ line files are unreadable | Split by responsibility |
| Commenting out tests | Hides failures instead of fixing them | Fix or mark as `#[ignore]` with reason |
| `unwrap()` in production paths | Panics crash the LSP, not just CLI | Use `Result` + diagnostic |
| Magic numbers in compiler | Thresholds without names or reasons | Named constants with comments |
| Untracked generated files | Committed build artifacts bloat the repo | `.gitignore` for `/target`, `*.exe`, etc. |
