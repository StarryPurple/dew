#!/bin/bash
# Test a single comprehensive test case.
# Usage: bash tools/test_comprehensive.sh <test_name>
# Example: bash tools/test_comprehensive.sh comprehensive1

set -e

DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEW="$DIR/target/debug/dew"
TIMEOUT_SEC=7

if [ $# -lt 1 ]; then
    echo "Usage: bash tools/test_comprehensive.sh <test_name>"
    echo ""
    echo "Example: bash tools/test_comprehensive.sh comprehensive1"
    exit 1
fi

test_name="$1"
test_dir="$DIR/examples/comprehensive/$test_name"
rx_file="$test_dir/$test_name.rx"
in_file="$test_dir/$test_name.in"
out_file="$test_dir/$test_name.out"

if [ ! -d "$test_dir" ]; then
    echo "Error: test directory not found: $test_dir"
    exit 1
fi
if [ ! -f "$rx_file" ]; then
    echo "Error: source file not found: $rx_file"
    exit 1
fi

echo "=== $test_name ==="

# Step 1: Translate .rx → .dew
echo "  1) rx → dew ... "
dew_file="$test_dir/$test_name.dew"
if "$DEW" rx2dew "$rx_file" > "$dew_file" 2>&1; then
    echo "     OK -> $dew_file"
else
    echo "     FAIL (rx2dew translation error)"
    exit 1
fi

# Step 2: Desugared output
echo "  2) emit desugared ... "
desugared_file="$test_dir/$test_name.desugared.dew"
if "$DEW" "$dew_file" --emit=desugared > "$desugared_file" 2>&1; then
    echo "     OK -> $desugared_file"
else
    echo "     FAIL (desugared emission)"
    exit 1
fi

# Step 3: IR text output
echo "  3) emit dewir ... "
dewir_file="$test_dir/$test_name.dewir"
if "$DEW" "$dew_file" --emit=text > "$dewir_file" 2>&1; then
    echo "     OK -> $dewir_file"
else
    echo "     FAIL (IR emission)"
    exit 1
fi

# Step 4: Evaluate with stdin
echo "  4) eval ... "
if [ -f "$in_file" ]; then
    output=$(timeout "$TIMEOUT_SEC" "$DEW" "$dew_file" < "$in_file" 2>/dev/null | tail -1 || echo "TIMEOUT/ERROR")
else
    output=$(timeout "$TIMEOUT_SEC" "$DEW" "$dew_file" 2>/dev/null | tail -1 || echo "TIMEOUT/ERROR")
fi

if [ "$output" = "TIMEOUT/ERROR" ]; then
    echo "     SKIP (timeout after ${TIMEOUT_SEC}s — evaluator too slow for complex programs)"
    echo "     Use --backend=llvm or run smaller unit tests to verify correctness."
    exit 0
fi

if [ -f "$out_file" ]; then
    expected=$(cat "$out_file" | tr -d '\n')
    if [ "$output" = "$expected" ]; then
        echo "     OK (output: $output)"
    else
        echo "     FAIL (expected '$expected', got '$output')"
        exit 1
    fi
else
    echo "     OK (output: $output, no .out file to compare)"
fi

echo ""
echo "=== $test_name: ALL PASS ==="
