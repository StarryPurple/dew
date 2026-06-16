# Dew IR Specification

> **Canonical specification** for the Dew Thunk Graph IR.
> All primitives use `snake_case` naming, matching Dew source convention.
> Last updated: 2026-06-16.

- [§1 Architecture](#1-architecture)
- [§2 Module](#2-module)
- [§3 Items](#3-items)
  - [§3.1 thunk](#31-thunk)
  - [§3.2 entry](#32-entry)
- [§4 Thunk Body](#4-thunk-body)
- [§5 Basic Block](#5-basic-block)
- [§6 Registers and Labels](#6-registers-and-labels)
- [§7 Types (IR Level)](#7-types-ir-level)
- [§8 Instructions](#8-instructions--complete-reference)
- [§9 Accessor Paths](#9-accessor-paths)
- [§10 Text Format](#10-text-format)
- [§11 JSON Serialization](#11-json-serialization)
- [§12 Optimization Levels](#12-optimization-levels)
- [§13 Evaluator Integration](#13-evaluator-integration)
- [§14 Generation Context](#14-generation-context)
- [§15 Thunk Graph Model](#15-thunk-graph-model)
- [§16 Source → IR Examples](#16-source--ir-examples)

The Dew Thunk Graph IR (v3) is a flat, label-based, SSA-like intermediate representation with `snake_case` naming throughout. It sits between the Dew AST and the evaluator, serving as the compilation target for Dew source.

> The three-level structure mirrors LLVM's Module → Function → BasicBlock hierarchy, a proven design for compiler IRs. The key difference is that Dew's "functions" are thunks — they carry implicit laziness semantics. This matters because a thunk is not just code: it is a lazy cell that may be in `suspended`, `evaluating`, or `evaluated` state. LLVM functions are always executable; Dew thunks are memoized computations that may not have been evaluated yet.

---

## 1. Architecture

```
Dew Source → Parser → AST → Desugar → Type Check → Strictness → IR Gen → IR Module → Evaluator → Value
```

The IR is structured in three levels:

| Level | Type | Description |
|-------|------|-------------|
| Module | `Module` | Ordered list of top-level items |
| Thunk | `Thunk` | Named entity with basic blocks |
| Instruction | `Instr` | Flat single-operation instruction within a block |

### 1.1 IR Philosophy

**No pointers, no addresses, no memory allocation primitives.** The Dew IR is a pure functional intermediate representation. All safety analysis (affine checking, provenance tracking, pointer aliasing) occurs in the type system layer above the IR. The IR sees only verified, safe computation.

- **Memory allocation** is owned by the asm backend, not the IR. `struct_cons` and `array_lit` produce values; the backend determines layout from the module's type table and generates `alloca`/`store`/`load` as needed.
- **Pointer safety** for Rx→Dew interop is handled by the translation layer (`rx-dew-interop.md` §5). The IR never sees raw pointers.
- **All values are 64-bit** in registers. Memory layout (struct field offsets, array element widths) is determined by the type table at codegen time, not by IR type annotations on each instruction.
- **No `alloca` instruction.** The tree-walking evaluator manages memory via Rust's `Vec`/`Box`. The asm backend inserts stack allocations during codegen. The IR stays allocation-free.

---

## 2. Module

The module contains all thunk definitions. Execution always starts at `@main`:

```
module:
  definitions: [Thunk]     // all top-level definitions
```

**Execution model.** The evaluator first registers all thunk definitions (inert — only names and blocks, no evaluation), then forces `@main`. This is equivalent to LLVM's model: `define` for declarations, then the runtime starts at `@main` by convention. If no `@main` thunk exists, the evaluator reports `[E007]`.

> No explicit `entry` directive — the entry point is always `@main`, matching the Dew language requirement that every program defines a `main` binding. This eliminates a redundant IR element and makes the module purely declarative.

### 2.1 Text Format

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
    %0 = force @x
    stdout %0
}

```

---

---

## 3. Thunk

A thunk is a named computation with typed parameters, a return type, and basic blocks:

```
thunk @name(param1: Ty, param2: Ty) {
  entry:
    ...
}
```

Parameters map to registers by position: `%0` = first param, `%1` = second param, etc. The parameter names (`param1`, `param2`) are for documentation only — the IR body uses register numbers exclusively.

> Thunks are the IR unit of laziness. Every top-level `def` produces a thunk. By making thunks the primary IR entity, the evaluator uniformly handles lazy values from top-level definitions, closures, and recursive self-references.
>
> **Why not LLVM functions?** An LLVM `define` describes executable code at a known address. A Dew thunk wraps code in a lazy cell with three states (`suspended`, `evaluating`, `evaluated`). Forcing a thunk may execute code (if suspended), return a cached value (if evaluated), or detect a cycle (if evaluating). This state machine has no LLVM equivalent — it is the core mechanism implementing call-by-need.
>
> **Asm translation:** Each thunk compiles to a labeled code block preceded by a cell header (2 words: state tag + value). On rv64gc: `sd zero, 0(thunk_ptr)` for suspended; `sd {tag}, 0(thunk_ptr)` for the state transition. On x86-64: same structure in 16 bytes. The state tag is checked before jumping to the code body.

---

## 4. Basic Block

A basic block is a straight-line sequence of instructions ending with a terminator. Blocks are identified by string labels (`"entry"`, `"L0"`, `"L1"`).

### 5.1 Terminators

| Terminator | Text | Semantics |
|-----------|------|-----------|
| `ret` | `ret %r` | Return value from thunk |
| `br` | `br %cond L_then L_else` | Branch on boolean |
| `jmp` | `jmp L_target` | Unconditional jump |

---

## 6. Registers and Labels

### 6.1 Registers

Virtual (unbounded), SSA-like — each register assigned exactly once. Displayed as `%0`, `%1`, `%2`. Generated by `GenCtx::fresh_reg()`.

### 6.2 Labels

Identify thunk cells in the heap. Displayed as `%t0`, `%t1`. Generated by `GenCtx::fresh_label()`.

### 6.3 Block Labels

String labels (`"entry"`, `"L0"`, `"L1"`) identify basic blocks within a thunk. Generated by `GenCtx::fresh_block_label()`.

### 6.4 Value References

Used in `update` items to specify the new value:

```
update %t0 42          // literal value
update %t0 %other      // reference to another label
```

---

## 7. Types (IR Level)

IR types are a subset of source types — no type variables (inference happens before IR gen):

> IR types are monomorphic: all generic parameters are resolved before IR generation. `List(Int)` and `List(Bool)` produce separate monomorphized thunks. This simplifies the evaluator — no type tags needed at runtime — and enables direct asm translation where every register has a known width. `Int` maps to a 64-bit GPR (rv64gc `xN`, x86-64 `rN`), `Bool` and `Char` also use 64-bit GPRs for uniformity, `Unit` is zero-sized.

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

> **All values are 64-bit.** `Int`, `Bool`, `Char`, pointers, and thunk references all reside in a single 64-bit register (GPR). `Unit` is zero-width — no register, eliminated at codegen. This uniform width simplifies the evaluator (every register is `u64`) and the asm backend (every value maps to `xN` on rv64gc, `rN` on x86-64). Structs ≤ 2 fields fit in register pairs; larger structs use stack allocation. No type tags needed at runtime — all generic parameters are monomorphized before IR generation.

---

## 8. Instructions — Complete Reference

All instructions follow SSA form: `%dest = op arg1 arg2 ...`.

### 8.1 Literals

| Instruction | Text | Semantics |
|------------|------|-----------|
| `lit` | `%r = lit 42` | Load literal into register |

### 8.2 I/O

| Instruction | Text | Semantics |
|------------|------|-----------|
| `stdout` | `stdout %r` | Write register value to stdout (no return) |
| `stdin` | `%r = stdin` | Read value from stdin into register |

> `stdout` and `stdin` are IR primitives, not thunk calls. Like `add` and `lit`, they are leaf instructions matched directly by the evaluator. This ensures side effects execute immediately (IO is always strict, per §3.2 of the language spec). On rv64gc, `stdout` maps to an `ecall` with the write syscall number; `stdin` maps to an `ecall` with the read syscall number. The borrow sugar on `stdin(&v)` is desugared before IR gen — the IR sees only the simple `stdin` read.

### 8.3 Functions

| Instruction | Text | Semantics |
|------------|------|-----------|
| `lambda` | `%r = lambda @name(x: Int)` | Create closure referencing named thunk |
| `lambda_block` | `%r = lambda(x, y) { ... }` | Create closure with inline blocks |
| `call` | `%r = call %f %a %b` | Call function with arguments |

> **`lambda` vs direct call:** `call @name %args` invokes a thunk directly by name — the thunk is statically known. `lambda @name` creates a runtime closure value wrapping the thunk reference. Use `call @name` when the callee is known at IR-gen time (direct calls, recursion). Use `lambda` only when the function must escape: returned from a function, stored in a struct, or passed as a higher-order argument. Direct calls are simpler and enable the asm backend to generate a plain `call`/`jal` instruction without closure allocation overhead.

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

The `phi` instruction is the standard SSA mechanism for merging values from different control flow paths. Each pair `[%value, label]` indicates "if we arrived from `label`, use `%value`."

### 8.8 Memory Access — `fetch` and `place`

Both use **accessor paths** to navigate compound data structures.

```
%r = fetch %base .field [%idx] .subfield
```

Walks the accessor path on the base value, returning the selected sub-value.

```
%r = place %base .field [%idx] = %value
```

Creates a new value equal to `%base` but with the value at the given path replaced by `%value`. Returns the new value. The original `%base` is consumed (affine type system). Copy-on-write: only the modified path is allocated fresh.

> **Why not LLVM's `getelementptr`?** GEP computes addresses; `load`/`store` access memory. Dew has no mutable memory — all values are immutable. `fetch`/`place` operate on VALUES, not addresses. `fetch` selects a sub-value (structural copy); `place` creates a new value with one sub-value replaced (structural update). There are no pointers, no addresses, no loads or stores. This is a functional IR, not a memory model.
>
> The dedicated instructions (`field`, `array_access`, `struct_update`, etc.) exist alongside `fetch`/`place` for two reasons: (1) they are the common case and deserve concise syntax, (2) they enable direct pattern-matching in the evaluator without path parsing overhead. `field %e .x` is directly matched; `fetch %e .x` requires accessor chain walking.
>
> **Asm translation — rv64gc:** `fetch` with a static field offset compiles to an offset load from the struct base address. `place` compiles to a copy with one field overwritten — if the value is affine (exclusive ownership), this becomes an in-place store. On x86-64: same pattern, using `mov` with `[base + offset]` addressing.

### 8.9 Structure Construction

| Instruction | Text | Semantics |
|------------|------|-----------|
| `field` | `%r = field %e .x` | Extract field from struct |
| `struct_cons` | `%r = struct @Point %x %y` | Construct struct value |
| `enum_cons` | `%r = enum @Option::Some %v` | Construct enum variant |
| `array_lit` | `%r = array %a %b %c` | Construct array value |
| `tuple_lit` | `%r = tuple %a %b` | Construct tuple value |

> **Why per-type instructions?** LLVM uses `insertvalue` for all aggregate types. Dew splits construction by type category (struct, enum, array, tuple) because each has different memory layout implications. `struct_cons` packs named fields at known offsets; `enum_cons` prepends a discriminant tag; `array_lit` packs N uniform elements at stride; `tuple_lit` packs heterogeneous elements contiguously. The evaluator matches these directly without inspecting type metadata at runtime.
>
> **Asm:** On rv64gc/x86-64, `struct_cons` compiles to stack or register packing. Structs ≤ 2 registers fit entirely in registers (rv64gc: `x10`+`x11`, x86-64: `rdi`+`rsi`). Larger structs allocate on the stack with `addi sp, sp, -N` (rv64gc) or `sub rsp, N` (x86-64).

### 8.10 Structure Update

| Instruction | Text | Semantics |
|------------|------|-----------|
| `struct_update` | `%r = struct_update %s .x=%a .y=%b` | New struct with updated fields |
| `array_access` | `%r = array_access %a %i` | Read array element |
| `array_update` | `%r = array_update %a %i %v` | New array with updated element |
| `tuple_update` | `%r = tuple_update %t 0 %v` | New tuple with updated element |

> **Why `array_access` separately from `fetch`?** Array element access is the common case — it happens at every subscript `a[i]`. `fetch %a [%i]` with an accessor path would work, but `array_access %a %i` is a single instruction the evaluator matches directly. The same logic applies to `array_update`, `struct_update`, and `tuple_update` — they are syntactic sugar for common patterns, backed by `fetch`/`place` as the general mechanism. This is analogous to LLVM providing both `getelementptr` (general) and `extractvalue` (specific).

### 8.11 Complete Instruction List (34 total)

```
lit                                  — literals
stdout, stdin                        — I/O
lambda, lambda_block, call           — functions
add, sub, mul, div, rem              — arithmetic
lt, gt, le, ge, eq, ne               — comparison
and, or, not                         — logic
phi                                  — control flow merge
fetch, place                         — path-based access
field                                — field extraction
struct_cons, enum_cons, array_lit, tuple_lit  — construction
struct_update, array_access, array_update, tuple_update — update
```

---

## 9. Accessor Paths

Accessor paths navigate compound data structures in `fetch` and `place`:

| Accessor | Text | Meaning |
|----------|------|---------|
| `field(name)` | `.name` | Struct field by name |
| `array(%r)` | `[%idx]` | Array element by register index |
| `tuple(n)` | `.n` | Tuple element by literal index |

Paths are sequences of accessors applied left-to-right:

```
%r = fetch %base .field_name [%idx] .subfield .0
```

Equivalent to: `base.field_name[idx].subfield.0`

### 9.1 Place Path Semantics

`place` with a multi-element path creates a nested update:

```
%r = place %arr [%i] .x = %v
```

Desugars to:
```
struct_update(array_access(arr, i), [("x", v)])
```

The evaluator implements copy-on-write: the base is copied, the path is traversed to the target, and the new value is inserted.

---

## 10. Text Format

The IR text format uses 2-space indentation:

```
thunk @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = add %0 %1
    stdout %2
}

```

### 10.1 Formatting Rules

- Block labels end with `:`
- Instructions indented 2 spaces within blocks
- Terminators at the same indent level as instructions
- Items separated by blank lines
- Registers: `%N` (N is a non-negative integer)
- Labels: `%tN` or `%name`
- All names in `snake_case`

---

## 11. JSON Serialization

All IR types derive `Serialize` and `Deserialize` from serde. JSON emission via `--emit=json`:

```json
{"definitions":[{"name":"main","params":[],"ret_ty":"Unit","blocks":[...]}],"entry":"main"}
```

---

## 12. Optimization Levels

### O0 (Default)

- No optimizations
- All top-level bindings produce thunks
- All function values produce closures

### O1

| Optimization | Trigger | Effect |
|-------------|---------|--------|
| `strict_def` | Zero-arg, non-recursive `def` | Inline blocks, skip thunk allocation |
| `fn_def` | Non-zero-arg, non-recursive `def` | Inline blocks with named params |
| Lambda wrapper elimination | All opt levels | Detect `Expr::Fn` and compile body directly |

> O1 is intentionally conservative — only optimizations that are provably safe. `strict_def` and `fn_def` merely skip the thunk allocation/force cycle when the compiler can prove the definition is non-recursive. No speculative optimizations, no inlining, no dead code elimination. Aggressive optimizations (O2+) are deferred until real program profiles demonstrate their necessity.

---

## 13. Evaluator Integration

### 13.1 Thunk Heap

The evaluator maintains a `HashMap<Label, ThunkState>`:

```
ThunkState:
  suspended { blocks, params }
  evaluating
  evaluated(value)
```

### 13.2 Evaluation Loop

1. Register all thunks from the definitions table (names → blocks)
2. Force the entry thunk
3. When forcing a thunk:
   - `suspended` → mark `evaluating`, evaluate blocks, transition to `evaluated`
   - `evaluating` → blackhole detected — report cycle error
   - `evaluated` → return cached value

### 13.3 Block Walking

Each block is walked sequentially:
1. Evaluate each instruction, update register file
2. At the terminator:
   - `ret(r)` → return register value
   - `br { cond, then, else }` → jump to then_label or else_label
   - `jmp(label)` → jump to target label

### 13.4 Instruction Evaluation

Each instruction reads source registers, performs its operation, and writes the result to the destination register. Key rules:
- Arithmetic/comparison: evaluate operands, apply operator
- `fetch`: walk accessor path on base value
- `place`: walk accessor path, copy-on-write, return new value
- `call`: force function thunk, create closure environment, evaluate body
- `struct_cons`: evaluate field expressions, construct struct value

---

## 14. Generation Context

Monotonic counters for register and label allocation during IR generation:

```
GenCtx {
  next_reg: usize,
  next_label: usize,
}
```

---

## 15. Thunk Graph Model

The IR represents computations as a **graph of thunks**:

- Each `thunk` is a node in the graph
- `force` edges connect thunks (forcing one may force others)
- `update` edges represent memoization (caching computed values)
- `call` edges represent function application

**Lazy evaluation**: thunks are only forced when their values are demanded. The blackhole mechanism detects cycles.

### 15.3 Thunk State Machine

The 3-state FSM has no LLVM equivalent — it is the runtime mechanism for call-by-need:

```
suspended ──force──► evaluating ──complete──► evaluated(value)
                         │                        │
                         │ self-force             │ force
                         ▼                        ▼
                      [E004] cycle            return cached
```

**Asm mapping — rv64gc:** A thunk cell is 16 bytes: `[state_tag: i64, value: i64]`. After evaluation, the code block writes the result and updates the state tag atomically. The `force` operation is a tagged pointer check: `ld t0, 0(thunk_ptr); beqz t0, evaluate; li t1, EVALUATING_TAG; beq t0, t1, cycle_error; ret` (value already in cell).

**Asm mapping — x86-64:** Same layout. `mov rax, [thunk_ptr]; test rax, rax; jz evaluate; cmp rax, EVALUATING_TAG; je cycle_error; ret`.

**Target architectures** (priority order): rv64gc (primary), x86-64 (secondary).

### 15.4 Recursion

Recursive self-reference uses `call @fact` directly — the thunk name is the reference.

### 15.2 Closure Resource

The IR generator infers the closure's Resource property from captured variables:
- Captures an affine variable → `fn_once` (can be called at most once)
- Pure (no affine captures) → `fn` (unrestricted)

---

## 16. Source → IR Examples

Each example shows a Dew source program and its corresponding IR text output.

### 16.1 Simple Arithmetic

**Source:**
```dew
def main = fn { 2026 -> stdout; }
```

**IR:**
```
thunk @main() {
  entry:
    %0 = lit 2026
    stdout %0
}
```

> `stdout` is an IR primitive — side effect, no return value. The thunk body ends with `stdout`; no `ret` is needed because `main` returns `Unit`. Pure thunks use `ret %r` to return values.

### 16.2 Function Definition and Call

**Source:**
```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
def main = fn { add(40, 2) -> stdout; }
```

**IR:**
```
thunk @add(x: Int, y: Int) {
  entry:
    %0 = add %0 %1      // %0 = x, %1 = y (positional)
    ret %0
}

thunk @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call @add %0 %1
    stdout %2
}

```

> Static calls use `call @name %args` directly — the thunk name is the call target. `lambda @name` creates a runtime closure value and is only needed when the function must be stored, returned, or passed as an argument (i.e., when it escapes its defining scope). For simple direct calls like `add(40, 2)`, no intermediate closure is necessary. The same rule applies to recursive self-calls: `call @fact %4`.

### 16.3 Recursive Function

**Source:**
```dew
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}
def main = fn { fact(5) -> stdout; }
```

**IR:**
```
thunk @fact(n: Int) {
  entry:
    %0 = lit 0
    %1 = eq %0 %0         // n == 0 (n is %0)
    br %1 L_then L_else
  L_then:
    %2 = lit 1
    ret %2
  L_else:
    %3 = lit 1
    %4 = sub %0 %3        // %0 is n
    %5 = call @fact %4
    %6 = mul %0 %5
    ret %6
}

thunk @main() {
  entry:
    %0 = lit 5
    %1 = call @fact %0
    stdout %1
}

```

> Parameters are positional: `n` is `%0`. Recursive self-reference uses `call @fact` directly.

### 16.4 Struct Construction and Field Access

**Source:**
```dew
struct Point { x: Int, y: Int }
def main = fn {
  def p = Point { x: 3, y: 4 };
  p.x + p.y -> stdout;
}
```

**IR:**
```
thunk @main() {
  entry:
    %0 = lit 3
    %1 = lit 4
    %2 = struct_cons @Point %0 %1
    %3 = fetch %2 .x         // = 3
    %4 = fetch %2 .y         // = 4
    %5 = add %3 %4
    stdout %5
}

```

> `struct_cons` creates a struct value. `fetch` with `.x` / `.y` accessors reads fields. No `var` or `bind` needed — the IR generator tracks which register holds `p` and uses `%2` directly.

### 16.5 Lazy Evaluation: Thunk Chain

**Source:**
```dew
def x = 40 + 2       // lazy — not evaluated until forced
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

thunk @main() {
  entry:
    %0 = force @x
    stdout %0
}

```

> `def x = 40 + 2` produces a thunk `@x` that is NOT forced at definition time. `main` forces `x` via `force @x` — the evaluator forces `x` only when `main` is forced and its body demands the value. This is the fundamental lazy evaluation mechanism.

### 16.6 If/Else Branching

**Source:**
```dew
def main = fn { if 1 > 0 { 10 } else { 20 } -> stdout; }
```

**IR:**
```
thunk @main() {
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
    stdout %5
}

```

> `br` splits control flow into then/else blocks. `jmp` rejoins at the merge block `L_merge`. The `phi` instruction selects the correct value based on which predecessor block was executed — this is the standard SSA approach to conditional values.

### 16.7 Borrow Sugar

**Source:**
```dew
def translate = fn(&p: Point, dx: Int) -> Point {
  &p { x = p.x + dx }
}
```

**IR:**
```
thunk @translate(p: Point, dx: Int) {
  entry:
    %2 = fetch %0 .x         // p.x (%0 = p)
    %3 = add %2 %1           // p.x + dx (%1 = dx)
    %4 = struct_update %0 .x=%3
    ret %4
}
```

> Parameters are positional: `%0` is `p`, `%1` is `dx`. New registers `%2`, `%3`, `%4` are fresh.

> Borrow sugar desugars before IR gen. The body becomes a normal function that takes `p` by value, creates an updated `struct_update`, and returns it. The `(Point, Point)` tuple from the borrow desugaring is the return value here — both the modified borrow parameter and the original result.

### 16.8 Match Expression

**Source:**
```dew
enum Option { Some(Int), None }
def main = fn {
  def x = Some(2026);
  match x {
    Some(v) => v,
    None => 0,
  } -> stdout;
}
```

**IR:**
```
thunk @main() {
  entry:
    %0 = lit 2026
    %1 = enum_cons @Option::Some %0
    %2 = enum_disc %1        // get discriminant
    %3 = lit 0               // Some discriminant
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
    stdout %7
}

```

> Match on enums lowers to a discriminant test (`enum_disc`) followed by `br`, then projection (`enum_proj`) in each arm. `phi` merges results from all arms.
>
> **Why `enum_disc`/`enum_proj` instead of LLVM's `extractvalue`?** LLVM's `extractvalue` works on known struct layouts — the field offset is constant. Dew enums have a runtime discriminant: the variant tag varies dynamically. `enum_disc` reads the tag (first word of the enum), `enum_proj` extracts the payload (at offset 8 past the tag). This split enables efficient asm: on rv64gc, `enum_disc` is `ld t0, 0(enum_ptr)`; `enum_proj` is `ld t0, 8(enum_ptr)`. On x86-64, `mov rax, [enum_ptr]` for disc, `mov rax, [enum_ptr+8]` for projection.

---

## 17. Complete Instruction Reference

| # | Instruction | Category | § |
|---|------------|----------|---|
| 1 | `lit` | Literal | [§8.1](#81-literals) |
| 2 | `stdout` | I/O | [§8.2](#82-io) |
| 3 | `stdin` | I/O | [§8.2](#82-io) |
| 4 | `lambda` | Function | [§8.3](#83-functions) |
| 5 | `lambda_block` | Function | [§8.3](#83-functions) |
| 6 | `call` | Function | [§8.3](#83-functions) |
| 7 | `add` | Arithmetic | [§8.4](#84-arithmetic) |
| 8 | `sub` | Arithmetic | [§8.4](#84-arithmetic) |
| 9 | `mul` | Arithmetic | [§8.4](#84-arithmetic) |
| 10 | `div` | Arithmetic | [§8.4](#84-arithmetic) |
| 11 | `rem` | Arithmetic | [§8.4](#84-arithmetic) |
| 12 | `lt` | Comparison | [§8.5](#85-comparison) |
| 13 | `gt` | Comparison | [§8.5](#85-comparison) |
| 14 | `le` | Comparison | [§8.5](#85-comparison) |
| 15 | `ge` | Comparison | [§8.5](#85-comparison) |
| 16 | `eq` | Comparison | [§8.5](#85-comparison) |
| 17 | `ne` | Comparison | [§8.5](#85-comparison) |
| 18 | `and` | Logic | [§8.6](#86-logic) |
| 19 | `or` | Logic | [§8.6](#86-logic) |
| 20 | `not` | Logic | [§8.6](#86-logic) |
| 21 | `phi` | Control flow | [§8.7](#87-control-flow) |
| 22 | `fetch` | Memory access | [§8.8](#88-memory-access--fetch-and-place) |
| 23 | `place` | Memory access | [§8.8](#88-memory-access--fetch-and-place) |
| 24 | `field` | Field extraction | [§8.9](#89-structure-construction) |
| 25 | `struct_cons` | Construction | [§8.9](#89-structure-construction) |
| 26 | `enum_cons` | Construction | [§8.9](#89-structure-construction) |
| 27 | `enum_disc` | Enum discriminant | [§8.9](#89-structure-construction) |
| 28 | `enum_proj` | Enum projection | [§8.9](#89-structure-construction) |
| 29 | `array_lit` | Construction | [§8.9](#89-structure-construction) |
| 30 | `tuple_lit` | Construction | [§8.9](#89-structure-construction) |
| 31 | `struct_update` | Update | [§8.10](#810-structure-update) |
| 32 | `array_access` | Update | [§8.10](#810-structure-update) |
| 33 | `array_update` | Update | [§8.10](#810-structure-update) |
| 34 | `tuple_update` | Update | [§8.10](#810-structure-update) |

*Last updated: 2026-06-16 — v4 with design rationale, asm hints (rv64gc/x86-64), 34 instructions.*
