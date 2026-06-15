# Dew IR Specification

> **Canonical specification** for the Dew Thunk Graph IR.
> This document describes the IR design; the implementation lives in `src/ir.rs`, `src/ir_gen.rs`, `src/eval.rs`.
> Last updated: 2026-06-15.

[§1 Architecture](#1-architecture) ·
[§2 Module](#2-module) ·
[§3 Items](#3-items) ·
[§4 Thunk](#4-thunk) ·
[§5 Basic Block](#5-basic-block) ·
[§6 Registers & Labels](#6-registers-and-labels) ·
[§7 Types](#7-types-ir-level) ·
[§8 Instructions](#8-instructions--complete-reference) ·
[§9 Accessor Paths](#9-accessor-paths) ·
[§10 Text Format](#10-text-format) ·
[§11 JSON](#11-json-serialization) ·
[§12 Optimizations](#12-optimization-levels) ·
[§13 Evaluator](#13-evaluator-integration) ·
[§14 Gen Context](#14-generation-context) ·
[§15 Thunk Graph](#15-thunk-graph-model) ·
[§16 Examples](#16-source--ir-examples)

The Dew Thunk Graph IR (v2) is a flat, label-based, SSA-like intermediate representation. It sits between the Dew AST and the evaluator, serving as the compilation target for Dew source and (in the future) other frontends like Rx.

---

## 1. Architecture

```
Dew Source ──► Parser ──► AST ──► IR Gen ──► IR Module ──► Evaluator ──► Value
                                          │
                                    Strictness Analysis
```

The IR is structured in three levels:

| Level | Type | Description |
|-------|------|-------------|
| Module | `Module` | Ordered list of top-level items |
| Thunk | `Thunk` | Named entity with basic blocks (like an LLVM function) |
| Instruction | `Instr` | Flat single-operation instruction within a block |

> The three-level structure mirrors LLVM's Module → Function → BasicBlock hierarchy, a proven design for compiler IRs. The key difference is that Dew's "functions" are thunks — they carry implicit laziness semantics. The flat, SSA-like instruction model enables future optimization passes without redesigning the IR. Labels (not pointers) for thunk references avoid the complexity of memory management in the IR itself.

---

## 2. Module

```rust
struct Module {
    items: Vec<Item>,
}
```

The module is the top-level IR container. Items are processed in order by the evaluator.

**Serialization**: `Module::to_json()` produces a JSON string via serde.

**Text format**: Each item is printed on its own line(s), 2-space indent.

---

## 3. Items

```rust
enum Item {
    Thunk(Thunk),
    Alloc(Label),
    ThunkDef { label: Label, thunk: String },
    Force { dest: Label, src: Label },
    Update { label: Label, value: ValueRef },
    Def { name: String, label: Label },
    StrictDef { name: String, blocks: Vec<BasicBlock> },
    FnDef { name: String, params: Vec<String>, blocks: Vec<BasicBlock> },
}
```

### 3.1 `Thunk`

Defines a named thunk with parameters, return type, and basic blocks. This is the IR equivalent of a top-level `def` with a function value.

> Thunks are the IR unit of laziness. Every `def` in Dew source produces a thunk (or a StrictDef optimization). The thunk encapsulates: what computation to run (blocks), what it depends on (params), and what it produces (ret_ty). By making thunks the primary IR entity rather than an annotation on functions, the evaluator can uniformly handle all lazy values — whether they come from top-level definitions, closures, or recursive self-references.

```
thunk @name(param1: Ty, param2: Ty) {
  entry:
    ...
}
```

### 3.2 `Alloc`

Allocates a new thunk cell with the given label. The cell starts in Suspended state.

```
alloc %t0
```

### 3.3 `ThunkDef`

Binds an allocated label to a named thunk. The thunk's blocks are stored under the name; the label references the cell.

```
thunk_def %t0 @thunk_name
```

### 3.4 `Force`

Forces evaluation of a thunk. If the thunk is Suspended, evaluation proceeds; if Evaluated, returns cached value.

```
force %dest %src
```

### 3.5 `Update`

Updates a thunk's value. Used to implement call-by-need: after forcing a thunk, its computed value is written back to the cell.

```
update %label 42
update %label %other_label
```

### 3.6 `Def`

Creates a top-level binding: associates a name with a label.

```
def counter %t0
```

### 3.7 `StrictDef`

Defines a strict (non-lazy) binding with inline basic blocks. Used for zero-argument, non-recursive definitions (O1 optimization).

```
strict_def name {
  entry:
    ...
}
```

### 3.8 `FnDef`

Defines a function binding with named parameters and inline basic blocks. Used for non-zero-argument, non-recursive definitions (O1 optimization).

```
fn_def name(param1, param2) {
  entry:
    ...
}
```

---

## 4. Thunk

```rust
struct Thunk {
    name: String,
    params: Vec<(String, Ty)>,
    ret_ty: Ty,
    blocks: Vec<BasicBlock>,
}
```

A thunk is a named computation with typed parameters and a return type. It contains one or more basic blocks.

---

## 5. Basic Block

```rust
struct BasicBlock {
    label: String,
    instrs: Vec<Instr>,
    term: Terminator,
}
```

A basic block is a straight-line sequence of instructions ending with a terminator. Blocks are identified by string labels (e.g., `"entry"`, `"L0"`, `"L1"`).

### 5.1 Terminators

```rust
enum Terminator {
    Ret(Reg),                                           // return value
    Br { cond: Reg, then_label: String, else_label: String }, // conditional branch
    Jmp(String),                                        // unconditional jump
}
```

| Terminator | Text | Semantics |
|-----------|------|-----------|
| `Ret(r)` | `ret %r` | Return value from thunk |
| `Br { cond, then, else }` | `br %cond Lthen Lelse` | Branch on boolean |
| `Jmp(label)` | `jmp Ltarget` | Unconditional jump |

---

## 6. Registers and Labels

### 6.1 Registers

```rust
struct Reg(pub usize);
```

Registers are virtual (unbounded). They are SSA-like: each register is assigned exactly once. Displayed as `%0`, `%1`, `%2`, etc.

Generated by `GenCtx::fresh_reg()`.

### 6.2 Labels

```rust
struct Label(pub String);
```

Labels identify thunk cells in the heap. Displayed as `%t0`, `%t1`, etc.

Generated by `GenCtx::fresh_label()`.

### 6.3 Block Labels

String labels (`"entry"`, `"L0"`, `"L1"`) identify basic blocks within a thunk. Generated by `GenCtx::fresh_block_label()`.

### 6.4 Value References

```rust
enum ValueRef {
    Lit(Lit),         // literal value
    Label(Label),     // reference to another thunk
}
```

Used in `Update` items to specify the new value.

---

## 7. Types (IR Level)

```rust
enum Ty {
    Int, Bool, Char, Unit,
    Named(String),              // user-defined type name
    Fun(Box<Ty>, Box<Ty>),      // function type
    Tuple(Vec<Ty>),             // tuple type
    Array(Box<Ty>, usize),      // array type with size
}
```

IR types are a subset of source types — no type variables (inference happens before IR gen).

---

## 8. Instructions — Complete Reference

### 8.1 Literals and Variables

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `Lit` | `dest, value: Lit` | `%r = lit 42` | Load literal into register |
| `Var` | `dest, name: String` | `%r = var @x` | Reference named binding |
| `Ref` | `dest, label: String` | `%r = ref %L0` | Reference a label (thunk pointer) |

### 8.2 Functions

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `Lambda` | `dest, thunk, param_tys, ret_ty` | `%r = lambda @name(x: Int)` | Create closure referencing named thunk |
| `LambdaBlock` | `dest, params, blocks` | `%r = lambda(x, y) { ... }` | Create closure with inline blocks |
| `Bind` | `name, value: Reg` | `bind @x %r` | Bind name to register value |
| `Call` | `dest, func, args` | `%r = call %f %a %b` | Call function with arguments |

### 8.3 Arithmetic

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `Add` | `dest, lhs, rhs` | `%r = add %a %b` | `%r := %a + %b` |
| `Sub` | `dest, lhs, rhs` | `%r = sub %a %b` | `%r := %a - %b` |
| `Mul` | `dest, lhs, rhs` | `%r = mul %a %b` | `%r := %a * %b` |
| `Div` | `dest, lhs, rhs` | `%r = div %a %b` | `%r := %a / %b` (integer division) |
| `Rem` | `dest, lhs, rhs` | `%r = rem %a %b` | `%r := %a % %b` |

### 8.4 Comparison

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `Lt` | `dest, lhs, rhs` | `%r = lt %a %b` | `%r := %a < %b` |
| `Gt` | `dest, lhs, rhs` | `%r = gt %a %b` | `%r := %a > %b` |
| `Le` | `dest, lhs, rhs` | `%r = le %a %b` | `%r := %a <= %b` |
| `Ge` | `dest, lhs, rhs` | `%r = ge %a %b` | `%r := %a >= %b` |
| `Eq` | `dest, lhs, rhs` | `%r = eq %a %b` | `%r := %a == %b` |
| `Ne` | `dest, lhs, rhs` | `%r = ne %a %b` | `%r := %a != %b` |

### 8.5 Logic

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `And` | `dest, lhs, rhs` | `%r = and %a %b` | `%r := %a && %b` |
| `Or` | `dest, lhs, rhs` | `%r = or %a %b` | `%r := %a \|\| %b` |
| `Not` | `dest, arg` | `%r = not %a` | `%r := !%a` |

### 8.6 Memory Access — Fetch and Place

```rust
enum Accessor {
    Array(Reg),     // array index
    Field(String),  // struct field name
    Tuple(usize),   // tuple element index
}
```

#### `Fetch`

```
%r = fetch %base .field1 [%idx] .field2
```

Walks the accessor path on the base value. Each accessor selects a sub-value:
- `.field` — struct field by name
- `[%idx]` — array element by index
- `.N` — tuple element by index

#### `Place`

```
%r = place %base .field [%idx] = %value
```

Creates a new value equal to `%base` but with the value at the given path replaced by `%value`. Returns the new value. The original `%base` is consumed (affine type system).

The path is walked left-to-right: each accessor selects a sub-value of the previous result. The final accessor's position receives the new value.

**Example**: `place %arr [%i] .x = %new_val`
1. Walk: `%arr` → `[%i]` → `.x`
2. This means: update `%arr[%i].x` to `%new_val`
3. Implementation: `ArrayUpdate(arr, i, StructUpdate(arr[i], [("x", new_val)]))`

### 8.7 Structure Construction

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `Field` | `dest, expr, field: String` | `%r = field %e .x` | Extract field from struct |
| `StructCons` | `dest, name, fields` | `%r = struct @Point %x %y` | Construct struct value |
| `EnumCons` | `dest, enum_name, variant, payload` | `%r = enum @Option::Some %v` | Construct enum variant |
| `ArrayLit` | `dest, elements` | `%r = array %a %b %c` | Construct array value |
| `TupleLit` | `dest, elements` | `%r = tuple %a %b` | Construct tuple value |

### 8.8 Structure Update

| Instruction | Operands | Text | Semantics |
|------------|----------|------|-----------|
| `StructUpdate` | `dest, expr, updates` | `%r = struct_update %s .x=%a .y=%b` | Create new struct with updated fields |
| `ArrayAccess` | `dest, expr, index` | `%r = array_access %a %i` | Read array element |
| `ArrayUpdate` | `dest, expr, index, value` | `%r = array_update %a %i %v` | Create new array with updated element |
| `TupleUpdate` | `dest, expr, index, value` | `%r = tuple_update %t 0 %v` | Create new tuple with updated element |

### 8.9 Complete Instruction List (33 total)

```
Lit, Var, Ref                           — literals and references
Lambda, LambdaBlock, Bind, Call          — functions
Add, Sub, Mul, Div, Rem                  — arithmetic
Lt, Gt, Le, Ge, Eq, Ne                   — comparison
And, Or, Not                             — logic
Fetch, Place                             — GEP-like path access
Field                                    — field extraction
StructCons, EnumCons, ArrayLit, TupleLit — construction
StructUpdate, ArrayAccess, ArrayUpdate, TupleUpdate — mutation/update
```

---

## 9. Accessor Paths

Accessor paths are used by `Fetch` and `Place` to navigate compound data structures:

```rust
enum Accessor {
    Array(Reg),     // dynamic index (register value)
    Field(String),  // static field name
    Tuple(usize),   // static tuple index
}
```

Paths are sequences of accessors applied left-to-right:
```
%r = fetch %base .field_name [%idx] .subfield .0
```
This is equivalent to: `base.field_name[idx].subfield.0`

### 9.1 Place Path Semantics

`Place` with a multi-element path creates a nested update:

```
%r = place %arr [%i] .x = %v
```

This desugars to:
```
ArrayUpdate(arr, i, StructUpdate(ArrayAccess(arr, i), [("x", v)]))
```

The evaluator implements this as a copy-on-write traversal: the base is copied, the path is traversed to the target, and the new value is inserted. All intermediate copies are created fresh.

---

## 10. Text Format

The IR text format uses 2-space indentation:

```
thunk @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = add %0 %1
    ret %2
}

alloc %t0
thunk_def %t0 @main
force %result %t0
```

### 10.1 Formatting Rules

- Block labels end with `:`
- Instructions are indented 2 spaces within blocks
- Terminators are at the same indent level as instructions
- Items are separated by blank lines
- Registers: `%N` (N is a non-negative integer)
- Labels: `%tN` or `%name`

---

## 11. JSON Serialization

All IR types derive `Serialize` and `Deserialize` from serde. The module can be emitted as JSON:

```rust
let json = module.to_json();
// {"items":[{"Thunk":{"name":"main",...}},...]}
```

JSON emission is controlled by `--emit=json` CLI flag.

---

## 12. Optimization Levels

### O0 (Default)

- No optimizations
- All top-level `def` bindings produce thunks
- All function values produce closures

### O1

> O1 is intentionally conservative — only optimizations that are provably safe. `StrictDef` and `FnDef` merely skip the thunk allocation/force cycle when the compiler can prove the definition is non-recursive. No speculative optimizations, no inlining, no dead code elimination. This keeps the O0→O1 behavior change minimal and auditable. Aggressive optimizations (O2+) are deferred until real program profiles demonstrate their necessity.

| Optimization | Trigger | Effect |
|-------------|---------|--------|
| `StrictDef` | Zero-arg, non-recursive `def` | Emits inline blocks, no thunk allocation |
| `FnDef` | Non-zero-arg, non-recursive `def` | Emits inline blocks with named params |
| Lambda wrapper elimination | All opt levels | `emit_thunk_chain` detects `Expr::Fn` and compiles body directly |
| Parametric thunk force | Thunk has params | `force_thunk` creates `Closure` for recursive fn support |

`StrictDef` and `FnDef` eliminate the thunk allocation/force cycle for simple non-recursive definitions, improving performance.

---

## 13. Evaluator Integration

### 13.1 Thunk Heap

The evaluator maintains a `HashMap<Label, ThunkState>` mapping labels to their current state:

```rust
enum ThunkState {
    Suspended { blocks: Option<Vec<BasicBlock>>, params: Option<Vec<String>> },
    Evaluating,
    Evaluated(Value),
}
```

### 13.2 Evaluation Loop

1. Process items in module order
2. `Alloc`: insert `Suspended(None, None)` into heap
3. `ThunkDef`: look up label, store blocks under thunk name
4. `Force`: look up label state:
   - `Suspended`: mark `Evaluating`, evaluate blocks, transition to `Evaluated`
   - `Evaluating`: blackhole detected — report cycle error
   - `Evaluated`: return cached value
5. `Update`: replace label's heap entry with new value
6. `Def` / `StrictDef` / `FnDef`: bind name to value in environment

### 13.3 Block Walking

Each block is walked sequentially:
1. Evaluate each instruction, updating the register file
2. At the terminator:
   - `Ret(r)`: return register value
   - `Br { cond, then, else }`: jump to then_label or else_label
   - `Jmp(label)`: jump to target label

### 13.4 Instruction Evaluation

Instructions are evaluated with a match on the instruction variant. Each instruction reads source registers, performs its operation, and writes the result to the destination register.

**Key evaluation rules**:
- Arithmetic/comparison: evaluate both operands, apply Rust operator
- `Fetch`: walk accessor path on base value using `fetch_path()`
- `Place`: walk accessor path, perform copy-on-write, return new value
- `Call`: force function thunk, create closure environment, evaluate body
- `StructCons`: evaluate all field expressions, construct struct value
- `ArrayUpdate`: copy array, replace element at index, return new array

---

## 14. Generation Context

```rust
struct GenCtx {
    next_reg: usize,     // counter for fresh registers
    next_label: usize,   // counter for fresh labels
}
```

Provides monotonic counters for register and label allocation. Used by the IR generator during AST→IR compilation.

---

## 15. Thunk Graph Model

The IR represents computations as a **graph of thunks**:

- Each `Thunk` is a node in the graph
- `Force` edges connect thunks (forcing one thunk may force others)
- `Update` edges represent memoization (caching computed values)
- `Call` edges represent function application

The graph is evaluated lazily: thunks are only forced when their values are demanded. The blackhole mechanism detects cycles (e.g., `def x = x + 1` would create a cycle when forced).

### 15.1 Recursion

Recursive definitions use **thunk self-reference**. Within a thunk's body, `Ref(label)` creates a reference to the thunk's own cell, enabling recursive calls.

### 15.2 Closure Resource

The IR generator infers the closure's Resource property from captured variables:
- Captures an affine variable → `FnOnce` (can be called at most once)
- Pure (no affine captures) → `Fn` (unrestricted)

---

## 16. Source → IR Examples

Each example shows a Dew source program and its corresponding IR text output. Use `--emit=text` to generate these.

### 16.1 Simple Arithmetic

**Source:**
```dew
def main = fn -> Unit { Stdout(40 + 2) }
```

**IR:**
```
thunk @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = add %0 %1
    ret %2
}

alloc %t0
thunk_def %t0 @main
force %result %t0
```

> The `ret` in `main` thunk has type `Unit`. In practice, the evaluator uses the returned value for `Stdout` call dispatch. The `alloc → thunk_def → force` chain is the standard pattern for top-level definitions.

### 16.2 Function Definition and Call

**Source:**
```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
def main = fn -> Unit { Stdout(add(40, 2)) }
```

**IR:**
```
thunk @add(x: Int, y: Int) {
  entry:
    %0 = var @x
    %1 = var @y
    %2 = add %0 %1
    ret %2
}

thunk @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = lambda @add(x: Int)
    %3 = call %2 %0 %1
    ret %3
}

alloc %t0
thunk_def %t0 @add
def add %t0
alloc %t1
thunk_def %t1 @main
force %result %t1
def main %result
```

> `lambda` creates a closure referencing the named thunk. `call` invokes the closure with arguments. The `def` item binds the result to a top-level name.

### 16.3 Recursive Function

**Source:**
```dew
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}
def main = fn -> Unit { Stdout(fact(5)) }
```

**IR:**
```
thunk @fact(n: Int) {
  entry:
    %0 = var @n
    %1 = lit 0
    %2 = eq %0 %1
    br %2 L0 L1
  L0:
    %3 = lit 1
    ret %3
  L1:
    %4 = var @n
    %5 = lit 1
    %6 = sub %4 %5
    %7 = ref @fact
    %8 = call %7 %6
    %9 = mul %4 %8
    ret %9
}

thunk @main() {
  entry:
    %0 = lit 5
    %1 = ref @fact
    %2 = call %1 %0
    ret %2
}

alloc %t0
thunk_def %t0 @fact
def fact %t0
alloc %t1
thunk_def %t1 @main
force %result %t1
def main %result
```

> Recursive self-reference uses `ref @fact` within the thunk's own body. The `br` terminator with multiple block labels enables conditional control flow. `L0` and `L1` are the then/else branches.

### 16.4 Struct Construction and Field Access

**Source:**
```dew
struct Point { x: Int, y: Int }
def main = fn -> Unit {
  def p = Point(3, 4);
  Stdout(p.x + p.y)
}
```

**IR:**
```
thunk @main() {
  entry:
    %0 = lit 3
    %1 = lit 4
    %2 = struct @Point %0 %1
    bind @p %2
    %3 = var @p
    %4 = fetch %3 .x
    %5 = var @p
    %6 = fetch %5 .y
    %7 = add %4 %6
    ret %7
}

alloc %t0
thunk_def %t0 @main
force %result %t0
def main %result
```

> `struct` creates a struct value with positional fields. `fetch` with `.x` / `.y` accessors reads fields. `bind` introduces a local name binding within the block.

### 16.5 Lazy Evaluation: Thunk Chain

**Source:**
```dew
def x = 40 + 2       // lazy — not evaluated until forced
def main = fn -> Unit { Stdout(x) }
```

**IR:**
```
thunk @x() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = add %0 %1
    ret %2
}

thunk @main() {
  entry:
    %0 = ref @x
    ret %0
}

alloc %t0
thunk_def %t0 @x
def x %t0
alloc %t1
thunk_def %t1 @main
force %result %t1
def main %result
```

> `def x = 40 + 2` produces a thunk `@x` that is NOT forced at definition time. `main` references `x` via `ref @x` — the evaluator forces `x` only when `main` is forced and its body demands the value. This is the fundamental lazy evaluation mechanism.

### 16.6 If/Else Branching

**Source:**
```dew
def main = fn -> Unit {
  Stdout(if 1 > 0 { 10 } else { 20 })
}
```

**IR:**
```
thunk @main() {
  entry:
    %0 = lit 1
    %1 = lit 0
    %2 = gt %0 %1
    br %2 L0 L1
  L0:
    %3 = lit 10
    jmp L2
  L1:
    %4 = lit 20
    jmp L2
  L2:
    %5 = phi [%3, L0] [%4, L1]
    ret %5
}

alloc %t0
thunk_def %t0 @main
force %result %t0
def main %result
```

> `br` splits control flow into then/else blocks. `jmp` rejoins at the merge block `L2`. The `phi` instruction selects the correct value based on which predecessor block was executed — this is the standard SSA approach to conditional values.

---

## 17. Dependency Graph

```
ir.rs ──► serde (Serialize, Deserialize)
   │
   ├──► ir_gen.rs (AST → IR compilation)
   │       ├── ast.rs
   │       ├── strictness.rs
   │       └── diagnostics.rs
   │
   ├──► eval.rs (IR evaluation)
   │       ├── value.rs
   │       └── diagnostics.rs
   │
   └──► main.rs (--emit=text|json)
```
