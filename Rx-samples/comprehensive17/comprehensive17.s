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
  li a0, 1700
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performBasicMatrixOperations
# ir inst 2 fin
# Start call preparation
  call .F.performAdvancedMatrixAlgorithms
# ir inst 3 fin
# Start call preparation
  call .F.performSparseMatrixOperations
# ir inst 4 fin
# Start call preparation
  call .F.performMatrixPerformanceBenchmarks
# ir inst 5 fin
# Start call preparation
  call .F.testMatrixEdgeCases
# ir inst 6 fin
# Start call preparation
  li a0, 1799
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

.globl .F.performBasicMatrixOperations
.F.performBasicMatrixOperations:
# spill func args num: 0,             range:     5008(sp) -     5008(sp)
# local var size: 4992,               range:       16(sp) -     5008(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5008
  add sp, sp, t0
  sd ra, 8(sp)
.F.performBasicMatrixOperations._0.entry.0:
# Start call preparation
  li a0, 1701
  call printlnInt
# ir inst 3 fin
  addi t1, sp, 144
  addi t6, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t5, 0
  j .F.performBasicMatrixOperations._1.array.cond.0                     # ir inst 6 fin
.F.performBasicMatrixOperations._1.array.cond.0:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 8 fin
  bnez t4, .F.performBasicMatrixOperations._2.array.body.0
  j .F.performBasicMatrixOperations._3.array.exit.0                     # ir inst 9 fin
.F.performBasicMatrixOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 11 fin
  addi t4, t5, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  j .F.performBasicMatrixOperations._1.array.cond.0                     # ir inst 13 fin
.F.performBasicMatrixOperations._3.array.exit.0:
  addi t1, sp, 1744
  addi t6, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t5, 0
  j .F.performBasicMatrixOperations._4.array.cond.1                     # ir inst 16 fin
.F.performBasicMatrixOperations._4.array.cond.1:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 18 fin
  bnez t4, .F.performBasicMatrixOperations._5.array.body.1
  j .F.performBasicMatrixOperations._6.array.exit.1                     # ir inst 19 fin
.F.performBasicMatrixOperations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 20 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 21 fin
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  j .F.performBasicMatrixOperations._4.array.cond.1                     # ir inst 23 fin
.F.performBasicMatrixOperations._6.array.exit.1:
  li t1, 3344
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 25 fin
# Phi connections
  li t5, 0
  j .F.performBasicMatrixOperations._7.array.cond.2                     # ir inst 26 fin
.F.performBasicMatrixOperations._7.array.cond.2:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 28 fin
  bnez t4, .F.performBasicMatrixOperations._8.array.body.2
  j .F.performBasicMatrixOperations._9.array.exit.2                     # ir inst 29 fin
.F.performBasicMatrixOperations._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 30 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 31 fin
  addi t4, t5, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  j .F.performBasicMatrixOperations._7.array.cond.2                     # ir inst 33 fin
.F.performBasicMatrixOperations._9.array.exit.2:
# Start call preparation
  li a2, 20
  addi t1, sp, 1744
  mv a1, t1
  addi t1, sp, 144
  mv a0, t1
  call .F.initializeMatrices
# ir inst 34 fin
# Start call preparation
  li a0, 1702
  call printlnInt
# ir inst 35 fin
# Start call preparation
  li a3, 20
  li t1, 3344
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 1744
  mv a1, t1
  addi t1, sp, 144
  mv a0, t1
  call .F.matrixAddition
# ir inst 36 fin
# Start call preparation
  li a1, 20
  li t1, 3344
  add t1, sp, t1
  mv a0, t1
  call .F.calculateMatrixSum
  mv t6, a0
# ir inst 37 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 38 fin
# Start call preparation
  li a0, 1703
  call printlnInt
# ir inst 39 fin
# Start call preparation
  li a3, 20
  li t1, 3344
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 1744
  mv a1, t1
  addi t1, sp, 144
  mv a0, t1
  call .F.matrixSubtraction
# ir inst 40 fin
# Start call preparation
  li a1, 20
  li t1, 3344
  add t1, sp, t1
  mv a0, t1
  call .F.calculateMatrixSum
  mv t6, a0
# ir inst 41 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 42 fin
# Start call preparation
  li a0, 1704
  call printlnInt
# ir inst 43 fin
# Start call preparation
  li a3, 20
  li t1, 3344
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 1744
  mv a1, t1
  addi t1, sp, 144
  mv a0, t1
  call .F.matrixMultiplication
# ir inst 44 fin
# Start call preparation
  li a1, 20
  li t1, 3344
  add t1, sp, t1
  mv a0, t1
  call .F.calculateMatrixSum
  mv t6, a0
# ir inst 45 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 46 fin
# Start call preparation
  li a0, 1705
  call printlnInt
# ir inst 47 fin
# Start call preparation
  li a2, 20
  li t1, 3344
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 144
  mv a0, t1
  call .F.matrixTranspose
# ir inst 48 fin
# Start call preparation
  li a1, 20
  li t1, 3344
  add t1, sp, t1
  mv a0, t1
  call .F.calculateMatrixSum
  mv t6, a0
# ir inst 49 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 50 fin
# Start call preparation
  li a0, 1706
  call printlnInt
# ir inst 51 fin
  li t1, 4944
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F.performBasicMatrixOperations._10.array.cond.3                    # ir inst 54 fin
.F.performBasicMatrixOperations._10.array.cond.3:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, .F.performBasicMatrixOperations._11.array.body.3
  j .F.performBasicMatrixOperations._12.array.exit.3                    # ir inst 57 fin
.F.performBasicMatrixOperations._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 58 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.performBasicMatrixOperations._10.array.cond.3                    # ir inst 61 fin
.F.performBasicMatrixOperations._12.array.exit.3:
# Start call preparation
  li a2, 64
  li t1, 4944
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 62 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeSmallMatrix
# ir inst 63 fin
# Start call preparation
  li a2, 64
  li t1, 4944
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 80
  mv a0, t1
  call memcpy
# ir inst 64 fin
# Start call preparation
  addi t1, sp, 80
  mv a0, t1
  call .F.calculateDeterminant4x4
  mv t6, a0
# ir inst 65 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 66 fin
  j .F.performBasicMatrixOperations.epilogue                            # ir inst 67 fin
.F.performBasicMatrixOperations.epilogue:
  ld ra, 8(sp)
  li t0, 5008
  add sp, sp, t0
  ret

.globl .F.initializeMatrices
.F.initializeMatrices:
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
.F.initializeMatrices._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrices._1.while.cond.0                               # ir inst 1 fin
.F.initializeMatrices._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.initializeMatrices._2.while.body.0
  j .F.initializeMatrices._12.while.exit.0                              # ir inst 4 fin
.F.initializeMatrices._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeMatrices._3.while.cond.1                               # ir inst 5 fin
.F.initializeMatrices._3.while.cond.1:
  slt t4, t5, a2                                                        # ir inst 7 fin
  bnez t4, .F.initializeMatrices._4.while.body.1
  j .F.initializeMatrices._11.while.exit.1                              # ir inst 8 fin
.F.initializeMatrices._4.while.body.1:
  mul t4, t6, a2                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 11 fin
  bnez t4, .F.initializeMatrices._5.if.then.0
  j .F.initializeMatrices._6.if.else.0                                  # ir inst 12 fin
.F.initializeMatrices._5.if.then.0:
  mv t4, t3                                                             # ir inst 13 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 14 fin
  add t4, t6, t5                                                        # ir inst 15 fin
  addi s10, t4, 10                                                      # ir inst 16 fin
  sw s10, 0(s11)                                                        # ir inst 17 fin
  j .F.initializeMatrices._7.if.exit.0                                  # ir inst 18 fin
.F.initializeMatrices._6.if.else.0:
  mv t4, t3                                                             # ir inst 19 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 20 fin
  slli t4, t6, 1                                                        # ir inst 21 fin
  li t2, 3
  mul s10, t5, t2                                                       # ir inst 22 fin
  add s9, t4, s10                                                       # ir inst 23 fin
  li t2, 7
  rem t4, s9, t2                                                        # ir inst 24 fin
  sw t4, 0(s11)                                                         # ir inst 25 fin
  j .F.initializeMatrices._7.if.exit.0                                  # ir inst 26 fin
.F.initializeMatrices._7.if.exit.0:
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 27 fin
  bnez t4, .F.initializeMatrices._8.if.then.1
  j .F.initializeMatrices._9.if.else.1                                  # ir inst 28 fin
.F.initializeMatrices._8.if.then.1:
  mv t4, t3                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 30 fin
  mul t4, t6, t5                                                        # ir inst 31 fin
  addi s11, t4, 5                                                       # ir inst 32 fin
  sw s11, 0(t3)                                                         # ir inst 33 fin
  mul t4, t5, a2                                                        # ir inst 34 fin
  add t3, t4, t6                                                        # ir inst 35 fin
  mv t4, t3                                                             # ir inst 36 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 37 fin
  mul t4, t6, t5                                                        # ir inst 38 fin
  addi s11, t4, 5                                                       # ir inst 39 fin
  sw s11, 0(t3)                                                         # ir inst 40 fin
  j .F.initializeMatrices._10.if.exit.1                                 # ir inst 41 fin
.F.initializeMatrices._9.if.else.1:
  j .F.initializeMatrices._10.if.exit.1                                 # ir inst 42 fin
.F.initializeMatrices._10.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 43 fin
# Phi connections
  mv t5, t4
  j .F.initializeMatrices._3.while.cond.1                               # ir inst 44 fin
.F.initializeMatrices._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrices._1.while.cond.0                               # ir inst 46 fin
.F.initializeMatrices._12.while.exit.0:
  j .F.initializeMatrices.epilogue                                      # ir inst 47 fin
.F.initializeMatrices.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.matrixAddition
.F.matrixAddition:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.matrixAddition._0.entry.0:
  mul t6, a3, a3                                                        # ir inst 1 fin
# Phi connections
  li t5, 0
  j .F.matrixAddition._1.while.cond.0                                   # ir inst 2 fin
.F.matrixAddition._1.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 4 fin
  bnez t4, .F.matrixAddition._2.while.body.0
  j .F.matrixAddition._3.while.exit.0                                   # ir inst 5 fin
.F.matrixAddition._2.while.body.0:
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 7 fin
  mv t4, t5                                                             # ir inst 8 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 9 fin
  lw t4, 0(s11)                                                         # ir inst 10 fin
  mv s11, t5                                                            # ir inst 11 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 12 fin
  lw s11, 0(s10)                                                        # ir inst 13 fin
  add s10, t4, s11                                                      # ir inst 14 fin
  sw s10, 0(t3)                                                         # ir inst 15 fin
  addi t4, t5, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.matrixAddition._1.while.cond.0                                   # ir inst 17 fin
.F.matrixAddition._3.while.exit.0:
  j .F.matrixAddition.epilogue                                          # ir inst 18 fin
.F.matrixAddition.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.matrixSubtraction
.F.matrixSubtraction:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.matrixSubtraction._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixSubtraction._1.while.cond.0                                # ir inst 1 fin
.F.matrixSubtraction._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.matrixSubtraction._2.while.body.0
  j .F.matrixSubtraction._6.while.exit.0                                # ir inst 4 fin
.F.matrixSubtraction._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrixSubtraction._3.while.cond.1                                # ir inst 5 fin
.F.matrixSubtraction._3.while.cond.1:
  slt t4, t5, a3                                                        # ir inst 7 fin
  bnez t4, .F.matrixSubtraction._4.while.body.1
  j .F.matrixSubtraction._5.while.exit.1                                # ir inst 8 fin
.F.matrixSubtraction._4.while.body.1:
  mul t4, t6, a3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add s11, a2, t2                                                       # ir inst 12 fin
  mv t4, t3                                                             # ir inst 13 fin
  slli t2, t4, 2
  add s10, a0, t2                                                       # ir inst 14 fin
  lw t4, 0(s10)                                                         # ir inst 15 fin
  mv s10, t3                                                            # ir inst 16 fin
  slli t2, s10, 2
  add t3, a1, t2                                                        # ir inst 17 fin
  lw s10, 0(t3)                                                         # ir inst 18 fin
  sub t3, t4, s10                                                       # ir inst 19 fin
  sw t3, 0(s11)                                                         # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  j .F.matrixSubtraction._3.while.cond.1                                # ir inst 22 fin
.F.matrixSubtraction._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t6, t5
  j .F.matrixSubtraction._1.while.cond.0                                # ir inst 24 fin
.F.matrixSubtraction._6.while.exit.0:
  j .F.matrixSubtraction.epilogue                                       # ir inst 25 fin
.F.matrixSubtraction.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.matrixMultiplication
.F.matrixMultiplication:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.matrixMultiplication._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixMultiplication._1.while.cond.0                             # ir inst 1 fin
.F.matrixMultiplication._1.while.cond.0:
  mul t5, a3, a3                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.matrixMultiplication._2.while.body.0
  j .F.matrixMultiplication._3.while.exit.0                             # ir inst 5 fin
.F.matrixMultiplication._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.matrixMultiplication._1.while.cond.0                             # ir inst 10 fin
.F.matrixMultiplication._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.matrixMultiplication._4.while.cond.1                             # ir inst 11 fin
.F.matrixMultiplication._4.while.cond.1:
  slt t5, t6, a3                                                        # ir inst 13 fin
  bnez t5, .F.matrixMultiplication._5.while.body.1
  j .F.matrixMultiplication._12.while.exit.1                            # ir inst 14 fin
.F.matrixMultiplication._5.while.body.1:
# Phi connections
  li t5, 0
  j .F.matrixMultiplication._6.while.cond.2                             # ir inst 15 fin
.F.matrixMultiplication._6.while.cond.2:
  slt t4, t5, a3                                                        # ir inst 17 fin
  bnez t4, .F.matrixMultiplication._7.while.body.2
  j .F.matrixMultiplication._11.while.exit.2                            # ir inst 18 fin
.F.matrixMultiplication._7.while.body.2:
# Phi connections
  li t4, 0
  j .F.matrixMultiplication._8.while.cond.3                             # ir inst 19 fin
.F.matrixMultiplication._8.while.cond.3:
  slt t3, t4, a3                                                        # ir inst 21 fin
  bnez t3, .F.matrixMultiplication._9.while.body.3
  j .F.matrixMultiplication._10.while.exit.3                            # ir inst 22 fin
.F.matrixMultiplication._9.while.body.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a7, 4
  mv a6, t4
  mv a5, t5
  mv a4, t6
  call .F.processMatrixBlock
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 23 fin
  addi t3, t4, 4                                                        # ir inst 24 fin
# Phi connections
  mv t4, t3
  j .F.matrixMultiplication._8.while.cond.3                             # ir inst 25 fin
.F.matrixMultiplication._10.while.exit.3:
  addi t4, t5, 4                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F.matrixMultiplication._6.while.cond.2                             # ir inst 27 fin
.F.matrixMultiplication._11.while.exit.2:
  addi t5, t6, 4                                                        # ir inst 28 fin
# Phi connections
  mv t6, t5
  j .F.matrixMultiplication._4.while.cond.1                             # ir inst 29 fin
.F.matrixMultiplication._12.while.exit.1:
  j .F.matrixMultiplication.epilogue                                    # ir inst 30 fin
.F.matrixMultiplication.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.processMatrixBlock
.F.processMatrixBlock:
# spill func args num: 0,             range:      160(sp) -      160(sp)
# local var size: 0,                  range:      152(sp) -      152(sp)
# return addr size: 8,                range:      144(sp) -      152(sp)
# callee save reg num: 7 / 12,        range:       88(sp) -      144(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -160
  sd s5, 88(sp)
  sd s7, 96(sp)
  sd s6, 104(sp)
  sd s8, 112(sp)
  sd s9, 120(sp)
  sd s10, 128(sp)
  sd s11, 136(sp)
  sd ra, 144(sp)
.F.processMatrixBlock._0.entry.0:
  add t6, a4, a7                                                        # ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a1, a3
  mv a0, t6
  call .F.minValue
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 2 fin
  add t6, a5, a7                                                        # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a1, a3
  mv a0, t6
  call .F.minValue
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 4 fin
  add t6, a6, a7                                                        # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a1, a3
  mv a0, t6
  call .F.minValue
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 6 fin
# Phi connections
  mv t6, a4
  j .F.processMatrixBlock._1.while.cond.0                               # ir inst 7 fin
.F.processMatrixBlock._1.while.cond.0:
  slt s11, t6, t5                                                       # ir inst 9 fin
  bnez s11, .F.processMatrixBlock._2.while.body.0
  j .F.processMatrixBlock._9.while.exit.0                               # ir inst 10 fin
.F.processMatrixBlock._2.while.body.0:
# Phi connections
  mv s11, a5
  j .F.processMatrixBlock._3.while.cond.1                               # ir inst 11 fin
.F.processMatrixBlock._3.while.cond.1:
  slt s10, s11, t4                                                      # ir inst 13 fin
  bnez s10, .F.processMatrixBlock._4.while.body.1
  j .F.processMatrixBlock._8.while.exit.1                               # ir inst 14 fin
.F.processMatrixBlock._4.while.body.1:
# Phi connections
  mv s10, a6
  j .F.processMatrixBlock._5.while.cond.2                               # ir inst 15 fin
.F.processMatrixBlock._5.while.cond.2:
  slt s9, s10, t3                                                       # ir inst 17 fin
  bnez s9, .F.processMatrixBlock._6.while.body.2
  j .F.processMatrixBlock._7.while.exit.2                               # ir inst 18 fin
.F.processMatrixBlock._6.while.body.2:
  mul s9, t6, a3                                                        # ir inst 19 fin
  add s8, s9, s11                                                       # ir inst 20 fin
  mul s9, t6, a3                                                        # ir inst 21 fin
  add s7, s9, s10                                                       # ir inst 22 fin
  mul s9, s10, a3                                                       # ir inst 23 fin
  add s6, s9, s11                                                       # ir inst 24 fin
  mv s9, s8                                                             # ir inst 25 fin
  slli t2, s9, 2
  add s5, a2, t2                                                        # ir inst 26 fin
  mv s9, s8                                                             # ir inst 27 fin
  slli t2, s9, 2
  add s8, a2, t2                                                        # ir inst 28 fin
  lw s9, 0(s8)                                                          # ir inst 29 fin
  mv s8, s7                                                             # ir inst 30 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 31 fin
  lw s8, 0(s7)                                                          # ir inst 32 fin
  mv s7, s6                                                             # ir inst 33 fin
  slli t2, s7, 2
  add s6, a1, t2                                                        # ir inst 34 fin
  lw s7, 0(s6)                                                          # ir inst 35 fin
  mul s6, s8, s7                                                        # ir inst 36 fin
  add s8, s9, s6                                                        # ir inst 37 fin
  sw s8, 0(s5)                                                          # ir inst 38 fin
  addi s9, s10, 1                                                       # ir inst 39 fin
# Phi connections
  mv s10, s9
  j .F.processMatrixBlock._5.while.cond.2                               # ir inst 40 fin
.F.processMatrixBlock._7.while.exit.2:
  addi s10, s11, 1                                                      # ir inst 41 fin
# Phi connections
  mv s11, s10
  j .F.processMatrixBlock._3.while.cond.1                               # ir inst 42 fin
.F.processMatrixBlock._8.while.exit.1:
  addi s11, t6, 1                                                       # ir inst 43 fin
# Phi connections
  mv t6, s11
  j .F.processMatrixBlock._1.while.cond.0                               # ir inst 44 fin
.F.processMatrixBlock._9.while.exit.0:
  j .F.processMatrixBlock.epilogue                                      # ir inst 45 fin
.F.processMatrixBlock.epilogue:
  ld ra, 144(sp)
  ld s5, 88(sp)
  ld s7, 96(sp)
  ld s6, 104(sp)
  ld s8, 112(sp)
  ld s9, 120(sp)
  ld s10, 128(sp)
  ld s11, 136(sp)
  addi sp, sp, 160
  ret

.globl .F.minValue
.F.minValue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.minValue._0.entry.0:
  slt t6, a0, a1                                                        # ir inst 1 fin
  bnez t6, .F.minValue._1.if.then.0
  j .F.minValue._2.if.else.0                                            # ir inst 2 fin
.F.minValue._1.if.then.0:
  j .F.minValue.epilogue                                                # ir inst 3 fin
.F.minValue._2.if.else.0:
  mv a0, a1
  j .F.minValue.epilogue                                                # ir inst 4 fin
.F.minValue._3.if.exit.0:
.F.minValue.epilogue:
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
  mul t4, t6, a2                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mul t4, t5, a2                                                        # ir inst 11 fin
  add s11, t4, t6                                                       # ir inst 12 fin
  mv t4, s11                                                            # ir inst 13 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 14 fin
  mv t4, t3                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 16 fin
  lw t4, 0(t3)                                                          # ir inst 17 fin
  sw t4, 0(s11)                                                         # ir inst 18 fin
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

.globl .F.calculateMatrixSum
.F.calculateMatrixSum:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.calculateMatrixSum._0.entry.0:
  mul t6, a1, a1                                                        # ir inst 1 fin
# Phi connections
  li t4, 0
  li t5, 0
  j .F.calculateMatrixSum._1.while.cond.0                               # ir inst 2 fin
.F.calculateMatrixSum._1.while.cond.0:
  slt t3, t5, t6                                                        # ir inst 5 fin
  bnez t3, .F.calculateMatrixSum._2.while.body.0
  j .F.calculateMatrixSum._3.while.exit.0                               # ir inst 6 fin
.F.calculateMatrixSum._2.while.body.0:
  mv t3, t5                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  add s11, t4, t3                                                       # ir inst 10 fin
  addi t3, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.calculateMatrixSum._1.while.cond.0                               # ir inst 12 fin
.F.calculateMatrixSum._3.while.exit.0:
  li t2, 1000000
  rem t6, t4, t2                                                        # ir inst 13 fin
  mv a0, t6
  j .F.calculateMatrixSum.epilogue                                      # ir inst 14 fin
.F.calculateMatrixSum.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.initializeSmallMatrix
.F.initializeSmallMatrix:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeSmallMatrix._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 16                                                       # ir inst 9 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 20                                                       # ir inst 11 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 24                                                       # ir inst 13 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t6, a0, 28                                                       # ir inst 15 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t6, a0, 32                                                       # ir inst 17 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t6, a0, 36                                                       # ir inst 19 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 40                                                       # ir inst 21 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 44                                                       # ir inst 23 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 24 fin
  addi t6, a0, 48                                                       # ir inst 25 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 26 fin
  addi t6, a0, 52                                                       # ir inst 27 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 28 fin
  addi t6, a0, 56                                                       # ir inst 29 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 30 fin
  addi t6, a0, 60                                                       # ir inst 31 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 32 fin
  j .F.initializeSmallMatrix.epilogue                                   # ir inst 33 fin
.F.initializeSmallMatrix.epilogue:
  ret

.globl .F.calculateDeterminant4x4
.F.calculateDeterminant4x4:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 64,                 range:       48(sp) -      112(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.calculateDeterminant4x4._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateDeterminant4x4._1.while.cond.0                          # ir inst 2 fin
.F.calculateDeterminant4x4._1.while.cond.0:
  li t2, 4
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F.calculateDeterminant4x4._2.while.body.0
  j .F.calculateDeterminant4x4._6.while.exit.0                          # ir inst 6 fin
.F.calculateDeterminant4x4._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 64
  mv a1, a0
  addi t1, sp, 48
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  li a1, 0
  addi t1, sp, 48
  mv a0, t1
  call .F.calculateCofactor4x4
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 8 fin
  li t2, 2
  rem t3, t6, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.calculateDeterminant4x4._3.if.then.0
  j .F.calculateDeterminant4x4._4.if.else.0                             # ir inst 11 fin
.F.calculateDeterminant4x4._3.if.then.0:
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  mul s11, t3, t4                                                       # ir inst 15 fin
  add t3, t5, s11                                                       # ir inst 16 fin
# Phi connections
  mv t4, t3
  j .F.calculateDeterminant4x4._5.if.exit.0                             # ir inst 17 fin
.F.calculateDeterminant4x4._4.if.else.0:
  mv t3, t6                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  lw t3, 0(s11)                                                         # ir inst 20 fin
  mul s11, t3, t4                                                       # ir inst 21 fin
  sub t4, t5, s11                                                       # ir inst 22 fin
# Phi connections
  j .F.calculateDeterminant4x4._5.if.exit.0                             # ir inst 23 fin
.F.calculateDeterminant4x4._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.calculateDeterminant4x4._1.while.cond.0                          # ir inst 26 fin
.F.calculateDeterminant4x4._6.while.exit.0:
  mv a0, t5
  j .F.calculateDeterminant4x4.epilogue                                 # ir inst 27 fin
.F.calculateDeterminant4x4.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 112
  ret

.globl .F.calculateCofactor4x4
.F.calculateCofactor4x4:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 72,                 range:       40(sp) -      112(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 3 / 12,        range:        8(sp) -       32(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s9, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
  sd ra, 32(sp)
.F.calculateCofactor4x4._0.entry.0:
  addi t1, sp, 76
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.calculateCofactor4x4._1.array.cond.0                             # ir inst 4 fin
.F.calculateCofactor4x4._1.array.cond.0:
  li t2, 9
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.calculateCofactor4x4._2.array.body.0
  j .F.calculateCofactor4x4._3.array.exit.0                             # ir inst 7 fin
.F.calculateCofactor4x4._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.calculateCofactor4x4._1.array.cond.0                             # ir inst 11 fin
.F.calculateCofactor4x4._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateCofactor4x4._4.while.cond.0                             # ir inst 12 fin
.F.calculateCofactor4x4._4.while.cond.0:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.calculateCofactor4x4._5.while.body.0
  j .F.calculateCofactor4x4._15.while.exit.0                            # ir inst 16 fin
.F.calculateCofactor4x4._5.while.body.0:
  xor t0, t5, a1
  sltu t4, zero, t0                                                     # ir inst 17 fin
  bnez t4, .F.calculateCofactor4x4._6.if.then.0
  j .F.calculateCofactor4x4._13.if.else.0                               # ir inst 18 fin
.F.calculateCofactor4x4._6.if.then.0:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F.calculateCofactor4x4._7.while.cond.1                             # ir inst 19 fin
.F.calculateCofactor4x4._7.while.cond.1:
  li t2, 4
  slt s11, t4, t2                                                       # ir inst 22 fin
  bnez s11, .F.calculateCofactor4x4._8.while.body.1
  j .F.calculateCofactor4x4._12.while.exit.1                            # ir inst 23 fin
.F.calculateCofactor4x4._8.while.body.1:
  xor t0, t4, a2
  sltu s11, zero, t0                                                    # ir inst 24 fin
  bnez s11, .F.calculateCofactor4x4._9.if.then.1
  j .F.calculateCofactor4x4._10.if.else.1                               # ir inst 25 fin
.F.calculateCofactor4x4._9.if.then.1:
  mv s11, t3                                                            # ir inst 26 fin
  slli t2, s11, 2
  addi t1, sp, 76
  add s10, t1, t2                                                       # ir inst 27 fin
  slli s11, t5, 2                                                       # ir inst 28 fin
  add s9, s11, t4                                                       # ir inst 29 fin
  mv s11, s9                                                            # ir inst 30 fin
  slli t2, s11, 2
  add s9, a0, t2                                                        # ir inst 31 fin
  lw s11, 0(s9)                                                         # ir inst 32 fin
  sw s11, 0(s10)                                                        # ir inst 33 fin
  addi s11, t3, 1                                                       # ir inst 34 fin
# Phi connections
  j .F.calculateCofactor4x4._11.if.exit.1                               # ir inst 35 fin
.F.calculateCofactor4x4._10.if.else.1:
# Phi connections
  mv s11, t3
  j .F.calculateCofactor4x4._11.if.exit.1                               # ir inst 36 fin
.F.calculateCofactor4x4._11.if.exit.1:
  addi s10, t4, 1                                                       # ir inst 38 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.calculateCofactor4x4._7.while.cond.1                             # ir inst 39 fin
.F.calculateCofactor4x4._12.while.exit.1:
# Phi connections
  mv t6, t3
  j .F.calculateCofactor4x4._14.if.exit.0                               # ir inst 40 fin
.F.calculateCofactor4x4._13.if.else.0:
# Phi connections
  j .F.calculateCofactor4x4._14.if.exit.0                               # ir inst 41 fin
.F.calculateCofactor4x4._14.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 43 fin
# Phi connections
  mv t5, t4
  j .F.calculateCofactor4x4._4.while.cond.0                             # ir inst 44 fin
.F.calculateCofactor4x4._15.while.exit.0:
# Start call preparation
  li a2, 36
  addi t1, sp, 76
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call memcpy
# ir inst 45 fin
# Start call preparation
  addi t1, sp, 40
  mv a0, t1
  call .F.calculateDeterminant3x3
  mv t6, a0
# ir inst 46 fin
  mv a0, t6
  j .F.calculateCofactor4x4.epilogue                                    # ir inst 47 fin
.F.calculateCofactor4x4.epilogue:
  ld ra, 32(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 112
  ret

.globl .F.calculateDeterminant3x3
.F.calculateDeterminant3x3:
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
.F.calculateDeterminant3x3._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 16                                                       # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 32                                                       # ir inst 5 fin
  lw t3, 0(t6)                                                          # ir inst 6 fin
  mul t6, t4, t3                                                        # ir inst 7 fin
  addi t4, a0, 20                                                       # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  addi t4, a0, 28                                                       # ir inst 10 fin
  lw s11, 0(t4)                                                         # ir inst 11 fin
  mul t4, t3, s11                                                       # ir inst 12 fin
  sub t3, t6, t4                                                        # ir inst 13 fin
  mul t6, t5, t3                                                        # ir inst 14 fin
  addi t5, a0, 4                                                        # ir inst 15 fin
  lw t4, 0(t5)                                                          # ir inst 16 fin
  addi t5, a0, 12                                                       # ir inst 17 fin
  lw t3, 0(t5)                                                          # ir inst 18 fin
  addi t5, a0, 32                                                       # ir inst 19 fin
  lw s11, 0(t5)                                                         # ir inst 20 fin
  mul t5, t3, s11                                                       # ir inst 21 fin
  addi t3, a0, 20                                                       # ir inst 22 fin
  lw s11, 0(t3)                                                         # ir inst 23 fin
  addi t3, a0, 24                                                       # ir inst 24 fin
  lw s10, 0(t3)                                                         # ir inst 25 fin
  mul t3, s11, s10                                                      # ir inst 26 fin
  sub s11, t5, t3                                                       # ir inst 27 fin
  mul t5, t4, s11                                                       # ir inst 28 fin
  addi t4, a0, 8                                                        # ir inst 29 fin
  lw t3, 0(t4)                                                          # ir inst 30 fin
  addi t4, a0, 12                                                       # ir inst 31 fin
  lw s11, 0(t4)                                                         # ir inst 32 fin
  addi t4, a0, 28                                                       # ir inst 33 fin
  lw s10, 0(t4)                                                         # ir inst 34 fin
  mul t4, s11, s10                                                      # ir inst 35 fin
  addi s11, a0, 16                                                      # ir inst 36 fin
  lw s10, 0(s11)                                                        # ir inst 37 fin
  addi s11, a0, 24                                                      # ir inst 38 fin
  lw s9, 0(s11)                                                         # ir inst 39 fin
  mul s11, s10, s9                                                      # ir inst 40 fin
  sub s10, t4, s11                                                      # ir inst 41 fin
  mul t4, t3, s10                                                       # ir inst 42 fin
  sub t3, t6, t5                                                        # ir inst 43 fin
  add t6, t3, t4                                                        # ir inst 44 fin
  mv a0, t6
  j .F.calculateDeterminant3x3.epilogue                                 # ir inst 45 fin
.F.calculateDeterminant3x3.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.performAdvancedMatrixAlgorithms
.F.performAdvancedMatrixAlgorithms:
# spill func args num: 0,             range:     1344(sp) -     1344(sp)
# local var size: 1312,               range:       24(sp) -     1336(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1344
  sd ra, 16(sp)
.F.performAdvancedMatrixAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1710
  call printlnInt
# ir inst 2 fin
# Start call preparation
  li a0, 1711
  call printlnInt
# ir inst 3 fin
  addi t1, sp, 280
  addi t6, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t5, 0
  j .F.performAdvancedMatrixAlgorithms._1.array.cond.0                  # ir inst 6 fin
.F.performAdvancedMatrixAlgorithms._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 8 fin
  bnez t4, .F.performAdvancedMatrixAlgorithms._2.array.body.0
  j .F.performAdvancedMatrixAlgorithms._3.array.exit.0                  # ir inst 9 fin
.F.performAdvancedMatrixAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 11 fin
  addi t4, t5, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  j .F.performAdvancedMatrixAlgorithms._1.array.cond.0                  # ir inst 13 fin
.F.performAdvancedMatrixAlgorithms._3.array.exit.0:
# Start call preparation
  li a1, 10
  addi t1, sp, 280
  mv a0, t1
  call .F.initializeMatrixForPower
# ir inst 14 fin
  addi t1, sp, 680
  addi t6, t1, 0                                                        # ir inst 16 fin
# Phi connections
  li t5, 0
  j .F.performAdvancedMatrixAlgorithms._4.array.cond.1                  # ir inst 17 fin
.F.performAdvancedMatrixAlgorithms._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 19 fin
  bnez t4, .F.performAdvancedMatrixAlgorithms._5.array.body.1
  j .F.performAdvancedMatrixAlgorithms._6.array.exit.1                  # ir inst 20 fin
.F.performAdvancedMatrixAlgorithms._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 22 fin
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.performAdvancedMatrixAlgorithms._4.array.cond.1                  # ir inst 24 fin
.F.performAdvancedMatrixAlgorithms._6.array.exit.1:
# Start call preparation
  li a3, 3
  li a2, 10
  addi t1, sp, 680
  mv a1, t1
  addi t1, sp, 280
  mv a0, t1
  call .F.matrixPower
# ir inst 25 fin
# Start call preparation
  li a1, 10
  addi t1, sp, 680
  mv a0, t1
  call .F.calculateMatrixSum100
  mv t6, a0
# ir inst 26 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 27 fin
# Start call preparation
  li a0, 1712
  call printlnInt
# ir inst 28 fin
  addi t1, sp, 1080
  addi t6, t1, 0                                                        # ir inst 30 fin
# Phi connections
  li t5, 0
  j .F.performAdvancedMatrixAlgorithms._7.array.cond.2                  # ir inst 31 fin
.F.performAdvancedMatrixAlgorithms._7.array.cond.2:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 33 fin
  bnez t4, .F.performAdvancedMatrixAlgorithms._8.array.body.2
  j .F.performAdvancedMatrixAlgorithms._9.array.exit.2                  # ir inst 34 fin
.F.performAdvancedMatrixAlgorithms._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 35 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 36 fin
  addi t4, t5, 1                                                        # ir inst 37 fin
# Phi connections
  mv t5, t4
  j .F.performAdvancedMatrixAlgorithms._7.array.cond.2                  # ir inst 38 fin
.F.performAdvancedMatrixAlgorithms._9.array.exit.2:
# Start call preparation
  addi t1, sp, 1080
  mv a0, t1
  call .F.initializeRotationMatrix
# ir inst 39 fin
# Start call preparation
  li a1, 8
  addi t1, sp, 1080
  mv a0, t1
  call .F.rotateMatrix90Degrees
# ir inst 40 fin
# Start call preparation
  li a2, 256
  addi t1, sp, 1080
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call memcpy
# ir inst 41 fin
# Start call preparation
  addi t1, sp, 24
  mv a0, t1
  call .F.calculateMatrixSum64
  mv t6, a0
# ir inst 42 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 43 fin
# Start call preparation
  li a0, 1713
  call printlnInt
# ir inst 44 fin
# Start call preparation
  li a1, 10
  addi t1, sp, 280
  mv a0, t1
  call .F.calculateDiagonalSums
  mv t6, a0
# ir inst 45 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 46 fin
# Start call preparation
  li a0, 1714
  call printlnInt
# ir inst 47 fin
# Start call preparation
  li a1, 10
  addi t1, sp, 280
  mv a0, t1
  call .F.calculateMatrixTrace
  mv t6, a0
# ir inst 48 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 10
  addi t1, sp, 280
  mv a0, t1
  call .F.calculateMatrixNorm
  mv t5, a0
  ld t6, 0(sp)
# ir inst 49 fin
  add t4, t6, t5                                                        # ir inst 50 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 51 fin
  j .F.performAdvancedMatrixAlgorithms.epilogue                         # ir inst 52 fin
.F.performAdvancedMatrixAlgorithms.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 1344
  ret

.globl .F.initializeMatrixForPower
.F.initializeMatrixForPower:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.initializeMatrixForPower._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrixForPower._1.while.cond.0                         # ir inst 1 fin
.F.initializeMatrixForPower._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.initializeMatrixForPower._2.while.body.0
  j .F.initializeMatrixForPower._12.while.exit.0                        # ir inst 4 fin
.F.initializeMatrixForPower._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeMatrixForPower._3.while.cond.1                         # ir inst 5 fin
.F.initializeMatrixForPower._3.while.cond.1:
  slt t4, t5, a1                                                        # ir inst 7 fin
  bnez t4, .F.initializeMatrixForPower._4.while.body.1
  j .F.initializeMatrixForPower._11.while.exit.1                        # ir inst 8 fin
.F.initializeMatrixForPower._4.while.body.1:
  mul t4, t6, a1                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 11 fin
  bnez t4, .F.initializeMatrixForPower._5.if.then.0
  j .F.initializeMatrixForPower._6.if.else.0                            # ir inst 12 fin
.F.initializeMatrixForPower._5.if.then.0:
  mv t4, t3                                                             # ir inst 13 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 14 fin
  li t1, 2
  sw t1, 0(s11)                                                         # ir inst 15 fin
  j .F.initializeMatrixForPower._10.if.exit.0                           # ir inst 16 fin
.F.initializeMatrixForPower._6.if.else.0:
  sub t4, t6, t5                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, t4
  call .F.absValue
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 18 fin
  li t2, 1
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 19 fin
  bnez t4, .F.initializeMatrixForPower._7.if.then.1
  j .F.initializeMatrixForPower._8.if.else.1                            # ir inst 20 fin
.F.initializeMatrixForPower._7.if.then.1:
  mv t4, t3                                                             # ir inst 21 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 22 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 23 fin
  j .F.initializeMatrixForPower._9.if.exit.1                            # ir inst 24 fin
.F.initializeMatrixForPower._8.if.else.1:
  mv t4, t3                                                             # ir inst 25 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 26 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 27 fin
  j .F.initializeMatrixForPower._9.if.exit.1                            # ir inst 28 fin
.F.initializeMatrixForPower._9.if.exit.1:
  j .F.initializeMatrixForPower._10.if.exit.0                           # ir inst 29 fin
.F.initializeMatrixForPower._10.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.initializeMatrixForPower._3.while.cond.1                         # ir inst 31 fin
.F.initializeMatrixForPower._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrixForPower._1.while.cond.0                         # ir inst 33 fin
.F.initializeMatrixForPower._12.while.exit.0:
  j .F.initializeMatrixForPower.epilogue                                # ir inst 34 fin
.F.initializeMatrixForPower.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.matrixPower
.F.matrixPower:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       48(sp) -      448(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd ra, 40(sp)
.F.matrixPower._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a0, a1
  mv a1, a2
  call .F.initializeIdentityMatrix
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 1 fin
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.matrixPower._1.array.cond.0                                      # ir inst 4 fin
.F.matrixPower._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.matrixPower._2.array.body.0
  j .F.matrixPower._3.array.exit.0                                      # ir inst 7 fin
.F.matrixPower._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.matrixPower._1.array.cond.0                                      # ir inst 11 fin
.F.matrixPower._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.matrixPower._4.while.cond.0                                      # ir inst 12 fin
.F.matrixPower._4.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 14 fin
  bnez t5, .F.matrixPower._5.while.body.0
  j .F.matrixPower._6.while.exit.0                                      # ir inst 15 fin
.F.matrixPower._5.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a3, a2
  addi t1, sp, 48
  mv a2, t1
  mv t0, a1
  mv a1, a0
  mv a0, t0
  call .F.matrixMultiplication100
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F.copyMatrix100
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 17 fin
  addi t5, t6, 1                                                        # ir inst 18 fin
# Phi connections
  mv t6, t5
  j .F.matrixPower._4.while.cond.0                                      # ir inst 19 fin
.F.matrixPower._6.while.exit.0:
  j .F.matrixPower.epilogue                                             # ir inst 20 fin
.F.matrixPower.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 448
  ret

.globl .F.initializeIdentityMatrix
.F.initializeIdentityMatrix:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeIdentityMatrix._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeIdentityMatrix._1.while.cond.0                         # ir inst 1 fin
.F.initializeIdentityMatrix._1.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.initializeIdentityMatrix._2.while.body.0
  j .F.initializeIdentityMatrix._3.while.exit.0                         # ir inst 5 fin
.F.initializeIdentityMatrix._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.initializeIdentityMatrix._1.while.cond.0                         # ir inst 10 fin
.F.initializeIdentityMatrix._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeIdentityMatrix._4.while.cond.1                         # ir inst 11 fin
.F.initializeIdentityMatrix._4.while.cond.1:
  slt t5, t6, a1                                                        # ir inst 13 fin
  bnez t5, .F.initializeIdentityMatrix._5.while.body.1
  j .F.initializeIdentityMatrix._6.while.exit.1                         # ir inst 14 fin
.F.initializeIdentityMatrix._5.while.body.1:
  mul t5, t6, a1                                                        # ir inst 15 fin
  add t4, t5, t6                                                        # ir inst 16 fin
  mv t5, t4                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 18 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.initializeIdentityMatrix._4.while.cond.1                         # ir inst 21 fin
.F.initializeIdentityMatrix._6.while.exit.1:
  j .F.initializeIdentityMatrix.epilogue                                # ir inst 22 fin
.F.initializeIdentityMatrix.epilogue:
  ret

.globl .F.matrixMultiplication100
.F.matrixMultiplication100:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s9, 8(sp)
  sd s8, 16(sp)
  sd s10, 24(sp)
.F.matrixMultiplication100._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixMultiplication100._1.while.cond.0                          # ir inst 1 fin
.F.matrixMultiplication100._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.matrixMultiplication100._2.while.body.0
  j .F.matrixMultiplication100._9.while.exit.0                          # ir inst 4 fin
.F.matrixMultiplication100._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrixMultiplication100._3.while.cond.1                          # ir inst 5 fin
.F.matrixMultiplication100._3.while.cond.1:
  slt t4, t5, a3                                                        # ir inst 7 fin
  bnez t4, .F.matrixMultiplication100._4.while.body.1
  j .F.matrixMultiplication100._8.while.exit.1                          # ir inst 8 fin
.F.matrixMultiplication100._4.while.body.1:
  mul t4, t6, a3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  li t4, 0
  j .F.matrixMultiplication100._5.while.cond.2                          # ir inst 14 fin
.F.matrixMultiplication100._5.while.cond.2:
  slt t3, t4, a3                                                        # ir inst 16 fin
  bnez t3, .F.matrixMultiplication100._6.while.body.2
  j .F.matrixMultiplication100._7.while.exit.2                          # ir inst 17 fin
.F.matrixMultiplication100._6.while.body.2:
  mul t3, t6, a3                                                        # ir inst 18 fin
  add s11, t3, t5                                                       # ir inst 19 fin
  mv t3, s11                                                            # ir inst 20 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 21 fin
  mul t3, t6, a3                                                        # ir inst 22 fin
  add s10, t3, t5                                                       # ir inst 23 fin
  mv t3, s10                                                            # ir inst 24 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 25 fin
  lw t3, 0(s10)                                                         # ir inst 26 fin
  mul s10, t6, a3                                                       # ir inst 27 fin
  add s9, s10, t4                                                       # ir inst 28 fin
  mv s10, s9                                                            # ir inst 29 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 30 fin
  lw s10, 0(s9)                                                         # ir inst 31 fin
  mul s9, t4, a3                                                        # ir inst 32 fin
  add s8, s9, t5                                                        # ir inst 33 fin
  mv s9, s8                                                             # ir inst 34 fin
  slli t2, s9, 2
  add s8, a1, t2                                                        # ir inst 35 fin
  lw s9, 0(s8)                                                          # ir inst 36 fin
  mul s8, s10, s9                                                       # ir inst 37 fin
  add s10, t3, s8                                                       # ir inst 38 fin
  sw s10, 0(s11)                                                        # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F.matrixMultiplication100._5.while.cond.2                          # ir inst 41 fin
.F.matrixMultiplication100._7.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  j .F.matrixMultiplication100._3.while.cond.1                          # ir inst 43 fin
.F.matrixMultiplication100._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t6, t5
  j .F.matrixMultiplication100._1.while.cond.0                          # ir inst 45 fin
.F.matrixMultiplication100._9.while.exit.0:
  j .F.matrixMultiplication100.epilogue                                 # ir inst 46 fin
.F.matrixMultiplication100.epilogue:
  ld s11, 0(sp)
  ld s9, 8(sp)
  ld s8, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.copyMatrix100
.F.copyMatrix100:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.copyMatrix100._0.entry.0:
# Phi connections
  li t6, 0
  j .F.copyMatrix100._1.while.cond.0                                    # ir inst 1 fin
.F.copyMatrix100._1.while.cond.0:
  mul t5, a2, a2                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.copyMatrix100._2.while.body.0
  j .F.copyMatrix100._3.while.exit.0                                    # ir inst 5 fin
.F.copyMatrix100._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  lw t5, 0(t3)                                                          # ir inst 10 fin
  sw t5, 0(t4)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.copyMatrix100._1.while.cond.0                                    # ir inst 13 fin
.F.copyMatrix100._3.while.exit.0:
  j .F.copyMatrix100.epilogue                                           # ir inst 14 fin
.F.copyMatrix100.epilogue:
  ret

.globl .F.calculateMatrixSum100
.F.calculateMatrixSum100:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateMatrixSum100._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixSum100._1.while.cond.0                            # ir inst 1 fin
.F.calculateMatrixSum100._1.while.cond.0:
  mul t4, a1, a1                                                        # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.calculateMatrixSum100._2.while.body.0
  j .F.calculateMatrixSum100._3.while.exit.0                            # ir inst 6 fin
.F.calculateMatrixSum100._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  add t3, t5, t4                                                        # ir inst 10 fin
  addi t4, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateMatrixSum100._1.while.cond.0                            # ir inst 12 fin
.F.calculateMatrixSum100._3.while.exit.0:
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 13 fin
  mv a0, t6
  j .F.calculateMatrixSum100.epilogue                                   # ir inst 14 fin
.F.calculateMatrixSum100.epilogue:
  ret

.globl .F.initializeRotationMatrix
.F.initializeRotationMatrix:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeRotationMatrix._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeRotationMatrix._1.while.cond.0                         # ir inst 1 fin
.F.initializeRotationMatrix._1.while.cond.0:
  li t2, 8
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeRotationMatrix._2.while.body.0
  j .F.initializeRotationMatrix._6.while.exit.0                         # ir inst 4 fin
.F.initializeRotationMatrix._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeRotationMatrix._3.while.cond.1                         # ir inst 5 fin
.F.initializeRotationMatrix._3.while.cond.1:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.initializeRotationMatrix._4.while.body.1
  j .F.initializeRotationMatrix._5.while.exit.1                         # ir inst 8 fin
.F.initializeRotationMatrix._4.while.body.1:
  slli t4, t6, 3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  li t2, 10
  mul t4, t6, t2                                                        # ir inst 13 fin
  add s11, t4, t5                                                       # ir inst 14 fin
  addi t4, s11, 1                                                       # ir inst 15 fin
  sw t4, 0(t3)                                                          # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.initializeRotationMatrix._3.while.cond.1                         # ir inst 18 fin
.F.initializeRotationMatrix._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.initializeRotationMatrix._1.while.cond.0                         # ir inst 20 fin
.F.initializeRotationMatrix._6.while.exit.0:
  j .F.initializeRotationMatrix.epilogue                                # ir inst 21 fin
.F.initializeRotationMatrix.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.rotateMatrix90Degrees
.F.rotateMatrix90Degrees:
# spill func args num: 0,             range:      272(sp) -      272(sp)
# local var size: 256,                range:       16(sp) -      272(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -272
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.rotateMatrix90Degrees._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.rotateMatrix90Degrees._1.array.cond.0                            # ir inst 3 fin
.F.rotateMatrix90Degrees._1.array.cond.0:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.rotateMatrix90Degrees._2.array.body.0
  j .F.rotateMatrix90Degrees._3.array.exit.0                            # ir inst 6 fin
.F.rotateMatrix90Degrees._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.rotateMatrix90Degrees._1.array.cond.0                            # ir inst 10 fin
.F.rotateMatrix90Degrees._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.rotateMatrix90Degrees._4.while.cond.0                            # ir inst 11 fin
.F.rotateMatrix90Degrees._4.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 13 fin
  slt t4, t6, t5                                                        # ir inst 14 fin
  bnez t4, .F.rotateMatrix90Degrees._5.while.body.0
  j .F.rotateMatrix90Degrees._6.while.exit.0                            # ir inst 15 fin
.F.rotateMatrix90Degrees._5.while.body.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 17 fin
  mv t5, t6                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 19 fin
  lw t5, 0(t3)                                                          # ir inst 20 fin
  sw t5, 0(t4)                                                          # ir inst 21 fin
  addi t5, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.rotateMatrix90Degrees._4.while.cond.0                            # ir inst 23 fin
.F.rotateMatrix90Degrees._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.rotateMatrix90Degrees._7.while.cond.1                            # ir inst 24 fin
.F.rotateMatrix90Degrees._7.while.cond.1:
  slt t5, t6, a1                                                        # ir inst 26 fin
  bnez t5, .F.rotateMatrix90Degrees._8.while.body.1
  j .F.rotateMatrix90Degrees._12.while.exit.1                           # ir inst 27 fin
.F.rotateMatrix90Degrees._8.while.body.1:
# Phi connections
  li t5, 0
  j .F.rotateMatrix90Degrees._9.while.cond.2                            # ir inst 28 fin
.F.rotateMatrix90Degrees._9.while.cond.2:
  slt t4, t5, a1                                                        # ir inst 30 fin
  bnez t4, .F.rotateMatrix90Degrees._10.while.body.2
  j .F.rotateMatrix90Degrees._11.while.exit.2                           # ir inst 31 fin
.F.rotateMatrix90Degrees._10.while.body.2:
  mul t4, t6, a1                                                        # ir inst 32 fin
  add t3, t4, t5                                                        # ir inst 33 fin
  mul t4, t5, a1                                                        # ir inst 34 fin
  addi s11, a1, -1                                                      # ir inst 35 fin
  sub s10, s11, t6                                                      # ir inst 36 fin
  add s11, t4, s10                                                      # ir inst 37 fin
  mv t4, s11                                                            # ir inst 38 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 39 fin
  mv t4, t3                                                             # ir inst 40 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 41 fin
  lw t4, 0(t3)                                                          # ir inst 42 fin
  sw t4, 0(s11)                                                         # ir inst 43 fin
  addi t4, t5, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  j .F.rotateMatrix90Degrees._9.while.cond.2                            # ir inst 45 fin
.F.rotateMatrix90Degrees._11.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  j .F.rotateMatrix90Degrees._7.while.cond.1                            # ir inst 47 fin
.F.rotateMatrix90Degrees._12.while.exit.1:
  j .F.rotateMatrix90Degrees.epilogue                                   # ir inst 48 fin
.F.rotateMatrix90Degrees.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 272
  ret

.globl .F.calculateMatrixSum64
.F.calculateMatrixSum64:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateMatrixSum64._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixSum64._1.while.cond.0                             # ir inst 1 fin
.F.calculateMatrixSum64._1.while.cond.0:
  li t2, 64
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.calculateMatrixSum64._2.while.body.0
  j .F.calculateMatrixSum64._3.while.exit.0                             # ir inst 5 fin
.F.calculateMatrixSum64._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateMatrixSum64._1.while.cond.0                             # ir inst 11 fin
.F.calculateMatrixSum64._3.while.exit.0:
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 12 fin
  mv a0, t6
  j .F.calculateMatrixSum64.epilogue                                    # ir inst 13 fin
.F.calculateMatrixSum64.epilogue:
  ret

.globl .F.calculateDiagonalSums
.F.calculateDiagonalSums:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s9, 8(sp)
  sd s10, 16(sp)
.F.calculateDiagonalSums._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.calculateDiagonalSums._1.while.cond.0                            # ir inst 1 fin
.F.calculateDiagonalSums._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.calculateDiagonalSums._2.while.body.0
  j .F.calculateDiagonalSums._3.while.exit.0                            # ir inst 6 fin
.F.calculateDiagonalSums._2.while.body.0:
  mul t3, t6, a1                                                        # ir inst 7 fin
  add s11, t3, t6                                                       # ir inst 8 fin
  mv t3, s11                                                            # ir inst 9 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 10 fin
  lw t3, 0(s11)                                                         # ir inst 11 fin
  add s11, t4, t3                                                       # ir inst 12 fin
  mul t3, t6, a1                                                        # ir inst 13 fin
  addi s10, a1, -1                                                      # ir inst 14 fin
  sub s9, s10, t6                                                       # ir inst 15 fin
  add s10, t3, s9                                                       # ir inst 16 fin
  mv t3, s10                                                            # ir inst 17 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 18 fin
  lw t3, 0(s10)                                                         # ir inst 19 fin
  add s10, t5, t3                                                       # ir inst 20 fin
  addi t3, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t4, s11
  mv t5, s10
  mv t6, t3
  j .F.calculateDiagonalSums._1.while.cond.0                            # ir inst 22 fin
.F.calculateDiagonalSums._3.while.exit.0:
  add t6, t4, t5                                                        # ir inst 23 fin
  mv a0, t6
  j .F.calculateDiagonalSums.epilogue                                   # ir inst 24 fin
.F.calculateDiagonalSums.epilogue:
  ld s11, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.calculateMatrixTrace
.F.calculateMatrixTrace:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateMatrixTrace._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixTrace._1.while.cond.0                             # ir inst 1 fin
.F.calculateMatrixTrace._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.calculateMatrixTrace._2.while.body.0
  j .F.calculateMatrixTrace._3.while.exit.0                             # ir inst 5 fin
.F.calculateMatrixTrace._2.while.body.0:
  mul t4, t6, a1                                                        # ir inst 6 fin
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
  j .F.calculateMatrixTrace._1.while.cond.0                             # ir inst 13 fin
.F.calculateMatrixTrace._3.while.exit.0:
  mv a0, t5
  j .F.calculateMatrixTrace.epilogue                                    # ir inst 14 fin
.F.calculateMatrixTrace.epilogue:
  ret

.globl .F.calculateMatrixNorm
.F.calculateMatrixNorm:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.calculateMatrixNorm._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixNorm._1.while.cond.0                              # ir inst 1 fin
.F.calculateMatrixNorm._1.while.cond.0:
  mul t4, a1, a1                                                        # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.calculateMatrixNorm._2.while.body.0
  j .F.calculateMatrixNorm._3.while.exit.0                              # ir inst 6 fin
.F.calculateMatrixNorm._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  mv t3, t6                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 11 fin
  lw t3, 0(s11)                                                         # ir inst 12 fin
  mul s11, t4, t3                                                       # ir inst 13 fin
  add t4, t5, s11                                                       # ir inst 14 fin
  addi t3, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.calculateMatrixNorm._1.while.cond.0                              # ir inst 16 fin
.F.calculateMatrixNorm._3.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call .F.approximateSquareRoot
  mv t6, a0
  ld t5, 0(sp)
# ir inst 17 fin
  mv a0, t6
  j .F.calculateMatrixNorm.epilogue                                     # ir inst 18 fin
.F.calculateMatrixNorm.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.approximateSquareRoot
.F.approximateSquareRoot:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.approximateSquareRoot._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.approximateSquareRoot._1.if.then.0
  j .F.approximateSquareRoot._2.if.else.0                               # ir inst 2 fin
.F.approximateSquareRoot._1.if.then.0:
  j .F.approximateSquareRoot.epilogue                                   # ir inst 3 fin
.F.approximateSquareRoot._2.if.else.0:
  j .F.approximateSquareRoot._3.if.exit.0                               # ir inst 4 fin
.F.approximateSquareRoot._3.if.exit.0:
# Phi connections
  li t4, 1
  mv t5, a0
  li t6, 1
  j .F.approximateSquareRoot._4.while.cond.0                            # ir inst 5 fin
.F.approximateSquareRoot._4.while.cond.0:
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.approximateSquareRoot._5.while.body.0
  j .F.approximateSquareRoot._9.while.exit.0                            # ir inst 10 fin
.F.approximateSquareRoot._5.while.body.0:
  sub t3, t5, t4                                                        # ir inst 11 fin
  li t2, 2
  div s11, t3, t2                                                       # ir inst 12 fin
  add t3, t4, s11                                                       # ir inst 13 fin
  div s11, a0, t3                                                       # ir inst 14 fin
  slt t0, s11, t3
  xori s10, t0, 1                                                       # ir inst 15 fin
  bnez s10, .F.approximateSquareRoot._6.if.then.1
  j .F.approximateSquareRoot._7.if.else.1                               # ir inst 16 fin
.F.approximateSquareRoot._6.if.then.1:
  addi s11, t3, 1                                                       # ir inst 17 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  mv t3, s11
  j .F.approximateSquareRoot._8.if.exit.1                               # ir inst 18 fin
.F.approximateSquareRoot._7.if.else.1:
  addi t5, t3, -1                                                       # ir inst 19 fin
# Phi connections
  mv t3, t4
  mv t4, t5
  mv t5, t6
  j .F.approximateSquareRoot._8.if.exit.1                               # ir inst 20 fin
.F.approximateSquareRoot._8.if.exit.1:
# Phi connections
  mv t6, t5
  mv t5, t4
  mv t4, t3
  j .F.approximateSquareRoot._4.while.cond.0                            # ir inst 24 fin
.F.approximateSquareRoot._9.while.exit.0:
  mv a0, t6
  j .F.approximateSquareRoot.epilogue                                   # ir inst 25 fin
.F.approximateSquareRoot.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.absValue
.F.absValue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.absValue._0.entry.0:
  li t2, 0
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.absValue._1.if.then.0
  j .F.absValue._2.if.else.0                                            # ir inst 2 fin
.F.absValue._1.if.then.0:
  li t1, 0
  sub t6, t1, a0                                                        # ir inst 3 fin
  mv a0, t6
  j .F.absValue.epilogue                                                # ir inst 4 fin
.F.absValue._2.if.else.0:
  j .F.absValue.epilogue                                                # ir inst 5 fin
.F.absValue._3.if.exit.0:
.F.absValue.epilogue:
  ret

.globl .F.performSparseMatrixOperations
.F.performSparseMatrixOperations:
# spill func args num: 0,             range:    12048(sp) -    12048(sp)
# local var size: 12000,              range:       40(sp) -    12040(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -12048
  add sp, sp, t0
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.performSparseMatrixOperations._0.entry.0:
# Start call preparation
  li a0, 1720
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performSparseMatrixOperations._1.array.cond.0                    # ir inst 4 fin
.F.performSparseMatrixOperations._1.array.cond.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performSparseMatrixOperations._2.array.body.0
  j .F.performSparseMatrixOperations._3.array.exit.0                    # ir inst 7 fin
.F.performSparseMatrixOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performSparseMatrixOperations._1.array.cond.0                    # ir inst 11 fin
.F.performSparseMatrixOperations._3.array.exit.0:
  addi t1, sp, 840
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performSparseMatrixOperations._4.array.cond.1                    # ir inst 14 fin
.F.performSparseMatrixOperations._4.array.cond.1:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performSparseMatrixOperations._5.array.body.1
  j .F.performSparseMatrixOperations._6.array.exit.1                    # ir inst 17 fin
.F.performSparseMatrixOperations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performSparseMatrixOperations._4.array.cond.1                    # ir inst 21 fin
.F.performSparseMatrixOperations._6.array.exit.1:
  addi t1, sp, 1640
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performSparseMatrixOperations._7.array.cond.2                    # ir inst 24 fin
.F.performSparseMatrixOperations._7.array.cond.2:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performSparseMatrixOperations._8.array.body.2
  j .F.performSparseMatrixOperations._9.array.exit.2                    # ir inst 27 fin
.F.performSparseMatrixOperations._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performSparseMatrixOperations._7.array.cond.2                    # ir inst 31 fin
.F.performSparseMatrixOperations._9.array.exit.2:
# Start call preparation
  addi t1, sp, 1640
  mv a2, t1
  addi t1, sp, 840
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call .F.createSparseMatrix
  mv t6, a0
# ir inst 32 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 33 fin
# Start call preparation
  sd t6, 0(sp)
  li a0, 1721
  call printlnInt
  ld t6, 0(sp)
# ir inst 34 fin
  li t1, 2440
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 36 fin
# Phi connections
  li t4, 0
  j .F.performSparseMatrixOperations._10.array.cond.3                   # ir inst 37 fin
.F.performSparseMatrixOperations._10.array.cond.3:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 39 fin
  bnez t3, .F.performSparseMatrixOperations._11.array.body.3
  j .F.performSparseMatrixOperations._12.array.exit.3                   # ir inst 40 fin
.F.performSparseMatrixOperations._11.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 41 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 42 fin
  addi t3, t4, 1                                                        # ir inst 43 fin
# Phi connections
  mv t4, t3
  j .F.performSparseMatrixOperations._10.array.cond.3                   # ir inst 44 fin
.F.performSparseMatrixOperations._12.array.exit.3:
  li t1, 3240
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 46 fin
# Phi connections
  li t4, 0
  j .F.performSparseMatrixOperations._13.array.cond.4                   # ir inst 47 fin
.F.performSparseMatrixOperations._13.array.cond.4:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 49 fin
  bnez t3, .F.performSparseMatrixOperations._14.array.body.4
  j .F.performSparseMatrixOperations._15.array.exit.4                   # ir inst 50 fin
.F.performSparseMatrixOperations._14.array.body.4:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 52 fin
  addi t3, t4, 1                                                        # ir inst 53 fin
# Phi connections
  mv t4, t3
  j .F.performSparseMatrixOperations._13.array.cond.4                   # ir inst 54 fin
.F.performSparseMatrixOperations._15.array.exit.4:
  li t1, 4040
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 56 fin
# Phi connections
  li t4, 0
  j .F.performSparseMatrixOperations._16.array.cond.5                   # ir inst 57 fin
.F.performSparseMatrixOperations._16.array.cond.5:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 59 fin
  bnez t3, .F.performSparseMatrixOperations._17.array.body.5
  j .F.performSparseMatrixOperations._18.array.exit.5                   # ir inst 60 fin
.F.performSparseMatrixOperations._17.array.body.5:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 62 fin
  addi t3, t4, 1                                                        # ir inst 63 fin
# Phi connections
  mv t4, t3
  j .F.performSparseMatrixOperations._16.array.cond.5                   # ir inst 64 fin
.F.performSparseMatrixOperations._18.array.exit.5:
# Start call preparation
  sd t6, 0(sp)
  li t1, 4040
  add t1, sp, t1
  mv a2, t1
  li t1, 3240
  add t1, sp, t1
  mv a1, t1
  li t1, 2440
  add t1, sp, t1
  mv a0, t1
  call .F.createSparseMatrix2
  mv t5, a0
  ld t6, 0(sp)
# ir inst 65 fin
  li t1, 4840
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 67 fin
# Phi connections
  li t3, 0
  j .F.performSparseMatrixOperations._19.array.cond.6                   # ir inst 68 fin
.F.performSparseMatrixOperations._19.array.cond.6:
  li t2, 400
  slt s11, t3, t2                                                       # ir inst 70 fin
  bnez s11, .F.performSparseMatrixOperations._20.array.body.6
  j .F.performSparseMatrixOperations._21.array.exit.6                   # ir inst 71 fin
.F.performSparseMatrixOperations._20.array.body.6:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 72 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 73 fin
  addi s11, t3, 1                                                       # ir inst 74 fin
# Phi connections
  mv t3, s11
  j .F.performSparseMatrixOperations._19.array.cond.6                   # ir inst 75 fin
.F.performSparseMatrixOperations._21.array.exit.6:
  li t1, 6440
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 77 fin
# Phi connections
  li t3, 0
  j .F.performSparseMatrixOperations._22.array.cond.7                   # ir inst 78 fin
.F.performSparseMatrixOperations._22.array.cond.7:
  li t2, 400
  slt s11, t3, t2                                                       # ir inst 80 fin
  bnez s11, .F.performSparseMatrixOperations._23.array.body.7
  j .F.performSparseMatrixOperations._24.array.exit.7                   # ir inst 81 fin
.F.performSparseMatrixOperations._23.array.body.7:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 82 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 83 fin
  addi s11, t3, 1                                                       # ir inst 84 fin
# Phi connections
  mv t3, s11
  j .F.performSparseMatrixOperations._22.array.cond.7                   # ir inst 85 fin
.F.performSparseMatrixOperations._24.array.exit.7:
  li t1, 8040
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 87 fin
# Phi connections
  li t3, 0
  j .F.performSparseMatrixOperations._25.array.cond.8                   # ir inst 88 fin
.F.performSparseMatrixOperations._25.array.cond.8:
  li t2, 400
  slt s11, t3, t2                                                       # ir inst 90 fin
  bnez s11, .F.performSparseMatrixOperations._26.array.body.8
  j .F.performSparseMatrixOperations._27.array.exit.8                   # ir inst 91 fin
.F.performSparseMatrixOperations._26.array.body.8:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 92 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 93 fin
  addi s11, t3, 1                                                       # ir inst 94 fin
# Phi connections
  mv t3, s11
  j .F.performSparseMatrixOperations._25.array.cond.8                   # ir inst 95 fin
.F.performSparseMatrixOperations._27.array.exit.8:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li t1, 4840
  add t1, sp, t1
  sd t1, -24(sp)
  li t1, 6440
  add t1, sp, t1
  sd t1, -16(sp)
  li t1, 8040
  add t1, sp, t1
  sd t1, -8(sp)
  mv a7, t5
  li t1, 4040
  add t1, sp, t1
  mv a6, t1
  li t1, 3240
  add t1, sp, t1
  mv a5, t1
  li t1, 2440
  add t1, sp, t1
  mv a4, t1
  mv a3, t6
  addi t1, sp, 1640
  mv a2, t1
  addi t1, sp, 840
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call .F.sparseMatrixAddition
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 96 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 97 fin
# Start call preparation
  sd t6, 0(sp)
  li a0, 1722
  call printlnInt
  ld t6, 0(sp)
# ir inst 98 fin
  li t1, 9640
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 100 fin
# Phi connections
  li t4, 0
  j .F.performSparseMatrixOperations._28.array.cond.9                   # ir inst 101 fin
.F.performSparseMatrixOperations._28.array.cond.9:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 103 fin
  bnez t3, .F.performSparseMatrixOperations._29.array.body.9
  j .F.performSparseMatrixOperations._30.array.exit.9                   # ir inst 104 fin
.F.performSparseMatrixOperations._29.array.body.9:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 105 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 106 fin
  addi t3, t4, 1                                                        # ir inst 107 fin
# Phi connections
  mv t4, t3
  j .F.performSparseMatrixOperations._28.array.cond.9                   # ir inst 108 fin
.F.performSparseMatrixOperations._30.array.exit.9:
  li t1, 10440
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 110 fin
# Phi connections
  li t4, 0
  j .F.performSparseMatrixOperations._31.array.cond.10                  # ir inst 111 fin
.F.performSparseMatrixOperations._31.array.cond.10:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 113 fin
  bnez t3, .F.performSparseMatrixOperations._32.array.body.10
  j .F.performSparseMatrixOperations._33.array.exit.10                  # ir inst 114 fin
.F.performSparseMatrixOperations._32.array.body.10:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 115 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 116 fin
  addi t3, t4, 1                                                        # ir inst 117 fin
# Phi connections
  mv t4, t3
  j .F.performSparseMatrixOperations._31.array.cond.10                  # ir inst 118 fin
.F.performSparseMatrixOperations._33.array.exit.10:
  li t1, 11240
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 120 fin
# Phi connections
  li t4, 0
  j .F.performSparseMatrixOperations._34.array.cond.11                  # ir inst 121 fin
.F.performSparseMatrixOperations._34.array.cond.11:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 123 fin
  bnez t3, .F.performSparseMatrixOperations._35.array.body.11
  j .F.performSparseMatrixOperations._36.array.exit.11                  # ir inst 124 fin
.F.performSparseMatrixOperations._35.array.body.11:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 125 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 126 fin
  addi t3, t4, 1                                                        # ir inst 127 fin
# Phi connections
  mv t4, t3
  j .F.performSparseMatrixOperations._34.array.cond.11                  # ir inst 128 fin
.F.performSparseMatrixOperations._36.array.exit.11:
# Start call preparation
  sd t6, 0(sp)
  li t1, 11240
  add t1, sp, t1
  mv a6, t1
  li t1, 10440
  add t1, sp, t1
  mv a5, t1
  li t1, 9640
  add t1, sp, t1
  mv a4, t1
  mv a3, t6
  addi t1, sp, 1640
  mv a2, t1
  addi t1, sp, 840
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call .F.sparseMatrixTranspose
  ld t6, 0(sp)
# ir inst 129 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  li t1, 11240
  add t1, sp, t1
  mv a0, t1
  call .F.calculateSparseSum
  mv t5, a0
  ld t6, 0(sp)
# ir inst 130 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 131 fin
# Start call preparation
  sd t6, 0(sp)
  li a0, 1723
  call printlnInt
  ld t6, 0(sp)
# ir inst 132 fin
# Start call preparation
  sd t6, 0(sp)
  mv a7, t6
  li t1, 11240
  add t1, sp, t1
  mv a6, t1
  li t1, 10440
  add t1, sp, t1
  mv a5, t1
  li t1, 9640
  add t1, sp, t1
  mv a4, t1
  mv a3, t6
  addi t1, sp, 1640
  mv a2, t1
  addi t1, sp, 840
  mv a1, t1
  addi t1, sp, 40
  mv a0, t1
  call .F.sparseMatrixMultiplication
  mv t5, a0
  ld t6, 0(sp)
# ir inst 133 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 134 fin
  j .F.performSparseMatrixOperations.epilogue                           # ir inst 135 fin
.F.performSparseMatrixOperations.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  li t0, 12048
  add sp, sp, t0
  ret

.globl .F.createSparseMatrix
.F.createSparseMatrix:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.createSparseMatrix._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.createSparseMatrix._1.while.cond.0                               # ir inst 1 fin
.F.createSparseMatrix._1.while.cond.0:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.createSparseMatrix._2.lazy.then.0
  j .F.createSparseMatrix._3.lazy.else.0                                # ir inst 5 fin
.F.createSparseMatrix._2.lazy.then.0:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 6 fin
# Phi connections
  j .F.createSparseMatrix._4.lazy.exit.0                                # ir inst 7 fin
.F.createSparseMatrix._3.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.createSparseMatrix._4.lazy.exit.0                                # ir inst 8 fin
.F.createSparseMatrix._4.lazy.exit.0:
  bnez t4, .F.createSparseMatrix._5.while.body.0
  j .F.createSparseMatrix._21.while.exit.0                              # ir inst 10 fin
.F.createSparseMatrix._5.while.body.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  sw t5, 0(t3)                                                          # ir inst 13 fin
  mv t4, t6                                                             # ir inst 14 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 15 fin
  sw t5, 0(t3)                                                          # ir inst 16 fin
  mv t4, t6                                                             # ir inst 17 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 18 fin
  addi t4, t5, 10                                                       # ir inst 19 fin
  sw t4, 0(t3)                                                          # ir inst 20 fin
  addi t4, t6, 1                                                        # ir inst 21 fin
  addi t3, t5, 1                                                        # ir inst 22 fin
  li t2, 30
  slt s11, t3, t2                                                       # ir inst 23 fin
  bnez s11, .F.createSparseMatrix._6.lazy.then.1
  j .F.createSparseMatrix._7.lazy.else.1                                # ir inst 24 fin
.F.createSparseMatrix._6.lazy.then.1:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 25 fin
# Phi connections
  j .F.createSparseMatrix._8.lazy.exit.1                                # ir inst 26 fin
.F.createSparseMatrix._7.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.createSparseMatrix._8.lazy.exit.1                                # ir inst 27 fin
.F.createSparseMatrix._8.lazy.exit.1:
  bnez t3, .F.createSparseMatrix._9.if.then.0
  j .F.createSparseMatrix._10.if.else.0                                 # ir inst 29 fin
.F.createSparseMatrix._9.if.then.0:
  mv t3, t4                                                             # ir inst 30 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 31 fin
  sw t5, 0(s11)                                                         # ir inst 32 fin
  mv t3, t4                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 34 fin
  addi t3, t5, 1                                                        # ir inst 35 fin
  sw t3, 0(s11)                                                         # ir inst 36 fin
  mv t3, t4                                                             # ir inst 37 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 38 fin
  addi t3, t5, 5                                                        # ir inst 39 fin
  sw t3, 0(s11)                                                         # ir inst 40 fin
  addi t3, t4, 1                                                        # ir inst 41 fin
# Phi connections
  mv t4, t3
  j .F.createSparseMatrix._11.if.exit.0                                 # ir inst 42 fin
.F.createSparseMatrix._10.if.else.0:
# Phi connections
  j .F.createSparseMatrix._11.if.exit.0                                 # ir inst 43 fin
.F.createSparseMatrix._11.if.exit.0:
  li t2, 3
  rem t3, t5, t2                                                        # ir inst 45 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 46 fin
  bnez s11, .F.createSparseMatrix._12.lazy.then.2
  j .F.createSparseMatrix._13.lazy.else.2                               # ir inst 47 fin
.F.createSparseMatrix._12.lazy.then.2:
  addi t3, t5, 5                                                        # ir inst 48 fin
  li t2, 30
  slt s11, t3, t2                                                       # ir inst 49 fin
# Phi connections
  mv t3, s11
  j .F.createSparseMatrix._14.lazy.exit.2                               # ir inst 50 fin
.F.createSparseMatrix._13.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.createSparseMatrix._14.lazy.exit.2                               # ir inst 51 fin
.F.createSparseMatrix._14.lazy.exit.2:
  bnez t3, .F.createSparseMatrix._15.lazy.then.3
  j .F.createSparseMatrix._16.lazy.else.3                               # ir inst 53 fin
.F.createSparseMatrix._15.lazy.then.3:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 54 fin
# Phi connections
  j .F.createSparseMatrix._17.lazy.exit.3                               # ir inst 55 fin
.F.createSparseMatrix._16.lazy.else.3:
# Phi connections
  li t3, 0
  j .F.createSparseMatrix._17.lazy.exit.3                               # ir inst 56 fin
.F.createSparseMatrix._17.lazy.exit.3:
  bnez t3, .F.createSparseMatrix._18.if.then.1
  j .F.createSparseMatrix._19.if.else.1                                 # ir inst 58 fin
.F.createSparseMatrix._18.if.then.1:
  mv t3, t4                                                             # ir inst 59 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 60 fin
  sw t5, 0(s11)                                                         # ir inst 61 fin
  mv t3, t4                                                             # ir inst 62 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 63 fin
  addi t3, t5, 5                                                        # ir inst 64 fin
  sw t3, 0(s11)                                                         # ir inst 65 fin
  mv t3, t4                                                             # ir inst 66 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 67 fin
  slli t3, t5, 1                                                        # ir inst 68 fin
  sw t3, 0(s11)                                                         # ir inst 69 fin
  addi t3, t4, 1                                                        # ir inst 70 fin
# Phi connections
  mv t4, t3
  j .F.createSparseMatrix._20.if.exit.1                                 # ir inst 71 fin
.F.createSparseMatrix._19.if.else.1:
# Phi connections
  j .F.createSparseMatrix._20.if.exit.1                                 # ir inst 72 fin
.F.createSparseMatrix._20.if.exit.1:
  addi t3, t5, 1                                                        # ir inst 74 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.createSparseMatrix._1.while.cond.0                               # ir inst 75 fin
.F.createSparseMatrix._21.while.exit.0:
  mv a0, t6
  j .F.createSparseMatrix.epilogue                                      # ir inst 76 fin
.F.createSparseMatrix.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.createSparseMatrix2
.F.createSparseMatrix2:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.createSparseMatrix2._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.createSparseMatrix2._1.while.cond.0                              # ir inst 1 fin
.F.createSparseMatrix2._1.while.cond.0:
  li t2, 30
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.createSparseMatrix2._2.lazy.then.0
  j .F.createSparseMatrix2._3.lazy.else.0                               # ir inst 5 fin
.F.createSparseMatrix2._2.lazy.then.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 6 fin
# Phi connections
  j .F.createSparseMatrix2._4.lazy.exit.0                               # ir inst 7 fin
.F.createSparseMatrix2._3.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.createSparseMatrix2._4.lazy.exit.0                               # ir inst 8 fin
.F.createSparseMatrix2._4.lazy.exit.0:
  bnez t4, .F.createSparseMatrix2._5.while.body.0
  j .F.createSparseMatrix2._18.while.exit.0                             # ir inst 10 fin
.F.createSparseMatrix2._5.while.body.0:
  add t4, t6, t6                                                        # ir inst 11 fin
  li t2, 30
  slt t3, t4, t2                                                        # ir inst 12 fin
  bnez t3, .F.createSparseMatrix2._6.lazy.then.1
  j .F.createSparseMatrix2._7.lazy.else.1                               # ir inst 13 fin
.F.createSparseMatrix2._6.lazy.then.1:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 14 fin
# Phi connections
  j .F.createSparseMatrix2._8.lazy.exit.1                               # ir inst 15 fin
.F.createSparseMatrix2._7.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.createSparseMatrix2._8.lazy.exit.1                               # ir inst 16 fin
.F.createSparseMatrix2._8.lazy.exit.1:
  bnez t4, .F.createSparseMatrix2._9.if.then.0
  j .F.createSparseMatrix2._10.if.else.0                                # ir inst 18 fin
.F.createSparseMatrix2._9.if.then.0:
  mv t4, t5                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 20 fin
  sw t6, 0(t3)                                                          # ir inst 21 fin
  mv t4, t5                                                             # ir inst 22 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 23 fin
  li t1, 29
  sub t4, t1, t6                                                        # ir inst 24 fin
  sw t4, 0(t3)                                                          # ir inst 25 fin
  mv t4, t5                                                             # ir inst 26 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 27 fin
  addi t4, t6, 3                                                        # ir inst 28 fin
  sw t4, 0(t3)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  j .F.createSparseMatrix2._11.if.exit.0                                # ir inst 31 fin
.F.createSparseMatrix2._10.if.else.0:
# Phi connections
  mv t4, t5
  j .F.createSparseMatrix2._11.if.exit.0                                # ir inst 32 fin
.F.createSparseMatrix2._11.if.exit.0:
  li t2, 4
  rem t3, t6, t2                                                        # ir inst 34 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 35 fin
  bnez s11, .F.createSparseMatrix2._12.lazy.then.2
  j .F.createSparseMatrix2._13.lazy.else.2                              # ir inst 36 fin
.F.createSparseMatrix2._12.lazy.then.2:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 37 fin
# Phi connections
  j .F.createSparseMatrix2._14.lazy.exit.2                              # ir inst 38 fin
.F.createSparseMatrix2._13.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.createSparseMatrix2._14.lazy.exit.2                              # ir inst 39 fin
.F.createSparseMatrix2._14.lazy.exit.2:
  bnez t3, .F.createSparseMatrix2._15.if.then.1
  j .F.createSparseMatrix2._16.if.else.1                                # ir inst 41 fin
.F.createSparseMatrix2._15.if.then.1:
  mv t3, t4                                                             # ir inst 42 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 43 fin
  sw t6, 0(s11)                                                         # ir inst 44 fin
  mv t3, t4                                                             # ir inst 45 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 46 fin
  li t2, 2
  div t3, t6, t2                                                        # ir inst 47 fin
  sw t3, 0(s11)                                                         # ir inst 48 fin
  mv t3, t4                                                             # ir inst 49 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 50 fin
  li t2, 3
  mul t3, t6, t2                                                        # ir inst 51 fin
  sw t3, 0(s11)                                                         # ir inst 52 fin
  addi t3, t4, 1                                                        # ir inst 53 fin
# Phi connections
  mv t4, t3
  j .F.createSparseMatrix2._17.if.exit.1                                # ir inst 54 fin
.F.createSparseMatrix2._16.if.else.1:
# Phi connections
  j .F.createSparseMatrix2._17.if.exit.1                                # ir inst 55 fin
.F.createSparseMatrix2._17.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 57 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.createSparseMatrix2._1.while.cond.0                              # ir inst 58 fin
.F.createSparseMatrix2._18.while.exit.0:
  mv a0, t5
  j .F.createSparseMatrix2.epilogue                                     # ir inst 59 fin
.F.createSparseMatrix2.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.sparseMatrixAddition
.F.sparseMatrixAddition:
# spill func args num: 3,             range:       40(sp) -       40(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.sparseMatrixAddition._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.sparseMatrixAddition._1.while.cond.0                             # ir inst 1 fin
.F.sparseMatrixAddition._1.while.cond.0:
  slt t3, t5, a3                                                        # ir inst 5 fin
  bnez t3, .F.sparseMatrixAddition._2.lazy.then.0
  j .F.sparseMatrixAddition._3.lazy.else.0                              # ir inst 6 fin
.F.sparseMatrixAddition._2.lazy.then.0:
  slt t3, t6, a7                                                        # ir inst 7 fin
# Phi connections
  j .F.sparseMatrixAddition._4.lazy.exit.0                              # ir inst 8 fin
.F.sparseMatrixAddition._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.sparseMatrixAddition._4.lazy.exit.0                              # ir inst 9 fin
.F.sparseMatrixAddition._4.lazy.exit.0:
  bnez t3, .F.sparseMatrixAddition._5.lazy.then.1
  j .F.sparseMatrixAddition._6.lazy.else.1                              # ir inst 11 fin
.F.sparseMatrixAddition._5.lazy.then.1:
  li t2, 400
  slt t3, t4, t2                                                        # ir inst 12 fin
# Phi connections
  j .F.sparseMatrixAddition._7.lazy.exit.1                              # ir inst 13 fin
.F.sparseMatrixAddition._6.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.sparseMatrixAddition._7.lazy.exit.1                              # ir inst 14 fin
.F.sparseMatrixAddition._7.lazy.exit.1:
  bnez t3, .F.sparseMatrixAddition._8.while.body.0
  j .F.sparseMatrixAddition._15.while.exit.0                            # ir inst 16 fin
.F.sparseMatrixAddition._8.while.body.0:
  mv t3, t5                                                             # ir inst 17 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 18 fin
  lw t3, 0(s11)                                                         # ir inst 19 fin
  li t2, 100
  mul s11, t3, t2                                                       # ir inst 20 fin
  mv t3, t5                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 22 fin
  lw t3, 0(s10)                                                         # ir inst 23 fin
  add s10, s11, t3                                                      # ir inst 24 fin
  mv t3, t6                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, a4, t2                                                       # ir inst 26 fin
  lw t3, 0(s11)                                                         # ir inst 27 fin
  li t2, 100
  mul s11, t3, t2                                                       # ir inst 28 fin
  mv t3, t6                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s9, a5, t2                                                        # ir inst 30 fin
  lw t3, 0(s9)                                                          # ir inst 31 fin
  add s9, s11, t3                                                       # ir inst 32 fin
  slt t3, s10, s9                                                       # ir inst 33 fin
  bnez t3, .F.sparseMatrixAddition._9.if.then.0
  j .F.sparseMatrixAddition._10.if.else.0                               # ir inst 34 fin
.F.sparseMatrixAddition._9.if.then.0:
  mv t3, t4                                                             # ir inst 35 fin
  slli t2, t3, 2
  ld t1, 40(sp)
  add s11, t1, t2                                                       # ir inst 36 fin
  mv t3, t5                                                             # ir inst 37 fin
  slli t2, t3, 2
  add s8, a0, t2                                                        # ir inst 38 fin
  lw t3, 0(s8)                                                          # ir inst 39 fin
  sw t3, 0(s11)                                                         # ir inst 40 fin
  mv t3, t4                                                             # ir inst 41 fin
  slli t2, t3, 2
  ld t1, 48(sp)
  add s11, t1, t2                                                       # ir inst 42 fin
  mv t3, t5                                                             # ir inst 43 fin
  slli t2, t3, 2
  add s8, a1, t2                                                        # ir inst 44 fin
  lw t3, 0(s8)                                                          # ir inst 45 fin
  sw t3, 0(s11)                                                         # ir inst 46 fin
  mv t3, t4                                                             # ir inst 47 fin
  slli t2, t3, 2
  ld t1, 56(sp)
  add s11, t1, t2                                                       # ir inst 48 fin
  mv t3, t5                                                             # ir inst 49 fin
  slli t2, t3, 2
  add s8, a2, t2                                                        # ir inst 50 fin
  lw t3, 0(s8)                                                          # ir inst 51 fin
  sw t3, 0(s11)                                                         # ir inst 52 fin
  addi t3, t4, 1                                                        # ir inst 53 fin
  addi s11, t5, 1                                                       # ir inst 54 fin
# Phi connections
  mv s10, t3
  mv t3, t6
  j .F.sparseMatrixAddition._14.if.exit.0                               # ir inst 55 fin
.F.sparseMatrixAddition._10.if.else.0:
  slt t3, s9, s10                                                       # ir inst 56 fin
  bnez t3, .F.sparseMatrixAddition._11.if.then.1
  j .F.sparseMatrixAddition._12.if.else.1                               # ir inst 57 fin
.F.sparseMatrixAddition._11.if.then.1:
  mv t3, t4                                                             # ir inst 58 fin
  slli t2, t3, 2
  ld t1, 40(sp)
  add s11, t1, t2                                                       # ir inst 59 fin
  mv t3, t6                                                             # ir inst 60 fin
  slli t2, t3, 2
  add s10, a4, t2                                                       # ir inst 61 fin
  lw t3, 0(s10)                                                         # ir inst 62 fin
  sw t3, 0(s11)                                                         # ir inst 63 fin
  mv t3, t4                                                             # ir inst 64 fin
  slli t2, t3, 2
  ld t1, 48(sp)
  add s11, t1, t2                                                       # ir inst 65 fin
  mv t3, t6                                                             # ir inst 66 fin
  slli t2, t3, 2
  add s10, a5, t2                                                       # ir inst 67 fin
  lw t3, 0(s10)                                                         # ir inst 68 fin
  sw t3, 0(s11)                                                         # ir inst 69 fin
  mv t3, t4                                                             # ir inst 70 fin
  slli t2, t3, 2
  ld t1, 56(sp)
  add s11, t1, t2                                                       # ir inst 71 fin
  mv t3, t6                                                             # ir inst 72 fin
  slli t2, t3, 2
  add s10, a6, t2                                                       # ir inst 73 fin
  lw t3, 0(s10)                                                         # ir inst 74 fin
  sw t3, 0(s11)                                                         # ir inst 75 fin
  addi t3, t4, 1                                                        # ir inst 76 fin
  addi s11, t6, 1                                                       # ir inst 77 fin
# Phi connections
  mv s10, t3
  mv t3, s11
  mv s11, t5
  j .F.sparseMatrixAddition._13.if.exit.1                               # ir inst 78 fin
.F.sparseMatrixAddition._12.if.else.1:
  mv t3, t4                                                             # ir inst 79 fin
  slli t2, t3, 2
  ld t1, 40(sp)
  add s11, t1, t2                                                       # ir inst 80 fin
  mv t3, t5                                                             # ir inst 81 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 82 fin
  lw t3, 0(s10)                                                         # ir inst 83 fin
  sw t3, 0(s11)                                                         # ir inst 84 fin
  mv t3, t4                                                             # ir inst 85 fin
  slli t2, t3, 2
  ld t1, 48(sp)
  add s11, t1, t2                                                       # ir inst 86 fin
  mv t3, t5                                                             # ir inst 87 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 88 fin
  lw t3, 0(s10)                                                         # ir inst 89 fin
  sw t3, 0(s11)                                                         # ir inst 90 fin
  mv t3, t4                                                             # ir inst 91 fin
  slli t2, t3, 2
  ld t1, 56(sp)
  add s11, t1, t2                                                       # ir inst 92 fin
  mv t3, t5                                                             # ir inst 93 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 94 fin
  lw t3, 0(s10)                                                         # ir inst 95 fin
  mv s10, t6                                                            # ir inst 96 fin
  slli t2, s10, 2
  add s9, a6, t2                                                        # ir inst 97 fin
  lw s10, 0(s9)                                                         # ir inst 98 fin
  add s9, t3, s10                                                       # ir inst 99 fin
  sw s9, 0(s11)                                                         # ir inst 100 fin
  addi t3, t4, 1                                                        # ir inst 101 fin
  addi s11, t5, 1                                                       # ir inst 102 fin
  addi s10, t6, 1                                                       # ir inst 103 fin
# Phi connections
  mv t0, s10
  mv s10, t3
  mv t3, t0
  j .F.sparseMatrixAddition._13.if.exit.1                               # ir inst 104 fin
.F.sparseMatrixAddition._13.if.exit.1:
# Phi connections
  j .F.sparseMatrixAddition._14.if.exit.0                               # ir inst 108 fin
.F.sparseMatrixAddition._14.if.exit.0:
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F.sparseMatrixAddition._1.while.cond.0                             # ir inst 112 fin
.F.sparseMatrixAddition._15.while.exit.0:
# Phi connections
  j .F.sparseMatrixAddition._16.while.cond.1                            # ir inst 113 fin
.F.sparseMatrixAddition._16.while.cond.1:
  slt t3, t5, a3                                                        # ir inst 116 fin
  bnez t3, .F.sparseMatrixAddition._17.lazy.then.2
  j .F.sparseMatrixAddition._18.lazy.else.2                             # ir inst 117 fin
.F.sparseMatrixAddition._17.lazy.then.2:
  li t2, 400
  slt t3, t4, t2                                                        # ir inst 118 fin
# Phi connections
  j .F.sparseMatrixAddition._19.lazy.exit.2                             # ir inst 119 fin
.F.sparseMatrixAddition._18.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.sparseMatrixAddition._19.lazy.exit.2                             # ir inst 120 fin
.F.sparseMatrixAddition._19.lazy.exit.2:
  bnez t3, .F.sparseMatrixAddition._20.while.body.1
  j .F.sparseMatrixAddition._21.while.exit.1                            # ir inst 122 fin
.F.sparseMatrixAddition._20.while.body.1:
  mv t3, t4                                                             # ir inst 123 fin
  slli t2, t3, 2
  ld t1, 40(sp)
  add s11, t1, t2                                                       # ir inst 124 fin
  mv t3, t5                                                             # ir inst 125 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 126 fin
  lw t3, 0(s10)                                                         # ir inst 127 fin
  sw t3, 0(s11)                                                         # ir inst 128 fin
  mv t3, t4                                                             # ir inst 129 fin
  slli t2, t3, 2
  ld t1, 48(sp)
  add s11, t1, t2                                                       # ir inst 130 fin
  mv t3, t5                                                             # ir inst 131 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 132 fin
  lw t3, 0(s10)                                                         # ir inst 133 fin
  sw t3, 0(s11)                                                         # ir inst 134 fin
  mv t3, t4                                                             # ir inst 135 fin
  slli t2, t3, 2
  ld t1, 56(sp)
  add s11, t1, t2                                                       # ir inst 136 fin
  mv t3, t5                                                             # ir inst 137 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 138 fin
  lw t3, 0(s10)                                                         # ir inst 139 fin
  sw t3, 0(s11)                                                         # ir inst 140 fin
  addi t3, t4, 1                                                        # ir inst 141 fin
  addi s11, t5, 1                                                       # ir inst 142 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.sparseMatrixAddition._16.while.cond.1                            # ir inst 143 fin
.F.sparseMatrixAddition._21.while.exit.1:
# Phi connections
  mv t5, t4
  j .F.sparseMatrixAddition._22.while.cond.2                            # ir inst 144 fin
.F.sparseMatrixAddition._22.while.cond.2:
  slt t4, t6, a7                                                        # ir inst 147 fin
  bnez t4, .F.sparseMatrixAddition._23.lazy.then.3
  j .F.sparseMatrixAddition._24.lazy.else.3                             # ir inst 148 fin
.F.sparseMatrixAddition._23.lazy.then.3:
  li t2, 400
  slt t4, t5, t2                                                        # ir inst 149 fin
# Phi connections
  j .F.sparseMatrixAddition._25.lazy.exit.3                             # ir inst 150 fin
.F.sparseMatrixAddition._24.lazy.else.3:
# Phi connections
  li t4, 0
  j .F.sparseMatrixAddition._25.lazy.exit.3                             # ir inst 151 fin
.F.sparseMatrixAddition._25.lazy.exit.3:
  bnez t4, .F.sparseMatrixAddition._26.while.body.2
  j .F.sparseMatrixAddition._27.while.exit.2                            # ir inst 153 fin
.F.sparseMatrixAddition._26.while.body.2:
  mv t4, t5                                                             # ir inst 154 fin
  slli t2, t4, 2
  ld t1, 40(sp)
  add t3, t1, t2                                                        # ir inst 155 fin
  mv t4, t6                                                             # ir inst 156 fin
  slli t2, t4, 2
  add s11, a4, t2                                                       # ir inst 157 fin
  lw t4, 0(s11)                                                         # ir inst 158 fin
  sw t4, 0(t3)                                                          # ir inst 159 fin
  mv t4, t5                                                             # ir inst 160 fin
  slli t2, t4, 2
  ld t1, 48(sp)
  add t3, t1, t2                                                        # ir inst 161 fin
  mv t4, t6                                                             # ir inst 162 fin
  slli t2, t4, 2
  add s11, a5, t2                                                       # ir inst 163 fin
  lw t4, 0(s11)                                                         # ir inst 164 fin
  sw t4, 0(t3)                                                          # ir inst 165 fin
  mv t4, t5                                                             # ir inst 166 fin
  slli t2, t4, 2
  ld t1, 56(sp)
  add t3, t1, t2                                                        # ir inst 167 fin
  mv t4, t6                                                             # ir inst 168 fin
  slli t2, t4, 2
  add s11, a6, t2                                                       # ir inst 169 fin
  lw t4, 0(s11)                                                         # ir inst 170 fin
  sw t4, 0(t3)                                                          # ir inst 171 fin
  addi t4, t5, 1                                                        # ir inst 172 fin
  addi t3, t6, 1                                                        # ir inst 173 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.sparseMatrixAddition._22.while.cond.2                            # ir inst 174 fin
.F.sparseMatrixAddition._27.while.exit.2:
  mv a0, t5
  j .F.sparseMatrixAddition.epilogue                                    # ir inst 175 fin
.F.sparseMatrixAddition.epilogue:
  ld s9, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 64
  ret

.globl .F.sparseMatrixTranspose
.F.sparseMatrixTranspose:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s8, 8(sp)
  sd s9, 16(sp)
  sd s10, 24(sp)
.F.sparseMatrixTranspose._0.entry.0:
# Phi connections
  li t6, 0
  j .F.sparseMatrixTranspose._1.while.cond.0                            # ir inst 1 fin
.F.sparseMatrixTranspose._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.sparseMatrixTranspose._2.while.body.0
  j .F.sparseMatrixTranspose._3.while.exit.0                            # ir inst 4 fin
.F.sparseMatrixTranspose._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a4, t2                                                        # ir inst 6 fin
  mv t5, t6                                                             # ir inst 7 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 8 fin
  lw t5, 0(t3)                                                          # ir inst 9 fin
  sw t5, 0(t4)                                                          # ir inst 10 fin
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a5, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  sw t5, 0(t4)                                                          # ir inst 16 fin
  mv t5, t6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a6, t2                                                        # ir inst 18 fin
  mv t5, t6                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 20 fin
  lw t5, 0(t3)                                                          # ir inst 21 fin
  sw t5, 0(t4)                                                          # ir inst 22 fin
  addi t5, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t6, t5
  j .F.sparseMatrixTranspose._1.while.cond.0                            # ir inst 24 fin
.F.sparseMatrixTranspose._3.while.exit.0:
# Phi connections
  li t6, 1
  j .F.sparseMatrixTranspose._4.while.cond.1                            # ir inst 25 fin
.F.sparseMatrixTranspose._4.while.cond.1:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 27 fin
  bnez t5, .F.sparseMatrixTranspose._5.while.body.1
  j .F.sparseMatrixTranspose._12.while.exit.1                           # ir inst 28 fin
.F.sparseMatrixTranspose._5.while.body.1:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.sparseMatrixTranspose._6.while.cond.2                            # ir inst 29 fin
.F.sparseMatrixTranspose._6.while.cond.2:
  addi t4, a3, -1                                                       # ir inst 32 fin
  slt t3, t5, t4                                                        # ir inst 33 fin
  bnez t3, .F.sparseMatrixTranspose._7.while.body.2
  j .F.sparseMatrixTranspose._11.while.exit.2                           # ir inst 34 fin
.F.sparseMatrixTranspose._7.while.body.2:
  mv t4, t5                                                             # ir inst 35 fin
  slli t2, t4, 2
  add t3, a4, t2                                                        # ir inst 36 fin
  lw t4, 0(t3)                                                          # ir inst 37 fin
  li t2, 100
  mul t3, t4, t2                                                        # ir inst 38 fin
  mv t4, t5                                                             # ir inst 39 fin
  slli t2, t4, 2
  add s11, a5, t2                                                       # ir inst 40 fin
  lw t4, 0(s11)                                                         # ir inst 41 fin
  add s11, t3, t4                                                       # ir inst 42 fin
  mv t4, t5                                                             # ir inst 43 fin
  addi t3, t4, 1                                                        # ir inst 44 fin
  slli t2, t3, 2
  add t4, a4, t2                                                        # ir inst 45 fin
  lw t3, 0(t4)                                                          # ir inst 46 fin
  li t2, 100
  mul t4, t3, t2                                                        # ir inst 47 fin
  mv t3, t5                                                             # ir inst 48 fin
  addi s10, t3, 1                                                       # ir inst 49 fin
  slli t2, s10, 2
  add t3, a5, t2                                                        # ir inst 50 fin
  lw s10, 0(t3)                                                         # ir inst 51 fin
  add t3, t4, s10                                                       # ir inst 52 fin
  slt t4, t3, s11                                                       # ir inst 53 fin
  bnez t4, .F.sparseMatrixTranspose._8.if.then.0
  j .F.sparseMatrixTranspose._9.if.else.0                               # ir inst 54 fin
.F.sparseMatrixTranspose._8.if.then.0:
  mv t4, t5                                                             # ir inst 55 fin
  slli t2, t4, 2
  add t3, a4, t2                                                        # ir inst 56 fin
  lw t4, 0(t3)                                                          # ir inst 57 fin
  mv t3, t5                                                             # ir inst 58 fin
  slli t2, t3, 2
  add s11, a5, t2                                                       # ir inst 59 fin
  lw t3, 0(s11)                                                         # ir inst 60 fin
  mv s11, t5                                                            # ir inst 61 fin
  slli t2, s11, 2
  add s10, a6, t2                                                       # ir inst 62 fin
  lw s11, 0(s10)                                                        # ir inst 63 fin
  mv s10, t5                                                            # ir inst 64 fin
  slli t2, s10, 2
  add s9, a4, t2                                                        # ir inst 65 fin
  mv s10, t5                                                            # ir inst 66 fin
  addi s8, s10, 1                                                       # ir inst 67 fin
  slli t2, s8, 2
  add s10, a4, t2                                                       # ir inst 68 fin
  lw s8, 0(s10)                                                         # ir inst 69 fin
  sw s8, 0(s9)                                                          # ir inst 70 fin
  mv s10, t5                                                            # ir inst 71 fin
  slli t2, s10, 2
  add s9, a5, t2                                                        # ir inst 72 fin
  mv s10, t5                                                            # ir inst 73 fin
  addi s8, s10, 1                                                       # ir inst 74 fin
  slli t2, s8, 2
  add s10, a5, t2                                                       # ir inst 75 fin
  lw s8, 0(s10)                                                         # ir inst 76 fin
  sw s8, 0(s9)                                                          # ir inst 77 fin
  mv s10, t5                                                            # ir inst 78 fin
  slli t2, s10, 2
  add s9, a6, t2                                                        # ir inst 79 fin
  mv s10, t5                                                            # ir inst 80 fin
  addi s8, s10, 1                                                       # ir inst 81 fin
  slli t2, s8, 2
  add s10, a6, t2                                                       # ir inst 82 fin
  lw s8, 0(s10)                                                         # ir inst 83 fin
  sw s8, 0(s9)                                                          # ir inst 84 fin
  mv s10, t5                                                            # ir inst 85 fin
  addi s9, s10, 1                                                       # ir inst 86 fin
  slli t2, s9, 2
  add s10, a4, t2                                                       # ir inst 87 fin
  sw t4, 0(s10)                                                         # ir inst 88 fin
  mv t4, t5                                                             # ir inst 89 fin
  addi s10, t4, 1                                                       # ir inst 90 fin
  slli t2, s10, 2
  add t4, a5, t2                                                        # ir inst 91 fin
  sw t3, 0(t4)                                                          # ir inst 92 fin
  mv t4, t5                                                             # ir inst 93 fin
  addi t3, t4, 1                                                        # ir inst 94 fin
  slli t2, t3, 2
  add t4, a6, t2                                                        # ir inst 95 fin
  sw s11, 0(t4)                                                         # ir inst 96 fin
# Phi connections
  li t4, 1
  j .F.sparseMatrixTranspose._10.if.exit.0                              # ir inst 97 fin
.F.sparseMatrixTranspose._9.if.else.0:
# Phi connections
  mv t4, t6
  j .F.sparseMatrixTranspose._10.if.exit.0                              # ir inst 98 fin
.F.sparseMatrixTranspose._10.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 100 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.sparseMatrixTranspose._6.while.cond.2                            # ir inst 101 fin
.F.sparseMatrixTranspose._11.while.exit.2:
# Phi connections
  j .F.sparseMatrixTranspose._4.while.cond.1                            # ir inst 102 fin
.F.sparseMatrixTranspose._12.while.exit.1:
  j .F.sparseMatrixTranspose.epilogue                                   # ir inst 103 fin
.F.sparseMatrixTranspose.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.calculateSparseSum
.F.calculateSparseSum:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateSparseSum._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateSparseSum._1.while.cond.0                               # ir inst 1 fin
.F.calculateSparseSum._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.calculateSparseSum._2.while.body.0
  j .F.calculateSparseSum._3.while.exit.0                               # ir inst 5 fin
.F.calculateSparseSum._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateSparseSum._1.while.cond.0                               # ir inst 11 fin
.F.calculateSparseSum._3.while.exit.0:
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 12 fin
  mv a0, t6
  j .F.calculateSparseSum.epilogue                                      # ir inst 13 fin
.F.calculateSparseSum.epilogue:
  ret

.globl .F.sparseMatrixMultiplication
.F.sparseMatrixMultiplication:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s10, 0(sp)
  sd s11, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
.F.sparseMatrixMultiplication._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.sparseMatrixMultiplication._1.while.cond.0                       # ir inst 1 fin
.F.sparseMatrixMultiplication._1.while.cond.0:
  slt t4, t5, a3                                                        # ir inst 4 fin
  bnez t4, .F.sparseMatrixMultiplication._2.while.body.0
  j .F.sparseMatrixMultiplication._9.while.exit.0                       # ir inst 5 fin
.F.sparseMatrixMultiplication._2.while.body.0:
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  mv t3, t5                                                             # ir inst 9 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 10 fin
  lw t3, 0(s11)                                                         # ir inst 11 fin
# Phi connections
  mv s10, t6
  li s11, 0
  j .F.sparseMatrixMultiplication._3.while.cond.1                       # ir inst 12 fin
.F.sparseMatrixMultiplication._3.while.cond.1:
  slt s9, s11, a7                                                       # ir inst 15 fin
  bnez s9, .F.sparseMatrixMultiplication._4.while.body.1
  j .F.sparseMatrixMultiplication._8.while.exit.1                       # ir inst 16 fin
.F.sparseMatrixMultiplication._4.while.body.1:
  mv s9, s11                                                            # ir inst 17 fin
  slli t2, s9, 2
  add s8, a4, t2                                                        # ir inst 18 fin
  lw s9, 0(s8)                                                          # ir inst 19 fin
  xor t0, s9, t4
  sltiu s8, t0, 1                                                       # ir inst 20 fin
  bnez s8, .F.sparseMatrixMultiplication._5.if.then.0
  j .F.sparseMatrixMultiplication._6.if.else.0                          # ir inst 21 fin
.F.sparseMatrixMultiplication._5.if.then.0:
  mv s9, s11                                                            # ir inst 22 fin
  slli t2, s9, 2
  add s8, a6, t2                                                        # ir inst 23 fin
  lw s9, 0(s8)                                                          # ir inst 24 fin
  mul s8, t3, s9                                                        # ir inst 25 fin
  add s9, s10, s8                                                       # ir inst 26 fin
# Phi connections
  j .F.sparseMatrixMultiplication._7.if.exit.0                          # ir inst 27 fin
.F.sparseMatrixMultiplication._6.if.else.0:
# Phi connections
  mv s9, s10
  j .F.sparseMatrixMultiplication._7.if.exit.0                          # ir inst 28 fin
.F.sparseMatrixMultiplication._7.if.exit.0:
  addi s8, s11, 1                                                       # ir inst 30 fin
# Phi connections
  mv s10, s9
  mv s11, s8
  j .F.sparseMatrixMultiplication._3.while.cond.1                       # ir inst 31 fin
.F.sparseMatrixMultiplication._8.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  mv t6, s10
  j .F.sparseMatrixMultiplication._1.while.cond.0                       # ir inst 33 fin
.F.sparseMatrixMultiplication._9.while.exit.0:
  li t2, 100000
  rem t5, t6, t2                                                        # ir inst 34 fin
  mv a0, t5
  j .F.sparseMatrixMultiplication.epilogue                              # ir inst 35 fin
.F.sparseMatrixMultiplication.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.performMatrixPerformanceBenchmarks
.F.performMatrixPerformanceBenchmarks:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
.F.performMatrixPerformanceBenchmarks._0.entry.0:
# Start call preparation
  li a0, 1730
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 1731
  call printlnInt
# ir inst 2 fin
# Start call preparation
  call .F.performLargeMatrixBenchmark
# ir inst 3 fin
# Start call preparation
  li a0, 1732
  call printlnInt
# ir inst 4 fin
# Start call preparation
  call .F.performRepeatedOperationsBenchmark
# ir inst 5 fin
# Start call preparation
  li a0, 1733
  call printlnInt
# ir inst 6 fin
# Start call preparation
  call .F.performMemoryAccessBenchmark
# ir inst 7 fin
  j .F.performMatrixPerformanceBenchmarks.epilogue                      # ir inst 8 fin
.F.performMatrixPerformanceBenchmarks.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performLargeMatrixBenchmark
.F.performLargeMatrixBenchmark:
# spill func args num: 0,             range:     7520(sp) -     7520(sp)
# local var size: 7500,               range:       16(sp) -     7516(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -7520
  add sp, sp, t0
  sd ra, 8(sp)
.F.performLargeMatrixBenchmark._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performLargeMatrixBenchmark._1.array.cond.0                      # ir inst 3 fin
.F.performLargeMatrixBenchmark._1.array.cond.0:
  li t2, 625
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performLargeMatrixBenchmark._2.array.body.0
  j .F.performLargeMatrixBenchmark._3.array.exit.0                      # ir inst 6 fin
.F.performLargeMatrixBenchmark._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performLargeMatrixBenchmark._1.array.cond.0                      # ir inst 10 fin
.F.performLargeMatrixBenchmark._3.array.exit.0:
  li t1, 2516
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.performLargeMatrixBenchmark._4.array.cond.1                      # ir inst 13 fin
.F.performLargeMatrixBenchmark._4.array.cond.1:
  li t2, 625
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.performLargeMatrixBenchmark._5.array.body.1
  j .F.performLargeMatrixBenchmark._6.array.exit.1                      # ir inst 16 fin
.F.performLargeMatrixBenchmark._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.performLargeMatrixBenchmark._4.array.cond.1                      # ir inst 20 fin
.F.performLargeMatrixBenchmark._6.array.exit.1:
  li t1, 5016
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.performLargeMatrixBenchmark._7.array.cond.2                      # ir inst 23 fin
.F.performLargeMatrixBenchmark._7.array.cond.2:
  li t2, 625
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.performLargeMatrixBenchmark._8.array.body.2
  j .F.performLargeMatrixBenchmark._9.array.exit.2                      # ir inst 26 fin
.F.performLargeMatrixBenchmark._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.performLargeMatrixBenchmark._7.array.cond.2                      # ir inst 30 fin
.F.performLargeMatrixBenchmark._9.array.exit.2:
# Start call preparation
  li a2, 25
  li t1, 2516
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeLargeMatrices
# ir inst 31 fin
# Phi connections
  li t6, 0
  j .F.performLargeMatrixBenchmark._10.while.cond.0                     # ir inst 32 fin
.F.performLargeMatrixBenchmark._10.while.cond.0:
  li t2, 3
  slt t5, t6, t2                                                        # ir inst 34 fin
  bnez t5, .F.performLargeMatrixBenchmark._11.while.body.0
  j .F.performLargeMatrixBenchmark._12.while.exit.0                     # ir inst 35 fin
.F.performLargeMatrixBenchmark._11.while.body.0:
# Start call preparation
  sd t6, 0(sp)
  li a3, 25
  li t1, 5016
  add t1, sp, t1
  mv a2, t1
  li t1, 2516
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.matrixMultiplication625
  ld t6, 0(sp)
# ir inst 36 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 25
  addi t1, sp, 16
  mv a1, t1
  li t1, 5016
  add t1, sp, t1
  mv a0, t1
  call .F.copyMatrix625
  ld t6, 0(sp)
# ir inst 37 fin
  addi t5, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t6, t5
  j .F.performLargeMatrixBenchmark._10.while.cond.0                     # ir inst 39 fin
.F.performLargeMatrixBenchmark._12.while.exit.0:
# Start call preparation
  li a1, 25
  li t1, 5016
  add t1, sp, t1
  mv a0, t1
  call .F.calculateMatrixSum625
  mv t6, a0
# ir inst 40 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 41 fin
  j .F.performLargeMatrixBenchmark.epilogue                             # ir inst 42 fin
.F.performLargeMatrixBenchmark.epilogue:
  ld ra, 8(sp)
  li t0, 7520
  add sp, sp, t0
  ret

.globl .F.initializeLargeMatrices
.F.initializeLargeMatrices:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeLargeMatrices._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeLargeMatrices._1.while.cond.0                          # ir inst 1 fin
.F.initializeLargeMatrices._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.initializeLargeMatrices._2.while.body.0
  j .F.initializeLargeMatrices._6.while.exit.0                          # ir inst 4 fin
.F.initializeLargeMatrices._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeLargeMatrices._3.while.cond.1                          # ir inst 5 fin
.F.initializeLargeMatrices._3.while.cond.1:
  slt t4, t5, a2                                                        # ir inst 7 fin
  bnez t4, .F.initializeLargeMatrices._4.while.body.1
  j .F.initializeLargeMatrices._5.while.exit.1                          # ir inst 8 fin
.F.initializeLargeMatrices._4.while.body.1:
  mul t4, t6, a2                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  add t4, t6, t5                                                        # ir inst 13 fin
  li t2, 10
  rem s10, t4, t2                                                       # ir inst 14 fin
  addi t4, s10, 1                                                       # ir inst 15 fin
  sw t4, 0(s11)                                                         # ir inst 16 fin
  mv t4, t3                                                             # ir inst 17 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 18 fin
  mul t4, t6, t5                                                        # ir inst 19 fin
  li t2, 7
  rem s11, t4, t2                                                       # ir inst 20 fin
  addi t4, s11, 1                                                       # ir inst 21 fin
  sw t4, 0(t3)                                                          # ir inst 22 fin
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.initializeLargeMatrices._3.while.cond.1                          # ir inst 24 fin
.F.initializeLargeMatrices._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t5
  j .F.initializeLargeMatrices._1.while.cond.0                          # ir inst 26 fin
.F.initializeLargeMatrices._6.while.exit.0:
  j .F.initializeLargeMatrices.epilogue                                 # ir inst 27 fin
.F.initializeLargeMatrices.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.matrixMultiplication625
.F.matrixMultiplication625:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s9, 8(sp)
  sd s8, 16(sp)
  sd s10, 24(sp)
.F.matrixMultiplication625._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixMultiplication625._1.while.cond.0                          # ir inst 1 fin
.F.matrixMultiplication625._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.matrixMultiplication625._2.while.body.0
  j .F.matrixMultiplication625._9.while.exit.0                          # ir inst 4 fin
.F.matrixMultiplication625._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrixMultiplication625._3.while.cond.1                          # ir inst 5 fin
.F.matrixMultiplication625._3.while.cond.1:
  slt t4, t5, a3                                                        # ir inst 7 fin
  bnez t4, .F.matrixMultiplication625._4.while.body.1
  j .F.matrixMultiplication625._8.while.exit.1                          # ir inst 8 fin
.F.matrixMultiplication625._4.while.body.1:
  mul t4, t6, a3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  li t4, 0
  j .F.matrixMultiplication625._5.while.cond.2                          # ir inst 14 fin
.F.matrixMultiplication625._5.while.cond.2:
  slt t3, t4, a3                                                        # ir inst 16 fin
  bnez t3, .F.matrixMultiplication625._6.while.body.2
  j .F.matrixMultiplication625._7.while.exit.2                          # ir inst 17 fin
.F.matrixMultiplication625._6.while.body.2:
  mul t3, t6, a3                                                        # ir inst 18 fin
  add s11, t3, t5                                                       # ir inst 19 fin
  mv t3, s11                                                            # ir inst 20 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 21 fin
  mul t3, t6, a3                                                        # ir inst 22 fin
  add s10, t3, t5                                                       # ir inst 23 fin
  mv t3, s10                                                            # ir inst 24 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 25 fin
  lw t3, 0(s10)                                                         # ir inst 26 fin
  mul s10, t6, a3                                                       # ir inst 27 fin
  add s9, s10, t4                                                       # ir inst 28 fin
  mv s10, s9                                                            # ir inst 29 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 30 fin
  lw s10, 0(s9)                                                         # ir inst 31 fin
  mul s9, t4, a3                                                        # ir inst 32 fin
  add s8, s9, t5                                                        # ir inst 33 fin
  mv s9, s8                                                             # ir inst 34 fin
  slli t2, s9, 2
  add s8, a1, t2                                                        # ir inst 35 fin
  lw s9, 0(s8)                                                          # ir inst 36 fin
  mul s8, s10, s9                                                       # ir inst 37 fin
  add s10, t3, s8                                                       # ir inst 38 fin
  sw s10, 0(s11)                                                        # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F.matrixMultiplication625._5.while.cond.2                          # ir inst 41 fin
.F.matrixMultiplication625._7.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  j .F.matrixMultiplication625._3.while.cond.1                          # ir inst 43 fin
.F.matrixMultiplication625._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t6, t5
  j .F.matrixMultiplication625._1.while.cond.0                          # ir inst 45 fin
.F.matrixMultiplication625._9.while.exit.0:
  j .F.matrixMultiplication625.epilogue                                 # ir inst 46 fin
.F.matrixMultiplication625.epilogue:
  ld s11, 0(sp)
  ld s9, 8(sp)
  ld s8, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.copyMatrix625
.F.copyMatrix625:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.copyMatrix625._0.entry.0:
# Phi connections
  li t6, 0
  j .F.copyMatrix625._1.while.cond.0                                    # ir inst 1 fin
.F.copyMatrix625._1.while.cond.0:
  mul t5, a2, a2                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.copyMatrix625._2.while.body.0
  j .F.copyMatrix625._3.while.exit.0                                    # ir inst 5 fin
.F.copyMatrix625._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  lw t5, 0(t3)                                                          # ir inst 10 fin
  sw t5, 0(t4)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.copyMatrix625._1.while.cond.0                                    # ir inst 13 fin
.F.copyMatrix625._3.while.exit.0:
  j .F.copyMatrix625.epilogue                                           # ir inst 14 fin
.F.copyMatrix625.epilogue:
  ret

.globl .F.calculateMatrixSum625
.F.calculateMatrixSum625:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateMatrixSum625._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixSum625._1.while.cond.0                            # ir inst 1 fin
.F.calculateMatrixSum625._1.while.cond.0:
  mul t4, a1, a1                                                        # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.calculateMatrixSum625._2.while.body.0
  j .F.calculateMatrixSum625._3.while.exit.0                            # ir inst 6 fin
.F.calculateMatrixSum625._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  add t3, t5, t4                                                        # ir inst 10 fin
  li t2, 1000000
  rem t4, t3, t2                                                        # ir inst 11 fin
  addi t3, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.calculateMatrixSum625._1.while.cond.0                            # ir inst 13 fin
.F.calculateMatrixSum625._3.while.exit.0:
  li t2, 1000000
  rem t6, t5, t2                                                        # ir inst 14 fin
  mv a0, t6
  j .F.calculateMatrixSum625.epilogue                                   # ir inst 15 fin
.F.calculateMatrixSum625.epilogue:
  ret

.globl .F.performRepeatedOperationsBenchmark
.F.performRepeatedOperationsBenchmark:
# spill func args num: 0,             range:     1168(sp) -     1168(sp)
# local var size: 1152,               range:       16(sp) -     1168(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1168
  sd ra, 8(sp)
.F.performRepeatedOperationsBenchmark._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performRepeatedOperationsBenchmark._1.array.cond.0               # ir inst 3 fin
.F.performRepeatedOperationsBenchmark._1.array.cond.0:
  li t2, 144
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performRepeatedOperationsBenchmark._2.array.body.0
  j .F.performRepeatedOperationsBenchmark._3.array.exit.0               # ir inst 6 fin
.F.performRepeatedOperationsBenchmark._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performRepeatedOperationsBenchmark._1.array.cond.0               # ir inst 10 fin
.F.performRepeatedOperationsBenchmark._3.array.exit.0:
  addi t1, sp, 592
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.performRepeatedOperationsBenchmark._4.array.cond.1               # ir inst 13 fin
.F.performRepeatedOperationsBenchmark._4.array.cond.1:
  li t2, 144
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.performRepeatedOperationsBenchmark._5.array.body.1
  j .F.performRepeatedOperationsBenchmark._6.array.exit.1               # ir inst 16 fin
.F.performRepeatedOperationsBenchmark._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.performRepeatedOperationsBenchmark._4.array.cond.1               # ir inst 20 fin
.F.performRepeatedOperationsBenchmark._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F.performRepeatedOperationsBenchmark._7.while.cond.0               # ir inst 21 fin
.F.performRepeatedOperationsBenchmark._7.while.cond.0:
  li t2, 144
  slt t5, t6, t2                                                        # ir inst 23 fin
  bnez t5, .F.performRepeatedOperationsBenchmark._8.while.body.0
  j .F.performRepeatedOperationsBenchmark._9.while.exit.0               # ir inst 24 fin
.F.performRepeatedOperationsBenchmark._8.while.body.0:
  mv t5, t6                                                             # ir inst 25 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 26 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 27 fin
  addi t3, t5, 7                                                        # ir inst 28 fin
  li t2, 20
  rem t5, t3, t2                                                        # ir inst 29 fin
  sw t5, 0(t4)                                                          # ir inst 30 fin
  addi t5, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t6, t5
  j .F.performRepeatedOperationsBenchmark._7.while.cond.0               # ir inst 32 fin
.F.performRepeatedOperationsBenchmark._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.performRepeatedOperationsBenchmark._10.while.cond.1              # ir inst 33 fin
.F.performRepeatedOperationsBenchmark._10.while.cond.1:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 35 fin
  bnez t5, .F.performRepeatedOperationsBenchmark._11.while.body.1
  j .F.performRepeatedOperationsBenchmark._12.while.exit.1              # ir inst 36 fin
.F.performRepeatedOperationsBenchmark._11.while.body.1:
# Start call preparation
  sd t6, 0(sp)
  li a2, 12
  addi t1, sp, 592
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.matrixTranspose144
  ld t6, 0(sp)
# ir inst 37 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 12
  addi t1, sp, 16
  mv a1, t1
  addi t1, sp, 592
  mv a0, t1
  call .F.copyMatrix144
  ld t6, 0(sp)
# ir inst 38 fin
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F.performRepeatedOperationsBenchmark._10.while.cond.1              # ir inst 40 fin
.F.performRepeatedOperationsBenchmark._12.while.exit.1:
# Start call preparation
  li a1, 12
  addi t1, sp, 16
  mv a0, t1
  call .F.calculateMatrixSum144
  mv t6, a0
# ir inst 41 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 42 fin
  j .F.performRepeatedOperationsBenchmark.epilogue                      # ir inst 43 fin
.F.performRepeatedOperationsBenchmark.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 1168
  ret

.globl .F.matrixTranspose144
.F.matrixTranspose144:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.matrixTranspose144._0.entry.0:
# Phi connections
  li t6, 0
  j .F.matrixTranspose144._1.while.cond.0                               # ir inst 1 fin
.F.matrixTranspose144._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.matrixTranspose144._2.while.body.0
  j .F.matrixTranspose144._6.while.exit.0                               # ir inst 4 fin
.F.matrixTranspose144._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrixTranspose144._3.while.cond.1                               # ir inst 5 fin
.F.matrixTranspose144._3.while.cond.1:
  slt t4, t5, a2                                                        # ir inst 7 fin
  bnez t4, .F.matrixTranspose144._4.while.body.1
  j .F.matrixTranspose144._5.while.exit.1                               # ir inst 8 fin
.F.matrixTranspose144._4.while.body.1:
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
  j .F.matrixTranspose144._3.while.cond.1                               # ir inst 20 fin
.F.matrixTranspose144._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.matrixTranspose144._1.while.cond.0                               # ir inst 22 fin
.F.matrixTranspose144._6.while.exit.0:
  j .F.matrixTranspose144.epilogue                                      # ir inst 23 fin
.F.matrixTranspose144.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.copyMatrix144
.F.copyMatrix144:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.copyMatrix144._0.entry.0:
# Phi connections
  li t6, 0
  j .F.copyMatrix144._1.while.cond.0                                    # ir inst 1 fin
.F.copyMatrix144._1.while.cond.0:
  li t2, 144
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.copyMatrix144._2.while.body.0
  j .F.copyMatrix144._3.while.exit.0                                    # ir inst 4 fin
.F.copyMatrix144._2.while.body.0:
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
  j .F.copyMatrix144._1.while.cond.0                                    # ir inst 12 fin
.F.copyMatrix144._3.while.exit.0:
  j .F.copyMatrix144.epilogue                                           # ir inst 13 fin
.F.copyMatrix144.epilogue:
  ret

.globl .F.calculateMatrixSum144
.F.calculateMatrixSum144:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateMatrixSum144._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixSum144._1.while.cond.0                            # ir inst 1 fin
.F.calculateMatrixSum144._1.while.cond.0:
  mul t4, a1, a1                                                        # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.calculateMatrixSum144._2.while.body.0
  j .F.calculateMatrixSum144._3.while.exit.0                            # ir inst 6 fin
.F.calculateMatrixSum144._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  add t3, t5, t4                                                        # ir inst 10 fin
  addi t4, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateMatrixSum144._1.while.cond.0                            # ir inst 12 fin
.F.calculateMatrixSum144._3.while.exit.0:
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 13 fin
  mv a0, t6
  j .F.calculateMatrixSum144.epilogue                                   # ir inst 14 fin
.F.calculateMatrixSum144.epilogue:
  ret

.globl .F.performMemoryAccessBenchmark
.F.performMemoryAccessBenchmark:
# spill func args num: 0,             range:     1072(sp) -     1072(sp)
# local var size: 1024,               range:       48(sp) -     1072(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1072
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.performMemoryAccessBenchmark._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performMemoryAccessBenchmark._1.array.cond.0                     # ir inst 3 fin
.F.performMemoryAccessBenchmark._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performMemoryAccessBenchmark._2.array.body.0
  j .F.performMemoryAccessBenchmark._3.array.exit.0                     # ir inst 6 fin
.F.performMemoryAccessBenchmark._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performMemoryAccessBenchmark._1.array.cond.0                     # ir inst 10 fin
.F.performMemoryAccessBenchmark._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.performMemoryAccessBenchmark._4.while.cond.0                     # ir inst 11 fin
.F.performMemoryAccessBenchmark._4.while.cond.0:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.performMemoryAccessBenchmark._5.while.body.0
  j .F.performMemoryAccessBenchmark._6.while.exit.0                     # ir inst 14 fin
.F.performMemoryAccessBenchmark._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  addi t1, sp, 48
  add t4, t1, t2                                                        # ir inst 16 fin
  addi t5, t6, 1                                                        # ir inst 17 fin
  sw t5, 0(t4)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.performMemoryAccessBenchmark._4.while.cond.0                     # ir inst 20 fin
.F.performMemoryAccessBenchmark._6.while.exit.0:
# Start call preparation
  li a1, 16
  addi t1, sp, 48
  mv a0, t1
  call .F.testRowMajorAccess
  mv t6, a0
# ir inst 21 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 16
  addi t1, sp, 48
  mv a0, t1
  call .F.testColumnMajorAccess
  mv t5, a0
  ld t6, 0(sp)
# ir inst 22 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 16
  addi t1, sp, 48
  mv a0, t1
  call .F.testDiagonalAccess
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 23 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a1, 16
  addi t1, sp, 48
  mv a0, t1
  call .F.testRandomAccess
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 24 fin
  add s11, t6, t5                                                       # ir inst 25 fin
  add t6, s11, t4                                                       # ir inst 26 fin
  add t5, t6, t3                                                        # ir inst 27 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 28 fin
  j .F.performMemoryAccessBenchmark.epilogue                            # ir inst 29 fin
.F.performMemoryAccessBenchmark.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 1072
  ret

.globl .F.testRowMajorAccess
.F.testRowMajorAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.testRowMajorAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testRowMajorAccess._1.while.cond.0                               # ir inst 1 fin
.F.testRowMajorAccess._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.testRowMajorAccess._2.while.body.0
  j .F.testRowMajorAccess._6.while.exit.0                               # ir inst 5 fin
.F.testRowMajorAccess._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.testRowMajorAccess._3.while.cond.1                               # ir inst 6 fin
.F.testRowMajorAccess._3.while.cond.1:
  slt s11, t4, a1                                                       # ir inst 9 fin
  bnez s11, .F.testRowMajorAccess._4.while.body.1
  j .F.testRowMajorAccess._5.while.exit.1                               # ir inst 10 fin
.F.testRowMajorAccess._4.while.body.1:
  mul s11, t6, a1                                                       # ir inst 11 fin
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
  j .F.testRowMajorAccess._3.while.cond.1                               # ir inst 18 fin
.F.testRowMajorAccess._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testRowMajorAccess._1.while.cond.0                               # ir inst 20 fin
.F.testRowMajorAccess._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 21 fin
  mv a0, t6
  j .F.testRowMajorAccess.epilogue                                      # ir inst 22 fin
.F.testRowMajorAccess.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testColumnMajorAccess
.F.testColumnMajorAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.testColumnMajorAccess._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testColumnMajorAccess._1.while.cond.0                            # ir inst 1 fin
.F.testColumnMajorAccess._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.testColumnMajorAccess._2.while.body.0
  j .F.testColumnMajorAccess._6.while.exit.0                            # ir inst 5 fin
.F.testColumnMajorAccess._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.testColumnMajorAccess._3.while.cond.1                            # ir inst 6 fin
.F.testColumnMajorAccess._3.while.cond.1:
  slt s11, t4, a1                                                       # ir inst 9 fin
  bnez s11, .F.testColumnMajorAccess._4.while.body.1
  j .F.testColumnMajorAccess._5.while.exit.1                            # ir inst 10 fin
.F.testColumnMajorAccess._4.while.body.1:
  mul s11, t4, a1                                                       # ir inst 11 fin
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
  j .F.testColumnMajorAccess._3.while.cond.1                            # ir inst 18 fin
.F.testColumnMajorAccess._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testColumnMajorAccess._1.while.cond.0                            # ir inst 20 fin
.F.testColumnMajorAccess._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 21 fin
  mv a0, t6
  j .F.testColumnMajorAccess.epilogue                                   # ir inst 22 fin
.F.testColumnMajorAccess.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testDiagonalAccess
.F.testDiagonalAccess:
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
.F.testDiagonalAccess._0.entry.0:
  addi t6, a1, -1                                                       # ir inst 1 fin
  li t1, 0
  sub t5, t1, t6                                                        # ir inst 2 fin
# Phi connections
  mv t6, t5
  li t5, 0
  j .F.testDiagonalAccess._1.while.cond.0                               # ir inst 3 fin
.F.testDiagonalAccess._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 6 fin
  bnez t4, .F.testDiagonalAccess._2.while.body.0
  j .F.testDiagonalAccess._12.while.exit.0                              # ir inst 7 fin
.F.testDiagonalAccess._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.testDiagonalAccess._3.while.cond.1                               # ir inst 8 fin
.F.testDiagonalAccess._3.while.cond.1:
  slt s11, t4, a1                                                       # ir inst 11 fin
  bnez s11, .F.testDiagonalAccess._4.while.body.1
  j .F.testDiagonalAccess._11.while.exit.1                              # ir inst 12 fin
.F.testDiagonalAccess._4.while.body.1:
  add s11, t4, t6                                                       # ir inst 13 fin
  li t2, 0
  slt t0, s11, t2
  xori s10, t0, 1                                                       # ir inst 14 fin
  bnez s10, .F.testDiagonalAccess._5.lazy.then.0
  j .F.testDiagonalAccess._6.lazy.else.0                                # ir inst 15 fin
.F.testDiagonalAccess._5.lazy.then.0:
  slt s10, s11, a1                                                      # ir inst 16 fin
# Phi connections
  j .F.testDiagonalAccess._7.lazy.exit.0                                # ir inst 17 fin
.F.testDiagonalAccess._6.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.testDiagonalAccess._7.lazy.exit.0                                # ir inst 18 fin
.F.testDiagonalAccess._7.lazy.exit.0:
  bnez s10, .F.testDiagonalAccess._8.if.then.0
  j .F.testDiagonalAccess._9.if.else.0                                  # ir inst 20 fin
.F.testDiagonalAccess._8.if.then.0:
  mul s10, t4, a1                                                       # ir inst 21 fin
  add s9, s10, s11                                                      # ir inst 22 fin
  mv s11, s9                                                            # ir inst 23 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 24 fin
  lw s11, 0(s10)                                                        # ir inst 25 fin
  add s10, t3, s11                                                      # ir inst 26 fin
# Phi connections
  mv s11, s10
  j .F.testDiagonalAccess._10.if.exit.0                                 # ir inst 27 fin
.F.testDiagonalAccess._9.if.else.0:
# Phi connections
  mv s11, t3
  j .F.testDiagonalAccess._10.if.exit.0                                 # ir inst 28 fin
.F.testDiagonalAccess._10.if.exit.0:
  addi s10, t4, 1                                                       # ir inst 30 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.testDiagonalAccess._3.while.cond.1                               # ir inst 31 fin
.F.testDiagonalAccess._11.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testDiagonalAccess._1.while.cond.0                               # ir inst 33 fin
.F.testDiagonalAccess._12.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 34 fin
  mv a0, t6
  j .F.testDiagonalAccess.epilogue                                      # ir inst 35 fin
.F.testDiagonalAccess.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testRandomAccess
.F.testRandomAccess:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.testRandomAccess._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 7
  li t6, 0
  j .F.testRandomAccess._1.while.cond.0                                 # ir inst 1 fin
.F.testRandomAccess._1.while.cond.0:
  li t2, 100
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.testRandomAccess._2.while.body.0
  j .F.testRandomAccess._3.while.exit.0                                 # ir inst 6 fin
.F.testRandomAccess._2.while.body.0:
  li t2, 17
  mul t3, t5, t2                                                        # ir inst 7 fin
  addi t5, t3, 5                                                        # ir inst 8 fin
  li t2, 251
  rem t3, t5, t2                                                        # ir inst 9 fin
  rem t5, t3, a1                                                        # ir inst 10 fin
  li t2, 13
  mul s11, t3, t2                                                       # ir inst 11 fin
  addi t3, s11, 11                                                      # ir inst 12 fin
  li t2, 251
  rem s11, t3, t2                                                       # ir inst 13 fin
  rem t3, s11, a1                                                       # ir inst 14 fin
  mul s10, t5, a1                                                       # ir inst 15 fin
  add t5, s10, t3                                                       # ir inst 16 fin
  mv t3, t5                                                             # ir inst 17 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 18 fin
  lw t3, 0(t5)                                                          # ir inst 19 fin
  add t5, t4, t3                                                        # ir inst 20 fin
  addi t3, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t4, t5
  mv t5, s11
  mv t6, t3
  j .F.testRandomAccess._1.while.cond.0                                 # ir inst 22 fin
.F.testRandomAccess._3.while.exit.0:
  li t2, 10000
  rem t6, t4, t2                                                        # ir inst 23 fin
  mv a0, t6
  j .F.testRandomAccess.epilogue                                        # ir inst 24 fin
.F.testRandomAccess.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testMatrixEdgeCases
.F.testMatrixEdgeCases:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
.F.testMatrixEdgeCases._0.entry.0:
# Start call preparation
  li a0, 1740
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testSingleElementMatrix
# ir inst 2 fin
# Start call preparation
  call .F.testMinimalMatrices
# ir inst 3 fin
# Start call preparation
  call .F.testBoundaryValueMatrices
# ir inst 4 fin
# Start call preparation
  call .F.testOverflowConditions
# ir inst 5 fin
# Start call preparation
  li a0, 1749
  call printlnInt
# ir inst 6 fin
  j .F.testMatrixEdgeCases.epilogue                                     # ir inst 7 fin
.F.testMatrixEdgeCases.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testSingleElementMatrix
.F.testSingleElementMatrix:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 8,                  range:       16(sp) -       24(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 8(sp)
.F.testSingleElementMatrix._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 42
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 7 fin
  addi t1, sp, 16
  addi t5, t1, 0                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  addi t1, sp, 16
  addi t5, t1, 0                                                        # ir inst 10 fin
  lw t3, 0(t5)                                                          # ir inst 11 fin
  add t5, t4, t3                                                        # ir inst 12 fin
  sw t5, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 16 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 17 fin
  addi t1, sp, 16
  addi t5, t1, 0                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  addi t1, sp, 16
  addi t5, t1, 0                                                        # ir inst 20 fin
  lw t3, 0(t5)                                                          # ir inst 21 fin
  mul t5, t4, t3                                                        # ir inst 22 fin
  sw t5, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 24 fin
  lw t5, 0(t6)                                                          # ir inst 25 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 26 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 27 fin
  addi t1, sp, 16
  addi t5, t1, 0                                                        # ir inst 28 fin
  lw t4, 0(t5)                                                          # ir inst 29 fin
  sw t4, 0(t6)                                                          # ir inst 30 fin
  addi t1, sp, 20
  addi t6, t1, 0                                                        # ir inst 31 fin
  lw t5, 0(t6)                                                          # ir inst 32 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 33 fin
  j .F.testSingleElementMatrix.epilogue                                 # ir inst 34 fin
.F.testSingleElementMatrix.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 32
  ret

.globl .F.testMinimalMatrices
.F.testMinimalMatrices:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 32,                 range:       16(sp) -       48(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 8(sp)
.F.testMinimalMatrices._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 11 fin
# Phi connections
  li t5, 0
  j .F.testMinimalMatrices._1.array.cond.0                              # ir inst 12 fin
.F.testMinimalMatrices._1.array.cond.0:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 14 fin
  bnez t4, .F.testMinimalMatrices._2.array.body.0
  j .F.testMinimalMatrices._3.array.exit.0                              # ir inst 15 fin
.F.testMinimalMatrices._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 16 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 17 fin
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.testMinimalMatrices._1.array.cond.0                              # ir inst 19 fin
.F.testMinimalMatrices._3.array.exit.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 20 fin
  addi t1, sp, 16
  addi t5, t1, 0                                                        # ir inst 21 fin
  lw t4, 0(t5)                                                          # ir inst 22 fin
  sw t4, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 32
  addi t6, t1, 4                                                        # ir inst 24 fin
  addi t1, sp, 16
  addi t5, t1, 8                                                        # ir inst 25 fin
  lw t4, 0(t5)                                                          # ir inst 26 fin
  sw t4, 0(t6)                                                          # ir inst 27 fin
  addi t1, sp, 32
  addi t6, t1, 8                                                        # ir inst 28 fin
  addi t1, sp, 16
  addi t5, t1, 4                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
  sw t4, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 32
  addi t6, t1, 12                                                       # ir inst 32 fin
  addi t1, sp, 16
  addi t5, t1, 12                                                       # ir inst 33 fin
  lw t4, 0(t5)                                                          # ir inst 34 fin
  sw t4, 0(t6)                                                          # ir inst 35 fin
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 36 fin
  lw t5, 0(t6)                                                          # ir inst 37 fin
  addi t1, sp, 32
  addi t6, t1, 4                                                        # ir inst 38 fin
  lw t4, 0(t6)                                                          # ir inst 39 fin
  add t6, t5, t4                                                        # ir inst 40 fin
  addi t1, sp, 32
  addi t5, t1, 8                                                        # ir inst 41 fin
  lw t4, 0(t5)                                                          # ir inst 42 fin
  add t5, t6, t4                                                        # ir inst 43 fin
  addi t1, sp, 32
  addi t6, t1, 12                                                       # ir inst 44 fin
  lw t4, 0(t6)                                                          # ir inst 45 fin
  add t6, t5, t4                                                        # ir inst 46 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 47 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 48 fin
  lw t5, 0(t6)                                                          # ir inst 49 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 50 fin
  lw t4, 0(t6)                                                          # ir inst 51 fin
  mul t6, t5, t4                                                        # ir inst 52 fin
  addi t1, sp, 16
  addi t5, t1, 4                                                        # ir inst 53 fin
  lw t4, 0(t5)                                                          # ir inst 54 fin
  addi t1, sp, 16
  addi t5, t1, 8                                                        # ir inst 55 fin
  lw t3, 0(t5)                                                          # ir inst 56 fin
  mul t5, t4, t3                                                        # ir inst 57 fin
  sub t4, t6, t5                                                        # ir inst 58 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 59 fin
  j .F.testMinimalMatrices.epilogue                                     # ir inst 60 fin
.F.testMinimalMatrices.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 48
  ret

.globl .F.testBoundaryValueMatrices
.F.testBoundaryValueMatrices:
# spill func args num: 0,             range:      192(sp) -      192(sp)
# local var size: 164,                range:       16(sp) -      180(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -192
  sd ra, 8(sp)
.F.testBoundaryValueMatrices._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testBoundaryValueMatrices._1.array.cond.0                        # ir inst 3 fin
.F.testBoundaryValueMatrices._1.array.cond.0:
  li t2, 9
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testBoundaryValueMatrices._2.array.body.0
  j .F.testBoundaryValueMatrices._3.array.exit.0                        # ir inst 6 fin
.F.testBoundaryValueMatrices._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testBoundaryValueMatrices._1.array.cond.0                        # ir inst 10 fin
.F.testBoundaryValueMatrices._3.array.exit.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 10000
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 13 fin
  li t1, -10000
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 15 fin
  li t1, 5000
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 17 fin
  li t1, -5000
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 16
  addi t6, t1, 16                                                       # ir inst 19 fin
  li t1, 20000
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 16
  addi t6, t1, 20                                                       # ir inst 21 fin
  li t1, -20000
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t1, sp, 16
  addi t6, t1, 24                                                       # ir inst 23 fin
  li t1, 15000
  sw t1, 0(t6)                                                          # ir inst 24 fin
  addi t1, sp, 16
  addi t6, t1, 28                                                       # ir inst 25 fin
  li t1, -15000
  sw t1, 0(t6)                                                          # ir inst 26 fin
  addi t1, sp, 16
  addi t6, t1, 32                                                       # ir inst 27 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 28 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testBoundaryValueMatrices._4.while.cond.0                        # ir inst 29 fin
.F.testBoundaryValueMatrices._4.while.cond.0:
  li t2, 9
  slt t4, t6, t2                                                        # ir inst 32 fin
  bnez t4, .F.testBoundaryValueMatrices._5.while.body.0
  j .F.testBoundaryValueMatrices._6.while.exit.0                        # ir inst 33 fin
.F.testBoundaryValueMatrices._5.while.body.0:
  mv t4, t6                                                             # ir inst 34 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 35 fin
  lw t4, 0(t3)                                                          # ir inst 36 fin
  add t3, t5, t4                                                        # ir inst 37 fin
  addi t4, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testBoundaryValueMatrices._4.while.cond.0                        # ir inst 39 fin
.F.testBoundaryValueMatrices._6.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 40 fin
  addi t1, sp, 52
  addi t6, t1, 0                                                        # ir inst 42 fin
# Phi connections
  li t5, 0
  j .F.testBoundaryValueMatrices._7.array.cond.1                        # ir inst 43 fin
.F.testBoundaryValueMatrices._7.array.cond.1:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 45 fin
  bnez t4, .F.testBoundaryValueMatrices._8.array.body.1
  j .F.testBoundaryValueMatrices._9.array.exit.1                        # ir inst 46 fin
.F.testBoundaryValueMatrices._8.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 47 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 48 fin
  addi t4, t5, 1                                                        # ir inst 49 fin
# Phi connections
  mv t5, t4
  j .F.testBoundaryValueMatrices._7.array.cond.1                        # ir inst 50 fin
.F.testBoundaryValueMatrices._9.array.exit.1:
# Start call preparation
  addi t1, sp, 52
  mv a0, t1
  call .F.calculateMatrixSum16
  mv t6, a0
# ir inst 51 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 52 fin
  addi t1, sp, 116
  addi t6, t1, 0                                                        # ir inst 54 fin
# Phi connections
  li t5, 0
  j .F.testBoundaryValueMatrices._10.array.cond.2                       # ir inst 55 fin
.F.testBoundaryValueMatrices._10.array.cond.2:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 57 fin
  bnez t4, .F.testBoundaryValueMatrices._11.array.body.2
  j .F.testBoundaryValueMatrices._12.array.exit.2                       # ir inst 58 fin
.F.testBoundaryValueMatrices._11.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 59 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 60 fin
  addi t4, t5, 1                                                        # ir inst 61 fin
# Phi connections
  mv t5, t4
  j .F.testBoundaryValueMatrices._10.array.cond.2                       # ir inst 62 fin
.F.testBoundaryValueMatrices._12.array.exit.2:
# Start call preparation
  addi t1, sp, 116
  mv a0, t1
  call .F.calculateMatrixSum16
  mv t6, a0
# ir inst 63 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 64 fin
  j .F.testBoundaryValueMatrices.epilogue                               # ir inst 65 fin
.F.testBoundaryValueMatrices.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 192
  ret

.globl .F.calculateMatrixSum16
.F.calculateMatrixSum16:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateMatrixSum16._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateMatrixSum16._1.while.cond.0                             # ir inst 1 fin
.F.calculateMatrixSum16._1.while.cond.0:
  li t2, 16
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.calculateMatrixSum16._2.while.body.0
  j .F.calculateMatrixSum16._3.while.exit.0                             # ir inst 5 fin
.F.calculateMatrixSum16._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateMatrixSum16._1.while.cond.0                             # ir inst 11 fin
.F.calculateMatrixSum16._3.while.exit.0:
  mv a0, t5
  j .F.calculateMatrixSum16.epilogue                                    # ir inst 12 fin
.F.calculateMatrixSum16.epilogue:
  ret

.globl .F.testOverflowConditions
.F.testOverflowConditions:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 48,                 range:       24(sp) -       72(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 1 / 12,        range:        8(sp) -       16(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 8(sp)
  sd ra, 16(sp)
.F.testOverflowConditions._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 1000
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 24
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 2000
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 24
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 3000
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 24
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 4000
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 5000
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 40
  addi t6, t1, 4                                                        # ir inst 13 fin
  li t1, 6000
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 40
  addi t6, t1, 8                                                        # ir inst 15 fin
  li t1, 7000
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 40
  addi t6, t1, 12                                                       # ir inst 17 fin
  li t1, 8000
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 20 fin
# Phi connections
  li t5, 0
  j .F.testOverflowConditions._1.array.cond.0                           # ir inst 21 fin
.F.testOverflowConditions._1.array.cond.0:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 23 fin
  bnez t4, .F.testOverflowConditions._2.array.body.0
  j .F.testOverflowConditions._3.array.exit.0                           # ir inst 24 fin
.F.testOverflowConditions._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 26 fin
  addi t4, t5, 1                                                        # ir inst 27 fin
# Phi connections
  mv t5, t4
  j .F.testOverflowConditions._1.array.cond.0                           # ir inst 28 fin
.F.testOverflowConditions._3.array.exit.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 29 fin
  addi t1, sp, 24
  addi t5, t1, 0                                                        # ir inst 30 fin
  lw t4, 0(t5)                                                          # ir inst 31 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 32 fin
  lw t3, 0(t5)                                                          # ir inst 33 fin
  mul t5, t4, t3                                                        # ir inst 34 fin
  addi t1, sp, 24
  addi t4, t1, 4                                                        # ir inst 35 fin
  lw t3, 0(t4)                                                          # ir inst 36 fin
  addi t1, sp, 40
  addi t4, t1, 8                                                        # ir inst 37 fin
  lw s11, 0(t4)                                                         # ir inst 38 fin
  mul t4, t3, s11                                                       # ir inst 39 fin
  add t3, t5, t4                                                        # ir inst 40 fin
  sw t3, 0(t6)                                                          # ir inst 41 fin
  addi t1, sp, 56
  addi t6, t1, 4                                                        # ir inst 42 fin
  addi t1, sp, 24
  addi t5, t1, 0                                                        # ir inst 43 fin
  lw t4, 0(t5)                                                          # ir inst 44 fin
  addi t1, sp, 40
  addi t5, t1, 4                                                        # ir inst 45 fin
  lw t3, 0(t5)                                                          # ir inst 46 fin
  mul t5, t4, t3                                                        # ir inst 47 fin
  addi t1, sp, 24
  addi t4, t1, 4                                                        # ir inst 48 fin
  lw t3, 0(t4)                                                          # ir inst 49 fin
  addi t1, sp, 40
  addi t4, t1, 12                                                       # ir inst 50 fin
  lw s11, 0(t4)                                                         # ir inst 51 fin
  mul t4, t3, s11                                                       # ir inst 52 fin
  add t3, t5, t4                                                        # ir inst 53 fin
  sw t3, 0(t6)                                                          # ir inst 54 fin
  addi t1, sp, 56
  addi t6, t1, 8                                                        # ir inst 55 fin
  addi t1, sp, 24
  addi t5, t1, 8                                                        # ir inst 56 fin
  lw t4, 0(t5)                                                          # ir inst 57 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 58 fin
  lw t3, 0(t5)                                                          # ir inst 59 fin
  mul t5, t4, t3                                                        # ir inst 60 fin
  addi t1, sp, 24
  addi t4, t1, 12                                                       # ir inst 61 fin
  lw t3, 0(t4)                                                          # ir inst 62 fin
  addi t1, sp, 40
  addi t4, t1, 8                                                        # ir inst 63 fin
  lw s11, 0(t4)                                                         # ir inst 64 fin
  mul t4, t3, s11                                                       # ir inst 65 fin
  add t3, t5, t4                                                        # ir inst 66 fin
  sw t3, 0(t6)                                                          # ir inst 67 fin
  addi t1, sp, 56
  addi t6, t1, 12                                                       # ir inst 68 fin
  addi t1, sp, 24
  addi t5, t1, 8                                                        # ir inst 69 fin
  lw t4, 0(t5)                                                          # ir inst 70 fin
  addi t1, sp, 40
  addi t5, t1, 4                                                        # ir inst 71 fin
  lw t3, 0(t5)                                                          # ir inst 72 fin
  mul t5, t4, t3                                                        # ir inst 73 fin
  addi t1, sp, 24
  addi t4, t1, 12                                                       # ir inst 74 fin
  lw t3, 0(t4)                                                          # ir inst 75 fin
  addi t1, sp, 40
  addi t4, t1, 12                                                       # ir inst 76 fin
  lw s11, 0(t4)                                                         # ir inst 77 fin
  mul t4, t3, s11                                                       # ir inst 78 fin
  add t3, t5, t4                                                        # ir inst 79 fin
  sw t3, 0(t6)                                                          # ir inst 80 fin
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 81 fin
  lw t5, 0(t6)                                                          # ir inst 82 fin
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 83 fin
  addi t1, sp, 56
  addi t5, t1, 4                                                        # ir inst 84 fin
  lw t4, 0(t5)                                                          # ir inst 85 fin
  li t2, 100000
  rem t5, t4, t2                                                        # ir inst 86 fin
  add t4, t6, t5                                                        # ir inst 87 fin
  addi t1, sp, 56
  addi t6, t1, 8                                                        # ir inst 88 fin
  lw t5, 0(t6)                                                          # ir inst 89 fin
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 90 fin
  add t5, t4, t6                                                        # ir inst 91 fin
  addi t1, sp, 56
  addi t6, t1, 12                                                       # ir inst 92 fin
  lw t4, 0(t6)                                                          # ir inst 93 fin
  li t2, 100000
  rem t6, t4, t2                                                        # ir inst 94 fin
  add t4, t5, t6                                                        # ir inst 95 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 96 fin
  j .F.testOverflowConditions.epilogue                                  # ir inst 97 fin
.F.testOverflowConditions.epilogue:
  ld ra, 16(sp)
  ld s11, 8(sp)
  addi sp, sp, 80
  ret
