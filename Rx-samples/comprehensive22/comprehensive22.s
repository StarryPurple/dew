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
  li a0, 1000
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performSortingBenchmark
# ir inst 2 fin
# Start call preparation
  call .F.performMatrixOperations
# ir inst 3 fin
# Start call preparation
  call .F.performRecursiveOperations
# ir inst 4 fin
# Start call preparation
  call .F.performMathematicalOperations
# ir inst 5 fin
# Start call preparation
  call .F.performMemoryAccessPatterns
# ir inst 6 fin
# Start call preparation
  li a0, 9999
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

.globl .F.performSortingBenchmark
.F.performSortingBenchmark:
# spill func args num: 0,             range:    20016(sp) -    20016(sp)
# local var size: 20000,              range:        8(sp) -    20008(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -20016
  add sp, sp, t0
  sd ra, 0(sp)
.F.performSortingBenchmark._0.entry.0:
# Start call preparation
  li a0, 1001
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performSortingBenchmark._1.array.cond.0                          # ir inst 4 fin
.F.performSortingBenchmark._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performSortingBenchmark._2.array.body.0
  j .F.performSortingBenchmark._3.array.exit.0                          # ir inst 7 fin
.F.performSortingBenchmark._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performSortingBenchmark._1.array.cond.0                          # ir inst 11 fin
.F.performSortingBenchmark._3.array.exit.0:
# Start call preparation
  li a1, 1000
  addi t1, sp, 8
  mv a0, t1
  call .F.initializeReverseArray
# ir inst 12 fin
  li t1, 4008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 14 fin
# Phi connections
  li t5, 0
  j .F.performSortingBenchmark._4.array.cond.1                          # ir inst 15 fin
.F.performSortingBenchmark._4.array.cond.1:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 17 fin
  bnez t4, .F.performSortingBenchmark._5.array.body.1
  j .F.performSortingBenchmark._6.array.exit.1                          # ir inst 18 fin
.F.performSortingBenchmark._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  j .F.performSortingBenchmark._4.array.cond.1                          # ir inst 22 fin
.F.performSortingBenchmark._6.array.exit.1:
# Start call preparation
  li a2, 1000
  li t1, 4008
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.copyArray
# ir inst 23 fin
# Start call preparation
  li a2, 999
  li a1, 0
  li t1, 4008
  add t1, sp, t1
  mv a0, t1
  call .F.quickSort
# ir inst 24 fin
# Start call preparation
  li a1, 1000
  li t1, 4008
  add t1, sp, t1
  mv a0, t1
  call .F.validateSortedArray
# ir inst 25 fin
  li t1, 8008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 27 fin
# Phi connections
  li t5, 0
  j .F.performSortingBenchmark._7.array.cond.2                          # ir inst 28 fin
.F.performSortingBenchmark._7.array.cond.2:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 30 fin
  bnez t4, .F.performSortingBenchmark._8.array.body.2
  j .F.performSortingBenchmark._9.array.exit.2                          # ir inst 31 fin
.F.performSortingBenchmark._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 32 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 33 fin
  addi t4, t5, 1                                                        # ir inst 34 fin
# Phi connections
  mv t5, t4
  j .F.performSortingBenchmark._7.array.cond.2                          # ir inst 35 fin
.F.performSortingBenchmark._9.array.exit.2:
# Start call preparation
  li a2, 1000
  li t1, 8008
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.copyArray
# ir inst 36 fin
# Start call preparation
  li a1, 1000
  li t1, 8008
  add t1, sp, t1
  mv a0, t1
  call .F.heapSort
# ir inst 37 fin
# Start call preparation
  li a1, 1000
  li t1, 8008
  add t1, sp, t1
  mv a0, t1
  call .F.validateSortedArray
# ir inst 38 fin
  li t1, 12008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 40 fin
# Phi connections
  li t5, 0
  j .F.performSortingBenchmark._10.array.cond.3                         # ir inst 41 fin
.F.performSortingBenchmark._10.array.cond.3:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 43 fin
  bnez t4, .F.performSortingBenchmark._11.array.body.3
  j .F.performSortingBenchmark._12.array.exit.3                         # ir inst 44 fin
.F.performSortingBenchmark._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 45 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 46 fin
  addi t4, t5, 1                                                        # ir inst 47 fin
# Phi connections
  mv t5, t4
  j .F.performSortingBenchmark._10.array.cond.3                         # ir inst 48 fin
.F.performSortingBenchmark._12.array.exit.3:
# Start call preparation
  li a2, 1000
  li t1, 12008
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.copyArray
# ir inst 49 fin
# Start call preparation
  li a2, 999
  li a1, 0
  li t1, 12008
  add t1, sp, t1
  mv a0, t1
  call .F.mergeSort
# ir inst 50 fin
# Start call preparation
  li a1, 1000
  li t1, 12008
  add t1, sp, t1
  mv a0, t1
  call .F.validateSortedArray
# ir inst 51 fin
  li t1, 16008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F.performSortingBenchmark._13.array.cond.4                         # ir inst 54 fin
.F.performSortingBenchmark._13.array.cond.4:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, .F.performSortingBenchmark._14.array.body.4
  j .F.performSortingBenchmark._15.array.exit.4                         # ir inst 57 fin
.F.performSortingBenchmark._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 58 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.performSortingBenchmark._13.array.cond.4                         # ir inst 61 fin
.F.performSortingBenchmark._15.array.exit.4:
# Start call preparation
  li a2, 1000
  li t1, 16008
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.copyArray
# ir inst 62 fin
# Start call preparation
  li a1, 1000
  li t1, 16008
  add t1, sp, t1
  mv a0, t1
  call .F.selectionSort
# ir inst 63 fin
# Start call preparation
  li a1, 1000
  li t1, 16008
  add t1, sp, t1
  mv a0, t1
  call .F.validateSortedArray
# ir inst 64 fin
# Start call preparation
  li a0, 1002
  call printlnInt
# ir inst 65 fin
  j .F.performSortingBenchmark.epilogue                                 # ir inst 66 fin
.F.performSortingBenchmark.epilogue:
  ld ra, 0(sp)
  li t0, 20016
  add sp, sp, t0
  ret

.globl .F.initializeReverseArray
.F.initializeReverseArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeReverseArray._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeReverseArray._1.while.cond.0                           # ir inst 1 fin
.F.initializeReverseArray._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.initializeReverseArray._2.while.body.0
  j .F.initializeReverseArray._3.while.exit.0                           # ir inst 4 fin
.F.initializeReverseArray._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  sub t5, a1, t6                                                        # ir inst 7 fin
  sw t5, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.initializeReverseArray._1.while.cond.0                           # ir inst 10 fin
.F.initializeReverseArray._3.while.exit.0:
  j .F.initializeReverseArray.epilogue                                  # ir inst 11 fin
.F.initializeReverseArray.epilogue:
  ret

.globl .F.copyArray
.F.copyArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.copyArray._0.entry.0:
# Phi connections
  li t6, 0
  j .F.copyArray._1.while.cond.0                                        # ir inst 1 fin
.F.copyArray._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.copyArray._2.while.body.0
  j .F.copyArray._3.while.exit.0                                        # ir inst 4 fin
.F.copyArray._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  mv t5, t6                                                             # ir inst 7 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t5, 0(t3)                                                          # ir inst 9 fin
  sw t5, 0(t4)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.copyArray._1.while.cond.0                                        # ir inst 12 fin
.F.copyArray._3.while.exit.0:
  j .F.copyArray.epilogue                                               # ir inst 13 fin
.F.copyArray.epilogue:
  ret

.globl .F.quickSort
.F.quickSort:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.quickSort._0.entry.0:
  slt t6, a1, a2                                                        # ir inst 1 fin
  bnez t6, .F.quickSort._1.if.then.0
  j .F.quickSort._2.if.else.0                                           # ir inst 2 fin
.F.quickSort._1.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.partition
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 3 fin
  addi t5, t6, -1                                                       # ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t5
  call .F.quickSort
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 5 fin
  addi t5, t6, 1                                                        # ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.quickSort
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
# ir inst 7 fin
  j .F.quickSort._3.if.exit.0                                           # ir inst 8 fin
.F.quickSort._2.if.else.0:
  j .F.quickSort._3.if.exit.0                                           # ir inst 9 fin
.F.quickSort._3.if.exit.0:
  j .F.quickSort.epilogue                                               # ir inst 10 fin
.F.quickSort.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.partition
.F.partition:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.partition._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  addi t5, a1, -1                                                       # ir inst 4 fin
# Phi connections
  mv t4, t5
  mv t5, a1
  j .F.partition._1.while.cond.0                                        # ir inst 5 fin
.F.partition._1.while.cond.0:
  slt t3, t5, a2                                                        # ir inst 8 fin
  bnez t3, .F.partition._2.while.body.0
  j .F.partition._6.while.exit.0                                        # ir inst 9 fin
.F.partition._2.while.body.0:
  mv t3, t5                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 11 fin
  lw t3, 0(s11)                                                         # ir inst 12 fin
  slt t0, t6, t3
  xori s11, t0, 1                                                       # ir inst 13 fin
  bnez s11, .F.partition._3.if.then.0
  j .F.partition._4.if.else.0                                           # ir inst 14 fin
.F.partition._3.if.then.0:
  addi t3, t4, 1                                                        # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t5
  mv a1, t3
  call .F.swapElements
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 16 fin
# Phi connections
  j .F.partition._5.if.exit.0                                           # ir inst 17 fin
.F.partition._4.if.else.0:
# Phi connections
  mv t3, t4
  j .F.partition._5.if.exit.0                                           # ir inst 18 fin
.F.partition._5.if.exit.0:
  addi s11, t5, 1                                                       # ir inst 20 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.partition._1.while.cond.0                                        # ir inst 21 fin
.F.partition._6.while.exit.0:
  addi t6, t4, 1                                                        # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  call .F.swapElements
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 23 fin
  addi t6, t4, 1                                                        # ir inst 24 fin
  mv a0, t6
  j .F.partition.epilogue                                               # ir inst 25 fin
.F.partition.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.swapElements
.F.swapElements:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.swapElements._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  mv t5, a1                                                             # ir inst 4 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 5 fin
  mv t5, a2                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t5, 0(t3)                                                          # ir inst 8 fin
  sw t5, 0(t4)                                                          # ir inst 9 fin
  mv t5, a2                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  sw t6, 0(t4)                                                          # ir inst 12 fin
  j .F.swapElements.epilogue                                            # ir inst 13 fin
.F.swapElements.epilogue:
  ret

.globl .F.heapSort
.F.heapSort:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.heapSort._0.entry.0:
  li t2, 2
  div t6, a1, t2                                                        # ir inst 1 fin
  addi t5, t6, -1                                                       # ir inst 2 fin
# Phi connections
  mv t6, t5
  j .F.heapSort._1.while.cond.0                                         # ir inst 3 fin
.F.heapSort._1.while.cond.0:
  li t2, 0
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 5 fin
  bnez t5, .F.heapSort._2.while.body.0
  j .F.heapSort._3.while.exit.0                                         # ir inst 6 fin
.F.heapSort._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  call .F.heapify
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
  addi t5, t6, -1                                                       # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.heapSort._1.while.cond.0                                         # ir inst 9 fin
.F.heapSort._3.while.exit.0:
  addi t6, a1, -1                                                       # ir inst 10 fin
# Phi connections
  j .F.heapSort._4.while.cond.1                                         # ir inst 11 fin
.F.heapSort._4.while.cond.1:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 13 fin
  bnez t5, .F.heapSort._5.while.body.1
  j .F.heapSort._6.while.exit.1                                         # ir inst 14 fin
.F.heapSort._5.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  li a1, 0
  call .F.swapElements
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a2, 0
  mv a1, t6
  call .F.heapify
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 16 fin
  addi t5, t6, -1                                                       # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.heapSort._4.while.cond.1                                         # ir inst 18 fin
.F.heapSort._6.while.exit.1:
  j .F.heapSort.epilogue                                                # ir inst 19 fin
.F.heapSort.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.heapify
.F.heapify:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.heapify._0.entry.0:
  slli t6, a2, 1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  slli t6, a2, 1                                                        # ir inst 3 fin
  addi t4, t6, 2                                                        # ir inst 4 fin
  slt t6, t5, a1                                                        # ir inst 5 fin
  bnez t6, .F.heapify._1.lazy.then.0
  j .F.heapify._2.lazy.else.0                                           # ir inst 6 fin
.F.heapify._1.lazy.then.0:
  mv t6, t5                                                             # ir inst 7 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t6, 0(t3)                                                          # ir inst 9 fin
  mv t3, a2                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 11 fin
  lw t3, 0(s11)                                                         # ir inst 12 fin
  slt s11, t3, t6                                                       # ir inst 13 fin
# Phi connections
  mv t6, s11
  j .F.heapify._3.lazy.exit.0                                           # ir inst 14 fin
.F.heapify._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.heapify._3.lazy.exit.0                                           # ir inst 15 fin
.F.heapify._3.lazy.exit.0:
  bnez t6, .F.heapify._4.if.then.0
  j .F.heapify._5.if.else.0                                             # ir inst 17 fin
.F.heapify._4.if.then.0:
# Phi connections
  mv t6, t5
  j .F.heapify._6.if.exit.0                                             # ir inst 18 fin
.F.heapify._5.if.else.0:
# Phi connections
  mv t6, a2
  j .F.heapify._6.if.exit.0                                             # ir inst 19 fin
.F.heapify._6.if.exit.0:
  slt t5, t4, a1                                                        # ir inst 21 fin
  bnez t5, .F.heapify._7.lazy.then.1
  j .F.heapify._8.lazy.else.1                                           # ir inst 22 fin
.F.heapify._7.lazy.then.1:
  mv t5, t4                                                             # ir inst 23 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 24 fin
  lw t5, 0(t3)                                                          # ir inst 25 fin
  mv t3, t6                                                             # ir inst 26 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 27 fin
  lw t3, 0(s11)                                                         # ir inst 28 fin
  slt s11, t3, t5                                                       # ir inst 29 fin
# Phi connections
  mv t5, s11
  j .F.heapify._9.lazy.exit.1                                           # ir inst 30 fin
.F.heapify._8.lazy.else.1:
# Phi connections
  li t5, 0
  j .F.heapify._9.lazy.exit.1                                           # ir inst 31 fin
.F.heapify._9.lazy.exit.1:
  bnez t5, .F.heapify._10.if.then.1
  j .F.heapify._11.if.else.1                                            # ir inst 33 fin
.F.heapify._10.if.then.1:
# Phi connections
  mv t6, t4
  j .F.heapify._12.if.exit.1                                            # ir inst 34 fin
.F.heapify._11.if.else.1:
# Phi connections
  j .F.heapify._12.if.exit.1                                            # ir inst 35 fin
.F.heapify._12.if.exit.1:
  xor t0, t6, a2
  sltu t5, zero, t0                                                     # ir inst 37 fin
  bnez t5, .F.heapify._13.if.then.2
  j .F.heapify._14.if.else.2                                            # ir inst 38 fin
.F.heapify._13.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a1, a2
  mv a2, t6
  call .F.swapElements
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  call .F.heapify
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 40 fin
  j .F.heapify._15.if.exit.2                                            # ir inst 41 fin
.F.heapify._14.if.else.2:
  j .F.heapify._15.if.exit.2                                            # ir inst 42 fin
.F.heapify._15.if.exit.2:
  j .F.heapify.epilogue                                                 # ir inst 43 fin
.F.heapify.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.mergeSort
.F.mergeSort:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.mergeSort._0.entry.0:
  slt t6, a1, a2                                                        # ir inst 1 fin
  bnez t6, .F.mergeSort._1.if.then.0
  j .F.mergeSort._2.if.else.0                                           # ir inst 2 fin
.F.mergeSort._1.if.then.0:
  sub t6, a2, a1                                                        # ir inst 3 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 4 fin
  add t6, a1, t5                                                        # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  call .F.mergeSort
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 6 fin
  addi t5, t6, 1                                                        # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t5
  call .F.mergeSort
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a3, a2
  mv a2, t6
  call .F.merge
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
  j .F.mergeSort._3.if.exit.0                                           # ir inst 10 fin
.F.mergeSort._2.if.else.0:
  j .F.mergeSort._3.if.exit.0                                           # ir inst 11 fin
.F.mergeSort._3.if.exit.0:
  j .F.mergeSort.epilogue                                               # ir inst 12 fin
.F.mergeSort.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.merge
.F.merge:
# spill func args num: 0,             range:     4032(sp) -     4032(sp)
# local var size: 4000,               range:       32(sp) -     4032(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4032
  add sp, sp, t0
  sd s9, 0(sp)
  sd s8, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
.F.merge._0.entry.0:
  sub t6, a2, a1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  sub t6, a3, a2                                                        # ir inst 3 fin
  addi t1, sp, 32
  addi t4, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t3, 0
  j .F.merge._1.array.cond.0                                            # ir inst 6 fin
.F.merge._1.array.cond.0:
  li t2, 500
  slt s11, t3, t2                                                       # ir inst 8 fin
  bnez s11, .F.merge._2.array.body.0
  j .F.merge._3.array.exit.0                                            # ir inst 9 fin
.F.merge._2.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 10 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 11 fin
  addi s11, t3, 1                                                       # ir inst 12 fin
# Phi connections
  mv t3, s11
  j .F.merge._1.array.cond.0                                            # ir inst 13 fin
.F.merge._3.array.exit.0:
  addi t1, sp, 2032
  addi t4, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t3, 0
  j .F.merge._4.array.cond.1                                            # ir inst 16 fin
.F.merge._4.array.cond.1:
  li t2, 500
  slt s11, t3, t2                                                       # ir inst 18 fin
  bnez s11, .F.merge._5.array.body.1
  j .F.merge._6.array.exit.1                                            # ir inst 19 fin
.F.merge._5.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 20 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 21 fin
  addi s11, t3, 1                                                       # ir inst 22 fin
# Phi connections
  mv t3, s11
  j .F.merge._4.array.cond.1                                            # ir inst 23 fin
.F.merge._6.array.exit.1:
# Phi connections
  li t4, 0
  j .F.merge._7.while.cond.0                                            # ir inst 24 fin
.F.merge._7.while.cond.0:
  slt t3, t4, t5                                                        # ir inst 26 fin
  bnez t3, .F.merge._8.while.body.0
  j .F.merge._9.while.exit.0                                            # ir inst 27 fin
.F.merge._8.while.body.0:
  mv t3, t4                                                             # ir inst 28 fin
  slli t2, t3, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 29 fin
  add t3, a1, t4                                                        # ir inst 30 fin
  mv s10, t3                                                            # ir inst 31 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 32 fin
  lw s10, 0(t3)                                                         # ir inst 33 fin
  sw s10, 0(s11)                                                        # ir inst 34 fin
  addi t3, t4, 1                                                        # ir inst 35 fin
# Phi connections
  mv t4, t3
  j .F.merge._7.while.cond.0                                            # ir inst 36 fin
.F.merge._9.while.exit.0:
# Phi connections
  li t4, 0
  j .F.merge._10.while.cond.1                                           # ir inst 37 fin
.F.merge._10.while.cond.1:
  slt t3, t4, t6                                                        # ir inst 39 fin
  bnez t3, .F.merge._11.while.body.1
  j .F.merge._12.while.exit.1                                           # ir inst 40 fin
.F.merge._11.while.body.1:
  mv t3, t4                                                             # ir inst 41 fin
  slli t2, t3, 2
  addi t1, sp, 2032
  add s11, t1, t2                                                       # ir inst 42 fin
  addi t3, a2, 1                                                        # ir inst 43 fin
  add s10, t3, t4                                                       # ir inst 44 fin
  mv t3, s10                                                            # ir inst 45 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 46 fin
  lw t3, 0(s10)                                                         # ir inst 47 fin
  sw t3, 0(s11)                                                         # ir inst 48 fin
  addi t3, t4, 1                                                        # ir inst 49 fin
# Phi connections
  mv t4, t3
  j .F.merge._10.while.cond.1                                           # ir inst 50 fin
.F.merge._12.while.exit.1:
# Phi connections
  li s11, 0
  li t3, 0
  mv t4, a1
  j .F.merge._13.while.cond.2                                           # ir inst 51 fin
.F.merge._13.while.cond.2:
  slt s10, s11, t5                                                      # ir inst 55 fin
  bnez s10, .F.merge._14.lazy.then.0
  j .F.merge._15.lazy.else.0                                            # ir inst 56 fin
.F.merge._14.lazy.then.0:
  slt s10, t3, t6                                                       # ir inst 57 fin
# Phi connections
  j .F.merge._16.lazy.exit.0                                            # ir inst 58 fin
.F.merge._15.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.merge._16.lazy.exit.0                                            # ir inst 59 fin
.F.merge._16.lazy.exit.0:
  bnez s10, .F.merge._17.while.body.2
  j .F.merge._21.while.exit.2                                           # ir inst 61 fin
.F.merge._17.while.body.2:
  mv s10, s11                                                           # ir inst 62 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 63 fin
  lw s10, 0(s9)                                                         # ir inst 64 fin
  mv s9, t3                                                             # ir inst 65 fin
  slli t2, s9, 2
  addi t1, sp, 2032
  add s8, t1, t2                                                        # ir inst 66 fin
  lw s9, 0(s8)                                                          # ir inst 67 fin
  slt t0, s9, s10
  xori s8, t0, 1                                                        # ir inst 68 fin
  bnez s8, .F.merge._18.if.then.0
  j .F.merge._19.if.else.0                                              # ir inst 69 fin
.F.merge._18.if.then.0:
  mv s10, t4                                                            # ir inst 70 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 71 fin
  mv s10, s11                                                           # ir inst 72 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s8, t1, t2                                                        # ir inst 73 fin
  lw s10, 0(s8)                                                         # ir inst 74 fin
  sw s10, 0(s9)                                                         # ir inst 75 fin
  addi s10, s11, 1                                                      # ir inst 76 fin
# Phi connections
  mv s9, s10
  mv s10, t3
  j .F.merge._20.if.exit.0                                              # ir inst 77 fin
.F.merge._19.if.else.0:
  mv s10, t4                                                            # ir inst 78 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 79 fin
  mv s10, t3                                                            # ir inst 80 fin
  slli t2, s10, 2
  addi t1, sp, 2032
  add s8, t1, t2                                                        # ir inst 81 fin
  lw s10, 0(s8)                                                         # ir inst 82 fin
  sw s10, 0(s9)                                                         # ir inst 83 fin
  addi s10, t3, 1                                                       # ir inst 84 fin
# Phi connections
  mv s9, s11
  j .F.merge._20.if.exit.0                                              # ir inst 85 fin
.F.merge._20.if.exit.0:
  addi s8, t4, 1                                                        # ir inst 88 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  mv t4, s8
  j .F.merge._13.while.cond.2                                           # ir inst 89 fin
.F.merge._21.while.exit.2:
# Phi connections
  j .F.merge._22.while.cond.3                                           # ir inst 90 fin
.F.merge._22.while.cond.3:
  slt s10, s11, t5                                                      # ir inst 93 fin
  bnez s10, .F.merge._23.while.body.3
  j .F.merge._24.while.exit.3                                           # ir inst 94 fin
.F.merge._23.while.body.3:
  mv s10, t4                                                            # ir inst 95 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 96 fin
  mv s10, s11                                                           # ir inst 97 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s8, t1, t2                                                        # ir inst 98 fin
  lw s10, 0(s8)                                                         # ir inst 99 fin
  sw s10, 0(s9)                                                         # ir inst 100 fin
  addi s10, s11, 1                                                      # ir inst 101 fin
  addi s11, t4, 1                                                       # ir inst 102 fin
# Phi connections
  mv t4, s11
  mv s11, s10
  j .F.merge._22.while.cond.3                                           # ir inst 103 fin
.F.merge._24.while.exit.3:
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F.merge._25.while.cond.4                                           # ir inst 104 fin
.F.merge._25.while.cond.4:
  slt t3, t4, t6                                                        # ir inst 107 fin
  bnez t3, .F.merge._26.while.body.4
  j .F.merge._27.while.exit.4                                           # ir inst 108 fin
.F.merge._26.while.body.4:
  mv t3, t5                                                             # ir inst 109 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 110 fin
  mv t3, t4                                                             # ir inst 111 fin
  slli t2, t3, 2
  addi t1, sp, 2032
  add s10, t1, t2                                                       # ir inst 112 fin
  lw t3, 0(s10)                                                         # ir inst 113 fin
  sw t3, 0(s11)                                                         # ir inst 114 fin
  addi t3, t4, 1                                                        # ir inst 115 fin
  addi t4, t5, 1                                                        # ir inst 116 fin
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F.merge._25.while.cond.4                                           # ir inst 117 fin
.F.merge._27.while.exit.4:
  j .F.merge.epilogue                                                   # ir inst 118 fin
.F.merge.epilogue:
  ld s9, 0(sp)
  ld s8, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  li t0, 4032
  add sp, sp, t0
  ret

.globl .F.selectionSort
.F.selectionSort:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.selectionSort._0.entry.0:
# Phi connections
  li t6, 0
  j .F.selectionSort._1.while.cond.0                                    # ir inst 1 fin
.F.selectionSort._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.selectionSort._2.while.body.0
  j .F.selectionSort._12.while.exit.0                                   # ir inst 5 fin
.F.selectionSort._2.while.body.0:
  addi t5, t6, 1                                                        # ir inst 6 fin
# Phi connections
  mv t4, t6
  j .F.selectionSort._3.while.cond.1                                    # ir inst 7 fin
.F.selectionSort._3.while.cond.1:
  slt t3, t5, a1                                                        # ir inst 10 fin
  bnez t3, .F.selectionSort._4.while.body.1
  j .F.selectionSort._8.while.exit.1                                    # ir inst 11 fin
.F.selectionSort._4.while.body.1:
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  mv s11, t4                                                            # ir inst 15 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 16 fin
  lw s11, 0(s10)                                                        # ir inst 17 fin
  slt s10, t3, s11                                                      # ir inst 18 fin
  bnez s10, .F.selectionSort._5.if.then.0
  j .F.selectionSort._6.if.else.0                                       # ir inst 19 fin
.F.selectionSort._5.if.then.0:
# Phi connections
  mv t3, t5
  j .F.selectionSort._7.if.exit.0                                       # ir inst 20 fin
.F.selectionSort._6.if.else.0:
# Phi connections
  mv t3, t4
  j .F.selectionSort._7.if.exit.0                                       # ir inst 21 fin
.F.selectionSort._7.if.exit.0:
  addi s11, t5, 1                                                       # ir inst 23 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.selectionSort._3.while.cond.1                                    # ir inst 24 fin
.F.selectionSort._8.while.exit.1:
  xor t0, t4, t6
  sltu t5, zero, t0                                                     # ir inst 25 fin
  bnez t5, .F.selectionSort._9.if.then.1
  j .F.selectionSort._10.if.else.1                                      # ir inst 26 fin
.F.selectionSort._9.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a2, t4
  mv a1, t6
  call .F.swapElements
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 27 fin
  j .F.selectionSort._11.if.exit.1                                      # ir inst 28 fin
.F.selectionSort._10.if.else.1:
  j .F.selectionSort._11.if.exit.1                                      # ir inst 29 fin
.F.selectionSort._11.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t5
  j .F.selectionSort._1.while.cond.0                                    # ir inst 31 fin
.F.selectionSort._12.while.exit.0:
  j .F.selectionSort.epilogue                                           # ir inst 32 fin
.F.selectionSort.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.validateSortedArray
.F.validateSortedArray:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
.F.validateSortedArray._0.entry.0:
# Phi connections
  li t6, 0
  j .F.validateSortedArray._1.while.cond.0                              # ir inst 1 fin
.F.validateSortedArray._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.validateSortedArray._2.while.body.0
  j .F.validateSortedArray._10.critical_edge.0                          # ir inst 5 fin
.F.validateSortedArray._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  lw t5, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
  mv t3, t4                                                             # ir inst 10 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  lw t3, 0(t4)                                                          # ir inst 12 fin
  slt t4, t3, t5                                                        # ir inst 13 fin
  bnez t4, .F.validateSortedArray._3.if.then.0
  j .F.validateSortedArray._4.if.else.0                                 # ir inst 14 fin
.F.validateSortedArray._3.if.then.0:
# Phi connections
  li t6, 0
  j .F.validateSortedArray._6.while.exit.0                              # ir inst 15 fin
.F.validateSortedArray._4.if.else.0:
  j .F.validateSortedArray._5.if.exit.0                                 # ir inst 16 fin
.F.validateSortedArray._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.validateSortedArray._1.while.cond.0                              # ir inst 18 fin
.F.validateSortedArray._6.while.exit.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 20 fin
  bnez t5, .F.validateSortedArray._7.if.then.1
  j .F.validateSortedArray._8.if.else.1                                 # ir inst 21 fin
.F.validateSortedArray._7.if.then.1:
# Start call preparation
  li a0, 2000
  call printlnInt
# ir inst 22 fin
  j .F.validateSortedArray._9.if.exit.1                                 # ir inst 23 fin
.F.validateSortedArray._8.if.else.1:
# Start call preparation
  li a0, 2001
  call printlnInt
# ir inst 24 fin
  j .F.validateSortedArray._9.if.exit.1                                 # ir inst 25 fin
.F.validateSortedArray._9.if.exit.1:
  j .F.validateSortedArray.epilogue                                     # ir inst 26 fin
.F.validateSortedArray._10.critical_edge.0:
# Phi connections
  li t6, 1
  j .F.validateSortedArray._6.while.exit.0                              # ir inst 27 fin
.F.validateSortedArray.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performMatrixOperations
.F.performMatrixOperations:
# spill func args num: 0,             range:     6416(sp) -     6416(sp)
# local var size: 6400,               range:       16(sp) -     6416(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6416
  add sp, sp, t0
  sd ra, 8(sp)
.F.performMatrixOperations._0.entry.0:
# Start call preparation
  li a0, 2002
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performMatrixOperations._1.array.cond.0                          # ir inst 4 fin
.F.performMatrixOperations._1.array.cond.0:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performMatrixOperations._2.array.body.0
  j .F.performMatrixOperations._3.array.exit.0                          # ir inst 7 fin
.F.performMatrixOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixOperations._1.array.cond.0                          # ir inst 11 fin
.F.performMatrixOperations._3.array.exit.0:
  addi t1, sp, 1616
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performMatrixOperations._4.array.cond.1                          # ir inst 14 fin
.F.performMatrixOperations._4.array.cond.1:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performMatrixOperations._5.array.body.1
  j .F.performMatrixOperations._6.array.exit.1                          # ir inst 17 fin
.F.performMatrixOperations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixOperations._4.array.cond.1                          # ir inst 21 fin
.F.performMatrixOperations._6.array.exit.1:
  li t1, 3216
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performMatrixOperations._7.array.cond.2                          # ir inst 24 fin
.F.performMatrixOperations._7.array.cond.2:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performMatrixOperations._8.array.body.2
  j .F.performMatrixOperations._9.array.exit.2                          # ir inst 27 fin
.F.performMatrixOperations._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixOperations._7.array.cond.2                          # ir inst 31 fin
.F.performMatrixOperations._9.array.exit.2:
# Start call preparation
  li a1, 20
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeMatrix
# ir inst 32 fin
# Start call preparation
  li a1, 20
  addi t1, sp, 1616
  mv a0, t1
  call .F.initializeMatrix
# ir inst 33 fin
# Start call preparation
  li a3, 20
  li t1, 3216
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 1616
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.matrixMultiply
# ir inst 34 fin
  li t1, 4816
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 36 fin
# Phi connections
  li t5, 0
  j .F.performMatrixOperations._10.array.cond.3                         # ir inst 37 fin
.F.performMatrixOperations._10.array.cond.3:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 39 fin
  bnez t4, .F.performMatrixOperations._11.array.body.3
  j .F.performMatrixOperations._12.array.exit.3                         # ir inst 40 fin
.F.performMatrixOperations._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 41 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 42 fin
  addi t4, t5, 1                                                        # ir inst 43 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixOperations._10.array.cond.3                         # ir inst 44 fin
.F.performMatrixOperations._12.array.exit.3:
# Start call preparation
  li a2, 20
  li t1, 4816
  add t1, sp, t1
  mv a1, t1
  li t1, 3216
  add t1, sp, t1
  mv a0, t1
  call .F.matrixTranspose
# ir inst 45 fin
# Start call preparation
  li a1, 10
  li t1, 3216
  add t1, sp, t1
  mv a0, t1
  call .F.calculateDeterminant
  mv t6, a0
# ir inst 46 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 47 fin
# Start call preparation
  li a0, 2003
  call printlnInt
# ir inst 48 fin
  j .F.performMatrixOperations.epilogue                                 # ir inst 49 fin
.F.performMatrixOperations.epilogue:
  ld ra, 8(sp)
  li t0, 6416
  add sp, sp, t0
  ret

.globl .F.initializeMatrix
.F.initializeMatrix:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeMatrix._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrix._1.while.cond.0                                 # ir inst 1 fin
.F.initializeMatrix._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.initializeMatrix._2.while.body.0
  j .F.initializeMatrix._6.while.exit.0                                 # ir inst 4 fin
.F.initializeMatrix._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeMatrix._3.while.cond.1                                 # ir inst 5 fin
.F.initializeMatrix._3.while.cond.1:
  slt t4, t5, a1                                                        # ir inst 7 fin
  bnez t4, .F.initializeMatrix._4.while.body.1
  j .F.initializeMatrix._5.while.exit.1                                 # ir inst 8 fin
.F.initializeMatrix._4.while.body.1:
  mul t4, t6, a1                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  addi t4, t6, 1                                                        # ir inst 13 fin
  addi s11, t5, 1                                                       # ir inst 14 fin
  mul s10, t4, s11                                                      # ir inst 15 fin
  li t2, 50
  rem t4, s10, t2                                                       # ir inst 16 fin
  sw t4, 0(t3)                                                          # ir inst 17 fin
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.initializeMatrix._3.while.cond.1                                 # ir inst 19 fin
.F.initializeMatrix._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrix._1.while.cond.0                                 # ir inst 21 fin
.F.initializeMatrix._6.while.exit.0:
  j .F.initializeMatrix.epilogue                                        # ir inst 22 fin
.F.initializeMatrix.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.matrixMultiply
.F.matrixMultiply:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s11, 8(sp)
  sd s8, 16(sp)
  sd s10, 24(sp)
.F.matrixMultiply._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixMultiply._1.while.cond.0                                   # ir inst 1 fin
.F.matrixMultiply._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.matrixMultiply._2.while.body.0
  j .F.matrixMultiply._9.while.exit.0                                   # ir inst 4 fin
.F.matrixMultiply._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrixMultiply._3.while.cond.1                                   # ir inst 5 fin
.F.matrixMultiply._3.while.cond.1:
  slt t4, t5, a3                                                        # ir inst 7 fin
  bnez t4, .F.matrixMultiply._4.while.body.1
  j .F.matrixMultiply._8.while.exit.1                                   # ir inst 8 fin
.F.matrixMultiply._4.while.body.1:
  mul t4, t6, a3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  li t4, 0
  j .F.matrixMultiply._5.while.cond.2                                   # ir inst 14 fin
.F.matrixMultiply._5.while.cond.2:
  slt t3, t4, a3                                                        # ir inst 16 fin
  bnez t3, .F.matrixMultiply._6.while.body.2
  j .F.matrixMultiply._7.while.exit.2                                   # ir inst 17 fin
.F.matrixMultiply._6.while.body.2:
  mul t3, t6, a3                                                        # ir inst 18 fin
  add s11, t3, t5                                                       # ir inst 19 fin
  mv t3, s11                                                            # ir inst 20 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 21 fin
  lw t3, 0(s11)                                                         # ir inst 22 fin
  mul s10, t6, a3                                                       # ir inst 23 fin
  add s9, s10, t4                                                       # ir inst 24 fin
  mv s10, s9                                                            # ir inst 25 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 26 fin
  lw s10, 0(s9)                                                         # ir inst 27 fin
  mul s9, t4, a3                                                        # ir inst 28 fin
  add s8, s9, t5                                                        # ir inst 29 fin
  mv s9, s8                                                             # ir inst 30 fin
  slli t2, s9, 2
  add s8, a1, t2                                                        # ir inst 31 fin
  lw s9, 0(s8)                                                          # ir inst 32 fin
  mul s8, s10, s9                                                       # ir inst 33 fin
  add s10, t3, s8                                                       # ir inst 34 fin
  sw s10, 0(s11)                                                        # ir inst 35 fin
  addi t3, t4, 1                                                        # ir inst 36 fin
# Phi connections
  mv t4, t3
  j .F.matrixMultiply._5.while.cond.2                                   # ir inst 37 fin
.F.matrixMultiply._7.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t4
  j .F.matrixMultiply._3.while.cond.1                                   # ir inst 39 fin
.F.matrixMultiply._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t6, t5
  j .F.matrixMultiply._1.while.cond.0                                   # ir inst 41 fin
.F.matrixMultiply._9.while.exit.0:
  j .F.matrixMultiply.epilogue                                          # ir inst 42 fin
.F.matrixMultiply.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s8, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.matrixTranspose
.F.matrixTranspose:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.matrixTranspose._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixTranspose._1.while.cond.0                                  # ir inst 1 fin
.F.matrixTranspose._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.matrixTranspose._2.while.body.0
  j .F.matrixTranspose._6.while.exit.0                                  # ir inst 4 fin
.F.matrixTranspose._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrixTranspose._3.while.cond.1                                  # ir inst 5 fin
.F.matrixTranspose._3.while.cond.1:
  slt t4, t5, a2                                                        # ir inst 7 fin
  bnez t4, .F.matrixTranspose._4.while.body.1
  j .F.matrixTranspose._5.while.exit.1                                  # ir inst 8 fin
.F.matrixTranspose._4.while.body.1:
  mul t4, t5, a2                                                        # ir inst 9 fin
  add t3, t4, t6                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  mul t4, t6, a2                                                        # ir inst 13 fin
  add s11, t4, t5                                                       # ir inst 14 fin
  mv t4, s11                                                            # ir inst 15 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 16 fin
  lw t4, 0(s11)                                                         # ir inst 17 fin
  sw t4, 0(t3)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.matrixTranspose._3.while.cond.1                                  # ir inst 20 fin
.F.matrixTranspose._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.matrixTranspose._1.while.cond.0                                  # ir inst 22 fin
.F.matrixTranspose._6.while.exit.0:
  j .F.matrixTranspose.epilogue                                         # ir inst 23 fin
.F.matrixTranspose.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateDeterminant
.F.calculateDeterminant:
# spill func args num: 0,             range:      400(sp) -      400(sp)
# local var size: 324,                range:       72(sp) -      396(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 2 / 12,        range:       48(sp) -       64(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -400
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.calculateDeterminant._0.entry.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.calculateDeterminant._1.if.then.0
  j .F.calculateDeterminant._2.if.else.0                                # ir inst 2 fin
.F.calculateDeterminant._1.if.then.0:
  addi t6, a0, 0                                                        # ir inst 3 fin
  lw t5, 0(t6)                                                          # ir inst 4 fin
  mv a0, t5
  j .F.calculateDeterminant.epilogue                                    # ir inst 5 fin
.F.calculateDeterminant._2.if.else.0:
  j .F.calculateDeterminant._3.if.exit.0                                # ir inst 6 fin
.F.calculateDeterminant._3.if.exit.0:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 7 fin
  bnez t6, .F.calculateDeterminant._4.if.then.1
  j .F.calculateDeterminant._5.if.else.1                                # ir inst 8 fin
.F.calculateDeterminant._4.if.then.1:
  addi t6, a0, 0                                                        # ir inst 9 fin
  lw t5, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 12                                                       # ir inst 11 fin
  lw t4, 0(t6)                                                          # ir inst 12 fin
  mul t6, t5, t4                                                        # ir inst 13 fin
  addi t5, a0, 4                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  addi t5, a0, 8                                                        # ir inst 16 fin
  lw t3, 0(t5)                                                          # ir inst 17 fin
  mul t5, t4, t3                                                        # ir inst 18 fin
  sub t4, t6, t5                                                        # ir inst 19 fin
  mv a0, t4
  j .F.calculateDeterminant.epilogue                                    # ir inst 20 fin
.F.calculateDeterminant._5.if.else.1:
  j .F.calculateDeterminant._6.if.exit.1                                # ir inst 21 fin
.F.calculateDeterminant._6.if.exit.1:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 0
  j .F.calculateDeterminant._7.while.cond.0                             # ir inst 22 fin
.F.calculateDeterminant._7.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 26 fin
  bnez t3, .F.calculateDeterminant._8.while.body.0
  j .F.calculateDeterminant._12.while.exit.0                            # ir inst 27 fin
.F.calculateDeterminant._8.while.body.0:
  addi t1, sp, 72
  addi t3, t1, 0                                                        # ir inst 29 fin
# Phi connections
  li s11, 0
  j .F.calculateDeterminant._9.array.cond.0                             # ir inst 30 fin
.F.calculateDeterminant._9.array.cond.0:
  li t2, 81
  slt s10, s11, t2                                                      # ir inst 32 fin
  bnez s10, .F.calculateDeterminant._10.array.body.0
  j .F.calculateDeterminant._11.array.exit.0                            # ir inst 33 fin
.F.calculateDeterminant._10.array.body.0:
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 34 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 35 fin
  addi s10, s11, 1                                                      # ir inst 36 fin
# Phi connections
  mv s11, s10
  j .F.calculateDeterminant._9.array.cond.0                             # ir inst 37 fin
.F.calculateDeterminant._11.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a4, t6
  li a3, 0
  mv a2, a1
  addi t1, sp, 72
  mv a1, t1
  call .F.createMinorMatrix
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 38 fin
  mv t3, t6                                                             # ir inst 39 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 40 fin
  lw t3, 0(s11)                                                         # ir inst 41 fin
  mul s11, t5, t3                                                       # ir inst 42 fin
  addi t3, a1, -1                                                       # ir inst 43 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t3
  addi t1, sp, 72
  mv a0, t1
  call .F.calculateDeterminantSmall
  mv s10, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 44 fin
  mul t3, s11, s10                                                      # ir inst 45 fin
  add s11, t4, t3                                                       # ir inst 46 fin
  li t1, 0
  sub t3, t1, t5                                                        # ir inst 47 fin
  addi t5, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t4, s11
  mv t6, t5
  mv t5, t3
  j .F.calculateDeterminant._7.while.cond.0                             # ir inst 49 fin
.F.calculateDeterminant._12.while.exit.0:
  mv a0, t4
  j .F.calculateDeterminant.epilogue                                    # ir inst 50 fin
.F.calculateDeterminant.epilogue:
  ld ra, 64(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 400
  ret

.globl .F.createMinorMatrix
.F.createMinorMatrix:
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
.F.createMinorMatrix._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.createMinorMatrix._1.while.cond.0                                # ir inst 1 fin
.F.createMinorMatrix._1.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 4 fin
  bnez t4, .F.createMinorMatrix._2.while.body.0
  j .F.createMinorMatrix._12.while.exit.0                               # ir inst 5 fin
.F.createMinorMatrix._2.while.body.0:
  xor t0, t6, a3
  sltu t4, zero, t0                                                     # ir inst 6 fin
  bnez t4, .F.createMinorMatrix._3.if.then.0
  j .F.createMinorMatrix._10.if.else.0                                  # ir inst 7 fin
.F.createMinorMatrix._3.if.then.0:
# Phi connections
  li t3, 0
  li t4, 0
  j .F.createMinorMatrix._4.while.cond.1                                # ir inst 8 fin
.F.createMinorMatrix._4.while.cond.1:
  slt s11, t4, a2                                                       # ir inst 11 fin
  bnez s11, .F.createMinorMatrix._5.while.body.1
  j .F.createMinorMatrix._9.while.exit.1                                # ir inst 12 fin
.F.createMinorMatrix._5.while.body.1:
  xor t0, t4, a4
  sltu s11, zero, t0                                                    # ir inst 13 fin
  bnez s11, .F.createMinorMatrix._6.if.then.1
  j .F.createMinorMatrix._7.if.else.1                                   # ir inst 14 fin
.F.createMinorMatrix._6.if.then.1:
  addi s11, a2, -1                                                      # ir inst 15 fin
  mul s10, t5, s11                                                      # ir inst 16 fin
  add s11, s10, t3                                                      # ir inst 17 fin
  mv s10, s11                                                           # ir inst 18 fin
  slli t2, s10, 2
  add s11, a1, t2                                                       # ir inst 19 fin
  mul s10, t6, a2                                                       # ir inst 20 fin
  add s9, s10, t4                                                       # ir inst 21 fin
  mv s10, s9                                                            # ir inst 22 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 23 fin
  lw s10, 0(s9)                                                         # ir inst 24 fin
  sw s10, 0(s11)                                                        # ir inst 25 fin
  addi s11, t3, 1                                                       # ir inst 26 fin
# Phi connections
  mv t3, s11
  j .F.createMinorMatrix._8.if.exit.1                                   # ir inst 27 fin
.F.createMinorMatrix._7.if.else.1:
# Phi connections
  j .F.createMinorMatrix._8.if.exit.1                                   # ir inst 28 fin
.F.createMinorMatrix._8.if.exit.1:
  addi s11, t4, 1                                                       # ir inst 30 fin
# Phi connections
  mv t4, s11
  j .F.createMinorMatrix._4.while.cond.1                                # ir inst 31 fin
.F.createMinorMatrix._9.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  j .F.createMinorMatrix._11.if.exit.0                                  # ir inst 33 fin
.F.createMinorMatrix._10.if.else.0:
# Phi connections
  j .F.createMinorMatrix._11.if.exit.0                                  # ir inst 34 fin
.F.createMinorMatrix._11.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t4
  j .F.createMinorMatrix._1.while.cond.0                                # ir inst 37 fin
.F.createMinorMatrix._12.while.exit.0:
  j .F.createMinorMatrix.epilogue                                       # ir inst 38 fin
.F.createMinorMatrix.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.calculateDeterminantSmall
.F.calculateDeterminantSmall:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateDeterminantSmall._0.entry.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.calculateDeterminantSmall._1.if.then.0
  j .F.calculateDeterminantSmall._2.if.else.0                           # ir inst 2 fin
.F.calculateDeterminantSmall._1.if.then.0:
  addi t6, a0, 0                                                        # ir inst 3 fin
  lw t5, 0(t6)                                                          # ir inst 4 fin
  mv a0, t5
  j .F.calculateDeterminantSmall.epilogue                               # ir inst 5 fin
.F.calculateDeterminantSmall._2.if.else.0:
  j .F.calculateDeterminantSmall._3.if.exit.0                           # ir inst 6 fin
.F.calculateDeterminantSmall._3.if.exit.0:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 7 fin
  bnez t6, .F.calculateDeterminantSmall._4.if.then.1
  j .F.calculateDeterminantSmall._5.if.else.1                           # ir inst 8 fin
.F.calculateDeterminantSmall._4.if.then.1:
  addi t6, a0, 0                                                        # ir inst 9 fin
  lw t5, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 12                                                       # ir inst 11 fin
  lw t4, 0(t6)                                                          # ir inst 12 fin
  mul t6, t5, t4                                                        # ir inst 13 fin
  addi t5, a0, 4                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  addi t5, a0, 8                                                        # ir inst 16 fin
  lw t3, 0(t5)                                                          # ir inst 17 fin
  mul t5, t4, t3                                                        # ir inst 18 fin
  sub t4, t6, t5                                                        # ir inst 19 fin
  mv a0, t4
  j .F.calculateDeterminantSmall.epilogue                               # ir inst 20 fin
.F.calculateDeterminantSmall._5.if.else.1:
  j .F.calculateDeterminantSmall._6.if.exit.1                           # ir inst 21 fin
.F.calculateDeterminantSmall._6.if.exit.1:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateDeterminantSmall._7.while.cond.0                        # ir inst 22 fin
.F.calculateDeterminantSmall._7.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 25 fin
  bnez t4, .F.calculateDeterminantSmall._8.while.body.0
  j .F.calculateDeterminantSmall._9.while.exit.0                        # ir inst 26 fin
.F.calculateDeterminantSmall._8.while.body.0:
  mul t4, t6, a1                                                        # ir inst 27 fin
  add t3, t4, t6                                                        # ir inst 28 fin
  mv t4, t3                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 30 fin
  lw t4, 0(t3)                                                          # ir inst 31 fin
  add t3, t5, t4                                                        # ir inst 32 fin
  addi t4, t6, 1                                                        # ir inst 33 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateDeterminantSmall._7.while.cond.0                        # ir inst 34 fin
.F.calculateDeterminantSmall._9.while.exit.0:
  mv a0, t5
  j .F.calculateDeterminantSmall.epilogue                               # ir inst 35 fin
.F.calculateDeterminantSmall.epilogue:
  ret

.globl .F.performRecursiveOperations
.F.performRecursiveOperations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performRecursiveOperations._0.entry.0:
# Start call preparation
  li a0, 3001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 30
  call .F.fibonacciIterative
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 10
  call .F.factorialIterative
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a1, 5
  li a0, 3
  call .F.ackermannLimited
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 10
  call .F.simulateTreeTraversal
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 3002
  call printlnInt
# ir inst 10 fin
  j .F.performRecursiveOperations.epilogue                              # ir inst 11 fin
.F.performRecursiveOperations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.fibonacciIterative
.F.fibonacciIterative:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.fibonacciIterative._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.fibonacciIterative._1.if.then.0
  j .F.fibonacciIterative._2.if.else.0                                  # ir inst 2 fin
.F.fibonacciIterative._1.if.then.0:
  j .F.fibonacciIterative.epilogue                                      # ir inst 3 fin
.F.fibonacciIterative._2.if.else.0:
  j .F.fibonacciIterative._3.if.exit.0                                  # ir inst 4 fin
.F.fibonacciIterative._3.if.exit.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 2
  j .F.fibonacciIterative._4.while.cond.0                               # ir inst 5 fin
.F.fibonacciIterative._4.while.cond.0:
  slt t0, a0, t6
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.fibonacciIterative._5.while.body.0
  j .F.fibonacciIterative._6.while.exit.0                               # ir inst 10 fin
.F.fibonacciIterative._5.while.body.0:
  add t3, t4, t5                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t4
  mv t4, t5
  mv t5, t3
  j .F.fibonacciIterative._4.while.cond.0                               # ir inst 13 fin
.F.fibonacciIterative._6.while.exit.0:
  mv a0, t5
  j .F.fibonacciIterative.epilogue                                      # ir inst 14 fin
.F.fibonacciIterative.epilogue:
  ret

.globl .F.factorialIterative
.F.factorialIterative:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.factorialIterative._0.entry.0:
# Phi connections
  li t5, 1
  li t6, 2
  j .F.factorialIterative._1.while.cond.0                               # ir inst 1 fin
.F.factorialIterative._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.factorialIterative._2.while.body.0
  j .F.factorialIterative._3.while.exit.0                               # ir inst 5 fin
.F.factorialIterative._2.while.body.0:
  mul t4, t5, t6                                                        # ir inst 6 fin
  addi t3, t6, 1                                                        # ir inst 7 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.factorialIterative._1.while.cond.0                               # ir inst 8 fin
.F.factorialIterative._3.while.exit.0:
  mv a0, t5
  j .F.factorialIterative.epilogue                                      # ir inst 9 fin
.F.factorialIterative.epilogue:
  ret

.globl .F.ackermannLimited
.F.ackermannLimited:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.ackermannLimited._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.ackermannLimited._1.if.then.0
  j .F.ackermannLimited._2.if.else.0                                    # ir inst 2 fin
.F.ackermannLimited._1.if.then.0:
  addi t6, a1, 1                                                        # ir inst 3 fin
  mv a0, t6
  j .F.ackermannLimited.epilogue                                        # ir inst 4 fin
.F.ackermannLimited._2.if.else.0:
  j .F.ackermannLimited._3.if.exit.0                                    # ir inst 5 fin
.F.ackermannLimited._3.if.exit.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 6 fin
  bnez t6, .F.ackermannLimited._4.if.then.1
  j .F.ackermannLimited._5.if.else.1                                    # ir inst 7 fin
.F.ackermannLimited._4.if.then.1:
  addi t6, a1, 2                                                        # ir inst 8 fin
  mv a0, t6
  j .F.ackermannLimited.epilogue                                        # ir inst 9 fin
.F.ackermannLimited._5.if.else.1:
  j .F.ackermannLimited._6.if.exit.1                                    # ir inst 10 fin
.F.ackermannLimited._6.if.exit.1:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 11 fin
  bnez t6, .F.ackermannLimited._7.if.then.2
  j .F.ackermannLimited._8.if.else.2                                    # ir inst 12 fin
.F.ackermannLimited._7.if.then.2:
  slli t6, a1, 1                                                        # ir inst 13 fin
  addi t5, t6, 3                                                        # ir inst 14 fin
  mv a0, t5
  j .F.ackermannLimited.epilogue                                        # ir inst 15 fin
.F.ackermannLimited._8.if.else.2:
  j .F.ackermannLimited._9.if.exit.2                                    # ir inst 16 fin
.F.ackermannLimited._9.if.exit.2:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 17 fin
  bnez t6, .F.ackermannLimited._10.if.then.3
  j .F.ackermannLimited._11.if.else.3                                   # ir inst 18 fin
.F.ackermannLimited._10.if.then.3:
  addi t6, a1, 1                                                        # ir inst 19 fin
  slli t5, t6, 3                                                        # ir inst 20 fin
  addi t6, t5, -3                                                       # ir inst 21 fin
  mv a0, t6
  j .F.ackermannLimited.epilogue                                        # ir inst 22 fin
.F.ackermannLimited._11.if.else.3:
  j .F.ackermannLimited._12.if.exit.3                                   # ir inst 23 fin
.F.ackermannLimited._12.if.exit.3:
  mul t6, a0, a1                                                        # ir inst 24 fin
  addi t5, t6, 42                                                       # ir inst 25 fin
  mv a0, t5
  j .F.ackermannLimited.epilogue                                        # ir inst 26 fin
.F.ackermannLimited.epilogue:
  ret

.globl .F.simulateTreeTraversal
.F.simulateTreeTraversal:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.simulateTreeTraversal._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.simulateTreeTraversal._1.if.then.0
  j .F.simulateTreeTraversal._2.if.else.0                               # ir inst 2 fin
.F.simulateTreeTraversal._1.if.then.0:
  li a0, 1
  j .F.simulateTreeTraversal.epilogue                                   # ir inst 3 fin
.F.simulateTreeTraversal._2.if.else.0:
  j .F.simulateTreeTraversal._3.if.exit.0                               # ir inst 4 fin
.F.simulateTreeTraversal._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.simulateTreeTraversal
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  addi t6, a0, -1                                                       # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.simulateTreeTraversal
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 8 fin
  add t6, t5, t4                                                        # ir inst 9 fin
  add t5, t6, a0                                                        # ir inst 10 fin
  mv a0, t5
  j .F.simulateTreeTraversal.epilogue                                   # ir inst 11 fin
.F.simulateTreeTraversal.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.performMathematicalOperations
.F.performMathematicalOperations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performMathematicalOperations._0.entry.0:
# Start call preparation
  li a0, 4001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 1000
  call .F.countPrimesUpTo
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.performGcdOperations
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.performPowerOperations
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  call .F.performSquareRootOperations
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 4002
  call printlnInt
# ir inst 10 fin
  j .F.performMathematicalOperations.epilogue                           # ir inst 11 fin
.F.performMathematicalOperations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.countPrimesUpTo
.F.countPrimesUpTo:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.countPrimesUpTo._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 2
  j .F.countPrimesUpTo._1.while.cond.0                                  # ir inst 1 fin
.F.countPrimesUpTo._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.countPrimesUpTo._2.while.body.0
  j .F.countPrimesUpTo._6.while.exit.0                                  # ir inst 5 fin
.F.countPrimesUpTo._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.isPrimeOptimized
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.countPrimesUpTo._3.if.then.0
  j .F.countPrimesUpTo._4.if.else.0                                     # ir inst 8 fin
.F.countPrimesUpTo._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.countPrimesUpTo._5.if.exit.0                                     # ir inst 10 fin
.F.countPrimesUpTo._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.countPrimesUpTo._5.if.exit.0                                     # ir inst 11 fin
.F.countPrimesUpTo._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.countPrimesUpTo._1.while.cond.0                                  # ir inst 14 fin
.F.countPrimesUpTo._6.while.exit.0:
  mv a0, t5
  j .F.countPrimesUpTo.epilogue                                         # ir inst 15 fin
.F.countPrimesUpTo.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.isPrimeOptimized
.F.isPrimeOptimized:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.isPrimeOptimized._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.isPrimeOptimized._1.if.then.0
  j .F.isPrimeOptimized._2.if.else.0                                    # ir inst 2 fin
.F.isPrimeOptimized._1.if.then.0:
  li a0, 0
  j .F.isPrimeOptimized.epilogue                                        # ir inst 3 fin
.F.isPrimeOptimized._2.if.else.0:
  j .F.isPrimeOptimized._3.if.exit.0                                    # ir inst 4 fin
.F.isPrimeOptimized._3.if.exit.0:
  li t2, 3
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 5 fin
  bnez t6, .F.isPrimeOptimized._4.if.then.1
  j .F.isPrimeOptimized._5.if.else.1                                    # ir inst 6 fin
.F.isPrimeOptimized._4.if.then.1:
  li a0, 1
  j .F.isPrimeOptimized.epilogue                                        # ir inst 7 fin
.F.isPrimeOptimized._5.if.else.1:
  j .F.isPrimeOptimized._6.if.exit.1                                    # ir inst 8 fin
.F.isPrimeOptimized._6.if.exit.1:
  li t2, 2
  rem t6, a0, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.isPrimeOptimized._7.lazy.then.0
  j .F.isPrimeOptimized._8.lazy.else.0                                  # ir inst 11 fin
.F.isPrimeOptimized._7.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.isPrimeOptimized._9.lazy.exit.0                                  # ir inst 12 fin
.F.isPrimeOptimized._8.lazy.else.0:
  li t2, 3
  rem t6, a0, t2                                                        # ir inst 13 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.isPrimeOptimized._9.lazy.exit.0                                  # ir inst 15 fin
.F.isPrimeOptimized._9.lazy.exit.0:
  bnez t6, .F.isPrimeOptimized._10.if.then.2
  j .F.isPrimeOptimized._11.if.else.2                                   # ir inst 17 fin
.F.isPrimeOptimized._10.if.then.2:
  li a0, 0
  j .F.isPrimeOptimized.epilogue                                        # ir inst 18 fin
.F.isPrimeOptimized._11.if.else.2:
  j .F.isPrimeOptimized._12.if.exit.2                                   # ir inst 19 fin
.F.isPrimeOptimized._12.if.exit.2:
# Phi connections
  li t6, 5
  j .F.isPrimeOptimized._13.while.cond.0                                # ir inst 20 fin
.F.isPrimeOptimized._13.while.cond.0:
  mul t5, t6, t6                                                        # ir inst 22 fin
  slt t0, a0, t5
  xori t4, t0, 1                                                        # ir inst 23 fin
  bnez t4, .F.isPrimeOptimized._14.while.body.0
  j .F.isPrimeOptimized._21.while.exit.0                                # ir inst 24 fin
.F.isPrimeOptimized._14.while.body.0:
  rem t5, a0, t6                                                        # ir inst 25 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 26 fin
  bnez t4, .F.isPrimeOptimized._15.lazy.then.1
  j .F.isPrimeOptimized._16.lazy.else.1                                 # ir inst 27 fin
.F.isPrimeOptimized._15.lazy.then.1:
# Phi connections
  li t5, 1
  j .F.isPrimeOptimized._17.lazy.exit.1                                 # ir inst 28 fin
.F.isPrimeOptimized._16.lazy.else.1:
  addi t5, t6, 2                                                        # ir inst 29 fin
  rem t4, a0, t5                                                        # ir inst 30 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 31 fin
# Phi connections
  j .F.isPrimeOptimized._17.lazy.exit.1                                 # ir inst 32 fin
.F.isPrimeOptimized._17.lazy.exit.1:
  bnez t5, .F.isPrimeOptimized._18.if.then.3
  j .F.isPrimeOptimized._19.if.else.3                                   # ir inst 34 fin
.F.isPrimeOptimized._18.if.then.3:
  li a0, 0
  j .F.isPrimeOptimized.epilogue                                        # ir inst 35 fin
.F.isPrimeOptimized._19.if.else.3:
  j .F.isPrimeOptimized._20.if.exit.3                                   # ir inst 36 fin
.F.isPrimeOptimized._20.if.exit.3:
  addi t5, t6, 6                                                        # ir inst 37 fin
# Phi connections
  mv t6, t5
  j .F.isPrimeOptimized._13.while.cond.0                                # ir inst 38 fin
.F.isPrimeOptimized._21.while.exit.0:
  li a0, 1
  j .F.isPrimeOptimized.epilogue                                        # ir inst 39 fin
.F.isPrimeOptimized.epilogue:
  ret

.globl .F.performGcdOperations
.F.performGcdOperations:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.performGcdOperations._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.performGcdOperations._1.while.cond.0                             # ir inst 1 fin
.F.performGcdOperations._1.while.cond.0:
  li t2, 100
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.performGcdOperations._2.while.body.0
  j .F.performGcdOperations._6.while.exit.0                             # ir inst 5 fin
.F.performGcdOperations._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 1
  j .F.performGcdOperations._3.while.cond.1                             # ir inst 6 fin
.F.performGcdOperations._3.while.cond.1:
  li t2, 100
  slt t0, t2, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.performGcdOperations._4.while.body.1
  j .F.performGcdOperations._5.while.exit.1                             # ir inst 10 fin
.F.performGcdOperations._4.while.body.1:
  li t2, 17
  mul s11, t6, t2                                                       # ir inst 11 fin
  li t2, 23
  mul s10, t4, t2                                                       # ir inst 12 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s10
  mv a0, s11
  call .F.gcdEuclidean
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 13 fin
  add s11, t3, s9                                                       # ir inst 14 fin
  addi s10, t4, 10                                                      # ir inst 15 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.performGcdOperations._3.while.cond.1                             # ir inst 16 fin
.F.performGcdOperations._5.while.exit.1:
  addi t4, t6, 10                                                       # ir inst 17 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performGcdOperations._1.while.cond.0                             # ir inst 18 fin
.F.performGcdOperations._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 19 fin
  mv a0, t6
  j .F.performGcdOperations.epilogue                                    # ir inst 20 fin
.F.performGcdOperations.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.gcdEuclidean
.F.gcdEuclidean:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.gcdEuclidean._0.entry.0:
# Phi connections
  mv t5, a0
  mv t6, a1
  j .F.gcdEuclidean._1.while.cond.0                                     # ir inst 1 fin
.F.gcdEuclidean._1.while.cond.0:
  li t2, 0
  xor t0, t6, t2
  sltu t4, zero, t0                                                     # ir inst 4 fin
  bnez t4, .F.gcdEuclidean._2.while.body.0
  j .F.gcdEuclidean._3.while.exit.0                                     # ir inst 5 fin
.F.gcdEuclidean._2.while.body.0:
  rem t4, t5, t6                                                        # ir inst 6 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.gcdEuclidean._1.while.cond.0                                     # ir inst 7 fin
.F.gcdEuclidean._3.while.exit.0:
  mv a0, t5
  j .F.gcdEuclidean.epilogue                                            # ir inst 8 fin
.F.gcdEuclidean.epilogue:
  ret

.globl .F.performPowerOperations
.F.performPowerOperations:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.performPowerOperations._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 2
  j .F.performPowerOperations._1.while.cond.0                           # ir inst 1 fin
.F.performPowerOperations._1.while.cond.0:
  li t2, 10
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.performPowerOperations._2.while.body.0
  j .F.performPowerOperations._6.while.exit.0                           # ir inst 5 fin
.F.performPowerOperations._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 1
  j .F.performPowerOperations._3.while.cond.1                           # ir inst 6 fin
.F.performPowerOperations._3.while.cond.1:
  li t2, 10
  slt t0, t2, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.performPowerOperations._4.while.body.1
  j .F.performPowerOperations._5.while.exit.1                           # ir inst 10 fin
.F.performPowerOperations._4.while.body.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 1000
  mv a1, t4
  mv a0, t6
  call .F.fastPower
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 11 fin
  add s10, t3, s11                                                      # ir inst 12 fin
  addi s11, t4, 1                                                       # ir inst 13 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.performPowerOperations._3.while.cond.1                           # ir inst 14 fin
.F.performPowerOperations._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performPowerOperations._1.while.cond.0                           # ir inst 16 fin
.F.performPowerOperations._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 17 fin
  mv a0, t6
  j .F.performPowerOperations.epilogue                                  # ir inst 18 fin
.F.performPowerOperations.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.fastPower
.F.fastPower:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.fastPower._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.fastPower._1.if.then.0
  j .F.fastPower._2.if.else.0                                           # ir inst 2 fin
.F.fastPower._1.if.then.0:
  li a0, 1
  j .F.fastPower.epilogue                                               # ir inst 3 fin
.F.fastPower._2.if.else.0:
  j .F.fastPower._3.if.exit.0                                           # ir inst 4 fin
.F.fastPower._3.if.exit.0:
# Phi connections
  li t4, 1
  mv t5, a0
  mv t6, a1
  j .F.fastPower._4.while.cond.0                                        # ir inst 5 fin
.F.fastPower._4.while.cond.0:
  li t2, 0
  slt t3, t2, t6                                                        # ir inst 9 fin
  bnez t3, .F.fastPower._5.while.body.0
  j .F.fastPower._9.while.exit.0                                        # ir inst 10 fin
.F.fastPower._5.while.body.0:
  li t2, 2
  rem t3, t6, t2                                                        # ir inst 11 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 12 fin
  bnez s11, .F.fastPower._6.if.then.1
  j .F.fastPower._7.if.else.1                                           # ir inst 13 fin
.F.fastPower._6.if.then.1:
  mul t3, t4, t5                                                        # ir inst 14 fin
  rem s11, t3, a2                                                       # ir inst 15 fin
# Phi connections
  mv t3, s11
  j .F.fastPower._8.if.exit.1                                           # ir inst 16 fin
.F.fastPower._7.if.else.1:
# Phi connections
  mv t3, t4
  j .F.fastPower._8.if.exit.1                                           # ir inst 17 fin
.F.fastPower._8.if.exit.1:
  mul s11, t5, t5                                                       # ir inst 19 fin
  rem t5, s11, a2                                                       # ir inst 20 fin
  li t2, 2
  div s11, t6, t2                                                       # ir inst 21 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.fastPower._4.while.cond.0                                        # ir inst 22 fin
.F.fastPower._9.while.exit.0:
  mv a0, t4
  j .F.fastPower.epilogue                                               # ir inst 23 fin
.F.fastPower.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performSquareRootOperations
.F.performSquareRootOperations:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.performSquareRootOperations._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.performSquareRootOperations._1.while.cond.0                      # ir inst 1 fin
.F.performSquareRootOperations._1.while.cond.0:
  li t2, 100
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.performSquareRootOperations._2.while.body.0
  j .F.performSquareRootOperations._3.while.exit.0                      # ir inst 5 fin
.F.performSquareRootOperations._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.integerSquareRoot
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  addi t4, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performSquareRootOperations._1.while.cond.0                      # ir inst 9 fin
.F.performSquareRootOperations._3.while.exit.0:
  mv a0, t5
  j .F.performSquareRootOperations.epilogue                             # ir inst 10 fin
.F.performSquareRootOperations.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.integerSquareRoot
.F.integerSquareRoot:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.integerSquareRoot._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.integerSquareRoot._1.if.then.0
  j .F.integerSquareRoot._2.if.else.0                                   # ir inst 2 fin
.F.integerSquareRoot._1.if.then.0:
  li a0, 0
  j .F.integerSquareRoot.epilogue                                       # ir inst 3 fin
.F.integerSquareRoot._2.if.else.0:
  j .F.integerSquareRoot._3.if.exit.0                                   # ir inst 4 fin
.F.integerSquareRoot._3.if.exit.0:
# Phi connections
  li t4, 1
  mv t5, a0
  li t6, 0
  j .F.integerSquareRoot._4.while.cond.0                                # ir inst 5 fin
.F.integerSquareRoot._4.while.cond.0:
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.integerSquareRoot._5.while.body.0
  j .F.integerSquareRoot._9.while.exit.0                                # ir inst 10 fin
.F.integerSquareRoot._5.while.body.0:
  sub t3, t5, t4                                                        # ir inst 11 fin
  li t2, 2
  div s11, t3, t2                                                       # ir inst 12 fin
  add t3, t4, s11                                                       # ir inst 13 fin
  div s11, a0, t3                                                       # ir inst 14 fin
  slt t0, s11, t3
  xori s10, t0, 1                                                       # ir inst 15 fin
  bnez s10, .F.integerSquareRoot._6.if.then.1
  j .F.integerSquareRoot._7.if.else.1                                   # ir inst 16 fin
.F.integerSquareRoot._6.if.then.1:
  addi s11, t3, 1                                                       # ir inst 17 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  mv t3, s11
  j .F.integerSquareRoot._8.if.exit.1                                   # ir inst 18 fin
.F.integerSquareRoot._7.if.else.1:
  addi t5, t3, -1                                                       # ir inst 19 fin
# Phi connections
  mv t3, t4
  mv t4, t5
  mv t5, t6
  j .F.integerSquareRoot._8.if.exit.1                                   # ir inst 20 fin
.F.integerSquareRoot._8.if.exit.1:
# Phi connections
  mv t6, t5
  mv t5, t4
  mv t4, t3
  j .F.integerSquareRoot._4.while.cond.0                                # ir inst 24 fin
.F.integerSquareRoot._9.while.exit.0:
  mv a0, t6
  j .F.integerSquareRoot.epilogue                                       # ir inst 25 fin
.F.integerSquareRoot.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performMemoryAccessPatterns
.F.performMemoryAccessPatterns:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performMemoryAccessPatterns._0.entry.0:
# Start call preparation
  li a0, 5001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testSequentialAccess
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.testStridedAccess
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.testRandomAccess
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  call .F.testBlockedAccess
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 5002
  call printlnInt
# ir inst 10 fin
  j .F.performMemoryAccessPatterns.epilogue                             # ir inst 11 fin
.F.performMemoryAccessPatterns.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testSequentialAccess
.F.testSequentialAccess:
# spill func args num: 0,             range:     8000(sp) -     8000(sp)
# local var size: 8000,               range:        0(sp) -     8000(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8000
  add sp, sp, t0
.F.testSequentialAccess._0.entry.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testSequentialAccess._1.array.cond.0                             # ir inst 3 fin
.F.testSequentialAccess._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testSequentialAccess._2.array.body.0
  j .F.testSequentialAccess._3.array.exit.0                             # ir inst 6 fin
.F.testSequentialAccess._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testSequentialAccess._1.array.cond.0                             # ir inst 10 fin
.F.testSequentialAccess._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.testSequentialAccess._4.while.cond.0                             # ir inst 11 fin
.F.testSequentialAccess._4.while.cond.0:
  li t2, 2000
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.testSequentialAccess._5.while.body.0
  j .F.testSequentialAccess._6.while.exit.0                             # ir inst 14 fin
.F.testSequentialAccess._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  addi t1, sp, 0
  add t4, t1, t2                                                        # ir inst 16 fin
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 17 fin
  sw t5, 0(t4)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.testSequentialAccess._4.while.cond.0                             # ir inst 20 fin
.F.testSequentialAccess._6.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testSequentialAccess._7.while.cond.1                             # ir inst 21 fin
.F.testSequentialAccess._7.while.cond.1:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 24 fin
  bnez t4, .F.testSequentialAccess._8.while.body.1
  j .F.testSequentialAccess._9.while.exit.1                             # ir inst 25 fin
.F.testSequentialAccess._8.while.body.1:
  mv t4, t6                                                             # ir inst 26 fin
  slli t2, t4, 2
  addi t1, sp, 0
  add t3, t1, t2                                                        # ir inst 27 fin
  lw t4, 0(t3)                                                          # ir inst 28 fin
  add t3, t5, t4                                                        # ir inst 29 fin
  addi t4, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testSequentialAccess._7.while.cond.1                             # ir inst 31 fin
.F.testSequentialAccess._9.while.exit.1:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 32 fin
  mv a0, t6
  j .F.testSequentialAccess.epilogue                                    # ir inst 33 fin
.F.testSequentialAccess.epilogue:
  li t0, 8000
  add sp, sp, t0
  ret

.globl .F.testStridedAccess
.F.testStridedAccess:
# spill func args num: 0,             range:     8000(sp) -     8000(sp)
# local var size: 8000,               range:        0(sp) -     8000(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8000
  add sp, sp, t0
.F.testStridedAccess._0.entry.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testStridedAccess._1.array.cond.0                                # ir inst 3 fin
.F.testStridedAccess._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testStridedAccess._2.array.body.0
  j .F.testStridedAccess._3.array.exit.0                                # ir inst 6 fin
.F.testStridedAccess._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testStridedAccess._1.array.cond.0                                # ir inst 10 fin
.F.testStridedAccess._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.testStridedAccess._4.while.cond.0                                # ir inst 11 fin
.F.testStridedAccess._4.while.cond.0:
  li t2, 2000
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.testStridedAccess._5.while.body.0
  j .F.testStridedAccess._6.while.exit.0                                # ir inst 14 fin
.F.testStridedAccess._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  addi t1, sp, 0
  add t4, t1, t2                                                        # ir inst 16 fin
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 17 fin
  sw t5, 0(t4)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.testStridedAccess._4.while.cond.0                                # ir inst 20 fin
.F.testStridedAccess._6.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testStridedAccess._7.while.cond.1                                # ir inst 21 fin
.F.testStridedAccess._7.while.cond.1:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 24 fin
  bnez t4, .F.testStridedAccess._8.while.body.1
  j .F.testStridedAccess._9.while.exit.1                                # ir inst 25 fin
.F.testStridedAccess._8.while.body.1:
  mv t4, t6                                                             # ir inst 26 fin
  slli t2, t4, 2
  addi t1, sp, 0
  add t3, t1, t2                                                        # ir inst 27 fin
  lw t4, 0(t3)                                                          # ir inst 28 fin
  add t3, t5, t4                                                        # ir inst 29 fin
  addi t4, t6, 7                                                        # ir inst 30 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testStridedAccess._7.while.cond.1                                # ir inst 31 fin
.F.testStridedAccess._9.while.exit.1:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 32 fin
  mv a0, t6
  j .F.testStridedAccess.epilogue                                       # ir inst 33 fin
.F.testStridedAccess.epilogue:
  li t0, 8000
  add sp, sp, t0
  ret

.globl .F.testRandomAccess
.F.testRandomAccess:
# spill func args num: 0,             range:     8016(sp) -     8016(sp)
# local var size: 8000,               range:        8(sp) -     8008(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8016
  add sp, sp, t0
  sd s11, 0(sp)
.F.testRandomAccess._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testRandomAccess._1.array.cond.0                                 # ir inst 3 fin
.F.testRandomAccess._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testRandomAccess._2.array.body.0
  j .F.testRandomAccess._3.array.exit.0                                 # ir inst 6 fin
.F.testRandomAccess._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testRandomAccess._1.array.cond.0                                 # ir inst 10 fin
.F.testRandomAccess._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.testRandomAccess._4.while.cond.0                                 # ir inst 11 fin
.F.testRandomAccess._4.while.cond.0:
  li t2, 2000
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.testRandomAccess._5.while.body.0
  j .F.testRandomAccess._6.while.exit.0                                 # ir inst 14 fin
.F.testRandomAccess._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 16 fin
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 17 fin
  sw t5, 0(t4)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.testRandomAccess._4.while.cond.0                                 # ir inst 20 fin
.F.testRandomAccess._6.while.exit.0:
# Phi connections
  li t4, 1
  li t5, 0
  li t6, 0
  j .F.testRandomAccess._7.while.cond.1                                 # ir inst 21 fin
.F.testRandomAccess._7.while.cond.1:
  li t2, 1000
  slt t3, t6, t2                                                        # ir inst 25 fin
  bnez t3, .F.testRandomAccess._8.while.body.1
  j .F.testRandomAccess._12.while.exit.1                                # ir inst 26 fin
.F.testRandomAccess._8.while.body.1:
  li t2, 6527
  mul t3, t4, t2                                                        # ir inst 27 fin
  li t2, 13904223
  add t4, t3, t2                                                        # ir inst 28 fin
  li t2, 2000
  rem t3, t4, t2                                                        # ir inst 29 fin
  li t2, 0
  slt t4, t3, t2                                                        # ir inst 30 fin
  bnez t4, .F.testRandomAccess._9.if.then.0
  j .F.testRandomAccess._10.if.else.0                                   # ir inst 31 fin
.F.testRandomAccess._9.if.then.0:
  li t1, 0
  sub t4, t1, t3                                                        # ir inst 32 fin
# Phi connections
  j .F.testRandomAccess._11.if.exit.0                                   # ir inst 33 fin
.F.testRandomAccess._10.if.else.0:
# Phi connections
  mv t4, t3
  j .F.testRandomAccess._11.if.exit.0                                   # ir inst 34 fin
.F.testRandomAccess._11.if.exit.0:
  mv t3, t4                                                             # ir inst 36 fin
  slli t2, t3, 2
  addi t1, sp, 8
  add s11, t1, t2                                                       # ir inst 37 fin
  lw t3, 0(s11)                                                         # ir inst 38 fin
  add s11, t5, t3                                                       # ir inst 39 fin
  addi t3, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, s11
  mv t6, t3
  j .F.testRandomAccess._7.while.cond.1                                 # ir inst 41 fin
.F.testRandomAccess._12.while.exit.1:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 42 fin
  mv a0, t6
  j .F.testRandomAccess.epilogue                                        # ir inst 43 fin
.F.testRandomAccess.epilogue:
  ld s11, 0(sp)
  li t0, 8016
  add sp, sp, t0
  ret

.globl .F.testBlockedAccess
.F.testBlockedAccess:
# spill func args num: 0,             range:     6464(sp) -     6464(sp)
# local var size: 6400,               range:       64(sp) -     6464(sp)
# return addr size: 0,                range:       64(sp) -       64(sp)
# callee save reg num: 8 / 12,        range:        0(sp) -       64(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6464
  add sp, sp, t0
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s7, 16(sp)
  sd s6, 24(sp)
  sd s0, 32(sp)
  sd s5, 40(sp)
  sd s8, 48(sp)
  sd s11, 56(sp)
.F.testBlockedAccess._0.entry.0:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testBlockedAccess._1.array.cond.0                                # ir inst 3 fin
.F.testBlockedAccess._1.array.cond.0:
  li t2, 1600
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testBlockedAccess._2.array.body.0
  j .F.testBlockedAccess._3.array.exit.0                                # ir inst 6 fin
.F.testBlockedAccess._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testBlockedAccess._1.array.cond.0                                # ir inst 10 fin
.F.testBlockedAccess._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.testBlockedAccess._4.while.cond.0                                # ir inst 11 fin
.F.testBlockedAccess._4.while.cond.0:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.testBlockedAccess._5.while.body.0
  j .F.testBlockedAccess._9.while.exit.0                                # ir inst 14 fin
.F.testBlockedAccess._5.while.body.0:
# Phi connections
  li t5, 0
  j .F.testBlockedAccess._6.while.cond.1                                # ir inst 15 fin
.F.testBlockedAccess._6.while.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 17 fin
  bnez t4, .F.testBlockedAccess._7.while.body.1
  j .F.testBlockedAccess._8.while.exit.1                                # ir inst 18 fin
.F.testBlockedAccess._7.while.body.1:
  li t2, 40
  mul t4, t6, t2                                                        # ir inst 19 fin
  add t3, t4, t5                                                        # ir inst 20 fin
  mv t4, t3                                                             # ir inst 21 fin
  slli t2, t4, 2
  addi t1, sp, 64
  add t3, t1, t2                                                        # ir inst 22 fin
  add t4, t6, t5                                                        # ir inst 23 fin
  li t2, 100
  rem s11, t4, t2                                                       # ir inst 24 fin
  sw s11, 0(t3)                                                         # ir inst 25 fin
  addi t4, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F.testBlockedAccess._6.while.cond.1                                # ir inst 27 fin
.F.testBlockedAccess._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t6, t5
  j .F.testBlockedAccess._4.while.cond.0                                # ir inst 29 fin
.F.testBlockedAccess._9.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testBlockedAccess._10.while.cond.2                               # ir inst 30 fin
.F.testBlockedAccess._10.while.cond.2:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 33 fin
  bnez t4, .F.testBlockedAccess._11.while.body.2
  j .F.testBlockedAccess._27.while.exit.2                               # ir inst 34 fin
.F.testBlockedAccess._11.while.body.2:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F.testBlockedAccess._12.while.cond.3                               # ir inst 35 fin
.F.testBlockedAccess._12.while.cond.3:
  li t2, 40
  slt s11, t4, t2                                                       # ir inst 38 fin
  bnez s11, .F.testBlockedAccess._13.while.body.3
  j .F.testBlockedAccess._26.while.exit.3                               # ir inst 39 fin
.F.testBlockedAccess._13.while.body.3:
  addi s11, t5, 8                                                       # ir inst 40 fin
  li t2, 40
  slt s10, t2, s11                                                      # ir inst 41 fin
  bnez s10, .F.testBlockedAccess._14.if.then.0
  j .F.testBlockedAccess._15.if.else.0                                  # ir inst 42 fin
.F.testBlockedAccess._14.if.then.0:
# Phi connections
  li s11, 40
  j .F.testBlockedAccess._16.if.exit.0                                  # ir inst 43 fin
.F.testBlockedAccess._15.if.else.0:
# Phi connections
  j .F.testBlockedAccess._16.if.exit.0                                  # ir inst 44 fin
.F.testBlockedAccess._16.if.exit.0:
# Phi connections
  mv s9, t5
  mv s10, t3
  j .F.testBlockedAccess._17.while.cond.4                               # ir inst 46 fin
.F.testBlockedAccess._17.while.cond.4:
  slt s8, s9, s11                                                       # ir inst 49 fin
  bnez s8, .F.testBlockedAccess._18.while.body.4
  j .F.testBlockedAccess._25.while.exit.4                               # ir inst 50 fin
.F.testBlockedAccess._18.while.body.4:
  addi s8, t4, 8                                                        # ir inst 51 fin
  li t2, 40
  slt s7, t2, s8                                                        # ir inst 52 fin
  bnez s7, .F.testBlockedAccess._19.if.then.1
  j .F.testBlockedAccess._20.if.else.1                                  # ir inst 53 fin
.F.testBlockedAccess._19.if.then.1:
# Phi connections
  li s8, 40
  j .F.testBlockedAccess._21.if.exit.1                                  # ir inst 54 fin
.F.testBlockedAccess._20.if.else.1:
# Phi connections
  j .F.testBlockedAccess._21.if.exit.1                                  # ir inst 55 fin
.F.testBlockedAccess._21.if.exit.1:
# Phi connections
  mv s6, t4
  mv s7, s10
  j .F.testBlockedAccess._22.while.cond.5                               # ir inst 57 fin
.F.testBlockedAccess._22.while.cond.5:
  slt s5, s6, s8                                                        # ir inst 60 fin
  bnez s5, .F.testBlockedAccess._23.while.body.5
  j .F.testBlockedAccess._24.while.exit.5                               # ir inst 61 fin
.F.testBlockedAccess._23.while.body.5:
  li t2, 40
  mul s5, s9, t2                                                        # ir inst 62 fin
  add s0, s5, s6                                                        # ir inst 63 fin
  mv s5, s0                                                             # ir inst 64 fin
  slli t2, s5, 2
  addi t1, sp, 64
  add s0, t1, t2                                                        # ir inst 65 fin
  lw s5, 0(s0)                                                          # ir inst 66 fin
  add s0, s7, s5                                                        # ir inst 67 fin
  addi s5, s6, 1                                                        # ir inst 68 fin
# Phi connections
  mv s6, s5
  mv s7, s0
  j .F.testBlockedAccess._22.while.cond.5                               # ir inst 69 fin
.F.testBlockedAccess._24.while.exit.5:
  addi s8, s9, 1                                                        # ir inst 70 fin
# Phi connections
  mv s9, s8
  mv s10, s7
  j .F.testBlockedAccess._17.while.cond.4                               # ir inst 71 fin
.F.testBlockedAccess._25.while.exit.4:
  addi s11, t4, 8                                                       # ir inst 72 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.testBlockedAccess._12.while.cond.3                               # ir inst 73 fin
.F.testBlockedAccess._26.while.exit.3:
  addi t4, t5, 8                                                        # ir inst 74 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testBlockedAccess._10.while.cond.2                               # ir inst 75 fin
.F.testBlockedAccess._27.while.exit.2:
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 76 fin
  mv a0, t5
  j .F.testBlockedAccess.epilogue                                       # ir inst 77 fin
.F.testBlockedAccess.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s7, 16(sp)
  ld s6, 24(sp)
  ld s0, 32(sp)
  ld s5, 40(sp)
  ld s8, 48(sp)
  ld s11, 56(sp)
  li t0, 6464
  add sp, sp, t0
  ret
