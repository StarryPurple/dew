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

.globl .F.pm_rand_update
.F.pm_rand_update:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.pm_rand_update._0.entry.0:
  li t2, 127773
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 127773
  mul t5, t6, t2                                                        # ir inst 2 fin
  sub t4, a0, t5                                                        # ir inst 3 fin
  li t1, 16807
  mul t5, t1, t4                                                        # ir inst 4 fin
  li t1, 2836
  mul t4, t1, t6                                                        # ir inst 5 fin
  sub t6, t5, t4                                                        # ir inst 6 fin
  li t2, 0
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 7 fin
  bnez t5, .F.pm_rand_update._1.if.then.0
  j .F.pm_rand_update._2.if.else.0                                      # ir inst 8 fin
.F.pm_rand_update._1.if.then.0:
  li t2, 2147483647
  add t5, t6, t2                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.pm_rand_update._3.if.exit.0                                      # ir inst 10 fin
.F.pm_rand_update._2.if.else.0:
# Phi connections
  j .F.pm_rand_update._3.if.exit.0                                      # ir inst 11 fin
.F.pm_rand_update._3.if.exit.0:
  mv a0, t6
  j .F.pm_rand_update.epilogue                                          # ir inst 13 fin
.F.pm_rand_update.epilogue:
  ret

.globl .F._6o7JjS3dq8i_new
.F._6o7JjS3dq8i_new:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._6o7JjS3dq8i_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  sw a2, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  sw a3, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  sw a4, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 16                                                       # ir inst 9 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 10 fin
  j .F._6o7JjS3dq8i_new.epilogue                                        # ir inst 11 fin
.F._6o7JjS3dq8i_new.epilogue:
  ret

.globl .F._ac6K71PczTg_new
.F._ac6K71PczTg_new:
# spill func args num: 0,             range:   123904(sp) -   123904(sp)
# local var size: 123844,             range:       56(sp) -   123900(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -123904
  add sp, sp, t0
  sd s11, 40(sp)
  sd ra, 48(sp)
.F._ac6K71PczTg_new._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
  sw a1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 56
  addi t6, t1, 4                                                        # ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a4, 0
  li a3, 0
  li a2, 0
  li a1, 0
  li t1, 123080
  add t1, sp, t1
  mv a0, t1
  call .F._6o7JjS3dq8i_new
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  addi t5, t6, 0                                                        # ir inst 7 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._1.array.cond.0                                 # ir inst 8 fin
.F._ac6K71PczTg_new._1.array.cond.0:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 10 fin
  bnez t4, .F._ac6K71PczTg_new._2.array.body.0
  j .F._ac6K71PczTg_new._3.array.exit.0                                 # ir inst 11 fin
.F._ac6K71PczTg_new._2.array.body.0:
  li t1, 20
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 20
  li t1, 123080
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 13 fin
  addi t4, t6, 1                                                        # ir inst 14 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._1.array.cond.0                                 # ir inst 15 fin
.F._ac6K71PczTg_new._3.array.exit.0:
  addi t1, sp, 56
  li t6, 40004
  add t6, t1, t6                                                        # ir inst 16 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 56
  li t6, 40008
  add t6, t1, t6                                                        # ir inst 18 fin
  li t1, 123100
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 20 fin
# Phi connections
  li t4, 0
  j .F._ac6K71PczTg_new._4.array.cond.1                                 # ir inst 21 fin
.F._ac6K71PczTg_new._4.array.cond.1:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 23 fin
  bnez t3, .F._ac6K71PczTg_new._5.array.body.1
  j .F._ac6K71PczTg_new._6.array.exit.1                                 # ir inst 24 fin
.F._ac6K71PczTg_new._5.array.body.1:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 26 fin
  addi t3, t4, 1                                                        # ir inst 27 fin
# Phi connections
  mv t4, t3
  j .F._ac6K71PczTg_new._4.array.cond.1                                 # ir inst 28 fin
.F._ac6K71PczTg_new._6.array.exit.1:
  addi t5, t6, 0                                                        # ir inst 29 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._7.array.cond.2                                 # ir inst 30 fin
.F._ac6K71PczTg_new._7.array.cond.2:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 32 fin
  bnez t4, .F._ac6K71PczTg_new._8.array.body.2
  j .F._ac6K71PczTg_new._9.array.exit.2                                 # ir inst 33 fin
.F._ac6K71PczTg_new._8.array.body.2:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 400
  li t1, 123100
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 35 fin
  addi t4, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._7.array.cond.2                                 # ir inst 37 fin
.F._ac6K71PczTg_new._9.array.exit.2:
  addi t1, sp, 56
  li t6, 80008
  add t6, t1, t6                                                        # ir inst 38 fin
  addi t5, t6, 0                                                        # ir inst 39 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._10.array.cond.3                                # ir inst 40 fin
.F._ac6K71PczTg_new._10.array.cond.3:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 42 fin
  bnez t4, .F._ac6K71PczTg_new._11.array.body.3
  j .F._ac6K71PczTg_new._12.array.exit.3                                # ir inst 43 fin
.F._ac6K71PczTg_new._11.array.body.3:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 44 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 45 fin
  addi t4, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._10.array.cond.3                                # ir inst 47 fin
.F._ac6K71PczTg_new._12.array.exit.3:
  addi t1, sp, 56
  li t6, 80408
  add t6, t1, t6                                                        # ir inst 48 fin
  addi t5, t6, 0                                                        # ir inst 49 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._13.array.cond.4                                # ir inst 50 fin
.F._ac6K71PczTg_new._13.array.cond.4:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 52 fin
  bnez t4, .F._ac6K71PczTg_new._14.array.body.4
  j .F._ac6K71PczTg_new._15.array.exit.4                                # ir inst 53 fin
.F._ac6K71PczTg_new._14.array.body.4:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 54 fin
  li t1, 2147483647
  sw t1, 0(t4)                                                          # ir inst 55 fin
  addi t4, t6, 1                                                        # ir inst 56 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._13.array.cond.4                                # ir inst 57 fin
.F._ac6K71PczTg_new._15.array.exit.4:
  addi t1, sp, 56
  li t6, 80808
  add t6, t1, t6                                                        # ir inst 58 fin
  addi t5, t6, 0                                                        # ir inst 59 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._16.array.cond.5                                # ir inst 60 fin
.F._ac6K71PczTg_new._16.array.cond.5:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 62 fin
  bnez t4, .F._ac6K71PczTg_new._17.array.body.5
  j .F._ac6K71PczTg_new._18.array.exit.5                                # ir inst 63 fin
.F._ac6K71PczTg_new._17.array.body.5:
  add t4, t5, t6                                                        # ir inst 64 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 65 fin
  addi t4, t6, 1                                                        # ir inst 66 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._16.array.cond.5                                # ir inst 67 fin
.F._ac6K71PczTg_new._18.array.exit.5:
  addi t1, sp, 56
  li t6, 80908
  add t6, t1, t6                                                        # ir inst 68 fin
  li t1, 123500
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 70 fin
# Phi connections
  li t4, 0
  j .F._ac6K71PczTg_new._19.array.cond.6                                # ir inst 71 fin
.F._ac6K71PczTg_new._19.array.cond.6:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 73 fin
  bnez t3, .F._ac6K71PczTg_new._20.array.body.6
  j .F._ac6K71PczTg_new._21.array.exit.6                                # ir inst 74 fin
.F._ac6K71PczTg_new._20.array.body.6:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 75 fin
  li t1, 2147483647
  sw t1, 0(t3)                                                          # ir inst 76 fin
  addi t3, t4, 1                                                        # ir inst 77 fin
# Phi connections
  mv t4, t3
  j .F._ac6K71PczTg_new._19.array.cond.6                                # ir inst 78 fin
.F._ac6K71PczTg_new._21.array.exit.6:
  addi t5, t6, 0                                                        # ir inst 79 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._22.array.cond.7                                # ir inst 80 fin
.F._ac6K71PczTg_new._22.array.cond.7:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 82 fin
  bnez t4, .F._ac6K71PczTg_new._23.array.body.7
  j .F._ac6K71PczTg_new._24.array.exit.7                                # ir inst 83 fin
.F._ac6K71PczTg_new._23.array.body.7:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 84 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 400
  li t1, 123500
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 85 fin
  addi t4, t6, 1                                                        # ir inst 86 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._22.array.cond.7                                # ir inst 87 fin
.F._ac6K71PczTg_new._24.array.exit.7:
  addi t1, sp, 56
  li t6, 120908
  add t6, t1, t6                                                        # ir inst 88 fin
  addi t5, t6, 0                                                        # ir inst 89 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._25.array.cond.8                                # ir inst 90 fin
.F._ac6K71PczTg_new._25.array.cond.8:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 92 fin
  bnez t4, .F._ac6K71PczTg_new._26.array.body.8
  j .F._ac6K71PczTg_new._27.array.exit.8                                # ir inst 93 fin
.F._ac6K71PczTg_new._26.array.body.8:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 94 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 95 fin
  addi t4, t6, 1                                                        # ir inst 96 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._25.array.cond.8                                # ir inst 97 fin
.F._ac6K71PczTg_new._27.array.exit.8:
  addi t1, sp, 56
  li t6, 121308
  add t6, t1, t6                                                        # ir inst 98 fin
  addi t5, t6, 0                                                        # ir inst 99 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._28.array.cond.9                                # ir inst 100 fin
.F._ac6K71PczTg_new._28.array.cond.9:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 102 fin
  bnez t4, .F._ac6K71PczTg_new._29.array.body.9
  j .F._ac6K71PczTg_new._30.array.exit.9                                # ir inst 103 fin
.F._ac6K71PczTg_new._29.array.body.9:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 104 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 105 fin
  addi t4, t6, 1                                                        # ir inst 106 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._28.array.cond.9                                # ir inst 107 fin
.F._ac6K71PczTg_new._30.array.exit.9:
  addi t1, sp, 56
  li t6, 121708
  add t6, t1, t6                                                        # ir inst 108 fin
  addi t5, t6, 0                                                        # ir inst 109 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._31.array.cond.10                               # ir inst 110 fin
.F._ac6K71PczTg_new._31.array.cond.10:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 112 fin
  bnez t4, .F._ac6K71PczTg_new._32.array.body.10
  j .F._ac6K71PczTg_new._33.array.exit.10                               # ir inst 113 fin
.F._ac6K71PczTg_new._32.array.body.10:
  add t4, t5, t6                                                        # ir inst 114 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 115 fin
  addi t4, t6, 1                                                        # ir inst 116 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._31.array.cond.10                               # ir inst 117 fin
.F._ac6K71PczTg_new._33.array.exit.10:
  addi t1, sp, 56
  li t6, 121808
  add t6, t1, t6                                                        # ir inst 118 fin
  addi t5, t6, 0                                                        # ir inst 119 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._34.array.cond.11                               # ir inst 120 fin
.F._ac6K71PczTg_new._34.array.cond.11:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 122 fin
  bnez t4, .F._ac6K71PczTg_new._35.array.body.11
  j .F._ac6K71PczTg_new._36.array.exit.11                               # ir inst 123 fin
.F._ac6K71PczTg_new._35.array.body.11:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 124 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 125 fin
  addi t4, t6, 1                                                        # ir inst 126 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._34.array.cond.11                               # ir inst 127 fin
.F._ac6K71PczTg_new._36.array.exit.11:
  addi t1, sp, 56
  li t6, 122208
  add t6, t1, t6                                                        # ir inst 128 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 129 fin
  addi t1, sp, 56
  li t6, 122212
  add t6, t1, t6                                                        # ir inst 130 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 131 fin
  addi t1, sp, 56
  li t6, 122216
  add t6, t1, t6                                                        # ir inst 132 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 133 fin
  addi t1, sp, 56
  li t6, 122220
  add t6, t1, t6                                                        # ir inst 134 fin
  addi t5, t6, 0                                                        # ir inst 135 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._37.array.cond.12                               # ir inst 136 fin
.F._ac6K71PczTg_new._37.array.cond.12:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 138 fin
  bnez t4, .F._ac6K71PczTg_new._38.array.body.12
  j .F._ac6K71PczTg_new._39.array.exit.12                               # ir inst 139 fin
.F._ac6K71PczTg_new._38.array.body.12:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 140 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 141 fin
  addi t4, t6, 1                                                        # ir inst 142 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._37.array.cond.12                               # ir inst 143 fin
.F._ac6K71PczTg_new._39.array.exit.12:
  addi t1, sp, 56
  li t6, 122620
  add t6, t1, t6                                                        # ir inst 144 fin
  addi t5, t6, 0                                                        # ir inst 145 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._40.array.cond.13                               # ir inst 146 fin
.F._ac6K71PczTg_new._40.array.cond.13:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 148 fin
  bnez t4, .F._ac6K71PczTg_new._41.array.body.13
  j .F._ac6K71PczTg_new._42.array.exit.13                               # ir inst 149 fin
.F._ac6K71PczTg_new._41.array.body.13:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 150 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 151 fin
  addi t4, t6, 1                                                        # ir inst 152 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_new._40.array.cond.13                               # ir inst 153 fin
.F._ac6K71PczTg_new._42.array.exit.13:
  addi t1, sp, 56
  li t6, 123020
  add t6, t1, t6                                                        # ir inst 154 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 155 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_new._43.while.cond.0                                # ir inst 156 fin
.F._ac6K71PczTg_new._43.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 158 fin
  bnez t5, .F._ac6K71PczTg_new._44.while.body.0
  j .F._ac6K71PczTg_new._51.while.exit.0                                # ir inst 159 fin
.F._ac6K71PczTg_new._44.while.body.0:
# Phi connections
  li t5, 0
  j .F._ac6K71PczTg_new._45.while.cond.1                                # ir inst 160 fin
.F._ac6K71PczTg_new._45.while.cond.1:
  slt t4, t5, a1                                                        # ir inst 162 fin
  bnez t4, .F._ac6K71PczTg_new._46.while.body.1
  j .F._ac6K71PczTg_new._50.while.exit.1                                # ir inst 163 fin
.F._ac6K71PczTg_new._46.while.body.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 164 fin
  bnez t4, .F._ac6K71PczTg_new._47.if.then.0
  j .F._ac6K71PczTg_new._48.if.else.0                                   # ir inst 165 fin
.F._ac6K71PczTg_new._47.if.then.0:
  addi t1, sp, 56
  li t4, 80908
  add t4, t1, t4                                                        # ir inst 166 fin
  mv t3, t6                                                             # ir inst 167 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 168 fin
  mv t4, t5                                                             # ir inst 169 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 170 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 171 fin
  j .F._ac6K71PczTg_new._49.if.exit.0                                   # ir inst 172 fin
.F._ac6K71PczTg_new._48.if.else.0:
  addi t1, sp, 56
  li t4, 80908
  add t4, t1, t4                                                        # ir inst 173 fin
  mv t3, t6                                                             # ir inst 174 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 175 fin
  mv t4, t5                                                             # ir inst 176 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 177 fin
  li t1, 2147483647
  sw t1, 0(t3)                                                          # ir inst 178 fin
  j .F._ac6K71PczTg_new._49.if.exit.0                                   # ir inst 179 fin
.F._ac6K71PczTg_new._49.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 180 fin
# Phi connections
  mv t5, t4
  j .F._ac6K71PczTg_new._45.while.cond.1                                # ir inst 181 fin
.F._ac6K71PczTg_new._50.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 182 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_new._43.while.cond.0                                # ir inst 183 fin
.F._ac6K71PczTg_new._51.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 123024
  addi t1, sp, 56
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 184 fin
  j .F._ac6K71PczTg_new.epilogue                                        # ir inst 185 fin
.F._ac6K71PczTg_new.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  li t0, 123904
  add sp, sp, t0
  ret

.globl .F._ac6K71PczTg_add_edge
.F._ac6K71PczTg_add_edge:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 20,                 range:       56(sp) -       76(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 48(sp)
.F._ac6K71PczTg_add_edge._0.entry.0:
  li t6, 40004
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 2000
  slt t0, t5, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F._ac6K71PczTg_add_edge._1.if.then.0
  j .F._ac6K71PczTg_add_edge._2.if.else.0                               # ir inst 4 fin
.F._ac6K71PczTg_add_edge._1.if.then.0:
  j .F._ac6K71PczTg_add_edge.epilogue                                   # ir inst 5 fin
.F._ac6K71PczTg_add_edge._2.if.else.0:
  j .F._ac6K71PczTg_add_edge._3.if.exit.0                               # ir inst 6 fin
.F._ac6K71PczTg_add_edge._3.if.exit.0:
  addi t6, a0, 4                                                        # ir inst 7 fin
  li t5, 40004
  add t5, a0, t5                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  mv t5, t4                                                             # ir inst 10 fin
  li t1, 20
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t4, 40(sp)
  addi t1, sp, 56
  mv a0, t1
  call .F._6o7JjS3dq8i_new
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t4, 40(sp)
# ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  li a2, 20
  addi t1, sp, 56
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
# ir inst 14 fin
  li t6, 80008
  add t6, a0, t6                                                        # ir inst 15 fin
  mv t5, a1                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  lw t6, 0(t4)                                                          # ir inst 18 fin
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 19 fin
  bnez t5, .F._ac6K71PczTg_add_edge._4.if.then.1
  j .F._ac6K71PczTg_add_edge._5.if.else.1                               # ir inst 20 fin
.F._ac6K71PczTg_add_edge._4.if.then.1:
  li t6, 40008
  add t6, a0, t6                                                        # ir inst 21 fin
  mv t5, a1                                                             # ir inst 22 fin
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 23 fin
  li t6, 80008
  add t6, a0, t6                                                        # ir inst 24 fin
  mv t5, a1                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t3, t6, t2                                                        # ir inst 26 fin
  lw t6, 0(t3)                                                          # ir inst 27 fin
  mv t5, t6                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t6, t4, t2                                                        # ir inst 29 fin
  sw a2, 0(t6)                                                          # ir inst 30 fin
  li t6, 80008
  add t6, a0, t6                                                        # ir inst 31 fin
  mv t5, a1                                                             # ir inst 32 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 33 fin
  lw t6, 0(t4)                                                          # ir inst 34 fin
  addi t5, t6, 1                                                        # ir inst 35 fin
  sw t5, 0(t4)                                                          # ir inst 36 fin
  j .F._ac6K71PczTg_add_edge._6.if.exit.1                               # ir inst 37 fin
.F._ac6K71PczTg_add_edge._5.if.else.1:
  j .F._ac6K71PczTg_add_edge._6.if.exit.1                               # ir inst 38 fin
.F._ac6K71PczTg_add_edge._6.if.exit.1:
  li t6, 80908
  add t6, a0, t6                                                        # ir inst 39 fin
  mv t5, a1                                                             # ir inst 40 fin
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 41 fin
  mv t6, a2                                                             # ir inst 42 fin
  slli t2, t6, 2
  add t5, t4, t2                                                        # ir inst 43 fin
  sw a3, 0(t5)                                                          # ir inst 44 fin
  li t6, 40004
  add t6, a0, t6                                                        # ir inst 45 fin
  lw t5, 0(t6)                                                          # ir inst 46 fin
  addi t4, t5, 1                                                        # ir inst 47 fin
  sw t4, 0(t6)                                                          # ir inst 48 fin
  j .F._ac6K71PczTg_add_edge.epilogue                                   # ir inst 49 fin
.F._ac6K71PczTg_add_edge.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 80
  ret

.globl .F._ac6K71PczTg_dijkstra
.F._ac6K71PczTg_dijkstra:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 20,                 range:       64(sp) -       84(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s11, 32(sp)
  sd s10, 40(sp)
  sd s9, 48(sp)
  sd ra, 56(sp)
.F._ac6K71PczTg_dijkstra._0.entry.0:
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_dijkstra._1.while.cond.0                            # ir inst 1 fin
.F._ac6K71PczTg_dijkstra._1.while.cond.0:
  addi t5, a0, 0                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._ac6K71PczTg_dijkstra._2.while.body.0
  j .F._ac6K71PczTg_dijkstra._3.while.exit.0                            # ir inst 6 fin
.F._ac6K71PczTg_dijkstra._2.while.body.0:
  li t5, 80408
  add t5, a0, t5                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  li t1, 2147483647
  sw t1, 0(t3)                                                          # ir inst 10 fin
  li t5, 80808
  add t5, a0, t5                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  add t3, t5, t4                                                        # ir inst 13 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_dijkstra._1.while.cond.0                            # ir inst 16 fin
.F._ac6K71PczTg_dijkstra._3.while.exit.0:
  li t6, 80408
  add t6, a0, t6                                                        # ir inst 17 fin
  mv t5, a1                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 20 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_dijkstra._4.while.cond.1                            # ir inst 21 fin
.F._ac6K71PczTg_dijkstra._4.while.cond.1:
  addi t5, a0, 0                                                        # ir inst 23 fin
  lw t4, 0(t5)                                                          # ir inst 24 fin
  slt t5, t6, t4                                                        # ir inst 25 fin
  bnez t5, .F._ac6K71PczTg_dijkstra._5.while.body.1
  j .F._ac6K71PczTg_dijkstra._28.critical_edge.0                        # ir inst 26 fin
.F._ac6K71PczTg_dijkstra._5.while.body.1:
# Phi connections
  li t3, 0
  li t4, -1
  li t5, 2147483647
  j .F._ac6K71PczTg_dijkstra._6.while.cond.2                            # ir inst 27 fin
.F._ac6K71PczTg_dijkstra._6.while.cond.2:
  addi s11, a0, 0                                                       # ir inst 31 fin
  lw s10, 0(s11)                                                        # ir inst 32 fin
  slt s11, t3, s10                                                      # ir inst 33 fin
  bnez s11, .F._ac6K71PczTg_dijkstra._7.while.body.2
  j .F._ac6K71PczTg_dijkstra._14.while.exit.2                           # ir inst 34 fin
.F._ac6K71PczTg_dijkstra._7.while.body.2:
  li s11, 80808
  add s11, a0, s11                                                      # ir inst 35 fin
  mv s10, t3                                                            # ir inst 36 fin
  add s9, s11, s10                                                      # ir inst 37 fin
  lb s11, 0(s9)                                                         # ir inst 38 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 39 fin
  bnez s10, .F._ac6K71PczTg_dijkstra._8.lazy.then.0
  j .F._ac6K71PczTg_dijkstra._9.lazy.else.0                             # ir inst 40 fin
.F._ac6K71PczTg_dijkstra._8.lazy.then.0:
  li s11, 80408
  add s11, a0, s11                                                      # ir inst 41 fin
  mv s10, t3                                                            # ir inst 42 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 43 fin
  lw s11, 0(s9)                                                         # ir inst 44 fin
  slt s10, s11, t5                                                      # ir inst 45 fin
# Phi connections
  mv s11, s10
  j .F._ac6K71PczTg_dijkstra._10.lazy.exit.0                            # ir inst 46 fin
.F._ac6K71PczTg_dijkstra._9.lazy.else.0:
# Phi connections
  li s11, 0
  j .F._ac6K71PczTg_dijkstra._10.lazy.exit.0                            # ir inst 47 fin
.F._ac6K71PczTg_dijkstra._10.lazy.exit.0:
  bnez s11, .F._ac6K71PczTg_dijkstra._11.if.then.0
  j .F._ac6K71PczTg_dijkstra._12.if.else.0                              # ir inst 49 fin
.F._ac6K71PczTg_dijkstra._11.if.then.0:
  li s11, 80408
  add s11, a0, s11                                                      # ir inst 50 fin
  mv s10, t3                                                            # ir inst 51 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 52 fin
  lw s11, 0(s9)                                                         # ir inst 53 fin
# Phi connections
  mv t5, s11
  mv s11, t3
  j .F._ac6K71PczTg_dijkstra._13.if.exit.0                              # ir inst 54 fin
.F._ac6K71PczTg_dijkstra._12.if.else.0:
# Phi connections
  mv s11, t4
  j .F._ac6K71PczTg_dijkstra._13.if.exit.0                              # ir inst 55 fin
.F._ac6K71PczTg_dijkstra._13.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 58 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F._ac6K71PczTg_dijkstra._6.while.cond.2                            # ir inst 59 fin
.F._ac6K71PczTg_dijkstra._14.while.exit.2:
  li t2, -1
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 60 fin
  bnez t5, .F._ac6K71PczTg_dijkstra._15.if.then.1
  j .F._ac6K71PczTg_dijkstra._16.if.else.1                              # ir inst 61 fin
.F._ac6K71PczTg_dijkstra._15.if.then.1:
  j .F._ac6K71PczTg_dijkstra._27.while.exit.1                           # ir inst 62 fin
.F._ac6K71PczTg_dijkstra._16.if.else.1:
  j .F._ac6K71PczTg_dijkstra._17.if.exit.1                              # ir inst 63 fin
.F._ac6K71PczTg_dijkstra._17.if.exit.1:
  li t5, 80808
  add t5, a0, t5                                                        # ir inst 64 fin
  mv t3, t4                                                             # ir inst 65 fin
  add s11, t5, t3                                                       # ir inst 66 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 67 fin
  addi t5, t6, 1                                                        # ir inst 68 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_dijkstra._18.while.cond.3                           # ir inst 69 fin
.F._ac6K71PczTg_dijkstra._18.while.cond.3:
  li t3, 40004
  add t3, a0, t3                                                        # ir inst 71 fin
  lw s11, 0(t3)                                                         # ir inst 72 fin
  slt t3, t6, s11                                                       # ir inst 73 fin
  bnez t3, .F._ac6K71PczTg_dijkstra._19.while.body.3
  j .F._ac6K71PczTg_dijkstra._26.while.exit.3                           # ir inst 74 fin
.F._ac6K71PczTg_dijkstra._19.while.body.3:
  addi t3, a0, 4                                                        # ir inst 76 fin
  mv s11, t6                                                            # ir inst 77 fin
  li t1, 20
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 78 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  mv a1, s10
  addi t1, sp, 64
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 79 fin
  addi t1, sp, 64
  addi t3, t1, 0                                                        # ir inst 80 fin
  lw s11, 0(t3)                                                         # ir inst 81 fin
  xor t0, s11, t4
  sltiu t3, t0, 1                                                       # ir inst 82 fin
  bnez t3, .F._ac6K71PczTg_dijkstra._20.if.then.2
  j .F._ac6K71PczTg_dijkstra._24.if.else.2                              # ir inst 83 fin
.F._ac6K71PczTg_dijkstra._20.if.then.2:
  li t3, 80408
  add t3, a0, t3                                                        # ir inst 84 fin
  mv s11, t4                                                            # ir inst 85 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 86 fin
  lw t3, 0(s10)                                                         # ir inst 87 fin
  addi t1, sp, 64
  addi s11, t1, 8                                                       # ir inst 88 fin
  lw s10, 0(s11)                                                        # ir inst 89 fin
  add s11, t3, s10                                                      # ir inst 90 fin
  li t3, 80408
  add t3, a0, t3                                                        # ir inst 91 fin
  addi t1, sp, 64
  addi s10, t1, 4                                                       # ir inst 92 fin
  lw s9, 0(s10)                                                         # ir inst 93 fin
  mv s10, s9                                                            # ir inst 94 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 95 fin
  lw t3, 0(s9)                                                          # ir inst 96 fin
  slt s10, s11, t3                                                      # ir inst 97 fin
  bnez s10, .F._ac6K71PczTg_dijkstra._21.if.then.3
  j .F._ac6K71PczTg_dijkstra._22.if.else.3                              # ir inst 98 fin
.F._ac6K71PczTg_dijkstra._21.if.then.3:
  li t3, 80408
  add t3, a0, t3                                                        # ir inst 99 fin
  addi t1, sp, 64
  addi s10, t1, 4                                                       # ir inst 100 fin
  lw s9, 0(s10)                                                         # ir inst 101 fin
  mv s10, s9                                                            # ir inst 102 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 103 fin
  sw s11, 0(s9)                                                         # ir inst 104 fin
  j .F._ac6K71PczTg_dijkstra._23.if.exit.3                              # ir inst 105 fin
.F._ac6K71PczTg_dijkstra._22.if.else.3:
  j .F._ac6K71PczTg_dijkstra._23.if.exit.3                              # ir inst 106 fin
.F._ac6K71PczTg_dijkstra._23.if.exit.3:
  j .F._ac6K71PczTg_dijkstra._25.if.exit.2                              # ir inst 107 fin
.F._ac6K71PczTg_dijkstra._24.if.else.2:
  j .F._ac6K71PczTg_dijkstra._25.if.exit.2                              # ir inst 108 fin
.F._ac6K71PczTg_dijkstra._25.if.exit.2:
  addi t3, t6, 1                                                        # ir inst 109 fin
# Phi connections
  mv t6, t3
  j .F._ac6K71PczTg_dijkstra._18.while.cond.3                           # ir inst 110 fin
.F._ac6K71PczTg_dijkstra._26.while.exit.3:
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_dijkstra._4.while.cond.1                            # ir inst 111 fin
.F._ac6K71PczTg_dijkstra._27.while.exit.1:
  j .F._ac6K71PczTg_dijkstra.epilogue                                   # ir inst 112 fin
.F._ac6K71PczTg_dijkstra._28.critical_edge.0:
  j .F._ac6K71PczTg_dijkstra._27.while.exit.1                           # ir inst 113 fin
.F._ac6K71PczTg_dijkstra.epilogue:
  ld ra, 56(sp)
  ld s11, 32(sp)
  ld s10, 40(sp)
  ld s9, 48(sp)
  addi sp, sp, 96
  ret

.globl .F._ac6K71PczTg_floyd_warshall
.F._ac6K71PczTg_floyd_warshall:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._ac6K71PczTg_floyd_warshall._0.entry.0:
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_floyd_warshall._1.while.cond.0                      # ir inst 1 fin
.F._ac6K71PczTg_floyd_warshall._1.while.cond.0:
  addi t5, a0, 0                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  mv t5, t4                                                             # ir inst 5 fin
  sltu t4, t6, t5                                                       # ir inst 6 fin
  bnez t4, .F._ac6K71PczTg_floyd_warshall._2.while.body.0
  j .F._ac6K71PczTg_floyd_warshall._18.while.exit.0                     # ir inst 7 fin
.F._ac6K71PczTg_floyd_warshall._2.while.body.0:
# Phi connections
  li t5, 0
  j .F._ac6K71PczTg_floyd_warshall._3.while.cond.1                      # ir inst 8 fin
.F._ac6K71PczTg_floyd_warshall._3.while.cond.1:
  addi t4, a0, 0                                                        # ir inst 10 fin
  lw t3, 0(t4)                                                          # ir inst 11 fin
  mv t4, t3                                                             # ir inst 12 fin
  sltu t3, t5, t4                                                       # ir inst 13 fin
  bnez t3, .F._ac6K71PczTg_floyd_warshall._4.while.body.1
  j .F._ac6K71PczTg_floyd_warshall._17.while.exit.1                     # ir inst 14 fin
.F._ac6K71PczTg_floyd_warshall._4.while.body.1:
# Phi connections
  li t4, 0
  j .F._ac6K71PczTg_floyd_warshall._5.while.cond.2                      # ir inst 15 fin
.F._ac6K71PczTg_floyd_warshall._5.while.cond.2:
  addi t3, a0, 0                                                        # ir inst 17 fin
  lw s11, 0(t3)                                                         # ir inst 18 fin
  mv t3, s11                                                            # ir inst 19 fin
  sltu s11, t4, t3                                                      # ir inst 20 fin
  bnez s11, .F._ac6K71PczTg_floyd_warshall._6.while.body.2
  j .F._ac6K71PczTg_floyd_warshall._16.while.exit.2                     # ir inst 21 fin
.F._ac6K71PczTg_floyd_warshall._6.while.body.2:
  li t3, 80908
  add t3, a0, t3                                                        # ir inst 22 fin
  li t1, 400
  mul t2, t5, t1
  add s11, t3, t2                                                       # ir inst 23 fin
  slli t2, t6, 2
  add t3, s11, t2                                                       # ir inst 24 fin
  lw s11, 0(t3)                                                         # ir inst 25 fin
  li t2, 2147483647
  xor t0, s11, t2
  sltu t3, zero, t0                                                     # ir inst 26 fin
  bnez t3, .F._ac6K71PczTg_floyd_warshall._7.lazy.then.0
  j .F._ac6K71PczTg_floyd_warshall._8.lazy.else.0                       # ir inst 27 fin
.F._ac6K71PczTg_floyd_warshall._7.lazy.then.0:
  li t3, 80908
  add t3, a0, t3                                                        # ir inst 28 fin
  li t1, 400
  mul t2, t6, t1
  add s11, t3, t2                                                       # ir inst 29 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 30 fin
  lw s11, 0(t3)                                                         # ir inst 31 fin
  li t2, 2147483647
  xor t0, s11, t2
  sltu t3, zero, t0                                                     # ir inst 32 fin
# Phi connections
  j .F._ac6K71PczTg_floyd_warshall._9.lazy.exit.0                       # ir inst 33 fin
.F._ac6K71PczTg_floyd_warshall._8.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._ac6K71PczTg_floyd_warshall._9.lazy.exit.0                       # ir inst 34 fin
.F._ac6K71PczTg_floyd_warshall._9.lazy.exit.0:
  bnez t3, .F._ac6K71PczTg_floyd_warshall._10.if.then.0
  j .F._ac6K71PczTg_floyd_warshall._14.if.else.0                        # ir inst 36 fin
.F._ac6K71PczTg_floyd_warshall._10.if.then.0:
  li t3, 80908
  add t3, a0, t3                                                        # ir inst 37 fin
  li t1, 400
  mul t2, t5, t1
  add s11, t3, t2                                                       # ir inst 38 fin
  slli t2, t6, 2
  add t3, s11, t2                                                       # ir inst 39 fin
  lw s11, 0(t3)                                                         # ir inst 40 fin
  li t3, 80908
  add t3, a0, t3                                                        # ir inst 41 fin
  li t1, 400
  mul t2, t6, t1
  add s10, t3, t2                                                       # ir inst 42 fin
  slli t2, t4, 2
  add t3, s10, t2                                                       # ir inst 43 fin
  lw s10, 0(t3)                                                         # ir inst 44 fin
  add t3, s11, s10                                                      # ir inst 45 fin
  li s11, 80908
  add s11, a0, s11                                                      # ir inst 46 fin
  li t1, 400
  mul t2, t5, t1
  add s10, s11, t2                                                      # ir inst 47 fin
  slli t2, t4, 2
  add s11, s10, t2                                                      # ir inst 48 fin
  lw s10, 0(s11)                                                        # ir inst 49 fin
  slt s11, t3, s10                                                      # ir inst 50 fin
  bnez s11, .F._ac6K71PczTg_floyd_warshall._11.if.then.1
  j .F._ac6K71PczTg_floyd_warshall._12.if.else.1                        # ir inst 51 fin
.F._ac6K71PczTg_floyd_warshall._11.if.then.1:
  li s11, 80908
  add s11, a0, s11                                                      # ir inst 52 fin
  li t1, 400
  mul t2, t5, t1
  add s10, s11, t2                                                      # ir inst 53 fin
  slli t2, t4, 2
  add s11, s10, t2                                                      # ir inst 54 fin
  sw t3, 0(s11)                                                         # ir inst 55 fin
  j .F._ac6K71PczTg_floyd_warshall._13.if.exit.1                        # ir inst 56 fin
.F._ac6K71PczTg_floyd_warshall._12.if.else.1:
  j .F._ac6K71PczTg_floyd_warshall._13.if.exit.1                        # ir inst 57 fin
.F._ac6K71PczTg_floyd_warshall._13.if.exit.1:
  j .F._ac6K71PczTg_floyd_warshall._15.if.exit.0                        # ir inst 58 fin
.F._ac6K71PczTg_floyd_warshall._14.if.else.0:
  j .F._ac6K71PczTg_floyd_warshall._15.if.exit.0                        # ir inst 59 fin
.F._ac6K71PczTg_floyd_warshall._15.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 60 fin
# Phi connections
  mv t4, t3
  j .F._ac6K71PczTg_floyd_warshall._5.while.cond.2                      # ir inst 61 fin
.F._ac6K71PczTg_floyd_warshall._16.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 62 fin
# Phi connections
  mv t5, t4
  j .F._ac6K71PczTg_floyd_warshall._3.while.cond.1                      # ir inst 63 fin
.F._ac6K71PczTg_floyd_warshall._17.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 64 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_floyd_warshall._1.while.cond.0                      # ir inst 65 fin
.F._ac6K71PczTg_floyd_warshall._18.while.exit.0:
  j .F._ac6K71PczTg_floyd_warshall.epilogue                             # ir inst 66 fin
.F._ac6K71PczTg_floyd_warshall.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._ac6K71PczTg_tarjan_scc
.F._ac6K71PczTg_tarjan_scc:
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
.F._ac6K71PczTg_tarjan_scc._0.entry.0:
  li t6, 121308
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  li t6, 122212
  add t6, a0, t6                                                        # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
  sw t5, 0(t4)                                                          # ir inst 6 fin
  li t6, 120908
  add t6, a0, t6                                                        # ir inst 7 fin
  mv t5, a1                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t6, 122212
  add t6, a0, t6                                                        # ir inst 10 fin
  lw t5, 0(t6)                                                          # ir inst 11 fin
  sw t5, 0(t4)                                                          # ir inst 12 fin
  li t6, 122212
  add t6, a0, t6                                                        # ir inst 13 fin
  lw t5, 0(t6)                                                          # ir inst 14 fin
  addi t4, t5, 1                                                        # ir inst 15 fin
  sw t4, 0(t6)                                                          # ir inst 16 fin
  li t6, 121808
  add t6, a0, t6                                                        # ir inst 17 fin
  li t5, 122208
  add t5, a0, t5                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  mv t5, t4                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 21 fin
  sw a1, 0(t4)                                                          # ir inst 22 fin
  li t6, 122208
  add t6, a0, t6                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  addi t4, t5, 1                                                        # ir inst 25 fin
  sw t4, 0(t6)                                                          # ir inst 26 fin
  li t6, 121708
  add t6, a0, t6                                                        # ir inst 27 fin
  mv t5, a1                                                             # ir inst 28 fin
  add t4, t6, t5                                                        # ir inst 29 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 30 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_tarjan_scc._1.while.cond.0                          # ir inst 31 fin
.F._ac6K71PczTg_tarjan_scc._1.while.cond.0:
  li t5, 80008
  add t5, a0, t5                                                        # ir inst 33 fin
  mv t4, a1                                                             # ir inst 34 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 35 fin
  lw t5, 0(t3)                                                          # ir inst 36 fin
  slt t4, t6, t5                                                        # ir inst 37 fin
  bnez t4, .F._ac6K71PczTg_tarjan_scc._2.while.body.0
  j .F._ac6K71PczTg_tarjan_scc._15.while.exit.0                         # ir inst 38 fin
.F._ac6K71PczTg_tarjan_scc._2.while.body.0:
  li t5, 40008
  add t5, a0, t5                                                        # ir inst 39 fin
  mv t4, a1                                                             # ir inst 40 fin
  li t1, 400
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  slli t2, t5, 2
  add t4, t3, t2                                                        # ir inst 43 fin
  lw t5, 0(t4)                                                          # ir inst 44 fin
  li t4, 121308
  add t4, a0, t4                                                        # ir inst 45 fin
  mv t3, t5                                                             # ir inst 46 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 47 fin
  lw t4, 0(s11)                                                         # ir inst 48 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 49 fin
  bnez t3, .F._ac6K71PczTg_tarjan_scc._3.if.then.0
  j .F._ac6K71PczTg_tarjan_scc._7.if.else.0                             # ir inst 50 fin
.F._ac6K71PczTg_tarjan_scc._3.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  call .F._ac6K71PczTg_tarjan_scc
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 51 fin
  li t4, 120908
  add t4, a0, t4                                                        # ir inst 52 fin
  mv t3, t5                                                             # ir inst 53 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 54 fin
  lw t4, 0(s11)                                                         # ir inst 55 fin
  li t3, 120908
  add t3, a0, t3                                                        # ir inst 56 fin
  mv s11, a1                                                            # ir inst 57 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 58 fin
  lw t3, 0(s10)                                                         # ir inst 59 fin
  slt s11, t4, t3                                                       # ir inst 60 fin
  bnez s11, .F._ac6K71PczTg_tarjan_scc._4.if.then.1
  j .F._ac6K71PczTg_tarjan_scc._5.if.else.1                             # ir inst 61 fin
.F._ac6K71PczTg_tarjan_scc._4.if.then.1:
  li t4, 120908
  add t4, a0, t4                                                        # ir inst 62 fin
  mv t3, a1                                                             # ir inst 63 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 64 fin
  li t4, 120908
  add t4, a0, t4                                                        # ir inst 65 fin
  mv t3, t5                                                             # ir inst 66 fin
  slli t2, t3, 2
  add s10, t4, t2                                                       # ir inst 67 fin
  lw t4, 0(s10)                                                         # ir inst 68 fin
  sw t4, 0(s11)                                                         # ir inst 69 fin
  j .F._ac6K71PczTg_tarjan_scc._6.if.exit.1                             # ir inst 70 fin
.F._ac6K71PczTg_tarjan_scc._5.if.else.1:
  j .F._ac6K71PczTg_tarjan_scc._6.if.exit.1                             # ir inst 71 fin
.F._ac6K71PczTg_tarjan_scc._6.if.exit.1:
  j .F._ac6K71PczTg_tarjan_scc._14.if.exit.0                            # ir inst 72 fin
.F._ac6K71PczTg_tarjan_scc._7.if.else.0:
  li t4, 121708
  add t4, a0, t4                                                        # ir inst 73 fin
  mv t3, t5                                                             # ir inst 74 fin
  add s11, t4, t3                                                       # ir inst 75 fin
  lb t4, 0(s11)                                                         # ir inst 76 fin
  bnez t4, .F._ac6K71PczTg_tarjan_scc._8.if.then.2
  j .F._ac6K71PczTg_tarjan_scc._12.if.else.2                            # ir inst 77 fin
.F._ac6K71PczTg_tarjan_scc._8.if.then.2:
  li t4, 121308
  add t4, a0, t4                                                        # ir inst 78 fin
  mv t3, t5                                                             # ir inst 79 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 80 fin
  lw t4, 0(s11)                                                         # ir inst 81 fin
  li t3, 120908
  add t3, a0, t3                                                        # ir inst 82 fin
  mv s11, a1                                                            # ir inst 83 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 84 fin
  lw t3, 0(s10)                                                         # ir inst 85 fin
  slt s11, t4, t3                                                       # ir inst 86 fin
  bnez s11, .F._ac6K71PczTg_tarjan_scc._9.if.then.3
  j .F._ac6K71PczTg_tarjan_scc._10.if.else.3                            # ir inst 87 fin
.F._ac6K71PczTg_tarjan_scc._9.if.then.3:
  li t4, 120908
  add t4, a0, t4                                                        # ir inst 88 fin
  mv t3, a1                                                             # ir inst 89 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 90 fin
  li t4, 121308
  add t4, a0, t4                                                        # ir inst 91 fin
  mv t3, t5                                                             # ir inst 92 fin
  slli t2, t3, 2
  add t5, t4, t2                                                        # ir inst 93 fin
  lw t4, 0(t5)                                                          # ir inst 94 fin
  sw t4, 0(s11)                                                         # ir inst 95 fin
  j .F._ac6K71PczTg_tarjan_scc._11.if.exit.3                            # ir inst 96 fin
.F._ac6K71PczTg_tarjan_scc._10.if.else.3:
  j .F._ac6K71PczTg_tarjan_scc._11.if.exit.3                            # ir inst 97 fin
.F._ac6K71PczTg_tarjan_scc._11.if.exit.3:
  j .F._ac6K71PczTg_tarjan_scc._13.if.exit.2                            # ir inst 98 fin
.F._ac6K71PczTg_tarjan_scc._12.if.else.2:
  j .F._ac6K71PczTg_tarjan_scc._13.if.exit.2                            # ir inst 99 fin
.F._ac6K71PczTg_tarjan_scc._13.if.exit.2:
  j .F._ac6K71PczTg_tarjan_scc._14.if.exit.0                            # ir inst 100 fin
.F._ac6K71PczTg_tarjan_scc._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 101 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_tarjan_scc._1.while.cond.0                          # ir inst 102 fin
.F._ac6K71PczTg_tarjan_scc._15.while.exit.0:
  li t6, 120908
  add t6, a0, t6                                                        # ir inst 103 fin
  mv t5, a1                                                             # ir inst 104 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 105 fin
  lw t6, 0(t4)                                                          # ir inst 106 fin
  li t5, 121308
  add t5, a0, t5                                                        # ir inst 107 fin
  mv t4, a1                                                             # ir inst 108 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 109 fin
  lw t5, 0(t3)                                                          # ir inst 110 fin
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 111 fin
  bnez t4, .F._ac6K71PczTg_tarjan_scc._16.if.then.4
  j .F._ac6K71PczTg_tarjan_scc._23.if.else.4                            # ir inst 112 fin
.F._ac6K71PczTg_tarjan_scc._16.if.then.4:
  li t6, 122216
  add t6, a0, t6                                                        # ir inst 113 fin
  lw t5, 0(t6)                                                          # ir inst 114 fin
  addi t4, t5, 1                                                        # ir inst 115 fin
  sw t4, 0(t6)                                                          # ir inst 116 fin
  j .F._ac6K71PczTg_tarjan_scc._17.while.cond.1                         # ir inst 117 fin
.F._ac6K71PczTg_tarjan_scc._17.while.cond.1:
  li t6, 122208
  add t6, a0, t6                                                        # ir inst 118 fin
  lw t5, 0(t6)                                                          # ir inst 119 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 120 fin
  bnez t6, .F._ac6K71PczTg_tarjan_scc._18.while.body.1
  j .F._ac6K71PczTg_tarjan_scc._25.critical_edge.0                      # ir inst 121 fin
.F._ac6K71PczTg_tarjan_scc._18.while.body.1:
  li t6, 122208
  add t6, a0, t6                                                        # ir inst 122 fin
  lw t5, 0(t6)                                                          # ir inst 123 fin
  addi t4, t5, -1                                                       # ir inst 124 fin
  sw t4, 0(t6)                                                          # ir inst 125 fin
  li t6, 121808
  add t6, a0, t6                                                        # ir inst 126 fin
  li t5, 122208
  add t5, a0, t5                                                        # ir inst 127 fin
  lw t4, 0(t5)                                                          # ir inst 128 fin
  mv t5, t4                                                             # ir inst 129 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 130 fin
  lw t6, 0(t4)                                                          # ir inst 131 fin
  li t5, 121708
  add t5, a0, t5                                                        # ir inst 132 fin
  mv t4, t6                                                             # ir inst 133 fin
  add t3, t5, t4                                                        # ir inst 134 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 135 fin
  xor t0, t6, a1
  sltiu t5, t0, 1                                                       # ir inst 136 fin
  bnez t5, .F._ac6K71PczTg_tarjan_scc._19.if.then.5
  j .F._ac6K71PczTg_tarjan_scc._20.if.else.5                            # ir inst 137 fin
.F._ac6K71PczTg_tarjan_scc._19.if.then.5:
  j .F._ac6K71PczTg_tarjan_scc._22.while.exit.1                         # ir inst 138 fin
.F._ac6K71PczTg_tarjan_scc._20.if.else.5:
  j .F._ac6K71PczTg_tarjan_scc._21.if.exit.5                            # ir inst 139 fin
.F._ac6K71PczTg_tarjan_scc._21.if.exit.5:
  j .F._ac6K71PczTg_tarjan_scc._17.while.cond.1                         # ir inst 140 fin
.F._ac6K71PczTg_tarjan_scc._22.while.exit.1:
  j .F._ac6K71PczTg_tarjan_scc._24.if.exit.4                            # ir inst 141 fin
.F._ac6K71PczTg_tarjan_scc._23.if.else.4:
  j .F._ac6K71PczTg_tarjan_scc._24.if.exit.4                            # ir inst 142 fin
.F._ac6K71PczTg_tarjan_scc._24.if.exit.4:
  j .F._ac6K71PczTg_tarjan_scc.epilogue                                 # ir inst 143 fin
.F._ac6K71PczTg_tarjan_scc._25.critical_edge.0:
  j .F._ac6K71PczTg_tarjan_scc._22.while.exit.1                         # ir inst 144 fin
.F._ac6K71PczTg_tarjan_scc.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._ac6K71PczTg_find_all_scc
.F._ac6K71PczTg_find_all_scc:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F._ac6K71PczTg_find_all_scc._0.entry.0:
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_find_all_scc._1.while.cond.0                        # ir inst 1 fin
.F._ac6K71PczTg_find_all_scc._1.while.cond.0:
  addi t5, a0, 0                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._ac6K71PczTg_find_all_scc._2.while.body.0
  j .F._ac6K71PczTg_find_all_scc._3.while.exit.0                        # ir inst 6 fin
.F._ac6K71PczTg_find_all_scc._2.while.body.0:
  li t5, 121308
  add t5, a0, t5                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 10 fin
  li t5, 120908
  add t5, a0, t5                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 13 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 14 fin
  li t5, 121708
  add t5, a0, t5                                                        # ir inst 15 fin
  mv t4, t6                                                             # ir inst 16 fin
  add t3, t5, t4                                                        # ir inst 17 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_find_all_scc._1.while.cond.0                        # ir inst 20 fin
.F._ac6K71PczTg_find_all_scc._3.while.exit.0:
  li t6, 122212
  add t6, a0, t6                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 22 fin
  li t6, 122208
  add t6, a0, t6                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 24 fin
  li t6, 122216
  add t6, a0, t6                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 26 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_find_all_scc._4.while.cond.1                        # ir inst 27 fin
.F._ac6K71PczTg_find_all_scc._4.while.cond.1:
  addi t5, a0, 0                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
  slt t5, t6, t4                                                        # ir inst 31 fin
  bnez t5, .F._ac6K71PczTg_find_all_scc._5.while.body.1
  j .F._ac6K71PczTg_find_all_scc._9.while.exit.1                        # ir inst 32 fin
.F._ac6K71PczTg_find_all_scc._5.while.body.1:
  li t5, 121308
  add t5, a0, t5                                                        # ir inst 33 fin
  mv t4, t6                                                             # ir inst 34 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 35 fin
  lw t5, 0(t3)                                                          # ir inst 36 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 37 fin
  bnez t4, .F._ac6K71PczTg_find_all_scc._6.if.then.0
  j .F._ac6K71PczTg_find_all_scc._7.if.else.0                           # ir inst 38 fin
.F._ac6K71PczTg_find_all_scc._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F._ac6K71PczTg_tarjan_scc
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 39 fin
  j .F._ac6K71PczTg_find_all_scc._8.if.exit.0                           # ir inst 40 fin
.F._ac6K71PczTg_find_all_scc._7.if.else.0:
  j .F._ac6K71PczTg_find_all_scc._8.if.exit.0                           # ir inst 41 fin
.F._ac6K71PczTg_find_all_scc._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_find_all_scc._4.while.cond.1                        # ir inst 43 fin
.F._ac6K71PczTg_find_all_scc._9.while.exit.1:
  j .F._ac6K71PczTg_find_all_scc.epilogue                               # ir inst 44 fin
.F._ac6K71PczTg_find_all_scc.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._ac6K71PczTg_find_parent
.F._ac6K71PczTg_find_parent:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._ac6K71PczTg_find_parent._0.entry.0:
  li t6, 122220
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  xor t0, t6, a1
  sltu t5, zero, t0                                                     # ir inst 5 fin
  bnez t5, .F._ac6K71PczTg_find_parent._1.if.then.0
  j .F._ac6K71PczTg_find_parent._2.if.else.0                            # ir inst 6 fin
.F._ac6K71PczTg_find_parent._1.if.then.0:
  li t6, 122220
  add t6, a0, t6                                                        # ir inst 7 fin
  mv t5, a1                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  li t6, 122220
  add t6, a0, t6                                                        # ir inst 10 fin
  mv t5, a1                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t3, t6, t2                                                        # ir inst 12 fin
  lw t6, 0(t3)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  call .F._ac6K71PczTg_find_parent
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 14 fin
  sw t5, 0(t4)                                                          # ir inst 15 fin
  j .F._ac6K71PczTg_find_parent._3.if.exit.0                            # ir inst 16 fin
.F._ac6K71PczTg_find_parent._2.if.else.0:
  j .F._ac6K71PczTg_find_parent._3.if.exit.0                            # ir inst 17 fin
.F._ac6K71PczTg_find_parent._3.if.exit.0:
  li t6, 122220
  add t6, a0, t6                                                        # ir inst 18 fin
  mv t5, a1                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 20 fin
  lw t6, 0(t4)                                                          # ir inst 21 fin
  mv a0, t6
  j .F._ac6K71PczTg_find_parent.epilogue                                # ir inst 22 fin
.F._ac6K71PczTg_find_parent.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._ac6K71PczTg_union_sets
.F._ac6K71PczTg_union_sets:
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
.F._ac6K71PczTg_union_sets._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._ac6K71PczTg_find_parent
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a1, a2
  call .F._ac6K71PczTg_find_parent
  mv t5, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 2 fin
  xor t0, t6, t5
  sltu t4, zero, t0                                                     # ir inst 3 fin
  bnez t4, .F._ac6K71PczTg_union_sets._1.if.then.0
  j .F._ac6K71PczTg_union_sets._8.if.else.0                             # ir inst 4 fin
.F._ac6K71PczTg_union_sets._1.if.then.0:
  li t4, 122620
  add t4, a0, t4                                                        # ir inst 5 fin
  mv t3, t6                                                             # ir inst 6 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 7 fin
  lw t4, 0(s11)                                                         # ir inst 8 fin
  li t3, 122620
  add t3, a0, t3                                                        # ir inst 9 fin
  mv s11, t5                                                            # ir inst 10 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 11 fin
  lw t3, 0(s10)                                                         # ir inst 12 fin
  slt s11, t4, t3                                                       # ir inst 13 fin
  bnez s11, .F._ac6K71PczTg_union_sets._2.if.then.1
  j .F._ac6K71PczTg_union_sets._3.if.else.1                             # ir inst 14 fin
.F._ac6K71PczTg_union_sets._2.if.then.1:
  li t4, 122220
  add t4, a0, t4                                                        # ir inst 15 fin
  mv t3, t6                                                             # ir inst 16 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 17 fin
  sw t5, 0(s11)                                                         # ir inst 18 fin
  j .F._ac6K71PczTg_union_sets._7.if.exit.1                             # ir inst 19 fin
.F._ac6K71PczTg_union_sets._3.if.else.1:
  li t4, 122620
  add t4, a0, t4                                                        # ir inst 20 fin
  mv t3, t6                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 22 fin
  lw t4, 0(s11)                                                         # ir inst 23 fin
  li t3, 122620
  add t3, a0, t3                                                        # ir inst 24 fin
  mv s11, t5                                                            # ir inst 25 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 26 fin
  lw t3, 0(s10)                                                         # ir inst 27 fin
  slt s11, t3, t4                                                       # ir inst 28 fin
  bnez s11, .F._ac6K71PczTg_union_sets._4.if.then.2
  j .F._ac6K71PczTg_union_sets._5.if.else.2                             # ir inst 29 fin
.F._ac6K71PczTg_union_sets._4.if.then.2:
  li t4, 122220
  add t4, a0, t4                                                        # ir inst 30 fin
  mv t3, t5                                                             # ir inst 31 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 32 fin
  sw t6, 0(s11)                                                         # ir inst 33 fin
  j .F._ac6K71PczTg_union_sets._6.if.exit.2                             # ir inst 34 fin
.F._ac6K71PczTg_union_sets._5.if.else.2:
  li t4, 122220
  add t4, a0, t4                                                        # ir inst 35 fin
  mv t3, t5                                                             # ir inst 36 fin
  slli t2, t3, 2
  add t5, t4, t2                                                        # ir inst 37 fin
  sw t6, 0(t5)                                                          # ir inst 38 fin
  li t5, 122620
  add t5, a0, t5                                                        # ir inst 39 fin
  mv t4, t6                                                             # ir inst 40 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 41 fin
  lw t5, 0(t6)                                                          # ir inst 42 fin
  addi t4, t5, 1                                                        # ir inst 43 fin
  sw t4, 0(t6)                                                          # ir inst 44 fin
  j .F._ac6K71PczTg_union_sets._6.if.exit.2                             # ir inst 45 fin
.F._ac6K71PczTg_union_sets._6.if.exit.2:
  j .F._ac6K71PczTg_union_sets._7.if.exit.1                             # ir inst 46 fin
.F._ac6K71PczTg_union_sets._7.if.exit.1:
  j .F._ac6K71PczTg_union_sets._9.if.exit.0                             # ir inst 47 fin
.F._ac6K71PczTg_union_sets._8.if.else.0:
  j .F._ac6K71PczTg_union_sets._9.if.exit.0                             # ir inst 48 fin
.F._ac6K71PczTg_union_sets._9.if.exit.0:
  j .F._ac6K71PczTg_union_sets.epilogue                                 # ir inst 49 fin
.F._ac6K71PczTg_union_sets.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._ac6K71PczTg_kruskal_mst
.F._ac6K71PczTg_kruskal_mst:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 40,                 range:       64(sp) -      104(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F._ac6K71PczTg_kruskal_mst._0.entry.0:
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_kruskal_mst._1.while.cond.0                         # ir inst 1 fin
.F._ac6K71PczTg_kruskal_mst._1.while.cond.0:
  addi t5, a0, 0                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._ac6K71PczTg_kruskal_mst._2.while.body.0
  j .F._ac6K71PczTg_kruskal_mst._3.while.exit.0                         # ir inst 6 fin
.F._ac6K71PczTg_kruskal_mst._2.while.body.0:
  li t5, 122220
  add t5, a0, t5                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  sw t6, 0(t3)                                                          # ir inst 10 fin
  li t5, 122620
  add t5, a0, t5                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 13 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_kruskal_mst._1.while.cond.0                         # ir inst 16 fin
.F._ac6K71PczTg_kruskal_mst._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_kruskal_mst._4.while.cond.1                         # ir inst 17 fin
.F._ac6K71PczTg_kruskal_mst._4.while.cond.1:
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 19 fin
  bnez t5, .F._ac6K71PczTg_kruskal_mst._5.while.body.1
  j .F._ac6K71PczTg_kruskal_mst._12.while.exit.1                        # ir inst 20 fin
.F._ac6K71PczTg_kruskal_mst._5.while.body.1:
# Phi connections
  li t5, 0
  li t6, 1
  j .F._ac6K71PczTg_kruskal_mst._6.while.cond.2                         # ir inst 21 fin
.F._ac6K71PczTg_kruskal_mst._6.while.cond.2:
  li t4, 40004
  add t4, a0, t4                                                        # ir inst 24 fin
  lw t3, 0(t4)                                                          # ir inst 25 fin
  addi t4, t3, -1                                                       # ir inst 26 fin
  slt t3, t5, t4                                                        # ir inst 27 fin
  bnez t3, .F._ac6K71PczTg_kruskal_mst._7.while.body.2
  j .F._ac6K71PczTg_kruskal_mst._11.while.exit.2                        # ir inst 28 fin
.F._ac6K71PczTg_kruskal_mst._7.while.body.2:
  addi t4, a0, 4                                                        # ir inst 29 fin
  mv t3, t5                                                             # ir inst 30 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 31 fin
  addi t4, s11, 8                                                       # ir inst 32 fin
  lw t3, 0(t4)                                                          # ir inst 33 fin
  addi t4, a0, 4                                                        # ir inst 34 fin
  addi s11, t5, 1                                                       # ir inst 35 fin
  mv s10, s11                                                           # ir inst 36 fin
  li t1, 20
  mul t2, s10, t1
  add s11, t4, t2                                                       # ir inst 37 fin
  addi t4, s11, 8                                                       # ir inst 38 fin
  lw s11, 0(t4)                                                         # ir inst 39 fin
  slt t4, s11, t3                                                       # ir inst 40 fin
  bnez t4, .F._ac6K71PczTg_kruskal_mst._8.if.then.0
  j .F._ac6K71PczTg_kruskal_mst._9.if.else.0                            # ir inst 41 fin
.F._ac6K71PczTg_kruskal_mst._8.if.then.0:
  addi t4, a0, 4                                                        # ir inst 43 fin
  mv t3, t5                                                             # ir inst 44 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 45 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 20
  mv a1, s11
  addi t1, sp, 64
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 46 fin
  addi t4, a0, 4                                                        # ir inst 47 fin
  mv t3, t5                                                             # ir inst 48 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 49 fin
  addi t4, a0, 4                                                        # ir inst 50 fin
  addi t3, t5, 1                                                        # ir inst 51 fin
  mv s10, t3                                                            # ir inst 52 fin
  li t1, 20
  mul t2, s10, t1
  add t3, t4, t2                                                        # ir inst 53 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  mv a1, t3
  mv a0, s11
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 54 fin
  addi t4, a0, 4                                                        # ir inst 55 fin
  addi t3, t5, 1                                                        # ir inst 56 fin
  mv s11, t3                                                            # ir inst 57 fin
  li t1, 20
  mul t2, s11, t1
  add t3, t4, t2                                                        # ir inst 58 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  addi t1, sp, 64
  mv a1, t1
  mv a0, t3
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 59 fin
# Phi connections
  li t4, 0
  j .F._ac6K71PczTg_kruskal_mst._10.if.exit.0                           # ir inst 60 fin
.F._ac6K71PczTg_kruskal_mst._9.if.else.0:
# Phi connections
  mv t4, t6
  j .F._ac6K71PczTg_kruskal_mst._10.if.exit.0                           # ir inst 61 fin
.F._ac6K71PczTg_kruskal_mst._10.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 63 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F._ac6K71PczTg_kruskal_mst._6.while.cond.2                         # ir inst 64 fin
.F._ac6K71PczTg_kruskal_mst._11.while.exit.2:
# Phi connections
  j .F._ac6K71PczTg_kruskal_mst._4.while.cond.1                         # ir inst 65 fin
.F._ac6K71PczTg_kruskal_mst._12.while.exit.1:
  li t6, 123020
  add t6, a0, t6                                                        # ir inst 66 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 67 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F._ac6K71PczTg_kruskal_mst._13.while.cond.3                        # ir inst 68 fin
.F._ac6K71PczTg_kruskal_mst._13.while.cond.3:
  li t4, 40004
  add t4, a0, t4                                                        # ir inst 71 fin
  lw t3, 0(t4)                                                          # ir inst 72 fin
  slt t4, t5, t3                                                        # ir inst 73 fin
  bnez t4, .F._ac6K71PczTg_kruskal_mst._14.lazy.then.0
  j .F._ac6K71PczTg_kruskal_mst._15.lazy.else.0                         # ir inst 74 fin
.F._ac6K71PczTg_kruskal_mst._14.lazy.then.0:
  addi t4, a0, 0                                                        # ir inst 75 fin
  lw t3, 0(t4)                                                          # ir inst 76 fin
  addi t4, t3, -1                                                       # ir inst 77 fin
  slt t3, t6, t4                                                        # ir inst 78 fin
# Phi connections
  mv t4, t3
  j .F._ac6K71PczTg_kruskal_mst._16.lazy.exit.0                         # ir inst 79 fin
.F._ac6K71PczTg_kruskal_mst._15.lazy.else.0:
# Phi connections
  li t4, 0
  j .F._ac6K71PczTg_kruskal_mst._16.lazy.exit.0                         # ir inst 80 fin
.F._ac6K71PczTg_kruskal_mst._16.lazy.exit.0:
  bnez t4, .F._ac6K71PczTg_kruskal_mst._17.while.body.3
  j .F._ac6K71PczTg_kruskal_mst._21.while.exit.3                        # ir inst 82 fin
.F._ac6K71PczTg_kruskal_mst._17.while.body.3:
  addi t4, a0, 4                                                        # ir inst 84 fin
  mv t3, t5                                                             # ir inst 85 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 86 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 20
  mv a1, s11
  addi t1, sp, 84
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 87 fin
  addi t1, sp, 84
  addi t4, t1, 0                                                        # ir inst 88 fin
  lw t3, 0(t4)                                                          # ir inst 89 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  call .F._ac6K71PczTg_find_parent
  mv t4, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 90 fin
  addi t1, sp, 84
  addi t3, t1, 4                                                        # ir inst 91 fin
  lw s11, 0(t3)                                                         # ir inst 92 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  call .F._ac6K71PczTg_find_parent
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 93 fin
  xor t0, t4, t3
  sltu s11, zero, t0                                                    # ir inst 94 fin
  bnez s11, .F._ac6K71PczTg_kruskal_mst._18.if.then.1
  j .F._ac6K71PczTg_kruskal_mst._19.if.else.1                           # ir inst 95 fin
.F._ac6K71PczTg_kruskal_mst._18.if.then.1:
  addi t1, sp, 84
  addi t4, t1, 0                                                        # ir inst 96 fin
  lw t3, 0(t4)                                                          # ir inst 97 fin
  addi t1, sp, 84
  addi t4, t1, 4                                                        # ir inst 98 fin
  lw s11, 0(t4)                                                         # ir inst 99 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, s11
  mv a1, t3
  call .F._ac6K71PczTg_union_sets
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 100 fin
  li t4, 123020
  add t4, a0, t4                                                        # ir inst 101 fin
  lw t3, 0(t4)                                                          # ir inst 102 fin
  addi t1, sp, 84
  addi s11, t1, 8                                                       # ir inst 103 fin
  lw s10, 0(s11)                                                        # ir inst 104 fin
  add s11, t3, s10                                                      # ir inst 105 fin
  sw s11, 0(t4)                                                         # ir inst 106 fin
  addi t4, t6, 1                                                        # ir inst 107 fin
# Phi connections
  mv t6, t4
  j .F._ac6K71PczTg_kruskal_mst._20.if.exit.1                           # ir inst 108 fin
.F._ac6K71PczTg_kruskal_mst._19.if.else.1:
# Phi connections
  j .F._ac6K71PczTg_kruskal_mst._20.if.exit.1                           # ir inst 109 fin
.F._ac6K71PczTg_kruskal_mst._20.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 111 fin
# Phi connections
  mv t5, t4
  j .F._ac6K71PczTg_kruskal_mst._13.while.cond.3                        # ir inst 112 fin
.F._ac6K71PczTg_kruskal_mst._21.while.exit.3:
  j .F._ac6K71PczTg_kruskal_mst.epilogue                                # ir inst 113 fin
.F._ac6K71PczTg_kruskal_mst.epilogue:
  ld ra, 56(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 112
  ret

.globl .F._ac6K71PczTg_dfs_flow
.F._ac6K71PczTg_dfs_flow:
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 40,                 range:      104(sp) -      144(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 2 / 12,        range:       80(sp) -       96(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd s11, 80(sp)
  sd s10, 88(sp)
  sd ra, 96(sp)
.F._ac6K71PczTg_dfs_flow._0.entry.0:
  xor t0, a3, a2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F._ac6K71PczTg_dfs_flow._1.if.then.0
  j .F._ac6K71PczTg_dfs_flow._2.if.else.0                               # ir inst 2 fin
.F._ac6K71PczTg_dfs_flow._1.if.then.0:
  mv a0, a4
  j .F._ac6K71PczTg_dfs_flow.epilogue                                   # ir inst 3 fin
.F._ac6K71PczTg_dfs_flow._2.if.else.0:
  j .F._ac6K71PczTg_dfs_flow._3.if.exit.0                               # ir inst 4 fin
.F._ac6K71PczTg_dfs_flow._3.if.exit.0:
  mv t6, a3                                                             # ir inst 5 fin
  add t5, a5, t6                                                        # ir inst 6 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 7 fin
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_dfs_flow._4.while.cond.0                            # ir inst 8 fin
.F._ac6K71PczTg_dfs_flow._4.while.cond.0:
  li t5, 40004
  add t5, a0, t5                                                        # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  slt t5, t6, t4                                                        # ir inst 12 fin
  bnez t5, .F._ac6K71PczTg_dfs_flow._5.while.body.0
  j .F._ac6K71PczTg_dfs_flow._30.while.exit.0                           # ir inst 13 fin
.F._ac6K71PczTg_dfs_flow._5.while.body.0:
  addi t5, a0, 4                                                        # ir inst 15 fin
  mv t4, t6                                                             # ir inst 16 fin
  li t1, 20
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t6, 56(sp)
  li a2, 20
  mv a1, t3
  addi t1, sp, 104
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t6, 56(sp)
# ir inst 18 fin
  addi t1, sp, 104
  addi t5, t1, 0                                                        # ir inst 19 fin
  lw t4, 0(t5)                                                          # ir inst 20 fin
  xor t0, t4, a3
  sltiu t5, t0, 1                                                       # ir inst 21 fin
  bnez t5, .F._ac6K71PczTg_dfs_flow._6.lazy.then.0
  j .F._ac6K71PczTg_dfs_flow._7.lazy.else.0                             # ir inst 22 fin
.F._ac6K71PczTg_dfs_flow._6.lazy.then.0:
  addi t1, sp, 104
  addi t5, t1, 4                                                        # ir inst 23 fin
  lw t4, 0(t5)                                                          # ir inst 24 fin
  mv t5, t4                                                             # ir inst 25 fin
  add t4, a5, t5                                                        # ir inst 26 fin
  lb t5, 0(t4)                                                          # ir inst 27 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 28 fin
# Phi connections
  mv t5, t4
  j .F._ac6K71PczTg_dfs_flow._8.lazy.exit.0                             # ir inst 29 fin
.F._ac6K71PczTg_dfs_flow._7.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._ac6K71PczTg_dfs_flow._8.lazy.exit.0                             # ir inst 30 fin
.F._ac6K71PczTg_dfs_flow._8.lazy.exit.0:
  bnez t5, .F._ac6K71PczTg_dfs_flow._9.if.then.1
  j .F._ac6K71PczTg_dfs_flow._28.if.else.1                              # ir inst 32 fin
.F._ac6K71PczTg_dfs_flow._9.if.then.1:
  addi t1, sp, 104
  addi t5, t1, 12                                                       # ir inst 33 fin
  lw t4, 0(t5)                                                          # ir inst 34 fin
  addi t1, sp, 104
  addi t5, t1, 16                                                       # ir inst 35 fin
  lw t3, 0(t5)                                                          # ir inst 36 fin
  sub t5, t4, t3                                                        # ir inst 37 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 38 fin
  bnez t4, .F._ac6K71PczTg_dfs_flow._10.if.then.2
  j .F._ac6K71PczTg_dfs_flow._26.if.else.2                              # ir inst 39 fin
.F._ac6K71PczTg_dfs_flow._10.if.then.2:
  slt t4, a4, t5                                                        # ir inst 40 fin
  bnez t4, .F._ac6K71PczTg_dfs_flow._11.if.then.3
  j .F._ac6K71PczTg_dfs_flow._12.if.else.3                              # ir inst 41 fin
.F._ac6K71PczTg_dfs_flow._11.if.then.3:
# Phi connections
  mv t5, a4
  j .F._ac6K71PczTg_dfs_flow._13.if.exit.3                              # ir inst 42 fin
.F._ac6K71PczTg_dfs_flow._12.if.else.3:
# Phi connections
  j .F._ac6K71PczTg_dfs_flow._13.if.exit.3                              # ir inst 43 fin
.F._ac6K71PczTg_dfs_flow._13.if.exit.3:
  addi t1, sp, 104
  addi t4, t1, 4                                                        # ir inst 45 fin
  lw t3, 0(t4)                                                          # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a4, t5
  mv a3, t3
  call .F._ac6K71PczTg_dfs_flow
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 47 fin
  li t2, 0
  slt t5, t2, t4                                                        # ir inst 48 fin
  bnez t5, .F._ac6K71PczTg_dfs_flow._14.if.then.4
  j .F._ac6K71PczTg_dfs_flow._24.if.else.4                              # ir inst 49 fin
.F._ac6K71PczTg_dfs_flow._14.if.then.4:
  addi t5, a0, 4                                                        # ir inst 50 fin
  mv t3, t6                                                             # ir inst 51 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t5, t2                                                       # ir inst 52 fin
  addi t5, s11, 16                                                      # ir inst 53 fin
  lw t3, 0(t5)                                                          # ir inst 54 fin
  add s11, t3, t4                                                       # ir inst 55 fin
  sw s11, 0(t5)                                                         # ir inst 56 fin
# Phi connections
  li t5, 0
  j .F._ac6K71PczTg_dfs_flow._15.while.cond.1                           # ir inst 57 fin
.F._ac6K71PczTg_dfs_flow._15.while.cond.1:
  li t3, 40004
  add t3, a0, t3                                                        # ir inst 59 fin
  lw s11, 0(t3)                                                         # ir inst 60 fin
  slt t3, t5, s11                                                       # ir inst 61 fin
  bnez t3, .F._ac6K71PczTg_dfs_flow._16.while.body.1
  j .F._ac6K71PczTg_dfs_flow._31.critical_edge.0                        # ir inst 62 fin
.F._ac6K71PczTg_dfs_flow._16.while.body.1:
  addi t3, a0, 4                                                        # ir inst 64 fin
  mv s11, t5                                                            # ir inst 65 fin
  li t1, 20
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 66 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  li a2, 20
  mv a1, s10
  addi t1, sp, 124
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 67 fin
  addi t1, sp, 124
  addi t3, t1, 0                                                        # ir inst 68 fin
  lw s11, 0(t3)                                                         # ir inst 69 fin
  addi t1, sp, 104
  addi t3, t1, 4                                                        # ir inst 70 fin
  lw s10, 0(t3)                                                         # ir inst 71 fin
  xor t0, s11, s10
  sltiu t3, t0, 1                                                       # ir inst 72 fin
  bnez t3, .F._ac6K71PczTg_dfs_flow._17.lazy.then.1
  j .F._ac6K71PczTg_dfs_flow._18.lazy.else.1                            # ir inst 73 fin
.F._ac6K71PczTg_dfs_flow._17.lazy.then.1:
  addi t1, sp, 124
  addi t3, t1, 4                                                        # ir inst 74 fin
  lw s11, 0(t3)                                                         # ir inst 75 fin
  addi t1, sp, 104
  addi t3, t1, 0                                                        # ir inst 76 fin
  lw s10, 0(t3)                                                         # ir inst 77 fin
  xor t0, s11, s10
  sltiu t3, t0, 1                                                       # ir inst 78 fin
# Phi connections
  j .F._ac6K71PczTg_dfs_flow._19.lazy.exit.1                            # ir inst 79 fin
.F._ac6K71PczTg_dfs_flow._18.lazy.else.1:
# Phi connections
  li t3, 0
  j .F._ac6K71PczTg_dfs_flow._19.lazy.exit.1                            # ir inst 80 fin
.F._ac6K71PczTg_dfs_flow._19.lazy.exit.1:
  bnez t3, .F._ac6K71PczTg_dfs_flow._20.if.then.5
  j .F._ac6K71PczTg_dfs_flow._21.if.else.5                              # ir inst 82 fin
.F._ac6K71PczTg_dfs_flow._20.if.then.5:
  addi t3, a0, 4                                                        # ir inst 83 fin
  mv s11, t5                                                            # ir inst 84 fin
  li t1, 20
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 85 fin
  addi t3, s10, 16                                                      # ir inst 86 fin
  lw s11, 0(t3)                                                         # ir inst 87 fin
  sub s10, s11, t4                                                      # ir inst 88 fin
  sw s10, 0(t3)                                                         # ir inst 89 fin
  j .F._ac6K71PczTg_dfs_flow._23.while.exit.1                           # ir inst 90 fin
.F._ac6K71PczTg_dfs_flow._21.if.else.5:
  j .F._ac6K71PczTg_dfs_flow._22.if.exit.5                              # ir inst 91 fin
.F._ac6K71PczTg_dfs_flow._22.if.exit.5:
  addi t3, t5, 1                                                        # ir inst 92 fin
# Phi connections
  mv t5, t3
  j .F._ac6K71PczTg_dfs_flow._15.while.cond.1                           # ir inst 93 fin
.F._ac6K71PczTg_dfs_flow._23.while.exit.1:
  mv a0, t4
  j .F._ac6K71PczTg_dfs_flow.epilogue                                   # ir inst 94 fin
.F._ac6K71PczTg_dfs_flow._24.if.else.4:
  j .F._ac6K71PczTg_dfs_flow._25.if.exit.4                              # ir inst 95 fin
.F._ac6K71PczTg_dfs_flow._25.if.exit.4:
  j .F._ac6K71PczTg_dfs_flow._27.if.exit.2                              # ir inst 96 fin
.F._ac6K71PczTg_dfs_flow._26.if.else.2:
  j .F._ac6K71PczTg_dfs_flow._27.if.exit.2                              # ir inst 97 fin
.F._ac6K71PczTg_dfs_flow._27.if.exit.2:
  j .F._ac6K71PczTg_dfs_flow._29.if.exit.1                              # ir inst 98 fin
.F._ac6K71PczTg_dfs_flow._28.if.else.1:
  j .F._ac6K71PczTg_dfs_flow._29.if.exit.1                              # ir inst 99 fin
.F._ac6K71PczTg_dfs_flow._29.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 100 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_dfs_flow._4.while.cond.0                            # ir inst 101 fin
.F._ac6K71PczTg_dfs_flow._30.while.exit.0:
  li a0, 0
  j .F._ac6K71PczTg_dfs_flow.epilogue                                   # ir inst 102 fin
.F._ac6K71PczTg_dfs_flow._31.critical_edge.0:
  j .F._ac6K71PczTg_dfs_flow._23.while.exit.1                           # ir inst 103 fin
.F._ac6K71PczTg_dfs_flow.epilogue:
  ld ra, 96(sp)
  ld s11, 80(sp)
  ld s10, 88(sp)
  addi sp, sp, 144
  ret

.globl .F._ac6K71PczTg_max_flow
.F._ac6K71PczTg_max_flow:
# spill func args num: 0,             range:      176(sp) -      176(sp)
# local var size: 100,                range:       64(sp) -      164(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -176
  sd s11, 48(sp)
  sd ra, 56(sp)
.F._ac6K71PczTg_max_flow._0.entry.0:
# Phi connections
  li t6, 0
  j .F._ac6K71PczTg_max_flow._1.while.cond.0                            # ir inst 1 fin
.F._ac6K71PczTg_max_flow._1.while.cond.0:
  li t5, 40004
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._ac6K71PczTg_max_flow._2.while.body.0
  j .F._ac6K71PczTg_max_flow._3.while.exit.0                            # ir inst 6 fin
.F._ac6K71PczTg_max_flow._2.while.body.0:
  addi t5, a0, 4                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  li t1, 20
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 9 fin
  addi t5, t3, 16                                                       # ir inst 10 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F._ac6K71PczTg_max_flow._1.while.cond.0                            # ir inst 13 fin
.F._ac6K71PczTg_max_flow._3.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._ac6K71PczTg_max_flow._4.while.cond.1                            # ir inst 14 fin
.F._ac6K71PczTg_max_flow._4.while.cond.1:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 17 fin
  bnez t4, .F._ac6K71PczTg_max_flow._5.while.body.1
  j .F._ac6K71PczTg_max_flow._13.critical_edge.0                        # ir inst 18 fin
.F._ac6K71PczTg_max_flow._5.while.body.1:
  addi t1, sp, 64
  addi t4, t1, 0                                                        # ir inst 20 fin
# Phi connections
  li t3, 0
  j .F._ac6K71PczTg_max_flow._6.array.cond.0                            # ir inst 21 fin
.F._ac6K71PczTg_max_flow._6.array.cond.0:
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 23 fin
  bnez s11, .F._ac6K71PczTg_max_flow._7.array.body.0
  j .F._ac6K71PczTg_max_flow._8.array.exit.0                            # ir inst 24 fin
.F._ac6K71PczTg_max_flow._7.array.body.0:
  add s11, t4, t3                                                       # ir inst 25 fin
  li t1, 0
  sb t1, 0(s11)                                                         # ir inst 26 fin
  addi s11, t3, 1                                                       # ir inst 27 fin
# Phi connections
  mv t3, s11
  j .F._ac6K71PczTg_max_flow._6.array.cond.0                            # ir inst 28 fin
.F._ac6K71PczTg_max_flow._8.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  addi t1, sp, 64
  mv a5, t1
  li a4, 500
  mv a3, a1
  call .F._ac6K71PczTg_dfs_flow
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 29 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 30 fin
  bnez t3, .F._ac6K71PczTg_max_flow._9.if.then.0
  j .F._ac6K71PczTg_max_flow._10.if.else.0                              # ir inst 31 fin
.F._ac6K71PczTg_max_flow._9.if.then.0:
  j .F._ac6K71PczTg_max_flow._12.while.exit.1                           # ir inst 32 fin
.F._ac6K71PczTg_max_flow._10.if.else.0:
  j .F._ac6K71PczTg_max_flow._11.if.exit.0                              # ir inst 33 fin
.F._ac6K71PczTg_max_flow._11.if.exit.0:
  add t3, t5, t4                                                        # ir inst 34 fin
  addi t4, t6, 1                                                        # ir inst 35 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F._ac6K71PczTg_max_flow._4.while.cond.1                            # ir inst 36 fin
.F._ac6K71PczTg_max_flow._12.while.exit.1:
  mv a0, t5
  j .F._ac6K71PczTg_max_flow.epilogue                                   # ir inst 37 fin
.F._ac6K71PczTg_max_flow._13.critical_edge.0:
  j .F._ac6K71PczTg_max_flow._12.while.exit.1                           # ir inst 38 fin
.F._ac6K71PczTg_max_flow.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 176
  ret

.globl .F._ac6K71PczTg_analyze_graph
.F._ac6K71PczTg_analyze_graph:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F._ac6K71PczTg_analyze_graph._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._ac6K71PczTg_dijkstra
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
  li t6, 80408
  add t6, a0, t6                                                        # ir inst 2 fin
  mv t5, a2                                                             # ir inst 3 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 4 fin
  lw t6, 0(t4)                                                          # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._ac6K71PczTg_floyd_warshall
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 7 fin
  li t6, 80908
  add t6, a0, t6                                                        # ir inst 8 fin
  mv t5, a1                                                             # ir inst 9 fin
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 10 fin
  mv t6, a2                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, t4, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._ac6K71PczTg_find_all_scc
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 15 fin
  li t6, 122216
  add t6, a0, t6                                                        # ir inst 16 fin
  lw t5, 0(t6)                                                          # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._ac6K71PczTg_kruskal_mst
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 19 fin
  li t6, 123020
  add t6, a0, t6                                                        # ir inst 20 fin
  lw t5, 0(t6)                                                          # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._ac6K71PczTg_max_flow
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 23 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 24 fin
  j .F._ac6K71PczTg_analyze_graph.epilogue                              # ir inst 25 fin
.F._ac6K71PczTg_analyze_graph.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._fGZ7fiIE3um_new
.F._fGZ7fiIE3um_new:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._fGZ7fiIE3um_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
  j .F._fGZ7fiIE3um_new.epilogue                                        # ir inst 3 fin
.F._fGZ7fiIE3um_new.epilogue:
  ret

.globl .F._fGZ7fiIE3um_next_random
.F._fGZ7fiIE3um_next_random:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F._fGZ7fiIE3um_next_random._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, a0, 0                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call .F.pm_rand_update
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
  addi t6, a0, 0                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 8 fin
  bnez t6, .F._fGZ7fiIE3um_next_random._1.if.then.0
  j .F._fGZ7fiIE3um_next_random._2.if.else.0                            # ir inst 9 fin
.F._fGZ7fiIE3um_next_random._1.if.then.0:
  addi t6, a0, 0                                                        # ir inst 10 fin
  addi t5, a0, 0                                                        # ir inst 11 fin
  lw t4, 0(t5)                                                          # ir inst 12 fin
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 13 fin
  sw t5, 0(t6)                                                          # ir inst 14 fin
  j .F._fGZ7fiIE3um_next_random._3.if.exit.0                            # ir inst 15 fin
.F._fGZ7fiIE3um_next_random._2.if.else.0:
  j .F._fGZ7fiIE3um_next_random._3.if.exit.0                            # ir inst 16 fin
.F._fGZ7fiIE3um_next_random._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 17 fin
  lw t5, 0(t6)                                                          # ir inst 18 fin
  mv a0, t5
  j .F._fGZ7fiIE3um_next_random.epilogue                                # ir inst 19 fin
.F._fGZ7fiIE3um_next_random.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._fGZ7fiIE3um_generate_complex_graph
.F._fGZ7fiIE3um_generate_complex_graph:
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
.F._fGZ7fiIE3um_generate_complex_graph._0.entry.0:
  addi t6, a1, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  mul t6, t5, t5                                                        # ir inst 3 fin
  mul t4, t6, a2                                                        # ir inst 4 fin
  li t2, 100
  div t6, t4, t2                                                        # ir inst 5 fin
# Phi connections
  li t4, 0
  j .F._fGZ7fiIE3um_generate_complex_graph._1.while.cond.0              # ir inst 6 fin
.F._fGZ7fiIE3um_generate_complex_graph._1.while.cond.0:
  slt t3, t4, t6                                                        # ir inst 8 fin
  bnez t3, .F._fGZ7fiIE3um_generate_complex_graph._2.lazy.then.0
  j .F._fGZ7fiIE3um_generate_complex_graph._3.lazy.else.0               # ir inst 9 fin
.F._fGZ7fiIE3um_generate_complex_graph._2.lazy.then.0:
  li t2, 1800
  slt t3, t4, t2                                                        # ir inst 10 fin
# Phi connections
  j .F._fGZ7fiIE3um_generate_complex_graph._4.lazy.exit.0               # ir inst 11 fin
.F._fGZ7fiIE3um_generate_complex_graph._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._fGZ7fiIE3um_generate_complex_graph._4.lazy.exit.0               # ir inst 12 fin
.F._fGZ7fiIE3um_generate_complex_graph._4.lazy.exit.0:
  bnez t3, .F._fGZ7fiIE3um_generate_complex_graph._5.while.body.0
  j .F._fGZ7fiIE3um_generate_complex_graph._9.while.exit.0              # ir inst 14 fin
.F._fGZ7fiIE3um_generate_complex_graph._5.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F._fGZ7fiIE3um_next_random
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 15 fin
  rem s11, t3, t5                                                       # ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F._fGZ7fiIE3um_next_random
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 17 fin
  rem s10, t3, t5                                                       # ir inst 18 fin
  xor t0, s11, s10
  sltu t3, zero, t0                                                     # ir inst 19 fin
  bnez t3, .F._fGZ7fiIE3um_generate_complex_graph._6.if.then.0
  j .F._fGZ7fiIE3um_generate_complex_graph._7.if.else.0                 # ir inst 20 fin
.F._fGZ7fiIE3um_generate_complex_graph._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F._fGZ7fiIE3um_next_random
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 21 fin
  li t2, 100
  rem s9, t3, t2                                                        # ir inst 22 fin
  addi t3, s9, 1                                                        # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  call .F._fGZ7fiIE3um_next_random
  mv s9, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 24 fin
  li t2, 50
  rem s8, s9, t2                                                        # ir inst 25 fin
  addi s9, s8, 1                                                        # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a4, s9
  mv a3, t3
  mv a2, s10
  mv a0, a1
  mv a1, s11
  call .F._ac6K71PczTg_add_edge
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 27 fin
  addi t3, t4, 1                                                        # ir inst 28 fin
# Phi connections
  mv t4, t3
  j .F._fGZ7fiIE3um_generate_complex_graph._8.if.exit.0                 # ir inst 29 fin
.F._fGZ7fiIE3um_generate_complex_graph._7.if.else.0:
# Phi connections
  j .F._fGZ7fiIE3um_generate_complex_graph._8.if.exit.0                 # ir inst 30 fin
.F._fGZ7fiIE3um_generate_complex_graph._8.if.exit.0:
# Phi connections
  j .F._fGZ7fiIE3um_generate_complex_graph._1.while.cond.0              # ir inst 32 fin
.F._fGZ7fiIE3um_generate_complex_graph._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F._fGZ7fiIE3um_generate_complex_graph._10.while.cond.1             # ir inst 33 fin
.F._fGZ7fiIE3um_generate_complex_graph._10.while.cond.1:
  addi t4, t5, -1                                                       # ir inst 35 fin
  slt t3, t6, t4                                                        # ir inst 36 fin
  bnez t3, .F._fGZ7fiIE3um_generate_complex_graph._11.while.body.1
  j .F._fGZ7fiIE3um_generate_complex_graph._12.while.exit.1             # ir inst 37 fin
.F._fGZ7fiIE3um_generate_complex_graph._11.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F._fGZ7fiIE3um_next_random
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 38 fin
  li t2, 20
  rem t3, t4, t2                                                        # ir inst 39 fin
  addi t4, t3, 1                                                        # ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F._fGZ7fiIE3um_next_random
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 41 fin
  li t2, 30
  rem s11, t3, t2                                                       # ir inst 42 fin
  addi t3, s11, 1                                                       # ir inst 43 fin
  addi s11, t6, 1                                                       # ir inst 44 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a4, t3
  mv a3, t4
  mv a2, s11
  mv a0, a1
  mv a1, t6
  call .F._ac6K71PczTg_add_edge
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 45 fin
  addi t4, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t4
  j .F._fGZ7fiIE3um_generate_complex_graph._10.while.cond.1             # ir inst 47 fin
.F._fGZ7fiIE3um_generate_complex_graph._12.while.exit.1:
  j .F._fGZ7fiIE3um_generate_complex_graph.epilogue                     # ir inst 48 fin
.F._fGZ7fiIE3um_generate_complex_graph.epilogue:
  ld ra, 80(sp)
  ld s8, 48(sp)
  ld s9, 56(sp)
  ld s10, 64(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl main
main:
# spill func args num: 0,             range:   123120(sp) -   123120(sp)
# local var size: 123028,             range:       88(sp) -   123116(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 6 / 12,        range:       32(sp) -       80(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -123120
  add sp, sp, t0
  sd s11, 32(sp)
  sd s7, 40(sp)
  sd s6, 48(sp)
  sd s8, 56(sp)
  sd s9, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
main._0.entry.0:
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 1 fin
# Start call preparation
  sd t6, 0(sp)
  call getInt
  mv t5, a0
  ld t6, 0(sp)
# ir inst 2 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 3 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 4 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call getInt
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 5 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  addi t1, sp, 88
  mv a0, t1
  call .F._ac6K71PczTg_new
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 7 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  li t1, 123112
  add t1, sp, t1
  mv a0, t1
  call .F._fGZ7fiIE3um_new
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  addi t1, sp, 88
  mv a1, t1
  li t1, 123112
  add t1, sp, t1
  mv a0, t1
  call .F._fGZ7fiIE3um_generate_complex_graph
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t3
  mv a1, t4
  addi t1, sp, 88
  mv a0, t1
  call .F._ac6K71PczTg_analyze_graph
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 11 fin
# Phi connections
  li t5, 0
  j main._1.while.cond.0                                                # ir inst 12 fin
main._1.while.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 14 fin
  bnez t4, main._2.while.body.0
  j main._6.while.exit.0                                                # ir inst 15 fin
main._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li t1, 123112
  add t1, sp, t1
  mv a0, t1
  call .F._fGZ7fiIE3um_next_random
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 16 fin
  rem t3, t4, t6                                                        # ir inst 17 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 123112
  add t1, sp, t1
  mv a0, t1
  call .F._fGZ7fiIE3um_next_random
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  rem s11, t4, t6                                                       # ir inst 19 fin
  xor t0, t3, s11
  sltu t4, zero, t0                                                     # ir inst 20 fin
  bnez t4, main._3.if.then.0
  j main._4.if.else.0                                                   # ir inst 21 fin
main._3.if.then.0:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  addi t1, sp, 88
  mv a0, t1
  call .F._ac6K71PczTg_dijkstra
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 22 fin
  addi t1, sp, 88
  li t4, 80408
  add t4, t1, t4                                                        # ir inst 23 fin
  mv t3, s11                                                            # ir inst 24 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 25 fin
  lw t4, 0(s11)                                                         # ir inst 26 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 27 fin
  j main._5.if.exit.0                                                   # ir inst 28 fin
main._4.if.else.0:
  j main._5.if.exit.0                                                   # ir inst 29 fin
main._5.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j main._1.while.cond.0                                                # ir inst 31 fin
main._6.while.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  j main._7.while.cond.1                                                # ir inst 32 fin
main._7.while.cond.1:
  li t2, 5
  slt t3, t5, t2                                                        # ir inst 35 fin
  bnez t3, main._8.while.body.1
  j main._9.while.exit.1                                                # ir inst 36 fin
main._8.while.body.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 88
  mv a0, t1
  call .F._ac6K71PczTg_find_all_scc
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 37 fin
  addi t1, sp, 88
  li t3, 122216
  add t3, t1, t3                                                        # ir inst 38 fin
  lw s11, 0(t3)                                                         # ir inst 39 fin
  add t3, t4, s11                                                       # ir inst 40 fin
  addi s11, t5, 1                                                       # ir inst 41 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._7.while.cond.1                                                # ir inst 42 fin
main._9.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 43 fin
# Phi connections
  li t3, 0
  li t5, 0
  j main._10.while.cond.2                                               # ir inst 44 fin
main._10.while.cond.2:
  li t2, 3
  slt s11, t5, t2                                                       # ir inst 47 fin
  bnez s11, main._11.while.body.2
  j main._18.while.exit.2                                               # ir inst 48 fin
main._11.while.body.2:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 88
  mv a0, t1
  call .F._ac6K71PczTg_kruskal_mst
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 49 fin
  addi t1, sp, 88
  li s11, 123020
  add s11, t1, s11                                                      # ir inst 50 fin
  lw s10, 0(s11)                                                        # ir inst 51 fin
  add s11, t3, s10                                                      # ir inst 52 fin
# Phi connections
  li s10, 0
  j main._12.while.cond.3                                               # ir inst 53 fin
main._12.while.cond.3:
  li t2, 10
  slt s9, s10, t2                                                       # ir inst 55 fin
  bnez s9, main._13.lazy.then.0
  j main._14.lazy.else.0                                                # ir inst 56 fin
main._13.lazy.then.0:
  addi t1, sp, 88
  li s9, 40004
  add s9, t1, s9                                                        # ir inst 57 fin
  lw s8, 0(s9)                                                          # ir inst 58 fin
  slt s9, s10, s8                                                       # ir inst 59 fin
# Phi connections
  j main._15.lazy.exit.0                                                # ir inst 60 fin
main._14.lazy.else.0:
# Phi connections
  li s9, 0
  j main._15.lazy.exit.0                                                # ir inst 61 fin
main._15.lazy.exit.0:
  bnez s9, main._16.while.body.3
  j main._17.while.exit.3                                               # ir inst 63 fin
main._16.while.body.3:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 123112
  add t1, sp, t1
  mv a0, t1
  call .F._fGZ7fiIE3um_next_random
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 64 fin
  li t2, 50
  rem s8, s9, t2                                                        # ir inst 65 fin
  addi s9, s8, 1                                                        # ir inst 66 fin
  addi t1, sp, 88
  addi s8, t1, 4                                                        # ir inst 67 fin
  mv s7, s10                                                            # ir inst 68 fin
  li t1, 20
  mul t2, s7, t1
  add s6, s8, t2                                                        # ir inst 69 fin
  addi s8, s6, 8                                                        # ir inst 70 fin
  sw s9, 0(s8)                                                          # ir inst 71 fin
  addi s9, s10, 1                                                       # ir inst 72 fin
# Phi connections
  mv s10, s9
  j main._12.while.cond.3                                               # ir inst 73 fin
main._17.while.exit.3:
  addi s10, t5, 1                                                       # ir inst 74 fin
# Phi connections
  mv t3, s11
  mv t5, s10
  j main._10.while.cond.2                                               # ir inst 75 fin
main._18.while.exit.2:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 76 fin
  mul t5, t4, t3                                                        # ir inst 77 fin
  addi t4, t6, 1                                                        # ir inst 78 fin
  div t6, t5, t4                                                        # ir inst 79 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 80 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 81 fin
  j main.epilogue                                                       # ir inst 82 fin
main.epilogue:
  ld ra, 80(sp)
  ld s11, 32(sp)
  ld s7, 40(sp)
  ld s6, 48(sp)
  ld s8, 56(sp)
  ld s9, 64(sp)
  ld s10, 72(sp)
  li t0, 123120
  add sp, sp, t0
  ret
