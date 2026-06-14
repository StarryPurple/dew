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
  call .F.testGraphTraversalAlgorithms
# ir inst 2 fin
# Start call preparation
  call .F.testShortestPathAlgorithms
# ir inst 3 fin
# Start call preparation
  call .F.testMinimumSpanningTreeAlgorithms
# ir inst 4 fin
# Start call preparation
  call .F.testNetworkFlowAlgorithms
# ir inst 5 fin
# Start call preparation
  call .F.testGraphConnectivityAlgorithms
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

.globl .F.testGraphTraversalAlgorithms
.F.testGraphTraversalAlgorithms:
# spill func args num: 0,             range:    10016(sp) -    10016(sp)
# local var size: 10000,              range:       16(sp) -    10016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testGraphTraversalAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1701
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testGraphTraversalAlgorithms._1.array.cond.0                     # ir inst 4 fin
.F.testGraphTraversalAlgorithms._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testGraphTraversalAlgorithms._2.array.body.0
  j .F.testGraphTraversalAlgorithms._3.array.exit.0                     # ir inst 7 fin
.F.testGraphTraversalAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testGraphTraversalAlgorithms._1.array.cond.0                     # ir inst 11 fin
.F.testGraphTraversalAlgorithms._3.array.exit.0:
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeGraph
# ir inst 12 fin
# Start call preparation
  li a2, 0
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.depthFirstSearch
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a2, 0
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.breadthFirstSearch
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a2, 0
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.iterativeDepthFirstSearch
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.detectCycles
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1702
  call printlnInt
# ir inst 21 fin
  j .F.testGraphTraversalAlgorithms.epilogue                            # ir inst 22 fin
.F.testGraphTraversalAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 10016
  add sp, sp, t0
  ret

.globl .F.initializeGraph
.F.initializeGraph:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeGraph._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeGraph._1.while.cond.0                                  # ir inst 1 fin
.F.initializeGraph._1.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.initializeGraph._2.while.body.0
  j .F.initializeGraph._3.while.exit.0                                  # ir inst 5 fin
.F.initializeGraph._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.initializeGraph._1.while.cond.0                                  # ir inst 10 fin
.F.initializeGraph._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeGraph._4.while.cond.1                                  # ir inst 11 fin
.F.initializeGraph._4.while.cond.1:
  slt t5, t6, a1                                                        # ir inst 13 fin
  bnez t5, .F.initializeGraph._5.while.body.1
  j .F.initializeGraph._18.while.exit.1                                 # ir inst 14 fin
.F.initializeGraph._5.while.body.1:
# Phi connections
  li t5, 0
  j .F.initializeGraph._6.while.cond.2                                  # ir inst 15 fin
.F.initializeGraph._6.while.cond.2:
  slt t4, t5, a1                                                        # ir inst 17 fin
  bnez t4, .F.initializeGraph._7.while.body.2
  j .F.initializeGraph._17.while.exit.2                                 # ir inst 18 fin
.F.initializeGraph._7.while.body.2:
  xor t0, t6, t5
  sltu t4, zero, t0                                                     # ir inst 19 fin
  bnez t4, .F.initializeGraph._8.lazy.then.0
  j .F.initializeGraph._12.lazy.else.0                                  # ir inst 20 fin
.F.initializeGraph._8.lazy.then.0:
  add t4, t6, t5                                                        # ir inst 21 fin
  li t2, 7
  rem t3, t4, t2                                                        # ir inst 22 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 23 fin
  bnez t4, .F.initializeGraph._9.lazy.then.1
  j .F.initializeGraph._10.lazy.else.1                                  # ir inst 24 fin
.F.initializeGraph._9.lazy.then.1:
# Phi connections
  li t4, 1
  j .F.initializeGraph._11.lazy.exit.1                                  # ir inst 25 fin
.F.initializeGraph._10.lazy.else.1:
  mul t4, t6, t5                                                        # ir inst 26 fin
  li t2, 11
  rem t3, t4, t2                                                        # ir inst 27 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 28 fin
# Phi connections
  j .F.initializeGraph._11.lazy.exit.1                                  # ir inst 29 fin
.F.initializeGraph._11.lazy.exit.1:
# Phi connections
  j .F.initializeGraph._13.lazy.exit.0                                  # ir inst 31 fin
.F.initializeGraph._12.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.initializeGraph._13.lazy.exit.0                                  # ir inst 32 fin
.F.initializeGraph._13.lazy.exit.0:
  bnez t4, .F.initializeGraph._14.if.then.0
  j .F.initializeGraph._15.if.else.0                                    # ir inst 34 fin
.F.initializeGraph._14.if.then.0:
  mul t4, t6, a1                                                        # ir inst 35 fin
  add t3, t4, t5                                                        # ir inst 36 fin
  mv t4, t3                                                             # ir inst 37 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 38 fin
  add t4, t6, t5                                                        # ir inst 39 fin
  li t2, 10
  rem s11, t4, t2                                                       # ir inst 40 fin
  addi t4, s11, 1                                                       # ir inst 41 fin
  sw t4, 0(t3)                                                          # ir inst 42 fin
  mul t4, t5, a1                                                        # ir inst 43 fin
  add t3, t4, t6                                                        # ir inst 44 fin
  mv t4, t3                                                             # ir inst 45 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 46 fin
  add t4, t6, t5                                                        # ir inst 47 fin
  li t2, 10
  rem s11, t4, t2                                                       # ir inst 48 fin
  addi t4, s11, 1                                                       # ir inst 49 fin
  sw t4, 0(t3)                                                          # ir inst 50 fin
  j .F.initializeGraph._16.if.exit.0                                    # ir inst 51 fin
.F.initializeGraph._15.if.else.0:
  j .F.initializeGraph._16.if.exit.0                                    # ir inst 52 fin
.F.initializeGraph._16.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 53 fin
# Phi connections
  mv t5, t4
  j .F.initializeGraph._6.while.cond.2                                  # ir inst 54 fin
.F.initializeGraph._17.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 55 fin
# Phi connections
  mv t6, t5
  j .F.initializeGraph._4.while.cond.1                                  # ir inst 56 fin
.F.initializeGraph._18.while.exit.1:
  j .F.initializeGraph.epilogue                                         # ir inst 57 fin
.F.initializeGraph.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.depthFirstSearch
.F.depthFirstSearch:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 50,                 range:       40(sp) -       90(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 32(sp)
.F.depthFirstSearch._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.depthFirstSearch._1.array.cond.0                                 # ir inst 3 fin
.F.depthFirstSearch._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.depthFirstSearch._2.array.body.0
  j .F.depthFirstSearch._3.array.exit.0                                 # ir inst 6 fin
.F.depthFirstSearch._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.depthFirstSearch._1.array.cond.0                                 # ir inst 10 fin
.F.depthFirstSearch._3.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  addi t1, sp, 40
  mv a3, t1
  call .F.dfsRecursive
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 11 fin
  mv a0, t6
  j .F.depthFirstSearch.epilogue                                        # ir inst 12 fin
.F.depthFirstSearch.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 96
  ret

.globl .F.dfsRecursive
.F.dfsRecursive:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.dfsRecursive._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  add t5, a3, t6                                                        # ir inst 2 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 3 fin
# Phi connections
  li t5, 0
  li t6, 1
  j .F.dfsRecursive._1.while.cond.0                                     # ir inst 4 fin
.F.dfsRecursive._1.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 7 fin
  bnez t4, .F.dfsRecursive._2.while.body.0
  j .F.dfsRecursive._9.while.exit.0                                     # ir inst 8 fin
.F.dfsRecursive._2.while.body.0:
  mul t4, a2, a1                                                        # ir inst 9 fin
  add t3, t4, t5                                                        # ir inst 10 fin
  mv t4, t3                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 14 fin
  bnez t3, .F.dfsRecursive._3.lazy.then.0
  j .F.dfsRecursive._4.lazy.else.0                                      # ir inst 15 fin
.F.dfsRecursive._3.lazy.then.0:
  mv t4, t5                                                             # ir inst 16 fin
  add t3, a3, t4                                                        # ir inst 17 fin
  lb t4, 0(t3)                                                          # ir inst 18 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 19 fin
# Phi connections
  mv t4, t3
  j .F.dfsRecursive._5.lazy.exit.0                                      # ir inst 20 fin
.F.dfsRecursive._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.dfsRecursive._5.lazy.exit.0                                      # ir inst 21 fin
.F.dfsRecursive._5.lazy.exit.0:
  bnez t4, .F.dfsRecursive._6.if.then.0
  j .F.dfsRecursive._7.if.else.0                                        # ir inst 23 fin
.F.dfsRecursive._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t5
  call .F.dfsRecursive
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 24 fin
  add t3, t6, t4                                                        # ir inst 25 fin
# Phi connections
  mv t4, t3
  j .F.dfsRecursive._8.if.exit.0                                        # ir inst 26 fin
.F.dfsRecursive._7.if.else.0:
# Phi connections
  mv t4, t6
  j .F.dfsRecursive._8.if.exit.0                                        # ir inst 27 fin
.F.dfsRecursive._8.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.dfsRecursive._1.while.cond.0                                     # ir inst 30 fin
.F.dfsRecursive._9.while.exit.0:
  mv a0, t6
  j .F.dfsRecursive.epilogue                                            # ir inst 31 fin
.F.dfsRecursive.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.breadthFirstSearch
.F.breadthFirstSearch:
# spill func args num: 0,             range:      288(sp) -      288(sp)
# local var size: 252,                range:       32(sp) -      284(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -288
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
.F.breadthFirstSearch._0.entry.0:
  addi t1, sp, 32
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
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.breadthFirstSearch._1.array.cond.0                               # ir inst 10 fin
.F.breadthFirstSearch._3.array.exit.0:
  addi t1, sp, 84
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.breadthFirstSearch._4.array.cond.1                               # ir inst 13 fin
.F.breadthFirstSearch._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.breadthFirstSearch._5.array.body.1
  j .F.breadthFirstSearch._6.array.exit.1                               # ir inst 16 fin
.F.breadthFirstSearch._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.breadthFirstSearch._4.array.cond.1                               # ir inst 20 fin
.F.breadthFirstSearch._6.array.exit.1:
  li t1, 0
  mv t6, t1                                                             # ir inst 21 fin
  slli t2, t6, 2
  addi t1, sp, 84
  add t5, t1, t2                                                        # ir inst 22 fin
  sw a2, 0(t5)                                                          # ir inst 23 fin
  mv t6, a2                                                             # ir inst 24 fin
  addi t1, sp, 32
  add t5, t1, t6                                                        # ir inst 25 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 26 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 1
  j .F.breadthFirstSearch._7.while.cond.0                               # ir inst 27 fin
.F.breadthFirstSearch._7.while.cond.0:
  slt t3, t4, t6                                                        # ir inst 31 fin
  bnez t3, .F.breadthFirstSearch._8.while.body.0
  j .F.breadthFirstSearch._18.while.exit.0                              # ir inst 32 fin
.F.breadthFirstSearch._8.while.body.0:
  mv t3, t4                                                             # ir inst 33 fin
  slli t2, t3, 2
  addi t1, sp, 84
  add s11, t1, t2                                                       # ir inst 34 fin
  lw t3, 0(s11)                                                         # ir inst 35 fin
  addi s11, t4, 1                                                       # ir inst 36 fin
  addi t4, t5, 1                                                        # ir inst 37 fin
# Phi connections
  li s10, 0
  j .F.breadthFirstSearch._9.while.cond.1                               # ir inst 38 fin
.F.breadthFirstSearch._9.while.cond.1:
  slt s9, s10, a1                                                       # ir inst 41 fin
  bnez s9, .F.breadthFirstSearch._10.while.body.1
  j .F.breadthFirstSearch._17.while.exit.1                              # ir inst 42 fin
.F.breadthFirstSearch._10.while.body.1:
  mul s9, t3, a1                                                        # ir inst 43 fin
  add s8, s9, s10                                                       # ir inst 44 fin
  mv s9, s8                                                             # ir inst 45 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 46 fin
  lw s9, 0(s8)                                                          # ir inst 47 fin
  li t2, 0
  slt s8, t2, s9                                                        # ir inst 48 fin
  bnez s8, .F.breadthFirstSearch._11.lazy.then.0
  j .F.breadthFirstSearch._12.lazy.else.0                               # ir inst 49 fin
.F.breadthFirstSearch._11.lazy.then.0:
  mv s9, s10                                                            # ir inst 50 fin
  addi t1, sp, 32
  add s8, t1, s9                                                        # ir inst 51 fin
  lb s9, 0(s8)                                                          # ir inst 52 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 53 fin
# Phi connections
  mv s9, s8
  j .F.breadthFirstSearch._13.lazy.exit.0                               # ir inst 54 fin
.F.breadthFirstSearch._12.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.breadthFirstSearch._13.lazy.exit.0                               # ir inst 55 fin
.F.breadthFirstSearch._13.lazy.exit.0:
  bnez s9, .F.breadthFirstSearch._14.if.then.0
  j .F.breadthFirstSearch._15.if.else.0                                 # ir inst 57 fin
.F.breadthFirstSearch._14.if.then.0:
  mv s9, s10                                                            # ir inst 58 fin
  addi t1, sp, 32
  add s8, t1, s9                                                        # ir inst 59 fin
  li t1, 1
  sb t1, 0(s8)                                                          # ir inst 60 fin
  mv s9, t6                                                             # ir inst 61 fin
  slli t2, s9, 2
  addi t1, sp, 84
  add s8, t1, t2                                                        # ir inst 62 fin
  sw s10, 0(s8)                                                         # ir inst 63 fin
  addi s9, t6, 1                                                        # ir inst 64 fin
# Phi connections
  j .F.breadthFirstSearch._16.if.exit.0                                 # ir inst 65 fin
.F.breadthFirstSearch._15.if.else.0:
# Phi connections
  mv s9, t6
  j .F.breadthFirstSearch._16.if.exit.0                                 # ir inst 66 fin
.F.breadthFirstSearch._16.if.exit.0:
  addi s8, s10, 1                                                       # ir inst 68 fin
# Phi connections
  mv s10, s8
  mv t6, s9
  j .F.breadthFirstSearch._9.while.cond.1                               # ir inst 69 fin
.F.breadthFirstSearch._17.while.exit.1:
# Phi connections
  mv t5, t4
  mv t4, s11
  j .F.breadthFirstSearch._7.while.cond.0                               # ir inst 70 fin
.F.breadthFirstSearch._18.while.exit.0:
  mv a0, t5
  j .F.breadthFirstSearch.epilogue                                      # ir inst 71 fin
.F.breadthFirstSearch.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  addi sp, sp, 288
  ret

.globl .F.iterativeDepthFirstSearch
.F.iterativeDepthFirstSearch:
# spill func args num: 0,             range:     5088(sp) -     5088(sp)
# local var size: 5052,               range:       32(sp) -     5084(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5088
  add sp, sp, t0
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
.F.iterativeDepthFirstSearch._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.iterativeDepthFirstSearch._1.array.cond.0                        # ir inst 3 fin
.F.iterativeDepthFirstSearch._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.iterativeDepthFirstSearch._2.array.body.0
  j .F.iterativeDepthFirstSearch._3.array.exit.0                        # ir inst 6 fin
.F.iterativeDepthFirstSearch._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.iterativeDepthFirstSearch._1.array.cond.0                        # ir inst 10 fin
.F.iterativeDepthFirstSearch._3.array.exit.0:
  addi t1, sp, 84
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.iterativeDepthFirstSearch._4.array.cond.1                        # ir inst 13 fin
.F.iterativeDepthFirstSearch._4.array.cond.1:
  li t2, 1250
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.iterativeDepthFirstSearch._5.array.body.1
  j .F.iterativeDepthFirstSearch._6.array.exit.1                        # ir inst 16 fin
.F.iterativeDepthFirstSearch._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.iterativeDepthFirstSearch._4.array.cond.1                        # ir inst 20 fin
.F.iterativeDepthFirstSearch._6.array.exit.1:
  li t1, 0
  mv t6, t1                                                             # ir inst 21 fin
  slli t2, t6, 2
  addi t1, sp, 84
  add t5, t1, t2                                                        # ir inst 22 fin
  sw a2, 0(t5)                                                          # ir inst 23 fin
# Phi connections
  li t5, 1
  li t6, 0
  j .F.iterativeDepthFirstSearch._7.while.cond.0                        # ir inst 24 fin
.F.iterativeDepthFirstSearch._7.while.cond.0:
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 27 fin
  bnez t4, .F.iterativeDepthFirstSearch._8.while.body.0
  j .F.iterativeDepthFirstSearch._21.while.exit.0                       # ir inst 28 fin
.F.iterativeDepthFirstSearch._8.while.body.0:
  addi t4, t5, -1                                                       # ir inst 29 fin
  mv t5, t4                                                             # ir inst 30 fin
  slli t2, t5, 2
  addi t1, sp, 84
  add t3, t1, t2                                                        # ir inst 31 fin
  lw t5, 0(t3)                                                          # ir inst 32 fin
  mv t3, t5                                                             # ir inst 33 fin
  addi t1, sp, 32
  add s11, t1, t3                                                       # ir inst 34 fin
  lb t3, 0(s11)                                                         # ir inst 35 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 36 fin
  bnez s11, .F.iterativeDepthFirstSearch._9.if.then.0
  j .F.iterativeDepthFirstSearch._19.if.else.0                          # ir inst 37 fin
.F.iterativeDepthFirstSearch._9.if.then.0:
  mv t3, t5                                                             # ir inst 38 fin
  addi t1, sp, 32
  add s11, t1, t3                                                       # ir inst 39 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 40 fin
  addi t3, t6, 1                                                        # ir inst 41 fin
# Phi connections
  li s10, 0
  mv s11, t4
  j .F.iterativeDepthFirstSearch._10.while.cond.1                       # ir inst 42 fin
.F.iterativeDepthFirstSearch._10.while.cond.1:
  slt s9, s10, a1                                                       # ir inst 45 fin
  bnez s9, .F.iterativeDepthFirstSearch._11.while.body.1
  j .F.iterativeDepthFirstSearch._18.while.exit.1                       # ir inst 46 fin
.F.iterativeDepthFirstSearch._11.while.body.1:
  mul s9, t5, a1                                                        # ir inst 47 fin
  add s8, s9, s10                                                       # ir inst 48 fin
  mv s9, s8                                                             # ir inst 49 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 50 fin
  lw s9, 0(s8)                                                          # ir inst 51 fin
  li t2, 0
  slt s8, t2, s9                                                        # ir inst 52 fin
  bnez s8, .F.iterativeDepthFirstSearch._12.lazy.then.0
  j .F.iterativeDepthFirstSearch._13.lazy.else.0                        # ir inst 53 fin
.F.iterativeDepthFirstSearch._12.lazy.then.0:
  mv s9, s10                                                            # ir inst 54 fin
  addi t1, sp, 32
  add s8, t1, s9                                                        # ir inst 55 fin
  lb s9, 0(s8)                                                          # ir inst 56 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 57 fin
# Phi connections
  mv s9, s8
  j .F.iterativeDepthFirstSearch._14.lazy.exit.0                        # ir inst 58 fin
.F.iterativeDepthFirstSearch._13.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.iterativeDepthFirstSearch._14.lazy.exit.0                        # ir inst 59 fin
.F.iterativeDepthFirstSearch._14.lazy.exit.0:
  bnez s9, .F.iterativeDepthFirstSearch._15.if.then.1
  j .F.iterativeDepthFirstSearch._16.if.else.1                          # ir inst 61 fin
.F.iterativeDepthFirstSearch._15.if.then.1:
  mv s9, s11                                                            # ir inst 62 fin
  slli t2, s9, 2
  addi t1, sp, 84
  add s8, t1, t2                                                        # ir inst 63 fin
  sw s10, 0(s8)                                                         # ir inst 64 fin
  addi s9, s11, 1                                                       # ir inst 65 fin
# Phi connections
  j .F.iterativeDepthFirstSearch._17.if.exit.1                          # ir inst 66 fin
.F.iterativeDepthFirstSearch._16.if.else.1:
# Phi connections
  mv s9, s11
  j .F.iterativeDepthFirstSearch._17.if.exit.1                          # ir inst 67 fin
.F.iterativeDepthFirstSearch._17.if.exit.1:
  addi s8, s10, 1                                                       # ir inst 69 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F.iterativeDepthFirstSearch._10.while.cond.1                       # ir inst 70 fin
.F.iterativeDepthFirstSearch._18.while.exit.1:
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.iterativeDepthFirstSearch._20.if.exit.0                          # ir inst 71 fin
.F.iterativeDepthFirstSearch._19.if.else.0:
# Phi connections
  mv t5, t6
  j .F.iterativeDepthFirstSearch._20.if.exit.0                          # ir inst 72 fin
.F.iterativeDepthFirstSearch._20.if.exit.0:
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.iterativeDepthFirstSearch._7.while.cond.0                        # ir inst 75 fin
.F.iterativeDepthFirstSearch._21.while.exit.0:
  mv a0, t6
  j .F.iterativeDepthFirstSearch.epilogue                               # ir inst 76 fin
.F.iterativeDepthFirstSearch.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  li t0, 5088
  add sp, sp, t0
  ret

.globl .F.detectCycles
.F.detectCycles:
# spill func args num: 0,             range:      160(sp) -      160(sp)
# local var size: 100,                range:       48(sp) -      148(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -160
  sd ra, 40(sp)
.F.detectCycles._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.detectCycles._1.array.cond.0                                     # ir inst 3 fin
.F.detectCycles._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.detectCycles._2.array.body.0
  j .F.detectCycles._3.array.exit.0                                     # ir inst 6 fin
.F.detectCycles._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.detectCycles._1.array.cond.0                                     # ir inst 10 fin
.F.detectCycles._3.array.exit.0:
  addi t1, sp, 98
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.detectCycles._4.array.cond.1                                     # ir inst 13 fin
.F.detectCycles._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.detectCycles._5.array.body.1
  j .F.detectCycles._6.array.exit.1                                     # ir inst 16 fin
.F.detectCycles._5.array.body.1:
  add t4, t6, t5                                                        # ir inst 17 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.detectCycles._4.array.cond.1                                     # ir inst 20 fin
.F.detectCycles._6.array.exit.1:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.detectCycles._7.while.cond.0                                     # ir inst 21 fin
.F.detectCycles._7.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 24 fin
  bnez t4, .F.detectCycles._8.while.body.0
  j .F.detectCycles._15.while.exit.0                                    # ir inst 25 fin
.F.detectCycles._8.while.body.0:
  mv t4, t6                                                             # ir inst 26 fin
  addi t1, sp, 48
  add t3, t1, t4                                                        # ir inst 27 fin
  lb t4, 0(t3)                                                          # ir inst 28 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 29 fin
  bnez t3, .F.detectCycles._9.if.then.0
  j .F.detectCycles._13.if.else.0                                       # ir inst 30 fin
.F.detectCycles._9.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 98
  mv a4, t1
  addi t1, sp, 48
  mv a3, t1
  mv a2, t6
  call .F.dfsCycleDetection
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 31 fin
  bnez t4, .F.detectCycles._10.if.then.1
  j .F.detectCycles._11.if.else.1                                       # ir inst 32 fin
.F.detectCycles._10.if.then.1:
  addi t4, t5, 1                                                        # ir inst 33 fin
# Phi connections
  j .F.detectCycles._12.if.exit.1                                       # ir inst 34 fin
.F.detectCycles._11.if.else.1:
# Phi connections
  mv t4, t5
  j .F.detectCycles._12.if.exit.1                                       # ir inst 35 fin
.F.detectCycles._12.if.exit.1:
# Phi connections
  j .F.detectCycles._14.if.exit.0                                       # ir inst 37 fin
.F.detectCycles._13.if.else.0:
# Phi connections
  mv t4, t5
  j .F.detectCycles._14.if.exit.0                                       # ir inst 38 fin
.F.detectCycles._14.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.detectCycles._7.while.cond.0                                     # ir inst 41 fin
.F.detectCycles._15.while.exit.0:
  mv a0, t5
  j .F.detectCycles.epilogue                                            # ir inst 42 fin
.F.detectCycles.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 160
  ret

.globl .F.dfsCycleDetection
.F.dfsCycleDetection:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.dfsCycleDetection._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  add t5, a3, t6                                                        # ir inst 2 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 3 fin
  mv t6, a2                                                             # ir inst 4 fin
  add t5, a4, t6                                                        # ir inst 5 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 6 fin
# Phi connections
  li t6, 0
  j .F.dfsCycleDetection._1.while.cond.0                                # ir inst 7 fin
.F.dfsCycleDetection._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 9 fin
  bnez t5, .F.dfsCycleDetection._2.while.body.0
  j .F.dfsCycleDetection._15.while.exit.0                               # ir inst 10 fin
.F.dfsCycleDetection._2.while.body.0:
  mul t5, a2, a1                                                        # ir inst 11 fin
  add t4, t5, t6                                                        # ir inst 12 fin
  mv t5, t4                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  lw t5, 0(t4)                                                          # ir inst 15 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 16 fin
  bnez t4, .F.dfsCycleDetection._3.if.then.0
  j .F.dfsCycleDetection._13.if.else.0                                  # ir inst 17 fin
.F.dfsCycleDetection._3.if.then.0:
  mv t5, t6                                                             # ir inst 18 fin
  add t4, a3, t5                                                        # ir inst 19 fin
  lb t5, 0(t4)                                                          # ir inst 20 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 21 fin
  bnez t4, .F.dfsCycleDetection._4.if.then.1
  j .F.dfsCycleDetection._8.if.else.1                                   # ir inst 22 fin
.F.dfsCycleDetection._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t6, 40(sp)
  mv a2, t6
  call .F.dfsCycleDetection
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t6, 40(sp)
# ir inst 23 fin
  bnez t5, .F.dfsCycleDetection._5.if.then.2
  j .F.dfsCycleDetection._6.if.else.2                                   # ir inst 24 fin
.F.dfsCycleDetection._5.if.then.2:
  li a0, 1
  j .F.dfsCycleDetection.epilogue                                       # ir inst 25 fin
.F.dfsCycleDetection._6.if.else.2:
  j .F.dfsCycleDetection._7.if.exit.2                                   # ir inst 26 fin
.F.dfsCycleDetection._7.if.exit.2:
  j .F.dfsCycleDetection._12.if.exit.1                                  # ir inst 27 fin
.F.dfsCycleDetection._8.if.else.1:
  mv t5, t6                                                             # ir inst 28 fin
  add t4, a4, t5                                                        # ir inst 29 fin
  lb t5, 0(t4)                                                          # ir inst 30 fin
  bnez t5, .F.dfsCycleDetection._9.if.then.3
  j .F.dfsCycleDetection._10.if.else.3                                  # ir inst 31 fin
.F.dfsCycleDetection._9.if.then.3:
  li a0, 1
  j .F.dfsCycleDetection.epilogue                                       # ir inst 32 fin
.F.dfsCycleDetection._10.if.else.3:
  j .F.dfsCycleDetection._11.if.exit.3                                  # ir inst 33 fin
.F.dfsCycleDetection._11.if.exit.3:
  j .F.dfsCycleDetection._12.if.exit.1                                  # ir inst 34 fin
.F.dfsCycleDetection._12.if.exit.1:
  j .F.dfsCycleDetection._14.if.exit.0                                  # ir inst 35 fin
.F.dfsCycleDetection._13.if.else.0:
  j .F.dfsCycleDetection._14.if.exit.0                                  # ir inst 36 fin
.F.dfsCycleDetection._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t6, t5
  j .F.dfsCycleDetection._1.while.cond.0                                # ir inst 38 fin
.F.dfsCycleDetection._15.while.exit.0:
  mv t6, a2                                                             # ir inst 39 fin
  add t5, a4, t6                                                        # ir inst 40 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 41 fin
  li a0, 0
  j .F.dfsCycleDetection.epilogue                                       # ir inst 42 fin
.F.dfsCycleDetection.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.testShortestPathAlgorithms
.F.testShortestPathAlgorithms:
# spill func args num: 0,             range:    10016(sp) -    10016(sp)
# local var size: 10000,              range:       16(sp) -    10016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testShortestPathAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1703
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testShortestPathAlgorithms._1.array.cond.0                       # ir inst 4 fin
.F.testShortestPathAlgorithms._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testShortestPathAlgorithms._2.array.body.0
  j .F.testShortestPathAlgorithms._3.array.exit.0                       # ir inst 7 fin
.F.testShortestPathAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testShortestPathAlgorithms._1.array.cond.0                       # ir inst 11 fin
.F.testShortestPathAlgorithms._3.array.exit.0:
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeWeightedGraph
# ir inst 12 fin
# Start call preparation
  li a2, 0
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.dijkstraShortestPath
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 20
  addi t1, sp, 16
  mv a0, t1
  call .F.floydWarshallAllPairs
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a2, 0
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.bellmanFordShortestPath
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a0, 1704
  call printlnInt
# ir inst 19 fin
  j .F.testShortestPathAlgorithms.epilogue                              # ir inst 20 fin
.F.testShortestPathAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 10016
  add sp, sp, t0
  ret

.globl .F.initializeWeightedGraph
.F.initializeWeightedGraph:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeWeightedGraph._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeWeightedGraph._1.while.cond.0                          # ir inst 1 fin
.F.initializeWeightedGraph._1.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.initializeWeightedGraph._2.while.body.0
  j .F.initializeWeightedGraph._3.while.exit.0                          # ir inst 5 fin
.F.initializeWeightedGraph._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  li t1, 9999
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.initializeWeightedGraph._1.while.cond.0                          # ir inst 10 fin
.F.initializeWeightedGraph._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeWeightedGraph._4.while.cond.1                          # ir inst 11 fin
.F.initializeWeightedGraph._4.while.cond.1:
  slt t5, t6, a1                                                        # ir inst 13 fin
  bnez t5, .F.initializeWeightedGraph._5.while.body.1
  j .F.initializeWeightedGraph._6.while.exit.1                          # ir inst 14 fin
.F.initializeWeightedGraph._5.while.body.1:
  mul t5, t6, a1                                                        # ir inst 15 fin
  add t4, t5, t6                                                        # ir inst 16 fin
  mv t5, t4                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.initializeWeightedGraph._4.while.cond.1                          # ir inst 21 fin
.F.initializeWeightedGraph._6.while.exit.1:
# Phi connections
  li t6, 0
  j .F.initializeWeightedGraph._7.while.cond.2                          # ir inst 22 fin
.F.initializeWeightedGraph._7.while.cond.2:
  slt t5, t6, a1                                                        # ir inst 24 fin
  bnez t5, .F.initializeWeightedGraph._8.while.body.2
  j .F.initializeWeightedGraph._21.while.exit.2                         # ir inst 25 fin
.F.initializeWeightedGraph._8.while.body.2:
# Phi connections
  li t5, 0
  j .F.initializeWeightedGraph._9.while.cond.3                          # ir inst 26 fin
.F.initializeWeightedGraph._9.while.cond.3:
  slt t4, t5, a1                                                        # ir inst 28 fin
  bnez t4, .F.initializeWeightedGraph._10.while.body.3
  j .F.initializeWeightedGraph._20.while.exit.3                         # ir inst 29 fin
.F.initializeWeightedGraph._10.while.body.3:
  xor t0, t6, t5
  sltu t4, zero, t0                                                     # ir inst 30 fin
  bnez t4, .F.initializeWeightedGraph._11.lazy.then.0
  j .F.initializeWeightedGraph._15.lazy.else.0                          # ir inst 31 fin
.F.initializeWeightedGraph._11.lazy.then.0:
  add t4, t6, t5                                                        # ir inst 32 fin
  li t2, 5
  rem t3, t4, t2                                                        # ir inst 33 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 34 fin
  bnez t4, .F.initializeWeightedGraph._12.lazy.then.1
  j .F.initializeWeightedGraph._13.lazy.else.1                          # ir inst 35 fin
.F.initializeWeightedGraph._12.lazy.then.1:
# Phi connections
  li t4, 1
  j .F.initializeWeightedGraph._14.lazy.exit.1                          # ir inst 36 fin
.F.initializeWeightedGraph._13.lazy.else.1:
  slli t4, t6, 1                                                        # ir inst 37 fin
  add t3, t4, t5                                                        # ir inst 38 fin
  li t2, 7
  rem t4, t3, t2                                                        # ir inst 39 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F.initializeWeightedGraph._14.lazy.exit.1                          # ir inst 41 fin
.F.initializeWeightedGraph._14.lazy.exit.1:
# Phi connections
  j .F.initializeWeightedGraph._16.lazy.exit.0                          # ir inst 43 fin
.F.initializeWeightedGraph._15.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.initializeWeightedGraph._16.lazy.exit.0                          # ir inst 44 fin
.F.initializeWeightedGraph._16.lazy.exit.0:
  bnez t4, .F.initializeWeightedGraph._17.if.then.0
  j .F.initializeWeightedGraph._18.if.else.0                            # ir inst 46 fin
.F.initializeWeightedGraph._17.if.then.0:
  add t4, t6, t5                                                        # ir inst 47 fin
  li t2, 15
  rem t3, t4, t2                                                        # ir inst 48 fin
  addi t4, t3, 1                                                        # ir inst 49 fin
  mul t3, t6, a1                                                        # ir inst 50 fin
  add s11, t3, t5                                                       # ir inst 51 fin
  mv t3, s11                                                            # ir inst 52 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 53 fin
  sw t4, 0(s11)                                                         # ir inst 54 fin
  j .F.initializeWeightedGraph._19.if.exit.0                            # ir inst 55 fin
.F.initializeWeightedGraph._18.if.else.0:
  j .F.initializeWeightedGraph._19.if.exit.0                            # ir inst 56 fin
.F.initializeWeightedGraph._19.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 57 fin
# Phi connections
  mv t5, t4
  j .F.initializeWeightedGraph._9.while.cond.3                          # ir inst 58 fin
.F.initializeWeightedGraph._20.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 59 fin
# Phi connections
  mv t6, t5
  j .F.initializeWeightedGraph._7.while.cond.2                          # ir inst 60 fin
.F.initializeWeightedGraph._21.while.exit.2:
  j .F.initializeWeightedGraph.epilogue                                 # ir inst 61 fin
.F.initializeWeightedGraph.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.dijkstraShortestPath
.F.dijkstraShortestPath:
# spill func args num: 0,             range:      288(sp) -      288(sp)
# local var size: 250,                range:       32(sp) -      282(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -288
  sd s11, 0(sp)
  sd s8, 8(sp)
  sd s9, 16(sp)
  sd s10, 24(sp)
.F.dijkstraShortestPath._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.dijkstraShortestPath._1.array.cond.0                             # ir inst 3 fin
.F.dijkstraShortestPath._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.dijkstraShortestPath._2.array.body.0
  j .F.dijkstraShortestPath._3.array.exit.0                             # ir inst 6 fin
.F.dijkstraShortestPath._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 9999
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.dijkstraShortestPath._1.array.cond.0                             # ir inst 10 fin
.F.dijkstraShortestPath._3.array.exit.0:
  addi t1, sp, 232
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.dijkstraShortestPath._4.array.cond.1                             # ir inst 13 fin
.F.dijkstraShortestPath._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.dijkstraShortestPath._5.array.body.1
  j .F.dijkstraShortestPath._6.array.exit.1                             # ir inst 16 fin
.F.dijkstraShortestPath._5.array.body.1:
  add t4, t6, t5                                                        # ir inst 17 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.dijkstraShortestPath._4.array.cond.1                             # ir inst 20 fin
.F.dijkstraShortestPath._6.array.exit.1:
  mv t6, a2                                                             # ir inst 21 fin
  slli t2, t6, 2
  addi t1, sp, 32
  add t5, t1, t2                                                        # ir inst 22 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 23 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.dijkstraShortestPath._7.while.cond.0                             # ir inst 24 fin
.F.dijkstraShortestPath._7.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 27 fin
  bnez t4, .F.dijkstraShortestPath._8.while.body.0
  j .F.dijkstraShortestPath._34.critical_edge.0                         # ir inst 28 fin
.F.dijkstraShortestPath._8.while.body.0:
# Phi connections
  li s11, 9999
  li t3, -1
  li t4, 0
  j .F.dijkstraShortestPath._9.while.cond.1                             # ir inst 29 fin
.F.dijkstraShortestPath._9.while.cond.1:
  slt s10, t4, a1                                                       # ir inst 33 fin
  bnez s10, .F.dijkstraShortestPath._10.while.body.1
  j .F.dijkstraShortestPath._17.while.exit.1                            # ir inst 34 fin
.F.dijkstraShortestPath._10.while.body.1:
  mv s10, t4                                                            # ir inst 35 fin
  addi t1, sp, 232
  add s9, t1, s10                                                       # ir inst 36 fin
  lb s10, 0(s9)                                                         # ir inst 37 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 38 fin
  bnez s9, .F.dijkstraShortestPath._11.lazy.then.0
  j .F.dijkstraShortestPath._12.lazy.else.0                             # ir inst 39 fin
.F.dijkstraShortestPath._11.lazy.then.0:
  mv s10, t4                                                            # ir inst 40 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 41 fin
  lw s10, 0(s9)                                                         # ir inst 42 fin
  slt s9, s10, s11                                                      # ir inst 43 fin
# Phi connections
  mv s10, s9
  j .F.dijkstraShortestPath._13.lazy.exit.0                             # ir inst 44 fin
.F.dijkstraShortestPath._12.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.dijkstraShortestPath._13.lazy.exit.0                             # ir inst 45 fin
.F.dijkstraShortestPath._13.lazy.exit.0:
  bnez s10, .F.dijkstraShortestPath._14.if.then.0
  j .F.dijkstraShortestPath._15.if.else.0                               # ir inst 47 fin
.F.dijkstraShortestPath._14.if.then.0:
  mv s10, t4                                                            # ir inst 48 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 49 fin
  lw s10, 0(s9)                                                         # ir inst 50 fin
# Phi connections
  mv s11, t4
  j .F.dijkstraShortestPath._16.if.exit.0                               # ir inst 51 fin
.F.dijkstraShortestPath._15.if.else.0:
# Phi connections
  mv s10, s11
  mv s11, t3
  j .F.dijkstraShortestPath._16.if.exit.0                               # ir inst 52 fin
.F.dijkstraShortestPath._16.if.exit.0:
  addi s9, t4, 1                                                        # ir inst 55 fin
# Phi connections
  mv t3, s11
  mv t4, s9
  mv s11, s10
  j .F.dijkstraShortestPath._9.while.cond.1                             # ir inst 56 fin
.F.dijkstraShortestPath._17.while.exit.1:
  li t2, -1
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 57 fin
  bnez t4, .F.dijkstraShortestPath._18.if.then.1
  j .F.dijkstraShortestPath._19.if.else.1                               # ir inst 58 fin
.F.dijkstraShortestPath._18.if.then.1:
  j .F.dijkstraShortestPath._33.while.exit.0                            # ir inst 59 fin
.F.dijkstraShortestPath._19.if.else.1:
  j .F.dijkstraShortestPath._20.if.exit.1                               # ir inst 60 fin
.F.dijkstraShortestPath._20.if.exit.1:
  mv t4, t3                                                             # ir inst 61 fin
  addi t1, sp, 232
  add s11, t1, t4                                                       # ir inst 62 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 63 fin
  mv t4, t3                                                             # ir inst 64 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add s11, t1, t2                                                       # ir inst 65 fin
  lw t4, 0(s11)                                                         # ir inst 66 fin
  add s11, t5, t4                                                       # ir inst 67 fin
# Phi connections
  li t4, 0
  j .F.dijkstraShortestPath._21.while.cond.2                            # ir inst 68 fin
.F.dijkstraShortestPath._21.while.cond.2:
  slt s10, t4, a1                                                       # ir inst 70 fin
  bnez s10, .F.dijkstraShortestPath._22.while.body.2
  j .F.dijkstraShortestPath._32.while.exit.2                            # ir inst 71 fin
.F.dijkstraShortestPath._22.while.body.2:
  mv s10, t4                                                            # ir inst 72 fin
  addi t1, sp, 232
  add s9, t1, s10                                                       # ir inst 73 fin
  lb s10, 0(s9)                                                         # ir inst 74 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 75 fin
  bnez s9, .F.dijkstraShortestPath._23.lazy.then.1
  j .F.dijkstraShortestPath._24.lazy.else.1                             # ir inst 76 fin
.F.dijkstraShortestPath._23.lazy.then.1:
  mul s10, t3, a1                                                       # ir inst 77 fin
  add s9, s10, t4                                                       # ir inst 78 fin
  mv s10, s9                                                            # ir inst 79 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 80 fin
  lw s10, 0(s9)                                                         # ir inst 81 fin
  li t2, 9999
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 82 fin
# Phi connections
  mv s10, s9
  j .F.dijkstraShortestPath._25.lazy.exit.1                             # ir inst 83 fin
.F.dijkstraShortestPath._24.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.dijkstraShortestPath._25.lazy.exit.1                             # ir inst 84 fin
.F.dijkstraShortestPath._25.lazy.exit.1:
  bnez s10, .F.dijkstraShortestPath._26.if.then.2
  j .F.dijkstraShortestPath._30.if.else.2                               # ir inst 86 fin
.F.dijkstraShortestPath._26.if.then.2:
  mv s10, t3                                                            # ir inst 87 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 88 fin
  lw s10, 0(s9)                                                         # ir inst 89 fin
  mul s9, t3, a1                                                        # ir inst 90 fin
  add s8, s9, t4                                                        # ir inst 91 fin
  mv s9, s8                                                             # ir inst 92 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 93 fin
  lw s9, 0(s8)                                                          # ir inst 94 fin
  add s8, s10, s9                                                       # ir inst 95 fin
  mv s10, t4                                                            # ir inst 96 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 97 fin
  lw s10, 0(s9)                                                         # ir inst 98 fin
  slt s9, s8, s10                                                       # ir inst 99 fin
  bnez s9, .F.dijkstraShortestPath._27.if.then.3
  j .F.dijkstraShortestPath._28.if.else.3                               # ir inst 100 fin
.F.dijkstraShortestPath._27.if.then.3:
  mv s10, t4                                                            # ir inst 101 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 102 fin
  sw s8, 0(s9)                                                          # ir inst 103 fin
  j .F.dijkstraShortestPath._29.if.exit.3                               # ir inst 104 fin
.F.dijkstraShortestPath._28.if.else.3:
  j .F.dijkstraShortestPath._29.if.exit.3                               # ir inst 105 fin
.F.dijkstraShortestPath._29.if.exit.3:
  j .F.dijkstraShortestPath._31.if.exit.2                               # ir inst 106 fin
.F.dijkstraShortestPath._30.if.else.2:
  j .F.dijkstraShortestPath._31.if.exit.2                               # ir inst 107 fin
.F.dijkstraShortestPath._31.if.exit.2:
  addi s10, t4, 1                                                       # ir inst 108 fin
# Phi connections
  mv t4, s10
  j .F.dijkstraShortestPath._21.while.cond.2                            # ir inst 109 fin
.F.dijkstraShortestPath._32.while.exit.2:
  addi t4, t6, 1                                                        # ir inst 110 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j .F.dijkstraShortestPath._7.while.cond.0                             # ir inst 111 fin
.F.dijkstraShortestPath._33.while.exit.0:
  mv a0, t5
  j .F.dijkstraShortestPath.epilogue                                    # ir inst 112 fin
.F.dijkstraShortestPath._34.critical_edge.0:
  j .F.dijkstraShortestPath._33.while.exit.0                            # ir inst 113 fin
.F.dijkstraShortestPath.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 288
  ret

.globl .F.floydWarshallAllPairs
.F.floydWarshallAllPairs:
# spill func args num: 0,             range:     1632(sp) -     1632(sp)
# local var size: 1600,               range:       24(sp) -     1624(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1632
  sd s10, 0(sp)
  sd s9, 8(sp)
  sd s11, 16(sp)
.F.floydWarshallAllPairs._0.entry.0:
  li t2, 20
  slt t6, t2, a1                                                        # ir inst 1 fin
  bnez t6, .F.floydWarshallAllPairs._1.if.then.0
  j .F.floydWarshallAllPairs._2.if.else.0                               # ir inst 2 fin
.F.floydWarshallAllPairs._1.if.then.0:
# Phi connections
  li t6, 20
  j .F.floydWarshallAllPairs._3.if.exit.0                               # ir inst 3 fin
.F.floydWarshallAllPairs._2.if.else.0:
# Phi connections
  mv t6, a1
  j .F.floydWarshallAllPairs._3.if.exit.0                               # ir inst 4 fin
.F.floydWarshallAllPairs._3.if.exit.0:
  addi t1, sp, 24
  addi t5, t1, 0                                                        # ir inst 7 fin
# Phi connections
  li t4, 0
  j .F.floydWarshallAllPairs._4.array.cond.0                            # ir inst 8 fin
.F.floydWarshallAllPairs._4.array.cond.0:
  li t2, 400
  slt t3, t4, t2                                                        # ir inst 10 fin
  bnez t3, .F.floydWarshallAllPairs._5.array.body.0
  j .F.floydWarshallAllPairs._6.array.exit.0                            # ir inst 11 fin
.F.floydWarshallAllPairs._5.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 12 fin
  li t1, 9999
  sw t1, 0(t3)                                                          # ir inst 13 fin
  addi t3, t4, 1                                                        # ir inst 14 fin
# Phi connections
  mv t4, t3
  j .F.floydWarshallAllPairs._4.array.cond.0                            # ir inst 15 fin
.F.floydWarshallAllPairs._6.array.exit.0:
# Phi connections
  li t5, 0
  j .F.floydWarshallAllPairs._7.while.cond.0                            # ir inst 16 fin
.F.floydWarshallAllPairs._7.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 18 fin
  bnez t4, .F.floydWarshallAllPairs._8.while.body.0
  j .F.floydWarshallAllPairs._12.while.exit.0                           # ir inst 19 fin
.F.floydWarshallAllPairs._8.while.body.0:
# Phi connections
  li t4, 0
  j .F.floydWarshallAllPairs._9.while.cond.1                            # ir inst 20 fin
.F.floydWarshallAllPairs._9.while.cond.1:
  slt t3, t4, t6                                                        # ir inst 22 fin
  bnez t3, .F.floydWarshallAllPairs._10.while.body.1
  j .F.floydWarshallAllPairs._11.while.exit.1                           # ir inst 23 fin
.F.floydWarshallAllPairs._10.while.body.1:
  mul t3, t5, t6                                                        # ir inst 24 fin
  add s11, t3, t4                                                       # ir inst 25 fin
  mv t3, s11                                                            # ir inst 26 fin
  slli t2, t3, 2
  addi t1, sp, 24
  add s11, t1, t2                                                       # ir inst 27 fin
  mul t3, t5, a1                                                        # ir inst 28 fin
  add s10, t3, t4                                                       # ir inst 29 fin
  mv t3, s10                                                            # ir inst 30 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 31 fin
  lw t3, 0(s10)                                                         # ir inst 32 fin
  sw t3, 0(s11)                                                         # ir inst 33 fin
  addi t3, t4, 1                                                        # ir inst 34 fin
# Phi connections
  mv t4, t3
  j .F.floydWarshallAllPairs._9.while.cond.1                            # ir inst 35 fin
.F.floydWarshallAllPairs._11.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 36 fin
# Phi connections
  mv t5, t4
  j .F.floydWarshallAllPairs._7.while.cond.0                            # ir inst 37 fin
.F.floydWarshallAllPairs._12.while.exit.0:
# Phi connections
  li t5, 0
  j .F.floydWarshallAllPairs._13.while.cond.2                           # ir inst 38 fin
.F.floydWarshallAllPairs._13.while.cond.2:
  slt t4, t5, t6                                                        # ir inst 40 fin
  bnez t4, .F.floydWarshallAllPairs._14.while.body.2
  j .F.floydWarshallAllPairs._30.while.exit.2                           # ir inst 41 fin
.F.floydWarshallAllPairs._14.while.body.2:
# Phi connections
  li t4, 0
  j .F.floydWarshallAllPairs._15.while.cond.3                           # ir inst 42 fin
.F.floydWarshallAllPairs._15.while.cond.3:
  slt t3, t4, t6                                                        # ir inst 44 fin
  bnez t3, .F.floydWarshallAllPairs._16.while.body.3
  j .F.floydWarshallAllPairs._29.while.exit.3                           # ir inst 45 fin
.F.floydWarshallAllPairs._16.while.body.3:
# Phi connections
  li t3, 0
  j .F.floydWarshallAllPairs._17.while.cond.4                           # ir inst 46 fin
.F.floydWarshallAllPairs._17.while.cond.4:
  slt s11, t3, t6                                                       # ir inst 48 fin
  bnez s11, .F.floydWarshallAllPairs._18.while.body.4
  j .F.floydWarshallAllPairs._28.while.exit.4                           # ir inst 49 fin
.F.floydWarshallAllPairs._18.while.body.4:
  mul s11, t4, t6                                                       # ir inst 50 fin
  add s10, s11, t5                                                      # ir inst 51 fin
  mv s11, s10                                                           # ir inst 52 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add s10, t1, t2                                                       # ir inst 53 fin
  lw s11, 0(s10)                                                        # ir inst 54 fin
  li t2, 9999
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 55 fin
  bnez s10, .F.floydWarshallAllPairs._19.lazy.then.0
  j .F.floydWarshallAllPairs._20.lazy.else.0                            # ir inst 56 fin
.F.floydWarshallAllPairs._19.lazy.then.0:
  mul s11, t5, t6                                                       # ir inst 57 fin
  add s10, s11, t3                                                      # ir inst 58 fin
  mv s11, s10                                                           # ir inst 59 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add s10, t1, t2                                                       # ir inst 60 fin
  lw s11, 0(s10)                                                        # ir inst 61 fin
  li t2, 9999
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 62 fin
# Phi connections
  mv s11, s10
  j .F.floydWarshallAllPairs._21.lazy.exit.0                            # ir inst 63 fin
.F.floydWarshallAllPairs._20.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.floydWarshallAllPairs._21.lazy.exit.0                            # ir inst 64 fin
.F.floydWarshallAllPairs._21.lazy.exit.0:
  bnez s11, .F.floydWarshallAllPairs._22.if.then.1
  j .F.floydWarshallAllPairs._26.if.else.1                              # ir inst 66 fin
.F.floydWarshallAllPairs._22.if.then.1:
  mul s11, t4, t6                                                       # ir inst 67 fin
  add s10, s11, t5                                                      # ir inst 68 fin
  mv s11, s10                                                           # ir inst 69 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add s10, t1, t2                                                       # ir inst 70 fin
  lw s11, 0(s10)                                                        # ir inst 71 fin
  mul s10, t5, t6                                                       # ir inst 72 fin
  add s9, s10, t3                                                       # ir inst 73 fin
  mv s10, s9                                                            # ir inst 74 fin
  slli t2, s10, 2
  addi t1, sp, 24
  add s9, t1, t2                                                        # ir inst 75 fin
  lw s10, 0(s9)                                                         # ir inst 76 fin
  add s9, s11, s10                                                      # ir inst 77 fin
  mul s11, t4, t6                                                       # ir inst 78 fin
  add s10, s11, t3                                                      # ir inst 79 fin
  mv s11, s10                                                           # ir inst 80 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add s10, t1, t2                                                       # ir inst 81 fin
  lw s11, 0(s10)                                                        # ir inst 82 fin
  slt s10, s9, s11                                                      # ir inst 83 fin
  bnez s10, .F.floydWarshallAllPairs._23.if.then.2
  j .F.floydWarshallAllPairs._24.if.else.2                              # ir inst 84 fin
.F.floydWarshallAllPairs._23.if.then.2:
  mul s11, t4, t6                                                       # ir inst 85 fin
  add s10, s11, t3                                                      # ir inst 86 fin
  mv s11, s10                                                           # ir inst 87 fin
  slli t2, s11, 2
  addi t1, sp, 24
  add s10, t1, t2                                                       # ir inst 88 fin
  sw s9, 0(s10)                                                         # ir inst 89 fin
  j .F.floydWarshallAllPairs._25.if.exit.2                              # ir inst 90 fin
.F.floydWarshallAllPairs._24.if.else.2:
  j .F.floydWarshallAllPairs._25.if.exit.2                              # ir inst 91 fin
.F.floydWarshallAllPairs._25.if.exit.2:
  j .F.floydWarshallAllPairs._27.if.exit.1                              # ir inst 92 fin
.F.floydWarshallAllPairs._26.if.else.1:
  j .F.floydWarshallAllPairs._27.if.exit.1                              # ir inst 93 fin
.F.floydWarshallAllPairs._27.if.exit.1:
  addi s11, t3, 1                                                       # ir inst 94 fin
# Phi connections
  mv t3, s11
  j .F.floydWarshallAllPairs._17.while.cond.4                           # ir inst 95 fin
.F.floydWarshallAllPairs._28.while.exit.4:
  addi t3, t4, 1                                                        # ir inst 96 fin
# Phi connections
  mv t4, t3
  j .F.floydWarshallAllPairs._15.while.cond.3                           # ir inst 97 fin
.F.floydWarshallAllPairs._29.while.exit.3:
  addi t4, t5, 1                                                        # ir inst 98 fin
# Phi connections
  mv t5, t4
  j .F.floydWarshallAllPairs._13.while.cond.2                           # ir inst 99 fin
.F.floydWarshallAllPairs._30.while.exit.2:
# Phi connections
  li t4, 0
  li t5, 0
  j .F.floydWarshallAllPairs._31.while.cond.5                           # ir inst 100 fin
.F.floydWarshallAllPairs._31.while.cond.5:
  slt t3, t5, t6                                                        # ir inst 103 fin
  bnez t3, .F.floydWarshallAllPairs._32.while.body.5
  j .F.floydWarshallAllPairs._42.while.exit.5                           # ir inst 104 fin
.F.floydWarshallAllPairs._32.while.body.5:
# Phi connections
  li s11, 0
  mv t3, t4
  j .F.floydWarshallAllPairs._33.while.cond.6                           # ir inst 105 fin
.F.floydWarshallAllPairs._33.while.cond.6:
  slt s10, s11, t6                                                      # ir inst 108 fin
  bnez s10, .F.floydWarshallAllPairs._34.while.body.6
  j .F.floydWarshallAllPairs._41.while.exit.6                           # ir inst 109 fin
.F.floydWarshallAllPairs._34.while.body.6:
  xor t0, t5, s11
  sltu s10, zero, t0                                                    # ir inst 110 fin
  bnez s10, .F.floydWarshallAllPairs._35.lazy.then.1
  j .F.floydWarshallAllPairs._36.lazy.else.1                            # ir inst 111 fin
.F.floydWarshallAllPairs._35.lazy.then.1:
  mul s10, t5, t6                                                       # ir inst 112 fin
  add s9, s10, s11                                                      # ir inst 113 fin
  mv s10, s9                                                            # ir inst 114 fin
  slli t2, s10, 2
  addi t1, sp, 24
  add s9, t1, t2                                                        # ir inst 115 fin
  lw s10, 0(s9)                                                         # ir inst 116 fin
  li t2, 9999
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 117 fin
# Phi connections
  mv s10, s9
  j .F.floydWarshallAllPairs._37.lazy.exit.1                            # ir inst 118 fin
.F.floydWarshallAllPairs._36.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.floydWarshallAllPairs._37.lazy.exit.1                            # ir inst 119 fin
.F.floydWarshallAllPairs._37.lazy.exit.1:
  bnez s10, .F.floydWarshallAllPairs._38.if.then.3
  j .F.floydWarshallAllPairs._39.if.else.3                              # ir inst 121 fin
.F.floydWarshallAllPairs._38.if.then.3:
  mul s10, t5, t6                                                       # ir inst 122 fin
  add s9, s10, s11                                                      # ir inst 123 fin
  mv s10, s9                                                            # ir inst 124 fin
  slli t2, s10, 2
  addi t1, sp, 24
  add s9, t1, t2                                                        # ir inst 125 fin
  lw s10, 0(s9)                                                         # ir inst 126 fin
  add s9, t3, s10                                                       # ir inst 127 fin
# Phi connections
  mv s10, s9
  j .F.floydWarshallAllPairs._40.if.exit.3                              # ir inst 128 fin
.F.floydWarshallAllPairs._39.if.else.3:
# Phi connections
  mv s10, t3
  j .F.floydWarshallAllPairs._40.if.exit.3                              # ir inst 129 fin
.F.floydWarshallAllPairs._40.if.exit.3:
  addi s9, s11, 1                                                       # ir inst 131 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  j .F.floydWarshallAllPairs._33.while.cond.6                           # ir inst 132 fin
.F.floydWarshallAllPairs._41.while.exit.6:
  addi s11, t5, 1                                                       # ir inst 133 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.floydWarshallAllPairs._31.while.cond.5                           # ir inst 134 fin
.F.floydWarshallAllPairs._42.while.exit.5:
  mv a0, t4
  j .F.floydWarshallAllPairs.epilogue                                   # ir inst 135 fin
.F.floydWarshallAllPairs.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 1632
  ret

.globl .F.bellmanFordShortestPath
.F.bellmanFordShortestPath:
# spill func args num: 0,             range:      240(sp) -      240(sp)
# local var size: 200,                range:       40(sp) -      240(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -240
  sd s7, 0(sp)
  sd s8, 8(sp)
  sd s9, 16(sp)
  sd s10, 24(sp)
  sd s11, 32(sp)
.F.bellmanFordShortestPath._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.bellmanFordShortestPath._1.array.cond.0                          # ir inst 3 fin
.F.bellmanFordShortestPath._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.bellmanFordShortestPath._2.array.body.0
  j .F.bellmanFordShortestPath._3.array.exit.0                          # ir inst 6 fin
.F.bellmanFordShortestPath._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 9999
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.bellmanFordShortestPath._1.array.cond.0                          # ir inst 10 fin
.F.bellmanFordShortestPath._3.array.exit.0:
  mv t6, a2                                                             # ir inst 11 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 13 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.bellmanFordShortestPath._4.while.cond.0                          # ir inst 14 fin
.F.bellmanFordShortestPath._4.while.cond.0:
  addi t4, a1, -1                                                       # ir inst 17 fin
  slt t3, t5, t4                                                        # ir inst 18 fin
  bnez t3, .F.bellmanFordShortestPath._5.while.body.0
  j .F.bellmanFordShortestPath._21.while.exit.0                         # ir inst 19 fin
.F.bellmanFordShortestPath._5.while.body.0:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F.bellmanFordShortestPath._6.while.cond.1                          # ir inst 20 fin
.F.bellmanFordShortestPath._6.while.cond.1:
  slt s11, t4, a1                                                       # ir inst 23 fin
  bnez s11, .F.bellmanFordShortestPath._7.while.body.1
  j .F.bellmanFordShortestPath._20.while.exit.1                         # ir inst 24 fin
.F.bellmanFordShortestPath._7.while.body.1:
# Phi connections
  li s10, 0
  mv s11, t3
  j .F.bellmanFordShortestPath._8.while.cond.2                          # ir inst 25 fin
.F.bellmanFordShortestPath._8.while.cond.2:
  slt s9, s10, a1                                                       # ir inst 28 fin
  bnez s9, .F.bellmanFordShortestPath._9.while.body.2
  j .F.bellmanFordShortestPath._19.while.exit.2                         # ir inst 29 fin
.F.bellmanFordShortestPath._9.while.body.2:
  mul s9, t4, a1                                                        # ir inst 30 fin
  add s8, s9, s10                                                       # ir inst 31 fin
  mv s9, s8                                                             # ir inst 32 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 33 fin
  lw s9, 0(s8)                                                          # ir inst 34 fin
  li t2, 9999
  xor t0, s9, t2
  sltu s8, zero, t0                                                     # ir inst 35 fin
  bnez s8, .F.bellmanFordShortestPath._10.lazy.then.0
  j .F.bellmanFordShortestPath._11.lazy.else.0                          # ir inst 36 fin
.F.bellmanFordShortestPath._10.lazy.then.0:
  mv s9, t4                                                             # ir inst 37 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 38 fin
  lw s9, 0(s8)                                                          # ir inst 39 fin
  li t2, 9999
  xor t0, s9, t2
  sltu s8, zero, t0                                                     # ir inst 40 fin
# Phi connections
  mv s9, s8
  j .F.bellmanFordShortestPath._12.lazy.exit.0                          # ir inst 41 fin
.F.bellmanFordShortestPath._11.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.bellmanFordShortestPath._12.lazy.exit.0                          # ir inst 42 fin
.F.bellmanFordShortestPath._12.lazy.exit.0:
  bnez s9, .F.bellmanFordShortestPath._13.if.then.0
  j .F.bellmanFordShortestPath._17.if.else.0                            # ir inst 44 fin
.F.bellmanFordShortestPath._13.if.then.0:
  mv s9, t4                                                             # ir inst 45 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 46 fin
  lw s9, 0(s8)                                                          # ir inst 47 fin
  mul s8, t4, a1                                                        # ir inst 48 fin
  add s7, s8, s10                                                       # ir inst 49 fin
  mv s8, s7                                                             # ir inst 50 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 51 fin
  lw s8, 0(s7)                                                          # ir inst 52 fin
  add s7, s9, s8                                                        # ir inst 53 fin
  mv s9, s10                                                            # ir inst 54 fin
  slli t2, s9, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 55 fin
  lw s9, 0(s8)                                                          # ir inst 56 fin
  slt s8, s7, s9                                                        # ir inst 57 fin
  bnez s8, .F.bellmanFordShortestPath._14.if.then.1
  j .F.bellmanFordShortestPath._15.if.else.1                            # ir inst 58 fin
.F.bellmanFordShortestPath._14.if.then.1:
  addi s9, s11, 1                                                       # ir inst 59 fin
# Phi connections
  j .F.bellmanFordShortestPath._16.if.exit.1                            # ir inst 60 fin
.F.bellmanFordShortestPath._15.if.else.1:
# Phi connections
  mv s9, s11
  j .F.bellmanFordShortestPath._16.if.exit.1                            # ir inst 61 fin
.F.bellmanFordShortestPath._16.if.exit.1:
# Phi connections
  j .F.bellmanFordShortestPath._18.if.exit.0                            # ir inst 63 fin
.F.bellmanFordShortestPath._17.if.else.0:
# Phi connections
  mv s9, s11
  j .F.bellmanFordShortestPath._18.if.exit.0                            # ir inst 64 fin
.F.bellmanFordShortestPath._18.if.exit.0:
  addi s8, s10, 1                                                       # ir inst 66 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F.bellmanFordShortestPath._8.while.cond.2                          # ir inst 67 fin
.F.bellmanFordShortestPath._19.while.exit.2:
  addi s10, t4, 1                                                       # ir inst 68 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.bellmanFordShortestPath._6.while.cond.1                          # ir inst 69 fin
.F.bellmanFordShortestPath._20.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 70 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.bellmanFordShortestPath._4.while.cond.0                          # ir inst 71 fin
.F.bellmanFordShortestPath._21.while.exit.0:
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.bellmanFordShortestPath._22.while.cond.3                         # ir inst 72 fin
.F.bellmanFordShortestPath._22.while.cond.3:
  slt t4, t6, a1                                                        # ir inst 75 fin
  bnez t4, .F.bellmanFordShortestPath._23.while.body.3
  j .F.bellmanFordShortestPath._36.while.exit.3                         # ir inst 76 fin
.F.bellmanFordShortestPath._23.while.body.3:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.bellmanFordShortestPath._24.while.cond.4                         # ir inst 77 fin
.F.bellmanFordShortestPath._24.while.cond.4:
  slt s11, t4, a1                                                       # ir inst 80 fin
  bnez s11, .F.bellmanFordShortestPath._25.while.body.4
  j .F.bellmanFordShortestPath._35.while.exit.4                         # ir inst 81 fin
.F.bellmanFordShortestPath._25.while.body.4:
  mul s11, t6, a1                                                       # ir inst 82 fin
  add s10, s11, t4                                                      # ir inst 83 fin
  mv s11, s10                                                           # ir inst 84 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 85 fin
  lw s11, 0(s10)                                                        # ir inst 86 fin
  li t2, 9999
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 87 fin
  bnez s10, .F.bellmanFordShortestPath._26.lazy.then.1
  j .F.bellmanFordShortestPath._27.lazy.else.1                          # ir inst 88 fin
.F.bellmanFordShortestPath._26.lazy.then.1:
  mv s11, t6                                                            # ir inst 89 fin
  slli t2, s11, 2
  addi t1, sp, 40
  add s10, t1, t2                                                       # ir inst 90 fin
  lw s11, 0(s10)                                                        # ir inst 91 fin
  li t2, 9999
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 92 fin
# Phi connections
  mv s11, s10
  j .F.bellmanFordShortestPath._28.lazy.exit.1                          # ir inst 93 fin
.F.bellmanFordShortestPath._27.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.bellmanFordShortestPath._28.lazy.exit.1                          # ir inst 94 fin
.F.bellmanFordShortestPath._28.lazy.exit.1:
  bnez s11, .F.bellmanFordShortestPath._29.if.then.2
  j .F.bellmanFordShortestPath._33.if.else.2                            # ir inst 96 fin
.F.bellmanFordShortestPath._29.if.then.2:
  mv s11, t6                                                            # ir inst 97 fin
  slli t2, s11, 2
  addi t1, sp, 40
  add s10, t1, t2                                                       # ir inst 98 fin
  lw s11, 0(s10)                                                        # ir inst 99 fin
  mul s10, t6, a1                                                       # ir inst 100 fin
  add s9, s10, t4                                                       # ir inst 101 fin
  mv s10, s9                                                            # ir inst 102 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 103 fin
  lw s10, 0(s9)                                                         # ir inst 104 fin
  add s9, s11, s10                                                      # ir inst 105 fin
  mv s11, t4                                                            # ir inst 106 fin
  slli t2, s11, 2
  addi t1, sp, 40
  add s10, t1, t2                                                       # ir inst 107 fin
  lw s11, 0(s10)                                                        # ir inst 108 fin
  slt s10, s9, s11                                                      # ir inst 109 fin
  bnez s10, .F.bellmanFordShortestPath._30.if.then.3
  j .F.bellmanFordShortestPath._31.if.else.3                            # ir inst 110 fin
.F.bellmanFordShortestPath._30.if.then.3:
  addi s11, t3, 1                                                       # ir inst 111 fin
# Phi connections
  j .F.bellmanFordShortestPath._32.if.exit.3                            # ir inst 112 fin
.F.bellmanFordShortestPath._31.if.else.3:
# Phi connections
  mv s11, t3
  j .F.bellmanFordShortestPath._32.if.exit.3                            # ir inst 113 fin
.F.bellmanFordShortestPath._32.if.exit.3:
# Phi connections
  j .F.bellmanFordShortestPath._34.if.exit.2                            # ir inst 115 fin
.F.bellmanFordShortestPath._33.if.else.2:
# Phi connections
  mv s11, t3
  j .F.bellmanFordShortestPath._34.if.exit.2                            # ir inst 116 fin
.F.bellmanFordShortestPath._34.if.exit.2:
  addi s10, t4, 1                                                       # ir inst 118 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.bellmanFordShortestPath._24.while.cond.4                         # ir inst 119 fin
.F.bellmanFordShortestPath._35.while.exit.4:
  addi t4, t6, 1                                                        # ir inst 120 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.bellmanFordShortestPath._22.while.cond.3                         # ir inst 121 fin
.F.bellmanFordShortestPath._36.while.exit.3:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.bellmanFordShortestPath._37.while.cond.5                         # ir inst 122 fin
.F.bellmanFordShortestPath._37.while.cond.5:
  slt t3, t4, a1                                                        # ir inst 125 fin
  bnez t3, .F.bellmanFordShortestPath._38.while.body.5
  j .F.bellmanFordShortestPath._42.while.exit.5                         # ir inst 126 fin
.F.bellmanFordShortestPath._38.while.body.5:
  mv t3, t4                                                             # ir inst 127 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 128 fin
  lw t3, 0(s11)                                                         # ir inst 129 fin
  li t2, 9999
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 130 fin
  bnez s11, .F.bellmanFordShortestPath._39.if.then.4
  j .F.bellmanFordShortestPath._40.if.else.4                            # ir inst 131 fin
.F.bellmanFordShortestPath._39.if.then.4:
  mv t3, t4                                                             # ir inst 132 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 133 fin
  lw t3, 0(s11)                                                         # ir inst 134 fin
  add s11, t6, t3                                                       # ir inst 135 fin
# Phi connections
  mv t3, s11
  j .F.bellmanFordShortestPath._41.if.exit.4                            # ir inst 136 fin
.F.bellmanFordShortestPath._40.if.else.4:
# Phi connections
  mv t3, t6
  j .F.bellmanFordShortestPath._41.if.exit.4                            # ir inst 137 fin
.F.bellmanFordShortestPath._41.if.exit.4:
  addi s11, t4, 1                                                       # ir inst 139 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j .F.bellmanFordShortestPath._37.while.cond.5                         # ir inst 140 fin
.F.bellmanFordShortestPath._42.while.exit.5:
  add t4, t6, t5                                                        # ir inst 141 fin
  mv a0, t4
  j .F.bellmanFordShortestPath.epilogue                                 # ir inst 142 fin
.F.bellmanFordShortestPath.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s10, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 240
  ret

.globl .F.testMinimumSpanningTreeAlgorithms
.F.testMinimumSpanningTreeAlgorithms:
# spill func args num: 0,             range:    10016(sp) -    10016(sp)
# local var size: 10000,              range:       16(sp) -    10016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testMinimumSpanningTreeAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1705
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testMinimumSpanningTreeAlgorithms._1.array.cond.0                # ir inst 4 fin
.F.testMinimumSpanningTreeAlgorithms._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testMinimumSpanningTreeAlgorithms._2.array.body.0
  j .F.testMinimumSpanningTreeAlgorithms._3.array.exit.0                # ir inst 7 fin
.F.testMinimumSpanningTreeAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testMinimumSpanningTreeAlgorithms._1.array.cond.0                # ir inst 11 fin
.F.testMinimumSpanningTreeAlgorithms._3.array.exit.0:
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeWeightedGraph
# ir inst 12 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.kruskalMST
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.primMST
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a0, 1706
  call printlnInt
# ir inst 17 fin
  j .F.testMinimumSpanningTreeAlgorithms.epilogue                       # ir inst 18 fin
.F.testMinimumSpanningTreeAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 10016
  add sp, sp, t0
  ret

.globl .F.kruskalMST
.F.kruskalMST:
# spill func args num: 0,             range:     6064(sp) -     6064(sp)
# local var size: 6000,               range:       56(sp) -     6056(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 4 / 12,        range:       16(sp) -       48(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6064
  add sp, sp, t0
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s11, 32(sp)
  sd s10, 40(sp)
  sd ra, 48(sp)
.F.kruskalMST._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.kruskalMST._1.array.cond.0                                       # ir inst 3 fin
.F.kruskalMST._1.array.cond.0:
  li t2, 1500
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.kruskalMST._2.array.body.0
  j .F.kruskalMST._3.array.exit.0                                       # ir inst 6 fin
.F.kruskalMST._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.kruskalMST._1.array.cond.0                                       # ir inst 10 fin
.F.kruskalMST._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.kruskalMST._4.while.cond.0                                       # ir inst 11 fin
.F.kruskalMST._4.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 14 fin
  bnez t4, .F.kruskalMST._5.lazy.then.0
  j .F.kruskalMST._6.lazy.else.0                                        # ir inst 15 fin
.F.kruskalMST._5.lazy.then.0:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 16 fin
# Phi connections
  j .F.kruskalMST._7.lazy.exit.0                                        # ir inst 17 fin
.F.kruskalMST._6.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.kruskalMST._7.lazy.exit.0                                        # ir inst 18 fin
.F.kruskalMST._7.lazy.exit.0:
  bnez t4, .F.kruskalMST._8.while.body.0
  j .F.kruskalMST._21.while.exit.0                                      # ir inst 20 fin
.F.kruskalMST._8.while.body.0:
  addi t4, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.kruskalMST._9.while.cond.1                                       # ir inst 22 fin
.F.kruskalMST._9.while.cond.1:
  slt s11, t3, a1                                                       # ir inst 25 fin
  bnez s11, .F.kruskalMST._10.lazy.then.1
  j .F.kruskalMST._11.lazy.else.1                                       # ir inst 26 fin
.F.kruskalMST._10.lazy.then.1:
  li t2, 500
  slt s11, t4, t2                                                       # ir inst 27 fin
# Phi connections
  j .F.kruskalMST._12.lazy.exit.1                                       # ir inst 28 fin
.F.kruskalMST._11.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.kruskalMST._12.lazy.exit.1                                       # ir inst 29 fin
.F.kruskalMST._12.lazy.exit.1:
  bnez s11, .F.kruskalMST._13.while.body.1
  j .F.kruskalMST._20.while.exit.1                                      # ir inst 31 fin
.F.kruskalMST._13.while.body.1:
  mul s11, t6, a1                                                       # ir inst 32 fin
  add s10, s11, t3                                                      # ir inst 33 fin
  mv s11, s10                                                           # ir inst 34 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 35 fin
  lw s11, 0(s10)                                                        # ir inst 36 fin
  li t2, 9999
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 37 fin
  bnez s10, .F.kruskalMST._14.lazy.then.2
  j .F.kruskalMST._15.lazy.else.2                                       # ir inst 38 fin
.F.kruskalMST._14.lazy.then.2:
  mul s11, t6, a1                                                       # ir inst 39 fin
  add s10, s11, t3                                                      # ir inst 40 fin
  mv s11, s10                                                           # ir inst 41 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 42 fin
  lw s11, 0(s10)                                                        # ir inst 43 fin
  li t2, 0
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 44 fin
# Phi connections
  mv s11, s10
  j .F.kruskalMST._16.lazy.exit.2                                       # ir inst 45 fin
.F.kruskalMST._15.lazy.else.2:
# Phi connections
  li s11, 0
  j .F.kruskalMST._16.lazy.exit.2                                       # ir inst 46 fin
.F.kruskalMST._16.lazy.exit.2:
  bnez s11, .F.kruskalMST._17.if.then.0
  j .F.kruskalMST._18.if.else.0                                         # ir inst 48 fin
.F.kruskalMST._17.if.then.0:
  mv s11, t4                                                            # ir inst 49 fin
  li t2, 3
  mul s10, s11, t2                                                      # ir inst 50 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 51 fin
  mul s10, t6, a1                                                       # ir inst 52 fin
  add s9, s10, t3                                                       # ir inst 53 fin
  mv s10, s9                                                            # ir inst 54 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 55 fin
  lw s10, 0(s9)                                                         # ir inst 56 fin
  sw s10, 0(s11)                                                        # ir inst 57 fin
  mv s11, t4                                                            # ir inst 58 fin
  li t2, 3
  mul s10, s11, t2                                                      # ir inst 59 fin
  addi s11, s10, 1                                                      # ir inst 60 fin
  slli t2, s11, 2
  addi t1, sp, 56
  add s10, t1, t2                                                       # ir inst 61 fin
  sw t6, 0(s10)                                                         # ir inst 62 fin
  mv s11, t4                                                            # ir inst 63 fin
  li t2, 3
  mul s10, s11, t2                                                      # ir inst 64 fin
  addi s11, s10, 2                                                      # ir inst 65 fin
  slli t2, s11, 2
  addi t1, sp, 56
  add s10, t1, t2                                                       # ir inst 66 fin
  sw t3, 0(s10)                                                         # ir inst 67 fin
  addi s11, t4, 1                                                       # ir inst 68 fin
# Phi connections
  j .F.kruskalMST._19.if.exit.0                                         # ir inst 69 fin
.F.kruskalMST._18.if.else.0:
# Phi connections
  mv s11, t4
  j .F.kruskalMST._19.if.exit.0                                         # ir inst 70 fin
.F.kruskalMST._19.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 72 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.kruskalMST._9.while.cond.1                                       # ir inst 73 fin
.F.kruskalMST._20.while.exit.1:
  addi t3, t6, 1                                                        # ir inst 74 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.kruskalMST._4.while.cond.0                                       # ir inst 75 fin
.F.kruskalMST._21.while.exit.0:
# Start call preparation
  sd a1, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  addi t1, sp, 56
  mv a0, t1
  call .F.sortEdgesByWeight
  ld a1, 0(sp)
  ld t5, 8(sp)
# ir inst 76 fin
# Phi connections
  li t3, 0
  li t4, 0
  li t6, 0
  j .F.kruskalMST._22.while.cond.2                                      # ir inst 77 fin
.F.kruskalMST._22.while.cond.2:
  slt s11, t6, t5                                                       # ir inst 81 fin
  bnez s11, .F.kruskalMST._23.lazy.then.3
  j .F.kruskalMST._24.lazy.else.3                                       # ir inst 82 fin
.F.kruskalMST._23.lazy.then.3:
  addi s11, a1, -1                                                      # ir inst 83 fin
  slt s10, t4, s11                                                      # ir inst 84 fin
# Phi connections
  mv s11, s10
  j .F.kruskalMST._25.lazy.exit.3                                       # ir inst 85 fin
.F.kruskalMST._24.lazy.else.3:
# Phi connections
  li s11, 0
  j .F.kruskalMST._25.lazy.exit.3                                       # ir inst 86 fin
.F.kruskalMST._25.lazy.exit.3:
  bnez s11, .F.kruskalMST._26.while.body.2
  j .F.kruskalMST._30.while.exit.2                                      # ir inst 88 fin
.F.kruskalMST._26.while.body.2:
  mv s11, t6                                                            # ir inst 89 fin
  li t2, 3
  mul s10, s11, t2                                                      # ir inst 90 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 91 fin
  lw s10, 0(s11)                                                        # ir inst 92 fin
  mv s11, t6                                                            # ir inst 93 fin
  li t2, 3
  mul s9, s11, t2                                                       # ir inst 94 fin
  addi s11, s9, 1                                                       # ir inst 95 fin
  slli t2, s11, 2
  addi t1, sp, 56
  add s9, t1, t2                                                        # ir inst 96 fin
  lw s11, 0(s9)                                                         # ir inst 97 fin
  mv s9, t6                                                             # ir inst 98 fin
  li t2, 3
  mul s8, s9, t2                                                        # ir inst 99 fin
  addi s9, s8, 2                                                        # ir inst 100 fin
  slli t2, s9, 2
  addi t1, sp, 56
  add s8, t1, t2                                                        # ir inst 101 fin
  lw s9, 0(s8)                                                          # ir inst 102 fin
  xor t0, s11, s9
  sltu s8, zero, t0                                                     # ir inst 103 fin
  bnez s8, .F.kruskalMST._27.if.then.1
  j .F.kruskalMST._28.if.else.1                                         # ir inst 104 fin
.F.kruskalMST._27.if.then.1:
  add s11, t3, s10                                                      # ir inst 105 fin
  addi s10, t4, 1                                                       # ir inst 106 fin
# Phi connections
  mv t4, s10
  j .F.kruskalMST._29.if.exit.1                                         # ir inst 107 fin
.F.kruskalMST._28.if.else.1:
# Phi connections
  mv s11, t3
  j .F.kruskalMST._29.if.exit.1                                         # ir inst 108 fin
.F.kruskalMST._29.if.exit.1:
  addi s10, t6, 1                                                       # ir inst 111 fin
# Phi connections
  mv t3, s11
  mv t6, s10
  j .F.kruskalMST._22.while.cond.2                                      # ir inst 112 fin
.F.kruskalMST._30.while.exit.2:
  mv a0, t3
  j .F.kruskalMST.epilogue                                              # ir inst 113 fin
.F.kruskalMST.epilogue:
  ld ra, 48(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s11, 32(sp)
  ld s10, 40(sp)
  li t0, 6064
  add sp, sp, t0
  ret

.globl .F.sortEdgesByWeight
.F.sortEdgesByWeight:
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
.F.sortEdgesByWeight._0.entry.0:
# Phi connections
  li t6, 0
  j .F.sortEdgesByWeight._1.while.cond.0                                # ir inst 1 fin
.F.sortEdgesByWeight._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.sortEdgesByWeight._2.while.body.0
  j .F.sortEdgesByWeight._9.while.exit.0                                # ir inst 5 fin
.F.sortEdgesByWeight._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.sortEdgesByWeight._3.while.cond.1                                # ir inst 6 fin
.F.sortEdgesByWeight._3.while.cond.1:
  sub t4, a1, t6                                                        # ir inst 8 fin
  addi t3, t4, -1                                                       # ir inst 9 fin
  slt t4, t5, t3                                                        # ir inst 10 fin
  bnez t4, .F.sortEdgesByWeight._4.while.body.1
  j .F.sortEdgesByWeight._8.while.exit.1                                # ir inst 11 fin
.F.sortEdgesByWeight._4.while.body.1:
  mv t4, t5                                                             # ir inst 12 fin
  li t2, 3
  mul t3, t4, t2                                                        # ir inst 13 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  lw t3, 0(t4)                                                          # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  addi s11, t4, 1                                                       # ir inst 17 fin
  li t2, 3
  mul t4, s11, t2                                                       # ir inst 18 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  lw t4, 0(s11)                                                         # ir inst 20 fin
  slt s11, t4, t3                                                       # ir inst 21 fin
  bnez s11, .F.sortEdgesByWeight._5.if.then.0
  j .F.sortEdgesByWeight._6.if.else.0                                   # ir inst 22 fin
.F.sortEdgesByWeight._5.if.then.0:
  mv t4, t5                                                             # ir inst 23 fin
  li t2, 3
  mul t3, t4, t2                                                        # ir inst 24 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 25 fin
  lw t3, 0(t4)                                                          # ir inst 26 fin
  mv t4, t5                                                             # ir inst 27 fin
  li t2, 3
  mul s11, t4, t2                                                       # ir inst 28 fin
  addi t4, s11, 1                                                       # ir inst 29 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  lw t4, 0(s11)                                                         # ir inst 31 fin
  mv s11, t5                                                            # ir inst 32 fin
  li t2, 3
  mul s10, s11, t2                                                      # ir inst 33 fin
  addi s11, s10, 2                                                      # ir inst 34 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 35 fin
  lw s11, 0(s10)                                                        # ir inst 36 fin
  mv s10, t5                                                            # ir inst 37 fin
  li t2, 3
  mul s9, s10, t2                                                       # ir inst 38 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 39 fin
  mv s9, t5                                                             # ir inst 40 fin
  addi s8, s9, 1                                                        # ir inst 41 fin
  li t2, 3
  mul s9, s8, t2                                                        # ir inst 42 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 43 fin
  lw s9, 0(s8)                                                          # ir inst 44 fin
  sw s9, 0(s10)                                                         # ir inst 45 fin
  mv s10, t5                                                            # ir inst 46 fin
  li t2, 3
  mul s9, s10, t2                                                       # ir inst 47 fin
  addi s10, s9, 1                                                       # ir inst 48 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 49 fin
  mv s10, t5                                                            # ir inst 50 fin
  addi s8, s10, 1                                                       # ir inst 51 fin
  li t2, 3
  mul s10, s8, t2                                                       # ir inst 52 fin
  addi s8, s10, 1                                                       # ir inst 53 fin
  slli t2, s8, 2
  add s10, a0, t2                                                       # ir inst 54 fin
  lw s8, 0(s10)                                                         # ir inst 55 fin
  sw s8, 0(s9)                                                          # ir inst 56 fin
  mv s10, t5                                                            # ir inst 57 fin
  li t2, 3
  mul s9, s10, t2                                                       # ir inst 58 fin
  addi s10, s9, 2                                                       # ir inst 59 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 60 fin
  mv s10, t5                                                            # ir inst 61 fin
  addi s8, s10, 1                                                       # ir inst 62 fin
  li t2, 3
  mul s10, s8, t2                                                       # ir inst 63 fin
  addi s8, s10, 2                                                       # ir inst 64 fin
  slli t2, s8, 2
  add s10, a0, t2                                                       # ir inst 65 fin
  lw s8, 0(s10)                                                         # ir inst 66 fin
  sw s8, 0(s9)                                                          # ir inst 67 fin
  mv s10, t5                                                            # ir inst 68 fin
  addi s9, s10, 1                                                       # ir inst 69 fin
  li t2, 3
  mul s10, s9, t2                                                       # ir inst 70 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 71 fin
  sw t3, 0(s9)                                                          # ir inst 72 fin
  mv t3, t5                                                             # ir inst 73 fin
  addi s10, t3, 1                                                       # ir inst 74 fin
  li t2, 3
  mul t3, s10, t2                                                       # ir inst 75 fin
  addi s10, t3, 1                                                       # ir inst 76 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 77 fin
  sw t4, 0(t3)                                                          # ir inst 78 fin
  mv t4, t5                                                             # ir inst 79 fin
  addi t3, t4, 1                                                        # ir inst 80 fin
  li t2, 3
  mul t4, t3, t2                                                        # ir inst 81 fin
  addi t3, t4, 2                                                        # ir inst 82 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 83 fin
  sw s11, 0(t4)                                                         # ir inst 84 fin
  j .F.sortEdgesByWeight._7.if.exit.0                                   # ir inst 85 fin
.F.sortEdgesByWeight._6.if.else.0:
  j .F.sortEdgesByWeight._7.if.exit.0                                   # ir inst 86 fin
.F.sortEdgesByWeight._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 87 fin
# Phi connections
  mv t5, t4
  j .F.sortEdgesByWeight._3.while.cond.1                                # ir inst 88 fin
.F.sortEdgesByWeight._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 89 fin
# Phi connections
  mv t6, t5
  j .F.sortEdgesByWeight._1.while.cond.0                                # ir inst 90 fin
.F.sortEdgesByWeight._9.while.exit.0:
  j .F.sortEdgesByWeight.epilogue                                       # ir inst 91 fin
.F.sortEdgesByWeight.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.primMST
.F.primMST:
# spill func args num: 0,             range:      288(sp) -      288(sp)
# local var size: 250,                range:       32(sp) -      282(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -288
  sd s11, 0(sp)
  sd s9, 8(sp)
  sd s8, 16(sp)
  sd s10, 24(sp)
.F.primMST._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.primMST._1.array.cond.0                                          # ir inst 3 fin
.F.primMST._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.primMST._2.array.body.0
  j .F.primMST._3.array.exit.0                                          # ir inst 6 fin
.F.primMST._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 9999
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.primMST._1.array.cond.0                                          # ir inst 10 fin
.F.primMST._3.array.exit.0:
  addi t1, sp, 232
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.primMST._4.array.cond.1                                          # ir inst 13 fin
.F.primMST._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.primMST._5.array.body.1
  j .F.primMST._6.array.exit.1                                          # ir inst 16 fin
.F.primMST._5.array.body.1:
  add t4, t6, t5                                                        # ir inst 17 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.primMST._4.array.cond.1                                          # ir inst 20 fin
.F.primMST._6.array.exit.1:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 22 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.primMST._7.while.cond.0                                          # ir inst 23 fin
.F.primMST._7.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 26 fin
  bnez t4, .F.primMST._8.while.body.0
  j .F.primMST._37.critical_edge.0                                      # ir inst 27 fin
.F.primMST._8.while.body.0:
# Phi connections
  li s11, -1
  li t3, 9999
  li t4, 0
  j .F.primMST._9.while.cond.1                                          # ir inst 28 fin
.F.primMST._9.while.cond.1:
  slt s10, t4, a1                                                       # ir inst 32 fin
  bnez s10, .F.primMST._10.while.body.1
  j .F.primMST._17.while.exit.1                                         # ir inst 33 fin
.F.primMST._10.while.body.1:
  mv s10, t4                                                            # ir inst 34 fin
  addi t1, sp, 232
  add s9, t1, s10                                                       # ir inst 35 fin
  lb s10, 0(s9)                                                         # ir inst 36 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 37 fin
  bnez s9, .F.primMST._11.lazy.then.0
  j .F.primMST._12.lazy.else.0                                          # ir inst 38 fin
.F.primMST._11.lazy.then.0:
  mv s10, t4                                                            # ir inst 39 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 40 fin
  lw s10, 0(s9)                                                         # ir inst 41 fin
  slt s9, s10, t3                                                       # ir inst 42 fin
# Phi connections
  mv s10, s9
  j .F.primMST._13.lazy.exit.0                                          # ir inst 43 fin
.F.primMST._12.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.primMST._13.lazy.exit.0                                          # ir inst 44 fin
.F.primMST._13.lazy.exit.0:
  bnez s10, .F.primMST._14.if.then.0
  j .F.primMST._15.if.else.0                                            # ir inst 46 fin
.F.primMST._14.if.then.0:
  mv s10, t4                                                            # ir inst 47 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 48 fin
  lw s10, 0(s9)                                                         # ir inst 49 fin
# Phi connections
  mv t3, s10
  mv s10, t4
  j .F.primMST._16.if.exit.0                                            # ir inst 50 fin
.F.primMST._15.if.else.0:
# Phi connections
  mv s10, s11
  j .F.primMST._16.if.exit.0                                            # ir inst 51 fin
.F.primMST._16.if.exit.0:
  addi s9, t4, 1                                                        # ir inst 54 fin
# Phi connections
  mv s11, s10
  mv t4, s9
  j .F.primMST._9.while.cond.1                                          # ir inst 55 fin
.F.primMST._17.while.exit.1:
  li t2, -1
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 56 fin
  bnez t4, .F.primMST._18.if.then.1
  j .F.primMST._19.if.else.1                                            # ir inst 57 fin
.F.primMST._18.if.then.1:
  j .F.primMST._36.while.exit.0                                         # ir inst 58 fin
.F.primMST._19.if.else.1:
  j .F.primMST._20.if.exit.1                                            # ir inst 59 fin
.F.primMST._20.if.exit.1:
  mv t4, s11                                                            # ir inst 60 fin
  addi t1, sp, 232
  add t3, t1, t4                                                        # ir inst 61 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 62 fin
  mv t4, s11                                                            # ir inst 63 fin
  slli t2, t4, 2
  addi t1, sp, 32
  add t3, t1, t2                                                        # ir inst 64 fin
  lw t4, 0(t3)                                                          # ir inst 65 fin
  add t3, t5, t4                                                        # ir inst 66 fin
# Phi connections
  li t4, 0
  j .F.primMST._21.while.cond.2                                         # ir inst 67 fin
.F.primMST._21.while.cond.2:
  slt s10, t4, a1                                                       # ir inst 69 fin
  bnez s10, .F.primMST._22.while.body.2
  j .F.primMST._35.while.exit.2                                         # ir inst 70 fin
.F.primMST._22.while.body.2:
  mv s10, t4                                                            # ir inst 71 fin
  addi t1, sp, 232
  add s9, t1, s10                                                       # ir inst 72 fin
  lb s10, 0(s9)                                                         # ir inst 73 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 74 fin
  bnez s9, .F.primMST._23.lazy.then.1
  j .F.primMST._24.lazy.else.1                                          # ir inst 75 fin
.F.primMST._23.lazy.then.1:
  mul s10, s11, a1                                                      # ir inst 76 fin
  add s9, s10, t4                                                       # ir inst 77 fin
  mv s10, s9                                                            # ir inst 78 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 79 fin
  lw s10, 0(s9)                                                         # ir inst 80 fin
  li t2, 9999
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 81 fin
# Phi connections
  mv s10, s9
  j .F.primMST._25.lazy.exit.1                                          # ir inst 82 fin
.F.primMST._24.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.primMST._25.lazy.exit.1                                          # ir inst 83 fin
.F.primMST._25.lazy.exit.1:
  bnez s10, .F.primMST._26.lazy.then.2
  j .F.primMST._27.lazy.else.2                                          # ir inst 85 fin
.F.primMST._26.lazy.then.2:
  mul s10, s11, a1                                                      # ir inst 86 fin
  add s9, s10, t4                                                       # ir inst 87 fin
  mv s10, s9                                                            # ir inst 88 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 89 fin
  lw s10, 0(s9)                                                         # ir inst 90 fin
  li t2, 0
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 91 fin
# Phi connections
  mv s10, s9
  j .F.primMST._28.lazy.exit.2                                          # ir inst 92 fin
.F.primMST._27.lazy.else.2:
# Phi connections
  li s10, 0
  j .F.primMST._28.lazy.exit.2                                          # ir inst 93 fin
.F.primMST._28.lazy.exit.2:
  bnez s10, .F.primMST._29.lazy.then.3
  j .F.primMST._30.lazy.else.3                                          # ir inst 95 fin
.F.primMST._29.lazy.then.3:
  mul s10, s11, a1                                                      # ir inst 96 fin
  add s9, s10, t4                                                       # ir inst 97 fin
  mv s10, s9                                                            # ir inst 98 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 99 fin
  lw s10, 0(s9)                                                         # ir inst 100 fin
  mv s9, t4                                                             # ir inst 101 fin
  slli t2, s9, 2
  addi t1, sp, 32
  add s8, t1, t2                                                        # ir inst 102 fin
  lw s9, 0(s8)                                                          # ir inst 103 fin
  slt s8, s10, s9                                                       # ir inst 104 fin
# Phi connections
  mv s10, s8
  j .F.primMST._31.lazy.exit.3                                          # ir inst 105 fin
.F.primMST._30.lazy.else.3:
# Phi connections
  li s10, 0
  j .F.primMST._31.lazy.exit.3                                          # ir inst 106 fin
.F.primMST._31.lazy.exit.3:
  bnez s10, .F.primMST._32.if.then.2
  j .F.primMST._33.if.else.2                                            # ir inst 108 fin
.F.primMST._32.if.then.2:
  mv s10, t4                                                            # ir inst 109 fin
  slli t2, s10, 2
  addi t1, sp, 32
  add s9, t1, t2                                                        # ir inst 110 fin
  mul s10, s11, a1                                                      # ir inst 111 fin
  add s8, s10, t4                                                       # ir inst 112 fin
  mv s10, s8                                                            # ir inst 113 fin
  slli t2, s10, 2
  add s8, a0, t2                                                        # ir inst 114 fin
  lw s10, 0(s8)                                                         # ir inst 115 fin
  sw s10, 0(s9)                                                         # ir inst 116 fin
  j .F.primMST._34.if.exit.2                                            # ir inst 117 fin
.F.primMST._33.if.else.2:
  j .F.primMST._34.if.exit.2                                            # ir inst 118 fin
.F.primMST._34.if.exit.2:
  addi s10, t4, 1                                                       # ir inst 119 fin
# Phi connections
  mv t4, s10
  j .F.primMST._21.while.cond.2                                         # ir inst 120 fin
.F.primMST._35.while.exit.2:
  addi t4, t6, 1                                                        # ir inst 121 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.primMST._7.while.cond.0                                          # ir inst 122 fin
.F.primMST._36.while.exit.0:
  mv a0, t5
  j .F.primMST.epilogue                                                 # ir inst 123 fin
.F.primMST._37.critical_edge.0:
  j .F.primMST._36.while.exit.0                                         # ir inst 124 fin
.F.primMST.epilogue:
  ld s11, 0(sp)
  ld s9, 8(sp)
  ld s8, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 288
  ret

.globl .F.testNetworkFlowAlgorithms
.F.testNetworkFlowAlgorithms:
# spill func args num: 0,             range:     3616(sp) -     3616(sp)
# local var size: 3600,               range:       16(sp) -     3616(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3616
  add sp, sp, t0
  sd ra, 8(sp)
.F.testNetworkFlowAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1707
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testNetworkFlowAlgorithms._1.array.cond.0                        # ir inst 4 fin
.F.testNetworkFlowAlgorithms._1.array.cond.0:
  li t2, 900
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testNetworkFlowAlgorithms._2.array.body.0
  j .F.testNetworkFlowAlgorithms._3.array.exit.0                        # ir inst 7 fin
.F.testNetworkFlowAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testNetworkFlowAlgorithms._1.array.cond.0                        # ir inst 11 fin
.F.testNetworkFlowAlgorithms._3.array.exit.0:
# Start call preparation
  li a1, 30
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeFlowNetwork
# ir inst 12 fin
# Start call preparation
  li a3, 29
  li a2, 0
  li a1, 30
  addi t1, sp, 16
  mv a0, t1
  call .F.fordFulkersonMaxFlow
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 30
  addi t1, sp, 16
  mv a0, t1
  call .F.minCostMaxFlow
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a0, 1708
  call printlnInt
# ir inst 17 fin
  j .F.testNetworkFlowAlgorithms.epilogue                               # ir inst 18 fin
.F.testNetworkFlowAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 3616
  add sp, sp, t0
  ret

.globl .F.initializeFlowNetwork
.F.initializeFlowNetwork:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeFlowNetwork._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeFlowNetwork._1.while.cond.0                            # ir inst 1 fin
.F.initializeFlowNetwork._1.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.initializeFlowNetwork._2.while.body.0
  j .F.initializeFlowNetwork._3.while.exit.0                            # ir inst 5 fin
.F.initializeFlowNetwork._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.initializeFlowNetwork._1.while.cond.0                            # ir inst 10 fin
.F.initializeFlowNetwork._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.initializeFlowNetwork._4.while.cond.1                            # ir inst 11 fin
.F.initializeFlowNetwork._4.while.cond.1:
  addi t5, a1, -1                                                       # ir inst 13 fin
  slt t4, t6, t5                                                        # ir inst 14 fin
  bnez t4, .F.initializeFlowNetwork._5.while.body.1
  j .F.initializeFlowNetwork._12.while.exit.1                           # ir inst 15 fin
.F.initializeFlowNetwork._5.while.body.1:
  mul t5, t6, a1                                                        # ir inst 16 fin
  addi t4, t6, 1                                                        # ir inst 17 fin
  add t3, t5, t4                                                        # ir inst 18 fin
  mv t5, t3                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 20 fin
  li t2, 20
  rem t5, t6, t2                                                        # ir inst 21 fin
  addi t3, t5, 10                                                       # ir inst 22 fin
  sw t3, 0(t4)                                                          # ir inst 23 fin
  addi t5, t6, 5                                                        # ir inst 24 fin
  slt t4, t5, a1                                                        # ir inst 25 fin
  bnez t4, .F.initializeFlowNetwork._6.if.then.0
  j .F.initializeFlowNetwork._7.if.else.0                               # ir inst 26 fin
.F.initializeFlowNetwork._6.if.then.0:
  mul t5, t6, a1                                                        # ir inst 27 fin
  addi t4, t6, 5                                                        # ir inst 28 fin
  add t3, t5, t4                                                        # ir inst 29 fin
  mv t5, t3                                                             # ir inst 30 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 31 fin
  li t2, 10
  rem t5, t6, t2                                                        # ir inst 32 fin
  addi t3, t5, 5                                                        # ir inst 33 fin
  sw t3, 0(t4)                                                          # ir inst 34 fin
  j .F.initializeFlowNetwork._8.if.exit.0                               # ir inst 35 fin
.F.initializeFlowNetwork._7.if.else.0:
  j .F.initializeFlowNetwork._8.if.exit.0                               # ir inst 36 fin
.F.initializeFlowNetwork._8.if.exit.0:
  li t2, 5
  slt t5, t2, t6                                                        # ir inst 37 fin
  bnez t5, .F.initializeFlowNetwork._9.if.then.1
  j .F.initializeFlowNetwork._10.if.else.1                              # ir inst 38 fin
.F.initializeFlowNetwork._9.if.then.1:
  mul t5, t6, a1                                                        # ir inst 39 fin
  addi t4, t6, -3                                                       # ir inst 40 fin
  add t3, t5, t4                                                        # ir inst 41 fin
  mv t5, t3                                                             # ir inst 42 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 43 fin
  li t2, 7
  rem t5, t6, t2                                                        # ir inst 44 fin
  addi t3, t5, 3                                                        # ir inst 45 fin
  sw t3, 0(t4)                                                          # ir inst 46 fin
  j .F.initializeFlowNetwork._11.if.exit.1                              # ir inst 47 fin
.F.initializeFlowNetwork._10.if.else.1:
  j .F.initializeFlowNetwork._11.if.exit.1                              # ir inst 48 fin
.F.initializeFlowNetwork._11.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F.initializeFlowNetwork._4.while.cond.1                            # ir inst 50 fin
.F.initializeFlowNetwork._12.while.exit.1:
  j .F.initializeFlowNetwork.epilogue                                   # ir inst 51 fin
.F.initializeFlowNetwork.epilogue:
  ret

.globl .F.fordFulkersonMaxFlow
.F.fordFulkersonMaxFlow:
# spill func args num: 0,             range:     3824(sp) -     3824(sp)
# local var size: 3720,               range:       96(sp) -     3816(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 5 / 12,        range:       48(sp) -       88(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3824
  add sp, sp, t0
  sd s8, 48(sp)
  sd s7, 56(sp)
  sd s9, 64(sp)
  sd s11, 72(sp)
  sd s10, 80(sp)
  sd ra, 88(sp)
.F.fordFulkersonMaxFlow._0.entry.0:
  addi t1, sp, 96
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.fordFulkersonMaxFlow._1.array.cond.0                             # ir inst 3 fin
.F.fordFulkersonMaxFlow._1.array.cond.0:
  li t2, 900
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.fordFulkersonMaxFlow._2.array.body.0
  j .F.fordFulkersonMaxFlow._3.array.exit.0                             # ir inst 6 fin
.F.fordFulkersonMaxFlow._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.fordFulkersonMaxFlow._1.array.cond.0                             # ir inst 10 fin
.F.fordFulkersonMaxFlow._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.fordFulkersonMaxFlow._4.while.cond.0                             # ir inst 11 fin
.F.fordFulkersonMaxFlow._4.while.cond.0:
  mul t5, a1, a1                                                        # ir inst 13 fin
  slt t4, t6, t5                                                        # ir inst 14 fin
  bnez t4, .F.fordFulkersonMaxFlow._5.while.body.0
  j .F.fordFulkersonMaxFlow._6.while.exit.0                             # ir inst 15 fin
.F.fordFulkersonMaxFlow._5.while.body.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  addi t1, sp, 96
  add t4, t1, t2                                                        # ir inst 17 fin
  mv t5, t6                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 19 fin
  lw t5, 0(t3)                                                          # ir inst 20 fin
  sw t5, 0(t4)                                                          # ir inst 21 fin
  addi t5, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.fordFulkersonMaxFlow._4.while.cond.0                             # ir inst 23 fin
.F.fordFulkersonMaxFlow._6.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.fordFulkersonMaxFlow._7.while.cond.1                             # ir inst 24 fin
.F.fordFulkersonMaxFlow._7.while.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.fordFulkersonMaxFlow._8.while.body.1
  j .F.fordFulkersonMaxFlow._19.critical_edge.0                         # ir inst 28 fin
.F.fordFulkersonMaxFlow._8.while.body.1:
  li t1, 3696
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 30 fin
# Phi connections
  li t3, 0
  j .F.fordFulkersonMaxFlow._9.array.cond.1                             # ir inst 31 fin
.F.fordFulkersonMaxFlow._9.array.cond.1:
  li t2, 30
  slt s11, t3, t2                                                       # ir inst 33 fin
  bnez s11, .F.fordFulkersonMaxFlow._10.array.body.1
  j .F.fordFulkersonMaxFlow._11.array.exit.1                            # ir inst 34 fin
.F.fordFulkersonMaxFlow._10.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 35 fin
  li t1, -1
  sw t1, 0(s11)                                                         # ir inst 36 fin
  addi s11, t3, 1                                                       # ir inst 37 fin
# Phi connections
  mv t3, s11
  j .F.fordFulkersonMaxFlow._9.array.cond.1                             # ir inst 38 fin
.F.fordFulkersonMaxFlow._11.array.exit.1:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li t1, 3696
  add t1, sp, t1
  mv a4, t1
  addi t1, sp, 96
  mv a0, t1
  call .F.bfsAugmentingPath
  mv t4, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 39 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 40 fin
  bnez t3, .F.fordFulkersonMaxFlow._12.if.then.0
  j .F.fordFulkersonMaxFlow._13.if.else.0                               # ir inst 41 fin
.F.fordFulkersonMaxFlow._12.if.then.0:
  j .F.fordFulkersonMaxFlow._18.while.exit.1                            # ir inst 42 fin
.F.fordFulkersonMaxFlow._13.if.else.0:
  j .F.fordFulkersonMaxFlow._14.if.exit.0                               # ir inst 43 fin
.F.fordFulkersonMaxFlow._14.if.exit.0:
  add t3, t6, t4                                                        # ir inst 44 fin
# Phi connections
  mv s11, a3
  j .F.fordFulkersonMaxFlow._15.while.cond.2                            # ir inst 45 fin
.F.fordFulkersonMaxFlow._15.while.cond.2:
  xor t0, s11, a2
  sltu s10, zero, t0                                                    # ir inst 47 fin
  bnez s10, .F.fordFulkersonMaxFlow._16.while.body.2
  j .F.fordFulkersonMaxFlow._17.while.exit.2                            # ir inst 48 fin
.F.fordFulkersonMaxFlow._16.while.body.2:
  mv s10, s11                                                           # ir inst 49 fin
  slli t2, s10, 2
  li t1, 3696
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 50 fin
  lw s10, 0(s9)                                                         # ir inst 51 fin
  mul s9, s10, a1                                                       # ir inst 52 fin
  add s8, s9, s11                                                       # ir inst 53 fin
  mv s9, s8                                                             # ir inst 54 fin
  slli t2, s9, 2
  addi t1, sp, 96
  add s8, t1, t2                                                        # ir inst 55 fin
  mul s9, s10, a1                                                       # ir inst 56 fin
  add s7, s9, s11                                                       # ir inst 57 fin
  mv s9, s7                                                             # ir inst 58 fin
  slli t2, s9, 2
  addi t1, sp, 96
  add s7, t1, t2                                                        # ir inst 59 fin
  lw s9, 0(s7)                                                          # ir inst 60 fin
  sub s7, s9, t4                                                        # ir inst 61 fin
  sw s7, 0(s8)                                                          # ir inst 62 fin
  mul s9, s11, a1                                                       # ir inst 63 fin
  add s8, s9, s10                                                       # ir inst 64 fin
  mv s9, s8                                                             # ir inst 65 fin
  slli t2, s9, 2
  addi t1, sp, 96
  add s8, t1, t2                                                        # ir inst 66 fin
  mul s9, s11, a1                                                       # ir inst 67 fin
  add s7, s9, s10                                                       # ir inst 68 fin
  mv s10, s7                                                            # ir inst 69 fin
  slli t2, s10, 2
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 70 fin
  lw s10, 0(s9)                                                         # ir inst 71 fin
  add s9, s10, t4                                                       # ir inst 72 fin
  sw s9, 0(s8)                                                          # ir inst 73 fin
  mv s10, s11                                                           # ir inst 74 fin
  slli t2, s10, 2
  li t1, 3696
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 75 fin
  lw s10, 0(s11)                                                        # ir inst 76 fin
# Phi connections
  mv s11, s10
  j .F.fordFulkersonMaxFlow._15.while.cond.2                            # ir inst 77 fin
.F.fordFulkersonMaxFlow._17.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 78 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.fordFulkersonMaxFlow._7.while.cond.1                             # ir inst 79 fin
.F.fordFulkersonMaxFlow._18.while.exit.1:
  mv a0, t6
  j .F.fordFulkersonMaxFlow.epilogue                                    # ir inst 80 fin
.F.fordFulkersonMaxFlow._19.critical_edge.0:
  j .F.fordFulkersonMaxFlow._18.while.exit.1                            # ir inst 81 fin
.F.fordFulkersonMaxFlow.epilogue:
  ld ra, 88(sp)
  ld s8, 48(sp)
  ld s7, 56(sp)
  ld s9, 64(sp)
  ld s11, 72(sp)
  ld s10, 80(sp)
  li t0, 3824
  add sp, sp, t0
  ret

.globl .F.bfsAugmentingPath
.F.bfsAugmentingPath:
# spill func args num: 0,             range:      208(sp) -      208(sp)
# local var size: 152,                range:       48(sp) -      200(sp)
# return addr size: 0,                range:       48(sp) -       48(sp)
# callee save reg num: 6 / 12,        range:        0(sp) -       48(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -208
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s6, 16(sp)
  sd s7, 24(sp)
  sd s11, 32(sp)
  sd s10, 40(sp)
.F.bfsAugmentingPath._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.bfsAugmentingPath._1.array.cond.0                                # ir inst 3 fin
.F.bfsAugmentingPath._1.array.cond.0:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.bfsAugmentingPath._2.array.body.0
  j .F.bfsAugmentingPath._3.array.exit.0                                # ir inst 6 fin
.F.bfsAugmentingPath._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.bfsAugmentingPath._1.array.cond.0                                # ir inst 10 fin
.F.bfsAugmentingPath._3.array.exit.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.bfsAugmentingPath._4.array.cond.1                                # ir inst 13 fin
.F.bfsAugmentingPath._4.array.cond.1:
  li t2, 30
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.bfsAugmentingPath._5.array.body.1
  j .F.bfsAugmentingPath._6.array.exit.1                                # ir inst 16 fin
.F.bfsAugmentingPath._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.bfsAugmentingPath._4.array.cond.1                                # ir inst 20 fin
.F.bfsAugmentingPath._6.array.exit.1:
  li t1, 0
  mv t6, t1                                                             # ir inst 21 fin
  slli t2, t6, 2
  addi t1, sp, 80
  add t5, t1, t2                                                        # ir inst 22 fin
  sw a2, 0(t5)                                                          # ir inst 23 fin
  mv t6, a2                                                             # ir inst 24 fin
  addi t1, sp, 48
  add t5, t1, t6                                                        # ir inst 25 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 26 fin
  mv t6, a2                                                             # ir inst 27 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 28 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 29 fin
# Phi connections
  li t5, 1
  li t6, 0
  j .F.bfsAugmentingPath._7.while.cond.0                                # ir inst 30 fin
.F.bfsAugmentingPath._7.while.cond.0:
  slt t4, t6, t5                                                        # ir inst 33 fin
  bnez t4, .F.bfsAugmentingPath._8.while.body.0
  j .F.bfsAugmentingPath._27.while.exit.0                               # ir inst 34 fin
.F.bfsAugmentingPath._8.while.body.0:
  mv t4, t6                                                             # ir inst 35 fin
  slli t2, t4, 2
  addi t1, sp, 80
  add t3, t1, t2                                                        # ir inst 36 fin
  lw t4, 0(t3)                                                          # ir inst 37 fin
  addi t3, t6, 1                                                        # ir inst 38 fin
# Phi connections
  li t6, 0
  j .F.bfsAugmentingPath._9.while.cond.1                                # ir inst 39 fin
.F.bfsAugmentingPath._9.while.cond.1:
  slt s11, t6, a1                                                       # ir inst 42 fin
  bnez s11, .F.bfsAugmentingPath._10.while.body.1
  j .F.bfsAugmentingPath._26.while.exit.1                               # ir inst 43 fin
.F.bfsAugmentingPath._10.while.body.1:
  mv s11, t6                                                            # ir inst 44 fin
  addi t1, sp, 48
  add s10, t1, s11                                                      # ir inst 45 fin
  lb s11, 0(s10)                                                        # ir inst 46 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 47 fin
  bnez s10, .F.bfsAugmentingPath._11.lazy.then.0
  j .F.bfsAugmentingPath._12.lazy.else.0                                # ir inst 48 fin
.F.bfsAugmentingPath._11.lazy.then.0:
  mul s11, t4, a1                                                       # ir inst 49 fin
  add s10, s11, t6                                                      # ir inst 50 fin
  mv s11, s10                                                           # ir inst 51 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 52 fin
  lw s11, 0(s10)                                                        # ir inst 53 fin
  li t2, 0
  slt s10, t2, s11                                                      # ir inst 54 fin
# Phi connections
  mv s11, s10
  j .F.bfsAugmentingPath._13.lazy.exit.0                                # ir inst 55 fin
.F.bfsAugmentingPath._12.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.bfsAugmentingPath._13.lazy.exit.0                                # ir inst 56 fin
.F.bfsAugmentingPath._13.lazy.exit.0:
  bnez s11, .F.bfsAugmentingPath._14.if.then.0
  j .F.bfsAugmentingPath._24.if.else.0                                  # ir inst 58 fin
.F.bfsAugmentingPath._14.if.then.0:
  mv s11, t5                                                            # ir inst 59 fin
  slli t2, s11, 2
  addi t1, sp, 80
  add s10, t1, t2                                                       # ir inst 60 fin
  sw t6, 0(s10)                                                         # ir inst 61 fin
  addi s11, t5, 1                                                       # ir inst 62 fin
  mv s10, t6                                                            # ir inst 63 fin
  addi t1, sp, 48
  add s9, t1, s10                                                       # ir inst 64 fin
  li t1, 1
  sb t1, 0(s9)                                                          # ir inst 65 fin
  mv s10, t6                                                            # ir inst 66 fin
  slli t2, s10, 2
  add s9, a4, t2                                                        # ir inst 67 fin
  sw t4, 0(s9)                                                          # ir inst 68 fin
  xor t0, t6, a3
  sltiu s10, t0, 1                                                      # ir inst 69 fin
  bnez s10, .F.bfsAugmentingPath._15.if.then.1
  j .F.bfsAugmentingPath._22.if.else.1                                  # ir inst 70 fin
.F.bfsAugmentingPath._15.if.then.1:
# Phi connections
  li s9, 9999
  mv s10, a3
  j .F.bfsAugmentingPath._16.while.cond.2                               # ir inst 71 fin
.F.bfsAugmentingPath._16.while.cond.2:
  xor t0, s10, a2
  sltu s8, zero, t0                                                     # ir inst 74 fin
  bnez s8, .F.bfsAugmentingPath._17.while.body.2
  j .F.bfsAugmentingPath._21.while.exit.2                               # ir inst 75 fin
.F.bfsAugmentingPath._17.while.body.2:
  mv s8, s10                                                            # ir inst 76 fin
  slli t2, s8, 2
  add s7, a4, t2                                                        # ir inst 77 fin
  lw s8, 0(s7)                                                          # ir inst 78 fin
  mul s7, s8, a1                                                        # ir inst 79 fin
  add s6, s7, s10                                                       # ir inst 80 fin
  mv s7, s6                                                             # ir inst 81 fin
  slli t2, s7, 2
  add s6, a0, t2                                                        # ir inst 82 fin
  lw s7, 0(s6)                                                          # ir inst 83 fin
  slt s6, s7, s9                                                        # ir inst 84 fin
  bnez s6, .F.bfsAugmentingPath._18.if.then.2
  j .F.bfsAugmentingPath._19.if.else.2                                  # ir inst 85 fin
.F.bfsAugmentingPath._18.if.then.2:
  mul s7, s8, a1                                                        # ir inst 86 fin
  add s6, s7, s10                                                       # ir inst 87 fin
  mv s10, s6                                                            # ir inst 88 fin
  slli t2, s10, 2
  add s7, a0, t2                                                        # ir inst 89 fin
  lw s10, 0(s7)                                                         # ir inst 90 fin
# Phi connections
  j .F.bfsAugmentingPath._20.if.exit.2                                  # ir inst 91 fin
.F.bfsAugmentingPath._19.if.else.2:
# Phi connections
  mv s10, s9
  j .F.bfsAugmentingPath._20.if.exit.2                                  # ir inst 92 fin
.F.bfsAugmentingPath._20.if.exit.2:
# Phi connections
  mv s9, s10
  mv s10, s8
  j .F.bfsAugmentingPath._16.while.cond.2                               # ir inst 94 fin
.F.bfsAugmentingPath._21.while.exit.2:
  mv a0, s9
  j .F.bfsAugmentingPath.epilogue                                       # ir inst 95 fin
.F.bfsAugmentingPath._22.if.else.1:
  j .F.bfsAugmentingPath._23.if.exit.1                                  # ir inst 96 fin
.F.bfsAugmentingPath._23.if.exit.1:
# Phi connections
  j .F.bfsAugmentingPath._25.if.exit.0                                  # ir inst 97 fin
.F.bfsAugmentingPath._24.if.else.0:
# Phi connections
  mv s11, t5
  j .F.bfsAugmentingPath._25.if.exit.0                                  # ir inst 98 fin
.F.bfsAugmentingPath._25.if.exit.0:
  addi s10, t6, 1                                                       # ir inst 100 fin
# Phi connections
  mv t5, s11
  mv t6, s10
  j .F.bfsAugmentingPath._9.while.cond.1                                # ir inst 101 fin
.F.bfsAugmentingPath._26.while.exit.1:
# Phi connections
  mv t6, t3
  j .F.bfsAugmentingPath._7.while.cond.0                                # ir inst 102 fin
.F.bfsAugmentingPath._27.while.exit.0:
  li a0, 0
  j .F.bfsAugmentingPath.epilogue                                       # ir inst 103 fin
.F.bfsAugmentingPath.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s6, 16(sp)
  ld s7, 24(sp)
  ld s11, 32(sp)
  ld s10, 40(sp)
  addi sp, sp, 208
  ret

.globl .F.minCostMaxFlow
.F.minCostMaxFlow:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s7, 32(sp)
.F.minCostMaxFlow._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.minCostMaxFlow._1.while.cond.0                                   # ir inst 1 fin
.F.minCostMaxFlow._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.minCostMaxFlow._2.while.body.0
  j .F.minCostMaxFlow._12.while.exit.0                                  # ir inst 6 fin
.F.minCostMaxFlow._2.while.body.0:
# Phi connections
  mv s10, t4
  mv s11, t5
  li t3, 0
  j .F.minCostMaxFlow._3.while.cond.1                                   # ir inst 7 fin
.F.minCostMaxFlow._3.while.cond.1:
  slt s9, t3, a1                                                        # ir inst 11 fin
  bnez s9, .F.minCostMaxFlow._4.while.body.1
  j .F.minCostMaxFlow._11.while.exit.1                                  # ir inst 12 fin
.F.minCostMaxFlow._4.while.body.1:
  mul s9, t6, a1                                                        # ir inst 13 fin
  add s8, s9, t3                                                        # ir inst 14 fin
  mv s9, s8                                                             # ir inst 15 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 16 fin
  lw s9, 0(s8)                                                          # ir inst 17 fin
  li t2, 0
  slt s8, t2, s9                                                        # ir inst 18 fin
  bnez s8, .F.minCostMaxFlow._5.if.then.0
  j .F.minCostMaxFlow._9.if.else.0                                      # ir inst 19 fin
.F.minCostMaxFlow._5.if.then.0:
  slt s9, t3, t6                                                        # ir inst 20 fin
  bnez s9, .F.minCostMaxFlow._6.if.then.1
  j .F.minCostMaxFlow._7.if.else.1                                      # ir inst 21 fin
.F.minCostMaxFlow._6.if.then.1:
  sub s9, t6, t3                                                        # ir inst 22 fin
# Phi connections
  j .F.minCostMaxFlow._8.if.exit.1                                      # ir inst 23 fin
.F.minCostMaxFlow._7.if.else.1:
  sub s9, t3, t6                                                        # ir inst 24 fin
# Phi connections
  j .F.minCostMaxFlow._8.if.exit.1                                      # ir inst 25 fin
.F.minCostMaxFlow._8.if.exit.1:
  mul s8, t6, a1                                                        # ir inst 27 fin
  add s7, s8, t3                                                        # ir inst 28 fin
  mv s8, s7                                                             # ir inst 29 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 30 fin
  lw s8, 0(s7)                                                          # ir inst 31 fin
  mul s7, s8, s9                                                        # ir inst 32 fin
  add s9, s10, s7                                                       # ir inst 33 fin
  mul s8, t6, a1                                                        # ir inst 34 fin
  add s7, s8, t3                                                        # ir inst 35 fin
  mv s8, s7                                                             # ir inst 36 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 37 fin
  lw s8, 0(s7)                                                          # ir inst 38 fin
  add s7, s11, s8                                                       # ir inst 39 fin
# Phi connections
  mv s8, s9
  mv s9, s7
  j .F.minCostMaxFlow._10.if.exit.0                                     # ir inst 40 fin
.F.minCostMaxFlow._9.if.else.0:
# Phi connections
  mv s8, s10
  mv s9, s11
  j .F.minCostMaxFlow._10.if.exit.0                                     # ir inst 41 fin
.F.minCostMaxFlow._10.if.exit.0:
  addi s7, t3, 1                                                        # ir inst 44 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  mv t3, s7
  j .F.minCostMaxFlow._3.while.cond.1                                   # ir inst 45 fin
.F.minCostMaxFlow._11.while.exit.1:
  addi t3, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F.minCostMaxFlow._1.while.cond.0                                   # ir inst 47 fin
.F.minCostMaxFlow._12.while.exit.0:
  addi t6, t5, 1                                                        # ir inst 48 fin
  div t5, t4, t6                                                        # ir inst 49 fin
  mv a0, t5
  j .F.minCostMaxFlow.epilogue                                          # ir inst 50 fin
.F.minCostMaxFlow.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s7, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.testGraphConnectivityAlgorithms
.F.testGraphConnectivityAlgorithms:
# spill func args num: 0,             range:    10016(sp) -    10016(sp)
# local var size: 10000,              range:       16(sp) -    10016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testGraphConnectivityAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1709
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testGraphConnectivityAlgorithms._1.array.cond.0                  # ir inst 4 fin
.F.testGraphConnectivityAlgorithms._1.array.cond.0:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testGraphConnectivityAlgorithms._2.array.body.0
  j .F.testGraphConnectivityAlgorithms._3.array.exit.0                  # ir inst 7 fin
.F.testGraphConnectivityAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testGraphConnectivityAlgorithms._1.array.cond.0                  # ir inst 11 fin
.F.testGraphConnectivityAlgorithms._3.array.exit.0:
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeGraph
# ir inst 12 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.findConnectedComponents
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.findStronglyConnectedComponents
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.findArticulationPoints
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 50
  addi t1, sp, 16
  mv a0, t1
  call .F.findBridges
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1710
  call printlnInt
# ir inst 21 fin
  j .F.testGraphConnectivityAlgorithms.epilogue                         # ir inst 22 fin
.F.testGraphConnectivityAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 10016
  add sp, sp, t0
  ret

.globl .F.findConnectedComponents
.F.findConnectedComponents:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 50,                 range:       40(sp) -       90(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 32(sp)
.F.findConnectedComponents._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.findConnectedComponents._1.array.cond.0                          # ir inst 3 fin
.F.findConnectedComponents._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.findConnectedComponents._2.array.body.0
  j .F.findConnectedComponents._3.array.exit.0                          # ir inst 6 fin
.F.findConnectedComponents._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.findConnectedComponents._1.array.cond.0                          # ir inst 10 fin
.F.findConnectedComponents._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.findConnectedComponents._4.while.cond.0                          # ir inst 11 fin
.F.findConnectedComponents._4.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 14 fin
  bnez t4, .F.findConnectedComponents._5.while.body.0
  j .F.findConnectedComponents._9.while.exit.0                          # ir inst 15 fin
.F.findConnectedComponents._5.while.body.0:
  mv t4, t5                                                             # ir inst 16 fin
  addi t1, sp, 40
  add t3, t1, t4                                                        # ir inst 17 fin
  lb t4, 0(t3)                                                          # ir inst 18 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 19 fin
  bnez t3, .F.findConnectedComponents._6.if.then.0
  j .F.findConnectedComponents._7.if.else.0                             # ir inst 20 fin
.F.findConnectedComponents._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 40
  mv a3, t1
  mv a2, t5
  call .F.dfsComponentTraversal
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 21 fin
  addi t4, t6, 1                                                        # ir inst 22 fin
# Phi connections
  j .F.findConnectedComponents._8.if.exit.0                             # ir inst 23 fin
.F.findConnectedComponents._7.if.else.0:
# Phi connections
  mv t4, t6
  j .F.findConnectedComponents._8.if.exit.0                             # ir inst 24 fin
.F.findConnectedComponents._8.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.findConnectedComponents._4.while.cond.0                          # ir inst 27 fin
.F.findConnectedComponents._9.while.exit.0:
  mv a0, t6
  j .F.findConnectedComponents.epilogue                                 # ir inst 28 fin
.F.findConnectedComponents.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 96
  ret

.globl .F.dfsComponentTraversal
.F.dfsComponentTraversal:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.dfsComponentTraversal._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  add t5, a3, t6                                                        # ir inst 2 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.dfsComponentTraversal._1.while.cond.0                            # ir inst 4 fin
.F.dfsComponentTraversal._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 6 fin
  bnez t5, .F.dfsComponentTraversal._2.while.body.0
  j .F.dfsComponentTraversal._9.while.exit.0                            # ir inst 7 fin
.F.dfsComponentTraversal._2.while.body.0:
  mul t5, a2, a1                                                        # ir inst 8 fin
  add t4, t5, t6                                                        # ir inst 9 fin
  mv t5, t4                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  lw t5, 0(t4)                                                          # ir inst 12 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 13 fin
  bnez t4, .F.dfsComponentTraversal._3.lazy.then.0
  j .F.dfsComponentTraversal._4.lazy.else.0                             # ir inst 14 fin
.F.dfsComponentTraversal._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 15 fin
  add t4, a3, t5                                                        # ir inst 16 fin
  lb t5, 0(t4)                                                          # ir inst 17 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.dfsComponentTraversal._5.lazy.exit.0                             # ir inst 19 fin
.F.dfsComponentTraversal._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.dfsComponentTraversal._5.lazy.exit.0                             # ir inst 20 fin
.F.dfsComponentTraversal._5.lazy.exit.0:
  bnez t5, .F.dfsComponentTraversal._6.if.then.0
  j .F.dfsComponentTraversal._7.if.else.0                               # ir inst 22 fin
.F.dfsComponentTraversal._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a2, t6
  call .F.dfsComponentTraversal
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 23 fin
  j .F.dfsComponentTraversal._8.if.exit.0                               # ir inst 24 fin
.F.dfsComponentTraversal._7.if.else.0:
  j .F.dfsComponentTraversal._8.if.exit.0                               # ir inst 25 fin
.F.dfsComponentTraversal._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t5
  j .F.dfsComponentTraversal._1.while.cond.0                            # ir inst 27 fin
.F.dfsComponentTraversal._9.while.exit.0:
  j .F.dfsComponentTraversal.epilogue                                   # ir inst 28 fin
.F.dfsComponentTraversal.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.findStronglyConnectedComponents
.F.findStronglyConnectedComponents:
# spill func args num: 0,             range:    10304(sp) -    10304(sp)
# local var size: 10256,              range:       48(sp) -    10304(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10304
  add sp, sp, t0
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.findStronglyConnectedComponents._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.findStronglyConnectedComponents._1.array.cond.0                  # ir inst 3 fin
.F.findStronglyConnectedComponents._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.findStronglyConnectedComponents._2.array.body.0
  j .F.findStronglyConnectedComponents._3.array.exit.0                  # ir inst 6 fin
.F.findStronglyConnectedComponents._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.findStronglyConnectedComponents._1.array.cond.0                  # ir inst 10 fin
.F.findStronglyConnectedComponents._3.array.exit.0:
  addi t1, sp, 100
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.findStronglyConnectedComponents._4.array.cond.1                  # ir inst 13 fin
.F.findStronglyConnectedComponents._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.findStronglyConnectedComponents._5.array.body.1
  j .F.findStronglyConnectedComponents._6.array.exit.1                  # ir inst 16 fin
.F.findStronglyConnectedComponents._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.findStronglyConnectedComponents._4.array.cond.1                  # ir inst 20 fin
.F.findStronglyConnectedComponents._6.array.exit.1:
# alloca %14
  addi t2, sp, 300
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 22 fin
# Phi connections
  li t6, 0
  j .F.findStronglyConnectedComponents._7.while.cond.0                  # ir inst 23 fin
.F.findStronglyConnectedComponents._7.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 25 fin
  bnez t5, .F.findStronglyConnectedComponents._8.while.body.0
  j .F.findStronglyConnectedComponents._12.while.exit.0                 # ir inst 26 fin
.F.findStronglyConnectedComponents._8.while.body.0:
  mv t5, t6                                                             # ir inst 27 fin
  addi t1, sp, 48
  add t4, t1, t5                                                        # ir inst 28 fin
  lb t5, 0(t4)                                                          # ir inst 29 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 30 fin
  bnez t4, .F.findStronglyConnectedComponents._9.if.then.0
  j .F.findStronglyConnectedComponents._10.if.else.0                    # ir inst 31 fin
.F.findStronglyConnectedComponents._9.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 300
  mv a5, t1
  addi t1, sp, 100
  mv a4, t1
  addi t1, sp, 48
  mv a3, t1
  mv a2, t6
  call .F.dfsFinishTime
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 32 fin
  j .F.findStronglyConnectedComponents._11.if.exit.0                    # ir inst 33 fin
.F.findStronglyConnectedComponents._10.if.else.0:
  j .F.findStronglyConnectedComponents._11.if.exit.0                    # ir inst 34 fin
.F.findStronglyConnectedComponents._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 35 fin
# Phi connections
  mv t6, t5
  j .F.findStronglyConnectedComponents._7.while.cond.0                  # ir inst 36 fin
.F.findStronglyConnectedComponents._12.while.exit.0:
  addi t1, sp, 304
  addi t6, t1, 0                                                        # ir inst 38 fin
# Phi connections
  li t5, 0
  j .F.findStronglyConnectedComponents._13.array.cond.2                 # ir inst 39 fin
.F.findStronglyConnectedComponents._13.array.cond.2:
  li t2, 2500
  slt t4, t5, t2                                                        # ir inst 41 fin
  bnez t4, .F.findStronglyConnectedComponents._14.array.body.2
  j .F.findStronglyConnectedComponents._15.array.exit.2                 # ir inst 42 fin
.F.findStronglyConnectedComponents._14.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 43 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 44 fin
  addi t4, t5, 1                                                        # ir inst 45 fin
# Phi connections
  mv t5, t4
  j .F.findStronglyConnectedComponents._13.array.cond.2                 # ir inst 46 fin
.F.findStronglyConnectedComponents._15.array.exit.2:
# Phi connections
  li t6, 0
  j .F.findStronglyConnectedComponents._16.while.cond.1                 # ir inst 47 fin
.F.findStronglyConnectedComponents._16.while.cond.1:
  slt t5, t6, a1                                                        # ir inst 49 fin
  bnez t5, .F.findStronglyConnectedComponents._17.while.body.1
  j .F.findStronglyConnectedComponents._21.while.exit.1                 # ir inst 50 fin
.F.findStronglyConnectedComponents._17.while.body.1:
# Phi connections
  li t5, 0
  j .F.findStronglyConnectedComponents._18.while.cond.2                 # ir inst 51 fin
.F.findStronglyConnectedComponents._18.while.cond.2:
  slt t4, t5, a1                                                        # ir inst 53 fin
  bnez t4, .F.findStronglyConnectedComponents._19.while.body.2
  j .F.findStronglyConnectedComponents._20.while.exit.2                 # ir inst 54 fin
.F.findStronglyConnectedComponents._19.while.body.2:
  mul t4, t5, a1                                                        # ir inst 55 fin
  add t3, t4, t6                                                        # ir inst 56 fin
  mv t4, t3                                                             # ir inst 57 fin
  slli t2, t4, 2
  addi t1, sp, 304
  add t3, t1, t2                                                        # ir inst 58 fin
  mul t4, t6, a1                                                        # ir inst 59 fin
  add s11, t4, t5                                                       # ir inst 60 fin
  mv t4, s11                                                            # ir inst 61 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 62 fin
  lw t4, 0(s11)                                                         # ir inst 63 fin
  sw t4, 0(t3)                                                          # ir inst 64 fin
  addi t4, t5, 1                                                        # ir inst 65 fin
# Phi connections
  mv t5, t4
  j .F.findStronglyConnectedComponents._18.while.cond.2                 # ir inst 66 fin
.F.findStronglyConnectedComponents._20.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 67 fin
# Phi connections
  mv t6, t5
  j .F.findStronglyConnectedComponents._16.while.cond.1                 # ir inst 68 fin
.F.findStronglyConnectedComponents._21.while.exit.1:
# Phi connections
  li t6, 0
  j .F.findStronglyConnectedComponents._22.while.cond.3                 # ir inst 69 fin
.F.findStronglyConnectedComponents._22.while.cond.3:
  slt t5, t6, a1                                                        # ir inst 71 fin
  bnez t5, .F.findStronglyConnectedComponents._23.while.body.3
  j .F.findStronglyConnectedComponents._24.while.exit.3                 # ir inst 72 fin
.F.findStronglyConnectedComponents._23.while.body.3:
  mv t5, t6                                                             # ir inst 73 fin
  addi t1, sp, 48
  add t4, t1, t5                                                        # ir inst 74 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 75 fin
  addi t5, t6, 1                                                        # ir inst 76 fin
# Phi connections
  mv t6, t5
  j .F.findStronglyConnectedComponents._22.while.cond.3                 # ir inst 77 fin
.F.findStronglyConnectedComponents._24.while.exit.3:
  addi t1, sp, 300
  lw t6, 0(t1)                                                          # ir inst 78 fin
  addi t5, t6, -1                                                       # ir inst 79 fin
# Phi connections
  li t6, 0
  j .F.findStronglyConnectedComponents._25.while.cond.4                 # ir inst 80 fin
.F.findStronglyConnectedComponents._25.while.cond.4:
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 83 fin
  bnez t4, .F.findStronglyConnectedComponents._26.while.body.4
  j .F.findStronglyConnectedComponents._30.while.exit.4                 # ir inst 84 fin
.F.findStronglyConnectedComponents._26.while.body.4:
  mv t4, t5                                                             # ir inst 85 fin
  slli t2, t4, 2
  addi t1, sp, 100
  add t3, t1, t2                                                        # ir inst 86 fin
  lw t4, 0(t3)                                                          # ir inst 87 fin
  mv t3, t4                                                             # ir inst 88 fin
  addi t1, sp, 48
  add s11, t1, t3                                                       # ir inst 89 fin
  lb t3, 0(s11)                                                         # ir inst 90 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 91 fin
  bnez s11, .F.findStronglyConnectedComponents._27.if.then.1
  j .F.findStronglyConnectedComponents._28.if.else.1                    # ir inst 92 fin
.F.findStronglyConnectedComponents._27.if.then.1:
# Start call preparation
  sd a1, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 48
  mv a3, t1
  mv a2, t4
  addi t1, sp, 304
  mv a0, t1
  call .F.dfsComponentTraversal
  ld a1, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 93 fin
  addi t4, t6, 1                                                        # ir inst 94 fin
# Phi connections
  j .F.findStronglyConnectedComponents._29.if.exit.1                    # ir inst 95 fin
.F.findStronglyConnectedComponents._28.if.else.1:
# Phi connections
  mv t4, t6
  j .F.findStronglyConnectedComponents._29.if.exit.1                    # ir inst 96 fin
.F.findStronglyConnectedComponents._29.if.exit.1:
  addi t3, t5, -1                                                       # ir inst 98 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.findStronglyConnectedComponents._25.while.cond.4                 # ir inst 99 fin
.F.findStronglyConnectedComponents._30.while.exit.4:
  mv a0, t6
  j .F.findStronglyConnectedComponents.epilogue                         # ir inst 100 fin
.F.findStronglyConnectedComponents.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  li t0, 10304
  add sp, sp, t0
  ret

.globl .F.dfsFinishTime
.F.dfsFinishTime:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.dfsFinishTime._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  add t5, a3, t6                                                        # ir inst 2 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.dfsFinishTime._1.while.cond.0                                    # ir inst 4 fin
.F.dfsFinishTime._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 6 fin
  bnez t5, .F.dfsFinishTime._2.while.body.0
  j .F.dfsFinishTime._9.while.exit.0                                    # ir inst 7 fin
.F.dfsFinishTime._2.while.body.0:
  mul t5, a2, a1                                                        # ir inst 8 fin
  add t4, t5, t6                                                        # ir inst 9 fin
  mv t5, t4                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  lw t5, 0(t4)                                                          # ir inst 12 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 13 fin
  bnez t4, .F.dfsFinishTime._3.lazy.then.0
  j .F.dfsFinishTime._4.lazy.else.0                                     # ir inst 14 fin
.F.dfsFinishTime._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 15 fin
  add t4, a3, t5                                                        # ir inst 16 fin
  lb t5, 0(t4)                                                          # ir inst 17 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.dfsFinishTime._5.lazy.exit.0                                     # ir inst 19 fin
.F.dfsFinishTime._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.dfsFinishTime._5.lazy.exit.0                                     # ir inst 20 fin
.F.dfsFinishTime._5.lazy.exit.0:
  bnez t5, .F.dfsFinishTime._6.if.then.0
  j .F.dfsFinishTime._7.if.else.0                                       # ir inst 22 fin
.F.dfsFinishTime._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t6, 48(sp)
  mv a2, t6
  call .F.dfsFinishTime
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t6, 48(sp)
# ir inst 23 fin
  j .F.dfsFinishTime._8.if.exit.0                                       # ir inst 24 fin
.F.dfsFinishTime._7.if.else.0:
  j .F.dfsFinishTime._8.if.exit.0                                       # ir inst 25 fin
.F.dfsFinishTime._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t5
  j .F.dfsFinishTime._1.while.cond.0                                    # ir inst 27 fin
.F.dfsFinishTime._9.while.exit.0:
  lw t6, 0(a5)                                                          # ir inst 28 fin
  mv t5, t6                                                             # ir inst 29 fin
  slli t2, t5, 2
  add t6, a4, t2                                                        # ir inst 30 fin
  sw a2, 0(t6)                                                          # ir inst 31 fin
  lw t6, 0(a5)                                                          # ir inst 32 fin
  addi t5, t6, 1                                                        # ir inst 33 fin
  sw t5, 0(a5)                                                          # ir inst 34 fin
  j .F.dfsFinishTime.epilogue                                           # ir inst 35 fin
.F.dfsFinishTime.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.findArticulationPoints
.F.findArticulationPoints:
# spill func args num: 0,             range:      288(sp) -      288(sp)
# local var size: 200,                range:       88(sp) -      288(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 4 / 12,        range:       48(sp) -       80(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -288
  sd s9, 48(sp)
  sd s8, 56(sp)
  sd s10, 64(sp)
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.findArticulationPoints._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.findArticulationPoints._1.while.cond.0                           # ir inst 1 fin
.F.findArticulationPoints._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.findArticulationPoints._2.while.body.0
  j .F.findArticulationPoints._15.while.exit.0                          # ir inst 5 fin
.F.findArticulationPoints._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.findConnectedComponents
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 6 fin
  addi t1, sp, 88
  addi t3, t1, 0                                                        # ir inst 8 fin
# Phi connections
  li s11, 0
  j .F.findArticulationPoints._3.array.cond.0                           # ir inst 9 fin
.F.findArticulationPoints._3.array.cond.0:
  li t2, 50
  slt s10, s11, t2                                                      # ir inst 11 fin
  bnez s10, .F.findArticulationPoints._4.array.body.0
  j .F.findArticulationPoints._5.array.exit.0                           # ir inst 12 fin
.F.findArticulationPoints._4.array.body.0:
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 13 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 14 fin
  addi s10, s11, 1                                                      # ir inst 15 fin
# Phi connections
  mv s11, s10
  j .F.findArticulationPoints._3.array.cond.0                           # ir inst 16 fin
.F.findArticulationPoints._5.array.exit.0:
# Phi connections
  li t3, 0
  j .F.findArticulationPoints._6.while.cond.1                           # ir inst 17 fin
.F.findArticulationPoints._6.while.cond.1:
  slt s11, t3, a1                                                       # ir inst 19 fin
  bnez s11, .F.findArticulationPoints._7.while.body.1
  j .F.findArticulationPoints._8.while.exit.1                           # ir inst 20 fin
.F.findArticulationPoints._7.while.body.1:
  mv s11, t3                                                            # ir inst 21 fin
  slli t2, s11, 2
  addi t1, sp, 88
  add s10, t1, t2                                                       # ir inst 22 fin
  mul s11, t6, a1                                                       # ir inst 23 fin
  add s9, s11, t3                                                       # ir inst 24 fin
  mv s11, s9                                                            # ir inst 25 fin
  slli t2, s11, 2
  add s9, a0, t2                                                        # ir inst 26 fin
  lw s11, 0(s9)                                                         # ir inst 27 fin
  sw s11, 0(s10)                                                        # ir inst 28 fin
  mul s11, t6, a1                                                       # ir inst 29 fin
  add s10, s11, t3                                                      # ir inst 30 fin
  mv s11, s10                                                           # ir inst 31 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 32 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 33 fin
  mul s11, t3, a1                                                       # ir inst 34 fin
  add s10, s11, t6                                                      # ir inst 35 fin
  mv s11, s10                                                           # ir inst 36 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 37 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 38 fin
  addi s11, t3, 1                                                       # ir inst 39 fin
# Phi connections
  mv t3, s11
  j .F.findArticulationPoints._6.while.cond.1                           # ir inst 40 fin
.F.findArticulationPoints._8.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F.findConnectedComponents
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 41 fin
# Phi connections
  li s11, 0
  j .F.findArticulationPoints._9.while.cond.2                           # ir inst 42 fin
.F.findArticulationPoints._9.while.cond.2:
  slt s10, s11, a1                                                      # ir inst 44 fin
  bnez s10, .F.findArticulationPoints._10.while.body.2
  j .F.findArticulationPoints._11.while.exit.2                          # ir inst 45 fin
.F.findArticulationPoints._10.while.body.2:
  mul s10, t6, a1                                                       # ir inst 46 fin
  add s9, s10, s11                                                      # ir inst 47 fin
  mv s10, s9                                                            # ir inst 48 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 49 fin
  mv s10, s11                                                           # ir inst 50 fin
  slli t2, s10, 2
  addi t1, sp, 88
  add s8, t1, t2                                                        # ir inst 51 fin
  lw s10, 0(s8)                                                         # ir inst 52 fin
  sw s10, 0(s9)                                                         # ir inst 53 fin
  mul s10, s11, a1                                                      # ir inst 54 fin
  add s9, s10, t6                                                       # ir inst 55 fin
  mv s10, s9                                                            # ir inst 56 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 57 fin
  mv s10, s11                                                           # ir inst 58 fin
  slli t2, s10, 2
  addi t1, sp, 88
  add s8, t1, t2                                                        # ir inst 59 fin
  lw s10, 0(s8)                                                         # ir inst 60 fin
  sw s10, 0(s9)                                                         # ir inst 61 fin
  addi s10, s11, 1                                                      # ir inst 62 fin
# Phi connections
  mv s11, s10
  j .F.findArticulationPoints._9.while.cond.2                           # ir inst 63 fin
.F.findArticulationPoints._11.while.exit.2:
  slt s11, t4, t3                                                       # ir inst 64 fin
  bnez s11, .F.findArticulationPoints._12.if.then.0
  j .F.findArticulationPoints._13.if.else.0                             # ir inst 65 fin
.F.findArticulationPoints._12.if.then.0:
  addi t4, t5, 1                                                        # ir inst 66 fin
# Phi connections
  j .F.findArticulationPoints._14.if.exit.0                             # ir inst 67 fin
.F.findArticulationPoints._13.if.else.0:
# Phi connections
  mv t4, t5
  j .F.findArticulationPoints._14.if.exit.0                             # ir inst 68 fin
.F.findArticulationPoints._14.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 70 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.findArticulationPoints._1.while.cond.0                           # ir inst 71 fin
.F.findArticulationPoints._15.while.exit.0:
  mv a0, t5
  j .F.findArticulationPoints.epilogue                                  # ir inst 72 fin
.F.findArticulationPoints.epilogue:
  ld ra, 80(sp)
  ld s9, 48(sp)
  ld s8, 56(sp)
  ld s10, 64(sp)
  ld s11, 72(sp)
  addi sp, sp, 288
  ret

.globl .F.findBridges
.F.findBridges:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 5 / 12,        range:       48(sp) -       88(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s9, 48(sp)
  sd s8, 56(sp)
  sd s7, 64(sp)
  sd s11, 72(sp)
  sd s10, 80(sp)
  sd ra, 88(sp)
.F.findBridges._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.findBridges._1.while.cond.0                                      # ir inst 1 fin
.F.findBridges._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.findBridges._2.while.body.0
  j .F.findBridges._12.while.exit.0                                     # ir inst 5 fin
.F.findBridges._2.while.body.0:
  addi t4, t6, 1                                                        # ir inst 6 fin
# Phi connections
  mv t3, t5
  j .F.findBridges._3.while.cond.1                                      # ir inst 7 fin
.F.findBridges._3.while.cond.1:
  slt s11, t4, a1                                                       # ir inst 10 fin
  bnez s11, .F.findBridges._4.while.body.1
  j .F.findBridges._11.while.exit.1                                     # ir inst 11 fin
.F.findBridges._4.while.body.1:
  mul s11, t6, a1                                                       # ir inst 12 fin
  add s10, s11, t4                                                      # ir inst 13 fin
  mv s11, s10                                                           # ir inst 14 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 15 fin
  lw s11, 0(s10)                                                        # ir inst 16 fin
  li t2, 0
  slt s10, t2, s11                                                      # ir inst 17 fin
  bnez s10, .F.findBridges._5.if.then.0
  j .F.findBridges._9.if.else.0                                         # ir inst 18 fin
.F.findBridges._5.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  call .F.findConnectedComponents
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 19 fin
  mul s10, t6, a1                                                       # ir inst 20 fin
  add s9, s10, t4                                                       # ir inst 21 fin
  mv s10, s9                                                            # ir inst 22 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 23 fin
  lw s10, 0(s9)                                                         # ir inst 24 fin
  mul s9, t6, a1                                                        # ir inst 25 fin
  add s8, s9, t4                                                        # ir inst 26 fin
  mv s9, s8                                                             # ir inst 27 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(s8)                                                          # ir inst 29 fin
  mul s9, t4, a1                                                        # ir inst 30 fin
  add s8, s9, t6                                                        # ir inst 31 fin
  mv s9, s8                                                             # ir inst 32 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 33 fin
  li t1, 0
  sw t1, 0(s8)                                                          # ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  call .F.findConnectedComponents
  mv s9, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 35 fin
  mul s8, t6, a1                                                        # ir inst 36 fin
  add s7, s8, t4                                                        # ir inst 37 fin
  mv s8, s7                                                             # ir inst 38 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 39 fin
  sw s10, 0(s7)                                                         # ir inst 40 fin
  mul s8, t4, a1                                                        # ir inst 41 fin
  add s7, s8, t6                                                        # ir inst 42 fin
  mv s8, s7                                                             # ir inst 43 fin
  slli t2, s8, 2
  add s7, a0, t2                                                        # ir inst 44 fin
  sw s10, 0(s7)                                                         # ir inst 45 fin
  slt s10, s11, s9                                                      # ir inst 46 fin
  bnez s10, .F.findBridges._6.if.then.1
  j .F.findBridges._7.if.else.1                                         # ir inst 47 fin
.F.findBridges._6.if.then.1:
  addi s11, t3, 1                                                       # ir inst 48 fin
# Phi connections
  j .F.findBridges._8.if.exit.1                                         # ir inst 49 fin
.F.findBridges._7.if.else.1:
# Phi connections
  mv s11, t3
  j .F.findBridges._8.if.exit.1                                         # ir inst 50 fin
.F.findBridges._8.if.exit.1:
# Phi connections
  j .F.findBridges._10.if.exit.0                                        # ir inst 52 fin
.F.findBridges._9.if.else.0:
# Phi connections
  mv s11, t3
  j .F.findBridges._10.if.exit.0                                        # ir inst 53 fin
.F.findBridges._10.if.exit.0:
  addi s10, t4, 1                                                       # ir inst 55 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.findBridges._3.while.cond.1                                      # ir inst 56 fin
.F.findBridges._11.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 57 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.findBridges._1.while.cond.0                                      # ir inst 58 fin
.F.findBridges._12.while.exit.0:
  mv a0, t5
  j .F.findBridges.epilogue                                             # ir inst 59 fin
.F.findBridges.epilogue:
  ld ra, 88(sp)
  ld s9, 48(sp)
  ld s8, 56(sp)
  ld s7, 64(sp)
  ld s11, 72(sp)
  ld s10, 80(sp)
  addi sp, sp, 96
  ret
