# Structs and Enums

Dew supports algebraic data types through `struct` and `enum` declarations.

## Structs

Structs are named record types with positional fields. They are declared at the top level:

```
struct Name { field1: Type1, field2: Type2, ... }
```

### Declaration

```dew
struct Point { x: Int, y: Int }
struct Person { name: String, age: Int }
```

Fields are separated by commas (optional trailing comma allowed). Each field must have an explicit type annotation.

### Construction

Struct values are constructed by calling the struct name as a function with positional arguments:

```dew
def p = Point(3, 4);
def q = Point(10, 20);
```

Internally, struct construction is compiled as function application: `Point(3, 4)` becomes `Apply(Var("Point"), [Lit(3), Lit(4)])`. During evaluation, the evaluator recognizes capitalized names and constructs a `Value::Struct`.

### Field Access

Access fields by name using dot notation:

```dew
p.x      // 3
p.y      // 4
```

The evaluator looks up the field name in the struct's field name list and returns the value at the corresponding positional index.

### Field Update

Structs are immutable, but you can create a modified copy using the update syntax:

```
expr { field1 = value1, field2 = value2 }
```

```dew
def q = p { x = 10 };  // Point { x: 10, y: 4 }
```

The original struct is unchanged; this produces a new struct with the specified fields replaced.

### Complete Example

```dew
{{#include ../../../examples/structs/point_dist.dew}}
```

## Enums

Enums are tagged unions — each variant can optionally carry a payload type:

```
enum Name { Variant1(Type), Variant2, Variant3(Type) }
```

### Declaration

```dew
enum Option { Some(Int), None }
enum Result { Ok(Int), Err(String) }
enum Color { Red, Green, Blue }
```

Variants without payloads are unit-like variants. Variants with payloads carry a single typed value.

### Pattern Matching on Enums

Use `match` with enum variant patterns:

```dew
enum Option { Some(Int), None }

def unwrap_or = fn(opt: Option, default: Int) -> Int {
  match opt {
    Some(val) => val,
    None => default,
  }
}
```

### Variant Patterns

| Pattern | Matches |
|---------|---------|
| `Variant` | Unit-like variant (no payload) |
| `Variant(pat)` | Variant with payload, matched against `pat` |

The payload pattern `pat` can itself be any pattern, including wildcards, variables, or nested patterns.

## AST and IR Representation

### AST (Source)

```rust,ignore
Decl::Struct { name, fields: Vec<(String, Type)> }
Decl::Enum   { name, variants: Vec<Variant> }

Expr::StructCons   { name, fields: Vec<Expr> }     // Point(x, y)
Expr::FieldAccess  { expr, field }                  // p.x
Expr::StructUpdate { expr, updates }                // p { x = 10 }
```

### IR (Thunk Graph)

```rust,ignore
Ir::Struct      { name, fields: Vec<Ir> }           // Struct Point [x, y]
Ir::FieldAccess { expr, field }                      // FieldAccess %p .x
Ir::StructUpdate { expr, updates }                   // StructUpdate %p [(x, val)]
Ir::EnumVariant { enum_name, variant, payload }      // EnumVariant Option::Some val
```

### Runtime Values

```rust,ignore
Value::Struct { name, field_names, fields: Vec<Value> }
Value::EnumVariant { enum_name, variant, payload: Option<Box<Value>> }
```

## Struct Constructor as Application

A key design decision: **struct construction is function application**. When the evaluator encounters `Apply(Var("Point"), [a, b])` where `"Point"` starts with an uppercase letter, it constructs a `Value::Struct` instead of attempting a function call. This unifies the syntax — `Name(args...)` means struct construction for uppercase names and function application for lowercase names.

## Next

- [**Tuples and Arrays**](tuples-arrays.md) — compound data without nominal types
