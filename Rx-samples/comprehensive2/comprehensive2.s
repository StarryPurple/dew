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
  li a0, 2000
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performComplexControlFlowTest
# ir inst 2 fin
# Start call preparation
  call .F.performGraphAlgorithms
# ir inst 3 fin
# Start call preparation
  call .F.performDynamicProgramming
# ir inst 4 fin
# Start call preparation
  call .F.performStateMachineSimulation
# ir inst 5 fin
# Start call preparation
  call .F.performSearchAlgorithms
# ir inst 6 fin
# Start call preparation
  li a0, 2999
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

.globl .F.performComplexControlFlowTest
.F.performComplexControlFlowTest:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performComplexControlFlowTest._0.entry.0:
# Start call preparation
  li a0, 2001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 100
  call .F.complexNestedLoops
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 1000
  call .F.multipleBranchingPatterns
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a0, 500
  call .F.earlyExitPatterns
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 200
  call .F.simulateSwitchBehavior
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 2002
  call printlnInt
# ir inst 10 fin
  j .F.performComplexControlFlowTest.epilogue                           # ir inst 11 fin
.F.performComplexControlFlowTest.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.complexNestedLoops
.F.complexNestedLoops:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s7, 16(sp)
  sd s8, 24(sp)
  sd s9, 32(sp)
.F.complexNestedLoops._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.complexNestedLoops._1.while.cond.0                               # ir inst 1 fin
.F.complexNestedLoops._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.complexNestedLoops._2.while.body.0
  j .F.complexNestedLoops._43.critical_edge.0                           # ir inst 5 fin
.F.complexNestedLoops._2.while.body.0:
# Phi connections
  mv s11, t5
  li t3, 0
  li t4, 0
  j .F.complexNestedLoops._3.while.cond.1                               # ir inst 6 fin
.F.complexNestedLoops._3.while.cond.1:
  slt s10, t3, a0                                                       # ir inst 10 fin
  bnez s10, .F.complexNestedLoops._4.while.body.1
  j .F.complexNestedLoops._44.critical_edge.1                           # ir inst 11 fin
.F.complexNestedLoops._4.while.body.1:
# Phi connections
  mv s10, t4
  li t4, 0
  j .F.complexNestedLoops._5.while.cond.2                               # ir inst 12 fin
.F.complexNestedLoops._5.while.cond.2:
  li t2, 50
  slt s9, t4, t2                                                        # ir inst 15 fin
  bnez s9, .F.complexNestedLoops._6.while.body.2
  j .F.complexNestedLoops._45.critical_edge.2                           # ir inst 16 fin
.F.complexNestedLoops._6.while.body.2:
  add s9, t6, t3                                                        # ir inst 17 fin
  add s8, s9, t4                                                        # ir inst 18 fin
  li t2, 3
  rem s9, s8, t2                                                        # ir inst 19 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 20 fin
  bnez s8, .F.complexNestedLoops._7.if.then.0
  j .F.complexNestedLoops._14.if.else.0                                 # ir inst 21 fin
.F.complexNestedLoops._7.if.then.0:
  mul s9, t6, t3                                                        # ir inst 22 fin
  li t2, 5
  rem s8, s9, t2                                                        # ir inst 23 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 24 fin
  bnez s9, .F.complexNestedLoops._8.if.then.1
  j .F.complexNestedLoops._12.if.else.1                                 # ir inst 25 fin
.F.complexNestedLoops._8.if.then.1:
  add s9, s10, t4                                                       # ir inst 26 fin
  li t2, 1000
  slt s8, t2, s9                                                        # ir inst 27 fin
  bnez s8, .F.complexNestedLoops._9.if.then.2
  j .F.complexNestedLoops._10.if.else.2                                 # ir inst 28 fin
.F.complexNestedLoops._9.if.then.2:
# Phi connections
  mv t4, s9
  j .F.complexNestedLoops._25.while.exit.2                              # ir inst 29 fin
.F.complexNestedLoops._10.if.else.2:
  j .F.complexNestedLoops._11.if.exit.2                                 # ir inst 30 fin
.F.complexNestedLoops._11.if.exit.2:
  j .F.complexNestedLoops._13.if.exit.1                                 # ir inst 31 fin
.F.complexNestedLoops._12.if.else.1:
  addi s8, t4, 2                                                        # ir inst 32 fin
# Phi connections
  mv t4, s8
  j .F.complexNestedLoops._5.while.cond.2                               # ir inst 33 fin
.F.complexNestedLoops._13.if.exit.1:
# Phi connections
  j .F.complexNestedLoops._21.if.exit.0                                 # ir inst 34 fin
.F.complexNestedLoops._14.if.else.0:
  add s9, t6, t3                                                        # ir inst 35 fin
  add s8, s9, t4                                                        # ir inst 36 fin
  li t2, 7
  rem s9, s8, t2                                                        # ir inst 37 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 38 fin
  bnez s8, .F.complexNestedLoops._15.if.then.3
  j .F.complexNestedLoops._19.if.else.3                                 # ir inst 39 fin
.F.complexNestedLoops._15.if.then.3:
  li t2, 2
  div s9, t4, t2                                                        # ir inst 40 fin
  sub s8, s10, s9                                                       # ir inst 41 fin
  li t2, 0
  slt s9, s8, t2                                                        # ir inst 42 fin
  bnez s9, .F.complexNestedLoops._16.if.then.4
  j .F.complexNestedLoops._17.if.else.4                                 # ir inst 43 fin
.F.complexNestedLoops._16.if.then.4:
# Phi connections
  li s9, 0
  j .F.complexNestedLoops._18.if.exit.4                                 # ir inst 44 fin
.F.complexNestedLoops._17.if.else.4:
# Phi connections
  mv s9, s8
  j .F.complexNestedLoops._18.if.exit.4                                 # ir inst 45 fin
.F.complexNestedLoops._18.if.exit.4:
# Phi connections
  j .F.complexNestedLoops._20.if.exit.3                                 # ir inst 47 fin
.F.complexNestedLoops._19.if.else.3:
# Phi connections
  mv s9, s10
  j .F.complexNestedLoops._20.if.exit.3                                 # ir inst 48 fin
.F.complexNestedLoops._20.if.exit.3:
# Phi connections
  j .F.complexNestedLoops._21.if.exit.0                                 # ir inst 50 fin
.F.complexNestedLoops._21.if.exit.0:
  li t2, 2
  rem s8, t4, t2                                                        # ir inst 52 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 53 fin
  bnez s7, .F.complexNestedLoops._22.if.then.5
  j .F.complexNestedLoops._23.if.else.5                                 # ir inst 54 fin
.F.complexNestedLoops._22.if.then.5:
  addi s8, t4, 1                                                        # ir inst 55 fin
# Phi connections
  mv t4, s8
  j .F.complexNestedLoops._24.if.exit.5                                 # ir inst 56 fin
.F.complexNestedLoops._23.if.else.5:
  addi s8, t4, 3                                                        # ir inst 57 fin
# Phi connections
  mv t4, s8
  j .F.complexNestedLoops._24.if.exit.5                                 # ir inst 58 fin
.F.complexNestedLoops._24.if.exit.5:
# Phi connections
  mv s10, s9
  j .F.complexNestedLoops._5.while.cond.2                               # ir inst 60 fin
.F.complexNestedLoops._25.while.exit.2:
  add s9, s11, t4                                                       # ir inst 62 fin
  li t2, 3
  rem s8, t3, t2                                                        # ir inst 63 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 64 fin
  bnez s7, .F.complexNestedLoops._26.if.then.6
  j .F.complexNestedLoops._27.if.else.6                                 # ir inst 65 fin
.F.complexNestedLoops._26.if.then.6:
  addi s8, t3, 2                                                        # ir inst 66 fin
# Phi connections
  j .F.complexNestedLoops._28.if.exit.6                                 # ir inst 67 fin
.F.complexNestedLoops._27.if.else.6:
  addi s8, t3, 1                                                        # ir inst 68 fin
# Phi connections
  j .F.complexNestedLoops._28.if.exit.6                                 # ir inst 69 fin
.F.complexNestedLoops._28.if.exit.6:
  li t2, 50000
  slt s7, t2, s9                                                        # ir inst 71 fin
  bnez s7, .F.complexNestedLoops._29.if.then.7
  j .F.complexNestedLoops._30.if.else.7                                 # ir inst 72 fin
.F.complexNestedLoops._29.if.then.7:
# Phi connections
  mv t4, s9
  j .F.complexNestedLoops._32.while.exit.1                              # ir inst 73 fin
.F.complexNestedLoops._30.if.else.7:
  j .F.complexNestedLoops._31.if.exit.7                                 # ir inst 74 fin
.F.complexNestedLoops._31.if.exit.7:
# Phi connections
  mv s11, s9
  mv t3, s8
  j .F.complexNestedLoops._3.while.cond.1                               # ir inst 75 fin
.F.complexNestedLoops._32.while.exit.1:
  li t2, 10
  rem s9, t6, t2                                                        # ir inst 77 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 78 fin
  bnez s8, .F.complexNestedLoops._33.if.then.8
  j .F.complexNestedLoops._34.if.else.8                                 # ir inst 79 fin
.F.complexNestedLoops._33.if.then.8:
  addi s9, t6, 5                                                        # ir inst 80 fin
# Phi connections
  j .F.complexNestedLoops._38.if.exit.8                                 # ir inst 81 fin
.F.complexNestedLoops._34.if.else.8:
  li t2, 5
  rem s9, t6, t2                                                        # ir inst 82 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 83 fin
  bnez s8, .F.complexNestedLoops._35.if.then.9
  j .F.complexNestedLoops._36.if.else.9                                 # ir inst 84 fin
.F.complexNestedLoops._35.if.then.9:
  addi s9, t6, 3                                                        # ir inst 85 fin
# Phi connections
  j .F.complexNestedLoops._37.if.exit.9                                 # ir inst 86 fin
.F.complexNestedLoops._36.if.else.9:
  addi s9, t6, 1                                                        # ir inst 87 fin
# Phi connections
  j .F.complexNestedLoops._37.if.exit.9                                 # ir inst 88 fin
.F.complexNestedLoops._37.if.exit.9:
# Phi connections
  j .F.complexNestedLoops._38.if.exit.8                                 # ir inst 90 fin
.F.complexNestedLoops._38.if.exit.8:
  li t2, 100000
  slt s8, t2, t4                                                        # ir inst 92 fin
  bnez s8, .F.complexNestedLoops._39.if.then.10
  j .F.complexNestedLoops._40.if.else.10                                # ir inst 93 fin
.F.complexNestedLoops._39.if.then.10:
# Phi connections
  j .F.complexNestedLoops._42.while.exit.0                              # ir inst 94 fin
.F.complexNestedLoops._40.if.else.10:
  j .F.complexNestedLoops._41.if.exit.10                                # ir inst 95 fin
.F.complexNestedLoops._41.if.exit.10:
# Phi connections
  mv t5, t4
  mv t6, s9
  j .F.complexNestedLoops._1.while.cond.0                               # ir inst 96 fin
.F.complexNestedLoops._42.while.exit.0:
  li t2, 10000
  rem s9, t4, t2                                                        # ir inst 98 fin
  mv a0, s9
  j .F.complexNestedLoops.epilogue                                      # ir inst 99 fin
.F.complexNestedLoops._43.critical_edge.0:
# Phi connections
  mv t4, t5
  j .F.complexNestedLoops._42.while.exit.0                              # ir inst 100 fin
.F.complexNestedLoops._44.critical_edge.1:
# Phi connections
  mv t4, s11
  j .F.complexNestedLoops._32.while.exit.1                              # ir inst 101 fin
.F.complexNestedLoops._45.critical_edge.2:
# Phi connections
  mv t4, s10
  j .F.complexNestedLoops._25.while.exit.2                              # ir inst 102 fin
.F.complexNestedLoops.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s7, 16(sp)
  ld s8, 24(sp)
  ld s9, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.multipleBranchingPatterns
.F.multipleBranchingPatterns:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s9, 40(sp)
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.multipleBranchingPatterns._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.multipleBranchingPatterns._1.while.cond.0                        # ir inst 1 fin
.F.multipleBranchingPatterns._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.multipleBranchingPatterns._2.while.body.0
  j .F.multipleBranchingPatterns._33.while.exit.0                       # ir inst 5 fin
.F.multipleBranchingPatterns._2.while.body.0:
  li t2, 17
  mul t4, t6, t2                                                        # ir inst 6 fin
  addi t3, t4, 23                                                       # ir inst 7 fin
  li t2, 100
  rem t4, t3, t2                                                        # ir inst 8 fin
  li t2, 10
  slt t3, t4, t2                                                        # ir inst 9 fin
  bnez t3, .F.multipleBranchingPatterns._3.if.then.0
  j .F.multipleBranchingPatterns._13.if.else.0                          # ir inst 10 fin
.F.multipleBranchingPatterns._3.if.then.0:
  li t2, 5
  slt t3, t4, t2                                                        # ir inst 11 fin
  bnez t3, .F.multipleBranchingPatterns._4.if.then.1
  j .F.multipleBranchingPatterns._8.if.else.1                           # ir inst 12 fin
.F.multipleBranchingPatterns._4.if.then.1:
  li t2, 2
  rem t3, t4, t2                                                        # ir inst 13 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.multipleBranchingPatterns._5.if.then.2
  j .F.multipleBranchingPatterns._6.if.else.2                           # ir inst 15 fin
.F.multipleBranchingPatterns._5.if.then.2:
  li t2, 3
  mul t3, t4, t2                                                        # ir inst 16 fin
  add s11, t5, t3                                                       # ir inst 17 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._7.if.exit.2                           # ir inst 18 fin
.F.multipleBranchingPatterns._6.if.else.2:
  li t2, 5
  mul t3, t4, t2                                                        # ir inst 19 fin
  add s11, t5, t3                                                       # ir inst 20 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._7.if.exit.2                           # ir inst 21 fin
.F.multipleBranchingPatterns._7.if.exit.2:
# Phi connections
  j .F.multipleBranchingPatterns._12.if.exit.1                          # ir inst 23 fin
.F.multipleBranchingPatterns._8.if.else.1:
  li t2, 3
  rem t3, t4, t2                                                        # ir inst 24 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 25 fin
  bnez s11, .F.multipleBranchingPatterns._9.if.then.3
  j .F.multipleBranchingPatterns._10.if.else.3                          # ir inst 26 fin
.F.multipleBranchingPatterns._9.if.then.3:
  slli t3, t4, 1                                                        # ir inst 27 fin
  add s11, t5, t3                                                       # ir inst 28 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._11.if.exit.3                          # ir inst 29 fin
.F.multipleBranchingPatterns._10.if.else.3:
  slli t3, t4, 2                                                        # ir inst 30 fin
  add s11, t5, t3                                                       # ir inst 31 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._11.if.exit.3                          # ir inst 32 fin
.F.multipleBranchingPatterns._11.if.exit.3:
# Phi connections
  j .F.multipleBranchingPatterns._12.if.exit.1                          # ir inst 34 fin
.F.multipleBranchingPatterns._12.if.exit.1:
# Phi connections
  mv t4, t3
  j .F.multipleBranchingPatterns._32.if.exit.0                          # ir inst 36 fin
.F.multipleBranchingPatterns._13.if.else.0:
  li t2, 30
  slt t3, t4, t2                                                        # ir inst 37 fin
  bnez t3, .F.multipleBranchingPatterns._14.if.then.4
  j .F.multipleBranchingPatterns._18.if.else.4                          # ir inst 38 fin
.F.multipleBranchingPatterns._14.if.then.4:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 39 fin
  bnez t3, .F.multipleBranchingPatterns._15.if.then.5
  j .F.multipleBranchingPatterns._16.if.else.5                          # ir inst 40 fin
.F.multipleBranchingPatterns._15.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.complexCalculation
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
  add s11, t5, t3                                                       # ir inst 42 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._17.if.exit.5                          # ir inst 43 fin
.F.multipleBranchingPatterns._16.if.else.5:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.simpleCalculation
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 44 fin
  add s11, t5, t3                                                       # ir inst 45 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._17.if.exit.5                          # ir inst 46 fin
.F.multipleBranchingPatterns._17.if.exit.5:
# Phi connections
  mv t4, t3
  j .F.multipleBranchingPatterns._31.if.exit.4                          # ir inst 48 fin
.F.multipleBranchingPatterns._18.if.else.4:
  li t2, 60
  slt t3, t4, t2                                                        # ir inst 49 fin
  bnez t3, .F.multipleBranchingPatterns._19.if.then.6
  j .F.multipleBranchingPatterns._23.if.else.6                          # ir inst 50 fin
.F.multipleBranchingPatterns._19.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.isSpecialNumber
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 51 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 52 fin
  bnez s11, .F.multipleBranchingPatterns._20.if.then.7
  j .F.multipleBranchingPatterns._21.if.else.7                          # ir inst 53 fin
.F.multipleBranchingPatterns._20.if.then.7:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.processSpecialNumber
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 54 fin
  add s11, t5, t3                                                       # ir inst 55 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._22.if.exit.7                          # ir inst 56 fin
.F.multipleBranchingPatterns._21.if.else.7:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.processNormalNumber
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 57 fin
  add s11, t5, t3                                                       # ir inst 58 fin
# Phi connections
  mv t3, s11
  j .F.multipleBranchingPatterns._22.if.exit.7                          # ir inst 59 fin
.F.multipleBranchingPatterns._22.if.exit.7:
# Phi connections
  mv t4, t3
  j .F.multipleBranchingPatterns._30.if.exit.6                          # ir inst 61 fin
.F.multipleBranchingPatterns._23.if.else.6:
  li t2, 80
  slt t3, t4, t2                                                        # ir inst 62 fin
  bnez t3, .F.multipleBranchingPatterns._24.if.then.8
  j .F.multipleBranchingPatterns._28.if.else.8                          # ir inst 63 fin
.F.multipleBranchingPatterns._24.if.then.8:
# Phi connections
  li s11, 0
  li t3, 0
  j .F.multipleBranchingPatterns._25.while.cond.1                       # ir inst 64 fin
.F.multipleBranchingPatterns._25.while.cond.1:
  li t2, 10
  rem s10, t4, t2                                                       # ir inst 67 fin
  slt s9, t3, s10                                                       # ir inst 68 fin
  bnez s9, .F.multipleBranchingPatterns._26.while.body.1
  j .F.multipleBranchingPatterns._27.while.exit.1                       # ir inst 69 fin
.F.multipleBranchingPatterns._26.while.body.1:
  mul s10, t3, t3                                                       # ir inst 70 fin
  add s9, s11, s10                                                      # ir inst 71 fin
  addi s10, t3, 1                                                       # ir inst 72 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  j .F.multipleBranchingPatterns._25.while.cond.1                       # ir inst 73 fin
.F.multipleBranchingPatterns._27.while.exit.1:
  add t3, t5, s11                                                       # ir inst 74 fin
# Phi connections
  mv t4, t3
  j .F.multipleBranchingPatterns._29.if.exit.8                          # ir inst 75 fin
.F.multipleBranchingPatterns._28.if.else.8:
  mul t3, t4, t4                                                        # ir inst 76 fin
  li t2, 17
  rem s11, t3, t2                                                       # ir inst 77 fin
  addi t3, t4, 13                                                       # ir inst 78 fin
  li t2, 7
  rem t4, t3, t2                                                        # ir inst 79 fin
  add t3, s11, t4                                                       # ir inst 80 fin
  add t4, t5, t3                                                        # ir inst 81 fin
# Phi connections
  j .F.multipleBranchingPatterns._29.if.exit.8                          # ir inst 82 fin
.F.multipleBranchingPatterns._29.if.exit.8:
# Phi connections
  j .F.multipleBranchingPatterns._30.if.exit.6                          # ir inst 84 fin
.F.multipleBranchingPatterns._30.if.exit.6:
# Phi connections
  j .F.multipleBranchingPatterns._31.if.exit.4                          # ir inst 86 fin
.F.multipleBranchingPatterns._31.if.exit.4:
# Phi connections
  j .F.multipleBranchingPatterns._32.if.exit.0                          # ir inst 88 fin
.F.multipleBranchingPatterns._32.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 90 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.multipleBranchingPatterns._1.while.cond.0                        # ir inst 91 fin
.F.multipleBranchingPatterns._33.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 92 fin
  mv a0, t6
  j .F.multipleBranchingPatterns.epilogue                               # ir inst 93 fin
.F.multipleBranchingPatterns.epilogue:
  ld ra, 64(sp)
  ld s9, 40(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.complexCalculation
.F.complexCalculation:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.complexCalculation._0.entry.0:
# Phi connections
  mv t5, a0
  li t6, 0
  j .F.complexCalculation._1.while.cond.0                               # ir inst 1 fin
.F.complexCalculation._1.while.cond.0:
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 4 fin
  bnez t4, .F.complexCalculation._2.while.body.0
  j .F.complexCalculation._3.while.exit.0                               # ir inst 5 fin
.F.complexCalculation._2.while.body.0:
  li t2, 10
  rem t4, t5, t2                                                        # ir inst 6 fin
  add t3, t6, t4                                                        # ir inst 7 fin
  li t2, 10
  div t4, t5, t2                                                        # ir inst 8 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.complexCalculation._1.while.cond.0                               # ir inst 9 fin
.F.complexCalculation._3.while.exit.0:
  mul t5, t6, t6                                                        # ir inst 10 fin
  mv a0, t5
  j .F.complexCalculation.epilogue                                      # ir inst 11 fin
.F.complexCalculation.epilogue:
  ret

.globl .F.simpleCalculation
.F.simpleCalculation:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simpleCalculation._0.entry.0:
  slli t6, a0, 1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  mv a0, t5
  j .F.simpleCalculation.epilogue                                       # ir inst 3 fin
.F.simpleCalculation.epilogue:
  ret

.globl .F.isSpecialNumber
.F.isSpecialNumber:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.isSpecialNumber._0.entry.0:
  li t2, 7
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.isSpecialNumber._1.lazy.then.0
  j .F.isSpecialNumber._2.lazy.else.0                                   # ir inst 3 fin
.F.isSpecialNumber._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.isSpecialNumber._3.lazy.exit.0                                   # ir inst 4 fin
.F.isSpecialNumber._2.lazy.else.0:
  li t2, 11
  rem t6, a0, t2                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
# Phi connections
  mv t6, t5
  j .F.isSpecialNumber._3.lazy.exit.0                                   # ir inst 7 fin
.F.isSpecialNumber._3.lazy.exit.0:
  mv t5, t6                                                             # ir inst 9 fin
  mv a0, t5
  j .F.isSpecialNumber.epilogue                                         # ir inst 10 fin
.F.isSpecialNumber.epilogue:
  ret

.globl .F.processSpecialNumber
.F.processSpecialNumber:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processSpecialNumber._0.entry.0:
  li t2, 7
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.processSpecialNumber._1.if.then.0
  j .F.processSpecialNumber._2.if.else.0                                # ir inst 3 fin
.F.processSpecialNumber._1.if.then.0:
  li t2, 7
  mul t6, a0, t2                                                        # ir inst 4 fin
# Phi connections
  j .F.processSpecialNumber._3.if.exit.0                                # ir inst 5 fin
.F.processSpecialNumber._2.if.else.0:
# Phi connections
  mv t6, a0
  j .F.processSpecialNumber._3.if.exit.0                                # ir inst 6 fin
.F.processSpecialNumber._3.if.exit.0:
  li t2, 11
  rem t5, a0, t2                                                        # ir inst 8 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F.processSpecialNumber._4.if.then.1
  j .F.processSpecialNumber._5.if.else.1                                # ir inst 10 fin
.F.processSpecialNumber._4.if.then.1:
  li t2, 11
  mul t5, t6, t2                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.processSpecialNumber._6.if.exit.1                                # ir inst 12 fin
.F.processSpecialNumber._5.if.else.1:
# Phi connections
  j .F.processSpecialNumber._6.if.exit.1                                # ir inst 13 fin
.F.processSpecialNumber._6.if.exit.1:
  li t2, 1000
  rem t5, t6, t2                                                        # ir inst 15 fin
  mv a0, t5
  j .F.processSpecialNumber.epilogue                                    # ir inst 16 fin
.F.processSpecialNumber.epilogue:
  ret

.globl .F.processNormalNumber
.F.processNormalNumber:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processNormalNumber._0.entry.0:
  li t2, 3
  mul t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 7                                                        # ir inst 2 fin
  li t2, 100
  rem t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.processNormalNumber.epilogue                                     # ir inst 4 fin
.F.processNormalNumber.epilogue:
  ret

.globl .F.earlyExitPatterns
.F.earlyExitPatterns:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s7, 0(sp)
  sd s11, 8(sp)
  sd s8, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
.F.earlyExitPatterns._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.earlyExitPatterns._1.while.cond.0                                # ir inst 1 fin
.F.earlyExitPatterns._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.earlyExitPatterns._2.while.body.0
  j .F.earlyExitPatterns._27.while.exit.0                               # ir inst 5 fin
.F.earlyExitPatterns._2.while.body.0:
# Phi connections
  mv s11, t5
  li t3, 0
  li t4, 0
  j .F.earlyExitPatterns._3.while.cond.1                                # ir inst 6 fin
.F.earlyExitPatterns._3.while.cond.1:
  slt s10, t3, a0                                                       # ir inst 10 fin
  bnez s10, .F.earlyExitPatterns._4.while.body.1
  j .F.earlyExitPatterns._28.critical_edge.0                            # ir inst 11 fin
.F.earlyExitPatterns._4.while.body.1:
  li t2, 31
  mul s10, t6, t2                                                       # ir inst 12 fin
  li t2, 17
  mul s9, t3, t2                                                        # ir inst 13 fin
  add s8, s10, s9                                                       # ir inst 14 fin
  li t2, 100
  rem s10, s8, t2                                                       # ir inst 15 fin
  li t2, 42
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 16 fin
  bnez s9, .F.earlyExitPatterns._5.if.then.0
  j .F.earlyExitPatterns._9.if.else.0                                   # ir inst 17 fin
.F.earlyExitPatterns._5.if.then.0:
  addi s9, t4, 1                                                        # ir inst 18 fin
  addi s8, s11, 1                                                       # ir inst 19 fin
  li t2, 20
  slt s7, t2, s8                                                        # ir inst 20 fin
  bnez s7, .F.earlyExitPatterns._6.if.then.1
  j .F.earlyExitPatterns._7.if.else.1                                   # ir inst 21 fin
.F.earlyExitPatterns._6.if.then.1:
  mv a0, s8
  j .F.earlyExitPatterns.epilogue                                       # ir inst 22 fin
.F.earlyExitPatterns._7.if.else.1:
  j .F.earlyExitPatterns._8.if.exit.1                                   # ir inst 23 fin
.F.earlyExitPatterns._8.if.exit.1:
# Phi connections
  j .F.earlyExitPatterns._16.if.exit.0                                  # ir inst 24 fin
.F.earlyExitPatterns._9.if.else.0:
  li t2, 95
  slt s9, t2, s10                                                       # ir inst 25 fin
  bnez s9, .F.earlyExitPatterns._10.if.then.2
  j .F.earlyExitPatterns._11.if.else.2                                  # ir inst 26 fin
.F.earlyExitPatterns._10.if.then.2:
# Phi connections
  mv s10, s11
  mv t3, t4
  j .F.earlyExitPatterns._23.while.exit.1                               # ir inst 27 fin
.F.earlyExitPatterns._11.if.else.2:
  li t2, 5
  slt s9, s10, t2                                                       # ir inst 28 fin
  bnez s9, .F.earlyExitPatterns._12.if.then.3
  j .F.earlyExitPatterns._13.if.else.3                                  # ir inst 29 fin
.F.earlyExitPatterns._12.if.then.3:
  addi s9, t3, 10                                                       # ir inst 30 fin
# Phi connections
  mv t3, s9
  j .F.earlyExitPatterns._3.while.cond.1                                # ir inst 31 fin
.F.earlyExitPatterns._13.if.else.3:
  j .F.earlyExitPatterns._14.if.exit.3                                  # ir inst 32 fin
.F.earlyExitPatterns._14.if.exit.3:
  j .F.earlyExitPatterns._15.if.exit.2                                  # ir inst 33 fin
.F.earlyExitPatterns._15.if.exit.2:
# Phi connections
  mv s8, s11
  mv s9, t4
  j .F.earlyExitPatterns._16.if.exit.0                                  # ir inst 34 fin
.F.earlyExitPatterns._16.if.exit.0:
  li t2, 3
  slt s7, t2, s9                                                        # ir inst 37 fin
  bnez s7, .F.earlyExitPatterns._17.lazy.then.0
  j .F.earlyExitPatterns._18.lazy.else.0                                # ir inst 38 fin
.F.earlyExitPatterns._17.lazy.then.0:
  li t2, 13
  rem s7, s10, t2                                                       # ir inst 39 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s10, t0, 1                                                      # ir inst 40 fin
# Phi connections
  j .F.earlyExitPatterns._19.lazy.exit.0                                # ir inst 41 fin
.F.earlyExitPatterns._18.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.earlyExitPatterns._19.lazy.exit.0                                # ir inst 42 fin
.F.earlyExitPatterns._19.lazy.exit.0:
  bnez s10, .F.earlyExitPatterns._20.if.then.4
  j .F.earlyExitPatterns._21.if.else.4                                  # ir inst 44 fin
.F.earlyExitPatterns._20.if.then.4:
# Phi connections
  mv s10, s8
  mv t3, s9
  j .F.earlyExitPatterns._23.while.exit.1                               # ir inst 45 fin
.F.earlyExitPatterns._21.if.else.4:
  j .F.earlyExitPatterns._22.if.exit.4                                  # ir inst 46 fin
.F.earlyExitPatterns._22.if.exit.4:
  addi s10, t3, 1                                                       # ir inst 47 fin
# Phi connections
  mv s11, s8
  mv t3, s10
  mv t4, s9
  j .F.earlyExitPatterns._3.while.cond.1                                # ir inst 48 fin
.F.earlyExitPatterns._23.while.exit.1:
  li t2, 5
  slt s9, t2, t3                                                        # ir inst 51 fin
  bnez s9, .F.earlyExitPatterns._24.if.then.5
  j .F.earlyExitPatterns._25.if.else.5                                  # ir inst 52 fin
.F.earlyExitPatterns._24.if.then.5:
  mv a0, s10
  j .F.earlyExitPatterns.epilogue                                       # ir inst 53 fin
.F.earlyExitPatterns._25.if.else.5:
  j .F.earlyExitPatterns._26.if.exit.5                                  # ir inst 54 fin
.F.earlyExitPatterns._26.if.exit.5:
  addi t3, t6, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, s10
  mv t6, t3
  j .F.earlyExitPatterns._1.while.cond.0                                # ir inst 56 fin
.F.earlyExitPatterns._27.while.exit.0:
  mv a0, t5
  j .F.earlyExitPatterns.epilogue                                       # ir inst 57 fin
.F.earlyExitPatterns._28.critical_edge.0:
# Phi connections
  mv s10, s11
  mv t3, t4
  j .F.earlyExitPatterns._23.while.exit.1                               # ir inst 58 fin
.F.earlyExitPatterns.epilogue:
  ld s7, 0(sp)
  ld s11, 8(sp)
  ld s8, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.simulateSwitchBehavior
.F.simulateSwitchBehavior:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.simulateSwitchBehavior._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulateSwitchBehavior._1.while.cond.0                           # ir inst 1 fin
.F.simulateSwitchBehavior._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.simulateSwitchBehavior._2.while.body.0
  j .F.simulateSwitchBehavior._48.while.exit.0                          # ir inst 5 fin
.F.simulateSwitchBehavior._2.while.body.0:
  li t2, 16
  rem t4, t6, t2                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.simulateSwitchBehavior._3.if.then.0
  j .F.simulateSwitchBehavior._4.if.else.0                              # ir inst 8 fin
.F.simulateSwitchBehavior._3.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase0
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
  add s11, t5, t3                                                       # ir inst 10 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._47.if.exit.0                             # ir inst 11 fin
.F.simulateSwitchBehavior._4.if.else.0:
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 12 fin
  bnez t3, .F.simulateSwitchBehavior._5.if.then.1
  j .F.simulateSwitchBehavior._6.if.else.1                              # ir inst 13 fin
.F.simulateSwitchBehavior._5.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase1
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 14 fin
  add s11, t5, t3                                                       # ir inst 15 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._46.if.exit.1                             # ir inst 16 fin
.F.simulateSwitchBehavior._6.if.else.1:
  li t2, 2
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 17 fin
  bnez t3, .F.simulateSwitchBehavior._7.if.then.2
  j .F.simulateSwitchBehavior._8.if.else.2                              # ir inst 18 fin
.F.simulateSwitchBehavior._7.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase2
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 19 fin
  add s11, t5, t3                                                       # ir inst 20 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._45.if.exit.2                             # ir inst 21 fin
.F.simulateSwitchBehavior._8.if.else.2:
  li t2, 3
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 22 fin
  bnez t3, .F.simulateSwitchBehavior._9.if.then.3
  j .F.simulateSwitchBehavior._10.if.else.3                             # ir inst 23 fin
.F.simulateSwitchBehavior._9.if.then.3:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase3
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 24 fin
  add s11, t5, t3                                                       # ir inst 25 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._44.if.exit.3                             # ir inst 26 fin
.F.simulateSwitchBehavior._10.if.else.3:
  li t2, 4
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 27 fin
  bnez t3, .F.simulateSwitchBehavior._11.if.then.4
  j .F.simulateSwitchBehavior._12.if.else.4                             # ir inst 28 fin
.F.simulateSwitchBehavior._11.if.then.4:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase4
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 29 fin
  add s11, t5, t3                                                       # ir inst 30 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._43.if.exit.4                             # ir inst 31 fin
.F.simulateSwitchBehavior._12.if.else.4:
  li t2, 5
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 32 fin
  bnez t3, .F.simulateSwitchBehavior._13.if.then.5
  j .F.simulateSwitchBehavior._14.if.else.5                             # ir inst 33 fin
.F.simulateSwitchBehavior._13.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase5
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 34 fin
  add s11, t5, t3                                                       # ir inst 35 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._42.if.exit.5                             # ir inst 36 fin
.F.simulateSwitchBehavior._14.if.else.5:
  li t2, 6
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 37 fin
  bnez t3, .F.simulateSwitchBehavior._15.if.then.6
  j .F.simulateSwitchBehavior._16.if.else.6                             # ir inst 38 fin
.F.simulateSwitchBehavior._15.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase6
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
  add s11, t5, t3                                                       # ir inst 40 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._41.if.exit.6                             # ir inst 41 fin
.F.simulateSwitchBehavior._16.if.else.6:
  li t2, 7
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 42 fin
  bnez t3, .F.simulateSwitchBehavior._17.if.then.7
  j .F.simulateSwitchBehavior._18.if.else.7                             # ir inst 43 fin
.F.simulateSwitchBehavior._17.if.then.7:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase7
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 44 fin
  add s11, t5, t3                                                       # ir inst 45 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._40.if.exit.7                             # ir inst 46 fin
.F.simulateSwitchBehavior._18.if.else.7:
  li t2, 8
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 47 fin
  bnez t3, .F.simulateSwitchBehavior._19.if.then.8
  j .F.simulateSwitchBehavior._20.if.else.8                             # ir inst 48 fin
.F.simulateSwitchBehavior._19.if.then.8:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase8
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 49 fin
  add s11, t5, t3                                                       # ir inst 50 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._39.if.exit.8                             # ir inst 51 fin
.F.simulateSwitchBehavior._20.if.else.8:
  li t2, 9
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 52 fin
  bnez t3, .F.simulateSwitchBehavior._21.if.then.9
  j .F.simulateSwitchBehavior._22.if.else.9                             # ir inst 53 fin
.F.simulateSwitchBehavior._21.if.then.9:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase9
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 54 fin
  add s11, t5, t3                                                       # ir inst 55 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._38.if.exit.9                             # ir inst 56 fin
.F.simulateSwitchBehavior._22.if.else.9:
  li t2, 10
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 57 fin
  bnez t3, .F.simulateSwitchBehavior._23.if.then.10
  j .F.simulateSwitchBehavior._24.if.else.10                            # ir inst 58 fin
.F.simulateSwitchBehavior._23.if.then.10:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase10
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 59 fin
  add s11, t5, t3                                                       # ir inst 60 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._37.if.exit.10                            # ir inst 61 fin
.F.simulateSwitchBehavior._24.if.else.10:
  li t2, 11
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 62 fin
  bnez t3, .F.simulateSwitchBehavior._25.if.then.11
  j .F.simulateSwitchBehavior._26.if.else.11                            # ir inst 63 fin
.F.simulateSwitchBehavior._25.if.then.11:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase11
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 64 fin
  add s11, t5, t3                                                       # ir inst 65 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._36.if.exit.11                            # ir inst 66 fin
.F.simulateSwitchBehavior._26.if.else.11:
  li t2, 12
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 67 fin
  bnez t3, .F.simulateSwitchBehavior._27.if.then.12
  j .F.simulateSwitchBehavior._28.if.else.12                            # ir inst 68 fin
.F.simulateSwitchBehavior._27.if.then.12:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase12
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 69 fin
  add s11, t5, t3                                                       # ir inst 70 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._35.if.exit.12                            # ir inst 71 fin
.F.simulateSwitchBehavior._28.if.else.12:
  li t2, 13
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 72 fin
  bnez t3, .F.simulateSwitchBehavior._29.if.then.13
  j .F.simulateSwitchBehavior._30.if.else.13                            # ir inst 73 fin
.F.simulateSwitchBehavior._29.if.then.13:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.processCase13
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 74 fin
  add s11, t5, t3                                                       # ir inst 75 fin
# Phi connections
  mv t4, s11
  j .F.simulateSwitchBehavior._34.if.exit.13                            # ir inst 76 fin
.F.simulateSwitchBehavior._30.if.else.13:
  li t2, 14
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 77 fin
  bnez t3, .F.simulateSwitchBehavior._31.if.then.14
  j .F.simulateSwitchBehavior._32.if.else.14                            # ir inst 78 fin
.F.simulateSwitchBehavior._31.if.then.14:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.processCase14
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 79 fin
  add t3, t5, t4                                                        # ir inst 80 fin
# Phi connections
  mv t4, t3
  j .F.simulateSwitchBehavior._33.if.exit.14                            # ir inst 81 fin
.F.simulateSwitchBehavior._32.if.else.14:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.processCase15
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 82 fin
  add t3, t5, t4                                                        # ir inst 83 fin
# Phi connections
  mv t4, t3
  j .F.simulateSwitchBehavior._33.if.exit.14                            # ir inst 84 fin
.F.simulateSwitchBehavior._33.if.exit.14:
# Phi connections
  j .F.simulateSwitchBehavior._34.if.exit.13                            # ir inst 86 fin
.F.simulateSwitchBehavior._34.if.exit.13:
# Phi connections
  j .F.simulateSwitchBehavior._35.if.exit.12                            # ir inst 88 fin
.F.simulateSwitchBehavior._35.if.exit.12:
# Phi connections
  j .F.simulateSwitchBehavior._36.if.exit.11                            # ir inst 90 fin
.F.simulateSwitchBehavior._36.if.exit.11:
# Phi connections
  j .F.simulateSwitchBehavior._37.if.exit.10                            # ir inst 92 fin
.F.simulateSwitchBehavior._37.if.exit.10:
# Phi connections
  j .F.simulateSwitchBehavior._38.if.exit.9                             # ir inst 94 fin
.F.simulateSwitchBehavior._38.if.exit.9:
# Phi connections
  j .F.simulateSwitchBehavior._39.if.exit.8                             # ir inst 96 fin
.F.simulateSwitchBehavior._39.if.exit.8:
# Phi connections
  j .F.simulateSwitchBehavior._40.if.exit.7                             # ir inst 98 fin
.F.simulateSwitchBehavior._40.if.exit.7:
# Phi connections
  j .F.simulateSwitchBehavior._41.if.exit.6                             # ir inst 100 fin
.F.simulateSwitchBehavior._41.if.exit.6:
# Phi connections
  j .F.simulateSwitchBehavior._42.if.exit.5                             # ir inst 102 fin
.F.simulateSwitchBehavior._42.if.exit.5:
# Phi connections
  j .F.simulateSwitchBehavior._43.if.exit.4                             # ir inst 104 fin
.F.simulateSwitchBehavior._43.if.exit.4:
# Phi connections
  j .F.simulateSwitchBehavior._44.if.exit.3                             # ir inst 106 fin
.F.simulateSwitchBehavior._44.if.exit.3:
# Phi connections
  j .F.simulateSwitchBehavior._45.if.exit.2                             # ir inst 108 fin
.F.simulateSwitchBehavior._45.if.exit.2:
# Phi connections
  j .F.simulateSwitchBehavior._46.if.exit.1                             # ir inst 110 fin
.F.simulateSwitchBehavior._46.if.exit.1:
# Phi connections
  j .F.simulateSwitchBehavior._47.if.exit.0                             # ir inst 112 fin
.F.simulateSwitchBehavior._47.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 114 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.simulateSwitchBehavior._1.while.cond.0                           # ir inst 115 fin
.F.simulateSwitchBehavior._48.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 116 fin
  mv a0, t6
  j .F.simulateSwitchBehavior.epilogue                                  # ir inst 117 fin
.F.simulateSwitchBehavior.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.processCase0
.F.processCase0:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase0._0.entry.0:
  slli t6, a0, 1                                                        # ir inst 1 fin
  mv a0, t6
  j .F.processCase0.epilogue                                            # ir inst 2 fin
.F.processCase0.epilogue:
  ret

.globl .F.processCase1
.F.processCase1:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase1._0.entry.0:
  li t2, 3
  mul t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase1.epilogue                                            # ir inst 3 fin
.F.processCase1.epilogue:
  ret

.globl .F.processCase2
.F.processCase2:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase2._0.entry.0:
  mul t6, a0, a0                                                        # ir inst 1 fin
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase2.epilogue                                            # ir inst 3 fin
.F.processCase2.epilogue:
  ret

.globl .F.processCase3
.F.processCase3:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase3._0.entry.0:
  addi t6, a0, 5                                                        # ir inst 1 fin
  slli t5, t6, 1                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase3.epilogue                                            # ir inst 3 fin
.F.processCase3.epilogue:
  ret

.globl .F.processCase4
.F.processCase4:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase4._0.entry.0:
  li t2, 2
  div t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 10                                                       # ir inst 2 fin
  mv a0, t5
  j .F.processCase4.epilogue                                            # ir inst 3 fin
.F.processCase4.epilogue:
  ret

.globl .F.processCase5
.F.processCase5:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase5._0.entry.0:
  li t2, 7
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 11
  rem t5, a0, t2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  mv a0, t4
  j .F.processCase5.epilogue                                            # ir inst 4 fin
.F.processCase5.epilogue:
  ret

.globl .F.processCase6
.F.processCase6:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase6._0.entry.0:
  li t2, 7
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 23
  rem t5, t6, t2                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase6.epilogue                                            # ir inst 3 fin
.F.processCase6.epilogue:
  ret

.globl .F.processCase7
.F.processCase7:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase7._0.entry.0:
  addi t6, a0, 3                                                        # ir inst 1 fin
  addi t5, a0, 7                                                        # ir inst 2 fin
  mul t4, t6, t5                                                        # ir inst 3 fin
  li t2, 50
  rem t6, t4, t2                                                        # ir inst 4 fin
  mv a0, t6
  j .F.processCase7.epilogue                                            # ir inst 5 fin
.F.processCase7.epilogue:
  ret

.globl .F.processCase8
.F.processCase8:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase8._0.entry.0:
  xori t6, a0, 42                                                       # ir inst 1 fin
  mv a0, t6
  j .F.processCase8.epilogue                                            # ir inst 2 fin
.F.processCase8.epilogue:
  ret

.globl .F.processCase9
.F.processCase9:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase9._0.entry.0:
  li t2, 13
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 17
  rem t5, t6, t2                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase9.epilogue                                            # ir inst 3 fin
.F.processCase9.epilogue:
  ret

.globl .F.processCase10
.F.processCase10:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase10._0.entry.0:
  li t2, 3
  div t6, a0, t2                                                        # ir inst 1 fin
  add t5, a0, t6                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase10.epilogue                                           # ir inst 3 fin
.F.processCase10.epilogue:
  ret

.globl .F.processCase11
.F.processCase11:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase11._0.entry.0:
  li t2, 19
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 31
  rem t5, t6, t2                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase11.epilogue                                           # ir inst 3 fin
.F.processCase11.epilogue:
  ret

.globl .F.processCase12
.F.processCase12:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase12._0.entry.0:
  slli t6, a0, 1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  li t2, 25
  rem t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.processCase12.epilogue                                           # ir inst 4 fin
.F.processCase12.epilogue:
  ret

.globl .F.processCase13
.F.processCase13:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase13._0.entry.0:
  li t2, 6
  rem t6, a0, t2                                                        # ir inst 1 fin
  mul t5, t6, a0                                                        # ir inst 2 fin
  li t2, 8
  rem t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.processCase13.epilogue                                           # ir inst 4 fin
.F.processCase13.epilogue:
  ret

.globl .F.processCase14
.F.processCase14:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase14._0.entry.0:
  addi t6, a0, 47                                                       # ir inst 1 fin
  mv a0, t6
  j .F.processCase14.epilogue                                           # ir inst 2 fin
.F.processCase14.epilogue:
  ret

.globl .F.processCase15
.F.processCase15:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processCase15._0.entry.0:
  li t2, 37
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 41
  rem t5, t6, t2                                                        # ir inst 2 fin
  mv a0, t5
  j .F.processCase15.epilogue                                           # ir inst 3 fin
.F.processCase15.epilogue:
  ret

.globl .F.performGraphAlgorithms
.F.performGraphAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performGraphAlgorithms._0.entry.0:
# Start call preparation
  li a0, 2003
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performGraphTraversal
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.performShortestPath
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.performConnectivityTest
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 2004
  call printlnInt
# ir inst 8 fin
  j .F.performGraphAlgorithms.epilogue                                  # ir inst 9 fin
.F.performGraphAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performGraphTraversal
.F.performGraphTraversal:
# spill func args num: 0,             range:    10224(sp) -    10224(sp)
# local var size: 10200,              range:       24(sp) -    10224(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10224
  add sp, sp, t0
  sd ra, 16(sp)
.F.performGraphTraversal._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performGraphTraversal._1.array.cond.0                            # ir inst 3 fin
.F.performGraphTraversal._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performGraphTraversal._2.array.body.0
  j .F.performGraphTraversal._3.array.exit.0                            # ir inst 6 fin
.F.performGraphTraversal._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performGraphTraversal._1.array.cond.0                            # ir inst 10 fin
.F.performGraphTraversal._3.array.exit.0:
  li t1, 10024
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.performGraphTraversal._4.array.cond.1                            # ir inst 13 fin
.F.performGraphTraversal._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.performGraphTraversal._5.array.body.1
  j .F.performGraphTraversal._6.array.exit.1                            # ir inst 16 fin
.F.performGraphTraversal._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.performGraphTraversal._4.array.cond.1                            # ir inst 20 fin
.F.performGraphTraversal._6.array.exit.1:
# Start call preparation
  li a1, 50
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeRandomGraph
# ir inst 21 fin
# Start call preparation
  li a3, 0
  li a2, 50
  li t1, 10024
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.depthFirstSearch
  mv t6, a0
# ir inst 22 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 50
  li t1, 10024
  add t1, sp, t1
  mv a0, t1
  call .F.resetArray
  ld t6, 0(sp)
# ir inst 23 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 0
  li a2, 50
  li t1, 10024
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.breadthFirstSearch
  mv t5, a0
  ld t6, 0(sp)
# ir inst 24 fin
  add t4, t6, t5                                                        # ir inst 25 fin
  mv a0, t4
  j .F.performGraphTraversal.epilogue                                   # ir inst 26 fin
.F.performGraphTraversal.epilogue:
  ld ra, 16(sp)
  li t0, 10224
  add sp, sp, t0
  ret

.globl .F.initializeRandomGraph
.F.initializeRandomGraph:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 4,                  range:       40(sp) -       44(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.initializeRandomGraph._0.entry.0:
# alloca %2
  addi t2, sp, 40
  li t1, 12345
  sw t1, 0(t2)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.initializeRandomGraph._1.while.cond.0                            # ir inst 3 fin
.F.initializeRandomGraph._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 5 fin
  bnez t5, .F.initializeRandomGraph._2.while.body.0
  j .F.initializeRandomGraph._12.while.exit.0                           # ir inst 6 fin
.F.initializeRandomGraph._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeRandomGraph._3.while.cond.1                            # ir inst 7 fin
.F.initializeRandomGraph._3.while.cond.1:
  sltu t4, t5, a1                                                       # ir inst 9 fin
  bnez t4, .F.initializeRandomGraph._4.while.body.1
  j .F.initializeRandomGraph._11.while.exit.1                           # ir inst 10 fin
.F.initializeRandomGraph._4.while.body.1:
  xor t0, t6, t5
  sltu t4, zero, t0                                                     # ir inst 11 fin
  bnez t4, .F.initializeRandomGraph._5.if.then.0
  j .F.initializeRandomGraph._9.if.else.0                               # ir inst 12 fin
.F.initializeRandomGraph._5.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 40
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 13 fin
  addi t1, sp, 40
  lw t4, 0(t1)                                                          # ir inst 14 fin
  li t2, 100
  rem t3, t4, t2                                                        # ir inst 15 fin
  li t2, 20
  slt t4, t3, t2                                                        # ir inst 16 fin
  bnez t4, .F.initializeRandomGraph._6.if.then.1
  j .F.initializeRandomGraph._7.if.else.1                               # ir inst 17 fin
.F.initializeRandomGraph._6.if.then.1:
  mul t4, t6, a1                                                        # ir inst 18 fin
  add t3, t4, t5                                                        # ir inst 19 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 20 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 21 fin
  mul t4, t5, a1                                                        # ir inst 22 fin
  add t3, t4, t6                                                        # ir inst 23 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 24 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 25 fin
  j .F.initializeRandomGraph._8.if.exit.1                               # ir inst 26 fin
.F.initializeRandomGraph._7.if.else.1:
  j .F.initializeRandomGraph._8.if.exit.1                               # ir inst 27 fin
.F.initializeRandomGraph._8.if.exit.1:
  j .F.initializeRandomGraph._10.if.exit.0                              # ir inst 28 fin
.F.initializeRandomGraph._9.if.else.0:
  j .F.initializeRandomGraph._10.if.exit.0                              # ir inst 29 fin
.F.initializeRandomGraph._10.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.initializeRandomGraph._3.while.cond.1                            # ir inst 31 fin
.F.initializeRandomGraph._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t6, t5
  j .F.initializeRandomGraph._1.while.cond.0                            # ir inst 33 fin
.F.initializeRandomGraph._12.while.exit.0:
  j .F.initializeRandomGraph.epilogue                                   # ir inst 34 fin
.F.initializeRandomGraph.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.resetArray
.F.resetArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.resetArray._0.entry.0:
# Phi connections
  li t6, 0
  j .F.resetArray._1.while.cond.0                                       # ir inst 1 fin
.F.resetArray._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.resetArray._2.while.body.0
  j .F.resetArray._3.while.exit.0                                       # ir inst 4 fin
.F.resetArray._2.while.body.0:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 6 fin
  addi t5, t6, 1                                                        # ir inst 7 fin
# Phi connections
  mv t6, t5
  j .F.resetArray._1.while.cond.0                                       # ir inst 8 fin
.F.resetArray._3.while.exit.0:
  j .F.resetArray.epilogue                                              # ir inst 9 fin
.F.resetArray.epilogue:
  ret

.globl .F.depthFirstSearch
.F.depthFirstSearch:
# spill func args num: 0,             range:     8032(sp) -     8032(sp)
# local var size: 8000,               range:       32(sp) -     8032(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8032
  add sp, sp, t0
  sd s10, 0(sp)
  sd s11, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
.F.depthFirstSearch._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.depthFirstSearch._1.array.cond.0                                 # ir inst 3 fin
.F.depthFirstSearch._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.depthFirstSearch._2.array.body.0
  j .F.depthFirstSearch._3.array.exit.0                                 # ir inst 6 fin
.F.depthFirstSearch._2.array.body.0:
  slli t2, t5, 3
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.depthFirstSearch._1.array.cond.0                                 # ir inst 10 fin
.F.depthFirstSearch._3.array.exit.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 11 fin
  sd a3, 0(t6)                                                          # ir inst 12 fin
# Phi connections
  li t5, 1
  li t6, 0
  j .F.depthFirstSearch._4.while.cond.0                                 # ir inst 13 fin
.F.depthFirstSearch._4.while.cond.0:
  li t2, 0
  sltu t4, t2, t5                                                       # ir inst 16 fin
  bnez t4, .F.depthFirstSearch._5.while.body.0
  j .F.depthFirstSearch._18.while.exit.0                                # ir inst 17 fin
.F.depthFirstSearch._5.while.body.0:
  addi t4, t5, -1                                                       # ir inst 18 fin
  slli t2, t4, 3
  addi t1, sp, 32
  add t5, t1, t2                                                        # ir inst 19 fin
  ld t3, 0(t5)                                                          # ir inst 20 fin
  slli t2, t3, 2
  add t5, a1, t2                                                        # ir inst 21 fin
  lw s11, 0(t5)                                                         # ir inst 22 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t5, t0, 1                                                       # ir inst 23 fin
  bnez t5, .F.depthFirstSearch._6.if.then.0
  j .F.depthFirstSearch._16.if.else.0                                   # ir inst 24 fin
.F.depthFirstSearch._6.if.then.0:
  slli t2, t3, 2
  add t5, a1, t2                                                        # ir inst 25 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 26 fin
  addi t5, t6, 1                                                        # ir inst 27 fin
# Phi connections
  mv s10, t4
  li s11, 0
  j .F.depthFirstSearch._7.while.cond.1                                 # ir inst 28 fin
.F.depthFirstSearch._7.while.cond.1:
  sltu s9, s11, a2                                                      # ir inst 31 fin
  bnez s9, .F.depthFirstSearch._8.while.body.1
  j .F.depthFirstSearch._15.while.exit.1                                # ir inst 32 fin
.F.depthFirstSearch._8.while.body.1:
  mul s9, t3, a2                                                        # ir inst 33 fin
  add s8, s9, s11                                                       # ir inst 34 fin
  slli t2, s8, 2
  add s9, a0, t2                                                        # ir inst 35 fin
  lw s8, 0(s9)                                                          # ir inst 36 fin
  li t2, 1
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 37 fin
  bnez s9, .F.depthFirstSearch._9.lazy.then.0
  j .F.depthFirstSearch._10.lazy.else.0                                 # ir inst 38 fin
.F.depthFirstSearch._9.lazy.then.0:
  slli t2, s11, 2
  add s9, a1, t2                                                        # ir inst 39 fin
  lw s8, 0(s9)                                                          # ir inst 40 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 41 fin
# Phi connections
  j .F.depthFirstSearch._11.lazy.exit.0                                 # ir inst 42 fin
.F.depthFirstSearch._10.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.depthFirstSearch._11.lazy.exit.0                                 # ir inst 43 fin
.F.depthFirstSearch._11.lazy.exit.0:
  bnez s9, .F.depthFirstSearch._12.if.then.1
  j .F.depthFirstSearch._13.if.else.1                                   # ir inst 45 fin
.F.depthFirstSearch._12.if.then.1:
  slli t2, s10, 3
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 46 fin
  sd s11, 0(s9)                                                         # ir inst 47 fin
  addi s9, s10, 1                                                       # ir inst 48 fin
# Phi connections
  j .F.depthFirstSearch._14.if.exit.1                                   # ir inst 49 fin
.F.depthFirstSearch._13.if.else.1:
# Phi connections
  mv s9, s10
  j .F.depthFirstSearch._14.if.exit.1                                   # ir inst 50 fin
.F.depthFirstSearch._14.if.exit.1:
  addi s8, s11, 1                                                       # ir inst 52 fin
# Phi connections
  mv s10, s9
  mv s11, s8
  j .F.depthFirstSearch._7.while.cond.1                                 # ir inst 53 fin
.F.depthFirstSearch._15.while.exit.1:
# Phi connections
  mv t4, s10
  j .F.depthFirstSearch._17.if.exit.0                                   # ir inst 54 fin
.F.depthFirstSearch._16.if.else.0:
# Phi connections
  mv t5, t6
  j .F.depthFirstSearch._17.if.exit.0                                   # ir inst 55 fin
.F.depthFirstSearch._17.if.exit.0:
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.depthFirstSearch._4.while.cond.0                                 # ir inst 58 fin
.F.depthFirstSearch._18.while.exit.0:
  mv a0, t6
  j .F.depthFirstSearch.epilogue                                        # ir inst 59 fin
.F.depthFirstSearch.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  li t0, 8032
  add sp, sp, t0
  ret

.globl .F.breadthFirstSearch
.F.breadthFirstSearch:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       40(sp) -      440(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd s10, 0(sp)
  sd s11, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s7, 32(sp)
.F.breadthFirstSearch._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.breadthFirstSearch._1.array.cond.0                               # ir inst 3 fin
.F.breadthFirstSearch._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.breadthFirstSearch._2.array.body.0
  j .F.breadthFirstSearch._3.array.exit.0                               # ir inst 6 fin
.F.breadthFirstSearch._2.array.body.0:
  slli t2, t5, 3
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.breadthFirstSearch._1.array.cond.0                               # ir inst 10 fin
.F.breadthFirstSearch._3.array.exit.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 11 fin
  sd a3, 0(t6)                                                          # ir inst 12 fin
  slli t2, a3, 2
  add t6, a1, t2                                                        # ir inst 13 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 14 fin
# Phi connections
  li t4, 1
  li t5, 1
  li t6, 0
  j .F.breadthFirstSearch._4.while.cond.0                               # ir inst 15 fin
.F.breadthFirstSearch._4.while.cond.0:
  sltu t3, t6, t5                                                       # ir inst 19 fin
  bnez t3, .F.breadthFirstSearch._5.while.body.0
  j .F.breadthFirstSearch._15.while.exit.0                              # ir inst 20 fin
.F.breadthFirstSearch._5.while.body.0:
  slli t2, t6, 3
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 21 fin
  ld s11, 0(t3)                                                         # ir inst 22 fin
  addi t3, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv s10, t4
  mv t6, t5
  li t5, 0
  j .F.breadthFirstSearch._6.while.cond.1                               # ir inst 24 fin
.F.breadthFirstSearch._6.while.cond.1:
  sltu s9, t5, a2                                                       # ir inst 28 fin
  bnez s9, .F.breadthFirstSearch._7.while.body.1
  j .F.breadthFirstSearch._14.while.exit.1                              # ir inst 29 fin
.F.breadthFirstSearch._7.while.body.1:
  mul s9, s11, a2                                                       # ir inst 30 fin
  add s8, s9, t5                                                        # ir inst 31 fin
  slli t2, s8, 2
  add s9, a0, t2                                                        # ir inst 32 fin
  lw s8, 0(s9)                                                          # ir inst 33 fin
  li t2, 1
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 34 fin
  bnez s9, .F.breadthFirstSearch._8.lazy.then.0
  j .F.breadthFirstSearch._9.lazy.else.0                                # ir inst 35 fin
.F.breadthFirstSearch._8.lazy.then.0:
  slli t2, t5, 2
  add s9, a1, t2                                                        # ir inst 36 fin
  lw s8, 0(s9)                                                          # ir inst 37 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 38 fin
# Phi connections
  j .F.breadthFirstSearch._10.lazy.exit.0                               # ir inst 39 fin
.F.breadthFirstSearch._9.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.breadthFirstSearch._10.lazy.exit.0                               # ir inst 40 fin
.F.breadthFirstSearch._10.lazy.exit.0:
  bnez s9, .F.breadthFirstSearch._11.if.then.0
  j .F.breadthFirstSearch._12.if.else.0                                 # ir inst 42 fin
.F.breadthFirstSearch._11.if.then.0:
  slli t2, t5, 2
  add s9, a1, t2                                                        # ir inst 43 fin
  li t1, 1
  sw t1, 0(s9)                                                          # ir inst 44 fin
  addi s9, s10, 1                                                       # ir inst 45 fin
  slli t2, t6, 3
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 46 fin
  sd t5, 0(s8)                                                          # ir inst 47 fin
  addi s8, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t0, s8
  mv s8, s9
  mv s9, t0
  j .F.breadthFirstSearch._13.if.exit.0                                 # ir inst 49 fin
.F.breadthFirstSearch._12.if.else.0:
# Phi connections
  mv s8, s10
  mv s9, t6
  j .F.breadthFirstSearch._13.if.exit.0                                 # ir inst 50 fin
.F.breadthFirstSearch._13.if.exit.0:
  addi s7, t5, 1                                                        # ir inst 53 fin
# Phi connections
  mv s10, s8
  mv t5, s7
  mv t6, s9
  j .F.breadthFirstSearch._6.while.cond.1                               # ir inst 54 fin
.F.breadthFirstSearch._14.while.exit.1:
# Phi connections
  mv t4, s10
  mv t5, t6
  mv t6, t3
  j .F.breadthFirstSearch._4.while.cond.0                               # ir inst 55 fin
.F.breadthFirstSearch._15.while.exit.0:
  mv a0, t4
  j .F.breadthFirstSearch.epilogue                                      # ir inst 56 fin
.F.breadthFirstSearch.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s7, 32(sp)
  addi sp, sp, 448
  ret

.globl .F.performShortestPath
.F.performShortestPath:
# spill func args num: 0,             range:    10032(sp) -    10032(sp)
# local var size: 10000,              range:       24(sp) -    10024(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10032
  add sp, sp, t0
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd ra, 16(sp)
.F.performShortestPath._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performShortestPath._1.array.cond.0                              # ir inst 3 fin
.F.performShortestPath._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performShortestPath._2.array.body.0
  j .F.performShortestPath._3.array.exit.0                              # ir inst 6 fin
.F.performShortestPath._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performShortestPath._1.array.cond.0                              # ir inst 10 fin
.F.performShortestPath._3.array.exit.0:
# Start call preparation
  li a1, 50
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeDistanceMatrix
# ir inst 11 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 24
  mv a0, t1
  call .F.floydWarshall
# ir inst 12 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performShortestPath._4.while.cond.0                              # ir inst 13 fin
.F.performShortestPath._4.while.cond.0:
  li t2, 50
  sltu t4, t6, t2                                                       # ir inst 16 fin
  bnez t4, .F.performShortestPath._5.while.body.0
  j .F.performShortestPath._15.while.exit.0                             # ir inst 17 fin
.F.performShortestPath._5.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.performShortestPath._6.while.cond.1                              # ir inst 18 fin
.F.performShortestPath._6.while.cond.1:
  li t2, 50
  sltu s11, t4, t2                                                      # ir inst 21 fin
  bnez s11, .F.performShortestPath._7.while.body.1
  j .F.performShortestPath._14.while.exit.1                             # ir inst 22 fin
.F.performShortestPath._7.while.body.1:
  xor t0, t6, t4
  sltu s11, zero, t0                                                    # ir inst 23 fin
  bnez s11, .F.performShortestPath._8.lazy.then.0
  j .F.performShortestPath._9.lazy.else.0                               # ir inst 24 fin
.F.performShortestPath._8.lazy.then.0:
  li t2, 50
  mul s11, t6, t2                                                       # ir inst 25 fin
  add s10, s11, t4                                                      # ir inst 26 fin
  slli t2, s10, 2
  addi t1, sp, 24
  add s11, t1, t2                                                       # ir inst 27 fin
  lw s10, 0(s11)                                                        # ir inst 28 fin
  li t2, 1000000
  slt s11, s10, t2                                                      # ir inst 29 fin
# Phi connections
  j .F.performShortestPath._10.lazy.exit.0                              # ir inst 30 fin
.F.performShortestPath._9.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.performShortestPath._10.lazy.exit.0                              # ir inst 31 fin
.F.performShortestPath._10.lazy.exit.0:
  bnez s11, .F.performShortestPath._11.if.then.0
  j .F.performShortestPath._12.if.else.0                                # ir inst 33 fin
.F.performShortestPath._11.if.then.0:
  li t2, 50
  mul s11, t6, t2                                                       # ir inst 34 fin
  add s10, s11, t4                                                      # ir inst 35 fin
  slli t2, s10, 2
  addi t1, sp, 24
  add s11, t1, t2                                                       # ir inst 36 fin
  lw s10, 0(s11)                                                        # ir inst 37 fin
  add s11, t3, s10                                                      # ir inst 38 fin
# Phi connections
  j .F.performShortestPath._13.if.exit.0                                # ir inst 39 fin
.F.performShortestPath._12.if.else.0:
# Phi connections
  mv s11, t3
  j .F.performShortestPath._13.if.exit.0                                # ir inst 40 fin
.F.performShortestPath._13.if.exit.0:
  addi s10, t4, 1                                                       # ir inst 42 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.performShortestPath._6.while.cond.1                              # ir inst 43 fin
.F.performShortestPath._14.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performShortestPath._4.while.cond.0                              # ir inst 45 fin
.F.performShortestPath._15.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 46 fin
  mv a0, t6
  j .F.performShortestPath.epilogue                                     # ir inst 47 fin
.F.performShortestPath.epilogue:
  ld ra, 16(sp)
  ld s11, 0(sp)
  ld s10, 8(sp)
  li t0, 10032
  add sp, sp, t0
  ret

.globl .F.initializeDistanceMatrix
.F.initializeDistanceMatrix:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 4,                  range:       48(sp) -       52(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.initializeDistanceMatrix._0.entry.0:
# alloca %2
  addi t2, sp, 48
  li t1, 54321
  sw t1, 0(t2)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.initializeDistanceMatrix._1.while.cond.0                         # ir inst 3 fin
.F.initializeDistanceMatrix._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 5 fin
  bnez t5, .F.initializeDistanceMatrix._2.while.body.0
  j .F.initializeDistanceMatrix._12.while.exit.0                        # ir inst 6 fin
.F.initializeDistanceMatrix._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeDistanceMatrix._3.while.cond.1                         # ir inst 7 fin
.F.initializeDistanceMatrix._3.while.cond.1:
  sltu t4, t5, a1                                                       # ir inst 9 fin
  bnez t4, .F.initializeDistanceMatrix._4.while.body.1
  j .F.initializeDistanceMatrix._11.while.exit.1                        # ir inst 10 fin
.F.initializeDistanceMatrix._4.while.body.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 11 fin
  bnez t4, .F.initializeDistanceMatrix._5.if.then.0
  j .F.initializeDistanceMatrix._6.if.else.0                            # ir inst 12 fin
.F.initializeDistanceMatrix._5.if.then.0:
  mul t4, t6, a1                                                        # ir inst 13 fin
  add t3, t4, t5                                                        # ir inst 14 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 16 fin
  j .F.initializeDistanceMatrix._10.if.exit.0                           # ir inst 17 fin
.F.initializeDistanceMatrix._6.if.else.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 18 fin
  addi t1, sp, 48
  lw t4, 0(t1)                                                          # ir inst 19 fin
  li t2, 100
  rem t3, t4, t2                                                        # ir inst 20 fin
  li t2, 30
  slt t4, t3, t2                                                        # ir inst 21 fin
  bnez t4, .F.initializeDistanceMatrix._7.if.then.1
  j .F.initializeDistanceMatrix._8.if.else.1                            # ir inst 22 fin
.F.initializeDistanceMatrix._7.if.then.1:
  mul t4, t6, a1                                                        # ir inst 23 fin
  add t3, t4, t5                                                        # ir inst 24 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 25 fin
  addi t1, sp, 48
  lw t3, 0(t1)                                                          # ir inst 26 fin
  li t2, 20
  rem s11, t3, t2                                                       # ir inst 27 fin
  addi t3, s11, 1                                                       # ir inst 28 fin
  sw t3, 0(t4)                                                          # ir inst 29 fin
  j .F.initializeDistanceMatrix._9.if.exit.1                            # ir inst 30 fin
.F.initializeDistanceMatrix._8.if.else.1:
  mul t4, t6, a1                                                        # ir inst 31 fin
  add t3, t4, t5                                                        # ir inst 32 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 33 fin
  li t1, 1000000
  sw t1, 0(t4)                                                          # ir inst 34 fin
  j .F.initializeDistanceMatrix._9.if.exit.1                            # ir inst 35 fin
.F.initializeDistanceMatrix._9.if.exit.1:
  j .F.initializeDistanceMatrix._10.if.exit.0                           # ir inst 36 fin
.F.initializeDistanceMatrix._10.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 37 fin
# Phi connections
  mv t5, t4
  j .F.initializeDistanceMatrix._3.while.cond.1                         # ir inst 38 fin
.F.initializeDistanceMatrix._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F.initializeDistanceMatrix._1.while.cond.0                         # ir inst 40 fin
.F.initializeDistanceMatrix._12.while.exit.0:
  j .F.initializeDistanceMatrix.epilogue                                # ir inst 41 fin
.F.initializeDistanceMatrix.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 64
  ret

.globl .F.floydWarshall
.F.floydWarshall:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s11, 16(sp)
.F.floydWarshall._0.entry.0:
# Phi connections
  li t6, 0
  j .F.floydWarshall._1.while.cond.0                                    # ir inst 1 fin
.F.floydWarshall._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.floydWarshall._2.while.body.0
  j .F.floydWarshall._12.while.exit.0                                   # ir inst 4 fin
.F.floydWarshall._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.floydWarshall._3.while.cond.1                                    # ir inst 5 fin
.F.floydWarshall._3.while.cond.1:
  sltu t4, t5, a1                                                       # ir inst 7 fin
  bnez t4, .F.floydWarshall._4.while.body.1
  j .F.floydWarshall._11.while.exit.1                                   # ir inst 8 fin
.F.floydWarshall._4.while.body.1:
# Phi connections
  li t4, 0
  j .F.floydWarshall._5.while.cond.2                                    # ir inst 9 fin
.F.floydWarshall._5.while.cond.2:
  sltu t3, t4, a1                                                       # ir inst 11 fin
  bnez t3, .F.floydWarshall._6.while.body.2
  j .F.floydWarshall._10.while.exit.2                                   # ir inst 12 fin
.F.floydWarshall._6.while.body.2:
  mul t3, t5, a1                                                        # ir inst 13 fin
  add s11, t3, t4                                                       # ir inst 14 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 15 fin
  lw s11, 0(t3)                                                         # ir inst 16 fin
  mul t3, t5, a1                                                        # ir inst 17 fin
  add s10, t3, t6                                                       # ir inst 18 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 19 fin
  lw s10, 0(t3)                                                         # ir inst 20 fin
  mul t3, t6, a1                                                        # ir inst 21 fin
  add s9, t3, t4                                                        # ir inst 22 fin
  slli t2, s9, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  lw s9, 0(t3)                                                          # ir inst 24 fin
  add t3, s10, s9                                                       # ir inst 25 fin
  slt s10, t3, s11                                                      # ir inst 26 fin
  bnez s10, .F.floydWarshall._7.if.then.0
  j .F.floydWarshall._8.if.else.0                                       # ir inst 27 fin
.F.floydWarshall._7.if.then.0:
  mul s11, t5, a1                                                       # ir inst 28 fin
  add s10, s11, t4                                                      # ir inst 29 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  sw t3, 0(s11)                                                         # ir inst 31 fin
  j .F.floydWarshall._9.if.exit.0                                       # ir inst 32 fin
.F.floydWarshall._8.if.else.0:
  j .F.floydWarshall._9.if.exit.0                                       # ir inst 33 fin
.F.floydWarshall._9.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 34 fin
# Phi connections
  mv t4, t3
  j .F.floydWarshall._5.while.cond.2                                    # ir inst 35 fin
.F.floydWarshall._10.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 36 fin
# Phi connections
  mv t5, t4
  j .F.floydWarshall._3.while.cond.1                                    # ir inst 37 fin
.F.floydWarshall._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t6, t5
  j .F.floydWarshall._1.while.cond.0                                    # ir inst 39 fin
.F.floydWarshall._12.while.exit.0:
  j .F.floydWarshall.epilogue                                           # ir inst 40 fin
.F.floydWarshall.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.performConnectivityTest
.F.performConnectivityTest:
# spill func args num: 0,             range:    10016(sp) -    10016(sp)
# local var size: 10000,              range:       16(sp) -    10016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10016
  add sp, sp, t0
  sd ra, 8(sp)
.F.performConnectivityTest._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performConnectivityTest._1.array.cond.0                          # ir inst 3 fin
.F.performConnectivityTest._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performConnectivityTest._2.array.body.0
  j .F.performConnectivityTest._3.array.exit.0                          # ir inst 6 fin
.F.performConnectivityTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performConnectivityTest._1.array.cond.0                          # ir inst 10 fin
.F.performConnectivityTest._3.array.exit.0:
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeRandomGraph
# ir inst 11 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.countConnectedComponents
  mv t6, a0
# ir inst 12 fin
  mv a0, t6
  j .F.performConnectivityTest.epilogue                                 # ir inst 13 fin
.F.performConnectivityTest.epilogue:
  ld ra, 8(sp)
  li t0, 10016
  add sp, sp, t0
  ret

.globl .F.countConnectedComponents
.F.countConnectedComponents:
# spill func args num: 0,             range:      256(sp) -      256(sp)
# local var size: 200,                range:       48(sp) -      248(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -256
  sd ra, 40(sp)
.F.countConnectedComponents._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.countConnectedComponents._1.array.cond.0                         # ir inst 3 fin
.F.countConnectedComponents._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.countConnectedComponents._2.array.body.0
  j .F.countConnectedComponents._3.array.exit.0                         # ir inst 6 fin
.F.countConnectedComponents._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.countConnectedComponents._1.array.cond.0                         # ir inst 10 fin
.F.countConnectedComponents._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.countConnectedComponents._4.while.cond.0                         # ir inst 11 fin
.F.countConnectedComponents._4.while.cond.0:
  sltu t4, t5, a1                                                       # ir inst 14 fin
  bnez t4, .F.countConnectedComponents._5.while.body.0
  j .F.countConnectedComponents._9.while.exit.0                         # ir inst 15 fin
.F.countConnectedComponents._5.while.body.0:
  slli t2, t5, 2
  addi t1, sp, 48
  add t4, t1, t2                                                        # ir inst 16 fin
  lw t3, 0(t4)                                                          # ir inst 17 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 18 fin
  bnez t4, .F.countConnectedComponents._6.if.then.0
  j .F.countConnectedComponents._7.if.else.0                            # ir inst 19 fin
.F.countConnectedComponents._6.if.then.0:
  addi t4, t6, 1                                                        # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a3, t5
  mv a2, a1
  addi t1, sp, 48
  mv a1, t1
  call .F.dfsMarkComponent
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 21 fin
# Phi connections
  j .F.countConnectedComponents._8.if.exit.0                            # ir inst 22 fin
.F.countConnectedComponents._7.if.else.0:
# Phi connections
  mv t4, t6
  j .F.countConnectedComponents._8.if.exit.0                            # ir inst 23 fin
.F.countConnectedComponents._8.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 25 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.countConnectedComponents._4.while.cond.0                         # ir inst 26 fin
.F.countConnectedComponents._9.while.exit.0:
  mv a0, t6
  j .F.countConnectedComponents.epilogue                                # ir inst 27 fin
.F.countConnectedComponents.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 256
  ret

.globl .F.dfsMarkComponent
.F.dfsMarkComponent:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.dfsMarkComponent._0.entry.0:
  slli t2, a3, 2
  add t6, a1, t2                                                        # ir inst 1 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.dfsMarkComponent._1.while.cond.0                                 # ir inst 3 fin
.F.dfsMarkComponent._1.while.cond.0:
  sltu t5, t6, a2                                                       # ir inst 5 fin
  bnez t5, .F.dfsMarkComponent._2.while.body.0
  j .F.dfsMarkComponent._9.while.exit.0                                 # ir inst 6 fin
.F.dfsMarkComponent._2.while.body.0:
  mul t5, a3, a2                                                        # ir inst 7 fin
  add t4, t5, t6                                                        # ir inst 8 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 11 fin
  bnez t5, .F.dfsMarkComponent._3.lazy.then.0
  j .F.dfsMarkComponent._4.lazy.else.0                                  # ir inst 12 fin
.F.dfsMarkComponent._3.lazy.then.0:
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 13 fin
  lw t4, 0(t5)                                                          # ir inst 14 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 15 fin
# Phi connections
  j .F.dfsMarkComponent._5.lazy.exit.0                                  # ir inst 16 fin
.F.dfsMarkComponent._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.dfsMarkComponent._5.lazy.exit.0                                  # ir inst 17 fin
.F.dfsMarkComponent._5.lazy.exit.0:
  bnez t5, .F.dfsMarkComponent._6.if.then.0
  j .F.dfsMarkComponent._7.if.else.0                                    # ir inst 19 fin
.F.dfsMarkComponent._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a3, t6
  call .F.dfsMarkComponent
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 20 fin
  j .F.dfsMarkComponent._8.if.exit.0                                    # ir inst 21 fin
.F.dfsMarkComponent._7.if.else.0:
  j .F.dfsMarkComponent._8.if.exit.0                                    # ir inst 22 fin
.F.dfsMarkComponent._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t6, t5
  j .F.dfsMarkComponent._1.while.cond.0                                 # ir inst 24 fin
.F.dfsMarkComponent._9.while.exit.0:
  j .F.dfsMarkComponent.epilogue                                        # ir inst 25 fin
.F.dfsMarkComponent.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.performDynamicProgramming
.F.performDynamicProgramming:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performDynamicProgramming._0.entry.0:
# Start call preparation
  li a0, 2005
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.longestCommonSubsequence
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.knapsackProblem
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.editDistance
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 2006
  call printlnInt
# ir inst 8 fin
  j .F.performDynamicProgramming.epilogue                               # ir inst 9 fin
.F.performDynamicProgramming.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.longestCommonSubsequence
.F.longestCommonSubsequence:
# spill func args num: 0,             range:     3472(sp) -     3472(sp)
# local var size: 3444,               range:       24(sp) -     3468(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3472
  add sp, sp, t0
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd ra, 16(sp)
.F.longestCommonSubsequence._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._1.array.cond.0                         # ir inst 3 fin
.F.longestCommonSubsequence._1.array.cond.0:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.longestCommonSubsequence._2.array.body.0
  j .F.longestCommonSubsequence._3.array.exit.0                         # ir inst 6 fin
.F.longestCommonSubsequence._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._1.array.cond.0                         # ir inst 10 fin
.F.longestCommonSubsequence._3.array.exit.0:
  addi t1, sp, 144
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._4.array.cond.1                         # ir inst 13 fin
.F.longestCommonSubsequence._4.array.cond.1:
  li t2, 25
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.longestCommonSubsequence._5.array.body.1
  j .F.longestCommonSubsequence._6.array.exit.1                         # ir inst 16 fin
.F.longestCommonSubsequence._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._4.array.cond.1                         # ir inst 20 fin
.F.longestCommonSubsequence._6.array.exit.1:
  addi t1, sp, 244
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._7.array.cond.2                         # ir inst 23 fin
.F.longestCommonSubsequence._7.array.cond.2:
  li t2, 806
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.longestCommonSubsequence._8.array.body.2
  j .F.longestCommonSubsequence._9.array.exit.2                         # ir inst 26 fin
.F.longestCommonSubsequence._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._7.array.cond.2                         # ir inst 30 fin
.F.longestCommonSubsequence._9.array.exit.2:
# Start call preparation
  li a3, 23
  li a2, 17
  addi t1, sp, 144
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeStrings
# ir inst 31 fin
# Phi connections
  li t6, 1
  j .F.longestCommonSubsequence._10.while.cond.0                        # ir inst 32 fin
.F.longestCommonSubsequence._10.while.cond.0:
  li t2, 30
  sltu t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 34 fin
  bnez t5, .F.longestCommonSubsequence._11.while.body.0
  j .F.longestCommonSubsequence._21.while.exit.0                        # ir inst 35 fin
.F.longestCommonSubsequence._11.while.body.0:
# Phi connections
  li t5, 1
  j .F.longestCommonSubsequence._12.while.cond.1                        # ir inst 36 fin
.F.longestCommonSubsequence._12.while.cond.1:
  li t2, 25
  sltu t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 38 fin
  bnez t4, .F.longestCommonSubsequence._13.while.body.1
  j .F.longestCommonSubsequence._20.while.exit.1                        # ir inst 39 fin
.F.longestCommonSubsequence._13.while.body.1:
  addi t4, t6, -1                                                       # ir inst 40 fin
  slli t2, t4, 2
  addi t1, sp, 24
  add t3, t1, t2                                                        # ir inst 41 fin
  lw t4, 0(t3)                                                          # ir inst 42 fin
  addi t3, t5, -1                                                       # ir inst 43 fin
  slli t2, t3, 2
  addi t1, sp, 144
  add s11, t1, t2                                                       # ir inst 44 fin
  lw t3, 0(s11)                                                         # ir inst 45 fin
  xor t0, t4, t3
  sltiu s11, t0, 1                                                      # ir inst 46 fin
  bnez s11, .F.longestCommonSubsequence._14.if.then.0
  j .F.longestCommonSubsequence._15.if.else.0                           # ir inst 47 fin
.F.longestCommonSubsequence._14.if.then.0:
  li t2, 26
  mul t4, t6, t2                                                        # ir inst 48 fin
  add t3, t4, t5                                                        # ir inst 49 fin
  slli t2, t3, 2
  addi t1, sp, 244
  add t4, t1, t2                                                        # ir inst 50 fin
  addi t3, t6, -1                                                       # ir inst 51 fin
  li t2, 26
  mul s11, t3, t2                                                       # ir inst 52 fin
  addi t3, t5, -1                                                       # ir inst 53 fin
  add s10, s11, t3                                                      # ir inst 54 fin
  slli t2, s10, 2
  addi t1, sp, 244
  add t3, t1, t2                                                        # ir inst 55 fin
  lw s11, 0(t3)                                                         # ir inst 56 fin
  addi t3, s11, 1                                                       # ir inst 57 fin
  sw t3, 0(t4)                                                          # ir inst 58 fin
  j .F.longestCommonSubsequence._19.if.exit.0                           # ir inst 59 fin
.F.longestCommonSubsequence._15.if.else.0:
  addi t4, t6, -1                                                       # ir inst 60 fin
  li t2, 26
  mul t3, t4, t2                                                        # ir inst 61 fin
  add t4, t3, t5                                                        # ir inst 62 fin
  slli t2, t4, 2
  addi t1, sp, 244
  add t3, t1, t2                                                        # ir inst 63 fin
  lw t4, 0(t3)                                                          # ir inst 64 fin
  li t2, 26
  mul t3, t6, t2                                                        # ir inst 65 fin
  addi s11, t5, -1                                                      # ir inst 66 fin
  add s10, t3, s11                                                      # ir inst 67 fin
  slli t2, s10, 2
  addi t1, sp, 244
  add t3, t1, t2                                                        # ir inst 68 fin
  lw s11, 0(t3)                                                         # ir inst 69 fin
  slt t3, s11, t4                                                       # ir inst 70 fin
  bnez t3, .F.longestCommonSubsequence._16.if.then.1
  j .F.longestCommonSubsequence._17.if.else.1                           # ir inst 71 fin
.F.longestCommonSubsequence._16.if.then.1:
  li t2, 26
  mul t3, t6, t2                                                        # ir inst 72 fin
  add s10, t3, t5                                                       # ir inst 73 fin
  slli t2, s10, 2
  addi t1, sp, 244
  add t3, t1, t2                                                        # ir inst 74 fin
  sw t4, 0(t3)                                                          # ir inst 75 fin
  j .F.longestCommonSubsequence._18.if.exit.1                           # ir inst 76 fin
.F.longestCommonSubsequence._17.if.else.1:
  li t2, 26
  mul t4, t6, t2                                                        # ir inst 77 fin
  add t3, t4, t5                                                        # ir inst 78 fin
  slli t2, t3, 2
  addi t1, sp, 244
  add t4, t1, t2                                                        # ir inst 79 fin
  sw s11, 0(t4)                                                         # ir inst 80 fin
  j .F.longestCommonSubsequence._18.if.exit.1                           # ir inst 81 fin
.F.longestCommonSubsequence._18.if.exit.1:
  j .F.longestCommonSubsequence._19.if.exit.0                           # ir inst 82 fin
.F.longestCommonSubsequence._19.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 83 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._12.while.cond.1                        # ir inst 84 fin
.F.longestCommonSubsequence._20.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 85 fin
# Phi connections
  mv t6, t5
  j .F.longestCommonSubsequence._10.while.cond.0                        # ir inst 86 fin
.F.longestCommonSubsequence._21.while.exit.0:
  addi t1, sp, 244
  li t6, 3220
  add t6, t1, t6                                                        # ir inst 87 fin
  lw t5, 0(t6)                                                          # ir inst 88 fin
  mv a0, t5
  j .F.longestCommonSubsequence.epilogue                                # ir inst 89 fin
.F.longestCommonSubsequence.epilogue:
  ld ra, 16(sp)
  ld s11, 0(sp)
  ld s10, 8(sp)
  li t0, 3472
  add sp, sp, t0
  ret

.globl .F.initializeStrings
.F.initializeStrings:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 8,                  range:       40(sp) -       48(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.initializeStrings._0.entry.0:
# alloca %4
  addi t2, sp, 40
  sw a2, 0(t2)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.initializeStrings._1.while.cond.0                                # ir inst 3 fin
.F.initializeStrings._1.while.cond.0:
  li t2, 30
  sltu t5, t6, t2                                                       # ir inst 5 fin
  bnez t5, .F.initializeStrings._2.while.body.0
  j .F.initializeStrings._3.while.exit.0                                # ir inst 6 fin
.F.initializeStrings._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a3, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 40
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a3, 16(sp)
  ld t6, 24(sp)
# ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  addi t1, sp, 40
  lw t4, 0(t1)                                                          # ir inst 9 fin
  li t2, 26
  rem t3, t4, t2                                                        # ir inst 10 fin
  sw t3, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.initializeStrings._1.while.cond.0                                # ir inst 13 fin
.F.initializeStrings._3.while.exit.0:
# alloca %11
  addi t2, sp, 44
  sw a3, 0(t2)                                                          # ir inst 15 fin
# Phi connections
  li t6, 0
  j .F.initializeStrings._4.while.cond.1                                # ir inst 16 fin
.F.initializeStrings._4.while.cond.1:
  li t2, 25
  sltu t5, t6, t2                                                       # ir inst 18 fin
  bnez t5, .F.initializeStrings._5.while.body.1
  j .F.initializeStrings._6.while.exit.1                                # ir inst 19 fin
.F.initializeStrings._5.while.body.1:
# Start call preparation
  sd a1, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 44
  mv a0, t1
  call .F.update
  ld a1, 0(sp)
  ld t6, 8(sp)
# ir inst 20 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 21 fin
  addi t1, sp, 44
  lw t4, 0(t1)                                                          # ir inst 22 fin
  li t2, 26
  rem t3, t4, t2                                                        # ir inst 23 fin
  sw t3, 0(t5)                                                          # ir inst 24 fin
  addi t5, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t5
  j .F.initializeStrings._4.while.cond.1                                # ir inst 26 fin
.F.initializeStrings._6.while.exit.1:
  j .F.initializeStrings.epilogue                                       # ir inst 27 fin
.F.initializeStrings.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.knapsackProblem
.F.knapsackProblem:
# spill func args num: 0,             range:     8688(sp) -     8688(sp)
# local var size: 8644,               range:       32(sp) -     8676(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8688
  add sp, sp, t0
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.knapsackProblem._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.knapsackProblem._1.array.cond.0                                  # ir inst 3 fin
.F.knapsackProblem._1.array.cond.0:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.knapsackProblem._2.array.body.0
  j .F.knapsackProblem._3.array.exit.0                                  # ir inst 6 fin
.F.knapsackProblem._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.knapsackProblem._1.array.cond.0                                  # ir inst 10 fin
.F.knapsackProblem._3.array.exit.0:
  addi t1, sp, 112
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.knapsackProblem._4.array.cond.1                                  # ir inst 13 fin
.F.knapsackProblem._4.array.cond.1:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.knapsackProblem._5.array.body.1
  j .F.knapsackProblem._6.array.exit.1                                  # ir inst 16 fin
.F.knapsackProblem._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.knapsackProblem._4.array.cond.1                                  # ir inst 20 fin
.F.knapsackProblem._6.array.exit.1:
  addi t1, sp, 192
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.knapsackProblem._7.array.cond.2                                  # ir inst 23 fin
.F.knapsackProblem._7.array.cond.2:
  li t2, 2121
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.knapsackProblem._8.array.body.2
  j .F.knapsackProblem._9.array.exit.2                                  # ir inst 26 fin
.F.knapsackProblem._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.knapsackProblem._7.array.cond.2                                  # ir inst 30 fin
.F.knapsackProblem._9.array.exit.2:
# Start call preparation
  li a2, 20
  addi t1, sp, 112
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call .F.initializeKnapsackItems
# ir inst 31 fin
# Phi connections
  li t6, 1
  j .F.knapsackProblem._10.while.cond.0                                 # ir inst 32 fin
.F.knapsackProblem._10.while.cond.0:
  li t2, 20
  sltu t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 34 fin
  bnez t5, .F.knapsackProblem._11.while.body.0
  j .F.knapsackProblem._21.while.exit.0                                 # ir inst 35 fin
.F.knapsackProblem._11.while.body.0:
# Phi connections
  li t5, 1
  j .F.knapsackProblem._12.while.cond.1                                 # ir inst 36 fin
.F.knapsackProblem._12.while.cond.1:
  li t2, 100
  sltu t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 38 fin
  bnez t4, .F.knapsackProblem._13.while.body.1
  j .F.knapsackProblem._20.while.exit.1                                 # ir inst 39 fin
.F.knapsackProblem._13.while.body.1:
  addi t4, t6, -1                                                       # ir inst 40 fin
  li t2, 101
  mul t3, t4, t2                                                        # ir inst 41 fin
  add t4, t3, t5                                                        # ir inst 42 fin
  slli t2, t4, 2
  addi t1, sp, 192
  add t3, t1, t2                                                        # ir inst 43 fin
  lw t4, 0(t3)                                                          # ir inst 44 fin
  addi t3, t6, -1                                                       # ir inst 45 fin
  slli t2, t3, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 46 fin
  lw t3, 0(s11)                                                         # ir inst 47 fin
  mv s11, t5                                                            # ir inst 48 fin
  slt t0, s11, t3
  xori s10, t0, 1                                                       # ir inst 49 fin
  bnez s10, .F.knapsackProblem._14.if.then.0
  j .F.knapsackProblem._18.if.else.0                                    # ir inst 50 fin
.F.knapsackProblem._14.if.then.0:
  addi t3, t6, -1                                                       # ir inst 51 fin
  slli t2, t3, 2
  addi t1, sp, 112
  add s11, t1, t2                                                       # ir inst 52 fin
  lw t3, 0(s11)                                                         # ir inst 53 fin
  addi s11, t6, -1                                                      # ir inst 54 fin
  li t2, 101
  mul s10, s11, t2                                                      # ir inst 55 fin
  addi s11, t6, -1                                                      # ir inst 56 fin
  slli t2, s11, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 57 fin
  lw s11, 0(s9)                                                         # ir inst 58 fin
  mv s9, s11                                                            # ir inst 59 fin
  sub s11, t5, s9                                                       # ir inst 60 fin
  add s9, s10, s11                                                      # ir inst 61 fin
  slli t2, s9, 2
  addi t1, sp, 192
  add s11, t1, t2                                                       # ir inst 62 fin
  lw s10, 0(s11)                                                        # ir inst 63 fin
  add s11, t3, s10                                                      # ir inst 64 fin
  slt t3, t4, s11                                                       # ir inst 65 fin
  bnez t3, .F.knapsackProblem._15.if.then.1
  j .F.knapsackProblem._16.if.else.1                                    # ir inst 66 fin
.F.knapsackProblem._15.if.then.1:
  li t2, 101
  mul t3, t6, t2                                                        # ir inst 67 fin
  add s10, t3, t5                                                       # ir inst 68 fin
  slli t2, s10, 2
  addi t1, sp, 192
  add t3, t1, t2                                                        # ir inst 69 fin
  sw s11, 0(t3)                                                         # ir inst 70 fin
  j .F.knapsackProblem._17.if.exit.1                                    # ir inst 71 fin
.F.knapsackProblem._16.if.else.1:
  li t2, 101
  mul t3, t6, t2                                                        # ir inst 72 fin
  add s11, t3, t5                                                       # ir inst 73 fin
  slli t2, s11, 2
  addi t1, sp, 192
  add t3, t1, t2                                                        # ir inst 74 fin
  sw t4, 0(t3)                                                          # ir inst 75 fin
  j .F.knapsackProblem._17.if.exit.1                                    # ir inst 76 fin
.F.knapsackProblem._17.if.exit.1:
  j .F.knapsackProblem._19.if.exit.0                                    # ir inst 77 fin
.F.knapsackProblem._18.if.else.0:
  li t2, 101
  mul t3, t6, t2                                                        # ir inst 78 fin
  add s11, t3, t5                                                       # ir inst 79 fin
  slli t2, s11, 2
  addi t1, sp, 192
  add t3, t1, t2                                                        # ir inst 80 fin
  sw t4, 0(t3)                                                          # ir inst 81 fin
  j .F.knapsackProblem._19.if.exit.0                                    # ir inst 82 fin
.F.knapsackProblem._19.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 83 fin
# Phi connections
  mv t5, t4
  j .F.knapsackProblem._12.while.cond.1                                 # ir inst 84 fin
.F.knapsackProblem._20.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 85 fin
# Phi connections
  mv t6, t5
  j .F.knapsackProblem._10.while.cond.0                                 # ir inst 86 fin
.F.knapsackProblem._21.while.exit.0:
  addi t1, sp, 192
  li t6, 8480
  add t6, t1, t6                                                        # ir inst 87 fin
  lw t5, 0(t6)                                                          # ir inst 88 fin
  mv a0, t5
  j .F.knapsackProblem.epilogue                                         # ir inst 89 fin
.F.knapsackProblem.epilogue:
  ld ra, 24(sp)
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  li t0, 8688
  add sp, sp, t0
  ret

.globl .F.initializeKnapsackItems
.F.initializeKnapsackItems:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 4,                  range:       40(sp) -       44(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.initializeKnapsackItems._0.entry.0:
# alloca %3
  addi t2, sp, 40
  li t1, 98765
  sw t1, 0(t2)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.initializeKnapsackItems._1.while.cond.0                          # ir inst 3 fin
.F.initializeKnapsackItems._1.while.cond.0:
  sltu t5, t6, a2                                                       # ir inst 5 fin
  bnez t5, .F.initializeKnapsackItems._2.while.body.0
  j .F.initializeKnapsackItems._3.while.exit.0                          # ir inst 6 fin
.F.initializeKnapsackItems._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 40
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  addi t1, sp, 40
  lw t4, 0(t1)                                                          # ir inst 9 fin
  li t2, 20
  rem t3, t4, t2                                                        # ir inst 10 fin
  addi t4, t3, 1                                                        # ir inst 11 fin
  sw t4, 0(t5)                                                          # ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 40
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 13 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 14 fin
  addi t1, sp, 40
  lw t4, 0(t1)                                                          # ir inst 15 fin
  li t2, 50
  rem t3, t4, t2                                                        # ir inst 16 fin
  addi t4, t3, 1                                                        # ir inst 17 fin
  sw t4, 0(t5)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.initializeKnapsackItems._1.while.cond.0                          # ir inst 20 fin
.F.initializeKnapsackItems._3.while.exit.0:
  j .F.initializeKnapsackItems.epilogue                                 # ir inst 21 fin
.F.initializeKnapsackItems.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.editDistance
.F.editDistance:
# spill func args num: 0,             range:     1008(sp) -     1008(sp)
# local var size: 940,                range:       64(sp) -     1004(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1008
  sd s11, 32(sp)
  sd s9, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.editDistance._0.entry.0:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.editDistance._1.array.cond.0                                     # ir inst 3 fin
.F.editDistance._1.array.cond.0:
  li t2, 15
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.editDistance._2.array.body.0
  j .F.editDistance._3.array.exit.0                                     # ir inst 6 fin
.F.editDistance._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.editDistance._1.array.cond.0                                     # ir inst 10 fin
.F.editDistance._3.array.exit.0:
  addi t1, sp, 124
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.editDistance._4.array.cond.1                                     # ir inst 13 fin
.F.editDistance._4.array.cond.1:
  li t2, 12
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.editDistance._5.array.body.1
  j .F.editDistance._6.array.exit.1                                     # ir inst 16 fin
.F.editDistance._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.editDistance._4.array.cond.1                                     # ir inst 20 fin
.F.editDistance._6.array.exit.1:
  addi t1, sp, 172
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.editDistance._7.array.cond.2                                     # ir inst 23 fin
.F.editDistance._7.array.cond.2:
  li t2, 208
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.editDistance._8.array.body.2
  j .F.editDistance._9.array.exit.2                                     # ir inst 26 fin
.F.editDistance._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.editDistance._7.array.cond.2                                     # ir inst 30 fin
.F.editDistance._9.array.exit.2:
# Start call preparation
  li a3, 12
  li a2, 15
  addi t1, sp, 124
  mv a1, t1
  addi t1, sp, 64
  mv a0, t1
  call .F.initializeEditStrings
# ir inst 31 fin
# Phi connections
  li t6, 0
  j .F.editDistance._10.while.cond.0                                    # ir inst 32 fin
.F.editDistance._10.while.cond.0:
  li t2, 15
  sltu t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 34 fin
  bnez t5, .F.editDistance._11.while.body.0
  j .F.editDistance._12.while.exit.0                                    # ir inst 35 fin
.F.editDistance._11.while.body.0:
  li t2, 13
  mul t5, t6, t2                                                        # ir inst 36 fin
  slli t2, t5, 2
  addi t1, sp, 172
  add t4, t1, t2                                                        # ir inst 37 fin
  mv t5, t6                                                             # ir inst 38 fin
  sw t5, 0(t4)                                                          # ir inst 39 fin
  addi t5, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t6, t5
  j .F.editDistance._10.while.cond.0                                    # ir inst 41 fin
.F.editDistance._12.while.exit.0:
# Phi connections
  li t6, 0
  j .F.editDistance._13.while.cond.1                                    # ir inst 42 fin
.F.editDistance._13.while.cond.1:
  li t2, 12
  sltu t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 44 fin
  bnez t5, .F.editDistance._14.while.body.1
  j .F.editDistance._15.while.exit.1                                    # ir inst 45 fin
.F.editDistance._14.while.body.1:
  slli t2, t6, 2
  addi t1, sp, 172
  add t5, t1, t2                                                        # ir inst 46 fin
  mv t4, t6                                                             # ir inst 47 fin
  sw t4, 0(t5)                                                          # ir inst 48 fin
  addi t5, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F.editDistance._13.while.cond.1                                    # ir inst 50 fin
.F.editDistance._15.while.exit.1:
# Phi connections
  li t6, 1
  j .F.editDistance._16.while.cond.2                                    # ir inst 51 fin
.F.editDistance._16.while.cond.2:
  li t2, 15
  sltu t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 53 fin
  bnez t5, .F.editDistance._17.while.body.2
  j .F.editDistance._24.while.exit.2                                    # ir inst 54 fin
.F.editDistance._17.while.body.2:
# Phi connections
  li t5, 1
  j .F.editDistance._18.while.cond.3                                    # ir inst 55 fin
.F.editDistance._18.while.cond.3:
  li t2, 12
  sltu t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 57 fin
  bnez t4, .F.editDistance._19.while.body.3
  j .F.editDistance._23.while.exit.3                                    # ir inst 58 fin
.F.editDistance._19.while.body.3:
  addi t4, t6, -1                                                       # ir inst 59 fin
  slli t2, t4, 2
  addi t1, sp, 64
  add t3, t1, t2                                                        # ir inst 60 fin
  lw t4, 0(t3)                                                          # ir inst 61 fin
  addi t3, t5, -1                                                       # ir inst 62 fin
  slli t2, t3, 2
  addi t1, sp, 124
  add s11, t1, t2                                                       # ir inst 63 fin
  lw t3, 0(s11)                                                         # ir inst 64 fin
  xor t0, t4, t3
  sltiu s11, t0, 1                                                      # ir inst 65 fin
  bnez s11, .F.editDistance._20.if.then.0
  j .F.editDistance._21.if.else.0                                       # ir inst 66 fin
.F.editDistance._20.if.then.0:
  li t2, 13
  mul t4, t6, t2                                                        # ir inst 67 fin
  add t3, t4, t5                                                        # ir inst 68 fin
  slli t2, t3, 2
  addi t1, sp, 172
  add t4, t1, t2                                                        # ir inst 69 fin
  addi t3, t6, -1                                                       # ir inst 70 fin
  li t2, 13
  mul s11, t3, t2                                                       # ir inst 71 fin
  addi t3, t5, -1                                                       # ir inst 72 fin
  add s10, s11, t3                                                      # ir inst 73 fin
  slli t2, s10, 2
  addi t1, sp, 172
  add t3, t1, t2                                                        # ir inst 74 fin
  lw s11, 0(t3)                                                         # ir inst 75 fin
  sw s11, 0(t4)                                                         # ir inst 76 fin
  j .F.editDistance._22.if.exit.0                                       # ir inst 77 fin
.F.editDistance._21.if.else.0:
  li t2, 13
  mul t4, t6, t2                                                        # ir inst 78 fin
  addi t3, t5, -1                                                       # ir inst 79 fin
  add s11, t4, t3                                                       # ir inst 80 fin
  slli t2, s11, 2
  addi t1, sp, 172
  add t4, t1, t2                                                        # ir inst 81 fin
  lw t3, 0(t4)                                                          # ir inst 82 fin
  addi t4, t3, 1                                                        # ir inst 83 fin
  addi t3, t6, -1                                                       # ir inst 84 fin
  li t2, 13
  mul s11, t3, t2                                                       # ir inst 85 fin
  add t3, s11, t5                                                       # ir inst 86 fin
  slli t2, t3, 2
  addi t1, sp, 172
  add s11, t1, t2                                                       # ir inst 87 fin
  lw t3, 0(s11)                                                         # ir inst 88 fin
  addi s11, t3, 1                                                       # ir inst 89 fin
  addi t3, t6, -1                                                       # ir inst 90 fin
  li t2, 13
  mul s10, t3, t2                                                       # ir inst 91 fin
  addi t3, t5, -1                                                       # ir inst 92 fin
  add s9, s10, t3                                                       # ir inst 93 fin
  slli t2, s9, 2
  addi t1, sp, 172
  add t3, t1, t2                                                        # ir inst 94 fin
  lw s10, 0(t3)                                                         # ir inst 95 fin
  addi t3, s10, 1                                                       # ir inst 96 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t3
  mv a1, s11
  mv a0, t4
  call .F.findMinimum
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 97 fin
  li t2, 13
  mul t4, t6, t2                                                        # ir inst 98 fin
  add t3, t4, t5                                                        # ir inst 99 fin
  slli t2, t3, 2
  addi t1, sp, 172
  add t4, t1, t2                                                        # ir inst 100 fin
  sw s10, 0(t4)                                                         # ir inst 101 fin
  j .F.editDistance._22.if.exit.0                                       # ir inst 102 fin
.F.editDistance._22.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 103 fin
# Phi connections
  mv t5, t4
  j .F.editDistance._18.while.cond.3                                    # ir inst 104 fin
.F.editDistance._23.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 105 fin
# Phi connections
  mv t6, t5
  j .F.editDistance._16.while.cond.2                                    # ir inst 106 fin
.F.editDistance._24.while.exit.2:
  addi t1, sp, 172
  addi t6, t1, 828                                                      # ir inst 107 fin
  lw t5, 0(t6)                                                          # ir inst 108 fin
  mv a0, t5
  j .F.editDistance.epilogue                                            # ir inst 109 fin
.F.editDistance.epilogue:
  ld ra, 56(sp)
  ld s11, 32(sp)
  ld s9, 40(sp)
  ld s10, 48(sp)
  addi sp, sp, 1008
  ret

.globl .F.initializeEditStrings
.F.initializeEditStrings:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 8,                  range:       48(sp) -       56(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 40(sp)
.F.initializeEditStrings._0.entry.0:
# alloca %4
  addi t2, sp, 48
  li t1, 11111
  sw t1, 0(t2)                                                          # ir inst 2 fin
# alloca %5
  addi t2, sp, 52
  li t1, 22222
  sw t1, 0(t2)                                                          # ir inst 4 fin
# Phi connections
  li t6, 0
  j .F.initializeEditStrings._1.while.cond.0                            # ir inst 5 fin
.F.initializeEditStrings._1.while.cond.0:
  sltu t5, t6, a2                                                       # ir inst 7 fin
  bnez t5, .F.initializeEditStrings._2.while.body.0
  j .F.initializeEditStrings._3.while.exit.0                            # ir inst 8 fin
.F.initializeEditStrings._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 9 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 10 fin
  addi t1, sp, 48
  lw t4, 0(t1)                                                          # ir inst 11 fin
  li t2, 10
  rem t3, t4, t2                                                        # ir inst 12 fin
  sw t3, 0(t5)                                                          # ir inst 13 fin
  addi t5, t6, 1                                                        # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.initializeEditStrings._1.while.cond.0                            # ir inst 15 fin
.F.initializeEditStrings._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeEditStrings._4.while.cond.1                            # ir inst 16 fin
.F.initializeEditStrings._4.while.cond.1:
  sltu t5, t6, a3                                                       # ir inst 18 fin
  bnez t5, .F.initializeEditStrings._5.while.body.1
  j .F.initializeEditStrings._6.while.exit.1                            # ir inst 19 fin
.F.initializeEditStrings._5.while.body.1:
# Start call preparation
  sd a1, 0(sp)
  sd a3, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 52
  mv a0, t1
  call .F.update
  ld a1, 0(sp)
  ld a3, 8(sp)
  ld t6, 16(sp)
# ir inst 20 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 21 fin
  addi t1, sp, 52
  lw t4, 0(t1)                                                          # ir inst 22 fin
  li t2, 10
  rem t3, t4, t2                                                        # ir inst 23 fin
  sw t3, 0(t5)                                                          # ir inst 24 fin
  addi t5, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t5
  j .F.initializeEditStrings._4.while.cond.1                            # ir inst 26 fin
.F.initializeEditStrings._6.while.exit.1:
  j .F.initializeEditStrings.epilogue                                   # ir inst 27 fin
.F.initializeEditStrings.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.findMinimum
.F.findMinimum:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.findMinimum._0.entry.0:
  slt t6, a1, a0                                                        # ir inst 1 fin
  bnez t6, .F.findMinimum._1.if.then.0
  j .F.findMinimum._2.if.else.0                                         # ir inst 2 fin
.F.findMinimum._1.if.then.0:
# Phi connections
  mv t6, a1
  j .F.findMinimum._3.if.exit.0                                         # ir inst 3 fin
.F.findMinimum._2.if.else.0:
# Phi connections
  mv t6, a0
  j .F.findMinimum._3.if.exit.0                                         # ir inst 4 fin
.F.findMinimum._3.if.exit.0:
  slt t5, a2, t6                                                        # ir inst 6 fin
  bnez t5, .F.findMinimum._4.if.then.1
  j .F.findMinimum._5.if.else.1                                         # ir inst 7 fin
.F.findMinimum._4.if.then.1:
# Phi connections
  mv t6, a2
  j .F.findMinimum._6.if.exit.1                                         # ir inst 8 fin
.F.findMinimum._5.if.else.1:
# Phi connections
  j .F.findMinimum._6.if.exit.1                                         # ir inst 9 fin
.F.findMinimum._6.if.exit.1:
  mv a0, t6
  j .F.findMinimum.epilogue                                             # ir inst 11 fin
.F.findMinimum.epilogue:
  ret

.globl .F.performStateMachineSimulation
.F.performStateMachineSimulation:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performStateMachineSimulation._0.entry.0:
# Start call preparation
  li a0, 2007
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.finiteStateAutomaton
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.trafficLightSimulation
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a0, 2008
  call printlnInt
# ir inst 6 fin
  j .F.performStateMachineSimulation.epilogue                           # ir inst 7 fin
.F.performStateMachineSimulation.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.finiteStateAutomaton
.F.finiteStateAutomaton:
# spill func args num: 0,             range:     4048(sp) -     4048(sp)
# local var size: 4000,               range:       48(sp) -     4048(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4048
  add sp, sp, t0
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.finiteStateAutomaton._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.finiteStateAutomaton._1.array.cond.0                             # ir inst 3 fin
.F.finiteStateAutomaton._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.finiteStateAutomaton._2.array.body.0
  j .F.finiteStateAutomaton._3.array.exit.0                             # ir inst 6 fin
.F.finiteStateAutomaton._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.finiteStateAutomaton._1.array.cond.0                             # ir inst 10 fin
.F.finiteStateAutomaton._3.array.exit.0:
# Start call preparation
  li a1, 1000
  addi t1, sp, 48
  mv a0, t1
  call .F.generateInputSequence
# ir inst 11 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.finiteStateAutomaton._4.while.cond.0                             # ir inst 12 fin
.F.finiteStateAutomaton._4.while.cond.0:
  li t2, 1000
  sltu t3, t4, t2                                                       # ir inst 16 fin
  bnez t3, .F.finiteStateAutomaton._5.while.body.0
  j .F.finiteStateAutomaton._9.while.exit.0                             # ir inst 17 fin
.F.finiteStateAutomaton._5.while.body.0:
  slli t2, t4, 2
  addi t1, sp, 48
  add t3, t1, t2                                                        # ir inst 18 fin
  lw s11, 0(t3)                                                         # ir inst 19 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s11
  mv a0, t5
  call .F.stateTransition
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 20 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t3
  call .F.isAcceptingState
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 21 fin
  li t2, 1
  xor t0, t5, t2
  sltiu s11, t0, 1                                                      # ir inst 22 fin
  bnez s11, .F.finiteStateAutomaton._6.if.then.0
  j .F.finiteStateAutomaton._7.if.else.0                                # ir inst 23 fin
.F.finiteStateAutomaton._6.if.then.0:
  addi t5, t6, 1                                                        # ir inst 24 fin
# Phi connections
  j .F.finiteStateAutomaton._8.if.exit.0                                # ir inst 25 fin
.F.finiteStateAutomaton._7.if.else.0:
# Phi connections
  mv t5, t6
  j .F.finiteStateAutomaton._8.if.exit.0                                # ir inst 26 fin
.F.finiteStateAutomaton._8.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 28 fin
# Phi connections
  mv t4, s11
  mv t6, t5
  mv t5, t3
  j .F.finiteStateAutomaton._4.while.cond.0                             # ir inst 29 fin
.F.finiteStateAutomaton._9.while.exit.0:
  mv a0, t6
  j .F.finiteStateAutomaton.epilogue                                    # ir inst 30 fin
.F.finiteStateAutomaton.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  li t0, 4048
  add sp, sp, t0
  ret

.globl .F.generateInputSequence
.F.generateInputSequence:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 4,                  range:       32(sp) -       36(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 24(sp)
.F.generateInputSequence._0.entry.0:
# alloca %2
  addi t2, sp, 32
  li t1, 13579
  sw t1, 0(t2)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.generateInputSequence._1.while.cond.0                            # ir inst 3 fin
.F.generateInputSequence._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 5 fin
  bnez t5, .F.generateInputSequence._2.while.body.0
  j .F.generateInputSequence._3.while.exit.0                            # ir inst 6 fin
.F.generateInputSequence._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 32
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  addi t1, sp, 32
  lw t4, 0(t1)                                                          # ir inst 9 fin
  li t2, 4
  rem t3, t4, t2                                                        # ir inst 10 fin
  sw t3, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.generateInputSequence._1.while.cond.0                            # ir inst 13 fin
.F.generateInputSequence._3.while.exit.0:
  j .F.generateInputSequence.epilogue                                   # ir inst 14 fin
.F.generateInputSequence.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 48
  ret

.globl .F.stateTransition
.F.stateTransition:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.stateTransition._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.stateTransition._1.if.then.0
  j .F.stateTransition._11.if.else.0                                    # ir inst 2 fin
.F.stateTransition._1.if.then.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.stateTransition._2.if.then.1
  j .F.stateTransition._3.if.else.1                                     # ir inst 4 fin
.F.stateTransition._2.if.then.1:
  li a0, 1
  j .F.stateTransition.epilogue                                         # ir inst 5 fin
.F.stateTransition._3.if.else.1:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 6 fin
  bnez t6, .F.stateTransition._4.if.then.2
  j .F.stateTransition._5.if.else.2                                     # ir inst 7 fin
.F.stateTransition._4.if.then.2:
  li a0, 2
  j .F.stateTransition.epilogue                                         # ir inst 8 fin
.F.stateTransition._5.if.else.2:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
  bnez t6, .F.stateTransition._6.if.then.3
  j .F.stateTransition._7.if.else.3                                     # ir inst 10 fin
.F.stateTransition._6.if.then.3:
  li a0, 3
  j .F.stateTransition.epilogue                                         # ir inst 11 fin
.F.stateTransition._7.if.else.3:
  li a0, 0
  j .F.stateTransition.epilogue                                         # ir inst 12 fin
.F.stateTransition._8.if.exit.3:
  j .F.stateTransition._9.if.exit.2                                     # ir inst 13 fin
.F.stateTransition._9.if.exit.2:
  j .F.stateTransition._10.if.exit.1                                    # ir inst 14 fin
.F.stateTransition._10.if.exit.1:
  j .F.stateTransition._93.if.exit.0                                    # ir inst 15 fin
.F.stateTransition._11.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 16 fin
  bnez t6, .F.stateTransition._12.if.then.4
  j .F.stateTransition._22.if.else.4                                    # ir inst 17 fin
.F.stateTransition._12.if.then.4:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 18 fin
  bnez t6, .F.stateTransition._13.if.then.5
  j .F.stateTransition._14.if.else.5                                    # ir inst 19 fin
.F.stateTransition._13.if.then.5:
  li a0, 0
  j .F.stateTransition.epilogue                                         # ir inst 20 fin
.F.stateTransition._14.if.else.5:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 21 fin
  bnez t6, .F.stateTransition._15.if.then.6
  j .F.stateTransition._16.if.else.6                                    # ir inst 22 fin
.F.stateTransition._15.if.then.6:
  li a0, 4
  j .F.stateTransition.epilogue                                         # ir inst 23 fin
.F.stateTransition._16.if.else.6:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 24 fin
  bnez t6, .F.stateTransition._17.if.then.7
  j .F.stateTransition._18.if.else.7                                    # ir inst 25 fin
.F.stateTransition._17.if.then.7:
  li a0, 5
  j .F.stateTransition.epilogue                                         # ir inst 26 fin
.F.stateTransition._18.if.else.7:
  li a0, 1
  j .F.stateTransition.epilogue                                         # ir inst 27 fin
.F.stateTransition._19.if.exit.7:
  j .F.stateTransition._20.if.exit.6                                    # ir inst 28 fin
.F.stateTransition._20.if.exit.6:
  j .F.stateTransition._21.if.exit.5                                    # ir inst 29 fin
.F.stateTransition._21.if.exit.5:
  j .F.stateTransition._92.if.exit.4                                    # ir inst 30 fin
.F.stateTransition._22.if.else.4:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 31 fin
  bnez t6, .F.stateTransition._23.if.then.8
  j .F.stateTransition._33.if.else.8                                    # ir inst 32 fin
.F.stateTransition._23.if.then.8:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 33 fin
  bnez t6, .F.stateTransition._24.if.then.9
  j .F.stateTransition._25.if.else.9                                    # ir inst 34 fin
.F.stateTransition._24.if.then.9:
  li a0, 6
  j .F.stateTransition.epilogue                                         # ir inst 35 fin
.F.stateTransition._25.if.else.9:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 36 fin
  bnez t6, .F.stateTransition._26.if.then.10
  j .F.stateTransition._27.if.else.10                                   # ir inst 37 fin
.F.stateTransition._26.if.then.10:
  li a0, 0
  j .F.stateTransition.epilogue                                         # ir inst 38 fin
.F.stateTransition._27.if.else.10:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 39 fin
  bnez t6, .F.stateTransition._28.if.then.11
  j .F.stateTransition._29.if.else.11                                   # ir inst 40 fin
.F.stateTransition._28.if.then.11:
  li a0, 7
  j .F.stateTransition.epilogue                                         # ir inst 41 fin
.F.stateTransition._29.if.else.11:
  li a0, 2
  j .F.stateTransition.epilogue                                         # ir inst 42 fin
.F.stateTransition._30.if.exit.11:
  j .F.stateTransition._31.if.exit.10                                   # ir inst 43 fin
.F.stateTransition._31.if.exit.10:
  j .F.stateTransition._32.if.exit.9                                    # ir inst 44 fin
.F.stateTransition._32.if.exit.9:
  j .F.stateTransition._91.if.exit.8                                    # ir inst 45 fin
.F.stateTransition._33.if.else.8:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 46 fin
  bnez t6, .F.stateTransition._34.if.then.12
  j .F.stateTransition._44.if.else.12                                   # ir inst 47 fin
.F.stateTransition._34.if.then.12:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 48 fin
  bnez t6, .F.stateTransition._35.if.then.13
  j .F.stateTransition._36.if.else.13                                   # ir inst 49 fin
.F.stateTransition._35.if.then.13:
  li a0, 7
  j .F.stateTransition.epilogue                                         # ir inst 50 fin
.F.stateTransition._36.if.else.13:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 51 fin
  bnez t6, .F.stateTransition._37.if.then.14
  j .F.stateTransition._38.if.else.14                                   # ir inst 52 fin
.F.stateTransition._37.if.then.14:
  li a0, 6
  j .F.stateTransition.epilogue                                         # ir inst 53 fin
.F.stateTransition._38.if.else.14:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 54 fin
  bnez t6, .F.stateTransition._39.if.then.15
  j .F.stateTransition._40.if.else.15                                   # ir inst 55 fin
.F.stateTransition._39.if.then.15:
  li a0, 0
  j .F.stateTransition.epilogue                                         # ir inst 56 fin
.F.stateTransition._40.if.else.15:
  li a0, 3
  j .F.stateTransition.epilogue                                         # ir inst 57 fin
.F.stateTransition._41.if.exit.15:
  j .F.stateTransition._42.if.exit.14                                   # ir inst 58 fin
.F.stateTransition._42.if.exit.14:
  j .F.stateTransition._43.if.exit.13                                   # ir inst 59 fin
.F.stateTransition._43.if.exit.13:
  j .F.stateTransition._90.if.exit.12                                   # ir inst 60 fin
.F.stateTransition._44.if.else.12:
  li t2, 4
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 61 fin
  bnez t6, .F.stateTransition._45.if.then.16
  j .F.stateTransition._55.if.else.16                                   # ir inst 62 fin
.F.stateTransition._45.if.then.16:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 63 fin
  bnez t6, .F.stateTransition._46.if.then.17
  j .F.stateTransition._47.if.else.17                                   # ir inst 64 fin
.F.stateTransition._46.if.then.17:
  li a0, 2
  j .F.stateTransition.epilogue                                         # ir inst 65 fin
.F.stateTransition._47.if.else.17:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 66 fin
  bnez t6, .F.stateTransition._48.if.then.18
  j .F.stateTransition._49.if.else.18                                   # ir inst 67 fin
.F.stateTransition._48.if.then.18:
  li a0, 1
  j .F.stateTransition.epilogue                                         # ir inst 68 fin
.F.stateTransition._49.if.else.18:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 69 fin
  bnez t6, .F.stateTransition._50.if.then.19
  j .F.stateTransition._51.if.else.19                                   # ir inst 70 fin
.F.stateTransition._50.if.then.19:
  li a0, 4
  j .F.stateTransition.epilogue                                         # ir inst 71 fin
.F.stateTransition._51.if.else.19:
  li a0, 5
  j .F.stateTransition.epilogue                                         # ir inst 72 fin
.F.stateTransition._52.if.exit.19:
  j .F.stateTransition._53.if.exit.18                                   # ir inst 73 fin
.F.stateTransition._53.if.exit.18:
  j .F.stateTransition._54.if.exit.17                                   # ir inst 74 fin
.F.stateTransition._54.if.exit.17:
  j .F.stateTransition._89.if.exit.16                                   # ir inst 75 fin
.F.stateTransition._55.if.else.16:
  li t2, 5
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 76 fin
  bnez t6, .F.stateTransition._56.if.then.20
  j .F.stateTransition._66.if.else.20                                   # ir inst 77 fin
.F.stateTransition._56.if.then.20:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 78 fin
  bnez t6, .F.stateTransition._57.if.then.21
  j .F.stateTransition._58.if.else.21                                   # ir inst 79 fin
.F.stateTransition._57.if.then.21:
  li a0, 4
  j .F.stateTransition.epilogue                                         # ir inst 80 fin
.F.stateTransition._58.if.else.21:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 81 fin
  bnez t6, .F.stateTransition._59.if.then.22
  j .F.stateTransition._60.if.else.22                                   # ir inst 82 fin
.F.stateTransition._59.if.then.22:
  li a0, 3
  j .F.stateTransition.epilogue                                         # ir inst 83 fin
.F.stateTransition._60.if.else.22:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 84 fin
  bnez t6, .F.stateTransition._61.if.then.23
  j .F.stateTransition._62.if.else.23                                   # ir inst 85 fin
.F.stateTransition._61.if.then.23:
  li a0, 1
  j .F.stateTransition.epilogue                                         # ir inst 86 fin
.F.stateTransition._62.if.else.23:
  li a0, 6
  j .F.stateTransition.epilogue                                         # ir inst 87 fin
.F.stateTransition._63.if.exit.23:
  j .F.stateTransition._64.if.exit.22                                   # ir inst 88 fin
.F.stateTransition._64.if.exit.22:
  j .F.stateTransition._65.if.exit.21                                   # ir inst 89 fin
.F.stateTransition._65.if.exit.21:
  j .F.stateTransition._88.if.exit.20                                   # ir inst 90 fin
.F.stateTransition._66.if.else.20:
  li t2, 6
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 91 fin
  bnez t6, .F.stateTransition._67.if.then.24
  j .F.stateTransition._77.if.else.24                                   # ir inst 92 fin
.F.stateTransition._67.if.then.24:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 93 fin
  bnez t6, .F.stateTransition._68.if.then.25
  j .F.stateTransition._69.if.else.25                                   # ir inst 94 fin
.F.stateTransition._68.if.then.25:
  li a0, 5
  j .F.stateTransition.epilogue                                         # ir inst 95 fin
.F.stateTransition._69.if.else.25:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 96 fin
  bnez t6, .F.stateTransition._70.if.then.26
  j .F.stateTransition._71.if.else.26                                   # ir inst 97 fin
.F.stateTransition._70.if.then.26:
  li a0, 7
  j .F.stateTransition.epilogue                                         # ir inst 98 fin
.F.stateTransition._71.if.else.26:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 99 fin
  bnez t6, .F.stateTransition._72.if.then.27
  j .F.stateTransition._73.if.else.27                                   # ir inst 100 fin
.F.stateTransition._72.if.then.27:
  li a0, 2
  j .F.stateTransition.epilogue                                         # ir inst 101 fin
.F.stateTransition._73.if.else.27:
  li a0, 4
  j .F.stateTransition.epilogue                                         # ir inst 102 fin
.F.stateTransition._74.if.exit.27:
  j .F.stateTransition._75.if.exit.26                                   # ir inst 103 fin
.F.stateTransition._75.if.exit.26:
  j .F.stateTransition._76.if.exit.25                                   # ir inst 104 fin
.F.stateTransition._76.if.exit.25:
  j .F.stateTransition._87.if.exit.24                                   # ir inst 105 fin
.F.stateTransition._77.if.else.24:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 106 fin
  bnez t6, .F.stateTransition._78.if.then.28
  j .F.stateTransition._79.if.else.28                                   # ir inst 107 fin
.F.stateTransition._78.if.then.28:
  li a0, 3
  j .F.stateTransition.epilogue                                         # ir inst 108 fin
.F.stateTransition._79.if.else.28:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 109 fin
  bnez t6, .F.stateTransition._80.if.then.29
  j .F.stateTransition._81.if.else.29                                   # ir inst 110 fin
.F.stateTransition._80.if.then.29:
  li a0, 5
  j .F.stateTransition.epilogue                                         # ir inst 111 fin
.F.stateTransition._81.if.else.29:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 112 fin
  bnez t6, .F.stateTransition._82.if.then.30
  j .F.stateTransition._83.if.else.30                                   # ir inst 113 fin
.F.stateTransition._82.if.then.30:
  li a0, 6
  j .F.stateTransition.epilogue                                         # ir inst 114 fin
.F.stateTransition._83.if.else.30:
  li a0, 7
  j .F.stateTransition.epilogue                                         # ir inst 115 fin
.F.stateTransition._84.if.exit.30:
  j .F.stateTransition._85.if.exit.29                                   # ir inst 116 fin
.F.stateTransition._85.if.exit.29:
  j .F.stateTransition._86.if.exit.28                                   # ir inst 117 fin
.F.stateTransition._86.if.exit.28:
  j .F.stateTransition._87.if.exit.24                                   # ir inst 118 fin
.F.stateTransition._87.if.exit.24:
  j .F.stateTransition._88.if.exit.20                                   # ir inst 119 fin
.F.stateTransition._88.if.exit.20:
  j .F.stateTransition._89.if.exit.16                                   # ir inst 120 fin
.F.stateTransition._89.if.exit.16:
  j .F.stateTransition._90.if.exit.12                                   # ir inst 121 fin
.F.stateTransition._90.if.exit.12:
  j .F.stateTransition._91.if.exit.8                                    # ir inst 122 fin
.F.stateTransition._91.if.exit.8:
  j .F.stateTransition._92.if.exit.4                                    # ir inst 123 fin
.F.stateTransition._92.if.exit.4:
  j .F.stateTransition._93.if.exit.0                                    # ir inst 124 fin
.F.stateTransition._93.if.exit.0:
.F.stateTransition.epilogue:
  ret

.globl .F.isAcceptingState
.F.isAcceptingState:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.isAcceptingState._0.entry.0:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.isAcceptingState._1.lazy.then.0
  j .F.isAcceptingState._2.lazy.else.0                                  # ir inst 2 fin
.F.isAcceptingState._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.isAcceptingState._3.lazy.exit.0                                  # ir inst 3 fin
.F.isAcceptingState._2.lazy.else.0:
  li t2, 5
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 4 fin
# Phi connections
  j .F.isAcceptingState._3.lazy.exit.0                                  # ir inst 5 fin
.F.isAcceptingState._3.lazy.exit.0:
  bnez t6, .F.isAcceptingState._4.lazy.then.1
  j .F.isAcceptingState._5.lazy.else.1                                  # ir inst 7 fin
.F.isAcceptingState._4.lazy.then.1:
# Phi connections
  li t6, 1
  j .F.isAcceptingState._6.lazy.exit.1                                  # ir inst 8 fin
.F.isAcceptingState._5.lazy.else.1:
  li t2, 7
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
# Phi connections
  j .F.isAcceptingState._6.lazy.exit.1                                  # ir inst 10 fin
.F.isAcceptingState._6.lazy.exit.1:
  mv t5, t6                                                             # ir inst 12 fin
  mv a0, t5
  j .F.isAcceptingState.epilogue                                        # ir inst 13 fin
.F.isAcceptingState.epilogue:
  ret

.globl .F.trafficLightSimulation
.F.trafficLightSimulation:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s8, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd s9, 56(sp)
  sd ra, 64(sp)
.F.trafficLightSimulation._0.entry.0:
# Phi connections
  li s11, 0
  li t3, 2
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.trafficLightSimulation._1.while.cond.0                           # ir inst 1 fin
.F.trafficLightSimulation._1.while.cond.0:
  li t2, 1000
  slt s10, t6, t2                                                       # ir inst 7 fin
  bnez s10, .F.trafficLightSimulation._2.while.body.0
  j .F.trafficLightSimulation._6.while.exit.0                           # ir inst 8 fin
.F.trafficLightSimulation._2.while.body.0:
  addi s10, t4, 1                                                       # ir inst 9 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a3, t6
  mv a2, s10
  mv a1, t3
  mv a0, s11
  call .F.shouldChangeState
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 10 fin
  li t2, 1
  xor t0, t4, t2
  sltiu s9, t0, 1                                                       # ir inst 11 fin
  bnez s9, .F.trafficLightSimulation._3.if.then.0
  j .F.trafficLightSimulation._4.if.else.0                              # ir inst 12 fin
.F.trafficLightSimulation._3.if.then.0:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s11
  call .F.getNextTrafficState
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 13 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call .F.getNextTrafficState
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 14 fin
  addi s8, t5, 1                                                        # ir inst 15 fin
# Phi connections
  mv s10, t4
  mv s11, s9
  li t3, 0
  mv t4, s8
  j .F.trafficLightSimulation._5.if.exit.0                              # ir inst 16 fin
.F.trafficLightSimulation._4.if.else.0:
# Phi connections
  mv t4, t5
  mv t0, s10
  mv s10, s11
  mv s11, t3
  mv t3, t0
  j .F.trafficLightSimulation._5.if.exit.0                              # ir inst 17 fin
.F.trafficLightSimulation._5.if.exit.0:
  addi s9, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  mv t6, s9
  mv t4, t3
  mv t3, s11
  mv s11, s10
  j .F.trafficLightSimulation._1.while.cond.0                           # ir inst 23 fin
.F.trafficLightSimulation._6.while.exit.0:
  mv a0, t5
  j .F.trafficLightSimulation.epilogue                                  # ir inst 24 fin
.F.trafficLightSimulation.epilogue:
  ld ra, 64(sp)
  ld s8, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  ld s9, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.shouldChangeState
.F.shouldChangeState:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.shouldChangeState._0.entry.0:
  li t2, 100
  rem t6, a3, t2                                                        # ir inst 1 fin
  li t2, 10
  div t5, t6, t2                                                        # ir inst 2 fin
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.shouldChangeState._1.if.then.0
  j .F.shouldChangeState._2.if.else.0                                   # ir inst 4 fin
.F.shouldChangeState._1.if.then.0:
  addi t6, t5, 30                                                       # ir inst 5 fin
  slt t0, a2, t6
  xori t4, t0, 1                                                        # ir inst 6 fin
  mv t6, t4                                                             # ir inst 7 fin
  mv a0, t6
  j .F.shouldChangeState.epilogue                                       # ir inst 8 fin
.F.shouldChangeState._2.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
  bnez t6, .F.shouldChangeState._3.if.then.1
  j .F.shouldChangeState._4.if.else.1                                   # ir inst 10 fin
.F.shouldChangeState._3.if.then.1:
  li t2, 5
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  mv a0, t4
  j .F.shouldChangeState.epilogue                                       # ir inst 13 fin
.F.shouldChangeState._4.if.else.1:
  addi t6, t5, 35                                                       # ir inst 14 fin
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 15 fin
  mv t6, t5                                                             # ir inst 16 fin
  mv a0, t6
  j .F.shouldChangeState.epilogue                                       # ir inst 17 fin
.F.shouldChangeState._5.if.exit.1:
  j .F.shouldChangeState._6.if.exit.0                                   # ir inst 18 fin
.F.shouldChangeState._6.if.exit.0:
.F.shouldChangeState.epilogue:
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
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.getNextTrafficState._1.if.then.0
  j .F.getNextTrafficState._2.if.else.0                                 # ir inst 2 fin
.F.getNextTrafficState._1.if.then.0:
  li a0, 2
  j .F.getNextTrafficState.epilogue                                     # ir inst 3 fin
.F.getNextTrafficState._2.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 4 fin
  bnez t6, .F.getNextTrafficState._3.if.then.1
  j .F.getNextTrafficState._4.if.else.1                                 # ir inst 5 fin
.F.getNextTrafficState._3.if.then.1:
  li a0, 0
  j .F.getNextTrafficState.epilogue                                     # ir inst 6 fin
.F.getNextTrafficState._4.if.else.1:
  li a0, 1
  j .F.getNextTrafficState.epilogue                                     # ir inst 7 fin
.F.getNextTrafficState._5.if.exit.1:
  j .F.getNextTrafficState._6.if.exit.0                                 # ir inst 8 fin
.F.getNextTrafficState._6.if.exit.0:
.F.getNextTrafficState.epilogue:
  ret

.globl .F.performSearchAlgorithms
.F.performSearchAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performSearchAlgorithms._0.entry.0:
# Start call preparation
  li a0, 2009
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performBinarySearchTests
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.performPatternMatching
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a0, 2010
  call printlnInt
# ir inst 6 fin
  j .F.performSearchAlgorithms.epilogue                                 # ir inst 7 fin
.F.performSearchAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performBinarySearchTests
.F.performBinarySearchTests:
# spill func args num: 0,             range:     8048(sp) -     8048(sp)
# local var size: 8000,               range:       40(sp) -     8040(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8048
  add sp, sp, t0
  sd ra, 32(sp)
.F.performBinarySearchTests._0.entry.0:
  li t1, 6040
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t5, 0
  j .F.performBinarySearchTests._1.array.cond.0                         # ir inst 6 fin
.F.performBinarySearchTests._1.array.cond.0:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 8 fin
  bnez t4, .F.performBinarySearchTests._2.array.body.0
  j .F.performBinarySearchTests._3.array.exit.0                         # ir inst 9 fin
.F.performBinarySearchTests._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 11 fin
  addi t4, t5, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  j .F.performBinarySearchTests._1.array.cond.0                         # ir inst 13 fin
.F.performBinarySearchTests._3.array.exit.0:
# Start call preparation
  li a1, 500
  li t1, 6040
  add t1, sp, t1
  mv a0, t1
  call .F.initializeSortedArray
# ir inst 14 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performBinarySearchTests._4.while.cond.0                         # ir inst 15 fin
.F.performBinarySearchTests._4.while.cond.0:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 18 fin
  bnez t4, .F.performBinarySearchTests._5.while.body.0
  j .F.performBinarySearchTests._9.while.exit.0                         # ir inst 19 fin
.F.performBinarySearchTests._5.while.body.0:
  li t2, 10
  mul t4, t6, t2                                                        # ir inst 20 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 2000
  li t1, 6040
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 21 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  li a1, 500
  addi t1, sp, 40
  mv a0, t1
  call .F.binarySearch
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 22 fin
  li t2, -1
  xor t0, t3, t2
  sltu t4, zero, t0                                                     # ir inst 23 fin
  bnez t4, .F.performBinarySearchTests._6.if.then.0
  j .F.performBinarySearchTests._7.if.else.0                            # ir inst 24 fin
.F.performBinarySearchTests._6.if.then.0:
  addi t4, t5, 1                                                        # ir inst 25 fin
# Phi connections
  j .F.performBinarySearchTests._8.if.exit.0                            # ir inst 26 fin
.F.performBinarySearchTests._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performBinarySearchTests._8.if.exit.0                            # ir inst 27 fin
.F.performBinarySearchTests._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performBinarySearchTests._4.while.cond.0                         # ir inst 30 fin
.F.performBinarySearchTests._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.performBinarySearchTests._10.while.cond.1                        # ir inst 31 fin
.F.performBinarySearchTests._10.while.cond.1:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 34 fin
  bnez t4, .F.performBinarySearchTests._11.while.body.1
  j .F.performBinarySearchTests._15.while.exit.1                        # ir inst 35 fin
.F.performBinarySearchTests._11.while.body.1:
  li t2, 20
  mul t4, t6, t2                                                        # ir inst 36 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 2000
  li t1, 6040
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 2040
  mv a0, t1
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 37 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  li a1, 500
  addi t1, sp, 2040
  mv a0, t1
  call .F.binarySearchFirst
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 38 fin
  li t2, -1
  xor t0, t3, t2
  sltu t4, zero, t0                                                     # ir inst 39 fin
  bnez t4, .F.performBinarySearchTests._12.if.then.1
  j .F.performBinarySearchTests._13.if.else.1                           # ir inst 40 fin
.F.performBinarySearchTests._12.if.then.1:
  add t4, t5, t3                                                        # ir inst 41 fin
# Phi connections
  j .F.performBinarySearchTests._14.if.exit.1                           # ir inst 42 fin
.F.performBinarySearchTests._13.if.else.1:
# Phi connections
  mv t4, t5
  j .F.performBinarySearchTests._14.if.exit.1                           # ir inst 43 fin
.F.performBinarySearchTests._14.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performBinarySearchTests._10.while.cond.1                        # ir inst 46 fin
.F.performBinarySearchTests._15.while.exit.1:
# Phi connections
  li t6, 0
  j .F.performBinarySearchTests._16.while.cond.2                        # ir inst 47 fin
.F.performBinarySearchTests._16.while.cond.2:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 50 fin
  bnez t4, .F.performBinarySearchTests._17.while.body.2
  j .F.performBinarySearchTests._21.while.exit.2                        # ir inst 51 fin
.F.performBinarySearchTests._17.while.body.2:
  li t2, 20
  mul t4, t6, t2                                                        # ir inst 52 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 2000
  li t1, 6040
  add t1, sp, t1
  mv a1, t1
  li t1, 4040
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 53 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  li a1, 500
  li t1, 4040
  add t1, sp, t1
  mv a0, t1
  call .F.binarySearchLast
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 54 fin
  li t2, -1
  xor t0, t3, t2
  sltu t4, zero, t0                                                     # ir inst 55 fin
  bnez t4, .F.performBinarySearchTests._18.if.then.2
  j .F.performBinarySearchTests._19.if.else.2                           # ir inst 56 fin
.F.performBinarySearchTests._18.if.then.2:
  add t4, t5, t3                                                        # ir inst 57 fin
# Phi connections
  j .F.performBinarySearchTests._20.if.exit.2                           # ir inst 58 fin
.F.performBinarySearchTests._19.if.else.2:
# Phi connections
  mv t4, t5
  j .F.performBinarySearchTests._20.if.exit.2                           # ir inst 59 fin
.F.performBinarySearchTests._20.if.exit.2:
  addi t3, t6, 1                                                        # ir inst 61 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performBinarySearchTests._16.while.cond.2                        # ir inst 62 fin
.F.performBinarySearchTests._21.while.exit.2:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 63 fin
  mv a0, t6
  j .F.performBinarySearchTests.epilogue                                # ir inst 64 fin
.F.performBinarySearchTests.epilogue:
  ld ra, 32(sp)
  li t0, 8048
  add sp, sp, t0
  ret

.globl .F.initializeSortedArray
.F.initializeSortedArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeSortedArray._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeSortedArray._1.while.cond.0                            # ir inst 1 fin
.F.initializeSortedArray._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.initializeSortedArray._2.while.body.0
  j .F.initializeSortedArray._3.while.exit.0                            # ir inst 4 fin
.F.initializeSortedArray._2.while.body.0:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  li t2, 5
  div t3, t4, t2                                                        # ir inst 7 fin
  li t2, 10
  mul t4, t3, t2                                                        # ir inst 8 fin
  sw t4, 0(t5)                                                          # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.initializeSortedArray._1.while.cond.0                            # ir inst 11 fin
.F.initializeSortedArray._3.while.exit.0:
  j .F.initializeSortedArray.epilogue                                   # ir inst 12 fin
.F.initializeSortedArray.epilogue:
  ret

.globl .F.binarySearch
.F.binarySearch:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.binarySearch._0.entry.0:
  addi t6, a1, -1                                                       # ir inst 1 fin
  mv t5, t6                                                             # ir inst 2 fin
# Phi connections
  mv t6, t5
  li t5, 0
  j .F.binarySearch._1.while.cond.0                                     # ir inst 3 fin
.F.binarySearch._1.while.cond.0:
  slt t0, t6, t5
  xori t4, t0, 1                                                        # ir inst 6 fin
  bnez t4, .F.binarySearch._2.while.body.0
  j .F.binarySearch._9.while.exit.0                                     # ir inst 7 fin
.F.binarySearch._2.while.body.0:
  sub t4, t6, t5                                                        # ir inst 8 fin
  li t2, 2
  div t3, t4, t2                                                        # ir inst 9 fin
  add t4, t5, t3                                                        # ir inst 10 fin
  mv t3, t4                                                             # ir inst 11 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
  xor t0, t3, a2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.binarySearch._3.if.then.0
  j .F.binarySearch._4.if.else.0                                        # ir inst 15 fin
.F.binarySearch._3.if.then.0:
  mv a0, t4
  j .F.binarySearch.epilogue                                            # ir inst 16 fin
.F.binarySearch._4.if.else.0:
  mv t3, t4                                                             # ir inst 17 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 18 fin
  lw t3, 0(s11)                                                         # ir inst 19 fin
  slt s11, t3, a2                                                       # ir inst 20 fin
  bnez s11, .F.binarySearch._5.if.then.1
  j .F.binarySearch._6.if.else.1                                        # ir inst 21 fin
.F.binarySearch._5.if.then.1:
  addi t3, t4, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t3
  j .F.binarySearch._7.if.exit.1                                        # ir inst 23 fin
.F.binarySearch._6.if.else.1:
  addi t6, t4, -1                                                       # ir inst 24 fin
# Phi connections
  j .F.binarySearch._7.if.exit.1                                        # ir inst 25 fin
.F.binarySearch._7.if.exit.1:
  j .F.binarySearch._8.if.exit.0                                        # ir inst 28 fin
.F.binarySearch._8.if.exit.0:
# Phi connections
  j .F.binarySearch._1.while.cond.0                                     # ir inst 29 fin
.F.binarySearch._9.while.exit.0:
  li a0, -1
  j .F.binarySearch.epilogue                                            # ir inst 30 fin
.F.binarySearch.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.binarySearchFirst
.F.binarySearchFirst:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.binarySearchFirst._0.entry.0:
  addi t6, a1, -1                                                       # ir inst 1 fin
  mv t5, t6                                                             # ir inst 2 fin
# Phi connections
  li t4, 0
  li t6, -1
  j .F.binarySearchFirst._1.while.cond.0                                # ir inst 3 fin
.F.binarySearchFirst._1.while.cond.0:
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 7 fin
  bnez t3, .F.binarySearchFirst._2.while.body.0
  j .F.binarySearchFirst._9.while.exit.0                                # ir inst 8 fin
.F.binarySearchFirst._2.while.body.0:
  sub t3, t5, t4                                                        # ir inst 9 fin
  li t2, 2
  div s11, t3, t2                                                       # ir inst 10 fin
  add t3, t4, s11                                                       # ir inst 11 fin
  mv s11, t3                                                            # ir inst 12 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 13 fin
  lw s11, 0(s10)                                                        # ir inst 14 fin
  xor t0, s11, a2
  sltiu s10, t0, 1                                                      # ir inst 15 fin
  bnez s10, .F.binarySearchFirst._3.if.then.0
  j .F.binarySearchFirst._4.if.else.0                                   # ir inst 16 fin
.F.binarySearchFirst._3.if.then.0:
  addi s11, t3, -1                                                      # ir inst 17 fin
# Phi connections
  mv t5, t3
  mv t3, t4
  mv t4, s11
  j .F.binarySearchFirst._8.if.exit.0                                   # ir inst 18 fin
.F.binarySearchFirst._4.if.else.0:
  mv s11, t3                                                            # ir inst 19 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 20 fin
  lw s11, 0(s10)                                                        # ir inst 21 fin
  slt s10, s11, a2                                                      # ir inst 22 fin
  bnez s10, .F.binarySearchFirst._5.if.then.1
  j .F.binarySearchFirst._6.if.else.1                                   # ir inst 23 fin
.F.binarySearchFirst._5.if.then.1:
  addi s11, t3, 1                                                       # ir inst 24 fin
# Phi connections
  mv t4, s11
  j .F.binarySearchFirst._7.if.exit.1                                   # ir inst 25 fin
.F.binarySearchFirst._6.if.else.1:
  addi t5, t3, -1                                                       # ir inst 26 fin
# Phi connections
  j .F.binarySearchFirst._7.if.exit.1                                   # ir inst 27 fin
.F.binarySearchFirst._7.if.exit.1:
# Phi connections
  mv t3, t4
  mv t4, t5
  mv t5, t6
  j .F.binarySearchFirst._8.if.exit.0                                   # ir inst 30 fin
.F.binarySearchFirst._8.if.exit.0:
# Phi connections
  mv t6, t5
  mv t5, t4
  mv t4, t3
  j .F.binarySearchFirst._1.while.cond.0                                # ir inst 34 fin
.F.binarySearchFirst._9.while.exit.0:
  mv a0, t6
  j .F.binarySearchFirst.epilogue                                       # ir inst 35 fin
.F.binarySearchFirst.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.binarySearchLast
.F.binarySearchLast:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.binarySearchLast._0.entry.0:
  addi t6, a1, -1                                                       # ir inst 1 fin
  mv t5, t6                                                             # ir inst 2 fin
# Phi connections
  li t4, 0
  li t6, -1
  j .F.binarySearchLast._1.while.cond.0                                 # ir inst 3 fin
.F.binarySearchLast._1.while.cond.0:
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 7 fin
  bnez t3, .F.binarySearchLast._2.while.body.0
  j .F.binarySearchLast._9.while.exit.0                                 # ir inst 8 fin
.F.binarySearchLast._2.while.body.0:
  sub t3, t5, t4                                                        # ir inst 9 fin
  li t2, 2
  div s11, t3, t2                                                       # ir inst 10 fin
  add t3, t4, s11                                                       # ir inst 11 fin
  mv s11, t3                                                            # ir inst 12 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 13 fin
  lw s11, 0(s10)                                                        # ir inst 14 fin
  xor t0, s11, a2
  sltiu s10, t0, 1                                                      # ir inst 15 fin
  bnez s10, .F.binarySearchLast._3.if.then.0
  j .F.binarySearchLast._4.if.else.0                                    # ir inst 16 fin
.F.binarySearchLast._3.if.then.0:
  addi s11, t3, 1                                                       # ir inst 17 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  mv t3, s11
  j .F.binarySearchLast._8.if.exit.0                                    # ir inst 18 fin
.F.binarySearchLast._4.if.else.0:
  mv s11, t3                                                            # ir inst 19 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 20 fin
  lw s11, 0(s10)                                                        # ir inst 21 fin
  slt s10, s11, a2                                                      # ir inst 22 fin
  bnez s10, .F.binarySearchLast._5.if.then.1
  j .F.binarySearchLast._6.if.else.1                                    # ir inst 23 fin
.F.binarySearchLast._5.if.then.1:
  addi s11, t3, 1                                                       # ir inst 24 fin
# Phi connections
  mv t4, s11
  j .F.binarySearchLast._7.if.exit.1                                    # ir inst 25 fin
.F.binarySearchLast._6.if.else.1:
  addi t5, t3, -1                                                       # ir inst 26 fin
# Phi connections
  j .F.binarySearchLast._7.if.exit.1                                    # ir inst 27 fin
.F.binarySearchLast._7.if.exit.1:
# Phi connections
  mv t3, t4
  mv t4, t5
  mv t5, t6
  j .F.binarySearchLast._8.if.exit.0                                    # ir inst 30 fin
.F.binarySearchLast._8.if.exit.0:
# Phi connections
  mv t6, t5
  mv t5, t4
  mv t4, t3
  j .F.binarySearchLast._1.while.cond.0                                 # ir inst 34 fin
.F.binarySearchLast._9.while.exit.0:
  mv a0, t6
  j .F.binarySearchLast.epilogue                                        # ir inst 35 fin
.F.binarySearchLast.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performPatternMatching
.F.performPatternMatching:
# spill func args num: 0,             range:      864(sp) -      864(sp)
# local var size: 840,                range:       24(sp) -      864(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -864
  sd ra, 16(sp)
.F.performPatternMatching._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performPatternMatching._1.array.cond.0                           # ir inst 3 fin
.F.performPatternMatching._1.array.cond.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performPatternMatching._2.array.body.0
  j .F.performPatternMatching._3.array.exit.0                           # ir inst 6 fin
.F.performPatternMatching._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performPatternMatching._1.array.cond.0                           # ir inst 10 fin
.F.performPatternMatching._3.array.exit.0:
  addi t1, sp, 824
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.performPatternMatching._4.array.cond.1                           # ir inst 13 fin
.F.performPatternMatching._4.array.cond.1:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.performPatternMatching._5.array.body.1
  j .F.performPatternMatching._6.array.exit.1                           # ir inst 16 fin
.F.performPatternMatching._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.performPatternMatching._4.array.cond.1                           # ir inst 20 fin
.F.performPatternMatching._6.array.exit.1:
# Start call preparation
  li a3, 10
  li a2, 200
  addi t1, sp, 824
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeTextAndPattern
# ir inst 21 fin
# Start call preparation
  li a3, 10
  li a2, 200
  addi t1, sp, 824
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.naivePatternMatching
  mv t6, a0
# ir inst 22 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 10
  li a2, 200
  addi t1, sp, 824
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.kmpPatternMatching
  mv t5, a0
  ld t6, 0(sp)
# ir inst 23 fin
  add t4, t6, t5                                                        # ir inst 24 fin
  mv a0, t4
  j .F.performPatternMatching.epilogue                                  # ir inst 25 fin
.F.performPatternMatching.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 864
  ret

.globl .F.initializeTextAndPattern
.F.initializeTextAndPattern:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 4,                  range:       48(sp) -       52(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 40(sp)
.F.initializeTextAndPattern._0.entry.0:
# alloca %4
  addi t2, sp, 48
  li t1, 24681
  sw t1, 0(t2)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.initializeTextAndPattern._1.while.cond.0                         # ir inst 3 fin
.F.initializeTextAndPattern._1.while.cond.0:
  sltu t5, t6, a2                                                       # ir inst 5 fin
  bnez t5, .F.initializeTextAndPattern._2.while.body.0
  j .F.initializeTextAndPattern._3.while.exit.0                         # ir inst 6 fin
.F.initializeTextAndPattern._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  addi t1, sp, 48
  lw t4, 0(t1)                                                          # ir inst 9 fin
  li t2, 5
  rem t3, t4, t2                                                        # ir inst 10 fin
  sw t3, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.initializeTextAndPattern._1.while.cond.0                         # ir inst 13 fin
.F.initializeTextAndPattern._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeTextAndPattern._4.while.cond.1                         # ir inst 14 fin
.F.initializeTextAndPattern._4.while.cond.1:
  sltu t5, t6, a3                                                       # ir inst 16 fin
  bnez t5, .F.initializeTextAndPattern._5.while.body.1
  j .F.initializeTextAndPattern._6.while.exit.1                         # ir inst 17 fin
.F.initializeTextAndPattern._5.while.body.1:
# Start call preparation
  sd a1, 0(sp)
  sd a3, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F.update
  ld a1, 0(sp)
  ld a3, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 19 fin
  addi t1, sp, 48
  lw t4, 0(t1)                                                          # ir inst 20 fin
  li t2, 5
  rem t3, t4, t2                                                        # ir inst 21 fin
  sw t3, 0(t5)                                                          # ir inst 22 fin
  addi t5, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t6, t5
  j .F.initializeTextAndPattern._4.while.cond.1                         # ir inst 24 fin
.F.initializeTextAndPattern._6.while.exit.1:
  j .F.initializeTextAndPattern.epilogue                                # ir inst 25 fin
.F.initializeTextAndPattern.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.naivePatternMatching
.F.naivePatternMatching:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.naivePatternMatching._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.naivePatternMatching._1.while.cond.0                             # ir inst 1 fin
.F.naivePatternMatching._1.while.cond.0:
  sub t4, a2, a3                                                        # ir inst 4 fin
  sltu t0, t4, t6
  xori t3, t0, 1                                                        # ir inst 5 fin
  bnez t3, .F.naivePatternMatching._2.while.body.0
  j .F.naivePatternMatching._12.while.exit.0                            # ir inst 6 fin
.F.naivePatternMatching._2.while.body.0:
# Phi connections
  li t4, 0
  j .F.naivePatternMatching._3.while.cond.1                             # ir inst 7 fin
.F.naivePatternMatching._3.while.cond.1:
  sltu t3, t4, a3                                                       # ir inst 9 fin
  bnez t3, .F.naivePatternMatching._4.while.body.1
  j .F.naivePatternMatching._13.critical_edge.0                         # ir inst 10 fin
.F.naivePatternMatching._4.while.body.1:
  add t3, t6, t4                                                        # ir inst 11 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 14 fin
  lw s10, 0(s11)                                                        # ir inst 15 fin
  xor t0, t3, s10
  sltu s11, zero, t0                                                    # ir inst 16 fin
  bnez s11, .F.naivePatternMatching._5.if.then.0
  j .F.naivePatternMatching._6.if.else.0                                # ir inst 17 fin
.F.naivePatternMatching._5.if.then.0:
# Phi connections
  li t4, 0
  j .F.naivePatternMatching._8.while.exit.1                             # ir inst 18 fin
.F.naivePatternMatching._6.if.else.0:
  j .F.naivePatternMatching._7.if.exit.0                                # ir inst 19 fin
.F.naivePatternMatching._7.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 20 fin
# Phi connections
  mv t4, t3
  j .F.naivePatternMatching._3.while.cond.1                             # ir inst 21 fin
.F.naivePatternMatching._8.while.exit.1:
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 23 fin
  bnez t3, .F.naivePatternMatching._9.if.then.1
  j .F.naivePatternMatching._10.if.else.1                               # ir inst 24 fin
.F.naivePatternMatching._9.if.then.1:
  addi t4, t5, 1                                                        # ir inst 25 fin
# Phi connections
  j .F.naivePatternMatching._11.if.exit.1                               # ir inst 26 fin
.F.naivePatternMatching._10.if.else.1:
# Phi connections
  mv t4, t5
  j .F.naivePatternMatching._11.if.exit.1                               # ir inst 27 fin
.F.naivePatternMatching._11.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.naivePatternMatching._1.while.cond.0                             # ir inst 30 fin
.F.naivePatternMatching._12.while.exit.0:
  mv a0, t5
  j .F.naivePatternMatching.epilogue                                    # ir inst 31 fin
.F.naivePatternMatching._13.critical_edge.0:
# Phi connections
  li t4, 1
  j .F.naivePatternMatching._8.while.exit.1                             # ir inst 32 fin
.F.naivePatternMatching.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.kmpPatternMatching
.F.kmpPatternMatching:
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 80,                 range:       56(sp) -      136(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.kmpPatternMatching._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.kmpPatternMatching._1.array.cond.0                               # ir inst 3 fin
.F.kmpPatternMatching._1.array.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.kmpPatternMatching._2.array.body.0
  j .F.kmpPatternMatching._3.array.exit.0                               # ir inst 6 fin
.F.kmpPatternMatching._2.array.body.0:
  slli t2, t5, 3
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.kmpPatternMatching._1.array.cond.0                               # ir inst 10 fin
.F.kmpPatternMatching._3.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  addi t1, sp, 56
  mv a2, t1
  mv a0, a1
  mv a1, a3
  call .F.computeLPSArray
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 11 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.kmpPatternMatching._4.while.cond.0                               # ir inst 12 fin
.F.kmpPatternMatching._4.while.cond.0:
  sltu t3, t5, a2                                                       # ir inst 16 fin
  bnez t3, .F.kmpPatternMatching._5.while.body.0
  j .F.kmpPatternMatching._21.while.exit.0                              # ir inst 17 fin
.F.kmpPatternMatching._5.while.body.0:
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 18 fin
  lw s11, 0(t3)                                                         # ir inst 19 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 20 fin
  lw s10, 0(t3)                                                         # ir inst 21 fin
  xor t0, s11, s10
  sltiu t3, t0, 1                                                       # ir inst 22 fin
  bnez t3, .F.kmpPatternMatching._6.if.then.0
  j .F.kmpPatternMatching._7.if.else.0                                  # ir inst 23 fin
.F.kmpPatternMatching._6.if.then.0:
  addi t3, t5, 1                                                        # ir inst 24 fin
  addi s11, t6, 1                                                       # ir inst 25 fin
# Phi connections
  mv t5, t3
  mv t6, s11
  j .F.kmpPatternMatching._8.if.exit.0                                  # ir inst 26 fin
.F.kmpPatternMatching._7.if.else.0:
# Phi connections
  j .F.kmpPatternMatching._8.if.exit.0                                  # ir inst 27 fin
.F.kmpPatternMatching._8.if.exit.0:
  xor t0, t6, a3
  sltiu t3, t0, 1                                                       # ir inst 30 fin
  bnez t3, .F.kmpPatternMatching._9.if.then.1
  j .F.kmpPatternMatching._10.if.else.1                                 # ir inst 31 fin
.F.kmpPatternMatching._9.if.then.1:
  addi t3, t4, 1                                                        # ir inst 32 fin
  addi s11, t6, -1                                                      # ir inst 33 fin
  slli t2, s11, 3
  addi t1, sp, 56
  add s10, t1, t2                                                       # ir inst 34 fin
  ld s11, 0(s10)                                                        # ir inst 35 fin
# Phi connections
  mv t6, s11
  j .F.kmpPatternMatching._20.if.exit.1                                 # ir inst 36 fin
.F.kmpPatternMatching._10.if.else.1:
  sltu t3, t5, a2                                                       # ir inst 37 fin
  bnez t3, .F.kmpPatternMatching._11.lazy.then.0
  j .F.kmpPatternMatching._12.lazy.else.0                               # ir inst 38 fin
.F.kmpPatternMatching._11.lazy.then.0:
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 39 fin
  lw s11, 0(t3)                                                         # ir inst 40 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 41 fin
  lw s10, 0(t3)                                                         # ir inst 42 fin
  xor t0, s11, s10
  sltu t3, zero, t0                                                     # ir inst 43 fin
# Phi connections
  j .F.kmpPatternMatching._13.lazy.exit.0                               # ir inst 44 fin
.F.kmpPatternMatching._12.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.kmpPatternMatching._13.lazy.exit.0                               # ir inst 45 fin
.F.kmpPatternMatching._13.lazy.exit.0:
  bnez t3, .F.kmpPatternMatching._14.if.then.2
  j .F.kmpPatternMatching._18.if.else.2                                 # ir inst 47 fin
.F.kmpPatternMatching._14.if.then.2:
  li t2, 0
  xor t0, t6, t2
  sltu t3, zero, t0                                                     # ir inst 48 fin
  bnez t3, .F.kmpPatternMatching._15.if.then.3
  j .F.kmpPatternMatching._16.if.else.3                                 # ir inst 49 fin
.F.kmpPatternMatching._15.if.then.3:
  addi t3, t6, -1                                                       # ir inst 50 fin
  slli t2, t3, 3
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 51 fin
  ld t3, 0(s11)                                                         # ir inst 52 fin
# Phi connections
  mv s11, t5
  j .F.kmpPatternMatching._17.if.exit.3                                 # ir inst 53 fin
.F.kmpPatternMatching._16.if.else.3:
  addi t3, t5, 1                                                        # ir inst 54 fin
# Phi connections
  mv s11, t3
  mv t3, t6
  j .F.kmpPatternMatching._17.if.exit.3                                 # ir inst 55 fin
.F.kmpPatternMatching._17.if.exit.3:
# Phi connections
  mv t5, s11
  mv t6, t3
  j .F.kmpPatternMatching._19.if.exit.2                                 # ir inst 58 fin
.F.kmpPatternMatching._18.if.else.2:
# Phi connections
  j .F.kmpPatternMatching._19.if.exit.2                                 # ir inst 59 fin
.F.kmpPatternMatching._19.if.exit.2:
# Phi connections
  mv t3, t4
  j .F.kmpPatternMatching._20.if.exit.1                                 # ir inst 62 fin
.F.kmpPatternMatching._20.if.exit.1:
# Phi connections
  mv t4, t3
  j .F.kmpPatternMatching._4.while.cond.0                               # ir inst 66 fin
.F.kmpPatternMatching._21.while.exit.0:
  mv a0, t4
  j .F.kmpPatternMatching.epilogue                                      # ir inst 67 fin
.F.kmpPatternMatching.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 144
  ret

.globl .F.computeLPSArray
.F.computeLPSArray:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.computeLPSArray._0.entry.0:
  addi t6, a2, 0                                                        # ir inst 1 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t5, 0
  li t6, 1
  j .F.computeLPSArray._1.while.cond.0                                  # ir inst 3 fin
.F.computeLPSArray._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 6 fin
  bnez t4, .F.computeLPSArray._2.while.body.0
  j .F.computeLPSArray._9.while.exit.0                                  # ir inst 7 fin
.F.computeLPSArray._2.while.body.0:
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 10 fin
  lw s11, 0(t4)                                                         # ir inst 11 fin
  xor t0, t3, s11
  sltiu t4, t0, 1                                                       # ir inst 12 fin
  bnez t4, .F.computeLPSArray._3.if.then.0
  j .F.computeLPSArray._4.if.else.0                                     # ir inst 13 fin
.F.computeLPSArray._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 14 fin
  slli t2, t6, 3
  add t3, a2, t2                                                        # ir inst 15 fin
  sd t4, 0(t3)                                                          # ir inst 16 fin
  addi t3, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.computeLPSArray._8.if.exit.0                                     # ir inst 18 fin
.F.computeLPSArray._4.if.else.0:
  li t2, 0
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 19 fin
  bnez t4, .F.computeLPSArray._5.if.then.1
  j .F.computeLPSArray._6.if.else.1                                     # ir inst 20 fin
.F.computeLPSArray._5.if.then.1:
  addi t4, t5, -1                                                       # ir inst 21 fin
  slli t2, t4, 3
  add t3, a2, t2                                                        # ir inst 22 fin
  ld t4, 0(t3)                                                          # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.computeLPSArray._7.if.exit.1                                     # ir inst 24 fin
.F.computeLPSArray._6.if.else.1:
  slli t2, t6, 3
  add t4, a2, t2                                                        # ir inst 25 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 26 fin
  addi t4, t6, 1                                                        # ir inst 27 fin
# Phi connections
  mv t6, t4
  j .F.computeLPSArray._7.if.exit.1                                     # ir inst 28 fin
.F.computeLPSArray._7.if.exit.1:
# Phi connections
  j .F.computeLPSArray._8.if.exit.0                                     # ir inst 31 fin
.F.computeLPSArray._8.if.exit.0:
# Phi connections
  j .F.computeLPSArray._1.while.cond.0                                  # ir inst 34 fin
.F.computeLPSArray._9.while.exit.0:
  j .F.computeLPSArray.epilogue                                         # ir inst 35 fin
.F.computeLPSArray.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.update
.F.update:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.update._0.entry.0:
  lw t6, 0(a0)                                                          # ir inst 1 fin
  li t2, 1103
  mul t5, t6, t2                                                        # ir inst 2 fin
  li t2, 4721
  add t6, t5, t2                                                        # ir inst 3 fin
  li t2, 1048583
  rem t5, t6, t2                                                        # ir inst 4 fin
  sw t5, 0(a0)                                                          # ir inst 5 fin
  lw t6, 0(a0)                                                          # ir inst 6 fin
  li t2, 0
  slt t5, t6, t2                                                        # ir inst 7 fin
  bnez t5, .F.update._1.if.then.0
  j .F.update._2.if.else.0                                              # ir inst 8 fin
.F.update._1.if.then.0:
  lw t6, 0(a0)                                                          # ir inst 9 fin
  li t1, 0
  sub t5, t1, t6                                                        # ir inst 10 fin
  sw t5, 0(a0)                                                          # ir inst 11 fin
  j .F.update._3.if.exit.0                                              # ir inst 12 fin
.F.update._2.if.else.0:
  j .F.update._3.if.exit.0                                              # ir inst 13 fin
.F.update._3.if.exit.0:
  j .F.update.epilogue                                                  # ir inst 14 fin
.F.update.epilogue:
  ret
