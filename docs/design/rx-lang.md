# Rx Language — AST Specification

> **Status**: Reference document for the Rx parser AST consumed by the
> `rx2dew` translator (`src/rx2dew_ir.rs`).
>
> Last updated: 2026-06-20.

## 1. Program Structure

```
Program
  └── decls: Vec<Decl>
```

A program is a sequence of top-level declarations. Parsed from one `.rx` source file;
no module system, no file-level imports.

## 2. Declarations

```
Decl
├── Struct { name, fields: Vec<(String, String)> }
│     // struct Foo { x: i32, y: i32 }
│     // fields: [(name, type_string), ...]
│
├── Impl { struct_name: String, methods: Vec<FnDecl> }
│     // impl Foo { fn bar(&self, x: i32) { ... } }
│     // struct_name = "Foo"
│
├── Fn(FnDecl)
│     // Top-level function
│
└── Const { name: String, value: String }
      // const MAXN: usize = 200;
      // value is the stringified expression
```

### FnDecl

```
FnDecl {
    name:     String,         // function name
    params:   Vec<(String, String)>,  // [(param_name, type_string)]
    ret_type: String,         // return type ("()" if unspecified)
    body:     Vec<Stmt>,      // function body as statement list
}
```

**Parameter types** (`type_string`) are Rust source strings after minimal normalization:

| Rx Source      | `type_string` stored       |
|----------------|---------------------------|
| `i32`          | `"i32"`                   |
| `bool`         | `"bool"`                  |
| `()`           | `"()"`                    |
| `usize`        | `"usize"`                 |
| `[i32; 100]`   | `"[i32; 100]"`            |
| `[Node; MAXN]` | `"[Node; MAXN]"`          |
| `&mut [T; N]`  | `"&mut [T; N]"`           |

## 3. Statements

```
Stmt
├── Let { name, mutable: bool, ty: String, init: Option<Expr> }
│     // let x = expr;  let mut x: T = expr;
│
├── Assign { lhs: Expr, op: AssignOp, rhs: Expr }
│     // x = expr;  x += expr;  x[0] = expr;
│
├── While { cond: Expr, body: Vec<Stmt> }
│     // while (cond) { body }
│
├── If { cond: Expr, then_body: Vec<Stmt>, else_body: Option<Vec<Stmt>> }
│     // if (cond) { ... } else { ... }
│
├── Return(Option<Expr>)
│     // return;  return expr;
│
├── Continue
│     // continue;
│
├── Expr(Expr)
│     // Expression statement (value discarded)
│
└── Empty
      // Stray semicolon, no semantic content
```

### AssignOp

```
AssignOp
├── Plain  // = 
├── Plus   // +=
├── Minus  // -=
├── Star   // *=
├── Slash  // /=
└── Percent  // %=
```

## 4. Expressions

```
Expr
├── Int(i64)
├── Bool(bool)
├── Ident(String)
│     // Variable reference, function name
├── Str(String)
│     // String literal
│
├── Binary(Box<Expr>, BinOp, Box<Expr>)
│     // Arithmetic, comparison, logical, bitwise
│
├── Unary(UnOp, Box<Expr>)
│     // Unary operators
│
├── Call { func: Box<Expr>, args: Vec<Expr> }
│     // f(args) — function call
│
├── Field(Box<Expr>, String)
│     // obj.field — field access
│
├── Index(Box<Expr>, Box<Expr>)
│     // arr[idx] — array index
│
├── StructLit { name: String, fields: Vec<(String, Expr)> }
│     // Point { x: 1, y: 2 }
│
├── ArrayLit { elements: Vec<Expr>, repeat: Option<Box<Expr>> }
│     // [a, b, c] or [e; N] when repeat.is_some()
│
├── Cast(Box<Expr>, String)
│     // expr as T
│
├── Ref(Box<Expr>)
│     // &expr (reference / address-of)
│
├── Deref(Box<Expr>)
│     // *expr (dereference)
│
├── If { cond: Box<Expr>, then_body: Vec<Stmt>, else_body: Vec<Stmt> }
│     // if (cond) { then } else { else } as expression
│
└── Block(Vec<Stmt>)
      // { stmts } as expression
```

### BinOp

```
BinOp
├── Add, Sub, Mul, Div, Rem   // + - * / %
├── Eq, Ne, Lt, Gt, Le, Ge    // == != < > <= >=
├── And, Or                   // && ||
├── BitAnd, BitOr, BitXor     // & | ^
└── Shl, Shr                  // << >>
```

### UnOp

```
UnOp
├── Neg  // - (arithmetic negation)
└── Not  // ! (logical not)
```

## 5. Lexer Tokens

```
Token
├── Keywords: KwStruct, KwImpl, KwFn, KwLet, KwMut,
│             KwWhile, KwIf, KwElse, KwReturn, KwContinue,
│             KwExit, KwAs, KwConst, KwSelf, KwRefSelf, KwMutSelf,
│             KwGetInt, KwPrintInt, KwPrintlnInt
│
├── Literals: Ident(String), IntLit(i64), BoolLit(bool), StrLit(String)
│
├── Operators..Punctuation:
│   Plus, Minus, Star, Slash, Percent,
│   EqEq, Ne, Lt, Gt, Le, Ge, And, Or, Not,
│   Amp, BitOr, BitXor, Shl, Shr,
│   Eq, PlusEq, MinusEq, StarEq, SlashEq, PercentEq, CaretEq, ShlEq, ShrEq,
│   LParen, RParen, LBrace, RBrace, LBracket, RBracket,
│   Colon, DoubleColon, Semi, Comma, Dot, Arrow, FatArrow,
│   Underscore, Eof
```

### Numeric Literals

- Decimal: `42`, `1000`
- Hex: `0x1000`, `0xABCD`
- Octal: `0o777`
- Binary: `0b1010`
- Type suffixes: `0u32`, `2166136261u32`, `1073741824i32`
- Suffixes are consumed by the lexer and discarded; the numeric value is stored as `IntLit(i64)`.

## 6. Notable Limitations

| Feature | Status | Why |
|---------|--------|-----|
| Generics | Not supported | Rx has none |
| Lifetime annotations | Not supported | Rx has none |
| `for` loops | Not supported | Desugar to `while` |
| `break` | Not supported | No `KwBreak` token |
| `match` | Not supported | Not in the Rx subset |
| Closures | Not supported | Not in the Rx subset |
| `for`-`in` | Not supported | Not in the Rx subset |
