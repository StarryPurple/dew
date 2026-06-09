# Box and Resource Management

`Box(T)` is the language's linear resource type. It models allocation/deallocation and is the foundation for the affine type system and diagnostics.

## The Model

```
box(e)    — allocate a new box containing e
unbox(e)  — deallocate the box, extract the inner value
```

This is equivalent to:
- `malloc` / `free` in C
- `Box::new` / `*box` in Rust
- `new` / `dispose` in Pascal

The type system guarantees:
- Every box is `unbox`-ed **exactly once** (or reported as a leak)
- A box cannot be `unbox`-ed twice (compile-time error)
- A box cannot be silently discarded without `unbox`-ing (diagnostic warning)

## Correct Usage

```dew
def b = box(42);     # allocate
def n = unbox(b);    # deallocate, extract → 42
n + 1                # → 43
```

## Leak

```dew
def b = box(99);
0                    # b is never unboxed
```

The compiler accepts this but emits a diagnostic:

```json
{
  "affine": {
    "leaks": [
      {"var": "b", "reason": "affine resource defined but never consumed"}
    ]
  }
}
```

## Double Free

```dew
def b = box(42);
def _ = unbox(b);
unbox(b)             # ERROR: affine violation — b already consumed
```

This is a **compile-time error**:

```
Type error: affine violation: variable 'b' used more than once
```

## Nested Boxes

```dew
def outer = box(box(5));   # Box(Box(Int))
def inner = unbox(outer);   # Box(Int)
unbox(inner)                # → 5
```

Each level must be unboxed independently. The type system tracks each level separately.

## Box Captured in Closure (FnOnce)

```dew
def b = box(99);
def reader = fn (x: Int) { unbox(b) };   # FnOnce — captures Box(Int)
reader(0);                               # consumes reader + b → 99
```

The closure `reader` captures `b: Box(Int)`, making it affine (FnOnce). Calling it consumes the closure (and the box).

```dew
def b = box(7);
def reader = fn (x: Int) { unbox(b) };
reader(0) + reader(0)    # ERROR: affine violation — reader used twice
```
