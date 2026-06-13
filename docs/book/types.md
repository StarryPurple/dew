# Type System

## Types

| Type | Kind | Copyable? | Description |
|------|------|:---:|-------------|
| `Int` | Value | Yes | 64-bit signed integer |
| `Bool` | Value | Yes | Boolean |
| `()` | Value | Yes | Unit / void |
| `Box(T)` | Resource | **No** | Linear box — must be `unbox`-ed exactly once |
| `T -> U` | Function | *Inferred* | Function from T to U |

## Affinity

**Normal** values can be used freely any number of times (the default).

**Affine** values must be used **at most once**. Using an affine value consumes it; using it again is a compile-time error.

### Which Types Are Affine?

- `Box(T)` is always affine — it represents a linear allocation
- `T -> U` is affine **if and only if** the closure captures at least one affine variable
- Pure closures (no affine captures) are Normal
- `Int`, `Bool`, `()` are always Normal

### Closure Affinity Inference

```dew
// Pure closure — no captures → Normal (Fn)
def add_one = fn (x: Int) { x + 1 };
add_one(1) + add_one(2)   // fine

// Closure captures Box → affine (FnOnce)
def b = box(99);
def reader = fn (x: Int) { unbox(b) };   // captures b: Box(Int)
reader(0);                               // ok, consumes reader

// reader(0);  // ERROR [D001]: affine violation — reader already consumed
```

This is Rust's `Fn`/`FnOnce` rule: a closure is `FnOnce` if it moves any affine resource into itself.

## `dup`

`dup y = x;` duplicates a **Normal** value. It is a compile-time error to `dup` an affine value.

```dew
def x = 3;
dup y = x;    # ok — Int is Normal
x + y         # → 6

# def b = box(42);
# dup c = b;  # ERROR [D005]: cannot dup Box(Int) — it's affine
```

## `fix`

`fix f: T { e }` defines a recursive binding. `f` is **always Normal** within `e` — this is necessary for recursion to be useful.

```dew
def fact = fix f: Int -> Int {
    fn (n: Int) {
        if (n < 2) { 1 } else { n * f(n - 1) }
    }
};
fact(5)   # → 120
```

## Type Annotations

Function parameters are explicitly typed. The compiler infers return types and closure affinity. No type inference for variables — types are always determined from context.

```dew
fn (x: Int) { x + 1 }           // Int -> Int (Normal)
fn (x: Box(Int)) { unbox(x) }   // Box(Int) -> Int (Normal — no captures)
```
