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
  ├── [Destructurization Pass]      ← 新增：将 codata-style Rx 译为 data-style Dew
  │     struct + method → ADT + standalone function
  │     method call → function call with self as first arg
  │     this/self 参数注入
  │
  ├── [Control Flow Pass]           ← 新增：将指令式控制流转为函数式
  │     while → fix + match + ControlFlow (已有模式)
  │     return → Return(expr) / Normal(expr)
  │     break → Return(acc)
  │     continue → Normal(0)
  │
  ├── [Mutation Pass]               ← 新增：将可变赋值转为纯函数式
  │     x = expr → def x = expr
  │     &mut param → & borrow param (Dew level)
  │
  └── Dew Source
```

### 3.2 关键设计决策

1. **控制流翻译（while/return/break）与分解变换（struct→ADT）应该分离**。Binder 论文的 destructurization 不处理控制流，控制流是 Rx 的指令式特性，与 OO/FP 分解正交。

2. **ControlFlow 枚举 + fix + match 的模式是可用的**（已经在 e2e test `examples/pass/while_loop_cf/` 中验证）。不需要改。

3. **变换应类型导向**。`x.foo(args)` 变成 `Foo__foo(x, args)` 需要知道 `x` 的类型是哪个 struct，不能只按语法。

4. **Borrow 参数不应在翻译层手动解包**。Dew 的 desugarer 自动处理 `&` 参数的元组展开。翻译器只输出 `func(&x, &y)`，不输出 `{ def __brw = func(&x, &y); def x = __brw.0; ... }`。

### 3.3 需要避免的陷阱

- ❌ 不要在函数体上套 `fix + match + ControlFlow` 做函数级 return。那是控制流翻译的产物，不是分解变换。
- ❌ 不要用 subagent 读论文。
- ❌ 不要在翻译层手动解包 borrow 调用的元组（`.0`/`.1`/`.2`）。
- ❌ 不要试图在单次 pass 里同时处理分解变换和控制流。

---

## 4. 实现步骤（建议顺序）

### Phase 1: 恢复基础翻译器框架

1. 在 `src/lib.rs` 恢复 `pub mod rx2dew_ir;`
2. 创建新的 `src/rx2dew_ir.rs`：只做 struct + function 的直译（无控制流、无 borrow 参数处理）
3. 恢复 `src/main.rs` 的 `rx2dew` 命令
4. 写一个简单的 e2e 测试验证基本翻译

### Phase 2: Destructurization（struct + method 翻译）

- Rx struct → Dew struct（ADT）
- Rx impl method → Dew standalone function（self 作为第一个参数）
- Rx method call `x.foo(args)` → `Struct__foo(x, args)`
- 类型导向：根据 `x` 的类型查找对应的方法

### Phase 3: 控制流翻译

- while → fix + match + ControlFlow（复用现有 `examples/pass/while_loop_cf/` 已验证的模式）
- return → Return(expr) / Normal(expr)
- break → Return(acc)
- continue → Normal(0)
- **函数级别不应套 CF wrapper**，CF wrapper 只用于 while 循环

### Phase 4: Mutation + Borrow

- `&mut T` 参数 → Dew `&T` borrow 参数
- 赋值 `x = rhs` → `def x = rhs`（阴影）
- borrow 调用直接输出 `func(&x, &y)`，不手动解包

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
