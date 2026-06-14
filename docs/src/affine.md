# Affine Types

Dew's type system tracks **resource affinity** — how many times a value can be used. This enables compile-time guarantees about resource safety without a garbage collector.

## The Three Resource Kinds

Every type in Dew belongs to exactly one of three resource categories:

| Kind | Description | Examples | Rules |
|------|-------------|----------|-------|
| **Copyable** | Freely duplicable, stack-allocated | `Int`, `Bool`, `Char`, `Unit`, pure structs | Unlimited use |
| **Affine** | Used at most once, ownership transfers | `Affine(T)` | Single use, auto-dropped at scope end |
| **Persistent** | Reference-counted, shared access | `List(T)` | Multiple references, refcount-managed |

## The `Affine(T)` Wrapper

`Affine(T)` is a **zero-cost compile-time marker**. There is no heap allocation — it wraps any value (Copyable or already-affine) and marks it as tracked:

```dew
def x = Affine(42);      // x: Affine(Int) — the integer 42, now tracked
def y = Affine(true);    // y: Affine(Bool)
def z = Affine(Unit);    // z: Affine(Unit)
```

### Implicit Unwrap

When an `Affine(T)` value appears where `T` is expected, the compiler **automatically unwraps** it and consumes the wrapper. You rarely need to write `open` explicitly:

```dew
def x = Affine(42);
def y = x + 1;    // + expects Int, Int — x is implicitly unwrapped, consumed
// x is now dead — the Affine wrapper was consumed

def f = fn(a: Int) -> Int { a * 2 };
def z = Affine(10);
f(z)              // f expects Int — z is implicitly unwrapped, consumed
```

The implicit unwrap applies wherever the inner type is demanded:

| Context | Behavior |
|---------|----------|
| Arithmetic (`+`, `-`, `*`, `/`, `%`) | Unwraps `Affine(Int)` → `Int` |
| Comparison (`<`, `>`, `==`, etc.) | Unwraps `Affine(Int)` → `Int` |
| Function call matching parameter type | Unwraps if param expects inner type |
| Condition (`if`, `match` scrutinee) | Unwraps if needed |

### Explicit `open`

For cases where you want to explicitly consume the wrapper, use `open`:

```dew
def consume = fn(x: Affine(Int)) -> Int {
  open(x)   // explicit: consume the Affine wrapper, yield the inner Int
}

def a = Affine(42);
consume(a)   // a is consumed — transferred into the function, then opened
```

`open` fails at runtime if the value is not `Affine(T)`:

```dew
def x = 42;
open(x)    // runtime error: open: expected Affine value
```

### No Implicit Wrapping

The compiler **never** implicitly wraps a value in `Affine`. This must be explicit:

```dew
def f = fn(x: Affine(Int)) -> Int { open(x) }
def a = 42;
// f(a);         // ERROR: Int where Affine(Int) expected
f(Affine(a));     // OK: explicit opt-in to tracking
```

### Behavior Summary

| Have | Expected | Result |
|------|----------|--------|
| `T` | `T` | Copy — both alive |
| `Affine(T)` | `T` | **Implicit unwrap** — affine consumed, inner extracted |
| `Affine(T)` | `Affine(T)` | Ownership transfer — stays wrapped |
| `T` | `Affine(T)` | **Rejected** — must use `Affine(x)` explicitly |

## Computing Affinity

The affinity of a type is determined structurally:

### Primitives
```
Int, Bool, Char, Unit → Copyable
```

### Affine Wrapper
```
Affine(T) → Affine (regardless of T)
```

### Structs
```
All fields Copyable → Copyable
Any field Affine   → Affine
```

### Enums
```
Same as structs — all variants Copyable → Copyable; any Affine variant → Affine
```

### Tuples
```
Any element Affine → Affine
All elements Copyable → Copyable
```

### Closures
```
All captured values Copyable → Copyable (unrestricted Fn)
Any captured value Affine   → Affine (FnOnce — callable once)
```

### Arrays
```
Arrays are always Copyable (elements must be Copyable)
```

## Ownership Transfer

When an affine value is used, its ownership transfers. Using it again after transfer is a compile-time error:

```dew
def x = Affine(42);  // x owns the tracked integer
def y = x;            // ownership transfers from x to y
// def z = x;         // ERROR: x was already moved
```

### Function Arguments

Passing an affine value to a function transfers ownership:

```dew
def consume = fn(b: Affine(Int)) -> Int {
  // b is consumed here — auto-dropped at end of scope
  0
}

def x = Affine(42);
consume(x);    // x's ownership moves into the function
// x is now unavailable
```

## The Borrow Pattern (`&`)

To use a value without consuming it, Dew provides the **borrow sugar** `&`:

```dew
def translate = fn(&p: Point, dx: Int, dy: Int) -> Point {
  &p { x = p.x + dx, y = p.y + dy }
}
```

**How `&` desugars:**

The compiler transforms borrow parameters into ownership-passing that returns the value:

```
fn(&p: T, ...) -> U
  desugars to:
fn(p: T, ...) -> (T, U)
```

At the call site:
```
call f(&x, ...)
  desugars to:
def x = f(x, ...)
```

**Restrictions on `&`:**

- `&` only applies to function parameters
- `&` decorates the parameter **name** (`&p: Point`), not the type (`p: &Point`)
- Inside the function body, `&p = ...` or `&p { ... }` rebinds the parameter
- No explicit lifetime annotations — the compiler handles all scoping

## Closure Affinity Inference

Closures automatically derive their affinity from captured variables:

```dew
def x = 42;                        // x: Int (Copyable)
def f = fn() -> Int { x };         // captures Copyable → Copyable closure
f();                               // can call multiple times
f();                               // OK

def y = Affine(42);                // y: Affine(Int)
def g = fn() -> Int { open(y) };   // captures Affine → Affine closure (FnOnce)
g();                               // OK — first call
// g();                            // ERROR: closure already consumed
```

## Auto-Drop at Scope End

At the end of a scope, the compiler automatically inserts `drop` calls for any affine values that were not consumed. `drop` is a compiler-generated, type-specialized function — not exposed to users.

```dew
{
  def x = Affine(42);
  // x not explicitly consumed
  // compiler inserts: drop(x) at end of scope
}
```

This ensures no resource leaks.

## Affine Types and Laziness

Lazy evaluation interacts with affine types carefully:

- A thunk that captures an affine variable makes the thunk itself affine
- Forcing an affine thunk consumes it
- The compiler tracks thunk affinity to prevent double-forcing

## Future Affine Primitives

`Affine(T)` is the general-purpose wrapper. Future versions will add domain-specific affine primitives that use the same pattern under the hood:

```dew
Mutex(T)      // mutual exclusion — inherently affine
Channel(T)    // message passing — inherently affine
```

These are `Type::App(name, [T])` in the parser — no new syntax needed. Each registers itself as affine with the type checker. The `open` builtin, implicit unwrap, and ownership transfer rules apply uniformly.

## Memory Model

| Kind | Allocation | Deallocation |
|------|-----------|--------------|
| Copyable | Stack | Stack unwind |
| Affine | Determined by containing type | Compiler-inserted `drop` |
| Persistent | Heap, reference-counted | Last reference dropped → deallocation |

**No tracing garbage collection.** The combination of immutability and affine types guarantees no reference cycles, making reference counting sufficient.

## Design Notes

- **Phase 2** of implementation adds the full affine type system, `Affine(T)`, and `&` sugar
- **No explicit lifetime annotations** — lifetimes are always inferred
- **No `const`** — immutability is the default, and Copyable values are inherently constant-like
- **No `mut`** — there is no mutation at all, only rebinding via `def`

## Next

- [**Tooling**](tooling.md) — CLI, LSP, and development tools

