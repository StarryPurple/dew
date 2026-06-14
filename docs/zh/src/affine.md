# Affine 类型

Dew 的类型系统追踪**资源亲和性** —— 一个值可以被使用多少次。这使得无垃圾回收器情况下的资源安全成为编译期保证。

## 两种资源类别

| 类别 | 描述 | 示例 | 规则 |
|------|------|------|------|
| **Normal** | 基线 —— 无限制 | `Int`、`Bool`、`Char`、`Unit`、纯结构体 | 无限制使用 |
| **Affine** | 至多一次，所有权转移 | `Affine(T)`、`#[Affine]` 结构体/枚举 | 单次使用，作用域结束自动 drop |

## `#[Affine]` 属性系统

亲和性由属性控制，而非类型包装器：

```dew
#[Affine]
struct Affine(T) { data: T }

#[Affine]
enum Option { Some(Int), None }
```

### 传染性规则

若结构体包含任何 `#[Affine]` 字段，整个结构体变为 affine：

```dew
struct Pair {
  x: Int,              // Normal
  #[Affine] y: Int,    // 此字段使 Pair 变为 Affine
}
```

### `Affine(T)` 是标准库结构体

```dew
#[Affine]
struct Affine(T) { data: T }
```

一个普通的单字段结构体，带有 `#[Affine]` 属性。无特殊运行时变体 —— `Affine(42)` 就是 `Value::Struct { name: "Affine", fields: [42] }`。

### 字段访问即消费

对 `#[Affine]` 类型的字段访问消费该结构体：

```dew
def x = Affine(42);
def y = x.data;    // x 被消费 —— 所有权转移到 y
// def z = x.data; // 错误：x 已被消费
```

模式匹配也消费：

```dew
match x {
  Affine(val) => val,  // x 被消费，val = 42
}
```

### `consume` 作为标准库函数

```dew
def consume = fn(x: Affine(T)) -> T { x.data }
```

无需内置函数 —— 只是字段访问的语法糖。

### 无隐式包装

编译器**从不**隐式将值包装在 `Affine` 中：

```dew
def f = fn(x: Affine(Int)) -> Int { x.data }
def a = 42;
// f(a);         // 错误：期望 Affine(Int)，得到 Int
f(Affine(a));     // OK：显式选择追踪
```

### 行为总结

| 拥有 | 期望 | 结果 |
|------|------|------|
| `T` | `T` | 拷贝 —— 两者均存活 |
| `Affine(T)` | `T` | **字段访问消费** —— affine 被消费，内部值提取 |
| `Affine(T)` | `Affine(T)` | 所有权转移 —— 保持包装 |
| `T` | `Affine(T)` | **拒绝** —— 必须显式使用 `Affine(x)` |

## 计算亲和性

类型的亲和性按结构决定：

### 基本类型
```
Int、Bool、Char、Unit → Normal
```

### `#[Affine]` 属性
```
#[Affine] 结构体/枚举 → Affine
任何包含 #[Affine] 字段的结构体 → Affine（传染性）
```

### 元组
```
任何 Affine 元素 → Affine
所有元素 Normal → Normal
```

### 闭包
```
所有捕获值 Normal → Normal（无限制 Fn）
任何捕获值 Affine → Affine（FnOnce —— 仅可调用一次）
```

## 所有权转移

```dew
def x = Affine(42);  // x 拥有被追踪的整数
def y = x;            // 所有权从 x 转移到 y
// def z = x;         // 错误：x 已被移动
```

## 借用模式（`&`）

在不消费的情况下使用值，Dew 提供借用语法糖 `&`：

```dew
def f = fn(&p: Point) -> Point { &p { x = 10 }; }
```

### 重绑定规则

`&` 参数作用域内，修改参数需要 `&`。不带 `&` 的 `=` 创建局部绑定，遮蔽参数。

## 内存模型

| 类别 | 分配 | 释放 |
|------|------|------|
| Normal | 栈 | 栈展开 |
| Affine | 由包含类型决定 | 编译器插入的 `drop` |

**无追踪垃圾回收。** 不可变性和 affine 类型的组合保证无引用循环。

## 下一步

- [**工具**](tooling.md) —— CLI、LSP 和开发工具
