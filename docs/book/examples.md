# Examples

All examples live in `examples/`. Run with:

```bash
cargo run -- examples/<name>.dew
```

## Arithmetic

```dew
# → 7
(1 + 2) * 3 - 2
```

## Identity

```dew
# → 42. Pure closure → unrestricted (Fn)
def id = fn (x: Int) { x };
id(42)
```

## Conditional

```dew
# → 100
if (1 < 2) { 100 } else { 200 }
```

## Nested Lets

```dew
# → 30
def a = 10;
def b = a + 5;
def c = b * 2;
c
```

## Recursion

```dew
# → 120 (5!)
def fact = fix f: Int -> Int {
  fn (n: Int) {
    if (n < 2) { 1 } else { n * f(n - 1) }
  }
};
fact(5)
```

## Higher-Order

```dew
# → 49
def apply = fn (f: Int -> Int) { fn (x: Int) { f(x) } };
apply (fn (n: Int) { n * n }) (7)
```

## Box: Correct Usage

```dew
# → 43
def b = box(42);
def n = unbox(b);
n + 1
```

## Box: Leak

```dew
# → 0, diagnostics reports resource leak
def b = box(99);
0
```

## Box: Double Free

```dew
# Compile error: affine violation
def b = box(42);
def _ = unbox(b);
unbox(b)
```

## FnOnce via Capture

```dew
# → 99. Closure captures Box → affine (FnOnce)
def b = box(99);
def reader = fn (x: Int) { unbox(b) };
reader(0)
```

## FnOnce Error

```dew
# Compile error: affine violation — reader used twice
def b = box(7);
def reader = fn (x: Int) { unbox(b) };
reader(0) + reader(0)
```

## Pure Function Reuse

```dew
# → 5. Pure closure → unrestricted, freely reusable
def add_one = fn (x: Int) { x + 1 };
add_one(1) + add_one(2)
```

## Nested Boxes

```dew
# → 5
def outer = box(box(5));
def inner = unbox(outer);
unbox(inner)
```

## Duplicate Unrestricted Values

```dew
# → 6
def x = 3;
def y = dup(x);
x + y
```

## Basic List

```dew
# → 10
def xs = cons(10, nil);
head(xs)
```

## Multi-Element List

```dew
# → 20
def xs = cons(10, cons(20, cons(30, nil)));
head(tail(xs))
```

## Infinite List

```dew
# → 0. Only the first element is ever evaluated!
def from = fix f: Int -> List(Int) {
    fn (n: Int) { cons(n, f(n + 1)) }
};
def nums = from(0);
head(nums)
```

## Take From Infinite List

```dew
# → 6 (0+1+2+3). Only 4 elements are ever forced.
def from = fix f: Int -> List(Int) {
    fn (n: Int) { cons(n, f(n + 1)) }
};
def nums = from(0);
head(nums) +
head(tail(nums)) +
head(tail(tail(nums))) +
head(tail(tail(tail(nums))))
```
