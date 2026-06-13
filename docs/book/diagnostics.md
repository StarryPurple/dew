# Diagnostics

Dew emits a structured JSON diagnostics report to stderr after evaluation. The report covers four categories.

## Error Codes

Every type error is prefixed with a stable code in the format `[D00N]`:

| Code | Error | Description |
|------|-------|-------------|
| `D001` | Affine double-use | An affine variable was used after consumption |
| `D002` | Unused affine resource | An affine value was allocated but never consumed |
| `D004` | Branch mismatch | Affine variable consumed in one branch but not the other |
| `D005` | Dup on affine | `dup y = x` where x is a FnOnce closure |
| `D006` | Type mismatch | Type error (mismatch, invalid operation, wrong condition type) |
| `D007` | Unbound variable | Variable referenced but never defined |
| `D008` | Invalid main | Missing, duplicate, or wrong-signature `main` function |

## Report Structure

```json
{
  "affine": { ... },
  "closures": { ... },
  "thunks": { ... },
  "captures": { ... }
}
```

## Affine Diagnostics

Tracks resource usage violations and leaks.

```json
{
  "affine": {
    "violations": [
      {"var": "b", "reason": "affine violation: double use"}
    ],
    "leaks": [
      {"var": "b", "reason": "affine resource defined but never consumed"}
    ]
  }
}
```

**Violations**: a variable was used more than once despite being affine.

**Leaks**: an affine variable was defined but never consumed (e.g., a `Box` never `unbox`-ed).

## Closure Classifications

Reports how each closure was classified (Fn vs FnOnce).

```json
{
  "closures": {
    "classes": [
      {
        "param": "x",
        "affinity": "FnOnce",
        "affine_captures": ["b: Box(Int)"]
      },
      {
        "param": "x",
        "affinity": "Fn",
        "affine_captures": []
      }
    ]
  }
}
```

Each closure gets an entry showing:
- `param`: the lambda's parameter name
- `affinity`: `"Fn"` (Normal) or `"FnOnce"` (affine)
- `affine_captures`: list of captured affine variables and their types

## Thunk Diagnostics

Runtime thunk statistics.

```json
{
  "thunks": {
    "total_created": 4,
    "total_forced": 5,
    "immediately_forced": 1,
    "never_forced": [],
    "forced_multiple_times": ["%t2"],
    "force_counts": { "%t0": 1, "%t1": 1, "%t2": 2, "%t3": 1 }
  }
}
```

| Field | Meaning |
|-------|---------|
| `total_created` | Number of thunks (suspend nodes) created |
| `total_forced` | Number of force operations |
| `immediately_forced` | Thunks forced in the same step they were created |
| `never_forced` | Thunks never forced — potential space leaks |
| `forced_multiple_times` | Thunks forced > 1 time (memoization prevented recomputation) |

## Closure Capture Diagnostics

Per-thunk capture statistics — helps diagnose "fat closures."

```json
{
  "captures": {
    "captures_per_thunk": { "%t0": 2, "%t1": 0 },
    "max_captures": 2,
    "total_captures": 2
  }
}
```

| Field | Meaning |
|-------|---------|
| `captures_per_thunk` | Number of captured variables per thunk |
| `max_captures` | Largest closure (potential memory concern) |
| `total_captures` | Total captured variables across all thunks |

## CLI Flags

```bash
dew file.dew                # JSON IR to stdout, diagnostics to stderr
dew file.dew --emit=text    # Pretty-printed text IR
dew file.dew --trace        # Step-by-step evaluation trace
```
