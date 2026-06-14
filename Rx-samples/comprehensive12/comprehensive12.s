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

.globl .F._9YlBKTdVw0B_new
.F._9YlBKTdVw0B_new:
# spill func args num: 0,             range:     1040(sp) -     1040(sp)
# local var size: 1000,               range:       40(sp) -     1040(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1040
  sd ra, 32(sp)
.F._9YlBKTdVw0B_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._1.array.cond.0                                 # ir inst 3 fin
.F._9YlBKTdVw0B_new._1.array.cond.0:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F._9YlBKTdVw0B_new._2.array.body.0
  j .F._9YlBKTdVw0B_new._3.array.exit.0                                 # ir inst 6 fin
.F._9YlBKTdVw0B_new._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._1.array.cond.0                                 # ir inst 10 fin
.F._9YlBKTdVw0B_new._3.array.exit.0:
  li t6, 8000
  add t6, a0, t6                                                        # ir inst 11 fin
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._4.array.cond.1                                 # ir inst 13 fin
.F._9YlBKTdVw0B_new._4.array.cond.1:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F._9YlBKTdVw0B_new._5.array.body.1
  j .F._9YlBKTdVw0B_new._6.array.exit.1                                 # ir inst 16 fin
.F._9YlBKTdVw0B_new._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._4.array.cond.1                                 # ir inst 20 fin
.F._9YlBKTdVw0B_new._6.array.exit.1:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 22 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 24 fin
  li t6, 16008
  add t6, a0, t6                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 26 fin
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 28 fin
  li t6, 16016
  add t6, a0, t6                                                        # ir inst 29 fin
  addi t5, t6, 0                                                        # ir inst 30 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._7.array.cond.2                                 # ir inst 31 fin
.F._9YlBKTdVw0B_new._7.array.cond.2:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 33 fin
  bnez t4, .F._9YlBKTdVw0B_new._8.array.body.2
  j .F._9YlBKTdVw0B_new._9.array.exit.2                                 # ir inst 34 fin
.F._9YlBKTdVw0B_new._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 35 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 36 fin
  addi t4, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._7.array.cond.2                                 # ir inst 38 fin
.F._9YlBKTdVw0B_new._9.array.exit.2:
  li t6, 24016
  add t6, a0, t6                                                        # ir inst 39 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 40 fin
  li t6, 24020
  add t6, a0, t6                                                        # ir inst 41 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t4, 0
  j .F._9YlBKTdVw0B_new._10.array.cond.3                                # ir inst 44 fin
.F._9YlBKTdVw0B_new._10.array.cond.3:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 46 fin
  bnez t3, .F._9YlBKTdVw0B_new._11.array.body.3
  j .F._9YlBKTdVw0B_new._12.array.exit.3                                # ir inst 47 fin
.F._9YlBKTdVw0B_new._11.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 48 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 49 fin
  addi t3, t4, 1                                                        # ir inst 50 fin
# Phi connections
  mv t4, t3
  j .F._9YlBKTdVw0B_new._10.array.cond.3                                # ir inst 51 fin
.F._9YlBKTdVw0B_new._12.array.exit.3:
  addi t5, t6, 0                                                        # ir inst 52 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._13.array.cond.4                                # ir inst 53 fin
.F._9YlBKTdVw0B_new._13.array.cond.4:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 55 fin
  bnez t4, .F._9YlBKTdVw0B_new._14.array.body.4
  j .F._9YlBKTdVw0B_new._15.array.exit.4                                # ir inst 56 fin
.F._9YlBKTdVw0B_new._14.array.body.4:
  li t1, 800
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 57 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 800
  addi t1, sp, 40
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 58 fin
  addi t4, t6, 1                                                        # ir inst 59 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._13.array.cond.4                                # ir inst 60 fin
.F._9YlBKTdVw0B_new._15.array.exit.4:
  li t6, 32020
  add t6, a0, t6                                                        # ir inst 61 fin
  addi t5, t6, 0                                                        # ir inst 62 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._16.array.cond.5                                # ir inst 63 fin
.F._9YlBKTdVw0B_new._16.array.cond.5:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 65 fin
  bnez t4, .F._9YlBKTdVw0B_new._17.array.body.5
  j .F._9YlBKTdVw0B_new._18.array.exit.5                                # ir inst 66 fin
.F._9YlBKTdVw0B_new._17.array.body.5:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 67 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 68 fin
  addi t4, t6, 1                                                        # ir inst 69 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._16.array.cond.5                                # ir inst 70 fin
.F._9YlBKTdVw0B_new._18.array.exit.5:
  li t6, 32060
  add t6, a0, t6                                                        # ir inst 71 fin
  addi t5, t6, 0                                                        # ir inst 72 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._19.array.cond.6                                # ir inst 73 fin
.F._9YlBKTdVw0B_new._19.array.cond.6:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 75 fin
  bnez t4, .F._9YlBKTdVw0B_new._20.array.body.6
  j .F._9YlBKTdVw0B_new._21.array.exit.6                                # ir inst 76 fin
.F._9YlBKTdVw0B_new._20.array.body.6:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 77 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 78 fin
  addi t4, t6, 1                                                        # ir inst 79 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._19.array.cond.6                                # ir inst 80 fin
.F._9YlBKTdVw0B_new._21.array.exit.6:
  li t6, 32460
  add t6, a0, t6                                                        # ir inst 81 fin
  addi t1, sp, 840
  addi t5, t1, 0                                                        # ir inst 83 fin
# Phi connections
  li t4, 0
  j .F._9YlBKTdVw0B_new._22.array.cond.7                                # ir inst 84 fin
.F._9YlBKTdVw0B_new._22.array.cond.7:
  li t2, 50
  slt t3, t4, t2                                                        # ir inst 86 fin
  bnez t3, .F._9YlBKTdVw0B_new._23.array.body.7
  j .F._9YlBKTdVw0B_new._24.array.exit.7                                # ir inst 87 fin
.F._9YlBKTdVw0B_new._23.array.body.7:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 88 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 89 fin
  addi t3, t4, 1                                                        # ir inst 90 fin
# Phi connections
  mv t4, t3
  j .F._9YlBKTdVw0B_new._22.array.cond.7                                # ir inst 91 fin
.F._9YlBKTdVw0B_new._24.array.exit.7:
  addi t5, t6, 0                                                        # ir inst 92 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._25.array.cond.8                                # ir inst 93 fin
.F._9YlBKTdVw0B_new._25.array.cond.8:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 95 fin
  bnez t4, .F._9YlBKTdVw0B_new._26.array.body.8
  j .F._9YlBKTdVw0B_new._27.array.exit.8                                # ir inst 96 fin
.F._9YlBKTdVw0B_new._26.array.body.8:
  li t1, 200
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 97 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 200
  addi t1, sp, 840
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 98 fin
  addi t4, t6, 1                                                        # ir inst 99 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._25.array.cond.8                                # ir inst 100 fin
.F._9YlBKTdVw0B_new._27.array.exit.8:
  li t6, 52460
  add t6, a0, t6                                                        # ir inst 101 fin
  addi t5, t6, 0                                                        # ir inst 102 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._28.array.cond.9                                # ir inst 103 fin
.F._9YlBKTdVw0B_new._28.array.cond.9:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 105 fin
  bnez t4, .F._9YlBKTdVw0B_new._29.array.body.9
  j .F._9YlBKTdVw0B_new._30.array.exit.9                                # ir inst 106 fin
.F._9YlBKTdVw0B_new._29.array.body.9:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 107 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 108 fin
  addi t4, t6, 1                                                        # ir inst 109 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._28.array.cond.9                                # ir inst 110 fin
.F._9YlBKTdVw0B_new._30.array.exit.9:
  li t6, 52860
  add t6, a0, t6                                                        # ir inst 111 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 112 fin
  li t6, 52864
  add t6, a0, t6                                                        # ir inst 113 fin
  addi t5, t6, 0                                                        # ir inst 114 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._31.array.cond.10                               # ir inst 115 fin
.F._9YlBKTdVw0B_new._31.array.cond.10:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 117 fin
  bnez t4, .F._9YlBKTdVw0B_new._32.array.body.10
  j .F._9YlBKTdVw0B_new._33.array.exit.10                               # ir inst 118 fin
.F._9YlBKTdVw0B_new._32.array.body.10:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 119 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 120 fin
  addi t4, t6, 1                                                        # ir inst 121 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._31.array.cond.10                               # ir inst 122 fin
.F._9YlBKTdVw0B_new._33.array.exit.10:
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 123 fin
  addi t5, t6, 0                                                        # ir inst 124 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_new._34.array.cond.11                               # ir inst 125 fin
.F._9YlBKTdVw0B_new._34.array.cond.11:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 127 fin
  bnez t4, .F._9YlBKTdVw0B_new._35.array.body.11
  j .F._9YlBKTdVw0B_new._36.array.exit.11                               # ir inst 128 fin
.F._9YlBKTdVw0B_new._35.array.body.11:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 129 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 130 fin
  addi t4, t6, 1                                                        # ir inst 131 fin
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_new._34.array.cond.11                               # ir inst 132 fin
.F._9YlBKTdVw0B_new._36.array.exit.11:
  j .F._9YlBKTdVw0B_new.epilogue                                        # ir inst 133 fin
.F._9YlBKTdVw0B_new.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 1040
  ret

.globl .F._9YlBKTdVw0B_initialize_data
.F._9YlBKTdVw0B_initialize_data:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._9YlBKTdVw0B_initialize_data._0.entry.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_initialize_data._1.while.cond.0                     # ir inst 3 fin
.F._9YlBKTdVw0B_initialize_data._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._9YlBKTdVw0B_initialize_data._2.while.body.0
  j .F._9YlBKTdVw0B_initialize_data._3.while.exit.0                     # ir inst 6 fin
.F._9YlBKTdVw0B_initialize_data._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t6, 24(sp)
  call getInt
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
  sw t5, 0(t3)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_initialize_data._1.while.cond.0                     # ir inst 13 fin
.F._9YlBKTdVw0B_initialize_data._3.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_reset_statistics
  ld a0, 0(sp)
# ir inst 14 fin
  j .F._9YlBKTdVw0B_initialize_data.epilogue                            # ir inst 15 fin
.F._9YlBKTdVw0B_initialize_data.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._9YlBKTdVw0B_reset_statistics
.F._9YlBKTdVw0B_reset_statistics:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._9YlBKTdVw0B_reset_statistics._0.entry.0:
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 1 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 2 fin
  li t6, 16008
  add t6, a0, t6                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 6 fin
  j .F._9YlBKTdVw0B_reset_statistics.epilogue                           # ir inst 7 fin
.F._9YlBKTdVw0B_reset_statistics.epilogue:
  ret

.globl .F._9YlBKTdVw0B_copy_to_temp
.F._9YlBKTdVw0B_copy_to_temp:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._9YlBKTdVw0B_copy_to_temp._0.entry.0:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_copy_to_temp._1.while.cond.0                        # ir inst 1 fin
.F._9YlBKTdVw0B_copy_to_temp._1.while.cond.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._9YlBKTdVw0B_copy_to_temp._2.while.body.0
  j .F._9YlBKTdVw0B_copy_to_temp._3.while.exit.0                        # ir inst 6 fin
.F._9YlBKTdVw0B_copy_to_temp._2.while.body.0:
  li t5, 8000
  add t5, a0, t5                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  addi t5, a0, 0                                                        # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add s11, t5, t2                                                       # ir inst 12 fin
  lw t5, 0(s11)                                                         # ir inst 13 fin
  sw t5, 0(t3)                                                          # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_copy_to_temp._1.while.cond.0                        # ir inst 16 fin
.F._9YlBKTdVw0B_copy_to_temp._3.while.exit.0:
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 17 fin
  lw t5, 0(t6)                                                          # ir inst 18 fin
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  add t4, t5, t3                                                        # ir inst 21 fin
  sw t4, 0(t6)                                                          # ir inst 22 fin
  j .F._9YlBKTdVw0B_copy_to_temp.epilogue                               # ir inst 23 fin
.F._9YlBKTdVw0B_copy_to_temp.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._9YlBKTdVw0B_restore_from_temp
.F._9YlBKTdVw0B_restore_from_temp:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._9YlBKTdVw0B_restore_from_temp._0.entry.0:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_restore_from_temp._1.while.cond.0                   # ir inst 1 fin
.F._9YlBKTdVw0B_restore_from_temp._1.while.cond.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._9YlBKTdVw0B_restore_from_temp._2.while.body.0
  j .F._9YlBKTdVw0B_restore_from_temp._3.while.exit.0                   # ir inst 6 fin
.F._9YlBKTdVw0B_restore_from_temp._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  li t5, 8000
  add t5, a0, t5                                                        # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add s11, t5, t2                                                       # ir inst 12 fin
  lw t5, 0(s11)                                                         # ir inst 13 fin
  sw t5, 0(t3)                                                          # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_restore_from_temp._1.while.cond.0                   # ir inst 16 fin
.F._9YlBKTdVw0B_restore_from_temp._3.while.exit.0:
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 17 fin
  lw t5, 0(t6)                                                          # ir inst 18 fin
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  add t4, t5, t3                                                        # ir inst 21 fin
  sw t4, 0(t6)                                                          # ir inst 22 fin
  j .F._9YlBKTdVw0B_restore_from_temp.epilogue                          # ir inst 23 fin
.F._9YlBKTdVw0B_restore_from_temp.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._9YlBKTdVw0B_merge_sort
.F._9YlBKTdVw0B_merge_sort:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._9YlBKTdVw0B_merge_sort._0.entry.0:
  slt t6, a1, a2                                                        # ir inst 1 fin
  bnez t6, .F._9YlBKTdVw0B_merge_sort._1.if.then.0
  j .F._9YlBKTdVw0B_merge_sort._2.if.else.0                             # ir inst 2 fin
.F._9YlBKTdVw0B_merge_sort._1.if.then.0:
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
  call .F._9YlBKTdVw0B_merge_sort
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
  call .F._9YlBKTdVw0B_merge_sort
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
  call .F._9YlBKTdVw0B_merge
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
  j .F._9YlBKTdVw0B_merge_sort._3.if.exit.0                             # ir inst 10 fin
.F._9YlBKTdVw0B_merge_sort._2.if.else.0:
  j .F._9YlBKTdVw0B_merge_sort._3.if.exit.0                             # ir inst 11 fin
.F._9YlBKTdVw0B_merge_sort._3.if.exit.0:
  j .F._9YlBKTdVw0B_merge_sort.epilogue                                 # ir inst 12 fin
.F._9YlBKTdVw0B_merge_sort.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._9YlBKTdVw0B_merge
.F._9YlBKTdVw0B_merge:
# spill func args num: 0,             range:     8064(sp) -     8064(sp)
# local var size: 8000,               range:       56(sp) -     8056(sp)
# return addr size: 0,                range:       56(sp) -       56(sp)
# callee save reg num: 7 / 12,        range:        0(sp) -       56(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8064
  add sp, sp, t0
  sd s6, 0(sp)
  sd s5, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s7, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
.F._9YlBKTdVw0B_merge._0.entry.0:
  sub t6, a2, a1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  sub t6, a3, a2                                                        # ir inst 3 fin
  addi t1, sp, 56
  addi t4, t1, 0                                                        # ir inst 5 fin
# Phi connections
  li t3, 0
  j .F._9YlBKTdVw0B_merge._1.array.cond.0                               # ir inst 6 fin
.F._9YlBKTdVw0B_merge._1.array.cond.0:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 8 fin
  bnez s11, .F._9YlBKTdVw0B_merge._2.array.body.0
  j .F._9YlBKTdVw0B_merge._3.array.exit.0                               # ir inst 9 fin
.F._9YlBKTdVw0B_merge._2.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 10 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 11 fin
  addi s11, t3, 1                                                       # ir inst 12 fin
# Phi connections
  mv t3, s11
  j .F._9YlBKTdVw0B_merge._1.array.cond.0                               # ir inst 13 fin
.F._9YlBKTdVw0B_merge._3.array.exit.0:
  li t1, 4056
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t3, 0
  j .F._9YlBKTdVw0B_merge._4.array.cond.1                               # ir inst 16 fin
.F._9YlBKTdVw0B_merge._4.array.cond.1:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 18 fin
  bnez s11, .F._9YlBKTdVw0B_merge._5.array.body.1
  j .F._9YlBKTdVw0B_merge._6.array.exit.1                               # ir inst 19 fin
.F._9YlBKTdVw0B_merge._5.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 20 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 21 fin
  addi s11, t3, 1                                                       # ir inst 22 fin
# Phi connections
  mv t3, s11
  j .F._9YlBKTdVw0B_merge._4.array.cond.1                               # ir inst 23 fin
.F._9YlBKTdVw0B_merge._6.array.exit.1:
# Phi connections
  li t4, 0
  j .F._9YlBKTdVw0B_merge._7.while.cond.0                               # ir inst 24 fin
.F._9YlBKTdVw0B_merge._7.while.cond.0:
  slt t3, t4, t5                                                        # ir inst 26 fin
  bnez t3, .F._9YlBKTdVw0B_merge._8.while.body.0
  j .F._9YlBKTdVw0B_merge._9.while.exit.0                               # ir inst 27 fin
.F._9YlBKTdVw0B_merge._8.while.body.0:
  mv t3, t4                                                             # ir inst 28 fin
  slli t2, t3, 2
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 29 fin
  addi t3, a0, 0                                                        # ir inst 30 fin
  add s10, a1, t4                                                       # ir inst 31 fin
  mv s9, s10                                                            # ir inst 32 fin
  slli t2, s9, 2
  add s10, t3, t2                                                       # ir inst 33 fin
  lw t3, 0(s10)                                                         # ir inst 34 fin
  sw t3, 0(s11)                                                         # ir inst 35 fin
  addi t3, t4, 1                                                        # ir inst 36 fin
# Phi connections
  mv t4, t3
  j .F._9YlBKTdVw0B_merge._7.while.cond.0                               # ir inst 37 fin
.F._9YlBKTdVw0B_merge._9.while.exit.0:
# Phi connections
  li t4, 0
  j .F._9YlBKTdVw0B_merge._10.while.cond.1                              # ir inst 38 fin
.F._9YlBKTdVw0B_merge._10.while.cond.1:
  slt t3, t4, t6                                                        # ir inst 40 fin
  bnez t3, .F._9YlBKTdVw0B_merge._11.while.body.1
  j .F._9YlBKTdVw0B_merge._12.while.exit.1                              # ir inst 41 fin
.F._9YlBKTdVw0B_merge._11.while.body.1:
  mv t3, t4                                                             # ir inst 42 fin
  slli t2, t3, 2
  li t1, 4056
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 43 fin
  addi t3, a0, 0                                                        # ir inst 44 fin
  addi s10, a2, 1                                                       # ir inst 45 fin
  add s9, s10, t4                                                       # ir inst 46 fin
  mv s10, s9                                                            # ir inst 47 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 48 fin
  lw t3, 0(s9)                                                          # ir inst 49 fin
  sw t3, 0(s11)                                                         # ir inst 50 fin
  addi t3, t4, 1                                                        # ir inst 51 fin
# Phi connections
  mv t4, t3
  j .F._9YlBKTdVw0B_merge._10.while.cond.1                              # ir inst 52 fin
.F._9YlBKTdVw0B_merge._12.while.exit.1:
  li t4, 16012
  add t4, a0, t4                                                        # ir inst 53 fin
  lw t3, 0(t4)                                                          # ir inst 54 fin
  add s11, t5, t6                                                       # ir inst 55 fin
  add s10, t3, s11                                                      # ir inst 56 fin
  sw s10, 0(t4)                                                         # ir inst 57 fin
# Phi connections
  li s11, 0
  mv t3, a1
  li t4, 0
  j .F._9YlBKTdVw0B_merge._13.while.cond.2                              # ir inst 58 fin
.F._9YlBKTdVw0B_merge._13.while.cond.2:
  slt s10, s11, t5                                                      # ir inst 62 fin
  bnez s10, .F._9YlBKTdVw0B_merge._14.lazy.then.0
  j .F._9YlBKTdVw0B_merge._15.lazy.else.0                               # ir inst 63 fin
.F._9YlBKTdVw0B_merge._14.lazy.then.0:
  slt s10, t4, t6                                                       # ir inst 64 fin
# Phi connections
  j .F._9YlBKTdVw0B_merge._16.lazy.exit.0                               # ir inst 65 fin
.F._9YlBKTdVw0B_merge._15.lazy.else.0:
# Phi connections
  li s10, 0
  j .F._9YlBKTdVw0B_merge._16.lazy.exit.0                               # ir inst 66 fin
.F._9YlBKTdVw0B_merge._16.lazy.exit.0:
  bnez s10, .F._9YlBKTdVw0B_merge._17.while.body.2
  j .F._9YlBKTdVw0B_merge._21.while.exit.2                              # ir inst 68 fin
.F._9YlBKTdVw0B_merge._17.while.body.2:
  li s10, 16004
  add s10, a0, s10                                                      # ir inst 69 fin
  lw s9, 0(s10)                                                         # ir inst 70 fin
  addi s8, s9, 1                                                        # ir inst 71 fin
  sw s8, 0(s10)                                                         # ir inst 72 fin
  mv s10, s11                                                           # ir inst 73 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s9, t1, t2                                                        # ir inst 74 fin
  lw s10, 0(s9)                                                         # ir inst 75 fin
  mv s9, t4                                                             # ir inst 76 fin
  slli t2, s9, 2
  li t1, 4056
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 77 fin
  lw s9, 0(s8)                                                          # ir inst 78 fin
  slt t0, s9, s10
  xori s8, t0, 1                                                        # ir inst 79 fin
  bnez s8, .F._9YlBKTdVw0B_merge._18.if.then.0
  j .F._9YlBKTdVw0B_merge._19.if.else.0                                 # ir inst 80 fin
.F._9YlBKTdVw0B_merge._18.if.then.0:
  addi s10, a0, 0                                                       # ir inst 81 fin
  mv s9, t3                                                             # ir inst 82 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 83 fin
  mv s10, s11                                                           # ir inst 84 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s9, t1, t2                                                        # ir inst 85 fin
  lw s10, 0(s9)                                                         # ir inst 86 fin
  sw s10, 0(s8)                                                         # ir inst 87 fin
  addi s10, s11, 1                                                      # ir inst 88 fin
# Phi connections
  mv s9, s10
  mv s10, t4
  j .F._9YlBKTdVw0B_merge._20.if.exit.0                                 # ir inst 89 fin
.F._9YlBKTdVw0B_merge._19.if.else.0:
  addi s10, a0, 0                                                       # ir inst 90 fin
  mv s9, t3                                                             # ir inst 91 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 92 fin
  mv s10, t4                                                            # ir inst 93 fin
  slli t2, s10, 2
  li t1, 4056
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 94 fin
  lw s10, 0(s9)                                                         # ir inst 95 fin
  sw s10, 0(s8)                                                         # ir inst 96 fin
  addi s10, t4, 1                                                       # ir inst 97 fin
# Phi connections
  mv s9, s11
  j .F._9YlBKTdVw0B_merge._20.if.exit.0                                 # ir inst 98 fin
.F._9YlBKTdVw0B_merge._20.if.exit.0:
  addi s8, t3, 1                                                        # ir inst 101 fin
  li s7, 16012
  add s7, a0, s7                                                        # ir inst 102 fin
  lw s6, 0(s7)                                                          # ir inst 103 fin
  addi s5, s6, 1                                                        # ir inst 104 fin
  sw s5, 0(s7)                                                          # ir inst 105 fin
# Phi connections
  mv s11, s9
  mv t3, s8
  mv t4, s10
  j .F._9YlBKTdVw0B_merge._13.while.cond.2                              # ir inst 106 fin
.F._9YlBKTdVw0B_merge._21.while.exit.2:
# Phi connections
  j .F._9YlBKTdVw0B_merge._22.while.cond.3                              # ir inst 107 fin
.F._9YlBKTdVw0B_merge._22.while.cond.3:
  slt s10, s11, t5                                                      # ir inst 110 fin
  bnez s10, .F._9YlBKTdVw0B_merge._23.while.body.3
  j .F._9YlBKTdVw0B_merge._24.while.exit.3                              # ir inst 111 fin
.F._9YlBKTdVw0B_merge._23.while.body.3:
  addi s10, a0, 0                                                       # ir inst 112 fin
  mv s9, t3                                                             # ir inst 113 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 114 fin
  mv s10, s11                                                           # ir inst 115 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s9, t1, t2                                                        # ir inst 116 fin
  lw s10, 0(s9)                                                         # ir inst 117 fin
  sw s10, 0(s8)                                                         # ir inst 118 fin
  addi s10, s11, 1                                                      # ir inst 119 fin
  addi s11, t3, 1                                                       # ir inst 120 fin
  li s9, 16012
  add s9, a0, s9                                                        # ir inst 121 fin
  lw s8, 0(s9)                                                          # ir inst 122 fin
  addi s7, s8, 1                                                        # ir inst 123 fin
  sw s7, 0(s9)                                                          # ir inst 124 fin
# Phi connections
  mv t3, s11
  mv s11, s10
  j .F._9YlBKTdVw0B_merge._22.while.cond.3                              # ir inst 125 fin
.F._9YlBKTdVw0B_merge._24.while.exit.3:
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F._9YlBKTdVw0B_merge._25.while.cond.4                              # ir inst 126 fin
.F._9YlBKTdVw0B_merge._25.while.cond.4:
  slt t3, t5, t6                                                        # ir inst 129 fin
  bnez t3, .F._9YlBKTdVw0B_merge._26.while.body.4
  j .F._9YlBKTdVw0B_merge._27.while.exit.4                              # ir inst 130 fin
.F._9YlBKTdVw0B_merge._26.while.body.4:
  addi t3, a0, 0                                                        # ir inst 131 fin
  mv s11, t4                                                            # ir inst 132 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 133 fin
  mv t3, t5                                                             # ir inst 134 fin
  slli t2, t3, 2
  li t1, 4056
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 135 fin
  lw t3, 0(s11)                                                         # ir inst 136 fin
  sw t3, 0(s10)                                                         # ir inst 137 fin
  addi t3, t5, 1                                                        # ir inst 138 fin
  addi t5, t4, 1                                                        # ir inst 139 fin
  li t4, 16012
  add t4, a0, t4                                                        # ir inst 140 fin
  lw s11, 0(t4)                                                         # ir inst 141 fin
  addi s10, s11, 1                                                      # ir inst 142 fin
  sw s10, 0(t4)                                                         # ir inst 143 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  j .F._9YlBKTdVw0B_merge._25.while.cond.4                              # ir inst 144 fin
.F._9YlBKTdVw0B_merge._27.while.exit.4:
  j .F._9YlBKTdVw0B_merge.epilogue                                      # ir inst 145 fin
.F._9YlBKTdVw0B_merge.epilogue:
  ld s6, 0(sp)
  ld s5, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s7, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  li t0, 8064
  add sp, sp, t0
  ret

.globl .F._9YlBKTdVw0B_quick_sort_3way
.F._9YlBKTdVw0B_quick_sort_3way:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 3 / 12,        range:       56(sp) -       80(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s9, 56(sp)
  sd s11, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
.F._9YlBKTdVw0B_quick_sort_3way._0.entry.0:
  slt t6, a1, a2                                                        # ir inst 1 fin
  bnez t6, .F._9YlBKTdVw0B_quick_sort_3way._1.if.then.0
  j .F._9YlBKTdVw0B_quick_sort_3way._11.if.else.0                       # ir inst 2 fin
.F._9YlBKTdVw0B_quick_sort_3way._1.if.then.0:
  addi t6, a1, 1                                                        # ir inst 3 fin
  addi t5, a0, 0                                                        # ir inst 4 fin
  mv t4, a1                                                             # ir inst 5 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 6 fin
  lw t5, 0(t3)                                                          # ir inst 7 fin
# Phi connections
  mv t3, a1
  mv t4, a2
  j .F._9YlBKTdVw0B_quick_sort_3way._2.while.cond.0                     # ir inst 8 fin
.F._9YlBKTdVw0B_quick_sort_3way._2.while.cond.0:
  slt t0, t4, t6
  xori s11, t0, 1                                                       # ir inst 12 fin
  bnez s11, .F._9YlBKTdVw0B_quick_sort_3way._3.while.body.0
  j .F._9YlBKTdVw0B_quick_sort_3way._10.while.exit.0                    # ir inst 13 fin
.F._9YlBKTdVw0B_quick_sort_3way._3.while.body.0:
  li s11, 16004
  add s11, a0, s11                                                      # ir inst 14 fin
  lw s10, 0(s11)                                                        # ir inst 15 fin
  addi s9, s10, 1                                                       # ir inst 16 fin
  sw s9, 0(s11)                                                         # ir inst 17 fin
  addi s11, a0, 0                                                       # ir inst 18 fin
  mv s10, t6                                                            # ir inst 19 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 20 fin
  lw s11, 0(s9)                                                         # ir inst 21 fin
  slt s10, s11, t5                                                      # ir inst 22 fin
  bnez s10, .F._9YlBKTdVw0B_quick_sort_3way._4.if.then.1
  j .F._9YlBKTdVw0B_quick_sort_3way._5.if.else.1                        # ir inst 23 fin
.F._9YlBKTdVw0B_quick_sort_3way._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a2, t6
  mv a1, t3
  call .F._9YlBKTdVw0B_swap_elements
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 24 fin
  addi s11, t3, 1                                                       # ir inst 25 fin
  addi s10, t6, 1                                                       # ir inst 26 fin
# Phi connections
  mv t6, s10
  mv s10, s11
  mv s11, t4
  j .F._9YlBKTdVw0B_quick_sort_3way._9.if.exit.1                        # ir inst 27 fin
.F._9YlBKTdVw0B_quick_sort_3way._5.if.else.1:
  addi s11, a0, 0                                                       # ir inst 28 fin
  mv s10, t6                                                            # ir inst 29 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 30 fin
  lw s11, 0(s9)                                                         # ir inst 31 fin
  slt s10, t5, s11                                                      # ir inst 32 fin
  bnez s10, .F._9YlBKTdVw0B_quick_sort_3way._6.if.then.2
  j .F._9YlBKTdVw0B_quick_sort_3way._7.if.else.2                        # ir inst 33 fin
.F._9YlBKTdVw0B_quick_sort_3way._6.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a2, t4
  mv a1, t6
  call .F._9YlBKTdVw0B_swap_elements
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 34 fin
  addi s11, t4, -1                                                      # ir inst 35 fin
# Phi connections
  j .F._9YlBKTdVw0B_quick_sort_3way._8.if.exit.2                        # ir inst 36 fin
.F._9YlBKTdVw0B_quick_sort_3way._7.if.else.2:
  addi s11, t6, 1                                                       # ir inst 37 fin
# Phi connections
  mv t6, s11
  mv s11, t4
  j .F._9YlBKTdVw0B_quick_sort_3way._8.if.exit.2                        # ir inst 38 fin
.F._9YlBKTdVw0B_quick_sort_3way._8.if.exit.2:
# Phi connections
  mv s10, t3
  j .F._9YlBKTdVw0B_quick_sort_3way._9.if.exit.1                        # ir inst 41 fin
.F._9YlBKTdVw0B_quick_sort_3way._9.if.exit.1:
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F._9YlBKTdVw0B_quick_sort_3way._2.while.cond.0                     # ir inst 45 fin
.F._9YlBKTdVw0B_quick_sort_3way._10.while.exit.0:
  addi t6, t3, -1                                                       # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  mv a2, t6
  call .F._9YlBKTdVw0B_quick_sort_3way
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 47 fin
  addi t6, t4, 1                                                        # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  call .F._9YlBKTdVw0B_quick_sort_3way
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 49 fin
  j .F._9YlBKTdVw0B_quick_sort_3way._12.if.exit.0                       # ir inst 50 fin
.F._9YlBKTdVw0B_quick_sort_3way._11.if.else.0:
  j .F._9YlBKTdVw0B_quick_sort_3way._12.if.exit.0                       # ir inst 51 fin
.F._9YlBKTdVw0B_quick_sort_3way._12.if.exit.0:
  j .F._9YlBKTdVw0B_quick_sort_3way.epilogue                            # ir inst 52 fin
.F._9YlBKTdVw0B_quick_sort_3way.epilogue:
  ld ra, 80(sp)
  ld s9, 56(sp)
  ld s11, 64(sp)
  ld s10, 72(sp)
  addi sp, sp, 96
  ret

.globl .F._9YlBKTdVw0B_swap_elements
.F._9YlBKTdVw0B_swap_elements:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._9YlBKTdVw0B_swap_elements._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  addi t5, a0, 0                                                        # ir inst 5 fin
  mv t4, a1                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 7 fin
  addi t5, a0, 0                                                        # ir inst 8 fin
  mv t4, a2                                                             # ir inst 9 fin
  slli t2, t4, 2
  add s11, t5, t2                                                       # ir inst 10 fin
  lw t5, 0(s11)                                                         # ir inst 11 fin
  sw t5, 0(t3)                                                          # ir inst 12 fin
  addi t5, a0, 0                                                        # ir inst 13 fin
  mv t4, a2                                                             # ir inst 14 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 15 fin
  sw t6, 0(t3)                                                          # ir inst 16 fin
  li t6, 16008
  add t6, a0, t6                                                        # ir inst 17 fin
  lw t5, 0(t6)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
  sw t4, 0(t6)                                                          # ir inst 20 fin
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 21 fin
  lw t5, 0(t6)                                                          # ir inst 22 fin
  addi t4, t5, 3                                                        # ir inst 23 fin
  sw t4, 0(t6)                                                          # ir inst 24 fin
  j .F._9YlBKTdVw0B_swap_elements.epilogue                              # ir inst 25 fin
.F._9YlBKTdVw0B_swap_elements.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._9YlBKTdVw0B_heap_sort
.F._9YlBKTdVw0B_heap_sort:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F._9YlBKTdVw0B_heap_sort._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_build_max_heap
  ld a0, 0(sp)
# ir inst 1 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 2 fin
  lw t5, 0(t6)                                                          # ir inst 3 fin
  addi t6, t5, -1                                                       # ir inst 4 fin
# Phi connections
  j .F._9YlBKTdVw0B_heap_sort._1.while.cond.0                           # ir inst 5 fin
.F._9YlBKTdVw0B_heap_sort._1.while.cond.0:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 7 fin
  bnez t5, .F._9YlBKTdVw0B_heap_sort._2.while.body.0
  j .F._9YlBKTdVw0B_heap_sort._3.while.exit.0                           # ir inst 8 fin
.F._9YlBKTdVw0B_heap_sort._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  li a1, 0
  call .F._9YlBKTdVw0B_swap_elements
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 9 fin
  addi t5, t6, -1                                                       # ir inst 10 fin
  addi t6, t5, 1                                                        # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  li a1, 0
  call .F._9YlBKTdVw0B_max_heapify
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_heap_sort._1.while.cond.0                           # ir inst 13 fin
.F._9YlBKTdVw0B_heap_sort._3.while.exit.0:
  j .F._9YlBKTdVw0B_heap_sort.epilogue                                  # ir inst 14 fin
.F._9YlBKTdVw0B_heap_sort.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._9YlBKTdVw0B_build_max_heap
.F._9YlBKTdVw0B_build_max_heap:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F._9YlBKTdVw0B_build_max_heap._0.entry.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 2
  div t6, t5, t2                                                        # ir inst 3 fin
  addi t5, t6, -1                                                       # ir inst 4 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_build_max_heap._1.while.cond.0                      # ir inst 5 fin
.F._9YlBKTdVw0B_build_max_heap._1.while.cond.0:
  li t2, 0
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 7 fin
  bnez t5, .F._9YlBKTdVw0B_build_max_heap._2.while.body.0
  j .F._9YlBKTdVw0B_build_max_heap._3.while.exit.0                      # ir inst 8 fin
.F._9YlBKTdVw0B_build_max_heap._2.while.body.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  mv a1, t6
  call .F._9YlBKTdVw0B_max_heapify
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 11 fin
  addi t5, t6, -1                                                       # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_build_max_heap._1.while.cond.0                      # ir inst 13 fin
.F._9YlBKTdVw0B_build_max_heap._3.while.exit.0:
  j .F._9YlBKTdVw0B_build_max_heap.epilogue                             # ir inst 14 fin
.F._9YlBKTdVw0B_build_max_heap.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._9YlBKTdVw0B_max_heapify
.F._9YlBKTdVw0B_max_heapify:
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
.F._9YlBKTdVw0B_max_heapify._0.entry.0:
  slli t6, a1, 1                                                        # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  slli t6, a1, 1                                                        # ir inst 3 fin
  addi t4, t6, 2                                                        # ir inst 4 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 5 fin
  lw t3, 0(t6)                                                          # ir inst 6 fin
  addi s11, t3, 1                                                       # ir inst 7 fin
  sw s11, 0(t6)                                                         # ir inst 8 fin
  slt t6, t5, a2                                                        # ir inst 9 fin
  bnez t6, .F._9YlBKTdVw0B_max_heapify._1.lazy.then.0
  j .F._9YlBKTdVw0B_max_heapify._2.lazy.else.0                          # ir inst 10 fin
.F._9YlBKTdVw0B_max_heapify._1.lazy.then.0:
  addi t6, a0, 0                                                        # ir inst 11 fin
  mv t3, t5                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, t6, t2                                                       # ir inst 13 fin
  lw t6, 0(s11)                                                         # ir inst 14 fin
  addi t3, a0, 0                                                        # ir inst 15 fin
  mv s11, a1                                                            # ir inst 16 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 17 fin
  lw t3, 0(s10)                                                         # ir inst 18 fin
  slt s11, t3, t6                                                       # ir inst 19 fin
# Phi connections
  mv t6, s11
  j .F._9YlBKTdVw0B_max_heapify._3.lazy.exit.0                          # ir inst 20 fin
.F._9YlBKTdVw0B_max_heapify._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_max_heapify._3.lazy.exit.0                          # ir inst 21 fin
.F._9YlBKTdVw0B_max_heapify._3.lazy.exit.0:
  bnez t6, .F._9YlBKTdVw0B_max_heapify._4.if.then.0
  j .F._9YlBKTdVw0B_max_heapify._5.if.else.0                            # ir inst 23 fin
.F._9YlBKTdVw0B_max_heapify._4.if.then.0:
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_max_heapify._6.if.exit.0                            # ir inst 24 fin
.F._9YlBKTdVw0B_max_heapify._5.if.else.0:
# Phi connections
  mv t6, a1
  j .F._9YlBKTdVw0B_max_heapify._6.if.exit.0                            # ir inst 25 fin
.F._9YlBKTdVw0B_max_heapify._6.if.exit.0:
  li t5, 16004
  add t5, a0, t5                                                        # ir inst 27 fin
  lw t3, 0(t5)                                                          # ir inst 28 fin
  addi s11, t3, 1                                                       # ir inst 29 fin
  sw s11, 0(t5)                                                         # ir inst 30 fin
  slt t5, t4, a2                                                        # ir inst 31 fin
  bnez t5, .F._9YlBKTdVw0B_max_heapify._7.lazy.then.1
  j .F._9YlBKTdVw0B_max_heapify._8.lazy.else.1                          # ir inst 32 fin
.F._9YlBKTdVw0B_max_heapify._7.lazy.then.1:
  addi t5, a0, 0                                                        # ir inst 33 fin
  mv t3, t4                                                             # ir inst 34 fin
  slli t2, t3, 2
  add s11, t5, t2                                                       # ir inst 35 fin
  lw t5, 0(s11)                                                         # ir inst 36 fin
  addi t3, a0, 0                                                        # ir inst 37 fin
  mv s11, t6                                                            # ir inst 38 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 39 fin
  lw t3, 0(s10)                                                         # ir inst 40 fin
  slt s11, t3, t5                                                       # ir inst 41 fin
# Phi connections
  mv t5, s11
  j .F._9YlBKTdVw0B_max_heapify._9.lazy.exit.1                          # ir inst 42 fin
.F._9YlBKTdVw0B_max_heapify._8.lazy.else.1:
# Phi connections
  li t5, 0
  j .F._9YlBKTdVw0B_max_heapify._9.lazy.exit.1                          # ir inst 43 fin
.F._9YlBKTdVw0B_max_heapify._9.lazy.exit.1:
  bnez t5, .F._9YlBKTdVw0B_max_heapify._10.if.then.1
  j .F._9YlBKTdVw0B_max_heapify._11.if.else.1                           # ir inst 45 fin
.F._9YlBKTdVw0B_max_heapify._10.if.then.1:
# Phi connections
  mv t6, t4
  j .F._9YlBKTdVw0B_max_heapify._12.if.exit.1                           # ir inst 46 fin
.F._9YlBKTdVw0B_max_heapify._11.if.else.1:
# Phi connections
  j .F._9YlBKTdVw0B_max_heapify._12.if.exit.1                           # ir inst 47 fin
.F._9YlBKTdVw0B_max_heapify._12.if.exit.1:
  xor t0, t6, a1
  sltu t5, zero, t0                                                     # ir inst 49 fin
  bnez t5, .F._9YlBKTdVw0B_max_heapify._13.if.then.2
  j .F._9YlBKTdVw0B_max_heapify._14.if.else.2                           # ir inst 50 fin
.F._9YlBKTdVw0B_max_heapify._13.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  call .F._9YlBKTdVw0B_swap_elements
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 51 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  call .F._9YlBKTdVw0B_max_heapify
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 52 fin
  j .F._9YlBKTdVw0B_max_heapify._15.if.exit.2                           # ir inst 53 fin
.F._9YlBKTdVw0B_max_heapify._14.if.else.2:
  j .F._9YlBKTdVw0B_max_heapify._15.if.exit.2                           # ir inst 54 fin
.F._9YlBKTdVw0B_max_heapify._15.if.exit.2:
  j .F._9YlBKTdVw0B_max_heapify.epilogue                                # ir inst 55 fin
.F._9YlBKTdVw0B_max_heapify.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._9YlBKTdVw0B_radix_sort
.F._9YlBKTdVw0B_radix_sort:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F._9YlBKTdVw0B_radix_sort._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_find_maximum
  mv t6, a0
  ld a0, 0(sp)
# ir inst 1 fin
# Phi connections
  li t5, 1
  j .F._9YlBKTdVw0B_radix_sort._1.while.cond.0                          # ir inst 2 fin
.F._9YlBKTdVw0B_radix_sort._1.while.cond.0:
  div t4, t6, t5                                                        # ir inst 4 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 5 fin
  bnez t3, .F._9YlBKTdVw0B_radix_sort._2.while.body.0
  j .F._9YlBKTdVw0B_radix_sort._3.while.exit.0                          # ir inst 6 fin
.F._9YlBKTdVw0B_radix_sort._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t5
  call .F._9YlBKTdVw0B_counting_sort_by_digit
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
  li t2, 10
  mul t4, t5, t2                                                        # ir inst 8 fin
# Phi connections
  mv t5, t4
  j .F._9YlBKTdVw0B_radix_sort._1.while.cond.0                          # ir inst 9 fin
.F._9YlBKTdVw0B_radix_sort._3.while.exit.0:
  j .F._9YlBKTdVw0B_radix_sort.epilogue                                 # ir inst 10 fin
.F._9YlBKTdVw0B_radix_sort.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._9YlBKTdVw0B_find_maximum
.F._9YlBKTdVw0B_find_maximum:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._9YlBKTdVw0B_find_maximum._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
# Phi connections
  mv t5, t6
  li t6, 1
  j .F._9YlBKTdVw0B_find_maximum._1.while.cond.0                        # ir inst 4 fin
.F._9YlBKTdVw0B_find_maximum._1.while.cond.0:
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 7 fin
  lw t3, 0(t4)                                                          # ir inst 8 fin
  slt t4, t6, t3                                                        # ir inst 9 fin
  bnez t4, .F._9YlBKTdVw0B_find_maximum._2.while.body.0
  j .F._9YlBKTdVw0B_find_maximum._6.while.exit.0                        # ir inst 10 fin
.F._9YlBKTdVw0B_find_maximum._2.while.body.0:
  addi t4, a0, 0                                                        # ir inst 11 fin
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 13 fin
  lw t4, 0(s11)                                                         # ir inst 14 fin
  slt t3, t5, t4                                                        # ir inst 15 fin
  bnez t3, .F._9YlBKTdVw0B_find_maximum._3.if.then.0
  j .F._9YlBKTdVw0B_find_maximum._4.if.else.0                           # ir inst 16 fin
.F._9YlBKTdVw0B_find_maximum._3.if.then.0:
  addi t4, a0, 0                                                        # ir inst 17 fin
  mv t3, t6                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 19 fin
  lw t4, 0(s11)                                                         # ir inst 20 fin
# Phi connections
  j .F._9YlBKTdVw0B_find_maximum._5.if.exit.0                           # ir inst 21 fin
.F._9YlBKTdVw0B_find_maximum._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F._9YlBKTdVw0B_find_maximum._5.if.exit.0                           # ir inst 22 fin
.F._9YlBKTdVw0B_find_maximum._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._9YlBKTdVw0B_find_maximum._1.while.cond.0                        # ir inst 25 fin
.F._9YlBKTdVw0B_find_maximum._6.while.exit.0:
  mv a0, t5
  j .F._9YlBKTdVw0B_find_maximum.epilogue                               # ir inst 26 fin
.F._9YlBKTdVw0B_find_maximum.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._9YlBKTdVw0B_counting_sort_by_digit
.F._9YlBKTdVw0B_counting_sort_by_digit:
# spill func args num: 0,             range:     8048(sp) -     8048(sp)
# local var size: 8040,               range:        8(sp) -     8048(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8048
  add sp, sp, t0
  sd s11, 0(sp)
.F._9YlBKTdVw0B_counting_sort_by_digit._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F._9YlBKTdVw0B_counting_sort_by_digit._1.array.cond.0              # ir inst 3 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F._9YlBKTdVw0B_counting_sort_by_digit._2.array.body.0
  j .F._9YlBKTdVw0B_counting_sort_by_digit._3.array.exit.0              # ir inst 6 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F._9YlBKTdVw0B_counting_sort_by_digit._1.array.cond.0              # ir inst 10 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._3.array.exit.0:
  li t1, 8008
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F._9YlBKTdVw0B_counting_sort_by_digit._4.array.cond.1              # ir inst 13 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._4.array.cond.1:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F._9YlBKTdVw0B_counting_sort_by_digit._5.array.body.1
  j .F._9YlBKTdVw0B_counting_sort_by_digit._6.array.exit.1              # ir inst 16 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F._9YlBKTdVw0B_counting_sort_by_digit._4.array.cond.1              # ir inst 20 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_counting_sort_by_digit._7.while.cond.0              # ir inst 21 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._7.while.cond.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 23 fin
  lw t4, 0(t5)                                                          # ir inst 24 fin
  slt t5, t6, t4                                                        # ir inst 25 fin
  bnez t5, .F._9YlBKTdVw0B_counting_sort_by_digit._8.while.body.0
  j .F._9YlBKTdVw0B_counting_sort_by_digit._9.while.exit.0              # ir inst 26 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._8.while.body.0:
  addi t5, a0, 0                                                        # ir inst 27 fin
  mv t4, t6                                                             # ir inst 28 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 29 fin
  lw t5, 0(t3)                                                          # ir inst 30 fin
  div t4, t5, a1                                                        # ir inst 31 fin
  li t2, 10
  rem t5, t4, t2                                                        # ir inst 32 fin
  mv t4, t5                                                             # ir inst 33 fin
  slli t2, t4, 2
  li t1, 8008
  add t1, sp, t1
  add t5, t1, t2                                                        # ir inst 34 fin
  lw t4, 0(t5)                                                          # ir inst 35 fin
  addi t3, t4, 1                                                        # ir inst 36 fin
  sw t3, 0(t5)                                                          # ir inst 37 fin
  addi t5, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_counting_sort_by_digit._7.while.cond.0              # ir inst 39 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._9.while.exit.0:
# Phi connections
  li t6, 1
  j .F._9YlBKTdVw0B_counting_sort_by_digit._10.while.cond.1             # ir inst 40 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._10.while.cond.1:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 42 fin
  bnez t5, .F._9YlBKTdVw0B_counting_sort_by_digit._11.while.body.1
  j .F._9YlBKTdVw0B_counting_sort_by_digit._12.while.exit.1             # ir inst 43 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._11.while.body.1:
  mv t5, t6                                                             # ir inst 44 fin
  slli t2, t5, 2
  li t1, 8008
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 45 fin
  lw t5, 0(t4)                                                          # ir inst 46 fin
  addi t3, t6, -1                                                       # ir inst 47 fin
  mv s11, t3                                                            # ir inst 48 fin
  slli t2, s11, 2
  li t1, 8008
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 49 fin
  lw s11, 0(t3)                                                         # ir inst 50 fin
  add t3, t5, s11                                                       # ir inst 51 fin
  sw t3, 0(t4)                                                          # ir inst 52 fin
  addi t5, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_counting_sort_by_digit._10.while.cond.1             # ir inst 54 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._12.while.exit.1:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 55 fin
  lw t5, 0(t6)                                                          # ir inst 56 fin
  addi t6, t5, -1                                                       # ir inst 57 fin
# Phi connections
  j .F._9YlBKTdVw0B_counting_sort_by_digit._13.while.cond.2             # ir inst 58 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._13.while.cond.2:
  li t2, 0
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 60 fin
  bnez t5, .F._9YlBKTdVw0B_counting_sort_by_digit._14.while.body.2
  j .F._9YlBKTdVw0B_counting_sort_by_digit._15.while.exit.2             # ir inst 61 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._14.while.body.2:
  addi t5, a0, 0                                                        # ir inst 62 fin
  mv t4, t6                                                             # ir inst 63 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 64 fin
  lw t5, 0(t3)                                                          # ir inst 65 fin
  div t4, t5, a1                                                        # ir inst 66 fin
  li t2, 10
  rem t5, t4, t2                                                        # ir inst 67 fin
  mv t4, t5                                                             # ir inst 68 fin
  slli t2, t4, 2
  li t1, 8008
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 69 fin
  lw t4, 0(t3)                                                          # ir inst 70 fin
  addi s11, t4, -1                                                      # ir inst 71 fin
  sw s11, 0(t3)                                                         # ir inst 72 fin
  mv t4, t5                                                             # ir inst 73 fin
  slli t2, t4, 2
  li t1, 8008
  add t1, sp, t1
  add t5, t1, t2                                                        # ir inst 74 fin
  lw t4, 0(t5)                                                          # ir inst 75 fin
  mv t5, t4                                                             # ir inst 76 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 77 fin
  addi t5, a0, 0                                                        # ir inst 78 fin
  mv t3, t6                                                             # ir inst 79 fin
  slli t2, t3, 2
  add s11, t5, t2                                                       # ir inst 80 fin
  lw t5, 0(s11)                                                         # ir inst 81 fin
  sw t5, 0(t4)                                                          # ir inst 82 fin
  addi t5, t6, -1                                                       # ir inst 83 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_counting_sort_by_digit._13.while.cond.2             # ir inst 84 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._15.while.exit.2:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_counting_sort_by_digit._16.while.cond.3             # ir inst 85 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._16.while.cond.3:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 87 fin
  lw t4, 0(t5)                                                          # ir inst 88 fin
  slt t5, t6, t4                                                        # ir inst 89 fin
  bnez t5, .F._9YlBKTdVw0B_counting_sort_by_digit._17.while.body.3
  j .F._9YlBKTdVw0B_counting_sort_by_digit._18.while.exit.3             # ir inst 90 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._17.while.body.3:
  addi t5, a0, 0                                                        # ir inst 91 fin
  mv t4, t6                                                             # ir inst 92 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 93 fin
  mv t5, t6                                                             # ir inst 94 fin
  slli t2, t5, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 95 fin
  lw t5, 0(t4)                                                          # ir inst 96 fin
  sw t5, 0(t3)                                                          # ir inst 97 fin
  addi t5, t6, 1                                                        # ir inst 98 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_counting_sort_by_digit._16.while.cond.3             # ir inst 99 fin
.F._9YlBKTdVw0B_counting_sort_by_digit._18.while.exit.3:
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 100 fin
  lw t5, 0(t6)                                                          # ir inst 101 fin
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 102 fin
  lw t3, 0(t4)                                                          # ir inst 103 fin
  li t2, 3
  mul t4, t3, t2                                                        # ir inst 104 fin
  add t3, t5, t4                                                        # ir inst 105 fin
  sw t3, 0(t6)                                                          # ir inst 106 fin
  j .F._9YlBKTdVw0B_counting_sort_by_digit.epilogue                     # ir inst 107 fin
.F._9YlBKTdVw0B_counting_sort_by_digit.epilogue:
  ld s11, 0(sp)
  li t0, 8048
  add sp, sp, t0
  ret

.globl .F._9YlBKTdVw0B_bucket_sort
.F._9YlBKTdVw0B_bucket_sort:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 5 / 12,        range:       16(sp) -       56(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s7, 16(sp)
  sd s8, 24(sp)
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F._9YlBKTdVw0B_bucket_sort._0.entry.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 1
  slt t0, t2, t5
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F._9YlBKTdVw0B_bucket_sort._1.if.then.0
  j .F._9YlBKTdVw0B_bucket_sort._2.if.else.0                            # ir inst 4 fin
.F._9YlBKTdVw0B_bucket_sort._1.if.then.0:
  j .F._9YlBKTdVw0B_bucket_sort.epilogue                                # ir inst 5 fin
.F._9YlBKTdVw0B_bucket_sort._2.if.else.0:
  j .F._9YlBKTdVw0B_bucket_sort._3.if.exit.0                            # ir inst 6 fin
.F._9YlBKTdVw0B_bucket_sort._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 7 fin
  addi t5, t6, 0                                                        # ir inst 8 fin
  lw t6, 0(t5)                                                          # ir inst 9 fin
  addi t5, a0, 0                                                        # ir inst 10 fin
  addi t4, t5, 0                                                        # ir inst 11 fin
  lw t5, 0(t4)                                                          # ir inst 12 fin
# Phi connections
  li t4, 1
  j .F._9YlBKTdVw0B_bucket_sort._4.while.cond.0                         # ir inst 13 fin
.F._9YlBKTdVw0B_bucket_sort._4.while.cond.0:
  li t3, 16000
  add t3, a0, t3                                                        # ir inst 17 fin
  lw s11, 0(t3)                                                         # ir inst 18 fin
  slt t3, t4, s11                                                       # ir inst 19 fin
  bnez t3, .F._9YlBKTdVw0B_bucket_sort._5.while.body.0
  j .F._9YlBKTdVw0B_bucket_sort._12.while.exit.0                        # ir inst 20 fin
.F._9YlBKTdVw0B_bucket_sort._5.while.body.0:
  addi t3, a0, 0                                                        # ir inst 21 fin
  mv s11, t4                                                            # ir inst 22 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 23 fin
  lw t3, 0(s10)                                                         # ir inst 24 fin
  slt s11, t3, t6                                                       # ir inst 25 fin
  bnez s11, .F._9YlBKTdVw0B_bucket_sort._6.if.then.1
  j .F._9YlBKTdVw0B_bucket_sort._7.if.else.1                            # ir inst 26 fin
.F._9YlBKTdVw0B_bucket_sort._6.if.then.1:
  addi t3, a0, 0                                                        # ir inst 27 fin
  mv s11, t4                                                            # ir inst 28 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 29 fin
  lw t3, 0(s10)                                                         # ir inst 30 fin
# Phi connections
  j .F._9YlBKTdVw0B_bucket_sort._8.if.exit.1                            # ir inst 31 fin
.F._9YlBKTdVw0B_bucket_sort._7.if.else.1:
# Phi connections
  mv t3, t6
  j .F._9YlBKTdVw0B_bucket_sort._8.if.exit.1                            # ir inst 32 fin
.F._9YlBKTdVw0B_bucket_sort._8.if.exit.1:
  addi s11, a0, 0                                                       # ir inst 34 fin
  mv s10, t4                                                            # ir inst 35 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 36 fin
  lw s11, 0(s9)                                                         # ir inst 37 fin
  slt s10, t5, s11                                                      # ir inst 38 fin
  bnez s10, .F._9YlBKTdVw0B_bucket_sort._9.if.then.2
  j .F._9YlBKTdVw0B_bucket_sort._10.if.else.2                           # ir inst 39 fin
.F._9YlBKTdVw0B_bucket_sort._9.if.then.2:
  addi s11, a0, 0                                                       # ir inst 40 fin
  mv s10, t4                                                            # ir inst 41 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 42 fin
  lw s11, 0(s9)                                                         # ir inst 43 fin
# Phi connections
  j .F._9YlBKTdVw0B_bucket_sort._11.if.exit.2                           # ir inst 44 fin
.F._9YlBKTdVw0B_bucket_sort._10.if.else.2:
# Phi connections
  mv s11, t5
  j .F._9YlBKTdVw0B_bucket_sort._11.if.exit.2                           # ir inst 45 fin
.F._9YlBKTdVw0B_bucket_sort._11.if.exit.2:
  addi s10, t4, 1                                                       # ir inst 47 fin
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F._9YlBKTdVw0B_bucket_sort._4.while.cond.0                         # ir inst 48 fin
.F._9YlBKTdVw0B_bucket_sort._12.while.exit.0:
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 49 fin
  li t3, 16000
  add t3, a0, t3                                                        # ir inst 50 fin
  lw s11, 0(t3)                                                         # ir inst 51 fin
  li t2, 4
  div t3, s11, t2                                                       # ir inst 52 fin
  sw t3, 0(t4)                                                          # ir inst 53 fin
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 54 fin
  lw t3, 0(t4)                                                          # ir inst 55 fin
  li t2, 99
  slt t4, t2, t3                                                        # ir inst 56 fin
  bnez t4, .F._9YlBKTdVw0B_bucket_sort._13.if.then.3
  j .F._9YlBKTdVw0B_bucket_sort._14.if.else.3                           # ir inst 57 fin
.F._9YlBKTdVw0B_bucket_sort._13.if.then.3:
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 58 fin
  li t1, 99
  sw t1, 0(t4)                                                          # ir inst 59 fin
  j .F._9YlBKTdVw0B_bucket_sort._15.if.exit.3                           # ir inst 60 fin
.F._9YlBKTdVw0B_bucket_sort._14.if.else.3:
  j .F._9YlBKTdVw0B_bucket_sort._15.if.exit.3                           # ir inst 61 fin
.F._9YlBKTdVw0B_bucket_sort._15.if.exit.3:
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 62 fin
  lw t3, 0(t4)                                                          # ir inst 63 fin
  li t2, 1
  slt t4, t3, t2                                                        # ir inst 64 fin
  bnez t4, .F._9YlBKTdVw0B_bucket_sort._16.if.then.4
  j .F._9YlBKTdVw0B_bucket_sort._17.if.else.4                           # ir inst 65 fin
.F._9YlBKTdVw0B_bucket_sort._16.if.then.4:
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 66 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 67 fin
  j .F._9YlBKTdVw0B_bucket_sort._18.if.exit.4                           # ir inst 68 fin
.F._9YlBKTdVw0B_bucket_sort._17.if.else.4:
  j .F._9YlBKTdVw0B_bucket_sort._18.if.exit.4                           # ir inst 69 fin
.F._9YlBKTdVw0B_bucket_sort._18.if.exit.4:
  sub t4, t5, t6                                                        # ir inst 70 fin
  addi t5, t4, 1                                                        # ir inst 71 fin
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 72 fin
  lw t3, 0(t4)                                                          # ir inst 73 fin
  div t4, t5, t3                                                        # ir inst 74 fin
  addi t5, t4, 1                                                        # ir inst 75 fin
# Phi connections
  li t4, 0
  j .F._9YlBKTdVw0B_bucket_sort._19.while.cond.1                        # ir inst 76 fin
.F._9YlBKTdVw0B_bucket_sort._19.while.cond.1:
  li t3, 52860
  add t3, a0, t3                                                        # ir inst 78 fin
  lw s11, 0(t3)                                                         # ir inst 79 fin
  slt t3, t4, s11                                                       # ir inst 80 fin
  bnez t3, .F._9YlBKTdVw0B_bucket_sort._20.while.body.1
  j .F._9YlBKTdVw0B_bucket_sort._21.while.exit.1                        # ir inst 81 fin
.F._9YlBKTdVw0B_bucket_sort._20.while.body.1:
  li t3, 52460
  add t3, a0, t3                                                        # ir inst 82 fin
  mv s11, t4                                                            # ir inst 83 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 84 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 85 fin
  addi t3, t4, 1                                                        # ir inst 86 fin
# Phi connections
  mv t4, t3
  j .F._9YlBKTdVw0B_bucket_sort._19.while.cond.1                        # ir inst 87 fin
.F._9YlBKTdVw0B_bucket_sort._21.while.exit.1:
# Phi connections
  li t4, 0
  j .F._9YlBKTdVw0B_bucket_sort._22.while.cond.2                        # ir inst 88 fin
.F._9YlBKTdVw0B_bucket_sort._22.while.cond.2:
  li t3, 16000
  add t3, a0, t3                                                        # ir inst 90 fin
  lw s11, 0(t3)                                                         # ir inst 91 fin
  slt t3, t4, s11                                                       # ir inst 92 fin
  bnez t3, .F._9YlBKTdVw0B_bucket_sort._23.while.body.2
  j .F._9YlBKTdVw0B_bucket_sort._27.while.exit.2                        # ir inst 93 fin
.F._9YlBKTdVw0B_bucket_sort._23.while.body.2:
  addi t3, a0, 0                                                        # ir inst 94 fin
  mv s11, t4                                                            # ir inst 95 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 96 fin
  lw t3, 0(s10)                                                         # ir inst 97 fin
  sub s11, t3, t6                                                       # ir inst 98 fin
  div t3, s11, t5                                                       # ir inst 99 fin
  li s11, 52860
  add s11, a0, s11                                                      # ir inst 100 fin
  lw s10, 0(s11)                                                        # ir inst 101 fin
  slt t0, t3, s10
  xori s11, t0, 1                                                       # ir inst 102 fin
  bnez s11, .F._9YlBKTdVw0B_bucket_sort._24.if.then.5
  j .F._9YlBKTdVw0B_bucket_sort._25.if.else.5                           # ir inst 103 fin
.F._9YlBKTdVw0B_bucket_sort._24.if.then.5:
  li s11, 52860
  add s11, a0, s11                                                      # ir inst 104 fin
  lw s10, 0(s11)                                                        # ir inst 105 fin
  addi s11, s10, -1                                                     # ir inst 106 fin
  li s10, 32460
  add s10, a0, s10                                                      # ir inst 107 fin
  mv s9, s11                                                            # ir inst 108 fin
  li t1, 200
  mul t2, s9, t1
  add s8, s10, t2                                                       # ir inst 109 fin
  li s10, 52460
  add s10, a0, s10                                                      # ir inst 110 fin
  mv s9, s11                                                            # ir inst 111 fin
  slli t2, s9, 2
  add s7, s10, t2                                                       # ir inst 112 fin
  lw s10, 0(s7)                                                         # ir inst 113 fin
  mv s9, s10                                                            # ir inst 114 fin
  slli t2, s9, 2
  add s10, s8, t2                                                       # ir inst 115 fin
  addi s9, a0, 0                                                        # ir inst 116 fin
  mv s8, t4                                                             # ir inst 117 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 118 fin
  lw s9, 0(s7)                                                          # ir inst 119 fin
  sw s9, 0(s10)                                                         # ir inst 120 fin
  li s10, 52460
  add s10, a0, s10                                                      # ir inst 121 fin
  mv s9, s11                                                            # ir inst 122 fin
  slli t2, s9, 2
  add s11, s10, t2                                                      # ir inst 123 fin
  lw s10, 0(s11)                                                        # ir inst 124 fin
  addi s9, s10, 1                                                       # ir inst 125 fin
  sw s9, 0(s11)                                                         # ir inst 126 fin
  j .F._9YlBKTdVw0B_bucket_sort._26.if.exit.5                           # ir inst 127 fin
.F._9YlBKTdVw0B_bucket_sort._25.if.else.5:
  li s11, 32460
  add s11, a0, s11                                                      # ir inst 128 fin
  mv s10, t3                                                            # ir inst 129 fin
  li t1, 200
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 130 fin
  li s11, 52460
  add s11, a0, s11                                                      # ir inst 131 fin
  mv s10, t3                                                            # ir inst 132 fin
  slli t2, s10, 2
  add s8, s11, t2                                                       # ir inst 133 fin
  lw s11, 0(s8)                                                         # ir inst 134 fin
  mv s10, s11                                                           # ir inst 135 fin
  slli t2, s10, 2
  add s11, s9, t2                                                       # ir inst 136 fin
  addi s10, a0, 0                                                       # ir inst 137 fin
  mv s9, t4                                                             # ir inst 138 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 139 fin
  lw s10, 0(s8)                                                         # ir inst 140 fin
  sw s10, 0(s11)                                                        # ir inst 141 fin
  li s11, 52460
  add s11, a0, s11                                                      # ir inst 142 fin
  mv s10, t3                                                            # ir inst 143 fin
  slli t2, s10, 2
  add t3, s11, t2                                                       # ir inst 144 fin
  lw s11, 0(t3)                                                         # ir inst 145 fin
  addi s10, s11, 1                                                      # ir inst 146 fin
  sw s10, 0(t3)                                                         # ir inst 147 fin
  j .F._9YlBKTdVw0B_bucket_sort._26.if.exit.5                           # ir inst 148 fin
.F._9YlBKTdVw0B_bucket_sort._26.if.exit.5:
  addi t3, t4, 1                                                        # ir inst 149 fin
# Phi connections
  mv t4, t3
  j .F._9YlBKTdVw0B_bucket_sort._22.while.cond.2                        # ir inst 150 fin
.F._9YlBKTdVw0B_bucket_sort._27.while.exit.2:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_bucket_sort._28.while.cond.3                        # ir inst 151 fin
.F._9YlBKTdVw0B_bucket_sort._28.while.cond.3:
  li t5, 52860
  add t5, a0, t5                                                        # ir inst 153 fin
  lw t4, 0(t5)                                                          # ir inst 154 fin
  slt t5, t6, t4                                                        # ir inst 155 fin
  bnez t5, .F._9YlBKTdVw0B_bucket_sort._29.while.body.3
  j .F._9YlBKTdVw0B_bucket_sort._30.while.exit.3                        # ir inst 156 fin
.F._9YlBKTdVw0B_bucket_sort._29.while.body.3:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F._9YlBKTdVw0B_insertion_sort_bucket
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 157 fin
  addi t5, t6, 1                                                        # ir inst 158 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_bucket_sort._28.while.cond.3                        # ir inst 159 fin
.F._9YlBKTdVw0B_bucket_sort._30.while.exit.3:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._9YlBKTdVw0B_bucket_sort._31.while.cond.4                        # ir inst 160 fin
.F._9YlBKTdVw0B_bucket_sort._31.while.cond.4:
  li t4, 52860
  add t4, a0, t4                                                        # ir inst 163 fin
  lw t3, 0(t4)                                                          # ir inst 164 fin
  slt t4, t6, t3                                                        # ir inst 165 fin
  bnez t4, .F._9YlBKTdVw0B_bucket_sort._32.while.body.4
  j .F._9YlBKTdVw0B_bucket_sort._36.while.exit.4                        # ir inst 166 fin
.F._9YlBKTdVw0B_bucket_sort._32.while.body.4:
# Phi connections
  mv t4, t5
  li t5, 0
  j .F._9YlBKTdVw0B_bucket_sort._33.while.cond.5                        # ir inst 167 fin
.F._9YlBKTdVw0B_bucket_sort._33.while.cond.5:
  li t3, 52460
  add t3, a0, t3                                                        # ir inst 170 fin
  mv s11, t6                                                            # ir inst 171 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 172 fin
  lw t3, 0(s10)                                                         # ir inst 173 fin
  slt s11, t5, t3                                                       # ir inst 174 fin
  bnez s11, .F._9YlBKTdVw0B_bucket_sort._34.while.body.5
  j .F._9YlBKTdVw0B_bucket_sort._35.while.exit.5                        # ir inst 175 fin
.F._9YlBKTdVw0B_bucket_sort._34.while.body.5:
  addi t3, a0, 0                                                        # ir inst 176 fin
  mv s11, t4                                                            # ir inst 177 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 178 fin
  li t3, 32460
  add t3, a0, t3                                                        # ir inst 179 fin
  mv s11, t6                                                            # ir inst 180 fin
  li t1, 200
  mul t2, s11, t1
  add s9, t3, t2                                                        # ir inst 181 fin
  mv t3, t5                                                             # ir inst 182 fin
  slli t2, t3, 2
  add s11, s9, t2                                                       # ir inst 183 fin
  lw t3, 0(s11)                                                         # ir inst 184 fin
  sw t3, 0(s10)                                                         # ir inst 185 fin
  addi t3, t4, 1                                                        # ir inst 186 fin
  addi s11, t5, 1                                                       # ir inst 187 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F._9YlBKTdVw0B_bucket_sort._33.while.cond.5                        # ir inst 188 fin
.F._9YlBKTdVw0B_bucket_sort._35.while.exit.5:
  addi t5, t6, 1                                                        # ir inst 189 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F._9YlBKTdVw0B_bucket_sort._31.while.cond.4                        # ir inst 190 fin
.F._9YlBKTdVw0B_bucket_sort._36.while.exit.4:
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 191 fin
  lw t5, 0(t6)                                                          # ir inst 192 fin
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 193 fin
  lw t3, 0(t4)                                                          # ir inst 194 fin
  slli t4, t3, 1                                                        # ir inst 195 fin
  add t3, t5, t4                                                        # ir inst 196 fin
  sw t3, 0(t6)                                                          # ir inst 197 fin
  j .F._9YlBKTdVw0B_bucket_sort.epilogue                                # ir inst 198 fin
.F._9YlBKTdVw0B_bucket_sort.epilogue:
  ld ra, 56(sp)
  ld s7, 16(sp)
  ld s8, 24(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F._9YlBKTdVw0B_insertion_sort_bucket
.F._9YlBKTdVw0B_insertion_sort_bucket:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s8, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
.F._9YlBKTdVw0B_insertion_sort_bucket._0.entry.0:
  li t6, 52460
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
# Phi connections
  li t5, 1
  j .F._9YlBKTdVw0B_insertion_sort_bucket._1.while.cond.0               # ir inst 5 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._1.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 7 fin
  bnez t4, .F._9YlBKTdVw0B_insertion_sort_bucket._2.while.body.0
  j .F._9YlBKTdVw0B_insertion_sort_bucket._9.while.exit.0               # ir inst 8 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._2.while.body.0:
  li t4, 32460
  add t4, a0, t4                                                        # ir inst 9 fin
  mv t3, a1                                                             # ir inst 10 fin
  li t1, 200
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 11 fin
  mv t4, t5                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 13 fin
  lw t4, 0(t3)                                                          # ir inst 14 fin
  addi t3, t5, -1                                                       # ir inst 15 fin
# Phi connections
  j .F._9YlBKTdVw0B_insertion_sort_bucket._3.while.cond.1               # ir inst 16 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._3.while.cond.1:
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 18 fin
  bnez s11, .F._9YlBKTdVw0B_insertion_sort_bucket._4.lazy.then.0
  j .F._9YlBKTdVw0B_insertion_sort_bucket._5.lazy.else.0                # ir inst 19 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._4.lazy.then.0:
  li s11, 32460
  add s11, a0, s11                                                      # ir inst 20 fin
  mv s10, a1                                                            # ir inst 21 fin
  li t1, 200
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 22 fin
  mv s11, t3                                                            # ir inst 23 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 24 fin
  lw s11, 0(s10)                                                        # ir inst 25 fin
  slt s10, t4, s11                                                      # ir inst 26 fin
# Phi connections
  mv s11, s10
  j .F._9YlBKTdVw0B_insertion_sort_bucket._6.lazy.exit.0                # ir inst 27 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._5.lazy.else.0:
# Phi connections
  li s11, 0
  j .F._9YlBKTdVw0B_insertion_sort_bucket._6.lazy.exit.0                # ir inst 28 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._6.lazy.exit.0:
  bnez s11, .F._9YlBKTdVw0B_insertion_sort_bucket._7.while.body.1
  j .F._9YlBKTdVw0B_insertion_sort_bucket._8.while.exit.1               # ir inst 30 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._7.while.body.1:
  li s11, 32460
  add s11, a0, s11                                                      # ir inst 31 fin
  mv s10, a1                                                            # ir inst 32 fin
  li t1, 200
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 33 fin
  addi s11, t3, 1                                                       # ir inst 34 fin
  mv s10, s11                                                           # ir inst 35 fin
  slli t2, s10, 2
  add s11, s9, t2                                                       # ir inst 36 fin
  li s10, 32460
  add s10, a0, s10                                                      # ir inst 37 fin
  mv s9, a1                                                             # ir inst 38 fin
  li t1, 200
  mul t2, s9, t1
  add s8, s10, t2                                                       # ir inst 39 fin
  mv s10, t3                                                            # ir inst 40 fin
  slli t2, s10, 2
  add s9, s8, t2                                                        # ir inst 41 fin
  lw s10, 0(s9)                                                         # ir inst 42 fin
  sw s10, 0(s11)                                                        # ir inst 43 fin
  addi s11, t3, -1                                                      # ir inst 44 fin
  li s10, 16004
  add s10, a0, s10                                                      # ir inst 45 fin
  lw s9, 0(s10)                                                         # ir inst 46 fin
  addi s8, s9, 1                                                        # ir inst 47 fin
  sw s8, 0(s10)                                                         # ir inst 48 fin
  li s10, 16012
  add s10, a0, s10                                                      # ir inst 49 fin
  lw s9, 0(s10)                                                         # ir inst 50 fin
  addi s8, s9, 1                                                        # ir inst 51 fin
  sw s8, 0(s10)                                                         # ir inst 52 fin
# Phi connections
  mv t3, s11
  j .F._9YlBKTdVw0B_insertion_sort_bucket._3.while.cond.1               # ir inst 53 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._8.while.exit.1:
  li s11, 32460
  add s11, a0, s11                                                      # ir inst 54 fin
  mv s10, a1                                                            # ir inst 55 fin
  li t1, 200
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 56 fin
  addi s11, t3, 1                                                       # ir inst 57 fin
  mv t3, s11                                                            # ir inst 58 fin
  slli t2, t3, 2
  add s11, s9, t2                                                       # ir inst 59 fin
  sw t4, 0(s11)                                                         # ir inst 60 fin
  addi t4, t5, 1                                                        # ir inst 61 fin
  li t5, 16012
  add t5, a0, t5                                                        # ir inst 62 fin
  lw t3, 0(t5)                                                          # ir inst 63 fin
  addi s11, t3, 1                                                       # ir inst 64 fin
  sw s11, 0(t5)                                                         # ir inst 65 fin
# Phi connections
  mv t5, t4
  j .F._9YlBKTdVw0B_insertion_sort_bucket._1.while.cond.0               # ir inst 66 fin
.F._9YlBKTdVw0B_insertion_sort_bucket._9.while.exit.0:
  j .F._9YlBKTdVw0B_insertion_sort_bucket.epilogue                      # ir inst 67 fin
.F._9YlBKTdVw0B_insertion_sort_bucket.epilogue:
  ld s8, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._9YlBKTdVw0B_analyze_sorted_array
.F._9YlBKTdVw0B_analyze_sorted_array:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s8, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
.F._9YlBKTdVw0B_analyze_sorted_array._0.entry.0:
# Phi connections
  li t6, 1
  j .F._9YlBKTdVw0B_analyze_sorted_array._1.while.cond.0                # ir inst 1 fin
.F._9YlBKTdVw0B_analyze_sorted_array._1.while.cond.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._9YlBKTdVw0B_analyze_sorted_array._2.while.body.0
  j .F._9YlBKTdVw0B_analyze_sorted_array._22.critical_edge.0            # ir inst 6 fin
.F._9YlBKTdVw0B_analyze_sorted_array._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  lw t5, 0(t3)                                                          # ir inst 10 fin
  addi t4, a0, 0                                                        # ir inst 11 fin
  addi t3, t6, -1                                                       # ir inst 12 fin
  mv s11, t3                                                            # ir inst 13 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  slt t3, t5, t4                                                        # ir inst 16 fin
  bnez t3, .F._9YlBKTdVw0B_analyze_sorted_array._3.if.then.0
  j .F._9YlBKTdVw0B_analyze_sorted_array._4.if.else.0                   # ir inst 17 fin
.F._9YlBKTdVw0B_analyze_sorted_array._3.if.then.0:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_analyze_sorted_array._6.while.exit.0                # ir inst 18 fin
.F._9YlBKTdVw0B_analyze_sorted_array._4.if.else.0:
  j .F._9YlBKTdVw0B_analyze_sorted_array._5.if.exit.0                   # ir inst 19 fin
.F._9YlBKTdVw0B_analyze_sorted_array._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F._9YlBKTdVw0B_analyze_sorted_array._1.while.cond.0                # ir inst 21 fin
.F._9YlBKTdVw0B_analyze_sorted_array._6.while.exit.0:
  bnez t6, .F._9YlBKTdVw0B_analyze_sorted_array._7.if.then.1
  j .F._9YlBKTdVw0B_analyze_sorted_array._8.if.else.1                   # ir inst 23 fin
.F._9YlBKTdVw0B_analyze_sorted_array._7.if.then.1:
# Phi connections
  li t6, 1000
  j .F._9YlBKTdVw0B_analyze_sorted_array._9.if.exit.1                   # ir inst 24 fin
.F._9YlBKTdVw0B_analyze_sorted_array._8.if.else.1:
# Phi connections
  li t6, 0
  j .F._9YlBKTdVw0B_analyze_sorted_array._9.if.exit.1                   # ir inst 25 fin
.F._9YlBKTdVw0B_analyze_sorted_array._9.if.exit.1:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  j .F._9YlBKTdVw0B_analyze_sorted_array._10.while.cond.1               # ir inst 27 fin
.F._9YlBKTdVw0B_analyze_sorted_array._10.while.cond.1:
  li s11, 16000
  add s11, a0, s11                                                      # ir inst 31 fin
  lw s10, 0(s11)                                                        # ir inst 32 fin
  slt s11, t3, s10                                                      # ir inst 33 fin
  bnez s11, .F._9YlBKTdVw0B_analyze_sorted_array._11.while.body.1
  j .F._9YlBKTdVw0B_analyze_sorted_array._18.while.exit.1               # ir inst 34 fin
.F._9YlBKTdVw0B_analyze_sorted_array._11.while.body.1:
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 35 fin
  bnez s11, .F._9YlBKTdVw0B_analyze_sorted_array._12.lazy.then.0
  j .F._9YlBKTdVw0B_analyze_sorted_array._13.lazy.else.0                # ir inst 36 fin
.F._9YlBKTdVw0B_analyze_sorted_array._12.lazy.then.0:
# Phi connections
  li s11, 1
  j .F._9YlBKTdVw0B_analyze_sorted_array._14.lazy.exit.0                # ir inst 37 fin
.F._9YlBKTdVw0B_analyze_sorted_array._13.lazy.else.0:
  addi s11, a0, 0                                                       # ir inst 38 fin
  mv s10, t3                                                            # ir inst 39 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 40 fin
  lw s11, 0(s9)                                                         # ir inst 41 fin
  addi s10, a0, 0                                                       # ir inst 42 fin
  addi s9, t3, -1                                                       # ir inst 43 fin
  mv s8, s9                                                             # ir inst 44 fin
  slli t2, s8, 2
  add s9, s10, t2                                                       # ir inst 45 fin
  lw s10, 0(s9)                                                         # ir inst 46 fin
  xor t0, s11, s10
  sltu s9, zero, t0                                                     # ir inst 47 fin
# Phi connections
  mv s11, s9
  j .F._9YlBKTdVw0B_analyze_sorted_array._14.lazy.exit.0                # ir inst 48 fin
.F._9YlBKTdVw0B_analyze_sorted_array._14.lazy.exit.0:
  bnez s11, .F._9YlBKTdVw0B_analyze_sorted_array._15.if.then.2
  j .F._9YlBKTdVw0B_analyze_sorted_array._16.if.else.2                  # ir inst 50 fin
.F._9YlBKTdVw0B_analyze_sorted_array._15.if.then.2:
  addi s11, t4, 1                                                       # ir inst 51 fin
# Phi connections
  mv s10, s11
  mv s11, t5
  j .F._9YlBKTdVw0B_analyze_sorted_array._17.if.exit.2                  # ir inst 52 fin
.F._9YlBKTdVw0B_analyze_sorted_array._16.if.else.2:
  addi s11, t5, 1                                                       # ir inst 53 fin
# Phi connections
  mv s10, t4
  j .F._9YlBKTdVw0B_analyze_sorted_array._17.if.exit.2                  # ir inst 54 fin
.F._9YlBKTdVw0B_analyze_sorted_array._17.if.exit.2:
  addi s9, t3, 1                                                        # ir inst 57 fin
# Phi connections
  mv t3, s9
  mv t4, s10
  mv t5, s11
  j .F._9YlBKTdVw0B_analyze_sorted_array._10.while.cond.1               # ir inst 58 fin
.F._9YlBKTdVw0B_analyze_sorted_array._18.while.exit.1:
  li t2, 10
  mul t3, t4, t2                                                        # ir inst 59 fin
  li t2, 5
  mul t4, t5, t2                                                        # ir inst 60 fin
  add t5, t3, t4                                                        # ir inst 61 fin
  add t4, t6, t5                                                        # ir inst 62 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 63 fin
  lw t5, 0(t6)                                                          # ir inst 64 fin
  li t2, 2
  rem t6, t5, t2                                                        # ir inst 65 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 66 fin
  bnez t5, .F._9YlBKTdVw0B_analyze_sorted_array._19.if.then.3
  j .F._9YlBKTdVw0B_analyze_sorted_array._20.if.else.3                  # ir inst 67 fin
.F._9YlBKTdVw0B_analyze_sorted_array._19.if.then.3:
  addi t6, a0, 0                                                        # ir inst 68 fin
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 69 fin
  lw t3, 0(t5)                                                          # ir inst 70 fin
  li t2, 2
  div t5, t3, t2                                                        # ir inst 71 fin
  addi t3, t5, -1                                                       # ir inst 72 fin
  mv t5, t3                                                             # ir inst 73 fin
  slli t2, t5, 2
  add t3, t6, t2                                                        # ir inst 74 fin
  lw t6, 0(t3)                                                          # ir inst 75 fin
  addi t5, a0, 0                                                        # ir inst 76 fin
  li t3, 16000
  add t3, a0, t3                                                        # ir inst 77 fin
  lw s11, 0(t3)                                                         # ir inst 78 fin
  li t2, 2
  div t3, s11, t2                                                       # ir inst 79 fin
  mv s11, t3                                                            # ir inst 80 fin
  slli t2, s11, 2
  add t3, t5, t2                                                        # ir inst 81 fin
  lw t5, 0(t3)                                                          # ir inst 82 fin
  add t3, t6, t5                                                        # ir inst 83 fin
  li t2, 2
  div t6, t3, t2                                                        # ir inst 84 fin
# Phi connections
  j .F._9YlBKTdVw0B_analyze_sorted_array._21.if.exit.3                  # ir inst 85 fin
.F._9YlBKTdVw0B_analyze_sorted_array._20.if.else.3:
  addi t6, a0, 0                                                        # ir inst 86 fin
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 87 fin
  lw t3, 0(t5)                                                          # ir inst 88 fin
  li t2, 2
  div t5, t3, t2                                                        # ir inst 89 fin
  mv t3, t5                                                             # ir inst 90 fin
  slli t2, t3, 2
  add t5, t6, t2                                                        # ir inst 91 fin
  lw t6, 0(t5)                                                          # ir inst 92 fin
# Phi connections
  j .F._9YlBKTdVw0B_analyze_sorted_array._21.if.exit.3                  # ir inst 93 fin
.F._9YlBKTdVw0B_analyze_sorted_array._21.if.exit.3:
  add t5, t4, t6                                                        # ir inst 95 fin
  mv a0, t5
  j .F._9YlBKTdVw0B_analyze_sorted_array.epilogue                       # ir inst 96 fin
.F._9YlBKTdVw0B_analyze_sorted_array._22.critical_edge.0:
# Phi connections
  li t6, 1
  j .F._9YlBKTdVw0B_analyze_sorted_array._6.while.exit.0                # ir inst 97 fin
.F._9YlBKTdVw0B_analyze_sorted_array.epilogue:
  ld s8, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._9YlBKTdVw0B_run_comprehensive_tests
.F._9YlBKTdVw0B_run_comprehensive_tests:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd s10, 32(sp)
  sd ra, 40(sp)
.F._9YlBKTdVw0B_run_comprehensive_tests._0.entry.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_copy_to_temp
  ld a0, 0(sp)
# ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_reset_statistics
  ld a0, 0(sp)
# ir inst 5 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  addi t6, t5, -1                                                       # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  li a1, 0
  call .F._9YlBKTdVw0B_merge_sort
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 9 fin
  li t6, 52864
  add t6, a0, t6                                                        # ir inst 10 fin
  addi t5, t6, 0                                                        # ir inst 11 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 12 fin
  lw t4, 0(t6)                                                          # ir inst 13 fin
  li t6, 16008
  add t6, a0, t6                                                        # ir inst 14 fin
  lw t3, 0(t6)                                                          # ir inst 15 fin
  add t6, t4, t3                                                        # ir inst 16 fin
  sw t6, 0(t5)                                                          # ir inst 17 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 18 fin
  addi t5, t6, 0                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  call .F._9YlBKTdVw0B_analyze_sorted_array
  mv t6, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 20 fin
  sw t6, 0(t5)                                                          # ir inst 21 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 22 fin
  addi t5, t6, 0                                                        # ir inst 23 fin
  lw t6, 0(t5)                                                          # ir inst 24 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 25 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_restore_from_temp
  ld a0, 0(sp)
# ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_reset_statistics
  ld a0, 0(sp)
# ir inst 27 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 28 fin
  lw t5, 0(t6)                                                          # ir inst 29 fin
  addi t6, t5, -1                                                       # ir inst 30 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  li a1, 0
  call .F._9YlBKTdVw0B_quick_sort_3way
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 31 fin
  li t6, 52864
  add t6, a0, t6                                                        # ir inst 32 fin
  addi t5, t6, 4                                                        # ir inst 33 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 34 fin
  lw t4, 0(t6)                                                          # ir inst 35 fin
  li t6, 16008
  add t6, a0, t6                                                        # ir inst 36 fin
  lw t3, 0(t6)                                                          # ir inst 37 fin
  add t6, t4, t3                                                        # ir inst 38 fin
  sw t6, 0(t5)                                                          # ir inst 39 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 40 fin
  addi t5, t6, 4                                                        # ir inst 41 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  call .F._9YlBKTdVw0B_analyze_sorted_array
  mv t6, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 42 fin
  sw t6, 0(t5)                                                          # ir inst 43 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 44 fin
  addi t5, t6, 4                                                        # ir inst 45 fin
  lw t6, 0(t5)                                                          # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 47 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_restore_from_temp
  ld a0, 0(sp)
# ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_reset_statistics
  ld a0, 0(sp)
# ir inst 49 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_heap_sort
  ld a0, 0(sp)
# ir inst 50 fin
  li t6, 52864
  add t6, a0, t6                                                        # ir inst 51 fin
  addi t5, t6, 8                                                        # ir inst 52 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 53 fin
  lw t4, 0(t6)                                                          # ir inst 54 fin
  li t6, 16008
  add t6, a0, t6                                                        # ir inst 55 fin
  lw t3, 0(t6)                                                          # ir inst 56 fin
  add t6, t4, t3                                                        # ir inst 57 fin
  sw t6, 0(t5)                                                          # ir inst 58 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 59 fin
  addi t5, t6, 8                                                        # ir inst 60 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  call .F._9YlBKTdVw0B_analyze_sorted_array
  mv t6, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 61 fin
  sw t6, 0(t5)                                                          # ir inst 62 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 63 fin
  addi t5, t6, 8                                                        # ir inst 64 fin
  lw t6, 0(t5)                                                          # ir inst 65 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 66 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_restore_from_temp
  ld a0, 0(sp)
# ir inst 67 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_reset_statistics
  ld a0, 0(sp)
# ir inst 68 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_radix_sort
  ld a0, 0(sp)
# ir inst 69 fin
  li t6, 52864
  add t6, a0, t6                                                        # ir inst 70 fin
  addi t5, t6, 12                                                       # ir inst 71 fin
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 72 fin
  lw t4, 0(t6)                                                          # ir inst 73 fin
  sw t4, 0(t5)                                                          # ir inst 74 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 75 fin
  addi t5, t6, 12                                                       # ir inst 76 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  call .F._9YlBKTdVw0B_analyze_sorted_array
  mv t6, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 77 fin
  sw t6, 0(t5)                                                          # ir inst 78 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 79 fin
  addi t5, t6, 12                                                       # ir inst 80 fin
  lw t6, 0(t5)                                                          # ir inst 81 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 82 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_restore_from_temp
  ld a0, 0(sp)
# ir inst 83 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_reset_statistics
  ld a0, 0(sp)
# ir inst 84 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._9YlBKTdVw0B_bucket_sort
  ld a0, 0(sp)
# ir inst 85 fin
  li t6, 52864
  add t6, a0, t6                                                        # ir inst 86 fin
  addi t5, t6, 16                                                       # ir inst 87 fin
  li t6, 16012
  add t6, a0, t6                                                        # ir inst 88 fin
  lw t4, 0(t6)                                                          # ir inst 89 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 90 fin
  lw t3, 0(t6)                                                          # ir inst 91 fin
  add t6, t4, t3                                                        # ir inst 92 fin
  sw t6, 0(t5)                                                          # ir inst 93 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 94 fin
  addi t5, t6, 16                                                       # ir inst 95 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  call .F._9YlBKTdVw0B_analyze_sorted_array
  mv t6, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 96 fin
  sw t6, 0(t5)                                                          # ir inst 97 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 98 fin
  addi t5, t6, 16                                                       # ir inst 99 fin
  lw t6, 0(t5)                                                          # ir inst 100 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 101 fin
  li t6, 52904
  add t6, a0, t6                                                        # ir inst 102 fin
  addi t5, t6, 0                                                        # ir inst 103 fin
  lw t6, 0(t5)                                                          # ir inst 104 fin
# Phi connections
  li t4, 0
  li t5, 1
  j .F._9YlBKTdVw0B_run_comprehensive_tests._1.while.cond.0             # ir inst 105 fin
.F._9YlBKTdVw0B_run_comprehensive_tests._1.while.cond.0:
  li t2, 5
  slt t3, t5, t2                                                        # ir inst 109 fin
  bnez t3, .F._9YlBKTdVw0B_run_comprehensive_tests._2.while.body.0
  j .F._9YlBKTdVw0B_run_comprehensive_tests._6.while.exit.0             # ir inst 110 fin
.F._9YlBKTdVw0B_run_comprehensive_tests._2.while.body.0:
  li t3, 52904
  add t3, a0, t3                                                        # ir inst 111 fin
  mv s11, t5                                                            # ir inst 112 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 113 fin
  lw t3, 0(s10)                                                         # ir inst 114 fin
  slt s11, t6, t3                                                       # ir inst 115 fin
  bnez s11, .F._9YlBKTdVw0B_run_comprehensive_tests._3.if.then.0
  j .F._9YlBKTdVw0B_run_comprehensive_tests._4.if.else.0                # ir inst 116 fin
.F._9YlBKTdVw0B_run_comprehensive_tests._3.if.then.0:
  li t3, 52904
  add t3, a0, t3                                                        # ir inst 117 fin
  mv s11, t5                                                            # ir inst 118 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 119 fin
  lw t3, 0(s10)                                                         # ir inst 120 fin
# Phi connections
  mv s11, t5
  j .F._9YlBKTdVw0B_run_comprehensive_tests._5.if.exit.0                # ir inst 121 fin
.F._9YlBKTdVw0B_run_comprehensive_tests._4.if.else.0:
# Phi connections
  mv s11, t4
  mv t3, t6
  j .F._9YlBKTdVw0B_run_comprehensive_tests._5.if.exit.0                # ir inst 122 fin
.F._9YlBKTdVw0B_run_comprehensive_tests._5.if.exit.0:
  addi s10, t5, 1                                                       # ir inst 125 fin
# Phi connections
  mv t4, s11
  mv t5, s10
  mv t6, t3
  j .F._9YlBKTdVw0B_run_comprehensive_tests._1.while.cond.0             # ir inst 126 fin
.F._9YlBKTdVw0B_run_comprehensive_tests._6.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 127 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 128 fin
  j .F._9YlBKTdVw0B_run_comprehensive_tests.epilogue                    # ir inst 129 fin
.F._9YlBKTdVw0B_run_comprehensive_tests.epilogue:
  ld ra, 40(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._cVm90zWktlg_new
.F._cVm90zWktlg_new:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       40(sp) -      440(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd ra, 32(sp)
.F._cVm90zWktlg_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_new._1.array.cond.0                                 # ir inst 3 fin
.F._cVm90zWktlg_new._1.array.cond.0:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F._cVm90zWktlg_new._2.array.body.0
  j .F._cVm90zWktlg_new._3.array.exit.0                                 # ir inst 6 fin
.F._cVm90zWktlg_new._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F._cVm90zWktlg_new._1.array.cond.0                                 # ir inst 10 fin
.F._cVm90zWktlg_new._3.array.exit.0:
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 11 fin
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_new._4.array.cond.1                                 # ir inst 13 fin
.F._cVm90zWktlg_new._4.array.cond.1:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F._cVm90zWktlg_new._5.array.body.1
  j .F._cVm90zWktlg_new._6.array.exit.1                                 # ir inst 16 fin
.F._cVm90zWktlg_new._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F._cVm90zWktlg_new._4.array.cond.1                                 # ir inst 20 fin
.F._cVm90zWktlg_new._6.array.exit.1:
  li t6, 8000
  add t6, a0, t6                                                        # ir inst 21 fin
  addi t5, t6, 0                                                        # ir inst 22 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_new._7.array.cond.2                                 # ir inst 23 fin
.F._cVm90zWktlg_new._7.array.cond.2:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 25 fin
  bnez t4, .F._cVm90zWktlg_new._8.array.body.2
  j .F._cVm90zWktlg_new._9.array.exit.2                                 # ir inst 26 fin
.F._cVm90zWktlg_new._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t4
  j .F._cVm90zWktlg_new._7.array.cond.2                                 # ir inst 30 fin
.F._cVm90zWktlg_new._9.array.exit.2:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 31 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 32 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 33 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 35 fin
# Phi connections
  li t4, 0
  j .F._cVm90zWktlg_new._10.array.cond.3                                # ir inst 36 fin
.F._cVm90zWktlg_new._10.array.cond.3:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 38 fin
  bnez t3, .F._cVm90zWktlg_new._11.array.body.3
  j .F._cVm90zWktlg_new._12.array.exit.3                                # ir inst 39 fin
.F._cVm90zWktlg_new._11.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 40 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 41 fin
  addi t3, t4, 1                                                        # ir inst 42 fin
# Phi connections
  mv t4, t3
  j .F._cVm90zWktlg_new._10.array.cond.3                                # ir inst 43 fin
.F._cVm90zWktlg_new._12.array.exit.3:
  addi t5, t6, 0                                                        # ir inst 44 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_new._13.array.cond.4                                # ir inst 45 fin
.F._cVm90zWktlg_new._13.array.cond.4:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 47 fin
  bnez t4, .F._cVm90zWktlg_new._14.array.body.4
  j .F._cVm90zWktlg_new._15.array.exit.4                                # ir inst 48 fin
.F._cVm90zWktlg_new._14.array.body.4:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 49 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  addi t1, sp, 40
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 50 fin
  addi t4, t6, 1                                                        # ir inst 51 fin
# Phi connections
  mv t6, t4
  j .F._cVm90zWktlg_new._13.array.cond.4                                # ir inst 52 fin
.F._cVm90zWktlg_new._15.array.exit.4:
  li t6, 56004
  add t6, a0, t6                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 54 fin
  li t6, 56008
  add t6, a0, t6                                                        # ir inst 55 fin
  addi t5, t6, 0                                                        # ir inst 56 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_new._16.array.cond.5                                # ir inst 57 fin
.F._cVm90zWktlg_new._16.array.cond.5:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 59 fin
  bnez t4, .F._cVm90zWktlg_new._17.array.body.5
  j .F._cVm90zWktlg_new._18.array.exit.5                                # ir inst 60 fin
.F._cVm90zWktlg_new._17.array.body.5:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 62 fin
  addi t4, t6, 1                                                        # ir inst 63 fin
# Phi connections
  mv t6, t4
  j .F._cVm90zWktlg_new._16.array.cond.5                                # ir inst 64 fin
.F._cVm90zWktlg_new._18.array.exit.5:
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 65 fin
  addi t5, t6, 0                                                        # ir inst 66 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_new._19.array.cond.6                                # ir inst 67 fin
.F._cVm90zWktlg_new._19.array.cond.6:
  li t2, 20
  slt t4, t6, t2                                                        # ir inst 69 fin
  bnez t4, .F._cVm90zWktlg_new._20.array.body.6
  j .F._cVm90zWktlg_new._21.array.exit.6                                # ir inst 70 fin
.F._cVm90zWktlg_new._20.array.body.6:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 71 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 72 fin
  addi t4, t6, 1                                                        # ir inst 73 fin
# Phi connections
  mv t6, t4
  j .F._cVm90zWktlg_new._19.array.cond.6                                # ir inst 74 fin
.F._cVm90zWktlg_new._21.array.exit.6:
  j .F._cVm90zWktlg_new.epilogue                                        # ir inst 75 fin
.F._cVm90zWktlg_new.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 448
  ret

.globl .F._cVm90zWktlg_perform_advanced_operations
.F._cVm90zWktlg_perform_advanced_operations:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 1 / 12,        range:        8(sp) -       16(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 8(sp)
  sd ra, 16(sp)
.F._cVm90zWktlg_perform_advanced_operations._0.entry.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 1 fin
  li t5, 16000
  add t5, a1, t5                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  sw t4, 0(t6)                                                          # ir inst 4 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_perform_advanced_operations._1.while.cond.0         # ir inst 5 fin
.F._cVm90zWktlg_perform_advanced_operations._1.while.cond.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 7 fin
  lw t4, 0(t5)                                                          # ir inst 8 fin
  slt t5, t6, t4                                                        # ir inst 9 fin
  bnez t5, .F._cVm90zWktlg_perform_advanced_operations._2.while.body.0
  j .F._cVm90zWktlg_perform_advanced_operations._3.while.exit.0         # ir inst 10 fin
.F._cVm90zWktlg_perform_advanced_operations._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, a1, 0                                                        # ir inst 14 fin
  mv t4, t6                                                             # ir inst 15 fin
  slli t2, t4, 2
  add s11, t5, t2                                                       # ir inst 16 fin
  lw t5, 0(s11)                                                         # ir inst 17 fin
  sw t5, 0(t3)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F._cVm90zWktlg_perform_advanced_operations._1.while.cond.0         # ir inst 20 fin
.F._cVm90zWktlg_perform_advanced_operations._3.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._cVm90zWktlg_generate_fibonacci_transform
  ld a0, 0(sp)
# ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._cVm90zWktlg_apply_mathematical_operations
  ld a0, 0(sp)
# ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._cVm90zWktlg_perform_statistical_analysis
  ld a0, 0(sp)
# ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._cVm90zWktlg_execute_matrix_operations
  ld a0, 0(sp)
# ir inst 24 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._cVm90zWktlg_output_analysis_results
  ld a0, 0(sp)
# ir inst 25 fin
  j .F._cVm90zWktlg_perform_advanced_operations.epilogue                # ir inst 26 fin
.F._cVm90zWktlg_perform_advanced_operations.epilogue:
  ld ra, 16(sp)
  ld s11, 8(sp)
  addi sp, sp, 32
  ret

.globl .F._cVm90zWktlg_generate_fibonacci_transform
.F._cVm90zWktlg_generate_fibonacci_transform:
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
.F._cVm90zWktlg_generate_fibonacci_transform._0.entry.0:
# Phi connections
  li t4, 1
  li t5, 1
  li t6, 0
  j .F._cVm90zWktlg_generate_fibonacci_transform._1.while.cond.0        # ir inst 1 fin
.F._cVm90zWktlg_generate_fibonacci_transform._1.while.cond.0:
  li t3, 16000
  add t3, a0, t3                                                        # ir inst 5 fin
  lw s11, 0(t3)                                                         # ir inst 6 fin
  slt t3, t6, s11                                                       # ir inst 7 fin
  bnez t3, .F._cVm90zWktlg_generate_fibonacci_transform._2.while.body.0
  j .F._cVm90zWktlg_generate_fibonacci_transform._6.while.exit.0        # ir inst 8 fin
.F._cVm90zWktlg_generate_fibonacci_transform._2.while.body.0:
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 9 fin
  mv s11, t6                                                            # ir inst 10 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 11 fin
  addi t3, a0, 0                                                        # ir inst 12 fin
  mv s11, t6                                                            # ir inst 13 fin
  slli t2, s11, 2
  add s9, t3, t2                                                        # ir inst 14 fin
  lw t3, 0(s9)                                                          # ir inst 15 fin
  mul s11, t3, t5                                                       # ir inst 16 fin
  li t2, 1000000
  rem t3, s11, t2                                                       # ir inst 17 fin
  sw t3, 0(s10)                                                         # ir inst 18 fin
  add t3, t4, t5                                                        # ir inst 19 fin
  li t2, 1000000
  slt t4, t2, t3                                                        # ir inst 20 fin
  bnez t4, .F._cVm90zWktlg_generate_fibonacci_transform._3.if.then.0
  j .F._cVm90zWktlg_generate_fibonacci_transform._4.if.else.0           # ir inst 21 fin
.F._cVm90zWktlg_generate_fibonacci_transform._3.if.then.0:
# Phi connections
  li t4, 1
  li t5, 1
  j .F._cVm90zWktlg_generate_fibonacci_transform._5.if.exit.0           # ir inst 22 fin
.F._cVm90zWktlg_generate_fibonacci_transform._4.if.else.0:
# Phi connections
  mv t4, t5
  mv t5, t3
  j .F._cVm90zWktlg_generate_fibonacci_transform._5.if.exit.0           # ir inst 23 fin
.F._cVm90zWktlg_generate_fibonacci_transform._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t3
  j .F._cVm90zWktlg_generate_fibonacci_transform._1.while.cond.0        # ir inst 27 fin
.F._cVm90zWktlg_generate_fibonacci_transform._6.while.exit.0:
  j .F._cVm90zWktlg_generate_fibonacci_transform.epilogue               # ir inst 28 fin
.F._cVm90zWktlg_generate_fibonacci_transform.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._cVm90zWktlg_apply_mathematical_operations
.F._cVm90zWktlg_apply_mathematical_operations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._cVm90zWktlg_apply_mathematical_operations._0.entry.0:
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_apply_mathematical_operations._1.while.cond.0       # ir inst 1 fin
.F._cVm90zWktlg_apply_mathematical_operations._1.while.cond.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._cVm90zWktlg_apply_mathematical_operations._2.while.body.0
  j .F._cVm90zWktlg_apply_mathematical_operations._3.while.exit.0       # ir inst 6 fin
.F._cVm90zWktlg_apply_mathematical_operations._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  lw t5, 0(t3)                                                          # ir inst 10 fin
  li t4, 4000
  add t4, a0, t4                                                        # ir inst 11 fin
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 13 fin
  lw t4, 0(s11)                                                         # ir inst 14 fin
  li t3, 8000
  add t3, a0, t3                                                        # ir inst 15 fin
  mv s11, t6                                                            # ir inst 16 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 17 fin
  mul t3, t5, t5                                                        # ir inst 18 fin
  add s11, t3, t4                                                       # ir inst 19 fin
  li t2, 32768
  rem t3, s11, t2                                                       # ir inst 20 fin
  sw t3, 0(s10)                                                         # ir inst 21 fin
  li t3, 8000
  add t3, a0, t3                                                        # ir inst 22 fin
  li s11, 16000
  add s11, a0, s11                                                      # ir inst 23 fin
  lw s10, 0(s11)                                                        # ir inst 24 fin
  add s11, s10, t6                                                      # ir inst 25 fin
  mv s10, s11                                                           # ir inst 26 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 27 fin
  li t2, 32768
  rem t3, t4, t2                                                        # ir inst 28 fin
  li t2, 32768
  rem s10, t4, t2                                                       # ir inst 29 fin
  mul t4, t3, s10                                                       # ir inst 30 fin
  add t3, t5, t4                                                        # ir inst 31 fin
  li t2, 32768
  rem t5, t3, t2                                                        # ir inst 32 fin
  sw t5, 0(s11)                                                         # ir inst 33 fin
  addi t5, t6, 1                                                        # ir inst 34 fin
# Phi connections
  mv t6, t5
  j .F._cVm90zWktlg_apply_mathematical_operations._1.while.cond.0       # ir inst 35 fin
.F._cVm90zWktlg_apply_mathematical_operations._3.while.exit.0:
  j .F._cVm90zWktlg_apply_mathematical_operations.epilogue              # ir inst 36 fin
.F._cVm90zWktlg_apply_mathematical_operations.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._cVm90zWktlg_perform_statistical_analysis
.F._cVm90zWktlg_perform_statistical_analysis:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 0,                range:       64(sp) -       64(sp)
# callee save reg num: 8 / 12,        range:        0(sp) -       64(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s0, 0(sp)
  sd s5, 8(sp)
  sd s6, 16(sp)
  sd s9, 24(sp)
  sd s7, 32(sp)
  sd s8, 40(sp)
  sd s11, 48(sp)
  sd s10, 56(sp)
.F._cVm90zWktlg_perform_statistical_analysis._0.entry.0:
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_perform_statistical_analysis._1.while.cond.0        # ir inst 1 fin
.F._cVm90zWktlg_perform_statistical_analysis._1.while.cond.0:
  li t2, 10000
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F._cVm90zWktlg_perform_statistical_analysis._2.while.body.0
  j .F._cVm90zWktlg_perform_statistical_analysis._3.while.exit.0        # ir inst 4 fin
.F._cVm90zWktlg_perform_statistical_analysis._2.while.body.0:
  li t5, 56008
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F._cVm90zWktlg_perform_statistical_analysis._1.while.cond.0        # ir inst 10 fin
.F._cVm90zWktlg_perform_statistical_analysis._3.while.exit.0:
  addi t6, a0, 0                                                        # ir inst 11 fin
  addi t5, t6, 0                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
  addi t5, a0, 0                                                        # ir inst 14 fin
  addi t4, t5, 0                                                        # ir inst 15 fin
  lw t5, 0(t4)                                                          # ir inst 16 fin
# Phi connections
  mv s11, t6
  li t3, 0
  li t4, 0
  mv t6, t5
  li t5, 0
  j .F._cVm90zWktlg_perform_statistical_analysis._4.while.cond.1        # ir inst 17 fin
.F._cVm90zWktlg_perform_statistical_analysis._4.while.cond.1:
  li s10, 16000
  add s10, a0, s10                                                      # ir inst 23 fin
  lw s9, 0(s10)                                                         # ir inst 24 fin
  slt s10, t5, s9                                                       # ir inst 25 fin
  bnez s10, .F._cVm90zWktlg_perform_statistical_analysis._5.while.body.1
  j .F._cVm90zWktlg_perform_statistical_analysis._18.while.exit.1       # ir inst 26 fin
.F._cVm90zWktlg_perform_statistical_analysis._5.while.body.1:
  addi s10, a0, 0                                                       # ir inst 27 fin
  mv s9, t5                                                             # ir inst 28 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 29 fin
  lw s10, 0(s8)                                                         # ir inst 30 fin
  add s9, t4, s10                                                       # ir inst 31 fin
  mul s8, s10, s10                                                      # ir inst 32 fin
  add s7, t3, s8                                                        # ir inst 33 fin
  slt s8, s10, s11                                                      # ir inst 34 fin
  bnez s8, .F._cVm90zWktlg_perform_statistical_analysis._6.if.then.0
  j .F._cVm90zWktlg_perform_statistical_analysis._7.if.else.0           # ir inst 35 fin
.F._cVm90zWktlg_perform_statistical_analysis._6.if.then.0:
# Phi connections
  mv s8, s10
  j .F._cVm90zWktlg_perform_statistical_analysis._8.if.exit.0           # ir inst 36 fin
.F._cVm90zWktlg_perform_statistical_analysis._7.if.else.0:
# Phi connections
  mv s8, s11
  j .F._cVm90zWktlg_perform_statistical_analysis._8.if.exit.0           # ir inst 37 fin
.F._cVm90zWktlg_perform_statistical_analysis._8.if.exit.0:
  slt s6, t6, s10                                                       # ir inst 39 fin
  bnez s6, .F._cVm90zWktlg_perform_statistical_analysis._9.if.then.1
  j .F._cVm90zWktlg_perform_statistical_analysis._10.if.else.1          # ir inst 40 fin
.F._cVm90zWktlg_perform_statistical_analysis._9.if.then.1:
# Phi connections
  mv s6, s10
  j .F._cVm90zWktlg_perform_statistical_analysis._11.if.exit.1          # ir inst 41 fin
.F._cVm90zWktlg_perform_statistical_analysis._10.if.else.1:
# Phi connections
  mv s6, t6
  j .F._cVm90zWktlg_perform_statistical_analysis._11.if.exit.1          # ir inst 42 fin
.F._cVm90zWktlg_perform_statistical_analysis._11.if.exit.1:
  li t2, 0
  slt t0, s10, t2
  xori s5, t0, 1                                                        # ir inst 44 fin
  bnez s5, .F._cVm90zWktlg_perform_statistical_analysis._12.lazy.then.0
  j .F._cVm90zWktlg_perform_statistical_analysis._13.lazy.else.0        # ir inst 45 fin
.F._cVm90zWktlg_perform_statistical_analysis._12.lazy.then.0:
  li t2, 10000
  slt s5, s10, t2                                                       # ir inst 46 fin
# Phi connections
  j .F._cVm90zWktlg_perform_statistical_analysis._14.lazy.exit.0        # ir inst 47 fin
.F._cVm90zWktlg_perform_statistical_analysis._13.lazy.else.0:
# Phi connections
  li s5, 0
  j .F._cVm90zWktlg_perform_statistical_analysis._14.lazy.exit.0        # ir inst 48 fin
.F._cVm90zWktlg_perform_statistical_analysis._14.lazy.exit.0:
  bnez s5, .F._cVm90zWktlg_perform_statistical_analysis._15.if.then.2
  j .F._cVm90zWktlg_perform_statistical_analysis._16.if.else.2          # ir inst 50 fin
.F._cVm90zWktlg_perform_statistical_analysis._15.if.then.2:
  li s5, 56008
  add s5, a0, s5                                                        # ir inst 51 fin
  mv s0, s10                                                            # ir inst 52 fin
  slli t2, s0, 2
  add s10, s5, t2                                                       # ir inst 53 fin
  lw s5, 0(s10)                                                         # ir inst 54 fin
  addi s0, s5, 1                                                        # ir inst 55 fin
  sw s0, 0(s10)                                                         # ir inst 56 fin
  j .F._cVm90zWktlg_perform_statistical_analysis._17.if.exit.2          # ir inst 57 fin
.F._cVm90zWktlg_perform_statistical_analysis._16.if.else.2:
  j .F._cVm90zWktlg_perform_statistical_analysis._17.if.exit.2          # ir inst 58 fin
.F._cVm90zWktlg_perform_statistical_analysis._17.if.exit.2:
  addi s10, t5, 1                                                       # ir inst 59 fin
# Phi connections
  mv s11, s8
  mv t3, s7
  mv t4, s9
  mv t5, s10
  mv t6, s6
  j .F._cVm90zWktlg_perform_statistical_analysis._4.while.cond.1        # ir inst 60 fin
.F._cVm90zWktlg_perform_statistical_analysis._18.while.exit.1:
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 61 fin
  addi s10, t5, 0                                                       # ir inst 62 fin
  sw t4, 0(s10)                                                         # ir inst 63 fin
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 64 fin
  addi s10, t5, 4                                                       # ir inst 65 fin
  sw t3, 0(s10)                                                         # ir inst 66 fin
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 67 fin
  addi t3, t5, 8                                                        # ir inst 68 fin
  sw s11, 0(t3)                                                         # ir inst 69 fin
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 70 fin
  addi t3, t5, 12                                                       # ir inst 71 fin
  sw t6, 0(t3)                                                          # ir inst 72 fin
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 73 fin
  addi t3, t5, 16                                                       # ir inst 74 fin
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 75 fin
  lw s10, 0(t5)                                                         # ir inst 76 fin
  div t5, t4, s10                                                       # ir inst 77 fin
  sw t5, 0(t3)                                                          # ir inst 78 fin
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 79 fin
  addi t4, t5, 20                                                       # ir inst 80 fin
  sub t5, t6, s11                                                       # ir inst 81 fin
  sw t5, 0(t4)                                                          # ir inst 82 fin
# Phi connections
  li t4, 0
  mv t5, s11
  li t6, 0
  j .F._cVm90zWktlg_perform_statistical_analysis._19.while.cond.2       # ir inst 83 fin
.F._cVm90zWktlg_perform_statistical_analysis._19.while.cond.2:
  li t2, 10000
  slt t3, t6, t2                                                        # ir inst 87 fin
  bnez t3, .F._cVm90zWktlg_perform_statistical_analysis._20.while.body.2
  j .F._cVm90zWktlg_perform_statistical_analysis._24.while.exit.2       # ir inst 88 fin
.F._cVm90zWktlg_perform_statistical_analysis._20.while.body.2:
  li t3, 56008
  add t3, a0, t3                                                        # ir inst 89 fin
  mv s11, t6                                                            # ir inst 90 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 91 fin
  lw t3, 0(s10)                                                         # ir inst 92 fin
  slt s11, t4, t3                                                       # ir inst 93 fin
  bnez s11, .F._cVm90zWktlg_perform_statistical_analysis._21.if.then.3
  j .F._cVm90zWktlg_perform_statistical_analysis._22.if.else.3          # ir inst 94 fin
.F._cVm90zWktlg_perform_statistical_analysis._21.if.then.3:
  li t3, 56008
  add t3, a0, t3                                                        # ir inst 95 fin
  mv s11, t6                                                            # ir inst 96 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 97 fin
  lw t3, 0(s10)                                                         # ir inst 98 fin
# Phi connections
  mv s11, t3
  mv t3, t6
  j .F._cVm90zWktlg_perform_statistical_analysis._23.if.exit.3          # ir inst 99 fin
.F._cVm90zWktlg_perform_statistical_analysis._22.if.else.3:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F._cVm90zWktlg_perform_statistical_analysis._23.if.exit.3          # ir inst 100 fin
.F._cVm90zWktlg_perform_statistical_analysis._23.if.exit.3:
  addi s10, t6, 1                                                       # ir inst 103 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F._cVm90zWktlg_perform_statistical_analysis._19.while.cond.2       # ir inst 104 fin
.F._cVm90zWktlg_perform_statistical_analysis._24.while.exit.2:
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 105 fin
  addi t3, t6, 24                                                       # ir inst 106 fin
  sw t5, 0(t3)                                                          # ir inst 107 fin
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 108 fin
  addi t5, t6, 28                                                       # ir inst 109 fin
  sw t4, 0(t5)                                                          # ir inst 110 fin
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 111 fin
  addi t5, t6, 32                                                       # ir inst 112 fin
  addi t6, a0, 0                                                        # ir inst 113 fin
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 114 fin
  lw t3, 0(t4)                                                          # ir inst 115 fin
  li t2, 2
  div t4, t3, t2                                                        # ir inst 116 fin
  mv t3, t4                                                             # ir inst 117 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 118 fin
  lw t6, 0(t4)                                                          # ir inst 119 fin
  sw t6, 0(t5)                                                          # ir inst 120 fin
  j .F._cVm90zWktlg_perform_statistical_analysis.epilogue               # ir inst 121 fin
.F._cVm90zWktlg_perform_statistical_analysis.epilogue:
  ld s0, 0(sp)
  ld s5, 8(sp)
  ld s6, 16(sp)
  ld s9, 24(sp)
  ld s7, 32(sp)
  ld s8, 40(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  addi sp, sp, 64
  ret

.globl .F._cVm90zWktlg_execute_matrix_operations
.F._cVm90zWktlg_execute_matrix_operations:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 0,                range:       48(sp) -       48(sp)
# callee save reg num: 6 / 12,        range:        0(sp) -       48(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s8, 16(sp)
  sd s6, 24(sp)
  sd s9, 32(sp)
  sd s7, 40(sp)
.F._cVm90zWktlg_execute_matrix_operations._0.entry.0:
  li t6, 56004
  add t6, a0, t6                                                        # ir inst 1 fin
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  li t2, 100
  slt t5, t4, t2                                                        # ir inst 4 fin
  bnez t5, .F._cVm90zWktlg_execute_matrix_operations._1.if.then.0
  j .F._cVm90zWktlg_execute_matrix_operations._2.if.else.0              # ir inst 5 fin
.F._cVm90zWktlg_execute_matrix_operations._1.if.then.0:
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 6 fin
  lw t4, 0(t5)                                                          # ir inst 7 fin
# Phi connections
  mv t5, t4
  j .F._cVm90zWktlg_execute_matrix_operations._3.if.exit.0              # ir inst 8 fin
.F._cVm90zWktlg_execute_matrix_operations._2.if.else.0:
# Phi connections
  li t5, 100
  j .F._cVm90zWktlg_execute_matrix_operations._3.if.exit.0              # ir inst 9 fin
.F._cVm90zWktlg_execute_matrix_operations._3.if.exit.0:
  sw t5, 0(t6)                                                          # ir inst 11 fin
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_execute_matrix_operations._4.while.cond.0           # ir inst 12 fin
.F._cVm90zWktlg_execute_matrix_operations._4.while.cond.0:
  li t5, 56004
  add t5, a0, t5                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  slt t5, t6, t4                                                        # ir inst 16 fin
  bnez t5, .F._cVm90zWktlg_execute_matrix_operations._5.while.body.0
  j .F._cVm90zWktlg_execute_matrix_operations._15.while.exit.0          # ir inst 17 fin
.F._cVm90zWktlg_execute_matrix_operations._5.while.body.0:
# Phi connections
  li t5, 0
  j .F._cVm90zWktlg_execute_matrix_operations._6.while.cond.1           # ir inst 18 fin
.F._cVm90zWktlg_execute_matrix_operations._6.while.cond.1:
  li t4, 56004
  add t4, a0, t4                                                        # ir inst 20 fin
  lw t3, 0(t4)                                                          # ir inst 21 fin
  slt t4, t5, t3                                                        # ir inst 22 fin
  bnez t4, .F._cVm90zWktlg_execute_matrix_operations._7.while.body.1
  j .F._cVm90zWktlg_execute_matrix_operations._14.while.exit.1          # ir inst 23 fin
.F._cVm90zWktlg_execute_matrix_operations._7.while.body.1:
  li t4, 16000
  add t4, a0, t4                                                        # ir inst 24 fin
  lw t3, 0(t4)                                                          # ir inst 25 fin
  mul t4, t6, t3                                                        # ir inst 26 fin
  li t3, 56004
  add t3, a0, t3                                                        # ir inst 27 fin
  lw s11, 0(t3)                                                         # ir inst 28 fin
  div t3, t4, s11                                                       # ir inst 29 fin
  mv t4, t3                                                             # ir inst 30 fin
  li t3, 16000
  add t3, a0, t3                                                        # ir inst 31 fin
  lw s11, 0(t3)                                                         # ir inst 32 fin
  mul t3, t5, s11                                                       # ir inst 33 fin
  li s11, 56004
  add s11, a0, s11                                                      # ir inst 34 fin
  lw s10, 0(s11)                                                        # ir inst 35 fin
  div s11, t3, s10                                                      # ir inst 36 fin
  mv t3, s11                                                            # ir inst 37 fin
  li s11, 16000
  add s11, a0, s11                                                      # ir inst 38 fin
  lw s10, 0(s11)                                                        # ir inst 39 fin
  mv s11, s10                                                           # ir inst 40 fin
  sltu s10, t4, s11                                                     # ir inst 41 fin
  bnez s10, .F._cVm90zWktlg_execute_matrix_operations._8.lazy.then.0
  j .F._cVm90zWktlg_execute_matrix_operations._9.lazy.else.0            # ir inst 42 fin
.F._cVm90zWktlg_execute_matrix_operations._8.lazy.then.0:
  li s11, 16000
  add s11, a0, s11                                                      # ir inst 43 fin
  lw s10, 0(s11)                                                        # ir inst 44 fin
  mv s11, s10                                                           # ir inst 45 fin
  sltu s10, t3, s11                                                     # ir inst 46 fin
# Phi connections
  mv s11, s10
  j .F._cVm90zWktlg_execute_matrix_operations._10.lazy.exit.0           # ir inst 47 fin
.F._cVm90zWktlg_execute_matrix_operations._9.lazy.else.0:
# Phi connections
  li s11, 0
  j .F._cVm90zWktlg_execute_matrix_operations._10.lazy.exit.0           # ir inst 48 fin
.F._cVm90zWktlg_execute_matrix_operations._10.lazy.exit.0:
  bnez s11, .F._cVm90zWktlg_execute_matrix_operations._11.if.then.1
  j .F._cVm90zWktlg_execute_matrix_operations._12.if.else.1             # ir inst 50 fin
.F._cVm90zWktlg_execute_matrix_operations._11.if.then.1:
  li s11, 16004
  add s11, a0, s11                                                      # ir inst 51 fin
  mv s10, t6                                                            # ir inst 52 fin
  li t1, 400
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 53 fin
  mv s11, t5                                                            # ir inst 54 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 55 fin
  addi s11, a0, 0                                                       # ir inst 56 fin
  slli t2, t4, 2
  add s9, s11, t2                                                       # ir inst 57 fin
  lw t4, 0(s9)                                                          # ir inst 58 fin
  li s11, 4000
  add s11, a0, s11                                                      # ir inst 59 fin
  slli t2, t3, 2
  add s9, s11, t2                                                       # ir inst 60 fin
  lw t3, 0(s9)                                                          # ir inst 61 fin
  add s11, t4, t3                                                       # ir inst 62 fin
  li t2, 1000
  rem t4, s11, t2                                                       # ir inst 63 fin
  sw t4, 0(s10)                                                         # ir inst 64 fin
  j .F._cVm90zWktlg_execute_matrix_operations._13.if.exit.1             # ir inst 65 fin
.F._cVm90zWktlg_execute_matrix_operations._12.if.else.1:
  j .F._cVm90zWktlg_execute_matrix_operations._13.if.exit.1             # ir inst 66 fin
.F._cVm90zWktlg_execute_matrix_operations._13.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 67 fin
# Phi connections
  mv t5, t4
  j .F._cVm90zWktlg_execute_matrix_operations._6.while.cond.1           # ir inst 68 fin
.F._cVm90zWktlg_execute_matrix_operations._14.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 69 fin
# Phi connections
  mv t6, t5
  j .F._cVm90zWktlg_execute_matrix_operations._4.while.cond.0           # ir inst 70 fin
.F._cVm90zWktlg_execute_matrix_operations._15.while.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F._cVm90zWktlg_execute_matrix_operations._16.while.cond.2          # ir inst 71 fin
.F._cVm90zWktlg_execute_matrix_operations._16.while.cond.2:
  li t3, 56004
  add t3, a0, t3                                                        # ir inst 75 fin
  lw s11, 0(t3)                                                         # ir inst 76 fin
  slt t3, t4, s11                                                       # ir inst 77 fin
  bnez t3, .F._cVm90zWktlg_execute_matrix_operations._17.while.body.2
  j .F._cVm90zWktlg_execute_matrix_operations._24.while.exit.2          # ir inst 78 fin
.F._cVm90zWktlg_execute_matrix_operations._17.while.body.2:
# Phi connections
  mv s10, t5
  mv s11, t6
  li t3, 0
  j .F._cVm90zWktlg_execute_matrix_operations._18.while.cond.3          # ir inst 79 fin
.F._cVm90zWktlg_execute_matrix_operations._18.while.cond.3:
  li s9, 56004
  add s9, a0, s9                                                        # ir inst 83 fin
  lw s8, 0(s9)                                                          # ir inst 84 fin
  slt s9, t3, s8                                                        # ir inst 85 fin
  bnez s9, .F._cVm90zWktlg_execute_matrix_operations._19.while.body.3
  j .F._cVm90zWktlg_execute_matrix_operations._23.while.exit.3          # ir inst 86 fin
.F._cVm90zWktlg_execute_matrix_operations._19.while.body.3:
  li s9, 16004
  add s9, a0, s9                                                        # ir inst 87 fin
  mv s8, t4                                                             # ir inst 88 fin
  li t1, 400
  mul t2, s8, t1
  add s7, s9, t2                                                        # ir inst 89 fin
  mv s9, t3                                                             # ir inst 90 fin
  slli t2, s9, 2
  add s8, s7, t2                                                        # ir inst 91 fin
  lw s9, 0(s8)                                                          # ir inst 92 fin
  add s8, s11, s9                                                       # ir inst 93 fin
  xor t0, t4, t3
  sltiu s9, t0, 1                                                       # ir inst 94 fin
  bnez s9, .F._cVm90zWktlg_execute_matrix_operations._20.if.then.2
  j .F._cVm90zWktlg_execute_matrix_operations._21.if.else.2             # ir inst 95 fin
.F._cVm90zWktlg_execute_matrix_operations._20.if.then.2:
  li s9, 16004
  add s9, a0, s9                                                        # ir inst 96 fin
  mv s7, t4                                                             # ir inst 97 fin
  li t1, 400
  mul t2, s7, t1
  add s6, s9, t2                                                        # ir inst 98 fin
  mv s9, t3                                                             # ir inst 99 fin
  slli t2, s9, 2
  add s7, s6, t2                                                        # ir inst 100 fin
  lw s9, 0(s7)                                                          # ir inst 101 fin
  add s7, s10, s9                                                       # ir inst 102 fin
# Phi connections
  mv s9, s7
  j .F._cVm90zWktlg_execute_matrix_operations._22.if.exit.2             # ir inst 103 fin
.F._cVm90zWktlg_execute_matrix_operations._21.if.else.2:
# Phi connections
  mv s9, s10
  j .F._cVm90zWktlg_execute_matrix_operations._22.if.exit.2             # ir inst 104 fin
.F._cVm90zWktlg_execute_matrix_operations._22.if.exit.2:
  addi s7, t3, 1                                                        # ir inst 106 fin
# Phi connections
  mv s10, s9
  mv s11, s8
  mv t3, s7
  j .F._cVm90zWktlg_execute_matrix_operations._18.while.cond.3          # ir inst 107 fin
.F._cVm90zWktlg_execute_matrix_operations._23.while.exit.3:
  addi t3, t4, 1                                                        # ir inst 108 fin
# Phi connections
  mv t4, t3
  mv t5, s10
  mv t6, s11
  j .F._cVm90zWktlg_execute_matrix_operations._16.while.cond.2          # ir inst 109 fin
.F._cVm90zWktlg_execute_matrix_operations._24.while.exit.2:
  li t4, 96008
  add t4, a0, t4                                                        # ir inst 110 fin
  addi t3, t4, 36                                                       # ir inst 111 fin
  sw t6, 0(t3)                                                          # ir inst 112 fin
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 113 fin
  addi t4, t6, 40                                                       # ir inst 114 fin
  sw t5, 0(t4)                                                          # ir inst 115 fin
  j .F._cVm90zWktlg_execute_matrix_operations.epilogue                  # ir inst 116 fin
.F._cVm90zWktlg_execute_matrix_operations.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s8, 16(sp)
  ld s6, 24(sp)
  ld s9, 32(sp)
  ld s7, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._cVm90zWktlg_output_analysis_results
.F._cVm90zWktlg_output_analysis_results:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F._cVm90zWktlg_output_analysis_results._0.entry.0:
# Phi connections
  li t6, 0
  j .F._cVm90zWktlg_output_analysis_results._1.while.cond.0             # ir inst 1 fin
.F._cVm90zWktlg_output_analysis_results._1.while.cond.0:
  li t2, 11
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F._cVm90zWktlg_output_analysis_results._2.while.body.0
  j .F._cVm90zWktlg_output_analysis_results._3.while.exit.0             # ir inst 4 fin
.F._cVm90zWktlg_output_analysis_results._2.while.body.0:
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 7 fin
  lw t5, 0(t3)                                                          # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F._cVm90zWktlg_output_analysis_results._1.while.cond.0             # ir inst 11 fin
.F._cVm90zWktlg_output_analysis_results._3.while.exit.0:
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 12 fin
  addi t5, t6, 0                                                        # ir inst 13 fin
  lw t6, 0(t5)                                                          # ir inst 14 fin
  li t5, 96008
  add t5, a0, t5                                                        # ir inst 15 fin
  addi t4, t5, 36                                                       # ir inst 16 fin
  lw t5, 0(t4)                                                          # ir inst 17 fin
  add t4, t6, t5                                                        # ir inst 18 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 19 fin
  lw t5, 0(t6)                                                          # ir inst 20 fin
  addi t6, t5, 1                                                        # ir inst 21 fin
  div t5, t4, t6                                                        # ir inst 22 fin
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 23 fin
  addi t4, t6, 40                                                       # ir inst 24 fin
  lw t6, 0(t4)                                                          # ir inst 25 fin
  li t4, 96008
  add t4, a0, t4                                                        # ir inst 26 fin
  addi t3, t4, 16                                                       # ir inst 27 fin
  lw t4, 0(t3)                                                          # ir inst 28 fin
  mul t3, t6, t4                                                        # ir inst 29 fin
  li t2, 1000
  div t6, t3, t2                                                        # ir inst 30 fin
  add t4, t5, t6                                                        # ir inst 31 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 32 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 33 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 34 fin
  j .F._cVm90zWktlg_output_analysis_results.epilogue                    # ir inst 35 fin
.F._cVm90zWktlg_output_analysis_results.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl main
main:
# spill func args num: 0,             range:   149120(sp) -   149120(sp)
# local var size: 149032,             range:       80(sp) -   149112(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 5 / 12,        range:       32(sp) -       72(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -149120
  add sp, sp, t0
  sd s7, 32(sp)
  sd s8, 40(sp)
  sd s9, 48(sp)
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
main._0.entry.0:
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 1 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 80
  mv a0, t1
  call .F._9YlBKTdVw0B_new
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 80
  mv a0, t1
  call .F._9YlBKTdVw0B_initialize_data
  ld t6, 0(sp)
# ir inst 4 fin
# Start call preparation
  addi t1, sp, 80
  mv a0, t1
  call .F._9YlBKTdVw0B_run_comprehensive_tests
# ir inst 5 fin
# Start call preparation
  li t1, 53024
  add t1, sp, t1
  mv a0, t1
  call .F._cVm90zWktlg_new
# ir inst 7 fin
# Start call preparation
  addi t1, sp, 80
  mv a1, t1
  li t1, 53024
  add t1, sp, t1
  mv a0, t1
  call .F._cVm90zWktlg_perform_advanced_operations
# ir inst 8 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 9 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._1.while.cond.0                                                # ir inst 10 fin
main._1.while.cond.0:
  slt t3, t5, t6                                                        # ir inst 13 fin
  bnez t3, main._2.while.body.0
  j main._6.while.exit.0                                                # ir inst 14 fin
main._2.while.body.0:
  li t2, 17
  mul t3, t5, t2                                                        # ir inst 15 fin
  addi s11, t3, 23                                                      # ir inst 16 fin
  li t2, 100
  rem t3, s11, t2                                                       # ir inst 17 fin
# Phi connections
  li s11, 0
  j main._3.while.cond.1                                                # ir inst 18 fin
main._3.while.cond.1:
  addi t1, sp, 80
  li s10, 16000
  add s10, t1, s10                                                      # ir inst 20 fin
  lw s9, 0(s10)                                                         # ir inst 21 fin
  slt s10, s11, s9                                                      # ir inst 22 fin
  bnez s10, main._4.while.body.1
  j main._5.while.exit.1                                                # ir inst 23 fin
main._4.while.body.1:
  addi t1, sp, 80
  addi s10, t1, 0                                                       # ir inst 24 fin
  mv s9, s11                                                            # ir inst 25 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 26 fin
  addi t1, sp, 80
  li s10, 8000
  add s10, t1, s10                                                      # ir inst 27 fin
  mv s9, s11                                                            # ir inst 28 fin
  slli t2, s9, 2
  add s7, s10, t2                                                       # ir inst 29 fin
  lw s10, 0(s7)                                                         # ir inst 30 fin
  add s9, s10, t3                                                       # ir inst 31 fin
  li t2, 10000
  rem s10, s9, t2                                                       # ir inst 32 fin
  sw s10, 0(s8)                                                         # ir inst 33 fin
  addi s10, s11, 1                                                      # ir inst 34 fin
# Phi connections
  mv s11, s10
  j main._3.while.cond.1                                                # ir inst 35 fin
main._5.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 80
  mv a0, t1
  call .F._9YlBKTdVw0B_reset_statistics
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 36 fin
  addi t1, sp, 80
  li t3, 16000
  add t3, t1, t3                                                        # ir inst 37 fin
  lw s11, 0(t3)                                                         # ir inst 38 fin
  addi t3, s11, -1                                                      # ir inst 39 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t3
  li a1, 0
  addi t1, sp, 80
  mv a0, t1
  call .F._9YlBKTdVw0B_quick_sort_3way
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 40 fin
  addi t1, sp, 80
  li t3, 16004
  add t3, t1, t3                                                        # ir inst 41 fin
  lw s11, 0(t3)                                                         # ir inst 42 fin
  addi t1, sp, 80
  li t3, 16008
  add t3, t1, t3                                                        # ir inst 43 fin
  lw s10, 0(t3)                                                         # ir inst 44 fin
  add t3, s11, s10                                                      # ir inst 45 fin
  add s11, t4, t3                                                       # ir inst 46 fin
  addi t3, t5, 1                                                        # ir inst 47 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j main._1.while.cond.0                                                # ir inst 48 fin
main._6.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 49 fin
  li t1, 53024
  add t1, sp, t1
  li t5, 96008
  add t5, t1, t5                                                        # ir inst 50 fin
  addi t3, t5, 16                                                       # ir inst 51 fin
  lw t5, 0(t3)                                                          # ir inst 52 fin
  mul t3, t4, t5                                                        # ir inst 53 fin
  addi t5, t6, 1                                                        # ir inst 54 fin
  div t6, t3, t5                                                        # ir inst 55 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 56 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 57 fin
  j main.epilogue                                                       # ir inst 58 fin
main.epilogue:
  ld ra, 72(sp)
  ld s7, 32(sp)
  ld s8, 40(sp)
  ld s9, 48(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  li t0, 149120
  add sp, sp, t0
  ret
