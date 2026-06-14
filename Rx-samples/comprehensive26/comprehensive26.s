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
  li a0, 26000
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 500
  call .F.performBPlusTreeOperations
# ir inst 2 fin
# Start call preparation
  li a0, 1000
  call .F.performQueryExecutionTest
# ir inst 3 fin
# Start call preparation
  li a0, 50
  call .F.performTransactionProcessingTest
# ir inst 4 fin
# Start call preparation
  li a0, 100
  call .F.performBufferPoolTest
# ir inst 5 fin
# Start call preparation
  li a0, 1000
  call .F.performQueryOptimizationTest
# ir inst 6 fin
# Start call preparation
  li a0, 1000
  call .F.performHashTableTest
# ir inst 7 fin
# Start call preparation
  li a0, 26999
  call printlnInt
# ir inst 8 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 9 fin
  j main.epilogue                                                       # ir inst 10 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.performBPlusTreeOperations
.F.performBPlusTreeOperations:
# spill func args num: 0,             range:     9920(sp) -     9920(sp)
# local var size: 9784,               range:      128(sp) -     9912(sp)
# return addr size: 8,                range:      120(sp) -      128(sp)
# callee save reg num: 9 / 12,        range:       48(sp) -      120(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -9920
  add sp, sp, t0
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd s9, 64(sp)
  sd s8, 72(sp)
  sd s5, 80(sp)
  sd s0, 88(sp)
  sd s6, 96(sp)
  sd s1, 104(sp)
  sd s7, 112(sp)
  sd ra, 120(sp)
.F.performBPlusTreeOperations._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 26001
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  li t1, 4128
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._1.array.cond.0                       # ir inst 5 fin
.F.performBPlusTreeOperations._1.array.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.performBPlusTreeOperations._2.array.body.0
  j .F.performBPlusTreeOperations._3.array.exit.0                       # ir inst 8 fin
.F.performBPlusTreeOperations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._1.array.cond.0                       # ir inst 12 fin
.F.performBPlusTreeOperations._3.array.exit.0:
  addi t1, sp, 128
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._4.array.cond.1                       # ir inst 14 fin
.F.performBPlusTreeOperations._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performBPlusTreeOperations._5.array.body.1
  j .F.performBPlusTreeOperations._6.array.exit.1                       # ir inst 17 fin
.F.performBPlusTreeOperations._5.array.body.1:
  li t1, 40
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 40
  li t1, 4128
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._4.array.cond.1                       # ir inst 21 fin
.F.performBPlusTreeOperations._6.array.exit.1:
  li t1, 8568
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 24 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._7.array.cond.2                       # ir inst 25 fin
.F.performBPlusTreeOperations._7.array.cond.2:
  li t2, 11
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.performBPlusTreeOperations._8.array.body.2
  j .F.performBPlusTreeOperations._9.array.exit.2                       # ir inst 28 fin
.F.performBPlusTreeOperations._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 29 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 30 fin
  addi t4, t5, 1                                                        # ir inst 31 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._7.array.cond.2                       # ir inst 32 fin
.F.performBPlusTreeOperations._9.array.exit.2:
  li t1, 4168
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._10.array.cond.3                      # ir inst 34 fin
.F.performBPlusTreeOperations._10.array.cond.3:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.performBPlusTreeOperations._11.array.body.3
  j .F.performBPlusTreeOperations._12.array.exit.3                      # ir inst 37 fin
.F.performBPlusTreeOperations._11.array.body.3:
  li t1, 44
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 38 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 44
  li t1, 8568
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._10.array.cond.3                      # ir inst 41 fin
.F.performBPlusTreeOperations._12.array.exit.3:
  li t1, 8612
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._13.array.cond.4                      # ir inst 44 fin
.F.performBPlusTreeOperations._13.array.cond.4:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 46 fin
  bnez t4, .F.performBPlusTreeOperations._14.array.body.4
  j .F.performBPlusTreeOperations._15.array.exit.4                      # ir inst 47 fin
.F.performBPlusTreeOperations._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 48 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 49 fin
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._13.array.cond.4                      # ir inst 51 fin
.F.performBPlusTreeOperations._15.array.exit.4:
  li t1, 9012
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._16.array.cond.5                      # ir inst 54 fin
.F.performBPlusTreeOperations._16.array.cond.5:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, .F.performBPlusTreeOperations._17.array.body.5
  j .F.performBPlusTreeOperations._18.array.exit.5                      # ir inst 57 fin
.F.performBPlusTreeOperations._17.array.body.5:
  add t4, t6, t5                                                        # ir inst 58 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._16.array.cond.5                      # ir inst 61 fin
.F.performBPlusTreeOperations._18.array.exit.5:
  li t1, 9112
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 63 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._19.array.cond.6                      # ir inst 64 fin
.F.performBPlusTreeOperations._19.array.cond.6:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 66 fin
  bnez t4, .F.performBPlusTreeOperations._20.array.body.6
  j .F.performBPlusTreeOperations._21.array.exit.6                      # ir inst 67 fin
.F.performBPlusTreeOperations._20.array.body.6:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 68 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 69 fin
  addi t4, t5, 1                                                        # ir inst 70 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._19.array.cond.6                      # ir inst 71 fin
.F.performBPlusTreeOperations._21.array.exit.6:
  li t1, 9012
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 72 fin
  li t1, 1
  sb t1, 0(t6)                                                          # ir inst 73 fin
  li t1, 9112
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 74 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 75 fin
  li t1, 9512
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 77 fin
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._22.array.cond.7                      # ir inst 78 fin
.F.performBPlusTreeOperations._22.array.cond.7:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 80 fin
  bnez t4, .F.performBPlusTreeOperations._23.array.body.7
  j .F.performBPlusTreeOperations._24.array.exit.7                      # ir inst 81 fin
.F.performBPlusTreeOperations._23.array.body.7:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 82 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 83 fin
  addi t4, t5, 1                                                        # ir inst 84 fin
# Phi connections
  mv t5, t4
  j .F.performBPlusTreeOperations._22.array.cond.7                      # ir inst 85 fin
.F.performBPlusTreeOperations._24.array.exit.7:
# Phi connections
  li t6, 0
  j .F.performBPlusTreeOperations._25.while.cond.0                      # ir inst 86 fin
.F.performBPlusTreeOperations._25.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 88 fin
  bnez t5, .F.performBPlusTreeOperations._26.lazy.then.0
  j .F.performBPlusTreeOperations._27.lazy.else.0                       # ir inst 89 fin
.F.performBPlusTreeOperations._26.lazy.then.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 90 fin
# Phi connections
  j .F.performBPlusTreeOperations._28.lazy.exit.0                       # ir inst 91 fin
.F.performBPlusTreeOperations._27.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.performBPlusTreeOperations._28.lazy.exit.0                       # ir inst 92 fin
.F.performBPlusTreeOperations._28.lazy.exit.0:
  bnez t5, .F.performBPlusTreeOperations._29.while.body.0
  j .F.performBPlusTreeOperations._30.while.exit.0                      # ir inst 94 fin
.F.performBPlusTreeOperations._29.while.body.0:
  mv t5, t6                                                             # ir inst 95 fin
  slli t2, t5, 2
  li t1, 9512
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 96 fin
  li t2, 17
  mul t5, t6, t2                                                        # ir inst 97 fin
  addi t3, t5, 23                                                       # ir inst 98 fin
  li t2, 997
  rem t5, t3, t2                                                        # ir inst 99 fin
  addi t3, t5, 1                                                        # ir inst 100 fin
  sw t3, 0(t4)                                                          # ir inst 101 fin
  addi t5, t6, 1                                                        # ir inst 102 fin
# Phi connections
  mv t6, t5
  j .F.performBPlusTreeOperations._25.while.cond.0                      # ir inst 103 fin
.F.performBPlusTreeOperations._30.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.performBPlusTreeOperations._31.while.cond.1                      # ir inst 104 fin
.F.performBPlusTreeOperations._31.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 107 fin
  bnez t4, .F.performBPlusTreeOperations._32.lazy.then.1
  j .F.performBPlusTreeOperations._33.lazy.else.1                       # ir inst 108 fin
.F.performBPlusTreeOperations._32.lazy.then.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 109 fin
# Phi connections
  j .F.performBPlusTreeOperations._34.lazy.exit.1                       # ir inst 110 fin
.F.performBPlusTreeOperations._33.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.performBPlusTreeOperations._34.lazy.exit.1                       # ir inst 111 fin
.F.performBPlusTreeOperations._34.lazy.exit.1:
  bnez t4, .F.performBPlusTreeOperations._35.while.body.1
  j .F.performBPlusTreeOperations._90.while.exit.1                      # ir inst 113 fin
.F.performBPlusTreeOperations._35.while.body.1:
  mv t4, t5                                                             # ir inst 114 fin
  slli t2, t4, 2
  li t1, 9512
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 115 fin
  lw t4, 0(t3)                                                          # ir inst 116 fin
# Phi connections
  li t3, 0
  j .F.performBPlusTreeOperations._36.while.cond.2                      # ir inst 117 fin
.F.performBPlusTreeOperations._36.while.cond.2:
  mv s11, t3                                                            # ir inst 119 fin
  li t1, 9012
  add t1, sp, t1
  add s10, t1, s11                                                      # ir inst 120 fin
  lb s11, 0(s10)                                                        # ir inst 121 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 122 fin
  bnez s10, .F.performBPlusTreeOperations._37.while.body.2
  j .F.performBPlusTreeOperations._44.while.exit.2                      # ir inst 123 fin
.F.performBPlusTreeOperations._37.while.body.2:
# Phi connections
  li s10, 0
  li s11, 0
  j .F.performBPlusTreeOperations._38.while.cond.3                      # ir inst 124 fin
.F.performBPlusTreeOperations._38.while.cond.3:
  mv s9, t3                                                             # ir inst 127 fin
  slli t2, s9, 2
  li t1, 9112
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 128 fin
  lw s9, 0(s8)                                                          # ir inst 129 fin
  slt s8, s10, s9                                                       # ir inst 130 fin
  bnez s8, .F.performBPlusTreeOperations._39.while.body.3
  j .F.performBPlusTreeOperations._43.while.exit.3                      # ir inst 131 fin
.F.performBPlusTreeOperations._39.while.body.3:
  mv s9, t3                                                             # ir inst 132 fin
  li t1, 40
  mul t2, s9, t1
  addi t1, sp, 128
  add s8, t1, t2                                                        # ir inst 133 fin
  mv s9, s10                                                            # ir inst 134 fin
  slli t2, s9, 2
  add s7, s8, t2                                                        # ir inst 135 fin
  lw s9, 0(s7)                                                          # ir inst 136 fin
  slt s8, s9, t4                                                        # ir inst 137 fin
  bnez s8, .F.performBPlusTreeOperations._40.if.then.0
  j .F.performBPlusTreeOperations._41.if.else.0                         # ir inst 138 fin
.F.performBPlusTreeOperations._40.if.then.0:
  addi s9, s10, 1                                                       # ir inst 139 fin
# Phi connections
  j .F.performBPlusTreeOperations._42.if.exit.0                         # ir inst 140 fin
.F.performBPlusTreeOperations._41.if.else.0:
# Phi connections
  mv s9, s11
  j .F.performBPlusTreeOperations._42.if.exit.0                         # ir inst 141 fin
.F.performBPlusTreeOperations._42.if.exit.0:
  addi s8, s10, 1                                                       # ir inst 143 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F.performBPlusTreeOperations._38.while.cond.3                      # ir inst 144 fin
.F.performBPlusTreeOperations._43.while.exit.3:
  mv s10, t3                                                            # ir inst 145 fin
  li t1, 44
  mul t2, s10, t1
  li t1, 4168
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 146 fin
  mv s10, s11                                                           # ir inst 147 fin
  slli t2, s10, 2
  add s11, s9, t2                                                       # ir inst 148 fin
  lw s10, 0(s11)                                                        # ir inst 149 fin
# Phi connections
  mv t3, s10
  j .F.performBPlusTreeOperations._36.while.cond.2                      # ir inst 150 fin
.F.performBPlusTreeOperations._44.while.exit.2:
  mv s11, t3                                                            # ir inst 151 fin
  slli t2, s11, 2
  li t1, 9112
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 152 fin
  lw s11, 0(s10)                                                        # ir inst 153 fin
  li t2, 9
  slt s10, s11, t2                                                      # ir inst 154 fin
  bnez s10, .F.performBPlusTreeOperations._45.if.then.1
  j .F.performBPlusTreeOperations._55.if.else.1                         # ir inst 155 fin
.F.performBPlusTreeOperations._45.if.then.1:
  mv s11, t3                                                            # ir inst 156 fin
  slli t2, s11, 2
  li t1, 9112
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 157 fin
  lw s11, 0(s10)                                                        # ir inst 158 fin
# Phi connections
  li s10, 0
  j .F.performBPlusTreeOperations._46.while.cond.4                      # ir inst 159 fin
.F.performBPlusTreeOperations._46.while.cond.4:
  mv s9, t3                                                             # ir inst 161 fin
  slli t2, s9, 2
  li t1, 9112
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 162 fin
  lw s9, 0(s8)                                                          # ir inst 163 fin
  slt s8, s10, s9                                                       # ir inst 164 fin
  bnez s8, .F.performBPlusTreeOperations._47.while.body.4
  j .F.performBPlusTreeOperations._97.critical_edge.0                   # ir inst 165 fin
.F.performBPlusTreeOperations._47.while.body.4:
  mv s9, t3                                                             # ir inst 166 fin
  li t1, 40
  mul t2, s9, t1
  addi t1, sp, 128
  add s8, t1, t2                                                        # ir inst 167 fin
  mv s9, s10                                                            # ir inst 168 fin
  slli t2, s9, 2
  add s7, s8, t2                                                        # ir inst 169 fin
  lw s9, 0(s7)                                                          # ir inst 170 fin
  slt s8, t4, s9                                                        # ir inst 171 fin
  bnez s8, .F.performBPlusTreeOperations._48.if.then.2
  j .F.performBPlusTreeOperations._49.if.else.2                         # ir inst 172 fin
.F.performBPlusTreeOperations._48.if.then.2:
# Phi connections
  j .F.performBPlusTreeOperations._51.while.exit.4                      # ir inst 173 fin
.F.performBPlusTreeOperations._49.if.else.2:
  j .F.performBPlusTreeOperations._50.if.exit.2                         # ir inst 174 fin
.F.performBPlusTreeOperations._50.if.exit.2:
  addi s9, s10, 1                                                       # ir inst 175 fin
# Phi connections
  mv s10, s9
  j .F.performBPlusTreeOperations._46.while.cond.4                      # ir inst 176 fin
.F.performBPlusTreeOperations._51.while.exit.4:
  mv s9, t3                                                             # ir inst 178 fin
  slli t2, s9, 2
  li t1, 9112
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 179 fin
  lw s9, 0(s8)                                                          # ir inst 180 fin
# Phi connections
  j .F.performBPlusTreeOperations._52.while.cond.5                      # ir inst 181 fin
.F.performBPlusTreeOperations._52.while.cond.5:
  slt s8, s10, s9                                                       # ir inst 183 fin
  bnez s8, .F.performBPlusTreeOperations._53.while.body.5
  j .F.performBPlusTreeOperations._54.while.exit.5                      # ir inst 184 fin
.F.performBPlusTreeOperations._53.while.body.5:
  mv s8, t3                                                             # ir inst 185 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 186 fin
  mv s8, s9                                                             # ir inst 187 fin
  slli t2, s8, 2
  add s6, s7, t2                                                        # ir inst 188 fin
  mv s8, t3                                                             # ir inst 189 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 190 fin
  mv s8, s9                                                             # ir inst 191 fin
  addi s5, s8, -1                                                       # ir inst 192 fin
  slli t2, s5, 2
  add s8, s7, t2                                                        # ir inst 193 fin
  lw s7, 0(s8)                                                          # ir inst 194 fin
  sw s7, 0(s6)                                                          # ir inst 195 fin
  addi s8, s9, -1                                                       # ir inst 196 fin
# Phi connections
  mv s9, s8
  j .F.performBPlusTreeOperations._52.while.cond.5                      # ir inst 197 fin
.F.performBPlusTreeOperations._54.while.exit.5:
  mv s9, t3                                                             # ir inst 198 fin
  li t1, 40
  mul t2, s9, t1
  addi t1, sp, 128
  add s8, t1, t2                                                        # ir inst 199 fin
  mv s9, s10                                                            # ir inst 200 fin
  slli t2, s9, 2
  add s10, s8, t2                                                       # ir inst 201 fin
  sw t4, 0(s10)                                                         # ir inst 202 fin
  mv s10, t3                                                            # ir inst 203 fin
  slli t2, s10, 2
  li t1, 9112
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 204 fin
  mv s10, t3                                                            # ir inst 205 fin
  slli t2, s10, 2
  li t1, 9112
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 206 fin
  lw s10, 0(s8)                                                         # ir inst 207 fin
  addi s8, s10, 1                                                       # ir inst 208 fin
  sw s8, 0(s9)                                                          # ir inst 209 fin
# Phi connections
  mv s7, t6
  j .F.performBPlusTreeOperations._89.if.exit.1                         # ir inst 210 fin
.F.performBPlusTreeOperations._55.if.else.1:
  li t2, 99
  slt s10, t6, t2                                                       # ir inst 211 fin
  bnez s10, .F.performBPlusTreeOperations._56.if.then.3
  j .F.performBPlusTreeOperations._87.if.else.3                         # ir inst 212 fin
.F.performBPlusTreeOperations._56.if.then.3:
  addi s10, t6, 1                                                       # ir inst 213 fin
  mv s9, t6                                                             # ir inst 214 fin
  li t1, 9012
  add t1, sp, t1
  add s8, t1, s9                                                        # ir inst 215 fin
  li t1, 1
  sb t1, 0(s8)                                                          # ir inst 216 fin
  mv s9, t6                                                             # ir inst 217 fin
  slli t2, s9, 2
  li t1, 9112
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 218 fin
  li t1, 5
  sw t1, 0(s8)                                                          # ir inst 219 fin
  mv s9, t6                                                             # ir inst 220 fin
  slli t2, s9, 2
  li t1, 8612
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 221 fin
  mv s9, t3                                                             # ir inst 222 fin
  slli t2, s9, 2
  li t1, 8612
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 223 fin
  lw s9, 0(s7)                                                          # ir inst 224 fin
  sw s9, 0(s8)                                                          # ir inst 225 fin
# Phi connections
  li s9, 0
  j .F.performBPlusTreeOperations._57.while.cond.6                      # ir inst 226 fin
.F.performBPlusTreeOperations._57.while.cond.6:
  li t2, 5
  slt s8, s9, t2                                                        # ir inst 228 fin
  bnez s8, .F.performBPlusTreeOperations._58.while.body.6
  j .F.performBPlusTreeOperations._59.while.exit.6                      # ir inst 229 fin
.F.performBPlusTreeOperations._58.while.body.6:
  mv s8, t6                                                             # ir inst 230 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 231 fin
  mv s8, s9                                                             # ir inst 232 fin
  slli t2, s8, 2
  add s6, s7, t2                                                        # ir inst 233 fin
  mv s8, t3                                                             # ir inst 234 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 235 fin
  mv s8, s9                                                             # ir inst 236 fin
  addi s5, s8, 5                                                        # ir inst 237 fin
  slli t2, s5, 2
  add s8, s7, t2                                                        # ir inst 238 fin
  lw s7, 0(s8)                                                          # ir inst 239 fin
  sw s7, 0(s6)                                                          # ir inst 240 fin
  mv s8, t3                                                             # ir inst 241 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 242 fin
  mv s8, s9                                                             # ir inst 243 fin
  addi s6, s8, 5                                                        # ir inst 244 fin
  slli t2, s6, 2
  add s8, s7, t2                                                        # ir inst 245 fin
  li t1, 0
  sw t1, 0(s8)                                                          # ir inst 246 fin
  addi s8, s9, 1                                                        # ir inst 247 fin
# Phi connections
  mv s9, s8
  j .F.performBPlusTreeOperations._57.while.cond.6                      # ir inst 248 fin
.F.performBPlusTreeOperations._59.while.exit.6:
  mv s9, t3                                                             # ir inst 249 fin
  slli t2, s9, 2
  li t1, 9112
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 250 fin
  li t1, 5
  sw t1, 0(s8)                                                          # ir inst 251 fin
  mv s9, t6                                                             # ir inst 252 fin
  li t1, 40
  mul t2, s9, t1
  addi t1, sp, 128
  add s8, t1, t2                                                        # ir inst 253 fin
  addi s9, s8, 0                                                        # ir inst 254 fin
  lw s8, 0(s9)                                                          # ir inst 255 fin
  slt s9, t4, s8                                                        # ir inst 256 fin
  bnez s9, .F.performBPlusTreeOperations._60.if.then.4
  j .F.performBPlusTreeOperations._73.if.else.4                         # ir inst 257 fin
.F.performBPlusTreeOperations._60.if.then.4:
# Phi connections
  li s9, 0
  j .F.performBPlusTreeOperations._61.while.cond.7                      # ir inst 258 fin
.F.performBPlusTreeOperations._61.while.cond.7:
  li t2, 5
  slt s8, s9, t2                                                        # ir inst 260 fin
  bnez s8, .F.performBPlusTreeOperations._62.while.body.7
  j .F.performBPlusTreeOperations._98.critical_edge.1                   # ir inst 261 fin
.F.performBPlusTreeOperations._62.while.body.7:
  mv s8, t3                                                             # ir inst 262 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 263 fin
  mv s8, s9                                                             # ir inst 264 fin
  slli t2, s8, 2
  add s6, s7, t2                                                        # ir inst 265 fin
  lw s8, 0(s6)                                                          # ir inst 266 fin
  slt s7, t4, s8                                                        # ir inst 267 fin
  bnez s7, .F.performBPlusTreeOperations._63.if.then.5
  j .F.performBPlusTreeOperations._64.if.else.5                         # ir inst 268 fin
.F.performBPlusTreeOperations._63.if.then.5:
# Phi connections
  j .F.performBPlusTreeOperations._66.while.exit.7                      # ir inst 269 fin
.F.performBPlusTreeOperations._64.if.else.5:
  j .F.performBPlusTreeOperations._65.if.exit.5                         # ir inst 270 fin
.F.performBPlusTreeOperations._65.if.exit.5:
  addi s8, s9, 1                                                        # ir inst 271 fin
# Phi connections
  mv s9, s8
  j .F.performBPlusTreeOperations._61.while.cond.7                      # ir inst 272 fin
.F.performBPlusTreeOperations._66.while.exit.7:
# Phi connections
  li s8, 4
  j .F.performBPlusTreeOperations._67.while.cond.8                      # ir inst 274 fin
.F.performBPlusTreeOperations._67.while.cond.8:
  slt t0, s8, s9
  xori s7, t0, 1                                                        # ir inst 276 fin
  bnez s7, .F.performBPlusTreeOperations._68.while.body.8
  j .F.performBPlusTreeOperations._99.critical_edge.2                   # ir inst 277 fin
.F.performBPlusTreeOperations._68.while.body.8:
  mv s7, t3                                                             # ir inst 278 fin
  li t1, 40
  mul t2, s7, t1
  addi t1, sp, 128
  add s6, t1, t2                                                        # ir inst 279 fin
  mv s7, s8                                                             # ir inst 280 fin
  addi s5, s7, 1                                                        # ir inst 281 fin
  slli t2, s5, 2
  add s7, s6, t2                                                        # ir inst 282 fin
  mv s6, t3                                                             # ir inst 283 fin
  li t1, 40
  mul t2, s6, t1
  addi t1, sp, 128
  add s5, t1, t2                                                        # ir inst 284 fin
  mv s6, s8                                                             # ir inst 285 fin
  slli t2, s6, 2
  add s0, s5, t2                                                        # ir inst 286 fin
  lw s6, 0(s0)                                                          # ir inst 287 fin
  sw s6, 0(s7)                                                          # ir inst 288 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 289 fin
  bnez s7, .F.performBPlusTreeOperations._69.if.then.6
  j .F.performBPlusTreeOperations._70.if.else.6                         # ir inst 290 fin
.F.performBPlusTreeOperations._69.if.then.6:
  j .F.performBPlusTreeOperations._72.while.exit.8                      # ir inst 291 fin
.F.performBPlusTreeOperations._70.if.else.6:
  j .F.performBPlusTreeOperations._71.if.exit.6                         # ir inst 292 fin
.F.performBPlusTreeOperations._71.if.exit.6:
  addi s7, s8, -1                                                       # ir inst 293 fin
# Phi connections
  mv s8, s7
  j .F.performBPlusTreeOperations._67.while.cond.8                      # ir inst 294 fin
.F.performBPlusTreeOperations._72.while.exit.8:
  mv s8, t3                                                             # ir inst 295 fin
  li t1, 40
  mul t2, s8, t1
  addi t1, sp, 128
  add s7, t1, t2                                                        # ir inst 296 fin
  mv s8, s9                                                             # ir inst 297 fin
  slli t2, s8, 2
  add s6, s7, t2                                                        # ir inst 298 fin
  sw t4, 0(s6)                                                          # ir inst 299 fin
  j .F.performBPlusTreeOperations._86.if.exit.4                         # ir inst 300 fin
.F.performBPlusTreeOperations._73.if.else.4:
# Phi connections
  li s8, 0
  j .F.performBPlusTreeOperations._74.while.cond.9                      # ir inst 301 fin
.F.performBPlusTreeOperations._74.while.cond.9:
  li t2, 5
  slt s7, s8, t2                                                        # ir inst 303 fin
  bnez s7, .F.performBPlusTreeOperations._75.while.body.9
  j .F.performBPlusTreeOperations._100.critical_edge.3                  # ir inst 304 fin
.F.performBPlusTreeOperations._75.while.body.9:
  mv s7, t6                                                             # ir inst 305 fin
  li t1, 40
  mul t2, s7, t1
  addi t1, sp, 128
  add s6, t1, t2                                                        # ir inst 306 fin
  mv s7, s8                                                             # ir inst 307 fin
  slli t2, s7, 2
  add s5, s6, t2                                                        # ir inst 308 fin
  lw s7, 0(s5)                                                          # ir inst 309 fin
  slt s6, t4, s7                                                        # ir inst 310 fin
  bnez s6, .F.performBPlusTreeOperations._76.if.then.7
  j .F.performBPlusTreeOperations._77.if.else.7                         # ir inst 311 fin
.F.performBPlusTreeOperations._76.if.then.7:
# Phi connections
  j .F.performBPlusTreeOperations._79.while.exit.9                      # ir inst 312 fin
.F.performBPlusTreeOperations._77.if.else.7:
  j .F.performBPlusTreeOperations._78.if.exit.7                         # ir inst 313 fin
.F.performBPlusTreeOperations._78.if.exit.7:
  addi s7, s8, 1                                                        # ir inst 314 fin
# Phi connections
  mv s8, s7
  j .F.performBPlusTreeOperations._74.while.cond.9                      # ir inst 315 fin
.F.performBPlusTreeOperations._79.while.exit.9:
# Phi connections
  li s7, 4
  j .F.performBPlusTreeOperations._80.while.cond.10                     # ir inst 317 fin
.F.performBPlusTreeOperations._80.while.cond.10:
  slt t0, s7, s8
  xori s6, t0, 1                                                        # ir inst 319 fin
  bnez s6, .F.performBPlusTreeOperations._81.while.body.10
  j .F.performBPlusTreeOperations._101.critical_edge.4                  # ir inst 320 fin
.F.performBPlusTreeOperations._81.while.body.10:
  mv s6, t6                                                             # ir inst 321 fin
  li t1, 40
  mul t2, s6, t1
  addi t1, sp, 128
  add s5, t1, t2                                                        # ir inst 322 fin
  mv s6, s7                                                             # ir inst 323 fin
  addi s0, s6, 1                                                        # ir inst 324 fin
  slli t2, s0, 2
  add s6, s5, t2                                                        # ir inst 325 fin
  mv s5, t6                                                             # ir inst 326 fin
  li t1, 40
  mul t2, s5, t1
  addi t1, sp, 128
  add s0, t1, t2                                                        # ir inst 327 fin
  mv s5, s7                                                             # ir inst 328 fin
  slli t2, s5, 2
  add s1, s0, t2                                                        # ir inst 329 fin
  lw s5, 0(s1)                                                          # ir inst 330 fin
  sw s5, 0(s6)                                                          # ir inst 331 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 332 fin
  bnez s6, .F.performBPlusTreeOperations._82.if.then.8
  j .F.performBPlusTreeOperations._83.if.else.8                         # ir inst 333 fin
.F.performBPlusTreeOperations._82.if.then.8:
  j .F.performBPlusTreeOperations._85.while.exit.10                     # ir inst 334 fin
.F.performBPlusTreeOperations._83.if.else.8:
  j .F.performBPlusTreeOperations._84.if.exit.8                         # ir inst 335 fin
.F.performBPlusTreeOperations._84.if.exit.8:
  addi s6, s7, -1                                                       # ir inst 336 fin
# Phi connections
  mv s7, s6
  j .F.performBPlusTreeOperations._80.while.cond.10                     # ir inst 337 fin
.F.performBPlusTreeOperations._85.while.exit.10:
  mv s7, t6                                                             # ir inst 338 fin
  li t1, 40
  mul t2, s7, t1
  addi t1, sp, 128
  add s6, t1, t2                                                        # ir inst 339 fin
  mv s7, s8                                                             # ir inst 340 fin
  slli t2, s7, 2
  add s5, s6, t2                                                        # ir inst 341 fin
  sw t4, 0(s5)                                                          # ir inst 342 fin
  mv s7, t6                                                             # ir inst 343 fin
  slli t2, s7, 2
  li t1, 9112
  add t1, sp, t1
  add s6, t1, t2                                                        # ir inst 344 fin
  li t1, 6
  sw t1, 0(s6)                                                          # ir inst 345 fin
  j .F.performBPlusTreeOperations._86.if.exit.4                         # ir inst 346 fin
.F.performBPlusTreeOperations._86.if.exit.4:
# Phi connections
  mv s7, s10
  j .F.performBPlusTreeOperations._88.if.exit.3                         # ir inst 347 fin
.F.performBPlusTreeOperations._87.if.else.3:
# Phi connections
  mv s7, t6
  j .F.performBPlusTreeOperations._88.if.exit.3                         # ir inst 348 fin
.F.performBPlusTreeOperations._88.if.exit.3:
# Phi connections
  j .F.performBPlusTreeOperations._89.if.exit.1                         # ir inst 350 fin
.F.performBPlusTreeOperations._89.if.exit.1:
  addi s6, t5, 1                                                        # ir inst 352 fin
# Phi connections
  mv t5, s6
  mv t6, s7
  j .F.performBPlusTreeOperations._31.while.cond.1                      # ir inst 353 fin
.F.performBPlusTreeOperations._90.while.exit.1:
# Phi connections
  li s5, 0
  li s6, 0
  li s7, 0
  j .F.performBPlusTreeOperations._91.while.cond.11                     # ir inst 354 fin
.F.performBPlusTreeOperations._91.while.cond.11:
  li t2, 20
  slt s0, s5, t2                                                        # ir inst 358 fin
  bnez s0, .F.performBPlusTreeOperations._92.lazy.then.2
  j .F.performBPlusTreeOperations._93.lazy.else.2                       # ir inst 359 fin
.F.performBPlusTreeOperations._92.lazy.then.2:
  li t2, 100
  slt s0, s7, t2                                                        # ir inst 360 fin
# Phi connections
  j .F.performBPlusTreeOperations._94.lazy.exit.2                       # ir inst 361 fin
.F.performBPlusTreeOperations._93.lazy.else.2:
# Phi connections
  li s0, 0
  j .F.performBPlusTreeOperations._94.lazy.exit.2                       # ir inst 362 fin
.F.performBPlusTreeOperations._94.lazy.exit.2:
  bnez s0, .F.performBPlusTreeOperations._95.while.body.11
  j .F.performBPlusTreeOperations._96.while.exit.11                     # ir inst 364 fin
.F.performBPlusTreeOperations._95.while.body.11:
  li t2, 13
  mul s0, s5, t2                                                        # ir inst 365 fin
  addi s1, s0, 7                                                        # ir inst 366 fin
  li t2, 500
  rem s0, s1, t2                                                        # ir inst 367 fin
  addi s1, s0, 1                                                        # ir inst 368 fin
  li t2, 3
  mul s0, s5, t2                                                        # ir inst 369 fin
  addi a1, s0, 1                                                        # ir inst 370 fin
  li t2, 50
  rem s0, a1, t2                                                        # ir inst 371 fin
  add a1, s1, s0                                                        # ir inst 372 fin
  addi s0, a1, 10                                                       # ir inst 373 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a6, s0
  mv a5, s1
  li a4, 0
  li t1, 9112
  add t1, sp, t1
  mv a3, t1
  li t1, 9012
  add t1, sp, t1
  mv a2, t1
  li t1, 4168
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 128
  mv a0, t1
  call .F.performRangeQuery
  mv a1, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 374 fin
  add s0, s6, a1                                                        # ir inst 375 fin
  addi s1, s7, 1                                                        # ir inst 376 fin
  addi s7, s5, 1                                                        # ir inst 377 fin
# Phi connections
  mv s5, s7
  mv s6, s0
  mv s7, s1
  j .F.performBPlusTreeOperations._91.while.cond.11                     # ir inst 378 fin
.F.performBPlusTreeOperations._96.while.exit.11:
  li t2, 10000
  rem s7, s6, t2                                                        # ir inst 379 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s7
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 380 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a0, 26002
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 381 fin
  j .F.performBPlusTreeOperations.epilogue                              # ir inst 382 fin
.F.performBPlusTreeOperations._97.critical_edge.0:
# Phi connections
  mv s10, s11
  j .F.performBPlusTreeOperations._51.while.exit.4                      # ir inst 383 fin
.F.performBPlusTreeOperations._98.critical_edge.1:
# Phi connections
  li s9, 5
  j .F.performBPlusTreeOperations._66.while.exit.7                      # ir inst 384 fin
.F.performBPlusTreeOperations._99.critical_edge.2:
  j .F.performBPlusTreeOperations._72.while.exit.8                      # ir inst 385 fin
.F.performBPlusTreeOperations._100.critical_edge.3:
# Phi connections
  li s8, 5
  j .F.performBPlusTreeOperations._79.while.exit.9                      # ir inst 386 fin
.F.performBPlusTreeOperations._101.critical_edge.4:
  j .F.performBPlusTreeOperations._85.while.exit.10                     # ir inst 387 fin
.F.performBPlusTreeOperations.epilogue:
  ld ra, 120(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  ld s9, 64(sp)
  ld s8, 72(sp)
  ld s5, 80(sp)
  ld s0, 88(sp)
  ld s6, 96(sp)
  ld s1, 104(sp)
  ld s7, 112(sp)
  li t0, 9920
  add sp, sp, t0
  ret

.globl .F.performRangeQuery
.F.performRangeQuery:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 1 / 12,        range:       88(sp) -       96(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.performRangeQuery._0.entry.0:
  mv t6, a4                                                             # ir inst 1 fin
  add t5, a2, t6                                                        # ir inst 2 fin
  lb t6, 0(t5)                                                          # ir inst 3 fin
  bnez t6, .F.performRangeQuery._1.if.then.0
  j .F.performRangeQuery._11.if.else.0                                  # ir inst 4 fin
.F.performRangeQuery._1.if.then.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performRangeQuery._2.while.cond.0                                # ir inst 5 fin
.F.performRangeQuery._2.while.cond.0:
  mv t4, a4                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 9 fin
  lw t4, 0(t3)                                                          # ir inst 10 fin
  slt t3, t6, t4                                                        # ir inst 11 fin
  bnez t3, .F.performRangeQuery._3.while.body.0
  j .F.performRangeQuery._10.while.exit.0                               # ir inst 12 fin
.F.performRangeQuery._3.while.body.0:
  mv t4, a4                                                             # ir inst 13 fin
  li t1, 40
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 14 fin
  mv t4, t6                                                             # ir inst 15 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 16 fin
  lw t4, 0(s11)                                                         # ir inst 17 fin
  slt t0, t4, a5
  xori t3, t0, 1                                                        # ir inst 18 fin
  bnez t3, .F.performRangeQuery._4.lazy.then.0
  j .F.performRangeQuery._5.lazy.else.0                                 # ir inst 19 fin
.F.performRangeQuery._4.lazy.then.0:
  mv t4, a4                                                             # ir inst 20 fin
  li t1, 40
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 21 fin
  mv t4, t6                                                             # ir inst 22 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 23 fin
  lw t4, 0(s11)                                                         # ir inst 24 fin
  slt t0, a6, t4
  xori t3, t0, 1                                                        # ir inst 25 fin
# Phi connections
  mv t4, t3
  j .F.performRangeQuery._6.lazy.exit.0                                 # ir inst 26 fin
.F.performRangeQuery._5.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performRangeQuery._6.lazy.exit.0                                 # ir inst 27 fin
.F.performRangeQuery._6.lazy.exit.0:
  bnez t4, .F.performRangeQuery._7.if.then.1
  j .F.performRangeQuery._8.if.else.1                                   # ir inst 29 fin
.F.performRangeQuery._7.if.then.1:
  mv t4, a4                                                             # ir inst 30 fin
  li t1, 40
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 31 fin
  mv t4, t6                                                             # ir inst 32 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 33 fin
  lw t4, 0(s11)                                                         # ir inst 34 fin
  add t3, t5, t4                                                        # ir inst 35 fin
# Phi connections
  mv t4, t3
  j .F.performRangeQuery._9.if.exit.1                                   # ir inst 36 fin
.F.performRangeQuery._8.if.else.1:
# Phi connections
  mv t4, t5
  j .F.performRangeQuery._9.if.exit.1                                   # ir inst 37 fin
.F.performRangeQuery._9.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performRangeQuery._2.while.cond.0                                # ir inst 40 fin
.F.performRangeQuery._10.while.exit.0:
# Phi connections
  mv t6, t5
  j .F.performRangeQuery._21.if.exit.0                                  # ir inst 41 fin
.F.performRangeQuery._11.if.else.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performRangeQuery._12.while.cond.1                               # ir inst 42 fin
.F.performRangeQuery._12.while.cond.1:
  mv t4, a4                                                             # ir inst 45 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 46 fin
  lw t4, 0(t3)                                                          # ir inst 47 fin
  slt t0, t4, t5
  xori t3, t0, 1                                                        # ir inst 48 fin
  bnez t3, .F.performRangeQuery._13.while.body.1
  j .F.performRangeQuery._20.while.exit.1                               # ir inst 49 fin
.F.performRangeQuery._13.while.body.1:
  mv t4, a4                                                             # ir inst 50 fin
  li t1, 44
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 51 fin
  mv t4, t5                                                             # ir inst 52 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 53 fin
  lw t4, 0(s11)                                                         # ir inst 54 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 55 fin
  bnez t3, .F.performRangeQuery._14.lazy.then.1
  j .F.performRangeQuery._15.lazy.else.1                                # ir inst 56 fin
.F.performRangeQuery._14.lazy.then.1:
  mv t4, a4                                                             # ir inst 57 fin
  li t1, 44
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 58 fin
  mv t4, t5                                                             # ir inst 59 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 60 fin
  lw t4, 0(s11)                                                         # ir inst 61 fin
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 62 fin
# Phi connections
  mv t4, t3
  j .F.performRangeQuery._16.lazy.exit.1                                # ir inst 63 fin
.F.performRangeQuery._15.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.performRangeQuery._16.lazy.exit.1                                # ir inst 64 fin
.F.performRangeQuery._16.lazy.exit.1:
  bnez t4, .F.performRangeQuery._17.if.then.2
  j .F.performRangeQuery._18.if.else.2                                  # ir inst 66 fin
.F.performRangeQuery._17.if.then.2:
  mv t4, a4                                                             # ir inst 67 fin
  li t1, 44
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 68 fin
  mv t4, t5                                                             # ir inst 69 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 70 fin
  lw t4, 0(s11)                                                         # ir inst 71 fin
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
  mv a4, t4
  call .F.performRangeQuery
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
# ir inst 72 fin
  add t4, t6, t3                                                        # ir inst 73 fin
# Phi connections
  j .F.performRangeQuery._19.if.exit.2                                  # ir inst 74 fin
.F.performRangeQuery._18.if.else.2:
# Phi connections
  mv t4, t6
  j .F.performRangeQuery._19.if.exit.2                                  # ir inst 75 fin
.F.performRangeQuery._19.if.exit.2:
  addi t3, t5, 1                                                        # ir inst 77 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performRangeQuery._12.while.cond.1                               # ir inst 78 fin
.F.performRangeQuery._20.while.exit.1:
# Phi connections
  j .F.performRangeQuery._21.if.exit.0                                  # ir inst 79 fin
.F.performRangeQuery._21.if.exit.0:
  mv a0, t6
  j .F.performRangeQuery.epilogue                                       # ir inst 81 fin
.F.performRangeQuery.epilogue:
  ld ra, 96(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.performQueryExecutionTest
.F.performQueryExecutionTest:
# spill func args num: 0,             range:     5536(sp) -     5536(sp)
# local var size: 5440,               range:       88(sp) -     5528(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 6 / 12,        range:       32(sp) -       80(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5536
  add sp, sp, t0
  sd s6, 32(sp)
  sd s7, 40(sp)
  sd s9, 48(sp)
  sd s8, 56(sp)
  sd s11, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
.F.performQueryExecutionTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 26003
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 88
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performQueryExecutionTest._1.array.cond.0                        # ir inst 4 fin
.F.performQueryExecutionTest._1.array.cond.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performQueryExecutionTest._2.array.body.0
  j .F.performQueryExecutionTest._3.array.exit.0                        # ir inst 7 fin
.F.performQueryExecutionTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performQueryExecutionTest._1.array.cond.0                        # ir inst 11 fin
.F.performQueryExecutionTest._3.array.exit.0:
  addi t1, sp, 888
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performQueryExecutionTest._4.array.cond.1                        # ir inst 14 fin
.F.performQueryExecutionTest._4.array.cond.1:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performQueryExecutionTest._5.array.body.1
  j .F.performQueryExecutionTest._6.array.exit.1                        # ir inst 17 fin
.F.performQueryExecutionTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performQueryExecutionTest._4.array.cond.1                        # ir inst 21 fin
.F.performQueryExecutionTest._6.array.exit.1:
  addi t1, sp, 1688
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performQueryExecutionTest._7.array.cond.2                        # ir inst 24 fin
.F.performQueryExecutionTest._7.array.cond.2:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performQueryExecutionTest._8.array.body.2
  j .F.performQueryExecutionTest._9.array.exit.2                        # ir inst 27 fin
.F.performQueryExecutionTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performQueryExecutionTest._7.array.cond.2                        # ir inst 31 fin
.F.performQueryExecutionTest._9.array.exit.2:
  li t1, 2488
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.performQueryExecutionTest._10.array.cond.3                       # ir inst 34 fin
.F.performQueryExecutionTest._10.array.cond.3:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.performQueryExecutionTest._11.array.body.3
  j .F.performQueryExecutionTest._12.array.exit.3                       # ir inst 37 fin
.F.performQueryExecutionTest._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.performQueryExecutionTest._10.array.cond.3                       # ir inst 41 fin
.F.performQueryExecutionTest._12.array.exit.3:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performQueryExecutionTest._13.while.cond.0                       # ir inst 42 fin
.F.performQueryExecutionTest._13.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 45 fin
  bnez t4, .F.performQueryExecutionTest._14.lazy.then.0
  j .F.performQueryExecutionTest._15.lazy.else.0                        # ir inst 46 fin
.F.performQueryExecutionTest._14.lazy.then.0:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 47 fin
# Phi connections
  j .F.performQueryExecutionTest._16.lazy.exit.0                        # ir inst 48 fin
.F.performQueryExecutionTest._15.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performQueryExecutionTest._16.lazy.exit.0                        # ir inst 49 fin
.F.performQueryExecutionTest._16.lazy.exit.0:
  bnez t4, .F.performQueryExecutionTest._17.while.body.0
  j .F.performQueryExecutionTest._18.while.exit.0                       # ir inst 51 fin
.F.performQueryExecutionTest._17.while.body.0:
  mv t4, t6                                                             # ir inst 52 fin
  slli t2, t4, 2
  addi t1, sp, 88
  add t3, t1, t2                                                        # ir inst 53 fin
  li t2, 3
  mul t4, t6, t2                                                        # ir inst 54 fin
  addi s11, t4, 1                                                       # ir inst 55 fin
  li t2, 150
  rem t4, s11, t2                                                       # ir inst 56 fin
  addi s11, t4, 1                                                       # ir inst 57 fin
  sw s11, 0(t3)                                                         # ir inst 58 fin
  mv t4, t6                                                             # ir inst 59 fin
  slli t2, t4, 2
  addi t1, sp, 888
  add t3, t1, t2                                                        # ir inst 60 fin
  li t2, 7
  mul t4, t6, t2                                                        # ir inst 61 fin
  addi s11, t4, 11                                                      # ir inst 62 fin
  li t2, 1000
  rem t4, s11, t2                                                       # ir inst 63 fin
  addi s11, t4, 1                                                       # ir inst 64 fin
  sw s11, 0(t3)                                                         # ir inst 65 fin
  addi t4, t5, 1                                                        # ir inst 66 fin
  addi t3, t6, 1                                                        # ir inst 67 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.performQueryExecutionTest._13.while.cond.0                       # ir inst 68 fin
.F.performQueryExecutionTest._18.while.exit.0:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.performQueryExecutionTest._19.while.cond.1                       # ir inst 69 fin
.F.performQueryExecutionTest._19.while.cond.1:
  slt t3, t6, a0                                                        # ir inst 72 fin
  bnez t3, .F.performQueryExecutionTest._20.lazy.then.1
  j .F.performQueryExecutionTest._21.lazy.else.1                        # ir inst 73 fin
.F.performQueryExecutionTest._20.lazy.then.1:
  li t2, 200
  slt t3, t6, t2                                                        # ir inst 74 fin
# Phi connections
  j .F.performQueryExecutionTest._22.lazy.exit.1                        # ir inst 75 fin
.F.performQueryExecutionTest._21.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.performQueryExecutionTest._22.lazy.exit.1                        # ir inst 76 fin
.F.performQueryExecutionTest._22.lazy.exit.1:
  bnez t3, .F.performQueryExecutionTest._23.while.body.1
  j .F.performQueryExecutionTest._24.while.exit.1                       # ir inst 78 fin
.F.performQueryExecutionTest._23.while.body.1:
  mv t3, t6                                                             # ir inst 79 fin
  slli t2, t3, 2
  addi t1, sp, 1688
  add s11, t1, t2                                                       # ir inst 80 fin
  li t2, 5
  mul t3, t6, t2                                                        # ir inst 81 fin
  addi s10, t3, 3                                                       # ir inst 82 fin
  li t2, 180
  rem t3, s10, t2                                                       # ir inst 83 fin
  addi s10, t3, 1                                                       # ir inst 84 fin
  sw s10, 0(s11)                                                        # ir inst 85 fin
  mv t3, t6                                                             # ir inst 86 fin
  slli t2, t3, 2
  li t1, 2488
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 87 fin
  li t2, 11
  mul t3, t6, t2                                                        # ir inst 88 fin
  addi s10, t3, 13                                                      # ir inst 89 fin
  li t2, 1200
  rem t3, s10, t2                                                       # ir inst 90 fin
  addi s10, t3, 1                                                       # ir inst 91 fin
  sw s10, 0(s11)                                                        # ir inst 92 fin
  addi t3, t4, 1                                                        # ir inst 93 fin
  addi s11, t6, 1                                                       # ir inst 94 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.performQueryExecutionTest._19.while.cond.1                       # ir inst 95 fin
.F.performQueryExecutionTest._24.while.exit.1:
# Phi connections
  li t3, 0
  li t6, 0
  j .F.performQueryExecutionTest._25.while.cond.2                       # ir inst 96 fin
.F.performQueryExecutionTest._25.while.cond.2:
  slt s11, t6, t5                                                       # ir inst 99 fin
  bnez s11, .F.performQueryExecutionTest._26.while.body.2
  j .F.performQueryExecutionTest._33.while.exit.2                       # ir inst 100 fin
.F.performQueryExecutionTest._26.while.body.2:
# Phi connections
  mv s10, t3
  li s11, 0
  j .F.performQueryExecutionTest._27.while.cond.3                       # ir inst 101 fin
.F.performQueryExecutionTest._27.while.cond.3:
  slt s9, s11, t4                                                       # ir inst 104 fin
  bnez s9, .F.performQueryExecutionTest._28.while.body.3
  j .F.performQueryExecutionTest._32.while.exit.3                       # ir inst 105 fin
.F.performQueryExecutionTest._28.while.body.3:
  mv s9, t6                                                             # ir inst 106 fin
  slli t2, s9, 2
  addi t1, sp, 88
  add s8, t1, t2                                                        # ir inst 107 fin
  lw s9, 0(s8)                                                          # ir inst 108 fin
  mv s8, s11                                                            # ir inst 109 fin
  slli t2, s8, 2
  addi t1, sp, 1688
  add s7, t1, t2                                                        # ir inst 110 fin
  lw s8, 0(s7)                                                          # ir inst 111 fin
  xor t0, s9, s8
  sltiu s7, t0, 1                                                       # ir inst 112 fin
  bnez s7, .F.performQueryExecutionTest._29.if.then.0
  j .F.performQueryExecutionTest._30.if.else.0                          # ir inst 113 fin
.F.performQueryExecutionTest._29.if.then.0:
  mv s9, t6                                                             # ir inst 114 fin
  slli t2, s9, 2
  addi t1, sp, 888
  add s8, t1, t2                                                        # ir inst 115 fin
  lw s9, 0(s8)                                                          # ir inst 116 fin
  add s8, s10, s9                                                       # ir inst 117 fin
  mv s9, s11                                                            # ir inst 118 fin
  slli t2, s9, 2
  li t1, 2488
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 119 fin
  lw s9, 0(s7)                                                          # ir inst 120 fin
  add s7, s8, s9                                                        # ir inst 121 fin
# Phi connections
  mv s9, s7
  j .F.performQueryExecutionTest._31.if.exit.0                          # ir inst 122 fin
.F.performQueryExecutionTest._30.if.else.0:
# Phi connections
  mv s9, s10
  j .F.performQueryExecutionTest._31.if.exit.0                          # ir inst 123 fin
.F.performQueryExecutionTest._31.if.exit.0:
  addi s8, s11, 1                                                       # ir inst 125 fin
# Phi connections
  mv s10, s9
  mv s11, s8
  j .F.performQueryExecutionTest._27.while.cond.3                       # ir inst 126 fin
.F.performQueryExecutionTest._32.while.exit.3:
  addi s11, t6, 1                                                       # ir inst 127 fin
# Phi connections
  mv t3, s10
  mv t6, s11
  j .F.performQueryExecutionTest._25.while.cond.2                       # ir inst 128 fin
.F.performQueryExecutionTest._33.while.exit.2:
  li t2, 10000
  rem t6, t3, t2                                                        # ir inst 129 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 130 fin
  li t1, 4288
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 133 fin
# Phi connections
  li t3, 0
  j .F.performQueryExecutionTest._34.array.cond.4                       # ir inst 134 fin
.F.performQueryExecutionTest._34.array.cond.4:
  li t2, 5
  slt s11, t3, t2                                                       # ir inst 136 fin
  bnez s11, .F.performQueryExecutionTest._35.array.body.4
  j .F.performQueryExecutionTest._36.array.exit.4                       # ir inst 137 fin
.F.performQueryExecutionTest._35.array.body.4:
  slli t2, t3, 2
  add s11, t6, t2                                                       # ir inst 138 fin
  li t1, -1
  sw t1, 0(s11)                                                         # ir inst 139 fin
  addi s11, t3, 1                                                       # ir inst 140 fin
# Phi connections
  mv t3, s11
  j .F.performQueryExecutionTest._34.array.cond.4                       # ir inst 141 fin
.F.performQueryExecutionTest._36.array.exit.4:
  li t1, 3288
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 142 fin
# Phi connections
  li t3, 0
  j .F.performQueryExecutionTest._37.array.cond.5                       # ir inst 143 fin
.F.performQueryExecutionTest._37.array.cond.5:
  li t2, 50
  slt s11, t3, t2                                                       # ir inst 145 fin
  bnez s11, .F.performQueryExecutionTest._38.array.body.5
  j .F.performQueryExecutionTest._39.array.exit.5                       # ir inst 146 fin
.F.performQueryExecutionTest._38.array.body.5:
  li t1, 20
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 147 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  li t1, 4288
  add t1, sp, t1
  mv a1, t1
  mv a0, s11
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 148 fin
  addi s11, t3, 1                                                       # ir inst 149 fin
# Phi connections
  mv t3, s11
  j .F.performQueryExecutionTest._37.array.cond.5                       # ir inst 150 fin
.F.performQueryExecutionTest._39.array.exit.5:
  li t1, 5308
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 153 fin
# Phi connections
  li t3, 0
  j .F.performQueryExecutionTest._40.array.cond.6                       # ir inst 154 fin
.F.performQueryExecutionTest._40.array.cond.6:
  li t2, 5
  slt s11, t3, t2                                                       # ir inst 156 fin
  bnez s11, .F.performQueryExecutionTest._41.array.body.6
  j .F.performQueryExecutionTest._42.array.exit.6                       # ir inst 157 fin
.F.performQueryExecutionTest._41.array.body.6:
  slli t2, t3, 2
  add s11, t6, t2                                                       # ir inst 158 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 159 fin
  addi s11, t3, 1                                                       # ir inst 160 fin
# Phi connections
  mv t3, s11
  j .F.performQueryExecutionTest._40.array.cond.6                       # ir inst 161 fin
.F.performQueryExecutionTest._42.array.exit.6:
  li t1, 4308
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 162 fin
# Phi connections
  li t3, 0
  j .F.performQueryExecutionTest._43.array.cond.7                       # ir inst 163 fin
.F.performQueryExecutionTest._43.array.cond.7:
  li t2, 50
  slt s11, t3, t2                                                       # ir inst 165 fin
  bnez s11, .F.performQueryExecutionTest._44.array.body.7
  j .F.performQueryExecutionTest._45.array.exit.7                       # ir inst 166 fin
.F.performQueryExecutionTest._44.array.body.7:
  li t1, 20
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 167 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  li t1, 5308
  add t1, sp, t1
  mv a1, t1
  mv a0, s11
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 168 fin
  addi s11, t3, 1                                                       # ir inst 169 fin
# Phi connections
  mv t3, s11
  j .F.performQueryExecutionTest._43.array.cond.7                       # ir inst 170 fin
.F.performQueryExecutionTest._45.array.exit.7:
  li t1, 5328
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 172 fin
# Phi connections
  li t3, 0
  j .F.performQueryExecutionTest._46.array.cond.8                       # ir inst 173 fin
.F.performQueryExecutionTest._46.array.cond.8:
  li t2, 50
  slt s11, t3, t2                                                       # ir inst 175 fin
  bnez s11, .F.performQueryExecutionTest._47.array.body.8
  j .F.performQueryExecutionTest._48.array.exit.8                       # ir inst 176 fin
.F.performQueryExecutionTest._47.array.body.8:
  slli t2, t3, 2
  add s11, t6, t2                                                       # ir inst 177 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 178 fin
  addi s11, t3, 1                                                       # ir inst 179 fin
# Phi connections
  mv t3, s11
  j .F.performQueryExecutionTest._46.array.cond.8                       # ir inst 180 fin
.F.performQueryExecutionTest._48.array.exit.8:
# Phi connections
  li t6, 0
  j .F.performQueryExecutionTest._49.while.cond.4                       # ir inst 181 fin
.F.performQueryExecutionTest._49.while.cond.4:
  slt t3, t6, t5                                                        # ir inst 183 fin
  bnez t3, .F.performQueryExecutionTest._50.while.body.4
  j .F.performQueryExecutionTest._54.while.exit.4                       # ir inst 184 fin
.F.performQueryExecutionTest._50.while.body.4:
  mv t3, t6                                                             # ir inst 185 fin
  slli t2, t3, 2
  addi t1, sp, 88
  add s11, t1, t2                                                       # ir inst 186 fin
  lw t3, 0(s11)                                                         # ir inst 187 fin
  li t2, 50
  rem s11, t3, t2                                                       # ir inst 188 fin
  mv t3, s11                                                            # ir inst 189 fin
  slli t2, t3, 2
  li t1, 5328
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 190 fin
  lw t3, 0(s10)                                                         # ir inst 191 fin
  li t2, 5
  slt s10, t3, t2                                                       # ir inst 192 fin
  bnez s10, .F.performQueryExecutionTest._51.if.then.1
  j .F.performQueryExecutionTest._52.if.else.1                          # ir inst 193 fin
.F.performQueryExecutionTest._51.if.then.1:
  mv t3, s11                                                            # ir inst 194 fin
  slli t2, t3, 2
  li t1, 5328
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 195 fin
  lw t3, 0(s10)                                                         # ir inst 196 fin
  mv s10, s11                                                           # ir inst 197 fin
  li t1, 20
  mul t2, s10, t1
  li t1, 3288
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 198 fin
  mv s10, t3                                                            # ir inst 199 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 200 fin
  mv s10, t6                                                            # ir inst 201 fin
  slli t2, s10, 2
  addi t1, sp, 88
  add s9, t1, t2                                                        # ir inst 202 fin
  lw s10, 0(s9)                                                         # ir inst 203 fin
  sw s10, 0(s8)                                                         # ir inst 204 fin
  mv s10, s11                                                           # ir inst 205 fin
  li t1, 20
  mul t2, s10, t1
  li t1, 4308
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 206 fin
  mv s10, t3                                                            # ir inst 207 fin
  slli t2, s10, 2
  add t3, s9, t2                                                        # ir inst 208 fin
  mv s10, t6                                                            # ir inst 209 fin
  slli t2, s10, 2
  addi t1, sp, 888
  add s9, t1, t2                                                        # ir inst 210 fin
  lw s10, 0(s9)                                                         # ir inst 211 fin
  sw s10, 0(t3)                                                         # ir inst 212 fin
  mv t3, s11                                                            # ir inst 213 fin
  slli t2, t3, 2
  li t1, 5328
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 214 fin
  mv t3, s11                                                            # ir inst 215 fin
  slli t2, t3, 2
  li t1, 5328
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 216 fin
  lw t3, 0(s11)                                                         # ir inst 217 fin
  addi s11, t3, 1                                                       # ir inst 218 fin
  sw s11, 0(s10)                                                        # ir inst 219 fin
  j .F.performQueryExecutionTest._53.if.exit.1                          # ir inst 220 fin
.F.performQueryExecutionTest._52.if.else.1:
  j .F.performQueryExecutionTest._53.if.exit.1                          # ir inst 221 fin
.F.performQueryExecutionTest._53.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 222 fin
# Phi connections
  mv t6, t3
  j .F.performQueryExecutionTest._49.while.cond.4                       # ir inst 223 fin
.F.performQueryExecutionTest._54.while.exit.4:
# Phi connections
  li t3, 0
  li t6, 0
  j .F.performQueryExecutionTest._55.while.cond.5                       # ir inst 224 fin
.F.performQueryExecutionTest._55.while.cond.5:
  slt s11, t6, t4                                                       # ir inst 227 fin
  bnez s11, .F.performQueryExecutionTest._56.while.body.5
  j .F.performQueryExecutionTest._63.while.exit.5                       # ir inst 228 fin
.F.performQueryExecutionTest._56.while.body.5:
  mv s11, t6                                                            # ir inst 229 fin
  slli t2, s11, 2
  addi t1, sp, 1688
  add s10, t1, t2                                                       # ir inst 230 fin
  lw s11, 0(s10)                                                        # ir inst 231 fin
  li t2, 50
  rem s10, s11, t2                                                      # ir inst 232 fin
# Phi connections
  mv s9, t3
  li s11, 0
  j .F.performQueryExecutionTest._57.while.cond.6                       # ir inst 233 fin
.F.performQueryExecutionTest._57.while.cond.6:
  mv s8, s10                                                            # ir inst 236 fin
  slli t2, s8, 2
  li t1, 5328
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 237 fin
  lw s8, 0(s7)                                                          # ir inst 238 fin
  slt s7, s11, s8                                                       # ir inst 239 fin
  bnez s7, .F.performQueryExecutionTest._58.while.body.6
  j .F.performQueryExecutionTest._62.while.exit.6                       # ir inst 240 fin
.F.performQueryExecutionTest._58.while.body.6:
  mv s8, s10                                                            # ir inst 241 fin
  li t1, 20
  mul t2, s8, t1
  li t1, 3288
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 242 fin
  mv s8, s11                                                            # ir inst 243 fin
  slli t2, s8, 2
  add s6, s7, t2                                                        # ir inst 244 fin
  lw s8, 0(s6)                                                          # ir inst 245 fin
  mv s7, t6                                                             # ir inst 246 fin
  slli t2, s7, 2
  addi t1, sp, 1688
  add s6, t1, t2                                                        # ir inst 247 fin
  lw s7, 0(s6)                                                          # ir inst 248 fin
  xor t0, s8, s7
  sltiu s6, t0, 1                                                       # ir inst 249 fin
  bnez s6, .F.performQueryExecutionTest._59.if.then.2
  j .F.performQueryExecutionTest._60.if.else.2                          # ir inst 250 fin
.F.performQueryExecutionTest._59.if.then.2:
  mv s8, s10                                                            # ir inst 251 fin
  li t1, 20
  mul t2, s8, t1
  li t1, 4308
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 252 fin
  mv s8, s11                                                            # ir inst 253 fin
  slli t2, s8, 2
  add s6, s7, t2                                                        # ir inst 254 fin
  lw s8, 0(s6)                                                          # ir inst 255 fin
  add s7, s9, s8                                                        # ir inst 256 fin
  mv s8, t6                                                             # ir inst 257 fin
  slli t2, s8, 2
  li t1, 2488
  add t1, sp, t1
  add s6, t1, t2                                                        # ir inst 258 fin
  lw s8, 0(s6)                                                          # ir inst 259 fin
  add s6, s7, s8                                                        # ir inst 260 fin
# Phi connections
  mv s8, s6
  j .F.performQueryExecutionTest._61.if.exit.2                          # ir inst 261 fin
.F.performQueryExecutionTest._60.if.else.2:
# Phi connections
  mv s8, s9
  j .F.performQueryExecutionTest._61.if.exit.2                          # ir inst 262 fin
.F.performQueryExecutionTest._61.if.exit.2:
  addi s7, s11, 1                                                       # ir inst 264 fin
# Phi connections
  mv s9, s8
  mv s11, s7
  j .F.performQueryExecutionTest._57.while.cond.6                       # ir inst 265 fin
.F.performQueryExecutionTest._62.while.exit.6:
  addi s11, t6, 1                                                       # ir inst 266 fin
# Phi connections
  mv t3, s9
  mv t6, s11
  j .F.performQueryExecutionTest._55.while.cond.5                       # ir inst 267 fin
.F.performQueryExecutionTest._63.while.exit.5:
  li t2, 10000
  rem t6, t3, t2                                                        # ir inst 268 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 269 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a2, t5
  addi t1, sp, 888
  mv a1, t1
  addi t1, sp, 88
  mv a0, t1
  call .F.performTableSort
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 270 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a2, t4
  li t1, 2488
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1688
  mv a0, t1
  call .F.performTableSort
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 271 fin
# Phi connections
  li s11, 0
  li t3, 0
  li t6, 0
  j .F.performQueryExecutionTest._64.while.cond.7                       # ir inst 272 fin
.F.performQueryExecutionTest._64.while.cond.7:
  slt s10, t3, t5                                                       # ir inst 276 fin
  bnez s10, .F.performQueryExecutionTest._65.lazy.then.2
  j .F.performQueryExecutionTest._66.lazy.else.2                        # ir inst 277 fin
.F.performQueryExecutionTest._65.lazy.then.2:
  slt s10, s11, t4                                                      # ir inst 278 fin
# Phi connections
  j .F.performQueryExecutionTest._67.lazy.exit.2                        # ir inst 279 fin
.F.performQueryExecutionTest._66.lazy.else.2:
# Phi connections
  li s10, 0
  j .F.performQueryExecutionTest._67.lazy.exit.2                        # ir inst 280 fin
.F.performQueryExecutionTest._67.lazy.exit.2:
  bnez s10, .F.performQueryExecutionTest._68.while.body.7
  j .F.performQueryExecutionTest._75.while.exit.7                       # ir inst 282 fin
.F.performQueryExecutionTest._68.while.body.7:
  mv s10, t3                                                            # ir inst 283 fin
  slli t2, s10, 2
  addi t1, sp, 88
  add s9, t1, t2                                                        # ir inst 284 fin
  lw s10, 0(s9)                                                         # ir inst 285 fin
  mv s9, s11                                                            # ir inst 286 fin
  slli t2, s9, 2
  addi t1, sp, 1688
  add s8, t1, t2                                                        # ir inst 287 fin
  lw s9, 0(s8)                                                          # ir inst 288 fin
  xor t0, s10, s9
  sltiu s8, t0, 1                                                       # ir inst 289 fin
  bnez s8, .F.performQueryExecutionTest._69.if.then.3
  j .F.performQueryExecutionTest._70.if.else.3                          # ir inst 290 fin
.F.performQueryExecutionTest._69.if.then.3:
  mv s10, t3                                                            # ir inst 291 fin
  slli t2, s10, 2
  addi t1, sp, 888
  add s9, t1, t2                                                        # ir inst 292 fin
  lw s10, 0(s9)                                                         # ir inst 293 fin
  add s9, t6, s10                                                       # ir inst 294 fin
  mv s10, s11                                                           # ir inst 295 fin
  slli t2, s10, 2
  li t1, 2488
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 296 fin
  lw s10, 0(s8)                                                         # ir inst 297 fin
  add s8, s9, s10                                                       # ir inst 298 fin
  addi s10, t3, 1                                                       # ir inst 299 fin
  addi s9, s11, 1                                                       # ir inst 300 fin
# Phi connections
  mv s11, s10
  mv t3, s8
  mv s10, s9
  j .F.performQueryExecutionTest._74.if.exit.3                          # ir inst 301 fin
.F.performQueryExecutionTest._70.if.else.3:
  mv s10, t3                                                            # ir inst 302 fin
  slli t2, s10, 2
  addi t1, sp, 88
  add s9, t1, t2                                                        # ir inst 303 fin
  lw s10, 0(s9)                                                         # ir inst 304 fin
  mv s9, s11                                                            # ir inst 305 fin
  slli t2, s9, 2
  addi t1, sp, 1688
  add s8, t1, t2                                                        # ir inst 306 fin
  lw s9, 0(s8)                                                          # ir inst 307 fin
  slt s8, s10, s9                                                       # ir inst 308 fin
  bnez s8, .F.performQueryExecutionTest._71.if.then.4
  j .F.performQueryExecutionTest._72.if.else.4                          # ir inst 309 fin
.F.performQueryExecutionTest._71.if.then.4:
  addi s10, t3, 1                                                       # ir inst 310 fin
# Phi connections
  mv t3, s10
  j .F.performQueryExecutionTest._73.if.exit.4                          # ir inst 311 fin
.F.performQueryExecutionTest._72.if.else.4:
  addi s10, s11, 1                                                      # ir inst 312 fin
# Phi connections
  mv s11, s10
  j .F.performQueryExecutionTest._73.if.exit.4                          # ir inst 313 fin
.F.performQueryExecutionTest._73.if.exit.4:
# Phi connections
  mv s10, s11
  mv s11, t3
  mv t3, t6
  j .F.performQueryExecutionTest._74.if.exit.3                          # ir inst 316 fin
.F.performQueryExecutionTest._74.if.exit.3:
# Phi connections
  mv t6, t3
  mv t3, s11
  mv s11, s10
  j .F.performQueryExecutionTest._64.while.cond.7                       # ir inst 320 fin
.F.performQueryExecutionTest._75.while.exit.7:
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 321 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 322 fin
# Start call preparation
  li a0, 26004
  call printlnInt
# ir inst 323 fin
  j .F.performQueryExecutionTest.epilogue                               # ir inst 324 fin
.F.performQueryExecutionTest.epilogue:
  ld ra, 80(sp)
  ld s6, 32(sp)
  ld s7, 40(sp)
  ld s9, 48(sp)
  ld s8, 56(sp)
  ld s11, 64(sp)
  ld s10, 72(sp)
  li t0, 5536
  add sp, sp, t0
  ret

.globl .F.performTableSort
.F.performTableSort:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.performTableSort._0.entry.0:
# Phi connections
  li t6, 0
  j .F.performTableSort._1.while.cond.0                                 # ir inst 1 fin
.F.performTableSort._1.while.cond.0:
  addi t5, a2, -1                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.performTableSort._2.while.body.0
  j .F.performTableSort._9.while.exit.0                                 # ir inst 5 fin
.F.performTableSort._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.performTableSort._3.while.cond.1                                 # ir inst 6 fin
.F.performTableSort._3.while.cond.1:
  addi t4, a2, -1                                                       # ir inst 8 fin
  sub t3, t4, t6                                                        # ir inst 9 fin
  slt t4, t5, t3                                                        # ir inst 10 fin
  bnez t4, .F.performTableSort._4.while.body.1
  j .F.performTableSort._8.while.exit.1                                 # ir inst 11 fin
.F.performTableSort._4.while.body.1:
  mv t4, t5                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  lw t4, 0(t3)                                                          # ir inst 14 fin
  mv t3, t5                                                             # ir inst 15 fin
  addi s11, t3, 1                                                       # ir inst 16 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 17 fin
  lw s11, 0(t3)                                                         # ir inst 18 fin
  slt t3, s11, t4                                                       # ir inst 19 fin
  bnez t3, .F.performTableSort._5.if.then.0
  j .F.performTableSort._6.if.else.0                                    # ir inst 20 fin
.F.performTableSort._5.if.then.0:
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  mv t3, t5                                                             # ir inst 24 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 25 fin
  mv t3, t5                                                             # ir inst 26 fin
  addi s10, t3, 1                                                       # ir inst 27 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 28 fin
  lw s10, 0(t3)                                                         # ir inst 29 fin
  sw s10, 0(s11)                                                        # ir inst 30 fin
  mv t3, t5                                                             # ir inst 31 fin
  addi s11, t3, 1                                                       # ir inst 32 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 33 fin
  sw t4, 0(t3)                                                          # ir inst 34 fin
  mv t4, t5                                                             # ir inst 35 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 36 fin
  lw t4, 0(t3)                                                          # ir inst 37 fin
  mv t3, t5                                                             # ir inst 38 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 39 fin
  mv t3, t5                                                             # ir inst 40 fin
  addi s10, t3, 1                                                       # ir inst 41 fin
  slli t2, s10, 2
  add t3, a1, t2                                                        # ir inst 42 fin
  lw s10, 0(t3)                                                         # ir inst 43 fin
  sw s10, 0(s11)                                                        # ir inst 44 fin
  mv t3, t5                                                             # ir inst 45 fin
  addi s11, t3, 1                                                       # ir inst 46 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 47 fin
  sw t4, 0(t3)                                                          # ir inst 48 fin
  j .F.performTableSort._7.if.exit.0                                    # ir inst 49 fin
.F.performTableSort._6.if.else.0:
  j .F.performTableSort._7.if.exit.0                                    # ir inst 50 fin
.F.performTableSort._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t5, t4
  j .F.performTableSort._3.while.cond.1                                 # ir inst 52 fin
.F.performTableSort._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t5
  j .F.performTableSort._1.while.cond.0                                 # ir inst 54 fin
.F.performTableSort._9.while.exit.0:
  j .F.performTableSort.epilogue                                        # ir inst 55 fin
.F.performTableSort.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.performTransactionProcessingTest
.F.performTransactionProcessingTest:
# spill func args num: 0,             range:     8224(sp) -     8224(sp)
# local var size: 8110,               range:      112(sp) -     8222(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 8 / 12,        range:       40(sp) -      104(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8224
  add sp, sp, t0
  sd s11, 40(sp)
  sd s0, 48(sp)
  sd s5, 56(sp)
  sd s10, 64(sp)
  sd s9, 72(sp)
  sd s7, 80(sp)
  sd s6, 88(sp)
  sd s8, 96(sp)
  sd ra, 104(sp)
.F.performTransactionProcessingTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 26005
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 112
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._1.array.cond.0                 # ir inst 4 fin
.F.performTransactionProcessingTest._1.array.cond.0:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performTransactionProcessingTest._2.array.body.0
  j .F.performTransactionProcessingTest._3.array.exit.0                 # ir inst 7 fin
.F.performTransactionProcessingTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._1.array.cond.0                 # ir inst 11 fin
.F.performTransactionProcessingTest._3.array.exit.0:
  addi t1, sp, 312
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._4.array.cond.1                 # ir inst 14 fin
.F.performTransactionProcessingTest._4.array.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performTransactionProcessingTest._5.array.body.1
  j .F.performTransactionProcessingTest._6.array.exit.1                 # ir inst 17 fin
.F.performTransactionProcessingTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._4.array.cond.1                 # ir inst 21 fin
.F.performTransactionProcessingTest._6.array.exit.1:
  li t1, 2512
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 24 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._7.array.cond.2                 # ir inst 25 fin
.F.performTransactionProcessingTest._7.array.cond.2:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.performTransactionProcessingTest._8.array.body.2
  j .F.performTransactionProcessingTest._9.array.exit.2                 # ir inst 28 fin
.F.performTransactionProcessingTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 29 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 30 fin
  addi t4, t5, 1                                                        # ir inst 31 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._7.array.cond.2                 # ir inst 32 fin
.F.performTransactionProcessingTest._9.array.exit.2:
  addi t1, sp, 512
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._10.array.cond.3                # ir inst 34 fin
.F.performTransactionProcessingTest._10.array.cond.3:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.performTransactionProcessingTest._11.array.body.3
  j .F.performTransactionProcessingTest._12.array.exit.3                # ir inst 37 fin
.F.performTransactionProcessingTest._11.array.body.3:
  li t1, 40
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 38 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 40
  li t1, 2512
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._10.array.cond.3                # ir inst 41 fin
.F.performTransactionProcessingTest._12.array.exit.3:
  li t1, 2552
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._13.array.cond.4                # ir inst 44 fin
.F.performTransactionProcessingTest._13.array.cond.4:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 46 fin
  bnez t4, .F.performTransactionProcessingTest._14.array.body.4
  j .F.performTransactionProcessingTest._15.array.exit.4                # ir inst 47 fin
.F.performTransactionProcessingTest._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 48 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 49 fin
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._13.array.cond.4                # ir inst 51 fin
.F.performTransactionProcessingTest._15.array.exit.4:
  li t1, 2752
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._16.array.cond.5                # ir inst 54 fin
.F.performTransactionProcessingTest._16.array.cond.5:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, .F.performTransactionProcessingTest._17.array.body.5
  j .F.performTransactionProcessingTest._18.array.exit.5                # ir inst 57 fin
.F.performTransactionProcessingTest._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 58 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._16.array.cond.5                # ir inst 61 fin
.F.performTransactionProcessingTest._18.array.exit.5:
  li t1, 5152
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 64 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._19.array.cond.6                # ir inst 65 fin
.F.performTransactionProcessingTest._19.array.cond.6:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 67 fin
  bnez t4, .F.performTransactionProcessingTest._20.array.body.6
  j .F.performTransactionProcessingTest._21.array.exit.6                # ir inst 68 fin
.F.performTransactionProcessingTest._20.array.body.6:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 69 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 70 fin
  addi t4, t5, 1                                                        # ir inst 71 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._19.array.cond.6                # ir inst 72 fin
.F.performTransactionProcessingTest._21.array.exit.6:
  li t1, 3152
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 73 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._22.array.cond.7                # ir inst 74 fin
.F.performTransactionProcessingTest._22.array.cond.7:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 76 fin
  bnez t4, .F.performTransactionProcessingTest._23.array.body.7
  j .F.performTransactionProcessingTest._24.array.exit.7                # ir inst 77 fin
.F.performTransactionProcessingTest._23.array.body.7:
  li t1, 20
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 78 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  li t1, 5152
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 79 fin
  addi t4, t5, 1                                                        # ir inst 80 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._22.array.cond.7                # ir inst 81 fin
.F.performTransactionProcessingTest._24.array.exit.7:
  li t1, 5172
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 83 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._25.array.cond.8                # ir inst 84 fin
.F.performTransactionProcessingTest._25.array.cond.8:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 86 fin
  bnez t4, .F.performTransactionProcessingTest._26.array.body.8
  j .F.performTransactionProcessingTest._27.array.exit.8                # ir inst 87 fin
.F.performTransactionProcessingTest._26.array.body.8:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 88 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 89 fin
  addi t4, t5, 1                                                        # ir inst 90 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._25.array.cond.8                # ir inst 91 fin
.F.performTransactionProcessingTest._27.array.exit.8:
  li t1, 8072
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 94 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._28.array.cond.9                # ir inst 95 fin
.F.performTransactionProcessingTest._28.array.cond.9:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 97 fin
  bnez t4, .F.performTransactionProcessingTest._29.array.body.9
  j .F.performTransactionProcessingTest._30.array.exit.9                # ir inst 98 fin
.F.performTransactionProcessingTest._29.array.body.9:
  add t4, t6, t5                                                        # ir inst 99 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 100 fin
  addi t4, t5, 1                                                        # ir inst 101 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._28.array.cond.9                # ir inst 102 fin
.F.performTransactionProcessingTest._30.array.exit.9:
  li t1, 5572
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 103 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._31.array.cond.10               # ir inst 104 fin
.F.performTransactionProcessingTest._31.array.cond.10:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 106 fin
  bnez t4, .F.performTransactionProcessingTest._32.array.body.10
  j .F.performTransactionProcessingTest._33.array.exit.10               # ir inst 107 fin
.F.performTransactionProcessingTest._32.array.body.10:
  li t1, 50
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 108 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 50
  li t1, 8072
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 109 fin
  addi t4, t5, 1                                                        # ir inst 110 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._31.array.cond.10               # ir inst 111 fin
.F.performTransactionProcessingTest._33.array.exit.10:
  li t1, 8122
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 113 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._34.array.cond.11               # ir inst 114 fin
.F.performTransactionProcessingTest._34.array.cond.11:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 116 fin
  bnez t4, .F.performTransactionProcessingTest._35.array.body.11
  j .F.performTransactionProcessingTest._36.array.exit.11               # ir inst 117 fin
.F.performTransactionProcessingTest._35.array.body.11:
  add t4, t6, t5                                                        # ir inst 118 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 119 fin
  addi t4, t5, 1                                                        # ir inst 120 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._34.array.cond.11               # ir inst 121 fin
.F.performTransactionProcessingTest._36.array.exit.11:
  li t1, 8172
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 123 fin
# Phi connections
  li t5, 0
  j .F.performTransactionProcessingTest._37.array.cond.12               # ir inst 124 fin
.F.performTransactionProcessingTest._37.array.cond.12:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 126 fin
  bnez t4, .F.performTransactionProcessingTest._38.array.body.12
  j .F.performTransactionProcessingTest._39.array.exit.12               # ir inst 127 fin
.F.performTransactionProcessingTest._38.array.body.12:
  add t4, t6, t5                                                        # ir inst 128 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 129 fin
  addi t4, t5, 1                                                        # ir inst 130 fin
# Phi connections
  mv t5, t4
  j .F.performTransactionProcessingTest._37.array.cond.12               # ir inst 131 fin
.F.performTransactionProcessingTest._39.array.exit.12:
# Phi connections
  li s11, 0
  li t3, 0
  li t4, 1
  li t5, 0
  li t6, 0
  j .F.performTransactionProcessingTest._40.while.cond.0                # ir inst 132 fin
.F.performTransactionProcessingTest._40.while.cond.0:
  li t2, 20
  slt s10, t3, t2                                                       # ir inst 138 fin
  bnez s10, .F.performTransactionProcessingTest._41.lazy.then.0
  j .F.performTransactionProcessingTest._42.lazy.else.0                 # ir inst 139 fin
.F.performTransactionProcessingTest._41.lazy.then.0:
  slt s10, t6, a0                                                       # ir inst 140 fin
# Phi connections
  j .F.performTransactionProcessingTest._43.lazy.exit.0                 # ir inst 141 fin
.F.performTransactionProcessingTest._42.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.performTransactionProcessingTest._43.lazy.exit.0                 # ir inst 142 fin
.F.performTransactionProcessingTest._43.lazy.exit.0:
  bnez s10, .F.performTransactionProcessingTest._44.while.body.0
  j .F.performTransactionProcessingTest._93.while.exit.0                # ir inst 144 fin
.F.performTransactionProcessingTest._44.while.body.0:
  li t2, 3
  rem s10, t3, t2                                                       # ir inst 145 fin
  addi s9, s10, 1                                                       # ir inst 146 fin
# Phi connections
  li s10, 0
  j .F.performTransactionProcessingTest._45.while.cond.1                # ir inst 147 fin
.F.performTransactionProcessingTest._45.while.cond.1:
  slt s8, s10, s9                                                       # ir inst 150 fin
  bnez s8, .F.performTransactionProcessingTest._46.lazy.then.1
  j .F.performTransactionProcessingTest._47.lazy.else.1                 # ir inst 151 fin
.F.performTransactionProcessingTest._46.lazy.then.1:
  slt s8, t6, a0                                                        # ir inst 152 fin
# Phi connections
  j .F.performTransactionProcessingTest._48.lazy.exit.1                 # ir inst 153 fin
.F.performTransactionProcessingTest._47.lazy.else.1:
# Phi connections
  li s8, 0
  j .F.performTransactionProcessingTest._48.lazy.exit.1                 # ir inst 154 fin
.F.performTransactionProcessingTest._48.lazy.exit.1:
  bnez s8, .F.performTransactionProcessingTest._49.while.body.1
  j .F.performTransactionProcessingTest._53.while.exit.1                # ir inst 156 fin
.F.performTransactionProcessingTest._49.while.body.1:
  li t2, 50
  slt s8, t6, t2                                                        # ir inst 157 fin
  bnez s8, .F.performTransactionProcessingTest._50.if.then.0
  j .F.performTransactionProcessingTest._51.if.else.0                   # ir inst 158 fin
.F.performTransactionProcessingTest._50.if.then.0:
  mv s8, t6                                                             # ir inst 159 fin
  slli t2, s8, 2
  addi t1, sp, 112
  add s7, t1, t2                                                        # ir inst 160 fin
  li t1, 1
  sw t1, 0(s7)                                                          # ir inst 161 fin
  mv s8, t6                                                             # ir inst 162 fin
  slli t2, s8, 2
  addi t1, sp, 312
  add s7, t1, t2                                                        # ir inst 163 fin
  sw t4, 0(s7)                                                          # ir inst 164 fin
  mv s8, t6                                                             # ir inst 165 fin
  slli t2, s8, 2
  li t1, 2552
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 166 fin
  li t1, 0
  sw t1, 0(s7)                                                          # ir inst 167 fin
  addi s8, t6, 1                                                        # ir inst 168 fin
# Phi connections
  j .F.performTransactionProcessingTest._52.if.exit.0                   # ir inst 169 fin
.F.performTransactionProcessingTest._51.if.else.0:
# Phi connections
  mv s8, t6
  j .F.performTransactionProcessingTest._52.if.exit.0                   # ir inst 170 fin
.F.performTransactionProcessingTest._52.if.exit.0:
  addi s7, s10, 1                                                       # ir inst 172 fin
# Phi connections
  mv s10, s7
  mv t6, s8
  j .F.performTransactionProcessingTest._45.while.cond.1                # ir inst 173 fin
.F.performTransactionProcessingTest._53.while.exit.1:
# Phi connections
  li s10, 0
  j .F.performTransactionProcessingTest._54.while.cond.2                # ir inst 174 fin
.F.performTransactionProcessingTest._54.while.cond.2:
  slt s9, s10, t6                                                       # ir inst 176 fin
  bnez s9, .F.performTransactionProcessingTest._55.while.body.2
  j .F.performTransactionProcessingTest._74.while.exit.2                # ir inst 177 fin
.F.performTransactionProcessingTest._55.while.body.2:
  mv s9, s10                                                            # ir inst 178 fin
  slli t2, s9, 2
  addi t1, sp, 112
  add s8, t1, t2                                                        # ir inst 179 fin
  lw s9, 0(s8)                                                          # ir inst 180 fin
  li t2, 1
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 181 fin
  bnez s8, .F.performTransactionProcessingTest._56.if.then.1
  j .F.performTransactionProcessingTest._72.if.else.1                   # ir inst 182 fin
.F.performTransactionProcessingTest._56.if.then.1:
  add s9, s10, t3                                                       # ir inst 183 fin
  li t2, 3
  rem s8, s9, t2                                                        # ir inst 184 fin
  addi s9, s8, 1                                                        # ir inst 185 fin
# Phi connections
  li s8, 0
  j .F.performTransactionProcessingTest._57.while.cond.3                # ir inst 186 fin
.F.performTransactionProcessingTest._57.while.cond.3:
  slt s7, s8, s9                                                        # ir inst 188 fin
  bnez s7, .F.performTransactionProcessingTest._58.lazy.then.2
  j .F.performTransactionProcessingTest._59.lazy.else.2                 # ir inst 189 fin
.F.performTransactionProcessingTest._58.lazy.then.2:
  mv s7, s10                                                            # ir inst 190 fin
  slli t2, s7, 2
  li t1, 2552
  add t1, sp, t1
  add s6, t1, t2                                                        # ir inst 191 fin
  lw s7, 0(s6)                                                          # ir inst 192 fin
  li t2, 10
  slt s6, s7, t2                                                        # ir inst 193 fin
# Phi connections
  mv s7, s6
  j .F.performTransactionProcessingTest._60.lazy.exit.2                 # ir inst 194 fin
.F.performTransactionProcessingTest._59.lazy.else.2:
# Phi connections
  li s7, 0
  j .F.performTransactionProcessingTest._60.lazy.exit.2                 # ir inst 195 fin
.F.performTransactionProcessingTest._60.lazy.exit.2:
  bnez s7, .F.performTransactionProcessingTest._61.while.body.3
  j .F.performTransactionProcessingTest._71.while.exit.3                # ir inst 197 fin
.F.performTransactionProcessingTest._61.while.body.3:
  li t2, 7
  mul s7, s10, t2                                                       # ir inst 198 fin
  li t2, 11
  mul s6, s8, t2                                                        # ir inst 199 fin
  add s5, s7, s6                                                        # ir inst 200 fin
  li t2, 3
  mul s7, t3, t2                                                        # ir inst 201 fin
  add s6, s5, s7                                                        # ir inst 202 fin
  li t2, 100
  rem s7, s6, t2                                                        # ir inst 203 fin
  mv s6, s7                                                             # ir inst 204 fin
  slli t2, s6, 2
  li t1, 2752
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 205 fin
  lw s6, 0(s5)                                                          # ir inst 206 fin
  li t2, -1
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 207 fin
  bnez s5, .F.performTransactionProcessingTest._62.if.then.2
  j .F.performTransactionProcessingTest._63.if.else.2                   # ir inst 208 fin
.F.performTransactionProcessingTest._62.if.then.2:
  mv s6, s7                                                             # ir inst 209 fin
  slli t2, s6, 2
  li t1, 2752
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 210 fin
  sw s10, 0(s5)                                                         # ir inst 211 fin
  mv s6, s10                                                            # ir inst 212 fin
  li t1, 40
  mul t2, s6, t1
  addi t1, sp, 512
  add s5, t1, t2                                                        # ir inst 213 fin
  mv s6, s10                                                            # ir inst 214 fin
  slli t2, s6, 2
  li t1, 2552
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 215 fin
  lw s6, 0(s0)                                                          # ir inst 216 fin
  mv s0, s6                                                             # ir inst 217 fin
  slli t2, s0, 2
  add s6, s5, t2                                                        # ir inst 218 fin
  sw s7, 0(s6)                                                          # ir inst 219 fin
  mv s6, s10                                                            # ir inst 220 fin
  slli t2, s6, 2
  li t1, 2552
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 221 fin
  mv s6, s10                                                            # ir inst 222 fin
  slli t2, s6, 2
  li t1, 2552
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 223 fin
  lw s6, 0(s0)                                                          # ir inst 224 fin
  addi s0, s6, 1                                                        # ir inst 225 fin
  sw s0, 0(s5)                                                          # ir inst 226 fin
  j .F.performTransactionProcessingTest._70.if.exit.2                   # ir inst 227 fin
.F.performTransactionProcessingTest._63.if.else.2:
  mv s6, s7                                                             # ir inst 228 fin
  slli t2, s6, 2
  li t1, 2752
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 229 fin
  lw s6, 0(s5)                                                          # ir inst 230 fin
  xor t0, s6, s10
  sltu s5, zero, t0                                                     # ir inst 231 fin
  bnez s5, .F.performTransactionProcessingTest._64.if.then.3
  j .F.performTransactionProcessingTest._68.if.else.3                   # ir inst 232 fin
.F.performTransactionProcessingTest._64.if.then.3:
  mv s6, s7                                                             # ir inst 233 fin
  slli t2, s6, 2
  li t1, 5172
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 234 fin
  lw s6, 0(s5)                                                          # ir inst 235 fin
  li t2, 5
  slt s5, s6, t2                                                        # ir inst 236 fin
  bnez s5, .F.performTransactionProcessingTest._65.if.then.4
  j .F.performTransactionProcessingTest._66.if.else.4                   # ir inst 237 fin
.F.performTransactionProcessingTest._65.if.then.4:
  mv s6, s7                                                             # ir inst 238 fin
  li t1, 20
  mul t2, s6, t1
  li t1, 3152
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 239 fin
  mv s6, s7                                                             # ir inst 240 fin
  slli t2, s6, 2
  li t1, 5172
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 241 fin
  lw s6, 0(s0)                                                          # ir inst 242 fin
  mv s0, s6                                                             # ir inst 243 fin
  slli t2, s0, 2
  add s6, s5, t2                                                        # ir inst 244 fin
  sw s10, 0(s6)                                                         # ir inst 245 fin
  mv s6, s7                                                             # ir inst 246 fin
  slli t2, s6, 2
  li t1, 5172
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 247 fin
  mv s6, s7                                                             # ir inst 248 fin
  slli t2, s6, 2
  li t1, 5172
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 249 fin
  lw s6, 0(s0)                                                          # ir inst 250 fin
  addi s0, s6, 1                                                        # ir inst 251 fin
  sw s0, 0(s5)                                                          # ir inst 252 fin
  mv s6, s10                                                            # ir inst 253 fin
  li t1, 50
  mul t2, s6, t1
  li t1, 5572
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 254 fin
  mv s6, s7                                                             # ir inst 255 fin
  slli t2, s6, 2
  li t1, 2752
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 256 fin
  lw s6, 0(s7)                                                          # ir inst 257 fin
  mv s7, s6                                                             # ir inst 258 fin
  add s6, s5, s7                                                        # ir inst 259 fin
  li t1, 1
  sb t1, 0(s6)                                                          # ir inst 260 fin
  j .F.performTransactionProcessingTest._67.if.exit.4                   # ir inst 261 fin
.F.performTransactionProcessingTest._66.if.else.4:
  j .F.performTransactionProcessingTest._67.if.exit.4                   # ir inst 262 fin
.F.performTransactionProcessingTest._67.if.exit.4:
  j .F.performTransactionProcessingTest._69.if.exit.3                   # ir inst 263 fin
.F.performTransactionProcessingTest._68.if.else.3:
  j .F.performTransactionProcessingTest._69.if.exit.3                   # ir inst 264 fin
.F.performTransactionProcessingTest._69.if.exit.3:
  j .F.performTransactionProcessingTest._70.if.exit.2                   # ir inst 265 fin
.F.performTransactionProcessingTest._70.if.exit.2:
  addi s7, s8, 1                                                        # ir inst 266 fin
# Phi connections
  mv s8, s7
  j .F.performTransactionProcessingTest._57.while.cond.3                # ir inst 267 fin
.F.performTransactionProcessingTest._71.while.exit.3:
  j .F.performTransactionProcessingTest._73.if.exit.1                   # ir inst 268 fin
.F.performTransactionProcessingTest._72.if.else.1:
  j .F.performTransactionProcessingTest._73.if.exit.1                   # ir inst 269 fin
.F.performTransactionProcessingTest._73.if.exit.1:
  addi s9, s10, 1                                                       # ir inst 270 fin
# Phi connections
  mv s10, s9
  j .F.performTransactionProcessingTest._54.while.cond.2                # ir inst 271 fin
.F.performTransactionProcessingTest._74.while.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a3, t6
  li t1, 8172
  add t1, sp, t1
  mv a2, t1
  li t1, 8122
  add t1, sp, t1
  mv a1, t1
  li t1, 5572
  add t1, sp, t1
  mv a0, t1
  call .F.detectDeadlock
  mv s10, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 272 fin
  bnez s10, .F.performTransactionProcessingTest._75.if.then.5
  j .F.performTransactionProcessingTest._79.if.else.5                   # ir inst 273 fin
.F.performTransactionProcessingTest._75.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a3, t4
  mv a2, t6
  addi t1, sp, 112
  mv a1, t1
  addi t1, sp, 312
  mv a0, t1
  call .F.findVictimTransaction
  mv s10, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 274 fin
  li t2, 0
  slt t0, s10, t2
  xori s9, t0, 1                                                        # ir inst 275 fin
  bnez s9, .F.performTransactionProcessingTest._76.if.then.6
  j .F.performTransactionProcessingTest._77.if.else.6                   # ir inst 276 fin
.F.performTransactionProcessingTest._76.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li t1, 5572
  add t1, sp, t1
  mv a7, t1
  li t1, 5172
  add t1, sp, t1
  mv a6, t1
  li t1, 3152
  add t1, sp, t1
  mv a5, t1
  li t1, 2752
  add t1, sp, t1
  mv a4, t1
  li t1, 2552
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 512
  mv a2, t1
  addi t1, sp, 112
  mv a1, t1
  mv a0, s10
  call .F.abortTransaction
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 277 fin
  addi s10, t5, 1                                                       # ir inst 278 fin
# Phi connections
  j .F.performTransactionProcessingTest._78.if.exit.6                   # ir inst 279 fin
.F.performTransactionProcessingTest._77.if.else.6:
# Phi connections
  mv s10, t5
  j .F.performTransactionProcessingTest._78.if.exit.6                   # ir inst 280 fin
.F.performTransactionProcessingTest._78.if.exit.6:
# Phi connections
  j .F.performTransactionProcessingTest._80.if.exit.5                   # ir inst 282 fin
.F.performTransactionProcessingTest._79.if.else.5:
# Phi connections
  mv s10, t5
  j .F.performTransactionProcessingTest._80.if.exit.5                   # ir inst 283 fin
.F.performTransactionProcessingTest._80.if.exit.5:
# Phi connections
  li s8, 0
  mv s9, s11
  j .F.performTransactionProcessingTest._81.while.cond.4                # ir inst 285 fin
.F.performTransactionProcessingTest._81.while.cond.4:
  slt s7, s8, t6                                                        # ir inst 288 fin
  bnez s7, .F.performTransactionProcessingTest._82.while.body.4
  j .F.performTransactionProcessingTest._92.while.exit.4                # ir inst 289 fin
.F.performTransactionProcessingTest._82.while.body.4:
  mv s7, s8                                                             # ir inst 290 fin
  slli t2, s7, 2
  addi t1, sp, 112
  add s6, t1, t2                                                        # ir inst 291 fin
  lw s7, 0(s6)                                                          # ir inst 292 fin
  li t2, 1
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 293 fin
  bnez s6, .F.performTransactionProcessingTest._83.lazy.then.3
  j .F.performTransactionProcessingTest._84.lazy.else.3                 # ir inst 294 fin
.F.performTransactionProcessingTest._83.lazy.then.3:
  mv s7, s8                                                             # ir inst 295 fin
  slli t2, s7, 2
  addi t1, sp, 312
  add s6, t1, t2                                                        # ir inst 296 fin
  lw s7, 0(s6)                                                          # ir inst 297 fin
  sub s6, t4, s7                                                        # ir inst 298 fin
  li t2, 3
  slt s7, t2, s6                                                        # ir inst 299 fin
# Phi connections
  j .F.performTransactionProcessingTest._85.lazy.exit.3                 # ir inst 300 fin
.F.performTransactionProcessingTest._84.lazy.else.3:
# Phi connections
  li s7, 0
  j .F.performTransactionProcessingTest._85.lazy.exit.3                 # ir inst 301 fin
.F.performTransactionProcessingTest._85.lazy.exit.3:
  bnez s7, .F.performTransactionProcessingTest._86.if.then.7
  j .F.performTransactionProcessingTest._90.if.else.7                   # ir inst 303 fin
.F.performTransactionProcessingTest._86.if.then.7:
  add s7, s8, t3                                                        # ir inst 304 fin
  li t2, 4
  rem s6, s7, t2                                                        # ir inst 305 fin
  li t2, 0
  xor t0, s6, t2
  sltiu s7, t0, 1                                                       # ir inst 306 fin
  bnez s7, .F.performTransactionProcessingTest._87.if.then.8
  j .F.performTransactionProcessingTest._88.if.else.8                   # ir inst 307 fin
.F.performTransactionProcessingTest._87.if.then.8:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li t1, 5172
  add t1, sp, t1
  mv a6, t1
  li t1, 3152
  add t1, sp, t1
  mv a5, t1
  li t1, 2752
  add t1, sp, t1
  mv a4, t1
  li t1, 2552
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 512
  mv a2, t1
  addi t1, sp, 112
  mv a1, t1
  mv a0, s8
  call .F.commitTransaction
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 308 fin
  addi s7, s9, 1                                                        # ir inst 309 fin
# Phi connections
  j .F.performTransactionProcessingTest._89.if.exit.8                   # ir inst 310 fin
.F.performTransactionProcessingTest._88.if.else.8:
# Phi connections
  mv s7, s9
  j .F.performTransactionProcessingTest._89.if.exit.8                   # ir inst 311 fin
.F.performTransactionProcessingTest._89.if.exit.8:
# Phi connections
  j .F.performTransactionProcessingTest._91.if.exit.7                   # ir inst 313 fin
.F.performTransactionProcessingTest._90.if.else.7:
# Phi connections
  mv s7, s9
  j .F.performTransactionProcessingTest._91.if.exit.7                   # ir inst 314 fin
.F.performTransactionProcessingTest._91.if.exit.7:
  addi s6, s8, 1                                                        # ir inst 316 fin
# Phi connections
  mv s8, s6
  mv s9, s7
  j .F.performTransactionProcessingTest._81.while.cond.4                # ir inst 317 fin
.F.performTransactionProcessingTest._92.while.exit.4:
  addi s8, t4, 1                                                        # ir inst 318 fin
  addi t4, t3, 1                                                        # ir inst 319 fin
# Phi connections
  mv s11, s9
  mv t3, t4
  mv t4, s8
  mv t5, s10
  j .F.performTransactionProcessingTest._40.while.cond.0                # ir inst 320 fin
.F.performTransactionProcessingTest._93.while.exit.0:
# Start call preparation
  sd t5, 0(sp)
  mv a0, s11
  call printlnInt
  ld t5, 0(sp)
# ir inst 321 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 322 fin
# Start call preparation
  li a0, 26006
  call printlnInt
# ir inst 323 fin
  j .F.performTransactionProcessingTest.epilogue                        # ir inst 324 fin
.F.performTransactionProcessingTest.epilogue:
  ld ra, 104(sp)
  ld s11, 40(sp)
  ld s0, 48(sp)
  ld s5, 56(sp)
  ld s10, 64(sp)
  ld s9, 72(sp)
  ld s7, 80(sp)
  ld s6, 88(sp)
  ld s8, 96(sp)
  li t0, 8224
  add sp, sp, t0
  ret

.globl .F.detectDeadlock
.F.detectDeadlock:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.detectDeadlock._0.entry.0:
# Phi connections
  li t6, 0
  j .F.detectDeadlock._1.while.cond.0                                   # ir inst 1 fin
.F.detectDeadlock._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.detectDeadlock._2.while.body.0
  j .F.detectDeadlock._3.while.exit.0                                   # ir inst 4 fin
.F.detectDeadlock._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  add t4, a1, t5                                                        # ir inst 6 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  add t4, a2, t5                                                        # ir inst 9 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.detectDeadlock._1.while.cond.0                                   # ir inst 12 fin
.F.detectDeadlock._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.detectDeadlock._4.while.cond.1                                   # ir inst 13 fin
.F.detectDeadlock._4.while.cond.1:
  slt t5, t6, a3                                                        # ir inst 15 fin
  bnez t5, .F.detectDeadlock._5.while.body.1
  j .F.detectDeadlock._12.while.exit.1                                  # ir inst 16 fin
.F.detectDeadlock._5.while.body.1:
  mv t5, t6                                                             # ir inst 17 fin
  add t4, a1, t5                                                        # ir inst 18 fin
  lb t5, 0(t4)                                                          # ir inst 19 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 20 fin
  bnez t4, .F.detectDeadlock._6.if.then.0
  j .F.detectDeadlock._10.if.else.0                                     # ir inst 21 fin
.F.detectDeadlock._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a4, a3
  mv a3, t6
  call .F.detectCycleDFS
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 22 fin
  bnez t5, .F.detectDeadlock._7.if.then.1
  j .F.detectDeadlock._8.if.else.1                                      # ir inst 23 fin
.F.detectDeadlock._7.if.then.1:
  li a0, 1
  j .F.detectDeadlock.epilogue                                          # ir inst 24 fin
.F.detectDeadlock._8.if.else.1:
  j .F.detectDeadlock._9.if.exit.1                                      # ir inst 25 fin
.F.detectDeadlock._9.if.exit.1:
  j .F.detectDeadlock._11.if.exit.0                                     # ir inst 26 fin
.F.detectDeadlock._10.if.else.0:
  j .F.detectDeadlock._11.if.exit.0                                     # ir inst 27 fin
.F.detectDeadlock._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t6, t5
  j .F.detectDeadlock._4.while.cond.1                                   # ir inst 29 fin
.F.detectDeadlock._12.while.exit.1:
  li a0, 0
  j .F.detectDeadlock.epilogue                                          # ir inst 30 fin
.F.detectDeadlock.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.detectCycleDFS
.F.detectCycleDFS:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.detectCycleDFS._0.entry.0:
  mv t6, a3                                                             # ir inst 1 fin
  add t5, a1, t6                                                        # ir inst 2 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 3 fin
  mv t6, a3                                                             # ir inst 4 fin
  add t5, a2, t6                                                        # ir inst 5 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 6 fin
# Phi connections
  li t6, 0
  j .F.detectCycleDFS._1.while.cond.0                                   # ir inst 7 fin
.F.detectCycleDFS._1.while.cond.0:
  slt t5, t6, a4                                                        # ir inst 9 fin
  bnez t5, .F.detectCycleDFS._2.while.body.0
  j .F.detectCycleDFS._15.while.exit.0                                  # ir inst 10 fin
.F.detectCycleDFS._2.while.body.0:
  mv t5, a3                                                             # ir inst 11 fin
  li t1, 50
  mul t2, t5, t1
  add t4, a0, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  add t3, t4, t5                                                        # ir inst 14 fin
  lb t5, 0(t3)                                                          # ir inst 15 fin
  bnez t5, .F.detectCycleDFS._3.if.then.0
  j .F.detectCycleDFS._13.if.else.0                                     # ir inst 16 fin
.F.detectCycleDFS._3.if.then.0:
  mv t5, t6                                                             # ir inst 17 fin
  add t4, a1, t5                                                        # ir inst 18 fin
  lb t5, 0(t4)                                                          # ir inst 19 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 20 fin
  bnez t4, .F.detectCycleDFS._4.if.then.1
  j .F.detectCycleDFS._8.if.else.1                                      # ir inst 21 fin
.F.detectCycleDFS._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t6, 40(sp)
  mv a3, t6
  call .F.detectCycleDFS
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t6, 40(sp)
# ir inst 22 fin
  bnez t5, .F.detectCycleDFS._5.if.then.2
  j .F.detectCycleDFS._6.if.else.2                                      # ir inst 23 fin
.F.detectCycleDFS._5.if.then.2:
  li a0, 1
  j .F.detectCycleDFS.epilogue                                          # ir inst 24 fin
.F.detectCycleDFS._6.if.else.2:
  j .F.detectCycleDFS._7.if.exit.2                                      # ir inst 25 fin
.F.detectCycleDFS._7.if.exit.2:
  j .F.detectCycleDFS._12.if.exit.1                                     # ir inst 26 fin
.F.detectCycleDFS._8.if.else.1:
  mv t5, t6                                                             # ir inst 27 fin
  add t4, a2, t5                                                        # ir inst 28 fin
  lb t5, 0(t4)                                                          # ir inst 29 fin
  bnez t5, .F.detectCycleDFS._9.if.then.3
  j .F.detectCycleDFS._10.if.else.3                                     # ir inst 30 fin
.F.detectCycleDFS._9.if.then.3:
  li a0, 1
  j .F.detectCycleDFS.epilogue                                          # ir inst 31 fin
.F.detectCycleDFS._10.if.else.3:
  j .F.detectCycleDFS._11.if.exit.3                                     # ir inst 32 fin
.F.detectCycleDFS._11.if.exit.3:
  j .F.detectCycleDFS._12.if.exit.1                                     # ir inst 33 fin
.F.detectCycleDFS._12.if.exit.1:
  j .F.detectCycleDFS._14.if.exit.0                                     # ir inst 34 fin
.F.detectCycleDFS._13.if.else.0:
  j .F.detectCycleDFS._14.if.exit.0                                     # ir inst 35 fin
.F.detectCycleDFS._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t5
  j .F.detectCycleDFS._1.while.cond.0                                   # ir inst 37 fin
.F.detectCycleDFS._15.while.exit.0:
  mv t6, a3                                                             # ir inst 38 fin
  add t5, a2, t6                                                        # ir inst 39 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 40 fin
  li a0, 0
  j .F.detectCycleDFS.epilogue                                          # ir inst 41 fin
.F.detectCycleDFS.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.findVictimTransaction
.F.findVictimTransaction:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.findVictimTransaction._0.entry.0:
# Phi connections
  li t4, -1
  li t5, 0
  li t6, 0
  j .F.findVictimTransaction._1.while.cond.0                            # ir inst 1 fin
.F.findVictimTransaction._1.while.cond.0:
  slt t3, t6, a2                                                        # ir inst 5 fin
  bnez t3, .F.findVictimTransaction._2.while.body.0
  j .F.findVictimTransaction._9.while.exit.0                            # ir inst 6 fin
.F.findVictimTransaction._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.findVictimTransaction._3.lazy.then.0
  j .F.findVictimTransaction._4.lazy.else.0                             # ir inst 11 fin
.F.findVictimTransaction._3.lazy.then.0:
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  slt s11, t5, t3                                                       # ir inst 15 fin
# Phi connections
  mv t3, s11
  j .F.findVictimTransaction._5.lazy.exit.0                             # ir inst 16 fin
.F.findVictimTransaction._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.findVictimTransaction._5.lazy.exit.0                             # ir inst 17 fin
.F.findVictimTransaction._5.lazy.exit.0:
  bnez t3, .F.findVictimTransaction._6.if.then.0
  j .F.findVictimTransaction._7.if.else.0                               # ir inst 19 fin
.F.findVictimTransaction._6.if.then.0:
  mv t3, t6                                                             # ir inst 20 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 21 fin
  lw t3, 0(s11)                                                         # ir inst 22 fin
# Phi connections
  mv t5, t3
  mv t3, t6
  j .F.findVictimTransaction._8.if.exit.0                               # ir inst 23 fin
.F.findVictimTransaction._7.if.else.0:
# Phi connections
  mv t3, t4
  j .F.findVictimTransaction._8.if.exit.0                               # ir inst 24 fin
.F.findVictimTransaction._8.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 27 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.findVictimTransaction._1.while.cond.0                            # ir inst 28 fin
.F.findVictimTransaction._9.while.exit.0:
  mv a0, t4
  j .F.findVictimTransaction.epilogue                                   # ir inst 29 fin
.F.findVictimTransaction.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.abortTransaction
.F.abortTransaction:
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
.F.abortTransaction._0.entry.0:
  mv t6, a0                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 2 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.abortTransaction._1.while.cond.0                                 # ir inst 4 fin
.F.abortTransaction._1.while.cond.0:
  mv t5, a0                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 7 fin
  lw t5, 0(t4)                                                          # ir inst 8 fin
  slt t4, t6, t5                                                        # ir inst 9 fin
  bnez t4, .F.abortTransaction._2.while.body.0
  j .F.abortTransaction._9.while.exit.0                                 # ir inst 10 fin
.F.abortTransaction._2.while.body.0:
  mv t5, a0                                                             # ir inst 11 fin
  li t1, 40
  mul t2, t5, t1
  add t4, a2, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, a4, t2                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 18 fin
  mv t4, t5                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a6, t2                                                        # ir inst 20 fin
  lw t4, 0(t3)                                                          # ir inst 21 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 22 fin
  bnez t3, .F.abortTransaction._3.if.then.0
  j .F.abortTransaction._7.if.else.0                                    # ir inst 23 fin
.F.abortTransaction._3.if.then.0:
  mv t4, t5                                                             # ir inst 24 fin
  li t1, 20
  mul t2, t4, t1
  add t3, a5, t2                                                        # ir inst 25 fin
  addi t4, t3, 0                                                        # ir inst 26 fin
  lw t3, 0(t4)                                                          # ir inst 27 fin
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add s11, a4, t2                                                       # ir inst 29 fin
  sw t3, 0(s11)                                                         # ir inst 30 fin
# Phi connections
  li t4, 0
  j .F.abortTransaction._4.while.cond.1                                 # ir inst 31 fin
.F.abortTransaction._4.while.cond.1:
  mv t3, t5                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s11, a6, t2                                                       # ir inst 34 fin
  lw t3, 0(s11)                                                         # ir inst 35 fin
  addi s11, t3, -1                                                      # ir inst 36 fin
  slt t3, t4, s11                                                       # ir inst 37 fin
  bnez t3, .F.abortTransaction._5.while.body.1
  j .F.abortTransaction._6.while.exit.1                                 # ir inst 38 fin
.F.abortTransaction._5.while.body.1:
  mv t3, t5                                                             # ir inst 39 fin
  li t1, 20
  mul t2, t3, t1
  add s11, a5, t2                                                       # ir inst 40 fin
  mv t3, t4                                                             # ir inst 41 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 42 fin
  mv t3, t5                                                             # ir inst 43 fin
  li t1, 20
  mul t2, t3, t1
  add s11, a5, t2                                                       # ir inst 44 fin
  mv t3, t4                                                             # ir inst 45 fin
  addi s9, t3, 1                                                        # ir inst 46 fin
  slli t2, s9, 2
  add t3, s11, t2                                                       # ir inst 47 fin
  lw s11, 0(t3)                                                         # ir inst 48 fin
  sw s11, 0(s10)                                                        # ir inst 49 fin
  addi t3, t4, 1                                                        # ir inst 50 fin
# Phi connections
  mv t4, t3
  j .F.abortTransaction._4.while.cond.1                                 # ir inst 51 fin
.F.abortTransaction._6.while.exit.1:
  mv t4, t5                                                             # ir inst 52 fin
  slli t2, t4, 2
  add t3, a6, t2                                                        # ir inst 53 fin
  mv t4, t5                                                             # ir inst 54 fin
  slli t2, t4, 2
  add t5, a6, t2                                                        # ir inst 55 fin
  lw t4, 0(t5)                                                          # ir inst 56 fin
  addi t5, t4, -1                                                       # ir inst 57 fin
  sw t5, 0(t3)                                                          # ir inst 58 fin
  j .F.abortTransaction._8.if.exit.0                                    # ir inst 59 fin
.F.abortTransaction._7.if.else.0:
  j .F.abortTransaction._8.if.exit.0                                    # ir inst 60 fin
.F.abortTransaction._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 61 fin
# Phi connections
  mv t6, t5
  j .F.abortTransaction._1.while.cond.0                                 # ir inst 62 fin
.F.abortTransaction._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.abortTransaction._10.while.cond.2                                # ir inst 63 fin
.F.abortTransaction._10.while.cond.2:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 65 fin
  bnez t5, .F.abortTransaction._11.while.body.2
  j .F.abortTransaction._12.while.exit.2                                # ir inst 66 fin
.F.abortTransaction._11.while.body.2:
  mv t5, a0                                                             # ir inst 67 fin
  li t1, 50
  mul t2, t5, t1
  add t4, a7, t2                                                        # ir inst 68 fin
  mv t5, t6                                                             # ir inst 69 fin
  add t3, t4, t5                                                        # ir inst 70 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 71 fin
  mv t5, t6                                                             # ir inst 72 fin
  li t1, 50
  mul t2, t5, t1
  add t4, a7, t2                                                        # ir inst 73 fin
  mv t5, a0                                                             # ir inst 74 fin
  add t3, t4, t5                                                        # ir inst 75 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 76 fin
  addi t5, t6, 1                                                        # ir inst 77 fin
# Phi connections
  mv t6, t5
  j .F.abortTransaction._10.while.cond.2                                # ir inst 78 fin
.F.abortTransaction._12.while.exit.2:
  mv t6, a0                                                             # ir inst 79 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 80 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 81 fin
  j .F.abortTransaction.epilogue                                        # ir inst 82 fin
.F.abortTransaction.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.commitTransaction
.F.commitTransaction:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s10, 0(sp)
  sd s9, 8(sp)
  sd s11, 16(sp)
.F.commitTransaction._0.entry.0:
  mv t6, a0                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 2 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.commitTransaction._1.while.cond.0                                # ir inst 4 fin
.F.commitTransaction._1.while.cond.0:
  mv t5, a0                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 7 fin
  lw t5, 0(t4)                                                          # ir inst 8 fin
  slt t4, t6, t5                                                        # ir inst 9 fin
  bnez t4, .F.commitTransaction._2.while.body.0
  j .F.commitTransaction._9.while.exit.0                                # ir inst 10 fin
.F.commitTransaction._2.while.body.0:
  mv t5, a0                                                             # ir inst 11 fin
  li t1, 40
  mul t2, t5, t1
  add t4, a2, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, a4, t2                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 18 fin
  mv t4, t5                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a6, t2                                                        # ir inst 20 fin
  lw t4, 0(t3)                                                          # ir inst 21 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 22 fin
  bnez t3, .F.commitTransaction._3.if.then.0
  j .F.commitTransaction._7.if.else.0                                   # ir inst 23 fin
.F.commitTransaction._3.if.then.0:
  mv t4, t5                                                             # ir inst 24 fin
  li t1, 20
  mul t2, t4, t1
  add t3, a5, t2                                                        # ir inst 25 fin
  addi t4, t3, 0                                                        # ir inst 26 fin
  lw t3, 0(t4)                                                          # ir inst 27 fin
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add s11, a4, t2                                                       # ir inst 29 fin
  sw t3, 0(s11)                                                         # ir inst 30 fin
# Phi connections
  li t4, 0
  j .F.commitTransaction._4.while.cond.1                                # ir inst 31 fin
.F.commitTransaction._4.while.cond.1:
  mv t3, t5                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s11, a6, t2                                                       # ir inst 34 fin
  lw t3, 0(s11)                                                         # ir inst 35 fin
  addi s11, t3, -1                                                      # ir inst 36 fin
  slt t3, t4, s11                                                       # ir inst 37 fin
  bnez t3, .F.commitTransaction._5.while.body.1
  j .F.commitTransaction._6.while.exit.1                                # ir inst 38 fin
.F.commitTransaction._5.while.body.1:
  mv t3, t5                                                             # ir inst 39 fin
  li t1, 20
  mul t2, t3, t1
  add s11, a5, t2                                                       # ir inst 40 fin
  mv t3, t4                                                             # ir inst 41 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 42 fin
  mv t3, t5                                                             # ir inst 43 fin
  li t1, 20
  mul t2, t3, t1
  add s11, a5, t2                                                       # ir inst 44 fin
  mv t3, t4                                                             # ir inst 45 fin
  addi s9, t3, 1                                                        # ir inst 46 fin
  slli t2, s9, 2
  add t3, s11, t2                                                       # ir inst 47 fin
  lw s11, 0(t3)                                                         # ir inst 48 fin
  sw s11, 0(s10)                                                        # ir inst 49 fin
  addi t3, t4, 1                                                        # ir inst 50 fin
# Phi connections
  mv t4, t3
  j .F.commitTransaction._4.while.cond.1                                # ir inst 51 fin
.F.commitTransaction._6.while.exit.1:
  mv t4, t5                                                             # ir inst 52 fin
  slli t2, t4, 2
  add t3, a6, t2                                                        # ir inst 53 fin
  mv t4, t5                                                             # ir inst 54 fin
  slli t2, t4, 2
  add t5, a6, t2                                                        # ir inst 55 fin
  lw t4, 0(t5)                                                          # ir inst 56 fin
  addi t5, t4, -1                                                       # ir inst 57 fin
  sw t5, 0(t3)                                                          # ir inst 58 fin
  j .F.commitTransaction._8.if.exit.0                                   # ir inst 59 fin
.F.commitTransaction._7.if.else.0:
  j .F.commitTransaction._8.if.exit.0                                   # ir inst 60 fin
.F.commitTransaction._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 61 fin
# Phi connections
  mv t6, t5
  j .F.commitTransaction._1.while.cond.0                                # ir inst 62 fin
.F.commitTransaction._9.while.exit.0:
  mv t6, a0                                                             # ir inst 63 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 64 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 65 fin
  j .F.commitTransaction.epilogue                                       # ir inst 66 fin
.F.commitTransaction.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.performBufferPoolTest
.F.performBufferPoolTest:
# spill func args num: 0,             range:     3552(sp) -     3552(sp)
# local var size: 3400,               range:      144(sp) -     3544(sp)
# return addr size: 8,                range:      136(sp) -      144(sp)
# callee save reg num: 9 / 12,        range:       64(sp) -      136(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3552
  add sp, sp, t0
  sd s10, 64(sp)
  sd s9, 72(sp)
  sd s8, 80(sp)
  sd s11, 88(sp)
  sd s7, 96(sp)
  sd s5, 104(sp)
  sd s0, 112(sp)
  sd s6, 120(sp)
  sd s1, 128(sp)
  sd ra, 136(sp)
.F.performBufferPoolTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 26007
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 144
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performBufferPoolTest._1.array.cond.0                            # ir inst 4 fin
.F.performBufferPoolTest._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performBufferPoolTest._2.array.body.0
  j .F.performBufferPoolTest._3.array.exit.0                            # ir inst 7 fin
.F.performBufferPoolTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performBufferPoolTest._1.array.cond.0                            # ir inst 11 fin
.F.performBufferPoolTest._3.array.exit.0:
  addi t1, sp, 544
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performBufferPoolTest._4.array.cond.1                            # ir inst 14 fin
.F.performBufferPoolTest._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performBufferPoolTest._5.array.body.1
  j .F.performBufferPoolTest._6.array.exit.1                            # ir inst 17 fin
.F.performBufferPoolTest._5.array.body.1:
  add t4, t6, t5                                                        # ir inst 18 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performBufferPoolTest._4.array.cond.1                            # ir inst 21 fin
.F.performBufferPoolTest._6.array.exit.1:
  addi t1, sp, 644
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performBufferPoolTest._7.array.cond.2                            # ir inst 24 fin
.F.performBufferPoolTest._7.array.cond.2:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performBufferPoolTest._8.array.body.2
  j .F.performBufferPoolTest._9.array.exit.2                            # ir inst 27 fin
.F.performBufferPoolTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performBufferPoolTest._7.array.cond.2                            # ir inst 31 fin
.F.performBufferPoolTest._9.array.exit.2:
  addi t1, sp, 1044
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j .F.performBufferPoolTest._10.array.cond.3                           # ir inst 34 fin
.F.performBufferPoolTest._10.array.cond.3:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, .F.performBufferPoolTest._11.array.body.3
  j .F.performBufferPoolTest._12.array.exit.3                           # ir inst 37 fin
.F.performBufferPoolTest._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j .F.performBufferPoolTest._10.array.cond.3                           # ir inst 41 fin
.F.performBufferPoolTest._12.array.exit.3:
  addi t1, sp, 1444
  addi t6, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t5, 0
  j .F.performBufferPoolTest._13.array.cond.4                           # ir inst 44 fin
.F.performBufferPoolTest._13.array.cond.4:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 46 fin
  bnez t4, .F.performBufferPoolTest._14.array.body.4
  j .F.performBufferPoolTest._15.array.exit.4                           # ir inst 47 fin
.F.performBufferPoolTest._14.array.body.4:
  add t4, t6, t5                                                        # ir inst 48 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 49 fin
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j .F.performBufferPoolTest._13.array.cond.4                           # ir inst 51 fin
.F.performBufferPoolTest._15.array.exit.4:
  addi t1, sp, 1544
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F.performBufferPoolTest._16.array.cond.5                           # ir inst 54 fin
.F.performBufferPoolTest._16.array.cond.5:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, .F.performBufferPoolTest._17.array.body.5
  j .F.performBufferPoolTest._18.array.exit.5                           # ir inst 57 fin
.F.performBufferPoolTest._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 58 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.performBufferPoolTest._16.array.cond.5                           # ir inst 61 fin
.F.performBufferPoolTest._18.array.exit.5:
# Phi connections
  li s9, 0
  li s10, 0
  li s11, 1
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.performBufferPoolTest._19.while.cond.0                           # ir inst 62 fin
.F.performBufferPoolTest._19.while.cond.0:
  li t2, 30
  slt s8, t4, t2                                                        # ir inst 70 fin
  bnez s8, .F.performBufferPoolTest._20.lazy.then.0
  j .F.performBufferPoolTest._21.lazy.else.0                            # ir inst 71 fin
.F.performBufferPoolTest._20.lazy.then.0:
  li t2, 200
  slt s8, t5, t2                                                        # ir inst 72 fin
# Phi connections
  j .F.performBufferPoolTest._22.lazy.exit.0                            # ir inst 73 fin
.F.performBufferPoolTest._21.lazy.else.0:
# Phi connections
  li s8, 0
  j .F.performBufferPoolTest._22.lazy.exit.0                            # ir inst 74 fin
.F.performBufferPoolTest._22.lazy.exit.0:
  bnez s8, .F.performBufferPoolTest._23.while.body.0
  j .F.performBufferPoolTest._63.while.exit.0                           # ir inst 76 fin
.F.performBufferPoolTest._23.while.body.0:
  li t2, 4
  rem s8, t4, t2                                                        # ir inst 77 fin
  li t2, 5
  rem s7, t4, t2                                                        # ir inst 78 fin
  addi s6, s7, 3                                                        # ir inst 79 fin
# Phi connections
  mv s1, s9
  mv s0, s10
  mv s5, s11
  mv s7, t3
  mv s11, t5
  mv t3, t6
  li t5, 0
  j .F.performBufferPoolTest._24.while.cond.1                           # ir inst 80 fin
.F.performBufferPoolTest._24.while.cond.1:
  slt a1, t5, s6                                                        # ir inst 88 fin
  bnez a1, .F.performBufferPoolTest._25.lazy.then.1
  j .F.performBufferPoolTest._26.lazy.else.1                            # ir inst 89 fin
.F.performBufferPoolTest._25.lazy.then.1:
  li t2, 200
  slt a1, s11, t2                                                       # ir inst 90 fin
# Phi connections
  j .F.performBufferPoolTest._27.lazy.exit.1                            # ir inst 91 fin
.F.performBufferPoolTest._26.lazy.else.1:
# Phi connections
  li a1, 0
  j .F.performBufferPoolTest._27.lazy.exit.1                            # ir inst 92 fin
.F.performBufferPoolTest._27.lazy.exit.1:
  bnez a1, .F.performBufferPoolTest._28.while.body.1
  j .F.performBufferPoolTest._62.while.exit.1                           # ir inst 94 fin
.F.performBufferPoolTest._28.while.body.1:
  li t2, 0
  xor t0, s8, t2
  sltiu a1, t0, 1                                                       # ir inst 95 fin
  bnez a1, .F.performBufferPoolTest._29.if.then.0
  j .F.performBufferPoolTest._30.if.else.0                              # ir inst 96 fin
.F.performBufferPoolTest._29.if.then.0:
  li t2, 10
  mul a1, t4, t2                                                        # ir inst 97 fin
  add a2, a1, t5                                                        # ir inst 98 fin
  li t2, 400
  rem a1, a2, t2                                                        # ir inst 99 fin
  addi a2, a1, 1                                                        # ir inst 100 fin
# Phi connections
  mv a1, a2
  j .F.performBufferPoolTest._37.if.exit.0                              # ir inst 101 fin
.F.performBufferPoolTest._30.if.else.0:
  li t2, 1
  xor t0, s8, t2
  sltiu a1, t0, 1                                                       # ir inst 102 fin
  bnez a1, .F.performBufferPoolTest._31.if.then.1
  j .F.performBufferPoolTest._32.if.else.1                              # ir inst 103 fin
.F.performBufferPoolTest._31.if.then.1:
  li t2, 17
  mul a1, s11, t2                                                       # ir inst 104 fin
  addi a2, a1, 23                                                       # ir inst 105 fin
  li t2, 350
  rem a1, a2, t2                                                        # ir inst 106 fin
  addi a2, a1, 1                                                        # ir inst 107 fin
# Phi connections
  mv a1, a2
  j .F.performBufferPoolTest._36.if.exit.1                              # ir inst 108 fin
.F.performBufferPoolTest._32.if.else.1:
  li t2, 2
  xor t0, s8, t2
  sltiu a1, t0, 1                                                       # ir inst 109 fin
  bnez a1, .F.performBufferPoolTest._33.if.then.2
  j .F.performBufferPoolTest._34.if.else.2                              # ir inst 110 fin
.F.performBufferPoolTest._33.if.then.2:
  li t2, 3
  mul a1, s11, t2                                                       # ir inst 111 fin
  li t2, 50
  rem a2, a1, t2                                                        # ir inst 112 fin
  addi a1, a2, 1                                                        # ir inst 113 fin
# Phi connections
  j .F.performBufferPoolTest._35.if.exit.2                              # ir inst 114 fin
.F.performBufferPoolTest._34.if.else.2:
  li t2, 7
  mul a1, s11, t2                                                       # ir inst 115 fin
  li t2, 11
  mul a2, t4, t2                                                        # ir inst 116 fin
  add a3, a1, a2                                                        # ir inst 117 fin
  li t2, 300
  rem a1, a3, t2                                                        # ir inst 118 fin
  addi a2, a1, 1                                                        # ir inst 119 fin
# Phi connections
  mv a1, a2
  j .F.performBufferPoolTest._35.if.exit.2                              # ir inst 120 fin
.F.performBufferPoolTest._35.if.exit.2:
# Phi connections
  j .F.performBufferPoolTest._36.if.exit.1                              # ir inst 122 fin
.F.performBufferPoolTest._36.if.exit.1:
# Phi connections
  j .F.performBufferPoolTest._37.if.exit.0                              # ir inst 124 fin
.F.performBufferPoolTest._37.if.exit.0:
  mv a2, a1                                                             # ir inst 126 fin
  slli t2, a2, 2
  addi t1, sp, 1544
  add a3, t1, t2                                                        # ir inst 127 fin
  lw a2, 0(a3)                                                          # ir inst 128 fin
  li t2, 0
  slt t0, a2, t2
  xori a3, t0, 1                                                        # ir inst 129 fin
  bnez a3, .F.performBufferPoolTest._38.lazy.then.2
  j .F.performBufferPoolTest._39.lazy.else.2                            # ir inst 130 fin
.F.performBufferPoolTest._38.lazy.then.2:
  mv a3, a2                                                             # ir inst 131 fin
  slli t2, a3, 2
  addi t1, sp, 144
  add a4, t1, t2                                                        # ir inst 132 fin
  lw a3, 0(a4)                                                          # ir inst 133 fin
  xor t0, a3, a1
  sltiu a4, t0, 1                                                       # ir inst 134 fin
# Phi connections
  mv a3, a4
  j .F.performBufferPoolTest._40.lazy.exit.2                            # ir inst 135 fin
.F.performBufferPoolTest._39.lazy.else.2:
# Phi connections
  li a3, 0
  j .F.performBufferPoolTest._40.lazy.exit.2                            # ir inst 136 fin
.F.performBufferPoolTest._40.lazy.exit.2:
  bnez a3, .F.performBufferPoolTest._41.if.then.3
  j .F.performBufferPoolTest._42.if.else.3                              # ir inst 138 fin
.F.performBufferPoolTest._41.if.then.3:
  addi a3, s0, 1                                                        # ir inst 139 fin
  mv a4, a2                                                             # ir inst 140 fin
  slli t2, a4, 2
  addi t1, sp, 1044
  add a5, t1, t2                                                        # ir inst 141 fin
  sw s5, 0(a5)                                                          # ir inst 142 fin
  mv a4, a2                                                             # ir inst 143 fin
  addi t1, sp, 1444
  add a2, t1, a4                                                        # ir inst 144 fin
  li t1, 1
  sb t1, 0(a2)                                                          # ir inst 145 fin
# Phi connections
  mv a5, s1
  mv a4, a3
  mv a3, s7
  mv a2, t3
  j .F.performBufferPoolTest._55.if.exit.3                              # ir inst 146 fin
.F.performBufferPoolTest._42.if.else.3:
  addi a2, s1, 1                                                        # ir inst 147 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a1, a0
  addi t1, sp, 144
  mv a0, t1
  call .F.findFreeBufferSlot
  mv a3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 148 fin
  li t2, 0
  slt t0, a3, t2
  xori a4, t0, 1                                                        # ir inst 149 fin
  bnez a4, .F.performBufferPoolTest._43.if.then.4
  j .F.performBufferPoolTest._44.if.else.4                              # ir inst 150 fin
.F.performBufferPoolTest._43.if.then.4:
  mv a4, a3                                                             # ir inst 151 fin
  slli t2, a4, 2
  addi t1, sp, 144
  add a5, t1, t2                                                        # ir inst 152 fin
  sw a1, 0(a5)                                                          # ir inst 153 fin
  mv a4, a3                                                             # ir inst 154 fin
  addi t1, sp, 544
  add a5, t1, a4                                                        # ir inst 155 fin
  li t1, 0
  sb t1, 0(a5)                                                          # ir inst 156 fin
  mv a4, a3                                                             # ir inst 157 fin
  slli t2, a4, 2
  addi t1, sp, 644
  add a5, t1, t2                                                        # ir inst 158 fin
  li t1, 0
  sw t1, 0(a5)                                                          # ir inst 159 fin
  mv a4, a3                                                             # ir inst 160 fin
  slli t2, a4, 2
  addi t1, sp, 1044
  add a5, t1, t2                                                        # ir inst 161 fin
  sw s5, 0(a5)                                                          # ir inst 162 fin
  mv a4, a3                                                             # ir inst 163 fin
  addi t1, sp, 1444
  add a5, t1, a4                                                        # ir inst 164 fin
  li t1, 1
  sb t1, 0(a5)                                                          # ir inst 165 fin
  mv a4, a1                                                             # ir inst 166 fin
  slli t2, a4, 2
  addi t1, sp, 1544
  add a5, t1, t2                                                        # ir inst 167 fin
  sw a3, 0(a5)                                                          # ir inst 168 fin
# Phi connections
  mv a4, s7
  mv a3, t3
  j .F.performBufferPoolTest._54.if.exit.4                              # ir inst 169 fin
.F.performBufferPoolTest._44.if.else.4:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a4, a0
  mv a3, s7
  addi t1, sp, 1444
  mv a2, t1
  addi t1, sp, 644
  mv a1, t1
  addi t1, sp, 144
  mv a0, t1
  call .F.clockPageReplacement
  mv a3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 170 fin
  li t2, 0
  slt t0, a3, t2
  xori a4, t0, 1                                                        # ir inst 171 fin
  bnez a4, .F.performBufferPoolTest._45.if.then.5
  j .F.performBufferPoolTest._52.if.else.5                              # ir inst 172 fin
.F.performBufferPoolTest._45.if.then.5:
  addi a4, a3, 1                                                        # ir inst 173 fin
  rem a5, a4, a0                                                        # ir inst 174 fin
  mv a4, a3                                                             # ir inst 175 fin
  slli t2, a4, 2
  addi t1, sp, 144
  add a6, t1, t2                                                        # ir inst 176 fin
  lw a4, 0(a6)                                                          # ir inst 177 fin
  li t2, 0
  slt t0, a4, t2
  xori a6, t0, 1                                                        # ir inst 178 fin
  bnez a6, .F.performBufferPoolTest._46.lazy.then.3
  j .F.performBufferPoolTest._47.lazy.else.3                            # ir inst 179 fin
.F.performBufferPoolTest._46.lazy.then.3:
  li t2, 500
  slt a6, a4, t2                                                        # ir inst 180 fin
# Phi connections
  j .F.performBufferPoolTest._48.lazy.exit.3                            # ir inst 181 fin
.F.performBufferPoolTest._47.lazy.else.3:
# Phi connections
  li a6, 0
  j .F.performBufferPoolTest._48.lazy.exit.3                            # ir inst 182 fin
.F.performBufferPoolTest._48.lazy.exit.3:
  bnez a6, .F.performBufferPoolTest._49.if.then.6
  j .F.performBufferPoolTest._50.if.else.6                              # ir inst 184 fin
.F.performBufferPoolTest._49.if.then.6:
  mv a6, a4                                                             # ir inst 185 fin
  slli t2, a6, 2
  addi t1, sp, 1544
  add a4, t1, t2                                                        # ir inst 186 fin
  li t1, -1
  sw t1, 0(a4)                                                          # ir inst 187 fin
  j .F.performBufferPoolTest._51.if.exit.6                              # ir inst 188 fin
.F.performBufferPoolTest._50.if.else.6:
  j .F.performBufferPoolTest._51.if.exit.6                              # ir inst 189 fin
.F.performBufferPoolTest._51.if.exit.6:
  addi a4, t3, 1                                                        # ir inst 190 fin
  mv a6, a3                                                             # ir inst 191 fin
  slli t2, a6, 2
  addi t1, sp, 144
  add a7, t1, t2                                                        # ir inst 192 fin
  sw a1, 0(a7)                                                          # ir inst 193 fin
  mv a6, a3                                                             # ir inst 194 fin
  addi t1, sp, 544
  add a7, t1, a6                                                        # ir inst 195 fin
  li t1, 0
  sb t1, 0(a7)                                                          # ir inst 196 fin
  mv a6, a3                                                             # ir inst 197 fin
  slli t2, a6, 2
  addi t1, sp, 644
  add a7, t1, t2                                                        # ir inst 198 fin
  li t1, 0
  sw t1, 0(a7)                                                          # ir inst 199 fin
  mv a6, a3                                                             # ir inst 200 fin
  slli t2, a6, 2
  addi t1, sp, 1044
  add a7, t1, t2                                                        # ir inst 201 fin
  sw s5, 0(a7)                                                          # ir inst 202 fin
  mv a6, a3                                                             # ir inst 203 fin
  addi t1, sp, 1444
  add a7, t1, a6                                                        # ir inst 204 fin
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 205 fin
  mv a6, a1                                                             # ir inst 206 fin
  slli t2, a6, 2
  addi t1, sp, 1544
  add a7, t1, t2                                                        # ir inst 207 fin
  sw a3, 0(a7)                                                          # ir inst 208 fin
# Phi connections
  mv a3, a4
  mv a4, a5
  j .F.performBufferPoolTest._53.if.exit.5                              # ir inst 209 fin
.F.performBufferPoolTest._52.if.else.5:
# Phi connections
  mv a4, s7
  mv a3, t3
  j .F.performBufferPoolTest._53.if.exit.5                              # ir inst 210 fin
.F.performBufferPoolTest._53.if.exit.5:
# Phi connections
  j .F.performBufferPoolTest._54.if.exit.4                              # ir inst 213 fin
.F.performBufferPoolTest._54.if.exit.4:
# Phi connections
  mv a5, a2
  mv a2, a3
  mv a3, a4
  mv a4, s0
  j .F.performBufferPoolTest._55.if.exit.3                              # ir inst 216 fin
.F.performBufferPoolTest._55.if.exit.3:
  li t2, 3
  rem a6, s11, t2                                                       # ir inst 221 fin
  li t2, 0
  xor t0, a6, t2
  sltiu a7, t0, 1                                                       # ir inst 222 fin
  bnez a7, .F.performBufferPoolTest._56.lazy.then.4
  j .F.performBufferPoolTest._57.lazy.else.4                            # ir inst 223 fin
.F.performBufferPoolTest._56.lazy.then.4:
  mv a6, a1                                                             # ir inst 224 fin
  slli t2, a6, 2
  addi t1, sp, 1544
  add a7, t1, t2                                                        # ir inst 225 fin
  lw a6, 0(a7)                                                          # ir inst 226 fin
  li t2, 0
  slt t0, a6, t2
  xori a7, t0, 1                                                        # ir inst 227 fin
# Phi connections
  mv a6, a7
  j .F.performBufferPoolTest._58.lazy.exit.4                            # ir inst 228 fin
.F.performBufferPoolTest._57.lazy.else.4:
# Phi connections
  li a6, 0
  j .F.performBufferPoolTest._58.lazy.exit.4                            # ir inst 229 fin
.F.performBufferPoolTest._58.lazy.exit.4:
  bnez a6, .F.performBufferPoolTest._59.if.then.7
  j .F.performBufferPoolTest._60.if.else.7                              # ir inst 231 fin
.F.performBufferPoolTest._59.if.then.7:
  mv a6, a1                                                             # ir inst 232 fin
  slli t2, a6, 2
  addi t1, sp, 1544
  add a1, t1, t2                                                        # ir inst 233 fin
  lw a6, 0(a1)                                                          # ir inst 234 fin
  mv a1, a6                                                             # ir inst 235 fin
  addi t1, sp, 544
  add a6, t1, a1                                                        # ir inst 236 fin
  li t1, 1
  sb t1, 0(a6)                                                          # ir inst 237 fin
  j .F.performBufferPoolTest._61.if.exit.7                              # ir inst 238 fin
.F.performBufferPoolTest._60.if.else.7:
  j .F.performBufferPoolTest._61.if.exit.7                              # ir inst 239 fin
.F.performBufferPoolTest._61.if.exit.7:
  addi a1, s5, 1                                                        # ir inst 240 fin
  addi a6, s11, 1                                                       # ir inst 241 fin
  addi a7, t5, 1                                                        # ir inst 242 fin
# Phi connections
  mv s1, a5
  mv s0, a4
  mv s5, a1
  mv s7, a3
  mv s11, a6
  mv t3, a2
  mv t5, a7
  j .F.performBufferPoolTest._24.while.cond.1                           # ir inst 243 fin
.F.performBufferPoolTest._62.while.exit.1:
  addi t5, t4, 1                                                        # ir inst 244 fin
# Phi connections
  mv s9, s1
  mv s10, s0
  mv t4, t5
  mv t5, s11
  mv t6, t3
  mv s11, s5
  mv t3, s7
  j .F.performBufferPoolTest._19.while.cond.0                           # ir inst 245 fin
.F.performBufferPoolTest._63.while.exit.0:
  li t2, 100
  mul t5, s10, t2                                                       # ir inst 246 fin
  add t4, s10, s9                                                       # ir inst 247 fin
  div t3, t5, t4                                                        # ir inst 248 fin
# Start call preparation
  sd t3, 0(sp)
  sd t6, 8(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
  ld t6, 8(sp)
# ir inst 249 fin
# Start call preparation
  sd t3, 0(sp)
  sd t6, 8(sp)
  mv a0, s9
  call printlnInt
  ld t3, 0(sp)
  ld t6, 8(sp)
# ir inst 250 fin
# Start call preparation
  sd t3, 0(sp)
  sd t6, 8(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t6, 8(sp)
# ir inst 251 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 252 fin
# Start call preparation
  li a0, 26008
  call printlnInt
# ir inst 253 fin
  j .F.performBufferPoolTest.epilogue                                   # ir inst 254 fin
.F.performBufferPoolTest.epilogue:
  ld ra, 136(sp)
  ld s10, 64(sp)
  ld s9, 72(sp)
  ld s8, 80(sp)
  ld s11, 88(sp)
  ld s7, 96(sp)
  ld s5, 104(sp)
  ld s0, 112(sp)
  ld s6, 120(sp)
  ld s1, 128(sp)
  li t0, 3552
  add sp, sp, t0
  ret

.globl .F.findFreeBufferSlot
.F.findFreeBufferSlot:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.findFreeBufferSlot._0.entry.0:
# Phi connections
  li t6, 0
  j .F.findFreeBufferSlot._1.while.cond.0                               # ir inst 1 fin
.F.findFreeBufferSlot._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.findFreeBufferSlot._2.while.body.0
  j .F.findFreeBufferSlot._6.while.exit.0                               # ir inst 4 fin
.F.findFreeBufferSlot._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t4)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 8 fin
  bnez t4, .F.findFreeBufferSlot._3.if.then.0
  j .F.findFreeBufferSlot._4.if.else.0                                  # ir inst 9 fin
.F.findFreeBufferSlot._3.if.then.0:
  mv a0, t6
  j .F.findFreeBufferSlot.epilogue                                      # ir inst 10 fin
.F.findFreeBufferSlot._4.if.else.0:
  j .F.findFreeBufferSlot._5.if.exit.0                                  # ir inst 11 fin
.F.findFreeBufferSlot._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.findFreeBufferSlot._1.while.cond.0                               # ir inst 13 fin
.F.findFreeBufferSlot._6.while.exit.0:
  li a0, -1
  j .F.findFreeBufferSlot.epilogue                                      # ir inst 14 fin
.F.findFreeBufferSlot.epilogue:
  ret

.globl .F.clockPageReplacement
.F.clockPageReplacement:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.clockPageReplacement._0.entry.0:
# Phi connections
  mv t5, a3
  li t6, 0
  j .F.clockPageReplacement._1.while.cond.0                             # ir inst 1 fin
.F.clockPageReplacement._1.while.cond.0:
  li t2, 2
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.clockPageReplacement._2.while.body.0
  j .F.clockPageReplacement._12.while.exit.0                            # ir inst 5 fin
.F.clockPageReplacement._2.while.body.0:
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.clockPageReplacement._3.if.then.0
  j .F.clockPageReplacement._7.if.else.0                                # ir inst 10 fin
.F.clockPageReplacement._3.if.then.0:
  mv t4, t5                                                             # ir inst 11 fin
  add t3, a2, t4                                                        # ir inst 12 fin
  lb t4, 0(t3)                                                          # ir inst 13 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 14 fin
  bnez t3, .F.clockPageReplacement._4.if.then.1
  j .F.clockPageReplacement._5.if.else.1                                # ir inst 15 fin
.F.clockPageReplacement._4.if.then.1:
  mv a0, t5
  j .F.clockPageReplacement.epilogue                                    # ir inst 16 fin
.F.clockPageReplacement._5.if.else.1:
  mv t4, t5                                                             # ir inst 17 fin
  add t3, a2, t4                                                        # ir inst 18 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 19 fin
  j .F.clockPageReplacement._6.if.exit.1                                # ir inst 20 fin
.F.clockPageReplacement._6.if.exit.1:
  j .F.clockPageReplacement._8.if.exit.0                                # ir inst 21 fin
.F.clockPageReplacement._7.if.else.0:
  j .F.clockPageReplacement._8.if.exit.0                                # ir inst 22 fin
.F.clockPageReplacement._8.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 23 fin
  rem t5, t4, a4                                                        # ir inst 24 fin
  xor t0, t5, a3
  sltiu t4, t0, 1                                                       # ir inst 25 fin
  bnez t4, .F.clockPageReplacement._9.if.then.2
  j .F.clockPageReplacement._10.if.else.2                               # ir inst 26 fin
.F.clockPageReplacement._9.if.then.2:
  addi t4, t6, 1                                                        # ir inst 27 fin
# Phi connections
  mv t6, t4
  j .F.clockPageReplacement._11.if.exit.2                               # ir inst 28 fin
.F.clockPageReplacement._10.if.else.2:
# Phi connections
  j .F.clockPageReplacement._11.if.exit.2                               # ir inst 29 fin
.F.clockPageReplacement._11.if.exit.2:
# Phi connections
  j .F.clockPageReplacement._1.while.cond.0                             # ir inst 31 fin
.F.clockPageReplacement._12.while.exit.0:
# Phi connections
  li t6, 0
  j .F.clockPageReplacement._13.while.cond.1                            # ir inst 32 fin
.F.clockPageReplacement._13.while.cond.1:
  slt t5, t6, a4                                                        # ir inst 34 fin
  bnez t5, .F.clockPageReplacement._14.while.body.1
  j .F.clockPageReplacement._18.while.exit.1                            # ir inst 35 fin
.F.clockPageReplacement._14.while.body.1:
  mv t5, t6                                                             # ir inst 36 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 37 fin
  lw t5, 0(t4)                                                          # ir inst 38 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 39 fin
  bnez t4, .F.clockPageReplacement._15.if.then.3
  j .F.clockPageReplacement._16.if.else.3                               # ir inst 40 fin
.F.clockPageReplacement._15.if.then.3:
  mv a0, t6
  j .F.clockPageReplacement.epilogue                                    # ir inst 41 fin
.F.clockPageReplacement._16.if.else.3:
  j .F.clockPageReplacement._17.if.exit.3                               # ir inst 42 fin
.F.clockPageReplacement._17.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 43 fin
# Phi connections
  mv t6, t5
  j .F.clockPageReplacement._13.while.cond.1                            # ir inst 44 fin
.F.clockPageReplacement._18.while.exit.1:
  li a0, -1
  j .F.clockPageReplacement.epilogue                                    # ir inst 45 fin
.F.clockPageReplacement.epilogue:
  ret

.globl .F.performQueryOptimizationTest
.F.performQueryOptimizationTest:
# spill func args num: 0,             range:      560(sp) -      560(sp)
# local var size: 472,                range:       88(sp) -      560(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 6 / 12,        range:       32(sp) -       80(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -560
  sd s6, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd s9, 56(sp)
  sd s8, 64(sp)
  sd s7, 72(sp)
  sd ra, 80(sp)
.F.performQueryOptimizationTest._0.entry.0:
# Start call preparation
  li a0, 26009
  call printlnInt
# ir inst 9 fin
  addi t1, sp, 288
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 288
  addi t6, t1, 4                                                        # ir inst 13 fin
  li t1, 200
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 288
  addi t6, t1, 8                                                        # ir inst 15 fin
  li t1, 150
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 288
  addi t6, t1, 12                                                       # ir inst 17 fin
  li t1, 300
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 288
  addi t6, t1, 16                                                       # ir inst 19 fin
  li t1, 250
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 308
  addi t6, t1, 0                                                        # ir inst 22 fin
  li t1, 10
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 308
  addi t6, t1, 4                                                        # ir inst 24 fin
  li t1, 20
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t1, sp, 308
  addi t6, t1, 8                                                        # ir inst 26 fin
  li t1, 15
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t1, sp, 308
  addi t6, t1, 12                                                       # ir inst 28 fin
  li t1, 30
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t1, sp, 308
  addi t6, t1, 16                                                       # ir inst 30 fin
  li t1, 25
  sw t1, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 388
  addi t6, t1, 0                                                        # ir inst 34 fin
  li t1, 10
  sw t1, 0(t6)                                                          # ir inst 35 fin
  addi t1, sp, 388
  addi t6, t1, 4                                                        # ir inst 36 fin
  li t1, 25
  sw t1, 0(t6)                                                          # ir inst 37 fin
  addi t1, sp, 388
  addi t6, t1, 8                                                        # ir inst 38 fin
  li t1, 50
  sw t1, 0(t6)                                                          # ir inst 39 fin
  addi t1, sp, 328
  addi t6, t1, 0                                                        # ir inst 40 fin
# Phi connections
  li t5, 0
  j .F.performQueryOptimizationTest._1.array.cond.0                     # ir inst 41 fin
.F.performQueryOptimizationTest._1.array.cond.0:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 43 fin
  bnez t4, .F.performQueryOptimizationTest._2.array.body.0
  j .F.performQueryOptimizationTest._3.array.exit.0                     # ir inst 44 fin
.F.performQueryOptimizationTest._2.array.body.0:
  li t1, 12
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 45 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 12
  addi t1, sp, 388
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 46 fin
  addi t4, t5, 1                                                        # ir inst 47 fin
# Phi connections
  mv t5, t4
  j .F.performQueryOptimizationTest._1.array.cond.0                     # ir inst 48 fin
.F.performQueryOptimizationTest._3.array.exit.0:
  addi t1, sp, 400
  addi t6, t1, 0                                                        # ir inst 50 fin
# Phi connections
  li t5, 0
  j .F.performQueryOptimizationTest._4.array.cond.1                     # ir inst 51 fin
.F.performQueryOptimizationTest._4.array.cond.1:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 53 fin
  bnez t4, .F.performQueryOptimizationTest._5.array.body.1
  j .F.performQueryOptimizationTest._6.array.exit.1                     # ir inst 54 fin
.F.performQueryOptimizationTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 55 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 56 fin
  addi t4, t5, 1                                                        # ir inst 57 fin
# Phi connections
  mv t5, t4
  j .F.performQueryOptimizationTest._4.array.cond.1                     # ir inst 58 fin
.F.performQueryOptimizationTest._6.array.exit.1:
  addi t1, sp, 480
  addi t6, t1, 0                                                        # ir inst 60 fin
# Phi connections
  li t5, 0
  j .F.performQueryOptimizationTest._7.array.cond.2                     # ir inst 61 fin
.F.performQueryOptimizationTest._7.array.cond.2:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 63 fin
  bnez t4, .F.performQueryOptimizationTest._8.array.body.2
  j .F.performQueryOptimizationTest._9.array.exit.2                     # ir inst 64 fin
.F.performQueryOptimizationTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 65 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 66 fin
  addi t4, t5, 1                                                        # ir inst 67 fin
# Phi connections
  mv t5, t4
  j .F.performQueryOptimizationTest._7.array.cond.2                     # ir inst 68 fin
.F.performQueryOptimizationTest._9.array.exit.2:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performQueryOptimizationTest._10.while.cond.0                    # ir inst 69 fin
.F.performQueryOptimizationTest._10.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 72 fin
  bnez t4, .F.performQueryOptimizationTest._11.while.body.0
  j .F.performQueryOptimizationTest._30.while.exit.0                    # ir inst 73 fin
.F.performQueryOptimizationTest._11.while.body.0:
  li t2, 3
  rem t4, t6, t2                                                        # ir inst 74 fin
  addi t3, t4, 2                                                        # ir inst 75 fin
# Phi connections
  li s9, 0
  li s10, 999999
  mv s11, t5
  li t4, -1
  j .F.performQueryOptimizationTest._12.while.cond.1                    # ir inst 76 fin
.F.performQueryOptimizationTest._12.while.cond.1:
  li t2, 6
  slt s8, s9, t2                                                        # ir inst 81 fin
  bnez s8, .F.performQueryOptimizationTest._13.lazy.then.0
  j .F.performQueryOptimizationTest._14.lazy.else.0                     # ir inst 82 fin
.F.performQueryOptimizationTest._13.lazy.then.0:
  li t2, 20
  slt s8, s11, t2                                                       # ir inst 83 fin
# Phi connections
  j .F.performQueryOptimizationTest._15.lazy.exit.0                     # ir inst 84 fin
.F.performQueryOptimizationTest._14.lazy.else.0:
# Phi connections
  li s8, 0
  j .F.performQueryOptimizationTest._15.lazy.exit.0                     # ir inst 85 fin
.F.performQueryOptimizationTest._15.lazy.exit.0:
  bnez s8, .F.performQueryOptimizationTest._16.while.body.1
  j .F.performQueryOptimizationTest._26.while.exit.1                    # ir inst 87 fin
.F.performQueryOptimizationTest._16.while.body.1:
  li t2, 3
  rem s8, s9, t2                                                        # ir inst 88 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 89 fin
  bnez s7, .F.performQueryOptimizationTest._17.if.then.0
  j .F.performQueryOptimizationTest._18.if.else.0                       # ir inst 90 fin
.F.performQueryOptimizationTest._17.if.then.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 288
  mv a1, t1
  addi t1, sp, 88
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 91 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 308
  mv a1, t1
  addi t1, sp, 108
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 92 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t6
  mv a2, t3
  addi t1, sp, 108
  mv a1, t1
  addi t1, sp, 88
  mv a0, t1
  call .F.estimateNestedLoopCost
  mv s8, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 93 fin
  mv s7, s11                                                            # ir inst 94 fin
  slli t2, s7, 2
  addi t1, sp, 480
  add s6, t1, t2                                                        # ir inst 95 fin
  li t1, 0
  sw t1, 0(s6)                                                          # ir inst 96 fin
# Phi connections
  j .F.performQueryOptimizationTest._22.if.exit.0                       # ir inst 97 fin
.F.performQueryOptimizationTest._18.if.else.0:
  li t2, 3
  rem s8, s9, t2                                                        # ir inst 98 fin
  li t2, 1
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 99 fin
  bnez s7, .F.performQueryOptimizationTest._19.if.then.1
  j .F.performQueryOptimizationTest._20.if.else.1                       # ir inst 100 fin
.F.performQueryOptimizationTest._19.if.then.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 288
  mv a1, t1
  addi t1, sp, 128
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 101 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 308
  mv a1, t1
  addi t1, sp, 148
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 102 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t6
  mv a2, t3
  addi t1, sp, 148
  mv a1, t1
  addi t1, sp, 128
  mv a0, t1
  call .F.estimateHashJoinCost
  mv s8, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 103 fin
  mv s7, s11                                                            # ir inst 104 fin
  slli t2, s7, 2
  addi t1, sp, 480
  add s6, t1, t2                                                        # ir inst 105 fin
  li t1, 1
  sw t1, 0(s6)                                                          # ir inst 106 fin
# Phi connections
  j .F.performQueryOptimizationTest._21.if.exit.1                       # ir inst 107 fin
.F.performQueryOptimizationTest._20.if.else.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 288
  mv a1, t1
  addi t1, sp, 168
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 108 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 308
  mv a1, t1
  addi t1, sp, 188
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 109 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t6
  mv a2, t3
  addi t1, sp, 188
  mv a1, t1
  addi t1, sp, 168
  mv a0, t1
  call .F.estimateSortMergeCost
  mv s8, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 110 fin
  mv s7, s11                                                            # ir inst 111 fin
  slli t2, s7, 2
  addi t1, sp, 480
  add s6, t1, t2                                                        # ir inst 112 fin
  li t1, 2
  sw t1, 0(s6)                                                          # ir inst 113 fin
# Phi connections
  j .F.performQueryOptimizationTest._21.if.exit.1                       # ir inst 114 fin
.F.performQueryOptimizationTest._21.if.exit.1:
# Phi connections
  j .F.performQueryOptimizationTest._22.if.exit.0                       # ir inst 116 fin
.F.performQueryOptimizationTest._22.if.exit.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 60
  addi t1, sp, 328
  mv a1, t1
  addi t1, sp, 208
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 118 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  mv a1, t3
  addi t1, sp, 208
  mv a0, t1
  call .F.selectOptimalIndex
  mv s7, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 119 fin
  add s6, s8, s7                                                        # ir inst 120 fin
  mv s8, s11                                                            # ir inst 121 fin
  slli t2, s8, 2
  addi t1, sp, 400
  add s7, t1, t2                                                        # ir inst 122 fin
  sw s6, 0(s7)                                                          # ir inst 123 fin
  slt s8, s6, s10                                                       # ir inst 124 fin
  bnez s8, .F.performQueryOptimizationTest._23.if.then.2
  j .F.performQueryOptimizationTest._24.if.else.2                       # ir inst 125 fin
.F.performQueryOptimizationTest._23.if.then.2:
# Phi connections
  mv s8, s6
  mv s10, s11
  j .F.performQueryOptimizationTest._25.if.exit.2                       # ir inst 126 fin
.F.performQueryOptimizationTest._24.if.else.2:
# Phi connections
  mv s8, s10
  mv s10, t4
  j .F.performQueryOptimizationTest._25.if.exit.2                       # ir inst 127 fin
.F.performQueryOptimizationTest._25.if.exit.2:
  addi s7, s11, 1                                                       # ir inst 130 fin
  addi s6, s9, 1                                                        # ir inst 131 fin
# Phi connections
  mv s9, s6
  mv s11, s7
  mv t4, s10
  mv s10, s8
  j .F.performQueryOptimizationTest._12.while.cond.1                    # ir inst 132 fin
.F.performQueryOptimizationTest._26.while.exit.1:
  li t2, 0
  slt t0, t4, t2
  xori s10, t0, 1                                                       # ir inst 133 fin
  bnez s10, .F.performQueryOptimizationTest._27.if.then.3
  j .F.performQueryOptimizationTest._28.if.else.3                       # ir inst 134 fin
.F.performQueryOptimizationTest._27.if.then.3:
  mv s10, t4                                                            # ir inst 135 fin
  slli t2, s10, 2
  addi t1, sp, 480
  add s9, t1, t2                                                        # ir inst 136 fin
  lw s10, 0(s9)                                                         # ir inst 137 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 288
  mv a1, t1
  addi t1, sp, 268
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 138 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t3
  addi t1, sp, 268
  mv a1, t1
  mv a0, s10
  call .F.simulatePlanExecution
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 139 fin
  mv t3, t4                                                             # ir inst 140 fin
  slli t2, t3, 2
  addi t1, sp, 400
  add t4, t1, t2                                                        # ir inst 141 fin
  lw t3, 0(t4)                                                          # ir inst 142 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s9
  mv a0, t3
  call .F.calculateCostAccuracy
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 143 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 144 fin
  j .F.performQueryOptimizationTest._29.if.exit.3                       # ir inst 145 fin
.F.performQueryOptimizationTest._28.if.else.3:
  j .F.performQueryOptimizationTest._29.if.exit.3                       # ir inst 146 fin
.F.performQueryOptimizationTest._29.if.exit.3:
  addi t4, t6, 1                                                        # ir inst 147 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j .F.performQueryOptimizationTest._10.while.cond.0                    # ir inst 148 fin
.F.performQueryOptimizationTest._30.while.exit.0:
# Phi connections
  li s11, 0
  li t3, 0
  li t4, 0
  li t6, 0
  j .F.performQueryOptimizationTest._31.while.cond.2                    # ir inst 149 fin
.F.performQueryOptimizationTest._31.while.cond.2:
  slt s10, t6, t5                                                       # ir inst 154 fin
  bnez s10, .F.performQueryOptimizationTest._32.while.body.2
  j .F.performQueryOptimizationTest._39.while.exit.2                    # ir inst 155 fin
.F.performQueryOptimizationTest._32.while.body.2:
  mv s10, t6                                                            # ir inst 156 fin
  slli t2, s10, 2
  addi t1, sp, 480
  add s9, t1, t2                                                        # ir inst 157 fin
  lw s10, 0(s9)                                                         # ir inst 158 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 159 fin
  bnez s9, .F.performQueryOptimizationTest._33.if.then.4
  j .F.performQueryOptimizationTest._34.if.else.4                       # ir inst 160 fin
.F.performQueryOptimizationTest._33.if.then.4:
  addi s10, s11, 1                                                      # ir inst 161 fin
# Phi connections
  mv s8, s10
  mv s9, t3
  mv s10, t4
  j .F.performQueryOptimizationTest._38.if.exit.4                       # ir inst 162 fin
.F.performQueryOptimizationTest._34.if.else.4:
  mv s10, t6                                                            # ir inst 163 fin
  slli t2, s10, 2
  addi t1, sp, 480
  add s9, t1, t2                                                        # ir inst 164 fin
  lw s10, 0(s9)                                                         # ir inst 165 fin
  li t2, 1
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 166 fin
  bnez s9, .F.performQueryOptimizationTest._35.if.then.5
  j .F.performQueryOptimizationTest._36.if.else.5                       # ir inst 167 fin
.F.performQueryOptimizationTest._35.if.then.5:
  addi s10, t3, 1                                                       # ir inst 168 fin
# Phi connections
  mv s9, s10
  mv s10, t4
  j .F.performQueryOptimizationTest._37.if.exit.5                       # ir inst 169 fin
.F.performQueryOptimizationTest._36.if.else.5:
  addi s10, t4, 1                                                       # ir inst 170 fin
# Phi connections
  mv s9, t3
  j .F.performQueryOptimizationTest._37.if.exit.5                       # ir inst 171 fin
.F.performQueryOptimizationTest._37.if.exit.5:
# Phi connections
  mv s8, s11
  j .F.performQueryOptimizationTest._38.if.exit.4                       # ir inst 174 fin
.F.performQueryOptimizationTest._38.if.exit.4:
  addi s7, t6, 1                                                        # ir inst 178 fin
# Phi connections
  mv s11, s8
  mv t3, s9
  mv t4, s10
  mv t6, s7
  j .F.performQueryOptimizationTest._31.while.cond.2                    # ir inst 179 fin
.F.performQueryOptimizationTest._39.while.exit.2:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  mv a0, s11
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
# ir inst 180 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
# ir inst 181 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 182 fin
# Start call preparation
  li a0, 26010
  call printlnInt
# ir inst 183 fin
  j .F.performQueryOptimizationTest.epilogue                            # ir inst 184 fin
.F.performQueryOptimizationTest.epilogue:
  ld ra, 80(sp)
  ld s6, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  ld s9, 56(sp)
  ld s8, 64(sp)
  ld s7, 72(sp)
  addi sp, sp, 560
  ret

.globl .F.estimateNestedLoopCost
.F.estimateNestedLoopCost:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.estimateNestedLoopCost._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.estimateNestedLoopCost._1.while.cond.0                           # ir inst 1 fin
.F.estimateNestedLoopCost._1.while.cond.0:
  addi t4, a2, -1                                                       # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.estimateNestedLoopCost._2.while.body.0
  j .F.estimateNestedLoopCost._3.while.exit.0                           # ir inst 6 fin
.F.estimateNestedLoopCost._2.while.body.0:
  li t2, 5
  rem t4, t6, t2                                                        # ir inst 7 fin
  addi t3, t6, 1                                                        # ir inst 8 fin
  li t2, 5
  rem s11, t3, t2                                                       # ir inst 9 fin
  mv t3, t4                                                             # ir inst 10 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  lw t3, 0(t4)                                                          # ir inst 12 fin
  mv t4, s11                                                            # ir inst 13 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 14 fin
  lw t4, 0(s11)                                                         # ir inst 15 fin
  mul s11, t3, t4                                                       # ir inst 16 fin
  add t4, t5, s11                                                       # ir inst 17 fin
  addi t3, t6, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.estimateNestedLoopCost._1.while.cond.0                           # ir inst 19 fin
.F.estimateNestedLoopCost._3.while.exit.0:
  li t2, 100
  mul t6, a3, t2                                                        # ir inst 20 fin
  add t4, t5, t6                                                        # ir inst 21 fin
  mv a0, t4
  j .F.estimateNestedLoopCost.epilogue                                  # ir inst 22 fin
.F.estimateNestedLoopCost.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.estimateHashJoinCost
.F.estimateHashJoinCost:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.estimateHashJoinCost._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.estimateHashJoinCost._1.while.cond.0                             # ir inst 1 fin
.F.estimateHashJoinCost._1.while.cond.0:
  addi t4, a2, -1                                                       # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.estimateHashJoinCost._2.while.body.0
  j .F.estimateHashJoinCost._3.while.exit.0                             # ir inst 6 fin
.F.estimateHashJoinCost._2.while.body.0:
  li t2, 5
  rem t4, t6, t2                                                        # ir inst 7 fin
  addi t3, t6, 1                                                        # ir inst 8 fin
  li t2, 5
  rem s11, t3, t2                                                       # ir inst 9 fin
  mv t3, t4                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 11 fin
  lw t3, 0(s10)                                                         # ir inst 12 fin
  add s10, t5, t3                                                       # ir inst 13 fin
  mv t3, s11                                                            # ir inst 14 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 15 fin
  lw t3, 0(s11)                                                         # ir inst 16 fin
  add s11, s10, t3                                                      # ir inst 17 fin
  mv t3, t4                                                             # ir inst 18 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  li t2, 10
  div t4, t3, t2                                                        # ir inst 21 fin
  add t3, s11, t4                                                       # ir inst 22 fin
  addi t4, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.estimateHashJoinCost._1.while.cond.0                             # ir inst 24 fin
.F.estimateHashJoinCost._3.while.exit.0:
  li t2, 50
  mul t6, a3, t2                                                        # ir inst 25 fin
  add t4, t5, t6                                                        # ir inst 26 fin
  mv a0, t4
  j .F.estimateHashJoinCost.epilogue                                    # ir inst 27 fin
.F.estimateHashJoinCost.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.estimateSortMergeCost
.F.estimateSortMergeCost:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 4 / 12,        range:       64(sp) -       96(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s8, 64(sp)
  sd s9, 72(sp)
  sd s10, 80(sp)
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.estimateSortMergeCost._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.estimateSortMergeCost._1.while.cond.0                            # ir inst 1 fin
.F.estimateSortMergeCost._1.while.cond.0:
  addi t4, a2, -1                                                       # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.estimateSortMergeCost._2.while.body.0
  j .F.estimateSortMergeCost._3.while.exit.0                            # ir inst 6 fin
.F.estimateSortMergeCost._2.while.body.0:
  li t2, 5
  rem t4, t6, t2                                                        # ir inst 7 fin
  addi t3, t6, 1                                                        # ir inst 8 fin
  li t2, 5
  rem s11, t3, t2                                                       # ir inst 9 fin
  mv t3, t4                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 11 fin
  lw t3, 0(s10)                                                         # ir inst 12 fin
  mv s10, t4                                                            # ir inst 13 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 14 fin
  lw s10, 0(s9)                                                         # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a0, s10
  call .F.logBase2
  mv s9, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 16 fin
  mul s10, t3, s9                                                       # ir inst 17 fin
  mv t3, s11                                                            # ir inst 18 fin
  slli t2, t3, 2
  add s9, a0, t2                                                        # ir inst 19 fin
  lw t3, 0(s9)                                                          # ir inst 20 fin
  mv s9, s11                                                            # ir inst 21 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 22 fin
  lw s9, 0(s8)                                                          # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a0, s9
  call .F.logBase2
  mv s8, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 24 fin
  mul s9, t3, s8                                                        # ir inst 25 fin
  add t3, t5, s10                                                       # ir inst 26 fin
  add s10, t3, s9                                                       # ir inst 27 fin
  mv t3, t4                                                             # ir inst 28 fin
  slli t2, t3, 2
  add t4, a1, t2                                                        # ir inst 29 fin
  lw t3, 0(t4)                                                          # ir inst 30 fin
  add t4, s10, t3                                                       # ir inst 31 fin
  mv t3, s11                                                            # ir inst 32 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 33 fin
  lw t3, 0(s11)                                                         # ir inst 34 fin
  add s11, t4, t3                                                       # ir inst 35 fin
  addi t4, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j .F.estimateSortMergeCost._1.while.cond.0                            # ir inst 37 fin
.F.estimateSortMergeCost._3.while.exit.0:
  li t2, 75
  mul t6, a3, t2                                                        # ir inst 38 fin
  add t4, t5, t6                                                        # ir inst 39 fin
  mv a0, t4
  j .F.estimateSortMergeCost.epilogue                                   # ir inst 40 fin
.F.estimateSortMergeCost.epilogue:
  ld ra, 96(sp)
  ld s8, 64(sp)
  ld s9, 72(sp)
  ld s10, 80(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.logBase2
.F.logBase2:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.logBase2._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.logBase2._1.if.then.0
  j .F.logBase2._2.if.else.0                                            # ir inst 2 fin
.F.logBase2._1.if.then.0:
  li a0, 1
  j .F.logBase2.epilogue                                                # ir inst 3 fin
.F.logBase2._2.if.else.0:
  j .F.logBase2._3.if.exit.0                                            # ir inst 4 fin
.F.logBase2._3.if.exit.0:
  li t2, 2
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 5 fin
  bnez t6, .F.logBase2._4.if.then.1
  j .F.logBase2._5.if.else.1                                            # ir inst 6 fin
.F.logBase2._4.if.then.1:
  li a0, 1
  j .F.logBase2.epilogue                                                # ir inst 7 fin
.F.logBase2._5.if.else.1:
  j .F.logBase2._6.if.exit.1                                            # ir inst 8 fin
.F.logBase2._6.if.exit.1:
  li t2, 4
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 9 fin
  bnez t6, .F.logBase2._7.if.then.2
  j .F.logBase2._8.if.else.2                                            # ir inst 10 fin
.F.logBase2._7.if.then.2:
  li a0, 2
  j .F.logBase2.epilogue                                                # ir inst 11 fin
.F.logBase2._8.if.else.2:
  j .F.logBase2._9.if.exit.2                                            # ir inst 12 fin
.F.logBase2._9.if.exit.2:
  li t2, 8
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 13 fin
  bnez t6, .F.logBase2._10.if.then.3
  j .F.logBase2._11.if.else.3                                           # ir inst 14 fin
.F.logBase2._10.if.then.3:
  li a0, 3
  j .F.logBase2.epilogue                                                # ir inst 15 fin
.F.logBase2._11.if.else.3:
  j .F.logBase2._12.if.exit.3                                           # ir inst 16 fin
.F.logBase2._12.if.exit.3:
  li t2, 16
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 17 fin
  bnez t6, .F.logBase2._13.if.then.4
  j .F.logBase2._14.if.else.4                                           # ir inst 18 fin
.F.logBase2._13.if.then.4:
  li a0, 4
  j .F.logBase2.epilogue                                                # ir inst 19 fin
.F.logBase2._14.if.else.4:
  j .F.logBase2._15.if.exit.4                                           # ir inst 20 fin
.F.logBase2._15.if.exit.4:
  li t2, 32
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 21 fin
  bnez t6, .F.logBase2._16.if.then.5
  j .F.logBase2._17.if.else.5                                           # ir inst 22 fin
.F.logBase2._16.if.then.5:
  li a0, 5
  j .F.logBase2.epilogue                                                # ir inst 23 fin
.F.logBase2._17.if.else.5:
  j .F.logBase2._18.if.exit.5                                           # ir inst 24 fin
.F.logBase2._18.if.exit.5:
  li t2, 64
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 25 fin
  bnez t6, .F.logBase2._19.if.then.6
  j .F.logBase2._20.if.else.6                                           # ir inst 26 fin
.F.logBase2._19.if.then.6:
  li a0, 6
  j .F.logBase2.epilogue                                                # ir inst 27 fin
.F.logBase2._20.if.else.6:
  j .F.logBase2._21.if.exit.6                                           # ir inst 28 fin
.F.logBase2._21.if.exit.6:
  li t2, 128
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 29 fin
  bnez t6, .F.logBase2._22.if.then.7
  j .F.logBase2._23.if.else.7                                           # ir inst 30 fin
.F.logBase2._22.if.then.7:
  li a0, 7
  j .F.logBase2.epilogue                                                # ir inst 31 fin
.F.logBase2._23.if.else.7:
  j .F.logBase2._24.if.exit.7                                           # ir inst 32 fin
.F.logBase2._24.if.exit.7:
  li t2, 256
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 33 fin
  bnez t6, .F.logBase2._25.if.then.8
  j .F.logBase2._26.if.else.8                                           # ir inst 34 fin
.F.logBase2._25.if.then.8:
  li a0, 8
  j .F.logBase2.epilogue                                                # ir inst 35 fin
.F.logBase2._26.if.else.8:
  j .F.logBase2._27.if.exit.8                                           # ir inst 36 fin
.F.logBase2._27.if.exit.8:
  li a0, 9
  j .F.logBase2.epilogue                                                # ir inst 37 fin
.F.logBase2.epilogue:
  ret

.globl .F.selectOptimalIndex
.F.selectOptimalIndex:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.selectOptimalIndex._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.selectOptimalIndex._1.while.cond.0                               # ir inst 1 fin
.F.selectOptimalIndex._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.selectOptimalIndex._2.while.body.0
  j .F.selectOptimalIndex._9.while.exit.0                               # ir inst 5 fin
.F.selectOptimalIndex._2.while.body.0:
  li t2, 5
  rem t4, t6, t2                                                        # ir inst 6 fin
  add t3, a2, t6                                                        # ir inst 7 fin
  li t2, 3
  rem s11, t3, t2                                                       # ir inst 8 fin
  mv t3, t4                                                             # ir inst 9 fin
  li t1, 12
  mul t2, t3, t1
  add t4, a0, t2                                                        # ir inst 10 fin
  mv t3, s11                                                            # ir inst 11 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 12 fin
  lw t4, 0(s11)                                                         # ir inst 13 fin
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 14 fin
  bnez t3, .F.selectOptimalIndex._3.if.then.0
  j .F.selectOptimalIndex._4.if.else.0                                  # ir inst 15 fin
.F.selectOptimalIndex._3.if.then.0:
  addi t3, t5, 10                                                       # ir inst 16 fin
# Phi connections
  mv t4, t3
  j .F.selectOptimalIndex._8.if.exit.0                                  # ir inst 17 fin
.F.selectOptimalIndex._4.if.else.0:
  li t2, 40
  slt t3, t4, t2                                                        # ir inst 18 fin
  bnez t3, .F.selectOptimalIndex._5.if.then.1
  j .F.selectOptimalIndex._6.if.else.1                                  # ir inst 19 fin
.F.selectOptimalIndex._5.if.then.1:
  addi t4, t5, 25                                                       # ir inst 20 fin
# Phi connections
  j .F.selectOptimalIndex._7.if.exit.1                                  # ir inst 21 fin
.F.selectOptimalIndex._6.if.else.1:
  addi t4, t5, 50                                                       # ir inst 22 fin
# Phi connections
  j .F.selectOptimalIndex._7.if.exit.1                                  # ir inst 23 fin
.F.selectOptimalIndex._7.if.exit.1:
# Phi connections
  j .F.selectOptimalIndex._8.if.exit.0                                  # ir inst 25 fin
.F.selectOptimalIndex._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 27 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.selectOptimalIndex._1.while.cond.0                               # ir inst 28 fin
.F.selectOptimalIndex._9.while.exit.0:
  mv a0, t5
  j .F.selectOptimalIndex.epilogue                                      # ir inst 29 fin
.F.selectOptimalIndex.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.simulatePlanExecution
.F.simulatePlanExecution:
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
.F.simulatePlanExecution._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.simulatePlanExecution._1.if.then.0
  j .F.simulatePlanExecution._5.if.else.0                               # ir inst 2 fin
.F.simulatePlanExecution._1.if.then.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulatePlanExecution._2.while.cond.0                            # ir inst 3 fin
.F.simulatePlanExecution._2.while.cond.0:
  addi t4, a2, -1                                                       # ir inst 6 fin
  slt t3, t5, t4                                                        # ir inst 7 fin
  bnez t3, .F.simulatePlanExecution._3.while.body.0
  j .F.simulatePlanExecution._4.while.exit.0                            # ir inst 8 fin
.F.simulatePlanExecution._3.while.body.0:
  mv t4, t5                                                             # ir inst 9 fin
  li t2, 5
  remu t3, t4, t2                                                       # ir inst 10 fin
  slli t2, t3, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  lw t3, 0(t4)                                                          # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  addi s11, t4, 1                                                       # ir inst 14 fin
  li t2, 5
  remu t4, s11, t2                                                      # ir inst 15 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 16 fin
  lw t4, 0(s11)                                                         # ir inst 17 fin
  mul s11, t3, t4                                                       # ir inst 18 fin
  li t2, 100
  div t4, s11, t2                                                       # ir inst 19 fin
  add t3, t6, t4                                                        # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.simulatePlanExecution._2.while.cond.0                            # ir inst 22 fin
.F.simulatePlanExecution._4.while.exit.0:
# Phi connections
  j .F.simulatePlanExecution._15.if.exit.0                              # ir inst 23 fin
.F.simulatePlanExecution._5.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 24 fin
  bnez t6, .F.simulatePlanExecution._6.if.then.1
  j .F.simulatePlanExecution._10.if.else.1                              # ir inst 25 fin
.F.simulatePlanExecution._6.if.then.1:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulatePlanExecution._7.while.cond.1                            # ir inst 26 fin
.F.simulatePlanExecution._7.while.cond.1:
  addi t4, a2, -1                                                       # ir inst 29 fin
  slt t3, t5, t4                                                        # ir inst 30 fin
  bnez t3, .F.simulatePlanExecution._8.while.body.1
  j .F.simulatePlanExecution._9.while.exit.1                            # ir inst 31 fin
.F.simulatePlanExecution._8.while.body.1:
  mv t4, t5                                                             # ir inst 32 fin
  li t2, 5
  remu t3, t4, t2                                                       # ir inst 33 fin
  slli t2, t3, 2
  add t4, a1, t2                                                        # ir inst 34 fin
  lw t3, 0(t4)                                                          # ir inst 35 fin
  mv t4, t5                                                             # ir inst 36 fin
  addi s11, t4, 1                                                       # ir inst 37 fin
  li t2, 5
  remu t4, s11, t2                                                      # ir inst 38 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 39 fin
  lw t4, 0(s11)                                                         # ir inst 40 fin
  add s11, t6, t3                                                       # ir inst 41 fin
  add s10, s11, t4                                                      # ir inst 42 fin
  li t2, 10
  div t4, t3, t2                                                        # ir inst 43 fin
  add t3, s10, t4                                                       # ir inst 44 fin
  addi t4, t5, 1                                                        # ir inst 45 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.simulatePlanExecution._7.while.cond.1                            # ir inst 46 fin
.F.simulatePlanExecution._9.while.exit.1:
# Phi connections
  j .F.simulatePlanExecution._14.if.exit.1                              # ir inst 47 fin
.F.simulatePlanExecution._10.if.else.1:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulatePlanExecution._11.while.cond.2                           # ir inst 48 fin
.F.simulatePlanExecution._11.while.cond.2:
  addi t4, a2, -1                                                       # ir inst 51 fin
  slt t3, t6, t4                                                        # ir inst 52 fin
  bnez t3, .F.simulatePlanExecution._12.while.body.2
  j .F.simulatePlanExecution._13.while.exit.2                           # ir inst 53 fin
.F.simulatePlanExecution._12.while.body.2:
  mv t4, t6                                                             # ir inst 54 fin
  li t2, 5
  remu t3, t4, t2                                                       # ir inst 55 fin
  slli t2, t3, 2
  add t4, a1, t2                                                        # ir inst 56 fin
  lw t3, 0(t4)                                                          # ir inst 57 fin
  mv t4, t6                                                             # ir inst 58 fin
  addi s11, t4, 1                                                       # ir inst 59 fin
  li t2, 5
  remu t4, s11, t2                                                      # ir inst 60 fin
  slli t2, t4, 2
  add s11, a1, t2                                                       # ir inst 61 fin
  lw t4, 0(s11)                                                         # ir inst 62 fin
  slli s11, t3, 1                                                       # ir inst 63 fin
  add s10, t5, s11                                                      # ir inst 64 fin
  slli s11, t4, 1                                                       # ir inst 65 fin
  add s9, s10, s11                                                      # ir inst 66 fin
  add s11, s9, t3                                                       # ir inst 67 fin
  add t3, s11, t4                                                       # ir inst 68 fin
  addi t4, t6, 1                                                        # ir inst 69 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.simulatePlanExecution._11.while.cond.2                           # ir inst 70 fin
.F.simulatePlanExecution._13.while.exit.2:
# Phi connections
  mv t6, t5
  j .F.simulatePlanExecution._14.if.exit.1                              # ir inst 71 fin
.F.simulatePlanExecution._14.if.exit.1:
# Phi connections
  j .F.simulatePlanExecution._15.if.exit.0                              # ir inst 73 fin
.F.simulatePlanExecution._15.if.exit.0:
  mv a0, t6
  j .F.simulatePlanExecution.epilogue                                   # ir inst 75 fin
.F.simulatePlanExecution.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.calculateCostAccuracy
.F.calculateCostAccuracy:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculateCostAccuracy._0.entry.0:
  slt t6, a1, a0                                                        # ir inst 1 fin
  bnez t6, .F.calculateCostAccuracy._1.if.then.0
  j .F.calculateCostAccuracy._2.if.else.0                               # ir inst 2 fin
.F.calculateCostAccuracy._1.if.then.0:
  sub t6, a0, a1                                                        # ir inst 3 fin
# Phi connections
  j .F.calculateCostAccuracy._3.if.exit.0                               # ir inst 4 fin
.F.calculateCostAccuracy._2.if.else.0:
  sub t6, a1, a0                                                        # ir inst 5 fin
# Phi connections
  j .F.calculateCostAccuracy._3.if.exit.0                               # ir inst 6 fin
.F.calculateCostAccuracy._3.if.exit.0:
  li t2, 100
  mul t5, t6, t2                                                        # ir inst 8 fin
  div t6, t5, a1                                                        # ir inst 9 fin
  li t1, 100
  sub t5, t1, t6                                                        # ir inst 10 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 11 fin
  bnez t6, .F.calculateCostAccuracy._4.if.then.1
  j .F.calculateCostAccuracy._5.if.else.1                               # ir inst 12 fin
.F.calculateCostAccuracy._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.calculateCostAccuracy._6.if.exit.1                               # ir inst 13 fin
.F.calculateCostAccuracy._5.if.else.1:
# Phi connections
  mv t6, t5
  j .F.calculateCostAccuracy._6.if.exit.1                               # ir inst 14 fin
.F.calculateCostAccuracy._6.if.exit.1:
  mv a0, t6
  j .F.calculateCostAccuracy.epilogue                                   # ir inst 16 fin
.F.calculateCostAccuracy.epilogue:
  ret

.globl .F.performHashTableTest
.F.performHashTableTest:
# spill func args num: 0,             range:    15008(sp) -    15008(sp)
# local var size: 14868,              range:      136(sp) -    15004(sp)
# return addr size: 8,                range:      128(sp) -      136(sp)
# callee save reg num: 9 / 12,        range:       56(sp) -      128(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -15008
  add sp, sp, t0
  sd s11, 56(sp)
  sd s8, 64(sp)
  sd s10, 72(sp)
  sd s7, 80(sp)
  sd s9, 88(sp)
  sd s5, 96(sp)
  sd s0, 104(sp)
  sd s1, 112(sp)
  sd s6, 120(sp)
  sd ra, 128(sp)
.F.performHashTableTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 26011
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 136
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._1.array.cond.0                             # ir inst 4 fin
.F.performHashTableTest._1.array.cond.0:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performHashTableTest._2.array.body.0
  j .F.performHashTableTest._3.array.exit.0                             # ir inst 7 fin
.F.performHashTableTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._1.array.cond.0                             # ir inst 11 fin
.F.performHashTableTest._3.array.exit.0:
  li t1, 2136
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._4.array.cond.1                             # ir inst 14 fin
.F.performHashTableTest._4.array.cond.1:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performHashTableTest._5.array.body.1
  j .F.performHashTableTest._6.array.exit.1                             # ir inst 17 fin
.F.performHashTableTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._4.array.cond.1                             # ir inst 21 fin
.F.performHashTableTest._6.array.exit.1:
# alloca %13
  li t2, 4136
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 23 fin
  li t1, 7340
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 26 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._7.array.cond.2                             # ir inst 27 fin
.F.performHashTableTest._7.array.cond.2:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 29 fin
  bnez t4, .F.performHashTableTest._8.array.body.2
  j .F.performHashTableTest._9.array.exit.2                             # ir inst 30 fin
.F.performHashTableTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 31 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 32 fin
  addi t4, t5, 1                                                        # ir inst 33 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._7.array.cond.2                             # ir inst 34 fin
.F.performHashTableTest._9.array.exit.2:
  li t1, 4140
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 35 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._10.array.cond.3                            # ir inst 36 fin
.F.performHashTableTest._10.array.cond.3:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 38 fin
  bnez t4, .F.performHashTableTest._11.array.body.3
  j .F.performHashTableTest._12.array.exit.3                            # ir inst 39 fin
.F.performHashTableTest._11.array.body.3:
  slli t2, t5, 5
  add t4, t6, t2                                                        # ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 32
  li t1, 7340
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
  addi t4, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._10.array.cond.3                            # ir inst 43 fin
.F.performHashTableTest._12.array.exit.3:
  li t1, 10572
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 46 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._13.array.cond.4                            # ir inst 47 fin
.F.performHashTableTest._13.array.cond.4:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 49 fin
  bnez t4, .F.performHashTableTest._14.array.body.4
  j .F.performHashTableTest._15.array.exit.4                            # ir inst 50 fin
.F.performHashTableTest._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 52 fin
  addi t4, t5, 1                                                        # ir inst 53 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._13.array.cond.4                            # ir inst 54 fin
.F.performHashTableTest._15.array.exit.4:
  li t1, 7372
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 55 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._16.array.cond.5                            # ir inst 56 fin
.F.performHashTableTest._16.array.cond.5:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 58 fin
  bnez t4, .F.performHashTableTest._17.array.body.5
  j .F.performHashTableTest._18.array.exit.5                            # ir inst 59 fin
.F.performHashTableTest._17.array.body.5:
  slli t2, t5, 5
  add t4, t6, t2                                                        # ir inst 60 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 32
  li t1, 10572
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 61 fin
  addi t4, t5, 1                                                        # ir inst 62 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._16.array.cond.5                            # ir inst 63 fin
.F.performHashTableTest._18.array.exit.5:
  li t1, 10604
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 65 fin
# Phi connections
  li t5, 0
  j .F.performHashTableTest._19.array.cond.6                            # ir inst 66 fin
.F.performHashTableTest._19.array.cond.6:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 68 fin
  bnez t4, .F.performHashTableTest._20.array.body.6
  j .F.performHashTableTest._21.array.exit.6                            # ir inst 69 fin
.F.performHashTableTest._20.array.body.6:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 70 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 71 fin
  addi t4, t5, 1                                                        # ir inst 72 fin
# Phi connections
  mv t5, t4
  j .F.performHashTableTest._19.array.cond.6                            # ir inst 73 fin
.F.performHashTableTest._21.array.exit.6:
# Phi connections
  li s11, 100
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.performHashTableTest._22.while.cond.0                            # ir inst 74 fin
.F.performHashTableTest._22.while.cond.0:
  slt s10, t5, a0                                                       # ir inst 80 fin
  bnez s10, .F.performHashTableTest._23.lazy.then.0
  j .F.performHashTableTest._24.lazy.else.0                             # ir inst 81 fin
.F.performHashTableTest._23.lazy.then.0:
  li t2, 400
  slt s10, t5, t2                                                       # ir inst 82 fin
# Phi connections
  j .F.performHashTableTest._25.lazy.exit.0                             # ir inst 83 fin
.F.performHashTableTest._24.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.performHashTableTest._25.lazy.exit.0                             # ir inst 84 fin
.F.performHashTableTest._25.lazy.exit.0:
  bnez s10, .F.performHashTableTest._26.while.body.0
  j .F.performHashTableTest._54.while.exit.0                            # ir inst 86 fin
.F.performHashTableTest._26.while.body.0:
  li t2, 17
  mul s10, t5, t2                                                       # ir inst 87 fin
  addi s9, s10, 23                                                      # ir inst 88 fin
  li t2, 2000
  rem s10, s9, t2                                                       # ir inst 89 fin
  addi s9, s10, 1                                                       # ir inst 90 fin
  li t2, 11
  mul s10, t5, t2                                                       # ir inst 91 fin
  addi s8, s10, 7                                                       # ir inst 92 fin
  li t2, 1000
  rem s10, s8, t2                                                       # ir inst 93 fin
  addi s8, s10, 1                                                       # ir inst 94 fin
  li t2, 100
  mul s10, t4, t2                                                       # ir inst 95 fin
  div s7, s10, s11                                                      # ir inst 96 fin
  li t2, 70
  slt s10, t2, s7                                                       # ir inst 97 fin
  bnez s10, .F.performHashTableTest._27.lazy.then.1
  j .F.performHashTableTest._28.lazy.else.1                             # ir inst 98 fin
.F.performHashTableTest._27.lazy.then.1:
  li t2, 250
  slt s10, s11, t2                                                      # ir inst 99 fin
# Phi connections
  j .F.performHashTableTest._29.lazy.exit.1                             # ir inst 100 fin
.F.performHashTableTest._28.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.performHashTableTest._29.lazy.exit.1                             # ir inst 101 fin
.F.performHashTableTest._29.lazy.exit.1:
  bnez s10, .F.performHashTableTest._30.if.then.0
  j .F.performHashTableTest._49.if.else.0                               # ir inst 103 fin
.F.performHashTableTest._30.if.then.0:
  slli s10, s11, 1                                                      # ir inst 104 fin
  addi s7, t3, 1                                                        # ir inst 105 fin
  li t1, 11004
  add t1, sp, t1
  addi s6, t1, 0                                                        # ir inst 107 fin
# Phi connections
  li s5, 0
  j .F.performHashTableTest._31.array.cond.7                            # ir inst 108 fin
.F.performHashTableTest._31.array.cond.7:
  li t2, 500
  slt s0, s5, t2                                                        # ir inst 110 fin
  bnez s0, .F.performHashTableTest._32.array.body.7
  j .F.performHashTableTest._33.array.exit.7                            # ir inst 111 fin
.F.performHashTableTest._32.array.body.7:
  slli t2, s5, 2
  add s0, s6, t2                                                        # ir inst 112 fin
  li t1, -1
  sw t1, 0(s0)                                                          # ir inst 113 fin
  addi s0, s5, 1                                                        # ir inst 114 fin
# Phi connections
  mv s5, s0
  j .F.performHashTableTest._31.array.cond.7                            # ir inst 115 fin
.F.performHashTableTest._33.array.exit.7:
  li t1, 13004
  add t1, sp, t1
  addi s6, t1, 0                                                        # ir inst 117 fin
# Phi connections
  li s5, 0
  j .F.performHashTableTest._34.array.cond.8                            # ir inst 118 fin
.F.performHashTableTest._34.array.cond.8:
  li t2, 500
  slt s0, s5, t2                                                        # ir inst 120 fin
  bnez s0, .F.performHashTableTest._35.array.body.8
  j .F.performHashTableTest._36.array.exit.8                            # ir inst 121 fin
.F.performHashTableTest._35.array.body.8:
  slli t2, s5, 2
  add s0, s6, t2                                                        # ir inst 122 fin
  li t1, 0
  sw t1, 0(s0)                                                          # ir inst 123 fin
  addi s0, s5, 1                                                        # ir inst 124 fin
# Phi connections
  mv s5, s0
  j .F.performHashTableTest._34.array.cond.8                            # ir inst 125 fin
.F.performHashTableTest._36.array.exit.8:
# Phi connections
  li s6, 0
  j .F.performHashTableTest._37.while.cond.1                            # ir inst 126 fin
.F.performHashTableTest._37.while.cond.1:
  slt s5, s6, s11                                                       # ir inst 128 fin
  bnez s5, .F.performHashTableTest._38.while.body.1
  j .F.performHashTableTest._39.while.exit.1                            # ir inst 129 fin
.F.performHashTableTest._38.while.body.1:
  mv s5, s6                                                             # ir inst 130 fin
  slli t2, s5, 2
  li t1, 11004
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 131 fin
  mv s5, s6                                                             # ir inst 132 fin
  slli t2, s5, 2
  addi t1, sp, 136
  add s1, t1, t2                                                        # ir inst 133 fin
  lw s5, 0(s1)                                                          # ir inst 134 fin
  sw s5, 0(s0)                                                          # ir inst 135 fin
  mv s5, s6                                                             # ir inst 136 fin
  slli t2, s5, 2
  li t1, 13004
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 137 fin
  mv s5, s6                                                             # ir inst 138 fin
  slli t2, s5, 2
  li t1, 2136
  add t1, sp, t1
  add s1, t1, t2                                                        # ir inst 139 fin
  lw s5, 0(s1)                                                          # ir inst 140 fin
  sw s5, 0(s0)                                                          # ir inst 141 fin
  mv s5, s6                                                             # ir inst 142 fin
  slli t2, s5, 2
  addi t1, sp, 136
  add s0, t1, t2                                                        # ir inst 143 fin
  li t1, -1
  sw t1, 0(s0)                                                          # ir inst 144 fin
  mv s5, s6                                                             # ir inst 145 fin
  slli t2, s5, 2
  li t1, 2136
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 146 fin
  li t1, 0
  sw t1, 0(s0)                                                          # ir inst 147 fin
  addi s5, s6, 1                                                        # ir inst 148 fin
# Phi connections
  mv s6, s5
  j .F.performHashTableTest._37.while.cond.1                            # ir inst 149 fin
.F.performHashTableTest._39.while.exit.1:
# Phi connections
  j .F.performHashTableTest._40.while.cond.2                            # ir inst 150 fin
.F.performHashTableTest._40.while.cond.2:
  slt s5, s6, s10                                                       # ir inst 152 fin
  bnez s5, .F.performHashTableTest._41.while.body.2
  j .F.performHashTableTest._42.while.exit.2                            # ir inst 153 fin
.F.performHashTableTest._41.while.body.2:
  mv s5, s6                                                             # ir inst 154 fin
  slli t2, s5, 2
  addi t1, sp, 136
  add s0, t1, t2                                                        # ir inst 155 fin
  li t1, -1
  sw t1, 0(s0)                                                          # ir inst 156 fin
  mv s5, s6                                                             # ir inst 157 fin
  slli t2, s5, 2
  li t1, 2136
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 158 fin
  li t1, 0
  sw t1, 0(s0)                                                          # ir inst 159 fin
  addi s5, s6, 1                                                        # ir inst 160 fin
# Phi connections
  mv s6, s5
  j .F.performHashTableTest._40.while.cond.2                            # ir inst 161 fin
.F.performHashTableTest._42.while.exit.2:
# Phi connections
  li s6, 0
  j .F.performHashTableTest._43.while.cond.3                            # ir inst 162 fin
.F.performHashTableTest._43.while.cond.3:
  slt s5, s6, s11                                                       # ir inst 164 fin
  bnez s5, .F.performHashTableTest._44.while.body.3
  j .F.performHashTableTest._48.while.exit.3                            # ir inst 165 fin
.F.performHashTableTest._44.while.body.3:
  mv s5, s6                                                             # ir inst 166 fin
  slli t2, s5, 2
  li t1, 11004
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 167 fin
  lw s5, 0(s0)                                                          # ir inst 168 fin
  li t2, -1
  xor t0, s5, t2
  sltu s0, zero, t0                                                     # ir inst 169 fin
  bnez s0, .F.performHashTableTest._45.if.then.1
  j .F.performHashTableTest._46.if.else.1                               # ir inst 170 fin
.F.performHashTableTest._45.if.then.1:
  mv s5, s6                                                             # ir inst 171 fin
  slli t2, s5, 2
  li t1, 11004
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 172 fin
  lw s5, 0(s0)                                                          # ir inst 173 fin
  mv s0, s6                                                             # ir inst 174 fin
  slli t2, s0, 2
  li t1, 13004
  add t1, sp, t1
  add s1, t1, t2                                                        # ir inst 175 fin
  lw s0, 0(s1)                                                          # ir inst 176 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a6, 0
  li t1, 4136
  add t1, sp, t1
  mv a5, t1
  mv a4, s0
  mv a3, s5
  mv a2, s10
  li t1, 2136
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 136
  mv a0, t1
  call .F.insertLinearProbing
  mv s1, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 177 fin
  j .F.performHashTableTest._47.if.exit.1                               # ir inst 178 fin
.F.performHashTableTest._46.if.else.1:
  j .F.performHashTableTest._47.if.exit.1                               # ir inst 179 fin
.F.performHashTableTest._47.if.exit.1:
  addi s5, s6, 1                                                        # ir inst 180 fin
# Phi connections
  mv s6, s5
  j .F.performHashTableTest._43.while.cond.3                            # ir inst 181 fin
.F.performHashTableTest._48.while.exit.3:
# Phi connections
  mv s6, s10
  li s10, 0
  j .F.performHashTableTest._50.if.exit.0                               # ir inst 182 fin
.F.performHashTableTest._49.if.else.0:
# Phi connections
  mv s6, s11
  mv s7, t3
  mv s10, t4
  j .F.performHashTableTest._50.if.exit.0                               # ir inst 183 fin
.F.performHashTableTest._50.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a6, s10
  li t1, 4136
  add t1, sp, t1
  mv a5, t1
  mv a4, s8
  mv a3, s9
  mv a2, s6
  li t1, 2136
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 136
  mv a0, t1
  call .F.insertLinearProbing
  mv s5, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 187 fin
  bnez s5, .F.performHashTableTest._51.if.then.2
  j .F.performHashTableTest._52.if.else.2                               # ir inst 188 fin
.F.performHashTableTest._51.if.then.2:
  addi s9, t6, 1                                                        # ir inst 189 fin
  addi s8, s10, 1                                                       # ir inst 190 fin
# Phi connections
  mv s10, s9
  mv s9, s8
  j .F.performHashTableTest._53.if.exit.2                               # ir inst 191 fin
.F.performHashTableTest._52.if.else.2:
# Phi connections
  mv s9, s10
  mv s10, t6
  j .F.performHashTableTest._53.if.exit.2                               # ir inst 192 fin
.F.performHashTableTest._53.if.exit.2:
  addi s8, t5, 1                                                        # ir inst 195 fin
# Phi connections
  mv s11, s6
  mv t3, s7
  mv t4, s9
  mv t5, s8
  mv t6, s10
  j .F.performHashTableTest._22.while.cond.0                            # ir inst 196 fin
.F.performHashTableTest._54.while.exit.0:
# Phi connections
  li s10, 0
  li t5, 0
  j .F.performHashTableTest._55.while.cond.4                            # ir inst 197 fin
.F.performHashTableTest._55.while.cond.4:
  slt s9, s10, a0                                                       # ir inst 200 fin
  bnez s9, .F.performHashTableTest._56.lazy.then.2
  j .F.performHashTableTest._57.lazy.else.2                             # ir inst 201 fin
.F.performHashTableTest._56.lazy.then.2:
  li t2, 300
  slt s9, s10, t2                                                       # ir inst 202 fin
# Phi connections
  j .F.performHashTableTest._58.lazy.exit.2                             # ir inst 203 fin
.F.performHashTableTest._57.lazy.else.2:
# Phi connections
  li s9, 0
  j .F.performHashTableTest._58.lazy.exit.2                             # ir inst 204 fin
.F.performHashTableTest._58.lazy.exit.2:
  bnez s9, .F.performHashTableTest._59.while.body.4
  j .F.performHashTableTest._75.while.exit.4                            # ir inst 206 fin
.F.performHashTableTest._59.while.body.4:
  li t2, 13
  mul s9, s10, t2                                                       # ir inst 207 fin
  addi s8, s9, 31                                                       # ir inst 208 fin
  li t2, 1500
  rem s9, s8, t2                                                        # ir inst 209 fin
  addi s8, s9, 1                                                        # ir inst 210 fin
  li t2, 19
  mul s9, s10, t2                                                       # ir inst 211 fin
  addi s7, s9, 5                                                        # ir inst 212 fin
  li t2, 800
  rem s9, s7, t2                                                        # ir inst 213 fin
  addi s7, s9, 1                                                        # ir inst 214 fin
  li t2, 100
  rem s9, s8, t2                                                        # ir inst 215 fin
# Phi connections
  li s6, 0
  j .F.performHashTableTest._60.while.cond.5                            # ir inst 216 fin
.F.performHashTableTest._60.while.cond.5:
  mv s5, s9                                                             # ir inst 218 fin
  slli t2, s5, 2
  li t1, 10604
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 219 fin
  lw s5, 0(s0)                                                          # ir inst 220 fin
  slt s0, s6, s5                                                        # ir inst 221 fin
  bnez s0, .F.performHashTableTest._61.lazy.then.3
  j .F.performHashTableTest._62.lazy.else.3                             # ir inst 222 fin
.F.performHashTableTest._61.lazy.then.3:
  li t2, 8
  slt s5, s6, t2                                                        # ir inst 223 fin
# Phi connections
  j .F.performHashTableTest._63.lazy.exit.3                             # ir inst 224 fin
.F.performHashTableTest._62.lazy.else.3:
# Phi connections
  li s5, 0
  j .F.performHashTableTest._63.lazy.exit.3                             # ir inst 225 fin
.F.performHashTableTest._63.lazy.exit.3:
  bnez s5, .F.performHashTableTest._64.while.body.5
  j .F.performHashTableTest._85.critical_edge.0                         # ir inst 227 fin
.F.performHashTableTest._64.while.body.5:
  mv s5, s9                                                             # ir inst 228 fin
  slli t2, s5, 5
  li t1, 4140
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 229 fin
  mv s5, s6                                                             # ir inst 230 fin
  slli t2, s5, 2
  add s1, s0, t2                                                        # ir inst 231 fin
  lw s5, 0(s1)                                                          # ir inst 232 fin
  xor t0, s5, s8
  sltiu s0, t0, 1                                                       # ir inst 233 fin
  bnez s0, .F.performHashTableTest._65.if.then.3
  j .F.performHashTableTest._66.if.else.3                               # ir inst 234 fin
.F.performHashTableTest._65.if.then.3:
  mv s5, s9                                                             # ir inst 235 fin
  slli t2, s5, 5
  li t1, 7372
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 236 fin
  mv s5, s6                                                             # ir inst 237 fin
  slli t2, s5, 2
  add s1, s0, t2                                                        # ir inst 238 fin
  sw s7, 0(s1)                                                          # ir inst 239 fin
# Phi connections
  li s6, 1
  j .F.performHashTableTest._68.while.exit.5                            # ir inst 240 fin
.F.performHashTableTest._66.if.else.3:
  j .F.performHashTableTest._67.if.exit.3                               # ir inst 241 fin
.F.performHashTableTest._67.if.exit.3:
  addi s5, s6, 1                                                        # ir inst 242 fin
# Phi connections
  mv s6, s5
  j .F.performHashTableTest._60.while.cond.5                            # ir inst 243 fin
.F.performHashTableTest._68.while.exit.5:
  li t2, 0
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 245 fin
  bnez s5, .F.performHashTableTest._69.lazy.then.4
  j .F.performHashTableTest._70.lazy.else.4                             # ir inst 246 fin
.F.performHashTableTest._69.lazy.then.4:
  mv s6, s9                                                             # ir inst 247 fin
  slli t2, s6, 2
  li t1, 10604
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 248 fin
  lw s6, 0(s5)                                                          # ir inst 249 fin
  li t2, 8
  slt s5, s6, t2                                                        # ir inst 250 fin
# Phi connections
  mv s6, s5
  j .F.performHashTableTest._71.lazy.exit.4                             # ir inst 251 fin
.F.performHashTableTest._70.lazy.else.4:
# Phi connections
  li s6, 0
  j .F.performHashTableTest._71.lazy.exit.4                             # ir inst 252 fin
.F.performHashTableTest._71.lazy.exit.4:
  bnez s6, .F.performHashTableTest._72.if.then.4
  j .F.performHashTableTest._73.if.else.4                               # ir inst 254 fin
.F.performHashTableTest._72.if.then.4:
  mv s6, s9                                                             # ir inst 255 fin
  slli t2, s6, 5
  li t1, 4140
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 256 fin
  mv s6, s9                                                             # ir inst 257 fin
  slli t2, s6, 2
  li t1, 10604
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 258 fin
  lw s6, 0(s0)                                                          # ir inst 259 fin
  mv s0, s6                                                             # ir inst 260 fin
  slli t2, s0, 2
  add s6, s5, t2                                                        # ir inst 261 fin
  sw s8, 0(s6)                                                          # ir inst 262 fin
  mv s6, s9                                                             # ir inst 263 fin
  slli t2, s6, 5
  li t1, 7372
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 264 fin
  mv s6, s9                                                             # ir inst 265 fin
  slli t2, s6, 2
  li t1, 10604
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 266 fin
  lw s6, 0(s0)                                                          # ir inst 267 fin
  mv s0, s6                                                             # ir inst 268 fin
  slli t2, s0, 2
  add s6, s5, t2                                                        # ir inst 269 fin
  sw s7, 0(s6)                                                          # ir inst 270 fin
  mv s6, s9                                                             # ir inst 271 fin
  slli t2, s6, 2
  li t1, 10604
  add t1, sp, t1
  add s5, t1, t2                                                        # ir inst 272 fin
  mv s6, s9                                                             # ir inst 273 fin
  slli t2, s6, 2
  li t1, 10604
  add t1, sp, t1
  add s0, t1, t2                                                        # ir inst 274 fin
  lw s6, 0(s0)                                                          # ir inst 275 fin
  addi s0, s6, 1                                                        # ir inst 276 fin
  sw s0, 0(s5)                                                          # ir inst 277 fin
  addi s6, t5, 1                                                        # ir inst 278 fin
# Phi connections
  j .F.performHashTableTest._74.if.exit.4                               # ir inst 279 fin
.F.performHashTableTest._73.if.else.4:
# Phi connections
  mv s6, t5
  j .F.performHashTableTest._74.if.exit.4                               # ir inst 280 fin
.F.performHashTableTest._74.if.exit.4:
  addi s5, s10, 1                                                       # ir inst 282 fin
# Phi connections
  mv s10, s5
  mv t5, s6
  j .F.performHashTableTest._55.while.cond.4                            # ir inst 283 fin
.F.performHashTableTest._75.while.exit.4:
# Phi connections
  li s0, 0
  li s5, 0
  li s6, 0
  j .F.performHashTableTest._76.while.cond.6                            # ir inst 284 fin
.F.performHashTableTest._76.while.cond.6:
  li t2, 100
  slt s1, s6, t2                                                        # ir inst 288 fin
  bnez s1, .F.performHashTableTest._77.while.body.6
  j .F.performHashTableTest._84.while.exit.6                            # ir inst 289 fin
.F.performHashTableTest._77.while.body.6:
  li t2, 23
  mul s1, s6, t2                                                        # ir inst 290 fin
  addi a1, s1, 17                                                       # ir inst 291 fin
  li t2, 1000
  rem s1, a1, t2                                                        # ir inst 292 fin
  addi a1, s1, 1                                                        # ir inst 293 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, a1
  mv a1, s11
  addi t1, sp, 136
  mv a0, t1
  call .F.lookupLinearProbing
  mv s1, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 294 fin
  li t2, 0
  slt t0, s1, t2
  xori a2, t0, 1                                                        # ir inst 295 fin
  bnez a2, .F.performHashTableTest._78.if.then.5
  j .F.performHashTableTest._79.if.else.5                               # ir inst 296 fin
.F.performHashTableTest._78.if.then.5:
  addi s1, s0, 1                                                        # ir inst 297 fin
# Phi connections
  j .F.performHashTableTest._80.if.exit.5                               # ir inst 298 fin
.F.performHashTableTest._79.if.else.5:
# Phi connections
  mv s1, s0
  j .F.performHashTableTest._80.if.exit.5                               # ir inst 299 fin
.F.performHashTableTest._80.if.exit.5:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, a1
  li a2, 100
  li t1, 10604
  add t1, sp, t1
  mv a1, t1
  li t1, 4140
  add t1, sp, t1
  mv a0, t1
  call .F.lookupChaining
  mv a2, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 301 fin
  li t2, 0
  slt t0, a2, t2
  xori a1, t0, 1                                                        # ir inst 302 fin
  bnez a1, .F.performHashTableTest._81.if.then.6
  j .F.performHashTableTest._82.if.else.6                               # ir inst 303 fin
.F.performHashTableTest._81.if.then.6:
  addi a1, s5, 1                                                        # ir inst 304 fin
# Phi connections
  j .F.performHashTableTest._83.if.exit.6                               # ir inst 305 fin
.F.performHashTableTest._82.if.else.6:
# Phi connections
  mv a1, s5
  j .F.performHashTableTest._83.if.exit.6                               # ir inst 306 fin
.F.performHashTableTest._83.if.exit.6:
  addi a2, s6, 1                                                        # ir inst 308 fin
# Phi connections
  mv s0, s1
  mv s5, a1
  mv s6, a2
  j .F.performHashTableTest._76.while.cond.6                            # ir inst 309 fin
.F.performHashTableTest._84.while.exit.6:
  li t2, 100
  mul s6, t4, t2                                                        # ir inst 310 fin
  div s1, s6, s11                                                       # ir inst 311 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a1, 100
  li t1, 10604
  add t1, sp, t1
  mv a0, t1
  call .F.calculateAverageChainLength
  mv s6, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 312 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 313 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 314 fin
  li t1, 4136
  add t1, sp, t1
  lw a1, 0(t1)                                                          # ir inst 315 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, a1
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 316 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s0
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 317 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s5
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 318 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s1
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 319 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s6
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 320 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, t3
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 321 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a0, 26012
  call printlnInt
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 322 fin
  j .F.performHashTableTest.epilogue                                    # ir inst 323 fin
.F.performHashTableTest._85.critical_edge.0:
# Phi connections
  li s6, 0
  j .F.performHashTableTest._68.while.exit.5                            # ir inst 324 fin
.F.performHashTableTest.epilogue:
  ld ra, 128(sp)
  ld s11, 56(sp)
  ld s8, 64(sp)
  ld s10, 72(sp)
  ld s7, 80(sp)
  ld s9, 88(sp)
  ld s5, 96(sp)
  ld s0, 104(sp)
  ld s1, 112(sp)
  ld s6, 120(sp)
  li t0, 15008
  add sp, sp, t0
  ret

.globl .F.insertLinearProbing
.F.insertLinearProbing:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.insertLinearProbing._0.entry.0:
  rem t6, a3, a2                                                        # ir inst 1 fin
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.insertLinearProbing._1.while.cond.0                              # ir inst 2 fin
.F.insertLinearProbing._1.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 5 fin
  bnez t4, .F.insertLinearProbing._2.while.body.0
  j .F.insertLinearProbing._9.while.exit.0                              # ir inst 6 fin
.F.insertLinearProbing._2.while.body.0:
  mv t4, t5                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 10 fin
  bnez t3, .F.insertLinearProbing._3.if.then.0
  j .F.insertLinearProbing._4.if.else.0                                 # ir inst 11 fin
.F.insertLinearProbing._3.if.then.0:
  mv t4, t5                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  sw a3, 0(t3)                                                          # ir inst 14 fin
  mv t4, t5                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 16 fin
  sw a4, 0(t3)                                                          # ir inst 17 fin
  li a0, 1
  j .F.insertLinearProbing.epilogue                                     # ir inst 18 fin
.F.insertLinearProbing._4.if.else.0:
  mv t4, t5                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 20 fin
  lw t4, 0(t3)                                                          # ir inst 21 fin
  xor t0, t4, a3
  sltiu t3, t0, 1                                                       # ir inst 22 fin
  bnez t3, .F.insertLinearProbing._5.if.then.1
  j .F.insertLinearProbing._6.if.else.1                                 # ir inst 23 fin
.F.insertLinearProbing._5.if.then.1:
  mv t4, t5                                                             # ir inst 24 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 25 fin
  sw a4, 0(t3)                                                          # ir inst 26 fin
  li a0, 1
  j .F.insertLinearProbing.epilogue                                     # ir inst 27 fin
.F.insertLinearProbing._6.if.else.1:
  lw t4, 0(a5)                                                          # ir inst 28 fin
  addi t3, t4, 1                                                        # ir inst 29 fin
  sw t3, 0(a5)                                                          # ir inst 30 fin
  addi t4, t5, 1                                                        # ir inst 31 fin
  rem t5, t4, a2                                                        # ir inst 32 fin
  addi t4, t6, 1                                                        # ir inst 33 fin
  j .F.insertLinearProbing._7.if.exit.1                                 # ir inst 34 fin
.F.insertLinearProbing._7.if.exit.1:
  j .F.insertLinearProbing._8.if.exit.0                                 # ir inst 35 fin
.F.insertLinearProbing._8.if.exit.0:
# Phi connections
  mv t6, t4
  j .F.insertLinearProbing._1.while.cond.0                              # ir inst 36 fin
.F.insertLinearProbing._9.while.exit.0:
  li a0, 0
  j .F.insertLinearProbing.epilogue                                     # ir inst 37 fin
.F.insertLinearProbing.epilogue:
  ret

.globl .F.lookupLinearProbing
.F.lookupLinearProbing:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.lookupLinearProbing._0.entry.0:
  rem t6, a2, a1                                                        # ir inst 1 fin
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.lookupLinearProbing._1.while.cond.0                              # ir inst 2 fin
.F.lookupLinearProbing._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 5 fin
  bnez t4, .F.lookupLinearProbing._2.while.body.0
  j .F.lookupLinearProbing._9.while.exit.0                              # ir inst 6 fin
.F.lookupLinearProbing._2.while.body.0:
  mv t4, t5                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  xor t0, t4, a2
  sltiu t3, t0, 1                                                       # ir inst 10 fin
  bnez t3, .F.lookupLinearProbing._3.if.then.0
  j .F.lookupLinearProbing._4.if.else.0                                 # ir inst 11 fin
.F.lookupLinearProbing._3.if.then.0:
  mv a0, t5
  j .F.lookupLinearProbing.epilogue                                     # ir inst 12 fin
.F.lookupLinearProbing._4.if.else.0:
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.lookupLinearProbing._5.if.then.1
  j .F.lookupLinearProbing._6.if.else.1                                 # ir inst 17 fin
.F.lookupLinearProbing._5.if.then.1:
  li a0, -1
  j .F.lookupLinearProbing.epilogue                                     # ir inst 18 fin
.F.lookupLinearProbing._6.if.else.1:
  addi t4, t5, 1                                                        # ir inst 19 fin
  rem t5, t4, a1                                                        # ir inst 20 fin
  addi t4, t6, 1                                                        # ir inst 21 fin
  j .F.lookupLinearProbing._7.if.exit.1                                 # ir inst 22 fin
.F.lookupLinearProbing._7.if.exit.1:
  j .F.lookupLinearProbing._8.if.exit.0                                 # ir inst 23 fin
.F.lookupLinearProbing._8.if.exit.0:
# Phi connections
  mv t6, t4
  j .F.lookupLinearProbing._1.while.cond.0                              # ir inst 24 fin
.F.lookupLinearProbing._9.while.exit.0:
  li a0, -1
  j .F.lookupLinearProbing.epilogue                                     # ir inst 25 fin
.F.lookupLinearProbing.epilogue:
  ret

.globl .F.lookupChaining
.F.lookupChaining:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.lookupChaining._0.entry.0:
  rem t6, a3, a2                                                        # ir inst 1 fin
# Phi connections
  li t5, 0
  j .F.lookupChaining._1.while.cond.0                                   # ir inst 2 fin
.F.lookupChaining._1.while.cond.0:
  mv t4, t6                                                             # ir inst 4 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 5 fin
  lw t4, 0(t3)                                                          # ir inst 6 fin
  slt t3, t5, t4                                                        # ir inst 7 fin
  bnez t3, .F.lookupChaining._2.lazy.then.0
  j .F.lookupChaining._3.lazy.else.0                                    # ir inst 8 fin
.F.lookupChaining._2.lazy.then.0:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 9 fin
# Phi connections
  j .F.lookupChaining._4.lazy.exit.0                                    # ir inst 10 fin
.F.lookupChaining._3.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.lookupChaining._4.lazy.exit.0                                    # ir inst 11 fin
.F.lookupChaining._4.lazy.exit.0:
  bnez t4, .F.lookupChaining._5.while.body.0
  j .F.lookupChaining._9.while.exit.0                                   # ir inst 13 fin
.F.lookupChaining._5.while.body.0:
  mv t4, t6                                                             # ir inst 14 fin
  slli t2, t4, 5
  add t3, a0, t2                                                        # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 17 fin
  lw t4, 0(s11)                                                         # ir inst 18 fin
  xor t0, t4, a3
  sltiu t3, t0, 1                                                       # ir inst 19 fin
  bnez t3, .F.lookupChaining._6.if.then.0
  j .F.lookupChaining._7.if.else.0                                      # ir inst 20 fin
.F.lookupChaining._6.if.then.0:
  mv a0, t5
  j .F.lookupChaining.epilogue                                          # ir inst 21 fin
.F.lookupChaining._7.if.else.0:
  j .F.lookupChaining._8.if.exit.0                                      # ir inst 22 fin
.F.lookupChaining._8.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.lookupChaining._1.while.cond.0                                   # ir inst 24 fin
.F.lookupChaining._9.while.exit.0:
  li a0, -1
  j .F.lookupChaining.epilogue                                          # ir inst 25 fin
.F.lookupChaining.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.calculateAverageChainLength
.F.calculateAverageChainLength:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.calculateAverageChainLength._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.calculateAverageChainLength._1.while.cond.0                      # ir inst 1 fin
.F.calculateAverageChainLength._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.calculateAverageChainLength._2.while.body.0
  j .F.calculateAverageChainLength._6.while.exit.0                      # ir inst 6 fin
.F.calculateAverageChainLength._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 0
  slt s11, t2, t3                                                       # ir inst 10 fin
  bnez s11, .F.calculateAverageChainLength._3.if.then.0
  j .F.calculateAverageChainLength._4.if.else.0                         # ir inst 11 fin
.F.calculateAverageChainLength._3.if.then.0:
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  add s11, t4, t3                                                       # ir inst 15 fin
  addi t3, t5, 1                                                        # ir inst 16 fin
# Phi connections
  j .F.calculateAverageChainLength._5.if.exit.0                         # ir inst 17 fin
.F.calculateAverageChainLength._4.if.else.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.calculateAverageChainLength._5.if.exit.0                         # ir inst 18 fin
.F.calculateAverageChainLength._5.if.exit.0:
  addi s10, t6, 1                                                       # ir inst 21 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.calculateAverageChainLength._1.while.cond.0                      # ir inst 22 fin
.F.calculateAverageChainLength._6.while.exit.0:
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 23 fin
  bnez t6, .F.calculateAverageChainLength._7.if.then.1
  j .F.calculateAverageChainLength._8.if.else.1                         # ir inst 24 fin
.F.calculateAverageChainLength._7.if.then.1:
  div t6, t4, t5                                                        # ir inst 25 fin
# Phi connections
  j .F.calculateAverageChainLength._9.if.exit.1                         # ir inst 26 fin
.F.calculateAverageChainLength._8.if.else.1:
# Phi connections
  li t6, 0
  j .F.calculateAverageChainLength._9.if.exit.1                         # ir inst 27 fin
.F.calculateAverageChainLength._9.if.exit.1:
  mv a0, t6
  j .F.calculateAverageChainLength.epilogue                             # ir inst 29 fin
.F.calculateAverageChainLength.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret
