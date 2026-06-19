# Dew IR → LLVM IR Implementation

> **Implementation companion to [dew-ir.md](dew-ir.md).** Documents how each Dew IR construct translates to LLVM IR. Sections mirror dew-ir.md.

### Contents

- [§1 Architecture](#1-architecture)
- [§2 Module](#2-module)
  - [§2.1 Type Table Format](#21-type-table-format)
- [§3 fn](#3-fn)
- [§4 thunk](#4-thunk)
  - [§4.1 Self-Referential Thunks](#41-self-referential-thunks)
- [§5 Basic Block](#5-basic-block)
  - [§5.1 Terminators](#51-terminators)
- [§7 Types (IR Level)](#7-types-ir-level)
- [§8 Instructions — Complete Reference](#8-instructions--complete-reference)
  - [§8.1 Literals](#81-literals)
  - [§8.2 I/O](#82-io)
  - [§8.3 Functions](#83-functions)
  - [§8.4 Arithmetic](#84-arithmetic)
  - [§8.5 Comparison](#85-comparison)
  - [§8.8 Memory Access](#88-memory-access)
  - [§8.9 Structure Construction](#89-structure-construction)
  - [§8.10 Structure Update](#810-structure-update)
- [§13 Backends](#13-backends)
  - [§13.1 Tree-Walking Evaluator](#131-tree-walking-evaluator)
  - [§13.2 LLVM IR Backend](#132-llvm-ir-backend)
    - [§13.2.1 Enum Type Lowering](#1321-enum-type-lowering)
    - [§13.2.2 Closure Lowering](#1322-closure-lowering)
    - [§13.2.3 Known Limitations](#1323-known-limitations)

---

## 1. Architecture

The compiler supports two backends:

| Backend | File | Status | Use |
|---------|------|--------|-----|
| Tree-Walking Evaluator | `src/backend/eval.rs` | Production | Primary: development, testing, e2e |
| LLVM IR Emitter | `src/backend/llvm.rs` | Skeleton | Planned: native compilation |

The evaluator is the primary execution engine. The LLVM backend emits textual LLVM IR for native compilation.

```
Dew Source → Desugar → NameRes → Typeck → Strictness → IR Gen → Dew IR Module
                                                                  ├──→ Eval (tree-walking)
                                                                  └──→ LLVM IR (text output)
```

---

## 2. Module

### Dew IR Module → LLVM Module

A Dew IR `Module` contains:
- `types: TypeTable` — struct/enum/enum-definitions
- `fns: Vec<Fn>` — strict function definitions
- `thunks: Vec<Thunk>` — lazy thunk definitions

LLVM lowering produces:
```
; Type definitions (struct, enum layouts)
%struct.Point = type { i64, i64 }
%enum.Option = type { i64, [8 x i8] }

; Thunk cells (global storage for each thunk)
@thunk.x = global %thunk_cell zeroinitializer

; Force functions (one per thunk)
define i64 @force_x() { ... }

; Function definitions
define i64 @add(i64 %0, i64 %1) { ... }
define i64 @main() { ... }
```

### 2.1 Type Table Format

Types are lowered at module initialization, before any function is emitted:

```
emit_type_defs(module) → %struct.* / %enum.* type declarations
emit_externals()       → @printf, @scanf declarations
emit_thunk_cell()      → @thunk.* global allocations
emit_thunk_force()     → @force_* functions (3-state FSM)
emit_fn()              → user-defined functions
```

---

## 3. fn

### `fn @name(%p1: T1, ...) { blocks }` → `define T @name(T %p1, ...)`

A Dew `fn` maps directly to an LLVM `define`:
```
fn @add(%0: Int, %1: Int) { entry: %2 = add %0 %1; ret %2 }
```
↓
```llvm
define i64 @add(i64 %0, i64 %1) {
entry:
  %2 = add i64 %0, %1
  ret i64 %2
}
```

**Parameter passing**: Dew IR registers 0..N map to LLVM `%0..%N`. The evaluator uses a flat register array; the LLVM backend uses SSA virtual registers.

**Block labels**: Dew IR labels (`entry`, `L1`, `merge`) become LLVM labels (`entry:`, `L1:`, `merge:`).

---

## 4. thunk

### `thunk @name(params) { blocks }` → `@thunk.name` global + `@force_name` function

Thunks implement lazy evaluation. Each thunk requires:
1. A **global cell** holding the thunk's state (suspended / evaluating / evaluated)
2. A **force function** implementing the 3-state FSM

**Thunk cell layout** (LLVM):
```llvm
%thunk_cell = type { i32, i64 }
; field 0: state (0=suspended, 1=evaluating, 2=evaluated)
; field 1: cached value (valid when state==2)
```

For thunks with multiple return values (structs/enums), the cell uses the type's LLVM representation.

**Force function**:
```llvm
define i64 @force_x() {
entry:
  %state_ptr = getelementptr %thunk_cell, @thunk.x, i32 0, i32 0
  %state = load i32, %state_ptr
  
  ; Check state
  %is_evaluated = icmp eq i32 %state, 2
  br i1 %is_evaluated, label %return_cached, label %not_evaluated
  
return_cached:
  %val_ptr = getelementptr, @thunk.x, i32 0, i32 1
  %val = load i64, %val_ptr
  ret i64 %val
  
not_evaluated:
  %is_evaluating = icmp eq i32 %state, 1
  br i1 %is_evaluating, label %blackhole, label %evaluate
  
blackhole:
  call void @runtime_panic("thunk cycle")
  unreachable
  
evaluate:
  store i32 1, %state_ptr     ; mark evaluating
  %result = call ...thunk body...
  %val_ptr2 = getelementptr, @thunk.x, i32 0, i32 1
  store i64 %result, %val_ptr2
  store i32 2, %state_ptr     ; mark evaluated
  ret i64 %result
}
```

### 4.1 Self-Referential Thunks

A `def rec` thunk references itself (`force{} @self`). The LLVM lowering handles this naturally — the force function calls itself recursively through the thunk mechanism.

---

## 5. Basic Block

### Structure

A Dew IR basic block:
```
L1:
  %2 = add %0 %1
  %3 = lit 42
  br %cond L2 L3
```

Becomes LLVM:
```llvm
L1:
  %2 = add i64 %0, %1
  br i1 %cond, label %L2, label %L3
```

**Phi nodes**: Dew IR `phi` instructions become LLVM `phi` instructions:
```
%5 = phi [%3 L1] [%4 L2]
```
↓
```llvm
%5 = phi i64 [ %3, %L1 ], [ %4, %L2 ]
```

### 5.1 Terminators

| Dew IR | LLVM IR |
|--------|---------|
| `ret %r` | `ret i64 %r` |
| `br %cond L1 L2` | `br i1 %cond, label %L1, label %L2` |
| `jmp L1` | `br label %L1` |

---

## 7. Types (IR Level)

### Type Mapping

| Dew IR Type | LLVM Type | Notes |
|-------------|-----------|-------|
| `Int` | `i64` | 64-bit signed integer |
| `Bool` | `i1` | 1-bit boolean |
| `Char` | `i32` | 32-bit (Unicode codepoint) |
| `Unit` | `void` | Zero-sized |
| `Struct(name)` | `%struct.name` | Named struct type |
| `Enum(name)` | `%enum.name` | Tagged union |
| `Tuple` | `%tuple.N` or flattened | Small tuples flattened to scalars |
| `Array(T, N)` | `[N x T_llvm]` | Fixed-size array |
| `Fun(args...) → ret` | Closure ptr | Heap-allocated closure |

**Struct layout**:
```
struct Point { x: Int, y: Int }
```
↓
```llvm
%struct.Point = type { i64, i64 }
```

**Enum layout** (tagged union):
```
enum Option { Some(Int), None }
```
↓
```llvm
%enum.Option = type { i64, [8 x i8] }
; field 0: discriminant tag (0=None, 1=Some)
; field 1: payload (max variant size, 8 bytes for Int)
```

**Tuple**: Small tuples (≤2 elements) are flattened to individual registers. Larger tuples use a struct type `%tuple = type { T1, T2, ... }`.

---

## 8. Instructions — Complete Reference

### 8.1 Literals

| Dew IR | LLVM |
|--------|------|
| `lit 42` (Int) | `i64 42` |
| `lit true` (Bool) | `i1 true` |
| `lit 'a'` (Char) | `i32 97` |

### 8.2 I/O

**stdout**:
```
stdout{} %r
```
↓ LLVM (for Int):
```llvm
%fmt = ... @.str.fmt_int = "%ld"
call i32 (i8*, ...) @printf(i8* %fmt, i64 %r)
```

**stdin**:
```
%r = stdin{}
```
↓ LLVM:
```llvm
%fmt = ... @.str.fmt_int = "%ld"
%val = alloca i64
call i32 (i8*, ...) @scanf(i8* %fmt, i64* %val)
%r = load i64, i64* %val
```

**Evaluator I/O behavior**: `stdout` uses `print!` (no newline) with immediate flush. The LLVM backend uses `printf` without `\n` suffix.

### 8.3 Functions

**call**:
```
%r = call{} @f %a %b
```
↓ LLVM (static call):
```llvm
%r = call i64 @f(i64 %a, i64 %b)
```

**Dynamic call** (closure): not yet supported.

**force** (thunk access):
```
%r = force{} @x
```
↓ LLVM:
```llvm
%r = call i64 @force_x()
```

**lambda** (closure construction): closures capture their environment in a heap-allocated struct. Calling a closure indirects through a function pointer. Not yet fully implemented.

### 8.4 Arithmetic

| Dew IR | LLVM |
|--------|------|
| `add %r %a %b` | `%r = add i64 %a, %b` |
| `sub %r %a %b` | `%r = sub i64 %a, %b` |
| `mul %r %a %b` | `%r = mul i64 %a, %b` |
| `div %r %a %b` | `%r = sdiv i64 %a, %b` |
| `rem %r %a %b` | `%r = srem i64 %a, %b` |

All arithmetic uses `i64` (Dew `Int`). Wrapping semantics for add/sub/mul (already implicit in LLVM).

### 8.5 Comparison

| Dew IR | LLVM |
|--------|------|
| `eq %r %a %b` | `%r = icmp eq i64 %a, %b` |
| `ne %r %a %b` | `%r = icmp ne i64 %a, %b` |
| `lt %r %a %b` | `%r = icmp slt i64 %a, %b` |
| `gt %r %a %b` | `%r = icmp sgt i64 %a, %b` |
| `le %r %a %b` | `%r = icmp sle i64 %a, %b` |
| `ge %r %a %b` | `%r = icmp sge i64 %a, %b` |

**Evaluator**: comparisons use `Value::compare_key()` which handles `Int`, `Char`, and `Bool` uniformly (chars compare by codepoint, bools as 0/1).

### 8.8 Memory Access

**fetch** (field/index access):
```
%r = field{Int} %obj .x
```
↓ LLVM:
```llvm
%ptr = getelementptr %struct.Point, %struct.Point* %obj_ptr, i32 0, i32 0  ; field .x = index 0
%r = load i64, i64* %ptr
```

**place** (immutable update via accessor path):
```
place %base .x = %new_val → %result
```
↓ LLVM:
```llvm
%result = alloca %struct.Point
; copy base into result
; update field .x with %new_val
```

**Evaluator**: fetch/place walk accessor paths on `Value::Tuple` and `Value::Enum` values. For structs (represented as tuples), field names are resolved to indices via TypeTable.

### 8.9 Structure Construction

**struct_cons**:
```
%r = struct_cons{Point} @Point %x %y
```
↓ LLVM (stack allocation):
```llvm
%r = alloca %struct.Point
%field0 = getelementptr %struct.Point, %struct.Point* %r, i32 0, i32 0
store i64 %x, i64* %field0
%field1 = getelementptr %struct.Point, %struct.Point* %r, i32 0, i32 1
store i64 %y, i64* %field1
```

**enum_cons**:
```
%r = enum_cons{Option} @Option::Some %v
```
↓ LLVM:
```llvm
%r = alloca %enum.Option
%tag = getelementptr %enum.Option, %enum.Option* %r, i32 0, i32 0
store i64 1, i64* %tag          ; Some = tag 1
%payload = getelementptr %enum.Option, %enum.Option* %r, i32 0, i32 1
; bitcast payload to variant type, store value
store i64 %v, i64* %payload_ptr
```

**Evaluator**: `StructCons` creates `Value::Tuple(fields)`. `EnumCons` creates `Value::Enum(enum_name, variant_name, tag, fields)` — the tag is looked up from `TypeTable::enum_variant_tag`.

**Multi-payload enum**: `enum_cons @Tree::Node %left %right` — two field registers. TypeTable stores synthetic field names ("0", "1") for positional payloads.

**Named-field enum**: `enum_cons @Event::KeyPress %key %mod` — field registers in declaration order. Same IR instruction regardless of positional vs named — only TypeTable distinguishes them.

### 8.10 Structure Update

**struct_update**: `%r = struct_update{Point} %base 0 %new_val` — update field at index 0.

↓ LLVM: same as `place` — copy base, update field.

**Evaluator**: creates a new `Value::Tuple` with the updated field. The original is never mutated.

---

## 13. Backends

### 13.1 Tree-Walking Evaluator

**Entry**: `backend::eval::run(&module) → Result<Value, String>`

Finds `fn @main` (or `thunk @main`) and evaluates it via a recursive block walker:
```
eval_fn → eval_block → eval_instr (for each instr) → terminal dispatch
```

**Register model**: flat `Vec<Value>` per `EvalFrame`. Registers grow on demand (`.set(r, v)` resizes if needed).

**Label stack**: tracks Phi predecessors. `Br`/`Jmp` push the source block label before jumping. Phi pops to determine which incoming edge was taken. Merge blocks (`is_merge = has Phi instruction`) don't push their labels.

**Thunk runtime**: `HashMap<String, ThunkState>` mapping thunk names to `Suspended | Evaluating | Evaluated(Value)`. `force_thunk` implements the 3-state FSM.

**Interpreter footer**: after successful evaluation, prints `"\nProgram dew-IR successfully interpreted."` to stderr.

### 13.2 LLVM IR Backend

**Entry**: `backend::llvm::generate(&module) → Result<String, String>`

Emits LLVM IR text. Pipeline:
```
emit_type_defs → emit_externals → emit_thunk_cell → emit_thunk_force → emit_fn
```

**Current status**: active. All 33 Dew IR instructions have LLVM lowering. Handles arithmetic, structs, non-recursive enums, and recursive enums (arena-allocated).

**Key differences from evaluator**:
- SSA registers instead of flat array
- Global thunk cells instead of runtime HashMap
- Function-level translation instead of block-walking
- Arena-allocated struct/enum values instead of `Value::Tuple`/`Value::Enum`

**Register model**: All Dew values are `i64` in LLVM. Aggregate values (structs, enums, arrays, tuples) are stored in arena-allocated memory and represented as `ptrtoint` of that memory. On access, `inttoptr` recovers the pointer for field extraction.

**Arena allocation**: A global static buffer `@arena.buf[65536 x i8]` with a bump pointer `@arena.off` provides program-lifetime allocation. All struct/enum/tuple construction uses bump allocation instead of stack `alloca`, preventing use-after-free when aggregate values escape across function boundaries. This approach was chosen for simplicity — the compiler targets small test programs where 64KB is sufficient. Future iterations may adopt reference counting for finer-grained memory reclamation.

### 13.2.1 Enum Type Lowering

Non-recursive enums (e.g. `Option`) use flat LLVM struct types with inline payload fields:

```llvm
%enum.Option = type { i64, i64 }           ; tag + one payload field
%enum.Shape  = type { i64, { i64, i64 } }  ; tag + multi-field payload
```

**Recursive enums** (self-referencing variant fields, e.g. `Cons(Int, List)` in `List`) use pointer indirection to break the infinite-size recursion:

```llvm
%enum.List = type { i64, ptr }             ; tag + pointer to payload block
```

The payload block is arena-allocated and laid out as `[i64 × n]` where n is the variant's field count. This is transparent to the Dew IR — the IR uses the same `EnumCons`/`EnumProj`/`EnumDisc` instructions regardless of whether the enum is recursive.

```llvm
; EnumCons: List::Cons(42, rest)
  %tag = add i64 0, 0                       ; tag for Cons
  %payload = <arena_alloc 16>               ; 2 fields × 8 bytes
  %f0 = getelementptr i8, ptr %payload, i64 0
  store i64 42, ptr %f0                     ; field 0: Int
  %f1 = getelementptr i8, ptr %payload, i64 8
  store i64 %rest, ptr %f1                  ; field 1: List (as i64)
  %e0 = insertvalue %enum.List undef, i64 %tag, 0
  %e1 = insertvalue %enum.List %e0, ptr %payload, 1
  %e_ptr = <arena_alloc 16>                 ; {i64, ptr} = 16 bytes
  store %enum.List %e1, ptr %e_ptr
  %r = ptrtoint ptr %e_ptr to i64

; EnumProj: extract Cons field 0 (head)
  %p = inttoptr i64 %r to ptr
  %v = load %enum.List, ptr %p
  %pl_ptr = extractvalue %enum.List %v, 1   ; get payload pointer
  %fp = getelementptr i64, ptr %pl_ptr, i64 0
  %head = load i64, ptr %fp
```

Generic enums (with type parameters like `T`) that have no concrete instantiation are emitted as `type opaque` — they cannot be loaded or stored, but the presence of a concrete instantiation overrides the opaque fallback.

### 13.2.2 Closure Lowering

**Closure representation**: A closure is a two-word struct `{ i64 id, i64 env }` allocated on the arena:
- `id`: unique closure identifier (module-scoped counter), used for future switch-based dispatch
- `env`: ptrtoint of an arena-allocated capture block `[i64 × N]`

**Lambda instruction** (`Instr::Lambda(r, fn_name, captures)`):

```llvm
; Allocate capture block on arena: [i64 × N]
%cap_ptr = <arena_alloc N * 8>
%cap_0 = getelementptr i64, ptr %cap_ptr, i32 0
store i64 %capture_0, ptr %cap_0
; ... for each capture ...

; Allocate closure struct on arena: {i64 id, i64 env}
%cls_ptr = <arena_alloc 16>
%id_slot = getelementptr i64, ptr %cls_ptr, i32 0
store i64 <id>, ptr %id_slot
%env_slot = getelementptr i64, ptr %cls_ptr, i32 1
%env_i64 = ptrtoint ptr %cap_ptr to i64
store i64 %env_i64, ptr %env_slot

%result = ptrtoint ptr %cls_ptr to i64
```

The closure's `fn_name`, capture count, and env SSA name are stored in `LlvmCtx::closure_env` keyed by the result register. This enables the Dynamic call handler to resolve the closure to a static call.

**Dynamic call** (`CallTarget::Dynamic(reg)`):

The handler looks up `closure_env[reg]`. If found, the call is resolved statically: the capture values are loaded from the env block via `inttoptr` + `getelementptr` + `load`, then a static `call @closure_N(args..., captures...)` is emitted.

If `closure_env` has no entry for the register (closure flowed through a Phi or across function boundaries), the call falls back to a stub returning 0. This limitation will be addressed when the type checker provides enough information for global closure tracking.

**Closure function signature**: Closure functions are emitted as ordinary LLVM functions with the closure's original parameters followed by capture parameters. Captures are appended to the parameter list: `fn @closure_N(%arg0, ..., %cap0, ...)`.

### 13.2.3 Known Limitations

**Borrow / Compound lvalue (§5.5)**. Borrow parameters (`&x`) desugar into tuple returns from functions. The current LLVM backend does not correctly lower tuple types in function returns or the `Field` instruction for tuple-typed registers. Specific gaps:

1. **Tuple return values**: Functions with borrow params return multi-element tuples (e.g. `(Int, Int)`). The LLVM backend emits these as inline LLVM struct types via `insertvalue`, but the tuple is not arena-allocated, unlike struct/enum values. This creates a representation mismatch between tuple returns (inline struct) and aggregate returns (arena pointer).

2. **Field on tuples**: The `Instr::Field` handler does not match `IrType::Tuple`. When a tuple is returned from a function and its elements are accessed via `field{Int} %r .N`, the base register type is `IrType::Tuple` which falls through to untyped handling — producing incorrect memory accesses.

3. **Place / Fetch**: The `Instr::Place` and `Instr::Fetch` instructions (used for mutation desugaring) have incomplete LLVM lowering. Place ignores the accessor path and treats the base as a raw i64 pointer. Fetch wraps the base in `inttoptr` but uses an approximate GEP offset instead of the proper field index.

**Effect system (IO/impure)**. Functions annotated with `IO` / `impure` have effect tracking in the IR, but the LLVM backend does not distinguish pure from impure functions — both emit identically. This is acceptable for the current evaluator-centric workflow but will need attention when cross-function optimization passes are added.

**Bool type**. `IrType::Bool` is lowered to LLVM `i1`, but Dew's register model uses `i64` everywhere. This creates type mismatches at PHI nodes and function boundaries where bool values meet int values. The pragmatic fix is to convert bool operations to use `i64` throughout, or to insert `zext`/`trunc` at type boundaries.

**Stdin**. The `Instr::Stdin` handler allocates a stack `alloca` for the scanf buffer, but this `alloca` is function-scoped. If stdin is read in a non-entry block or across branches, the alloca may be incorrectly scoped. Arena allocation would resolve this.

**Multi-payload non-recursive enums**. Enums with multiple payload fields (e.g. `Shape { Circle(Int), Rect(Int, Int) }`) pack the payload into a nested LLVM struct `{ i64, { i64, i64 } }`. The `EnumProj` instruction extracts the payload struct (field 1) but does not then extract the individual field from within it — it returns the entire `{i64, i64}` as i64, which causes type errors in downstream arithmetic.
