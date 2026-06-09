# Keyword Reference

## Expression Keywords

| Keyword | Description | Example |
|---------|-------------|---------|
| `fn` | Lambda / function expression | `fn (x: Int) { x + 1 }` |
| `def` | Let binding (variable definition) | `def x = 42; x + 1` |
| `if` | Conditional expression | `if cond { 1 } else { 0 }` |
| `else` | Alternative branch of `if` | `if cond { a } else { b }` |
| `fix` | Fixed-point combinator (recursion) | `fix f: Int -> Int { ... }` |
| `dup` | Duplicate a normal (copyable) value | `dup(x)` |

## Resource Keywords (Affine Types)

| Keyword | Description | Example |
|---------|-------------|---------|
| `box` | Allocate a linear box (affine resource) | `box(42)` |
| `unbox` | Deallocate a box, consuming it | `unbox(b)` |

## List Keywords

| Keyword | Description | Example |
|---------|-------------|---------|
| `nil` | Empty list | `nil` |
| `cons` | List constructor (head, tail) | `cons(1, cons(2, nil))` |
| `head` | Get first element of a list | `head(xs)` |
| `tail` | Get rest of list (forces lazy tail) | `tail(xs)` |
| `isnil` | Test if list is empty | `isnil(xs)` |

## Literal Keywords

| Keyword | Description |
|---------|-------------|
| `true` | Boolean true |
| `false` | Boolean false |

## Type Keywords

| Keyword | Description | Example |
|---------|-------------|---------|
| `Int` | 64-bit signed integer type | `fn (x: Int) { ... }` |
| `Bool` | Boolean type | `fn (x: Bool) { ... }` |
| `()` | Unit / void type (no parameters) | `fn () { ... }` |
| `Box(T)` | Linear box type | `fn (x: Box(Int)) { ... }` |
| `List(T)` | List type | `fn (xs: List(Int)) { ... }` |
| `T -> U` | Function type (arrow) | `fn (f: Int -> Int) { ... }` |

## Operator Keywords

| Operator | Description | Precedence |
|----------|-------------|------------|
| `!` | Strictness override | 1 (tightest) |
| `*`, `/` | Multiplication, division | 2 |
| `+`, `-` | Addition, subtraction | 3 |
| `<`, `>`, `==` | Comparison | 4 |
| `\|>` | Pipe-forward | 5 (loosest) |

## Syntax Elements

| Token | Description |
|-------|-------------|
| `{` `}` | Block delimiters (function bodies, if branches) |
| `(` `)` | Parenthesized expressions, function parameters, function calls |
| `:` | Type annotation separator |
| `;` | Binding continuation (after `def x = expr; ...`) |
| `,` | List literal element separator |
| `#` | Line comment (until end of line) |

## Affinity Annotations (In Type Display)

| Notation | Meaning |
|----------|---------|
| `T -> U` | Normal function — can be called any number of times |
| `T -1-> U` | Affine function (FnOnce) — captures an affine resource, can be called at most once |

## Diagnostic Codes

### Errors (D-prefix)

| Code | Description |
|------|-------------|
| D001 | Affine resource used after consumption (double unbox, double FnOnce call) |
| D004 | Branch affine mismatch (consumed in one branch but not the other) |
| D005 | `dup` on affine (non-copyable) value |
| D006 | Type mismatch (wrong type, invalid operation, wrong condition type) |
| D007 | Unbound variable |
| D008 | Invalid `main` (missing, wrong signature, duplicate) |

### Warnings (W-prefix)

| Code | Description |
|------|-------------|
| W001 | Unused affine resource (Box allocated but never consumed) |
| W002 | Thunk never forced (potential dead code or space leak) |
