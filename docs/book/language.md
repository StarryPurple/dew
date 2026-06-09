# Language Reference

## Syntax

```
expr ::= INT | true | false | ()
       | IDENT
       | expr + expr | expr - expr | expr * expr | expr / expr
       | expr == expr | expr < expr | expr > expr
       | if expr { expr } else { expr }
       | fn ( IDENT : type ) { expr }
       | fn () { expr }
       | expr expr              -- application (juxtaposition)
       | expr |> expr           -- pipe-forward (desugars to right(left))
       | !expr                  -- explicit strict evaluation
       | def IDENT = expr ; expr
       | def IDENT = expr       -- standalone binding (no continuation)
       | dup ( expr )
       | fix IDENT : type { expr }
       | box ( expr )
       | unbox ( expr )
       | ( expr )

type ::= Int | Bool | () | Box ( type ) | type -> type
```

## Built-in Constructs

| Construct | Signature | Meaning |
|-----------|-----------|---------|
| `42` | `Int` | 64-bit signed integer literal |
| `true`, `false` | `Bool` | Boolean literals |
| `()` | `()` | Unit value |
| `e1 + e2` | `Int -> Int -> Int` | Addition (sim. `-`, `*`, `/`) |
| `e1 == e2` | `Int -> Int -> Bool` | Equality (sim. `<`, `>`) |
| `if e1 { e2 } else { e3 }` | `Bool -> t -> t -> t` | Conditional |
| `fn (x: T) { e }` | `T -> U` | Lambda, affinity inferred from captures |
| `e1 e2` | `(T -> U) -> T -> U` | Function application |
| `e1 \|> e2` | `T -> (T -> U) -> U` | Pipe-forward: `e1 \|> e2` = `e2(e1)` |
| `!e` | `T -> T` | Force strict evaluation — overrides implicit laziness |
| `def x = e1; e2` | `T -> U -> U` | Let binding |
| `dup(e)` | `T -> T` (T Normal) | Duplicate a normal value |
| `fix f: T { e }` | `T -> T` (T is function) | Recursion — `f` is unrestricted within `e` |
| `box(e)` | `T -> Box(T)` | Allocate linear box — returns affine resource |
| `unbox(e)` | `Box(T) -> T` | Deallocate linear box — consumes the box |
| `nil` | `List(T)` | Empty list |
| `cons(e1, e2)` | `T -> List(T) -> List(T)` | List cons — head strict, **tail lazy** |
| `head(e)` | `List(T) -> T` | Get list head |
| `tail(e)` | `List(T) -> List(T)` | Get list tail (forces lazy tail) |
| `isnil(e)` | `List(T) -> Bool` | Test if list is empty |
| `(e)` | `T` | Parenthesized expression |

## Entry Point: `main`

Every Dew program must define exactly one `main` function with no parameters that returns an `Int` (the process exit code):

```dew
def main = fn () {
  42    # exit code 42
}
```

- **Missing `main`** → compile error
- **`main` with parameters** → compile error  
- **`main` returning non-Int** → compile error
- **Multiple `main` definitions** → compile error

The evaluator calls `main()` and uses the returned `Int` as the Unix process exit code.

## Comments

Line comments start with `#`:

```dew
# This is a comment
def x = 42;   # also a comment
x + 1
```

## Operator Precedence

From tightest to loosest:

1. `!` (strictness override), `*`, `/`
2. `+`, `-`
3. `<`, `>`, `==`
4. Function application (juxtaposition)
5. `|>` (pipe-forward)

Parentheses override precedence.
