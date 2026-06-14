# 简介

Dew 是一门纯函数式、静态类型编程语言，核心设计为**隐式惰性求值**、**affine 类型**和**一等闭包**。编译器与求值器使用 Rust 实现，单遍编译。

## Hello, Dew

```dew
{{#include ../../../examples/arithmetic.dew}}
```

保存为 `hello.dew` 并运行：

```bash
cargo run -- hello.dew
# => 42
```

程序定义 `main` 为返回 `Int` 的函数。表达式 `40 + 2` 被求值，其值成为进程退出码。

## 语言哲学

Dew 围绕四个核心原则设计：

### 1. 不可变性

所有值不可变。一旦绑定，值不能被原地修改。Dew 使用 `def` 绑定来引入新名称，而非赋值：

```dew
def x = 5;      // 将 5 绑定到 x
def y = x + 3;  // 将 x + 3（即 8）绑定到 y
// x 仍然是 5 —— 值永远不会改变
```

### 2. 隐式惰性求值

Dew **默认惰性求值**。编译器执行严格性分析以确定哪些表达式需要立即求值，哪些可以延迟。程序员从不标注惰性 —— 编译器自动插入 `Suspend` 和 `Force` 操作。

```dew
def expensive = heavy_computation();  // 此处不计算 —— 被挂起
expensive + 1                         // 此处被强制求值，在需要时计算
```

详见[惰性求值](laziness.md)章节。

### 3. Affine 资源类型

Dew 在编译期追踪**资源亲和性**。类型分为两类：

- **Normal** —— 基线，无特殊限制（整数、布尔值、字符、纯结构体）
- **Affine** —— 至多使用一次，所有权转移（`#[Affine]` 标记的类型）

多次使用 affine 值是编译错误。详见 [Affine 类型](affine.md)。

### 4. 一等闭包

函数是值。它们按值捕获环境，可以传递给其他函数、存储在数据结构中、作为返回值。

```dew
def apply_twice = fn(f: Int -> Int, x: Int) -> Int { f(f(x)) }
```

闭包亲和性自动推断：捕获 affine 变量产生 `FnOnce`；纯捕获产生无限制 `Fn`。

## 快速概览

以下程序展示 Dew 的多个特性：

```dew
// 结构体定义
struct Point { x: Int, y: Int }

// 递归函数
def dist_sq = fn(p: Point) -> Int {
  p.x * p.x + p.y * p.y
}

// Match 表达式
def abs = fn(n: Int) -> Int {
  match n < 0 {
    true => 0 - n,
    false => n,
  }
}

// 高阶函数
def apply5 = fn(f: Int -> Int) -> Int { f(5) }

// 入口点
def main = fn -> Int {
  def p = Point(3, 4);
  dist_sq(p) -> Stdout;   // 通过管道打印
  apply5(fn(x) { x + 1 }) // 返回 6
}
```

## 核心概念

| 概念 | 描述 |
|------|------|
| **`def`** | 顶层和局部绑定（不可变） |
| **`fn`** | 匿名函数表达式 |
| **`struct`** | 命名记录类型，字段按位置访问 |
| **`enum`** | 带可选负载的标签联合类型 |
| **`match`** | 带穷尽性检查的模式匹配表达式 |
| **`if`/`else`** | 条件表达式（非语句） |
| **`->`** | 管道操作符，用于 I/O 和前置应用 |
| **`force`** | 显式严格求值（很少需要） |
| **`fix`** | 显式不动点递归组合子 |
| **`import`** | 从外部 Dew 文件导入模块 |
| **`#[Affine]`** | 标记类型为 affine 的属性 |

## 设计文档

完整的形式化规范见 [`docs/`](../) 目录。本文档为中文版，涵盖 v0.1.0 中所有已实现的特性。

## 下一步

- [**类型**](types.md) —— 了解基本类型和复合类型系统
- [**函数**](functions.md) —— 闭包、递归、高阶模式
- [**控制流**](control-flow.md) —— `if`、`match`、块和管道操作符
