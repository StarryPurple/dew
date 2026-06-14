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

.globl .F._3MoxJ9jWv8O_new
.F._3MoxJ9jWv8O_new:
# spill func args num: 0,             range:     1328(sp) -     1328(sp)
# local var size: 1280,               range:       40(sp) -     1320(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1328
  sd ra, 32(sp)
.F._3MoxJ9jWv8O_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_new._1.array.cond.0                                 # ir inst 4 fin
.F._3MoxJ9jWv8O_new._1.array.cond.0:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 6 fin
  bnez t3, .F._3MoxJ9jWv8O_new._2.array.body.0
  j .F._3MoxJ9jWv8O_new._3.array.exit.0                                 # ir inst 7 fin
.F._3MoxJ9jWv8O_new._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 9 fin
  addi t3, t4, 1                                                        # ir inst 10 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_new._1.array.cond.0                                 # ir inst 11 fin
.F._3MoxJ9jWv8O_new._3.array.exit.0:
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._4.array.cond.1                                 # ir inst 13 fin
.F._3MoxJ9jWv8O_new._4.array.cond.1:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F._3MoxJ9jWv8O_new._5.array.body.1
  j .F._3MoxJ9jWv8O_new._6.array.exit.1                                 # ir inst 16 fin
.F._3MoxJ9jWv8O_new._5.array.body.1:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 17 fin
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
# ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._4.array.cond.1                                 # ir inst 20 fin
.F._3MoxJ9jWv8O_new._6.array.exit.1:
  li t6, 40000
  add t6, a0, t6                                                        # ir inst 21 fin
  addi t1, sp, 440
  addi t5, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_new._7.array.cond.2                                 # ir inst 24 fin
.F._3MoxJ9jWv8O_new._7.array.cond.2:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 26 fin
  bnez t3, .F._3MoxJ9jWv8O_new._8.array.body.2
  j .F._3MoxJ9jWv8O_new._9.array.exit.2                                 # ir inst 27 fin
.F._3MoxJ9jWv8O_new._8.array.body.2:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 29 fin
  addi t3, t4, 1                                                        # ir inst 30 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_new._7.array.cond.2                                 # ir inst 31 fin
.F._3MoxJ9jWv8O_new._9.array.exit.2:
  addi t5, t6, 0                                                        # ir inst 32 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._10.array.cond.3                                # ir inst 33 fin
.F._3MoxJ9jWv8O_new._10.array.cond.3:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 35 fin
  bnez t4, .F._3MoxJ9jWv8O_new._11.array.body.3
  j .F._3MoxJ9jWv8O_new._12.array.exit.3                                # ir inst 36 fin
.F._3MoxJ9jWv8O_new._11.array.body.3:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 37 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  addi t1, sp, 440
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 38 fin
  addi t4, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._10.array.cond.3                                # ir inst 40 fin
.F._3MoxJ9jWv8O_new._12.array.exit.3:
  li t6, 80000
  add t6, a0, t6                                                        # ir inst 41 fin
  addi t1, sp, 840
  addi t5, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_new._13.array.cond.4                                # ir inst 44 fin
.F._3MoxJ9jWv8O_new._13.array.cond.4:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 46 fin
  bnez t3, .F._3MoxJ9jWv8O_new._14.array.body.4
  j .F._3MoxJ9jWv8O_new._15.array.exit.4                                # ir inst 47 fin
.F._3MoxJ9jWv8O_new._14.array.body.4:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 48 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 49 fin
  addi t3, t4, 1                                                        # ir inst 50 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_new._13.array.cond.4                                # ir inst 51 fin
.F._3MoxJ9jWv8O_new._15.array.exit.4:
  addi t5, t6, 0                                                        # ir inst 52 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._16.array.cond.5                                # ir inst 53 fin
.F._3MoxJ9jWv8O_new._16.array.cond.5:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 55 fin
  bnez t4, .F._3MoxJ9jWv8O_new._17.array.body.5
  j .F._3MoxJ9jWv8O_new._18.array.exit.5                                # ir inst 56 fin
.F._3MoxJ9jWv8O_new._17.array.body.5:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 57 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  addi t1, sp, 840
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
  j .F._3MoxJ9jWv8O_new._16.array.cond.5                                # ir inst 60 fin
.F._3MoxJ9jWv8O_new._18.array.exit.5:
  li t6, 120000
  add t6, a0, t6                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 62 fin
  li t6, 120004
  add t6, a0, t6                                                        # ir inst 63 fin
  addi t5, t6, 0                                                        # ir inst 64 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._19.array.cond.6                                # ir inst 65 fin
.F._3MoxJ9jWv8O_new._19.array.cond.6:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 67 fin
  bnez t4, .F._3MoxJ9jWv8O_new._20.array.body.6
  j .F._3MoxJ9jWv8O_new._21.array.exit.6                                # ir inst 68 fin
.F._3MoxJ9jWv8O_new._20.array.body.6:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 69 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 70 fin
  addi t4, t6, 1                                                        # ir inst 71 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._19.array.cond.6                                # ir inst 72 fin
.F._3MoxJ9jWv8O_new._21.array.exit.6:
  li t6, 120804
  add t6, a0, t6                                                        # ir inst 73 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 74 fin
  li t6, 120808
  add t6, a0, t6                                                        # ir inst 75 fin
  addi t5, t6, 0                                                        # ir inst 76 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._22.array.cond.7                                # ir inst 77 fin
.F._3MoxJ9jWv8O_new._22.array.cond.7:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 79 fin
  bnez t4, .F._3MoxJ9jWv8O_new._23.array.body.7
  j .F._3MoxJ9jWv8O_new._24.array.exit.7                                # ir inst 80 fin
.F._3MoxJ9jWv8O_new._23.array.body.7:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 81 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 82 fin
  addi t4, t6, 1                                                        # ir inst 83 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._22.array.cond.7                                # ir inst 84 fin
.F._3MoxJ9jWv8O_new._24.array.exit.7:
  li t6, 121008
  add t6, a0, t6                                                        # ir inst 85 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 86 fin
  li t6, 121012
  add t6, a0, t6                                                        # ir inst 87 fin
  addi t5, t6, 0                                                        # ir inst 88 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._25.array.cond.8                                # ir inst 89 fin
.F._3MoxJ9jWv8O_new._25.array.cond.8:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 91 fin
  bnez t4, .F._3MoxJ9jWv8O_new._26.array.body.8
  j .F._3MoxJ9jWv8O_new._27.array.exit.8                                # ir inst 92 fin
.F._3MoxJ9jWv8O_new._26.array.body.8:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 93 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 94 fin
  addi t4, t6, 1                                                        # ir inst 95 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._25.array.cond.8                                # ir inst 96 fin
.F._3MoxJ9jWv8O_new._27.array.exit.8:
  li t6, 125012
  add t6, a0, t6                                                        # ir inst 97 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 98 fin
  li t6, 125016
  add t6, a0, t6                                                        # ir inst 99 fin
  addi t5, t6, 0                                                        # ir inst 100 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._28.array.cond.9                                # ir inst 101 fin
.F._3MoxJ9jWv8O_new._28.array.cond.9:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 103 fin
  bnez t4, .F._3MoxJ9jWv8O_new._29.array.body.9
  j .F._3MoxJ9jWv8O_new._30.array.exit.9                                # ir inst 104 fin
.F._3MoxJ9jWv8O_new._29.array.body.9:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 105 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 106 fin
  addi t4, t6, 1                                                        # ir inst 107 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._28.array.cond.9                                # ir inst 108 fin
.F._3MoxJ9jWv8O_new._30.array.exit.9:
  li t6, 125056
  add t6, a0, t6                                                        # ir inst 109 fin
  addi t5, t6, 0                                                        # ir inst 110 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._31.array.cond.10                               # ir inst 111 fin
.F._3MoxJ9jWv8O_new._31.array.cond.10:
  li t2, 512
  slt t4, t6, t2                                                        # ir inst 113 fin
  bnez t4, .F._3MoxJ9jWv8O_new._32.array.body.10
  j .F._3MoxJ9jWv8O_new._33.array.exit.10                               # ir inst 114 fin
.F._3MoxJ9jWv8O_new._32.array.body.10:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 115 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 116 fin
  addi t4, t6, 1                                                        # ir inst 117 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._31.array.cond.10                               # ir inst 118 fin
.F._3MoxJ9jWv8O_new._33.array.exit.10:
  li t6, 127104
  add t6, a0, t6                                                        # ir inst 119 fin
  addi t5, t6, 0                                                        # ir inst 120 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._34.array.cond.11                               # ir inst 121 fin
.F._3MoxJ9jWv8O_new._34.array.cond.11:
  li t2, 512
  slt t4, t6, t2                                                        # ir inst 123 fin
  bnez t4, .F._3MoxJ9jWv8O_new._35.array.body.11
  j .F._3MoxJ9jWv8O_new._36.array.exit.11                               # ir inst 124 fin
.F._3MoxJ9jWv8O_new._35.array.body.11:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 125 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 126 fin
  addi t4, t6, 1                                                        # ir inst 127 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._34.array.cond.11                               # ir inst 128 fin
.F._3MoxJ9jWv8O_new._36.array.exit.11:
  li t6, 129152
  add t6, a0, t6                                                        # ir inst 129 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 130 fin
  li t6, 129156
  add t6, a0, t6                                                        # ir inst 131 fin
  addi t5, t6, 0                                                        # ir inst 132 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._37.array.cond.12                               # ir inst 133 fin
.F._3MoxJ9jWv8O_new._37.array.cond.12:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 135 fin
  bnez t4, .F._3MoxJ9jWv8O_new._38.array.body.12
  j .F._3MoxJ9jWv8O_new._39.array.exit.12                               # ir inst 136 fin
.F._3MoxJ9jWv8O_new._38.array.body.12:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 137 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 138 fin
  addi t4, t6, 1                                                        # ir inst 139 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._37.array.cond.12                               # ir inst 140 fin
.F._3MoxJ9jWv8O_new._39.array.exit.12:
  li t6, 133156
  add t6, a0, t6                                                        # ir inst 141 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 142 fin
  li t6, 133160
  add t6, a0, t6                                                        # ir inst 143 fin
  addi t1, sp, 1240
  addi t5, t1, 0                                                        # ir inst 145 fin
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_new._40.array.cond.13                               # ir inst 146 fin
.F._3MoxJ9jWv8O_new._40.array.cond.13:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 148 fin
  bnez t3, .F._3MoxJ9jWv8O_new._41.array.body.13
  j .F._3MoxJ9jWv8O_new._42.array.exit.13                               # ir inst 149 fin
.F._3MoxJ9jWv8O_new._41.array.body.13:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 150 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 151 fin
  addi t3, t4, 1                                                        # ir inst 152 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_new._40.array.cond.13                               # ir inst 153 fin
.F._3MoxJ9jWv8O_new._42.array.exit.13:
  addi t5, t6, 0                                                        # ir inst 154 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._43.array.cond.14                               # ir inst 155 fin
.F._3MoxJ9jWv8O_new._43.array.cond.14:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 157 fin
  bnez t4, .F._3MoxJ9jWv8O_new._44.array.body.14
  j .F._3MoxJ9jWv8O_new._45.array.exit.14                               # ir inst 158 fin
.F._3MoxJ9jWv8O_new._44.array.body.14:
  li t1, 80
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 159 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 80
  addi t1, sp, 1240
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 160 fin
  addi t4, t6, 1                                                        # ir inst 161 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._43.array.cond.14                               # ir inst 162 fin
.F._3MoxJ9jWv8O_new._45.array.exit.14:
  li t6, 141160
  add t6, a0, t6                                                        # ir inst 163 fin
  addi t5, t6, 0                                                        # ir inst 164 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._46.array.cond.15                               # ir inst 165 fin
.F._3MoxJ9jWv8O_new._46.array.cond.15:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 167 fin
  bnez t4, .F._3MoxJ9jWv8O_new._47.array.body.15
  j .F._3MoxJ9jWv8O_new._48.array.exit.15                               # ir inst 168 fin
.F._3MoxJ9jWv8O_new._47.array.body.15:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 169 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 170 fin
  addi t4, t6, 1                                                        # ir inst 171 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._46.array.cond.15                               # ir inst 172 fin
.F._3MoxJ9jWv8O_new._48.array.exit.15:
  li t6, 149160
  add t6, a0, t6                                                        # ir inst 173 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 174 fin
  li t6, 149164
  add t6, a0, t6                                                        # ir inst 175 fin
  addi t5, t6, 0                                                        # ir inst 176 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._49.array.cond.16                               # ir inst 177 fin
.F._3MoxJ9jWv8O_new._49.array.cond.16:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 179 fin
  bnez t4, .F._3MoxJ9jWv8O_new._50.array.body.16
  j .F._3MoxJ9jWv8O_new._51.array.exit.16                               # ir inst 180 fin
.F._3MoxJ9jWv8O_new._50.array.body.16:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 181 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 182 fin
  addi t4, t6, 1                                                        # ir inst 183 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._49.array.cond.16                               # ir inst 184 fin
.F._3MoxJ9jWv8O_new._51.array.exit.16:
  li t6, 149204
  add t6, a0, t6                                                        # ir inst 185 fin
  addi t5, t6, 0                                                        # ir inst 186 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._52.array.cond.17                               # ir inst 187 fin
.F._3MoxJ9jWv8O_new._52.array.cond.17:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 189 fin
  bnez t4, .F._3MoxJ9jWv8O_new._53.array.body.17
  j .F._3MoxJ9jWv8O_new._54.array.exit.17                               # ir inst 190 fin
.F._3MoxJ9jWv8O_new._53.array.body.17:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 191 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 192 fin
  addi t4, t6, 1                                                        # ir inst 193 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._52.array.cond.17                               # ir inst 194 fin
.F._3MoxJ9jWv8O_new._54.array.exit.17:
  li t6, 149604
  add t6, a0, t6                                                        # ir inst 195 fin
  addi t5, t6, 0                                                        # ir inst 196 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_new._55.array.cond.18                               # ir inst 197 fin
.F._3MoxJ9jWv8O_new._55.array.cond.18:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 199 fin
  bnez t4, .F._3MoxJ9jWv8O_new._56.array.body.18
  j .F._3MoxJ9jWv8O_new._57.array.exit.18                               # ir inst 200 fin
.F._3MoxJ9jWv8O_new._56.array.body.18:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 201 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 202 fin
  addi t4, t6, 1                                                        # ir inst 203 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_new._55.array.cond.18                               # ir inst 204 fin
.F._3MoxJ9jWv8O_new._57.array.exit.18:
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 205 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 206 fin
  j .F._3MoxJ9jWv8O_new.epilogue                                        # ir inst 207 fin
.F._3MoxJ9jWv8O_new.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 1328
  ret

.globl .F._3MoxJ9jWv8O_initialize_matrices
.F._3MoxJ9jWv8O_initialize_matrices:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F._3MoxJ9jWv8O_initialize_matrices._0.entry.0:
  li t6, 120000
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_initialize_matrices._1.while.cond.0                 # ir inst 3 fin
.F._3MoxJ9jWv8O_initialize_matrices._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_initialize_matrices._2.while.body.0
  j .F._3MoxJ9jWv8O_initialize_matrices._6.while.exit.0                 # ir inst 6 fin
.F._3MoxJ9jWv8O_initialize_matrices._2.while.body.0:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_initialize_matrices._3.while.cond.1                 # ir inst 7 fin
.F._3MoxJ9jWv8O_initialize_matrices._3.while.cond.1:
  slt t4, t5, a1                                                        # ir inst 9 fin
  bnez t4, .F._3MoxJ9jWv8O_initialize_matrices._4.while.body.1
  j .F._3MoxJ9jWv8O_initialize_matrices._5.while.exit.1                 # ir inst 10 fin
.F._3MoxJ9jWv8O_initialize_matrices._4.while.body.1:
  addi t4, a0, 0                                                        # ir inst 11 fin
  mv t3, t6                                                             # ir inst 12 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 13 fin
  mv t4, t5                                                             # ir inst 14 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call getInt
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 16 fin
  sw t4, 0(t3)                                                          # ir inst 17 fin
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_initialize_matrices._3.while.cond.1                 # ir inst 19 fin
.F._3MoxJ9jWv8O_initialize_matrices._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_initialize_matrices._1.while.cond.0                 # ir inst 21 fin
.F._3MoxJ9jWv8O_initialize_matrices._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_initialize_matrices._7.while.cond.2                 # ir inst 22 fin
.F._3MoxJ9jWv8O_initialize_matrices._7.while.cond.2:
  slt t5, t6, a1                                                        # ir inst 24 fin
  bnez t5, .F._3MoxJ9jWv8O_initialize_matrices._8.while.body.2
  j .F._3MoxJ9jWv8O_initialize_matrices._12.while.exit.2                # ir inst 25 fin
.F._3MoxJ9jWv8O_initialize_matrices._8.while.body.2:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_initialize_matrices._9.while.cond.3                 # ir inst 26 fin
.F._3MoxJ9jWv8O_initialize_matrices._9.while.cond.3:
  slt t4, t5, a1                                                        # ir inst 28 fin
  bnez t4, .F._3MoxJ9jWv8O_initialize_matrices._10.while.body.3
  j .F._3MoxJ9jWv8O_initialize_matrices._11.while.exit.3                # ir inst 29 fin
.F._3MoxJ9jWv8O_initialize_matrices._10.while.body.3:
  li t4, 40000
  add t4, a0, t4                                                        # ir inst 30 fin
  mv t3, t6                                                             # ir inst 31 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 32 fin
  mv t4, t5                                                             # ir inst 33 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call getInt
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 35 fin
  sw t4, 0(t3)                                                          # ir inst 36 fin
  addi t4, t5, 1                                                        # ir inst 37 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_initialize_matrices._9.while.cond.3                 # ir inst 38 fin
.F._3MoxJ9jWv8O_initialize_matrices._11.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_initialize_matrices._7.while.cond.2                 # ir inst 40 fin
.F._3MoxJ9jWv8O_initialize_matrices._12.while.exit.2:
  j .F._3MoxJ9jWv8O_initialize_matrices.epilogue                        # ir inst 41 fin
.F._3MoxJ9jWv8O_initialize_matrices.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F._3MoxJ9jWv8O_matrix_multiply
.F._3MoxJ9jWv8O_matrix_multiply:
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
.F._3MoxJ9jWv8O_matrix_multiply._0.entry.0:
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_matrix_multiply._1.while.cond.0                     # ir inst 1 fin
.F._3MoxJ9jWv8O_matrix_multiply._1.while.cond.0:
  li t5, 120000
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_matrix_multiply._2.while.body.0
  j .F._3MoxJ9jWv8O_matrix_multiply._9.while.exit.0                     # ir inst 6 fin
.F._3MoxJ9jWv8O_matrix_multiply._2.while.body.0:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_matrix_multiply._3.while.cond.1                     # ir inst 7 fin
.F._3MoxJ9jWv8O_matrix_multiply._3.while.cond.1:
  li t4, 120000
  add t4, a0, t4                                                        # ir inst 9 fin
  lw t3, 0(t4)                                                          # ir inst 10 fin
  slt t4, t5, t3                                                        # ir inst 11 fin
  bnez t4, .F._3MoxJ9jWv8O_matrix_multiply._4.while.body.1
  j .F._3MoxJ9jWv8O_matrix_multiply._8.while.exit.1                     # ir inst 12 fin
.F._3MoxJ9jWv8O_matrix_multiply._4.while.body.1:
  li t4, 80000
  add t4, a0, t4                                                        # ir inst 13 fin
  mv t3, t6                                                             # ir inst 14 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 17 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 18 fin
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_matrix_multiply._5.while.cond.2                     # ir inst 19 fin
.F._3MoxJ9jWv8O_matrix_multiply._5.while.cond.2:
  li t3, 120000
  add t3, a0, t3                                                        # ir inst 21 fin
  lw s11, 0(t3)                                                         # ir inst 22 fin
  slt t3, t4, s11                                                       # ir inst 23 fin
  bnez t3, .F._3MoxJ9jWv8O_matrix_multiply._6.while.body.2
  j .F._3MoxJ9jWv8O_matrix_multiply._7.while.exit.2                     # ir inst 24 fin
.F._3MoxJ9jWv8O_matrix_multiply._6.while.body.2:
  li t3, 80000
  add t3, a0, t3                                                        # ir inst 25 fin
  mv s11, t6                                                            # ir inst 26 fin
  li t1, 400
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 27 fin
  mv t3, t5                                                             # ir inst 28 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 29 fin
  lw t3, 0(s11)                                                         # ir inst 30 fin
  addi s10, a0, 0                                                       # ir inst 31 fin
  mv s9, t6                                                             # ir inst 32 fin
  li t1, 400
  mul t2, s9, t1
  add s8, s10, t2                                                       # ir inst 33 fin
  mv s10, t4                                                            # ir inst 34 fin
  slli t2, s10, 2
  add s9, s8, t2                                                        # ir inst 35 fin
  lw s10, 0(s9)                                                         # ir inst 36 fin
  li s9, 40000
  add s9, a0, s9                                                        # ir inst 37 fin
  mv s8, t4                                                             # ir inst 38 fin
  li t1, 400
  mul t2, s8, t1
  add s7, s9, t2                                                        # ir inst 39 fin
  mv s9, t5                                                             # ir inst 40 fin
  slli t2, s9, 2
  add s8, s7, t2                                                        # ir inst 41 fin
  lw s9, 0(s8)                                                          # ir inst 42 fin
  mul s8, s10, s9                                                       # ir inst 43 fin
  add s10, t3, s8                                                       # ir inst 44 fin
  sw s10, 0(s11)                                                        # ir inst 45 fin
  addi t3, t4, 1                                                        # ir inst 46 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_matrix_multiply._5.while.cond.2                     # ir inst 47 fin
.F._3MoxJ9jWv8O_matrix_multiply._7.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 48 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_matrix_multiply._3.while.cond.1                     # ir inst 49 fin
.F._3MoxJ9jWv8O_matrix_multiply._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_matrix_multiply._1.while.cond.0                     # ir inst 51 fin
.F._3MoxJ9jWv8O_matrix_multiply._9.while.exit.0:
  j .F._3MoxJ9jWv8O_matrix_multiply.epilogue                            # ir inst 52 fin
.F._3MoxJ9jWv8O_matrix_multiply.epilogue:
  ld s11, 0(sp)
  ld s7, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_calculate_determinant
.F._3MoxJ9jWv8O_calculate_determinant:
# spill func args num: 0,             range:    40496(sp) -    40496(sp)
# local var size: 40400,              range:       96(sp) -    40496(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 7 / 12,        range:       32(sp) -       88(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -40496
  add sp, sp, t0
  sd s9, 32(sp)
  sd s7, 40(sp)
  sd s5, 48(sp)
  sd s6, 56(sp)
  sd s8, 64(sp)
  sd s10, 72(sp)
  sd s11, 80(sp)
  sd ra, 88(sp)
.F._3MoxJ9jWv8O_calculate_determinant._0.entry.0:
  li t1, 40096
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_calculate_determinant._1.array.cond.0               # ir inst 4 fin
.F._3MoxJ9jWv8O_calculate_determinant._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F._3MoxJ9jWv8O_calculate_determinant._2.array.body.0
  j .F._3MoxJ9jWv8O_calculate_determinant._3.array.exit.0               # ir inst 7 fin
.F._3MoxJ9jWv8O_calculate_determinant._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_calculate_determinant._1.array.cond.0               # ir inst 11 fin
.F._3MoxJ9jWv8O_calculate_determinant._3.array.exit.0:
  addi t1, sp, 96
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_calculate_determinant._4.array.cond.1               # ir inst 13 fin
.F._3MoxJ9jWv8O_calculate_determinant._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F._3MoxJ9jWv8O_calculate_determinant._5.array.body.1
  j .F._3MoxJ9jWv8O_calculate_determinant._6.array.exit.1               # ir inst 16 fin
.F._3MoxJ9jWv8O_calculate_determinant._5.array.body.1:
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  li t1, 40096
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_calculate_determinant._4.array.cond.1               # ir inst 20 fin
.F._3MoxJ9jWv8O_calculate_determinant._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_calculate_determinant._7.while.cond.0               # ir inst 21 fin
.F._3MoxJ9jWv8O_calculate_determinant._7.while.cond.0:
  li t5, 120000
  add t5, a0, t5                                                        # ir inst 23 fin
  lw t4, 0(t5)                                                          # ir inst 24 fin
  slt t5, t6, t4                                                        # ir inst 25 fin
  bnez t5, .F._3MoxJ9jWv8O_calculate_determinant._8.while.body.0
  j .F._3MoxJ9jWv8O_calculate_determinant._12.while.exit.0              # ir inst 26 fin
.F._3MoxJ9jWv8O_calculate_determinant._8.while.body.0:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_calculate_determinant._9.while.cond.1               # ir inst 27 fin
.F._3MoxJ9jWv8O_calculate_determinant._9.while.cond.1:
  li t4, 120000
  add t4, a0, t4                                                        # ir inst 29 fin
  lw t3, 0(t4)                                                          # ir inst 30 fin
  slt t4, t5, t3                                                        # ir inst 31 fin
  bnez t4, .F._3MoxJ9jWv8O_calculate_determinant._10.while.body.1
  j .F._3MoxJ9jWv8O_calculate_determinant._11.while.exit.1              # ir inst 32 fin
.F._3MoxJ9jWv8O_calculate_determinant._10.while.body.1:
  mv t4, t6                                                             # ir inst 33 fin
  li t1, 400
  mul t2, t4, t1
  addi t1, sp, 96
  add t3, t1, t2                                                        # ir inst 34 fin
  mv t4, t5                                                             # ir inst 35 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 36 fin
  addi t4, a0, 0                                                        # ir inst 37 fin
  mv t3, t6                                                             # ir inst 38 fin
  li t1, 400
  mul t2, t3, t1
  add s10, t4, t2                                                       # ir inst 39 fin
  mv t4, t5                                                             # ir inst 40 fin
  slli t2, t4, 2
  add t3, s10, t2                                                       # ir inst 41 fin
  lw t4, 0(t3)                                                          # ir inst 42 fin
  sw t4, 0(s11)                                                         # ir inst 43 fin
  addi t4, t5, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_calculate_determinant._9.while.cond.1               # ir inst 45 fin
.F._3MoxJ9jWv8O_calculate_determinant._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_calculate_determinant._7.while.cond.0               # ir inst 47 fin
.F._3MoxJ9jWv8O_calculate_determinant._12.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F._3MoxJ9jWv8O_calculate_determinant._13.while.cond.2              # ir inst 48 fin
.F._3MoxJ9jWv8O_calculate_determinant._13.while.cond.2:
  li t4, 120000
  add t4, a0, t4                                                        # ir inst 51 fin
  lw t3, 0(t4)                                                          # ir inst 52 fin
  addi t4, t3, -1                                                       # ir inst 53 fin
  slt t3, t5, t4                                                        # ir inst 54 fin
  bnez t3, .F._3MoxJ9jWv8O_calculate_determinant._14.while.body.2
  j .F._3MoxJ9jWv8O_calculate_determinant._42.while.exit.2              # ir inst 55 fin
.F._3MoxJ9jWv8O_calculate_determinant._14.while.body.2:
  mv t4, t5                                                             # ir inst 56 fin
  li t1, 400
  mul t2, t4, t1
  addi t1, sp, 96
  add t3, t1, t2                                                        # ir inst 57 fin
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 59 fin
  lw t4, 0(s11)                                                         # ir inst 60 fin
  li t2, 0
  slt t3, t4, t2                                                        # ir inst 61 fin
  bnez t3, .F._3MoxJ9jWv8O_calculate_determinant._15.if.then.0
  j .F._3MoxJ9jWv8O_calculate_determinant._16.if.else.0                 # ir inst 62 fin
.F._3MoxJ9jWv8O_calculate_determinant._15.if.then.0:
  mv t4, t5                                                             # ir inst 63 fin
  li t1, 400
  mul t2, t4, t1
  addi t1, sp, 96
  add t3, t1, t2                                                        # ir inst 64 fin
  mv t4, t5                                                             # ir inst 65 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 66 fin
  lw t4, 0(s11)                                                         # ir inst 67 fin
  li t1, 0
  sub t3, t1, t4                                                        # ir inst 68 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_calculate_determinant._17.if.exit.0                 # ir inst 69 fin
.F._3MoxJ9jWv8O_calculate_determinant._16.if.else.0:
  mv t4, t5                                                             # ir inst 70 fin
  li t1, 400
  mul t2, t4, t1
  addi t1, sp, 96
  add t3, t1, t2                                                        # ir inst 71 fin
  mv t4, t5                                                             # ir inst 72 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 73 fin
  lw t4, 0(s11)                                                         # ir inst 74 fin
# Phi connections
  j .F._3MoxJ9jWv8O_calculate_determinant._17.if.exit.0                 # ir inst 75 fin
.F._3MoxJ9jWv8O_calculate_determinant._17.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 77 fin
# Phi connections
  mv s11, t5
  mv t0, t3
  mv t3, t4
  mv t4, t0
  j .F._3MoxJ9jWv8O_calculate_determinant._18.while.cond.3              # ir inst 78 fin
.F._3MoxJ9jWv8O_calculate_determinant._18.while.cond.3:
  li s10, 120000
  add s10, a0, s10                                                      # ir inst 82 fin
  lw s9, 0(s10)                                                         # ir inst 83 fin
  slt s10, t4, s9                                                       # ir inst 84 fin
  bnez s10, .F._3MoxJ9jWv8O_calculate_determinant._19.while.body.3
  j .F._3MoxJ9jWv8O_calculate_determinant._26.while.exit.3              # ir inst 85 fin
.F._3MoxJ9jWv8O_calculate_determinant._19.while.body.3:
  mv s10, t4                                                            # ir inst 86 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 87 fin
  mv s10, t5                                                            # ir inst 88 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 89 fin
  lw s10, 0(s8)                                                         # ir inst 90 fin
  li t2, 0
  slt s9, s10, t2                                                       # ir inst 91 fin
  bnez s9, .F._3MoxJ9jWv8O_calculate_determinant._20.if.then.1
  j .F._3MoxJ9jWv8O_calculate_determinant._21.if.else.1                 # ir inst 92 fin
.F._3MoxJ9jWv8O_calculate_determinant._20.if.then.1:
  mv s10, t4                                                            # ir inst 93 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 94 fin
  mv s10, t5                                                            # ir inst 95 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 96 fin
  lw s10, 0(s8)                                                         # ir inst 97 fin
  li t1, 0
  sub s9, t1, s10                                                       # ir inst 98 fin
# Phi connections
  mv s10, s9
  j .F._3MoxJ9jWv8O_calculate_determinant._22.if.exit.1                 # ir inst 99 fin
.F._3MoxJ9jWv8O_calculate_determinant._21.if.else.1:
  mv s10, t4                                                            # ir inst 100 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 101 fin
  mv s10, t5                                                            # ir inst 102 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 103 fin
  lw s10, 0(s8)                                                         # ir inst 104 fin
# Phi connections
  j .F._3MoxJ9jWv8O_calculate_determinant._22.if.exit.1                 # ir inst 105 fin
.F._3MoxJ9jWv8O_calculate_determinant._22.if.exit.1:
  slt s9, t3, s10                                                       # ir inst 107 fin
  bnez s9, .F._3MoxJ9jWv8O_calculate_determinant._23.if.then.2
  j .F._3MoxJ9jWv8O_calculate_determinant._24.if.else.2                 # ir inst 108 fin
.F._3MoxJ9jWv8O_calculate_determinant._23.if.then.2:
# Phi connections
  mv t3, s10
  mv s10, t4
  j .F._3MoxJ9jWv8O_calculate_determinant._25.if.exit.2                 # ir inst 109 fin
.F._3MoxJ9jWv8O_calculate_determinant._24.if.else.2:
# Phi connections
  mv s10, s11
  j .F._3MoxJ9jWv8O_calculate_determinant._25.if.exit.2                 # ir inst 110 fin
.F._3MoxJ9jWv8O_calculate_determinant._25.if.exit.2:
  addi s9, t4, 1                                                        # ir inst 113 fin
# Phi connections
  mv s11, s10
  mv t4, s9
  j .F._3MoxJ9jWv8O_calculate_determinant._18.while.cond.3              # ir inst 114 fin
.F._3MoxJ9jWv8O_calculate_determinant._26.while.exit.3:
  xor t0, s11, t5
  sltu t4, zero, t0                                                     # ir inst 115 fin
  bnez t4, .F._3MoxJ9jWv8O_calculate_determinant._27.if.then.3
  j .F._3MoxJ9jWv8O_calculate_determinant._31.if.else.3                 # ir inst 116 fin
.F._3MoxJ9jWv8O_calculate_determinant._27.if.then.3:
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_calculate_determinant._28.while.cond.4              # ir inst 117 fin
.F._3MoxJ9jWv8O_calculate_determinant._28.while.cond.4:
  li t3, 120000
  add t3, a0, t3                                                        # ir inst 119 fin
  lw s10, 0(t3)                                                         # ir inst 120 fin
  slt t3, t4, s10                                                       # ir inst 121 fin
  bnez t3, .F._3MoxJ9jWv8O_calculate_determinant._29.while.body.4
  j .F._3MoxJ9jWv8O_calculate_determinant._30.while.exit.4              # ir inst 122 fin
.F._3MoxJ9jWv8O_calculate_determinant._29.while.body.4:
  mv t3, t5                                                             # ir inst 123 fin
  li t1, 400
  mul t2, t3, t1
  addi t1, sp, 96
  add s10, t1, t2                                                       # ir inst 124 fin
  mv t3, t4                                                             # ir inst 125 fin
  slli t2, t3, 2
  add s9, s10, t2                                                       # ir inst 126 fin
  lw t3, 0(s9)                                                          # ir inst 127 fin
  mv s10, t5                                                            # ir inst 128 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 129 fin
  mv s10, t4                                                            # ir inst 130 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 131 fin
  mv s10, s11                                                           # ir inst 132 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 133 fin
  mv s10, t4                                                            # ir inst 134 fin
  slli t2, s10, 2
  add s7, s9, t2                                                        # ir inst 135 fin
  lw s10, 0(s7)                                                         # ir inst 136 fin
  sw s10, 0(s8)                                                         # ir inst 137 fin
  mv s10, s11                                                           # ir inst 138 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 139 fin
  mv s10, t4                                                            # ir inst 140 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 141 fin
  sw t3, 0(s8)                                                          # ir inst 142 fin
  addi t3, t4, 1                                                        # ir inst 143 fin
# Phi connections
  mv t4, t3
  j .F._3MoxJ9jWv8O_calculate_determinant._28.while.cond.4              # ir inst 144 fin
.F._3MoxJ9jWv8O_calculate_determinant._30.while.exit.4:
  li t1, 0
  sub t4, t1, t6                                                        # ir inst 145 fin
# Phi connections
  j .F._3MoxJ9jWv8O_calculate_determinant._32.if.exit.3                 # ir inst 146 fin
.F._3MoxJ9jWv8O_calculate_determinant._31.if.else.3:
# Phi connections
  mv t4, t6
  j .F._3MoxJ9jWv8O_calculate_determinant._32.if.exit.3                 # ir inst 147 fin
.F._3MoxJ9jWv8O_calculate_determinant._32.if.exit.3:
  mv t3, t5                                                             # ir inst 149 fin
  li t1, 400
  mul t2, t3, t1
  addi t1, sp, 96
  add s11, t1, t2                                                       # ir inst 150 fin
  mv t3, t5                                                             # ir inst 151 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 152 fin
  lw t3, 0(s10)                                                         # ir inst 153 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 154 fin
  bnez s11, .F._3MoxJ9jWv8O_calculate_determinant._33.if.then.4
  j .F._3MoxJ9jWv8O_calculate_determinant._34.if.else.4                 # ir inst 155 fin
.F._3MoxJ9jWv8O_calculate_determinant._33.if.then.4:
  li a0, 0
  j .F._3MoxJ9jWv8O_calculate_determinant.epilogue                      # ir inst 156 fin
.F._3MoxJ9jWv8O_calculate_determinant._34.if.else.4:
  j .F._3MoxJ9jWv8O_calculate_determinant._35.if.exit.4                 # ir inst 157 fin
.F._3MoxJ9jWv8O_calculate_determinant._35.if.exit.4:
  addi t3, t5, 1                                                        # ir inst 158 fin
# Phi connections
  j .F._3MoxJ9jWv8O_calculate_determinant._36.while.cond.5              # ir inst 159 fin
.F._3MoxJ9jWv8O_calculate_determinant._36.while.cond.5:
  li s11, 120000
  add s11, a0, s11                                                      # ir inst 161 fin
  lw s10, 0(s11)                                                        # ir inst 162 fin
  slt s11, t3, s10                                                      # ir inst 163 fin
  bnez s11, .F._3MoxJ9jWv8O_calculate_determinant._37.while.body.5
  j .F._3MoxJ9jWv8O_calculate_determinant._41.while.exit.5              # ir inst 164 fin
.F._3MoxJ9jWv8O_calculate_determinant._37.while.body.5:
  mv s11, t3                                                            # ir inst 165 fin
  li t1, 400
  mul t2, s11, t1
  addi t1, sp, 96
  add s10, t1, t2                                                       # ir inst 166 fin
  mv s11, t5                                                            # ir inst 167 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 168 fin
  lw s11, 0(s9)                                                         # ir inst 169 fin
  mv s10, t5                                                            # ir inst 170 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 171 fin
  mv s10, t5                                                            # ir inst 172 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 173 fin
  lw s10, 0(s8)                                                         # ir inst 174 fin
  div s9, s11, s10                                                      # ir inst 175 fin
# Phi connections
  mv s11, t5
  j .F._3MoxJ9jWv8O_calculate_determinant._38.while.cond.6              # ir inst 176 fin
.F._3MoxJ9jWv8O_calculate_determinant._38.while.cond.6:
  li s10, 120000
  add s10, a0, s10                                                      # ir inst 178 fin
  lw s8, 0(s10)                                                         # ir inst 179 fin
  slt s10, s11, s8                                                      # ir inst 180 fin
  bnez s10, .F._3MoxJ9jWv8O_calculate_determinant._39.while.body.6
  j .F._3MoxJ9jWv8O_calculate_determinant._40.while.exit.6              # ir inst 181 fin
.F._3MoxJ9jWv8O_calculate_determinant._39.while.body.6:
  mv s10, t3                                                            # ir inst 182 fin
  li t1, 400
  mul t2, s10, t1
  addi t1, sp, 96
  add s8, t1, t2                                                        # ir inst 183 fin
  mv s10, s11                                                           # ir inst 184 fin
  slli t2, s10, 2
  add s7, s8, t2                                                        # ir inst 185 fin
  lw s10, 0(s7)                                                         # ir inst 186 fin
  mv s8, t5                                                             # ir inst 187 fin
  li t1, 400
  mul t2, s8, t1
  addi t1, sp, 96
  add s6, t1, t2                                                        # ir inst 188 fin
  mv s8, s11                                                            # ir inst 189 fin
  slli t2, s8, 2
  add s5, s6, t2                                                        # ir inst 190 fin
  lw s8, 0(s5)                                                          # ir inst 191 fin
  mul s6, s9, s8                                                        # ir inst 192 fin
  sub s8, s10, s6                                                       # ir inst 193 fin
  sw s8, 0(s7)                                                          # ir inst 194 fin
  addi s10, s11, 1                                                      # ir inst 195 fin
# Phi connections
  mv s11, s10
  j .F._3MoxJ9jWv8O_calculate_determinant._38.while.cond.6              # ir inst 196 fin
.F._3MoxJ9jWv8O_calculate_determinant._40.while.exit.6:
  addi s11, t3, 1                                                       # ir inst 197 fin
# Phi connections
  mv t3, s11
  j .F._3MoxJ9jWv8O_calculate_determinant._36.while.cond.5              # ir inst 198 fin
.F._3MoxJ9jWv8O_calculate_determinant._41.while.exit.5:
  addi t3, t5, 1                                                        # ir inst 199 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F._3MoxJ9jWv8O_calculate_determinant._13.while.cond.2              # ir inst 200 fin
.F._3MoxJ9jWv8O_calculate_determinant._42.while.exit.2:
# Phi connections
  li t4, 1
  li t5, 0
  j .F._3MoxJ9jWv8O_calculate_determinant._43.while.cond.7              # ir inst 201 fin
.F._3MoxJ9jWv8O_calculate_determinant._43.while.cond.7:
  li t3, 120000
  add t3, a0, t3                                                        # ir inst 204 fin
  lw s11, 0(t3)                                                         # ir inst 205 fin
  slt t3, t5, s11                                                       # ir inst 206 fin
  bnez t3, .F._3MoxJ9jWv8O_calculate_determinant._44.while.body.7
  j .F._3MoxJ9jWv8O_calculate_determinant._45.while.exit.7              # ir inst 207 fin
.F._3MoxJ9jWv8O_calculate_determinant._44.while.body.7:
  mv t3, t5                                                             # ir inst 208 fin
  li t1, 400
  mul t2, t3, t1
  addi t1, sp, 96
  add s11, t1, t2                                                       # ir inst 209 fin
  mv t3, t5                                                             # ir inst 210 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 211 fin
  lw t3, 0(s10)                                                         # ir inst 212 fin
  mul s11, t4, t3                                                       # ir inst 213 fin
  addi t3, t5, 1                                                        # ir inst 214 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F._3MoxJ9jWv8O_calculate_determinant._43.while.cond.7              # ir inst 215 fin
.F._3MoxJ9jWv8O_calculate_determinant._45.while.exit.7:
  mul t5, t4, t6                                                        # ir inst 216 fin
  mv a0, t5
  j .F._3MoxJ9jWv8O_calculate_determinant.epilogue                      # ir inst 217 fin
.F._3MoxJ9jWv8O_calculate_determinant.epilogue:
  ld ra, 88(sp)
  ld s9, 32(sp)
  ld s7, 40(sp)
  ld s5, 48(sp)
  ld s6, 56(sp)
  ld s8, 64(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  li t0, 40496
  add sp, sp, t0
  ret

.globl .F._3MoxJ9jWv8O_matrix_operations_suite
.F._3MoxJ9jWv8O_matrix_operations_suite:
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
.F._3MoxJ9jWv8O_matrix_operations_suite._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_matrix_operations_suite._1.while.cond.0             # ir inst 1 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._1.while.cond.0:
  li t4, 120000
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  slt t4, t6, t3                                                        # ir inst 6 fin
  bnez t4, .F._3MoxJ9jWv8O_matrix_operations_suite._2.while.body.0
  j .F._3MoxJ9jWv8O_matrix_operations_suite._3.while.exit.0             # ir inst 7 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._2.while.body.0:
  addi t4, a0, 0                                                        # ir inst 8 fin
  mv t3, t6                                                             # ir inst 9 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
  add t3, t5, t4                                                        # ir inst 14 fin
  addi t4, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F._3MoxJ9jWv8O_matrix_operations_suite._1.while.cond.0             # ir inst 16 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._3.while.exit.0:
  li t6, 149604
  add t6, a0, t6                                                        # ir inst 17 fin
  li t4, 149804
  add t4, a0, t4                                                        # ir inst 18 fin
  lw t3, 0(t4)                                                          # ir inst 19 fin
  mv t4, t3                                                             # ir inst 20 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 21 fin
  sw t5, 0(t3)                                                          # ir inst 22 fin
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  addi t4, t5, 1                                                        # ir inst 25 fin
  sw t4, 0(t6)                                                          # ir inst 26 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_matrix_operations_suite._4.while.cond.1             # ir inst 27 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._4.while.cond.1:
  li t4, 120000
  add t4, a0, t4                                                        # ir inst 30 fin
  lw t3, 0(t4)                                                          # ir inst 31 fin
  slt t4, t5, t3                                                        # ir inst 32 fin
  bnez t4, .F._3MoxJ9jWv8O_matrix_operations_suite._5.while.body.1
  j .F._3MoxJ9jWv8O_matrix_operations_suite._9.while.exit.1             # ir inst 33 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._5.while.body.1:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F._3MoxJ9jWv8O_matrix_operations_suite._6.while.cond.2             # ir inst 34 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._6.while.cond.2:
  li s11, 120000
  add s11, a0, s11                                                      # ir inst 37 fin
  lw s10, 0(s11)                                                        # ir inst 38 fin
  slt s11, t4, s10                                                      # ir inst 39 fin
  bnez s11, .F._3MoxJ9jWv8O_matrix_operations_suite._7.while.body.2
  j .F._3MoxJ9jWv8O_matrix_operations_suite._8.while.exit.2             # ir inst 40 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._7.while.body.2:
  addi s11, a0, 0                                                       # ir inst 41 fin
  mv s10, t5                                                            # ir inst 42 fin
  li t1, 400
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 43 fin
  mv s11, t4                                                            # ir inst 44 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 45 fin
  lw s11, 0(s10)                                                        # ir inst 46 fin
  mul s10, s11, s11                                                     # ir inst 47 fin
  add s11, t3, s10                                                      # ir inst 48 fin
  addi s10, t4, 1                                                       # ir inst 49 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F._3MoxJ9jWv8O_matrix_operations_suite._6.while.cond.2             # ir inst 50 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._8.while.exit.2:
  addi t4, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._3MoxJ9jWv8O_matrix_operations_suite._4.while.cond.1             # ir inst 52 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._9.while.exit.1:
  li t5, 149604
  add t5, a0, t5                                                        # ir inst 53 fin
  li t4, 149804
  add t4, a0, t4                                                        # ir inst 54 fin
  lw t3, 0(t4)                                                          # ir inst 55 fin
  mv t4, t3                                                             # ir inst 56 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 57 fin
  sw t6, 0(t3)                                                          # ir inst 58 fin
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 59 fin
  lw t5, 0(t6)                                                          # ir inst 60 fin
  addi t4, t5, 1                                                        # ir inst 61 fin
  sw t4, 0(t6)                                                          # ir inst 62 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_matrix_operations_suite._10.while.cond.3            # ir inst 63 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._10.while.cond.3:
  li t5, 120000
  add t5, a0, t5                                                        # ir inst 65 fin
  lw t4, 0(t5)                                                          # ir inst 66 fin
  slt t5, t6, t4                                                        # ir inst 67 fin
  bnez t5, .F._3MoxJ9jWv8O_matrix_operations_suite._11.while.body.3
  j .F._3MoxJ9jWv8O_matrix_operations_suite._15.while.exit.3            # ir inst 68 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._11.while.body.3:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_matrix_operations_suite._12.while.cond.4            # ir inst 69 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._12.while.cond.4:
  li t4, 120000
  add t4, a0, t4                                                        # ir inst 71 fin
  lw t3, 0(t4)                                                          # ir inst 72 fin
  slt t4, t5, t3                                                        # ir inst 73 fin
  bnez t4, .F._3MoxJ9jWv8O_matrix_operations_suite._13.while.body.4
  j .F._3MoxJ9jWv8O_matrix_operations_suite._14.while.exit.4            # ir inst 74 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._13.while.body.4:
  li t4, 80000
  add t4, a0, t4                                                        # ir inst 75 fin
  mv t3, t6                                                             # ir inst 76 fin
  li t1, 400
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 77 fin
  mv t4, t5                                                             # ir inst 78 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 79 fin
  addi t4, a0, 0                                                        # ir inst 80 fin
  mv s11, t6                                                            # ir inst 81 fin
  li t1, 400
  mul t2, s11, t1
  add s10, t4, t2                                                       # ir inst 82 fin
  mv t4, t5                                                             # ir inst 83 fin
  slli t2, t4, 2
  add s11, s10, t2                                                      # ir inst 84 fin
  lw t4, 0(s11)                                                         # ir inst 85 fin
  li s11, 40000
  add s11, a0, s11                                                      # ir inst 86 fin
  mv s10, t6                                                            # ir inst 87 fin
  li t1, 400
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 88 fin
  mv s11, t5                                                            # ir inst 89 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 90 fin
  lw s11, 0(s10)                                                        # ir inst 91 fin
  add s10, t4, s11                                                      # ir inst 92 fin
  sw s10, 0(t3)                                                         # ir inst 93 fin
  addi t4, t5, 1                                                        # ir inst 94 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_matrix_operations_suite._12.while.cond.4            # ir inst 95 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._14.while.exit.4:
  addi t5, t6, 1                                                        # ir inst 96 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_matrix_operations_suite._10.while.cond.3            # ir inst 97 fin
.F._3MoxJ9jWv8O_matrix_operations_suite._15.while.exit.3:
  j .F._3MoxJ9jWv8O_matrix_operations_suite.epilogue                    # ir inst 98 fin
.F._3MoxJ9jWv8O_matrix_operations_suite.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._3MoxJ9jWv8O_initialize_polynomial
.F._3MoxJ9jWv8O_initialize_polynomial:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._3MoxJ9jWv8O_initialize_polynomial._0.entry.0:
  li t6, 120804
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_initialize_polynomial._1.while.cond.0               # ir inst 3 fin
.F._3MoxJ9jWv8O_initialize_polynomial._1.while.cond.0:
  slt t0, a1, t6
  xori t5, t0, 1                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_initialize_polynomial._2.while.body.0
  j .F._3MoxJ9jWv8O_initialize_polynomial._3.while.exit.0               # ir inst 6 fin
.F._3MoxJ9jWv8O_initialize_polynomial._2.while.body.0:
  li t5, 120004
  add t5, a0, t5                                                        # ir inst 7 fin
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
  j .F._3MoxJ9jWv8O_initialize_polynomial._1.while.cond.0               # ir inst 13 fin
.F._3MoxJ9jWv8O_initialize_polynomial._3.while.exit.0:
  j .F._3MoxJ9jWv8O_initialize_polynomial.epilogue                      # ir inst 14 fin
.F._3MoxJ9jWv8O_initialize_polynomial.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_evaluate_polynomial
.F._3MoxJ9jWv8O_evaluate_polynomial:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._3MoxJ9jWv8O_evaluate_polynomial._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 0
  j .F._3MoxJ9jWv8O_evaluate_polynomial._1.while.cond.0                 # ir inst 1 fin
.F._3MoxJ9jWv8O_evaluate_polynomial._1.while.cond.0:
  li t3, 120804
  add t3, a0, t3                                                        # ir inst 5 fin
  lw s11, 0(t3)                                                         # ir inst 6 fin
  slt t0, s11, t6
  xori t3, t0, 1                                                        # ir inst 7 fin
  bnez t3, .F._3MoxJ9jWv8O_evaluate_polynomial._2.while.body.0
  j .F._3MoxJ9jWv8O_evaluate_polynomial._3.while.exit.0                 # ir inst 8 fin
.F._3MoxJ9jWv8O_evaluate_polynomial._2.while.body.0:
  li t3, 120004
  add t3, a0, t3                                                        # ir inst 9 fin
  mv s11, t6                                                            # ir inst 10 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 11 fin
  lw t3, 0(s10)                                                         # ir inst 12 fin
  mul s11, t3, t5                                                       # ir inst 13 fin
  add t3, t4, s11                                                       # ir inst 14 fin
  mul s11, t5, a1                                                       # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t4, t3
  mv t6, t5
  mv t5, s11
  j .F._3MoxJ9jWv8O_evaluate_polynomial._1.while.cond.0                 # ir inst 17 fin
.F._3MoxJ9jWv8O_evaluate_polynomial._3.while.exit.0:
  mv a0, t4
  j .F._3MoxJ9jWv8O_evaluate_polynomial.epilogue                        # ir inst 18 fin
.F._3MoxJ9jWv8O_evaluate_polynomial.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._3MoxJ9jWv8O_find_polynomial_roots
.F._3MoxJ9jWv8O_find_polynomial_roots:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd ra, 64(sp)
.F._3MoxJ9jWv8O_find_polynomial_roots._0.entry.0:
  li t6, 121008
  add t6, a0, t6                                                        # ir inst 1 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, -10
  j .F._3MoxJ9jWv8O_find_polynomial_roots._1.while.cond.0               # ir inst 3 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._1.while.cond.0:
  li t2, 10
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_find_polynomial_roots._2.lazy.then.0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._3.lazy.else.0                # ir inst 6 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._2.lazy.then.0:
  li t5, 121008
  add t5, a0, t5                                                        # ir inst 7 fin
  lw t4, 0(t5)                                                          # ir inst 8 fin
  li t2, 50
  slt t5, t4, t2                                                        # ir inst 9 fin
# Phi connections
  j .F._3MoxJ9jWv8O_find_polynomial_roots._4.lazy.exit.0                # ir inst 10 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._3.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._4.lazy.exit.0                # ir inst 11 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._4.lazy.exit.0:
  bnez t5, .F._3MoxJ9jWv8O_find_polynomial_roots._5.while.body.0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._39.while.exit.0              # ir inst 13 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._5.while.body.0:
# Phi connections
  mv t4, t6
  li t5, 0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._6.while.cond.1               # ir inst 14 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._6.while.cond.1:
  li t2, 50
  slt t3, t5, t2                                                        # ir inst 17 fin
  bnez t3, .F._3MoxJ9jWv8O_find_polynomial_roots._7.while.body.1
  j .F._3MoxJ9jWv8O_find_polynomial_roots._40.critical_edge.0           # ir inst 18 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._7.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F._3MoxJ9jWv8O_evaluate_polynomial
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  call .F._3MoxJ9jWv8O_evaluate_polynomial_derivative
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 20 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 21 fin
  bnez s10, .F._3MoxJ9jWv8O_find_polynomial_roots._8.if.then.0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._9.if.else.0                  # ir inst 22 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._8.if.then.0:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._38.while.exit.1              # ir inst 23 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._9.if.else.0:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._10.if.exit.0                 # ir inst 24 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._10.if.exit.0:
  div s10, t3, s11                                                      # ir inst 25 fin
  sub t3, t4, s10                                                       # ir inst 26 fin
  slt s11, t4, t3                                                       # ir inst 27 fin
  bnez s11, .F._3MoxJ9jWv8O_find_polynomial_roots._11.if.then.1
  j .F._3MoxJ9jWv8O_find_polynomial_roots._12.if.else.1                 # ir inst 28 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._11.if.then.1:
  sub s11, t3, t4                                                       # ir inst 29 fin
# Phi connections
  mv t4, s11
  j .F._3MoxJ9jWv8O_find_polynomial_roots._13.if.exit.1                 # ir inst 30 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._12.if.else.1:
  sub s11, t4, t3                                                       # ir inst 31 fin
# Phi connections
  mv t4, s11
  j .F._3MoxJ9jWv8O_find_polynomial_roots._13.if.exit.1                 # ir inst 32 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._13.if.exit.1:
  li t2, 1
  slt t0, t2, t4
  xori s11, t0, 1                                                       # ir inst 34 fin
  bnez s11, .F._3MoxJ9jWv8O_find_polynomial_roots._14.if.then.2
  j .F._3MoxJ9jWv8O_find_polynomial_roots._36.if.else.2                 # ir inst 35 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._14.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  call .F._3MoxJ9jWv8O_evaluate_polynomial
  mv t4, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 36 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 37 fin
  bnez s11, .F._3MoxJ9jWv8O_find_polynomial_roots._15.lazy.then.1
  j .F._3MoxJ9jWv8O_find_polynomial_roots._16.lazy.else.1               # ir inst 38 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._15.lazy.then.1:
# Phi connections
  li t4, 1
  j .F._3MoxJ9jWv8O_find_polynomial_roots._20.lazy.exit.1               # ir inst 39 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._16.lazy.else.1:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  call .F._3MoxJ9jWv8O_evaluate_polynomial
  mv t4, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 40 fin
  li t2, 0
  slt s11, t4, t2                                                       # ir inst 41 fin
  bnez s11, .F._3MoxJ9jWv8O_find_polynomial_roots._17.if.then.4
  j .F._3MoxJ9jWv8O_find_polynomial_roots._18.if.else.4                 # ir inst 42 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._17.if.then.4:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  call .F._3MoxJ9jWv8O_evaluate_polynomial
  mv t4, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 43 fin
  li t1, 0
  sub s11, t1, t4                                                       # ir inst 44 fin
# Phi connections
  mv t4, s11
  j .F._3MoxJ9jWv8O_find_polynomial_roots._19.if.exit.4                 # ir inst 45 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._18.if.else.4:
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  call .F._3MoxJ9jWv8O_evaluate_polynomial
  mv t4, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 46 fin
# Phi connections
  j .F._3MoxJ9jWv8O_find_polynomial_roots._19.if.exit.4                 # ir inst 47 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._19.if.exit.4:
  li t2, 5
  slt t0, t2, t4
  xori s11, t0, 1                                                       # ir inst 49 fin
# Phi connections
  mv t4, s11
  j .F._3MoxJ9jWv8O_find_polynomial_roots._20.lazy.exit.1               # ir inst 50 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._20.lazy.exit.1:
  bnez t4, .F._3MoxJ9jWv8O_find_polynomial_roots._21.if.then.3
  j .F._3MoxJ9jWv8O_find_polynomial_roots._34.if.else.3                 # ir inst 52 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._21.if.then.3:
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._22.while.cond.2              # ir inst 53 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._22.while.cond.2:
  li s11, 121008
  add s11, a0, s11                                                      # ir inst 55 fin
  lw s10, 0(s11)                                                        # ir inst 56 fin
  slt s11, t4, s10                                                      # ir inst 57 fin
  bnez s11, .F._3MoxJ9jWv8O_find_polynomial_roots._23.while.body.2
  j .F._3MoxJ9jWv8O_find_polynomial_roots._41.critical_edge.1           # ir inst 58 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._23.while.body.2:
  li s11, 120808
  add s11, a0, s11                                                      # ir inst 59 fin
  mv s10, t4                                                            # ir inst 60 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 61 fin
  lw s11, 0(s9)                                                         # ir inst 62 fin
  slt s10, t3, s11                                                      # ir inst 63 fin
  bnez s10, .F._3MoxJ9jWv8O_find_polynomial_roots._24.if.then.5
  j .F._3MoxJ9jWv8O_find_polynomial_roots._25.if.else.5                 # ir inst 64 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._24.if.then.5:
  li s11, 120808
  add s11, a0, s11                                                      # ir inst 65 fin
  mv s10, t4                                                            # ir inst 66 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 67 fin
  lw s11, 0(s9)                                                         # ir inst 68 fin
  sub s10, s11, t3                                                      # ir inst 69 fin
# Phi connections
  mv s11, s10
  j .F._3MoxJ9jWv8O_find_polynomial_roots._26.if.exit.5                 # ir inst 70 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._25.if.else.5:
  li s11, 120808
  add s11, a0, s11                                                      # ir inst 71 fin
  mv s10, t4                                                            # ir inst 72 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 73 fin
  lw s11, 0(s9)                                                         # ir inst 74 fin
  sub s10, t3, s11                                                      # ir inst 75 fin
# Phi connections
  mv s11, s10
  j .F._3MoxJ9jWv8O_find_polynomial_roots._26.if.exit.5                 # ir inst 76 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._26.if.exit.5:
  li t2, 2
  slt t0, t2, s11
  xori s10, t0, 1                                                       # ir inst 78 fin
  bnez s10, .F._3MoxJ9jWv8O_find_polynomial_roots._27.if.then.6
  j .F._3MoxJ9jWv8O_find_polynomial_roots._28.if.else.6                 # ir inst 79 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._27.if.then.6:
# Phi connections
  li t4, 0
  j .F._3MoxJ9jWv8O_find_polynomial_roots._30.while.exit.2              # ir inst 80 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._28.if.else.6:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._29.if.exit.6                 # ir inst 81 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._29.if.exit.6:
  addi s11, t4, 1                                                       # ir inst 82 fin
# Phi connections
  mv t4, s11
  j .F._3MoxJ9jWv8O_find_polynomial_roots._22.while.cond.2              # ir inst 83 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._30.while.exit.2:
  bnez t4, .F._3MoxJ9jWv8O_find_polynomial_roots._31.if.then.7
  j .F._3MoxJ9jWv8O_find_polynomial_roots._32.if.else.7                 # ir inst 85 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._31.if.then.7:
  li t4, 120808
  add t4, a0, t4                                                        # ir inst 86 fin
  li s11, 121008
  add s11, a0, s11                                                      # ir inst 87 fin
  lw s10, 0(s11)                                                        # ir inst 88 fin
  mv s11, s10                                                           # ir inst 89 fin
  slli t2, s11, 2
  add s10, t4, t2                                                       # ir inst 90 fin
  sw t3, 0(s10)                                                         # ir inst 91 fin
  li t4, 121008
  add t4, a0, t4                                                        # ir inst 92 fin
  lw s11, 0(t4)                                                         # ir inst 93 fin
  addi s10, s11, 1                                                      # ir inst 94 fin
  sw s10, 0(t4)                                                         # ir inst 95 fin
  j .F._3MoxJ9jWv8O_find_polynomial_roots._33.if.exit.7                 # ir inst 96 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._32.if.else.7:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._33.if.exit.7                 # ir inst 97 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._33.if.exit.7:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._35.if.exit.3                 # ir inst 98 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._34.if.else.3:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._35.if.exit.3                 # ir inst 99 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._35.if.exit.3:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._38.while.exit.1              # ir inst 100 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._36.if.else.2:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._37.if.exit.2                 # ir inst 101 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._37.if.exit.2:
  addi t4, t5, 1                                                        # ir inst 102 fin
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F._3MoxJ9jWv8O_find_polynomial_roots._6.while.cond.1               # ir inst 103 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._38.while.exit.1:
  addi t5, t6, 7                                                        # ir inst 104 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_find_polynomial_roots._1.while.cond.0               # ir inst 105 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._39.while.exit.0:
  j .F._3MoxJ9jWv8O_find_polynomial_roots.epilogue                      # ir inst 106 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._40.critical_edge.0:
  j .F._3MoxJ9jWv8O_find_polynomial_roots._38.while.exit.1              # ir inst 107 fin
.F._3MoxJ9jWv8O_find_polynomial_roots._41.critical_edge.1:
# Phi connections
  li t4, 1
  j .F._3MoxJ9jWv8O_find_polynomial_roots._30.while.exit.2              # ir inst 108 fin
.F._3MoxJ9jWv8O_find_polynomial_roots.epilogue:
  ld ra, 64(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  addi sp, sp, 80
  ret

.globl .F._3MoxJ9jWv8O_evaluate_polynomial_derivative
.F._3MoxJ9jWv8O_evaluate_polynomial_derivative:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._3MoxJ9jWv8O_evaluate_polynomial_derivative._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 1
  j .F._3MoxJ9jWv8O_evaluate_polynomial_derivative._1.while.cond.0      # ir inst 1 fin
.F._3MoxJ9jWv8O_evaluate_polynomial_derivative._1.while.cond.0:
  li t3, 120804
  add t3, a0, t3                                                        # ir inst 5 fin
  lw s11, 0(t3)                                                         # ir inst 6 fin
  slt t0, s11, t6
  xori t3, t0, 1                                                        # ir inst 7 fin
  bnez t3, .F._3MoxJ9jWv8O_evaluate_polynomial_derivative._2.while.body.0
  j .F._3MoxJ9jWv8O_evaluate_polynomial_derivative._3.while.exit.0      # ir inst 8 fin
.F._3MoxJ9jWv8O_evaluate_polynomial_derivative._2.while.body.0:
  li t3, 120004
  add t3, a0, t3                                                        # ir inst 9 fin
  mv s11, t6                                                            # ir inst 10 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 11 fin
  lw t3, 0(s10)                                                         # ir inst 12 fin
  mul s11, t6, t3                                                       # ir inst 13 fin
  mul t3, s11, t5                                                       # ir inst 14 fin
  add s11, t4, t3                                                       # ir inst 15 fin
  mul t3, t5, a1                                                        # ir inst 16 fin
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t4, s11
  mv t6, t5
  mv t5, t3
  j .F._3MoxJ9jWv8O_evaluate_polynomial_derivative._1.while.cond.0      # ir inst 18 fin
.F._3MoxJ9jWv8O_evaluate_polynomial_derivative._3.while.exit.0:
  mv a0, t4
  j .F._3MoxJ9jWv8O_evaluate_polynomial_derivative.epilogue             # ir inst 19 fin
.F._3MoxJ9jWv8O_evaluate_polynomial_derivative.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._3MoxJ9jWv8O_initialize_function_data
.F._3MoxJ9jWv8O_initialize_function_data:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._3MoxJ9jWv8O_initialize_function_data._0.entry.0:
  li t6, 125012
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_initialize_function_data._1.while.cond.0            # ir inst 3 fin
.F._3MoxJ9jWv8O_initialize_function_data._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_initialize_function_data._2.while.body.0
  j .F._3MoxJ9jWv8O_initialize_function_data._3.while.exit.0            # ir inst 6 fin
.F._3MoxJ9jWv8O_initialize_function_data._2.while.body.0:
  li t5, 121012
  add t5, a0, t5                                                        # ir inst 7 fin
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
  j .F._3MoxJ9jWv8O_initialize_function_data._1.while.cond.0            # ir inst 13 fin
.F._3MoxJ9jWv8O_initialize_function_data._3.while.exit.0:
  j .F._3MoxJ9jWv8O_initialize_function_data.epilogue                   # ir inst 14 fin
.F._3MoxJ9jWv8O_initialize_function_data.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_trapezoidal_integration
.F._3MoxJ9jWv8O_trapezoidal_integration:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._3MoxJ9jWv8O_trapezoidal_integration._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_trapezoidal_integration._1.while.cond.0             # ir inst 1 fin
.F._3MoxJ9jWv8O_trapezoidal_integration._1.while.cond.0:
  li t4, 125012
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  addi t4, t3, -1                                                       # ir inst 6 fin
  slt t3, t6, t4                                                        # ir inst 7 fin
  bnez t3, .F._3MoxJ9jWv8O_trapezoidal_integration._2.while.body.0
  j .F._3MoxJ9jWv8O_trapezoidal_integration._3.while.exit.0             # ir inst 8 fin
.F._3MoxJ9jWv8O_trapezoidal_integration._2.while.body.0:
  li t4, 121012
  add t4, a0, t4                                                        # ir inst 9 fin
  mv t3, t6                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 11 fin
  lw t4, 0(s11)                                                         # ir inst 12 fin
  li t3, 121012
  add t3, a0, t3                                                        # ir inst 13 fin
  addi s11, t6, 1                                                       # ir inst 14 fin
  mv s10, s11                                                           # ir inst 15 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 16 fin
  lw t3, 0(s11)                                                         # ir inst 17 fin
  add s11, t4, t3                                                       # ir inst 18 fin
  mul t4, s11, a1                                                       # ir inst 19 fin
  li t2, 2
  div t3, t4, t2                                                        # ir inst 20 fin
  add t4, t5, t3                                                        # ir inst 21 fin
  addi t3, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._3MoxJ9jWv8O_trapezoidal_integration._1.while.cond.0             # ir inst 23 fin
.F._3MoxJ9jWv8O_trapezoidal_integration._3.while.exit.0:
  mv a0, t5
  j .F._3MoxJ9jWv8O_trapezoidal_integration.epilogue                    # ir inst 24 fin
.F._3MoxJ9jWv8O_trapezoidal_integration.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._3MoxJ9jWv8O_simpson_integration
.F._3MoxJ9jWv8O_simpson_integration:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._3MoxJ9jWv8O_simpson_integration._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_simpson_integration._1.while.cond.0                 # ir inst 1 fin
.F._3MoxJ9jWv8O_simpson_integration._1.while.cond.0:
  li t4, 125012
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  addi t4, t3, -2                                                       # ir inst 6 fin
  slt t3, t6, t4                                                        # ir inst 7 fin
  bnez t3, .F._3MoxJ9jWv8O_simpson_integration._2.while.body.0
  j .F._3MoxJ9jWv8O_simpson_integration._3.while.exit.0                 # ir inst 8 fin
.F._3MoxJ9jWv8O_simpson_integration._2.while.body.0:
  li t4, 121012
  add t4, a0, t4                                                        # ir inst 9 fin
  mv t3, t6                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 11 fin
  lw t4, 0(s11)                                                         # ir inst 12 fin
  li t3, 121012
  add t3, a0, t3                                                        # ir inst 13 fin
  addi s11, t6, 1                                                       # ir inst 14 fin
  mv s10, s11                                                           # ir inst 15 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 16 fin
  lw t3, 0(s11)                                                         # ir inst 17 fin
  slli s11, t3, 2                                                       # ir inst 18 fin
  add t3, t4, s11                                                       # ir inst 19 fin
  li t4, 121012
  add t4, a0, t4                                                        # ir inst 20 fin
  addi s11, t6, 2                                                       # ir inst 21 fin
  mv s10, s11                                                           # ir inst 22 fin
  slli t2, s10, 2
  add s11, t4, t2                                                       # ir inst 23 fin
  lw t4, 0(s11)                                                         # ir inst 24 fin
  add s11, t3, t4                                                       # ir inst 25 fin
  mul t4, a1, s11                                                       # ir inst 26 fin
  li t2, 3
  div t3, t4, t2                                                        # ir inst 27 fin
  add t4, t5, t3                                                        # ir inst 28 fin
  addi t3, t6, 2                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._3MoxJ9jWv8O_simpson_integration._1.while.cond.0                 # ir inst 30 fin
.F._3MoxJ9jWv8O_simpson_integration._3.while.exit.0:
  mv a0, t5
  j .F._3MoxJ9jWv8O_simpson_integration.epilogue                        # ir inst 31 fin
.F._3MoxJ9jWv8O_simpson_integration.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._3MoxJ9jWv8O_initialize_fft_data
.F._3MoxJ9jWv8O_initialize_fft_data:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._3MoxJ9jWv8O_initialize_fft_data._0.entry.0:
  li t6, 129152
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_initialize_fft_data._1.while.cond.0                 # ir inst 3 fin
.F._3MoxJ9jWv8O_initialize_fft_data._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_initialize_fft_data._2.while.body.0
  j .F._3MoxJ9jWv8O_initialize_fft_data._3.while.exit.0                 # ir inst 6 fin
.F._3MoxJ9jWv8O_initialize_fft_data._2.while.body.0:
  li t5, 125056
  add t5, a0, t5                                                        # ir inst 7 fin
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
  li t5, 127104
  add t5, a0, t5                                                        # ir inst 12 fin
  mv t4, t6                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_initialize_fft_data._1.while.cond.0                 # ir inst 17 fin
.F._3MoxJ9jWv8O_initialize_fft_data._3.while.exit.0:
  j .F._3MoxJ9jWv8O_initialize_fft_data.epilogue                        # ir inst 18 fin
.F._3MoxJ9jWv8O_initialize_fft_data.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_compute_fft
.F._3MoxJ9jWv8O_compute_fft:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 0(sp)
  sd s5, 8(sp)
  sd s0, 16(sp)
  sd s8, 24(sp)
  sd s7, 32(sp)
  sd s1, 40(sp)
  sd s6, 48(sp)
  sd s9, 56(sp)
  sd s10, 64(sp)
.F._3MoxJ9jWv8O_compute_fft._0.entry.0:
  li t6, 129152
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t4, 1
  li t6, 0
  j .F._3MoxJ9jWv8O_compute_fft._1.while.cond.0                         # ir inst 3 fin
.F._3MoxJ9jWv8O_compute_fft._1.while.cond.0:
  slt t3, t4, t5                                                        # ir inst 6 fin
  bnez t3, .F._3MoxJ9jWv8O_compute_fft._2.while.body.0
  j .F._3MoxJ9jWv8O_compute_fft._9.while.exit.0                         # ir inst 7 fin
.F._3MoxJ9jWv8O_compute_fft._2.while.body.0:
  li t2, 2
  div t3, t5, t2                                                        # ir inst 8 fin
# Phi connections
  j .F._3MoxJ9jWv8O_compute_fft._3.while.cond.1                         # ir inst 9 fin
.F._3MoxJ9jWv8O_compute_fft._3.while.cond.1:
  slt t0, t6, t3
  xori s11, t0, 1                                                       # ir inst 12 fin
  bnez s11, .F._3MoxJ9jWv8O_compute_fft._4.while.body.1
  j .F._3MoxJ9jWv8O_compute_fft._5.while.exit.1                         # ir inst 13 fin
.F._3MoxJ9jWv8O_compute_fft._4.while.body.1:
  sub s11, t6, t3                                                       # ir inst 14 fin
  li t2, 2
  div s10, t3, t2                                                       # ir inst 15 fin
# Phi connections
  mv t3, s10
  mv t6, s11
  j .F._3MoxJ9jWv8O_compute_fft._3.while.cond.1                         # ir inst 16 fin
.F._3MoxJ9jWv8O_compute_fft._5.while.exit.1:
  add s11, t6, t3                                                       # ir inst 17 fin
  slt t6, t4, s11                                                       # ir inst 18 fin
  bnez t6, .F._3MoxJ9jWv8O_compute_fft._6.if.then.0
  j .F._3MoxJ9jWv8O_compute_fft._7.if.else.0                            # ir inst 19 fin
.F._3MoxJ9jWv8O_compute_fft._6.if.then.0:
  li t6, 125056
  add t6, a0, t6                                                        # ir inst 20 fin
  mv t3, t4                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s10, t6, t2                                                       # ir inst 22 fin
  lw t6, 0(s10)                                                         # ir inst 23 fin
  li t3, 125056
  add t3, a0, t3                                                        # ir inst 24 fin
  mv s10, t4                                                            # ir inst 25 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 26 fin
  li t3, 125056
  add t3, a0, t3                                                        # ir inst 27 fin
  mv s10, s11                                                           # ir inst 28 fin
  slli t2, s10, 2
  add s8, t3, t2                                                        # ir inst 29 fin
  lw t3, 0(s8)                                                          # ir inst 30 fin
  sw t3, 0(s9)                                                          # ir inst 31 fin
  li t3, 125056
  add t3, a0, t3                                                        # ir inst 32 fin
  mv s10, s11                                                           # ir inst 33 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 34 fin
  sw t6, 0(s9)                                                          # ir inst 35 fin
  li t6, 127104
  add t6, a0, t6                                                        # ir inst 36 fin
  mv t3, t4                                                             # ir inst 37 fin
  slli t2, t3, 2
  add s10, t6, t2                                                       # ir inst 38 fin
  lw t6, 0(s10)                                                         # ir inst 39 fin
  li t3, 127104
  add t3, a0, t3                                                        # ir inst 40 fin
  mv s10, t4                                                            # ir inst 41 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 42 fin
  li t3, 127104
  add t3, a0, t3                                                        # ir inst 43 fin
  mv s10, s11                                                           # ir inst 44 fin
  slli t2, s10, 2
  add s8, t3, t2                                                        # ir inst 45 fin
  lw t3, 0(s8)                                                          # ir inst 46 fin
  sw t3, 0(s9)                                                          # ir inst 47 fin
  li t3, 127104
  add t3, a0, t3                                                        # ir inst 48 fin
  mv s10, s11                                                           # ir inst 49 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 50 fin
  sw t6, 0(s9)                                                          # ir inst 51 fin
  j .F._3MoxJ9jWv8O_compute_fft._8.if.exit.0                            # ir inst 52 fin
.F._3MoxJ9jWv8O_compute_fft._7.if.else.0:
  j .F._3MoxJ9jWv8O_compute_fft._8.if.exit.0                            # ir inst 53 fin
.F._3MoxJ9jWv8O_compute_fft._8.if.exit.0:
  addi t6, t4, 1                                                        # ir inst 54 fin
# Phi connections
  mv t4, t6
  mv t6, s11
  j .F._3MoxJ9jWv8O_compute_fft._1.while.cond.0                         # ir inst 55 fin
.F._3MoxJ9jWv8O_compute_fft._9.while.exit.0:
# Phi connections
  li t6, 2
  j .F._3MoxJ9jWv8O_compute_fft._10.while.cond.2                        # ir inst 56 fin
.F._3MoxJ9jWv8O_compute_fft._10.while.cond.2:
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 58 fin
  bnez t4, .F._3MoxJ9jWv8O_compute_fft._11.while.body.2
  j .F._3MoxJ9jWv8O_compute_fft._18.while.exit.2                        # ir inst 59 fin
.F._3MoxJ9jWv8O_compute_fft._11.while.body.2:
  li t2, 2
  div t4, t6, t2                                                        # ir inst 60 fin
  li t1, 6283
  div t3, t1, t6                                                        # ir inst 61 fin
# Phi connections
  li s11, 0
  j .F._3MoxJ9jWv8O_compute_fft._12.while.cond.3                        # ir inst 62 fin
.F._3MoxJ9jWv8O_compute_fft._12.while.cond.3:
  slt s10, s11, t5                                                      # ir inst 64 fin
  bnez s10, .F._3MoxJ9jWv8O_compute_fft._13.while.body.3
  j .F._3MoxJ9jWv8O_compute_fft._17.while.exit.3                        # ir inst 65 fin
.F._3MoxJ9jWv8O_compute_fft._13.while.body.3:
# Phi connections
  li s10, 0
  j .F._3MoxJ9jWv8O_compute_fft._14.while.cond.4                        # ir inst 66 fin
.F._3MoxJ9jWv8O_compute_fft._14.while.cond.4:
  slt s9, s10, t4                                                       # ir inst 68 fin
  bnez s9, .F._3MoxJ9jWv8O_compute_fft._15.while.body.4
  j .F._3MoxJ9jWv8O_compute_fft._16.while.exit.4                        # ir inst 69 fin
.F._3MoxJ9jWv8O_compute_fft._15.while.body.4:
  mul s9, s10, t3                                                       # ir inst 70 fin
  mul s8, s9, s9                                                        # ir inst 71 fin
  li t2, 2000
  div s7, s8, t2                                                        # ir inst 72 fin
  li t1, 1000
  sub s8, t1, s7                                                        # ir inst 73 fin
  mul s7, s9, s9                                                        # ir inst 74 fin
  li t2, 6000
  div s6, s7, t2                                                        # ir inst 75 fin
  mul s7, s6, s9                                                        # ir inst 76 fin
  sub s6, s9, s7                                                        # ir inst 77 fin
  add s9, s11, s10                                                      # ir inst 78 fin
  mv s7, s9                                                             # ir inst 79 fin
  add s9, s11, s10                                                      # ir inst 80 fin
  add s5, s9, t4                                                        # ir inst 81 fin
  mv s9, s5                                                             # ir inst 82 fin
  li s5, 125056
  add s5, a0, s5                                                        # ir inst 83 fin
  slli t2, s7, 2
  add s0, s5, t2                                                        # ir inst 84 fin
  lw s5, 0(s0)                                                          # ir inst 85 fin
  li s0, 127104
  add s0, a0, s0                                                        # ir inst 86 fin
  slli t2, s7, 2
  add s1, s0, t2                                                        # ir inst 87 fin
  lw s0, 0(s1)                                                          # ir inst 88 fin
  li s1, 125056
  add s1, a0, s1                                                        # ir inst 89 fin
  slli t2, s9, 2
  add a1, s1, t2                                                        # ir inst 90 fin
  lw s1, 0(a1)                                                          # ir inst 91 fin
  li a1, 127104
  add a1, a0, a1                                                        # ir inst 92 fin
  slli t2, s9, 2
  add a2, a1, t2                                                        # ir inst 93 fin
  lw a1, 0(a2)                                                          # ir inst 94 fin
  li t2, 1000
  div a2, s1, t2                                                        # ir inst 95 fin
  mul a3, a2, s8                                                        # ir inst 96 fin
  li t2, 1000
  div a2, a1, t2                                                        # ir inst 97 fin
  mul a4, a2, s6                                                        # ir inst 98 fin
  sub a2, a3, a4                                                        # ir inst 99 fin
  li t2, 1000
  div a3, s1, t2                                                        # ir inst 100 fin
  mul s1, a3, s6                                                        # ir inst 101 fin
  li t2, 1000
  div s6, a1, t2                                                        # ir inst 102 fin
  mul a1, s6, s8                                                        # ir inst 103 fin
  add s8, s1, a1                                                        # ir inst 104 fin
  li s6, 125056
  add s6, a0, s6                                                        # ir inst 105 fin
  slli t2, s7, 2
  add s1, s6, t2                                                        # ir inst 106 fin
  add s6, s5, a2                                                        # ir inst 107 fin
  sw s6, 0(s1)                                                          # ir inst 108 fin
  li s6, 127104
  add s6, a0, s6                                                        # ir inst 109 fin
  slli t2, s7, 2
  add s1, s6, t2                                                        # ir inst 110 fin
  add s7, s0, s8                                                        # ir inst 111 fin
  sw s7, 0(s1)                                                          # ir inst 112 fin
  li s7, 125056
  add s7, a0, s7                                                        # ir inst 113 fin
  slli t2, s9, 2
  add s6, s7, t2                                                        # ir inst 114 fin
  sub s7, s5, a2                                                        # ir inst 115 fin
  sw s7, 0(s6)                                                          # ir inst 116 fin
  li s7, 127104
  add s7, a0, s7                                                        # ir inst 117 fin
  slli t2, s9, 2
  add s6, s7, t2                                                        # ir inst 118 fin
  sub s9, s0, s8                                                        # ir inst 119 fin
  sw s9, 0(s6)                                                          # ir inst 120 fin
  addi s9, s10, 1                                                       # ir inst 121 fin
# Phi connections
  mv s10, s9
  j .F._3MoxJ9jWv8O_compute_fft._14.while.cond.4                        # ir inst 122 fin
.F._3MoxJ9jWv8O_compute_fft._16.while.exit.4:
  add s10, s11, t6                                                      # ir inst 123 fin
# Phi connections
  mv s11, s10
  j .F._3MoxJ9jWv8O_compute_fft._12.while.cond.3                        # ir inst 124 fin
.F._3MoxJ9jWv8O_compute_fft._17.while.exit.3:
  slli t4, t6, 1                                                        # ir inst 125 fin
# Phi connections
  mv t6, t4
  j .F._3MoxJ9jWv8O_compute_fft._10.while.cond.2                        # ir inst 126 fin
.F._3MoxJ9jWv8O_compute_fft._18.while.exit.2:
  j .F._3MoxJ9jWv8O_compute_fft.epilogue                                # ir inst 127 fin
.F._3MoxJ9jWv8O_compute_fft.epilogue:
  ld s11, 0(sp)
  ld s5, 8(sp)
  ld s0, 16(sp)
  ld s8, 24(sp)
  ld s7, 32(sp)
  ld s1, 40(sp)
  ld s6, 48(sp)
  ld s9, 56(sp)
  ld s10, 64(sp)
  addi sp, sp, 80
  ret

.globl .F._3MoxJ9jWv8O_generate_primes
.F._3MoxJ9jWv8O_generate_primes:
# spill func args num: 0,             range:    10000(sp) -    10000(sp)
# local var size: 10000,              range:        0(sp) -    10000(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10000
  add sp, sp, t0
.F._3MoxJ9jWv8O_generate_primes._0.entry.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_generate_primes._1.array.cond.0                     # ir inst 3 fin
.F._3MoxJ9jWv8O_generate_primes._1.array.cond.0:
  li t2, 10000
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F._3MoxJ9jWv8O_generate_primes._2.array.body.0
  j .F._3MoxJ9jWv8O_generate_primes._3.array.exit.0                     # ir inst 6 fin
.F._3MoxJ9jWv8O_generate_primes._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_generate_primes._1.array.cond.0                     # ir inst 10 fin
.F._3MoxJ9jWv8O_generate_primes._3.array.exit.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 0
  sb t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 0
  addi t6, t1, 1                                                        # ir inst 13 fin
  li t1, 0
  sb t1, 0(t6)                                                          # ir inst 14 fin
# Phi connections
  li t6, 2
  j .F._3MoxJ9jWv8O_generate_primes._4.while.cond.0                     # ir inst 15 fin
.F._3MoxJ9jWv8O_generate_primes._4.while.cond.0:
  mul t5, t6, t6                                                        # ir inst 17 fin
  slt t0, a1, t5
  xori t4, t0, 1                                                        # ir inst 18 fin
  bnez t4, .F._3MoxJ9jWv8O_generate_primes._5.while.body.0
  j .F._3MoxJ9jWv8O_generate_primes._12.while.exit.0                    # ir inst 19 fin
.F._3MoxJ9jWv8O_generate_primes._5.while.body.0:
  mv t5, t6                                                             # ir inst 20 fin
  addi t1, sp, 0
  add t4, t1, t5                                                        # ir inst 21 fin
  lb t5, 0(t4)                                                          # ir inst 22 fin
  bnez t5, .F._3MoxJ9jWv8O_generate_primes._6.if.then.0
  j .F._3MoxJ9jWv8O_generate_primes._10.if.else.0                       # ir inst 23 fin
.F._3MoxJ9jWv8O_generate_primes._6.if.then.0:
  mul t5, t6, t6                                                        # ir inst 24 fin
# Phi connections
  j .F._3MoxJ9jWv8O_generate_primes._7.while.cond.1                     # ir inst 25 fin
.F._3MoxJ9jWv8O_generate_primes._7.while.cond.1:
  slt t0, a1, t5
  xori t4, t0, 1                                                        # ir inst 27 fin
  bnez t4, .F._3MoxJ9jWv8O_generate_primes._8.while.body.1
  j .F._3MoxJ9jWv8O_generate_primes._9.while.exit.1                     # ir inst 28 fin
.F._3MoxJ9jWv8O_generate_primes._8.while.body.1:
  mv t4, t5                                                             # ir inst 29 fin
  addi t1, sp, 0
  add t3, t1, t4                                                        # ir inst 30 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 31 fin
  add t4, t5, t6                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  j .F._3MoxJ9jWv8O_generate_primes._7.while.cond.1                     # ir inst 33 fin
.F._3MoxJ9jWv8O_generate_primes._9.while.exit.1:
  j .F._3MoxJ9jWv8O_generate_primes._11.if.exit.0                       # ir inst 34 fin
.F._3MoxJ9jWv8O_generate_primes._10.if.else.0:
  j .F._3MoxJ9jWv8O_generate_primes._11.if.exit.0                       # ir inst 35 fin
.F._3MoxJ9jWv8O_generate_primes._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_generate_primes._4.while.cond.0                     # ir inst 37 fin
.F._3MoxJ9jWv8O_generate_primes._12.while.exit.0:
  li t6, 133156
  add t6, a0, t6                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 39 fin
# Phi connections
  li t6, 2
  j .F._3MoxJ9jWv8O_generate_primes._13.while.cond.2                    # ir inst 40 fin
.F._3MoxJ9jWv8O_generate_primes._13.while.cond.2:
  slt t0, a1, t6
  xori t5, t0, 1                                                        # ir inst 42 fin
  bnez t5, .F._3MoxJ9jWv8O_generate_primes._14.lazy.then.0
  j .F._3MoxJ9jWv8O_generate_primes._15.lazy.else.0                     # ir inst 43 fin
.F._3MoxJ9jWv8O_generate_primes._14.lazy.then.0:
  li t5, 133156
  add t5, a0, t5                                                        # ir inst 44 fin
  lw t4, 0(t5)                                                          # ir inst 45 fin
  li t2, 1000
  slt t5, t4, t2                                                        # ir inst 46 fin
# Phi connections
  j .F._3MoxJ9jWv8O_generate_primes._16.lazy.exit.0                     # ir inst 47 fin
.F._3MoxJ9jWv8O_generate_primes._15.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_generate_primes._16.lazy.exit.0                     # ir inst 48 fin
.F._3MoxJ9jWv8O_generate_primes._16.lazy.exit.0:
  bnez t5, .F._3MoxJ9jWv8O_generate_primes._17.while.body.2
  j .F._3MoxJ9jWv8O_generate_primes._21.while.exit.2                    # ir inst 50 fin
.F._3MoxJ9jWv8O_generate_primes._17.while.body.2:
  mv t5, t6                                                             # ir inst 51 fin
  addi t1, sp, 0
  add t4, t1, t5                                                        # ir inst 52 fin
  lb t5, 0(t4)                                                          # ir inst 53 fin
  bnez t5, .F._3MoxJ9jWv8O_generate_primes._18.if.then.1
  j .F._3MoxJ9jWv8O_generate_primes._19.if.else.1                       # ir inst 54 fin
.F._3MoxJ9jWv8O_generate_primes._18.if.then.1:
  li t5, 129156
  add t5, a0, t5                                                        # ir inst 55 fin
  li t4, 133156
  add t4, a0, t4                                                        # ir inst 56 fin
  lw t3, 0(t4)                                                          # ir inst 57 fin
  mv t4, t3                                                             # ir inst 58 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 59 fin
  sw t6, 0(t3)                                                          # ir inst 60 fin
  li t5, 133156
  add t5, a0, t5                                                        # ir inst 61 fin
  lw t4, 0(t5)                                                          # ir inst 62 fin
  addi t3, t4, 1                                                        # ir inst 63 fin
  sw t3, 0(t5)                                                          # ir inst 64 fin
  j .F._3MoxJ9jWv8O_generate_primes._20.if.exit.1                       # ir inst 65 fin
.F._3MoxJ9jWv8O_generate_primes._19.if.else.1:
  j .F._3MoxJ9jWv8O_generate_primes._20.if.exit.1                       # ir inst 66 fin
.F._3MoxJ9jWv8O_generate_primes._20.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 67 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_generate_primes._13.while.cond.2                    # ir inst 68 fin
.F._3MoxJ9jWv8O_generate_primes._21.while.exit.2:
  j .F._3MoxJ9jWv8O_generate_primes.epilogue                            # ir inst 69 fin
.F._3MoxJ9jWv8O_generate_primes.epilogue:
  li t0, 10000
  add sp, sp, t0
  ret

.globl .F._3MoxJ9jWv8O_prime_factorize
.F._3MoxJ9jWv8O_prime_factorize:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s7, 0(sp)
  sd s9, 8(sp)
  sd s8, 16(sp)
  sd s10, 24(sp)
  sd s11, 32(sp)
.F._3MoxJ9jWv8O_prime_factorize._0.entry.0:
# Phi connections
  mv t4, a1
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_prime_factorize._1.while.cond.0                     # ir inst 1 fin
.F._3MoxJ9jWv8O_prime_factorize._1.while.cond.0:
  li t3, 133156
  add t3, a0, t3                                                        # ir inst 5 fin
  lw s11, 0(t3)                                                         # ir inst 6 fin
  slt t3, t6, s11                                                       # ir inst 7 fin
  bnez t3, .F._3MoxJ9jWv8O_prime_factorize._2.lazy.then.0
  j .F._3MoxJ9jWv8O_prime_factorize._3.lazy.else.0                      # ir inst 8 fin
.F._3MoxJ9jWv8O_prime_factorize._2.lazy.then.0:
  li t3, 129156
  add t3, a0, t3                                                        # ir inst 9 fin
  mv s11, t6                                                            # ir inst 10 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 11 fin
  lw t3, 0(s10)                                                         # ir inst 12 fin
  li s11, 129156
  add s11, a0, s11                                                      # ir inst 13 fin
  mv s10, t6                                                            # ir inst 14 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 15 fin
  lw s11, 0(s9)                                                         # ir inst 16 fin
  mul s10, t3, s11                                                      # ir inst 17 fin
  slt t0, t4, s10
  xori t3, t0, 1                                                        # ir inst 18 fin
# Phi connections
  j .F._3MoxJ9jWv8O_prime_factorize._4.lazy.exit.0                      # ir inst 19 fin
.F._3MoxJ9jWv8O_prime_factorize._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._3MoxJ9jWv8O_prime_factorize._4.lazy.exit.0                      # ir inst 20 fin
.F._3MoxJ9jWv8O_prime_factorize._4.lazy.exit.0:
  bnez t3, .F._3MoxJ9jWv8O_prime_factorize._5.while.body.0
  j .F._3MoxJ9jWv8O_prime_factorize._9.while.exit.0                     # ir inst 22 fin
.F._3MoxJ9jWv8O_prime_factorize._5.while.body.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F._3MoxJ9jWv8O_prime_factorize._6.while.cond.1                     # ir inst 23 fin
.F._3MoxJ9jWv8O_prime_factorize._6.while.cond.1:
  li s10, 129156
  add s10, a0, s10                                                      # ir inst 26 fin
  mv s9, t6                                                             # ir inst 27 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 28 fin
  lw s10, 0(s8)                                                         # ir inst 29 fin
  rem s9, s11, s10                                                      # ir inst 30 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s10, t0, 1                                                      # ir inst 31 fin
  bnez s10, .F._3MoxJ9jWv8O_prime_factorize._7.while.body.1
  j .F._3MoxJ9jWv8O_prime_factorize._8.while.exit.1                     # ir inst 32 fin
.F._3MoxJ9jWv8O_prime_factorize._7.while.body.1:
  li s10, 133160
  add s10, a0, s10                                                      # ir inst 33 fin
  addi s9, s10, 0                                                       # ir inst 34 fin
  mv s10, t3                                                            # ir inst 35 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 36 fin
  li s10, 129156
  add s10, a0, s10                                                      # ir inst 37 fin
  mv s9, t6                                                             # ir inst 38 fin
  slli t2, s9, 2
  add s7, s10, t2                                                       # ir inst 39 fin
  lw s10, 0(s7)                                                         # ir inst 40 fin
  sw s10, 0(s8)                                                         # ir inst 41 fin
  addi s10, t3, 1                                                       # ir inst 42 fin
  li s9, 129156
  add s9, a0, s9                                                        # ir inst 43 fin
  mv s8, t6                                                             # ir inst 44 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 45 fin
  lw s9, 0(s7)                                                          # ir inst 46 fin
  div s8, s11, s9                                                       # ir inst 47 fin
# Phi connections
  mv s11, s8
  mv t3, s10
  j .F._3MoxJ9jWv8O_prime_factorize._6.while.cond.1                     # ir inst 48 fin
.F._3MoxJ9jWv8O_prime_factorize._8.while.exit.1:
  addi s10, t6, 1                                                       # ir inst 49 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F._3MoxJ9jWv8O_prime_factorize._1.while.cond.0                     # ir inst 50 fin
.F._3MoxJ9jWv8O_prime_factorize._9.while.exit.0:
  li t2, 1
  slt t6, t2, t4                                                        # ir inst 51 fin
  bnez t6, .F._3MoxJ9jWv8O_prime_factorize._10.if.then.0
  j .F._3MoxJ9jWv8O_prime_factorize._11.if.else.0                       # ir inst 52 fin
.F._3MoxJ9jWv8O_prime_factorize._10.if.then.0:
  li t6, 133160
  add t6, a0, t6                                                        # ir inst 53 fin
  addi t3, t6, 0                                                        # ir inst 54 fin
  mv t6, t5                                                             # ir inst 55 fin
  slli t2, t6, 2
  add s11, t3, t2                                                       # ir inst 56 fin
  sw t4, 0(s11)                                                         # ir inst 57 fin
  addi t6, t5, 1                                                        # ir inst 58 fin
# Phi connections
  j .F._3MoxJ9jWv8O_prime_factorize._12.if.exit.0                       # ir inst 59 fin
.F._3MoxJ9jWv8O_prime_factorize._11.if.else.0:
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_prime_factorize._12.if.exit.0                       # ir inst 60 fin
.F._3MoxJ9jWv8O_prime_factorize._12.if.exit.0:
  mv a0, t6
  j .F._3MoxJ9jWv8O_prime_factorize.epilogue                            # ir inst 62 fin
.F._3MoxJ9jWv8O_prime_factorize.epilogue:
  ld s7, 0(sp)
  ld s9, 8(sp)
  ld s8, 16(sp)
  ld s10, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_initialize_data_series
.F._3MoxJ9jWv8O_initialize_data_series:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._3MoxJ9jWv8O_initialize_data_series._0.entry.0:
  li t6, 149160
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_initialize_data_series._1.while.cond.0              # ir inst 3 fin
.F._3MoxJ9jWv8O_initialize_data_series._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_initialize_data_series._2.while.body.0
  j .F._3MoxJ9jWv8O_initialize_data_series._3.while.exit.0              # ir inst 6 fin
.F._3MoxJ9jWv8O_initialize_data_series._2.while.body.0:
  li t5, 141160
  add t5, a0, t5                                                        # ir inst 7 fin
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
  j .F._3MoxJ9jWv8O_initialize_data_series._1.while.cond.0              # ir inst 13 fin
.F._3MoxJ9jWv8O_initialize_data_series._3.while.exit.0:
  j .F._3MoxJ9jWv8O_initialize_data_series.epilogue                     # ir inst 14 fin
.F._3MoxJ9jWv8O_initialize_data_series.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_calculate_moments
.F._3MoxJ9jWv8O_calculate_moments:
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
.F._3MoxJ9jWv8O_calculate_moments._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_calculate_moments._1.while.cond.0                   # ir inst 1 fin
.F._3MoxJ9jWv8O_calculate_moments._1.while.cond.0:
  li t4, 149160
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  slt t4, t5, t3                                                        # ir inst 6 fin
  bnez t4, .F._3MoxJ9jWv8O_calculate_moments._2.while.body.0
  j .F._3MoxJ9jWv8O_calculate_moments._3.while.exit.0                   # ir inst 7 fin
.F._3MoxJ9jWv8O_calculate_moments._2.while.body.0:
  li t4, 141160
  add t4, a0, t4                                                        # ir inst 8 fin
  mv t3, t5                                                             # ir inst 9 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 10 fin
  lw t4, 0(s11)                                                         # ir inst 11 fin
  add t3, t6, t4                                                        # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._3MoxJ9jWv8O_calculate_moments._1.while.cond.0                   # ir inst 14 fin
.F._3MoxJ9jWv8O_calculate_moments._3.while.exit.0:
  li t5, 149160
  add t5, a0, t5                                                        # ir inst 15 fin
  lw t4, 0(t5)                                                          # ir inst 16 fin
  div t5, t6, t4                                                        # ir inst 17 fin
  li t6, 149164
  add t6, a0, t6                                                        # ir inst 18 fin
  addi t4, t6, 0                                                        # ir inst 19 fin
  sw t5, 0(t4)                                                          # ir inst 20 fin
# Phi connections
  li s11, 0
  li t3, 0
  li t4, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_calculate_moments._4.while.cond.1                   # ir inst 21 fin
.F._3MoxJ9jWv8O_calculate_moments._4.while.cond.1:
  li s10, 149160
  add s10, a0, s10                                                      # ir inst 26 fin
  lw s9, 0(s10)                                                         # ir inst 27 fin
  slt s10, t6, s9                                                       # ir inst 28 fin
  bnez s10, .F._3MoxJ9jWv8O_calculate_moments._5.while.body.1
  j .F._3MoxJ9jWv8O_calculate_moments._6.while.exit.1                   # ir inst 29 fin
.F._3MoxJ9jWv8O_calculate_moments._5.while.body.1:
  li s10, 141160
  add s10, a0, s10                                                      # ir inst 30 fin
  mv s9, t6                                                             # ir inst 31 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 32 fin
  lw s10, 0(s8)                                                         # ir inst 33 fin
  sub s9, s10, t5                                                       # ir inst 34 fin
  mul s10, s9, s9                                                       # ir inst 35 fin
  mul s8, s10, s9                                                       # ir inst 36 fin
  mul s7, s8, s9                                                        # ir inst 37 fin
  add s9, t4, s10                                                       # ir inst 38 fin
  add s10, s11, s8                                                      # ir inst 39 fin
  add s8, t3, s7                                                        # ir inst 40 fin
  addi s7, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv s11, s10
  mv t3, s8
  mv t4, s9
  mv t6, s7
  j .F._3MoxJ9jWv8O_calculate_moments._4.while.cond.1                   # ir inst 42 fin
.F._3MoxJ9jWv8O_calculate_moments._6.while.exit.1:
  li t6, 149164
  add t6, a0, t6                                                        # ir inst 43 fin
  addi t5, t6, 4                                                        # ir inst 44 fin
  li t6, 149160
  add t6, a0, t6                                                        # ir inst 45 fin
  lw s10, 0(t6)                                                         # ir inst 46 fin
  div t6, t4, s10                                                       # ir inst 47 fin
  sw t6, 0(t5)                                                          # ir inst 48 fin
  li t6, 149164
  add t6, a0, t6                                                        # ir inst 49 fin
  addi t5, t6, 8                                                        # ir inst 50 fin
  li t6, 149160
  add t6, a0, t6                                                        # ir inst 51 fin
  lw t4, 0(t6)                                                          # ir inst 52 fin
  div t6, s11, t4                                                       # ir inst 53 fin
  sw t6, 0(t5)                                                          # ir inst 54 fin
  li t6, 149164
  add t6, a0, t6                                                        # ir inst 55 fin
  addi t5, t6, 12                                                       # ir inst 56 fin
  li t6, 149160
  add t6, a0, t6                                                        # ir inst 57 fin
  lw t4, 0(t6)                                                          # ir inst 58 fin
  div t6, t3, t4                                                        # ir inst 59 fin
  sw t6, 0(t5)                                                          # ir inst 60 fin
  li t6, 141160
  add t6, a0, t6                                                        # ir inst 61 fin
  addi t5, t6, 0                                                        # ir inst 62 fin
  lw t6, 0(t5)                                                          # ir inst 63 fin
  li t5, 141160
  add t5, a0, t5                                                        # ir inst 64 fin
  addi t4, t5, 0                                                        # ir inst 65 fin
  lw t5, 0(t4)                                                          # ir inst 66 fin
# Phi connections
  mv t4, t5
  li t5, 1
  j .F._3MoxJ9jWv8O_calculate_moments._7.while.cond.2                   # ir inst 67 fin
.F._3MoxJ9jWv8O_calculate_moments._7.while.cond.2:
  li t3, 149160
  add t3, a0, t3                                                        # ir inst 71 fin
  lw s11, 0(t3)                                                         # ir inst 72 fin
  slt t3, t5, s11                                                       # ir inst 73 fin
  bnez t3, .F._3MoxJ9jWv8O_calculate_moments._8.while.body.2
  j .F._3MoxJ9jWv8O_calculate_moments._15.while.exit.2                  # ir inst 74 fin
.F._3MoxJ9jWv8O_calculate_moments._8.while.body.2:
  li t3, 141160
  add t3, a0, t3                                                        # ir inst 75 fin
  mv s11, t5                                                            # ir inst 76 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 77 fin
  lw t3, 0(s10)                                                         # ir inst 78 fin
  slt s11, t3, t6                                                       # ir inst 79 fin
  bnez s11, .F._3MoxJ9jWv8O_calculate_moments._9.if.then.0
  j .F._3MoxJ9jWv8O_calculate_moments._10.if.else.0                     # ir inst 80 fin
.F._3MoxJ9jWv8O_calculate_moments._9.if.then.0:
  li t3, 141160
  add t3, a0, t3                                                        # ir inst 81 fin
  mv s11, t5                                                            # ir inst 82 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 83 fin
  lw t3, 0(s10)                                                         # ir inst 84 fin
# Phi connections
  j .F._3MoxJ9jWv8O_calculate_moments._11.if.exit.0                     # ir inst 85 fin
.F._3MoxJ9jWv8O_calculate_moments._10.if.else.0:
# Phi connections
  mv t3, t6
  j .F._3MoxJ9jWv8O_calculate_moments._11.if.exit.0                     # ir inst 86 fin
.F._3MoxJ9jWv8O_calculate_moments._11.if.exit.0:
  li s11, 141160
  add s11, a0, s11                                                      # ir inst 88 fin
  mv s10, t5                                                            # ir inst 89 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 90 fin
  lw s11, 0(s9)                                                         # ir inst 91 fin
  slt s10, t4, s11                                                      # ir inst 92 fin
  bnez s10, .F._3MoxJ9jWv8O_calculate_moments._12.if.then.1
  j .F._3MoxJ9jWv8O_calculate_moments._13.if.else.1                     # ir inst 93 fin
.F._3MoxJ9jWv8O_calculate_moments._12.if.then.1:
  li s11, 141160
  add s11, a0, s11                                                      # ir inst 94 fin
  mv s10, t5                                                            # ir inst 95 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 96 fin
  lw s11, 0(s9)                                                         # ir inst 97 fin
# Phi connections
  j .F._3MoxJ9jWv8O_calculate_moments._14.if.exit.1                     # ir inst 98 fin
.F._3MoxJ9jWv8O_calculate_moments._13.if.else.1:
# Phi connections
  mv s11, t4
  j .F._3MoxJ9jWv8O_calculate_moments._14.if.exit.1                     # ir inst 99 fin
.F._3MoxJ9jWv8O_calculate_moments._14.if.exit.1:
  addi s10, t5, 1                                                       # ir inst 101 fin
# Phi connections
  mv t4, s11
  mv t5, s10
  mv t6, t3
  j .F._3MoxJ9jWv8O_calculate_moments._7.while.cond.2                   # ir inst 102 fin
.F._3MoxJ9jWv8O_calculate_moments._15.while.exit.2:
  li t5, 149164
  add t5, a0, t5                                                        # ir inst 103 fin
  addi t3, t5, 16                                                       # ir inst 104 fin
  sw t6, 0(t3)                                                          # ir inst 105 fin
  li t5, 149164
  add t5, a0, t5                                                        # ir inst 106 fin
  addi t3, t5, 20                                                       # ir inst 107 fin
  sw t4, 0(t3)                                                          # ir inst 108 fin
  li t5, 149164
  add t5, a0, t5                                                        # ir inst 109 fin
  addi t3, t5, 24                                                       # ir inst 110 fin
  sub t5, t4, t6                                                        # ir inst 111 fin
  sw t5, 0(t3)                                                          # ir inst 112 fin
  j .F._3MoxJ9jWv8O_calculate_moments.epilogue                          # ir inst 113 fin
.F._3MoxJ9jWv8O_calculate_moments.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_perform_comprehensive_analysis
.F._3MoxJ9jWv8O_perform_comprehensive_analysis:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s10, 24(sp)
  sd s11, 32(sp)
  sd ra, 40(sp)
.F._3MoxJ9jWv8O_perform_comprehensive_analysis._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_matrix_multiply
  ld a0, 0(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_calculate_determinant
  mv t6, a0
  ld a0, 0(sp)
# ir inst 2 fin
  li t5, 149604
  add t5, a0, t5                                                        # ir inst 3 fin
  li t4, 149804
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  mv t4, t3                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 7 fin
  sw t6, 0(t3)                                                          # ir inst 8 fin
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 9 fin
  lw t5, 0(t6)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
  sw t4, 0(t6)                                                          # ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_matrix_operations_suite
  ld a0, 0(sp)
# ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_find_polynomial_roots
  ld a0, 0(sp)
# ir inst 14 fin
  li t6, 149604
  add t6, a0, t6                                                        # ir inst 15 fin
  li t5, 149804
  add t5, a0, t5                                                        # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  mv t5, t4                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t6, 121008
  add t6, a0, t6                                                        # ir inst 20 fin
  lw t5, 0(t6)                                                          # ir inst 21 fin
  sw t5, 0(t4)                                                          # ir inst 22 fin
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  addi t4, t5, 1                                                        # ir inst 25 fin
  sw t4, 0(t6)                                                          # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  li a1, 1
  call .F._3MoxJ9jWv8O_trapezoidal_integration
  mv t6, a0
  ld a0, 0(sp)
# ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a1, 1
  call .F._3MoxJ9jWv8O_simpson_integration
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 28 fin
  li t4, 125016
  add t4, a0, t4                                                        # ir inst 29 fin
  addi t3, t4, 0                                                        # ir inst 30 fin
  sw t6, 0(t3)                                                          # ir inst 31 fin
  li t6, 125016
  add t6, a0, t6                                                        # ir inst 32 fin
  addi t4, t6, 4                                                        # ir inst 33 fin
  sw t5, 0(t4)                                                          # ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_compute_fft
  ld a0, 0(sp)
# ir inst 35 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F._3MoxJ9jWv8O_perform_comprehensive_analysis._1.while.cond.0      # ir inst 36 fin
.F._3MoxJ9jWv8O_perform_comprehensive_analysis._1.while.cond.0:
  li t4, 129152
  add t4, a0, t4                                                        # ir inst 39 fin
  lw t3, 0(t4)                                                          # ir inst 40 fin
  slt t4, t6, t3                                                        # ir inst 41 fin
  bnez t4, .F._3MoxJ9jWv8O_perform_comprehensive_analysis._2.while.body.0
  j .F._3MoxJ9jWv8O_perform_comprehensive_analysis._3.while.exit.0      # ir inst 42 fin
.F._3MoxJ9jWv8O_perform_comprehensive_analysis._2.while.body.0:
  li t4, 125056
  add t4, a0, t4                                                        # ir inst 43 fin
  mv t3, t6                                                             # ir inst 44 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 45 fin
  lw t4, 0(s11)                                                         # ir inst 46 fin
  li t3, 127104
  add t3, a0, t3                                                        # ir inst 47 fin
  mv s11, t6                                                            # ir inst 48 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 49 fin
  lw t3, 0(s10)                                                         # ir inst 50 fin
  mul s11, t4, t4                                                       # ir inst 51 fin
  mul t4, t3, t3                                                        # ir inst 52 fin
  add t3, s11, t4                                                       # ir inst 53 fin
  add t4, t5, t3                                                        # ir inst 54 fin
  addi t3, t6, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._3MoxJ9jWv8O_perform_comprehensive_analysis._1.while.cond.0      # ir inst 56 fin
.F._3MoxJ9jWv8O_perform_comprehensive_analysis._3.while.exit.0:
  li t6, 149604
  add t6, a0, t6                                                        # ir inst 57 fin
  li t4, 149804
  add t4, a0, t4                                                        # ir inst 58 fin
  lw t3, 0(t4)                                                          # ir inst 59 fin
  mv t4, t3                                                             # ir inst 60 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 61 fin
  sw t5, 0(t3)                                                          # ir inst 62 fin
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 63 fin
  lw t5, 0(t6)                                                          # ir inst 64 fin
  addi t4, t5, 1                                                        # ir inst 65 fin
  sw t4, 0(t6)                                                          # ir inst 66 fin
# Start call preparation
  sd a0, 0(sp)
  li a1, 12345
  call .F._3MoxJ9jWv8O_prime_factorize
  mv t6, a0
  ld a0, 0(sp)
# ir inst 67 fin
  li t5, 149604
  add t5, a0, t5                                                        # ir inst 68 fin
  li t4, 149804
  add t4, a0, t4                                                        # ir inst 69 fin
  lw t3, 0(t4)                                                          # ir inst 70 fin
  mv t4, t3                                                             # ir inst 71 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 72 fin
  sw t6, 0(t3)                                                          # ir inst 73 fin
  li t6, 149804
  add t6, a0, t6                                                        # ir inst 74 fin
  lw t5, 0(t6)                                                          # ir inst 75 fin
  addi t4, t5, 1                                                        # ir inst 76 fin
  sw t4, 0(t6)                                                          # ir inst 77 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_calculate_moments
  ld a0, 0(sp)
# ir inst 78 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._3MoxJ9jWv8O_output_comprehensive_results
  ld a0, 0(sp)
# ir inst 79 fin
  j .F._3MoxJ9jWv8O_perform_comprehensive_analysis.epilogue             # ir inst 80 fin
.F._3MoxJ9jWv8O_perform_comprehensive_analysis.epilogue:
  ld ra, 40(sp)
  ld s10, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._3MoxJ9jWv8O_output_comprehensive_results
.F._3MoxJ9jWv8O_output_comprehensive_results:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F._3MoxJ9jWv8O_output_comprehensive_results._0.entry.0:
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_output_comprehensive_results._1.while.cond.0        # ir inst 1 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._1.while.cond.0:
  li t5, 149804
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._3MoxJ9jWv8O_output_comprehensive_results._2.while.body.0
  j .F._3MoxJ9jWv8O_output_comprehensive_results._3.while.exit.0        # ir inst 6 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._2.while.body.0:
  li t5, 149604
  add t5, a0, t5                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  lw t5, 0(t3)                                                          # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_output_comprehensive_results._1.while.cond.0        # ir inst 13 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_output_comprehensive_results._4.while.cond.1        # ir inst 14 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._4.while.cond.1:
  li t2, 7
  slt t5, t6, t2                                                        # ir inst 16 fin
  bnez t5, .F._3MoxJ9jWv8O_output_comprehensive_results._5.while.body.1
  j .F._3MoxJ9jWv8O_output_comprehensive_results._6.while.exit.1        # ir inst 17 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._5.while.body.1:
  li t5, 149164
  add t5, a0, t5                                                        # ir inst 18 fin
  mv t4, t6                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 20 fin
  lw t5, 0(t3)                                                          # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 22 fin
  addi t5, t6, 1                                                        # ir inst 23 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_output_comprehensive_results._4.while.cond.1        # ir inst 24 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._6.while.exit.1:
  li t6, 125016
  add t6, a0, t6                                                        # ir inst 25 fin
  addi t5, t6, 0                                                        # ir inst 26 fin
  lw t6, 0(t5)                                                          # ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 28 fin
  li t6, 125016
  add t6, a0, t6                                                        # ir inst 29 fin
  addi t5, t6, 4                                                        # ir inst 30 fin
  lw t6, 0(t5)                                                          # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 32 fin
# Phi connections
  li t6, 0
  j .F._3MoxJ9jWv8O_output_comprehensive_results._7.while.cond.2        # ir inst 33 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._7.while.cond.2:
  li t5, 121008
  add t5, a0, t5                                                        # ir inst 35 fin
  lw t4, 0(t5)                                                          # ir inst 36 fin
  slt t5, t6, t4                                                        # ir inst 37 fin
  bnez t5, .F._3MoxJ9jWv8O_output_comprehensive_results._8.lazy.then.0
  j .F._3MoxJ9jWv8O_output_comprehensive_results._9.lazy.else.0         # ir inst 38 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._8.lazy.then.0:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 39 fin
# Phi connections
  j .F._3MoxJ9jWv8O_output_comprehensive_results._10.lazy.exit.0        # ir inst 40 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._9.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._3MoxJ9jWv8O_output_comprehensive_results._10.lazy.exit.0        # ir inst 41 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._10.lazy.exit.0:
  bnez t5, .F._3MoxJ9jWv8O_output_comprehensive_results._11.while.body.2
  j .F._3MoxJ9jWv8O_output_comprehensive_results._12.while.exit.2       # ir inst 43 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._11.while.body.2:
  li t5, 120808
  add t5, a0, t5                                                        # ir inst 44 fin
  mv t4, t6                                                             # ir inst 45 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 46 fin
  lw t5, 0(t3)                                                          # ir inst 47 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 48 fin
  addi t5, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F._3MoxJ9jWv8O_output_comprehensive_results._7.while.cond.2        # ir inst 50 fin
.F._3MoxJ9jWv8O_output_comprehensive_results._12.while.exit.2:
  li t6, 133156
  add t6, a0, t6                                                        # ir inst 51 fin
  lw t5, 0(t6)                                                          # ir inst 52 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 53 fin
  li t6, 149604
  add t6, a0, t6                                                        # ir inst 54 fin
  addi t5, t6, 0                                                        # ir inst 55 fin
  lw t6, 0(t5)                                                          # ir inst 56 fin
  li t5, 149164
  add t5, a0, t5                                                        # ir inst 57 fin
  addi t4, t5, 0                                                        # ir inst 58 fin
  lw t5, 0(t4)                                                          # ir inst 59 fin
  add t4, t6, t5                                                        # ir inst 60 fin
  li t6, 125016
  add t6, a0, t6                                                        # ir inst 61 fin
  addi t5, t6, 0                                                        # ir inst 62 fin
  lw t6, 0(t5)                                                          # ir inst 63 fin
  add t5, t4, t6                                                        # ir inst 64 fin
  li t2, 3
  div t6, t5, t2                                                        # ir inst 65 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 66 fin
  j .F._3MoxJ9jWv8O_output_comprehensive_results.epilogue               # ir inst 67 fin
.F._3MoxJ9jWv8O_output_comprehensive_results.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl main
main:
# spill func args num: 0,             range:   149888(sp) -   149888(sp)
# local var size: 149808,             range:       72(sp) -   149880(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 5 / 12,        range:       24(sp) -       64(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -149888
  add sp, sp, t0
  sd s7, 24(sp)
  sd s8, 32(sp)
  sd s9, 40(sp)
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
main._0.entry.0:
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_new
# ir inst 2 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 3 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_initialize_matrices
  ld t6, 0(sp)
# ir inst 4 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 5 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_initialize_polynomial
  ld t6, 0(sp)
# ir inst 6 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 7 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_initialize_function_data
  ld t6, 0(sp)
# ir inst 8 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 9 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_initialize_fft_data
  ld t6, 0(sp)
# ir inst 10 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 11 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_initialize_data_series
  ld t6, 0(sp)
# ir inst 12 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_generate_primes
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_perform_comprehensive_analysis
# ir inst 15 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 16 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._1.while.cond.0                                                # ir inst 17 fin
main._1.while.cond.0:
  slt t3, t5, t6                                                        # ir inst 20 fin
  bnez t3, main._2.while.body.0
  j main._6.while.exit.0                                                # ir inst 21 fin
main._2.while.body.0:
  li t2, 13
  mul t3, t5, t2                                                        # ir inst 22 fin
  addi s11, t3, 7                                                       # ir inst 23 fin
  li t2, 100
  rem t3, s11, t2                                                       # ir inst 24 fin
# Phi connections
  li s11, 0
  j main._3.while.cond.1                                                # ir inst 25 fin
main._3.while.cond.1:
  addi t1, sp, 72
  li s10, 149160
  add s10, t1, s10                                                      # ir inst 27 fin
  lw s9, 0(s10)                                                         # ir inst 28 fin
  slt s10, s11, s9                                                      # ir inst 29 fin
  bnez s10, main._4.while.body.1
  j main._5.while.exit.1                                                # ir inst 30 fin
main._4.while.body.1:
  addi t1, sp, 72
  li s10, 141160
  add s10, t1, s10                                                      # ir inst 31 fin
  mv s9, s11                                                            # ir inst 32 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 33 fin
  addi t1, sp, 72
  li s10, 141160
  add s10, t1, s10                                                      # ir inst 34 fin
  mv s9, s11                                                            # ir inst 35 fin
  slli t2, s9, 2
  add s7, s10, t2                                                       # ir inst 36 fin
  lw s10, 0(s7)                                                         # ir inst 37 fin
  add s9, s10, t3                                                       # ir inst 38 fin
  li t2, 10000
  rem s10, s9, t2                                                       # ir inst 39 fin
  sw s10, 0(s8)                                                         # ir inst 40 fin
  addi s10, s11, 1                                                      # ir inst 41 fin
# Phi connections
  mv s11, s10
  j main._3.while.cond.1                                                # ir inst 42 fin
main._5.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 72
  mv a0, t1
  call .F._3MoxJ9jWv8O_calculate_moments
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 43 fin
  addi t1, sp, 72
  li t3, 149164
  add t3, t1, t3                                                        # ir inst 44 fin
  addi s11, t3, 0                                                       # ir inst 45 fin
  lw t3, 0(s11)                                                         # ir inst 46 fin
  addi t1, sp, 72
  li s11, 149164
  add s11, t1, s11                                                      # ir inst 47 fin
  addi s10, s11, 4                                                      # ir inst 48 fin
  lw s11, 0(s10)                                                        # ir inst 49 fin
  add s10, t3, s11                                                      # ir inst 50 fin
  add t3, t4, s10                                                       # ir inst 51 fin
  addi s11, t5, 1                                                       # ir inst 52 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, s11
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 53 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._1.while.cond.0                                                # ir inst 54 fin
main._6.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 55 fin
  addi t1, sp, 72
  li t5, 133156
  add t5, t1, t5                                                        # ir inst 56 fin
  lw t3, 0(t5)                                                          # ir inst 57 fin
  mul t5, t4, t3                                                        # ir inst 58 fin
  addi t4, t6, 1                                                        # ir inst 59 fin
  div t6, t5, t4                                                        # ir inst 60 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 61 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 62 fin
  j main.epilogue                                                       # ir inst 63 fin
main.epilogue:
  ld ra, 64(sp)
  ld s7, 24(sp)
  ld s8, 32(sp)
  ld s9, 40(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  li t0, 149888
  add sp, sp, t0
  ret
