# Dew IR Specification

> **Canonical specification** for the Dew Thunk Graph IR.
> Last updated: 2026-06-28.

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
- [§13 Source → IR Examples](#13-source--ir-examples)
- [§14 Future Work](#14-future-work)

The Dew IR is a flat, label-based, SSA-like intermediate representation. It has two kinds of top-level definitions: **fns** (ordinary functions) and **thunks** (lazy memoized values).

---

## 1. Architecture

```
Dew Source → ... → IR Gen → Module ──► Evaluator (tree-walking)
**One backend: the tree-walking evaluator.** The IR is the single source of truth. All interpretation happens directly on the IR instructions in Rust.

| Level | Type | Description |
|-------|------|-------------|
| Module | `Module` | Fns + thunks — all top-level definitions |
| Fn / Thunk | `Fn` / `Thunk` | Named entity with basic blocks |
| Instruction | `Instr` | Flat single-operation instruction within a block |

### 1.1 IR Philosophy

**No pointers, no addresses, no `alloca`.** The Dew IR is a pure functional intermediate representation. All safety analysis (affine checking, provenance tracking, pointer aliasing) occurs in the type system layer above the IR. The IR sees only verified, safe computation.

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

> `fetch`/`place` operate on values, not addresses. No pointers, no loads, no stores — this is a functional IR.

### 8.9 Structure Construction

| Instruction | Text | Semantics |
|------------|------|-----------|
| `field` | `%r = field{Int} %e .x` | Extract field from struct |
| `struct_cons` | `%r = struct_cons{Point} @Point %x %y` | Construct struct value |
| `enum_cons` | `%r = enum_cons{Option} @Option::Some %v` | Construct single-payload enum variant |
| `enum_cons` | `%r = enum_cons{Tree} @Tree::Node %left %right` | Construct multi-positional-payload enum variant |
| `enum_cons` | `%r = enum_cons{Event} @Event::KeyPress %a %b` | Construct multi-field enum variant |
| `enum_disc` | `%r = enum_disc %e` | Read enum discriminant tag |
| `enum_proj` | `%r = enum_proj{Int} @Option::Some[0] %e` | Extract payload by positional index |
| `enum_proj` | `%r = enum_proj{Char} @Event::KeyPress[0] %e` | Extract named field by field index |
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
- `enum_proj{Int} @Option::Some[0] %e` — extracts the first payload field by index. For single-payload variants, use `[0]`. For multi-payload variants, each field has its own index (0, 1, ...). The variant name and index together guarantee the projected type.

#### Multi-Positional Payload Variants

A variant may carry multiple positional payloads — internally packed as a tuple:

```dew
enum Tree { Leaf(Int), Node(Tree, Tree) }
```

**Construction.** `enum_cons` accepts one register per positional payload. Operand order matches the variant's field declaration order:

```
// Source: def t = Node(Leaf(1), Leaf(5));

// IR:
%0 = enum_cons{Tree} @Tree::Leaf %1     // Leaf(1): [tag=0 | payload=1]
%2 = enum_cons{Tree} @Tree::Leaf %3     // Leaf(5): [tag=0 | payload=5]
%4 = enum_cons{Tree} @Tree::Node %0 %2  // Node(Leaf(1), Leaf(5)): [tag=1 | left | right]
```

**Projection.** `enum_proj` uses a positional index `[N]` to extract the Nth payload field:

```
// Match destructuring: Node(left, right) => ...
%5 = enum_disc %4                        // → 1 (Node's tag)
// Jump to Node arm, then project fields:
%6 = enum_proj{Tree} @Tree::Node[0] %4  // → left child (Leaf(1))
%7 = enum_proj{Tree} @Tree::Node[1] %4  // → right child (Leaf(5))
```

**Type table.** The `TypeTable` stores payload fields as `(name, IrType)` pairs. For positional payloads, synthetic field names are the index as a string ("0", "1", ...):

| Variant | Tag | Fields |
|---------|-----|--------|
| `Leaf` | 0 | [("0", Int)] |
| `Node` | 1 | [("0", Tree), ("1", Tree)] |

This uniform representation means `enum_proj` works identically for positional payloads (index lookup) and named fields (name lookup) — the projection instruction carries the index; the type table carries the structural metadata.

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

> Multi-field variants require individual field access. Extracting all fields into a tuple first would introduce an anonymous tuple type that doesn't exist in Dew source. Projecting field-by-field keeps the IR flat.

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



---

---

## 13. Source → IR Examples

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
> `enum_disc` reads the variant tag; `enum_proj` extracts the payload.

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
> `fix` is syntactic sugar for a named recursive function. The compiler generates a unique name, lifts the body to a top-level `fn`, and replaces every occurrence of `loop` with the generated name.

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

The instruction would carry a type annotation `{T}` so the backend knows what to deallocate.

This is deferred because the current design relies entirely on compile-time affine tracking with no runtime cleanup path. Adding `drop` would require defining implicit drop insertion points in the IR generator, which is a cross-cutting change affecting every control flow construct.
