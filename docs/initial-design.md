# Dew Language Design Document (Complete)

## 1. Language Positioning

Dew is a pure functional, strongly-typed, statically-typed language with **Lazy Evaluation + Affine Types + Closures** as its core design tenets.

```
Long-term architecture:
Dew (user language)
  ↕
Dew IR (canonical semantic layer)
  ↕
Rx / C (compilation targets)
```

Dew serves two roles:
- **Programming Language**: directly write programs
- **Analysis Language**: analyze resource safety of Rx/C code

---

## 2. Core Semantics

### 2.1 Immutability

All values are immutable once created. "Mutation" is achieved through rebinding (shadowing):

```dew
def x = 1       // x bound to value 1
def x = x + 1   // x rebound to value 2, not mutation of the old value
```

- No `const` keyword (immutability is the default)
- No `mut` keyword
- No `var` / `let mut`

### 2.2 Lazy Evaluation

**Implicit lazy evaluation**, no explicit keywords required.

- **Strictness Analysis** automatically determines evaluation timing
- Runtime Thunk three states: `Thunk` → `Evaluating` → `Evaluated`
- Supports Memoization (caches result after evaluation)
- Compile-time detection of circular dependencies

### 2.3 Strict Evaluation

```dew
force(expr)   // Built-in function, forces evaluation
```

### 2.4 Resource Type System

All types belong to one of three resource kinds:

| Kind | Description | Examples |
|------|-------------|----------|
| Copyable | Can be copied arbitrarily | Int, Bool, Char, Unit, pure structs |
| Affine | At most once | Box(T) |
| Persistent | Shareable, reference-counted | List, Map, Set |

**Derivation rules:**
- Primitive types (Int, Bool, Char, Unit) → Copyable
- `Box(T)` → Affine
- struct: all fields Copyable → Copyable; contains any Affine field → Affine
- enum: same as struct
- Closure: captures all Copyable → Copyable; captures any Affine → Affine (FnOnce)

**Affine behavior:**
```dew
def x = Box(1)
def y = x      // ownership transfers from x to y
// x cannot be used anymore — compile error
```

**End of scope:** compiler auto-inserts `drop` calls for unconsumed Affine values. `drop` is a compiler-generated type-specialized function, not exposed to users.

### 2.5 Closures

Closures capture the **value** of external variables, not references:

```dew
def x = 1
def f = fn { x }    // captures the value 1
def x = 2           // rebinds x
f()                 // returns 1
```

- FnOnce auto-derivation: captures Affine → Affine closure (single-call)
- All captures Copyable → Copyable closure (multi-call)
- Implicit capture, no `move` keyword needed

---

## 3. Type System

### 3.1 Hindley-Milner Type Inference

```dew
def id = fn(x) { x }           // a -> a
def add = fn(x, y) { x + y }   // Int -> Int -> Int
```

- Parametric polymorphism (generics)
- Type annotations optional
- Generic parameters use parentheses: `List(Int)`, `Option(T)`

### 3.2 Primitive Types

```
Int     // Signed 64-bit integer
Bool    // True | False
Char    // Unicode character
Unit    // Unit type, constructor: Unit
```

**No Float in initial version.** String literals are `Array(Char, N)` — no `String` type name.

### 3.3 Operators

**Only for primitive types. Non-overloadable.**

| Category | Operators | Applicable Types |
|----------|-----------|------------------|
| Arithmetic | `+ - * / %` | Int |
| Comparison | `< > <= >=` | Int, Char |
| Equality | `== !=` | Int, Bool, Char, Unit |
| Logical | `&& \|\|` | Bool |
| Logical NOT | `not` built-in function | Bool |
| Pipeline | `->` | All types |

**Built-in operators can be infix. User-defined operator functions cannot be infix.**

### 3.4 Struct

```dew
struct Point {
    x: Int,
    y: Int,
}
```

**Compiler auto-generates:**
- Constructor: `Point : (Int, Int) -> Point`
- Field accessors: `Point_x : Point -> Int`, `Point_y : Point -> Int`
- Field updaters: `Point_with_x : (Point, Int) -> Point`

**Construction and access:**
```dew
def p = Point(1, 2)     // construction
def x = p.x             // field access, equivalent to Point_x(p)
def p2 = p { x = 10 }   // field update, returns new value
```

### 3.5 Enum

```dew
enum Option {
    Some(Int),
    None,
}
```

**Compiler auto-generates constructors:** `Some : Int -> Option`, `None : () -> Option`

```dew
def x = Some(42)
def y = None          // type inferred from context
def y: Option = None  // explicit annotation
```

### 3.6 Tuples

```dew
def p = (42, "hello")        // (Int, Array(Char, 5))
def (x, y) = p               // destructuring
def p2 = p { 0 = 10 }        // update
```

- Two or more elements. No unit tuple (use `Unit`), no single-element tuple.
- `_` discards unwanted values
- No numeric index access

---

## 4. Functions

### 4.1 Function Definition

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
```

- First-class functions
- Higher-order functions supported
- No currying (full arguments required)
- Zero-arg functions may omit parentheses: `fn { body }`

### 4.2 Recursion

```dew
def fact = fn(n: Int) -> Int {
    if n == 0 { 1 } else { n * fact(n - 1) }
}
```

- Compiler auto-detects self-reference, no `rec` keyword needed
- Mutual recursion supported
- Tail-call optimization

### 4.3 Anonymous Recursion (fix)

```dew
def result = fix loop {
    fn(x: Int) -> Int {
        if x < 10 { loop(x + 1) } else { x }
    }
}(0)
```

- `loop` visible only within the `fix` block
- Used for one-shot loops

### 4.4 Borrow Parameter (`&` sugar)

```dew
def translate = fn(&p: Point, dx: Int, dy: Int) -> Point {
    &p { x = p.x + dx, y = p.y + dy }
}
```

**Desugaring rules:**
```
f(&p: T, ...) -> U     →    f(p: T, ...) -> (T, U)
call f(&x, ...)        →    def x = f(x, ...)
```

**Restrictions:**
- `&` only for parameters
- `&` decorates parameter name (`&p: Point`), not type (`p: &Point`)
- Inside function body: `&p = ...` or `&p { ... }` rebinds the parameter

### 4.5 Pipeline Operator

```dew
e -> f           →  f(e)
e -> f(a, b)     →  f(a, b, e)
```

- Lowest precedence, left-associative
- Right side must be a function call or identifier
- Left side inserted as the **last argument** of the right-side function

### 4.6 return

```dew
def f = fn(x: Int) -> Int {
    if x < 0 { return 0 }
    x + 1
}
```

Optional, for early exit.

---

## 5. Control Flow

### 5.1 match

```dew
match expr {
    pattern1 => result1,
    pattern2 => result2,
    _ => default,
}
```

### 5.2 if/else

Syntactic sugar for `match` on `Bool`:

```dew
if cond { a } else { b }
// equivalent to
match cond { True => a, False => b }
```

### 5.3 Loops

**No loop statements.** Use recursion or standard library higher-order functions.

| Imperative | Dew equivalent |
|------------|---------------|
| `for x in xs` | `xs -> foreach(f)` |
| `xs.map(f)` | `xs -> map(f)` |
| `xs.filter(p)` | `xs -> filter(p)` |
| `xs.fold(init, f)` | `xs -> fold(init, f)` |
| `while cond` | recursion / `fix` |
| `for(init;cond;step)` | recursion / `fix` |

---

## 6. Identifiers and Operators

### 6.1 Identifiers

```
Alphabetic:  (Letter | '_') (Letter | Digit | '_')*
Operator:    OperatorChar+
```

Operator characters: `+ - * / % < > = ! & |`

### 6.2 Operator Functions

Users can define operator-named functions (e.g., `++`). Built-in operators are not overrideable. Overriding standard library functions emits a Warning.

---

## 7. I/O System

### 7.1 Unified Interface

```dew
Stdin(&v: T)     // read from stdin
Stdout(v: T)     // write to stdout
```

### 7.2 Supported Types

| Type | Stdin | Stdout |
|------|-------|--------|
| Int | ✅ | ✅ |
| Bool | ✅ | ✅ |
| Char | ✅ | ✅ |
| Unit | — | ✅ |
| Array(T, N) (T primitive) | ✅ | ✅ |
| List(T) (T primitive) | — | ✅ |

Custom types not supported. Array/List output all elements. Infinite List caught at compile-time by circular dependency detection.

---

## 8. Arrays and Collections

### 8.1 Array

```dew
type Array(T, N)   // T: element type, N: compile-time constant (N > 0)

def arr = [1, 2, 3]   // Array(Int, 3)
def x = arr[0]         // read
def arr2 = arr { [0] = 10 }  // update, returns new array
```

### 8.2 List

```dew
type List(T) = Cons(T, List(T)) | Nil

def xs = Cons(1, Cons(2, Cons(3, Nil)))
```

### 8.3 Standard Library Functions

Separate `map`, `filter`, `fold`, `foreach` for Array and List.

Conversion: `array_to_list`, `list_to_array`.

### 8.4 Strings

String literal `"hello"` is `Array(Char, 5)`. No `String` type name.

---

## 9. Type Reflection

### 9.1 type_of

```dew
def type_of = fn(x: T) -> TypeRepr { ... }  // compiler built-in
```

Compile-time constant folding, zero runtime overhead.

### 9.2 Type Dispatch

```dew
match type_of(x) {
    IntT => ...,
    BoolT => ...,
    ...
}
```

---

## 10. Memory Management

- Copyable values: stack-allocated
- Affine values: compile-time determined drop points, auto-inserted `drop`
- Persistent values: reference-counted, immutability guarantees no cycles

**No tracing GC.**

---

## 11. Package Management

```dew
import "std/io.dw"
import "std/list.dw"
```

- `import` loads files and merges symbol tables
- Top-level only allows declarations (`def`, `import`, `struct`, `enum`)

---

## 12. Error Handling

- Compile-time: type errors, exhaustiveness checking, circular dependency detection
- Runtime: no panic implementation. Division by zero, stack overflow handled by the OS.

---

## 13. Phased Implementation

| Phase | Contents |
|-------|----------|
| **Phase 1** | Core language: HM, ADT, lazy evaluation, pipeline, primitive types, I/O (primitive types) |
| **Phase 2** | Resource system: Affine, Box(T), `&` sugar |
| **Phase 3** | Collections & iteration: Array, List, higher-order functions, `fix`, `type_of` |
| **Phase 4** | Rx/C interop |
| **Phase 5** | File I/O, concurrency |
| **Phase 6** | Typeclass |

---

## 14. Keywords and Built-ins

### Keywords
```
def, fn, struct, enum, match, if, else, return, fix,
import, force, true, false
```

### Built-in Functions
```
force, not, type_of, Stdin, Stdout
```

### Operators
```
->  pipeline
+ - * / %   arithmetic
< > <= >=   comparison
== !=       equality
&& ||       logical
.           field access
[]          subscript
{}          update
```

---

## 15. Out of Scope

- Float type
- Loop syntax (`for`/`while`)
- Mutable variables, `const` keyword
- Unit tuple, single-element tuple
- Type aliases, associated types
- Explicit lifetime annotations
- True reference types
- GC (tracing garbage collection)
- Panic system

---

## 16. Core Design Principle

Any proposed feature must answer:

> **Does it break the coherence of Lazy + Affine + Closure?**

- Immutable values, ownership passing
- All borrows desugar into ownership passing
- Syntactic sugar does not change underlying semantics
- Type system maintains HM simplicity
- Operators and syntax remain minimal