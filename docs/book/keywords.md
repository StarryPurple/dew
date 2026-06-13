# Keyword Reference

## Expression Keywords

| Keyword | Description | Example |
|---------|-------------|---------|
| `fn` | Lambda / function expression | `fn (x: Int) { x + 1 }`, `fn { 42 }` |
| `def` | Let binding (variable definition) | `def x = 42; x + 1` |
| `if` | Conditional expression | `if cond { 1 } else { 0 }` |
| `else` | Alternative branch of `if` | `if cond { a } else { b }` |
| `fix` | Fixed-point combinator (recursion) | `fix f: Int -> Int { ... f ... }` |
| `dup` | Duplicate a value (deep copy for Box) | `dup y = x` |
| `match` | Pattern match on ADTs | `match x { Some(v) => v, None => 0 }` |
| `type` | Define algebraic data type | `type Option = None \| Some(Int)` |
| `include` | File inclusion preprocessor | `include "stdlib/list/nth.dew"` |

## Resource Keywords (Affine Types)

| Keyword | Description | Example |
|---------|-------------|---------|
| `box` | Allocate a linear box (affine resource) | `box(42)` |
| `unbox` | Deallocate a box, consuming it | `unbox(b)` |

## List Keywords

| Keyword | Description | Example |
|---------|-------------|---------|
| `nil` | Empty list | `nil` |
| `cons` | List constructor (head, tail); tail is lazy | `cons(1, cons(2, nil))` |
| `head` | Get first element of a list | `head(xs)` |
| `tail` | Get rest of list (forces lazy tail) | `tail(xs)` |
| `isnil` | Test if list is empty | `isnil(xs)` |
| `[a, b, c]` | List literal sugar | `[1, 2, 3]` |

## Literal Keywords

| Keyword | Type | Description |
|---------|------|-------------|
| `true` | Bool | Boolean true |
| `false` | Bool | Boolean false |
| `()` | Unit | Unit value (empty tuple) |

## Type Keywords

| Keyword | Meaning | Example |
|---------|---------|---------|
| `Int` | 64-bit signed integer | `fn (x: Int) { ... }` |
| `Bool` | Boolean | `fn (x: Bool) { ... }` |
| `Unit` | Unit / void type | `fn (x: Unit) { ... }` |
| `Box(T)` | Linear box type | `fn (x: Box(Int)) { ... }` |
| `List(T)` | Lazy list type | `fn (xs: List(Int)) { ... }` |
| `T -> U` | Normal function (callable multiple times) | `fn (f: Int -> Int) { ... }` |
| `T -1-> U` | Affine FnOnce (captures affine resource) | Display only, inferred by compiler |

## User-Defined Types

| Syntax | Description | Example |
|--------|-------------|---------|
| `type N = A \| B(T)` | Algebraic data type | `type Option = None \| Some(Int)` |
| `Ctor(args)` | Constructor (UpperCamelCase) | `Some(42)`, `None` |

## Pattern Syntax (in match)

| Pattern | Description | Example |
|---------|-------------|---------|
| `Ctor(sub)` | Constructor pattern | `Some(v)` |
| `x` | Variable binding | `v` |
| `_` | Wildcard | `_` |

## Operators

| Operator | Meaning | Precedence |
|----------|---------|------------|
| `!` | Strictness override | 1 (tightest) |
| `*`, `/` | Multiplication, division | 2 |
| `+`, `-` | Addition, subtraction | 3 |
| `<`, `>`, `==` | Comparison | 4 |
| `\->` | Pipe-forward | 5 (loosest) |

## Comments

| Style | Syntax | Example |
|-------|--------|---------|
| Shell | `# text` | `# this is a comment` |
| C++ | `// text` | `// this is a comment` |
| Doc | `/// text` | `/// documentation comment` |

## Delimiters

| Token | Purpose |
|-------|---------|
| `{` `}` | Block (function body, if branch, match body) |
| `(` `)` | Grouping, function params, function calls |
| `[` `]` | List literal |
| `:` | Type annotation separator |
| `;` | Binding continuation |
| `,` | Element separator (list, constructor args) |
| `\|` | Variant separator in type declarations |
| `=>` | Match arm arrow |

## Diagnostic Codes

### Errors (D-prefix)

| Code | Description |
|------|-------------|
| D001 | Affine resource used after consumption |
| D004 | Branch affine mismatch |
| D005 | `dup` on FnOnce closure (cannot deep-copy through captured affine) |
| D006 | Type mismatch |
| D007 | Unbound variable |
| D008 | Invalid main function |

### Warnings (W-prefix)

| Code | Description |
|------|-------------|
| W001 | Unused affine resource |
| W002 | Thunk never forced (potential dead code) |
