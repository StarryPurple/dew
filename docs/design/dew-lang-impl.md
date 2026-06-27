# Dew Language → Dew IR Implementation

> **Implementation companion to [dew-lang.md](dew-lang.md).** Documents how each language feature lowers through the compiler pipeline: Parser → Desugar → Name Resolution → Type Check → Strictness → IR Gen → Eval. Sections mirror dew-lang.md.

### Contents

- [§1 Pipeline Architecture](#1-pipeline-architecture)
- [§2 Program Model](#2-program-model)
- [§3 Core Semantics](#3-core-semantics)
  - [§3.1 Immutability](#31-immutability)
  - [§3.2 Lazy Evaluation](#32-lazy-evaluation)
  - [§3.3 Strict Evaluation](#33-strict-evaluation)
- [§4 Type System](#4-type-system)
  - [§4.4 Struct](#44-struct)
  - [§4.5 Enum](#45-enum)
- [§5 Functions](#5-functions)
  - [§5.1 Definition](#51-definition)
  - [§5.3 Recursion](#53-recursion)
  - [§5.4 Anonymous Recursion (fix)](#54-anonymous-recursion-fix)
  - [§5.5 Borrow Sugar](#55-borrow-sugar)
  - [§5.6 Pipeline](#56-pipeline)
  - [§5.8 def Binding](#58-def-binding)
- [§6 Control Flow](#6-control-flow)
  - [§6.1 match](#61-match)
  - [§6.2 if/else](#62-ifelse)
- [§8 I/O System](#8-io-system)
- [§10 Standard Library](#10-standard-library)

---

## 1. Pipeline Architecture

```
Dew Source
  ↓ Parser (src/parser.rs)
AST (src/ast.rs) — with sugar (Fix, Borrow, Pipeline, If)
  ↓ Desugar (src/desugar.rs)
Core AST — only primitives (Fn, Call, Match, Block, Field, ...)
  ↓ Name Resolution (src/nameres.rs)
  ↓ Type Checker (src/typeck.rs)
  ↓ Strictness (src/strictness.rs)
  ↓ IR Generator (src/ir_gen.rs)
Dew IR (src/ir/) — Thunk Graph IR: fns, thunks, basic blocks, flat registers
  ↓ Evaluator (src/backend/eval.rs)
Runtime values
```

**Key principle**: All syntax sugar is eliminated in the desugar pass. The type checker, name resolver, strictness analyzer, and IR generator never see sugar forms.

---

## 2. Program Model

### Top-Level Compilation

Each `Decl::Def(d)` is compiled to either:

| Form | IR | When |
|------|----|------|
| `def x = expr` (zero-arg) | `thunk @x` | Default (lazy) |
| `def f = fn(...) { ... }` | `fn @f` or `thunk @f` | fn if strict, thunk if lazy |
| `def rec f = fn(...) { ... }` | `thunk @f` with self-ref | Recursive — always thunk |

**Execution model**: the evaluator finds `fn @main` (or `thunk @main`) and forces it. Only referenced definitions are evaluated — unreferenced thunks remain suspended.

### Structure → IR

```
struct Point { x: Int, y: Int }
```
↓ IR Gen
```
TypeTable: struct Point { fields: [(x, Int), (y, Int)] }
```

Struct definitions are stored in `Module.types` (TypeTable). They are never emitted as instructions — the IR references field names; the type table provides structural details (field offsets, sizes).

---

## 3. Core Semantics

### 3.1 Immutability

All bindings are immutable — new `def` creates a new name (shadowing). For mutation-like patterns, borrow sugar (§5.5) provides `&x = expr` and `&x { field = val }`, which desugar to `def x = ...` (rebinding).

### 3.2 Lazy Evaluation

**Thunk representation**: a zero-arg `def` is compiled as a `thunk` — a suspended computation.

```
def x = 40 + 2;
```
↓ Strictness + IR Gen
```
thunk @x() { entry: %0 = lit 40; %1 = lit 2; %2 = add %0 %1; ret %2 }
```

**Forcing**: referencing a thunk by name inserts a `force{} @name` instruction. The force evaluates the thunk on first access and caches the result.

```
def y = x + 10;
```
↓ IR Gen (force path)
```
thunk @y() {
  entry:
    %0 = force{} @x
    %1 = lit 10
    %2 = add %0 %1
    ret %2
}
```

**Caching**: the evaluator uses a 3-state FSM per thunk:
```
Suspended → Evaluating → Evaluated(value)
              ↑               |
              └── cycle ──────┘
```
Forcing an `Evaluated` thunk returns the cached value immediately. Forcing an `Evaluating` thunk is a cycle (blackhole detected).

**Force operator `!`**: `!expr` is a passthrough in IR gen — `Expr::Force(f)` compiles to `compile_expr(&f.expr)`. The strictness analyzer and thunk names in `compile_expr(Var)` handle the actual forcing. `!x` where `x` is a thunk name generates `force{} @x`; `!(40+2)` generates the addition inline.

**Force evaluation frame**: `force_thunk` creates a **fresh `EvalFrame`** for each thunk evaluation. This prevents register conflicts when multiple thunks are forced in sequence (e.g., `!a + !b`). Without a fresh frame, the second thunk's registers overwrite the first's — causing incorrect results.

### 3.3 Strict Evaluation

IO functions (`stdout`/`stdin` callers) are compiled as `fn` (strict), not `thunk`. Their bodies are evaluated immediately upon call, not deferred.

---

## 4. Type System

### 4.4 Struct

**Construction** (`Point { x: 3, y: 4 }`):
```
Parser: Expr::Call(Ident("Point"), [Value(3), Value(4)])
  → Parser converts Call → StructCons if func is a struct name
  → IR Gen: Instr::StructCons(%r, "Point", [%3, %4])
```

**Field access** (`p.x`):
```
Parser: Expr::Field { object: Var("p"), field: "x" }
  → IR Gen: Instr::Field(%r, %p_reg, field_idx)
  → field_idx looked up from TypeTable::struct_field_index("Point", "x")
```

**Field update** (`p { x = 10 }`):
```
Parser: Expr::Update { base: Var("p"), updates: [NamedField { name: "x", value: Lit(10) }] }
  → IR Gen: Instr::StructUpdate(%r, %p_reg, field_idx, %10_reg)
```

**Reg tracking**: `reg_struct` map in IR gen tracks which register holds which struct type, enabling field index lookups.

### 4.5 Enum

#### Variant Types

**Single positional payload** (`Option { Some(Int), None }`):
- Declared with `Variant::Single { payload: Vec<Type> }` — supports 0-n positional types
- `Vec<Type>` replaces the old `Type` — all variants are uniformly positional

**Named-field variant** (`Event { KeyPress { key: Char, modifiers: Int } }`):
- Declared with `Variant::Struct { fields: Vec<StructField> }`
- Parsed with `name: Type` pairs (fixed parser bug)

#### Construction

**Positional** (`Some(42)`):
```
Parser: Expr::Call(Ident("Some"), [Value(42)])
  → IR Gen: checks TypeTable → is enum variant → Instr::EnumCons(%r, "Option", "Some", [%42])
```

**Named-field** (`KeyPress { key: 'a', modifiers: 0 }`):
```
Parser: Expr::StructLit { name: "KeyPress", fields: ... }
  → IR Gen: checks TypeTable → is enum variant → Instr::EnumCons(%r, "Event", "KeyPress", [%key, %mod])
  → Falls back to Instr::StructCons for non-enum struct literals
```

**Zero-payload** (`Point`):
```
Parser: Expr::Var("Point")
  → IR Gen: var_map check fails → TypeTable::find_zero_payload_variant("Point")
  → Instr::EnumCons(%r, "Shape", "Point", [])
```

#### Match

**Discriminant**:
```
match scrutinee { ... }
```
↓ IR Gen
```
%disc = enum_disc %scrutinee
// Chain of tag comparisons:
%test0 = eq %disc 0  → br %test0 L_arm0 L_check1
%test1 = eq %disc 1  → br %test1 L_arm1 L_check2
...
```

**Projection**: each arm's pattern destructuring emits `enum_proj` per field:

```
// Pattern: Some(v) — single payload
Instr::EnumProj(%v, "Option", "Some", 0, %scrutinee)

// Pattern: Node(left, right) — multi-payload
Instr::EnumProj(%left, "Tree", "Node", 0, %scrutinee)
Instr::EnumProj(%right, "Tree", "Node", 1, %scrutinee)

// Pattern: KeyPress { key, modifiers } — named-field struct
Instr::EnumProj(%key, "Event", "KeyPress", field_idx_key, %scrutinee)
Instr::EnumProj(%mod, "Event", "KeyPress", field_idx_mod, %scrutinee)
```

**EnumProj index**: uniform `usize` for all field types. Positional fields get synthetic names ("0", "1"...) in TypeTable. Named fields use their declarative names. The field index is resolved at IR gen time.

### 4.7 Array

**Type**: `Array(T, N)` where `N` is a compile-time `usize` constant. Stored in `IrType::Array(Box<IrType>, usize)`.

**Literal** (`[1, 2, 3]`):
```
Parser: Expr::ArrayLit { elements: [1, 2, 3] }
  → IR Gen: Instr::ArrayLit(%r, Array(Int, 3), [%1, %2, %3])
  → Eval: Value::Array(vec![Int(1), Int(2), Int(3)])
```

**Fill** (`[0; 5]`):
```
Parser: Expr::ArrayFill { value: 0, count: 5 }
  → IR Gen: Instr::ArrayFill(%r, Array(Int, 5), %val, 5)
  → Eval: Value::Array(vec![0; 5])
```

**Access** (`arr[i]`):
```
Parser: Expr::Subscript { array: Var("arr"), index: i }
  → IR Gen: Instr::ArrayAccess(%r, %arr, %idx)
  → Eval: Value::Array.elems[i]
```

**Update** (`arr { [i] = val }`):
```
Parser: Expr::Update { base: Var("arr"), updates: [ArrayIndex { index: i, value: val }] }
  → IR Gen: Instr::ArrayUpdate(%r, %arr, %idx, %val)
  → Eval: clone array, replace element at i
```

**Type checking**: `infer_subscript` resolves the array size from the expression's inferred type to avoid size mismatch during unification.

**Index type**: array indices must be `Int`. The evaluator extracts `as_int()` from the index register.

---

## 5. Functions

### 5.1 Definition

**Simple function**:
```
def add = fn(x: Int, y: Int) -> Int { x + y }
```
↓ IR Gen
```
fn @add(%0: Int, %1: Int) {
  entry:
    %2 = add %0 %1
    ret %2
}
```

**Zero-arg function**:
```
def main = fn { 42 -> stdout; }
```
↓ IR Gen
```
fn @main() {
  entry:
    %0 = lit 42
    stdout{} %0
    ret %0
}
```

**Block-local def with Fn**: when a `BlockStmt` has `def: Some(DefDecl)` and `expr: Fn(...)`, the IR gen compiles the fn as a module-level thunk and inserts a `Force` instruction to bind the result to the def name.

### 5.3 Recursion

**def rec**:
```
def rec fact = fn(n: Int) -> Int { if n == 0 { 1 } else { n * fact(n - 1) } }
```
↓ Desugar + IR Gen
```
thunk @fact(n: Int) {
  entry:
    %0 = lit 0; %1 = eq %n %0
    br %1 L_base L_rec
  L_base:
    %2 = lit 1; ret %2
  L_rec:
    %3 = lit 1; %4 = sub %n %3
    %5 = force{} @fact %4   // self-reference via Force
    %6 = mul %n %5; ret %6
}
```

The name resolver's two-pass approach: first pass collects all `def rec` names into top-level scope, enabling forward references (even/odd mutual recursion). Second pass resolves each body with the full scope.

### 5.4 Anonymous Recursion (fix)

```
fix loop { fn(n: Int) -> Int { ... loop(n-1) ... } }
```

**Two-layer desugar**:

**Layer 1 — Top-level** (`desugar_decl`): optimizes `def name = fix loop { fn... }` directly to `def rec name = fn...` by substituting `loop → name` in the function body. Handles both `fix.body = Fn(...)` and `fix.body = Block{final_expr: Fn(...)}`.

**Layer 2 — Expression-level** (`desugar_expr`): handles `fix` appearing in non-top-level positions (`map(xs, fix g { fn... })`). Converts to a block with `def rec`:
```
fix loop { body }
  ↓ desugar_expr
{
  def rec loop = body;
  loop          // final_expr returns the defined value
}
```

The desugared block's statement has `DefDecl { rec: true, name: "loop", ... }`. `desugar_block` and subsequent passes handle it identically to any other `def rec`.

**All `Expr::Fix` is eliminated before IR gen.** The IR generator only sees `def rec` declarations.

### 5.5 Borrow Sugar

#### Pipeline

All pipeline lowering via an exhaustive state machine:

**Rule 1 — Function Definition**: `fn(&p: T, args...) -> U { body }` becomes `fn(p: T, args...) -> (T, U) { body' }`. The borrow parameter is converted to a regular parameter; the return type gains the borrow param type as a tuple prefix. In `body'`: `&p = expr` → `def %p = expr`; final expression becomes `(%p, result)`.

**Rule 2 — Call Site**: `f(&x, args...)` becomes `def (x, result) = f(x, args...)`. Implemented in `desugar_block` for statement-level calls with `def: Some(...)`.

**Rule 3 — Compound Lvalue**: `f(&root.a.b, args...)` expands to extract inner → call → rebuild outer. Implemented in `desugar_expr(Call)`.

**Rule 4 — Statement-Level**: `f(&x, args...);` → `def (x, _) = f(x, args...);`. The result `_` discards the return value.

**Rule 5 — Statement Rebind**: `&p = expr;` → `def p = expr;`. `&p { f = v }` → `def p = p { f = v };`.

#### Borrow Recursion (Micro-Block Flattening)

**Problem**: When a borrow call appears in an expression context (pipeline `&acc -> loop(n-1)`), `desugar_expr(Call)` wraps it in a micro-block:
```
{
  def %_btmp = loop(n-1, acc);   // call without borrow arg
  def acc = %_btmp.0;            // acc rebind from tuple
  %_btmp.1                       // result
}
```
The `acc` rebind is scoped to the micro-block — recursive iterations can't see it.

**Solution**: `desugar_block` flattens these micro-blocks. When a statement desugars to a `Block` (micro-block), its contents are extracted into the outer block's statement list:
```
// Before flattening (micro-block content NOT visible outside):
stmt1: &acc { value = ... }
stmt2: { def %_btmp = loop(n-1, acc); def acc = %_btmp.0; %_btmp.1 }

// After flattening (all at outer scope):
stmt1: def acc = acc { value = ... }
stmt2: def %_btmp = loop(n-1, acc)
stmt3: def acc = %_btmp.0          // ← acc rebind visible for NEXT iteration
stmt4: %_btmp.1
```

**Pipeline → Call re-desugar**: `desugar_expr(Pipeline)` must recursively call `desugar_expr` on the resulting `Call` to trigger borrow call desugar. Previously it returned `Expr::Call(call)` directly, skipping borrow expansion.

### 5.6 Pipeline

```
acc -> f(x, y)
```
↓ Desugar
```
Expr::Call(f, [Value(x), Value(y), Value(acc)])
```
The piped value is appended as the LAST argument to the call.

**Borrow pipeline**:
```
&acc -> loop(n - 1)
```
↓ Desugar
```
// is_borrow = true (original p.value is Expr::Borrow)
Call(loop, [Value(n-1), ExprArg::Borrow(&acc)])
  → then desugar_expr(Call) → borrow call expansion
```

### 5.8 def Binding

**def (zero-arg, non-rec)**: compiled as `thunk @name`. Forces insert `force{} @name`.

**def rec**: name is pre-registered in top-level scope (nameres first pass). IR gen creates a self-referential thunk: `thunk @name` with `force{} @name` in its body.

**Shadowing**: `def x = expr; def x = expr2` — each `def` creates a new binding that shadows the previous. Shadowed thunks remain accessible via their original name in earlier bindings.

---

## 6. Control Flow

### 6.1 match

**Bool match** (from `if/else` desugar):
```
match cond { true => then_body, false => else_body }
```
↓ IR Gen (`compile_match_bool`)
```
%cond_reg = ... (scrutinee)
br %cond_reg L_true L_false
L_true:
  %true_reg = ... (then_body)
  jmp merge
L_false:
  %false_reg = ... (else_body)
  jmp merge
merge:
  %result = phi [%true_reg L_true] [%false_reg L_false]
```

**Enum match** (n arms):
```
match e { Variant1 => ..., Variant2 => ..., VariantN => ... }
```
↓ IR Gen (`compile_match_enum`)
```
%disc = enum_disc %e
// Chain: for each arm i, eq(disc, i) → br to arm_i or fall through
%t0 = eq %disc 0; br %t0 L_arm0 L_test1
%t1 = eq %disc 1; br %t1 L_arm1 L_test2
...
// Last arm: unconditional jump
jmp L_armN

// Each arm body compiled and terminated with jmp merge
// merge block with Phi across all arms
```

**Pattern destructuring** (`resolve_match_pattern`):
- `Pattern::Var(v)` → bind scrutinee register to `v`
- `Pattern::Variant(VariantPattern { name, payload })` → emit `enum_proj` per payload pattern
- `Pattern::Struct(StructPattern { name, fields })` → check if name is enum variant → emit `enum_proj` per field by name lookup in TypeTable

### 6.2 if/else

Desugared to `match` on `Bool`:
```
if cond { then } else { else }
  ↓ desugar_expr
match cond { true => then, false => else }
```
The resulting `Expr::Match` is then compiled by `compile_match_bool` (see §6.1).

---

## 8. I/O System

### stdout

Implemented as `Instr::Stdout(reg)`. In the evaluator:
```rust
Value::Int(n)  => print!("{}", n),    // no newline
Value::Bool(b) => print!("{}", ...),  // no newline
Value::Char(c) => print!("{}", c),    // no newline
io::stdout().flush().ok();
```
Output is flushed immediately (IO functions are strict).

### stdin

Implemented as `Instr::Stdin(reg)`:
```rust
let mut line = String::new();
io::stdin().lock().read_line(&mut line).ok();
let val = if let Ok(n) = trimmed.parse() { Value::Int(n) } else { Value::Int(0) };
frame.set(reg, val);
```

### Built-in Registration

`stdout`, `stdin`, and `not` are registered as built-in names in the name resolver (`Scope::insert` at program start). The IR gen recognizes `stdout`/`stdin` calls and emits `Instr::Stdout`/`Instr::Stdin` directly (no function call overhead).

### Interpreter Footer

After evaluation completes, the evaluator prints to stderr:
```
eprintln!("\nProgram dew-IR successfully interpreted.");
```
This does not affect test output (tests validate stdout only).

---

## 10. Standard Library

### Auto-Include

The compiler prepends stdlib source files (`stdlib/*.dew`) to user programs before parsing:
```rust
fn load_stdlib() -> Result<String, String> {
    // reads stdlib/ directory, concatenates all .dew files
}
```
`run_file`, `run_eval`, and `run_repl` all call `load_stdlib()` before compilation.

### println

Defined in `stdlib/io.dew`:
```dew
def println = fn(&x: Int) { x -> stdout; '\n' -> stdout };
```
The `&x` borrow parameter causes `println(42)` to desugar to `def (x, _) = println(42)`. The function body outputs `x` then a newline. Purely syntactic — the type checker and IR gen see only `stdout` instructions.
