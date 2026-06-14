# Tuples and Arrays

Dew provides two structural compound types: **tuples** (heterogeneous fixed-size collections) and **arrays** (homogeneous fixed-size collections).

## Tuples

Tuples group a fixed number of values of possibly different types:

```dew
def pair = (42, true);          // (Int, Bool)
def triple = (1, 2, 3);         // (Int, Int, Int)
def mixed = (42, 'a', true);    // (Int, Char, Bool)
```

### Tuple Types

Tuple types use parenthesized, comma-separated type names:

```dew
def pair: (Int, Bool) = (42, true);
```

### Restrictions

- **No unit tuple**: single element in parentheses is just grouping, e.g., `(42)` is `Int`, not a tuple
- **No single-element tuple**: tuples require two or more elements
- **No numeric index access**: use destructuring instead

### Tuple Literal Syntax

```dew
def t = (1, 2, 3);  // TupleLit
```

The comma is the tuple constructor — parentheses are required for grouping.

### Tuple Update

Tuples are immutable. Create a modified copy by positional index:

```dew
def t = (1, 2, 3);
def t2 = t { 0 = 10 };  // (10, 2, 3)
```

### AST Representation

```rust,ignore
Expr::TupleLit    { elements: Vec<Expr> }     // (1, 2, 3)
Expr::TupleUpdate { expr, index, value }       // t { 0 = 10 }
```

### Pattern Matching on Tuples

Destructure tuples in `match` patterns:

```dew
match pair {
  (x, y) => x + y,
}
```

## Arrays

Arrays are fixed-size, homogeneous collections. The size is a compile-time constant:

```dew
def digits = [1, 2, 3];   // Array(Int, 3)
def flags = [true, false];  // Array(Bool, 2)
```

### Array Types

In type annotations, arrays use the parameterized `Array(T, N)` form:

```
Array(Int, 3)      // 3-element integer array
Array(Char, 5)     // 5-element character array
Array(Bool, 2)     // 2-element boolean array
```

### Array Literals

```dew
[e1, e2, e3]       // Expr::ArrayLit
```

Commas separate elements. All elements must have the same type.

### Array Access

Read an element by index:

```dew
def first = digits[0];   // 1
def third = digits[2];   // 3
```

Access compiles to `Expr::ArrayAccess { expr, index }`.

### Array Update

Create a modified copy with a specific index replaced:

```dew
def digits2 = digits { [0] = 99 };  // [99, 2, 3]
```

This compiles to `Expr::ArrayUpdate { expr, index, value }`. The original array is unchanged.

## Strings

String literals in Dew are syntactic sugar for character arrays:

```dew
"hello"   // equivalent to ['h', 'e', 'l', 'l', 'o']
          // type: Array(Char, 5)
```

There is no separate `String` type. String literals are compiled into `Expr::ArrayLit { elements: [Char('h'), ...] }`.

Escape sequences in string literals:
- `\n` — newline
- `\t` — tab
- `\\` — backslash
- `\"` — double quote

### Character Literals

Single characters use single quotes:

```dew
'a', 'Z', '\n'
```

Character literals can also include the same escape sequences.

## Internal Types and Values

### IR Representation

```rust,ignore
Ir::Array(Vec<Ir>)                        // [a, b, c]
Ir::ArrayAccess { expr, index }           // arr[idx]
Ir::ArrayUpdate { expr, index, value }    // arr { [idx] = val }
Ir::Tuple(Vec<Ir>)                        // (a, b, c)
Ir::TupleUpdate { expr, index, value }    // t { idx = val }
```

### Runtime Values

```rust,ignore
Value::Array(Vec<Value>)  // Array runtime value
Value::Tuple(Vec<Value>)  // Tuple runtime value
```

### Affinity

Arrays and tuples of Copyable types are themselves Copyable. If any element type is Affine, the compound type inherits Affine affinity.

## Design Notes (from `initial-design.md`)

- **Lists** (`List(T)`) are planned but not yet implemented. They would be persistent (reference-counted) cons-list collections.
- **No `Float`** in the initial version.
- **Strings as arrays** is a deliberate design choice — no separate `String` type name exists.

## Next

- [**Laziness**](laziness.md) — implicit lazy evaluation and strictness analysis
