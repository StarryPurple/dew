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
  li a0, 1400
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testDeepRecursiveAlgorithms
# ir inst 2 fin
# Start call preparation
  call .F.testMutualRecursion
# ir inst 3 fin
# Start call preparation
  call .F.testTreeTraversalAlgorithms
# ir inst 4 fin
# Start call preparation
  call .F.testDivideAndConquerAlgorithms
# ir inst 5 fin
# Start call preparation
  call .F.testRecursiveMathematicalComputations
# ir inst 6 fin
# Start call preparation
  li a0, 1499
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

.globl .F.testDeepRecursiveAlgorithms
.F.testDeepRecursiveAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testDeepRecursiveAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1401
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a1, 1
  li a0, 12
  call .F.tailRecursiveFactorial
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a1, 0
  li a0, 1000
  call .F.deepRecursiveSum
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
  call .F.recursiveCountdown
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a1, 20
  li a0, 2
  call .F.recursivePower
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 1402
  call printlnInt
# ir inst 10 fin
  j .F.testDeepRecursiveAlgorithms.epilogue                             # ir inst 11 fin
.F.testDeepRecursiveAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.tailRecursiveFactorial
.F.tailRecursiveFactorial:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.tailRecursiveFactorial._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.tailRecursiveFactorial._1.if.then.0
  j .F.tailRecursiveFactorial._2.if.else.0                              # ir inst 2 fin
.F.tailRecursiveFactorial._1.if.then.0:
  mv a0, a1
  j .F.tailRecursiveFactorial.epilogue                                  # ir inst 3 fin
.F.tailRecursiveFactorial._2.if.else.0:
  j .F.tailRecursiveFactorial._3.if.exit.0                              # ir inst 4 fin
.F.tailRecursiveFactorial._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
  mul t5, a1, a0                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.tailRecursiveFactorial
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  mv a0, t4
  j .F.tailRecursiveFactorial.epilogue                                  # ir inst 8 fin
.F.tailRecursiveFactorial.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.deepRecursiveSum
.F.deepRecursiveSum:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.deepRecursiveSum._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.deepRecursiveSum._1.if.then.0
  j .F.deepRecursiveSum._2.if.else.0                                    # ir inst 2 fin
.F.deepRecursiveSum._1.if.then.0:
  mv a0, a1
  j .F.deepRecursiveSum.epilogue                                        # ir inst 3 fin
.F.deepRecursiveSum._2.if.else.0:
  j .F.deepRecursiveSum._3.if.exit.0                                    # ir inst 4 fin
.F.deepRecursiveSum._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
  add t5, a1, a0                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.deepRecursiveSum
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  mv a0, t4
  j .F.deepRecursiveSum.epilogue                                        # ir inst 8 fin
.F.deepRecursiveSum.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.recursiveCountdown
.F.recursiveCountdown:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.recursiveCountdown._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.recursiveCountdown._1.if.then.0
  j .F.recursiveCountdown._2.if.else.0                                  # ir inst 2 fin
.F.recursiveCountdown._1.if.then.0:
  li a0, 0
  j .F.recursiveCountdown.epilogue                                      # ir inst 3 fin
.F.recursiveCountdown._2.if.else.0:
  j .F.recursiveCountdown._3.if.exit.0                                  # ir inst 4 fin
.F.recursiveCountdown._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.recursiveCountdown
  mv t5, a0
  ld t6, 0(sp)
# ir inst 6 fin
  addi t6, t5, 1                                                        # ir inst 7 fin
  mv a0, t6
  j .F.recursiveCountdown.epilogue                                      # ir inst 8 fin
.F.recursiveCountdown.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.recursivePower
.F.recursivePower:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.recursivePower._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.recursivePower._1.if.then.0
  j .F.recursivePower._2.if.else.0                                      # ir inst 2 fin
.F.recursivePower._1.if.then.0:
  li a0, 1
  j .F.recursivePower.epilogue                                          # ir inst 3 fin
.F.recursivePower._2.if.else.0:
  j .F.recursivePower._3.if.exit.0                                      # ir inst 4 fin
.F.recursivePower._3.if.exit.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.recursivePower._4.if.then.1
  j .F.recursivePower._5.if.else.1                                      # ir inst 6 fin
.F.recursivePower._4.if.then.1:
  j .F.recursivePower.epilogue                                          # ir inst 7 fin
.F.recursivePower._5.if.else.1:
  j .F.recursivePower._6.if.exit.1                                      # ir inst 8 fin
.F.recursivePower._6.if.exit.1:
  li t2, 2
  rem t6, a1, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.recursivePower._7.if.then.2
  j .F.recursivePower._8.if.else.2                                      # ir inst 11 fin
.F.recursivePower._7.if.then.2:
  li t2, 2
  div t6, a1, t2                                                        # ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  call .F.recursivePower
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 13 fin
  mul t6, t5, t5                                                        # ir inst 14 fin
  mv a0, t6
  j .F.recursivePower.epilogue                                          # ir inst 15 fin
.F.recursivePower._8.if.else.2:
  addi t6, a1, -1                                                       # ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F.recursivePower
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 17 fin
  mul t6, a0, t5                                                        # ir inst 18 fin
  mv a0, t6
  j .F.recursivePower.epilogue                                          # ir inst 19 fin
.F.recursivePower._9.if.exit.2:
.F.recursivePower.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.testMutualRecursion
.F.testMutualRecursion:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testMutualRecursion._0.entry.0:
# Start call preparation
  li a0, 1403
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 100
  call .F.countEvenOddMutual
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a1, 1
  li a0, 50
  call .F.pingPongMutual
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  li a1, 0
  li a0, 75
  call .F.stateMachineA
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 1404
  call printlnInt
# ir inst 8 fin
  j .F.testMutualRecursion.epilogue                                     # ir inst 9 fin
.F.testMutualRecursion.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.isEvenMutual
.F.isEvenMutual:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.isEvenMutual._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.isEvenMutual._1.if.then.0
  j .F.isEvenMutual._2.if.else.0                                        # ir inst 2 fin
.F.isEvenMutual._1.if.then.0:
  li a0, 1
  j .F.isEvenMutual.epilogue                                            # ir inst 3 fin
.F.isEvenMutual._2.if.else.0:
  j .F.isEvenMutual._3.if.exit.0                                        # ir inst 4 fin
.F.isEvenMutual._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.isOddMutual
  mv t5, a0
  ld t6, 0(sp)
# ir inst 6 fin
  mv a0, t5
  j .F.isEvenMutual.epilogue                                            # ir inst 7 fin
.F.isEvenMutual.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.isOddMutual
.F.isOddMutual:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.isOddMutual._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.isOddMutual._1.if.then.0
  j .F.isOddMutual._2.if.else.0                                         # ir inst 2 fin
.F.isOddMutual._1.if.then.0:
  li a0, 0
  j .F.isOddMutual.epilogue                                             # ir inst 3 fin
.F.isOddMutual._2.if.else.0:
  j .F.isOddMutual._3.if.exit.0                                         # ir inst 4 fin
.F.isOddMutual._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.isEvenMutual
  mv t5, a0
  ld t6, 0(sp)
# ir inst 6 fin
  mv a0, t5
  j .F.isOddMutual.epilogue                                             # ir inst 7 fin
.F.isOddMutual.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.countEvenOddMutual
.F.countEvenOddMutual:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.countEvenOddMutual._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.countEvenOddMutual._1.while.cond.0                               # ir inst 1 fin
.F.countEvenOddMutual._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.countEvenOddMutual._2.while.body.0
  j .F.countEvenOddMutual._6.while.exit.0                               # ir inst 5 fin
.F.countEvenOddMutual._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.isEvenMutual
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.countEvenOddMutual._3.if.then.0
  j .F.countEvenOddMutual._4.if.else.0                                  # ir inst 8 fin
.F.countEvenOddMutual._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.countEvenOddMutual._5.if.exit.0                                  # ir inst 10 fin
.F.countEvenOddMutual._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.countEvenOddMutual._5.if.exit.0                                  # ir inst 11 fin
.F.countEvenOddMutual._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.countEvenOddMutual._1.while.cond.0                               # ir inst 14 fin
.F.countEvenOddMutual._6.while.exit.0:
  mv a0, t5
  j .F.countEvenOddMutual.epilogue                                      # ir inst 15 fin
.F.countEvenOddMutual.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.pingMutual
.F.pingMutual:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.pingMutual._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.pingMutual._1.if.then.0
  j .F.pingMutual._2.if.else.0                                          # ir inst 2 fin
.F.pingMutual._1.if.then.0:
  mv a0, a1
  j .F.pingMutual.epilogue                                              # ir inst 3 fin
.F.pingMutual._2.if.else.0:
  j .F.pingMutual._3.if.exit.0                                          # ir inst 4 fin
.F.pingMutual._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
  addi t5, a1, 1                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.pongMutual
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  mv a0, t4
  j .F.pingMutual.epilogue                                              # ir inst 8 fin
.F.pingMutual.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.pongMutual
.F.pongMutual:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.pongMutual._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.pongMutual._1.if.then.0
  j .F.pongMutual._2.if.else.0                                          # ir inst 2 fin
.F.pongMutual._1.if.then.0:
  mv a0, a1
  j .F.pongMutual.epilogue                                              # ir inst 3 fin
.F.pongMutual._2.if.else.0:
  j .F.pongMutual._3.if.exit.0                                          # ir inst 4 fin
.F.pongMutual._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
  addi t5, a1, 2                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.pingMutual
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  mv a0, t4
  j .F.pongMutual.epilogue                                              # ir inst 8 fin
.F.pongMutual.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.pingPongMutual
.F.pingPongMutual:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.pingPongMutual._0.entry.0:
  bnez a1, .F.pingPongMutual._1.if.then.0
  j .F.pingPongMutual._2.if.else.0                                      # ir inst 1 fin
.F.pingPongMutual._1.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  li a1, 0
  call .F.pingMutual
  mv t6, a0
  ld a0, 0(sp)
# ir inst 2 fin
  mv a0, t6
  j .F.pingPongMutual.epilogue                                          # ir inst 3 fin
.F.pingPongMutual._2.if.else.0:
# Start call preparation
  sd a0, 0(sp)
  li a1, 0
  call .F.pongMutual
  mv t6, a0
  ld a0, 0(sp)
# ir inst 4 fin
  mv a0, t6
  j .F.pingPongMutual.epilogue                                          # ir inst 5 fin
.F.pingPongMutual._3.if.exit.0:
.F.pingPongMutual.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.stateMachineA
.F.stateMachineA:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.stateMachineA._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.stateMachineA._1.if.then.0
  j .F.stateMachineA._2.if.else.0                                       # ir inst 2 fin
.F.stateMachineA._1.if.then.0:
  mv a0, a1
  j .F.stateMachineA.epilogue                                           # ir inst 3 fin
.F.stateMachineA._2.if.else.0:
  j .F.stateMachineA._3.if.exit.0                                       # ir inst 4 fin
.F.stateMachineA._3.if.exit.0:
  li t2, 3
  rem t6, a0, t2                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.stateMachineA._4.if.then.1
  j .F.stateMachineA._5.if.else.1                                       # ir inst 7 fin
.F.stateMachineA._4.if.then.1:
  addi t6, a0, -1                                                       # ir inst 8 fin
  addi t5, a1, 10                                                       # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  mv a0, t6
  call .F.stateMachineB
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
  mv a0, t4
  j .F.stateMachineA.epilogue                                           # ir inst 11 fin
.F.stateMachineA._5.if.else.1:
  addi t6, a0, -1                                                       # ir inst 12 fin
  addi t5, a1, 1                                                        # ir inst 13 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.stateMachineC
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 14 fin
  mv a0, t4
  j .F.stateMachineA.epilogue                                           # ir inst 15 fin
.F.stateMachineA._6.if.exit.1:
.F.stateMachineA.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.stateMachineB
.F.stateMachineB:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.stateMachineB._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.stateMachineB._1.if.then.0
  j .F.stateMachineB._2.if.else.0                                       # ir inst 2 fin
.F.stateMachineB._1.if.then.0:
  mv a0, a1
  j .F.stateMachineB.epilogue                                           # ir inst 3 fin
.F.stateMachineB._2.if.else.0:
  j .F.stateMachineB._3.if.exit.0                                       # ir inst 4 fin
.F.stateMachineB._3.if.exit.0:
  li t2, 2
  rem t6, a0, t2                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.stateMachineB._4.if.then.1
  j .F.stateMachineB._5.if.else.1                                       # ir inst 7 fin
.F.stateMachineB._4.if.then.1:
  addi t6, a0, -1                                                       # ir inst 8 fin
  addi t5, a1, 5                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  mv a0, t6
  call .F.stateMachineC
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
  mv a0, t4
  j .F.stateMachineB.epilogue                                           # ir inst 11 fin
.F.stateMachineB._5.if.else.1:
  addi t6, a0, -1                                                       # ir inst 12 fin
  addi t5, a1, 2                                                        # ir inst 13 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.stateMachineA
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 14 fin
  mv a0, t4
  j .F.stateMachineB.epilogue                                           # ir inst 15 fin
.F.stateMachineB._6.if.exit.1:
.F.stateMachineB.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.stateMachineC
.F.stateMachineC:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.stateMachineC._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.stateMachineC._1.if.then.0
  j .F.stateMachineC._2.if.else.0                                       # ir inst 2 fin
.F.stateMachineC._1.if.then.0:
  mv a0, a1
  j .F.stateMachineC.epilogue                                           # ir inst 3 fin
.F.stateMachineC._2.if.else.0:
  j .F.stateMachineC._3.if.exit.0                                       # ir inst 4 fin
.F.stateMachineC._3.if.exit.0:
  li t2, 5
  rem t6, a0, t2                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.stateMachineC._4.if.then.1
  j .F.stateMachineC._5.if.else.1                                       # ir inst 7 fin
.F.stateMachineC._4.if.then.1:
  addi t6, a0, -1                                                       # ir inst 8 fin
  addi t5, a1, 20                                                       # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  mv a0, t6
  call .F.stateMachineA
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
  mv a0, t4
  j .F.stateMachineC.epilogue                                           # ir inst 11 fin
.F.stateMachineC._5.if.else.1:
  addi t6, a0, -1                                                       # ir inst 12 fin
  addi t5, a1, 3                                                        # ir inst 13 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.stateMachineB
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 14 fin
  mv a0, t4
  j .F.stateMachineC.epilogue                                           # ir inst 15 fin
.F.stateMachineC._6.if.exit.1:
.F.stateMachineC.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.testTreeTraversalAlgorithms
.F.testTreeTraversalAlgorithms:
# spill func args num: 0,             range:     3584(sp) -     3584(sp)
# local var size: 3556,               range:       16(sp) -     3572(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3584
  add sp, sp, t0
  sd ra, 8(sp)
.F.testTreeTraversalAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1405
  call printlnInt
# ir inst 7 fin
  li t1, 3064
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 9 fin
# Phi connections
  li t5, 0
  j .F.testTreeTraversalAlgorithms._1.array.cond.0                      # ir inst 10 fin
.F.testTreeTraversalAlgorithms._1.array.cond.0:
  li t2, 127
  slt t4, t5, t2                                                        # ir inst 12 fin
  bnez t4, .F.testTreeTraversalAlgorithms._2.array.body.0
  j .F.testTreeTraversalAlgorithms._3.array.exit.0                      # ir inst 13 fin
.F.testTreeTraversalAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 15 fin
  addi t4, t5, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.testTreeTraversalAlgorithms._1.array.cond.0                      # ir inst 17 fin
.F.testTreeTraversalAlgorithms._3.array.exit.0:
# Start call preparation
  li a2, 508
  li t1, 3064
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 18 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.buildBinaryTree
# ir inst 19 fin
# Start call preparation
  li a2, 508
  li t1, 3064
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 524
  mv a0, t1
  call memcpy
# ir inst 20 fin
# Start call preparation
  li a1, 0
  addi t1, sp, 524
  mv a0, t1
  call .F.preorderTraversal
  mv t6, a0
# ir inst 21 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 22 fin
# Start call preparation
  li a2, 508
  li t1, 3064
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1032
  mv a0, t1
  call memcpy
# ir inst 23 fin
# Start call preparation
  li a1, 0
  addi t1, sp, 1032
  mv a0, t1
  call .F.inorderTraversal
  mv t6, a0
# ir inst 24 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 25 fin
# Start call preparation
  li a2, 508
  li t1, 3064
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1540
  mv a0, t1
  call memcpy
# ir inst 26 fin
# Start call preparation
  li a1, 0
  addi t1, sp, 1540
  mv a0, t1
  call .F.postorderTraversal
  mv t6, a0
# ir inst 27 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 28 fin
# Start call preparation
  li a2, 508
  li t1, 3064
  add t1, sp, t1
  mv a1, t1
  li t1, 2048
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 29 fin
# Start call preparation
  li a2, 50
  li a1, 0
  li t1, 2048
  add t1, sp, t1
  mv a0, t1
  call .F.recursiveTreeSearch
  mv t6, a0
# ir inst 30 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 31 fin
# Start call preparation
  li a2, 508
  li t1, 3064
  add t1, sp, t1
  mv a1, t1
  li t1, 2556
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 32 fin
# Start call preparation
  li a1, 0
  li t1, 2556
  add t1, sp, t1
  mv a0, t1
  call .F.calculateTreeDepth
  mv t6, a0
# ir inst 33 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 34 fin
# Start call preparation
  li a0, 1406
  call printlnInt
# ir inst 35 fin
  j .F.testTreeTraversalAlgorithms.epilogue                             # ir inst 36 fin
.F.testTreeTraversalAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 3584
  add sp, sp, t0
  ret

.globl .F.buildBinaryTree
.F.buildBinaryTree:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.buildBinaryTree._0.entry.0:
# Phi connections
  li t6, 0
  j .F.buildBinaryTree._1.while.cond.0                                  # ir inst 1 fin
.F.buildBinaryTree._1.while.cond.0:
  li t2, 127
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.buildBinaryTree._2.while.body.0
  j .F.buildBinaryTree._3.while.exit.0                                  # ir inst 4 fin
.F.buildBinaryTree._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  addi t5, t6, 1                                                        # ir inst 7 fin
  li t2, 10
  mul t3, t5, t2                                                        # ir inst 8 fin
  sw t3, 0(t4)                                                          # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.buildBinaryTree._1.while.cond.0                                  # ir inst 11 fin
.F.buildBinaryTree._3.while.exit.0:
  j .F.buildBinaryTree.epilogue                                         # ir inst 12 fin
.F.buildBinaryTree.epilogue:
  ret

.globl .F.preorderTraversal
.F.preorderTraversal:
# spill func args num: 0,             range:     1072(sp) -     1072(sp)
# local var size: 1016,               range:       48(sp) -     1064(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1072
  sd ra, 40(sp)
.F.preorderTraversal._0.entry.0:
  li t2, 127
  sltu t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.preorderTraversal._1.lazy.then.0
  j .F.preorderTraversal._2.lazy.else.0                                 # ir inst 4 fin
.F.preorderTraversal._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.preorderTraversal._3.lazy.exit.0                                 # ir inst 5 fin
.F.preorderTraversal._2.lazy.else.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
# Phi connections
  j .F.preorderTraversal._3.lazy.exit.0                                 # ir inst 9 fin
.F.preorderTraversal._3.lazy.exit.0:
  bnez t6, .F.preorderTraversal._4.if.then.0
  j .F.preorderTraversal._5.if.else.0                                   # ir inst 11 fin
.F.preorderTraversal._4.if.then.0:
  li a0, 0
  j .F.preorderTraversal.epilogue                                       # ir inst 12 fin
.F.preorderTraversal._5.if.else.0:
  j .F.preorderTraversal._6.if.exit.0                                   # ir inst 13 fin
.F.preorderTraversal._6.if.exit.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
  slli t6, a1, 1                                                        # ir inst 16 fin
  addi t4, t6, 1                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 48
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
# ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  mv a1, t4
  addi t1, sp, 48
  mv a0, t1
  call .F.preorderTraversal
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
# ir inst 19 fin
  slli t4, a1, 1                                                        # ir inst 20 fin
  addi t3, t4, 2                                                        # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 556
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 22 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  addi t1, sp, 556
  mv a0, t1
  call .F.preorderTraversal
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 23 fin
  add t3, t5, t6                                                        # ir inst 24 fin
  add t6, t3, t4                                                        # ir inst 25 fin
  mv a0, t6
  j .F.preorderTraversal.epilogue                                       # ir inst 26 fin
.F.preorderTraversal.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 1072
  ret

.globl .F.inorderTraversal
.F.inorderTraversal:
# spill func args num: 0,             range:     1056(sp) -     1056(sp)
# local var size: 1016,               range:       40(sp) -     1056(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1056
  sd ra, 32(sp)
.F.inorderTraversal._0.entry.0:
  li t2, 127
  sltu t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.inorderTraversal._1.lazy.then.0
  j .F.inorderTraversal._2.lazy.else.0                                  # ir inst 4 fin
.F.inorderTraversal._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.inorderTraversal._3.lazy.exit.0                                  # ir inst 5 fin
.F.inorderTraversal._2.lazy.else.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
# Phi connections
  j .F.inorderTraversal._3.lazy.exit.0                                  # ir inst 9 fin
.F.inorderTraversal._3.lazy.exit.0:
  bnez t6, .F.inorderTraversal._4.if.then.0
  j .F.inorderTraversal._5.if.else.0                                    # ir inst 11 fin
.F.inorderTraversal._4.if.then.0:
  li a0, 0
  j .F.inorderTraversal.epilogue                                        # ir inst 12 fin
.F.inorderTraversal._5.if.else.0:
  j .F.inorderTraversal._6.if.exit.0                                    # ir inst 13 fin
.F.inorderTraversal._6.if.exit.0:
  slli t6, a1, 1                                                        # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  addi t1, sp, 40
  mv a0, t1
  call .F.inorderTraversal
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 17 fin
  slli t2, a1, 2
  add t5, a0, t2                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  slli t5, a1, 1                                                        # ir inst 20 fin
  addi t3, t5, 2                                                        # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 548
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 22 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  addi t1, sp, 548
  mv a0, t1
  call .F.inorderTraversal
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 23 fin
  add t3, t6, t4                                                        # ir inst 24 fin
  add t6, t3, t5                                                        # ir inst 25 fin
  mv a0, t6
  j .F.inorderTraversal.epilogue                                        # ir inst 26 fin
.F.inorderTraversal.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 1056
  ret

.globl .F.postorderTraversal
.F.postorderTraversal:
# spill func args num: 0,             range:     1072(sp) -     1072(sp)
# local var size: 1016,               range:       48(sp) -     1064(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1072
  sd ra, 40(sp)
.F.postorderTraversal._0.entry.0:
  li t2, 127
  sltu t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.postorderTraversal._1.lazy.then.0
  j .F.postorderTraversal._2.lazy.else.0                                # ir inst 4 fin
.F.postorderTraversal._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.postorderTraversal._3.lazy.exit.0                                # ir inst 5 fin
.F.postorderTraversal._2.lazy.else.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
# Phi connections
  j .F.postorderTraversal._3.lazy.exit.0                                # ir inst 9 fin
.F.postorderTraversal._3.lazy.exit.0:
  bnez t6, .F.postorderTraversal._4.if.then.0
  j .F.postorderTraversal._5.if.else.0                                  # ir inst 11 fin
.F.postorderTraversal._4.if.then.0:
  li a0, 0
  j .F.postorderTraversal.epilogue                                      # ir inst 12 fin
.F.postorderTraversal._5.if.else.0:
  j .F.postorderTraversal._6.if.exit.0                                  # ir inst 13 fin
.F.postorderTraversal._6.if.exit.0:
  slli t6, a1, 1                                                        # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 48
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.postorderTraversal
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 17 fin
  slli t5, a1, 1                                                        # ir inst 18 fin
  addi t4, t5, 2                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 556
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  addi t1, sp, 556
  mv a0, t1
  call .F.postorderTraversal
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 21 fin
  slli t2, a1, 2
  add t4, a0, t2                                                        # ir inst 22 fin
  lw t3, 0(t4)                                                          # ir inst 23 fin
  add t4, t6, t5                                                        # ir inst 24 fin
  add t6, t4, t3                                                        # ir inst 25 fin
  mv a0, t6
  j .F.postorderTraversal.epilogue                                      # ir inst 26 fin
.F.postorderTraversal.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 1072
  ret

.globl .F.recursiveTreeSearch
.F.recursiveTreeSearch:
# spill func args num: 0,             range:     1072(sp) -     1072(sp)
# local var size: 1016,               range:       48(sp) -     1064(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1072
  sd ra, 40(sp)
.F.recursiveTreeSearch._0.entry.0:
  li t2, 127
  sltu t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.recursiveTreeSearch._1.lazy.then.0
  j .F.recursiveTreeSearch._2.lazy.else.0                               # ir inst 4 fin
.F.recursiveTreeSearch._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.recursiveTreeSearch._3.lazy.exit.0                               # ir inst 5 fin
.F.recursiveTreeSearch._2.lazy.else.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
# Phi connections
  j .F.recursiveTreeSearch._3.lazy.exit.0                               # ir inst 9 fin
.F.recursiveTreeSearch._3.lazy.exit.0:
  bnez t6, .F.recursiveTreeSearch._4.if.then.0
  j .F.recursiveTreeSearch._5.if.else.0                                 # ir inst 11 fin
.F.recursiveTreeSearch._4.if.then.0:
  li a0, 0
  j .F.recursiveTreeSearch.epilogue                                     # ir inst 12 fin
.F.recursiveTreeSearch._5.if.else.0:
  j .F.recursiveTreeSearch._6.if.exit.0                                 # ir inst 13 fin
.F.recursiveTreeSearch._6.if.exit.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
  xor t0, t5, a2
  sltiu t6, t0, 1                                                       # ir inst 16 fin
  bnez t6, .F.recursiveTreeSearch._7.if.then.1
  j .F.recursiveTreeSearch._8.if.else.1                                 # ir inst 17 fin
.F.recursiveTreeSearch._7.if.then.1:
  li a0, 1
  j .F.recursiveTreeSearch.epilogue                                     # ir inst 18 fin
.F.recursiveTreeSearch._8.if.else.1:
  j .F.recursiveTreeSearch._9.if.exit.1                                 # ir inst 19 fin
.F.recursiveTreeSearch._9.if.exit.1:
  slli t6, a1, 1                                                        # ir inst 20 fin
  addi t5, t6, 1                                                        # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 48
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.recursiveTreeSearch
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 23 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 24 fin
  bnez t5, .F.recursiveTreeSearch._10.if.then.2
  j .F.recursiveTreeSearch._11.if.else.2                                # ir inst 25 fin
.F.recursiveTreeSearch._10.if.then.2:
  li a0, 1
  j .F.recursiveTreeSearch.epilogue                                     # ir inst 26 fin
.F.recursiveTreeSearch._11.if.else.2:
  j .F.recursiveTreeSearch._12.if.exit.2                                # ir inst 27 fin
.F.recursiveTreeSearch._12.if.exit.2:
  slli t6, a1, 1                                                        # ir inst 28 fin
  addi t5, t6, 2                                                        # ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 556
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
# ir inst 30 fin
# Start call preparation
  sd a2, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  addi t1, sp, 556
  mv a0, t1
  call .F.recursiveTreeSearch
  mv t6, a0
  ld a2, 0(sp)
  ld t5, 8(sp)
# ir inst 31 fin
  mv a0, t6
  j .F.recursiveTreeSearch.epilogue                                     # ir inst 32 fin
.F.recursiveTreeSearch.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 1072
  ret

.globl .F.calculateTreeDepth
.F.calculateTreeDepth:
# spill func args num: 0,             range:     1056(sp) -     1056(sp)
# local var size: 1016,               range:       40(sp) -     1056(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1056
  sd ra, 32(sp)
.F.calculateTreeDepth._0.entry.0:
  li t2, 127
  sltu t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.calculateTreeDepth._1.lazy.then.0
  j .F.calculateTreeDepth._2.lazy.else.0                                # ir inst 4 fin
.F.calculateTreeDepth._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.calculateTreeDepth._3.lazy.exit.0                                # ir inst 5 fin
.F.calculateTreeDepth._2.lazy.else.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
# Phi connections
  j .F.calculateTreeDepth._3.lazy.exit.0                                # ir inst 9 fin
.F.calculateTreeDepth._3.lazy.exit.0:
  bnez t6, .F.calculateTreeDepth._4.if.then.0
  j .F.calculateTreeDepth._5.if.else.0                                  # ir inst 11 fin
.F.calculateTreeDepth._4.if.then.0:
  li a0, 0
  j .F.calculateTreeDepth.epilogue                                      # ir inst 12 fin
.F.calculateTreeDepth._5.if.else.0:
  j .F.calculateTreeDepth._6.if.exit.0                                  # ir inst 13 fin
.F.calculateTreeDepth._6.if.exit.0:
  slli t6, a1, 1                                                        # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  addi t1, sp, 40
  mv a0, t1
  call .F.calculateTreeDepth
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 17 fin
  slli t5, a1, 1                                                        # ir inst 18 fin
  addi t4, t5, 2                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  li a2, 508
  mv a1, a0
  addi t1, sp, 548
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 20 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t4
  addi t1, sp, 548
  mv a0, t1
  call .F.calculateTreeDepth
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 21 fin
  slt t4, t5, t6                                                        # ir inst 22 fin
  bnez t4, .F.calculateTreeDepth._7.if.then.1
  j .F.calculateTreeDepth._8.if.else.1                                  # ir inst 23 fin
.F.calculateTreeDepth._7.if.then.1:
  addi t4, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t6, t4
  j .F.calculateTreeDepth._9.if.exit.1                                  # ir inst 25 fin
.F.calculateTreeDepth._8.if.else.1:
  addi t6, t5, 1                                                        # ir inst 26 fin
# Phi connections
  j .F.calculateTreeDepth._9.if.exit.1                                  # ir inst 27 fin
.F.calculateTreeDepth._9.if.exit.1:
  mv a0, t6
  j .F.calculateTreeDepth.epilogue                                      # ir inst 29 fin
.F.calculateTreeDepth.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 1056
  ret

.globl .F.testDivideAndConquerAlgorithms
.F.testDivideAndConquerAlgorithms:
# spill func args num: 0,             range:      816(sp) -      816(sp)
# local var size: 800,                range:       16(sp) -      816(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -816
  sd ra, 8(sp)
.F.testDivideAndConquerAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1407
  call printlnInt
# ir inst 2 fin
  addi t1, sp, 416
  addi t6, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F.testDivideAndConquerAlgorithms._1.array.cond.0                   # ir inst 5 fin
.F.testDivideAndConquerAlgorithms._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.testDivideAndConquerAlgorithms._2.array.body.0
  j .F.testDivideAndConquerAlgorithms._3.array.exit.0                   # ir inst 8 fin
.F.testDivideAndConquerAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.testDivideAndConquerAlgorithms._1.array.cond.0                   # ir inst 12 fin
.F.testDivideAndConquerAlgorithms._3.array.exit.0:
# Start call preparation
  li a2, 400
  addi t1, sp, 416
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 13 fin
# Start call preparation
  li a1, 100
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeRandomArray
# ir inst 14 fin
# Start call preparation
  li a2, 99
  li a1, 0
  addi t1, sp, 416
  mv a0, t1
  call .F.recursiveMergeSort
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a3, 42
  li a2, 99
  li a1, 0
  addi t1, sp, 416
  mv a0, t1
  call .F.recursiveBinarySearch
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a3, 50
  li a2, 99
  li a1, 0
  addi t1, sp, 416
  mv a0, t1
  call .F.recursiveQuickSelect
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  call .F.testRecursiveMatrixMultiplication
  mv t6, a0
# ir inst 21 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 22 fin
# Start call preparation
  li a0, 1408
  call printlnInt
# ir inst 23 fin
  j .F.testDivideAndConquerAlgorithms.epilogue                          # ir inst 24 fin
.F.testDivideAndConquerAlgorithms.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 816
  ret

.globl .F.initializeRandomArray
.F.initializeRandomArray:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeRandomArray._0.entry.0:
# Phi connections
  li t5, 12345
  li t6, 0
  j .F.initializeRandomArray._1.while.cond.0                            # ir inst 1 fin
.F.initializeRandomArray._1.while.cond.0:
  sltu t4, t6, a1                                                       # ir inst 4 fin
  bnez t4, .F.initializeRandomArray._2.while.body.0
  j .F.initializeRandomArray._6.while.exit.0                            # ir inst 5 fin
.F.initializeRandomArray._2.while.body.0:
  li t2, 1103
  mul t4, t5, t2                                                        # ir inst 6 fin
  li t2, 4721
  add t5, t4, t2                                                        # ir inst 7 fin
  li t2, 1048583
  rem t4, t5, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 9 fin
  bnez t5, .F.initializeRandomArray._3.if.then.0
  j .F.initializeRandomArray._4.if.else.0                               # ir inst 10 fin
.F.initializeRandomArray._3.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 11 fin
# Phi connections
  j .F.initializeRandomArray._5.if.exit.0                               # ir inst 12 fin
.F.initializeRandomArray._4.if.else.0:
# Phi connections
  mv t5, t4
  j .F.initializeRandomArray._5.if.exit.0                               # ir inst 13 fin
.F.initializeRandomArray._5.if.exit.0:
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  li t2, 1000
  rem t3, t5, t2                                                        # ir inst 16 fin
  sw t3, 0(t4)                                                          # ir inst 17 fin
  addi t4, t6, 1                                                        # ir inst 18 fin
# Phi connections
  mv t6, t4
  j .F.initializeRandomArray._1.while.cond.0                            # ir inst 19 fin
.F.initializeRandomArray._6.while.exit.0:
  j .F.initializeRandomArray.epilogue                                   # ir inst 20 fin
.F.initializeRandomArray.epilogue:
  ret

.globl .F.recursiveMergeSort
.F.recursiveMergeSort:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.recursiveMergeSort._0.entry.0:
  sltu t0, a1, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.recursiveMergeSort._1.if.then.0
  j .F.recursiveMergeSort._2.if.else.0                                  # ir inst 2 fin
.F.recursiveMergeSort._1.if.then.0:
  li a0, 0
  j .F.recursiveMergeSort.epilogue                                      # ir inst 3 fin
.F.recursiveMergeSort._2.if.else.0:
  j .F.recursiveMergeSort._3.if.exit.0                                  # ir inst 4 fin
.F.recursiveMergeSort._3.if.exit.0:
  sub t6, a2, a1                                                        # ir inst 5 fin
  li t2, 2
  divu t5, t6, t2                                                       # ir inst 6 fin
  add t6, a1, t5                                                        # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  call .F.recursiveMergeSort
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t4
  call .F.recursiveMergeSort
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, a2
  mv a2, t6
  call .F.recursiveMerge
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 11 fin
  add t6, t5, t3                                                        # ir inst 12 fin
  add t5, t6, t4                                                        # ir inst 13 fin
  mv a0, t5
  j .F.recursiveMergeSort.epilogue                                      # ir inst 14 fin
.F.recursiveMergeSort.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.recursiveMerge
.F.recursiveMerge:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       48(sp) -      448(sp)
# return addr size: 0,                range:       48(sp) -       48(sp)
# callee save reg num: 6 / 12,        range:        0(sp) -       48(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd s6, 0(sp)
  sd s8, 8(sp)
  sd s7, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s11, 40(sp)
.F.recursiveMerge._0.entry.0:
  sub t6, a2, a1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  sub t6, a3, a2                                                        # ir inst 3 fin
  addi t1, sp, 48
  addi t4, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t3, 0
  j .F.recursiveMerge._1.array.cond.0                                   # ir inst 6 fin
.F.recursiveMerge._1.array.cond.0:
  li t2, 50
  slt s11, t3, t2                                                       # ir inst 8 fin
  bnez s11, .F.recursiveMerge._2.array.body.0
  j .F.recursiveMerge._3.array.exit.0                                   # ir inst 9 fin
.F.recursiveMerge._2.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 10 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 11 fin
  addi s11, t3, 1                                                       # ir inst 12 fin
# Phi connections
  mv t3, s11
  j .F.recursiveMerge._1.array.cond.0                                   # ir inst 13 fin
.F.recursiveMerge._3.array.exit.0:
  addi t1, sp, 248
  addi t4, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t3, 0
  j .F.recursiveMerge._4.array.cond.1                                   # ir inst 16 fin
.F.recursiveMerge._4.array.cond.1:
  li t2, 50
  slt s11, t3, t2                                                       # ir inst 18 fin
  bnez s11, .F.recursiveMerge._5.array.body.1
  j .F.recursiveMerge._6.array.exit.1                                   # ir inst 19 fin
.F.recursiveMerge._5.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 20 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 21 fin
  addi s11, t3, 1                                                       # ir inst 22 fin
# Phi connections
  mv t3, s11
  j .F.recursiveMerge._4.array.cond.1                                   # ir inst 23 fin
.F.recursiveMerge._6.array.exit.1:
# Phi connections
  li t4, 0
  j .F.recursiveMerge._7.while.cond.0                                   # ir inst 24 fin
.F.recursiveMerge._7.while.cond.0:
  sltu t3, t4, t5                                                       # ir inst 26 fin
  bnez t3, .F.recursiveMerge._8.while.body.0
  j .F.recursiveMerge._9.while.exit.0                                   # ir inst 27 fin
.F.recursiveMerge._8.while.body.0:
  slli t2, t4, 2
  addi t1, sp, 48
  add t3, t1, t2                                                        # ir inst 28 fin
  add s11, a1, t4                                                       # ir inst 29 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 30 fin
  lw s11, 0(s10)                                                        # ir inst 31 fin
  sw s11, 0(t3)                                                         # ir inst 32 fin
  addi t3, t4, 1                                                        # ir inst 33 fin
# Phi connections
  mv t4, t3
  j .F.recursiveMerge._7.while.cond.0                                   # ir inst 34 fin
.F.recursiveMerge._9.while.exit.0:
# Phi connections
  li t4, 0
  j .F.recursiveMerge._10.while.cond.1                                  # ir inst 35 fin
.F.recursiveMerge._10.while.cond.1:
  sltu t3, t4, t6                                                       # ir inst 37 fin
  bnez t3, .F.recursiveMerge._11.while.body.1
  j .F.recursiveMerge._12.while.exit.1                                  # ir inst 38 fin
.F.recursiveMerge._11.while.body.1:
  slli t2, t4, 2
  addi t1, sp, 248
  add t3, t1, t2                                                        # ir inst 39 fin
  addi s11, a2, 1                                                       # ir inst 40 fin
  add s10, s11, t4                                                      # ir inst 41 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 42 fin
  lw s10, 0(s11)                                                        # ir inst 43 fin
  sw s10, 0(t3)                                                         # ir inst 44 fin
  addi t3, t4, 1                                                        # ir inst 45 fin
# Phi connections
  mv t4, t3
  j .F.recursiveMerge._10.while.cond.1                                  # ir inst 46 fin
.F.recursiveMerge._12.while.exit.1:
# Phi connections
  li s10, 0
  li s11, 0
  mv t3, a1
  li t4, 0
  j .F.recursiveMerge._13.while.cond.2                                  # ir inst 47 fin
.F.recursiveMerge._13.while.cond.2:
  sltu s9, s10, t5                                                      # ir inst 52 fin
  bnez s9, .F.recursiveMerge._14.lazy.then.0
  j .F.recursiveMerge._15.lazy.else.0                                   # ir inst 53 fin
.F.recursiveMerge._14.lazy.then.0:
  sltu s9, s11, t6                                                      # ir inst 54 fin
# Phi connections
  j .F.recursiveMerge._16.lazy.exit.0                                   # ir inst 55 fin
.F.recursiveMerge._15.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.recursiveMerge._16.lazy.exit.0                                   # ir inst 56 fin
.F.recursiveMerge._16.lazy.exit.0:
  bnez s9, .F.recursiveMerge._17.while.body.2
  j .F.recursiveMerge._21.while.exit.2                                  # ir inst 58 fin
.F.recursiveMerge._17.while.body.2:
  addi s9, t4, 1                                                        # ir inst 59 fin
  slli t2, s10, 2
  addi t1, sp, 48
  add s8, t1, t2                                                        # ir inst 60 fin
  lw s7, 0(s8)                                                          # ir inst 61 fin
  slli t2, s11, 2
  addi t1, sp, 248
  add s8, t1, t2                                                        # ir inst 62 fin
  lw s6, 0(s8)                                                          # ir inst 63 fin
  slt t0, s6, s7
  xori s8, t0, 1                                                        # ir inst 64 fin
  bnez s8, .F.recursiveMerge._18.if.then.0
  j .F.recursiveMerge._19.if.else.0                                     # ir inst 65 fin
.F.recursiveMerge._18.if.then.0:
  slli t2, t3, 2
  add s8, a0, t2                                                        # ir inst 66 fin
  slli t2, s10, 2
  addi t1, sp, 48
  add s7, t1, t2                                                        # ir inst 67 fin
  lw s6, 0(s7)                                                          # ir inst 68 fin
  sw s6, 0(s8)                                                          # ir inst 69 fin
  addi s8, s10, 1                                                       # ir inst 70 fin
# Phi connections
  mv s7, s8
  mv s8, s11
  j .F.recursiveMerge._20.if.exit.0                                     # ir inst 71 fin
.F.recursiveMerge._19.if.else.0:
  slli t2, t3, 2
  add s8, a0, t2                                                        # ir inst 72 fin
  slli t2, s11, 2
  addi t1, sp, 248
  add s7, t1, t2                                                        # ir inst 73 fin
  lw s6, 0(s7)                                                          # ir inst 74 fin
  sw s6, 0(s8)                                                          # ir inst 75 fin
  addi s8, s11, 1                                                       # ir inst 76 fin
# Phi connections
  mv s7, s10
  j .F.recursiveMerge._20.if.exit.0                                     # ir inst 77 fin
.F.recursiveMerge._20.if.exit.0:
  addi s6, t3, 1                                                        # ir inst 80 fin
# Phi connections
  mv s10, s7
  mv s11, s8
  mv t3, s6
  mv t4, s9
  j .F.recursiveMerge._13.while.cond.2                                  # ir inst 81 fin
.F.recursiveMerge._21.while.exit.2:
# Phi connections
  j .F.recursiveMerge._22.while.cond.3                                  # ir inst 82 fin
.F.recursiveMerge._22.while.cond.3:
  sltu s9, s10, t5                                                      # ir inst 85 fin
  bnez s9, .F.recursiveMerge._23.while.body.3
  j .F.recursiveMerge._24.while.exit.3                                  # ir inst 86 fin
.F.recursiveMerge._23.while.body.3:
  slli t2, t3, 2
  add s9, a0, t2                                                        # ir inst 87 fin
  slli t2, s10, 2
  addi t1, sp, 48
  add s8, t1, t2                                                        # ir inst 88 fin
  lw s7, 0(s8)                                                          # ir inst 89 fin
  sw s7, 0(s9)                                                          # ir inst 90 fin
  addi s9, s10, 1                                                       # ir inst 91 fin
  addi s10, t3, 1                                                       # ir inst 92 fin
# Phi connections
  mv t3, s10
  mv s10, s9
  j .F.recursiveMerge._22.while.cond.3                                  # ir inst 93 fin
.F.recursiveMerge._24.while.exit.3:
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.recursiveMerge._25.while.cond.4                                  # ir inst 94 fin
.F.recursiveMerge._25.while.cond.4:
  sltu s11, t3, t6                                                      # ir inst 97 fin
  bnez s11, .F.recursiveMerge._26.while.body.4
  j .F.recursiveMerge._27.while.exit.4                                  # ir inst 98 fin
.F.recursiveMerge._26.while.body.4:
  slli t2, t5, 2
  add s11, a0, t2                                                       # ir inst 99 fin
  slli t2, t3, 2
  addi t1, sp, 248
  add s10, t1, t2                                                       # ir inst 100 fin
  lw s9, 0(s10)                                                         # ir inst 101 fin
  sw s9, 0(s11)                                                         # ir inst 102 fin
  addi s11, t3, 1                                                       # ir inst 103 fin
  addi t3, t5, 1                                                        # ir inst 104 fin
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.recursiveMerge._25.while.cond.4                                  # ir inst 105 fin
.F.recursiveMerge._27.while.exit.4:
  mv a0, t4
  j .F.recursiveMerge.epilogue                                          # ir inst 106 fin
.F.recursiveMerge.epilogue:
  ld s6, 0(sp)
  ld s8, 8(sp)
  ld s7, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 448
  ret

.globl .F.recursiveBinarySearch
.F.recursiveBinarySearch:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.recursiveBinarySearch._0.entry.0:
  sltu t6, a2, a1                                                       # ir inst 1 fin
  bnez t6, .F.recursiveBinarySearch._1.if.then.0
  j .F.recursiveBinarySearch._2.if.else.0                               # ir inst 2 fin
.F.recursiveBinarySearch._1.if.then.0:
  li a0, -1
  j .F.recursiveBinarySearch.epilogue                                   # ir inst 3 fin
.F.recursiveBinarySearch._2.if.else.0:
  j .F.recursiveBinarySearch._3.if.exit.0                               # ir inst 4 fin
.F.recursiveBinarySearch._3.if.exit.0:
  sub t6, a2, a1                                                        # ir inst 5 fin
  li t2, 2
  divu t5, t6, t2                                                       # ir inst 6 fin
  add t6, a1, t5                                                        # ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  xor t0, t4, a3
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.recursiveBinarySearch._4.if.then.1
  j .F.recursiveBinarySearch._5.if.else.1                               # ir inst 11 fin
.F.recursiveBinarySearch._4.if.then.1:
  mv t5, t6                                                             # ir inst 12 fin
  mv a0, t5
  j .F.recursiveBinarySearch.epilogue                                   # ir inst 13 fin
.F.recursiveBinarySearch._5.if.else.1:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  slt t5, a3, t4                                                        # ir inst 16 fin
  bnez t5, .F.recursiveBinarySearch._6.if.then.2
  j .F.recursiveBinarySearch._7.if.else.2                               # ir inst 17 fin
.F.recursiveBinarySearch._6.if.then.2:
  addi t5, t6, -1                                                       # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t5
  call .F.recursiveBinarySearch
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 19 fin
  mv a0, t4
  j .F.recursiveBinarySearch.epilogue                                   # ir inst 20 fin
.F.recursiveBinarySearch._7.if.else.2:
  addi t5, t6, 1                                                        # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F.recursiveBinarySearch
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t5, 24(sp)
# ir inst 22 fin
  mv a0, t6
  j .F.recursiveBinarySearch.epilogue                                   # ir inst 23 fin
.F.recursiveBinarySearch._8.if.exit.2:
  j .F.recursiveBinarySearch._9.if.exit.1                               # ir inst 24 fin
.F.recursiveBinarySearch._9.if.exit.1:
.F.recursiveBinarySearch.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.recursiveQuickSelect
.F.recursiveQuickSelect:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.recursiveQuickSelect._0.entry.0:
  xor t0, a1, a2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.recursiveQuickSelect._1.if.then.0
  j .F.recursiveQuickSelect._2.if.else.0                                # ir inst 2 fin
.F.recursiveQuickSelect._1.if.then.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 3 fin
  lw t5, 0(t6)                                                          # ir inst 4 fin
  mv a0, t5
  j .F.recursiveQuickSelect.epilogue                                    # ir inst 5 fin
.F.recursiveQuickSelect._2.if.else.0:
  j .F.recursiveQuickSelect._3.if.exit.0                                # ir inst 6 fin
.F.recursiveQuickSelect._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  call .F.recursivePartition
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 7 fin
  xor t0, a3, t6
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.recursiveQuickSelect._4.if.then.1
  j .F.recursiveQuickSelect._5.if.else.1                                # ir inst 9 fin
.F.recursiveQuickSelect._4.if.then.1:
  slli t2, a3, 2
  add t5, a0, t2                                                        # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  mv a0, t4
  j .F.recursiveQuickSelect.epilogue                                    # ir inst 12 fin
.F.recursiveQuickSelect._5.if.else.1:
  sltu t5, a3, t6                                                       # ir inst 13 fin
  bnez t5, .F.recursiveQuickSelect._6.if.then.2
  j .F.recursiveQuickSelect._7.if.else.2                                # ir inst 14 fin
.F.recursiveQuickSelect._6.if.then.2:
  addi t5, t6, -1                                                       # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t5
  call .F.recursiveQuickSelect
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 16 fin
  mv a0, t4
  j .F.recursiveQuickSelect.epilogue                                    # ir inst 17 fin
.F.recursiveQuickSelect._7.if.else.2:
  addi t5, t6, 1                                                        # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F.recursiveQuickSelect
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t5, 24(sp)
# ir inst 19 fin
  mv a0, t6
  j .F.recursiveQuickSelect.epilogue                                    # ir inst 20 fin
.F.recursiveQuickSelect._8.if.exit.2:
  j .F.recursiveQuickSelect._9.if.exit.1                                # ir inst 21 fin
.F.recursiveQuickSelect._9.if.exit.1:
.F.recursiveQuickSelect.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.recursivePartition
.F.recursivePartition:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.recursivePartition._0.entry.0:
  slli t2, a2, 2
  add t6, a0, t2                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  mv t4, a1
  mv t6, a1
  j .F.recursivePartition._1.while.cond.0                               # ir inst 3 fin
.F.recursivePartition._1.while.cond.0:
  sltu t3, t6, a2                                                       # ir inst 6 fin
  bnez t3, .F.recursivePartition._2.while.body.0
  j .F.recursivePartition._6.while.exit.0                               # ir inst 7 fin
.F.recursivePartition._2.while.body.0:
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw s11, 0(t3)                                                         # ir inst 9 fin
  slt t0, t5, s11
  xori t3, t0, 1                                                        # ir inst 10 fin
  bnez t3, .F.recursivePartition._3.if.then.0
  j .F.recursivePartition._4.if.else.0                                  # ir inst 11 fin
.F.recursivePartition._3.if.then.0:
  addi t3, t4, 1                                                        # ir inst 12 fin
  addi s11, t3, -1                                                      # ir inst 13 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 14 fin
  lw s11, 0(s10)                                                        # ir inst 15 fin
  addi s10, t3, -1                                                      # ir inst 16 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 17 fin
  slli t2, t6, 2
  add s10, a0, t2                                                       # ir inst 18 fin
  lw s8, 0(s10)                                                         # ir inst 19 fin
  sw s8, 0(s9)                                                          # ir inst 20 fin
  slli t2, t6, 2
  add s10, a0, t2                                                       # ir inst 21 fin
  sw s11, 0(s10)                                                        # ir inst 22 fin
# Phi connections
  j .F.recursivePartition._5.if.exit.0                                  # ir inst 23 fin
.F.recursivePartition._4.if.else.0:
# Phi connections
  mv t3, t4
  j .F.recursivePartition._5.if.exit.0                                  # ir inst 24 fin
.F.recursivePartition._5.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 26 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.recursivePartition._1.while.cond.0                               # ir inst 27 fin
.F.recursivePartition._6.while.exit.0:
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 28 fin
  lw t5, 0(t6)                                                          # ir inst 29 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 30 fin
  slli t2, a2, 2
  add t3, a0, t2                                                        # ir inst 31 fin
  lw s11, 0(t3)                                                         # ir inst 32 fin
  sw s11, 0(t6)                                                         # ir inst 33 fin
  slli t2, a2, 2
  add t6, a0, t2                                                        # ir inst 34 fin
  sw t5, 0(t6)                                                          # ir inst 35 fin
  mv a0, t4
  j .F.recursivePartition.epilogue                                      # ir inst 36 fin
.F.recursivePartition.epilogue:
  ld s9, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.testRecursiveMatrixMultiplication
.F.testRecursiveMatrixMultiplication:
# spill func args num: 0,             range:      208(sp) -      208(sp)
# local var size: 192,                range:        8(sp) -      200(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -208
  sd ra, 0(sp)
.F.testRecursiveMatrixMultiplication._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testRecursiveMatrixMultiplication._1.array.cond.0                # ir inst 3 fin
.F.testRecursiveMatrixMultiplication._1.array.cond.0:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testRecursiveMatrixMultiplication._2.array.body.0
  j .F.testRecursiveMatrixMultiplication._3.array.exit.0                # ir inst 6 fin
.F.testRecursiveMatrixMultiplication._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testRecursiveMatrixMultiplication._1.array.cond.0                # ir inst 10 fin
.F.testRecursiveMatrixMultiplication._3.array.exit.0:
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.testRecursiveMatrixMultiplication._4.array.cond.1                # ir inst 13 fin
.F.testRecursiveMatrixMultiplication._4.array.cond.1:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.testRecursiveMatrixMultiplication._5.array.body.1
  j .F.testRecursiveMatrixMultiplication._6.array.exit.1                # ir inst 16 fin
.F.testRecursiveMatrixMultiplication._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.testRecursiveMatrixMultiplication._4.array.cond.1                # ir inst 20 fin
.F.testRecursiveMatrixMultiplication._6.array.exit.1:
  addi t1, sp, 136
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j .F.testRecursiveMatrixMultiplication._7.array.cond.2                # ir inst 23 fin
.F.testRecursiveMatrixMultiplication._7.array.cond.2:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, .F.testRecursiveMatrixMultiplication._8.array.body.2
  j .F.testRecursiveMatrixMultiplication._9.array.exit.2                # ir inst 26 fin
.F.testRecursiveMatrixMultiplication._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j .F.testRecursiveMatrixMultiplication._7.array.cond.2                # ir inst 30 fin
.F.testRecursiveMatrixMultiplication._9.array.exit.2:
# Start call preparation
  li a1, 4
  addi t1, sp, 8
  mv a0, t1
  call .F.initializeMatrix
# ir inst 31 fin
# Start call preparation
  li a1, 4
  addi t1, sp, 72
  mv a0, t1
  call .F.initializeMatrix
# ir inst 32 fin
# Start call preparation
  li a3, 4
  addi t1, sp, 136
  mv a2, t1
  addi t1, sp, 72
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.recursiveMatrixMultiply
# ir inst 33 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testRecursiveMatrixMultiplication._10.while.cond.0               # ir inst 34 fin
.F.testRecursiveMatrixMultiplication._10.while.cond.0:
  li t2, 16
  sltu t4, t6, t2                                                       # ir inst 37 fin
  bnez t4, .F.testRecursiveMatrixMultiplication._11.while.body.0
  j .F.testRecursiveMatrixMultiplication._12.while.exit.0               # ir inst 38 fin
.F.testRecursiveMatrixMultiplication._11.while.body.0:
  slli t2, t6, 2
  addi t1, sp, 136
  add t4, t1, t2                                                        # ir inst 39 fin
  lw t3, 0(t4)                                                          # ir inst 40 fin
  add t4, t5, t3                                                        # ir inst 41 fin
  addi t3, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testRecursiveMatrixMultiplication._10.while.cond.0               # ir inst 43 fin
.F.testRecursiveMatrixMultiplication._12.while.exit.0:
  mv a0, t5
  j .F.testRecursiveMatrixMultiplication.epilogue                       # ir inst 44 fin
.F.testRecursiveMatrixMultiplication.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 208
  ret

.globl .F.initializeMatrix
.F.initializeMatrix:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeMatrix._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeMatrix._1.while.cond.0                                 # ir inst 1 fin
.F.initializeMatrix._1.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 3 fin
  sltu t4, t6, t5                                                       # ir inst 4 fin
  bnez t4, .F.initializeMatrix._2.while.body.0
  j .F.initializeMatrix._3.while.exit.0                                 # ir inst 5 fin
.F.initializeMatrix._2.while.body.0:
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  li t2, 10
  remu t4, t6, t2                                                       # ir inst 7 fin
  mv t3, t4                                                             # ir inst 8 fin
  addi t4, t3, 1                                                        # ir inst 9 fin
  sw t4, 0(t5)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.initializeMatrix._1.while.cond.0                                 # ir inst 12 fin
.F.initializeMatrix._3.while.exit.0:
  j .F.initializeMatrix.epilogue                                        # ir inst 13 fin
.F.initializeMatrix.epilogue:
  ret

.globl .F.recursiveMatrixMultiply
.F.recursiveMatrixMultiply:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s10, 0(sp)
  sd s8, 8(sp)
  sd s11, 16(sp)
  sd s9, 24(sp)
.F.recursiveMatrixMultiply._0.entry.0:
  li t2, 1
  xor t0, a3, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.recursiveMatrixMultiply._1.if.then.0
  j .F.recursiveMatrixMultiply._2.if.else.0                             # ir inst 2 fin
.F.recursiveMatrixMultiply._1.if.then.0:
  addi t6, a2, 0                                                        # ir inst 3 fin
  addi t5, a0, 0                                                        # ir inst 4 fin
  lw t4, 0(t5)                                                          # ir inst 5 fin
  addi t5, a1, 0                                                        # ir inst 6 fin
  lw t3, 0(t5)                                                          # ir inst 7 fin
  mul t5, t4, t3                                                        # ir inst 8 fin
  sw t5, 0(t6)                                                          # ir inst 9 fin
  j .F.recursiveMatrixMultiply.epilogue                                 # ir inst 10 fin
.F.recursiveMatrixMultiply._2.if.else.0:
  j .F.recursiveMatrixMultiply._3.if.exit.0                             # ir inst 11 fin
.F.recursiveMatrixMultiply._3.if.exit.0:
# Phi connections
  li t6, 0
  j .F.recursiveMatrixMultiply._4.while.cond.0                          # ir inst 12 fin
.F.recursiveMatrixMultiply._4.while.cond.0:
  sltu t5, t6, a3                                                       # ir inst 14 fin
  bnez t5, .F.recursiveMatrixMultiply._5.while.body.0
  j .F.recursiveMatrixMultiply._12.while.exit.0                         # ir inst 15 fin
.F.recursiveMatrixMultiply._5.while.body.0:
# Phi connections
  li t5, 0
  j .F.recursiveMatrixMultiply._6.while.cond.1                          # ir inst 16 fin
.F.recursiveMatrixMultiply._6.while.cond.1:
  sltu t4, t5, a3                                                       # ir inst 18 fin
  bnez t4, .F.recursiveMatrixMultiply._7.while.body.1
  j .F.recursiveMatrixMultiply._11.while.exit.1                         # ir inst 19 fin
.F.recursiveMatrixMultiply._7.while.body.1:
  mul t4, t6, a3                                                        # ir inst 20 fin
  add t3, t4, t5                                                        # ir inst 21 fin
  slli t2, t3, 2
  add t4, a2, t2                                                        # ir inst 22 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 23 fin
# Phi connections
  li t4, 0
  j .F.recursiveMatrixMultiply._8.while.cond.2                          # ir inst 24 fin
.F.recursiveMatrixMultiply._8.while.cond.2:
  sltu t3, t4, a3                                                       # ir inst 26 fin
  bnez t3, .F.recursiveMatrixMultiply._9.while.body.2
  j .F.recursiveMatrixMultiply._10.while.exit.2                         # ir inst 27 fin
.F.recursiveMatrixMultiply._9.while.body.2:
  mul t3, t6, a3                                                        # ir inst 28 fin
  add s11, t3, t5                                                       # ir inst 29 fin
  slli t2, s11, 2
  add t3, a2, t2                                                        # ir inst 30 fin
  mul s11, t6, a3                                                       # ir inst 31 fin
  add s10, s11, t5                                                      # ir inst 32 fin
  slli t2, s10, 2
  add s11, a2, t2                                                       # ir inst 33 fin
  lw s10, 0(s11)                                                        # ir inst 34 fin
  mul s11, t6, a3                                                       # ir inst 35 fin
  add s9, s11, t4                                                       # ir inst 36 fin
  slli t2, s9, 2
  add s11, a0, t2                                                       # ir inst 37 fin
  lw s9, 0(s11)                                                         # ir inst 38 fin
  mul s11, t4, a3                                                       # ir inst 39 fin
  add s8, s11, t5                                                       # ir inst 40 fin
  slli t2, s8, 2
  add s11, a1, t2                                                       # ir inst 41 fin
  lw s8, 0(s11)                                                         # ir inst 42 fin
  mul s11, s9, s8                                                       # ir inst 43 fin
  add s9, s10, s11                                                      # ir inst 44 fin
  sw s9, 0(t3)                                                          # ir inst 45 fin
  addi t3, t4, 1                                                        # ir inst 46 fin
# Phi connections
  mv t4, t3
  j .F.recursiveMatrixMultiply._8.while.cond.2                          # ir inst 47 fin
.F.recursiveMatrixMultiply._10.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 48 fin
# Phi connections
  mv t5, t4
  j .F.recursiveMatrixMultiply._6.while.cond.1                          # ir inst 49 fin
.F.recursiveMatrixMultiply._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F.recursiveMatrixMultiply._4.while.cond.0                          # ir inst 51 fin
.F.recursiveMatrixMultiply._12.while.exit.0:
  j .F.recursiveMatrixMultiply.epilogue                                 # ir inst 52 fin
.F.recursiveMatrixMultiply.epilogue:
  ld s10, 0(sp)
  ld s8, 8(sp)
  ld s11, 16(sp)
  ld s9, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.testRecursiveMathematicalComputations
.F.testRecursiveMathematicalComputations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.testRecursiveMathematicalComputations._0.entry.0:
# Start call preparation
  li a0, 1409
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a1, 462
  li a0, 1071
  call .F.recursiveGCD
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  li a0, 25
  call .F.recursiveFibonacci
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
  li a0, 10
  call .F.recursiveCombination
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  li a0, 60
  call .F.recursiveSumOfDivisors
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  li a0, 123456789
  call .F.recursiveDigitSum
  mv t6, a0
# ir inst 10 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 11 fin
# Start call preparation
  li a0, 1410
  call printlnInt
# ir inst 12 fin
  j .F.testRecursiveMathematicalComputations.epilogue                   # ir inst 13 fin
.F.testRecursiveMathematicalComputations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.recursiveGCD
.F.recursiveGCD:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.recursiveGCD._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.recursiveGCD._1.if.then.0
  j .F.recursiveGCD._2.if.else.0                                        # ir inst 2 fin
.F.recursiveGCD._1.if.then.0:
  j .F.recursiveGCD.epilogue                                            # ir inst 3 fin
.F.recursiveGCD._2.if.else.0:
  j .F.recursiveGCD._3.if.exit.0                                        # ir inst 4 fin
.F.recursiveGCD._3.if.exit.0:
  rem t6, a0, a1                                                        # ir inst 5 fin
# Start call preparation
  sd a1, 0(sp)
  sd t6, 8(sp)
  mv a0, a1
  mv a1, t6
  call .F.recursiveGCD
  mv t5, a0
  ld a1, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  mv a0, t5
  j .F.recursiveGCD.epilogue                                            # ir inst 7 fin
.F.recursiveGCD.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.recursiveFibonacci
.F.recursiveFibonacci:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.recursiveFibonacci._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.recursiveFibonacci._1.if.then.0
  j .F.recursiveFibonacci._2.if.else.0                                  # ir inst 2 fin
.F.recursiveFibonacci._1.if.then.0:
  j .F.recursiveFibonacci.epilogue                                      # ir inst 3 fin
.F.recursiveFibonacci._2.if.else.0:
  j .F.recursiveFibonacci._3.if.exit.0                                  # ir inst 4 fin
.F.recursiveFibonacci._3.if.exit.0:
  addi t6, a0, -1                                                       # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.recursiveFibonacci
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
  addi t6, a0, -2                                                       # ir inst 7 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.recursiveFibonacci
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 8 fin
  add t6, t5, t4                                                        # ir inst 9 fin
  mv a0, t6
  j .F.recursiveFibonacci.epilogue                                      # ir inst 10 fin
.F.recursiveFibonacci.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.recursiveCombination
.F.recursiveCombination:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.recursiveCombination._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.recursiveCombination._1.lazy.then.0
  j .F.recursiveCombination._2.lazy.else.0                              # ir inst 2 fin
.F.recursiveCombination._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.recursiveCombination._3.lazy.exit.0                              # ir inst 3 fin
.F.recursiveCombination._2.lazy.else.0:
  xor t0, a1, a0
  sltiu t6, t0, 1                                                       # ir inst 4 fin
# Phi connections
  j .F.recursiveCombination._3.lazy.exit.0                              # ir inst 5 fin
.F.recursiveCombination._3.lazy.exit.0:
  bnez t6, .F.recursiveCombination._4.if.then.0
  j .F.recursiveCombination._5.if.else.0                                # ir inst 7 fin
.F.recursiveCombination._4.if.then.0:
  li a0, 1
  j .F.recursiveCombination.epilogue                                    # ir inst 8 fin
.F.recursiveCombination._5.if.else.0:
  j .F.recursiveCombination._6.if.exit.0                                # ir inst 9 fin
.F.recursiveCombination._6.if.exit.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 10 fin
  bnez t6, .F.recursiveCombination._7.if.then.1
  j .F.recursiveCombination._8.if.else.1                                # ir inst 11 fin
.F.recursiveCombination._7.if.then.1:
  j .F.recursiveCombination.epilogue                                    # ir inst 12 fin
.F.recursiveCombination._8.if.else.1:
  j .F.recursiveCombination._9.if.exit.1                                # ir inst 13 fin
.F.recursiveCombination._9.if.exit.1:
  addi t6, a0, -1                                                       # ir inst 14 fin
  addi t5, a1, -1                                                       # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  mv a0, t6
  call .F.recursiveCombination
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 16 fin
  addi t6, a0, -1                                                       # ir inst 17 fin
# Start call preparation
  sd a1, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.recursiveCombination
  mv t5, a0
  ld a1, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  add t6, t4, t5                                                        # ir inst 19 fin
  mv a0, t6
  j .F.recursiveCombination.epilogue                                    # ir inst 20 fin
.F.recursiveCombination.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.recursiveSumOfDivisors
.F.recursiveSumOfDivisors:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.recursiveSumOfDivisors._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 0
  li a1, 1
  call .F.recursiveSumOfDivisorsHelper
  mv t6, a0
  ld a0, 0(sp)
# ir inst 1 fin
  mv a0, t6
  j .F.recursiveSumOfDivisors.epilogue                                  # ir inst 2 fin
.F.recursiveSumOfDivisors.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.recursiveSumOfDivisorsHelper
.F.recursiveSumOfDivisorsHelper:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.recursiveSumOfDivisorsHelper._0.entry.0:
  slt t6, a0, a1                                                        # ir inst 1 fin
  bnez t6, .F.recursiveSumOfDivisorsHelper._1.if.then.0
  j .F.recursiveSumOfDivisorsHelper._2.if.else.0                        # ir inst 2 fin
.F.recursiveSumOfDivisorsHelper._1.if.then.0:
  mv a0, a2
  j .F.recursiveSumOfDivisorsHelper.epilogue                            # ir inst 3 fin
.F.recursiveSumOfDivisorsHelper._2.if.else.0:
  j .F.recursiveSumOfDivisorsHelper._3.if.exit.0                        # ir inst 4 fin
.F.recursiveSumOfDivisorsHelper._3.if.exit.0:
  rem t6, a0, a1                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.recursiveSumOfDivisorsHelper._4.if.then.1
  j .F.recursiveSumOfDivisorsHelper._5.if.else.1                        # ir inst 7 fin
.F.recursiveSumOfDivisorsHelper._4.if.then.1:
  addi t6, a1, 1                                                        # ir inst 8 fin
  add t5, a2, a1                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t5
  mv a1, t6
  call .F.recursiveSumOfDivisorsHelper
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 10 fin
  mv a0, t4
  j .F.recursiveSumOfDivisorsHelper.epilogue                            # ir inst 11 fin
.F.recursiveSumOfDivisorsHelper._5.if.else.1:
  addi t6, a1, 1                                                        # ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  call .F.recursiveSumOfDivisorsHelper
  mv t5, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 13 fin
  mv a0, t5
  j .F.recursiveSumOfDivisorsHelper.epilogue                            # ir inst 14 fin
.F.recursiveSumOfDivisorsHelper._6.if.exit.1:
.F.recursiveSumOfDivisorsHelper.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.recursiveDigitSum
.F.recursiveDigitSum:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.recursiveDigitSum._0.entry.0:
  li t2, 10
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.recursiveDigitSum._1.if.then.0
  j .F.recursiveDigitSum._2.if.else.0                                   # ir inst 2 fin
.F.recursiveDigitSum._1.if.then.0:
  j .F.recursiveDigitSum.epilogue                                       # ir inst 3 fin
.F.recursiveDigitSum._2.if.else.0:
  j .F.recursiveDigitSum._3.if.exit.0                                   # ir inst 4 fin
.F.recursiveDigitSum._3.if.exit.0:
  li t2, 10
  rem t6, a0, t2                                                        # ir inst 5 fin
  li t2, 10
  div t5, a0, t2                                                        # ir inst 6 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call .F.recursiveDigitSum
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  add t5, t6, t4                                                        # ir inst 8 fin
  mv a0, t5
  j .F.recursiveDigitSum.epilogue                                       # ir inst 9 fin
.F.recursiveDigitSum.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.recursiveArraySum
.F.recursiveArraySum:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       40(sp) -      440(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd ra, 32(sp)
.F.recursiveArraySum._0.entry.0:
  sltu t0, a1, a2
  xori t6, t0, 1                                                        # ir inst 2 fin
  bnez t6, .F.recursiveArraySum._1.if.then.0
  j .F.recursiveArraySum._2.if.else.0                                   # ir inst 3 fin
.F.recursiveArraySum._1.if.then.0:
  li a0, 0
  j .F.recursiveArraySum.epilogue                                       # ir inst 4 fin
.F.recursiveArraySum._2.if.else.0:
  j .F.recursiveArraySum._3.if.exit.0                                   # ir inst 5 fin
.F.recursiveArraySum._3.if.exit.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  addi t6, a1, 1                                                        # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  mv a1, a0
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
# Start call preparation
  sd a2, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  addi t1, sp, 40
  mv a0, t1
  call .F.recursiveArraySum
  mv t4, a0
  ld a2, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 10 fin
  add t6, t5, t4                                                        # ir inst 11 fin
  mv a0, t6
  j .F.recursiveArraySum.epilogue                                       # ir inst 12 fin
.F.recursiveArraySum.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 448
  ret

.globl .F.recursiveArrayMax
.F.recursiveArrayMax:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       40(sp) -      440(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd ra, 32(sp)
.F.recursiveArrayMax._0.entry.0:
  sltu t0, a1, a2
  xori t6, t0, 1                                                        # ir inst 2 fin
  bnez t6, .F.recursiveArrayMax._1.if.then.0
  j .F.recursiveArrayMax._2.if.else.0                                   # ir inst 3 fin
.F.recursiveArrayMax._1.if.then.0:
  mv a0, a3
  j .F.recursiveArrayMax.epilogue                                       # ir inst 4 fin
.F.recursiveArrayMax._2.if.else.0:
  j .F.recursiveArrayMax._3.if.exit.0                                   # ir inst 5 fin
.F.recursiveArrayMax._3.if.exit.0:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  slt t6, a3, t5                                                        # ir inst 8 fin
  bnez t6, .F.recursiveArrayMax._4.if.then.1
  j .F.recursiveArrayMax._5.if.else.1                                   # ir inst 9 fin
.F.recursiveArrayMax._4.if.then.1:
  slli t2, a1, 2
  add t6, a0, t2                                                        # ir inst 10 fin
  lw t5, 0(t6)                                                          # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.recursiveArrayMax._6.if.exit.1                                   # ir inst 12 fin
.F.recursiveArrayMax._5.if.else.1:
# Phi connections
  mv t6, a3
  j .F.recursiveArrayMax._6.if.exit.1                                   # ir inst 13 fin
.F.recursiveArrayMax._6.if.exit.1:
  addi t5, a1, 1                                                        # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  mv a1, a0
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 16 fin
# Start call preparation
  sd a2, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a3, t6
  mv a1, t5
  addi t1, sp, 40
  mv a0, t1
  call .F.recursiveArrayMax
  mv t4, a0
  ld a2, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 17 fin
  mv a0, t4
  j .F.recursiveArrayMax.epilogue                                       # ir inst 18 fin
.F.recursiveArrayMax.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 448
  ret

.globl .F.recursiveStringLength
.F.recursiveStringLength:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.recursiveStringLength._0.entry.0:
  li t2, 10
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.recursiveStringLength._1.if.then.0
  j .F.recursiveStringLength._2.if.else.0                               # ir inst 2 fin
.F.recursiveStringLength._1.if.then.0:
  addi t6, a1, 1                                                        # ir inst 3 fin
  mv a0, t6
  j .F.recursiveStringLength.epilogue                                   # ir inst 4 fin
.F.recursiveStringLength._2.if.else.0:
  j .F.recursiveStringLength._3.if.exit.0                               # ir inst 5 fin
.F.recursiveStringLength._3.if.exit.0:
  li t2, 10
  div t6, a0, t2                                                        # ir inst 6 fin
  addi t5, a1, 1                                                        # ir inst 7 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.recursiveStringLength
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 8 fin
  mv a0, t4
  j .F.recursiveStringLength.epilogue                                   # ir inst 9 fin
.F.recursiveStringLength.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.recursiveIsPalindrome
.F.recursiveIsPalindrome:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.recursiveIsPalindrome._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.recursiveIsPalindrome._1.if.then.0
  j .F.recursiveIsPalindrome._5.if.else.0                               # ir inst 2 fin
.F.recursiveIsPalindrome._1.if.then.0:
  xor t0, a1, a2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.recursiveIsPalindrome._2.if.then.1
  j .F.recursiveIsPalindrome._3.if.else.1                               # ir inst 4 fin
.F.recursiveIsPalindrome._2.if.then.1:
  li a0, 1
  j .F.recursiveIsPalindrome.epilogue                                   # ir inst 5 fin
.F.recursiveIsPalindrome._3.if.else.1:
  li a0, 0
  j .F.recursiveIsPalindrome.epilogue                                   # ir inst 6 fin
.F.recursiveIsPalindrome._4.if.exit.1:
# Phi connections
  mv t4, a0
  mv t5, a1
  mv t6, a2
  j .F.recursiveIsPalindrome._6.if.exit.0                               # ir inst 7 fin
.F.recursiveIsPalindrome._5.if.else.0:
# Phi connections
  mv t4, a0
  mv t5, a1
  mv t6, a2
  j .F.recursiveIsPalindrome._6.if.exit.0                               # ir inst 8 fin
.F.recursiveIsPalindrome._6.if.exit.0:
  li t2, 10
  div t3, t4, t2                                                        # ir inst 12 fin
  li t2, 10
  mul s11, t5, t2                                                       # ir inst 13 fin
  li t2, 10
  rem t5, t4, t2                                                        # ir inst 14 fin
  add t4, s11, t5                                                       # ir inst 15 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  mv a1, t4
  mv a0, t3
  call .F.recursiveIsPalindrome
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 16 fin
  mv a0, t5
  j .F.recursiveIsPalindrome.epilogue                                   # ir inst 17 fin
.F.recursiveIsPalindrome.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret
