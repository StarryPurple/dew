# Agent Plan

> Last updated: 2026-06-18

## Completed

### 2026-06-18 — Loops Cleanup + Test Tier Finalization

- [x] Removed native `while`/`forever`/`for` from Dew — loops delegated to Rx→Dew translator
- [x] §6.3: rewritten — `def rec` + `&` borrow params via translator
- [x] §14-15: Keywords + Reserved section; typeof/type_match as future feature
- [x] Large test expansion: 5 true Large tests (25-38 lines)
- [x] Tier reclassification: 8 undersized Large → Medium
- [x] Tier distribution: 54 Small / 46 Medium / 5 Large
- [x] All 98 pass tests annotated with tier
- [x] 126 e2e + 61 unit — ALL GREEN

### 2026-06-18 — Closures + FnOnce + For-In Deferred

- [x] `compile_closure` replaces "nested fn" error, free variable analysis, Lambda emission, dynamic call
- [x] `fn_captures_affine` detects affine-capture closures, double-call → E004 (`Rc<ClosureValue>`)
- [x] `rec_placeholders` self-reference fixup for Lambda captures
- [x] 116 e2e + 61 unit

### 2026-06-18 — Core Features: IO, Affine, Exhaustiveness

- [x] IO effect detection + propagation + annotation verification
- [x] Affine type checking: consumption tracking, auto-derivation W004, field/call/match consumption
- [x] E005 non-exhaustive match detection, E008 struct self-recursion, W006 def-rec unused
- [x] Top-level def forward references
- [x] IR type annotations + compound lvalue borrow fix
- [x] IIFE parser fix (`extract_iife` helper)
- [x] Error codes aligned with spec (E004/E006/E008)

### 2026-06-17 — Earlier Work

- [x] Enum lowering, multi-payload, named-field variants
- [x] Compiler pipeline: Nested Phi, else-if, block-local def, field index, mutual rec, borrow sugar
- [x] Initial scaffold: AST, Lexer, Parser, Desugar, TypeCheck, Strictness, IR Gen, Eval, LLVM

## Deferred

- [ ] **typeof/type_match (§4.9)**: spec designed, requires monomorphization pass (~150 lines)
- [ ] **Rx→Dew translator**: while/for/in loops via def rec + borrow params
- [ ] **for-in list iteration**: requires self-referencing closure infrastructure (Rc sharing)

## Test Status

**126 e2e passed, 0 failed | 61 unit passed** (2026-06-18)

Tier distribution: 54 Small / 46 Medium / 5 Large