# Dew — docs/ Documentation

Reference book built with mdBook. All implementation details must be recorded here.

## Book Structure

```
docs/book/
├── book.toml          # mdBook config
├── SUMMARY.md         # Table of contents
├── intro.md           # Project introduction
├── language.md        # Language syntax reference
├── types.md           # Type system docs
├── box.md             # Box/resource management
├── lists.md           # Lazy list docs
├── laziness.md        # Lazy evaluation design
├── flat-ir.md         # Flat IR reference
├── ir-equivalence.md  # Tree IR ↔ Flat IR theoretical equivalence
├── diagnostics.md     # Diagnostics report docs
└── examples.md        # Example catalog
```

## Building

```bash
cargo install mdbook
mdbook build docs/book/
```

## Documentation Rules

1. When adding a language feature, update the corresponding `.md` file in `docs/book/`.
2. When adding a new category of feature, create a new `.md` and update `SUMMARY.md`.
3. Keep docs in sync with the actual implementation.
4. Document both the "what" (user-facing) and the "why" (design rationale).
