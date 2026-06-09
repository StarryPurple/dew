# Introduction

Dew is a minimal functional programming language designed to explore three ideas:

1. **Affine type systems** — tracking resource usage at compile time
2. **Implicit lazy evaluation** — thunks created and forced automatically
3. **Diagnostics** — visibility into what the runtime is doing

## Design Philosophy

- **Minimal core**: integers, booleans, unit, functions, and linear boxes
- **No explicit laziness**: the compiler inserts `suspend`/`force` via strictness analysis
- **Honest types**: the type tells you how a value can be used — at most once (affine) or freely
- **Diagnostics-first**: every allocation, force, capture, and leak is tracked and reported

## Quick Example

```dew
# Allocate a linear box, extract its value
def b = box(42);
def n = unbox(b);    # consumes b
n + 1                # → 43
```

Boxes are affine resources — `unbox` consumes them. Forget to `unbox`, and the compiler reports a resource leak. `unbox` twice, and you get an affine violation.

## Running Dew

```bash
cargo run -- examples/box_ok.dew        # Run with JSON IR + diagnostics
cargo run -- examples/box_ok.dew --emit=text  # Pretty-printed IR
cargo run -- examples/box_ok.dew --trace      # Evaluation step trace
```
