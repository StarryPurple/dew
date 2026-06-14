# IR Design

Dew compiles source code to a **Thunk Graph IR** — a flat, label-based intermediate representation designed for lazy evaluation. The IR has two layers: **graph nodes** (the computation graph) and **IR expressions** (the bodies within thunks).

## Architecture

```
Source → AST → IR Module → Evaluator
                   │
                   ▼
              Text emission (--emit=text)
```

An IR **Module** is an ordered list of `Node` values. Each node is either a thunk lifecycle operation or a name binding. Thunk bodies contain `Ir` expression trees.

## Labels

Thunks are identified by labels — opaque names like `%t0`, `%t1`, etc.:

```
%t0 = ThunkAlloc
Thunk %t0 { ... }
%t1 = Force %t0
Update %t0, %t1
Def "main" %t0
```

Labels are generated sequentially during compilation.

## Graph Nodes (7 variants)

### Lazy Definition Chain (5 nodes)

A pure `def` produces this sequence:

```
%t0 = ThunkAlloc          // 1. Allocate thunk cell (→ Suspended)
Thunk %t0 {               // 2. Define computation body
  ...
}
%t1 = Force %t0           // 3. Demand evaluation
Update %t0, %t1           // 4. Memoize result
Def "name" %t0            // 5. Bind name to thunk
```

| Node | Purpose | Evaluator Action |
|------|---------|-----------------|
| `ThunkAlloc { label }` | Allocate heap cell | Create `Suspended { body: None }` |
| `ThunkDef { label, body }` | Store computation body | Set `body = Some(ir)` in suspended thunk |
| `Force { label, target }` | Demand value | Transition thunk through 3-state FSM |
| `Update { label, value }` | Cache result | Set thunk state to `Evaluated(value)` |
| `Blackhole { label }` | Mark evaluating | Set state to `Evaluating` (cycle detection) |

### Name Binding (2 nodes)

| Node | Purpose |
|------|---------|
| `Def { name, label }` | Bind `name` to thunk's evaluated value |
| `StrictDef { name, value }` | Evaluate Ir directly, bind to `name` (no thunk) |

`StrictDef` is emitted for IO-containing definitions — see the [strict IO rule](laziness.md#strict-io-functions).

## IR Expressions (inside thunk bodies)

The `Ir` enum represents computation within thunk bodies and `StrictDef` values:

| Variant | Example | Description |
|---------|---------|-------------|
| `Lit(Lit)` | `Lit 42`, `Lit true` | Literal values |
| `Ref(Label)` | `Ref %t0` | Self-reference to own thunk (recursion) |
| `Var(String)` | `%x`, `%Stdin` | Variable reference |
| `Lambda { params, body }` | `Lambda [n] ...` | Function value |
| `Apply { func, args }` | `Apply %f [%x]` | Function application |
| `Let { name, value, body }` | `Let x = Lit 42 %x` | Let binding |
| `If { cond, then, else_ }` | `If %c Then ... Else ...` | Conditional |
| `Prim { op, args }` | `Prim add Lit 40 Lit 2` | Primitive operation |
| `Struct { name, fields }` | `Struct Point [%x, %y]` | Struct literal |
| `FieldAccess { expr, field }` | `FieldAccess %p .x` | Field access |
| `StructUpdate { expr, updates }` | (struct update) | Struct field update |
| `EnumVariant { ... }` | `EnumVariant Option::Some %v` | Enum constructor |
| `Match { scrutinee, arms }` | `Match %v [...]` | Pattern match |
| `Array(Vec<Ir>)` | `Array [Lit 'h', ...]` | Array literal |
| `ArrayAccess { expr, index }` | (array indexing) | Array element access |
| `ArrayUpdate { expr, index, value }` | (array update) | Array element update |
| `Tuple(Vec<Ir>)` | `Tuple [%a, %b]` | Tuple literal |
| `TupleUpdate { expr, index, value }` | (tuple update) | Tuple element update |
| `Return(Box<Ir>)` | `Return %v` | Early return |
| `Fix { name, body }` | `Fix loop ...` | Fixed-point recursion |

### Supporting Types

**Literals** (`Lit`): `Int(i64)`, `Bool(bool)`, `Char(char)`, `Unit`

**Primitive Operations** (`PrimOp`): `Add`, `Sub`, `Mul`, `Div`, `Rem`, `Lt`, `Gt`, `Le`, `Ge`, `Eq`, `Ne`, `And`, `Or`, `Not`

**Value References** (`ValueRef`): either a `Lit` (inline constant) or a `Label` (reference to another thunk's result). Used in `Update` nodes.

**Patterns** (`Pattern`): `Wildcard`, `Var(String)`, `Lit(Lit)`, `Struct(String, Vec<Pattern>)`, `EnumVariant(String, Option<Box<Pattern>>)`, `Tuple(Vec<Pattern>)`

## Compilation: AST → IR

Each `Decl` compiles to a sequence of `Node` values. Each `Expr` compiles to an `Ir` value.

### Def compilation

For a lazy def `def name = expr`:
1. `ThunkAlloc` — create label `%ti`
2. `compile_expr(expr)` → `Ir` body
3. `ThunkDef { %ti, body }` — store body in thunk
4. `Force { %tj, %ti }` — demand value
5. `Update { %ti, %tj }` — cache result
6. `Def { name, %ti }` — bind name

For a strict def (contains IO): `StrictDef { name, compile_expr(expr) }` — no thunking.

### Expression compilation

| AST Node | IR Output |
|----------|-----------|
| `Int(n)` / `Bool(b)` / `Char(c)` / `Unit` | `Ir::Lit(...)` |
| `Var(name)` | `Ir::Var(name)` or `Ir::Ref(label)` (if self-referential) |
| `Fn { params, body }` | `Ir::Lambda { params, body }` |
| `App { func, args }` | `Ir::Apply { func, args }` |
| `Let { name, value, body }` | `Ir::Let { name, value, body }` |
| `If { cond, then, else_ }` | `Ir::If { cond, then, else_ }` |
| `BinOp { op, left, right }` | `Ir::Prim { op, [left, right] }` |
| `Pipe { left, right }` | `Ir::Apply { func: right, args: [...args, left] }` |
| `Match { scrutinee, arms }` | `Ir::Match { scrutinee, arms }` |
| `StructCons { name, fields }` | `Ir::Apply { func: Var(name), args: fields }` |

### Recursion via Self-Reference

When compiling a `Var(name)` inside a `def` body where `name` matches the current definition, the compiler emits `Ir::Ref(label)` pointing to the def's own thunk label:

```
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}

// IR for "fact" inside the body: Ref %t_fact
```

This enables the evaluator's 3-state FSM to handle recursion through the thunk mechanism.

## Evaluation: The 3-State FSM

Each thunk cell transitions through three states:

```
                  Force
Suspended ─────────────────► Evaluating
    ▲                            │
    │                            │ evaluation complete
    │         Update             ▼
    └─────────────────────── Evaluated
                                │
                          Force │ (cache hit)
                                ▼
                         (return cached)
```

### State Machine Implementation

```rust
enum ThunkState {
    Suspended { body: Option<Ir> },   // Not yet evaluated
    Evaluating,                        // Evaluation in progress
    Evaluated(Value),                  // Result cached
}
```

### Cycle Detection

Forcing a thunk in `Evaluating` state raises an error:

```
cyclic dependency at %t0
```

## Text Format

The `--emit=text` flag prints the IR in a human-readable format using 2-space indent:

```
%t0 = ThunkAlloc
Thunk %t0 {
  Lambda [n]
  If Prim eq %n Lit 0
  Then Lit 1
  Else Prim mul %n Apply Ref %t0 [Prim sub %n Lit 1]
}
%t1 = Force %t0
Update %t0, %t1
Def "fact" %t0
```

### Conventions

- Labels: `%t0`, `%t1`, `%tn`
- Variables: `%name`
- Literals: `Lit 42`, `Lit true`, `Lit 'x'`, `Lit Unit`
- Primitives: `add`, `sub`, `mul`, `div`, `rem`, `lt`, `gt`, `le`, `ge`, `eq`, `ne`, `and`, `or`, `not`
- 2-space indent for nested expressions within `Thunk { ... }` and `StrictDef { ... }`

## StrictDef Optimization

Definitions containing IO calls skip the thunk mechanism entirely:

```dew
def greeting = Stdout("hello")     // IO → StrictDef
def x = 42                         // pure → Thunk chain
```

IR output:
```
StrictDef "greeting" {
  Apply %Stdout [Array [Lit 'h', ...]]
}
%t0 = ThunkAlloc
Thunk %t0 { Lit 42 }
%t1 = Force %t0
Update %t0, %t1
Def "x" %t0
```

The evaluator handles `StrictDef` by calling `eval_ir(value)` directly and inserting the result into the environment — no heap allocation, no FSM transitions.

## Next

- [**Laziness**](laziness.md) — the strictness analysis and evaluation semantics
- [**Tooling**](tooling.md) — using `--emit=text` to inspect IR
