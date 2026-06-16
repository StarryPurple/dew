# Dew Compiler — Module Reference

This document is the **canonical reference** for every module in the Dew compiler and toolchain.
Keeper agents maintain this document; it must stay accurate as code changes.

## Pipeline

```
Rx Source ──► rx_parser ──► rx2dew_ir ──► Dew Source
                                                │
                                                ▼
                              Source ──► parser ──► typeck (WIP)
                                                      │
                                                      ▼
                                          strictness ──► ir_gen ──► IR
                                                      │
                                                      ▼
                                              eval ──► Value
```

## Module Index

| No | Module | File | Status | Owner |
|----|--------|------|--------|-------|
| 1 | AST | `src/ast.rs` | ✅ Stable | — |
| 2 | Parser | `src/parser.rs` | ✅ Stable | — |
| 3 | Types | `src/types.rs` | ✅ Stable | — |
| 4 | Type Checker | `src/typeck.rs` | 🔶 Skeleton | — |
| 5 | IR | `src/ir.rs` | ✅ Stable | — |
| 6 | IR Generator | `src/ir_gen.rs` | ✅ Stable | — |
| 7 | Strictness | `src/strictness.rs` | ✅ Stable | — |
| 8 | Evaluator | `src/eval.rs` | ✅ Stable | — |
| 9 | Values | `src/value.rs` | ✅ Stable | — |
| 10 | Diagnostics | `src/diagnostics.rs` | ✅ Stable | — |
| 11 | LSP | `src/lsp.rs` | ✅ Stable | — |
| 12 | CLI | `src/main.rs` | ✅ Stable | — |
| 13 | Rx Parser | `src/rx_parser.rs` | 🔶 Active dev | — |
| 14 | Rx→Dew Translator | `src/rx2dew_ir.rs` | 🔶 Active dev | — |
| 15 | rx2dew binary | `src/bin/rx2dew.rs` | 🔶 Active dev | — |

---

## Module 1: AST (`src/ast.rs`)

**Purpose**: Defines all AST types for the Dew language — expressions, patterns, types, declarations.

**Public types**:
- `Expr` — 23 variants covering all expression forms
- `Decl` — top-level declarations (Def, Struct, Enum, Import)
- `Pattern` — match patterns (Wildcard, Var, Lit, Struct, EnumVariant, Tuple)
- `Type` — type expressions (Prim, Var, Fun, Named, App, Tuple, ArrayType)
- `BinOpKind` — binary operators (Add..Or)S
- `Span` — source location
- `Attr` — attributes (currently only Affine)
- `Variant` — enum variant definitions
- `PrimType` — primitive type enum (Int, Bool, Char, Unit)

**Key design decisions**:
- All expressions carry `Span` for source-level error reporting
- `StructCons` uses positional fields (not named)
- `StructUpdate` uses named field updates
- `ArrayAccess` supports expression indexing
- `ArrayUpdate` supports expression-indexed updates
- `TupleUpdate` uses usize index
- `Pipe` is left-associative syntactic sugar for application
- `Force` wraps lazy thunk evaluation
- `Borrow` is syntactic sugar for `&x` in parameter position
- `Fix` provides named recursion (fixed-point combinator)

**Dependencies**: None (leaf module)

**Testing**: Implicitly tested via parser + evaluator integration

---

## Module 2: Parser (`src/parser.rs`)

**Purpose**: Lexer + recursive descent parser for Dew source language.

**Entry point**: `pub fn parse_program(source: &str) -> Result<Vec<Decl>, String>`

**Public types**:
- `Token` — 30 token variants (keywords, operators, literals)
- `Parser` — private struct with parsing methods

**Token set**:
```
Def, Fn, Struct, Enum, Match, If, Else, Return, Fix, Import, Force,
True, False, Unit, Not,
IntLit(i64), BoolLit(bool), CharLit(char), StringLit(String), Ident(String),
Plus, Minus, Star, Slash, Percent,
Lt, Gt, Le, Ge, EqEq, Ne, AndAnd, OrOr,
Arrow, FatArrow, Dot, Amp, Bang, Hash,
LParen, RParen, LBrace, RBrace, LBracket, RBracket,
Comma, Semicolon, Colon, Underscore, Eq, Eof
```

**Pratt parsing levels** (from tightest to loosest):
1. `parse_primary` — literals, idents, blocks, if, match, fn, fix, parens, brackets, amp
2. `parse_ident_tail` — struct cons, field access, struct update, application
3. `parse_unary` — not, bang, minus, force()
4. `parse_mul` — *, /, %
5. `parse_add` — +, -
6. `parse_comp` — <, >, <=, >=, ==, !=
7. `parse_logic` — &&, ||
8. `parse_pipe` — ->

**Block parsing** (two-phase):
1. Phase 1a: parse all `def name = expr;` bindings
2. Phase 1b: parse all `&expr = rhs;` or `&expr { field = val; };` bindings
3. Phase 2: parse expression statements (semicolon-separated) + optional final expression

**Mutation desugaring** (`desugar_mutation`):
- Walks complex lvalue (field access + array index chains)
- Extracts root variable name
- Builds nested StructUpdate/ArrayUpdate AST
- Returns `(root_name, update_expr)` for Let binding

**Dependencies**: `crate::ast::*`

**Testing**: 13 unit tests covering types, unit values, empty parens, and edge cases

**Known limitations**:
- No while-loop syntax (Dew is expression-based)
- `&expr { field = val }` struct update only works with simple identifiers after `&`
- `|` character (single pipe) is NOT a valid token — only `||` (OrOr) is recognized

---

## Module 3: Types (`src/types.rs`)

**Purpose**: Type system types for HM type inference.

**Public types**:
- `Ty` — type variable, primitive, function, struct, variant constructors
- `Affinity` — Unrestricted, Affine, Once (for affine type system)
- `Scheme` — universally quantified type scheme
- `Subst` — substitution mapping from type variables to types
- `TypeEnv` — typing environment

**Status**: Skeleton — full HM inference not yet implemented.

---

## Module 4: Type Checker (`src/typeck.rs`)

**Purpose**: Hindley-Milner type inference.

**Status**: Skeleton — API stubbed, not yet implemented.

---

## Module 5: IR (`src/ir.rs`)

**Purpose**: Thunk Graph IR — a flat, label-based intermediate representation with 6 core primitives.

**Public types**:
- `Module` — top-level IR container with items and struct definitions
- `Item` — Thunk, Extern, Update wrapper
- `Thunk` — named thunk with params and basic blocks
- `BasicBlock` — labeled block with instructions and terminal
- `Terminal` — block terminator (Return, Jump, Branch, Force, Call, Switch)
- `Instr` — 33 instruction variants (arithmetic, memory, control)
- `Reg` — virtual register (newtype over usize)
- `Label` — basic block label (String)
- `Accessor` — path segment for fetch/place (Field(String), Index(usize))
- `Ty` — IR-level type enum (Int, Bool, Char, Unit, Struct, Enum, Array, Tuple, Fun)
- `PrimOp` — primitive operation (Add, Sub, Mul, Div, Rem, Lt, Gt, Le, Ge, Eq, Ne, And, Or, Not)

**Core primitives** (6):
1. `ThunkAlloc` — allocate thunk cell
2. `ThunkDef` — define thunk with blocks
3. `Force` — force evaluation of thunk
4. `Update` — update thunk value (blackhole pattern)
5. `Blackhole` — mark thunk as evaluating (detect cycles)
6. `Def` — define local binding

**IR instructions** (33):
- Arithmetic: `Add`, `Sub`, `Mul`, `Div`, `Rem`
- Comparison: `Lt`, `Gt`, `Le`, `Ge`, `Eq`, `Ne`
- Logic: `And`, `Or`, `Not`
- Memory: `Fetch` (with Accessor path), `Place` (with Accessor path)
- Data: `StructCons`, `StructUpdate`, `ArrayCons`, `ArrayUpdate`, `TupleCons`, `TupleUpdate`
- Enum: `EnumCons`, `EnumProj`
- Control: `Call`, `TailCall`
- IO: `Stdin`, `Stdout`
- Other: `Const`, `Copy`, `Move`, `Phi`

**Serde**: All IR types derive `Serialize` and `Deserialize` for JSON emission (`Module::to_json()`).

**Dependencies**: `serde`

---

## Module 6: IR Generator (`src/ir_gen.rs`)

**Purpose**: Compiles Dew AST to Thunk Graph IR.

**Key design decisions**:
- Flat register allocation (SSA-like via fresh_reg)
- ThunkDef for lazy bindings, Def for strict let-bindings
- Closure affinity inferred from captured variables
- Recursive functions use thunk self-reference (Ref → Label)
- Struct construction = Apply IR node
- Optimization levels: O0 (no opts), O1 (strict defs, fn defs)

**O1 optimizations**:
- `StrictDef` for zero-arg non-recursive definitions
- `FnDef` for non-zero-arg non-recursive definitions
- `force_thunk` creates Closure for parametric thunks
- Lambda wrapper elimination at all opt levels

**Dependencies**: `crate::ast::*`, `crate::ir::*`, `crate::strictness::*`

---

## Module 7: Strictness (`src/strictness.rs`)

**Purpose**: Classifies expression contexts as strict or lazy.

**Public API**:
- `strictness_classify(expr) -> StrictnessContext`
- Used by IR gen to determine whether to insert Suspend/Force

**Rules**:
- Arithmetic/comparison operands: strict
- Function arguments: ambient context
- If condition: strict
- Match scrutinee: strict
- Let binding value: ambient (top-level = lazy, block-level = ambient)

---

## Module 8: Evaluator (`src/eval.rs`)

**Purpose**: Block-walking evaluator for Thunk Graph IR with lazy thunk runtime.

**State machine** (3-state FSM per thunk):
1. `Suspended` — thunk not yet evaluated (contains blocks + params)
2. `Evaluating` — evaluation in progress (blackhole detection)
3. `Evaluated(Value)` — cached result

**Key methods**:
- `eval_module(module) -> Result<(), String>` — process all items
- `force_thunk(label) -> Value` — force evaluation of thunk
- `eval_block(label, blocks, regs) -> ControlFlow` — walk basic block

**Instr evaluation** (33 handlers):
- Arithmetic: eval both operands, apply op
- Fetch: walk Accessor path on base value
- Place: walk Accessor path, create updated value
- StructCons: evaluate all fields
- Call: force function thunk, evaluate body with args

**IO**: `Stdin(0)` reads line from stdin, `Stdout` writes to stdout (via pipe)

**Dependencies**: `crate::ir::*`, `crate::value::*`, `crate::diagnostics::*`

---

## Module 9: Values (`src/value.rs`)

**Purpose**: Runtime value representation for the evaluator.

**Public types**:
- `Value` — runtime value (Int, Bool, Char, Unit, Struct, Array, Tuple, Enum, Closure, Thunk)
- `Env` — environment (variable → Value mapping)

**Closure**: Captures environment for function values.

**Dependencies**: `crate::ir::*` (for Ty, Accessor)

---

## Module 10: Diagnostics (`src/diagnostics.rs`)

**Purpose**: Diagnostic collector with error/warning codes.

**Public types**:
- `DiagnosticCollector` — accumulates errors and warnings
- `Diagnostic` — single diagnostic with code, message, severity
- Error codes: `[E001]` file/system, `[E002]` parse, `[E###]` general
- Warning codes: `[W###]`

---

## Module 11: LSP (`src/lsp.rs`)

**Purpose**: Language Server Protocol implementation (JSON-RPC over stdio).

**Supported features**:
- `textDocument/didOpen` — parse and check documents
- `textDocument/didChange` — incremental re-parse
- Diagnostics published on change

---

## Module 12: CLI (`src/main.rs`)

**Purpose**: Entry point — parse CLI args, dispatch to compiler or LSP.

**Commands** (via clap derive):
- `dew <file>` — compile and evaluate (exit code from main return value)
- `dew lsp` — start LSP server
- `dew <file> --emit=text` — print IR
- `dew <file> --emit=json` — print IR as JSON
- `dew <file> --opt=0|1` — optimization level

---

## Module 13: Rx Parser (`src/rx_parser.rs`)

**Purpose**: Recursive descent parser for the Rx language (Rust subset).

**Supported Rx features**:
- Struct declarations, impl blocks, standalone functions
- `let`/`let mut` bindings with type annotations
- `while` loops, `if`/`else` (statement and expression)
- Binary/unary expressions with operator precedence
- Field access, array indexing, function calls, struct literals
- Array literals (explicit and repeat `[T; N]`)
- `return`, `continue`, `as`-cast, `&` references, `*` deref
- `self`, `&self`, `&mut self` in method params
- `mut` in function parameter patterns
- `const` declarations
- Block comments `/* */` and line comments `//`

**Public types**:
- `Program` — top-level container
- `Decl` — Struct, Impl, Fn, Const
- `FnDecl` — function with params, return type, body
- `Stmt` — Let, Assign, While, If, Return, Continue, Expr
- `Expr` — Int, Bool, Ident, Str, Binary, Unary, Call, Field, Index, StructLit, ArrayLit, Cast, Ref, Deref, If
- `AssignOp` — Plain, Plus, Minus, Star
- `BinOp` — Add, Sub, Mul, Div, Rem, Eq, Ne, Lt, Gt, Le, Ge, And, Or
- `UnOp` — Neg, Not
- `Token` — 50 token variants
- `Lexer` — character-level lexer
- `Parser` — recursive descent parser

**Parser grammar**: See `RustShard-Compiler/docs/semantic_rules.md` for the formal Rx grammar.

**Known limitations**:
- `return` without expression requires trailing `;` to terminate statement
- No `for` loops, no closures, no generics, no pattern matching
- No tuple expressions, no match expressions
- `break` with value is parsed but `break expr` and `continue` not yet handled as expressions
- No `loop` expression support

**Testing**: 3 integration tests (simple fn, struct, while/if)

---

## Module 14: Rx→Dew Translator (`src/rx2dew_ir.rs`)

**Purpose**: Translates Rx AST to Dew source text.

**Public API**: `pub fn translate_rx_to_dew(src: &str) -> Result<String, String>`

**Translation rules**:
- Types: `i32`/`usize` → `Int`, `bool` → `Bool`, `()` → `Unit`, struct names preserved
- Functions: `fn name(params) -> Type { body }` → `def name = fn(params) -> Type { body }`
- Impl methods: `impl S { fn m(&self, ...) -> T { ... } }` → `def S_m = fn(self: S, ...) -> T { ... }`
- Let bindings: `let x: T = e;` → `def x = e;`
- Mutations: `x = e;` → `&x = e;`, `x += e;` → `&x = x + e;`
- If: `if cond { then }` → `if cond { then }` (no parens)
- Struct cons: `S { f1: v1, f2: v2 }` → `S(v1, v2)` (positional)
- Array: `[T; N]` → `Int` (type collapse), `[e1, e2]` → `[e1, e2]` (same)
- Field access: `obj.field` → `obj.field` (same)
- Index: `arr[i]` → `arr[i]` (same)
- Builtins: `getInt()` → `Stdin(0)`, `printlnInt(x)` → `x -> Stdout`, `exit(0)` → `0`
- Cast/Ref/Deref: pass through (type erasure)
- While: emits comment placeholder (Dew has no while loops)

**Block ordering**: Emits all `def` bindings first, then all `&name =` bindings, then expressions — matching Dew's two-phase block structure.

**Dependencies**: `crate::rx_parser::*`

---

## Module 15: rx2dew Binary (`src/bin/rx2dew.rs`)

**Purpose**: CLI tool that reads `.rx` file, translates to Dew, prints to stdout.

**Usage**: `cargo run --bin rx2dew -- input.rx`

---

## Error Codes

| Code | Category | Source |
|------|----------|--------|
| `[E001]` | File/System | File not found, I/O errors |
| `[E002]` | Parse | Lexer or parser errors (Dew and Rx) |
| `[E###]` | General | Evaluator, IR gen, other runtime errors |
| `[W###]` | Warning | Non-fatal diagnostics |

## Conventions

- **2-space indent** in both IR text format and Dew source code
- **Rust 2021 edition** with standard library
- **No `as any`, `@ts-ignore`, `unwrap()` without context** — use proper error types
- **Serde** for IR JSON serialization
- **Clap 4 (derive)** for CLI argument parsing
- **ariadne** for fancy error reporting (declared, not yet integrated)
