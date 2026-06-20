# Rx ↔ Dew Interop

> **Canonical specification** for translating between Rx (Rust-like imperative) and Dew (pure functional).  
> Last updated: 2026-06-19.

### Contents

- [§1 Motivation](#1-motivation)
- [§2 Rx Language Profile](#2-rx-language-profile)
- [§3 Translation Rules](#3-translation-rules)
  - [§3.1 Type Mapping](#31-type-mapping)
  - [§3.2 Function Translation](#32-function-translation)
  - [§3.3 Mutation → Ownership Transfer](#33-mutation--ownership-transfer)
  - [§3.4 Control Flow Translation](#34-control-flow-translation)
    - [§3.4.1 if/else Restructuring](#341-ifelse-restructuring)
    - [§3.4.2 Loop → Recursion](#342-loop--recursion)
    - [§3.4.3 break and continue](#343-break-and-continue)
    - [§3.4.4 return Translation](#344-return-translation)
    - [§3.4.5 Nested Loops with return](#345-nested-loops-with-return)
    - [§3.4.6 Worked Example — Tree DFS](#346-worked-example--tree-dfs-with-ancestor-table)
  - [§3.5 Reference → Ownership + Return](#35-reference--ownership--return)
  - [§3.6 Match Translation](#36-match-translation)
  - [§3.7 Special Cases](#37-special-cases)
- [§4 Architecture](#4-architecture)
  - [§4.1 Translation Pipeline](#41-translation-pipeline)
  - [§4.2 DewEmitter](#42-dewemitter)
  - [§4.3 Safety Analysis](#43-safety-analysis)
- [§5 Safety Analysis Layers](#5-safety-analysis-layers)
  - [§5.1 Affiliation to Poison Value Mapping](#51-affiliation-to-poison-value-mapping)
  - [§5.2 Owned Pointer Encoding](#52-owned-pointer-encoding)
  - [§5.3 Provenance Encoding](#53-provenance-encoding)
- [§6 Translation Invariants](#6-translation-invariants)
- [§7 Reverse Translation (Dew → Rx)](#7-reverse-translation-dew--rx)
  - [§7.1 Type Mapping](#71-type-mapping)
  - [§7.2 Function Translation](#72-function-translation)
  - [§7.3 Ownership → Mutation](#73-ownership--mutation)
  - [§7.4 Recursion → Loop](#74-recursion--loop)
  - [§7.5 Match → if/else](#75-match--ifelse)
  - [§7.6 Limitations](#76-limitations)
- [§8 Limitations and Future Work](#8-limitations-and-future-work)
- [§9 Reference](#9-reference)

---

## 1. Motivation

Dew's design intent includes serving as an **analysis intermediate representation** for imperative/OO languages. The workflow:

```
Rx Source → Rx→Dew Translator → Dew Source → Dew Type Checker → Safety Report
                                                                    ↓
Rx Source (annotated) ← Dew→Rx Translator ← Restructured Dew ←──────┘
```

This is analogous to Rust's **Miri** (an interpreter that detects undefined behavior), but instead of operating on MIR (a low-level IR), Dew operates on a **high-level functional language** with an expressive type system. The Dew type checker becomes the safety analysis engine for Rx code.

> The insight is that a functional language with affine types is a natural analysis IR for imperative code. Ownership (who uses what, when) becomes explicit through affine typing. Side effects (IO, mutation) become explicit through type annotations. Control flow (loops, breaks) becomes structured through recursion and `fix`. The result is that safety properties detectable by Dew's type checker — use-after-move, unintended sharing, effect ordering — directly correspond to bugs in the original Rx code. This is the same principle as "desugar to core calculus and check there," applied at the language level rather than the compiler IR level.

### Key Advantage

Using a high-level functional IR rather than a low-level IR means:
- **Ownership is explicit** — affine types track resource usage at the language level
- **Purity is visible** — side effects are explicit in the type system
- **Analysis results are human-readable** — Dew source is a valid programming language
- **Round-trip is possible** — Rx → Dew → annotated Rx, not just Rx → error

---

## 2. Rx Language Profile

Rx is a **Rust subset** implemented by the RustShard-Compiler. Key characteristics:

| Category | Rx Feature | Notes |
|----------|-----------|-------|
| **Types** | `i8`–`i64`, `u8`–`u64`, `bool`, `()`, `&T`, `&mut T`, `[T; N]`, user structs/enums | No generics, no lifetimes |
| **Mutability** | `let mut`, `=`, `+=`, `-=`, `*=` etc. | Full mutation model |
| **Control** | `if`, `else`, `loop`, `while`, `match`, `break`, `continue`, `return` | All imperative control flow |
| **Functions** | `fn`, `impl`, methods, `self`, `&self`, `&mut self` | No closures |
| **Memory** | References `&T`, `&mut T`, deref `*expr` | No borrow checker (compiler only checks syntax) |
| **Structs** | Named fields (`S { x: 1, y: 2 }`) | Named construction |
| **Enums** | Simple variants, optional discriminant | Limited payload support |
| **Other** | `trait`, `impl Trait for Type`, `const`, `type` alias | Typeclass-like features |

**What Rx does NOT have**: closures, generics, lifetimes, iterators, `for` loops, labeled `break`/`continue`.

> The Rx compiler's internal type system includes entries for `f32`, `f64`, `str`, and `Range` types. However, these are not meaningfully exercised by current Rx programs. The translator maps `f64` → `Int` as a temporary measure; full float support awaits a Dew `Float` type. Range expressions (`a..b`, `a..=b`) are desugared to explicit bounds at translation time (see [§3.7](#37-special-cases)).

---

## 3. Translation Rules

### 3.1 Type Mapping

| Rx Type | Dew Type | Notes |
|---------|----------|-------|
| `i8`, `i16`, `i32`, `i64` | `Int` | Dew `Int` is signed 64-bit; all Rx signed integers fit |
| `u8`, `u16`, `u32`, `u64` | `Int` | Same — Dew has no unsigned type; values fit in `i64` |
| `bool` | `Bool` | Direct mapping |
| `char` | `Char` | Rx: 8-bit ASCII → Dew: `Char` (ASCII in current Dew) |
| `()` | `Unit` | Dew uses `Unit` keyword, not `()` |
| `f64` | `Int` (temporary) | Dew has no Float; truncate for now. See [§8](#8-limitations-and-future-work) |
| `[T; N]` | `Array(T, N)` | Direct mapping |
| `[T]` (slice) | — | No direct Dew equivalent; requires length parameter or `List(T)` |
| `&T` | `T` | Reference → owned value (ownership passed) |
| `&mut T` | `T` + `&` rebinding | Mutable ref → ownership transfer + rebind |
| `Struct S { .. }` | `struct S { .. }` | Both use named fields; Dew construction uses `{ field: val }` |
| `Enum E { .. }` | `enum E { .. }` | Direct mapping; Rx payloads become Dew variant payloads |

> **Integer widening is safe.** All Rx integer types (`i8`–`i64`, `u8`–`u64`) fit within Dew's `Int` (= `i64`). Negative `i64` values in Rx map to negative `Int` values in Dew. Unsigned values `u64` up to `2^63 - 1` map directly; values above `2^63 - 1` would require `u128` or bigint, which Dew does not currently support — the translator rejects such programs with an error.

### 3.2 Function Translation

**Rx:**
```rust
fn add(x: i32, y: i32) -> i32 {
    x + y
}
```

**Dew:**
```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
```

**Rx impl methods:**
```rust
impl Point {
    fn dist(&self, other: &Point) -> f64 { ... }
}
```

**Dew (standalone functions):**
```dew
def Point_dist = fn(self: Point, other: Point) -> Int { ... }
```

`&self` becomes an owned `self: Point` parameter. The method becomes a standalone function prefixed with the type name.

### 3.3 Mutation → Ownership Transfer

The core translation challenge: Rx's mutable variables must become Dew's immutable rebinding.

> Mutation is semantically "change the contents of a memory cell." In a pure functional language, there are no memory cells — only bindings of names to values. The translation strategy is to model mutation as a sequence of new bindings: `x = x + 1` becomes "take the old value of x, compute a new value, and rebind x to it." The `&` sugar marks this rebinding explicitly, preserving the intuition that "x changed" while maintaining the functional semantics that "x is now a different value." This is not a hack — it's the Curry-Howard correspondence in action: imperative state updates correspond to threading a value through a sequence of let-bindings.

**Rx:**
```rust
let mut x = 1;
x = x + 1;
x += 1;
```

**Dew (direct translation):**
```dew
def x = 1;
&x = x + 1;
&x = x + 1;
```

`let mut` → `def` (initial binding). Subsequent mutations → `&name = expr;` (rebind with ownership transfer).

**Compound assignment operators** desugar before translation:

| Rx | Desugared Rx | Dew |
|----|-------------|-----|
| `x += 1` | `x = x + 1` | `&x = x + 1` |
| `x -= 1` | `x = x - 1` | `&x = x - 1` |
| `x *= 2` | `x = x * 2` | `&x = x * 2` |

**Complex mutation (field access):**
```rust
let mut p = Point { x: 1, y: 2 };
p.x = 10;
```

**Dew:**
```dew
def p = Point { x: 1, y: 2 };
&p { x = 10 };
```

### 3.4 Control Flow Translation

Imperative control flow in Rx must be translated to Dew's expression-based, `if`-with-`else`, no-`return` model. The translator restructures control flow so every code path produces a value.

> This section is the hardest part of the translation. Rx has three non-local exit mechanisms (`return`, `break`, `continue`) that Dew has no direct equivalent for. The translation strategy follows three principles: (1) **restructure** — push code after an early exit into the `else` branch; (2) **Option-encode** — use `Option(T)` to distinguish normal completion from early exit when restructuring alone is insufficient; (3) **never-type elimination** — ensure no expression in the translated Dew code has a "never" type, because Dew does not have one.

#### 3.4.1 `if`/`else` Restructuring

Rx allows `if` without `else` (producing `()` in the missing branch). Dew requires `else`. The translator inserts `else { Unit }` for Rx `if` statements without `else`:

```rust
// Rx:
if cond { do_something(); }
```

```dew
// Dew:
if cond { do_something(); Unit } else { Unit }
```

**`return` inside `if` blocks** requires restructuring. Each `return expr` pushes all remaining code into the `else` branch:

```rust
// Rx:
fn f(x: i32) -> i32 {
    if x < 0 { return 0; }
    if x > 100 { return 100; }
    x
}
```

```dew
// Dew:
def f = fn(x: Int) -> Int {
  if x < 0 { 0 }
  else if x > 100 { 100 }
  else { x }
}
```

The translator walks the function body linearly. When it encounters a `return expr` inside an `if` branch, it replaces the `return expr` with `expr` and wraps all subsequent statements in the `else` branch. Multiple `return` statements produce nested `if`/`else` chains, which Dew's `else if` sugar renders naturally.

#### 3.4.2 Loop → Recursion

Rx loops become recursive functions in Dew. The translator:

1. Identifies all mutable variables modified in the loop body
2. Collects them into [borrow parameters](#35-reference--ownership--return) of the loop function
3. Generates a `fix` expression with tail-recursive calls

**`while` loop:**

```rust
// Rx:
let mut i = 0;
while i < n {
    // body
    i = i + 1;
}
```

```dew
// Dew:
def i = 0;
def i = fix loop {
  fn(&i: Int, n: Int) -> Int {
    if i < n {
      // body
      &i = i + 1;
      loop(&i, n)
    } else { i }
  }
}(&i, n)
```

**`loop` (infinite loop):**

```rust
// Rx:
loop {
    if done { break; }
    // body
}
```

```dew
// Dew:
fix loop {
  fn(state: T) -> T {
    if done { state }
    else {
      // body
      loop(next_state)
    }
  }
}(initial_state)
```

> The loop function name (`loop` in these examples) is a local binding created by `fix`. It does not conflict with user-defined names because `fix` introduces a new scope. The translator generates fresh names if needed to avoid shadowing user bindings.
>
> **Note on naming — why `__while_loop`.** Dew's `loop` is a keyword (`loop { body }` for infinite loops), so the recursive call `loop(state)` would be parsed as an infinite loop, not as a function call. The translator therefore uses `fix __while_loop { ... }(...)` — the leading underscores avoid any conflict with both Dew keywords and typical user-defined names.

#### 3.4.3 `break` and `continue`

**`break` without value** → return the current loop state from the loop function.

**`break expr`** → return `expr` from the loop function. The loop function's return type must accommodate `expr`'s type.

**`continue`** → recursive call with current state (skip remaining body).

```rust
// Rx:
let mut i = 0;
while i < n {
    if i == target { break; }
    if skip(i) { i = i + 1; continue; }
    process(i);
    i = i + 1;
}
```

```dew
// Dew:
def i = 0;
def i = fix loop {
  fn(&i: Int, n: Int, target: Int) -> Int {
    if i < n {
      if i == target { i }                                  // break
      else if skip(i) { &i = i + 1; loop(&i, n, target) }  // continue
      else {
        process(i);
        &i = i + 1;
        loop(&i, n, target)
      }
    } else { i }                                            // normal loop end
  }
}(&i, n, target)
```

> `break` and `continue` are local to the enclosing loop. They do not cross function boundaries. Rx has no labeled `break`/`continue`, so there is no ambiguity about which loop is the target.

#### 3.4.4 `return` Translation

`return` in Rx is non-local — it exits the entire function, not just the enclosing block. The translation strategy depends on where the `return` appears.

**Case 1: `return` outside any loop** → restructure into `if`/`else` (see [§3.4.1](#341-ifelse-restructuring)). Each `return expr` replaces the remaining code with `expr` in the `then` branch and pushes the rest into `else`.

**Case 2: `return` inside a `loop` that is the function's final expression** → `return expr` is equivalent to `break expr`. The loop function returns `expr` directly:

```rust
// Rx:
fn countdown(n: i32) -> i32 {
    let mut i = n;
    loop {
        if i == 0 { return 0; }
        i = i - 1;
    }
    // unreachable: loop always returns via break/return
}
```

```dew
// Dew:
def countdown = fn(n: Int) -> Int {
  def i = n;
  fix loop {
    fn(&i: Int) -> Int {
      if i == 0 { 0 }                // return 0 ≡ break 0
      else { &i = i - 1; loop(&i) }
    }
  }(&i)
}
```

When the `loop` is the function's tail expression and every path through the loop body ends with `break expr` or `return expr`, the loop function's return type is the type of those expressions. No `Option` encoding is needed.

**Case 3: `return` inside a loop with code after the loop** → **Option encoding**. The loop function returns `Option(T)` where `Some(v)` means early return with value `v`, and `None` means normal loop completion. The caller matches on the result:

```rust
// Rx:
fn find(arr: [i32; N], n: i32) -> i32 {
    let mut i = 0;
    while i < n {
        if arr[i] < 0 { return i; }
        i = i + 1;
    }
    -1  // not found
}
```

```dew
// Dew:
def find = fn(arr: Array(Int, N), n: Int) -> Int {
  def i = 0;
  def loop_result = fix loop {
    fn(&i: Int, n: Int) -> Option(Int) {
      if i < n {
        if arr[i] < 0 { Some(i) }          // return i
        else {
          &i = i + 1;
          loop(&i, n)
        }
      } else { None }                       // loop ended normally
    }
  }(&i, n);
  match loop_result {
    Some(v) => v,
    None => -1,
  }
}
```

> The Option encoding is chosen over alternatives (CPS, exception monad, sum-type multiplexing) because: (1) Dew has `Option(T)` in the standard library; (2) the translated code is human-readable; (3) Rx has no labeled `break`/`continue`, so at most two exit modes exist per loop (normal completion vs early return); (4) the encoding composes naturally through nesting (see §3.4.5).

**When to use Option encoding — decision table:**

| `return` location | Code after loop? | Translation |
|---|---|---|
| Outside any loop | N/A | Restructure into `if`/`else` (Case 1) |
| Inside `loop`, loop is function tail | No (loop is tail) | `return` ≡ `break` (Case 2) |
| Inside `loop`, code after loop | Yes | `Option(T)` encoding (Case 3) |
| Inside `while`, code after loop | Yes (always — `while` produces `()`) | `Option(T)` encoding (Case 3) |

> A `while` loop always has "code after the loop" because `while` evaluates to `()` — the function's actual return value comes from the expression after the `while`. Therefore, any `return` inside a `while` loop always uses Case 3.

#### 3.4.5 Nested Loops with `return`

When `return` appears inside a nested loop, the Option encoding composes: each loop level wraps its result in `Option`, and the enclosing level propagates `Some` upward.

```rust
// Rx:
fn search(grid: [[i32; C]; R], rows: i32, cols: i32, target: i32) -> i32 {
    let mut i = 0;
    while i < rows {
        let mut j = 0;
        while j < cols {
            if grid[i][j] == target { return i + j; }
            j = j + 1;
        }
        i = i + 1;
    }
    -1
}
```

```dew
// Dew:
def search = fn(grid: Array(Array(Int, C), R), rows: Int, cols: Int, target: Int) -> Int {
  def i = 0;
  def outer_result = fix outer {
    fn(&i: Int, rows: Int, cols: Int, target: Int) -> Option(Int) {
      if i < rows {
        def j = 0;
        def inner_result = fix inner {
          fn(&j: Int, cols: Int, target: Int, row: Array(Int, C)) -> Option(Int) {
            if j < cols {
              if row[j] == target { Some(i + j) }    // return — propagate upward
              else { &j = j + 1; inner(&j, cols, target, row) }
            } else { None }                           // inner loop ended normally
          }
        }(&j, cols, target, grid[i]);
        match inner_result {
          Some(v) => Some(v),                         // propagate early return
          None => { &i = i + 1; outer(&i, rows, cols, target) }
        }
      } else { None }                                // outer loop ended normally
    }
  }(&i, rows, cols, target);
  match outer_result {
    Some(v) => v,
    None => -1,
  }
}
```

> The propagation rule is uniform: if an inner loop returns `Some(v)`, the enclosing loop immediately returns `Some(v)` without further iteration. If the inner loop returns `None` (normal completion), the outer loop continues. This mirrors how `return` works in imperative languages — it unwinds all enclosing loops.

#### 3.4.6 Worked Example — Tree DFS with Ancestor Table

This example exercises multiple translation rules simultaneously: `&mut` array parameter, nested field/array updates, two sequential `while` loops, `continue`, and recursive function calls.

**Rx source:**

```rust
fn prepare(node_pool: &mut [Node; MAXN + 1], v: usize, f: usize) {
    node_pool[v].fa[0] = f;
    node_pool[v].d = if (f == 0) { 1 } else { node_pool[f].d + 1 };
    let mut i: usize = 1;
    while (i <= LOG_MAXN) {
        let ff: usize = node_pool[v].fa[i - 1];
        if (ff != 0) {
            node_pool[v].fa[i] = node_pool[ff].fa[i - 1];
        }
        i += 1;
    }
    i = 0;
    while (i < node_pool[v].edges_len) {
        let to: usize = node_pool[v].edges[i];
        i += 1;
        if (to == f) {
            continue;
        }
        prepare(node_pool, to, v);
    }
}
```

**Dew translation:**

```dew
def prepare = fn(&node_pool: Array(Node, MAXN + 1), v: Int, f: Int) -> Unit {

  // node_pool[v].fa[0] = f;
  &node_pool[v].fa[0] = f;

  // node_pool[v].d = if (f == 0) { 1 } else { node_pool[f].d + 1 };
  &node_pool[v].d = if f == 0 { 1 } else { node_pool[f].d + 1 };

  // First while loop: build ancestor table (binary lifting)
  def i = 1;
  def node_pool = fix loop1 {
    fn(&i: Int, &node_pool: Array(Node, MAXN + 1), v: Int) -> Array(Node, MAXN + 1) {
      if i <= LOG_MAXN {
        def ff = node_pool[v].fa[i - 1];
        if ff != 0 {
          &node_pool[v].fa[i] = node_pool[ff].fa[i - 1]
        } else { Unit };
        &i = i + 1;
        loop1(&i, &node_pool, v)
      } else { node_pool }
    }
  }(&i, &node_pool, v);

  // Second while loop: DFS over edges
  &i = 0;
  def node_pool = fix loop2 {
    fn(&i: Int, &node_pool: Array(Node, MAXN + 1), v: Int, f: Int) -> Array(Node, MAXN + 1) {
      if i < node_pool[v].edges_len {
        def to = node_pool[v].edges[i];
        &i = i + 1;
        if to == f {
          loop2(&i, &node_pool, v, f)                    // continue
        } else {
          &node_pool = prepare(&node_pool, to, v);       // recursive call
          loop2(&i, &node_pool, v, f)
        }
      } else { node_pool }
    }
  }(&i, &node_pool, v, f);

  Unit
}
```

**Translation notes:**

1. **`&mut` array as borrow parameter.** `node_pool: &mut [Node; MAXN+1]` becomes `&node_pool: Array(Node, MAXN+1)` — the entire array is a borrow parameter. Every mutation to `node_pool` inside the function body is a `&node_pool[...] = ...` rebinding.

2. **Nested array-field-subscript update.** `&node_pool[v].fa[i] = expr` is a compound lvalue update (dew-lang.md §5.5 Rule 5). The desugar pass expands it to nested struct/array updates: `def node_pool = node_pool { [v] = node_pool[v] { fa = node_pool[v].fa { [i] = expr } } }`. The surface syntax `&node_pool[v].fa[i] = expr` is the human-readable form.

3. **`node_pool` flows through both loops.** The first `fix loop1` takes `&node_pool` as a borrow parameter and returns the updated `Array(Node, MAXN+1)`. The caller binds `def node_pool = loop1(...)`, then passes it into the second `fix loop2` as a fresh borrow parameter. This is the ownership-threading pattern: each loop receives the current state and returns the modified state.

4. **`continue` in the second loop.** When `to == f`, `continue` becomes a direct recursive call `loop2(&i, &node_pool, v, f)` — skipping the `prepare` call and the rest of the loop body.

5. **Recursive function call inside a loop.** `prepare(node_pool, to, v)` is a borrow call: `&node_pool = prepare(&node_pool, to, v)`. This follows dew-lang.md §5.5 Rule 4 (statement-level borrow call): the desugar pass produces `def (node_pool, _) = prepare(node_pool, to, v)`, rebinding `node_pool` to the modified value returned by the callee.

6. **`if` without `else` in statement position.** `if ff != 0 { ... }` has no `else` branch in Rx. In Dew, all `if` must have `else`. The translator inserts `else { Unit }` because the `if` is in statement position (not the last expression in the block).

7. **`usize` → `Int`.** All Rx `usize` values map to Dew `Int`. No information loss since Dew `Int` is `i64`.

### 3.5 Reference → Ownership + Return

**Rx:**
```rust
fn increment(p: &mut Point) {
    p.x = p.x + 1;
}
```

**Dew:**
```dew
def increment = fn(&p: Point) -> Point {
  &p { x = p.x + 1 }
}
```

The `&mut Point` parameter becomes `&p: Point` (ownership + rebind). The function returns the modified value.

**Call site:**
```rust
increment(&mut p);
```

```dew
&p = increment(&p);
```

> This is Dew's [`&` borrow sugar](#35-reference--ownership--return) — `&p: Point` in the parameter list declares a borrow parameter; `&p = increment(&p)` at the call site passes ownership and rebinds the result. The desugar pass converts these to pure tuple returns and `def` rebindings. See [dew-lang.md §5.5](dew-lang.md#55-borrow-parameter--sugar) for the full desugaring rules.

### 3.6 Match Translation

Rx `match` and Dew `match` have similar surface syntax but differ in pattern semantics:

| Feature | Rx | Dew |
|---------|-----|------|
| Wildcard | `_` | `_` |
| Variable binding | `x` | `x` |
| Literal | `42`, `true` | `42`, `True` |
| Struct destructuring | `Point { x, y }` | `Point { x, y }` |
| Enum variant | `Some(v)` | `Some(v)` |
| `ref` binding | `ref x` | Not supported — ownership is always transferred |
| `mut` binding | `mut x` | Not supported — rebinding via `&` instead |
| `@` binding | `x @ Pat` | Not supported — use nested `match` |
| Range pattern | `1..=10` | Not supported — use guard expression or multiple arms |

**Simple match — nearly direct:**

```rust
// Rx:
match x {
    Some(v) => v + 1,
    None => 0,
}
```

```dew
// Dew:
match x {
  Some(v) => v + 1,
  None => 0,
}
```

**Pattern features absent in Dew must be desugared:**

```rust
// Rx: ref binding
match p {
    Point { x, ref y } => *y,
}
```

```dew
// Dew: ref removed — ownership is transferred, no deref needed
match p {
  Point { x, y } => y,
}
```

```rust
// Rx: range pattern
match x {
    0..=9 => 1,
    10..=99 => 2,
    _ => 3,
}
```

```dew
// Dew: range desugared to comparison
match x {
  _ => if x <= 9 { 1 } else if x <= 99 { 2 } else { 3 },
}
```

> Range pattern desugaring replaces the `match` with an `if`/`else` chain. When all match arms are range patterns, the entire `match` becomes an `if`/`else` expression. When some arms are normal patterns and some are ranges, the translator emits a `match` with guard conditions (using Dew's `if` within each arm).

### 3.7 Special Cases

| Rx Construct | Translation Strategy |
|-------------|---------------------|
| `expr as Type` | Type conversion function (or identity for compatible types) |
| `a..b`, `a..=b` | Desugar to explicit bounds: `(a, b - 1)` or `(a, b)` as a tuple |
| `# comment #` | `// comment` (reformat in translator) |
| `const X: T = e;` | `def X = e;` (immutable by default in Dew) |
| `type Alias = T;` | Not supported in Dew Core; expand inline at translation |
| `break expr` | Return from loop function (see [§3.4.3](#343-break-and-continue)) |
| `continue` | Recursive call with unchanged state (see [§3.4.3](#343-break-and-continue)) |
| `return expr` | Depends on context (see [§3.4.4](#344-return-translation)) |

---

## 4. Architecture

### 4.1 Translation Pipeline

```
┌─────────────────────────────────────────────────────┐
│                   Rx → Dew (Forward)                │
│                                                     │
│  Rx Source → Rx Parser → Rx AST → DewEmitter → Dew  │
│                                           Source    │
└──────────────────────────┬──────────────────────────┘
                           │
                           ▼
                  ┌─────────────────┐
                  │  Dew Compiler   │
                  │  Type Check     │
                  │  Affine Analysis│
                  │  Purity Analysis│
                  └────────┬────────┘
                           │
                           ▼
┌─────────────────────────────────────────────────────┐
│                   Dew → Rx (Reverse)                │
│                                                     │
│  Annotated Dew → RxEmitter → Rx Source (annotated)  │
└─────────────────────────────────────────────────────┘
```

### 4.2 DewEmitter

The forward translator (`DewEmitter`) walks the Rx AST and emits Dew source text:

```
Rx AST (C++ structs) → DewEmitter (Rust) → Dew Source (String)
```

The DewEmitter performs a single pass over the Rx AST, translating each node to its Dew equivalent. Control flow restructuring ([§3.4](#34-control-flow-translation)) requires a pre-pass to identify `return`/`break`/`continue` locations and determine which encoding strategy (restructure vs Option) applies to each function.

### 4.3 Safety Analysis

The Dew type checker performs these analyses on translated Rx code:

1. **Affine tracking**: Variables used at most once where required
2. **Purity analysis**: Side effects are explicit (Stdin/Stdout)
3. **Exhaustiveness**: Match arms cover all cases
4. **Type safety**: No type errors at runtime

Analysis results are mapped back to Rx source locations through span tracking.

---

## 5. Safety Analysis Layers

Dew's safety analysis for Rx code operates across three independent layers. The Dew IR contains no pointer or allocation primitives — all safety detection happens above the IR.

| Layer | Mechanism | Detects |
|-------|-----------|---------|
| **Type system** (§5.1) | Poison value encoding | Use-after-move, double-free |
| **Affine checker** (§5.2) | Ownership transfer encoding | Resource leaks, non-linear use |
| **Provenance encoding** (§5.3) | Address + metadata wrapping | Pointer aliasing, out-of-bounds access, use-after-free across aliases |

> The Dew IR layer is irrelevant to safety analysis. The evaluation and compilation phases operate on a type-checked program. The Dew IR sees only (pure) computation.

### 5.1 Affiliation to Poison Value Mapping

In the Dew type system, variables that represent consumed or uninitialized objects are encoded as **poison values**. These are type-safe `Unit` tokens whose existence and destruction certify that the referenced object is alive.

```
Rx source:
  let a = allocate::<T>();
  // operations using *a

Dew translation:
  def (a, _a_token) = allocate.dup();
  // The token `_a_token` must be alive while the affine type `a` exists.
```

**Affiliation check** verifies that no affine variable is used after it has been deallocated or moved.

### 5.2 Owned Pointer Encoding

For each `*mut T` in Rx, the translator produces an **owned pointer** in Dew:

```dew
// Dew (translator-generated):
affine struct OwnedPtr(T) {
  ptr: Int,
  _tag: PoisonTag,
}
```

Poison tags are represented by `affine struct PoisonTag`, ensuring the checker can verify correct usage. When the Rx variable goes out of scope, the poison tag must be alive — the affine checker will produce a type error if it was consumed earlier.

### 5.3 Provenance Encoding

**Provenance** is the metadata that tracks where a pointer came from and what memory range it may access. This is needed for detecting pointer aliasing (`p1 + 1` and `p2` pointing to the same address) and out-of-bounds access.

Each Rx pointer `*T` translates to a Dew struct carrying:

```dew
affine struct ProvenancePtr(T) {
  addr: Int,              // raw address (integer)
  base: Int,              // allocation base address
  size: Int,              // allocation size in bytes
  _token: PoisonTag,      // affine tag for this pointer instance
}
```

> The type parameter `T` in `ProvenancePtr(T)` is a phantom type parameter — it carries type-level information about the pointed-to type but is not used in the struct's fields. Dew's HM type system accepts unused type parameters; they are resolved at the call site.

**Detection rules** applied by the translator:

| Rx Pattern | Translation Strategy |
|-------------|---------------------|
| `p1 + offset` | Produces new `ProvenancePtr` with same `base`/`size`, updated `addr`. If `addr` falls outside `[base, base+size)` → compile error `[E010]` |
| `*p1` (deref) | Consumes the `_token`. Two derefs of the same pointer → affine error `[E004]` |
| `p2 = p1 + 1` + `*(p1 + 1)` vs `*p2` | Both produce provenance tokens from `p1`. The affine checker detects double-use of the same provenance |

> **Aliasing detection** works through provenance token reuse: `p1 + 1` and `p2` both derive from `p1`'s provenance. If either is dereferenced after the other, the shared token is consumed — the affine checker reports `[E004]`. This is not a full borrow-checker but covers the common aliasing patterns found in safety-critical code.

---

## 6. Translation Invariants

These must hold for the round-trip to be correct:

1. **Type preservation**: `translate_type(rx_type) = dew_type` and `reverse_type(dew_type) = rx_type` (up to representation differences like Int/i32)

2. **Behavioral equivalence**: For all valid Rx programs P, `eval(translate(P))` produces the same output as `execute(P)` (modulo I/O ordering)

3. **Error correspondence**: A type error in translated Dew code corresponds to a genuine safety issue in the original Rx code (no false positives from translation)

4. **Source location tracking**: Every Dew expression carries the Span of its originating Rx expression, so errors can be reported at the correct Rx source location

5. **Control flow completeness**: Every `return`, `break`, and `continue` in the Rx source is preserved in the Dew translation — no control flow path is silently dropped

> Invariant 5 is the most subtle. A naive translation that simply omits `return` statements would produce Dew code that continues executing past the intended exit point, potentially causing type errors or incorrect behavior. The Option encoding ([§3.4.4](#344-return-translation)) and `if`/`else` restructuring ([§3.4.1](#341-ifelse-restructuring)) together guarantee that all exit paths are preserved.

---

## 7. Reverse Translation (Dew → Rx)

The reverse translator converts analyzed Dew code back to Rx source, preserving safety annotations discovered by the Dew type checker.

### 7.1 Type Mapping

| Dew Type | Rx Type | Notes |
|----------|---------|-------|
| `Int` | `i32` | Narrowing: may lose values > 2^31 - 1 |
| `Bool` | `bool` | Direct mapping |
| `Char` | `char` | Direct mapping |
| `Unit` | `()` | Direct mapping |
| `Array(T, N)` | `[T; N]` | Direct mapping |
| `struct S { .. }` | `struct S { .. }` | Named fields preserved |
| `enum E { .. }` | `enum E { .. }` | Direct mapping |
| `Affine(T)` | `T` | Affine wrapper removed; annotation added as comment |

> Reverse type mapping is lossy: `Int` → `i32` narrows the value range. The translator emits a comment `// narrowed from Int` at each narrowing site. Programs that depend on the full `i64` range will produce incorrect results — this is a known limitation.

### 7.2 Function Translation

```dew
// Dew:
def add = fn(x: Int, y: Int) -> Int { x + y }
```

```rust
// Rx:
fn add(x: i32, y: i32) -> i32 {
    x + y
}
```

Dew's expression body becomes Rx's block body with implicit return.

### 7.3 Ownership → Mutation

Dew's `&` borrow sugar reverses to Rx's mutable references:

```dew
// Dew:
def increment = fn(&p: Point) -> Point {
  &p { x = p.x + 1 }
}
```

```rust
// Rx:
fn increment(p: &mut Point) -> Point {
    p.x = p.x + 1;
    *p
}
```

The `&p: Point` borrow parameter becomes `p: &mut Point`. The `&p { x = ... }` rebinding becomes `p.x = ...` mutation.

### 7.4 Recursion → Loop

Recursive functions that match the loop pattern (tail-recursive with accumulator parameters) reverse to `while` loops:

```dew
// Dew:
def i = fix loop {
  fn(&i: Int, n: Int) -> Int {
    if i < n { &i = i + 1; loop(&i, n) } else { i }
  }
}(&i, n)
```

```rust
// Rx:
let mut i = i;
while i < n {
    i = i + 1;
}
```

> Not all recursive functions reverse to loops. Only tail-recursive functions with accumulator parameters that follow the pattern generated by the forward translator are candidates. General recursion in Dew has no Rx equivalent — the reverse translator emits a comment `// recursive, not translated to loop` and leaves the function as-is.

### 7.5 Match → if/else

Dew `match` on `Bool` (which is what `if`/`else` desugars to) reverses to Rx `if`/`else`. Dew `match` on enums reverses to Rx `match`:

```dew
// Dew:
match x {
  Some(v) => v + 1,
  None => 0,
}
```

```rust
// Rx:
match x {
    Some(v) => v + 1,
    None => 0,
}
```

### 7.6 Limitations

| Dew Feature | Rx Equivalent | Status |
|-------------|--------------|--------|
| Closures | — | No Rx equivalent; emit as inline expansion or comment |
| Lazy evaluation | — | No Rx equivalent; force all thunks eagerly |
| Higher-order functions | — | Limited: emit specialized monomorphic versions |
| `Option(T)` (from forward translation) | Direct value + flag | Unwrap the Option: if from forward `return` encoding, restructure back to `return` |
| Generic functions | — | No Rx generics; monomorphize at each call site |
| `Affine(T)` wrapper | Raw type + safety comment | Remove wrapper, add `// affine-checked` comment |

> The reverse translation is inherently lossier than the forward translation. Dew is more expressive than Rx (closures, lazy evaluation, higher-order functions), so Dew programs that use these features have no direct Rx equivalent. The reverse translator focuses on the common case: code that was originally Rx, translated forward, analyzed, and now needs to go back with annotations.

---

## 8. Limitations and Future Work

| Limitation | Status | Plan |
|-----------|--------|------|
| No Float in Dew | Current | `f64` truncates to `Int`; add `Float` type to Dew |
| No generics in Rx or Dew | Current | Both languages will add generics (Dew Phase 6) |
| Rx traits ≠ Dew TypeClass | Future | Map during Phase 6 |
| Slice `[T]` has unknown length | Current | Add length parameter or use `List(T)` |
| Nested `break`/`continue` to outer loop | Not in Rx | Rx has no labeled breaks; no translation needed |
| `return` in deeply nested loops | Current | Option encoding composes (§3.4.5) but generated code is verbose |
| Rx comments `#...#` | Parser | Handle in Rx lexer reimplementation |
| Reverse translation lossy (`Int` → `i32`) | Current | Emit narrowing comments; consider `i64` in Rx |
| Dew closures → Rx | No equivalent | Inline expansion or comment out |

---

## 9. Reference

- Rx Grammar: `RustShard-Compiler/docs/semantic_rules.md`
- Rx AST: `RustShard-Compiler/include/frontend/ast.hpp`
- Rx Type System: `RustShard-Compiler/include/common/stype.hpp`
- Dew Language: `docs/design/dew-lang.md`
- Dew IR: `docs/design/dew-ir.md`
- Dew → IR Pipeline: `docs/design/dew-lang-impl.md`
