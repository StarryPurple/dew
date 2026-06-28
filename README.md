# Dew

A pure functional, statically-typed programming language with **lazy evaluation**, **affine types**, and **closures**.

## Usage

```
dew <file>                   # Compile and evaluate a .dew program
dew <file> --emit=text       # Print the Thunk Graph IR
dew <file> --emit=json       # Print the IR as JSON
dew <file> --emit=desugared  # Print desugared AST
dew <file> --opt=0|1         # Optimization level (default: 0)
dew lsp                      # Start Language Server Protocol server
```

### Examples

```bash
# Run a program
dew examples/pass/basics/arithmetic.dew
# Output: 42

# Inspect the intermediate representation
dew examples/pass/basics/arithmetic.dew --emit=text
```

### Test Suite

```bash
# Run all e2e tests (pass + fail)
bash tools/test_runner.sh

# Run unit tests
cargo test
```

## Compiler Pipeline

```
Source → Parser → Desugar → NameRes → TypeCheck → Strictness → IR Gen → Eval
```

### Backends

| Backend | Command | Status |
|---------|---------|--------|
| Tree-Walking Evaluator | `dew <file>` | ✅ Complete |
| LLVM IR | (in development) | 🔶 Rewrite in progress |

## Language Specification

See [`docs/design/dew-lang.md`](docs/design/dew-lang.md) for the complete language specification.

## Test Coverage

```
155 e2e — all green
