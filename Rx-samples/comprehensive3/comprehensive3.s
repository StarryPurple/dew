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
  li a0, 3000
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performMathematicalSeries
# ir inst 2 fin
# Start call preparation
  call .F.performNumberTheoryAlgorithms
# ir inst 3 fin
# Start call preparation
  call .F.performLinearAlgebraOperations
# ir inst 4 fin
# Start call preparation
  call .F.performCombinatorialAlgorithms
# ir inst 5 fin
# Start call preparation
  call .F.performCryptographicOperations
# ir inst 6 fin
# Start call preparation
  li a0, 3999
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

.globl .F.performMathematicalSeries
.F.performMathematicalSeries:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performMathematicalSeries._0.entry.0:
# Start call preparation
  li a0, 3001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 1000
  call .F.calculatePiApproximation
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 50
  call .F.calculateFibonacciSum
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
  call .F.calculateFactorialSeries
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 10000
  call .F.calculateHarmonicSeries
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a1, 3
  li a0, 100
  call .F.calculateGeometricSeries
  mv t6, a0
# ir inst 10 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 11 fin
# Start call preparation
  li a0, 3002
  call printlnInt
# ir inst 12 fin
  j .F.performMathematicalSeries.epilogue                               # ir inst 13 fin
.F.performMathematicalSeries.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.calculatePiApproximation
.F.calculatePiApproximation:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.calculatePiApproximation._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 1
  li t5, 1
  li t6, 0
  j .F.calculatePiApproximation._1.while.cond.0                         # ir inst 1 fin
.F.calculatePiApproximation._1.while.cond.0:
  slt s11, t6, a0                                                       # ir inst 6 fin
  bnez s11, .F.calculatePiApproximation._2.while.body.0
  j .F.calculatePiApproximation._3.while.exit.0                         # ir inst 7 fin
.F.calculatePiApproximation._2.while.body.0:
  li t2, 10000
  mul s11, t5, t2                                                       # ir inst 8 fin
  div s10, s11, t4                                                      # ir inst 9 fin
  add s11, t3, s10                                                      # ir inst 10 fin
  li t1, 0
  sub s10, t1, t5                                                       # ir inst 11 fin
  addi t5, t4, 2                                                        # ir inst 12 fin
  addi t4, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t3, s11
  mv t6, t4
  mv t4, t5
  mv t5, s10
  j .F.calculatePiApproximation._1.while.cond.0                         # ir inst 14 fin
.F.calculatePiApproximation._3.while.exit.0:
  slli t6, t3, 2                                                        # ir inst 15 fin
  li t2, 100000
  rem t5, t6, t2                                                        # ir inst 16 fin
  mv a0, t5
  j .F.calculatePiApproximation.epilogue                                # ir inst 17 fin
.F.calculatePiApproximation.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateFibonacciSum
.F.calculateFibonacciSum:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.calculateFibonacciSum._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 1
  li t6, 0
  j .F.calculateFibonacciSum._1.while.cond.0                            # ir inst 1 fin
.F.calculateFibonacciSum._1.while.cond.0:
  slt s11, t6, a0                                                       # ir inst 6 fin
  bnez s11, .F.calculateFibonacciSum._2.while.body.0
  j .F.calculateFibonacciSum._3.while.exit.0                            # ir inst 7 fin
.F.calculateFibonacciSum._2.while.body.0:
  add s11, t3, t5                                                       # ir inst 8 fin
  li t2, 1000000
  rem s10, s11, t2                                                      # ir inst 9 fin
  add s11, t4, t5                                                       # ir inst 10 fin
  li t2, 1000000
  rem t4, s11, t2                                                       # ir inst 11 fin
  addi s11, t6, 1                                                       # ir inst 12 fin
# Phi connections
  mv t3, s10
  mv t6, s11
  mv t0, t4
  mv t4, t5
  mv t5, t0
  j .F.calculateFibonacciSum._1.while.cond.0                            # ir inst 13 fin
.F.calculateFibonacciSum._3.while.exit.0:
  li t2, 10000
  rem t6, t3, t2                                                        # ir inst 14 fin
  mv a0, t6
  j .F.calculateFibonacciSum.epilogue                                   # ir inst 15 fin
.F.calculateFibonacciSum.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateFactorialSeries
.F.calculateFactorialSeries:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.calculateFactorialSeries._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 1
  j .F.calculateFactorialSeries._1.while.cond.0                         # ir inst 1 fin
.F.calculateFactorialSeries._1.while.cond.0:
  slt t0, a0, t6
  xori t3, t0, 1                                                        # ir inst 5 fin
  bnez t3, .F.calculateFactorialSeries._2.while.body.0
  j .F.calculateFactorialSeries._3.while.exit.0                         # ir inst 6 fin
.F.calculateFactorialSeries._2.while.body.0:
  mul t3, t5, t6                                                        # ir inst 7 fin
  li t2, 1000000
  rem t5, t3, t2                                                        # ir inst 8 fin
  add t3, t4, t5                                                        # ir inst 9 fin
  li t2, 1000000
  rem s11, t3, t2                                                       # ir inst 10 fin
  addi t3, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.calculateFactorialSeries._1.while.cond.0                         # ir inst 12 fin
.F.calculateFactorialSeries._3.while.exit.0:
  li t2, 10000
  rem t6, t4, t2                                                        # ir inst 13 fin
  mv a0, t6
  j .F.calculateFactorialSeries.epilogue                                # ir inst 14 fin
.F.calculateFactorialSeries.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateHarmonicSeries
.F.calculateHarmonicSeries:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateHarmonicSeries._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.calculateHarmonicSeries._1.while.cond.0                          # ir inst 1 fin
.F.calculateHarmonicSeries._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.calculateHarmonicSeries._2.while.body.0
  j .F.calculateHarmonicSeries._3.while.exit.0                          # ir inst 5 fin
.F.calculateHarmonicSeries._2.while.body.0:
  li t1, 10000
  div t4, t1, t6                                                        # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  addi t4, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateHarmonicSeries._1.while.cond.0                          # ir inst 9 fin
.F.calculateHarmonicSeries._3.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 10 fin
  mv a0, t6
  j .F.calculateHarmonicSeries.epilogue                                 # ir inst 11 fin
.F.calculateHarmonicSeries.epilogue:
  ret

.globl .F.calculateGeometricSeries
.F.calculateGeometricSeries:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.calculateGeometricSeries._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 0
  j .F.calculateGeometricSeries._1.while.cond.0                         # ir inst 1 fin
.F.calculateGeometricSeries._1.while.cond.0:
  slt t3, t6, a0                                                        # ir inst 5 fin
  bnez t3, .F.calculateGeometricSeries._2.while.body.0
  j .F.calculateGeometricSeries._3.while.exit.0                         # ir inst 6 fin
.F.calculateGeometricSeries._2.while.body.0:
  add t3, t4, t5                                                        # ir inst 7 fin
  li t2, 1000000
  rem s11, t3, t2                                                       # ir inst 8 fin
  mul t3, t5, a1                                                        # ir inst 9 fin
  li t2, 1000000
  rem t5, t3, t2                                                        # ir inst 10 fin
  addi t3, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.calculateGeometricSeries._1.while.cond.0                         # ir inst 12 fin
.F.calculateGeometricSeries._3.while.exit.0:
  li t2, 10000
  rem t6, t4, t2                                                        # ir inst 13 fin
  mv a0, t6
  j .F.calculateGeometricSeries.epilogue                                # ir inst 14 fin
.F.calculateGeometricSeries.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performNumberTheoryAlgorithms
.F.performNumberTheoryAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performNumberTheoryAlgorithms._0.entry.0:
# Start call preparation
  li a0, 3003
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 2000
  call .F.sieveOfEratosthenes
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 100
  call .F.performGCDOperations
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.performModularExponentiation
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 100
  call .F.calculateTotientSum
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 1000
  call .F.findPerfectNumbers
  mv t6, a0
# ir inst 10 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 11 fin
# Start call preparation
  li a0, 3004
  call printlnInt
# ir inst 12 fin
  j .F.performNumberTheoryAlgorithms.epilogue                           # ir inst 13 fin
.F.performNumberTheoryAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.sieveOfEratosthenes
.F.sieveOfEratosthenes:
# spill func args num: 0,             range:     8000(sp) -     8000(sp)
# local var size: 8000,               range:        0(sp) -     8000(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8000
  add sp, sp, t0
.F.sieveOfEratosthenes._0.entry.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.sieveOfEratosthenes._1.array.cond.0                              # ir inst 3 fin
.F.sieveOfEratosthenes._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.sieveOfEratosthenes._2.array.body.0
  j .F.sieveOfEratosthenes._3.array.exit.0                              # ir inst 6 fin
.F.sieveOfEratosthenes._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.sieveOfEratosthenes._1.array.cond.0                              # ir inst 10 fin
.F.sieveOfEratosthenes._3.array.exit.0:
# Phi connections
  li t6, 2
  j .F.sieveOfEratosthenes._4.while.cond.0                              # ir inst 11 fin
.F.sieveOfEratosthenes._4.while.cond.0:
  sltu t5, t6, a0                                                       # ir inst 13 fin
  bnez t5, .F.sieveOfEratosthenes._5.while.body.0
  j .F.sieveOfEratosthenes._6.while.exit.0                              # ir inst 14 fin
.F.sieveOfEratosthenes._5.while.body.0:
  slli t2, t6, 2
  addi t1, sp, 0
  add t5, t1, t2                                                        # ir inst 15 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 16 fin
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.sieveOfEratosthenes._4.while.cond.0                              # ir inst 18 fin
.F.sieveOfEratosthenes._6.while.exit.0:
# Phi connections
  li t6, 2
  j .F.sieveOfEratosthenes._7.while.cond.1                              # ir inst 19 fin
.F.sieveOfEratosthenes._7.while.cond.1:
  mul t5, t6, t6                                                        # ir inst 21 fin
  sltu t4, t5, a0                                                       # ir inst 22 fin
  bnez t4, .F.sieveOfEratosthenes._8.while.body.1
  j .F.sieveOfEratosthenes._15.while.exit.1                             # ir inst 23 fin
.F.sieveOfEratosthenes._8.while.body.1:
  slli t2, t6, 2
  addi t1, sp, 0
  add t5, t1, t2                                                        # ir inst 24 fin
  lw t4, 0(t5)                                                          # ir inst 25 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 26 fin
  bnez t5, .F.sieveOfEratosthenes._9.if.then.0
  j .F.sieveOfEratosthenes._13.if.else.0                                # ir inst 27 fin
.F.sieveOfEratosthenes._9.if.then.0:
  mul t5, t6, t6                                                        # ir inst 28 fin
# Phi connections
  j .F.sieveOfEratosthenes._10.while.cond.2                             # ir inst 29 fin
.F.sieveOfEratosthenes._10.while.cond.2:
  sltu t4, t5, a0                                                       # ir inst 31 fin
  bnez t4, .F.sieveOfEratosthenes._11.while.body.2
  j .F.sieveOfEratosthenes._12.while.exit.2                             # ir inst 32 fin
.F.sieveOfEratosthenes._11.while.body.2:
  slli t2, t5, 2
  addi t1, sp, 0
  add t4, t1, t2                                                        # ir inst 33 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 34 fin
  add t4, t5, t6                                                        # ir inst 35 fin
# Phi connections
  mv t5, t4
  j .F.sieveOfEratosthenes._10.while.cond.2                             # ir inst 36 fin
.F.sieveOfEratosthenes._12.while.exit.2:
  j .F.sieveOfEratosthenes._14.if.exit.0                                # ir inst 37 fin
.F.sieveOfEratosthenes._13.if.else.0:
  j .F.sieveOfEratosthenes._14.if.exit.0                                # ir inst 38 fin
.F.sieveOfEratosthenes._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F.sieveOfEratosthenes._7.while.cond.1                              # ir inst 40 fin
.F.sieveOfEratosthenes._15.while.exit.1:
# Phi connections
  li t5, 2
  li t6, 0
  j .F.sieveOfEratosthenes._16.while.cond.3                             # ir inst 41 fin
.F.sieveOfEratosthenes._16.while.cond.3:
  sltu t4, t5, a0                                                       # ir inst 44 fin
  bnez t4, .F.sieveOfEratosthenes._17.while.body.3
  j .F.sieveOfEratosthenes._21.while.exit.3                             # ir inst 45 fin
.F.sieveOfEratosthenes._17.while.body.3:
  slli t2, t5, 2
  addi t1, sp, 0
  add t4, t1, t2                                                        # ir inst 46 fin
  lw t3, 0(t4)                                                          # ir inst 47 fin
  li t2, 1
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 48 fin
  bnez t4, .F.sieveOfEratosthenes._18.if.then.1
  j .F.sieveOfEratosthenes._19.if.else.1                                # ir inst 49 fin
.F.sieveOfEratosthenes._18.if.then.1:
  addi t4, t6, 1                                                        # ir inst 50 fin
# Phi connections
  j .F.sieveOfEratosthenes._20.if.exit.1                                # ir inst 51 fin
.F.sieveOfEratosthenes._19.if.else.1:
# Phi connections
  mv t4, t6
  j .F.sieveOfEratosthenes._20.if.exit.1                                # ir inst 52 fin
.F.sieveOfEratosthenes._20.if.exit.1:
  addi t3, t5, 1                                                        # ir inst 54 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.sieveOfEratosthenes._16.while.cond.3                             # ir inst 55 fin
.F.sieveOfEratosthenes._21.while.exit.3:
  mv a0, t6
  j .F.sieveOfEratosthenes.epilogue                                     # ir inst 56 fin
.F.sieveOfEratosthenes.epilogue:
  li t0, 8000
  add sp, sp, t0
  ret

.globl .F.performGCDOperations
.F.performGCDOperations:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 4 / 12,        range:       40(sp) -       72(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 40(sp)
  sd s8, 48(sp)
  sd s9, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.performGCDOperations._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.performGCDOperations._1.while.cond.0                             # ir inst 1 fin
.F.performGCDOperations._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.performGCDOperations._2.while.body.0
  j .F.performGCDOperations._6.while.exit.0                             # ir inst 5 fin
.F.performGCDOperations._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 1
  j .F.performGCDOperations._3.while.cond.1                             # ir inst 6 fin
.F.performGCDOperations._3.while.cond.1:
  slt t0, a0, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.performGCDOperations._4.while.body.1
  j .F.performGCDOperations._5.while.exit.1                             # ir inst 10 fin
.F.performGCDOperations._4.while.body.1:
  li t2, 13
  mul s11, t6, t2                                                       # ir inst 11 fin
  addi s10, s11, 7                                                      # ir inst 12 fin
  li t2, 17
  mul s11, t4, t2                                                       # ir inst 13 fin
  addi s9, s11, 11                                                      # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, s9
  mv a0, s10
  call .F.euclideanGCD
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 15 fin
  add s10, t3, s11                                                      # ir inst 16 fin
  li t2, 19
  mul s11, t6, t2                                                       # ir inst 17 fin
  addi s9, s11, 3                                                       # ir inst 18 fin
  li t2, 23
  mul s11, t4, t2                                                       # ir inst 19 fin
  addi s8, s11, 5                                                       # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, s8
  mv a0, s9
  call .F.binaryGCD
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 21 fin
  add s9, s10, s11                                                      # ir inst 22 fin
  addi s11, t4, 10                                                      # ir inst 23 fin
# Phi connections
  mv t3, s9
  mv t4, s11
  j .F.performGCDOperations._3.while.cond.1                             # ir inst 24 fin
.F.performGCDOperations._5.while.exit.1:
  addi t4, t6, 10                                                       # ir inst 25 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performGCDOperations._1.while.cond.0                             # ir inst 26 fin
.F.performGCDOperations._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 27 fin
  mv a0, t6
  j .F.performGCDOperations.epilogue                                    # ir inst 28 fin
.F.performGCDOperations.epilogue:
  ld ra, 72(sp)
  ld s10, 40(sp)
  ld s8, 48(sp)
  ld s9, 56(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.euclideanGCD
.F.euclideanGCD:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.euclideanGCD._0.entry.0:
# Phi connections
  mv t5, a0
  mv t6, a1
  j .F.euclideanGCD._1.while.cond.0                                     # ir inst 1 fin
.F.euclideanGCD._1.while.cond.0:
  li t2, 0
  xor t0, t6, t2
  sltu t4, zero, t0                                                     # ir inst 4 fin
  bnez t4, .F.euclideanGCD._2.while.body.0
  j .F.euclideanGCD._3.while.exit.0                                     # ir inst 5 fin
.F.euclideanGCD._2.while.body.0:
  rem t4, t5, t6                                                        # ir inst 6 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.euclideanGCD._1.while.cond.0                                     # ir inst 7 fin
.F.euclideanGCD._3.while.exit.0:
  mv a0, t5
  j .F.euclideanGCD.epilogue                                            # ir inst 8 fin
.F.euclideanGCD.epilogue:
  ret

.globl .F.binaryGCD
.F.binaryGCD:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.binaryGCD._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.binaryGCD._1.if.then.0
  j .F.binaryGCD._2.if.else.0                                           # ir inst 2 fin
.F.binaryGCD._1.if.then.0:
  mv a0, a1
  j .F.binaryGCD.epilogue                                               # ir inst 3 fin
.F.binaryGCD._2.if.else.0:
  j .F.binaryGCD._3.if.exit.0                                           # ir inst 4 fin
.F.binaryGCD._3.if.exit.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.binaryGCD._4.if.then.1
  j .F.binaryGCD._5.if.else.1                                           # ir inst 6 fin
.F.binaryGCD._4.if.then.1:
  j .F.binaryGCD.epilogue                                               # ir inst 7 fin
.F.binaryGCD._5.if.else.1:
  j .F.binaryGCD._6.if.exit.1                                           # ir inst 8 fin
.F.binaryGCD._6.if.exit.1:
# Phi connections
  mv t4, a0
  mv t5, a1
  li t6, 0
  j .F.binaryGCD._7.while.cond.0                                        # ir inst 9 fin
.F.binaryGCD._7.while.cond.0:
  or t3, t4, t5                                                         # ir inst 13 fin
  andi s11, t3, 1                                                       # ir inst 14 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 15 fin
  bnez t3, .F.binaryGCD._8.while.body.0
  j .F.binaryGCD._9.while.exit.0                                        # ir inst 16 fin
.F.binaryGCD._8.while.body.0:
  addi t3, t6, 1                                                        # ir inst 17 fin
  srai s11, t4, 1                                                       # ir inst 18 fin
  srai s10, t5, 1                                                       # ir inst 19 fin
# Phi connections
  mv t4, s11
  mv t5, s10
  mv t6, t3
  j .F.binaryGCD._7.while.cond.0                                        # ir inst 20 fin
.F.binaryGCD._9.while.exit.0:
# Phi connections
  j .F.binaryGCD._10.while.cond.1                                       # ir inst 21 fin
.F.binaryGCD._10.while.cond.1:
  andi t3, t4, 1                                                        # ir inst 23 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 24 fin
  bnez s11, .F.binaryGCD._11.while.body.1
  j .F.binaryGCD._12.while.exit.1                                       # ir inst 25 fin
.F.binaryGCD._11.while.body.1:
  srai t3, t4, 1                                                        # ir inst 26 fin
# Phi connections
  mv t4, t3
  j .F.binaryGCD._10.while.cond.1                                       # ir inst 27 fin
.F.binaryGCD._12.while.exit.1:
# Phi connections
  j .F.binaryGCD._13.while.cond.2                                       # ir inst 28 fin
.F.binaryGCD._13.while.cond.2:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 31 fin
  bnez t3, .F.binaryGCD._14.while.body.2
  j .F.binaryGCD._21.while.exit.2                                       # ir inst 32 fin
.F.binaryGCD._14.while.body.2:
# Phi connections
  j .F.binaryGCD._15.while.cond.3                                       # ir inst 33 fin
.F.binaryGCD._15.while.cond.3:
  andi t3, t5, 1                                                        # ir inst 35 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 36 fin
  bnez s11, .F.binaryGCD._16.while.body.3
  j .F.binaryGCD._17.while.exit.3                                       # ir inst 37 fin
.F.binaryGCD._16.while.body.3:
  srai t3, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t3
  j .F.binaryGCD._15.while.cond.3                                       # ir inst 39 fin
.F.binaryGCD._17.while.exit.3:
  slt t3, t5, t4                                                        # ir inst 40 fin
  bnez t3, .F.binaryGCD._18.if.then.2
  j .F.binaryGCD._19.if.else.2                                          # ir inst 41 fin
.F.binaryGCD._18.if.then.2:
# Phi connections
  mv t3, t5
  mv t5, t4
  j .F.binaryGCD._20.if.exit.2                                          # ir inst 42 fin
.F.binaryGCD._19.if.else.2:
# Phi connections
  mv t3, t4
  j .F.binaryGCD._20.if.exit.2                                          # ir inst 43 fin
.F.binaryGCD._20.if.exit.2:
  sub s11, t5, t3                                                       # ir inst 46 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.binaryGCD._13.while.cond.2                                       # ir inst 47 fin
.F.binaryGCD._21.while.exit.2:
  sll t5, t4, t6                                                        # ir inst 48 fin
  mv a0, t5
  j .F.binaryGCD.epilogue                                               # ir inst 49 fin
.F.binaryGCD.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performModularExponentiation
.F.performModularExponentiation:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 32(sp)
  sd s10, 40(sp)
  sd ra, 48(sp)
.F.performModularExponentiation._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 2
  j .F.performModularExponentiation._1.while.cond.0                     # ir inst 1 fin
.F.performModularExponentiation._1.while.cond.0:
  li t2, 10
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.performModularExponentiation._2.while.body.0
  j .F.performModularExponentiation._6.while.exit.0                     # ir inst 5 fin
.F.performModularExponentiation._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 1
  j .F.performModularExponentiation._3.while.cond.1                     # ir inst 6 fin
.F.performModularExponentiation._3.while.cond.1:
  li t2, 20
  slt t0, t2, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.performModularExponentiation._4.while.body.1
  j .F.performModularExponentiation._5.while.exit.1                     # ir inst 10 fin
.F.performModularExponentiation._4.while.body.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 97
  mv a1, t4
  mv a0, t6
  call .F.modularPower
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 11 fin
  add s10, t3, s11                                                      # ir inst 12 fin
  li t2, 10000
  rem s11, s10, t2                                                      # ir inst 13 fin
  addi s10, t4, 1                                                       # ir inst 14 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.performModularExponentiation._3.while.cond.1                     # ir inst 15 fin
.F.performModularExponentiation._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performModularExponentiation._1.while.cond.0                     # ir inst 17 fin
.F.performModularExponentiation._6.while.exit.0:
  mv a0, t5
  j .F.performModularExponentiation.epilogue                            # ir inst 18 fin
.F.performModularExponentiation.epilogue:
  ld ra, 48(sp)
  ld s11, 32(sp)
  ld s10, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.modularPower
.F.modularPower:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.modularPower._0.entry.0:
  rem t6, a0, a2                                                        # ir inst 1 fin
# Phi connections
  li t4, 1
  mv t5, t6
  mv t6, a1
  j .F.modularPower._1.while.cond.0                                     # ir inst 2 fin
.F.modularPower._1.while.cond.0:
  li t2, 0
  slt t3, t2, t6                                                        # ir inst 6 fin
  bnez t3, .F.modularPower._2.while.body.0
  j .F.modularPower._6.while.exit.0                                     # ir inst 7 fin
.F.modularPower._2.while.body.0:
  li t2, 2
  rem t3, t6, t2                                                        # ir inst 8 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 9 fin
  bnez s11, .F.modularPower._3.if.then.0
  j .F.modularPower._4.if.else.0                                        # ir inst 10 fin
.F.modularPower._3.if.then.0:
  mul t3, t4, t5                                                        # ir inst 11 fin
  rem s11, t3, a2                                                       # ir inst 12 fin
# Phi connections
  mv t3, s11
  j .F.modularPower._5.if.exit.0                                        # ir inst 13 fin
.F.modularPower._4.if.else.0:
# Phi connections
  mv t3, t4
  j .F.modularPower._5.if.exit.0                                        # ir inst 14 fin
.F.modularPower._5.if.exit.0:
  srai s11, t6, 1                                                       # ir inst 16 fin
  mul t6, t5, t5                                                        # ir inst 17 fin
  rem t5, t6, a2                                                        # ir inst 18 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.modularPower._1.while.cond.0                                     # ir inst 19 fin
.F.modularPower._6.while.exit.0:
  mv a0, t4
  j .F.modularPower.epilogue                                            # ir inst 20 fin
.F.modularPower.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateTotientSum
.F.calculateTotientSum:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.calculateTotientSum._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.calculateTotientSum._1.while.cond.0                              # ir inst 1 fin
.F.calculateTotientSum._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.calculateTotientSum._2.while.body.0
  j .F.calculateTotientSum._3.while.exit.0                              # ir inst 5 fin
.F.calculateTotientSum._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.eulerTotient
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  addi t4, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateTotientSum._1.while.cond.0                              # ir inst 9 fin
.F.calculateTotientSum._3.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 10 fin
  mv a0, t6
  j .F.calculateTotientSum.epilogue                                     # ir inst 11 fin
.F.calculateTotientSum.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.eulerTotient
.F.eulerTotient:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.eulerTotient._0.entry.0:
  li t2, 2
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.eulerTotient._1.if.then.0
  j .F.eulerTotient._5.if.else.0                                        # ir inst 3 fin
.F.eulerTotient._1.if.then.0:
# Phi connections
  mv t6, a0
  j .F.eulerTotient._2.while.cond.0                                     # ir inst 4 fin
.F.eulerTotient._2.while.cond.0:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 7 fin
  bnez t4, .F.eulerTotient._3.while.body.0
  j .F.eulerTotient._4.while.exit.0                                     # ir inst 8 fin
.F.eulerTotient._3.while.body.0:
  li t2, 2
  div t5, t6, t2                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.eulerTotient._2.while.cond.0                                     # ir inst 10 fin
.F.eulerTotient._4.while.exit.0:
  li t2, 2
  div t5, a0, t2                                                        # ir inst 11 fin
  sub t4, a0, t5                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  j .F.eulerTotient._6.if.exit.0                                        # ir inst 13 fin
.F.eulerTotient._5.if.else.0:
# Phi connections
  mv t5, a0
  mv t6, a0
  j .F.eulerTotient._6.if.exit.0                                        # ir inst 14 fin
.F.eulerTotient._6.if.exit.0:
# Phi connections
  mv t4, t5
  mv t5, t6
  li t6, 3
  j .F.eulerTotient._7.while.cond.1                                     # ir inst 17 fin
.F.eulerTotient._7.while.cond.1:
  mul t3, t6, t6                                                        # ir inst 21 fin
  slt t0, t5, t3
  xori s11, t0, 1                                                       # ir inst 22 fin
  bnez s11, .F.eulerTotient._8.while.body.1
  j .F.eulerTotient._15.while.exit.1                                    # ir inst 23 fin
.F.eulerTotient._8.while.body.1:
  rem t3, t5, t6                                                        # ir inst 24 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 25 fin
  bnez s11, .F.eulerTotient._9.if.then.1
  j .F.eulerTotient._13.if.else.1                                       # ir inst 26 fin
.F.eulerTotient._9.if.then.1:
# Phi connections
  mv t3, t5
  j .F.eulerTotient._10.while.cond.2                                    # ir inst 27 fin
.F.eulerTotient._10.while.cond.2:
  rem s11, t3, t6                                                       # ir inst 29 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 30 fin
  bnez s10, .F.eulerTotient._11.while.body.2
  j .F.eulerTotient._12.while.exit.2                                    # ir inst 31 fin
.F.eulerTotient._11.while.body.2:
  div s11, t3, t6                                                       # ir inst 32 fin
# Phi connections
  mv t3, s11
  j .F.eulerTotient._10.while.cond.2                                    # ir inst 33 fin
.F.eulerTotient._12.while.exit.2:
  div s11, t4, t6                                                       # ir inst 34 fin
  sub s10, t4, s11                                                      # ir inst 35 fin
# Phi connections
  mv s11, s10
  j .F.eulerTotient._14.if.exit.1                                       # ir inst 36 fin
.F.eulerTotient._13.if.else.1:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.eulerTotient._14.if.exit.1                                       # ir inst 37 fin
.F.eulerTotient._14.if.exit.1:
  addi s10, t6, 2                                                       # ir inst 40 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.eulerTotient._7.while.cond.1                                     # ir inst 41 fin
.F.eulerTotient._15.while.exit.1:
  li t2, 1
  slt t6, t2, t5                                                        # ir inst 42 fin
  bnez t6, .F.eulerTotient._16.if.then.2
  j .F.eulerTotient._17.if.else.2                                       # ir inst 43 fin
.F.eulerTotient._16.if.then.2:
  div t6, t4, t5                                                        # ir inst 44 fin
  sub t5, t4, t6                                                        # ir inst 45 fin
# Phi connections
  mv t6, t5
  j .F.eulerTotient._18.if.exit.2                                       # ir inst 46 fin
.F.eulerTotient._17.if.else.2:
# Phi connections
  mv t6, t4
  j .F.eulerTotient._18.if.exit.2                                       # ir inst 47 fin
.F.eulerTotient._18.if.exit.2:
  mv a0, t6
  j .F.eulerTotient.epilogue                                            # ir inst 49 fin
.F.eulerTotient.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.findPerfectNumbers
.F.findPerfectNumbers:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.findPerfectNumbers._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 6
  j .F.findPerfectNumbers._1.while.cond.0                               # ir inst 1 fin
.F.findPerfectNumbers._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.findPerfectNumbers._2.while.body.0
  j .F.findPerfectNumbers._6.while.exit.0                               # ir inst 5 fin
.F.findPerfectNumbers._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.isPerfectNumber
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.findPerfectNumbers._3.if.then.0
  j .F.findPerfectNumbers._4.if.else.0                                  # ir inst 8 fin
.F.findPerfectNumbers._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.findPerfectNumbers._5.if.exit.0                                  # ir inst 10 fin
.F.findPerfectNumbers._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.findPerfectNumbers._5.if.exit.0                                  # ir inst 11 fin
.F.findPerfectNumbers._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.findPerfectNumbers._1.while.cond.0                               # ir inst 14 fin
.F.findPerfectNumbers._6.while.exit.0:
  mv a0, t5
  j .F.findPerfectNumbers.epilogue                                      # ir inst 15 fin
.F.findPerfectNumbers.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.isPerfectNumber
.F.isPerfectNumber:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.isPerfectNumber._0.entry.0:
# Phi connections
  li t5, 1
  li t6, 2
  j .F.isPerfectNumber._1.while.cond.0                                  # ir inst 1 fin
.F.isPerfectNumber._1.while.cond.0:
  mul t4, t6, t6                                                        # ir inst 4 fin
  slt t0, a0, t4
  xori t3, t0, 1                                                        # ir inst 5 fin
  bnez t3, .F.isPerfectNumber._2.while.body.0
  j .F.isPerfectNumber._9.while.exit.0                                  # ir inst 6 fin
.F.isPerfectNumber._2.while.body.0:
  rem t4, a0, t6                                                        # ir inst 7 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 8 fin
  bnez t3, .F.isPerfectNumber._3.if.then.0
  j .F.isPerfectNumber._7.if.else.0                                     # ir inst 9 fin
.F.isPerfectNumber._3.if.then.0:
  add t4, t5, t6                                                        # ir inst 10 fin
  div t3, a0, t6                                                        # ir inst 11 fin
  xor t0, t6, t3
  sltu s11, zero, t0                                                    # ir inst 12 fin
  bnez s11, .F.isPerfectNumber._4.if.then.1
  j .F.isPerfectNumber._5.if.else.1                                     # ir inst 13 fin
.F.isPerfectNumber._4.if.then.1:
  div t3, a0, t6                                                        # ir inst 14 fin
  add s11, t4, t3                                                       # ir inst 15 fin
# Phi connections
  mv t4, s11
  j .F.isPerfectNumber._6.if.exit.1                                     # ir inst 16 fin
.F.isPerfectNumber._5.if.else.1:
# Phi connections
  j .F.isPerfectNumber._6.if.exit.1                                     # ir inst 17 fin
.F.isPerfectNumber._6.if.exit.1:
# Phi connections
  j .F.isPerfectNumber._8.if.exit.0                                     # ir inst 19 fin
.F.isPerfectNumber._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.isPerfectNumber._8.if.exit.0                                     # ir inst 20 fin
.F.isPerfectNumber._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.isPerfectNumber._1.while.cond.0                                  # ir inst 23 fin
.F.isPerfectNumber._9.while.exit.0:
  xor t0, t5, a0
  sltiu t6, t0, 1                                                       # ir inst 24 fin
  mv t5, t6                                                             # ir inst 25 fin
  mv a0, t5
  j .F.isPerfectNumber.epilogue                                         # ir inst 26 fin
.F.isPerfectNumber.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performLinearAlgebraOperations
.F.performLinearAlgebraOperations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performLinearAlgebraOperations._0.entry.0:
# Start call preparation
  li a0, 3005
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performMatrixCalculations
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.performVectorCalculations
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.solveLinearSystem
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 3006
  call printlnInt
# ir inst 8 fin
  j .F.performLinearAlgebraOperations.epilogue                          # ir inst 9 fin
.F.performLinearAlgebraOperations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performMatrixCalculations
.F.performMatrixCalculations:
# spill func args num: 0,             range:     7664(sp) -     7664(sp)
# local var size: 7628,               range:       24(sp) -     7652(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -7664
  add sp, sp, t0
  sd ra, 16(sp)
.F.performMatrixCalculations._0.entry.0:
  addi t1, sp, 88
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performMatrixCalculations._1.array.cond.0                        # ir inst 4 fin
.F.performMatrixCalculations._1.array.cond.0:
  li t2, 625
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performMatrixCalculations._2.array.body.0
  j .F.performMatrixCalculations._3.array.exit.0                        # ir inst 7 fin
.F.performMatrixCalculations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixCalculations._1.array.cond.0                        # ir inst 11 fin
.F.performMatrixCalculations._3.array.exit.0:
  li t1, 2588
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performMatrixCalculations._4.array.cond.1                        # ir inst 14 fin
.F.performMatrixCalculations._4.array.cond.1:
  li t2, 625
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performMatrixCalculations._5.array.body.1
  j .F.performMatrixCalculations._6.array.exit.1                        # ir inst 17 fin
.F.performMatrixCalculations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixCalculations._4.array.cond.1                        # ir inst 21 fin
.F.performMatrixCalculations._6.array.exit.1:
  li t1, 5088
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performMatrixCalculations._7.array.cond.2                        # ir inst 24 fin
.F.performMatrixCalculations._7.array.cond.2:
  li t2, 625
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performMatrixCalculations._8.array.body.2
  j .F.performMatrixCalculations._9.array.exit.2                        # ir inst 27 fin
.F.performMatrixCalculations._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performMatrixCalculations._7.array.cond.2                        # ir inst 31 fin
.F.performMatrixCalculations._9.array.exit.2:
# Start call preparation
  li a1, 25
  addi t1, sp, 88
  mv a0, t1
  call .F.initializeMatrixA
# ir inst 32 fin
# Start call preparation
  li a1, 25
  li t1, 2588
  add t1, sp, t1
  mv a0, t1
  call .F.initializeMatrixB
# ir inst 33 fin
# Start call preparation
  li a3, 25
  li t1, 5088
  add t1, sp, t1
  mv a2, t1
  li t1, 2588
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 88
  mv a0, t1
  call .F.multiplyMatrices
# ir inst 34 fin
# Start call preparation
  li a1, 25
  li t1, 5088
  add t1, sp, t1
  mv a0, t1
  call .F.calculateMatrixTrace
  mv t6, a0
# ir inst 35 fin
  li t1, 7588
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 37 fin
# Phi connections
  li t4, 0
  j .F.performMatrixCalculations._10.array.cond.3                       # ir inst 38 fin
.F.performMatrixCalculations._10.array.cond.3:
  li t2, 16
  slt t3, t4, t2                                                        # ir inst 40 fin
  bnez t3, .F.performMatrixCalculations._11.array.body.3
  j .F.performMatrixCalculations._12.array.exit.3                       # ir inst 41 fin
.F.performMatrixCalculations._11.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 42 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 43 fin
  addi t3, t4, 1                                                        # ir inst 44 fin
# Phi connections
  mv t4, t3
  j .F.performMatrixCalculations._10.array.cond.3                       # ir inst 45 fin
.F.performMatrixCalculations._12.array.exit.3:
# Start call preparation
  sd t6, 0(sp)
  li a3, 4
  li a2, 25
  li t1, 7588
  add t1, sp, t1
  mv a1, t1
  li t1, 5088
  add t1, sp, t1
  mv a0, t1
  call .F.extractSubmatrix
  ld t6, 0(sp)
# ir inst 46 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 64
  li t1, 7588
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 47 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 24
  mv a0, t1
  call .F.calculateDeterminant4x4
  mv t5, a0
  ld t6, 0(sp)
# ir inst 48 fin
  add t4, t6, t5                                                        # ir inst 49 fin
  li t2, 10000
  rem t6, t4, t2                                                        # ir inst 50 fin
  mv a0, t6
  j .F.performMatrixCalculations.epilogue                               # ir inst 51 fin
.F.performMatrixCalculations.epilogue:
  ld ra, 16(sp)
  li t0, 7664
  add sp, sp, t0
  ret

.globl .F.initializeMatrixA
.F.initializeMatrixA:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeMatrixA._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrixA._1.while.cond.0                                # ir inst 1 fin
.F.initializeMatrixA._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.initializeMatrixA._2.while.body.0
  j .F.initializeMatrixA._6.while.exit.0                                # ir inst 4 fin
.F.initializeMatrixA._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeMatrixA._3.while.cond.1                                # ir inst 5 fin
.F.initializeMatrixA._3.while.cond.1:
  sltu t4, t5, a1                                                       # ir inst 7 fin
  bnez t4, .F.initializeMatrixA._4.while.body.1
  j .F.initializeMatrixA._5.while.exit.1                                # ir inst 8 fin
.F.initializeMatrixA._4.while.body.1:
  mul t4, t6, a1                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  add t3, t6, t5                                                        # ir inst 12 fin
  addi s11, t3, 1                                                       # ir inst 13 fin
  mv t3, s11                                                            # ir inst 14 fin
  li t2, 10
  rem s11, t3, t2                                                       # ir inst 15 fin
  sw s11, 0(t4)                                                         # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.initializeMatrixA._3.while.cond.1                                # ir inst 18 fin
.F.initializeMatrixA._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrixA._1.while.cond.0                                # ir inst 20 fin
.F.initializeMatrixA._6.while.exit.0:
  j .F.initializeMatrixA.epilogue                                       # ir inst 21 fin
.F.initializeMatrixA.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.initializeMatrixB
.F.initializeMatrixB:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeMatrixB._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrixB._1.while.cond.0                                # ir inst 1 fin
.F.initializeMatrixB._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.initializeMatrixB._2.while.body.0
  j .F.initializeMatrixB._6.while.exit.0                                # ir inst 4 fin
.F.initializeMatrixB._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeMatrixB._3.while.cond.1                                # ir inst 5 fin
.F.initializeMatrixB._3.while.cond.1:
  sltu t4, t5, a1                                                       # ir inst 7 fin
  bnez t4, .F.initializeMatrixB._4.while.body.1
  j .F.initializeMatrixB._5.while.exit.1                                # ir inst 8 fin
.F.initializeMatrixB._4.while.body.1:
  mul t4, t6, a1                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  mul t3, t6, t5                                                        # ir inst 12 fin
  addi s11, t3, 1                                                       # ir inst 13 fin
  mv t3, s11                                                            # ir inst 14 fin
  li t2, 10
  rem s11, t3, t2                                                       # ir inst 15 fin
  sw s11, 0(t4)                                                         # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.initializeMatrixB._3.while.cond.1                                # ir inst 18 fin
.F.initializeMatrixB._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrixB._1.while.cond.0                                # ir inst 20 fin
.F.initializeMatrixB._6.while.exit.0:
  j .F.initializeMatrixB.epilogue                                       # ir inst 21 fin
.F.initializeMatrixB.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.multiplyMatrices
.F.multiplyMatrices:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s9, 0(sp)
  sd s11, 8(sp)
  sd s7, 16(sp)
  sd s5, 24(sp)
  sd s0, 32(sp)
  sd s1, 40(sp)
  sd s6, 48(sp)
  sd s8, 56(sp)
  sd s10, 64(sp)
.F.multiplyMatrices._0.entry.0:
# Phi connections
  li t6, 0
  j .F.multiplyMatrices._1.while.cond.0                                 # ir inst 1 fin
.F.multiplyMatrices._1.while.cond.0:
  sltu t5, t6, a3                                                       # ir inst 3 fin
  bnez t5, .F.multiplyMatrices._2.while.body.0
  j .F.multiplyMatrices._6.while.exit.0                                 # ir inst 4 fin
.F.multiplyMatrices._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.multiplyMatrices._3.while.cond.1                                 # ir inst 5 fin
.F.multiplyMatrices._3.while.cond.1:
  sltu t4, t5, a3                                                       # ir inst 7 fin
  bnez t4, .F.multiplyMatrices._4.while.body.1
  j .F.multiplyMatrices._5.while.exit.1                                 # ir inst 8 fin
.F.multiplyMatrices._4.while.body.1:
  mul t4, t6, a3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  slli t2, t3, 2
  add t4, a2, t2                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j .F.multiplyMatrices._3.while.cond.1                                 # ir inst 14 fin
.F.multiplyMatrices._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F.multiplyMatrices._1.while.cond.0                                 # ir inst 16 fin
.F.multiplyMatrices._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.multiplyMatrices._7.while.cond.2                                 # ir inst 17 fin
.F.multiplyMatrices._7.while.cond.2:
  sltu t5, t6, a3                                                       # ir inst 19 fin
  bnez t5, .F.multiplyMatrices._8.while.body.2
  j .F.multiplyMatrices._33.while.exit.2                                # ir inst 20 fin
.F.multiplyMatrices._8.while.body.2:
# Phi connections
  li t5, 0
  j .F.multiplyMatrices._9.while.cond.3                                 # ir inst 21 fin
.F.multiplyMatrices._9.while.cond.3:
  sltu t4, t5, a3                                                       # ir inst 23 fin
  bnez t4, .F.multiplyMatrices._10.while.body.3
  j .F.multiplyMatrices._32.while.exit.3                                # ir inst 24 fin
.F.multiplyMatrices._10.while.body.3:
# Phi connections
  li t4, 0
  j .F.multiplyMatrices._11.while.cond.4                                # ir inst 25 fin
.F.multiplyMatrices._11.while.cond.4:
  sltu t3, t4, a3                                                       # ir inst 27 fin
  bnez t3, .F.multiplyMatrices._12.while.body.4
  j .F.multiplyMatrices._31.while.exit.4                                # ir inst 28 fin
.F.multiplyMatrices._12.while.body.4:
  addi t3, t6, 5                                                        # ir inst 29 fin
  sltu s11, a3, t3                                                      # ir inst 30 fin
  bnez s11, .F.multiplyMatrices._13.if.then.0
  j .F.multiplyMatrices._14.if.else.0                                   # ir inst 31 fin
.F.multiplyMatrices._13.if.then.0:
# Phi connections
  mv t3, a3
  j .F.multiplyMatrices._15.if.exit.0                                   # ir inst 32 fin
.F.multiplyMatrices._14.if.else.0:
# Phi connections
  j .F.multiplyMatrices._15.if.exit.0                                   # ir inst 33 fin
.F.multiplyMatrices._15.if.exit.0:
# Phi connections
  mv s11, t6
  j .F.multiplyMatrices._16.while.cond.5                                # ir inst 35 fin
.F.multiplyMatrices._16.while.cond.5:
  sltu s10, s11, t3                                                     # ir inst 37 fin
  bnez s10, .F.multiplyMatrices._17.while.body.5
  j .F.multiplyMatrices._30.while.exit.5                                # ir inst 38 fin
.F.multiplyMatrices._17.while.body.5:
  addi s10, t5, 5                                                       # ir inst 39 fin
  sltu s9, a3, s10                                                      # ir inst 40 fin
  bnez s9, .F.multiplyMatrices._18.if.then.1
  j .F.multiplyMatrices._19.if.else.1                                   # ir inst 41 fin
.F.multiplyMatrices._18.if.then.1:
# Phi connections
  mv s10, a3
  j .F.multiplyMatrices._20.if.exit.1                                   # ir inst 42 fin
.F.multiplyMatrices._19.if.else.1:
# Phi connections
  j .F.multiplyMatrices._20.if.exit.1                                   # ir inst 43 fin
.F.multiplyMatrices._20.if.exit.1:
# Phi connections
  mv s9, t5
  j .F.multiplyMatrices._21.while.cond.6                                # ir inst 45 fin
.F.multiplyMatrices._21.while.cond.6:
  sltu s8, s9, s10                                                      # ir inst 47 fin
  bnez s8, .F.multiplyMatrices._22.while.body.6
  j .F.multiplyMatrices._29.while.exit.6                                # ir inst 48 fin
.F.multiplyMatrices._22.while.body.6:
  addi s8, t4, 5                                                        # ir inst 49 fin
  sltu s7, a3, s8                                                       # ir inst 50 fin
  bnez s7, .F.multiplyMatrices._23.if.then.2
  j .F.multiplyMatrices._24.if.else.2                                   # ir inst 51 fin
.F.multiplyMatrices._23.if.then.2:
# Phi connections
  mv s8, a3
  j .F.multiplyMatrices._25.if.exit.2                                   # ir inst 52 fin
.F.multiplyMatrices._24.if.else.2:
# Phi connections
  j .F.multiplyMatrices._25.if.exit.2                                   # ir inst 53 fin
.F.multiplyMatrices._25.if.exit.2:
# Phi connections
  mv s7, t4
  j .F.multiplyMatrices._26.while.cond.7                                # ir inst 55 fin
.F.multiplyMatrices._26.while.cond.7:
  sltu s6, s7, s8                                                       # ir inst 57 fin
  bnez s6, .F.multiplyMatrices._27.while.body.7
  j .F.multiplyMatrices._28.while.exit.7                                # ir inst 58 fin
.F.multiplyMatrices._27.while.body.7:
  mul s6, s11, a3                                                       # ir inst 59 fin
  add s5, s6, s9                                                        # ir inst 60 fin
  slli t2, s5, 2
  add s6, a2, t2                                                        # ir inst 61 fin
  lw s5, 0(s6)                                                          # ir inst 62 fin
  mul s0, s11, a3                                                       # ir inst 63 fin
  add s1, s0, s7                                                        # ir inst 64 fin
  slli t2, s1, 2
  add s0, a0, t2                                                        # ir inst 65 fin
  lw s1, 0(s0)                                                          # ir inst 66 fin
  mul s0, s7, a3                                                        # ir inst 67 fin
  add a4, s0, s9                                                        # ir inst 68 fin
  slli t2, a4, 2
  add s0, a1, t2                                                        # ir inst 69 fin
  lw a4, 0(s0)                                                          # ir inst 70 fin
  mul s0, s1, a4                                                        # ir inst 71 fin
  add s1, s5, s0                                                        # ir inst 72 fin
  sw s1, 0(s6)                                                          # ir inst 73 fin
  addi s6, s7, 1                                                        # ir inst 74 fin
# Phi connections
  mv s7, s6
  j .F.multiplyMatrices._26.while.cond.7                                # ir inst 75 fin
.F.multiplyMatrices._28.while.exit.7:
  addi s8, s9, 1                                                        # ir inst 76 fin
# Phi connections
  mv s9, s8
  j .F.multiplyMatrices._21.while.cond.6                                # ir inst 77 fin
.F.multiplyMatrices._29.while.exit.6:
  addi s10, s11, 1                                                      # ir inst 78 fin
# Phi connections
  mv s11, s10
  j .F.multiplyMatrices._16.while.cond.5                                # ir inst 79 fin
.F.multiplyMatrices._30.while.exit.5:
  addi t3, t4, 5                                                        # ir inst 80 fin
# Phi connections
  mv t4, t3
  j .F.multiplyMatrices._11.while.cond.4                                # ir inst 81 fin
.F.multiplyMatrices._31.while.exit.4:
  addi t4, t5, 5                                                        # ir inst 82 fin
# Phi connections
  mv t5, t4
  j .F.multiplyMatrices._9.while.cond.3                                 # ir inst 83 fin
.F.multiplyMatrices._32.while.exit.3:
  addi t5, t6, 5                                                        # ir inst 84 fin
# Phi connections
  mv t6, t5
  j .F.multiplyMatrices._7.while.cond.2                                 # ir inst 85 fin
.F.multiplyMatrices._33.while.exit.2:
  j .F.multiplyMatrices.epilogue                                        # ir inst 86 fin
.F.multiplyMatrices.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s7, 16(sp)
  ld s5, 24(sp)
  ld s0, 32(sp)
  ld s1, 40(sp)
  ld s6, 48(sp)
  ld s8, 56(sp)
  ld s10, 64(sp)
  addi sp, sp, 80
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
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.calculateMatrixTrace._2.while.body.0
  j .F.calculateMatrixTrace._3.while.exit.0                             # ir inst 5 fin
.F.calculateMatrixTrace._2.while.body.0:
  mul t4, t6, a1                                                        # ir inst 6 fin
  add t3, t4, t6                                                        # ir inst 7 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  add t4, t5, t3                                                        # ir inst 10 fin
  addi t3, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.calculateMatrixTrace._1.while.cond.0                             # ir inst 12 fin
.F.calculateMatrixTrace._3.while.exit.0:
  mv a0, t5
  j .F.calculateMatrixTrace.epilogue                                    # ir inst 13 fin
.F.calculateMatrixTrace.epilogue:
  ret

.globl .F.extractSubmatrix
.F.extractSubmatrix:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.extractSubmatrix._0.entry.0:
# Phi connections
  li t6, 0
  j .F.extractSubmatrix._1.while.cond.0                                 # ir inst 1 fin
.F.extractSubmatrix._1.while.cond.0:
  sltu t5, t6, a3                                                       # ir inst 3 fin
  bnez t5, .F.extractSubmatrix._2.while.body.0
  j .F.extractSubmatrix._6.while.exit.0                                 # ir inst 4 fin
.F.extractSubmatrix._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.extractSubmatrix._3.while.cond.1                                 # ir inst 5 fin
.F.extractSubmatrix._3.while.cond.1:
  sltu t4, t5, a3                                                       # ir inst 7 fin
  bnez t4, .F.extractSubmatrix._4.while.body.1
  j .F.extractSubmatrix._5.while.exit.1                                 # ir inst 8 fin
.F.extractSubmatrix._4.while.body.1:
  mul t4, t6, a3                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  slli t2, t3, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  mul t3, t6, a2                                                        # ir inst 12 fin
  add s11, t3, t5                                                       # ir inst 13 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s11, 0(t3)                                                         # ir inst 15 fin
  sw s11, 0(t4)                                                         # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.extractSubmatrix._3.while.cond.1                                 # ir inst 18 fin
.F.extractSubmatrix._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.extractSubmatrix._1.while.cond.0                                 # ir inst 20 fin
.F.extractSubmatrix._6.while.exit.0:
  j .F.extractSubmatrix.epilogue                                        # ir inst 21 fin
.F.extractSubmatrix.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateDeterminant4x4
.F.calculateDeterminant4x4:
# spill func args num: 0,             range:      160(sp) -      160(sp)
# local var size: 72,                 range:       80(sp) -      152(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 5 / 12,        range:       32(sp) -       72(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -160
  sd s7, 32(sp)
  sd s8, 40(sp)
  sd s9, 48(sp)
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.calculateDeterminant4x4._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.calculateDeterminant4x4._1.while.cond.0                          # ir inst 2 fin
.F.calculateDeterminant4x4._1.while.cond.0:
  li t2, 4
  sltu t4, t5, t2                                                       # ir inst 5 fin
  bnez t4, .F.calculateDeterminant4x4._2.while.body.0
  j .F.calculateDeterminant4x4._18.while.exit.0                         # ir inst 6 fin
.F.calculateDeterminant4x4._2.while.body.0:
  addi t1, sp, 116
  addi t4, t1, 0                                                        # ir inst 8 fin
# Phi connections
  li t3, 0
  j .F.calculateDeterminant4x4._3.array.cond.0                          # ir inst 9 fin
.F.calculateDeterminant4x4._3.array.cond.0:
  li t2, 9
  slt s11, t3, t2                                                       # ir inst 11 fin
  bnez s11, .F.calculateDeterminant4x4._4.array.body.0
  j .F.calculateDeterminant4x4._5.array.exit.0                          # ir inst 12 fin
.F.calculateDeterminant4x4._4.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 13 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 14 fin
  addi s11, t3, 1                                                       # ir inst 15 fin
# Phi connections
  mv t3, s11
  j .F.calculateDeterminant4x4._3.array.cond.0                          # ir inst 16 fin
.F.calculateDeterminant4x4._5.array.exit.0:
# Phi connections
  li t3, 0
  li t4, 1
  j .F.calculateDeterminant4x4._6.while.cond.1                          # ir inst 17 fin
.F.calculateDeterminant4x4._6.while.cond.1:
  li t2, 4
  sltu s11, t4, t2                                                      # ir inst 20 fin
  bnez s11, .F.calculateDeterminant4x4._7.while.body.1
  j .F.calculateDeterminant4x4._14.while.exit.1                         # ir inst 21 fin
.F.calculateDeterminant4x4._7.while.body.1:
# Phi connections
  li s10, 0
  li s11, 0
  j .F.calculateDeterminant4x4._8.while.cond.2                          # ir inst 22 fin
.F.calculateDeterminant4x4._8.while.cond.2:
  li t2, 4
  sltu s9, s10, t2                                                      # ir inst 25 fin
  bnez s9, .F.calculateDeterminant4x4._9.while.body.2
  j .F.calculateDeterminant4x4._13.while.exit.2                         # ir inst 26 fin
.F.calculateDeterminant4x4._9.while.body.2:
  xor t0, s10, t5
  sltu s9, zero, t0                                                     # ir inst 27 fin
  bnez s9, .F.calculateDeterminant4x4._10.if.then.0
  j .F.calculateDeterminant4x4._11.if.else.0                            # ir inst 28 fin
.F.calculateDeterminant4x4._10.if.then.0:
  li t2, 3
  mul s9, t3, t2                                                        # ir inst 29 fin
  add s8, s9, s11                                                       # ir inst 30 fin
  slli t2, s8, 2
  addi t1, sp, 116
  add s9, t1, t2                                                        # ir inst 31 fin
  slli s8, t4, 2                                                        # ir inst 32 fin
  add s7, s8, s10                                                       # ir inst 33 fin
  slli t2, s7, 2
  add s8, a0, t2                                                        # ir inst 34 fin
  lw s7, 0(s8)                                                          # ir inst 35 fin
  sw s7, 0(s9)                                                          # ir inst 36 fin
  addi s9, s11, 1                                                       # ir inst 37 fin
# Phi connections
  mv s11, s9
  j .F.calculateDeterminant4x4._12.if.exit.0                            # ir inst 38 fin
.F.calculateDeterminant4x4._11.if.else.0:
# Phi connections
  j .F.calculateDeterminant4x4._12.if.exit.0                            # ir inst 39 fin
.F.calculateDeterminant4x4._12.if.exit.0:
  addi s9, s10, 1                                                       # ir inst 41 fin
# Phi connections
  mv s10, s9
  j .F.calculateDeterminant4x4._8.while.cond.2                          # ir inst 42 fin
.F.calculateDeterminant4x4._13.while.exit.2:
  addi s11, t3, 1                                                       # ir inst 43 fin
  addi t3, t4, 1                                                        # ir inst 44 fin
# Phi connections
  mv t4, t3
  mv t3, s11
  j .F.calculateDeterminant4x4._6.while.cond.1                          # ir inst 45 fin
.F.calculateDeterminant4x4._14.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 36
  addi t1, sp, 116
  mv a1, t1
  addi t1, sp, 80
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 80
  mv a0, t1
  call .F.calculateDeterminant3x3
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 47 fin
  li t2, 2
  remu t3, t5, t2                                                       # ir inst 48 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 49 fin
  bnez s11, .F.calculateDeterminant4x4._15.if.then.1
  j .F.calculateDeterminant4x4._16.if.else.1                            # ir inst 50 fin
.F.calculateDeterminant4x4._15.if.then.1:
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 51 fin
  lw s11, 0(t3)                                                         # ir inst 52 fin
  mul t3, s11, t4                                                       # ir inst 53 fin
  add s11, t6, t3                                                       # ir inst 54 fin
# Phi connections
  mv t4, s11
  j .F.calculateDeterminant4x4._17.if.exit.1                            # ir inst 55 fin
.F.calculateDeterminant4x4._16.if.else.1:
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 56 fin
  lw s11, 0(t3)                                                         # ir inst 57 fin
  mul t3, s11, t4                                                       # ir inst 58 fin
  sub t4, t6, t3                                                        # ir inst 59 fin
# Phi connections
  j .F.calculateDeterminant4x4._17.if.exit.1                            # ir inst 60 fin
.F.calculateDeterminant4x4._17.if.exit.1:
  addi t3, t5, 1                                                        # ir inst 62 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateDeterminant4x4._1.while.cond.0                          # ir inst 63 fin
.F.calculateDeterminant4x4._18.while.exit.0:
  mv a0, t6
  j .F.calculateDeterminant4x4.epilogue                                 # ir inst 64 fin
.F.calculateDeterminant4x4.epilogue:
  ld ra, 72(sp)
  ld s7, 32(sp)
  ld s8, 40(sp)
  ld s9, 48(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  addi sp, sp, 160
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

.globl .F.performVectorCalculations
.F.performVectorCalculations:
# spill func args num: 0,             range:     2032(sp) -     2032(sp)
# local var size: 2000,               range:       32(sp) -     2032(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -2032
  sd ra, 24(sp)
.F.performVectorCalculations._0.entry.0:
  addi t1, sp, 832
  addi t6, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F.performVectorCalculations._1.array.cond.0                        # ir inst 5 fin
.F.performVectorCalculations._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.performVectorCalculations._2.array.body.0
  j .F.performVectorCalculations._3.array.exit.0                        # ir inst 8 fin
.F.performVectorCalculations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.performVectorCalculations._1.array.cond.0                        # ir inst 12 fin
.F.performVectorCalculations._3.array.exit.0:
  addi t1, sp, 1232
  addi t6, t1, 0                                                        # ir inst 14 fin
# Phi connections
  li t5, 0
  j .F.performVectorCalculations._4.array.cond.1                        # ir inst 15 fin
.F.performVectorCalculations._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 17 fin
  bnez t4, .F.performVectorCalculations._5.array.body.1
  j .F.performVectorCalculations._6.array.exit.1                        # ir inst 18 fin
.F.performVectorCalculations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  j .F.performVectorCalculations._4.array.cond.1                        # ir inst 22 fin
.F.performVectorCalculations._6.array.exit.1:
  addi t1, sp, 1632
  addi t6, t1, 0                                                        # ir inst 24 fin
# Phi connections
  li t5, 0
  j .F.performVectorCalculations._7.array.cond.2                        # ir inst 25 fin
.F.performVectorCalculations._7.array.cond.2:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.performVectorCalculations._8.array.body.2
  j .F.performVectorCalculations._9.array.exit.2                        # ir inst 28 fin
.F.performVectorCalculations._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 29 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 30 fin
  addi t4, t5, 1                                                        # ir inst 31 fin
# Phi connections
  mv t5, t4
  j .F.performVectorCalculations._7.array.cond.2                        # ir inst 32 fin
.F.performVectorCalculations._9.array.exit.2:
# Start call preparation
  li a2, 100
  addi t1, sp, 1232
  mv a1, t1
  addi t1, sp, 832
  mv a0, t1
  call .F.initializeVectors
# ir inst 33 fin
# Start call preparation
  li a2, 100
  addi t1, sp, 1232
  mv a1, t1
  addi t1, sp, 832
  mv a0, t1
  call .F.vectorDotProduct
  mv t6, a0
# ir inst 34 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 100
  addi t1, sp, 1632
  mv a2, t1
  addi t1, sp, 1232
  mv a1, t1
  addi t1, sp, 832
  mv a0, t1
  call .F.vectorAddition
  ld t6, 0(sp)
# ir inst 35 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 400
  addi t1, sp, 832
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 36 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 100
  addi t1, sp, 32
  mv a0, t1
  call .F.vectorMagnitude
  mv t5, a0
  ld t6, 0(sp)
# ir inst 37 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a2, 400
  addi t1, sp, 1232
  mv a1, t1
  addi t1, sp, 432
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 38 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 100
  addi t1, sp, 432
  mv a0, t1
  call .F.vectorMagnitude
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 39 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 100
  li a1, 3
  addi t1, sp, 1632
  mv a0, t1
  call .F.vectorScalarMultiply
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 40 fin
  add t3, t6, t5                                                        # ir inst 41 fin
  add t6, t3, t4                                                        # ir inst 42 fin
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 43 fin
  mv a0, t5
  j .F.performVectorCalculations.epilogue                               # ir inst 44 fin
.F.performVectorCalculations.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 2032
  ret

.globl .F.initializeVectors
.F.initializeVectors:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeVectors._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeVectors._1.while.cond.0                                # ir inst 1 fin
.F.initializeVectors._1.while.cond.0:
  sltu t5, t6, a2                                                       # ir inst 3 fin
  bnez t5, .F.initializeVectors._2.while.body.0
  j .F.initializeVectors._3.while.exit.0                                # ir inst 4 fin
.F.initializeVectors._2.while.body.0:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 5 fin
  addi t4, t6, 1                                                        # ir inst 6 fin
  mv t3, t4                                                             # ir inst 7 fin
  li t2, 20
  rem t4, t3, t2                                                        # ir inst 8 fin
  sw t4, 0(t5)                                                          # ir inst 9 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 10 fin
  slli t4, t6, 1                                                        # ir inst 11 fin
  addi t3, t4, 3                                                        # ir inst 12 fin
  mv t4, t3                                                             # ir inst 13 fin
  li t2, 15
  rem t3, t4, t2                                                        # ir inst 14 fin
  sw t3, 0(t5)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.initializeVectors._1.while.cond.0                                # ir inst 17 fin
.F.initializeVectors._3.while.exit.0:
  j .F.initializeVectors.epilogue                                       # ir inst 18 fin
.F.initializeVectors.epilogue:
  ret

.globl .F.vectorDotProduct
.F.vectorDotProduct:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.vectorDotProduct._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.vectorDotProduct._1.while.cond.0                                 # ir inst 1 fin
.F.vectorDotProduct._1.while.cond.0:
  sltu t4, t6, a2                                                       # ir inst 4 fin
  bnez t4, .F.vectorDotProduct._2.while.body.0
  j .F.vectorDotProduct._3.while.exit.0                                 # ir inst 5 fin
.F.vectorDotProduct._2.while.body.0:
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  lw t3, 0(t4)                                                          # ir inst 7 fin
  slli t2, t6, 2
  add t4, a1, t2                                                        # ir inst 8 fin
  lw s11, 0(t4)                                                         # ir inst 9 fin
  mul t4, t3, s11                                                       # ir inst 10 fin
  add t3, t5, t4                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.vectorDotProduct._1.while.cond.0                                 # ir inst 13 fin
.F.vectorDotProduct._3.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 14 fin
  mv a0, t6
  j .F.vectorDotProduct.epilogue                                        # ir inst 15 fin
.F.vectorDotProduct.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.vectorAddition
.F.vectorAddition:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.vectorAddition._0.entry.0:
# Phi connections
  li t6, 0
  j .F.vectorAddition._1.while.cond.0                                   # ir inst 1 fin
.F.vectorAddition._1.while.cond.0:
  sltu t5, t6, a3                                                       # ir inst 3 fin
  bnez t5, .F.vectorAddition._2.while.body.0
  j .F.vectorAddition._3.while.exit.0                                   # ir inst 4 fin
.F.vectorAddition._2.while.body.0:
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 5 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  lw t3, 0(t4)                                                          # ir inst 7 fin
  slli t2, t6, 2
  add t4, a1, t2                                                        # ir inst 8 fin
  lw s11, 0(t4)                                                         # ir inst 9 fin
  add t4, t3, s11                                                       # ir inst 10 fin
  sw t4, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.vectorAddition._1.while.cond.0                                   # ir inst 13 fin
.F.vectorAddition._3.while.exit.0:
  j .F.vectorAddition.epilogue                                          # ir inst 14 fin
.F.vectorAddition.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.vectorMagnitude
.F.vectorMagnitude:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.vectorMagnitude._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.vectorMagnitude._1.while.cond.0                                  # ir inst 1 fin
.F.vectorMagnitude._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.vectorMagnitude._2.while.body.0
  j .F.vectorMagnitude._3.while.exit.0                                  # ir inst 5 fin
.F.vectorMagnitude._2.while.body.0:
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  lw t3, 0(t4)                                                          # ir inst 7 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw s11, 0(t4)                                                         # ir inst 9 fin
  mul t4, t3, s11                                                       # ir inst 10 fin
  add t3, t5, t4                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.vectorMagnitude._1.while.cond.0                                  # ir inst 13 fin
.F.vectorMagnitude._3.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call .F.integerSquareRoot
  mv t6, a0
  ld t5, 0(sp)
# ir inst 14 fin
  mv a0, t6
  j .F.vectorMagnitude.epilogue                                         # ir inst 15 fin
.F.vectorMagnitude.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.integerSquareRoot
.F.integerSquareRoot:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
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
  mv t5, a0
  li t6, 0
  j .F.integerSquareRoot._4.while.cond.0                                # ir inst 5 fin
.F.integerSquareRoot._4.while.cond.0:
  xor t0, t5, t6
  sltu t4, zero, t0                                                     # ir inst 8 fin
  bnez t4, .F.integerSquareRoot._5.while.body.0
  j .F.integerSquareRoot._6.while.exit.0                                # ir inst 9 fin
.F.integerSquareRoot._5.while.body.0:
  div t6, a0, t5                                                        # ir inst 10 fin
  add t4, t5, t6                                                        # ir inst 11 fin
  li t2, 2
  div t6, t4, t2                                                        # ir inst 12 fin
# Phi connections
  mv t0, t5
  mv t5, t6
  mv t6, t0
  j .F.integerSquareRoot._4.while.cond.0                                # ir inst 13 fin
.F.integerSquareRoot._6.while.exit.0:
  mv a0, t5
  j .F.integerSquareRoot.epilogue                                       # ir inst 14 fin
.F.integerSquareRoot.epilogue:
  ret

.globl .F.vectorScalarMultiply
.F.vectorScalarMultiply:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.vectorScalarMultiply._0.entry.0:
# Phi connections
  li t6, 0
  j .F.vectorScalarMultiply._1.while.cond.0                             # ir inst 1 fin
.F.vectorScalarMultiply._1.while.cond.0:
  sltu t5, t6, a2                                                       # ir inst 3 fin
  bnez t5, .F.vectorScalarMultiply._2.while.body.0
  j .F.vectorScalarMultiply._3.while.exit.0                             # ir inst 4 fin
.F.vectorScalarMultiply._2.while.body.0:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 5 fin
  lw t4, 0(t5)                                                          # ir inst 6 fin
  mul t3, t4, a1                                                        # ir inst 7 fin
  sw t3, 0(t5)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.vectorScalarMultiply._1.while.cond.0                             # ir inst 10 fin
.F.vectorScalarMultiply._3.while.exit.0:
  j .F.vectorScalarMultiply.epilogue                                    # ir inst 11 fin
.F.vectorScalarMultiply.epilogue:
  ret

.globl .F.solveLinearSystem
.F.solveLinearSystem:
# spill func args num: 0,             range:      256(sp) -      256(sp)
# local var size: 240,                range:       16(sp) -      256(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -256
  sd ra, 8(sp)
.F.solveLinearSystem._0.entry.0:
  addi t1, sp, 136
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.solveLinearSystem._1.array.cond.0                                # ir inst 4 fin
.F.solveLinearSystem._1.array.cond.0:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.solveLinearSystem._2.array.body.0
  j .F.solveLinearSystem._3.array.exit.0                                # ir inst 7 fin
.F.solveLinearSystem._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.solveLinearSystem._1.array.cond.0                                # ir inst 11 fin
.F.solveLinearSystem._3.array.exit.0:
# Start call preparation
  li a1, 5
  addi t1, sp, 136
  mv a0, t1
  call .F.initializeLinearSystem
# ir inst 12 fin
# Start call preparation
  li a1, 5
  addi t1, sp, 136
  mv a0, t1
  call .F.gaussianElimination
# ir inst 13 fin
# Start call preparation
  li a2, 120
  addi t1, sp, 136
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 14 fin
# Start call preparation
  li a1, 5
  addi t1, sp, 16
  mv a0, t1
  call .F.backSubstitution
  mv t6, a0
# ir inst 15 fin
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 16 fin
  mv a0, t5
  j .F.solveLinearSystem.epilogue                                       # ir inst 17 fin
.F.solveLinearSystem.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 256
  ret

.globl .F.initializeLinearSystem
.F.initializeLinearSystem:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeLinearSystem._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeLinearSystem._1.while.cond.0                           # ir inst 1 fin
.F.initializeLinearSystem._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.initializeLinearSystem._2.while.body.0
  j .F.initializeLinearSystem._9.while.exit.0                           # ir inst 4 fin
.F.initializeLinearSystem._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.initializeLinearSystem._3.while.cond.1                           # ir inst 5 fin
.F.initializeLinearSystem._3.while.cond.1:
  sltu t4, t5, a1                                                       # ir inst 7 fin
  bnez t4, .F.initializeLinearSystem._4.while.body.1
  j .F.initializeLinearSystem._8.while.exit.1                           # ir inst 8 fin
.F.initializeLinearSystem._4.while.body.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F.initializeLinearSystem._5.if.then.0
  j .F.initializeLinearSystem._6.if.else.0                              # ir inst 10 fin
.F.initializeLinearSystem._5.if.then.0:
  addi t4, a1, 1                                                        # ir inst 11 fin
  mul t3, t6, t4                                                        # ir inst 12 fin
  add t4, t3, t5                                                        # ir inst 13 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  mv t4, t6                                                             # ir inst 15 fin
  addi s11, t4, 10                                                      # ir inst 16 fin
  sw s11, 0(t3)                                                         # ir inst 17 fin
  j .F.initializeLinearSystem._7.if.exit.0                              # ir inst 18 fin
.F.initializeLinearSystem._6.if.else.0:
  addi t4, a1, 1                                                        # ir inst 19 fin
  mul t3, t6, t4                                                        # ir inst 20 fin
  add t4, t3, t5                                                        # ir inst 21 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 22 fin
  add t4, t6, t5                                                        # ir inst 23 fin
  addi s11, t4, 1                                                       # ir inst 24 fin
  mv t4, s11                                                            # ir inst 25 fin
  li t2, 5
  rem s11, t4, t2                                                       # ir inst 26 fin
  sw s11, 0(t3)                                                         # ir inst 27 fin
  j .F.initializeLinearSystem._7.if.exit.0                              # ir inst 28 fin
.F.initializeLinearSystem._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.initializeLinearSystem._3.while.cond.1                           # ir inst 30 fin
.F.initializeLinearSystem._8.while.exit.1:
  addi t5, a1, 1                                                        # ir inst 31 fin
  mul t4, t6, t5                                                        # ir inst 32 fin
  add t5, t4, a1                                                        # ir inst 33 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 34 fin
  addi t5, t6, 1                                                        # ir inst 35 fin
  mv t3, t5                                                             # ir inst 36 fin
  li t2, 10
  mul t5, t3, t2                                                        # ir inst 37 fin
  sw t5, 0(t4)                                                          # ir inst 38 fin
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F.initializeLinearSystem._1.while.cond.0                           # ir inst 40 fin
.F.initializeLinearSystem._9.while.exit.0:
  j .F.initializeLinearSystem.epilogue                                  # ir inst 41 fin
.F.initializeLinearSystem.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.gaussianElimination
.F.gaussianElimination:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 4 / 12,        range:       48(sp) -       80(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s8, 48(sp)
  sd s9, 56(sp)
  sd s10, 64(sp)
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.gaussianElimination._0.entry.0:
# Phi connections
  li t6, 0
  j .F.gaussianElimination._1.while.cond.0                              # ir inst 1 fin
.F.gaussianElimination._1.while.cond.0:
  sltu t5, t6, a1                                                       # ir inst 3 fin
  bnez t5, .F.gaussianElimination._2.while.body.0
  j .F.gaussianElimination._21.while.exit.0                             # ir inst 4 fin
.F.gaussianElimination._2.while.body.0:
  addi t5, t6, 1                                                        # ir inst 5 fin
# Phi connections
  mv t4, t6
  j .F.gaussianElimination._3.while.cond.1                              # ir inst 6 fin
.F.gaussianElimination._3.while.cond.1:
  sltu t3, t5, a1                                                       # ir inst 9 fin
  bnez t3, .F.gaussianElimination._4.while.body.1
  j .F.gaussianElimination._8.while.exit.1                              # ir inst 10 fin
.F.gaussianElimination._4.while.body.1:
  addi t3, a1, 1                                                        # ir inst 11 fin
  mul s11, t5, t3                                                       # ir inst 12 fin
  add t3, s11, t6                                                       # ir inst 13 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 14 fin
  lw t3, 0(s11)                                                         # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, t3
  call .F.abs
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 16 fin
  addi t3, a1, 1                                                        # ir inst 17 fin
  mul s10, t4, t3                                                       # ir inst 18 fin
  add t3, s10, t6                                                       # ir inst 19 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 20 fin
  lw t3, 0(s10)                                                         # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, t3
  call .F.abs
  mv s10, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 22 fin
  slt t3, s10, s11                                                      # ir inst 23 fin
  bnez t3, .F.gaussianElimination._5.if.then.0
  j .F.gaussianElimination._6.if.else.0                                 # ir inst 24 fin
.F.gaussianElimination._5.if.then.0:
# Phi connections
  mv t3, t5
  j .F.gaussianElimination._7.if.exit.0                                 # ir inst 25 fin
.F.gaussianElimination._6.if.else.0:
# Phi connections
  mv t3, t4
  j .F.gaussianElimination._7.if.exit.0                                 # ir inst 26 fin
.F.gaussianElimination._7.if.exit.0:
  addi s11, t5, 1                                                       # ir inst 28 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.gaussianElimination._3.while.cond.1                              # ir inst 29 fin
.F.gaussianElimination._8.while.exit.1:
  xor t0, t4, t6
  sltu t5, zero, t0                                                     # ir inst 30 fin
  bnez t5, .F.gaussianElimination._9.if.then.1
  j .F.gaussianElimination._10.if.else.1                                # ir inst 31 fin
.F.gaussianElimination._9.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a3, a1
  mv a2, t4
  mv a1, t6
  call .F.swapRows
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 32 fin
  j .F.gaussianElimination._11.if.exit.1                                # ir inst 33 fin
.F.gaussianElimination._10.if.else.1:
  j .F.gaussianElimination._11.if.exit.1                                # ir inst 34 fin
.F.gaussianElimination._11.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 35 fin
# Phi connections
  j .F.gaussianElimination._12.while.cond.2                             # ir inst 36 fin
.F.gaussianElimination._12.while.cond.2:
  sltu t4, t5, a1                                                       # ir inst 38 fin
  bnez t4, .F.gaussianElimination._13.while.body.2
  j .F.gaussianElimination._20.while.exit.2                             # ir inst 39 fin
.F.gaussianElimination._13.while.body.2:
  addi t4, a1, 1                                                        # ir inst 40 fin
  mul t3, t6, t4                                                        # ir inst 41 fin
  add t4, t3, t6                                                        # ir inst 42 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 43 fin
  lw t4, 0(t3)                                                          # ir inst 44 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 45 fin
  bnez t3, .F.gaussianElimination._14.if.then.2
  j .F.gaussianElimination._18.if.else.2                                # ir inst 46 fin
.F.gaussianElimination._14.if.then.2:
  addi t4, a1, 1                                                        # ir inst 47 fin
  mul t3, t5, t4                                                        # ir inst 48 fin
  add t4, t3, t6                                                        # ir inst 49 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 50 fin
  lw t4, 0(t3)                                                          # ir inst 51 fin
  addi t3, a1, 1                                                        # ir inst 52 fin
  mul s11, t6, t3                                                       # ir inst 53 fin
  add t3, s11, t6                                                       # ir inst 54 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 55 fin
  lw t3, 0(s11)                                                         # ir inst 56 fin
  div s11, t4, t3                                                       # ir inst 57 fin
# Phi connections
  mv t4, t6
  j .F.gaussianElimination._15.while.cond.3                             # ir inst 58 fin
.F.gaussianElimination._15.while.cond.3:
  sltu t0, a1, t4
  xori t3, t0, 1                                                        # ir inst 60 fin
  bnez t3, .F.gaussianElimination._16.while.body.3
  j .F.gaussianElimination._17.while.exit.3                             # ir inst 61 fin
.F.gaussianElimination._16.while.body.3:
  addi t3, a1, 1                                                        # ir inst 62 fin
  mul s10, t5, t3                                                       # ir inst 63 fin
  add t3, s10, t4                                                       # ir inst 64 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 65 fin
  lw t3, 0(s10)                                                         # ir inst 66 fin
  addi s9, a1, 1                                                        # ir inst 67 fin
  mul s8, t6, s9                                                        # ir inst 68 fin
  add s9, s8, t4                                                        # ir inst 69 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 70 fin
  lw s9, 0(s8)                                                          # ir inst 71 fin
  mul s8, s11, s9                                                       # ir inst 72 fin
  sub s9, t3, s8                                                        # ir inst 73 fin
  sw s9, 0(s10)                                                         # ir inst 74 fin
  addi t3, t4, 1                                                        # ir inst 75 fin
# Phi connections
  mv t4, t3
  j .F.gaussianElimination._15.while.cond.3                             # ir inst 76 fin
.F.gaussianElimination._17.while.exit.3:
  j .F.gaussianElimination._19.if.exit.2                                # ir inst 77 fin
.F.gaussianElimination._18.if.else.2:
  j .F.gaussianElimination._19.if.exit.2                                # ir inst 78 fin
.F.gaussianElimination._19.if.exit.2:
  addi t4, t5, 1                                                        # ir inst 79 fin
# Phi connections
  mv t5, t4
  j .F.gaussianElimination._12.while.cond.2                             # ir inst 80 fin
.F.gaussianElimination._20.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 81 fin
# Phi connections
  mv t6, t5
  j .F.gaussianElimination._1.while.cond.0                              # ir inst 82 fin
.F.gaussianElimination._21.while.exit.0:
  j .F.gaussianElimination.epilogue                                     # ir inst 83 fin
.F.gaussianElimination.epilogue:
  ld ra, 80(sp)
  ld s8, 48(sp)
  ld s9, 56(sp)
  ld s10, 64(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.swapRows
.F.swapRows:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.swapRows._0.entry.0:
# Phi connections
  li t6, 0
  j .F.swapRows._1.while.cond.0                                         # ir inst 1 fin
.F.swapRows._1.while.cond.0:
  sltu t0, a3, t6
  xori t5, t0, 1                                                        # ir inst 3 fin
  bnez t5, .F.swapRows._2.while.body.0
  j .F.swapRows._3.while.exit.0                                         # ir inst 4 fin
.F.swapRows._2.while.body.0:
  addi t5, a3, 1                                                        # ir inst 5 fin
  mul t4, a1, t5                                                        # ir inst 6 fin
  add t5, t4, t6                                                        # ir inst 7 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t5, 0(t4)                                                          # ir inst 9 fin
  addi t4, a3, 1                                                        # ir inst 10 fin
  mul t3, a1, t4                                                        # ir inst 11 fin
  add t4, t3, t6                                                        # ir inst 12 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  addi t4, a3, 1                                                        # ir inst 14 fin
  mul s11, a2, t4                                                       # ir inst 15 fin
  add t4, s11, t6                                                       # ir inst 16 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 17 fin
  lw t4, 0(s11)                                                         # ir inst 18 fin
  sw t4, 0(t3)                                                          # ir inst 19 fin
  addi t4, a3, 1                                                        # ir inst 20 fin
  mul t3, a2, t4                                                        # ir inst 21 fin
  add t4, t3, t6                                                        # ir inst 22 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  sw t5, 0(t3)                                                          # ir inst 24 fin
  addi t5, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t5
  j .F.swapRows._1.while.cond.0                                         # ir inst 26 fin
.F.swapRows._3.while.exit.0:
  j .F.swapRows.epilogue                                                # ir inst 27 fin
.F.swapRows.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.backSubstitution
.F.backSubstitution:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 20,                 range:       40(sp) -       60(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s7, 0(sp)
  sd s8, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
.F.backSubstitution._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.backSubstitution._1.array.cond.0                                 # ir inst 3 fin
.F.backSubstitution._1.array.cond.0:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.backSubstitution._2.array.body.0
  j .F.backSubstitution._3.array.exit.0                                 # ir inst 6 fin
.F.backSubstitution._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.backSubstitution._1.array.cond.0                                 # ir inst 10 fin
.F.backSubstitution._3.array.exit.0:
  addi t6, a1, -1                                                       # ir inst 11 fin
  mv t5, t6                                                             # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F.backSubstitution._4.while.cond.0                                 # ir inst 13 fin
.F.backSubstitution._4.while.cond.0:
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 16 fin
  bnez t4, .F.backSubstitution._5.while.body.0
  j .F.backSubstitution._12.while.exit.0                                # ir inst 17 fin
.F.backSubstitution._5.while.body.0:
  addi t4, t5, -1                                                       # ir inst 18 fin
  addi t5, t4, 1                                                        # ir inst 19 fin
  mv t3, t5                                                             # ir inst 20 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 21 fin
  addi s11, a1, 1                                                       # ir inst 22 fin
  mul s10, t3, s11                                                      # ir inst 23 fin
  add s11, s10, a1                                                      # ir inst 24 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 25 fin
  lw s11, 0(s10)                                                        # ir inst 26 fin
  sw s11, 0(t5)                                                         # ir inst 27 fin
  addi t5, t3, 1                                                        # ir inst 28 fin
# Phi connections
  j .F.backSubstitution._6.while.cond.1                                 # ir inst 29 fin
.F.backSubstitution._6.while.cond.1:
  sltu s11, t5, a1                                                      # ir inst 31 fin
  bnez s11, .F.backSubstitution._7.while.body.1
  j .F.backSubstitution._8.while.exit.1                                 # ir inst 32 fin
.F.backSubstitution._7.while.body.1:
  slli t2, t3, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 33 fin
  lw s10, 0(s11)                                                        # ir inst 34 fin
  addi s9, a1, 1                                                        # ir inst 35 fin
  mul s8, t3, s9                                                        # ir inst 36 fin
  add s9, s8, t5                                                        # ir inst 37 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 38 fin
  lw s9, 0(s8)                                                          # ir inst 39 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 40 fin
  lw s7, 0(s8)                                                          # ir inst 41 fin
  mul s8, s9, s7                                                        # ir inst 42 fin
  sub s9, s10, s8                                                       # ir inst 43 fin
  sw s9, 0(s11)                                                         # ir inst 44 fin
  addi s11, t5, 1                                                       # ir inst 45 fin
# Phi connections
  mv t5, s11
  j .F.backSubstitution._6.while.cond.1                                 # ir inst 46 fin
.F.backSubstitution._8.while.exit.1:
  addi t5, a1, 1                                                        # ir inst 47 fin
  mul s11, t3, t5                                                       # ir inst 48 fin
  add t5, s11, t3                                                       # ir inst 49 fin
  slli t2, t5, 2
  add s11, a0, t2                                                       # ir inst 50 fin
  lw t5, 0(s11)                                                         # ir inst 51 fin
  li t2, 0
  xor t0, t5, t2
  sltu s11, zero, t0                                                    # ir inst 52 fin
  bnez s11, .F.backSubstitution._9.if.then.0
  j .F.backSubstitution._10.if.else.0                                   # ir inst 53 fin
.F.backSubstitution._9.if.then.0:
  slli t2, t3, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 54 fin
  lw s11, 0(t5)                                                         # ir inst 55 fin
  addi s10, a1, 1                                                       # ir inst 56 fin
  mul s9, t3, s10                                                       # ir inst 57 fin
  add s10, s9, t3                                                       # ir inst 58 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 59 fin
  lw s10, 0(s9)                                                         # ir inst 60 fin
  div s9, s11, s10                                                      # ir inst 61 fin
  sw s9, 0(t5)                                                          # ir inst 62 fin
  j .F.backSubstitution._11.if.exit.0                                   # ir inst 63 fin
.F.backSubstitution._10.if.else.0:
  j .F.backSubstitution._11.if.exit.0                                   # ir inst 64 fin
.F.backSubstitution._11.if.exit.0:
  slli t2, t3, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 65 fin
  lw t3, 0(t5)                                                          # ir inst 66 fin
  add t5, t6, t3                                                        # ir inst 67 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.backSubstitution._4.while.cond.0                                 # ir inst 68 fin
.F.backSubstitution._12.while.exit.0:
  mv a0, t6
  j .F.backSubstitution.epilogue                                        # ir inst 69 fin
.F.backSubstitution.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  addi sp, sp, 64
  ret

.globl .F.abs
.F.abs:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.abs._0.entry.0:
  li t2, 0
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.abs._1.if.then.0
  j .F.abs._2.if.else.0                                                 # ir inst 2 fin
.F.abs._1.if.then.0:
  li t1, 0
  sub t6, t1, a0                                                        # ir inst 3 fin
  mv a0, t6
  j .F.abs.epilogue                                                     # ir inst 4 fin
.F.abs._2.if.else.0:
  j .F.abs.epilogue                                                     # ir inst 5 fin
.F.abs._3.if.exit.0:
.F.abs.epilogue:
  ret

.globl .F.performCombinatorialAlgorithms
.F.performCombinatorialAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performCombinatorialAlgorithms._0.entry.0:
# Start call preparation
  li a0, 3007
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 20
  call .F.calculatePascalTriangle
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
  call .F.calculatePermutations
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
  call .F.calculateCombinations
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 15
  call .F.calculateCatalanNumbers
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 3008
  call printlnInt
# ir inst 10 fin
  j .F.performCombinatorialAlgorithms.epilogue                          # ir inst 11 fin
.F.performCombinatorialAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.calculatePascalTriangle
.F.calculatePascalTriangle:
# spill func args num: 0,             range:     1680(sp) -     1680(sp)
# local var size: 1640,               range:       32(sp) -     1672(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1680
  sd s9, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.calculatePascalTriangle._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.calculatePascalTriangle._1.array.cond.0                          # ir inst 3 fin
.F.calculatePascalTriangle._1.array.cond.0:
  li t2, 410
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.calculatePascalTriangle._2.array.body.0
  j .F.calculatePascalTriangle._3.array.exit.0                          # ir inst 6 fin
.F.calculatePascalTriangle._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.calculatePascalTriangle._1.array.cond.0                          # ir inst 10 fin
.F.calculatePascalTriangle._3.array.exit.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 12 fin
# Phi connections
  li t5, 1
  li t6, 1
  j .F.calculatePascalTriangle._4.while.cond.0                          # ir inst 13 fin
.F.calculatePascalTriangle._4.while.cond.0:
  sltu t4, t6, a0                                                       # ir inst 16 fin
  bnez t4, .F.calculatePascalTriangle._5.while.body.0
  j .F.calculatePascalTriangle._9.while.exit.0                          # ir inst 17 fin
.F.calculatePascalTriangle._5.while.body.0:
  mul t4, t6, a0                                                        # ir inst 18 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add t3, t1, t2                                                        # ir inst 19 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t3, t4
  li t4, 1
  j .F.calculatePascalTriangle._6.while.cond.1                          # ir inst 22 fin
.F.calculatePascalTriangle._6.while.cond.1:
  sltu s11, t4, t6                                                      # ir inst 25 fin
  bnez s11, .F.calculatePascalTriangle._7.while.body.1
  j .F.calculatePascalTriangle._8.while.exit.1                          # ir inst 26 fin
.F.calculatePascalTriangle._7.while.body.1:
  mul s11, t6, a0                                                       # ir inst 27 fin
  add s10, s11, t4                                                      # ir inst 28 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 29 fin
  addi s10, t6, -1                                                      # ir inst 30 fin
  mul s9, s10, a0                                                       # ir inst 31 fin
  add s10, s9, t4                                                       # ir inst 32 fin
  addi s9, s10, -1                                                      # ir inst 33 fin
  slli t2, s9, 2
  addi t1, sp, 32
  add s10, t1, t2                                                       # ir inst 34 fin
  lw s9, 0(s10)                                                         # ir inst 35 fin
  addi s10, t6, -1                                                      # ir inst 36 fin
  mul s8, s10, a0                                                       # ir inst 37 fin
  add s10, s8, t4                                                       # ir inst 38 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s8, t1, t2                                                        # ir inst 39 fin
  lw s10, 0(s8)                                                         # ir inst 40 fin
  add s8, s9, s10                                                       # ir inst 41 fin
  sw s8, 0(s11)                                                         # ir inst 42 fin
  mul s11, t6, a0                                                       # ir inst 43 fin
  add s10, s11, t4                                                      # ir inst 44 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 45 fin
  lw s10, 0(s11)                                                        # ir inst 46 fin
  add s11, t3, s10                                                      # ir inst 47 fin
  addi s10, t4, 1                                                       # ir inst 48 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.calculatePascalTriangle._6.while.cond.1                          # ir inst 49 fin
.F.calculatePascalTriangle._8.while.exit.1:
  mul t4, t6, a0                                                        # ir inst 50 fin
  add s11, t4, t6                                                       # ir inst 51 fin
  slli t2, s11, 2
  addi t1, sp, 32
  add t4, t1, t2                                                        # ir inst 52 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 53 fin
  addi t4, t3, 1                                                        # ir inst 54 fin
  addi t3, t6, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.calculatePascalTriangle._4.while.cond.0                          # ir inst 56 fin
.F.calculatePascalTriangle._9.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 57 fin
  mv a0, t6
  j .F.calculatePascalTriangle.epilogue                                 # ir inst 58 fin
.F.calculatePascalTriangle.epilogue:
  ld s9, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 1680
  ret

.globl .F.calculatePermutations
.F.calculatePermutations:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.calculatePermutations._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.calculatePermutations._1.while.cond.0                            # ir inst 1 fin
.F.calculatePermutations._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.calculatePermutations._2.while.body.0
  j .F.calculatePermutations._6.while.exit.0                            # ir inst 5 fin
.F.calculatePermutations._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 1
  j .F.calculatePermutations._3.while.cond.1                            # ir inst 6 fin
.F.calculatePermutations._3.while.cond.1:
  slt t0, t6, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.calculatePermutations._4.while.body.1
  j .F.calculatePermutations._5.while.exit.1                            # ir inst 10 fin
.F.calculatePermutations._4.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  mv a0, t6
  call .F.permutation
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 11 fin
  add s10, t3, s11                                                      # ir inst 12 fin
  li t2, 1000000
  rem s11, s10, t2                                                      # ir inst 13 fin
  addi s10, t4, 1                                                       # ir inst 14 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.calculatePermutations._3.while.cond.1                            # ir inst 15 fin
.F.calculatePermutations._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculatePermutations._1.while.cond.0                            # ir inst 17 fin
.F.calculatePermutations._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 18 fin
  mv a0, t6
  j .F.calculatePermutations.epilogue                                   # ir inst 19 fin
.F.calculatePermutations.epilogue:
  ld ra, 56(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.permutation
.F.permutation:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.permutation._0.entry.0:
  sub t6, a0, a1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
# Phi connections
  mv t6, t5
  li t5, 1
  j .F.permutation._1.while.cond.0                                      # ir inst 3 fin
.F.permutation._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 6 fin
  bnez t4, .F.permutation._2.while.body.0
  j .F.permutation._3.while.exit.0                                      # ir inst 7 fin
.F.permutation._2.while.body.0:
  mul t4, t5, t6                                                        # ir inst 8 fin
  li t2, 1000000
  rem t3, t4, t2                                                        # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.permutation._1.while.cond.0                                      # ir inst 11 fin
.F.permutation._3.while.exit.0:
  mv a0, t5
  j .F.permutation.epilogue                                             # ir inst 12 fin
.F.permutation.epilogue:
  ret

.globl .F.calculateCombinations
.F.calculateCombinations:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.calculateCombinations._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.calculateCombinations._1.while.cond.0                            # ir inst 1 fin
.F.calculateCombinations._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.calculateCombinations._2.while.body.0
  j .F.calculateCombinations._6.while.exit.0                            # ir inst 5 fin
.F.calculateCombinations._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.calculateCombinations._3.while.cond.1                            # ir inst 6 fin
.F.calculateCombinations._3.while.cond.1:
  slt t0, t6, t4
  xori s11, t0, 1                                                       # ir inst 9 fin
  bnez s11, .F.calculateCombinations._4.while.body.1
  j .F.calculateCombinations._5.while.exit.1                            # ir inst 10 fin
.F.calculateCombinations._4.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  mv a0, t6
  call .F.combination
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 11 fin
  add s10, t3, s11                                                      # ir inst 12 fin
  li t2, 1000000
  rem s11, s10, t2                                                      # ir inst 13 fin
  addi s10, t4, 1                                                       # ir inst 14 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.calculateCombinations._3.while.cond.1                            # ir inst 15 fin
.F.calculateCombinations._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.calculateCombinations._1.while.cond.0                            # ir inst 17 fin
.F.calculateCombinations._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 18 fin
  mv a0, t6
  j .F.calculateCombinations.epilogue                                   # ir inst 19 fin
.F.calculateCombinations.epilogue:
  ld ra, 56(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.combination
.F.combination:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.combination._0.entry.0:
  sub t6, a0, a1                                                        # ir inst 1 fin
  slt t5, t6, a1                                                        # ir inst 2 fin
  bnez t5, .F.combination._1.if.then.0
  j .F.combination._2.if.else.0                                         # ir inst 3 fin
.F.combination._1.if.then.0:
  sub t6, a0, a1                                                        # ir inst 4 fin
# Phi connections
  j .F.combination._3.if.exit.0                                         # ir inst 5 fin
.F.combination._2.if.else.0:
# Phi connections
  mv t6, a1
  j .F.combination._3.if.exit.0                                         # ir inst 6 fin
.F.combination._3.if.exit.0:
# Phi connections
  li t4, 1
  li t5, 0
  j .F.combination._4.while.cond.0                                      # ir inst 8 fin
.F.combination._4.while.cond.0:
  slt t3, t5, t6                                                        # ir inst 11 fin
  bnez t3, .F.combination._5.while.body.0
  j .F.combination._6.while.exit.0                                      # ir inst 12 fin
.F.combination._5.while.body.0:
  sub t3, a0, t5                                                        # ir inst 13 fin
  mul s11, t4, t3                                                       # ir inst 14 fin
  addi t3, t5, 1                                                        # ir inst 15 fin
  div s10, s11, t3                                                      # ir inst 16 fin
  addi t3, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t4, s10
  mv t5, t3
  j .F.combination._4.while.cond.0                                      # ir inst 18 fin
.F.combination._6.while.exit.0:
  li t2, 1000000
  rem t6, t4, t2                                                        # ir inst 19 fin
  mv a0, t6
  j .F.combination.epilogue                                             # ir inst 20 fin
.F.combination.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateCatalanNumbers
.F.calculateCatalanNumbers:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 60,                 range:       32(sp) -       92(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.calculateCatalanNumbers._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.calculateCatalanNumbers._1.array.cond.0                          # ir inst 3 fin
.F.calculateCatalanNumbers._1.array.cond.0:
  li t2, 15
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.calculateCatalanNumbers._2.array.body.0
  j .F.calculateCatalanNumbers._3.array.exit.0                          # ir inst 6 fin
.F.calculateCatalanNumbers._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.calculateCatalanNumbers._1.array.cond.0                          # ir inst 10 fin
.F.calculateCatalanNumbers._3.array.exit.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 32
  addi t6, t1, 4                                                        # ir inst 13 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 14 fin
# Phi connections
  li t5, 2
  li t6, 2
  j .F.calculateCatalanNumbers._4.while.cond.0                          # ir inst 15 fin
.F.calculateCatalanNumbers._4.while.cond.0:
  sltu t4, t5, a0                                                       # ir inst 18 fin
  bnez t4, .F.calculateCatalanNumbers._5.while.body.0
  j .F.calculateCatalanNumbers._9.while.exit.0                          # ir inst 19 fin
.F.calculateCatalanNumbers._5.while.body.0:
  slli t2, t5, 2
  addi t1, sp, 32
  add t4, t1, t2                                                        # ir inst 20 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 21 fin
# Phi connections
  li t4, 0
  j .F.calculateCatalanNumbers._6.while.cond.1                          # ir inst 22 fin
.F.calculateCatalanNumbers._6.while.cond.1:
  sltu t3, t4, t5                                                       # ir inst 24 fin
  bnez t3, .F.calculateCatalanNumbers._7.while.body.1
  j .F.calculateCatalanNumbers._8.while.exit.1                          # ir inst 25 fin
.F.calculateCatalanNumbers._7.while.body.1:
  slli t2, t5, 2
  addi t1, sp, 32
  add t3, t1, t2                                                        # ir inst 26 fin
  slli t2, t5, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 27 fin
  lw s10, 0(s11)                                                        # ir inst 28 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 29 fin
  lw s9, 0(s11)                                                         # ir inst 30 fin
  addi s11, t5, -1                                                      # ir inst 31 fin
  sub s8, s11, t4                                                       # ir inst 32 fin
  slli t2, s8, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 33 fin
  lw s8, 0(s11)                                                         # ir inst 34 fin
  mul s11, s9, s8                                                       # ir inst 35 fin
  add s9, s10, s11                                                      # ir inst 36 fin
  li t2, 1000000
  rem s11, s9, t2                                                       # ir inst 37 fin
  sw s11, 0(t3)                                                         # ir inst 38 fin
  addi t3, t4, 1                                                        # ir inst 39 fin
# Phi connections
  mv t4, t3
  j .F.calculateCatalanNumbers._6.while.cond.1                          # ir inst 40 fin
.F.calculateCatalanNumbers._8.while.exit.1:
  slli t2, t5, 2
  addi t1, sp, 32
  add t4, t1, t2                                                        # ir inst 41 fin
  lw t3, 0(t4)                                                          # ir inst 42 fin
  add t4, t6, t3                                                        # ir inst 43 fin
  li t2, 1000000
  rem t3, t4, t2                                                        # ir inst 44 fin
  addi t4, t5, 1                                                        # ir inst 45 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.calculateCatalanNumbers._4.while.cond.0                          # ir inst 46 fin
.F.calculateCatalanNumbers._9.while.exit.0:
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 47 fin
  mv a0, t5
  j .F.calculateCatalanNumbers.epilogue                                 # ir inst 48 fin
.F.calculateCatalanNumbers.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 96
  ret

.globl .F.performCryptographicOperations
.F.performCryptographicOperations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.performCryptographicOperations._0.entry.0:
# Start call preparation
  li a0, 3009
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performRSAOperations
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.performModularInverse
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.performPrimalityTesting
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  call .F.performHashOperations
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 3010
  call printlnInt
# ir inst 10 fin
  j .F.performCryptographicOperations.epilogue                          # ir inst 11 fin
.F.performCryptographicOperations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performRSAOperations
.F.performRSAOperations:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.performRSAOperations._0.entry.0:
# Start call preparation
  li a1, 3120
  li a0, 17
  call .F.modularInverse
  mv t6, a0
# ir inst 1 fin
# Phi connections
  li t4, 0
  li t5, 2
  j .F.performRSAOperations._1.while.cond.0                             # ir inst 2 fin
.F.performRSAOperations._1.while.cond.0:
  li t2, 100
  slt t3, t5, t2                                                        # ir inst 5 fin
  bnez t3, .F.performRSAOperations._2.while.body.0
  j .F.performRSAOperations._6.while.exit.0                             # ir inst 6 fin
.F.performRSAOperations._2.while.body.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 3233
  li a1, 17
  mv a0, t5
  call .F.modularPower
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 3233
  mv a1, t6
  mv a0, t3
  call .F.modularPower
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 8 fin
  xor t0, s11, t5
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.performRSAOperations._3.if.then.0
  j .F.performRSAOperations._4.if.else.0                                # ir inst 10 fin
.F.performRSAOperations._3.if.then.0:
  add t3, t4, t5                                                        # ir inst 11 fin
# Phi connections
  j .F.performRSAOperations._5.if.exit.0                                # ir inst 12 fin
.F.performRSAOperations._4.if.else.0:
# Phi connections
  mv t3, t4
  j .F.performRSAOperations._5.if.exit.0                                # ir inst 13 fin
.F.performRSAOperations._5.if.exit.0:
  addi s11, t5, 7                                                       # ir inst 15 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.performRSAOperations._1.while.cond.0                             # ir inst 16 fin
.F.performRSAOperations._6.while.exit.0:
  li t2, 10000
  rem t6, t4, t2                                                        # ir inst 17 fin
  mv a0, t6
  j .F.performRSAOperations.epilogue                                    # ir inst 18 fin
.F.performRSAOperations.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.modularInverse
.F.modularInverse:
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
.F.modularInverse._0.entry.0:
# Phi connections
  mv t3, a0
  mv t4, a1
  li t5, 1
  li t6, 0
  j .F.modularInverse._1.while.cond.0                                   # ir inst 1 fin
.F.modularInverse._1.while.cond.0:
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 6 fin
  bnez s11, .F.modularInverse._2.while.body.0
  j .F.modularInverse._3.while.exit.0                                   # ir inst 7 fin
.F.modularInverse._2.while.body.0:
  div s11, t3, t4                                                       # ir inst 8 fin
  mul s10, s11, t4                                                      # ir inst 9 fin
  sub s9, t3, s10                                                       # ir inst 10 fin
  mul t3, s11, t6                                                       # ir inst 11 fin
  sub s11, t5, t3                                                       # ir inst 12 fin
# Phi connections
  mv t3, t4
  mv t4, s9
  mv t5, t6
  mv t6, s11
  j .F.modularInverse._1.while.cond.0                                   # ir inst 13 fin
.F.modularInverse._3.while.exit.0:
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 14 fin
  bnez t6, .F.modularInverse._4.if.then.0
  j .F.modularInverse._5.if.else.0                                      # ir inst 15 fin
.F.modularInverse._4.if.then.0:
  add t6, t5, a1                                                        # ir inst 16 fin
# Phi connections
  j .F.modularInverse._6.if.exit.0                                      # ir inst 17 fin
.F.modularInverse._5.if.else.0:
# Phi connections
  mv t6, t5
  j .F.modularInverse._6.if.exit.0                                      # ir inst 18 fin
.F.modularInverse._6.if.exit.0:
  mv a0, t6
  j .F.modularInverse.epilogue                                          # ir inst 20 fin
.F.modularInverse.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.performModularInverse
.F.performModularInverse:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.performModularInverse._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 2
  j .F.performModularInverse._1.while.cond.0                            # ir inst 1 fin
.F.performModularInverse._1.while.cond.0:
  li t2, 97
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.performModularInverse._2.while.body.0
  j .F.performModularInverse._6.while.exit.0                            # ir inst 5 fin
.F.performModularInverse._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 97
  mv a0, t6
  call .F.euclideanGCD
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.performModularInverse._3.if.then.0
  j .F.performModularInverse._4.if.else.0                               # ir inst 8 fin
.F.performModularInverse._3.if.then.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 97
  mv a0, t6
  call .F.modularInverse
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 9 fin
  add t3, t5, t4                                                        # ir inst 10 fin
  li t2, 10000
  rem t4, t3, t2                                                        # ir inst 11 fin
# Phi connections
  j .F.performModularInverse._5.if.exit.0                               # ir inst 12 fin
.F.performModularInverse._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performModularInverse._5.if.exit.0                               # ir inst 13 fin
.F.performModularInverse._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performModularInverse._1.while.cond.0                            # ir inst 16 fin
.F.performModularInverse._6.while.exit.0:
  mv a0, t5
  j .F.performModularInverse.epilogue                                   # ir inst 17 fin
.F.performModularInverse.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.performPrimalityTesting
.F.performPrimalityTesting:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.performPrimalityTesting._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 3
  j .F.performPrimalityTesting._1.while.cond.0                          # ir inst 1 fin
.F.performPrimalityTesting._1.while.cond.0:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.performPrimalityTesting._2.while.body.0
  j .F.performPrimalityTesting._6.while.exit.0                          # ir inst 5 fin
.F.performPrimalityTesting._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 5
  mv a0, t6
  call .F.fermatPrimalityTest
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.performPrimalityTesting._3.if.then.0
  j .F.performPrimalityTesting._4.if.else.0                             # ir inst 8 fin
.F.performPrimalityTesting._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.performPrimalityTesting._5.if.exit.0                             # ir inst 10 fin
.F.performPrimalityTesting._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performPrimalityTesting._5.if.exit.0                             # ir inst 11 fin
.F.performPrimalityTesting._5.if.exit.0:
  addi t3, t6, 2                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performPrimalityTesting._1.while.cond.0                          # ir inst 14 fin
.F.performPrimalityTesting._6.while.exit.0:
  mv a0, t5
  j .F.performPrimalityTesting.epilogue                                 # ir inst 15 fin
.F.performPrimalityTesting.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.fermatPrimalityTest
.F.fermatPrimalityTest:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.fermatPrimalityTest._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.fermatPrimalityTest._1.if.then.0
  j .F.fermatPrimalityTest._2.if.else.0                                 # ir inst 2 fin
.F.fermatPrimalityTest._1.if.then.0:
  li a0, 0
  j .F.fermatPrimalityTest.epilogue                                     # ir inst 3 fin
.F.fermatPrimalityTest._2.if.else.0:
  j .F.fermatPrimalityTest._3.if.exit.0                                 # ir inst 4 fin
.F.fermatPrimalityTest._3.if.exit.0:
  li t2, 3
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 5 fin
  bnez t6, .F.fermatPrimalityTest._4.if.then.1
  j .F.fermatPrimalityTest._5.if.else.1                                 # ir inst 6 fin
.F.fermatPrimalityTest._4.if.then.1:
  li a0, 1
  j .F.fermatPrimalityTest.epilogue                                     # ir inst 7 fin
.F.fermatPrimalityTest._5.if.else.1:
  j .F.fermatPrimalityTest._6.if.exit.1                                 # ir inst 8 fin
.F.fermatPrimalityTest._6.if.exit.1:
  li t2, 2
  rem t6, a0, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.fermatPrimalityTest._7.if.then.2
  j .F.fermatPrimalityTest._8.if.else.2                                 # ir inst 11 fin
.F.fermatPrimalityTest._7.if.then.2:
  li a0, 0
  j .F.fermatPrimalityTest.epilogue                                     # ir inst 12 fin
.F.fermatPrimalityTest._8.if.else.2:
  j .F.fermatPrimalityTest._9.if.exit.2                                 # ir inst 13 fin
.F.fermatPrimalityTest._9.if.exit.2:
# Phi connections
  mv t5, a0
  li t6, 0
  j .F.fermatPrimalityTest._10.while.cond.0                             # ir inst 14 fin
.F.fermatPrimalityTest._10.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 17 fin
  bnez t4, .F.fermatPrimalityTest._11.while.body.0
  j .F.fermatPrimalityTest._15.while.exit.0                             # ir inst 18 fin
.F.fermatPrimalityTest._11.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t5
  call .F.updateSeed
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 19 fin
  addi t5, a0, -3                                                       # ir inst 20 fin
  rem t3, t4, t5                                                        # ir inst 21 fin
  addi t5, t3, 2                                                        # ir inst 22 fin
  addi t3, a0, -1                                                       # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, a0
  mv a1, t3
  mv a0, t5
  call .F.modularPower
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 24 fin
  li t2, 1
  xor t0, s11, t2
  sltu t5, zero, t0                                                     # ir inst 25 fin
  bnez t5, .F.fermatPrimalityTest._12.if.then.3
  j .F.fermatPrimalityTest._13.if.else.3                                # ir inst 26 fin
.F.fermatPrimalityTest._12.if.then.3:
  li a0, 0
  j .F.fermatPrimalityTest.epilogue                                     # ir inst 27 fin
.F.fermatPrimalityTest._13.if.else.3:
  j .F.fermatPrimalityTest._14.if.exit.3                                # ir inst 28 fin
.F.fermatPrimalityTest._14.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.fermatPrimalityTest._10.while.cond.0                             # ir inst 30 fin
.F.fermatPrimalityTest._15.while.exit.0:
  li a0, 1
  j .F.fermatPrimalityTest.epilogue                                     # ir inst 31 fin
.F.fermatPrimalityTest.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.performHashOperations
.F.performHashOperations:
# spill func args num: 0,             range:     2032(sp) -     2032(sp)
# local var size: 2000,               range:       32(sp) -     2032(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -2032
  sd ra, 24(sp)
.F.performHashOperations._0.entry.0:
  addi t1, sp, 1632
  addi t6, t1, 0                                                        # ir inst 6 fin
# Phi connections
  li t5, 0
  j .F.performHashOperations._1.array.cond.0                            # ir inst 7 fin
.F.performHashOperations._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, .F.performHashOperations._2.array.body.0
  j .F.performHashOperations._3.array.exit.0                            # ir inst 10 fin
.F.performHashOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j .F.performHashOperations._1.array.cond.0                            # ir inst 14 fin
.F.performHashOperations._3.array.exit.0:
# Start call preparation
  li a1, 100
  addi t1, sp, 1632
  mv a0, t1
  call .F.initializeHashInput
# ir inst 15 fin
# Start call preparation
  li a2, 400
  addi t1, sp, 1632
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call memcpy
# ir inst 16 fin
# Start call preparation
  li a1, 100
  addi t1, sp, 32
  mv a0, t1
  call .F.djb2Hash
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 400
  addi t1, sp, 1632
  mv a1, t1
  addi t1, sp, 432
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 100
  addi t1, sp, 432
  mv a0, t1
  call .F.sdbmHash
  mv t5, a0
  ld t6, 0(sp)
# ir inst 19 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a2, 400
  addi t1, sp, 1632
  mv a1, t1
  addi t1, sp, 832
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 20 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 100
  addi t1, sp, 832
  mv a0, t1
  call .F.fnvHash
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 21 fin
  add t3, t6, t5                                                        # ir inst 22 fin
  add t6, t3, t4                                                        # ir inst 23 fin
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 24 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 400
  addi t1, sp, 1632
  mv a1, t1
  addi t1, sp, 1232
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
# ir inst 25 fin
# Start call preparation
  sd t5, 0(sp)
  li a1, 100
  addi t1, sp, 1232
  mv a0, t1
  call .F.testHashDistribution
  mv t6, a0
  ld t5, 0(sp)
# ir inst 26 fin
  add t4, t5, t6                                                        # ir inst 27 fin
  li t2, 10000
  rem t6, t4, t2                                                        # ir inst 28 fin
  mv a0, t6
  j .F.performHashOperations.epilogue                                   # ir inst 29 fin
.F.performHashOperations.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 2032
  ret

.globl .F.updateSeed
.F.updateSeed:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.updateSeed._0.entry.0:
  li t2, 1103
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 4721
  add t5, t6, t2                                                        # ir inst 2 fin
  li t2, 1048583
  rem t6, t5, t2                                                        # ir inst 3 fin
  li t2, 0
  slt t5, t6, t2                                                        # ir inst 4 fin
  bnez t5, .F.updateSeed._1.if.then.0
  j .F.updateSeed._2.if.else.0                                          # ir inst 5 fin
.F.updateSeed._1.if.then.0:
  li t1, 0
  sub t5, t1, t6                                                        # ir inst 6 fin
# Phi connections
  mv t6, t5
  j .F.updateSeed._3.if.exit.0                                          # ir inst 7 fin
.F.updateSeed._2.if.else.0:
# Phi connections
  j .F.updateSeed._3.if.exit.0                                          # ir inst 8 fin
.F.updateSeed._3.if.exit.0:
  mv a0, t6
  j .F.updateSeed.epilogue                                              # ir inst 10 fin
.F.updateSeed.epilogue:
  ret

.globl .F.initializeHashInput
.F.initializeHashInput:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.initializeHashInput._0.entry.0:
# Phi connections
  li t5, 42
  li t6, 0
  j .F.initializeHashInput._1.while.cond.0                              # ir inst 1 fin
.F.initializeHashInput._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.initializeHashInput._2.while.body.0
  j .F.initializeHashInput._3.while.exit.0                              # ir inst 5 fin
.F.initializeHashInput._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t5
  call .F.updateSeed
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 6 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 7 fin
  li t2, 256
  rem t3, t4, t2                                                        # ir inst 8 fin
  sw t3, 0(t5)                                                          # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.initializeHashInput._1.while.cond.0                              # ir inst 11 fin
.F.initializeHashInput._3.while.exit.0:
  j .F.initializeHashInput.epilogue                                     # ir inst 12 fin
.F.initializeHashInput.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.djb2Hash
.F.djb2Hash:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.djb2Hash._0.entry.0:
# Phi connections
  li t5, 5381
  li t6, 0
  j .F.djb2Hash._1.while.cond.0                                         # ir inst 1 fin
.F.djb2Hash._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.djb2Hash._2.while.body.0
  j .F.djb2Hash._3.while.exit.0                                         # ir inst 5 fin
.F.djb2Hash._2.while.body.0:
  slli t4, t5, 5                                                        # ir inst 6 fin
  li t2, 65536
  rem t3, t4, t2                                                        # ir inst 7 fin
  add t4, t3, t5                                                        # ir inst 8 fin
  li t2, 65536
  rem t3, t4, t2                                                        # ir inst 9 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 10 fin
  lw s11, 0(t4)                                                         # ir inst 11 fin
  add t4, t3, s11                                                       # ir inst 12 fin
  addi t3, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.djb2Hash._1.while.cond.0                                         # ir inst 14 fin
.F.djb2Hash._3.while.exit.0:
  li t2, 65536
  rem t6, t5, t2                                                        # ir inst 15 fin
  mv a0, t6
  j .F.djb2Hash.epilogue                                                # ir inst 16 fin
.F.djb2Hash.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.sdbmHash
.F.sdbmHash:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.sdbmHash._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.sdbmHash._1.while.cond.0                                         # ir inst 1 fin
.F.sdbmHash._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.sdbmHash._2.while.body.0
  j .F.sdbmHash._3.while.exit.0                                         # ir inst 5 fin
.F.sdbmHash._2.while.body.0:
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  lw t3, 0(t4)                                                          # ir inst 7 fin
  slli t4, t5, 6                                                        # ir inst 8 fin
  li t2, 65536
  rem s11, t4, t2                                                       # ir inst 9 fin
  add t4, t3, s11                                                       # ir inst 10 fin
  slli t3, t5, 16                                                       # ir inst 11 fin
  li t2, 65536
  rem s11, t3, t2                                                       # ir inst 12 fin
  add t3, t4, s11                                                       # ir inst 13 fin
  sub t4, t3, t5                                                        # ir inst 14 fin
  addi t3, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.sdbmHash._1.while.cond.0                                         # ir inst 16 fin
.F.sdbmHash._3.while.exit.0:
  li t2, 65536
  rem t6, t5, t2                                                        # ir inst 17 fin
  mv a0, t6
  j .F.sdbmHash.epilogue                                                # ir inst 18 fin
.F.sdbmHash.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.fnvHash
.F.fnvHash:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.fnvHash._0.entry.0:
# Phi connections
  li t5, 2166136261
  li t6, 0
  j .F.fnvHash._1.while.cond.0                                          # ir inst 1 fin
.F.fnvHash._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.fnvHash._2.while.body.0
  j .F.fnvHash._3.while.exit.0                                          # ir inst 5 fin
.F.fnvHash._2.while.body.0:
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  lw t3, 0(t4)                                                          # ir inst 7 fin
  xor t4, t5, t3                                                        # ir inst 8 fin
  li t2, 65536
  remu t3, t4, t2                                                       # ir inst 9 fin
  li t2, 403
  mul t4, t3, t2                                                        # ir inst 10 fin
  li t2, 65536
  remu t3, t4, t2                                                       # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.fnvHash._1.while.cond.0                                          # ir inst 13 fin
.F.fnvHash._3.while.exit.0:
  li t2, 65536
  rem t6, t5, t2                                                        # ir inst 14 fin
  mv a0, t6
  j .F.fnvHash.epilogue                                                 # ir inst 15 fin
.F.fnvHash.epilogue:
  ret

.globl .F.testHashDistribution
.F.testHashDistribution:
# spill func args num: 0,             range:      864(sp) -      864(sp)
# local var size: 800,                range:       64(sp) -      864(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -864
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.testHashDistribution._0.entry.0:
  addi t1, sp, 464
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testHashDistribution._1.array.cond.0                             # ir inst 4 fin
.F.testHashDistribution._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testHashDistribution._2.array.body.0
  j .F.testHashDistribution._3.array.exit.0                             # ir inst 7 fin
.F.testHashDistribution._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testHashDistribution._1.array.cond.0                             # ir inst 11 fin
.F.testHashDistribution._3.array.exit.0:
# Phi connections
  li t5, 1
  li t6, 0
  j .F.testHashDistribution._4.while.cond.0                             # ir inst 12 fin
.F.testHashDistribution._4.while.cond.0:
  li t2, 10
  sltu t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 15 fin
  bnez t4, .F.testHashDistribution._5.while.body.0
  j .F.testHashDistribution._9.while.exit.0                             # ir inst 16 fin
.F.testHashDistribution._5.while.body.0:
# Phi connections
  li t4, 0
  j .F.testHashDistribution._6.while.cond.1                             # ir inst 17 fin
.F.testHashDistribution._6.while.cond.1:
  sltu t3, t4, a1                                                       # ir inst 19 fin
  bnez t3, .F.testHashDistribution._7.while.body.1
  j .F.testHashDistribution._8.while.exit.1                             # ir inst 20 fin
.F.testHashDistribution._7.while.body.1:
  slli t2, t4, 2
  addi t1, sp, 464
  add t3, t1, t2                                                        # ir inst 21 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 22 fin
  lw s10, 0(s11)                                                        # ir inst 23 fin
  sw s10, 0(t3)                                                         # ir inst 24 fin
  addi t3, t4, 1                                                        # ir inst 25 fin
# Phi connections
  mv t4, t3
  j .F.testHashDistribution._6.while.cond.1                             # ir inst 26 fin
.F.testHashDistribution._8.while.exit.1:
  li t2, 7
  mul t4, t5, t2                                                        # ir inst 27 fin
  remu t3, t4, a1                                                       # ir inst 28 fin
  slli t2, t3, 2
  addi t1, sp, 464
  add t4, t1, t2                                                        # ir inst 29 fin
  lw t3, 0(t4)                                                          # ir inst 30 fin
  mv s11, t5                                                            # ir inst 31 fin
  add s10, t3, s11                                                      # ir inst 32 fin
  sw s10, 0(t4)                                                         # ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  addi t1, sp, 464
  mv a1, t1
  addi t1, sp, 64
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 64
  mv a0, t1
  call .F.djb2Hash
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 35 fin
  add t3, t6, t4                                                        # ir inst 36 fin
  li t2, 10000
  rem t4, t3, t2                                                        # ir inst 37 fin
  addi t3, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.testHashDistribution._4.while.cond.0                             # ir inst 39 fin
.F.testHashDistribution._9.while.exit.0:
  mv a0, t6
  j .F.testHashDistribution.epilogue                                    # ir inst 40 fin
.F.testHashDistribution.epilogue:
  ld ra, 56(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  addi sp, sp, 864
  ret
