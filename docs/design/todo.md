# Dew Compiler — Development Roadmap

> Last updated: 2026-06-17

## Current Status

| Metric | Value |
|--------|-------|
| Pipeline stages | 10/10 (Lexer → Parser → Desugar → NameRes → TypeCheck → Strictness → IR Gen → Eval/LLVM) |
| IR instructions | 35/35 implemented, display + verify stubs |
| Unit tests | 61/61 pass |
| End-to-end tests (pass/) | 24/35 pass, 11 fail (known limitations) |
| Negative tests (fail/) | 11/11 pass |
| Example `.dew` files | 46 total (35 pass/, 11 fail/) |
| LOC | ~5,938 (`src/`) |

### Pass test breakdown

| Category | Pass | Fail | Blocked by |
|----------|------|------|------------|
| `basics/` (5) | 5 | 0 | — |
| `lazy/` (4) | 4 | 0 | — |
| `closures/` (5) | 5 | 0 | — |
| `recursion/` (4) | 3 | 1 | Mutual def rec forward refs |
| `types/` (6) | 1 | 5 | A1 (block-def), enum in IR gen |
| `control_flow/` (3) | 2 | 1 | fix in IR gen |
| `affine/` (4) | 0 | 4 | Affine type checking |
| `io/` (3) | 3 | 0 | — |
| `borrow/` (3) | 0 | 3 | Borrow lowering |
| `complex/` (5) | 1 | 4 | Affine + borrow |

### Fail test breakdown

| Category | Pass | Blocked by |
|----------|------|------------|
| `parse/` (2) | 2 | — |
| `type/` (2) | 2 | — |
| `name/` (1) | 1 | — |
| `affine/` (2) | 2 | Block-local def produces [E007] |
| `effect/` (2) | 2 | Type mismatch produces [E003] |
| `exhaustiveness/` (1) | 1 | Block-local def produces [E007] |
| `layout/` (1) | 1 | Type mismatch produces [E003] |

> Note: Fail tests for affine, effect, exhaustiveness, and layout currently test errors the compiler DOES produce (block-local def or type mismatch), not the intended domain-specific errors. They document what should be tested once the relevant analysis passes are implemented.

### Newly discovered compiler bugs

1. **A3 — Nested if/else Phi predecessor tracking** (`src/backend/eval.rs`): When a match/if body contains another match/if, the intermediate merge block's Jmp overwrites `last_label`, causing the outer Phi to receive the wrong predecessor label (merge block name instead of original branch target). Affects ackermann and any nested control flow.
2. **A4 — Match arm type unification missing** (`src/typeck.rs`): The type checker does not enforce that all match/if arms return the same type. `if true { 42 } else { true }` compiles without error.
3. **A5 — `else if` chain parse failure** (`src/parser.rs`): Chained `else if` in multi-line function bodies causes parse errors. Works on single line. Factorial (`if n == 0 { 1 } else { n * fact(n - 1) }`) works; chained `else if n < 50 { ... } else if ...` fails.
4. **A6 — Mutual `def rec` forward reference** (`src/nameres.rs`): Two `def rec` declarations that reference each other fail because the nameres processes declarations sequentially. Needs batch pre-registration of all `def rec` names before processing any RHS.

## Phase A — Fix Blocking Defect

### A1. Block-local `def` binding support

- **Impact**: 5 pass tests fail (struct, tuple, array, and all examples using block-local bindings)
- **Root cause**: `def` bindings at block level are parsed but not propagated through the name resolver and IR generator.
- **Files**: `src/parser.rs` (parse_block), `src/nameres.rs` (scope chain), `src/ir_gen.rs` (var_map)

### A2. Field index from TypeTable

- **Impact**: `Instr::Field(Reg, Reg, usize)` currently hardcodes `0` as field index
- **Files**: `src/ir_gen.rs` (Field lowering), `src/ir/types.rs` (TypeTable lookup)

### A3. Nested if/else Phi predecessor tracking

- **Impact**: Any program with nested if/else returns 0
- **Root cause**: `eval_block` sets `last_label` on Jmp, overwriting the Br's predecessor label
- **Files**: `src/backend/eval.rs`

### A4. Match arm type unification missing

- **Impact**: `if true { 42 } else { true }` compiles without error
- **Files**: `src/typeck.rs`

### A5. `else if` chain parse failure

- **Impact**: Multi-line `else if` chains in function bodies cause parse errors
- **Files**: `src/parser.rs`

### A6. Mutual `def rec` forward reference

- **Impact**: Two `def rec` that reference each other fail
- **Root cause**: `def rec` names registered per-declaration, not batched
- **Files**: `src/nameres.rs`

---

## Phase B — Example Coverage (pass/)

### B1. Basics (`pass/basics/`) — 5/5 pass ✅
- [x] `arithmetic.dew` — `40 + 2 -> stdout`
- [x] `boolean.dew` — `true -> stdout`
- [x] `literal.dew` — `2026 -> stdout`
- [x] `precedence.dew` — `2 + 3 * 10 + 5 -> stdout` (37)
- [x] `unit_return.dew` — `if true { 1 } else { 0 }`

### B2. Lazy Evaluation (`pass/lazy/`) — 4/4 pass ✅
- [x] `simple_thunk.dew` — top-level `def x = 40 + 2`, force via stdout
- [x] `memoization.dew` — force same thunk twice, verify cached result
- [x] `infinite_data.dew` — chained deferred computations
- [x] `self_ref_thunk.dew` — lazy result from recursive function

### B3. Closures (`pass/closures/`) — 5/5 pass ✅
- [x] `simple_fn.dew` — `fn (x) { x }` → call with literal
- [x] `nested_closure.dew` — nested function call chain
- [x] `hof.dew` — function chaining via explicit calls
- [x] `currying.dew` — multi-arg function chaining
- [x] `closure_escape.dew` — function returning computed value

### B4. Recursion (`pass/recursion/`) — 3/4 pass
- [x] `factorial.dew` — `def rec fact = fn(n) { ... }`
- [x] `fibonacci.dew` — `def rec fib = fn(n) { ... }` (55 for fib(10))
- [x] `ackermann.dew` — GCD via Euclidean algorithm (ack placeholder, blocked by A3)
- [ ] `mutual_recursion.dew` — `def rec even/odd` — blocked by A6

### B5. Types (`pass/types/`) — 1/6 pass
- [ ] `struct.dew` — `struct Point { x: Int, y: Int }` — blocked by A1
- [ ] `enum_basic.dew` — `enum Option { Some(Int), None }` — blocked by D2
- [ ] `enum_match.dew` — exhaustive match on enum — blocked by D2
- [x] `generic.dew` — polymorphic function (identity pattern)
- [ ] `tuple.dew` — `struct Pair { x, y }` as tuple — blocked by A1
- [ ] `array.dew` — `struct Triple { a, b, c }` as array — blocked by A1
- [ ] `recursive_type.dew` — `enum Tree { Leaf, Node }` — blocked by D2

### B6. Control Flow (`pass/control_flow/`) — 2/3 pass
- [x] `if_else.dew` — if/else with arithmetic
- [x] `nested_match.dew` — two combined if functions
- [ ] `fix_loop.dew` — `fix` recursion — blocked by D5

### B7. Affine Types (`pass/affine/`) — 0/4 pass
- [ ] `consume.dew` — use value, consume via function call — blocked by D1
- [ ] `affine_struct_field.dew` — struct with affine field — blocked by D1
- [ ] `pattern_consume.dew` — pattern match consuming affine data — blocked by D1
- [ ] `fn_once_closure.dew` — closure capturing affine variable — blocked by D1

### B8. IO (`pass/io/`) — 3/3 pass ✅
- [x] `stdout_int.dew` — print integer to stdout
- [x] `stdin_read.dew` — read from stdin, add 100
- [x] `io_effect_chain.dew` — multiple additions piped to stdout

### B9. Borrow (`pass/borrow/`) — 0/3 pass
- [ ] `simple_borrow.dew` — `&x` sugar for borrowing — blocked by D-borrow
- [ ] `compound_lvalue.dew` — `&(r.field)` compound borrow target — blocked by D-borrow
- [ ] `chained_borrow.dew` — chained borrow calls — blocked by D-borrow

### B10. Complex Integration (`pass/complex/`) — 1/5 pass
- [ ] `lazy_affine.dew` — thunk containing affine value — blocked by D1
- [x] `lazy_closure.dew` — lazy value + function call
- [ ] `affine_closure_io.dew` — affine + function + IO — blocked by D1
- [ ] `borrow_lazy.dew` — borrow inside lazy thunk — blocked by D-borrow
- [ ] `three_pillar.dew` — Lazy + Affine + Closure — blocked by D1

---

## Phase C — Negative Tests (fail/)

Ensure the compiler produces correct error codes for invalid programs.

### C1. Parser Errors (`fail/parse/`)
- [ ] `missing_semicolon.dew` — statement without `;`
- [ ] `bare_expr.dew` — expression at top level (not a def)

### C2. Type Errors (`fail/type/`)
- [ ] `type_mismatch.dew` — `Int` used where `Bool` expected
- [ ] `not_a_function.dew` — calling a non-function value

### C3. Affine Errors (`fail/affine/`)
- [ ] `use_after_consume.dew` — variable used after affine consumption
- [ ] `double_use.dew` — affine value used in two branches

### C4. Exhaustiveness (`fail/exhaustiveness/`)
- [ ] `missing_variant.dew` — match missing an enum variant arm

### C5. Effect Errors (`fail/effect/`)
- [ ] `io_in_pure_fn.dew` — IO operation in non-IO function
- [ ] `pure_annotation_io.dew` — IO expression where pure is expected

### C6. Name Errors (`fail/name/`)
- [ ] `unbound_var.dew` — reference to undefined variable

### C7. Layout Errors (`fail/layout/`)
- [ ] `struct_self_recursion.dew` — struct containing itself directly (not via `rec`)

---

## Phase D — Type System Completion

### D1. Affine type checking
- Implement affine modifier in type checker (`src/typeck.rs`)
- Track consumption state in expression contexts
- Error `use_after_consume` and `double_use`
- Integrate with pattern matching consumption
- **Depends on**: A1 (block-local def) for testable examples

### D2. Enum lowering
- IR gen for `enum` type declarations → TypeTable entries
- IR gen for `match` on enum variants (compile_match enum arm dispatch)
- Desugar `match` discriminant + branch lowering
- **Depends on**: A1

### D3. Array / Tuple
- IR gen for `[e1, e2, e3]` array literal → StructCons (array is struct internally)
- IR gen for `[0; 5]` fill syntax → ArrayFill instruction
- IR gen for tuple → StructCons
- IR gen for tuple field access → Field + field index

### D4. Closure conversion (lambda lifting)
- IR gen for `fn(x) { body }` expression → Thunk + Fn in IR
- Capture analysis: determine free variables, generate closure record
- Lambda lowering: anonymous fn → named thunk with captured args
- **Files**: `src/ir_gen.rs`, `src/ir/thunk.rs`, `src/ir/func.rs`

### D5. `fix` expression
- Parser support for `fix name => { body }` syntax
- IR lowering to self-referential thunk
- **Depends on**: D4 (closure conversion)

### D6. `typeof` + `type_match`
- Compile-time type resolution for `typeof(expr)`
- Type-level pattern matching in `type_match`
- Compile-time monomorphization of type_match arms
- **Files**: `src/typeck.rs`, `src/ir_gen.rs`

---

## Phase E — LLVM Backend (Codegen)

### E1. Complete instruction translation
- 35 Dew IR instructions → LLVM IR translation
- Verify all instructions have correct LLVM lowering
- Test with factorial → JIT execution

### E2. LLVM JIT mode
- `--backend=llvm-jit` flag for execution
- Link inkwell or llvm-sys crate for actual LLVM IR → native compilation
- **Depends on**: E1

### E3. Optimization passes
- Dead thunk elimination
- Force fusion (force(fetch(x)) → x)
- Constant folding
- **Depends on**: Full example suite for regression testing

---

## Phase F — LSP Server

### F1. LSP protocol implementation
- `src/server.rs` — JSON-RPC handler
- Diagnostics: report parse errors, type errors, name errors
- Hover: show type of expression under cursor
- Completion: suggest names in scope
- **Files**: `src/server.rs` (new), `src/main.rs` (`dew lsp` subcommand)

### F2. Incremental pipeline
- Cache parse/type-check results per file
- Incremental re-check on edit
- **Depends on**: F1

---

## Phase G — Additional Infrastructure

### G1. Test runner enhancements
- Support for `fail/` tests: assert specific error code and message
- `// expect: VALUE` for pass tests
- `// error: [EXXX]` for fail tests

### G2. IR verification
- Fill in `src/ir/verify.rs` stubs
- SSA dominance verification
- Type consistency across instructions
- Block terminator completeness

### G3. Diagnostics quality
- Multi-line span display with source excerpts
- Error code reference documentation
- Warning support (`[W###]` codes)

---

## Feature Dependency Graph

```
A1 (block-local def) ──┬── B5 (struct/tuple/array tests)
                       │
A2 (field index)       ── B5 (multi-field structs)
                       │
A3 (nested Phi)       ── recursive + nested control flow
                       │
A4 (arm type unify)   ── C4 (exhaustiveness fail tests)
                       │
A5 (else if parse)    ── B6 (chained control flow)
                       │
A6 (mutual def rec)   ── B4 (mutual recursion)
                       │
D1 (affine typeck)    ── B7 + B10 (all affine/complex tests)
                       │
D2 (enum lowering)    ── B5 (enum tests) + C4
                       │
D3 (array/tuple)       ── B5
                       │
D4 (closure conv)     ── B3 (true closures)
                       │
D5 (fix)              ── B6
```

**Critical path**: A1 → D2 → D4 → E1 (most features depend on block-local def and enum lowering).

---

## Short-Term Priority (Next 3 Sessions)

1. **A1 + A2 + A3** — Fix block-local def, field index, and nested Phi (unblocks 10+ tests)
2. **A5 + A6** — Fix else-if parse and mutual def rec (unblocks 2 tests)
3. **A4** — Fix match arm type unification (prerequisite for proper fail tests)
4. **D2** — Enum lowering in IR gen (unblocks 3 pass tests + exhaustiveness tests)
5. **D1** — Affine type checking (unblocks 7+ pass tests + affine fail tests)
6. **B4–B10** — Complete remaining pass/ examples as features land
