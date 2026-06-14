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

.globl .F._14su0eKxQra_new
.F._14su0eKxQra_new:
# spill func args num: 0,             range:     3328(sp) -     3328(sp)
# local var size: 3280,               range:       40(sp) -     3320(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3328
  add sp, sp, t0
  sd ra, 32(sp)
.F._14su0eKxQra_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._1.array.cond.0                                 # ir inst 3 fin
.F._14su0eKxQra_new._1.array.cond.0:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F._14su0eKxQra_new._2.array.body.0
  j .F._14su0eKxQra_new._3.array.exit.0                                 # ir inst 6 fin
.F._14su0eKxQra_new._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._1.array.cond.0                                 # ir inst 10 fin
.F._14su0eKxQra_new._3.array.exit.0:
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 11 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 12 fin
  li t6, 20004
  add t6, a0, t6                                                        # ir inst 13 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_new._4.array.cond.1                                 # ir inst 16 fin
.F._14su0eKxQra_new._4.array.cond.1:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 18 fin
  bnez t3, .F._14su0eKxQra_new._5.array.body.1
  j .F._14su0eKxQra_new._6.array.exit.1                                 # ir inst 19 fin
.F._14su0eKxQra_new._5.array.body.1:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 20 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 21 fin
  addi t3, t4, 1                                                        # ir inst 22 fin
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_new._4.array.cond.1                                 # ir inst 23 fin
.F._14su0eKxQra_new._6.array.exit.1:
  addi t5, t6, 0                                                        # ir inst 24 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._7.array.cond.2                                 # ir inst 25 fin
.F._14su0eKxQra_new._7.array.cond.2:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 27 fin
  bnez t4, .F._14su0eKxQra_new._8.array.body.2
  j .F._14su0eKxQra_new._9.array.exit.2                                 # ir inst 28 fin
.F._14su0eKxQra_new._8.array.body.2:
  li t1, 800
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 29 fin
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
# ir inst 30 fin
  addi t4, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._7.array.cond.2                                 # ir inst 32 fin
.F._14su0eKxQra_new._9.array.exit.2:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 33 fin
  addi t5, t6, 0                                                        # ir inst 34 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._10.array.cond.3                                # ir inst 35 fin
.F._14su0eKxQra_new._10.array.cond.3:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 37 fin
  bnez t4, .F._14su0eKxQra_new._11.array.body.3
  j .F._14su0eKxQra_new._12.array.exit.3                                # ir inst 38 fin
.F._14su0eKxQra_new._11.array.body.3:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 39 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 40 fin
  addi t4, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._10.array.cond.3                                # ir inst 42 fin
.F._14su0eKxQra_new._12.array.exit.3:
  li t6, 60204
  add t6, a0, t6                                                        # ir inst 43 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 44 fin
  li t6, 60208
  add t6, a0, t6                                                        # ir inst 45 fin
  addi t5, t6, 0                                                        # ir inst 46 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._13.array.cond.4                                # ir inst 47 fin
.F._14su0eKxQra_new._13.array.cond.4:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 49 fin
  bnez t4, .F._14su0eKxQra_new._14.array.body.4
  j .F._14su0eKxQra_new._15.array.exit.4                                # ir inst 50 fin
.F._14su0eKxQra_new._14.array.body.4:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 52 fin
  addi t4, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._13.array.cond.4                                # ir inst 54 fin
.F._14su0eKxQra_new._15.array.exit.4:
  li t6, 80208
  add t6, a0, t6                                                        # ir inst 55 fin
  addi t5, t6, 0                                                        # ir inst 56 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._16.array.cond.5                                # ir inst 57 fin
.F._14su0eKxQra_new._16.array.cond.5:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 59 fin
  bnez t4, .F._14su0eKxQra_new._17.array.body.5
  j .F._14su0eKxQra_new._18.array.exit.5                                # ir inst 60 fin
.F._14su0eKxQra_new._17.array.body.5:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 62 fin
  addi t4, t6, 1                                                        # ir inst 63 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._16.array.cond.5                                # ir inst 64 fin
.F._14su0eKxQra_new._18.array.exit.5:
  li t6, 100208
  add t6, a0, t6                                                        # ir inst 65 fin
  addi t5, t6, 0                                                        # ir inst 66 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._19.array.cond.6                                # ir inst 67 fin
.F._14su0eKxQra_new._19.array.cond.6:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 69 fin
  bnez t4, .F._14su0eKxQra_new._20.array.body.6
  j .F._14su0eKxQra_new._21.array.exit.6                                # ir inst 70 fin
.F._14su0eKxQra_new._20.array.body.6:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 71 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 72 fin
  addi t4, t6, 1                                                        # ir inst 73 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._19.array.cond.6                                # ir inst 74 fin
.F._14su0eKxQra_new._21.array.exit.6:
  li t6, 120208
  add t6, a0, t6                                                        # ir inst 75 fin
  addi t5, t6, 0                                                        # ir inst 76 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._22.array.cond.7                                # ir inst 77 fin
.F._14su0eKxQra_new._22.array.cond.7:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 79 fin
  bnez t4, .F._14su0eKxQra_new._23.array.body.7
  j .F._14su0eKxQra_new._24.array.exit.7                                # ir inst 80 fin
.F._14su0eKxQra_new._23.array.body.7:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 81 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 82 fin
  addi t4, t6, 1                                                        # ir inst 83 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._22.array.cond.7                                # ir inst 84 fin
.F._14su0eKxQra_new._24.array.exit.7:
  li t6, 121008
  add t6, a0, t6                                                        # ir inst 85 fin
  addi t5, t6, 0                                                        # ir inst 86 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._25.array.cond.8                                # ir inst 87 fin
.F._14su0eKxQra_new._25.array.cond.8:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 89 fin
  bnez t4, .F._14su0eKxQra_new._26.array.body.8
  j .F._14su0eKxQra_new._27.array.exit.8                                # ir inst 90 fin
.F._14su0eKxQra_new._26.array.body.8:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 91 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 92 fin
  addi t4, t6, 1                                                        # ir inst 93 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._25.array.cond.8                                # ir inst 94 fin
.F._14su0eKxQra_new._27.array.exit.8:
  li t6, 122032
  add t6, a0, t6                                                        # ir inst 95 fin
  addi t5, t6, 0                                                        # ir inst 96 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._28.array.cond.9                                # ir inst 97 fin
.F._14su0eKxQra_new._28.array.cond.9:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 99 fin
  bnez t4, .F._14su0eKxQra_new._29.array.body.9
  j .F._14su0eKxQra_new._30.array.exit.9                                # ir inst 100 fin
.F._14su0eKxQra_new._29.array.body.9:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 101 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 102 fin
  addi t4, t6, 1                                                        # ir inst 103 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._28.array.cond.9                                # ir inst 104 fin
.F._14su0eKxQra_new._30.array.exit.9:
  li t6, 122832
  add t6, a0, t6                                                        # ir inst 105 fin
  addi t5, t6, 0                                                        # ir inst 106 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._31.array.cond.10                               # ir inst 107 fin
.F._14su0eKxQra_new._31.array.cond.10:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 109 fin
  bnez t4, .F._14su0eKxQra_new._32.array.body.10
  j .F._14su0eKxQra_new._33.array.exit.10                               # ir inst 110 fin
.F._14su0eKxQra_new._32.array.body.10:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 111 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 112 fin
  addi t4, t6, 1                                                        # ir inst 113 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._31.array.cond.10                               # ir inst 114 fin
.F._14su0eKxQra_new._33.array.exit.10:
  li t6, 123032
  add t6, a0, t6                                                        # ir inst 115 fin
  addi t5, t6, 0                                                        # ir inst 116 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._34.array.cond.11                               # ir inst 117 fin
.F._14su0eKxQra_new._34.array.cond.11:
  li t2, 5000
  slt t4, t6, t2                                                        # ir inst 119 fin
  bnez t4, .F._14su0eKxQra_new._35.array.body.11
  j .F._14su0eKxQra_new._36.array.exit.11                               # ir inst 120 fin
.F._14su0eKxQra_new._35.array.body.11:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 121 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 122 fin
  addi t4, t6, 1                                                        # ir inst 123 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._34.array.cond.11                               # ir inst 124 fin
.F._14su0eKxQra_new._36.array.exit.11:
  li t6, 143032
  add t6, a0, t6                                                        # ir inst 125 fin
  li t1, 256
  sw t1, 0(t6)                                                          # ir inst 126 fin
  li t6, 143036
  add t6, a0, t6                                                        # ir inst 127 fin
  li t1, 10007
  sw t1, 0(t6)                                                          # ir inst 128 fin
  li t6, 143040
  add t6, a0, t6                                                        # ir inst 129 fin
  addi t1, sp, 840
  addi t5, t1, 0                                                        # ir inst 131 fin
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_new._37.array.cond.12                               # ir inst 132 fin
.F._14su0eKxQra_new._37.array.cond.12:
  li t2, 500
  slt t3, t4, t2                                                        # ir inst 134 fin
  bnez t3, .F._14su0eKxQra_new._38.array.body.12
  j .F._14su0eKxQra_new._39.array.exit.12                               # ir inst 135 fin
.F._14su0eKxQra_new._38.array.body.12:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 136 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 137 fin
  addi t3, t4, 1                                                        # ir inst 138 fin
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_new._37.array.cond.12                               # ir inst 139 fin
.F._14su0eKxQra_new._39.array.exit.12:
  addi t5, t6, 0                                                        # ir inst 140 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._40.array.cond.13                               # ir inst 141 fin
.F._14su0eKxQra_new._40.array.cond.13:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 143 fin
  bnez t4, .F._14su0eKxQra_new._41.array.body.13
  j .F._14su0eKxQra_new._42.array.exit.13                               # ir inst 144 fin
.F._14su0eKxQra_new._41.array.body.13:
  li t1, 2000
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 145 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 2000
  addi t1, sp, 840
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 146 fin
  addi t4, t6, 1                                                        # ir inst 147 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._40.array.cond.13                               # ir inst 148 fin
.F._14su0eKxQra_new._42.array.exit.13:
  li t6, 1143040
  add t6, a0, t6                                                        # ir inst 149 fin
  addi t5, t6, 0                                                        # ir inst 150 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._43.array.cond.14                               # ir inst 151 fin
.F._14su0eKxQra_new._43.array.cond.14:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 153 fin
  bnez t4, .F._14su0eKxQra_new._44.array.body.14
  j .F._14su0eKxQra_new._45.array.exit.14                               # ir inst 154 fin
.F._14su0eKxQra_new._44.array.body.14:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 155 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 156 fin
  addi t4, t6, 1                                                        # ir inst 157 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._43.array.cond.14                               # ir inst 158 fin
.F._14su0eKxQra_new._45.array.exit.14:
  li t6, 1144064
  add t6, a0, t6                                                        # ir inst 159 fin
  li t1, 2840
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 161 fin
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_new._46.array.cond.15                               # ir inst 162 fin
.F._14su0eKxQra_new._46.array.cond.15:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 164 fin
  bnez t3, .F._14su0eKxQra_new._47.array.body.15
  j .F._14su0eKxQra_new._48.array.exit.15                               # ir inst 165 fin
.F._14su0eKxQra_new._47.array.body.15:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 166 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 167 fin
  addi t3, t4, 1                                                        # ir inst 168 fin
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_new._46.array.cond.15                               # ir inst 169 fin
.F._14su0eKxQra_new._48.array.exit.15:
  addi t5, t6, 0                                                        # ir inst 170 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._49.array.cond.16                               # ir inst 171 fin
.F._14su0eKxQra_new._49.array.cond.16:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 173 fin
  bnez t4, .F._14su0eKxQra_new._50.array.body.16
  j .F._14su0eKxQra_new._51.array.exit.16                               # ir inst 174 fin
.F._14su0eKxQra_new._50.array.body.16:
  li t1, 80
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 175 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 80
  li t1, 2840
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 176 fin
  addi t4, t6, 1                                                        # ir inst 177 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._49.array.cond.16                               # ir inst 178 fin
.F._14su0eKxQra_new._51.array.exit.16:
  li t6, 1164544
  add t6, a0, t6                                                        # ir inst 179 fin
  addi t5, t6, 0                                                        # ir inst 180 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._52.array.cond.17                               # ir inst 181 fin
.F._14su0eKxQra_new._52.array.cond.17:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 183 fin
  bnez t4, .F._14su0eKxQra_new._53.array.body.17
  j .F._14su0eKxQra_new._54.array.exit.17                               # ir inst 184 fin
.F._14su0eKxQra_new._53.array.body.17:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 185 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 186 fin
  addi t4, t6, 1                                                        # ir inst 187 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._52.array.cond.17                               # ir inst 188 fin
.F._14su0eKxQra_new._54.array.exit.17:
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 189 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 190 fin
  li t6, 1165572
  add t6, a0, t6                                                        # ir inst 191 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 192 fin
  li t6, 1165576
  add t6, a0, t6                                                        # ir inst 193 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 194 fin
  li t6, 1165580
  add t6, a0, t6                                                        # ir inst 195 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 196 fin
  li t6, 1165584
  add t6, a0, t6                                                        # ir inst 197 fin
  li t1, 2920
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 199 fin
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_new._55.array.cond.18                               # ir inst 200 fin
.F._14su0eKxQra_new._55.array.cond.18:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 202 fin
  bnez t3, .F._14su0eKxQra_new._56.array.body.18
  j .F._14su0eKxQra_new._57.array.exit.18                               # ir inst 203 fin
.F._14su0eKxQra_new._56.array.body.18:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 204 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 205 fin
  addi t3, t4, 1                                                        # ir inst 206 fin
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_new._55.array.cond.18                               # ir inst 207 fin
.F._14su0eKxQra_new._57.array.exit.18:
  addi t5, t6, 0                                                        # ir inst 208 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._58.array.cond.19                               # ir inst 209 fin
.F._14su0eKxQra_new._58.array.cond.19:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 211 fin
  bnez t4, .F._14su0eKxQra_new._59.array.body.19
  j .F._14su0eKxQra_new._60.array.exit.19                               # ir inst 212 fin
.F._14su0eKxQra_new._59.array.body.19:
  li t1, 400
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 213 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  li t1, 2920
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 214 fin
  addi t4, t6, 1                                                        # ir inst 215 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._58.array.cond.19                               # ir inst 216 fin
.F._14su0eKxQra_new._60.array.exit.19:
  li t6, 1185584
  add t6, a0, t6                                                        # ir inst 217 fin
  addi t5, t6, 0                                                        # ir inst 218 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._61.array.cond.20                               # ir inst 219 fin
.F._14su0eKxQra_new._61.array.cond.20:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 221 fin
  bnez t4, .F._14su0eKxQra_new._62.array.body.20
  j .F._14su0eKxQra_new._63.array.exit.20                               # ir inst 222 fin
.F._14su0eKxQra_new._62.array.body.20:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 223 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 224 fin
  addi t4, t6, 1                                                        # ir inst 225 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._61.array.cond.20                               # ir inst 226 fin
.F._14su0eKxQra_new._63.array.exit.20:
  li t6, 1185784
  add t6, a0, t6                                                        # ir inst 227 fin
  addi t5, t6, 0                                                        # ir inst 228 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_new._64.array.cond.21                               # ir inst 229 fin
.F._14su0eKxQra_new._64.array.cond.21:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 231 fin
  bnez t4, .F._14su0eKxQra_new._65.array.body.21
  j .F._14su0eKxQra_new._66.array.exit.21                               # ir inst 232 fin
.F._14su0eKxQra_new._65.array.body.21:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 233 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 234 fin
  addi t4, t6, 1                                                        # ir inst 235 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_new._64.array.cond.21                               # ir inst 236 fin
.F._14su0eKxQra_new._66.array.exit.21:
  li t6, 1185824
  add t6, a0, t6                                                        # ir inst 237 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 238 fin
  li t6, 1185828
  add t6, a0, t6                                                        # ir inst 239 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 240 fin
  j .F._14su0eKxQra_new.epilogue                                        # ir inst 241 fin
.F._14su0eKxQra_new.epilogue:
  ld ra, 32(sp)
  li t0, 3328
  add sp, sp, t0
  ret

.globl .F._14su0eKxQra_initialize_text
.F._14su0eKxQra_initialize_text:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._14su0eKxQra_initialize_text._0.entry.0:
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_initialize_text._1.while.cond.0                     # ir inst 3 fin
.F._14su0eKxQra_initialize_text._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._14su0eKxQra_initialize_text._2.while.body.0
  j .F._14su0eKxQra_initialize_text._3.while.exit.0                     # ir inst 6 fin
.F._14su0eKxQra_initialize_text._2.while.body.0:
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
  j .F._14su0eKxQra_initialize_text._1.while.cond.0                     # ir inst 13 fin
.F._14su0eKxQra_initialize_text._3.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._14su0eKxQra_analyze_text_statistics
  ld a0, 0(sp)
# ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._14su0eKxQra_build_suffix_array
  ld a0, 0(sp)
# ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._14su0eKxQra_compute_lcp_array
  ld a0, 0(sp)
# ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._14su0eKxQra_prepare_rabin_karp_hashes
  ld a0, 0(sp)
# ir inst 17 fin
  j .F._14su0eKxQra_initialize_text.epilogue                            # ir inst 18 fin
.F._14su0eKxQra_initialize_text.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._14su0eKxQra_add_pattern
.F._14su0eKxQra_add_pattern:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F._14su0eKxQra_add_pattern._0.entry.0:
  li t6, 60204
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 50
  slt t0, t5, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F._14su0eKxQra_add_pattern._1.if.then.0
  j .F._14su0eKxQra_add_pattern._2.if.else.0                            # ir inst 4 fin
.F._14su0eKxQra_add_pattern._1.if.then.0:
  j .F._14su0eKxQra_add_pattern.epilogue                                # ir inst 5 fin
.F._14su0eKxQra_add_pattern._2.if.else.0:
  j .F._14su0eKxQra_add_pattern._3.if.exit.0                            # ir inst 6 fin
.F._14su0eKxQra_add_pattern._3.if.exit.0:
  li t6, 60204
  add t6, a0, t6                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 9 fin
  mv t4, t5                                                             # ir inst 10 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 11 fin
  sw a1, 0(t3)                                                          # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_add_pattern._4.while.cond.0                         # ir inst 13 fin
.F._14su0eKxQra_add_pattern._4.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 15 fin
  bnez t4, .F._14su0eKxQra_add_pattern._5.while.body.0
  j .F._14su0eKxQra_add_pattern._6.while.exit.0                         # ir inst 16 fin
.F._14su0eKxQra_add_pattern._5.while.body.0:
  li t4, 20004
  add t4, a0, t4                                                        # ir inst 17 fin
  mv t3, t5                                                             # ir inst 18 fin
  li t1, 800
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 19 fin
  mv t4, t6                                                             # ir inst 20 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 21 fin
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
# ir inst 22 fin
  sw t4, 0(t3)                                                          # ir inst 23 fin
  addi t4, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_add_pattern._4.while.cond.0                         # ir inst 25 fin
.F._14su0eKxQra_add_pattern._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F._14su0eKxQra_preprocess_kmp
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F._14su0eKxQra_preprocess_boyer_moore
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F._14su0eKxQra_compute_pattern_hash
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 28 fin
  li t6, 60204
  add t6, a0, t6                                                        # ir inst 29 fin
  lw t5, 0(t6)                                                          # ir inst 30 fin
  addi t4, t5, 1                                                        # ir inst 31 fin
  sw t4, 0(t6)                                                          # ir inst 32 fin
  j .F._14su0eKxQra_add_pattern.epilogue                                # ir inst 33 fin
.F._14su0eKxQra_add_pattern.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F._14su0eKxQra_analyze_text_statistics
.F._14su0eKxQra_analyze_text_statistics:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._14su0eKxQra_analyze_text_statistics._0.entry.0:
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 1 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 2 fin
  li t6, 1165572
  add t6, a0, t6                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  li t6, 1165576
  add t6, a0, t6                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 6 fin
  li t6, 1165580
  add t6, a0, t6                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 8 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_analyze_text_statistics._1.while.cond.0             # ir inst 9 fin
.F._14su0eKxQra_analyze_text_statistics._1.while.cond.0:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 11 fin
  bnez t5, .F._14su0eKxQra_analyze_text_statistics._2.while.body.0
  j .F._14su0eKxQra_analyze_text_statistics._3.while.exit.0             # ir inst 12 fin
.F._14su0eKxQra_analyze_text_statistics._2.while.body.0:
  li t5, 1143040
  add t5, a0, t5                                                        # ir inst 13 fin
  mv t4, t6                                                             # ir inst 14 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 16 fin
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_analyze_text_statistics._1.while.cond.0             # ir inst 18 fin
.F._14su0eKxQra_analyze_text_statistics._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_analyze_text_statistics._4.while.cond.1             # ir inst 19 fin
.F._14su0eKxQra_analyze_text_statistics._4.while.cond.1:
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 21 fin
  lw t4, 0(t5)                                                          # ir inst 22 fin
  slt t5, t6, t4                                                        # ir inst 23 fin
  bnez t5, .F._14su0eKxQra_analyze_text_statistics._5.while.body.1
  j .F._14su0eKxQra_analyze_text_statistics._33.while.exit.1            # ir inst 24 fin
.F._14su0eKxQra_analyze_text_statistics._5.while.body.1:
  addi t5, a0, 0                                                        # ir inst 25 fin
  mv t4, t6                                                             # ir inst 26 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 27 fin
  lw t5, 0(t3)                                                          # ir inst 28 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 29 fin
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._6.lazy.then.0
  j .F._14su0eKxQra_analyze_text_statistics._7.lazy.else.0              # ir inst 30 fin
.F._14su0eKxQra_analyze_text_statistics._6.lazy.then.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 31 fin
# Phi connections
  j .F._14su0eKxQra_analyze_text_statistics._8.lazy.exit.0              # ir inst 32 fin
.F._14su0eKxQra_analyze_text_statistics._7.lazy.else.0:
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_analyze_text_statistics._8.lazy.exit.0              # ir inst 33 fin
.F._14su0eKxQra_analyze_text_statistics._8.lazy.exit.0:
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._9.if.then.0
  j .F._14su0eKxQra_analyze_text_statistics._10.if.else.0               # ir inst 35 fin
.F._14su0eKxQra_analyze_text_statistics._9.if.then.0:
  li t4, 1143040
  add t4, a0, t4                                                        # ir inst 36 fin
  mv t3, t5                                                             # ir inst 37 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 38 fin
  lw t4, 0(s11)                                                         # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
  sw t3, 0(s11)                                                         # ir inst 41 fin
  j .F._14su0eKxQra_analyze_text_statistics._11.if.exit.0               # ir inst 42 fin
.F._14su0eKxQra_analyze_text_statistics._10.if.else.0:
  j .F._14su0eKxQra_analyze_text_statistics._11.if.exit.0               # ir inst 43 fin
.F._14su0eKxQra_analyze_text_statistics._11.if.exit.0:
  li t2, 32
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 44 fin
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._12.lazy.then.1
  j .F._14su0eKxQra_analyze_text_statistics._13.lazy.else.1             # ir inst 45 fin
.F._14su0eKxQra_analyze_text_statistics._12.lazy.then.1:
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 46 fin
# Phi connections
  j .F._14su0eKxQra_analyze_text_statistics._14.lazy.exit.1             # ir inst 47 fin
.F._14su0eKxQra_analyze_text_statistics._13.lazy.else.1:
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_analyze_text_statistics._14.lazy.exit.1             # ir inst 48 fin
.F._14su0eKxQra_analyze_text_statistics._14.lazy.exit.1:
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._15.lazy.then.2
  j .F._14su0eKxQra_analyze_text_statistics._16.lazy.else.2             # ir inst 50 fin
.F._14su0eKxQra_analyze_text_statistics._15.lazy.then.2:
  addi t4, a0, 0                                                        # ir inst 51 fin
  addi t3, t6, -1                                                       # ir inst 52 fin
  mv s11, t3                                                            # ir inst 53 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 54 fin
  lw t4, 0(t3)                                                          # ir inst 55 fin
  li t2, 32
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 56 fin
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_analyze_text_statistics._17.lazy.exit.2             # ir inst 57 fin
.F._14su0eKxQra_analyze_text_statistics._16.lazy.else.2:
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_analyze_text_statistics._17.lazy.exit.2             # ir inst 58 fin
.F._14su0eKxQra_analyze_text_statistics._17.lazy.exit.2:
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._18.if.then.1
  j .F._14su0eKxQra_analyze_text_statistics._19.if.else.1               # ir inst 60 fin
.F._14su0eKxQra_analyze_text_statistics._18.if.then.1:
  li t4, 1165568
  add t4, a0, t4                                                        # ir inst 61 fin
  lw t3, 0(t4)                                                          # ir inst 62 fin
  addi s11, t3, 1                                                       # ir inst 63 fin
  sw s11, 0(t4)                                                         # ir inst 64 fin
  j .F._14su0eKxQra_analyze_text_statistics._20.if.exit.1               # ir inst 65 fin
.F._14su0eKxQra_analyze_text_statistics._19.if.else.1:
  j .F._14su0eKxQra_analyze_text_statistics._20.if.exit.1               # ir inst 66 fin
.F._14su0eKxQra_analyze_text_statistics._20.if.exit.1:
  li t2, 46
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 67 fin
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._21.lazy.then.3
  j .F._14su0eKxQra_analyze_text_statistics._22.lazy.else.3             # ir inst 68 fin
.F._14su0eKxQra_analyze_text_statistics._21.lazy.then.3:
# Phi connections
  li t4, 1
  j .F._14su0eKxQra_analyze_text_statistics._23.lazy.exit.3             # ir inst 69 fin
.F._14su0eKxQra_analyze_text_statistics._22.lazy.else.3:
  li t2, 33
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 70 fin
# Phi connections
  j .F._14su0eKxQra_analyze_text_statistics._23.lazy.exit.3             # ir inst 71 fin
.F._14su0eKxQra_analyze_text_statistics._23.lazy.exit.3:
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._24.lazy.then.4
  j .F._14su0eKxQra_analyze_text_statistics._25.lazy.else.4             # ir inst 73 fin
.F._14su0eKxQra_analyze_text_statistics._24.lazy.then.4:
# Phi connections
  li t4, 1
  j .F._14su0eKxQra_analyze_text_statistics._26.lazy.exit.4             # ir inst 74 fin
.F._14su0eKxQra_analyze_text_statistics._25.lazy.else.4:
  li t2, 63
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 75 fin
# Phi connections
  j .F._14su0eKxQra_analyze_text_statistics._26.lazy.exit.4             # ir inst 76 fin
.F._14su0eKxQra_analyze_text_statistics._26.lazy.exit.4:
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._27.if.then.2
  j .F._14su0eKxQra_analyze_text_statistics._28.if.else.2               # ir inst 78 fin
.F._14su0eKxQra_analyze_text_statistics._27.if.then.2:
  li t4, 1165572
  add t4, a0, t4                                                        # ir inst 79 fin
  lw t3, 0(t4)                                                          # ir inst 80 fin
  addi s11, t3, 1                                                       # ir inst 81 fin
  sw s11, 0(t4)                                                         # ir inst 82 fin
  j .F._14su0eKxQra_analyze_text_statistics._29.if.exit.2               # ir inst 83 fin
.F._14su0eKxQra_analyze_text_statistics._28.if.else.2:
  j .F._14su0eKxQra_analyze_text_statistics._29.if.exit.2               # ir inst 84 fin
.F._14su0eKxQra_analyze_text_statistics._29.if.exit.2:
  li t2, 10
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 85 fin
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._30.if.then.3
  j .F._14su0eKxQra_analyze_text_statistics._31.if.else.3               # ir inst 86 fin
.F._14su0eKxQra_analyze_text_statistics._30.if.then.3:
  li t5, 1165576
  add t5, a0, t5                                                        # ir inst 87 fin
  lw t4, 0(t5)                                                          # ir inst 88 fin
  addi t3, t4, 1                                                        # ir inst 89 fin
  sw t3, 0(t5)                                                          # ir inst 90 fin
  j .F._14su0eKxQra_analyze_text_statistics._32.if.exit.3               # ir inst 91 fin
.F._14su0eKxQra_analyze_text_statistics._31.if.else.3:
  j .F._14su0eKxQra_analyze_text_statistics._32.if.exit.3               # ir inst 92 fin
.F._14su0eKxQra_analyze_text_statistics._32.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 93 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_analyze_text_statistics._4.while.cond.1             # ir inst 94 fin
.F._14su0eKxQra_analyze_text_statistics._33.while.exit.1:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_analyze_text_statistics._34.while.cond.2            # ir inst 95 fin
.F._14su0eKxQra_analyze_text_statistics._34.while.cond.2:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 97 fin
  bnez t5, .F._14su0eKxQra_analyze_text_statistics._35.while.body.2
  j .F._14su0eKxQra_analyze_text_statistics._39.while.exit.2            # ir inst 98 fin
.F._14su0eKxQra_analyze_text_statistics._35.while.body.2:
  li t5, 1143040
  add t5, a0, t5                                                        # ir inst 99 fin
  mv t4, t6                                                             # ir inst 100 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 101 fin
  lw t5, 0(t3)                                                          # ir inst 102 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 103 fin
  bnez t4, .F._14su0eKxQra_analyze_text_statistics._36.if.then.4
  j .F._14su0eKxQra_analyze_text_statistics._37.if.else.4               # ir inst 104 fin
.F._14su0eKxQra_analyze_text_statistics._36.if.then.4:
  li t5, 1165580
  add t5, a0, t5                                                        # ir inst 105 fin
  lw t4, 0(t5)                                                          # ir inst 106 fin
  addi t3, t4, 1                                                        # ir inst 107 fin
  sw t3, 0(t5)                                                          # ir inst 108 fin
  j .F._14su0eKxQra_analyze_text_statistics._38.if.exit.4               # ir inst 109 fin
.F._14su0eKxQra_analyze_text_statistics._37.if.else.4:
  j .F._14su0eKxQra_analyze_text_statistics._38.if.exit.4               # ir inst 110 fin
.F._14su0eKxQra_analyze_text_statistics._38.if.exit.4:
  addi t5, t6, 1                                                        # ir inst 111 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_analyze_text_statistics._34.while.cond.2            # ir inst 112 fin
.F._14su0eKxQra_analyze_text_statistics._39.while.exit.2:
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 113 fin
  lw t5, 0(t6)                                                          # ir inst 114 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 115 fin
  bnez t6, .F._14su0eKxQra_analyze_text_statistics._40.lazy.then.5
  j .F._14su0eKxQra_analyze_text_statistics._41.lazy.else.5             # ir inst 116 fin
.F._14su0eKxQra_analyze_text_statistics._40.lazy.then.5:
  addi t6, a0, 0                                                        # ir inst 117 fin
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 118 fin
  lw t4, 0(t5)                                                          # ir inst 119 fin
  addi t5, t4, -1                                                       # ir inst 120 fin
  mv t4, t5                                                             # ir inst 121 fin
  slli t2, t4, 2
  add t5, t6, t2                                                        # ir inst 122 fin
  lw t6, 0(t5)                                                          # ir inst 123 fin
  li t2, 32
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 124 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_analyze_text_statistics._42.lazy.exit.5             # ir inst 125 fin
.F._14su0eKxQra_analyze_text_statistics._41.lazy.else.5:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_analyze_text_statistics._42.lazy.exit.5             # ir inst 126 fin
.F._14su0eKxQra_analyze_text_statistics._42.lazy.exit.5:
  bnez t6, .F._14su0eKxQra_analyze_text_statistics._43.if.then.5
  j .F._14su0eKxQra_analyze_text_statistics._44.if.else.5               # ir inst 128 fin
.F._14su0eKxQra_analyze_text_statistics._43.if.then.5:
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 129 fin
  lw t5, 0(t6)                                                          # ir inst 130 fin
  addi t4, t5, 1                                                        # ir inst 131 fin
  sw t4, 0(t6)                                                          # ir inst 132 fin
  j .F._14su0eKxQra_analyze_text_statistics._45.if.exit.5               # ir inst 133 fin
.F._14su0eKxQra_analyze_text_statistics._44.if.else.5:
  j .F._14su0eKxQra_analyze_text_statistics._45.if.exit.5               # ir inst 134 fin
.F._14su0eKxQra_analyze_text_statistics._45.if.exit.5:
  j .F._14su0eKxQra_analyze_text_statistics.epilogue                    # ir inst 135 fin
.F._14su0eKxQra_analyze_text_statistics.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._14su0eKxQra_build_suffix_array
.F._14su0eKxQra_build_suffix_array:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s9, 40(sp)
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F._14su0eKxQra_build_suffix_array._0.entry.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_build_suffix_array._1.while.cond.0                  # ir inst 1 fin
.F._14su0eKxQra_build_suffix_array._1.while.cond.0:
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._14su0eKxQra_build_suffix_array._2.while.body.0
  j .F._14su0eKxQra_build_suffix_array._3.while.exit.0                  # ir inst 6 fin
.F._14su0eKxQra_build_suffix_array._2.while.body.0:
  li t5, 60208
  add t5, a0, t5                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  sw t6, 0(t3)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_build_suffix_array._1.while.cond.0                  # ir inst 12 fin
.F._14su0eKxQra_build_suffix_array._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_build_suffix_array._4.while.cond.1                  # ir inst 13 fin
.F._14su0eKxQra_build_suffix_array._4.while.cond.1:
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 15 fin
  bnez t5, .F._14su0eKxQra_build_suffix_array._5.while.body.1
  j .F._14su0eKxQra_build_suffix_array._12.while.exit.1                 # ir inst 16 fin
.F._14su0eKxQra_build_suffix_array._5.while.body.1:
# Phi connections
  li t5, 0
  li t6, 1
  j .F._14su0eKxQra_build_suffix_array._6.while.cond.2                  # ir inst 17 fin
.F._14su0eKxQra_build_suffix_array._6.while.cond.2:
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 20 fin
  lw t3, 0(t4)                                                          # ir inst 21 fin
  addi t4, t3, -1                                                       # ir inst 22 fin
  slt t3, t5, t4                                                        # ir inst 23 fin
  bnez t3, .F._14su0eKxQra_build_suffix_array._7.while.body.2
  j .F._14su0eKxQra_build_suffix_array._11.while.exit.2                 # ir inst 24 fin
.F._14su0eKxQra_build_suffix_array._7.while.body.2:
  li t4, 60208
  add t4, a0, t4                                                        # ir inst 25 fin
  mv t3, t5                                                             # ir inst 26 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 27 fin
  lw t4, 0(s11)                                                         # ir inst 28 fin
  li t3, 60208
  add t3, a0, t3                                                        # ir inst 29 fin
  addi s11, t5, 1                                                       # ir inst 30 fin
  mv s10, s11                                                           # ir inst 31 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 32 fin
  lw t3, 0(s11)                                                         # ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t3
  mv a1, t4
  call .F._14su0eKxQra_compare_suffixes
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 34 fin
  li t2, 0
  slt t4, t2, s11                                                       # ir inst 35 fin
  bnez t4, .F._14su0eKxQra_build_suffix_array._8.if.then.0
  j .F._14su0eKxQra_build_suffix_array._9.if.else.0                     # ir inst 36 fin
.F._14su0eKxQra_build_suffix_array._8.if.then.0:
  li t4, 60208
  add t4, a0, t4                                                        # ir inst 37 fin
  mv t3, t5                                                             # ir inst 38 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 39 fin
  lw t4, 0(s11)                                                         # ir inst 40 fin
  li t3, 60208
  add t3, a0, t3                                                        # ir inst 41 fin
  mv s11, t5                                                            # ir inst 42 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 43 fin
  li t3, 60208
  add t3, a0, t3                                                        # ir inst 44 fin
  addi s11, t5, 1                                                       # ir inst 45 fin
  mv s9, s11                                                            # ir inst 46 fin
  slli t2, s9, 2
  add s11, t3, t2                                                       # ir inst 47 fin
  lw t3, 0(s11)                                                         # ir inst 48 fin
  sw t3, 0(s10)                                                         # ir inst 49 fin
  li t3, 60208
  add t3, a0, t3                                                        # ir inst 50 fin
  addi s11, t5, 1                                                       # ir inst 51 fin
  mv s10, s11                                                           # ir inst 52 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 53 fin
  sw t4, 0(s11)                                                         # ir inst 54 fin
# Phi connections
  li t4, 0
  j .F._14su0eKxQra_build_suffix_array._10.if.exit.0                    # ir inst 55 fin
.F._14su0eKxQra_build_suffix_array._9.if.else.0:
# Phi connections
  mv t4, t6
  j .F._14su0eKxQra_build_suffix_array._10.if.exit.0                    # ir inst 56 fin
.F._14su0eKxQra_build_suffix_array._10.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 58 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F._14su0eKxQra_build_suffix_array._6.while.cond.2                  # ir inst 59 fin
.F._14su0eKxQra_build_suffix_array._11.while.exit.2:
# Phi connections
  j .F._14su0eKxQra_build_suffix_array._4.while.cond.1                  # ir inst 60 fin
.F._14su0eKxQra_build_suffix_array._12.while.exit.1:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_build_suffix_array._13.while.cond.3                 # ir inst 61 fin
.F._14su0eKxQra_build_suffix_array._13.while.cond.3:
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 63 fin
  lw t4, 0(t5)                                                          # ir inst 64 fin
  slt t5, t6, t4                                                        # ir inst 65 fin
  bnez t5, .F._14su0eKxQra_build_suffix_array._14.while.body.3
  j .F._14su0eKxQra_build_suffix_array._15.while.exit.3                 # ir inst 66 fin
.F._14su0eKxQra_build_suffix_array._14.while.body.3:
  li t5, 100208
  add t5, a0, t5                                                        # ir inst 67 fin
  li t4, 60208
  add t4, a0, t4                                                        # ir inst 68 fin
  mv t3, t6                                                             # ir inst 69 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 70 fin
  lw t4, 0(s11)                                                         # ir inst 71 fin
  mv t3, t4                                                             # ir inst 72 fin
  slli t2, t3, 2
  add t4, t5, t2                                                        # ir inst 73 fin
  sw t6, 0(t4)                                                          # ir inst 74 fin
  addi t5, t6, 1                                                        # ir inst 75 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_build_suffix_array._13.while.cond.3                 # ir inst 76 fin
.F._14su0eKxQra_build_suffix_array._15.while.exit.3:
  j .F._14su0eKxQra_build_suffix_array.epilogue                         # ir inst 77 fin
.F._14su0eKxQra_build_suffix_array.epilogue:
  ld ra, 64(sp)
  ld s9, 40(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F._14su0eKxQra_compare_suffixes
.F._14su0eKxQra_compare_suffixes:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._14su0eKxQra_compare_suffixes._0.entry.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_compare_suffixes._1.while.cond.0                    # ir inst 1 fin
.F._14su0eKxQra_compare_suffixes._1.while.cond.0:
  add t5, a1, t6                                                        # ir inst 3 fin
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  slt t4, t5, t3                                                        # ir inst 6 fin
  bnez t4, .F._14su0eKxQra_compare_suffixes._2.lazy.then.0
  j .F._14su0eKxQra_compare_suffixes._3.lazy.else.0                     # ir inst 7 fin
.F._14su0eKxQra_compare_suffixes._2.lazy.then.0:
  add t5, a2, t6                                                        # ir inst 8 fin
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 9 fin
  lw t3, 0(t4)                                                          # ir inst 10 fin
  slt t4, t5, t3                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_compare_suffixes._4.lazy.exit.0                     # ir inst 12 fin
.F._14su0eKxQra_compare_suffixes._3.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_compare_suffixes._4.lazy.exit.0                     # ir inst 13 fin
.F._14su0eKxQra_compare_suffixes._4.lazy.exit.0:
  bnez t5, .F._14su0eKxQra_compare_suffixes._5.while.body.0
  j .F._14su0eKxQra_compare_suffixes._12.while.exit.0                   # ir inst 15 fin
.F._14su0eKxQra_compare_suffixes._5.while.body.0:
  li t5, 1185824
  add t5, a0, t5                                                        # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  addi t3, t4, 1                                                        # ir inst 18 fin
  sw t3, 0(t5)                                                          # ir inst 19 fin
  addi t5, a0, 0                                                        # ir inst 20 fin
  add t4, a1, t6                                                        # ir inst 21 fin
  mv t3, t4                                                             # ir inst 22 fin
  slli t2, t3, 2
  add t4, t5, t2                                                        # ir inst 23 fin
  lw t5, 0(t4)                                                          # ir inst 24 fin
  addi t4, a0, 0                                                        # ir inst 25 fin
  add t3, a2, t6                                                        # ir inst 26 fin
  mv s11, t3                                                            # ir inst 27 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 28 fin
  lw t4, 0(t3)                                                          # ir inst 29 fin
  slt t3, t5, t4                                                        # ir inst 30 fin
  bnez t3, .F._14su0eKxQra_compare_suffixes._6.if.then.0
  j .F._14su0eKxQra_compare_suffixes._7.if.else.0                       # ir inst 31 fin
.F._14su0eKxQra_compare_suffixes._6.if.then.0:
  li a0, -1
  j .F._14su0eKxQra_compare_suffixes.epilogue                           # ir inst 32 fin
.F._14su0eKxQra_compare_suffixes._7.if.else.0:
  addi t5, a0, 0                                                        # ir inst 33 fin
  add t4, a1, t6                                                        # ir inst 34 fin
  mv t3, t4                                                             # ir inst 35 fin
  slli t2, t3, 2
  add t4, t5, t2                                                        # ir inst 36 fin
  lw t5, 0(t4)                                                          # ir inst 37 fin
  addi t4, a0, 0                                                        # ir inst 38 fin
  add t3, a2, t6                                                        # ir inst 39 fin
  mv s11, t3                                                            # ir inst 40 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 41 fin
  lw t4, 0(t3)                                                          # ir inst 42 fin
  slt t3, t4, t5                                                        # ir inst 43 fin
  bnez t3, .F._14su0eKxQra_compare_suffixes._8.if.then.1
  j .F._14su0eKxQra_compare_suffixes._9.if.else.1                       # ir inst 44 fin
.F._14su0eKxQra_compare_suffixes._8.if.then.1:
  li a0, 1
  j .F._14su0eKxQra_compare_suffixes.epilogue                           # ir inst 45 fin
.F._14su0eKxQra_compare_suffixes._9.if.else.1:
  j .F._14su0eKxQra_compare_suffixes._10.if.exit.1                      # ir inst 46 fin
.F._14su0eKxQra_compare_suffixes._10.if.exit.1:
  j .F._14su0eKxQra_compare_suffixes._11.if.exit.0                      # ir inst 47 fin
.F._14su0eKxQra_compare_suffixes._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_compare_suffixes._1.while.cond.0                    # ir inst 49 fin
.F._14su0eKxQra_compare_suffixes._12.while.exit.0:
  add t5, a1, t6                                                        # ir inst 50 fin
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 51 fin
  lw t3, 0(t4)                                                          # ir inst 52 fin
  slt t0, t5, t3
  xori t4, t0, 1                                                        # ir inst 53 fin
  bnez t4, .F._14su0eKxQra_compare_suffixes._13.lazy.then.1
  j .F._14su0eKxQra_compare_suffixes._14.lazy.else.1                    # ir inst 54 fin
.F._14su0eKxQra_compare_suffixes._13.lazy.then.1:
  add t5, a2, t6                                                        # ir inst 55 fin
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 56 fin
  lw t3, 0(t4)                                                          # ir inst 57 fin
  slt t0, t5, t3
  xori t4, t0, 1                                                        # ir inst 58 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_compare_suffixes._15.lazy.exit.1                    # ir inst 59 fin
.F._14su0eKxQra_compare_suffixes._14.lazy.else.1:
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_compare_suffixes._15.lazy.exit.1                    # ir inst 60 fin
.F._14su0eKxQra_compare_suffixes._15.lazy.exit.1:
  bnez t5, .F._14su0eKxQra_compare_suffixes._16.if.then.2
  j .F._14su0eKxQra_compare_suffixes._17.if.else.2                      # ir inst 62 fin
.F._14su0eKxQra_compare_suffixes._16.if.then.2:
  li a0, 0
  j .F._14su0eKxQra_compare_suffixes.epilogue                           # ir inst 63 fin
.F._14su0eKxQra_compare_suffixes._17.if.else.2:
  add t5, a1, t6                                                        # ir inst 64 fin
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 65 fin
  lw t4, 0(t6)                                                          # ir inst 66 fin
  slt t0, t5, t4
  xori t6, t0, 1                                                        # ir inst 67 fin
  bnez t6, .F._14su0eKxQra_compare_suffixes._18.if.then.3
  j .F._14su0eKxQra_compare_suffixes._19.if.else.3                      # ir inst 68 fin
.F._14su0eKxQra_compare_suffixes._18.if.then.3:
  li a0, -1
  j .F._14su0eKxQra_compare_suffixes.epilogue                           # ir inst 69 fin
.F._14su0eKxQra_compare_suffixes._19.if.else.3:
  li a0, 1
  j .F._14su0eKxQra_compare_suffixes.epilogue                           # ir inst 70 fin
.F._14su0eKxQra_compare_suffixes._20.if.exit.3:
  j .F._14su0eKxQra_compare_suffixes._21.if.exit.2                      # ir inst 71 fin
.F._14su0eKxQra_compare_suffixes._21.if.exit.2:
.F._14su0eKxQra_compare_suffixes.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._14su0eKxQra_compute_lcp_array
.F._14su0eKxQra_compute_lcp_array:
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
.F._14su0eKxQra_compute_lcp_array._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._14su0eKxQra_compute_lcp_array._1.while.cond.0                   # ir inst 1 fin
.F._14su0eKxQra_compute_lcp_array._1.while.cond.0:
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  slt t4, t6, t3                                                        # ir inst 6 fin
  bnez t4, .F._14su0eKxQra_compute_lcp_array._2.while.body.0
  j .F._14su0eKxQra_compute_lcp_array._18.while.exit.0                  # ir inst 7 fin
.F._14su0eKxQra_compute_lcp_array._2.while.body.0:
  li t4, 100208
  add t4, a0, t4                                                        # ir inst 8 fin
  mv t3, t6                                                             # ir inst 9 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 10 fin
  lw t4, 0(s11)                                                         # ir inst 11 fin
  li t3, 20000
  add t3, a0, t3                                                        # ir inst 12 fin
  lw s11, 0(t3)                                                         # ir inst 13 fin
  addi t3, s11, -1                                                      # ir inst 14 fin
  xor t0, t4, t3
  sltiu s11, t0, 1                                                      # ir inst 15 fin
  bnez s11, .F._14su0eKxQra_compute_lcp_array._3.if.then.0
  j .F._14su0eKxQra_compute_lcp_array._4.if.else.0                      # ir inst 16 fin
.F._14su0eKxQra_compute_lcp_array._3.if.then.0:
  addi t4, t6, 1                                                        # ir inst 17 fin
# Phi connections
  li t5, 0
  mv t6, t4
  j .F._14su0eKxQra_compute_lcp_array._1.while.cond.0                   # ir inst 18 fin
.F._14su0eKxQra_compute_lcp_array._4.if.else.0:
  j .F._14su0eKxQra_compute_lcp_array._5.if.exit.0                      # ir inst 19 fin
.F._14su0eKxQra_compute_lcp_array._5.if.exit.0:
  li t4, 60208
  add t4, a0, t4                                                        # ir inst 20 fin
  li t3, 100208
  add t3, a0, t3                                                        # ir inst 21 fin
  mv s11, t6                                                            # ir inst 22 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 23 fin
  lw t3, 0(s10)                                                         # ir inst 24 fin
  addi s11, t3, 1                                                       # ir inst 25 fin
  mv t3, s11                                                            # ir inst 26 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 27 fin
  lw t4, 0(s11)                                                         # ir inst 28 fin
# Phi connections
  j .F._14su0eKxQra_compute_lcp_array._6.while.cond.1                   # ir inst 29 fin
.F._14su0eKxQra_compute_lcp_array._6.while.cond.1:
  add t3, t6, t5                                                        # ir inst 31 fin
  li s11, 20000
  add s11, a0, s11                                                      # ir inst 32 fin
  lw s10, 0(s11)                                                        # ir inst 33 fin
  slt s11, t3, s10                                                      # ir inst 34 fin
  bnez s11, .F._14su0eKxQra_compute_lcp_array._7.lazy.then.0
  j .F._14su0eKxQra_compute_lcp_array._8.lazy.else.0                    # ir inst 35 fin
.F._14su0eKxQra_compute_lcp_array._7.lazy.then.0:
  add t3, t4, t5                                                        # ir inst 36 fin
  li s11, 20000
  add s11, a0, s11                                                      # ir inst 37 fin
  lw s10, 0(s11)                                                        # ir inst 38 fin
  slt s11, t3, s10                                                      # ir inst 39 fin
# Phi connections
  mv t3, s11
  j .F._14su0eKxQra_compute_lcp_array._9.lazy.exit.0                    # ir inst 40 fin
.F._14su0eKxQra_compute_lcp_array._8.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._14su0eKxQra_compute_lcp_array._9.lazy.exit.0                    # ir inst 41 fin
.F._14su0eKxQra_compute_lcp_array._9.lazy.exit.0:
  bnez t3, .F._14su0eKxQra_compute_lcp_array._10.lazy.then.1
  j .F._14su0eKxQra_compute_lcp_array._11.lazy.else.1                   # ir inst 43 fin
.F._14su0eKxQra_compute_lcp_array._10.lazy.then.1:
  addi t3, a0, 0                                                        # ir inst 44 fin
  add s11, t6, t5                                                       # ir inst 45 fin
  mv s10, s11                                                           # ir inst 46 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 47 fin
  lw t3, 0(s11)                                                         # ir inst 48 fin
  addi s11, a0, 0                                                       # ir inst 49 fin
  add s10, t4, t5                                                       # ir inst 50 fin
  mv s9, s10                                                            # ir inst 51 fin
  slli t2, s9, 2
  add s10, s11, t2                                                      # ir inst 52 fin
  lw s11, 0(s10)                                                        # ir inst 53 fin
  xor t0, t3, s11
  sltiu s10, t0, 1                                                      # ir inst 54 fin
# Phi connections
  mv t3, s10
  j .F._14su0eKxQra_compute_lcp_array._12.lazy.exit.1                   # ir inst 55 fin
.F._14su0eKxQra_compute_lcp_array._11.lazy.else.1:
# Phi connections
  li t3, 0
  j .F._14su0eKxQra_compute_lcp_array._12.lazy.exit.1                   # ir inst 56 fin
.F._14su0eKxQra_compute_lcp_array._12.lazy.exit.1:
  bnez t3, .F._14su0eKxQra_compute_lcp_array._13.while.body.1
  j .F._14su0eKxQra_compute_lcp_array._14.while.exit.1                  # ir inst 58 fin
.F._14su0eKxQra_compute_lcp_array._13.while.body.1:
  addi t3, t5, 1                                                        # ir inst 59 fin
# Phi connections
  mv t5, t3
  j .F._14su0eKxQra_compute_lcp_array._6.while.cond.1                   # ir inst 60 fin
.F._14su0eKxQra_compute_lcp_array._14.while.exit.1:
  li t4, 80208
  add t4, a0, t4                                                        # ir inst 61 fin
  li t3, 100208
  add t3, a0, t3                                                        # ir inst 62 fin
  mv s11, t6                                                            # ir inst 63 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 64 fin
  lw t3, 0(s10)                                                         # ir inst 65 fin
  mv s11, t3                                                            # ir inst 66 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 67 fin
  sw t5, 0(t3)                                                          # ir inst 68 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 69 fin
  bnez t4, .F._14su0eKxQra_compute_lcp_array._15.if.then.1
  j .F._14su0eKxQra_compute_lcp_array._16.if.else.1                     # ir inst 70 fin
.F._14su0eKxQra_compute_lcp_array._15.if.then.1:
  addi t4, t5, -1                                                       # ir inst 71 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_compute_lcp_array._17.if.exit.1                     # ir inst 72 fin
.F._14su0eKxQra_compute_lcp_array._16.if.else.1:
# Phi connections
  j .F._14su0eKxQra_compute_lcp_array._17.if.exit.1                     # ir inst 73 fin
.F._14su0eKxQra_compute_lcp_array._17.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 75 fin
# Phi connections
  mv t6, t4
  j .F._14su0eKxQra_compute_lcp_array._1.while.cond.0                   # ir inst 76 fin
.F._14su0eKxQra_compute_lcp_array._18.while.exit.0:
  j .F._14su0eKxQra_compute_lcp_array.epilogue                          # ir inst 77 fin
.F._14su0eKxQra_compute_lcp_array.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_preprocess_kmp
.F._14su0eKxQra_preprocess_kmp:
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
.F._14su0eKxQra_preprocess_kmp._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  li t5, 120208
  add t5, a0, t5                                                        # ir inst 5 fin
  addi t4, t5, 0                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
# Phi connections
  li t4, 0
  li t5, 1
  j .F._14su0eKxQra_preprocess_kmp._1.while.cond.0                      # ir inst 8 fin
.F._14su0eKxQra_preprocess_kmp._1.while.cond.0:
  slt t3, t5, t6                                                        # ir inst 11 fin
  bnez t3, .F._14su0eKxQra_preprocess_kmp._2.while.body.0
  j .F._14su0eKxQra_preprocess_kmp._9.while.exit.0                      # ir inst 12 fin
.F._14su0eKxQra_preprocess_kmp._2.while.body.0:
  li t3, 20004
  add t3, a0, t3                                                        # ir inst 13 fin
  mv s11, a1                                                            # ir inst 14 fin
  li t1, 800
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 15 fin
  mv t3, t5                                                             # ir inst 16 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 17 fin
  lw t3, 0(s11)                                                         # ir inst 18 fin
  li s11, 20004
  add s11, a0, s11                                                      # ir inst 19 fin
  mv s10, a1                                                            # ir inst 20 fin
  li t1, 800
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 21 fin
  mv s11, t4                                                            # ir inst 22 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 23 fin
  lw s11, 0(s10)                                                        # ir inst 24 fin
  xor t0, t3, s11
  sltiu s10, t0, 1                                                      # ir inst 25 fin
  bnez s10, .F._14su0eKxQra_preprocess_kmp._3.if.then.0
  j .F._14su0eKxQra_preprocess_kmp._4.if.else.0                         # ir inst 26 fin
.F._14su0eKxQra_preprocess_kmp._3.if.then.0:
  addi t3, t4, 1                                                        # ir inst 27 fin
  li s11, 120208
  add s11, a0, s11                                                      # ir inst 28 fin
  mv s10, t5                                                            # ir inst 29 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 30 fin
  sw t3, 0(s9)                                                          # ir inst 31 fin
  addi s11, t5, 1                                                       # ir inst 32 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F._14su0eKxQra_preprocess_kmp._8.if.exit.0                         # ir inst 33 fin
.F._14su0eKxQra_preprocess_kmp._4.if.else.0:
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 34 fin
  bnez t3, .F._14su0eKxQra_preprocess_kmp._5.if.then.1
  j .F._14su0eKxQra_preprocess_kmp._6.if.else.1                         # ir inst 35 fin
.F._14su0eKxQra_preprocess_kmp._5.if.then.1:
  li t3, 120208
  add t3, a0, t3                                                        # ir inst 36 fin
  addi s11, t4, -1                                                      # ir inst 37 fin
  mv s10, s11                                                           # ir inst 38 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 39 fin
  lw t3, 0(s11)                                                         # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_preprocess_kmp._7.if.exit.1                         # ir inst 41 fin
.F._14su0eKxQra_preprocess_kmp._6.if.else.1:
  li t3, 120208
  add t3, a0, t3                                                        # ir inst 42 fin
  mv s11, t5                                                            # ir inst 43 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 44 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 45 fin
  addi t3, t5, 1                                                        # ir inst 46 fin
# Phi connections
  mv t5, t3
  j .F._14su0eKxQra_preprocess_kmp._7.if.exit.1                         # ir inst 47 fin
.F._14su0eKxQra_preprocess_kmp._7.if.exit.1:
# Phi connections
  j .F._14su0eKxQra_preprocess_kmp._8.if.exit.0                         # ir inst 50 fin
.F._14su0eKxQra_preprocess_kmp._8.if.exit.0:
# Phi connections
  j .F._14su0eKxQra_preprocess_kmp._1.while.cond.0                      # ir inst 53 fin
.F._14su0eKxQra_preprocess_kmp._9.while.exit.0:
  j .F._14su0eKxQra_preprocess_kmp.epilogue                             # ir inst 54 fin
.F._14su0eKxQra_preprocess_kmp.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_preprocess_boyer_moore
.F._14su0eKxQra_preprocess_boyer_moore:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._14su0eKxQra_preprocess_boyer_moore._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_preprocess_boyer_moore._1.while.cond.0              # ir inst 5 fin
.F._14su0eKxQra_preprocess_boyer_moore._1.while.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F._14su0eKxQra_preprocess_boyer_moore._2.while.body.0
  j .F._14su0eKxQra_preprocess_boyer_moore._3.while.exit.0              # ir inst 8 fin
.F._14su0eKxQra_preprocess_boyer_moore._2.while.body.0:
  li t4, 121008
  add t4, a0, t4                                                        # ir inst 9 fin
  mv t3, t5                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 11 fin
  li t1, -1
  sw t1, 0(s11)                                                         # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_preprocess_boyer_moore._1.while.cond.0              # ir inst 14 fin
.F._14su0eKxQra_preprocess_boyer_moore._3.while.exit.0:
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_preprocess_boyer_moore._4.while.cond.1              # ir inst 15 fin
.F._14su0eKxQra_preprocess_boyer_moore._4.while.cond.1:
  slt t4, t5, t6                                                        # ir inst 17 fin
  bnez t4, .F._14su0eKxQra_preprocess_boyer_moore._5.while.body.1
  j .F._14su0eKxQra_preprocess_boyer_moore._12.while.exit.1             # ir inst 18 fin
.F._14su0eKxQra_preprocess_boyer_moore._5.while.body.1:
  li t4, 20004
  add t4, a0, t4                                                        # ir inst 19 fin
  mv t3, a1                                                             # ir inst 20 fin
  li t1, 800
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 21 fin
  mv t4, t5                                                             # ir inst 22 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 23 fin
  lw t4, 0(t3)                                                          # ir inst 24 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 25 fin
  bnez t3, .F._14su0eKxQra_preprocess_boyer_moore._6.lazy.then.0
  j .F._14su0eKxQra_preprocess_boyer_moore._7.lazy.else.0               # ir inst 26 fin
.F._14su0eKxQra_preprocess_boyer_moore._6.lazy.then.0:
  li t2, 256
  slt t3, t4, t2                                                        # ir inst 27 fin
# Phi connections
  j .F._14su0eKxQra_preprocess_boyer_moore._8.lazy.exit.0               # ir inst 28 fin
.F._14su0eKxQra_preprocess_boyer_moore._7.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._14su0eKxQra_preprocess_boyer_moore._8.lazy.exit.0               # ir inst 29 fin
.F._14su0eKxQra_preprocess_boyer_moore._8.lazy.exit.0:
  bnez t3, .F._14su0eKxQra_preprocess_boyer_moore._9.if.then.0
  j .F._14su0eKxQra_preprocess_boyer_moore._10.if.else.0                # ir inst 31 fin
.F._14su0eKxQra_preprocess_boyer_moore._9.if.then.0:
  li t3, 121008
  add t3, a0, t3                                                        # ir inst 32 fin
  mv s11, t4                                                            # ir inst 33 fin
  slli t2, s11, 2
  add t4, t3, t2                                                        # ir inst 34 fin
  sw t5, 0(t4)                                                          # ir inst 35 fin
  j .F._14su0eKxQra_preprocess_boyer_moore._11.if.exit.0                # ir inst 36 fin
.F._14su0eKxQra_preprocess_boyer_moore._10.if.else.0:
  j .F._14su0eKxQra_preprocess_boyer_moore._11.if.exit.0                # ir inst 37 fin
.F._14su0eKxQra_preprocess_boyer_moore._11.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_preprocess_boyer_moore._4.while.cond.1              # ir inst 39 fin
.F._14su0eKxQra_preprocess_boyer_moore._12.while.exit.1:
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_preprocess_boyer_moore._13.while.cond.2             # ir inst 40 fin
.F._14su0eKxQra_preprocess_boyer_moore._13.while.cond.2:
  slt t4, t5, t6                                                        # ir inst 42 fin
  bnez t4, .F._14su0eKxQra_preprocess_boyer_moore._14.while.body.2
  j .F._14su0eKxQra_preprocess_boyer_moore._15.while.exit.2             # ir inst 43 fin
.F._14su0eKxQra_preprocess_boyer_moore._14.while.body.2:
  li t4, 122032
  add t4, a0, t4                                                        # ir inst 44 fin
  mv t3, t5                                                             # ir inst 45 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 46 fin
  sw t6, 0(s11)                                                         # ir inst 47 fin
  addi t4, t5, 1                                                        # ir inst 48 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_preprocess_boyer_moore._13.while.cond.2             # ir inst 49 fin
.F._14su0eKxQra_preprocess_boyer_moore._15.while.exit.2:
  j .F._14su0eKxQra_preprocess_boyer_moore.epilogue                     # ir inst 50 fin
.F._14su0eKxQra_preprocess_boyer_moore.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._14su0eKxQra_compute_pattern_hash
.F._14su0eKxQra_compute_pattern_hash:
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
.F._14su0eKxQra_compute_pattern_hash._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 1
  j .F._14su0eKxQra_compute_pattern_hash._1.while.cond.0                # ir inst 5 fin
.F._14su0eKxQra_compute_pattern_hash._1.while.cond.0:
  slt s11, t3, t6                                                       # ir inst 9 fin
  bnez s11, .F._14su0eKxQra_compute_pattern_hash._2.while.body.0
  j .F._14su0eKxQra_compute_pattern_hash._6.while.exit.0                # ir inst 10 fin
.F._14su0eKxQra_compute_pattern_hash._2.while.body.0:
  li s11, 20004
  add s11, a0, s11                                                      # ir inst 11 fin
  mv s10, a1                                                            # ir inst 12 fin
  li t1, 800
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 13 fin
  mv s11, t3                                                            # ir inst 14 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 15 fin
  lw s11, 0(s10)                                                        # ir inst 16 fin
  mul s10, s11, t5                                                      # ir inst 17 fin
  li s11, 143036
  add s11, a0, s11                                                      # ir inst 18 fin
  lw s9, 0(s11)                                                         # ir inst 19 fin
  rem s11, s10, s9                                                      # ir inst 20 fin
  add s10, t4, s11                                                      # ir inst 21 fin
  li s11, 143036
  add s11, a0, s11                                                      # ir inst 22 fin
  lw s9, 0(s11)                                                         # ir inst 23 fin
  rem s11, s10, s9                                                      # ir inst 24 fin
  addi s10, t6, -1                                                      # ir inst 25 fin
  slt s9, t3, s10                                                       # ir inst 26 fin
  bnez s9, .F._14su0eKxQra_compute_pattern_hash._3.if.then.0
  j .F._14su0eKxQra_compute_pattern_hash._4.if.else.0                   # ir inst 27 fin
.F._14su0eKxQra_compute_pattern_hash._3.if.then.0:
  li s10, 143032
  add s10, a0, s10                                                      # ir inst 28 fin
  lw s9, 0(s10)                                                         # ir inst 29 fin
  mul s10, t5, s9                                                       # ir inst 30 fin
  li s9, 143036
  add s9, a0, s9                                                        # ir inst 31 fin
  lw s8, 0(s9)                                                          # ir inst 32 fin
  rem s9, s10, s8                                                       # ir inst 33 fin
# Phi connections
  mv t5, s9
  j .F._14su0eKxQra_compute_pattern_hash._5.if.exit.0                   # ir inst 34 fin
.F._14su0eKxQra_compute_pattern_hash._4.if.else.0:
# Phi connections
  j .F._14su0eKxQra_compute_pattern_hash._5.if.exit.0                   # ir inst 35 fin
.F._14su0eKxQra_compute_pattern_hash._5.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 37 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F._14su0eKxQra_compute_pattern_hash._1.while.cond.0                # ir inst 38 fin
.F._14su0eKxQra_compute_pattern_hash._6.while.exit.0:
  li t6, 122832
  add t6, a0, t6                                                        # ir inst 39 fin
  mv t5, a1                                                             # ir inst 40 fin
  slli t2, t5, 2
  add t3, t6, t2                                                        # ir inst 41 fin
  sw t4, 0(t3)                                                          # ir inst 42 fin
  j .F._14su0eKxQra_compute_pattern_hash.epilogue                       # ir inst 43 fin
.F._14su0eKxQra_compute_pattern_hash.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_prepare_rabin_karp_hashes
.F._14su0eKxQra_prepare_rabin_karp_hashes:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._14su0eKxQra_prepare_rabin_karp_hashes._0.entry.0:
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F._14su0eKxQra_prepare_rabin_karp_hashes._1.if.then.0
  j .F._14su0eKxQra_prepare_rabin_karp_hashes._2.if.else.0              # ir inst 4 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes._1.if.then.0:
  j .F._14su0eKxQra_prepare_rabin_karp_hashes.epilogue                  # ir inst 5 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes._2.if.else.0:
  j .F._14su0eKxQra_prepare_rabin_karp_hashes._3.if.exit.0              # ir inst 6 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes._3.if.exit.0:
  li t6, 123032
  add t6, a0, t6                                                        # ir inst 7 fin
  addi t5, t6, 0                                                        # ir inst 8 fin
  addi t6, a0, 0                                                        # ir inst 9 fin
  addi t4, t6, 0                                                        # ir inst 10 fin
  lw t6, 0(t4)                                                          # ir inst 11 fin
  li t4, 143036
  add t4, a0, t4                                                        # ir inst 12 fin
  lw t3, 0(t4)                                                          # ir inst 13 fin
  rem t4, t6, t3                                                        # ir inst 14 fin
  sw t4, 0(t5)                                                          # ir inst 15 fin
# Phi connections
  li t6, 1
  j .F._14su0eKxQra_prepare_rabin_karp_hashes._4.while.cond.0           # ir inst 16 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes._4.while.cond.0:
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  slt t5, t6, t4                                                        # ir inst 20 fin
  bnez t5, .F._14su0eKxQra_prepare_rabin_karp_hashes._5.while.body.0
  j .F._14su0eKxQra_prepare_rabin_karp_hashes._6.while.exit.0           # ir inst 21 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes._5.while.body.0:
  li t5, 123032
  add t5, a0, t5                                                        # ir inst 22 fin
  mv t4, t6                                                             # ir inst 23 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 24 fin
  li t5, 123032
  add t5, a0, t5                                                        # ir inst 25 fin
  addi t4, t6, -1                                                       # ir inst 26 fin
  mv s11, t4                                                            # ir inst 27 fin
  slli t2, s11, 2
  add t4, t5, t2                                                        # ir inst 28 fin
  lw t5, 0(t4)                                                          # ir inst 29 fin
  li t4, 143036
  add t4, a0, t4                                                        # ir inst 30 fin
  lw s11, 0(t4)                                                         # ir inst 31 fin
  rem t4, t5, s11                                                       # ir inst 32 fin
  li t5, 143032
  add t5, a0, t5                                                        # ir inst 33 fin
  lw s11, 0(t5)                                                         # ir inst 34 fin
  mul t5, t4, s11                                                       # ir inst 35 fin
  li t4, 143036
  add t4, a0, t4                                                        # ir inst 36 fin
  lw s11, 0(t4)                                                         # ir inst 37 fin
  rem t4, t5, s11                                                       # ir inst 38 fin
  addi t5, a0, 0                                                        # ir inst 39 fin
  mv s11, t6                                                            # ir inst 40 fin
  slli t2, s11, 2
  add s10, t5, t2                                                       # ir inst 41 fin
  lw t5, 0(s10)                                                         # ir inst 42 fin
  li s11, 143036
  add s11, a0, s11                                                      # ir inst 43 fin
  lw s10, 0(s11)                                                        # ir inst 44 fin
  rem s11, t5, s10                                                      # ir inst 45 fin
  add t5, t4, s11                                                       # ir inst 46 fin
  li t4, 143036
  add t4, a0, t4                                                        # ir inst 47 fin
  lw s11, 0(t4)                                                         # ir inst 48 fin
  rem t4, t5, s11                                                       # ir inst 49 fin
  sw t4, 0(t3)                                                          # ir inst 50 fin
  addi t5, t6, 1                                                        # ir inst 51 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_prepare_rabin_karp_hashes._4.while.cond.0           # ir inst 52 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes._6.while.exit.0:
  j .F._14su0eKxQra_prepare_rabin_karp_hashes.epilogue                  # ir inst 53 fin
.F._14su0eKxQra_prepare_rabin_karp_hashes.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._14su0eKxQra_kmp_search
.F._14su0eKxQra_kmp_search:
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
.F._14su0eKxQra_kmp_search._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  li t5, 1185584
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, a1                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 8 fin
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  slt t5, t4, t6                                                        # ir inst 11 fin
  bnez t5, .F._14su0eKxQra_kmp_search._1.if.then.0
  j .F._14su0eKxQra_kmp_search._2.if.else.0                             # ir inst 12 fin
.F._14su0eKxQra_kmp_search._1.if.then.0:
  j .F._14su0eKxQra_kmp_search.epilogue                                 # ir inst 13 fin
.F._14su0eKxQra_kmp_search._2.if.else.0:
  j .F._14su0eKxQra_kmp_search._3.if.exit.0                             # ir inst 14 fin
.F._14su0eKxQra_kmp_search._3.if.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  j .F._14su0eKxQra_kmp_search._4.while.cond.0                          # ir inst 15 fin
.F._14su0eKxQra_kmp_search._4.while.cond.0:
  li t3, 20000
  add t3, a0, t3                                                        # ir inst 18 fin
  lw s11, 0(t3)                                                         # ir inst 19 fin
  slt t3, t4, s11                                                       # ir inst 20 fin
  bnez t3, .F._14su0eKxQra_kmp_search._5.while.body.0
  j .F._14su0eKxQra_kmp_search._24.while.exit.0                         # ir inst 21 fin
.F._14su0eKxQra_kmp_search._5.while.body.0:
  li t3, 1185824
  add t3, a0, t3                                                        # ir inst 22 fin
  lw s11, 0(t3)                                                         # ir inst 23 fin
  addi s10, s11, 1                                                      # ir inst 24 fin
  sw s10, 0(t3)                                                         # ir inst 25 fin
  li t3, 20004
  add t3, a0, t3                                                        # ir inst 26 fin
  mv s11, a1                                                            # ir inst 27 fin
  li t1, 800
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 28 fin
  mv t3, t5                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 30 fin
  lw t3, 0(s11)                                                         # ir inst 31 fin
  addi s11, a0, 0                                                       # ir inst 32 fin
  mv s10, t4                                                            # ir inst 33 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 34 fin
  lw s11, 0(s9)                                                         # ir inst 35 fin
  xor t0, t3, s11
  sltiu s10, t0, 1                                                      # ir inst 36 fin
  bnez s10, .F._14su0eKxQra_kmp_search._6.if.then.1
  j .F._14su0eKxQra_kmp_search._7.if.else.1                             # ir inst 37 fin
.F._14su0eKxQra_kmp_search._6.if.then.1:
  addi t3, t4, 1                                                        # ir inst 38 fin
  addi s11, t5, 1                                                       # ir inst 39 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F._14su0eKxQra_kmp_search._8.if.exit.1                             # ir inst 40 fin
.F._14su0eKxQra_kmp_search._7.if.else.1:
# Phi connections
  j .F._14su0eKxQra_kmp_search._8.if.exit.1                             # ir inst 41 fin
.F._14su0eKxQra_kmp_search._8.if.exit.1:
  xor t0, t5, t6
  sltiu t3, t0, 1                                                       # ir inst 44 fin
  bnez t3, .F._14su0eKxQra_kmp_search._9.if.then.2
  j .F._14su0eKxQra_kmp_search._13.if.else.2                            # ir inst 45 fin
.F._14su0eKxQra_kmp_search._9.if.then.2:
  li t3, 1185584
  add t3, a0, t3                                                        # ir inst 46 fin
  mv s11, a1                                                            # ir inst 47 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 48 fin
  lw t3, 0(s10)                                                         # ir inst 49 fin
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 50 fin
  bnez s11, .F._14su0eKxQra_kmp_search._10.if.then.3
  j .F._14su0eKxQra_kmp_search._11.if.else.3                            # ir inst 51 fin
.F._14su0eKxQra_kmp_search._10.if.then.3:
  li t3, 1165584
  add t3, a0, t3                                                        # ir inst 52 fin
  mv s11, a1                                                            # ir inst 53 fin
  li t1, 400
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 54 fin
  li t3, 1185584
  add t3, a0, t3                                                        # ir inst 55 fin
  mv s11, a1                                                            # ir inst 56 fin
  slli t2, s11, 2
  add s9, t3, t2                                                        # ir inst 57 fin
  lw t3, 0(s9)                                                          # ir inst 58 fin
  mv s11, t3                                                            # ir inst 59 fin
  slli t2, s11, 2
  add t3, s10, t2                                                       # ir inst 60 fin
  sub s11, t4, t5                                                       # ir inst 61 fin
  sw s11, 0(t3)                                                         # ir inst 62 fin
  j .F._14su0eKxQra_kmp_search._12.if.exit.3                            # ir inst 63 fin
.F._14su0eKxQra_kmp_search._11.if.else.3:
  j .F._14su0eKxQra_kmp_search._12.if.exit.3                            # ir inst 64 fin
.F._14su0eKxQra_kmp_search._12.if.exit.3:
  li t3, 1185584
  add t3, a0, t3                                                        # ir inst 65 fin
  mv s11, a1                                                            # ir inst 66 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 67 fin
  lw t3, 0(s10)                                                         # ir inst 68 fin
  addi s11, t3, 1                                                       # ir inst 69 fin
  sw s11, 0(s10)                                                        # ir inst 70 fin
  li t3, 120208
  add t3, a0, t3                                                        # ir inst 71 fin
  addi s11, t5, -1                                                      # ir inst 72 fin
  mv s10, s11                                                           # ir inst 73 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 74 fin
  lw t3, 0(s11)                                                         # ir inst 75 fin
# Phi connections
  mv t5, t3
  j .F._14su0eKxQra_kmp_search._23.if.exit.2                            # ir inst 76 fin
.F._14su0eKxQra_kmp_search._13.if.else.2:
  li t3, 20000
  add t3, a0, t3                                                        # ir inst 77 fin
  lw s11, 0(t3)                                                         # ir inst 78 fin
  slt t3, t4, s11                                                       # ir inst 79 fin
  bnez t3, .F._14su0eKxQra_kmp_search._14.lazy.then.0
  j .F._14su0eKxQra_kmp_search._15.lazy.else.0                          # ir inst 80 fin
.F._14su0eKxQra_kmp_search._14.lazy.then.0:
  li t3, 20004
  add t3, a0, t3                                                        # ir inst 81 fin
  mv s11, a1                                                            # ir inst 82 fin
  li t1, 800
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 83 fin
  mv t3, t5                                                             # ir inst 84 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 85 fin
  lw t3, 0(s11)                                                         # ir inst 86 fin
  addi s11, a0, 0                                                       # ir inst 87 fin
  mv s10, t4                                                            # ir inst 88 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 89 fin
  lw s11, 0(s9)                                                         # ir inst 90 fin
  xor t0, t3, s11
  sltu s10, zero, t0                                                    # ir inst 91 fin
# Phi connections
  mv t3, s10
  j .F._14su0eKxQra_kmp_search._16.lazy.exit.0                          # ir inst 92 fin
.F._14su0eKxQra_kmp_search._15.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._14su0eKxQra_kmp_search._16.lazy.exit.0                          # ir inst 93 fin
.F._14su0eKxQra_kmp_search._16.lazy.exit.0:
  bnez t3, .F._14su0eKxQra_kmp_search._17.if.then.4
  j .F._14su0eKxQra_kmp_search._21.if.else.4                            # ir inst 95 fin
.F._14su0eKxQra_kmp_search._17.if.then.4:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 96 fin
  bnez t3, .F._14su0eKxQra_kmp_search._18.if.then.5
  j .F._14su0eKxQra_kmp_search._19.if.else.5                            # ir inst 97 fin
.F._14su0eKxQra_kmp_search._18.if.then.5:
  li t3, 120208
  add t3, a0, t3                                                        # ir inst 98 fin
  addi s11, t5, -1                                                      # ir inst 99 fin
  mv s10, s11                                                           # ir inst 100 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 101 fin
  lw t3, 0(s11)                                                         # ir inst 102 fin
# Phi connections
  mv s11, t4
  j .F._14su0eKxQra_kmp_search._20.if.exit.5                            # ir inst 103 fin
.F._14su0eKxQra_kmp_search._19.if.else.5:
  addi t3, t4, 1                                                        # ir inst 104 fin
# Phi connections
  mv s11, t3
  mv t3, t5
  j .F._14su0eKxQra_kmp_search._20.if.exit.5                            # ir inst 105 fin
.F._14su0eKxQra_kmp_search._20.if.exit.5:
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F._14su0eKxQra_kmp_search._22.if.exit.4                            # ir inst 108 fin
.F._14su0eKxQra_kmp_search._21.if.else.4:
# Phi connections
  j .F._14su0eKxQra_kmp_search._22.if.exit.4                            # ir inst 109 fin
.F._14su0eKxQra_kmp_search._22.if.exit.4:
# Phi connections
  j .F._14su0eKxQra_kmp_search._23.if.exit.2                            # ir inst 112 fin
.F._14su0eKxQra_kmp_search._23.if.exit.2:
# Phi connections
  j .F._14su0eKxQra_kmp_search._4.while.cond.0                          # ir inst 115 fin
.F._14su0eKxQra_kmp_search._24.while.exit.0:
  j .F._14su0eKxQra_kmp_search.epilogue                                 # ir inst 116 fin
.F._14su0eKxQra_kmp_search.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_boyer_moore_search
.F._14su0eKxQra_boyer_moore_search:
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
.F._14su0eKxQra_boyer_moore_search._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 5 fin
  lw t4, 0(t5)                                                          # ir inst 6 fin
  slt t5, t4, t6                                                        # ir inst 7 fin
  bnez t5, .F._14su0eKxQra_boyer_moore_search._1.if.then.0
  j .F._14su0eKxQra_boyer_moore_search._2.if.else.0                     # ir inst 8 fin
.F._14su0eKxQra_boyer_moore_search._1.if.then.0:
  j .F._14su0eKxQra_boyer_moore_search.epilogue                         # ir inst 9 fin
.F._14su0eKxQra_boyer_moore_search._2.if.else.0:
  j .F._14su0eKxQra_boyer_moore_search._3.if.exit.0                     # ir inst 10 fin
.F._14su0eKxQra_boyer_moore_search._3.if.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  j .F._14su0eKxQra_boyer_moore_search._4.while.cond.0                  # ir inst 11 fin
.F._14su0eKxQra_boyer_moore_search._4.while.cond.0:
  li t3, 20000
  add t3, a0, t3                                                        # ir inst 14 fin
  lw s11, 0(t3)                                                         # ir inst 15 fin
  sub t3, s11, t6                                                       # ir inst 16 fin
  slt t0, t3, t5
  xori s11, t0, 1                                                       # ir inst 17 fin
  bnez s11, .F._14su0eKxQra_boyer_moore_search._5.while.body.0
  j .F._14su0eKxQra_boyer_moore_search._21.while.exit.0                 # ir inst 18 fin
.F._14su0eKxQra_boyer_moore_search._5.while.body.0:
  addi t3, t6, -1                                                       # ir inst 19 fin
# Phi connections
  j .F._14su0eKxQra_boyer_moore_search._6.while.cond.1                  # ir inst 20 fin
.F._14su0eKxQra_boyer_moore_search._6.while.cond.1:
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 22 fin
  bnez s11, .F._14su0eKxQra_boyer_moore_search._7.lazy.then.0
  j .F._14su0eKxQra_boyer_moore_search._8.lazy.else.0                   # ir inst 23 fin
.F._14su0eKxQra_boyer_moore_search._7.lazy.then.0:
  li s11, 20004
  add s11, a0, s11                                                      # ir inst 24 fin
  mv s10, a1                                                            # ir inst 25 fin
  li t1, 800
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 26 fin
  mv s11, t3                                                            # ir inst 27 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 28 fin
  lw s11, 0(s10)                                                        # ir inst 29 fin
  addi s10, a0, 0                                                       # ir inst 30 fin
  add s9, t5, t3                                                        # ir inst 31 fin
  mv s8, s9                                                             # ir inst 32 fin
  slli t2, s8, 2
  add s9, s10, t2                                                       # ir inst 33 fin
  lw s10, 0(s9)                                                         # ir inst 34 fin
  xor t0, s11, s10
  sltiu s9, t0, 1                                                       # ir inst 35 fin
# Phi connections
  mv s11, s9
  j .F._14su0eKxQra_boyer_moore_search._9.lazy.exit.0                   # ir inst 36 fin
.F._14su0eKxQra_boyer_moore_search._8.lazy.else.0:
# Phi connections
  li s11, 0
  j .F._14su0eKxQra_boyer_moore_search._9.lazy.exit.0                   # ir inst 37 fin
.F._14su0eKxQra_boyer_moore_search._9.lazy.exit.0:
  bnez s11, .F._14su0eKxQra_boyer_moore_search._10.while.body.1
  j .F._14su0eKxQra_boyer_moore_search._11.while.exit.1                 # ir inst 39 fin
.F._14su0eKxQra_boyer_moore_search._10.while.body.1:
  addi s11, t3, -1                                                      # ir inst 40 fin
  li s10, 1185824
  add s10, a0, s10                                                      # ir inst 41 fin
  lw s9, 0(s10)                                                         # ir inst 42 fin
  addi s8, s9, 1                                                        # ir inst 43 fin
  sw s8, 0(s10)                                                         # ir inst 44 fin
# Phi connections
  mv t3, s11
  j .F._14su0eKxQra_boyer_moore_search._6.while.cond.1                  # ir inst 45 fin
.F._14su0eKxQra_boyer_moore_search._11.while.exit.1:
  li t2, 0
  slt s11, t3, t2                                                       # ir inst 46 fin
  bnez s11, .F._14su0eKxQra_boyer_moore_search._12.if.then.1
  j .F._14su0eKxQra_boyer_moore_search._16.if.else.1                    # ir inst 47 fin
.F._14su0eKxQra_boyer_moore_search._12.if.then.1:
  addi s11, t4, 1                                                       # ir inst 48 fin
  add s10, t5, t6                                                       # ir inst 49 fin
  li s9, 20000
  add s9, a0, s9                                                        # ir inst 50 fin
  lw s8, 0(s9)                                                          # ir inst 51 fin
  slt s9, s10, s8                                                       # ir inst 52 fin
  bnez s9, .F._14su0eKxQra_boyer_moore_search._13.if.then.2
  j .F._14su0eKxQra_boyer_moore_search._14.if.else.2                    # ir inst 53 fin
.F._14su0eKxQra_boyer_moore_search._13.if.then.2:
# Phi connections
  mv s10, t6
  j .F._14su0eKxQra_boyer_moore_search._15.if.exit.2                    # ir inst 54 fin
.F._14su0eKxQra_boyer_moore_search._14.if.else.2:
# Phi connections
  li s10, 1
  j .F._14su0eKxQra_boyer_moore_search._15.if.exit.2                    # ir inst 55 fin
.F._14su0eKxQra_boyer_moore_search._15.if.exit.2:
  add s9, t5, s10                                                       # ir inst 57 fin
# Phi connections
  mv t3, s11
  mv t5, s9
  j .F._14su0eKxQra_boyer_moore_search._20.if.exit.1                    # ir inst 58 fin
.F._14su0eKxQra_boyer_moore_search._16.if.else.1:
  li s11, 121008
  add s11, a0, s11                                                      # ir inst 59 fin
  addi s10, a0, 0                                                       # ir inst 60 fin
  add s9, t5, t3                                                        # ir inst 61 fin
  mv s8, s9                                                             # ir inst 62 fin
  slli t2, s8, 2
  add s9, s10, t2                                                       # ir inst 63 fin
  lw s10, 0(s9)                                                         # ir inst 64 fin
  mv s9, s10                                                            # ir inst 65 fin
  slli t2, s9, 2
  add s10, s11, t2                                                      # ir inst 66 fin
  lw s11, 0(s10)                                                        # ir inst 67 fin
  sub s10, t3, s11                                                      # ir inst 68 fin
  li t2, 1
  slt t3, t2, s10                                                       # ir inst 69 fin
  bnez t3, .F._14su0eKxQra_boyer_moore_search._17.if.then.3
  j .F._14su0eKxQra_boyer_moore_search._18.if.else.3                    # ir inst 70 fin
.F._14su0eKxQra_boyer_moore_search._17.if.then.3:
# Phi connections
  mv t3, s10
  j .F._14su0eKxQra_boyer_moore_search._19.if.exit.3                    # ir inst 71 fin
.F._14su0eKxQra_boyer_moore_search._18.if.else.3:
# Phi connections
  li t3, 1
  j .F._14su0eKxQra_boyer_moore_search._19.if.exit.3                    # ir inst 72 fin
.F._14su0eKxQra_boyer_moore_search._19.if.exit.3:
  add s11, t5, t3                                                       # ir inst 74 fin
  li t5, 1185824
  add t5, a0, t5                                                        # ir inst 75 fin
  lw t3, 0(t5)                                                          # ir inst 76 fin
  addi s10, t3, 1                                                       # ir inst 77 fin
  sw s10, 0(t5)                                                         # ir inst 78 fin
# Phi connections
  mv t3, t4
  mv t5, s11
  j .F._14su0eKxQra_boyer_moore_search._20.if.exit.1                    # ir inst 79 fin
.F._14su0eKxQra_boyer_moore_search._20.if.exit.1:
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_boyer_moore_search._4.while.cond.0                  # ir inst 82 fin
.F._14su0eKxQra_boyer_moore_search._21.while.exit.0:
  li t6, 1185784
  add t6, a0, t6                                                        # ir inst 83 fin
  addi t5, t6, 4                                                        # ir inst 84 fin
  sw t4, 0(t5)                                                          # ir inst 85 fin
  j .F._14su0eKxQra_boyer_moore_search.epilogue                         # ir inst 86 fin
.F._14su0eKxQra_boyer_moore_search.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_rabin_karp_search
.F._14su0eKxQra_rabin_karp_search:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 5 / 12,        range:       48(sp) -       88(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd s7, 64(sp)
  sd s9, 72(sp)
  sd s8, 80(sp)
  sd ra, 88(sp)
.F._14su0eKxQra_rabin_karp_search._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  li t5, 122832
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, a1                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 7 fin
  lw t5, 0(t3)                                                          # ir inst 8 fin
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 9 fin
  lw t3, 0(t4)                                                          # ir inst 10 fin
  slt t4, t3, t6                                                        # ir inst 11 fin
  bnez t4, .F._14su0eKxQra_rabin_karp_search._1.if.then.0
  j .F._14su0eKxQra_rabin_karp_search._2.if.else.0                      # ir inst 12 fin
.F._14su0eKxQra_rabin_karp_search._1.if.then.0:
  j .F._14su0eKxQra_rabin_karp_search.epilogue                          # ir inst 13 fin
.F._14su0eKxQra_rabin_karp_search._2.if.else.0:
  j .F._14su0eKxQra_rabin_karp_search._3.if.exit.0                      # ir inst 14 fin
.F._14su0eKxQra_rabin_karp_search._3.if.exit.0:
# Phi connections
  li s11, 0
  li t3, 0
  li t4, 1
  j .F._14su0eKxQra_rabin_karp_search._4.while.cond.0                   # ir inst 15 fin
.F._14su0eKxQra_rabin_karp_search._4.while.cond.0:
  slt s10, s11, t6                                                      # ir inst 19 fin
  bnez s10, .F._14su0eKxQra_rabin_karp_search._5.while.body.0
  j .F._14su0eKxQra_rabin_karp_search._9.while.exit.0                   # ir inst 20 fin
.F._14su0eKxQra_rabin_karp_search._5.while.body.0:
  addi s10, a0, 0                                                       # ir inst 21 fin
  mv s9, s11                                                            # ir inst 22 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 23 fin
  lw s10, 0(s8)                                                         # ir inst 24 fin
  mul s9, s10, t4                                                       # ir inst 25 fin
  li s10, 143036
  add s10, a0, s10                                                      # ir inst 26 fin
  lw s8, 0(s10)                                                         # ir inst 27 fin
  rem s10, s9, s8                                                       # ir inst 28 fin
  add s9, t3, s10                                                       # ir inst 29 fin
  li s10, 143036
  add s10, a0, s10                                                      # ir inst 30 fin
  lw s8, 0(s10)                                                         # ir inst 31 fin
  rem s10, s9, s8                                                       # ir inst 32 fin
  addi s9, t6, -1                                                       # ir inst 33 fin
  slt s8, s11, s9                                                       # ir inst 34 fin
  bnez s8, .F._14su0eKxQra_rabin_karp_search._6.if.then.1
  j .F._14su0eKxQra_rabin_karp_search._7.if.else.1                      # ir inst 35 fin
.F._14su0eKxQra_rabin_karp_search._6.if.then.1:
  li s9, 143032
  add s9, a0, s9                                                        # ir inst 36 fin
  lw s8, 0(s9)                                                          # ir inst 37 fin
  mul s9, t4, s8                                                        # ir inst 38 fin
  li s8, 143036
  add s8, a0, s8                                                        # ir inst 39 fin
  lw s7, 0(s8)                                                          # ir inst 40 fin
  rem s8, s9, s7                                                        # ir inst 41 fin
# Phi connections
  mv s9, s8
  j .F._14su0eKxQra_rabin_karp_search._8.if.exit.1                      # ir inst 42 fin
.F._14su0eKxQra_rabin_karp_search._7.if.else.1:
# Phi connections
  mv s9, t4
  j .F._14su0eKxQra_rabin_karp_search._8.if.exit.1                      # ir inst 43 fin
.F._14su0eKxQra_rabin_karp_search._8.if.exit.1:
  addi s8, s11, 1                                                       # ir inst 45 fin
# Phi connections
  mv s11, s8
  mv t3, s10
  mv t4, s9
  j .F._14su0eKxQra_rabin_karp_search._4.while.cond.0                   # ir inst 46 fin
.F._14su0eKxQra_rabin_karp_search._9.while.exit.0:
  xor t0, t3, t5
  sltiu s11, t0, 1                                                      # ir inst 47 fin
  bnez s11, .F._14su0eKxQra_rabin_karp_search._10.if.then.2
  j .F._14su0eKxQra_rabin_karp_search._14.if.else.2                     # ir inst 48 fin
.F._14su0eKxQra_rabin_karp_search._10.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, a1
  li a1, 0
  call .F._14su0eKxQra_verify_match
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 49 fin
  bnez s11, .F._14su0eKxQra_rabin_karp_search._11.if.then.3
  j .F._14su0eKxQra_rabin_karp_search._12.if.else.3                     # ir inst 50 fin
.F._14su0eKxQra_rabin_karp_search._11.if.then.3:
# Phi connections
  li s11, 1
  j .F._14su0eKxQra_rabin_karp_search._13.if.exit.3                     # ir inst 51 fin
.F._14su0eKxQra_rabin_karp_search._12.if.else.3:
  li s11, 1185828
  add s11, a0, s11                                                      # ir inst 52 fin
  lw s10, 0(s11)                                                        # ir inst 53 fin
  addi s9, s10, 1                                                       # ir inst 54 fin
  sw s9, 0(s11)                                                         # ir inst 55 fin
# Phi connections
  li s11, 0
  j .F._14su0eKxQra_rabin_karp_search._13.if.exit.3                     # ir inst 56 fin
.F._14su0eKxQra_rabin_karp_search._13.if.exit.3:
# Phi connections
  j .F._14su0eKxQra_rabin_karp_search._15.if.exit.2                     # ir inst 58 fin
.F._14su0eKxQra_rabin_karp_search._14.if.else.2:
# Phi connections
  li s11, 0
  j .F._14su0eKxQra_rabin_karp_search._15.if.exit.2                     # ir inst 59 fin
.F._14su0eKxQra_rabin_karp_search._15.if.exit.2:
# Phi connections
  mv s10, t6
  j .F._14su0eKxQra_rabin_karp_search._16.while.cond.1                  # ir inst 61 fin
.F._14su0eKxQra_rabin_karp_search._16.while.cond.1:
  li s9, 20000
  add s9, a0, s9                                                        # ir inst 65 fin
  lw s8, 0(s9)                                                          # ir inst 66 fin
  slt s9, s10, s8                                                       # ir inst 67 fin
  bnez s9, .F._14su0eKxQra_rabin_karp_search._17.while.body.1
  j .F._14su0eKxQra_rabin_karp_search._24.while.exit.1                  # ir inst 68 fin
.F._14su0eKxQra_rabin_karp_search._17.while.body.1:
  addi s9, a0, 0                                                        # ir inst 69 fin
  sub s8, s10, t6                                                       # ir inst 70 fin
  mv s7, s8                                                             # ir inst 71 fin
  slli t2, s7, 2
  add s8, s9, t2                                                        # ir inst 72 fin
  lw s9, 0(s8)                                                          # ir inst 73 fin
  mul s8, s9, t4                                                        # ir inst 74 fin
  li s9, 143036
  add s9, a0, s9                                                        # ir inst 75 fin
  lw s7, 0(s9)                                                          # ir inst 76 fin
  rem s9, s8, s7                                                        # ir inst 77 fin
  sub s8, t3, s9                                                        # ir inst 78 fin
  li t3, 143036
  add t3, a0, t3                                                        # ir inst 79 fin
  lw s9, 0(t3)                                                          # ir inst 80 fin
  add t3, s8, s9                                                        # ir inst 81 fin
  li s9, 143036
  add s9, a0, s9                                                        # ir inst 82 fin
  lw s8, 0(s9)                                                          # ir inst 83 fin
  rem s9, t3, s8                                                        # ir inst 84 fin
  li t3, 143032
  add t3, a0, t3                                                        # ir inst 85 fin
  lw s8, 0(t3)                                                          # ir inst 86 fin
  mul t3, s9, s8                                                        # ir inst 87 fin
  addi s9, a0, 0                                                        # ir inst 88 fin
  mv s8, s10                                                            # ir inst 89 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 90 fin
  lw s9, 0(s7)                                                          # ir inst 91 fin
  add s8, t3, s9                                                        # ir inst 92 fin
  li t3, 143036
  add t3, a0, t3                                                        # ir inst 93 fin
  lw s9, 0(t3)                                                          # ir inst 94 fin
  rem t3, s8, s9                                                        # ir inst 95 fin
  xor t0, t3, t5
  sltiu s9, t0, 1                                                       # ir inst 96 fin
  bnez s9, .F._14su0eKxQra_rabin_karp_search._18.if.then.4
  j .F._14su0eKxQra_rabin_karp_search._22.if.else.4                     # ir inst 97 fin
.F._14su0eKxQra_rabin_karp_search._18.if.then.4:
  sub s9, s10, t6                                                       # ir inst 98 fin
  addi s8, s9, 1                                                        # ir inst 99 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, a1
  mv a1, s8
  call .F._14su0eKxQra_verify_match
  mv s9, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 100 fin
  bnez s9, .F._14su0eKxQra_rabin_karp_search._19.if.then.5
  j .F._14su0eKxQra_rabin_karp_search._20.if.else.5                     # ir inst 101 fin
.F._14su0eKxQra_rabin_karp_search._19.if.then.5:
  addi s9, s11, 1                                                       # ir inst 102 fin
# Phi connections
  j .F._14su0eKxQra_rabin_karp_search._21.if.exit.5                     # ir inst 103 fin
.F._14su0eKxQra_rabin_karp_search._20.if.else.5:
  li s9, 1185828
  add s9, a0, s9                                                        # ir inst 104 fin
  lw s8, 0(s9)                                                          # ir inst 105 fin
  addi s7, s8, 1                                                        # ir inst 106 fin
  sw s7, 0(s9)                                                          # ir inst 107 fin
# Phi connections
  mv s9, s11
  j .F._14su0eKxQra_rabin_karp_search._21.if.exit.5                     # ir inst 108 fin
.F._14su0eKxQra_rabin_karp_search._21.if.exit.5:
# Phi connections
  j .F._14su0eKxQra_rabin_karp_search._23.if.exit.4                     # ir inst 110 fin
.F._14su0eKxQra_rabin_karp_search._22.if.else.4:
# Phi connections
  mv s9, s11
  j .F._14su0eKxQra_rabin_karp_search._23.if.exit.4                     # ir inst 111 fin
.F._14su0eKxQra_rabin_karp_search._23.if.exit.4:
  addi s8, s10, 1                                                       # ir inst 113 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F._14su0eKxQra_rabin_karp_search._16.while.cond.1                  # ir inst 114 fin
.F._14su0eKxQra_rabin_karp_search._24.while.exit.1:
  li t6, 1185784
  add t6, a0, t6                                                        # ir inst 115 fin
  addi t5, t6, 8                                                        # ir inst 116 fin
  sw s11, 0(t5)                                                         # ir inst 117 fin
  j .F._14su0eKxQra_rabin_karp_search.epilogue                          # ir inst 118 fin
.F._14su0eKxQra_rabin_karp_search.epilogue:
  ld ra, 88(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  ld s7, 64(sp)
  ld s9, 72(sp)
  ld s8, 80(sp)
  addi sp, sp, 96
  ret

.globl .F._14su0eKxQra_verify_match
.F._14su0eKxQra_verify_match:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._14su0eKxQra_verify_match._0.entry.0:
  li t6, 60004
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a2                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_verify_match._1.while.cond.0                        # ir inst 5 fin
.F._14su0eKxQra_verify_match._1.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 7 fin
  bnez t4, .F._14su0eKxQra_verify_match._2.while.body.0
  j .F._14su0eKxQra_verify_match._6.while.exit.0                        # ir inst 8 fin
.F._14su0eKxQra_verify_match._2.while.body.0:
  li t4, 1185824
  add t4, a0, t4                                                        # ir inst 9 fin
  lw t3, 0(t4)                                                          # ir inst 10 fin
  addi s11, t3, 1                                                       # ir inst 11 fin
  sw s11, 0(t4)                                                         # ir inst 12 fin
  addi t4, a0, 0                                                        # ir inst 13 fin
  add t3, a1, t5                                                        # ir inst 14 fin
  mv s11, t3                                                            # ir inst 15 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 16 fin
  lw t4, 0(t3)                                                          # ir inst 17 fin
  li t3, 20004
  add t3, a0, t3                                                        # ir inst 18 fin
  mv s11, a2                                                            # ir inst 19 fin
  li t1, 800
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 20 fin
  mv t3, t5                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 22 fin
  lw t3, 0(s11)                                                         # ir inst 23 fin
  xor t0, t4, t3
  sltu s11, zero, t0                                                    # ir inst 24 fin
  bnez s11, .F._14su0eKxQra_verify_match._3.if.then.0
  j .F._14su0eKxQra_verify_match._4.if.else.0                           # ir inst 25 fin
.F._14su0eKxQra_verify_match._3.if.then.0:
  li a0, 0
  j .F._14su0eKxQra_verify_match.epilogue                               # ir inst 26 fin
.F._14su0eKxQra_verify_match._4.if.else.0:
  j .F._14su0eKxQra_verify_match._5.if.exit.0                           # ir inst 27 fin
.F._14su0eKxQra_verify_match._5.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 28 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_verify_match._1.while.cond.0                        # ir inst 29 fin
.F._14su0eKxQra_verify_match._6.while.exit.0:
  li a0, 1
  j .F._14su0eKxQra_verify_match.epilogue                               # ir inst 30 fin
.F._14su0eKxQra_verify_match.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._14su0eKxQra_compute_edit_distance
.F._14su0eKxQra_compute_edit_distance:
# spill func args num: 0,             range:     4080(sp) -     4080(sp)
# local var size: 4000,               range:       80(sp) -     4080(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 3 / 12,        range:       48(sp) -       72(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4080
  add sp, sp, t0
  sd s9, 48(sp)
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F._14su0eKxQra_compute_edit_distance._0.entry.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_compute_edit_distance._1.array.cond.0               # ir inst 3 fin
.F._14su0eKxQra_compute_edit_distance._1.array.cond.0:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F._14su0eKxQra_compute_edit_distance._2.array.body.0
  j .F._14su0eKxQra_compute_edit_distance._3.array.exit.0               # ir inst 6 fin
.F._14su0eKxQra_compute_edit_distance._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_compute_edit_distance._1.array.cond.0               # ir inst 10 fin
.F._14su0eKxQra_compute_edit_distance._3.array.exit.0:
  li t1, 2080
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_compute_edit_distance._4.array.cond.1               # ir inst 13 fin
.F._14su0eKxQra_compute_edit_distance._4.array.cond.1:
  li t2, 500
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F._14su0eKxQra_compute_edit_distance._5.array.body.1
  j .F._14su0eKxQra_compute_edit_distance._6.array.exit.1               # ir inst 16 fin
.F._14su0eKxQra_compute_edit_distance._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_compute_edit_distance._4.array.cond.1               # ir inst 20 fin
.F._14su0eKxQra_compute_edit_distance._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_compute_edit_distance._7.while.cond.0               # ir inst 21 fin
.F._14su0eKxQra_compute_edit_distance._7.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 23 fin
  bnez t5, .F._14su0eKxQra_compute_edit_distance._8.while.body.0
  j .F._14su0eKxQra_compute_edit_distance._9.while.exit.0               # ir inst 24 fin
.F._14su0eKxQra_compute_edit_distance._8.while.body.0:
  mv t5, t6                                                             # ir inst 25 fin
  slli t2, t5, 2
  addi t1, sp, 80
  add t4, t1, t2                                                        # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  call getInt
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 27 fin
  sw t5, 0(t4)                                                          # ir inst 28 fin
  addi t5, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_compute_edit_distance._7.while.cond.0               # ir inst 30 fin
.F._14su0eKxQra_compute_edit_distance._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_compute_edit_distance._10.while.cond.1              # ir inst 31 fin
.F._14su0eKxQra_compute_edit_distance._10.while.cond.1:
  slt t5, t6, a2                                                        # ir inst 33 fin
  bnez t5, .F._14su0eKxQra_compute_edit_distance._11.while.body.1
  j .F._14su0eKxQra_compute_edit_distance._12.while.exit.1              # ir inst 34 fin
.F._14su0eKxQra_compute_edit_distance._11.while.body.1:
  mv t5, t6                                                             # ir inst 35 fin
  slli t2, t5, 2
  li t1, 2080
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 36 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  call getInt
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 37 fin
  sw t5, 0(t4)                                                          # ir inst 38 fin
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_compute_edit_distance._10.while.cond.1              # ir inst 40 fin
.F._14su0eKxQra_compute_edit_distance._12.while.exit.1:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_compute_edit_distance._13.while.cond.2              # ir inst 41 fin
.F._14su0eKxQra_compute_edit_distance._13.while.cond.2:
  slt t0, a1, t6
  xori t5, t0, 1                                                        # ir inst 43 fin
  bnez t5, .F._14su0eKxQra_compute_edit_distance._14.while.body.2
  j .F._14su0eKxQra_compute_edit_distance._15.while.exit.2              # ir inst 44 fin
.F._14su0eKxQra_compute_edit_distance._14.while.body.2:
  li t5, 143040
  add t5, a0, t5                                                        # ir inst 45 fin
  mv t4, t6                                                             # ir inst 46 fin
  li t1, 2000
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 47 fin
  addi t5, t3, 0                                                        # ir inst 48 fin
  sw t6, 0(t5)                                                          # ir inst 49 fin
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_compute_edit_distance._13.while.cond.2              # ir inst 51 fin
.F._14su0eKxQra_compute_edit_distance._15.while.exit.2:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_compute_edit_distance._16.while.cond.3              # ir inst 52 fin
.F._14su0eKxQra_compute_edit_distance._16.while.cond.3:
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 54 fin
  bnez t5, .F._14su0eKxQra_compute_edit_distance._17.while.body.3
  j .F._14su0eKxQra_compute_edit_distance._18.while.exit.3              # ir inst 55 fin
.F._14su0eKxQra_compute_edit_distance._17.while.body.3:
  li t5, 143040
  add t5, a0, t5                                                        # ir inst 56 fin
  addi t4, t5, 0                                                        # ir inst 57 fin
  mv t5, t6                                                             # ir inst 58 fin
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 59 fin
  sw t6, 0(t3)                                                          # ir inst 60 fin
  addi t5, t6, 1                                                        # ir inst 61 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_compute_edit_distance._16.while.cond.3              # ir inst 62 fin
.F._14su0eKxQra_compute_edit_distance._18.while.exit.3:
# Phi connections
  li t6, 1
  j .F._14su0eKxQra_compute_edit_distance._19.while.cond.4              # ir inst 63 fin
.F._14su0eKxQra_compute_edit_distance._19.while.cond.4:
  slt t0, a1, t6
  xori t5, t0, 1                                                        # ir inst 65 fin
  bnez t5, .F._14su0eKxQra_compute_edit_distance._20.while.body.4
  j .F._14su0eKxQra_compute_edit_distance._36.while.exit.4              # ir inst 66 fin
.F._14su0eKxQra_compute_edit_distance._20.while.body.4:
# Phi connections
  li t5, 1
  j .F._14su0eKxQra_compute_edit_distance._21.while.cond.5              # ir inst 67 fin
.F._14su0eKxQra_compute_edit_distance._21.while.cond.5:
  slt t0, a2, t5
  xori t4, t0, 1                                                        # ir inst 69 fin
  bnez t4, .F._14su0eKxQra_compute_edit_distance._22.while.body.5
  j .F._14su0eKxQra_compute_edit_distance._35.while.exit.5              # ir inst 70 fin
.F._14su0eKxQra_compute_edit_distance._22.while.body.5:
  addi t4, t6, -1                                                       # ir inst 71 fin
  mv t3, t4                                                             # ir inst 72 fin
  slli t2, t3, 2
  addi t1, sp, 80
  add t4, t1, t2                                                        # ir inst 73 fin
  lw t3, 0(t4)                                                          # ir inst 74 fin
  addi t4, t5, -1                                                       # ir inst 75 fin
  mv s11, t4                                                            # ir inst 76 fin
  slli t2, s11, 2
  li t1, 2080
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 77 fin
  lw s11, 0(t4)                                                         # ir inst 78 fin
  xor t0, t3, s11
  sltiu t4, t0, 1                                                       # ir inst 79 fin
  bnez t4, .F._14su0eKxQra_compute_edit_distance._23.if.then.0
  j .F._14su0eKxQra_compute_edit_distance._24.if.else.0                 # ir inst 80 fin
.F._14su0eKxQra_compute_edit_distance._23.if.then.0:
  li t4, 143040
  add t4, a0, t4                                                        # ir inst 81 fin
  mv t3, t6                                                             # ir inst 82 fin
  li t1, 2000
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 83 fin
  mv t4, t5                                                             # ir inst 84 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 85 fin
  li t4, 143040
  add t4, a0, t4                                                        # ir inst 86 fin
  addi s11, t6, -1                                                      # ir inst 87 fin
  mv s10, s11                                                           # ir inst 88 fin
  li t1, 2000
  mul t2, s10, t1
  add s11, t4, t2                                                       # ir inst 89 fin
  addi t4, t5, -1                                                       # ir inst 90 fin
  mv s10, t4                                                            # ir inst 91 fin
  slli t2, s10, 2
  add t4, s11, t2                                                       # ir inst 92 fin
  lw s11, 0(t4)                                                         # ir inst 93 fin
  sw s11, 0(t3)                                                         # ir inst 94 fin
  j .F._14su0eKxQra_compute_edit_distance._34.if.exit.0                 # ir inst 95 fin
.F._14su0eKxQra_compute_edit_distance._24.if.else.0:
  li t4, 143040
  add t4, a0, t4                                                        # ir inst 96 fin
  mv t3, t6                                                             # ir inst 97 fin
  li t1, 2000
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 98 fin
  addi t4, t5, -1                                                       # ir inst 99 fin
  mv t3, t4                                                             # ir inst 100 fin
  slli t2, t3, 2
  add t4, s11, t2                                                       # ir inst 101 fin
  lw t3, 0(t4)                                                          # ir inst 102 fin
  addi t4, t3, 1                                                        # ir inst 103 fin
  li t3, 143040
  add t3, a0, t3                                                        # ir inst 104 fin
  addi s11, t6, -1                                                      # ir inst 105 fin
  mv s10, s11                                                           # ir inst 106 fin
  li t1, 2000
  mul t2, s10, t1
  add s11, t3, t2                                                       # ir inst 107 fin
  mv t3, t5                                                             # ir inst 108 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 109 fin
  lw t3, 0(s10)                                                         # ir inst 110 fin
  addi s11, t3, 1                                                       # ir inst 111 fin
  li t3, 143040
  add t3, a0, t3                                                        # ir inst 112 fin
  addi s10, t6, -1                                                      # ir inst 113 fin
  mv s9, s10                                                            # ir inst 114 fin
  li t1, 2000
  mul t2, s9, t1
  add s10, t3, t2                                                       # ir inst 115 fin
  addi t3, t5, -1                                                       # ir inst 116 fin
  mv s9, t3                                                             # ir inst 117 fin
  slli t2, s9, 2
  add t3, s10, t2                                                       # ir inst 118 fin
  lw s10, 0(t3)                                                         # ir inst 119 fin
  addi t3, s10, 1                                                       # ir inst 120 fin
  slt s10, t4, s11                                                      # ir inst 121 fin
  bnez s10, .F._14su0eKxQra_compute_edit_distance._25.if.then.1
  j .F._14su0eKxQra_compute_edit_distance._29.if.else.1                 # ir inst 122 fin
.F._14su0eKxQra_compute_edit_distance._25.if.then.1:
  slt s10, t4, t3                                                       # ir inst 123 fin
  bnez s10, .F._14su0eKxQra_compute_edit_distance._26.if.then.2
  j .F._14su0eKxQra_compute_edit_distance._27.if.else.2                 # ir inst 124 fin
.F._14su0eKxQra_compute_edit_distance._26.if.then.2:
# Phi connections
  j .F._14su0eKxQra_compute_edit_distance._28.if.exit.2                 # ir inst 125 fin
.F._14su0eKxQra_compute_edit_distance._27.if.else.2:
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_compute_edit_distance._28.if.exit.2                 # ir inst 126 fin
.F._14su0eKxQra_compute_edit_distance._28.if.exit.2:
# Phi connections
  j .F._14su0eKxQra_compute_edit_distance._33.if.exit.1                 # ir inst 128 fin
.F._14su0eKxQra_compute_edit_distance._29.if.else.1:
  slt t4, s11, t3                                                       # ir inst 129 fin
  bnez t4, .F._14su0eKxQra_compute_edit_distance._30.if.then.3
  j .F._14su0eKxQra_compute_edit_distance._31.if.else.3                 # ir inst 130 fin
.F._14su0eKxQra_compute_edit_distance._30.if.then.3:
# Phi connections
  mv t4, s11
  j .F._14su0eKxQra_compute_edit_distance._32.if.exit.3                 # ir inst 131 fin
.F._14su0eKxQra_compute_edit_distance._31.if.else.3:
# Phi connections
  mv t4, t3
  j .F._14su0eKxQra_compute_edit_distance._32.if.exit.3                 # ir inst 132 fin
.F._14su0eKxQra_compute_edit_distance._32.if.exit.3:
# Phi connections
  j .F._14su0eKxQra_compute_edit_distance._33.if.exit.1                 # ir inst 134 fin
.F._14su0eKxQra_compute_edit_distance._33.if.exit.1:
  li t3, 143040
  add t3, a0, t3                                                        # ir inst 136 fin
  mv s11, t6                                                            # ir inst 137 fin
  li t1, 2000
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 138 fin
  mv t3, t5                                                             # ir inst 139 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 140 fin
  sw t4, 0(s11)                                                         # ir inst 141 fin
  j .F._14su0eKxQra_compute_edit_distance._34.if.exit.0                 # ir inst 142 fin
.F._14su0eKxQra_compute_edit_distance._34.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 143 fin
# Phi connections
  mv t5, t4
  j .F._14su0eKxQra_compute_edit_distance._21.while.cond.5              # ir inst 144 fin
.F._14su0eKxQra_compute_edit_distance._35.while.exit.5:
  addi t5, t6, 1                                                        # ir inst 145 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_compute_edit_distance._19.while.cond.4              # ir inst 146 fin
.F._14su0eKxQra_compute_edit_distance._36.while.exit.4:
  li t6, 143040
  add t6, a0, t6                                                        # ir inst 147 fin
  mv t5, a1                                                             # ir inst 148 fin
  li t1, 2000
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 149 fin
  mv t6, a2                                                             # ir inst 150 fin
  slli t2, t6, 2
  add t5, t4, t2                                                        # ir inst 151 fin
  lw t6, 0(t5)                                                          # ir inst 152 fin
  mv a0, t6
  j .F._14su0eKxQra_compute_edit_distance.epilogue                      # ir inst 153 fin
.F._14su0eKxQra_compute_edit_distance.epilogue:
  ld ra, 72(sp)
  ld s9, 48(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  li t0, 4080
  add sp, sp, t0
  ret

.globl .F._14su0eKxQra_analyze_compression_potential
.F._14su0eKxQra_analyze_compression_potential:
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
.F._14su0eKxQra_analyze_compression_potential._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._14su0eKxQra_analyze_compression_potential._1.while.cond.0       # ir inst 1 fin
.F._14su0eKxQra_analyze_compression_potential._1.while.cond.0:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F._14su0eKxQra_analyze_compression_potential._2.while.body.0
  j .F._14su0eKxQra_analyze_compression_potential._12.while.exit.0      # ir inst 5 fin
.F._14su0eKxQra_analyze_compression_potential._2.while.body.0:
  li t4, 1143040
  add t4, a0, t4                                                        # ir inst 6 fin
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 8 fin
  lw t4, 0(s11)                                                         # ir inst 9 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 10 fin
  bnez t3, .F._14su0eKxQra_analyze_compression_potential._3.if.then.0
  j .F._14su0eKxQra_analyze_compression_potential._10.if.else.0         # ir inst 11 fin
.F._14su0eKxQra_analyze_compression_potential._3.if.then.0:
  li t4, 1143040
  add t4, a0, t4                                                        # ir inst 12 fin
  mv t3, t6                                                             # ir inst 13 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 14 fin
  lw t4, 0(s11)                                                         # ir inst 15 fin
  li t2, 1000
  mul t3, t4, t2                                                        # ir inst 16 fin
  li s11, 20000
  add s11, a0, s11                                                      # ir inst 17 fin
  lw s10, 0(s11)                                                        # ir inst 18 fin
  div s11, t3, s10                                                      # ir inst 19 fin
# Phi connections
  mv t3, s11
  li s11, 0
  j .F._14su0eKxQra_analyze_compression_potential._4.while.cond.1       # ir inst 20 fin
.F._14su0eKxQra_analyze_compression_potential._4.while.cond.1:
  li t2, 1
  slt s10, t2, t3                                                       # ir inst 23 fin
  bnez s10, .F._14su0eKxQra_analyze_compression_potential._5.while.body.1
  j .F._14su0eKxQra_analyze_compression_potential._6.while.exit.1       # ir inst 24 fin
.F._14su0eKxQra_analyze_compression_potential._5.while.body.1:
  addi s10, s11, 1                                                      # ir inst 25 fin
  li t2, 2
  div s9, t3, t2                                                        # ir inst 26 fin
# Phi connections
  mv s11, s10
  mv t3, s9
  j .F._14su0eKxQra_analyze_compression_potential._4.while.cond.1       # ir inst 27 fin
.F._14su0eKxQra_analyze_compression_potential._6.while.exit.1:
  mul t3, t4, s11                                                       # ir inst 28 fin
  add t4, t5, t3                                                        # ir inst 29 fin
  li t3, 1164544
  add t3, a0, t3                                                        # ir inst 30 fin
  mv s10, t6                                                            # ir inst 31 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 32 fin
  li t2, 0
  slt t3, t2, s11                                                       # ir inst 33 fin
  bnez t3, .F._14su0eKxQra_analyze_compression_potential._7.if.then.1
  j .F._14su0eKxQra_analyze_compression_potential._8.if.else.1          # ir inst 34 fin
.F._14su0eKxQra_analyze_compression_potential._7.if.then.1:
# Phi connections
  mv t3, s11
  j .F._14su0eKxQra_analyze_compression_potential._9.if.exit.1          # ir inst 35 fin
.F._14su0eKxQra_analyze_compression_potential._8.if.else.1:
# Phi connections
  li t3, 1
  j .F._14su0eKxQra_analyze_compression_potential._9.if.exit.1          # ir inst 36 fin
.F._14su0eKxQra_analyze_compression_potential._9.if.exit.1:
  sw t3, 0(s9)                                                          # ir inst 38 fin
# Phi connections
  j .F._14su0eKxQra_analyze_compression_potential._11.if.exit.0         # ir inst 39 fin
.F._14su0eKxQra_analyze_compression_potential._10.if.else.0:
# Phi connections
  mv t4, t5
  j .F._14su0eKxQra_analyze_compression_potential._11.if.exit.0         # ir inst 40 fin
.F._14su0eKxQra_analyze_compression_potential._11.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._14su0eKxQra_analyze_compression_potential._1.while.cond.0       # ir inst 43 fin
.F._14su0eKxQra_analyze_compression_potential._12.while.exit.0:
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 44 fin
  lw t4, 0(t6)                                                          # ir inst 45 fin
  slli t6, t4, 3                                                        # ir inst 46 fin
  sub t4, t6, t5                                                        # ir inst 47 fin
  mv a0, t4
  j .F._14su0eKxQra_analyze_compression_potential.epilogue              # ir inst 48 fin
.F._14su0eKxQra_analyze_compression_potential.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_find_longest_repeated_substring
.F._14su0eKxQra_find_longest_repeated_substring:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._14su0eKxQra_find_longest_repeated_substring._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._14su0eKxQra_find_longest_repeated_substring._1.while.cond.0     # ir inst 1 fin
.F._14su0eKxQra_find_longest_repeated_substring._1.while.cond.0:
  li t4, 20000
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  addi t4, t3, -1                                                       # ir inst 6 fin
  slt t3, t6, t4                                                        # ir inst 7 fin
  bnez t3, .F._14su0eKxQra_find_longest_repeated_substring._2.while.body.0
  j .F._14su0eKxQra_find_longest_repeated_substring._6.while.exit.0     # ir inst 8 fin
.F._14su0eKxQra_find_longest_repeated_substring._2.while.body.0:
  li t4, 80208
  add t4, a0, t4                                                        # ir inst 9 fin
  mv t3, t6                                                             # ir inst 10 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 11 fin
  lw t4, 0(s11)                                                         # ir inst 12 fin
  slt t3, t5, t4                                                        # ir inst 13 fin
  bnez t3, .F._14su0eKxQra_find_longest_repeated_substring._3.if.then.0
  j .F._14su0eKxQra_find_longest_repeated_substring._4.if.else.0        # ir inst 14 fin
.F._14su0eKxQra_find_longest_repeated_substring._3.if.then.0:
  li t4, 80208
  add t4, a0, t4                                                        # ir inst 15 fin
  mv t3, t6                                                             # ir inst 16 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 17 fin
  lw t4, 0(s11)                                                         # ir inst 18 fin
# Phi connections
  j .F._14su0eKxQra_find_longest_repeated_substring._5.if.exit.0        # ir inst 19 fin
.F._14su0eKxQra_find_longest_repeated_substring._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F._14su0eKxQra_find_longest_repeated_substring._5.if.exit.0        # ir inst 20 fin
.F._14su0eKxQra_find_longest_repeated_substring._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._14su0eKxQra_find_longest_repeated_substring._1.while.cond.0     # ir inst 23 fin
.F._14su0eKxQra_find_longest_repeated_substring._6.while.exit.0:
  mv a0, t5
  j .F._14su0eKxQra_find_longest_repeated_substring.epilogue            # ir inst 24 fin
.F._14su0eKxQra_find_longest_repeated_substring.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._14su0eKxQra_perform_comprehensive_analysis
.F._14su0eKxQra_perform_comprehensive_analysis:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F._14su0eKxQra_perform_comprehensive_analysis._0.entry.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_perform_comprehensive_analysis._1.while.cond.0      # ir inst 1 fin
.F._14su0eKxQra_perform_comprehensive_analysis._1.while.cond.0:
  li t5, 60204
  add t5, a0, t5                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  slt t5, t6, t4                                                        # ir inst 5 fin
  bnez t5, .F._14su0eKxQra_perform_comprehensive_analysis._2.while.body.0
  j .F._14su0eKxQra_perform_comprehensive_analysis._3.while.exit.0      # ir inst 6 fin
.F._14su0eKxQra_perform_comprehensive_analysis._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F._14su0eKxQra_kmp_search
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F._14su0eKxQra_boyer_moore_search
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F._14su0eKxQra_rabin_karp_search
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_perform_comprehensive_analysis._1.while.cond.0      # ir inst 11 fin
.F._14su0eKxQra_perform_comprehensive_analysis._3.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._14su0eKxQra_analyze_compression_potential
  mv t6, a0
  ld a0, 0(sp)
# ir inst 12 fin
  li t5, 1185784
  add t5, a0, t5                                                        # ir inst 13 fin
  addi t4, t5, 12                                                       # ir inst 14 fin
  sw t6, 0(t4)                                                          # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._14su0eKxQra_find_longest_repeated_substring
  mv t6, a0
  ld a0, 0(sp)
# ir inst 16 fin
  li t5, 1185784
  add t5, a0, t5                                                        # ir inst 17 fin
  addi t4, t5, 16                                                       # ir inst 18 fin
  sw t6, 0(t4)                                                          # ir inst 19 fin
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 20 fin
  lw t5, 0(t6)                                                          # ir inst 21 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 22 fin
  bnez t6, .F._14su0eKxQra_perform_comprehensive_analysis._4.if.then.0
  j .F._14su0eKxQra_perform_comprehensive_analysis._5.if.else.0         # ir inst 23 fin
.F._14su0eKxQra_perform_comprehensive_analysis._4.if.then.0:
  li t6, 20000
  add t6, a0, t6                                                        # ir inst 24 fin
  lw t5, 0(t6)                                                          # ir inst 25 fin
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 26 fin
  lw t4, 0(t6)                                                          # ir inst 27 fin
  div t6, t5, t4                                                        # ir inst 28 fin
# Phi connections
  j .F._14su0eKxQra_perform_comprehensive_analysis._6.if.exit.0         # ir inst 29 fin
.F._14su0eKxQra_perform_comprehensive_analysis._5.if.else.0:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_perform_comprehensive_analysis._6.if.exit.0         # ir inst 30 fin
.F._14su0eKxQra_perform_comprehensive_analysis._6.if.exit.0:
  li t5, 1165580
  add t5, a0, t5                                                        # ir inst 32 fin
  lw t4, 0(t5)                                                          # ir inst 33 fin
  li t2, 100
  mul t5, t4, t2                                                        # ir inst 34 fin
  li t2, 256
  div t4, t5, t2                                                        # ir inst 35 fin
  li t5, 1185784
  add t5, a0, t5                                                        # ir inst 36 fin
  addi t3, t5, 20                                                       # ir inst 37 fin
  sw t6, 0(t3)                                                          # ir inst 38 fin
  li t6, 1185784
  add t6, a0, t6                                                        # ir inst 39 fin
  addi t5, t6, 24                                                       # ir inst 40 fin
  sw t4, 0(t5)                                                          # ir inst 41 fin
  j .F._14su0eKxQra_perform_comprehensive_analysis.epilogue             # ir inst 42 fin
.F._14su0eKxQra_perform_comprehensive_analysis.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._14su0eKxQra_output_results
.F._14su0eKxQra_output_results:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F._14su0eKxQra_output_results._0.entry.0:
  li t6, 20000
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
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 6 fin
  li t6, 1165572
  add t6, a0, t6                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 9 fin
  li t6, 1165576
  add t6, a0, t6                                                        # ir inst 10 fin
  lw t5, 0(t6)                                                          # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 12 fin
  li t6, 1165580
  add t6, a0, t6                                                        # ir inst 13 fin
  lw t5, 0(t6)                                                          # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 15 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_output_results._1.while.cond.0                      # ir inst 16 fin
.F._14su0eKxQra_output_results._1.while.cond.0:
  li t5, 60204
  add t5, a0, t5                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  slt t5, t6, t4                                                        # ir inst 20 fin
  bnez t5, .F._14su0eKxQra_output_results._2.while.body.0
  j .F._14su0eKxQra_output_results._3.while.exit.0                      # ir inst 21 fin
.F._14su0eKxQra_output_results._2.while.body.0:
  li t5, 1185584
  add t5, a0, t5                                                        # ir inst 22 fin
  mv t4, t6                                                             # ir inst 23 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 24 fin
  lw t5, 0(t3)                                                          # ir inst 25 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 26 fin
  addi t5, t6, 1                                                        # ir inst 27 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_output_results._1.while.cond.0                      # ir inst 28 fin
.F._14su0eKxQra_output_results._3.while.exit.0:
  li t6, 1185824
  add t6, a0, t6                                                        # ir inst 29 fin
  lw t5, 0(t6)                                                          # ir inst 30 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 31 fin
  li t6, 1185828
  add t6, a0, t6                                                        # ir inst 32 fin
  lw t5, 0(t6)                                                          # ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 34 fin
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_output_results._4.while.cond.1                      # ir inst 35 fin
.F._14su0eKxQra_output_results._4.while.cond.1:
  li t2, 7
  slt t5, t6, t2                                                        # ir inst 37 fin
  bnez t5, .F._14su0eKxQra_output_results._5.while.body.1
  j .F._14su0eKxQra_output_results._6.while.exit.1                      # ir inst 38 fin
.F._14su0eKxQra_output_results._5.while.body.1:
  li t5, 1185784
  add t5, a0, t5                                                        # ir inst 39 fin
  mv t4, t6                                                             # ir inst 40 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 41 fin
  lw t5, 0(t3)                                                          # ir inst 42 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 43 fin
  addi t5, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_output_results._4.while.cond.1                      # ir inst 45 fin
.F._14su0eKxQra_output_results._6.while.exit.1:
# Phi connections
  li t6, 0
  j .F._14su0eKxQra_output_results._7.while.cond.2                      # ir inst 46 fin
.F._14su0eKxQra_output_results._7.while.cond.2:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 48 fin
  bnez t5, .F._14su0eKxQra_output_results._8.lazy.then.0
  j .F._14su0eKxQra_output_results._9.lazy.else.0                       # ir inst 49 fin
.F._14su0eKxQra_output_results._8.lazy.then.0:
  li t5, 20000
  add t5, a0, t5                                                        # ir inst 50 fin
  lw t4, 0(t5)                                                          # ir inst 51 fin
  slt t5, t6, t4                                                        # ir inst 52 fin
# Phi connections
  j .F._14su0eKxQra_output_results._10.lazy.exit.0                      # ir inst 53 fin
.F._14su0eKxQra_output_results._9.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._14su0eKxQra_output_results._10.lazy.exit.0                      # ir inst 54 fin
.F._14su0eKxQra_output_results._10.lazy.exit.0:
  bnez t5, .F._14su0eKxQra_output_results._11.while.body.2
  j .F._14su0eKxQra_output_results._12.while.exit.2                     # ir inst 56 fin
.F._14su0eKxQra_output_results._11.while.body.2:
  li t5, 60208
  add t5, a0, t5                                                        # ir inst 57 fin
  mv t4, t6                                                             # ir inst 58 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 59 fin
  lw t5, 0(t3)                                                          # ir inst 60 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 61 fin
  addi t5, t6, 1                                                        # ir inst 62 fin
# Phi connections
  mv t6, t5
  j .F._14su0eKxQra_output_results._7.while.cond.2                      # ir inst 63 fin
.F._14su0eKxQra_output_results._12.while.exit.2:
  li t6, 1185824
  add t6, a0, t6                                                        # ir inst 64 fin
  lw t5, 0(t6)                                                          # ir inst 65 fin
  li t6, 60204
  add t6, a0, t6                                                        # ir inst 66 fin
  lw t4, 0(t6)                                                          # ir inst 67 fin
  addi t6, t4, 1                                                        # ir inst 68 fin
  div t4, t5, t6                                                        # ir inst 69 fin
  li t6, 1165580
  add t6, a0, t6                                                        # ir inst 70 fin
  lw t5, 0(t6)                                                          # ir inst 71 fin
  li t6, 1165568
  add t6, a0, t6                                                        # ir inst 72 fin
  lw t3, 0(t6)                                                          # ir inst 73 fin
  mul t6, t5, t3                                                        # ir inst 74 fin
  li t2, 100
  div t5, t6, t2                                                        # ir inst 75 fin
  add t6, t4, t5                                                        # ir inst 76 fin
  li t5, 1185784
  add t5, a0, t5                                                        # ir inst 77 fin
  addi t4, t5, 12                                                       # ir inst 78 fin
  lw t5, 0(t4)                                                          # ir inst 79 fin
  add t4, t6, t5                                                        # ir inst 80 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 81 fin
  j .F._14su0eKxQra_output_results.epilogue                             # ir inst 82 fin
.F._14su0eKxQra_output_results.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F._jssiMt4YUJe_new
.F._jssiMt4YUJe_new:
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 100,                range:       40(sp) -      140(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd ra, 32(sp)
.F._jssiMt4YUJe_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._jssiMt4YUJe_new._1.array.cond.0                                 # ir inst 3 fin
.F._jssiMt4YUJe_new._1.array.cond.0:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F._jssiMt4YUJe_new._2.array.body.0
  j .F._jssiMt4YUJe_new._3.array.exit.0                                 # ir inst 6 fin
.F._jssiMt4YUJe_new._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F._jssiMt4YUJe_new._1.array.cond.0                                 # ir inst 10 fin
.F._jssiMt4YUJe_new._3.array.exit.0:
  addi t6, a0, 400                                                      # ir inst 11 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 404                                                      # ir inst 13 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t4, 0
  j .F._jssiMt4YUJe_new._4.array.cond.1                                 # ir inst 16 fin
.F._jssiMt4YUJe_new._4.array.cond.1:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 18 fin
  bnez t3, .F._jssiMt4YUJe_new._5.array.body.1
  j .F._jssiMt4YUJe_new._6.array.exit.1                                 # ir inst 19 fin
.F._jssiMt4YUJe_new._5.array.body.1:
  add t3, t5, t4                                                        # ir inst 20 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 21 fin
  addi t3, t4, 1                                                        # ir inst 22 fin
# Phi connections
  mv t4, t3
  j .F._jssiMt4YUJe_new._4.array.cond.1                                 # ir inst 23 fin
.F._jssiMt4YUJe_new._6.array.exit.1:
  addi t5, t6, 0                                                        # ir inst 24 fin
# Phi connections
  li t6, 0
  j .F._jssiMt4YUJe_new._7.array.cond.2                                 # ir inst 25 fin
.F._jssiMt4YUJe_new._7.array.cond.2:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 27 fin
  bnez t4, .F._jssiMt4YUJe_new._8.array.body.2
  j .F._jssiMt4YUJe_new._9.array.exit.2                                 # ir inst 28 fin
.F._jssiMt4YUJe_new._8.array.body.2:
  li t1, 100
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 100
  addi t1, sp, 40
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 30 fin
  addi t4, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t6, t4
  j .F._jssiMt4YUJe_new._7.array.cond.2                                 # ir inst 32 fin
.F._jssiMt4YUJe_new._9.array.exit.2:
  li t6, 10404
  add t6, a0, t6                                                        # ir inst 33 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 34 fin
  li t6, 10408
  add t6, a0, t6                                                        # ir inst 35 fin
  li t1, 0
  sb t1, 0(t6)                                                          # ir inst 36 fin
  j .F._jssiMt4YUJe_new.epilogue                                        # ir inst 37 fin
.F._jssiMt4YUJe_new.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 144
  ret

.globl .F._jssiMt4YUJe_compile_pattern
.F._jssiMt4YUJe_compile_pattern:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._jssiMt4YUJe_compile_pattern._0.entry.0:
  addi t6, a0, 400                                                      # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F._jssiMt4YUJe_compile_pattern._1.while.cond.0                     # ir inst 3 fin
.F._jssiMt4YUJe_compile_pattern._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 5 fin
  bnez t5, .F._jssiMt4YUJe_compile_pattern._2.while.body.0
  j .F._jssiMt4YUJe_compile_pattern._3.while.exit.0                     # ir inst 6 fin
.F._jssiMt4YUJe_compile_pattern._2.while.body.0:
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
  j .F._jssiMt4YUJe_compile_pattern._1.while.cond.0                     # ir inst 13 fin
.F._jssiMt4YUJe_compile_pattern._3.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  call .F._jssiMt4YUJe_build_nfa
  ld a0, 0(sp)
# ir inst 14 fin
  j .F._jssiMt4YUJe_compile_pattern.epilogue                            # ir inst 15 fin
.F._jssiMt4YUJe_compile_pattern.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._jssiMt4YUJe_build_nfa
.F._jssiMt4YUJe_build_nfa:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._jssiMt4YUJe_build_nfa._0.entry.0:
  li t6, 10404
  add t6, a0, t6                                                        # ir inst 1 fin
  addi t5, a0, 400                                                      # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
# Phi connections
  li t6, 0
  j .F._jssiMt4YUJe_build_nfa._1.while.cond.0                           # ir inst 6 fin
.F._jssiMt4YUJe_build_nfa._1.while.cond.0:
  li t5, 10404
  add t5, a0, t5                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  slt t5, t6, t4                                                        # ir inst 10 fin
  bnez t5, .F._jssiMt4YUJe_build_nfa._2.while.body.0
  j .F._jssiMt4YUJe_build_nfa._6.while.exit.0                           # ir inst 11 fin
.F._jssiMt4YUJe_build_nfa._2.while.body.0:
# Phi connections
  li t5, 0
  j .F._jssiMt4YUJe_build_nfa._3.while.cond.1                           # ir inst 12 fin
.F._jssiMt4YUJe_build_nfa._3.while.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 14 fin
  bnez t4, .F._jssiMt4YUJe_build_nfa._4.while.body.1
  j .F._jssiMt4YUJe_build_nfa._5.while.exit.1                           # ir inst 15 fin
.F._jssiMt4YUJe_build_nfa._4.while.body.1:
  addi t4, a0, 404                                                      # ir inst 16 fin
  mv t3, t6                                                             # ir inst 17 fin
  li t1, 100
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 18 fin
  mv t4, t5                                                             # ir inst 19 fin
  add t3, s11, t4                                                       # ir inst 20 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 21 fin
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  j .F._jssiMt4YUJe_build_nfa._3.while.cond.1                           # ir inst 23 fin
.F._jssiMt4YUJe_build_nfa._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t6, t5
  j .F._jssiMt4YUJe_build_nfa._1.while.cond.0                           # ir inst 25 fin
.F._jssiMt4YUJe_build_nfa._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F._jssiMt4YUJe_build_nfa._7.while.cond.2                           # ir inst 26 fin
.F._jssiMt4YUJe_build_nfa._7.while.cond.2:
  addi t5, a0, 400                                                      # ir inst 28 fin
  lw t4, 0(t5)                                                          # ir inst 29 fin
  slt t5, t6, t4                                                        # ir inst 30 fin
  bnez t5, .F._jssiMt4YUJe_build_nfa._8.while.body.2
  j .F._jssiMt4YUJe_build_nfa._15.while.exit.2                          # ir inst 31 fin
.F._jssiMt4YUJe_build_nfa._8.while.body.2:
  addi t5, a0, 0                                                        # ir inst 32 fin
  mv t4, t6                                                             # ir inst 33 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 34 fin
  lw t5, 0(t3)                                                          # ir inst 35 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 36 fin
  bnez t4, .F._jssiMt4YUJe_build_nfa._9.lazy.then.0
  j .F._jssiMt4YUJe_build_nfa._10.lazy.else.0                           # ir inst 37 fin
.F._jssiMt4YUJe_build_nfa._9.lazy.then.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 38 fin
# Phi connections
  j .F._jssiMt4YUJe_build_nfa._11.lazy.exit.0                           # ir inst 39 fin
.F._jssiMt4YUJe_build_nfa._10.lazy.else.0:
# Phi connections
  li t4, 0
  j .F._jssiMt4YUJe_build_nfa._11.lazy.exit.0                           # ir inst 40 fin
.F._jssiMt4YUJe_build_nfa._11.lazy.exit.0:
  bnez t4, .F._jssiMt4YUJe_build_nfa._12.if.then.0
  j .F._jssiMt4YUJe_build_nfa._13.if.else.0                             # ir inst 42 fin
.F._jssiMt4YUJe_build_nfa._12.if.then.0:
  addi t4, a0, 404                                                      # ir inst 43 fin
  mv t3, t6                                                             # ir inst 44 fin
  li t1, 100
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 45 fin
  mv t4, t5                                                             # ir inst 46 fin
  add t5, s11, t4                                                       # ir inst 47 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 48 fin
  j .F._jssiMt4YUJe_build_nfa._14.if.exit.0                             # ir inst 49 fin
.F._jssiMt4YUJe_build_nfa._13.if.else.0:
  j .F._jssiMt4YUJe_build_nfa._14.if.exit.0                             # ir inst 50 fin
.F._jssiMt4YUJe_build_nfa._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 51 fin
# Phi connections
  mv t6, t5
  j .F._jssiMt4YUJe_build_nfa._7.while.cond.2                           # ir inst 52 fin
.F._jssiMt4YUJe_build_nfa._15.while.exit.2:
  j .F._jssiMt4YUJe_build_nfa.epilogue                                  # ir inst 53 fin
.F._jssiMt4YUJe_build_nfa.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._jssiMt4YUJe_match_text
.F._jssiMt4YUJe_match_text:
# spill func args num: 0,             range:      224(sp) -      224(sp)
# local var size: 200,                range:       16(sp) -      216(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -224
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._jssiMt4YUJe_match_text._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F._jssiMt4YUJe_match_text._1.array.cond.0                          # ir inst 3 fin
.F._jssiMt4YUJe_match_text._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F._jssiMt4YUJe_match_text._2.array.body.0
  j .F._jssiMt4YUJe_match_text._3.array.exit.0                          # ir inst 6 fin
.F._jssiMt4YUJe_match_text._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F._jssiMt4YUJe_match_text._1.array.cond.0                          # ir inst 10 fin
.F._jssiMt4YUJe_match_text._3.array.exit.0:
  addi t1, sp, 116
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F._jssiMt4YUJe_match_text._4.array.cond.1                          # ir inst 13 fin
.F._jssiMt4YUJe_match_text._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F._jssiMt4YUJe_match_text._5.array.body.1
  j .F._jssiMt4YUJe_match_text._6.array.exit.1                          # ir inst 16 fin
.F._jssiMt4YUJe_match_text._5.array.body.1:
  add t4, t6, t5                                                        # ir inst 17 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F._jssiMt4YUJe_match_text._4.array.cond.1                          # ir inst 20 fin
.F._jssiMt4YUJe_match_text._6.array.exit.1:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 21 fin
  li t1, 1
  sb t1, 0(t6)                                                          # ir inst 22 fin
# Phi connections
  li t6, 0
  j .F._jssiMt4YUJe_match_text._7.while.cond.0                          # ir inst 23 fin
.F._jssiMt4YUJe_match_text._7.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 25 fin
  bnez t5, .F._jssiMt4YUJe_match_text._8.while.body.0
  j .F._jssiMt4YUJe_match_text._33.while.exit.0                         # ir inst 26 fin
.F._jssiMt4YUJe_match_text._8.while.body.0:
  mv t5, t6                                                             # ir inst 27 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 28 fin
  lw t5, 0(t4)                                                          # ir inst 29 fin
# Phi connections
  li t4, 0
  j .F._jssiMt4YUJe_match_text._9.while.cond.1                          # ir inst 30 fin
.F._jssiMt4YUJe_match_text._9.while.cond.1:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 32 fin
  bnez t3, .F._jssiMt4YUJe_match_text._10.while.body.1
  j .F._jssiMt4YUJe_match_text._11.while.exit.1                         # ir inst 33 fin
.F._jssiMt4YUJe_match_text._10.while.body.1:
  mv t3, t4                                                             # ir inst 34 fin
  addi t1, sp, 116
  add s11, t1, t3                                                       # ir inst 35 fin
  li t1, 0
  sb t1, 0(s11)                                                         # ir inst 36 fin
  addi t3, t4, 1                                                        # ir inst 37 fin
# Phi connections
  mv t4, t3
  j .F._jssiMt4YUJe_match_text._9.while.cond.1                          # ir inst 38 fin
.F._jssiMt4YUJe_match_text._11.while.exit.1:
# Phi connections
  li t4, 0
  j .F._jssiMt4YUJe_match_text._12.while.cond.2                         # ir inst 39 fin
.F._jssiMt4YUJe_match_text._12.while.cond.2:
  li t3, 10404
  add t3, a0, t3                                                        # ir inst 41 fin
  lw s11, 0(t3)                                                         # ir inst 42 fin
  slt t3, t4, s11                                                       # ir inst 43 fin
  bnez t3, .F._jssiMt4YUJe_match_text._13.while.body.2
  j .F._jssiMt4YUJe_match_text._29.while.exit.2                         # ir inst 44 fin
.F._jssiMt4YUJe_match_text._13.while.body.2:
  mv t3, t4                                                             # ir inst 45 fin
  addi t1, sp, 16
  add s11, t1, t3                                                       # ir inst 46 fin
  lb t3, 0(s11)                                                         # ir inst 47 fin
  bnez t3, .F._jssiMt4YUJe_match_text._14.if.then.0
  j .F._jssiMt4YUJe_match_text._27.if.else.0                            # ir inst 48 fin
.F._jssiMt4YUJe_match_text._14.if.then.0:
  addi t3, a0, 400                                                      # ir inst 49 fin
  lw s11, 0(t3)                                                         # ir inst 50 fin
  slt t3, t4, s11                                                       # ir inst 51 fin
  bnez t3, .F._jssiMt4YUJe_match_text._15.lazy.then.0
  j .F._jssiMt4YUJe_match_text._16.lazy.else.0                          # ir inst 52 fin
.F._jssiMt4YUJe_match_text._15.lazy.then.0:
  li t2, 0
  slt t0, t5, t2
  xori t3, t0, 1                                                        # ir inst 53 fin
# Phi connections
  j .F._jssiMt4YUJe_match_text._17.lazy.exit.0                          # ir inst 54 fin
.F._jssiMt4YUJe_match_text._16.lazy.else.0:
# Phi connections
  li t3, 0
  j .F._jssiMt4YUJe_match_text._17.lazy.exit.0                          # ir inst 55 fin
.F._jssiMt4YUJe_match_text._17.lazy.exit.0:
  bnez t3, .F._jssiMt4YUJe_match_text._18.lazy.then.1
  j .F._jssiMt4YUJe_match_text._19.lazy.else.1                          # ir inst 57 fin
.F._jssiMt4YUJe_match_text._18.lazy.then.1:
  li t2, 100
  slt t3, t5, t2                                                        # ir inst 58 fin
# Phi connections
  j .F._jssiMt4YUJe_match_text._20.lazy.exit.1                          # ir inst 59 fin
.F._jssiMt4YUJe_match_text._19.lazy.else.1:
# Phi connections
  li t3, 0
  j .F._jssiMt4YUJe_match_text._20.lazy.exit.1                          # ir inst 60 fin
.F._jssiMt4YUJe_match_text._20.lazy.exit.1:
  bnez t3, .F._jssiMt4YUJe_match_text._21.lazy.then.2
  j .F._jssiMt4YUJe_match_text._22.lazy.else.2                          # ir inst 62 fin
.F._jssiMt4YUJe_match_text._21.lazy.then.2:
  addi t3, a0, 404                                                      # ir inst 63 fin
  mv s11, t4                                                            # ir inst 64 fin
  li t1, 100
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 65 fin
  mv t3, t5                                                             # ir inst 66 fin
  add s11, s10, t3                                                      # ir inst 67 fin
  lb t3, 0(s11)                                                         # ir inst 68 fin
# Phi connections
  j .F._jssiMt4YUJe_match_text._23.lazy.exit.2                          # ir inst 69 fin
.F._jssiMt4YUJe_match_text._22.lazy.else.2:
# Phi connections
  li t3, 0
  j .F._jssiMt4YUJe_match_text._23.lazy.exit.2                          # ir inst 70 fin
.F._jssiMt4YUJe_match_text._23.lazy.exit.2:
  bnez t3, .F._jssiMt4YUJe_match_text._24.if.then.1
  j .F._jssiMt4YUJe_match_text._25.if.else.1                            # ir inst 72 fin
.F._jssiMt4YUJe_match_text._24.if.then.1:
  addi t3, t4, 1                                                        # ir inst 73 fin
  mv s11, t3                                                            # ir inst 74 fin
  addi t1, sp, 116
  add t3, t1, s11                                                       # ir inst 75 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 76 fin
  j .F._jssiMt4YUJe_match_text._26.if.exit.1                            # ir inst 77 fin
.F._jssiMt4YUJe_match_text._25.if.else.1:
  j .F._jssiMt4YUJe_match_text._26.if.exit.1                            # ir inst 78 fin
.F._jssiMt4YUJe_match_text._26.if.exit.1:
  j .F._jssiMt4YUJe_match_text._28.if.exit.0                            # ir inst 79 fin
.F._jssiMt4YUJe_match_text._27.if.else.0:
  j .F._jssiMt4YUJe_match_text._28.if.exit.0                            # ir inst 80 fin
.F._jssiMt4YUJe_match_text._28.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 81 fin
# Phi connections
  mv t4, t3
  j .F._jssiMt4YUJe_match_text._12.while.cond.2                         # ir inst 82 fin
.F._jssiMt4YUJe_match_text._29.while.exit.2:
# Phi connections
  li t5, 0
  j .F._jssiMt4YUJe_match_text._30.while.cond.3                         # ir inst 83 fin
.F._jssiMt4YUJe_match_text._30.while.cond.3:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 85 fin
  bnez t4, .F._jssiMt4YUJe_match_text._31.while.body.3
  j .F._jssiMt4YUJe_match_text._32.while.exit.3                         # ir inst 86 fin
.F._jssiMt4YUJe_match_text._31.while.body.3:
  mv t4, t5                                                             # ir inst 87 fin
  addi t1, sp, 16
  add t3, t1, t4                                                        # ir inst 88 fin
  mv t4, t5                                                             # ir inst 89 fin
  addi t1, sp, 116
  add s11, t1, t4                                                       # ir inst 90 fin
  lb t4, 0(s11)                                                         # ir inst 91 fin
  sb t4, 0(t3)                                                          # ir inst 92 fin
  addi t4, t5, 1                                                        # ir inst 93 fin
# Phi connections
  mv t5, t4
  j .F._jssiMt4YUJe_match_text._30.while.cond.3                         # ir inst 94 fin
.F._jssiMt4YUJe_match_text._32.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 95 fin
# Phi connections
  mv t6, t5
  j .F._jssiMt4YUJe_match_text._7.while.cond.0                          # ir inst 96 fin
.F._jssiMt4YUJe_match_text._33.while.exit.0:
  addi t6, a0, 400                                                      # ir inst 97 fin
  lw t5, 0(t6)                                                          # ir inst 98 fin
  mv t6, t5                                                             # ir inst 99 fin
  addi t1, sp, 16
  add t5, t1, t6                                                        # ir inst 100 fin
  lb t6, 0(t5)                                                          # ir inst 101 fin
  mv a0, t6
  j .F._jssiMt4YUJe_match_text.epilogue                                 # ir inst 102 fin
.F._jssiMt4YUJe_match_text.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 224
  ret

.globl main
main:
# spill func args num: 0,             range:  1196320(sp) -  1196320(sp)
# local var size: 1196244,            range:       72(sp) -  1196316(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 5 / 12,        range:       24(sp) -       64(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -1196320
  add sp, sp, t0
  sd s7, 24(sp)
  sd s8, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd s9, 56(sp)
  sd ra, 64(sp)
main._0.entry.0:
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F._14su0eKxQra_new
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
  call .F._14su0eKxQra_initialize_text
  ld t6, 0(sp)
# ir inst 4 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 5 fin
# Phi connections
  li t5, 0
  j main._1.while.cond.0                                                # ir inst 6 fin
main._1.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 8 fin
  bnez t4, main._2.while.body.0
  j main._3.while.exit.0                                                # ir inst 9 fin
main._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 10 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  addi t1, sp, 72
  mv a0, t1
  call .F._14su0eKxQra_add_pattern
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 11 fin
  addi t4, t5, 1                                                        # ir inst 12 fin
# Phi connections
  mv t5, t4
  j main._1.while.cond.0                                                # ir inst 13 fin
main._3.while.exit.0:
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F._14su0eKxQra_perform_comprehensive_analysis
# ir inst 14 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  call getInt
  mv t5, a0
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a2, t5
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call .F._14su0eKxQra_compute_edit_distance
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 18 fin
# Start call preparation
  li t1, 1185904
  add t1, sp, t1
  mv a0, t1
  call .F._jssiMt4YUJe_new
# ir inst 20 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 21 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  li t1, 1185904
  add t1, sp, t1
  mv a0, t1
  call .F._jssiMt4YUJe_compile_pattern
  ld t6, 0(sp)
# ir inst 22 fin
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 23 fin
  addi t1, sp, 72
  li t5, 20000
  add t5, t1, t5                                                        # ir inst 24 fin
  lw t4, 0(t5)                                                          # ir inst 25 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a2, t4
  mv a1, t6
  li t1, 1185904
  add t1, sp, t1
  mv a0, t1
  call .F._jssiMt4YUJe_match_text
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 26 fin
  bnez t5, main._4.if.then.0
  j main._5.if.else.0                                                   # ir inst 27 fin
main._4.if.then.0:
# Phi connections
  li t6, 1
  j main._6.if.exit.0                                                   # ir inst 28 fin
main._5.if.else.0:
# Phi connections
  li t6, 0
  j main._6.if.exit.0                                                   # ir inst 29 fin
main._6.if.exit.0:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 31 fin
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F._14su0eKxQra_output_results
# ir inst 32 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 33 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._7.while.cond.1                                                # ir inst 34 fin
main._7.while.cond.1:
  slt t3, t5, t6                                                        # ir inst 37 fin
  bnez t3, main._8.while.body.1
  j main._24.while.exit.1                                               # ir inst 38 fin
main._8.while.body.1:
  li t2, 7
  mul t3, t5, t2                                                        # ir inst 39 fin
  addi s11, t3, 3                                                       # ir inst 40 fin
  li t2, 26
  rem t3, s11, t2                                                       # ir inst 41 fin
# Phi connections
  li s11, 0
  j main._9.while.cond.2                                                # ir inst 42 fin
main._9.while.cond.2:
  addi t1, sp, 72
  li s10, 20000
  add s10, t1, s10                                                      # ir inst 44 fin
  lw s9, 0(s10)                                                         # ir inst 45 fin
  slt s10, s11, s9                                                      # ir inst 46 fin
  bnez s10, main._10.while.body.2
  j main._23.while.exit.2                                               # ir inst 47 fin
main._10.while.body.2:
  addi t1, sp, 72
  addi s10, t1, 0                                                       # ir inst 48 fin
  mv s9, s11                                                            # ir inst 49 fin
  slli t2, s9, 2
  add s8, s10, t2                                                       # ir inst 50 fin
  lw s10, 0(s8)                                                         # ir inst 51 fin
  li t2, 65
  slt t0, s10, t2
  xori s9, t0, 1                                                        # ir inst 52 fin
  bnez s9, main._11.lazy.then.0
  j main._12.lazy.else.0                                                # ir inst 53 fin
main._11.lazy.then.0:
  li t2, 90
  slt t0, t2, s10
  xori s9, t0, 1                                                        # ir inst 54 fin
# Phi connections
  j main._13.lazy.exit.0                                                # ir inst 55 fin
main._12.lazy.else.0:
# Phi connections
  li s9, 0
  j main._13.lazy.exit.0                                                # ir inst 56 fin
main._13.lazy.exit.0:
  bnez s9, main._14.if.then.1
  j main._15.if.else.1                                                  # ir inst 58 fin
main._14.if.then.1:
  addi t1, sp, 72
  addi s9, t1, 0                                                        # ir inst 59 fin
  mv s8, s11                                                            # ir inst 60 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 61 fin
  addi s9, s10, -65                                                     # ir inst 62 fin
  add s8, s9, t3                                                        # ir inst 63 fin
  li t2, 26
  rem s9, s8, t2                                                        # ir inst 64 fin
  addi s8, s9, 65                                                       # ir inst 65 fin
  sw s8, 0(s7)                                                          # ir inst 66 fin
  j main._22.if.exit.1                                                  # ir inst 67 fin
main._15.if.else.1:
  li t2, 97
  slt t0, s10, t2
  xori s9, t0, 1                                                        # ir inst 68 fin
  bnez s9, main._16.lazy.then.1
  j main._17.lazy.else.1                                                # ir inst 69 fin
main._16.lazy.then.1:
  li t2, 122
  slt t0, t2, s10
  xori s9, t0, 1                                                        # ir inst 70 fin
# Phi connections
  j main._18.lazy.exit.1                                                # ir inst 71 fin
main._17.lazy.else.1:
# Phi connections
  li s9, 0
  j main._18.lazy.exit.1                                                # ir inst 72 fin
main._18.lazy.exit.1:
  bnez s9, main._19.if.then.2
  j main._20.if.else.2                                                  # ir inst 74 fin
main._19.if.then.2:
  addi t1, sp, 72
  addi s9, t1, 0                                                        # ir inst 75 fin
  mv s8, s11                                                            # ir inst 76 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 77 fin
  addi s9, s10, -97                                                     # ir inst 78 fin
  add s10, s9, t3                                                       # ir inst 79 fin
  li t2, 26
  rem s9, s10, t2                                                       # ir inst 80 fin
  addi s10, s9, 97                                                      # ir inst 81 fin
  sw s10, 0(s7)                                                         # ir inst 82 fin
  j main._21.if.exit.2                                                  # ir inst 83 fin
main._20.if.else.2:
  j main._21.if.exit.2                                                  # ir inst 84 fin
main._21.if.exit.2:
  j main._22.if.exit.1                                                  # ir inst 85 fin
main._22.if.exit.1:
  addi s10, s11, 1                                                      # ir inst 86 fin
# Phi connections
  mv s11, s10
  j main._9.while.cond.2                                                # ir inst 87 fin
main._23.while.exit.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 72
  mv a0, t1
  call .F._14su0eKxQra_analyze_text_statistics
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 88 fin
  addi t1, sp, 72
  li t3, 1165580
  add t3, t1, t3                                                        # ir inst 89 fin
  lw s11, 0(t3)                                                         # ir inst 90 fin
  add t3, t4, s11                                                       # ir inst 91 fin
  addi s11, t5, 1                                                       # ir inst 92 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._7.while.cond.1                                                # ir inst 93 fin
main._24.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 94 fin
  addi t1, sp, 72
  li t6, 1185824
  add t6, t1, t6                                                        # ir inst 95 fin
  lw t5, 0(t6)                                                          # ir inst 96 fin
  add t6, t5, t4                                                        # ir inst 97 fin
  addi t1, sp, 72
  li t5, 1165580
  add t5, t1, t5                                                        # ir inst 98 fin
  lw t4, 0(t5)                                                          # ir inst 99 fin
  mul t5, t6, t4                                                        # ir inst 100 fin
  li t2, 100
  div t6, t5, t2                                                        # ir inst 101 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 102 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 103 fin
  j main.epilogue                                                       # ir inst 104 fin
main.epilogue:
  ld ra, 64(sp)
  ld s7, 24(sp)
  ld s8, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  ld s9, 56(sp)
  li t0, 1196320
  add sp, sp, t0
  ret
