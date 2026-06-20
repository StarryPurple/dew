#!/usr/bin/env bash
# Rx→Dew Pipeline Test
#
# For each comprehensive test case:
#   1. Translate Rx → Dew (.dew)
#   2. Run interpreter on .dew with .in stdin → compare stdout to .out
#   3. Generate LLVM IR → save .dewll
#   4. Compile LLVM IR to executable → save .dewexe
#   5. Run .dewexe with .in stdin → compare stdout to .out
#
# Usage: bash tools/rx_pipeline_test.sh [case_number]
#   Without args, runs all 50 cases.
#   With a number, runs only that case.

set -euo pipefail

BASE="RustShard-Compiler/test"
DEW_BIN="target/debug/dew"
PASS=0; FAIL=0; INTERP_OK=0; INTERP_MIS=0; LLVM_OK=0; EXE_OK=0

run_case() {
  local i="$1"
  local dir="${BASE}/comprehensive${i}"
  local rx="${dir}/comprehensive${i}.rx"
  local dew="${dir}/comprehensive${i}.dew"
  local dewll="${dir}/comprehensive${i}.dewll"
  local dewexe="${dir}/comprehensive${i}.dewexe"
  local infile="${dir}/comprehensive${i}.in"
  local outfile="${dir}/comprehensive${i}.out"

  # Step 1: Rx → Dew translation
  if ! ${DEW_BIN} rx2dew "$rx" > "$dew" 2>/dev/null; then
    echo "  [FAIL] Rx→Dew translation failed"
    FAIL=$((FAIL+1))
    return
  fi
  PASS=$((PASS+1))

  # Step 2: Interpreter test
  local interp_result
  interp_result=$(${DEW_BIN} "$dew" < "$infile" 2>/dev/null) || true
  local expected
  expected=$(cat "$outfile")
  local interp_exit=$?
  if [ "$interp_result" = "$expected" ]; then
    echo "  [OK]   interpreter output matches"
    INTERP_OK=$((INTERP_OK+1))
  else
    echo "  [MIS]  interpreter: expected '$expected', got '$interp_result'"
    INTERP_MIS=$((INTERP_MIS+1))
  fi

  # Step 3: LLVM IR generation
  local llvm_ir
  llvm_ir=$(${DEW_BIN} "$dew" --emit=llvm 2>/dev/null) || true
  if [ -n "$llvm_ir" ]; then
    echo "$llvm_ir" > "$dewll"
    echo "  [OK]   LLVM IR generated (${#llvm_ir} bytes)"
    LLVM_OK=$((LLVM_OK+1))
  else
    echo "  [----] LLVM IR generation skipped (type errors)"
    return
  fi

  # Step 4: Compile to executable
  if ! echo "$llvm_ir" | clang -x ir - -o "$dewexe" -Wno-override-module 2>/dev/null; then
    echo "  [----] Executable compilation failed"
    return
  fi

  # Step 5: Executable test
  local exe_result
  exe_result=$("$dewexe" < "$infile" 2>/dev/null) || true
  if [ "$exe_result" = "$expected" ]; then
    echo "  [OK]   executable output matches"
    EXE_OK=$((EXE_OK+1))
  else
    echo "  [MIS]  executable: expected '$expected', got '$exe_result'"
  fi
}

main() {
  echo "========== Rx→Dew Pipeline Test =========="
  echo ""

  if [ $# -ge 1 ] && [ "$1" -ge 1 ] 2>/dev/null; then
    echo "--- Case $1 ---"
    run_case "$1"
  else
    for i in $(seq 1 50); do
      echo "--- Case $i ---"
      run_case "$i"
    done
  fi

  echo ""
  echo "========== Results =========="
  echo "Rx→Dew translations: $PASS/50"
  echo "Interpreter correct:  $INTERP_OK/$((INTERP_OK+INTERP_MIS))"
  echo "LLVM IR generated:    $LLVM_OK"
  echo "Executable correct:   $EXE_OK"
}

main "$@"
