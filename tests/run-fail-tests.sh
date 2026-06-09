#!/bin/bash
# Run all compile-failure tests and report results.
# Expected: each test produces its named error code (d001 → D001).
# D002 tests are warnings — they produce JSON diagnostics, not type errors.

set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
FAIL_DIR="$DIR/fail"
PASSED=0
FAILED=0
SKIPPED=0

echo "=== Dew Compile Failure Tests ==="
echo ""

for f in "$FAIL_DIR"/*.dew; do
    BASENAME=$(basename "$f")
    EXPECTED_CODE=$(echo "$BASENAME" | cut -c1-4 | tr 'a-z' 'A-Z')
    EXPECTED="$EXPECTED_CODE"

    RESULT=$(cargo run -q -- "$f" 2>&1) || true
    ACTUAL=$(echo "$RESULT" | grep -oP '\[D\d+\]' | head -1 || echo "")

    if [ "$EXPECTED_CODE" = "D002" ]; then
        # D002 is a warning — check JSON diagnostics
        if echo "$RESULT" | grep -q '"leaks"'; then
            echo "PASS $BASENAME → D002 (warning in diagnostics)"
            PASSED=$((PASSED + 1))
        else
            echo "FAIL $BASENAME — expected D002 warning in diagnostics"
            FAILED=$((FAILED + 1))
        fi
    elif [ "$ACTUAL" = "[$EXPECTED]" ]; then
        echo "PASS $BASENAME → $ACTUAL"
        PASSED=$((PASSED + 1))
    elif echo "$RESULT" | grep -q "Parse error"; then
        echo "FAIL $BASENAME — PARSE ERROR: $(echo "$RESULT" | grep 'Parse error')"
        FAILED=$((FAILED + 1))
    else
        echo "FAIL $BASENAME — expected [$EXPECTED], got: $(echo "$RESULT" | grep -E '\[D|Type error' | head -1)"
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "=== Results: $PASSED passed, $FAILED failed, $SKIPPED skipped ==="
exit $FAILED
