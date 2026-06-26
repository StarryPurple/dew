# Agent Plan

> Last updated: 2026-06-21

## Completed

### 2026-06-21 — Rx→Dew Interop: Cast, Struct Types, Return Dead Code

- [x] Added `expr as Type` cast expression to Dew language (parser, typeck, desugar, IR gen)
- [x] Cast target type must be `Int`, `Bool`, or `Char` — `Unit` forbidden on both sides
- [x] Rx translator now emits `(expr as dew_type)` instead of dropping casts — fixes 3 cases (2, 3, 21)
- [x] Fixed struct field types in Rx translator: use `map_type(ftype)` instead of hardcoded `Int`
- [x] Added missing Rx type mappings (`u32`, `u64`, `u8`, `i64`, `i8`, `isize`) to `map_type`
- [x] Fixed `emit_body` return handling: skip subsequent statements as dead code after `return`
- [x] `collect_free_vars_impl` in IR gen: added `Expr::Cast` recursion for closure capture analysis
- [x] Name resolver: added `Expr::Cast` recursion (was incorrectly treated as leaf node)
- [x] Documented `as` cast in `dew-lang.md` §7.2 (Operators), §7.3 (Precedence), §14 (Keywords)

### 2026-06-26 — New Session Start: Rx→Dew Redesign

- [ ] Phase 1: Restore basic translator framework (struct + function direct translation)
- [ ] Phase 2: Destructurization (struct→ADT, method→standalone fn, type-directed dispatch)
- [ ] Phase 3: Control flow translation (while→fix+CF, return/break/continue)
- [ ] Phase 4: Mutation + Borrow (`&mut`→`&`, assignment→shadowing)

### 2026-06-19 — Rx↔Dew Interop Specification Rewrite

- [x] Rewrote `docs/design/rx-dew-interop.md` (422 → 839 lines): full control flow translation rules, corrected type mapping, reverse translation section
- [x] §3.1: corrected type mapping — all Rx integer types (`i8`–`u64`) map to `Int`; removed stale `f64`→`Int` claim, added integer widening safety note
- [x] §3.4: new control flow translation section with 5 subsections — if/else restructuring, loop→recursion, break/continue, return (3 cases + Option encoding), nested loops
- [x] §3.6: revised match translation — replaced "nearly identical" claim with accurate pattern semantics comparison table (ref/mut/@/range differences)
- [x] §5: fixed internal numbering (was §6.x, now §5.1–§5.3); added phantom type parameter note for ProvenancePtr
- [x] §7: new reverse translation section (Dew→Rx) — type mapping, function/ownership/recursion/match reversal, limitations
- [x] §6: added Invariant 5 (control flow completeness)
- [x] §8: updated limitations table with new items (nested return verbosity, reverse translation lossiness, closures)
- [x] §9: expanded reference list (added Rx AST and type system headers)
- [x] Updated `dew-lang.md` §6.3 example: replaced `%loop` (parser-rejected) with `fix loop` syntax; updated cross-reference link text
- [x] TOC: two-level per AGENTS.md §11

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
- [ ] **for-in list iteration**: requires self-referencing closure infrastructure (Rc sharing)