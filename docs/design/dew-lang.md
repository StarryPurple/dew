# Dew Language Specification

> **Single source of truth** for Dew language design. Updated immediately with every design decision. 
> Derived documents (`docs/book/`) lag behind this file.
>
> **Formatting:** All Dew source code uses **2-space indentation**. No tabs.  
> All Dew IR text output also uses 2-space indentation. This is a hard formatting rule, not a style preference.

### Contents

- [§1 Language Positioning](#1-language-positioning)
- [§2 Program Model](#2-program-model)
  - [§2.1 File Mode](#21-file-mode-batch-compilation)
  - [§2.2 Entry Point](#22-entry-point)
  - [§2.3 REPL Mode](#23-repl-mode-interactive)
  - [§2.4 Eval Mode](#24-eval-mode)
- [§3 Core Semantics](#3-core-semantics)
  - [§3.1 Immutability](#31-immutability)
  - [§3.2 Lazy Evaluation](#32-lazy-evaluation)
  - [§3.3 Strict Evaluation](#33-strict-evaluation-force)
  - [§3.4 Resource Kinds](#34-resource-kinds)
  - [§3.5 IO Effect System](#35-io-effect-system)
  - [§3.6 Properties](#36-properties)
- [§4 Type System](#4-type-system)
  - [§4.1 HM Inference](#41-hindley-milner-type-inference)
  - [§4.2 Affine Modifier](#42-affine-type-modifier)
  - [§4.3 Primitive Types](#43-primitive-types)
  - [§4.4 Struct](#44-struct)
  - [§4.5 Enum](#45-enum)
  - [§4.6 Tuple](#46-tuple)
  - [§4.7 Array](#47-array)
  - [§4.8 Function Types](#48-function-types)
  - [§4.9 typeof + type_match](#49-typeof--type_match--compile-time-reflection)
- [§5 Functions](#5-functions)
  - [§5.1 Definition](#51-definition)
  - [§5.2 Closures](#52-closures)
  - [§5.3 Recursion](#53-recursion)
  - [§5.4 fix](#54-anonymous-recursion-fix)
  - [§5.5 Borrow Sugar](#55-borrow-parameter--sugar)
  - [§5.6 Pipeline](#56-pipeline-operator)
  - [§5.7 No return](#57-no-return)
  - [§5.8 def Binding](#58-def-binding)
- [§6 Control Flow](#6-control-flow)
  - [§6.1 match](#61-match)
  - [§6.2 if/else](#62-ifelse)
  - [§6.3 Loops](#63-loops)
- [§7 Identifiers and Operators](#7-identifiers-and-operators)
  - [§7.1 Identifiers](#71-identifiers)
  - [§7.2 Operators](#72-operators)
  - [§7.3 Operator Precedence](#73-operator-precedence)
- [§8 I/O System](#8-io-system)
  - [§8.1 stdin / stdout](#81-stdin--stdout)
  - [§8.2 Call Style](#82-call-style)
  - [§8.3 Supported Types](#83-supported-types)
  - [§8.4 Compiler Intrinsics](#84-stdin--stdout-are-compiler-intrinsics)
- [§9 Collections](#9-collections)
  - [§9.1 List](#91-list)
  - [§9.2 Standard Library Functions](#92-standard-library-functions)
- [§10 Standard Library](#10-standard-library)
  - [§10.1 Types](#101-types)
  - [§10.2 Functions](#102-functions)
  - [§10.3 Design Principles](#103-design-principles)
- [§11 Memory Management](#11-memory-management)
- [§12 Modules and Imports](#12-modules-and-imports)
- [§13 (No) Error Handling](#13-no-error-handling)
  - [Compile-Time Detection](#compile-time-detection)
  - [Runtime Behavior](#runtime-behavior)
  - [Exit Codes](#exit-codes)
- [§14 Keywords and Built-ins](#14-keywords-and-built-ins)
  - [Keywords](#keywords)
  - [Type Modifiers](#type-modifiers)
  - [Built-in Functions](#built-in-functions)
  - [Reserved](#reserved-future)
- [§15 Out of Scope](#15-out-of-scope)
- [§16 Phase Plan](#16-phase-plan)
- [§17 Core Design Principle](#17-core-design-principle)

---

## 1. Language Positioning

Dew is a **pure functional, statically-typed, strongly-typed** programming language.
Its three core design tenets are **Lazy Evaluation + Affine Types + Closures**.

```
Dew (user language)
  ↕
Dew IR (canonical semantic layer)
  ↕
Rx / C (compilation targets)
```

Dew serves two roles:
- **Programming Language** — write programs directly
- **Analysis Language** — analyze resource safety of Rx/C code

> Dew is not just another functional language. The dual-role architecture is the key differentiator: Dew as both a direct programming surface AND an intermediate representation for imperative code analysis. This is analogous to Miri (Rust's UB detector), but using a high-level functional IR instead of MIR — making analysis results human-readable and enabling round-trip translation.

---

## 2. Program Model

### 2.1 File Mode (Batch Compilation)

A Dew source file is a sequence of top-level declarations. The top level accepts only:

- `def name = expr;` — value/function bindings
- `struct Name { ... }` — struct declarations
- `enum Name { ... }` — enum declarations
- `import "path"` — module imports

Bare expressions at the top level are **not allowed**. Every expression must appear within a `def` body or block.

```dew
// Valid: declarations only at top level
struct Point { x: Int, y: Int }

def origin = Point(0, 0)

def main = fn {
  origin.x + origin.y -> stdout;
}
```

> `stdout` and `stdin` are the I/O primitives used throughout this specification. Their formal definition is in [§8](#8-io-system). For now, read `x -> stdout` as "print x" and `&x -> stdin` as "read into x."

### 2.2 Entry Point

Dew execution begins at the `main` binding. `main` is expected to have signature `() -> IO Unit` — a zero-argument function with side effects. The evaluator invokes `main()`. Exit code is `0` on success, `1` on error.

**If `main` is pure** (no IO), the compiler issues `[W003]` — the program compiles and runs correctly, but a pure `main` produces no visible output. Side effects are explicit: output comes from `stdout`, input from `stdin`.

**Redefining `main`** produces `[W001]`. Redefining a standard library name produces `[W002]`.

```dew
def main = fn { 2026 -> stdout; }
// stdout: 2026
```

All four forms are equivalent:

```dew
def main = fn { 2026 -> stdout; }            // preferred
def main = fn -> Unit { 2026 -> stdout; }    // explicit return type
def main = fn () { 2026 -> stdout; }         // explicit empty params
def main = fn () -> Unit { 2026 -> stdout; } // fully explicit
```

**Execution model.** The compiler collects all top-level definitions, then forces `main`. Definitions appear in source order but are registered before evaluation — forward references between `def` bindings are resolved lazily. Only `main` triggers evaluation; unreferenced definitions remain suspended thunks. This mirrors LLVM's model: `define` for declarations, `@main()` as the runtime entry.

**Redefining `main`** produces a `[W001]` warning. The compiler accepts the redefinition but the later binding shadows the earlier — only the last `main` executes. Redefining a standard library name (`stdin`, `stdout`, `consume`, `Affine`, etc.) produces a `[W002]` warning.

The evaluator invokes `main()`. Exit code is `0` on success.

> `main` returning `Unit` keeps the semantics honest: `main` is an effectful procedure, not a pure function. Returning `Int` conflates "program output" with "process exit code." Rust and Haskell follow the same model: `fn main()` / `IO ()` — side effects are explicit, exit code is separate. The brevity tradeoff (one-liner examples now need `-> stdout`) is addressed by REPL/eval mode for quick experiments.

**Example convention in this specification:** Complete executable programs are annotated with `// stdout: expected`. Fragment examples (showing syntax in isolation) have no annotation, or use `// fragment`.

### 2.3 REPL Mode (Interactive)

An interactive REPL accepts arbitrary expressions at the prompt and evaluates them immediately:

```
$ dew
dew> 40 + 2
2026
dew> def x = Point(3, 4)
dew> x.x + x.y
7
dew> :t x
Point
```

REPL expressions are evaluated **strictly** (not lazy), matching user expectation that typing an expression produces immediate output. This is the same model as GHCi vs. `.hs` files — the interactive context has different evaluation semantics from file compilation.

### 2.4 Eval Mode

Single-expression evaluation from the command line:

```
$ dew -e '40 + 2'
2026
$ dew -e 'fact(5)' --prelude examples/factorial.dew
120
```

Like REPL, eval mode evaluates strictly.

> File mode and interactive mode serve different purposes. Mixing them (allowing bare expressions in files) would create a semantic conflict: Dew's implicit lazy evaluation means `def x = heavy()` defers computation, but a bare `heavy()` at top level would need immediate evaluation. Keeping them separate avoids this ambiguity and follows the GHC model — declarations in files, expressions in the REPL.

---

## 3. Core Semantics

### 3.1 Immutability

All values are immutable once created. "Mutation" is achieved through rebinding (shadowing):

```dew
def x = 1       // x bound to value 1
def x = x + 1   // x rebound to value 2, NOT mutation of the old value
```

```dew
// Immutable rebinding — complete program
// stdout: 2
def main = fn {
  def x = 1;
  def x = x + 1;
  x -> stdout;
}
```

- No `const` keyword (immutability is the default)
- No `mut` keyword
- No `var` / `let mut`

> Immutability is the default because it eliminates an entire class of bugs (aliasing, data races, spooky action at a distance). The absence of `mut` is deliberate — "mutation" through rebinding (`def x = x + 1`) is semantically clearer: it creates a new binding, not a mutated cell. This also simplifies the type system: no variance from mutability, no `&mut` vs `&` distinction.

### 3.2 Lazy Evaluation

**Implicit lazy evaluation.** The compiler determines evaluation timing via strictness analysis;
users write no laziness annotations.

> Haskell proved that lazy evaluation is powerful but also proved that space leaks are a real problem. Dew chooses implicit laziness with compiler-driven strictness analysis as a middle ground: users get the benefits of laziness (infinite structures, separation of concerns) without the cognitive burden of reasoning about evaluation order. The strictness analyzer — not the programmer — decides what to evaluate when. If the analyzer is wrong, `force()` is the escape hatch.

- **Strictness Analysis** automatically classifies each expression context as Strict or Lazy
- Runtime thunk has three states: `Suspended` → `Evaluating` → `Evaluated`
- Supports **memoization** — result cached after first evaluation
- Circular dependency detection via runtime 3-state FSM (blackhole mechanism); simple self-references (`def x = x + 1`) caught at compile time

| Context | Classification |
|---------|---------------|
| Arithmetic/comparison operands | Strict |
| IO function call (`stdin`, `stdout`, any IO-marked function) | Strict |
| IO-marked function body | Strict (all expressions within) |
| Function arguments (non-IO) | Lazy (ambient) |
| `if` condition | Strict |
| `match` scrutinee | Strict |
| `let` binding value | Lazy |
| Block expression statements | Lazy (discarded) |
| Block final expression | Ambient (follows enclosing context) |

> IO functions are always strict because side effects have ordering dependencies. `stdout` must output immediately; `stdin` must read at the point of call. An IO-marked function's entire body is evaluated strictly — lazily deferring a side effect would make program behavior unpredictable.

### 3.3 Strict Evaluation (force)

```dew
force(expr)   // Built-in function, forces evaluation immediately
```

### 3.4 Resource Kinds

| Kind | Semantics | Rule | C++ Analogue | Atomicity |
|------|-----------|------|-------------|-----------|
| **Normal** | `y = x` does not consume `x` | Default for all types | `std::is_trivially_copyable` — pure bitwise copy, no custom logic, no side effects | Not applicable |
| **Affine** | At most one use. `y = x` consumes `x` | `affine` keyword before struct/enum declaration; use `Affine(T)` wrapper to make a value affine | `unique_ptr<T>` — exclusive ownership, move-only | None needed (single owner) |
| **Persistent** | Reference-counted, multi-owner sharing | Library-level (`Rc<T>`), not built-in | Non-atomic `shared_ptr<T>` (Rust `Rc<T>`) | None by default; library may add |

> The analogies describe **ownership semantics**, not pointer indirection. Normal is not a raw pointer — it has no null, no dangle, no alias. It is pure bitwise copy: no custom logic, no allocation, no side effects (C++ `std::is_trivially_copyable`, Rust `Copy` — not `Clone`, which can execute arbitrary code). Only Affine types require compiler support; Persistent is purely a library concern. Reducing from three built-in kinds to two keeps the type checker minimal.
>
> Unlike C++ smart pointers, Dew values are **never null**. `unique_ptr<T>` can be null (default-constructed, moved-from); Dew's Affine values cannot. After `def y = x`, `x` is consumed at compile time — the compiler rejects any further use. There is no null sentinel and no runtime validity check. The compile-time consume tracking is a stronger guarantee than C++'s runtime null.

### 3.5 IO Effect System

Dew tracks **side effects** (I/O, external state) through an **infectious IO effect** on function types. This is analogous to Haskell's `IO` monad: both separate pure computation from effectful computation at the type level. Dew's approach is monad-free — there is no `do` notation, no `>>=`, no `return`. Effects propagate implicitly through the type system.

> Haskell uses the `IO` monad to sequence side effects: `getLine >>= \x -> putStrLn x`. Dew achieves the same sequencing guarantee through **strict evaluation of IO function calls** (§3.2): an IO function body runs in strict context, and its calls are evaluated in order. The type-level `IO` marker serves the same purpose as Haskell's `IO a` — it is the compiler-visible sign that a function interacts with the external world.

#### Effect Primitives

`stdin` and `stdout` are the only IO primitives. Any function that calls them (directly or transitively) is marked `IO`.

```dew
// Pure function — no IO
def add = fn(x: Int, y: Int) -> Int { x + y }

// IO function — calls stdout
def print_sum = fn(x: Int, y: Int) -> Int {
  x + y -> stdout
}
// Inferred type: (Int, Int) -> IO Int
```

#### Propagation Rules

| Rule | Description |
|------|-------------|
| **Primitives** | `stdin`, `stdout` are IO primitives |
| **Direct invocation** | A body calling an IO function → itself is IO |
| **Transitive** | Calling an IO function → caller is IO (infectious upward) |
| **Closure capture** | Capturing an IO-marked closure does NOT make the capturer IO (only invoking it does) |
| **Program entry** | `main` must be IO. A program with no side effects is detected (and warned) at compile time. |
| **Strict evaluation** | IO function calls are always evaluated strictly. IO-marked function bodies run in strict context. See §3.2. |

> Effects are on **function signatures**, not on data. An `Affine(Int)` value is not intrinsically IO — only the functions that use it with `stdin`/`stdout` are. This mirrors how Haskell treats `Handle`: the handle is a pure value; `hGetLine :: Handle -> IO String` is the IO operation.
>
> **Storing vs. calling.** A struct field of type `(Int) -> IO Int` does not make the struct IO. Holding an IO-capable closure is just data — the effect only propagates when the closure is *called*. Constructing a closure that would do IO later is also not IO: `fn { fn { stdin() } }` returns a closure without calling `stdin`, so the outer function is pure. The rule: **IO propagates through calls, not through storage or construction.**

#### Syntax

```
(Int) -> Int             // pure function
(Int) -> IO Int          // function with IO side effects
() -> IO Unit            // side-effect-only function
```

`IO` is an **effect marker**, not a type constructor. `IO (IO Int)` is meaningless and rejected.

#### Explicit Annotation as Contract

When the user writes a type annotation, the compiler checks it against the inferred type. Annotations are contracts — the body must satisfy them:

| Annotation | Body | Result |
|-----------|------|--------|
| `-> Int` (pure) | Calls `stdout` | **Error**: contract violated |
| `-> IO Int` | Pure computation | **Warning**: annotation over-approximates |
| `-> Int` (pure) | Computes `Int` | OK |
| `-> IO Int` | Calls `stdout` | OK |
| (omitted) | Anything | Inferred; no error |

The rule: **omission = inference; annotation = verification.** If you promise a pure function, the compiler holds you to it. If you say nothing, the compiler tells you what you have.

> `affine` does not appear in type annotations for function returns — the return type itself (`Affine(Int)` vs `Int`) carries the information. Writing `fn -> affine Int` is rejected; write `fn -> Affine(Int)` instead. Whether a closure is Fn vs FnOnce is always inferred from captures and cannot be manually annotated.

#### IO and Affine Interaction

IO and Affine are **orthogonal**:

```dew
// IO + Normal — result can be used multiple times
def main = fn {
  def x: Int;
  &x -> stdin;
  x + x -> stdout;   // x is Int (Normal), can be reused
}

// IO + Affine — resource is consumed on use
def main = fn {
  def a = Affine(2026);
  def v = a.data;     // a consumed — field access on affine type
  v -> stdout;
  // def _ = a.data;  // ERROR: a already consumed
}
```

**Borrow sugar is not a side effect.** [`&` borrow sugar](#55-borrow-parameter--sugar) desugars to pure tuple returns and `def` rebindings — the effect checker never sees it. A function using `&` parameters does not gain an `IO` effect:

```dew
def f = fn(&x: Int) { &x = x + 1; x }
// Inferred: (&Int) -> Int
// NOT: (Int) -> IO Int
```

The compiler displays `(&Int) -> Int` — the borrow parameter is re-constructed from the desugared internal representation for the user. The displayed type matches what the user wrote, not the internal desugaring.

The desugar pass runs before effect inference. By the time the effect checker inspects the body, every `&x = expr` is already `def x = expr` — a pure lexical rebinding. The `&` sugar *looks* like mutation but *is* pure ownership-passing.

### 3.6 Properties

Dew tracks two orthogonal **type system properties**:

| Property | Domain | Values | Meaning |
|----------|--------|--------|---------|
| **Resource** | All values (including closures) | `Normal` \| `Affine` | How a value is owned and consumed |
| **Effect** | Functions | `pure` \| `IO` | Whether a function has side effects |

**Resource property** — see §3.4. Normal values are freely copyable (pure bitwise copy, no side effects); affine values are use-at-most-once. Marked with `affine` on type declarations.

- For data types: `affine struct` / `affine enum` marks the type. Fields with affine-typed fields cause the containing type to be affine.
- For closures: the Resource property is derived from captured variables. Capturing only Normal values → closure is Normal (can be called multiple times, like `Fn` in Rust). Capturing any affine value → closure is Affine (can be called once, like `FnOnce` in Rust). Always inferred — never manually annotated.

**Effect property** — see §3.5. Pure functions compute without side effects; IO functions interact with the external world via `stdin`/`stdout`. Marked as `-> IO T` in function type signatures (inferred when omitted).

> `Fn` and `FnOnce` are the user-facing names for the Resource property applied to closures. They are not a third property — they are Resource projected onto function values.
>
> The two properties are **orthogonal**. An affine value can be used in a pure function (`a.data` — consumes affine value without IO). An IO function can return Normal values (`stdin` returns `Int`). A closure's Fn/FnOnce (Resource) is independent of its pure/IO (Effect) — `fn { a.data -> stdout; }` captures an affine value (→ FnOnce) and does IO (→ IO). Each property answers a different question about the code.

---

## 4. Type System

### 4.1 Hindley-Milner Type Inference

- Parametric polymorphism (generics)
- Type annotations **optional** — inferred where omitted
- Generic parameters use parentheses: `List(Int)`, `Option(T)`
- `let`-generalization for polymorphic local bindings

```dew
def id = fn(x) { x }           // inferred: a -> a
def add = fn(x, y) { x + y }   // inferred: Int -> Int -> Int
```

**`_` as type wildcard.** `_` in a type annotation means "infer this type variable." HM handles this naturally:

```dew
def pair = fn(x: _, y: _) -> (_, _) { (x, y) }
// Inferred: (a, b) -> (a, b) — each _ is an independent type variable
```

`_` works for **type parameters** only. It cannot infer value-level parameters — `Array(Char, _)` is rejected because `N` is a compile-time integer literal, not a type. Writing `fn(name: Array(Char, N))` without concrete `N` would require const generics, which Dew does not have.

**Property propagation through generics.** HM naturally carries affine and IO properties through type parameters:

- **Affine**: `List(Affine(Int))` — the list contains affine elements. If any variant payload is affine-typed, the enum is affine. HM substitutes concrete types for `T` and the [affine rules](#42-affine-type-modifier) apply to the result. No extra mechanism needed.
- **IO**: `fn(x: T) -> IO T` — the IO effect is on the function signature, not the type parameter. HM universally quantifies `T` while preserving the `IO` marker. Calling this function propagates IO to the caller; the type `T` itself is unaffected.

### 4.2 Affine Type Modifier

The `affine` keyword precedes [`struct`](#44-struct) or [`enum`](#45-enum) to mark the type as affine — all values carry at-most-once semantics:

```dew
affine struct Affine(T) { data: T }

affine enum FileState { Open, Closed(Int) }
```

`affine` is **type-level only**. It does not appear on individual fields. Whether a field is affine is determined by its **type**, not a field keyword.

**Three affine rules:**

| Declaration | Fields/payloads | Result |
|------------|----------------|--------|
| No `affine`, all Normal-typed | Normal | type is Normal |
| No `affine`, contains affine-typed member(s) | → affine | **Warning**: implicit affine; add `affine` keyword |
| Explicit `affine struct` / `affine enum` | Any | Affine | OK: explicit acknowledgment |
| Explicit `affine struct` / `affine enum` | All Normal-typed | Affine | OK: forced override |

These rules apply identically to `struct` and `enum`. For enums, "contains affine-typed member" means any variant's payload type is affine.

**Rule 1 — Explicit override.** `affine struct` or `affine enum` makes the entire type affine, regardless of member types:

```dew
affine struct Counter { value: Int }  // all Int fields, but type is affine
// Every Counter value is consumed on use, even though Int is Normal
```

**Rule 2 — Auto-derivation.** If a struct contains any affine-typed field, the struct is implicitly affine. The compiler issues a **warning** (not an error), prompting the programmer to add the `affine` keyword:

```dew
struct Request {
  body: Array(Char, 1024),
  handle: Affine(Int),     // affine-typed field
}
// Warning: Request contains affine fields but is not declared 'affine struct'
// Compiler treats Request as affine
```

**Rule 3 — Explicit confirmation** (no warning):

```dew
affine struct Request {
  body: Array(Char, 4),
  handle: Affine(Int),
}
```

The same rules apply to `enum` — if any variant's payload type is affine, the enum should be marked `affine`:

```dew
enum Token { Text(Array(Char, 16)), EOF }
// All payloads are Normal → Token is Normal

enum Expr { Lit(Int), Var(String), Lam(Affine(Env)) }
// Warning: Lam carries affine payload → mark 'affine enum Expr'

affine enum Expr { Lit(Int), Var(String), Lam(Affine(Env)) }
// Explicit affine — no warning
```

**IO does not apply to data types.** A struct or enum field whose type is `(Int) -> IO Int` is just a closure stored in a struct — it does not make the struct "IO." IO is an effect on functions, not a property of data containers. Calling the stored function is IO; storing it is not.

**Affine(T) as the standard wrapper.** `affine struct Affine(T) { data: T }` lives in the standard library. It is the canonical way to give affine semantics to any value — wrap it in `Affine(T)`.

`consume` is a stdlib alias — nothing built-in:

```dew
def consume = fn(x: Affine(T)) -> T { x.data }
```

`x.data` and `consume(x)` are equivalent. The former is direct field access; the latter is a self-documenting wrapper.

```dew
// Affine consumption — complete program
// stdout: 2026
def main = fn {
  def x = Affine(2026);
  x.data -> stdout;   // field access on Affine(Int) → consume
}
```

**Field access on affine structs fully consumes the struct** — regardless of whether the accessed field is affine. Normal-typed fields are copied before the struct is consumed; the copy lives independently:

```dew
affine struct Request {
  body: Array(Char, 4),
  handle: Affine(Int),
}

def req = Request { body: "data", handle: Affine(1) };
def h = req.handle;    // affine field → req fully consumed
def b = req.body;      // ERROR: req already consumed
```

Even Normal field access first still fully consumes:

```dew
def b = req.body;      // Normal → copied, req fully consumed
def h = req.handle;    // ERROR: req already consumed
```

The canonical way to access multiple fields / extract an affine field is pattern destructuring, which makes the intent explicit and extracts everything in one operation:

```dew
def Request { handle: h, .. } = req;       // full consumption, body discarded via ..
def Request { handle: h, body: _ } = req;  // explicit discard of body
```

**Pattern matching** on affine structs also fully consumes all fields. `_` on an affine field triggers implicit `drop`:

```dew
match req {
  Request(body, handle) => handle.data -> stdout,  // full consumption
}
match req {
  Request(body, _) => body -> stdout;  // handle dropped via _
}
// req is gone after either match
```

**Affine consumption rules summary:**

| Operation | Normal element | Affine element |
|-----------|---------------|----------------|
| Field access (`s.field`) | **Full consumption** (value copied before consume) | **Full consumption** (value moved) |
| Match | Bind (copy/move all fields) | Struct fully consumed |
| Array subscript (`a[i]`) | Copy element | Consume **entire array** |
| Tuple destructure | Copy element | Consume element, tuple degraded |

> Any field access on an affine struct is one use of the struct. The struct is consumed; the accessed field's value survives (copied for Normal, moved for affine). To access multiple fields, use pattern destructuring: `def Request { body: b, handle: h } = req` — one operation, all fields extracted.

### 4.3 Primitive Types

| Type | Description |
|------|-------------|
| `Int` | Signed 64-bit integer |
| `Bool` | `True` or `False` |
| `Char` | Unicode character |
| `Unit` | Unit type; value is `Unit`, NOT `()` |

**No `Float` in initial version.** String literals are `Array(Char, N)` — no `String` type name.

### 4.4 Struct

```dew
struct Point {
  x: Int,
  y: Int,
}
```

**Construction.** Named-field syntax, matching the declaration:

```dew
def p = Point { x: 3, y: 4 };
```

Single-field structs accept a positional shorthand:

```dew
def a = Affine(42);         // shorthand for Affine { data: 42 }
```

**Field access and update:**

```dew
def x = p.x                // field access
def p2 = p { x = 10 }     // field update, returns new value (NOT mutation)
```

**Pattern destructuring:**

```dew
def Point { x, y } = p;           // bind x and y
def Point { x, .. } = p;          // bind x, drop the rest
def Point { x, y: _ } = p;        // bind x, explicitly discard y via _
def Request { handle: h, .. } = req;  // rename binding
```

The `..` (two dots) is the **rest pattern**, matching Rust and Haskell convention. It discards all unmentioned fields — Normal fields are copied, [affine](#42-affine-type-modifier) fields are consumed. Two-dot syntax is deliberate: `..` in pattern position is rest; `..` in expression position is range (future). No ambiguity — the parser distinguishes by context. Three-dot `...` is not used.

> Named construction makes the syntax symmetric with pattern destructuring: `Point { x: 1, y: 2 }` constructs; `def Point { x, y } = p` deconstructs. Their was a positional constructor design (`Point(1, 2)`), but currently it is removed for multi-field structs — adding a field silently broke all call sites. The `{ field = val }` update syntax matches the [`&` borrow sugar](#55-borrow-parameter--sugar) `&p { x = val }`.

```dew
// Struct construction and access — complete program
// stdout: 7
struct Point { x: Int, y: Int }

def dist = fn(p: Point) -> Int { p.x + p.y }

def main = fn {
  def p = Point { x: 3, y: 4 };
  dist(p) -> stdout;
}
```

### 4.5 Enum

```dew
enum Option {
  Some(Int),
  None,
}
```

**Constructor syntax** mirrors the variant declaration — positional for single-payload, named for multi-field:

```dew
def x = Some(2026)
def y = None          // type inferred from context
def y: Option = None  // explicit annotation
```

Variants with named fields use struct-like construction:

```dew
enum Event {
  KeyPress { key: Char, modifiers: Int },
  Quit,
}

def e = KeyPress { key: 'a', modifiers: 0 };
def e = Quit;
```

Each variant has at most one positional payload, or multiple named fields. Mixing both in one variant is not allowed.

For [affine](#42-affine-type-modifier) enum rules, enums follow the same three rules as structs. A variant with an affine-typed payload infects the entire enum:

```dew
// Warning: Loaded carries an affine payload → add 'affine enum'
enum Node {
  Text(Array(Char, 8)),
  Loaded { data: Array(Char, 8), ref: Affine(Int) },
}
```

Named-field variants work exactly like structs: any affine-typed field in any variant makes the enum affine. Explicit `affine enum Node { ... }` silences the warning.

```dew
// Enum construction and match — complete program
// stdout: 2026
enum Option { Some(Int), None }

def main = fn {
  def x = Some(2026);
  def val = match x {
    Some(v) => v,
    None => 0,
  };
  val -> stdout;
}
```

### 4.6 Tuple

```dew
def p = (2026, "hello")      // (Int, Array(Char, 5))
def (x, y) = p               // destructuring
def p2 = p { 0 = 10 }        // update by index
```

- Two or more elements. No unit tuple (use `Unit`). No single-element tuple.
- `_` discards unwanted values in patterns.
- No numeric index access expression (only pattern destructuring and update syntax).

```dew
// Tuple destructuring — complete program
// stdout: 7
def main = fn {
  def p = (3, 4);
  def (x, y) = p;
  x + y -> stdout;
}
```

### 4.7 Array

```dew
type Array(T, N)   // T: element type, N: integer literal (N > 0)
```

`[e1, e2, ...]` is syntactic sugar for array construction. Unlike Haskell, where `[1, 2, 3]` constructs a linked `List`, Dew's brackets always produce a fixed-size `Array` — the size `N` is inferred from the number of elements. `N` must be an integer literal; it cannot be a variable or any expression:

```dew
def arr = [1, 2, 3]           // Array(Int, 3) — N inferred from element count
def arr: Array(Int, 3) = ...  // explicit N as literal

def size = 10;
def arr: Array(Int, size) = ... // ERROR: N must be a literal
```

> `def` creates a runtime value, not a compile-time constant. `def N = 10` and `def N = fn { def x: Int; &x -> stdin; x }()` are indistinguishable to the type system — both are runtime bindings, even if the programmer knows one is constant. The `fn { ... }()` pattern is an immediately-invoked function expression (see [§5.1](#51-definition)). Array size `N` appears at the type level (`Array(Int, N)` is a TYPE); crossing the type/value boundary would require dependent types, which Dew does not have. Integer literals are the only compile-time constants.

String literals are arrays of Char: `"hello"` is `Array(Char, 5)`.

```dew
// Array access and update — complete program
// stdout: 12
def main = fn {
  def arr = [1, 2, 3];
  def arr = arr { [0] = 10 };
  arr[0] + arr[1] -> stdout;
}
```

### 4.8 Function Types

`->` notation, right-associative. Functions with IO side effects append `IO` before the return type:

```
Int -> Bool                      // single param
(Int, Bool) -> Char             // two params: Int and Bool
Int -> Bool -> Char             // curried: Int -> (Bool -> Char)
(Int -> Bool) -> Char           // HOF param
(Int) -> IO Int                 // IO function
(Int, Bool) -> IO Char          // multi-param IO function
(&Int) -> Int                   // borrow parameter
((Int, Int) -> Char, Int) -> Array(Char, 10)   // HOF: takes a function param
```

**Higher-order functions.** Function parameters are first-class — no special syntax needed. The type of the parameter is itself a function type:

```dew
def apply_twice = fn(f: (Int) -> Int, x: Int) -> Int {
  f(f(x))
}
// apply_twice: ((Int) -> Int, Int) -> Int

def map_char = fn(f: (Int) -> Char, xs: Array(Int, 10)) -> Array(Char, 10) {
  // ...
}
// map_char: ((Int) -> Char, Array(Int, 10)) -> Array(Char, 10)
```

**Parameter list vs. tuple.** `(Int, Bool)` before `->` is a **parameter list** — two separate parameters. It is NOT a single tuple parameter. A true tuple parameter requires double parentheses:

```
(Int, Bool) -> Char              // two params → returns Char
((Int, Bool)) -> Char            // one param of type (Int, Bool) → returns Char
```

The distinction matters for [borrow sugar](#55-borrow-parameter--sugar): `(&Int, Bool) -> Int` has two parameters (one borrow, one normal). The compiler's internal representation after desugaring is `(Int, Bool) -> (Int, Int)`, but this internal form is invisible to the user. The surface display reconstructs `(&Int, Bool) -> Int` from the tuple return.

> **Internal and surface types are not equivalent** to the user. `(&T) -> U` and `(T) -> (T, U)` are different surface types — the compiler's internal normalization is an implementation detail, not a user-facing equivalence. A function declared `fn(&x: Int) -> Int { ... }` has type `(&Int) -> Int`, not `(Int) -> (Int, Int)`. Writing `def f: (Int) -> (Int, Int) = ...` creates a normal tuple-returning function, not a borrow function. The two cannot be assigned to each other or substituted — the compiler rejects such attempts with a type mismatch.

The `->` is used for function types only in type position. Pipeline operator `->` is expression-level. No ambiguity: in type context, `->` is always the function type constructor.

`IO` is an effect marker, not a type constructor. `IO (IO Int)` is rejected. See §3.5 for effect propagation rules.

### 4.9 `typeof` + `type_match` — Compile-Time Reflection

Dew provides **compile-time reflection** through two mechanisms: `typeof(expr)` resolves the static type of an expression at compile time, and `type_match` performs compile-time dispatch on type patterns. Together they enable type-level branching with zero runtime overhead.

#### `typeof` — Compile-Time Type Resolution

`typeof(expr)` is a compile-time operator that resolves to the static monomorphized type of `expr`. It is not a runtime function — the compiler evaluates it and substitutes the type directly. The grammar extends `Type` to include it:

```
Type ::= ... | "typeof" "(" Expr ")"
```

Analogous to C++ `decltype`, C23 `typeof`, TypeScript `typeof`, and GCC's `__typeof__`. The key difference: Dew's `typeof` is usable in **type patterns**, not just type annotations:

```dew
def x = 2026;
type_match typeof(x) {
  Int => x + 1,
  _   => 0,
}
```

#### `type_match` — Type-Level Pattern Matching

`type_match` is like `match`, but arm patterns are **types**, not values. Each arm narrows the type context to the matched type — subsequent expressions within the arm see the narrowed type:

```dew
type_match typeof(x) {
  Int      => x + 1,          // x narrows to Int
  Bool     => not x,          // x narrows to Bool
  Array(Char, _) => x -> stdout,  // x narrows to Array(Char, N)
  _        => Unit,           // fallback
}
```

**Type parameter dispatch** — `type_match` can match on a type parameter directly, with no value needed:

```dew
def default_value = fn -> T {
  type_match T {
    Int     => 0,
    Bool    => false,
    Char    => '\0',
    _       => Unit,
  }
}

def x: Int = default_value();    // T=Int → compiles to: 0
def f: Bool = default_value();   // T=Bool → compiles to: false
```

#### How It Works — Compile-Time Monomorphization

`type_match` is evaluated entirely at compile time through monomorphization. For each concrete instantiation of a generic function, the compiler generates only the matching arm — unmatched arms are dead code eliminated:

```dew
def add_if_int = fn(x: T, y: T) -> T {
  type_match T {
    Int => x + y,       // T=Int → only this arm survives
    _   => Unit,        // T≠Int → only this arm survives
  }
}

add_if_int(3, 4);       // monomorphizes to: fn(x: Int, y: Int) -> Int { x + y }
add_if_int(true, false); // monomorphizes to: fn(x: Bool, y: Bool) -> Bool { Unit }
```

**`typeof(x)` propagation.** When `typeof(x)` is used, the compiler tracks the concrete type through the call chain. At the call site, monomorphization resolves the type and propagates it to `typeof` expressions in the function body.

#### Relationship with `match`

| | `match` | `type_match` |
|---|---|---|
| Matches on | Runtime values | Compile-time types |
| Arm patterns | Value patterns (`42`, `True`, `Some(v)`) | Type patterns (`Int`, `Array(T, _)`) |
| Effect | Runtime branching | Compile-time monomorphization (zero runtime) |
| Type narrowing | No (binds values, doesn't narrow types) | Yes (each arm has narrowed type context) |

#### Cross-Language Comparison

| Language | Mechanism | Dew Equivalent |
|----------|-----------|---------------|
| **C++** | `if constexpr (is_same_v<T, int>)` + `decltype(x)` | `type_match T { Int => ... }` + `typeof(x)` |
| **Zig** | `comptime switch (@TypeOf(x)) { u32 => ... }` | `type_match typeof(x) { Int => ... }` |
| **Rust** | `std::any::TypeId` (runtime, no narrowing) + `Any::downcast_ref` (runtime, narrowing) + `macro_rules!` (compile-time, token matching) | Dew's `type_match` is compile-time, type-narrowing, and built into the language rather than split across macros, traits, and runtime reflection |
| **Haskell** | `Data.Typeable` + `TypeRep` (runtime, via GADT casting) | Dew's is compile-time, zero overhead |
| **TypeScript** | `typeof x === "number"` (runtime narrowing via control flow) | Dew's is compile-time, pattern-based |

#### Design Decision — Why `typeof`, not `type_of`

The initial design had `type_of(expr)` returning a `TypeRepr` enum value. This was removed because:

- `TypeRepr` values (`IntT`, `BoolT`) could shadow user names — a naming collision risk
- `match` on `TypeRepr` values does NOT narrow types — `x` stays `T` in all arms
- `type_match` with compile-time type patterns naturally narrows types

`typeof` + `type_match` replaces both `type_of` and `TypeRepr` with a cleaner, more powerful mechanism.

> `typeof` and `type_match` are Phase 3 features. The compiler must support monomorphization and compile-time type resolution.

#### Future Design — Beyond Basic `type_match`

`type_match` in its basic form matches concrete type constructors (`Int`, `Bool`, `Array(T, _)`). Two extensions are deferred for future consideration:

- **Type-level tuple destructuring**: `type_match T { (H, ..R) => ... }` — matching on tuple structure with a rest pattern `..R`. This enables recursive type-level computation but requires type-level pattern matching infrastructure and explicit template instantiation syntax (`::R()`). Not planned for any current phase.

- **Recursive monomorphization**: Chaining `type_match` results through recursive calls would require the compiler to generate code for each level of recursion at compile time. This is template metaprogramming territory — powerful but complex.

> Dew does **not** aim to be a template metaprogramming language. `type_match` provides compile-time type dispatch; recursive type-level computation is left to future evaluation. If a feature requires the compiler to prove termination of type-level recursion, it is out of scope for the current design.

---

## 5. Functions

### 5.1 Definition

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
```

- First-class functions
- Higher-order functions supported
- No currying (full arguments required at call site)
- Zero-arg functions may omit parentheses: `fn { body }`

**Return type elision.** If the body type is `Unit`, `-> Unit` may be omitted:

```dew
// These are equivalent
def greet = fn(name: Array(Char, 32)) { name -> stdout; }
def greet = fn(name: Array(Char, 32)) -> Unit { name -> stdout; Unit }
```

**Implicit `Unit` in blocks.** A block whose **last statement** is terminated by `;` (not a final expression) implicitly yields `Unit`. An entirely empty block `{ }` also yields `Unit`:

```dew
def f = fn(x: Int) {
  stdout(x);         // statement ending with ;
  // implicit: Unit
}
// Equivalent to: fn(x: Int) -> Unit { stdout(x); Unit }
```

When the side-effect call is the only body content, use `;` to make it a statement:

```dew
def main = fn { stdout(2026); }     // statement with ; → implicit Unit
def main = fn { stdout(2026) }      // also works: stdout returns Unit
```

The compiler accepts both forms, but `;` is recommended for clarity — it signals that the side effect is the purpose, not the value. This works for function bodies, `if`/`else` branches, and `match` arms.

**Discard parameter `_`.** Use `_` as a parameter name to indicate the argument is unused:

```dew
def ignore_first = fn(_: Int, y: Int) -> Int { y }
def ignore_all = fn(_: Int, _: Bool) -> Int { 0 }
```

`_` discards the **value** of the parameter. The type annotation remains required (no `fn(_, y)` — types must be explicit or inferrable from context). `_` is a valid pattern name only in parameter and match positions, never in type annotations.

```dew
// Function definition and call — complete program
// stdout: 2026
def add = fn(x: Int, y: Int) -> Int { x + y }

def main = fn { add(40, 2) -> stdout }
```

#### Immediately-Invoked Function Expressions (IIFE)

`fn { ... }()` constructs a closure and invokes it immediately — no special syntax needed. This is natural in an expression-based language where `fn` is itself an expression and `()` is zero-argument application:

```dew
def val = fn {
  def x: Int;
  &x -> stdin;
  x
}();
```

IIFE is useful for creating a temporary scope — declare variables, perform IO, extract a result — without polluting the outer scope. The inner `def` bindings are invisible to the caller:

```dew
// Compute a complex initial value with local intermediates
def config = fn {
  def a = heavy_computation(10);
  def b = another_computation(a);
  a + b
}();
```

With [borrow sugar](#55-borrow-parameter--sugar), IIFE can encapsulate mutation-like patterns into a pure expression:

```dew
def val = fn(&x: Int) { &x = x + 1; x }(&n);
// val = n + 1 — the borrow happens inside the IIFE, `n` is rebound via &n
```

IIFE is not a language feature — it's a consequence of `fn` being a first-class expression and `()` being function application. The compiler treats it identically to defining and calling a named function.

> IIFE follows the same [strict/lazy rules](#32-lazy-evaluation) as any function call. In a `def` binding (`def x = fn { ... }()`), the IIFE is lazy — it creates a thunk and only evaluates when forced. In a strict context (tail expression, IO function body), it evaluates immediately. IIFE is not inherently strict; it defers to its enclosing context.

### 5.2 Closures

Closures capture the **value** of external variables at definition time, not references. Capture is implicit — no `move` keyword needed:

```dew
def x = 1
def f = fn { x }    // captures the value 1
def x = 2           // rebinds x
f()                 // returns 1 — the captured value, not the new binding
```

**Closure Resource property.** A closure's [Resource property](#36-properties) (`Fn` vs `FnOnce` in Rust) is inferred from captured variables. Capturing an affine value makes the closure affine — it can only be called once:

```dew
// Pure closure — captures only Normal values → Fn (multi-call)
def x = 1;
def add_x = fn(y: Int) -> Int { x + y };
def a = add_x(10);    // OK — first call
def b = add_x(20);    // OK — second call

// Affine closure — captures affine value → FnOnce (single-call)
def a = Affine(2026);
def consume = fn { a.data };
def v = consume();     // OK — first call
// consume();          // ERROR: closure already consumed
```

```dew
// Closure value capture — complete program
// stdout: 1
def main = fn {
  def x = 1;
  def f = fn { x };  // captures value 1
  def x = 2;          // rebinds x
  f() -> stdout;       // still returns 1
}
```

**Summary of closure capture scenarios:**

| Captures | Resource | Callable | IO |
|----------|----------|----------|----|
| No captures | Fn | ∞ | pure |
| Only Normal values | Fn | ∞ | pure |
| Any affine value | FnOnce | 1 | pure |
| Calls `stdin`/`stdout` inside | Fn | ∞ | IO |
| Affine capture + calls IO | FnOnce | 1 | IO |

> Resource (Fn/FnOnce) and Effect (pure/IO) are independent. A closure can be `Fn + IO` (multi-call, does I/O), or `FnOnce + pure` (single-call, no I/O). The two properties are inferred separately and compose without interaction.

```dew
// Fn + IO — multi-call closure that does I/O
def logger = fn(x: Int) {
  x -> stdout;
  x + 1
};
def a = logger(1);    // prints 1, returns 2
def b = logger(2);    // prints 2, returns 3 — second call OK

// FnOnce + IO — single-call closure with affine capture and I/O
def a = Affine(2026);
def process = fn {
  a.data -> stdout    // consumes a (FnOnce) + does I/O
};
process();
// process();          // ERROR: FnOnce already called
```

### 5.3 Recursion

```dew
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}
```

- Compiler auto-detects self-reference — no `rec` keyword needed
- Mutual recursion supported
- Tail-call optimization

```dew
// Recursive factorial — complete program
// stdout: 120
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}

def main = fn { fact(5) -> stdout }
```

### 5.4 Anonymous Recursion (fix)

```dew
def result = fix loop {
  fn(x: Int) -> Int {
    if x < 10 { loop(x + 1) } else { x }
  }
}(0)
```

The identifier `loop` is visible only within the `fix` block. Used for one-shot loops.

### 5.5 Borrow Parameter (`&` sugar)

```dew
def translate = fn(&p: Point, dx: Int, dy: Int) -> Point {
  &p { x = p.x + dx, y = p.y + dy }
}
```

**Desugaring.** Borrow sugar is syntactic sugar eliminated in the desugar pass. Below are the formal rewrite rules. The type checker never sees `&`.

#### Rule 1: Function Definition

A function with borrow parameters is rewritten to return a tuple of all borrow parameters followed by the original result:

```
def name = fn(&p: T, &q: S, args...) -> U { ...body... }

  ⇓

def name = fn(p: T, q: S, args...) -> (T, S, U) { ...body'... }
```

The return tuple is `(T1, ..., Tn, U)` for `n` borrow parameters. Each borrow parameter gets its own internal `%` binding.

In `body'`:
- Every `&p = expr` → `def %p = expr` (internal name; `%` prefix rejected by parser)
- Every `&p { f1 = v1, f2 = v2 }` → `def %p = p { f1 = v1, f2 = v2 }`
- `p` in all expressions continues to refer to the original parameter (unchanged)
- Sequential `&p` rebindings chain naturally: each `def %p = ...` shadows the previous, with RHS references resolving to the most recent binding
- The final expression `expr` → `(%p, expr)`

```dew
// Source
def translate = fn(&p: Point, dx: Int) -> Point {
  &p { x = p.x + dx }
}

// Desugared
def translate = fn(p: Point, dx: Int) -> (Point, Point) {
  def %p = p { x = p.x + dx };   // %p shadows; RHS p is the original param
  (%p, %p)
}
```

```dew
// Sequential borrow rebindings — Source
def shift = fn(&p: Point, dx: Int, dy: Int) -> Point {
  &p { x = p.x + dx };
  &p { y = p.y + dy };
}

// Desugared — each %p shadows the previous
def shift = fn(p: Point, dx: Int, dy: Int) -> (Point, Point) {
  def %p = p { x = p.x + dx };
  def %p = %p { y = %p.y + dy };   // RHS %p is the updated value from line above
  (%p, %p)
}
```

```dew
// Multiple borrow parameters — Source
def move_to = fn(&p: Point, &q: Point, dx: Int) -> Point {
  &p { x = p.x + dx };
  &q { x = q.x + dx };
  p   // use p (not returned as Point, but bound in return tuple)
}

// Desugared — each borrow param gets its own % name
def move_to = fn(p: Point, q: Point, dx: Int) -> (Point, Point, Point) {
  def %p = p { x = p.x + dx };
  def %q = q { x = q.x + dx };
  (%p, %q, %p)
}
// Surface display: (&Point, &Point, Int) -> Point
```

Multiple borrow parameters compose naturally. Each `&` parameter receives its own internal `%` binding. The return tuple grows linearly: `(T1, T2, ..., Tn, U)` for `n` borrow parameters and original return type `U`. At the call site, `n` tuple destructuring bindings rebind each borrow argument.

```dew
// Mixed borrow and normal parameters — Source
// Surface: (&Point, Int, &Int, Array(Char, 8)) -> Point
def process = fn(&p: Point, scale: Int, &color: Int, text: Array(Char, 8)) -> Point {
  &p { x = p.x * scale };
  &color = color + 1;
  p
}

// Desugared — borrow returns precede original return type
def process = fn(p: Point, scale: Int, color: Int, text: Array(Char, 8))
               -> (Point, Int, Point) {
  def %p = p { x = p.x * scale };
  def %color = color + 1;
  (%p, %color, %p)
}

// Call site:
def result = process(&p, 2, &color, "hello");

// Desugared call site — first n destructures rebind borrows, last binds U
def (p, color, result) = process(p, 2, color, "hello");
```

**Rebinding is immediate.** After `&p = expr` or `&p { ... }`, subsequent references to `p` resolve to the most recent rebound value. The `def %p = ...` shadow chain guarantees this — `%p` shadows itself in sequence, so all later code sees the updated binding. The original `p` is only accessible in the RHS of the first `&p` rebinding:

```dew
def f = fn(&p: Point) {
  &p { x = 10 };     // p is rebound
  p.x                 // → 10 — the updated value, not the original
}
```

#### Rule 2: Call Site — Simple Identifier

The call uses explicit `&` to mark borrow arguments. The compiler matches `&expr` at the call site:

```
def result = f(&x, args...);

  ⇓

def (x, result) = f(x, args...);
```

```dew
// Source
def result = f(&x, 10);

// Desugared
def (x, result) = f(x, 10);
```

Multiple borrow arguments compose the same way — each borrow parameter produces one destructuring binding:

```dew
// Source: f: (&Point, Int, &Int) -> Point
def result = f(&p, 2, &color);

// Desugared
def (p, color, result) = f(p, 2, color);
//   ↑    ↑       ↑
//  &p    &color   original U
```

#### Rule 3: Call Site — Compound Lvalue

Explicit `&` with a compound lvalue. The desugar pass extracts the inner value, calls the function, then rebuilds:

```
def result = f(&root.a1.a2...aN, args...);

  ⇓

def inner = root.a1.a2...aN;
def (inner, result) = f(inner, args...);
def root = root { a1 = root.a1 { ... { aN = inner } ... } };
```

```dew
// Source — f: fn(&v: Int) -> Int
def result = f(&p.x[1]);

// Desugared
def inner = p.x[1];
def (inner, result) = f(inner);
def p = p { x = p.x { [1] = inner } };
```

#### Rule 4: Statement-Level Call (With `;`)

When `f(&x, args...)` is followed by `;` (statement context), the return value is discarded. Only the rebinding matters:

```
f(&x, args...);                    // simple identifier + ;
  ⇓
def (x, _) = f(x, args...);

f(&root.a1...aN, args...);         // compound lvalue + ;
  ⇓
def inner = root.a1...aN;
def (inner, _) = f(inner, args...);
def root = root { a1 = root.a1 { ... { aN = inner } ... } };
```

#### Rule 4b: Tail Position (Block Final Expression, No `;`)

When `f(&x, args...)` is the final expression of a block (no `;`), the result must be returned. The desugar pass splits it into rebinding + result:

```
{ ...; f(&x, args...) }            // tail position
  ⇓
{ ...; def (x, result) = f(x, args...); result }

{ ...; f(&root.a1...aN, args...) } // compound lvalue in tail position
  ⇓
{ ...; def inner = root.a1...aN;
       def (inner, result) = f(inner, args...);
       def root = root { a1 = root.a1 { ... { aN = inner } ... } };
       result }
```

```dew
// Source
def g = fn -> Int {
  f(&v)            // tail position — no ;
}

// Desugared
def g = fn -> Int {
  def (v, result) = f(v);
  result           // return Int, not (T, Int)
}
```

**Context sensitivity.** The desugar pass inspects the AST to determine context:
- `f(&x, args...);` → statement context (Rule 4)
- Final expression of block, no `;` → tail context (Rule 4b)
- `def result = f(&x, args...);` → binding context (Rule 2/3)

#### Rule 5: Statement-Level `&` (No Function Call)

Block-level rebinding without a function call. Supports both simple and compound lvalues:

```
&p = expr;                         // simple
  ⇓
def p = expr;

&p { f1 = v1, f2 = v2 };          // struct update
  ⇓
def p = p { f1 = v1, f2 = v2 };

&t { .0 = v1, .1 = v2 };          // tuple update
  ⇓
def t = t { .0 = v1, .1 = v2 };

&root.a1...aN = expr;              // compound
  ⇓
def root = root { a1 = root.a1 { ... { aN = expr } ... } };

&root.a1...aN { f1 = v1 };         // compound struct update
  ⇓
def root = root { a1 = root.a1 { ... { aN = root.a1...aN { f1 = v1 } } ... } };
```

No tuple involved — these are pure `def` rebindings within the current block.

#### Rule 6: In-Place Optimization Contract

The type-preservation guarantee: `&p: T` assures that after the function returns, `p` is still a `T`. The type cannot change, only the internal values.

At the IR level, `Place` instructions perform copy-on-write: unchanged structure is shared with the original. When the compiler proves the original value is unreachable after the update, the copy is elided — the update becomes truly in-place.

> `&` is syntactic sugar, not a separate language feature. Semantically, every desugaring produces pure functional expressions. The in-place optimization is an IR-level contract enabled by the type-preservation guarantee. The contract holds for all three resource kinds: Normal values reuse stack slots directly; Affine values reuse exclusive-owned slots; Persistent handles reuse stack slots (the heap data is reference-counted separately and never mutated in place).

#### Forms Summary

`&` is a unified syntactic marker for "this value will be rebound." It appears in three positions, all sharing the same `&LValue` grammar:

| Form | Grammar | Example | Meaning |
|------|---------|---------|---------|
| Parameter | `&name: T` | `fn(&p: Point) -> ...` | Declares a borrow parameter |
| Call argument | `f(&LValue, ...)` | `f(&x, 10)` `f(&p.x[1])` | Pass ownership, rebind after call |
| Call arg ([pipeline](#56-pipeline-operator)) | `&LValue -> f` | `&x -> stdin` `&v -> f(a, b)` | Pipeline with borrow argument |
| Statement rebind | `&LValue = expr;` | `&p = Point(1,2);` `&a[i] = v;` | Rebind with new value |
| Statement update | `&LValue { ... };` | `&p { x = 10 };` `&a[i] { [0] = v };` `&t { .0 = v };` | Update nested fields and rebind |

**LValue grammar.** An lvalue is any expression that can appear on the left side of a rebinding:

```
LValue     ::= IDENT (LValueTail)*
LValueTail ::= "." IDENT | "[" Expr "]" | "." INT
```

| LValue | Example | Meaning |
|--------|---------|---------|
| Simple variable | `x` | Rebind a name |
| Field access | `p.x` | Update a struct field |
| Array subscript | `a[i]` | Update an array element |
| Tuple index | `t.0`, `t.1` | Update a tuple element (dot notation) |
| Chained | `pool[a+1].ref[1]` | Nested update through fields and indices |

Dew has four LValue primitives: variables, struct fields, array indices, and tuple indices. Any chain of dot access, bracket subscript, and dot-index is a valid LValue. No pointer dereference, no slice.

All forms use the same `LValue` grammar:
```
LValue ::= IDENT ("." IDENT | "[" Expr "]")*
```

Call sites use explicit `&` — the parser matches `&LValue` in argument position, and the desugar pass handles the rest via Rules 2–4.

#### Rule 7: Composeability — Borrow Parameter as Argument to Another & Function

A borrow parameter can be passed as a borrow argument to another function. The desugaring composes naturally:

```dew
def f = fn(&x: Int) {
  x -> stdout;       // x as non-borrow — read-only
  &x -> stdin;       // x as borrow — pipeline with explicit &
  x -> stdout;       // x is now the new value
}
```

After desugaring:
```dew
def f = fn(x: Int) -> (Int, Unit) {
  stdout(x);              // (1) x unchanged
  def (x, _) = stdin(x);  // (2) consume → return → rebind
  stdout(x);              // (3) x is the new value
  (x, Unit)               // (4) return final x
}
```

The inner `def (x, _) = stdin(x)` shadows the old `x` with the new value returned by `stdin`. The outer function's return captures the final value. This is not a special case — it falls out of the existing desugaring rules.

**Affine composeability.** The pattern holds for affine types as well:

```dew
affine struct Pair { a: Affine(Int), b: Affine(Int) }

def update = fn(&p: Pair) { &p { a = Affine(0) } }

def f = fn(&p: Pair) {
  update(&p);      // p passed as borrow to update
  // p is still available — update returned it via (Pair, Unit)
}
```

After desugaring:
```dew
def update = fn(p: Pair) -> (Pair, Unit) { def p = p { a = Affine(0) }; (p, Unit) }

def f = fn(p: Pair) -> (Pair, Unit) {
  def (p, _) = update(p);   // update consumes p → returns new p → rebinds
  (p, Unit)                  // p is available
}
```

Each borrow call is a **consume → return → rebind** cycle. As long as the callee returns the value (all `&` functions do), the ownership chain is unbroken. The affine type checker catches violations:

```dew
def destroy = fn(p: Pair) { /* consumes and does not return */ }
// destroy: (Pair) -> Unit — NOT a borrow function

def f = fn(&p: Pair) {
  destroy(p);      // p consumed, never returned
  (p, Unit)        // ERROR: use after consume
}
```

No language changes needed. The type system already enforces this.

#### Restrictions

1. `&` is **only for function parameters, call-site arguments, and block-level statements**. Not in types (`p: &Point`), return types, struct fields, or enum variants.

2. Without `&`, `=` inside a `&`-parameter function body creates a **local shadow**, not a rebind.

3. A call-site `&` whose LValue is not valid (e.g., `f(&2026)`, `f(&x + 1)`) is a compile error — nothing to rebind.

**HM inference.** Borrow sugar is eliminated in the desugar pass before type checking. The type checker sees tuple returns and destructuring bindings — never `&`. No impact on type inference. The same holds for [pipeline sugar](#56-pipeline-operator) and default initialization.

### 5.6 Pipeline Operator

```dew
e -> f           →  f(e)         // piped value as only argument
e -> f(a, b)     →  f(a, b, e)   // piped value as last argument
```

- Lowest precedence, left-associative
- Right side must be a function call or identifier
- Left side inserted as the **last argument** of the right-side function
- **Syntactic sugar only** — eliminated in the desugar pass; the type checker never sees `->` at expression level

For `f: (Int, Char) -> Unit`:

```dew
'a' -> f(1)     → f(1, 'a')      // 'a' placed as last argument
1 -> f('a')     → f('a', 1)      // 1 placed as last argument
(1, 'a') -> f   → f((1, 'a'))    // tuple as single argument
```

The rule is uniform and arity-independent: the piped value always becomes the last argument. No type-awareness needed in the desugar pass — if the resulting call is ill-typed, the type checker catches it.

```dew
// Pipeline chaining — complete program
// stdout: 7
def add = fn(x: Int, y: Int) -> Int { x + y }
def mul = fn(x: Int, y: Int) -> Int { x * y }

def main = fn {
  3 -> add(4) -> mul(1) -> stdout;
}
```

**Pipeline with borrow.** When the piped value is a borrow argument, `&` precedes the LValue:

```dew
&x -> stdin          → stdin(&x)      // desugar: pipeline first, then borrow
&v -> f(a, b)        → f(a, b, &v)    // & stays with the LValue through desugaring
```

The pipeline desugars first (`&x -> stdin` → `stdin(&x)`), then the borrow sugar applies as normal. The `&` binds to the LValue, not to the pipeline operator.

**Semicolon convention.** A pipeline in statement position (side effects only) ends with `;`. A pipeline as a tail expression (block return value) omits `;`:

```dew
// Statement position: side effect, no return value
def main = fn { 2026 -> stdout; }

// Tail position: return the pipeline result
def compute = fn(x: Int) -> Int { x -> add(2) -> mul(3) }

// Binding: pipeline value bound to a name
def result = 3 -> add(4);
```

> Pipeline is syntactic sugar for a function call. If the call involves a borrow argument (e.g., `&x -> f` where `f` takes `&p`), the pipeline desugars first (`&x -> f` → `f(&x)`), then the borrow sugar applies Rules 2–4b depending on context — the same as if the call were written directly.

### 5.7 No `return`

Dew has **no `return` keyword**. Every function body is a single expression (or block) whose final value is the return value. Early exit is achieved through `if`/`else` and `match` — no special control flow is needed.

```dew
// Without return — every path leads to the tail expression
def f = fn(x: Int) -> Int {
  if x < 0 { 0 } else { x + 1 }
}

// What would be "guard clauses" in other languages become if/else chains
// (else if is nesting sugar: if a { b } else if c { d } ≡ if a { b } else { if c { d } else { e } })
def sign = fn(x: Int) -> Int {
  if x < 0 { -1 }
  else if x == 0 { 0 }
  else { 1 }
}
```

> `return` is unnecessary because [`if` is syntactic sugar for `match`](#62-ifelse), and `match` always has an `else` equivalent — every expression must produce a value in all branches (see [§6.1](#61-match)). There is no never-type (`!`) coercion in Dew, so a `return` in one branch would force all branches to return, at which point `return` is just the tail expression and can be deleted. Rust, which has `return`, also has `if` without `else` (producing `()`) and never-type coercion; Dew has neither. The combination of `if`-with-`else` and expression-based blocks makes `return` redundant.

### 5.8 `def` Binding

`def` is the sole binding keyword. It creates new bindings and allows shadowing:

```dew
def x = 1              // new binding
def x = x + 1          // new binding, shadows old (NOT mutation)
```

**Default initialization.** A `def` with a type annotation but no initializer gets the type's default value:

```dew
def x: Int;            // 0
def flag: Bool;        // false
def c: Char;           // '\0'
def u: Unit;           // Unit
def p: Point;          // Point(0, 0) — recursive field defaults
def arr: Array(Int, 3);  // [0, 0, 0]
```

The default is defined per type:
| Type | Default |
|------|---------|
| `Int` | `0` |
| `Bool` | `false` |
| `Char` | `'\0'` |
| `Unit` | `Unit` |
| Struct | Default of each field, recursively |
| Tuple | Default of each element |
| Array(T, N) | Array of N default T values |
| Enum | The first variant, if it has no payload; else compile error |
| Function | Returns `default(R)` for return type `R`; borrow parameters are identity-passed |

```dew
def f: (Int) -> Int;        // fn(_: Int) -> Int { 0 }
def g: (&Int) -> Int;       // fn(&_: Int) -> Int { 0 }
def h: (&Int, Bool, &Char) -> Unit;  // fn(&_: Int, _: Bool, &_: Char) -> Unit { Unit }
```

The default function is universal: ignore all parameters (bind with `_`), pass borrow parameters through unchanged (identity in the return tuple), and return `default(R)`. This is not an identity, constant, or bottom function — it is **identity for borrows, default for result**, and applies uniformly to all function types.

> Each borrow parameter in a function is always rebound — even if no `&p = ...` statement appears in the body. The desugar pass always includes borrow parameters in the return tuple. When the body makes no change, this is equivalent to `def %p = p` (a no-op identity pass-through), which the optimizer may eliminate.

**Pattern destructuring.** `def` supports pattern matching on the left side for struct and tuple values:

```dew
// Struct destructuring
def Point { x, y } = p;              // bind x and y
def Point { x, .. } = p;             // bind x, drop the rest
def Request { handle: h, .. } = req;  // rename binding (field "handle" → variable h)

// Tuple destructuring
def (a, b) = pair;
def (x, _, z) = triple;              // _ discards the second element
```

The `..` rest pattern discards unmentioned struct fields. `_` discards a single position in either struct or tuple patterns. Both `..` and `_` trigger implicit `drop` for affine fields.

> Enum destructuring must use `match` — there is no `if let`. Enums involve control flow (multiple variants), and `match` makes the branching explicit. Struct and tuple destructuring have no branching, so `def` + pattern is sufficient.

```dew
// Destructuring on affine structs — complete program
// stdout: 2026
affine struct Pair { a: Affine(Int), b: Affine(Int) }

def main = fn {
  def p = Pair { a: Affine(2026), b: Affine(1) };
  def Pair { a: x, .. } = p;   // consume a, drop b via ..
  x.data -> stdout;
}
```

---

## 6. Control Flow

### 6.1 `match`

```dew
match expr {
  pattern1 => result1,
  pattern2 => result2,
  _ => default,
}
```

Patterns: wildcard `_`, variable, literal (`2026`, `True`), struct (`Point(x, y)`), enum variant (`Some(v)`), tuple (`(a, b)`).

**Branch return types.** All match arms must produce the same type. The type checker unifies the arm expressions:

```dew
match x {
  Some(v) => v,    // Int
  None => 0,       // Int — OK: both arms are Int
}
match x {
  Some(v) => v,    // Int
  None => true,    // Bool — ERROR: type mismatch
}
```

**Affine consumption in branches.** An affine value consumed in one arm but not another is unusable after the match. The compiler inserts implicit `drop` in arms that don't consume it:

```dew
def a = Affine(42);
match cond {
  True => a.data -> stdout,    // a consumed here
  False => 0 -> stdout,        // a dropped here (implicit)
}
// a is gone — cannot be used after either branch
```

If an affine value is NOT consumed in any arm (only read/copied), it remains available after the match. The rule: **affine values consumed in any arm are consumed for all arms** — the compiler enforces this by inserting drops where needed.

**Exhaustiveness.** `match` must cover all constructors of the matched type. A non-exhaustive `match` is a **compile error**. Wildcard `_` satisfies any remaining constructors. The compiler checks exhaustiveness at the pattern level — if a variant is missing and not covered by `_`, compilation fails.

```dew
// Match with enum — complete program
// stdout: 2026
enum Option { Some(Int), None }

def main = fn {
  def x = Some(2026);
  match x {
    Some(v) => v,
    None => 0,
  } -> stdout;
}
```

### 6.2 `if`/`else`

Syntactic sugar for `match` on `Bool`:

```dew
if cond { a } else { b }
// desugars to:
match cond { True => a, False => b }
```

```dew
// If/else — complete program
// stdout: yes
def main = fn {
  def x = 5;
  if x > 3 { 1 } else { 0 } -> stdout;
}
```

`if` without `else` is not allowed — `if/else` desugars to `match` on `Bool`, and `Bool` has exactly two constructors (`True`, `False`). Both arms are required for exhaustiveness. The same branch return type consistency and affine consumption rules from `match` (§6.1) apply to `if/else`.

**`else if`** is syntactic sugar for nested `if/else`:

```dew
if a { b } else if c { d } else { e }
// desugars to:
if a { b } else { if c { d } else { e } }
```

Each `else if` introduces a nested `if` in the else-branch. No special parsing needed — the parser sees `else if` as `else` followed by a new `if` expression.

**No structural ambiguity.** Rust has a parsing ambiguity: `if Struct{} { } { }` — the parser cannot tell whether the second `{ }` starts an `else` block or is a trailing block statement. Dew avoids this entirely because `if` always requires `else`:

```dew
if Point{} { a }              // SYNTAX ERROR: missing else after then-block
if Point{} { a } else { b }   // parsed as: if (Point{}) { a } else { b }
                               // type error: Point is not Bool (caught by type checker)
```

The parser never needs to guess. It always consumes `if expr { then } else { else }` — no other interpretation is possible. If `expr` happens to be a struct construction, the type checker catches it later as a type mismatch. Inserting `else` into a single-arm `if` is impossible: there is always a `{` after `if expr`, which is the then-block, and then `else` is mandatory.

### 6.3 Loops

**No loop statements.** Use recursion, `fix`, or standard library higher-order functions:

> Removing loops is both a semantic and practical decision. Semantically, loops require mutable state (a loop counter or iterator), which contradicts Dew's immutability. Practically, loops complicate the strictness analysis and IR generation — a `while` loop has a condition (strict), a body (lazy or strict depending on content), and implicit mutation of the loop variable. Translating loops to recursion/fix pushes this complexity to the Rx→Dew translation layer, keeping the Dew core simple. Users coming from imperative languages use `fix` or higher-order functions instead.

| Imperative | Dew Equivalent |
|------------|---------------|
| `for x in xs` | `xs -> foreach(f)` |
| `xs.map(f)` | `xs -> map(f)` |
| `xs.filter(p)` | `xs -> filter(p)` |
| `xs.fold(init, f)` | `xs -> fold(init, f)` |
| `while cond` | recursion / `fix` |

---

## 7. Identifiers and Operators

### 7.1 Identifiers

```
Alphabetic:  (Letter | '_') (Letter | Digit | '_')*
Operator:    OperatorChar+
```

Operator characters: `+ - * / % < > = ! & |`

**Reserved prefix.** Identifiers starting with `%` are reserved for compiler-generated internal names (desugar pass, IR layer). The parser rejects any user-written identifier beginning with `%`. This guarantees no collision between user code and compiler-introduced bindings. See [§5.5 Rule 1](#rule-1-function-definition).

### 7.2 Operators

**Only for primitive types. Non-overloadable.**

| Category | Operator(s) | Applicable Types | Example |
|----------|-----------|-----------------|---------|
| Arithmetic | `+ - * / %` | Int | `1 + 2`, `10 / 3`, `7 % 2` |
| Comparison | `< > <= >=` | Int, Char | `x < 10`, `'a' <= c` |
| Equality | `== !=` | Int, Bool, Char, Unit | `x == 0`, `flag != True` |
| Logical | `&& \|\|` | Bool | `cond && ok`, `a \|\| b` |
| Logical NOT | `not` (built-in) | Bool | `not flag` |
| Force (prefix) | `!` | All types | `!x`, `!(heavy_computation)` |
| Force (function) | `force()` (built-in) | All types | `force(x)` |
| Pipeline | `->` | All types | `x -> stdout`, `3 -> add(4)` |
| Field access | `.` | Struct | `p.x`, `req.handle` |
| Subscript | `[]` | Array | `arr[0]`, `a[i + 1]` |
| Update | `{}` | Struct, Array, Tuple | `p { x = 10 }`, `t { .0 = 1 }` |

Built-in operators can be infix. User-defined operator functions cannot be infix. `!x` and `force(x)` are equivalent; `!` is the prefix operator form.

> **`!` is force, not logical NOT.** Like Haskell, `!` is used for strictness/force semantics. The logical NOT operator is the built-in function `not`. Do not confuse: `!x` forces evaluation of `x`; `not x` negates a boolean. These are distinct operators at the same precedence level (2).

### 7.3 Operator Precedence

From tightest to loosest:

| Precedence | Operators |
|------------|-----------|
| 1 (tightest) | `.` field access, `[]` subscript, `()` call |
| 2 | `not`, `-` (negation), `!` force |
| 3 | `*` `/` `%` |
| 4 | `+` `-` |
| 5 | `<` `>` `<=` `>=` |
| 6 | `==` `!=` |
| 7 | `&&` |
| 8 | `\|\|` |
| 9 (loosest) | `->` pipeline |

---

## 8. I/O System

### 8.1 `stdin` / `stdout`

`stdin` and `stdout` are typed compiler intrinsics with polymorphic signatures. Both inject the `IO` effect.

```dew
stdin(&v: T)       // read from stdin into v via borrow-rebind
stdout(v: T)       // write v to stdout
```

**Desugared signatures** (what the type checker sees):

```
stdin:  (T) -> (T, Unit)       // & sugar expands to tuple return
stdout: (T) -> Unit            // write and return Unit
```

The `&v` on `stdin` is Dew's borrow sugar (§5.5): the read value is returned as part of the result tuple, and the caller rebinds `v`:

```dew
def x = 0;            // initial value
&x -> stdin;          // reads into x; desugars to: def x = stdin(x)
// x now holds the read value
```

**Example:**
```dew
// Read two ints, print their sum — complete program
// stdin: 40 2
// stdout: 2026
def main = fn {
  def a = 0;
  def b = 0;
  &a -> stdin;
  &b -> stdin;
  a + b -> stdout;
}
```

### 8.2 Call Style

Pipeline style is preferred for `stdin` and `stdout`:

```dew
2026 -> stdout            // pipeline: value flows left-to-right
&x -> stdin             // pipeline with borrow: marks x for rebinding
3 -> add(4) -> stdout   // chained pipeline
```

Function-call style is equivalent but less idiomatic:

```dew
stdout(2026)              // equivalent, not preferred
stdin(&x)               // equivalent, not preferred
```

### 8.3 Supported Types

| Type | stdin | stdout |
|------|-------|--------|
| Int | Yes | Yes |
| Bool | Yes | Yes |
| Char | Yes | Yes |
| Unit | — | **No** — compile error |
| Array(T, N) (T primitive) | Yes | Yes |
| List(T) (T primitive) | — | Yes |


Custom types not supported. Infinite List caught at runtime by circular dependency detection in the evaluator's 3-state FSM.

> `Unit` carries no information. Printing it is a compile error — there is no meaningful text representation. `"Unit"` (Array(Char, 4)) is not `Unit`; inventing `()` or `#Unit` output would introduce a concept with no counterpart in Dew source. Functions returning `Unit` are called for their side effects; their result is never printed.

### 8.4 `stdin` / `stdout` are Compiler Intrinsics

Their type signatures are part of the language specification — the type checker treats them as built-in polymorphic functions. Their implementation is compiler-provided: the evaluator handles `stdin` by reading from process stdin and `stdout` by writing to process stdout. Users cannot define functions named `stdin` or `stdout` (shadowing warning).

---

## 9. Collections

### 9.1 List

```dew
enum List(T) {
  Cons(T, List(T)),
  Nil,
}
```

`Cons` (from Lisp "construct") and `Nil` are enum variants in a recursive algebraic data type — the standard definition of a singly-linked list. The type parameter `T` is inferred from context:

```dew
def xs = Cons(1, Cons(2, Cons(3, Nil)));   // List(Int)
def ys = Cons("a", Cons("b", Nil));         // List(Array(Char, 1))
```

Each `Cons` contains a head element of type `T` and a tail of type `List(T)`. `Nil` terminates the chain — it carries no value and represents the empty list. This is identical to Haskell's `data List a = Cons a (List a) | Nil`.

**Recursive construction:**

```dew
def xs = Cons(1, Nil);              // [1]
def xs = Cons(1, Cons(2, Nil));     // [1, 2]
def xs = Cons(1, Cons(2, Cons(3, Nil)));  // [1, 2, 3]
```

`T` is resolved by HM at the call site — no explicit template parameters needed. The compiler monomorphizes `List` for each concrete `T` used.

### 9.2 Standard Library Functions

Separate `map`, `filter`, `fold`, `foreach` for [Array](#47-array) and `List`.

**Conversion:**

- `array_to_list: Array(T, N) -> List(T)` — converts a fixed-size array to a linked list. `N` is known at compile time from the array type.
- `list_to_array` — **not provided**. Array size `N` is part of the type and must be a literal; a list carries no size information. Converting `List(T) -> Array(T, N)` would require the caller to supply `N`, which crosses into dependent type territory. Use `array_to_list` for one-way conversion.

---

## 10. Standard Library

The standard library provides types and functions that are not built into the language but are defined in `stdlib/` using Dew itself. All stdlib definitions are normal Dew source — no compiler magic beyond what `stdin`/`stdout`/`force` provide.

### 10.1 Types

| Type | Definition | Description |
|------|-----------|-------------|
| `Affine(T)` | `affine struct Affine(T) { data: T }` | Affine wrapper — the canonical way to give affine semantics to any value |
| `List(T)` | `enum List(T) { Cons(T, List(T)), Nil }` | Singly-linked list |
| `Option(T)` | `enum Option(T) { Some(T), None }` | Optional value |

`Pair(A, B)` is not defined — use tuples `(A, B)` instead. Tuples are built-in and serve the same purpose without a stdlib type.

### 10.2 Functions

| Function | Signature | Description |
|----------|-----------|-------------|
| `consume` | `fn(x: Affine(T)) -> T { x.data }` | Extract value from affine wrapper |
| `map` | `(T -> U, Array(T, N)) -> Array(U, N)` | Transform array elements |
| `map` | `(T -> U, List(T)) -> List(U)` | Transform list elements |
| `filter` | `(T -> Bool, List(T)) -> List(T)` | Keep elements matching predicate |
| `fold` | `(U, (U, T) -> U, List(T)) -> U` | Left fold over list |
| `foreach` | `(T -> Unit, List(T)) -> Unit` | Apply effectful function to each element |
| `array_to_list` | `Array(T, N) -> List(T)` | Convert array to list |

`map` and `filter` for `Array(T, N)` are specialized per `N` at compile time. `list_to_array` is not provided — `N` is not tracked in `List(T)`, making the reverse conversion dependent on compile-time size information the list does not carry (see [§9.2](#92-standard-library-functions)).

### 10.3 Design Principles

- Stdlib types and functions are **normal Dew source** — no special compiler support
- Users can read, modify, and reimplement stdlib functionality
- `import "stdlib/..."` loads stdlib modules
- `Affine(T)` and `consume` are the only stdlib items with special semantic meaning (the affine type system recognizes `Affine(T)` by its `affine struct` declaration, not by name)

---

## 11. Memory Management

- **Normal values**: stack-allocated, value semantics
- **Affine values**: compile-time determined drop points. Compiler auto-inserts `drop` calls for unconsumed affine values at end of scope. `drop` is a compiler-generated type-specialized function, not user-exposed.
- **No tracing GC**

---

## 12. Modules and Imports

`import` performs literal file inclusion — the imported file's content is textually inserted at the import site, like C++ `#include`. The compiler processes the result as a single translation unit.

```dew
import "stdlib/io.dew"
import "stdlib/list.dew"
```

- `import "path"` is replaced by the content of `path` before parsing
- Paths are relative to the file containing the `import` statement. `stdlib/` is relative to the compiler's standard library directory
- Name collisions between imports produce `[E007]`
- Top-level declarations only (`def`, `import`, `struct`, `enum`)
- **Only single-file compilation is supported.** The compiler operates on one entry-point `.dew` file and inlines all imports into it

> C++-style textual inclusion is intentionally simple. It avoids a module system, namespace management, and separate compilation — complexity that is not needed at this stage. When Dew grows beyond single-file programs, a proper module system can replace `import` without changing the language semantics.

---

## 13. (No) Error Handling

Dew has **no runtime error handling mechanism.** No `panic`, no `try`/`catch`, no exceptions. The language relies entirely on compile-time guarantees.

### Compile-Time Detection

- Type errors — caught by HM type checker
- Affine violations — use-after-consume, double-use
- Exhaustiveness — non-exhaustive `match` patterns
- Circular dependencies — simple self-references (`def x = x + 1`) caught at compile time; complex cycles detected at runtime by the evaluator's blackhole mechanism

### Runtime Behavior

If a program passes all compile-time checks, Dew assumes it is correct and runs without runtime safety nets:

| Failure Mode | Behavior |
|-------------|----------|
| Division by zero | OS kills process (SIGFPE) |
| Stack overflow (deep recursion) | OS kills process (SIGSEGV) |
| Integer overflow | Wraps (assembly-level behavior; no bounds check) |
| Array out-of-bounds (native target) | OS kills process (SIGSEGV); tree-walking evaluator rejects at IR level |
| Infinite recursion | Runs until stack exhausted; expected if not caught at compile time |

> Dew's philosophy: compile-time guarantees replace runtime checks. If the type checker says it's safe, the program should run without overhead. If the type checker missed a bug, the OS terminates the process — exit code may be non-zero. This is the same tradeoff Rust makes in release mode (no bounds checks, no overflow checks) but applied universally: Dew has **no debug/release distinction** for safety.

### Exit Codes

| Outcome | Exit Code |
|---------|-----------|
| `main` returns normally | `0` |
| OS kills process (SIGSEGV, SIGFPE, etc.) | OS-determined (typically non-zero) |
| Compiler error | `1` (process exits before evaluation) |

### Diagnostic Codes

All compiler diagnostics use bracketed codes. `[E###]` for errors (compilation stops), `[W###]` for warnings (compilation continues):

| Code | Category | Description |
|------|----------|-------------|
| `[E001]` | File/System | File not found, I/O error |
| `[E002]` | Parse | Syntax error |
| `[E003]` | Type | Type mismatch |
| `[E004]` | Affine | Use-after-consume, double use |
| `[E005]` | Exhaustiveness | Non-exhaustive match |
| `[E006]` | Effect | IO function in pure context, or pure annotation on IO body |
| `[E007]` | Name | Unbound variable, import conflict |
| `[W001]` | Shadow | Redefining `main` |
| `[W002]` | Shadow | Redefining standard library name |
| `[W003]` | Effect | `main` is pure (no IO) — compiles but produces no output |
| `[W004]` | Affine | Struct contains affine field but not declared `affine` |

---

## 14. Keywords and Built-ins

### Keywords

```
def, fn, struct, enum, match, if, else, fix,
import, true, false, Unit, affine,
type_match, typeof
```

### Type Modifiers

`affine` is a type modifier keyword, distinct from attributes. It precedes struct/enum declarations. Type-level only — `affine` does not appear on individual fields. Use `Affine(T)` wrapper in stdlib to make a field affine.

### Built-in Functions

```
force, not, stdin, stdout
```

### Reserved (Future)

```
for, while, strict, typeclass, instance, where
```

---

## 15. Out of Scope

- Float type
- Loop syntax (`for`/`while`)
- Mutable variables, `const` keyword
- Unit tuple, single-element tuple
- Type aliases, associated types
- Explicit lifetime annotations
- True reference types
- Tracing garbage collection
- Panic, exception handling (`try`/`catch`), runtime bounds checking
- Persistent (now library-level `Rc<T>`)
- Template metaprogramming (type-level recursion, `(H, ..R)` destructuring)

---

## 16. Phase Plan

| Phase | Content |
|-------|---------|
| **Phase 1** | Core language: HM inference, ADT, lazy evaluation, pipeline, primitive types, I/O |
| **Phase 2** | `affine` type modifier system, `&` borrow sugar |
| **Phase 3** | Array, List, higher-order functions, `fix`, `typeof` + `type_match` |
| **Phase 4** | Rx/C interop |
| **Phase 5** | File I/O, concurrency |
| **Phase 6** | Typeclass |
| **Future** | Loop sugar (`for`/`while`), `strict fn`, `BigInt` |

---

## 17. Core Design Principle

Any proposed feature must answer:

> **Does it break the coherence of Lazy + Affine + Closure?**

- Immutable values, ownership passing
- All borrows desugar into ownership passing
- Syntactic sugar does not change underlying semantics
- Type system maintains HM simplicity
- Operators and syntax remain minimal

---

*This document is the live specification. Updated continuously. Last update: 2026-06-15.*
