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
# spill func args num: 0,             range:    24640(sp) -    24640(sp)
# local var size: 24468,              range:      160(sp) -    24628(sp)
# return addr size: 8,                range:      152(sp) -      160(sp)
# callee save reg num: 9 / 12,        range:       80(sp) -      152(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -24640
  add sp, sp, t0
  sd s7, 80(sp)
  sd s10, 88(sp)
  sd s6, 96(sp)
  sd s1, 104(sp)
  sd s9, 112(sp)
  sd s5, 120(sp)
  sd s0, 128(sp)
  sd s11, 136(sp)
  sd s8, 144(sp)
  sd ra, 152(sp)
main._0.entry.0:
# Start call preparation
  li a0, 42
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 160
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 4 fin
main._1.array.cond.0:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 7 fin
main._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j main._1.array.cond.0                                                # ir inst 11 fin
main._3.array.exit.0:
  addi t1, sp, 1248
  addi t6, t1, 0                                                        # ir inst 14 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 15 fin
main._4.array.cond.1:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 17 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 18 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 22 fin
main._6.array.exit.1:
  addi t1, sp, 224
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 24 fin
main._7.array.cond.2:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 27 fin
main._8.array.body.2:
  slli t2, t5, 6
  add t4, t6, t2                                                        # ir inst 28 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 64
  addi t1, sp, 1248
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 31 fin
main._9.array.exit.2:
  addi t1, sp, 1312
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 34 fin
main._10.array.cond.3:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 36 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 37 fin
main._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 41 fin
main._12.array.exit.3:
  addi t1, sp, 1568
  addi t6, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t5, 0
  j main._13.array.cond.4                                               # ir inst 44 fin
main._13.array.cond.4:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 46 fin
  bnez t4, main._14.array.body.4
  j main._15.array.exit.4                                               # ir inst 47 fin
main._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 48 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 49 fin
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j main._13.array.cond.4                                               # ir inst 51 fin
main._15.array.exit.4:
  addi t1, sp, 1824
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j main._16.array.cond.5                                               # ir inst 54 fin
main._16.array.cond.5:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, main._17.array.body.5
  j main._18.array.exit.5                                               # ir inst 57 fin
main._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 58 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j main._16.array.cond.5                                               # ir inst 61 fin
main._18.array.exit.5:
  li t1, 2848
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 63 fin
# Phi connections
  li t5, 0
  j main._19.array.cond.6                                               # ir inst 64 fin
main._19.array.cond.6:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 66 fin
  bnez t4, main._20.array.body.6
  j main._21.array.exit.6                                               # ir inst 67 fin
main._20.array.body.6:
  add t4, t6, t5                                                        # ir inst 68 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 69 fin
  addi t4, t5, 1                                                        # ir inst 70 fin
# Phi connections
  mv t5, t4
  j main._19.array.cond.6                                               # ir inst 71 fin
main._21.array.exit.6:
  li t1, 3104
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 73 fin
# Phi connections
  li t5, 0
  j main._22.array.cond.7                                               # ir inst 74 fin
main._22.array.cond.7:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 76 fin
  bnez t4, main._23.array.body.7
  j main._24.array.exit.7                                               # ir inst 77 fin
main._23.array.body.7:
  add t4, t6, t5                                                        # ir inst 78 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 79 fin
  addi t4, t5, 1                                                        # ir inst 80 fin
# Phi connections
  mv t5, t4
  j main._22.array.cond.7                                               # ir inst 81 fin
main._24.array.exit.7:
# alloca %48
  li t2, 3360
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 83 fin
  li t1, 3364
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 85 fin
# Phi connections
  li t5, 0
  j main._25.array.cond.8                                               # ir inst 86 fin
main._25.array.cond.8:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 88 fin
  bnez t4, main._26.array.body.8
  j main._27.array.exit.8                                               # ir inst 89 fin
main._26.array.body.8:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 90 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 91 fin
  addi t4, t5, 1                                                        # ir inst 92 fin
# Phi connections
  mv t5, t4
  j main._25.array.cond.8                                               # ir inst 93 fin
main._27.array.exit.8:
  li t1, 8388
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 96 fin
# Phi connections
  li t5, 0
  j main._28.array.cond.9                                               # ir inst 97 fin
main._28.array.cond.9:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 99 fin
  bnez t4, main._29.array.body.9
  j main._30.array.exit.9                                               # ir inst 100 fin
main._29.array.body.9:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 101 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 102 fin
  addi t4, t5, 1                                                        # ir inst 103 fin
# Phi connections
  mv t5, t4
  j main._28.array.cond.9                                               # ir inst 104 fin
main._30.array.exit.9:
  li t1, 7364
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 105 fin
# Phi connections
  li t5, 0
  j main._31.array.cond.10                                              # ir inst 106 fin
main._31.array.cond.10:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 108 fin
  bnez t4, main._32.array.body.10
  j main._33.array.exit.10                                              # ir inst 109 fin
main._32.array.body.10:
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 110 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 8388
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 111 fin
  addi t4, t5, 1                                                        # ir inst 112 fin
# Phi connections
  mv t5, t4
  j main._31.array.cond.10                                              # ir inst 113 fin
main._33.array.exit.10:
  li t1, 9428
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 116 fin
# Phi connections
  li t5, 0
  j main._34.array.cond.11                                              # ir inst 117 fin
main._34.array.cond.11:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 119 fin
  bnez t4, main._35.array.body.11
  j main._36.array.exit.11                                              # ir inst 120 fin
main._35.array.body.11:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 121 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 122 fin
  addi t4, t5, 1                                                        # ir inst 123 fin
# Phi connections
  mv t5, t4
  j main._34.array.cond.11                                              # ir inst 124 fin
main._36.array.exit.11:
  li t1, 8404
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 125 fin
# Phi connections
  li t5, 0
  j main._37.array.cond.12                                              # ir inst 126 fin
main._37.array.cond.12:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 128 fin
  bnez t4, main._38.array.body.12
  j main._39.array.exit.12                                              # ir inst 129 fin
main._38.array.body.12:
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 130 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 9428
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 131 fin
  addi t4, t5, 1                                                        # ir inst 132 fin
# Phi connections
  mv t5, t4
  j main._37.array.cond.12                                              # ir inst 133 fin
main._39.array.exit.12:
  li t1, 9700
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 136 fin
# Phi connections
  li t5, 0
  j main._40.array.cond.13                                              # ir inst 137 fin
main._40.array.cond.13:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 139 fin
  bnez t4, main._41.array.body.13
  j main._42.array.exit.13                                              # ir inst 140 fin
main._41.array.body.13:
  add t4, t6, t5                                                        # ir inst 141 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 142 fin
  addi t4, t5, 1                                                        # ir inst 143 fin
# Phi connections
  mv t5, t4
  j main._40.array.cond.13                                              # ir inst 144 fin
main._42.array.exit.13:
  li t1, 9444
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 145 fin
# Phi connections
  li t5, 0
  j main._43.array.cond.14                                              # ir inst 146 fin
main._43.array.cond.14:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 148 fin
  bnez t4, main._44.array.body.14
  j main._45.array.exit.14                                              # ir inst 149 fin
main._44.array.body.14:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 150 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 4
  li t1, 9700
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 151 fin
  addi t4, t5, 1                                                        # ir inst 152 fin
# Phi connections
  mv t5, t4
  j main._43.array.cond.14                                              # ir inst 153 fin
main._45.array.exit.14:
  li t1, 10728
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 156 fin
# Phi connections
  li t5, 0
  j main._46.array.cond.15                                              # ir inst 157 fin
main._46.array.cond.15:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 159 fin
  bnez t4, main._47.array.body.15
  j main._48.array.exit.15                                              # ir inst 160 fin
main._47.array.body.15:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 161 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 162 fin
  addi t4, t5, 1                                                        # ir inst 163 fin
# Phi connections
  mv t5, t4
  j main._46.array.cond.15                                              # ir inst 164 fin
main._48.array.exit.15:
  li t1, 9704
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 165 fin
# Phi connections
  li t5, 0
  j main._49.array.cond.16                                              # ir inst 166 fin
main._49.array.cond.16:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 168 fin
  bnez t4, main._50.array.body.16
  j main._51.array.exit.16                                              # ir inst 169 fin
main._50.array.body.16:
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 170 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 10728
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 171 fin
  addi t4, t5, 1                                                        # ir inst 172 fin
# Phi connections
  mv t5, t4
  j main._49.array.cond.16                                              # ir inst 173 fin
main._51.array.exit.16:
  li t1, 14840
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 176 fin
# Phi connections
  li t5, 0
  j main._52.array.cond.17                                              # ir inst 177 fin
main._52.array.cond.17:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 179 fin
  bnez t4, main._53.array.body.17
  j main._54.array.exit.17                                              # ir inst 180 fin
main._53.array.body.17:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 181 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 182 fin
  addi t4, t5, 1                                                        # ir inst 183 fin
# Phi connections
  mv t5, t4
  j main._52.array.cond.17                                              # ir inst 184 fin
main._54.array.exit.17:
  li t1, 10744
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 185 fin
# Phi connections
  li t5, 0
  j main._55.array.cond.18                                              # ir inst 186 fin
main._55.array.cond.18:
  li t2, 128
  slt t4, t5, t2                                                        # ir inst 188 fin
  bnez t4, main._56.array.body.18
  j main._57.array.exit.18                                              # ir inst 189 fin
main._56.array.body.18:
  slli t2, t5, 5
  add t4, t6, t2                                                        # ir inst 190 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 32
  li t1, 14840
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 191 fin
  addi t4, t5, 1                                                        # ir inst 192 fin
# Phi connections
  mv t5, t4
  j main._55.array.cond.18                                              # ir inst 193 fin
main._57.array.exit.18:
  li t1, 18968
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 196 fin
# Phi connections
  li t5, 0
  j main._58.array.cond.19                                              # ir inst 197 fin
main._58.array.cond.19:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 199 fin
  bnez t4, main._59.array.body.19
  j main._60.array.exit.19                                              # ir inst 200 fin
main._59.array.body.19:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 201 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 202 fin
  addi t4, t5, 1                                                        # ir inst 203 fin
# Phi connections
  mv t5, t4
  j main._58.array.cond.19                                              # ir inst 204 fin
main._60.array.exit.19:
  li t1, 14872
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 205 fin
# Phi connections
  li t5, 0
  j main._61.array.cond.20                                              # ir inst 206 fin
main._61.array.cond.20:
  li t2, 128
  slt t4, t5, t2                                                        # ir inst 208 fin
  bnez t4, main._62.array.body.20
  j main._63.array.exit.20                                              # ir inst 209 fin
main._62.array.body.20:
  slli t2, t5, 5
  add t4, t6, t2                                                        # ir inst 210 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 32
  li t1, 18968
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 211 fin
  addi t4, t5, 1                                                        # ir inst 212 fin
# Phi connections
  mv t5, t4
  j main._61.array.cond.20                                              # ir inst 213 fin
main._63.array.exit.20:
  li t1, 20024
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 216 fin
# Phi connections
  li t5, 0
  j main._64.array.cond.21                                              # ir inst 217 fin
main._64.array.cond.21:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 219 fin
  bnez t4, main._65.array.body.21
  j main._66.array.exit.21                                              # ir inst 220 fin
main._65.array.body.21:
  add t4, t6, t5                                                        # ir inst 221 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 222 fin
  addi t4, t5, 1                                                        # ir inst 223 fin
# Phi connections
  mv t5, t4
  j main._64.array.cond.21                                              # ir inst 224 fin
main._66.array.exit.21:
  li t1, 19000
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 225 fin
# Phi connections
  li t5, 0
  j main._67.array.cond.22                                              # ir inst 226 fin
main._67.array.cond.22:
  li t2, 128
  slt t4, t5, t2                                                        # ir inst 228 fin
  bnez t4, main._68.array.body.22
  j main._69.array.exit.22                                              # ir inst 229 fin
main._68.array.body.22:
  slli t2, t5, 3
  add t4, t6, t2                                                        # ir inst 230 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 8
  li t1, 20024
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 231 fin
  addi t4, t5, 1                                                        # ir inst 232 fin
# Phi connections
  mv t5, t4
  j main._67.array.cond.22                                              # ir inst 233 fin
main._69.array.exit.22:
  li t1, 24128
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 236 fin
# Phi connections
  li t5, 0
  j main._70.array.cond.23                                              # ir inst 237 fin
main._70.array.cond.23:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 239 fin
  bnez t4, main._71.array.body.23
  j main._72.array.exit.23                                              # ir inst 240 fin
main._71.array.body.23:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 241 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 242 fin
  addi t4, t5, 1                                                        # ir inst 243 fin
# Phi connections
  mv t5, t4
  j main._70.array.cond.23                                              # ir inst 244 fin
main._72.array.exit.23:
  li t1, 20032
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 245 fin
# Phi connections
  li t5, 0
  j main._73.array.cond.24                                              # ir inst 246 fin
main._73.array.cond.24:
  li t2, 128
  slt t4, t5, t2                                                        # ir inst 248 fin
  bnez t4, main._74.array.body.24
  j main._75.array.exit.24                                              # ir inst 249 fin
main._74.array.body.24:
  slli t2, t5, 5
  add t4, t6, t2                                                        # ir inst 250 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 32
  li t1, 24128
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 251 fin
  addi t4, t5, 1                                                        # ir inst 252 fin
# Phi connections
  mv t5, t4
  j main._73.array.cond.24                                              # ir inst 253 fin
main._75.array.exit.24:
  li t1, 24160
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 255 fin
# Phi connections
  li t5, 0
  j main._76.array.cond.25                                              # ir inst 256 fin
main._76.array.cond.25:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 258 fin
  bnez t4, main._77.array.body.25
  j main._78.array.exit.25                                              # ir inst 259 fin
main._77.array.body.25:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 260 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 261 fin
  addi t4, t5, 1                                                        # ir inst 262 fin
# Phi connections
  mv t5, t4
  j main._76.array.cond.25                                              # ir inst 263 fin
main._78.array.exit.25:
  li t1, 24224
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 265 fin
# Phi connections
  li t5, 0
  j main._79.array.cond.26                                              # ir inst 266 fin
main._79.array.cond.26:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 268 fin
  bnez t4, main._80.array.body.26
  j main._81.array.exit.26                                              # ir inst 269 fin
main._80.array.body.26:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 270 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 271 fin
  addi t4, t5, 1                                                        # ir inst 272 fin
# Phi connections
  mv t5, t4
  j main._79.array.cond.26                                              # ir inst 273 fin
main._81.array.exit.26:
  li t1, 24288
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 275 fin
# Phi connections
  li t5, 0
  j main._82.array.cond.27                                              # ir inst 276 fin
main._82.array.cond.27:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 278 fin
  bnez t4, main._83.array.body.27
  j main._84.array.exit.27                                              # ir inst 279 fin
main._83.array.body.27:
  add t4, t6, t5                                                        # ir inst 280 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 281 fin
  addi t4, t5, 1                                                        # ir inst 282 fin
# Phi connections
  mv t5, t4
  j main._82.array.cond.27                                              # ir inst 283 fin
main._84.array.exit.27:
  li t1, 24304
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 285 fin
# Phi connections
  li t5, 0
  j main._85.array.cond.28                                              # ir inst 286 fin
main._85.array.cond.28:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 288 fin
  bnez t4, main._86.array.body.28
  j main._87.array.exit.28                                              # ir inst 289 fin
main._86.array.body.28:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 290 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 291 fin
  addi t4, t5, 1                                                        # ir inst 292 fin
# Phi connections
  mv t5, t4
  j main._85.array.cond.28                                              # ir inst 293 fin
main._87.array.exit.28:
  li t1, 24368
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 295 fin
# Phi connections
  li t5, 0
  j main._88.array.cond.29                                              # ir inst 296 fin
main._88.array.cond.29:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 298 fin
  bnez t4, main._89.array.body.29
  j main._90.array.exit.29                                              # ir inst 299 fin
main._89.array.body.29:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 300 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 301 fin
  addi t4, t5, 1                                                        # ir inst 302 fin
# Phi connections
  mv t5, t4
  j main._88.array.cond.29                                              # ir inst 303 fin
main._90.array.exit.29:
# alloca %181
  li t2, 24624
  add t2, sp, t2
  li t1, 64
  sw t1, 0(t2)                                                          # ir inst 305 fin
# Phi connections
  li t6, 0
  j main._91.while.cond.0                                               # ir inst 306 fin
main._91.while.cond.0:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 308 fin
  bnez t5, main._92.while.body.0
  j main._93.while.exit.0                                               # ir inst 309 fin
main._92.while.body.0:
  mv t5, t6                                                             # ir inst 310 fin
  slli t2, t5, 2
  li t1, 24368
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 311 fin
  sw t6, 0(t4)                                                          # ir inst 312 fin
  mv t5, t6                                                             # ir inst 313 fin
  slli t2, t5, 2
  addi t1, sp, 1312
  add t4, t1, t2                                                        # ir inst 314 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 315 fin
  addi t5, t6, 1                                                        # ir inst 316 fin
# Phi connections
  mv t6, t5
  j main._91.while.cond.0                                               # ir inst 317 fin
main._93.while.exit.0:
# Phi connections
  li s5, 0
  li s6, 0
  li s7, 0
  li s8, 0
  li s9, 0
  li s10, 0
  li s11, 0
  li t3, 0
  li t4, 50
  li t5, 0
  li t6, 0
  j main._94.while.cond.1                                               # ir inst 318 fin
main._94.while.cond.1:
  li t2, 5000
  slt s0, s9, t2                                                        # ir inst 330 fin
  bnez s0, main._95.while.body.1
  j main._144.while.exit.1                                              # ir inst 331 fin
main._95.while.body.1:
  addi s0, s5, 1                                                        # ir inst 332 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a1, 5000
  mv a0, s9
  call .F.generate_memory_access_pattern
  mv s5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 333 fin
  li t2, 4096
  div s1, s5, t2                                                        # ir inst 334 fin
  li t2, 4096
  rem a0, s5, t2                                                        # ir inst 335 fin
  addi s5, s8, 1                                                        # ir inst 336 fin
  mv a1, t5                                                             # ir inst 337 fin
  slli t2, a1, 2
  li t1, 3364
  add t1, sp, t1
  add a2, t1, t2                                                        # ir inst 338 fin
  sw s1, 0(a2)                                                          # ir inst 339 fin
  addi a1, t5, 1                                                        # ir inst 340 fin
  li t2, 1000
  rem t5, a1, t2                                                        # ir inst 341 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li t1, 24288
  add t1, sp, t1
  mv a2, t1
  li t1, 24160
  add t1, sp, t1
  mv a1, t1
  mv a0, s1
  call .F.lookup_tlb
  mv a1, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 342 fin
  bnez a1, main._96.if.then.0
  j main._97.if.else.0                                                  # ir inst 343 fin
main._96.if.then.0:
  addi a1, s11, 1                                                       # ir inst 344 fin
# Phi connections
  li a3, -1
  mv a2, s0
  mv s0, a1
  mv a1, s7
  j main._107.if.exit.0                                                 # ir inst 345 fin
main._97.if.else.0:
  li t2, 16
  div a1, s1, t2                                                        # ir inst 346 fin
  li t2, 16
  rem a2, s1, t2                                                        # ir inst 347 fin
  mv a3, a1                                                             # ir inst 348 fin
  slli t2, a3, 6
  addi t1, sp, 224
  add a4, t1, t2                                                        # ir inst 349 fin
  mv a3, a2                                                             # ir inst 350 fin
  slli t2, a3, 2
  add a5, a4, t2                                                        # ir inst 351 fin
  lw a3, 0(a5)                                                          # ir inst 352 fin
  li t2, 0
  slt a4, t2, a3                                                        # ir inst 353 fin
  bnez a4, main._98.if.then.1
  j main._99.if.else.1                                                  # ir inst 354 fin
main._98.if.then.1:
  addi a4, a3, -1                                                       # ir inst 355 fin
  mv a3, s1                                                             # ir inst 356 fin
  li t1, 2848
  add t1, sp, t1
  add a5, t1, a3                                                        # ir inst 357 fin
  li t1, 1
  sb t1, 0(a5)                                                          # ir inst 358 fin
  mv a3, s1                                                             # ir inst 359 fin
  slli t2, a3, 2
  addi t1, sp, 1824
  add a5, t1, t2                                                        # ir inst 360 fin
  sw s0, 0(a5)                                                          # ir inst 361 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  li t1, 24304
  add t1, sp, t1
  mv a5, t1
  li t1, 24224
  add t1, sp, t1
  mv a3, t1
  li t1, 24160
  add t1, sp, t1
  mv a2, t1
  mv a1, a4
  mv a0, s1
  li t1, 24288
  add t1, sp, t1
  mv a4, t1
  call .F.update_tlb
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 362 fin
# Phi connections
  mv a2, a4
  mv a1, s7
  j main._106.if.exit.1                                                 # ir inst 363 fin
main._99.if.else.1:
  addi a3, s7, 1                                                        # ir inst 364 fin
  li t1, 24624
  add t1, sp, t1
  lw a4, 0(t1)                                                          # ir inst 365 fin
  li t2, 0
  slt a5, t2, a4                                                        # ir inst 366 fin
  bnez a5, main._100.if.then.2
  j main._101.if.else.2                                                 # ir inst 367 fin
main._100.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  addi t1, sp, 1312
  mv a2, t1
  li t1, 24624
  add t1, sp, t1
  mv a1, t1
  li t1, 24368
  add t1, sp, t1
  mv a0, t1
  call .F.allocate_free_frame
  mv a4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 368 fin
# Phi connections
  j main._102.if.exit.2                                                 # ir inst 369 fin
main._101.if.else.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  sd t4, -24(sp)
  sd s0, -16(sp)
  sd s9, -8(sp)
  mv a7, t5
  li t1, 3364
  add t1, sp, t1
  mv a6, t1
  addi t1, sp, 1824
  mv a5, t1
  li t1, 3360
  add t1, sp, t1
  mv a4, t1
  li t1, 3104
  add t1, sp, t1
  mv a3, t1
  li t1, 2848
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 1568
  mv a1, t1
  addi t1, sp, 224
  mv a0, t1
  call .F.page_replacement_algorithm
  mv a4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 370 fin
# Phi connections
  j main._102.if.exit.2                                                 # ir inst 371 fin
main._102.if.exit.2:
  li t2, 0
  slt t0, a4, t2
  xori a5, t0, 1                                                        # ir inst 373 fin
  bnez a5, main._103.if.then.3
  j main._104.if.else.3                                                 # ir inst 374 fin
main._103.if.then.3:
  mv a5, a1                                                             # ir inst 375 fin
  slli t2, a5, 6
  addi t1, sp, 224
  add a1, t1, t2                                                        # ir inst 376 fin
  mv a5, a2                                                             # ir inst 377 fin
  slli t2, a5, 2
  add a2, a1, t2                                                        # ir inst 378 fin
  addi a1, a4, 1                                                        # ir inst 379 fin
  sw a1, 0(a2)                                                          # ir inst 380 fin
  mv a1, a4                                                             # ir inst 381 fin
  slli t2, a1, 2
  addi t1, sp, 1568
  add a2, t1, t2                                                        # ir inst 382 fin
  sw s1, 0(a2)                                                          # ir inst 383 fin
  mv a1, s1                                                             # ir inst 384 fin
  li t1, 2848
  add t1, sp, t1
  add a2, t1, a1                                                        # ir inst 385 fin
  li t1, 1
  sb t1, 0(a2)                                                          # ir inst 386 fin
  mv a1, s1                                                             # ir inst 387 fin
  slli t2, a1, 2
  addi t1, sp, 1824
  add a2, t1, t2                                                        # ir inst 388 fin
  sw s0, 0(a2)                                                          # ir inst 389 fin
  mv a1, a4                                                             # ir inst 390 fin
  slli t2, a1, 2
  addi t1, sp, 1312
  add a2, t1, t2                                                        # ir inst 391 fin
  li t1, 1
  sw t1, 0(a2)                                                          # ir inst 392 fin
# Start call preparation
  sd a0, 0(sp)
  sd a3, 8(sp)
  sd a4, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li t1, 24304
  add t1, sp, t1
  mv a5, t1
  li t1, 24224
  add t1, sp, t1
  mv a3, t1
  li t1, 24160
  add t1, sp, t1
  mv a2, t1
  mv a1, a4
  mv a0, s1
  li t1, 24288
  add t1, sp, t1
  mv a4, t1
  call .F.update_tlb
  ld a0, 0(sp)
  ld a3, 8(sp)
  ld a4, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 393 fin
  j main._105.if.exit.3                                                 # ir inst 394 fin
main._104.if.else.3:
  j main._105.if.exit.3                                                 # ir inst 395 fin
main._105.if.exit.3:
# Phi connections
  mv a2, a4
  mv a1, a3
  j main._106.if.exit.1                                                 # ir inst 396 fin
main._106.if.exit.1:
  addi a3, s0, 100                                                      # ir inst 399 fin
# Phi connections
  mv s0, s11
  mv t0, a3
  mv a3, a2
  mv a2, t0
  j main._107.if.exit.0                                                 # ir inst 400 fin
main._107.if.exit.0:
  li t2, 0
  slt t0, a3, t2
  xori a4, t0, 1                                                        # ir inst 405 fin
  bnez a4, main._108.if.then.4
  j main._115.if.else.4                                                 # ir inst 406 fin
main._108.if.then.4:
  slli a4, a3, 12                                                       # ir inst 407 fin
  add a3, a4, a0                                                        # ir inst 408 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a5, a2
  li t1, 9704
  add t1, sp, t1
  mv a4, t1
  li t1, 8404
  add t1, sp, t1
  mv a2, t1
  li t1, 7364
  add t1, sp, t1
  mv a1, t1
  mv a0, a3
  li t1, 9444
  add t1, sp, t1
  mv a3, t1
  call .F.access_l1_cache
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 409 fin
  bnez a0, main._109.if.then.5
  j main._110.if.else.5                                                 # ir inst 410 fin
main._109.if.then.5:
  addi a0, s6, 1                                                        # ir inst 411 fin
# Phi connections
  mv a6, a2
  mv a5, a0
  mv a4, s10
  mv a3, t3
  mv a0, t6
  j main._114.if.exit.5                                                 # ir inst 412 fin
main._110.if.else.5:
  addi a0, s10, 1                                                       # ir inst 413 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a5, a2
  li t1, 20032
  add t1, sp, t1
  mv a4, t1
  li t1, 14872
  add t1, sp, t1
  mv a2, t1
  li t1, 10744
  add t1, sp, t1
  mv a1, t1
  mv a0, a3
  li t1, 19000
  add t1, sp, t1
  mv a3, t1
  call .F.access_l2_cache
  mv a4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 414 fin
  bnez a4, main._111.if.then.6
  j main._112.if.else.6                                                 # ir inst 415 fin
main._111.if.then.6:
  addi a3, t3, 1                                                        # ir inst 416 fin
# Phi connections
  mv a5, a2
  mv a4, a3
  mv a3, t6
  j main._113.if.exit.6                                                 # ir inst 417 fin
main._112.if.else.6:
  addi a3, t6, 1                                                        # ir inst 418 fin
  addi a4, a2, 200                                                      # ir inst 419 fin
# Phi connections
  mv a5, a4
  mv a4, t3
  j main._113.if.exit.6                                                 # ir inst 420 fin
main._113.if.exit.6:
# Phi connections
  mv a6, a5
  mv a5, s6
  mv t0, a4
  mv a4, a0
  mv a0, a3
  mv a3, t0
  j main._114.if.exit.5                                                 # ir inst 424 fin
main._114.if.exit.5:
# Phi connections
  mv a2, a3
  mv a3, a4
  mv a4, a5
  mv a5, a6
  j main._116.if.exit.4                                                 # ir inst 430 fin
main._115.if.else.4:
# Phi connections
  mv a5, a2
  mv a4, s6
  mv a3, s10
  mv a2, t3
  mv a0, t6
  j main._116.if.exit.4                                                 # ir inst 431 fin
main._116.if.exit.4:
  li t2, 4
  rem a6, s9, t2                                                        # ir inst 437 fin
  li t2, 0
  xor t0, a6, t2
  sltiu a7, t0, 1                                                       # ir inst 438 fin
  bnez a7, main._117.lazy.then.0
  j main._118.lazy.else.0                                               # ir inst 439 fin
main._117.lazy.then.0:
  li t2, 256
  slt a6, s1, t2                                                        # ir inst 440 fin
# Phi connections
  j main._119.lazy.exit.0                                               # ir inst 441 fin
main._118.lazy.else.0:
# Phi connections
  li a6, 0
  j main._119.lazy.exit.0                                               # ir inst 442 fin
main._119.lazy.exit.0:
  bnez a6, main._120.if.then.7
  j main._121.if.else.7                                                 # ir inst 444 fin
main._120.if.then.7:
  mv a6, s1                                                             # ir inst 445 fin
  li t1, 3104
  add t1, sp, t1
  add s1, t1, a6                                                        # ir inst 446 fin
  li t1, 1
  sb t1, 0(s1)                                                          # ir inst 447 fin
  j main._122.if.exit.7                                                 # ir inst 448 fin
main._121.if.else.7:
  j main._122.if.exit.7                                                 # ir inst 449 fin
main._122.if.exit.7:
  li t2, 500
  rem s1, s9, t2                                                        # ir inst 450 fin
  li t2, 0
  xor t0, s1, t2
  sltiu a6, t0, 1                                                       # ir inst 451 fin
  bnez a6, main._123.if.then.8
  j main._127.if.else.8                                                 # ir inst 452 fin
main._123.if.then.8:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  li a1, 64
  addi t1, sp, 1312
  mv a0, t1
  call .F.analyze_memory_fragmentation
  mv s1, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 453 fin
  li t2, 30
  slt a6, t2, s1                                                        # ir inst 454 fin
  bnez a6, main._124.if.then.9
  j main._125.if.else.9                                                 # ir inst 455 fin
main._124.if.then.9:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  li a5, 64
  li t1, 24624
  add t1, sp, t1
  mv a4, t1
  li t1, 24368
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1312
  mv a2, t1
  addi t1, sp, 1568
  mv a1, t1
  addi t1, sp, 224
  mv a0, t1
  call .F.compact_memory
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 456 fin
  j main._126.if.exit.9                                                 # ir inst 457 fin
main._125.if.else.9:
  j main._126.if.exit.9                                                 # ir inst 458 fin
main._126.if.exit.9:
  j main._128.if.exit.8                                                 # ir inst 459 fin
main._127.if.else.8:
  j main._128.if.exit.8                                                 # ir inst 460 fin
main._128.if.exit.8:
  li t2, 100
  rem s1, s9, t2                                                        # ir inst 461 fin
  li t2, 0
  xor t0, s1, t2
  sltiu a6, t0, 1                                                       # ir inst 462 fin
  bnez a6, main._129.if.then.10
  j main._139.if.else.10                                                # ir inst 463 fin
main._129.if.then.10:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a2, t4
  mv a1, t5
  li t1, 3364
  add t1, sp, t1
  mv a0, t1
  call .F.calculate_working_set_size
  mv s1, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 464 fin
  li t2, 40
  slt a6, t2, s1                                                        # ir inst 465 fin
  bnez a6, main._130.if.then.11
  j main._131.if.else.11                                                # ir inst 466 fin
main._130.if.then.11:
  addi a6, t4, 5                                                        # ir inst 467 fin
# Phi connections
  mv s1, a6
  j main._138.if.exit.11                                                # ir inst 468 fin
main._131.if.else.11:
  li t2, 20
  slt a6, s1, t2                                                        # ir inst 469 fin
  bnez a6, main._132.lazy.then.1
  j main._133.lazy.else.1                                               # ir inst 470 fin
main._132.lazy.then.1:
  li t2, 10
  slt s1, t2, t4                                                        # ir inst 471 fin
# Phi connections
  j main._134.lazy.exit.1                                               # ir inst 472 fin
main._133.lazy.else.1:
# Phi connections
  li s1, 0
  j main._134.lazy.exit.1                                               # ir inst 473 fin
main._134.lazy.exit.1:
  bnez s1, main._135.if.then.12
  j main._136.if.else.12                                                # ir inst 475 fin
main._135.if.then.12:
  addi s1, t4, -5                                                       # ir inst 476 fin
# Phi connections
  j main._137.if.exit.12                                                # ir inst 477 fin
main._136.if.else.12:
# Phi connections
  mv s1, t4
  j main._137.if.exit.12                                                # ir inst 478 fin
main._137.if.exit.12:
# Phi connections
  j main._138.if.exit.11                                                # ir inst 480 fin
main._138.if.exit.11:
# Phi connections
  j main._140.if.exit.10                                                # ir inst 482 fin
main._139.if.else.10:
# Phi connections
  mv s1, t4
  j main._140.if.exit.10                                                # ir inst 483 fin
main._140.if.exit.10:
  li t2, 200
  rem a6, s9, t2                                                        # ir inst 485 fin
  li t2, 0
  xor t0, a6, t2
  sltiu a7, t0, 1                                                       # ir inst 486 fin
  bnez a7, main._141.if.then.13
  j main._142.if.else.13                                                # ir inst 487 fin
main._141.if.then.13:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a5, a0
  li t1, 20032
  add t1, sp, t1
  mv a1, t1
  li t1, 9704
  add t1, sp, t1
  mv a0, t1
  mv t0, a4
  mv a4, a2
  mv a2, t0
  call .F.adjust_cache_policies
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 488 fin
  j main._143.if.exit.13                                                # ir inst 489 fin
main._142.if.else.13:
  j main._143.if.exit.13                                                # ir inst 490 fin
main._143.if.exit.13:
  addi a6, s9, 1                                                        # ir inst 491 fin
# Phi connections
  mv s6, a4
  mv s7, a1
  mv s8, s5
  mv s9, a6
  mv s10, a3
  mv s11, s0
  mv t3, a2
  mv t4, s1
  mv t6, a0
  mv s5, a5
  j main._94.while.cond.1                                               # ir inst 492 fin
main._144.while.exit.1:
  li t2, 100
  mul t5, s7, t2                                                        # ir inst 493 fin
  div s9, t5, s8                                                        # ir inst 494 fin
  li t2, 100
  mul t5, s6, t2                                                        # ir inst 495 fin
  div s5, t5, s8                                                        # ir inst 496 fin
  li t2, 100
  mul t5, t3, t2                                                        # ir inst 497 fin
  div s0, t5, s8                                                        # ir inst 498 fin
  li t2, 100
  mul t5, s11, t2                                                       # ir inst 499 fin
  div s11, t5, s8                                                       # ir inst 500 fin
  li t1, 24624
  add t1, sp, t1
  lw t5, 0(t1)                                                          # ir inst 501 fin
  li t1, 64
  sub s8, t1, t5                                                        # ir inst 502 fin
  li t2, 100
  mul t5, s8, t2                                                        # ir inst 503 fin
  li t2, 64
  div s8, t5, t2                                                        # ir inst 504 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a4, s7
  mv a3, t6
  mv a2, t3
  mv a1, s10
  mv a0, s6
  call .F.calculate_average_memory_access_time
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 505 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  li a1, 64
  addi t1, sp, 1312
  mv a0, t1
  call .F.analyze_memory_fragmentation
  mv t6, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 506 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s9
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 507 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 508 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s0
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 509 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s11
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 510 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s8
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 511 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 512 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 513 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 514 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 515 fin
  j main.epilogue                                                       # ir inst 516 fin
main.epilogue:
  ld ra, 152(sp)
  ld s7, 80(sp)
  ld s10, 88(sp)
  ld s6, 96(sp)
  ld s1, 104(sp)
  ld s9, 112(sp)
  ld s5, 120(sp)
  ld s0, 128(sp)
  ld s11, 136(sp)
  ld s8, 144(sp)
  li t0, 24640
  add sp, sp, t0
  ret

.globl .F.generate_memory_access_pattern
.F.generate_memory_access_pattern:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generate_memory_access_pattern._0.entry.0:
  li t2, 100
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 6
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.generate_memory_access_pattern._1.if.then.0
  j .F.generate_memory_access_pattern._2.if.else.0                      # ir inst 4 fin
.F.generate_memory_access_pattern._1.if.then.0:
  slli t6, a0, 6                                                        # ir inst 5 fin
  li t2, 1048576
  rem t4, t6, t2                                                        # ir inst 6 fin
# Phi connections
  mv t6, t4
  j .F.generate_memory_access_pattern._18.if.exit.0                     # ir inst 7 fin
.F.generate_memory_access_pattern._2.if.else.0:
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
  bnez t6, .F.generate_memory_access_pattern._3.if.then.1
  j .F.generate_memory_access_pattern._4.if.else.1                      # ir inst 9 fin
.F.generate_memory_access_pattern._3.if.then.1:
  li t2, 17
  mul t6, a0, t2                                                        # ir inst 10 fin
  addi t4, t6, 23                                                       # ir inst 11 fin
  li t2, 131
  mul t6, t4, t2                                                        # ir inst 12 fin
  addi t4, t6, 47                                                       # ir inst 13 fin
  li t2, 1048576
  rem t6, t4, t2                                                        # ir inst 14 fin
# Phi connections
  j .F.generate_memory_access_pattern._17.if.exit.1                     # ir inst 15 fin
.F.generate_memory_access_pattern._4.if.else.1:
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 16 fin
  bnez t6, .F.generate_memory_access_pattern._5.if.then.2
  j .F.generate_memory_access_pattern._6.if.else.2                      # ir inst 17 fin
.F.generate_memory_access_pattern._5.if.then.2:
  slli t6, a0, 9                                                        # ir inst 18 fin
  li t2, 1048576
  rem t4, t6, t2                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F.generate_memory_access_pattern._16.if.exit.2                     # ir inst 20 fin
.F.generate_memory_access_pattern._6.if.else.2:
  li t2, 3
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 21 fin
  bnez t6, .F.generate_memory_access_pattern._7.if.then.3
  j .F.generate_memory_access_pattern._11.if.else.3                     # ir inst 22 fin
.F.generate_memory_access_pattern._7.if.then.3:
  li t2, 50
  div t6, a0, t2                                                        # ir inst 23 fin
  slli t4, t6, 13                                                       # ir inst 24 fin
  li t2, 1048576
  rem t6, t4, t2                                                        # ir inst 25 fin
  li t2, 7
  mul t4, a0, t2                                                        # ir inst 26 fin
  li t2, 10
  rem t3, t4, t2                                                        # ir inst 27 fin
  li t2, 8
  slt t4, t3, t2                                                        # ir inst 28 fin
  bnez t4, .F.generate_memory_access_pattern._8.if.then.4
  j .F.generate_memory_access_pattern._9.if.else.4                      # ir inst 29 fin
.F.generate_memory_access_pattern._8.if.then.4:
  li t2, 3
  mul t4, a0, t2                                                        # ir inst 30 fin
  li t2, 1024
  rem t3, t4, t2                                                        # ir inst 31 fin
  add t4, t6, t3                                                        # ir inst 32 fin
# Phi connections
  mv t6, t4
  j .F.generate_memory_access_pattern._10.if.exit.4                     # ir inst 33 fin
.F.generate_memory_access_pattern._9.if.else.4:
  li t2, 19
  mul t6, a0, t2                                                        # ir inst 34 fin
  addi t4, t6, 37                                                       # ir inst 35 fin
  li t2, 113
  mul t6, t4, t2                                                        # ir inst 36 fin
  li t2, 1048576
  rem t4, t6, t2                                                        # ir inst 37 fin
# Phi connections
  mv t6, t4
  j .F.generate_memory_access_pattern._10.if.exit.4                     # ir inst 38 fin
.F.generate_memory_access_pattern._10.if.exit.4:
# Phi connections
  j .F.generate_memory_access_pattern._15.if.exit.3                     # ir inst 40 fin
.F.generate_memory_access_pattern._11.if.else.3:
  li t2, 4
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 41 fin
  bnez t6, .F.generate_memory_access_pattern._12.if.then.5
  j .F.generate_memory_access_pattern._13.if.else.5                     # ir inst 42 fin
.F.generate_memory_access_pattern._12.if.then.5:
  li t2, 200
  div t6, a0, t2                                                        # ir inst 43 fin
  slli t5, t6, 14                                                       # ir inst 44 fin
  li t2, 1048576
  rem t6, t5, t2                                                        # ir inst 45 fin
  li t2, 5
  mul t5, a0, t2                                                        # ir inst 46 fin
  li t2, 4096
  rem t4, t5, t2                                                        # ir inst 47 fin
  add t5, t6, t4                                                        # ir inst 48 fin
# Phi connections
  mv t6, t5
  j .F.generate_memory_access_pattern._14.if.exit.5                     # ir inst 49 fin
.F.generate_memory_access_pattern._13.if.else.5:
  li t2, 97
  mul t6, a0, t2                                                        # ir inst 50 fin
  addi t5, t6, 113                                                      # ir inst 51 fin
  li t2, 211
  mul t6, t5, t2                                                        # ir inst 52 fin
  addi t5, t6, 307                                                      # ir inst 53 fin
  li t2, 1048576
  rem t6, t5, t2                                                        # ir inst 54 fin
# Phi connections
  j .F.generate_memory_access_pattern._14.if.exit.5                     # ir inst 55 fin
.F.generate_memory_access_pattern._14.if.exit.5:
# Phi connections
  j .F.generate_memory_access_pattern._15.if.exit.3                     # ir inst 57 fin
.F.generate_memory_access_pattern._15.if.exit.3:
# Phi connections
  j .F.generate_memory_access_pattern._16.if.exit.2                     # ir inst 59 fin
.F.generate_memory_access_pattern._16.if.exit.2:
# Phi connections
  j .F.generate_memory_access_pattern._17.if.exit.1                     # ir inst 61 fin
.F.generate_memory_access_pattern._17.if.exit.1:
# Phi connections
  j .F.generate_memory_access_pattern._18.if.exit.0                     # ir inst 63 fin
.F.generate_memory_access_pattern._18.if.exit.0:
  mv a0, t6
  j .F.generate_memory_access_pattern.epilogue                          # ir inst 65 fin
.F.generate_memory_access_pattern.epilogue:
  ret

.globl .F.lookup_tlb
.F.lookup_tlb:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.lookup_tlb._0.entry.0:
# Phi connections
  li t6, 0
  j .F.lookup_tlb._1.while.cond.0                                       # ir inst 1 fin
.F.lookup_tlb._1.while.cond.0:
  li t2, 16
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.lookup_tlb._2.while.body.0
  j .F.lookup_tlb._9.while.exit.0                                       # ir inst 4 fin
.F.lookup_tlb._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  add t4, a2, t5                                                        # ir inst 6 fin
  lb t5, 0(t4)                                                          # ir inst 7 fin
  bnez t5, .F.lookup_tlb._3.lazy.then.0
  j .F.lookup_tlb._4.lazy.else.0                                        # ir inst 8 fin
.F.lookup_tlb._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 9 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 10 fin
  lw t5, 0(t4)                                                          # ir inst 11 fin
  xor t0, t5, a0
  sltiu t4, t0, 1                                                       # ir inst 12 fin
# Phi connections
  mv t5, t4
  j .F.lookup_tlb._5.lazy.exit.0                                        # ir inst 13 fin
.F.lookup_tlb._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.lookup_tlb._5.lazy.exit.0                                        # ir inst 14 fin
.F.lookup_tlb._5.lazy.exit.0:
  bnez t5, .F.lookup_tlb._6.if.then.0
  j .F.lookup_tlb._7.if.else.0                                          # ir inst 16 fin
.F.lookup_tlb._6.if.then.0:
  li a0, 1
  j .F.lookup_tlb.epilogue                                              # ir inst 17 fin
.F.lookup_tlb._7.if.else.0:
  j .F.lookup_tlb._8.if.exit.0                                          # ir inst 18 fin
.F.lookup_tlb._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.lookup_tlb._1.while.cond.0                                       # ir inst 20 fin
.F.lookup_tlb._9.while.exit.0:
  li a0, 0
  j .F.lookup_tlb.epilogue                                              # ir inst 21 fin
.F.lookup_tlb.epilogue:
  ret

.globl .F.update_tlb
.F.update_tlb:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.update_tlb._0.entry.0:
  addi t6, a5, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  mv t4, t5
  li t5, 0
  li t6, 1
  j .F.update_tlb._1.while.cond.0                                       # ir inst 3 fin
.F.update_tlb._1.while.cond.0:
  li t2, 16
  slt t3, t6, t2                                                        # ir inst 7 fin
  bnez t3, .F.update_tlb._2.while.body.0
  j .F.update_tlb._6.while.exit.0                                       # ir inst 8 fin
.F.update_tlb._2.while.body.0:
  mv t3, t6                                                             # ir inst 9 fin
  slli t2, t3, 2
  add s11, a5, t2                                                       # ir inst 10 fin
  lw t3, 0(s11)                                                         # ir inst 11 fin
  slt s11, t3, t4                                                       # ir inst 12 fin
  bnez s11, .F.update_tlb._3.if.then.0
  j .F.update_tlb._4.if.else.0                                          # ir inst 13 fin
.F.update_tlb._3.if.then.0:
  mv t3, t6                                                             # ir inst 14 fin
  slli t2, t3, 2
  add s11, a5, t2                                                       # ir inst 15 fin
  lw t3, 0(s11)                                                         # ir inst 16 fin
# Phi connections
  mv t4, t6
  j .F.update_tlb._5.if.exit.0                                          # ir inst 17 fin
.F.update_tlb._4.if.else.0:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.update_tlb._5.if.exit.0                                          # ir inst 18 fin
.F.update_tlb._5.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 21 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.update_tlb._1.while.cond.0                                       # ir inst 22 fin
.F.update_tlb._6.while.exit.0:
  mv t6, t5                                                             # ir inst 23 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 24 fin
  sw a0, 0(t4)                                                          # ir inst 25 fin
  mv t6, t5                                                             # ir inst 26 fin
  slli t2, t6, 2
  add t4, a3, t2                                                        # ir inst 27 fin
  sw a1, 0(t4)                                                          # ir inst 28 fin
  mv t6, t5                                                             # ir inst 29 fin
  add t4, a4, t6                                                        # ir inst 30 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 31 fin
# Phi connections
  li t6, 0
  j .F.update_tlb._7.while.cond.1                                       # ir inst 32 fin
.F.update_tlb._7.while.cond.1:
  li t2, 16
  slt t4, t6, t2                                                        # ir inst 34 fin
  bnez t4, .F.update_tlb._8.while.body.1
  j .F.update_tlb._12.while.exit.1                                      # ir inst 35 fin
.F.update_tlb._8.while.body.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 36 fin
  bnez t4, .F.update_tlb._9.if.then.1
  j .F.update_tlb._10.if.else.1                                         # ir inst 37 fin
.F.update_tlb._9.if.then.1:
  mv t4, t6                                                             # ir inst 38 fin
  slli t2, t4, 2
  add t3, a5, t2                                                        # ir inst 39 fin
  li t1, 1000
  sw t1, 0(t3)                                                          # ir inst 40 fin
  j .F.update_tlb._11.if.exit.1                                         # ir inst 41 fin
.F.update_tlb._10.if.else.1:
  mv t4, t6                                                             # ir inst 42 fin
  slli t2, t4, 2
  add t3, a5, t2                                                        # ir inst 43 fin
  mv t4, t6                                                             # ir inst 44 fin
  slli t2, t4, 2
  add s11, a5, t2                                                       # ir inst 45 fin
  lw t4, 0(s11)                                                         # ir inst 46 fin
  addi s11, t4, -1                                                      # ir inst 47 fin
  sw s11, 0(t3)                                                         # ir inst 48 fin
  j .F.update_tlb._11.if.exit.1                                         # ir inst 49 fin
.F.update_tlb._11.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t4
  j .F.update_tlb._7.while.cond.1                                       # ir inst 51 fin
.F.update_tlb._12.while.exit.1:
  j .F.update_tlb.epilogue                                              # ir inst 52 fin
.F.update_tlb.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.allocate_free_frame
.F.allocate_free_frame:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.allocate_free_frame._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
  li t2, 0
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 2 fin
  bnez t5, .F.allocate_free_frame._1.if.then.0
  j .F.allocate_free_frame._2.if.else.0                                 # ir inst 3 fin
.F.allocate_free_frame._1.if.then.0:
  li a0, -1
  j .F.allocate_free_frame.epilogue                                     # ir inst 4 fin
.F.allocate_free_frame._2.if.else.0:
  j .F.allocate_free_frame._3.if.exit.0                                 # ir inst 5 fin
.F.allocate_free_frame._3.if.exit.0:
  lw t6, 0(a1)                                                          # ir inst 6 fin
  addi t5, t6, -1                                                       # ir inst 7 fin
  sw t5, 0(a1)                                                          # ir inst 8 fin
  lw t6, 0(a1)                                                          # ir inst 9 fin
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 11 fin
  lw t5, 0(t6)                                                          # ir inst 12 fin
  mv t6, t5                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 14 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 15 fin
  mv a0, t5
  j .F.allocate_free_frame.epilogue                                     # ir inst 16 fin
.F.allocate_free_frame.epilogue:
  ret

.globl .F.page_replacement_algorithm
.F.page_replacement_algorithm:
# spill func args num: 3,             range:       88(sp) -       88(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd ra, 72(sp)
.F.page_replacement_algorithm._0.entry.0:
  ld t1, 104(sp)
  li t2, 50
  div t6, t1, t2                                                        # ir inst 1 fin
  li t2, 4
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.page_replacement_algorithm._1.if.then.0
  j .F.page_replacement_algorithm._2.if.else.0                          # ir inst 4 fin
.F.page_replacement_algorithm._1.if.then.0:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a4, 24(sp)
  sd a5, 32(sp)
  sd a6, 40(sp)
  sd a7, 48(sp)
  sd t5, 56(sp)
  mv a0, a1
  mv a1, a2
  mv a2, a3
  mv a3, a4
  call .F.enhanced_clock_replacement
  mv t6, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a4, 24(sp)
  ld a5, 32(sp)
  ld a6, 40(sp)
  ld a7, 48(sp)
  ld t5, 56(sp)
# ir inst 5 fin
# Phi connections
  j .F.page_replacement_algorithm._9.if.exit.0                          # ir inst 6 fin
.F.page_replacement_algorithm._2.if.else.0:
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 7 fin
  bnez t6, .F.page_replacement_algorithm._3.if.then.1
  j .F.page_replacement_algorithm._4.if.else.1                          # ir inst 8 fin
.F.page_replacement_algorithm._3.if.then.1:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a5, 24(sp)
  sd a6, 32(sp)
  sd a7, 40(sp)
  sd t5, 48(sp)
  ld t1, 96(sp)
  mv a2, t1
  mv a0, a1
  mv a1, a5
  call .F.lru_replacement
  mv t6, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a5, 24(sp)
  ld a6, 32(sp)
  ld a7, 40(sp)
  ld t5, 48(sp)
# ir inst 9 fin
# Phi connections
  j .F.page_replacement_algorithm._8.if.exit.1                          # ir inst 10 fin
.F.page_replacement_algorithm._4.if.else.1:
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 11 fin
  bnez t6, .F.page_replacement_algorithm._5.if.then.2
  j .F.page_replacement_algorithm._6.if.else.2                          # ir inst 12 fin
.F.page_replacement_algorithm._5.if.then.2:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a5, 24(sp)
  sd a6, 32(sp)
  sd a7, 40(sp)
  ld t1, 88(sp)
  mv a3, t1
  mv a2, a7
  mv a0, a1
  mv a1, a6
  call .F.working_set_replacement
  mv t6, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a5, 24(sp)
  ld a6, 32(sp)
  ld a7, 40(sp)
# ir inst 13 fin
# Phi connections
  j .F.page_replacement_algorithm._7.if.exit.2                          # ir inst 14 fin
.F.page_replacement_algorithm._6.if.else.2:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a5, 24(sp)
  sd a6, 32(sp)
  sd a7, 40(sp)
  ld t1, 96(sp)
  mv a4, t1
  mv a0, a1
  mv a1, a2
  mv a2, a3
  mv a3, a5
  mv a5, a6
  mv a6, a7
  ld t1, 88(sp)
  mv a7, t1
  call .F.adaptive_replacement
  mv t6, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a5, 24(sp)
  ld a6, 32(sp)
  ld a7, 40(sp)
# ir inst 15 fin
# Phi connections
  j .F.page_replacement_algorithm._7.if.exit.2                          # ir inst 16 fin
.F.page_replacement_algorithm._7.if.exit.2:
# Phi connections
  j .F.page_replacement_algorithm._8.if.exit.1                          # ir inst 18 fin
.F.page_replacement_algorithm._8.if.exit.1:
# Phi connections
  j .F.page_replacement_algorithm._9.if.exit.0                          # ir inst 20 fin
.F.page_replacement_algorithm._9.if.exit.0:
  mv a0, t6
  j .F.page_replacement_algorithm.epilogue                              # ir inst 22 fin
.F.page_replacement_algorithm.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 112
  ret

.globl .F.enhanced_clock_replacement
.F.enhanced_clock_replacement:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.enhanced_clock_replacement._0.entry.0:
  lw t6, 0(a3)                                                          # ir inst 1 fin
# Phi connections
  li t5, 0
  j .F.enhanced_clock_replacement._1.while.cond.0                       # ir inst 2 fin
.F.enhanced_clock_replacement._1.while.cond.0:
  li t2, 3
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.enhanced_clock_replacement._2.while.body.0
  j .F.enhanced_clock_replacement._21.while.exit.0                      # ir inst 5 fin
.F.enhanced_clock_replacement._2.while.body.0:
  lw t4, 0(a3)                                                          # ir inst 6 fin
  mv t3, t4                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 10 fin
  bnez s11, .F.enhanced_clock_replacement._3.lazy.then.0
  j .F.enhanced_clock_replacement._4.lazy.else.0                        # ir inst 11 fin
.F.enhanced_clock_replacement._3.lazy.then.0:
  li t2, 256
  slt s11, t3, t2                                                       # ir inst 12 fin
# Phi connections
  j .F.enhanced_clock_replacement._5.lazy.exit.0                        # ir inst 13 fin
.F.enhanced_clock_replacement._4.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.enhanced_clock_replacement._5.lazy.exit.0                        # ir inst 14 fin
.F.enhanced_clock_replacement._5.lazy.exit.0:
  bnez s11, .F.enhanced_clock_replacement._6.if.then.0
  j .F.enhanced_clock_replacement._16.if.else.0                         # ir inst 16 fin
.F.enhanced_clock_replacement._6.if.then.0:
  mv s11, t3                                                            # ir inst 17 fin
  add s10, a1, s11                                                      # ir inst 18 fin
  lb s11, 0(s10)                                                        # ir inst 19 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 20 fin
  bnez s10, .F.enhanced_clock_replacement._7.if.then.1
  j .F.enhanced_clock_replacement._14.if.else.1                         # ir inst 21 fin
.F.enhanced_clock_replacement._7.if.then.1:
  mv s11, t3                                                            # ir inst 22 fin
  add s10, a2, s11                                                      # ir inst 23 fin
  lb s11, 0(s10)                                                        # ir inst 24 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 25 fin
  bnez s10, .F.enhanced_clock_replacement._8.lazy.then.1
  j .F.enhanced_clock_replacement._9.lazy.else.1                        # ir inst 26 fin
.F.enhanced_clock_replacement._8.lazy.then.1:
# Phi connections
  li s11, 1
  j .F.enhanced_clock_replacement._10.lazy.exit.1                       # ir inst 27 fin
.F.enhanced_clock_replacement._9.lazy.else.1:
  li t2, 2
  slt t0, t5, t2
  xori s11, t0, 1                                                       # ir inst 28 fin
# Phi connections
  j .F.enhanced_clock_replacement._10.lazy.exit.1                       # ir inst 29 fin
.F.enhanced_clock_replacement._10.lazy.exit.1:
  bnez s11, .F.enhanced_clock_replacement._11.if.then.2
  j .F.enhanced_clock_replacement._12.if.else.2                         # ir inst 31 fin
.F.enhanced_clock_replacement._11.if.then.2:
  lw s11, 0(a3)                                                         # ir inst 32 fin
  addi s10, s11, 1                                                      # ir inst 33 fin
  li t2, 64
  rem s11, s10, t2                                                      # ir inst 34 fin
  sw s11, 0(a3)                                                         # ir inst 35 fin
  mv a0, t4
  j .F.enhanced_clock_replacement.epilogue                              # ir inst 36 fin
.F.enhanced_clock_replacement._12.if.else.2:
  j .F.enhanced_clock_replacement._13.if.exit.2                         # ir inst 37 fin
.F.enhanced_clock_replacement._13.if.exit.2:
  j .F.enhanced_clock_replacement._15.if.exit.1                         # ir inst 38 fin
.F.enhanced_clock_replacement._14.if.else.1:
  mv t4, t3                                                             # ir inst 39 fin
  add t3, a1, t4                                                        # ir inst 40 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 41 fin
  j .F.enhanced_clock_replacement._15.if.exit.1                         # ir inst 42 fin
.F.enhanced_clock_replacement._15.if.exit.1:
  j .F.enhanced_clock_replacement._17.if.exit.0                         # ir inst 43 fin
.F.enhanced_clock_replacement._16.if.else.0:
  j .F.enhanced_clock_replacement._17.if.exit.0                         # ir inst 44 fin
.F.enhanced_clock_replacement._17.if.exit.0:
  lw t4, 0(a3)                                                          # ir inst 45 fin
  addi t3, t4, 1                                                        # ir inst 46 fin
  li t2, 64
  rem t4, t3, t2                                                        # ir inst 47 fin
  sw t4, 0(a3)                                                          # ir inst 48 fin
  lw t4, 0(a3)                                                          # ir inst 49 fin
  xor t0, t4, t6
  sltiu t3, t0, 1                                                       # ir inst 50 fin
  bnez t3, .F.enhanced_clock_replacement._18.if.then.3
  j .F.enhanced_clock_replacement._19.if.else.3                         # ir inst 51 fin
.F.enhanced_clock_replacement._18.if.then.3:
  addi t4, t5, 1                                                        # ir inst 52 fin
# Phi connections
  mv t5, t4
  j .F.enhanced_clock_replacement._20.if.exit.3                         # ir inst 53 fin
.F.enhanced_clock_replacement._19.if.else.3:
# Phi connections
  j .F.enhanced_clock_replacement._20.if.exit.3                         # ir inst 54 fin
.F.enhanced_clock_replacement._20.if.exit.3:
# Phi connections
  j .F.enhanced_clock_replacement._1.while.cond.0                       # ir inst 56 fin
.F.enhanced_clock_replacement._21.while.exit.0:
  lw t6, 0(a3)                                                          # ir inst 57 fin
  lw t5, 0(a3)                                                          # ir inst 58 fin
  addi t4, t5, 1                                                        # ir inst 59 fin
  li t2, 64
  rem t5, t4, t2                                                        # ir inst 60 fin
  sw t5, 0(a3)                                                          # ir inst 61 fin
  mv a0, t6
  j .F.enhanced_clock_replacement.epilogue                              # ir inst 62 fin
.F.enhanced_clock_replacement.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.lru_replacement
.F.lru_replacement:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.lru_replacement._0.entry.0:
  addi t6, a2, 1                                                        # ir inst 1 fin
# Phi connections
  li t4, 0
  mv t5, t6
  li t6, 0
  j .F.lru_replacement._1.while.cond.0                                  # ir inst 2 fin
.F.lru_replacement._1.while.cond.0:
  li t2, 64
  slt t3, t6, t2                                                        # ir inst 6 fin
  bnez t3, .F.lru_replacement._2.while.body.0
  j .F.lru_replacement._12.while.exit.0                                 # ir inst 7 fin
.F.lru_replacement._2.while.body.0:
  mv t3, t6                                                             # ir inst 8 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 9 fin
  lw t3, 0(s11)                                                         # ir inst 10 fin
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 11 fin
  bnez s11, .F.lru_replacement._3.lazy.then.0
  j .F.lru_replacement._4.lazy.else.0                                   # ir inst 12 fin
.F.lru_replacement._3.lazy.then.0:
  li t2, 256
  slt s11, t3, t2                                                       # ir inst 13 fin
# Phi connections
  j .F.lru_replacement._5.lazy.exit.0                                   # ir inst 14 fin
.F.lru_replacement._4.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.lru_replacement._5.lazy.exit.0                                   # ir inst 15 fin
.F.lru_replacement._5.lazy.exit.0:
  bnez s11, .F.lru_replacement._6.if.then.0
  j .F.lru_replacement._10.if.else.0                                    # ir inst 17 fin
.F.lru_replacement._6.if.then.0:
  mv s11, t3                                                            # ir inst 18 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 19 fin
  lw s11, 0(s10)                                                        # ir inst 20 fin
  slt s10, s11, t5                                                      # ir inst 21 fin
  bnez s10, .F.lru_replacement._7.if.then.1
  j .F.lru_replacement._8.if.else.1                                     # ir inst 22 fin
.F.lru_replacement._7.if.then.1:
  mv s11, t3                                                            # ir inst 23 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 24 fin
  lw s11, 0(t3)                                                         # ir inst 25 fin
# Phi connections
  mv t3, s11
  mv s11, t6
  j .F.lru_replacement._9.if.exit.1                                     # ir inst 26 fin
.F.lru_replacement._8.if.else.1:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.lru_replacement._9.if.exit.1                                     # ir inst 27 fin
.F.lru_replacement._9.if.exit.1:
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.lru_replacement._11.if.exit.0                                    # ir inst 30 fin
.F.lru_replacement._10.if.else.0:
# Phi connections
  mv t3, t4
  j .F.lru_replacement._11.if.exit.0                                    # ir inst 31 fin
.F.lru_replacement._11.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 34 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.lru_replacement._1.while.cond.0                                  # ir inst 35 fin
.F.lru_replacement._12.while.exit.0:
  mv a0, t4
  j .F.lru_replacement.epilogue                                         # ir inst 36 fin
.F.lru_replacement.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.working_set_replacement
.F.working_set_replacement:
# spill func args num: 0,             range:      256(sp) -      256(sp)
# local var size: 256,                range:        0(sp) -      256(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -256
.F.working_set_replacement._0.entry.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.working_set_replacement._1.array.cond.0                          # ir inst 3 fin
.F.working_set_replacement._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.working_set_replacement._2.array.body.0
  j .F.working_set_replacement._3.array.exit.0                          # ir inst 6 fin
.F.working_set_replacement._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.working_set_replacement._1.array.cond.0                          # ir inst 10 fin
.F.working_set_replacement._3.array.exit.0:
  slt t0, a2, a3
  xori t6, t0, 1                                                        # ir inst 11 fin
  bnez t6, .F.working_set_replacement._4.if.then.0
  j .F.working_set_replacement._5.if.else.0                             # ir inst 12 fin
.F.working_set_replacement._4.if.then.0:
  sub t6, a2, a3                                                        # ir inst 13 fin
# Phi connections
  j .F.working_set_replacement._6.if.exit.0                             # ir inst 14 fin
.F.working_set_replacement._5.if.else.0:
  sub t6, a3, a2                                                        # ir inst 15 fin
  li t1, 1000
  sub t5, t1, t6                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.working_set_replacement._6.if.exit.0                             # ir inst 17 fin
.F.working_set_replacement._6.if.exit.0:
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.working_set_replacement._7.while.cond.0                          # ir inst 19 fin
.F.working_set_replacement._7.while.cond.0:
  slt t4, t6, a3                                                        # ir inst 22 fin
  bnez t4, .F.working_set_replacement._8.while.body.0
  j .F.working_set_replacement._21.while.exit.0                         # ir inst 23 fin
.F.working_set_replacement._8.while.body.0:
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 24 fin
  bnez t4, .F.working_set_replacement._9.lazy.then.0
  j .F.working_set_replacement._10.lazy.else.0                          # ir inst 25 fin
.F.working_set_replacement._9.lazy.then.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 26 fin
# Phi connections
  j .F.working_set_replacement._11.lazy.exit.0                          # ir inst 27 fin
.F.working_set_replacement._10.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.working_set_replacement._11.lazy.exit.0                          # ir inst 28 fin
.F.working_set_replacement._11.lazy.exit.0:
  bnez t4, .F.working_set_replacement._12.if.then.1
  j .F.working_set_replacement._19.if.else.1                            # ir inst 30 fin
.F.working_set_replacement._12.if.then.1:
  mv t4, t5                                                             # ir inst 31 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 32 fin
  lw t4, 0(t3)                                                          # ir inst 33 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 34 fin
  bnez t3, .F.working_set_replacement._13.lazy.then.1
  j .F.working_set_replacement._14.lazy.else.1                          # ir inst 35 fin
.F.working_set_replacement._13.lazy.then.1:
  li t2, 256
  slt t3, t4, t2                                                        # ir inst 36 fin
# Phi connections
  j .F.working_set_replacement._15.lazy.exit.1                          # ir inst 37 fin
.F.working_set_replacement._14.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.working_set_replacement._15.lazy.exit.1                          # ir inst 38 fin
.F.working_set_replacement._15.lazy.exit.1:
  bnez t3, .F.working_set_replacement._16.if.then.2
  j .F.working_set_replacement._17.if.else.2                            # ir inst 40 fin
.F.working_set_replacement._16.if.then.2:
  mv t3, t4                                                             # ir inst 41 fin
  addi t1, sp, 0
  add t4, t1, t3                                                        # ir inst 42 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 43 fin
  j .F.working_set_replacement._18.if.exit.2                            # ir inst 44 fin
.F.working_set_replacement._17.if.else.2:
  j .F.working_set_replacement._18.if.exit.2                            # ir inst 45 fin
.F.working_set_replacement._18.if.exit.2:
  j .F.working_set_replacement._20.if.exit.1                            # ir inst 46 fin
.F.working_set_replacement._19.if.else.1:
  j .F.working_set_replacement._20.if.exit.1                            # ir inst 47 fin
.F.working_set_replacement._20.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 48 fin
  li t2, 1000
  rem t5, t4, t2                                                        # ir inst 49 fin
  addi t4, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t4
  j .F.working_set_replacement._7.while.cond.0                          # ir inst 51 fin
.F.working_set_replacement._21.while.exit.0:
# Phi connections
  li t6, 0
  j .F.working_set_replacement._22.while.cond.1                         # ir inst 52 fin
.F.working_set_replacement._22.while.cond.1:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 54 fin
  bnez t5, .F.working_set_replacement._23.while.body.1
  j .F.working_set_replacement._33.while.exit.1                         # ir inst 55 fin
.F.working_set_replacement._23.while.body.1:
  mv t5, t6                                                             # ir inst 56 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 57 fin
  lw t5, 0(t4)                                                          # ir inst 58 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 59 fin
  bnez t4, .F.working_set_replacement._24.lazy.then.2
  j .F.working_set_replacement._25.lazy.else.2                          # ir inst 60 fin
.F.working_set_replacement._24.lazy.then.2:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 61 fin
# Phi connections
  j .F.working_set_replacement._26.lazy.exit.2                          # ir inst 62 fin
.F.working_set_replacement._25.lazy.else.2:
# Phi connections
  li t4, 0
  j .F.working_set_replacement._26.lazy.exit.2                          # ir inst 63 fin
.F.working_set_replacement._26.lazy.exit.2:
  bnez t4, .F.working_set_replacement._27.lazy.then.3
  j .F.working_set_replacement._28.lazy.else.3                          # ir inst 65 fin
.F.working_set_replacement._27.lazy.then.3:
  mv t4, t5                                                             # ir inst 66 fin
  addi t1, sp, 0
  add t5, t1, t4                                                        # ir inst 67 fin
  lb t4, 0(t5)                                                          # ir inst 68 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 69 fin
# Phi connections
  j .F.working_set_replacement._29.lazy.exit.3                          # ir inst 70 fin
.F.working_set_replacement._28.lazy.else.3:
# Phi connections
  li t5, 0
  j .F.working_set_replacement._29.lazy.exit.3                          # ir inst 71 fin
.F.working_set_replacement._29.lazy.exit.3:
  bnez t5, .F.working_set_replacement._30.if.then.3
  j .F.working_set_replacement._31.if.else.3                            # ir inst 73 fin
.F.working_set_replacement._30.if.then.3:
  mv a0, t6
  j .F.working_set_replacement.epilogue                                 # ir inst 74 fin
.F.working_set_replacement._31.if.else.3:
  j .F.working_set_replacement._32.if.exit.3                            # ir inst 75 fin
.F.working_set_replacement._32.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 76 fin
# Phi connections
  mv t6, t5
  j .F.working_set_replacement._22.while.cond.1                         # ir inst 77 fin
.F.working_set_replacement._33.while.exit.1:
  li t2, 7
  mul t6, a2, t2                                                        # ir inst 78 fin
  li t2, 64
  rem t5, t6, t2                                                        # ir inst 79 fin
  mv a0, t5
  j .F.working_set_replacement.epilogue                                 # ir inst 80 fin
.F.working_set_replacement.epilogue:
  addi sp, sp, 256
  ret

.globl .F.adaptive_replacement
.F.adaptive_replacement:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 0,                  range:      128(sp) -      128(sp)
# return addr size: 8,                range:      120(sp) -      128(sp)
# callee save reg num: 3 / 12,        range:       96(sp) -      120(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s9, 96(sp)
  sd s10, 104(sp)
  sd s11, 112(sp)
  sd ra, 120(sp)
.F.adaptive_replacement._0.entry.0:
# Phi connections
  li t4, -1
  li t5, 0
  li t6, 0
  j .F.adaptive_replacement._1.while.cond.0                             # ir inst 1 fin
.F.adaptive_replacement._1.while.cond.0:
  li t2, 64
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.adaptive_replacement._2.while.body.0
  j .F.adaptive_replacement._21.while.exit.0                            # ir inst 6 fin
.F.adaptive_replacement._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 10 fin
  bnez s11, .F.adaptive_replacement._3.lazy.then.0
  j .F.adaptive_replacement._4.lazy.else.0                              # ir inst 11 fin
.F.adaptive_replacement._3.lazy.then.0:
  li t2, 256
  slt s11, t3, t2                                                       # ir inst 12 fin
# Phi connections
  j .F.adaptive_replacement._5.lazy.exit.0                              # ir inst 13 fin
.F.adaptive_replacement._4.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.adaptive_replacement._5.lazy.exit.0                              # ir inst 14 fin
.F.adaptive_replacement._5.lazy.exit.0:
  bnez s11, .F.adaptive_replacement._6.if.then.0
  j .F.adaptive_replacement._19.if.else.0                               # ir inst 16 fin
.F.adaptive_replacement._6.if.then.0:
  mv s11, t3                                                            # ir inst 17 fin
  slli t2, s11, 2
  add s10, a3, t2                                                       # ir inst 18 fin
  lw s11, 0(s10)                                                        # ir inst 19 fin
  sub s10, a4, s11                                                      # ir inst 20 fin
  li t2, 10
  div s11, s10, t2                                                      # ir inst 21 fin
  mv s10, t3                                                            # ir inst 22 fin
  add s9, a1, s10                                                       # ir inst 23 fin
  lb s10, 0(s9)                                                         # ir inst 24 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 25 fin
  bnez s9, .F.adaptive_replacement._7.if.then.1
  j .F.adaptive_replacement._8.if.else.1                                # ir inst 26 fin
.F.adaptive_replacement._7.if.then.1:
  addi s10, s11, 50                                                     # ir inst 27 fin
# Phi connections
  mv s11, s10
  j .F.adaptive_replacement._9.if.exit.1                                # ir inst 28 fin
.F.adaptive_replacement._8.if.else.1:
# Phi connections
  j .F.adaptive_replacement._9.if.exit.1                                # ir inst 29 fin
.F.adaptive_replacement._9.if.exit.1:
  mv s10, t3                                                            # ir inst 31 fin
  add s9, a2, s10                                                       # ir inst 32 fin
  lb s10, 0(s9)                                                         # ir inst 33 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 34 fin
  bnez s9, .F.adaptive_replacement._10.if.then.2
  j .F.adaptive_replacement._11.if.else.2                               # ir inst 35 fin
.F.adaptive_replacement._10.if.then.2:
  addi s10, s11, 30                                                     # ir inst 36 fin
# Phi connections
  mv s11, s10
  j .F.adaptive_replacement._12.if.exit.2                               # ir inst 37 fin
.F.adaptive_replacement._11.if.else.2:
# Phi connections
  j .F.adaptive_replacement._12.if.exit.2                               # ir inst 38 fin
.F.adaptive_replacement._12.if.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd t4, 64(sp)
  sd a7, 72(sp)
  sd t5, 80(sp)
  sd t6, 88(sp)
  mv a3, a7
  mv a2, a6
  mv a1, a5
  mv a0, t3
  call .F.check_working_set_membership
  mv s10, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld t4, 64(sp)
  ld a7, 72(sp)
  ld t5, 80(sp)
  ld t6, 88(sp)
# ir inst 40 fin
  li t2, 0
  xor t0, s10, t2
  sltiu t3, t0, 1                                                       # ir inst 41 fin
  bnez t3, .F.adaptive_replacement._13.if.then.3
  j .F.adaptive_replacement._14.if.else.3                               # ir inst 42 fin
.F.adaptive_replacement._13.if.then.3:
  addi t3, s11, 40                                                      # ir inst 43 fin
# Phi connections
  j .F.adaptive_replacement._15.if.exit.3                               # ir inst 44 fin
.F.adaptive_replacement._14.if.else.3:
# Phi connections
  mv t3, s11
  j .F.adaptive_replacement._15.if.exit.3                               # ir inst 45 fin
.F.adaptive_replacement._15.if.exit.3:
  slt s11, t4, t3                                                       # ir inst 47 fin
  bnez s11, .F.adaptive_replacement._16.if.then.4
  j .F.adaptive_replacement._17.if.else.4                               # ir inst 48 fin
.F.adaptive_replacement._16.if.then.4:
# Phi connections
  mv s11, t3
  mv t3, t6
  j .F.adaptive_replacement._18.if.exit.4                               # ir inst 49 fin
.F.adaptive_replacement._17.if.else.4:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.adaptive_replacement._18.if.exit.4                               # ir inst 50 fin
.F.adaptive_replacement._18.if.exit.4:
# Phi connections
  mv t4, t3
  mv t3, s11
  j .F.adaptive_replacement._20.if.exit.0                               # ir inst 53 fin
.F.adaptive_replacement._19.if.else.0:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.adaptive_replacement._20.if.exit.0                               # ir inst 54 fin
.F.adaptive_replacement._20.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 57 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.adaptive_replacement._1.while.cond.0                             # ir inst 58 fin
.F.adaptive_replacement._21.while.exit.0:
  mv a0, t5
  j .F.adaptive_replacement.epilogue                                    # ir inst 59 fin
.F.adaptive_replacement.epilogue:
  ld ra, 120(sp)
  ld s9, 96(sp)
  ld s10, 104(sp)
  ld s11, 112(sp)
  addi sp, sp, 128
  ret

.globl .F.check_working_set_membership
.F.check_working_set_membership:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.check_working_set_membership._0.entry.0:
  slt t0, a2, a3
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.check_working_set_membership._1.if.then.0
  j .F.check_working_set_membership._2.if.else.0                        # ir inst 2 fin
.F.check_working_set_membership._1.if.then.0:
  sub t6, a2, a3                                                        # ir inst 3 fin
# Phi connections
  j .F.check_working_set_membership._3.if.exit.0                        # ir inst 4 fin
.F.check_working_set_membership._2.if.else.0:
  sub t6, a3, a2                                                        # ir inst 5 fin
  li t1, 1000
  sub t5, t1, t6                                                        # ir inst 6 fin
# Phi connections
  mv t6, t5
  j .F.check_working_set_membership._3.if.exit.0                        # ir inst 7 fin
.F.check_working_set_membership._3.if.exit.0:
# Phi connections
  li t5, 0
  j .F.check_working_set_membership._4.while.cond.0                     # ir inst 9 fin
.F.check_working_set_membership._4.while.cond.0:
  slt t4, t5, a3                                                        # ir inst 12 fin
  bnez t4, .F.check_working_set_membership._5.while.body.0
  j .F.check_working_set_membership._15.while.exit.0                    # ir inst 13 fin
.F.check_working_set_membership._5.while.body.0:
  li t2, 0
  slt t0, t6, t2
  xori t4, t0, 1                                                        # ir inst 14 fin
  bnez t4, .F.check_working_set_membership._6.lazy.then.0
  j .F.check_working_set_membership._7.lazy.else.0                      # ir inst 15 fin
.F.check_working_set_membership._6.lazy.then.0:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 16 fin
# Phi connections
  j .F.check_working_set_membership._8.lazy.exit.0                      # ir inst 17 fin
.F.check_working_set_membership._7.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.check_working_set_membership._8.lazy.exit.0                      # ir inst 18 fin
.F.check_working_set_membership._8.lazy.exit.0:
  bnez t4, .F.check_working_set_membership._9.lazy.then.1
  j .F.check_working_set_membership._10.lazy.else.1                     # ir inst 20 fin
.F.check_working_set_membership._9.lazy.then.1:
  mv t4, t6                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  xor t0, t4, a0
  sltiu t3, t0, 1                                                       # ir inst 24 fin
# Phi connections
  mv t4, t3
  j .F.check_working_set_membership._11.lazy.exit.1                     # ir inst 25 fin
.F.check_working_set_membership._10.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.check_working_set_membership._11.lazy.exit.1                     # ir inst 26 fin
.F.check_working_set_membership._11.lazy.exit.1:
  bnez t4, .F.check_working_set_membership._12.if.then.1
  j .F.check_working_set_membership._13.if.else.1                       # ir inst 28 fin
.F.check_working_set_membership._12.if.then.1:
  li a0, 1
  j .F.check_working_set_membership.epilogue                            # ir inst 29 fin
.F.check_working_set_membership._13.if.else.1:
  j .F.check_working_set_membership._14.if.exit.1                       # ir inst 30 fin
.F.check_working_set_membership._14.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 31 fin
  li t2, 1000
  rem t6, t4, t2                                                        # ir inst 32 fin
  addi t4, t5, 1                                                        # ir inst 33 fin
# Phi connections
  mv t5, t4
  j .F.check_working_set_membership._4.while.cond.0                     # ir inst 34 fin
.F.check_working_set_membership._15.while.exit.0:
  li a0, 0
  j .F.check_working_set_membership.epilogue                            # ir inst 35 fin
.F.check_working_set_membership.epilogue:
  ret

.globl .F.access_l1_cache
.F.access_l1_cache:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 2 / 12,        range:       56(sp) -       72(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.access_l1_cache._0.entry.0:
  li t2, 64
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 64
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 64
  div t6, a0, t2                                                        # ir inst 3 fin
  li t2, 64
  div t4, t6, t2                                                        # ir inst 4 fin
# Phi connections
  li t6, 0
  j .F.access_l1_cache._1.while.cond.0                                  # ir inst 5 fin
.F.access_l1_cache._1.while.cond.0:
  li t2, 4
  slt t3, t6, t2                                                        # ir inst 7 fin
  bnez t3, .F.access_l1_cache._2.while.body.0
  j .F.access_l1_cache._9.while.exit.0                                  # ir inst 8 fin
.F.access_l1_cache._2.while.body.0:
  mv t3, t5                                                             # ir inst 9 fin
  slli t2, t3, 2
  add s11, a3, t2                                                       # ir inst 10 fin
  mv t3, t6                                                             # ir inst 11 fin
  add s10, s11, t3                                                      # ir inst 12 fin
  lb t3, 0(s10)                                                         # ir inst 13 fin
  bnez t3, .F.access_l1_cache._3.lazy.then.0
  j .F.access_l1_cache._4.lazy.else.0                                   # ir inst 14 fin
.F.access_l1_cache._3.lazy.then.0:
  mv t3, t5                                                             # ir inst 15 fin
  slli t2, t3, 4
  add s11, a2, t2                                                       # ir inst 16 fin
  mv t3, t6                                                             # ir inst 17 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 18 fin
  lw t3, 0(s10)                                                         # ir inst 19 fin
  xor t0, t3, t4
  sltiu s11, t0, 1                                                      # ir inst 20 fin
# Phi connections
  mv t3, s11
  j .F.access_l1_cache._5.lazy.exit.0                                   # ir inst 21 fin
.F.access_l1_cache._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.access_l1_cache._5.lazy.exit.0                                   # ir inst 22 fin
.F.access_l1_cache._5.lazy.exit.0:
  bnez t3, .F.access_l1_cache._6.if.then.0
  j .F.access_l1_cache._7.if.else.0                                     # ir inst 24 fin
.F.access_l1_cache._6.if.then.0:
# Start call preparation
  sd a2, 0(sp)
  sd a3, 8(sp)
  sd a4, 16(sp)
  sd a5, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a3, a5
  mv a2, t6
  mv a1, t5
  mv a0, a4
  li a4, 4
  call .F.update_cache_lru
  ld a2, 0(sp)
  ld a3, 8(sp)
  ld a4, 16(sp)
  ld a5, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 25 fin
  li a0, 1
  j .F.access_l1_cache.epilogue                                         # ir inst 26 fin
.F.access_l1_cache._7.if.else.0:
  j .F.access_l1_cache._8.if.exit.0                                     # ir inst 27 fin
.F.access_l1_cache._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t6, t3
  j .F.access_l1_cache._1.while.cond.0                                  # ir inst 29 fin
.F.access_l1_cache._9.while.exit.0:
# Start call preparation
  sd a2, 0(sp)
  sd a3, 8(sp)
  sd a4, 16(sp)
  sd a5, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  li a2, 4
  mv a1, t5
  mv a0, a4
  call .F.find_lru_way
  mv t6, a0
  ld a2, 0(sp)
  ld a3, 8(sp)
  ld a4, 16(sp)
  ld a5, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
# ir inst 30 fin
  mv t3, t5                                                             # ir inst 31 fin
  slli t2, t3, 4
  add s11, a2, t2                                                       # ir inst 32 fin
  mv t3, t6                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 34 fin
  sw t4, 0(s10)                                                         # ir inst 35 fin
  mv t4, t5                                                             # ir inst 36 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 37 fin
  mv t4, t6                                                             # ir inst 38 fin
  add s11, t3, t4                                                       # ir inst 39 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 40 fin
# Start call preparation
  sd a4, 0(sp)
  sd a5, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, a5
  mv a2, t6
  mv a1, t5
  mv a0, a4
  li a4, 4
  call .F.update_cache_lru
  ld a4, 0(sp)
  ld a5, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
  li a0, 0
  j .F.access_l1_cache.epilogue                                         # ir inst 42 fin
.F.access_l1_cache.epilogue:
  ld ra, 72(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.access_l2_cache
.F.access_l2_cache:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 2 / 12,        range:       56(sp) -       72(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.access_l2_cache._0.entry.0:
  li t2, 64
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 128
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 64
  div t6, a0, t2                                                        # ir inst 3 fin
  li t2, 128
  div t4, t6, t2                                                        # ir inst 4 fin
# Phi connections
  li t6, 0
  j .F.access_l2_cache._1.while.cond.0                                  # ir inst 5 fin
.F.access_l2_cache._1.while.cond.0:
  li t2, 8
  slt t3, t6, t2                                                        # ir inst 7 fin
  bnez t3, .F.access_l2_cache._2.while.body.0
  j .F.access_l2_cache._9.while.exit.0                                  # ir inst 8 fin
.F.access_l2_cache._2.while.body.0:
  mv t3, t5                                                             # ir inst 9 fin
  slli t2, t3, 3
  add s11, a3, t2                                                       # ir inst 10 fin
  mv t3, t6                                                             # ir inst 11 fin
  add s10, s11, t3                                                      # ir inst 12 fin
  lb t3, 0(s10)                                                         # ir inst 13 fin
  bnez t3, .F.access_l2_cache._3.lazy.then.0
  j .F.access_l2_cache._4.lazy.else.0                                   # ir inst 14 fin
.F.access_l2_cache._3.lazy.then.0:
  mv t3, t5                                                             # ir inst 15 fin
  slli t2, t3, 5
  add s11, a2, t2                                                       # ir inst 16 fin
  mv t3, t6                                                             # ir inst 17 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 18 fin
  lw t3, 0(s10)                                                         # ir inst 19 fin
  xor t0, t3, t4
  sltiu s11, t0, 1                                                      # ir inst 20 fin
# Phi connections
  mv t3, s11
  j .F.access_l2_cache._5.lazy.exit.0                                   # ir inst 21 fin
.F.access_l2_cache._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.access_l2_cache._5.lazy.exit.0                                   # ir inst 22 fin
.F.access_l2_cache._5.lazy.exit.0:
  bnez t3, .F.access_l2_cache._6.if.then.0
  j .F.access_l2_cache._7.if.else.0                                     # ir inst 24 fin
.F.access_l2_cache._6.if.then.0:
# Start call preparation
  sd a2, 0(sp)
  sd a3, 8(sp)
  sd a4, 16(sp)
  sd a5, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a3, a5
  mv a2, t6
  mv a1, t5
  mv a0, a4
  call .F.update_cache_lru_8way
  ld a2, 0(sp)
  ld a3, 8(sp)
  ld a4, 16(sp)
  ld a5, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 25 fin
  li a0, 1
  j .F.access_l2_cache.epilogue                                         # ir inst 26 fin
.F.access_l2_cache._7.if.else.0:
  j .F.access_l2_cache._8.if.exit.0                                     # ir inst 27 fin
.F.access_l2_cache._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t6, t3
  j .F.access_l2_cache._1.while.cond.0                                  # ir inst 29 fin
.F.access_l2_cache._9.while.exit.0:
# Start call preparation
  sd a2, 0(sp)
  sd a3, 8(sp)
  sd a4, 16(sp)
  sd a5, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  mv a1, t5
  mv a0, a4
  call .F.find_lru_way_8
  mv t6, a0
  ld a2, 0(sp)
  ld a3, 8(sp)
  ld a4, 16(sp)
  ld a5, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
# ir inst 30 fin
  mv t3, t5                                                             # ir inst 31 fin
  slli t2, t3, 5
  add s11, a2, t2                                                       # ir inst 32 fin
  mv t3, t6                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 34 fin
  sw t4, 0(s10)                                                         # ir inst 35 fin
  mv t4, t5                                                             # ir inst 36 fin
  slli t2, t4, 3
  add t3, a3, t2                                                        # ir inst 37 fin
  mv t4, t6                                                             # ir inst 38 fin
  add s11, t3, t4                                                       # ir inst 39 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 40 fin
# Start call preparation
  sd a4, 0(sp)
  sd a5, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, a5
  mv a2, t6
  mv a1, t5
  mv a0, a4
  call .F.update_cache_lru_8way
  ld a4, 0(sp)
  ld a5, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
  li a0, 0
  j .F.access_l2_cache.epilogue                                         # ir inst 42 fin
.F.access_l2_cache.epilogue:
  ld ra, 72(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.update_cache_lru
.F.update_cache_lru:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.update_cache_lru._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 4
  add t5, a0, t2                                                        # ir inst 2 fin
  mv t6, a2                                                             # ir inst 3 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 4 fin
  sw a3, 0(t4)                                                          # ir inst 5 fin
  j .F.update_cache_lru.epilogue                                        # ir inst 6 fin
.F.update_cache_lru.epilogue:
  ret

.globl .F.update_cache_lru_8way
.F.update_cache_lru_8way:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.update_cache_lru_8way._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 5
  add t5, a0, t2                                                        # ir inst 2 fin
  mv t6, a2                                                             # ir inst 3 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 4 fin
  sw a3, 0(t4)                                                          # ir inst 5 fin
  j .F.update_cache_lru_8way.epilogue                                   # ir inst 6 fin
.F.update_cache_lru_8way.epilogue:
  ret

.globl .F.find_lru_way
.F.find_lru_way:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.find_lru_way._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 4
  add t5, a0, t2                                                        # ir inst 2 fin
  addi t6, t5, 0                                                        # ir inst 3 fin
  lw t5, 0(t6)                                                          # ir inst 4 fin
# Phi connections
  li t4, 1
  mv t6, t5
  li t5, 0
  j .F.find_lru_way._1.while.cond.0                                     # ir inst 5 fin
.F.find_lru_way._1.while.cond.0:
  slt t3, t4, a2                                                        # ir inst 9 fin
  bnez t3, .F.find_lru_way._2.while.body.0
  j .F.find_lru_way._6.while.exit.0                                     # ir inst 10 fin
.F.find_lru_way._2.while.body.0:
  mv t3, a1                                                             # ir inst 11 fin
  slli t2, t3, 4
  add s11, a0, t2                                                       # ir inst 12 fin
  mv t3, t4                                                             # ir inst 13 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 14 fin
  lw t3, 0(s10)                                                         # ir inst 15 fin
  slt s11, t3, t6                                                       # ir inst 16 fin
  bnez s11, .F.find_lru_way._3.if.then.0
  j .F.find_lru_way._4.if.else.0                                        # ir inst 17 fin
.F.find_lru_way._3.if.then.0:
  mv t3, a1                                                             # ir inst 18 fin
  slli t2, t3, 4
  add s11, a0, t2                                                       # ir inst 19 fin
  mv t3, t4                                                             # ir inst 20 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 21 fin
  lw t3, 0(s10)                                                         # ir inst 22 fin
# Phi connections
  mv t6, t3
  mv t3, t4
  j .F.find_lru_way._5.if.exit.0                                        # ir inst 23 fin
.F.find_lru_way._4.if.else.0:
# Phi connections
  mv t3, t5
  j .F.find_lru_way._5.if.exit.0                                        # ir inst 24 fin
.F.find_lru_way._5.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 27 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.find_lru_way._1.while.cond.0                                     # ir inst 28 fin
.F.find_lru_way._6.while.exit.0:
  mv a0, t5
  j .F.find_lru_way.epilogue                                            # ir inst 29 fin
.F.find_lru_way.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.find_lru_way_8
.F.find_lru_way_8:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.find_lru_way_8._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 5
  add t5, a0, t2                                                        # ir inst 2 fin
  addi t6, t5, 0                                                        # ir inst 3 fin
  lw t5, 0(t6)                                                          # ir inst 4 fin
# Phi connections
  li t4, 0
  li t6, 1
  j .F.find_lru_way_8._1.while.cond.0                                   # ir inst 5 fin
.F.find_lru_way_8._1.while.cond.0:
  li t2, 8
  slt t3, t6, t2                                                        # ir inst 9 fin
  bnez t3, .F.find_lru_way_8._2.while.body.0
  j .F.find_lru_way_8._6.while.exit.0                                   # ir inst 10 fin
.F.find_lru_way_8._2.while.body.0:
  mv t3, a1                                                             # ir inst 11 fin
  slli t2, t3, 5
  add s11, a0, t2                                                       # ir inst 12 fin
  mv t3, t6                                                             # ir inst 13 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 14 fin
  lw t3, 0(s10)                                                         # ir inst 15 fin
  slt s11, t3, t5                                                       # ir inst 16 fin
  bnez s11, .F.find_lru_way_8._3.if.then.0
  j .F.find_lru_way_8._4.if.else.0                                      # ir inst 17 fin
.F.find_lru_way_8._3.if.then.0:
  mv t3, a1                                                             # ir inst 18 fin
  slli t2, t3, 5
  add s11, a0, t2                                                       # ir inst 19 fin
  mv t3, t6                                                             # ir inst 20 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 21 fin
  lw t3, 0(s10)                                                         # ir inst 22 fin
# Phi connections
  mv t5, t3
  mv t3, t6
  j .F.find_lru_way_8._5.if.exit.0                                      # ir inst 23 fin
.F.find_lru_way_8._4.if.else.0:
# Phi connections
  mv t3, t4
  j .F.find_lru_way_8._5.if.exit.0                                      # ir inst 24 fin
.F.find_lru_way_8._5.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 27 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.find_lru_way_8._1.while.cond.0                                   # ir inst 28 fin
.F.find_lru_way_8._6.while.exit.0:
  mv a0, t4
  j .F.find_lru_way_8.epilogue                                          # ir inst 29 fin
.F.find_lru_way_8.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.analyze_memory_fragmentation
.F.analyze_memory_fragmentation:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
.F.analyze_memory_fragmentation._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.analyze_memory_fragmentation._1.while.cond.0                     # ir inst 1 fin
.F.analyze_memory_fragmentation._1.while.cond.0:
  slt s11, t6, a1                                                       # ir inst 6 fin
  bnez s11, .F.analyze_memory_fragmentation._2.while.body.0
  j .F.analyze_memory_fragmentation._12.while.exit.0                    # ir inst 7 fin
.F.analyze_memory_fragmentation._2.while.body.0:
  mv s11, t6                                                            # ir inst 8 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 9 fin
  lw s11, 0(s10)                                                        # ir inst 10 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 11 fin
  bnez s10, .F.analyze_memory_fragmentation._3.if.then.0
  j .F.analyze_memory_fragmentation._4.if.else.0                        # ir inst 12 fin
.F.analyze_memory_fragmentation._3.if.then.0:
  addi s11, t4, 1                                                       # ir inst 13 fin
  addi s10, t5, 1                                                       # ir inst 14 fin
# Phi connections
  mv s9, t3
  mv t0, s10
  mv s10, s11
  mv s11, t0
  j .F.analyze_memory_fragmentation._11.if.exit.0                       # ir inst 15 fin
.F.analyze_memory_fragmentation._4.if.else.0:
  li t2, 0
  slt s11, t2, t4                                                       # ir inst 16 fin
  bnez s11, .F.analyze_memory_fragmentation._5.if.then.1
  j .F.analyze_memory_fragmentation._9.if.else.1                        # ir inst 17 fin
.F.analyze_memory_fragmentation._5.if.then.1:
  slt s11, t3, t4                                                       # ir inst 18 fin
  bnez s11, .F.analyze_memory_fragmentation._6.if.then.2
  j .F.analyze_memory_fragmentation._7.if.else.2                        # ir inst 19 fin
.F.analyze_memory_fragmentation._6.if.then.2:
# Phi connections
  mv s11, t4
  j .F.analyze_memory_fragmentation._8.if.exit.2                        # ir inst 20 fin
.F.analyze_memory_fragmentation._7.if.else.2:
# Phi connections
  mv s11, t3
  j .F.analyze_memory_fragmentation._8.if.exit.2                        # ir inst 21 fin
.F.analyze_memory_fragmentation._8.if.exit.2:
# Phi connections
  mv s10, s11
  li s11, 0
  j .F.analyze_memory_fragmentation._10.if.exit.1                       # ir inst 23 fin
.F.analyze_memory_fragmentation._9.if.else.1:
# Phi connections
  mv s10, t3
  mv s11, t4
  j .F.analyze_memory_fragmentation._10.if.exit.1                       # ir inst 24 fin
.F.analyze_memory_fragmentation._10.if.exit.1:
# Phi connections
  mv s9, s10
  mv s10, s11
  mv s11, t5
  j .F.analyze_memory_fragmentation._11.if.exit.0                       # ir inst 27 fin
.F.analyze_memory_fragmentation._11.if.exit.0:
  addi s8, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t3, s9
  mv t4, s10
  mv t5, s11
  mv t6, s8
  j .F.analyze_memory_fragmentation._1.while.cond.0                     # ir inst 32 fin
.F.analyze_memory_fragmentation._12.while.exit.0:
  li t2, 0
  slt t6, t2, t4                                                        # ir inst 33 fin
  bnez t6, .F.analyze_memory_fragmentation._13.if.then.3
  j .F.analyze_memory_fragmentation._17.if.else.3                       # ir inst 34 fin
.F.analyze_memory_fragmentation._13.if.then.3:
  slt t6, t3, t4                                                        # ir inst 35 fin
  bnez t6, .F.analyze_memory_fragmentation._14.if.then.4
  j .F.analyze_memory_fragmentation._15.if.else.4                       # ir inst 36 fin
.F.analyze_memory_fragmentation._14.if.then.4:
# Phi connections
  mv t6, t4
  j .F.analyze_memory_fragmentation._16.if.exit.4                       # ir inst 37 fin
.F.analyze_memory_fragmentation._15.if.else.4:
# Phi connections
  mv t6, t3
  j .F.analyze_memory_fragmentation._16.if.exit.4                       # ir inst 38 fin
.F.analyze_memory_fragmentation._16.if.exit.4:
# Phi connections
  j .F.analyze_memory_fragmentation._18.if.exit.3                       # ir inst 40 fin
.F.analyze_memory_fragmentation._17.if.else.3:
# Phi connections
  mv t6, t3
  j .F.analyze_memory_fragmentation._18.if.exit.3                       # ir inst 41 fin
.F.analyze_memory_fragmentation._18.if.exit.3:
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 43 fin
  bnez t4, .F.analyze_memory_fragmentation._19.if.then.5
  j .F.analyze_memory_fragmentation._20.if.else.5                       # ir inst 44 fin
.F.analyze_memory_fragmentation._19.if.then.5:
# Phi connections
  li t6, 0
  j .F.analyze_memory_fragmentation._21.if.exit.5                       # ir inst 45 fin
.F.analyze_memory_fragmentation._20.if.else.5:
  li t2, 100
  mul t4, t6, t2                                                        # ir inst 46 fin
  div t6, t4, t5                                                        # ir inst 47 fin
  li t1, 100
  sub t5, t1, t6                                                        # ir inst 48 fin
# Phi connections
  mv t6, t5
  j .F.analyze_memory_fragmentation._21.if.exit.5                       # ir inst 49 fin
.F.analyze_memory_fragmentation._21.if.exit.5:
  mv a0, t6
  j .F.analyze_memory_fragmentation.epilogue                            # ir inst 51 fin
.F.analyze_memory_fragmentation.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.compact_memory
.F.compact_memory:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.compact_memory._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.compact_memory._1.while.cond.0                                   # ir inst 1 fin
.F.compact_memory._1.while.cond.0:
  slt t4, t5, a5                                                        # ir inst 4 fin
  bnez t4, .F.compact_memory._2.while.body.0
  j .F.compact_memory._15.while.exit.0                                  # ir inst 5 fin
.F.compact_memory._2.while.body.0:
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.compact_memory._3.if.then.0
  j .F.compact_memory._13.if.else.0                                     # ir inst 10 fin
.F.compact_memory._3.if.then.0:
  xor t0, t5, t6
  sltu t4, zero, t0                                                     # ir inst 11 fin
  bnez t4, .F.compact_memory._4.if.then.1
  j .F.compact_memory._11.if.else.1                                     # ir inst 12 fin
.F.compact_memory._4.if.then.1:
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  mv t3, t6                                                             # ir inst 16 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 17 fin
  sw t4, 0(s11)                                                         # ir inst 18 fin
  mv t3, t5                                                             # ir inst 19 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 20 fin
  li t1, -1
  sw t1, 0(s11)                                                         # ir inst 21 fin
  mv t3, t6                                                             # ir inst 22 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 23 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 24 fin
  mv t3, t5                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 26 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 27 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 28 fin
  bnez t3, .F.compact_memory._5.lazy.then.0
  j .F.compact_memory._6.lazy.else.0                                    # ir inst 29 fin
.F.compact_memory._5.lazy.then.0:
  li t2, 256
  slt t3, t4, t2                                                        # ir inst 30 fin
# Phi connections
  j .F.compact_memory._7.lazy.exit.0                                    # ir inst 31 fin
.F.compact_memory._6.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.compact_memory._7.lazy.exit.0                                    # ir inst 32 fin
.F.compact_memory._7.lazy.exit.0:
  bnez t3, .F.compact_memory._8.if.then.2
  j .F.compact_memory._9.if.else.2                                      # ir inst 34 fin
.F.compact_memory._8.if.then.2:
  li t2, 16
  div t3, t4, t2                                                        # ir inst 35 fin
  li t2, 16
  rem s11, t4, t2                                                       # ir inst 36 fin
  mv t4, t3                                                             # ir inst 37 fin
  slli t2, t4, 6
  add t3, a0, t2                                                        # ir inst 38 fin
  mv t4, s11                                                            # ir inst 39 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 40 fin
  addi t4, t6, 1                                                        # ir inst 41 fin
  sw t4, 0(s11)                                                         # ir inst 42 fin
  j .F.compact_memory._10.if.exit.2                                     # ir inst 43 fin
.F.compact_memory._9.if.else.2:
  j .F.compact_memory._10.if.exit.2                                     # ir inst 44 fin
.F.compact_memory._10.if.exit.2:
  j .F.compact_memory._12.if.exit.1                                     # ir inst 45 fin
.F.compact_memory._11.if.else.1:
  j .F.compact_memory._12.if.exit.1                                     # ir inst 46 fin
.F.compact_memory._12.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 47 fin
# Phi connections
  j .F.compact_memory._14.if.exit.0                                     # ir inst 48 fin
.F.compact_memory._13.if.else.0:
# Phi connections
  mv t4, t6
  j .F.compact_memory._14.if.exit.0                                     # ir inst 49 fin
.F.compact_memory._14.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.compact_memory._1.while.cond.0                                   # ir inst 52 fin
.F.compact_memory._15.while.exit.0:
  sub t5, a5, t6                                                        # ir inst 53 fin
  sw t5, 0(a4)                                                          # ir inst 54 fin
# Phi connections
  li t5, 0
  j .F.compact_memory._16.while.cond.1                                  # ir inst 55 fin
.F.compact_memory._16.while.cond.1:
  lw t4, 0(a4)                                                          # ir inst 57 fin
  slt t3, t5, t4                                                        # ir inst 58 fin
  bnez t3, .F.compact_memory._17.while.body.1
  j .F.compact_memory._18.while.exit.1                                  # ir inst 59 fin
.F.compact_memory._17.while.body.1:
  mv t4, t5                                                             # ir inst 60 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 61 fin
  add t4, t6, t5                                                        # ir inst 62 fin
  sw t4, 0(t3)                                                          # ir inst 63 fin
  addi t4, t5, 1                                                        # ir inst 64 fin
# Phi connections
  mv t5, t4
  j .F.compact_memory._16.while.cond.1                                  # ir inst 65 fin
.F.compact_memory._18.while.exit.1:
  j .F.compact_memory.epilogue                                          # ir inst 66 fin
.F.compact_memory.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.calculate_working_set_size
.F.calculate_working_set_size:
# spill func args num: 0,             range:      272(sp) -      272(sp)
# local var size: 256,                range:       16(sp) -      272(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -272
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.calculate_working_set_size._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.calculate_working_set_size._1.array.cond.0                       # ir inst 3 fin
.F.calculate_working_set_size._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.calculate_working_set_size._2.array.body.0
  j .F.calculate_working_set_size._3.array.exit.0                       # ir inst 6 fin
.F.calculate_working_set_size._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.calculate_working_set_size._1.array.cond.0                       # ir inst 10 fin
.F.calculate_working_set_size._3.array.exit.0:
  slt t0, a1, a2
  xori t6, t0, 1                                                        # ir inst 11 fin
  bnez t6, .F.calculate_working_set_size._4.if.then.0
  j .F.calculate_working_set_size._5.if.else.0                          # ir inst 12 fin
.F.calculate_working_set_size._4.if.then.0:
  sub t6, a1, a2                                                        # ir inst 13 fin
# Phi connections
  j .F.calculate_working_set_size._6.if.exit.0                          # ir inst 14 fin
.F.calculate_working_set_size._5.if.else.0:
  sub t6, a2, a1                                                        # ir inst 15 fin
  li t1, 1000
  sub t5, t1, t6                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.calculate_working_set_size._6.if.exit.0                          # ir inst 17 fin
.F.calculate_working_set_size._6.if.exit.0:
# Phi connections
  mv t4, t6
  li t5, 0
  li t6, 0
  j .F.calculate_working_set_size._7.while.cond.0                       # ir inst 19 fin
.F.calculate_working_set_size._7.while.cond.0:
  slt t3, t5, a2                                                        # ir inst 23 fin
  bnez t3, .F.calculate_working_set_size._8.while.body.0
  j .F.calculate_working_set_size._24.while.exit.0                      # ir inst 24 fin
.F.calculate_working_set_size._8.while.body.0:
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 25 fin
  bnez t3, .F.calculate_working_set_size._9.lazy.then.0
  j .F.calculate_working_set_size._10.lazy.else.0                       # ir inst 26 fin
.F.calculate_working_set_size._9.lazy.then.0:
  li t2, 1000
  slt t3, t4, t2                                                        # ir inst 27 fin
# Phi connections
  j .F.calculate_working_set_size._11.lazy.exit.0                       # ir inst 28 fin
.F.calculate_working_set_size._10.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.calculate_working_set_size._11.lazy.exit.0                       # ir inst 29 fin
.F.calculate_working_set_size._11.lazy.exit.0:
  bnez t3, .F.calculate_working_set_size._12.if.then.1
  j .F.calculate_working_set_size._22.if.else.1                         # ir inst 31 fin
.F.calculate_working_set_size._12.if.then.1:
  mv t3, t4                                                             # ir inst 32 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 33 fin
  lw t3, 0(s11)                                                         # ir inst 34 fin
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 35 fin
  bnez s11, .F.calculate_working_set_size._13.lazy.then.1
  j .F.calculate_working_set_size._14.lazy.else.1                       # ir inst 36 fin
.F.calculate_working_set_size._13.lazy.then.1:
  li t2, 256
  slt s11, t3, t2                                                       # ir inst 37 fin
# Phi connections
  j .F.calculate_working_set_size._15.lazy.exit.1                       # ir inst 38 fin
.F.calculate_working_set_size._14.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.calculate_working_set_size._15.lazy.exit.1                       # ir inst 39 fin
.F.calculate_working_set_size._15.lazy.exit.1:
  bnez s11, .F.calculate_working_set_size._16.lazy.then.2
  j .F.calculate_working_set_size._17.lazy.else.2                       # ir inst 41 fin
.F.calculate_working_set_size._16.lazy.then.2:
  mv s11, t3                                                            # ir inst 42 fin
  addi t1, sp, 16
  add s10, t1, s11                                                      # ir inst 43 fin
  lb s11, 0(s10)                                                        # ir inst 44 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 45 fin
# Phi connections
  mv s11, s10
  j .F.calculate_working_set_size._18.lazy.exit.2                       # ir inst 46 fin
.F.calculate_working_set_size._17.lazy.else.2:
# Phi connections
  li s11, 0
  j .F.calculate_working_set_size._18.lazy.exit.2                       # ir inst 47 fin
.F.calculate_working_set_size._18.lazy.exit.2:
  bnez s11, .F.calculate_working_set_size._19.if.then.2
  j .F.calculate_working_set_size._20.if.else.2                         # ir inst 49 fin
.F.calculate_working_set_size._19.if.then.2:
  mv s11, t3                                                            # ir inst 50 fin
  addi t1, sp, 16
  add t3, t1, s11                                                       # ir inst 51 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 52 fin
  addi t3, t6, 1                                                        # ir inst 53 fin
# Phi connections
  j .F.calculate_working_set_size._21.if.exit.2                         # ir inst 54 fin
.F.calculate_working_set_size._20.if.else.2:
# Phi connections
  mv t3, t6
  j .F.calculate_working_set_size._21.if.exit.2                         # ir inst 55 fin
.F.calculate_working_set_size._21.if.exit.2:
# Phi connections
  j .F.calculate_working_set_size._23.if.exit.1                         # ir inst 57 fin
.F.calculate_working_set_size._22.if.else.1:
# Phi connections
  mv t3, t6
  j .F.calculate_working_set_size._23.if.exit.1                         # ir inst 58 fin
.F.calculate_working_set_size._23.if.exit.1:
  addi s11, t4, 1                                                       # ir inst 60 fin
  li t2, 1000
  rem t4, s11, t2                                                       # ir inst 61 fin
  addi s11, t5, 1                                                       # ir inst 62 fin
# Phi connections
  mv t5, s11
  mv t6, t3
  j .F.calculate_working_set_size._7.while.cond.0                       # ir inst 63 fin
.F.calculate_working_set_size._24.while.exit.0:
  mv a0, t6
  j .F.calculate_working_set_size.epilogue                              # ir inst 64 fin
.F.calculate_working_set_size.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 272
  ret

.globl .F.adjust_cache_policies
.F.adjust_cache_policies:
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
.F.adjust_cache_policies._0.entry.0:
  add t6, a2, a3                                                        # ir inst 1 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 2 fin
  bnez t5, .F.adjust_cache_policies._1.if.then.0
  j .F.adjust_cache_policies._2.if.else.0                               # ir inst 3 fin
.F.adjust_cache_policies._1.if.then.0:
  li t2, 100
  mul t6, a2, t2                                                        # ir inst 4 fin
  add t5, a2, a3                                                        # ir inst 5 fin
  div t4, t6, t5                                                        # ir inst 6 fin
# Phi connections
  mv t6, t4
  j .F.adjust_cache_policies._3.if.exit.0                               # ir inst 7 fin
.F.adjust_cache_policies._2.if.else.0:
# Phi connections
  li t6, 0
  j .F.adjust_cache_policies._3.if.exit.0                               # ir inst 8 fin
.F.adjust_cache_policies._3.if.exit.0:
  add t5, a4, a5                                                        # ir inst 10 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 11 fin
  bnez t4, .F.adjust_cache_policies._4.if.then.1
  j .F.adjust_cache_policies._5.if.else.1                               # ir inst 12 fin
.F.adjust_cache_policies._4.if.then.1:
  li t2, 100
  mul t5, a4, t2                                                        # ir inst 13 fin
  add t4, a4, a5                                                        # ir inst 14 fin
  div t3, t5, t4                                                        # ir inst 15 fin
# Phi connections
  mv t5, t3
  j .F.adjust_cache_policies._6.if.exit.1                               # ir inst 16 fin
.F.adjust_cache_policies._5.if.else.1:
# Phi connections
  li t5, 0
  j .F.adjust_cache_policies._6.if.exit.1                               # ir inst 17 fin
.F.adjust_cache_policies._6.if.exit.1:
  li t2, 70
  slt t4, t6, t2                                                        # ir inst 19 fin
  bnez t4, .F.adjust_cache_policies._7.if.then.2
  j .F.adjust_cache_policies._14.if.else.2                              # ir inst 20 fin
.F.adjust_cache_policies._7.if.then.2:
# Phi connections
  li t6, 0
  j .F.adjust_cache_policies._8.while.cond.0                            # ir inst 21 fin
.F.adjust_cache_policies._8.while.cond.0:
  li t2, 64
  slt t4, t6, t2                                                        # ir inst 23 fin
  bnez t4, .F.adjust_cache_policies._9.while.body.0
  j .F.adjust_cache_policies._13.while.exit.0                           # ir inst 24 fin
.F.adjust_cache_policies._9.while.body.0:
# Phi connections
  li t4, 0
  j .F.adjust_cache_policies._10.while.cond.1                           # ir inst 25 fin
.F.adjust_cache_policies._10.while.cond.1:
  li t2, 4
  slt t3, t4, t2                                                        # ir inst 27 fin
  bnez t3, .F.adjust_cache_policies._11.while.body.1
  j .F.adjust_cache_policies._12.while.exit.1                           # ir inst 28 fin
.F.adjust_cache_policies._11.while.body.1:
  mv t3, t6                                                             # ir inst 29 fin
  slli t2, t3, 4
  add s11, a0, t2                                                       # ir inst 30 fin
  mv t3, t4                                                             # ir inst 31 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 32 fin
  mv t3, t6                                                             # ir inst 33 fin
  slli t2, t3, 4
  add s11, a0, t2                                                       # ir inst 34 fin
  mv t3, t4                                                             # ir inst 35 fin
  slli t2, t3, 2
  add s9, s11, t2                                                       # ir inst 36 fin
  lw t3, 0(s9)                                                          # ir inst 37 fin
  addi s11, t3, -10                                                     # ir inst 38 fin
  sw s11, 0(s10)                                                        # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F.adjust_cache_policies._10.while.cond.1                           # ir inst 41 fin
.F.adjust_cache_policies._12.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t6, t4
  j .F.adjust_cache_policies._8.while.cond.0                            # ir inst 43 fin
.F.adjust_cache_policies._13.while.exit.0:
  j .F.adjust_cache_policies._15.if.exit.2                              # ir inst 44 fin
.F.adjust_cache_policies._14.if.else.2:
  j .F.adjust_cache_policies._15.if.exit.2                              # ir inst 45 fin
.F.adjust_cache_policies._15.if.exit.2:
  li t2, 60
  slt t6, t5, t2                                                        # ir inst 46 fin
  bnez t6, .F.adjust_cache_policies._16.if.then.3
  j .F.adjust_cache_policies._23.if.else.3                              # ir inst 47 fin
.F.adjust_cache_policies._16.if.then.3:
# Phi connections
  li t6, 0
  j .F.adjust_cache_policies._17.while.cond.2                           # ir inst 48 fin
.F.adjust_cache_policies._17.while.cond.2:
  li t2, 128
  slt t5, t6, t2                                                        # ir inst 50 fin
  bnez t5, .F.adjust_cache_policies._18.while.body.2
  j .F.adjust_cache_policies._22.while.exit.2                           # ir inst 51 fin
.F.adjust_cache_policies._18.while.body.2:
# Phi connections
  li t5, 0
  j .F.adjust_cache_policies._19.while.cond.3                           # ir inst 52 fin
.F.adjust_cache_policies._19.while.cond.3:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 54 fin
  bnez t4, .F.adjust_cache_policies._20.while.body.3
  j .F.adjust_cache_policies._21.while.exit.3                           # ir inst 55 fin
.F.adjust_cache_policies._20.while.body.3:
  mv t4, t6                                                             # ir inst 56 fin
  slli t2, t4, 5
  add t3, a1, t2                                                        # ir inst 57 fin
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 59 fin
  mv t4, t6                                                             # ir inst 60 fin
  slli t2, t4, 5
  add t3, a1, t2                                                        # ir inst 61 fin
  mv t4, t5                                                             # ir inst 62 fin
  slli t2, t4, 2
  add s10, t3, t2                                                       # ir inst 63 fin
  lw t4, 0(s10)                                                         # ir inst 64 fin
  addi t3, t4, -15                                                      # ir inst 65 fin
  sw t3, 0(s11)                                                         # ir inst 66 fin
  addi t4, t5, 1                                                        # ir inst 67 fin
# Phi connections
  mv t5, t4
  j .F.adjust_cache_policies._19.while.cond.3                           # ir inst 68 fin
.F.adjust_cache_policies._21.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 69 fin
# Phi connections
  mv t6, t5
  j .F.adjust_cache_policies._17.while.cond.2                           # ir inst 70 fin
.F.adjust_cache_policies._22.while.exit.2:
  j .F.adjust_cache_policies._24.if.exit.3                              # ir inst 71 fin
.F.adjust_cache_policies._23.if.else.3:
  j .F.adjust_cache_policies._24.if.exit.3                              # ir inst 72 fin
.F.adjust_cache_policies._24.if.exit.3:
  j .F.adjust_cache_policies.epilogue                                   # ir inst 73 fin
.F.adjust_cache_policies.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.calculate_average_memory_access_time
.F.calculate_average_memory_access_time:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculate_average_memory_access_time._0.entry.0:
  add t6, a0, a1                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.calculate_average_memory_access_time._1.if.then.0
  j .F.calculate_average_memory_access_time._2.if.else.0                # ir inst 3 fin
.F.calculate_average_memory_access_time._1.if.then.0:
  li a0, 0
  j .F.calculate_average_memory_access_time.epilogue                    # ir inst 4 fin
.F.calculate_average_memory_access_time._2.if.else.0:
  j .F.calculate_average_memory_access_time._3.if.exit.0                # ir inst 5 fin
.F.calculate_average_memory_access_time._3.if.exit.0:
  li t2, 11
  mul t5, a2, t2                                                        # ir inst 6 fin
  add t4, a0, t5                                                        # ir inst 7 fin
  li t2, 111
  mul t5, a3, t2                                                        # ir inst 8 fin
  add t3, t4, t5                                                        # ir inst 9 fin
  li t2, 10000
  mul t5, a4, t2                                                        # ir inst 10 fin
  add t4, t3, t5                                                        # ir inst 11 fin
  div t5, t4, t6                                                        # ir inst 12 fin
  mv a0, t5
  j .F.calculate_average_memory_access_time.epilogue                    # ir inst 13 fin
.F.calculate_average_memory_access_time.epilogue:
  ret
