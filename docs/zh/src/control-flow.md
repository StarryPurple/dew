# 控制流

Dew 提供基于表达式的控制流。每个控制结构都产生一个值。

## `if` / `else` 表达式

```dew
if condition { then_expr } else { else_expr }
```

每个分支是一个块表达式。`else` 子句可选 —— 省略时默认为 `Unit`：

```dew
def main = fn -> Int {
  if 10 < 20 { 99 } else { 0 }   // 返回 99
}
```

条件始终严格求值。分支在环境上下文中求值（若结果未被立即需求则为惰性）。

## `match` 表达式

模式匹配是解构值和按结构分支的主要方式：

```dew
match scrutinee {
  pattern1 => body1,
  pattern2 => body2,
}
```

### 布尔匹配

```dew
{{#include ../../../examples/match_expr.dew}}
```

### 整数字面量匹配

```dew
{{#include ../../../examples/complex/fizzbuzz.dew}}
```

### 模式变量

变量模式匹配任何值并将其绑定到名称：

```dew
match n {
  0 => 0,
  n => n,  // 在此分支中绑定 n（遮蔽外部 n）
}
```

### 通配符模式

下划线 `_` 匹配任何值并丢弃：

```dew
match x {
  0 => "zero",
  _ => "non-zero",
}
```

### 结构体模式

```dew
struct Point { x: Int, y: Int }
match p {
  Point(x, y) => x + y,
}
```

### 枚举模式

```dew
enum Option { Some(Int), None }
match opt {
  Some(val) => val,
  None => 0,
}
```

### 元组模式

```dew
match pair {
  (x, y) => x + y,
}
```

## 块

块 `{ ... }` 将语句序列化并产生最终值：

```dew
{
  stmt1;
  stmt2;
  final_expression
}
```

### 局部 `def` 绑定

```dew
{
  def x = 10;
  def y = 20;
  x + y  // 30 — 这是块的值
}
```

每个局部 `def` 在块的剩余部分中有效。

### 无最终表达式的块

```dew
{
  def x = 1;
  x + 1 -> Stdout;
  // 无最终表达式 → Unit
}
```

## 管道操作符（`->`）

管道操作符将左侧操作数作为参数传递给右侧：

```dew
x -> f        // f(x)
x -> f(y)     // f(y, x)
```

## 下一步

- [**结构体和枚举**](structs-enums.md) —— 数据类型和模式匹配
