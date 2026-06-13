# Dew —— 一种带有仿射类型和隐式惰性求值的最小函数式语言

Dew 是一个用 Rust 实现的编译器 + 求值器，面向一种最小函数式语言，具有仿射类型系统、隐式惰性求值和结构化诊断。

## 构建与运行

```bash
cargo build
cargo run -- examples/<name>.dew              # JSON IR + 结果 + 诊断
cargo run -- examples/<name>.dew --emit=text  # 美化的文本 IR
cargo run -- examples/<name>.dew --emit=flat  # 扁平 SSA 风格 IR
cargo run -- examples/<name>.dew --trace      # 逐步求值跟踪
```

## 架构流水线

```
源码 ──► 解析器 ──► 仿射类型检查器 ──► 严格性分析 ──► IR 生成
                                                       │
                                                       ▼
                                           JSON/文本 IR ──► 求值器 + Thunk 运行时
                                                       │
                                                       ▼
                                                  诊断报告（JSON, stderr）
```

## 模块映射

| 文件 | 职责 |
|------|------|
| `ast.rs` | 源码 AST 类型（Expr 枚举，18+ 变体） |
| `parser.rs` | 手写词法分析器 + 递归下降解析器 |
| `types.rs` | 类型系统（Int, Bool, Unit, Box, Fun, List, Affinity） |
| `typeck.rs` | 仿射类型检查器，基于捕获的闭包亲和性推断 |
| `ir.rs` | 树形 IR 定义，Display + Serialize |
| `ir_gen.rs` | AST → IR 编译，带严格性 Suspend/Force 插入 |
| `strictness.rs` | Strict/Lazy 上下文分类 |
| `flat_ir.rs` | 扁平 SSA 风格 IR（Module, Function, BasicBlock, Op） |
| `lower.rs` | 树形 IR → 扁平 IR 降级 |
| `eval.rs` | 求值器 + 惰性 thunk 运行时（3 状态 FSM） |
| `value.rs` | 运行时值（Value 枚举，Env 类型） |
| `diagnostics.rs` | 诊断收集器 → JSON 报告 |
| `main.rs` | CLI 入口（clap） |
| `lib.rs` | 模块根（声明所有模块） |

## 关键设计规则（必须遵循）

1. **闭包亲和性是推断的，而非标注的**：仅当闭包捕获任何仿射变量时才是 FnOnce。纯闭包是 Fn（Normal）。
2. **惰性求值是隐式的**：编译器通过严格性分析插入 `Suspend`/`Force`。用户无需编写 `lazy` 或 `force`。
3. **Cons 尾部始终被挂起**：即使尾部表达式天然是惰性的，IR 生成器也会将其包装在 `Suspend` 中。
4. **所有实现细节必须记录在 `docs/book/` 中**。添加功能时，更新相应的 `.md` 文件。
5. **无多态性**：类型是单态的。Nil 获得占位类型 `List(Int)`。
6. **测试以示例驱动**：无单元测试。使用 `cargo run -- examples/<name>.dew` 进行验证。
7. **Main 验证**：恰好一个 `def main = fn { body }`，返回 `Int`。

## 代码约定

- Rust 2021 版本
- 无 `unsafe` 代码
- `Display` 实现用于美化打印；`Serialize` 用于 JSON 输出
- 通过贯穿 typeck 和 eval 的 `DiagnosticCollector` 进行错误处理
- 使用 `anyhow` 风格的模式（TypeError 等），但项目使用自定义错误枚举

## 依赖

- `clap` 4（derive）—— CLI
- `serde` + `serde_json` —— 序列化
- `ariadne` —— 美化错误报告（已声明，尚未使用）
- `tower-lsp` —— 语言服务器协议
- `tokio` —— 异步运行时
- `axum` + `tower-http` —— Web 游乐场
