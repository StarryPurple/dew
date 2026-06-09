# Flat IR

The flat IR is an SSA-like, basic-block-based intermediate representation intended as a compilation target. Unlike the tree IR (which mirrors the AST), the flat IR is:

- **Flat**: every sub-expression has a named temporary, no nesting
- **Block-structured**: control flow uses explicit basic blocks and branches
- **Explicit thunks**: thunks and closures are separate functions with captured environments

This is the IR you'd translate to assembly or bytecode.

## Output Modes

```bash
dew file.dew --emit=flat        # Human-readable text (LLVM-style)
dew file.dew --emit=flat-json   # Machine-readable JSON
```

## IR Structure

```
Module
  functions: [Function]

Function
  name: String          # @top, @f0, @f1, ...
  kind: UserFn | Thunk  # regular function or lazy thunk
  params: [String]      # formal parameter names
  captures: [String]    # captured variable names (for diagnostics)
  blocks: [BasicBlock]

BasicBlock
  label: String         # L0, B0, B1, ...
  instructions: [Instruction]
  terminator: Terminator

Instruction = { dest: String, op: Op, args: [Arg] }

Arg = Temp(name) | Lit(i64) | LitBool(bool) | LitNil | LitUnit

Terminator = Ret { arg }
           | Branch { cond, true_label, false_label }
           | Jump { label }
```

## Operations

| Op | Args | Meaning |
|----|------|---------|
| `lit` | immediate | Load a literal value |
| `move` | arg | Copy / rename |
| `add`, `sub`, `mul`, `div` | lhs, rhs | Arithmetic |
| `eq`, `lt`, `gt` | lhs, rhs | Comparison → Bool |
| `closure` | func_name, captures... | Create a closure |
| `call` | fn, arg | Call a function |
| `thunk_alloc` | thunk_name, captures... | Allocate a lazy thunk |
| `thunk_force` | thunk | Force a thunk to get its value |
| `box`, `unbox` | value | Allocate/deallocate linear box |
| `cons` | head, tail | List cons cell |
| `head`, `tail`, `isnil` | list | List accessors |
| `dup` | value | Duplicate an unrestricted value |

## Example: Arithmetic

Source: `(1 + 2) * 3 - 2`

```
func @top():
  L0:
    %t0 = lit 1
    %t1 = lit 2
    %t2 = add %t0, %t1
    %t3 = lit 3
    %t4 = mul %t2, %t3
    %t5 = lit 2
    %t6 = sub %t4, %t5
    ret %t6
```

## Example: Conditional with Basic Blocks

Source: `if (1 < 2) { 100 } else { 200 }`

```
func @top():
  L0:
    %t0 = lit 1
    %t1 = lit 2
    %t2 = lt %t0, %t1
    branch %t2, B0, B1          # conditional branch
  B0:                           # then-block
    %t3 = lit 100
    %t4 = move %t3              # write result to shared phi temp
    jump B2                     # jump to join
  B1:                           # else-block
    %t5 = lit 200
    %t4 = move %t5              # write result to same phi temp
    jump B2
  B2:                           # join block (phi-like)
    %t6 = move %t4              # load the result
    %t7 = thunk_force %t4       # force (from strictness)
    ret %t7
```

## Example: Lazy Thunks

Source: `def id = fn (x: Int) { x }; id(42)`

```
func @f0(x):                    # the lambda
  L0:
    ret x

thunk @f1():                    # argument thunk for 42
  L0:
    %t2 = lit 42
    ret %t2

func @top():
  L0:
    %t6 = thunk_alloc @f1       # allocate thunk
    %t7 = call %t5, %t6         # call id(thunk)
    %t8 = thunk_force %t7       # force the result
    ret %t8
```

## Design Notes

### Phi Placeholder Convention

Both branches of an `if` write their result to the **same temp name** (e.g., `%t4` above), then jump to a join block that reads it. This is a simplified convention — proper SSA would use explicit phi nodes (`%t4 = phi [%t3 from B0], [%t5 from B1]`).

### Thunks as Functions

Every `Suspend` in the tree IR becomes a `thunk` function in the flat IR. The thunk function's body is the suspended expression; its parameters are the captured variables. `thunk_alloc` creates the thunk; `thunk_force` evaluates and memoizes it.

### No Nested Expressions

All arguments are atoms (temporaries or literals). There is no `add (mul %a, %b), %c` — you must name the intermediate result. This is the defining property of ANF/SSA form.

## JSON Format

The same structure serialized as JSON:

```json
{
  "functions": [{
    "name": "@top",
    "kind": "UserFn",
    "params": [],
    "captures": [],
    "blocks": [{
      "label": "L0",
      "instructions": [
        {"dest": "%t0", "op": "lit", "args": [1]},
        {"dest": "%t1", "op": "lit", "args": [2]},
        {"dest": "%t2", "op": "add", "args": ["%t0", "%t1"]}
      ],
      "terminator": {"kind": "Ret", "arg": "%t2"}
    }]
  }]
}
```

Flat JSON is suitable for consumption by code generation tools, JIT compilers, or analysis passes.
