# Introduction

Dew is a purely functional, statically-typed programming language with **implicit lazy evaluation**, **affine types**, and **first-class closures**. It is implemented as a single-pass compiler + evaluator written in Rust.

## Hello, Dew

```dew
{{#include ../../examples/arithmetic.dew}}
```

Save this as `hello.dew` and run:

```bash
cargo run -- hello.dew
# => 42
```

The program defines `main` as a function returning `Int`. The expression `40 + 2` is evaluated, and its value becomes the process exit code.

## Language Philosophy

Dew is designed around four core principles:

### 1. Immutability

All values are immutable. Once bound, a value cannot be mutated in-place. Instead of assignment, Dew uses `def` bindings to introduce new names.

```dew
def x = 5;      // bind x to 5
def y = x + 3;  // bind y to x + 3 (8)
// x is still 5 — values never change
```

### 2. Implicit Lazy Evaluation

Dew evaluates expressions **lazily by default**. The compiler performs strictness analysis to determine which expressions truly need evaluation and which can be suspended. Programmers never annotate laziness — the compiler inserts `Suspend` and `Force` operations automatically.

```dew
def expensive = heavy_computation();  // NOT evaluated here — suspended
expensive + 1                         // forced here, when actually needed
```

See the [Laziness](laziness.md) chapter for the full mechanism.

### 3. Affine Resource Types

Dew tracks **resource affinity** at compile time. Values are classified as:

- **Normal** — baseline, no restriction (integers, booleans, characters, pure structs)
- **Affine** — used at most once (boxed values, linear resources)
- **Persistent** — reference-counted (lists, maps)

Using an affine value more than once is a compile-time error. See [Affine Types](affine.md).

### 4. First-Class Closures

Functions are values. They capture their environment by value and can be passed to other functions, stored in data structures, and returned.

```dew
def apply_twice = fn(f: Int -> Int, x: Int) -> Int { f(f(x)) }
```

Closure affinity is inferred automatically: capturing an affine variable produces `FnOnce`; pure captures produce unrestricted `Fn`.

## A Quick Tour

Here is a program demonstrating several Dew features at once:

```dew
// Struct definition
struct Point { x: Int, y: Int }

// Recursive function
def dist_sq = fn(p: Point) -> Int {
  p.x * p.x + p.y * p.y
}

// Match expression
def abs = fn(n: Int) -> Int {
  match n < 0 {
    true => 0 - n,
    false => n,
  }
}

// Higher-order function
def apply5 = fn(f: Int -> Int) -> Int { f(5) }

// Entry point
def main = fn -> Int {
  def p = Point(3, 4);
  dist_sq(p) -> Stdout;   // print via pipe
  apply5(fn(x) { x + 1 }) // returns 6
}
```

## Key Concepts

| Concept | Description |
|---------|-------------|
| **`def`** | Top-level and local bindings (immutable) |
| **`fn`** | Anonymous function expressions |
| **`struct`** | Named record types with positional fields |
| **`enum`** | Tagged union types with optional payloads |
| **`match`** | Pattern-matching expression with exhaustiveness |
| **`if`/`else`** | Conditional expression (not statement) |
| **`->`** | Pipe operator for I/O and forward application |
| **`force`** | Explicit strict evaluation (rarely needed) |
| **`fix`** | Explicit fixed-point recursion combinator |
| **`import`** | Module import from external Dew files |

## Design Document

For the formal specification, see the [`docs/`](../) directory containing both English and Chinese versions of the language book. The current document is the English edition covering all implemented features as of version 0.1.0.

## Next Steps

- [**Types**](types.md) — learn about the primitive and compound type system
- [**Functions**](functions.md) — closures, recursion, higher-order patterns
- [**Control Flow**](control-flow.md) — `if`, `match`, blocks, and the pipe operator
