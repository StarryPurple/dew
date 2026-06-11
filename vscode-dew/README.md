# Dew VS Code Extension

Syntax highlighting, diagnostics, and completions for the Dew language.

## Features

- **Syntax highlighting** — keywords, types, constructors, operators, comments
- **Diagnostics** — type errors and warnings as you type (via `dew lsp`)
- **Completions** — keyword and identifier suggestions
- **Commands** — `dew.runFile`, `dew.lintFile`

## Installation

```bash
# Symlink into VS Code extensions
ln -s $(pwd)/vscode-dew ~/.vscode/extensions/dew-lang

# Or copy
cp -r vscode-dew ~/.vscode/extensions/dew-lang
```

Requires `dew` on PATH.

## Usage

- Open any `.dew` file — syntax highlighting activates automatically
- Errors and warnings appear as red/yellow squiggles
- `Ctrl+Space` triggers keyword completions
- `Ctrl+Shift+P` → "Dew: Run File" or "Dew: Lint File"
