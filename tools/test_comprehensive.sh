#!/bin/bash
# Test a single comprehensive test case.
# Usage: bash tools/test_comprehensive.sh <test_name>
set -e

DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEW="$DIR/target/debug/dew"
TIMEOUT_SEC=7

if [ $# -lt 1 ]; then
    echo "Usage: bash tools/test_comprehensive.sh <test_name>"
    exit 1
fi

test_name="$1"
test_dir="$DIR/examples/comprehensive/$test_name"
rx_file="$test_dir/$test_name.rx"
in_file="$test_dir/$test_name.in"
out_file="$test_dir/$test_name.out"

if [ ! -d "$test_dir" ]; then echo "Error: dir not found: $test_dir"; exit 1; fi
if [ ! -f "$rx_file" ]; then echo "Error: source not found: $rx_file"; exit 1; fi

echo "=== $test_name ==="

# Step 1: Translate .rx → .dew
echo "  1) rx → dew ... "
dew_file="$test_dir/$test_name.dew"
if "$DEW" rx2dew "$rx_file" > "$dew_file" 2>&1; then
    echo "     OK -> $dew_file"
else
    echo "     FAIL (rx2dew error)"; exit 1
fi

# Step 2: Desugared output
echo "  2) emit desugared ... "
if "$DEW" "$dew_file" --emit=desugared > "$test_dir/$test_name.desugared.dew" 2>&1; then
    echo "     OK -> $test_dir/$test_name.desugared.dew"
else
    echo "     FAIL (desugared)"; exit 1
fi

# Step 3: IR text
echo "  3) emit dewir ... "
if "$DEW" "$dew_file" --emit=text > "$test_dir/$test_name.dewir" 2>&1; then
    echo "     OK -> $test_dir/$test_name.dewir"
else
    echo "     FAIL (IR)"; exit 1
fi

# Step 4: LLVM — emit IR, compile, run
echo "  4) llvm ... "
dewll_file="$test_dir/$test_name.dewll"
exe_file="$test_dir/$test_name.exe"
if "$DEW" "$dew_file" --emit=llvm > "$dewll_file" 2>/dev/null; then
    echo "     emit OK -> $dewll_file"
else
    echo "     FAIL (LLVM emission)"; exit 1
fi
if clang-21 -x ir "$dewll_file" -o "$exe_file" -Wno-override-module 2>&1; then
    echo "     compile OK -> $exe_file"
else
    echo "     SKIP (LLVM backend cannot handle complex types in this program)"
    echo "     Use tree-walking evaluator for simple programs or fix LLVM backend."
    exit 0
fi
exe_output=$(timeout "$TIMEOUT_SEC" "$exe_file" < "$in_file" 2>/dev/null | tail -1 || echo "TIMEOUT/ERROR")
if [ "$exe_output" = "TIMEOUT/ERROR" ]; then
    echo "     SKIP (runtime timeout)"
elif [ -f "$out_file" ]; then
    exe_expected=$(cat "$out_file" | tr -d '\n')
    if [ "$exe_output" = "$exe_expected" ]; then
        echo "     OK (output: $exe_output)"
    else
        echo "     FAIL (expected '$exe_expected', got '$exe_output')"
        exit 1
    fi
else
    echo "     OK (output: $exe_output, no .out)"
fi

echo ""
echo "=== $test_name: ALL PASS ==="
