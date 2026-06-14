# 工具

Dew 附带命令行编译器、Language Server Protocol（LSP）实现和 VS Code 扩展。

## CLI

```bash
dew <file.dew>              # 编译并求值
dew <file.dew> --emit=text  # 以文本形式打印 IR
dew lsp                     # 启动 LSP 服务器
```

### 命令

| 命令 | 描述 |
|------|------|
| `dew <file>` | 解析、编译和求值 `.dew` 源文件 |
| `dew lsp` | 启动 LSP 服务器（基于 stdio 的 JSON-RPC） |

### 选项

| 标志 | 描述 |
|------|------|
| `--emit <format>` | 输出 IR 文本而非求值。当前格式：`text` |

### 退出码

Dew 使用 `main` 函数的返回值作为进程退出码：

```dew
def main = fn -> Int { 42 }
// 进程以码 42 退出
```

## LSP 服务器

```bash
dew lsp
```

通过 stdin/stdout 使用 JSON-RPC 2.0 通信，采用标准 LSP `Content-Length` 头部帧格式。

### 支持的功能

| 功能 | 状态 | 描述 |
|------|------|------|
| **Initialize** | ✅ | 返回服务器能力 |
| **Text Document Sync** | ✅ | 打开/更改时全量文档同步 |
| **Hover** | ✅ | 悬停时显示 "Dew expression"（基础） |
| **Go to Definition** | ✅ | 声明提供者（存根实现） |

## VS Code 扩展

`vscode-dew/` 目录包含一个极简 VS Code 扩展：

- **文件扩展名**：`.dew` 文件被识别为 Dew 源文件
- **语法高亮**：关键字、类型、字符串、注释
- **注释切换**：`//` 行注释、`/* */` 块注释
- **括号匹配**：`{}`、`[]`、`()`
- **自动闭合对**：括号、引号

安装：

```bash
cp -r vscode-dew ~/.vscode/extensions/dew
```

## 诊断

Dew 使用带错误/警告代码的结构化诊断系统：

```
[E001] — 文件/系统错误
[E002] — 解析错误
[E###] — 通用错误（顺序编号）
[W###] — 警告（顺序编号）
```

### 输出格式

- **stderr**（默认）：带代码前缀的纯文本
- **JSON**：结构化的诊断消息数组

## 构建配置

### 依赖

| 依赖 | 版本 | 用途 |
|------|------|------|
| `clap` | 4 (derive) | CLI 参数解析 |
| `serde` | 1 (derive) | LSP JSON-RPC 序列化 |
| `serde_json` | 1 | JSON 编解码 |
| `ariadne` | 0.4 | 美观的错误报告 |

## 开发工作流

```bash
cargo build              # debug 构建
cargo build --release    # release 构建
```

### 测试

测试是**示例驱动**的 —— `examples/` 中的每个 `.dew` 文件作为测试用例：

```bash
dew examples/arithmetic.dew        # 期望退出码 42
dew examples/factorial.dew         # 期望退出码 120
```

### 示例类别

| 目录 | 用途 |
|------|------|
| `examples/*.dew` | 基本语言特性 |
| `examples/complex/` | 算法基准测试 |
| `examples/functions/` | 高阶函数演示 |
| `examples/structs/` | 结构体使用模式 |
| `examples/fail/` | 错误用例 |

## IR 输出

`--emit=text` 标志以人类可读格式打印 Thunk Graph IR（2 空格缩进）：

```
%t0 = ThunkAlloc
Thunk %t0 {
  Lambda [] Prim add Lit 40 Lit 2
}
%t1 = Force %t0
Update %t0, %t1
Def "main" %t0
```

## 下一步

- [**简介**](intro.md) —— 返回开头
- [源代码](https://github.com/ACM-Class-2026-Spring/dew) —— 阅读实现
