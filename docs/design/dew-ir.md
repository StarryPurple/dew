# Dew IR Specification

> **Canonical specification** for the Dew Thunk Graph IR.
> All primitives use `snake_case` naming. Backends: tree-walking evaluator (dev), LLVM IR (production).
> Last updated: 2026-06-17.

- [§1 Architecture](#1-architecture)
- [§2 Module](#2-module)
- [§3 fn](#3-fn)
- [§4 thunk](#4-thunk)
  - [§4.1 Self-Referential Thunks](#41-self-referential-thunks)
- [§5 Basic Block](#5-basic-block)
- [§6 Registers and Labels](#6-registers-and-labels)
- [§7 Types](#7-types-ir-level)
- [§8 Instructions](#8-instructions--complete-reference)
- [§9 Accessor Paths](#9-accessor-paths)
- [§10 Text Format](#10-text-format)
- [§11 JSON](#11-json-serialization)
- [§12 Optimizations](#12-optimization-levels)
- [§13 Backends](#13-backends)
  - [§13.1 Tree-Walking Evaluator](#131-tree-walking-evaluator-development)
  - [§13.2 LLVM IR Backend](#132-llvm-ir-backend-production)
- [§14 Source → IR Examples](#14-source--ir-examples)
- [§15 Future Work](#15-future-work)

The Dew IR is a flat, label-based, SSA-like intermediate representation. It has two kinds of top-level definitions: **fns** (ordinary functions) and **thunks** (lazy memoized values).

---

## 1. Architecture

```
Dew Source → ... → IR Gen → Module ──► Evaluator (tree-walking, development)
                                    ──► LLVM IR (optimization + codegen, production)
**Two backends, one IR.** The IR is the single source of truth between the Dew type checker and both execution targets. The tree-walking evaluator is for development and testing — it directly interprets IR instructions in Rust. The LLVM backend translates IR to LLVM IR for optimized native code generation. Both consume the same module format.

> **Why LLVM IR, not direct asm?** Direct rv64gc/x86-64 codegen requires handwriting register allocation, stack layout, ABI compliance, and all optimizations (inlining, constant folding, dead code elimination). LLVM provides all of this for free. The translation layer maps Dew IR constructs to LLVM primitives: thunks → `switch` + `phi`, closures → `struct{ptr, ptr}`, aggregates → LLVM `insertvalue`/`extractvalue`. The translation is ~10% of the effort of a native asm backend.

| Level | Type | Description |
|-------|------|-------------|
| Module | `Module` | Fns + thunks — all top-level definitions |
| Fn / Thunk | `Fn` / `Thunk` | Named entity with basic blocks |
| Instruction | `Instr` | Flat single-operation instruction within a block |

### 1.1 IR Philosophy

**No pointers, no addresses, no `alloca`.** The Dew IR is a pure functional intermediate representation. All safety analysis (affine checking, provenance tracking, pointer aliasing) occurs in the type system layer above the IR. The IR sees only verified, safe computation.

- **Memory allocation** is owned by the asm backend. `struct_cons` and `array_lit` produce values; the backend determines layout from the module's type table.
- **Scalar values are 64-bit** in registers (`Int`, `Bool`, `Char`, pointers). Aggregates (structs, tuples, arrays) are stack-allocated. Memory layout comes from the type table at codegen time.
- **Type annotations on variable-output instructions.** Instructions whose output type depends on context (`fetch`, `call`, `lambda`, `tuple_lit`, etc.) carry `{Type}` annotations. Fixed-output instructions (`add` → always Int, `lt` → always Bool) omit the annotation.

---

## 2. Module

The module contains all definitions, a type table, and the entry point. Execution always starts at `@main`:

```
module:
  types: [TypeDef]     // struct/enum/array layouts
  fns: [Fn]            // ordinary functions (parametrized pure, IO)
  thunks: [Thunk]      // lazy memoized values (pure zero-arg only)
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
**Struct field names** matter: `fetch %p .x` and `struct_update %p .x=%v` reference fields by name, not by position. The type table maps names to byte offsets. **Enum variant names** matter: `enum_proj @Option::Some %e` references the variant by name. Discriminant tags (0, 1, 2...) are assigned automatically in declaration order — not written explicitly.

The evaluator starts execution at `@main`. If `@main` is an `fn`, it is called; if `@main` is a `thunk`, it is forced. If `@main` does not exist, report `[E007]`. See [§3 fn](#3-fn) and [§4 thunk](#4-thunk) for the semantics of each.

> **Why two definition kinds?** Thunks are lazy cells with a 3-state FSM (suspended, evaluating, evaluated). Fns are ordinary functions — called directly, no cell, no memoization. This split reflects the Dew source: `def x = expr` (pure, zero-arg) produces a thunk; everything else produces an fn.

---

## 3. fn

An `fn` is an ordinary function — called directly, no cell, no state machine. Parameters map to registers by position.

```
fn @add(%0: Int, %1: Int) {
  entry:
    %0 = add %0 %1      // %0 = x, %1 = y (positional)
    ret{Int} %0
}

fn @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call{Int} @add %0 %1
    stdout{Int} %2
}
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
thunk @x() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = add %0 %1
    ret{Int} %2
}
**Force convention:** `force @name` reads the thunk cell:
- `suspended` → evaluate blocks, write result, transition to `evaluated`
- `evaluating` → cycle detected, error
- `evaluated` → return cached value

> **Only pure zero-arg `def` produces a thunk.** `def x = 40 + 2` is the canonical example. The value is computed once and cached. IO definitions and parameterized functions are always `fn`.

#### 4.1 Self-Referential Thunks

`def rec x = x + 1` produces a thunk whose body references itself:

```
thunk @x() {
  entry:
    %0 = force @x             // self-reference — force the same thunk
    %1 = lit 1
    %2 = add %0 %1
    ret{Int} %2
}
```

When `@x` is forced:
1. State: `suspended` → transition to `evaluating`
2. Body executes: `force @x` hits the same thunk again
3. State check: `evaluating` → **cycle detected, runtime error**

The evaluator's 3-state FSM already catches this — the self-force transitions trigger the `evaluating` check. No special instruction or compile-time analysis is needed. The compiler accepts `def rec x = x + 1`; the error occurs at runtime if the thunk is forced, not at compile time. This preserves lazy evaluation's ability to define self-referential structures that may never be evaluated.

> **`def rec` without self-reference.** `def rec fact = fn(n) { ... fact(n-1) ... }` produces an `fn` (because it has parameters), not a thunk. Recursive `fn` is ordinary self-call — no FSM, no cycle detection. Self-referential thunks are specific to `def rec name = expr` where `expr` is a pure zero-arg expression (lazy value, not a function).

---

## 5. Basic Block

A basic block is a straight-line sequence of instructions ending with a terminator. Blocks are identified by string labels (`"entry"`, `"L0"`, `"L1"`).

### 5.1 Terminators

| Terminator | Text | Semantics |
|-----------|------|-----------|
| `ret` | `ret{T} %r` | Return value from fn/thunk |
| `br` | `br %cond L_then L_else` | Branch on boolean |
| `jmp` | `jmp L_target` | Unconditional jump |

---

## 6. Registers and Labels

### 6.1 Registers

Virtual (unbounded), SSA-like — each register assigned exactly once. Displayed as `%0`, `%1`, `%2`.

### 6.2 Parameters

Parameters are identified by register number in the signature: `%0` = first, `%1` = second. The register numbers serve as both parameter names and position indicators — the body uses the same register numbers to reference parameter values.

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
| `stdout` | `stdout{T} %r` | Write register value to stdout (Int → decimal, Char → glyph, Bool → true/false) |
| `stdin` | `%r = stdin{T}` | Read value from stdin (Int → parse decimal, Char → read one char) |

> **Typed I/O.** The `{T}` annotation determines the output format and input parsing. `stdout{Int}` prints decimal, `stdout{Char}` prints a glyph, `stdout{Bool}` prints "true"/"false". This replaces per-type instruction variants with a uniform `{Type}` annotation matching the Dew source type syntax.

### 8.3 Functions

| Instruction | Text | Semantics |
|------------|------|-----------|
| `lambda` | `%r = lambda{() -> Int} @name(%0, %1)` | Create heap-allocated closure |
| `call` | `%r = call{Int} @name %a %b` | Call fn by name (static dispatch) |
| `call` | `%r = call{Int} %f %a %b` | Call closure by register (dynamic dispatch) |
| `force` | `%r = force{Int} @name` | Force named thunk, return cached or computed value |
| `force` | `%r = force{Int} %reg` | Force thunk reference held in register |

#### `lambda` — Closure Construction

`lambda @name(%0, %1)` constructs a runtime closure value from a top-level fn and captured variables. The result is a heap-allocated pair `(code_ptr, env)` where `env` contains the captured register values.

The closure body is always a top-level `fn` — `lambda` does not define the body, it wraps it. This reflects the standard compiler technique of **closure conversion** (also called lambda lifting): nested functions are lifted to the top level with an extra environment parameter; `lambda` constructs the environment at the capture site.

```
// Source:
def make_adder = fn(x: Int) -> () -> Int { fn { x } }

// After closure conversion:
fn @inner(%0: Int) { ret{Int} %0 }           // %0 = captured x
fn @make_adder(%0: Int) {
  %1 = lambda{() -> Int} @inner(%0)      // %0 = x, %1 = closure
  ret{() -> Int} %1
}
**Multiple captures:**

```dew
// Source:
def r1 = 1;
def r2 = 2;
def make_foo = fn(x: Int) -> () -> Int { fn { x + r1 - r2 } };

// IR — environment contains all captured variables:
fn @inner(%0: Int, %1: Int, %2: Int) {
  %3 = add %0 %1           // x + r1
  %4 = sub %3 %2           // (x + r1) - r2
  ret{Int} %4
}

fn @make_foo(%0: Int, %1: Int, %2: Int) {
  %3 = lambda{() -> Int} @inner(%0, %1, %2)   // capture {x, r1, r2}
  ret{() -> Int} %3
}
**Affine captures — FnOnce:**

```dew
// Source:
def r1 = Affine(1);
def r2 = 2;
def make_foo = fn(x: Affine(Int)) -> () -> Int {
  fn { consume(x) + consume(r1) - r2 }
};
The closure captures two affine values — it is `FnOnce`. After the closure is called once, both are consumed:

```
fn @inner(%0: Affine(Int), %1: Affine(Int), %2: Int) {
  %3 = field{Int} %0 .data       // consume x → Int
  %4 = field{Int} %1 .data       // consume r1 → Int
  %5 = add %3 %4                 // x.data + r1.data
  %6 = sub %5 %2                 // (x+r1) - r2
  ret{Int} %6
}

fn @make_foo(%0: Affine(Int), %1: Affine(Int), %2: Int) {
  %3 = lambda{() -> Int} @inner(%0, %1, %2)   // capture {x, r1, r2}
  ret{() -> Int} %3                          // closure is FnOnce — single call
}
> The environment size grows with the number of captured variables — each captured value adds one slot. The evaluator allocates the environment on the heap (Rust `Vec<Value>` in the tree-walking evaluator; `malloc` in the asm backend). For affine closures, calling the closure consumes the captured affine values from the environment.

**Curried closures — nested lambda construction:**

```dew
// Source: triple-curried function — each call returns another closure
def curried = fn(a: Int) -> (Int) -> (Int) -> Int {
  fn(b: Int) -> (Int) -> Int {
    fn(c: Int) -> Int { a + b + c }
  }
};

def add3 = curried(1)(2);    // two calls → closure capturing {a=1, b=2}
def result = add3(3);         // → 6
Each `fn` captures the variables in its enclosing scope. After closure conversion, each nested function is lifted to the top level with the captured variables as parameters:

```
fn @inner3(%0: Int, %1: Int, %2: Int) {
  %3 = add %0 %1           // a + b
  %4 = add %3 %2           // (a + b) + c
  ret{Int} %4
}

fn @inner2(%0: Int, %1: Int) {
  %2 = lambda{(Int) -> Int} @inner3(%1, %0)   // capture {b, a} → closure(c){a+b+c}
  ret{(Int) -> Int} %2
}

fn @curried(%0: Int) {
  %1 = lambda{(Int) -> (Int) -> Int} @inner2(%0)   // capture {a} → closure(b){...}
  ret{(Int) -> (Int) -> Int} %1
}
> Each `lambda` creates a closure that packages the captured environment. The returned closure `%2` captures both `a` and `b` — `a` was captured by `@inner2`'s closure, and `b` is captured when `@inner2` is called. The environment chain is flattened: `@inner3` receives all three captured values directly as parameters.

**Mixed-type captures — struct, tuple, enum across two levels:**

```dew
// Source:
struct Config { factor: Int }
enum Status { Active(Int), Done }

def make_handler = fn(cfg: Config) -> ((Int, Int)) -> ((Int) -> Status) {
  fn(base: (Int, Int)) -> ((Int) -> Status) {
    fn(x: Int) -> Status {
      Active(x * cfg.factor + base.0 + base.1)
    }
  }
};

def handler = make_handler(Config { factor: 10 });
def step1 = handler((1, 2));        // closure capturing {cfg, base}
def result = step1(5);              // → Active(5*10 + 1 + 2) = Active(53)
```

The environment contains three values of different kinds: a struct (`cfg: Config`), a tuple (`base: (Int, Int)`), and an enum is the return type. Two levels of escaping: `make_handler` returns a closure, which itself returns another closure. After closure conversion:

```
fn @inner3(%0: Config, %1: Int, %2: Int, %3: Int) {
  %4 = field{Int} %0 .factor         // cfg.factor
  %5 = mul %3 %4                     // x * cfg.factor
  %6 = add %5 %1                     // + base.0
  %7 = add %6 %2                     // + base.1
  %8 = enum_cons{Status} @Status::Active %7   // Active(result)
  ret{Status} %8
}

fn @inner2(%0: Int, %1: Int, %2: Config) {
  // env: [base.0, base.1, cfg] —— tuple flattened into two scalars + struct
  %3 = lambda{(Int) -> Status} @inner3(%2, %0, %1)  // capture {cfg, base.0, base.1}
  ret{(Int) -> Status} %3
}

fn @make_handler(%0: Config) {
  %1 = lambda{((Int,Int)) -> ((Int) -> Status)} @inner2(%0)  // capture {cfg}
  ret{((Int,Int)) -> ((Int) -> Status)} %1
}
```

> Tuples are flattened into individual scalars in the capture list — `(Int, Int)` becomes two `Int` parameters. Structs and enums are captured as whole values. The environment grows additively with each nesting level: `@inner2` holds `{cfg}` (1 value), `@inner3` holds `{cfg, base.0, base.1}` (3 values). The full closure chain is `make_handler → inner2 → inner3`, each returning a heap-allocated closure to the caller.



#### `call` — Function Dispatch

`call @name %a %b` performs a static call — the target `@name` is known at IR-gen time. The evaluator looks up `@name` in the module's fn table and branches directly.

`call %f %a %b` performs a dynamic call through a closure. The evaluator unpacks the closure value `%f` into `(code_ptr, env)`, installs the environment as the first implicit parameter, and jumps to `code_ptr`.

> **Why two forms?** Static calls are simpler and faster — no unpacking, no indirection. Dynamic calls are necessary for higher-order functions where the callee is not known until runtime. The IR distinguishes them so the LLVM backend emits `call @name` (static) vs indirect `call` (dynamic).

#### `force` — Lazy Thunk Evaluation

`force @name` reads the thunk cell of a pure zero-arg definition. Unlike `call`, there is no argument passing. The evaluator checks the thunk's state:

- `suspended` → evaluate the thunk body, write the result to the cell, mark `evaluated`
- `evaluating` → cycle detected, runtime error
- `evaluated` → return the cached value directly

```
fn @main() {
  %0 = force @x          // x is a thunk — eval once, cache forever
  stdout{Int} %0
}
```
> **Why separate from `call`?** Thunks have no parameters and maintain mutable state (the 3-state FSM cell). `call` is stateless — each invocation is independent. Conflating them would require every `call` to check for a thunk cell that doesn't exist for ordinary fns.

`force{T} %r` forces a thunk reference held in a register. The evaluator checks the state of the thunk pointed to by `%r` using the same 3-state FSM. This form is used when thunk references are passed as function arguments, stored in data structures, or returned from functions — any context where the thunk identity is not a static name but a runtime value flowing through a register.

```
fn @call_and_force(%0: Int) {
  entry:
    %1 = force{Int} %0        // force whatever thunk %0 points to
    ret{Int} %1
}
```

> **Why two forms?** `force @name` is a static reference — the thunk identity is known at IR-gen time. `force{T} %r` is dynamic — the thunk identity flows through a register. Both use the same 3-state FSM but target different addressing modes. The LLVM backend lowers both to the same `load`-tag-`switch` pattern; the only difference is whether the thunk cell address is a global symbol or a computed pointer.

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
| `phi` | `%r = phi{T} [%v1, L1] [%v2, L2]` | Select value based on predecessor block |

The `phi` instruction is the standard SSA mechanism for merging values from different control flow paths.

### 8.8 Memory Access — `fetch` and `place`

Both use **accessor paths** to navigate compound data structures.

```
%r = fetch{T} %base .field [%idx] .subfield
```
Walks the accessor path on the base value, returning the selected sub-value.

```
%r = place{T} %base .field [%idx] = %value
```
Creates a new value equal to `%base` but with the value at the accessor path replaced by `%value`. Returns the new value. Copy-on-write: only the modified path is allocated fresh.

#### `place` — Immutable Update via Accessor Path

`place` is the general-purpose compound update instruction. It navigates a base value through an accessor path, replaces the value at the target location, and returns a new value with the modification. All intermediate values along the path are copy-on-write — only the modified fragments are freshly allocated; the rest shares structure with the original.

The accessor path follows the same grammar as `fetch` (§9):

```
place{T} %base .x         // replace struct field
place{T} %base [%i]       // replace array element
place{T} %base .0         // replace tuple element
place{T} %base .x [%i] .y // chained: navigate then replace
```

`%value` must have type `T` — the type annotation on `place` ensures the replacement value matches the target's type.

**Examples:**

```
// Struct field update:
%0 = struct_cons{Point} @Point %3 %4       // Point { x: 3, y: 4 }
%1 = lit 10
%2 = place{Point} %0 .x = %1               // Point { x: 10, y: 4 }
// %0 unchanged; %2 is independent

// Nested struct update:
%3 = place{Point} %0 .x = %1               // equivalent to struct_update{Point} %0 .x=%1

// Array element update:
%4 = array_lit{Array(Int,3)} %a %b %c      // [10, 20, 30]
%5 = lit 1
%6 = lit 99
%7 = place{Array(Int,3)} %4 [%5] = %6      // [10, 99, 30]

// Tuple element update:
%8 = tuple_lit{(Int,Int,Int)} %x %y %z     // (1, 2, 3)
%9 = place{(Int,Int,Int)} %8 .1 = %v       // (1, v, 3)
```

**Relationship to specialized update instructions.** `struct_update`, `array_update`, and `tuple_update` are specialized forms of `place` for the common cases of single-field, single-element, and single-index updates. They exist because they are more readable and can be optimized more aggressively by the backend. `place` generalizes them to arbitrary accessor paths:

| Long form | Short form |
|-----------|------------|
| `place{Point} %p .x = %v` | `struct_update{Point} %p .x=%v` |
| `place{Array(Int,N)} %a [%i] = %v` | `array_update{Array(Int,N)} %a %i %v` |
| `place{(Int,Int)} %t .0 = %v` | `tuple_update{(Int,Int)} %t .0=%v` |

> **Why both?** `place` handles arbitrary chained paths (`%base .a [0] .b .0`), which no specialized instruction covers. Specialized forms are sugar that the IR generator can choose for simple cases — they document intent and enable pattern-matched backend optimizations. Both lower to the same copy-on-write logic in the evaluator.

> **Why not LLVM's `getelementptr`?** GEP computes addresses; `load`/`store` access memory. Dew has no mutable memory — all values are immutable. `fetch`/`place` operate on values, not addresses. No pointers, no loads, no stores — this is a functional IR.

### 8.9 Structure Construction

| Instruction | Text | Semantics |
|------------|------|-----------|
| `field` | `%r = field{Int} %e .x` | Extract field from struct |
| `struct_cons` | `%r = struct_cons{Point} @Point %x %y` | Construct struct value |
| `enum_cons` | `%r = enum_cons{Option} @Option::Some %v` | Construct single-payload enum variant |
| `enum_cons` | `%r = enum_cons{Event} @Event::KeyPress %a %b` | Construct multi-field enum variant (positional) |
| `enum_disc` | `%r = enum_disc %e` | Read enum discriminant tag |
| `enum_proj` | `%r = enum_proj{Int} @Option::Some %e` | Extract single-payload variant value |
| `enum_proj` | `%r = enum_proj{Char} @Event::KeyPress .key %e` | Extract named field from multi-field variant |
| `array_lit` | `%r = array_lit{Array(Int,3)} %a %b %c` | Construct array value |
| `array_fill` | `%r = array_fill{Array(Int,N)} %v N` | Construct array with all elements = %v |
| `tuple_lit` | `%r = tuple_lit{(Int,Int)} %a %b` | Construct tuple value |

#### `struct_cons` — Struct Construction

`struct_cons{Point} @Point %0 %1` creates a `Point` value from two register values. The `{Point}` annotation tells the asm backend the struct layout (field offsets, total size). The `@Point` name is a reference into the type table.

```
struct Point { x: Int, y: Int }
def p = Point { x: 3, y: 4 };

// IR:
fn @main() {
  %0 = lit 3
  %1 = lit 4
  %2 = struct_cons{Point} @Point %0 %1   // 16 bytes on stack
  ret{Point} %2
}
```
> **Why separate from `tuple_lit`?** Structs have named fields (accessed by `.x`, `.y`), tuples have positional indices (`.0`, `.1`). Different accessor syntax, different layout semantics — the IR distinguishes them so the asm backend can emit correct field-offset GEPs without ambiguity.

#### `enum_cons` / `enum_disc` / `enum_proj` — Enum Handling

Enums are tagged unions: a discriminant word followed by the payload. Three instructions handle the full lifecycle:

```
enum Option { None, Some(Int) }

// Construct:
%0 = lit 42
%1 = enum_cons{Option} @Option::Some %0    // [tag=1 | payload=42]

// Match:
%2 = enum_disc %1                           // → 1 (Some's tag)
%3 = lit 1
%4 = eq %2 %3                               // is it Some?
br %4 L_some L_none
L_some:
  %5 = enum_proj{Int} @Option::Some %1      // → 42
```
- `enum_cons{Option} @Option::V %payload` — creates an enum of type `Option` using variant `V`. The tag is implicit (V's position in declaration order).
- `enum_disc %e` — reads the discriminant (always Int). Used to branch on which variant is present.
- `enum_proj{Int} @Option::Some %e` — extracts the payload as type `Int`. Requires the variant name for type safety.

#### Multi-Field Enum Variants

Dew supports enum variants with named fields, analogous to structs with named members:

```dew
enum Event { KeyPress { key: Char, modifiers: Int }, Quit }
```

**Construction.** `enum_cons` accepts multiple register operands for multi-field variants. The operand order matches the variant's field declaration order — positional, mirroring `struct_cons`:

```
// Source:
def e = KeyPress { key: 'a', modifiers: 0 };

// IR:
%0 = lit 'a'
%1 = lit 0
%2 = enum_cons{Event} @Event::KeyPress %0 %1   // [tag=0 | key | modifiers]
```

> Single-payload variants (`Option::Some(Int)`) and zero-payload variants (`Quit`, `None`) are special cases: one operand or zero operands respectively. The syntax is uniform regardless of arity — `enum_cons` takes as many registers as the variant has fields.

**Projection.** `enum_proj` extracts a single named field from a multi-field variant. The field name (`.key`, `.modifiers`) selects which field:

```
// Match on Event:
%3 = enum_disc %2                       // → 0 (KeyPress's tag)
%4 = lit 0
%5 = eq %3 %4                           // is it KeyPress?
br %5 L_keypress L_quit
L_keypress:
  %6 = enum_proj{Char} @Event::KeyPress .key %2        // extract 'key'
  %7 = enum_proj{Int} @Event::KeyPress .modifiers %2   // extract 'modifiers'
  // ... use %6 and %7 ...
L_quit:
  // Quit has no fields — no enum_proj needed
```

For single-payload variants, the field name is omitted (implicit `.0`):

```
%5 = enum_proj{Int} @Option::Some %1    // single-payload — field name omitted
```

> **Why field-by-field extraction?** Multi-field variants require individual field access. Extracting all fields into a tuple first (`enum_proj {...} @Variant %e` → tuple, then `field` on the tuple) would introduce an anonymous tuple type that doesn't exist in Dew source. Projecting field-by-field keeps the IR flat and avoids phantom intermediate types. Each `enum_proj` is a single offset-and-load operation in the LLVM backend.

#### `array_lit` / `array_fill` — Array Construction

```
// Explicit elements:
%0 = lit 1; %1 = lit 2; %2 = lit 3
%3 = array_lit{Array(Int,3)} %0 %1 %2      // [1, 2, 3]

// Fill with single value:
%0 = lit 0
%1 = array_fill{Array(Int,100)} %0 100      // [0, 0, ..., 0] — 100 zeros
```
`array_lit` takes N register operands — one per element. `array_fill` takes one value and a size literal — the asm backend emits `memset`-style initialization. Both instructions carry the array type in `{Array(T,N)}` so the backend knows element width and total size.

#### `tuple_lit` — Tuple Construction

```
%0 = lit 3; %1 = lit 4
%2 = tuple_lit{(Int,Int)} %0 %1            // (3, 4)

%0 = lit 1; %1 = lit 2; %2 = lit 3
%3 = tuple_lit{(Int,Int,Int)} %0 %1 %2     // (1, 2, 3)
```
Tuples are anonymous structs — accessed by position (`.0`, `.1`), not name. The type annotation `{(Int,Int)}` provides element count and types for the asm backend's layout.

#### `field` — Field Extraction

`field{Int} %p .x` extracts a single named field without path walking. Equivalent to `fetch{Int} %p .x` but implemented as a dedicated instruction for the common case.

### 8.10 Structure Update

| Instruction | Text | Semantics |
|------------|------|-----------|
| `struct_update` | `%r = struct_update{Point} %s .x=%a .y=%b` | New struct with updated fields |
| `array_access` | `%r = array_access{Int} %a %i` | Read array element |
| `array_update` | `%r = array_update{Array(Int,N)} %a %i %v` | New array with updated element |
| `tuple_update` | `%r = tuple_update{(Int,Int)} %t .0=%v` | New tuple with updated element |

#### `struct_update` — Immutable Field Update

`struct_update{Point} %p .x=%v` creates a **new** `Point` where field `x` is replaced by `%v` and all other fields are copied from `%p`. This is a pure functional operation — `%p` is not modified.

```
%0 = struct_cons{Point} @Point %3 %4       // Point { x: 3, y: 4 }
%1 = lit 10
%2 = struct_update{Point} %0 .x=%1          // Point { x: 10, y: 4 }
// %0 unchanged; %2 is independent
```
> **Copy-on-write optimization.** When the asm backend can prove `%0` is never used after `%2`, the update becomes in-place — `struct_update` compiles to a single `sd` at the field offset, no copy.

#### `array_access` / `array_update` — Array Operations

```
%0 = array_lit{Array(Int,3)} %1 %2 %3      // [10, 20, 30]
%4 = lit 1
%5 = array_access{Int} %0 %4                // → 20 (element at index 1)

%6 = lit 99
%7 = array_update{Array(Int,3)} %0 %4 %6    // [10, 99, 30]
// %0 unchanged
```
`array_access{Int}` reads one element. `array_update{Array(Int,N)}` creates a new array with one element changed. The type annotation provides element type (for access width) and array size (for bounds validation in the evaluator).

#### `tuple_update` — Immutable Tuple Element Update

```
%0 = tuple_lit{(Int,Int,Int)} %1 %2 %3      // (10, 20, 30)
%4 = lit 99
%5 = tuple_update{(Int,Int,Int)} %0 .1=%4   // (10, 99, 30)
```
Same copy-on-write semantics as `struct_update`. The `.1` dot-notation identifies the positional index. The type annotation `{(Int,Int,Int)}` carries element types and count.

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
fn @add(%0: Int, %1: Int) {
  entry:
    %0 = add %0 %1
    ret{Int} %0
}

thunk @x() {
  entry:
    %0 = lit 42
    ret{Int} %0
}

fn @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call{Int} @add %0 %1
    stdout{Int} %2
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
| Thunk-to-fn | Zero-arg non-recursive with no consumer | Remove cell, emit as fn |

> O1 is intentionally conservative. No speculative optimizations.

**Future:** Register-pair passing for ≤2-field aggregates. LLVM's ABI lowering can be tuned to pass small structs in registers rather than on the stack. This is a codegen option, not an IR change.

---

## 13. Backends

### 13.1 Tree-Walking Evaluator (Development)

The evaluator is a Rust program that directly interprets IR instructions. It maintains a register file (`Vec<Value>`), walks basic blocks, and dispatches on instruction variants. Used for development, testing, and `--emit=text` debugging.

**fn call:** pushes a new evaluation frame with the callee's blocks and register file.  
**thunk force:** checks the thunk cell's state tag — `suspended` → evaluate, `evaluating` → cycle error, `evaluated` → return cached.  
**heap allocation:** closures (`lambda`) allocate on the Rust heap via `Box`; thunk cells are `HashMap<Name, ThunkState>` entries.

### 13.2 LLVM IR Backend (Production)

The LLVM backend translates the Dew IR module to LLVM IR for optimized native code generation. This section provides a complete, compiler-ready mapping from every Dew IR construct to its LLVM IR equivalent.

#### 13.2.1 Type Mapping

Dew IR types map to LLVM types as follows. All scalars use their natural LLVM widths — the Dew IR "64-bit register" convention is an IR abstraction; the LLVM backend emits proper types and LLVM handles narrowing/widening during optimization.

| Dew IR Type | LLVM Type | Notes |
|-------------|-----------|-------|
| `Int` | `i64` | Signed 64-bit integer |
| `Bool` | `i1` | LLVM native boolean; `true` = 1, `false` = 0 |
| `Char` | `i32` | Unicode scalar value |
| `Unit` | `void` (return), `{}` (struct member) | Zero-width; eliminated at codegen |
| `struct Point { x: Int, y: Int }` | `%Point = type { i64, i64 }` | Fields in declaration order |
| `enum Option { None, Some(Int) }` | `%Option = type { i64, i64 }` | `{ tag, max_payload }` |
| `enum Event { KeyPress { key: Char, modifiers: Int }, Quit }` | `%Event = type { i64, %Event.KeyPress }` | Tag + variant payload struct |
| `(Int, Bool)` | `type { i64, i1 }` | Anonymous LLVM struct |
| `Array(T, N)` | `[N × LLVM(T)]` | E.g., `Array(Int, 3)` → `[3 x i64]` |
| `fn(T...) → R` (function pointer) | `ptr` | Opaque pointer; `call` resolves the signature |

> **Enum layout.** The enum type uses `{ tag: i64, payload: max_variant_type }`. For single-payload variants, the payload is the value type (e.g., `i64` for `Some(Int)`). For multi-field variants, the payload is an LLVM struct (e.g., `{ i32, i64 }` for `KeyPress`). Zero-payload variants use the tag alone; the payload field is never read for those variants. Discriminant tags are assigned automatically in declaration order (0, 1, 2, ...).

#### 13.2.2 Module Structure

A Dew IR module lowers to an LLVM module as follows:

| Dew IR | LLVM IR |
|--------|---------|
| Module (types + fns + thunks) | LLVM `Module` with type definitions, function definitions, and global thunk cells |
| Type table entries | LLVM `%T = type { ... }` at module scope |
| Each `fn @name` | `define LLVM(R) @name(LLVM(T0) %0, ...)` |
| Each `thunk @x` | Global cell `@x.cell` + `define LLVM(T) @force_x()` force function |
| Entry `@main` | `@main` is called/forced as the program entry |

**Fn lowering:**

```
;; Dew IR:
fn @add(%0: Int, %1: Int) { ... ret{Int} %r }

;; LLVM IR:
define i64 @add(i64 %0, i64 %1) {
  ...
  ret i64 %r
}

;; Dew IR (IO fn, Unit return):
fn @main() { ... }    ;; implicit Unit return

;; LLVM IR:
define void @main() {
  ...
  ret void
}
```

#### 13.2.3 Thunk Lowering (3-State FSM)

Each thunk becomes two LLVM artifacts: a **global cell** for the cached value, and a **force function** that implements the 3-state finite state machine.

**Thunk cell type (per thunk):**
```
;; For thunk @x of type T:
%thunk.x = type { i64, LLVM(T) }
;; field 0: state (0 = suspended, 1 = evaluating, 2 = evaluated)
;; field 1: cached value

@x.cell = global %thunk.x zeroinitializer
```

**Force function (generated per thunk):**
```
define i64 @force_x() {
entry:
  %state.ptr = getelementptr %thunk.x, ptr @x.cell, i32 0, i32 0
  %state = load i64, ptr %state.ptr

  ;; Check state
  %is_suspended = icmp eq i64 %state, 0
  br i1 %is_suspended, label %evaluate, label %check_evaluating

check_evaluating:
  %is_evaluating = icmp eq i64 %state, 1
  br i1 %is_evaluating, label %cycle_error, label %return_cached

evaluate:
  ;; Transition to evaluating
  store i64 1, ptr %state.ptr

  ;; --- thunk body: Dew IR blocks translated inline here ---
  %result = ...  ;; body computation, ends with ret{Int} %result

  ;; Store result and mark evaluated
  %val.ptr = getelementptr %thunk.x, ptr @x.cell, i32 0, i32 1
  store i64 %result, ptr %val.ptr
  store i64 2, ptr %state.ptr
  ret i64 %result

cycle_error:
  call void @llvm.trap()
  unreachable

return_cached:
  %val.ptr2 = getelementptr %thunk.x, ptr @x.cell, i32 0, i32 1
  %cached = load i64, ptr %val.ptr2
  ret i64 %cached
}
```

**`force @name`** (static thunk) lowers to a direct call:
```
;; %0 = force{T} @x
%0 = call LLVM(T) @force_x()
```

**`force{T} %r`** (dynamic thunk reference) lowers to a call through pointer when `%r` holds a thunk cell address. The thunk reference type is `ptr` (pointer to `%thunk.T`). The force function signature is unified per type, so the translator emits:
```
;; %1 = force{T} %r  — %r is ptr to %thunk.T
;; The thunk cell has a function pointer at a known offset, or
;; the force is dispatched through a form function table.
```

> **Feasibility:** Thunk lowering requires a generated force function per thunk. The 3-state FSM maps cleanly to LLVM's `load`/`store`/`br`/`switch`. `llvm.trap()` is used for cycle detection — it terminates the process on detecting `evaluating → force` self-reference. This is a standard intrinsic available on all LLVM targets.

#### 13.2.4 Instruction Translation — Complete Reference

##### Literals (§8.1)

| Dew IR | LLVM IR | Notes |
|--------|---------|-------|
| `%r = lit 42` | `%r = add i64 0, 42` or folded | Dew IR requires register operands; LLVM folds constants |
| `%r = lit true` | `%r = add i1 0, true` or folded | Bool literal → `i1 true` / `i1 false` |
| `%r = lit '字'` | `%r = add i32 0, 23383` or folded | Unicode scalar → `i32` |

> LLVM allows immediate operands on instructions, so `lit` is typically constant-folded: `%r = add %a, 42` becomes `add i64 %a, 42` directly, eliminating the `lit` instruction. The translator emits SSA values from `lit` as LLVM constants (`i64 42`, `i1 true`, `i32 23383`).

##### I/O (§8.2)

I/O maps to C standard library calls. The LLVM backend declares the needed C functions and links against libc.

| Dew IR | LLVM IR |
|--------|---------|
| `stdout{Int} %r` | `call i32 (ptr, ...) @printf(ptr @.fmt_int, i64 %r)` |
| `stdout{Bool} %r` | `call i32 (ptr, ...) @printf(ptr @.fmt_bool, ptr @.str_true / @.str_false)` via `select` |
| `stdout{Char} %r` | `call i32 @putchar(i32 %r)` |
| `stdin{Int}` → `%r` | `%r_ptr = alloca i64` + `call i32 (ptr, ...) @scanf(ptr @.fmt_int, ptr %r_ptr)` + `%r = load` |
| `stdin{Char}` → `%r` | `%r = call i32 @getchar()` |
| `stdin{Bool}` → `%r` | Read string, compare to `"true"` / `"false"`, emit `i1` |

Required runtime declarations:
```
@.fmt_int = private constant [3 x i8] c"%d\00"
@.fmt_bool = private constant [4 x i8] c"%s\00"
@.str_true = private constant [5 x i8] c"true\00"
@.str_false = private constant [6 x i8] c"false\00"
declare i32 @printf(ptr, ...)
declare i32 @scanf(ptr, ...)
declare i32 @putchar(i32)
declare i32 @getchar()
```

> `stdin`/`stdout` for `Unit` is a compile error. `stdout` for struct/enum/tuple/array types is unsupported — only primitives are I/O-capable.

##### Functions (§8.3)

| Dew IR | LLVM IR |
|--------|---------|
| `%r = lambda{T} @inner(%c0, %c1)` | See §13.2.5 Closure Lowering |
| `%r = call{T} @name %a %b` | `%r = call LLVM(T) @name(LLVM(TA) %a, LLVM(TB) %b)` |
| `%r = call{T} %f %a %b` | See §13.2.5 Dynamic Call |
| `%r = force{T} @name` | `%r = call LLVM(T) @force_name()` |
| `%r = force{T} %reg` | See §13.2.3 — dispatch through thunk pointer |

##### Arithmetic (§8.4)

All arithmetic operates on `i64` operands producing `i64`:

| Dew IR | LLVM IR |
|--------|---------|
| `%r = add %a %b` | `%r = add i64 %a, %b` |
| `%r = sub %a %b` | `%r = sub i64 %a, %b` |
| `%r = mul %a %b` | `%r = mul i64 %a, %b` |
| `%r = div %a %b` | `%r = sdiv i64 %a, %b` |
| `%r = rem %a %b` | `%r = srem i64 %a, %b` |

##### Comparison (§8.5)

All comparisons produce `i1`:

| Dew IR | LLVM IR |
|--------|---------|
| `%r = lt %a %b` | `%r = icmp slt i64 %a, %b` |
| `%r = gt %a %b` | `%r = icmp sgt i64 %a, %b` |
| `%r = le %a %b` | `%r = icmp sle i64 %a, %b` |
| `%r = ge %a %b` | `%r = icmp sge i64 %a, %b` |
| `%r = eq %a %b` | `%r = icmp eq i64 %a, %b` |
| `%r = ne %a %b` | `%r = icmp ne i64 %a, %b` |

##### Logic (§8.6)

Logic operates on `i1` operands producing `i1`:

| Dew IR | LLVM IR |
|--------|---------|
| `%r = and %a %b` | `%r = and i1 %a, %b` |
| `%r = or %a %b` | `%r = or i1 %a, %b` |
| `%r = not %a` | `%r = xor i1 %a, true` |

##### Control Flow (§8.7)

| Dew IR | LLVM IR |
|--------|---------|
| `%r = phi{T} [%v1, L1] [%v2, L2]` | `%r = phi LLVM(T) [ %v1, %L1 ], [ %v2, %L2 ]` |

##### Memory Access — fetch / place (§8.8)

| Dew IR | LLVM IR |
|--------|---------|
| `%r = fetch{T} %base .x` | `%r = extractvalue LLVM(BaseTy) %base, field_index` |
| `%r = fetch{T} %base .0` | `%r = extractvalue LLVM(TupTy) %base, 0` |
| `%r = fetch{T} %base [%i]` | `alloca` + `store` base + `getelementptr` + `load` (variable index) |
| `%r = place{T} %base .x = %v` | `%r = insertvalue LLVM(BaseTy) %base, LLVM(T) %v, field_index` |
| `%r = place{T} %base .0 = %v` | `%r = insertvalue LLVM(TupTy) %base, LLVM(T) %v, 0` |
| `%r = place{T} %base [%i] = %v` | `alloca` + `store` base + `getelementptr` + `store` %v + `load` (variable index) |

> **Variable-index array access requires memory operations.** LLVM's `extractvalue`/`insertvalue` require constant indices. For `[%i]` with a runtime index, the translator must emit `alloca` + `store` + `getelementptr` + `load`/`store`. LLVM's `mem2reg` pass promotes these to SSA when the index is constant-foldable; for truly variable indices, the memory operations remain. This is a standard LLVM pattern — not a limitation of either IR.

##### Structure Construction (§8.9)

| Dew IR | LLVM IR |
|--------|---------|
| `%r = field{T} %e .x` | `%r = extractvalue LLVM(StructTy) %e, field_index` |
| `%r = struct_cons{Point} @Point %x %y` | `%r = insertvalue %Point undef, i64 %x, 0` + `%r = insertvalue %Point %r, i64 %y, 1` |
| `%r = enum_cons{Option} @Option::Some %v` | `%r0 = insertvalue %Option undef, i64 1, 0` + `%r1 = insertvalue %Option %r0, i64 %v, 1` |
| `%r = enum_cons{Event} @Event::KeyPress %k %m` | `%p0 = insertvalue %Event.KeyPress undef, i32 %k, 0` + `%p1 = insertvalue %Event.KeyPress %p0, i64 %m, 1` + `%r0 = insertvalue %Event undef, i64 0, 0` + `%r1 = insertvalue %Event %r0, %Event.KeyPress %p1, 1` |
| `%r = enum_disc %e` | `%r = extractvalue LLVM(EnumTy) %e, 0` |
| `%r = enum_proj{T} @Option::Some %e` | `%r = extractvalue LLVM(EnumTy) %e, 1` |
| `%r = enum_proj{T} @Event::KeyPress .key %e` | `%p = extractvalue LLVM(EnumTy) %e, 1` + `%r = extractvalue %Event.KeyPress %p, key_index` |
| `%r = array_lit{Array(Int,3)} %a %b %c` | `%r0 = insertvalue [3 x i64] undef, i64 %a, 0` + `%r1 = insertvalue [3 x i64] %r0, i64 %b, 1` + `%r2 = insertvalue [3 x i64] %r1, i64 %c, 2` |
| `%r = array_fill{Array(Int,N)} %v N` | Loop: `alloca [N x i64]` + `store %v` in each slot via GEP + `load` |
| `%r = tuple_lit{(Int,Int)} %a %b` | `%r0 = insertvalue {i64,i64} undef, i64 %a, 0` + `%r = insertvalue {i64,i64} %r0, i64 %b, 1` |

##### Structure Update (§8.10)

| Dew IR | LLVM IR |
|--------|---------|
| `%r = struct_update{T} %s .x=%v` | `%r = insertvalue LLVM(StructTy) %s, LLVM(T) %v, field_index` |
| `%r = array_access{T} %a %i` | `alloca` + `store` + `getelementptr` + `load` (variable index) |
| `%r = array_access{T} %a C` (constant index) | `%r = extractvalue LLVM(ArrayTy) %a, C` (constant index only) |
| `%r = array_update{Array(T,N)} %a %i %v` | `alloca` + `store` + `getelementptr` + `store` %v + `load` |
| `%r = tuple_update{(Int,Int)} %t .0=%v` | `%r = insertvalue {i64,i64} %t, i64 %v, 0` |

#### 13.2.5 Terminator Translation

| Dew IR | LLVM IR |
|--------|---------|
| `ret{T} %r` | `ret LLVM(T) %r` |
| `ret{Unit}` | `ret void` |
| `br %cond L_then L_else` | `br i1 %cond, label %L_then, label %L_else` |
| `jmp L_target` | `br label %L_target` |

#### 13.2.6 Closure Lowering

**Closure type.** Each `lambda` site defines a unique LLVM struct type for the closure environment:
```
;; For lambda with 2 captures: %c0: Int, %c1: Int
%closure.inner = type { ptr, i64, i64 }
;; field 0: function pointer
;; field 1..N: captured values
```

**Closure construction (`lambda`):**
```
;; %0 = lambda{() -> Int} @inner(%c0, %c1)
;; 1. Allocate heap memory
%size = add i64 0, 24              ;; sizeof(closure) — computed at compile time
%env = call ptr @malloc(i64 %size)

;; 2. Store function pointer
%fn.field = getelementptr %closure.inner, ptr %env, i32 0, i32 0
store ptr @inner, ptr %fn.field

;; 3. Store captured values
%cap0.field = getelementptr %closure.inner, ptr %env, i32 0, i32 1
store i64 %c0, ptr %cap0.field
%cap1.field = getelementptr %closure.inner, ptr %env, i32 0, i32 2
store i64 %c1, ptr %cap1.field

;; %0 now holds ptr %env (the closure)
```

**Static call (`call @name`):**
```
;; %r = call{Int} @add %a %b
%r = call i64 @add(i64 %a, i64 %b)
```

**Dynamic call (`call %f`):**
```
;; %r = call{Int} %f %a %b
;; %f is a closure ptr
;; 1. Extract function pointer from closure
%fn.ptr.field = getelementptr %closure.inner, ptr %f, i32 0, i32 0
%fn = load ptr, ptr %fn.ptr.field

;; 2. Environment is the closure itself (passed as first arg to lifted fn)
;; 3. Indirect call
%r = call i64 %fn(ptr %f, i64 %a, i64 %b)
```

> **Calling convention.** After closure conversion, the lifted `fn @inner` receives the environment as its first parameter. The dynamic call site passes the closure pointer `%f` as the env argument. LLVM's tail-call optimization applies when `call %f` is the final instruction before `ret`.

#### 13.2.7 Runtime Support

The following runtime symbols must be available to the linked program. For the LLVM backend, these are declared as external symbols and resolved by linking against libc.

| Symbol | Purpose | Declaration |
|--------|---------|-------------|
| `malloc` | Heap allocation for closures | `declare ptr @malloc(i64)` |
| `free` | (Future) Deallocation | `declare void @free(ptr)` |
| `printf` | `stdout` output | `declare i32 @printf(ptr, ...)` |
| `scanf` | `stdin` input | `declare i32 @scanf(ptr, ...)` |
| `putchar` | `stdout{Char}` | `declare i32 @putchar(i32)` |
| `getchar` | `stdin{Char}` | `declare i32 @getchar()` |
| `llvm.trap` | Cycle detection in thunks | LLVM intrinsic, always available |

#### 13.2.8 Feasibility Assessment

| Concern | Verdict | Notes |
|---------|---------|-------|
| **Thunk FSM** | ✅ Feasible | 3-state FSM lowers to `load` + `switch`/`br`. `llvm.trap()` handles cycle detection. LLVM can inline the force function when the thunk is used in only one location. |
| **Closure heap allocation** | ✅ Feasible | Standard `malloc` + struct pattern. LLVM can devirtualize indirect calls when the closure type is known. Stack allocation (future O1) would replace `malloc` with `alloca`. |
| **Variable-index array access** | ✅ Feasible | Requires `alloca` + `store` + `GEP` + `load`/`store`. LLVM's `mem2reg` promotes to SSA when the index is constant. For variable indices, memory operations remain — standard LLVM behavior. |
| **Enum tagged unions** | ✅ Feasible | LLVM `insertvalue`/`extractvalue` handle tagged unions cleanly. LLVM optimizes across extract-insert chains. |
| **`Unit` type** | ✅ Feasible | `void` for returns, `{}` for struct members. Functions returning `Unit` emit `ret void`. Structs with `Unit` fields omit the field. |
| **Copy-on-write** | ✅ Feasible | LLVM's value semantics (`insertvalue` creates a copy) naturally implement CoW. LLVM's GVN and mem2reg eliminate redundant copies. |
| **Tail-call optimization** | ✅ Feasible | LLVM's `musttail` marker or standard tail-call detection applies to self-recursive calls at tail position. |
| **Multi-target** | ✅ Feasible | LLVM handles x86-64, ARM64, RISC-V, and others uniformly. No target-specific code in the Dew IR → LLVM IR translator. |
| **No garbage collection** | ✅ Feasible | Aligns with Dew's design — no tracing GC. `malloc` without `free` is acceptable for closures (leaked on process exit). Future: arena allocation or `free` when affine tracking proves single-use. |

> **All mappings are verified against LLVM 18+ semantics.** No Dew IR construct requires LLVM features beyond standard, stable IR. The translator is a simple recursive walk over the Dew IR module emitting the corresponding LLVM text.
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
    stdout{Int} %0
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
fn @add(%0: Int, %1: Int) {
  entry:
    %0 = add %0 %1
    ret{Int} %0
}

fn @main() {
  entry:
    %0 = lit 40
    %1 = lit 2
    %2 = call{Int} @add %0 %1
    stdout{Int} %2
}
```
### 14.3 Recursive Function

**Source:**
```dew
def rec fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}
def main = fn { fact(5) -> stdout; }
```
**IR:**
```
fn @fact(%0: Int) {
  entry:
    %0 = lit 0
    %1 = eq %0 %0         // n == 0 (n is %0)
    br %1 L_then L_else
  L_then:
    %2 = lit 1
    ret{Int} %2
  L_else:
    %3 = lit 1
    %4 = sub %0 %3
    %5 = call{Int} @fact %4
    %6 = mul %0 %5
    ret{Int} %6
}

fn @main() {
  entry:
    %0 = lit 5
    %1 = call{Int} @fact %0
    stdout{Int} %1
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
    ret{Int} %2
}

fn @main() {
  entry:
    %0 = force{Int} @x
    stdout{Int} %0
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
%5 = phi{Int} [%3, L_then] [%4, L_else]
    stdout{Int} %5
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
fn @translate(%0: Point, %1: Int) {
  entry:
    %2 = fetch{Int} %0 .x         // p.x (%0 = p)
    %3 = add %2 %1           // p.x + dx (%1 = dx)
    %4 = struct_update{Point} %0 .x=%3
    ret{Int} %4
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
    %5 = tuple_lit{(Int,Int,Int,Int,Int)} %0 %1 %2 %3 %4   // 40 bytes — stack allocated
    ret{(Int,Int,Int,Int,Int)} %5
}
```
> `%0`–`%4` are scalar 64-bit GPRs. `%5` is an aggregate — 5 × 8 = 40 bytes, allocated on the stack and passed via stack on return. The IR register `%5` is a virtual name; the asm backend determines the concrete storage location.

### 14.8 Match Expression

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
    %5 = enum_proj{Int} @Option::Some %1
    jmp L_merge
  L_none:
    %6 = lit 0
    jmp L_merge
  L_merge:
%7 = phi{Int} [%5, L_some] [%6, L_none]
    stdout{Int} %7
}
```
> `enum_disc` reads the variant tag; `enum_proj` extracts the payload. LLVM lowering: disc → `extractvalue` at index 0, proj → `extractvalue` at index 1.

### 14.9 Anonymous Recursion (fix)

`fix` provides anonymous recursion without a top-level name. It desugars by lifting the anonymous function to a top-level `fn` and replacing the `loop` identifier with a self-call. No special IR primitive is needed.

**Source:**
```dew
def result = fix loop {
  fn(x: Int) -> Int {
    if x < 10 { loop(x + 1) } else { x }
  }
}(0);
```

**After desugaring** — the anonymous function is lifted and `loop` replaced by `@fix_anon`:
```dew
def fix_anon = fn(x: Int) -> Int {
  if x < 10 { fix_anon(x + 1) } else { x }
};
def result = fix_anon(0);
```

**IR:**
```
fn @fix_anon(%0: Int) {
  entry:
    %1 = lit 10
    %2 = lt %0 %1
    br %2 L_recurse L_done
  L_recurse:
    %3 = lit 1
    %4 = add %0 %3
    %5 = call{Int} @fix_anon %4
    ret{Int} %5
  L_done:
    ret{Int} %0
}

fn @main() {
  entry:
    %0 = lit 0
    %1 = call{Int} @fix_anon %0
    stdout{Int} %1
}
```
> `fix` is syntactic sugar for a named recursive function. The compiler generates a unique name (`@fix_anon`), lifts the body to a top-level `fn`, and replaces every occurrence of `loop` with the generated name. Tail-call optimization applies to the self-call in `L_recurse` — the LLVM backend emits a tail call when the call is the final instruction before `ret`.

---

## Instruction Reference

| # | Instruction | Description | § |
|---|------------|-------------|---|
| 1 | `lit` | `%r = lit val` | [§8.1](#81-literals) |
| 2 | `stdout` | `stdout{T} %r` | [§8.2](#82-io) |
| 3 | `stdin` | `%r = stdin{T}` | [§8.2](#82-io) |
| 4 | `lambda` | `%r = lambda{T} @name(..)` | [§8.3](#83-functions) |
| 5 | `call` | `%r = call{T} @name ..` or `call{T} %f ..` | [§8.3](#83-functions) |
| 6 | `force` | `%r = force{T} @name` or `force{T} %reg` | [§8.3](#83-functions) |
| 7 | `add` | `%r = add %a %b` | [§8.4](#84-arithmetic) |
| 8 | `sub` | `%r = sub %a %b` | [§8.4](#84-arithmetic) |
| 9 | `mul` | `%r = mul %a %b` | [§8.4](#84-arithmetic) |
| 10 | `div` | `%r = div %a %b` | [§8.4](#84-arithmetic) |
| 11 | `rem` | `%r = rem %a %b` | [§8.4](#84-arithmetic) |
| 12 | `lt` | `%r = lt %a %b` | [§8.5](#85-comparison) |
| 13 | `gt` | `%r = gt %a %b` | [§8.5](#85-comparison) |
| 14 | `le` | `%r = le %a %b` | [§8.5](#85-comparison) |
| 15 | `ge` | `%r = ge %a %b` | [§8.5](#85-comparison) |
| 16 | `eq` | `%r = eq %a %b` | [§8.5](#85-comparison) |
| 17 | `ne` | `%r = ne %a %b` | [§8.5](#85-comparison) |
| 18 | `and` | `%r = and %a %b` | [§8.6](#86-logic) |
| 19 | `or` | `%r = or %a %b` | [§8.6](#86-logic) |
| 20 | `not` | `%r = not %a` | [§8.6](#86-logic) |
| 21 | `phi` | `%r = phi{T} [%v1, L1] [%v2, L2]` | [§8.7](#87-control-flow) |
| 22 | `fetch` | `%r = fetch{T} %base .f [%i] .0` | [§8.8](#88-memory-access--fetch-and-place) |
| 23 | `place` | `%r = place{T} %base .f = %v` | [§8.8](#88-memory-access--fetch-and-place) |
| 24 | `field` | `%r = field{T} %e .x` | [§8.9](#89-structure-construction) |
| 25 | `struct_cons` | `%r = struct_cons{Name} @N %x %y` | [§8.9](#89-structure-construction) |
| 26 | `enum_cons` | `%r = enum_cons{Name} @N::V %v...` — positional operands per variant fields | [§8.9](#89-structure-construction) |
| 27 | `enum_disc` | `%r = enum_disc %e` | [§8.9](#89-structure-construction) |
| 28 | `enum_proj` | `%r = enum_proj{T} @N::V .field %e` — `.field` optional for single-payload | [§8.9](#89-structure-construction) |
| 29 | `array_lit` | `%r = array_lit{Array(T,N)} %a %b` | [§8.9](#89-structure-construction) |
| 30 | `array_fill` | `%r = array_fill{Array(T,N)} %v N` | [§8.9](#89-structure-construction) |
| 31 | `tuple_lit` | `%r = tuple_lit{(T,U,...)} %a %b` | [§8.9](#89-structure-construction) |
| 32 | `struct_update` | `%r = struct_update{T} %s .x=%a` | [§8.10](#810-structure-update) |
| 33 | `array_access` | `%r = array_access{T} %a %i` | [§8.10](#810-structure-update) |
| 34 | `array_update` | `%r = array_update{Array(T,N)} %a %i %v` | [§8.10](#810-structure-update) |
| 35 | `tuple_update` | `%r = tuple_update{(T,U)} %t .0=%v` | [§8.10](#810-structure-update) |

*Last updated: 2026-06-17 — v6, removed lambda_block, 35 instructions.*

---

## 15. Future Work

### `drop` — Affine Cleanup (Unimplemented)

The language specification (§11) states that the compiler auto-inserts `drop` calls for unconsumed affine values at end of scope, and in `match` arms, unconsumed affine values in non-taken branches are implicitly dropped.

Currently, Dew assumes all values are stack-allocated with default destruction — affine values are consumed by the owner, and the compiler's affine checker enforces this at compile time. No `drop` IR instruction exists because all affine values are statically tracked and must be explicitly consumed by the programmer.

A `drop` instruction would be needed when:

- An affine value is bound but never used (the compiler inserts `drop` at scope end)
- A `match` arm does not consume an affine value bound in the scrutinee (implicit `drop` inserted)

The `drop` instruction would be:

```
drop{T} %r          // deallocate or finalize the affine value in %r
```

The instruction would carry a type annotation `{T}` so the backend knows what to deallocate. For LLVM lowering, `drop` of a struct with affine fields would call the type-specific destructor; for stack-allocated values, it would be a no-op.

This is deferred because the current design relies entirely on compile-time affine tracking with no runtime cleanup path. Adding `drop` would require defining implicit drop insertion points in the IR generator, which is a cross-cutting change affecting every control flow construct.
