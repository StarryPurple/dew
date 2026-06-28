#!/bin/bash
# Dew comprehensive test runner
# Tests the full Rx→Dew→Eval pipeline with timeout.
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

    # Step 1: Translate .rx → .dew
    echo -n "  rx → dew ... "
    dew_file="$test_dir/$test_name.dew"
    if ! "$DEW" rx2dew "$rx_file" > "$dew_file" 2>/dev/null; then
        echo "FAIL (rx2dew translation error)"
        FAIL=$((FAIL + 1))
        continue
    fi
    echo "OK"

    # Step 2: Generate debug artifacts
    #   desugared output
    echo -n "  emit desugared ... "
    desugared_file="$test_dir/$test_name.desugared.dew"
    if ! "$DEW" "$dew_file" --emit=desugared > "$desugared_file" 2>/dev/null; then
        echo "FAIL (desugared emission)"
        FAIL=$((FAIL + 1))
        continue
    fi
    echo "OK"

    #   IR text output
    echo -n "  emit dewir ... "
    dewir_file="$test_dir/$test_name.dewir"
    if ! "$DEW" "$dew_file" --emit=text > "$dewir_file" 2>/dev/null; then
        echo "FAIL (IR emission)"
        FAIL=$((FAIL + 1))
        continue
    fi
    echo "OK"

    # Step 3: Evaluate .dew with .in as stdin, compare last stdout line to .out
    echo -n "  eval ... "
    if [ -f "$in_file" ]; then
        output=$(timeout "$TIMEOUT_SEC" "$DEW" "$dew_file" < "$in_file" 2>/dev/null | tail -1)
        if [ -z "$output" ]; then output="TIMEOUT/ERROR"; fi
    else
        output=$(timeout "$TIMEOUT_SEC" "$DEW" "$dew_file" 2>/dev/null | tail -1)
        if [ -z "$output" ]; then output="TIMEOUT/ERROR"; fi
    fi

    if [ "$output" = "TIMEOUT/ERROR" ]; then
        echo "FAIL (timeout or error after ${TIMEOUT_SEC}s)"
        FAIL=$((FAIL + 1))
        continue
    fi

    if [ -f "$out_file" ]; then
        expected=$(cat "$out_file" | tr -d '\n')
        if [ "$output" = "$expected" ]; then
            echo "OK ($output)"
            PASS=$((PASS + 1))
        else
            echo "FAIL (expected '$expected', got '$output')"
            FAIL=$((FAIL + 1))
        fi
    else
        echo "OK (no .out file, output was '$output')"
        PASS=$((PASS + 1))
    fi
done

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
