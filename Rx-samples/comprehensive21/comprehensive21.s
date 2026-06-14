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

.globl .F.init_dataset_pattern
.F.init_dataset_pattern:
# spill func args num: 0,             range:    40048(sp) -    40048(sp)
# local var size: 40024,              range:       24(sp) -    40048(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 1 / 12,        range:        8(sp) -       16(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -40048
  add sp, sp, t0
  sd s11, 8(sp)
  sd ra, 16(sp)
.F.init_dataset_pattern._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
  addi t5, t6, 0                                                        # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.init_dataset_pattern._1.array.cond.0                             # ir inst 4 fin
.F.init_dataset_pattern._1.array.cond.0:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F.init_dataset_pattern._2.array.body.0
  j .F.init_dataset_pattern._3.array.exit.0                             # ir inst 7 fin
.F.init_dataset_pattern._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F.init_dataset_pattern._1.array.cond.0                             # ir inst 11 fin
.F.init_dataset_pattern._3.array.exit.0:
  addi t1, sp, 24
  li t6, 40000
  add t6, t1, t6                                                        # ir inst 12 fin
  sw a2, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 24
  li t6, 40004
  add t6, t1, t6                                                        # ir inst 14 fin
  li t1, 0
  sb t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 24
  li t6, 40008
  add t6, t1, t6                                                        # ir inst 16 fin
  li t1, 999999
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 24
  li t6, 40012
  add t6, t1, t6                                                        # ir inst 18 fin
  li t1, -999999
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 24
  li t6, 40016
  add t6, t1, t6                                                        # ir inst 20 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 24
  li t6, 40020
  add t6, t1, t6                                                        # ir inst 22 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 23 fin
# Phi connections
  li t6, 0
  j .F.init_dataset_pattern._4.while.cond.0                             # ir inst 24 fin
.F.init_dataset_pattern._4.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 26 fin
  bnez t5, .F.init_dataset_pattern._5.while.body.0
  j .F.init_dataset_pattern._45.while.exit.0                            # ir inst 27 fin
.F.init_dataset_pattern._5.while.body.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 28 fin
  bnez t5, .F.init_dataset_pattern._6.if.then.0
  j .F.init_dataset_pattern._7.if.else.0                                # ir inst 29 fin
.F.init_dataset_pattern._6.if.then.0:
  li t2, 11047
  mul t5, t6, t2                                                        # ir inst 30 fin
  li t2, 12345
  add t4, t5, t2                                                        # ir inst 31 fin
  li t2, 100000
  rem t5, t4, t2                                                        # ir inst 32 fin
# Phi connections
  j .F.init_dataset_pattern._38.if.exit.0                               # ir inst 33 fin
.F.init_dataset_pattern._7.if.else.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 34 fin
  bnez t5, .F.init_dataset_pattern._8.if.then.1
  j .F.init_dataset_pattern._9.if.else.1                                # ir inst 35 fin
.F.init_dataset_pattern._8.if.then.1:
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 36 fin
  addi t4, t5, 7                                                        # ir inst 37 fin
# Phi connections
  mv t5, t4
  j .F.init_dataset_pattern._37.if.exit.1                               # ir inst 38 fin
.F.init_dataset_pattern._9.if.else.1:
  li t2, 2
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 39 fin
  bnez t5, .F.init_dataset_pattern._10.if.then.2
  j .F.init_dataset_pattern._11.if.else.2                               # ir inst 40 fin
.F.init_dataset_pattern._10.if.then.2:
  sub t5, a2, t6                                                        # ir inst 41 fin
  li t2, 5
  mul t4, t5, t2                                                        # ir inst 42 fin
  addi t5, t4, 13                                                       # ir inst 43 fin
# Phi connections
  j .F.init_dataset_pattern._36.if.exit.2                               # ir inst 44 fin
.F.init_dataset_pattern._11.if.else.2:
  li t2, 3
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 45 fin
  bnez t5, .F.init_dataset_pattern._12.if.then.3
  j .F.init_dataset_pattern._16.if.else.3                               # ir inst 46 fin
.F.init_dataset_pattern._12.if.then.3:
  li t2, 2
  div t5, a2, t2                                                        # ir inst 47 fin
  slt t4, t6, t5                                                        # ir inst 48 fin
  bnez t4, .F.init_dataset_pattern._13.if.then.4
  j .F.init_dataset_pattern._14.if.else.4                               # ir inst 49 fin
.F.init_dataset_pattern._13.if.then.4:
  slli t5, t6, 2                                                        # ir inst 50 fin
# Phi connections
  j .F.init_dataset_pattern._15.if.exit.4                               # ir inst 51 fin
.F.init_dataset_pattern._14.if.else.4:
  sub t5, a2, t6                                                        # ir inst 52 fin
  slli t4, t5, 2                                                        # ir inst 53 fin
# Phi connections
  mv t5, t4
  j .F.init_dataset_pattern._15.if.exit.4                               # ir inst 54 fin
.F.init_dataset_pattern._15.if.exit.4:
# Phi connections
  j .F.init_dataset_pattern._35.if.exit.3                               # ir inst 56 fin
.F.init_dataset_pattern._16.if.else.3:
  li t2, 4
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 57 fin
  bnez t5, .F.init_dataset_pattern._17.if.then.5
  j .F.init_dataset_pattern._21.if.else.5                               # ir inst 58 fin
.F.init_dataset_pattern._17.if.then.5:
  li t2, 2
  div t5, a2, t2                                                        # ir inst 59 fin
  slt t4, t6, t5                                                        # ir inst 60 fin
  bnez t4, .F.init_dataset_pattern._18.if.then.6
  j .F.init_dataset_pattern._19.if.else.6                               # ir inst 61 fin
.F.init_dataset_pattern._18.if.then.6:
  li t2, 2
  div t5, a2, t2                                                        # ir inst 62 fin
  sub t4, t5, t6                                                        # ir inst 63 fin
  li t2, 3
  mul t5, t4, t2                                                        # ir inst 64 fin
# Phi connections
  j .F.init_dataset_pattern._20.if.exit.6                               # ir inst 65 fin
.F.init_dataset_pattern._19.if.else.6:
  li t2, 2
  div t5, a2, t2                                                        # ir inst 66 fin
  sub t4, t6, t5                                                        # ir inst 67 fin
  li t2, 3
  mul t5, t4, t2                                                        # ir inst 68 fin
# Phi connections
  j .F.init_dataset_pattern._20.if.exit.6                               # ir inst 69 fin
.F.init_dataset_pattern._20.if.exit.6:
# Phi connections
  j .F.init_dataset_pattern._34.if.exit.5                               # ir inst 71 fin
.F.init_dataset_pattern._21.if.else.5:
  li t2, 5
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 72 fin
  bnez t5, .F.init_dataset_pattern._22.if.then.7
  j .F.init_dataset_pattern._23.if.else.7                               # ir inst 73 fin
.F.init_dataset_pattern._22.if.then.7:
  slli t5, t6, 1                                                        # ir inst 74 fin
  li t2, 10
  rem t4, t6, t2                                                        # ir inst 75 fin
  li t2, 5
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 76 fin
  mv t4, t3                                                             # ir inst 77 fin
  li t2, 100
  mul t3, t4, t2                                                        # ir inst 78 fin
  add t4, t5, t3                                                        # ir inst 79 fin
# Phi connections
  mv t5, t4
  j .F.init_dataset_pattern._33.if.exit.7                               # ir inst 80 fin
.F.init_dataset_pattern._23.if.else.7:
  li t2, 6
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 81 fin
  bnez t5, .F.init_dataset_pattern._24.if.then.8
  j .F.init_dataset_pattern._25.if.else.8                               # ir inst 82 fin
.F.init_dataset_pattern._24.if.then.8:
  li t2, 10
  div t5, t6, t2                                                        # ir inst 83 fin
  li t2, 7
  mul t4, t5, t2                                                        # ir inst 84 fin
  addi t5, t4, 23                                                       # ir inst 85 fin
# Phi connections
  j .F.init_dataset_pattern._32.if.exit.8                               # ir inst 86 fin
.F.init_dataset_pattern._25.if.else.8:
  li t2, 7
  xor t0, a1, t2
  sltiu t5, t0, 1                                                       # ir inst 87 fin
  bnez t5, .F.init_dataset_pattern._26.if.then.9
  j .F.init_dataset_pattern._30.if.else.9                               # ir inst 88 fin
.F.init_dataset_pattern._26.if.then.9:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 89 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 90 fin
  bnez t4, .F.init_dataset_pattern._27.if.then.10
  j .F.init_dataset_pattern._28.if.else.10                              # ir inst 91 fin
.F.init_dataset_pattern._27.if.then.10:
# Phi connections
  mv t5, t6
  j .F.init_dataset_pattern._29.if.exit.10                              # ir inst 92 fin
.F.init_dataset_pattern._28.if.else.10:
  sub t5, a2, t6                                                        # ir inst 93 fin
# Phi connections
  j .F.init_dataset_pattern._29.if.exit.10                              # ir inst 94 fin
.F.init_dataset_pattern._29.if.exit.10:
# Phi connections
  j .F.init_dataset_pattern._31.if.exit.9                               # ir inst 96 fin
.F.init_dataset_pattern._30.if.else.9:
  mul t5, t6, t6                                                        # ir inst 97 fin
  li t2, 7
  mul t4, t6, t2                                                        # ir inst 98 fin
  add t3, t5, t4                                                        # ir inst 99 fin
  addi t5, t3, 17                                                       # ir inst 100 fin
  li t2, 1000
  rem t4, t5, t2                                                        # ir inst 101 fin
# Phi connections
  mv t5, t4
  j .F.init_dataset_pattern._31.if.exit.9                               # ir inst 102 fin
.F.init_dataset_pattern._31.if.exit.9:
# Phi connections
  j .F.init_dataset_pattern._32.if.exit.8                               # ir inst 104 fin
.F.init_dataset_pattern._32.if.exit.8:
# Phi connections
  j .F.init_dataset_pattern._33.if.exit.7                               # ir inst 106 fin
.F.init_dataset_pattern._33.if.exit.7:
# Phi connections
  j .F.init_dataset_pattern._34.if.exit.5                               # ir inst 108 fin
.F.init_dataset_pattern._34.if.exit.5:
# Phi connections
  j .F.init_dataset_pattern._35.if.exit.3                               # ir inst 110 fin
.F.init_dataset_pattern._35.if.exit.3:
# Phi connections
  j .F.init_dataset_pattern._36.if.exit.2                               # ir inst 112 fin
.F.init_dataset_pattern._36.if.exit.2:
# Phi connections
  j .F.init_dataset_pattern._37.if.exit.1                               # ir inst 114 fin
.F.init_dataset_pattern._37.if.exit.1:
# Phi connections
  j .F.init_dataset_pattern._38.if.exit.0                               # ir inst 116 fin
.F.init_dataset_pattern._38.if.exit.0:
  addi t1, sp, 24
  addi t4, t1, 0                                                        # ir inst 118 fin
  mv t3, t6                                                             # ir inst 119 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 120 fin
  sw t5, 0(s11)                                                         # ir inst 121 fin
  addi t1, sp, 24
  li t4, 40016
  add t4, t1, t4                                                        # ir inst 122 fin
  addi t1, sp, 24
  li t3, 40016
  add t3, t1, t3                                                        # ir inst 123 fin
  lw s11, 0(t3)                                                         # ir inst 124 fin
  add t3, s11, t5                                                       # ir inst 125 fin
  sw t3, 0(t4)                                                          # ir inst 126 fin
  addi t1, sp, 24
  li t4, 40008
  add t4, t1, t4                                                        # ir inst 127 fin
  lw t3, 0(t4)                                                          # ir inst 128 fin
  slt t4, t5, t3                                                        # ir inst 129 fin
  bnez t4, .F.init_dataset_pattern._39.if.then.11
  j .F.init_dataset_pattern._40.if.else.11                              # ir inst 130 fin
.F.init_dataset_pattern._39.if.then.11:
  addi t1, sp, 24
  li t4, 40008
  add t4, t1, t4                                                        # ir inst 131 fin
  sw t5, 0(t4)                                                          # ir inst 132 fin
  j .F.init_dataset_pattern._41.if.exit.11                              # ir inst 133 fin
.F.init_dataset_pattern._40.if.else.11:
  j .F.init_dataset_pattern._41.if.exit.11                              # ir inst 134 fin
.F.init_dataset_pattern._41.if.exit.11:
  addi t1, sp, 24
  li t4, 40012
  add t4, t1, t4                                                        # ir inst 135 fin
  lw t3, 0(t4)                                                          # ir inst 136 fin
  slt t4, t3, t5                                                        # ir inst 137 fin
  bnez t4, .F.init_dataset_pattern._42.if.then.12
  j .F.init_dataset_pattern._43.if.else.12                              # ir inst 138 fin
.F.init_dataset_pattern._42.if.then.12:
  addi t1, sp, 24
  li t4, 40012
  add t4, t1, t4                                                        # ir inst 139 fin
  sw t5, 0(t4)                                                          # ir inst 140 fin
  j .F.init_dataset_pattern._44.if.exit.12                              # ir inst 141 fin
.F.init_dataset_pattern._43.if.else.12:
  j .F.init_dataset_pattern._44.if.exit.12                              # ir inst 142 fin
.F.init_dataset_pattern._44.if.exit.12:
  addi t5, t6, 1                                                        # ir inst 143 fin
# Phi connections
  mv t6, t5
  j .F.init_dataset_pattern._4.while.cond.0                             # ir inst 144 fin
.F.init_dataset_pattern._45.while.exit.0:
  addi t1, sp, 24
  li t6, 40020
  add t6, t1, t6                                                        # ir inst 145 fin
  addi t1, sp, 24
  li t5, 40016
  add t5, t1, t5                                                        # ir inst 146 fin
  lw t4, 0(t5)                                                          # ir inst 147 fin
  div t5, t4, a2                                                        # ir inst 148 fin
  sw t5, 0(t6)                                                          # ir inst 149 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 40024
  addi t1, sp, 24
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 150 fin
  j .F.init_dataset_pattern.epilogue                                    # ir inst 151 fin
.F.init_dataset_pattern.epilogue:
  ld ra, 16(sp)
  ld s11, 8(sp)
  li t0, 40048
  add sp, sp, t0
  ret

.globl .F.init_performance_counter
.F.init_performance_counter:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_performance_counter._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 16                                                       # ir inst 9 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 10 fin
  j .F.init_performance_counter.epilogue                                # ir inst 11 fin
.F.init_performance_counter.epilogue:
  ret

.globl .F.bubble_sort
.F.bubble_sort:
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
.F.bubble_sort._0.entry.0:
  addi t6, a2, 16                                                       # ir inst 1 fin
  addi t5, a2, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
# Phi connections
  li t6, 0
  j .F.bubble_sort._1.while.cond.0                                      # ir inst 6 fin
.F.bubble_sort._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 8 fin
  slt t4, t6, t5                                                        # ir inst 9 fin
  bnez t4, .F.bubble_sort._2.while.body.0
  j .F.bubble_sort._13.critical_edge.0                                  # ir inst 10 fin
.F.bubble_sort._2.while.body.0:
# Phi connections
  li t4, 0
  li t5, 0
  j .F.bubble_sort._3.while.cond.1                                      # ir inst 11 fin
.F.bubble_sort._3.while.cond.1:
  sub t3, a1, t6                                                        # ir inst 14 fin
  addi s11, t3, -1                                                      # ir inst 15 fin
  slt t3, t5, s11                                                       # ir inst 16 fin
  bnez t3, .F.bubble_sort._4.while.body.1
  j .F.bubble_sort._8.while.exit.1                                      # ir inst 17 fin
.F.bubble_sort._4.while.body.1:
  addi t3, a2, 4                                                        # ir inst 18 fin
  addi s11, a2, 4                                                       # ir inst 19 fin
  lw s10, 0(s11)                                                        # ir inst 20 fin
  addi s11, s10, 1                                                      # ir inst 21 fin
  sw s11, 0(t3)                                                         # ir inst 22 fin
  addi t3, a2, 12                                                       # ir inst 23 fin
  addi s11, a2, 12                                                      # ir inst 24 fin
  lw s10, 0(s11)                                                        # ir inst 25 fin
  addi s11, s10, 2                                                      # ir inst 26 fin
  sw s11, 0(t3)                                                         # ir inst 27 fin
  mv t3, t5                                                             # ir inst 28 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 29 fin
  lw t3, 0(s11)                                                         # ir inst 30 fin
  mv s11, t5                                                            # ir inst 31 fin
  addi s10, s11, 1                                                      # ir inst 32 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 33 fin
  lw s10, 0(s11)                                                        # ir inst 34 fin
  slt s11, s10, t3                                                      # ir inst 35 fin
  bnez s11, .F.bubble_sort._5.if.then.0
  j .F.bubble_sort._6.if.else.0                                         # ir inst 36 fin
.F.bubble_sort._5.if.then.0:
  mv t3, t5                                                             # ir inst 37 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 38 fin
  lw t3, 0(s11)                                                         # ir inst 39 fin
  mv s11, t5                                                            # ir inst 40 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 41 fin
  mv s11, t5                                                            # ir inst 42 fin
  addi s9, s11, 1                                                       # ir inst 43 fin
  slli t2, s9, 2
  add s11, a0, t2                                                       # ir inst 44 fin
  lw s9, 0(s11)                                                         # ir inst 45 fin
  sw s9, 0(s10)                                                         # ir inst 46 fin
  mv s11, t5                                                            # ir inst 47 fin
  addi s10, s11, 1                                                      # ir inst 48 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 49 fin
  sw t3, 0(s11)                                                         # ir inst 50 fin
  addi t3, a2, 8                                                        # ir inst 51 fin
  addi s11, a2, 8                                                       # ir inst 52 fin
  lw s10, 0(s11)                                                        # ir inst 53 fin
  addi s11, s10, 1                                                      # ir inst 54 fin
  sw s11, 0(t3)                                                         # ir inst 55 fin
  addi t3, a2, 12                                                       # ir inst 56 fin
  addi s11, a2, 12                                                      # ir inst 57 fin
  lw s10, 0(s11)                                                        # ir inst 58 fin
  addi s11, s10, 4                                                      # ir inst 59 fin
  sw s11, 0(t3)                                                         # ir inst 60 fin
# Phi connections
  li t3, 1
  j .F.bubble_sort._7.if.exit.0                                         # ir inst 61 fin
.F.bubble_sort._6.if.else.0:
# Phi connections
  mv t3, t4
  j .F.bubble_sort._7.if.exit.0                                         # ir inst 62 fin
.F.bubble_sort._7.if.exit.0:
  addi s11, t5, 1                                                       # ir inst 64 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.bubble_sort._3.while.cond.1                                      # ir inst 65 fin
.F.bubble_sort._8.while.exit.1:
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 66 fin
  bnez t5, .F.bubble_sort._9.if.then.1
  j .F.bubble_sort._10.if.else.1                                        # ir inst 67 fin
.F.bubble_sort._9.if.then.1:
  j .F.bubble_sort._12.while.exit.0                                     # ir inst 68 fin
.F.bubble_sort._10.if.else.1:
  j .F.bubble_sort._11.if.exit.1                                        # ir inst 69 fin
.F.bubble_sort._11.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 70 fin
# Phi connections
  mv t6, t5
  j .F.bubble_sort._1.while.cond.0                                      # ir inst 71 fin
.F.bubble_sort._12.while.exit.0:
  addi t6, a2, 0                                                        # ir inst 72 fin
  addi t5, a2, 0                                                        # ir inst 73 fin
  lw t4, 0(t5)                                                          # ir inst 74 fin
  mul t5, a1, a1                                                        # ir inst 75 fin
  add t3, t4, t5                                                        # ir inst 76 fin
  sw t3, 0(t6)                                                          # ir inst 77 fin
  j .F.bubble_sort.epilogue                                             # ir inst 78 fin
.F.bubble_sort._13.critical_edge.0:
  j .F.bubble_sort._12.while.exit.0                                     # ir inst 79 fin
.F.bubble_sort.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.selection_sort
.F.selection_sort:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.selection_sort._0.entry.0:
  addi t6, a2, 16                                                       # ir inst 1 fin
  addi t5, a2, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
# Phi connections
  li t6, 0
  j .F.selection_sort._1.while.cond.0                                   # ir inst 6 fin
.F.selection_sort._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 8 fin
  slt t4, t6, t5                                                        # ir inst 9 fin
  bnez t4, .F.selection_sort._2.while.body.0
  j .F.selection_sort._12.while.exit.0                                  # ir inst 10 fin
.F.selection_sort._2.while.body.0:
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, t5
  mv t5, t6
  j .F.selection_sort._3.while.cond.1                                   # ir inst 12 fin
.F.selection_sort._3.while.cond.1:
  slt t3, t4, a1                                                        # ir inst 15 fin
  bnez t3, .F.selection_sort._4.while.body.1
  j .F.selection_sort._8.while.exit.1                                   # ir inst 16 fin
.F.selection_sort._4.while.body.1:
  addi t3, a2, 4                                                        # ir inst 17 fin
  addi s11, a2, 4                                                       # ir inst 18 fin
  lw s10, 0(s11)                                                        # ir inst 19 fin
  addi s11, s10, 1                                                      # ir inst 20 fin
  sw s11, 0(t3)                                                         # ir inst 21 fin
  addi t3, a2, 12                                                       # ir inst 22 fin
  addi s11, a2, 12                                                      # ir inst 23 fin
  lw s10, 0(s11)                                                        # ir inst 24 fin
  addi s11, s10, 2                                                      # ir inst 25 fin
  sw s11, 0(t3)                                                         # ir inst 26 fin
  mv t3, t4                                                             # ir inst 27 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 28 fin
  lw t3, 0(s11)                                                         # ir inst 29 fin
  mv s11, t5                                                            # ir inst 30 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 31 fin
  lw s11, 0(s10)                                                        # ir inst 32 fin
  slt s10, t3, s11                                                      # ir inst 33 fin
  bnez s10, .F.selection_sort._5.if.then.0
  j .F.selection_sort._6.if.else.0                                      # ir inst 34 fin
.F.selection_sort._5.if.then.0:
# Phi connections
  mv t3, t4
  j .F.selection_sort._7.if.exit.0                                      # ir inst 35 fin
.F.selection_sort._6.if.else.0:
# Phi connections
  mv t3, t5
  j .F.selection_sort._7.if.exit.0                                      # ir inst 36 fin
.F.selection_sort._7.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 38 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.selection_sort._3.while.cond.1                                   # ir inst 39 fin
.F.selection_sort._8.while.exit.1:
  xor t0, t5, t6
  sltu t4, zero, t0                                                     # ir inst 40 fin
  bnez t4, .F.selection_sort._9.if.then.1
  j .F.selection_sort._10.if.else.1                                     # ir inst 41 fin
.F.selection_sort._9.if.then.1:
  mv t4, t6                                                             # ir inst 42 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 43 fin
  lw t4, 0(t3)                                                          # ir inst 44 fin
  mv t3, t6                                                             # ir inst 45 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 46 fin
  mv t3, t5                                                             # ir inst 47 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 48 fin
  lw t3, 0(s10)                                                         # ir inst 49 fin
  sw t3, 0(s11)                                                         # ir inst 50 fin
  mv t3, t5                                                             # ir inst 51 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 52 fin
  sw t4, 0(t5)                                                          # ir inst 53 fin
  addi t5, a2, 8                                                        # ir inst 54 fin
  addi t4, a2, 8                                                        # ir inst 55 fin
  lw t3, 0(t4)                                                          # ir inst 56 fin
  addi t4, t3, 1                                                        # ir inst 57 fin
  sw t4, 0(t5)                                                          # ir inst 58 fin
  addi t5, a2, 12                                                       # ir inst 59 fin
  addi t4, a2, 12                                                       # ir inst 60 fin
  lw t3, 0(t4)                                                          # ir inst 61 fin
  addi t4, t3, 4                                                        # ir inst 62 fin
  sw t4, 0(t5)                                                          # ir inst 63 fin
  j .F.selection_sort._11.if.exit.1                                     # ir inst 64 fin
.F.selection_sort._10.if.else.1:
  j .F.selection_sort._11.if.exit.1                                     # ir inst 65 fin
.F.selection_sort._11.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 66 fin
# Phi connections
  mv t6, t5
  j .F.selection_sort._1.while.cond.0                                   # ir inst 67 fin
.F.selection_sort._12.while.exit.0:
  addi t6, a2, 0                                                        # ir inst 68 fin
  addi t5, a2, 0                                                        # ir inst 69 fin
  lw t4, 0(t5)                                                          # ir inst 70 fin
  mul t5, a1, a1                                                        # ir inst 71 fin
  add t3, t4, t5                                                        # ir inst 72 fin
  sw t3, 0(t6)                                                          # ir inst 73 fin
  j .F.selection_sort.epilogue                                          # ir inst 74 fin
.F.selection_sort.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.insertion_sort
.F.insertion_sort:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.insertion_sort._0.entry.0:
  addi t6, a2, 16                                                       # ir inst 1 fin
  addi t5, a2, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
# Phi connections
  li t6, 1
  j .F.insertion_sort._1.while.cond.0                                   # ir inst 6 fin
.F.insertion_sort._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 8 fin
  bnez t5, .F.insertion_sort._2.while.body.0
  j .F.insertion_sort._9.while.exit.0                                   # ir inst 9 fin
.F.insertion_sort._2.while.body.0:
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 11 fin
  lw t5, 0(t4)                                                          # ir inst 12 fin
  addi t4, t6, -1                                                       # ir inst 13 fin
  addi t3, a2, 12                                                       # ir inst 14 fin
  addi s11, a2, 12                                                      # ir inst 15 fin
  lw s10, 0(s11)                                                        # ir inst 16 fin
  addi s11, s10, 1                                                      # ir inst 17 fin
  sw s11, 0(t3)                                                         # ir inst 18 fin
# Phi connections
  j .F.insertion_sort._3.while.cond.1                                   # ir inst 19 fin
.F.insertion_sort._3.while.cond.1:
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 21 fin
  bnez t3, .F.insertion_sort._4.lazy.then.0
  j .F.insertion_sort._5.lazy.else.0                                    # ir inst 22 fin
.F.insertion_sort._4.lazy.then.0:
  mv t3, t4                                                             # ir inst 23 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 24 fin
  lw t3, 0(s11)                                                         # ir inst 25 fin
  slt s11, t5, t3                                                       # ir inst 26 fin
# Phi connections
  mv t3, s11
  j .F.insertion_sort._6.lazy.exit.0                                    # ir inst 27 fin
.F.insertion_sort._5.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.insertion_sort._6.lazy.exit.0                                    # ir inst 28 fin
.F.insertion_sort._6.lazy.exit.0:
  bnez t3, .F.insertion_sort._7.while.body.1
  j .F.insertion_sort._8.while.exit.1                                   # ir inst 30 fin
.F.insertion_sort._7.while.body.1:
  addi t3, a2, 4                                                        # ir inst 31 fin
  addi s11, a2, 4                                                       # ir inst 32 fin
  lw s10, 0(s11)                                                        # ir inst 33 fin
  addi s11, s10, 1                                                      # ir inst 34 fin
  sw s11, 0(t3)                                                         # ir inst 35 fin
  addi t3, a2, 12                                                       # ir inst 36 fin
  addi s11, a2, 12                                                      # ir inst 37 fin
  lw s10, 0(s11)                                                        # ir inst 38 fin
  addi s11, s10, 2                                                      # ir inst 39 fin
  sw s11, 0(t3)                                                         # ir inst 40 fin
  mv t3, t4                                                             # ir inst 41 fin
  addi s11, t3, 1                                                       # ir inst 42 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 43 fin
  mv s11, t4                                                            # ir inst 44 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 45 fin
  lw s11, 0(s10)                                                        # ir inst 46 fin
  sw s11, 0(t3)                                                         # ir inst 47 fin
  addi t3, a2, 12                                                       # ir inst 48 fin
  addi s11, a2, 12                                                      # ir inst 49 fin
  lw s10, 0(s11)                                                        # ir inst 50 fin
  addi s11, s10, 2                                                      # ir inst 51 fin
  sw s11, 0(t3)                                                         # ir inst 52 fin
  addi t3, t4, -1                                                       # ir inst 53 fin
# Phi connections
  mv t4, t3
  j .F.insertion_sort._3.while.cond.1                                   # ir inst 54 fin
.F.insertion_sort._8.while.exit.1:
  mv t3, t4                                                             # ir inst 55 fin
  addi t4, t3, 1                                                        # ir inst 56 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 57 fin
  sw t5, 0(t3)                                                          # ir inst 58 fin
  addi t5, a2, 12                                                       # ir inst 59 fin
  addi t4, a2, 12                                                       # ir inst 60 fin
  lw t3, 0(t4)                                                          # ir inst 61 fin
  addi t4, t3, 1                                                        # ir inst 62 fin
  sw t4, 0(t5)                                                          # ir inst 63 fin
  addi t5, t6, 1                                                        # ir inst 64 fin
# Phi connections
  mv t6, t5
  j .F.insertion_sort._1.while.cond.0                                   # ir inst 65 fin
.F.insertion_sort._9.while.exit.0:
  addi t6, a2, 0                                                        # ir inst 66 fin
  addi t5, a2, 0                                                        # ir inst 67 fin
  lw t4, 0(t5)                                                          # ir inst 68 fin
  mul t5, a1, a1                                                        # ir inst 69 fin
  add t3, t4, t5                                                        # ir inst 70 fin
  sw t3, 0(t6)                                                          # ir inst 71 fin
  j .F.insertion_sort.epilogue                                          # ir inst 72 fin
.F.insertion_sort.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.partition
.F.partition:
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
.F.partition._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  addi t5, a1, -1                                                       # ir inst 4 fin
  addi t4, a3, 12                                                       # ir inst 5 fin
  addi t3, a3, 12                                                       # ir inst 6 fin
  lw s11, 0(t3)                                                         # ir inst 7 fin
  addi t3, s11, 1                                                       # ir inst 8 fin
  sw t3, 0(t4)                                                          # ir inst 9 fin
# Phi connections
  mv t4, a1
  j .F.partition._1.while.cond.0                                        # ir inst 10 fin
.F.partition._1.while.cond.0:
  slt t3, t4, a2                                                        # ir inst 13 fin
  bnez t3, .F.partition._2.while.body.0
  j .F.partition._6.while.exit.0                                        # ir inst 14 fin
.F.partition._2.while.body.0:
  addi t3, a3, 4                                                        # ir inst 15 fin
  addi s11, a3, 4                                                       # ir inst 16 fin
  lw s10, 0(s11)                                                        # ir inst 17 fin
  addi s11, s10, 1                                                      # ir inst 18 fin
  sw s11, 0(t3)                                                         # ir inst 19 fin
  addi t3, a3, 12                                                       # ir inst 20 fin
  addi s11, a3, 12                                                      # ir inst 21 fin
  lw s10, 0(s11)                                                        # ir inst 22 fin
  addi s11, s10, 1                                                      # ir inst 23 fin
  sw s11, 0(t3)                                                         # ir inst 24 fin
  mv t3, t4                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 26 fin
  lw t3, 0(s11)                                                         # ir inst 27 fin
  slt t0, t6, t3
  xori s11, t0, 1                                                       # ir inst 28 fin
  bnez s11, .F.partition._3.if.then.0
  j .F.partition._4.if.else.0                                           # ir inst 29 fin
.F.partition._3.if.then.0:
  addi t3, t5, 1                                                        # ir inst 30 fin
  mv s11, t3                                                            # ir inst 31 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 32 fin
  lw s11, 0(s10)                                                        # ir inst 33 fin
  mv s10, t3                                                            # ir inst 34 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 35 fin
  mv s10, t4                                                            # ir inst 36 fin
  slli t2, s10, 2
  add s8, a0, t2                                                        # ir inst 37 fin
  lw s10, 0(s8)                                                         # ir inst 38 fin
  sw s10, 0(s9)                                                         # ir inst 39 fin
  mv s10, t4                                                            # ir inst 40 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 41 fin
  sw s11, 0(s9)                                                         # ir inst 42 fin
  addi s11, a3, 8                                                       # ir inst 43 fin
  addi s10, a3, 8                                                       # ir inst 44 fin
  lw s9, 0(s10)                                                         # ir inst 45 fin
  addi s10, s9, 1                                                       # ir inst 46 fin
  sw s10, 0(s11)                                                        # ir inst 47 fin
  addi s11, a3, 12                                                      # ir inst 48 fin
  addi s10, a3, 12                                                      # ir inst 49 fin
  lw s9, 0(s10)                                                         # ir inst 50 fin
  addi s10, s9, 4                                                       # ir inst 51 fin
  sw s10, 0(s11)                                                        # ir inst 52 fin
# Phi connections
  j .F.partition._5.if.exit.0                                           # ir inst 53 fin
.F.partition._4.if.else.0:
# Phi connections
  mv t3, t5
  j .F.partition._5.if.exit.0                                           # ir inst 54 fin
.F.partition._5.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 56 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.partition._1.while.cond.0                                        # ir inst 57 fin
.F.partition._6.while.exit.0:
  addi t6, t5, 1                                                        # ir inst 58 fin
  mv t4, t6                                                             # ir inst 59 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 60 fin
  lw t4, 0(t6)                                                          # ir inst 61 fin
  addi t6, t5, 1                                                        # ir inst 62 fin
  mv t3, t6                                                             # ir inst 63 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 64 fin
  mv t3, a2                                                             # ir inst 65 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 66 fin
  lw t3, 0(s11)                                                         # ir inst 67 fin
  sw t3, 0(t6)                                                          # ir inst 68 fin
  mv t6, a2                                                             # ir inst 69 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 70 fin
  sw t4, 0(t3)                                                          # ir inst 71 fin
  addi t6, a3, 8                                                        # ir inst 72 fin
  addi t4, a3, 8                                                        # ir inst 73 fin
  lw t3, 0(t4)                                                          # ir inst 74 fin
  addi t4, t3, 1                                                        # ir inst 75 fin
  sw t4, 0(t6)                                                          # ir inst 76 fin
  addi t6, a3, 12                                                       # ir inst 77 fin
  addi t4, a3, 12                                                       # ir inst 78 fin
  lw t3, 0(t4)                                                          # ir inst 79 fin
  addi t4, t3, 4                                                        # ir inst 80 fin
  sw t4, 0(t6)                                                          # ir inst 81 fin
  addi t6, t5, 1                                                        # ir inst 82 fin
  mv a0, t6
  j .F.partition.epilogue                                               # ir inst 83 fin
.F.partition.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.quick_sort_range
.F.quick_sort_range:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.quick_sort_range._0.entry.0:
  addi t6, a3, 16                                                       # ir inst 1 fin
  addi t5, a3, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
  slt t6, a1, a2                                                        # ir inst 6 fin
  bnez t6, .F.quick_sort_range._1.if.then.0
  j .F.quick_sort_range._2.if.else.0                                    # ir inst 7 fin
.F.quick_sort_range._1.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  call .F.partition
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 8 fin
  addi t5, t6, -1                                                       # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, t5
  call .F.quick_sort_range
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, t5
  call .F.quick_sort_range
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 12 fin
  j .F.quick_sort_range._3.if.exit.0                                    # ir inst 13 fin
.F.quick_sort_range._2.if.else.0:
  j .F.quick_sort_range._3.if.exit.0                                    # ir inst 14 fin
.F.quick_sort_range._3.if.exit.0:
  addi t6, a3, 0                                                        # ir inst 15 fin
  addi t5, a3, 0                                                        # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  sub t5, a2, a1                                                        # ir inst 18 fin
  addi t3, t5, 1                                                        # ir inst 19 fin
  add t5, t4, t3                                                        # ir inst 20 fin
  sw t5, 0(t6)                                                          # ir inst 21 fin
  j .F.quick_sort_range.epilogue                                        # ir inst 22 fin
.F.quick_sort_range.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.quick_sort
.F.quick_sort:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.quick_sort._0.entry.0:
  li t2, 1
  slt t6, t2, a1                                                        # ir inst 1 fin
  bnez t6, .F.quick_sort._1.if.then.0
  j .F.quick_sort._2.if.else.0                                          # ir inst 2 fin
.F.quick_sort._1.if.then.0:
  addi t6, a1, -1                                                       # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a3, a2
  mv a2, t6
  li a1, 0
  call .F.quick_sort_range
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 4 fin
  j .F.quick_sort._3.if.exit.0                                          # ir inst 5 fin
.F.quick_sort._2.if.else.0:
  j .F.quick_sort._3.if.exit.0                                          # ir inst 6 fin
.F.quick_sort._3.if.exit.0:
  j .F.quick_sort.epilogue                                              # ir inst 7 fin
.F.quick_sort.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.merge
.F.merge:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 0,                range:       56(sp) -       56(sp)
# callee save reg num: 7 / 12,        range:        0(sp) -       56(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s5, 0(sp)
  sd s6, 8(sp)
  sd s7, 16(sp)
  sd s8, 24(sp)
  sd s9, 32(sp)
  sd s10, 40(sp)
  sd s11, 48(sp)
.F.merge._0.entry.0:
  sub t6, a2, a1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  sub t6, a3, a2                                                        # ir inst 3 fin
  li t1, 10000
  mv t4, t1                                                             # ir inst 4 fin
  sub t3, t4, t5                                                        # ir inst 5 fin
# Phi connections
  li t4, 0
  j .F.merge._1.while.cond.0                                            # ir inst 6 fin
.F.merge._1.while.cond.0:
  slt s11, t4, t5                                                       # ir inst 8 fin
  bnez s11, .F.merge._2.while.body.0
  j .F.merge._3.while.exit.0                                            # ir inst 9 fin
.F.merge._2.while.body.0:
  add s11, t3, t4                                                       # ir inst 10 fin
  mv s10, s11                                                           # ir inst 11 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  add s10, a1, t4                                                       # ir inst 13 fin
  mv s9, s10                                                            # ir inst 14 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 15 fin
  lw s9, 0(s10)                                                         # ir inst 16 fin
  sw s9, 0(s11)                                                         # ir inst 17 fin
  addi s11, a4, 12                                                      # ir inst 18 fin
  addi s10, a4, 12                                                      # ir inst 19 fin
  lw s9, 0(s10)                                                         # ir inst 20 fin
  addi s10, s9, 2                                                       # ir inst 21 fin
  sw s10, 0(s11)                                                        # ir inst 22 fin
  addi s11, t4, 1                                                       # ir inst 23 fin
# Phi connections
  mv t4, s11
  j .F.merge._1.while.cond.0                                            # ir inst 24 fin
.F.merge._3.while.exit.0:
# Phi connections
  mv s10, a1
  li s11, 0
  li t4, 0
  j .F.merge._4.while.cond.1                                            # ir inst 25 fin
.F.merge._4.while.cond.1:
  slt s9, t4, t5                                                        # ir inst 29 fin
  bnez s9, .F.merge._5.lazy.then.0
  j .F.merge._6.lazy.else.0                                             # ir inst 30 fin
.F.merge._5.lazy.then.0:
  slt s9, s11, t6                                                       # ir inst 31 fin
# Phi connections
  j .F.merge._7.lazy.exit.0                                             # ir inst 32 fin
.F.merge._6.lazy.else.0:
# Phi connections
  li s9, 0
  j .F.merge._7.lazy.exit.0                                             # ir inst 33 fin
.F.merge._7.lazy.exit.0:
  bnez s9, .F.merge._8.while.body.1
  j .F.merge._12.while.exit.1                                           # ir inst 35 fin
.F.merge._8.while.body.1:
  addi s9, a4, 4                                                        # ir inst 36 fin
  addi s8, a4, 4                                                        # ir inst 37 fin
  lw s7, 0(s8)                                                          # ir inst 38 fin
  addi s8, s7, 1                                                        # ir inst 39 fin
  sw s8, 0(s9)                                                          # ir inst 40 fin
  addi s9, a4, 12                                                       # ir inst 41 fin
  addi s8, a4, 12                                                       # ir inst 42 fin
  lw s7, 0(s8)                                                          # ir inst 43 fin
  addi s8, s7, 2                                                        # ir inst 44 fin
  sw s8, 0(s9)                                                          # ir inst 45 fin
  add s9, t3, t4                                                        # ir inst 46 fin
  mv s8, s9                                                             # ir inst 47 fin
  slli t2, s8, 2
  add s9, a0, t2                                                        # ir inst 48 fin
  lw s8, 0(s9)                                                          # ir inst 49 fin
  addi s9, a2, 1                                                        # ir inst 50 fin
  add s7, s9, s11                                                       # ir inst 51 fin
  mv s9, s7                                                             # ir inst 52 fin
  slli t2, s9, 2
  add s7, a0, t2                                                        # ir inst 53 fin
  lw s9, 0(s7)                                                          # ir inst 54 fin
  slt t0, s9, s8
  xori s7, t0, 1                                                        # ir inst 55 fin
  bnez s7, .F.merge._9.if.then.0
  j .F.merge._10.if.else.0                                              # ir inst 56 fin
.F.merge._9.if.then.0:
  mv s9, s10                                                            # ir inst 57 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 58 fin
  add s9, t3, t4                                                        # ir inst 59 fin
  mv s7, s9                                                             # ir inst 60 fin
  slli t2, s7, 2
  add s9, a0, t2                                                        # ir inst 61 fin
  lw s7, 0(s9)                                                          # ir inst 62 fin
  sw s7, 0(s8)                                                          # ir inst 63 fin
  addi s9, t4, 1                                                        # ir inst 64 fin
# Phi connections
  mv s8, s11
  j .F.merge._11.if.exit.0                                              # ir inst 65 fin
.F.merge._10.if.else.0:
  mv s9, s10                                                            # ir inst 66 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 67 fin
  addi s9, a2, 1                                                        # ir inst 68 fin
  add s7, s9, s11                                                       # ir inst 69 fin
  mv s9, s7                                                             # ir inst 70 fin
  slli t2, s9, 2
  add s7, a0, t2                                                        # ir inst 71 fin
  lw s9, 0(s7)                                                          # ir inst 72 fin
  sw s9, 0(s8)                                                          # ir inst 73 fin
  addi s9, s11, 1                                                       # ir inst 74 fin
# Phi connections
  mv s8, s9
  mv s9, t4
  j .F.merge._11.if.exit.0                                              # ir inst 75 fin
.F.merge._11.if.exit.0:
  addi s7, a4, 12                                                       # ir inst 78 fin
  addi s6, a4, 12                                                       # ir inst 79 fin
  lw s5, 0(s6)                                                          # ir inst 80 fin
  addi s6, s5, 1                                                        # ir inst 81 fin
  sw s6, 0(s7)                                                          # ir inst 82 fin
  addi s7, s10, 1                                                       # ir inst 83 fin
# Phi connections
  mv s10, s7
  mv s11, s8
  mv t4, s9
  j .F.merge._4.while.cond.1                                            # ir inst 84 fin
.F.merge._12.while.exit.1:
# Phi connections
  j .F.merge._13.while.cond.2                                           # ir inst 85 fin
.F.merge._13.while.cond.2:
  slt s9, t4, t5                                                        # ir inst 88 fin
  bnez s9, .F.merge._14.while.body.2
  j .F.merge._15.while.exit.2                                           # ir inst 89 fin
.F.merge._14.while.body.2:
  mv s9, s10                                                            # ir inst 90 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 91 fin
  add s9, t3, t4                                                        # ir inst 92 fin
  mv s7, s9                                                             # ir inst 93 fin
  slli t2, s7, 2
  add s9, a0, t2                                                        # ir inst 94 fin
  lw s7, 0(s9)                                                          # ir inst 95 fin
  sw s7, 0(s8)                                                          # ir inst 96 fin
  addi s9, a4, 12                                                       # ir inst 97 fin
  addi s8, a4, 12                                                       # ir inst 98 fin
  lw s7, 0(s8)                                                          # ir inst 99 fin
  addi s8, s7, 2                                                        # ir inst 100 fin
  sw s8, 0(s9)                                                          # ir inst 101 fin
  addi s9, t4, 1                                                        # ir inst 102 fin
  addi t4, s10, 1                                                       # ir inst 103 fin
# Phi connections
  mv s10, t4
  mv t4, s9
  j .F.merge._13.while.cond.2                                           # ir inst 104 fin
.F.merge._15.while.exit.2:
# Phi connections
  mv t4, s10
  mv t5, s11
  j .F.merge._16.while.cond.3                                           # ir inst 105 fin
.F.merge._16.while.cond.3:
  slt t3, t5, t6                                                        # ir inst 108 fin
  bnez t3, .F.merge._17.while.body.3
  j .F.merge._18.while.exit.3                                           # ir inst 109 fin
.F.merge._17.while.body.3:
  mv t3, t4                                                             # ir inst 110 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 111 fin
  addi t3, a2, 1                                                        # ir inst 112 fin
  add s10, t3, t5                                                       # ir inst 113 fin
  mv t3, s10                                                            # ir inst 114 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 115 fin
  lw t3, 0(s10)                                                         # ir inst 116 fin
  sw t3, 0(s11)                                                         # ir inst 117 fin
  addi t3, a4, 12                                                       # ir inst 118 fin
  addi s11, a4, 12                                                      # ir inst 119 fin
  lw s10, 0(s11)                                                        # ir inst 120 fin
  addi s11, s10, 2                                                      # ir inst 121 fin
  sw s11, 0(t3)                                                         # ir inst 122 fin
  addi t3, t5, 1                                                        # ir inst 123 fin
  addi t5, t4, 1                                                        # ir inst 124 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  j .F.merge._16.while.cond.3                                           # ir inst 125 fin
.F.merge._18.while.exit.3:
  j .F.merge.epilogue                                                   # ir inst 126 fin
.F.merge.epilogue:
  ld s5, 0(sp)
  ld s6, 8(sp)
  ld s7, 16(sp)
  ld s8, 24(sp)
  ld s9, 32(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.merge_sort_range
.F.merge_sort_range:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.merge_sort_range._0.entry.0:
  addi t6, a3, 16                                                       # ir inst 1 fin
  addi t5, a3, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
  slt t6, a1, a2                                                        # ir inst 6 fin
  bnez t6, .F.merge_sort_range._1.if.then.0
  j .F.merge_sort_range._2.if.else.0                                    # ir inst 7 fin
.F.merge_sort_range._1.if.then.0:
  sub t6, a2, a1                                                        # ir inst 8 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 9 fin
  add t6, a1, t5                                                        # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a2, t6
  call .F.merge_sort_range
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t5
  call .F.merge_sort_range
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a4, a3
  mv a3, a2
  mv a2, t6
  call .F.merge
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 14 fin
  j .F.merge_sort_range._3.if.exit.0                                    # ir inst 15 fin
.F.merge_sort_range._2.if.else.0:
  j .F.merge_sort_range._3.if.exit.0                                    # ir inst 16 fin
.F.merge_sort_range._3.if.exit.0:
  addi t6, a3, 0                                                        # ir inst 17 fin
  addi t5, a3, 0                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  sub t5, a2, a1                                                        # ir inst 20 fin
  addi t3, t5, 1                                                        # ir inst 21 fin
  add t5, t4, t3                                                        # ir inst 22 fin
  sw t5, 0(t6)                                                          # ir inst 23 fin
  j .F.merge_sort_range.epilogue                                        # ir inst 24 fin
.F.merge_sort_range.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.merge_sort
.F.merge_sort:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.merge_sort._0.entry.0:
  li t2, 1
  slt t6, t2, a1                                                        # ir inst 1 fin
  bnez t6, .F.merge_sort._1.if.then.0
  j .F.merge_sort._2.if.else.0                                          # ir inst 2 fin
.F.merge_sort._1.if.then.0:
  addi t6, a1, -1                                                       # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a3, a2
  mv a2, t6
  li a1, 0
  call .F.merge_sort_range
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 4 fin
  j .F.merge_sort._3.if.exit.0                                          # ir inst 5 fin
.F.merge_sort._2.if.else.0:
  j .F.merge_sort._3.if.exit.0                                          # ir inst 6 fin
.F.merge_sort._3.if.exit.0:
  j .F.merge_sort.epilogue                                              # ir inst 7 fin
.F.merge_sort.epilogue:
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
  addi t6, a3, 12                                                       # ir inst 5 fin
  addi t3, a3, 12                                                       # ir inst 6 fin
  lw s11, 0(t3)                                                         # ir inst 7 fin
  addi t3, s11, 1                                                       # ir inst 8 fin
  sw t3, 0(t6)                                                          # ir inst 9 fin
  slt t6, t5, a1                                                        # ir inst 10 fin
  bnez t6, .F.heapify._1.if.then.0
  j .F.heapify._5.if.else.0                                             # ir inst 11 fin
.F.heapify._1.if.then.0:
  addi t6, a3, 4                                                        # ir inst 12 fin
  addi t3, a3, 4                                                        # ir inst 13 fin
  lw s11, 0(t3)                                                         # ir inst 14 fin
  addi t3, s11, 1                                                       # ir inst 15 fin
  sw t3, 0(t6)                                                          # ir inst 16 fin
  addi t6, a3, 12                                                       # ir inst 17 fin
  addi t3, a3, 12                                                       # ir inst 18 fin
  lw s11, 0(t3)                                                         # ir inst 19 fin
  addi t3, s11, 2                                                       # ir inst 20 fin
  sw t3, 0(t6)                                                          # ir inst 21 fin
  mv t6, t5                                                             # ir inst 22 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  lw t6, 0(t3)                                                          # ir inst 24 fin
  mv t3, a2                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 26 fin
  lw t3, 0(s11)                                                         # ir inst 27 fin
  slt s11, t3, t6                                                       # ir inst 28 fin
  bnez s11, .F.heapify._2.if.then.1
  j .F.heapify._3.if.else.1                                             # ir inst 29 fin
.F.heapify._2.if.then.1:
# Phi connections
  mv t6, t5
  j .F.heapify._4.if.exit.1                                             # ir inst 30 fin
.F.heapify._3.if.else.1:
# Phi connections
  mv t6, a2
  j .F.heapify._4.if.exit.1                                             # ir inst 31 fin
.F.heapify._4.if.exit.1:
# Phi connections
  j .F.heapify._6.if.exit.0                                             # ir inst 33 fin
.F.heapify._5.if.else.0:
# Phi connections
  mv t6, a2
  j .F.heapify._6.if.exit.0                                             # ir inst 34 fin
.F.heapify._6.if.exit.0:
  slt t5, t4, a1                                                        # ir inst 36 fin
  bnez t5, .F.heapify._7.if.then.2
  j .F.heapify._11.if.else.2                                            # ir inst 37 fin
.F.heapify._7.if.then.2:
  addi t5, a3, 4                                                        # ir inst 38 fin
  addi t3, a3, 4                                                        # ir inst 39 fin
  lw s11, 0(t3)                                                         # ir inst 40 fin
  addi t3, s11, 1                                                       # ir inst 41 fin
  sw t3, 0(t5)                                                          # ir inst 42 fin
  addi t5, a3, 12                                                       # ir inst 43 fin
  addi t3, a3, 12                                                       # ir inst 44 fin
  lw s11, 0(t3)                                                         # ir inst 45 fin
  addi t3, s11, 2                                                       # ir inst 46 fin
  sw t3, 0(t5)                                                          # ir inst 47 fin
  mv t5, t4                                                             # ir inst 48 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 49 fin
  lw t5, 0(t3)                                                          # ir inst 50 fin
  mv t3, t6                                                             # ir inst 51 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 52 fin
  lw t3, 0(s11)                                                         # ir inst 53 fin
  slt s11, t3, t5                                                       # ir inst 54 fin
  bnez s11, .F.heapify._8.if.then.3
  j .F.heapify._9.if.else.3                                             # ir inst 55 fin
.F.heapify._8.if.then.3:
# Phi connections
  mv t5, t4
  j .F.heapify._10.if.exit.3                                            # ir inst 56 fin
.F.heapify._9.if.else.3:
# Phi connections
  mv t5, t6
  j .F.heapify._10.if.exit.3                                            # ir inst 57 fin
.F.heapify._10.if.exit.3:
# Phi connections
  mv t6, t5
  j .F.heapify._12.if.exit.2                                            # ir inst 59 fin
.F.heapify._11.if.else.2:
# Phi connections
  j .F.heapify._12.if.exit.2                                            # ir inst 60 fin
.F.heapify._12.if.exit.2:
  xor t0, t6, a2
  sltu t5, zero, t0                                                     # ir inst 62 fin
  bnez t5, .F.heapify._13.if.then.4
  j .F.heapify._14.if.else.4                                            # ir inst 63 fin
.F.heapify._13.if.then.4:
  mv t5, a2                                                             # ir inst 64 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 65 fin
  lw t5, 0(t4)                                                          # ir inst 66 fin
  mv t4, a2                                                             # ir inst 67 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 68 fin
  mv t4, t6                                                             # ir inst 69 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 70 fin
  lw t4, 0(s11)                                                         # ir inst 71 fin
  sw t4, 0(t3)                                                          # ir inst 72 fin
  mv t4, t6                                                             # ir inst 73 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 74 fin
  sw t5, 0(t3)                                                          # ir inst 75 fin
  addi t5, a3, 8                                                        # ir inst 76 fin
  addi t4, a3, 8                                                        # ir inst 77 fin
  lw t3, 0(t4)                                                          # ir inst 78 fin
  addi t4, t3, 1                                                        # ir inst 79 fin
  sw t4, 0(t5)                                                          # ir inst 80 fin
  addi t5, a3, 12                                                       # ir inst 81 fin
  addi t4, a3, 12                                                       # ir inst 82 fin
  lw t3, 0(t4)                                                          # ir inst 83 fin
  addi t4, t3, 4                                                        # ir inst 84 fin
  sw t4, 0(t5)                                                          # ir inst 85 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a3, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  call .F.heapify
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a3, 16(sp)
  ld t6, 24(sp)
# ir inst 86 fin
  j .F.heapify._15.if.exit.4                                            # ir inst 87 fin
.F.heapify._14.if.else.4:
  j .F.heapify._15.if.exit.4                                            # ir inst 88 fin
.F.heapify._15.if.exit.4:
  j .F.heapify.epilogue                                                 # ir inst 89 fin
.F.heapify.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.heap_sort
.F.heap_sort:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.heap_sort._0.entry.0:
  addi t6, a2, 16                                                       # ir inst 1 fin
  addi t5, a2, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
  li t2, 2
  div t6, a1, t2                                                        # ir inst 6 fin
  addi t5, t6, -1                                                       # ir inst 7 fin
# Phi connections
  mv t6, t5
  j .F.heap_sort._1.while.cond.0                                        # ir inst 8 fin
.F.heap_sort._1.while.cond.0:
  li t2, 0
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 10 fin
  bnez t5, .F.heap_sort._2.while.body.0
  j .F.heap_sort._3.while.exit.0                                        # ir inst 11 fin
.F.heap_sort._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a3, a2
  mv a2, t6
  call .F.heapify
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 12 fin
  addi t5, t6, -1                                                       # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F.heap_sort._1.while.cond.0                                        # ir inst 14 fin
.F.heap_sort._3.while.exit.0:
  addi t6, a1, -1                                                       # ir inst 15 fin
# Phi connections
  j .F.heap_sort._4.while.cond.1                                        # ir inst 16 fin
.F.heap_sort._4.while.cond.1:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 18 fin
  bnez t5, .F.heap_sort._5.while.body.1
  j .F.heap_sort._6.while.exit.1                                        # ir inst 19 fin
.F.heap_sort._5.while.body.1:
  addi t5, a0, 0                                                        # ir inst 20 fin
  lw t4, 0(t5)                                                          # ir inst 21 fin
  addi t5, a0, 0                                                        # ir inst 22 fin
  mv t3, t6                                                             # ir inst 23 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 24 fin
  lw t3, 0(s11)                                                         # ir inst 25 fin
  sw t3, 0(t5)                                                          # ir inst 26 fin
  mv t5, t6                                                             # ir inst 27 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 28 fin
  sw t4, 0(t3)                                                          # ir inst 29 fin
  addi t5, a2, 8                                                        # ir inst 30 fin
  addi t4, a2, 8                                                        # ir inst 31 fin
  lw t3, 0(t4)                                                          # ir inst 32 fin
  addi t4, t3, 1                                                        # ir inst 33 fin
  sw t4, 0(t5)                                                          # ir inst 34 fin
  addi t5, a2, 12                                                       # ir inst 35 fin
  addi t4, a2, 12                                                       # ir inst 36 fin
  lw t3, 0(t4)                                                          # ir inst 37 fin
  addi t4, t3, 4                                                        # ir inst 38 fin
  sw t4, 0(t5)                                                          # ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a3, a2
  li a2, 0
  mv a1, t6
  call .F.heapify
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 40 fin
  addi t5, t6, -1                                                       # ir inst 41 fin
# Phi connections
  mv t6, t5
  j .F.heap_sort._4.while.cond.1                                        # ir inst 42 fin
.F.heap_sort._6.while.exit.1:
  addi t6, a2, 0                                                        # ir inst 43 fin
  addi t5, a2, 0                                                        # ir inst 44 fin
  lw t4, 0(t5)                                                          # ir inst 45 fin
  mul t5, a1, a1                                                        # ir inst 46 fin
  add t3, t4, t5                                                        # ir inst 47 fin
  sw t3, 0(t6)                                                          # ir inst 48 fin
  j .F.heap_sort.epilogue                                               # ir inst 49 fin
.F.heap_sort.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.binary_search
.F.binary_search:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.binary_search._0.entry.0:
  addi t6, a3, 16                                                       # ir inst 1 fin
  addi t5, a3, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
  addi t6, a1, -1                                                       # ir inst 6 fin
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.binary_search._1.while.cond.0                                    # ir inst 7 fin
.F.binary_search._1.while.cond.0:
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 10 fin
  bnez t4, .F.binary_search._2.while.body.0
  j .F.binary_search._9.while.exit.0                                    # ir inst 11 fin
.F.binary_search._2.while.body.0:
  sub t4, t5, t6                                                        # ir inst 12 fin
  li t2, 2
  div t3, t4, t2                                                        # ir inst 13 fin
  add t4, t6, t3                                                        # ir inst 14 fin
  addi t3, a3, 4                                                        # ir inst 15 fin
  addi s11, a3, 4                                                       # ir inst 16 fin
  lw s10, 0(s11)                                                        # ir inst 17 fin
  addi s11, s10, 1                                                      # ir inst 18 fin
  sw s11, 0(t3)                                                         # ir inst 19 fin
  addi t3, a3, 12                                                       # ir inst 20 fin
  addi s11, a3, 12                                                      # ir inst 21 fin
  lw s10, 0(s11)                                                        # ir inst 22 fin
  addi s11, s10, 1                                                      # ir inst 23 fin
  sw s11, 0(t3)                                                         # ir inst 24 fin
  mv t3, t4                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 26 fin
  lw t3, 0(s11)                                                         # ir inst 27 fin
  xor t0, t3, a2
  sltiu s11, t0, 1                                                      # ir inst 28 fin
  bnez s11, .F.binary_search._3.if.then.0
  j .F.binary_search._4.if.else.0                                       # ir inst 29 fin
.F.binary_search._3.if.then.0:
  addi t3, a3, 0                                                        # ir inst 30 fin
  addi s11, a3, 0                                                       # ir inst 31 fin
  lw s10, 0(s11)                                                        # ir inst 32 fin
  addi s11, s10, 1                                                      # ir inst 33 fin
  sw s11, 0(t3)                                                         # ir inst 34 fin
  mv a0, t4
  j .F.binary_search.epilogue                                           # ir inst 35 fin
.F.binary_search._4.if.else.0:
  mv t3, t4                                                             # ir inst 36 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 37 fin
  lw t3, 0(s11)                                                         # ir inst 38 fin
  slt s11, t3, a2                                                       # ir inst 39 fin
  bnez s11, .F.binary_search._5.if.then.1
  j .F.binary_search._6.if.else.1                                       # ir inst 40 fin
.F.binary_search._5.if.then.1:
  addi t3, t4, 1                                                        # ir inst 41 fin
# Phi connections
  mv t6, t3
  j .F.binary_search._7.if.exit.1                                       # ir inst 42 fin
.F.binary_search._6.if.else.1:
  addi t5, t4, -1                                                       # ir inst 43 fin
# Phi connections
  j .F.binary_search._7.if.exit.1                                       # ir inst 44 fin
.F.binary_search._7.if.exit.1:
  j .F.binary_search._8.if.exit.0                                       # ir inst 47 fin
.F.binary_search._8.if.exit.0:
  addi t4, a3, 0                                                        # ir inst 48 fin
  addi t3, a3, 0                                                        # ir inst 49 fin
  lw s11, 0(t3)                                                         # ir inst 50 fin
  addi t3, s11, 1                                                       # ir inst 51 fin
  sw t3, 0(t4)                                                          # ir inst 52 fin
# Phi connections
  j .F.binary_search._1.while.cond.0                                    # ir inst 53 fin
.F.binary_search._9.while.exit.0:
  li a0, -1
  j .F.binary_search.epilogue                                           # ir inst 54 fin
.F.binary_search.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.linear_search
.F.linear_search:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.linear_search._0.entry.0:
  addi t6, a3, 16                                                       # ir inst 1 fin
  addi t5, a3, 16                                                       # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
# Phi connections
  li t6, 0
  j .F.linear_search._1.while.cond.0                                    # ir inst 6 fin
.F.linear_search._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 8 fin
  bnez t5, .F.linear_search._2.while.body.0
  j .F.linear_search._6.while.exit.0                                    # ir inst 9 fin
.F.linear_search._2.while.body.0:
  addi t5, a3, 4                                                        # ir inst 10 fin
  addi t4, a3, 4                                                        # ir inst 11 fin
  lw t3, 0(t4)                                                          # ir inst 12 fin
  addi t4, t3, 1                                                        # ir inst 13 fin
  sw t4, 0(t5)                                                          # ir inst 14 fin
  addi t5, a3, 12                                                       # ir inst 15 fin
  addi t4, a3, 12                                                       # ir inst 16 fin
  lw t3, 0(t4)                                                          # ir inst 17 fin
  addi t4, t3, 1                                                        # ir inst 18 fin
  sw t4, 0(t5)                                                          # ir inst 19 fin
  mv t5, t6                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 21 fin
  lw t5, 0(t4)                                                          # ir inst 22 fin
  xor t0, t5, a2
  sltiu t4, t0, 1                                                       # ir inst 23 fin
  bnez t4, .F.linear_search._3.if.then.0
  j .F.linear_search._4.if.else.0                                       # ir inst 24 fin
.F.linear_search._3.if.then.0:
  addi t5, a3, 0                                                        # ir inst 25 fin
  addi t4, a3, 0                                                        # ir inst 26 fin
  lw t3, 0(t4)                                                          # ir inst 27 fin
  add t4, t3, t6                                                        # ir inst 28 fin
  addi t3, t4, 1                                                        # ir inst 29 fin
  sw t3, 0(t5)                                                          # ir inst 30 fin
  mv a0, t6
  j .F.linear_search.epilogue                                           # ir inst 31 fin
.F.linear_search._4.if.else.0:
  j .F.linear_search._5.if.exit.0                                       # ir inst 32 fin
.F.linear_search._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 33 fin
# Phi connections
  mv t6, t5
  j .F.linear_search._1.while.cond.0                                    # ir inst 34 fin
.F.linear_search._6.while.exit.0:
  addi t6, a3, 0                                                        # ir inst 35 fin
  addi t5, a3, 0                                                        # ir inst 36 fin
  lw t4, 0(t5)                                                          # ir inst 37 fin
  add t5, t4, a1                                                        # ir inst 38 fin
  sw t5, 0(t6)                                                          # ir inst 39 fin
  li a0, -1
  j .F.linear_search.epilogue                                           # ir inst 40 fin
.F.linear_search.epilogue:
  ret

.globl .F.compute_variance
.F.compute_variance:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.compute_variance._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.compute_variance._1.while.cond.0                                 # ir inst 1 fin
.F.compute_variance._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.compute_variance._2.while.body.0
  j .F.compute_variance._3.while.exit.0                                 # ir inst 5 fin
.F.compute_variance._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  sub t3, t4, a2                                                        # ir inst 9 fin
  mul t4, t3, t3                                                        # ir inst 10 fin
  add t3, t5, t4                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.compute_variance._1.while.cond.0                                 # ir inst 13 fin
.F.compute_variance._3.while.exit.0:
  div t6, t5, a1                                                        # ir inst 14 fin
  mv a0, t6
  j .F.compute_variance.epilogue                                        # ir inst 15 fin
.F.compute_variance.epilogue:
  ret

.globl .F.compute_median
.F.compute_median:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 20,                 range:       24(sp) -       44(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 16(sp)
.F.compute_median._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  addi t1, sp, 24
  mv a0, t1
  call .F.init_performance_counter
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  addi t1, sp, 24
  mv a2, t1
  call .F.quick_sort
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 3 fin
  li t2, 2
  rem t6, a1, t2                                                        # ir inst 4 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 5 fin
  bnez t5, .F.compute_median._1.if.then.0
  j .F.compute_median._2.if.else.0                                      # ir inst 6 fin
.F.compute_median._1.if.then.0:
  mv t6, a1                                                             # ir inst 7 fin
  li t2, 2
  divu t5, t6, t2                                                       # ir inst 8 fin
  addi t6, t5, -1                                                       # ir inst 9 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 10 fin
  lw t6, 0(t5)                                                          # ir inst 11 fin
  mv t5, a1                                                             # ir inst 12 fin
  li t2, 2
  divu t4, t5, t2                                                       # ir inst 13 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  add t5, t6, t4                                                        # ir inst 16 fin
  li t2, 2
  div t6, t5, t2                                                        # ir inst 17 fin
# Phi connections
  j .F.compute_median._3.if.exit.0                                      # ir inst 18 fin
.F.compute_median._2.if.else.0:
  mv t6, a1                                                             # ir inst 19 fin
  li t2, 2
  divu t5, t6, t2                                                       # ir inst 20 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 21 fin
  lw t5, 0(t6)                                                          # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.compute_median._3.if.exit.0                                      # ir inst 23 fin
.F.compute_median._3.if.exit.0:
  mv a0, t6
  j .F.compute_median.epilogue                                          # ir inst 25 fin
.F.compute_median.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 48
  ret

.globl .F.init_matrix
.F.init_matrix:
# spill func args num: 0,             range:    40496(sp) -    40496(sp)
# local var size: 40408,              range:       80(sp) -    40488(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 2 / 12,        range:       56(sp) -       72(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -40496
  add sp, sp, t0
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.init_matrix._0.entry.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 40088
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t4, 0
  j .F.init_matrix._1.array.cond.0                                      # ir inst 5 fin
.F.init_matrix._1.array.cond.0:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 7 fin
  bnez t3, .F.init_matrix._2.array.body.0
  j .F.init_matrix._3.array.exit.0                                      # ir inst 8 fin
.F.init_matrix._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 10 fin
  addi t3, t4, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, t3
  j .F.init_matrix._1.array.cond.0                                      # ir inst 12 fin
.F.init_matrix._3.array.exit.0:
  addi t5, t6, 0                                                        # ir inst 13 fin
# Phi connections
  li t6, 0
  j .F.init_matrix._4.array.cond.1                                      # ir inst 14 fin
.F.init_matrix._4.array.cond.1:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, .F.init_matrix._5.array.body.1
  j .F.init_matrix._6.array.exit.1                                      # ir inst 17 fin
.F.init_matrix._5.array.body.1:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a2, 400
  li t1, 40088
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t4
  j .F.init_matrix._4.array.cond.1                                      # ir inst 21 fin
.F.init_matrix._6.array.exit.1:
  addi t1, sp, 80
  li t6, 40000
  add t6, t1, t6                                                        # ir inst 22 fin
  sw a1, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 80
  li t6, 40004
  add t6, t1, t6                                                        # ir inst 24 fin
  sw a2, 0(t6)                                                          # ir inst 25 fin
# Phi connections
  li t6, 0
  j .F.init_matrix._7.while.cond.0                                      # ir inst 26 fin
.F.init_matrix._7.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 28 fin
  bnez t5, .F.init_matrix._8.while.body.0
  j .F.init_matrix._24.while.exit.0                                     # ir inst 29 fin
.F.init_matrix._8.while.body.0:
# Phi connections
  li t5, 0
  j .F.init_matrix._9.while.cond.1                                      # ir inst 30 fin
.F.init_matrix._9.while.cond.1:
  slt t4, t5, a2                                                        # ir inst 32 fin
  bnez t4, .F.init_matrix._10.while.body.1
  j .F.init_matrix._23.while.exit.1                                     # ir inst 33 fin
.F.init_matrix._10.while.body.1:
  li t2, 0
  xor t0, a3, t2
  sltiu t4, t0, 1                                                       # ir inst 34 fin
  bnez t4, .F.init_matrix._11.if.then.0
  j .F.init_matrix._15.if.else.0                                        # ir inst 35 fin
.F.init_matrix._11.if.then.0:
  addi t1, sp, 80
  addi t4, t1, 0                                                        # ir inst 36 fin
  mv t3, t6                                                             # ir inst 37 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 38 fin
  mv t4, t5                                                             # ir inst 39 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 40 fin
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 41 fin
  bnez t4, .F.init_matrix._12.if.then.1
  j .F.init_matrix._13.if.else.1                                        # ir inst 42 fin
.F.init_matrix._12.if.then.1:
# Phi connections
  li t4, 1
  j .F.init_matrix._14.if.exit.1                                        # ir inst 43 fin
.F.init_matrix._13.if.else.1:
# Phi connections
  li t4, 0
  j .F.init_matrix._14.if.exit.1                                        # ir inst 44 fin
.F.init_matrix._14.if.exit.1:
  sw t4, 0(t3)                                                          # ir inst 46 fin
  j .F.init_matrix._22.if.exit.0                                        # ir inst 47 fin
.F.init_matrix._15.if.else.0:
  li t2, 1
  xor t0, a3, t2
  sltiu t4, t0, 1                                                       # ir inst 48 fin
  bnez t4, .F.init_matrix._16.if.then.2
  j .F.init_matrix._17.if.else.2                                        # ir inst 49 fin
.F.init_matrix._16.if.then.2:
  addi t1, sp, 80
  addi t4, t1, 0                                                        # ir inst 50 fin
  mv t3, t6                                                             # ir inst 51 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 52 fin
  mv t4, t5                                                             # ir inst 53 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 54 fin
  li t2, 17
  mul t4, t6, t2                                                        # ir inst 55 fin
  li t2, 23
  mul s11, t5, t2                                                       # ir inst 56 fin
  add s10, t4, s11                                                      # ir inst 57 fin
  addi t4, s10, 13                                                      # ir inst 58 fin
  li t2, 100
  rem s11, t4, t2                                                       # ir inst 59 fin
  sw s11, 0(t3)                                                         # ir inst 60 fin
  j .F.init_matrix._21.if.exit.2                                        # ir inst 61 fin
.F.init_matrix._17.if.else.2:
  li t2, 2
  xor t0, a3, t2
  sltiu t4, t0, 1                                                       # ir inst 62 fin
  bnez t4, .F.init_matrix._18.if.then.3
  j .F.init_matrix._19.if.else.3                                        # ir inst 63 fin
.F.init_matrix._18.if.then.3:
  addi t1, sp, 80
  addi t4, t1, 0                                                        # ir inst 64 fin
  mv t3, t6                                                             # ir inst 65 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 66 fin
  mv t4, t5                                                             # ir inst 67 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 68 fin
  mul t4, t6, a2                                                        # ir inst 69 fin
  add s11, t4, t5                                                       # ir inst 70 fin
  addi t4, s11, 1                                                       # ir inst 71 fin
  sw t4, 0(t3)                                                          # ir inst 72 fin
  j .F.init_matrix._20.if.exit.3                                        # ir inst 73 fin
.F.init_matrix._19.if.else.3:
  addi t1, sp, 80
  addi t4, t1, 0                                                        # ir inst 74 fin
  mv t3, t6                                                             # ir inst 75 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 76 fin
  mv t4, t5                                                             # ir inst 77 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 78 fin
  mul t4, t6, t6                                                        # ir inst 79 fin
  mul s11, t5, t5                                                       # ir inst 80 fin
  add s10, t4, s11                                                      # ir inst 81 fin
  mul t4, t6, t5                                                        # ir inst 82 fin
  add s11, s10, t4                                                      # ir inst 83 fin
  li t2, 50
  rem t4, s11, t2                                                       # ir inst 84 fin
  sw t4, 0(t3)                                                          # ir inst 85 fin
  j .F.init_matrix._20.if.exit.3                                        # ir inst 86 fin
.F.init_matrix._20.if.exit.3:
  j .F.init_matrix._21.if.exit.2                                        # ir inst 87 fin
.F.init_matrix._21.if.exit.2:
  j .F.init_matrix._22.if.exit.0                                        # ir inst 88 fin
.F.init_matrix._22.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 89 fin
# Phi connections
  mv t5, t4
  j .F.init_matrix._9.while.cond.1                                      # ir inst 90 fin
.F.init_matrix._23.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 91 fin
# Phi connections
  mv t6, t5
  j .F.init_matrix._7.while.cond.0                                      # ir inst 92 fin
.F.init_matrix._24.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 40008
  addi t1, sp, 80
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 93 fin
  j .F.init_matrix.epilogue                                             # ir inst 94 fin
.F.init_matrix.epilogue:
  ld ra, 72(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  li t0, 40496
  add sp, sp, t0
  ret

.globl .F.matrix_multiply
.F.matrix_multiply:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 0(sp)
  sd s7, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s10, 32(sp)
.F.matrix_multiply._0.entry.0:
  li t6, 40004
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t6, 40000
  add t6, a1, t6                                                        # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
  xor t0, t5, t4
  sltu t6, zero, t0                                                     # ir inst 5 fin
  bnez t6, .F.matrix_multiply._1.if.then.0
  j .F.matrix_multiply._2.if.else.0                                     # ir inst 6 fin
.F.matrix_multiply._1.if.then.0:
  li a0, 0
  j .F.matrix_multiply.epilogue                                         # ir inst 7 fin
.F.matrix_multiply._2.if.else.0:
  j .F.matrix_multiply._3.if.exit.0                                     # ir inst 8 fin
.F.matrix_multiply._3.if.exit.0:
  li t6, 40000
  add t6, a2, t6                                                        # ir inst 9 fin
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  sw t4, 0(t6)                                                          # ir inst 12 fin
  li t6, 40004
  add t6, a2, t6                                                        # ir inst 13 fin
  li t5, 40004
  add t5, a1, t5                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  sw t4, 0(t6)                                                          # ir inst 16 fin
# Phi connections
  li t6, 0
  j .F.matrix_multiply._4.while.cond.0                                  # ir inst 17 fin
.F.matrix_multiply._4.while.cond.0:
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 19 fin
  lw t4, 0(t5)                                                          # ir inst 20 fin
  slt t5, t6, t4                                                        # ir inst 21 fin
  bnez t5, .F.matrix_multiply._5.while.body.0
  j .F.matrix_multiply._12.while.exit.0                                 # ir inst 22 fin
.F.matrix_multiply._5.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrix_multiply._6.while.cond.1                                  # ir inst 23 fin
.F.matrix_multiply._6.while.cond.1:
  li t4, 40004
  add t4, a1, t4                                                        # ir inst 25 fin
  lw t3, 0(t4)                                                          # ir inst 26 fin
  slt t4, t5, t3                                                        # ir inst 27 fin
  bnez t4, .F.matrix_multiply._7.while.body.1
  j .F.matrix_multiply._11.while.exit.1                                 # ir inst 28 fin
.F.matrix_multiply._7.while.body.1:
  addi t4, a2, 0                                                        # ir inst 29 fin
  mv t3, t6                                                             # ir inst 30 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 31 fin
  mv t4, t5                                                             # ir inst 32 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 33 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 34 fin
# Phi connections
  li t4, 0
  j .F.matrix_multiply._8.while.cond.2                                  # ir inst 35 fin
.F.matrix_multiply._8.while.cond.2:
  li t3, 40004
  add t3, a0, t3                                                        # ir inst 37 fin
  lw s11, 0(t3)                                                         # ir inst 38 fin
  slt t3, t4, s11                                                       # ir inst 39 fin
  bnez t3, .F.matrix_multiply._9.while.body.2
  j .F.matrix_multiply._10.while.exit.2                                 # ir inst 40 fin
.F.matrix_multiply._9.while.body.2:
  addi t3, a2, 0                                                        # ir inst 41 fin
  mv s11, t6                                                            # ir inst 42 fin
  li t1, 400
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 43 fin
  mv t3, t5                                                             # ir inst 44 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 45 fin
  addi t3, a2, 0                                                        # ir inst 46 fin
  mv s10, t6                                                            # ir inst 47 fin
  li t1, 400
  mul t2, s10, t1
  add s9, t3, t2                                                        # ir inst 48 fin
  mv t3, t5                                                             # ir inst 49 fin
  slli t2, t3, 2
  add s10, s9, t2                                                       # ir inst 50 fin
  lw t3, 0(s10)                                                         # ir inst 51 fin
  addi s10, a0, 0                                                       # ir inst 52 fin
  mv s9, t6                                                             # ir inst 53 fin
  li t1, 400
  mul t2, s9, t1
  add s8, s10, t2                                                       # ir inst 54 fin
  mv s10, t4                                                            # ir inst 55 fin
  slli t2, s10, 2
  add s9, s8, t2                                                        # ir inst 56 fin
  lw s10, 0(s9)                                                         # ir inst 57 fin
  addi s9, a1, 0                                                        # ir inst 58 fin
  mv s8, t4                                                             # ir inst 59 fin
  li t1, 400
  mul t2, s8, t1
  add s7, s9, t2                                                        # ir inst 60 fin
  mv s9, t5                                                             # ir inst 61 fin
  slli t2, s9, 2
  add s8, s7, t2                                                        # ir inst 62 fin
  lw s9, 0(s8)                                                          # ir inst 63 fin
  mul s8, s10, s9                                                       # ir inst 64 fin
  add s10, t3, s8                                                       # ir inst 65 fin
  sw s10, 0(s11)                                                        # ir inst 66 fin
  addi t3, t4, 1                                                        # ir inst 67 fin
# Phi connections
  mv t4, t3
  j .F.matrix_multiply._8.while.cond.2                                  # ir inst 68 fin
.F.matrix_multiply._10.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 69 fin
# Phi connections
  mv t5, t4
  j .F.matrix_multiply._6.while.cond.1                                  # ir inst 70 fin
.F.matrix_multiply._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 71 fin
# Phi connections
  mv t6, t5
  j .F.matrix_multiply._4.while.cond.0                                  # ir inst 72 fin
.F.matrix_multiply._12.while.exit.0:
  li a0, 1
  j .F.matrix_multiply.epilogue                                         # ir inst 73 fin
.F.matrix_multiply.epilogue:
  ld s11, 0(sp)
  ld s7, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.copy_array
.F.copy_array:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.copy_array._0.entry.0:
# Phi connections
  li t6, 0
  j .F.copy_array._1.while.cond.0                                       # ir inst 1 fin
.F.copy_array._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.copy_array._2.while.body.0
  j .F.copy_array._3.while.exit.0                                       # ir inst 4 fin
.F.copy_array._2.while.body.0:
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
  j .F.copy_array._1.while.cond.0                                       # ir inst 12 fin
.F.copy_array._3.while.exit.0:
  j .F.copy_array.epilogue                                              # ir inst 13 fin
.F.copy_array.epilogue:
  ret

.globl .F.is_sorted
.F.is_sorted:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.is_sorted._0.entry.0:
# Phi connections
  li t6, 0
  j .F.is_sorted._1.while.cond.0                                        # ir inst 1 fin
.F.is_sorted._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.is_sorted._2.while.body.0
  j .F.is_sorted._6.while.exit.0                                        # ir inst 5 fin
.F.is_sorted._2.while.body.0:
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
  bnez t4, .F.is_sorted._3.if.then.0
  j .F.is_sorted._4.if.else.0                                           # ir inst 14 fin
.F.is_sorted._3.if.then.0:
  li a0, 0
  j .F.is_sorted.epilogue                                               # ir inst 15 fin
.F.is_sorted._4.if.else.0:
  j .F.is_sorted._5.if.exit.0                                           # ir inst 16 fin
.F.is_sorted._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.is_sorted._1.while.cond.0                                        # ir inst 18 fin
.F.is_sorted._6.while.exit.0:
  li a0, 1
  j .F.is_sorted.epilogue                                               # ir inst 19 fin
.F.is_sorted.epilogue:
  ret

.globl .F.test_large_scale_performance
.F.test_large_scale_performance:
# spill func args num: 0,             range:   480784(sp) -   480784(sp)
# local var size: 480712,             range:       72(sp) -   480784(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -480784
  add sp, sp, t0
  sd s10, 32(sp)
  sd s8, 40(sp)
  sd s9, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.test_large_scale_performance._0.entry.0:
# Start call preparation
  li a0, 21001
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 3 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t1, sp, 72
  addi t6, t1, 4                                                        # ir inst 5 fin
  li t1, 500
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t1, sp, 72
  addi t6, t1, 8                                                        # ir inst 7 fin
  li t1, 1000
  sw t1, 0(t6)                                                          # ir inst 8 fin
  addi t1, sp, 72
  addi t6, t1, 12                                                       # ir inst 9 fin
  li t1, 2000
  sw t1, 0(t6)                                                          # ir inst 10 fin
# Phi connections
  li t6, 0
  j .F.test_large_scale_performance._1.while.cond.0                     # ir inst 11 fin
.F.test_large_scale_performance._1.while.cond.0:
  li t2, 4
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.test_large_scale_performance._2.while.body.0
  j .F.test_large_scale_performance._18.while.exit.0                    # ir inst 14 fin
.F.test_large_scale_performance._2.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  addi t1, sp, 72
  add t4, t1, t2                                                        # ir inst 16 fin
  lw t5, 0(t4)                                                          # ir inst 17 fin
  li t2, 100
  mul t4, t6, t2                                                        # ir inst 18 fin
  li t1, 21000
  add t3, t1, t4                                                        # ir inst 19 fin
  addi t4, t3, 10                                                       # ir inst 20 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 21 fin
# Phi connections
  li t4, 0
  j .F.test_large_scale_performance._3.while.cond.1                     # ir inst 22 fin
.F.test_large_scale_performance._3.while.cond.1:
  li t2, 8
  slt t3, t4, t2                                                        # ir inst 24 fin
  bnez t3, .F.test_large_scale_performance._4.while.body.1
  j .F.test_large_scale_performance._17.while.exit.1                    # ir inst 25 fin
.F.test_large_scale_performance._4.while.body.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t5
  mv a1, t4
  addi t1, sp, 88
  mv a0, t1
  call .F.init_dataset_pattern
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 27 fin
  li t1, 40112
  add t1, sp, t1
  addi t3, t1, 0                                                        # ir inst 29 fin
# Phi connections
  li s11, 0
  j .F.test_large_scale_performance._5.array.cond.0                     # ir inst 30 fin
.F.test_large_scale_performance._5.array.cond.0:
  li t2, 10000
  slt s10, s11, t2                                                      # ir inst 32 fin
  bnez s10, .F.test_large_scale_performance._6.array.body.0
  j .F.test_large_scale_performance._7.array.exit.0                     # ir inst 33 fin
.F.test_large_scale_performance._6.array.body.0:
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 34 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 35 fin
  addi s10, s11, 1                                                      # ir inst 36 fin
# Phi connections
  mv s11, s10
  j .F.test_large_scale_performance._5.array.cond.0                     # ir inst 37 fin
.F.test_large_scale_performance._7.array.exit.0:
  addi t1, sp, 88
  addi t3, t1, 0                                                        # ir inst 38 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  li t1, 40112
  add t1, sp, t1
  mv a1, t1
  mv a0, t3
  call .F.copy_array
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 80112
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 41 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 80112
  add t1, sp, t1
  mv a2, t1
  mv a1, t5
  li t1, 40112
  add t1, sp, t1
  mv a0, t1
  call .F.bubble_sort
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 42 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t5
  li t1, 40112
  add t1, sp, t1
  mv a0, t1
  call .F.is_sorted
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 43 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 44 fin
  bnez s11, .F.test_large_scale_performance._8.if.then.0
  j .F.test_large_scale_performance._9.if.else.0                        # ir inst 45 fin
.F.test_large_scale_performance._8.if.then.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 21901
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 46 fin
  j .F.test_large_scale_performance._10.if.exit.0                       # ir inst 47 fin
.F.test_large_scale_performance._9.if.else.0:
  j .F.test_large_scale_performance._10.if.exit.0                       # ir inst 48 fin
.F.test_large_scale_performance._10.if.exit.0:
  addi t1, sp, 88
  addi t3, t1, 0                                                        # ir inst 49 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  li t1, 40112
  add t1, sp, t1
  mv a1, t1
  mv a0, t3
  call .F.copy_array
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 50 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 80132
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 52 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 80132
  add t1, sp, t1
  mv a2, t1
  mv a1, t5
  li t1, 40112
  add t1, sp, t1
  mv a0, t1
  call .F.quick_sort
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 53 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t5
  li t1, 40112
  add t1, sp, t1
  mv a0, t1
  call .F.is_sorted
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 54 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 55 fin
  bnez s11, .F.test_large_scale_performance._11.if.then.1
  j .F.test_large_scale_performance._12.if.else.1                       # ir inst 56 fin
.F.test_large_scale_performance._11.if.then.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 21902
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 57 fin
  j .F.test_large_scale_performance._13.if.exit.1                       # ir inst 58 fin
.F.test_large_scale_performance._12.if.else.1:
  j .F.test_large_scale_performance._13.if.exit.1                       # ir inst 59 fin
.F.test_large_scale_performance._13.if.exit.1:
  addi t1, sp, 88
  addi t3, t1, 0                                                        # ir inst 60 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  li t1, 40112
  add t1, sp, t1
  mv a1, t1
  mv a0, t3
  call .F.copy_array
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 61 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 80152
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 63 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 80152
  add t1, sp, t1
  mv a2, t1
  mv a1, t5
  li t1, 40112
  add t1, sp, t1
  mv a0, t1
  call .F.merge_sort
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 64 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t5
  li t1, 40112
  add t1, sp, t1
  mv a0, t1
  call .F.is_sorted
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 65 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 66 fin
  bnez s11, .F.test_large_scale_performance._14.if.then.2
  j .F.test_large_scale_performance._15.if.else.2                       # ir inst 67 fin
.F.test_large_scale_performance._14.if.then.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 21903
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 68 fin
  j .F.test_large_scale_performance._16.if.exit.2                       # ir inst 69 fin
.F.test_large_scale_performance._15.if.else.2:
  j .F.test_large_scale_performance._16.if.exit.2                       # ir inst 70 fin
.F.test_large_scale_performance._16.if.exit.2:
  li t1, 80112
  add t1, sp, t1
  addi t3, t1, 4                                                        # ir inst 71 fin
  lw s11, 0(t3)                                                         # ir inst 72 fin
  li t2, 100
  div t3, s11, t2                                                       # ir inst 73 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 74 fin
  li t1, 80132
  add t1, sp, t1
  addi t3, t1, 4                                                        # ir inst 75 fin
  lw s11, 0(t3)                                                         # ir inst 76 fin
  li t2, 100
  div t3, s11, t2                                                       # ir inst 77 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 78 fin
  li t1, 80152
  add t1, sp, t1
  addi t3, t1, 4                                                        # ir inst 79 fin
  lw s11, 0(t3)                                                         # ir inst 80 fin
  li t2, 100
  div t3, s11, t2                                                       # ir inst 81 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 82 fin
  addi t3, t4, 1                                                        # ir inst 83 fin
# Phi connections
  mv t4, t3
  j .F.test_large_scale_performance._3.while.cond.1                     # ir inst 84 fin
.F.test_large_scale_performance._17.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 85 fin
# Phi connections
  mv t6, t5
  j .F.test_large_scale_performance._1.while.cond.0                     # ir inst 86 fin
.F.test_large_scale_performance._18.while.exit.0:
# Start call preparation
  li a2, 5000
  li a1, 0
  li t1, 80172
  add t1, sp, t1
  mv a0, t1
  call .F.init_dataset_pattern
# ir inst 88 fin
  li t1, 120196
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 90 fin
# Phi connections
  li t5, 0
  j .F.test_large_scale_performance._19.array.cond.1                    # ir inst 91 fin
.F.test_large_scale_performance._19.array.cond.1:
  li t2, 10000
  slt t4, t5, t2                                                        # ir inst 93 fin
  bnez t4, .F.test_large_scale_performance._20.array.body.1
  j .F.test_large_scale_performance._21.array.exit.1                    # ir inst 94 fin
.F.test_large_scale_performance._20.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 95 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 96 fin
  addi t4, t5, 1                                                        # ir inst 97 fin
# Phi connections
  mv t5, t4
  j .F.test_large_scale_performance._19.array.cond.1                    # ir inst 98 fin
.F.test_large_scale_performance._21.array.exit.1:
  li t1, 80172
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 99 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 5000
  li t1, 120196
  add t1, sp, t1
  mv a1, t1
  mv a0, t6
  call .F.copy_array
  ld t6, 0(sp)
# ir inst 100 fin
# Start call preparation
  li t1, 160196
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
# ir inst 102 fin
# Start call preparation
  li t1, 160196
  add t1, sp, t1
  mv a2, t1
  li a1, 5000
  li t1, 120196
  add t1, sp, t1
  mv a0, t1
  call .F.quick_sort
# ir inst 103 fin
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.test_large_scale_performance._22.while.cond.2                    # ir inst 104 fin
.F.test_large_scale_performance._22.while.cond.2:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 109 fin
  bnez s11, .F.test_large_scale_performance._23.while.body.2
  j .F.test_large_scale_performance._30.while.exit.2                    # ir inst 110 fin
.F.test_large_scale_performance._23.while.body.2:
  li t2, 73
  mul s11, t3, t2                                                       # ir inst 111 fin
  addi s10, s11, 29                                                     # ir inst 112 fin
  li t2, 100000
  rem s11, s10, t2                                                      # ir inst 113 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 160216
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 115 fin
  li t1, 80172
  add t1, sp, t1
  addi s10, t1, 0                                                       # ir inst 116 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 160216
  add t1, sp, t1
  mv a3, t1
  mv a2, s11
  li a1, 5000
  mv a0, s10
  call .F.linear_search
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 117 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 160236
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 119 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 160236
  add t1, sp, t1
  mv a3, t1
  mv a2, s11
  li a1, 5000
  li t1, 120196
  add t1, sp, t1
  mv a0, t1
  call .F.binary_search
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 120 fin
  li t2, -1
  xor t0, s9, t2
  sltu s11, zero, t0                                                    # ir inst 121 fin
  bnez s11, .F.test_large_scale_performance._24.lazy.then.0
  j .F.test_large_scale_performance._25.lazy.else.0                     # ir inst 122 fin
.F.test_large_scale_performance._24.lazy.then.0:
  li t2, -1
  xor t0, s10, t2
  sltu s11, zero, t0                                                    # ir inst 123 fin
# Phi connections
  j .F.test_large_scale_performance._26.lazy.exit.0                     # ir inst 124 fin
.F.test_large_scale_performance._25.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.test_large_scale_performance._26.lazy.exit.0                     # ir inst 125 fin
.F.test_large_scale_performance._26.lazy.exit.0:
  bnez s11, .F.test_large_scale_performance._27.if.then.3
  j .F.test_large_scale_performance._28.if.else.3                       # ir inst 127 fin
.F.test_large_scale_performance._27.if.then.3:
  addi s11, t5, 1                                                       # ir inst 128 fin
# Phi connections
  j .F.test_large_scale_performance._29.if.exit.3                       # ir inst 129 fin
.F.test_large_scale_performance._28.if.else.3:
# Phi connections
  mv s11, t5
  j .F.test_large_scale_performance._29.if.exit.3                       # ir inst 130 fin
.F.test_large_scale_performance._29.if.exit.3:
  li t1, 160216
  add t1, sp, t1
  addi s10, t1, 0                                                       # ir inst 132 fin
  lw s9, 0(s10)                                                         # ir inst 133 fin
  add s10, t4, s9                                                       # ir inst 134 fin
  li t1, 160236
  add t1, sp, t1
  addi s9, t1, 0                                                        # ir inst 135 fin
  lw s8, 0(s9)                                                          # ir inst 136 fin
  add s9, t6, s8                                                        # ir inst 137 fin
  addi s8, t3, 1                                                        # ir inst 138 fin
# Phi connections
  mv t3, s8
  mv t4, s10
  mv t5, s11
  mv t6, s9
  j .F.test_large_scale_performance._22.while.cond.2                    # ir inst 139 fin
.F.test_large_scale_performance._30.while.exit.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 140 fin
  li t2, 1000
  div t5, t4, t2                                                        # ir inst 141 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 142 fin
  li t2, 1000
  div t5, t6, t2                                                        # ir inst 143 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 144 fin
# Start call preparation
  li a2, 300
  li a1, 1
  li t1, 160256
  add t1, sp, t1
  mv a0, t1
  call .F.init_dataset_pattern
# ir inst 146 fin
  li t1, 160256
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 147 fin
  li t1, 160256
  add t1, sp, t1
  li t5, 40020
  add t5, t1, t5                                                        # ir inst 148 fin
  lw t4, 0(t5)                                                          # ir inst 149 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a2, t4
  li a1, 300
  mv a0, t6
  call .F.compute_variance
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 150 fin
  li t1, 200280
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 152 fin
# Phi connections
  li t4, 0
  j .F.test_large_scale_performance._31.array.cond.2                    # ir inst 153 fin
.F.test_large_scale_performance._31.array.cond.2:
  li t2, 10000
  slt t3, t4, t2                                                        # ir inst 155 fin
  bnez t3, .F.test_large_scale_performance._32.array.body.2
  j .F.test_large_scale_performance._33.array.exit.2                    # ir inst 156 fin
.F.test_large_scale_performance._32.array.body.2:
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 157 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 158 fin
  addi t3, t4, 1                                                        # ir inst 159 fin
# Phi connections
  mv t4, t3
  j .F.test_large_scale_performance._31.array.cond.2                    # ir inst 160 fin
.F.test_large_scale_performance._33.array.exit.2:
  li t1, 160256
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 161 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a2, 300
  li t1, 200280
  add t1, sp, t1
  mv a1, t1
  mv a0, t6
  call .F.copy_array
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 162 fin
# Start call preparation
  sd t5, 0(sp)
  li a1, 300
  li t1, 200280
  add t1, sp, t1
  mv a0, t1
  call .F.compute_median
  mv t6, a0
  ld t5, 0(sp)
# ir inst 163 fin
  li t1, 160256
  add t1, sp, t1
  li t4, 40020
  add t4, t1, t4                                                        # ir inst 164 fin
  lw t3, 0(t4)                                                          # ir inst 165 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 166 fin
  li t2, 1000
  div t4, t5, t2                                                        # ir inst 167 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 168 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 169 fin
# Start call preparation
  li a3, 1
  li a2, 50
  li a1, 50
  li t1, 240280
  add t1, sp, t1
  mv a0, t1
  call .F.init_matrix
# ir inst 171 fin
# Start call preparation
  li a3, 2
  li a2, 50
  li a1, 50
  li t1, 280288
  add t1, sp, t1
  mv a0, t1
  call .F.init_matrix
# ir inst 173 fin
  li t1, 320296
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 175 fin
  li t1, 360304
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 177 fin
# Phi connections
  li t4, 0
  j .F.test_large_scale_performance._34.array.cond.3                    # ir inst 178 fin
.F.test_large_scale_performance._34.array.cond.3:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 180 fin
  bnez t3, .F.test_large_scale_performance._35.array.body.3
  j .F.test_large_scale_performance._36.array.exit.3                    # ir inst 181 fin
.F.test_large_scale_performance._35.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 182 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 183 fin
  addi t3, t4, 1                                                        # ir inst 184 fin
# Phi connections
  mv t4, t3
  j .F.test_large_scale_performance._34.array.cond.3                    # ir inst 185 fin
.F.test_large_scale_performance._36.array.exit.3:
  addi t5, t6, 0                                                        # ir inst 186 fin
# Phi connections
  li t6, 0
  j .F.test_large_scale_performance._37.array.cond.4                    # ir inst 187 fin
.F.test_large_scale_performance._37.array.cond.4:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 189 fin
  bnez t4, .F.test_large_scale_performance._38.array.body.4
  j .F.test_large_scale_performance._39.array.exit.4                    # ir inst 190 fin
.F.test_large_scale_performance._38.array.body.4:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 191 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 400
  li t1, 360304
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 192 fin
  addi t4, t6, 1                                                        # ir inst 193 fin
# Phi connections
  mv t6, t4
  j .F.test_large_scale_performance._37.array.cond.4                    # ir inst 194 fin
.F.test_large_scale_performance._39.array.exit.4:
  li t1, 320296
  add t1, sp, t1
  li t6, 40000
  add t6, t1, t6                                                        # ir inst 195 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 196 fin
  li t1, 320296
  add t1, sp, t1
  li t6, 40004
  add t6, t1, t6                                                        # ir inst 197 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 198 fin
# Start call preparation
  li t1, 320296
  add t1, sp, t1
  mv a2, t1
  li t1, 280288
  add t1, sp, t1
  mv a1, t1
  li t1, 240280
  add t1, sp, t1
  mv a0, t1
  call .F.matrix_multiply
  mv t6, a0
# ir inst 199 fin
  bnez t6, .F.test_large_scale_performance._40.if.then.4
  j .F.test_large_scale_performance._47.if.else.4                       # ir inst 200 fin
.F.test_large_scale_performance._40.if.then.4:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_large_scale_performance._41.while.cond.3                    # ir inst 201 fin
.F.test_large_scale_performance._41.while.cond.3:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 204 fin
  bnez t4, .F.test_large_scale_performance._42.while.body.3
  j .F.test_large_scale_performance._46.while.exit.3                    # ir inst 205 fin
.F.test_large_scale_performance._42.while.body.3:
# Phi connections
  li t3, 0
  mv t4, t6
  j .F.test_large_scale_performance._43.while.cond.4                    # ir inst 206 fin
.F.test_large_scale_performance._43.while.cond.4:
  li t2, 50
  slt s11, t3, t2                                                       # ir inst 209 fin
  bnez s11, .F.test_large_scale_performance._44.while.body.4
  j .F.test_large_scale_performance._45.while.exit.4                    # ir inst 210 fin
.F.test_large_scale_performance._44.while.body.4:
  li t1, 320296
  add t1, sp, t1
  addi s11, t1, 0                                                       # ir inst 211 fin
  mv s10, t5                                                            # ir inst 212 fin
  li t1, 400
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 213 fin
  mv s11, t3                                                            # ir inst 214 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 215 fin
  lw s11, 0(s10)                                                        # ir inst 216 fin
  add s10, t4, s11                                                      # ir inst 217 fin
  li t2, 1000000000
  and s11, s10, t2                                                      # ir inst 218 fin
  addi s10, t3, 1                                                       # ir inst 219 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.test_large_scale_performance._43.while.cond.4                    # ir inst 220 fin
.F.test_large_scale_performance._45.while.exit.4:
  addi t3, t5, 1                                                        # ir inst 221 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.test_large_scale_performance._41.while.cond.3                    # ir inst 222 fin
.F.test_large_scale_performance._46.while.exit.3:
  li t2, 1000000000
  rem t5, t6, t2                                                        # ir inst 223 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 224 fin
  j .F.test_large_scale_performance._48.if.exit.4                       # ir inst 225 fin
.F.test_large_scale_performance._47.if.else.4:
  j .F.test_large_scale_performance._48.if.exit.4                       # ir inst 226 fin
.F.test_large_scale_performance._48.if.exit.4:
# Start call preparation
  li t1, 360704
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
# ir inst 228 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_large_scale_performance._49.while.cond.5                    # ir inst 229 fin
.F.test_large_scale_performance._49.while.cond.5:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 232 fin
  bnez t4, .F.test_large_scale_performance._50.while.body.5
  j .F.test_large_scale_performance._51.while.exit.5                    # ir inst 233 fin
.F.test_large_scale_performance._50.while.body.5:
  li t1, 80172
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 234 fin
  mv t3, t6                                                             # ir inst 235 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 236 fin
  lw t4, 0(s11)                                                         # ir inst 237 fin
  add t3, t5, t4                                                        # ir inst 238 fin
  li t1, 360704
  add t1, sp, t1
  addi t4, t1, 12                                                       # ir inst 239 fin
  li t1, 360704
  add t1, sp, t1
  addi s11, t1, 12                                                      # ir inst 240 fin
  lw s10, 0(s11)                                                        # ir inst 241 fin
  addi s11, s10, 1                                                      # ir inst 242 fin
  sw s11, 0(t4)                                                         # ir inst 243 fin
  addi t4, t6, 1                                                        # ir inst 244 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.test_large_scale_performance._49.while.cond.5                    # ir inst 245 fin
.F.test_large_scale_performance._51.while.exit.5:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.test_large_scale_performance._52.while.cond.6                    # ir inst 246 fin
.F.test_large_scale_performance._52.while.cond.6:
  li t2, 5000
  slt t3, t6, t2                                                        # ir inst 249 fin
  bnez t3, .F.test_large_scale_performance._53.while.body.6
  j .F.test_large_scale_performance._54.while.exit.6                    # ir inst 250 fin
.F.test_large_scale_performance._53.while.body.6:
  li t2, 11241
  mul t3, t6, t2                                                        # ir inst 251 fin
  li t2, 12345
  add s11, t3, t2                                                       # ir inst 252 fin
  li t2, 5000
  rem t3, s11, t2                                                       # ir inst 253 fin
  li t1, 80172
  add t1, sp, t1
  addi s11, t1, 0                                                       # ir inst 254 fin
  mv s10, t3                                                            # ir inst 255 fin
  slli t2, s10, 2
  add t3, s11, t2                                                       # ir inst 256 fin
  lw s11, 0(t3)                                                         # ir inst 257 fin
  add t3, t4, s11                                                       # ir inst 258 fin
  li t1, 360704
  add t1, sp, t1
  addi s11, t1, 12                                                      # ir inst 259 fin
  li t1, 360704
  add t1, sp, t1
  addi s10, t1, 12                                                      # ir inst 260 fin
  lw s9, 0(s10)                                                         # ir inst 261 fin
  addi s10, s9, 1                                                       # ir inst 262 fin
  sw s10, 0(s11)                                                        # ir inst 263 fin
  addi s11, t6, 1                                                       # ir inst 264 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.test_large_scale_performance._52.while.cond.6                    # ir inst 265 fin
.F.test_large_scale_performance._54.while.exit.6:
# Phi connections
  li t3, 0
  li t6, 0
  j .F.test_large_scale_performance._55.while.cond.7                    # ir inst 266 fin
.F.test_large_scale_performance._55.while.cond.7:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 269 fin
  bnez s11, .F.test_large_scale_performance._56.while.body.7
  j .F.test_large_scale_performance._57.while.exit.7                    # ir inst 270 fin
.F.test_large_scale_performance._56.while.body.7:
  li t2, 5
  mul s11, t3, t2                                                       # ir inst 271 fin
  li t2, 5000
  rem s10, s11, t2                                                      # ir inst 272 fin
  li t1, 80172
  add t1, sp, t1
  addi s11, t1, 0                                                       # ir inst 273 fin
  mv s9, s10                                                            # ir inst 274 fin
  slli t2, s9, 2
  add s10, s11, t2                                                      # ir inst 275 fin
  lw s11, 0(s10)                                                        # ir inst 276 fin
  add s10, t6, s11                                                      # ir inst 277 fin
  li t1, 360704
  add t1, sp, t1
  addi s11, t1, 12                                                      # ir inst 278 fin
  li t1, 360704
  add t1, sp, t1
  addi s9, t1, 12                                                       # ir inst 279 fin
  lw s8, 0(s9)                                                          # ir inst 280 fin
  addi s9, s8, 1                                                        # ir inst 281 fin
  sw s9, 0(s11)                                                         # ir inst 282 fin
  addi s11, t3, 1                                                       # ir inst 283 fin
# Phi connections
  mv t3, s11
  mv t6, s10
  j .F.test_large_scale_performance._55.while.cond.7                    # ir inst 284 fin
.F.test_large_scale_performance._57.while.exit.7:
  li t2, 1000
  div t3, t5, t2                                                        # ir inst 285 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 286 fin
  li t2, 1000
  div t5, t4, t2                                                        # ir inst 287 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 288 fin
  li t2, 100
  div t5, t6, t2                                                        # ir inst 289 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 290 fin
  li t1, 360704
  add t1, sp, t1
  addi t6, t1, 12                                                       # ir inst 291 fin
  lw t5, 0(t6)                                                          # ir inst 292 fin
  li t2, 1000
  div t6, t5, t2                                                        # ir inst 293 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 294 fin
  li t1, 360724
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 296 fin
# Phi connections
  li t5, 0
  j .F.test_large_scale_performance._58.array.cond.5                    # ir inst 297 fin
.F.test_large_scale_performance._58.array.cond.5:
  li t2, 10000
  slt t4, t5, t2                                                        # ir inst 299 fin
  bnez t4, .F.test_large_scale_performance._59.array.body.5
  j .F.test_large_scale_performance._60.array.exit.5                    # ir inst 300 fin
.F.test_large_scale_performance._59.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 301 fin
  li t1, 42
  sw t1, 0(t4)                                                          # ir inst 302 fin
  addi t4, t5, 1                                                        # ir inst 303 fin
# Phi connections
  mv t5, t4
  j .F.test_large_scale_performance._58.array.cond.5                    # ir inst 304 fin
.F.test_large_scale_performance._60.array.exit.5:
# Start call preparation
  li t1, 400724
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
# ir inst 306 fin
# Start call preparation
  li t1, 400724
  add t1, sp, t1
  mv a2, t1
  li a1, 1000
  li t1, 360724
  add t1, sp, t1
  mv a0, t1
  call .F.quick_sort
# ir inst 307 fin
  li t1, 400724
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 308 fin
  lw t5, 0(t6)                                                          # ir inst 309 fin
  li t2, 100
  div t6, t5, t2                                                        # ir inst 310 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 311 fin
  li t1, 400744
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 313 fin
# Phi connections
  li t5, 0
  j .F.test_large_scale_performance._61.array.cond.6                    # ir inst 314 fin
.F.test_large_scale_performance._61.array.cond.6:
  li t2, 10000
  slt t4, t5, t2                                                        # ir inst 316 fin
  bnez t4, .F.test_large_scale_performance._62.array.body.6
  j .F.test_large_scale_performance._63.array.exit.6                    # ir inst 317 fin
.F.test_large_scale_performance._62.array.body.6:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 318 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 319 fin
  addi t4, t5, 1                                                        # ir inst 320 fin
# Phi connections
  mv t5, t4
  j .F.test_large_scale_performance._61.array.cond.6                    # ir inst 321 fin
.F.test_large_scale_performance._63.array.exit.6:
# Phi connections
  li t6, 0
  j .F.test_large_scale_performance._64.while.cond.8                    # ir inst 322 fin
.F.test_large_scale_performance._64.while.cond.8:
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 324 fin
  bnez t5, .F.test_large_scale_performance._65.while.body.8
  j .F.test_large_scale_performance._69.while.exit.8                    # ir inst 325 fin
.F.test_large_scale_performance._65.while.body.8:
  mv t5, t6                                                             # ir inst 326 fin
  slli t2, t5, 2
  li t1, 400744
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 327 fin
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 328 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 329 fin
  bnez t3, .F.test_large_scale_performance._66.if.then.5
  j .F.test_large_scale_performance._67.if.else.5                       # ir inst 330 fin
.F.test_large_scale_performance._66.if.then.5:
# Phi connections
  li t5, 1
  j .F.test_large_scale_performance._68.if.exit.5                       # ir inst 331 fin
.F.test_large_scale_performance._67.if.else.5:
# Phi connections
  li t5, 2
  j .F.test_large_scale_performance._68.if.exit.5                       # ir inst 332 fin
.F.test_large_scale_performance._68.if.exit.5:
  sw t5, 0(t4)                                                          # ir inst 334 fin
  addi t5, t6, 1                                                        # ir inst 335 fin
# Phi connections
  mv t6, t5
  j .F.test_large_scale_performance._64.while.cond.8                    # ir inst 336 fin
.F.test_large_scale_performance._69.while.exit.8:
# Start call preparation
  li t1, 440744
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
# ir inst 338 fin
# Start call preparation
  li t1, 440744
  add t1, sp, t1
  mv a2, t1
  li a1, 1000
  li t1, 400744
  add t1, sp, t1
  mv a0, t1
  call .F.merge_sort
# ir inst 339 fin
  li t1, 440744
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 340 fin
  lw t5, 0(t6)                                                          # ir inst 341 fin
  li t2, 100
  div t6, t5, t2                                                        # ir inst 342 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 343 fin
  li t1, 440764
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 345 fin
# Phi connections
  li t5, 0
  j .F.test_large_scale_performance._70.array.cond.7                    # ir inst 346 fin
.F.test_large_scale_performance._70.array.cond.7:
  li t2, 10000
  slt t4, t5, t2                                                        # ir inst 348 fin
  bnez t4, .F.test_large_scale_performance._71.array.body.7
  j .F.test_large_scale_performance._72.array.exit.7                    # ir inst 349 fin
.F.test_large_scale_performance._71.array.body.7:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 350 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 351 fin
  addi t4, t5, 1                                                        # ir inst 352 fin
# Phi connections
  mv t5, t4
  j .F.test_large_scale_performance._70.array.cond.7                    # ir inst 353 fin
.F.test_large_scale_performance._72.array.exit.7:
  li t1, 440764
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 354 fin
  li t1, 123
  sw t1, 0(t6)                                                          # ir inst 355 fin
# Start call preparation
  li t1, 480764
  add t1, sp, t1
  mv a0, t1
  call .F.init_performance_counter
# ir inst 357 fin
# Start call preparation
  li t1, 480764
  add t1, sp, t1
  mv a2, t1
  li a1, 1
  li t1, 440764
  add t1, sp, t1
  mv a0, t1
  call .F.heap_sort
# ir inst 358 fin
  li t1, 440764
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 359 fin
  lw t5, 0(t6)                                                          # ir inst 360 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 361 fin
# Start call preparation
  li a0, 21999
  call printlnInt
# ir inst 362 fin
  j .F.test_large_scale_performance.epilogue                            # ir inst 363 fin
.F.test_large_scale_performance.epilogue:
  ld ra, 64(sp)
  ld s10, 32(sp)
  ld s8, 40(sp)
  ld s9, 48(sp)
  ld s11, 56(sp)
  li t0, 480784
  add sp, sp, t0
  ret

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
  call .F.test_large_scale_performance
# ir inst 1 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 2 fin
  j main.epilogue                                                       # ir inst 3 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret
