# Dew IR Specification

> **Canonical specification** for the Dew Thunk Graph IR.
> All primitives use `snake_case` naming. Target: rv64gc (primary), x86-64 (secondary).
> Last updated: 2026-06-16.

- [§1 Architecture](#1-architecture)
- [§2 Module](#2-module)
- [§3 fn](#3-fn)
- [§4 thunk](#4-thunk)
- [§5 Basic Block](#5-basic-block)
- [§6 Registers and Labels](#6-registers-and-labels)
- [§7 Types](#7-types-ir-level)
- [§8 Instructions](#8-instructions--complete-reference)
- [§9 Accessor Paths](#9-accessor-paths)
- [§10 Text Format](#10-text-format)
- [§11 JSON](#11-json-serialization)
- [§12 Optimizations](#12-optimization-levels)
- [§13 Evaluator](#13-evaluator-integration)
- [§14 Source → IR Examples](#14-source--ir-examples)

The Dew IR is a flat, label-based, SSA-like intermediate representation. It has two kinds of top-level definitions: **fns** (ordinary functions) and **thunks** (lazy memoized values).

---

## 1. Architecture

```
Dew Source → Parser → AST → Desugar → Type Check → Strictness → IR Gen → Module ──► Evaluator (tree-walking)
                                                                              ──► Asm (rv64gc / x86-64)
```

| Level | Type | Description |
|-------|------|-------------|
| Module | `Module` | Fns + thunks — all top-level definitions |
| Fn / Thunk | `Fn` / `Thunk` | Named entity with basic blocks |
| Instruction | `Instr` | Flat single-operation instruction within a block |

### 1.1 IR Philosophy

**No pointers, no addresses, no `alloca`.** The Dew IR is a pure functional intermediate representation. All safety analysis (affine checking, provenance tracking, pointer aliasing) occurs in the type system layer above the IR. The IR sees only verified, safe computation.

- **Memory allocation** is owned by the asm backend. `struct_cons` and `array_lit` produce values; the backend determines layout from the module's type table.
- **Scalar values are 64-bit** in registers (`Int`, `Bool`, `Char`, pointers). Aggregates (structs, tuples, arrays) are stack-allocated. Memory layout comes from the type table at codegen time.
- **No type annotations on instructions.** IR types are monomorphic — all generic parameters are resolved before IR generation. Instruction return types are determined by the instruction itself (`add` → Int, `tuple_lit` → tuple) or by the type table (`fetch %p .x` → depends on field `x`'s type). A single instruction line is not self-describing; the module as a whole (types + fns + thunks) is complete.

---

## 2. Module

The module contains all definitions, a type table, and the entry point. Execution always starts at `@main`:

```
module:
  types: [TypeDef]     // struct/enum/array layouts
  fns: [Fn]            // ordinary functions (parametrized pure, IO)
  thunks: [Thunk]      // lazy memoized values (pure zero-arg only)
```

**Type table.** The `types` section defines the memory layout of every aggregate type used in the program. Fns and thunks reference types by name (`@Point`, `@Option::Some`); the type table provides field offsets, discriminant tags, element sizes, and alignment. Emitted alongside fns and thunks in `--emit=text` mode for debugging. The asm backend reads the same table to determine stack layouts and register packing.

> The type table is part of the IR module, not a separate artifact. It is generated during type checking and consumed by both the evaluator (for field access) and the asm backend (for memory layout). Struct/enum definitions do not appear as IR instructions — the IR references names; the type table provides the structural details.

### 2.1 Type Table Format

The type table uses the same syntax as Dew source — no separate notation:

```
struct Point {
  x: Int,
  y: Int,
}

enum Option {
  None,
  Some(Int),
}
```

**Struct field names** matter: `fetch %p .x` and `struct_update %p .x=%v` reference fields by name, not by position. The type table maps names to byte offsets. **Enum variant names** matter: `enum_proj @Option::Some %e` references the variant by name. Discriminant tags (0, 1, 2...) are assigned automatically in declaration order — not written explicitly.

The evaluator registers all definitions, then starts execution at `@main`. If `@main` is an `fn`, it is called; if `@main` is a `thunk`, it is forced. If `@main` does not exist, report `[E007]`.

> **Why two definition kinds?** Thunks are lazy cells with a 3-state FSM (suspended, evaluating, evaluated). Fns are ordinary functions — called directly, no cell, no memoization. This split reflects the Dew source: `def x = expr` (pure, zero-arg) produces a thunk; everything else produces an fn.

---

## 3. fn

An `fn` is an ordinary function — called directly, no cell, no state machine. Parameters map to registers by position.

```
fn @add(x: Int, y: Int) {
  entry:
    %0 = add %0 %1      // %0 = x, %1 = y (positional)
    ret %0
}

fn @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call @add %0 %1
    stdout_int %2
}
```

**Call convention:** `call @name %args` invokes the fn directly. No thunk cell allocation, no state check. Fns include:
- IO functions (`@main`, any function calling `stdin`/`stdout`)
- Parameterized pure functions (`@add`, `@fact`)
- Functions producing closures (`lambda @name`)

> **Why no cell?** IO functions must execute every time (no caching). Parameterized pure functions depend on their arguments — caching per argument set would require a memo table, not a simple thunk cell. Both are simpler as direct calls.

---

## 4. thunk

A `thunk` is a pure zero-argument lazy value. It has a cell with a 3-state FSM:

```
suspended ──force──► evaluating ──complete──► evaluated(value)
                         │
                         │ self-force
                         ▼
                      cycle error
```

```
thunk @x() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = add %0 %1
    ret %2
}
```

**Force convention:** `force @name` reads the thunk cell:
- `suspended` → evaluate blocks, write result, transition to `evaluated`
- `evaluating` → cycle detected, error
- `evaluated` → return cached value

> **Only pure zero-arg `def` produces a thunk.** `def x = 40 + 2` is the canonical example. The value is computed once and cached. IO definitions and parameterized functions are always `fn`.

---

## 5. Basic Block

A basic block is a straight-line sequence of instructions ending with a terminator. Blocks are identified by string labels (`"entry"`, `"L0"`, `"L1"`).

### 5.1 Terminators

| Terminator | Text | Semantics |
|-----------|------|-----------|
| `ret` | `ret %r` | Return value from fn/thunk |
| `br` | `br %cond L_then L_else` | Branch on boolean |
| `jmp` | `jmp L_target` | Unconditional jump |

---

## 6. Registers and Labels

### 6.1 Registers

Virtual (unbounded), SSA-like — each register assigned exactly once. Displayed as `%0`, `%1`, `%2`.

### 6.2 Parameters

Parameters map to registers by position: `%0` = first param, `%1` = second, etc. Parameter names in `fn` signatures are for documentation only — the IR body uses register numbers exclusively.

### 6.3 Block Labels

String labels (`"entry"`, `"L0"`, `"L1"`) identify basic blocks within a fn or thunk.

---

## 7. Types (IR Level)

IR types are a subset of source types — no type variables (monomorphized before IR gen):

| IR Type | Text | Source Equivalent |
|---------|------|-------------------|
| `int` | `Int` | `Int` |
| `bool` | `Bool` | `Bool` |
| `char` | `Char` | `Char` |
| `unit` | `Unit` | `Unit` |
| `named(s)` | `Point` | `struct Point { ... }` |
| `fun(a, r)` | `Int -> Bool` | `(Int) -> Bool` |
| `tuple(ts)` | `(Int, Bool)` | `(Int, Bool)` |
| `array(t, n)` | `Array(Char, 5)` | `Array(Char, 5)` |

> **Scalar values are 64-bit** in registers. `Int`, `Bool`, `Char`, pointers, and thunk references occupy a single 64-bit GPR. Aggregates (structs, tuples, arrays) are stack-allocated. `Unit` is zero-width — eliminated at codegen. Memory layout is determined by the type table at codegen time.

---

## 8. Instructions — Complete Reference

All instructions follow SSA form: `%dest = op arg1 arg2 ...`.

### 8.1 Literals

| Instruction | Text | Semantics |
|------------|------|-----------|
| `lit` | `%r = lit 42` | Load integer literal |
| `lit` | `%r = lit true` | Load Bool literal (`true` = 1, `false` = 0) |
| `lit` | `%r = lit '字'` | Load Char literal (Unicode scalar value) |

> **Why `lit` exists despite LLVM not needing it.** LLVM allows immediate operands on any instruction (`add i64 %0, 42`). Dew IR requires all operands to be registers — `lit` is the only way to introduce a constant. This keeps the evaluator simple: every instruction operand is a `Reg`, never an immediate. The asm backend folds `lit`+`add` into `addi` as an independent optimization pass, not as an IR concern.
>
> All literal values are 64-bit. `Bool` and `Char` literals are syntactic sugar for their integer representations — the type table determines how they are stored in memory (1 byte for Bool, 4 bytes for Char), but in registers they occupy a full 64-bit GPR.

### 8.2 I/O

| Instruction | Text | Semantics |
|------------|------|-----------|
| `stdout_int` | `stdout_int %r` | Write register as decimal integer |
| `stdout_char` | `stdout_char %r` | Write register as Unicode character |
| `stdout_bool` | `stdout_bool %r` | Write register as "true" / "false" |
| `stdin_int` | `%r = stdin_int` | Read decimal integer from stdin |
| `stdin_char` | `%r = stdin_char` | Read one character from stdin |

> **Why per-type instructions?** The IR has no type annotations on instructions, but output/input behavior depends on type. `stdout_int` prints decimal, `stdout_char` prints a glyph. Using instruction variants keeps the evaluator simple — match directly without type table lookups — and preserves the "no type annotations" philosophy. The IR generator selects the correct variant based on the source type resolved at IR gen time.

### 8.3 Functions

| Instruction | Text | Semantics |
|------------|------|-----------|
| `lambda` | `%r = lambda @name(x: Int)` | Create closure referencing named fn |
| `lambda_block` | `%r = lambda(x, y) { ... }` | Create closure with inline blocks |
| `call` | `%r = call @name %a %b` | Call fn by name |
| `call` | `%r = call %f %a %b` | Call closure by register |
| `force` | `%r = force @name` | Force lazy thunk |

> **`lambda` vs direct `call`:** `call @name %args` invokes an fn directly. `lambda @name` creates a runtime closure value — only needed when the function escapes its defining scope (returned, stored, passed as argument). `lambda_block` is an O1 optimization for non-escaping inline closures. `force @name` forces a thunk — only for pure zero-arg thunks.

### 8.4 Arithmetic

| Instruction | Text | Semantics |
|------------|------|-----------|
| `add` | `%r = add %a %b` | `%r := %a + %b` |
| `sub` | `%r = sub %a %b` | `%r := %a - %b` |
| `mul` | `%r = mul %a %b` | `%r := %a * %b` |
| `div` | `%r = div %a %b` | `%r := %a / %b` (integer division) |
| `rem` | `%r = rem %a %b` | `%r := %a % %b` |

### 8.5 Comparison

| Instruction | Text | Semantics |
|------------|------|-----------|
| `lt` | `%r = lt %a %b` | `%r := %a < %b` |
| `gt` | `%r = gt %a %b` | `%r := %a > %b` |
| `le` | `%r = le %a %b` | `%r := %a <= %b` |
| `ge` | `%r = ge %a %b` | `%r := %a >= %b` |
| `eq` | `%r = eq %a %b` | `%r := %a == %b` |
| `ne` | `%r = ne %a %b` | `%r := %a != %b` |

### 8.6 Logic

| Instruction | Text | Semantics |
|------------|------|-----------|
| `and` | `%r = and %a %b` | `%r := %a && %b` |
| `or` | `%r = or %a %b` | `%r := %a \|\| %b` |
| `not` | `%r = not %a` | `%r := !%a` |

### 8.7 Control Flow

| Instruction | Text | Semantics |
|------------|------|-----------|
| `phi` | `%r = phi [%v1, L1] [%v2, L2]` | Select value based on predecessor block |

The `phi` instruction is the standard SSA mechanism for merging values from different control flow paths.

### 8.8 Memory Access — `fetch` and `place`

Both use **accessor paths** to navigate compound data structures.

```
%r = fetch %base .field [%idx] .subfield
```

Walks the accessor path on the base value, returning the selected sub-value.

```
%r = place %base .field [%idx] = %value
```

Creates a new value equal to `%base` but with the value at the given path replaced by `%value`. Returns the new value. Copy-on-write: only the modified path is allocated fresh.

> **Why not LLVM's `getelementptr`?** GEP computes addresses; `load`/`store` access memory. Dew has no mutable memory — all values are immutable. `fetch`/`place` operate on values, not addresses. No pointers, no loads, no stores — this is a functional IR.

### 8.9 Structure Construction

| Instruction | Text | Semantics |
|------------|------|-----------|
| `field` | `%r = field %e .x` | Extract field from struct |
| `struct_cons` | `%r = struct @Point %x %y` | Construct struct value |
| `enum_cons` | `%r = enum @Option::Some %v` | Construct enum variant |
| `enum_disc` | `%r = enum_disc %e` | Read enum discriminant tag |
| `enum_proj` | `%r = enum_proj @Option::Some %e` | Extract variant payload |
| `array_lit` | `%r = array %a %b %c` | Construct array value |
| `tuple_lit` | `%r = tuple %a %b` | Construct tuple value |

> **Why per-type instructions?** Each aggregate type has different memory layout. `struct_cons` packs named fields at known offsets; `enum_cons` prepends a discriminant tag; `array_lit` packs N uniform elements at stride; `tuple_lit` packs heterogeneous elements contiguously.

### 8.10 Structure Update

| Instruction | Text | Semantics |
|------------|------|-----------|
| `struct_update` | `%r = struct_update %s .x=%a .y=%b` | New struct with updated fields |
| `array_access` | `%r = array_access %a %i` | Read array element |
| `array_update` | `%r = array_update %a %i %v` | New array with updated element |
| `tuple_update` | `%r = tuple_update %t 0 %v` | New tuple with updated element |

> **Why dedicated update instructions?** `array_access %a %i` is the common case — a single instruction the evaluator matches directly. `fetch %a [%i]` with an accessor path would also work but requires path parsing. The dedicated forms are sugar for the common patterns; `fetch`/`place` are the general mechanism.

---

## 9. Accessor Paths

Accessor paths navigate compound data structures in `fetch` and `place`:

| Accessor | Text | Meaning |
|----------|------|---------|
| `field(name)` | `.name` | Struct field by name |
| `array(%r)` | `[%idx]` | Array element by register index |
| `tuple(n)` | `.n` | Tuple element by literal index |

---

## 10. Text Format

2-space indentation. All names in `snake_case`.

```
fn @add(x: Int, y: Int) {
  entry:
    %0 = add %0 %1
    ret %0
}

thunk @x() {
  entry:
    %0 = lit 42
    ret %0
}

fn @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call @add %0 %1
    stdout_int %2
}
```

### 10.1 Formatting Rules

- Block labels end with `:`
- Instructions indented 2 spaces within blocks
- Terminators at the same indent level as instructions
- Blank line between definitions
- Registers: `%N`, parameters: `%0` = first, `%1` = second
- All names in `snake_case`

---

## 11. JSON Serialization

All IR types derive `Serialize`/`Deserialize`. JSON emission via `--emit=json`:

```json
{"types":[...], "fns":[...], "thunks":[...]}
```

Example type table entry:
```json
{"name":"Point","kind":"struct","fields":[{"name":"x","type":"Int","offset":0},{"name":"y","type":"Int","offset":8}],"size":16}
```

---

## 12. Optimization Levels

### O0 (Default)

- All `def` bindings produce thunks or fns as declared
- No inlining, no dead code elimination

### O1

| Optimization | Trigger | Effect |
|-------------|---------|--------|
| `lambda_block` | Non-escaping inline closure | Inline blocks, skip closure allocation |
| Thunk-to-fn | Zero-arg non-recursive with no consumer | Remove cell, emit as fn |

> O1 is intentionally conservative. No speculative optimizations.

**Future:** Register-pair passing for ≤2-field aggregates. On rv64gc, a `struct Point { x: Int, y: Int }` could be passed in `x10`+`x11` instead of on the stack. This is a calling-convention optimization that does not change the IR — only the asm backend.

---

## 13. Evaluator Integration

### 13.1 fn Evaluation

`call @name %args` pushes a new evaluation frame, evaluates blocks, returns result. No cell lookup, no state machine. Equivalent to a standard function call.

### 13.2 thunk Evaluation

`force @name` reads the thunk's cell:
1. `suspended` → mark `evaluating`, evaluate blocks, write result, mark `evaluated`
2. `evaluating` → cycle error
3. `evaluated` → return cached value

### 13.3 Asm Mapping — rv64gc

**fn call:** standard `jal` / `jalr`. No cell overhead.  
**thunk force:** A thunk cell is 16 bytes: `[state_tag: i64, value: i64]`. Check tag before evaluating.

```
// force @x on rv64gc:
ld t0, 0(thunk_ptr)       // load state tag
beqz t0, .evaluate        // 0 = suspended → evaluate
li t1, EVALUATING_TAG
beq t0, t1, .cycle_error  // already evaluating → cycle
ld a0, 8(thunk_ptr)       // evaluated → return cached value
ret
```

---

## 14. Source → IR Examples

### 14.1 Simple Arithmetic (main)

**Source:**
```dew
def main = fn { 2026 -> stdout; }
```

**IR:**
```
fn @main() {
  entry:
    %0 = lit 2026
    stdout_int %0
}
```

### 14.2 Function Definition and Call

**Source:**
```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
def main = fn { add(40, 2) -> stdout; }
```

**IR:**
```
fn @add(x: Int, y: Int) {
  entry:
    %0 = add %0 %1
    ret %0
}

fn @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call @add %0 %1
    stdout_int %2
}
```

### 14.3 Recursive Function

**Source:**
```dew
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}
def main = fn { fact(5) -> stdout; }
```

**IR:**
```
fn @fact(n: Int) {
  entry:
    %0 = lit 0
    %1 = eq %0 %0         // n == 0 (n is %0)
    br %1 L_then L_else
  L_then:
    %2 = lit 1
    ret %2
  L_else:
    %3 = lit 1
    %4 = sub %0 %3
    %5 = call @fact %4
    %6 = mul %0 %5
    ret %6
}

fn @main() {
  entry:
    %0 = lit 5
    %1 = call @fact %0
    stdout_int %1
}
```

### 14.4 Lazy Pure Value (Thunk)

**Source:**
```dew
def x = 40 + 2       // pure, zero-arg → thunk
def main = fn { x -> stdout; }
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

fn @main() {
  entry:
    %0 = force @x
    stdout_int %0
}
```

> `def x = 40 + 2` produces a thunk — evaluated once, result cached. `main` forces it via `force @x`. If `x` were declared with an argument (`def f = fn(n: Int) -> Int { ... }`) or were IO (`def read = fn { stdin() }`), it would be an `fn`.

### 14.5 If/Else Branching

**Source:**
```dew
def main = fn { if 1 > 0 { 10 } else { 20 } -> stdout; }
```

**IR:**
```
fn @main() {
  entry:
    %0 = lit 1
    %1 = lit 0
    %2 = gt %0 %1
    br %2 L_then L_else
  L_then:
    %3 = lit 10
    jmp L_merge
  L_else:
    %4 = lit 20
    jmp L_merge
  L_merge:
    %5 = phi [%3, L_then] [%4, L_else]
    stdout_int %5
}
```

### 14.6 Borrow Sugar

**Source:**
```dew
def translate = fn(&p: Point, dx: Int) -> Point {
  &p { x = p.x + dx }
}
```

**IR:**
```
fn @translate(p: Point, dx: Int) {
  entry:
    %2 = fetch %0 .x         // p.x (%0 = p)
    %3 = add %2 %1           // p.x + dx (%1 = dx)
    %4 = struct_update %0 .x=%3
    ret %4
}
```

> Borrow sugar desugars before IR gen. The body becomes a normal fn taking `p` by value and returning the updated struct.

### 14.7 Large Tuple (Stack Allocation)

**Source:**
```dew
def f = fn -> (Int, Int, Int, Int, Int) { (1, 2, 3, 4, 5) }
```

**IR:**
```
fn @f() {
  entry:
    %0 = lit 1
    %1 = lit 2
    %2 = lit 3
    %3 = lit 4
    %4 = lit 5
    %5 = tuple_lit %0 %1 %2 %3 %4   // 40 bytes — stack allocated
    ret %5
}
```

> `%0`–`%4` are scalar 64-bit GPRs. `%5` is an aggregate — 5 × 8 = 40 bytes, allocated on the stack and passed via stack on return. The IR register `%5` is a virtual name; the asm backend determines the concrete storage location.

### 14.7 Match Expression

**Source:**
```dew
enum Option { Some(Int), None }
def main = fn {
  def x = Some(2026);
  match x { Some(v) => v, None => 0 } -> stdout;
}
```

**IR:**
```
enum Option { None, Some(Int) }

fn @main() {
  entry:
    %0 = lit 2026
    %1 = enum_cons @Option::Some %0
    %2 = enum_disc %1
    %3 = lit 0
    %4 = eq %2 %3
    br %4 L_some L_none
  L_some:
    %5 = enum_proj @Option::Some %1
    jmp L_merge
  L_none:
    %6 = lit 0
    jmp L_merge
  L_merge:
    %7 = phi [%5, L_some] [%6, L_none]
    stdout_int %7
}
```

> `enum_disc` reads the variant tag; `enum_proj` extracts the payload. On rv64gc: `ld t0, 0(enum_ptr)` for disc, `ld t0, 8(enum_ptr)` for projection.

---


---

## Instruction Reference

| # | Instruction | Description | § |
|---|------------|-------------|---|
| 1 | `lit` | Load literal into register | [§8.1](#81-literals) |
| 2 | `stdout_int` | Write register as decimal integer | [§8.2](#82-io) |
| 3 | `stdout_char` | Write register as Unicode character | [§8.2](#82-io) |
| 4 | `stdout_bool` | Write register as "true"/"false" | [§8.2](#82-io) |
| 5 | `stdin_int` | Read decimal integer from stdin | [§8.2](#82-io) |
| 6 | `stdin_char` | Read one character from stdin | [§8.2](#82-io) |
| 7 | `lambda` | Create closure referencing named fn | [§8.3](#83-functions) |
| 8 | `lambda_block` | Create closure with inline blocks | [§8.3](#83-functions) |
| 9 | `call` | Call fn by name or closure | [§8.3](#83-functions) |
| 10 | `force` | Force lazy thunk | [§8.3](#83-functions) |
| 11 | `add` | Integer addition | [§8.4](#84-arithmetic) |
| 12 | `sub` | Integer subtraction | [§8.4](#84-arithmetic) |
| 13 | `mul` | Integer multiplication | [§8.4](#84-arithmetic) |
| 14 | `div` | Integer division | [§8.4](#84-arithmetic) |
| 15 | `rem` | Integer remainder | [§8.4](#84-arithmetic) |
| 16 | `lt` | Less than | [§8.5](#85-comparison) |
| 17 | `gt` | Greater than | [§8.5](#85-comparison) |
| 18 | `le` | Less or equal | [§8.5](#85-comparison) |
| 19 | `ge` | Greater or equal | [§8.5](#85-comparison) |
| 20 | `eq` | Equal | [§8.5](#85-comparison) |
| 21 | `ne` | Not equal | [§8.5](#85-comparison) |
| 22 | `and` | Logical AND | [§8.6](#86-logic) |
| 23 | `or` | Logical OR | [§8.6](#86-logic) |
| 24 | `not` | Logical NOT | [§8.6](#86-logic) |
| 25 | `phi` | SSA merge from predecessors | [§8.7](#87-control-flow) |
| 26 | `fetch` | Walk accessor path, read sub-value | [§8.8](#88-memory-access--fetch-and-place) |
| 27 | `place` | Walk accessor path, replace sub-value | [§8.8](#88-memory-access--fetch-and-place) |
| 28 | `field` | Extract named field from struct | [§8.9](#89-structure-construction) |
| 29 | `struct_cons` | Construct struct value | [§8.9](#89-structure-construction) |
| 30 | `enum_cons` | Construct enum variant | [§8.9](#89-structure-construction) |
| 31 | `enum_disc` | Read enum discriminant | [§8.9](#89-structure-construction) |
| 32 | `enum_proj` | Extract variant payload | [§8.9](#89-structure-construction) |
| 33 | `array_lit` | Construct array value | [§8.9](#89-structure-construction) |
| 34 | `tuple_lit` | Construct tuple value | [§8.9](#89-structure-construction) |
| 35 | `struct_update` | New struct with updated fields | [§8.10](#810-structure-update) |
| 36 | `array_access` | Read array element | [§8.10](#810-structure-update) |
| 37 | `array_update` | New array with updated element | [§8.10](#810-structure-update) |
| 38 | `tuple_update` | New tuple with updated element | [§8.10](#810-structure-update) |

*Last updated: 2026-06-16 — v5 with fn/thunk split, 38 instructions.*
