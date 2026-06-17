# Agent Plan

> Last updated: 2026-06-17

Persistent work plan for the Dew compiler. Completed items are preserved and marked. Active items are re-evaluated each session.

---

## Completed

### 2026-06-17 — Compiler Pipeline & Core Features

- [x] **A3** Nested Phi predecessor tracking — `eval.rs`: replaced `last_label` with `label_stack`
- [x] **A5** `else if` chain parsing — `parser.rs`: `parse_if` checks `TokenKind::If` after `else`
- [x] **A1** Block-local `def` binding — across `ast.rs`, `parser.rs`, `desugar.rs`, `nameres.rs`, `typeck.rs`, `ir_gen.rs`
- [x] **A2** Field index lookup — `ir_gen.rs` `reg_struct` tracking + `TypeTable::struct_field_index`
- [x] **A6** Mutual `def rec` forward reference — `typeck.rs` separate pass for all rec names
- [x] **Borrow sugar** (no-rebinding case) — `desugar.rs` `expr_has_borrow` + skip tuple-wrap
- [x] 46 example `.dew` files (35 pass, 11 fail)
- [x] Test runner grep fix (`grep -F`)

### 2026-06-16/15 — Initial Compiler Scaffold

- [x] AST, Lexer, Parser, Desugar, NameRes, TypeCheck, Strictness, IR Gen, Eval, LLVM
- [x] CLI (file/eval/repl modes)
- [x] 61 unit tests pass
- [x] 7 initial examples pass

---

## In Progress

### Enum Lowering

- [ ] `ir_gen.rs`: compile `Expr::EnumLit` → `Instr::EnumCons`
- [ ] `ir_gen.rs`: compile `Expr::Match` on enum → `Instr::EnumDisc` + `Br` + `Instr::EnumProj`
- [ ] `eval.rs`: `Value::Enum` representation, `EnumCons`/`EnumDisc`/`EnumProj` handlers
- [ ] Blocking: `enum_basic.dew`, `enum_match.dew`, `recursive_type.dew`, `missing_variant.dew`

### Affine Type Checking

- [ ] `typeck.rs`: consumption tracking per variable
- [ ] `typeck.rs`: `use_after_consume` / `double_use` error detection
- [ ] `typeck.rs`: `#[affine]` struct/enum processing
- [ ] Blocking: 4 pass tests + 2 fail tests + 3 complex tests

### `fix` Expression

- [ ] `ir_gen.rs`: `Expr::Fix` → self-referential thunk lowering
- [ ] Blocking: `fix_loop.dew`

---

## Backlog

- [ ] Full borrow rebinding support (tuple-return desugaring when body has `&p = expr`)
- [ ] Array/Tuple IR lowering (currently simulated with struct)
- [ ] Closure conversion / lambda lifting
- [ ] Match arm type unification (`typeck.rs`)
- [ ] Enum exhaustiveness checking (`typeck.rs`)
- [ ] IO effect inference (`typeck.rs`)
- [ ] Recursive struct layout check (`typeck.rs` `[E008]`)
- [ ] LLVM JIT execution
- [ ] LSP server
- [ ] Medium/large example tests for struct, recursion, closures per P5
