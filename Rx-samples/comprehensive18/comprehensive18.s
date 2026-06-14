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
  call .F.performMemoryPoolOperations
# ir inst 2 fin
# Start call preparation
  call .F.performBuddyAllocationTest
# ir inst 3 fin
# Start call preparation
  call .F.performGarbageCollectionTest
# ir inst 4 fin
# Start call preparation
  call .F.performFragmentationTest
# ir inst 5 fin
# Start call preparation
  call .F.testMemoryEdgeCases
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

.globl .F.performMemoryPoolOperations
.F.performMemoryPoolOperations:
# spill func args num: 0,             range:     8464(sp) -     8464(sp)
# local var size: 8400,               range:       64(sp) -     8464(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8464
  add sp, sp, t0
  sd s9, 32(sp)
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.performMemoryPoolOperations._0.entry.0:
# Start call preparation
  li a0, 1801
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performMemoryPoolOperations._1.array.cond.0                      # ir inst 4 fin
.F.performMemoryPoolOperations._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performMemoryPoolOperations._2.array.body.0
  j .F.performMemoryPoolOperations._3.array.exit.0                      # ir inst 7 fin
.F.performMemoryPoolOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performMemoryPoolOperations._1.array.cond.0                      # ir inst 11 fin
.F.performMemoryPoolOperations._3.array.exit.0:
  li t1, 8064
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performMemoryPoolOperations._4.array.cond.1                      # ir inst 14 fin
.F.performMemoryPoolOperations._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performMemoryPoolOperations._5.array.body.1
  j .F.performMemoryPoolOperations._6.array.exit.1                      # ir inst 17 fin
.F.performMemoryPoolOperations._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performMemoryPoolOperations._4.array.cond.1                      # ir inst 21 fin
.F.performMemoryPoolOperations._6.array.exit.1:
# Start call preparation
  li a1, 2000
  addi t1, sp, 64
  mv a0, t1
  call .F.initializeMemoryPool
# ir inst 22 fin
# Start call preparation
  li a0, 1802
  call printlnInt
# ir inst 23 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 8
  j .F.performMemoryPoolOperations._7.while.cond.0                      # ir inst 24 fin
.F.performMemoryPoolOperations._7.while.cond.0:
  li t2, 64
  slt t0, t2, t6
  xori t3, t0, 1                                                        # ir inst 28 fin
  bnez t3, .F.performMemoryPoolOperations._8.lazy.then.0
  j .F.performMemoryPoolOperations._9.lazy.else.0                       # ir inst 29 fin
.F.performMemoryPoolOperations._8.lazy.then.0:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 30 fin
# Phi connections
  j .F.performMemoryPoolOperations._10.lazy.exit.0                      # ir inst 31 fin
.F.performMemoryPoolOperations._9.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.performMemoryPoolOperations._10.lazy.exit.0                      # ir inst 32 fin
.F.performMemoryPoolOperations._10.lazy.exit.0:
  bnez t3, .F.performMemoryPoolOperations._11.while.body.0
  j .F.performMemoryPoolOperations._15.while.exit.0                     # ir inst 34 fin
.F.performMemoryPoolOperations._11.while.body.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  mv a1, t5
  addi t1, sp, 64
  mv a0, t1
  call .F.allocateBlock
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 35 fin
  li t2, -1
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 36 fin
  bnez s11, .F.performMemoryPoolOperations._12.if.then.0
  j .F.performMemoryPoolOperations._13.if.else.0                        # ir inst 37 fin
.F.performMemoryPoolOperations._12.if.then.0:
  mv s11, t4                                                            # ir inst 38 fin
  slli t2, s11, 2
  li t1, 8064
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 39 fin
  sw t3, 0(s10)                                                         # ir inst 40 fin
  addi t3, t4, 1                                                        # ir inst 41 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a1, 2000
  addi t1, sp, 64
  mv a0, t1
  call .F.findFreeListHead
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 42 fin
# Phi connections
  mv t0, s11
  mv s11, t3
  mv t3, t0
  j .F.performMemoryPoolOperations._14.if.exit.0                        # ir inst 43 fin
.F.performMemoryPoolOperations._13.if.else.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.performMemoryPoolOperations._14.if.exit.0                        # ir inst 44 fin
.F.performMemoryPoolOperations._14.if.exit.0:
  addi s10, t6, 8                                                       # ir inst 47 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.performMemoryPoolOperations._7.while.cond.0                      # ir inst 48 fin
.F.performMemoryPoolOperations._15.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 49 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  li a0, 1803
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 50 fin
# Phi connections
  li t3, 0
  li t6, 0
  j .F.performMemoryPoolOperations._16.while.cond.1                     # ir inst 51 fin
.F.performMemoryPoolOperations._16.while.cond.1:
  slt s11, t6, t4                                                       # ir inst 54 fin
  bnez s11, .F.performMemoryPoolOperations._17.while.body.1
  j .F.performMemoryPoolOperations._21.while.exit.1                     # ir inst 55 fin
.F.performMemoryPoolOperations._17.while.body.1:
  li t2, 3
  rem s11, t6, t2                                                       # ir inst 56 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 57 fin
  bnez s10, .F.performMemoryPoolOperations._18.if.then.1
  j .F.performMemoryPoolOperations._19.if.else.1                        # ir inst 58 fin
.F.performMemoryPoolOperations._18.if.then.1:
  mv s11, t6                                                            # ir inst 59 fin
  slli t2, s11, 2
  li t1, 8064
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 60 fin
  lw s11, 0(s10)                                                        # ir inst 61 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  addi t1, sp, 64
  mv a0, t1
  call .F.deallocateBlock
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 62 fin
  addi s11, t3, 1                                                       # ir inst 63 fin
  mv s10, t6                                                            # ir inst 64 fin
  slli t2, s10, 2
  li t1, 8064
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 65 fin
  li t1, -1
  sw t1, 0(s9)                                                          # ir inst 66 fin
# Phi connections
  j .F.performMemoryPoolOperations._20.if.exit.1                        # ir inst 67 fin
.F.performMemoryPoolOperations._19.if.else.1:
# Phi connections
  mv s11, t3
  j .F.performMemoryPoolOperations._20.if.exit.1                        # ir inst 68 fin
.F.performMemoryPoolOperations._20.if.exit.1:
  addi s10, t6, 1                                                       # ir inst 70 fin
# Phi connections
  mv t3, s11
  mv t6, s10
  j .F.performMemoryPoolOperations._16.while.cond.1                     # ir inst 71 fin
.F.performMemoryPoolOperations._21.while.exit.1:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
# ir inst 72 fin
# Start call preparation
  sd t5, 0(sp)
  li a0, 1804
  call printlnInt
  ld t5, 0(sp)
# ir inst 73 fin
# Start call preparation
  sd t5, 0(sp)
  li a1, 2000
  addi t1, sp, 64
  mv a0, t1
  call .F.coalesceAdjacentBlocks
  mv t6, a0
  ld t5, 0(sp)
# ir inst 74 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 75 fin
# Start call preparation
  sd t5, 0(sp)
  li a0, 1805
  call printlnInt
  ld t5, 0(sp)
# ir inst 76 fin
# Phi connections
  mv t4, t5
  li t5, 0
  li t6, 16
  j .F.performMemoryPoolOperations._22.while.cond.2                     # ir inst 77 fin
.F.performMemoryPoolOperations._22.while.cond.2:
  li t2, 48
  slt t0, t2, t6
  xori t3, t0, 1                                                        # ir inst 81 fin
  bnez t3, .F.performMemoryPoolOperations._23.lazy.then.1
  j .F.performMemoryPoolOperations._24.lazy.else.1                      # ir inst 82 fin
.F.performMemoryPoolOperations._23.lazy.then.1:
  li t2, 20
  slt t3, t5, t2                                                        # ir inst 83 fin
# Phi connections
  j .F.performMemoryPoolOperations._25.lazy.exit.1                      # ir inst 84 fin
.F.performMemoryPoolOperations._24.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.performMemoryPoolOperations._25.lazy.exit.1                      # ir inst 85 fin
.F.performMemoryPoolOperations._25.lazy.exit.1:
  bnez t3, .F.performMemoryPoolOperations._26.while.body.2
  j .F.performMemoryPoolOperations._30.while.exit.2                     # ir inst 87 fin
.F.performMemoryPoolOperations._26.while.body.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  mv a1, t4
  addi t1, sp, 64
  mv a0, t1
  call .F.allocateBlock
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 88 fin
  li t2, -1
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 89 fin
  bnez s11, .F.performMemoryPoolOperations._27.if.then.2
  j .F.performMemoryPoolOperations._28.if.else.2                        # ir inst 90 fin
.F.performMemoryPoolOperations._27.if.then.2:
  addi t3, t5, 1                                                        # ir inst 91 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a1, 2000
  addi t1, sp, 64
  mv a0, t1
  call .F.findFreeListHead
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 92 fin
# Phi connections
  mv t4, t3
  mv t3, s11
  j .F.performMemoryPoolOperations._29.if.exit.2                        # ir inst 93 fin
.F.performMemoryPoolOperations._28.if.else.2:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.performMemoryPoolOperations._29.if.exit.2                        # ir inst 94 fin
.F.performMemoryPoolOperations._29.if.exit.2:
  addi s11, t6, 4                                                       # ir inst 97 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.performMemoryPoolOperations._22.while.cond.2                     # ir inst 98 fin
.F.performMemoryPoolOperations._30.while.exit.2:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 99 fin
# Start call preparation
  li a0, 1806
  call printlnInt
# ir inst 100 fin
# Start call preparation
  li a1, 2000
  addi t1, sp, 64
  mv a0, t1
  call .F.analyzeMemoryUtilization
  mv t6, a0
# ir inst 101 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 102 fin
  j .F.performMemoryPoolOperations.epilogue                             # ir inst 103 fin
.F.performMemoryPoolOperations.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  li t0, 8464
  add sp, sp, t0
  ret

.globl .F.initializeMemoryPool
.F.initializeMemoryPool:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeMemoryPool._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, a1, -4                                                       # ir inst 2 fin
  sw t5, 0(t6)                                                          # ir inst 3 fin
  addi t6, a0, 4                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t6, a0, 8                                                        # ir inst 6 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t6, a0, 12                                                       # ir inst 8 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 9 fin
# Phi connections
  li t6, 4
  j .F.initializeMemoryPool._1.while.cond.0                             # ir inst 10 fin
.F.initializeMemoryPool._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 12 fin
  bnez t5, .F.initializeMemoryPool._2.while.body.0
  j .F.initializeMemoryPool._3.while.exit.0                             # ir inst 13 fin
.F.initializeMemoryPool._2.while.body.0:
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 16 fin
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.initializeMemoryPool._1.while.cond.0                             # ir inst 18 fin
.F.initializeMemoryPool._3.while.exit.0:
  j .F.initializeMemoryPool.epilogue                                    # ir inst 19 fin
.F.initializeMemoryPool.epilogue:
  ret

.globl .F.allocateBlock
.F.allocateBlock:
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
.F.allocateBlock._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  li a1, 4
  mv a0, a2
  call .F.alignSize
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
  addi t5, t6, 4                                                        # ir inst 2 fin
# Phi connections
  mv t4, a1
  j .F.allocateBlock._1.while.cond.0                                    # ir inst 3 fin
.F.allocateBlock._1.while.cond.0:
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.allocateBlock._2.lazy.then.0
  j .F.allocateBlock._3.lazy.else.0                                     # ir inst 6 fin
.F.allocateBlock._2.lazy.then.0:
  li t2, 1996
  slt t3, t4, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.allocateBlock._4.lazy.exit.0                                     # ir inst 8 fin
.F.allocateBlock._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.allocateBlock._4.lazy.exit.0                                     # ir inst 9 fin
.F.allocateBlock._4.lazy.exit.0:
  bnez t3, .F.allocateBlock._5.while.body.0
  j .F.allocateBlock._15.while.exit.0                                   # ir inst 11 fin
.F.allocateBlock._5.while.body.0:
  mv t3, t4                                                             # ir inst 12 fin
  addi s11, t3, 1                                                       # ir inst 13 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s11, 0(t3)                                                         # ir inst 15 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.allocateBlock._6.if.then.0
  j .F.allocateBlock._13.if.else.0                                      # ir inst 17 fin
.F.allocateBlock._6.if.then.0:
  mv t3, t4                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  lw t3, 0(s11)                                                         # ir inst 20 fin
  slt t0, t3, t5
  xori s11, t0, 1                                                       # ir inst 21 fin
  bnez s11, .F.allocateBlock._7.if.then.1
  j .F.allocateBlock._11.if.else.1                                      # ir inst 22 fin
.F.allocateBlock._7.if.then.1:
  addi s11, t5, 8                                                       # ir inst 23 fin
  slt s10, s11, t3                                                      # ir inst 24 fin
  bnez s10, .F.allocateBlock._8.if.then.2
  j .F.allocateBlock._9.if.else.2                                       # ir inst 25 fin
.F.allocateBlock._8.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  mv a1, t4
  call .F.splitBlock
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 26 fin
  j .F.allocateBlock._10.if.exit.2                                      # ir inst 27 fin
.F.allocateBlock._9.if.else.2:
  j .F.allocateBlock._10.if.exit.2                                      # ir inst 28 fin
.F.allocateBlock._10.if.exit.2:
  mv t3, t4                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  sw t6, 0(s11)                                                         # ir inst 31 fin
  mv t3, t4                                                             # ir inst 32 fin
  addi s11, t3, 1                                                       # ir inst 33 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 34 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 35 fin
  mv a0, t4
  j .F.allocateBlock.epilogue                                           # ir inst 36 fin
.F.allocateBlock._11.if.else.1:
  j .F.allocateBlock._12.if.exit.1                                      # ir inst 37 fin
.F.allocateBlock._12.if.exit.1:
  j .F.allocateBlock._14.if.exit.0                                      # ir inst 38 fin
.F.allocateBlock._13.if.else.0:
  j .F.allocateBlock._14.if.exit.0                                      # ir inst 39 fin
.F.allocateBlock._14.if.exit.0:
  mv t3, t4                                                             # ir inst 40 fin
  addi t4, t3, 2                                                        # ir inst 41 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 42 fin
  lw t4, 0(t3)                                                          # ir inst 43 fin
# Phi connections
  j .F.allocateBlock._1.while.cond.0                                    # ir inst 44 fin
.F.allocateBlock._15.while.exit.0:
  li a0, -1
  j .F.allocateBlock.epilogue                                           # ir inst 45 fin
.F.allocateBlock.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.alignSize
.F.alignSize:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.alignSize._0.entry.0:
  add t6, a0, a1                                                        # ir inst 1 fin
  addi t5, t6, -1                                                       # ir inst 2 fin
  div t6, t5, a1                                                        # ir inst 3 fin
  mul t5, t6, a1                                                        # ir inst 4 fin
  mv a0, t5
  j .F.alignSize.epilogue                                               # ir inst 5 fin
.F.alignSize.epilogue:
  ret

.globl .F.splitBlock
.F.splitBlock:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.splitBlock._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  sub t5, t6, a2                                                        # ir inst 4 fin
  li t2, 8
  slt t0, t5, t2
  xori t6, t0, 1                                                        # ir inst 5 fin
  bnez t6, .F.splitBlock._1.if.then.0
  j .F.splitBlock._5.if.else.0                                          # ir inst 6 fin
.F.splitBlock._1.if.then.0:
  add t6, a1, a2                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  addi t4, t5, -4                                                       # ir inst 10 fin
  sw t4, 0(t3)                                                          # ir inst 11 fin
  mv t5, t6                                                             # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 15 fin
  mv t5, t6                                                             # ir inst 16 fin
  addi t4, t5, 2                                                        # ir inst 17 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 18 fin
  mv t4, a1                                                             # ir inst 19 fin
  addi t3, t4, 2                                                        # ir inst 20 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 21 fin
  lw t3, 0(t4)                                                          # ir inst 22 fin
  sw t3, 0(t5)                                                          # ir inst 23 fin
  mv t5, t6                                                             # ir inst 24 fin
  addi t4, t5, 3                                                        # ir inst 25 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 26 fin
  sw a1, 0(t5)                                                          # ir inst 27 fin
  mv t5, a1                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 29 fin
  addi t5, a2, -4                                                       # ir inst 30 fin
  sw t5, 0(t4)                                                          # ir inst 31 fin
  mv t5, a1                                                             # ir inst 32 fin
  addi t4, t5, 2                                                        # ir inst 33 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 34 fin
  sw t6, 0(t5)                                                          # ir inst 35 fin
  mv t5, t6                                                             # ir inst 36 fin
  addi t4, t5, 2                                                        # ir inst 37 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 38 fin
  lw t4, 0(t5)                                                          # ir inst 39 fin
  li t2, -1
  xor t0, t4, t2
  sltu t5, zero, t0                                                     # ir inst 40 fin
  bnez t5, .F.splitBlock._2.if.then.1
  j .F.splitBlock._3.if.else.1                                          # ir inst 41 fin
.F.splitBlock._2.if.then.1:
  mv t5, t6                                                             # ir inst 42 fin
  addi t4, t5, 2                                                        # ir inst 43 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 44 fin
  lw t4, 0(t5)                                                          # ir inst 45 fin
  mv t5, t4                                                             # ir inst 46 fin
  addi t4, t5, 3                                                        # ir inst 47 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 48 fin
  sw t6, 0(t5)                                                          # ir inst 49 fin
  j .F.splitBlock._4.if.exit.1                                          # ir inst 50 fin
.F.splitBlock._3.if.else.1:
  j .F.splitBlock._4.if.exit.1                                          # ir inst 51 fin
.F.splitBlock._4.if.exit.1:
  j .F.splitBlock._6.if.exit.0                                          # ir inst 52 fin
.F.splitBlock._5.if.else.0:
  j .F.splitBlock._6.if.exit.0                                          # ir inst 53 fin
.F.splitBlock._6.if.exit.0:
  j .F.splitBlock.epilogue                                              # ir inst 54 fin
.F.splitBlock.epilogue:
  ret

.globl .F.deallocateBlock
.F.deallocateBlock:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.deallocateBlock._0.entry.0:
  li t2, 0
  slt t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.deallocateBlock._1.lazy.then.0
  j .F.deallocateBlock._2.lazy.else.0                                   # ir inst 2 fin
.F.deallocateBlock._1.lazy.then.0:
  li t2, 1996
  slt t6, a1, t2                                                        # ir inst 3 fin
# Phi connections
  j .F.deallocateBlock._3.lazy.exit.0                                   # ir inst 4 fin
.F.deallocateBlock._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.deallocateBlock._3.lazy.exit.0                                   # ir inst 5 fin
.F.deallocateBlock._3.lazy.exit.0:
  bnez t6, .F.deallocateBlock._4.if.then.0
  j .F.deallocateBlock._5.if.else.0                                     # ir inst 7 fin
.F.deallocateBlock._4.if.then.0:
  mv t6, a1                                                             # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 11 fin
  mv t6, a1                                                             # ir inst 12 fin
  addi t5, t6, 2                                                        # ir inst 13 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 14 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 15 fin
  mv t6, a1                                                             # ir inst 16 fin
  addi t5, t6, 3                                                        # ir inst 17 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 18 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 19 fin
  j .F.deallocateBlock._6.if.exit.0                                     # ir inst 20 fin
.F.deallocateBlock._5.if.else.0:
  j .F.deallocateBlock._6.if.exit.0                                     # ir inst 21 fin
.F.deallocateBlock._6.if.exit.0:
  j .F.deallocateBlock.epilogue                                         # ir inst 22 fin
.F.deallocateBlock.epilogue:
  ret

.globl .F.findFreeListHead
.F.findFreeListHead:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.findFreeListHead._0.entry.0:
# Phi connections
  li t6, 0
  j .F.findFreeListHead._1.while.cond.0                                 # ir inst 1 fin
.F.findFreeListHead._1.while.cond.0:
  addi t5, a1, -4                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.findFreeListHead._2.while.body.0
  j .F.findFreeListHead._6.while.exit.0                                 # ir inst 5 fin
.F.findFreeListHead._2.while.body.0:
  mv t5, t6                                                             # ir inst 6 fin
  addi t4, t5, 1                                                        # ir inst 7 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.findFreeListHead._3.if.then.0
  j .F.findFreeListHead._4.if.else.0                                    # ir inst 11 fin
.F.findFreeListHead._3.if.then.0:
  mv a0, t6
  j .F.findFreeListHead.epilogue                                        # ir inst 12 fin
.F.findFreeListHead._4.if.else.0:
  j .F.findFreeListHead._5.if.exit.0                                    # ir inst 13 fin
.F.findFreeListHead._5.if.exit.0:
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  lw t5, 0(t4)                                                          # ir inst 16 fin
  addi t4, t5, 4                                                        # ir inst 17 fin
  add t5, t6, t4                                                        # ir inst 18 fin
# Phi connections
  mv t6, t5
  j .F.findFreeListHead._1.while.cond.0                                 # ir inst 19 fin
.F.findFreeListHead._6.while.exit.0:
  li a0, -1
  j .F.findFreeListHead.epilogue                                        # ir inst 20 fin
.F.findFreeListHead.epilogue:
  ret

.globl .F.coalesceAdjacentBlocks
.F.coalesceAdjacentBlocks:
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
.F.coalesceAdjacentBlocks._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.coalesceAdjacentBlocks._1.while.cond.0                           # ir inst 1 fin
.F.coalesceAdjacentBlocks._1.while.cond.0:
  addi t4, a1, -8                                                       # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.coalesceAdjacentBlocks._2.while.body.0
  j .F.coalesceAdjacentBlocks._12.while.exit.0                          # ir inst 6 fin
.F.coalesceAdjacentBlocks._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  addi t3, t4, 1                                                        # ir inst 8 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 9 fin
  lw t3, 0(t4)                                                          # ir inst 10 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 11 fin
  bnez t4, .F.coalesceAdjacentBlocks._3.if.then.0
  j .F.coalesceAdjacentBlocks._10.if.else.0                             # ir inst 12 fin
.F.coalesceAdjacentBlocks._3.if.then.0:
  mv t4, t6                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  addi t3, t4, 4                                                        # ir inst 16 fin
  add t4, t6, t3                                                        # ir inst 17 fin
  addi s11, a1, -4                                                      # ir inst 18 fin
  slt s10, t4, s11                                                      # ir inst 19 fin
  bnez s10, .F.coalesceAdjacentBlocks._4.lazy.then.0
  j .F.coalesceAdjacentBlocks._5.lazy.else.0                            # ir inst 20 fin
.F.coalesceAdjacentBlocks._4.lazy.then.0:
  mv s11, t4                                                            # ir inst 21 fin
  addi s10, s11, 1                                                      # ir inst 22 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 23 fin
  lw s10, 0(s11)                                                        # ir inst 24 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s11, t0, 1                                                      # ir inst 25 fin
# Phi connections
  j .F.coalesceAdjacentBlocks._6.lazy.exit.0                            # ir inst 26 fin
.F.coalesceAdjacentBlocks._5.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.coalesceAdjacentBlocks._6.lazy.exit.0                            # ir inst 27 fin
.F.coalesceAdjacentBlocks._6.lazy.exit.0:
  bnez s11, .F.coalesceAdjacentBlocks._7.if.then.1
  j .F.coalesceAdjacentBlocks._8.if.else.1                              # ir inst 29 fin
.F.coalesceAdjacentBlocks._7.if.then.1:
  mv s11, t4                                                            # ir inst 30 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 31 fin
  lw s11, 0(s10)                                                        # ir inst 32 fin
  addi s10, s11, 4                                                      # ir inst 33 fin
  mv s11, t6                                                            # ir inst 34 fin
  slli t2, s11, 2
  add s9, a0, t2                                                        # ir inst 35 fin
  mv s11, t6                                                            # ir inst 36 fin
  slli t2, s11, 2
  add s8, a0, t2                                                        # ir inst 37 fin
  lw s11, 0(s8)                                                         # ir inst 38 fin
  add s8, s11, s10                                                      # ir inst 39 fin
  sw s8, 0(s9)                                                          # ir inst 40 fin
  mv s11, t4                                                            # ir inst 41 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 42 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 43 fin
  mv s11, t4                                                            # ir inst 44 fin
  addi s10, s11, 1                                                      # ir inst 45 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 46 fin
  li t1, -1
  sw t1, 0(s11)                                                         # ir inst 47 fin
  mv s11, t4                                                            # ir inst 48 fin
  addi s10, s11, 2                                                      # ir inst 49 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 50 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 51 fin
  mv s11, t4                                                            # ir inst 52 fin
  addi t4, s11, 3                                                       # ir inst 53 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 54 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 55 fin
  addi t4, t5, 1                                                        # ir inst 56 fin
# Phi connections
  mv t3, t4
  mv t4, t6
  j .F.coalesceAdjacentBlocks._9.if.exit.1                              # ir inst 57 fin
.F.coalesceAdjacentBlocks._8.if.else.1:
  add t4, t6, t3                                                        # ir inst 58 fin
# Phi connections
  mv t3, t5
  j .F.coalesceAdjacentBlocks._9.if.exit.1                              # ir inst 59 fin
.F.coalesceAdjacentBlocks._9.if.exit.1:
# Phi connections
  mv t6, t4
  mv t4, t3
  j .F.coalesceAdjacentBlocks._11.if.exit.0                             # ir inst 62 fin
.F.coalesceAdjacentBlocks._10.if.else.0:
  mv t4, t6                                                             # ir inst 63 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 64 fin
  lw t4, 0(t3)                                                          # ir inst 65 fin
  addi t3, t4, 4                                                        # ir inst 66 fin
  add t4, t6, t3                                                        # ir inst 67 fin
# Phi connections
  mv t6, t4
  mv t4, t5
  j .F.coalesceAdjacentBlocks._11.if.exit.0                             # ir inst 68 fin
.F.coalesceAdjacentBlocks._11.if.exit.0:
# Phi connections
  mv t5, t4
  j .F.coalesceAdjacentBlocks._1.while.cond.0                           # ir inst 71 fin
.F.coalesceAdjacentBlocks._12.while.exit.0:
  mv a0, t5
  j .F.coalesceAdjacentBlocks.epilogue                                  # ir inst 72 fin
.F.coalesceAdjacentBlocks.epilogue:
  ld s9, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.analyzeMemoryUtilization
.F.analyzeMemoryUtilization:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
.F.analyzeMemoryUtilization._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.analyzeMemoryUtilization._1.while.cond.0                         # ir inst 1 fin
.F.analyzeMemoryUtilization._1.while.cond.0:
  addi t3, a1, -4                                                       # ir inst 5 fin
  slt s11, t4, t3                                                       # ir inst 6 fin
  bnez s11, .F.analyzeMemoryUtilization._2.while.body.0
  j .F.analyzeMemoryUtilization._9.while.exit.0                         # ir inst 7 fin
.F.analyzeMemoryUtilization._2.while.body.0:
  mv t3, t4                                                             # ir inst 8 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 9 fin
  lw t3, 0(s11)                                                         # ir inst 10 fin
  addi s11, t3, 4                                                       # ir inst 11 fin
  mv t3, t4                                                             # ir inst 12 fin
  addi s10, t3, 1                                                       # ir inst 13 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s10, 0(t3)                                                         # ir inst 15 fin
  li t2, 0
  xor t0, s10, t2
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.analyzeMemoryUtilization._3.if.then.0
  j .F.analyzeMemoryUtilization._4.if.else.0                            # ir inst 17 fin
.F.analyzeMemoryUtilization._3.if.then.0:
  mv t3, t4                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 19 fin
  lw t3, 0(s10)                                                         # ir inst 20 fin
  add s10, t5, t3                                                       # ir inst 21 fin
# Phi connections
  mv t3, t6
  j .F.analyzeMemoryUtilization._8.if.exit.0                            # ir inst 22 fin
.F.analyzeMemoryUtilization._4.if.else.0:
  mv t3, t4                                                             # ir inst 23 fin
  addi s10, t3, 1                                                       # ir inst 24 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 25 fin
  lw s10, 0(t3)                                                         # ir inst 26 fin
  li t2, 1
  xor t0, s10, t2
  sltiu t3, t0, 1                                                       # ir inst 27 fin
  bnez t3, .F.analyzeMemoryUtilization._5.if.then.1
  j .F.analyzeMemoryUtilization._6.if.else.1                            # ir inst 28 fin
.F.analyzeMemoryUtilization._5.if.then.1:
  mv t3, t4                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 30 fin
  lw t3, 0(s10)                                                         # ir inst 31 fin
  add s10, t6, t3                                                       # ir inst 32 fin
# Phi connections
  mv t3, s10
  j .F.analyzeMemoryUtilization._7.if.exit.1                            # ir inst 33 fin
.F.analyzeMemoryUtilization._6.if.else.1:
# Phi connections
  mv t3, t6
  j .F.analyzeMemoryUtilization._7.if.exit.1                            # ir inst 34 fin
.F.analyzeMemoryUtilization._7.if.exit.1:
# Phi connections
  mv s10, t5
  j .F.analyzeMemoryUtilization._8.if.exit.0                            # ir inst 36 fin
.F.analyzeMemoryUtilization._8.if.exit.0:
  add s9, t4, s11                                                       # ir inst 39 fin
# Phi connections
  mv t4, s9
  mv t5, s10
  mv t6, t3
  j .F.analyzeMemoryUtilization._1.while.cond.0                         # ir inst 40 fin
.F.analyzeMemoryUtilization._9.while.exit.0:
  add t4, t6, t5                                                        # ir inst 41 fin
  li t2, 0
  slt t5, t2, t4                                                        # ir inst 42 fin
  bnez t5, .F.analyzeMemoryUtilization._10.if.then.2
  j .F.analyzeMemoryUtilization._11.if.else.2                           # ir inst 43 fin
.F.analyzeMemoryUtilization._10.if.then.2:
  li t2, 100
  mul t5, t6, t2                                                        # ir inst 44 fin
  div t6, t5, t4                                                        # ir inst 45 fin
  mv a0, t6
  j .F.analyzeMemoryUtilization.epilogue                                # ir inst 46 fin
.F.analyzeMemoryUtilization._11.if.else.2:
  li a0, 0
  j .F.analyzeMemoryUtilization.epilogue                                # ir inst 47 fin
.F.analyzeMemoryUtilization._12.if.exit.2:
.F.analyzeMemoryUtilization.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.performBuddyAllocationTest
.F.performBuddyAllocationTest:
# spill func args num: 0,             range:     2512(sp) -     2512(sp)
# local var size: 2448,               range:       56(sp) -     2504(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -2512
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.performBuddyAllocationTest._0.entry.0:
# Start call preparation
  li a0, 1810
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performBuddyAllocationTest._1.array.cond.0                       # ir inst 4 fin
.F.performBuddyAllocationTest._1.array.cond.0:
  li t2, 512
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performBuddyAllocationTest._2.array.body.0
  j .F.performBuddyAllocationTest._3.array.exit.0                       # ir inst 7 fin
.F.performBuddyAllocationTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performBuddyAllocationTest._1.array.cond.0                       # ir inst 11 fin
.F.performBuddyAllocationTest._3.array.exit.0:
  li t1, 2104
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performBuddyAllocationTest._4.array.cond.1                       # ir inst 14 fin
.F.performBuddyAllocationTest._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performBuddyAllocationTest._5.array.body.1
  j .F.performBuddyAllocationTest._6.array.exit.1                       # ir inst 17 fin
.F.performBuddyAllocationTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performBuddyAllocationTest._4.array.cond.1                       # ir inst 21 fin
.F.performBuddyAllocationTest._6.array.exit.1:
# Start call preparation
  li a1, 8
  addi t1, sp, 56
  mv a0, t1
  call .F.initializeBuddySystem
# ir inst 22 fin
# Start call preparation
  li a0, 1811
  call printlnInt
# ir inst 23 fin
# Phi connections
  li t5, 0
  li t6, 1
  j .F.performBuddyAllocationTest._7.while.cond.0                       # ir inst 24 fin
.F.performBuddyAllocationTest._7.while.cond.0:
  li t2, 64
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 27 fin
  bnez t4, .F.performBuddyAllocationTest._8.lazy.then.0
  j .F.performBuddyAllocationTest._9.lazy.else.0                        # ir inst 28 fin
.F.performBuddyAllocationTest._8.lazy.then.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 29 fin
# Phi connections
  j .F.performBuddyAllocationTest._10.lazy.exit.0                       # ir inst 30 fin
.F.performBuddyAllocationTest._9.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performBuddyAllocationTest._10.lazy.exit.0                       # ir inst 31 fin
.F.performBuddyAllocationTest._10.lazy.exit.0:
  bnez t4, .F.performBuddyAllocationTest._11.while.body.0
  j .F.performBuddyAllocationTest._15.while.exit.0                      # ir inst 33 fin
.F.performBuddyAllocationTest._11.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  li a1, 8
  addi t1, sp, 56
  mv a0, t1
  call .F.buddyAllocate
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 34 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 35 fin
  bnez t3, .F.performBuddyAllocationTest._12.if.then.0
  j .F.performBuddyAllocationTest._13.if.else.0                         # ir inst 36 fin
.F.performBuddyAllocationTest._12.if.then.0:
  mv t3, t5                                                             # ir inst 37 fin
  slli t2, t3, 2
  li t1, 2104
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 38 fin
  sw t4, 0(s11)                                                         # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  j .F.performBuddyAllocationTest._14.if.exit.0                         # ir inst 41 fin
.F.performBuddyAllocationTest._13.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performBuddyAllocationTest._14.if.exit.0                         # ir inst 42 fin
.F.performBuddyAllocationTest._14.if.exit.0:
  slli t3, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performBuddyAllocationTest._7.while.cond.0                       # ir inst 45 fin
.F.performBuddyAllocationTest._15.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 46 fin
# Start call preparation
  sd t5, 0(sp)
  li a0, 1812
  call printlnInt
  ld t5, 0(sp)
# ir inst 47 fin
# Phi connections
  li t4, 0
  li t6, 0
  j .F.performBuddyAllocationTest._16.while.cond.1                      # ir inst 48 fin
.F.performBuddyAllocationTest._16.while.cond.1:
  slt t3, t6, t5                                                        # ir inst 51 fin
  bnez t3, .F.performBuddyAllocationTest._17.while.body.1
  j .F.performBuddyAllocationTest._21.while.exit.1                      # ir inst 52 fin
.F.performBuddyAllocationTest._17.while.body.1:
  li t2, 2
  rem t3, t6, t2                                                        # ir inst 53 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 54 fin
  bnez s11, .F.performBuddyAllocationTest._18.if.then.1
  j .F.performBuddyAllocationTest._19.if.else.1                         # ir inst 55 fin
.F.performBuddyAllocationTest._18.if.then.1:
  mv t3, t6                                                             # ir inst 56 fin
  slli t2, t3, 2
  li t1, 2104
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 57 fin
  lw t3, 0(s11)                                                         # ir inst 58 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t3
  li a1, 8
  addi t1, sp, 56
  mv a0, t1
  call .F.buddyDeallocate
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 59 fin
  addi t3, t4, 1                                                        # ir inst 60 fin
  mv s11, t6                                                            # ir inst 61 fin
  slli t2, s11, 2
  li t1, 2104
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 62 fin
  li t1, -1
  sw t1, 0(s10)                                                         # ir inst 63 fin
# Phi connections
  j .F.performBuddyAllocationTest._20.if.exit.1                         # ir inst 64 fin
.F.performBuddyAllocationTest._19.if.else.1:
# Phi connections
  mv t3, t4
  j .F.performBuddyAllocationTest._20.if.exit.1                         # ir inst 65 fin
.F.performBuddyAllocationTest._20.if.exit.1:
  addi s11, t6, 1                                                       # ir inst 67 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.performBuddyAllocationTest._16.while.cond.1                      # ir inst 68 fin
.F.performBuddyAllocationTest._21.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 69 fin
# Start call preparation
  li a0, 1813
  call printlnInt
# ir inst 70 fin
# Phi connections
  li t5, 8
  li t6, 0
  j .F.performBuddyAllocationTest._22.while.cond.2                      # ir inst 71 fin
.F.performBuddyAllocationTest._22.while.cond.2:
  li t2, 32
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 74 fin
  bnez t4, .F.performBuddyAllocationTest._23.lazy.then.1
  j .F.performBuddyAllocationTest._24.lazy.else.1                       # ir inst 75 fin
.F.performBuddyAllocationTest._23.lazy.then.1:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 76 fin
# Phi connections
  j .F.performBuddyAllocationTest._25.lazy.exit.1                       # ir inst 77 fin
.F.performBuddyAllocationTest._24.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.performBuddyAllocationTest._25.lazy.exit.1                       # ir inst 78 fin
.F.performBuddyAllocationTest._25.lazy.exit.1:
  bnez t4, .F.performBuddyAllocationTest._26.while.body.2
  j .F.performBuddyAllocationTest._30.while.exit.2                      # ir inst 80 fin
.F.performBuddyAllocationTest._26.while.body.2:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a2, t5
  li a1, 8
  addi t1, sp, 56
  mv a0, t1
  call .F.buddyAllocate
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 81 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 82 fin
  bnez t3, .F.performBuddyAllocationTest._27.if.then.2
  j .F.performBuddyAllocationTest._28.if.else.2                         # ir inst 83 fin
.F.performBuddyAllocationTest._27.if.then.2:
  addi t4, t6, 1                                                        # ir inst 84 fin
# Phi connections
  j .F.performBuddyAllocationTest._29.if.exit.2                         # ir inst 85 fin
.F.performBuddyAllocationTest._28.if.else.2:
# Phi connections
  mv t4, t6
  j .F.performBuddyAllocationTest._29.if.exit.2                         # ir inst 86 fin
.F.performBuddyAllocationTest._29.if.exit.2:
  addi t3, t5, 8                                                        # ir inst 88 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performBuddyAllocationTest._22.while.cond.2                      # ir inst 89 fin
.F.performBuddyAllocationTest._30.while.exit.2:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 90 fin
# Start call preparation
  li a0, 1814
  call printlnInt
# ir inst 91 fin
# Start call preparation
  li a1, 8
  addi t1, sp, 56
  mv a0, t1
  call .F.analyzeBuddyFragmentation
  mv t6, a0
# ir inst 92 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 93 fin
  j .F.performBuddyAllocationTest.epilogue                              # ir inst 94 fin
.F.performBuddyAllocationTest.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 2512
  add sp, sp, t0
  ret

.globl .F.initializeBuddySystem
.F.initializeBuddySystem:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeBuddySystem._0.entry.0:
  slli t6, a1, 1                                                        # ir inst 1 fin
  addi t5, t6, -1                                                       # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.initializeBuddySystem._1.while.cond.0                            # ir inst 3 fin
.F.initializeBuddySystem._1.while.cond.0:
  slt t4, t6, t5                                                        # ir inst 5 fin
  bnez t4, .F.initializeBuddySystem._2.while.body.0
  j .F.initializeBuddySystem._3.while.exit.0                            # ir inst 6 fin
.F.initializeBuddySystem._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F.initializeBuddySystem._1.while.cond.0                            # ir inst 11 fin
.F.initializeBuddySystem._3.while.exit.0:
  j .F.initializeBuddySystem.epilogue                                   # ir inst 12 fin
.F.initializeBuddySystem.epilogue:
  ret

.globl .F.buddyAllocate
.F.buddyAllocate:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.buddyAllocate._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a2
  call .F.calculateRequiredLevel
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
  li t2, 0
  slt t5, t6, t2                                                        # ir inst 2 fin
  bnez t5, .F.buddyAllocate._1.if.then.0
  j .F.buddyAllocate._2.if.else.0                                       # ir inst 3 fin
.F.buddyAllocate._1.if.then.0:
  li a0, -1
  j .F.buddyAllocate.epilogue                                           # ir inst 4 fin
.F.buddyAllocate._2.if.else.0:
  j .F.buddyAllocate._3.if.exit.0                                       # ir inst 5 fin
.F.buddyAllocate._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  mv a4, a1
  mv a3, t6
  li a2, 0
  li a1, 0
  call .F.findFreeNode
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 7 fin
  bnez t4, .F.buddyAllocate._4.if.then.1
  j .F.buddyAllocate._5.if.else.1                                       # ir inst 8 fin
.F.buddyAllocate._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, a1
  mv a2, t6
  mv a1, t5
  call .F.markNodeAsAllocated
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
  mv a0, t5
  j .F.buddyAllocate.epilogue                                           # ir inst 10 fin
.F.buddyAllocate._5.if.else.1:
  j .F.buddyAllocate._6.if.exit.1                                       # ir inst 11 fin
.F.buddyAllocate._6.if.exit.1:
  li a0, -1
  j .F.buddyAllocate.epilogue                                           # ir inst 12 fin
.F.buddyAllocate.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.calculateRequiredLevel
.F.calculateRequiredLevel:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateRequiredLevel._0.entry.0:
  addi t6, a1, -1                                                       # ir inst 1 fin
  slli t5, t6, 1                                                        # ir inst 2 fin
# Phi connections
  mv t6, t5
  li t5, 0
  j .F.calculateRequiredLevel._1.while.cond.0                           # ir inst 3 fin
.F.calculateRequiredLevel._1.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 6 fin
  bnez t4, .F.calculateRequiredLevel._2.while.body.0
  j .F.calculateRequiredLevel._6.while.exit.0                           # ir inst 7 fin
.F.calculateRequiredLevel._2.while.body.0:
  slt t0, t6, a0
  xori t4, t0, 1                                                        # ir inst 8 fin
  bnez t4, .F.calculateRequiredLevel._3.if.then.0
  j .F.calculateRequiredLevel._4.if.else.0                              # ir inst 9 fin
.F.calculateRequiredLevel._3.if.then.0:
  mv a0, t5
  j .F.calculateRequiredLevel.epilogue                                  # ir inst 10 fin
.F.calculateRequiredLevel._4.if.else.0:
  j .F.calculateRequiredLevel._5.if.exit.0                              # ir inst 11 fin
.F.calculateRequiredLevel._5.if.exit.0:
  li t2, 2
  div t4, t6, t2                                                        # ir inst 12 fin
  addi t6, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.calculateRequiredLevel._1.while.cond.0                           # ir inst 14 fin
.F.calculateRequiredLevel._6.while.exit.0:
  li a0, -1
  j .F.calculateRequiredLevel.epilogue                                  # ir inst 15 fin
.F.calculateRequiredLevel.epilogue:
  ret

.globl .F.findFreeNode
.F.findFreeNode:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s8, 32(sp)
  sd s9, 40(sp)
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.findFreeNode._0.entry.0:
  xor t0, a2, a3
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.findFreeNode._1.if.then.0
  j .F.findFreeNode._5.if.else.0                                        # ir inst 2 fin
.F.findFreeNode._1.if.then.0:
  mv t6, a1                                                             # ir inst 3 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 4 fin
  lw t6, 0(t5)                                                          # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.findFreeNode._2.if.then.1
  j .F.findFreeNode._3.if.else.1                                        # ir inst 7 fin
.F.findFreeNode._2.if.then.1:
  mv a0, a1
  j .F.findFreeNode.epilogue                                            # ir inst 8 fin
.F.findFreeNode._3.if.else.1:
  li a0, -1
  j .F.findFreeNode.epilogue                                            # ir inst 9 fin
.F.findFreeNode._4.if.exit.1:
# Phi connections
  mv s11, a0
  mv t3, a1
  mv t4, a2
  mv t5, a3
  mv t6, a4
  j .F.findFreeNode._6.if.exit.0                                        # ir inst 10 fin
.F.findFreeNode._5.if.else.0:
# Phi connections
  mv s11, a0
  mv t3, a1
  mv t4, a2
  mv t5, a3
  mv t6, a4
  j .F.findFreeNode._6.if.exit.0                                        # ir inst 11 fin
.F.findFreeNode._6.if.exit.0:
  mv s10, t3                                                            # ir inst 17 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 18 fin
  lw s10, 0(s9)                                                         # ir inst 19 fin
  li t2, 1
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 20 fin
  bnez s9, .F.findFreeNode._7.if.then.2
  j .F.findFreeNode._8.if.else.2                                        # ir inst 21 fin
.F.findFreeNode._7.if.then.2:
  li a0, -1
  j .F.findFreeNode.epilogue                                            # ir inst 22 fin
.F.findFreeNode._8.if.else.2:
  j .F.findFreeNode._9.if.exit.2                                        # ir inst 23 fin
.F.findFreeNode._9.if.exit.2:
  slli s10, t3, 1                                                       # ir inst 24 fin
  addi s9, s10, 1                                                       # ir inst 25 fin
  slli s10, t3, 1                                                       # ir inst 26 fin
  addi t3, s10, 2                                                       # ir inst 27 fin
  li t2, 511
  slt s10, s9, t2                                                       # ir inst 28 fin
  bnez s10, .F.findFreeNode._10.if.then.3
  j .F.findFreeNode._14.if.else.3                                       # ir inst 29 fin
.F.findFreeNode._10.if.then.3:
  addi s10, t4, 1                                                       # ir inst 30 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a4, t6
  mv a3, t5
  mv a2, s10
  mv a1, s9
  mv a0, s11
  call .F.findFreeNode
  mv s8, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 31 fin
  li t2, -1
  xor t0, s8, t2
  sltu s10, zero, t0                                                    # ir inst 32 fin
  bnez s10, .F.findFreeNode._11.if.then.4
  j .F.findFreeNode._12.if.else.4                                       # ir inst 33 fin
.F.findFreeNode._11.if.then.4:
  mv a0, s8
  j .F.findFreeNode.epilogue                                            # ir inst 34 fin
.F.findFreeNode._12.if.else.4:
  j .F.findFreeNode._13.if.exit.4                                       # ir inst 35 fin
.F.findFreeNode._13.if.exit.4:
  j .F.findFreeNode._15.if.exit.3                                       # ir inst 36 fin
.F.findFreeNode._14.if.else.3:
  j .F.findFreeNode._15.if.exit.3                                       # ir inst 37 fin
.F.findFreeNode._15.if.exit.3:
  li t2, 511
  slt s10, t3, t2                                                       # ir inst 38 fin
  bnez s10, .F.findFreeNode._16.if.then.5
  j .F.findFreeNode._20.if.else.5                                       # ir inst 39 fin
.F.findFreeNode._16.if.then.5:
  addi s10, t4, 1                                                       # ir inst 40 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a4, t6
  mv a3, t5
  mv a2, s10
  mv a1, t3
  mv a0, s11
  call .F.findFreeNode
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 41 fin
  li t2, -1
  xor t0, t4, t2
  sltu t6, zero, t0                                                     # ir inst 42 fin
  bnez t6, .F.findFreeNode._17.if.then.6
  j .F.findFreeNode._18.if.else.6                                       # ir inst 43 fin
.F.findFreeNode._17.if.then.6:
  mv a0, t4
  j .F.findFreeNode.epilogue                                            # ir inst 44 fin
.F.findFreeNode._18.if.else.6:
  j .F.findFreeNode._19.if.exit.6                                       # ir inst 45 fin
.F.findFreeNode._19.if.exit.6:
  j .F.findFreeNode._21.if.exit.5                                       # ir inst 46 fin
.F.findFreeNode._20.if.else.5:
  j .F.findFreeNode._21.if.exit.5                                       # ir inst 47 fin
.F.findFreeNode._21.if.exit.5:
  li a0, -1
  j .F.findFreeNode.epilogue                                            # ir inst 48 fin
.F.findFreeNode.epilogue:
  ld ra, 64(sp)
  ld s8, 32(sp)
  ld s9, 40(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.markNodeAsAllocated
.F.markNodeAsAllocated:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.markNodeAsAllocated._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 3 fin
  addi t6, a1, -1                                                       # ir inst 4 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 5 fin
# Phi connections
  mv t6, t5
  mv t5, a1
  j .F.markNodeAsAllocated._1.while.cond.0                              # ir inst 6 fin
.F.markNodeAsAllocated._1.while.cond.0:
  li t2, 0
  slt t0, t6, t2
  xori t4, t0, 1                                                        # ir inst 9 fin
  bnez t4, .F.markNodeAsAllocated._2.lazy.then.0
  j .F.markNodeAsAllocated._3.lazy.else.0                               # ir inst 10 fin
.F.markNodeAsAllocated._2.lazy.then.0:
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.markNodeAsAllocated._4.lazy.exit.0                               # ir inst 12 fin
.F.markNodeAsAllocated._3.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.markNodeAsAllocated._4.lazy.exit.0                               # ir inst 13 fin
.F.markNodeAsAllocated._4.lazy.exit.0:
  bnez t5, .F.markNodeAsAllocated._5.while.body.0
  j .F.markNodeAsAllocated._13.critical_edge.0                          # ir inst 15 fin
.F.markNodeAsAllocated._5.while.body.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 17 fin
  lw t5, 0(t4)                                                          # ir inst 18 fin
  li t2, 1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 19 fin
  bnez t4, .F.markNodeAsAllocated._6.if.then.0
  j .F.markNodeAsAllocated._7.if.else.0                                 # ir inst 20 fin
.F.markNodeAsAllocated._6.if.then.0:
  mv t5, t6                                                             # ir inst 21 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 22 fin
  li t1, 2
  sw t1, 0(t4)                                                          # ir inst 23 fin
  j .F.markNodeAsAllocated._8.if.exit.0                                 # ir inst 24 fin
.F.markNodeAsAllocated._7.if.else.0:
  j .F.markNodeAsAllocated._8.if.exit.0                                 # ir inst 25 fin
.F.markNodeAsAllocated._8.if.exit.0:
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 26 fin
  bnez t5, .F.markNodeAsAllocated._9.if.then.1
  j .F.markNodeAsAllocated._10.if.else.1                                # ir inst 27 fin
.F.markNodeAsAllocated._9.if.then.1:
  j .F.markNodeAsAllocated._12.while.exit.0                             # ir inst 28 fin
.F.markNodeAsAllocated._10.if.else.1:
  j .F.markNodeAsAllocated._11.if.exit.1                                # ir inst 29 fin
.F.markNodeAsAllocated._11.if.exit.1:
  addi t5, t6, -1                                                       # ir inst 30 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 31 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.markNodeAsAllocated._1.while.cond.0                              # ir inst 32 fin
.F.markNodeAsAllocated._12.while.exit.0:
  j .F.markNodeAsAllocated.epilogue                                     # ir inst 33 fin
.F.markNodeAsAllocated._13.critical_edge.0:
  j .F.markNodeAsAllocated._12.while.exit.0                             # ir inst 34 fin
.F.markNodeAsAllocated.epilogue:
  ret

.globl .F.buddyDeallocate
.F.buddyDeallocate:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.buddyDeallocate._0.entry.0:
  li t2, 0
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.buddyDeallocate._1.lazy.then.0
  j .F.buddyDeallocate._2.lazy.else.0                                   # ir inst 2 fin
.F.buddyDeallocate._1.lazy.then.0:
  li t2, 511
  slt t6, a2, t2                                                        # ir inst 3 fin
# Phi connections
  j .F.buddyDeallocate._3.lazy.exit.0                                   # ir inst 4 fin
.F.buddyDeallocate._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.buddyDeallocate._3.lazy.exit.0                                   # ir inst 5 fin
.F.buddyDeallocate._3.lazy.exit.0:
  bnez t6, .F.buddyDeallocate._4.if.then.0
  j .F.buddyDeallocate._5.if.else.0                                     # ir inst 7 fin
.F.buddyDeallocate._4.if.then.0:
  mv t6, a2                                                             # ir inst 8 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  mv a1, a2
  call .F.coalesceBuddies
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 11 fin
  j .F.buddyDeallocate._6.if.exit.0                                     # ir inst 12 fin
.F.buddyDeallocate._5.if.else.0:
  j .F.buddyDeallocate._6.if.exit.0                                     # ir inst 13 fin
.F.buddyDeallocate._6.if.exit.0:
  j .F.buddyDeallocate.epilogue                                         # ir inst 14 fin
.F.buddyDeallocate.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.coalesceBuddies
.F.coalesceBuddies:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.coalesceBuddies._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.coalesceBuddies._1.if.then.0
  j .F.coalesceBuddies._2.if.else.0                                     # ir inst 2 fin
.F.coalesceBuddies._1.if.then.0:
  j .F.coalesceBuddies.epilogue                                         # ir inst 3 fin
.F.coalesceBuddies._2.if.else.0:
  j .F.coalesceBuddies._3.if.exit.0                                     # ir inst 4 fin
.F.coalesceBuddies._3.if.exit.0:
  addi t6, a1, -1                                                       # ir inst 5 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 6 fin
  slli t6, t5, 1                                                        # ir inst 7 fin
  addi t4, t6, 1                                                        # ir inst 8 fin
  slli t6, t5, 1                                                        # ir inst 9 fin
  addi t3, t6, 2                                                        # ir inst 10 fin
  mv t6, t4                                                             # ir inst 11 fin
  slli t2, t6, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t6, 0(s11)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.coalesceBuddies._4.lazy.then.0
  j .F.coalesceBuddies._5.lazy.else.0                                   # ir inst 15 fin
.F.coalesceBuddies._4.lazy.then.0:
  mv t6, t3                                                             # ir inst 16 fin
  slli t2, t6, 2
  add s11, a0, t2                                                       # ir inst 17 fin
  lw t6, 0(s11)                                                         # ir inst 18 fin
  li t2, 0
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 19 fin
# Phi connections
  mv t6, s11
  j .F.coalesceBuddies._6.lazy.exit.0                                   # ir inst 20 fin
.F.coalesceBuddies._5.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.coalesceBuddies._6.lazy.exit.0                                   # ir inst 21 fin
.F.coalesceBuddies._6.lazy.exit.0:
  bnez t6, .F.coalesceBuddies._7.if.then.1
  j .F.coalesceBuddies._8.if.else.1                                     # ir inst 23 fin
.F.coalesceBuddies._7.if.then.1:
  mv t6, t5                                                             # ir inst 24 fin
  slli t2, t6, 2
  add s11, a0, t2                                                       # ir inst 25 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 26 fin
  mv t6, t4                                                             # ir inst 27 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 28 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 29 fin
  mv t6, t3                                                             # ir inst 30 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 31 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 32 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F.coalesceBuddies
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 33 fin
  j .F.coalesceBuddies._9.if.exit.1                                     # ir inst 34 fin
.F.coalesceBuddies._8.if.else.1:
  j .F.coalesceBuddies._9.if.exit.1                                     # ir inst 35 fin
.F.coalesceBuddies._9.if.exit.1:
  j .F.coalesceBuddies.epilogue                                         # ir inst 36 fin
.F.coalesceBuddies.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.analyzeBuddyFragmentation
.F.analyzeBuddyFragmentation:
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
.F.analyzeBuddyFragmentation._0.entry.0:
  slli t6, a1, 1                                                        # ir inst 1 fin
  addi t5, t6, -1                                                       # ir inst 2 fin
# Phi connections
  li t3, 0
  li t4, 0
  li t6, 0
  j .F.analyzeBuddyFragmentation._1.while.cond.0                        # ir inst 3 fin
.F.analyzeBuddyFragmentation._1.while.cond.0:
  slt s11, t6, t5                                                       # ir inst 7 fin
  bnez s11, .F.analyzeBuddyFragmentation._2.while.body.0
  j .F.analyzeBuddyFragmentation._12.while.exit.0                       # ir inst 8 fin
.F.analyzeBuddyFragmentation._2.while.body.0:
  mv s11, t6                                                            # ir inst 9 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 10 fin
  lw s11, 0(s10)                                                        # ir inst 11 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 12 fin
  bnez s10, .F.analyzeBuddyFragmentation._3.if.then.0
  j .F.analyzeBuddyFragmentation._4.if.else.0                           # ir inst 13 fin
.F.analyzeBuddyFragmentation._3.if.then.0:
# Phi connections
  mv s10, t3
  mv s11, t4
  j .F.analyzeBuddyFragmentation._11.if.exit.0                          # ir inst 14 fin
.F.analyzeBuddyFragmentation._4.if.else.0:
  mv s11, t6                                                            # ir inst 15 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 16 fin
  lw s11, 0(s10)                                                        # ir inst 17 fin
  li t2, 1
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 18 fin
  bnez s10, .F.analyzeBuddyFragmentation._5.if.then.1
  j .F.analyzeBuddyFragmentation._6.if.else.1                           # ir inst 19 fin
.F.analyzeBuddyFragmentation._5.if.then.1:
  addi s11, t3, 1                                                       # ir inst 20 fin
# Phi connections
  mv s10, s11
  mv s11, t4
  j .F.analyzeBuddyFragmentation._10.if.exit.1                          # ir inst 21 fin
.F.analyzeBuddyFragmentation._6.if.else.1:
  mv s11, t6                                                            # ir inst 22 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 23 fin
  lw s11, 0(s10)                                                        # ir inst 24 fin
  li t2, 2
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 25 fin
  bnez s10, .F.analyzeBuddyFragmentation._7.if.then.2
  j .F.analyzeBuddyFragmentation._8.if.else.2                           # ir inst 26 fin
.F.analyzeBuddyFragmentation._7.if.then.2:
  addi s11, t4, 1                                                       # ir inst 27 fin
# Phi connections
  j .F.analyzeBuddyFragmentation._9.if.exit.2                           # ir inst 28 fin
.F.analyzeBuddyFragmentation._8.if.else.2:
# Phi connections
  mv s11, t4
  j .F.analyzeBuddyFragmentation._9.if.exit.2                           # ir inst 29 fin
.F.analyzeBuddyFragmentation._9.if.exit.2:
# Phi connections
  mv s10, t3
  j .F.analyzeBuddyFragmentation._10.if.exit.1                          # ir inst 31 fin
.F.analyzeBuddyFragmentation._10.if.exit.1:
# Phi connections
  j .F.analyzeBuddyFragmentation._11.if.exit.0                          # ir inst 34 fin
.F.analyzeBuddyFragmentation._11.if.exit.0:
  addi s9, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  mv t6, s9
  j .F.analyzeBuddyFragmentation._1.while.cond.0                        # ir inst 38 fin
.F.analyzeBuddyFragmentation._12.while.exit.0:
  li t2, 100
  mul t6, t4, t2                                                        # ir inst 39 fin
  add t5, t3, t4                                                        # ir inst 40 fin
  addi t4, t5, 1                                                        # ir inst 41 fin
  div t5, t6, t4                                                        # ir inst 42 fin
  mv a0, t5
  j .F.analyzeBuddyFragmentation.epilogue                               # ir inst 43 fin
.F.analyzeBuddyFragmentation.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.performGarbageCollectionTest
.F.performGarbageCollectionTest:
# spill func args num: 0,             range:     7040(sp) -     7040(sp)
# local var size: 7008,               range:       24(sp) -     7032(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -7040
  add sp, sp, t0
  sd ra, 16(sp)
.F.performGarbageCollectionTest._0.entry.0:
# Start call preparation
  li a0, 1820
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performGarbageCollectionTest._1.array.cond.0                     # ir inst 4 fin
.F.performGarbageCollectionTest._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performGarbageCollectionTest._2.array.body.0
  j .F.performGarbageCollectionTest._3.array.exit.0                     # ir inst 7 fin
.F.performGarbageCollectionTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performGarbageCollectionTest._1.array.cond.0                     # ir inst 11 fin
.F.performGarbageCollectionTest._3.array.exit.0:
  li t1, 4024
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performGarbageCollectionTest._4.array.cond.1                     # ir inst 14 fin
.F.performGarbageCollectionTest._4.array.cond.1:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performGarbageCollectionTest._5.array.body.1
  j .F.performGarbageCollectionTest._6.array.exit.1                     # ir inst 17 fin
.F.performGarbageCollectionTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performGarbageCollectionTest._4.array.cond.1                     # ir inst 21 fin
.F.performGarbageCollectionTest._6.array.exit.1:
  li t1, 6024
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performGarbageCollectionTest._7.array.cond.2                     # ir inst 24 fin
.F.performGarbageCollectionTest._7.array.cond.2:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performGarbageCollectionTest._8.array.body.2
  j .F.performGarbageCollectionTest._9.array.exit.2                     # ir inst 27 fin
.F.performGarbageCollectionTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performGarbageCollectionTest._7.array.cond.2                     # ir inst 31 fin
.F.performGarbageCollectionTest._9.array.exit.2:
  li t1, 6224
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.performGarbageCollectionTest._10.array.cond.3                    # ir inst 34 fin
.F.performGarbageCollectionTest._10.array.cond.3:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.performGarbageCollectionTest._11.array.body.3
  j .F.performGarbageCollectionTest._12.array.exit.3                    # ir inst 37 fin
.F.performGarbageCollectionTest._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.performGarbageCollectionTest._10.array.cond.3                    # ir inst 41 fin
.F.performGarbageCollectionTest._12.array.exit.3:
# alloca %24
  li t2, 7024
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 43 fin
# alloca %25
  li t2, 7028
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 45 fin
# Start call preparation
  li t1, 7028
  add t1, sp, t1
  mv a4, t1
  li t1, 7024
  add t1, sp, t1
  mv a3, t1
  li t1, 6024
  add t1, sp, t1
  mv a2, t1
  li t1, 4024
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeObjectGraph
# ir inst 46 fin
# Start call preparation
  li a0, 1821
  call printlnInt
# ir inst 47 fin
  li t1, 7028
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 48 fin
# Start call preparation
  sd t6, 0(sp)
  mv a4, t6
  li t1, 6224
  add t1, sp, t1
  mv a3, t1
  li t1, 6024
  add t1, sp, t1
  mv a2, t1
  li t1, 4024
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.performMarkPhase
  mv t5, a0
  ld t6, 0(sp)
# ir inst 49 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 50 fin
# Start call preparation
  li a0, 1822
  call printlnInt
# ir inst 51 fin
  li t1, 7024
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 52 fin
# Start call preparation
  sd t6, 0(sp)
  mv a2, t6
  li t1, 6224
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.performSweepPhase
  mv t5, a0
  ld t6, 0(sp)
# ir inst 53 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 54 fin
# Start call preparation
  li a0, 1823
  call printlnInt
# ir inst 55 fin
  li t1, 7024
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 56 fin
# Start call preparation
  sd t6, 0(sp)
  mv a2, t6
  li t1, 4024
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 24
  mv a0, t1
  call .F.performCompactionPhase
  mv t5, a0
  ld t6, 0(sp)
# ir inst 57 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 58 fin
# Start call preparation
  li a0, 1824
  call printlnInt
# ir inst 59 fin
  li t1, 7024
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 60 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 24
  mv a0, t1
  call .F.simulateReferenceCounting
  mv t5, a0
  ld t6, 0(sp)
# ir inst 61 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 62 fin
  j .F.performGarbageCollectionTest.epilogue                            # ir inst 63 fin
.F.performGarbageCollectionTest.epilogue:
  ld ra, 16(sp)
  li t0, 7040
  add sp, sp, t0
  ret

.globl .F.initializeObjectGraph
.F.initializeObjectGraph:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeObjectGraph._0.entry.0:
  li t1, 5
  sw t1, 0(a4)                                                          # ir inst 1 fin
  lw t6, 0(a4)                                                          # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.initializeObjectGraph._1.while.cond.0                            # ir inst 3 fin
.F.initializeObjectGraph._1.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 5 fin
  bnez t4, .F.initializeObjectGraph._2.while.body.0
  j .F.initializeObjectGraph._3.while.exit.0                            # ir inst 6 fin
.F.initializeObjectGraph._2.while.body.0:
  mv t4, t5                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 8 fin
  li t2, 20
  mul t4, t5, t2                                                        # ir inst 9 fin
  sw t4, 0(t3)                                                          # ir inst 10 fin
  mv t4, t5                                                             # ir inst 11 fin
  li t2, 20
  mul t3, t4, t2                                                        # ir inst 12 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 13 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 14 fin
  mv t4, t5                                                             # ir inst 15 fin
  li t2, 20
  mul t3, t4, t2                                                        # ir inst 16 fin
  addi t4, t3, 1                                                        # ir inst 17 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 18 fin
  li t1, 16
  sw t1, 0(t3)                                                          # ir inst 19 fin
  mv t4, t5                                                             # ir inst 20 fin
  li t2, 20
  mul t3, t4, t2                                                        # ir inst 21 fin
  addi t4, t3, 2                                                        # ir inst 22 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 24 fin
  addi t4, t5, 1                                                        # ir inst 25 fin
# Phi connections
  mv t5, t4
  j .F.initializeObjectGraph._1.while.cond.0                            # ir inst 26 fin
.F.initializeObjectGraph._3.while.exit.0:
  li t1, 30
  sw t1, 0(a3)                                                          # ir inst 27 fin
  lw t6, 0(a3)                                                          # ir inst 28 fin
# Phi connections
  li t5, 0
  j .F.initializeObjectGraph._4.while.cond.1                            # ir inst 29 fin
.F.initializeObjectGraph._4.while.cond.1:
  slt t4, t5, t6                                                        # ir inst 31 fin
  bnez t4, .F.initializeObjectGraph._5.while.body.1
  j .F.initializeObjectGraph._18.while.exit.1                           # ir inst 32 fin
.F.initializeObjectGraph._5.while.body.1:
  li t2, 20
  mul t4, t5, t2                                                        # ir inst 33 fin
  addi t3, t4, 10                                                       # ir inst 34 fin
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 35 fin
  bnez s11, .F.initializeObjectGraph._6.if.then.0
  j .F.initializeObjectGraph._16.if.else.0                              # ir inst 36 fin
.F.initializeObjectGraph._6.if.then.0:
  mv t3, t4                                                             # ir inst 37 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 38 fin
  li t2, 3
  rem t3, t5, t2                                                        # ir inst 39 fin
  addi s10, t3, 1                                                       # ir inst 40 fin
  sw s10, 0(s11)                                                        # ir inst 41 fin
  mv t3, t4                                                             # ir inst 42 fin
  addi s11, t3, 1                                                       # ir inst 43 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 44 fin
  li t2, 8
  rem s11, t5, t2                                                       # ir inst 45 fin
  addi s10, s11, 12                                                     # ir inst 46 fin
  sw s10, 0(t3)                                                         # ir inst 47 fin
  mv t3, t4                                                             # ir inst 48 fin
  addi s11, t3, 2                                                       # ir inst 49 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 50 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 51 fin
  addi t3, t5, 1                                                        # ir inst 52 fin
  slt s11, t3, t6                                                       # ir inst 53 fin
  bnez s11, .F.initializeObjectGraph._7.if.then.1
  j .F.initializeObjectGraph._8.if.else.1                               # ir inst 54 fin
.F.initializeObjectGraph._7.if.then.1:
  mv t3, t4                                                             # ir inst 55 fin
  addi s11, t3, 3                                                       # ir inst 56 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 57 fin
  addi s11, t5, 1                                                       # ir inst 58 fin
  li t2, 20
  mul s10, s11, t2                                                      # ir inst 59 fin
  sw s10, 0(t3)                                                         # ir inst 60 fin
  mv t3, t5                                                             # ir inst 61 fin
  slli s11, t3, 1                                                       # ir inst 62 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 63 fin
  addi s11, t4, 3                                                       # ir inst 64 fin
  sw s11, 0(t3)                                                         # ir inst 65 fin
  j .F.initializeObjectGraph._9.if.exit.1                               # ir inst 66 fin
.F.initializeObjectGraph._8.if.else.1:
  j .F.initializeObjectGraph._9.if.exit.1                               # ir inst 67 fin
.F.initializeObjectGraph._9.if.exit.1:
  addi t3, t5, 2                                                        # ir inst 68 fin
  slt s11, t3, t6                                                       # ir inst 69 fin
  bnez s11, .F.initializeObjectGraph._10.lazy.then.0
  j .F.initializeObjectGraph._11.lazy.else.0                            # ir inst 70 fin
.F.initializeObjectGraph._10.lazy.then.0:
  li t2, 3
  rem t3, t5, t2                                                        # ir inst 71 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 72 fin
# Phi connections
  mv t3, s11
  j .F.initializeObjectGraph._12.lazy.exit.0                            # ir inst 73 fin
.F.initializeObjectGraph._11.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.initializeObjectGraph._12.lazy.exit.0                            # ir inst 74 fin
.F.initializeObjectGraph._12.lazy.exit.0:
  bnez t3, .F.initializeObjectGraph._13.if.then.2
  j .F.initializeObjectGraph._14.if.else.2                              # ir inst 76 fin
.F.initializeObjectGraph._13.if.then.2:
  mv t3, t4                                                             # ir inst 77 fin
  addi s11, t3, 4                                                       # ir inst 78 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 79 fin
  addi s11, t5, 2                                                       # ir inst 80 fin
  li t2, 20
  mul s10, s11, t2                                                      # ir inst 81 fin
  sw s10, 0(t3)                                                         # ir inst 82 fin
  mv t3, t5                                                             # ir inst 83 fin
  slli s11, t3, 1                                                       # ir inst 84 fin
  addi t3, s11, 1                                                       # ir inst 85 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 86 fin
  addi t3, t4, 4                                                        # ir inst 87 fin
  sw t3, 0(s11)                                                         # ir inst 88 fin
  j .F.initializeObjectGraph._15.if.exit.2                              # ir inst 89 fin
.F.initializeObjectGraph._14.if.else.2:
  j .F.initializeObjectGraph._15.if.exit.2                              # ir inst 90 fin
.F.initializeObjectGraph._15.if.exit.2:
  j .F.initializeObjectGraph._17.if.exit.0                              # ir inst 91 fin
.F.initializeObjectGraph._16.if.else.0:
  j .F.initializeObjectGraph._17.if.exit.0                              # ir inst 92 fin
.F.initializeObjectGraph._17.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 93 fin
# Phi connections
  mv t5, t4
  j .F.initializeObjectGraph._4.while.cond.1                            # ir inst 94 fin
.F.initializeObjectGraph._18.while.exit.1:
  j .F.initializeObjectGraph.epilogue                                   # ir inst 95 fin
.F.initializeObjectGraph.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performMarkPhase
.F.performMarkPhase:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.performMarkPhase._0.entry.0:
# Phi connections
  li t6, 0
  j .F.performMarkPhase._1.while.cond.0                                 # ir inst 1 fin
.F.performMarkPhase._1.while.cond.0:
  li t2, 200
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.performMarkPhase._2.while.body.0
  j .F.performMarkPhase._3.while.exit.0                                 # ir inst 4 fin
.F.performMarkPhase._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
  addi t5, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.performMarkPhase._1.while.cond.0                                 # ir inst 9 fin
.F.performMarkPhase._3.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performMarkPhase._4.while.cond.1                                 # ir inst 10 fin
.F.performMarkPhase._4.while.cond.1:
  slt t4, t5, a4                                                        # ir inst 13 fin
  bnez t4, .F.performMarkPhase._5.while.body.1
  j .F.performMarkPhase._6.while.exit.1                                 # ir inst 14 fin
.F.performMarkPhase._5.while.body.1:
  mv t4, t5                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 16 fin
  lw t4, 0(t3)                                                          # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  li a4, 0
  mv a2, a3
  mv a3, t4
  call .F.markObject
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 18 fin
  add t4, t6, t3                                                        # ir inst 19 fin
  addi t3, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performMarkPhase._4.while.cond.1                                 # ir inst 21 fin
.F.performMarkPhase._6.while.exit.1:
  mv a0, t6
  j .F.performMarkPhase.epilogue                                        # ir inst 22 fin
.F.performMarkPhase.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.markObject
.F.markObject:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 0 / 12,        range:       64(sp) -       64(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 64(sp)
.F.markObject._0.entry.0:
  li t2, 10
  slt t6, t2, a4                                                        # ir inst 1 fin
  bnez t6, .F.markObject._1.lazy.then.0
  j .F.markObject._2.lazy.else.0                                        # ir inst 2 fin
.F.markObject._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.markObject._3.lazy.exit.0                                        # ir inst 3 fin
.F.markObject._2.lazy.else.0:
  li t2, 0
  slt t6, a3, t2                                                        # ir inst 4 fin
# Phi connections
  j .F.markObject._3.lazy.exit.0                                        # ir inst 5 fin
.F.markObject._3.lazy.exit.0:
  bnez t6, .F.markObject._4.lazy.then.1
  j .F.markObject._5.lazy.else.1                                        # ir inst 7 fin
.F.markObject._4.lazy.then.1:
# Phi connections
  li t6, 1
  j .F.markObject._6.lazy.exit.1                                        # ir inst 8 fin
.F.markObject._5.lazy.else.1:
  li t2, 1000
  slt t0, a3, t2
  xori t6, t0, 1                                                        # ir inst 9 fin
# Phi connections
  j .F.markObject._6.lazy.exit.1                                        # ir inst 10 fin
.F.markObject._6.lazy.exit.1:
  bnez t6, .F.markObject._7.if.then.0
  j .F.markObject._8.if.else.0                                          # ir inst 12 fin
.F.markObject._7.if.then.0:
  li a0, 0
  j .F.markObject.epilogue                                              # ir inst 13 fin
.F.markObject._8.if.else.0:
  j .F.markObject._9.if.exit.0                                          # ir inst 14 fin
.F.markObject._9.if.exit.0:
  li t2, 20
  div t6, a3, t2                                                        # ir inst 15 fin
  li t2, 200
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 16 fin
  bnez t5, .F.markObject._10.lazy.then.2
  j .F.markObject._11.lazy.else.2                                       # ir inst 17 fin
.F.markObject._10.lazy.then.2:
# Phi connections
  li t5, 1
  j .F.markObject._12.lazy.exit.2                                       # ir inst 18 fin
.F.markObject._11.lazy.else.2:
  mv t5, t6                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 20 fin
  lw t5, 0(t4)                                                          # ir inst 21 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 22 fin
# Phi connections
  mv t5, t4
  j .F.markObject._12.lazy.exit.2                                       # ir inst 23 fin
.F.markObject._12.lazy.exit.2:
  bnez t5, .F.markObject._13.if.then.1
  j .F.markObject._14.if.else.1                                         # ir inst 25 fin
.F.markObject._13.if.then.1:
  li a0, 0
  j .F.markObject.epilogue                                              # ir inst 26 fin
.F.markObject._14.if.else.1:
  j .F.markObject._15.if.exit.1                                         # ir inst 27 fin
.F.markObject._15.if.exit.1:
  mv t5, t6                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t6, a2, t2                                                        # ir inst 29 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 30 fin
  addi t6, a3, 5                                                        # ir inst 31 fin
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 32 fin
  bnez t5, .F.markObject._16.if.then.2
  j .F.markObject._29.if.else.2                                         # ir inst 33 fin
.F.markObject._16.if.then.2:
  mv t6, a3                                                             # ir inst 34 fin
  addi t5, t6, 3                                                        # ir inst 35 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 36 fin
  lw t5, 0(t6)                                                          # ir inst 37 fin
  mv t6, a3                                                             # ir inst 38 fin
  addi t4, t6, 4                                                        # ir inst 39 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 40 fin
  lw t4, 0(t6)                                                          # ir inst 41 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 42 fin
  bnez t6, .F.markObject._17.lazy.then.3
  j .F.markObject._18.lazy.else.3                                       # ir inst 43 fin
.F.markObject._17.lazy.then.3:
  li t2, 1000
  slt t6, t5, t2                                                        # ir inst 44 fin
# Phi connections
  j .F.markObject._19.lazy.exit.3                                       # ir inst 45 fin
.F.markObject._18.lazy.else.3:
# Phi connections
  li t6, 0
  j .F.markObject._19.lazy.exit.3                                       # ir inst 46 fin
.F.markObject._19.lazy.exit.3:
  bnez t6, .F.markObject._20.if.then.3
  j .F.markObject._21.if.else.3                                         # ir inst 48 fin
.F.markObject._20.if.then.3:
  addi t6, a4, 1                                                        # ir inst 49 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a4, t6
  mv a3, t5
  call .F.markObject
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 50 fin
  addi t6, t3, 1                                                        # ir inst 51 fin
# Phi connections
  j .F.markObject._22.if.exit.3                                         # ir inst 52 fin
.F.markObject._21.if.else.3:
# Phi connections
  li t6, 1
  j .F.markObject._22.if.exit.3                                         # ir inst 53 fin
.F.markObject._22.if.exit.3:
  li t2, 0
  slt t5, t2, t4                                                        # ir inst 55 fin
  bnez t5, .F.markObject._23.lazy.then.4
  j .F.markObject._24.lazy.else.4                                       # ir inst 56 fin
.F.markObject._23.lazy.then.4:
  li t2, 1000
  slt t5, t4, t2                                                        # ir inst 57 fin
# Phi connections
  j .F.markObject._25.lazy.exit.4                                       # ir inst 58 fin
.F.markObject._24.lazy.else.4:
# Phi connections
  li t5, 0
  j .F.markObject._25.lazy.exit.4                                       # ir inst 59 fin
.F.markObject._25.lazy.exit.4:
  bnez t5, .F.markObject._26.if.then.4
  j .F.markObject._27.if.else.4                                         # ir inst 61 fin
.F.markObject._26.if.then.4:
  addi t5, a4, 1                                                        # ir inst 62 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a4, t5
  mv a3, t4
  call .F.markObject
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 63 fin
  add t5, t6, t3                                                        # ir inst 64 fin
# Phi connections
  mv t6, t5
  j .F.markObject._28.if.exit.4                                         # ir inst 65 fin
.F.markObject._27.if.else.4:
# Phi connections
  j .F.markObject._28.if.exit.4                                         # ir inst 66 fin
.F.markObject._28.if.exit.4:
# Phi connections
  j .F.markObject._30.if.exit.2                                         # ir inst 68 fin
.F.markObject._29.if.else.2:
# Phi connections
  li t6, 1
  j .F.markObject._30.if.exit.2                                         # ir inst 69 fin
.F.markObject._30.if.exit.2:
  mv a0, t6
  j .F.markObject.epilogue                                              # ir inst 71 fin
.F.markObject.epilogue:
  ld ra, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.performSweepPhase
.F.performSweepPhase:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.performSweepPhase._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performSweepPhase._1.while.cond.0                                # ir inst 1 fin
.F.performSweepPhase._1.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 4 fin
  bnez t4, .F.performSweepPhase._2.while.body.0
  j .F.performSweepPhase._12.while.exit.0                               # ir inst 5 fin
.F.performSweepPhase._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.performSweepPhase._3.if.then.0
  j .F.performSweepPhase._10.if.else.0                                  # ir inst 10 fin
.F.performSweepPhase._3.if.then.0:
  li t2, 20
  mul t4, t6, t2                                                        # ir inst 11 fin
  addi t3, t4, 10                                                       # ir inst 12 fin
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 13 fin
  bnez s11, .F.performSweepPhase._4.if.then.1
  j .F.performSweepPhase._8.if.else.1                                   # ir inst 14 fin
.F.performSweepPhase._4.if.then.1:
# Phi connections
  li t3, 0
  j .F.performSweepPhase._5.while.cond.1                                # ir inst 15 fin
.F.performSweepPhase._5.while.cond.1:
  li t2, 20
  slt s11, t3, t2                                                       # ir inst 17 fin
  bnez s11, .F.performSweepPhase._6.while.body.1
  j .F.performSweepPhase._7.while.exit.1                                # ir inst 18 fin
.F.performSweepPhase._6.while.body.1:
  add s11, t4, t3                                                       # ir inst 19 fin
  mv s10, s11                                                           # ir inst 20 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 21 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 22 fin
  addi s11, t3, 1                                                       # ir inst 23 fin
# Phi connections
  mv t3, s11
  j .F.performSweepPhase._5.while.cond.1                                # ir inst 24 fin
.F.performSweepPhase._7.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 25 fin
# Phi connections
  j .F.performSweepPhase._9.if.exit.1                                   # ir inst 26 fin
.F.performSweepPhase._8.if.else.1:
# Phi connections
  mv t4, t5
  j .F.performSweepPhase._9.if.exit.1                                   # ir inst 27 fin
.F.performSweepPhase._9.if.exit.1:
# Phi connections
  j .F.performSweepPhase._11.if.exit.0                                  # ir inst 29 fin
.F.performSweepPhase._10.if.else.0:
# Phi connections
  mv t4, t5
  j .F.performSweepPhase._11.if.exit.0                                  # ir inst 30 fin
.F.performSweepPhase._11.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performSweepPhase._1.while.cond.0                                # ir inst 33 fin
.F.performSweepPhase._12.while.exit.0:
  mv a0, t5
  j .F.performSweepPhase.epilogue                                       # ir inst 34 fin
.F.performSweepPhase.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performCompactionPhase
.F.performCompactionPhase:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 4 / 12,        range:       56(sp) -       88(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s8, 56(sp)
  sd s9, 64(sp)
  sd s10, 72(sp)
  sd s11, 80(sp)
  sd ra, 88(sp)
.F.performCompactionPhase._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.performCompactionPhase._1.while.cond.0                           # ir inst 1 fin
.F.performCompactionPhase._1.while.cond.0:
  slt t3, t6, a2                                                        # ir inst 5 fin
  bnez t3, .F.performCompactionPhase._2.while.body.0
  j .F.performCompactionPhase._21.while.exit.0                          # ir inst 6 fin
.F.performCompactionPhase._2.while.body.0:
  li t2, 20
  mul t3, t6, t2                                                        # ir inst 7 fin
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 8 fin
  bnez s11, .F.performCompactionPhase._3.lazy.then.0
  j .F.performCompactionPhase._4.lazy.else.0                            # ir inst 9 fin
.F.performCompactionPhase._3.lazy.then.0:
  mv s11, t3                                                            # ir inst 10 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 11 fin
  lw s11, 0(s10)                                                        # ir inst 12 fin
  li t2, 0
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 13 fin
# Phi connections
  mv s11, s10
  j .F.performCompactionPhase._5.lazy.exit.0                            # ir inst 14 fin
.F.performCompactionPhase._4.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.performCompactionPhase._5.lazy.exit.0                            # ir inst 15 fin
.F.performCompactionPhase._5.lazy.exit.0:
  bnez s11, .F.performCompactionPhase._6.if.then.0
  j .F.performCompactionPhase._19.if.else.0                             # ir inst 17 fin
.F.performCompactionPhase._6.if.then.0:
  xor t0, t3, t5
  sltu s11, zero, t0                                                    # ir inst 18 fin
  bnez s11, .F.performCompactionPhase._7.if.then.1
  j .F.performCompactionPhase._17.if.else.1                             # ir inst 19 fin
.F.performCompactionPhase._7.if.then.1:
# Phi connections
  li s11, 0
  j .F.performCompactionPhase._8.while.cond.1                           # ir inst 20 fin
.F.performCompactionPhase._8.while.cond.1:
  li t2, 20
  slt s10, s11, t2                                                      # ir inst 22 fin
  bnez s10, .F.performCompactionPhase._9.lazy.then.1
  j .F.performCompactionPhase._10.lazy.else.1                           # ir inst 23 fin
.F.performCompactionPhase._9.lazy.then.1:
  add s10, t5, s11                                                      # ir inst 24 fin
  li t2, 1000
  slt s9, s10, t2                                                       # ir inst 25 fin
# Phi connections
  mv s10, s9
  j .F.performCompactionPhase._11.lazy.exit.1                           # ir inst 26 fin
.F.performCompactionPhase._10.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.performCompactionPhase._11.lazy.exit.1                           # ir inst 27 fin
.F.performCompactionPhase._11.lazy.exit.1:
  bnez s10, .F.performCompactionPhase._12.lazy.then.2
  j .F.performCompactionPhase._13.lazy.else.2                           # ir inst 29 fin
.F.performCompactionPhase._12.lazy.then.2:
  add s10, t3, s11                                                      # ir inst 30 fin
  li t2, 1000
  slt s9, s10, t2                                                       # ir inst 31 fin
# Phi connections
  mv s10, s9
  j .F.performCompactionPhase._14.lazy.exit.2                           # ir inst 32 fin
.F.performCompactionPhase._13.lazy.else.2:
# Phi connections
  li s10, 0
  j .F.performCompactionPhase._14.lazy.exit.2                           # ir inst 33 fin
.F.performCompactionPhase._14.lazy.exit.2:
  bnez s10, .F.performCompactionPhase._15.while.body.1
  j .F.performCompactionPhase._16.while.exit.1                          # ir inst 35 fin
.F.performCompactionPhase._15.while.body.1:
  add s10, t5, s11                                                      # ir inst 36 fin
  mv s9, s10                                                            # ir inst 37 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 38 fin
  add s9, t3, s11                                                       # ir inst 39 fin
  mv s8, s9                                                             # ir inst 40 fin
  slli t2, s8, 2
  add s9, a0, t2                                                        # ir inst 41 fin
  lw s8, 0(s9)                                                          # ir inst 42 fin
  sw s8, 0(s10)                                                         # ir inst 43 fin
  add s10, t3, s11                                                      # ir inst 44 fin
  mv s9, s10                                                            # ir inst 45 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 46 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 47 fin
  addi s10, s11, 1                                                      # ir inst 48 fin
# Phi connections
  mv s11, s10
  j .F.performCompactionPhase._8.while.cond.1                           # ir inst 49 fin
.F.performCompactionPhase._16.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a4, 500
  mv a3, t5
  mv a2, t3
  call .F.updateReferencesAfterCompaction
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 50 fin
  j .F.performCompactionPhase._18.if.exit.1                             # ir inst 51 fin
.F.performCompactionPhase._17.if.else.1:
  j .F.performCompactionPhase._18.if.exit.1                             # ir inst 52 fin
.F.performCompactionPhase._18.if.exit.1:
  addi t3, t5, 20                                                       # ir inst 53 fin
  addi s11, t4, 1                                                       # ir inst 54 fin
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.performCompactionPhase._20.if.exit.0                             # ir inst 55 fin
.F.performCompactionPhase._19.if.else.0:
# Phi connections
  mv t3, t4
  j .F.performCompactionPhase._20.if.exit.0                             # ir inst 56 fin
.F.performCompactionPhase._20.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 59 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.performCompactionPhase._1.while.cond.0                           # ir inst 60 fin
.F.performCompactionPhase._21.while.exit.0:
  mv a0, t4
  j .F.performCompactionPhase.epilogue                                  # ir inst 61 fin
.F.performCompactionPhase.epilogue:
  ld ra, 88(sp)
  ld s8, 56(sp)
  ld s9, 64(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.updateReferencesAfterCompaction
.F.updateReferencesAfterCompaction:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.updateReferencesAfterCompaction._0.entry.0:
# Phi connections
  li t6, 0
  j .F.updateReferencesAfterCompaction._1.while.cond.0                  # ir inst 1 fin
.F.updateReferencesAfterCompaction._1.while.cond.0:
  slt t5, t6, a4                                                        # ir inst 3 fin
  bnez t5, .F.updateReferencesAfterCompaction._2.while.body.0
  j .F.updateReferencesAfterCompaction._12.while.exit.0                 # ir inst 4 fin
.F.updateReferencesAfterCompaction._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  lw t5, 0(t4)                                                          # ir inst 7 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 8 fin
  bnez t4, .F.updateReferencesAfterCompaction._3.lazy.then.0
  j .F.updateReferencesAfterCompaction._4.lazy.else.0                   # ir inst 9 fin
.F.updateReferencesAfterCompaction._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  lw t5, 0(t4)                                                          # ir inst 12 fin
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j .F.updateReferencesAfterCompaction._5.lazy.exit.0                   # ir inst 14 fin
.F.updateReferencesAfterCompaction._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.updateReferencesAfterCompaction._5.lazy.exit.0                   # ir inst 15 fin
.F.updateReferencesAfterCompaction._5.lazy.exit.0:
  bnez t5, .F.updateReferencesAfterCompaction._6.if.then.0
  j .F.updateReferencesAfterCompaction._10.if.else.0                    # ir inst 17 fin
.F.updateReferencesAfterCompaction._6.if.then.0:
  mv t5, t6                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 19 fin
  lw t5, 0(t4)                                                          # ir inst 20 fin
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  xor t0, t4, a2
  sltiu t3, t0, 1                                                       # ir inst 24 fin
  bnez t3, .F.updateReferencesAfterCompaction._7.if.then.1
  j .F.updateReferencesAfterCompaction._8.if.else.1                     # ir inst 25 fin
.F.updateReferencesAfterCompaction._7.if.then.1:
  mv t4, t5                                                             # ir inst 26 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 27 fin
  sw a3, 0(t5)                                                          # ir inst 28 fin
  j .F.updateReferencesAfterCompaction._9.if.exit.1                     # ir inst 29 fin
.F.updateReferencesAfterCompaction._8.if.else.1:
  j .F.updateReferencesAfterCompaction._9.if.exit.1                     # ir inst 30 fin
.F.updateReferencesAfterCompaction._9.if.exit.1:
  j .F.updateReferencesAfterCompaction._11.if.exit.0                    # ir inst 31 fin
.F.updateReferencesAfterCompaction._10.if.else.0:
  j .F.updateReferencesAfterCompaction._11.if.exit.0                    # ir inst 32 fin
.F.updateReferencesAfterCompaction._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 33 fin
# Phi connections
  mv t6, t5
  j .F.updateReferencesAfterCompaction._1.while.cond.0                  # ir inst 34 fin
.F.updateReferencesAfterCompaction._12.while.exit.0:
  j .F.updateReferencesAfterCompaction.epilogue                         # ir inst 35 fin
.F.updateReferencesAfterCompaction.epilogue:
  ret

.globl .F.simulateReferenceCounting
.F.simulateReferenceCounting:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.simulateReferenceCounting._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F.calculateReferenceCounts
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulateReferenceCounting._1.while.cond.0                        # ir inst 2 fin
.F.simulateReferenceCounting._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 5 fin
  bnez t4, .F.simulateReferenceCounting._2.while.body.0
  j .F.simulateReferenceCounting._15.while.exit.0                       # ir inst 6 fin
.F.simulateReferenceCounting._2.while.body.0:
  li t2, 20
  mul t4, t6, t2                                                        # ir inst 7 fin
  addi t3, t4, 5                                                        # ir inst 8 fin
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 9 fin
  bnez s11, .F.simulateReferenceCounting._3.lazy.then.0
  j .F.simulateReferenceCounting._4.lazy.else.0                         # ir inst 10 fin
.F.simulateReferenceCounting._3.lazy.then.0:
  mv t3, t4                                                             # ir inst 11 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 14 fin
# Phi connections
  mv t3, s11
  j .F.simulateReferenceCounting._5.lazy.exit.0                         # ir inst 15 fin
.F.simulateReferenceCounting._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.simulateReferenceCounting._5.lazy.exit.0                         # ir inst 16 fin
.F.simulateReferenceCounting._5.lazy.exit.0:
  bnez t3, .F.simulateReferenceCounting._6.if.then.0
  j .F.simulateReferenceCounting._13.if.else.0                          # ir inst 18 fin
.F.simulateReferenceCounting._6.if.then.0:
  mv t3, t4                                                             # ir inst 19 fin
  addi s11, t3, 2                                                       # ir inst 20 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 21 fin
  lw s11, 0(t3)                                                         # ir inst 22 fin
  li t2, 0
  slt t3, t2, s11                                                       # ir inst 23 fin
  bnez t3, .F.simulateReferenceCounting._7.if.then.1
  j .F.simulateReferenceCounting._11.if.else.1                          # ir inst 24 fin
.F.simulateReferenceCounting._7.if.then.1:
  mv t3, t4                                                             # ir inst 25 fin
  addi s11, t3, 2                                                       # ir inst 26 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 27 fin
  mv s11, t4                                                            # ir inst 28 fin
  addi s10, s11, 2                                                      # ir inst 29 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  lw s10, 0(s11)                                                        # ir inst 31 fin
  addi s11, s10, -1                                                     # ir inst 32 fin
  sw s11, 0(t3)                                                         # ir inst 33 fin
  mv t3, t4                                                             # ir inst 34 fin
  addi s11, t3, 2                                                       # ir inst 35 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 36 fin
  lw s11, 0(t3)                                                         # ir inst 37 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 38 fin
  bnez t3, .F.simulateReferenceCounting._8.if.then.2
  j .F.simulateReferenceCounting._9.if.else.2                           # ir inst 39 fin
.F.simulateReferenceCounting._8.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  call .F.decrementReferencedObjects
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 40 fin
  addi t4, t5, 1                                                        # ir inst 41 fin
# Phi connections
  j .F.simulateReferenceCounting._10.if.exit.2                          # ir inst 42 fin
.F.simulateReferenceCounting._9.if.else.2:
# Phi connections
  mv t4, t5
  j .F.simulateReferenceCounting._10.if.exit.2                          # ir inst 43 fin
.F.simulateReferenceCounting._10.if.exit.2:
# Phi connections
  j .F.simulateReferenceCounting._12.if.exit.1                          # ir inst 45 fin
.F.simulateReferenceCounting._11.if.else.1:
# Phi connections
  mv t4, t5
  j .F.simulateReferenceCounting._12.if.exit.1                          # ir inst 46 fin
.F.simulateReferenceCounting._12.if.exit.1:
# Phi connections
  j .F.simulateReferenceCounting._14.if.exit.0                          # ir inst 48 fin
.F.simulateReferenceCounting._13.if.else.0:
# Phi connections
  mv t4, t5
  j .F.simulateReferenceCounting._14.if.exit.0                          # ir inst 49 fin
.F.simulateReferenceCounting._14.if.exit.0:
  addi t3, t6, 2                                                        # ir inst 51 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.simulateReferenceCounting._1.while.cond.0                        # ir inst 52 fin
.F.simulateReferenceCounting._15.while.exit.0:
  mv a0, t5
  j .F.simulateReferenceCounting.epilogue                               # ir inst 53 fin
.F.simulateReferenceCounting.epilogue:
  ld ra, 56(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.calculateReferenceCounts
.F.calculateReferenceCounts:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.calculateReferenceCounts._0.entry.0:
# Phi connections
  li t6, 0
  j .F.calculateReferenceCounts._1.while.cond.0                         # ir inst 1 fin
.F.calculateReferenceCounts._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.calculateReferenceCounts._2.while.body.0
  j .F.calculateReferenceCounts._6.while.exit.0                         # ir inst 4 fin
.F.calculateReferenceCounts._2.while.body.0:
  li t2, 20
  mul t5, t6, t2                                                        # ir inst 5 fin
  addi t4, t5, 2                                                        # ir inst 6 fin
  li t2, 1000
  slt t3, t4, t2                                                        # ir inst 7 fin
  bnez t3, .F.calculateReferenceCounts._3.if.then.0
  j .F.calculateReferenceCounts._4.if.else.0                            # ir inst 8 fin
.F.calculateReferenceCounts._3.if.then.0:
  mv t4, t5                                                             # ir inst 9 fin
  addi t5, t4, 2                                                        # ir inst 10 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 12 fin
  j .F.calculateReferenceCounts._5.if.exit.0                            # ir inst 13 fin
.F.calculateReferenceCounts._4.if.else.0:
  j .F.calculateReferenceCounts._5.if.exit.0                            # ir inst 14 fin
.F.calculateReferenceCounts._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F.calculateReferenceCounts._1.while.cond.0                         # ir inst 16 fin
.F.calculateReferenceCounts._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.calculateReferenceCounts._7.while.cond.1                         # ir inst 17 fin
.F.calculateReferenceCounts._7.while.cond.1:
  slt t5, t6, a1                                                        # ir inst 19 fin
  bnez t5, .F.calculateReferenceCounts._8.while.body.1
  j .F.calculateReferenceCounts._33.while.exit.1                        # ir inst 20 fin
.F.calculateReferenceCounts._8.while.body.1:
  li t2, 20
  mul t5, t6, t2                                                        # ir inst 21 fin
  addi t4, t5, 5                                                        # ir inst 22 fin
  li t2, 1000
  slt t3, t4, t2                                                        # ir inst 23 fin
  bnez t3, .F.calculateReferenceCounts._9.lazy.then.0
  j .F.calculateReferenceCounts._10.lazy.else.0                         # ir inst 24 fin
.F.calculateReferenceCounts._9.lazy.then.0:
  mv t4, t5                                                             # ir inst 25 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 26 fin
  lw t4, 0(t3)                                                          # ir inst 27 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 28 fin
# Phi connections
  mv t4, t3
  j .F.calculateReferenceCounts._11.lazy.exit.0                         # ir inst 29 fin
.F.calculateReferenceCounts._10.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.calculateReferenceCounts._11.lazy.exit.0                         # ir inst 30 fin
.F.calculateReferenceCounts._11.lazy.exit.0:
  bnez t4, .F.calculateReferenceCounts._12.if.then.1
  j .F.calculateReferenceCounts._31.if.else.1                           # ir inst 32 fin
.F.calculateReferenceCounts._12.if.then.1:
  mv t4, t5                                                             # ir inst 33 fin
  addi t3, t4, 3                                                        # ir inst 34 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 35 fin
  lw t3, 0(t4)                                                          # ir inst 36 fin
  mv t4, t5                                                             # ir inst 37 fin
  addi t5, t4, 4                                                        # ir inst 38 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 39 fin
  lw t5, 0(t4)                                                          # ir inst 40 fin
  li t2, 0
  slt t4, t2, t3                                                        # ir inst 41 fin
  bnez t4, .F.calculateReferenceCounts._13.lazy.then.1
  j .F.calculateReferenceCounts._14.lazy.else.1                         # ir inst 42 fin
.F.calculateReferenceCounts._13.lazy.then.1:
  li t2, 1000
  slt t4, t3, t2                                                        # ir inst 43 fin
# Phi connections
  j .F.calculateReferenceCounts._15.lazy.exit.1                         # ir inst 44 fin
.F.calculateReferenceCounts._14.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.calculateReferenceCounts._15.lazy.exit.1                         # ir inst 45 fin
.F.calculateReferenceCounts._15.lazy.exit.1:
  bnez t4, .F.calculateReferenceCounts._16.lazy.then.2
  j .F.calculateReferenceCounts._17.lazy.else.2                         # ir inst 47 fin
.F.calculateReferenceCounts._16.lazy.then.2:
  addi t4, t3, 2                                                        # ir inst 48 fin
  li t2, 1000
  slt s11, t4, t2                                                       # ir inst 49 fin
# Phi connections
  mv t4, s11
  j .F.calculateReferenceCounts._18.lazy.exit.2                         # ir inst 50 fin
.F.calculateReferenceCounts._17.lazy.else.2:
# Phi connections
  li t4, 0
  j .F.calculateReferenceCounts._18.lazy.exit.2                         # ir inst 51 fin
.F.calculateReferenceCounts._18.lazy.exit.2:
  bnez t4, .F.calculateReferenceCounts._19.if.then.2
  j .F.calculateReferenceCounts._20.if.else.2                           # ir inst 53 fin
.F.calculateReferenceCounts._19.if.then.2:
  mv t4, t3                                                             # ir inst 54 fin
  addi s11, t4, 2                                                       # ir inst 55 fin
  slli t2, s11, 2
  add t4, a0, t2                                                        # ir inst 56 fin
  mv s11, t3                                                            # ir inst 57 fin
  addi t3, s11, 2                                                       # ir inst 58 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 59 fin
  lw t3, 0(s11)                                                         # ir inst 60 fin
  addi s11, t3, 1                                                       # ir inst 61 fin
  sw s11, 0(t4)                                                         # ir inst 62 fin
  j .F.calculateReferenceCounts._21.if.exit.2                           # ir inst 63 fin
.F.calculateReferenceCounts._20.if.else.2:
  j .F.calculateReferenceCounts._21.if.exit.2                           # ir inst 64 fin
.F.calculateReferenceCounts._21.if.exit.2:
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 65 fin
  bnez t4, .F.calculateReferenceCounts._22.lazy.then.3
  j .F.calculateReferenceCounts._23.lazy.else.3                         # ir inst 66 fin
.F.calculateReferenceCounts._22.lazy.then.3:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 67 fin
# Phi connections
  j .F.calculateReferenceCounts._24.lazy.exit.3                         # ir inst 68 fin
.F.calculateReferenceCounts._23.lazy.else.3:
# Phi connections
  li t4, 0
  j .F.calculateReferenceCounts._24.lazy.exit.3                         # ir inst 69 fin
.F.calculateReferenceCounts._24.lazy.exit.3:
  bnez t4, .F.calculateReferenceCounts._25.lazy.then.4
  j .F.calculateReferenceCounts._26.lazy.else.4                         # ir inst 71 fin
.F.calculateReferenceCounts._25.lazy.then.4:
  addi t4, t5, 2                                                        # ir inst 72 fin
  li t2, 1000
  slt t3, t4, t2                                                        # ir inst 73 fin
# Phi connections
  mv t4, t3
  j .F.calculateReferenceCounts._27.lazy.exit.4                         # ir inst 74 fin
.F.calculateReferenceCounts._26.lazy.else.4:
# Phi connections
  li t4, 0
  j .F.calculateReferenceCounts._27.lazy.exit.4                         # ir inst 75 fin
.F.calculateReferenceCounts._27.lazy.exit.4:
  bnez t4, .F.calculateReferenceCounts._28.if.then.3
  j .F.calculateReferenceCounts._29.if.else.3                           # ir inst 77 fin
.F.calculateReferenceCounts._28.if.then.3:
  mv t4, t5                                                             # ir inst 78 fin
  addi t3, t4, 2                                                        # ir inst 79 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 80 fin
  mv t3, t5                                                             # ir inst 81 fin
  addi t5, t3, 2                                                        # ir inst 82 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 83 fin
  lw t5, 0(t3)                                                          # ir inst 84 fin
  addi t3, t5, 1                                                        # ir inst 85 fin
  sw t3, 0(t4)                                                          # ir inst 86 fin
  j .F.calculateReferenceCounts._30.if.exit.3                           # ir inst 87 fin
.F.calculateReferenceCounts._29.if.else.3:
  j .F.calculateReferenceCounts._30.if.exit.3                           # ir inst 88 fin
.F.calculateReferenceCounts._30.if.exit.3:
  j .F.calculateReferenceCounts._32.if.exit.1                           # ir inst 89 fin
.F.calculateReferenceCounts._31.if.else.1:
  j .F.calculateReferenceCounts._32.if.exit.1                           # ir inst 90 fin
.F.calculateReferenceCounts._32.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 91 fin
# Phi connections
  mv t6, t5
  j .F.calculateReferenceCounts._7.while.cond.1                         # ir inst 92 fin
.F.calculateReferenceCounts._33.while.exit.1:
  j .F.calculateReferenceCounts.epilogue                                # ir inst 93 fin
.F.calculateReferenceCounts.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.decrementReferencedObjects
.F.decrementReferencedObjects:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.decrementReferencedObjects._0.entry.0:
  addi t6, a1, 5                                                        # ir inst 1 fin
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 2 fin
  bnez t5, .F.decrementReferencedObjects._1.if.then.0
  j .F.decrementReferencedObjects._20.if.else.0                         # ir inst 3 fin
.F.decrementReferencedObjects._1.if.then.0:
  mv t6, a1                                                             # ir inst 4 fin
  addi t5, t6, 3                                                        # ir inst 5 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  mv t6, a1                                                             # ir inst 8 fin
  addi t4, t6, 4                                                        # ir inst 9 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 10 fin
  lw t4, 0(t6)                                                          # ir inst 11 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 12 fin
  bnez t6, .F.decrementReferencedObjects._2.lazy.then.0
  j .F.decrementReferencedObjects._3.lazy.else.0                        # ir inst 13 fin
.F.decrementReferencedObjects._2.lazy.then.0:
  addi t6, t5, 2                                                        # ir inst 14 fin
  li t2, 1000
  slt t3, t6, t2                                                        # ir inst 15 fin
# Phi connections
  mv t6, t3
  j .F.decrementReferencedObjects._4.lazy.exit.0                        # ir inst 16 fin
.F.decrementReferencedObjects._3.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.decrementReferencedObjects._4.lazy.exit.0                        # ir inst 17 fin
.F.decrementReferencedObjects._4.lazy.exit.0:
  bnez t6, .F.decrementReferencedObjects._5.lazy.then.1
  j .F.decrementReferencedObjects._6.lazy.else.1                        # ir inst 19 fin
.F.decrementReferencedObjects._5.lazy.then.1:
  mv t6, t5                                                             # ir inst 20 fin
  addi t3, t6, 2                                                        # ir inst 21 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 22 fin
  lw t3, 0(t6)                                                          # ir inst 23 fin
  li t2, 0
  slt t6, t2, t3                                                        # ir inst 24 fin
# Phi connections
  j .F.decrementReferencedObjects._7.lazy.exit.1                        # ir inst 25 fin
.F.decrementReferencedObjects._6.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.decrementReferencedObjects._7.lazy.exit.1                        # ir inst 26 fin
.F.decrementReferencedObjects._7.lazy.exit.1:
  bnez t6, .F.decrementReferencedObjects._8.if.then.1
  j .F.decrementReferencedObjects._9.if.else.1                          # ir inst 28 fin
.F.decrementReferencedObjects._8.if.then.1:
  mv t6, t5                                                             # ir inst 29 fin
  addi t3, t6, 2                                                        # ir inst 30 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 31 fin
  mv t3, t5                                                             # ir inst 32 fin
  addi t5, t3, 2                                                        # ir inst 33 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 34 fin
  lw t5, 0(t3)                                                          # ir inst 35 fin
  addi t3, t5, -1                                                       # ir inst 36 fin
  sw t3, 0(t6)                                                          # ir inst 37 fin
  j .F.decrementReferencedObjects._10.if.exit.1                         # ir inst 38 fin
.F.decrementReferencedObjects._9.if.else.1:
  j .F.decrementReferencedObjects._10.if.exit.1                         # ir inst 39 fin
.F.decrementReferencedObjects._10.if.exit.1:
  li t2, 0
  slt t6, t2, t4                                                        # ir inst 40 fin
  bnez t6, .F.decrementReferencedObjects._11.lazy.then.2
  j .F.decrementReferencedObjects._12.lazy.else.2                       # ir inst 41 fin
.F.decrementReferencedObjects._11.lazy.then.2:
  addi t6, t4, 2                                                        # ir inst 42 fin
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 43 fin
# Phi connections
  mv t6, t5
  j .F.decrementReferencedObjects._13.lazy.exit.2                       # ir inst 44 fin
.F.decrementReferencedObjects._12.lazy.else.2:
# Phi connections
  li t6, 0
  j .F.decrementReferencedObjects._13.lazy.exit.2                       # ir inst 45 fin
.F.decrementReferencedObjects._13.lazy.exit.2:
  bnez t6, .F.decrementReferencedObjects._14.lazy.then.3
  j .F.decrementReferencedObjects._15.lazy.else.3                       # ir inst 47 fin
.F.decrementReferencedObjects._14.lazy.then.3:
  mv t6, t4                                                             # ir inst 48 fin
  addi t5, t6, 2                                                        # ir inst 49 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 50 fin
  lw t5, 0(t6)                                                          # ir inst 51 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 52 fin
# Phi connections
  j .F.decrementReferencedObjects._16.lazy.exit.3                       # ir inst 53 fin
.F.decrementReferencedObjects._15.lazy.else.3:
# Phi connections
  li t6, 0
  j .F.decrementReferencedObjects._16.lazy.exit.3                       # ir inst 54 fin
.F.decrementReferencedObjects._16.lazy.exit.3:
  bnez t6, .F.decrementReferencedObjects._17.if.then.2
  j .F.decrementReferencedObjects._18.if.else.2                         # ir inst 56 fin
.F.decrementReferencedObjects._17.if.then.2:
  mv t6, t4                                                             # ir inst 57 fin
  addi t5, t6, 2                                                        # ir inst 58 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 59 fin
  mv t5, t4                                                             # ir inst 60 fin
  addi t4, t5, 2                                                        # ir inst 61 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 62 fin
  lw t4, 0(t5)                                                          # ir inst 63 fin
  addi t5, t4, -1                                                       # ir inst 64 fin
  sw t5, 0(t6)                                                          # ir inst 65 fin
  j .F.decrementReferencedObjects._19.if.exit.2                         # ir inst 66 fin
.F.decrementReferencedObjects._18.if.else.2:
  j .F.decrementReferencedObjects._19.if.exit.2                         # ir inst 67 fin
.F.decrementReferencedObjects._19.if.exit.2:
  j .F.decrementReferencedObjects._21.if.exit.0                         # ir inst 68 fin
.F.decrementReferencedObjects._20.if.else.0:
  j .F.decrementReferencedObjects._21.if.exit.0                         # ir inst 69 fin
.F.decrementReferencedObjects._21.if.exit.0:
  j .F.decrementReferencedObjects.epilogue                              # ir inst 70 fin
.F.decrementReferencedObjects.epilogue:
  ret

.globl .F.performFragmentationTest
.F.performFragmentationTest:
# spill func args num: 0,             range:     5632(sp) -     5632(sp)
# local var size: 5608,               range:       16(sp) -     5624(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5632
  add sp, sp, t0
  sd ra, 8(sp)
.F.performFragmentationTest._0.entry.0:
# Start call preparation
  li a0, 1830
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performFragmentationTest._1.array.cond.0                         # ir inst 4 fin
.F.performFragmentationTest._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performFragmentationTest._2.array.body.0
  j .F.performFragmentationTest._3.array.exit.0                         # ir inst 7 fin
.F.performFragmentationTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performFragmentationTest._1.array.cond.0                         # ir inst 11 fin
.F.performFragmentationTest._3.array.exit.0:
  li t1, 4016
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performFragmentationTest._4.array.cond.1                         # ir inst 14 fin
.F.performFragmentationTest._4.array.cond.1:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performFragmentationTest._5.array.body.1
  j .F.performFragmentationTest._6.array.exit.1                         # ir inst 17 fin
.F.performFragmentationTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performFragmentationTest._4.array.cond.1                         # ir inst 21 fin
.F.performFragmentationTest._6.array.exit.1:
  li t1, 4816
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performFragmentationTest._7.array.cond.2                         # ir inst 24 fin
.F.performFragmentationTest._7.array.cond.2:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performFragmentationTest._8.array.body.2
  j .F.performFragmentationTest._9.array.exit.2                         # ir inst 27 fin
.F.performFragmentationTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performFragmentationTest._7.array.cond.2                         # ir inst 31 fin
.F.performFragmentationTest._9.array.exit.2:
# alloca %18
  li t2, 5616
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 33 fin
# alloca %19
  li t2, 5620
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 35 fin
# Start call preparation
  li a0, 1831
  call printlnInt
# ir inst 36 fin
# Start call preparation
  li t1, 5620
  add t1, sp, t1
  mv a4, t1
  li t1, 5616
  add t1, sp, t1
  mv a3, t1
  li t1, 4816
  add t1, sp, t1
  mv a2, t1
  li t1, 4016
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.createFragmentationPattern
# ir inst 37 fin
# Start call preparation
  li a0, 1832
  call printlnInt
# ir inst 38 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.measureFragmentation
  mv t6, a0
# ir inst 39 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 40 fin
# Start call preparation
  li a0, 1833
  call printlnInt
# ir inst 41 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.attemptFragmentedAllocations
  mv t6, a0
# ir inst 42 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 43 fin
# Start call preparation
  li a0, 1834
  call printlnInt
# ir inst 44 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.performMemoryCompaction
  mv t6, a0
# ir inst 45 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 46 fin
# Start call preparation
  li a0, 1835
  call printlnInt
# ir inst 47 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.measureFragmentation
  mv t6, a0
# ir inst 48 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 49 fin
  j .F.performFragmentationTest.epilogue                                # ir inst 50 fin
.F.performFragmentationTest.epilogue:
  ld ra, 8(sp)
  li t0, 5632
  add sp, sp, t0
  ret

.globl .F.createFragmentationPattern
.F.createFragmentationPattern:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.createFragmentationPattern._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.createFragmentationPattern._1.while.cond.0                       # ir inst 1 fin
.F.createFragmentationPattern._1.while.cond.0:
  li t2, 950
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.createFragmentationPattern._2.while.body.0
  j .F.createFragmentationPattern._18.while.exit.0                      # ir inst 5 fin
.F.createFragmentationPattern._2.while.body.0:
  li t2, 4
  rem t4, t5, t2                                                        # ir inst 6 fin
  addi t3, t4, 1                                                        # ir inst 7 fin
  slli t4, t3, 3                                                        # ir inst 8 fin
  li t2, 3
  rem t3, t5, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.createFragmentationPattern._3.if.then.0
  j .F.createFragmentationPattern._13.if.else.0                         # ir inst 11 fin
.F.createFragmentationPattern._3.if.then.0:
# Phi connections
  li t3, 0
  j .F.createFragmentationPattern._4.while.cond.1                       # ir inst 12 fin
.F.createFragmentationPattern._4.while.cond.1:
  slt s11, t3, t4                                                       # ir inst 14 fin
  bnez s11, .F.createFragmentationPattern._5.lazy.then.0
  j .F.createFragmentationPattern._6.lazy.else.0                        # ir inst 15 fin
.F.createFragmentationPattern._5.lazy.then.0:
  add s11, t6, t3                                                       # ir inst 16 fin
  li t2, 1000
  slt s10, s11, t2                                                      # ir inst 17 fin
# Phi connections
  mv s11, s10
  j .F.createFragmentationPattern._7.lazy.exit.0                        # ir inst 18 fin
.F.createFragmentationPattern._6.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.createFragmentationPattern._7.lazy.exit.0                        # ir inst 19 fin
.F.createFragmentationPattern._7.lazy.exit.0:
  bnez s11, .F.createFragmentationPattern._8.while.body.1
  j .F.createFragmentationPattern._9.while.exit.1                       # ir inst 21 fin
.F.createFragmentationPattern._8.while.body.1:
  add s11, t6, t3                                                       # ir inst 22 fin
  mv s10, s11                                                           # ir inst 23 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 24 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 25 fin
  addi s11, t3, 1                                                       # ir inst 26 fin
# Phi connections
  mv t3, s11
  j .F.createFragmentationPattern._4.while.cond.1                       # ir inst 27 fin
.F.createFragmentationPattern._9.while.exit.1:
  lw t3, 0(a4)                                                          # ir inst 28 fin
  li t2, 200
  slt s11, t3, t2                                                       # ir inst 29 fin
  bnez s11, .F.createFragmentationPattern._10.if.then.1
  j .F.createFragmentationPattern._11.if.else.1                         # ir inst 30 fin
.F.createFragmentationPattern._10.if.then.1:
  lw t3, 0(a4)                                                          # ir inst 31 fin
  mv s11, t3                                                            # ir inst 32 fin
  slli t2, s11, 2
  add t3, a2, t2                                                        # ir inst 33 fin
  sw t6, 0(t3)                                                          # ir inst 34 fin
  lw t3, 0(a4)                                                          # ir inst 35 fin
  addi s11, t3, 1                                                       # ir inst 36 fin
  sw s11, 0(a4)                                                         # ir inst 37 fin
  j .F.createFragmentationPattern._12.if.exit.1                         # ir inst 38 fin
.F.createFragmentationPattern._11.if.else.1:
  j .F.createFragmentationPattern._12.if.exit.1                         # ir inst 39 fin
.F.createFragmentationPattern._12.if.exit.1:
  j .F.createFragmentationPattern._17.if.exit.0                         # ir inst 40 fin
.F.createFragmentationPattern._13.if.else.0:
  lw t3, 0(a3)                                                          # ir inst 41 fin
  li t2, 200
  slt s11, t3, t2                                                       # ir inst 42 fin
  bnez s11, .F.createFragmentationPattern._14.if.then.2
  j .F.createFragmentationPattern._15.if.else.2                         # ir inst 43 fin
.F.createFragmentationPattern._14.if.then.2:
  lw t3, 0(a3)                                                          # ir inst 44 fin
  mv s11, t3                                                            # ir inst 45 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 46 fin
  sw t6, 0(t3)                                                          # ir inst 47 fin
  lw t3, 0(a3)                                                          # ir inst 48 fin
  addi s11, t3, 1                                                       # ir inst 49 fin
  sw s11, 0(a3)                                                         # ir inst 50 fin
  j .F.createFragmentationPattern._16.if.exit.2                         # ir inst 51 fin
.F.createFragmentationPattern._15.if.else.2:
  j .F.createFragmentationPattern._16.if.exit.2                         # ir inst 52 fin
.F.createFragmentationPattern._16.if.exit.2:
  j .F.createFragmentationPattern._17.if.exit.0                         # ir inst 53 fin
.F.createFragmentationPattern._17.if.exit.0:
  add t3, t6, t4                                                        # ir inst 54 fin
  addi t6, t5, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t6
  mv t6, t3
  j .F.createFragmentationPattern._1.while.cond.0                       # ir inst 56 fin
.F.createFragmentationPattern._18.while.exit.0:
# Phi connections
  li t6, 0
  j .F.createFragmentationPattern._19.while.cond.2                      # ir inst 57 fin
.F.createFragmentationPattern._19.while.cond.2:
  lw t5, 0(a4)                                                          # ir inst 59 fin
  slt t4, t6, t5                                                        # ir inst 60 fin
  bnez t4, .F.createFragmentationPattern._20.while.body.2
  j .F.createFragmentationPattern._30.while.exit.2                      # ir inst 61 fin
.F.createFragmentationPattern._20.while.body.2:
  li t2, 3
  rem t5, t6, t2                                                        # ir inst 62 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 63 fin
  bnez t4, .F.createFragmentationPattern._21.if.then.3
  j .F.createFragmentationPattern._28.if.else.3                         # ir inst 64 fin
.F.createFragmentationPattern._21.if.then.3:
  mv t5, t6                                                             # ir inst 65 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 66 fin
  lw t5, 0(t4)                                                          # ir inst 67 fin
# Phi connections
  li t4, 0
  j .F.createFragmentationPattern._22.while.cond.3                      # ir inst 68 fin
.F.createFragmentationPattern._22.while.cond.3:
  li t2, 16
  slt t3, t4, t2                                                        # ir inst 70 fin
  bnez t3, .F.createFragmentationPattern._23.lazy.then.1
  j .F.createFragmentationPattern._24.lazy.else.1                       # ir inst 71 fin
.F.createFragmentationPattern._23.lazy.then.1:
  add t3, t5, t4                                                        # ir inst 72 fin
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 73 fin
# Phi connections
  mv t3, s11
  j .F.createFragmentationPattern._25.lazy.exit.1                       # ir inst 74 fin
.F.createFragmentationPattern._24.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.createFragmentationPattern._25.lazy.exit.1                       # ir inst 75 fin
.F.createFragmentationPattern._25.lazy.exit.1:
  bnez t3, .F.createFragmentationPattern._26.while.body.3
  j .F.createFragmentationPattern._27.while.exit.3                      # ir inst 77 fin
.F.createFragmentationPattern._26.while.body.3:
  add t3, t5, t4                                                        # ir inst 78 fin
  mv s11, t3                                                            # ir inst 79 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 80 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 81 fin
  addi t3, t4, 1                                                        # ir inst 82 fin
# Phi connections
  mv t4, t3
  j .F.createFragmentationPattern._22.while.cond.3                      # ir inst 83 fin
.F.createFragmentationPattern._27.while.exit.3:
  j .F.createFragmentationPattern._29.if.exit.3                         # ir inst 84 fin
.F.createFragmentationPattern._28.if.else.3:
  j .F.createFragmentationPattern._29.if.exit.3                         # ir inst 85 fin
.F.createFragmentationPattern._29.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 86 fin
# Phi connections
  mv t6, t5
  j .F.createFragmentationPattern._19.while.cond.2                      # ir inst 87 fin
.F.createFragmentationPattern._30.while.exit.2:
  j .F.createFragmentationPattern.epilogue                              # ir inst 88 fin
.F.createFragmentationPattern.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.measureFragmentation
.F.measureFragmentation:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 0,                range:       48(sp) -       48(sp)
# callee save reg num: 6 / 12,        range:        0(sp) -       48(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s6, 0(sp)
  sd s7, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s8, 40(sp)
.F.measureFragmentation._0.entry.0:
# Phi connections
  li s10, 0
  li s11, 0
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.measureFragmentation._1.while.cond.0                             # ir inst 1 fin
.F.measureFragmentation._1.while.cond.0:
  slt s9, s11, a1                                                       # ir inst 8 fin
  bnez s9, .F.measureFragmentation._2.while.body.0
  j .F.measureFragmentation._12.while.exit.0                            # ir inst 9 fin
.F.measureFragmentation._2.while.body.0:
  mv s9, s11                                                            # ir inst 10 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 11 fin
  lw s9, 0(s8)                                                          # ir inst 12 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 13 fin
  bnez s8, .F.measureFragmentation._3.if.then.0
  j .F.measureFragmentation._10.if.else.0                               # ir inst 14 fin
.F.measureFragmentation._3.if.then.0:
  li t2, 0
  xor t0, t3, t2
  sltiu s9, t0, 1                                                       # ir inst 15 fin
  bnez s9, .F.measureFragmentation._4.if.then.1
  j .F.measureFragmentation._5.if.else.1                                # ir inst 16 fin
.F.measureFragmentation._4.if.then.1:
  addi s9, t6, 1                                                        # ir inst 17 fin
# Phi connections
  li s10, 1
  mv t3, s9
  li s9, 1
  j .F.measureFragmentation._6.if.exit.1                                # ir inst 18 fin
.F.measureFragmentation._5.if.else.1:
  addi s9, s10, 1                                                       # ir inst 19 fin
# Phi connections
  mv s10, t3
  mv t3, t6
  j .F.measureFragmentation._6.if.exit.1                                # ir inst 20 fin
.F.measureFragmentation._6.if.exit.1:
  addi s8, t4, 1                                                        # ir inst 24 fin
  slt s7, t5, s9                                                        # ir inst 25 fin
  bnez s7, .F.measureFragmentation._7.if.then.2
  j .F.measureFragmentation._8.if.else.2                                # ir inst 26 fin
.F.measureFragmentation._7.if.then.2:
# Phi connections
  mv s7, s9
  j .F.measureFragmentation._9.if.exit.2                                # ir inst 27 fin
.F.measureFragmentation._8.if.else.2:
# Phi connections
  mv s7, t5
  j .F.measureFragmentation._9.if.exit.2                                # ir inst 28 fin
.F.measureFragmentation._9.if.exit.2:
# Phi connections
  mv t0, s7
  mv s7, s9
  mv s9, s8
  mv s8, s10
  mv s10, t0
  j .F.measureFragmentation._11.if.exit.0                               # ir inst 30 fin
.F.measureFragmentation._10.if.else.0:
# Phi connections
  li s7, 0
  li s8, 0
  mv s9, t4
  mv s10, t5
  mv t3, t6
  j .F.measureFragmentation._11.if.exit.0                               # ir inst 31 fin
.F.measureFragmentation._11.if.exit.0:
  addi s6, s11, 1                                                       # ir inst 37 fin
# Phi connections
  mv s11, s6
  mv t4, s9
  mv t5, s10
  mv t6, t3
  mv s10, s7
  mv t3, s8
  j .F.measureFragmentation._1.while.cond.0                             # ir inst 38 fin
.F.measureFragmentation._12.while.exit.0:
  li t2, 0
  slt t3, t2, t6                                                        # ir inst 39 fin
  bnez t3, .F.measureFragmentation._13.lazy.then.0
  j .F.measureFragmentation._14.lazy.else.0                             # ir inst 40 fin
.F.measureFragmentation._13.lazy.then.0:
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 41 fin
# Phi connections
  mv t4, t3
  j .F.measureFragmentation._15.lazy.exit.0                             # ir inst 42 fin
.F.measureFragmentation._14.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.measureFragmentation._15.lazy.exit.0                             # ir inst 43 fin
.F.measureFragmentation._15.lazy.exit.0:
  bnez t4, .F.measureFragmentation._16.if.then.3
  j .F.measureFragmentation._17.if.else.3                               # ir inst 45 fin
.F.measureFragmentation._16.if.then.3:
  li t2, 100
  mul t4, t6, t2                                                        # ir inst 46 fin
  addi t6, t5, 1                                                        # ir inst 47 fin
  div t5, t4, t6                                                        # ir inst 48 fin
  mv a0, t5
  j .F.measureFragmentation.epilogue                                    # ir inst 49 fin
.F.measureFragmentation._17.if.else.3:
  li a0, 0
  j .F.measureFragmentation.epilogue                                    # ir inst 50 fin
.F.measureFragmentation._18.if.exit.3:
.F.measureFragmentation.epilogue:
  ld s6, 0(sp)
  ld s7, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s8, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.attemptFragmentedAllocations
.F.attemptFragmentedAllocations:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 40,                 range:       80(sp) -      120(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 3 / 12,        range:       48(sp) -       72(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s9, 48(sp)
  sd s11, 56(sp)
  sd s10, 64(sp)
  sd ra, 72(sp)
.F.attemptFragmentedAllocations._0.entry.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 8
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 80
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 16
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 80
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 12
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 80
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 20
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 80
  addi t6, t1, 16                                                       # ir inst 10 fin
  li t1, 24
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 80
  addi t6, t1, 20                                                       # ir inst 12 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 80
  addi t6, t1, 24                                                       # ir inst 14 fin
  li t1, 6
  sw t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 80
  addi t6, t1, 28                                                       # ir inst 16 fin
  li t1, 10
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 80
  addi t6, t1, 32                                                       # ir inst 18 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 80
  addi t6, t1, 36                                                       # ir inst 20 fin
  li t1, 18
  sw t1, 0(t6)                                                          # ir inst 21 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.attemptFragmentedAllocations._1.while.cond.0                     # ir inst 22 fin
.F.attemptFragmentedAllocations._1.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 25 fin
  bnez t4, .F.attemptFragmentedAllocations._2.while.body.0
  j .F.attemptFragmentedAllocations._12.while.exit.0                    # ir inst 26 fin
.F.attemptFragmentedAllocations._2.while.body.0:
  mv t4, t6                                                             # ir inst 27 fin
  slli t2, t4, 2
  addi t1, sp, 80
  add t3, t1, t2                                                        # ir inst 28 fin
  lw t4, 0(t3)                                                          # ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t4
  call .F.findFreeSpace
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 30 fin
  li t2, -1
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 31 fin
  bnez s11, .F.attemptFragmentedAllocations._3.if.then.0
  j .F.attemptFragmentedAllocations._10.if.else.0                       # ir inst 32 fin
.F.attemptFragmentedAllocations._3.if.then.0:
# Phi connections
  li s11, 0
  j .F.attemptFragmentedAllocations._4.while.cond.1                     # ir inst 33 fin
.F.attemptFragmentedAllocations._4.while.cond.1:
  slt s10, s11, t4                                                      # ir inst 35 fin
  bnez s10, .F.attemptFragmentedAllocations._5.lazy.then.0
  j .F.attemptFragmentedAllocations._6.lazy.else.0                      # ir inst 36 fin
.F.attemptFragmentedAllocations._5.lazy.then.0:
  add s10, t3, s11                                                      # ir inst 37 fin
  slt s9, s10, a1                                                       # ir inst 38 fin
# Phi connections
  mv s10, s9
  j .F.attemptFragmentedAllocations._7.lazy.exit.0                      # ir inst 39 fin
.F.attemptFragmentedAllocations._6.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.attemptFragmentedAllocations._7.lazy.exit.0                      # ir inst 40 fin
.F.attemptFragmentedAllocations._7.lazy.exit.0:
  bnez s10, .F.attemptFragmentedAllocations._8.while.body.1
  j .F.attemptFragmentedAllocations._9.while.exit.1                     # ir inst 42 fin
.F.attemptFragmentedAllocations._8.while.body.1:
  add s10, t3, s11                                                      # ir inst 43 fin
  mv s9, s10                                                            # ir inst 44 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 45 fin
  li t1, 1
  sw t1, 0(s10)                                                         # ir inst 46 fin
  addi s10, s11, 1                                                      # ir inst 47 fin
# Phi connections
  mv s11, s10
  j .F.attemptFragmentedAllocations._4.while.cond.1                     # ir inst 48 fin
.F.attemptFragmentedAllocations._9.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 49 fin
# Phi connections
  j .F.attemptFragmentedAllocations._11.if.exit.0                       # ir inst 50 fin
.F.attemptFragmentedAllocations._10.if.else.0:
# Phi connections
  mv t4, t5
  j .F.attemptFragmentedAllocations._11.if.exit.0                       # ir inst 51 fin
.F.attemptFragmentedAllocations._11.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.attemptFragmentedAllocations._1.while.cond.0                     # ir inst 54 fin
.F.attemptFragmentedAllocations._12.while.exit.0:
  mv a0, t5
  j .F.attemptFragmentedAllocations.epilogue                            # ir inst 55 fin
.F.attemptFragmentedAllocations.epilogue:
  ld ra, 72(sp)
  ld s9, 48(sp)
  ld s11, 56(sp)
  ld s10, 64(sp)
  addi sp, sp, 128
  ret

.globl .F.findFreeSpace
.F.findFreeSpace:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.findFreeSpace._0.entry.0:
# Phi connections
  li t6, 0
  j .F.findFreeSpace._1.while.cond.0                                    # ir inst 1 fin
.F.findFreeSpace._1.while.cond.0:
  sub t5, a1, a2                                                        # ir inst 3 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.findFreeSpace._2.while.body.0
  j .F.findFreeSpace._12.while.exit.0                                   # ir inst 5 fin
.F.findFreeSpace._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.findFreeSpace._3.while.cond.1                                    # ir inst 6 fin
.F.findFreeSpace._3.while.cond.1:
  slt t4, t5, a2                                                        # ir inst 8 fin
  bnez t4, .F.findFreeSpace._4.while.body.1
  j .F.findFreeSpace._13.critical_edge.0                                # ir inst 9 fin
.F.findFreeSpace._4.while.body.1:
  add t4, t6, t5                                                        # ir inst 10 fin
  mv t3, t4                                                             # ir inst 11 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 12 fin
  lw t3, 0(t4)                                                          # ir inst 13 fin
  li t2, 0
  xor t0, t3, t2
  sltu t4, zero, t0                                                     # ir inst 14 fin
  bnez t4, .F.findFreeSpace._5.if.then.0
  j .F.findFreeSpace._6.if.else.0                                       # ir inst 15 fin
.F.findFreeSpace._5.if.then.0:
# Phi connections
  li t5, 0
  j .F.findFreeSpace._8.while.exit.1                                    # ir inst 16 fin
.F.findFreeSpace._6.if.else.0:
  j .F.findFreeSpace._7.if.exit.0                                       # ir inst 17 fin
.F.findFreeSpace._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.findFreeSpace._3.while.cond.1                                    # ir inst 19 fin
.F.findFreeSpace._8.while.exit.1:
  li t2, 1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 21 fin
  bnez t4, .F.findFreeSpace._9.if.then.1
  j .F.findFreeSpace._10.if.else.1                                      # ir inst 22 fin
.F.findFreeSpace._9.if.then.1:
  mv a0, t6
  j .F.findFreeSpace.epilogue                                           # ir inst 23 fin
.F.findFreeSpace._10.if.else.1:
  j .F.findFreeSpace._11.if.exit.1                                      # ir inst 24 fin
.F.findFreeSpace._11.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t5
  j .F.findFreeSpace._1.while.cond.0                                    # ir inst 26 fin
.F.findFreeSpace._12.while.exit.0:
  li a0, -1
  j .F.findFreeSpace.epilogue                                           # ir inst 27 fin
.F.findFreeSpace._13.critical_edge.0:
# Phi connections
  li t5, 1
  j .F.findFreeSpace._8.while.exit.1                                    # ir inst 28 fin
.F.findFreeSpace.epilogue:
  ret

.globl .F.performMemoryCompaction
.F.performMemoryCompaction:
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
.F.performMemoryCompaction._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.performMemoryCompaction._1.while.cond.0                          # ir inst 1 fin
.F.performMemoryCompaction._1.while.cond.0:
  slt t3, t4, a1                                                        # ir inst 5 fin
  bnez t3, .F.performMemoryCompaction._2.while.body.0
  j .F.performMemoryCompaction._18.while.exit.0                         # ir inst 6 fin
.F.performMemoryCompaction._2.while.body.0:
  mv t3, t4                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.performMemoryCompaction._3.if.then.0
  j .F.performMemoryCompaction._16.if.else.0                            # ir inst 11 fin
.F.performMemoryCompaction._3.if.then.0:
# Phi connections
  li t3, 0
  j .F.performMemoryCompaction._4.while.cond.1                          # ir inst 12 fin
.F.performMemoryCompaction._4.while.cond.1:
  add s11, t4, t3                                                       # ir inst 14 fin
  slt s10, s11, a1                                                      # ir inst 15 fin
  bnez s10, .F.performMemoryCompaction._5.lazy.then.0
  j .F.performMemoryCompaction._6.lazy.else.0                           # ir inst 16 fin
.F.performMemoryCompaction._5.lazy.then.0:
  add s11, t4, t3                                                       # ir inst 17 fin
  mv s10, s11                                                           # ir inst 18 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  lw s10, 0(s11)                                                        # ir inst 20 fin
  li t2, 1
  xor t0, s10, t2
  sltiu s11, t0, 1                                                      # ir inst 21 fin
# Phi connections
  j .F.performMemoryCompaction._7.lazy.exit.0                           # ir inst 22 fin
.F.performMemoryCompaction._6.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.performMemoryCompaction._7.lazy.exit.0                           # ir inst 23 fin
.F.performMemoryCompaction._7.lazy.exit.0:
  bnez s11, .F.performMemoryCompaction._8.while.body.1
  j .F.performMemoryCompaction._9.while.exit.1                          # ir inst 25 fin
.F.performMemoryCompaction._8.while.body.1:
  addi s11, t3, 1                                                       # ir inst 26 fin
# Phi connections
  mv t3, s11
  j .F.performMemoryCompaction._4.while.cond.1                          # ir inst 27 fin
.F.performMemoryCompaction._9.while.exit.1:
  xor t0, t4, t6
  sltu s11, zero, t0                                                    # ir inst 28 fin
  bnez s11, .F.performMemoryCompaction._10.if.then.1
  j .F.performMemoryCompaction._14.if.else.1                            # ir inst 29 fin
.F.performMemoryCompaction._10.if.then.1:
# Phi connections
  li s11, 0
  j .F.performMemoryCompaction._11.while.cond.2                         # ir inst 30 fin
.F.performMemoryCompaction._11.while.cond.2:
  slt s10, s11, t3                                                      # ir inst 32 fin
  bnez s10, .F.performMemoryCompaction._12.while.body.2
  j .F.performMemoryCompaction._13.while.exit.2                         # ir inst 33 fin
.F.performMemoryCompaction._12.while.body.2:
  add s10, t6, s11                                                      # ir inst 34 fin
  mv s9, s10                                                            # ir inst 35 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 36 fin
  li t1, 1
  sw t1, 0(s10)                                                         # ir inst 37 fin
  add s10, t4, s11                                                      # ir inst 38 fin
  mv s9, s10                                                            # ir inst 39 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 40 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 41 fin
  addi s10, s11, 1                                                      # ir inst 42 fin
# Phi connections
  mv s11, s10
  j .F.performMemoryCompaction._11.while.cond.2                         # ir inst 43 fin
.F.performMemoryCompaction._13.while.exit.2:
  j .F.performMemoryCompaction._15.if.exit.1                            # ir inst 44 fin
.F.performMemoryCompaction._14.if.else.1:
  j .F.performMemoryCompaction._15.if.exit.1                            # ir inst 45 fin
.F.performMemoryCompaction._15.if.exit.1:
  add s11, t6, t3                                                       # ir inst 46 fin
  add s10, t4, t3                                                       # ir inst 47 fin
  addi t3, t5, 1                                                        # ir inst 48 fin
# Phi connections
  mv t4, s11
  mv s11, s10
  j .F.performMemoryCompaction._17.if.exit.0                            # ir inst 49 fin
.F.performMemoryCompaction._16.if.else.0:
  addi t3, t4, 1                                                        # ir inst 50 fin
# Phi connections
  mv s11, t3
  mv t3, t5
  mv t4, t6
  j .F.performMemoryCompaction._17.if.exit.0                            # ir inst 51 fin
.F.performMemoryCompaction._17.if.exit.0:
# Phi connections
  mv t5, t3
  mv t6, t4
  mv t4, s11
  j .F.performMemoryCompaction._1.while.cond.0                          # ir inst 55 fin
.F.performMemoryCompaction._18.while.exit.0:
# Phi connections
  j .F.performMemoryCompaction._19.while.cond.3                         # ir inst 56 fin
.F.performMemoryCompaction._19.while.cond.3:
  slt t4, t6, a1                                                        # ir inst 58 fin
  bnez t4, .F.performMemoryCompaction._20.while.body.3
  j .F.performMemoryCompaction._21.while.exit.3                         # ir inst 59 fin
.F.performMemoryCompaction._20.while.body.3:
  mv t4, t6                                                             # ir inst 60 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 62 fin
  addi t4, t6, 1                                                        # ir inst 63 fin
# Phi connections
  mv t6, t4
  j .F.performMemoryCompaction._19.while.cond.3                         # ir inst 64 fin
.F.performMemoryCompaction._21.while.exit.3:
  mv a0, t5
  j .F.performMemoryCompaction.epilogue                                 # ir inst 65 fin
.F.performMemoryCompaction.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testMemoryEdgeCases
.F.testMemoryEdgeCases:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
.F.testMemoryEdgeCases._0.entry.0:
# Start call preparation
  li a0, 1840
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testZeroSizeAllocations
# ir inst 2 fin
# Start call preparation
  call .F.testMaxSizeAllocations
# ir inst 3 fin
# Start call preparation
  call .F.testAllocationFailures
# ir inst 4 fin
# Start call preparation
  call .F.testDoubleFreeDetection
# ir inst 5 fin
# Start call preparation
  call .F.testMemoryCorruption
# ir inst 6 fin
# Start call preparation
  li a0, 1849
  call printlnInt
# ir inst 7 fin
  j .F.testMemoryEdgeCases.epilogue                                     # ir inst 8 fin
.F.testMemoryEdgeCases.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testZeroSizeAllocations
.F.testZeroSizeAllocations:
# spill func args num: 0,             range:      416(sp) -      416(sp)
# local var size: 400,                range:       16(sp) -      416(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -416
  sd ra, 8(sp)
.F.testZeroSizeAllocations._0.entry.0:
# Start call preparation
  li a0, 1841
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testZeroSizeAllocations._1.array.cond.0                          # ir inst 4 fin
.F.testZeroSizeAllocations._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testZeroSizeAllocations._2.array.body.0
  j .F.testZeroSizeAllocations._3.array.exit.0                          # ir inst 7 fin
.F.testZeroSizeAllocations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testZeroSizeAllocations._1.array.cond.0                          # ir inst 11 fin
.F.testZeroSizeAllocations._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeMemoryPool100
# ir inst 12 fin
# Start call preparation
  li a2, 0
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.allocateBlock100
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a2, -5
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.allocateBlock100
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
  j .F.testZeroSizeAllocations.epilogue                                 # ir inst 17 fin
.F.testZeroSizeAllocations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 416
  ret

.globl .F.testMaxSizeAllocations
.F.testMaxSizeAllocations:
# spill func args num: 0,             range:      416(sp) -      416(sp)
# local var size: 400,                range:       16(sp) -      416(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -416
  sd ra, 8(sp)
.F.testMaxSizeAllocations._0.entry.0:
# Start call preparation
  li a0, 1842
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testMaxSizeAllocations._1.array.cond.0                           # ir inst 4 fin
.F.testMaxSizeAllocations._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testMaxSizeAllocations._2.array.body.0
  j .F.testMaxSizeAllocations._3.array.exit.0                           # ir inst 7 fin
.F.testMaxSizeAllocations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testMaxSizeAllocations._1.array.cond.0                           # ir inst 11 fin
.F.testMaxSizeAllocations._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeMemoryPool100
# ir inst 12 fin
# Start call preparation
  li a2, 200
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.allocateBlock100
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a2, 96
  li a1, 0
  addi t1, sp, 16
  mv a0, t1
  call .F.allocateBlock100
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
  j .F.testMaxSizeAllocations.epilogue                                  # ir inst 17 fin
.F.testMaxSizeAllocations.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 416
  ret

.globl .F.testAllocationFailures
.F.testAllocationFailures:
# spill func args num: 0,             range:      288(sp) -      288(sp)
# local var size: 240,                range:       40(sp) -      280(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -288
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.testAllocationFailures._0.entry.0:
# Start call preparation
  li a0, 1843
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testAllocationFailures._1.array.cond.0                           # ir inst 4 fin
.F.testAllocationFailures._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testAllocationFailures._2.array.body.0
  j .F.testAllocationFailures._3.array.exit.0                           # ir inst 7 fin
.F.testAllocationFailures._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testAllocationFailures._1.array.cond.0                           # ir inst 11 fin
.F.testAllocationFailures._3.array.exit.0:
# Start call preparation
  addi t1, sp, 40
  mv a0, t1
  call .F.initializeMemoryPool50
# ir inst 12 fin
  addi t1, sp, 240
  addi t6, t1, 0                                                        # ir inst 14 fin
# Phi connections
  li t5, 0
  j .F.testAllocationFailures._4.array.cond.1                           # ir inst 15 fin
.F.testAllocationFailures._4.array.cond.1:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 17 fin
  bnez t4, .F.testAllocationFailures._5.array.body.1
  j .F.testAllocationFailures._6.array.exit.1                           # ir inst 18 fin
.F.testAllocationFailures._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  j .F.testAllocationFailures._4.array.cond.1                           # ir inst 22 fin
.F.testAllocationFailures._6.array.exit.1:
# Phi connections
  li t5, 0
  li t6, 8
  j .F.testAllocationFailures._7.while.cond.0                           # ir inst 23 fin
.F.testAllocationFailures._7.while.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.testAllocationFailures._8.while.body.0
  j .F.testAllocationFailures._13.critical_edge.0                       # ir inst 27 fin
.F.testAllocationFailures._8.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  li a1, 0
  addi t1, sp, 40
  mv a0, t1
  call .F.allocateBlock50
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 28 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 29 fin
  bnez t3, .F.testAllocationFailures._9.if.then.0
  j .F.testAllocationFailures._10.if.else.0                             # ir inst 30 fin
.F.testAllocationFailures._9.if.then.0:
  j .F.testAllocationFailures._12.while.exit.0                          # ir inst 31 fin
.F.testAllocationFailures._10.if.else.0:
  j .F.testAllocationFailures._11.if.exit.0                             # ir inst 32 fin
.F.testAllocationFailures._11.if.exit.0:
  mv t3, t5                                                             # ir inst 33 fin
  slli t2, t3, 2
  addi t1, sp, 240
  add s11, t1, t2                                                       # ir inst 34 fin
  sw t4, 0(s11)                                                         # ir inst 35 fin
  addi t4, t5, 1                                                        # ir inst 36 fin
  addi t3, t6, 2                                                        # ir inst 37 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testAllocationFailures._7.while.cond.0                           # ir inst 38 fin
.F.testAllocationFailures._12.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 39 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 4
  li a1, 0
  addi t1, sp, 40
  mv a0, t1
  call .F.allocateBlock50
  mv t6, a0
  ld t5, 0(sp)
# ir inst 40 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 41 fin
  j .F.testAllocationFailures.epilogue                                  # ir inst 42 fin
.F.testAllocationFailures._13.critical_edge.0:
  j .F.testAllocationFailures._12.while.exit.0                          # ir inst 43 fin
.F.testAllocationFailures.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 288
  ret

.globl .F.testDoubleFreeDetection
.F.testDoubleFreeDetection:
# spill func args num: 0,             range:      432(sp) -      432(sp)
# local var size: 400,                range:       24(sp) -      424(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -432
  sd ra, 16(sp)
.F.testDoubleFreeDetection._0.entry.0:
# Start call preparation
  li a0, 1844
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testDoubleFreeDetection._1.array.cond.0                          # ir inst 4 fin
.F.testDoubleFreeDetection._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testDoubleFreeDetection._2.array.body.0
  j .F.testDoubleFreeDetection._3.array.exit.0                          # ir inst 7 fin
.F.testDoubleFreeDetection._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testDoubleFreeDetection._1.array.cond.0                          # ir inst 11 fin
.F.testDoubleFreeDetection._3.array.exit.0:
# Start call preparation
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeMemoryPool100
# ir inst 12 fin
# Start call preparation
  li a2, 16
  li a1, 0
  addi t1, sp, 24
  mv a0, t1
  call .F.allocateBlock100
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 24
  mv a0, t1
  call .F.deallocateBlock100
  ld t6, 0(sp)
# ir inst 15 fin
  mv t5, t6                                                             # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
  slli t2, t4, 2
  addi t1, sp, 24
  add t5, t1, t2                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 20 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 24
  mv a0, t1
  call .F.deallocateBlock100
  ld t6, 0(sp)
# ir inst 21 fin
  mv t5, t6                                                             # ir inst 22 fin
  addi t6, t5, 1                                                        # ir inst 23 fin
  slli t2, t6, 2
  addi t1, sp, 24
  add t5, t1, t2                                                        # ir inst 24 fin
  lw t6, 0(t5)                                                          # ir inst 25 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 26 fin
  j .F.testDoubleFreeDetection.epilogue                                 # ir inst 27 fin
.F.testDoubleFreeDetection.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 432
  ret

.globl .F.testMemoryCorruption
.F.testMemoryCorruption:
# spill func args num: 0,             range:      832(sp) -      832(sp)
# local var size: 800,                range:       24(sp) -      824(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -832
  sd ra, 16(sp)
.F.testMemoryCorruption._0.entry.0:
# Start call preparation
  li a0, 1845
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testMemoryCorruption._1.array.cond.0                             # ir inst 4 fin
.F.testMemoryCorruption._1.array.cond.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testMemoryCorruption._2.array.body.0
  j .F.testMemoryCorruption._3.array.exit.0                             # ir inst 7 fin
.F.testMemoryCorruption._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testMemoryCorruption._1.array.cond.0                             # ir inst 11 fin
.F.testMemoryCorruption._3.array.exit.0:
# Start call preparation
  addi t1, sp, 24
  mv a0, t1
  call .F.initializeMemoryPool200
# ir inst 12 fin
# Start call preparation
  li a2, 20
  li a1, 0
  addi t1, sp, 24
  mv a0, t1
  call .F.allocateBlock200
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 24
  li a1, 0
  addi t1, sp, 24
  mv a0, t1
  call .F.allocateBlock200
  mv t5, a0
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 16
  li a1, 0
  addi t1, sp, 24
  mv a0, t1
  call .F.allocateBlock200
  mv t5, a0
  ld t6, 0(sp)
# ir inst 15 fin
  li t2, 0
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 16 fin
  bnez t5, .F.testMemoryCorruption._4.lazy.then.0
  j .F.testMemoryCorruption._5.lazy.else.0                              # ir inst 17 fin
.F.testMemoryCorruption._4.lazy.then.0:
  addi t5, t6, 30                                                       # ir inst 18 fin
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.testMemoryCorruption._6.lazy.exit.0                              # ir inst 20 fin
.F.testMemoryCorruption._5.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.testMemoryCorruption._6.lazy.exit.0                              # ir inst 21 fin
.F.testMemoryCorruption._6.lazy.exit.0:
  bnez t5, .F.testMemoryCorruption._7.if.then.0
  j .F.testMemoryCorruption._8.if.else.0                                # ir inst 23 fin
.F.testMemoryCorruption._7.if.then.0:
  mv t5, t6                                                             # ir inst 24 fin
  addi t6, t5, 25                                                       # ir inst 25 fin
  slli t2, t6, 2
  addi t1, sp, 24
  add t5, t1, t2                                                        # ir inst 26 fin
  li t1, 99999
  sw t1, 0(t5)                                                          # ir inst 27 fin
  j .F.testMemoryCorruption._9.if.exit.0                                # ir inst 28 fin
.F.testMemoryCorruption._8.if.else.0:
  j .F.testMemoryCorruption._9.if.exit.0                                # ir inst 29 fin
.F.testMemoryCorruption._9.if.exit.0:
# Start call preparation
  li a1, 200
  addi t1, sp, 24
  mv a0, t1
  call .F.detectMemoryCorruption
  mv t6, a0
# ir inst 30 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 31 fin
# Start call preparation
  li a1, 200
  addi t1, sp, 24
  mv a0, t1
  call .F.validateMemoryIntegrity
  mv t6, a0
# ir inst 32 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 33 fin
  j .F.testMemoryCorruption.epilogue                                    # ir inst 34 fin
.F.testMemoryCorruption.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 832
  ret

.globl .F.initializeMemoryPool100
.F.initializeMemoryPool100:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeMemoryPool100._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 96
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 8 fin
# Phi connections
  li t6, 4
  j .F.initializeMemoryPool100._1.while.cond.0                          # ir inst 9 fin
.F.initializeMemoryPool100._1.while.cond.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 11 fin
  bnez t5, .F.initializeMemoryPool100._2.while.body.0
  j .F.initializeMemoryPool100._3.while.exit.0                          # ir inst 12 fin
.F.initializeMemoryPool100._2.while.body.0:
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.initializeMemoryPool100._1.while.cond.0                          # ir inst 17 fin
.F.initializeMemoryPool100._3.while.exit.0:
  j .F.initializeMemoryPool100.epilogue                                 # ir inst 18 fin
.F.initializeMemoryPool100.epilogue:
  ret

.globl .F.initializeMemoryPool50
.F.initializeMemoryPool50:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeMemoryPool50._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 46
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 8 fin
# Phi connections
  li t6, 4
  j .F.initializeMemoryPool50._1.while.cond.0                           # ir inst 9 fin
.F.initializeMemoryPool50._1.while.cond.0:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 11 fin
  bnez t5, .F.initializeMemoryPool50._2.while.body.0
  j .F.initializeMemoryPool50._3.while.exit.0                           # ir inst 12 fin
.F.initializeMemoryPool50._2.while.body.0:
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.initializeMemoryPool50._1.while.cond.0                           # ir inst 17 fin
.F.initializeMemoryPool50._3.while.exit.0:
  j .F.initializeMemoryPool50.epilogue                                  # ir inst 18 fin
.F.initializeMemoryPool50.epilogue:
  ret

.globl .F.initializeMemoryPool200
.F.initializeMemoryPool200:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeMemoryPool200._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 196
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 8 fin
# Phi connections
  li t6, 4
  j .F.initializeMemoryPool200._1.while.cond.0                          # ir inst 9 fin
.F.initializeMemoryPool200._1.while.cond.0:
  li t2, 200
  slt t5, t6, t2                                                        # ir inst 11 fin
  bnez t5, .F.initializeMemoryPool200._2.while.body.0
  j .F.initializeMemoryPool200._3.while.exit.0                          # ir inst 12 fin
.F.initializeMemoryPool200._2.while.body.0:
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.initializeMemoryPool200._1.while.cond.0                          # ir inst 17 fin
.F.initializeMemoryPool200._3.while.exit.0:
  j .F.initializeMemoryPool200.epilogue                                 # ir inst 18 fin
.F.initializeMemoryPool200.epilogue:
  ret

.globl .F.allocateBlock100
.F.allocateBlock100:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.allocateBlock100._0.entry.0:
  li t2, 0
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.allocateBlock100._1.lazy.then.0
  j .F.allocateBlock100._2.lazy.else.0                                  # ir inst 2 fin
.F.allocateBlock100._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.allocateBlock100._3.lazy.exit.0                                  # ir inst 3 fin
.F.allocateBlock100._2.lazy.else.0:
  li t2, 96
  slt t6, t2, a2                                                        # ir inst 4 fin
# Phi connections
  j .F.allocateBlock100._3.lazy.exit.0                                  # ir inst 5 fin
.F.allocateBlock100._3.lazy.exit.0:
  bnez t6, .F.allocateBlock100._4.if.then.0
  j .F.allocateBlock100._5.if.else.0                                    # ir inst 7 fin
.F.allocateBlock100._4.if.then.0:
  li a0, -1
  j .F.allocateBlock100.epilogue                                        # ir inst 8 fin
.F.allocateBlock100._5.if.else.0:
  j .F.allocateBlock100._6.if.exit.0                                    # ir inst 9 fin
.F.allocateBlock100._6.if.exit.0:
  addi t6, a0, 4                                                        # ir inst 10 fin
  lw t5, 0(t6)                                                          # ir inst 11 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 12 fin
  bnez t6, .F.allocateBlock100._7.lazy.then.1
  j .F.allocateBlock100._8.lazy.else.1                                  # ir inst 13 fin
.F.allocateBlock100._7.lazy.then.1:
  addi t6, a0, 0                                                        # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
  slt t0, t5, a2
  xori t6, t0, 1                                                        # ir inst 16 fin
# Phi connections
  j .F.allocateBlock100._9.lazy.exit.1                                  # ir inst 17 fin
.F.allocateBlock100._8.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.allocateBlock100._9.lazy.exit.1                                  # ir inst 18 fin
.F.allocateBlock100._9.lazy.exit.1:
  bnez t6, .F.allocateBlock100._10.if.then.1
  j .F.allocateBlock100._11.if.else.1                                   # ir inst 20 fin
.F.allocateBlock100._10.if.then.1:
  addi t6, a0, 0                                                        # ir inst 21 fin
  sw a2, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 4                                                        # ir inst 23 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 24 fin
  li a0, 0
  j .F.allocateBlock100.epilogue                                        # ir inst 25 fin
.F.allocateBlock100._11.if.else.1:
  j .F.allocateBlock100._12.if.exit.1                                   # ir inst 26 fin
.F.allocateBlock100._12.if.exit.1:
  li a0, -1
  j .F.allocateBlock100.epilogue                                        # ir inst 27 fin
.F.allocateBlock100.epilogue:
  ret

.globl .F.allocateBlock50
.F.allocateBlock50:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.allocateBlock50._0.entry.0:
  li t2, 0
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.allocateBlock50._1.lazy.then.0
  j .F.allocateBlock50._2.lazy.else.0                                   # ir inst 2 fin
.F.allocateBlock50._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.allocateBlock50._3.lazy.exit.0                                   # ir inst 3 fin
.F.allocateBlock50._2.lazy.else.0:
  li t2, 46
  slt t6, t2, a2                                                        # ir inst 4 fin
# Phi connections
  j .F.allocateBlock50._3.lazy.exit.0                                   # ir inst 5 fin
.F.allocateBlock50._3.lazy.exit.0:
  bnez t6, .F.allocateBlock50._4.if.then.0
  j .F.allocateBlock50._5.if.else.0                                     # ir inst 7 fin
.F.allocateBlock50._4.if.then.0:
  li a0, -1
  j .F.allocateBlock50.epilogue                                         # ir inst 8 fin
.F.allocateBlock50._5.if.else.0:
  j .F.allocateBlock50._6.if.exit.0                                     # ir inst 9 fin
.F.allocateBlock50._6.if.exit.0:
# Phi connections
  li t6, 0
  j .F.allocateBlock50._7.while.cond.0                                  # ir inst 10 fin
.F.allocateBlock50._7.while.cond.0:
  li t1, 46
  sub t5, t1, a2                                                        # ir inst 12 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 13 fin
  bnez t4, .F.allocateBlock50._8.while.body.0
  j .F.allocateBlock50._15.while.exit.0                                 # ir inst 14 fin
.F.allocateBlock50._8.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  addi t4, t5, 1                                                        # ir inst 16 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 17 fin
  lw t4, 0(t5)                                                          # ir inst 18 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 19 fin
  bnez t5, .F.allocateBlock50._9.if.then.1
  j .F.allocateBlock50._13.if.else.1                                    # ir inst 20 fin
.F.allocateBlock50._9.if.then.1:
  mv t5, t6                                                             # ir inst 21 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 22 fin
  lw t5, 0(t4)                                                          # ir inst 23 fin
  slt t0, t5, a2
  xori t4, t0, 1                                                        # ir inst 24 fin
  bnez t4, .F.allocateBlock50._10.if.then.2
  j .F.allocateBlock50._11.if.else.2                                    # ir inst 25 fin
.F.allocateBlock50._10.if.then.2:
  mv t5, t6                                                             # ir inst 26 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 27 fin
  sw a2, 0(t4)                                                          # ir inst 28 fin
  mv t5, t6                                                             # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 31 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 32 fin
  mv a0, t6
  j .F.allocateBlock50.epilogue                                         # ir inst 33 fin
.F.allocateBlock50._11.if.else.2:
  j .F.allocateBlock50._12.if.exit.2                                    # ir inst 34 fin
.F.allocateBlock50._12.if.exit.2:
  j .F.allocateBlock50._14.if.exit.1                                    # ir inst 35 fin
.F.allocateBlock50._13.if.else.1:
  j .F.allocateBlock50._14.if.exit.1                                    # ir inst 36 fin
.F.allocateBlock50._14.if.exit.1:
  mv t5, t6                                                             # ir inst 37 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 38 fin
  lw t5, 0(t4)                                                          # ir inst 39 fin
  add t4, t6, t5                                                        # ir inst 40 fin
  addi t6, t4, 4                                                        # ir inst 41 fin
# Phi connections
  j .F.allocateBlock50._7.while.cond.0                                  # ir inst 42 fin
.F.allocateBlock50._15.while.exit.0:
  li a0, -1
  j .F.allocateBlock50.epilogue                                         # ir inst 43 fin
.F.allocateBlock50.epilogue:
  ret

.globl .F.allocateBlock200
.F.allocateBlock200:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.allocateBlock200._0.entry.0:
  li t2, 0
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.allocateBlock200._1.lazy.then.0
  j .F.allocateBlock200._2.lazy.else.0                                  # ir inst 2 fin
.F.allocateBlock200._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.allocateBlock200._3.lazy.exit.0                                  # ir inst 3 fin
.F.allocateBlock200._2.lazy.else.0:
  li t2, 196
  slt t6, t2, a2                                                        # ir inst 4 fin
# Phi connections
  j .F.allocateBlock200._3.lazy.exit.0                                  # ir inst 5 fin
.F.allocateBlock200._3.lazy.exit.0:
  bnez t6, .F.allocateBlock200._4.if.then.0
  j .F.allocateBlock200._5.if.else.0                                    # ir inst 7 fin
.F.allocateBlock200._4.if.then.0:
  li a0, -1
  j .F.allocateBlock200.epilogue                                        # ir inst 8 fin
.F.allocateBlock200._5.if.else.0:
  j .F.allocateBlock200._6.if.exit.0                                    # ir inst 9 fin
.F.allocateBlock200._6.if.exit.0:
  addi t6, a0, 4                                                        # ir inst 10 fin
  lw t5, 0(t6)                                                          # ir inst 11 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 12 fin
  bnez t6, .F.allocateBlock200._7.lazy.then.1
  j .F.allocateBlock200._8.lazy.else.1                                  # ir inst 13 fin
.F.allocateBlock200._7.lazy.then.1:
  addi t6, a0, 0                                                        # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
  slt t0, t5, a2
  xori t6, t0, 1                                                        # ir inst 16 fin
# Phi connections
  j .F.allocateBlock200._9.lazy.exit.1                                  # ir inst 17 fin
.F.allocateBlock200._8.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.allocateBlock200._9.lazy.exit.1                                  # ir inst 18 fin
.F.allocateBlock200._9.lazy.exit.1:
  bnez t6, .F.allocateBlock200._10.if.then.1
  j .F.allocateBlock200._11.if.else.1                                   # ir inst 20 fin
.F.allocateBlock200._10.if.then.1:
  addi t6, a0, 0                                                        # ir inst 21 fin
  sw a2, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 4                                                        # ir inst 23 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 24 fin
  li a0, 0
  j .F.allocateBlock200.epilogue                                        # ir inst 25 fin
.F.allocateBlock200._11.if.else.1:
  j .F.allocateBlock200._12.if.exit.1                                   # ir inst 26 fin
.F.allocateBlock200._12.if.exit.1:
  li a0, -1
  j .F.allocateBlock200.epilogue                                        # ir inst 27 fin
.F.allocateBlock200.epilogue:
  ret

.globl .F.deallocateBlock100
.F.deallocateBlock100:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.deallocateBlock100._0.entry.0:
  li t2, 0
  slt t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.deallocateBlock100._1.lazy.then.0
  j .F.deallocateBlock100._2.lazy.else.0                                # ir inst 2 fin
.F.deallocateBlock100._1.lazy.then.0:
  addi t6, a1, 1                                                        # ir inst 3 fin
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 4 fin
# Phi connections
  mv t6, t5
  j .F.deallocateBlock100._3.lazy.exit.0                                # ir inst 5 fin
.F.deallocateBlock100._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.deallocateBlock100._3.lazy.exit.0                                # ir inst 6 fin
.F.deallocateBlock100._3.lazy.exit.0:
  bnez t6, .F.deallocateBlock100._4.if.then.0
  j .F.deallocateBlock100._5.if.else.0                                  # ir inst 8 fin
.F.deallocateBlock100._4.if.then.0:
  mv t6, a1                                                             # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 12 fin
  j .F.deallocateBlock100._6.if.exit.0                                  # ir inst 13 fin
.F.deallocateBlock100._5.if.else.0:
  j .F.deallocateBlock100._6.if.exit.0                                  # ir inst 14 fin
.F.deallocateBlock100._6.if.exit.0:
  j .F.deallocateBlock100.epilogue                                      # ir inst 15 fin
.F.deallocateBlock100.epilogue:
  ret

.globl .F.detectMemoryCorruption
.F.detectMemoryCorruption:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.detectMemoryCorruption._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.detectMemoryCorruption._1.while.cond.0                           # ir inst 1 fin
.F.detectMemoryCorruption._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.detectMemoryCorruption._2.while.body.0
  j .F.detectMemoryCorruption._9.while.exit.0                           # ir inst 5 fin
.F.detectMemoryCorruption._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 10000
  slt t3, t2, t4                                                        # ir inst 9 fin
  bnez t3, .F.detectMemoryCorruption._3.lazy.then.0
  j .F.detectMemoryCorruption._4.lazy.else.0                            # ir inst 10 fin
.F.detectMemoryCorruption._3.lazy.then.0:
# Phi connections
  li t4, 1
  j .F.detectMemoryCorruption._5.lazy.exit.0                            # ir inst 11 fin
.F.detectMemoryCorruption._4.lazy.else.0:
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  lw t4, 0(t3)                                                          # ir inst 14 fin
  li t2, -1000
  slt t3, t4, t2                                                        # ir inst 15 fin
# Phi connections
  mv t4, t3
  j .F.detectMemoryCorruption._5.lazy.exit.0                            # ir inst 16 fin
.F.detectMemoryCorruption._5.lazy.exit.0:
  bnez t4, .F.detectMemoryCorruption._6.if.then.0
  j .F.detectMemoryCorruption._7.if.else.0                              # ir inst 18 fin
.F.detectMemoryCorruption._6.if.then.0:
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  j .F.detectMemoryCorruption._8.if.exit.0                              # ir inst 20 fin
.F.detectMemoryCorruption._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.detectMemoryCorruption._8.if.exit.0                              # ir inst 21 fin
.F.detectMemoryCorruption._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.detectMemoryCorruption._1.while.cond.0                           # ir inst 24 fin
.F.detectMemoryCorruption._9.while.exit.0:
  mv a0, t5
  j .F.detectMemoryCorruption.epilogue                                  # ir inst 25 fin
.F.detectMemoryCorruption.epilogue:
  ret

.globl .F.validateMemoryIntegrity
.F.validateMemoryIntegrity:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.validateMemoryIntegrity._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.validateMemoryIntegrity._1.while.cond.0                          # ir inst 1 fin
.F.validateMemoryIntegrity._1.while.cond.0:
  addi t4, a1, -4                                                       # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.validateMemoryIntegrity._2.while.body.0
  j .F.validateMemoryIntegrity._21.while.exit.0                         # ir inst 6 fin
.F.validateMemoryIntegrity._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 10 fin
  bnez t3, .F.validateMemoryIntegrity._3.lazy.then.0
  j .F.validateMemoryIntegrity._4.lazy.else.0                           # ir inst 11 fin
.F.validateMemoryIntegrity._3.lazy.then.0:
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  lw t4, 0(t3)                                                          # ir inst 14 fin
  li t2, 100
  slt t0, t2, t4
  xori t3, t0, 1                                                        # ir inst 15 fin
# Phi connections
  mv t4, t3
  j .F.validateMemoryIntegrity._5.lazy.exit.0                           # ir inst 16 fin
.F.validateMemoryIntegrity._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.validateMemoryIntegrity._5.lazy.exit.0                           # ir inst 17 fin
.F.validateMemoryIntegrity._5.lazy.exit.0:
  bnez t4, .F.validateMemoryIntegrity._6.lazy.then.1
  j .F.validateMemoryIntegrity._10.lazy.else.1                          # ir inst 19 fin
.F.validateMemoryIntegrity._6.lazy.then.1:
  mv t4, t6                                                             # ir inst 20 fin
  addi t3, t4, 1                                                        # ir inst 21 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 22 fin
  lw t3, 0(t4)                                                          # ir inst 23 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 24 fin
  bnez t4, .F.validateMemoryIntegrity._7.lazy.then.2
  j .F.validateMemoryIntegrity._8.lazy.else.2                           # ir inst 25 fin
.F.validateMemoryIntegrity._7.lazy.then.2:
# Phi connections
  li t4, 1
  j .F.validateMemoryIntegrity._9.lazy.exit.2                           # ir inst 26 fin
.F.validateMemoryIntegrity._8.lazy.else.2:
  mv t4, t6                                                             # ir inst 27 fin
  addi t3, t4, 1                                                        # ir inst 28 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 29 fin
  lw t3, 0(t4)                                                          # ir inst 30 fin
  li t2, 1
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 31 fin
# Phi connections
  j .F.validateMemoryIntegrity._9.lazy.exit.2                           # ir inst 32 fin
.F.validateMemoryIntegrity._9.lazy.exit.2:
# Phi connections
  j .F.validateMemoryIntegrity._11.lazy.exit.1                          # ir inst 34 fin
.F.validateMemoryIntegrity._10.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.validateMemoryIntegrity._11.lazy.exit.1                          # ir inst 35 fin
.F.validateMemoryIntegrity._11.lazy.exit.1:
  bnez t4, .F.validateMemoryIntegrity._12.if.then.0
  j .F.validateMemoryIntegrity._13.if.else.0                            # ir inst 37 fin
.F.validateMemoryIntegrity._12.if.then.0:
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  j .F.validateMemoryIntegrity._14.if.exit.0                            # ir inst 39 fin
.F.validateMemoryIntegrity._13.if.else.0:
# Phi connections
  mv t4, t5
  j .F.validateMemoryIntegrity._14.if.exit.0                            # ir inst 40 fin
.F.validateMemoryIntegrity._14.if.exit.0:
  mv t3, t6                                                             # ir inst 42 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 43 fin
  lw t3, 0(s11)                                                         # ir inst 44 fin
  addi s11, t3, 4                                                       # ir inst 45 fin
  li t2, 0
  slt t3, t2, s11                                                       # ir inst 46 fin
  bnez t3, .F.validateMemoryIntegrity._15.lazy.then.3
  j .F.validateMemoryIntegrity._16.lazy.else.3                          # ir inst 47 fin
.F.validateMemoryIntegrity._15.lazy.then.3:
  li t2, 50
  slt t3, s11, t2                                                       # ir inst 48 fin
# Phi connections
  j .F.validateMemoryIntegrity._17.lazy.exit.3                          # ir inst 49 fin
.F.validateMemoryIntegrity._16.lazy.else.3:
# Phi connections
  li t3, 0
  j .F.validateMemoryIntegrity._17.lazy.exit.3                          # ir inst 50 fin
.F.validateMemoryIntegrity._17.lazy.exit.3:
  bnez t3, .F.validateMemoryIntegrity._18.if.then.1
  j .F.validateMemoryIntegrity._19.if.else.1                            # ir inst 52 fin
.F.validateMemoryIntegrity._18.if.then.1:
  add t3, t6, s11                                                       # ir inst 53 fin
# Phi connections
  mv t6, t3
  j .F.validateMemoryIntegrity._20.if.exit.1                            # ir inst 54 fin
.F.validateMemoryIntegrity._19.if.else.1:
  addi t3, t6, 4                                                        # ir inst 55 fin
# Phi connections
  mv t6, t3
  j .F.validateMemoryIntegrity._20.if.exit.1                            # ir inst 56 fin
.F.validateMemoryIntegrity._20.if.exit.1:
# Phi connections
  mv t5, t4
  j .F.validateMemoryIntegrity._1.while.cond.0                          # ir inst 58 fin
.F.validateMemoryIntegrity._21.while.exit.0:
  mv a0, t5
  j .F.validateMemoryIntegrity.epilogue                                 # ir inst 59 fin
.F.validateMemoryIntegrity.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret
