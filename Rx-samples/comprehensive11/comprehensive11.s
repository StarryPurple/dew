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

.globl .F.pm_rand_update
.F.pm_rand_update:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.pm_rand_update._0.entry.0:
  li t2, 127773
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 127773
  mul t5, t6, t2                                                        # ir inst 2 fin
  sub t4, a0, t5                                                        # ir inst 3 fin
  li t1, 16807
  mul t5, t1, t4                                                        # ir inst 4 fin
  li t1, 2836
  mul t4, t1, t6                                                        # ir inst 5 fin
  sub t6, t5, t4                                                        # ir inst 6 fin
  li t2, 0
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 7 fin
  bnez t5, .F.pm_rand_update._1.if.then.0
  j .F.pm_rand_update._2.if.else.0                                      # ir inst 8 fin
.F.pm_rand_update._1.if.then.0:
  li t2, 2147483647
  add t5, t6, t2                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.pm_rand_update._3.if.exit.0                                      # ir inst 10 fin
.F.pm_rand_update._2.if.else.0:
# Phi connections
  j .F.pm_rand_update._3.if.exit.0                                      # ir inst 11 fin
.F.pm_rand_update._3.if.exit.0:
  mv a0, t6
  j .F.pm_rand_update.epilogue                                          # ir inst 13 fin
.F.pm_rand_update.epilogue:
  ret

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
  li a0, 1100
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testBooleanExpressionOptimization
# ir inst 2 fin
# Start call preparation
  call .F.testBooleanArrayOperations
# ir inst 3 fin
# Start call preparation
  call .F.testLogicalAlgorithms
# ir inst 4 fin
# Start call preparation
  call .F.testBooleanSearchAndFilter
# ir inst 5 fin
# Start call preparation
  call .F.testBooleanStateMachine
# ir inst 6 fin
# Start call preparation
  li a0, 1199
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

.globl .F.testBooleanExpressionOptimization
.F.testBooleanExpressionOptimization:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.testBooleanExpressionOptimization._0.entry.0:
# Start call preparation
  li a0, 1101
  call printlnInt
# ir inst 1 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testBooleanExpressionOptimization._1.while.cond.0                # ir inst 2 fin
.F.testBooleanExpressionOptimization._1.while.cond.0:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F.testBooleanExpressionOptimization._2.while.body.0
  j .F.testBooleanExpressionOptimization._42.while.exit.0               # ir inst 6 fin
.F.testBooleanExpressionOptimization._2.while.body.0:
  li t2, 2
  rem t4, t6, t2                                                        # ir inst 7 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 8 fin
  li t2, 3
  rem t4, t6, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  li t2, 5
  rem t4, t6, t2                                                        # ir inst 11 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s10, t0, 1                                                      # ir inst 12 fin
  li t2, 7
  rem t4, t6, t2                                                        # ir inst 13 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s9, t0, 1                                                       # ir inst 14 fin
  bnez t3, .F.testBooleanExpressionOptimization._3.lazy.then.0
  j .F.testBooleanExpressionOptimization._4.lazy.else.0                 # ir inst 15 fin
.F.testBooleanExpressionOptimization._3.lazy.then.0:
# Phi connections
  mv t4, s11
  j .F.testBooleanExpressionOptimization._5.lazy.exit.0                 # ir inst 16 fin
.F.testBooleanExpressionOptimization._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._5.lazy.exit.0                 # ir inst 17 fin
.F.testBooleanExpressionOptimization._5.lazy.exit.0:
  bnez t4, .F.testBooleanExpressionOptimization._6.lazy.then.1
  j .F.testBooleanExpressionOptimization._7.lazy.else.1                 # ir inst 19 fin
.F.testBooleanExpressionOptimization._6.lazy.then.1:
# Phi connections
  li t4, 1
  j .F.testBooleanExpressionOptimization._11.lazy.exit.1                # ir inst 20 fin
.F.testBooleanExpressionOptimization._7.lazy.else.1:
  bnez s10, .F.testBooleanExpressionOptimization._8.lazy.then.2
  j .F.testBooleanExpressionOptimization._9.lazy.else.2                 # ir inst 21 fin
.F.testBooleanExpressionOptimization._8.lazy.then.2:
  li t2, 0
  xor t0, s9, t2
  sltiu t4, t0, 1                                                       # ir inst 22 fin
# Phi connections
  j .F.testBooleanExpressionOptimization._10.lazy.exit.2                # ir inst 23 fin
.F.testBooleanExpressionOptimization._9.lazy.else.2:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._10.lazy.exit.2                # ir inst 24 fin
.F.testBooleanExpressionOptimization._10.lazy.exit.2:
# Phi connections
  j .F.testBooleanExpressionOptimization._11.lazy.exit.1                # ir inst 26 fin
.F.testBooleanExpressionOptimization._11.lazy.exit.1:
  bnez t4, .F.testBooleanExpressionOptimization._12.lazy.then.3
  j .F.testBooleanExpressionOptimization._13.lazy.else.3                # ir inst 28 fin
.F.testBooleanExpressionOptimization._12.lazy.then.3:
# Phi connections
  li t4, 1
  j .F.testBooleanExpressionOptimization._20.lazy.exit.3                # ir inst 29 fin
.F.testBooleanExpressionOptimization._13.lazy.else.3:
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 30 fin
  bnez t4, .F.testBooleanExpressionOptimization._14.lazy.then.4
  j .F.testBooleanExpressionOptimization._15.lazy.else.4                # ir inst 31 fin
.F.testBooleanExpressionOptimization._14.lazy.then.4:
# Phi connections
  mv t4, s11
  j .F.testBooleanExpressionOptimization._16.lazy.exit.4                # ir inst 32 fin
.F.testBooleanExpressionOptimization._15.lazy.else.4:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._16.lazy.exit.4                # ir inst 33 fin
.F.testBooleanExpressionOptimization._16.lazy.exit.4:
  bnez t4, .F.testBooleanExpressionOptimization._17.lazy.then.5
  j .F.testBooleanExpressionOptimization._18.lazy.else.5                # ir inst 35 fin
.F.testBooleanExpressionOptimization._17.lazy.then.5:
# Phi connections
  mv t4, s10
  j .F.testBooleanExpressionOptimization._19.lazy.exit.5                # ir inst 36 fin
.F.testBooleanExpressionOptimization._18.lazy.else.5:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._19.lazy.exit.5                # ir inst 37 fin
.F.testBooleanExpressionOptimization._19.lazy.exit.5:
# Phi connections
  j .F.testBooleanExpressionOptimization._20.lazy.exit.3                # ir inst 39 fin
.F.testBooleanExpressionOptimization._20.lazy.exit.3:
  bnez t4, .F.testBooleanExpressionOptimization._21.lazy.then.6
  j .F.testBooleanExpressionOptimization._22.lazy.else.6                # ir inst 41 fin
.F.testBooleanExpressionOptimization._21.lazy.then.6:
# Phi connections
  li t4, 1
  j .F.testBooleanExpressionOptimization._32.lazy.exit.6                # ir inst 42 fin
.F.testBooleanExpressionOptimization._22.lazy.else.6:
  bnez t3, .F.testBooleanExpressionOptimization._23.lazy.then.7
  j .F.testBooleanExpressionOptimization._24.lazy.else.7                # ir inst 43 fin
.F.testBooleanExpressionOptimization._23.lazy.then.7:
  li t2, 0
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 44 fin
# Phi connections
  j .F.testBooleanExpressionOptimization._25.lazy.exit.7                # ir inst 45 fin
.F.testBooleanExpressionOptimization._24.lazy.else.7:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._25.lazy.exit.7                # ir inst 46 fin
.F.testBooleanExpressionOptimization._25.lazy.exit.7:
  bnez t4, .F.testBooleanExpressionOptimization._26.lazy.then.8
  j .F.testBooleanExpressionOptimization._27.lazy.else.8                # ir inst 48 fin
.F.testBooleanExpressionOptimization._26.lazy.then.8:
  li t2, 0
  xor t0, s10, t2
  sltiu t4, t0, 1                                                       # ir inst 49 fin
# Phi connections
  j .F.testBooleanExpressionOptimization._28.lazy.exit.8                # ir inst 50 fin
.F.testBooleanExpressionOptimization._27.lazy.else.8:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._28.lazy.exit.8                # ir inst 51 fin
.F.testBooleanExpressionOptimization._28.lazy.exit.8:
  bnez t4, .F.testBooleanExpressionOptimization._29.lazy.then.9
  j .F.testBooleanExpressionOptimization._30.lazy.else.9                # ir inst 53 fin
.F.testBooleanExpressionOptimization._29.lazy.then.9:
# Phi connections
  mv t4, s9
  j .F.testBooleanExpressionOptimization._31.lazy.exit.9                # ir inst 54 fin
.F.testBooleanExpressionOptimization._30.lazy.else.9:
# Phi connections
  li t4, 0
  j .F.testBooleanExpressionOptimization._31.lazy.exit.9                # ir inst 55 fin
.F.testBooleanExpressionOptimization._31.lazy.exit.9:
# Phi connections
  j .F.testBooleanExpressionOptimization._32.lazy.exit.6                # ir inst 57 fin
.F.testBooleanExpressionOptimization._32.lazy.exit.6:
  bnez t4, .F.testBooleanExpressionOptimization._33.if.then.0
  j .F.testBooleanExpressionOptimization._34.if.else.0                  # ir inst 59 fin
.F.testBooleanExpressionOptimization._33.if.then.0:
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  j .F.testBooleanExpressionOptimization._35.if.exit.0                  # ir inst 61 fin
.F.testBooleanExpressionOptimization._34.if.else.0:
# Phi connections
  mv t4, t5
  j .F.testBooleanExpressionOptimization._35.if.exit.0                  # ir inst 62 fin
.F.testBooleanExpressionOptimization._35.if.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.evaluateComplexCondition
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 64 fin
  bnez t3, .F.testBooleanExpressionOptimization._36.lazy.then.10
  j .F.testBooleanExpressionOptimization._37.lazy.else.10               # ir inst 65 fin
.F.testBooleanExpressionOptimization._36.lazy.then.10:
  li t2, 100
  rem t3, t6, t2                                                        # ir inst 66 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 67 fin
# Phi connections
  mv t3, s11
  j .F.testBooleanExpressionOptimization._38.lazy.exit.10               # ir inst 68 fin
.F.testBooleanExpressionOptimization._37.lazy.else.10:
# Phi connections
  li t3, 0
  j .F.testBooleanExpressionOptimization._38.lazy.exit.10               # ir inst 69 fin
.F.testBooleanExpressionOptimization._38.lazy.exit.10:
  bnez t3, .F.testBooleanExpressionOptimization._39.if.then.1
  j .F.testBooleanExpressionOptimization._40.if.else.1                  # ir inst 71 fin
.F.testBooleanExpressionOptimization._39.if.then.1:
  addi t3, t4, 2                                                        # ir inst 72 fin
# Phi connections
  mv t4, t3
  j .F.testBooleanExpressionOptimization._41.if.exit.1                  # ir inst 73 fin
.F.testBooleanExpressionOptimization._40.if.else.1:
# Phi connections
  j .F.testBooleanExpressionOptimization._41.if.exit.1                  # ir inst 74 fin
.F.testBooleanExpressionOptimization._41.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 76 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testBooleanExpressionOptimization._1.while.cond.0                # ir inst 77 fin
.F.testBooleanExpressionOptimization._42.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 78 fin
# Start call preparation
  li a0, 1102
  call printlnInt
# ir inst 79 fin
  j .F.testBooleanExpressionOptimization.epilogue                       # ir inst 80 fin
.F.testBooleanExpressionOptimization.epilogue:
  ld ra, 56(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.evaluateComplexCondition
.F.evaluateComplexCondition:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.evaluateComplexCondition._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  call .F.isPrime
  mv t6, a0
  ld a0, 0(sp)
# ir inst 1 fin
  li t2, 4
  rem t5, a0, t2                                                        # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 3 fin
  li t2, 100
  slt t5, t2, a0                                                        # ir inst 4 fin
  bnez t5, .F.evaluateComplexCondition._1.lazy.then.0
  j .F.evaluateComplexCondition._2.lazy.else.0                          # ir inst 5 fin
.F.evaluateComplexCondition._1.lazy.then.0:
  li t2, 9900
  slt t5, a0, t2                                                        # ir inst 6 fin
# Phi connections
  j .F.evaluateComplexCondition._3.lazy.exit.0                          # ir inst 7 fin
.F.evaluateComplexCondition._2.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.evaluateComplexCondition._3.lazy.exit.0                          # ir inst 8 fin
.F.evaluateComplexCondition._3.lazy.exit.0:
  bnez t6, .F.evaluateComplexCondition._4.lazy.then.1
  j .F.evaluateComplexCondition._5.lazy.else.1                          # ir inst 10 fin
.F.evaluateComplexCondition._4.lazy.then.1:
# Phi connections
  li t6, 1
  j .F.evaluateComplexCondition._6.lazy.exit.1                          # ir inst 11 fin
.F.evaluateComplexCondition._5.lazy.else.1:
# Phi connections
  mv t6, t4
  j .F.evaluateComplexCondition._6.lazy.exit.1                          # ir inst 12 fin
.F.evaluateComplexCondition._6.lazy.exit.1:
  bnez t6, .F.evaluateComplexCondition._7.lazy.then.2
  j .F.evaluateComplexCondition._8.lazy.else.2                          # ir inst 14 fin
.F.evaluateComplexCondition._7.lazy.then.2:
# Phi connections
  mv t6, t5
  j .F.evaluateComplexCondition._9.lazy.exit.2                          # ir inst 15 fin
.F.evaluateComplexCondition._8.lazy.else.2:
# Phi connections
  li t6, 0
  j .F.evaluateComplexCondition._9.lazy.exit.2                          # ir inst 16 fin
.F.evaluateComplexCondition._9.lazy.exit.2:
  mv a0, t6
  j .F.evaluateComplexCondition.epilogue                                # ir inst 18 fin
.F.evaluateComplexCondition.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testBooleanArrayOperations
.F.testBooleanArrayOperations:
# spill func args num: 0,             range:    30048(sp) -    30048(sp)
# local var size: 30004,              range:       32(sp) -    30036(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -30048
  add sp, sp, t0
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.testBooleanArrayOperations._0.entry.0:
# Start call preparation
  li a0, 1103
  call printlnInt
# ir inst 3 fin
  li t1, 20032
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t5, 0
  j .F.testBooleanArrayOperations._1.array.cond.0                       # ir inst 6 fin
.F.testBooleanArrayOperations._1.array.cond.0:
  li t2, 10000
  slt t4, t5, t2                                                        # ir inst 8 fin
  bnez t4, .F.testBooleanArrayOperations._2.array.body.0
  j .F.testBooleanArrayOperations._3.array.exit.0                       # ir inst 9 fin
.F.testBooleanArrayOperations._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 10 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 11 fin
  addi t4, t5, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  j .F.testBooleanArrayOperations._1.array.cond.0                       # ir inst 13 fin
.F.testBooleanArrayOperations._3.array.exit.0:
# alloca %8
  li t2, 30032
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 15 fin
# Phi connections
  li t6, 0
  j .F.testBooleanArrayOperations._4.while.cond.0                       # ir inst 16 fin
.F.testBooleanArrayOperations._4.while.cond.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 18 fin
  bnez t5, .F.testBooleanArrayOperations._5.while.body.0
  j .F.testBooleanArrayOperations._12.while.exit.0                      # ir inst 19 fin
.F.testBooleanArrayOperations._5.while.body.0:
# Phi connections
  li t5, 0
  j .F.testBooleanArrayOperations._6.while.cond.1                       # ir inst 20 fin
.F.testBooleanArrayOperations._6.while.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 22 fin
  bnez t4, .F.testBooleanArrayOperations._7.while.body.1
  j .F.testBooleanArrayOperations._11.while.exit.1                      # ir inst 23 fin
.F.testBooleanArrayOperations._7.while.body.1:
  li t2, 100
  mul t4, t6, t2                                                        # ir inst 24 fin
  add t3, t4, t5                                                        # ir inst 25 fin
  mv t4, t3                                                             # ir inst 26 fin
  li t1, 20032
  add t1, sp, t1
  add t3, t1, t4                                                        # ir inst 27 fin
  add t4, t6, t5                                                        # ir inst 28 fin
  li t2, 2
  rem s11, t4, t2                                                       # ir inst 29 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 30 fin
  bnez t4, .F.testBooleanArrayOperations._8.lazy.then.0
  j .F.testBooleanArrayOperations._9.lazy.else.0                        # ir inst 31 fin
.F.testBooleanArrayOperations._8.lazy.then.0:
  li t2, 3
  rem t4, t6, t2                                                        # ir inst 32 fin
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 33 fin
# Phi connections
  mv t4, s11
  j .F.testBooleanArrayOperations._10.lazy.exit.0                       # ir inst 34 fin
.F.testBooleanArrayOperations._9.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.testBooleanArrayOperations._10.lazy.exit.0                       # ir inst 35 fin
.F.testBooleanArrayOperations._10.lazy.exit.0:
  sb t4, 0(t3)                                                          # ir inst 37 fin
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t4
  j .F.testBooleanArrayOperations._6.while.cond.1                       # ir inst 39 fin
.F.testBooleanArrayOperations._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t6, t5
  j .F.testBooleanArrayOperations._4.while.cond.0                       # ir inst 41 fin
.F.testBooleanArrayOperations._12.while.exit.0:
# Start call preparation
  li a2, 10000
  li t1, 20032
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call memcpy
# ir inst 42 fin
# Start call preparation
  li t1, 30032
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call .F.performBooleanGridOperations
# ir inst 43 fin
  li t1, 30032
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 44 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 10000
  li t1, 20032
  add t1, sp, t1
  mv a1, t1
  li t1, 10032
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 45 fin
# Start call preparation
  sd t6, 0(sp)
  li t1, 10032
  add t1, sp, t1
  mv a0, t1
  call .F.countBooleanPatterns
  mv t5, a0
  ld t6, 0(sp)
# ir inst 46 fin
  add t4, t6, t5                                                        # ir inst 47 fin
# alloca %8
  li t2, 30032
  add t2, sp, t2
  sw t4, 0(t2)                                                          # ir inst 48 fin
  li t1, 30032
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 49 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 50 fin
# Start call preparation
  li a0, 1104
  call printlnInt
# ir inst 51 fin
  j .F.testBooleanArrayOperations.epilogue                              # ir inst 52 fin
.F.testBooleanArrayOperations.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  li t0, 30048
  add sp, sp, t0
  ret

.globl .F.performBooleanGridOperations
.F.performBooleanGridOperations:
# spill func args num: 0,             range:    10096(sp) -    10096(sp)
# local var size: 10000,              range:       88(sp) -    10088(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 4 / 12,        range:       48(sp) -       80(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10096
  add sp, sp, t0
  sd s8, 48(sp)
  sd s9, 56(sp)
  sd s11, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
.F.performBooleanGridOperations._0.entry.0:
# Phi connections
  li t5, 1
  li t6, 0
  j .F.performBooleanGridOperations._1.while.cond.0                     # ir inst 2 fin
.F.performBooleanGridOperations._1.while.cond.0:
  li t2, 99
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performBooleanGridOperations._2.while.body.0
  j .F.performBooleanGridOperations._21.while.exit.0                    # ir inst 6 fin
.F.performBooleanGridOperations._2.while.body.0:
# Phi connections
  li t3, 1
  mv t4, t6
  j .F.performBooleanGridOperations._3.while.cond.1                     # ir inst 7 fin
.F.performBooleanGridOperations._3.while.cond.1:
  li t2, 99
  slt s11, t3, t2                                                       # ir inst 10 fin
  bnez s11, .F.performBooleanGridOperations._4.while.body.1
  j .F.performBooleanGridOperations._20.while.exit.1                    # ir inst 11 fin
.F.performBooleanGridOperations._4.while.body.1:
  li t2, 100
  mul s11, t5, t2                                                       # ir inst 12 fin
  add s10, s11, t3                                                      # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  li a2, 10000
  mv a1, a0
  addi t1, sp, 88
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t3
  mv a1, t5
  addi t1, sp, 88
  mv a0, t1
  call .F.countBooleanNeighbors
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 15 fin
  mv s9, s10                                                            # ir inst 16 fin
  add s8, a0, s9                                                        # ir inst 17 fin
  lb s9, 0(s8)                                                          # ir inst 18 fin
  bnez s9, .F.performBooleanGridOperations._5.lazy.then.0
  j .F.performBooleanGridOperations._9.lazy.else.0                      # ir inst 19 fin
.F.performBooleanGridOperations._5.lazy.then.0:
  li t2, 2
  slt s9, s11, t2                                                       # ir inst 20 fin
  bnez s9, .F.performBooleanGridOperations._6.lazy.then.1
  j .F.performBooleanGridOperations._7.lazy.else.1                      # ir inst 21 fin
.F.performBooleanGridOperations._6.lazy.then.1:
# Phi connections
  li s9, 1
  j .F.performBooleanGridOperations._8.lazy.exit.1                      # ir inst 22 fin
.F.performBooleanGridOperations._7.lazy.else.1:
  li t2, 3
  slt s9, t2, s11                                                       # ir inst 23 fin
# Phi connections
  j .F.performBooleanGridOperations._8.lazy.exit.1                      # ir inst 24 fin
.F.performBooleanGridOperations._8.lazy.exit.1:
# Phi connections
  j .F.performBooleanGridOperations._10.lazy.exit.0                     # ir inst 26 fin
.F.performBooleanGridOperations._9.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.performBooleanGridOperations._10.lazy.exit.0                     # ir inst 27 fin
.F.performBooleanGridOperations._10.lazy.exit.0:
  bnez s9, .F.performBooleanGridOperations._11.if.then.0
  j .F.performBooleanGridOperations._12.if.else.0                       # ir inst 29 fin
.F.performBooleanGridOperations._11.if.then.0:
  mv s9, s10                                                            # ir inst 30 fin
  add s8, a0, s9                                                        # ir inst 31 fin
  li t1, 0
  sb t1, 0(s8)                                                          # ir inst 32 fin
  addi s9, t4, 1                                                        # ir inst 33 fin
# Phi connections
  mv s11, s9
  j .F.performBooleanGridOperations._19.if.exit.0                       # ir inst 34 fin
.F.performBooleanGridOperations._12.if.else.0:
  mv s9, s10                                                            # ir inst 35 fin
  add s8, a0, s9                                                        # ir inst 36 fin
  lb s9, 0(s8)                                                          # ir inst 37 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 38 fin
  bnez s8, .F.performBooleanGridOperations._13.lazy.then.2
  j .F.performBooleanGridOperations._14.lazy.else.2                     # ir inst 39 fin
.F.performBooleanGridOperations._13.lazy.then.2:
  li t2, 3
  xor t0, s11, t2
  sltiu s9, t0, 1                                                       # ir inst 40 fin
# Phi connections
  mv s11, s9
  j .F.performBooleanGridOperations._15.lazy.exit.2                     # ir inst 41 fin
.F.performBooleanGridOperations._14.lazy.else.2:
# Phi connections
  li s11, 0
  j .F.performBooleanGridOperations._15.lazy.exit.2                     # ir inst 42 fin
.F.performBooleanGridOperations._15.lazy.exit.2:
  bnez s11, .F.performBooleanGridOperations._16.if.then.1
  j .F.performBooleanGridOperations._17.if.else.1                       # ir inst 44 fin
.F.performBooleanGridOperations._16.if.then.1:
  mv s11, s10                                                           # ir inst 45 fin
  add s10, a0, s11                                                      # ir inst 46 fin
  li t1, 1
  sb t1, 0(s10)                                                         # ir inst 47 fin
  addi s11, t4, 1                                                       # ir inst 48 fin
# Phi connections
  j .F.performBooleanGridOperations._18.if.exit.1                       # ir inst 49 fin
.F.performBooleanGridOperations._17.if.else.1:
# Phi connections
  mv s11, t4
  j .F.performBooleanGridOperations._18.if.exit.1                       # ir inst 50 fin
.F.performBooleanGridOperations._18.if.exit.1:
# Phi connections
  j .F.performBooleanGridOperations._19.if.exit.0                       # ir inst 52 fin
.F.performBooleanGridOperations._19.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 54 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.performBooleanGridOperations._3.while.cond.1                     # ir inst 55 fin
.F.performBooleanGridOperations._20.while.exit.1:
  addi t3, t5, 1                                                        # ir inst 56 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performBooleanGridOperations._1.while.cond.0                     # ir inst 57 fin
.F.performBooleanGridOperations._21.while.exit.0:
  lw t5, 0(a1)                                                          # ir inst 58 fin
  add t4, t5, t6                                                        # ir inst 59 fin
  sw t4, 0(a1)                                                          # ir inst 60 fin
  j .F.performBooleanGridOperations.epilogue                            # ir inst 61 fin
.F.performBooleanGridOperations.epilogue:
  ld ra, 80(sp)
  ld s8, 48(sp)
  ld s9, 56(sp)
  ld s11, 64(sp)
  ld s10, 72(sp)
  li t0, 10096
  add sp, sp, t0
  ret

.globl .F.countBooleanNeighbors
.F.countBooleanNeighbors:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s11, 8(sp)
  sd s10, 16(sp)
.F.countBooleanNeighbors._0.entry.0:
# Phi connections
  li t5, 0
  li t6, -1
  j .F.countBooleanNeighbors._1.while.cond.0                            # ir inst 1 fin
.F.countBooleanNeighbors._1.while.cond.0:
  li t2, 1
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.countBooleanNeighbors._2.while.body.0
  j .F.countBooleanNeighbors._27.while.exit.0                           # ir inst 5 fin
.F.countBooleanNeighbors._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, -1
  j .F.countBooleanNeighbors._3.while.cond.1                            # ir inst 6 fin
.F.countBooleanNeighbors._3.while.cond.1:
  li t2, 1
  slt t0, t2, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.countBooleanNeighbors._4.while.body.1
  j .F.countBooleanNeighbors._26.while.exit.1                           # ir inst 10 fin
.F.countBooleanNeighbors._4.while.body.1:
  li t2, 0
  xor t0, t6, t2
  sltu s11, zero, t0                                                    # ir inst 11 fin
  bnez s11, .F.countBooleanNeighbors._5.lazy.then.0
  j .F.countBooleanNeighbors._6.lazy.else.0                             # ir inst 12 fin
.F.countBooleanNeighbors._5.lazy.then.0:
# Phi connections
  li s11, 1
  j .F.countBooleanNeighbors._7.lazy.exit.0                             # ir inst 13 fin
.F.countBooleanNeighbors._6.lazy.else.0:
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 14 fin
# Phi connections
  j .F.countBooleanNeighbors._7.lazy.exit.0                             # ir inst 15 fin
.F.countBooleanNeighbors._7.lazy.exit.0:
  bnez s11, .F.countBooleanNeighbors._8.if.then.0
  j .F.countBooleanNeighbors._24.if.else.0                              # ir inst 17 fin
.F.countBooleanNeighbors._8.if.then.0:
  add s11, a1, t6                                                       # ir inst 18 fin
  add s10, a2, t4                                                       # ir inst 19 fin
  li t2, 0
  slt t0, s11, t2
  xori s9, t0, 1                                                        # ir inst 20 fin
  bnez s9, .F.countBooleanNeighbors._9.lazy.then.1
  j .F.countBooleanNeighbors._10.lazy.else.1                            # ir inst 21 fin
.F.countBooleanNeighbors._9.lazy.then.1:
  li t2, 100
  slt s9, s11, t2                                                       # ir inst 22 fin
# Phi connections
  j .F.countBooleanNeighbors._11.lazy.exit.1                            # ir inst 23 fin
.F.countBooleanNeighbors._10.lazy.else.1:
# Phi connections
  li s9, 0
  j .F.countBooleanNeighbors._11.lazy.exit.1                            # ir inst 24 fin
.F.countBooleanNeighbors._11.lazy.exit.1:
  bnez s9, .F.countBooleanNeighbors._12.lazy.then.2
  j .F.countBooleanNeighbors._13.lazy.else.2                            # ir inst 26 fin
.F.countBooleanNeighbors._12.lazy.then.2:
  li t2, 0
  slt t0, s10, t2
  xori s9, t0, 1                                                        # ir inst 27 fin
# Phi connections
  j .F.countBooleanNeighbors._14.lazy.exit.2                            # ir inst 28 fin
.F.countBooleanNeighbors._13.lazy.else.2:
# Phi connections
  li s9, 0
  j .F.countBooleanNeighbors._14.lazy.exit.2                            # ir inst 29 fin
.F.countBooleanNeighbors._14.lazy.exit.2:
  bnez s9, .F.countBooleanNeighbors._15.lazy.then.3
  j .F.countBooleanNeighbors._16.lazy.else.3                            # ir inst 31 fin
.F.countBooleanNeighbors._15.lazy.then.3:
  li t2, 100
  slt s9, s10, t2                                                       # ir inst 32 fin
# Phi connections
  j .F.countBooleanNeighbors._17.lazy.exit.3                            # ir inst 33 fin
.F.countBooleanNeighbors._16.lazy.else.3:
# Phi connections
  li s9, 0
  j .F.countBooleanNeighbors._17.lazy.exit.3                            # ir inst 34 fin
.F.countBooleanNeighbors._17.lazy.exit.3:
  bnez s9, .F.countBooleanNeighbors._18.if.then.1
  j .F.countBooleanNeighbors._22.if.else.1                              # ir inst 36 fin
.F.countBooleanNeighbors._18.if.then.1:
  li t2, 100
  mul s9, s11, t2                                                       # ir inst 37 fin
  add s11, s9, s10                                                      # ir inst 38 fin
  mv s10, s11                                                           # ir inst 39 fin
  add s11, a0, s10                                                      # ir inst 40 fin
  lb s10, 0(s11)                                                        # ir inst 41 fin
  bnez s10, .F.countBooleanNeighbors._19.if.then.2
  j .F.countBooleanNeighbors._20.if.else.2                              # ir inst 42 fin
.F.countBooleanNeighbors._19.if.then.2:
  addi s11, t3, 1                                                       # ir inst 43 fin
# Phi connections
  j .F.countBooleanNeighbors._21.if.exit.2                              # ir inst 44 fin
.F.countBooleanNeighbors._20.if.else.2:
# Phi connections
  mv s11, t3
  j .F.countBooleanNeighbors._21.if.exit.2                              # ir inst 45 fin
.F.countBooleanNeighbors._21.if.exit.2:
# Phi connections
  j .F.countBooleanNeighbors._23.if.exit.1                              # ir inst 47 fin
.F.countBooleanNeighbors._22.if.else.1:
# Phi connections
  mv s11, t3
  j .F.countBooleanNeighbors._23.if.exit.1                              # ir inst 48 fin
.F.countBooleanNeighbors._23.if.exit.1:
# Phi connections
  j .F.countBooleanNeighbors._25.if.exit.0                              # ir inst 50 fin
.F.countBooleanNeighbors._24.if.else.0:
# Phi connections
  mv s11, t3
  j .F.countBooleanNeighbors._25.if.exit.0                              # ir inst 51 fin
.F.countBooleanNeighbors._25.if.exit.0:
  addi s10, t4, 1                                                       # ir inst 53 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.countBooleanNeighbors._3.while.cond.1                            # ir inst 54 fin
.F.countBooleanNeighbors._26.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.countBooleanNeighbors._1.while.cond.0                            # ir inst 56 fin
.F.countBooleanNeighbors._27.while.exit.0:
  mv a0, t5
  j .F.countBooleanNeighbors.epilogue                                   # ir inst 57 fin
.F.countBooleanNeighbors.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.countBooleanPatterns
.F.countBooleanPatterns:
# spill func args num: 0,             range:    20064(sp) -    20064(sp)
# local var size: 20000,              range:       64(sp) -    20064(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -20064
  add sp, sp, t0
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.countBooleanPatterns._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.countBooleanPatterns._1.while.cond.0                             # ir inst 3 fin
.F.countBooleanPatterns._1.while.cond.0:
  li t2, 98
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F.countBooleanPatterns._2.while.body.0
  j .F.countBooleanPatterns._12.while.exit.0                            # ir inst 7 fin
.F.countBooleanPatterns._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.countBooleanPatterns._3.while.cond.1                             # ir inst 8 fin
.F.countBooleanPatterns._3.while.cond.1:
  li t2, 98
  slt s11, t4, t2                                                       # ir inst 11 fin
  bnez s11, .F.countBooleanPatterns._4.while.body.1
  j .F.countBooleanPatterns._11.while.exit.1                            # ir inst 12 fin
.F.countBooleanPatterns._4.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 10000
  mv a1, a0
  addi t1, sp, 64
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t4
  mv a1, t6
  addi t1, sp, 64
  mv a0, t1
  call .F.checkBooleanPattern2x2
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 14 fin
  bnez s11, .F.countBooleanPatterns._5.if.then.0
  j .F.countBooleanPatterns._6.if.else.0                                # ir inst 15 fin
.F.countBooleanPatterns._5.if.then.0:
  addi s11, t3, 1                                                       # ir inst 16 fin
# Phi connections
  j .F.countBooleanPatterns._7.if.exit.0                                # ir inst 17 fin
.F.countBooleanPatterns._6.if.else.0:
# Phi connections
  mv s11, t3
  j .F.countBooleanPatterns._7.if.exit.0                                # ir inst 18 fin
.F.countBooleanPatterns._7.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 10000
  mv a1, a0
  li t1, 10064
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t4
  mv a1, t6
  li t1, 10064
  add t1, sp, t1
  mv a0, t1
  call .F.checkBooleanPattern3x3
  mv s10, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 21 fin
  bnez s10, .F.countBooleanPatterns._8.if.then.1
  j .F.countBooleanPatterns._9.if.else.1                                # ir inst 22 fin
.F.countBooleanPatterns._8.if.then.1:
  addi s10, s11, 2                                                      # ir inst 23 fin
# Phi connections
  mv s11, s10
  j .F.countBooleanPatterns._10.if.exit.1                               # ir inst 24 fin
.F.countBooleanPatterns._9.if.else.1:
# Phi connections
  j .F.countBooleanPatterns._10.if.exit.1                               # ir inst 25 fin
.F.countBooleanPatterns._10.if.exit.1:
  addi s10, t4, 1                                                       # ir inst 27 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.countBooleanPatterns._3.while.cond.1                             # ir inst 28 fin
.F.countBooleanPatterns._11.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.countBooleanPatterns._1.while.cond.0                             # ir inst 30 fin
.F.countBooleanPatterns._12.while.exit.0:
  mv a0, t5
  j .F.countBooleanPatterns.epilogue                                    # ir inst 31 fin
.F.countBooleanPatterns.epilogue:
  ld ra, 56(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  li t0, 20064
  add sp, sp, t0
  ret

.globl .F.checkBooleanPattern2x2
.F.checkBooleanPattern2x2:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.checkBooleanPattern2x2._0.entry.0:
  li t2, 100
  mul t6, a1, t2                                                        # ir inst 1 fin
  add t5, t6, a2                                                        # ir inst 2 fin
  mv t6, t5                                                             # ir inst 3 fin
  add t5, a0, t6                                                        # ir inst 4 fin
  lb t6, 0(t5)                                                          # ir inst 5 fin
  li t2, 100
  mul t5, a1, t2                                                        # ir inst 6 fin
  add t4, t5, a2                                                        # ir inst 7 fin
  addi t5, t4, 1                                                        # ir inst 8 fin
  mv t4, t5                                                             # ir inst 9 fin
  add t5, a0, t4                                                        # ir inst 10 fin
  lb t4, 0(t5)                                                          # ir inst 11 fin
  addi t5, a1, 1                                                        # ir inst 12 fin
  li t2, 100
  mul t3, t5, t2                                                        # ir inst 13 fin
  add t5, t3, a2                                                        # ir inst 14 fin
  mv t3, t5                                                             # ir inst 15 fin
  add t5, a0, t3                                                        # ir inst 16 fin
  lb t3, 0(t5)                                                          # ir inst 17 fin
  addi t5, a1, 1                                                        # ir inst 18 fin
  li t2, 100
  mul s11, t5, t2                                                       # ir inst 19 fin
  add t5, s11, a2                                                       # ir inst 20 fin
  addi s11, t5, 1                                                       # ir inst 21 fin
  mv t5, s11                                                            # ir inst 22 fin
  add s11, a0, t5                                                       # ir inst 23 fin
  lb t5, 0(s11)                                                         # ir inst 24 fin
  bnez t6, .F.checkBooleanPattern2x2._1.lazy.then.0
  j .F.checkBooleanPattern2x2._2.lazy.else.0                            # ir inst 25 fin
.F.checkBooleanPattern2x2._1.lazy.then.0:
  li t2, 0
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 26 fin
# Phi connections
  j .F.checkBooleanPattern2x2._3.lazy.exit.0                            # ir inst 27 fin
.F.checkBooleanPattern2x2._2.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.checkBooleanPattern2x2._3.lazy.exit.0                            # ir inst 28 fin
.F.checkBooleanPattern2x2._3.lazy.exit.0:
  bnez s11, .F.checkBooleanPattern2x2._4.lazy.then.1
  j .F.checkBooleanPattern2x2._5.lazy.else.1                            # ir inst 30 fin
.F.checkBooleanPattern2x2._4.lazy.then.1:
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 31 fin
# Phi connections
  j .F.checkBooleanPattern2x2._6.lazy.exit.1                            # ir inst 32 fin
.F.checkBooleanPattern2x2._5.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.checkBooleanPattern2x2._6.lazy.exit.1                            # ir inst 33 fin
.F.checkBooleanPattern2x2._6.lazy.exit.1:
  bnez s11, .F.checkBooleanPattern2x2._7.lazy.then.2
  j .F.checkBooleanPattern2x2._8.lazy.else.2                            # ir inst 35 fin
.F.checkBooleanPattern2x2._7.lazy.then.2:
# Phi connections
  mv s11, t5
  j .F.checkBooleanPattern2x2._9.lazy.exit.2                            # ir inst 36 fin
.F.checkBooleanPattern2x2._8.lazy.else.2:
# Phi connections
  li s11, 0
  j .F.checkBooleanPattern2x2._9.lazy.exit.2                            # ir inst 37 fin
.F.checkBooleanPattern2x2._9.lazy.exit.2:
  bnez s11, .F.checkBooleanPattern2x2._10.lazy.then.3
  j .F.checkBooleanPattern2x2._11.lazy.else.3                           # ir inst 39 fin
.F.checkBooleanPattern2x2._10.lazy.then.3:
# Phi connections
  li t6, 1
  j .F.checkBooleanPattern2x2._21.lazy.exit.3                           # ir inst 40 fin
.F.checkBooleanPattern2x2._11.lazy.else.3:
  li t2, 0
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 41 fin
  bnez s11, .F.checkBooleanPattern2x2._12.lazy.then.4
  j .F.checkBooleanPattern2x2._13.lazy.else.4                           # ir inst 42 fin
.F.checkBooleanPattern2x2._12.lazy.then.4:
# Phi connections
  mv t6, t4
  j .F.checkBooleanPattern2x2._14.lazy.exit.4                           # ir inst 43 fin
.F.checkBooleanPattern2x2._13.lazy.else.4:
# Phi connections
  li t6, 0
  j .F.checkBooleanPattern2x2._14.lazy.exit.4                           # ir inst 44 fin
.F.checkBooleanPattern2x2._14.lazy.exit.4:
  bnez t6, .F.checkBooleanPattern2x2._15.lazy.then.5
  j .F.checkBooleanPattern2x2._16.lazy.else.5                           # ir inst 46 fin
.F.checkBooleanPattern2x2._15.lazy.then.5:
# Phi connections
  mv t6, t3
  j .F.checkBooleanPattern2x2._17.lazy.exit.5                           # ir inst 47 fin
.F.checkBooleanPattern2x2._16.lazy.else.5:
# Phi connections
  li t6, 0
  j .F.checkBooleanPattern2x2._17.lazy.exit.5                           # ir inst 48 fin
.F.checkBooleanPattern2x2._17.lazy.exit.5:
  bnez t6, .F.checkBooleanPattern2x2._18.lazy.then.6
  j .F.checkBooleanPattern2x2._19.lazy.else.6                           # ir inst 50 fin
.F.checkBooleanPattern2x2._18.lazy.then.6:
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 51 fin
# Phi connections
  j .F.checkBooleanPattern2x2._20.lazy.exit.6                           # ir inst 52 fin
.F.checkBooleanPattern2x2._19.lazy.else.6:
# Phi connections
  li t6, 0
  j .F.checkBooleanPattern2x2._20.lazy.exit.6                           # ir inst 53 fin
.F.checkBooleanPattern2x2._20.lazy.exit.6:
# Phi connections
  j .F.checkBooleanPattern2x2._21.lazy.exit.3                           # ir inst 55 fin
.F.checkBooleanPattern2x2._21.lazy.exit.3:
  mv a0, t6
  j .F.checkBooleanPattern2x2.epilogue                                  # ir inst 57 fin
.F.checkBooleanPattern2x2.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.checkBooleanPattern3x3
.F.checkBooleanPattern3x3:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s11, 8(sp)
  sd s10, 16(sp)
.F.checkBooleanPattern3x3._0.entry.0:
  addi t6, a1, 2                                                        # ir inst 1 fin
  li t2, 100
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 2 fin
  bnez t5, .F.checkBooleanPattern3x3._1.lazy.then.0
  j .F.checkBooleanPattern3x3._2.lazy.else.0                            # ir inst 3 fin
.F.checkBooleanPattern3x3._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.checkBooleanPattern3x3._3.lazy.exit.0                            # ir inst 4 fin
.F.checkBooleanPattern3x3._2.lazy.else.0:
  addi t6, a2, 2                                                        # ir inst 5 fin
  li t2, 100
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 6 fin
# Phi connections
  mv t6, t5
  j .F.checkBooleanPattern3x3._3.lazy.exit.0                            # ir inst 7 fin
.F.checkBooleanPattern3x3._3.lazy.exit.0:
  bnez t6, .F.checkBooleanPattern3x3._4.if.then.0
  j .F.checkBooleanPattern3x3._5.if.else.0                              # ir inst 9 fin
.F.checkBooleanPattern3x3._4.if.then.0:
  li a0, 0
  j .F.checkBooleanPattern3x3.epilogue                                  # ir inst 10 fin
.F.checkBooleanPattern3x3._5.if.else.0:
  j .F.checkBooleanPattern3x3._6.if.exit.0                              # ir inst 11 fin
.F.checkBooleanPattern3x3._6.if.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.checkBooleanPattern3x3._7.while.cond.0                           # ir inst 12 fin
.F.checkBooleanPattern3x3._7.while.cond.0:
  li t2, 3
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.checkBooleanPattern3x3._8.while.body.0
  j .F.checkBooleanPattern3x3._15.while.exit.0                          # ir inst 16 fin
.F.checkBooleanPattern3x3._8.while.body.0:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F.checkBooleanPattern3x3._9.while.cond.1                           # ir inst 17 fin
.F.checkBooleanPattern3x3._9.while.cond.1:
  li t2, 3
  slt s11, t4, t2                                                       # ir inst 20 fin
  bnez s11, .F.checkBooleanPattern3x3._10.while.body.1
  j .F.checkBooleanPattern3x3._14.while.exit.1                          # ir inst 21 fin
.F.checkBooleanPattern3x3._10.while.body.1:
  add s11, a1, t5                                                       # ir inst 22 fin
  li t2, 100
  mul s10, s11, t2                                                      # ir inst 23 fin
  add s11, a2, t4                                                       # ir inst 24 fin
  add s9, s10, s11                                                      # ir inst 25 fin
  mv s11, s9                                                            # ir inst 26 fin
  add s10, a0, s11                                                      # ir inst 27 fin
  lb s11, 0(s10)                                                        # ir inst 28 fin
  bnez s11, .F.checkBooleanPattern3x3._11.if.then.1
  j .F.checkBooleanPattern3x3._12.if.else.1                             # ir inst 29 fin
.F.checkBooleanPattern3x3._11.if.then.1:
  addi s11, t3, 1                                                       # ir inst 30 fin
# Phi connections
  j .F.checkBooleanPattern3x3._13.if.exit.1                             # ir inst 31 fin
.F.checkBooleanPattern3x3._12.if.else.1:
# Phi connections
  mv s11, t3
  j .F.checkBooleanPattern3x3._13.if.exit.1                             # ir inst 32 fin
.F.checkBooleanPattern3x3._13.if.exit.1:
  addi s10, t4, 1                                                       # ir inst 34 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.checkBooleanPattern3x3._9.while.cond.1                           # ir inst 35 fin
.F.checkBooleanPattern3x3._14.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 36 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.checkBooleanPattern3x3._7.while.cond.0                           # ir inst 37 fin
.F.checkBooleanPattern3x3._15.while.exit.0:
  li t2, 5
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 38 fin
  mv a0, t5
  j .F.checkBooleanPattern3x3.epilogue                                  # ir inst 39 fin
.F.checkBooleanPattern3x3.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testLogicalAlgorithms
.F.testLogicalAlgorithms:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.testLogicalAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1105
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testBooleanSATSolver
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  call .F.testBooleanFunctionEvaluation
  mv t5, a0
  ld t6, 0(sp)
# ir inst 3 fin
  add t4, t6, t5                                                        # ir inst 4 fin
# Start call preparation
  sd t4, 0(sp)
  call .F.solveBooleanPuzzles
  mv t6, a0
  ld t4, 0(sp)
# ir inst 5 fin
  add t5, t4, t6                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 1106
  call printlnInt
# ir inst 8 fin
  j .F.testLogicalAlgorithms.epilogue                                   # ir inst 9 fin
.F.testLogicalAlgorithms.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testBooleanSATSolver
.F.testBooleanSATSolver:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.testBooleanSATSolver._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testBooleanSATSolver._1.while.cond.0                             # ir inst 1 fin
.F.testBooleanSATSolver._1.while.cond.0:
  li t2, 1024
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.testBooleanSATSolver._2.while.body.0
  j .F.testBooleanSATSolver._6.while.exit.0                             # ir inst 5 fin
.F.testBooleanSATSolver._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.evaluateBooleanFormula
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  bnez t4, .F.testBooleanSATSolver._3.if.then.0
  j .F.testBooleanSATSolver._4.if.else.0                                # ir inst 7 fin
.F.testBooleanSATSolver._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 8 fin
# Phi connections
  j .F.testBooleanSATSolver._5.if.exit.0                                # ir inst 9 fin
.F.testBooleanSATSolver._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.testBooleanSATSolver._5.if.exit.0                                # ir inst 10 fin
.F.testBooleanSATSolver._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testBooleanSATSolver._1.while.cond.0                             # ir inst 13 fin
.F.testBooleanSATSolver._6.while.exit.0:
  mv a0, t5
  j .F.testBooleanSATSolver.epilogue                                    # ir inst 14 fin
.F.testBooleanSATSolver.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.evaluateBooleanFormula
.F.evaluateBooleanFormula:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s0, 0(sp)
  sd s5, 8(sp)
  sd s6, 16(sp)
  sd s1, 24(sp)
  sd s11, 32(sp)
  sd s10, 40(sp)
  sd s9, 48(sp)
  sd s8, 56(sp)
  sd s7, 64(sp)
.F.evaluateBooleanFormula._0.entry.0:
  andi t6, a0, 1                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 2 fin
  andi t6, a0, 2                                                        # ir inst 3 fin
  li t2, 0
  xor t0, t6, t2
  sltu t4, zero, t0                                                     # ir inst 4 fin
  andi t6, a0, 4                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltu t3, zero, t0                                                     # ir inst 6 fin
  andi t6, a0, 8                                                        # ir inst 7 fin
  li t2, 0
  xor t0, t6, t2
  sltu s11, zero, t0                                                    # ir inst 8 fin
  andi t6, a0, 16                                                       # ir inst 9 fin
  li t2, 0
  xor t0, t6, t2
  sltu s10, zero, t0                                                    # ir inst 10 fin
  andi t6, a0, 32                                                       # ir inst 11 fin
  li t2, 0
  xor t0, t6, t2
  sltu s9, zero, t0                                                     # ir inst 12 fin
  andi t6, a0, 64                                                       # ir inst 13 fin
  li t2, 0
  xor t0, t6, t2
  sltu s8, zero, t0                                                     # ir inst 14 fin
  andi t6, a0, 128                                                      # ir inst 15 fin
  li t2, 0
  xor t0, t6, t2
  sltu s7, zero, t0                                                     # ir inst 16 fin
  andi t6, a0, 256                                                      # ir inst 17 fin
  li t2, 0
  xor t0, t6, t2
  sltu s6, zero, t0                                                     # ir inst 18 fin
  andi t6, a0, 512                                                      # ir inst 19 fin
  li t2, 0
  xor t0, t6, t2
  sltu s5, zero, t0                                                     # ir inst 20 fin
  bnez t5, .F.evaluateBooleanFormula._1.lazy.then.0
  j .F.evaluateBooleanFormula._2.lazy.else.0                            # ir inst 21 fin
.F.evaluateBooleanFormula._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.evaluateBooleanFormula._3.lazy.exit.0                            # ir inst 22 fin
.F.evaluateBooleanFormula._2.lazy.else.0:
  li t2, 0
  xor t0, t4, t2
  sltiu t6, t0, 1                                                       # ir inst 23 fin
# Phi connections
  j .F.evaluateBooleanFormula._3.lazy.exit.0                            # ir inst 24 fin
.F.evaluateBooleanFormula._3.lazy.exit.0:
  bnez t6, .F.evaluateBooleanFormula._4.lazy.then.1
  j .F.evaluateBooleanFormula._5.lazy.else.1                            # ir inst 26 fin
.F.evaluateBooleanFormula._4.lazy.then.1:
# Phi connections
  li t6, 1
  j .F.evaluateBooleanFormula._6.lazy.exit.1                            # ir inst 27 fin
.F.evaluateBooleanFormula._5.lazy.else.1:
# Phi connections
  mv t6, t3
  j .F.evaluateBooleanFormula._6.lazy.exit.1                            # ir inst 28 fin
.F.evaluateBooleanFormula._6.lazy.exit.1:
  li t2, 0
  xor t0, t5, t2
  sltiu s0, t0, 1                                                       # ir inst 30 fin
  bnez s0, .F.evaluateBooleanFormula._7.lazy.then.2
  j .F.evaluateBooleanFormula._8.lazy.else.2                            # ir inst 31 fin
.F.evaluateBooleanFormula._7.lazy.then.2:
# Phi connections
  li s0, 1
  j .F.evaluateBooleanFormula._9.lazy.exit.2                            # ir inst 32 fin
.F.evaluateBooleanFormula._8.lazy.else.2:
# Phi connections
  mv s0, s11
  j .F.evaluateBooleanFormula._9.lazy.exit.2                            # ir inst 33 fin
.F.evaluateBooleanFormula._9.lazy.exit.2:
  bnez s0, .F.evaluateBooleanFormula._10.lazy.then.3
  j .F.evaluateBooleanFormula._11.lazy.else.3                           # ir inst 35 fin
.F.evaluateBooleanFormula._10.lazy.then.3:
# Phi connections
  li s0, 1
  j .F.evaluateBooleanFormula._12.lazy.exit.3                           # ir inst 36 fin
.F.evaluateBooleanFormula._11.lazy.else.3:
  li t2, 0
  xor t0, s10, t2
  sltiu s0, t0, 1                                                       # ir inst 37 fin
# Phi connections
  j .F.evaluateBooleanFormula._12.lazy.exit.3                           # ir inst 38 fin
.F.evaluateBooleanFormula._12.lazy.exit.3:
  bnez t4, .F.evaluateBooleanFormula._13.lazy.then.4
  j .F.evaluateBooleanFormula._14.lazy.else.4                           # ir inst 40 fin
.F.evaluateBooleanFormula._13.lazy.then.4:
# Phi connections
  li s1, 1
  j .F.evaluateBooleanFormula._15.lazy.exit.4                           # ir inst 41 fin
.F.evaluateBooleanFormula._14.lazy.else.4:
  li t2, 0
  xor t0, t3, t2
  sltiu s1, t0, 1                                                       # ir inst 42 fin
# Phi connections
  j .F.evaluateBooleanFormula._15.lazy.exit.4                           # ir inst 43 fin
.F.evaluateBooleanFormula._15.lazy.exit.4:
  bnez s1, .F.evaluateBooleanFormula._16.lazy.then.5
  j .F.evaluateBooleanFormula._17.lazy.else.5                           # ir inst 45 fin
.F.evaluateBooleanFormula._16.lazy.then.5:
# Phi connections
  li s1, 1
  j .F.evaluateBooleanFormula._18.lazy.exit.5                           # ir inst 46 fin
.F.evaluateBooleanFormula._17.lazy.else.5:
# Phi connections
  mv s1, s9
  j .F.evaluateBooleanFormula._18.lazy.exit.5                           # ir inst 47 fin
.F.evaluateBooleanFormula._18.lazy.exit.5:
  li t2, 0
  xor t0, s11, t2
  sltiu a0, t0, 1                                                       # ir inst 49 fin
  bnez a0, .F.evaluateBooleanFormula._19.lazy.then.6
  j .F.evaluateBooleanFormula._20.lazy.else.6                           # ir inst 50 fin
.F.evaluateBooleanFormula._19.lazy.then.6:
# Phi connections
  li s11, 1
  j .F.evaluateBooleanFormula._21.lazy.exit.6                           # ir inst 51 fin
.F.evaluateBooleanFormula._20.lazy.else.6:
# Phi connections
  mv s11, s10
  j .F.evaluateBooleanFormula._21.lazy.exit.6                           # ir inst 52 fin
.F.evaluateBooleanFormula._21.lazy.exit.6:
  bnez s11, .F.evaluateBooleanFormula._22.lazy.then.7
  j .F.evaluateBooleanFormula._23.lazy.else.7                           # ir inst 54 fin
.F.evaluateBooleanFormula._22.lazy.then.7:
# Phi connections
  li s11, 1
  j .F.evaluateBooleanFormula._24.lazy.exit.7                           # ir inst 55 fin
.F.evaluateBooleanFormula._23.lazy.else.7:
  li t2, 0
  xor t0, s8, t2
  sltiu s11, t0, 1                                                      # ir inst 56 fin
# Phi connections
  j .F.evaluateBooleanFormula._24.lazy.exit.7                           # ir inst 57 fin
.F.evaluateBooleanFormula._24.lazy.exit.7:
  bnez t3, .F.evaluateBooleanFormula._25.lazy.then.8
  j .F.evaluateBooleanFormula._26.lazy.else.8                           # ir inst 59 fin
.F.evaluateBooleanFormula._25.lazy.then.8:
# Phi connections
  li s10, 1
  j .F.evaluateBooleanFormula._27.lazy.exit.8                           # ir inst 60 fin
.F.evaluateBooleanFormula._26.lazy.else.8:
# Phi connections
  mv s10, s7
  j .F.evaluateBooleanFormula._27.lazy.exit.8                           # ir inst 61 fin
.F.evaluateBooleanFormula._27.lazy.exit.8:
  bnez s10, .F.evaluateBooleanFormula._28.lazy.then.9
  j .F.evaluateBooleanFormula._29.lazy.else.9                           # ir inst 63 fin
.F.evaluateBooleanFormula._28.lazy.then.9:
# Phi connections
  li s10, 1
  j .F.evaluateBooleanFormula._30.lazy.exit.9                           # ir inst 64 fin
.F.evaluateBooleanFormula._29.lazy.else.9:
  li t2, 0
  xor t0, s6, t2
  sltiu s10, t0, 1                                                      # ir inst 65 fin
# Phi connections
  j .F.evaluateBooleanFormula._30.lazy.exit.9                           # ir inst 66 fin
.F.evaluateBooleanFormula._30.lazy.exit.9:
  li t2, 0
  xor t0, s9, t2
  sltiu a0, t0, 1                                                       # ir inst 68 fin
  bnez a0, .F.evaluateBooleanFormula._31.lazy.then.10
  j .F.evaluateBooleanFormula._32.lazy.else.10                          # ir inst 69 fin
.F.evaluateBooleanFormula._31.lazy.then.10:
# Phi connections
  li s9, 1
  j .F.evaluateBooleanFormula._33.lazy.exit.10                          # ir inst 70 fin
.F.evaluateBooleanFormula._32.lazy.else.10:
  li t2, 0
  xor t0, s7, t2
  sltiu s9, t0, 1                                                       # ir inst 71 fin
# Phi connections
  j .F.evaluateBooleanFormula._33.lazy.exit.10                          # ir inst 72 fin
.F.evaluateBooleanFormula._33.lazy.exit.10:
  bnez s9, .F.evaluateBooleanFormula._34.lazy.then.11
  j .F.evaluateBooleanFormula._35.lazy.else.11                          # ir inst 74 fin
.F.evaluateBooleanFormula._34.lazy.then.11:
# Phi connections
  li s9, 1
  j .F.evaluateBooleanFormula._36.lazy.exit.11                          # ir inst 75 fin
.F.evaluateBooleanFormula._35.lazy.else.11:
# Phi connections
  mv s9, s5
  j .F.evaluateBooleanFormula._36.lazy.exit.11                          # ir inst 76 fin
.F.evaluateBooleanFormula._36.lazy.exit.11:
  bnez s8, .F.evaluateBooleanFormula._37.lazy.then.12
  j .F.evaluateBooleanFormula._38.lazy.else.12                          # ir inst 78 fin
.F.evaluateBooleanFormula._37.lazy.then.12:
# Phi connections
  li s8, 1
  j .F.evaluateBooleanFormula._39.lazy.exit.12                          # ir inst 79 fin
.F.evaluateBooleanFormula._38.lazy.else.12:
# Phi connections
  mv s8, s6
  j .F.evaluateBooleanFormula._39.lazy.exit.12                          # ir inst 80 fin
.F.evaluateBooleanFormula._39.lazy.exit.12:
  bnez s8, .F.evaluateBooleanFormula._40.lazy.then.13
  j .F.evaluateBooleanFormula._41.lazy.else.13                          # ir inst 82 fin
.F.evaluateBooleanFormula._40.lazy.then.13:
# Phi connections
  li s8, 1
  j .F.evaluateBooleanFormula._42.lazy.exit.13                          # ir inst 83 fin
.F.evaluateBooleanFormula._41.lazy.else.13:
  li t2, 0
  xor t0, s5, t2
  sltiu s8, t0, 1                                                       # ir inst 84 fin
# Phi connections
  j .F.evaluateBooleanFormula._42.lazy.exit.13                          # ir inst 85 fin
.F.evaluateBooleanFormula._42.lazy.exit.13:
  li t2, 0
  xor t0, t5, t2
  sltiu s7, t0, 1                                                       # ir inst 87 fin
  bnez s7, .F.evaluateBooleanFormula._43.lazy.then.14
  j .F.evaluateBooleanFormula._44.lazy.else.14                          # ir inst 88 fin
.F.evaluateBooleanFormula._43.lazy.then.14:
# Phi connections
  li t5, 1
  j .F.evaluateBooleanFormula._45.lazy.exit.14                          # ir inst 89 fin
.F.evaluateBooleanFormula._44.lazy.else.14:
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 90 fin
# Phi connections
  j .F.evaluateBooleanFormula._45.lazy.exit.14                          # ir inst 91 fin
.F.evaluateBooleanFormula._45.lazy.exit.14:
  bnez t5, .F.evaluateBooleanFormula._46.lazy.then.15
  j .F.evaluateBooleanFormula._47.lazy.else.15                          # ir inst 93 fin
.F.evaluateBooleanFormula._46.lazy.then.15:
# Phi connections
  li t5, 1
  j .F.evaluateBooleanFormula._48.lazy.exit.15                          # ir inst 94 fin
.F.evaluateBooleanFormula._47.lazy.else.15:
  li t2, 0
  xor t0, t3, t2
  sltiu t5, t0, 1                                                       # ir inst 95 fin
# Phi connections
  j .F.evaluateBooleanFormula._48.lazy.exit.15                          # ir inst 96 fin
.F.evaluateBooleanFormula._48.lazy.exit.15:
  bnez t6, .F.evaluateBooleanFormula._49.lazy.then.16
  j .F.evaluateBooleanFormula._50.lazy.else.16                          # ir inst 98 fin
.F.evaluateBooleanFormula._49.lazy.then.16:
# Phi connections
  mv t6, s0
  j .F.evaluateBooleanFormula._51.lazy.exit.16                          # ir inst 99 fin
.F.evaluateBooleanFormula._50.lazy.else.16:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._51.lazy.exit.16                          # ir inst 100 fin
.F.evaluateBooleanFormula._51.lazy.exit.16:
  bnez t6, .F.evaluateBooleanFormula._52.lazy.then.17
  j .F.evaluateBooleanFormula._53.lazy.else.17                          # ir inst 102 fin
.F.evaluateBooleanFormula._52.lazy.then.17:
# Phi connections
  mv t6, s1
  j .F.evaluateBooleanFormula._54.lazy.exit.17                          # ir inst 103 fin
.F.evaluateBooleanFormula._53.lazy.else.17:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._54.lazy.exit.17                          # ir inst 104 fin
.F.evaluateBooleanFormula._54.lazy.exit.17:
  bnez t6, .F.evaluateBooleanFormula._55.lazy.then.18
  j .F.evaluateBooleanFormula._56.lazy.else.18                          # ir inst 106 fin
.F.evaluateBooleanFormula._55.lazy.then.18:
# Phi connections
  mv t6, s11
  j .F.evaluateBooleanFormula._57.lazy.exit.18                          # ir inst 107 fin
.F.evaluateBooleanFormula._56.lazy.else.18:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._57.lazy.exit.18                          # ir inst 108 fin
.F.evaluateBooleanFormula._57.lazy.exit.18:
  bnez t6, .F.evaluateBooleanFormula._58.lazy.then.19
  j .F.evaluateBooleanFormula._59.lazy.else.19                          # ir inst 110 fin
.F.evaluateBooleanFormula._58.lazy.then.19:
# Phi connections
  mv t6, s10
  j .F.evaluateBooleanFormula._60.lazy.exit.19                          # ir inst 111 fin
.F.evaluateBooleanFormula._59.lazy.else.19:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._60.lazy.exit.19                          # ir inst 112 fin
.F.evaluateBooleanFormula._60.lazy.exit.19:
  bnez t6, .F.evaluateBooleanFormula._61.lazy.then.20
  j .F.evaluateBooleanFormula._62.lazy.else.20                          # ir inst 114 fin
.F.evaluateBooleanFormula._61.lazy.then.20:
# Phi connections
  mv t6, s9
  j .F.evaluateBooleanFormula._63.lazy.exit.20                          # ir inst 115 fin
.F.evaluateBooleanFormula._62.lazy.else.20:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._63.lazy.exit.20                          # ir inst 116 fin
.F.evaluateBooleanFormula._63.lazy.exit.20:
  bnez t6, .F.evaluateBooleanFormula._64.lazy.then.21
  j .F.evaluateBooleanFormula._65.lazy.else.21                          # ir inst 118 fin
.F.evaluateBooleanFormula._64.lazy.then.21:
# Phi connections
  mv t6, s8
  j .F.evaluateBooleanFormula._66.lazy.exit.21                          # ir inst 119 fin
.F.evaluateBooleanFormula._65.lazy.else.21:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._66.lazy.exit.21                          # ir inst 120 fin
.F.evaluateBooleanFormula._66.lazy.exit.21:
  bnez t6, .F.evaluateBooleanFormula._67.lazy.then.22
  j .F.evaluateBooleanFormula._68.lazy.else.22                          # ir inst 122 fin
.F.evaluateBooleanFormula._67.lazy.then.22:
# Phi connections
  mv t6, t5
  j .F.evaluateBooleanFormula._69.lazy.exit.22                          # ir inst 123 fin
.F.evaluateBooleanFormula._68.lazy.else.22:
# Phi connections
  li t6, 0
  j .F.evaluateBooleanFormula._69.lazy.exit.22                          # ir inst 124 fin
.F.evaluateBooleanFormula._69.lazy.exit.22:
  mv a0, t6
  j .F.evaluateBooleanFormula.epilogue                                  # ir inst 126 fin
.F.evaluateBooleanFormula.epilogue:
  ld s0, 0(sp)
  ld s5, 8(sp)
  ld s6, 16(sp)
  ld s1, 24(sp)
  ld s11, 32(sp)
  ld s10, 40(sp)
  ld s9, 48(sp)
  ld s8, 56(sp)
  ld s7, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.testBooleanFunctionEvaluation
.F.testBooleanFunctionEvaluation:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.testBooleanFunctionEvaluation._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testBooleanFunctionEvaluation._1.while.cond.0                    # ir inst 1 fin
.F.testBooleanFunctionEvaluation._1.while.cond.0:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.testBooleanFunctionEvaluation._2.while.body.0
  j .F.testBooleanFunctionEvaluation._12.while.exit.0                   # ir inst 5 fin
.F.testBooleanFunctionEvaluation._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.evaluateParityFunction
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  bnez t4, .F.testBooleanFunctionEvaluation._3.if.then.0
  j .F.testBooleanFunctionEvaluation._4.if.else.0                       # ir inst 7 fin
.F.testBooleanFunctionEvaluation._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 8 fin
# Phi connections
  j .F.testBooleanFunctionEvaluation._5.if.exit.0                       # ir inst 9 fin
.F.testBooleanFunctionEvaluation._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.testBooleanFunctionEvaluation._5.if.exit.0                       # ir inst 10 fin
.F.testBooleanFunctionEvaluation._5.if.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.evaluateMajorityFunction
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 12 fin
  bnez t3, .F.testBooleanFunctionEvaluation._6.if.then.1
  j .F.testBooleanFunctionEvaluation._7.if.else.1                       # ir inst 13 fin
.F.testBooleanFunctionEvaluation._6.if.then.1:
  addi t3, t4, 2                                                        # ir inst 14 fin
# Phi connections
  mv t4, t3
  j .F.testBooleanFunctionEvaluation._8.if.exit.1                       # ir inst 15 fin
.F.testBooleanFunctionEvaluation._7.if.else.1:
# Phi connections
  j .F.testBooleanFunctionEvaluation._8.if.exit.1                       # ir inst 16 fin
.F.testBooleanFunctionEvaluation._8.if.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.evaluateThresholdFunction
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  bnez t3, .F.testBooleanFunctionEvaluation._9.if.then.2
  j .F.testBooleanFunctionEvaluation._10.if.else.2                      # ir inst 19 fin
.F.testBooleanFunctionEvaluation._9.if.then.2:
  addi t3, t4, 3                                                        # ir inst 20 fin
# Phi connections
  mv t4, t3
  j .F.testBooleanFunctionEvaluation._11.if.exit.2                      # ir inst 21 fin
.F.testBooleanFunctionEvaluation._10.if.else.2:
# Phi connections
  j .F.testBooleanFunctionEvaluation._11.if.exit.2                      # ir inst 22 fin
.F.testBooleanFunctionEvaluation._11.if.exit.2:
  addi t3, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testBooleanFunctionEvaluation._1.while.cond.0                    # ir inst 25 fin
.F.testBooleanFunctionEvaluation._12.while.exit.0:
  mv a0, t5
  j .F.testBooleanFunctionEvaluation.epilogue                           # ir inst 26 fin
.F.testBooleanFunctionEvaluation.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.evaluateParityFunction
.F.evaluateParityFunction:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.evaluateParityFunction._0.entry.0:
# Phi connections
  li t5, 0
  mv t6, a0
  j .F.evaluateParityFunction._1.while.cond.0                           # ir inst 1 fin
.F.evaluateParityFunction._1.while.cond.0:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 4 fin
  bnez t4, .F.evaluateParityFunction._2.while.body.0
  j .F.evaluateParityFunction._6.while.exit.0                           # ir inst 5 fin
.F.evaluateParityFunction._2.while.body.0:
  andi t4, t6, 1                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 7 fin
  bnez t3, .F.evaluateParityFunction._3.if.then.0
  j .F.evaluateParityFunction._4.if.else.0                              # ir inst 8 fin
.F.evaluateParityFunction._3.if.then.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 9 fin
# Phi connections
  j .F.evaluateParityFunction._5.if.exit.0                              # ir inst 10 fin
.F.evaluateParityFunction._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.evaluateParityFunction._5.if.exit.0                              # ir inst 11 fin
.F.evaluateParityFunction._5.if.exit.0:
  li t2, 2
  div t3, t6, t2                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.evaluateParityFunction._1.while.cond.0                           # ir inst 14 fin
.F.evaluateParityFunction._6.while.exit.0:
  mv a0, t5
  j .F.evaluateParityFunction.epilogue                                  # ir inst 15 fin
.F.evaluateParityFunction.epilogue:
  ret

.globl .F.evaluateMajorityFunction
.F.evaluateMajorityFunction:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.evaluateMajorityFunction._0.entry.0:
# Phi connections
  li t5, 0
  mv t6, a0
  j .F.evaluateMajorityFunction._1.while.cond.0                         # ir inst 1 fin
.F.evaluateMajorityFunction._1.while.cond.0:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 4 fin
  bnez t4, .F.evaluateMajorityFunction._2.while.body.0
  j .F.evaluateMajorityFunction._6.while.exit.0                         # ir inst 5 fin
.F.evaluateMajorityFunction._2.while.body.0:
  andi t4, t6, 1                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 7 fin
  bnez t3, .F.evaluateMajorityFunction._3.if.then.0
  j .F.evaluateMajorityFunction._4.if.else.0                            # ir inst 8 fin
.F.evaluateMajorityFunction._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.evaluateMajorityFunction._5.if.exit.0                            # ir inst 10 fin
.F.evaluateMajorityFunction._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.evaluateMajorityFunction._5.if.exit.0                            # ir inst 11 fin
.F.evaluateMajorityFunction._5.if.exit.0:
  li t2, 2
  div t3, t6, t2                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.evaluateMajorityFunction._1.while.cond.0                         # ir inst 14 fin
.F.evaluateMajorityFunction._6.while.exit.0:
  li t2, 4
  slt t6, t2, t5                                                        # ir inst 15 fin
  mv a0, t6
  j .F.evaluateMajorityFunction.epilogue                                # ir inst 16 fin
.F.evaluateMajorityFunction.epilogue:
  ret

.globl .F.evaluateThresholdFunction
.F.evaluateThresholdFunction:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.evaluateThresholdFunction._0.entry.0:
# Phi connections
  li t5, 0
  mv t6, a0
  j .F.evaluateThresholdFunction._1.while.cond.0                        # ir inst 1 fin
.F.evaluateThresholdFunction._1.while.cond.0:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 4 fin
  bnez t4, .F.evaluateThresholdFunction._2.while.body.0
  j .F.evaluateThresholdFunction._6.while.exit.0                        # ir inst 5 fin
.F.evaluateThresholdFunction._2.while.body.0:
  andi t4, t6, 1                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 7 fin
  bnez t3, .F.evaluateThresholdFunction._3.if.then.0
  j .F.evaluateThresholdFunction._4.if.else.0                           # ir inst 8 fin
.F.evaluateThresholdFunction._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.evaluateThresholdFunction._5.if.exit.0                           # ir inst 10 fin
.F.evaluateThresholdFunction._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.evaluateThresholdFunction._5.if.exit.0                           # ir inst 11 fin
.F.evaluateThresholdFunction._5.if.exit.0:
  li t2, 2
  div t3, t6, t2                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.evaluateThresholdFunction._1.while.cond.0                        # ir inst 14 fin
.F.evaluateThresholdFunction._6.while.exit.0:
  li t2, 3
  slt t0, t5, t2
  xori t6, t0, 1                                                        # ir inst 15 fin
  mv a0, t6
  j .F.evaluateThresholdFunction.epilogue                               # ir inst 16 fin
.F.evaluateThresholdFunction.epilogue:
  ret

.globl .F.solveBooleanPuzzles
.F.solveBooleanPuzzles:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.solveBooleanPuzzles._0.entry.0:
# Start call preparation
  li a0, 8
  call .F.solveNQueensBooleanVersion
  mv t6, a0
# ir inst 1 fin
# Start call preparation
  sd t6, 0(sp)
  call .F.solveBooleanConstraints
  mv t5, a0
  ld t6, 0(sp)
# ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  mv a0, t4
  j .F.solveBooleanPuzzles.epilogue                                     # ir inst 4 fin
.F.solveBooleanPuzzles.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.solveNQueensBooleanVersion
.F.solveNQueensBooleanVersion:
# spill func args num: 0,             range:      160(sp) -      160(sp)
# local var size: 128,                range:       24(sp) -      152(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -160
  sd ra, 16(sp)
.F.solveNQueensBooleanVersion._0.entry.0:
  addi t1, sp, 88
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.solveNQueensBooleanVersion._1.array.cond.0                       # ir inst 4 fin
.F.solveNQueensBooleanVersion._1.array.cond.0:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.solveNQueensBooleanVersion._2.array.body.0
  j .F.solveNQueensBooleanVersion._3.array.exit.0                       # ir inst 7 fin
.F.solveNQueensBooleanVersion._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 8 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.solveNQueensBooleanVersion._1.array.cond.0                       # ir inst 11 fin
.F.solveNQueensBooleanVersion._3.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 64
  addi t1, sp, 88
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  mv a2, a0
  li a1, 0
  addi t1, sp, 24
  mv a0, t1
  call .F.nQueensBacktrack
  mv t6, a0
  ld a0, 0(sp)
# ir inst 13 fin
  mv a0, t6
  j .F.solveNQueensBooleanVersion.epilogue                              # ir inst 14 fin
.F.solveNQueensBooleanVersion.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 160
  ret

.globl .F.nQueensBacktrack
.F.nQueensBacktrack:
# spill func args num: 0,             range:      208(sp) -      208(sp)
# local var size: 128,                range:       72(sp) -      200(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 1 / 12,        range:       56(sp) -       64(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -208
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.nQueensBacktrack._0.entry.0:
  xor t0, a1, a2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.nQueensBacktrack._1.if.then.0
  j .F.nQueensBacktrack._2.if.else.0                                    # ir inst 4 fin
.F.nQueensBacktrack._1.if.then.0:
  li a0, 1
  j .F.nQueensBacktrack.epilogue                                        # ir inst 5 fin
.F.nQueensBacktrack._2.if.else.0:
  j .F.nQueensBacktrack._3.if.exit.0                                    # ir inst 6 fin
.F.nQueensBacktrack._3.if.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.nQueensBacktrack._4.while.cond.0                                 # ir inst 7 fin
.F.nQueensBacktrack._4.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 10 fin
  bnez t4, .F.nQueensBacktrack._5.while.body.0
  j .F.nQueensBacktrack._9.while.exit.0                                 # ir inst 11 fin
.F.nQueensBacktrack._5.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 64
  mv a1, a0
  addi t1, sp, 72
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a3, a2
  mv a2, t6
  addi t1, sp, 72
  mv a0, t1
  call .F.isSafePosition
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 13 fin
  bnez t4, .F.nQueensBacktrack._6.if.then.1
  j .F.nQueensBacktrack._7.if.else.1                                    # ir inst 14 fin
.F.nQueensBacktrack._6.if.then.1:
  mul t4, a1, a2                                                        # ir inst 15 fin
  add t3, t4, t6                                                        # ir inst 16 fin
  mv t4, t3                                                             # ir inst 17 fin
  add t3, a0, t4                                                        # ir inst 18 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 19 fin
  addi t4, a1, 1                                                        # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  li a2, 64
  mv a1, a0
  addi t1, sp, 136
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t4
  addi t1, sp, 136
  mv a0, t1
  call .F.nQueensBacktrack
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 22 fin
  add t4, t5, t3                                                        # ir inst 23 fin
  mul t3, a1, a2                                                        # ir inst 24 fin
  add s11, t3, t6                                                       # ir inst 25 fin
  mv t3, s11                                                            # ir inst 26 fin
  add s11, a0, t3                                                       # ir inst 27 fin
  li t1, 0
  sb t1, 0(s11)                                                         # ir inst 28 fin
# Phi connections
  j .F.nQueensBacktrack._8.if.exit.1                                    # ir inst 29 fin
.F.nQueensBacktrack._7.if.else.1:
# Phi connections
  mv t4, t5
  j .F.nQueensBacktrack._8.if.exit.1                                    # ir inst 30 fin
.F.nQueensBacktrack._8.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.nQueensBacktrack._4.while.cond.0                                 # ir inst 33 fin
.F.nQueensBacktrack._9.while.exit.0:
  mv a0, t5
  j .F.nQueensBacktrack.epilogue                                        # ir inst 34 fin
.F.nQueensBacktrack.epilogue:
  ld ra, 64(sp)
  ld s11, 56(sp)
  addi sp, sp, 208
  ret

.globl .F.isSafePosition
.F.isSafePosition:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.isSafePosition._0.entry.0:
# Phi connections
  li t6, 0
  j .F.isSafePosition._1.while.cond.0                                   # ir inst 1 fin
.F.isSafePosition._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.isSafePosition._2.while.body.0
  j .F.isSafePosition._6.while.exit.0                                   # ir inst 4 fin
.F.isSafePosition._2.while.body.0:
  mul t5, t6, a3                                                        # ir inst 5 fin
  add t4, t5, a2                                                        # ir inst 6 fin
  mv t5, t4                                                             # ir inst 7 fin
  add t4, a0, t5                                                        # ir inst 8 fin
  lb t5, 0(t4)                                                          # ir inst 9 fin
  bnez t5, .F.isSafePosition._3.if.then.0
  j .F.isSafePosition._4.if.else.0                                      # ir inst 10 fin
.F.isSafePosition._3.if.then.0:
  li a0, 0
  j .F.isSafePosition.epilogue                                          # ir inst 11 fin
.F.isSafePosition._4.if.else.0:
  j .F.isSafePosition._5.if.exit.0                                      # ir inst 12 fin
.F.isSafePosition._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F.isSafePosition._1.while.cond.0                                   # ir inst 14 fin
.F.isSafePosition._6.while.exit.0:
  addi t6, a1, -1                                                       # ir inst 15 fin
  addi t5, a2, -1                                                       # ir inst 16 fin
# Phi connections
  mv t0, t5
  mv t5, t6
  mv t6, t0
  j .F.isSafePosition._7.while.cond.1                                   # ir inst 17 fin
.F.isSafePosition._7.while.cond.1:
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 20 fin
  bnez t4, .F.isSafePosition._8.lazy.then.0
  j .F.isSafePosition._9.lazy.else.0                                    # ir inst 21 fin
.F.isSafePosition._8.lazy.then.0:
  li t2, 0
  slt t0, t6, t2
  xori t4, t0, 1                                                        # ir inst 22 fin
# Phi connections
  j .F.isSafePosition._10.lazy.exit.0                                   # ir inst 23 fin
.F.isSafePosition._9.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.isSafePosition._10.lazy.exit.0                                   # ir inst 24 fin
.F.isSafePosition._10.lazy.exit.0:
  bnez t4, .F.isSafePosition._11.while.body.1
  j .F.isSafePosition._15.while.exit.1                                  # ir inst 26 fin
.F.isSafePosition._11.while.body.1:
  mul t4, t5, a3                                                        # ir inst 27 fin
  add t3, t4, t6                                                        # ir inst 28 fin
  mv t4, t3                                                             # ir inst 29 fin
  add t3, a0, t4                                                        # ir inst 30 fin
  lb t4, 0(t3)                                                          # ir inst 31 fin
  bnez t4, .F.isSafePosition._12.if.then.1
  j .F.isSafePosition._13.if.else.1                                     # ir inst 32 fin
.F.isSafePosition._12.if.then.1:
  li a0, 0
  j .F.isSafePosition.epilogue                                          # ir inst 33 fin
.F.isSafePosition._13.if.else.1:
  j .F.isSafePosition._14.if.exit.1                                     # ir inst 34 fin
.F.isSafePosition._14.if.exit.1:
  addi t4, t5, -1                                                       # ir inst 35 fin
  addi t5, t6, -1                                                       # ir inst 36 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.isSafePosition._7.while.cond.1                                   # ir inst 37 fin
.F.isSafePosition._15.while.exit.1:
  addi t6, a1, -1                                                       # ir inst 38 fin
  addi t5, a2, 1                                                        # ir inst 39 fin
# Phi connections
  mv t0, t5
  mv t5, t6
  mv t6, t0
  j .F.isSafePosition._16.while.cond.2                                  # ir inst 40 fin
.F.isSafePosition._16.while.cond.2:
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 43 fin
  bnez t4, .F.isSafePosition._17.lazy.then.1
  j .F.isSafePosition._18.lazy.else.1                                   # ir inst 44 fin
.F.isSafePosition._17.lazy.then.1:
  slt t4, t6, a3                                                        # ir inst 45 fin
# Phi connections
  j .F.isSafePosition._19.lazy.exit.1                                   # ir inst 46 fin
.F.isSafePosition._18.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.isSafePosition._19.lazy.exit.1                                   # ir inst 47 fin
.F.isSafePosition._19.lazy.exit.1:
  bnez t4, .F.isSafePosition._20.while.body.2
  j .F.isSafePosition._24.while.exit.2                                  # ir inst 49 fin
.F.isSafePosition._20.while.body.2:
  mul t4, t5, a3                                                        # ir inst 50 fin
  add t3, t4, t6                                                        # ir inst 51 fin
  mv t4, t3                                                             # ir inst 52 fin
  add t3, a0, t4                                                        # ir inst 53 fin
  lb t4, 0(t3)                                                          # ir inst 54 fin
  bnez t4, .F.isSafePosition._21.if.then.2
  j .F.isSafePosition._22.if.else.2                                     # ir inst 55 fin
.F.isSafePosition._21.if.then.2:
  li a0, 0
  j .F.isSafePosition.epilogue                                          # ir inst 56 fin
.F.isSafePosition._22.if.else.2:
  j .F.isSafePosition._23.if.exit.2                                     # ir inst 57 fin
.F.isSafePosition._23.if.exit.2:
  addi t4, t5, -1                                                       # ir inst 58 fin
  addi t5, t6, 1                                                        # ir inst 59 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.isSafePosition._16.while.cond.2                                  # ir inst 60 fin
.F.isSafePosition._24.while.exit.2:
  li a0, 1
  j .F.isSafePosition.epilogue                                          # ir inst 61 fin
.F.isSafePosition.epilogue:
  ret

.globl .F.solveBooleanConstraints
.F.solveBooleanConstraints:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.solveBooleanConstraints._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.solveBooleanConstraints._1.while.cond.0                          # ir inst 1 fin
.F.solveBooleanConstraints._1.while.cond.0:
  li t2, 65536
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.solveBooleanConstraints._2.while.body.0
  j .F.solveBooleanConstraints._6.while.exit.0                          # ir inst 5 fin
.F.solveBooleanConstraints._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.satisfiesAllBooleanConstraints
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  bnez t4, .F.solveBooleanConstraints._3.if.then.0
  j .F.solveBooleanConstraints._4.if.else.0                             # ir inst 7 fin
.F.solveBooleanConstraints._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 8 fin
# Phi connections
  j .F.solveBooleanConstraints._5.if.exit.0                             # ir inst 9 fin
.F.solveBooleanConstraints._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.solveBooleanConstraints._5.if.exit.0                             # ir inst 10 fin
.F.solveBooleanConstraints._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.solveBooleanConstraints._1.while.cond.0                          # ir inst 13 fin
.F.solveBooleanConstraints._6.while.exit.0:
  mv a0, t5
  j .F.solveBooleanConstraints.epilogue                                 # ir inst 14 fin
.F.solveBooleanConstraints.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.satisfiesAllBooleanConstraints
.F.satisfiesAllBooleanConstraints:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 16,                 range:       40(sp) -       56(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 3 / 12,        range:        8(sp) -       32(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.satisfiesAllBooleanConstraints._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  mv a1, a0
  addi t1, sp, 40
  mv a0, t1
  call .F.extractBooleanVariables
  ld a0, 0(sp)
# ir inst 2 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 3 fin
  lb t5, 0(t6)                                                          # ir inst 4 fin
  bnez t5, .F.satisfiesAllBooleanConstraints._1.lazy.then.0
  j .F.satisfiesAllBooleanConstraints._2.lazy.else.0                    # ir inst 5 fin
.F.satisfiesAllBooleanConstraints._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.satisfiesAllBooleanConstraints._6.lazy.exit.0                    # ir inst 6 fin
.F.satisfiesAllBooleanConstraints._2.lazy.else.0:
  addi t1, sp, 40
  addi t6, t1, 1                                                        # ir inst 7 fin
  lb t5, 0(t6)                                                          # ir inst 8 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
  bnez t6, .F.satisfiesAllBooleanConstraints._3.lazy.then.1
  j .F.satisfiesAllBooleanConstraints._4.lazy.else.1                    # ir inst 10 fin
.F.satisfiesAllBooleanConstraints._3.lazy.then.1:
  addi t1, sp, 40
  addi t6, t1, 2                                                        # ir inst 11 fin
  lb t5, 0(t6)                                                          # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.satisfiesAllBooleanConstraints._5.lazy.exit.1                    # ir inst 13 fin
.F.satisfiesAllBooleanConstraints._4.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.satisfiesAllBooleanConstraints._5.lazy.exit.1                    # ir inst 14 fin
.F.satisfiesAllBooleanConstraints._5.lazy.exit.1:
# Phi connections
  j .F.satisfiesAllBooleanConstraints._6.lazy.exit.0                    # ir inst 16 fin
.F.satisfiesAllBooleanConstraints._6.lazy.exit.0:
  addi t1, sp, 40
  addi t5, t1, 3                                                        # ir inst 18 fin
  lb t4, 0(t5)                                                          # ir inst 19 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 20 fin
  bnez t5, .F.satisfiesAllBooleanConstraints._7.lazy.then.2
  j .F.satisfiesAllBooleanConstraints._8.lazy.else.2                    # ir inst 21 fin
.F.satisfiesAllBooleanConstraints._7.lazy.then.2:
# Phi connections
  li t5, 1
  j .F.satisfiesAllBooleanConstraints._12.lazy.exit.2                   # ir inst 22 fin
.F.satisfiesAllBooleanConstraints._8.lazy.else.2:
  addi t1, sp, 40
  addi t5, t1, 4                                                        # ir inst 23 fin
  lb t4, 0(t5)                                                          # ir inst 24 fin
  bnez t4, .F.satisfiesAllBooleanConstraints._9.lazy.then.3
  j .F.satisfiesAllBooleanConstraints._10.lazy.else.3                   # ir inst 25 fin
.F.satisfiesAllBooleanConstraints._9.lazy.then.3:
  addi t1, sp, 40
  addi t5, t1, 5                                                        # ir inst 26 fin
  lb t4, 0(t5)                                                          # ir inst 27 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 28 fin
# Phi connections
  j .F.satisfiesAllBooleanConstraints._11.lazy.exit.3                   # ir inst 29 fin
.F.satisfiesAllBooleanConstraints._10.lazy.else.3:
# Phi connections
  li t5, 0
  j .F.satisfiesAllBooleanConstraints._11.lazy.exit.3                   # ir inst 30 fin
.F.satisfiesAllBooleanConstraints._11.lazy.exit.3:
# Phi connections
  j .F.satisfiesAllBooleanConstraints._12.lazy.exit.2                   # ir inst 32 fin
.F.satisfiesAllBooleanConstraints._12.lazy.exit.2:
  addi t1, sp, 40
  addi t4, t1, 6                                                        # ir inst 34 fin
  lb t3, 0(t4)                                                          # ir inst 35 fin
  bnez t3, .F.satisfiesAllBooleanConstraints._13.lazy.then.4
  j .F.satisfiesAllBooleanConstraints._14.lazy.else.4                   # ir inst 36 fin
.F.satisfiesAllBooleanConstraints._13.lazy.then.4:
# Phi connections
  li t4, 1
  j .F.satisfiesAllBooleanConstraints._15.lazy.exit.4                   # ir inst 37 fin
.F.satisfiesAllBooleanConstraints._14.lazy.else.4:
  addi t1, sp, 40
  addi t4, t1, 7                                                        # ir inst 38 fin
  lb t3, 0(t4)                                                          # ir inst 39 fin
# Phi connections
  mv t4, t3
  j .F.satisfiesAllBooleanConstraints._15.lazy.exit.4                   # ir inst 40 fin
.F.satisfiesAllBooleanConstraints._15.lazy.exit.4:
  bnez t4, .F.satisfiesAllBooleanConstraints._16.lazy.then.5
  j .F.satisfiesAllBooleanConstraints._20.lazy.else.5                   # ir inst 42 fin
.F.satisfiesAllBooleanConstraints._16.lazy.then.5:
  addi t1, sp, 40
  addi t4, t1, 8                                                        # ir inst 43 fin
  lb t3, 0(t4)                                                          # ir inst 44 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 45 fin
  bnez t4, .F.satisfiesAllBooleanConstraints._17.lazy.then.6
  j .F.satisfiesAllBooleanConstraints._18.lazy.else.6                   # ir inst 46 fin
.F.satisfiesAllBooleanConstraints._17.lazy.then.6:
# Phi connections
  li t4, 1
  j .F.satisfiesAllBooleanConstraints._19.lazy.exit.6                   # ir inst 47 fin
.F.satisfiesAllBooleanConstraints._18.lazy.else.6:
  addi t1, sp, 40
  addi t4, t1, 9                                                        # ir inst 48 fin
  lb t3, 0(t4)                                                          # ir inst 49 fin
# Phi connections
  mv t4, t3
  j .F.satisfiesAllBooleanConstraints._19.lazy.exit.6                   # ir inst 50 fin
.F.satisfiesAllBooleanConstraints._19.lazy.exit.6:
# Phi connections
  j .F.satisfiesAllBooleanConstraints._21.lazy.exit.5                   # ir inst 52 fin
.F.satisfiesAllBooleanConstraints._20.lazy.else.5:
# Phi connections
  li t4, 0
  j .F.satisfiesAllBooleanConstraints._21.lazy.exit.5                   # ir inst 53 fin
.F.satisfiesAllBooleanConstraints._21.lazy.exit.5:
  addi t1, sp, 40
  addi t3, t1, 10                                                       # ir inst 55 fin
  lb s11, 0(t3)                                                         # ir inst 56 fin
  addi t1, sp, 40
  addi t3, t1, 11                                                       # ir inst 57 fin
  lb s10, 0(t3)                                                         # ir inst 58 fin
  bnez s10, .F.satisfiesAllBooleanConstraints._22.lazy.then.7
  j .F.satisfiesAllBooleanConstraints._23.lazy.else.7                   # ir inst 59 fin
.F.satisfiesAllBooleanConstraints._22.lazy.then.7:
  addi t1, sp, 40
  addi t3, t1, 12                                                       # ir inst 60 fin
  lb s10, 0(t3)                                                         # ir inst 61 fin
# Phi connections
  mv t3, s10
  j .F.satisfiesAllBooleanConstraints._24.lazy.exit.7                   # ir inst 62 fin
.F.satisfiesAllBooleanConstraints._23.lazy.else.7:
# Phi connections
  li t3, 0
  j .F.satisfiesAllBooleanConstraints._24.lazy.exit.7                   # ir inst 63 fin
.F.satisfiesAllBooleanConstraints._24.lazy.exit.7:
  xor t0, s11, t3
  sltiu s10, t0, 1                                                      # ir inst 65 fin
  addi t1, sp, 40
  addi t3, t1, 13                                                       # ir inst 66 fin
  lb s11, 0(t3)                                                         # ir inst 67 fin
  bnez s11, .F.satisfiesAllBooleanConstraints._25.lazy.then.8
  j .F.satisfiesAllBooleanConstraints._26.lazy.else.8                   # ir inst 68 fin
.F.satisfiesAllBooleanConstraints._25.lazy.then.8:
# Phi connections
  li t3, 1
  j .F.satisfiesAllBooleanConstraints._27.lazy.exit.8                   # ir inst 69 fin
.F.satisfiesAllBooleanConstraints._26.lazy.else.8:
  addi t1, sp, 40
  addi t3, t1, 14                                                       # ir inst 70 fin
  lb s11, 0(t3)                                                         # ir inst 71 fin
# Phi connections
  mv t3, s11
  j .F.satisfiesAllBooleanConstraints._27.lazy.exit.8                   # ir inst 72 fin
.F.satisfiesAllBooleanConstraints._27.lazy.exit.8:
  addi t1, sp, 40
  addi s11, t1, 15                                                      # ir inst 74 fin
  lb s9, 0(s11)                                                         # ir inst 75 fin
  xor t0, t3, s9
  sltu s11, zero, t0                                                    # ir inst 76 fin
  bnez t6, .F.satisfiesAllBooleanConstraints._28.lazy.then.9
  j .F.satisfiesAllBooleanConstraints._29.lazy.else.9                   # ir inst 77 fin
.F.satisfiesAllBooleanConstraints._28.lazy.then.9:
# Phi connections
  mv t6, t5
  j .F.satisfiesAllBooleanConstraints._30.lazy.exit.9                   # ir inst 78 fin
.F.satisfiesAllBooleanConstraints._29.lazy.else.9:
# Phi connections
  li t6, 0
  j .F.satisfiesAllBooleanConstraints._30.lazy.exit.9                   # ir inst 79 fin
.F.satisfiesAllBooleanConstraints._30.lazy.exit.9:
  bnez t6, .F.satisfiesAllBooleanConstraints._31.lazy.then.10
  j .F.satisfiesAllBooleanConstraints._32.lazy.else.10                  # ir inst 81 fin
.F.satisfiesAllBooleanConstraints._31.lazy.then.10:
# Phi connections
  mv t6, t4
  j .F.satisfiesAllBooleanConstraints._33.lazy.exit.10                  # ir inst 82 fin
.F.satisfiesAllBooleanConstraints._32.lazy.else.10:
# Phi connections
  li t6, 0
  j .F.satisfiesAllBooleanConstraints._33.lazy.exit.10                  # ir inst 83 fin
.F.satisfiesAllBooleanConstraints._33.lazy.exit.10:
  bnez t6, .F.satisfiesAllBooleanConstraints._34.lazy.then.11
  j .F.satisfiesAllBooleanConstraints._35.lazy.else.11                  # ir inst 85 fin
.F.satisfiesAllBooleanConstraints._34.lazy.then.11:
# Phi connections
  mv t6, s10
  j .F.satisfiesAllBooleanConstraints._36.lazy.exit.11                  # ir inst 86 fin
.F.satisfiesAllBooleanConstraints._35.lazy.else.11:
# Phi connections
  li t6, 0
  j .F.satisfiesAllBooleanConstraints._36.lazy.exit.11                  # ir inst 87 fin
.F.satisfiesAllBooleanConstraints._36.lazy.exit.11:
  bnez t6, .F.satisfiesAllBooleanConstraints._37.lazy.then.12
  j .F.satisfiesAllBooleanConstraints._38.lazy.else.12                  # ir inst 89 fin
.F.satisfiesAllBooleanConstraints._37.lazy.then.12:
# Phi connections
  mv t6, s11
  j .F.satisfiesAllBooleanConstraints._39.lazy.exit.12                  # ir inst 90 fin
.F.satisfiesAllBooleanConstraints._38.lazy.else.12:
# Phi connections
  li t6, 0
  j .F.satisfiesAllBooleanConstraints._39.lazy.exit.12                  # ir inst 91 fin
.F.satisfiesAllBooleanConstraints._39.lazy.exit.12:
  mv a0, t6
  j .F.satisfiesAllBooleanConstraints.epilogue                          # ir inst 93 fin
.F.satisfiesAllBooleanConstraints.epilogue:
  ld ra, 32(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 64
  ret

.globl .F.extractBooleanVariables
.F.extractBooleanVariables:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 16,                 range:       24(sp) -       40(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 1 / 12,        range:        8(sp) -       16(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 8(sp)
  sd ra, 16(sp)
.F.extractBooleanVariables._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.extractBooleanVariables._1.array.cond.0                          # ir inst 3 fin
.F.extractBooleanVariables._1.array.cond.0:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.extractBooleanVariables._2.array.body.0
  j .F.extractBooleanVariables._3.array.exit.0                          # ir inst 6 fin
.F.extractBooleanVariables._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.extractBooleanVariables._1.array.cond.0                          # ir inst 10 fin
.F.extractBooleanVariables._3.array.exit.0:
# Phi connections
  mv t5, a1
  li t6, 0
  j .F.extractBooleanVariables._4.while.cond.0                          # ir inst 11 fin
.F.extractBooleanVariables._4.while.cond.0:
  li t2, 16
  slt t4, t6, t2                                                        # ir inst 14 fin
  bnez t4, .F.extractBooleanVariables._5.while.body.0
  j .F.extractBooleanVariables._6.while.exit.0                          # ir inst 15 fin
.F.extractBooleanVariables._5.while.body.0:
  mv t4, t6                                                             # ir inst 16 fin
  addi t1, sp, 24
  add t3, t1, t4                                                        # ir inst 17 fin
  andi t4, t5, 1                                                        # ir inst 18 fin
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 19 fin
  sb s11, 0(t3)                                                         # ir inst 20 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 21 fin
  addi t5, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.extractBooleanVariables._4.while.cond.0                          # ir inst 23 fin
.F.extractBooleanVariables._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 16
  addi t1, sp, 24
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 24 fin
  j .F.extractBooleanVariables.epilogue                                 # ir inst 25 fin
.F.extractBooleanVariables.epilogue:
  ld ra, 16(sp)
  ld s11, 8(sp)
  addi sp, sp, 48
  ret

.globl .F.testBooleanSearchAndFilter
.F.testBooleanSearchAndFilter:
# spill func args num: 0,             range:   100032(sp) -   100032(sp)
# local var size: 100000,             range:       24(sp) -   100024(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -100032
  add sp, sp, t0
  sd ra, 16(sp)
.F.testBooleanSearchAndFilter._0.entry.0:
# Start call preparation
  li a0, 1107
  call printlnInt
# ir inst 5 fin
  li t1, 80024
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 7 fin
# Phi connections
  li t5, 0
  j .F.testBooleanSearchAndFilter._1.array.cond.0                       # ir inst 8 fin
.F.testBooleanSearchAndFilter._1.array.cond.0:
  li t2, 5000
  slt t4, t5, t2                                                        # ir inst 10 fin
  bnez t4, .F.testBooleanSearchAndFilter._2.array.body.0
  j .F.testBooleanSearchAndFilter._3.array.exit.0                       # ir inst 11 fin
.F.testBooleanSearchAndFilter._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 13 fin
  addi t4, t5, 1                                                        # ir inst 14 fin
# Phi connections
  mv t5, t4
  j .F.testBooleanSearchAndFilter._1.array.cond.0                       # ir inst 15 fin
.F.testBooleanSearchAndFilter._3.array.exit.0:
# Start call preparation
  li a2, 20000
  li t1, 80024
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call memcpy
# ir inst 16 fin
# Start call preparation
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeSearchData
# ir inst 17 fin
# Start call preparation
  li a2, 20000
  li t1, 80024
  add t1, sp, t1
  mv a1, t1
  li t1, 20024
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 18 fin
# Start call preparation
  li t1, 20024
  add t1, sp, t1
  mv a0, t1
  call .F.performBooleanFilter
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 20000
  li t1, 80024
  add t1, sp, t1
  mv a1, t1
  li t1, 40024
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  sd t6, 0(sp)
  li t1, 40024
  add t1, sp, t1
  mv a0, t1
  call .F.performMultiCriteriaSearch
  mv t5, a0
  ld t6, 0(sp)
# ir inst 21 fin
  add t4, t6, t5                                                        # ir inst 22 fin
# Start call preparation
  sd t4, 0(sp)
  li a2, 20000
  li t1, 80024
  add t1, sp, t1
  mv a1, t1
  li t1, 60024
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t4, 0(sp)
# ir inst 23 fin
# Start call preparation
  sd t4, 0(sp)
  li t1, 60024
  add t1, sp, t1
  mv a0, t1
  call .F.performBooleanRangeSearch
  mv t6, a0
  ld t4, 0(sp)
# ir inst 24 fin
  add t5, t4, t6                                                        # ir inst 25 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 26 fin
# Start call preparation
  li a0, 1108
  call printlnInt
# ir inst 27 fin
  j .F.testBooleanSearchAndFilter.epilogue                              # ir inst 28 fin
.F.testBooleanSearchAndFilter.epilogue:
  ld ra, 16(sp)
  li t0, 100032
  add sp, sp, t0
  ret

.globl .F.initializeSearchData
.F.initializeSearchData:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.initializeSearchData._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 54321
  j .F.initializeSearchData._1.while.cond.0                             # ir inst 1 fin
.F.initializeSearchData._1.while.cond.0:
  li t2, 5000
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.initializeSearchData._2.while.body.0
  j .F.initializeSearchData._6.while.exit.0                             # ir inst 5 fin
.F.initializeSearchData._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.pm_rand_update
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 7 fin
  bnez t6, .F.initializeSearchData._3.if.then.0
  j .F.initializeSearchData._4.if.else.0                                # ir inst 8 fin
.F.initializeSearchData._3.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 9 fin
# Phi connections
  j .F.initializeSearchData._5.if.exit.0                                # ir inst 10 fin
.F.initializeSearchData._4.if.else.0:
# Phi connections
  mv t6, t4
  j .F.initializeSearchData._5.if.exit.0                                # ir inst 11 fin
.F.initializeSearchData._5.if.exit.0:
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  li t2, 10000
  rem t4, t6, t2                                                        # ir inst 15 fin
  sw t4, 0(t3)                                                          # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.initializeSearchData._1.while.cond.0                             # ir inst 18 fin
.F.initializeSearchData._6.while.exit.0:
  j .F.initializeSearchData.epilogue                                    # ir inst 19 fin
.F.initializeSearchData.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.performBooleanFilter
.F.performBooleanFilter:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 40(sp)
  sd s9, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.performBooleanFilter._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performBooleanFilter._1.while.cond.0                             # ir inst 1 fin
.F.performBooleanFilter._1.while.cond.0:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.performBooleanFilter._2.while.body.0
  j .F.performBooleanFilter._15.while.exit.0                            # ir inst 5 fin
.F.performBooleanFilter._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 1000
  slt t3, t2, t4                                                        # ir inst 9 fin
  mv t4, t6                                                             # ir inst 10 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 11 fin
  lw t4, 0(s11)                                                         # ir inst 12 fin
  li t2, 2
  rem s11, t4, t2                                                       # ir inst 13 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 14 fin
  mv s11, t6                                                            # ir inst 15 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 16 fin
  lw s11, 0(s10)                                                        # ir inst 17 fin
  li t2, 8000
  slt s10, s11, t2                                                      # ir inst 18 fin
  mv s11, t6                                                            # ir inst 19 fin
  slli t2, s11, 2
  add s9, a0, t2                                                        # ir inst 20 fin
  lw s11, 0(s9)                                                         # ir inst 21 fin
  li t2, 100
  rem s9, s11, t2                                                       # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s9
  call .F.isPrime
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 23 fin
  bnez t3, .F.performBooleanFilter._3.lazy.then.0
  j .F.performBooleanFilter._4.lazy.else.0                              # ir inst 24 fin
.F.performBooleanFilter._3.lazy.then.0:
# Phi connections
  j .F.performBooleanFilter._5.lazy.exit.0                              # ir inst 25 fin
.F.performBooleanFilter._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performBooleanFilter._5.lazy.exit.0                              # ir inst 26 fin
.F.performBooleanFilter._5.lazy.exit.0:
  bnez t4, .F.performBooleanFilter._6.lazy.then.1
  j .F.performBooleanFilter._7.lazy.else.1                              # ir inst 28 fin
.F.performBooleanFilter._6.lazy.then.1:
# Phi connections
  li t4, 1
  j .F.performBooleanFilter._11.lazy.exit.1                             # ir inst 29 fin
.F.performBooleanFilter._7.lazy.else.1:
  bnez s10, .F.performBooleanFilter._8.lazy.then.2
  j .F.performBooleanFilter._9.lazy.else.2                              # ir inst 30 fin
.F.performBooleanFilter._8.lazy.then.2:
# Phi connections
  mv t4, s11
  j .F.performBooleanFilter._10.lazy.exit.2                             # ir inst 31 fin
.F.performBooleanFilter._9.lazy.else.2:
# Phi connections
  li t4, 0
  j .F.performBooleanFilter._10.lazy.exit.2                             # ir inst 32 fin
.F.performBooleanFilter._10.lazy.exit.2:
# Phi connections
  j .F.performBooleanFilter._11.lazy.exit.1                             # ir inst 34 fin
.F.performBooleanFilter._11.lazy.exit.1:
  bnez t4, .F.performBooleanFilter._12.if.then.0
  j .F.performBooleanFilter._13.if.else.0                               # ir inst 36 fin
.F.performBooleanFilter._12.if.then.0:
  addi t4, t5, 1                                                        # ir inst 37 fin
# Phi connections
  j .F.performBooleanFilter._14.if.exit.0                               # ir inst 38 fin
.F.performBooleanFilter._13.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performBooleanFilter._14.if.exit.0                               # ir inst 39 fin
.F.performBooleanFilter._14.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performBooleanFilter._1.while.cond.0                             # ir inst 42 fin
.F.performBooleanFilter._15.while.exit.0:
  mv a0, t5
  j .F.performBooleanFilter.epilogue                                    # ir inst 43 fin
.F.performBooleanFilter.epilogue:
  ld ra, 64(sp)
  ld s10, 40(sp)
  ld s9, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.performMultiCriteriaSearch
.F.performMultiCriteriaSearch:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.performMultiCriteriaSearch._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performMultiCriteriaSearch._1.while.cond.0                       # ir inst 1 fin
.F.performMultiCriteriaSearch._1.while.cond.0:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.performMultiCriteriaSearch._2.while.body.0
  j .F.performMultiCriteriaSearch._6.while.exit.0                       # ir inst 5 fin
.F.performMultiCriteriaSearch._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.countCriteriaMet
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
  li t2, 3
  slt t0, t3, t2
  xori t4, t0, 1                                                        # ir inst 10 fin
  bnez t4, .F.performMultiCriteriaSearch._3.if.then.0
  j .F.performMultiCriteriaSearch._4.if.else.0                          # ir inst 11 fin
.F.performMultiCriteriaSearch._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 12 fin
# Phi connections
  j .F.performMultiCriteriaSearch._5.if.exit.0                          # ir inst 13 fin
.F.performMultiCriteriaSearch._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performMultiCriteriaSearch._5.if.exit.0                          # ir inst 14 fin
.F.performMultiCriteriaSearch._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performMultiCriteriaSearch._1.while.cond.0                       # ir inst 17 fin
.F.performMultiCriteriaSearch._6.while.exit.0:
  mv a0, t5
  j .F.performMultiCriteriaSearch.epilogue                              # ir inst 18 fin
.F.performMultiCriteriaSearch.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.countCriteriaMet
.F.countCriteriaMet:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.countCriteriaMet._0.entry.0:
  li t2, 3
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.countCriteriaMet._1.if.then.0
  j .F.countCriteriaMet._2.if.else.0                                    # ir inst 3 fin
.F.countCriteriaMet._1.if.then.0:
# Phi connections
  li t6, 1
  j .F.countCriteriaMet._3.if.exit.0                                    # ir inst 4 fin
.F.countCriteriaMet._2.if.else.0:
# Phi connections
  li t6, 0
  j .F.countCriteriaMet._3.if.exit.0                                    # ir inst 5 fin
.F.countCriteriaMet._3.if.exit.0:
  li t2, 5000
  slt t5, t2, a0                                                        # ir inst 7 fin
  bnez t5, .F.countCriteriaMet._4.if.then.1
  j .F.countCriteriaMet._5.if.else.1                                    # ir inst 8 fin
.F.countCriteriaMet._4.if.then.1:
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.countCriteriaMet._6.if.exit.1                                    # ir inst 10 fin
.F.countCriteriaMet._5.if.else.1:
# Phi connections
  j .F.countCriteriaMet._6.if.exit.1                                    # ir inst 11 fin
.F.countCriteriaMet._6.if.exit.1:
  li t2, 7
  rem t5, a0, t2                                                        # ir inst 13 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 14 fin
  bnez t4, .F.countCriteriaMet._7.if.then.2
  j .F.countCriteriaMet._8.if.else.2                                    # ir inst 15 fin
.F.countCriteriaMet._7.if.then.2:
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.countCriteriaMet._9.if.exit.2                                    # ir inst 17 fin
.F.countCriteriaMet._8.if.else.2:
# Phi connections
  j .F.countCriteriaMet._9.if.exit.2                                    # ir inst 18 fin
.F.countCriteriaMet._9.if.exit.2:
  li t2, 2000
  slt t5, a0, t2                                                        # ir inst 20 fin
  bnez t5, .F.countCriteriaMet._10.if.then.3
  j .F.countCriteriaMet._11.if.else.3                                   # ir inst 21 fin
.F.countCriteriaMet._10.if.then.3:
  addi t5, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.countCriteriaMet._12.if.exit.3                                   # ir inst 23 fin
.F.countCriteriaMet._11.if.else.3:
# Phi connections
  j .F.countCriteriaMet._12.if.exit.3                                   # ir inst 24 fin
.F.countCriteriaMet._12.if.exit.3:
  li t2, 100
  rem t5, a0, t2                                                        # ir inst 26 fin
  li t2, 50
  slt t4, t2, t5                                                        # ir inst 27 fin
  bnez t4, .F.countCriteriaMet._13.if.then.4
  j .F.countCriteriaMet._14.if.else.4                                   # ir inst 28 fin
.F.countCriteriaMet._13.if.then.4:
  addi t5, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t5
  j .F.countCriteriaMet._15.if.exit.4                                   # ir inst 30 fin
.F.countCriteriaMet._14.if.else.4:
# Phi connections
  j .F.countCriteriaMet._15.if.exit.4                                   # ir inst 31 fin
.F.countCriteriaMet._15.if.exit.4:
  mv a0, t6
  j .F.countCriteriaMet.epilogue                                        # ir inst 33 fin
.F.countCriteriaMet.epilogue:
  ret

.globl .F.performBooleanRangeSearch
.F.performBooleanRangeSearch:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.performBooleanRangeSearch._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performBooleanRangeSearch._1.while.cond.0                        # ir inst 1 fin
.F.performBooleanRangeSearch._1.while.cond.0:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.performBooleanRangeSearch._2.while.body.0
  j .F.performBooleanRangeSearch._24.while.exit.0                       # ir inst 5 fin
.F.performBooleanRangeSearch._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 1000
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.performBooleanRangeSearch._3.lazy.then.0
  j .F.performBooleanRangeSearch._4.lazy.else.0                         # ir inst 10 fin
.F.performBooleanRangeSearch._3.lazy.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
  li t2, 3000
  slt t0, t2, t4
  xori t3, t0, 1                                                        # ir inst 14 fin
# Phi connections
  mv t4, t3
  j .F.performBooleanRangeSearch._5.lazy.exit.0                         # ir inst 15 fin
.F.performBooleanRangeSearch._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performBooleanRangeSearch._5.lazy.exit.0                         # ir inst 16 fin
.F.performBooleanRangeSearch._5.lazy.exit.0:
  mv t3, t6                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  lw t3, 0(s11)                                                         # ir inst 20 fin
  li t2, 6000
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 21 fin
  bnez s11, .F.performBooleanRangeSearch._6.lazy.then.1
  j .F.performBooleanRangeSearch._7.lazy.else.1                         # ir inst 22 fin
.F.performBooleanRangeSearch._6.lazy.then.1:
  mv t3, t6                                                             # ir inst 23 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 24 fin
  lw t3, 0(s11)                                                         # ir inst 25 fin
  li t2, 8000
  slt t0, t2, t3
  xori s11, t0, 1                                                       # ir inst 26 fin
# Phi connections
  mv t3, s11
  j .F.performBooleanRangeSearch._8.lazy.exit.1                         # ir inst 27 fin
.F.performBooleanRangeSearch._7.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.performBooleanRangeSearch._8.lazy.exit.1                         # ir inst 28 fin
.F.performBooleanRangeSearch._8.lazy.exit.1:
  mv s11, t6                                                            # ir inst 30 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 31 fin
  lw s11, 0(s10)                                                        # ir inst 32 fin
  li t2, 500
  slt t0, s11, t2
  xori s10, t0, 1                                                       # ir inst 33 fin
  bnez s10, .F.performBooleanRangeSearch._9.lazy.then.2
  j .F.performBooleanRangeSearch._10.lazy.else.2                        # ir inst 34 fin
.F.performBooleanRangeSearch._9.lazy.then.2:
  mv s11, t6                                                            # ir inst 35 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 36 fin
  lw s11, 0(s10)                                                        # ir inst 37 fin
  li t2, 1500
  slt t0, t2, s11
  xori s10, t0, 1                                                       # ir inst 38 fin
# Phi connections
  mv s11, s10
  j .F.performBooleanRangeSearch._11.lazy.exit.2                        # ir inst 39 fin
.F.performBooleanRangeSearch._10.lazy.else.2:
# Phi connections
  li s11, 0
  j .F.performBooleanRangeSearch._11.lazy.exit.2                        # ir inst 40 fin
.F.performBooleanRangeSearch._11.lazy.exit.2:
  bnez t4, .F.performBooleanRangeSearch._12.lazy.then.3
  j .F.performBooleanRangeSearch._13.lazy.else.3                        # ir inst 42 fin
.F.performBooleanRangeSearch._12.lazy.then.3:
# Phi connections
  li t4, 1
  j .F.performBooleanRangeSearch._14.lazy.exit.3                        # ir inst 43 fin
.F.performBooleanRangeSearch._13.lazy.else.3:
# Phi connections
  mv t4, t3
  j .F.performBooleanRangeSearch._14.lazy.exit.3                        # ir inst 44 fin
.F.performBooleanRangeSearch._14.lazy.exit.3:
  bnez t4, .F.performBooleanRangeSearch._15.lazy.then.4
  j .F.performBooleanRangeSearch._16.lazy.else.4                        # ir inst 46 fin
.F.performBooleanRangeSearch._15.lazy.then.4:
# Phi connections
  li t4, 1
  j .F.performBooleanRangeSearch._20.lazy.exit.4                        # ir inst 47 fin
.F.performBooleanRangeSearch._16.lazy.else.4:
  bnez s11, .F.performBooleanRangeSearch._17.lazy.then.5
  j .F.performBooleanRangeSearch._18.lazy.else.5                        # ir inst 48 fin
.F.performBooleanRangeSearch._17.lazy.then.5:
  mv t4, t6                                                             # ir inst 49 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 50 fin
  lw t4, 0(t3)                                                          # ir inst 51 fin
  li t2, 2
  rem t3, t4, t2                                                        # ir inst 52 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 53 fin
# Phi connections
  j .F.performBooleanRangeSearch._19.lazy.exit.5                        # ir inst 54 fin
.F.performBooleanRangeSearch._18.lazy.else.5:
# Phi connections
  li t4, 0
  j .F.performBooleanRangeSearch._19.lazy.exit.5                        # ir inst 55 fin
.F.performBooleanRangeSearch._19.lazy.exit.5:
# Phi connections
  j .F.performBooleanRangeSearch._20.lazy.exit.4                        # ir inst 57 fin
.F.performBooleanRangeSearch._20.lazy.exit.4:
  bnez t4, .F.performBooleanRangeSearch._21.if.then.0
  j .F.performBooleanRangeSearch._22.if.else.0                          # ir inst 59 fin
.F.performBooleanRangeSearch._21.if.then.0:
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  j .F.performBooleanRangeSearch._23.if.exit.0                          # ir inst 61 fin
.F.performBooleanRangeSearch._22.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performBooleanRangeSearch._23.if.exit.0                          # ir inst 62 fin
.F.performBooleanRangeSearch._23.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 64 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performBooleanRangeSearch._1.while.cond.0                        # ir inst 65 fin
.F.performBooleanRangeSearch._24.while.exit.0:
  mv a0, t5
  j .F.performBooleanRangeSearch.epilogue                               # ir inst 66 fin
.F.performBooleanRangeSearch.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testBooleanStateMachine
.F.testBooleanStateMachine:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.testBooleanStateMachine._0.entry.0:
# Start call preparation
  li a0, 1109
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.simulateTrafficLightController
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  call .F.simulateDigitalCircuit
  mv t5, a0
  ld t6, 0(sp)
# ir inst 3 fin
  add t4, t6, t5                                                        # ir inst 4 fin
# Start call preparation
  sd t4, 0(sp)
  call .F.simulateBooleanAutomaton
  mv t6, a0
  ld t4, 0(sp)
# ir inst 5 fin
  add t5, t4, t6                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 1110
  call printlnInt
# ir inst 8 fin
  j .F.testBooleanStateMachine.epilogue                                 # ir inst 9 fin
.F.testBooleanStateMachine.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.simulateTrafficLightController
.F.simulateTrafficLightController:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 32(sp)
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.simulateTrafficLightController._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.simulateTrafficLightController._1.while.cond.0                   # ir inst 1 fin
.F.simulateTrafficLightController._1.while.cond.0:
  li t2, 10000
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.simulateTrafficLightController._2.while.body.0
  j .F.simulateTrafficLightController._6.while.exit.0                   # ir inst 6 fin
.F.simulateTrafficLightController._2.while.body.0:
  li t2, 100
  rem t3, t6, t2                                                        # ir inst 7 fin
  li t2, 10
  slt s11, t3, t2                                                       # ir inst 8 fin
  li t2, 500
  rem t3, t6, t2                                                        # ir inst 9 fin
  li t2, 5
  slt s10, t3, t2                                                       # ir inst 10 fin
  li t2, 50
  rem t3, t6, t2                                                        # ir inst 11 fin
  li t2, 25
  slt s9, t3, t2                                                        # ir inst 12 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a4, t6
  mv a3, s9
  mv a2, s10
  mv a1, s11
  mv a0, t4
  call .F.getNextTrafficState
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 13 fin
  xor t0, t3, t4
  sltu s11, zero, t0                                                    # ir inst 14 fin
  bnez s11, .F.simulateTrafficLightController._3.if.then.0
  j .F.simulateTrafficLightController._4.if.else.0                      # ir inst 15 fin
.F.simulateTrafficLightController._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 16 fin
# Phi connections
  j .F.simulateTrafficLightController._5.if.exit.0                      # ir inst 17 fin
.F.simulateTrafficLightController._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.simulateTrafficLightController._5.if.exit.0                      # ir inst 18 fin
.F.simulateTrafficLightController._5.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 20 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.simulateTrafficLightController._1.while.cond.0                   # ir inst 21 fin
.F.simulateTrafficLightController._6.while.exit.0:
  mv a0, t5
  j .F.simulateTrafficLightController.epilogue                          # ir inst 22 fin
.F.simulateTrafficLightController.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.getNextTrafficState
.F.getNextTrafficState:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.getNextTrafficState._0.entry.0:
  bnez a2, .F.getNextTrafficState._1.if.then.0
  j .F.getNextTrafficState._2.if.else.0                                 # ir inst 1 fin
.F.getNextTrafficState._1.if.then.0:
  li a0, 1
  j .F.getNextTrafficState.epilogue                                     # ir inst 2 fin
.F.getNextTrafficState._2.if.else.0:
  j .F.getNextTrafficState._3.if.exit.0                                 # ir inst 3 fin
.F.getNextTrafficState._3.if.exit.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 4 fin
  bnez t6, .F.getNextTrafficState._4.if.then.1
  j .F.getNextTrafficState._14.if.else.1                                # ir inst 5 fin
.F.getNextTrafficState._4.if.then.1:
  li t2, 60
  rem t6, a4, t2                                                        # ir inst 6 fin
  li t2, 30
  slt t5, t2, t6                                                        # ir inst 7 fin
  bnez t5, .F.getNextTrafficState._5.lazy.then.0
  j .F.getNextTrafficState._6.lazy.else.0                               # ir inst 8 fin
.F.getNextTrafficState._5.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.getNextTrafficState._10.lazy.exit.0                              # ir inst 9 fin
.F.getNextTrafficState._6.lazy.else.0:
  bnez a1, .F.getNextTrafficState._7.lazy.then.1
  j .F.getNextTrafficState._8.lazy.else.1                               # ir inst 10 fin
.F.getNextTrafficState._7.lazy.then.1:
  li t2, 0
  xor t0, a3, t2
  sltiu t6, t0, 1                                                       # ir inst 11 fin
# Phi connections
  j .F.getNextTrafficState._9.lazy.exit.1                               # ir inst 12 fin
.F.getNextTrafficState._8.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.getNextTrafficState._9.lazy.exit.1                               # ir inst 13 fin
.F.getNextTrafficState._9.lazy.exit.1:
# Phi connections
  j .F.getNextTrafficState._10.lazy.exit.0                              # ir inst 15 fin
.F.getNextTrafficState._10.lazy.exit.0:
  bnez t6, .F.getNextTrafficState._11.if.then.2
  j .F.getNextTrafficState._12.if.else.2                                # ir inst 17 fin
.F.getNextTrafficState._11.if.then.2:
  li a0, 1
  j .F.getNextTrafficState.epilogue                                     # ir inst 18 fin
.F.getNextTrafficState._12.if.else.2:
  j .F.getNextTrafficState._13.if.exit.2                                # ir inst 19 fin
.F.getNextTrafficState._13.if.exit.2:
  j .F.getNextTrafficState._33.if.exit.1                                # ir inst 20 fin
.F.getNextTrafficState._14.if.else.1:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 21 fin
  bnez t6, .F.getNextTrafficState._15.if.then.3
  j .F.getNextTrafficState._25.if.else.3                                # ir inst 22 fin
.F.getNextTrafficState._15.if.then.3:
  li t2, 60
  rem t6, a4, t2                                                        # ir inst 23 fin
  li t2, 50
  slt t5, t2, t6                                                        # ir inst 24 fin
  bnez t5, .F.getNextTrafficState._16.lazy.then.2
  j .F.getNextTrafficState._17.lazy.else.2                              # ir inst 25 fin
.F.getNextTrafficState._16.lazy.then.2:
# Phi connections
  li t6, 1
  j .F.getNextTrafficState._21.lazy.exit.2                              # ir inst 26 fin
.F.getNextTrafficState._17.lazy.else.2:
  bnez a1, .F.getNextTrafficState._18.lazy.then.3
  j .F.getNextTrafficState._19.lazy.else.3                              # ir inst 27 fin
.F.getNextTrafficState._18.lazy.then.3:
  li t2, 120
  rem t6, a4, t2                                                        # ir inst 28 fin
  li t2, 60
  slt t5, t2, t6                                                        # ir inst 29 fin
# Phi connections
  mv t6, t5
  j .F.getNextTrafficState._20.lazy.exit.3                              # ir inst 30 fin
.F.getNextTrafficState._19.lazy.else.3:
# Phi connections
  li t6, 0
  j .F.getNextTrafficState._20.lazy.exit.3                              # ir inst 31 fin
.F.getNextTrafficState._20.lazy.exit.3:
# Phi connections
  j .F.getNextTrafficState._21.lazy.exit.2                              # ir inst 33 fin
.F.getNextTrafficState._21.lazy.exit.2:
  bnez t6, .F.getNextTrafficState._22.if.then.4
  j .F.getNextTrafficState._23.if.else.4                                # ir inst 35 fin
.F.getNextTrafficState._22.if.then.4:
  li a0, 2
  j .F.getNextTrafficState.epilogue                                     # ir inst 36 fin
.F.getNextTrafficState._23.if.else.4:
  j .F.getNextTrafficState._24.if.exit.4                                # ir inst 37 fin
.F.getNextTrafficState._24.if.exit.4:
  j .F.getNextTrafficState._32.if.exit.3                                # ir inst 38 fin
.F.getNextTrafficState._25.if.else.3:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 39 fin
  bnez t6, .F.getNextTrafficState._26.if.then.5
  j .F.getNextTrafficState._30.if.else.5                                # ir inst 40 fin
.F.getNextTrafficState._26.if.then.5:
  li t2, 60
  rem t6, a4, t2                                                        # ir inst 41 fin
  li t2, 55
  slt t5, t2, t6                                                        # ir inst 42 fin
  bnez t5, .F.getNextTrafficState._27.if.then.6
  j .F.getNextTrafficState._28.if.else.6                                # ir inst 43 fin
.F.getNextTrafficState._27.if.then.6:
  li a0, 0
  j .F.getNextTrafficState.epilogue                                     # ir inst 44 fin
.F.getNextTrafficState._28.if.else.6:
  j .F.getNextTrafficState._29.if.exit.6                                # ir inst 45 fin
.F.getNextTrafficState._29.if.exit.6:
  j .F.getNextTrafficState._31.if.exit.5                                # ir inst 46 fin
.F.getNextTrafficState._30.if.else.5:
  j .F.getNextTrafficState._31.if.exit.5                                # ir inst 47 fin
.F.getNextTrafficState._31.if.exit.5:
  j .F.getNextTrafficState._32.if.exit.3                                # ir inst 48 fin
.F.getNextTrafficState._32.if.exit.3:
  j .F.getNextTrafficState._33.if.exit.1                                # ir inst 49 fin
.F.getNextTrafficState._33.if.exit.1:
  j .F.getNextTrafficState.epilogue                                     # ir inst 50 fin
.F.getNextTrafficState.epilogue:
  ret

.globl .F.simulateDigitalCircuit
.F.simulateDigitalCircuit:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 0,                range:       56(sp) -       56(sp)
# callee save reg num: 7 / 12,        range:        0(sp) -       56(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s5, 0(sp)
  sd s11, 8(sp)
  sd s10, 16(sp)
  sd s8, 24(sp)
  sd s7, 32(sp)
  sd s9, 40(sp)
  sd s6, 48(sp)
.F.simulateDigitalCircuit._0.entry.0:
# Phi connections
  li s10, 0
  li s11, 0
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.simulateDigitalCircuit._1.while.cond.0                           # ir inst 1 fin
.F.simulateDigitalCircuit._1.while.cond.0:
  li t2, 1000
  slt s9, t5, t2                                                        # ir inst 8 fin
  bnez s9, .F.simulateDigitalCircuit._2.while.body.0
  j .F.simulateDigitalCircuit._27.while.exit.0                          # ir inst 9 fin
.F.simulateDigitalCircuit._2.while.body.0:
  li t2, 4
  rem s9, t5, t2                                                        # ir inst 10 fin
  li t2, 2
  slt s8, s9, t2                                                        # ir inst 11 fin
  li t2, 8
  rem s9, t5, t2                                                        # ir inst 12 fin
  li t2, 4
  slt s7, s9, t2                                                        # ir inst 13 fin
  li t2, 16
  rem s9, t5, t2                                                        # ir inst 14 fin
  li t2, 8
  slt s6, s9, t2                                                        # ir inst 15 fin
  bnez s8, .F.simulateDigitalCircuit._3.lazy.then.0
  j .F.simulateDigitalCircuit._4.lazy.else.0                            # ir inst 16 fin
.F.simulateDigitalCircuit._3.lazy.then.0:
# Phi connections
  mv s9, s7
  j .F.simulateDigitalCircuit._5.lazy.exit.0                            # ir inst 17 fin
.F.simulateDigitalCircuit._4.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.simulateDigitalCircuit._5.lazy.exit.0                            # ir inst 18 fin
.F.simulateDigitalCircuit._5.lazy.exit.0:
  bnez s7, .F.simulateDigitalCircuit._6.lazy.then.1
  j .F.simulateDigitalCircuit._7.lazy.else.1                            # ir inst 20 fin
.F.simulateDigitalCircuit._6.lazy.then.1:
# Phi connections
  li s8, 1
  j .F.simulateDigitalCircuit._8.lazy.exit.1                            # ir inst 21 fin
.F.simulateDigitalCircuit._7.lazy.else.1:
# Phi connections
  mv s8, s6
  j .F.simulateDigitalCircuit._8.lazy.exit.1                            # ir inst 22 fin
.F.simulateDigitalCircuit._8.lazy.exit.1:
  xor t0, s9, s8
  sltu s7, zero, t0                                                     # ir inst 24 fin
  bnez s9, .F.simulateDigitalCircuit._9.lazy.then.2
  j .F.simulateDigitalCircuit._10.lazy.else.2                           # ir inst 25 fin
.F.simulateDigitalCircuit._9.lazy.then.2:
# Phi connections
  mv s6, s8
  j .F.simulateDigitalCircuit._11.lazy.exit.2                           # ir inst 26 fin
.F.simulateDigitalCircuit._10.lazy.else.2:
# Phi connections
  li s6, 0
  j .F.simulateDigitalCircuit._11.lazy.exit.2                           # ir inst 27 fin
.F.simulateDigitalCircuit._11.lazy.exit.2:
  bnez s6, .F.simulateDigitalCircuit._12.lazy.then.3
  j .F.simulateDigitalCircuit._13.lazy.else.3                           # ir inst 29 fin
.F.simulateDigitalCircuit._12.lazy.then.3:
# Phi connections
  mv s6, s7
  j .F.simulateDigitalCircuit._14.lazy.exit.3                           # ir inst 30 fin
.F.simulateDigitalCircuit._13.lazy.else.3:
# Phi connections
  li s6, 0
  j .F.simulateDigitalCircuit._14.lazy.exit.3                           # ir inst 31 fin
.F.simulateDigitalCircuit._14.lazy.exit.3:
  li t2, 0
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 33 fin
  xor t0, t4, s9
  sltu s6, zero, t0                                                     # ir inst 34 fin
  bnez s6, .F.simulateDigitalCircuit._15.if.then.0
  j .F.simulateDigitalCircuit._16.if.else.0                             # ir inst 35 fin
.F.simulateDigitalCircuit._15.if.then.0:
  addi t4, t6, 1                                                        # ir inst 36 fin
# Phi connections
  j .F.simulateDigitalCircuit._17.if.exit.0                             # ir inst 37 fin
.F.simulateDigitalCircuit._16.if.else.0:
# Phi connections
  mv t4, t6
  j .F.simulateDigitalCircuit._17.if.exit.0                             # ir inst 38 fin
.F.simulateDigitalCircuit._17.if.exit.0:
  xor t0, t3, s8
  sltu s6, zero, t0                                                     # ir inst 40 fin
  bnez s6, .F.simulateDigitalCircuit._18.if.then.1
  j .F.simulateDigitalCircuit._19.if.else.1                             # ir inst 41 fin
.F.simulateDigitalCircuit._18.if.then.1:
  addi t3, t4, 1                                                        # ir inst 42 fin
# Phi connections
  mv t4, t3
  j .F.simulateDigitalCircuit._20.if.exit.1                             # ir inst 43 fin
.F.simulateDigitalCircuit._19.if.else.1:
# Phi connections
  j .F.simulateDigitalCircuit._20.if.exit.1                             # ir inst 44 fin
.F.simulateDigitalCircuit._20.if.exit.1:
  xor t0, s11, s7
  sltu t3, zero, t0                                                     # ir inst 46 fin
  bnez t3, .F.simulateDigitalCircuit._21.if.then.2
  j .F.simulateDigitalCircuit._22.if.else.2                             # ir inst 47 fin
.F.simulateDigitalCircuit._21.if.then.2:
  addi t3, t4, 1                                                        # ir inst 48 fin
# Phi connections
  mv t4, t3
  j .F.simulateDigitalCircuit._23.if.exit.2                             # ir inst 49 fin
.F.simulateDigitalCircuit._22.if.else.2:
# Phi connections
  j .F.simulateDigitalCircuit._23.if.exit.2                             # ir inst 50 fin
.F.simulateDigitalCircuit._23.if.exit.2:
  xor t0, s10, s5
  sltu t3, zero, t0                                                     # ir inst 52 fin
  bnez t3, .F.simulateDigitalCircuit._24.if.then.3
  j .F.simulateDigitalCircuit._25.if.else.3                             # ir inst 53 fin
.F.simulateDigitalCircuit._24.if.then.3:
  addi t3, t4, 1                                                        # ir inst 54 fin
# Phi connections
  mv t4, t3
  j .F.simulateDigitalCircuit._26.if.exit.3                             # ir inst 55 fin
.F.simulateDigitalCircuit._25.if.else.3:
# Phi connections
  j .F.simulateDigitalCircuit._26.if.exit.3                             # ir inst 56 fin
.F.simulateDigitalCircuit._26.if.exit.3:
  addi t3, t5, 1                                                        # ir inst 58 fin
# Phi connections
  mv s10, s5
  mv s11, s7
  mv t5, t3
  mv t6, t4
  mv t3, s8
  mv t4, s9
  j .F.simulateDigitalCircuit._1.while.cond.0                           # ir inst 59 fin
.F.simulateDigitalCircuit._27.while.exit.0:
  mv a0, t6
  j .F.simulateDigitalCircuit.epilogue                                  # ir inst 60 fin
.F.simulateDigitalCircuit.epilogue:
  ld s5, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  ld s8, 24(sp)
  ld s7, 32(sp)
  ld s9, 40(sp)
  ld s6, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.simulateBooleanAutomaton
.F.simulateBooleanAutomaton:
# spill func args num: 0,             range:      240(sp) -      240(sp)
# local var size: 200,                range:       40(sp) -      240(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -240
  sd s7, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s9, 24(sp)
  sd s11, 32(sp)
.F.simulateBooleanAutomaton._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.simulateBooleanAutomaton._1.array.cond.0                         # ir inst 3 fin
.F.simulateBooleanAutomaton._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.simulateBooleanAutomaton._2.array.body.0
  j .F.simulateBooleanAutomaton._3.array.exit.0                         # ir inst 6 fin
.F.simulateBooleanAutomaton._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.simulateBooleanAutomaton._1.array.cond.0                         # ir inst 10 fin
.F.simulateBooleanAutomaton._3.array.exit.0:
  addi t1, sp, 40
  addi t6, t1, 49                                                       # ir inst 11 fin
  li t1, 1
  sb t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 40
  addi t6, t1, 50                                                       # ir inst 13 fin
  li t1, 1
  sb t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 40
  addi t6, t1, 51                                                       # ir inst 15 fin
  li t1, 1
  sb t1, 0(t6)                                                          # ir inst 16 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulateBooleanAutomaton._4.while.cond.0                         # ir inst 17 fin
.F.simulateBooleanAutomaton._4.while.cond.0:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 20 fin
  bnez t4, .F.simulateBooleanAutomaton._5.while.body.0
  j .F.simulateBooleanAutomaton._51.while.exit.0                        # ir inst 21 fin
.F.simulateBooleanAutomaton._5.while.body.0:
  addi t1, sp, 140
  addi t4, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t3, 0
  j .F.simulateBooleanAutomaton._6.array.cond.1                         # ir inst 24 fin
.F.simulateBooleanAutomaton._6.array.cond.1:
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 26 fin
  bnez s11, .F.simulateBooleanAutomaton._7.array.body.1
  j .F.simulateBooleanAutomaton._8.array.exit.1                         # ir inst 27 fin
.F.simulateBooleanAutomaton._7.array.body.1:
  add s11, t4, t3                                                       # ir inst 28 fin
  li t1, 0
  sb t1, 0(s11)                                                         # ir inst 29 fin
  addi s11, t3, 1                                                       # ir inst 30 fin
# Phi connections
  mv t3, s11
  j .F.simulateBooleanAutomaton._6.array.cond.1                         # ir inst 31 fin
.F.simulateBooleanAutomaton._8.array.exit.1:
# Phi connections
  li t3, 1
  li t4, 0
  j .F.simulateBooleanAutomaton._9.while.cond.1                         # ir inst 32 fin
.F.simulateBooleanAutomaton._9.while.cond.1:
  li t2, 99
  slt s11, t3, t2                                                       # ir inst 35 fin
  bnez s11, .F.simulateBooleanAutomaton._10.while.body.1
  j .F.simulateBooleanAutomaton._47.while.exit.1                        # ir inst 36 fin
.F.simulateBooleanAutomaton._10.while.body.1:
  mv s11, t3                                                            # ir inst 37 fin
  addi s10, s11, -1                                                     # ir inst 38 fin
  addi t1, sp, 40
  add s11, t1, s10                                                      # ir inst 39 fin
  lb s10, 0(s11)                                                        # ir inst 40 fin
  mv s11, t3                                                            # ir inst 41 fin
  addi t1, sp, 40
  add s9, t1, s11                                                       # ir inst 42 fin
  lb s11, 0(s9)                                                         # ir inst 43 fin
  mv s9, t3                                                             # ir inst 44 fin
  addi s8, s9, 1                                                        # ir inst 45 fin
  addi t1, sp, 40
  add s9, t1, s8                                                        # ir inst 46 fin
  lb s8, 0(s9)                                                          # ir inst 47 fin
  mv s9, t3                                                             # ir inst 48 fin
  addi t1, sp, 140
  add s7, t1, s9                                                        # ir inst 49 fin
  bnez s10, .F.simulateBooleanAutomaton._11.lazy.then.0
  j .F.simulateBooleanAutomaton._12.lazy.else.0                         # ir inst 50 fin
.F.simulateBooleanAutomaton._11.lazy.then.0:
  li t2, 0
  xor t0, s11, t2
  sltiu s9, t0, 1                                                       # ir inst 51 fin
# Phi connections
  j .F.simulateBooleanAutomaton._13.lazy.exit.0                         # ir inst 52 fin
.F.simulateBooleanAutomaton._12.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.simulateBooleanAutomaton._13.lazy.exit.0                         # ir inst 53 fin
.F.simulateBooleanAutomaton._13.lazy.exit.0:
  bnez s9, .F.simulateBooleanAutomaton._14.lazy.then.1
  j .F.simulateBooleanAutomaton._15.lazy.else.1                         # ir inst 55 fin
.F.simulateBooleanAutomaton._14.lazy.then.1:
  li t2, 0
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 56 fin
# Phi connections
  j .F.simulateBooleanAutomaton._16.lazy.exit.1                         # ir inst 57 fin
.F.simulateBooleanAutomaton._15.lazy.else.1:
# Phi connections
  li s9, 0
  j .F.simulateBooleanAutomaton._16.lazy.exit.1                         # ir inst 58 fin
.F.simulateBooleanAutomaton._16.lazy.exit.1:
  bnez s9, .F.simulateBooleanAutomaton._17.lazy.then.2
  j .F.simulateBooleanAutomaton._18.lazy.else.2                         # ir inst 60 fin
.F.simulateBooleanAutomaton._17.lazy.then.2:
# Phi connections
  li s9, 1
  j .F.simulateBooleanAutomaton._25.lazy.exit.2                         # ir inst 61 fin
.F.simulateBooleanAutomaton._18.lazy.else.2:
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 62 fin
  bnez s9, .F.simulateBooleanAutomaton._19.lazy.then.3
  j .F.simulateBooleanAutomaton._20.lazy.else.3                         # ir inst 63 fin
.F.simulateBooleanAutomaton._19.lazy.then.3:
# Phi connections
  mv s9, s11
  j .F.simulateBooleanAutomaton._21.lazy.exit.3                         # ir inst 64 fin
.F.simulateBooleanAutomaton._20.lazy.else.3:
# Phi connections
  li s9, 0
  j .F.simulateBooleanAutomaton._21.lazy.exit.3                         # ir inst 65 fin
.F.simulateBooleanAutomaton._21.lazy.exit.3:
  bnez s9, .F.simulateBooleanAutomaton._22.lazy.then.4
  j .F.simulateBooleanAutomaton._23.lazy.else.4                         # ir inst 67 fin
.F.simulateBooleanAutomaton._22.lazy.then.4:
  li t2, 0
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 68 fin
# Phi connections
  j .F.simulateBooleanAutomaton._24.lazy.exit.4                         # ir inst 69 fin
.F.simulateBooleanAutomaton._23.lazy.else.4:
# Phi connections
  li s9, 0
  j .F.simulateBooleanAutomaton._24.lazy.exit.4                         # ir inst 70 fin
.F.simulateBooleanAutomaton._24.lazy.exit.4:
# Phi connections
  j .F.simulateBooleanAutomaton._25.lazy.exit.2                         # ir inst 72 fin
.F.simulateBooleanAutomaton._25.lazy.exit.2:
  bnez s9, .F.simulateBooleanAutomaton._26.lazy.then.5
  j .F.simulateBooleanAutomaton._27.lazy.else.5                         # ir inst 74 fin
.F.simulateBooleanAutomaton._26.lazy.then.5:
# Phi connections
  li s9, 1
  j .F.simulateBooleanAutomaton._34.lazy.exit.5                         # ir inst 75 fin
.F.simulateBooleanAutomaton._27.lazy.else.5:
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 76 fin
  bnez s9, .F.simulateBooleanAutomaton._28.lazy.then.6
  j .F.simulateBooleanAutomaton._29.lazy.else.6                         # ir inst 77 fin
.F.simulateBooleanAutomaton._28.lazy.then.6:
  li t2, 0
  xor t0, s11, t2
  sltiu s9, t0, 1                                                       # ir inst 78 fin
# Phi connections
  j .F.simulateBooleanAutomaton._30.lazy.exit.6                         # ir inst 79 fin
.F.simulateBooleanAutomaton._29.lazy.else.6:
# Phi connections
  li s9, 0
  j .F.simulateBooleanAutomaton._30.lazy.exit.6                         # ir inst 80 fin
.F.simulateBooleanAutomaton._30.lazy.exit.6:
  bnez s9, .F.simulateBooleanAutomaton._31.lazy.then.7
  j .F.simulateBooleanAutomaton._32.lazy.else.7                         # ir inst 82 fin
.F.simulateBooleanAutomaton._31.lazy.then.7:
# Phi connections
  mv s9, s8
  j .F.simulateBooleanAutomaton._33.lazy.exit.7                         # ir inst 83 fin
.F.simulateBooleanAutomaton._32.lazy.else.7:
# Phi connections
  li s9, 0
  j .F.simulateBooleanAutomaton._33.lazy.exit.7                         # ir inst 84 fin
.F.simulateBooleanAutomaton._33.lazy.exit.7:
# Phi connections
  j .F.simulateBooleanAutomaton._34.lazy.exit.5                         # ir inst 86 fin
.F.simulateBooleanAutomaton._34.lazy.exit.5:
  bnez s9, .F.simulateBooleanAutomaton._35.lazy.then.8
  j .F.simulateBooleanAutomaton._36.lazy.else.8                         # ir inst 88 fin
.F.simulateBooleanAutomaton._35.lazy.then.8:
# Phi connections
  li s11, 1
  j .F.simulateBooleanAutomaton._43.lazy.exit.8                         # ir inst 89 fin
.F.simulateBooleanAutomaton._36.lazy.else.8:
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 90 fin
  bnez s9, .F.simulateBooleanAutomaton._37.lazy.then.9
  j .F.simulateBooleanAutomaton._38.lazy.else.9                         # ir inst 91 fin
.F.simulateBooleanAutomaton._37.lazy.then.9:
# Phi connections
  j .F.simulateBooleanAutomaton._39.lazy.exit.9                         # ir inst 92 fin
.F.simulateBooleanAutomaton._38.lazy.else.9:
# Phi connections
  li s11, 0
  j .F.simulateBooleanAutomaton._39.lazy.exit.9                         # ir inst 93 fin
.F.simulateBooleanAutomaton._39.lazy.exit.9:
  bnez s11, .F.simulateBooleanAutomaton._40.lazy.then.10
  j .F.simulateBooleanAutomaton._41.lazy.else.10                        # ir inst 95 fin
.F.simulateBooleanAutomaton._40.lazy.then.10:
# Phi connections
  mv s11, s8
  j .F.simulateBooleanAutomaton._42.lazy.exit.10                        # ir inst 96 fin
.F.simulateBooleanAutomaton._41.lazy.else.10:
# Phi connections
  li s11, 0
  j .F.simulateBooleanAutomaton._42.lazy.exit.10                        # ir inst 97 fin
.F.simulateBooleanAutomaton._42.lazy.exit.10:
# Phi connections
  j .F.simulateBooleanAutomaton._43.lazy.exit.8                         # ir inst 99 fin
.F.simulateBooleanAutomaton._43.lazy.exit.8:
  sb s11, 0(s7)                                                         # ir inst 101 fin
  mv s11, t3                                                            # ir inst 102 fin
  addi t1, sp, 140
  add s10, t1, s11                                                      # ir inst 103 fin
  lb s11, 0(s10)                                                        # ir inst 104 fin
  mv s10, t3                                                            # ir inst 105 fin
  addi t1, sp, 40
  add s9, t1, s10                                                       # ir inst 106 fin
  lb s10, 0(s9)                                                         # ir inst 107 fin
  xor t0, s11, s10
  sltu s9, zero, t0                                                     # ir inst 108 fin
  bnez s9, .F.simulateBooleanAutomaton._44.if.then.0
  j .F.simulateBooleanAutomaton._45.if.else.0                           # ir inst 109 fin
.F.simulateBooleanAutomaton._44.if.then.0:
  addi s11, t4, 1                                                       # ir inst 110 fin
# Phi connections
  j .F.simulateBooleanAutomaton._46.if.exit.0                           # ir inst 111 fin
.F.simulateBooleanAutomaton._45.if.else.0:
# Phi connections
  mv s11, t4
  j .F.simulateBooleanAutomaton._46.if.exit.0                           # ir inst 112 fin
.F.simulateBooleanAutomaton._46.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 114 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.simulateBooleanAutomaton._9.while.cond.1                         # ir inst 115 fin
.F.simulateBooleanAutomaton._47.while.exit.1:
# Phi connections
  li t3, 0
  j .F.simulateBooleanAutomaton._48.while.cond.2                        # ir inst 116 fin
.F.simulateBooleanAutomaton._48.while.cond.2:
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 118 fin
  bnez s11, .F.simulateBooleanAutomaton._49.while.body.2
  j .F.simulateBooleanAutomaton._50.while.exit.2                        # ir inst 119 fin
.F.simulateBooleanAutomaton._49.while.body.2:
  mv s11, t3                                                            # ir inst 120 fin
  addi t1, sp, 40
  add s10, t1, s11                                                      # ir inst 121 fin
  mv s11, t3                                                            # ir inst 122 fin
  addi t1, sp, 140
  add s9, t1, s11                                                       # ir inst 123 fin
  lb s11, 0(s9)                                                         # ir inst 124 fin
  sb s11, 0(s10)                                                        # ir inst 125 fin
  addi s11, t3, 1                                                       # ir inst 126 fin
# Phi connections
  mv t3, s11
  j .F.simulateBooleanAutomaton._48.while.cond.2                        # ir inst 127 fin
.F.simulateBooleanAutomaton._50.while.exit.2:
  add t3, t5, t4                                                        # ir inst 128 fin
  addi t4, t6, 1                                                        # ir inst 129 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.simulateBooleanAutomaton._4.while.cond.0                         # ir inst 130 fin
.F.simulateBooleanAutomaton._51.while.exit.0:
  mv a0, t5
  j .F.simulateBooleanAutomaton.epilogue                                # ir inst 131 fin
.F.simulateBooleanAutomaton.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s9, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 240
  ret

.globl .F.isPrime
.F.isPrime:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.isPrime._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.isPrime._1.if.then.0
  j .F.isPrime._2.if.else.0                                             # ir inst 2 fin
.F.isPrime._1.if.then.0:
  li a0, 0
  j .F.isPrime.epilogue                                                 # ir inst 3 fin
.F.isPrime._2.if.else.0:
  j .F.isPrime._3.if.exit.0                                             # ir inst 4 fin
.F.isPrime._3.if.exit.0:
  li t2, 3
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 5 fin
  bnez t6, .F.isPrime._4.if.then.1
  j .F.isPrime._5.if.else.1                                             # ir inst 6 fin
.F.isPrime._4.if.then.1:
  li a0, 1
  j .F.isPrime.epilogue                                                 # ir inst 7 fin
.F.isPrime._5.if.else.1:
  j .F.isPrime._6.if.exit.1                                             # ir inst 8 fin
.F.isPrime._6.if.exit.1:
  li t2, 2
  rem t6, a0, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.isPrime._7.lazy.then.0
  j .F.isPrime._8.lazy.else.0                                           # ir inst 11 fin
.F.isPrime._7.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.isPrime._9.lazy.exit.0                                           # ir inst 12 fin
.F.isPrime._8.lazy.else.0:
  li t2, 3
  rem t6, a0, t2                                                        # ir inst 13 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.isPrime._9.lazy.exit.0                                           # ir inst 15 fin
.F.isPrime._9.lazy.exit.0:
  bnez t6, .F.isPrime._10.if.then.2
  j .F.isPrime._11.if.else.2                                            # ir inst 17 fin
.F.isPrime._10.if.then.2:
  li a0, 0
  j .F.isPrime.epilogue                                                 # ir inst 18 fin
.F.isPrime._11.if.else.2:
  j .F.isPrime._12.if.exit.2                                            # ir inst 19 fin
.F.isPrime._12.if.exit.2:
# Phi connections
  li t6, 5
  j .F.isPrime._13.while.cond.0                                         # ir inst 20 fin
.F.isPrime._13.while.cond.0:
  mul t5, t6, t6                                                        # ir inst 22 fin
  slt t0, a0, t5
  xori t4, t0, 1                                                        # ir inst 23 fin
  bnez t4, .F.isPrime._14.while.body.0
  j .F.isPrime._21.while.exit.0                                         # ir inst 24 fin
.F.isPrime._14.while.body.0:
  rem t5, a0, t6                                                        # ir inst 25 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 26 fin
  bnez t4, .F.isPrime._15.lazy.then.1
  j .F.isPrime._16.lazy.else.1                                          # ir inst 27 fin
.F.isPrime._15.lazy.then.1:
# Phi connections
  li t5, 1
  j .F.isPrime._17.lazy.exit.1                                          # ir inst 28 fin
.F.isPrime._16.lazy.else.1:
  addi t5, t6, 2                                                        # ir inst 29 fin
  rem t4, a0, t5                                                        # ir inst 30 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 31 fin
# Phi connections
  j .F.isPrime._17.lazy.exit.1                                          # ir inst 32 fin
.F.isPrime._17.lazy.exit.1:
  bnez t5, .F.isPrime._18.if.then.3
  j .F.isPrime._19.if.else.3                                            # ir inst 34 fin
.F.isPrime._18.if.then.3:
  li a0, 0
  j .F.isPrime.epilogue                                                 # ir inst 35 fin
.F.isPrime._19.if.else.3:
  j .F.isPrime._20.if.exit.3                                            # ir inst 36 fin
.F.isPrime._20.if.exit.3:
  addi t5, t6, 6                                                        # ir inst 37 fin
# Phi connections
  mv t6, t5
  j .F.isPrime._13.while.cond.0                                         # ir inst 38 fin
.F.isPrime._21.while.exit.0:
  li a0, 1
  j .F.isPrime.epilogue                                                 # ir inst 39 fin
.F.isPrime.epilogue:
  ret
