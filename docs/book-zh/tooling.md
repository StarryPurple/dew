# 开发工具

Dew 提供了超越基本编译器的多种开发工具。

## 代码检查（`dew lint`）

对 Dew 源文件运行静态分析，无需执行：

```bash
dew lint file.dew
```

报告：
- **错误**（D001-D008）：阻止编译的类型错误
- **警告**（W001）：未使用的仿射资源
- **警告**（W002）：从未被强制的 thunk（潜在死代码）

代码检查问题会导致非零退出码，适合 CI 流水线：

```bash
dew lint examples/box_leak.dew
# warning [W001]: affine variable 'b' — affine resource defined but never consumed
# 1 issue(s) found.
```

## Tab 补全（`dew complete`）

获取关键字和标识符补全，用于编辑器集成：

```bash
dew complete file.dew --prefix "he"
# head

dew complete file.dew --prefix "ta"
# tail
# （以及任何以 "ta" 开头的用户定义名称）
```

每行输出一个补全项。包括语言关键字和文件中的用户定义变量/函数名。

## LSP 服务器（`dew lsp`）

启动 Language Server Protocol 服务器，用于编辑器集成：

```bash
dew lsp
```

通过 stdin/stdout 使用 JSON-RPC 通信。支持的功能：
- **诊断**：在打开/更改时发布解析错误和类型错误
- **补全**：带描述的关键字补全
- **悬停提示**：（已声明能力）

编辑器配置示例：

### Neovim（使用 lspconfig）
```lua
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
configs.dew = {
  default_config = {
    cmd = { 'dew', 'lsp' },
    filetypes = { 'dew' },
    root_dir = lspconfig.util.find_git_ancestor,
  },
}
lspconfig.dew.setup({})
```

### VS Code / Cursor

运行安装脚本，然后重新加载窗口：

```bash
bash vscode-dew/install.sh
```

获得原生语法高亮、LSP 诊断和关键字补全。

## Web 游乐场（`dew serve`）

启动交互式 Web 游乐场：

```bash
dew serve          # http://localhost:8080
dew serve --port 3000
```

功能：
- **代码编辑器** 支持 Dew 语法
- **示例按钮**：斐波那契、列表操作、盒子演示、惰性流
- **运行**（Ctrl+Enter）：编译并求值你的代码
- **输出标签页**：结果、IR（文本）、IR（json）、扁平 IR、诊断
- **深色主题** 带颜色编码输出
- **自动补全**：输入 2+ 字符弹出，带关键字和用户定义名称
