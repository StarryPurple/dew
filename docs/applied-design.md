# Dew Applied Design — Post-Discussion Summary

This document records design decisions made after reviewing the initial specification against implementation realities. It supersedes `initial-design.md` where they conflict.

---

## 1. Resource Kinds: Normal and Affine

Two resource management strategies:

| Kind | Semantics | C++ Analogue | Rule |
|------|-----------|-------------|------|
| **Normal** | Baseline — no special restriction | Plain value semantics | `y = x` does not consume `x` |
| **Affine** | At most one use | `std::move` | `y = x` consumes `x` |

**Persistent is removed.** Immutable sharing (formerly "Persistent") is a library-level concern (`Rc<T>`-style), not a built-in resource kind. Affine is the only non-default strategy.

---

## 2. `#[Affine]` Attribute System

### Syntax

```dew
#[Affine]
struct Affine(T) { data: T }

#[Affine]
enum Option { Some(Int), None }
```

Attributes are Rust-style (`#[...]`) and placed before `struct` or `enum`.

### Currently supported

| Attribute | Meaning |
|-----------|---------|
| `#[Affine]` | Marks the type as affine. All uses are ownership-transferring. |

### Infectious rule

If a struct contains any `#[Affine]` field, the entire struct is affine:

```dew
struct Pair {
  x: Int,              // Normal
  #[Affine] y: Int,    // marks Pair as Affine
}
// Pair is now Affine — any field with #[Affine] infects the struct
```

### `Affine(T)` definition (stdlib)

```dew
#[Affine]
struct Affine(T) { data: T }
```

A single-field struct. `Affine(42)` constructs `Affine { data: 42 }`. Field access `x.data` on `#[Affine]` types consumes the struct.

### Field access consumes

```dew
def x = Affine(42);
def y = x.data;    // x is consumed — ownership transfers to y
// def z = x.data; // ERROR: x already consumed
```

Pattern matching on `#[Affine]` types also consumes:

```dew
match x {
  Affine(val) => val,  // x consumed, val = inner value
}
```

### `consume` as stdlib sugar

```dew
def consume = fn(x: Affine(T)) -> T { x.data }
```

No builtin needed — it's a standard library function.

---

## 3. `def` Keyword

`def` is the sole binding keyword. It distinguishes new bindings from rebinding:

```dew
def x = 1              // new binding
def x = x + 1          // new binding, shadows old (not mutation)
```

---

## 4. `&` Borrow Sugar — Explicit Rebinding

### Three forms

| Form | Context | Example |
|------|---------|---------|
| `&name` (bare) | Call site, pattern | `f(&p)` |
| `&name = expr;` | Block statement | `&p = Point(1,2);` |
| `&name { field = val };` | Block statement | `&p { x = 10 };` |

### Rebind rule

Inside `&`-parameter scope, rebinding requires `&`:

```dew
def f = fn(&p: Point) -> Point {
    &p = Point(10, 20)      // rebinds parameter
    &p { x = 10 }           // field update — rebinds parameter
}
```

Without `&`, `=` creates a local binding that shadows the parameter.

### Statement-level

`&p = expr;` and `&p { ... };` are block-level statements (like `def`), not expressions. They require a trailing semicolon.

---

## 5. Desugaring Pipeline

```
Source → Parser → AST (with sugar nodes)
                 → Desugaring pass (pattern match + rewrite)
                 → Expanded AST
                 → Type Checker
                 → Strictness Analysis
                 → IR Gen
                 → Evaluator
```

Syntax sugar has no runtime semantics — it's AST-to-AST transformation before type checking.

---

## 6. Function Types: `->` Notation

```
Int -> Bool                      // single param
(Int, Bool) -> Char             // tuple param (multiple)
Int -> Bool -> Char             // curried: Int -> (Bool -> Char)
(Int -> Bool) -> Char           // HOF param
```

Right-associative. Legacy `fn(...) -> ...` keyword form preserved for backward compatibility.

---

## 7. `Unit` as a Keyword

```
Unit                            // value literal (like true/false)
def x: Unit = Unit
```

`()` is rejected everywhere. Use `Unit` for the type and the value.

---

## 8. `Int` is 64-bit

Fixed-size, stack-allocated, Normal. Big integers will be a separate `BigInt` type later.

---

## 9. Loop Sugar (Future)

`for`/`while` desugar to `fix` + `&` parameters. **Not in initial version.** Deferred to after Typeclass (Phase 6).

---

## 10. Phase Plan

| Phase | Content |
|-------|---------|
| **Phase 1** | Core: HM, ADT, lazy evaluation, pipe, primitives, I/O |
| **Phase 2** | `#[Affine]` attribute system, `&` sugar |
| **Phase 3** | Array, List, higher-order functions, `fix`, `type_of` |
| **Phase 4** | Rx/C interop |
| **Phase 5** | File I/O, concurrency |
| **Phase 6** | Typeclass |
| **Future** | Loop sugar (`for`/`while`), `strict fn`, `BigInt` |

---

## 11. Keywords and Builtins

### Keywords
```
def, fn, struct, enum, match, if, else, return, fix,
import, force, true, false, Unit
```

### Attributes
```
#[Affine]
```

### Built-in Functions
```
force, not, type_of, Stdin, Stdout
```

### Operators
```
->  pipeline / function type
+ - * / %   arithmetic
< > <= >=   comparison
== !=       equality
&& ||       logical
.           field access
[]          subscript
{}          update
&           borrow parameter reference
!           force prefix
#           attribute prefix
```

---

## 12. Out of Scope

- `Float`, `const`, `mut`, loop syntax, explicit lifetimes, tracing GC, panic system
- `Persistent` as built-in (library-level `Rc<T>` instead)
- Single-element tuple, unit tuple, numeric tuple access
- `where` clauses (affinity is inferred, not declared)
