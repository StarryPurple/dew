#!/bin/bash
# Install Dew VS Code extension for the current user
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
EXT_DIR="$HOME/.vscode/extensions/dew-lang"
mkdir -p "$HOME/.vscode/extensions"
if [ -L "$EXT_DIR" ] || [ -d "$EXT_DIR" ]; then
    rm -rf "$EXT_DIR"
fi
ln -s "$DIR" "$EXT_DIR"
echo "Dew extension installed → $EXT_DIR"
echo "Reload VS Code (Ctrl+Shift+P → Reload Window)"
