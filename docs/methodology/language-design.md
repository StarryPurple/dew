# Language Design Methodology

This document defines **how we design the Dew language**. It is the canonical reference for anyone proposing a feature, syntax, or type system change. Read this before designing anything.

---

## Core Philosophy

### 1. Reality First

Language features exist to solve **real user problems**, not to satisfy completeness aesthetics.

Before designing anything, answer:

- **Who** is the user? What programs do they write? What is their skill level?
- **What** concrete pain points do they face with existing languages?
- **Why** does this feature belong in Dew specifically — why can't it be solved by a library or convention in an existing language?

**Anti-pattern**: Adding a feature because "language X has it."

### 2. Semantics First

Design the **semantic model** before the **syntax**. Syntax is the final rendering; semantics is the truth.

The design path is always:

```
Problem domain → Required semantic primitives → Type system rules → Syntax
```

Every piece of syntax must have a precise desugaring into a simpler core calculus. If you cannot write the desugaring rule, the syntax is not ready.

**Example of correct desugaring** (from Dew's borrow sugar):
```
f(&p: T) -> U    desugars to    f(p: T) -> (T, U)
```

**Anti-pattern**: Designing syntax first, then trying to retrofit semantics onto it.

### 3. Abstraction First

Language rules must generalize across all programs, not just the examples at hand.

**Wrong**: "Because `affine_consume.dew` uses field access in arithmetic, affine field access should allow arithmetic."

**Right**: "Field access on affine types transfers ownership. The consumed variable is unavailable for subsequent use. This rule holds for all `#[Affine]` structs in all contexts."

**Test**: If a rule changes when you swap one `#[Affine]` struct for another, the rule is overfitted.

### 4. Minimality

The core design principle of Dew (from its original spec):

> **Does it break the coherence of Lazy + Affine + Closure?**

Every proposed feature must pass this gate. The three pillars — implicit lazy evaluation, affine resource types, and value-capturing closures — form an integrated semantic system. A feature that breaks one pillar breaks the coherence.

When two designs are semantically equivalent, prefer the one with fewer primitives. Dew's Thunk Graph IR uses 6 primitives to express all lazy evaluation — not 60. That ratio is the design standard.

---

## Design Process: The Five Steps

For every language feature or type system change:

| Step | Action | Language Design Meaning |
|------|--------|------------------------|
| 1. Understand | What user scenario does this address? | Write a concrete program the user wants to write but cannot today. |
| 2. Explain | What is the semantic model? | Define the feature in terms of the core calculus. Write operational semantics or typing rules. |
| 3. Evidence | How do other languages handle this? | Survey PL literature: Haskell, Rust, OCaml, Idris, Linear Haskell, Granule, etc. Identify what works and what fails. |
| 4. Verify | Does it work on edge cases? | Write minimal examples. Test interaction with lazy evaluation, affine types, closures, recursion. |
| 5. Conclude | Is it accepted into the language? | Document the feature with: semantics, syntax, typing rules, known limitations, interaction with other features. |

**Never skip step 1.** A feature without a user scenario is a solution looking for a problem.

---

## Decision Evaluation

### Confidence Labels

Every design conclusion must carry a confidence tag:

| Label | Meaning |
|-------|---------|
| **High** | Supported by PL theory literature AND at least one mature language implementation |
| **Medium** | Logical reasoning supports it, but no prototype exists yet |
| **Low** | Speculative; requires prototyping to validate |

Uncertainty is not an error. Failing to label uncertainty **is** an error.

### Multiple Hypotheses

For every non-trivial design decision, maintain at least 2–3 alternative approaches before converging. For example, affine type checking:

- **A**: Full linear type checking in the type checker (like Linear Haskell)
- **B**: Use-once counting pass (simpler, less precise)
- **C**: Attribute propagation + IR-level drop insertion (current approach)

Do not default to the first idea. Evaluate tradeoffs: complexity vs. precision vs. implementation cost.

### Question the Question

Before solving a design problem, ask whether the problem is well-defined:

- Is the goal reasonable?
- Are the constraints real or assumed?
- Is this the right problem to solve at this phase?
- Could the problem be avoided entirely by a different architecture choice?

Many design failures come from solving the wrong problem, not from solving it badly.

---

## Edge Case Analysis

Every type rule, syntax rule, and evaluation rule must be stress-tested against:

| Category | Questions to Ask |
|----------|-----------------|
| **Boundary values** | What happens exactly at the threshold? |
| **Cross-feature interaction** | How does this interact with lazy evaluation? With affine types? With closures? With recursion? |
| **False positives** | What legal programs would be incorrectly rejected? |
| **False negatives** | What illegal programs would be incorrectly accepted? (unsoundness) |
| **Missing data** | What happens when a required property is unknown (e.g., unresolved type variable)? |

### Soundness as a Design Constraint

Dew aims for type soundness: well-typed programs do not go wrong. Every type system rule must be defensible against counterexamples. If a rule admits a program that would cause a runtime type error, the rule is wrong — regardless of how convenient it is.

---

## Semantics Reference

### The Three Pillars

Dew's semantic model rests on three integrated components:

1. **Implicit Lazy Evaluation** — Call-by-need with strictness analysis. The compiler classifies contexts as strict or lazy and inserts Suspend/Force automatically. The user writes no laziness annotations.

2. **Affine Resource Types** — `#[Affine]` attribute marks types with at-most-once semantics. Infectious: containing any affine field makes the whole struct affine. Affine closure captures produce FnOnce; pure captures produce Fn (multi-call).

3. **Value-Capturing Closures** — Closures capture the **value** of external variables at definition time, not references. Immutability + ownership passing means no aliasing issues.

### Design Coherence Check

For any proposed feature, verify:

```
Lazy ⊗ Feature  — Does it break call-by-need semantics?
Affine ⊗ Feature — Does it break use-at-most-once guarantees?
Closure ⊗ Feature — Does it break value-capture semantics?
```

If any check fails, the feature requires redesign.

---

## External Knowledge

Language design requires broad PL theory knowledge. Do not reason solely from Dew's old codebase.

Reference domains:

- **Type systems**: Hindley-Milner, bidirectional typing, dependent types, refinement types, linear types
- **Lazy evaluation**: Call-by-need, thunk update protocols, STG machine, strictness analysis
- **Ownership**: Rust borrow checker, Linear Haskell, affine types in ATS, Granule's graded modalities
- **IR design**: CPS, ANF, SSA, Sea of Nodes, Thunk Graph IR
- **Compiler architecture**: Nanopass, micropass, classical multi-stage

The old Dew codebase is **one source of evidence**, not the only truth. PL literature, production compilers, and formal proofs are equally valid sources.

---

## Theoretical Design Research

When the designer is uncertain about PL theory — e.g., how HM and TypeClass interact, where `#[Affine]` should attach, or how to resolve a type system tension — the agent must provide **research-assisted reasoning**, not guesses.

### Research Protocol

For any theoretical design question:

1. **Frame the question precisely.** "Should `#[Affine]` attach to the type declaration or individual fields?" — not "how does affine work?"

2. **Search existing solutions.** Use web search, PL literature, and open-source implementations. What do Haskell's `LinearTypes`, Rust's ownership, or Clean's uniqueness types do? What are the tradeoffs they encountered?

3. **Map the design space.** Enumerate at least 2 options with:
   - Semantics (what does it mean?)
   - Implementation cost (how hard to build?)
   - User experience (how hard to use correctly?)
   - Interaction with Dew's pillars (Lazy ⊗ Affine ⊗ Closure)

4. **Apply logical reasoning.** For each option, reason forward:
   - What programs does it enable?
   - What programs does it reject? (both correctly and incorrectly)
   - What new edge cases does it create?

5. **Recommend with confidence.** Present the options with confidence labels (High/Medium/Low), recommend one, and explain why.

### Attribute Semantics: Decision Framework

When designing attribute-based type system features (like `#[Affine]`), the fundamental question is: **what entity does the attribute bind to?**

| Scope | Semantics | Example |
|-------|-----------|---------|
| **Type-level** | Attribute on `struct`/`enum` declaration. All instances carry the property. | `#[Affine] struct Box(T) {..}` — every `Box` value is affine |
| **Field-level** | Attribute on individual fields. A struct containing any such field inherits the property. | `struct Pair { x: Int, #[Affine] y: Int }` — `Pair` is affine because of `y` |
| **Use-site** | Attribute at binding or argument position. The property is a mode, not a type. | `def x: affine T = ...` — `x` is affine regardless of `T`'s declaration |

**Decision criteria:**

- Use **type-level** when: the semantics are inherent to the type. `Box(T)` is always affine — it makes no sense to have a non-affine `Box`.
- Use **field-level** when: you need granular control within a type, and infection is well-defined. Adds compiler complexity (field-by-field tracking).
- Use **use-site** when: the property is about how a value is *used*, not what it *is*. Supports borrowing-like patterns without type modifiers. Adds user annotation burden.

**Dew's choice** (type-level `#[Affine]` on declarations + field-level `#[Affine]` for infection) is one point in this space. The design must be re-evaluated if user scenarios reveal friction.

### HM + TypeClass Integration

Hindley-Milner type inference and TypeClass (ad-hoc polymorphism) are a well-studied combination. The standard approach:

1. **TypeClass = predicate constraints on type variables.** A function `sort: Ord a => List(a) -> List(a)` has a constraint `Ord a` on the type variable `a`.

2. **Constraint gathering:** During type inference, when a TypeClass method is used, its constraint is added to the current environment.

3. **Constraint solving:** After HM unification, constraints are checked for satisfiability against known instances. Unsatisfied constraints → compile error.

4. **Dictionary passing:** In IR, constraints become implicit dictionary parameters. `Ord a` becomes a vtable-like struct containing the methods for type `a`.

**Key design decisions for Dew:**

| Decision | Options | Tradeoff |
|----------|---------|----------|
| Instance resolution | Global unique (Haskell) vs local (Scala) | Global: simple, no orphan headaches. Local: more flexible, complex coherence rules |
| Deriving | Auto-derive for common classes (Eq, Ord) | Reduces boilerplate; adds compiler complexity |
| Associated types | Type members in class definitions | More expressive but complicates inference |
| Multi-param classes | `class Convert a b where ...` | Useful but can make inference undecidable without functional dependencies |

For Dew's phase 6 TypeClass introduction, start with single-parameter, global-unique, no associated types. Extend based on user needs.

---

## Anti-Patterns

| Anti-Pattern | Why It Fails | Correct Approach |
|-------------|-------------|-----------------|
| Designing syntax first | Syntax without semantics is ambiguous | Define semantic model, then surface syntax |
| Pattern-matching on old code | Old implementation may be accidental, not intentional | Derive rules from language semantics, not from what `src/ir_gen.rs` line 42 does |
| "Language X does it this way" | Different languages have different coherence constraints | Understand *why* X does it, then evaluate against Dew's pillars |
| Adding features speculatively | Features without user scenarios create complexity debt | Every feature must trace back to a concrete program the user needs to write |
| Skipping edge case analysis | Undiscovered edge cases become runtime bugs or soundness holes | Actively search for counterexamples before committing to a design |
| Overfitting rules to examples | Rules that only work for the current test suite break in production | Abstract rules must generalize across all programs |

---

## Output Conventions

When presenting analysis or design proposals, use this structure:

1. **Problem** — What user scenario are we addressing? (concrete program)
2. **Semantic Model** — How does this work in the core calculus?
3. **Evidence** — What do other languages / PL theory say?
4. **Design** — Proposed syntax, typing rules, operational semantics
5. **Edge Cases** — Interaction with lazy evaluation, affine types, closures, recursion
6. **Confidence** — High / Medium / Low, with justification
7. **Alternatives Considered** — What other approaches were evaluated and why rejected?
