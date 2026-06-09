# Tooling

Dew ships with several development tools beyond the basic compiler.

## Linter (`dew lint`)

Run static analysis on a Dew source file without executing it:

```bash
dew lint file.dew
```

Reports:
- **Errors** (D001-D008): type errors that prevent compilation
- **Warnings** (W001): unused affine resources  
- **Warnings** (W002): thunks that are never forced (potential dead code)

Lint issues cause a non-zero exit code, suitable for CI:

```bash
dew lint examples/box_leak.dew
# warning [W001]: affine variable 'b' — affine resource defined but never consumed
# 1 issue(s) found.
```

## Tab Completion (`dew complete`)

Get keyword and identifier completions for editor integration:

```bash
dew complete file.dew --prefix "he"
# head

dew complete file.dew --prefix "ta"  
# tail
# (plus any user-defined names starting with "ta")
```

Returns one completion per line. Includes both language keywords and user-defined variable/function names from the file.

## LSP Server (`dew lsp`)

Start a Language Server Protocol server for editor integration:

```bash
dew lsp
```

Communicates over stdin/stdout using JSON-RPC. Supported features:
- **Diagnostics**: parse errors and type errors published on open/change
- **Completion**: keyword completions with descriptions
- **Hover**: (declared capability)

Editor configuration examples:

### Neovim (with lspconfig)
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

## Web Playground (`dew serve`)

Start an interactive web playground:

```bash
dew serve          # http://localhost:8080
dew serve --port 3000
```

Features:
- **Code editor** with Dew syntax
- **Sample buttons**: Fibonacci, List Ops, Box Demo, Lazy Stream
- **Run** (Ctrl+Enter): compiles and evaluates your code
- **Output tabs**: Result, IR (text), IR (json), Flat IR, Diagnostics
- **Dark theme** with color-coded output
