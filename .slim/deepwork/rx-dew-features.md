# Dew Language Feature Implementation

## Plan
1. Fix test_runner.sh — deprecated test support
2. A0: `&x -> stdin` stdin pipeline syntax (correct getInt mapping)
3. A1: `if (c) { }` no else for Unit type
4. A2: `def (a, b) = expr` tuple destructuring  
5. A3-A4: `if (&x; c) { }` and `else (&x) { }` borrow syntax
6. A5-A7: `while (&x; c) { Continue/Done }`
7. Update documentation (dew-lang.md, rx-dew-interop.md)
8. Rebuild Rx→Dew translator with new features
9. Update comprehensive tests
