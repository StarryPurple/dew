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
  li a0, 1600
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.performLinkedListOperations
# ir inst 2 fin
# Start call preparation
  call .F.testAdvancedListOperations
# ir inst 3 fin
# Start call preparation
  call .F.performListPerformanceTest
# ir inst 4 fin
# Start call preparation
  call .F.testEdgeCases
# ir inst 5 fin
# Start call preparation
  li a0, 1699
  call printlnInt
# ir inst 6 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 7 fin
  j main.epilogue                                                       # ir inst 8 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performLinkedListOperations
.F.performLinkedListOperations:
# spill func args num: 0,             range:     8080(sp) -     8080(sp)
# local var size: 8000,               range:       72(sp) -     8072(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8080
  add sp, sp, t0
  sd s8, 32(sp)
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd ra, 64(sp)
.F.performLinkedListOperations._0.entry.0:
# Start call preparation
  li a0, 1601
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performLinkedListOperations._1.array.cond.0                      # ir inst 4 fin
.F.performLinkedListOperations._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performLinkedListOperations._2.array.body.0
  j .F.performLinkedListOperations._3.array.exit.0                      # ir inst 7 fin
.F.performLinkedListOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performLinkedListOperations._1.array.cond.0                      # ir inst 11 fin
.F.performLinkedListOperations._3.array.exit.0:
# Start call preparation
  li a1, 1
  addi t1, sp, 72
  mv a0, t1
  call .F.initializeFreeList
# ir inst 12 fin
# Start call preparation
  li a0, 1602
  call printlnInt
# ir inst 13 fin
# Phi connections
  li t3, 1
  li t4, 0
  li t5, 0
  li t6, 1
  j .F.performLinkedListOperations._4.while.cond.0                      # ir inst 14 fin
.F.performLinkedListOperations._4.while.cond.0:
  li t2, 100
  slt t0, t2, t3
  xori s11, t0, 1                                                       # ir inst 19 fin
  bnez s11, .F.performLinkedListOperations._5.while.body.0
  j .F.performLinkedListOperations._9.while.exit.0                      # ir inst 20 fin
.F.performLinkedListOperations._5.while.body.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F.allocateNode
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 21 fin
  li t2, 0
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 22 fin
  bnez s10, .F.performLinkedListOperations._6.if.then.0
  j .F.performLinkedListOperations._7.if.else.0                         # ir inst 23 fin
.F.performLinkedListOperations._6.if.then.0:
  mv s10, s11                                                           # ir inst 24 fin
  slli t2, s10, 2
  addi t1, sp, 72
  add s9, t1, t2                                                        # ir inst 25 fin
  li t2, 7
  mul s10, t3, t2                                                       # ir inst 26 fin
  addi s8, s10, 13                                                      # ir inst 27 fin
  sw s8, 0(s9)                                                          # ir inst 28 fin
  mv s10, s11                                                           # ir inst 29 fin
  addi s9, s10, 1                                                       # ir inst 30 fin
  slli t2, s9, 2
  addi t1, sp, 72
  add s10, t1, t2                                                       # ir inst 31 fin
  sw t5, 0(s10)                                                         # ir inst 32 fin
  addi s10, t4, 1                                                       # ir inst 33 fin
  mv s9, t6                                                             # ir inst 34 fin
  addi s8, s9, 1                                                        # ir inst 35 fin
  slli t2, s8, 2
  addi t1, sp, 72
  add s9, t1, t2                                                        # ir inst 36 fin
  lw s8, 0(s9)                                                          # ir inst 37 fin
# Phi connections
  mv t6, s8
  j .F.performLinkedListOperations._8.if.exit.0                         # ir inst 38 fin
.F.performLinkedListOperations._7.if.else.0:
# Phi connections
  mv s10, t4
  mv s11, t5
  j .F.performLinkedListOperations._8.if.exit.0                         # ir inst 39 fin
.F.performLinkedListOperations._8.if.exit.0:
  addi s9, t3, 1                                                        # ir inst 43 fin
# Phi connections
  mv t3, s9
  mv t4, s10
  mv t5, s11
  j .F.performLinkedListOperations._4.while.cond.0                      # ir inst 44 fin
.F.performLinkedListOperations._9.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  li a0, 1603
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 45 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  addi t1, sp, 72
  mv a0, t1
  call .F.calculateListSum
  mv t6, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 46 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 47 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  li a0, 1604
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 48 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  addi t1, sp, 72
  mv a0, t1
  call .F.reverseList
  mv t6, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 49 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F.calculateListSum
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 50 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 51 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  li a0, 1605
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 52 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F.complexListSearch
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 53 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 54 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  li a0, 1606
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 55 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a2, t4
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F.mergeSort
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 56 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 72
  mv a0, t1
  call .F.verifySorted
  mv t6, a0
  ld t5, 0(sp)
# ir inst 57 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 58 fin
  j .F.performLinkedListOperations.epilogue                             # ir inst 59 fin
.F.performLinkedListOperations.epilogue:
  ld ra, 64(sp)
  ld s8, 32(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  li t0, 8080
  add sp, sp, t0
  ret

.globl .F.initializeFreeList
.F.initializeFreeList:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeFreeList._0.entry.0:
# Phi connections
  mv t6, a1
  j .F.initializeFreeList._1.while.cond.0                               # ir inst 1 fin
.F.initializeFreeList._1.while.cond.0:
  li t2, 1998
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeFreeList._2.while.body.0
  j .F.initializeFreeList._3.while.exit.0                               # ir inst 4 fin
.F.initializeFreeList._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 10 fin
  addi t4, t6, 2                                                        # ir inst 11 fin
  sw t4, 0(t5)                                                          # ir inst 12 fin
  addi t5, t6, 2                                                        # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F.initializeFreeList._1.while.cond.0                               # ir inst 14 fin
.F.initializeFreeList._3.while.exit.0:
  li t6, 7992
  add t6, a0, t6                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  li t6, 7996
  add t6, a0, t6                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 18 fin
  j .F.initializeFreeList.epilogue                                      # ir inst 19 fin
.F.initializeFreeList.epilogue:
  ret

.globl .F.allocateNode
.F.allocateNode:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.allocateNode._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.allocateNode._1.lazy.then.0
  j .F.allocateNode._2.lazy.else.0                                      # ir inst 2 fin
.F.allocateNode._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.allocateNode._3.lazy.exit.0                                      # ir inst 3 fin
.F.allocateNode._2.lazy.else.0:
  li t2, 1998
  slt t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.allocateNode._3.lazy.exit.0                                      # ir inst 5 fin
.F.allocateNode._3.lazy.exit.0:
  bnez t6, .F.allocateNode._4.if.then.0
  j .F.allocateNode._5.if.else.0                                        # ir inst 7 fin
.F.allocateNode._4.if.then.0:
  li a0, 0
  j .F.allocateNode.epilogue                                            # ir inst 8 fin
.F.allocateNode._5.if.else.0:
  j .F.allocateNode._6.if.exit.0                                        # ir inst 9 fin
.F.allocateNode._6.if.exit.0:
  mv t6, a1                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 12 fin
  mv t6, a1                                                             # ir inst 13 fin
  addi t5, t6, 1                                                        # ir inst 14 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  mv a0, a1
  j .F.allocateNode.epilogue                                            # ir inst 17 fin
.F.allocateNode.epilogue:
  ret

.globl .F.calculateListSum
.F.calculateListSum:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.calculateListSum._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.calculateListSum._1.while.cond.0                                 # ir inst 1 fin
.F.calculateListSum._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.calculateListSum._2.lazy.then.0
  j .F.calculateListSum._3.lazy.else.0                                  # ir inst 6 fin
.F.calculateListSum._2.lazy.then.0:
  li t2, 1000
  slt t3, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.calculateListSum._4.lazy.exit.0                                  # ir inst 8 fin
.F.calculateListSum._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.calculateListSum._4.lazy.exit.0                                  # ir inst 9 fin
.F.calculateListSum._4.lazy.exit.0:
  bnez t3, .F.calculateListSum._5.while.body.0
  j .F.calculateListSum._6.while.exit.0                                 # ir inst 11 fin
.F.calculateListSum._5.while.body.0:
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  add s11, t4, t3                                                       # ir inst 15 fin
  mv t3, t5                                                             # ir inst 16 fin
  addi t5, t3, 1                                                        # ir inst 17 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 18 fin
  lw t5, 0(t3)                                                          # ir inst 19 fin
  addi t3, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.calculateListSum._1.while.cond.0                                 # ir inst 21 fin
.F.calculateListSum._6.while.exit.0:
  mv a0, t4
  j .F.calculateListSum.epilogue                                        # ir inst 22 fin
.F.calculateListSum.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.reverseList
.F.reverseList:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.reverseList._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.reverseList._1.while.cond.0                                      # ir inst 1 fin
.F.reverseList._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.reverseList._2.lazy.then.0
  j .F.reverseList._3.lazy.else.0                                       # ir inst 6 fin
.F.reverseList._2.lazy.then.0:
  li t2, 1000
  slt t3, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.reverseList._4.lazy.exit.0                                       # ir inst 8 fin
.F.reverseList._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.reverseList._4.lazy.exit.0                                       # ir inst 9 fin
.F.reverseList._4.lazy.exit.0:
  bnez t3, .F.reverseList._5.while.body.0
  j .F.reverseList._6.while.exit.0                                      # ir inst 11 fin
.F.reverseList._5.while.body.0:
  mv t3, t5                                                             # ir inst 12 fin
  addi s11, t3, 1                                                       # ir inst 13 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s11, 0(t3)                                                         # ir inst 15 fin
  mv t3, t5                                                             # ir inst 16 fin
  addi s10, t3, 1                                                       # ir inst 17 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 18 fin
  sw t4, 0(t3)                                                          # ir inst 19 fin
  addi t3, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t4, t5
  mv t5, s11
  mv t6, t3
  j .F.reverseList._1.while.cond.0                                      # ir inst 21 fin
.F.reverseList._6.while.exit.0:
  mv a0, t4
  j .F.reverseList.epilogue                                             # ir inst 22 fin
.F.reverseList.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.complexListSearch
.F.complexListSearch:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 0,                range:       64(sp) -       64(sp)
# callee save reg num: 8 / 12,        range:        0(sp) -       64(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s6, 0(sp)
  sd s7, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
  sd s8, 32(sp)
  sd s9, 40(sp)
  sd s0, 48(sp)
  sd s5, 56(sp)
.F.complexListSearch._0.entry.0:
# Phi connections
  mv s9, a1
  li s10, 0
  li s11, 0
  li t3, 999999
  li t4, -999999
  li t5, 0
  li t6, 0
  j .F.complexListSearch._1.while.cond.0                                # ir inst 1 fin
.F.complexListSearch._1.while.cond.0:
  li t2, 0
  xor t0, s9, t2
  sltu s8, zero, t0                                                     # ir inst 9 fin
  bnez s8, .F.complexListSearch._2.lazy.then.0
  j .F.complexListSearch._3.lazy.else.0                                 # ir inst 10 fin
.F.complexListSearch._2.lazy.then.0:
  li t2, 1000
  slt s8, s10, t2                                                       # ir inst 11 fin
# Phi connections
  j .F.complexListSearch._4.lazy.exit.0                                 # ir inst 12 fin
.F.complexListSearch._3.lazy.else.0:
# Phi connections
  li s8, 0
  j .F.complexListSearch._4.lazy.exit.0                                 # ir inst 13 fin
.F.complexListSearch._4.lazy.exit.0:
  bnez s8, .F.complexListSearch._5.while.body.0
  j .F.complexListSearch._21.while.exit.0                               # ir inst 15 fin
.F.complexListSearch._5.while.body.0:
  mv s8, s9                                                             # ir inst 16 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 17 fin
  lw s8, 0(s7)                                                          # ir inst 18 fin
  slt s7, t4, s8                                                        # ir inst 19 fin
  bnez s7, .F.complexListSearch._6.if.then.0
  j .F.complexListSearch._7.if.else.0                                   # ir inst 20 fin
.F.complexListSearch._6.if.then.0:
# Phi connections
  mv t4, s8
  j .F.complexListSearch._8.if.exit.0                                   # ir inst 21 fin
.F.complexListSearch._7.if.else.0:
# Phi connections
  j .F.complexListSearch._8.if.exit.0                                   # ir inst 22 fin
.F.complexListSearch._8.if.exit.0:
  slt s7, s8, t3                                                        # ir inst 24 fin
  bnez s7, .F.complexListSearch._9.if.then.1
  j .F.complexListSearch._10.if.else.1                                  # ir inst 25 fin
.F.complexListSearch._9.if.then.1:
# Phi connections
  mv t3, s8
  j .F.complexListSearch._11.if.exit.1                                  # ir inst 26 fin
.F.complexListSearch._10.if.else.1:
# Phi connections
  j .F.complexListSearch._11.if.exit.1                                  # ir inst 27 fin
.F.complexListSearch._11.if.exit.1:
  li t2, 2
  rem s7, s8, t2                                                        # ir inst 29 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 30 fin
  bnez s6, .F.complexListSearch._12.if.then.2
  j .F.complexListSearch._13.if.else.2                                  # ir inst 31 fin
.F.complexListSearch._12.if.then.2:
  addi s7, s11, 1                                                       # ir inst 32 fin
# Phi connections
  mv s6, s7
  mv s7, t6
  j .F.complexListSearch._14.if.exit.2                                  # ir inst 33 fin
.F.complexListSearch._13.if.else.2:
  addi s7, t6, 1                                                        # ir inst 34 fin
# Phi connections
  mv s6, s11
  j .F.complexListSearch._14.if.exit.2                                  # ir inst 35 fin
.F.complexListSearch._14.if.exit.2:
  li t2, 7
  rem s5, s8, t2                                                        # ir inst 38 fin
  li t2, 0
  xor t0, s5, t2
  sltiu s0, t0, 1                                                       # ir inst 39 fin
  bnez s0, .F.complexListSearch._15.lazy.then.1
  j .F.complexListSearch._16.lazy.else.1                                # ir inst 40 fin
.F.complexListSearch._15.lazy.then.1:
  li t2, 50
  slt s5, t2, s8                                                        # ir inst 41 fin
# Phi connections
  mv s8, s5
  j .F.complexListSearch._17.lazy.exit.1                                # ir inst 42 fin
.F.complexListSearch._16.lazy.else.1:
# Phi connections
  li s8, 0
  j .F.complexListSearch._17.lazy.exit.1                                # ir inst 43 fin
.F.complexListSearch._17.lazy.exit.1:
  bnez s8, .F.complexListSearch._18.if.then.3
  j .F.complexListSearch._19.if.else.3                                  # ir inst 45 fin
.F.complexListSearch._18.if.then.3:
  addi s8, t5, 1                                                        # ir inst 46 fin
# Phi connections
  j .F.complexListSearch._20.if.exit.3                                  # ir inst 47 fin
.F.complexListSearch._19.if.else.3:
# Phi connections
  mv s8, t5
  j .F.complexListSearch._20.if.exit.3                                  # ir inst 48 fin
.F.complexListSearch._20.if.exit.3:
  mv s5, s9                                                             # ir inst 50 fin
  addi s9, s5, 1                                                        # ir inst 51 fin
  slli t2, s9, 2
  add s5, a0, t2                                                        # ir inst 52 fin
  lw s9, 0(s5)                                                          # ir inst 53 fin
  addi s5, s10, 1                                                       # ir inst 54 fin
# Phi connections
  mv s10, s5
  mv s11, s6
  mv t5, s8
  mv t6, s7
  j .F.complexListSearch._1.while.cond.0                                # ir inst 55 fin
.F.complexListSearch._21.while.exit.0:
  li t2, 1000
  mul t4, t5, t2                                                        # ir inst 56 fin
  li t2, 10
  mul t5, s11, t2                                                       # ir inst 57 fin
  add t3, t4, t5                                                        # ir inst 58 fin
  add t5, t3, t6                                                        # ir inst 59 fin
  mv a0, t5
  j .F.complexListSearch.epilogue                                       # ir inst 60 fin
.F.complexListSearch.epilogue:
  ld s6, 0(sp)
  ld s7, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  ld s8, 32(sp)
  ld s9, 40(sp)
  ld s0, 48(sp)
  ld s5, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.mergeSort
.F.mergeSort:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.mergeSort._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.mergeSort._1.lazy.then.0
  j .F.mergeSort._2.lazy.else.0                                         # ir inst 2 fin
.F.mergeSort._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.mergeSort._3.lazy.exit.0                                         # ir inst 3 fin
.F.mergeSort._2.lazy.else.0:
  mv t6, a1                                                             # ir inst 4 fin
  addi t5, t6, 1                                                        # ir inst 5 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
# Phi connections
  j .F.mergeSort._3.lazy.exit.0                                         # ir inst 9 fin
.F.mergeSort._3.lazy.exit.0:
  bnez t6, .F.mergeSort._4.if.then.0
  j .F.mergeSort._5.if.else.0                                           # ir inst 11 fin
.F.mergeSort._4.if.then.0:
  mv a0, a1
  j .F.mergeSort.epilogue                                               # ir inst 12 fin
.F.mergeSort._5.if.else.0:
  j .F.mergeSort._6.if.exit.0                                           # ir inst 13 fin
.F.mergeSort._6.if.exit.0:
  li t2, 2
  div t6, a2, t2                                                        # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  call .F.splitList
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t6
  call .F.mergeSort
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 16 fin
  sub t3, a2, t6                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  mv a2, t3
  mv a1, t5
  call .F.mergeSort
  mv t6, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
# ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  mv a1, t4
  call .F.mergeLists
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 19 fin
  mv a0, t5
  j .F.mergeSort.epilogue                                               # ir inst 20 fin
.F.mergeSort.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.splitList
.F.splitList:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.splitList._0.entry.0:
  li t2, 1
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.splitList._1.if.then.0
  j .F.splitList._2.if.else.0                                           # ir inst 2 fin
.F.splitList._1.if.then.0:
  mv a0, a1
  j .F.splitList.epilogue                                               # ir inst 3 fin
.F.splitList._2.if.else.0:
  j .F.splitList._3.if.exit.0                                           # ir inst 4 fin
.F.splitList._3.if.exit.0:
# Phi connections
  mv t5, a1
  li t6, 1
  j .F.splitList._4.while.cond.0                                        # ir inst 5 fin
.F.splitList._4.while.cond.0:
  addi t4, a2, -1                                                       # ir inst 8 fin
  slt t3, t6, t4                                                        # ir inst 9 fin
  bnez t3, .F.splitList._5.lazy.then.0
  j .F.splitList._6.lazy.else.0                                         # ir inst 10 fin
.F.splitList._5.lazy.then.0:
  li t2, 0
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 11 fin
# Phi connections
  j .F.splitList._7.lazy.exit.0                                         # ir inst 12 fin
.F.splitList._6.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.splitList._7.lazy.exit.0                                         # ir inst 13 fin
.F.splitList._7.lazy.exit.0:
  bnez t4, .F.splitList._8.while.body.0
  j .F.splitList._9.while.exit.0                                        # ir inst 15 fin
.F.splitList._8.while.body.0:
  mv t4, t5                                                             # ir inst 16 fin
  addi t3, t4, 1                                                        # ir inst 17 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 18 fin
  lw t3, 0(t4)                                                          # ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.splitList._4.while.cond.0                                        # ir inst 21 fin
.F.splitList._9.while.exit.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 22 fin
  bnez t6, .F.splitList._10.if.then.1
  j .F.splitList._11.if.else.1                                          # ir inst 23 fin
.F.splitList._10.if.then.1:
  li a0, 0
  j .F.splitList.epilogue                                               # ir inst 24 fin
.F.splitList._11.if.else.1:
  j .F.splitList._12.if.exit.1                                          # ir inst 25 fin
.F.splitList._12.if.exit.1:
  mv t6, t5                                                             # ir inst 26 fin
  addi t4, t6, 1                                                        # ir inst 27 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 28 fin
  lw t4, 0(t6)                                                          # ir inst 29 fin
  mv t6, t5                                                             # ir inst 30 fin
  addi t5, t6, 1                                                        # ir inst 31 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 32 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 33 fin
  mv a0, t4
  j .F.splitList.epilogue                                               # ir inst 34 fin
.F.splitList.epilogue:
  ret

.globl .F.mergeLists
.F.mergeLists:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s7, 0(sp)
  sd s8, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
  sd s10, 32(sp)
.F.mergeLists._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.mergeLists._1.if.then.0
  j .F.mergeLists._2.if.else.0                                          # ir inst 2 fin
.F.mergeLists._1.if.then.0:
  mv a0, a2
  j .F.mergeLists.epilogue                                              # ir inst 3 fin
.F.mergeLists._2.if.else.0:
  j .F.mergeLists._3.if.exit.0                                          # ir inst 4 fin
.F.mergeLists._3.if.exit.0:
  li t2, 0
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.mergeLists._4.if.then.1
  j .F.mergeLists._5.if.else.1                                          # ir inst 6 fin
.F.mergeLists._4.if.then.1:
  mv a0, a1
  j .F.mergeLists.epilogue                                              # ir inst 7 fin
.F.mergeLists._5.if.else.1:
  j .F.mergeLists._6.if.exit.1                                          # ir inst 8 fin
.F.mergeLists._6.if.exit.1:
  mv t6, a1                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 10 fin
  lw t6, 0(t5)                                                          # ir inst 11 fin
  mv t5, a2                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 13 fin
  lw t5, 0(t4)                                                          # ir inst 14 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 15 fin
  bnez t4, .F.mergeLists._7.if.then.2
  j .F.mergeLists._8.if.else.2                                          # ir inst 16 fin
.F.mergeLists._7.if.then.2:
  mv t6, a1                                                             # ir inst 17 fin
  addi t5, t6, 1                                                        # ir inst 18 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 19 fin
  lw t5, 0(t6)                                                          # ir inst 20 fin
# Phi connections
  mv t3, t5
  mv t4, a1
  mv t5, a2
  mv t6, a1
  j .F.mergeLists._9.if.exit.2                                          # ir inst 21 fin
.F.mergeLists._8.if.else.2:
  mv t6, a2                                                             # ir inst 22 fin
  addi t5, t6, 1                                                        # ir inst 23 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 24 fin
  lw t5, 0(t6)                                                          # ir inst 25 fin
# Phi connections
  mv t3, a1
  mv t4, a2
  mv t6, a2
  j .F.mergeLists._9.if.exit.2                                          # ir inst 26 fin
.F.mergeLists._9.if.exit.2:
# Phi connections
  mv s11, t3
  mv t3, t4
  mv t4, t5
  li t5, 0
  j .F.mergeLists._10.while.cond.0                                      # ir inst 31 fin
.F.mergeLists._10.while.cond.0:
  li t2, 0
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 36 fin
  bnez s10, .F.mergeLists._11.lazy.then.0
  j .F.mergeLists._12.lazy.else.0                                       # ir inst 37 fin
.F.mergeLists._11.lazy.then.0:
  li t2, 0
  xor t0, t4, t2
  sltu s10, zero, t0                                                    # ir inst 38 fin
# Phi connections
  j .F.mergeLists._13.lazy.exit.0                                       # ir inst 39 fin
.F.mergeLists._12.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.mergeLists._13.lazy.exit.0                                       # ir inst 40 fin
.F.mergeLists._13.lazy.exit.0:
  bnez s10, .F.mergeLists._14.lazy.then.1
  j .F.mergeLists._15.lazy.else.1                                       # ir inst 42 fin
.F.mergeLists._14.lazy.then.1:
  li t2, 500
  slt s10, t5, t2                                                       # ir inst 43 fin
# Phi connections
  j .F.mergeLists._16.lazy.exit.1                                       # ir inst 44 fin
.F.mergeLists._15.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.mergeLists._16.lazy.exit.1                                       # ir inst 45 fin
.F.mergeLists._16.lazy.exit.1:
  bnez s10, .F.mergeLists._17.while.body.0
  j .F.mergeLists._21.while.exit.0                                      # ir inst 47 fin
.F.mergeLists._17.while.body.0:
  mv s10, s11                                                           # ir inst 48 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 49 fin
  lw s10, 0(s9)                                                         # ir inst 50 fin
  mv s9, t4                                                             # ir inst 51 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 52 fin
  lw s9, 0(s8)                                                          # ir inst 53 fin
  slt t0, s9, s10
  xori s8, t0, 1                                                        # ir inst 54 fin
  bnez s8, .F.mergeLists._18.if.then.3
  j .F.mergeLists._19.if.else.3                                         # ir inst 55 fin
.F.mergeLists._18.if.then.3:
  mv s10, t3                                                            # ir inst 56 fin
  addi s9, s10, 1                                                       # ir inst 57 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 58 fin
  sw s11, 0(s10)                                                        # ir inst 59 fin
  mv s10, s11                                                           # ir inst 60 fin
  addi s9, s10, 1                                                       # ir inst 61 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 62 fin
  lw s9, 0(s10)                                                         # ir inst 63 fin
# Phi connections
  mv s8, s9
  mv s9, s11
  mv s10, t4
  j .F.mergeLists._20.if.exit.3                                         # ir inst 64 fin
.F.mergeLists._19.if.else.3:
  mv s10, t3                                                            # ir inst 65 fin
  addi s9, s10, 1                                                       # ir inst 66 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 67 fin
  sw t4, 0(s10)                                                         # ir inst 68 fin
  mv s10, t4                                                            # ir inst 69 fin
  addi s9, s10, 1                                                       # ir inst 70 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 71 fin
  lw s9, 0(s10)                                                         # ir inst 72 fin
# Phi connections
  mv s8, s11
  mv s10, s9
  mv s9, t4
  j .F.mergeLists._20.if.exit.3                                         # ir inst 73 fin
.F.mergeLists._20.if.exit.3:
  addi s7, t5, 1                                                        # ir inst 77 fin
# Phi connections
  mv s11, s8
  mv t3, s9
  mv t4, s10
  mv t5, s7
  j .F.mergeLists._10.while.cond.0                                      # ir inst 78 fin
.F.mergeLists._21.while.exit.0:
  li t2, 0
  xor t0, s11, t2
  sltu t5, zero, t0                                                     # ir inst 79 fin
  bnez t5, .F.mergeLists._22.if.then.4
  j .F.mergeLists._23.if.else.4                                         # ir inst 80 fin
.F.mergeLists._22.if.then.4:
  mv t5, t3                                                             # ir inst 81 fin
  addi s10, t5, 1                                                       # ir inst 82 fin
  slli t2, s10, 2
  add t5, a0, t2                                                        # ir inst 83 fin
  sw s11, 0(t5)                                                         # ir inst 84 fin
  j .F.mergeLists._24.if.exit.4                                         # ir inst 85 fin
.F.mergeLists._23.if.else.4:
  mv t5, t3                                                             # ir inst 86 fin
  addi t3, t5, 1                                                        # ir inst 87 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 88 fin
  sw t4, 0(t5)                                                          # ir inst 89 fin
  j .F.mergeLists._24.if.exit.4                                         # ir inst 90 fin
.F.mergeLists._24.if.exit.4:
  mv a0, t6
  j .F.mergeLists.epilogue                                              # ir inst 91 fin
.F.mergeLists.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.verifySorted
.F.verifySorted:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.verifySorted._0.entry.0:
# Phi connections
  mv t5, a1
  li t6, 0
  j .F.verifySorted._1.while.cond.0                                     # ir inst 1 fin
.F.verifySorted._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 4 fin
  bnez t4, .F.verifySorted._2.lazy.then.0
  j .F.verifySorted._3.lazy.else.0                                      # ir inst 5 fin
.F.verifySorted._2.lazy.then.0:
  mv t4, t5                                                             # ir inst 6 fin
  addi t3, t4, 1                                                        # ir inst 7 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  li t2, 0
  xor t0, t3, t2
  sltu t4, zero, t0                                                     # ir inst 10 fin
# Phi connections
  j .F.verifySorted._4.lazy.exit.0                                      # ir inst 11 fin
.F.verifySorted._3.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.verifySorted._4.lazy.exit.0                                      # ir inst 12 fin
.F.verifySorted._4.lazy.exit.0:
  bnez t4, .F.verifySorted._5.lazy.then.1
  j .F.verifySorted._6.lazy.else.1                                      # ir inst 14 fin
.F.verifySorted._5.lazy.then.1:
  li t2, 999
  slt t4, t6, t2                                                        # ir inst 15 fin
# Phi connections
  j .F.verifySorted._7.lazy.exit.1                                      # ir inst 16 fin
.F.verifySorted._6.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.verifySorted._7.lazy.exit.1                                      # ir inst 17 fin
.F.verifySorted._7.lazy.exit.1:
  bnez t4, .F.verifySorted._8.while.body.0
  j .F.verifySorted._13.critical_edge.0                                 # ir inst 19 fin
.F.verifySorted._8.while.body.0:
  mv t4, t5                                                             # ir inst 20 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 21 fin
  lw t4, 0(t3)                                                          # ir inst 22 fin
  mv t3, t5                                                             # ir inst 23 fin
  addi s11, t3, 1                                                       # ir inst 24 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 25 fin
  lw s11, 0(t3)                                                         # ir inst 26 fin
  mv t3, s11                                                            # ir inst 27 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 28 fin
  lw t3, 0(s11)                                                         # ir inst 29 fin
  slt s11, t3, t4                                                       # ir inst 30 fin
  bnez s11, .F.verifySorted._9.if.then.0
  j .F.verifySorted._10.if.else.0                                       # ir inst 31 fin
.F.verifySorted._9.if.then.0:
# Phi connections
  li t6, 0
  j .F.verifySorted._12.while.exit.0                                    # ir inst 32 fin
.F.verifySorted._10.if.else.0:
  j .F.verifySorted._11.if.exit.0                                       # ir inst 33 fin
.F.verifySorted._11.if.exit.0:
  mv t4, t5                                                             # ir inst 34 fin
  addi t5, t4, 1                                                        # ir inst 35 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 36 fin
  lw t5, 0(t4)                                                          # ir inst 37 fin
  addi t4, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t6, t4
  j .F.verifySorted._1.while.cond.0                                     # ir inst 39 fin
.F.verifySorted._12.while.exit.0:
  mv a0, t6
  j .F.verifySorted.epilogue                                            # ir inst 41 fin
.F.verifySorted._13.critical_edge.0:
# Phi connections
  li t6, 1
  j .F.verifySorted._12.while.exit.0                                    # ir inst 42 fin
.F.verifySorted.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testAdvancedListOperations
.F.testAdvancedListOperations:
# spill func args num: 0,             range:     4224(sp) -     4224(sp)
# local var size: 4200,               range:       16(sp) -     4216(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4224
  add sp, sp, t0
  sd ra, 8(sp)
.F.testAdvancedListOperations._0.entry.0:
# Start call preparation
  li a0, 1610
  call printlnInt
# ir inst 5 fin
  addi t1, sp, 176
  addi t6, t1, 0                                                        # ir inst 7 fin
# Phi connections
  li t5, 0
  j .F.testAdvancedListOperations._1.array.cond.0                       # ir inst 8 fin
.F.testAdvancedListOperations._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 10 fin
  bnez t4, .F.testAdvancedListOperations._2.array.body.0
  j .F.testAdvancedListOperations._3.array.exit.0                       # ir inst 11 fin
.F.testAdvancedListOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 13 fin
  addi t4, t5, 1                                                        # ir inst 14 fin
# Phi connections
  mv t5, t4
  j .F.testAdvancedListOperations._1.array.cond.0                       # ir inst 15 fin
.F.testAdvancedListOperations._3.array.exit.0:
  li t1, 4176
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 17 fin
# Phi connections
  li t5, 0
  j .F.testAdvancedListOperations._4.array.cond.1                       # ir inst 18 fin
.F.testAdvancedListOperations._4.array.cond.1:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 20 fin
  bnez t4, .F.testAdvancedListOperations._5.array.body.1
  j .F.testAdvancedListOperations._6.array.exit.1                       # ir inst 21 fin
.F.testAdvancedListOperations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 22 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 23 fin
  addi t4, t5, 1                                                        # ir inst 24 fin
# Phi connections
  mv t5, t4
  j .F.testAdvancedListOperations._4.array.cond.1                       # ir inst 25 fin
.F.testAdvancedListOperations._6.array.exit.1:
# Start call preparation
  addi t1, sp, 176
  mv a0, t1
  call .F.initializeAdvancedMemory
# ir inst 26 fin
# Start call preparation
  li a2, 40
  li t1, 4176
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 27 fin
# Start call preparation
  li a2, 1
  addi t1, sp, 16
  mv a1, t1
  addi t1, sp, 176
  mv a0, t1
  call .F.createMultipleLists
# ir inst 28 fin
# Start call preparation
  li a2, 40
  li t1, 4176
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call memcpy
# ir inst 29 fin
# Start call preparation
  addi t1, sp, 56
  mv a1, t1
  addi t1, sp, 176
  mv a0, t1
  call .F.findListIntersections
  mv t6, a0
# ir inst 30 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 31 fin
# Start call preparation
  li a2, 40
  li t1, 4176
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call memcpy
# ir inst 32 fin
# Start call preparation
  addi t1, sp, 96
  mv a1, t1
  addi t1, sp, 176
  mv a0, t1
  call .F.performListUnions
  mv t6, a0
# ir inst 33 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 34 fin
# Start call preparation
  li a2, 40
  li t1, 4176
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 136
  mv a0, t1
  call memcpy
# ir inst 35 fin
# Start call preparation
  addi t1, sp, 136
  mv a1, t1
  addi t1, sp, 176
  mv a0, t1
  call .F.complexListManipulations
  mv t6, a0
# ir inst 36 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 37 fin
  j .F.testAdvancedListOperations.epilogue                              # ir inst 38 fin
.F.testAdvancedListOperations.epilogue:
  ld ra, 8(sp)
  li t0, 4224
  add sp, sp, t0
  ret

.globl .F.initializeAdvancedMemory
.F.initializeAdvancedMemory:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeAdvancedMemory._0.entry.0:
# Phi connections
  li t6, 1
  j .F.initializeAdvancedMemory._1.while.cond.0                         # ir inst 1 fin
.F.initializeAdvancedMemory._1.while.cond.0:
  li t2, 998
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeAdvancedMemory._2.while.body.0
  j .F.initializeAdvancedMemory._3.while.exit.0                         # ir inst 4 fin
.F.initializeAdvancedMemory._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 10 fin
  addi t4, t6, 2                                                        # ir inst 11 fin
  sw t4, 0(t5)                                                          # ir inst 12 fin
  addi t5, t6, 2                                                        # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F.initializeAdvancedMemory._1.while.cond.0                         # ir inst 14 fin
.F.initializeAdvancedMemory._3.while.exit.0:
  li t6, 3992
  add t6, a0, t6                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  li t6, 3996
  add t6, a0, t6                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 18 fin
  j .F.initializeAdvancedMemory.epilogue                                # ir inst 19 fin
.F.initializeAdvancedMemory.epilogue:
  ret

.globl .F.createMultipleLists
.F.createMultipleLists:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s10, 0(sp)
  sd s8, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
.F.createMultipleLists._0.entry.0:
# Phi connections
  mv t5, a2
  li t6, 0
  j .F.createMultipleLists._1.while.cond.0                              # ir inst 1 fin
.F.createMultipleLists._1.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.createMultipleLists._2.while.body.0
  j .F.createMultipleLists._12.while.exit.0                             # ir inst 5 fin
.F.createMultipleLists._2.while.body.0:
  addi t4, t6, 1                                                        # ir inst 6 fin
  li t2, 5
  mul t3, t4, t2                                                        # ir inst 7 fin
# Phi connections
  mv t4, t5
  li t5, 0
  j .F.createMultipleLists._3.while.cond.1                              # ir inst 8 fin
.F.createMultipleLists._3.while.cond.1:
  slt s11, t5, t3                                                       # ir inst 11 fin
  bnez s11, .F.createMultipleLists._4.lazy.then.0
  j .F.createMultipleLists._5.lazy.else.0                               # ir inst 12 fin
.F.createMultipleLists._4.lazy.then.0:
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 13 fin
# Phi connections
  j .F.createMultipleLists._6.lazy.exit.0                               # ir inst 14 fin
.F.createMultipleLists._5.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.createMultipleLists._6.lazy.exit.0                               # ir inst 15 fin
.F.createMultipleLists._6.lazy.exit.0:
  bnez s11, .F.createMultipleLists._7.lazy.then.1
  j .F.createMultipleLists._8.lazy.else.1                               # ir inst 17 fin
.F.createMultipleLists._7.lazy.then.1:
  li t2, 998
  slt s11, t4, t2                                                       # ir inst 18 fin
# Phi connections
  j .F.createMultipleLists._9.lazy.exit.1                               # ir inst 19 fin
.F.createMultipleLists._8.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.createMultipleLists._9.lazy.exit.1                               # ir inst 20 fin
.F.createMultipleLists._9.lazy.exit.1:
  bnez s11, .F.createMultipleLists._10.while.body.1
  j .F.createMultipleLists._11.while.exit.1                             # ir inst 22 fin
.F.createMultipleLists._10.while.body.1:
  mv s11, t4                                                            # ir inst 23 fin
  addi s10, s11, 1                                                      # ir inst 24 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 25 fin
  lw s10, 0(s11)                                                        # ir inst 26 fin
  li t2, 100
  mul s11, t6, t2                                                       # ir inst 27 fin
  addi s9, t6, 1                                                        # ir inst 28 fin
  mul s8, t5, s9                                                        # ir inst 29 fin
  add s9, s11, s8                                                       # ir inst 30 fin
  mv s11, t4                                                            # ir inst 31 fin
  slli t2, s11, 2
  add s8, a0, t2                                                        # ir inst 32 fin
  sw s9, 0(s8)                                                          # ir inst 33 fin
  mv s11, t4                                                            # ir inst 34 fin
  addi s9, s11, 1                                                       # ir inst 35 fin
  slli t2, s9, 2
  add s11, a0, t2                                                       # ir inst 36 fin
  mv s9, t6                                                             # ir inst 37 fin
  slli t2, s9, 2
  add s8, a1, t2                                                        # ir inst 38 fin
  lw s9, 0(s8)                                                          # ir inst 39 fin
  sw s9, 0(s11)                                                         # ir inst 40 fin
  mv s11, t6                                                            # ir inst 41 fin
  slli t2, s11, 2
  add s9, a1, t2                                                        # ir inst 42 fin
  sw t4, 0(s9)                                                          # ir inst 43 fin
  addi s11, t5, 1                                                       # ir inst 44 fin
# Phi connections
  mv t4, s10
  mv t5, s11
  j .F.createMultipleLists._3.while.cond.1                              # ir inst 45 fin
.F.createMultipleLists._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.createMultipleLists._1.while.cond.0                              # ir inst 47 fin
.F.createMultipleLists._12.while.exit.0:
  j .F.createMultipleLists.epilogue                                     # ir inst 48 fin
.F.createMultipleLists.epilogue:
  ld s10, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.findListIntersections
.F.findListIntersections:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 3 / 12,        range:       48(sp) -       72(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s9, 48(sp)
  sd s11, 56(sp)
  sd s10, 64(sp)
  sd ra, 72(sp)
.F.findListIntersections._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.findListIntersections._1.while.cond.0                            # ir inst 1 fin
.F.findListIntersections._1.while.cond.0:
  li t2, 9
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.findListIntersections._2.while.body.0
  j .F.findListIntersections._6.while.exit.0                            # ir inst 5 fin
.F.findListIntersections._2.while.body.0:
  addi t4, t6, 1                                                        # ir inst 6 fin
# Phi connections
  mv t3, t5
  j .F.findListIntersections._3.while.cond.1                            # ir inst 7 fin
.F.findListIntersections._3.while.cond.1:
  li t2, 10
  slt s11, t4, t2                                                       # ir inst 10 fin
  bnez s11, .F.findListIntersections._4.while.body.1
  j .F.findListIntersections._5.while.exit.1                            # ir inst 11 fin
.F.findListIntersections._4.while.body.1:
  mv s11, t6                                                            # ir inst 12 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 13 fin
  lw s11, 0(s10)                                                        # ir inst 14 fin
  mv s10, t4                                                            # ir inst 15 fin
  slli t2, s10, 2
  add s9, a1, t2                                                        # ir inst 16 fin
  lw s10, 0(s9)                                                         # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, s10
  mv a1, s11
  call .F.countCommonValues
  mv s9, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 18 fin
  add s11, t3, s9                                                       # ir inst 19 fin
  addi s10, t4, 1                                                       # ir inst 20 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.findListIntersections._3.while.cond.1                            # ir inst 21 fin
.F.findListIntersections._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.findListIntersections._1.while.cond.0                            # ir inst 23 fin
.F.findListIntersections._6.while.exit.0:
  mv a0, t5
  j .F.findListIntersections.epilogue                                   # ir inst 24 fin
.F.findListIntersections.epilogue:
  ld ra, 72(sp)
  ld s9, 48(sp)
  ld s11, 56(sp)
  ld s10, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.countCommonValues
.F.countCommonValues:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.countCommonValues._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.countCommonValues._1.while.cond.0                                # ir inst 1 fin
.F.countCommonValues._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.countCommonValues._2.lazy.then.0
  j .F.countCommonValues._3.lazy.else.0                                 # ir inst 6 fin
.F.countCommonValues._2.lazy.then.0:
  li t2, 100
  slt t3, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.countCommonValues._4.lazy.exit.0                                 # ir inst 8 fin
.F.countCommonValues._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.countCommonValues._4.lazy.exit.0                                 # ir inst 9 fin
.F.countCommonValues._4.lazy.exit.0:
  bnez t3, .F.countCommonValues._5.while.body.0
  j .F.countCommonValues._15.while.exit.0                               # ir inst 11 fin
.F.countCommonValues._5.while.body.0:
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
# Phi connections
  mv s10, a2
  li s11, 0
  j .F.countCommonValues._6.while.cond.1                                # ir inst 15 fin
.F.countCommonValues._6.while.cond.1:
  li t2, 0
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 18 fin
  bnez s9, .F.countCommonValues._7.lazy.then.1
  j .F.countCommonValues._8.lazy.else.1                                 # ir inst 19 fin
.F.countCommonValues._7.lazy.then.1:
  li t2, 100
  slt s9, s11, t2                                                       # ir inst 20 fin
# Phi connections
  j .F.countCommonValues._9.lazy.exit.1                                 # ir inst 21 fin
.F.countCommonValues._8.lazy.else.1:
# Phi connections
  li s9, 0
  j .F.countCommonValues._9.lazy.exit.1                                 # ir inst 22 fin
.F.countCommonValues._9.lazy.exit.1:
  bnez s9, .F.countCommonValues._10.while.body.1
  j .F.countCommonValues._16.critical_edge.0                            # ir inst 24 fin
.F.countCommonValues._10.while.body.1:
  mv s9, s10                                                            # ir inst 25 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 26 fin
  lw s9, 0(s8)                                                          # ir inst 27 fin
  xor t0, s9, t3
  sltiu s8, t0, 1                                                       # ir inst 28 fin
  bnez s8, .F.countCommonValues._11.if.then.0
  j .F.countCommonValues._12.if.else.0                                  # ir inst 29 fin
.F.countCommonValues._11.if.then.0:
  addi s9, t4, 1                                                        # ir inst 30 fin
# Phi connections
  mv t3, s9
  j .F.countCommonValues._14.while.exit.1                               # ir inst 31 fin
.F.countCommonValues._12.if.else.0:
  j .F.countCommonValues._13.if.exit.0                                  # ir inst 32 fin
.F.countCommonValues._13.if.exit.0:
  mv s9, s10                                                            # ir inst 33 fin
  addi s10, s9, 1                                                       # ir inst 34 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 35 fin
  lw s10, 0(s9)                                                         # ir inst 36 fin
  addi s9, s11, 1                                                       # ir inst 37 fin
# Phi connections
  mv s11, s9
  j .F.countCommonValues._6.while.cond.1                                # ir inst 38 fin
.F.countCommonValues._14.while.exit.1:
  mv s11, t5                                                            # ir inst 40 fin
  addi s10, s11, 1                                                      # ir inst 41 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 42 fin
  lw s10, 0(s11)                                                        # ir inst 43 fin
  addi s11, t6, 1                                                       # ir inst 44 fin
# Phi connections
  mv t4, t3
  mv t5, s10
  mv t6, s11
  j .F.countCommonValues._1.while.cond.0                                # ir inst 45 fin
.F.countCommonValues._15.while.exit.0:
  mv a0, t4
  j .F.countCommonValues.epilogue                                       # ir inst 46 fin
.F.countCommonValues._16.critical_edge.0:
# Phi connections
  mv t3, t4
  j .F.countCommonValues._14.while.exit.1                               # ir inst 47 fin
.F.countCommonValues.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.performListUnions
.F.performListUnions:
# spill func args num: 0,             range:     2048(sp) -     2048(sp)
# local var size: 2000,               range:       40(sp) -     2040(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -2048
  sd s10, 0(sp)
  sd s11, 8(sp)
  sd s7, 16(sp)
  sd s8, 24(sp)
  sd s9, 32(sp)
.F.performListUnions._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.performListUnions._1.array.cond.0                                # ir inst 3 fin
.F.performListUnions._1.array.cond.0:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.performListUnions._2.array.body.0
  j .F.performListUnions._3.array.exit.0                                # ir inst 6 fin
.F.performListUnions._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.performListUnions._1.array.cond.0                                # ir inst 10 fin
.F.performListUnions._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performListUnions._4.while.cond.0                                # ir inst 11 fin
.F.performListUnions._4.while.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 14 fin
  bnez t4, .F.performListUnions._5.while.body.0
  j .F.performListUnions._24.while.exit.0                               # ir inst 15 fin
.F.performListUnions._5.while.body.0:
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 17 fin
  lw t4, 0(t3)                                                          # ir inst 18 fin
# Phi connections
  li s11, 0
  mv t3, t4
  mv t4, t6
  j .F.performListUnions._6.while.cond.1                                # ir inst 19 fin
.F.performListUnions._6.while.cond.1:
  li t2, 0
  xor t0, t3, t2
  sltu s10, zero, t0                                                    # ir inst 23 fin
  bnez s10, .F.performListUnions._7.lazy.then.0
  j .F.performListUnions._8.lazy.else.0                                 # ir inst 24 fin
.F.performListUnions._7.lazy.then.0:
  li t2, 50
  slt s10, s11, t2                                                      # ir inst 25 fin
# Phi connections
  j .F.performListUnions._9.lazy.exit.0                                 # ir inst 26 fin
.F.performListUnions._8.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.performListUnions._9.lazy.exit.0                                 # ir inst 27 fin
.F.performListUnions._9.lazy.exit.0:
  bnez s10, .F.performListUnions._10.while.body.1
  j .F.performListUnions._23.while.exit.1                               # ir inst 29 fin
.F.performListUnions._10.while.body.1:
  mv s10, t3                                                            # ir inst 30 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 31 fin
  lw s10, 0(s9)                                                         # ir inst 32 fin
# Phi connections
  li s9, 0
  j .F.performListUnions._11.while.cond.2                               # ir inst 33 fin
.F.performListUnions._11.while.cond.2:
  slt s8, s9, t4                                                        # ir inst 35 fin
  bnez s8, .F.performListUnions._12.while.body.2
  j .F.performListUnions._25.critical_edge.0                            # ir inst 36 fin
.F.performListUnions._12.while.body.2:
  mv s8, s9                                                             # ir inst 37 fin
  slli t2, s8, 2
  addi t1, sp, 40
  add s7, t1, t2                                                        # ir inst 38 fin
  lw s8, 0(s7)                                                          # ir inst 39 fin
  xor t0, s8, s10
  sltiu s7, t0, 1                                                       # ir inst 40 fin
  bnez s7, .F.performListUnions._13.if.then.0
  j .F.performListUnions._14.if.else.0                                  # ir inst 41 fin
.F.performListUnions._13.if.then.0:
# Phi connections
  li s9, 1
  j .F.performListUnions._16.while.exit.2                               # ir inst 42 fin
.F.performListUnions._14.if.else.0:
  j .F.performListUnions._15.if.exit.0                                  # ir inst 43 fin
.F.performListUnions._15.if.exit.0:
  addi s8, s9, 1                                                        # ir inst 44 fin
# Phi connections
  mv s9, s8
  j .F.performListUnions._11.while.cond.2                               # ir inst 45 fin
.F.performListUnions._16.while.exit.2:
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 47 fin
  bnez s8, .F.performListUnions._17.lazy.then.1
  j .F.performListUnions._18.lazy.else.1                                # ir inst 48 fin
.F.performListUnions._17.lazy.then.1:
  li t2, 500
  slt s9, t4, t2                                                        # ir inst 49 fin
# Phi connections
  j .F.performListUnions._19.lazy.exit.1                                # ir inst 50 fin
.F.performListUnions._18.lazy.else.1:
# Phi connections
  li s9, 0
  j .F.performListUnions._19.lazy.exit.1                                # ir inst 51 fin
.F.performListUnions._19.lazy.exit.1:
  bnez s9, .F.performListUnions._20.if.then.1
  j .F.performListUnions._21.if.else.1                                  # ir inst 53 fin
.F.performListUnions._20.if.then.1:
  mv s9, t4                                                             # ir inst 54 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 55 fin
  sw s10, 0(s8)                                                         # ir inst 56 fin
  addi s9, t4, 1                                                        # ir inst 57 fin
# Phi connections
  j .F.performListUnions._22.if.exit.1                                  # ir inst 58 fin
.F.performListUnions._21.if.else.1:
# Phi connections
  mv s9, t4
  j .F.performListUnions._22.if.exit.1                                  # ir inst 59 fin
.F.performListUnions._22.if.exit.1:
  mv s8, t3                                                             # ir inst 61 fin
  addi s7, s8, 1                                                        # ir inst 62 fin
  slli t2, s7, 2
  add s8, a0, t2                                                        # ir inst 63 fin
  lw s7, 0(s8)                                                          # ir inst 64 fin
  addi s8, s11, 1                                                       # ir inst 65 fin
# Phi connections
  mv s11, s8
  mv t3, s7
  mv t4, s9
  j .F.performListUnions._6.while.cond.1                                # ir inst 66 fin
.F.performListUnions._23.while.exit.1:
  addi s9, t5, 1                                                        # ir inst 67 fin
# Phi connections
  mv t5, s9
  mv t6, t4
  j .F.performListUnions._4.while.cond.0                                # ir inst 68 fin
.F.performListUnions._24.while.exit.0:
  mv a0, t6
  j .F.performListUnions.epilogue                                       # ir inst 69 fin
.F.performListUnions._25.critical_edge.0:
# Phi connections
  li s9, 0
  j .F.performListUnions._16.while.exit.2                               # ir inst 70 fin
.F.performListUnions.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  ld s7, 16(sp)
  ld s8, 24(sp)
  ld s9, 32(sp)
  li t0, 2048
  add sp, sp, t0
  ret

.globl .F.complexListManipulations
.F.complexListManipulations:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 40,                 range:       64(sp) -      104(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.complexListManipulations._0.entry.0:
# Phi connections
  li t6, 0
  j .F.complexListManipulations._1.while.cond.0                         # ir inst 2 fin
.F.complexListManipulations._1.while.cond.0:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 4 fin
  bnez t5, .F.complexListManipulations._2.while.body.0
  j .F.complexListManipulations._3.while.exit.0                         # ir inst 5 fin
.F.complexListManipulations._2.while.body.0:
  addi t5, t6, 1                                                        # ir inst 6 fin
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 8 fin
  mv t4, t6                                                             # ir inst 9 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 10 fin
  lw t4, 0(s11)                                                         # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t5
  mv a1, t4
  call .F.rotateList
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 12 fin
  sw s11, 0(t3)                                                         # ir inst 13 fin
  addi t5, t6, 1                                                        # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.complexListManipulations._1.while.cond.0                         # ir inst 15 fin
.F.complexListManipulations._3.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 10
  j .F.complexListManipulations._4.while.cond.1                         # ir inst 16 fin
.F.complexListManipulations._4.while.cond.1:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 19 fin
  bnez t4, .F.complexListManipulations._5.while.body.1
  j .F.complexListManipulations._6.while.exit.1                         # ir inst 20 fin
.F.complexListManipulations._5.while.body.1:
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  call .F.removeDuplicates
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 24 fin
  add t4, t6, t3                                                        # ir inst 25 fin
  addi t3, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.complexListManipulations._4.while.cond.1                         # ir inst 27 fin
.F.complexListManipulations._6.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a2, 40
  addi t1, sp, 64
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 28 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 64
  mv a1, t1
  call .F.interleaveLists
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 29 fin
  add t4, t6, t5                                                        # ir inst 30 fin
  mv a0, t4
  j .F.complexListManipulations.epilogue                                # ir inst 31 fin
.F.complexListManipulations.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 112
  ret

.globl .F.rotateList
.F.rotateList:
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
.F.rotateList._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.rotateList._1.lazy.then.0
  j .F.rotateList._2.lazy.else.0                                        # ir inst 2 fin
.F.rotateList._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.rotateList._3.lazy.exit.0                                        # ir inst 3 fin
.F.rotateList._2.lazy.else.0:
  li t2, 0
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.rotateList._3.lazy.exit.0                                        # ir inst 5 fin
.F.rotateList._3.lazy.exit.0:
  bnez t6, .F.rotateList._4.if.then.0
  j .F.rotateList._5.if.else.0                                          # ir inst 7 fin
.F.rotateList._4.if.then.0:
  mv a0, a1
  j .F.rotateList.epilogue                                              # ir inst 8 fin
.F.rotateList._5.if.else.0:
  j .F.rotateList._6.if.exit.0                                          # ir inst 9 fin
.F.rotateList._6.if.exit.0:
# Phi connections
  mv t5, a1
  li t6, 1
  j .F.rotateList._7.while.cond.0                                       # ir inst 10 fin
.F.rotateList._7.while.cond.0:
  mv t4, t5                                                             # ir inst 13 fin
  addi t3, t4, 1                                                        # ir inst 14 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  lw t3, 0(t4)                                                          # ir inst 16 fin
  li t2, 0
  xor t0, t3, t2
  sltu t4, zero, t0                                                     # ir inst 17 fin
  bnez t4, .F.rotateList._8.lazy.then.1
  j .F.rotateList._9.lazy.else.1                                        # ir inst 18 fin
.F.rotateList._8.lazy.then.1:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 19 fin
# Phi connections
  j .F.rotateList._10.lazy.exit.1                                       # ir inst 20 fin
.F.rotateList._9.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.rotateList._10.lazy.exit.1                                       # ir inst 21 fin
.F.rotateList._10.lazy.exit.1:
  bnez t4, .F.rotateList._11.while.body.0
  j .F.rotateList._12.while.exit.0                                      # ir inst 23 fin
.F.rotateList._11.while.body.0:
  mv t4, t5                                                             # ir inst 24 fin
  addi t3, t4, 1                                                        # ir inst 25 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 26 fin
  lw t3, 0(t4)                                                          # ir inst 27 fin
  addi t4, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.rotateList._7.while.cond.0                                       # ir inst 29 fin
.F.rotateList._12.while.exit.0:
  rem t4, a2, t6                                                        # ir inst 30 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 31 fin
  bnez t3, .F.rotateList._13.if.then.1
  j .F.rotateList._14.if.else.1                                         # ir inst 32 fin
.F.rotateList._13.if.then.1:
  mv a0, a1
  j .F.rotateList.epilogue                                              # ir inst 33 fin
.F.rotateList._14.if.else.1:
  j .F.rotateList._15.if.exit.1                                         # ir inst 34 fin
.F.rotateList._15.if.exit.1:
# Phi connections
  mv s11, a1
  li t3, 0
  j .F.rotateList._16.while.cond.1                                      # ir inst 35 fin
.F.rotateList._16.while.cond.1:
  sub s10, t6, t4                                                       # ir inst 38 fin
  addi s9, s10, -1                                                      # ir inst 39 fin
  slt s10, t3, s9                                                       # ir inst 40 fin
  bnez s10, .F.rotateList._17.lazy.then.2
  j .F.rotateList._18.lazy.else.2                                       # ir inst 41 fin
.F.rotateList._17.lazy.then.2:
  mv s10, s11                                                           # ir inst 42 fin
  addi s9, s10, 1                                                       # ir inst 43 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 44 fin
  lw s9, 0(s10)                                                         # ir inst 45 fin
  li t2, 0
  xor t0, s9, t2
  sltu s10, zero, t0                                                    # ir inst 46 fin
# Phi connections
  j .F.rotateList._19.lazy.exit.2                                       # ir inst 47 fin
.F.rotateList._18.lazy.else.2:
# Phi connections
  li s10, 0
  j .F.rotateList._19.lazy.exit.2                                       # ir inst 48 fin
.F.rotateList._19.lazy.exit.2:
  bnez s10, .F.rotateList._20.while.body.1
  j .F.rotateList._21.while.exit.1                                      # ir inst 50 fin
.F.rotateList._20.while.body.1:
  mv s10, s11                                                           # ir inst 51 fin
  addi s9, s10, 1                                                       # ir inst 52 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 53 fin
  lw s9, 0(s10)                                                         # ir inst 54 fin
  addi s10, t3, 1                                                       # ir inst 55 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  j .F.rotateList._16.while.cond.1                                      # ir inst 56 fin
.F.rotateList._21.while.exit.1:
  mv t6, s11                                                            # ir inst 57 fin
  addi t4, t6, 1                                                        # ir inst 58 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 59 fin
  lw t4, 0(t6)                                                          # ir inst 60 fin
  mv t6, s11                                                            # ir inst 61 fin
  addi t3, t6, 1                                                        # ir inst 62 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 63 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 64 fin
  mv t6, t5                                                             # ir inst 65 fin
  addi t5, t6, 1                                                        # ir inst 66 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 67 fin
  sw a1, 0(t6)                                                          # ir inst 68 fin
  mv a0, t4
  j .F.rotateList.epilogue                                              # ir inst 69 fin
.F.rotateList.epilogue:
  ld s11, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.removeDuplicates
.F.removeDuplicates:
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
.F.removeDuplicates._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.removeDuplicates._1.while.cond.0                                 # ir inst 1 fin
.F.removeDuplicates._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.removeDuplicates._2.lazy.then.0
  j .F.removeDuplicates._3.lazy.else.0                                  # ir inst 6 fin
.F.removeDuplicates._2.lazy.then.0:
  mv t3, t5                                                             # ir inst 7 fin
  addi s11, t3, 1                                                       # ir inst 8 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  lw s11, 0(t3)                                                         # ir inst 10 fin
  li t2, 0
  xor t0, s11, t2
  sltu t3, zero, t0                                                     # ir inst 11 fin
# Phi connections
  j .F.removeDuplicates._4.lazy.exit.0                                  # ir inst 12 fin
.F.removeDuplicates._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.removeDuplicates._4.lazy.exit.0                                  # ir inst 13 fin
.F.removeDuplicates._4.lazy.exit.0:
  bnez t3, .F.removeDuplicates._5.lazy.then.1
  j .F.removeDuplicates._6.lazy.else.1                                  # ir inst 15 fin
.F.removeDuplicates._5.lazy.then.1:
  li t2, 100
  slt t3, t6, t2                                                        # ir inst 16 fin
# Phi connections
  j .F.removeDuplicates._7.lazy.exit.1                                  # ir inst 17 fin
.F.removeDuplicates._6.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.removeDuplicates._7.lazy.exit.1                                  # ir inst 18 fin
.F.removeDuplicates._7.lazy.exit.1:
  bnez t3, .F.removeDuplicates._8.while.body.0
  j .F.removeDuplicates._12.while.exit.0                                # ir inst 20 fin
.F.removeDuplicates._8.while.body.0:
  mv t3, t5                                                             # ir inst 21 fin
  addi s11, t3, 1                                                       # ir inst 22 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  lw s11, 0(t3)                                                         # ir inst 24 fin
  mv t3, t5                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 26 fin
  lw t3, 0(s10)                                                         # ir inst 27 fin
  mv s10, s11                                                           # ir inst 28 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 29 fin
  lw s10, 0(s9)                                                         # ir inst 30 fin
  xor t0, t3, s10
  sltiu s9, t0, 1                                                       # ir inst 31 fin
  bnez s9, .F.removeDuplicates._9.if.then.0
  j .F.removeDuplicates._10.if.else.0                                   # ir inst 32 fin
.F.removeDuplicates._9.if.then.0:
  mv t3, t5                                                             # ir inst 33 fin
  addi s10, t3, 1                                                       # ir inst 34 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 35 fin
  mv s10, s11                                                           # ir inst 36 fin
  addi s11, s10, 1                                                      # ir inst 37 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 38 fin
  lw s11, 0(s10)                                                        # ir inst 39 fin
  sw s11, 0(t3)                                                         # ir inst 40 fin
  addi t3, t4, 1                                                        # ir inst 41 fin
# Phi connections
  j .F.removeDuplicates._11.if.exit.0                                   # ir inst 42 fin
.F.removeDuplicates._10.if.else.0:
  mv t3, t5                                                             # ir inst 43 fin
  addi t5, t3, 1                                                        # ir inst 44 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 45 fin
  lw t5, 0(t3)                                                          # ir inst 46 fin
# Phi connections
  mv t3, t4
  j .F.removeDuplicates._11.if.exit.0                                   # ir inst 47 fin
.F.removeDuplicates._11.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 50 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.removeDuplicates._1.while.cond.0                                 # ir inst 51 fin
.F.removeDuplicates._12.while.exit.0:
  mv a0, t4
  j .F.removeDuplicates.epilogue                                        # ir inst 52 fin
.F.removeDuplicates.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.interleaveLists
.F.interleaveLists:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 40,                 range:       40(sp) -       80(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 0(sp)
  sd s8, 8(sp)
  sd s7, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
.F.interleaveLists._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.interleaveLists._1.array.cond.0                                  # ir inst 3 fin
.F.interleaveLists._1.array.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.interleaveLists._2.array.body.0
  j .F.interleaveLists._3.array.exit.0                                  # ir inst 6 fin
.F.interleaveLists._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.interleaveLists._1.array.cond.0                                  # ir inst 10 fin
.F.interleaveLists._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.interleaveLists._4.while.cond.0                                  # ir inst 11 fin
.F.interleaveLists._4.while.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 14 fin
  bnez t4, .F.interleaveLists._5.while.body.0
  j .F.interleaveLists._9.while.exit.0                                  # ir inst 15 fin
.F.interleaveLists._5.while.body.0:
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 17 fin
  lw t4, 0(t3)                                                          # ir inst 18 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 19 fin
  bnez t3, .F.interleaveLists._6.if.then.0
  j .F.interleaveLists._7.if.else.0                                     # ir inst 20 fin
.F.interleaveLists._6.if.then.0:
  mv t4, t6                                                             # ir inst 21 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 22 fin
  mv t4, t5                                                             # ir inst 23 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 24 fin
  lw t4, 0(s11)                                                         # ir inst 25 fin
  sw t4, 0(t3)                                                          # ir inst 26 fin
  addi t4, t6, 1                                                        # ir inst 27 fin
# Phi connections
  j .F.interleaveLists._8.if.exit.0                                     # ir inst 28 fin
.F.interleaveLists._7.if.else.0:
# Phi connections
  mv t4, t6
  j .F.interleaveLists._8.if.exit.0                                     # ir inst 29 fin
.F.interleaveLists._8.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 31 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.interleaveLists._4.while.cond.0                                  # ir inst 32 fin
.F.interleaveLists._9.while.exit.0:
# Phi connections
  li t5, 0
  j .F.interleaveLists._10.while.cond.1                                 # ir inst 33 fin
.F.interleaveLists._10.while.cond.1:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 36 fin
  bnez t4, .F.interleaveLists._11.lazy.then.0
  j .F.interleaveLists._12.lazy.else.0                                  # ir inst 37 fin
.F.interleaveLists._11.lazy.then.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 38 fin
# Phi connections
  j .F.interleaveLists._13.lazy.exit.0                                  # ir inst 39 fin
.F.interleaveLists._12.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.interleaveLists._13.lazy.exit.0                                  # ir inst 40 fin
.F.interleaveLists._13.lazy.exit.0:
  bnez t4, .F.interleaveLists._14.while.body.1
  j .F.interleaveLists._24.while.exit.1                                 # ir inst 42 fin
.F.interleaveLists._14.while.body.1:
# Phi connections
  li s11, 0
  li t3, 0
  mv t4, t5
  j .F.interleaveLists._15.while.cond.2                                 # ir inst 43 fin
.F.interleaveLists._15.while.cond.2:
  slt s10, t3, t6                                                       # ir inst 47 fin
  bnez s10, .F.interleaveLists._16.while.body.2
  j .F.interleaveLists._23.while.exit.2                                 # ir inst 48 fin
.F.interleaveLists._16.while.body.2:
  mv s10, t3                                                            # ir inst 49 fin
  slli t2, s10, 2
  addi t1, sp, 40
  add s9, t1, t2                                                        # ir inst 50 fin
  lw s10, 0(s9)                                                         # ir inst 51 fin
  li t2, 0
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 52 fin
  bnez s9, .F.interleaveLists._17.if.then.1
  j .F.interleaveLists._21.if.else.1                                    # ir inst 53 fin
.F.interleaveLists._17.if.then.1:
  addi s10, t4, 1                                                       # ir inst 54 fin
  mv s9, t3                                                             # ir inst 55 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 56 fin
  mv s9, t3                                                             # ir inst 57 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s7, t1, t2                                                        # ir inst 58 fin
  lw s9, 0(s7)                                                          # ir inst 59 fin
  addi s7, s9, 1                                                        # ir inst 60 fin
  mv s9, s7                                                             # ir inst 61 fin
  slli t2, s9, 2
  add s7, a0, t2                                                        # ir inst 62 fin
  lw s9, 0(s7)                                                          # ir inst 63 fin
  sw s9, 0(s8)                                                          # ir inst 64 fin
  mv s9, t3                                                             # ir inst 65 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 66 fin
  lw s9, 0(s8)                                                          # ir inst 67 fin
  li t2, 0
  xor t0, s9, t2
  sltu s8, zero, t0                                                     # ir inst 68 fin
  bnez s8, .F.interleaveLists._18.if.then.2
  j .F.interleaveLists._19.if.else.2                                    # ir inst 69 fin
.F.interleaveLists._18.if.then.2:
  mv s9, s11                                                            # ir inst 70 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 71 fin
  mv s9, t3                                                             # ir inst 72 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s7, t1, t2                                                        # ir inst 73 fin
  lw s9, 0(s7)                                                          # ir inst 74 fin
  sw s9, 0(s8)                                                          # ir inst 75 fin
  addi s9, s11, 1                                                       # ir inst 76 fin
# Phi connections
  j .F.interleaveLists._20.if.exit.2                                    # ir inst 77 fin
.F.interleaveLists._19.if.else.2:
# Phi connections
  mv s9, s11
  j .F.interleaveLists._20.if.exit.2                                    # ir inst 78 fin
.F.interleaveLists._20.if.exit.2:
# Phi connections
  j .F.interleaveLists._22.if.exit.1                                    # ir inst 80 fin
.F.interleaveLists._21.if.else.1:
# Phi connections
  mv s9, s11
  mv s10, t4
  j .F.interleaveLists._22.if.exit.1                                    # ir inst 81 fin
.F.interleaveLists._22.if.exit.1:
  addi s8, t3, 1                                                        # ir inst 84 fin
# Phi connections
  mv s11, s9
  mv t3, s8
  mv t4, s10
  j .F.interleaveLists._15.while.cond.2                                 # ir inst 85 fin
.F.interleaveLists._23.while.exit.2:
# Phi connections
  mv t5, t4
  mv t6, s11
  j .F.interleaveLists._10.while.cond.1                                 # ir inst 86 fin
.F.interleaveLists._24.while.exit.1:
  mv a0, t5
  j .F.interleaveLists.epilogue                                         # ir inst 87 fin
.F.interleaveLists.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s7, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  addi sp, sp, 80
  ret

.globl .F.performListPerformanceTest
.F.performListPerformanceTest:
# spill func args num: 0,             range:     7264(sp) -     7264(sp)
# local var size: 7200,               range:       56(sp) -     7256(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -7264
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.performListPerformanceTest._0.entry.0:
# Start call preparation
  li a0, 1620
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performListPerformanceTest._1.array.cond.0                       # ir inst 4 fin
.F.performListPerformanceTest._1.array.cond.0:
  li t2, 1800
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performListPerformanceTest._2.array.body.0
  j .F.performListPerformanceTest._3.array.exit.0                       # ir inst 7 fin
.F.performListPerformanceTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performListPerformanceTest._1.array.cond.0                       # ir inst 11 fin
.F.performListPerformanceTest._3.array.exit.0:
# Phi connections
  li t5, 1
  li t6, 0
  j .F.performListPerformanceTest._4.while.cond.0                       # ir inst 12 fin
.F.performListPerformanceTest._4.while.cond.0:
  li t2, 800
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 15 fin
  bnez t4, .F.performListPerformanceTest._5.lazy.then.0
  j .F.performListPerformanceTest._6.lazy.else.0                        # ir inst 16 fin
.F.performListPerformanceTest._5.lazy.then.0:
  slli t4, t5, 1                                                        # ir inst 17 fin
  li t2, 1800
  slt t3, t4, t2                                                        # ir inst 18 fin
# Phi connections
  mv t4, t3
  j .F.performListPerformanceTest._7.lazy.exit.0                        # ir inst 19 fin
.F.performListPerformanceTest._6.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performListPerformanceTest._7.lazy.exit.0                        # ir inst 20 fin
.F.performListPerformanceTest._7.lazy.exit.0:
  bnez t4, .F.performListPerformanceTest._8.while.body.0
  j .F.performListPerformanceTest._9.while.exit.0                       # ir inst 22 fin
.F.performListPerformanceTest._8.while.body.0:
  slli t4, t5, 1                                                        # ir inst 23 fin
  mv t3, t4                                                             # ir inst 24 fin
  slli t2, t3, 2
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 25 fin
  mul t3, t5, t5                                                        # ir inst 26 fin
  li t2, 10000
  rem s10, t3, t2                                                       # ir inst 27 fin
  sw s10, 0(s11)                                                        # ir inst 28 fin
  mv t3, t4                                                             # ir inst 29 fin
  addi s11, t3, 1                                                       # ir inst 30 fin
  slli t2, s11, 2
  addi t1, sp, 56
  add t3, t1, t2                                                        # ir inst 31 fin
  sw t6, 0(t3)                                                          # ir inst 32 fin
  addi t3, t5, 1                                                        # ir inst 33 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performListPerformanceTest._4.while.cond.0                       # ir inst 34 fin
.F.performListPerformanceTest._9.while.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  j .F.performListPerformanceTest._10.while.cond.1                      # ir inst 35 fin
.F.performListPerformanceTest._10.while.cond.1:
  li t2, 5
  slt t3, t5, t2                                                        # ir inst 38 fin
  bnez t3, .F.performListPerformanceTest._11.while.body.1
  j .F.performListPerformanceTest._12.while.exit.1                      # ir inst 39 fin
.F.performListPerformanceTest._11.while.body.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t5
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.stressTraversal
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 40 fin
  add s11, t4, t3                                                       # ir inst 41 fin
  addi t3, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.performListPerformanceTest._10.while.cond.1                      # ir inst 43 fin
.F.performListPerformanceTest._12.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 44 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.stressModifications
  mv t5, a0
  ld t6, 0(sp)
# ir inst 45 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 46 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.stressPatternSearch
  mv t5, a0
  ld t6, 0(sp)
# ir inst 47 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 48 fin
  j .F.performListPerformanceTest.epilogue                              # ir inst 49 fin
.F.performListPerformanceTest.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 7264
  add sp, sp, t0
  ret

.globl .F.stressTraversal
.F.stressTraversal:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.stressTraversal._0.entry.0:
  addi t6, a2, 1                                                        # ir inst 1 fin
# Phi connections
  li t3, 0
  mv t4, a1
  li t5, 0
  j .F.stressTraversal._1.while.cond.0                                  # ir inst 2 fin
.F.stressTraversal._1.while.cond.0:
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 6 fin
  bnez s11, .F.stressTraversal._2.lazy.then.0
  j .F.stressTraversal._3.lazy.else.0                                   # ir inst 7 fin
.F.stressTraversal._2.lazy.then.0:
  li t2, 800
  slt s11, t5, t2                                                       # ir inst 8 fin
# Phi connections
  j .F.stressTraversal._4.lazy.exit.0                                   # ir inst 9 fin
.F.stressTraversal._3.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.stressTraversal._4.lazy.exit.0                                   # ir inst 10 fin
.F.stressTraversal._4.lazy.exit.0:
  bnez s11, .F.stressTraversal._5.while.body.0
  j .F.stressTraversal._9.while.exit.0                                  # ir inst 12 fin
.F.stressTraversal._5.while.body.0:
  rem s11, t5, t6                                                       # ir inst 13 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 14 fin
  bnez s10, .F.stressTraversal._6.if.then.0
  j .F.stressTraversal._7.if.else.0                                     # ir inst 15 fin
.F.stressTraversal._6.if.then.0:
  mv s11, t4                                                            # ir inst 16 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 17 fin
  lw s11, 0(s10)                                                        # ir inst 18 fin
  add s10, t3, s11                                                      # ir inst 19 fin
# Phi connections
  mv s11, s10
  j .F.stressTraversal._8.if.exit.0                                     # ir inst 20 fin
.F.stressTraversal._7.if.else.0:
# Phi connections
  mv s11, t3
  j .F.stressTraversal._8.if.exit.0                                     # ir inst 21 fin
.F.stressTraversal._8.if.exit.0:
  mv s10, t4                                                            # ir inst 23 fin
  addi t4, s10, 1                                                       # ir inst 24 fin
  slli t2, t4, 2
  add s10, a0, t2                                                       # ir inst 25 fin
  lw t4, 0(s10)                                                         # ir inst 26 fin
  addi s10, t5, 1                                                       # ir inst 27 fin
# Phi connections
  mv t3, s11
  mv t5, s10
  j .F.stressTraversal._1.while.cond.0                                  # ir inst 28 fin
.F.stressTraversal._9.while.exit.0:
  li t2, 100000
  rem t6, t3, t2                                                        # ir inst 29 fin
  mv a0, t6
  j .F.stressTraversal.epilogue                                         # ir inst 30 fin
.F.stressTraversal.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.stressModifications
.F.stressModifications:
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
.F.stressModifications._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.stressModifications._1.while.cond.0                              # ir inst 1 fin
.F.stressModifications._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.stressModifications._2.lazy.then.0
  j .F.stressModifications._3.lazy.else.0                               # ir inst 6 fin
.F.stressModifications._2.lazy.then.0:
  li t2, 400
  slt t3, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.stressModifications._4.lazy.exit.0                               # ir inst 8 fin
.F.stressModifications._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.stressModifications._4.lazy.exit.0                               # ir inst 9 fin
.F.stressModifications._4.lazy.exit.0:
  bnez t3, .F.stressModifications._5.while.body.0
  j .F.stressModifications._9.while.exit.0                              # ir inst 11 fin
.F.stressModifications._5.while.body.0:
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  li t2, 3
  mul s11, t3, t2                                                       # ir inst 15 fin
  li t2, 7
  mul s10, t6, t2                                                       # ir inst 16 fin
  add s9, s11, s10                                                      # ir inst 17 fin
  li t2, 1000
  rem s11, s9, t2                                                       # ir inst 18 fin
  mv s10, t5                                                            # ir inst 19 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 20 fin
  sw s11, 0(s9)                                                         # ir inst 21 fin
  slt s10, t3, s11                                                      # ir inst 22 fin
  bnez s10, .F.stressModifications._6.if.then.0
  j .F.stressModifications._7.if.else.0                                 # ir inst 23 fin
.F.stressModifications._6.if.then.0:
  addi t3, t4, 1                                                        # ir inst 24 fin
# Phi connections
  j .F.stressModifications._8.if.exit.0                                 # ir inst 25 fin
.F.stressModifications._7.if.else.0:
# Phi connections
  mv t3, t4
  j .F.stressModifications._8.if.exit.0                                 # ir inst 26 fin
.F.stressModifications._8.if.exit.0:
  mv s11, t5                                                            # ir inst 28 fin
  addi t5, s11, 1                                                       # ir inst 29 fin
  slli t2, t5, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  lw t5, 0(s11)                                                         # ir inst 31 fin
  addi s11, t6, 1                                                       # ir inst 32 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.stressModifications._1.while.cond.0                              # ir inst 33 fin
.F.stressModifications._9.while.exit.0:
  mv a0, t4
  j .F.stressModifications.epilogue                                     # ir inst 34 fin
.F.stressModifications.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.stressPatternSearch
.F.stressPatternSearch:
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
.F.stressPatternSearch._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.stressPatternSearch._1.while.cond.0                              # ir inst 1 fin
.F.stressPatternSearch._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.stressPatternSearch._2.lazy.then.0
  j .F.stressPatternSearch._3.lazy.else.0                               # ir inst 6 fin
.F.stressPatternSearch._2.lazy.then.0:
  li t2, 600
  slt t3, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.stressPatternSearch._4.lazy.exit.0                               # ir inst 8 fin
.F.stressPatternSearch._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.stressPatternSearch._4.lazy.exit.0                               # ir inst 9 fin
.F.stressPatternSearch._4.lazy.exit.0:
  bnez t3, .F.stressPatternSearch._5.while.body.0
  j .F.stressPatternSearch._18.while.exit.0                             # ir inst 11 fin
.F.stressPatternSearch._5.while.body.0:
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  li t2, 7
  rem s11, t3, t2                                                       # ir inst 15 fin
  li t2, 3
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 16 fin
  bnez s10, .F.stressPatternSearch._6.if.then.0
  j .F.stressPatternSearch._7.if.else.0                                 # ir inst 17 fin
.F.stressPatternSearch._6.if.then.0:
  addi s11, t4, 1                                                       # ir inst 18 fin
# Phi connections
  j .F.stressPatternSearch._8.if.exit.0                                 # ir inst 19 fin
.F.stressPatternSearch._7.if.else.0:
# Phi connections
  mv s11, t4
  j .F.stressPatternSearch._8.if.exit.0                                 # ir inst 20 fin
.F.stressPatternSearch._8.if.exit.0:
  li t2, 100
  slt s10, t2, t3                                                       # ir inst 22 fin
  bnez s10, .F.stressPatternSearch._9.lazy.then.1
  j .F.stressPatternSearch._10.lazy.else.1                              # ir inst 23 fin
.F.stressPatternSearch._9.lazy.then.1:
  li t2, 500
  slt s10, t3, t2                                                       # ir inst 24 fin
# Phi connections
  j .F.stressPatternSearch._11.lazy.exit.1                              # ir inst 25 fin
.F.stressPatternSearch._10.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.stressPatternSearch._11.lazy.exit.1                              # ir inst 26 fin
.F.stressPatternSearch._11.lazy.exit.1:
  bnez s10, .F.stressPatternSearch._12.if.then.1
  j .F.stressPatternSearch._13.if.else.1                                # ir inst 28 fin
.F.stressPatternSearch._12.if.then.1:
  addi s10, s11, 2                                                      # ir inst 29 fin
# Phi connections
  mv s11, s10
  j .F.stressPatternSearch._14.if.exit.1                                # ir inst 30 fin
.F.stressPatternSearch._13.if.else.1:
# Phi connections
  j .F.stressPatternSearch._14.if.exit.1                                # ir inst 31 fin
.F.stressPatternSearch._14.if.exit.1:
  li t2, 10
  rem s10, t6, t2                                                       # ir inst 33 fin
  li t2, 10
  rem s9, t3, t2                                                        # ir inst 34 fin
  xor t0, s10, s9
  sltiu t3, t0, 1                                                       # ir inst 35 fin
  bnez t3, .F.stressPatternSearch._15.if.then.2
  j .F.stressPatternSearch._16.if.else.2                                # ir inst 36 fin
.F.stressPatternSearch._15.if.then.2:
  addi t3, s11, 3                                                       # ir inst 37 fin
# Phi connections
  j .F.stressPatternSearch._17.if.exit.2                                # ir inst 38 fin
.F.stressPatternSearch._16.if.else.2:
# Phi connections
  mv t3, s11
  j .F.stressPatternSearch._17.if.exit.2                                # ir inst 39 fin
.F.stressPatternSearch._17.if.exit.2:
  mv s11, t5                                                            # ir inst 41 fin
  addi t5, s11, 1                                                       # ir inst 42 fin
  slli t2, t5, 2
  add s11, a0, t2                                                       # ir inst 43 fin
  lw t5, 0(s11)                                                         # ir inst 44 fin
  addi s11, t6, 1                                                       # ir inst 45 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.stressPatternSearch._1.while.cond.0                              # ir inst 46 fin
.F.stressPatternSearch._18.while.exit.0:
  mv a0, t4
  j .F.stressPatternSearch.epilogue                                     # ir inst 47 fin
.F.stressPatternSearch.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testEdgeCases
.F.testEdgeCases:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
.F.testEdgeCases._0.entry.0:
# Start call preparation
  li a0, 1630
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testEmptyListOperations
# ir inst 2 fin
# Start call preparation
  call .F.testSingleNodeOperations
# ir inst 3 fin
# Start call preparation
  call .F.testMemoryBoundaries
# ir inst 4 fin
# Start call preparation
  call .F.testCircularListDetection
# ir inst 5 fin
# Start call preparation
  li a0, 1639
  call printlnInt
# ir inst 6 fin
  j .F.testEdgeCases.epilogue                                           # ir inst 7 fin
.F.testEdgeCases.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testEmptyListOperations
.F.testEmptyListOperations:
# spill func args num: 0,             range:     8016(sp) -     8016(sp)
# local var size: 8000,               range:       16(sp) -     8016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testEmptyListOperations._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testEmptyListOperations._1.array.cond.0                          # ir inst 3 fin
.F.testEmptyListOperations._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testEmptyListOperations._2.array.body.0
  j .F.testEmptyListOperations._3.array.exit.0                          # ir inst 6 fin
.F.testEmptyListOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testEmptyListOperations._1.array.cond.0                          # ir inst 10 fin
.F.testEmptyListOperations._3.array.exit.0:
# Start call preparation
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.calculateListSum
  mv t6, a0
# ir inst 11 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 12 fin
# Start call preparation
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.reverseList
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.complexListSearch
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
  j .F.testEmptyListOperations.epilogue                                 # ir inst 17 fin
.F.testEmptyListOperations.epilogue:
  ld ra, 8(sp)
  li t0, 8016
  add sp, sp, t0
  ret

.globl .F.testSingleNodeOperations
.F.testSingleNodeOperations:
# spill func args num: 0,             range:     8016(sp) -     8016(sp)
# local var size: 8000,               range:       16(sp) -     8016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testSingleNodeOperations._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testSingleNodeOperations._1.array.cond.0                         # ir inst 3 fin
.F.testSingleNodeOperations._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testSingleNodeOperations._2.array.body.0
  j .F.testSingleNodeOperations._3.array.exit.0                         # ir inst 6 fin
.F.testSingleNodeOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testSingleNodeOperations._1.array.cond.0                         # ir inst 10 fin
.F.testSingleNodeOperations._3.array.exit.0:
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 11 fin
  li t1, 42
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 13 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 14 fin
# Start call preparation
  li a1, 1
  addi t1, sp, 16
  mv a0, t1
  call .F.calculateListSum
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a1, 1
  addi t1, sp, 16
  mv a0, t1
  call .F.reverseList
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 1
  addi t1, sp, 16
  mv a0, t1
  call .F.verifySorted
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
  j .F.testSingleNodeOperations.epilogue                                # ir inst 21 fin
.F.testSingleNodeOperations.epilogue:
  ld ra, 8(sp)
  li t0, 8016
  add sp, sp, t0
  ret

.globl .F.testMemoryBoundaries
.F.testMemoryBoundaries:
# spill func args num: 0,             range:     8016(sp) -     8016(sp)
# local var size: 8000,               range:       16(sp) -     8016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testMemoryBoundaries._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.testMemoryBoundaries._1.array.cond.0                             # ir inst 3 fin
.F.testMemoryBoundaries._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.testMemoryBoundaries._2.array.body.0
  j .F.testMemoryBoundaries._3.array.exit.0                             # ir inst 6 fin
.F.testMemoryBoundaries._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.testMemoryBoundaries._1.array.cond.0                             # ir inst 10 fin
.F.testMemoryBoundaries._3.array.exit.0:
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 11 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 13 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 15 fin
  li t1, 200
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 16
  addi t6, t1, 16                                                       # ir inst 17 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 16
  addi t6, t1, 20                                                       # ir inst 19 fin
  li t1, 300
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 16
  addi t6, t1, 24                                                       # ir inst 21 fin
  li t1, 7
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t1, sp, 16
  addi t6, t1, 28                                                       # ir inst 23 fin
  li t1, 400
  sw t1, 0(t6)                                                          # ir inst 24 fin
  addi t1, sp, 16
  addi t6, t1, 32                                                       # ir inst 25 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 26 fin
# Start call preparation
  li a1, 1
  addi t1, sp, 16
  mv a0, t1
  call .F.calculateListSum
  mv t6, a0
# ir inst 27 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 28 fin
# Start call preparation
  li a1, 9
  addi t1, sp, 16
  mv a0, t1
  call .F.allocateNode
  mv t6, a0
# ir inst 29 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 30 fin
  j .F.testMemoryBoundaries.epilogue                                    # ir inst 31 fin
.F.testMemoryBoundaries.epilogue:
  ld ra, 8(sp)
  li t0, 8016
  add sp, sp, t0
  ret

.globl .F.testCircularListDetection
.F.testCircularListDetection:
# spill func args num: 0,             range:      256(sp) -      256(sp)
# local var size: 240,                range:       16(sp) -      256(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -256
  sd ra, 8(sp)
.F.testCircularListDetection._0.entry.0:
  addi t1, sp, 176
  addi t6, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F.testCircularListDetection._1.array.cond.0                        # ir inst 5 fin
.F.testCircularListDetection._1.array.cond.0:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.testCircularListDetection._2.array.body.0
  j .F.testCircularListDetection._3.array.exit.0                        # ir inst 8 fin
.F.testCircularListDetection._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.testCircularListDetection._1.array.cond.0                        # ir inst 12 fin
.F.testCircularListDetection._3.array.exit.0:
  addi t1, sp, 176
  addi t6, t1, 4                                                        # ir inst 13 fin
  li t1, 111
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 176
  addi t6, t1, 8                                                        # ir inst 15 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 176
  addi t6, t1, 12                                                       # ir inst 17 fin
  li t1, 222
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 176
  addi t6, t1, 16                                                       # ir inst 19 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 176
  addi t6, t1, 20                                                       # ir inst 21 fin
  li t1, 333
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t1, sp, 176
  addi t6, t1, 24                                                       # ir inst 23 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 24 fin
# Start call preparation
  li a2, 80
  addi t1, sp, 176
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call memcpy
# ir inst 25 fin
# Start call preparation
  li a2, 10
  li a1, 1
  addi t1, sp, 16
  mv a0, t1
  call .F.safeTraverseWithLimit
  mv t6, a0
# ir inst 26 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 27 fin
# Start call preparation
  li a2, 80
  addi t1, sp, 176
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call memcpy
# ir inst 28 fin
# Start call preparation
  li a1, 1
  addi t1, sp, 96
  mv a0, t1
  call .F.detectCycle
  mv t6, a0
# ir inst 29 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 30 fin
  j .F.testCircularListDetection.epilogue                               # ir inst 31 fin
.F.testCircularListDetection.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 256
  ret

.globl .F.safeTraverseWithLimit
.F.safeTraverseWithLimit:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.safeTraverseWithLimit._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a1
  li t6, 0
  j .F.safeTraverseWithLimit._1.while.cond.0                            # ir inst 1 fin
.F.safeTraverseWithLimit._1.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.safeTraverseWithLimit._2.lazy.then.0
  j .F.safeTraverseWithLimit._3.lazy.else.0                             # ir inst 6 fin
.F.safeTraverseWithLimit._2.lazy.then.0:
  slt t3, t6, a2                                                        # ir inst 7 fin
# Phi connections
  j .F.safeTraverseWithLimit._4.lazy.exit.0                             # ir inst 8 fin
.F.safeTraverseWithLimit._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.safeTraverseWithLimit._4.lazy.exit.0                             # ir inst 9 fin
.F.safeTraverseWithLimit._4.lazy.exit.0:
  bnez t3, .F.safeTraverseWithLimit._5.while.body.0
  j .F.safeTraverseWithLimit._6.while.exit.0                            # ir inst 11 fin
.F.safeTraverseWithLimit._5.while.body.0:
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  add s11, t4, t3                                                       # ir inst 15 fin
  mv t3, t5                                                             # ir inst 16 fin
  addi t5, t3, 1                                                        # ir inst 17 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 18 fin
  lw t5, 0(t3)                                                          # ir inst 19 fin
  addi t3, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.safeTraverseWithLimit._1.while.cond.0                            # ir inst 21 fin
.F.safeTraverseWithLimit._6.while.exit.0:
  mv a0, t4
  j .F.safeTraverseWithLimit.epilogue                                   # ir inst 22 fin
.F.safeTraverseWithLimit.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.detectCycle
.F.detectCycle:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.detectCycle._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.detectCycle._1.if.then.0
  j .F.detectCycle._2.if.else.0                                         # ir inst 2 fin
.F.detectCycle._1.if.then.0:
  li a0, 0
  j .F.detectCycle.epilogue                                             # ir inst 3 fin
.F.detectCycle._2.if.else.0:
  j .F.detectCycle._3.if.exit.0                                         # ir inst 4 fin
.F.detectCycle._3.if.exit.0:
# Phi connections
  mv t4, a1
  mv t5, a1
  li t6, 0
  j .F.detectCycle._4.while.cond.0                                      # ir inst 5 fin
.F.detectCycle._4.while.cond.0:
  li t2, 15
  slt t3, t6, t2                                                        # ir inst 9 fin
  bnez t3, .F.detectCycle._5.while.body.0
  j .F.detectCycle._27.while.exit.0                                     # ir inst 10 fin
.F.detectCycle._5.while.body.0:
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 11 fin
  bnez t3, .F.detectCycle._6.if.then.1
  j .F.detectCycle._7.if.else.1                                         # ir inst 12 fin
.F.detectCycle._6.if.then.1:
  mv t3, t4                                                             # ir inst 13 fin
  addi s11, t3, 1                                                       # ir inst 14 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 15 fin
  lw s11, 0(t3)                                                         # ir inst 16 fin
# Phi connections
  mv t4, s11
  j .F.detectCycle._8.if.exit.1                                         # ir inst 17 fin
.F.detectCycle._7.if.else.1:
# Phi connections
  j .F.detectCycle._8.if.exit.1                                         # ir inst 18 fin
.F.detectCycle._8.if.exit.1:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 20 fin
  bnez t3, .F.detectCycle._9.if.then.2
  j .F.detectCycle._13.if.else.2                                        # ir inst 21 fin
.F.detectCycle._9.if.then.2:
  mv t3, t5                                                             # ir inst 22 fin
  addi s11, t3, 1                                                       # ir inst 23 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 24 fin
  lw s11, 0(t3)                                                         # ir inst 25 fin
  li t2, 0
  xor t0, s11, t2
  sltu t3, zero, t0                                                     # ir inst 26 fin
  bnez t3, .F.detectCycle._10.if.then.3
  j .F.detectCycle._11.if.else.3                                        # ir inst 27 fin
.F.detectCycle._10.if.then.3:
  mv t3, s11                                                            # ir inst 28 fin
  addi s10, t3, 1                                                       # ir inst 29 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 30 fin
  lw s10, 0(t3)                                                         # ir inst 31 fin
# Phi connections
  mv t3, s10
  j .F.detectCycle._12.if.exit.3                                        # ir inst 32 fin
.F.detectCycle._11.if.else.3:
# Phi connections
  mv t3, s11
  j .F.detectCycle._12.if.exit.3                                        # ir inst 33 fin
.F.detectCycle._12.if.exit.3:
# Phi connections
  mv t5, t3
  j .F.detectCycle._14.if.exit.2                                        # ir inst 35 fin
.F.detectCycle._13.if.else.2:
# Phi connections
  j .F.detectCycle._14.if.exit.2                                        # ir inst 36 fin
.F.detectCycle._14.if.exit.2:
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 38 fin
  bnez t3, .F.detectCycle._15.lazy.then.0
  j .F.detectCycle._16.lazy.else.0                                      # ir inst 39 fin
.F.detectCycle._15.lazy.then.0:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 40 fin
# Phi connections
  j .F.detectCycle._17.lazy.exit.0                                      # ir inst 41 fin
.F.detectCycle._16.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.detectCycle._17.lazy.exit.0                                      # ir inst 42 fin
.F.detectCycle._17.lazy.exit.0:
  bnez t3, .F.detectCycle._18.lazy.then.1
  j .F.detectCycle._19.lazy.else.1                                      # ir inst 44 fin
.F.detectCycle._18.lazy.then.1:
  xor t0, t4, t5
  sltiu t3, t0, 1                                                       # ir inst 45 fin
# Phi connections
  j .F.detectCycle._20.lazy.exit.1                                      # ir inst 46 fin
.F.detectCycle._19.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.detectCycle._20.lazy.exit.1                                      # ir inst 47 fin
.F.detectCycle._20.lazy.exit.1:
  bnez t3, .F.detectCycle._21.if.then.4
  j .F.detectCycle._22.if.else.4                                        # ir inst 49 fin
.F.detectCycle._21.if.then.4:
  li a0, 1
  j .F.detectCycle.epilogue                                             # ir inst 50 fin
.F.detectCycle._22.if.else.4:
  j .F.detectCycle._23.if.exit.4                                        # ir inst 51 fin
.F.detectCycle._23.if.exit.4:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 52 fin
  bnez t3, .F.detectCycle._24.if.then.5
  j .F.detectCycle._25.if.else.5                                        # ir inst 53 fin
.F.detectCycle._24.if.then.5:
  li a0, 0
  j .F.detectCycle.epilogue                                             # ir inst 54 fin
.F.detectCycle._25.if.else.5:
  j .F.detectCycle._26.if.exit.5                                        # ir inst 55 fin
.F.detectCycle._26.if.exit.5:
  addi t3, t6, 1                                                        # ir inst 56 fin
# Phi connections
  mv t6, t3
  j .F.detectCycle._4.while.cond.0                                      # ir inst 57 fin
.F.detectCycle._27.while.exit.0:
  li a0, 0
  j .F.detectCycle.epilogue                                             # ir inst 58 fin
.F.detectCycle.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret
