# Language Reference

## Syntax

```
expr ::= INT | true | false | ()
       | IDENT
       | expr + expr | expr - expr | expr * expr | expr / expr
       | expr == expr | expr < expr | expr > expr
       | if expr { expr } else { expr }
       | fn ( IDENT : type ) { expr }       -- typed parameter
       | fn ( IDENT ) { expr }              -- inferred parameter
       | fn () { expr }                     -- unit parameter
       | fn { expr }                        -- unit parameter sugar
       | expr expr                          -- application (juxtaposition)
       | expr -> expr                       -- pipe-forward
       | !expr                              -- strictness override
       | def IDENT = expr ; expr
       | def IDENT = expr
       | dup IDENT = expr
       | fix IDENT : type { expr }
       | box ( expr )
       | unbox ( expr )
       | nil | cons ( expr , expr )
       | head ( expr ) | tail ( expr ) | isnil ( expr )
       | match expr { pat => expr , ... }   -- pattern match
       | CtorName ( expr , ... )            -- constructor (UpperCamelCase)
       | include "file.dew"                 -- preprocessor
       | ( expr )

type ::= Int | Bool | Unit | Box ( type ) | List ( type ) | type -> type
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
| `fn (x) { e }` | `T -> U` | Lambda, parameter type inferred by HM |
| `fn { e }` | `Unit -> U` | Lambda with no parameters (sugar for `fn () { e }`) |
| `e1 e2` | `(T -> U) -> T -> U` | Function application |
| `e1 \-> e2` | `T -> (T -> U) -> U` | Pipe-forward: `e1 \-> e2` = `e2(e1)` |
| `!e` | `T -> T` | Force strict evaluation — overrides implicit laziness |
| `def x = e1; e2` | `T -> U -> U` | Let binding |
| `dup y = e` | `T -> T` | Duplicate a value into binding (deep copy for Box) |
| `fix f: T { e }` | `T -> T` (T is function) | Recursion — `f` is Normal within `e` |
| `box(e)` | `T -> Box(T)` | Allocate linear box — returns affine resource |
| `unbox(e)` | `Box(T) -> T` | Deallocate linear box — consumes the box |
| `nil` | `List(T)` | Empty list |
| `cons(e1, e2)` | `T -> List(T) -> List(T)` | List cons — head strict, **tail lazy** |
| `head(e)` | `List(T) -> T` | Get list head |
| `tail(e)` | `List(T) -> List(T)` | Get list tail (forces lazy tail) |
| `isnil(e)` | `List(T) -> Bool` | Test if list is empty |
| `[e1, e2, ...]` | `List(T)` | List literal sugar |
| `match e { P => b, ... }` | Pattern match | Exhaustive pattern matching |
| `type N = A \| B(T)` | Type decl | Define algebraic data type |
| `# comment`, `// comment`, `/// doc` | — | Line comments |
| `include "f.dew"` | — | File inclusion preprocessor |

## Entry Point: `main`

Every Dew program must define exactly one `main` function with no parameters that returns an `Int` (the process exit code):

```dew
def main = fn {
  42    // exit code 42
}
```

- **Missing `main`** → compile error
- **`main` with parameters** → compile error  
- **`main` returning non-Int** → compile error
- **Multiple `main` definitions** → compile error

The evaluator calls `main()` and uses the returned `Int` as the Unix process exit code.

## Comments

Line comments start with `#` or `//`. Doc comments use `///`.

```dew
# Shell-style comment
// C++-style comment
/// Documentation comment

def x = 42;  // trailing comment
```

## Operator Precedence

From tightest to loosest:

1. `!` (strictness override), `*`, `/`
2. `+`, `-`
3. `<`, `>`, `==`
4. Function application (juxtaposition)
5. `->` (pipe-forward)

Parentheses override precedence.
