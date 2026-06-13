# Introduction

Dew is a purely functional, statically-typed language with implicit lazy evaluation,
affine types, and first-class closures.

```dew
{{#include ../../examples/arithmetic.dew}}
```

## Key Concepts

- **Immutability**: all values are immutable; rebinding via `def`
- **Lazy evaluation**: implicit, driven by strictness analysis
- **Affine types**: use-once resources managed at compile time
- **Closures**: capture values, not references
