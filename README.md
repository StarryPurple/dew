# Dew

A pure functional, statically-typed programming language with **lazy evaluation**, **affine types**, and **closures**.

## Usage

```
dew <file>                   # Compile and evaluate a .dew program
dew <file> --emit=text       # Print the Thunk Graph IR
dew <file> --emit=json       # Print the IR as JSON
dew <file> --emit=llvm       # Print LLVM IR translation
dew <file> --backend=llvm    # Compile LLVM IR via clang and execute
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

# Generate LLVM IR
dew examples/pass/basics/arithmetic.dew --backend=llvm
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
                                                                      ↘ LLVM IR
```

### Backends

| Backend | Command | Status |
|---------|---------|--------|
| Tree-Walking Evaluator | `dew <file>` | ✅ Complete |
| LLVM IR Print | `dew <file> --emit=llvm` | ✅ All 30+ instructions |
| LLVM Compile+Run | `dew <file> --backend=llvm` | ✅ Basic programs (req. clang) |

## Language Specification

See [`docs/design/dew-lang.md`](docs/design/dew-lang.md) for the complete language specification.

## Test Coverage

```
126 e2e + 61 unit — all green
54 Small / 46 Medium / 5 Large (three-tier)
```
