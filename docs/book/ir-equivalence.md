# Why Tree IR and Flat IR Are Equivalent

The nested tree IR and the flat instruction IR look different, but they are
mathematically the same thing — two notations for the same underlying
structure. This document explains why.

## 1. The Three Forms

Given `(1 + 2) * 3`, here are three ways to write it:

| Form | Representation |
|------|---------------|
| **Tree** (AST) | `Mul(Add(1, 2), 3)` — nested, hierarchical |
| **ANF** (A-Normal Form) | `def t1 = add(1, 2) in def t2 = mul(t1, 3) in t2` |
| **SSA** (our flat IR) | `%t1 = add 1, 2; %t2 = mul %t1, 3; ret %t2` |

The tree is **block-like** (nested). The flat IR is **instruction-like**
(sequential). They differ **only in notation**.

## 2. The Translation: From Tree to Flat

The flattening algorithm is mechanically simple. For any expression `e`:

```
flatten(e):
    if e is an atom (literal, variable):
        return e
    if e is op(e1, e2):
        t1 = flatten(e1)       # recursive call, returns a name
        t2 = flatten(e2)       # recursive call, returns a name
        t  = fresh_name()      # allocate a new temporary
        emit(t = op t1, t2)     # emit one flat instruction
        return t               # return the name for the parent
```

This is **syntax-directed**: each tree node becomes exactly one flat
instruction. The translation is a bijection — you can go from tree to flat
and back without loss of information.

### Why It's a Bijection

**Tree → Flat**: Replace each internal node with a fresh name and emit an
instruction. The tree structure becomes a linear sequence with named
intermediates.

**Flat → Tree**: Each instruction `t = op a1, a2` becomes a tree node
`op(a1, a2)`. Wherever `t` is used later, substitute the tree. Since every
name is defined exactly once (SSA), this substitution is unambiguous.

```
Flat:   %t1 = add 1, 2      →    Tree:  mul(%t1, 3)
        %t2 = mul %t1, 3                 where %t1 = add(1, 2)
        ret %t2                      = mul(add(1, 2), 3)
```

No information is created or destroyed. The flat form is a **linear spelling**
of the tree.

## 3. ANF = SSA = CPS

There are three well-known "normal forms" for functional programs. They are
all equivalent at a deep level.

### A-Normal Form (ANF)

Every non-atomic expression is named by a `let`:

```
def t1 = add(1, 2) in
def t2 = mul(t1, 3) in
t2
```

Defining rule: all arguments to operations must be **atoms** (variables or
literals). No nested expressions.

### Static Single Assignment (SSA)

Every variable is assigned exactly once. Uses are variable references.

```
%t1 = add 1, 2
%t2 = mul %t1, 3
ret %t2
```

Defining rule: exactly one definition per variable. For control flow joins,
use φ-nodes: `%x = φ [%a from block1], [%b from block2]`.

### Continuation-Passing Style (CPS)

Every function call passes an explicit continuation — a λ that receives the
result:

```
add(1, 2, λt1. mul(t1, 3, λt2. halt(t2)))
```

Defining rule: no function ever returns. Control is transferred by calling
the continuation.

### The Isomorphisms

These three forms are notationally different but semantically identical:

| ANF | SSA | CPS |
|-----|-----|-----|
| `def t1 = add(1, 2) in e` | `%t1 = add 1, 2; e` | `add(1, 2, λt1. e)` |
| nested `let` for sequencing | sequential instructions | nested continuation λs |
| `if` with two branch bodies | branch + φ at join | conditional continuation passing |

The correspondence was established in a series of classic results:

- **Flanagan, Sabry, Duba & Felleisen (1993)**: "The Essence of Compiling
  with Continuations" — proved CPS and ANF are equivalent via a direct
  syntactic translation in both directions.

- **Kelsey (1995)**: "A Correspondence between Continuation Passing Style
  and Static Single Assignment Form" — proved SSA and CPS are equivalent.
  Every CPS term is an SSA program; every SSA program is a CPS term in
  disguise.

- **Appel (1998)**: "SSA is Functional Programming" — SSA is literally just
  functional programming where basic blocks are continuations and φ-nodes
  are function parameters at join points.

## 4. The Monadic Structure

The flattening from tree to flat is an instance of the **continuation monad**
(Moggi 1991). Writing `M a` for "a computation that produces an `a`":

```
type M a = (a → InstructionSeq) → InstructionSeq
```

Then `flatten` is the monadic **bind** operator `(>>=)`:

```
flatten(op(e1, e2))
  = flatten(e1) >>= λt1.
    flatten(e2) >>= λt2.
    def t = fresh() in
    emit(t = op t1, t2) >>= λ_.
    return t
```

The tree is an expression in the **free monad** over the operation signature.
The flat IR is the same expression evaluated into the **continuation monad**.
The translation is a monad morphism, and monad morphisms preserve semantics.

## 5. What Changes: Implicit vs. Explicit Ordering

The real difference between tree and flat IR is **evaluation order**:

- **Tree IR**: evaluation order is **implicit** — determined by the
  evaluator's recursion strategy (left-to-right, right-to-left, or parallel).
- **Flat IR**: evaluation order is **explicit** — instructions execute in
  sequence, and the programmer/compiler controls the order.

Flattening **fixes** an evaluation order. This is why flat IR is the
preferred form for code generation: assembly instructions execute
sequentially, and the flat IR makes that sequence explicit.

But mathematically, choosing an evaluation order does not change the
**denotation** (the value computed). It only changes the **operational**
details (register pressure, instruction scheduling, etc.). For a pure
language like Dew, all evaluation orders produce the same result.

## 6. Control Flow: The Only Non-Trivial Bit

For straight-line code (no `if`), the tree ↔ flat translation is trivial:
every tree becomes a sequence of instructions.

For control flow (`if` / `else`), the tree IR nests branches:

```
If(cond, then_body, else_body)
```

The flat IR splits these into **basic blocks** with explicit labels:

```
block0:  branch cond, block1, block2
block1:  <then_body>; jump block3
block2:  <else_body>; jump block3
block3:  <continuation>
```

This is the same transformation: the implicit control flow of the tree
becomes explicit labeled blocks. The φ-like convention (both branches write
to the same temp) handles value flow across the join.

In CPS, this same structure looks like:

```
cond(λb. if b then then_body(λv. cont(v))
               else else_body(λv. cont(v)))
```

The continuation `cont` at the join point is a function. In SSA, it's a
basic block. In ANF, it's a `let` body. Same thing, different clothes.

## 7. Summary

| Aspect | Tree IR | Flat IR | Why equivalent |
|--------|---------|---------|---------------|
| Expressions | Nested nodes | Named temps + instructions | Each node → one instruction |
| Sequencing | Implicit (tree structure) | Explicit (instruction order) | Monadic bind linearizes |
| Naming | Implicit (structural position) | Explicit (temp names) | Fresh name per subexpression |
| Control flow | Nested `If` nodes | Basic blocks + branches | CPS transform |
| Values across branches | Implicit (tree position) | φ-like shared temp | Join-point continuation |
| Thunks | `Suspend` wrapper node | Separate `thunk` function | Lambda lifting |

The flat IR is the tree IR with three things made explicit:
1. **Names** (every subexpression gets a temp)
2. **Order** (instructions execute sequentially)
3. **Control flow** (branches and labels instead of nesting)

None of these changes the meaning of the program. They only change how the
meaning is **represented**.

### References

- Flanagan, C., Sabry, A., Duba, B. F., & Felleisen, M. (1993). "The
  Essence of Compiling with Continuations." *PLDI 1993*.
- Kelsey, R. A. (1995). "A Correspondence between Continuation Passing
  Style and Static Single Assignment Form." *ACM SIGPLAN Notices*.
- Appel, A. W. (1998). "SSA is Functional Programming." *ACM SIGPLAN
  Notices*.
- Moggi, E. (1991). "Notions of Computation and Monads." *Information and
  Computation*.
