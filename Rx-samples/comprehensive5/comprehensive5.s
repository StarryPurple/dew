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
  li a0, 1500
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testMemoryAccessPatterns
# ir inst 2 fin
# Start call preparation
  call .F.testMultiDimensionalArrayAccess
# ir inst 3 fin
# Start call preparation
  call .F.testDataLayoutOptimization
# ir inst 4 fin
# Start call preparation
  call .F.testMemoryStridePatterns
# ir inst 5 fin
# Start call preparation
  call .F.testCacheConsciousAlgorithms
# ir inst 6 fin
# Start call preparation
  li a0, 1599
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

.globl .F.testMemoryAccessPatterns
.F.testMemoryAccessPatterns:
# spill func args num: 0,             range:    16400(sp) -    16400(sp)
# local var size: 16384,              range:       16(sp) -    16400(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -16400
  add sp, sp, t0
  sd ra, 8(sp)
.F.testMemoryAccessPatterns._0.entry.0:
# Start call preparation
  li a0, 1501
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testMemoryAccessPatterns._1.array.cond.0                         # ir inst 4 fin
.F.testMemoryAccessPatterns._1.array.cond.0:
  li t2, 4096
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testMemoryAccessPatterns._2.array.body.0
  j .F.testMemoryAccessPatterns._3.array.exit.0                         # ir inst 7 fin
.F.testMemoryAccessPatterns._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testMemoryAccessPatterns._1.array.cond.0                         # ir inst 11 fin
.F.testMemoryAccessPatterns._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeLargeArray
# ir inst 12 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.sequentialAccess
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 8
  addi t1, sp, 16
  mv a0, t1
  call .F.stridedAccess
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.randomAccess
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.backwardAccess
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1502
  call printlnInt
# ir inst 21 fin
  j .F.testMemoryAccessPatterns.epilogue                                # ir inst 22 fin
.F.testMemoryAccessPatterns.epilogue:
  ld ra, 8(sp)
  li t0, 16400
  add sp, sp, t0
  ret

.globl .F.initializeLargeArray
.F.initializeLargeArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeLargeArray._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 98765
  j .F.initializeLargeArray._1.while.cond.0                             # ir inst 1 fin
.F.initializeLargeArray._1.while.cond.0:
  li t2, 4096
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.initializeLargeArray._2.while.body.0
  j .F.initializeLargeArray._6.while.exit.0                             # ir inst 5 fin
.F.initializeLargeArray._2.while.body.0:
  li t2, 1103
  mul t4, t6, t2                                                        # ir inst 6 fin
  li t2, 4721
  add t6, t4, t2                                                        # ir inst 7 fin
  li t2, 1048583
  rem t4, t6, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 9 fin
  bnez t6, .F.initializeLargeArray._3.if.then.0
  j .F.initializeLargeArray._4.if.else.0                                # ir inst 10 fin
.F.initializeLargeArray._3.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 11 fin
# Phi connections
  j .F.initializeLargeArray._5.if.exit.0                                # ir inst 12 fin
.F.initializeLargeArray._4.if.else.0:
# Phi connections
  mv t6, t4
  j .F.initializeLargeArray._5.if.exit.0                                # ir inst 13 fin
.F.initializeLargeArray._5.if.exit.0:
  mv t4, t5                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 16 fin
  li t2, 1000
  rem t4, t6, t2                                                        # ir inst 17 fin
  sw t4, 0(t3)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.initializeLargeArray._1.while.cond.0                             # ir inst 20 fin
.F.initializeLargeArray._6.while.exit.0:
  j .F.initializeLargeArray.epilogue                                    # ir inst 21 fin
.F.initializeLargeArray.epilogue:
  ret

.globl .F.sequentialAccess
.F.sequentialAccess:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.sequentialAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.sequentialAccess._1.while.cond.0                                 # ir inst 1 fin
.F.sequentialAccess._1.while.cond.0:
  li t2, 4096
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.sequentialAccess._2.while.body.0
  j .F.sequentialAccess._3.while.exit.0                                 # ir inst 5 fin
.F.sequentialAccess._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.sequentialAccess._1.while.cond.0                                 # ir inst 11 fin
.F.sequentialAccess._3.while.exit.0:
  mv a0, t5
  j .F.sequentialAccess.epilogue                                        # ir inst 12 fin
.F.sequentialAccess.epilogue:
  ret

.globl .F.stridedAccess
.F.stridedAccess:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.stridedAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.stridedAccess._1.while.cond.0                                    # ir inst 1 fin
.F.stridedAccess._1.while.cond.0:
  li t2, 4096
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.stridedAccess._2.while.body.0
  j .F.stridedAccess._3.while.exit.0                                    # ir inst 5 fin
.F.stridedAccess._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  add t4, t6, a1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.stridedAccess._1.while.cond.0                                    # ir inst 11 fin
.F.stridedAccess._3.while.exit.0:
  mv a0, t5
  j .F.stridedAccess.epilogue                                           # ir inst 12 fin
.F.stridedAccess.epilogue:
  ret

.globl .F.randomAccess
.F.randomAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.randomAccess._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 54321
  li t6, 0
  j .F.randomAccess._1.while.cond.0                                     # ir inst 1 fin
.F.randomAccess._1.while.cond.0:
  li t2, 1000
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.randomAccess._2.while.body.0
  j .F.randomAccess._6.while.exit.0                                     # ir inst 6 fin
.F.randomAccess._2.while.body.0:
  li t2, 1103
  mul t3, t5, t2                                                        # ir inst 7 fin
  li t2, 4721
  add t5, t3, t2                                                        # ir inst 8 fin
  li t2, 1048583
  rem t3, t5, t2                                                        # ir inst 9 fin
  li t2, 0
  slt t5, t3, t2                                                        # ir inst 10 fin
  bnez t5, .F.randomAccess._3.if.then.0
  j .F.randomAccess._4.if.else.0                                        # ir inst 11 fin
.F.randomAccess._3.if.then.0:
  li t1, 0
  sub t5, t1, t3                                                        # ir inst 12 fin
# Phi connections
  j .F.randomAccess._5.if.exit.0                                        # ir inst 13 fin
.F.randomAccess._4.if.else.0:
# Phi connections
  mv t5, t3
  j .F.randomAccess._5.if.exit.0                                        # ir inst 14 fin
.F.randomAccess._5.if.exit.0:
  li t2, 4096
  rem t3, t5, t2                                                        # ir inst 16 fin
  mv s11, t3                                                            # ir inst 17 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 18 fin
  lw s11, 0(t3)                                                         # ir inst 19 fin
  add t3, t4, s11                                                       # ir inst 20 fin
  addi s11, t6, 1                                                       # ir inst 21 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.randomAccess._1.while.cond.0                                     # ir inst 22 fin
.F.randomAccess._6.while.exit.0:
  mv a0, t4
  j .F.randomAccess.epilogue                                            # ir inst 23 fin
.F.randomAccess.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.backwardAccess
.F.backwardAccess:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.backwardAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 4095
  j .F.backwardAccess._1.while.cond.0                                   # ir inst 1 fin
.F.backwardAccess._1.while.cond.0:
  li t2, 0
  slt t0, t6, t2
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.backwardAccess._2.while.body.0
  j .F.backwardAccess._3.while.exit.0                                   # ir inst 5 fin
.F.backwardAccess._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  addi t4, t6, -1                                                       # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.backwardAccess._1.while.cond.0                                   # ir inst 11 fin
.F.backwardAccess._3.while.exit.0:
  mv a0, t5
  j .F.backwardAccess.epilogue                                          # ir inst 12 fin
.F.backwardAccess.epilogue:
  ret

.globl .F.testMultiDimensionalArrayAccess
.F.testMultiDimensionalArrayAccess:
# spill func args num: 0,             range:     4112(sp) -     4112(sp)
# local var size: 4096,               range:       16(sp) -     4112(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4112
  add sp, sp, t0
  sd ra, 8(sp)
.F.testMultiDimensionalArrayAccess._0.entry.0:
# Start call preparation
  li a0, 1503
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testMultiDimensionalArrayAccess._1.array.cond.0                  # ir inst 4 fin
.F.testMultiDimensionalArrayAccess._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testMultiDimensionalArrayAccess._2.array.body.0
  j .F.testMultiDimensionalArrayAccess._3.array.exit.0                  # ir inst 7 fin
.F.testMultiDimensionalArrayAccess._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testMultiDimensionalArrayAccess._1.array.cond.0                  # ir inst 11 fin
.F.testMultiDimensionalArrayAccess._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeMatrix32x32
# ir inst 12 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.rowMajorAccess
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.columnMajorAccess
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.diagonalAccess
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.blockAccess
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1504
  call printlnInt
# ir inst 21 fin
  j .F.testMultiDimensionalArrayAccess.epilogue                         # ir inst 22 fin
.F.testMultiDimensionalArrayAccess.epilogue:
  ld ra, 8(sp)
  li t0, 4112
  add sp, sp, t0
  ret

.globl .F.initializeMatrix32x32
.F.initializeMatrix32x32:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeMatrix32x32._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrix32x32._1.while.cond.0                            # ir inst 1 fin
.F.initializeMatrix32x32._1.while.cond.0:
  li t2, 32
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeMatrix32x32._2.while.body.0
  j .F.initializeMatrix32x32._6.while.exit.0                            # ir inst 4 fin
.F.initializeMatrix32x32._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeMatrix32x32._3.while.cond.1                            # ir inst 5 fin
.F.initializeMatrix32x32._3.while.cond.1:
  li t2, 32
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.initializeMatrix32x32._4.while.body.1
  j .F.initializeMatrix32x32._5.while.exit.1                            # ir inst 8 fin
.F.initializeMatrix32x32._4.while.body.1:
  slli t4, t6, 5                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  addi t4, t6, 1                                                        # ir inst 13 fin
  addi s11, t5, 1                                                       # ir inst 14 fin
  mul s10, t4, s11                                                      # ir inst 15 fin
  sw s10, 0(t3)                                                         # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.initializeMatrix32x32._3.while.cond.1                            # ir inst 18 fin
.F.initializeMatrix32x32._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrix32x32._1.while.cond.0                            # ir inst 20 fin
.F.initializeMatrix32x32._6.while.exit.0:
  j .F.initializeMatrix32x32.epilogue                                   # ir inst 21 fin
.F.initializeMatrix32x32.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.rowMajorAccess
.F.rowMajorAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.rowMajorAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.rowMajorAccess._1.while.cond.0                                   # ir inst 1 fin
.F.rowMajorAccess._1.while.cond.0:
  li t2, 32
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.rowMajorAccess._2.while.body.0
  j .F.rowMajorAccess._6.while.exit.0                                   # ir inst 5 fin
.F.rowMajorAccess._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.rowMajorAccess._3.while.cond.1                                   # ir inst 6 fin
.F.rowMajorAccess._3.while.cond.1:
  li t2, 32
  slt s11, t4, t2                                                       # ir inst 9 fin
  bnez s11, .F.rowMajorAccess._4.while.body.1
  j .F.rowMajorAccess._5.while.exit.1                                   # ir inst 10 fin
.F.rowMajorAccess._4.while.body.1:
  slli s11, t6, 5                                                       # ir inst 11 fin
  add s10, s11, t4                                                      # ir inst 12 fin
  mv s11, s10                                                           # ir inst 13 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 14 fin
  lw s11, 0(s10)                                                        # ir inst 15 fin
  add s10, t3, s11                                                      # ir inst 16 fin
  addi s11, t4, 1                                                       # ir inst 17 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.rowMajorAccess._3.while.cond.1                                   # ir inst 18 fin
.F.rowMajorAccess._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.rowMajorAccess._1.while.cond.0                                   # ir inst 20 fin
.F.rowMajorAccess._6.while.exit.0:
  mv a0, t5
  j .F.rowMajorAccess.epilogue                                          # ir inst 21 fin
.F.rowMajorAccess.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.columnMajorAccess
.F.columnMajorAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.columnMajorAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.columnMajorAccess._1.while.cond.0                                # ir inst 1 fin
.F.columnMajorAccess._1.while.cond.0:
  li t2, 32
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.columnMajorAccess._2.while.body.0
  j .F.columnMajorAccess._6.while.exit.0                                # ir inst 5 fin
.F.columnMajorAccess._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.columnMajorAccess._3.while.cond.1                                # ir inst 6 fin
.F.columnMajorAccess._3.while.cond.1:
  li t2, 32
  slt s11, t4, t2                                                       # ir inst 9 fin
  bnez s11, .F.columnMajorAccess._4.while.body.1
  j .F.columnMajorAccess._5.while.exit.1                                # ir inst 10 fin
.F.columnMajorAccess._4.while.body.1:
  slli s11, t4, 5                                                       # ir inst 11 fin
  add s10, s11, t6                                                      # ir inst 12 fin
  mv s11, s10                                                           # ir inst 13 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 14 fin
  lw s11, 0(s10)                                                        # ir inst 15 fin
  add s10, t3, s11                                                      # ir inst 16 fin
  addi s11, t4, 1                                                       # ir inst 17 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.columnMajorAccess._3.while.cond.1                                # ir inst 18 fin
.F.columnMajorAccess._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.columnMajorAccess._1.while.cond.0                                # ir inst 20 fin
.F.columnMajorAccess._6.while.exit.0:
  mv a0, t5
  j .F.columnMajorAccess.epilogue                                       # ir inst 21 fin
.F.columnMajorAccess.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.diagonalAccess
.F.diagonalAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.diagonalAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.diagonalAccess._1.while.cond.0                                   # ir inst 1 fin
.F.diagonalAccess._1.while.cond.0:
  li t2, 32
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.diagonalAccess._2.while.body.0
  j .F.diagonalAccess._3.while.exit.0                                   # ir inst 5 fin
.F.diagonalAccess._2.while.body.0:
  slli t4, t6, 5                                                        # ir inst 6 fin
  add t3, t4, t6                                                        # ir inst 7 fin
  mv t4, t3                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  lw t4, 0(t3)                                                          # ir inst 10 fin
  add t3, t5, t4                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.diagonalAccess._1.while.cond.0                                   # ir inst 13 fin
.F.diagonalAccess._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.diagonalAccess._4.while.cond.1                                   # ir inst 14 fin
.F.diagonalAccess._4.while.cond.1:
  li t2, 32
  slt t4, t6, t2                                                        # ir inst 17 fin
  bnez t4, .F.diagonalAccess._5.while.body.1
  j .F.diagonalAccess._6.while.exit.1                                   # ir inst 18 fin
.F.diagonalAccess._5.while.body.1:
  slli t4, t6, 5                                                        # ir inst 19 fin
  li t1, 31
  sub t3, t1, t6                                                        # ir inst 20 fin
  add s11, t4, t3                                                       # ir inst 21 fin
  mv t4, s11                                                            # ir inst 22 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  lw t4, 0(t3)                                                          # ir inst 24 fin
  add t3, t5, t4                                                        # ir inst 25 fin
  addi t4, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.diagonalAccess._4.while.cond.1                                   # ir inst 27 fin
.F.diagonalAccess._6.while.exit.1:
  mv a0, t5
  j .F.diagonalAccess.epilogue                                          # ir inst 28 fin
.F.diagonalAccess.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.blockAccess
.F.blockAccess:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 0,                range:       64(sp) -       64(sp)
# callee save reg num: 8 / 12,        range:        0(sp) -       64(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s7, 16(sp)
  sd s6, 24(sp)
  sd s0, 32(sp)
  sd s5, 40(sp)
  sd s8, 48(sp)
  sd s11, 56(sp)
.F.blockAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.blockAccess._1.while.cond.0                                      # ir inst 1 fin
.F.blockAccess._1.while.cond.0:
  li t2, 32
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.blockAccess._2.while.body.0
  j .F.blockAccess._18.while.exit.0                                     # ir inst 5 fin
.F.blockAccess._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.blockAccess._3.while.cond.1                                      # ir inst 6 fin
.F.blockAccess._3.while.cond.1:
  li t2, 32
  slt s11, t4, t2                                                       # ir inst 9 fin
  bnez s11, .F.blockAccess._4.while.body.1
  j .F.blockAccess._17.while.exit.1                                     # ir inst 10 fin
.F.blockAccess._4.while.body.1:
  addi s11, t6, 8                                                       # ir inst 11 fin
# Phi connections
  mv s9, t3
  mv s10, t6
  j .F.blockAccess._5.while.cond.2                                      # ir inst 12 fin
.F.blockAccess._5.while.cond.2:
  slt s8, s10, s11                                                      # ir inst 15 fin
  bnez s8, .F.blockAccess._6.lazy.then.0
  j .F.blockAccess._7.lazy.else.0                                       # ir inst 16 fin
.F.blockAccess._6.lazy.then.0:
  li t2, 32
  slt s8, s10, t2                                                       # ir inst 17 fin
# Phi connections
  j .F.blockAccess._8.lazy.exit.0                                       # ir inst 18 fin
.F.blockAccess._7.lazy.else.0:
# Phi connections
  li s8, 0
  j .F.blockAccess._8.lazy.exit.0                                       # ir inst 19 fin
.F.blockAccess._8.lazy.exit.0:
  bnez s8, .F.blockAccess._9.while.body.2
  j .F.blockAccess._16.while.exit.2                                     # ir inst 21 fin
.F.blockAccess._9.while.body.2:
  addi s8, t4, 8                                                        # ir inst 22 fin
# Phi connections
  mv s6, s9
  mv s7, t4
  j .F.blockAccess._10.while.cond.3                                     # ir inst 23 fin
.F.blockAccess._10.while.cond.3:
  slt s5, s7, s8                                                        # ir inst 26 fin
  bnez s5, .F.blockAccess._11.lazy.then.1
  j .F.blockAccess._12.lazy.else.1                                      # ir inst 27 fin
.F.blockAccess._11.lazy.then.1:
  li t2, 32
  slt s5, s7, t2                                                        # ir inst 28 fin
# Phi connections
  j .F.blockAccess._13.lazy.exit.1                                      # ir inst 29 fin
.F.blockAccess._12.lazy.else.1:
# Phi connections
  li s5, 0
  j .F.blockAccess._13.lazy.exit.1                                      # ir inst 30 fin
.F.blockAccess._13.lazy.exit.1:
  bnez s5, .F.blockAccess._14.while.body.3
  j .F.blockAccess._15.while.exit.3                                     # ir inst 32 fin
.F.blockAccess._14.while.body.3:
  slli s5, s10, 5                                                       # ir inst 33 fin
  add s0, s5, s7                                                        # ir inst 34 fin
  mv s5, s0                                                             # ir inst 35 fin
  slli t2, s5, 2
  add s0, a0, t2                                                        # ir inst 36 fin
  lw s5, 0(s0)                                                          # ir inst 37 fin
  add s0, s6, s5                                                        # ir inst 38 fin
  addi s5, s7, 1                                                        # ir inst 39 fin
# Phi connections
  mv s6, s0
  mv s7, s5
  j .F.blockAccess._10.while.cond.3                                     # ir inst 40 fin
.F.blockAccess._15.while.exit.3:
  addi s8, s10, 1                                                       # ir inst 41 fin
# Phi connections
  mv s9, s6
  mv s10, s8
  j .F.blockAccess._5.while.cond.2                                      # ir inst 42 fin
.F.blockAccess._16.while.exit.2:
  addi s11, t4, 8                                                       # ir inst 43 fin
# Phi connections
  mv t3, s9
  mv t4, s11
  j .F.blockAccess._3.while.cond.1                                      # ir inst 44 fin
.F.blockAccess._17.while.exit.1:
  addi t4, t6, 8                                                        # ir inst 45 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.blockAccess._1.while.cond.0                                      # ir inst 46 fin
.F.blockAccess._18.while.exit.0:
  mv a0, t5
  j .F.blockAccess.epilogue                                             # ir inst 47 fin
.F.blockAccess.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s7, 16(sp)
  ld s6, 24(sp)
  ld s0, 32(sp)
  ld s5, 40(sp)
  ld s8, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.testDataLayoutOptimization
.F.testDataLayoutOptimization:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testDataLayoutOptimization._0.entry.0:
# Start call preparation
  li a0, 1505
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testStructureOfArrays
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.testArrayOfStructures
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.testHybridDataLayout
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 1506
  call printlnInt
# ir inst 8 fin
  j .F.testDataLayoutOptimization.epilogue                              # ir inst 9 fin
.F.testDataLayoutOptimization.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testStructureOfArrays
.F.testStructureOfArrays:
# spill func args num: 0,             range:    12016(sp) -    12016(sp)
# local var size: 12000,              range:       16(sp) -    12016(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -12016
  add sp, sp, t0
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.testStructureOfArrays._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testStructureOfArrays._1.array.cond.0                            # ir inst 3 fin
.F.testStructureOfArrays._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testStructureOfArrays._2.array.body.0
  j .F.testStructureOfArrays._3.array.exit.0                            # ir inst 6 fin
.F.testStructureOfArrays._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testStructureOfArrays._1.array.cond.0                            # ir inst 10 fin
.F.testStructureOfArrays._3.array.exit.0:
  li t1, 4016
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.testStructureOfArrays._4.array.cond.1                            # ir inst 13 fin
.F.testStructureOfArrays._4.array.cond.1:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.testStructureOfArrays._5.array.body.1
  j .F.testStructureOfArrays._6.array.exit.1                            # ir inst 16 fin
.F.testStructureOfArrays._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.testStructureOfArrays._4.array.cond.1                            # ir inst 20 fin
.F.testStructureOfArrays._6.array.exit.1:
  li t1, 8016
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.testStructureOfArrays._7.array.cond.2                            # ir inst 23 fin
.F.testStructureOfArrays._7.array.cond.2:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.testStructureOfArrays._8.array.body.2
  j .F.testStructureOfArrays._9.array.exit.2                            # ir inst 26 fin
.F.testStructureOfArrays._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.testStructureOfArrays._7.array.cond.2                            # ir inst 30 fin
.F.testStructureOfArrays._9.array.exit.2:
# Phi connections
  li t6, 0
  j .F.testStructureOfArrays._10.while.cond.0                           # ir inst 31 fin
.F.testStructureOfArrays._10.while.cond.0:
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 33 fin
  bnez t5, .F.testStructureOfArrays._11.while.body.0
  j .F.testStructureOfArrays._12.while.exit.0                           # ir inst 34 fin
.F.testStructureOfArrays._11.while.body.0:
  mv t5, t6                                                             # ir inst 35 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 36 fin
  sw t6, 0(t4)                                                          # ir inst 37 fin
  mv t5, t6                                                             # ir inst 38 fin
  slli t2, t5, 2
  li t1, 4016
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 39 fin
  slli t5, t6, 1                                                        # ir inst 40 fin
  sw t5, 0(t4)                                                          # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  slli t2, t5, 2
  li t1, 8016
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 43 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 44 fin
  sw t5, 0(t4)                                                          # ir inst 45 fin
  addi t5, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  j .F.testStructureOfArrays._10.while.cond.0                           # ir inst 47 fin
.F.testStructureOfArrays._12.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testStructureOfArrays._13.while.cond.1                           # ir inst 48 fin
.F.testStructureOfArrays._13.while.cond.1:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 51 fin
  bnez t4, .F.testStructureOfArrays._14.while.body.1
  j .F.testStructureOfArrays._15.while.exit.1                           # ir inst 52 fin
.F.testStructureOfArrays._14.while.body.1:
  mv t4, t5                                                             # ir inst 53 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 54 fin
  lw t4, 0(t3)                                                          # ir inst 55 fin
  slli t3, t4, 1                                                        # ir inst 56 fin
  add t4, t6, t3                                                        # ir inst 57 fin
  addi t3, t5, 1                                                        # ir inst 58 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testStructureOfArrays._13.while.cond.1                           # ir inst 59 fin
.F.testStructureOfArrays._15.while.exit.1:
# Phi connections
  li t4, 0
  li t5, 0
  j .F.testStructureOfArrays._16.while.cond.2                           # ir inst 60 fin
.F.testStructureOfArrays._16.while.cond.2:
  li t2, 1000
  slt t3, t4, t2                                                        # ir inst 63 fin
  bnez t3, .F.testStructureOfArrays._17.while.body.2
  j .F.testStructureOfArrays._18.while.exit.2                           # ir inst 64 fin
.F.testStructureOfArrays._17.while.body.2:
  mv t3, t4                                                             # ir inst 65 fin
  slli t2, t3, 2
  li t1, 4016
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 66 fin
  lw t3, 0(s11)                                                         # ir inst 67 fin
  li t2, 3
  mul s11, t3, t2                                                       # ir inst 68 fin
  add t3, t5, s11                                                       # ir inst 69 fin
  addi s11, t4, 1                                                       # ir inst 70 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.testStructureOfArrays._16.while.cond.2                           # ir inst 71 fin
.F.testStructureOfArrays._18.while.exit.2:
# Phi connections
  li t3, 0
  li t4, 0
  j .F.testStructureOfArrays._19.while.cond.3                           # ir inst 72 fin
.F.testStructureOfArrays._19.while.cond.3:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 75 fin
  bnez s11, .F.testStructureOfArrays._20.while.body.3
  j .F.testStructureOfArrays._21.while.exit.3                           # ir inst 76 fin
.F.testStructureOfArrays._20.while.body.3:
  mv s11, t3                                                            # ir inst 77 fin
  slli t2, s11, 2
  li t1, 8016
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 78 fin
  lw s11, 0(s10)                                                        # ir inst 79 fin
  slli s10, s11, 2                                                      # ir inst 80 fin
  add s11, t4, s10                                                      # ir inst 81 fin
  addi s10, t3, 1                                                       # ir inst 82 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.testStructureOfArrays._19.while.cond.3                           # ir inst 83 fin
.F.testStructureOfArrays._21.while.exit.3:
  add t3, t6, t5                                                        # ir inst 84 fin
  add t6, t3, t4                                                        # ir inst 85 fin
  mv a0, t6
  j .F.testStructureOfArrays.epilogue                                   # ir inst 86 fin
.F.testStructureOfArrays.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  li t0, 12016
  add sp, sp, t0
  ret

.globl .F.testArrayOfStructures
.F.testArrayOfStructures:
# spill func args num: 0,             range:    12016(sp) -    12016(sp)
# local var size: 12000,              range:       16(sp) -    12016(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -12016
  add sp, sp, t0
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.testArrayOfStructures._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testArrayOfStructures._1.array.cond.0                            # ir inst 3 fin
.F.testArrayOfStructures._1.array.cond.0:
  li t2, 3000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testArrayOfStructures._2.array.body.0
  j .F.testArrayOfStructures._3.array.exit.0                            # ir inst 6 fin
.F.testArrayOfStructures._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testArrayOfStructures._1.array.cond.0                            # ir inst 10 fin
.F.testArrayOfStructures._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.testArrayOfStructures._4.while.cond.0                            # ir inst 11 fin
.F.testArrayOfStructures._4.while.cond.0:
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.testArrayOfStructures._5.while.body.0
  j .F.testArrayOfStructures._6.while.exit.0                            # ir inst 14 fin
.F.testArrayOfStructures._5.while.body.0:
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t5, t1, t2                                                        # ir inst 17 fin
  sw t6, 0(t5)                                                          # ir inst 18 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
  mv t5, t4                                                             # ir inst 21 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 22 fin
  slli t5, t6, 1                                                        # ir inst 23 fin
  sw t5, 0(t4)                                                          # ir inst 24 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 25 fin
  addi t4, t5, 2                                                        # ir inst 26 fin
  mv t5, t4                                                             # ir inst 27 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 28 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 29 fin
  sw t5, 0(t4)                                                          # ir inst 30 fin
  addi t5, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t6, t5
  j .F.testArrayOfStructures._4.while.cond.0                            # ir inst 32 fin
.F.testArrayOfStructures._6.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testArrayOfStructures._7.while.cond.1                            # ir inst 33 fin
.F.testArrayOfStructures._7.while.cond.1:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 36 fin
  bnez t4, .F.testArrayOfStructures._8.while.body.1
  j .F.testArrayOfStructures._9.while.exit.1                            # ir inst 37 fin
.F.testArrayOfStructures._8.while.body.1:
  li t2, 3
  mul t4, t6, t2                                                        # ir inst 38 fin
  mv t3, t4                                                             # ir inst 39 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 40 fin
  lw t3, 0(t4)                                                          # ir inst 41 fin
  li t2, 3
  mul t4, t6, t2                                                        # ir inst 42 fin
  addi s11, t4, 1                                                       # ir inst 43 fin
  mv t4, s11                                                            # ir inst 44 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 45 fin
  lw t4, 0(s11)                                                         # ir inst 46 fin
  li t2, 3
  mul s11, t6, t2                                                       # ir inst 47 fin
  addi s10, s11, 2                                                      # ir inst 48 fin
  mv s11, s10                                                           # ir inst 49 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add s10, t1, t2                                                       # ir inst 50 fin
  lw s11, 0(s10)                                                        # ir inst 51 fin
  mul s10, t3, t3                                                       # ir inst 52 fin
  li t2, 1073741824
  rem t3, s10, t2                                                       # ir inst 53 fin
  mul s10, t4, t4                                                       # ir inst 54 fin
  li t2, 1073741824
  rem t4, s10, t2                                                       # ir inst 55 fin
  add s10, t3, t4                                                       # ir inst 56 fin
  mul t4, s11, s11                                                      # ir inst 57 fin
  li t2, 1073741824
  rem t3, t4, t2                                                        # ir inst 58 fin
  add t4, s10, t3                                                       # ir inst 59 fin
  li t2, 1073741824
  rem t3, t4, t2                                                        # ir inst 60 fin
  add t4, t5, t3                                                        # ir inst 61 fin
  li t2, 1073741824
  rem t3, t4, t2                                                        # ir inst 62 fin
  addi t4, t6, 1                                                        # ir inst 63 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testArrayOfStructures._7.while.cond.1                            # ir inst 64 fin
.F.testArrayOfStructures._9.while.exit.1:
  mv a0, t5
  j .F.testArrayOfStructures.epilogue                                   # ir inst 65 fin
.F.testArrayOfStructures.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  li t0, 12016
  add sp, sp, t0
  ret

.globl .F.testHybridDataLayout
.F.testHybridDataLayout:
# spill func args num: 0,             range:     6016(sp) -     6016(sp)
# local var size: 6000,               range:        8(sp) -     6008(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6016
  add sp, sp, t0
  sd s11, 0(sp)
.F.testHybridDataLayout._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testHybridDataLayout._1.array.cond.0                             # ir inst 3 fin
.F.testHybridDataLayout._1.array.cond.0:
  li t2, 250
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testHybridDataLayout._2.array.body.0
  j .F.testHybridDataLayout._3.array.exit.0                             # ir inst 6 fin
.F.testHybridDataLayout._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testHybridDataLayout._1.array.cond.0                             # ir inst 10 fin
.F.testHybridDataLayout._3.array.exit.0:
  addi t1, sp, 1008
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.testHybridDataLayout._4.array.cond.1                             # ir inst 13 fin
.F.testHybridDataLayout._4.array.cond.1:
  li t2, 250
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.testHybridDataLayout._5.array.body.1
  j .F.testHybridDataLayout._6.array.exit.1                             # ir inst 16 fin
.F.testHybridDataLayout._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.testHybridDataLayout._4.array.cond.1                             # ir inst 20 fin
.F.testHybridDataLayout._6.array.exit.1:
  addi t1, sp, 2008
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.testHybridDataLayout._7.array.cond.2                             # ir inst 23 fin
.F.testHybridDataLayout._7.array.cond.2:
  li t2, 250
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.testHybridDataLayout._8.array.body.2
  j .F.testHybridDataLayout._9.array.exit.2                             # ir inst 26 fin
.F.testHybridDataLayout._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.testHybridDataLayout._7.array.cond.2                             # ir inst 30 fin
.F.testHybridDataLayout._9.array.exit.2:
  li t1, 3008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 32 fin
# Phi connections
  li t5, 0
  j .F.testHybridDataLayout._10.array.cond.3                            # ir inst 33 fin
.F.testHybridDataLayout._10.array.cond.3:
  li t2, 250
  slt t4, t5, t2                                                        # ir inst 35 fin
  bnez t4, .F.testHybridDataLayout._11.array.body.3
  j .F.testHybridDataLayout._12.array.exit.3                            # ir inst 36 fin
.F.testHybridDataLayout._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 37 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 38 fin
  addi t4, t5, 1                                                        # ir inst 39 fin
# Phi connections
  mv t5, t4
  j .F.testHybridDataLayout._10.array.cond.3                            # ir inst 40 fin
.F.testHybridDataLayout._12.array.exit.3:
  li t1, 4008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 42 fin
# Phi connections
  li t5, 0
  j .F.testHybridDataLayout._13.array.cond.4                            # ir inst 43 fin
.F.testHybridDataLayout._13.array.cond.4:
  li t2, 250
  slt t4, t5, t2                                                        # ir inst 45 fin
  bnez t4, .F.testHybridDataLayout._14.array.body.4
  j .F.testHybridDataLayout._15.array.exit.4                            # ir inst 46 fin
.F.testHybridDataLayout._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 47 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 48 fin
  addi t4, t5, 1                                                        # ir inst 49 fin
# Phi connections
  mv t5, t4
  j .F.testHybridDataLayout._13.array.cond.4                            # ir inst 50 fin
.F.testHybridDataLayout._15.array.exit.4:
  li t1, 5008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 52 fin
# Phi connections
  li t5, 0
  j .F.testHybridDataLayout._16.array.cond.5                            # ir inst 53 fin
.F.testHybridDataLayout._16.array.cond.5:
  li t2, 250
  slt t4, t5, t2                                                        # ir inst 55 fin
  bnez t4, .F.testHybridDataLayout._17.array.body.5
  j .F.testHybridDataLayout._18.array.exit.5                            # ir inst 56 fin
.F.testHybridDataLayout._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 57 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 58 fin
  addi t4, t5, 1                                                        # ir inst 59 fin
# Phi connections
  mv t5, t4
  j .F.testHybridDataLayout._16.array.cond.5                            # ir inst 60 fin
.F.testHybridDataLayout._18.array.exit.5:
# Phi connections
  li t6, 0
  j .F.testHybridDataLayout._19.while.cond.0                            # ir inst 61 fin
.F.testHybridDataLayout._19.while.cond.0:
  li t2, 250
  slt t5, t6, t2                                                        # ir inst 63 fin
  bnez t5, .F.testHybridDataLayout._20.while.body.0
  j .F.testHybridDataLayout._21.while.exit.0                            # ir inst 64 fin
.F.testHybridDataLayout._20.while.body.0:
  mv t5, t6                                                             # ir inst 65 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 66 fin
  sw t6, 0(t4)                                                          # ir inst 67 fin
  mv t5, t6                                                             # ir inst 68 fin
  slli t2, t5, 2
  addi t1, sp, 1008
  add t4, t1, t2                                                        # ir inst 69 fin
  slli t5, t6, 1                                                        # ir inst 70 fin
  sw t5, 0(t4)                                                          # ir inst 71 fin
  mv t5, t6                                                             # ir inst 72 fin
  slli t2, t5, 2
  addi t1, sp, 2008
  add t4, t1, t2                                                        # ir inst 73 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 74 fin
  sw t5, 0(t4)                                                          # ir inst 75 fin
  mv t5, t6                                                             # ir inst 76 fin
  slli t2, t5, 2
  li t1, 3008
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 77 fin
  addi t5, t6, 250                                                      # ir inst 78 fin
  sw t5, 0(t4)                                                          # ir inst 79 fin
  mv t5, t6                                                             # ir inst 80 fin
  slli t2, t5, 2
  li t1, 4008
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 81 fin
  addi t5, t6, 250                                                      # ir inst 82 fin
  slli t3, t5, 1                                                        # ir inst 83 fin
  sw t3, 0(t4)                                                          # ir inst 84 fin
  mv t5, t6                                                             # ir inst 85 fin
  slli t2, t5, 2
  li t1, 5008
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 86 fin
  addi t5, t6, 250                                                      # ir inst 87 fin
  li t2, 3
  mul t3, t5, t2                                                        # ir inst 88 fin
  sw t3, 0(t4)                                                          # ir inst 89 fin
  addi t5, t6, 1                                                        # ir inst 90 fin
# Phi connections
  mv t6, t5
  j .F.testHybridDataLayout._19.while.cond.0                            # ir inst 91 fin
.F.testHybridDataLayout._21.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testHybridDataLayout._22.while.cond.1                            # ir inst 92 fin
.F.testHybridDataLayout._22.while.cond.1:
  li t2, 250
  slt t4, t6, t2                                                        # ir inst 95 fin
  bnez t4, .F.testHybridDataLayout._23.while.body.1
  j .F.testHybridDataLayout._24.while.exit.1                            # ir inst 96 fin
.F.testHybridDataLayout._23.while.body.1:
  mv t4, t6                                                             # ir inst 97 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 98 fin
  lw t4, 0(t3)                                                          # ir inst 99 fin
  mv t3, t6                                                             # ir inst 100 fin
  slli t2, t3, 2
  addi t1, sp, 1008
  add s11, t1, t2                                                       # ir inst 101 fin
  lw t3, 0(s11)                                                         # ir inst 102 fin
  add s11, t4, t3                                                       # ir inst 103 fin
  mv t4, t6                                                             # ir inst 104 fin
  slli t2, t4, 2
  addi t1, sp, 2008
  add t3, t1, t2                                                        # ir inst 105 fin
  lw t4, 0(t3)                                                          # ir inst 106 fin
  add t3, s11, t4                                                       # ir inst 107 fin
  add t4, t5, t3                                                        # ir inst 108 fin
  addi t3, t6, 1                                                        # ir inst 109 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testHybridDataLayout._22.while.cond.1                            # ir inst 110 fin
.F.testHybridDataLayout._24.while.exit.1:
# Phi connections
  li t6, 0
  j .F.testHybridDataLayout._25.while.cond.2                            # ir inst 111 fin
.F.testHybridDataLayout._25.while.cond.2:
  li t2, 250
  slt t4, t6, t2                                                        # ir inst 114 fin
  bnez t4, .F.testHybridDataLayout._26.while.body.2
  j .F.testHybridDataLayout._27.while.exit.2                            # ir inst 115 fin
.F.testHybridDataLayout._26.while.body.2:
  mv t4, t6                                                             # ir inst 116 fin
  slli t2, t4, 2
  li t1, 3008
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 117 fin
  lw t4, 0(t3)                                                          # ir inst 118 fin
  mv t3, t6                                                             # ir inst 119 fin
  slli t2, t3, 2
  li t1, 4008
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 120 fin
  lw t3, 0(s11)                                                         # ir inst 121 fin
  add s11, t4, t3                                                       # ir inst 122 fin
  mv t4, t6                                                             # ir inst 123 fin
  slli t2, t4, 2
  li t1, 5008
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 124 fin
  lw t4, 0(t3)                                                          # ir inst 125 fin
  add t3, s11, t4                                                       # ir inst 126 fin
  add t4, t5, t3                                                        # ir inst 127 fin
  addi t3, t6, 1                                                        # ir inst 128 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testHybridDataLayout._25.while.cond.2                            # ir inst 129 fin
.F.testHybridDataLayout._27.while.exit.2:
  mv a0, t5
  j .F.testHybridDataLayout.epilogue                                    # ir inst 130 fin
.F.testHybridDataLayout.epilogue:
  ld s11, 0(sp)
  li t0, 6016
  add sp, sp, t0
  ret

.globl .F.testMemoryStridePatterns
.F.testMemoryStridePatterns:
# spill func args num: 0,             range:     8208(sp) -     8208(sp)
# local var size: 8192,               range:       16(sp) -     8208(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8208
  add sp, sp, t0
  sd ra, 8(sp)
.F.testMemoryStridePatterns._0.entry.0:
# Start call preparation
  li a0, 1507
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testMemoryStridePatterns._1.array.cond.0                         # ir inst 4 fin
.F.testMemoryStridePatterns._1.array.cond.0:
  li t2, 2048
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testMemoryStridePatterns._2.array.body.0
  j .F.testMemoryStridePatterns._3.array.exit.0                         # ir inst 7 fin
.F.testMemoryStridePatterns._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testMemoryStridePatterns._1.array.cond.0                         # ir inst 11 fin
.F.testMemoryStridePatterns._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeStrideTestArray
# ir inst 12 fin
# Start call preparation
  li a1, 1
  addi t1, sp, 16
  mv a0, t1
  call .F.processWithStride
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 2
  addi t1, sp, 16
  mv a0, t1
  call .F.processWithStride
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a1, 4
  addi t1, sp, 16
  mv a0, t1
  call .F.processWithStride
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 8
  addi t1, sp, 16
  mv a0, t1
  call .F.processWithStride
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a1, 16
  addi t1, sp, 16
  mv a0, t1
  call .F.processWithStride
  mv t6, a0
# ir inst 21 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 22 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.processWithComplexStride
  mv t6, a0
# ir inst 23 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 24 fin
# Start call preparation
  li a0, 1508
  call printlnInt
# ir inst 25 fin
  j .F.testMemoryStridePatterns.epilogue                                # ir inst 26 fin
.F.testMemoryStridePatterns.epilogue:
  ld ra, 8(sp)
  li t0, 8208
  add sp, sp, t0
  ret

.globl .F.initializeStrideTestArray
.F.initializeStrideTestArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeStrideTestArray._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeStrideTestArray._1.while.cond.0                        # ir inst 1 fin
.F.initializeStrideTestArray._1.while.cond.0:
  li t2, 2048
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeStrideTestArray._2.while.body.0
  j .F.initializeStrideTestArray._3.while.exit.0                        # ir inst 4 fin
.F.initializeStrideTestArray._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 7 fin
  addi t3, t5, 1                                                        # ir inst 8 fin
  sw t3, 0(t4)                                                          # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.initializeStrideTestArray._1.while.cond.0                        # ir inst 11 fin
.F.initializeStrideTestArray._3.while.exit.0:
  j .F.initializeStrideTestArray.epilogue                               # ir inst 12 fin
.F.initializeStrideTestArray.epilogue:
  ret

.globl .F.processWithStride
.F.processWithStride:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.processWithStride._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.processWithStride._1.while.cond.0                                # ir inst 1 fin
.F.processWithStride._1.while.cond.0:
  li t2, 2048
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.processWithStride._2.while.body.0
  j .F.processWithStride._3.while.exit.0                                # ir inst 5 fin
.F.processWithStride._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  addi t3, t6, 1                                                        # ir inst 9 fin
  mul s11, t4, t3                                                       # ir inst 10 fin
  add t4, t5, s11                                                       # ir inst 11 fin
  add t3, t6, a1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.processWithStride._1.while.cond.0                                # ir inst 13 fin
.F.processWithStride._3.while.exit.0:
  mv a0, t5
  j .F.processWithStride.epilogue                                       # ir inst 14 fin
.F.processWithStride.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.processWithComplexStride
.F.processWithComplexStride:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.processWithComplexStride._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 1
  j .F.processWithComplexStride._1.while.cond.0                         # ir inst 1 fin
.F.processWithComplexStride._1.while.cond.0:
  li t2, 2048
  slt t3, t5, t2                                                        # ir inst 5 fin
  bnez t3, .F.processWithComplexStride._2.while.body.0
  j .F.processWithComplexStride._9.while.exit.0                         # ir inst 6 fin
.F.processWithComplexStride._2.while.body.0:
  mv t3, t5                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  add s11, t4, t3                                                       # ir inst 10 fin
  add t3, t5, t6                                                        # ir inst 11 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 12 fin
  bnez t5, .F.processWithComplexStride._3.if.then.0
  j .F.processWithComplexStride._4.if.else.0                            # ir inst 13 fin
.F.processWithComplexStride._3.if.then.0:
# Phi connections
  li t6, 4
  j .F.processWithComplexStride._8.if.exit.0                            # ir inst 14 fin
.F.processWithComplexStride._4.if.else.0:
  li t2, 4
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 15 fin
  bnez t5, .F.processWithComplexStride._5.if.then.1
  j .F.processWithComplexStride._6.if.else.1                            # ir inst 16 fin
.F.processWithComplexStride._5.if.then.1:
# Phi connections
  li t6, 2
  j .F.processWithComplexStride._7.if.exit.1                            # ir inst 17 fin
.F.processWithComplexStride._6.if.else.1:
# Phi connections
  li t6, 1
  j .F.processWithComplexStride._7.if.exit.1                            # ir inst 18 fin
.F.processWithComplexStride._7.if.exit.1:
# Phi connections
  j .F.processWithComplexStride._8.if.exit.0                            # ir inst 20 fin
.F.processWithComplexStride._8.if.exit.0:
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.processWithComplexStride._1.while.cond.0                         # ir inst 22 fin
.F.processWithComplexStride._9.while.exit.0:
  mv a0, t4
  j .F.processWithComplexStride.epilogue                                # ir inst 23 fin
.F.processWithComplexStride.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testCacheConsciousAlgorithms
.F.testCacheConsciousAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testCacheConsciousAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1509
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.cacheObliviousMatrixMultiplication
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.cacheConsciousSort
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.cacheAwareDataProcessing
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  call .F.temporalLocalityOptimization
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 1510
  call printlnInt
# ir inst 10 fin
  j .F.testCacheConsciousAlgorithms.epilogue                            # ir inst 11 fin
.F.testCacheConsciousAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.cacheObliviousMatrixMultiplication
.F.cacheObliviousMatrixMultiplication:
# spill func args num: 0,             range:      784(sp) -      784(sp)
# local var size: 768,                range:        8(sp) -      776(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -784
  sd ra, 0(sp)
.F.cacheObliviousMatrixMultiplication._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.cacheObliviousMatrixMultiplication._1.array.cond.0               # ir inst 3 fin
.F.cacheObliviousMatrixMultiplication._1.array.cond.0:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.cacheObliviousMatrixMultiplication._2.array.body.0
  j .F.cacheObliviousMatrixMultiplication._3.array.exit.0               # ir inst 6 fin
.F.cacheObliviousMatrixMultiplication._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.cacheObliviousMatrixMultiplication._1.array.cond.0               # ir inst 10 fin
.F.cacheObliviousMatrixMultiplication._3.array.exit.0:
  addi t1, sp, 264
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.cacheObliviousMatrixMultiplication._4.array.cond.1               # ir inst 13 fin
.F.cacheObliviousMatrixMultiplication._4.array.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.cacheObliviousMatrixMultiplication._5.array.body.1
  j .F.cacheObliviousMatrixMultiplication._6.array.exit.1               # ir inst 16 fin
.F.cacheObliviousMatrixMultiplication._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.cacheObliviousMatrixMultiplication._4.array.cond.1               # ir inst 20 fin
.F.cacheObliviousMatrixMultiplication._6.array.exit.1:
  addi t1, sp, 520
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.cacheObliviousMatrixMultiplication._7.array.cond.2               # ir inst 23 fin
.F.cacheObliviousMatrixMultiplication._7.array.cond.2:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.cacheObliviousMatrixMultiplication._8.array.body.2
  j .F.cacheObliviousMatrixMultiplication._9.array.exit.2               # ir inst 26 fin
.F.cacheObliviousMatrixMultiplication._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.cacheObliviousMatrixMultiplication._7.array.cond.2               # ir inst 30 fin
.F.cacheObliviousMatrixMultiplication._9.array.exit.2:
# Phi connections
  li t6, 0
  j .F.cacheObliviousMatrixMultiplication._10.while.cond.0              # ir inst 31 fin
.F.cacheObliviousMatrixMultiplication._10.while.cond.0:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 33 fin
  bnez t5, .F.cacheObliviousMatrixMultiplication._11.while.body.0
  j .F.cacheObliviousMatrixMultiplication._12.while.exit.0              # ir inst 34 fin
.F.cacheObliviousMatrixMultiplication._11.while.body.0:
  mv t5, t6                                                             # ir inst 35 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 36 fin
  li t2, 10
  rem t5, t6, t2                                                        # ir inst 37 fin
  addi t3, t5, 1                                                        # ir inst 38 fin
  sw t3, 0(t4)                                                          # ir inst 39 fin
  mv t5, t6                                                             # ir inst 40 fin
  slli t2, t5, 2
  addi t1, sp, 264
  add t4, t1, t2                                                        # ir inst 41 fin
  slli t5, t6, 1                                                        # ir inst 42 fin
  li t2, 10
  rem t3, t5, t2                                                        # ir inst 43 fin
  addi t5, t3, 1                                                        # ir inst 44 fin
  sw t5, 0(t4)                                                          # ir inst 45 fin
  mv t5, t6                                                             # ir inst 46 fin
  slli t2, t5, 2
  addi t1, sp, 520
  add t4, t1, t2                                                        # ir inst 47 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 48 fin
  addi t5, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F.cacheObliviousMatrixMultiplication._10.while.cond.0              # ir inst 50 fin
.F.cacheObliviousMatrixMultiplication._12.while.exit.0:
# Start call preparation
  li t1, 0
  sd t1, -16(sp)
  li t1, 0
  sd t1, -8(sp)
  li a7, 0
  li a6, 0
  li a5, 0
  li a4, 0
  li a3, 8
  addi t1, sp, 520
  mv a2, t1
  addi t1, sp, 264
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.cacheObliviousMultiplyRecursive
# ir inst 51 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.cacheObliviousMatrixMultiplication._13.while.cond.1              # ir inst 52 fin
.F.cacheObliviousMatrixMultiplication._13.while.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 55 fin
  bnez t4, .F.cacheObliviousMatrixMultiplication._14.while.body.1
  j .F.cacheObliviousMatrixMultiplication._15.while.exit.1              # ir inst 56 fin
.F.cacheObliviousMatrixMultiplication._14.while.body.1:
  mv t4, t5                                                             # ir inst 57 fin
  slli t2, t4, 2
  addi t1, sp, 520
  add t3, t1, t2                                                        # ir inst 58 fin
  lw t4, 0(t3)                                                          # ir inst 59 fin
  add t3, t6, t4                                                        # ir inst 60 fin
  addi t4, t5, 1                                                        # ir inst 61 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.cacheObliviousMatrixMultiplication._13.while.cond.1              # ir inst 62 fin
.F.cacheObliviousMatrixMultiplication._15.while.exit.1:
  mv a0, t6
  j .F.cacheObliviousMatrixMultiplication.epilogue                      # ir inst 63 fin
.F.cacheObliviousMatrixMultiplication.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 784
  ret

.globl .F.cacheObliviousMultiplyRecursive
.F.cacheObliviousMultiplyRecursive:
# spill func args num: 2,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 5 / 12,        range:       64(sp) -      104(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 64(sp)
  sd s7, 72(sp)
  sd s9, 80(sp)
  sd s8, 88(sp)
  sd s10, 96(sp)
  sd ra, 104(sp)
.F.cacheObliviousMultiplyRecursive._0.entry.0:
  li t2, 2
  slt t0, t2, a3
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.cacheObliviousMultiplyRecursive._1.if.then.0
  j .F.cacheObliviousMultiplyRecursive._11.if.else.0                    # ir inst 2 fin
.F.cacheObliviousMultiplyRecursive._1.if.then.0:
# Phi connections
  li t6, 0
  j .F.cacheObliviousMultiplyRecursive._2.while.cond.0                  # ir inst 3 fin
.F.cacheObliviousMultiplyRecursive._2.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 5 fin
  bnez t5, .F.cacheObliviousMultiplyRecursive._3.while.body.0
  j .F.cacheObliviousMultiplyRecursive._10.while.exit.0                 # ir inst 6 fin
.F.cacheObliviousMultiplyRecursive._3.while.body.0:
# Phi connections
  li t5, 0
  j .F.cacheObliviousMultiplyRecursive._4.while.cond.1                  # ir inst 7 fin
.F.cacheObliviousMultiplyRecursive._4.while.cond.1:
  slt t4, t5, a3                                                        # ir inst 9 fin
  bnez t4, .F.cacheObliviousMultiplyRecursive._5.while.body.1
  j .F.cacheObliviousMultiplyRecursive._9.while.exit.1                  # ir inst 10 fin
.F.cacheObliviousMultiplyRecursive._5.while.body.1:
# Phi connections
  li t4, 0
  j .F.cacheObliviousMultiplyRecursive._6.while.cond.2                  # ir inst 11 fin
.F.cacheObliviousMultiplyRecursive._6.while.cond.2:
  slt t3, t4, a3                                                        # ir inst 13 fin
  bnez t3, .F.cacheObliviousMultiplyRecursive._7.while.body.2
  j .F.cacheObliviousMultiplyRecursive._8.while.exit.2                  # ir inst 14 fin
.F.cacheObliviousMultiplyRecursive._7.while.body.2:
  ld t1, 112(sp)
  add t3, t1, t6                                                        # ir inst 15 fin
  slli s11, t3, 3                                                       # ir inst 16 fin
  ld t1, 120(sp)
  add t3, t1, t5                                                        # ir inst 17 fin
  add s10, s11, t3                                                      # ir inst 18 fin
  mv t3, s10                                                            # ir inst 19 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 20 fin
  ld t1, 112(sp)
  add t3, t1, t6                                                        # ir inst 21 fin
  slli s10, t3, 3                                                       # ir inst 22 fin
  ld t1, 120(sp)
  add t3, t1, t5                                                        # ir inst 23 fin
  add s9, s10, t3                                                       # ir inst 24 fin
  mv t3, s9                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 26 fin
  lw t3, 0(s10)                                                         # ir inst 27 fin
  add s10, a4, t6                                                       # ir inst 28 fin
  slli s9, s10, 3                                                       # ir inst 29 fin
  add s10, a5, t4                                                       # ir inst 30 fin
  add s8, s9, s10                                                       # ir inst 31 fin
  mv s10, s8                                                            # ir inst 32 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 33 fin
  lw s10, 0(s9)                                                         # ir inst 34 fin
  add s9, a6, t4                                                        # ir inst 35 fin
  slli s8, s9, 3                                                        # ir inst 36 fin
  add s9, a7, t5                                                        # ir inst 37 fin
  add s7, s8, s9                                                        # ir inst 38 fin
  mv s9, s7                                                             # ir inst 39 fin
  slli t2, s9, 2
  add s8, a1, t2                                                        # ir inst 40 fin
  lw s9, 0(s8)                                                          # ir inst 41 fin
  mul s8, s10, s9                                                       # ir inst 42 fin
  add s10, t3, s8                                                       # ir inst 43 fin
  sw s10, 0(s11)                                                        # ir inst 44 fin
  addi t3, t4, 1                                                        # ir inst 45 fin
# Phi connections
  mv t4, t3
  j .F.cacheObliviousMultiplyRecursive._6.while.cond.2                  # ir inst 46 fin
.F.cacheObliviousMultiplyRecursive._8.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 47 fin
# Phi connections
  mv t5, t4
  j .F.cacheObliviousMultiplyRecursive._4.while.cond.1                  # ir inst 48 fin
.F.cacheObliviousMultiplyRecursive._9.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F.cacheObliviousMultiplyRecursive._2.while.cond.0                  # ir inst 50 fin
.F.cacheObliviousMultiplyRecursive._10.while.exit.0:
  j .F.cacheObliviousMultiplyRecursive.epilogue                         # ir inst 51 fin
.F.cacheObliviousMultiplyRecursive._11.if.else.0:
  j .F.cacheObliviousMultiplyRecursive._12.if.exit.0                    # ir inst 52 fin
.F.cacheObliviousMultiplyRecursive._12.if.exit.0:
  li t2, 2
  div t6, a3, t2                                                        # ir inst 53 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd a5, 32(sp)
  sd a6, 40(sp)
  sd a7, 48(sp)
  sd t6, 56(sp)
  ld t1, 112(sp)
  sd t1, -16(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  mv a3, t6
  call .F.cacheObliviousMultiplyRecursive
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld a5, 32(sp)
  ld a6, 40(sp)
  ld a7, 48(sp)
  ld t6, 56(sp)
# ir inst 54 fin
  add t5, a5, t6                                                        # ir inst 55 fin
  add t4, a6, t6                                                        # ir inst 56 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd t4, 32(sp)
  sd a7, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  ld t1, 112(sp)
  sd t1, -16(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  mv a6, t4
  mv a5, t5
  mv a3, t6
  call .F.cacheObliviousMultiplyRecursive
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld t4, 32(sp)
  ld a7, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 57 fin
  j .F.cacheObliviousMultiplyRecursive.epilogue                         # ir inst 58 fin
.F.cacheObliviousMultiplyRecursive.epilogue:
  ld ra, 104(sp)
  ld s11, 64(sp)
  ld s7, 72(sp)
  ld s9, 80(sp)
  ld s8, 88(sp)
  ld s10, 96(sp)
  addi sp, sp, 128
  ret

.globl .F.cacheConsciousSort
.F.cacheConsciousSort:
# spill func args num: 0,             range:     2064(sp) -     2064(sp)
# local var size: 2048,               range:       16(sp) -     2064(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -2064
  add sp, sp, t0
  sd ra, 8(sp)
.F.cacheConsciousSort._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.cacheConsciousSort._1.array.cond.0                               # ir inst 3 fin
.F.cacheConsciousSort._1.array.cond.0:
  li t2, 512
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.cacheConsciousSort._2.array.body.0
  j .F.cacheConsciousSort._3.array.exit.0                               # ir inst 6 fin
.F.cacheConsciousSort._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.cacheConsciousSort._1.array.cond.0                               # ir inst 10 fin
.F.cacheConsciousSort._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeSortTestData
# ir inst 11 fin
# Start call preparation
  li a2, 511
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.cacheConsciousMergeSort
  mv t6, a0
# ir inst 12 fin
  mv a0, t6
  j .F.cacheConsciousSort.epilogue                                      # ir inst 13 fin
.F.cacheConsciousSort.epilogue:
  ld ra, 8(sp)
  li t0, 2064
  add sp, sp, t0
  ret

.globl .F.initializeSortTestData
.F.initializeSortTestData:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeSortTestData._0.entry.0:
# Phi connections
  li t5, 13579
  li t6, 0
  j .F.initializeSortTestData._1.while.cond.0                           # ir inst 1 fin
.F.initializeSortTestData._1.while.cond.0:
  li t2, 512
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.initializeSortTestData._2.while.body.0
  j .F.initializeSortTestData._6.while.exit.0                           # ir inst 5 fin
.F.initializeSortTestData._2.while.body.0:
  li t2, 1103
  mul t4, t5, t2                                                        # ir inst 6 fin
  li t2, 4721
  add t5, t4, t2                                                        # ir inst 7 fin
  li t2, 1048583
  rem t4, t5, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 9 fin
  bnez t5, .F.initializeSortTestData._3.if.then.0
  j .F.initializeSortTestData._4.if.else.0                              # ir inst 10 fin
.F.initializeSortTestData._3.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 11 fin
# Phi connections
  j .F.initializeSortTestData._5.if.exit.0                              # ir inst 12 fin
.F.initializeSortTestData._4.if.else.0:
# Phi connections
  mv t5, t4
  j .F.initializeSortTestData._5.if.exit.0                              # ir inst 13 fin
.F.initializeSortTestData._5.if.exit.0:
  mv t4, t6                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 16 fin
  li t2, 1000
  rem t4, t5, t2                                                        # ir inst 17 fin
  sw t4, 0(t3)                                                          # ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F.initializeSortTestData._1.while.cond.0                           # ir inst 20 fin
.F.initializeSortTestData._6.while.exit.0:
  j .F.initializeSortTestData.epilogue                                  # ir inst 21 fin
.F.initializeSortTestData.epilogue:
  ret

.globl .F.cacheConsciousMergeSort
.F.cacheConsciousMergeSort:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.cacheConsciousMergeSort._0.entry.0:
  slt t0, a1, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.cacheConsciousMergeSort._1.if.then.0
  j .F.cacheConsciousMergeSort._2.if.else.0                             # ir inst 2 fin
.F.cacheConsciousMergeSort._1.if.then.0:
  li a0, 0
  j .F.cacheConsciousMergeSort.epilogue                                 # ir inst 3 fin
.F.cacheConsciousMergeSort._2.if.else.0:
  j .F.cacheConsciousMergeSort._3.if.exit.0                             # ir inst 4 fin
.F.cacheConsciousMergeSort._3.if.exit.0:
  sub t6, a2, a1                                                        # ir inst 5 fin
  addi t5, t6, 1                                                        # ir inst 6 fin
  li t2, 16
  slt t0, t2, t5
  xori t6, t0, 1                                                        # ir inst 7 fin
  bnez t6, .F.cacheConsciousMergeSort._4.if.then.1
  j .F.cacheConsciousMergeSort._5.if.else.1                             # ir inst 8 fin
.F.cacheConsciousMergeSort._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.insertionSort
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 9 fin
  mv a0, t6
  j .F.cacheConsciousMergeSort.epilogue                                 # ir inst 10 fin
.F.cacheConsciousMergeSort._5.if.else.1:
  j .F.cacheConsciousMergeSort._6.if.exit.1                             # ir inst 11 fin
.F.cacheConsciousMergeSort._6.if.exit.1:
  sub t6, a2, a1                                                        # ir inst 12 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 13 fin
  add t6, a1, t5                                                        # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  call .F.cacheConsciousMergeSort
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 15 fin
  addi t4, t6, 1                                                        # ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t4
  call .F.cacheConsciousMergeSort
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, a2
  mv a2, t6
  call .F.cacheFriendlyMerge
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 18 fin
  add t6, t5, t3                                                        # ir inst 19 fin
  add t5, t6, t4                                                        # ir inst 20 fin
  mv a0, t5
  j .F.cacheConsciousMergeSort.epilogue                                 # ir inst 21 fin
.F.cacheConsciousMergeSort.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.insertionSort
.F.insertionSort:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
.F.insertionSort._0.entry.0:
  addi t6, a1, 1                                                        # ir inst 1 fin
# Phi connections
  li t5, 0
  j .F.insertionSort._1.while.cond.0                                    # ir inst 2 fin
.F.insertionSort._1.while.cond.0:
  slt t0, a2, t6
  xori t4, t0, 1                                                        # ir inst 5 fin
  bnez t4, .F.insertionSort._2.while.body.0
  j .F.insertionSort._12.while.exit.0                                   # ir inst 6 fin
.F.insertionSort._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  addi t3, t6, -1                                                       # ir inst 10 fin
# Phi connections
  mv s11, t5
  j .F.insertionSort._3.while.cond.1                                    # ir inst 11 fin
.F.insertionSort._3.while.cond.1:
  slt t0, t3, a1
  xori s10, t0, 1                                                       # ir inst 14 fin
  bnez s10, .F.insertionSort._4.lazy.then.0
  j .F.insertionSort._5.lazy.else.0                                     # ir inst 15 fin
.F.insertionSort._4.lazy.then.0:
  mv s10, t3                                                            # ir inst 16 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 17 fin
  lw s10, 0(s9)                                                         # ir inst 18 fin
  slt s9, t4, s10                                                       # ir inst 19 fin
# Phi connections
  mv s10, s9
  j .F.insertionSort._6.lazy.exit.0                                     # ir inst 20 fin
.F.insertionSort._5.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.insertionSort._6.lazy.exit.0                                     # ir inst 21 fin
.F.insertionSort._6.lazy.exit.0:
  bnez s10, .F.insertionSort._7.while.body.1
  j .F.insertionSort._8.while.exit.1                                    # ir inst 23 fin
.F.insertionSort._7.while.body.1:
  addi s10, t3, 1                                                       # ir inst 24 fin
  mv s9, s10                                                            # ir inst 25 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 26 fin
  mv s9, t3                                                             # ir inst 27 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 28 fin
  lw s9, 0(s8)                                                          # ir inst 29 fin
  sw s9, 0(s10)                                                         # ir inst 30 fin
  addi s10, t3, -1                                                      # ir inst 31 fin
  addi s9, s11, 1                                                       # ir inst 32 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  j .F.insertionSort._3.while.cond.1                                    # ir inst 33 fin
.F.insertionSort._8.while.exit.1:
  slt t0, t3, a1
  xori s10, t0, 1                                                       # ir inst 34 fin
  bnez s10, .F.insertionSort._9.if.then.0
  j .F.insertionSort._10.if.else.0                                      # ir inst 35 fin
.F.insertionSort._9.if.then.0:
  addi s10, s11, 1                                                      # ir inst 36 fin
# Phi connections
  mv s11, s10
  j .F.insertionSort._11.if.exit.0                                      # ir inst 37 fin
.F.insertionSort._10.if.else.0:
# Phi connections
  j .F.insertionSort._11.if.exit.0                                      # ir inst 38 fin
.F.insertionSort._11.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 40 fin
  mv t3, s10                                                            # ir inst 41 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 42 fin
  sw t4, 0(s10)                                                         # ir inst 43 fin
  addi t4, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j .F.insertionSort._1.while.cond.0                                    # ir inst 45 fin
.F.insertionSort._12.while.exit.0:
  mv a0, t5
  j .F.insertionSort.epilogue                                           # ir inst 46 fin
.F.insertionSort.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.cacheFriendlyMerge
.F.cacheFriendlyMerge:
# spill func args num: 0,             range:     1072(sp) -     1072(sp)
# local var size: 1024,               range:       48(sp) -     1072(sp)
# return addr size: 0,                range:       48(sp) -       48(sp)
# callee save reg num: 6 / 12,        range:        0(sp) -       48(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1072
  sd s6, 0(sp)
  sd s8, 8(sp)
  sd s7, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s11, 40(sp)
.F.cacheFriendlyMerge._0.entry.0:
  sub t6, a2, a1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  sub t6, a3, a2                                                        # ir inst 3 fin
  addi t1, sp, 48
  addi t4, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t3, 0
  j .F.cacheFriendlyMerge._1.array.cond.0                               # ir inst 6 fin
.F.cacheFriendlyMerge._1.array.cond.0:
  li t2, 128
  slt s11, t3, t2                                                       # ir inst 8 fin
  bnez s11, .F.cacheFriendlyMerge._2.array.body.0
  j .F.cacheFriendlyMerge._3.array.exit.0                               # ir inst 9 fin
.F.cacheFriendlyMerge._2.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 10 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 11 fin
  addi s11, t3, 1                                                       # ir inst 12 fin
# Phi connections
  mv t3, s11
  j .F.cacheFriendlyMerge._1.array.cond.0                               # ir inst 13 fin
.F.cacheFriendlyMerge._3.array.exit.0:
  addi t1, sp, 560
  addi t4, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t3, 0
  j .F.cacheFriendlyMerge._4.array.cond.1                               # ir inst 16 fin
.F.cacheFriendlyMerge._4.array.cond.1:
  li t2, 128
  slt s11, t3, t2                                                       # ir inst 18 fin
  bnez s11, .F.cacheFriendlyMerge._5.array.body.1
  j .F.cacheFriendlyMerge._6.array.exit.1                               # ir inst 19 fin
.F.cacheFriendlyMerge._5.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 20 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 21 fin
  addi s11, t3, 1                                                       # ir inst 22 fin
# Phi connections
  mv t3, s11
  j .F.cacheFriendlyMerge._4.array.cond.1                               # ir inst 23 fin
.F.cacheFriendlyMerge._6.array.exit.1:
# Phi connections
  li t4, 0
  j .F.cacheFriendlyMerge._7.while.cond.0                               # ir inst 24 fin
.F.cacheFriendlyMerge._7.while.cond.0:
  slt t3, t4, t5                                                        # ir inst 26 fin
  bnez t3, .F.cacheFriendlyMerge._8.lazy.then.0
  j .F.cacheFriendlyMerge._9.lazy.else.0                                # ir inst 27 fin
.F.cacheFriendlyMerge._8.lazy.then.0:
  li t2, 128
  slt t3, t4, t2                                                        # ir inst 28 fin
# Phi connections
  j .F.cacheFriendlyMerge._10.lazy.exit.0                               # ir inst 29 fin
.F.cacheFriendlyMerge._9.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.cacheFriendlyMerge._10.lazy.exit.0                               # ir inst 30 fin
.F.cacheFriendlyMerge._10.lazy.exit.0:
  bnez t3, .F.cacheFriendlyMerge._11.while.body.0
  j .F.cacheFriendlyMerge._12.while.exit.0                              # ir inst 32 fin
.F.cacheFriendlyMerge._11.while.body.0:
  mv t3, t4                                                             # ir inst 33 fin
  slli t2, t3, 2
  addi t1, sp, 48
  add s11, t1, t2                                                       # ir inst 34 fin
  add t3, a1, t4                                                        # ir inst 35 fin
  mv s10, t3                                                            # ir inst 36 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 37 fin
  lw s10, 0(t3)                                                         # ir inst 38 fin
  sw s10, 0(s11)                                                        # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F.cacheFriendlyMerge._7.while.cond.0                               # ir inst 41 fin
.F.cacheFriendlyMerge._12.while.exit.0:
# Phi connections
  li t4, 0
  j .F.cacheFriendlyMerge._13.while.cond.1                              # ir inst 42 fin
.F.cacheFriendlyMerge._13.while.cond.1:
  slt t3, t4, t6                                                        # ir inst 44 fin
  bnez t3, .F.cacheFriendlyMerge._14.lazy.then.1
  j .F.cacheFriendlyMerge._15.lazy.else.1                               # ir inst 45 fin
.F.cacheFriendlyMerge._14.lazy.then.1:
  li t2, 128
  slt t3, t4, t2                                                        # ir inst 46 fin
# Phi connections
  j .F.cacheFriendlyMerge._16.lazy.exit.1                               # ir inst 47 fin
.F.cacheFriendlyMerge._15.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.cacheFriendlyMerge._16.lazy.exit.1                               # ir inst 48 fin
.F.cacheFriendlyMerge._16.lazy.exit.1:
  bnez t3, .F.cacheFriendlyMerge._17.while.body.1
  j .F.cacheFriendlyMerge._18.while.exit.1                              # ir inst 50 fin
.F.cacheFriendlyMerge._17.while.body.1:
  mv t3, t4                                                             # ir inst 51 fin
  slli t2, t3, 2
  addi t1, sp, 560
  add s11, t1, t2                                                       # ir inst 52 fin
  addi t3, a2, 1                                                        # ir inst 53 fin
  add s10, t3, t4                                                       # ir inst 54 fin
  mv t3, s10                                                            # ir inst 55 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 56 fin
  lw t3, 0(s10)                                                         # ir inst 57 fin
  sw t3, 0(s11)                                                         # ir inst 58 fin
  addi t3, t4, 1                                                        # ir inst 59 fin
# Phi connections
  mv t4, t3
  j .F.cacheFriendlyMerge._13.while.cond.1                              # ir inst 60 fin
.F.cacheFriendlyMerge._18.while.exit.1:
# Phi connections
  li s10, 0
  li s11, 0
  li t3, 0
  mv t4, a1
  j .F.cacheFriendlyMerge._19.while.cond.2                              # ir inst 61 fin
.F.cacheFriendlyMerge._19.while.cond.2:
  slt s9, s10, t5                                                       # ir inst 66 fin
  bnez s9, .F.cacheFriendlyMerge._20.lazy.then.2
  j .F.cacheFriendlyMerge._21.lazy.else.2                               # ir inst 67 fin
.F.cacheFriendlyMerge._20.lazy.then.2:
  slt s9, s11, t6                                                       # ir inst 68 fin
# Phi connections
  j .F.cacheFriendlyMerge._22.lazy.exit.2                               # ir inst 69 fin
.F.cacheFriendlyMerge._21.lazy.else.2:
# Phi connections
  li s9, 0
  j .F.cacheFriendlyMerge._22.lazy.exit.2                               # ir inst 70 fin
.F.cacheFriendlyMerge._22.lazy.exit.2:
  bnez s9, .F.cacheFriendlyMerge._23.lazy.then.3
  j .F.cacheFriendlyMerge._24.lazy.else.3                               # ir inst 72 fin
.F.cacheFriendlyMerge._23.lazy.then.3:
  li t2, 128
  slt s9, s10, t2                                                       # ir inst 73 fin
# Phi connections
  j .F.cacheFriendlyMerge._25.lazy.exit.3                               # ir inst 74 fin
.F.cacheFriendlyMerge._24.lazy.else.3:
# Phi connections
  li s9, 0
  j .F.cacheFriendlyMerge._25.lazy.exit.3                               # ir inst 75 fin
.F.cacheFriendlyMerge._25.lazy.exit.3:
  bnez s9, .F.cacheFriendlyMerge._26.lazy.then.4
  j .F.cacheFriendlyMerge._27.lazy.else.4                               # ir inst 77 fin
.F.cacheFriendlyMerge._26.lazy.then.4:
  li t2, 128
  slt s9, s11, t2                                                       # ir inst 78 fin
# Phi connections
  j .F.cacheFriendlyMerge._28.lazy.exit.4                               # ir inst 79 fin
.F.cacheFriendlyMerge._27.lazy.else.4:
# Phi connections
  li s9, 0
  j .F.cacheFriendlyMerge._28.lazy.exit.4                               # ir inst 80 fin
.F.cacheFriendlyMerge._28.lazy.exit.4:
  bnez s9, .F.cacheFriendlyMerge._29.while.body.2
  j .F.cacheFriendlyMerge._33.while.exit.2                              # ir inst 82 fin
.F.cacheFriendlyMerge._29.while.body.2:
  addi s9, t3, 1                                                        # ir inst 83 fin
  mv s8, s10                                                            # ir inst 84 fin
  slli t2, s8, 2
  addi t1, sp, 48
  add s7, t1, t2                                                        # ir inst 85 fin
  lw s8, 0(s7)                                                          # ir inst 86 fin
  mv s7, s11                                                            # ir inst 87 fin
  slli t2, s7, 2
  addi t1, sp, 560
  add s6, t1, t2                                                        # ir inst 88 fin
  lw s7, 0(s6)                                                          # ir inst 89 fin
  slt t0, s7, s8
  xori s6, t0, 1                                                        # ir inst 90 fin
  bnez s6, .F.cacheFriendlyMerge._30.if.then.0
  j .F.cacheFriendlyMerge._31.if.else.0                                 # ir inst 91 fin
.F.cacheFriendlyMerge._30.if.then.0:
  mv s8, t4                                                             # ir inst 92 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 93 fin
  mv s8, s10                                                            # ir inst 94 fin
  slli t2, s8, 2
  addi t1, sp, 48
  add s6, t1, t2                                                        # ir inst 95 fin
  lw s8, 0(s6)                                                          # ir inst 96 fin
  sw s8, 0(s7)                                                          # ir inst 97 fin
  addi s8, s10, 1                                                       # ir inst 98 fin
# Phi connections
  mv s7, s8
  mv s8, s11
  j .F.cacheFriendlyMerge._32.if.exit.0                                 # ir inst 99 fin
.F.cacheFriendlyMerge._31.if.else.0:
  mv s8, t4                                                             # ir inst 100 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 101 fin
  mv s8, s11                                                            # ir inst 102 fin
  slli t2, s8, 2
  addi t1, sp, 560
  add s6, t1, t2                                                        # ir inst 103 fin
  lw s8, 0(s6)                                                          # ir inst 104 fin
  sw s8, 0(s7)                                                          # ir inst 105 fin
  addi s8, s11, 1                                                       # ir inst 106 fin
# Phi connections
  mv s7, s10
  j .F.cacheFriendlyMerge._32.if.exit.0                                 # ir inst 107 fin
.F.cacheFriendlyMerge._32.if.exit.0:
  addi s6, t4, 1                                                        # ir inst 110 fin
# Phi connections
  mv s10, s7
  mv s11, s8
  mv t3, s9
  mv t4, s6
  j .F.cacheFriendlyMerge._19.while.cond.2                              # ir inst 111 fin
.F.cacheFriendlyMerge._33.while.exit.2:
# Phi connections
  j .F.cacheFriendlyMerge._34.while.cond.3                              # ir inst 112 fin
.F.cacheFriendlyMerge._34.while.cond.3:
  slt s9, s10, t5                                                       # ir inst 115 fin
  bnez s9, .F.cacheFriendlyMerge._35.lazy.then.5
  j .F.cacheFriendlyMerge._36.lazy.else.5                               # ir inst 116 fin
.F.cacheFriendlyMerge._35.lazy.then.5:
  li t2, 128
  slt s9, s10, t2                                                       # ir inst 117 fin
# Phi connections
  j .F.cacheFriendlyMerge._37.lazy.exit.5                               # ir inst 118 fin
.F.cacheFriendlyMerge._36.lazy.else.5:
# Phi connections
  li s9, 0
  j .F.cacheFriendlyMerge._37.lazy.exit.5                               # ir inst 119 fin
.F.cacheFriendlyMerge._37.lazy.exit.5:
  bnez s9, .F.cacheFriendlyMerge._38.while.body.3
  j .F.cacheFriendlyMerge._39.while.exit.3                              # ir inst 121 fin
.F.cacheFriendlyMerge._38.while.body.3:
  mv s9, t4                                                             # ir inst 122 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 123 fin
  mv s9, s10                                                            # ir inst 124 fin
  slli t2, s9, 2
  addi t1, sp, 48
  add s7, t1, t2                                                        # ir inst 125 fin
  lw s9, 0(s7)                                                          # ir inst 126 fin
  sw s9, 0(s8)                                                          # ir inst 127 fin
  addi s9, s10, 1                                                       # ir inst 128 fin
  addi s10, t4, 1                                                       # ir inst 129 fin
# Phi connections
  mv t4, s10
  mv s10, s9
  j .F.cacheFriendlyMerge._34.while.cond.3                              # ir inst 130 fin
.F.cacheFriendlyMerge._39.while.exit.3:
# Phi connections
  mv t5, t4
  mv t4, s11
  j .F.cacheFriendlyMerge._40.while.cond.4                              # ir inst 131 fin
.F.cacheFriendlyMerge._40.while.cond.4:
  slt s11, t4, t6                                                       # ir inst 134 fin
  bnez s11, .F.cacheFriendlyMerge._41.lazy.then.6
  j .F.cacheFriendlyMerge._42.lazy.else.6                               # ir inst 135 fin
.F.cacheFriendlyMerge._41.lazy.then.6:
  li t2, 128
  slt s11, t4, t2                                                       # ir inst 136 fin
# Phi connections
  j .F.cacheFriendlyMerge._43.lazy.exit.6                               # ir inst 137 fin
.F.cacheFriendlyMerge._42.lazy.else.6:
# Phi connections
  li s11, 0
  j .F.cacheFriendlyMerge._43.lazy.exit.6                               # ir inst 138 fin
.F.cacheFriendlyMerge._43.lazy.exit.6:
  bnez s11, .F.cacheFriendlyMerge._44.while.body.4
  j .F.cacheFriendlyMerge._45.while.exit.4                              # ir inst 140 fin
.F.cacheFriendlyMerge._44.while.body.4:
  mv s11, t5                                                            # ir inst 141 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 142 fin
  mv s11, t4                                                            # ir inst 143 fin
  slli t2, s11, 2
  addi t1, sp, 560
  add s9, t1, t2                                                        # ir inst 144 fin
  lw s11, 0(s9)                                                         # ir inst 145 fin
  sw s11, 0(s10)                                                        # ir inst 146 fin
  addi s11, t4, 1                                                       # ir inst 147 fin
  addi t4, t5, 1                                                        # ir inst 148 fin
# Phi connections
  mv t5, t4
  mv t4, s11
  j .F.cacheFriendlyMerge._40.while.cond.4                              # ir inst 149 fin
.F.cacheFriendlyMerge._45.while.exit.4:
  mv a0, t3
  j .F.cacheFriendlyMerge.epilogue                                      # ir inst 150 fin
.F.cacheFriendlyMerge.epilogue:
  ld s6, 0(sp)
  ld s8, 8(sp)
  ld s7, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 1072
  ret

.globl .F.cacheAwareDataProcessing
.F.cacheAwareDataProcessing:
# spill func args num: 0,             range:     4112(sp) -     4112(sp)
# local var size: 4096,               range:       16(sp) -     4112(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4112
  add sp, sp, t0
  sd ra, 8(sp)
.F.cacheAwareDataProcessing._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.cacheAwareDataProcessing._1.array.cond.0                         # ir inst 3 fin
.F.cacheAwareDataProcessing._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.cacheAwareDataProcessing._2.array.body.0
  j .F.cacheAwareDataProcessing._3.array.exit.0                         # ir inst 6 fin
.F.cacheAwareDataProcessing._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.cacheAwareDataProcessing._1.array.cond.0                         # ir inst 10 fin
.F.cacheAwareDataProcessing._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeDataGrid
# ir inst 11 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.processDataInBlocks
  mv t6, a0
# ir inst 12 fin
  mv a0, t6
  j .F.cacheAwareDataProcessing.epilogue                                # ir inst 13 fin
.F.cacheAwareDataProcessing.epilogue:
  ld ra, 8(sp)
  li t0, 4112
  add sp, sp, t0
  ret

.globl .F.initializeDataGrid
.F.initializeDataGrid:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeDataGrid._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeDataGrid._1.while.cond.0                               # ir inst 1 fin
.F.initializeDataGrid._1.while.cond.0:
  li t2, 1024
  sltu t5, t6, t2                                                       # ir inst 3 fin
  bnez t5, .F.initializeDataGrid._2.while.body.0
  j .F.initializeDataGrid._3.while.exit.0                               # ir inst 4 fin
.F.initializeDataGrid._2.while.body.0:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 5 fin
  li t2, 50
  remu t4, t6, t2                                                       # ir inst 6 fin
  mv t3, t4                                                             # ir inst 7 fin
  addi t4, t3, 1                                                        # ir inst 8 fin
  sw t4, 0(t5)                                                          # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.initializeDataGrid._1.while.cond.0                               # ir inst 11 fin
.F.initializeDataGrid._3.while.exit.0:
  j .F.initializeDataGrid.epilogue                                      # ir inst 12 fin
.F.initializeDataGrid.epilogue:
  ret

.globl .F.processDataInBlocks
.F.processDataInBlocks:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s1, 0(sp)
  sd s6, 8(sp)
  sd s7, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s5, 40(sp)
  sd s0, 48(sp)
  sd s8, 56(sp)
  sd s11, 64(sp)
.F.processDataInBlocks._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.processDataInBlocks._1.while.cond.0                              # ir inst 1 fin
.F.processDataInBlocks._1.while.cond.0:
  li t2, 32
  sltu t4, t6, t2                                                       # ir inst 4 fin
  bnez t4, .F.processDataInBlocks._2.while.body.0
  j .F.processDataInBlocks._18.while.exit.0                             # ir inst 5 fin
.F.processDataInBlocks._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.processDataInBlocks._3.while.cond.1                              # ir inst 6 fin
.F.processDataInBlocks._3.while.cond.1:
  li t2, 32
  sltu s11, t4, t2                                                      # ir inst 9 fin
  bnez s11, .F.processDataInBlocks._4.while.body.1
  j .F.processDataInBlocks._17.while.exit.1                             # ir inst 10 fin
.F.processDataInBlocks._4.while.body.1:
  addi s11, t6, 8                                                       # ir inst 11 fin
# Phi connections
  mv s9, t3
  mv s10, t6
  j .F.processDataInBlocks._5.while.cond.2                              # ir inst 12 fin
.F.processDataInBlocks._5.while.cond.2:
  sltu s8, s10, s11                                                     # ir inst 15 fin
  bnez s8, .F.processDataInBlocks._6.lazy.then.0
  j .F.processDataInBlocks._7.lazy.else.0                               # ir inst 16 fin
.F.processDataInBlocks._6.lazy.then.0:
  li t2, 32
  sltu s8, s10, t2                                                      # ir inst 17 fin
# Phi connections
  j .F.processDataInBlocks._8.lazy.exit.0                               # ir inst 18 fin
.F.processDataInBlocks._7.lazy.else.0:
# Phi connections
  li s8, 0
  j .F.processDataInBlocks._8.lazy.exit.0                               # ir inst 19 fin
.F.processDataInBlocks._8.lazy.exit.0:
  bnez s8, .F.processDataInBlocks._9.while.body.2
  j .F.processDataInBlocks._16.while.exit.2                             # ir inst 21 fin
.F.processDataInBlocks._9.while.body.2:
  addi s8, t4, 8                                                        # ir inst 22 fin
# Phi connections
  mv s6, t4
  mv s7, s9
  j .F.processDataInBlocks._10.while.cond.3                             # ir inst 23 fin
.F.processDataInBlocks._10.while.cond.3:
  sltu s5, s6, s8                                                       # ir inst 26 fin
  bnez s5, .F.processDataInBlocks._11.lazy.then.1
  j .F.processDataInBlocks._12.lazy.else.1                              # ir inst 27 fin
.F.processDataInBlocks._11.lazy.then.1:
  li t2, 32
  sltu s5, s6, t2                                                       # ir inst 28 fin
# Phi connections
  j .F.processDataInBlocks._13.lazy.exit.1                              # ir inst 29 fin
.F.processDataInBlocks._12.lazy.else.1:
# Phi connections
  li s5, 0
  j .F.processDataInBlocks._13.lazy.exit.1                              # ir inst 30 fin
.F.processDataInBlocks._13.lazy.exit.1:
  bnez s5, .F.processDataInBlocks._14.while.body.3
  j .F.processDataInBlocks._15.while.exit.3                             # ir inst 32 fin
.F.processDataInBlocks._14.while.body.3:
  slli s5, s10, 5                                                       # ir inst 33 fin
  add s0, s5, s6                                                        # ir inst 34 fin
  slli t2, s0, 2
  add s5, a0, t2                                                        # ir inst 35 fin
  slli t2, s0, 2
  add s1, a0, t2                                                        # ir inst 36 fin
  lw a1, 0(s1)                                                          # ir inst 37 fin
  slli s1, a1, 1                                                        # ir inst 38 fin
  addi a1, s1, 1                                                        # ir inst 39 fin
  sw a1, 0(s5)                                                          # ir inst 40 fin
  slli t2, s0, 2
  add s5, a0, t2                                                        # ir inst 41 fin
  lw s0, 0(s5)                                                          # ir inst 42 fin
  add s5, s7, s0                                                        # ir inst 43 fin
  addi s0, s6, 1                                                        # ir inst 44 fin
# Phi connections
  mv s6, s0
  mv s7, s5
  j .F.processDataInBlocks._10.while.cond.3                             # ir inst 45 fin
.F.processDataInBlocks._15.while.exit.3:
  addi s8, s10, 1                                                       # ir inst 46 fin
# Phi connections
  mv s9, s7
  mv s10, s8
  j .F.processDataInBlocks._5.while.cond.2                              # ir inst 47 fin
.F.processDataInBlocks._16.while.exit.2:
  addi s11, t4, 8                                                       # ir inst 48 fin
# Phi connections
  mv t3, s9
  mv t4, s11
  j .F.processDataInBlocks._3.while.cond.1                              # ir inst 49 fin
.F.processDataInBlocks._17.while.exit.1:
  addi t4, t6, 8                                                        # ir inst 50 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.processDataInBlocks._1.while.cond.0                              # ir inst 51 fin
.F.processDataInBlocks._18.while.exit.0:
  mv a0, t5
  j .F.processDataInBlocks.epilogue                                     # ir inst 52 fin
.F.processDataInBlocks.epilogue:
  ld s1, 0(sp)
  ld s6, 8(sp)
  ld s7, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s5, 40(sp)
  ld s0, 48(sp)
  ld s8, 56(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.temporalLocalityOptimization
.F.temporalLocalityOptimization:
# spill func args num: 0,             range:     1056(sp) -     1056(sp)
# local var size: 1024,               range:       32(sp) -     1056(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1056
  sd ra, 24(sp)
.F.temporalLocalityOptimization._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.temporalLocalityOptimization._1.array.cond.0                     # ir inst 3 fin
.F.temporalLocalityOptimization._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.temporalLocalityOptimization._2.array.body.0
  j .F.temporalLocalityOptimization._3.array.exit.0                     # ir inst 6 fin
.F.temporalLocalityOptimization._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.temporalLocalityOptimization._1.array.cond.0                     # ir inst 10 fin
.F.temporalLocalityOptimization._3.array.exit.0:
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.initializeWorkingSet
# ir inst 11 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.temporalLocalityOptimization._4.while.cond.0                     # ir inst 12 fin
.F.temporalLocalityOptimization._4.while.cond.0:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F.temporalLocalityOptimization._5.while.body.0
  j .F.temporalLocalityOptimization._6.while.exit.0                     # ir inst 16 fin
.F.temporalLocalityOptimization._5.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 32
  mv a0, t1
  call .F.processWorkingSet
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 17 fin
  add t3, t5, t4                                                        # ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.temporalLocalityOptimization._4.while.cond.0                     # ir inst 20 fin
.F.temporalLocalityOptimization._6.while.exit.0:
  mv a0, t5
  j .F.temporalLocalityOptimization.epilogue                            # ir inst 21 fin
.F.temporalLocalityOptimization.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 1056
  ret

.globl .F.initializeWorkingSet
.F.initializeWorkingSet:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeWorkingSet._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeWorkingSet._1.while.cond.0                             # ir inst 1 fin
.F.initializeWorkingSet._1.while.cond.0:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeWorkingSet._2.while.body.0
  j .F.initializeWorkingSet._3.while.exit.0                             # ir inst 4 fin
.F.initializeWorkingSet._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  addi t5, t6, 1                                                        # ir inst 7 fin
  sw t5, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.initializeWorkingSet._1.while.cond.0                             # ir inst 10 fin
.F.initializeWorkingSet._3.while.exit.0:
  j .F.initializeWorkingSet.epilogue                                    # ir inst 11 fin
.F.initializeWorkingSet.epilogue:
  ret

.globl .F.processWorkingSet
.F.processWorkingSet:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.processWorkingSet._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.processWorkingSet._1.while.cond.0                                # ir inst 1 fin
.F.processWorkingSet._1.while.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.processWorkingSet._2.while.body.0
  j .F.processWorkingSet._3.while.exit.0                                # ir inst 5 fin
.F.processWorkingSet._2.while.body.0:
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  mv t4, t5                                                             # ir inst 8 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 9 fin
  lw t4, 0(s11)                                                         # ir inst 10 fin
  addi s11, t4, 1                                                       # ir inst 11 fin
  sw s11, 0(t3)                                                         # ir inst 12 fin
  addi t4, t6, 1                                                        # ir inst 13 fin
  addi t3, t5, 1                                                        # ir inst 14 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.processWorkingSet._1.while.cond.0                                # ir inst 15 fin
.F.processWorkingSet._3.while.exit.0:
# Phi connections
  li t5, 0
  j .F.processWorkingSet._4.while.cond.1                                # ir inst 16 fin
.F.processWorkingSet._4.while.cond.1:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 19 fin
  bnez t4, .F.processWorkingSet._5.while.body.1
  j .F.processWorkingSet._6.while.exit.1                                # ir inst 20 fin
.F.processWorkingSet._5.while.body.1:
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 22 fin
  mv t4, t5                                                             # ir inst 23 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 24 fin
  lw t4, 0(s11)                                                         # ir inst 25 fin
  slli s11, t4, 1                                                       # ir inst 26 fin
  sw s11, 0(t3)                                                         # ir inst 27 fin
  addi t4, t6, 1                                                        # ir inst 28 fin
  addi t3, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.processWorkingSet._4.while.cond.1                                # ir inst 30 fin
.F.processWorkingSet._6.while.exit.1:
# Phi connections
  li t5, 0
  j .F.processWorkingSet._7.while.cond.2                                # ir inst 31 fin
.F.processWorkingSet._7.while.cond.2:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 34 fin
  bnez t4, .F.processWorkingSet._8.while.body.2
  j .F.processWorkingSet._12.while.exit.2                               # ir inst 35 fin
.F.processWorkingSet._8.while.body.2:
  mv t4, t5                                                             # ir inst 36 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 37 fin
  lw t4, 0(t3)                                                          # ir inst 38 fin
  li t2, 2
  rem t3, t4, t2                                                        # ir inst 39 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 40 fin
  bnez t4, .F.processWorkingSet._9.if.then.0
  j .F.processWorkingSet._10.if.else.0                                  # ir inst 41 fin
.F.processWorkingSet._9.if.then.0:
  mv t4, t5                                                             # ir inst 42 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 43 fin
  mv t4, t5                                                             # ir inst 44 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 45 fin
  lw t4, 0(s11)                                                         # ir inst 46 fin
  li t2, 2
  div s11, t4, t2                                                       # ir inst 47 fin
  sw s11, 0(t3)                                                         # ir inst 48 fin
  j .F.processWorkingSet._11.if.exit.0                                  # ir inst 49 fin
.F.processWorkingSet._10.if.else.0:
  j .F.processWorkingSet._11.if.exit.0                                  # ir inst 50 fin
.F.processWorkingSet._11.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 51 fin
  addi t3, t5, 1                                                        # ir inst 52 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.processWorkingSet._7.while.cond.2                                # ir inst 53 fin
.F.processWorkingSet._12.while.exit.2:
  mv a0, t6
  j .F.processWorkingSet.epilogue                                       # ir inst 54 fin
.F.processWorkingSet.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret
