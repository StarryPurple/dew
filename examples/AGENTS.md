# Dew — examples/ Test Suite

All testing is example-driven. There are no unit tests.

## Categories

| Category | Files | Expected Behavior |
|----------|-------|-------------------|
| **Basic** | `arithmetic.dew`, `identity.dew`, `conditional.dew`, `nested.dew`, `pure_fn.dew`, `dup_int.dew` | Correct evaluation |
| **Recursion** | `recursion.dew` | factorial(5) = 120 |
| **Higher-order** | `higher_order.dew` | Function composition = 49 |
| **Box correct** | `box_ok.dew`, `nested_box.dew` | Correct alloc/dealloc |
| **Box errors** | `box_double.dew`, `box_leak.dew` | Compile-time error / diagnostic leak |
| **FnOnce** | `fnonce.dew` | Affine closure consumed once |
| **FnOnce error** | `fnonce_err.dew` | Double-use → compile error |
| **Lists** | `list_basic.dew`, `list_three.dew`, `list_isnil.dew`, `list_tail.dew` | List operations |
| **Infinite lists** | `list_infinite.dew`, `list_take.dew` | Lazy infinite list, only accessed elements forced |

## Adding Examples

1. Create `<name>.dew` in this directory
2. Follow Dew syntax (see `docs/book/language.md`)
3. Each example should exercise exactly one feature
4. Error-test examples should include a comment explaining the expected error
5. Use `def main = fn () { ... }` as entry point
6. Verify with `cargo run -- examples/<name>.dew`
