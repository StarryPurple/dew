#!/bin/bash
# Dew compiler test runner
set -e

DIR="$(cd "$(dirname "$0")/.." && pwd)"
DEW="$DIR/target/debug/dew"
MODE="${1:-eval}"
PASS=0
FAIL=0

echo "=== Dew Compiler Test Runner ($MODE) ==="
echo ""

echo "--- pass/ ---"
for file in $(find "$DIR/examples/pass" -name '*.dew' ! -name '*.desugared.dew' 2>/dev/null | sort); do
    rel="${file#$DIR/examples/}"
    first_line=$(head -1 "$file")
    # Skip deprecated tests
    if echo "$first_line" | grep -q "deprecated:"; then
        echo "  $rel ... SKIP (deprecated)"
        continue
    fi
    expected=$(echo "$first_line" | sed 's/.*expect: //')
    echo -n "  $rel ... "
    if [ "$MODE" = "llvm" ]; then
        output=$("$DEW" "$file" --backend=llvm 2>/dev/null | tail -1 || echo "ERROR")
    else
        output=$("$DEW" "$file" 2>/dev/null | tail -1 || echo "ERROR")
    fi
    if [ "$output" = "$expected" ]; then
        echo "OK ($output)"
        PASS=$((PASS + 1))
    else
        echo "FAIL (expected '$expected', got '$output')"
        FAIL=$((FAIL + 1))
    fi

    # Generate debug artifacts (non-fatal)
    "$DEW" "$file" --emit=desugared > "$file.desugared.dew" 2>/dev/null || true
    "$DEW" "$file" --emit=text > "$file.dewir" 2>/dev/null || true
done

echo ""
echo "--- fail/ ---"
for file in $(find "$DIR/examples/fail" -name '*.dew' 2>/dev/null | sort); do
    rel="${file#$DIR/examples/}"
    first_line=$(head -1 "$file")
    # Skip deprecated tests
    if echo "$first_line" | grep -q "deprecated:"; then
        echo "  $rel ... SKIP (deprecated)"
        continue
    fi
    expected_code=$(echo "$first_line" | sed 's/.*expect error: //')
    echo -n "  $rel ... "
    if [ "$MODE" = "llvm" ]; then
        output=$("$DEW" "$file" --emit=llvm 2>&1 | head -5 || true)
    else
        output=$("$DEW" "$file" 2>&1 || true)
    fi
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
