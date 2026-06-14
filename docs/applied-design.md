# Dew Applied Design — Post-Discussion Summary

This document records the design decisions made after reviewing the initial specification against implementation realities. It supersedes `initial-design.md` where they conflict.

---

## 1. Resource Kinds: Normal, Affine, Persistent

Three resource management **strategies**, not three data types:

| Kind | Semantics | C++ Analogue | Rule |
|------|-----------|-------------|------|
| **Normal** | Baseline — no special restriction | Plain value semantics | `y = x` does not consume `x` |
| **Affine** | At most one use | `std::move` | `y = x` consumes `x` |
| **Persistent** | Reference-counted immutable sharing | `shared_ptr<const T>` | `y = x` increments refcount |

**Key insight:** Normal is not "a third strategy." It is the absence of strategy — the default with no restrictions. Affine and Persistent are two orthogonal strategies applied on top.

### Orthogonality

Container type and resource kind are completely independent:

```
Affine(List(Int))   — an affine list (use once)
List(Affine(Int))   — a persistent list of affine elements
```

---

## 2. Affine Semantics

### The `Affine(T)` Wrapper

A zero-cost compile-time marker. No heap allocation.

```dew
def x = Affine(1)        // x: Affine(Int)
def y = x                // y owns it, x consumed
```

### `consume` — Explicit and Implicit

```dew
def x = Affine(1)
def y = consume(x)       // explicit: unwrap Affine, yield Int
def y = x + 1            // implicit: context expects Int, auto-unwrap
```

Implicit consume fires when context expects `T` but receives `Affine(T)`, and `T` itself is not `Affine(_)`. Only one layer is unwrapped.

### Auto-Drop

At scope end, the compiler inserts `drop` for unconsumed affine values. `drop` is generated, type-specialized, not user-exposed.

### Future Affine Primitives

`Affine(T)` is the general wrapper. Later phases add domain-specific primitives:

```dew
Mutex(T)      // inherently affine
Channel(T)    // inherently affine
File          // inherently affine (Phase 5)
```

All use `Type::App(name, [T])` — no new syntax.

---

## 3. Persistent Semantics

```dew
type List(T) = Cons(T, List(T)) | Nil

def xs = Cons(1, Cons(2, Nil))
def ys = xs              // shared — refcount incremented
def zs = xs { [0] = 10 } // "modification" creates new value
```

- Immutable `shared_ptr` — shared but never mutated
- Copy-on-Write by construction (immutability guarantees safety)
- Reference counting, no GC needed (no cycles due to immutability)

---

## 4. `def` Keyword

`def` is the sole binding keyword. It distinguishes new bindings from rebinding:

```dew
def x = 1              // new binding
def x = x + 1          // new binding, shadows old (not mutation)
```

---

## 5. `&` Borrow Sugar — Explicit Rebinding

### Parameter Syntax

```dew
def f = fn(&p: Point) -> Point { ... }
// & decorates the parameter NAME, not the type
// p: &Point  ← WRONG
// &p: Point  ← RIGHT
```

### Rebind Rule

Inside `&`-parameter scope, modifying the parameter requires `&`:

```dew
def f = fn(&p: Point) -> Point {
    &p = Point(10, 20)      // rebinds the parameter — affects caller
    &p { x = 10 }           // field update — affects caller
    &p = p { x = 10 }       // redundant but allowed
}
```

Without `&`, `=` creates a local binding:

```dew
def f = fn(&p: Point) -> Point {
    p = Point(10, 20)       // local binding, shadows parameter
    p                        // returns local, parameter unchanged
}
```

### Desugaring

```
fn(&p: T, ...) -> U      →    fn(p: T, ...) -> (T, U)
call f(&x, ...)          →    def x = f(x, ...)
```

### AST Nodes

```
Expr::Borrow { name, span }           // &x in param patterns
Expr::BorrowBind { name, value, span } // &x = expr in body
```

---

## 6. Desugaring Pipeline

All syntactic sugar expands before type checking:

```
Source → Parser → AST (with sugar nodes)
                 → Desugaring pass (pattern match + rewrite)
                 → Expanded AST
                 → Type Checker
                 → Strictness Analysis
                 → IR Gen
                 → Evaluator
```

The desugaring pass transforms AST → AST. The type checker and IR generator only see the expanded form. Syntax sugar has no runtime semantics.

---

## 7. Function Types: `->` Notation

```
Int -> Bool                      // single param
(Int, Bool) -> Char             // tuple param (multiple)
Int -> Bool -> Char             // curried: Int -> (Bool -> Char)
(Int -> Bool) -> Char           // HOF param
```

Right-associative. Legacy `fn(...) -> ...` keyword form preserved for backward compatibility.

---

## 8. `Unit` as a Keyword

```
Unit                            // value literal (like true/false)
def x: Unit = Unit
```

`()` is rejected everywhere. Use `Unit` for the type and the value.

---

## 9. `Int` is 64-bit

Fixed-size, stack-allocated, Normal. Big integers will be a separate `BigInt` type later.

---

## 10. Loop Sugar (Future)

`for`/`while` desugar to `fix` + `&` parameters. **Not in initial version.** Deferred to after Typeclass (Phase 6).

```dew
// Future syntax
for def i = 0; i < 10; i = i + 1 { &sum = sum + i }

// Expands to:
def sum = fix loop {
    fn(&i: Int, &sum: Int) -> Unit {
        if i < 10 { &sum = sum + i; &i = i + 1; loop(&i, &sum) }
    }
}(0, sum)
```

---

## 11. Phase Plan (Updated)

| Phase | Content |
|-------|---------|
| **Phase 1** | Core: HM, ADT, lazy evaluation, pipe, primitives, I/O |
| **Phase 2** | Affine, `consume`, `&` sugar |
| **Phase 3** | Array, List, higher-order functions, `fix`, `type_of` |
| **Phase 4** | Rx/C interop |
| **Phase 5** | File I/O, concurrency |
| **Phase 6** | Typeclass |
| **Future** | Loop sugar (`for`/`while`), `strict fn` |

---

## 12. Keywords and Builtins

### Keywords
```
def, fn, struct, enum, match, if, else, return, fix,
import, force, true, false, Unit
```

### Built-in Functions
```
force, not, type_of, Stdin, Stdout, consume, Affine
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
&           borrow parameter / rebind
!           force prefix
```

---

## 13. Out of Scope

- `Float`, `const`, `mut`, loop syntax, explicit lifetimes, tracing GC, panic system
- Single-element tuple, unit tuple, numeric tuple access
