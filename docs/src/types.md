# Types

Dew is statically typed. Every expression has a type known at compile time, enforced by Hindley-Milner type inference with affine resource tracking. Type annotations are optional in most positions — the compiler infers them.

## Primitive Types

Dew provides four built-in primitive types:

| Type | Description | Example |
|------|-------------|---------|
| `Int` | 64-bit signed integer | `42`, `-7`, `0` |
| `Bool` | Boolean value | `true`, `false` |
| `Char` | Unicode scalar value | `'a'`, `'\n'`, `'λ'` |
| `Unit` | The unit type (single value) | `Unit` |

### Why `Int` is 64-bit

`Int` is a **fixed-size, stack-allocated, Normal** type. This is a deliberate design choice:

| Choice | Allocation | Affinity | Everyday usability |
|--------|-----------|----------|-------------------|
| **`i64` (chosen)** | Stack, 8 bytes | Normal | Arithmetic just works |
| `i128` | Stack, 16 bytes | Normal | No practical benefit on 64-bit hardware |
| Big integer | Heap | Affine or Persistent | Every `+` would consume its operands |

If `Int` were heap-allocated (affine), the simplest expressions would break:

```dew
def x = 42;
def y = x + 1;  // x consumed — gone
def z = x + 2;  // ERROR: x already moved
```

`Int` as Normal is essential to the language's usability. A 64-bit signed integer matches the machine word on modern hardware, provides clean C interop (`int64_t`), and offers sufficient range for virtually all numeric programs (factorial of 20 is ~2.4 × 10¹⁸, still within `i64`).

**Arbitrary-precision integers** are planned as a separate `BigInt` type with Affine or Persistent affinity — opt-in for the rare cases that need them.

```dew
def meaning: Int = 42;
def flag: Bool = true;
def letter: Char = 'z';
def nothing: Unit = Unit;
```

## Type Annotations

Type annotations use a colon after the name:

```dew
def name: Type = expression;
```

In function parameters, annotations are required for the parameter types. The return type annotation is optional:

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
//        ^^^^^^^^^^^^^^^^^^ params        ^^^ return type
```

For multi-parameter functions, all parameter types must be annotated. The return type defaults to a fresh type variable if omitted:

```dew
def id = fn(x: Int) { x }  // return type inferred as Int
```

## Function Types

Function types use the arrow syntax `T -> U`:

```dew
Int -> Bool                  // function from Int to Bool
(Int -> Bool) -> Char        // function taking a function, returning Char
Int -> Bool -> Char          // curried: Int -> (Bool -> Char)
```

The arrow is right-associative, so `T1 -> T2 -> T3` means `T1 -> (T2 -> T3)` — a function returning a function. Parentheses group: `(T1 -> T2) -> T3` is a function taking a function.

In type annotations, write:

```dew
def apply = fn(f: Int -> Int, x: Int) -> Int { f(x) }
```

Here `Int -> Int` is the type of parameter `f`.

For multi-parameter types, use a tuple:

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
// add : (Int, Int) -> Int
```

The legacy `fn(...) -> ...` keyword form (`fn(Int) -> Int`) is still accepted for backward compatibility.

## Named Types

User-defined structs and enums become named types:

```dew
struct Point { x: Int, y: Int }   // type: Point
enum Option { Some(Int), None }   // type: Option
```

See [Structs and Enums](structs-enums.md) for full details.

## Compound Types

### Tuple Types

Tuples are written as comma-separated types in parentheses:

```dew
(Int, Bool)       // pair type
(Int, Int, Char)  // triple type
```

Example:
```dew
def pair: (Int, Bool) = (42, true);
```

### Array Types

Arrays have a fixed size known at compile time. In type annotations, arrays use the parameterized syntax:

```
Array(T, N)
```

where `T` is the element type and `N` is the compile-time constant size.

```dew
def digits: Array(Int, 3) = [1, 2, 3];
```

### List Types

The internal type system supports `List(T)` as a parameterized persistent collection, though the surface syntax currently treats them through library definitions.

## The Internal Type System

Under the hood, Dew's type checker uses the following internal representation (see `types.rs`):

```rust,ignore
enum Ty {
    Prim(PrimTy),      // Int, Bool, Char, Unit
    Var(usize),        // HM type variable
    Fun(Box<Ty>, Box<Ty>),  // function type
    Adt(String, Vec<Ty>),   // named ADT (struct/enum)
    Tuple(Vec<Ty>),          // tuple type
    Array(Box<Ty>, usize),   // fixed-size array
    List(Box<Ty>),           // persistent list
    Affine(Box<Ty>),         // affine resource wrapper
    Hole(usize),             // inference gap
}
```

## Type Inference

Dew uses a **Hindley-Milner** type inference engine (WIP in v0.1.0). Currently, the following types are fully inferred:

- Literals: `Int`, `Bool`, `Char`, `Unit`
- Variable references: looked up from the environment
- All other expression forms: assigned fresh type variables (to be unified in later passes)

The type checker stores inferred types in a `TypeEnv` — a map from variable names to their resolved types. This environment is used by downstream passes for code generation.

## Resource Affinity

Every type has an associated **affinity** determining how values of that type may be used:

| Affinity | Types | Rules |
|----------|-------|-------|
| **Normal** | `Int`, `Bool`, `Char`, `Unit`, pure structs, tuples of Normal | Baseline — no restriction |
| **Affine** | `Affine(T)` | Used at most once |
| **Persistent** | `List(T)` | Reference-counted, shared |

The affine type system ensures that resources are never silently duplicated. `Affine(T)` is a zero-cost compile-time marker — using an affine value more than once produces a compile-time error.

See the [Affine Types](affine.md) chapter for the full resource-tracking model.

## Next

- [**Functions**](functions.md) — `def`, `fn`, closures, and recursion
