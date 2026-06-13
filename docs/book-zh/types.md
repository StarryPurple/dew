# 类型系统

## 类型

| 类型 | 种类 | 可复制？ | 描述 |
|------|------|:---:|-------------|
| `Int` | 值 | 是 | 64 位有符号整数 |
| `Bool` | 值 | 是 | 布尔值 |
| `Unit` | 值 | 是 | Unit / void |
| `Box(T)` | 资源 | **否** | 线性盒子 — 必须恰好 `unbox` 一次 |
| `T -> U` | 函数 | *推断* | 从 T 到 U 的函数 |

## 亲和性

**Normal** 值可以自由使用任意多次（默认）。

**仿射** 值必须 **最多使用一次**。使用仿射值会消耗它；再次使用它是编译时错误。

### 哪些类型是仿射的？

- `Box(T)` 始终是仿射的——它代表线性分配
- `T -> U` **当且仅当**闭包捕获至少一个仿射变量时才是仿射的
- 纯闭包（无仿射捕获）是 Normal
- `Int`, `Bool`, `Unit` 始终是 Normal

### 闭包亲和性推断

```dew
// 纯闭包 — 无捕获 → Normal（Fn）
def add_one = fn (x: Int) { x + 1 };
add_one(1) + add_one(2)   // 可以

// 闭包捕获 Box → Affine（FnOnce）
def b = box(99);
def reader = fn (x: Int) { unbox(b) };   // 捕获 b: Box(Int)
reader(0);                                // 可以，消耗 reader

// reader(0);  // 错误 [D001]：仿射违规 — reader 已被消耗
```

这是 Rust 的 `Fn`/`FnOnce` 规则：如果闭包将任何仿射资源移入自身，它便是 `FnOnce`。

## `dup`

`dup y = x;` 复制一个值。对 `Box(T)` 进行深拷贝（创建一个包含克隆内容的新盒子）。对 FnOnce 闭包会报错。

```dew
def x = 3;
dup y = x;    // 可以 — Int 是 Normal
x + y         // → 6

def b = box(42);
dup c = b;    // 可以 — Box(Int) 被深拷贝
unbox(b) + unbox(c)  // → 84
```

## `fix`

`fix f: T { e }` 定义一个递归绑定。`f` 在 `e` 内始终是 **Normal** — 这对于递归是有用的必要条件。

```dew
def fact = fix f: Int -> Int {
    fn (n: Int) {
        if (n < 2) { 1 } else { n * f(n - 1) }
    }
};
fact(5)   // → 120
```

## 类型标注

函数参数可以显式标注类型，也可以省略由 HM 推断：

```dew
fn (x: Int) { x + 1 }           // Int -> Int（Normal）
fn (x) { x + 1 }                // Int -> Int（推断）
fn (x: Box(Int)) { unbox(x) }   // Box(Int) -> Int（Normal — 无捕获）
```

编译器推断返回类型和闭包亲和性。变量没有类型推断——类型始终从上下文确定。
