#!/bin/bash
# Dew compiler test runner
set -e

DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEW="$DIR/target/debug/dew"
PASS=0
FAIL=0

echo "=== Dew Compiler Test Runner ==="
echo ""

echo "--- pass/ ---"
for file in $(find "$DIR/examples/pass" -name '*.dew' 2>/dev/null | sort); do
    rel="${file#$DIR/examples/}"
    expected=$(head -1 "$file" | sed 's/.*expect: //')
    echo -n "  $rel ... "
    output=$("$DEW" "$file" 2>/dev/null | tail -1 || echo "ERROR")
    if [ "$output" = "$expected" ]; then
        echo "OK ($output)"
        PASS=$((PASS + 1))
    else
        echo "FAIL (expected '$expected', got '$output')"
        FAIL=$((FAIL + 1))
    fi
done

echo ""
echo "--- fail/ ---"
for file in $(find "$DIR/examples/fail" -name '*.dew' 2>/dev/null | sort); do
    rel="${file#$DIR/examples/}"
    expected_code=$(head -1 "$file" | sed 's/.*expect error: //')
    echo -n "  $rel ... "
    output=$("$DEW" "$file" 2>&1 || true)
    if echo "$output" | grep -Fq "$expected_code"; then
        echo "OK"
        PASS=$((PASS + 1))
    else
        echo "FAIL (expected [$expected_code])"
        FAIL=$((FAIL + 1))
    fi
done

echo ""
echo "=== Results: $PASS passed, $FAIL failed ==="
if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
