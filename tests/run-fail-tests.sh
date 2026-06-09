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
    EXPECTED_PREFIX=$(echo "$BASENAME" | cut -c1-4 | tr 'a-z' 'A-Z')
    # D001 → D001, W001 → W001
    EXPECTED="$EXPECTED_PREFIX"

    RESULT=$(cargo run -q -- "$f" 2>&1) || true

    if [ "${EXPECTED:0:1}" = "W" ]; then
        # W-prefix = warning — check JSON diagnostics, not type error
        if echo "$RESULT" | grep -q '"leaks"'; then
            echo "PASS $BASENAME → $EXPECTED (warning in diagnostics)"
            PASSED=$((PASSED + 1))
        else
            echo "FAIL $BASENAME — expected $EXPECTED warning in diagnostics"
            FAILED=$((FAILED + 1))
        fi
    elif echo "$RESULT" | grep -q "\[$EXPECTED\]"; then
        echo "PASS $BASENAME → $EXPECTED"
        PASSED=$((PASSED + 1))
    elif echo "$RESULT" | grep -q "Parse error"; then
        echo "FAIL $BASENAME — PARSE ERROR: $(echo "$RESULT" | grep 'Parse error')"
        FAILED=$((FAILED + 1))
    else
        echo "FAIL $BASENAME — expected [$EXPECTED], got: $(echo "$RESULT" | grep -E '\[[DW]' | head -1)"
        FAILED=$((FAILED + 1))
    fi
done

echo ""
echo "=== Results: $PASSED passed, $FAILED failed, $SKIPPED skipped ==="
exit $FAILED
