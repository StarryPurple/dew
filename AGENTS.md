# Dew — Project Methodology

This document is the entry point for **how we build the Dew programming language**. It indexes the methodology documents and establishes top-level constraints that apply across all domains.

**Before doing anything in this project, read this document and the relevant sub-document for your task.**

---

## Document Index

| Document | Scope | Read When |
|----------|-------|-----------|
| [Design Docs](docs/design/README.md) | Index of all design specifications | Navigating the design documentation |
| [Language Spec](docs/design/dew-lang.md) | Complete Dew language specification (live, single-file) | Any language design or implementation question |
| [IR Spec](docs/design/dew-ir.md) | Thunk Graph IR specification | Implementing any compiler pass involving IR |
| [Rx↔Dew Interop](docs/design/rx-dew-interop.md) | Rx ↔ Dew translation rules and architecture | Working on cross-language translation |
| [Language Design](docs/methodology/language-design.md) | How to design language features, type rules, syntax | Proposing any new feature or type system change |
| [Compiler Engineering](docs/methodology/compiler-engineering.md) | Pipeline architecture, IR design, verification | Implementing any compiler pass or IR change |
| [Project Conventions](docs/methodology/project-conventions.md) | Repository structure, naming, commits, examples | Writing any code or docs |

---

## Top-Level Constraints

These constraints apply across ALL domains. No sub-document may override them.

### 1. English Only

All documentation, commit messages, code comments, and design proposals are written in English. Chinese is used only for user-facing chat/discussion, never in committed artifacts.

### 2. Methodology Before Implementation

Read the relevant methodology document(s) before writing any code. If a methodology document does not cover your task, update it first — then implement.

### 3. Discuss Before Writing (Design Phase)

During design discussion, **do not modify files.** When the user raises a design question, analyze and propose — verbally. Only edit files when the user explicitly asks for changes to be recorded, or when the discussion has concluded and a decision is made.

> Design is thinking; implementation is writing. Mixing them creates churn. First agree on the design, then update the documents in one pass.

### 4. Semantics Before Syntax

Language features are designed semantic-model-first. Syntax is the last step, not the first. See [Language Design § 1.2](docs/methodology/language-design.md).

### 5. Correctness Before Performance

The compiler must be correct before it is fast. Optimizations are gated behind proof of necessity (real programs, not microbenchmarks) and must never sacrifice soundness. See [Compiler Engineering](docs/methodology/compiler-engineering.md).

### 6. Example-Driven

Every language feature and compiler change must be demonstrated with at least one runnable example in `examples/`. Examples are the primary testing and documentation mechanism.

### 7. Minimal Dependencies

External crate additions require justification. If it can be written in <100 lines, write it. See [Project Conventions](docs/methodology/project-conventions.md).

### 8. The Three-Pillar Gate

Any design or implementation change must answer:

> **Does it break the coherence of Lazy + Affine + Closure?**

If yes, the change requires explicit justification and redesign.

### 9. Living Methodology

Methodology documents are not frozen. When a discussion produces a design conclusion, pattern, or rule that generalizes beyond the immediate task, **record it immediately** into the relevant methodology document. Do not wait for a "documentation phase."

**Triggers for recording:**
- A design decision is made after evaluating multiple alternatives
- A recurring pattern emerges across multiple modules or features
- A constraint or boundary condition is discovered that was not previously documented
- A new anti-pattern is identified

**Recording format**: Direct edit to the relevant `docs/methodology/*.md` file. No separate changelog needed — Git history tracks the evolution.

### 10. Forward References

When a concept is mentioned before its formal introduction in a document, add a **reference link** to the section where it is defined. Prefer Markdown jump links (`[concept](#section-name)`) over plain mentions. This ensures readers can navigate to the full definition immediately rather than searching for it.

### 11. Two-Level Table of Contents

When writing a full-document table of contents at the top of a specification or methodology document, include **two levels** of headings — top-level sections (`##`) and their immediate subsections (`###`). Every entry must be a Markdown jump link. This allows readers to locate any subsection without scrolling.

**Wrong:** A TOC with only top-level sections:
```
- [Core Semantics](#3-core-semantics)
- [Type System](#4-type-system)
```

**Right:** A TOC that also lists subsections:
```
- [Core Semantics](#3-core-semantics)
  - [Immutability](#31-immutability)
  - [Lazy Evaluation](#32-lazy-evaluation)
- [Type System](#4-type-system)
  - [HM Inference](#41-hm-inference)
  - [Affine Modifier](#42-affine-modifier)
```

### 12. No Undefined Content in Examples

**Examples must be self-contained.** A reader who has only read the preceding sections of the current document (and no jump-target sections) must be able to understand every name, type, and function used in an example. Never assume the reader shares your memory of other documents or unimplemented APIs.

- Every struct, enum, and function used in an example must be **defined within that example**, or previously defined in the current document's flow.
- Do not use helper functions, wrapper types, or utility constructs not introduced in the document.
- If a helper is needed for an example's logic, define it inline or use a comment placeholder.

Simply put: assume the reader knows only what's on the pages they've already read in this document. Nothing more.

### 13. Abstraction in Rules

Methodology rules and constraints must be written in **generic, reusable terms** — never by referencing specific project names, file paths, function names, or examples from the current codebase.

**Wrong:** "Do not use `build_request()` or `open()` in examples."  
**Right:** "Do not use helper functions or constructors not defined within the example."

A rule must be valid when transplanted to a different project. If removing all project-specific nouns would break the rule's meaning, the rule is overfitted. This applies to AGENTS.md, methodology documents, and any constraint written for future readers or other agents. See `agents/researcher.md` for the full principle.

---

## Project-Specific Conventions

These conventions are specific to the Dew compiler project. They supplement the [Top-Level Constraints](#top-level-constraints).

### P1. End-to-End Tests Are the Unit Tests

The `.dew` example files in `examples/pass/` and `examples/fail/` are the **authoritative specification of correct compiler behavior**. Rust `#[test]` functions in `src/` serve only as secondary smoke tests for internal data structures. The e2e test suite is the primary verification mechanism.

- `examples/pass/<category>/<name>.dew` — the first line is `// expect: <output>`. The compiler must produce exactly this output on stdout.
- `examples/fail/<category>/<name>.dew` — the first line is `// expect error: [<code>]`. The compiler must emit an error matching this code.

Run the full test suite with:
```bash
bash tools/test_runner.sh
```

### P2. Tests Written Against the Spec, Not the Implementation

When creating or reviewing example `.dew` files, consult **only** these documents:

- [dew-lang.md](docs/design/dew-lang.md) — what a valid Dew program looks like and what it should do
- [dew-ir.md](docs/design/dew-ir.md) — how the IR should lower and evaluate

**Do NOT look at `src/` source code** when writing test files. The tests define what the compiler SHOULD do. The implementation follows the tests, not the other way around. If the spec says a construct is valid and should produce a certain output, the test file says so — regardless of whether the compiler currently handles it.

### P3. Never Modify Tests to Make Them Pass

When a test fails, the compiler is wrong. Fix the compiler, not the test. The only exception: a test contains a pre-existing factual error (e.g., `// expect: 17` when the correct result of the computation is `9`). In that case, identify the error explicitly and ask before changing the test.

If a test uses a language feature not yet implemented, leave it failing. The failing test documents what needs to be built. Never weaken a test to match current compiler capabilities.

### P4. Test Output Validation

- `pass/` tests validate the **last line of stdout**. The `// expect: <VALUE>` directive on the first line of the file is compared against the final stdout line.
- `fail/` tests validate **stderr**. The `// expect error: [<CODE>]` directive is searched as a fixed string (not regex) in the compiler's error output.
- Tests that produce no output or no matching error are counted as failures.

### P5. Feature Test Coverage — Three Tiers

For every language feature, write tests at three scales:

| Tier | Name | Lines | Purpose |
|------|------|-------|---------|
| **MVP** | `feature_mvp.dew` | 2–5 | The absolute minimum: one expression, one output. Proves the feature exists at all. |
| **Medium** | `feature_moderate.dew` | 10–30 | Exercises each sub-aspect of the feature: edge cases, variant forms, error paths. Must cover **every syntactic form and semantic rule** defined in the spec for that feature. |
| **Large** | `feature_integration.dew` | 30–80 | Composes the new feature with already-implemented features (functions, recursion, structs, etc.). Multiple calls, mixed contexts. Proves the feature works **in combination**, not just in isolation. |

**Why three tiers:**

- MVP alone is deceptive — a single-expression test passes long before the feature is truly complete (e.g., struct construction worked, but field access with nonzero indices returned wrong values).
- Medium tests catch gaps between partial and full implementation. Write one medium test per sub-feature (e.g., `struct_construction.dew`, `struct_field_access.dew`, `struct_update.dew`).
- Large tests catch composability bugs — features that work alone often break when combined (nested Phi predecessor tracking was invisible in single-branch tests).

**Anti-patterns (do NOT do):**

- One MVP test and declare the feature done.
- One giant 200-line test that's impossible to debug.
- Tests that only exercise the happy path — every feature has edge cases listed in the spec; write a test for each.

### P6. Implementation Gate: Examples Must Exist First

Before implementing or fixing a compiler feature, check that the corresponding example files exist in `examples/`. These files must have been created **solely from the design docs** (`dew-lang.md`, `dew-ir.md`), never by looking at `src/` source code. They serve as the specification — if they don't exist yet, write them first per [P5](#p5-feature-test-coverage--three-tiers), then implement.

When starting work on a feature:

1. Check `examples/pass/` for the three-tier tests (MVP, medium, large) covering every sub-aspect of the feature.
2. Check `examples/fail/` for negative tests that should produce specific error codes.
3. If tests are missing or incomplete, write them **from the spec only** before touching any Rust code.
4. Run the test suite — the new tests should fail (red), proving they test unimplemented behavior.
5. Implement the feature, re-running the test suite until the new tests pass (green).

This ensures every feature has a documented, verifiable specification before implementation begins. It also prevents the common pitfall of writing tests that accidentally validate buggy behavior by mirroring the implementation.

---

## Quick Reference: Which Doc for Which Task?

| Task | Primary Document | Secondary Document |
|------|-----------------|-------------------|
| Look up any language feature | language-spec.md | — |
| Design a new type system rule | language-design.md | language-spec.md |
| Add syntax for a new expression form | language-design.md | compiler-engineering.md |
| Implement the parser | compiler-engineering.md | project-conventions.md |
| Design IR primitives | compiler-engineering.md | language-design.md |
| Add an optimization pass | compiler-engineering.md | — |
| Write a Dew example program | project-conventions.md | language-spec.md |
| Update the language specification | language-spec.md | language-design.md |
| Structure a new Rust module | project-conventions.md | compiler-engineering.md |
| Write a design proposal | language-design.md | project-conventions.md |

---

*Last updated: 2026-06-17*
