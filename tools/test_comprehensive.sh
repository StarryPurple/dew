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

# Step 4: LLVM IR
echo "  4) llvm ... "
if "$DEW" "$dew_file" --emit=llvm > "$test_dir/$test_name.dew.ll" 2>/dev/null; then
    echo "     OK -> $test_dir/$test_name.dew.ll"
else
    echo "     FAIL (LLVM emission)"; exit 1
fi

echo ""
echo "=== $test_name: ALL PASS ==="
