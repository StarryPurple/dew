# Laziness

Dew evaluates expressions **lazily by default**. The compiler automatically determines which expressions need immediate evaluation and which can be suspended. This chapter explains the mechanism.

## Implicit Lazy Evaluation

In Dew, you never write `lazy` or `force` in normal code. The compiler inserts these operations automatically:

```dew
def expensive = heavy_computation();  // SUSPENDED — not evaluated here
expensive + 1                          // FORCED — evaluated when needed
```

### Why Lazy?

- **Efficiency**: unused computations are never evaluated
- **Composability**: infinite data structures are possible (with lazy tails)
- **Recursion**: enables self-referential thunks for recursive bindings

## Strictness Analysis

The compiler performs a pass over the AST (see `strictness.rs`) to classify every expression context as **Strict** or **Lazy**:

```rust,ignore
enum Strictness {
    Strict,  // value must be computed now
    Lazy,    // value can be delayed
}
```

### Classification Rules

| Expression | Context | Why |
|------------|---------|-----|
| **Literals** (`Int`, `Bool`, `Char`, `Unit`) | Ambient | Already in WHNF — no further work needed |
| **Variables** | Ambient | Pass through context |
| **Function body** | **Lazy** | Only produces a closure value; body evaluated on each call |
| **Application** | **Strict** | Need the function value to call it; arguments are Lazy |
| **Let binding** | **Lazy** for value | Bound value can be deferred until used |
| **If condition** | **Strict** | Must know which branch to take |
| **Force** | **Strict** | Explicit demand for evaluation |
| **Return** | **Strict** | Return value must be computed before exiting |
| **Block statements** | **Lazy** | Discarded values need not be computed |

### Example Analysis

For `def main = fn -> Int { 40 + 2 }`:

```
fn -> Int { 40 + 2 }
  body = 40 + 2     → Lazy (function body)
    left = 40        → Strict (binary op operand)
    right = 2        → Strict (binary op operand)
    result = add     → strictness of BinOp follows parent
```

## The Thunk Graph IR

Lazy evaluation is implemented through the **Thunk Graph IR** — a flat, label-based representation with six primitive operations:

| Node | Purpose |
|------|---------|
| `ThunkAlloc` | Allocate a thunk cell on the heap (initial state: Suspended) |
| `ThunkDef` | Define the computation body for a thunk |
| `Force` | Demand evaluation of a thunk |
| `Update` | Memoize the result back into the thunk |
| `Blackhole` | Mark a thunk as Evaluating (for cycle detection) |
| `Def` | Bind a top-level name to a thunk |

### The 3-State FSM

Each thunk cell transitions through three states during its lifetime:

```
                  Force
Suspended ─────────────────► Evaluating
    ▲                            │
    │                            │ evaluation complete
    │         Update             ▼
    └─────────────────────── Evaluated
                                │
                          Force │ hit
                                ▼
                         (return cached)
```

1. **Suspended**: Thunk exists but has not been evaluated. Holds the unevaluated IR body.
2. **Evaluating**: Evaluation is in progress. If another `Force` arrives, a **cycle** is detected and an error is raised.
3. **Evaluated**: Result is cached. All subsequent `Force` operations return the cached value (memoization).

### Cycle Detection

If a thunk in `Evaluating` state is forced again, the evaluator raises an error:

```
cyclic dependency at %t0
```

This prevents infinite loops from diverging silently and catches genuine programming errors like `def x = x`.

### Example: IR for `def x = 40 + 2`

```
%t0 = ThunkAlloc
Thunk %t0 {
  Prim add Lit 40 Lit 2
}
%t1 = Force %t0
Update %t0, %t1
Def "x" %t0
```

The sequence is:
1. Allocate thunk `%t0` (Suspended)
2. Define its body as `add(40, 2)`
3. Force `%t0` → transition to Evaluating → compute result → transition to Evaluated
4. Update `%t0` with the result (memoize)
5. Bind the name `x` to `%t0`

## Explicit Force

While normally implicit, you can explicitly force evaluation with the `force` keyword or `!` prefix operator:

```dew
force(expr)   // built-in function form
!expr         // prefix operator form
```

These are equivalent and force strict evaluation of `expr`. Use `force` when you need to ensure evaluation at a specific point (e.g., to trigger side effects at a known time).

## Recursion Through Thunks

Recursive definitions work by self-referential thunks. Inside a `def` body, when the compiler sees a variable reference that matches the current definition name, it emits `Ir::Ref(label)` pointing to the thunk's own label:

```dew
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}
```

The reference to `fact` inside its own body becomes a `Ref(%t_fact)` — a self-referential thunk edge. This allows the evaluator's 3-state FSM to handle recursion without explicit fixed-point combinators.

For anonymous recursion, use the `fix` keyword:

```dew
fix loop {
  fn(x: Int) -> Int {
    if x < 10 { loop(x + 1) } else { x }
  }
}
```

## Memoization

Once a thunk is evaluated, its result is memoized. All subsequent `Force` operations return the cached value without re-executing the body. This is the key property that makes lazy evaluation efficient: each computation is performed at most once.

## Compilation Strategy

The IR generator (`ir_gen.rs`) consults strictness analysis when compiling each expression:

```rust,ignore
fn compile_expr_ctx(&mut self, expr: &Expr, ctx: Strictness) -> Ir {
    let inner = self.compile_expr_inner(expr);
    match ctx {
        Strictness::Strict => inner,      // no wrapping needed
        Strictness::Lazy => inner,        // body itself is lazy
    }
}
```

Currently, both `Strict` and `Lazy` contexts produce the same IR — the distinction is structural (later passes may insert explicit Suspend/Force nodes).

## Design Notes (from `initial-design.md`)

- **Tail-call optimization** is planned for recursive functions
- **Infinite lists** are possible when the tail is lazy — caught at compile time by circular dependency detection
- No tracing GC — memory for evaluated thunks is reclaimed when no longer referenced

## Next

- [**Input/Output**](io.md) — I/O via Stdin, Stdout, and the pipe operator
