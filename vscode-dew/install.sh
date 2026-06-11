#!/bin/bash
# Install Dew extension for VS Code / Cursor
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

for EXT_BASE in "$HOME/.cursor/extensions" "$HOME/.vscode/extensions"; do
    mkdir -p "$EXT_BASE"
    EXT_DIR="$EXT_BASE/dew-lang"
    rm -rf "$EXT_DIR"
    cp -r "$DIR" "$EXT_DIR"
    (cd "$EXT_DIR" && npm install --silent 2>/dev/null)
    echo "Installed → $EXT_DIR"
done

echo "Reload your editor (Ctrl+Shift+P → Reload Window)"
