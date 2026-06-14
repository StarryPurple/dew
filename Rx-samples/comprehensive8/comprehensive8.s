# ============================================================
# builtin.s —— Runtime support
# ============================================================

.section .rodata
.L.fmt_int:
  .asciz "%d"
.L.fmt_int_nl:
  .asciz "%d\n"

.section .text

# ============================================================
# void printInt(i32 n)
# ============================================================
.globl printInt
printInt:
  addi sp, sp, -16
  sd ra, 8(sp)

  mv a1, a0
  la a0, .L.fmt_int
  call printf

  ld ra, 8(sp)
  addi sp, sp, 16
  ret

# ============================================================
# void printlnInt(i32 n)
# ============================================================
.globl printlnInt
printlnInt:
  addi sp, sp, -16
  sd ra, 8(sp)

  mv a1, a0
  la a0, .L.fmt_int_nl
  call printf

  ld ra, 8(sp)
  addi sp, sp, 16
  ret

# ============================================================
# i32 getInt()
# ============================================================
.globl getInt
getInt:
  addi sp, sp, -32
  sd ra, 24(sp)

  la a0, .L.fmt_int
  addi a1, sp, 16
  call scanf

  lw a0, 16(sp)

  ld ra, 24(sp)
  addi sp, sp, 32
  ret

# ============================================================
# void exit(i32 code)
# deleted, since it's name and behavior is same as that one in C.
# ============================================================
# .globl exit
# exit:
#   li a7, 93
#   ecall

.section .text

.globl main
main:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
main._0.entry.0:
# Start call preparation
  li a0, 1800
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testClassicDynamicProgramming
# ir inst 2 fin
# Start call preparation
  call .F.testSequenceAlignmentDP
# ir inst 3 fin
# Start call preparation
  call .F.testOptimizationProblems
# ir inst 4 fin
# Start call preparation
  call .F.testGameTheoryDP
# ir inst 5 fin
# Start call preparation
  call .F.testAdvancedDPPatterns
# ir inst 6 fin
# Start call preparation
  li a0, 1899
  call printlnInt
# ir inst 7 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 8 fin
  j main.epilogue                                                       # ir inst 9 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testClassicDynamicProgramming
.F.testClassicDynamicProgramming:
# spill func args num: 0,             range:     3616(sp) -     3616(sp)
# local var size: 3600,               range:       16(sp) -     3616(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3616
  add sp, sp, t0
  sd ra, 8(sp)
.F.testClassicDynamicProgramming._0.entry.0:
# Start call preparation
  li a0, 1801
  call printlnInt
# ir inst 6 fin
# Start call preparation
  li a0, 45
  call .F.fibonacciDP
  mv t6, a0
# ir inst 7 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 8 fin
  li t1, 2616
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 10 fin
# Phi connections
  li t5, 0
  j .F.testClassicDynamicProgramming._1.array.cond.0                    # ir inst 11 fin
.F.testClassicDynamicProgramming._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 13 fin
  bnez t4, .F.testClassicDynamicProgramming._2.array.body.0
  j .F.testClassicDynamicProgramming._3.array.exit.0                    # ir inst 14 fin
.F.testClassicDynamicProgramming._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.testClassicDynamicProgramming._1.array.cond.0                    # ir inst 18 fin
.F.testClassicDynamicProgramming._3.array.exit.0:
# Start call preparation
  li a2, 400
  li t1, 2616
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 19 fin
# Start call preparation
  li a1, 100
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeSequence
# ir inst 20 fin
# Start call preparation
  li a2, 400
  li t1, 2616
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 416
  mv a0, t1
  call memcpy
# ir inst 21 fin
# Start call preparation
  li a1, 100
  addi t1, sp, 416
  mv a0, t1
  call .F.longestIncreasingSubsequence
  mv t6, a0
# ir inst 22 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 23 fin
# Start call preparation
  li a0, 247
  call .F.coinChangeDP
  mv t6, a0
# ir inst 24 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 25 fin
  li t1, 3016
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 27 fin
# Phi connections
  li t5, 0
  j .F.testClassicDynamicProgramming._4.array.cond.1                    # ir inst 28 fin
.F.testClassicDynamicProgramming._4.array.cond.1:
  li t2, 150
  slt t4, t5, t2                                                        # ir inst 30 fin
  bnez t4, .F.testClassicDynamicProgramming._5.array.body.1
  j .F.testClassicDynamicProgramming._6.array.exit.1                    # ir inst 31 fin
.F.testClassicDynamicProgramming._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 32 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 33 fin
  addi t4, t5, 1                                                        # ir inst 34 fin
# Phi connections
  mv t5, t4
  j .F.testClassicDynamicProgramming._4.array.cond.1                    # ir inst 35 fin
.F.testClassicDynamicProgramming._6.array.exit.1:
# Start call preparation
  li a2, 600
  li t1, 3016
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 816
  mv a0, t1
  call memcpy
# ir inst 36 fin
# Start call preparation
  li a1, 150
  addi t1, sp, 816
  mv a0, t1
  call .F.initializeArray
# ir inst 37 fin
# Start call preparation
  li a2, 600
  li t1, 3016
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1416
  mv a0, t1
  call memcpy
# ir inst 38 fin
# Start call preparation
  li a1, 150
  addi t1, sp, 1416
  mv a0, t1
  call .F.maximumSubarraySum
  mv t6, a0
# ir inst 39 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 40 fin
# Start call preparation
  li a2, 600
  li t1, 3016
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 2016
  mv a0, t1
  call memcpy
# ir inst 41 fin
# Start call preparation
  li a1, 150
  addi t1, sp, 2016
  mv a0, t1
  call .F.houseRobberDP
  mv t6, a0
# ir inst 42 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 43 fin
# Start call preparation
  li a0, 1802
  call printlnInt
# ir inst 44 fin
  j .F.testClassicDynamicProgramming.epilogue                           # ir inst 45 fin
.F.testClassicDynamicProgramming.epilogue:
  ld ra, 8(sp)
  li t0, 3616
  add sp, sp, t0
  ret

.globl .F.fibonacciDP
.F.fibonacciDP:
# spill func args num: 0,             range:      192(sp) -      192(sp)
# local var size: 184,                range:        8(sp) -      192(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -192
  sd s11, 0(sp)
.F.fibonacciDP._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.fibonacciDP._1.if.then.0
  j .F.fibonacciDP._2.if.else.0                                         # ir inst 2 fin
.F.fibonacciDP._1.if.then.0:
  j .F.fibonacciDP.epilogue                                             # ir inst 3 fin
.F.fibonacciDP._2.if.else.0:
  j .F.fibonacciDP._3.if.exit.0                                         # ir inst 4 fin
.F.fibonacciDP._3.if.exit.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 6 fin
# Phi connections
  li t5, 0
  j .F.fibonacciDP._4.array.cond.0                                      # ir inst 7 fin
.F.fibonacciDP._4.array.cond.0:
  li t2, 46
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, .F.fibonacciDP._5.array.body.0
  j .F.fibonacciDP._6.array.exit.0                                      # ir inst 10 fin
.F.fibonacciDP._5.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j .F.fibonacciDP._4.array.cond.0                                      # ir inst 14 fin
.F.fibonacciDP._6.array.exit.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 8
  addi t6, t1, 4                                                        # ir inst 17 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 18 fin
# Phi connections
  li t6, 2
  j .F.fibonacciDP._7.while.cond.0                                      # ir inst 19 fin
.F.fibonacciDP._7.while.cond.0:
  slt t0, a0, t6
  xori t5, t0, 1                                                        # ir inst 21 fin
  bnez t5, .F.fibonacciDP._8.while.body.0
  j .F.fibonacciDP._9.while.exit.0                                      # ir inst 22 fin
.F.fibonacciDP._8.while.body.0:
  mv t5, t6                                                             # ir inst 23 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 24 fin
  addi t5, t6, -1                                                       # ir inst 25 fin
  mv t3, t5                                                             # ir inst 26 fin
  slli t2, t3, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 27 fin
  lw t3, 0(t5)                                                          # ir inst 28 fin
  addi t5, t6, -2                                                       # ir inst 29 fin
  mv s11, t5                                                            # ir inst 30 fin
  slli t2, s11, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 31 fin
  lw s11, 0(t5)                                                         # ir inst 32 fin
  add t5, t3, s11                                                       # ir inst 33 fin
  sw t5, 0(t4)                                                          # ir inst 34 fin
  addi t5, t6, 1                                                        # ir inst 35 fin
# Phi connections
  mv t6, t5
  j .F.fibonacciDP._7.while.cond.0                                      # ir inst 36 fin
.F.fibonacciDP._9.while.exit.0:
  mv t6, a0                                                             # ir inst 37 fin
  slli t2, t6, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 38 fin
  lw t6, 0(t5)                                                          # ir inst 39 fin
  mv a0, t6
  j .F.fibonacciDP.epilogue                                             # ir inst 40 fin
.F.fibonacciDP.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 192
  ret

.globl .F.initializeSequence
.F.initializeSequence:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeSequence._0.entry.0:
# Phi connections
  li t5, 145
  li t6, 0
  j .F.initializeSequence._1.while.cond.0                               # ir inst 1 fin
.F.initializeSequence._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.initializeSequence._2.while.body.0
  j .F.initializeSequence._6.while.exit.0                               # ir inst 5 fin
.F.initializeSequence._2.while.body.0:
  li t2, 1664
  mul t4, t5, t2                                                        # ir inst 6 fin
  li t2, 101223
  add t5, t4, t2                                                        # ir inst 7 fin
  li t2, 214647
  rem t4, t5, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 9 fin
  bnez t5, .F.initializeSequence._3.if.then.0
  j .F.initializeSequence._4.if.else.0                                  # ir inst 10 fin
.F.initializeSequence._3.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 11 fin
# Phi connections
  j .F.initializeSequence._5.if.exit.0                                  # ir inst 12 fin
.F.initializeSequence._4.if.else.0:
# Phi connections
  mv t5, t4
  j .F.initializeSequence._5.if.exit.0                                  # ir inst 13 fin
.F.initializeSequence._5.if.exit.0:
  mv t4, t6                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 16 fin
  li t2, 1000
  rem t4, t5, t2                                                        # ir inst 17 fin
  sw t4, 0(t3)                                                          # ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F.initializeSequence._1.while.cond.0                               # ir inst 20 fin
.F.initializeSequence._6.while.exit.0:
  j .F.initializeSequence.epilogue                                      # ir inst 21 fin
.F.initializeSequence.epilogue:
  ret

.globl .F.longestIncreasingSubsequence
.F.longestIncreasingSubsequence:
# spill func args num: 0,             range:      416(sp) -      416(sp)
# local var size: 400,                range:       16(sp) -      416(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -416
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.longestIncreasingSubsequence._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.longestIncreasingSubsequence._1.array.cond.0                     # ir inst 3 fin
.F.longestIncreasingSubsequence._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.longestIncreasingSubsequence._2.array.body.0
  j .F.longestIncreasingSubsequence._3.array.exit.0                     # ir inst 6 fin
.F.longestIncreasingSubsequence._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.longestIncreasingSubsequence._1.array.cond.0                     # ir inst 10 fin
.F.longestIncreasingSubsequence._3.array.exit.0:
# Phi connections
  li t5, 1
  li t6, 1
  j .F.longestIncreasingSubsequence._4.while.cond.0                     # ir inst 11 fin
.F.longestIncreasingSubsequence._4.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 14 fin
  bnez t4, .F.longestIncreasingSubsequence._5.while.body.0
  j .F.longestIncreasingSubsequence._18.while.exit.0                    # ir inst 15 fin
.F.longestIncreasingSubsequence._5.while.body.0:
# Phi connections
  li t4, 0
  j .F.longestIncreasingSubsequence._6.while.cond.1                     # ir inst 16 fin
.F.longestIncreasingSubsequence._6.while.cond.1:
  slt t3, t4, t5                                                        # ir inst 18 fin
  bnez t3, .F.longestIncreasingSubsequence._7.while.body.1
  j .F.longestIncreasingSubsequence._14.while.exit.1                    # ir inst 19 fin
.F.longestIncreasingSubsequence._7.while.body.1:
  mv t3, t4                                                             # ir inst 20 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 21 fin
  lw t3, 0(s11)                                                         # ir inst 22 fin
  mv s11, t5                                                            # ir inst 23 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 24 fin
  lw s11, 0(s10)                                                        # ir inst 25 fin
  slt s10, t3, s11                                                      # ir inst 26 fin
  bnez s10, .F.longestIncreasingSubsequence._8.lazy.then.0
  j .F.longestIncreasingSubsequence._9.lazy.else.0                      # ir inst 27 fin
.F.longestIncreasingSubsequence._8.lazy.then.0:
  mv t3, t4                                                             # ir inst 28 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 29 fin
  lw t3, 0(s11)                                                         # ir inst 30 fin
  addi s11, t3, 1                                                       # ir inst 31 fin
  mv t3, t5                                                             # ir inst 32 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s10, t1, t2                                                       # ir inst 33 fin
  lw t3, 0(s10)                                                         # ir inst 34 fin
  slt s10, t3, s11                                                      # ir inst 35 fin
# Phi connections
  mv t3, s10
  j .F.longestIncreasingSubsequence._10.lazy.exit.0                     # ir inst 36 fin
.F.longestIncreasingSubsequence._9.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.longestIncreasingSubsequence._10.lazy.exit.0                     # ir inst 37 fin
.F.longestIncreasingSubsequence._10.lazy.exit.0:
  bnez t3, .F.longestIncreasingSubsequence._11.if.then.0
  j .F.longestIncreasingSubsequence._12.if.else.0                       # ir inst 39 fin
.F.longestIncreasingSubsequence._11.if.then.0:
  mv t3, t5                                                             # ir inst 40 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 41 fin
  mv t3, t4                                                             # ir inst 42 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s10, t1, t2                                                       # ir inst 43 fin
  lw t3, 0(s10)                                                         # ir inst 44 fin
  addi s10, t3, 1                                                       # ir inst 45 fin
  sw s10, 0(s11)                                                        # ir inst 46 fin
  j .F.longestIncreasingSubsequence._13.if.exit.0                       # ir inst 47 fin
.F.longestIncreasingSubsequence._12.if.else.0:
  j .F.longestIncreasingSubsequence._13.if.exit.0                       # ir inst 48 fin
.F.longestIncreasingSubsequence._13.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 49 fin
# Phi connections
  mv t4, t3
  j .F.longestIncreasingSubsequence._6.while.cond.1                     # ir inst 50 fin
.F.longestIncreasingSubsequence._14.while.exit.1:
  mv t4, t5                                                             # ir inst 51 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 52 fin
  lw t4, 0(t3)                                                          # ir inst 53 fin
  slt t3, t6, t4                                                        # ir inst 54 fin
  bnez t3, .F.longestIncreasingSubsequence._15.if.then.1
  j .F.longestIncreasingSubsequence._16.if.else.1                       # ir inst 55 fin
.F.longestIncreasingSubsequence._15.if.then.1:
  mv t4, t5                                                             # ir inst 56 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 57 fin
  lw t4, 0(t3)                                                          # ir inst 58 fin
# Phi connections
  j .F.longestIncreasingSubsequence._17.if.exit.1                       # ir inst 59 fin
.F.longestIncreasingSubsequence._16.if.else.1:
# Phi connections
  mv t4, t6
  j .F.longestIncreasingSubsequence._17.if.exit.1                       # ir inst 60 fin
.F.longestIncreasingSubsequence._17.if.exit.1:
  addi t3, t5, 1                                                        # ir inst 62 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.longestIncreasingSubsequence._4.while.cond.0                     # ir inst 63 fin
.F.longestIncreasingSubsequence._18.while.exit.0:
  mv a0, t6
  j .F.longestIncreasingSubsequence.epilogue                            # ir inst 64 fin
.F.longestIncreasingSubsequence.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 416
  ret

.globl .F.coinChangeDP
.F.coinChangeDP:
# spill func args num: 0,             range:     1040(sp) -     1040(sp)
# local var size: 1012,               range:       16(sp) -     1028(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1040
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.coinChangeDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 10
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 25
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 16
  addi t6, t1, 16                                                       # ir inst 10 fin
  li t1, 50
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 36
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.coinChangeDP._1.array.cond.0                                     # ir inst 14 fin
.F.coinChangeDP._1.array.cond.0:
  li t2, 248
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.coinChangeDP._2.array.body.0
  j .F.coinChangeDP._3.array.exit.0                                     # ir inst 17 fin
.F.coinChangeDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 9999
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.coinChangeDP._1.array.cond.0                                     # ir inst 21 fin
.F.coinChangeDP._3.array.exit.0:
  addi t1, sp, 36
  addi t6, t1, 0                                                        # ir inst 22 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 23 fin
# Phi connections
  li t6, 1
  j .F.coinChangeDP._4.while.cond.0                                     # ir inst 24 fin
.F.coinChangeDP._4.while.cond.0:
  slt t0, a0, t6
  xori t5, t0, 1                                                        # ir inst 26 fin
  bnez t5, .F.coinChangeDP._5.while.body.0
  j .F.coinChangeDP._15.while.exit.0                                    # ir inst 27 fin
.F.coinChangeDP._5.while.body.0:
# Phi connections
  li t5, 0
  j .F.coinChangeDP._6.while.cond.1                                     # ir inst 28 fin
.F.coinChangeDP._6.while.cond.1:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 30 fin
  bnez t4, .F.coinChangeDP._7.while.body.1
  j .F.coinChangeDP._14.while.exit.1                                    # ir inst 31 fin
.F.coinChangeDP._7.while.body.1:
  mv t4, t5                                                             # ir inst 32 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 33 fin
  lw t4, 0(t3)                                                          # ir inst 34 fin
  slt t0, t6, t4
  xori t3, t0, 1                                                        # ir inst 35 fin
  bnez t3, .F.coinChangeDP._8.lazy.then.0
  j .F.coinChangeDP._9.lazy.else.0                                      # ir inst 36 fin
.F.coinChangeDP._8.lazy.then.0:
  sub t3, t6, t4                                                        # ir inst 37 fin
  mv s11, t3                                                            # ir inst 38 fin
  slli t2, s11, 2
  addi t1, sp, 36
  add t3, t1, t2                                                        # ir inst 39 fin
  lw s11, 0(t3)                                                         # ir inst 40 fin
  addi t3, s11, 1                                                       # ir inst 41 fin
  mv s11, t6                                                            # ir inst 42 fin
  slli t2, s11, 2
  addi t1, sp, 36
  add s10, t1, t2                                                       # ir inst 43 fin
  lw s11, 0(s10)                                                        # ir inst 44 fin
  slt s10, t3, s11                                                      # ir inst 45 fin
# Phi connections
  mv t3, s10
  j .F.coinChangeDP._10.lazy.exit.0                                     # ir inst 46 fin
.F.coinChangeDP._9.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.coinChangeDP._10.lazy.exit.0                                     # ir inst 47 fin
.F.coinChangeDP._10.lazy.exit.0:
  bnez t3, .F.coinChangeDP._11.if.then.0
  j .F.coinChangeDP._12.if.else.0                                       # ir inst 49 fin
.F.coinChangeDP._11.if.then.0:
  mv t3, t6                                                             # ir inst 50 fin
  slli t2, t3, 2
  addi t1, sp, 36
  add s11, t1, t2                                                       # ir inst 51 fin
  sub t3, t6, t4                                                        # ir inst 52 fin
  mv t4, t3                                                             # ir inst 53 fin
  slli t2, t4, 2
  addi t1, sp, 36
  add t3, t1, t2                                                        # ir inst 54 fin
  lw t4, 0(t3)                                                          # ir inst 55 fin
  addi t3, t4, 1                                                        # ir inst 56 fin
  sw t3, 0(s11)                                                         # ir inst 57 fin
  j .F.coinChangeDP._13.if.exit.0                                       # ir inst 58 fin
.F.coinChangeDP._12.if.else.0:
  j .F.coinChangeDP._13.if.exit.0                                       # ir inst 59 fin
.F.coinChangeDP._13.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.coinChangeDP._6.while.cond.1                                     # ir inst 61 fin
.F.coinChangeDP._14.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 62 fin
# Phi connections
  mv t6, t5
  j .F.coinChangeDP._4.while.cond.0                                     # ir inst 63 fin
.F.coinChangeDP._15.while.exit.0:
  mv t6, a0                                                             # ir inst 64 fin
  slli t2, t6, 2
  addi t1, sp, 36
  add t5, t1, t2                                                        # ir inst 65 fin
  lw t6, 0(t5)                                                          # ir inst 66 fin
  mv a0, t6
  j .F.coinChangeDP.epilogue                                            # ir inst 67 fin
.F.coinChangeDP.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 1040
  ret

.globl .F.initializeArray
.F.initializeArray:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeArray._0.entry.0:
# Phi connections
  li t5, 321
  li t6, 0
  j .F.initializeArray._1.while.cond.0                                  # ir inst 1 fin
.F.initializeArray._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.initializeArray._2.while.body.0
  j .F.initializeArray._9.while.exit.0                                  # ir inst 5 fin
.F.initializeArray._2.while.body.0:
  li t2, 1665
  mul t4, t5, t2                                                        # ir inst 6 fin
  li t2, 904223
  add t5, t4, t2                                                        # ir inst 7 fin
  li t2, 143647
  rem t4, t5, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 9 fin
  bnez t5, .F.initializeArray._3.if.then.0
  j .F.initializeArray._4.if.else.0                                     # ir inst 10 fin
.F.initializeArray._3.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 11 fin
# Phi connections
  j .F.initializeArray._5.if.exit.0                                     # ir inst 12 fin
.F.initializeArray._4.if.else.0:
# Phi connections
  mv t5, t4
  j .F.initializeArray._5.if.exit.0                                     # ir inst 13 fin
.F.initializeArray._5.if.exit.0:
  li t2, 3
  rem t4, t5, t2                                                        # ir inst 15 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.initializeArray._6.if.then.1
  j .F.initializeArray._7.if.else.1                                     # ir inst 17 fin
.F.initializeArray._6.if.then.1:
  mv t4, t6                                                             # ir inst 18 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 19 fin
  li t2, 100
  rem t4, t5, t2                                                        # ir inst 20 fin
  li t1, 0
  sub s11, t1, t4                                                       # ir inst 21 fin
  sw s11, 0(t3)                                                         # ir inst 22 fin
  j .F.initializeArray._8.if.exit.1                                     # ir inst 23 fin
.F.initializeArray._7.if.else.1:
  mv t4, t6                                                             # ir inst 24 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 25 fin
  li t2, 100
  rem t4, t5, t2                                                        # ir inst 26 fin
  sw t4, 0(t3)                                                          # ir inst 27 fin
  j .F.initializeArray._8.if.exit.1                                     # ir inst 28 fin
.F.initializeArray._8.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t4
  j .F.initializeArray._1.while.cond.0                                  # ir inst 30 fin
.F.initializeArray._9.while.exit.0:
  j .F.initializeArray.epilogue                                         # ir inst 31 fin
.F.initializeArray.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.maximumSubarraySum
.F.maximumSubarraySum:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.maximumSubarraySum._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 0                                                        # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
# Phi connections
  li t6, 1
  mv t0, t4
  mv t4, t5
  mv t5, t0
  j .F.maximumSubarraySum._1.while.cond.0                               # ir inst 5 fin
.F.maximumSubarraySum._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 9 fin
  bnez t3, .F.maximumSubarraySum._2.while.body.0
  j .F.maximumSubarraySum._9.while.exit.0                               # ir inst 10 fin
.F.maximumSubarraySum._2.while.body.0:
  mv t3, t6                                                             # ir inst 11 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
  add s11, t5, t3                                                       # ir inst 14 fin
  mv t3, t6                                                             # ir inst 15 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 16 fin
  lw t3, 0(s10)                                                         # ir inst 17 fin
  slt s10, t3, s11                                                      # ir inst 18 fin
  bnez s10, .F.maximumSubarraySum._3.if.then.0
  j .F.maximumSubarraySum._4.if.else.0                                  # ir inst 19 fin
.F.maximumSubarraySum._3.if.then.0:
  mv t3, t6                                                             # ir inst 20 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 21 fin
  lw t3, 0(s11)                                                         # ir inst 22 fin
  add s11, t5, t3                                                       # ir inst 23 fin
# Phi connections
  mv t5, s11
  j .F.maximumSubarraySum._5.if.exit.0                                  # ir inst 24 fin
.F.maximumSubarraySum._4.if.else.0:
  mv t5, t6                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 26 fin
  lw t5, 0(t3)                                                          # ir inst 27 fin
# Phi connections
  j .F.maximumSubarraySum._5.if.exit.0                                  # ir inst 28 fin
.F.maximumSubarraySum._5.if.exit.0:
  slt t3, t4, t5                                                        # ir inst 30 fin
  bnez t3, .F.maximumSubarraySum._6.if.then.1
  j .F.maximumSubarraySum._7.if.else.1                                  # ir inst 31 fin
.F.maximumSubarraySum._6.if.then.1:
# Phi connections
  mv t3, t5
  j .F.maximumSubarraySum._8.if.exit.1                                  # ir inst 32 fin
.F.maximumSubarraySum._7.if.else.1:
# Phi connections
  mv t3, t4
  j .F.maximumSubarraySum._8.if.exit.1                                  # ir inst 33 fin
.F.maximumSubarraySum._8.if.exit.1:
  addi s11, t6, 1                                                       # ir inst 35 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.maximumSubarraySum._1.while.cond.0                               # ir inst 36 fin
.F.maximumSubarraySum._9.while.exit.0:
  mv a0, t4
  j .F.maximumSubarraySum.epilogue                                      # ir inst 37 fin
.F.maximumSubarraySum.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.houseRobberDP
.F.houseRobberDP:
# spill func args num: 0,             range:      608(sp) -      608(sp)
# local var size: 600,                range:        8(sp) -      608(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -608
  sd s11, 0(sp)
.F.houseRobberDP._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.houseRobberDP._1.if.then.0
  j .F.houseRobberDP._2.if.else.0                                       # ir inst 2 fin
.F.houseRobberDP._1.if.then.0:
  li a0, 0
  j .F.houseRobberDP.epilogue                                           # ir inst 3 fin
.F.houseRobberDP._2.if.else.0:
  j .F.houseRobberDP._3.if.exit.0                                       # ir inst 4 fin
.F.houseRobberDP._3.if.exit.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.houseRobberDP._4.if.then.1
  j .F.houseRobberDP._5.if.else.1                                       # ir inst 6 fin
.F.houseRobberDP._4.if.then.1:
  addi t6, a0, 0                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
  mv a0, t5
  j .F.houseRobberDP.epilogue                                           # ir inst 9 fin
.F.houseRobberDP._5.if.else.1:
  j .F.houseRobberDP._6.if.exit.1                                       # ir inst 10 fin
.F.houseRobberDP._6.if.exit.1:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.houseRobberDP._7.array.cond.0                                    # ir inst 13 fin
.F.houseRobberDP._7.array.cond.0:
  li t2, 150
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.houseRobberDP._8.array.body.0
  j .F.houseRobberDP._9.array.exit.0                                    # ir inst 16 fin
.F.houseRobberDP._8.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.houseRobberDP._7.array.cond.0                                    # ir inst 20 fin
.F.houseRobberDP._9.array.exit.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 21 fin
  addi t5, a0, 0                                                        # ir inst 22 fin
  lw t4, 0(t5)                                                          # ir inst 23 fin
  sw t4, 0(t6)                                                          # ir inst 24 fin
  addi t6, a0, 4                                                        # ir inst 25 fin
  lw t5, 0(t6)                                                          # ir inst 26 fin
  addi t6, a0, 0                                                        # ir inst 27 fin
  lw t4, 0(t6)                                                          # ir inst 28 fin
  slt t6, t4, t5                                                        # ir inst 29 fin
  bnez t6, .F.houseRobberDP._10.if.then.2
  j .F.houseRobberDP._11.if.else.2                                      # ir inst 30 fin
.F.houseRobberDP._10.if.then.2:
  addi t1, sp, 8
  addi t6, t1, 4                                                        # ir inst 31 fin
  addi t5, a0, 4                                                        # ir inst 32 fin
  lw t4, 0(t5)                                                          # ir inst 33 fin
  sw t4, 0(t6)                                                          # ir inst 34 fin
  j .F.houseRobberDP._12.if.exit.2                                      # ir inst 35 fin
.F.houseRobberDP._11.if.else.2:
  addi t1, sp, 8
  addi t6, t1, 4                                                        # ir inst 36 fin
  addi t5, a0, 0                                                        # ir inst 37 fin
  lw t4, 0(t5)                                                          # ir inst 38 fin
  sw t4, 0(t6)                                                          # ir inst 39 fin
  j .F.houseRobberDP._12.if.exit.2                                      # ir inst 40 fin
.F.houseRobberDP._12.if.exit.2:
# Phi connections
  li t6, 2
  j .F.houseRobberDP._13.while.cond.0                                   # ir inst 41 fin
.F.houseRobberDP._13.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 43 fin
  bnez t5, .F.houseRobberDP._14.while.body.0
  j .F.houseRobberDP._18.while.exit.0                                   # ir inst 44 fin
.F.houseRobberDP._14.while.body.0:
  addi t5, t6, -2                                                       # ir inst 45 fin
  mv t4, t5                                                             # ir inst 46 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 47 fin
  lw t4, 0(t5)                                                          # ir inst 48 fin
  mv t5, t6                                                             # ir inst 49 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 50 fin
  lw t5, 0(t3)                                                          # ir inst 51 fin
  add t3, t4, t5                                                        # ir inst 52 fin
  addi t5, t6, -1                                                       # ir inst 53 fin
  mv t4, t5                                                             # ir inst 54 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 55 fin
  lw t4, 0(t5)                                                          # ir inst 56 fin
  slt t5, t4, t3                                                        # ir inst 57 fin
  bnez t5, .F.houseRobberDP._15.if.then.3
  j .F.houseRobberDP._16.if.else.3                                      # ir inst 58 fin
.F.houseRobberDP._15.if.then.3:
  mv t5, t6                                                             # ir inst 59 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add s11, t1, t2                                                       # ir inst 60 fin
  sw t3, 0(s11)                                                         # ir inst 61 fin
  j .F.houseRobberDP._17.if.exit.3                                      # ir inst 62 fin
.F.houseRobberDP._16.if.else.3:
  mv t5, t6                                                             # ir inst 63 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 64 fin
  sw t4, 0(t3)                                                          # ir inst 65 fin
  j .F.houseRobberDP._17.if.exit.3                                      # ir inst 66 fin
.F.houseRobberDP._17.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 67 fin
# Phi connections
  mv t6, t5
  j .F.houseRobberDP._13.while.cond.0                                   # ir inst 68 fin
.F.houseRobberDP._18.while.exit.0:
  addi t6, a1, -1                                                       # ir inst 69 fin
  mv t5, t6                                                             # ir inst 70 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t6, t1, t2                                                        # ir inst 71 fin
  lw t5, 0(t6)                                                          # ir inst 72 fin
  mv a0, t5
  j .F.houseRobberDP.epilogue                                           # ir inst 73 fin
.F.houseRobberDP.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 608
  ret

.globl .F.testSequenceAlignmentDP
.F.testSequenceAlignmentDP:
# spill func args num: 0,             range:     2016(sp) -     2016(sp)
# local var size: 2000,               range:       16(sp) -     2016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -2016
  sd ra, 8(sp)
.F.testSequenceAlignmentDP._0.entry.0:
# Start call preparation
  li a0, 1803
  call printlnInt
# ir inst 9 fin
  addi t1, sp, 1616
  addi t6, t1, 0                                                        # ir inst 11 fin
# Phi connections
  li t5, 0
  j .F.testSequenceAlignmentDP._1.array.cond.0                          # ir inst 12 fin
.F.testSequenceAlignmentDP._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 14 fin
  bnez t4, .F.testSequenceAlignmentDP._2.array.body.0
  j .F.testSequenceAlignmentDP._3.array.exit.0                          # ir inst 15 fin
.F.testSequenceAlignmentDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 16 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 17 fin
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.testSequenceAlignmentDP._1.array.cond.0                          # ir inst 19 fin
.F.testSequenceAlignmentDP._3.array.exit.0:
  addi t1, sp, 1816
  addi t6, t1, 0                                                        # ir inst 21 fin
# Phi connections
  li t5, 0
  j .F.testSequenceAlignmentDP._4.array.cond.1                          # ir inst 22 fin
.F.testSequenceAlignmentDP._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 24 fin
  bnez t4, .F.testSequenceAlignmentDP._5.array.body.1
  j .F.testSequenceAlignmentDP._6.array.exit.1                          # ir inst 25 fin
.F.testSequenceAlignmentDP._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 26 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 27 fin
  addi t4, t5, 1                                                        # ir inst 28 fin
# Phi connections
  mv t5, t4
  j .F.testSequenceAlignmentDP._4.array.cond.1                          # ir inst 29 fin
.F.testSequenceAlignmentDP._6.array.exit.1:
# Start call preparation
  li a2, 200
  addi t1, sp, 1616
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 30 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1816
  mv a1, t1
  addi t1, sp, 216
  mv a0, t1
  call memcpy
# ir inst 31 fin
# Start call preparation
  li a3, 35
  li a2, 30
  addi t1, sp, 216
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeStrings
# ir inst 32 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1616
  mv a1, t1
  addi t1, sp, 416
  mv a0, t1
  call memcpy
# ir inst 33 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1816
  mv a1, t1
  addi t1, sp, 616
  mv a0, t1
  call memcpy
# ir inst 34 fin
# Start call preparation
  li a3, 35
  li a2, 30
  addi t1, sp, 616
  mv a1, t1
  addi t1, sp, 416
  mv a0, t1
  call .F.editDistanceDP
  mv t6, a0
# ir inst 35 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 36 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1616
  mv a1, t1
  addi t1, sp, 816
  mv a0, t1
  call memcpy
# ir inst 37 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1816
  mv a1, t1
  addi t1, sp, 1016
  mv a0, t1
  call memcpy
# ir inst 38 fin
# Start call preparation
  li a3, 35
  li a2, 30
  addi t1, sp, 1016
  mv a1, t1
  addi t1, sp, 816
  mv a0, t1
  call .F.longestCommonSubsequenceDP
  mv t6, a0
# ir inst 39 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 40 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1616
  mv a1, t1
  addi t1, sp, 1216
  mv a0, t1
  call memcpy
# ir inst 41 fin
# Start call preparation
  li a1, 30
  addi t1, sp, 1216
  mv a0, t1
  call .F.palindromePartitioningDP
  mv t6, a0
# ir inst 42 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 43 fin
# Start call preparation
  li a2, 200
  addi t1, sp, 1616
  mv a1, t1
  addi t1, sp, 1416
  mv a0, t1
  call memcpy
# ir inst 44 fin
# Start call preparation
  li a1, 30
  addi t1, sp, 1416
  mv a0, t1
  call .F.stringReconstructionDP
  mv t6, a0
# ir inst 45 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 46 fin
# Start call preparation
  li a0, 1804
  call printlnInt
# ir inst 47 fin
  j .F.testSequenceAlignmentDP.epilogue                                 # ir inst 48 fin
.F.testSequenceAlignmentDP.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 2016
  ret

.globl .F.initializeStrings
.F.initializeStrings:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeStrings._0.entry.0:
# Phi connections
  li t5, 98
  li t6, 0
  j .F.initializeStrings._1.while.cond.0                                # ir inst 1 fin
.F.initializeStrings._1.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 4 fin
  bnez t4, .F.initializeStrings._2.while.body.0
  j .F.initializeStrings._6.while.exit.0                                # ir inst 5 fin
.F.initializeStrings._2.while.body.0:
  li t2, 166
  mul t4, t5, t2                                                        # ir inst 6 fin
  li t2, 101390
  add t3, t4, t2                                                        # ir inst 7 fin
  li t2, 274847
  rem t4, t3, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t3, t4, t2                                                        # ir inst 9 fin
  bnez t3, .F.initializeStrings._3.if.then.0
  j .F.initializeStrings._4.if.else.0                                   # ir inst 10 fin
.F.initializeStrings._3.if.then.0:
  li t1, 0
  sub t3, t1, t4                                                        # ir inst 11 fin
# Phi connections
  mv t4, t3
  j .F.initializeStrings._5.if.exit.0                                   # ir inst 12 fin
.F.initializeStrings._4.if.else.0:
# Phi connections
  j .F.initializeStrings._5.if.exit.0                                   # ir inst 13 fin
.F.initializeStrings._5.if.exit.0:
  mv t3, t6                                                             # ir inst 15 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 16 fin
  li t2, 26
  rem t3, t4, t2                                                        # ir inst 17 fin
  addi s10, t3, 65                                                      # ir inst 18 fin
  sw s10, 0(s11)                                                        # ir inst 19 fin
  addi t3, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.initializeStrings._1.while.cond.0                                # ir inst 21 fin
.F.initializeStrings._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeStrings._7.while.cond.1                                # ir inst 22 fin
.F.initializeStrings._7.while.cond.1:
  slt t4, t6, a3                                                        # ir inst 25 fin
  bnez t4, .F.initializeStrings._8.while.body.1
  j .F.initializeStrings._18.while.exit.1                               # ir inst 26 fin
.F.initializeStrings._8.while.body.1:
  li t2, 166
  mul t4, t5, t2                                                        # ir inst 27 fin
  li t2, 101390
  add t5, t4, t2                                                        # ir inst 28 fin
  li t2, 274847
  rem t4, t5, t2                                                        # ir inst 29 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 30 fin
  bnez t5, .F.initializeStrings._9.if.then.1
  j .F.initializeStrings._10.if.else.1                                  # ir inst 31 fin
.F.initializeStrings._9.if.then.1:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 32 fin
# Phi connections
  j .F.initializeStrings._11.if.exit.1                                  # ir inst 33 fin
.F.initializeStrings._10.if.else.1:
# Phi connections
  mv t5, t4
  j .F.initializeStrings._11.if.exit.1                                  # ir inst 34 fin
.F.initializeStrings._11.if.exit.1:
  slt t4, t6, a2                                                        # ir inst 36 fin
  bnez t4, .F.initializeStrings._12.lazy.then.0
  j .F.initializeStrings._13.lazy.else.0                                # ir inst 37 fin
.F.initializeStrings._12.lazy.then.0:
  li t2, 3
  rem t4, t5, t2                                                        # ir inst 38 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 39 fin
# Phi connections
  mv t4, t3
  j .F.initializeStrings._14.lazy.exit.0                                # ir inst 40 fin
.F.initializeStrings._13.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.initializeStrings._14.lazy.exit.0                                # ir inst 41 fin
.F.initializeStrings._14.lazy.exit.0:
  bnez t4, .F.initializeStrings._15.if.then.2
  j .F.initializeStrings._16.if.else.2                                  # ir inst 43 fin
.F.initializeStrings._15.if.then.2:
  mv t4, t6                                                             # ir inst 44 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 45 fin
  mv t4, t6                                                             # ir inst 46 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 47 fin
  lw t4, 0(s11)                                                         # ir inst 48 fin
  sw t4, 0(t3)                                                          # ir inst 49 fin
  j .F.initializeStrings._17.if.exit.2                                  # ir inst 50 fin
.F.initializeStrings._16.if.else.2:
  mv t4, t6                                                             # ir inst 51 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 52 fin
  li t2, 26
  rem t4, t5, t2                                                        # ir inst 53 fin
  addi s11, t4, 65                                                      # ir inst 54 fin
  sw s11, 0(t3)                                                         # ir inst 55 fin
  j .F.initializeStrings._17.if.exit.2                                  # ir inst 56 fin
.F.initializeStrings._17.if.exit.2:
  addi t4, t6, 1                                                        # ir inst 57 fin
# Phi connections
  mv t6, t4
  j .F.initializeStrings._7.while.cond.1                                # ir inst 58 fin
.F.initializeStrings._18.while.exit.1:
  j .F.initializeStrings.epilogue                                       # ir inst 59 fin
.F.initializeStrings.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.editDistanceDP
.F.editDistanceDP:
# spill func args num: 0,             range:     7232(sp) -     7232(sp)
# local var size: 7200,               range:       24(sp) -     7224(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -7232
  add sp, sp, t0
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s11, 16(sp)
.F.editDistanceDP._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.editDistanceDP._1.array.cond.0                                   # ir inst 3 fin
.F.editDistanceDP._1.array.cond.0:
  li t2, 1800
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.editDistanceDP._2.array.body.0
  j .F.editDistanceDP._3.array.exit.0                                   # ir inst 6 fin
.F.editDistanceDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.editDistanceDP._1.array.cond.0                                   # ir inst 10 fin
.F.editDistanceDP._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.editDistanceDP._4.while.cond.0                                   # ir inst 11 fin
.F.editDistanceDP._4.while.cond.0:
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 13 fin
  bnez t5, .F.editDistanceDP._5.while.body.0
  j .F.editDistanceDP._6.while.exit.0                                   # ir inst 14 fin
.F.editDistanceDP._5.while.body.0:
  addi t5, a3, 1                                                        # ir inst 15 fin
  mul t4, t6, t5                                                        # ir inst 16 fin
  mv t5, t4                                                             # ir inst 17 fin
  slli t2, t5, 2
  addi t1, sp, 24
  add t4, t1, t2                                                        # ir inst 18 fin
  sw t6, 0(t4)                                                          # ir inst 19 fin
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.editDistanceDP._4.while.cond.0                                   # ir inst 21 fin
.F.editDistanceDP._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.editDistanceDP._7.while.cond.1                                   # ir inst 22 fin
.F.editDistanceDP._7.while.cond.1:
  slt t0, a3, t6
  xori t5, t0, 1                                                        # ir inst 24 fin
  bnez t5, .F.editDistanceDP._8.while.body.1
  j .F.editDistanceDP._9.while.exit.1                                   # ir inst 25 fin
.F.editDistanceDP._8.while.body.1:
  addi t5, a3, 1                                                        # ir inst 26 fin
  mv t5, t6                                                             # ir inst 27 fin
  slli t2, t5, 2
  addi t1, sp, 24
  add t4, t1, t2                                                        # ir inst 28 fin
  sw t6, 0(t4)                                                          # ir inst 29 fin
  addi t5, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t5
  j .F.editDistanceDP._7.while.cond.1                                   # ir inst 31 fin
.F.editDistanceDP._9.while.exit.1:
# Phi connections
  li t6, 1
  j .F.editDistanceDP._10.while.cond.2                                  # ir inst 32 fin
.F.editDistanceDP._10.while.cond.2:
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 34 fin
  bnez t5, .F.editDistanceDP._11.while.body.2
  j .F.editDistanceDP._24.while.exit.2                                  # ir inst 35 fin
.F.editDistanceDP._11.while.body.2:
# Phi connections
  li t5, 1
  j .F.editDistanceDP._12.while.cond.3                                  # ir inst 36 fin
.F.editDistanceDP._12.while.cond.3:
  slt t0, a3, t5
  xori t4, t0, 1                                                        # ir inst 38 fin
  bnez t4, .F.editDistanceDP._13.while.body.3
  j .F.editDistanceDP._23.while.exit.3                                  # ir inst 39 fin
.F.editDistanceDP._13.while.body.3:
  addi t4, t6, -1                                                       # ir inst 40 fin
  mv t3, t4                                                             # ir inst 41 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 42 fin
  lw t3, 0(t4)                                                          # ir inst 43 fin
  addi t4, t5, -1                                                       # ir inst 44 fin
  mv s11, t4                                                            # ir inst 45 fin
  slli t2, s11, 2
  add t4, a1, t2                                                        # ir inst 46 fin
  lw s11, 0(t4)                                                         # ir inst 47 fin
  xor t0, t3, s11
  sltiu t4, t0, 1                                                       # ir inst 48 fin
  bnez t4, .F.editDistanceDP._14.if.then.0
  j .F.editDistanceDP._15.if.else.0                                     # ir inst 49 fin
.F.editDistanceDP._14.if.then.0:
  addi t4, a3, 1                                                        # ir inst 50 fin
  mul t3, t6, t4                                                        # ir inst 51 fin
  add t4, t3, t5                                                        # ir inst 52 fin
  mv t3, t4                                                             # ir inst 53 fin
  slli t2, t3, 2
  addi t1, sp, 24
  add t4, t1, t2                                                        # ir inst 54 fin
  addi t3, t6, -1                                                       # ir inst 55 fin
  addi s11, a3, 1                                                       # ir inst 56 fin
  mul s10, t3, s11                                                      # ir inst 57 fin
  addi t3, t5, -1                                                       # ir inst 58 fin
  add s11, s10, t3                                                      # ir inst 59 fin
  mv t3, s11                                                            # ir inst 60 fin
  slli t2, t3, 2
  addi t1, sp, 24
  add s11, t1, t2                                                       # ir inst 61 fin
  lw t3, 0(s11)                                                         # ir inst 62 fin
  sw t3, 0(t4)                                                          # ir inst 63 fin
  j .F.editDistanceDP._22.if.exit.0                                     # ir inst 64 fin
.F.editDistanceDP._15.if.else.0:
  addi t4, a3, 1                                                        # ir inst 65 fin
  mul t3, t6, t4                                                        # ir inst 66 fin
  addi t4, t5, -1                                                       # ir inst 67 fin
  add s11, t3, t4                                                       # ir inst 68 fin
  mv t4, s11                                                            # ir inst 69 fin
  slli t2, t4, 2
  addi t1, sp, 24
  add t3, t1, t2                                                        # ir inst 70 fin
  lw t4, 0(t3)                                                          # ir inst 71 fin
  addi t3, t4, 1                                                        # ir inst 72 fin
  addi t4, t6, -1                                                       # ir inst 73 fin
  addi s11, a3, 1                                                       # ir inst 74 fin
  mul s10, t4, s11                                                      # ir inst 75 fin
  add t4, s10, t5                                                       # ir inst 76 fin
  mv s11, t4                                                            # ir inst 77 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add t4, t1, t2                                                        # ir inst 78 fin
  lw s11, 0(t4)                                                         # ir inst 79 fin
  addi t4, s11, 1                                                       # ir inst 80 fin
  addi s11, t6, -1                                                      # ir inst 81 fin
  addi s10, a3, 1                                                       # ir inst 82 fin
  mul s9, s11, s10                                                      # ir inst 83 fin
  addi s11, t5, -1                                                      # ir inst 84 fin
  add s10, s9, s11                                                      # ir inst 85 fin
  mv s11, s10                                                           # ir inst 86 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add s10, t1, t2                                                       # ir inst 87 fin
  lw s11, 0(s10)                                                        # ir inst 88 fin
  addi s10, s11, 1                                                      # ir inst 89 fin
  slt s11, t3, t4                                                       # ir inst 90 fin
  bnez s11, .F.editDistanceDP._16.if.then.1
  j .F.editDistanceDP._17.if.else.1                                     # ir inst 91 fin
.F.editDistanceDP._16.if.then.1:
# Phi connections
  mv t4, t3
  j .F.editDistanceDP._18.if.exit.1                                     # ir inst 92 fin
.F.editDistanceDP._17.if.else.1:
# Phi connections
  j .F.editDistanceDP._18.if.exit.1                                     # ir inst 93 fin
.F.editDistanceDP._18.if.exit.1:
  slt t3, s10, t4                                                       # ir inst 95 fin
  bnez t3, .F.editDistanceDP._19.if.then.2
  j .F.editDistanceDP._20.if.else.2                                     # ir inst 96 fin
.F.editDistanceDP._19.if.then.2:
  addi t3, a3, 1                                                        # ir inst 97 fin
  mul s11, t6, t3                                                       # ir inst 98 fin
  add t3, s11, t5                                                       # ir inst 99 fin
  mv s11, t3                                                            # ir inst 100 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add t3, t1, t2                                                        # ir inst 101 fin
  sw s10, 0(t3)                                                         # ir inst 102 fin
  j .F.editDistanceDP._21.if.exit.2                                     # ir inst 103 fin
.F.editDistanceDP._20.if.else.2:
  addi t3, a3, 1                                                        # ir inst 104 fin
  mul s11, t6, t3                                                       # ir inst 105 fin
  add t3, s11, t5                                                       # ir inst 106 fin
  mv s11, t3                                                            # ir inst 107 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add t3, t1, t2                                                        # ir inst 108 fin
  sw t4, 0(t3)                                                          # ir inst 109 fin
  j .F.editDistanceDP._21.if.exit.2                                     # ir inst 110 fin
.F.editDistanceDP._21.if.exit.2:
  j .F.editDistanceDP._22.if.exit.0                                     # ir inst 111 fin
.F.editDistanceDP._22.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 112 fin
# Phi connections
  mv t5, t4
  j .F.editDistanceDP._12.while.cond.3                                  # ir inst 113 fin
.F.editDistanceDP._23.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 114 fin
# Phi connections
  mv t6, t5
  j .F.editDistanceDP._10.while.cond.2                                  # ir inst 115 fin
.F.editDistanceDP._24.while.exit.2:
  addi t6, a3, 1                                                        # ir inst 116 fin
  mul t5, a2, t6                                                        # ir inst 117 fin
  add t6, t5, a3                                                        # ir inst 118 fin
  mv t5, t6                                                             # ir inst 119 fin
  slli t2, t5, 2
  addi t1, sp, 24
  add t6, t1, t2                                                        # ir inst 120 fin
  lw t5, 0(t6)                                                          # ir inst 121 fin
  mv a0, t5
  j .F.editDistanceDP.epilogue                                          # ir inst 122 fin
.F.editDistanceDP.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  li t0, 7232
  add sp, sp, t0
  ret

.globl .F.longestCommonSubsequenceDP
.F.longestCommonSubsequenceDP:
# spill func args num: 0,             range:     7216(sp) -     7216(sp)
# local var size: 7200,               range:       16(sp) -     7216(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -7216
  add sp, sp, t0
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.longestCommonSubsequenceDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequenceDP._1.array.cond.0                       # ir inst 3 fin
.F.longestCommonSubsequenceDP._1.array.cond.0:
  li t2, 1800
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.longestCommonSubsequenceDP._2.array.body.0
  j .F.longestCommonSubsequenceDP._3.array.exit.0                       # ir inst 6 fin
.F.longestCommonSubsequenceDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequenceDP._1.array.cond.0                       # ir inst 10 fin
.F.longestCommonSubsequenceDP._3.array.exit.0:
# Phi connections
  li t6, 1
  j .F.longestCommonSubsequenceDP._4.while.cond.0                       # ir inst 11 fin
.F.longestCommonSubsequenceDP._4.while.cond.0:
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 13 fin
  bnez t5, .F.longestCommonSubsequenceDP._5.while.body.0
  j .F.longestCommonSubsequenceDP._15.while.exit.0                      # ir inst 14 fin
.F.longestCommonSubsequenceDP._5.while.body.0:
# Phi connections
  li t5, 1
  j .F.longestCommonSubsequenceDP._6.while.cond.1                       # ir inst 15 fin
.F.longestCommonSubsequenceDP._6.while.cond.1:
  slt t0, a3, t5
  xori t4, t0, 1                                                        # ir inst 17 fin
  bnez t4, .F.longestCommonSubsequenceDP._7.while.body.1
  j .F.longestCommonSubsequenceDP._14.while.exit.1                      # ir inst 18 fin
.F.longestCommonSubsequenceDP._7.while.body.1:
  addi t4, t6, -1                                                       # ir inst 19 fin
  mv t3, t4                                                             # ir inst 20 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 21 fin
  lw t3, 0(t4)                                                          # ir inst 22 fin
  addi t4, t5, -1                                                       # ir inst 23 fin
  mv s11, t4                                                            # ir inst 24 fin
  slli t2, s11, 2
  add t4, a1, t2                                                        # ir inst 25 fin
  lw s11, 0(t4)                                                         # ir inst 26 fin
  xor t0, t3, s11
  sltiu t4, t0, 1                                                       # ir inst 27 fin
  bnez t4, .F.longestCommonSubsequenceDP._8.if.then.0
  j .F.longestCommonSubsequenceDP._9.if.else.0                          # ir inst 28 fin
.F.longestCommonSubsequenceDP._8.if.then.0:
  addi t4, a3, 1                                                        # ir inst 29 fin
  mul t3, t6, t4                                                        # ir inst 30 fin
  add t4, t3, t5                                                        # ir inst 31 fin
  mv t3, t4                                                             # ir inst 32 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 33 fin
  addi t3, t6, -1                                                       # ir inst 34 fin
  addi s11, a3, 1                                                       # ir inst 35 fin
  mul s10, t3, s11                                                      # ir inst 36 fin
  addi t3, t5, -1                                                       # ir inst 37 fin
  add s11, s10, t3                                                      # ir inst 38 fin
  mv t3, s11                                                            # ir inst 39 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 40 fin
  lw t3, 0(s11)                                                         # ir inst 41 fin
  addi s11, t3, 1                                                       # ir inst 42 fin
  sw s11, 0(t4)                                                         # ir inst 43 fin
  j .F.longestCommonSubsequenceDP._13.if.exit.0                         # ir inst 44 fin
.F.longestCommonSubsequenceDP._9.if.else.0:
  addi t4, a3, 1                                                        # ir inst 45 fin
  mul t3, t6, t4                                                        # ir inst 46 fin
  addi t4, t5, -1                                                       # ir inst 47 fin
  add s11, t3, t4                                                       # ir inst 48 fin
  mv t4, s11                                                            # ir inst 49 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 50 fin
  lw t4, 0(t3)                                                          # ir inst 51 fin
  addi t3, t6, -1                                                       # ir inst 52 fin
  addi s11, a3, 1                                                       # ir inst 53 fin
  mul s10, t3, s11                                                      # ir inst 54 fin
  add t3, s10, t5                                                       # ir inst 55 fin
  mv s11, t3                                                            # ir inst 56 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 57 fin
  lw s11, 0(t3)                                                         # ir inst 58 fin
  slt t3, s11, t4                                                       # ir inst 59 fin
  bnez t3, .F.longestCommonSubsequenceDP._10.if.then.1
  j .F.longestCommonSubsequenceDP._11.if.else.1                         # ir inst 60 fin
.F.longestCommonSubsequenceDP._10.if.then.1:
  addi t3, a3, 1                                                        # ir inst 61 fin
  mul s10, t6, t3                                                       # ir inst 62 fin
  add t3, s10, t5                                                       # ir inst 63 fin
  mv s10, t3                                                            # ir inst 64 fin
  slli t2, s10, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 65 fin
  sw t4, 0(t3)                                                          # ir inst 66 fin
  j .F.longestCommonSubsequenceDP._12.if.exit.1                         # ir inst 67 fin
.F.longestCommonSubsequenceDP._11.if.else.1:
  addi t4, a3, 1                                                        # ir inst 68 fin
  mul t3, t6, t4                                                        # ir inst 69 fin
  add t4, t3, t5                                                        # ir inst 70 fin
  mv t3, t4                                                             # ir inst 71 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 72 fin
  sw s11, 0(t4)                                                         # ir inst 73 fin
  j .F.longestCommonSubsequenceDP._12.if.exit.1                         # ir inst 74 fin
.F.longestCommonSubsequenceDP._12.if.exit.1:
  j .F.longestCommonSubsequenceDP._13.if.exit.0                         # ir inst 75 fin
.F.longestCommonSubsequenceDP._13.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 76 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequenceDP._6.while.cond.1                       # ir inst 77 fin
.F.longestCommonSubsequenceDP._14.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 78 fin
# Phi connections
  mv t6, t5
  j .F.longestCommonSubsequenceDP._4.while.cond.0                       # ir inst 79 fin
.F.longestCommonSubsequenceDP._15.while.exit.0:
  addi t6, a3, 1                                                        # ir inst 80 fin
  mul t5, a2, t6                                                        # ir inst 81 fin
  add t6, t5, a3                                                        # ir inst 82 fin
  mv t5, t6                                                             # ir inst 83 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t6, t1, t2                                                        # ir inst 84 fin
  lw t5, 0(t6)                                                          # ir inst 85 fin
  mv a0, t5
  j .F.longestCommonSubsequenceDP.epilogue                              # ir inst 86 fin
.F.longestCommonSubsequenceDP.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  li t0, 7216
  add sp, sp, t0
  ret

.globl .F.palindromePartitioningDP
.F.palindromePartitioningDP:
# spill func args num: 0,             range:     2720(sp) -     2720(sp)
# local var size: 2700,               range:       16(sp) -     2716(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -2720
  add sp, sp, t0
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.palindromePartitioningDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.palindromePartitioningDP._1.array.cond.0                         # ir inst 3 fin
.F.palindromePartitioningDP._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.palindromePartitioningDP._2.array.body.0
  j .F.palindromePartitioningDP._3.array.exit.0                         # ir inst 6 fin
.F.palindromePartitioningDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.palindromePartitioningDP._1.array.cond.0                         # ir inst 10 fin
.F.palindromePartitioningDP._3.array.exit.0:
  addi t1, sp, 216
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.palindromePartitioningDP._4.array.cond.1                         # ir inst 13 fin
.F.palindromePartitioningDP._4.array.cond.1:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.palindromePartitioningDP._5.array.body.1
  j .F.palindromePartitioningDP._6.array.exit.1                         # ir inst 16 fin
.F.palindromePartitioningDP._5.array.body.1:
  add t4, t6, t5                                                        # ir inst 17 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.palindromePartitioningDP._4.array.cond.1                         # ir inst 20 fin
.F.palindromePartitioningDP._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F.palindromePartitioningDP._7.while.cond.0                         # ir inst 21 fin
.F.palindromePartitioningDP._7.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 23 fin
  bnez t5, .F.palindromePartitioningDP._8.while.body.0
  j .F.palindromePartitioningDP._24.while.exit.0                        # ir inst 24 fin
.F.palindromePartitioningDP._8.while.body.0:
# Phi connections
  li t5, 0
  j .F.palindromePartitioningDP._9.while.cond.1                         # ir inst 25 fin
.F.palindromePartitioningDP._9.while.cond.1:
  slt t4, t5, a1                                                        # ir inst 27 fin
  bnez t4, .F.palindromePartitioningDP._10.while.body.1
  j .F.palindromePartitioningDP._23.while.exit.1                        # ir inst 28 fin
.F.palindromePartitioningDP._10.while.body.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 29 fin
  bnez t4, .F.palindromePartitioningDP._11.if.then.0
  j .F.palindromePartitioningDP._12.if.else.0                           # ir inst 30 fin
.F.palindromePartitioningDP._11.if.then.0:
  mul t4, t6, a1                                                        # ir inst 31 fin
  add t3, t4, t5                                                        # ir inst 32 fin
  mv t4, t3                                                             # ir inst 33 fin
  addi t1, sp, 216
  add t3, t1, t4                                                        # ir inst 34 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 35 fin
  j .F.palindromePartitioningDP._22.if.exit.0                           # ir inst 36 fin
.F.palindromePartitioningDP._12.if.else.0:
  addi t4, t6, 1                                                        # ir inst 37 fin
  xor t0, t4, t5
  sltiu t3, t0, 1                                                       # ir inst 38 fin
  bnez t3, .F.palindromePartitioningDP._13.if.then.1
  j .F.palindromePartitioningDP._14.if.else.1                           # ir inst 39 fin
.F.palindromePartitioningDP._13.if.then.1:
  mul t4, t6, a1                                                        # ir inst 40 fin
  add t3, t4, t5                                                        # ir inst 41 fin
  mv t4, t3                                                             # ir inst 42 fin
  addi t1, sp, 216
  add t3, t1, t4                                                        # ir inst 43 fin
  mv t4, t6                                                             # ir inst 44 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 45 fin
  lw t4, 0(s11)                                                         # ir inst 46 fin
  mv s11, t5                                                            # ir inst 47 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 48 fin
  lw s11, 0(s10)                                                        # ir inst 49 fin
  xor t0, t4, s11
  sltiu s10, t0, 1                                                      # ir inst 50 fin
  sb s10, 0(t3)                                                         # ir inst 51 fin
  j .F.palindromePartitioningDP._21.if.exit.1                           # ir inst 52 fin
.F.palindromePartitioningDP._14.if.else.1:
  slt t4, t6, t5                                                        # ir inst 53 fin
  bnez t4, .F.palindromePartitioningDP._15.if.then.2
  j .F.palindromePartitioningDP._19.if.else.2                           # ir inst 54 fin
.F.palindromePartitioningDP._15.if.then.2:
  mul t4, t6, a1                                                        # ir inst 55 fin
  add t3, t4, t5                                                        # ir inst 56 fin
  mv t4, t3                                                             # ir inst 57 fin
  addi t1, sp, 216
  add t3, t1, t4                                                        # ir inst 58 fin
  mv t4, t6                                                             # ir inst 59 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 60 fin
  lw t4, 0(s11)                                                         # ir inst 61 fin
  mv s11, t5                                                            # ir inst 62 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 63 fin
  lw s11, 0(s10)                                                        # ir inst 64 fin
  xor t0, t4, s11
  sltiu s10, t0, 1                                                      # ir inst 65 fin
  bnez s10, .F.palindromePartitioningDP._16.lazy.then.0
  j .F.palindromePartitioningDP._17.lazy.else.0                         # ir inst 66 fin
.F.palindromePartitioningDP._16.lazy.then.0:
  addi t4, t6, 1                                                        # ir inst 67 fin
  mul s11, t4, a1                                                       # ir inst 68 fin
  addi t4, t5, -1                                                       # ir inst 69 fin
  add s10, s11, t4                                                      # ir inst 70 fin
  mv t4, s10                                                            # ir inst 71 fin
  addi t1, sp, 216
  add s11, t1, t4                                                       # ir inst 72 fin
  lb t4, 0(s11)                                                         # ir inst 73 fin
# Phi connections
  j .F.palindromePartitioningDP._18.lazy.exit.0                         # ir inst 74 fin
.F.palindromePartitioningDP._17.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.palindromePartitioningDP._18.lazy.exit.0                         # ir inst 75 fin
.F.palindromePartitioningDP._18.lazy.exit.0:
  sb t4, 0(t3)                                                          # ir inst 77 fin
  j .F.palindromePartitioningDP._20.if.exit.2                           # ir inst 78 fin
.F.palindromePartitioningDP._19.if.else.2:
  j .F.palindromePartitioningDP._20.if.exit.2                           # ir inst 79 fin
.F.palindromePartitioningDP._20.if.exit.2:
  j .F.palindromePartitioningDP._21.if.exit.1                           # ir inst 80 fin
.F.palindromePartitioningDP._21.if.exit.1:
  j .F.palindromePartitioningDP._22.if.exit.0                           # ir inst 81 fin
.F.palindromePartitioningDP._22.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 82 fin
# Phi connections
  mv t5, t4
  j .F.palindromePartitioningDP._9.while.cond.1                         # ir inst 83 fin
.F.palindromePartitioningDP._23.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 84 fin
# Phi connections
  mv t6, t5
  j .F.palindromePartitioningDP._7.while.cond.0                         # ir inst 85 fin
.F.palindromePartitioningDP._24.while.exit.0:
# Phi connections
  li t6, 0
  j .F.palindromePartitioningDP._25.while.cond.2                        # ir inst 86 fin
.F.palindromePartitioningDP._25.while.cond.2:
  slt t5, t6, a1                                                        # ir inst 88 fin
  bnez t5, .F.palindromePartitioningDP._26.while.body.2
  j .F.palindromePartitioningDP._39.while.exit.2                        # ir inst 89 fin
.F.palindromePartitioningDP._26.while.body.2:
  mv t5, t6                                                             # ir inst 90 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 91 fin
  sw t6, 0(t4)                                                          # ir inst 92 fin
# Phi connections
  li t5, 0
  j .F.palindromePartitioningDP._27.while.cond.3                        # ir inst 93 fin
.F.palindromePartitioningDP._27.while.cond.3:
  slt t0, t6, t5
  xori t4, t0, 1                                                        # ir inst 95 fin
  bnez t4, .F.palindromePartitioningDP._28.while.body.3
  j .F.palindromePartitioningDP._38.while.exit.3                        # ir inst 96 fin
.F.palindromePartitioningDP._28.while.body.3:
  mul t4, t5, a1                                                        # ir inst 97 fin
  add t3, t4, t6                                                        # ir inst 98 fin
  mv t4, t3                                                             # ir inst 99 fin
  addi t1, sp, 216
  add t3, t1, t4                                                        # ir inst 100 fin
  lb t4, 0(t3)                                                          # ir inst 101 fin
  bnez t4, .F.palindromePartitioningDP._29.if.then.3
  j .F.palindromePartitioningDP._36.if.else.3                           # ir inst 102 fin
.F.palindromePartitioningDP._29.if.then.3:
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 103 fin
  bnez t4, .F.palindromePartitioningDP._30.if.then.4
  j .F.palindromePartitioningDP._31.if.else.4                           # ir inst 104 fin
.F.palindromePartitioningDP._30.if.then.4:
  mv t4, t6                                                             # ir inst 105 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 106 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 107 fin
  j .F.palindromePartitioningDP._35.if.exit.4                           # ir inst 108 fin
.F.palindromePartitioningDP._31.if.else.4:
  addi t4, t5, -1                                                       # ir inst 109 fin
  mv t3, t4                                                             # ir inst 110 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 111 fin
  lw t3, 0(t4)                                                          # ir inst 112 fin
  addi t4, t3, 1                                                        # ir inst 113 fin
  mv t3, t6                                                             # ir inst 114 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 115 fin
  lw t3, 0(s11)                                                         # ir inst 116 fin
  slt s11, t4, t3                                                       # ir inst 117 fin
  bnez s11, .F.palindromePartitioningDP._32.if.then.5
  j .F.palindromePartitioningDP._33.if.else.5                           # ir inst 118 fin
.F.palindromePartitioningDP._32.if.then.5:
  mv t4, t6                                                             # ir inst 119 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 120 fin
  addi t4, t5, -1                                                       # ir inst 121 fin
  mv s11, t4                                                            # ir inst 122 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 123 fin
  lw s11, 0(t4)                                                         # ir inst 124 fin
  addi t4, s11, 1                                                       # ir inst 125 fin
  sw t4, 0(t3)                                                          # ir inst 126 fin
  j .F.palindromePartitioningDP._34.if.exit.5                           # ir inst 127 fin
.F.palindromePartitioningDP._33.if.else.5:
  j .F.palindromePartitioningDP._34.if.exit.5                           # ir inst 128 fin
.F.palindromePartitioningDP._34.if.exit.5:
  j .F.palindromePartitioningDP._35.if.exit.4                           # ir inst 129 fin
.F.palindromePartitioningDP._35.if.exit.4:
  j .F.palindromePartitioningDP._37.if.exit.3                           # ir inst 130 fin
.F.palindromePartitioningDP._36.if.else.3:
  j .F.palindromePartitioningDP._37.if.exit.3                           # ir inst 131 fin
.F.palindromePartitioningDP._37.if.exit.3:
  addi t4, t5, 1                                                        # ir inst 132 fin
# Phi connections
  mv t5, t4
  j .F.palindromePartitioningDP._27.while.cond.3                        # ir inst 133 fin
.F.palindromePartitioningDP._38.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 134 fin
# Phi connections
  mv t6, t5
  j .F.palindromePartitioningDP._25.while.cond.2                        # ir inst 135 fin
.F.palindromePartitioningDP._39.while.exit.2:
  addi t6, a1, -1                                                       # ir inst 136 fin
  mv t5, t6                                                             # ir inst 137 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t6, t1, t2                                                        # ir inst 138 fin
  lw t5, 0(t6)                                                          # ir inst 139 fin
  mv a0, t5
  j .F.palindromePartitioningDP.epilogue                                # ir inst 140 fin
.F.palindromePartitioningDP.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  li t0, 2720
  add sp, sp, t0
  ret

.globl .F.stringReconstructionDP
.F.stringReconstructionDP:
# spill func args num: 0,             range:      208(sp) -      208(sp)
# local var size: 200,                range:        8(sp) -      208(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -208
  sd s11, 0(sp)
.F.stringReconstructionDP._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._1.array.cond.0                           # ir inst 3 fin
.F.stringReconstructionDP._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.stringReconstructionDP._2.array.body.0
  j .F.stringReconstructionDP._3.array.exit.0                           # ir inst 6 fin
.F.stringReconstructionDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.stringReconstructionDP._1.array.cond.0                           # ir inst 10 fin
.F.stringReconstructionDP._3.array.exit.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 12 fin
# Phi connections
  li t6, 1
  j .F.stringReconstructionDP._4.while.cond.0                           # ir inst 13 fin
.F.stringReconstructionDP._4.while.cond.0:
  slt t0, a1, t6
  xori t5, t0, 1                                                        # ir inst 15 fin
  bnez t5, .F.stringReconstructionDP._5.while.body.0
  j .F.stringReconstructionDP._51.while.exit.0                          # ir inst 16 fin
.F.stringReconstructionDP._5.while.body.0:
  li t2, 1
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 17 fin
  bnez t5, .F.stringReconstructionDP._6.lazy.then.0
  j .F.stringReconstructionDP._7.lazy.else.0                            # ir inst 18 fin
.F.stringReconstructionDP._6.lazy.then.0:
  addi t5, t6, -1                                                       # ir inst 19 fin
  mv t4, t5                                                             # ir inst 20 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 21 fin
  lw t4, 0(t5)                                                          # ir inst 22 fin
  li t2, 65
  slt t0, t4, t2
  xori t5, t0, 1                                                        # ir inst 23 fin
# Phi connections
  j .F.stringReconstructionDP._8.lazy.exit.0                            # ir inst 24 fin
.F.stringReconstructionDP._7.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._8.lazy.exit.0                            # ir inst 25 fin
.F.stringReconstructionDP._8.lazy.exit.0:
  bnez t5, .F.stringReconstructionDP._9.lazy.then.1
  j .F.stringReconstructionDP._10.lazy.else.1                           # ir inst 27 fin
.F.stringReconstructionDP._9.lazy.then.1:
  addi t5, t6, -1                                                       # ir inst 28 fin
  mv t4, t5                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 30 fin
  lw t4, 0(t5)                                                          # ir inst 31 fin
  li t2, 90
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 32 fin
# Phi connections
  j .F.stringReconstructionDP._11.lazy.exit.1                           # ir inst 33 fin
.F.stringReconstructionDP._10.lazy.else.1:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._11.lazy.exit.1                           # ir inst 34 fin
.F.stringReconstructionDP._11.lazy.exit.1:
  bnez t5, .F.stringReconstructionDP._12.if.then.0
  j .F.stringReconstructionDP._13.if.else.0                             # ir inst 36 fin
.F.stringReconstructionDP._12.if.then.0:
  mv t5, t6                                                             # ir inst 37 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 38 fin
  mv t5, t6                                                             # ir inst 39 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 40 fin
  lw t5, 0(t3)                                                          # ir inst 41 fin
  addi t3, t6, -1                                                       # ir inst 42 fin
  mv s11, t3                                                            # ir inst 43 fin
  slli t2, s11, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 44 fin
  lw s11, 0(t3)                                                         # ir inst 45 fin
  add t3, t5, s11                                                       # ir inst 46 fin
  sw t3, 0(t4)                                                          # ir inst 47 fin
  j .F.stringReconstructionDP._14.if.exit.0                             # ir inst 48 fin
.F.stringReconstructionDP._13.if.else.0:
  j .F.stringReconstructionDP._14.if.exit.0                             # ir inst 49 fin
.F.stringReconstructionDP._14.if.exit.0:
  li t2, 2
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 50 fin
  bnez t5, .F.stringReconstructionDP._15.lazy.then.2
  j .F.stringReconstructionDP._16.lazy.else.2                           # ir inst 51 fin
.F.stringReconstructionDP._15.lazy.then.2:
  addi t5, t6, -2                                                       # ir inst 52 fin
  mv t4, t5                                                             # ir inst 53 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 54 fin
  lw t4, 0(t5)                                                          # ir inst 55 fin
  li t2, 65
  slt t0, t4, t2
  xori t5, t0, 1                                                        # ir inst 56 fin
# Phi connections
  j .F.stringReconstructionDP._17.lazy.exit.2                           # ir inst 57 fin
.F.stringReconstructionDP._16.lazy.else.2:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._17.lazy.exit.2                           # ir inst 58 fin
.F.stringReconstructionDP._17.lazy.exit.2:
  bnez t5, .F.stringReconstructionDP._18.lazy.then.3
  j .F.stringReconstructionDP._19.lazy.else.3                           # ir inst 60 fin
.F.stringReconstructionDP._18.lazy.then.3:
  addi t5, t6, -2                                                       # ir inst 61 fin
  mv t4, t5                                                             # ir inst 62 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 63 fin
  lw t4, 0(t5)                                                          # ir inst 64 fin
  li t2, 90
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 65 fin
# Phi connections
  j .F.stringReconstructionDP._20.lazy.exit.3                           # ir inst 66 fin
.F.stringReconstructionDP._19.lazy.else.3:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._20.lazy.exit.3                           # ir inst 67 fin
.F.stringReconstructionDP._20.lazy.exit.3:
  bnez t5, .F.stringReconstructionDP._21.lazy.then.4
  j .F.stringReconstructionDP._22.lazy.else.4                           # ir inst 69 fin
.F.stringReconstructionDP._21.lazy.then.4:
  addi t5, t6, -1                                                       # ir inst 70 fin
  mv t4, t5                                                             # ir inst 71 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 72 fin
  lw t4, 0(t5)                                                          # ir inst 73 fin
  li t2, 65
  slt t0, t4, t2
  xori t5, t0, 1                                                        # ir inst 74 fin
# Phi connections
  j .F.stringReconstructionDP._23.lazy.exit.4                           # ir inst 75 fin
.F.stringReconstructionDP._22.lazy.else.4:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._23.lazy.exit.4                           # ir inst 76 fin
.F.stringReconstructionDP._23.lazy.exit.4:
  bnez t5, .F.stringReconstructionDP._24.lazy.then.5
  j .F.stringReconstructionDP._25.lazy.else.5                           # ir inst 78 fin
.F.stringReconstructionDP._24.lazy.then.5:
  addi t5, t6, -1                                                       # ir inst 79 fin
  mv t4, t5                                                             # ir inst 80 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 81 fin
  lw t4, 0(t5)                                                          # ir inst 82 fin
  li t2, 90
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 83 fin
# Phi connections
  j .F.stringReconstructionDP._26.lazy.exit.5                           # ir inst 84 fin
.F.stringReconstructionDP._25.lazy.else.5:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._26.lazy.exit.5                           # ir inst 85 fin
.F.stringReconstructionDP._26.lazy.exit.5:
  bnez t5, .F.stringReconstructionDP._27.if.then.1
  j .F.stringReconstructionDP._28.if.else.1                             # ir inst 87 fin
.F.stringReconstructionDP._27.if.then.1:
  mv t5, t6                                                             # ir inst 88 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 89 fin
  mv t5, t6                                                             # ir inst 90 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 91 fin
  lw t5, 0(t3)                                                          # ir inst 92 fin
  addi t3, t6, -2                                                       # ir inst 93 fin
  mv s11, t3                                                            # ir inst 94 fin
  slli t2, s11, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 95 fin
  lw s11, 0(t3)                                                         # ir inst 96 fin
  add t3, t5, s11                                                       # ir inst 97 fin
  sw t3, 0(t4)                                                          # ir inst 98 fin
  j .F.stringReconstructionDP._29.if.exit.1                             # ir inst 99 fin
.F.stringReconstructionDP._28.if.else.1:
  j .F.stringReconstructionDP._29.if.exit.1                             # ir inst 100 fin
.F.stringReconstructionDP._29.if.exit.1:
  li t2, 3
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 101 fin
  bnez t5, .F.stringReconstructionDP._30.lazy.then.6
  j .F.stringReconstructionDP._31.lazy.else.6                           # ir inst 102 fin
.F.stringReconstructionDP._30.lazy.then.6:
  addi t5, t6, -3                                                       # ir inst 103 fin
  mv t4, t5                                                             # ir inst 104 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 105 fin
  lw t4, 0(t5)                                                          # ir inst 106 fin
  li t2, 65
  slt t0, t4, t2
  xori t5, t0, 1                                                        # ir inst 107 fin
# Phi connections
  j .F.stringReconstructionDP._32.lazy.exit.6                           # ir inst 108 fin
.F.stringReconstructionDP._31.lazy.else.6:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._32.lazy.exit.6                           # ir inst 109 fin
.F.stringReconstructionDP._32.lazy.exit.6:
  bnez t5, .F.stringReconstructionDP._33.lazy.then.7
  j .F.stringReconstructionDP._34.lazy.else.7                           # ir inst 111 fin
.F.stringReconstructionDP._33.lazy.then.7:
  addi t5, t6, -3                                                       # ir inst 112 fin
  mv t4, t5                                                             # ir inst 113 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 114 fin
  lw t4, 0(t5)                                                          # ir inst 115 fin
  li t2, 90
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 116 fin
# Phi connections
  j .F.stringReconstructionDP._35.lazy.exit.7                           # ir inst 117 fin
.F.stringReconstructionDP._34.lazy.else.7:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._35.lazy.exit.7                           # ir inst 118 fin
.F.stringReconstructionDP._35.lazy.exit.7:
  bnez t5, .F.stringReconstructionDP._36.lazy.then.8
  j .F.stringReconstructionDP._37.lazy.else.8                           # ir inst 120 fin
.F.stringReconstructionDP._36.lazy.then.8:
  addi t5, t6, -2                                                       # ir inst 121 fin
  mv t4, t5                                                             # ir inst 122 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 123 fin
  lw t4, 0(t5)                                                          # ir inst 124 fin
  li t2, 65
  slt t0, t4, t2
  xori t5, t0, 1                                                        # ir inst 125 fin
# Phi connections
  j .F.stringReconstructionDP._38.lazy.exit.8                           # ir inst 126 fin
.F.stringReconstructionDP._37.lazy.else.8:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._38.lazy.exit.8                           # ir inst 127 fin
.F.stringReconstructionDP._38.lazy.exit.8:
  bnez t5, .F.stringReconstructionDP._39.lazy.then.9
  j .F.stringReconstructionDP._40.lazy.else.9                           # ir inst 129 fin
.F.stringReconstructionDP._39.lazy.then.9:
  addi t5, t6, -2                                                       # ir inst 130 fin
  mv t4, t5                                                             # ir inst 131 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 132 fin
  lw t4, 0(t5)                                                          # ir inst 133 fin
  li t2, 90
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 134 fin
# Phi connections
  j .F.stringReconstructionDP._41.lazy.exit.9                           # ir inst 135 fin
.F.stringReconstructionDP._40.lazy.else.9:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._41.lazy.exit.9                           # ir inst 136 fin
.F.stringReconstructionDP._41.lazy.exit.9:
  bnez t5, .F.stringReconstructionDP._42.lazy.then.10
  j .F.stringReconstructionDP._43.lazy.else.10                          # ir inst 138 fin
.F.stringReconstructionDP._42.lazy.then.10:
  addi t5, t6, -1                                                       # ir inst 139 fin
  mv t4, t5                                                             # ir inst 140 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 141 fin
  lw t4, 0(t5)                                                          # ir inst 142 fin
  li t2, 65
  slt t0, t4, t2
  xori t5, t0, 1                                                        # ir inst 143 fin
# Phi connections
  j .F.stringReconstructionDP._44.lazy.exit.10                          # ir inst 144 fin
.F.stringReconstructionDP._43.lazy.else.10:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._44.lazy.exit.10                          # ir inst 145 fin
.F.stringReconstructionDP._44.lazy.exit.10:
  bnez t5, .F.stringReconstructionDP._45.lazy.then.11
  j .F.stringReconstructionDP._46.lazy.else.11                          # ir inst 147 fin
.F.stringReconstructionDP._45.lazy.then.11:
  addi t5, t6, -1                                                       # ir inst 148 fin
  mv t4, t5                                                             # ir inst 149 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 150 fin
  lw t4, 0(t5)                                                          # ir inst 151 fin
  li t2, 90
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 152 fin
# Phi connections
  j .F.stringReconstructionDP._47.lazy.exit.11                          # ir inst 153 fin
.F.stringReconstructionDP._46.lazy.else.11:
# Phi connections
  li t5, 0
  j .F.stringReconstructionDP._47.lazy.exit.11                          # ir inst 154 fin
.F.stringReconstructionDP._47.lazy.exit.11:
  bnez t5, .F.stringReconstructionDP._48.if.then.2
  j .F.stringReconstructionDP._49.if.else.2                             # ir inst 156 fin
.F.stringReconstructionDP._48.if.then.2:
  mv t5, t6                                                             # ir inst 157 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 158 fin
  mv t5, t6                                                             # ir inst 159 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 160 fin
  lw t5, 0(t3)                                                          # ir inst 161 fin
  addi t3, t6, -3                                                       # ir inst 162 fin
  mv s11, t3                                                            # ir inst 163 fin
  slli t2, s11, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 164 fin
  lw s11, 0(t3)                                                         # ir inst 165 fin
  li t2, 2
  div t3, s11, t2                                                       # ir inst 166 fin
  add s11, t5, t3                                                       # ir inst 167 fin
  sw s11, 0(t4)                                                         # ir inst 168 fin
  j .F.stringReconstructionDP._50.if.exit.2                             # ir inst 169 fin
.F.stringReconstructionDP._49.if.else.2:
  j .F.stringReconstructionDP._50.if.exit.2                             # ir inst 170 fin
.F.stringReconstructionDP._50.if.exit.2:
  addi t5, t6, 1                                                        # ir inst 171 fin
# Phi connections
  mv t6, t5
  j .F.stringReconstructionDP._4.while.cond.0                           # ir inst 172 fin
.F.stringReconstructionDP._51.while.exit.0:
  mv t6, a1                                                             # ir inst 173 fin
  slli t2, t6, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 174 fin
  lw t6, 0(t5)                                                          # ir inst 175 fin
  mv a0, t6
  j .F.stringReconstructionDP.epilogue                                  # ir inst 176 fin
.F.stringReconstructionDP.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 208
  ret

.globl .F.testOptimizationProblems
.F.testOptimizationProblems:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testOptimizationProblems._0.entry.0:
# Start call preparation
  li a0, 1805
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a1, 100
  li a0, 50
  call .F.knapsackDP
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a1, 100
  li a0, 50
  call .F.unboundedKnapsackDP
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a0, 30
  call .F.jobSchedulingDP
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 40
  call .F.partitionProblemDP
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 20
  call .F.matrixChainMultiplicationDP
  mv t6, a0
# ir inst 10 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 11 fin
# Start call preparation
  li a0, 1806
  call printlnInt
# ir inst 12 fin
  j .F.testOptimizationProblems.epilogue                                # ir inst 13 fin
.F.testOptimizationProblems.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.knapsackDP
.F.knapsackDP:
# spill func args num: 0,             range:    21024(sp) -    21024(sp)
# local var size: 21004,              range:       16(sp) -    21020(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -21024
  add sp, sp, t0
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.knapsackDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.knapsackDP._1.array.cond.0                                       # ir inst 3 fin
.F.knapsackDP._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.knapsackDP._2.array.body.0
  j .F.knapsackDP._3.array.exit.0                                       # ir inst 6 fin
.F.knapsackDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.knapsackDP._1.array.cond.0                                       # ir inst 10 fin
.F.knapsackDP._3.array.exit.0:
  addi t1, sp, 216
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.knapsackDP._4.array.cond.1                                       # ir inst 13 fin
.F.knapsackDP._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.knapsackDP._5.array.body.1
  j .F.knapsackDP._6.array.exit.1                                       # ir inst 16 fin
.F.knapsackDP._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.knapsackDP._4.array.cond.1                                       # ir inst 20 fin
.F.knapsackDP._6.array.exit.1:
# Phi connections
  li t5, 111
  li t6, 0
  j .F.knapsackDP._7.while.cond.0                                       # ir inst 21 fin
.F.knapsackDP._7.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 24 fin
  bnez t4, .F.knapsackDP._8.while.body.0
  j .F.knapsackDP._12.while.exit.0                                      # ir inst 25 fin
.F.knapsackDP._8.while.body.0:
  li t2, 525
  mul t4, t5, t2                                                        # ir inst 26 fin
  li t2, 390422
  add t5, t4, t2                                                        # ir inst 27 fin
  li t2, 483647
  rem t4, t5, t2                                                        # ir inst 28 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 29 fin
  bnez t5, .F.knapsackDP._9.if.then.0
  j .F.knapsackDP._10.if.else.0                                         # ir inst 30 fin
.F.knapsackDP._9.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 31 fin
# Phi connections
  j .F.knapsackDP._11.if.exit.0                                         # ir inst 32 fin
.F.knapsackDP._10.if.else.0:
# Phi connections
  mv t5, t4
  j .F.knapsackDP._11.if.exit.0                                         # ir inst 33 fin
.F.knapsackDP._11.if.exit.0:
  mv t4, t6                                                             # ir inst 35 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 36 fin
  li t2, 20
  rem t4, t5, t2                                                        # ir inst 37 fin
  addi s11, t4, 1                                                       # ir inst 38 fin
  sw s11, 0(t3)                                                         # ir inst 39 fin
  mv t4, t6                                                             # ir inst 40 fin
  slli t2, t4, 2
  addi t1, sp, 216
  add t3, t1, t2                                                        # ir inst 41 fin
  li t2, 50
  rem t4, t5, t2                                                        # ir inst 42 fin
  addi s11, t4, 10                                                      # ir inst 43 fin
  sw s11, 0(t3)                                                         # ir inst 44 fin
  addi t4, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t6, t4
  j .F.knapsackDP._7.while.cond.0                                       # ir inst 46 fin
.F.knapsackDP._12.while.exit.0:
  addi t1, sp, 416
  addi t6, t1, 0                                                        # ir inst 48 fin
# Phi connections
  li t5, 0
  j .F.knapsackDP._13.array.cond.2                                      # ir inst 49 fin
.F.knapsackDP._13.array.cond.2:
  li t2, 5151
  slt t4, t5, t2                                                        # ir inst 51 fin
  bnez t4, .F.knapsackDP._14.array.body.2
  j .F.knapsackDP._15.array.exit.2                                      # ir inst 52 fin
.F.knapsackDP._14.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 54 fin
  addi t4, t5, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t4
  j .F.knapsackDP._13.array.cond.2                                      # ir inst 56 fin
.F.knapsackDP._15.array.exit.2:
# Phi connections
  li t6, 1
  j .F.knapsackDP._16.while.cond.1                                      # ir inst 57 fin
.F.knapsackDP._16.while.cond.1:
  slt t0, a0, t6
  xori t5, t0, 1                                                        # ir inst 59 fin
  bnez t5, .F.knapsackDP._17.while.body.1
  j .F.knapsackDP._27.while.exit.1                                      # ir inst 60 fin
.F.knapsackDP._17.while.body.1:
# Phi connections
  li t5, 1
  j .F.knapsackDP._18.while.cond.2                                      # ir inst 61 fin
.F.knapsackDP._18.while.cond.2:
  slt t0, a1, t5
  xori t4, t0, 1                                                        # ir inst 63 fin
  bnez t4, .F.knapsackDP._19.while.body.2
  j .F.knapsackDP._26.while.exit.2                                      # ir inst 64 fin
.F.knapsackDP._19.while.body.2:
  addi t4, a1, 1                                                        # ir inst 65 fin
  mul t3, t6, t4                                                        # ir inst 66 fin
  add t4, t3, t5                                                        # ir inst 67 fin
  mv t3, t4                                                             # ir inst 68 fin
  slli t2, t3, 2
  addi t1, sp, 416
  add t4, t1, t2                                                        # ir inst 69 fin
  addi t3, t6, -1                                                       # ir inst 70 fin
  addi s11, a1, 1                                                       # ir inst 71 fin
  mul s10, t3, s11                                                      # ir inst 72 fin
  add t3, s10, t5                                                       # ir inst 73 fin
  mv s11, t3                                                            # ir inst 74 fin
  slli t2, s11, 2
  addi t1, sp, 416
  add t3, t1, t2                                                        # ir inst 75 fin
  lw s11, 0(t3)                                                         # ir inst 76 fin
  sw s11, 0(t4)                                                         # ir inst 77 fin
  addi t4, t6, -1                                                       # ir inst 78 fin
  mv t3, t4                                                             # ir inst 79 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 80 fin
  lw t3, 0(t4)                                                          # ir inst 81 fin
  slt t0, t5, t3
  xori t4, t0, 1                                                        # ir inst 82 fin
  bnez t4, .F.knapsackDP._20.if.then.1
  j .F.knapsackDP._24.if.else.1                                         # ir inst 83 fin
.F.knapsackDP._20.if.then.1:
  addi t4, t6, -1                                                       # ir inst 84 fin
  mv t3, t4                                                             # ir inst 85 fin
  slli t2, t3, 2
  addi t1, sp, 216
  add t4, t1, t2                                                        # ir inst 86 fin
  lw t3, 0(t4)                                                          # ir inst 87 fin
  addi t4, t6, -1                                                       # ir inst 88 fin
  addi s11, a1, 1                                                       # ir inst 89 fin
  mul s10, t4, s11                                                      # ir inst 90 fin
  addi t4, t6, -1                                                       # ir inst 91 fin
  mv s11, t4                                                            # ir inst 92 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 93 fin
  lw s11, 0(t4)                                                         # ir inst 94 fin
  sub t4, t5, s11                                                       # ir inst 95 fin
  add s11, s10, t4                                                      # ir inst 96 fin
  mv t4, s11                                                            # ir inst 97 fin
  slli t2, t4, 2
  addi t1, sp, 416
  add s11, t1, t2                                                       # ir inst 98 fin
  lw t4, 0(s11)                                                         # ir inst 99 fin
  add s11, t3, t4                                                       # ir inst 100 fin
  addi t4, a1, 1                                                        # ir inst 101 fin
  mul t3, t6, t4                                                        # ir inst 102 fin
  add t4, t3, t5                                                        # ir inst 103 fin
  mv t3, t4                                                             # ir inst 104 fin
  slli t2, t3, 2
  addi t1, sp, 416
  add t4, t1, t2                                                        # ir inst 105 fin
  lw t3, 0(t4)                                                          # ir inst 106 fin
  slt t4, t3, s11                                                       # ir inst 107 fin
  bnez t4, .F.knapsackDP._21.if.then.2
  j .F.knapsackDP._22.if.else.2                                         # ir inst 108 fin
.F.knapsackDP._21.if.then.2:
  addi t4, a1, 1                                                        # ir inst 109 fin
  mul t3, t6, t4                                                        # ir inst 110 fin
  add t4, t3, t5                                                        # ir inst 111 fin
  mv t3, t4                                                             # ir inst 112 fin
  slli t2, t3, 2
  addi t1, sp, 416
  add t4, t1, t2                                                        # ir inst 113 fin
  sw s11, 0(t4)                                                         # ir inst 114 fin
  j .F.knapsackDP._23.if.exit.2                                         # ir inst 115 fin
.F.knapsackDP._22.if.else.2:
  j .F.knapsackDP._23.if.exit.2                                         # ir inst 116 fin
.F.knapsackDP._23.if.exit.2:
  j .F.knapsackDP._25.if.exit.1                                         # ir inst 117 fin
.F.knapsackDP._24.if.else.1:
  j .F.knapsackDP._25.if.exit.1                                         # ir inst 118 fin
.F.knapsackDP._25.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 119 fin
# Phi connections
  mv t5, t4
  j .F.knapsackDP._18.while.cond.2                                      # ir inst 120 fin
.F.knapsackDP._26.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 121 fin
# Phi connections
  mv t6, t5
  j .F.knapsackDP._16.while.cond.1                                      # ir inst 122 fin
.F.knapsackDP._27.while.exit.1:
  addi t6, a1, 1                                                        # ir inst 123 fin
  mul t5, a0, t6                                                        # ir inst 124 fin
  add t6, t5, a1                                                        # ir inst 125 fin
  mv t5, t6                                                             # ir inst 126 fin
  slli t2, t5, 2
  addi t1, sp, 416
  add t6, t1, t2                                                        # ir inst 127 fin
  lw t5, 0(t6)                                                          # ir inst 128 fin
  mv a0, t5
  j .F.knapsackDP.epilogue                                              # ir inst 129 fin
.F.knapsackDP.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  li t0, 21024
  add sp, sp, t0
  ret

.globl .F.unboundedKnapsackDP
.F.unboundedKnapsackDP:
# spill func args num: 0,             range:      816(sp) -      816(sp)
# local var size: 804,                range:        8(sp) -      812(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -816
  sd s11, 0(sp)
.F.unboundedKnapsackDP._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.unboundedKnapsackDP._1.array.cond.0                              # ir inst 3 fin
.F.unboundedKnapsackDP._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.unboundedKnapsackDP._2.array.body.0
  j .F.unboundedKnapsackDP._3.array.exit.0                              # ir inst 6 fin
.F.unboundedKnapsackDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.unboundedKnapsackDP._1.array.cond.0                              # ir inst 10 fin
.F.unboundedKnapsackDP._3.array.exit.0:
  addi t1, sp, 208
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.unboundedKnapsackDP._4.array.cond.1                              # ir inst 13 fin
.F.unboundedKnapsackDP._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.unboundedKnapsackDP._5.array.body.1
  j .F.unboundedKnapsackDP._6.array.exit.1                              # ir inst 16 fin
.F.unboundedKnapsackDP._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.unboundedKnapsackDP._4.array.cond.1                              # ir inst 20 fin
.F.unboundedKnapsackDP._6.array.exit.1:
# Phi connections
  li t5, 222
  li t6, 0
  j .F.unboundedKnapsackDP._7.while.cond.0                              # ir inst 21 fin
.F.unboundedKnapsackDP._7.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 24 fin
  bnez t4, .F.unboundedKnapsackDP._8.while.body.0
  j .F.unboundedKnapsackDP._12.while.exit.0                             # ir inst 25 fin
.F.unboundedKnapsackDP._8.while.body.0:
  li t2, 1664
  mul t4, t5, t2                                                        # ir inst 26 fin
  li t2, 904223
  add t5, t4, t2                                                        # ir inst 27 fin
  li t2, 83647
  rem t4, t5, t2                                                        # ir inst 28 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 29 fin
  bnez t5, .F.unboundedKnapsackDP._9.if.then.0
  j .F.unboundedKnapsackDP._10.if.else.0                                # ir inst 30 fin
.F.unboundedKnapsackDP._9.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 31 fin
# Phi connections
  j .F.unboundedKnapsackDP._11.if.exit.0                                # ir inst 32 fin
.F.unboundedKnapsackDP._10.if.else.0:
# Phi connections
  mv t5, t4
  j .F.unboundedKnapsackDP._11.if.exit.0                                # ir inst 33 fin
.F.unboundedKnapsackDP._11.if.exit.0:
  mv t4, t6                                                             # ir inst 35 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 36 fin
  li t2, 15
  rem t4, t5, t2                                                        # ir inst 37 fin
  addi s11, t4, 1                                                       # ir inst 38 fin
  sw s11, 0(t3)                                                         # ir inst 39 fin
  mv t4, t6                                                             # ir inst 40 fin
  slli t2, t4, 2
  addi t1, sp, 208
  add t3, t1, t2                                                        # ir inst 41 fin
  li t2, 40
  rem t4, t5, t2                                                        # ir inst 42 fin
  addi s11, t4, 5                                                       # ir inst 43 fin
  sw s11, 0(t3)                                                         # ir inst 44 fin
  addi t4, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t6, t4
  j .F.unboundedKnapsackDP._7.while.cond.0                              # ir inst 46 fin
.F.unboundedKnapsackDP._12.while.exit.0:
  addi t1, sp, 408
  addi t6, t1, 0                                                        # ir inst 48 fin
# Phi connections
  li t5, 0
  j .F.unboundedKnapsackDP._13.array.cond.2                             # ir inst 49 fin
.F.unboundedKnapsackDP._13.array.cond.2:
  li t2, 101
  slt t4, t5, t2                                                        # ir inst 51 fin
  bnez t4, .F.unboundedKnapsackDP._14.array.body.2
  j .F.unboundedKnapsackDP._15.array.exit.2                             # ir inst 52 fin
.F.unboundedKnapsackDP._14.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 54 fin
  addi t4, t5, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t4
  j .F.unboundedKnapsackDP._13.array.cond.2                             # ir inst 56 fin
.F.unboundedKnapsackDP._15.array.exit.2:
# Phi connections
  li t6, 1
  j .F.unboundedKnapsackDP._16.while.cond.1                             # ir inst 57 fin
.F.unboundedKnapsackDP._16.while.cond.1:
  slt t0, a1, t6
  xori t5, t0, 1                                                        # ir inst 59 fin
  bnez t5, .F.unboundedKnapsackDP._17.while.body.1
  j .F.unboundedKnapsackDP._27.while.exit.1                             # ir inst 60 fin
.F.unboundedKnapsackDP._17.while.body.1:
# Phi connections
  li t5, 0
  j .F.unboundedKnapsackDP._18.while.cond.2                             # ir inst 61 fin
.F.unboundedKnapsackDP._18.while.cond.2:
  slt t4, t5, a0                                                        # ir inst 63 fin
  bnez t4, .F.unboundedKnapsackDP._19.while.body.2
  j .F.unboundedKnapsackDP._26.while.exit.2                             # ir inst 64 fin
.F.unboundedKnapsackDP._19.while.body.2:
  mv t4, t5                                                             # ir inst 65 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 66 fin
  lw t4, 0(t3)                                                          # ir inst 67 fin
  slt t0, t6, t4
  xori t3, t0, 1                                                        # ir inst 68 fin
  bnez t3, .F.unboundedKnapsackDP._20.if.then.1
  j .F.unboundedKnapsackDP._24.if.else.1                                # ir inst 69 fin
.F.unboundedKnapsackDP._20.if.then.1:
  mv t4, t5                                                             # ir inst 70 fin
  slli t2, t4, 2
  addi t1, sp, 208
  add t3, t1, t2                                                        # ir inst 71 fin
  lw t4, 0(t3)                                                          # ir inst 72 fin
  mv t3, t5                                                             # ir inst 73 fin
  slli t2, t3, 2
  addi t1, sp, 8
  add s11, t1, t2                                                       # ir inst 74 fin
  lw t3, 0(s11)                                                         # ir inst 75 fin
  sub s11, t6, t3                                                       # ir inst 76 fin
  mv t3, s11                                                            # ir inst 77 fin
  slli t2, t3, 2
  addi t1, sp, 408
  add s11, t1, t2                                                       # ir inst 78 fin
  lw t3, 0(s11)                                                         # ir inst 79 fin
  add s11, t4, t3                                                       # ir inst 80 fin
  mv t4, t6                                                             # ir inst 81 fin
  slli t2, t4, 2
  addi t1, sp, 408
  add t3, t1, t2                                                        # ir inst 82 fin
  lw t4, 0(t3)                                                          # ir inst 83 fin
  slt t3, t4, s11                                                       # ir inst 84 fin
  bnez t3, .F.unboundedKnapsackDP._21.if.then.2
  j .F.unboundedKnapsackDP._22.if.else.2                                # ir inst 85 fin
.F.unboundedKnapsackDP._21.if.then.2:
  mv t4, t6                                                             # ir inst 86 fin
  slli t2, t4, 2
  addi t1, sp, 408
  add t3, t1, t2                                                        # ir inst 87 fin
  sw s11, 0(t3)                                                         # ir inst 88 fin
  j .F.unboundedKnapsackDP._23.if.exit.2                                # ir inst 89 fin
.F.unboundedKnapsackDP._22.if.else.2:
  j .F.unboundedKnapsackDP._23.if.exit.2                                # ir inst 90 fin
.F.unboundedKnapsackDP._23.if.exit.2:
  j .F.unboundedKnapsackDP._25.if.exit.1                                # ir inst 91 fin
.F.unboundedKnapsackDP._24.if.else.1:
  j .F.unboundedKnapsackDP._25.if.exit.1                                # ir inst 92 fin
.F.unboundedKnapsackDP._25.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 93 fin
# Phi connections
  mv t5, t4
  j .F.unboundedKnapsackDP._18.while.cond.2                             # ir inst 94 fin
.F.unboundedKnapsackDP._26.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 95 fin
# Phi connections
  mv t6, t5
  j .F.unboundedKnapsackDP._16.while.cond.1                             # ir inst 96 fin
.F.unboundedKnapsackDP._27.while.exit.1:
  mv t6, a1                                                             # ir inst 97 fin
  slli t2, t6, 2
  addi t1, sp, 408
  add t5, t1, t2                                                        # ir inst 98 fin
  lw t6, 0(t5)                                                          # ir inst 99 fin
  mv a0, t6
  j .F.unboundedKnapsackDP.epilogue                                     # ir inst 100 fin
.F.unboundedKnapsackDP.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 816
  ret

.globl .F.jobSchedulingDP
.F.jobSchedulingDP:
# spill func args num: 0,             range:      288(sp) -      288(sp)
# local var size: 260,                range:       16(sp) -      276(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -288
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.jobSchedulingDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.jobSchedulingDP._1.array.cond.0                                  # ir inst 3 fin
.F.jobSchedulingDP._1.array.cond.0:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.jobSchedulingDP._2.array.body.0
  j .F.jobSchedulingDP._3.array.exit.0                                  # ir inst 6 fin
.F.jobSchedulingDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.jobSchedulingDP._1.array.cond.0                                  # ir inst 10 fin
.F.jobSchedulingDP._3.array.exit.0:
  addi t1, sp, 136
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.jobSchedulingDP._4.array.cond.1                                  # ir inst 13 fin
.F.jobSchedulingDP._4.array.cond.1:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.jobSchedulingDP._5.array.body.1
  j .F.jobSchedulingDP._6.array.exit.1                                  # ir inst 16 fin
.F.jobSchedulingDP._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.jobSchedulingDP._4.array.cond.1                                  # ir inst 20 fin
.F.jobSchedulingDP._6.array.exit.1:
# Phi connections
  li t5, 0
  li t6, 33
  j .F.jobSchedulingDP._7.while.cond.0                                  # ir inst 21 fin
.F.jobSchedulingDP._7.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 24 fin
  bnez t4, .F.jobSchedulingDP._8.while.body.0
  j .F.jobSchedulingDP._12.while.exit.0                                 # ir inst 25 fin
.F.jobSchedulingDP._8.while.body.0:
  li t2, 1664
  mul t4, t6, t2                                                        # ir inst 26 fin
  li t2, 904223
  add t6, t4, t2                                                        # ir inst 27 fin
  li t2, 83647
  rem t4, t6, t2                                                        # ir inst 28 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 29 fin
  bnez t6, .F.jobSchedulingDP._9.if.then.0
  j .F.jobSchedulingDP._10.if.else.0                                    # ir inst 30 fin
.F.jobSchedulingDP._9.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 31 fin
# Phi connections
  j .F.jobSchedulingDP._11.if.exit.0                                    # ir inst 32 fin
.F.jobSchedulingDP._10.if.else.0:
# Phi connections
  mv t6, t4
  j .F.jobSchedulingDP._11.if.exit.0                                    # ir inst 33 fin
.F.jobSchedulingDP._11.if.exit.0:
  mv t4, t5                                                             # ir inst 35 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 36 fin
  li t2, 100
  rem t4, t6, t2                                                        # ir inst 37 fin
  addi s11, t4, 10                                                      # ir inst 38 fin
  sw s11, 0(t3)                                                         # ir inst 39 fin
  mv t4, t5                                                             # ir inst 40 fin
  slli t2, t4, 2
  addi t1, sp, 136
  add t3, t1, t2                                                        # ir inst 41 fin
  li t2, 20
  rem t4, t6, t2                                                        # ir inst 42 fin
  addi s11, t4, 1                                                       # ir inst 43 fin
  sw s11, 0(t3)                                                         # ir inst 44 fin
  addi t4, t5, 1                                                        # ir inst 45 fin
# Phi connections
  mv t5, t4
  j .F.jobSchedulingDP._7.while.cond.0                                  # ir inst 46 fin
.F.jobSchedulingDP._12.while.exit.0:
# Phi connections
  li t6, 0
  j .F.jobSchedulingDP._13.while.cond.1                                 # ir inst 47 fin
.F.jobSchedulingDP._13.while.cond.1:
  addi t5, a0, -1                                                       # ir inst 49 fin
  slt t4, t6, t5                                                        # ir inst 50 fin
  bnez t4, .F.jobSchedulingDP._14.while.body.1
  j .F.jobSchedulingDP._21.while.exit.1                                 # ir inst 51 fin
.F.jobSchedulingDP._14.while.body.1:
# Phi connections
  li t5, 0
  j .F.jobSchedulingDP._15.while.cond.2                                 # ir inst 52 fin
.F.jobSchedulingDP._15.while.cond.2:
  sub t4, a0, t6                                                        # ir inst 54 fin
  addi t3, t4, -1                                                       # ir inst 55 fin
  slt t4, t5, t3                                                        # ir inst 56 fin
  bnez t4, .F.jobSchedulingDP._16.while.body.2
  j .F.jobSchedulingDP._20.while.exit.2                                 # ir inst 57 fin
.F.jobSchedulingDP._16.while.body.2:
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 59 fin
  lw t4, 0(t3)                                                          # ir inst 60 fin
  addi t3, t5, 1                                                        # ir inst 61 fin
  mv s11, t3                                                            # ir inst 62 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 63 fin
  lw s11, 0(t3)                                                         # ir inst 64 fin
  slt t3, t4, s11                                                       # ir inst 65 fin
  bnez t3, .F.jobSchedulingDP._17.if.then.1
  j .F.jobSchedulingDP._18.if.else.1                                    # ir inst 66 fin
.F.jobSchedulingDP._17.if.then.1:
  mv t4, t5                                                             # ir inst 67 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 68 fin
  lw t4, 0(t3)                                                          # ir inst 69 fin
  mv t3, t5                                                             # ir inst 70 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 71 fin
  addi t3, t5, 1                                                        # ir inst 72 fin
  mv s10, t3                                                            # ir inst 73 fin
  slli t2, s10, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 74 fin
  lw s10, 0(t3)                                                         # ir inst 75 fin
  sw s10, 0(s11)                                                        # ir inst 76 fin
  addi t3, t5, 1                                                        # ir inst 77 fin
  mv s11, t3                                                            # ir inst 78 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 79 fin
  sw t4, 0(t3)                                                          # ir inst 80 fin
  mv t4, t5                                                             # ir inst 81 fin
  slli t2, t4, 2
  addi t1, sp, 136
  add t3, t1, t2                                                        # ir inst 82 fin
  lw t4, 0(t3)                                                          # ir inst 83 fin
  mv t3, t5                                                             # ir inst 84 fin
  slli t2, t3, 2
  addi t1, sp, 136
  add s11, t1, t2                                                       # ir inst 85 fin
  addi t3, t5, 1                                                        # ir inst 86 fin
  mv s10, t3                                                            # ir inst 87 fin
  slli t2, s10, 2
  addi t1, sp, 136
  add t3, t1, t2                                                        # ir inst 88 fin
  lw s10, 0(t3)                                                         # ir inst 89 fin
  sw s10, 0(s11)                                                        # ir inst 90 fin
  addi t3, t5, 1                                                        # ir inst 91 fin
  mv s11, t3                                                            # ir inst 92 fin
  slli t2, s11, 2
  addi t1, sp, 136
  add t3, t1, t2                                                        # ir inst 93 fin
  sw t4, 0(t3)                                                          # ir inst 94 fin
  j .F.jobSchedulingDP._19.if.exit.1                                    # ir inst 95 fin
.F.jobSchedulingDP._18.if.else.1:
  j .F.jobSchedulingDP._19.if.exit.1                                    # ir inst 96 fin
.F.jobSchedulingDP._19.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 97 fin
# Phi connections
  mv t5, t4
  j .F.jobSchedulingDP._15.while.cond.2                                 # ir inst 98 fin
.F.jobSchedulingDP._20.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 99 fin
# Phi connections
  mv t6, t5
  j .F.jobSchedulingDP._13.while.cond.1                                 # ir inst 100 fin
.F.jobSchedulingDP._21.while.exit.1:
  addi t1, sp, 256
  addi t6, t1, 0                                                        # ir inst 102 fin
# Phi connections
  li t5, 0
  j .F.jobSchedulingDP._22.array.cond.2                                 # ir inst 103 fin
.F.jobSchedulingDP._22.array.cond.2:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 105 fin
  bnez t4, .F.jobSchedulingDP._23.array.body.2
  j .F.jobSchedulingDP._24.array.exit.2                                 # ir inst 106 fin
.F.jobSchedulingDP._23.array.body.2:
  add t4, t6, t5                                                        # ir inst 107 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 108 fin
  addi t4, t5, 1                                                        # ir inst 109 fin
# Phi connections
  mv t5, t4
  j .F.jobSchedulingDP._22.array.cond.2                                 # ir inst 110 fin
.F.jobSchedulingDP._24.array.exit.2:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.jobSchedulingDP._25.while.cond.3                                 # ir inst 111 fin
.F.jobSchedulingDP._25.while.cond.3:
  slt t4, t6, a0                                                        # ir inst 114 fin
  bnez t4, .F.jobSchedulingDP._26.while.body.3
  j .F.jobSchedulingDP._36.while.exit.3                                 # ir inst 115 fin
.F.jobSchedulingDP._26.while.body.3:
  mv t4, t6                                                             # ir inst 116 fin
  slli t2, t4, 2
  addi t1, sp, 136
  add t3, t1, t2                                                        # ir inst 117 fin
  lw t4, 0(t3)                                                          # ir inst 118 fin
  addi t3, t4, -1                                                       # ir inst 119 fin
# Phi connections
  mv t4, t3
  j .F.jobSchedulingDP._27.while.cond.4                                 # ir inst 120 fin
.F.jobSchedulingDP._27.while.cond.4:
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 122 fin
  bnez t3, .F.jobSchedulingDP._28.while.body.4
  j .F.jobSchedulingDP._37.critical_edge.0                              # ir inst 123 fin
.F.jobSchedulingDP._28.while.body.4:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 124 fin
  bnez t3, .F.jobSchedulingDP._29.lazy.then.0
  j .F.jobSchedulingDP._30.lazy.else.0                                  # ir inst 125 fin
.F.jobSchedulingDP._29.lazy.then.0:
  mv t3, t4                                                             # ir inst 126 fin
  addi t1, sp, 256
  add s11, t1, t3                                                       # ir inst 127 fin
  lb t3, 0(s11)                                                         # ir inst 128 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 129 fin
# Phi connections
  mv t3, s11
  j .F.jobSchedulingDP._31.lazy.exit.0                                  # ir inst 130 fin
.F.jobSchedulingDP._30.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.jobSchedulingDP._31.lazy.exit.0                                  # ir inst 131 fin
.F.jobSchedulingDP._31.lazy.exit.0:
  bnez t3, .F.jobSchedulingDP._32.if.then.2
  j .F.jobSchedulingDP._33.if.else.2                                    # ir inst 133 fin
.F.jobSchedulingDP._32.if.then.2:
  mv t3, t4                                                             # ir inst 134 fin
  addi t1, sp, 256
  add s11, t1, t3                                                       # ir inst 135 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 136 fin
  mv t3, t6                                                             # ir inst 137 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 138 fin
  lw t3, 0(s11)                                                         # ir inst 139 fin
  add s11, t5, t3                                                       # ir inst 140 fin
# Phi connections
  mv t4, s11
  j .F.jobSchedulingDP._35.while.exit.4                                 # ir inst 141 fin
.F.jobSchedulingDP._33.if.else.2:
  j .F.jobSchedulingDP._34.if.exit.2                                    # ir inst 142 fin
.F.jobSchedulingDP._34.if.exit.2:
  addi t3, t4, -1                                                       # ir inst 143 fin
# Phi connections
  mv t4, t3
  j .F.jobSchedulingDP._27.while.cond.4                                 # ir inst 144 fin
.F.jobSchedulingDP._35.while.exit.4:
  addi t3, t6, 1                                                        # ir inst 146 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.jobSchedulingDP._25.while.cond.3                                 # ir inst 147 fin
.F.jobSchedulingDP._36.while.exit.3:
  mv a0, t5
  j .F.jobSchedulingDP.epilogue                                         # ir inst 148 fin
.F.jobSchedulingDP._37.critical_edge.0:
# Phi connections
  mv t4, t5
  j .F.jobSchedulingDP._35.while.exit.4                                 # ir inst 149 fin
.F.jobSchedulingDP.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 288
  ret

.globl .F.partitionProblemDP
.F.partitionProblemDP:
# spill func args num: 0,             range:     1184(sp) -     1184(sp)
# local var size: 1161,               range:       16(sp) -     1177(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1184
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.partitionProblemDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.partitionProblemDP._1.array.cond.0                               # ir inst 3 fin
.F.partitionProblemDP._1.array.cond.0:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.partitionProblemDP._2.array.body.0
  j .F.partitionProblemDP._3.array.exit.0                               # ir inst 6 fin
.F.partitionProblemDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.partitionProblemDP._1.array.cond.0                               # ir inst 10 fin
.F.partitionProblemDP._3.array.exit.0:
# Phi connections
  li t4, 44
  li t5, 0
  li t6, 0
  j .F.partitionProblemDP._4.while.cond.0                               # ir inst 11 fin
.F.partitionProblemDP._4.while.cond.0:
  slt t3, t6, a0                                                        # ir inst 15 fin
  bnez t3, .F.partitionProblemDP._5.while.body.0
  j .F.partitionProblemDP._9.while.exit.0                               # ir inst 16 fin
.F.partitionProblemDP._5.while.body.0:
  li t2, 1664
  mul t3, t4, t2                                                        # ir inst 17 fin
  li t2, 904223
  add t4, t3, t2                                                        # ir inst 18 fin
  li t2, 83647
  rem t3, t4, t2                                                        # ir inst 19 fin
  li t2, 0
  slt t4, t3, t2                                                        # ir inst 20 fin
  bnez t4, .F.partitionProblemDP._6.if.then.0
  j .F.partitionProblemDP._7.if.else.0                                  # ir inst 21 fin
.F.partitionProblemDP._6.if.then.0:
  li t1, 0
  sub t4, t1, t3                                                        # ir inst 22 fin
# Phi connections
  j .F.partitionProblemDP._8.if.exit.0                                  # ir inst 23 fin
.F.partitionProblemDP._7.if.else.0:
# Phi connections
  mv t4, t3
  j .F.partitionProblemDP._8.if.exit.0                                  # ir inst 24 fin
.F.partitionProblemDP._8.if.exit.0:
  mv t3, t6                                                             # ir inst 26 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 27 fin
  li t2, 50
  rem t3, t4, t2                                                        # ir inst 28 fin
  addi s10, t3, 1                                                       # ir inst 29 fin
  sw s10, 0(s11)                                                        # ir inst 30 fin
  mv t3, t6                                                             # ir inst 31 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 32 fin
  lw t3, 0(s11)                                                         # ir inst 33 fin
  add s11, t5, t3                                                       # ir inst 34 fin
  addi t3, t6, 1                                                        # ir inst 35 fin
# Phi connections
  mv t5, s11
  mv t6, t3
  j .F.partitionProblemDP._4.while.cond.0                               # ir inst 36 fin
.F.partitionProblemDP._9.while.exit.0:
  li t2, 2
  rem t6, t5, t2                                                        # ir inst 37 fin
  li t2, 0
  xor t0, t6, t2
  sltu t4, zero, t0                                                     # ir inst 38 fin
  bnez t4, .F.partitionProblemDP._10.if.then.1
  j .F.partitionProblemDP._11.if.else.1                                 # ir inst 39 fin
.F.partitionProblemDP._10.if.then.1:
  li a0, 0
  j .F.partitionProblemDP.epilogue                                      # ir inst 40 fin
.F.partitionProblemDP._11.if.else.1:
  j .F.partitionProblemDP._12.if.exit.1                                 # ir inst 41 fin
.F.partitionProblemDP._12.if.exit.1:
  li t2, 2
  div t6, t5, t2                                                        # ir inst 42 fin
  addi t1, sp, 176
  addi t5, t1, 0                                                        # ir inst 44 fin
# Phi connections
  li t4, 0
  j .F.partitionProblemDP._13.array.cond.1                              # ir inst 45 fin
.F.partitionProblemDP._13.array.cond.1:
  li t2, 1001
  slt t3, t4, t2                                                        # ir inst 47 fin
  bnez t3, .F.partitionProblemDP._14.array.body.1
  j .F.partitionProblemDP._15.array.exit.1                              # ir inst 48 fin
.F.partitionProblemDP._14.array.body.1:
  add t3, t5, t4                                                        # ir inst 49 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 50 fin
  addi t3, t4, 1                                                        # ir inst 51 fin
# Phi connections
  mv t4, t3
  j .F.partitionProblemDP._13.array.cond.1                              # ir inst 52 fin
.F.partitionProblemDP._15.array.exit.1:
  addi t1, sp, 176
  addi t5, t1, 0                                                        # ir inst 53 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 54 fin
# Phi connections
  li t5, 0
  j .F.partitionProblemDP._16.while.cond.1                              # ir inst 55 fin
.F.partitionProblemDP._16.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 57 fin
  bnez t4, .F.partitionProblemDP._17.while.body.1
  j .F.partitionProblemDP._24.while.exit.1                              # ir inst 58 fin
.F.partitionProblemDP._17.while.body.1:
# Phi connections
  mv t4, t6
  j .F.partitionProblemDP._18.while.cond.2                              # ir inst 59 fin
.F.partitionProblemDP._18.while.cond.2:
  mv t3, t5                                                             # ir inst 61 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 62 fin
  lw t3, 0(s11)                                                         # ir inst 63 fin
  slt t0, t4, t3
  xori s11, t0, 1                                                       # ir inst 64 fin
  bnez s11, .F.partitionProblemDP._19.while.body.2
  j .F.partitionProblemDP._23.while.exit.2                              # ir inst 65 fin
.F.partitionProblemDP._19.while.body.2:
  mv t3, t4                                                             # ir inst 66 fin
  addi t1, sp, 176
  add s11, t1, t3                                                       # ir inst 67 fin
  mv t3, t4                                                             # ir inst 68 fin
  addi t1, sp, 176
  add s10, t1, t3                                                       # ir inst 69 fin
  lb t3, 0(s10)                                                         # ir inst 70 fin
  bnez t3, .F.partitionProblemDP._20.lazy.then.0
  j .F.partitionProblemDP._21.lazy.else.0                               # ir inst 71 fin
.F.partitionProblemDP._20.lazy.then.0:
# Phi connections
  li t3, 1
  j .F.partitionProblemDP._22.lazy.exit.0                               # ir inst 72 fin
.F.partitionProblemDP._21.lazy.else.0:
  mv t3, t5                                                             # ir inst 73 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s10, t1, t2                                                       # ir inst 74 fin
  lw t3, 0(s10)                                                         # ir inst 75 fin
  sub s10, t4, t3                                                       # ir inst 76 fin
  mv t3, s10                                                            # ir inst 77 fin
  addi t1, sp, 176
  add s10, t1, t3                                                       # ir inst 78 fin
  lb t3, 0(s10)                                                         # ir inst 79 fin
# Phi connections
  j .F.partitionProblemDP._22.lazy.exit.0                               # ir inst 80 fin
.F.partitionProblemDP._22.lazy.exit.0:
  sb t3, 0(s11)                                                         # ir inst 82 fin
  addi t3, t4, -1                                                       # ir inst 83 fin
# Phi connections
  mv t4, t3
  j .F.partitionProblemDP._18.while.cond.2                              # ir inst 84 fin
.F.partitionProblemDP._23.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 85 fin
# Phi connections
  mv t5, t4
  j .F.partitionProblemDP._16.while.cond.1                              # ir inst 86 fin
.F.partitionProblemDP._24.while.exit.1:
  mv t5, t6                                                             # ir inst 87 fin
  addi t1, sp, 176
  add t6, t1, t5                                                        # ir inst 88 fin
  lb t5, 0(t6)                                                          # ir inst 89 fin
  bnez t5, .F.partitionProblemDP._25.if.then.2
  j .F.partitionProblemDP._26.if.else.2                                 # ir inst 90 fin
.F.partitionProblemDP._25.if.then.2:
  li a0, 1
  j .F.partitionProblemDP.epilogue                                      # ir inst 91 fin
.F.partitionProblemDP._26.if.else.2:
  li a0, 0
  j .F.partitionProblemDP.epilogue                                      # ir inst 92 fin
.F.partitionProblemDP._27.if.exit.2:
.F.partitionProblemDP.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 1184
  ret

.globl .F.matrixChainMultiplicationDP
.F.matrixChainMultiplicationDP:
# spill func args num: 0,             range:     1728(sp) -     1728(sp)
# local var size: 1684,               range:       32(sp) -     1716(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1728
  sd s8, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
.F.matrixChainMultiplicationDP._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.matrixChainMultiplicationDP._1.array.cond.0                      # ir inst 3 fin
.F.matrixChainMultiplicationDP._1.array.cond.0:
  li t2, 21
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.matrixChainMultiplicationDP._2.array.body.0
  j .F.matrixChainMultiplicationDP._3.array.exit.0                      # ir inst 6 fin
.F.matrixChainMultiplicationDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.matrixChainMultiplicationDP._1.array.cond.0                      # ir inst 10 fin
.F.matrixChainMultiplicationDP._3.array.exit.0:
# Phi connections
  li t5, 55
  li t6, 0
  j .F.matrixChainMultiplicationDP._4.while.cond.0                      # ir inst 11 fin
.F.matrixChainMultiplicationDP._4.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 14 fin
  bnez t4, .F.matrixChainMultiplicationDP._5.while.body.0
  j .F.matrixChainMultiplicationDP._9.while.exit.0                      # ir inst 15 fin
.F.matrixChainMultiplicationDP._5.while.body.0:
  li t2, 1664
  mul t4, t5, t2                                                        # ir inst 16 fin
  li t2, 904223
  add t5, t4, t2                                                        # ir inst 17 fin
  li t2, 83647
  rem t4, t5, t2                                                        # ir inst 18 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 19 fin
  bnez t5, .F.matrixChainMultiplicationDP._6.if.then.0
  j .F.matrixChainMultiplicationDP._7.if.else.0                         # ir inst 20 fin
.F.matrixChainMultiplicationDP._6.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 21 fin
# Phi connections
  j .F.matrixChainMultiplicationDP._8.if.exit.0                         # ir inst 22 fin
.F.matrixChainMultiplicationDP._7.if.else.0:
# Phi connections
  mv t5, t4
  j .F.matrixChainMultiplicationDP._8.if.exit.0                         # ir inst 23 fin
.F.matrixChainMultiplicationDP._8.if.exit.0:
  mv t4, t6                                                             # ir inst 25 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add t3, t1, t2                                                        # ir inst 26 fin
  li t2, 50
  rem t4, t5, t2                                                        # ir inst 27 fin
  addi s11, t4, 10                                                      # ir inst 28 fin
  sw s11, 0(t3)                                                         # ir inst 29 fin
  addi t4, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t4
  j .F.matrixChainMultiplicationDP._4.while.cond.0                      # ir inst 31 fin
.F.matrixChainMultiplicationDP._9.while.exit.0:
  addi t1, sp, 116
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.matrixChainMultiplicationDP._10.array.cond.1                     # ir inst 34 fin
.F.matrixChainMultiplicationDP._10.array.cond.1:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.matrixChainMultiplicationDP._11.array.body.1
  j .F.matrixChainMultiplicationDP._12.array.exit.1                     # ir inst 37 fin
.F.matrixChainMultiplicationDP._11.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.matrixChainMultiplicationDP._10.array.cond.1                     # ir inst 41 fin
.F.matrixChainMultiplicationDP._12.array.exit.1:
# Phi connections
  li t6, 2
  j .F.matrixChainMultiplicationDP._13.while.cond.1                     # ir inst 42 fin
.F.matrixChainMultiplicationDP._13.while.cond.1:
  slt t0, a0, t6
  xori t5, t0, 1                                                        # ir inst 44 fin
  bnez t5, .F.matrixChainMultiplicationDP._14.while.body.1
  j .F.matrixChainMultiplicationDP._24.while.exit.1                     # ir inst 45 fin
.F.matrixChainMultiplicationDP._14.while.body.1:
# Phi connections
  li t5, 1
  j .F.matrixChainMultiplicationDP._15.while.cond.2                     # ir inst 46 fin
.F.matrixChainMultiplicationDP._15.while.cond.2:
  sub t4, a0, t6                                                        # ir inst 48 fin
  addi t3, t4, 1                                                        # ir inst 49 fin
  slt t0, t3, t5
  xori t4, t0, 1                                                        # ir inst 50 fin
  bnez t4, .F.matrixChainMultiplicationDP._16.while.body.2
  j .F.matrixChainMultiplicationDP._23.while.exit.2                     # ir inst 51 fin
.F.matrixChainMultiplicationDP._16.while.body.2:
  add t4, t5, t6                                                        # ir inst 52 fin
  addi t3, t4, -1                                                       # ir inst 53 fin
  addi t4, t5, -1                                                       # ir inst 54 fin
  li t2, 20
  mul s11, t4, t2                                                       # ir inst 55 fin
  addi t4, t3, -1                                                       # ir inst 56 fin
  add s10, s11, t4                                                      # ir inst 57 fin
  mv t4, s10                                                            # ir inst 58 fin
  slli t2, t4, 2
  addi t1, sp, 116
  add s11, t1, t2                                                       # ir inst 59 fin
  li t1, 999999
  sw t1, 0(s11)                                                         # ir inst 60 fin
# Phi connections
  mv t4, t5
  j .F.matrixChainMultiplicationDP._17.while.cond.3                     # ir inst 61 fin
.F.matrixChainMultiplicationDP._17.while.cond.3:
  slt s11, t4, t3                                                       # ir inst 63 fin
  bnez s11, .F.matrixChainMultiplicationDP._18.while.body.3
  j .F.matrixChainMultiplicationDP._22.while.exit.3                     # ir inst 64 fin
.F.matrixChainMultiplicationDP._18.while.body.3:
  addi s11, t5, -1                                                      # ir inst 65 fin
  li t2, 20
  mul s10, s11, t2                                                      # ir inst 66 fin
  addi s11, t4, -1                                                      # ir inst 67 fin
  add s9, s10, s11                                                      # ir inst 68 fin
  mv s11, s9                                                            # ir inst 69 fin
  slli t2, s11, 2
  addi t1, sp, 116
  add s10, t1, t2                                                       # ir inst 70 fin
  lw s11, 0(s10)                                                        # ir inst 71 fin
  li t2, 20
  mul s10, t4, t2                                                       # ir inst 72 fin
  addi s9, t3, -1                                                       # ir inst 73 fin
  add s8, s10, s9                                                       # ir inst 74 fin
  mv s10, s8                                                            # ir inst 75 fin
  slli t2, s10, 2
  addi t1, sp, 116
  add s9, t1, t2                                                        # ir inst 76 fin
  lw s10, 0(s9)                                                         # ir inst 77 fin
  add s9, s11, s10                                                      # ir inst 78 fin
  addi s11, t5, -1                                                      # ir inst 79 fin
  mv s10, s11                                                           # ir inst 80 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 81 fin
  lw s10, 0(s11)                                                        # ir inst 82 fin
  mv s11, t4                                                            # ir inst 83 fin
  slli t2, s11, 2
  addi t1, sp, 32
  add s8, t1, t2                                                        # ir inst 84 fin
  lw s11, 0(s8)                                                         # ir inst 85 fin
  mul s8, s10, s11                                                      # ir inst 86 fin
  mv s11, t3                                                            # ir inst 87 fin
  slli t2, s11, 2
  addi t1, sp, 32
  add s10, t1, t2                                                       # ir inst 88 fin
  lw s11, 0(s10)                                                        # ir inst 89 fin
  mul s10, s8, s11                                                      # ir inst 90 fin
  add s11, s9, s10                                                      # ir inst 91 fin
  addi s10, t5, -1                                                      # ir inst 92 fin
  li t2, 20
  mul s9, s10, t2                                                       # ir inst 93 fin
  addi s10, t3, -1                                                      # ir inst 94 fin
  add s8, s9, s10                                                       # ir inst 95 fin
  mv s10, s8                                                            # ir inst 96 fin
  slli t2, s10, 2
  addi t1, sp, 116
  add s9, t1, t2                                                        # ir inst 97 fin
  lw s10, 0(s9)                                                         # ir inst 98 fin
  slt s9, s11, s10                                                      # ir inst 99 fin
  bnez s9, .F.matrixChainMultiplicationDP._19.if.then.1
  j .F.matrixChainMultiplicationDP._20.if.else.1                        # ir inst 100 fin
.F.matrixChainMultiplicationDP._19.if.then.1:
  addi s10, t5, -1                                                      # ir inst 101 fin
  li t2, 20
  mul s9, s10, t2                                                       # ir inst 102 fin
  addi s10, t3, -1                                                      # ir inst 103 fin
  add s8, s9, s10                                                       # ir inst 104 fin
  mv s10, s8                                                            # ir inst 105 fin
  slli t2, s10, 2
  addi t1, sp, 116
  add s9, t1, t2                                                        # ir inst 106 fin
  sw s11, 0(s9)                                                         # ir inst 107 fin
  j .F.matrixChainMultiplicationDP._21.if.exit.1                        # ir inst 108 fin
.F.matrixChainMultiplicationDP._20.if.else.1:
  j .F.matrixChainMultiplicationDP._21.if.exit.1                        # ir inst 109 fin
.F.matrixChainMultiplicationDP._21.if.exit.1:
  addi s11, t4, 1                                                       # ir inst 110 fin
# Phi connections
  mv t4, s11
  j .F.matrixChainMultiplicationDP._17.while.cond.3                     # ir inst 111 fin
.F.matrixChainMultiplicationDP._22.while.exit.3:
  addi t4, t5, 1                                                        # ir inst 112 fin
# Phi connections
  mv t5, t4
  j .F.matrixChainMultiplicationDP._15.while.cond.2                     # ir inst 113 fin
.F.matrixChainMultiplicationDP._23.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 114 fin
# Phi connections
  mv t6, t5
  j .F.matrixChainMultiplicationDP._13.while.cond.1                     # ir inst 115 fin
.F.matrixChainMultiplicationDP._24.while.exit.1:
  addi t6, a0, -1                                                       # ir inst 116 fin
  mv t5, t6                                                             # ir inst 117 fin
  slli t2, t5, 2
  addi t1, sp, 116
  add t6, t1, t2                                                        # ir inst 118 fin
  lw t5, 0(t6)                                                          # ir inst 119 fin
  mv a0, t5
  j .F.matrixChainMultiplicationDP.epilogue                             # ir inst 120 fin
.F.matrixChainMultiplicationDP.epilogue:
  ld s8, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 1728
  ret

.globl .F.testGameTheoryDP
.F.testGameTheoryDP:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testGameTheoryDP._0.entry.0:
# Start call preparation
  li a0, 1807
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 20
  call .F.optimalGameStrategyDP
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 30
  call .F.coinGameDP
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a0, 25
  call .F.nimGameDP
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 1808
  call printlnInt
# ir inst 8 fin
  j .F.testGameTheoryDP.epilogue                                        # ir inst 9 fin
.F.testGameTheoryDP.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.optimalGameStrategyDP
.F.optimalGameStrategyDP:
# spill func args num: 0,             range:     1712(sp) -     1712(sp)
# local var size: 1680,               range:       32(sp) -     1712(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1712
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.optimalGameStrategyDP._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.optimalGameStrategyDP._1.array.cond.0                            # ir inst 3 fin
.F.optimalGameStrategyDP._1.array.cond.0:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.optimalGameStrategyDP._2.array.body.0
  j .F.optimalGameStrategyDP._3.array.exit.0                            # ir inst 6 fin
.F.optimalGameStrategyDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.optimalGameStrategyDP._1.array.cond.0                            # ir inst 10 fin
.F.optimalGameStrategyDP._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 66
  j .F.optimalGameStrategyDP._4.while.cond.0                            # ir inst 11 fin
.F.optimalGameStrategyDP._4.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 14 fin
  bnez t4, .F.optimalGameStrategyDP._5.while.body.0
  j .F.optimalGameStrategyDP._9.while.exit.0                            # ir inst 15 fin
.F.optimalGameStrategyDP._5.while.body.0:
  li t2, 1664
  mul t4, t6, t2                                                        # ir inst 16 fin
  li t2, 904223
  add t6, t4, t2                                                        # ir inst 17 fin
  li t2, 83647
  rem t4, t6, t2                                                        # ir inst 18 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 19 fin
  bnez t6, .F.optimalGameStrategyDP._6.if.then.0
  j .F.optimalGameStrategyDP._7.if.else.0                               # ir inst 20 fin
.F.optimalGameStrategyDP._6.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 21 fin
# Phi connections
  j .F.optimalGameStrategyDP._8.if.exit.0                               # ir inst 22 fin
.F.optimalGameStrategyDP._7.if.else.0:
# Phi connections
  mv t6, t4
  j .F.optimalGameStrategyDP._8.if.exit.0                               # ir inst 23 fin
.F.optimalGameStrategyDP._8.if.exit.0:
  mv t4, t5                                                             # ir inst 25 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add t3, t1, t2                                                        # ir inst 26 fin
  li t2, 100
  rem t4, t6, t2                                                        # ir inst 27 fin
  addi s11, t4, 1                                                       # ir inst 28 fin
  sw s11, 0(t3)                                                         # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.optimalGameStrategyDP._4.while.cond.0                            # ir inst 31 fin
.F.optimalGameStrategyDP._9.while.exit.0:
  addi t1, sp, 112
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.optimalGameStrategyDP._10.array.cond.1                           # ir inst 34 fin
.F.optimalGameStrategyDP._10.array.cond.1:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.optimalGameStrategyDP._11.array.body.1
  j .F.optimalGameStrategyDP._12.array.exit.1                           # ir inst 37 fin
.F.optimalGameStrategyDP._11.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.optimalGameStrategyDP._10.array.cond.1                           # ir inst 41 fin
.F.optimalGameStrategyDP._12.array.exit.1:
# Phi connections
  li t6, 0
  j .F.optimalGameStrategyDP._13.while.cond.1                           # ir inst 42 fin
.F.optimalGameStrategyDP._13.while.cond.1:
  slt t5, t6, a0                                                        # ir inst 44 fin
  bnez t5, .F.optimalGameStrategyDP._14.while.body.1
  j .F.optimalGameStrategyDP._15.while.exit.1                           # ir inst 45 fin
.F.optimalGameStrategyDP._14.while.body.1:
  li t2, 20
  mul t5, t6, t2                                                        # ir inst 46 fin
  add t4, t5, t6                                                        # ir inst 47 fin
  mv t5, t4                                                             # ir inst 48 fin
  slli t2, t5, 2
  addi t1, sp, 112
  add t4, t1, t2                                                        # ir inst 49 fin
  mv t5, t6                                                             # ir inst 50 fin
  slli t2, t5, 2
  addi t1, sp, 32
  add t3, t1, t2                                                        # ir inst 51 fin
  lw t5, 0(t3)                                                          # ir inst 52 fin
  sw t5, 0(t4)                                                          # ir inst 53 fin
  addi t5, t6, 1                                                        # ir inst 54 fin
# Phi connections
  mv t6, t5
  j .F.optimalGameStrategyDP._13.while.cond.1                           # ir inst 55 fin
.F.optimalGameStrategyDP._15.while.exit.1:
# Phi connections
  li t6, 2
  j .F.optimalGameStrategyDP._16.while.cond.2                           # ir inst 56 fin
.F.optimalGameStrategyDP._16.while.cond.2:
  slt t0, a0, t6
  xori t5, t0, 1                                                        # ir inst 58 fin
  bnez t5, .F.optimalGameStrategyDP._17.while.body.2
  j .F.optimalGameStrategyDP._24.while.exit.2                           # ir inst 59 fin
.F.optimalGameStrategyDP._17.while.body.2:
# Phi connections
  li t5, 0
  j .F.optimalGameStrategyDP._18.while.cond.3                           # ir inst 60 fin
.F.optimalGameStrategyDP._18.while.cond.3:
  sub t4, a0, t6                                                        # ir inst 62 fin
  slt t0, t4, t5
  xori t3, t0, 1                                                        # ir inst 63 fin
  bnez t3, .F.optimalGameStrategyDP._19.while.body.3
  j .F.optimalGameStrategyDP._23.while.exit.3                           # ir inst 64 fin
.F.optimalGameStrategyDP._19.while.body.3:
  add t4, t5, t6                                                        # ir inst 65 fin
  addi t3, t4, -1                                                       # ir inst 66 fin
  mv t4, t5                                                             # ir inst 67 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 68 fin
  lw t4, 0(s11)                                                         # ir inst 69 fin
  addi s11, t5, 1                                                       # ir inst 70 fin
  li t2, 20
  mul s10, s11, t2                                                      # ir inst 71 fin
  add s11, s10, t3                                                      # ir inst 72 fin
  mv s10, s11                                                           # ir inst 73 fin
  slli t2, s10, 2
  addi t1, sp, 112
  add s11, t1, t2                                                       # ir inst 74 fin
  lw s10, 0(s11)                                                        # ir inst 75 fin
  sub s11, t4, s10                                                      # ir inst 76 fin
  mv t4, t3                                                             # ir inst 77 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add s10, t1, t2                                                       # ir inst 78 fin
  lw t4, 0(s10)                                                         # ir inst 79 fin
  li t2, 20
  mul s10, t5, t2                                                       # ir inst 80 fin
  addi s9, t3, -1                                                       # ir inst 81 fin
  add s8, s10, s9                                                       # ir inst 82 fin
  mv s10, s8                                                            # ir inst 83 fin
  slli t2, s10, 2
  addi t1, sp, 112
  add s9, t1, t2                                                        # ir inst 84 fin
  lw s10, 0(s9)                                                         # ir inst 85 fin
  sub s9, t4, s10                                                       # ir inst 86 fin
  slt t4, s9, s11                                                       # ir inst 87 fin
  bnez t4, .F.optimalGameStrategyDP._20.if.then.1
  j .F.optimalGameStrategyDP._21.if.else.1                              # ir inst 88 fin
.F.optimalGameStrategyDP._20.if.then.1:
  li t2, 20
  mul t4, t5, t2                                                        # ir inst 89 fin
  add s10, t4, t3                                                       # ir inst 90 fin
  mv t4, s10                                                            # ir inst 91 fin
  slli t2, t4, 2
  addi t1, sp, 112
  add s10, t1, t2                                                       # ir inst 92 fin
  sw s11, 0(s10)                                                        # ir inst 93 fin
  j .F.optimalGameStrategyDP._22.if.exit.1                              # ir inst 94 fin
.F.optimalGameStrategyDP._21.if.else.1:
  li t2, 20
  mul t4, t5, t2                                                        # ir inst 95 fin
  add s11, t4, t3                                                       # ir inst 96 fin
  mv t4, s11                                                            # ir inst 97 fin
  slli t2, t4, 2
  addi t1, sp, 112
  add t3, t1, t2                                                        # ir inst 98 fin
  sw s9, 0(t3)                                                          # ir inst 99 fin
  j .F.optimalGameStrategyDP._22.if.exit.1                              # ir inst 100 fin
.F.optimalGameStrategyDP._22.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 101 fin
# Phi connections
  mv t5, t4
  j .F.optimalGameStrategyDP._18.while.cond.3                           # ir inst 102 fin
.F.optimalGameStrategyDP._23.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 103 fin
# Phi connections
  mv t6, t5
  j .F.optimalGameStrategyDP._16.while.cond.2                           # ir inst 104 fin
.F.optimalGameStrategyDP._24.while.exit.2:
  addi t6, a0, -1                                                       # ir inst 105 fin
  mv t5, t6                                                             # ir inst 106 fin
  slli t2, t5, 2
  addi t1, sp, 112
  add t6, t1, t2                                                        # ir inst 107 fin
  lw t5, 0(t6)                                                          # ir inst 108 fin
  mv a0, t5
  j .F.optimalGameStrategyDP.epilogue                                   # ir inst 109 fin
.F.optimalGameStrategyDP.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 1712
  ret

.globl .F.coinGameDP
.F.coinGameDP:
# spill func args num: 0,             range:     3760(sp) -     3760(sp)
# local var size: 3720,               range:       40(sp) -     3760(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3760
  add sp, sp, t0
  sd s7, 0(sp)
  sd s10, 8(sp)
  sd s8, 16(sp)
  sd s9, 24(sp)
  sd s11, 32(sp)
.F.coinGameDP._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.coinGameDP._1.array.cond.0                                       # ir inst 3 fin
.F.coinGameDP._1.array.cond.0:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.coinGameDP._2.array.body.0
  j .F.coinGameDP._3.array.exit.0                                       # ir inst 6 fin
.F.coinGameDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.coinGameDP._1.array.cond.0                                       # ir inst 10 fin
.F.coinGameDP._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 77
  j .F.coinGameDP._4.while.cond.0                                       # ir inst 11 fin
.F.coinGameDP._4.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 14 fin
  bnez t4, .F.coinGameDP._5.while.body.0
  j .F.coinGameDP._9.while.exit.0                                       # ir inst 15 fin
.F.coinGameDP._5.while.body.0:
  li t2, 1664
  mul t4, t6, t2                                                        # ir inst 16 fin
  li t2, 904223
  add t6, t4, t2                                                        # ir inst 17 fin
  li t2, 83647
  rem t4, t6, t2                                                        # ir inst 18 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 19 fin
  bnez t6, .F.coinGameDP._6.if.then.0
  j .F.coinGameDP._7.if.else.0                                          # ir inst 20 fin
.F.coinGameDP._6.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 21 fin
# Phi connections
  j .F.coinGameDP._8.if.exit.0                                          # ir inst 22 fin
.F.coinGameDP._7.if.else.0:
# Phi connections
  mv t6, t4
  j .F.coinGameDP._8.if.exit.0                                          # ir inst 23 fin
.F.coinGameDP._8.if.exit.0:
  mv t4, t5                                                             # ir inst 25 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 26 fin
  li t2, 50
  rem t4, t6, t2                                                        # ir inst 27 fin
  addi s11, t4, 1                                                       # ir inst 28 fin
  sw s11, 0(t3)                                                         # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.coinGameDP._4.while.cond.0                                       # ir inst 31 fin
.F.coinGameDP._9.while.exit.0:
  addi t1, sp, 160
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.coinGameDP._10.array.cond.1                                      # ir inst 34 fin
.F.coinGameDP._10.array.cond.1:
  li t2, 900
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.coinGameDP._11.array.body.1
  j .F.coinGameDP._12.array.exit.1                                      # ir inst 37 fin
.F.coinGameDP._11.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.coinGameDP._10.array.cond.1                                      # ir inst 41 fin
.F.coinGameDP._12.array.exit.1:
# Phi connections
  li t6, 0
  j .F.coinGameDP._13.while.cond.1                                      # ir inst 42 fin
.F.coinGameDP._13.while.cond.1:
  slt t5, t6, a0                                                        # ir inst 44 fin
  bnez t5, .F.coinGameDP._14.while.body.1
  j .F.coinGameDP._21.while.exit.1                                      # ir inst 45 fin
.F.coinGameDP._14.while.body.1:
  li t2, 30
  mul t5, t6, t2                                                        # ir inst 46 fin
  add t4, t5, t6                                                        # ir inst 47 fin
  mv t5, t4                                                             # ir inst 48 fin
  slli t2, t5, 2
  addi t1, sp, 160
  add t4, t1, t2                                                        # ir inst 49 fin
  mv t5, t6                                                             # ir inst 50 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 51 fin
  lw t5, 0(t3)                                                          # ir inst 52 fin
  sw t5, 0(t4)                                                          # ir inst 53 fin
  addi t5, t6, 1                                                        # ir inst 54 fin
  slt t4, t5, a0                                                        # ir inst 55 fin
  bnez t4, .F.coinGameDP._15.if.then.1
  j .F.coinGameDP._19.if.else.1                                         # ir inst 56 fin
.F.coinGameDP._15.if.then.1:
  mv t5, t6                                                             # ir inst 57 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add t4, t1, t2                                                        # ir inst 58 fin
  lw t5, 0(t4)                                                          # ir inst 59 fin
  addi t4, t6, 1                                                        # ir inst 60 fin
  mv t3, t4                                                             # ir inst 61 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add t4, t1, t2                                                        # ir inst 62 fin
  lw t3, 0(t4)                                                          # ir inst 63 fin
  slt t4, t3, t5                                                        # ir inst 64 fin
  bnez t4, .F.coinGameDP._16.if.then.2
  j .F.coinGameDP._17.if.else.2                                         # ir inst 65 fin
.F.coinGameDP._16.if.then.2:
  li t2, 30
  mul t5, t6, t2                                                        # ir inst 66 fin
  addi t4, t6, 1                                                        # ir inst 67 fin
  add t3, t5, t4                                                        # ir inst 68 fin
  mv t5, t3                                                             # ir inst 69 fin
  slli t2, t5, 2
  addi t1, sp, 160
  add t4, t1, t2                                                        # ir inst 70 fin
  mv t5, t6                                                             # ir inst 71 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 72 fin
  lw t5, 0(t3)                                                          # ir inst 73 fin
  sw t5, 0(t4)                                                          # ir inst 74 fin
  j .F.coinGameDP._18.if.exit.2                                         # ir inst 75 fin
.F.coinGameDP._17.if.else.2:
  li t2, 30
  mul t5, t6, t2                                                        # ir inst 76 fin
  addi t4, t6, 1                                                        # ir inst 77 fin
  add t3, t5, t4                                                        # ir inst 78 fin
  mv t5, t3                                                             # ir inst 79 fin
  slli t2, t5, 2
  addi t1, sp, 160
  add t4, t1, t2                                                        # ir inst 80 fin
  addi t5, t6, 1                                                        # ir inst 81 fin
  mv t3, t5                                                             # ir inst 82 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 83 fin
  lw t3, 0(t5)                                                          # ir inst 84 fin
  sw t3, 0(t4)                                                          # ir inst 85 fin
  j .F.coinGameDP._18.if.exit.2                                         # ir inst 86 fin
.F.coinGameDP._18.if.exit.2:
  j .F.coinGameDP._20.if.exit.1                                         # ir inst 87 fin
.F.coinGameDP._19.if.else.1:
  j .F.coinGameDP._20.if.exit.1                                         # ir inst 88 fin
.F.coinGameDP._20.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 89 fin
# Phi connections
  mv t6, t5
  j .F.coinGameDP._13.while.cond.1                                      # ir inst 90 fin
.F.coinGameDP._21.while.exit.1:
# Phi connections
  li t6, 3
  j .F.coinGameDP._22.while.cond.2                                      # ir inst 91 fin
.F.coinGameDP._22.while.cond.2:
  slt t0, a0, t6
  xori t5, t0, 1                                                        # ir inst 93 fin
  bnez t5, .F.coinGameDP._23.while.body.2
  j .F.coinGameDP._36.while.exit.2                                      # ir inst 94 fin
.F.coinGameDP._23.while.body.2:
# Phi connections
  li t5, 0
  j .F.coinGameDP._24.while.cond.3                                      # ir inst 95 fin
.F.coinGameDP._24.while.cond.3:
  sub t4, a0, t6                                                        # ir inst 97 fin
  slt t0, t4, t5
  xori t3, t0, 1                                                        # ir inst 98 fin
  bnez t3, .F.coinGameDP._25.while.body.3
  j .F.coinGameDP._35.while.exit.3                                      # ir inst 99 fin
.F.coinGameDP._25.while.body.3:
  add t4, t5, t6                                                        # ir inst 100 fin
  addi t3, t4, -1                                                       # ir inst 101 fin
  mv t4, t5                                                             # ir inst 102 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 103 fin
  lw t4, 0(s11)                                                         # ir inst 104 fin
  addi s11, t5, 2                                                       # ir inst 105 fin
  li t2, 30
  mul s10, s11, t2                                                      # ir inst 106 fin
  add s11, s10, t3                                                      # ir inst 107 fin
  mv s10, s11                                                           # ir inst 108 fin
  slli t2, s10, 2
  addi t1, sp, 160
  add s11, t1, t2                                                       # ir inst 109 fin
  lw s10, 0(s11)                                                        # ir inst 110 fin
  addi s11, t5, 1                                                       # ir inst 111 fin
  li t2, 30
  mul s9, s11, t2                                                       # ir inst 112 fin
  addi s11, t3, -1                                                      # ir inst 113 fin
  add s8, s9, s11                                                       # ir inst 114 fin
  mv s11, s8                                                            # ir inst 115 fin
  slli t2, s11, 2
  addi t1, sp, 160
  add s9, t1, t2                                                        # ir inst 116 fin
  lw s11, 0(s9)                                                         # ir inst 117 fin
  slt s9, s10, s11                                                      # ir inst 118 fin
  bnez s9, .F.coinGameDP._26.if.then.3
  j .F.coinGameDP._27.if.else.3                                         # ir inst 119 fin
.F.coinGameDP._26.if.then.3:
  addi s11, t5, 2                                                       # ir inst 120 fin
  li t2, 30
  mul s10, s11, t2                                                      # ir inst 121 fin
  add s11, s10, t3                                                      # ir inst 122 fin
  mv s10, s11                                                           # ir inst 123 fin
  slli t2, s10, 2
  addi t1, sp, 160
  add s11, t1, t2                                                       # ir inst 124 fin
  lw s10, 0(s11)                                                        # ir inst 125 fin
# Phi connections
  mv s11, s10
  j .F.coinGameDP._28.if.exit.3                                         # ir inst 126 fin
.F.coinGameDP._27.if.else.3:
  addi s11, t5, 1                                                       # ir inst 127 fin
  li t2, 30
  mul s10, s11, t2                                                      # ir inst 128 fin
  addi s11, t3, -1                                                      # ir inst 129 fin
  add s9, s10, s11                                                      # ir inst 130 fin
  mv s11, s9                                                            # ir inst 131 fin
  slli t2, s11, 2
  addi t1, sp, 160
  add s10, t1, t2                                                       # ir inst 132 fin
  lw s11, 0(s10)                                                        # ir inst 133 fin
# Phi connections
  j .F.coinGameDP._28.if.exit.3                                         # ir inst 134 fin
.F.coinGameDP._28.if.exit.3:
  add s10, t4, s11                                                      # ir inst 136 fin
  mv t4, t3                                                             # ir inst 137 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 138 fin
  lw t4, 0(s11)                                                         # ir inst 139 fin
  li t2, 30
  mul s11, t5, t2                                                       # ir inst 140 fin
  addi s9, t3, -2                                                       # ir inst 141 fin
  add s8, s11, s9                                                       # ir inst 142 fin
  mv s11, s8                                                            # ir inst 143 fin
  slli t2, s11, 2
  addi t1, sp, 160
  add s9, t1, t2                                                        # ir inst 144 fin
  lw s11, 0(s9)                                                         # ir inst 145 fin
  addi s9, t5, 1                                                        # ir inst 146 fin
  li t2, 30
  mul s8, s9, t2                                                        # ir inst 147 fin
  addi s9, t3, -1                                                       # ir inst 148 fin
  add s7, s8, s9                                                        # ir inst 149 fin
  mv s9, s7                                                             # ir inst 150 fin
  slli t2, s9, 2
  addi t1, sp, 160
  add s8, t1, t2                                                        # ir inst 151 fin
  lw s9, 0(s8)                                                          # ir inst 152 fin
  slt s8, s11, s9                                                       # ir inst 153 fin
  bnez s8, .F.coinGameDP._29.if.then.4
  j .F.coinGameDP._30.if.else.4                                         # ir inst 154 fin
.F.coinGameDP._29.if.then.4:
  li t2, 30
  mul s11, t5, t2                                                       # ir inst 155 fin
  addi s9, t3, -2                                                       # ir inst 156 fin
  add s8, s11, s9                                                       # ir inst 157 fin
  mv s11, s8                                                            # ir inst 158 fin
  slli t2, s11, 2
  addi t1, sp, 160
  add s9, t1, t2                                                        # ir inst 159 fin
  lw s11, 0(s9)                                                         # ir inst 160 fin
# Phi connections
  j .F.coinGameDP._31.if.exit.4                                         # ir inst 161 fin
.F.coinGameDP._30.if.else.4:
  addi s11, t5, 1                                                       # ir inst 162 fin
  li t2, 30
  mul s9, s11, t2                                                       # ir inst 163 fin
  addi s11, t3, -1                                                      # ir inst 164 fin
  add s8, s9, s11                                                       # ir inst 165 fin
  mv s11, s8                                                            # ir inst 166 fin
  slli t2, s11, 2
  addi t1, sp, 160
  add s9, t1, t2                                                        # ir inst 167 fin
  lw s11, 0(s9)                                                         # ir inst 168 fin
# Phi connections
  j .F.coinGameDP._31.if.exit.4                                         # ir inst 169 fin
.F.coinGameDP._31.if.exit.4:
  add s9, t4, s11                                                       # ir inst 171 fin
  slt t4, s9, s10                                                       # ir inst 172 fin
  bnez t4, .F.coinGameDP._32.if.then.5
  j .F.coinGameDP._33.if.else.5                                         # ir inst 173 fin
.F.coinGameDP._32.if.then.5:
  li t2, 30
  mul t4, t5, t2                                                        # ir inst 174 fin
  add s11, t4, t3                                                       # ir inst 175 fin
  mv t4, s11                                                            # ir inst 176 fin
  slli t2, t4, 2
  addi t1, sp, 160
  add s11, t1, t2                                                       # ir inst 177 fin
  sw s10, 0(s11)                                                        # ir inst 178 fin
  j .F.coinGameDP._34.if.exit.5                                         # ir inst 179 fin
.F.coinGameDP._33.if.else.5:
  li t2, 30
  mul t4, t5, t2                                                        # ir inst 180 fin
  add s11, t4, t3                                                       # ir inst 181 fin
  mv t4, s11                                                            # ir inst 182 fin
  slli t2, t4, 2
  addi t1, sp, 160
  add t3, t1, t2                                                        # ir inst 183 fin
  sw s9, 0(t3)                                                          # ir inst 184 fin
  j .F.coinGameDP._34.if.exit.5                                         # ir inst 185 fin
.F.coinGameDP._34.if.exit.5:
  addi t4, t5, 1                                                        # ir inst 186 fin
# Phi connections
  mv t5, t4
  j .F.coinGameDP._24.while.cond.3                                      # ir inst 187 fin
.F.coinGameDP._35.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 188 fin
# Phi connections
  mv t6, t5
  j .F.coinGameDP._22.while.cond.2                                      # ir inst 189 fin
.F.coinGameDP._36.while.exit.2:
  addi t6, a0, -1                                                       # ir inst 190 fin
  mv t5, t6                                                             # ir inst 191 fin
  slli t2, t5, 2
  addi t1, sp, 160
  add t6, t1, t2                                                        # ir inst 192 fin
  lw t5, 0(t6)                                                          # ir inst 193 fin
  mv a0, t5
  j .F.coinGameDP.epilogue                                              # ir inst 194 fin
.F.coinGameDP.epilogue:
  ld s7, 0(sp)
  ld s10, 8(sp)
  ld s8, 16(sp)
  ld s9, 24(sp)
  ld s11, 32(sp)
  li t0, 3760
  add sp, sp, t0
  ret

.globl .F.nimGameDP
.F.nimGameDP:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 100,                range:       16(sp) -      116(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.nimGameDP._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.nimGameDP._1.array.cond.0                                        # ir inst 3 fin
.F.nimGameDP._1.array.cond.0:
  li t2, 25
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.nimGameDP._2.array.body.0
  j .F.nimGameDP._3.array.exit.0                                        # ir inst 6 fin
.F.nimGameDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.nimGameDP._1.array.cond.0                                        # ir inst 10 fin
.F.nimGameDP._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 88
  j .F.nimGameDP._4.while.cond.0                                        # ir inst 11 fin
.F.nimGameDP._4.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 14 fin
  bnez t4, .F.nimGameDP._5.while.body.0
  j .F.nimGameDP._9.while.exit.0                                        # ir inst 15 fin
.F.nimGameDP._5.while.body.0:
  li t2, 1664
  mul t4, t6, t2                                                        # ir inst 16 fin
  li t2, 904223
  add t6, t4, t2                                                        # ir inst 17 fin
  li t2, 83647
  rem t4, t6, t2                                                        # ir inst 18 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 19 fin
  bnez t6, .F.nimGameDP._6.if.then.0
  j .F.nimGameDP._7.if.else.0                                           # ir inst 20 fin
.F.nimGameDP._6.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 21 fin
# Phi connections
  j .F.nimGameDP._8.if.exit.0                                           # ir inst 22 fin
.F.nimGameDP._7.if.else.0:
# Phi connections
  mv t6, t4
  j .F.nimGameDP._8.if.exit.0                                           # ir inst 23 fin
.F.nimGameDP._8.if.exit.0:
  mv t4, t5                                                             # ir inst 25 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 26 fin
  li t2, 20
  rem t4, t6, t2                                                        # ir inst 27 fin
  addi s11, t4, 1                                                       # ir inst 28 fin
  sw s11, 0(t3)                                                         # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.nimGameDP._4.while.cond.0                                        # ir inst 31 fin
.F.nimGameDP._9.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.nimGameDP._10.while.cond.1                                       # ir inst 32 fin
.F.nimGameDP._10.while.cond.1:
  slt t4, t6, a0                                                        # ir inst 35 fin
  bnez t4, .F.nimGameDP._11.while.body.1
  j .F.nimGameDP._12.while.exit.1                                       # ir inst 36 fin
.F.nimGameDP._11.while.body.1:
  mv t4, t6                                                             # ir inst 37 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 38 fin
  lw t4, 0(t3)                                                          # ir inst 39 fin
  xor t3, t5, t4                                                        # ir inst 40 fin
  addi t4, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.nimGameDP._10.while.cond.1                                       # ir inst 42 fin
.F.nimGameDP._12.while.exit.1:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.nimGameDP._13.while.cond.2                                       # ir inst 43 fin
.F.nimGameDP._13.while.cond.2:
  slt t3, t4, a0                                                        # ir inst 46 fin
  bnez t3, .F.nimGameDP._14.while.body.2
  j .F.nimGameDP._18.while.exit.2                                       # ir inst 47 fin
.F.nimGameDP._14.while.body.2:
  mv t3, t4                                                             # ir inst 48 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 49 fin
  lw t3, 0(s11)                                                         # ir inst 50 fin
  xor s11, t5, t3                                                       # ir inst 51 fin
  mv t3, t4                                                             # ir inst 52 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s10, t1, t2                                                       # ir inst 53 fin
  lw t3, 0(s10)                                                         # ir inst 54 fin
  slt s10, s11, t3                                                      # ir inst 55 fin
  bnez s10, .F.nimGameDP._15.if.then.1
  j .F.nimGameDP._16.if.else.1                                          # ir inst 56 fin
.F.nimGameDP._15.if.then.1:
  mv t3, t4                                                             # ir inst 57 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s10, t1, t2                                                       # ir inst 58 fin
  lw t3, 0(s10)                                                         # ir inst 59 fin
  sub s10, t3, s11                                                      # ir inst 60 fin
  add t3, t6, s10                                                       # ir inst 61 fin
# Phi connections
  j .F.nimGameDP._17.if.exit.1                                          # ir inst 62 fin
.F.nimGameDP._16.if.else.1:
# Phi connections
  mv t3, t6
  j .F.nimGameDP._17.if.exit.1                                          # ir inst 63 fin
.F.nimGameDP._17.if.exit.1:
  addi s11, t4, 1                                                       # ir inst 65 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.nimGameDP._13.while.cond.2                                       # ir inst 66 fin
.F.nimGameDP._18.while.exit.2:
  mv a0, t6
  j .F.nimGameDP.epilogue                                               # ir inst 67 fin
.F.nimGameDP.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 128
  ret

.globl .F.testAdvancedDPPatterns
.F.testAdvancedDPPatterns:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testAdvancedDPPatterns._0.entry.0:
# Start call preparation
  li a0, 1809
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 12345
  call .F.digitDP
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 15
  call .F.bitmaskDP
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a0, 20
  call .F.treeDP
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 1810
  call printlnInt
# ir inst 8 fin
  j .F.testAdvancedDPPatterns.epilogue                                  # ir inst 9 fin
.F.testAdvancedDPPatterns.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.digitDP
.F.digitDP:
# spill func args num: 0,             range:      928(sp) -      928(sp)
# local var size: 880,                range:       40(sp) -      920(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 2 / 12,        range:       16(sp) -       32(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -928
  sd s10, 16(sp)
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.digitDP._0.entry.0:
  addi t1, sp, 480
  addi t6, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F.digitDP._1.array.cond.0                                          # ir inst 5 fin
.F.digitDP._1.array.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.digitDP._2.array.body.0
  j .F.digitDP._3.array.exit.0                                          # ir inst 8 fin
.F.digitDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.digitDP._1.array.cond.0                                          # ir inst 12 fin
.F.digitDP._3.array.exit.0:
# Phi connections
  li t5, 0
  mv t6, a0
  j .F.digitDP._4.while.cond.0                                          # ir inst 13 fin
.F.digitDP._4.while.cond.0:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 16 fin
  bnez t4, .F.digitDP._5.while.body.0
  j .F.digitDP._6.while.exit.0                                          # ir inst 17 fin
.F.digitDP._5.while.body.0:
  mv t4, t5                                                             # ir inst 18 fin
  slli t2, t4, 2
  addi t1, sp, 480
  add t3, t1, t2                                                        # ir inst 19 fin
  li t2, 10
  rem t4, t6, t2                                                        # ir inst 20 fin
  sw t4, 0(t3)                                                          # ir inst 21 fin
  li t2, 10
  div t4, t6, t2                                                        # ir inst 22 fin
  addi t6, t5, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.digitDP._4.while.cond.0                                          # ir inst 24 fin
.F.digitDP._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.digitDP._7.while.cond.1                                          # ir inst 25 fin
.F.digitDP._7.while.cond.1:
  li t2, 2
  div t4, t5, t2                                                        # ir inst 27 fin
  slt t3, t6, t4                                                        # ir inst 28 fin
  bnez t3, .F.digitDP._8.while.body.1
  j .F.digitDP._9.while.exit.1                                          # ir inst 29 fin
.F.digitDP._8.while.body.1:
  mv t4, t6                                                             # ir inst 30 fin
  slli t2, t4, 2
  addi t1, sp, 480
  add t3, t1, t2                                                        # ir inst 31 fin
  lw t4, 0(t3)                                                          # ir inst 32 fin
  mv t3, t6                                                             # ir inst 33 fin
  slli t2, t3, 2
  addi t1, sp, 480
  add s11, t1, t2                                                       # ir inst 34 fin
  addi t3, t5, -1                                                       # ir inst 35 fin
  sub s10, t3, t6                                                       # ir inst 36 fin
  mv t3, s10                                                            # ir inst 37 fin
  slli t2, t3, 2
  addi t1, sp, 480
  add s10, t1, t2                                                       # ir inst 38 fin
  lw t3, 0(s10)                                                         # ir inst 39 fin
  sw t3, 0(s11)                                                         # ir inst 40 fin
  addi t3, t5, -1                                                       # ir inst 41 fin
  sub s11, t3, t6                                                       # ir inst 42 fin
  mv t3, s11                                                            # ir inst 43 fin
  slli t2, t3, 2
  addi t1, sp, 480
  add s11, t1, t2                                                       # ir inst 44 fin
  sw t4, 0(s11)                                                         # ir inst 45 fin
  addi t4, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t4
  j .F.digitDP._7.while.cond.1                                          # ir inst 47 fin
.F.digitDP._9.while.exit.1:
  addi t1, sp, 520
  addi t6, t1, 0                                                        # ir inst 49 fin
# Phi connections
  li t4, 0
  j .F.digitDP._10.array.cond.1                                         # ir inst 50 fin
.F.digitDP._10.array.cond.1:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 52 fin
  bnez t3, .F.digitDP._11.array.body.1
  j .F.digitDP._12.array.exit.1                                         # ir inst 53 fin
.F.digitDP._11.array.body.1:
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 54 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 55 fin
  addi t3, t4, 1                                                        # ir inst 56 fin
# Phi connections
  mv t4, t3
  j .F.digitDP._10.array.cond.1                                         # ir inst 57 fin
.F.digitDP._12.array.exit.1:
# Start call preparation
  sd t5, 0(sp)
  li a2, 40
  addi t1, sp, 480
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
# ir inst 58 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 400
  addi t1, sp, 520
  mv a1, t1
  addi t1, sp, 80
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
# ir inst 59 fin
# Start call preparation
  sd t5, 0(sp)
  addi t1, sp, 80
  mv a5, t1
  li a4, 1
  li a3, 0
  li a2, 0
  mv a1, t5
  addi t1, sp, 40
  mv a0, t1
  call .F.digitDPRecursive
  mv t6, a0
  ld t5, 0(sp)
# ir inst 60 fin
  mv a0, t6
  j .F.digitDP.epilogue                                                 # ir inst 61 fin
.F.digitDP.epilogue:
  ld ra, 32(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 928
  ret

.globl .F.digitDPRecursive
.F.digitDPRecursive:
# spill func args num: 0,             range:      560(sp) -      560(sp)
# local var size: 440,                range:      120(sp) -      560(sp)
# return addr size: 8,                range:      112(sp) -      120(sp)
# callee save reg num: 8 / 12,        range:       48(sp) -      112(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -560
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd s9, 64(sp)
  sd s8, 72(sp)
  sd s5, 80(sp)
  sd s0, 88(sp)
  sd s7, 96(sp)
  sd s6, 104(sp)
  sd ra, 112(sp)
.F.digitDPRecursive._0.entry.0:
  xor t0, a2, a1
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.digitDPRecursive._1.if.then.0
  j .F.digitDPRecursive._5.if.else.0                                    # ir inst 4 fin
.F.digitDPRecursive._1.if.then.0:
  li t2, 0
  xor t0, a3, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.digitDPRecursive._2.if.then.1
  j .F.digitDPRecursive._3.if.else.1                                    # ir inst 6 fin
.F.digitDPRecursive._2.if.then.1:
  li a0, 1
  j .F.digitDPRecursive.epilogue                                        # ir inst 7 fin
.F.digitDPRecursive._3.if.else.1:
  li a0, 0
  j .F.digitDPRecursive.epilogue                                        # ir inst 8 fin
.F.digitDPRecursive._4.if.exit.1:
# Phi connections
  mv t3, a4
  mv t4, a3
  mv t5, a2
  mv t6, a1
  j .F.digitDPRecursive._6.if.exit.0                                    # ir inst 9 fin
.F.digitDPRecursive._5.if.else.0:
# Phi connections
  mv t3, a4
  mv t4, a3
  mv t5, a2
  mv t6, a1
  j .F.digitDPRecursive._6.if.exit.0                                    # ir inst 10 fin
.F.digitDPRecursive._6.if.exit.0:
  li t2, 10
  mul s11, t5, t2                                                       # ir inst 15 fin
  slli s10, t4, 1                                                       # ir inst 16 fin
  add s9, s11, s10                                                      # ir inst 17 fin
  bnez t3, .F.digitDPRecursive._7.if.then.2
  j .F.digitDPRecursive._8.if.else.2                                    # ir inst 18 fin
.F.digitDPRecursive._7.if.then.2:
# Phi connections
  li s11, 1
  j .F.digitDPRecursive._9.if.exit.2                                    # ir inst 19 fin
.F.digitDPRecursive._8.if.else.2:
# Phi connections
  li s11, 0
  j .F.digitDPRecursive._9.if.exit.2                                    # ir inst 20 fin
.F.digitDPRecursive._9.if.exit.2:
  add s10, s9, s11                                                      # ir inst 22 fin
  li t2, 100
  slt s11, s10, t2                                                      # ir inst 23 fin
  bnez s11, .F.digitDPRecursive._10.lazy.then.0
  j .F.digitDPRecursive._11.lazy.else.0                                 # ir inst 24 fin
.F.digitDPRecursive._10.lazy.then.0:
  mv s11, s10                                                           # ir inst 25 fin
  slli t2, s11, 2
  add s9, a5, t2                                                        # ir inst 26 fin
  lw s11, 0(s9)                                                         # ir inst 27 fin
  li t2, 0
  xor t0, s11, t2
  sltu s9, zero, t0                                                     # ir inst 28 fin
# Phi connections
  mv s11, s9
  j .F.digitDPRecursive._12.lazy.exit.0                                 # ir inst 29 fin
.F.digitDPRecursive._11.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.digitDPRecursive._12.lazy.exit.0                                 # ir inst 30 fin
.F.digitDPRecursive._12.lazy.exit.0:
  bnez s11, .F.digitDPRecursive._13.if.then.3
  j .F.digitDPRecursive._14.if.else.3                                   # ir inst 32 fin
.F.digitDPRecursive._13.if.then.3:
  mv s11, s10                                                           # ir inst 33 fin
  slli t2, s11, 2
  add s9, a5, t2                                                        # ir inst 34 fin
  lw s11, 0(s9)                                                         # ir inst 35 fin
  mv a0, s11
  j .F.digitDPRecursive.epilogue                                        # ir inst 36 fin
.F.digitDPRecursive._14.if.else.3:
  j .F.digitDPRecursive._15.if.exit.3                                   # ir inst 37 fin
.F.digitDPRecursive._15.if.exit.3:
  bnez t3, .F.digitDPRecursive._16.if.then.4
  j .F.digitDPRecursive._17.if.else.4                                   # ir inst 38 fin
.F.digitDPRecursive._16.if.then.4:
  mv s11, t5                                                            # ir inst 39 fin
  slli t2, s11, 2
  add s9, a0, t2                                                        # ir inst 40 fin
  lw s11, 0(s9)                                                         # ir inst 41 fin
# Phi connections
  j .F.digitDPRecursive._18.if.exit.4                                   # ir inst 42 fin
.F.digitDPRecursive._17.if.else.4:
# Phi connections
  li s11, 9
  j .F.digitDPRecursive._18.if.exit.4                                   # ir inst 43 fin
.F.digitDPRecursive._18.if.exit.4:
# Phi connections
  li s8, 0
  li s9, 0
  j .F.digitDPRecursive._19.while.cond.0                                # ir inst 45 fin
.F.digitDPRecursive._19.while.cond.0:
  slt t0, s11, s8
  xori s7, t0, 1                                                        # ir inst 48 fin
  bnez s7, .F.digitDPRecursive._20.while.body.0
  j .F.digitDPRecursive._24.while.exit.0                                # ir inst 49 fin
.F.digitDPRecursive._20.while.body.0:
  add s7, t4, s8                                                        # ir inst 50 fin
  li t2, 3
  rem s6, s7, t2                                                        # ir inst 51 fin
  bnez t3, .F.digitDPRecursive._21.lazy.then.1
  j .F.digitDPRecursive._22.lazy.else.1                                 # ir inst 52 fin
.F.digitDPRecursive._21.lazy.then.1:
  xor t0, s8, s11
  sltiu s7, t0, 1                                                       # ir inst 53 fin
# Phi connections
  j .F.digitDPRecursive._23.lazy.exit.1                                 # ir inst 54 fin
.F.digitDPRecursive._22.lazy.else.1:
# Phi connections
  li s7, 0
  j .F.digitDPRecursive._23.lazy.exit.1                                 # ir inst 55 fin
.F.digitDPRecursive._23.lazy.exit.1:
  addi s5, t5, 1                                                        # ir inst 57 fin
# Start call preparation
  sd a0, 0(sp)
  sd a5, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  li a2, 40
  mv a1, a0
  addi t1, sp, 120
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a5, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 58 fin
# Start call preparation
  sd a0, 0(sp)
  sd a5, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  li a2, 400
  mv a1, a5
  addi t1, sp, 160
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a5, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 59 fin
# Start call preparation
  sd a0, 0(sp)
  sd a5, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  addi t1, sp, 160
  mv a5, t1
  mv a4, s7
  mv a3, s6
  mv a2, s5
  mv a1, t6
  addi t1, sp, 120
  mv a0, t1
  call .F.digitDPRecursive
  mv s0, a0
  ld a0, 0(sp)
  ld a5, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 60 fin
  add s7, s9, s0                                                        # ir inst 61 fin
  addi s6, s8, 1                                                        # ir inst 62 fin
# Phi connections
  mv s8, s6
  mv s9, s7
  j .F.digitDPRecursive._19.while.cond.0                                # ir inst 63 fin
.F.digitDPRecursive._24.while.exit.0:
  li t2, 100
  slt t6, s10, t2                                                       # ir inst 64 fin
  bnez t6, .F.digitDPRecursive._25.if.then.5
  j .F.digitDPRecursive._26.if.else.5                                   # ir inst 65 fin
.F.digitDPRecursive._25.if.then.5:
  mv t6, s10                                                            # ir inst 66 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 67 fin
  sw s9, 0(t5)                                                          # ir inst 68 fin
  j .F.digitDPRecursive._27.if.exit.5                                   # ir inst 69 fin
.F.digitDPRecursive._26.if.else.5:
  j .F.digitDPRecursive._27.if.exit.5                                   # ir inst 70 fin
.F.digitDPRecursive._27.if.exit.5:
  mv a0, s9
  j .F.digitDPRecursive.epilogue                                        # ir inst 71 fin
.F.digitDPRecursive.epilogue:
  ld ra, 112(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  ld s9, 64(sp)
  ld s8, 72(sp)
  ld s5, 80(sp)
  ld s0, 88(sp)
  ld s7, 96(sp)
  ld s6, 104(sp)
  addi sp, sp, 560
  ret

.globl .F.bitmaskDP
.F.bitmaskDP:
# spill func args num: 0,             range:     1872(sp) -     1872(sp)
# local var size: 1800,               range:       64(sp) -     1864(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1872
  sd s9, 32(sp)
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.bitmaskDP._0.entry.0:
  addi t1, sp, 964
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.bitmaskDP._1.array.cond.0                                        # ir inst 4 fin
.F.bitmaskDP._1.array.cond.0:
  li t2, 225
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.bitmaskDP._2.array.body.0
  j .F.bitmaskDP._3.array.exit.0                                        # ir inst 7 fin
.F.bitmaskDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.bitmaskDP._1.array.cond.0                                        # ir inst 11 fin
.F.bitmaskDP._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 99
  j .F.bitmaskDP._4.while.cond.0                                        # ir inst 12 fin
.F.bitmaskDP._4.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 15 fin
  bnez t4, .F.bitmaskDP._5.while.body.0
  j .F.bitmaskDP._15.while.exit.0                                       # ir inst 16 fin
.F.bitmaskDP._5.while.body.0:
# Phi connections
  li t4, 0
  j .F.bitmaskDP._6.while.cond.1                                        # ir inst 17 fin
.F.bitmaskDP._6.while.cond.1:
  slt t3, t4, a0                                                        # ir inst 20 fin
  bnez t3, .F.bitmaskDP._7.while.body.1
  j .F.bitmaskDP._14.while.exit.1                                       # ir inst 21 fin
.F.bitmaskDP._7.while.body.1:
  xor t0, t5, t4
  sltiu t3, t0, 1                                                       # ir inst 22 fin
  bnez t3, .F.bitmaskDP._8.if.then.0
  j .F.bitmaskDP._9.if.else.0                                           # ir inst 23 fin
.F.bitmaskDP._8.if.then.0:
  mul t3, t5, a0                                                        # ir inst 24 fin
  add s11, t3, t4                                                       # ir inst 25 fin
  mv t3, s11                                                            # ir inst 26 fin
  slli t2, t3, 2
  addi t1, sp, 964
  add s11, t1, t2                                                       # ir inst 27 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 28 fin
# Phi connections
  mv t3, t6
  j .F.bitmaskDP._13.if.exit.0                                          # ir inst 29 fin
.F.bitmaskDP._9.if.else.0:
  li t2, 1664
  mul t3, t6, t2                                                        # ir inst 30 fin
  li t2, 904223
  add s11, t3, t2                                                       # ir inst 31 fin
  li t2, 83647
  rem t3, s11, t2                                                       # ir inst 32 fin
  li t2, 0
  slt s11, t3, t2                                                       # ir inst 33 fin
  bnez s11, .F.bitmaskDP._10.if.then.1
  j .F.bitmaskDP._11.if.else.1                                          # ir inst 34 fin
.F.bitmaskDP._10.if.then.1:
  li t1, 0
  sub s11, t1, t3                                                       # ir inst 35 fin
# Phi connections
  mv t3, s11
  j .F.bitmaskDP._12.if.exit.1                                          # ir inst 36 fin
.F.bitmaskDP._11.if.else.1:
# Phi connections
  j .F.bitmaskDP._12.if.exit.1                                          # ir inst 37 fin
.F.bitmaskDP._12.if.exit.1:
  mul s11, t5, a0                                                       # ir inst 39 fin
  add s10, s11, t4                                                      # ir inst 40 fin
  mv s11, s10                                                           # ir inst 41 fin
  slli t2, s11, 2
  addi t1, sp, 964
  add s10, t1, t2                                                       # ir inst 42 fin
  li t2, 100
  rem s11, t3, t2                                                       # ir inst 43 fin
  addi s9, s11, 1                                                       # ir inst 44 fin
  sw s9, 0(s10)                                                         # ir inst 45 fin
# Phi connections
  j .F.bitmaskDP._13.if.exit.0                                          # ir inst 46 fin
.F.bitmaskDP._13.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 48 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.bitmaskDP._6.while.cond.1                                        # ir inst 49 fin
.F.bitmaskDP._14.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j .F.bitmaskDP._4.while.cond.0                                        # ir inst 51 fin
.F.bitmaskDP._15.while.exit.0:
# Phi connections
  li t6, 0
  j .F.bitmaskDP._16.while.cond.2                                       # ir inst 52 fin
.F.bitmaskDP._16.while.cond.2:
  slt t5, t6, a0                                                        # ir inst 54 fin
  bnez t5, .F.bitmaskDP._17.while.body.2
  j .F.bitmaskDP._18.while.exit.2                                       # ir inst 55 fin
.F.bitmaskDP._17.while.body.2:
  addi t5, t6, 1                                                        # ir inst 56 fin
# Phi connections
  mv t6, t5
  j .F.bitmaskDP._16.while.cond.2                                       # ir inst 57 fin
.F.bitmaskDP._18.while.exit.2:
# Phi connections
  li t5, 999999
  li t6, 1
  j .F.bitmaskDP._19.while.cond.3                                       # ir inst 58 fin
.F.bitmaskDP._19.while.cond.3:
  li t2, 32768
  slt t4, t6, t2                                                        # ir inst 61 fin
  bnez t4, .F.bitmaskDP._20.lazy.then.0
  j .F.bitmaskDP._21.lazy.else.0                                        # ir inst 62 fin
.F.bitmaskDP._20.lazy.then.0:
  li t2, 1
  slt t4, t6, t2                                                        # ir inst 63 fin
# Phi connections
  j .F.bitmaskDP._22.lazy.exit.0                                        # ir inst 64 fin
.F.bitmaskDP._21.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.bitmaskDP._22.lazy.exit.0                                        # ir inst 65 fin
.F.bitmaskDP._22.lazy.exit.0:
  bnez t4, .F.bitmaskDP._23.while.body.3
  j .F.bitmaskDP._33.while.exit.3                                       # ir inst 67 fin
.F.bitmaskDP._23.while.body.3:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.countSetBits
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 68 fin
  xor t0, t4, a0
  sltiu t3, t0, 1                                                       # ir inst 69 fin
  bnez t3, .F.bitmaskDP._24.lazy.then.1
  j .F.bitmaskDP._25.lazy.else.1                                        # ir inst 70 fin
.F.bitmaskDP._24.lazy.then.1:
  andi t4, t6, 1                                                        # ir inst 71 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 72 fin
# Phi connections
  mv t4, t3
  j .F.bitmaskDP._26.lazy.exit.1                                        # ir inst 73 fin
.F.bitmaskDP._25.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.bitmaskDP._26.lazy.exit.1                                        # ir inst 74 fin
.F.bitmaskDP._26.lazy.exit.1:
  bnez t4, .F.bitmaskDP._27.if.then.2
  j .F.bitmaskDP._31.if.else.2                                          # ir inst 76 fin
.F.bitmaskDP._27.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 900
  addi t1, sp, 964
  mv a1, t1
  addi t1, sp, 64
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 77 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, a0
  addi t1, sp, 64
  mv a1, t1
  mv a0, t6
  call .F.calculateTourCost
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 78 fin
  slt t3, t4, t5                                                        # ir inst 79 fin
  bnez t3, .F.bitmaskDP._28.if.then.3
  j .F.bitmaskDP._29.if.else.3                                          # ir inst 80 fin
.F.bitmaskDP._28.if.then.3:
# Phi connections
  j .F.bitmaskDP._30.if.exit.3                                          # ir inst 81 fin
.F.bitmaskDP._29.if.else.3:
# Phi connections
  mv t4, t5
  j .F.bitmaskDP._30.if.exit.3                                          # ir inst 82 fin
.F.bitmaskDP._30.if.exit.3:
# Phi connections
  j .F.bitmaskDP._32.if.exit.2                                          # ir inst 84 fin
.F.bitmaskDP._31.if.else.2:
# Phi connections
  mv t4, t5
  j .F.bitmaskDP._32.if.exit.2                                          # ir inst 85 fin
.F.bitmaskDP._32.if.exit.2:
  addi t3, t6, 1                                                        # ir inst 87 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.bitmaskDP._19.while.cond.3                                       # ir inst 88 fin
.F.bitmaskDP._33.while.exit.3:
  mv a0, t5
  j .F.bitmaskDP.epilogue                                               # ir inst 89 fin
.F.bitmaskDP.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 1872
  ret

.globl .F.countSetBits
.F.countSetBits:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.countSetBits._0.entry.0:
# Phi connections
  li t5, 0
  mv t6, a0
  j .F.countSetBits._1.while.cond.0                                     # ir inst 1 fin
.F.countSetBits._1.while.cond.0:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 4 fin
  bnez t4, .F.countSetBits._2.while.body.0
  j .F.countSetBits._3.while.exit.0                                     # ir inst 5 fin
.F.countSetBits._2.while.body.0:
  andi t4, t6, 1                                                        # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  li t2, 2
  div t4, t6, t2                                                        # ir inst 8 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.countSetBits._1.while.cond.0                                     # ir inst 9 fin
.F.countSetBits._3.while.exit.0:
  mv a0, t5
  j .F.countSetBits.epilogue                                            # ir inst 10 fin
.F.countSetBits.epilogue:
  ret

.globl .F.calculateTourCost
.F.calculateTourCost:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.calculateTourCost._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 1
  j .F.calculateTourCost._1.while.cond.0                                # ir inst 1 fin
.F.calculateTourCost._1.while.cond.0:
  slt t3, t6, a2                                                        # ir inst 5 fin
  bnez t3, .F.calculateTourCost._2.while.body.0
  j .F.calculateTourCost._6.while.exit.0                                # ir inst 6 fin
.F.calculateTourCost._2.while.body.0:
  slli t3, t6, 1                                                        # ir inst 7 fin
  and s11, a0, t3                                                       # ir inst 8 fin
  li t2, 0
  xor t0, s11, t2
  sltu t3, zero, t0                                                     # ir inst 9 fin
  bnez t3, .F.calculateTourCost._3.if.then.0
  j .F.calculateTourCost._4.if.else.0                                   # ir inst 10 fin
.F.calculateTourCost._3.if.then.0:
  mul t3, t5, a2                                                        # ir inst 11 fin
  add s11, t3, t6                                                       # ir inst 12 fin
  mv t3, s11                                                            # ir inst 13 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 14 fin
  lw t3, 0(s11)                                                         # ir inst 15 fin
  add s11, t4, t3                                                       # ir inst 16 fin
# Phi connections
  mv t3, t6
  j .F.calculateTourCost._5.if.exit.0                                   # ir inst 17 fin
.F.calculateTourCost._4.if.else.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.calculateTourCost._5.if.exit.0                                   # ir inst 18 fin
.F.calculateTourCost._5.if.exit.0:
  addi s10, t6, 1                                                       # ir inst 21 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.calculateTourCost._1.while.cond.0                                # ir inst 22 fin
.F.calculateTourCost._6.while.exit.0:
  mul t6, t5, a2                                                        # ir inst 23 fin
  mv t5, t6                                                             # ir inst 24 fin
  slli t2, t5, 2
  add t6, a1, t2                                                        # ir inst 25 fin
  lw t5, 0(t6)                                                          # ir inst 26 fin
  add t6, t4, t5                                                        # ir inst 27 fin
  mv a0, t6
  j .F.calculateTourCost.epilogue                                       # ir inst 28 fin
.F.calculateTourCost.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.treeDP
.F.treeDP:
# spill func args num: 0,             range:     3712(sp) -     3712(sp)
# local var size: 3680,               range:       32(sp) -     3712(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3712
  add sp, sp, t0
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.treeDP._0.entry.0:
  addi t1, sp, 1872
  addi t6, t1, 0                                                        # ir inst 6 fin
# Phi connections
  li t5, 0
  j .F.treeDP._1.array.cond.0                                           # ir inst 7 fin
.F.treeDP._1.array.cond.0:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, .F.treeDP._2.array.body.0
  j .F.treeDP._3.array.exit.0                                           # ir inst 10 fin
.F.treeDP._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 11 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j .F.treeDP._1.array.cond.0                                           # ir inst 14 fin
.F.treeDP._3.array.exit.0:
  li t1, 3472
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 16 fin
# Phi connections
  li t5, 0
  j .F.treeDP._4.array.cond.1                                           # ir inst 17 fin
.F.treeDP._4.array.cond.1:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 19 fin
  bnez t4, .F.treeDP._5.array.body.1
  j .F.treeDP._6.array.exit.1                                           # ir inst 20 fin
.F.treeDP._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 22 fin
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.treeDP._4.array.cond.1                                           # ir inst 24 fin
.F.treeDP._6.array.exit.1:
# Phi connections
  li t5, 0
  li t6, 111
  j .F.treeDP._7.while.cond.0                                           # ir inst 25 fin
.F.treeDP._7.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 28 fin
  bnez t4, .F.treeDP._8.while.body.0
  j .F.treeDP._12.while.exit.0                                          # ir inst 29 fin
.F.treeDP._8.while.body.0:
  li t2, 1664
  mul t4, t6, t2                                                        # ir inst 30 fin
  li t2, 904223
  add t6, t4, t2                                                        # ir inst 31 fin
  li t2, 83647
  rem t4, t6, t2                                                        # ir inst 32 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 33 fin
  bnez t6, .F.treeDP._9.if.then.0
  j .F.treeDP._10.if.else.0                                             # ir inst 34 fin
.F.treeDP._9.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 35 fin
# Phi connections
  j .F.treeDP._11.if.exit.0                                             # ir inst 36 fin
.F.treeDP._10.if.else.0:
# Phi connections
  mv t6, t4
  j .F.treeDP._11.if.exit.0                                             # ir inst 37 fin
.F.treeDP._11.if.exit.0:
  mv t4, t5                                                             # ir inst 39 fin
  slli t2, t4, 2
  li t1, 3472
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 40 fin
  li t2, 50
  rem t4, t6, t2                                                        # ir inst 41 fin
  addi s11, t4, 1                                                       # ir inst 42 fin
  sw s11, 0(t3)                                                         # ir inst 43 fin
  addi t4, t5, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  j .F.treeDP._7.while.cond.0                                           # ir inst 45 fin
.F.treeDP._12.while.exit.0:
# Phi connections
  li t6, 1
  j .F.treeDP._13.while.cond.1                                          # ir inst 46 fin
.F.treeDP._13.while.cond.1:
  slt t5, t6, a0                                                        # ir inst 48 fin
  bnez t5, .F.treeDP._14.while.body.1
  j .F.treeDP._15.while.exit.1                                          # ir inst 49 fin
.F.treeDP._14.while.body.1:
  addi t5, t6, -1                                                       # ir inst 50 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 51 fin
  mul t5, t4, a0                                                        # ir inst 52 fin
  add t3, t5, t6                                                        # ir inst 53 fin
  mv t5, t3                                                             # ir inst 54 fin
  slli t2, t5, 2
  addi t1, sp, 1872
  add t3, t1, t2                                                        # ir inst 55 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 56 fin
  mul t5, t6, a0                                                        # ir inst 57 fin
  add t3, t5, t4                                                        # ir inst 58 fin
  mv t5, t3                                                             # ir inst 59 fin
  slli t2, t5, 2
  addi t1, sp, 1872
  add t4, t1, t2                                                        # ir inst 60 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 61 fin
  addi t5, t6, 1                                                        # ir inst 62 fin
# Phi connections
  mv t6, t5
  j .F.treeDP._13.while.cond.1                                          # ir inst 63 fin
.F.treeDP._15.while.exit.1:
  li t1, 3552
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 65 fin
# Phi connections
  li t5, 0
  j .F.treeDP._16.array.cond.2                                          # ir inst 66 fin
.F.treeDP._16.array.cond.2:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 68 fin
  bnez t4, .F.treeDP._17.array.body.2
  j .F.treeDP._18.array.exit.2                                          # ir inst 69 fin
.F.treeDP._17.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 70 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 71 fin
  addi t4, t5, 1                                                        # ir inst 72 fin
# Phi connections
  mv t5, t4
  j .F.treeDP._16.array.cond.2                                          # ir inst 73 fin
.F.treeDP._18.array.exit.2:
  li t1, 3632
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 75 fin
# Phi connections
  li t5, 0
  j .F.treeDP._19.array.cond.3                                          # ir inst 76 fin
.F.treeDP._19.array.cond.3:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 78 fin
  bnez t4, .F.treeDP._20.array.body.3
  j .F.treeDP._21.array.exit.3                                          # ir inst 79 fin
.F.treeDP._20.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 80 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 81 fin
  addi t4, t5, 1                                                        # ir inst 82 fin
# Phi connections
  mv t5, t4
  j .F.treeDP._19.array.cond.3                                          # ir inst 83 fin
.F.treeDP._21.array.exit.3:
# Start call preparation
  sd a0, 0(sp)
  li a2, 1600
  addi t1, sp, 1872
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 84 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 80
  li t1, 3472
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1632
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 85 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 80
  li t1, 3552
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1712
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 86 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 80
  li t1, 3632
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1792
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 87 fin
# Start call preparation
  sd a0, 0(sp)
  addi t1, sp, 1792
  mv a6, t1
  addi t1, sp, 1712
  mv a5, t1
  li a4, -1
  li a3, 0
  mv a2, a0
  addi t1, sp, 1632
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call .F.treeDPRecursive
  mv t6, a0
  ld a0, 0(sp)
# ir inst 88 fin
  mv a0, t6
  j .F.treeDP.epilogue                                                  # ir inst 89 fin
.F.treeDP.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  li t0, 3712
  add sp, sp, t0
  ret

.globl .F.treeDPRecursive
.F.treeDPRecursive:
# spill func args num: 0,             range:     1936(sp) -     1936(sp)
# local var size: 1840,               range:       96(sp) -     1936(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 2 / 12,        range:       72(sp) -       88(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1936
  sd s10, 72(sp)
  sd s11, 80(sp)
  sd ra, 88(sp)
.F.treeDPRecursive._0.entry.0:
  mv t6, a3                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 6 fin
  mv t6, a3                                                             # ir inst 7 fin
  slli t2, t6, 2
  add t4, a1, t2                                                        # ir inst 8 fin
  lw t6, 0(t4)                                                          # ir inst 9 fin
  sw t6, 0(t5)                                                          # ir inst 10 fin
  mv t6, a3                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a6, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 13 fin
# Phi connections
  li t6, 0
  j .F.treeDPRecursive._1.while.cond.0                                  # ir inst 14 fin
.F.treeDPRecursive._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 16 fin
  bnez t5, .F.treeDPRecursive._2.while.body.0
  j .F.treeDPRecursive._12.while.exit.0                                 # ir inst 17 fin
.F.treeDPRecursive._2.while.body.0:
  mul t5, a3, a2                                                        # ir inst 18 fin
  add t4, t5, t6                                                        # ir inst 19 fin
  mv t5, t4                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 21 fin
  lw t5, 0(t4)                                                          # ir inst 22 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 23 fin
  bnez t4, .F.treeDPRecursive._3.lazy.then.0
  j .F.treeDPRecursive._4.lazy.else.0                                   # ir inst 24 fin
.F.treeDPRecursive._3.lazy.then.0:
  xor t0, t6, a4
  sltu t5, zero, t0                                                     # ir inst 25 fin
# Phi connections
  j .F.treeDPRecursive._5.lazy.exit.0                                   # ir inst 26 fin
.F.treeDPRecursive._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.treeDPRecursive._5.lazy.exit.0                                   # ir inst 27 fin
.F.treeDPRecursive._5.lazy.exit.0:
  bnez t5, .F.treeDPRecursive._6.if.then.0
  j .F.treeDPRecursive._10.if.else.0                                    # ir inst 29 fin
.F.treeDPRecursive._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  li a2, 1600
  mv a1, a0
  addi t1, sp, 96
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 30 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  li a2, 80
  addi t1, sp, 1696
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  li a2, 80
  mv a1, a5
  addi t1, sp, 1776
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 32 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  li a2, 80
  mv a1, a6
  addi t1, sp, 1856
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  addi t1, sp, 1856
  mv a6, t1
  addi t1, sp, 1776
  mv a5, t1
  mv a4, a3
  mv a3, t6
  addi t1, sp, 1696
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call .F.treeDPRecursive
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 34 fin
  mv t5, a3                                                             # ir inst 35 fin
  slli t2, t5, 2
  add t4, a5, t2                                                        # ir inst 36 fin
  mv t5, a3                                                             # ir inst 37 fin
  slli t2, t5, 2
  add t3, a5, t2                                                        # ir inst 38 fin
  lw t5, 0(t3)                                                          # ir inst 39 fin
  mv t3, t6                                                             # ir inst 40 fin
  slli t2, t3, 2
  add s11, a6, t2                                                       # ir inst 41 fin
  lw t3, 0(s11)                                                         # ir inst 42 fin
  add s11, t5, t3                                                       # ir inst 43 fin
  sw s11, 0(t4)                                                         # ir inst 44 fin
  mv t5, a3                                                             # ir inst 45 fin
  slli t2, t5, 2
  add t4, a6, t2                                                        # ir inst 46 fin
  mv t5, a3                                                             # ir inst 47 fin
  slli t2, t5, 2
  add t3, a6, t2                                                        # ir inst 48 fin
  lw t5, 0(t3)                                                          # ir inst 49 fin
  mv t3, t6                                                             # ir inst 50 fin
  slli t2, t3, 2
  add s11, a5, t2                                                       # ir inst 51 fin
  lw t3, 0(s11)                                                         # ir inst 52 fin
  mv s11, t6                                                            # ir inst 53 fin
  slli t2, s11, 2
  add s10, a6, t2                                                       # ir inst 54 fin
  lw s11, 0(s10)                                                        # ir inst 55 fin
  slt s10, s11, t3                                                      # ir inst 56 fin
  bnez s10, .F.treeDPRecursive._7.if.then.1
  j .F.treeDPRecursive._8.if.else.1                                     # ir inst 57 fin
.F.treeDPRecursive._7.if.then.1:
  mv t3, t6                                                             # ir inst 58 fin
  slli t2, t3, 2
  add s11, a5, t2                                                       # ir inst 59 fin
  lw t3, 0(s11)                                                         # ir inst 60 fin
# Phi connections
  j .F.treeDPRecursive._9.if.exit.1                                     # ir inst 61 fin
.F.treeDPRecursive._8.if.else.1:
  mv t3, t6                                                             # ir inst 62 fin
  slli t2, t3, 2
  add s11, a6, t2                                                       # ir inst 63 fin
  lw t3, 0(s11)                                                         # ir inst 64 fin
# Phi connections
  j .F.treeDPRecursive._9.if.exit.1                                     # ir inst 65 fin
.F.treeDPRecursive._9.if.exit.1:
  add s11, t5, t3                                                       # ir inst 67 fin
  sw s11, 0(t4)                                                         # ir inst 68 fin
  j .F.treeDPRecursive._11.if.exit.0                                    # ir inst 69 fin
.F.treeDPRecursive._10.if.else.0:
  j .F.treeDPRecursive._11.if.exit.0                                    # ir inst 70 fin
.F.treeDPRecursive._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 71 fin
# Phi connections
  mv t6, t5
  j .F.treeDPRecursive._1.while.cond.0                                  # ir inst 72 fin
.F.treeDPRecursive._12.while.exit.0:
  mv t6, a3                                                             # ir inst 73 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 74 fin
  lw t6, 0(t5)                                                          # ir inst 75 fin
  mv t5, a3                                                             # ir inst 76 fin
  slli t2, t5, 2
  add t4, a6, t2                                                        # ir inst 77 fin
  lw t5, 0(t4)                                                          # ir inst 78 fin
  slt t4, t5, t6                                                        # ir inst 79 fin
  bnez t4, .F.treeDPRecursive._13.if.then.2
  j .F.treeDPRecursive._14.if.else.2                                    # ir inst 80 fin
.F.treeDPRecursive._13.if.then.2:
  mv t6, a3                                                             # ir inst 81 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 82 fin
  lw t6, 0(t5)                                                          # ir inst 83 fin
  mv a0, t6
  j .F.treeDPRecursive.epilogue                                         # ir inst 84 fin
.F.treeDPRecursive._14.if.else.2:
  mv t6, a3                                                             # ir inst 85 fin
  slli t2, t6, 2
  add t5, a6, t2                                                        # ir inst 86 fin
  lw t6, 0(t5)                                                          # ir inst 87 fin
  mv a0, t6
  j .F.treeDPRecursive.epilogue                                         # ir inst 88 fin
.F.treeDPRecursive._15.if.exit.2:
.F.treeDPRecursive.epilogue:
  ld ra, 88(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  addi sp, sp, 1936
  ret
