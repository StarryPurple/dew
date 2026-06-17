# Dew Design Documents

This directory contains the **canonical design specifications** for the Dew programming language and its ecosystem. These documents are the single source of truth — all implementation derives from them.

---

## Document Index

| Document | Scope | Description |
|----------|-------|-------------|
| [dew-lang.md](dew-lang.md) | Dew Language | Complete language specification: syntax, semantics, type system, standard library |
| [dew-ir.md](dew-ir.md) | Dew IR | Thunk Graph IR specification: primitives, instructions, text format, evaluation model |
| [rx-dew-interop.md](rx-dew-interop.md) | Rx ↔ Dew Interop | Translation rules for Rx (Rust-like) ↔ Dew round-trip, safety analysis architecture |
| [todo.md](todo.md) | Roadmap | Implementation roadmap: completed features, gaps, planned phases, dependency graph |
| [dew-lang-ebnf.md](dew-lang-ebnf.md) | Dew Grammar (doc) | Full EBNF grammar for the Dew surface syntax with explanatory notes |
| [dew-lang.ebnf](dew-lang.ebnf) | Dew Grammar (EBNF) | Machine-readable EBNF grammar for the Dew surface syntax |
| [dew-ir.ebnf](dew-ir.ebnf) | Dew IR Grammar (EBNF) | Machine-readable EBNF grammar for the Dew IR text format |

---

## Document Relationships

```
dew-lang.md ──────────────── Dew source language
     │
     ├── defines the type system that dew-ir.md implements
     │
     └── defines the target language for rx-dew-interop.md translations

dew-ir.md ────────────────── Compiler IR
     │
     ├── compilation target for dew-lang.md
     │
     └── analysis IR for rx-dew-interop.md safety checks

rx-dew-interop.md ────────── Cross-language pipeline
     │
     ├── Rx source → dew-lang.md (forward translation)
     │
     └── dew-lang.md's type checker → Rx safety report (reverse analysis)
```

---

## Reading Guide

**If you want to write Dew programs** → Start with [dew-lang.md](dew-lang.md).

**If you want to implement the compiler** → Read [dew-lang.md](dew-lang.md) first for language semantics, then [dew-ir.md](dew-ir.md) for the compilation target.

**If you want to translate Rx to Dew** → Read [rx-dew-interop.md](rx-dew-interop.md); it references both [dew-lang.md](dew-lang.md) (target language) and the Rx grammar in `RustShard-Compiler/docs/semantic_rules.md`.

**If you want to understand the full architecture** → Read in order: dew-lang.md → dew-ir.md → rx-dew-interop.md.

---

## Comment Convention

All design documents in this directory use **Markdown blockquotes** (`>`) for commentary on the specification text. Commentary includes design rationale, alternative considerations, tradeoff analysis, and contextual notes.

> This is a comment. It annotates the spec — explaining why, what was considered, what constraints apply.

Blockquotes in these documents serve as annotations; no other content uses this format.

**Convention rules:**
- Commentary on specification text uses `>` blocks immediately following the relevant text
- Removing all blockquotes produces a clean spec-only document
- Filter command: `grep -v '^>' dew-lang.md` strips all annotations

**Currently, all commentary expresses design intent.** If commentary for other purposes emerges (e.g., implementation notes, open questions, cross-references), additional conventions can be layered on — but blockquotes remain the general annotation mechanism.

## Update Policy

These documents are **living specifications**. Update procedure:

1. Design decisions are discussed and resolved
2. The relevant design document is updated **immediately**
3. Implementation follows the updated spec
4. If a design decision crosses document boundaries, update all affected documents

The [Language Design Methodology](../methodology/language-design.md) governs *how* we make design decisions. These design documents record *what* was decided.

---

*Last updated: 2026-06-17*
