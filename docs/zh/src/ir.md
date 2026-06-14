# IR 设计

Dew 将源代码编译为 **Thunk Graph IR** —— 一种扁平的、基于标签的中间表示，专为惰性求值设计。IR 有两层：**图节点**（计算图）和 **IR 表达式**（thunk 体内部）。

## 架构

```
源码 → AST → IR Module → 求值器
                  │
                  ▼
           文本输出（--emit=text）
```

IR **Module** 是 `Node` 值的有序列表。每个节点要么是 thunk 生命周期操作，要么是名称绑定。Thunk 体包含 `Ir` 表达式树。

## 标签

Thunk 由标签标识 —— 不透明名称如 `%t0`、`%t1` 等：

```
%t0 = ThunkAlloc
Thunk %t0 { ... }
%t1 = Force %t0
Update %t0, %t1
Def "main" %t0
```

标签在编译期间顺序生成。

## 图节点（7 种变体）

### 惰性定义链（5 个节点）

纯 `def` 产生以下序列：

```
%t0 = ThunkAlloc          // 1. 分配 thunk 单元（→ Suspended）
Thunk %t0 {               // 2. 定义计算体
  ...
}
%t1 = Force %t0           // 3. 要求求值
Update %t0, %t1           // 4. 记忆化结果
Def "name" %t0            // 5. 将名称绑定到 thunk
```

| 节点 | 用途 | 求值器动作 |
|------|------|----------|
| `ThunkAlloc { label }` | 分配堆单元 | 创建 `Suspended { body: None }` |
| `ThunkDef { label, body }` | 存储计算体 | 设置 `body = Some(ir)` |
| `Force { label, target }` | 要求值 | 通过三状态 FSM 转换 thunk |
| `Update { label, value }` | 缓存结果 | 设置 thunk 状态为 `Evaluated(value)` |
| `Blackhole { label }` | 标记求值中 | 设置状态为 `Evaluating`（循环检测） |

### 名称绑定（2 个节点）

| 节点 | 用途 |
|------|------|
| `Def { name, label }` | 将 `name` 绑定到 thunk 的求值结果 |
| `StrictDef { name, value }` | 直接求值 Ir，绑定到 `name`（无 thunk） |

`StrictDef` 为包含 IO 的定义发出 —— 参见[严格 IO 规则](laziness.md#严格-io-规则)。

## IR 表达式（thunk 体内部）

`Ir` 枚举表示 thunk 体和 `StrictDef` 值中的计算：

| 变体 | 示例 | 描述 |
|------|------|------|
| `Lit(Lit)` | `Lit 42`, `Lit true` | 字面量值 |
| `Ref(Label)` | `Ref %t0` | 对自身 thunk 的自引用（递归） |
| `Var(String)` | `%x`, `%Stdin` | 变量引用 |
| `Lambda { params, body }` | `Lambda [n] ...` | 函数值 |
| `Apply { func, args }` | `Apply %f [%x]` | 函数应用 |
| `Let { name, value, body }` | `Let x = Lit 42 %x` | Let 绑定 |
| `If { cond, then, else_ }` | `If %c Then ... Else ...` | 条件表达式 |
| `Prim { op, args }` | `Prim add Lit 40 Lit 2` | 基本运算 |
| `Struct { name, fields }` | `Struct Point [%x, %y]` | 结构体字面量 |
| `FieldAccess { expr, field }` | `FieldAccess %p .x` | 字段访问 |
| `StructUpdate { expr, updates }` | （结构体更新） | 结构体字段更新 |
| `EnumVariant { ... }` | `EnumVariant Option::Some %v` | 枚举构造器 |
| `Match { scrutinee, arms }` | `Match %v [...]` | 模式匹配 |
| `Array(Vec<Ir>)` | `Array [Lit 'h', ...]` | 数组字面量 |
| `ArrayAccess { expr, index }` | （数组索引） | 数组元素访问 |
| `ArrayUpdate { expr, index, value }` | （数组更新） | 数组元素更新 |
| `Tuple(Vec<Ir>)` | `Tuple [%a, %b]` | 元组字面量 |
| `TupleUpdate { expr, index, value }` | （元组更新） | 元组元素更新 |
| `Return(Box<Ir>)` | `Return %v` | 提前返回 |
| `Fix { name, body }` | `Fix loop ...` | 不动点递归 |

### 辅助类型

**字面量**（`Lit`）：`Int(i64)`、`Bool(bool)`、`Char(char)`、`Unit`

**基本运算**（`PrimOp`）：`Add`、`Sub`、`Mul`、`Div`、`Rem`、`Lt`、`Gt`、`Le`、`Ge`、`Eq`、`Ne`、`And`、`Or`、`Not`

**值引用**（`ValueRef`）：要么是 `Lit`（内联常量），要么是 `Label`（对另一个 thunk 结果的引用）。用于 `Update` 节点。

**模式**（`Pattern`）：`Wildcard`、`Var(String)`、`Lit(Lit)`、`Struct(String, Vec<Pattern>)`、`EnumVariant(String, Option<Box<Pattern>>)`、`Tuple(Vec<Pattern>)`

## 编译：AST → IR

每个 `Decl` 编译为 `Node` 值序列。每个 `Expr` 编译为 `Ir` 值。

### Def 编译

对于惰性 def `def name = expr`：
1. `ThunkAlloc` —— 创建标签 `%ti`
2. `compile_expr(expr)` → `Ir` 体
3. `ThunkDef { %ti, body }` —— 将体存入 thunk
4. `Force { %tj, %ti }` —— 要求值
5. `Update { %ti, %tj }` —— 缓存结果
6. `Def { name, %ti }` —— 绑定名称

对于严格 def（包含 IO）：`StrictDef { name, compile_expr(expr) }` —— 无 thunk。

### 表达式编译

| AST 节点 | IR 输出 |
|----------|---------|
| `Int(n)` / `Bool(b)` / `Char(c)` / `Unit` | `Ir::Lit(...)` |
| `Var(name)` | `Ir::Var(name)` 或 `Ir::Ref(label)`（若是自引用） |
| `Fn { params, body }` | `Ir::Lambda { params, body }` |
| `App { func, args }` | `Ir::Apply { func, args }` |
| `Let { name, value, body }` | `Ir::Let { name, value, body }` |
| `If { cond, then, else_ }` | `Ir::If { cond, then, else_ }` |
| `BinOp { op, left, right }` | `Ir::Prim { op, [left, right] }` |
| `Pipe { left, right }` | `Ir::Apply { func: right, args: [...args, left] }` |
| `Match { scrutinee, arms }` | `Ir::Match { scrutinee, arms }` |
| `StructCons { name, fields }` | `Ir::Apply { func: Var(name), args: fields }` |

### 递归通过自引用

在 `def` 体内编译 `Var(name)` 且 `name` 匹配当前定义时，编译器发出 `Ir::Ref(label)` 指向 def 自身的 thunk 标签：

```
def fact = fn(n: Int) -> Int {
  if n == 0 { 1 } else { n * fact(n - 1) }
}

// 体内的 "fact" 编译为：Ref %t_fact
```

这使得求值器的三状态 FSM 能够通过 thunk 机制处理递归。

## 求值：三状态 FSM

每个 thunk 单元在其生命周期中经历三种状态：

```
                  Force
Suspended ─────────────────► Evaluating
    ▲                            │
    │                            │ 求值完成
    │         Update             ▼
    └─────────────────────── Evaluated
                                │
                          Force │ （缓存命中）
                                ▼
                         （返回缓存值）
```

### 状态机实现

```rust
enum ThunkState {
    Suspended { body: Option<Ir> },   // 尚未求值
    Evaluating,                        // 求值进行中
    Evaluated(Value),                  // 结果已缓存
}
```

### 循环检测

强制求值处于 `Evaluating` 状态的 thunk 会引发错误：

```
cyclic dependency at %t0
```

## 文本格式

`--emit=text` 标志以人类可读格式打印 IR，使用 2 空格缩进：

```
%t0 = ThunkAlloc
Thunk %t0 {
  Lambda [n]
  If Prim eq %n Lit 0
  Then Lit 1
  Else Prim mul %n Apply Ref %t0 [Prim sub %n Lit 1]
}
%t1 = Force %t0
Update %t0, %t1
Def "fact" %t0
```

### 约定

- 标签：`%t0`、`%t1`、`%tn`
- 变量：`%name`
- 字面量：`Lit 42`、`Lit true`、`Lit 'x'`、`Lit Unit`
- 基本运算：`add`、`sub`、`mul`、`div`、`rem`、`lt`、`gt`、`le`、`ge`、`eq`、`ne`、`and`、`or`、`not`
- 嵌套表达式在 `Thunk { ... }` 和 `StrictDef { ... }` 内使用 2 空格缩进

## StrictDef 优化

包含 IO 调用的定义完全跳过 thunk 机制：

```dew
def greeting = Stdout("hello")     // IO → StrictDef
def x = 42                         // 纯 → Thunk 链
```

IR 输出：
```
StrictDef "greeting" {
  Apply %Stdout [Array [Lit 'h', ...]]
}
%t0 = ThunkAlloc
Thunk %t0 { Lit 42 }
%t1 = Force %t0
Update %t0, %t1
Def "x" %t0
```

求值器通过直接调用 `eval_ir(value)` 处理 `StrictDef` 并将结果插入环境 —— 无堆分配，无 FSM 转换。

## 下一步

- [**惰性求值**](laziness.md) —— 严格性分析和求值语义
- [**工具**](tooling.md) —— 使用 `--emit=text` 检查 IR
