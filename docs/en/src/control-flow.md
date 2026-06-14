# Control Flow

Dew provides expression-based control flow. Every control construct produces a value.

## `if` / `else` Expressions

The `if` expression evaluates a condition (which must be `Bool`) and selects one of two branches:

```dew
if condition { then_expr } else { else_expr }
```

Each branch is a block expression. The `else` clause is optional — if omitted, it defaults to `Unit`:

```dew
def main = fn -> Int {
  if 10 < 20 { 99 } else { 0 }   // returns 99
}
```

`if` expressions can be chained (else-if):

```dew
def sign = fn(n: Int) -> Int {
  if n > 0 { 1 }
  else {
    if n < 0 { -1 }
    else { 0 }
  }
}
```

### Strictness

The condition is always evaluated strictly. The branches are evaluated in the ambient context (lazy if the result is not immediately demanded).

## `match` Expressions

Pattern matching is the primary way to destructure values and branch on structure:

```dew
match scrutinee {
  pattern1 => body1,
  pattern2 => body2,
}
```

### Boolean Matching

The simplest use matches on `Bool`:

```dew
{{#include ../../../examples/match_expr.dew}}
```

### Integer Literal Matching

Match on specific integer values:

```dew
{{#include ../../../examples/complex/fizzbuzz.dew}}
```

### Pattern Variables

Patterns can bind variables. A variable pattern matches any value and binds it to a name:

```dew
def describe = fn(n: Int) -> Int {
  match n {
    0 => 0,
    n => n,  // binds n (shadows outer n in this arm)
  }
}
```

### Wildcard Pattern

The underscore `_` matches any value and discards it:

```dew
match x {
  0 => "zero",
  _ => "non-zero",
}
```

### Struct Patterns

Destructure struct values by field position:

```dew
struct Point { x: Int, y: Int }
match p {
  Point(x, y) => x + y,
}
```

### Enum Patterns

Match on enum variants:

```dew
enum Option { Some(Int), None }
match opt {
  Some(val) => val,
  None => 0,
}
```

### Tuple Patterns

Destructure tuples:

```dew
match pair {
  (x, y) => x + y,
}
```

## Blocks

Blocks `{ ... }` sequence statements and produce a final value. A block contains zero or more statement expressions terminated by `;`, optionally followed by a final expression:

```dew
{
  stmt1;
  stmt2;
  final_expression
}
```

Statements are evaluated for their side effects (I/O) and their values are discarded. The block's value is the final expression.

### Local `def` Bindings

Inside blocks, `def` creates local bindings:

```dew
{
  def x = 10;
  def y = 20;
  x + y  // 30 — this is the block's value
}
```

Each local `def` is scoped to the remainder of the block (including subsequent `def`s and the final expression). Local `def`s compile to nested `Let` IR nodes.

### Statement-Only Blocks

A block with no final expression evaluates to `Unit`:

```dew
{
  def x = 1;
  x + 1 -> Stdout;
  // no final expression → Unit
}
```

### Comparison with Top-Level `def`

Top-level `def` is parsed as a `Decl::Def` and produces a thunk in the IR module. Block-level `def` is parsed as part of the block body and produces `Let` nodes. The syntax is identical, but the semantics differ: top-level `def`s are lazy (thunked); block-level `def`s follow the ambient strictness context.

## The Pipe Operator (`->`)

The pipe operator feeds its left operand as an extra argument to the right:

```dew
left -> right
```

At the AST level, this becomes an `Expr::App` where `left` is appended to `right`'s argument list. It is syntactic sugar:

```dew
x -> f        // f(x)
x -> f(y)     // f(y, x)
x -> f(y, z)  // f(y, z, x)
```

Pipes are left-associative, enabling chaining:

```dew
input -> validate -> transform -> Stdout
```

For I/O pipes (`-> Stdin`, `-> Stdout`), see the [Input/Output](io.md) chapter.

## AST Reference

| AST Node | Dew Syntax | Description |
|----------|------------|-------------|
| `Expr::If` | `if cond { then } else { else_ }` | Conditional expression |
| `Expr::Match` | `match scrutinee { arms }` | Pattern matching |
| `Expr::Block` | `{ stmts; final }` | Statement sequence |
| `Expr::Return` | `return expr` | Early return |
| `Expr::Pipe` | `left -> right` | Forward pipe |

## Next

- [**Structs and Enums**](structs-enums.md) — data types and pattern matching
