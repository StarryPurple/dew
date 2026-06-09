# Lazy Evaluation

Dew is **implicitly lazy**. The programmer does not write `lazy` or `force` — the compiler inserts them automatically through strictness analysis.

## How It Works

1. **Strictness analysis** classifies every expression position as either *strict* (needs a concrete value) or *lazy* (can be deferred).
2. When a lazy expression appears in a strict position → the compiler inserts **`force`**.
3. When a strict expression appears in a lazy position → the compiler inserts **`suspend`** (creating a thunk).

## Strict vs. Lazy Positions

| Position | Classification |
|----------|:---:|
| `if` condition | Strict |
| `if` branches | Lazy |
| Binary operator operands | Strict |
| `dup` argument | Strict |
| `unbox` argument | Strict |
| `box` argument | Strict |
| Function argument | Lazy |
| Function body | Lazy |
| `let` body | Lazy |
| `fix` body | Lazy |

## Example: Implicit Thunking

Source:
```dew
def x = 1 + 2;
x * 3
```

IR (simplified):
```
def x = suspend { 1 + 2 }   -- 1+2 is strict, but def body is lazy → suspend
in force(x) * 3              -- x is lazy, * needs strict → force
```

The thunk `1 + 2` is only computed when `x` is forced by the `*` operator.

## Thunk Runtime

- **Creation** (`suspend`): stores the expression + captured environment, returns a thunk reference
- **Force**: if unevaluated, evaluates the expression and **memoizes** the result; subsequent forces return the cached value
- **Circular dependency detection**: forcing a thunk that is already being evaluated errors out

## Diagnostics

The diagnostics report provides visibility into the lazy runtime:

```json
{
  "thunks": {
    "total_created": 4,
    "total_forced": 4,
    "immediately_forced": 1,
    "never_forced": [],
    "forced_multiple_times": ["%t2"]
  }
}
```

- **immediately_forced**: thunk created and forced in the same evaluation step — suggests the suspension was unnecessary
- **never_forced**: thunk created but never evaluated — potential space leak
- **forced_multiple_times**: thunk forced > 1 time — the memoization prevented recomputation, but the thunk was shared
