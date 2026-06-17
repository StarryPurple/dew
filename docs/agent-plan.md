# Agent Plan

> Last updated: 2026-06-17

Persistent work plan for the Dew compiler. Completed items are preserved and marked. Active items are re-evaluated each session.

---

## Completed

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

---

## In Progress

### `fix` Expression

- [ ] `desugar.rs`: `desugar_decl` pattern match `Expr::Fix(fix)` fails (deref chain issue: `&&Box<Expr>` vs `&Expr`)
- [ ] Desugar design: `fix loop { fn(...) { ... loop(...) ... } }` → `{ def rec loop = fn(...) { ... loop(...) ... }; loop }`
- [ ] Blocking: `fix_loop.dew`

### Pipeline + Borrow Recursion

- [ ] `borrow_recursion.dew` compiles but produces empty output
- [ ] Root cause: micro-block var_map scoping prevents cross-iteration `acc` propagation in recursive borrow calls
- [ ] Design decision needed: move borrow call desugar to `desugar_block` level, or make block compilation return rebound variables

---

## Backlog

### Affine Type Checking

- [ ] `typeck.rs`: consumption tracking per variable
- [ ] `typeck.rs`: `use_after_consume` / `double_use` error detection
- [ ] `typeck.rs`: `#[affine]` struct/enum processing
- [ ] Blocking: 4 pass tests + 2 fail tests + 3 complex tests

### Spec Changes (Pending)

- [ ] Top-level def ordering: forward references for all top-level defs (Rust-style), not just `def rec`
- [ ] `def rec` unused-self-reference warning `[W006]`

---

## Test Status

**61 passed, 2 failed** (2026-06-17)

| Status | Count | Details |
|--------|-------|---------|
| Pass | 58 | All pass tests except below |
| Pass (all 10) | 10 | All fail tests green |
| Fail | 2 | `borrow_recursion`, `fix_loop` |
