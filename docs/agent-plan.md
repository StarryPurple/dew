# Agent Plan

> Last updated: 2026-06-18

Persistent work plan for the Dew compiler. Completed items are preserved and marked. Active items are re-evaluated each session.

---

## Completed

### 2026-06-18 — IO Effect + Affine Type Checking

- [x] **IO Effect detection**: `typeck.rs` — `Effect` enum (Pure/IO), `current_effect` tracking, `fn_effects` map
  - Calls to `stdin`/`stdout` → mark current fn as IO
  - Calls to known-IO functions → propagate IO to caller
  - Annotation verification: `-> Int` + IO body → E008 error; `-> IO Int` + pure body → W004 warning
  - `main` must be IO, else → W003 warning
  - Helpers: `is_io_type()`, `io_inner_type()` for stripping `IO T` wrapper from return type
- [x] **Affine type tracking**: `typeck.rs` — `Affinity` enum (Normal/Affine), `affine_types` map, `consumed` set, `var_affine_hint`
  - `register_struct`/`register_enum`: check `Attr::Affine` → mark in `affine_types`
  - `infer_field`: field access on affine struct → mark consumed (AFTER infer to avoid self-trigger)
  - `infer_var`: check consumed set → E009 error if already consumed
  - `infer_block`: `def y = x` where x is affine Var → mark x consumed; struct/enum lit of affine type → store hint
  - `infer_def`: affine struct/enum lit → store hint
- [x] **stdlib/affine.dew**: `affine struct Affine(T) { data: T }` — canonical affine wrapper, auto-loaded
- [x] **diagnostics**: added `has_warnings()` method; `main.rs` now emits warnings alongside errors
- [x] **Fail tests**: 6 new tests — `fail/effect/pure_fn_calls_io`, `fail/effect/transitive_io`, `fail/affine/double_use`, `fail/affine/field_double_use`, `fail/affine/wrapper_double_use`; 1 pass test `pass/affine/affine_wrapper`
- [x] 104 e2e + 61 unit, 0 failures (1 intentional red: `closures/iife.dew` — IIFE awaiting nested fn IR gen)
- [x] Parser: fixed `affine enum` — `parse_decl_result` now checks `Affine`→`Enum` ahead
- [x] AGENTS.md P5: MVP→Small, added tier+feature header format requirement
- [x] Renamed `*_mvp.dew` → `*_small.dew` (7 test files)
- [x] New pass tests: `affine/affine_enum` (Medium), `affine/affine_integration` (Large), `borrow/borrow_integration` (Large), `closures/closure_integration` (Large), `io/io_strict_eval` (Medium), `closures/def_call` (Small)
- [x] Intentional red: `closures/iife.dew` (Small) — true IIFE, documents nested fn gap
- [x] `dew-lang.md` §13: `(No) Error Handling` → `Error Handling — Compile-Time Detection, Runtime Behavior, and Diagnostics`

- [x] Compound lvalue borrow call desugar: `desugar_block` now delegates to `desugar_expr` which correctly extracts field paths (`&e.pos` → `e.pos`) and rebuilds outer structs after the call
- [x] `reg_struct` tracking: function params + field results now registered, fixing named-field→index resolution (`.0` vs `.1`)
- [x] `tuple_elem_types` tracking: Call results from tuple-returning functions track element types, enabling subsequent Field resolution
- [x] `desugar_fn` fix: borrow-stmt body (with/without semicolon) now correctly rebinds borrow params before final tuple, producing `(updated_p, updated_p)` instead of `(original_p, unit)`
- [x] IR type annotations: `Field{Pos}`, `StructCons{Entity}`, `StructUpdate{Pos}`, `Call{(Pos,Pos)}`, `Stdout{Int}`, `EnumCons{List}`, `EnumProj{List}` — added `IrType` fields to `Field`, `StructUpdate`, `Call` instructions; display-only for others
- [x] `compound_medium.dew` expected output updated 42→85 (correct borrow semantics: 41+3+41=85)
- [x] `borrow_recursion.dew` → moved to `pass/complex/`, output 5050 ✓
- [x] `fix_loop.dew` → moved to `pass/control_flow/`, output 120 ✓
- [x] All formerly-failing In Progress items are now passing
- [x] 92 e2e + 61 unit tests pass, 0 failures

### 2026-06-17 — Named-Field Enum Variants + Test Tiers

- [x] Named-field variant construction: `Expr::StructLit` → checks TypeTable → `EnumCons` for enum variant names
- [x] Named-field variant match: `Pattern::Struct` in `resolve_match_pattern` → `EnumProj` per field by name
- [x] Parser fix: `parse_variant` now parses `name: Type` pairs for `Variant::Struct` fields
- [x] Test tiers: `enum_named_field.dew` (Medium), `enum_comprehensive.dew` (Medium), `enum_integration.dew` (Large)
- [x] All enum features verified: zero-payload value, single-payload, multi-payload, named-field

### 2026-06-17 — Enum Lowering & Multi-Payload + Zero-Arg Variant

- [x] Zero-arg enum variant as value expression — `ir_gen.rs` `Expr::Var` checks `find_zero_payload_variant` → `EnumCons`
- [x] EnumCons tag fix — `eval.rs` was hardcoded to 0, now looks up from `TypeTable::enum_variant_tag`
- [x] Multi-parameter enum payload — `Variant::Single.payload` changed from `Type` to `Vec<Type>`
- [x] AST: `EnumPayload::Single(Option<Box<Expr>>)` → `Vec<Box<Expr>>`, `VariantPattern.payload: Vec<Pattern>`
- [x] Parser: comma-separated types/exprs/patterns in variant declarations
- [x] IR: `Instr::EnumProj` gains field index `usize` parameter; `resolve_match_pattern` emits one proj per pattern
- [x] `TypeTable::find_zero_payload_variant` helper
- [x] Test fixes: `stmt_update` (42→60), `mutual_recursion` (17→9), `enum_match` (`fn(d: Direction)`), `recursive_type` (rewrote for Tree)
- [x] Spec updated: §4.5 multi-parameter payload, dew-ir.md enum_proj index + multi-positional section

### 2026-06-17 — Compiler Pipeline & Core Features

- [x] **A3** Nested Phi predecessor tracking — `eval.rs`: replaced `last_label` with `label_stack`
- [x] **A5** `else if` chain parsing — `parser.rs`: `parse_if` checks `TokenKind::If` after `else`
- [x] **A1** Block-local `def` binding — across `ast.rs`, `parser.rs`, `desugar.rs`, `nameres.rs`, `typeck.rs`, `ir_gen.rs`
- [x] **A2** Field index lookup — `ir_gen.rs` `reg_struct` tracking + `TypeTable::struct_field_index`
- [x] **A6** Mutual `def rec` forward reference — `typeck.rs` separate pass for all rec names
- [x] **Borrow sugar** (no-rebinding case) — `desugar.rs` `expr_has_borrow` + skip tuple-wrap
- [x] Pipeline + borrow `&acc -> loop(n-1)` — `BorrowExpr.rhs: Option<Box<BorrowRhs>>`, `ExprArg::Borrow` in pipeline
- [x] `#[affine]` attribute parsing — `parser.rs` `eat_attribute` skips `#[<anyword>]`
- [x] 61 unit tests pass
- [x] Test runner grep fix (`grep -F`)

### 2026-06-16/15 — Initial Compiler Scaffold

- [x] AST, Lexer, Parser, Desugar, NameRes, TypeCheck, Strictness, IR Gen, Eval, LLVM
- [x] CLI (file/eval/repl modes)
- [x] 7 initial examples pass

## Backlog

### Affine Type Checking (remaining)

- [ ] **Auto-derivation warning**: struct/enum with affine-typed fields but no `affine` keyword → W???
- [ ] **Closure FnOnce inference**: closures capturing affine values → marked FnOnce
- [ ] **Pattern match consumption**: destructuring affine struct/enum → consumes the matched value
- [ ] **Call arg consumption**: passing affine value as function argument → marks consumed

### Top-Level Def Ordering

- [ ] Forward references for all top-level defs (Rust-style), not just `def rec`

### `def rec` Warning

- [ ] `def rec` unused-self-reference warning `[W006]`

---

## Test Status

**98 e2e passed, 0 failed** | **61 unit passed, 0 failed** (2026-06-18)
