# 函数

函数是 Dew 的核心抽象。它们是一等值，按值捕获环境，支持递归、偏应用和高阶模式。

## 定义函数

### 顶层定义（`def`）

每个命名绑定使用 `def`：

```dew
def add = fn(x: Int, y: Int) -> Int { x + y }
```

通用形式：

```
def name = expression
```

### 匿名函数（`fn`）

`fn` 关键字创建匿名函数值：

```
fn(params...) -> RetType { body }
```

```dew
// 带显式返回类型
def inc = fn(x: Int) -> Int { x + 1 }

// 推导返回类型
def id = fn(x: Int) { x }

// 多参数
def hypot = fn(a: Int, b: Int) -> Int { a * b }
```

### 闭包

函数按值捕获环境：

```dew
def make_adder = fn(n: Int) -> Int -> Int {
  fn(x: Int) -> Int { x + n }  // 按值捕获 n
}
def add_5 = make_adder(5);
add_5(10)  // 15
```

闭包亲和性自动推断：捕获 affine 变量 → `FnOnce`；纯捕获 → 无限制 `Fn`。

## 调用函数

函数应用使用并置——函数后接参数：

```dew
inc(5)          // 6
add(3, 4)       // 7
```

## 递归

Dew 支持通过 `def` 体内的自引用实现直接递归：

```dew
{{#include ../../../examples/factorial.dew}}
```

对于互递归或更复杂的递归模式，使用 `fix` 组合子：

```
fix name { body }
```

### 内部工作原理

IR 生成器在编译期间检测自引用。当 `Var(name)` 表达式出现在 `def` 块内且 `name` 匹配当前定义时，编译器将其转换为指向 thunk 自身标签的 `Ref(label)` 节点。这使得求值器的三状态 FSM 能够处理递归而不产生无限循环。

## 高阶函数

函数可以接收其他函数作为参数并返回函数：

```dew
{{#include ../../../examples/functions/hof.dew}}
```

常见高阶模式：

```dew
def apply_to = fn(f: Int -> Int, x: Int) -> Int { f(x) }
def compose = fn(f: Int -> Int, g: Int -> Int) -> Int -> Int {
  fn(x: Int) -> Int { g(f(x)) }
}
```

## 管道操作符（`->`）

管道操作符 `->` 将左侧表达式作为参数传递给右侧函数：

```dew
expr -> func
// 等价于：func(expr)
```

管道是左结合的，在所有二元操作符中优先级最低。

## 内置函数

| 名称 | 类型 | 描述 |
|------|------|------|
| `Stdin` | builtin | 从 stdin 读取整数 |
| `Stdout` | builtin | 将值打印到 stdout |
| `not` | builtin | 布尔取反：`not(true)` → `false` |

## 下一步

- [**控制流**](control-flow.md) —— `if`、`match`、块和管道
