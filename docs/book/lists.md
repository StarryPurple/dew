# Lazy Lists

`List(T)` is a lazy linked list type. Lists are **unrestricted** (freely copyable). The key design: `cons` tail is **lazy** — the tail is suspended as a thunk and only evaluated when `tail()` is called.

This enables **infinite lists**, the classic demonstration of lazy evaluation.

## List Operations

| Expression | Signature | Meaning |
|------------|-----------|---------|
| `nil` | `List(T)` | Empty list |
| `cons(e1, e2)` | `T -> List(T) -> List(T)` | Construct list: strict head, **lazy** tail |
| `head(e)` | `List(T) -> T` | Get head (strict — forces) |
| `tail(e)` | `List(T) -> List(T)` | Get tail (forces the lazy suspended tail) |
| `isnil(e)` | `List(T) -> Bool` | Test if empty |

## Basic Usage

```dew
def xs = cons(10, cons(20, cons(30, nil)));
head(xs)               # → 10
head(tail(xs))         # → 20
head(tail(tail(xs)))   # → 30
isnil(xs)              # → false
isnil(tail(tail(tail(xs))))  # → true
```

## Infinite Lists

The tail of `cons` is lazy. This means `cons(n, f(n+1))` creates a list cell where the rest of the list is deferred as a thunk.

```dew
# Infinite list of integers: [n, n+1, n+2, ...]
def from = fix f: Int -> List(Int) {
    fn (n: Int) { cons(n, f(n + 1)) }
};

def nums = from(0);              # [0, 1, 2, 3, ...]
head(nums)                       # → 0 (forces first cell)
head(tail(nums))                 # → 1 (forces second cell)
head(tail(tail(tail(nums))))     # → 3 (forces fourth cell)
```

**What's happening internally:**

1. `from(0)` expands to `cons(0, <thunk: from(1)>)` — only `0` is computed, `from(1)` is suspended
2. `tail(nums)` forces the thunk → `cons(1, <thunk: from(2)>)` — only `1` is computed
3. `tail(tail(nums))` forces → `cons(2, <thunk: from(3)>)`
4. And so on — each `tail` call forces exactly one more element

The key insight: **only the elements you access are ever evaluated**. The rest of the infinite list remains as unevaluated thunks, taking O(1) memory each (just the suspended expression + environment).

## Taking Nth Element

```dew
# Take first 4 elements from infinite list — evaluates to 0+1+2+3 = 6
def from = fix f: Int -> List(Int) {
    fn (n: Int) { cons(n, f(n + 1)) }
};
def nums = from(0);
def a = head(nums);
def b = head(tail(nums));
def c = head(tail(tail(nums)));
def d = head(tail(tail(tail(nums))));
a + b + c + d
```

Diagnostics for this program:

```json
{
  "thunks": {
    "total_created": 7,
    "total_forced": 10,
    "immediately_forced": 5,
    "never_forced": [/* elements beyond d remain suspended */],
    "forced_multiple_times": ["%t0", "%t1"]
  }
}
```

The thunks for `from(4)`, `from(5)`, etc. are never forced — they remain as unevaluated suspensions.

## List Affinity

Lists are **unrestricted** regardless of element type. A `List(Box(Int))` can be freely copied even though `Box(Int)` is affine. This is because lists are structural — copying a list doesn't duplicate the elements, it creates a new list with the same values.

```dew
# Lists are copyable even with affine elements
def xs = cons(box(1), nil);
def ys = xs;           # List is Normal — freely copyable
head(ys)
```

## Comparison with Box

| | `Box(T)` | `List(T)` |
|---|---|---|
| Affinity | Affine (must unbox once) | Unrestricted (freely copyable) |
| Purpose | Linear resource management | Structural data |
| Lazy | Box argument is strict | Cons tail is lazy |
