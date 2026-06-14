# 类型

Dew 是静态类型语言。每个表达式都有编译期已知的类型，由 Hindley-Milner 类型推导和 affine 资源追踪强制执行。类型标注在大多数位置是可选的 —— 编译器会自动推导。

## 基本类型

Dew 提供四种内置基本类型：

| 类型 | 描述 | 示例 |
|------|------|------|
| `Int` | 64 位有符号整数 | `42`、`-7`、`0` |
| `Bool` | 布尔值 | `true`、`false` |
| `Char` | Unicode 标量值 | `'a'`、`'\n'`、`'λ'` |
| `Unit` | 单元类型（单值） | `Unit` |

```dew
def meaning: Int = 42;
def flag: Bool = true;
def letter: Char = 'z';
def nothing: Unit = Unit;
```

### 为什么 `Int` 是 64 位

`Int` 是**定长、栈分配、Normal** 类型。这是刻意为之的设计选择：

| 选择 | 分配方式 | 亲和性 | 日常可用性 |
|------|---------|--------|-----------|
| **`i64`（已选）** | 栈，8 字节 | Normal | 算术运算正常工作 |
| `i128` | 栈，16 字节 | Normal | 在 64 位硬件上无实际收益 |
| 大整数 | 堆 | Affine | 每次 `+` 都会消费操作数 |

若 `Int` 是堆分配的（affine），最简单的表达式也会出问题：

```dew
def x = 42;
def y = x + 1;  // x 被消费 —— 消失
def z = x + 2;  // 错误：x 已被移动
```

`Int` 为 Normal 对该语言的可用性至关重要。64 位有符号整数匹配现代硬件上的机器字长，提供干净的 C 互操作（`int64_t`），并为绝大多数数值程序提供足够的范围。

**任意精度整数**作为单独的 `BigInt` 类型规划，具有 Affine 亲和性 —— 在少数需要时才选用。

## 类型标注

类型标注在名称后使用冒号：

```dew
def name: Type = expression;
```

在函数参数中，类型标注是可选的 —— 若省略，参数获得一个新的类型变量：

```dew
def id = fn(x) { x }            // x: 推导的类型变量
def add = fn(x: Int, y: Int) -> Int { x + y }  // 显式类型
```

返回类型标注也是可选的：

```dew
def id = fn(x: Int) { x }  // 返回类型被推导
```

## 函数类型

函数类型使用箭头语法 `T -> U`：

```dew
Int -> Bool                  // 从 Int 到 Bool 的函数
(Int -> Bool) -> Char        // 接收函数、返回 Char
Int -> Bool -> Char          // 柯里化：Int -> (Bool -> Char)
```

箭头是右结合的，所以 `T1 -> T2 -> T3` 意为 `T1 -> (T2 -> T3)` —— 返回函数的函数。括号用于分组：`(T1 -> T2) -> T3` 是接收函数的函数。

对于多参数类型，使用元组：

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
// add : (Int, Int) -> Int
```

旧的 `fn(...) -> ...` 关键字形式（`fn(Int) -> Int`）仍被接受以实现向后兼容。

## 命名类型

用户定义的结构体和枚举成为命名类型：

```dew
struct Point { x: Int, y: Int }   // 类型：Point
enum Option { Some(Int), None }   // 类型：Option
```

详见[结构体和枚举](structs-enums.md)。

## 复合类型

### 元组类型

```dew
(Int, Bool)       // 对类型
(Int, Int, Char)  // 三元组类型
```

### 数组类型

数组有编译期已知的固定大小。在类型标注中使用参数化语法：

```
Array(T, N)
```

其中 `T` 是元素类型，`N` 是编译期常量大小。

## 内部类型系统

底层类型检查器使用以下内部表示：

```rust,ignore
enum Ty {
    Prim(PrimTy),      // Int、Bool、Char、Unit
    Var(usize),        // HM 类型变量
    Fun(Box<Ty>, Box<Ty>),  // 函数类型
    Adt(String, Vec<Ty>),   // 命名 ADT（结构体/枚举）
    Tuple(Vec<Ty>),          // 元组类型
    Array(Box<Ty>, usize),   // 定长数组
    Hole(usize),             // 推导间隙
}
```

## 类型推导

Dew 使用 **Hindley-Milner** 类型推导引擎（v0.1.0 中为**骨架实现**）。目前：

- 字面量（`Int`、`Bool`、`Char`、`Unit`）可完全推导
- 变量引用可从环境中查找
- 其他所有表达式形式获得新的类型变量 —— **合一、泛化和多态尚未实现**

## 资源亲和性

每种类型都有一个关联的**亲和性**，决定该类型值的使用方式：

| 亲和性 | 类型 | 规则 |
|--------|------|------|
| **Normal** | `Int`、`Bool`、`Char`、`Unit`、纯结构体、Normal 的元组 | 基线 —— 无限制 |
| **Affine** | `Affine(T)`、`#[Affine]` 结构体/枚举 | 至多使用一次 |

`#[Affine]` 属性系统标记类型为 affine。详见 [Affine 类型](affine.md) 章节了解完整的资源追踪模型。

## 下一步

- [**函数**](functions.md) —— `def`、`fn`、闭包和递归
