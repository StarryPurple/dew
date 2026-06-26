# Rx ↔ Dew Interop — 设计与实现指引

> 新 session 入口文档。完整描述 Rx→Dew 翻译器的设计方向、论文基础、和实现约束。
> 开始工作前，**先读此文档全文**。

---

## 1. 项目状态

| 组件 | 状态 |
|------|------|
| `src/rx_parser.rs` | ✅ 保留，可用 |
| `src/rx2dew_ir.rs` | ❌ 已删除，需重建 |
| `src/main.rs` | `rx2dew` 命令已移除，需加回 |
| `src/lib.rs` | `mod rx2dew_ir` 注释掉，需恢复 |
| e2e tests | 146/146 ✅ |
| `docs/bib/` | 3 篇论文，见 §2 |

---

## 2. 论文基础

`docs/bib/` 下有 3 篇论文。**不要用 subagent 读**，用 `pdftotext` 转 txt 后用 `read` 工具。

### 2.1 Decomposition Diversity with Symmetric Data and Codata (Binder et al., POPL 2020)

**文件**: `docs/bib/decomp_data_codata.pdf`
**核心**: 这是**最相关的论文**。Data（ADT + pattern matching）和 Codata（interface + method dispatch）是对偶的。

| Codata (OO) | Data (FP) |
|---|---|
| `codata T where d(T): R` | `data T where C(T)` |
| `e.d(e')` — 析构器调用 | `match d on e with C => e'` — 模式匹配 |
| `comatch C on T using e with d => e'` — 匿名对象 | `C(e)` — 构造器调用 |

**Destructurization** (data → codata): match → 析构器调用, 构造器调用 → comatch。
**Constructorization** (codata → data): 析构器调用 → match, comatch → 构造器调用。
**可逆、保类型、保语义**（Coq 机械验证）。

对我们的意义: **Rx 的 struct + method ≈ codata, Dew 的 struct + function ≈ data**。翻译本质上是 destructurization。

### 2.2 Decomposition Without Regret (Zhang et al., 2022)

**文件**: `docs/bib/decomp_without_regret.pdf`
**核心**: FOOD 演算。Interface ↔ Datatype, Destructor ↔ Consumer, Generator ↔ Constructor 的对偶变换。
**关键发现**: 变换必须**类型导向**（§3.6），不能语法导向。否则同名方法在不同类型上会被统一变换，产生错误。

### 2.3 Object Closure Conversion (Glew, 1999)

**文件**: `docs/bib/closure_conversion.pdf`
**核心**: 闭包 = 单方法对象。Object closure conversion = 为方法内的自由变量加 extra fields。函数式 closure conversion = function→object 编码 + object closure conversion + object→record 编码。

---

## 3. 设计方向

### 3.1 总体架构

```
Rx Source
  │
  ├── rx_parser ──→ Rx AST
  │
  ├── [Pass 0: Const Propagation]   将 const 引用展开为字面量
  │
  ├── [Destructurization Pass]     将 codata-style Rx 译为 data-style Dew
  │     struct + method → ADT + standalone function
  │     method call → function call with self as first arg
  │     this/self 参数注入
  │
  ├── [Body Translation Pass]      直译 + 控制流 + 赋值 一次完成
  │     while → while (&x; cond) { &x = e; Continue((x,)) }
  │     return in while → Done(acc)
  │     return outside while → if-else 链
  │     break → Done(acc)
  │     continue → Continue(acc)
  │     x = e → &x = e
  │     &mut T → &name: T
  │
  └── Dew Source
```

### 3.2 关键设计决策

1. **控制流翻译（while/return/break）与分解变换（struct→ADT）应该分离**。Binder 论文的 destructurization 不处理控制流，控制流是 Rx 的指令式特性，与 OO/FP 分解正交。

2. **Dew 原生支持 `while (&x; cond) { Continue/Done }`**。翻译器不再手动构造 `fix + match + ControlFlow`，而是 emit `while` 给 Dew 编译器处理。ControlFlow 枚举 (`Done(T)` / `Continue(T)`) 由翻译器生成，无 `Return`/`Break`/`Normal` 关键字。

3. **变换应类型导向**。`x.foo(args)` 变成 `Foo__foo(x, args)` 需要知道 `x` 的类型是哪个 struct，不能只按语法。

4. **Borrow 参数不应在翻译层手动解包**。Dew 的 desugarer 自动处理 `&` 参数的元组展开。翻译器只输出 `func(&x, &y)`，不输出 `{ def __brw = func(&x, &y); def x = __brw.0; ... }`。

5. **`if (&x; cond) { }` 原生支持跨作用域赋值**。翻译器使用 Dew 的 if-borrow 语法而不是手动构造 tuple return。

6. **`getInt()` → `&x -> stdin`**。Dew 使用 pipeline 语法读入：`&x -> stdin`。不是 `Stdin(0)` 函数调用。

7. **`exit(0)` 直接跳过**。Dew 没有 `exit`，翻译忽略该语句。

### 3.3 需要避免的陷阱

- ❌ 不要在函数体上套 `fix + match + ControlFlow` 做函数级 return。那是旧设计，新设计用 if-else 链。
- ❌ 不要用 subagent 读论文。
- ❌ 不要在翻译层手动解包 borrow 调用的元组（`.0`/`.1`/`.2`）。
- ❌ 不要试图在单次 pass 里同时处理分解变换和控制流。

---

## 4. 翻译对照表

### 4.1 类型映射

| Rx 类型 | Dew 类型 |
|---------|---------|
| `i32`, `u32`, `i64`, `u64`, `i8`, `u8`, `usize`, `isize` | `Int` |
| `bool` | `Bool` |
| `()` | `Unit` |
| `[T; N]`（const 展开后） | `[T; N]` |
| struct 名 | struct 名 |

### 4.2 表达式翻译

| Rx | Dew |
|----|-----|
| `expr as T` | `(expr as T)` |
| `a + b`, `a - b`, etc. | 直译 |
| `a == b`, `a < b`, etc. | 直译 |
| `obj.field` | `obj.field` |
| `arr[i]` | `arr[i]` |
| `f(args)` | `f(args)` |
| `x.foo(args)` | `Type__foo(&x, args)`（self 为 &）或 `Type__foo(x, args)`（self 非 &） |
| `self` / `&self` / `&mut self` | `&self: Type`（统一用 &） |
| `getInt()` | `&x -> stdin`（生成 `let x: Int;` + `&x -> stdin;`） |
| `printlnInt(x)` | `x -> stdout` |
| `exit(0)` | 跳过，不生成代码 |

### 4.3 语句翻译

| Rx | Dew |
|----|-----|
| `let x: T = e;` | `def x = e;` |
| `let mut x: T = e;` | `def x = e;`（mut 标记丢弃） |
| `x = e;` | `&x = e;` |
| `x += e;` | `&x = x + e;` |
| `x -= e;` | `&x = x - e;` |
| `x *= e;` | `&x = x * e;` |
| `arr[i] = e;` | `&arr[i] = e;` |
| `if (c) { stmt }` | `if (c) { stmt }`（分支为 Unit 时可无 else） |
| `if (c) { s1; x = e }` | `if (&x; c) { s1; &x = e }` |
| `while (c) { x = e; }` | `while (&x; c) { &x = e; Continue((x,)) }` |
| `break;`（在 while 内） | `Done((x, y))` |
| `continue;`（在 while 内） | `Continue((x, y))` |
| `return e;`（在 while 内） | `Done((e,))` |
| `return e;`（在 while 外） | `e`（if-else 链重组） |
| `return;` | `Unit`（所在分支最终表达式） |
| `{ stmts }` | 直译（Dew 的 block 语法） |
| const 声明 | 常量传播后移除 |

### 4.4 声明翻译

| Rx | Dew |
|----|-----|
| `struct S { f1: T1, f2: T2 }` | `struct S { f1: T1, f2: T2 }` |
| `impl S { fn m(&self, args) }` | `def S_m = fn(&self: S, args) -> Ret { body }` |
| `fn f(p: T) -> U { body }` | `def f = fn(p: T) -> U { body }` |
| `const NAME: T = N;` | 常量传播后移除 |

### 4.5 控制流处理

**函数级 `return`：** 翻译为 if-else 链。`return e;` 之后的语句移入 else 分支：

```
// Rx:
fn f() -> Int {
  if (cond) { return 1; }
  x + 1
}

// Dew:
def f = fn() -> Int {
  if (cond) { 1 } else { x + 1 }
}
```

**while 内的 `return`：** 翻译为 `Done(v)`，外层 match 区分正常结束和提前返回。需要生成 `ControlFlow` 枚举：

```
enum ControlFlow(T) {
  Done(T),
  Continue(T),
}
```

---

## 5. 约束与约定

- **146 e2e tests 必须保持绿色**。如果改动破坏了已有测试，说明设计有问题。
- **不要修改 `src/rx_parser.rs`**——保留 Rx 语言的全部解析能力。
- **不要修改 `src/typeck.rs` 的类型系统**——它是 Dew 编译器的核心，不是翻译器的。
- 新代码用 `tools/test_runner.sh` 验证。
- 文件用 `pdftotext -layout` 转 txt 后用 `read` 阅读。

---

## 6. 参考文件

| 文件 | 说明 |
|------|------|
| `src/rx_parser.rs` | Rx 解析器（保留，勿改） |
| `examples/pass/while_loop_cf/` | CF 模式的 e2e 验证 |
| `docs/bib/decomp_data_codata.pdf` | 核心论文：data/codata 对偶变换 |
| `docs/bib/decomp_without_regret.pdf` | FOOD 演算：类型导向变换 |
| `docs/bib/closure_conversion.pdf` | Object closure conversion |

---

*最后更新: 2026-06-22。配合删除旧实现后的新起点。*
