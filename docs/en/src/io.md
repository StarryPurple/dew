# Input/Output

Dew provides a minimal I/O system through two built-in functions and the pipe operator. All I/O is side-effecting and handled at runtime by the evaluator.

## Built-in I/O Functions

| Built-in | Signature | Description |
|----------|-----------|-------------|
| `Stdin` | Reads a value from standard input | Blocks until input is available |
| `Stdout` | Writes a value to standard output | Prints followed by newline |

These are not ordinary functions — they are recognized by the evaluator as `Value::Builtin` and dispatched specially.

## Reading Input: `Stdin`

The `Stdin` builtin reads from standard input. When used via pipe, it reads a value and binds it to the piped variable:

```dew
{{#include ../../../examples/a_plus_b_stdio.dew}}
```

This program:
1. Declares `a = 0` and `b = 0` as bindings
2. Pipes `a -> Stdin` — reads an integer from stdin and binds it to `a`
3. Pipes `b -> Stdin` — reads another integer and binds it to `b`
4. Pipes `a + b -> Stdout` — prints the sum
5. Returns `0` as exit code

### How `Stdin` Works

When the evaluator encounters `Apply(Var("Stdin"), [Var("a")])`, it:
1. Reads a line from `stdin`
2. Parses it as an `i64` integer
3. Binds the result to `a` in the current environment
4. Returns the parsed integer

If the input cannot be parsed as an integer, it defaults to `0`.

### Using `Stdin` Directly

You can also call `Stdin` with an explicit argument:

```dew
def x = Stdin(0);  // reads integer, ignores argument value
```

## Writing Output: `Stdout`

The `Stdout` builtin evaluates its argument and prints it:

```dew
42 -> Stdout;            // prints: 42
a + b -> Stdout;          // prints: sum of a and b
"hello" -> Stdout;        // prints: ['h', 'e', 'l', 'l', 'o']
```

### How `Stdout` Works

When the evaluator encounters `Apply(Var("Stdout"), [arg])`:
1. Evaluates `arg` to a `Value`
2. Prints the value using its `Display` implementation
3. Flushes stdout
4. Returns `Unit`

### Value Display Formats

| Type | Output |
|------|--------|
| `Int` | `42` |
| `Bool` | `true` or `false` |
| `Char` | `'a'` |
| `Unit` | `Unit` |
| `Struct` | `Point(3, 4)` |
| `EnumVariant` | `Some(42)` |
| `Tuple` | `(1, 2, 3)` |
| `Array` | `[1, 2, 3]` |
| `Closure` | `<fn(x, y)>` |

## The Pipe Operator for I/O

The pipe operator `->` is the idiomatic way to perform I/O in Dew:

```dew
value -> Stdout;    // print value
var -> Stdin;        // read into var
```

Pipes work with any expression on the left:

```dew
expensive_computation() -> Stdout;  // evaluates, then prints
(x + y) * z -> Stdout;              // arithmetic result printed
```

## Supported I/O Types

According to the design document, I/O supports these types:

| Type | Stdin (read) | Stdout (write) |
|------|-------------|----------------|
| `Int` | ✅ | ✅ |
| `Bool` | ✅ | ✅ |
| `Char` | ✅ | ✅ |
| `Unit` | — | ✅ |
| `Array(T, N)` (T primitive) | ✅ | ✅ |
| `List(T)` (T primitive) | — | ✅ |

In the current implementation, `Stdin` reads integers and `Stdout` prints any `Value` type.

## I/O and Laziness

I/O operations are naturally **strict**: reading or writing must happen at a specific point in the program's execution. The strictness analyzer classifies function application as strict, so I/O via `-> Stdin` / `-> Stdout` is always eagerly evaluated.

However, if an I/O expression appears in a lazy context (e.g., the value of a `let` binding that is never used), it might never execute. Use `force` or ensure the I/O expression is in a strict context when you need guaranteed execution.

## I/O and Affine Types

I/O operations interact with affine types: if you read an affine value from stdin, it is consumed upon use. Writing does not consume the value (as it only borrows for display). See [Affine Types](affine.md) for details.

## AST Representation

I/O via pipe is syntactic sugar. The compiler transforms:

```
a -> Stdin   →   Stdin(a)
a -> Stdout  →   Stdout(a)
```

Both become `Expr::App { func: Var("Stdin"/"Stdout"), args: [Var("a")] }`.

## Design Notes (from `initial-design.md`)

- **Borrow-style I/O**: The design document specifies `Stdin(&v: T)` — using the `&` sugar to rebind variables. Currently, the pipe form `v -> Stdin` achieves the same effect.
- **File I/O** is planned for Phase 5 (not yet implemented).
- **No `print` function** — all output goes through `Stdout`.

## Next

- [**Affine Types**](affine.md) — resource tracking and ownership
