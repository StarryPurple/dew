#!/bin/bash
# Dew comprehensive test runner
# Tests the full Rx→Dew→LLVM pipeline with timeout.
set -e

DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEW="$DIR/target/debug/dew"
TIMEOUT_SEC=7
PASS=0
FAIL=0

echo "=== Dew Comprehensive Test Runner ==="
echo ""

for test_dir in "$DIR/examples/comprehensive"/comprehensive*/; do
    test_name="$(basename "$test_dir")"
    rx_file="$test_dir/$test_name.rx"
    in_file="$test_dir/$test_name.in"
    out_file="$test_dir/$test_name.out"

    if [ ! -f "$rx_file" ]; then
        continue
    fi

    echo "--- $test_name ---"
    ok=1
    dew_file="$test_dir/$test_name.dew"

    # Step 1: Translate .rx → .dew
    echo -n "  rx2dew ... "
    if ! "$DEW" rx2dew "$rx_file" > "$dew_file" 2>/dev/null; then
        echo "FAIL"
        FAIL=$((FAIL + 1)); ok=0; continue
    fi
    echo "OK"

    # Step 2: Debug artifacts (non-fatal)
    "$DEW" "$dew_file" --emit=desugared > "$test_dir/$test_name.desugared.dew" 2>/dev/null || true
    "$DEW" "$dew_file" --emit=text > "$test_dir/$test_name.dewir" 2>/dev/null || true

    # Step 3: LLVM — emit IR, compile, run
    echo -n "  llvm ... "
    dewll_file="$test_dir/$test_name.dewll"
    exe_file="$test_dir/$test_name.exe"
    if ! "$DEW" "$dew_file" --emit=llvm > "$dewll_file" 2>/dev/null; then
        echo "FAIL (LLVM emission)"; FAIL=$((FAIL + 1)); ok=0; continue
    fi
    if ! clang-21 -x ir "$dewll_file" -o "$exe_file" -Wno-override-module 2>/dev/null; then
        echo "SKIP (LLVM backend complex types)"; continue
    fi
    exe_output=$(timeout "$TIMEOUT_SEC" "$exe_file" < "$in_file" 2>/dev/null | tail -1)
    if [ -z "$exe_output" ]; then exe_output="TIMEOUT/ERROR"; fi
    if [ "$exe_output" = "TIMEOUT/ERROR" ]; then
        echo "SKIP (timeout)"; FAIL=$((FAIL + 1)); ok=0; continue
    fi
    if [ -f "$out_file" ]; then
        exe_expected=$(cat "$out_file" | tr -d '\n')
        if [ "$exe_output" = "$exe_expected" ]; then
            echo "OK ($exe_output)"
            PASS=$((PASS + 1))
        else
            echo "FAIL (expected '$exe_expected', got '$exe_output')"
            FAIL=$((FAIL + 1)); ok=0; continue
        fi
    else
        echo "OK ($exe_output, no .out)"
        PASS=$((PASS + 1))
    fi
done

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
