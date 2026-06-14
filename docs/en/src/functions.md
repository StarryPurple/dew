# Functions

Functions are the central abstraction in Dew. They are first-class values, capture their environment by value, and support recursion, partial application, and higher-order patterns.

## Defining Functions

### Top-Level Definitions (`def`)

Every named binding in Dew uses `def`:

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
```

The general form is:

```
def name = expression
```

The expression can be any value, but producing a function is the most common case.

### Anonymous Functions (`fn`)

The `fn` keyword creates an anonymous function value:

```
fn(params...) -> RetType { body }
```

Parameters are written as `name: Type` pairs separated by commas. The return type annotation is optional — if omitted, it is inferred.

```dew
// With explicit return type
def inc = fn(x: Int) -> Int { x + 1 }

// Inferred return type
def id = fn(x: Int) { x }

// Multi-parameter
def hypot = fn(a: Int, b: Int) -> Int { a * b }
```

### Closures

Functions capture their environment by value. The captured variables become part of the closure:

```dew
def make_adder = fn(n: Int) -> Int -> Int {
  fn(x: Int) -> Int { x + n }  // captures n by value
}
def add_5 = make_adder(5);
add_5(10)  // 15
```

**Closure affinity** is inferred automatically. If a closure captures an affine variable, it is marked `FnOnce`; otherwise, it is unrestricted `Fn`.

## Calling Functions

Function application uses juxtaposition — write the function followed by its arguments:

```dew
inc(5)          // 6
add(3, 4)       // 7
hypot(3, 4)     // 12
```

Arguments are separated by commas. This is syntactic sugar for the `App` AST node.

### Partial Application

Dew supports partial application naturally. A function with multiple parameters can be called with fewer arguments, producing a new function:

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
def add_3 = add(3);    // fn(y: Int) -> Int { 3 + y }
add_3(7)                // 10
```

## Recursion

Dew supports direct recursion through self-reference in `def` bodies. Inside a function definition, the function's own name refers to itself:

```dew
{{#include ../../../examples/factorial.dew}}
```

For mutual recursion or more complex recursive patterns, use the `fix` combinator:

```
fix name { body }
```

The `fix` combinator makes `name` available as a self-reference within `body`, implementing the standard fixed-point operator.

### How Recursion Works Internally

The IR generator detects self-references during compilation. When a `Var(name)` expression appears inside a `def` block where `name` matches the current definition, the compiler converts it to a `Ref(label)` node pointing to the thunk's own label. This enables the evaluator's 3-state FSM to handle recursion without infinite loops.

## Higher-Order Functions

Functions can accept other functions as arguments and return functions as results:

```dew
{{#include ../../../examples/functions/hof.dew}}
```

Common higher-order patterns:

```dew
// Map-like: apply function to argument
def apply_to = fn(f: Int -> Int, x: Int) -> Int { f(x) }

// Compose: apply g after f
def compose = fn(f: Int -> Int, g: Int -> Int) -> Int -> Int {
  fn(x: Int) -> Int { g(f(x)) }
}
```

## The Pipe Operator (`->`)

The pipe operator `->` feeds the left-hand expression as an argument to the right-hand function:

```dew
expr -> func
// equivalent to: func(expr)
```

This is especially useful for chaining operations and for I/O:

```dew
42 -> Stdout;          // print 42
a + b -> Stdout;        // print sum of a and b
some_value -> process;  // equivalent to process(some_value)
```

The pipe is left-associative and has the lowest precedence of all binary operators. See [Input/Output](io.md) for I/O-specific pipe usage.

## Built-in Functions

Dew provides a few built-in function-like values in the initial environment:

| Name | Type | Description |
|------|------|-------------|
| `Stdin` | builtin | Reads an integer from stdin |
| `Stdout` | builtin | Prints a value to stdout |
| `not` | builtin | Boolean negation: `not(true)` → `false` |

These are not ordinary functions — they are recognized by the evaluator as special builtin values and dispatched accordingly.

## AST Representation

Functions in the parsed AST are represented by two node types:

- **`Fn`**: Anonymous function expression with parameters, optional return type, and body
- **`Fix`**: Fixed-point combinator for explicit recursion `fix name { body }`

During IR generation, `Fn` becomes `Ir::Lambda` and `Fix` becomes `Ir::Fix`.

## Next

- [**Control Flow**](control-flow.md) — `if`, `match`, blocks, and pipes
