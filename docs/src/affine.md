# Affine Types

Dew's type system tracks **resource affinity** — how many times a value can be used. This enables compile-time guarantees about resource safety without a garbage collector.

## The Two Resource Kinds

Every type in Dew belongs to one of two resource categories:

| Kind | Description | Examples | Rules |
|------|-------------|----------|-------|
| **Normal** | Baseline — no restriction | `Int`, `Bool`, `Char`, `Unit`, pure structs | Unlimited use |
| **Affine** | Used at most once, ownership transfers | `Affine(T)`, `#[Affine]` structs | Single use, auto-dropped at scope end |

## `#[Affine]` Attribute System

Affinity is controlled by attributes, not type wrappers:

```dew
#[Affine]
struct Affine(T) { data: T }

#[Affine]
enum Option { Some(Int), None }
```

The `#[Affine]` attribute marks a type as affine. Currently only `#[Affine]` is supported. Future attributes may include `#[strict]`, `#[inline]`, etc.

### Infectious Rule

If a struct contains any `#[Affine]` field, the entire struct becomes affine:

```dew
struct Pair {
  x: Int,              // Normal
  #[Affine] y: Int,    // this field makes Pair Affine
}
// Pair is now Affine — infectious from any #[Affine] field
```

### `Affine(T)` is a Standard Library Struct

```dew
#[Affine]
struct Affine(T) { data: T }
```

It's an ordinary single-field struct with the `#[Affine]` attribute. No special runtime variant — `Affine(42)` is just `Value::Struct { name: "Affine", fields: [42] }`.

### Field Access Consumes

Field access on `#[Affine]` types consumes the struct:

```dew
def x = Affine(42);
def y = x.data;    // x is consumed — ownership transfers to y
// def z = x.data; // ERROR: x is already consumed
```

Pattern matching also consumes:

```dew
match x {
  Affine(val) => val,  // x consumed, val = 42
}
```

### `consume` as a Standard Library Function

```dew
def consume = fn(x: Affine(T)) -> T { x.data }
```

No builtin required — just field access sugar.

### No Implicit Wrapping

The compiler **never** implicitly wraps a value in `Affine`. This must be explicit:

```dew
def f = fn(x: Affine(Int)) -> Int { x.data }
def a = 42;
// f(a);         // ERROR: Int where Affine(Int) expected
f(Affine(a));     // OK: explicit opt-in to tracking
```

### Behavior Summary

| Have | Expected | Result |
|------|----------|--------|
| `T` | `T` | Copy — both alive |
| `Affine(T)` | `T` | **Field access consumes** — `x.data` extracts inner, wrapper consumed |
| `Affine(T)` | `Affine(T)` | Ownership transfer — stays wrapped |
| `T` | `Affine(T)` | **Rejected** — must use `Affine(x)` explicitly |

## Computing Affinity

The affinity of a type is determined structurally:

### Primitives
```
Int, Bool, Char, Unit → Normal
```

### `#[Affine]` Attribute
```
#[Affine] struct/enum → Affine
Any struct with a #[Affine] field → Affine (infectious)
```

### Structs
```
No #[Affine] fields → Normal
Any #[Affine] field → Affine (infectious)
```

### Enums
```
Same as structs — no #[Affine] variant → Normal; any #[Affine] variant → Affine
```

### Tuples
```
Any element Affine → Affine
All elements Normal → Normal
```

### Closures
```
All captured values Normal → Normal (unrestricted Fn)
Any captured value Affine   → Affine (FnOnce — callable once)
```

### Arrays
```
Arrays are always Normal (elements must be Normal)
```

## Ownership Transfer

When an affine value is used, its ownership transfers. Use `.data` to access the inner value:

```dew
def x = Affine(42);  // x owns the tracked integer
def y = x;            // ownership transfers from x to y
// def z = x;         // ERROR: x was already moved
```

### Function Arguments

Passing an affine value to a function transfers ownership:

```dew
def consume = fn(b: Affine(Int)) -> Int {
  b.data  // field access consumes b
}

def x = Affine(42);
x.data;    // x's ownership moves into the function
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
def x = 42;                        // x: Int (Normal)
def f = fn() -> Int { x };         // captures Normal → Normal closure
f();                               // can call multiple times
f();                               // OK

def y = Affine(42);                // y: Affine(Int)
def g = fn() -> Int { y.data };   // captures Affine → Affine closure (FnOnce)
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

These are `#[Affine]` structs in the standard library — no new syntax or runtime needed. Field access (`.data`), ownership transfer, and the `#[Affine]` infectious rule apply uniformly.

## Memory Model

| Kind | Allocation | Deallocation |
|------|-----------|--------------|
| Normal | Stack | Stack unwind |
| Affine | Determined by containing type | Compiler-inserted `drop` |

**No tracing garbage collection.** The combination of immutability and affine types guarantees no reference cycles, making reference counting sufficient.

## Design Notes

- **Phase 2** of implementation adds the full affine type system, `Affine(T)`, and `&` sugar
- **No explicit lifetime annotations** — lifetimes are always inferred
- **No `const`** — immutability is the default, and Normal values are inherently constant-like
- **No `mut`** — there is no mutation at all, only rebinding via `def`

## Next

- [**Tooling**](tooling.md) — CLI, LSP, and development tools

