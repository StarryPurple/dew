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
# spill func args num: 0,             range:   148032(sp) -   148032(sp)
# local var size: 147948,             range:       72(sp) -   148020(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -148032
  add sp, sp, t0
  sd s8, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd s9, 56(sp)
  sd ra, 64(sp)
main._0.entry.0:
# Start call preparation
  li a0, 42
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 4 fin
main._1.array.cond.0:
  li t2, 100
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
  addi t1, sp, 472
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 14 fin
main._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 17 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 21 fin
main._6.array.exit.1:
  addi t1, sp, 872
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 24 fin
main._7.array.cond.2:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 27 fin
main._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 31 fin
main._9.array.exit.2:
  addi t1, sp, 1272
  addi t6, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 34 fin
main._10.array.cond.3:
  li t2, 100
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
  li t1, 21672
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 44 fin
# Phi connections
  li t5, 0
  j main._13.array.cond.4                                               # ir inst 45 fin
main._13.array.cond.4:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 47 fin
  bnez t4, main._14.array.body.4
  j main._15.array.exit.4                                               # ir inst 48 fin
main._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 49 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 50 fin
  addi t4, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t5, t4
  j main._13.array.cond.4                                               # ir inst 52 fin
main._15.array.exit.4:
  addi t1, sp, 1672
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j main._16.array.cond.5                                               # ir inst 54 fin
main._16.array.cond.5:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, main._17.array.body.5
  j main._18.array.exit.5                                               # ir inst 57 fin
main._17.array.body.5:
  li t1, 200
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 58 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 200
  li t1, 21672
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j main._16.array.cond.5                                               # ir inst 61 fin
main._18.array.exit.5:
  li t1, 21872
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 63 fin
# Phi connections
  li t5, 0
  j main._19.array.cond.6                                               # ir inst 64 fin
main._19.array.cond.6:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 66 fin
  bnez t4, main._20.array.body.6
  j main._21.array.exit.6                                               # ir inst 67 fin
main._20.array.body.6:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 68 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 69 fin
  addi t4, t5, 1                                                        # ir inst 70 fin
# Phi connections
  mv t5, t4
  j main._19.array.cond.6                                               # ir inst 71 fin
main._21.array.exit.6:
  li t1, 22272
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 73 fin
# Phi connections
  li t5, 0
  j main._22.array.cond.7                                               # ir inst 74 fin
main._22.array.cond.7:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 76 fin
  bnez t4, main._23.array.body.7
  j main._24.array.exit.7                                               # ir inst 77 fin
main._23.array.body.7:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 78 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 79 fin
  addi t4, t5, 1                                                        # ir inst 80 fin
# Phi connections
  mv t5, t4
  j main._22.array.cond.7                                               # ir inst 81 fin
main._24.array.exit.7:
  li t1, 22672
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 83 fin
# Phi connections
  li t5, 0
  j main._25.array.cond.8                                               # ir inst 84 fin
main._25.array.cond.8:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 86 fin
  bnez t4, main._26.array.body.8
  j main._27.array.exit.8                                               # ir inst 87 fin
main._26.array.body.8:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 88 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 89 fin
  addi t4, t5, 1                                                        # ir inst 90 fin
# Phi connections
  mv t5, t4
  j main._25.array.cond.8                                               # ir inst 91 fin
main._27.array.exit.8:
  li t1, 63072
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 94 fin
# Phi connections
  li t5, 0
  j main._28.array.cond.9                                               # ir inst 95 fin
main._28.array.cond.9:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 97 fin
  bnez t4, main._29.array.body.9
  j main._30.array.exit.9                                               # ir inst 98 fin
main._29.array.body.9:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 99 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 100 fin
  addi t4, t5, 1                                                        # ir inst 101 fin
# Phi connections
  mv t5, t4
  j main._28.array.cond.9                                               # ir inst 102 fin
main._30.array.exit.9:
  li t1, 23072
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 103 fin
# Phi connections
  li t5, 0
  j main._31.array.cond.10                                              # ir inst 104 fin
main._31.array.cond.10:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 106 fin
  bnez t4, main._32.array.body.10
  j main._33.array.exit.10                                              # ir inst 107 fin
main._32.array.body.10:
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 108 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 400
  li t1, 63072
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 109 fin
  addi t4, t5, 1                                                        # ir inst 110 fin
# Phi connections
  mv t5, t4
  j main._31.array.cond.10                                              # ir inst 111 fin
main._33.array.exit.10:
  li t1, 103472
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 114 fin
# Phi connections
  li t5, 0
  j main._34.array.cond.11                                              # ir inst 115 fin
main._34.array.cond.11:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 117 fin
  bnez t4, main._35.array.body.11
  j main._36.array.exit.11                                              # ir inst 118 fin
main._35.array.body.11:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 119 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 120 fin
  addi t4, t5, 1                                                        # ir inst 121 fin
# Phi connections
  mv t5, t4
  j main._34.array.cond.11                                              # ir inst 122 fin
main._36.array.exit.11:
  li t1, 63472
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 123 fin
# Phi connections
  li t5, 0
  j main._37.array.cond.12                                              # ir inst 124 fin
main._37.array.cond.12:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 126 fin
  bnez t4, main._38.array.body.12
  j main._39.array.exit.12                                              # ir inst 127 fin
main._38.array.body.12:
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 128 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 400
  li t1, 103472
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 129 fin
  addi t4, t5, 1                                                        # ir inst 130 fin
# Phi connections
  mv t5, t4
  j main._37.array.cond.12                                              # ir inst 131 fin
main._39.array.exit.12:
  li t1, 143872
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 134 fin
# Phi connections
  li t5, 0
  j main._40.array.cond.13                                              # ir inst 135 fin
main._40.array.cond.13:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 137 fin
  bnez t4, main._41.array.body.13
  j main._42.array.exit.13                                              # ir inst 138 fin
main._41.array.body.13:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 139 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 140 fin
  addi t4, t5, 1                                                        # ir inst 141 fin
# Phi connections
  mv t5, t4
  j main._40.array.cond.13                                              # ir inst 142 fin
main._42.array.exit.13:
  li t1, 103872
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 143 fin
# Phi connections
  li t5, 0
  j main._43.array.cond.14                                              # ir inst 144 fin
main._43.array.cond.14:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 146 fin
  bnez t4, main._44.array.body.14
  j main._45.array.exit.14                                              # ir inst 147 fin
main._44.array.body.14:
  li t1, 40
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 148 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 40
  li t1, 143872
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 149 fin
  addi t4, t5, 1                                                        # ir inst 150 fin
# Phi connections
  mv t5, t4
  j main._43.array.cond.14                                              # ir inst 151 fin
main._45.array.exit.14:
# alloca %90
  li t2, 143912
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 153 fin
# alloca %91
  li t2, 143916
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 155 fin
  li t1, 143920
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 157 fin
# Phi connections
  li t5, 0
  j main._46.array.cond.15                                              # ir inst 158 fin
main._46.array.cond.15:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 160 fin
  bnez t4, main._47.array.body.15
  j main._48.array.exit.15                                              # ir inst 161 fin
main._47.array.body.15:
  add t4, t6, t5                                                        # ir inst 162 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 163 fin
  addi t4, t5, 1                                                        # ir inst 164 fin
# Phi connections
  mv t5, t4
  j main._46.array.cond.15                                              # ir inst 165 fin
main._48.array.exit.15:
  li t1, 144020
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 167 fin
# Phi connections
  li t5, 0
  j main._49.array.cond.16                                              # ir inst 168 fin
main._49.array.cond.16:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 170 fin
  bnez t4, main._50.array.body.16
  j main._51.array.exit.16                                              # ir inst 171 fin
main._50.array.body.16:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 172 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 173 fin
  addi t4, t5, 1                                                        # ir inst 174 fin
# Phi connections
  mv t5, t4
  j main._49.array.cond.16                                              # ir inst 175 fin
main._51.array.exit.16:
# Phi connections
  li t6, 0
  j main._52.while.cond.0                                               # ir inst 176 fin
main._52.while.cond.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 178 fin
  bnez t5, main._53.while.body.0
  j main._57.while.exit.0                                               # ir inst 179 fin
main._53.while.body.0:
  mv t5, t6                                                             # ir inst 180 fin
  slli t2, t5, 2
  addi t1, sp, 72
  add t4, t1, t2                                                        # ir inst 181 fin
  li t2, 17
  mul t5, t6, t2                                                        # ir inst 182 fin
  addi t3, t5, 23                                                       # ir inst 183 fin
  sw t3, 0(t4)                                                          # ir inst 184 fin
  mv t5, t6                                                             # ir inst 185 fin
  slli t2, t5, 2
  addi t1, sp, 472
  add t4, t1, t2                                                        # ir inst 186 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 187 fin
  mv t5, t6                                                             # ir inst 188 fin
  slli t2, t5, 2
  addi t1, sp, 872
  add t4, t1, t2                                                        # ir inst 189 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 190 fin
  mv t5, t6                                                             # ir inst 191 fin
  slli t2, t5, 2
  addi t1, sp, 1272
  add t4, t1, t2                                                        # ir inst 192 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 193 fin
  mv t5, t6                                                             # ir inst 194 fin
  slli t2, t5, 2
  li t1, 21872
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 195 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 196 fin
  mv t5, t6                                                             # ir inst 197 fin
  li t1, 200
  mul t2, t5, t1
  addi t1, sp, 1672
  add t4, t1, t2                                                        # ir inst 198 fin
  addi t5, t4, 0                                                        # ir inst 199 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 200 fin
  mv t5, t6                                                             # ir inst 201 fin
  slli t2, t5, 2
  li t1, 22272
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 202 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 203 fin
  mv t5, t6                                                             # ir inst 204 fin
  slli t2, t5, 2
  li t1, 22672
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 205 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 206 fin
# Phi connections
  li t5, 0
  j main._54.while.cond.1                                               # ir inst 207 fin
main._54.while.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 209 fin
  bnez t4, main._55.while.body.1
  j main._56.while.exit.1                                               # ir inst 210 fin
main._55.while.body.1:
  mv t4, t6                                                             # ir inst 211 fin
  li t1, 400
  mul t2, t4, t1
  li t1, 23072
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 212 fin
  mv t4, t5                                                             # ir inst 213 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 214 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 215 fin
  mv t4, t6                                                             # ir inst 216 fin
  li t1, 400
  mul t2, t4, t1
  li t1, 63472
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 217 fin
  mv t4, t5                                                             # ir inst 218 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 219 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 220 fin
  addi t4, t5, 1                                                        # ir inst 221 fin
# Phi connections
  mv t5, t4
  j main._54.while.cond.1                                               # ir inst 222 fin
main._56.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 223 fin
# Phi connections
  mv t6, t5
  j main._52.while.cond.0                                               # ir inst 224 fin
main._57.while.exit.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j main._58.while.cond.2                                               # ir inst 225 fin
main._58.while.cond.2:
  li t2, 1000
  slt s11, t6, t2                                                       # ir inst 230 fin
  bnez s11, main._59.while.body.2
  j main._84.while.exit.2                                               # ir inst 231 fin
main._59.while.body.2:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 100
  mv a1, t6
  li t1, 143920
  add t1, sp, t1
  mv a0, t1
  call .F.simulate_network_conditions
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 232 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a6, t6
  li a5, 100
  li t1, 143916
  add t1, sp, t1
  mv a4, t1
  li t1, 103872
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1272
  mv a2, t1
  addi t1, sp, 872
  mv a1, t1
  addi t1, sp, 472
  mv a0, t1
  call .F.process_timeouts
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 233 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 22272
  add t1, sp, t1
  sd t1, -40(sp)
  li t1, 23072
  add t1, sp, t1
  sd t1, -32(sp)
  li t1, 63472
  add t1, sp, t1
  sd t1, -24(sp)
  li t1, 143920
  add t1, sp, t1
  sd t1, -16(sp)
  li t1, 100
  sd t1, -8(sp)
  li t1, 21872
  add t1, sp, t1
  mv a7, t1
  addi t1, sp, 1672
  mv a6, t1
  addi t1, sp, 1272
  mv a5, t1
  addi t1, sp, 872
  mv a4, t1
  addi t1, sp, 472
  mv a3, t1
  li t1, 143916
  add t1, sp, t1
  mv a2, t1
  li t1, 143912
  add t1, sp, t1
  mv a1, t1
  li t1, 103872
  add t1, sp, t1
  mv a0, t1
  call .F.process_message_queue
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 234 fin
  add s10, t5, s11                                                      # ir inst 235 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 100
  addi t1, sp, 872
  mv a1, t1
  addi t1, sp, 472
  mv a0, t1
  call .F.check_leader_election
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 236 fin
  li t2, 0
  slt t0, s11, t2
  xori s9, t0, 1                                                        # ir inst 237 fin
  bnez s9, main._60.if.then.0
  j main._61.if.else.0                                                  # ir inst 238 fin
main._60.if.then.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 143920
  add t1, sp, t1
  sd t1, -24(sp)
  li t1, 100
  sd t1, -16(sp)
  sd t6, -8(sp)
  li t1, 143916
  add t1, sp, t1
  mv a7, t1
  li t1, 103872
  add t1, sp, t1
  mv a6, t1
  li t1, 63472
  add t1, sp, t1
  mv a5, t1
  li t1, 23072
  add t1, sp, t1
  mv a4, t1
  li t1, 22272
  add t1, sp, t1
  mv a3, t1
  li t1, 21872
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 1672
  mv a1, t1
  mv a0, s11
  call .F.simulate_log_replication
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 239 fin
  j main._62.if.exit.0                                                  # ir inst 240 fin
main._61.if.else.0:
  j main._62.if.exit.0                                                  # ir inst 241 fin
main._62.if.exit.0:
  li t2, 0
  slt t0, s11, t2
  xori s9, t0, 1                                                        # ir inst 242 fin
  bnez s9, main._63.lazy.then.0
  j main._64.lazy.else.0                                                # ir inst 243 fin
main._63.lazy.then.0:
  li t2, 10
  rem s9, t6, t2                                                        # ir inst 244 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 245 fin
# Phi connections
  mv s9, s8
  j main._65.lazy.exit.0                                                # ir inst 246 fin
main._64.lazy.else.0:
# Phi connections
  li s9, 0
  j main._65.lazy.exit.0                                                # ir inst 247 fin
main._65.lazy.exit.0:
  bnez s9, main._66.if.then.1
  j main._67.if.else.1                                                  # ir inst 249 fin
main._66.if.then.1:
  li t2, 10
  div s9, t6, t2                                                        # ir inst 250 fin
  addi s8, s9, 1000                                                     # ir inst 251 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 21872
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1672
  mv a2, t1
  mv a1, s8
  mv a0, s11
  call .F.append_log_entry
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 252 fin
  j main._68.if.exit.1                                                  # ir inst 253 fin
main._67.if.else.1:
  j main._68.if.exit.1                                                  # ir inst 254 fin
main._68.if.exit.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a5, 100
  li t1, 22272
  add t1, sp, t1
  mv a4, t1
  li t1, 21872
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1672
  mv a2, t1
  addi t1, sp, 872
  mv a1, t1
  addi t1, sp, 472
  mv a0, t1
  call .F.verify_system_consistency
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 255 fin
  li t2, 80
  slt s9, s11, t2                                                       # ir inst 256 fin
  bnez s9, main._69.lazy.then.1
  j main._70.lazy.else.1                                                # ir inst 257 fin
main._69.lazy.then.1:
  li t2, 100
  slt s11, t2, t6                                                       # ir inst 258 fin
# Phi connections
  j main._71.lazy.exit.1                                                # ir inst 259 fin
main._70.lazy.else.1:
# Phi connections
  li s11, 0
  j main._71.lazy.exit.1                                                # ir inst 260 fin
main._71.lazy.exit.1:
  bnez s11, main._72.if.then.2
  j main._73.if.else.2                                                  # ir inst 262 fin
main._72.if.then.2:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a3, 100
  addi t1, sp, 1272
  mv a2, t1
  addi t1, sp, 872
  mv a1, t1
  addi t1, sp, 472
  mv a0, t1
  call .F.trigger_recovery_protocol
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 263 fin
  addi s11, t4, 1                                                       # ir inst 264 fin
# Phi connections
  j main._74.if.exit.2                                                  # ir inst 265 fin
main._73.if.else.2:
# Phi connections
  mv s11, t4
  j main._74.if.exit.2                                                  # ir inst 266 fin
main._74.if.exit.2:
  li t2, 50
  rem s9, t6, t2                                                        # ir inst 268 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 269 fin
  bnez s8, main._75.if.then.3
  j main._76.if.else.3                                                  # ir inst 270 fin
main._75.if.then.3:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t6
  li a2, 100
  li t1, 143920
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 472
  mv a0, t1
  call .F.simulate_byzantine_failures
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 271 fin
  j main._77.if.exit.3                                                  # ir inst 272 fin
main._76.if.else.3:
  j main._77.if.exit.3                                                  # ir inst 273 fin
main._77.if.exit.3:
  li t2, 100
  rem s9, t6, t2                                                        # ir inst 274 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 275 fin
  bnez s8, main._78.if.then.4
  j main._79.if.else.4                                                  # ir inst 276 fin
main._78.if.then.4:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a3, 100
  li t1, 22272
  add t1, sp, t1
  mv a2, t1
  li t1, 21872
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1672
  mv a0, t1
  call .F.compact_logs
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 277 fin
  j main._80.if.exit.4                                                  # ir inst 278 fin
main._79.if.else.4:
  j main._80.if.exit.4                                                  # ir inst 279 fin
main._80.if.exit.4:
  addi s9, t6, 1                                                        # ir inst 280 fin
  li t2, 100
  rem t6, s9, t2                                                        # ir inst 281 fin
  li t2, 0
  xor t0, t6, t2
  sltiu s8, t0, 1                                                       # ir inst 282 fin
  bnez s8, main._81.if.then.5
  j main._82.if.else.5                                                  # ir inst 283 fin
main._81.if.then.5:
  addi t6, t3, 1                                                        # ir inst 284 fin
# Phi connections
  j main._83.if.exit.5                                                  # ir inst 285 fin
main._82.if.else.5:
# Phi connections
  mv t6, t3
  j main._83.if.exit.5                                                  # ir inst 286 fin
main._83.if.exit.5:
# Phi connections
  mv t3, t6
  mv t4, s11
  mv t5, s10
  mv t6, s9
  j main._58.while.cond.2                                               # ir inst 288 fin
main._84.while.exit.2:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  li a2, 100
  addi t1, sp, 872
  mv a1, t1
  addi t1, sp, 472
  mv a0, t1
  call .F.find_stable_leader
  mv t6, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 289 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a1, 100
  li t1, 22272
  add t1, sp, t1
  mv a0, t1
  call .F.count_total_committed_entries
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 290 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  mv a0, t5
  call .F.calculate_network_efficiency
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 291 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a3, 100
  li t1, 22272
  add t1, sp, t1
  mv a2, t1
  li t1, 21872
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1672
  mv a0, t1
  call .F.compute_system_state_hash
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 292 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 293 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  mv a0, s11
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 294 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 295 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  mv a0, s9
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 296 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  li a0, 0
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 297 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  mv a0, t4
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 298 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  mv a0, t5
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
# ir inst 299 fin
# Start call preparation
  sd t3, 0(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
# ir inst 300 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 301 fin
  j main.epilogue                                                       # ir inst 302 fin
main.epilogue:
  ld ra, 64(sp)
  ld s8, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  ld s9, 56(sp)
  li t0, 148032
  add sp, sp, t0
  ret

.globl .F.simulate_network_conditions
.F.simulate_network_conditions:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.simulate_network_conditions._0.entry.0:
  li t2, 200
  rem t6, a1, t2                                                        # ir inst 1 fin
  li t2, 50
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.simulate_network_conditions._1.if.then.0
  j .F.simulate_network_conditions._5.if.else.0                         # ir inst 3 fin
.F.simulate_network_conditions._1.if.then.0:
# Phi connections
  li t6, 0
  j .F.simulate_network_conditions._2.while.cond.0                      # ir inst 4 fin
.F.simulate_network_conditions._2.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 6 fin
  bnez t5, .F.simulate_network_conditions._3.while.body.0
  j .F.simulate_network_conditions._4.while.exit.0                      # ir inst 7 fin
.F.simulate_network_conditions._3.while.body.0:
  mv t5, t6                                                             # ir inst 8 fin
  add t4, a0, t5                                                        # ir inst 9 fin
  li t2, 7
  mul t5, t6, t2                                                        # ir inst 10 fin
  add t3, t5, a1                                                        # ir inst 11 fin
  li t2, 3
  rem t5, t3, t2                                                        # ir inst 12 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 13 fin
  sb t3, 0(t4)                                                          # ir inst 14 fin
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F.simulate_network_conditions._2.while.cond.0                      # ir inst 16 fin
.F.simulate_network_conditions._4.while.exit.0:
  j .F.simulate_network_conditions._18.if.exit.0                        # ir inst 17 fin
.F.simulate_network_conditions._5.if.else.0:
  li t2, 200
  rem t6, a1, t2                                                        # ir inst 18 fin
  li t2, 150
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 19 fin
  bnez t5, .F.simulate_network_conditions._6.if.then.1
  j .F.simulate_network_conditions._10.if.else.1                        # ir inst 20 fin
.F.simulate_network_conditions._6.if.then.1:
# Phi connections
  li t6, 0
  j .F.simulate_network_conditions._7.while.cond.1                      # ir inst 21 fin
.F.simulate_network_conditions._7.while.cond.1:
  slt t5, t6, a2                                                        # ir inst 23 fin
  bnez t5, .F.simulate_network_conditions._8.while.body.1
  j .F.simulate_network_conditions._9.while.exit.1                      # ir inst 24 fin
.F.simulate_network_conditions._8.while.body.1:
  mv t5, t6                                                             # ir inst 25 fin
  add t4, a0, t5                                                        # ir inst 26 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 27 fin
  addi t5, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t6, t5
  j .F.simulate_network_conditions._7.while.cond.1                      # ir inst 29 fin
.F.simulate_network_conditions._9.while.exit.1:
  j .F.simulate_network_conditions._17.if.exit.1                        # ir inst 30 fin
.F.simulate_network_conditions._10.if.else.1:
  li t2, 80
  rem t6, a1, t2                                                        # ir inst 31 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 32 fin
  bnez t5, .F.simulate_network_conditions._11.if.then.2
  j .F.simulate_network_conditions._15.if.else.2                        # ir inst 33 fin
.F.simulate_network_conditions._11.if.then.2:
# Phi connections
  li t6, 0
  j .F.simulate_network_conditions._12.while.cond.2                     # ir inst 34 fin
.F.simulate_network_conditions._12.while.cond.2:
  slt t5, t6, a2                                                        # ir inst 36 fin
  bnez t5, .F.simulate_network_conditions._13.while.body.2
  j .F.simulate_network_conditions._14.while.exit.2                     # ir inst 37 fin
.F.simulate_network_conditions._13.while.body.2:
  mv t5, t6                                                             # ir inst 38 fin
  add t4, a0, t5                                                        # ir inst 39 fin
  li t2, 13
  mul t5, t6, t2                                                        # ir inst 40 fin
  li t2, 7
  mul t3, a1, t2                                                        # ir inst 41 fin
  add s11, t5, t3                                                       # ir inst 42 fin
  li t2, 17
  rem t5, s11, t2                                                       # ir inst 43 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 44 fin
  sb t3, 0(t4)                                                          # ir inst 45 fin
  addi t5, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  j .F.simulate_network_conditions._12.while.cond.2                     # ir inst 47 fin
.F.simulate_network_conditions._14.while.exit.2:
  j .F.simulate_network_conditions._16.if.exit.2                        # ir inst 48 fin
.F.simulate_network_conditions._15.if.else.2:
  j .F.simulate_network_conditions._16.if.exit.2                        # ir inst 49 fin
.F.simulate_network_conditions._16.if.exit.2:
  j .F.simulate_network_conditions._17.if.exit.1                        # ir inst 50 fin
.F.simulate_network_conditions._17.if.exit.1:
  j .F.simulate_network_conditions._18.if.exit.0                        # ir inst 51 fin
.F.simulate_network_conditions._18.if.exit.0:
  j .F.simulate_network_conditions.epilogue                             # ir inst 52 fin
.F.simulate_network_conditions.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.process_timeouts
.F.process_timeouts:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.process_timeouts._0.entry.0:
# Phi connections
  li t6, 0
  j .F.process_timeouts._1.while.cond.0                                 # ir inst 1 fin
.F.process_timeouts._1.while.cond.0:
  slt t5, t6, a5                                                        # ir inst 3 fin
  bnez t5, .F.process_timeouts._2.while.body.0
  j .F.process_timeouts._27.while.exit.0                                # ir inst 4 fin
.F.process_timeouts._2.while.body.0:
  li t2, 23
  mul t5, t6, t2                                                        # ir inst 5 fin
  li t2, 7
  mul t4, a6, t2                                                        # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  li t2, 47
  rem t5, t3, t2                                                        # ir inst 8 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F.process_timeouts._3.if.then.0
  j .F.process_timeouts._25.if.else.0                                   # ir inst 10 fin
.F.process_timeouts._3.if.then.0:
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 12 fin
  lw t5, 0(t4)                                                          # ir inst 13 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 14 fin
  bnez t4, .F.process_timeouts._4.lazy.then.0
  j .F.process_timeouts._5.lazy.else.0                                  # ir inst 15 fin
.F.process_timeouts._4.lazy.then.0:
# Phi connections
  li t5, 1
  j .F.process_timeouts._6.lazy.exit.0                                  # ir inst 16 fin
.F.process_timeouts._5.lazy.else.0:
  mv t5, t6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 18 fin
  lw t5, 0(t4)                                                          # ir inst 19 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.process_timeouts._6.lazy.exit.0                                  # ir inst 21 fin
.F.process_timeouts._6.lazy.exit.0:
  bnez t5, .F.process_timeouts._7.if.then.1
  j .F.process_timeouts._14.if.else.1                                   # ir inst 23 fin
.F.process_timeouts._7.if.then.1:
  mv t5, t6                                                             # ir inst 24 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 25 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 26 fin
  mv t5, t6                                                             # ir inst 27 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 28 fin
  mv t5, t6                                                             # ir inst 29 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 30 fin
  lw t5, 0(t3)                                                          # ir inst 31 fin
  addi t3, t5, 1                                                        # ir inst 32 fin
  sw t3, 0(t4)                                                          # ir inst 33 fin
  mv t5, t6                                                             # ir inst 34 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 35 fin
  sw t6, 0(t4)                                                          # ir inst 36 fin
# Phi connections
  li t5, 0
  j .F.process_timeouts._8.while.cond.1                                 # ir inst 37 fin
.F.process_timeouts._8.while.cond.1:
  slt t4, t5, a5                                                        # ir inst 39 fin
  bnez t4, .F.process_timeouts._9.while.body.1
  j .F.process_timeouts._13.while.exit.1                                # ir inst 40 fin
.F.process_timeouts._9.while.body.1:
  xor t0, t5, t6
  sltu t4, zero, t0                                                     # ir inst 41 fin
  bnez t4, .F.process_timeouts._10.if.then.2
  j .F.process_timeouts._11.if.else.2                                   # ir inst 42 fin
.F.process_timeouts._10.if.then.2:
  mv t4, t6                                                             # ir inst 43 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 44 fin
  lw t4, 0(t3)                                                          # ir inst 45 fin
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
  li t1, 0
  sd t1, -8(sp)
  li a7, 0
  li a6, 0
  mv a5, t4
  mv a2, t6
  mv a1, a4
  mv a0, a3
  li a4, 1
  mv a3, t5
  call .F.enqueue_message
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
# ir inst 46 fin
  j .F.process_timeouts._12.if.exit.2                                   # ir inst 47 fin
.F.process_timeouts._11.if.else.2:
  j .F.process_timeouts._12.if.exit.2                                   # ir inst 48 fin
.F.process_timeouts._12.if.exit.2:
  addi t4, t5, 1                                                        # ir inst 49 fin
# Phi connections
  mv t5, t4
  j .F.process_timeouts._8.while.cond.1                                 # ir inst 50 fin
.F.process_timeouts._13.while.exit.1:
  j .F.process_timeouts._24.if.exit.1                                   # ir inst 51 fin
.F.process_timeouts._14.if.else.1:
  mv t5, t6                                                             # ir inst 52 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 53 fin
  lw t5, 0(t4)                                                          # ir inst 54 fin
  li t2, 2
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 55 fin
  bnez t4, .F.process_timeouts._15.if.then.3
  j .F.process_timeouts._22.if.else.3                                   # ir inst 56 fin
.F.process_timeouts._15.if.then.3:
# Phi connections
  li t5, 0
  j .F.process_timeouts._16.while.cond.2                                # ir inst 57 fin
.F.process_timeouts._16.while.cond.2:
  slt t4, t5, a5                                                        # ir inst 59 fin
  bnez t4, .F.process_timeouts._17.while.body.2
  j .F.process_timeouts._21.while.exit.2                                # ir inst 60 fin
.F.process_timeouts._17.while.body.2:
  xor t0, t5, t6
  sltu t4, zero, t0                                                     # ir inst 61 fin
  bnez t4, .F.process_timeouts._18.if.then.4
  j .F.process_timeouts._19.if.else.4                                   # ir inst 62 fin
.F.process_timeouts._18.if.then.4:
  mv t4, t6                                                             # ir inst 63 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 64 fin
  lw t4, 0(t3)                                                          # ir inst 65 fin
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
  li t1, 0
  sd t1, -8(sp)
  li a7, 0
  li a6, 0
  mv a5, t4
  mv a2, t6
  mv a1, a4
  mv a0, a3
  li a4, 2
  mv a3, t5
  call .F.enqueue_message
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
# ir inst 66 fin
  j .F.process_timeouts._20.if.exit.4                                   # ir inst 67 fin
.F.process_timeouts._19.if.else.4:
  j .F.process_timeouts._20.if.exit.4                                   # ir inst 68 fin
.F.process_timeouts._20.if.exit.4:
  addi t4, t5, 1                                                        # ir inst 69 fin
# Phi connections
  mv t5, t4
  j .F.process_timeouts._16.while.cond.2                                # ir inst 70 fin
.F.process_timeouts._21.while.exit.2:
  j .F.process_timeouts._23.if.exit.3                                   # ir inst 71 fin
.F.process_timeouts._22.if.else.3:
  j .F.process_timeouts._23.if.exit.3                                   # ir inst 72 fin
.F.process_timeouts._23.if.exit.3:
  j .F.process_timeouts._24.if.exit.1                                   # ir inst 73 fin
.F.process_timeouts._24.if.exit.1:
  j .F.process_timeouts._26.if.exit.0                                   # ir inst 74 fin
.F.process_timeouts._25.if.else.0:
  j .F.process_timeouts._26.if.exit.0                                   # ir inst 75 fin
.F.process_timeouts._26.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 76 fin
# Phi connections
  mv t6, t5
  j .F.process_timeouts._1.while.cond.0                                 # ir inst 77 fin
.F.process_timeouts._27.while.exit.0:
  j .F.process_timeouts.epilogue                                        # ir inst 78 fin
.F.process_timeouts.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.process_message_queue
.F.process_message_queue:
# spill func args num: 5,             range:      152(sp) -      152(sp)
# local var size: 0,                  range:      152(sp) -      152(sp)
# return addr size: 8,                range:      144(sp) -      152(sp)
# callee save reg num: 6 / 12,        range:       96(sp) -      144(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -192
  sd s9, 96(sp)
  sd s10, 104(sp)
  sd s11, 112(sp)
  sd s6, 120(sp)
  sd s7, 128(sp)
  sd s8, 136(sp)
  sd ra, 144(sp)
.F.process_message_queue._0.entry.0:
# Phi connections
  li t6, 0
  j .F.process_message_queue._1.while.cond.0                            # ir inst 1 fin
.F.process_message_queue._1.while.cond.0:
  lw t5, 0(a1)                                                          # ir inst 3 fin
  lw t4, 0(a2)                                                          # ir inst 4 fin
  xor t0, t5, t4
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.process_message_queue._2.lazy.then.0
  j .F.process_message_queue._3.lazy.else.0                             # ir inst 6 fin
.F.process_message_queue._2.lazy.then.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.process_message_queue._4.lazy.exit.0                             # ir inst 8 fin
.F.process_message_queue._3.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.process_message_queue._4.lazy.exit.0                             # ir inst 9 fin
.F.process_message_queue._4.lazy.exit.0:
  bnez t5, .F.process_message_queue._5.while.body.0
  j .F.process_message_queue._39.while.exit.0                           # ir inst 11 fin
.F.process_message_queue._5.while.body.0:
  lw t5, 0(a1)                                                          # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  li t1, 40
  mul t2, t4, t1
  add t5, a0, t2                                                        # ir inst 14 fin
  addi t4, t5, 0                                                        # ir inst 15 fin
  lw t5, 0(t4)                                                          # ir inst 16 fin
  lw t4, 0(a1)                                                          # ir inst 17 fin
  mv t3, t4                                                             # ir inst 18 fin
  li t1, 40
  mul t2, t3, t1
  add t4, a0, t2                                                        # ir inst 19 fin
  addi t3, t4, 4                                                        # ir inst 20 fin
  lw t4, 0(t3)                                                          # ir inst 21 fin
  lw t3, 0(a1)                                                          # ir inst 22 fin
  mv s11, t3                                                            # ir inst 23 fin
  li t1, 40
  mul t2, s11, t1
  add t3, a0, t2                                                        # ir inst 24 fin
  addi s11, t3, 8                                                       # ir inst 25 fin
  lw t3, 0(s11)                                                         # ir inst 26 fin
  lw s11, 0(a1)                                                         # ir inst 27 fin
  mv s10, s11                                                           # ir inst 28 fin
  li t1, 40
  mul t2, s10, t1
  add s11, a0, t2                                                       # ir inst 29 fin
  addi s10, s11, 12                                                     # ir inst 30 fin
  lw s11, 0(s10)                                                        # ir inst 31 fin
  lw s10, 0(a1)                                                         # ir inst 32 fin
  mv s9, s10                                                            # ir inst 33 fin
  li t1, 40
  mul t2, s9, t1
  add s10, a0, t2                                                       # ir inst 34 fin
  addi s9, s10, 16                                                      # ir inst 35 fin
  lw s10, 0(s9)                                                         # ir inst 36 fin
  lw s9, 0(a1)                                                          # ir inst 37 fin
  mv s8, s9                                                             # ir inst 38 fin
  li t1, 40
  mul t2, s8, t1
  add s9, a0, t2                                                        # ir inst 39 fin
  addi s8, s9, 20                                                       # ir inst 40 fin
  lw s9, 0(s8)                                                          # ir inst 41 fin
  lw s8, 0(a1)                                                          # ir inst 42 fin
  mv s7, s8                                                             # ir inst 43 fin
  li t1, 40
  mul t2, s7, t1
  add s8, a0, t2                                                        # ir inst 44 fin
  addi s7, s8, 24                                                       # ir inst 45 fin
  lw s8, 0(s7)                                                          # ir inst 46 fin
  mv s7, t5                                                             # ir inst 47 fin
  ld t1, 176(sp)
  add s6, t1, s7                                                        # ir inst 48 fin
  lb s7, 0(s6)                                                          # ir inst 49 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 50 fin
  bnez s6, .F.process_message_queue._6.lazy.then.1
  j .F.process_message_queue._7.lazy.else.1                             # ir inst 51 fin
.F.process_message_queue._6.lazy.then.1:
  mv s7, t4                                                             # ir inst 52 fin
  ld t1, 176(sp)
  add s6, t1, s7                                                        # ir inst 53 fin
  lb s7, 0(s6)                                                          # ir inst 54 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 55 fin
# Phi connections
  mv s7, s6
  j .F.process_message_queue._8.lazy.exit.1                             # ir inst 56 fin
.F.process_message_queue._7.lazy.else.1:
# Phi connections
  li s7, 0
  j .F.process_message_queue._8.lazy.exit.1                             # ir inst 57 fin
.F.process_message_queue._8.lazy.exit.1:
  bnez s7, .F.process_message_queue._9.lazy.then.2
  j .F.process_message_queue._10.lazy.else.2                            # ir inst 59 fin
.F.process_message_queue._9.lazy.then.2:
  li t2, 0
  slt t0, t5, t2
  xori s7, t0, 1                                                        # ir inst 60 fin
# Phi connections
  j .F.process_message_queue._11.lazy.exit.2                            # ir inst 61 fin
.F.process_message_queue._10.lazy.else.2:
# Phi connections
  li s7, 0
  j .F.process_message_queue._11.lazy.exit.2                            # ir inst 62 fin
.F.process_message_queue._11.lazy.exit.2:
  bnez s7, .F.process_message_queue._12.lazy.then.3
  j .F.process_message_queue._13.lazy.else.3                            # ir inst 64 fin
.F.process_message_queue._12.lazy.then.3:
  ld t2, 184(sp)
  slt s7, t5, t2                                                        # ir inst 65 fin
# Phi connections
  j .F.process_message_queue._14.lazy.exit.3                            # ir inst 66 fin
.F.process_message_queue._13.lazy.else.3:
# Phi connections
  li s7, 0
  j .F.process_message_queue._14.lazy.exit.3                            # ir inst 67 fin
.F.process_message_queue._14.lazy.exit.3:
  bnez s7, .F.process_message_queue._15.lazy.then.4
  j .F.process_message_queue._16.lazy.else.4                            # ir inst 69 fin
.F.process_message_queue._15.lazy.then.4:
  li t2, 0
  slt t0, t4, t2
  xori s7, t0, 1                                                        # ir inst 70 fin
# Phi connections
  j .F.process_message_queue._17.lazy.exit.4                            # ir inst 71 fin
.F.process_message_queue._16.lazy.else.4:
# Phi connections
  li s7, 0
  j .F.process_message_queue._17.lazy.exit.4                            # ir inst 72 fin
.F.process_message_queue._17.lazy.exit.4:
  bnez s7, .F.process_message_queue._18.lazy.then.5
  j .F.process_message_queue._19.lazy.else.5                            # ir inst 74 fin
.F.process_message_queue._18.lazy.then.5:
  ld t2, 184(sp)
  slt s7, t4, t2                                                        # ir inst 75 fin
# Phi connections
  j .F.process_message_queue._20.lazy.exit.5                            # ir inst 76 fin
.F.process_message_queue._19.lazy.else.5:
# Phi connections
  li s7, 0
  j .F.process_message_queue._20.lazy.exit.5                            # ir inst 77 fin
.F.process_message_queue._20.lazy.exit.5:
  bnez s7, .F.process_message_queue._21.if.then.0
  j .F.process_message_queue._37.if.else.0                              # ir inst 79 fin
.F.process_message_queue._21.if.then.0:
  li t2, 1
  xor t0, t3, t2
  sltiu s7, t0, 1                                                       # ir inst 80 fin
  bnez s7, .F.process_message_queue._22.if.then.1
  j .F.process_message_queue._23.if.else.1                              # ir inst 81 fin
.F.process_message_queue._22.if.then.1:
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
  mv a2, s11
  mv a1, t4
  mv a0, t5
  call .F.handle_vote_request
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
# ir inst 82 fin
  j .F.process_message_queue._36.if.exit.1                              # ir inst 83 fin
.F.process_message_queue._23.if.else.1:
  li t2, 2
  xor t0, t3, t2
  sltiu s7, t0, 1                                                       # ir inst 84 fin
  bnez s7, .F.process_message_queue._24.if.then.2
  j .F.process_message_queue._25.if.else.2                              # ir inst 85 fin
.F.process_message_queue._24.if.then.2:
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
  mv a2, s11
  mv a1, t4
  mv a0, t5
  call .F.handle_heartbeat
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
# ir inst 86 fin
  j .F.process_message_queue._35.if.exit.2                              # ir inst 87 fin
.F.process_message_queue._25.if.else.2:
  li t2, 3
  xor t0, t3, t2
  sltiu s7, t0, 1                                                       # ir inst 88 fin
  bnez s7, .F.process_message_queue._26.if.then.3
  j .F.process_message_queue._27.if.else.3                              # ir inst 89 fin
.F.process_message_queue._26.if.then.3:
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
  ld t1, 184(sp)
  mv a6, t1
  mv a5, a4
  mv a4, a3
  mv a3, s10
  mv a2, s11
  mv a1, t4
  mv a0, t5
  call .F.handle_vote_response
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
# ir inst 90 fin
  j .F.process_message_queue._34.if.exit.3                              # ir inst 91 fin
.F.process_message_queue._27.if.else.3:
  li t2, 4
  xor t0, t3, t2
  sltiu s7, t0, 1                                                       # ir inst 92 fin
  bnez s7, .F.process_message_queue._28.if.then.4
  j .F.process_message_queue._29.if.else.4                              # ir inst 93 fin
.F.process_message_queue._28.if.then.4:
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
  sd a6, -24(sp)
  sd a7, -16(sp)
  ld t1, 152(sp)
  sd t1, -8(sp)
  mv a7, a4
  mv a6, a3
  mv a5, s8
  mv a4, s9
  mv a3, s10
  mv a2, s11
  mv a1, t4
  mv a0, t5
  call .F.handle_append_entries
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
# ir inst 94 fin
  j .F.process_message_queue._33.if.exit.4                              # ir inst 95 fin
.F.process_message_queue._29.if.else.4:
  li t2, 5
  xor t0, t3, t2
  sltiu s8, t0, 1                                                       # ir inst 96 fin
  bnez s8, .F.process_message_queue._30.if.then.5
  j .F.process_message_queue._31.if.else.5                              # ir inst 97 fin
.F.process_message_queue._30.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  ld t1, 168(sp)
  mv a7, t1
  ld t1, 160(sp)
  mv a6, t1
  mv a5, a3
  mv a4, s9
  mv a3, s10
  mv a2, s11
  mv a1, t4
  mv a0, t5
  call .F.handle_append_response
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 98 fin
  j .F.process_message_queue._32.if.exit.5                              # ir inst 99 fin
.F.process_message_queue._31.if.else.5:
  j .F.process_message_queue._32.if.exit.5                              # ir inst 100 fin
.F.process_message_queue._32.if.exit.5:
  j .F.process_message_queue._33.if.exit.4                              # ir inst 101 fin
.F.process_message_queue._33.if.exit.4:
  j .F.process_message_queue._34.if.exit.3                              # ir inst 102 fin
.F.process_message_queue._34.if.exit.3:
  j .F.process_message_queue._35.if.exit.2                              # ir inst 103 fin
.F.process_message_queue._35.if.exit.2:
  j .F.process_message_queue._36.if.exit.1                              # ir inst 104 fin
.F.process_message_queue._36.if.exit.1:
  j .F.process_message_queue._38.if.exit.0                              # ir inst 105 fin
.F.process_message_queue._37.if.else.0:
  j .F.process_message_queue._38.if.exit.0                              # ir inst 106 fin
.F.process_message_queue._38.if.exit.0:
  lw t5, 0(a1)                                                          # ir inst 107 fin
  addi t4, t5, 1                                                        # ir inst 108 fin
  li t2, 1000
  rem t5, t4, t2                                                        # ir inst 109 fin
  sw t5, 0(a1)                                                          # ir inst 110 fin
  addi t5, t6, 1                                                        # ir inst 111 fin
# Phi connections
  mv t6, t5
  j .F.process_message_queue._1.while.cond.0                            # ir inst 112 fin
.F.process_message_queue._39.while.exit.0:
  mv a0, t6
  j .F.process_message_queue.epilogue                                   # ir inst 113 fin
.F.process_message_queue.epilogue:
  ld ra, 144(sp)
  ld s9, 96(sp)
  ld s10, 104(sp)
  ld s11, 112(sp)
  ld s6, 120(sp)
  ld s7, 128(sp)
  ld s8, 136(sp)
  addi sp, sp, 192
  ret

.globl .F.handle_vote_request
.F.handle_vote_request:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.handle_vote_request._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  slt t5, t6, a2                                                        # ir inst 4 fin
  bnez t5, .F.handle_vote_request._1.if.then.0
  j .F.handle_vote_request._2.if.else.0                                 # ir inst 5 fin
.F.handle_vote_request._1.if.then.0:
  mv t6, a1                                                             # ir inst 6 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 7 fin
  sw a2, 0(t5)                                                          # ir inst 8 fin
  mv t6, a1                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 11 fin
  mv t6, a1                                                             # ir inst 12 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 13 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 14 fin
  j .F.handle_vote_request._3.if.exit.0                                 # ir inst 15 fin
.F.handle_vote_request._2.if.else.0:
  j .F.handle_vote_request._3.if.exit.0                                 # ir inst 16 fin
.F.handle_vote_request._3.if.exit.0:
  mv t6, a1                                                             # ir inst 17 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 18 fin
  lw t6, 0(t5)                                                          # ir inst 19 fin
  xor t0, a2, t6
  sltiu t5, t0, 1                                                       # ir inst 20 fin
  bnez t5, .F.handle_vote_request._4.lazy.then.0
  j .F.handle_vote_request._8.lazy.else.0                               # ir inst 21 fin
.F.handle_vote_request._4.lazy.then.0:
  mv t6, a1                                                             # ir inst 22 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 23 fin
  lw t6, 0(t5)                                                          # ir inst 24 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 25 fin
  bnez t5, .F.handle_vote_request._5.lazy.then.1
  j .F.handle_vote_request._6.lazy.else.1                               # ir inst 26 fin
.F.handle_vote_request._5.lazy.then.1:
# Phi connections
  li t6, 1
  j .F.handle_vote_request._7.lazy.exit.1                               # ir inst 27 fin
.F.handle_vote_request._6.lazy.else.1:
  mv t6, a1                                                             # ir inst 28 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 29 fin
  lw t6, 0(t5)                                                          # ir inst 30 fin
  xor t0, t6, a0
  sltiu t5, t0, 1                                                       # ir inst 31 fin
# Phi connections
  mv t6, t5
  j .F.handle_vote_request._7.lazy.exit.1                               # ir inst 32 fin
.F.handle_vote_request._7.lazy.exit.1:
# Phi connections
  j .F.handle_vote_request._9.lazy.exit.0                               # ir inst 34 fin
.F.handle_vote_request._8.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.handle_vote_request._9.lazy.exit.0                               # ir inst 35 fin
.F.handle_vote_request._9.lazy.exit.0:
  bnez t6, .F.handle_vote_request._10.if.then.1
  j .F.handle_vote_request._11.if.else.1                                # ir inst 37 fin
.F.handle_vote_request._10.if.then.1:
  mv t6, a1                                                             # ir inst 38 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 39 fin
  sw a0, 0(t5)                                                          # ir inst 40 fin
  j .F.handle_vote_request._12.if.exit.1                                # ir inst 41 fin
.F.handle_vote_request._11.if.else.1:
  j .F.handle_vote_request._12.if.exit.1                                # ir inst 42 fin
.F.handle_vote_request._12.if.exit.1:
  j .F.handle_vote_request.epilogue                                     # ir inst 43 fin
.F.handle_vote_request.epilogue:
  ret

.globl .F.handle_heartbeat
.F.handle_heartbeat:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.handle_heartbeat._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 4 fin
  bnez t5, .F.handle_heartbeat._1.if.then.0
  j .F.handle_heartbeat._2.if.else.0                                    # ir inst 5 fin
.F.handle_heartbeat._1.if.then.0:
  mv t6, a1                                                             # ir inst 6 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 7 fin
  sw a2, 0(t5)                                                          # ir inst 8 fin
  mv t6, a1                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 11 fin
  mv t6, a1                                                             # ir inst 12 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 13 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 14 fin
  j .F.handle_heartbeat._3.if.exit.0                                    # ir inst 15 fin
.F.handle_heartbeat._2.if.else.0:
  j .F.handle_heartbeat._3.if.exit.0                                    # ir inst 16 fin
.F.handle_heartbeat._3.if.exit.0:
  j .F.handle_heartbeat.epilogue                                        # ir inst 17 fin
.F.handle_heartbeat.epilogue:
  ret

.globl .F.handle_vote_response
.F.handle_vote_response:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.handle_vote_response._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 4 fin
  bnez t5, .F.handle_vote_response._1.lazy.then.0
  j .F.handle_vote_response._2.lazy.else.0                              # ir inst 5 fin
.F.handle_vote_response._1.lazy.then.0:
  mv t6, a1                                                             # ir inst 6 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 7 fin
  lw t6, 0(t5)                                                          # ir inst 8 fin
  xor t0, a2, t6
  sltiu t5, t0, 1                                                       # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.handle_vote_response._3.lazy.exit.0                              # ir inst 10 fin
.F.handle_vote_response._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.handle_vote_response._3.lazy.exit.0                              # ir inst 11 fin
.F.handle_vote_response._3.lazy.exit.0:
  bnez t6, .F.handle_vote_response._4.lazy.then.1
  j .F.handle_vote_response._5.lazy.else.1                              # ir inst 13 fin
.F.handle_vote_response._4.lazy.then.1:
  li t2, 1
  xor t0, a3, t2
  sltiu t6, t0, 1                                                       # ir inst 14 fin
# Phi connections
  j .F.handle_vote_response._6.lazy.exit.1                              # ir inst 15 fin
.F.handle_vote_response._5.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.handle_vote_response._6.lazy.exit.1                              # ir inst 16 fin
.F.handle_vote_response._6.lazy.exit.1:
  bnez t6, .F.handle_vote_response._7.if.then.0
  j .F.handle_vote_response._11.if.else.0                               # ir inst 18 fin
.F.handle_vote_response._7.if.then.0:
  li t2, 2
  div t6, a6, t2                                                        # ir inst 19 fin
  addi t5, t6, 1                                                        # ir inst 20 fin
  li t2, 3
  mul t6, a1, t2                                                        # ir inst 21 fin
  rem t4, t6, a6                                                        # ir inst 22 fin
  addi t6, t5, -1                                                       # ir inst 23 fin
  slt t0, t4, t6
  xori t5, t0, 1                                                        # ir inst 24 fin
  bnez t5, .F.handle_vote_response._8.if.then.1
  j .F.handle_vote_response._9.if.else.1                                # ir inst 25 fin
.F.handle_vote_response._8.if.then.1:
  mv t6, a1                                                             # ir inst 26 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 27 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 28 fin
  j .F.handle_vote_response._10.if.exit.1                               # ir inst 29 fin
.F.handle_vote_response._9.if.else.1:
  j .F.handle_vote_response._10.if.exit.1                               # ir inst 30 fin
.F.handle_vote_response._10.if.exit.1:
  j .F.handle_vote_response._12.if.exit.0                               # ir inst 31 fin
.F.handle_vote_response._11.if.else.0:
  j .F.handle_vote_response._12.if.exit.0                               # ir inst 32 fin
.F.handle_vote_response._12.if.exit.0:
  j .F.handle_vote_response.epilogue                                    # ir inst 33 fin
.F.handle_vote_response.epilogue:
  ret

.globl .F.handle_append_entries
.F.handle_append_entries:
# spill func args num: 3,             range:        8(sp) -        8(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
.F.handle_append_entries._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a7, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  slt t5, a2, t6                                                        # ir inst 4 fin
  bnez t5, .F.handle_append_entries._1.if.then.0
  j .F.handle_append_entries._2.if.else.0                               # ir inst 5 fin
.F.handle_append_entries._1.if.then.0:
  j .F.handle_append_entries.epilogue                                   # ir inst 6 fin
.F.handle_append_entries._2.if.else.0:
  j .F.handle_append_entries._3.if.exit.0                               # ir inst 7 fin
.F.handle_append_entries._3.if.exit.0:
  mv t6, a1                                                             # ir inst 8 fin
  slli t2, t6, 2
  add t5, a7, t2                                                        # ir inst 9 fin
  lw t6, 0(t5)                                                          # ir inst 10 fin
  slt t5, t6, a2                                                        # ir inst 11 fin
  bnez t5, .F.handle_append_entries._4.if.then.1
  j .F.handle_append_entries._5.if.else.1                               # ir inst 12 fin
.F.handle_append_entries._4.if.then.1:
  mv t6, a1                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t5, a7, t2                                                        # ir inst 14 fin
  sw a2, 0(t5)                                                          # ir inst 15 fin
  mv t6, a1                                                             # ir inst 16 fin
  slli t2, t6, 2
  add t5, a6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 18 fin
  j .F.handle_append_entries._6.if.exit.1                               # ir inst 19 fin
.F.handle_append_entries._5.if.else.1:
  j .F.handle_append_entries._6.if.exit.1                               # ir inst 20 fin
.F.handle_append_entries._6.if.exit.1:
  li t2, 0
  slt t0, a3, t2
  xori t6, t0, 1                                                        # ir inst 21 fin
  bnez t6, .F.handle_append_entries._7.lazy.then.0
  j .F.handle_append_entries._8.lazy.else.0                             # ir inst 22 fin
.F.handle_append_entries._7.lazy.then.0:
  mv t6, a1                                                             # ir inst 23 fin
  slli t2, t6, 2
  ld t1, 16(sp)
  add t5, t1, t2                                                        # ir inst 24 fin
  lw t6, 0(t5)                                                          # ir inst 25 fin
  slt t5, a3, t6                                                        # ir inst 26 fin
# Phi connections
  mv t6, t5
  j .F.handle_append_entries._9.lazy.exit.0                             # ir inst 27 fin
.F.handle_append_entries._8.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.handle_append_entries._9.lazy.exit.0                             # ir inst 28 fin
.F.handle_append_entries._9.lazy.exit.0:
  bnez t6, .F.handle_append_entries._10.if.then.2
  j .F.handle_append_entries._20.if.else.2                              # ir inst 30 fin
.F.handle_append_entries._10.if.then.2:
  mv t6, a1                                                             # ir inst 31 fin
  li t1, 200
  mul t2, t6, t1
  ld t1, 8(sp)
  add t5, t1, t2                                                        # ir inst 32 fin
  mv t6, a3                                                             # ir inst 33 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 34 fin
  lw t6, 0(t4)                                                          # ir inst 35 fin
  xor t0, t6, a4
  sltiu t5, t0, 1                                                       # ir inst 36 fin
  bnez t5, .F.handle_append_entries._11.if.then.3
  j .F.handle_append_entries._18.if.else.3                              # ir inst 37 fin
.F.handle_append_entries._11.if.then.3:
  li t2, 0
  slt t6, t2, a5                                                        # ir inst 38 fin
  bnez t6, .F.handle_append_entries._12.lazy.then.1
  j .F.handle_append_entries._13.lazy.else.1                            # ir inst 39 fin
.F.handle_append_entries._12.lazy.then.1:
  mv t6, a1                                                             # ir inst 40 fin
  slli t2, t6, 2
  ld t1, 16(sp)
  add t5, t1, t2                                                        # ir inst 41 fin
  lw t6, 0(t5)                                                          # ir inst 42 fin
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 43 fin
# Phi connections
  mv t6, t5
  j .F.handle_append_entries._14.lazy.exit.1                            # ir inst 44 fin
.F.handle_append_entries._13.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.handle_append_entries._14.lazy.exit.1                            # ir inst 45 fin
.F.handle_append_entries._14.lazy.exit.1:
  bnez t6, .F.handle_append_entries._15.if.then.4
  j .F.handle_append_entries._16.if.else.4                              # ir inst 47 fin
.F.handle_append_entries._15.if.then.4:
  mv t6, a1                                                             # ir inst 48 fin
  li t1, 200
  mul t2, t6, t1
  ld t1, 8(sp)
  add t5, t1, t2                                                        # ir inst 49 fin
  mv t6, a1                                                             # ir inst 50 fin
  slli t2, t6, 2
  ld t1, 16(sp)
  add t4, t1, t2                                                        # ir inst 51 fin
  lw t6, 0(t4)                                                          # ir inst 52 fin
  mv t4, t6                                                             # ir inst 53 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 54 fin
  sw a5, 0(t6)                                                          # ir inst 55 fin
  mv t6, a1                                                             # ir inst 56 fin
  slli t2, t6, 2
  ld t1, 16(sp)
  add t5, t1, t2                                                        # ir inst 57 fin
  mv t6, a1                                                             # ir inst 58 fin
  slli t2, t6, 2
  ld t1, 16(sp)
  add t4, t1, t2                                                        # ir inst 59 fin
  lw t6, 0(t4)                                                          # ir inst 60 fin
  addi t4, t6, 1                                                        # ir inst 61 fin
  sw t4, 0(t5)                                                          # ir inst 62 fin
  j .F.handle_append_entries._17.if.exit.4                              # ir inst 63 fin
.F.handle_append_entries._16.if.else.4:
  j .F.handle_append_entries._17.if.exit.4                              # ir inst 64 fin
.F.handle_append_entries._17.if.exit.4:
  j .F.handle_append_entries._19.if.exit.3                              # ir inst 65 fin
.F.handle_append_entries._18.if.else.3:
  j .F.handle_append_entries._19.if.exit.3                              # ir inst 66 fin
.F.handle_append_entries._19.if.exit.3:
  j .F.handle_append_entries._21.if.exit.2                              # ir inst 67 fin
.F.handle_append_entries._20.if.else.2:
  j .F.handle_append_entries._21.if.exit.2                              # ir inst 68 fin
.F.handle_append_entries._21.if.exit.2:
  j .F.handle_append_entries.epilogue                                   # ir inst 69 fin
.F.handle_append_entries.epilogue:
  addi sp, sp, 32
  ret

.globl .F.handle_append_response
.F.handle_append_response:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.handle_append_response._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  li t2, 2
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 4 fin
  bnez t5, .F.handle_append_response._1.lazy.then.0
  j .F.handle_append_response._2.lazy.else.0                            # ir inst 5 fin
.F.handle_append_response._1.lazy.then.0:
  mv t6, a1                                                             # ir inst 6 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 7 fin
  lw t6, 0(t5)                                                          # ir inst 8 fin
  xor t0, a2, t6
  sltiu t5, t0, 1                                                       # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.handle_append_response._3.lazy.exit.0                            # ir inst 10 fin
.F.handle_append_response._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.handle_append_response._3.lazy.exit.0                            # ir inst 11 fin
.F.handle_append_response._3.lazy.exit.0:
  bnez t6, .F.handle_append_response._4.if.then.0
  j .F.handle_append_response._11.if.else.0                             # ir inst 13 fin
.F.handle_append_response._4.if.then.0:
  li t2, 1
  xor t0, a3, t2
  sltiu t6, t0, 1                                                       # ir inst 14 fin
  bnez t6, .F.handle_append_response._5.if.then.1
  j .F.handle_append_response._6.if.else.1                              # ir inst 15 fin
.F.handle_append_response._5.if.then.1:
  mv t6, a1                                                             # ir inst 16 fin
  li t1, 400
  mul t2, t6, t1
  add t5, a6, t2                                                        # ir inst 17 fin
  mv t6, a0                                                             # ir inst 18 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 19 fin
  addi t6, a4, 1                                                        # ir inst 20 fin
  sw t6, 0(t4)                                                          # ir inst 21 fin
  mv t6, a1                                                             # ir inst 22 fin
  li t1, 400
  mul t2, t6, t1
  add t5, a7, t2                                                        # ir inst 23 fin
  mv t6, a0                                                             # ir inst 24 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 25 fin
  sw a4, 0(t4)                                                          # ir inst 26 fin
  j .F.handle_append_response._10.if.exit.1                             # ir inst 27 fin
.F.handle_append_response._6.if.else.1:
  mv t6, a1                                                             # ir inst 28 fin
  li t1, 400
  mul t2, t6, t1
  add t5, a6, t2                                                        # ir inst 29 fin
  mv t6, a0                                                             # ir inst 30 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 31 fin
  lw t6, 0(t4)                                                          # ir inst 32 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 33 fin
  bnez t5, .F.handle_append_response._7.if.then.2
  j .F.handle_append_response._8.if.else.2                              # ir inst 34 fin
.F.handle_append_response._7.if.then.2:
  mv t6, a1                                                             # ir inst 35 fin
  li t1, 400
  mul t2, t6, t1
  add t5, a6, t2                                                        # ir inst 36 fin
  mv t6, a0                                                             # ir inst 37 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 38 fin
  mv t6, a1                                                             # ir inst 39 fin
  li t1, 400
  mul t2, t6, t1
  add t5, a6, t2                                                        # ir inst 40 fin
  mv t6, a0                                                             # ir inst 41 fin
  slli t2, t6, 2
  add t3, t5, t2                                                        # ir inst 42 fin
  lw t6, 0(t3)                                                          # ir inst 43 fin
  addi t5, t6, -1                                                       # ir inst 44 fin
  sw t5, 0(t4)                                                          # ir inst 45 fin
  j .F.handle_append_response._9.if.exit.2                              # ir inst 46 fin
.F.handle_append_response._8.if.else.2:
  j .F.handle_append_response._9.if.exit.2                              # ir inst 47 fin
.F.handle_append_response._9.if.exit.2:
  j .F.handle_append_response._10.if.exit.1                             # ir inst 48 fin
.F.handle_append_response._10.if.exit.1:
  j .F.handle_append_response._12.if.exit.0                             # ir inst 49 fin
.F.handle_append_response._11.if.else.0:
  j .F.handle_append_response._12.if.exit.0                             # ir inst 50 fin
.F.handle_append_response._12.if.exit.0:
  j .F.handle_append_response.epilogue                                  # ir inst 51 fin
.F.handle_append_response.epilogue:
  ret

.globl .F.check_leader_election
.F.check_leader_election:
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
.F.check_leader_election._0.entry.0:
# Phi connections
  li t5, -1
  li t6, 0
  j .F.check_leader_election._1.while.cond.0                            # ir inst 1 fin
.F.check_leader_election._1.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 4 fin
  bnez t4, .F.check_leader_election._2.while.body.0
  j .F.check_leader_election._6.while.exit.0                            # ir inst 5 fin
.F.check_leader_election._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  slt t3, t5, t4                                                        # ir inst 9 fin
  bnez t3, .F.check_leader_election._3.if.then.0
  j .F.check_leader_election._4.if.else.0                               # ir inst 10 fin
.F.check_leader_election._3.if.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  j .F.check_leader_election._5.if.exit.0                               # ir inst 14 fin
.F.check_leader_election._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.check_leader_election._5.if.exit.0                               # ir inst 15 fin
.F.check_leader_election._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.check_leader_election._1.while.cond.0                            # ir inst 18 fin
.F.check_leader_election._6.while.exit.0:
# Phi connections
  li t3, 0
  li t4, -1
  li t6, 0
  j .F.check_leader_election._7.while.cond.1                            # ir inst 19 fin
.F.check_leader_election._7.while.cond.1:
  slt s11, t6, a2                                                       # ir inst 23 fin
  bnez s11, .F.check_leader_election._8.while.body.1
  j .F.check_leader_election._15.while.exit.1                           # ir inst 24 fin
.F.check_leader_election._8.while.body.1:
  mv s11, t6                                                            # ir inst 25 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 26 fin
  lw s11, 0(s10)                                                        # ir inst 27 fin
  li t2, 2
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 28 fin
  bnez s10, .F.check_leader_election._9.lazy.then.0
  j .F.check_leader_election._10.lazy.else.0                            # ir inst 29 fin
.F.check_leader_election._9.lazy.then.0:
  mv s11, t6                                                            # ir inst 30 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 31 fin
  lw s11, 0(s10)                                                        # ir inst 32 fin
  xor t0, s11, t5
  sltiu s10, t0, 1                                                      # ir inst 33 fin
# Phi connections
  mv s11, s10
  j .F.check_leader_election._11.lazy.exit.0                            # ir inst 34 fin
.F.check_leader_election._10.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.check_leader_election._11.lazy.exit.0                            # ir inst 35 fin
.F.check_leader_election._11.lazy.exit.0:
  bnez s11, .F.check_leader_election._12.if.then.1
  j .F.check_leader_election._13.if.else.1                              # ir inst 37 fin
.F.check_leader_election._12.if.then.1:
  addi s11, t3, 1                                                       # ir inst 38 fin
# Phi connections
  mv s10, s11
  mv s11, t6
  j .F.check_leader_election._14.if.exit.1                              # ir inst 39 fin
.F.check_leader_election._13.if.else.1:
# Phi connections
  mv s10, t3
  mv s11, t4
  j .F.check_leader_election._14.if.exit.1                              # ir inst 40 fin
.F.check_leader_election._14.if.exit.1:
  addi s9, t6, 1                                                        # ir inst 43 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  mv t6, s9
  j .F.check_leader_election._7.while.cond.1                            # ir inst 44 fin
.F.check_leader_election._15.while.exit.1:
  li t2, 1
  xor t0, t3, t2
  sltiu t6, t0, 1                                                       # ir inst 45 fin
  bnez t6, .F.check_leader_election._16.if.then.2
  j .F.check_leader_election._17.if.else.2                              # ir inst 46 fin
.F.check_leader_election._16.if.then.2:
# Phi connections
  mv t6, t4
  j .F.check_leader_election._18.if.exit.2                              # ir inst 47 fin
.F.check_leader_election._17.if.else.2:
# Phi connections
  li t6, -1
  j .F.check_leader_election._18.if.exit.2                              # ir inst 48 fin
.F.check_leader_election._18.if.exit.2:
  mv a0, t6
  j .F.check_leader_election.epilogue                                   # ir inst 50 fin
.F.check_leader_election.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.simulate_log_replication
.F.simulate_log_replication:
# spill func args num: 3,             range:      120(sp) -      120(sp)
# local var size: 0,                  range:      120(sp) -      120(sp)
# return addr size: 8,                range:      112(sp) -      120(sp)
# callee save reg num: 3 / 12,        range:       88(sp) -      112(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd s9, 88(sp)
  sd s10, 96(sp)
  sd s11, 104(sp)
  sd ra, 112(sp)
.F.simulate_log_replication._0.entry.0:
# Phi connections
  li t6, 0
  j .F.simulate_log_replication._1.while.cond.0                         # ir inst 1 fin
.F.simulate_log_replication._1.while.cond.0:
  ld t2, 128(sp)
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.simulate_log_replication._2.while.body.0
  j .F.simulate_log_replication._15.while.exit.0                        # ir inst 4 fin
.F.simulate_log_replication._2.while.body.0:
  xor t0, t6, a0
  sltu t5, zero, t0                                                     # ir inst 5 fin
  bnez t5, .F.simulate_log_replication._3.lazy.then.0
  j .F.simulate_log_replication._4.lazy.else.0                          # ir inst 6 fin
.F.simulate_log_replication._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 7 fin
  ld t1, 120(sp)
  add t4, t1, t5                                                        # ir inst 8 fin
  lb t5, 0(t4)                                                          # ir inst 9 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.simulate_log_replication._5.lazy.exit.0                          # ir inst 11 fin
.F.simulate_log_replication._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.simulate_log_replication._5.lazy.exit.0                          # ir inst 12 fin
.F.simulate_log_replication._5.lazy.exit.0:
  bnez t5, .F.simulate_log_replication._6.if.then.0
  j .F.simulate_log_replication._13.if.else.0                           # ir inst 14 fin
.F.simulate_log_replication._6.if.then.0:
  mv t5, a0                                                             # ir inst 15 fin
  li t1, 400
  mul t2, t5, t1
  add t4, a4, t2                                                        # ir inst 16 fin
  mv t5, t6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 18 fin
  lw t5, 0(t3)                                                          # ir inst 19 fin
  mv t4, a0                                                             # ir inst 20 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 21 fin
  lw t4, 0(t3)                                                          # ir inst 22 fin
  slt t3, t5, t4                                                        # ir inst 23 fin
  bnez t3, .F.simulate_log_replication._7.if.then.1
  j .F.simulate_log_replication._11.if.else.1                           # ir inst 24 fin
.F.simulate_log_replication._7.if.then.1:
  addi t4, t5, -1                                                       # ir inst 25 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 26 fin
  bnez t3, .F.simulate_log_replication._8.if.then.2
  j .F.simulate_log_replication._9.if.else.2                            # ir inst 27 fin
.F.simulate_log_replication._8.if.then.2:
  mv t3, a0                                                             # ir inst 28 fin
  li t1, 200
  mul t2, t3, t1
  add s11, a1, t2                                                       # ir inst 29 fin
  mv t3, t4                                                             # ir inst 30 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 31 fin
  lw t3, 0(s10)                                                         # ir inst 32 fin
# Phi connections
  j .F.simulate_log_replication._10.if.exit.2                           # ir inst 33 fin
.F.simulate_log_replication._9.if.else.2:
# Phi connections
  li t3, 0
  j .F.simulate_log_replication._10.if.exit.2                           # ir inst 34 fin
.F.simulate_log_replication._10.if.exit.2:
  mv s11, a0                                                            # ir inst 36 fin
  li t1, 200
  mul t2, s11, t1
  add s10, a1, t2                                                       # ir inst 37 fin
  mv s11, t5                                                            # ir inst 38 fin
  slli t2, s11, 2
  add t5, s10, t2                                                       # ir inst 39 fin
  lw s11, 0(t5)                                                         # ir inst 40 fin
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
  sd t6, 80(sp)
  sd s11, -8(sp)
  li a5, 0
  li a4, 4
  mv a3, t6
  mv a2, a0
  mv a1, a7
  mv a0, a6
  mv a7, t3
  mv a6, t4
  call .F.enqueue_message
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
  ld t6, 80(sp)
# ir inst 41 fin
  j .F.simulate_log_replication._12.if.exit.1                           # ir inst 42 fin
.F.simulate_log_replication._11.if.else.1:
  j .F.simulate_log_replication._12.if.exit.1                           # ir inst 43 fin
.F.simulate_log_replication._12.if.exit.1:
  j .F.simulate_log_replication._14.if.exit.0                           # ir inst 44 fin
.F.simulate_log_replication._13.if.else.0:
  j .F.simulate_log_replication._14.if.exit.0                           # ir inst 45 fin
.F.simulate_log_replication._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  j .F.simulate_log_replication._1.while.cond.0                         # ir inst 47 fin
.F.simulate_log_replication._15.while.exit.0:
  mv t6, a0                                                             # ir inst 48 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 49 fin
  lw t6, 0(t5)                                                          # ir inst 50 fin
  mv t5, a0                                                             # ir inst 51 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 52 fin
  lw t5, 0(t4)                                                          # ir inst 53 fin
  addi t4, t5, 1                                                        # ir inst 54 fin
# Phi connections
  mv t5, t4
  j .F.simulate_log_replication._16.while.cond.1                        # ir inst 55 fin
.F.simulate_log_replication._16.while.cond.1:
  mv t4, a0                                                             # ir inst 58 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 59 fin
  lw t4, 0(t3)                                                          # ir inst 60 fin
  slt t3, t5, t4                                                        # ir inst 61 fin
  bnez t3, .F.simulate_log_replication._17.while.body.1
  j .F.simulate_log_replication._30.while.exit.1                        # ir inst 62 fin
.F.simulate_log_replication._17.while.body.1:
# Phi connections
  li t3, 0
  li t4, 1
  j .F.simulate_log_replication._18.while.cond.2                        # ir inst 63 fin
.F.simulate_log_replication._18.while.cond.2:
  ld t2, 128(sp)
  slt s11, t3, t2                                                       # ir inst 66 fin
  bnez s11, .F.simulate_log_replication._19.while.body.2
  j .F.simulate_log_replication._26.while.exit.2                        # ir inst 67 fin
.F.simulate_log_replication._19.while.body.2:
  xor t0, t3, a0
  sltu s11, zero, t0                                                    # ir inst 68 fin
  bnez s11, .F.simulate_log_replication._20.lazy.then.1
  j .F.simulate_log_replication._21.lazy.else.1                         # ir inst 69 fin
.F.simulate_log_replication._20.lazy.then.1:
  mv s11, a0                                                            # ir inst 70 fin
  li t1, 400
  mul t2, s11, t1
  add s10, a5, t2                                                       # ir inst 71 fin
  mv s11, t3                                                            # ir inst 72 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 73 fin
  lw s11, 0(s9)                                                         # ir inst 74 fin
  slt t0, s11, t5
  xori s10, t0, 1                                                       # ir inst 75 fin
# Phi connections
  mv s11, s10
  j .F.simulate_log_replication._22.lazy.exit.1                         # ir inst 76 fin
.F.simulate_log_replication._21.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.simulate_log_replication._22.lazy.exit.1                         # ir inst 77 fin
.F.simulate_log_replication._22.lazy.exit.1:
  bnez s11, .F.simulate_log_replication._23.if.then.3
  j .F.simulate_log_replication._24.if.else.3                           # ir inst 79 fin
.F.simulate_log_replication._23.if.then.3:
  addi s11, t4, 1                                                       # ir inst 80 fin
# Phi connections
  j .F.simulate_log_replication._25.if.exit.3                           # ir inst 81 fin
.F.simulate_log_replication._24.if.else.3:
# Phi connections
  mv s11, t4
  j .F.simulate_log_replication._25.if.exit.3                           # ir inst 82 fin
.F.simulate_log_replication._25.if.exit.3:
  addi s10, t3, 1                                                       # ir inst 84 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.simulate_log_replication._18.while.cond.2                        # ir inst 85 fin
.F.simulate_log_replication._26.while.exit.2:
  ld t1, 128(sp)
  li t2, 2
  div t3, t1, t2                                                        # ir inst 86 fin
  slt s11, t3, t4                                                       # ir inst 87 fin
  bnez s11, .F.simulate_log_replication._27.if.then.4
  j .F.simulate_log_replication._28.if.else.4                           # ir inst 88 fin
.F.simulate_log_replication._27.if.then.4:
# Phi connections
  mv t4, t5
  j .F.simulate_log_replication._29.if.exit.4                           # ir inst 89 fin
.F.simulate_log_replication._28.if.else.4:
# Phi connections
  mv t4, t6
  j .F.simulate_log_replication._29.if.exit.4                           # ir inst 90 fin
.F.simulate_log_replication._29.if.exit.4:
  addi t3, t5, 1                                                        # ir inst 92 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.simulate_log_replication._16.while.cond.1                        # ir inst 93 fin
.F.simulate_log_replication._30.while.exit.1:
  mv t5, a0                                                             # ir inst 94 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 95 fin
  sw t6, 0(t4)                                                          # ir inst 96 fin
  j .F.simulate_log_replication.epilogue                                # ir inst 97 fin
.F.simulate_log_replication.epilogue:
  ld ra, 112(sp)
  ld s9, 88(sp)
  ld s10, 96(sp)
  ld s11, 104(sp)
  addi sp, sp, 144
  ret

.globl .F.append_log_entry
.F.append_log_entry:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.append_log_entry._0.entry.0:
  mv t6, a0                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 4 fin
  bnez t5, .F.append_log_entry._1.if.then.0
  j .F.append_log_entry._2.if.else.0                                    # ir inst 5 fin
.F.append_log_entry._1.if.then.0:
  mv t6, a0                                                             # ir inst 6 fin
  li t1, 200
  mul t2, t6, t1
  add t5, a2, t2                                                        # ir inst 7 fin
  mv t6, a0                                                             # ir inst 8 fin
  slli t2, t6, 2
  add t4, a3, t2                                                        # ir inst 9 fin
  lw t6, 0(t4)                                                          # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 12 fin
  sw a1, 0(t6)                                                          # ir inst 13 fin
  mv t6, a0                                                             # ir inst 14 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 15 fin
  mv t6, a0                                                             # ir inst 16 fin
  slli t2, t6, 2
  add t4, a3, t2                                                        # ir inst 17 fin
  lw t6, 0(t4)                                                          # ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
  sw t4, 0(t5)                                                          # ir inst 20 fin
  j .F.append_log_entry._3.if.exit.0                                    # ir inst 21 fin
.F.append_log_entry._2.if.else.0:
  j .F.append_log_entry._3.if.exit.0                                    # ir inst 22 fin
.F.append_log_entry._3.if.exit.0:
  j .F.append_log_entry.epilogue                                        # ir inst 23 fin
.F.append_log_entry.epilogue:
  ret

.globl .F.verify_system_consistency
.F.verify_system_consistency:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 0,                range:       64(sp) -       64(sp)
# callee save reg num: 8 / 12,        range:        0(sp) -       64(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 0(sp)
  sd s11, 8(sp)
  sd s8, 16(sp)
  sd s0, 24(sp)
  sd s5, 32(sp)
  sd s7, 40(sp)
  sd s6, 48(sp)
  sd s10, 56(sp)
.F.verify_system_consistency._0.entry.0:
# Phi connections
  li t5, -1
  li t6, 0
  j .F.verify_system_consistency._1.while.cond.0                        # ir inst 1 fin
.F.verify_system_consistency._1.while.cond.0:
  slt t4, t6, a5                                                        # ir inst 4 fin
  bnez t4, .F.verify_system_consistency._2.while.body.0
  j .F.verify_system_consistency._6.while.exit.0                        # ir inst 5 fin
.F.verify_system_consistency._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  slt t3, t5, t4                                                        # ir inst 9 fin
  bnez t3, .F.verify_system_consistency._3.if.then.0
  j .F.verify_system_consistency._4.if.else.0                           # ir inst 10 fin
.F.verify_system_consistency._3.if.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  j .F.verify_system_consistency._5.if.exit.0                           # ir inst 14 fin
.F.verify_system_consistency._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.verify_system_consistency._5.if.exit.0                           # ir inst 15 fin
.F.verify_system_consistency._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.verify_system_consistency._1.while.cond.0                        # ir inst 18 fin
.F.verify_system_consistency._6.while.exit.0:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.verify_system_consistency._7.while.cond.1                        # ir inst 19 fin
.F.verify_system_consistency._7.while.cond.1:
  slt t3, t6, a5                                                        # ir inst 22 fin
  bnez t3, .F.verify_system_consistency._8.while.body.1
  j .F.verify_system_consistency._15.while.exit.1                       # ir inst 23 fin
.F.verify_system_consistency._8.while.body.1:
  mv t3, t6                                                             # ir inst 24 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 25 fin
  lw t3, 0(s11)                                                         # ir inst 26 fin
  li t2, 2
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 27 fin
  bnez s11, .F.verify_system_consistency._9.lazy.then.0
  j .F.verify_system_consistency._10.lazy.else.0                        # ir inst 28 fin
.F.verify_system_consistency._9.lazy.then.0:
  mv t3, t6                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 30 fin
  lw t3, 0(s11)                                                         # ir inst 31 fin
  xor t0, t3, t5
  sltiu s11, t0, 1                                                      # ir inst 32 fin
# Phi connections
  mv t3, s11
  j .F.verify_system_consistency._11.lazy.exit.0                        # ir inst 33 fin
.F.verify_system_consistency._10.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.verify_system_consistency._11.lazy.exit.0                        # ir inst 34 fin
.F.verify_system_consistency._11.lazy.exit.0:
  bnez t3, .F.verify_system_consistency._12.if.then.1
  j .F.verify_system_consistency._13.if.else.1                          # ir inst 36 fin
.F.verify_system_consistency._12.if.then.1:
  addi t3, t4, 1                                                        # ir inst 37 fin
# Phi connections
  j .F.verify_system_consistency._14.if.exit.1                          # ir inst 38 fin
.F.verify_system_consistency._13.if.else.1:
# Phi connections
  mv t3, t4
  j .F.verify_system_consistency._14.if.exit.1                          # ir inst 39 fin
.F.verify_system_consistency._14.if.exit.1:
  addi s11, t6, 1                                                       # ir inst 41 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.verify_system_consistency._7.while.cond.1                        # ir inst 42 fin
.F.verify_system_consistency._15.while.exit.1:
  li t2, 1
  slt t6, t2, t4                                                        # ir inst 43 fin
  bnez t6, .F.verify_system_consistency._16.if.then.2
  j .F.verify_system_consistency._17.if.else.2                          # ir inst 44 fin
.F.verify_system_consistency._16.if.then.2:
# Phi connections
  li t6, 70
  j .F.verify_system_consistency._21.if.exit.2                          # ir inst 45 fin
.F.verify_system_consistency._17.if.else.2:
  li t2, 0
  xor t0, t4, t2
  sltiu t6, t0, 1                                                       # ir inst 46 fin
  bnez t6, .F.verify_system_consistency._18.if.then.3
  j .F.verify_system_consistency._19.if.else.3                          # ir inst 47 fin
.F.verify_system_consistency._18.if.then.3:
# Phi connections
  li t6, 80
  j .F.verify_system_consistency._20.if.exit.3                          # ir inst 48 fin
.F.verify_system_consistency._19.if.else.3:
# Phi connections
  li t6, 100
  j .F.verify_system_consistency._20.if.exit.3                          # ir inst 49 fin
.F.verify_system_consistency._20.if.exit.3:
# Phi connections
  j .F.verify_system_consistency._21.if.exit.2                          # ir inst 51 fin
.F.verify_system_consistency._21.if.exit.2:
# Phi connections
  li t4, 0
  li t5, 0
  j .F.verify_system_consistency._22.while.cond.2                       # ir inst 53 fin
.F.verify_system_consistency._22.while.cond.2:
  slt t3, t4, a5                                                        # ir inst 56 fin
  bnez t3, .F.verify_system_consistency._23.while.body.2
  j .F.verify_system_consistency._39.while.exit.2                       # ir inst 57 fin
.F.verify_system_consistency._23.while.body.2:
  addi t3, t4, 1                                                        # ir inst 58 fin
# Phi connections
  mv s11, t5
  j .F.verify_system_consistency._24.while.cond.3                       # ir inst 59 fin
.F.verify_system_consistency._24.while.cond.3:
  slt s10, t3, a5                                                       # ir inst 62 fin
  bnez s10, .F.verify_system_consistency._25.while.body.3
  j .F.verify_system_consistency._38.while.exit.3                       # ir inst 63 fin
.F.verify_system_consistency._25.while.body.3:
  mv s10, t4                                                            # ir inst 64 fin
  slli t2, s10, 2
  add s9, a4, t2                                                        # ir inst 65 fin
  lw s10, 0(s9)                                                         # ir inst 66 fin
  mv s9, t3                                                             # ir inst 67 fin
  slli t2, s9, 2
  add s8, a4, t2                                                        # ir inst 68 fin
  lw s9, 0(s8)                                                          # ir inst 69 fin
  slt s8, s10, s9                                                       # ir inst 70 fin
  bnez s8, .F.verify_system_consistency._26.if.then.4
  j .F.verify_system_consistency._27.if.else.4                          # ir inst 71 fin
.F.verify_system_consistency._26.if.then.4:
  mv s10, t4                                                            # ir inst 72 fin
  slli t2, s10, 2
  add s9, a4, t2                                                        # ir inst 73 fin
  lw s10, 0(s9)                                                         # ir inst 74 fin
# Phi connections
  j .F.verify_system_consistency._28.if.exit.4                          # ir inst 75 fin
.F.verify_system_consistency._27.if.else.4:
  mv s10, t3                                                            # ir inst 76 fin
  slli t2, s10, 2
  add s9, a4, t2                                                        # ir inst 77 fin
  lw s10, 0(s9)                                                         # ir inst 78 fin
# Phi connections
  j .F.verify_system_consistency._28.if.exit.4                          # ir inst 79 fin
.F.verify_system_consistency._28.if.exit.4:
# Phi connections
  mv s8, s11
  li s9, 0
  j .F.verify_system_consistency._29.while.cond.4                       # ir inst 81 fin
.F.verify_system_consistency._29.while.cond.4:
  slt t0, s10, s9
  xori s7, t0, 1                                                        # ir inst 84 fin
  bnez s7, .F.verify_system_consistency._30.lazy.then.1
  j .F.verify_system_consistency._31.lazy.else.1                        # ir inst 85 fin
.F.verify_system_consistency._30.lazy.then.1:
  li t2, 50
  slt s7, s9, t2                                                        # ir inst 86 fin
# Phi connections
  j .F.verify_system_consistency._32.lazy.exit.1                        # ir inst 87 fin
.F.verify_system_consistency._31.lazy.else.1:
# Phi connections
  li s7, 0
  j .F.verify_system_consistency._32.lazy.exit.1                        # ir inst 88 fin
.F.verify_system_consistency._32.lazy.exit.1:
  bnez s7, .F.verify_system_consistency._33.while.body.4
  j .F.verify_system_consistency._37.while.exit.4                       # ir inst 90 fin
.F.verify_system_consistency._33.while.body.4:
  mv s7, t4                                                             # ir inst 91 fin
  li t1, 200
  mul t2, s7, t1
  add s6, a2, t2                                                        # ir inst 92 fin
  mv s7, s9                                                             # ir inst 93 fin
  slli t2, s7, 2
  add s5, s6, t2                                                        # ir inst 94 fin
  lw s7, 0(s5)                                                          # ir inst 95 fin
  mv s6, t3                                                             # ir inst 96 fin
  li t1, 200
  mul t2, s6, t1
  add s5, a2, t2                                                        # ir inst 97 fin
  mv s6, s9                                                             # ir inst 98 fin
  slli t2, s6, 2
  add s0, s5, t2                                                        # ir inst 99 fin
  lw s6, 0(s0)                                                          # ir inst 100 fin
  xor t0, s7, s6
  sltu s5, zero, t0                                                     # ir inst 101 fin
  bnez s5, .F.verify_system_consistency._34.if.then.5
  j .F.verify_system_consistency._35.if.else.5                          # ir inst 102 fin
.F.verify_system_consistency._34.if.then.5:
  addi s7, s8, 1                                                        # ir inst 103 fin
# Phi connections
  j .F.verify_system_consistency._36.if.exit.5                          # ir inst 104 fin
.F.verify_system_consistency._35.if.else.5:
# Phi connections
  mv s7, s8
  j .F.verify_system_consistency._36.if.exit.5                          # ir inst 105 fin
.F.verify_system_consistency._36.if.exit.5:
  addi s6, s9, 1                                                        # ir inst 107 fin
# Phi connections
  mv s8, s7
  mv s9, s6
  j .F.verify_system_consistency._29.while.cond.4                       # ir inst 108 fin
.F.verify_system_consistency._37.while.exit.4:
  addi s10, t3, 1                                                       # ir inst 109 fin
# Phi connections
  mv s11, s8
  mv t3, s10
  j .F.verify_system_consistency._24.while.cond.3                       # ir inst 110 fin
.F.verify_system_consistency._38.while.exit.3:
  addi t3, t4, 1                                                        # ir inst 111 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.verify_system_consistency._22.while.cond.2                       # ir inst 112 fin
.F.verify_system_consistency._39.while.exit.2:
  slli t4, t5, 1                                                        # ir inst 113 fin
  sub t5, t6, t4                                                        # ir inst 114 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 115 fin
  bnez t6, .F.verify_system_consistency._40.if.then.6
  j .F.verify_system_consistency._41.if.else.6                          # ir inst 116 fin
.F.verify_system_consistency._40.if.then.6:
# Phi connections
  li t6, 0
  j .F.verify_system_consistency._42.if.exit.6                          # ir inst 117 fin
.F.verify_system_consistency._41.if.else.6:
# Phi connections
  mv t6, t5
  j .F.verify_system_consistency._42.if.exit.6                          # ir inst 118 fin
.F.verify_system_consistency._42.if.exit.6:
  mv a0, t6
  j .F.verify_system_consistency.epilogue                               # ir inst 120 fin
.F.verify_system_consistency.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s8, 16(sp)
  ld s0, 24(sp)
  ld s5, 32(sp)
  ld s7, 40(sp)
  ld s6, 48(sp)
  ld s10, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.trigger_recovery_protocol
.F.trigger_recovery_protocol:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.trigger_recovery_protocol._0.entry.0:
# Phi connections
  li t6, 0
  j .F.trigger_recovery_protocol._1.while.cond.0                        # ir inst 1 fin
.F.trigger_recovery_protocol._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.trigger_recovery_protocol._2.while.body.0
  j .F.trigger_recovery_protocol._3.while.exit.0                        # ir inst 4 fin
.F.trigger_recovery_protocol._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 9 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.trigger_recovery_protocol._1.while.cond.0                        # ir inst 12 fin
.F.trigger_recovery_protocol._3.while.exit.0:
  j .F.trigger_recovery_protocol.epilogue                               # ir inst 13 fin
.F.trigger_recovery_protocol.epilogue:
  ret

.globl .F.simulate_byzantine_failures
.F.simulate_byzantine_failures:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulate_byzantine_failures._0.entry.0:
# Phi connections
  li t6, 0
  j .F.simulate_byzantine_failures._1.while.cond.0                      # ir inst 1 fin
.F.simulate_byzantine_failures._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.simulate_byzantine_failures._2.while.body.0
  j .F.simulate_byzantine_failures._6.while.exit.0                      # ir inst 4 fin
.F.simulate_byzantine_failures._2.while.body.0:
  li t2, 19
  mul t5, t6, t2                                                        # ir inst 5 fin
  li t2, 5
  mul t4, a3, t2                                                        # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  li t2, 97
  rem t5, t3, t2                                                        # ir inst 8 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F.simulate_byzantine_failures._3.if.then.0
  j .F.simulate_byzantine_failures._4.if.else.0                         # ir inst 10 fin
.F.simulate_byzantine_failures._3.if.then.0:
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 12 fin
  li t1, 3
  sw t1, 0(t4)                                                          # ir inst 13 fin
  mv t5, t6                                                             # ir inst 14 fin
  add t4, a1, t5                                                        # ir inst 15 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 16 fin
  j .F.simulate_byzantine_failures._5.if.exit.0                         # ir inst 17 fin
.F.simulate_byzantine_failures._4.if.else.0:
  j .F.simulate_byzantine_failures._5.if.exit.0                         # ir inst 18 fin
.F.simulate_byzantine_failures._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.simulate_byzantine_failures._1.while.cond.0                      # ir inst 20 fin
.F.simulate_byzantine_failures._6.while.exit.0:
  j .F.simulate_byzantine_failures.epilogue                             # ir inst 21 fin
.F.simulate_byzantine_failures.epilogue:
  ret

.globl .F.compact_logs
.F.compact_logs:
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
.F.compact_logs._0.entry.0:
# Phi connections
  li t6, 0
  j .F.compact_logs._1.while.cond.0                                     # ir inst 1 fin
.F.compact_logs._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.compact_logs._2.while.body.0
  j .F.compact_logs._12.while.exit.0                                    # ir inst 4 fin
.F.compact_logs._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 6 fin
  lw t5, 0(t4)                                                          # ir inst 7 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t5, t2, t4                                                        # ir inst 9 fin
  bnez t5, .F.compact_logs._3.lazy.then.0
  j .F.compact_logs._4.lazy.else.0                                      # ir inst 10 fin
.F.compact_logs._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  lw t5, 0(t3)                                                          # ir inst 13 fin
  slt t3, t4, t5                                                        # ir inst 14 fin
# Phi connections
  mv t5, t3
  j .F.compact_logs._5.lazy.exit.0                                      # ir inst 15 fin
.F.compact_logs._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.compact_logs._5.lazy.exit.0                                      # ir inst 16 fin
.F.compact_logs._5.lazy.exit.0:
  bnez t5, .F.compact_logs._6.if.then.0
  j .F.compact_logs._10.if.else.0                                       # ir inst 18 fin
.F.compact_logs._6.if.then.0:
# Phi connections
  li t5, 0
  j .F.compact_logs._7.while.cond.1                                     # ir inst 19 fin
.F.compact_logs._7.while.cond.1:
  add t3, t5, t4                                                        # ir inst 21 fin
  mv s11, t6                                                            # ir inst 22 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 23 fin
  lw s11, 0(s10)                                                        # ir inst 24 fin
  slt s10, t3, s11                                                      # ir inst 25 fin
  bnez s10, .F.compact_logs._8.while.body.1
  j .F.compact_logs._9.while.exit.1                                     # ir inst 26 fin
.F.compact_logs._8.while.body.1:
  mv t3, t6                                                             # ir inst 27 fin
  li t1, 200
  mul t2, t3, t1
  add s11, a0, t2                                                       # ir inst 28 fin
  mv t3, t5                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 30 fin
  mv t3, t6                                                             # ir inst 31 fin
  li t1, 200
  mul t2, t3, t1
  add s11, a0, t2                                                       # ir inst 32 fin
  add t3, t5, t4                                                        # ir inst 33 fin
  mv s9, t3                                                             # ir inst 34 fin
  slli t2, s9, 2
  add t3, s11, t2                                                       # ir inst 35 fin
  lw s11, 0(t3)                                                         # ir inst 36 fin
  sw s11, 0(s10)                                                        # ir inst 37 fin
  addi t3, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t3
  j .F.compact_logs._7.while.cond.1                                     # ir inst 39 fin
.F.compact_logs._9.while.exit.1:
  mv t5, t6                                                             # ir inst 40 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  slli t2, t5, 2
  add s11, a1, t2                                                       # ir inst 43 fin
  lw t5, 0(s11)                                                         # ir inst 44 fin
  sub s11, t5, t4                                                       # ir inst 45 fin
  sw s11, 0(t3)                                                         # ir inst 46 fin
  j .F.compact_logs._11.if.exit.0                                       # ir inst 47 fin
.F.compact_logs._10.if.else.0:
  j .F.compact_logs._11.if.exit.0                                       # ir inst 48 fin
.F.compact_logs._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F.compact_logs._1.while.cond.0                                     # ir inst 50 fin
.F.compact_logs._12.while.exit.0:
  j .F.compact_logs.epilogue                                            # ir inst 51 fin
.F.compact_logs.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.find_stable_leader
.F.find_stable_leader:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.find_stable_leader._0.entry.0:
# Phi connections
  li t4, -1
  li t5, -1
  li t6, 0
  j .F.find_stable_leader._1.while.cond.0                               # ir inst 1 fin
.F.find_stable_leader._1.while.cond.0:
  slt t3, t6, a2                                                        # ir inst 5 fin
  bnez t3, .F.find_stable_leader._2.while.body.0
  j .F.find_stable_leader._9.while.exit.0                               # ir inst 6 fin
.F.find_stable_leader._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 2
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.find_stable_leader._3.lazy.then.0
  j .F.find_stable_leader._4.lazy.else.0                                # ir inst 11 fin
.F.find_stable_leader._3.lazy.then.0:
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  slt s11, t4, t3                                                       # ir inst 15 fin
# Phi connections
  mv t3, s11
  j .F.find_stable_leader._5.lazy.exit.0                                # ir inst 16 fin
.F.find_stable_leader._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.find_stable_leader._5.lazy.exit.0                                # ir inst 17 fin
.F.find_stable_leader._5.lazy.exit.0:
  bnez t3, .F.find_stable_leader._6.if.then.0
  j .F.find_stable_leader._7.if.else.0                                  # ir inst 19 fin
.F.find_stable_leader._6.if.then.0:
  mv t3, t6                                                             # ir inst 20 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 21 fin
  lw t3, 0(s11)                                                         # ir inst 22 fin
# Phi connections
  mv t4, t6
  j .F.find_stable_leader._8.if.exit.0                                  # ir inst 23 fin
.F.find_stable_leader._7.if.else.0:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.find_stable_leader._8.if.exit.0                                  # ir inst 24 fin
.F.find_stable_leader._8.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 27 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.find_stable_leader._1.while.cond.0                               # ir inst 28 fin
.F.find_stable_leader._9.while.exit.0:
  mv a0, t5
  j .F.find_stable_leader.epilogue                                      # ir inst 29 fin
.F.find_stable_leader.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.count_total_committed_entries
.F.count_total_committed_entries:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.count_total_committed_entries._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.count_total_committed_entries._1.while.cond.0                    # ir inst 1 fin
.F.count_total_committed_entries._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.count_total_committed_entries._2.while.body.0
  j .F.count_total_committed_entries._3.while.exit.0                    # ir inst 5 fin
.F.count_total_committed_entries._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.count_total_committed_entries._1.while.cond.0                    # ir inst 11 fin
.F.count_total_committed_entries._3.while.exit.0:
  mv a0, t5
  j .F.count_total_committed_entries.epilogue                           # ir inst 12 fin
.F.count_total_committed_entries.epilogue:
  ret

.globl .F.calculate_network_efficiency
.F.calculate_network_efficiency:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.calculate_network_efficiency._0.entry.0:
  li t2, 0
  slt t6, t2, a1                                                        # ir inst 1 fin
  bnez t6, .F.calculate_network_efficiency._1.if.then.0
  j .F.calculate_network_efficiency._2.if.else.0                        # ir inst 2 fin
.F.calculate_network_efficiency._1.if.then.0:
  li t2, 100
  mul t6, a0, t2                                                        # ir inst 3 fin
  li t2, 100
  mul t5, a1, t2                                                        # ir inst 4 fin
  div t4, t6, t5                                                        # ir inst 5 fin
# Phi connections
  mv t6, t4
  j .F.calculate_network_efficiency._3.if.exit.0                        # ir inst 6 fin
.F.calculate_network_efficiency._2.if.else.0:
# Phi connections
  li t6, 0
  j .F.calculate_network_efficiency._3.if.exit.0                        # ir inst 7 fin
.F.calculate_network_efficiency._3.if.exit.0:
  mv a0, t6
  j .F.calculate_network_efficiency.epilogue                            # ir inst 9 fin
.F.calculate_network_efficiency.epilogue:
  ret

.globl .F.compute_system_state_hash
.F.compute_system_state_hash:
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
.F.compute_system_state_hash._0.entry.0:
# Phi connections
  li t5, 17
  li t6, 0
  j .F.compute_system_state_hash._1.while.cond.0                        # ir inst 1 fin
.F.compute_system_state_hash._1.while.cond.0:
  slt t4, t6, a3                                                        # ir inst 4 fin
  bnez t4, .F.compute_system_state_hash._2.while.body.0
  j .F.compute_system_state_hash._9.while.exit.0                        # ir inst 5 fin
.F.compute_system_state_hash._2.while.body.0:
  li t2, 31
  mul t4, t5, t2                                                        # ir inst 6 fin
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  add s11, t4, t3                                                       # ir inst 10 fin
  li t2, 16777219
  rem t4, s11, t2                                                       # ir inst 11 fin
  li t2, 31
  mul t3, t4, t2                                                        # ir inst 12 fin
  mv t4, t6                                                             # ir inst 13 fin
  slli t2, t4, 2
  add s11, a2, t2                                                       # ir inst 14 fin
  lw t4, 0(s11)                                                         # ir inst 15 fin
  add s11, t3, t4                                                       # ir inst 16 fin
  li t2, 16777219
  rem t4, s11, t2                                                       # ir inst 17 fin
# Phi connections
  mv t3, t4
  li t4, 0
  j .F.compute_system_state_hash._3.while.cond.1                        # ir inst 18 fin
.F.compute_system_state_hash._3.while.cond.1:
  mv s11, t6                                                            # ir inst 21 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 22 fin
  lw s11, 0(s10)                                                        # ir inst 23 fin
  slt s10, t4, s11                                                      # ir inst 24 fin
  bnez s10, .F.compute_system_state_hash._4.lazy.then.0
  j .F.compute_system_state_hash._5.lazy.else.0                         # ir inst 25 fin
.F.compute_system_state_hash._4.lazy.then.0:
  li t2, 50
  slt s11, t4, t2                                                       # ir inst 26 fin
# Phi connections
  j .F.compute_system_state_hash._6.lazy.exit.0                         # ir inst 27 fin
.F.compute_system_state_hash._5.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.compute_system_state_hash._6.lazy.exit.0                         # ir inst 28 fin
.F.compute_system_state_hash._6.lazy.exit.0:
  bnez s11, .F.compute_system_state_hash._7.while.body.1
  j .F.compute_system_state_hash._8.while.exit.1                        # ir inst 30 fin
.F.compute_system_state_hash._7.while.body.1:
  li t2, 31
  mul s11, t3, t2                                                       # ir inst 31 fin
  mv s10, t6                                                            # ir inst 32 fin
  li t1, 200
  mul t2, s10, t1
  add s9, a0, t2                                                        # ir inst 33 fin
  mv s10, t4                                                            # ir inst 34 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 35 fin
  lw s10, 0(s8)                                                         # ir inst 36 fin
  add s9, s11, s10                                                      # ir inst 37 fin
  li t2, 16777219
  rem s11, s9, t2                                                       # ir inst 38 fin
  addi s10, t4, 1                                                       # ir inst 39 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.compute_system_state_hash._3.while.cond.1                        # ir inst 40 fin
.F.compute_system_state_hash._8.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.compute_system_state_hash._1.while.cond.0                        # ir inst 42 fin
.F.compute_system_state_hash._9.while.exit.0:
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 43 fin
  bnez t6, .F.compute_system_state_hash._10.if.then.0
  j .F.compute_system_state_hash._11.if.else.0                          # ir inst 44 fin
.F.compute_system_state_hash._10.if.then.0:
  li t1, 0
  sub t6, t1, t5                                                        # ir inst 45 fin
# Phi connections
  j .F.compute_system_state_hash._12.if.exit.0                          # ir inst 46 fin
.F.compute_system_state_hash._11.if.else.0:
# Phi connections
  mv t6, t5
  j .F.compute_system_state_hash._12.if.exit.0                          # ir inst 47 fin
.F.compute_system_state_hash._12.if.exit.0:
  li t2, 1000000
  rem t5, t6, t2                                                        # ir inst 49 fin
  mv a0, t5
  j .F.compute_system_state_hash.epilogue                               # ir inst 50 fin
.F.compute_system_state_hash.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.enqueue_message
.F.enqueue_message:
# spill func args num: 1,             range:        8(sp) -        8(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
.F.enqueue_message._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
  mv t5, t6                                                             # ir inst 2 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 3 fin
  addi t5, t6, 0                                                        # ir inst 4 fin
  sw a2, 0(t5)                                                          # ir inst 5 fin
  lw t6, 0(a1)                                                          # ir inst 6 fin
  mv t5, t6                                                             # ir inst 7 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 8 fin
  addi t5, t6, 4                                                        # ir inst 9 fin
  sw a3, 0(t5)                                                          # ir inst 10 fin
  lw t6, 0(a1)                                                          # ir inst 11 fin
  mv t5, t6                                                             # ir inst 12 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 13 fin
  addi t5, t6, 8                                                        # ir inst 14 fin
  sw a4, 0(t5)                                                          # ir inst 15 fin
  lw t6, 0(a1)                                                          # ir inst 16 fin
  mv t5, t6                                                             # ir inst 17 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 18 fin
  addi t5, t6, 12                                                       # ir inst 19 fin
  sw a5, 0(t5)                                                          # ir inst 20 fin
  lw t6, 0(a1)                                                          # ir inst 21 fin
  mv t5, t6                                                             # ir inst 22 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 23 fin
  addi t5, t6, 16                                                       # ir inst 24 fin
  sw a6, 0(t5)                                                          # ir inst 25 fin
  lw t6, 0(a1)                                                          # ir inst 26 fin
  mv t5, t6                                                             # ir inst 27 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 28 fin
  addi t5, t6, 20                                                       # ir inst 29 fin
  sw a7, 0(t5)                                                          # ir inst 30 fin
  lw t6, 0(a1)                                                          # ir inst 31 fin
  mv t5, t6                                                             # ir inst 32 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 33 fin
  addi t5, t6, 24                                                       # ir inst 34 fin
  ld t1, 8(sp)
  sw t1, 0(t5)                                                          # ir inst 35 fin
  lw t6, 0(a1)                                                          # ir inst 36 fin
  mv t5, t6                                                             # ir inst 37 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 38 fin
  addi t5, t6, 28                                                       # ir inst 39 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 40 fin
  lw t6, 0(a1)                                                          # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 43 fin
  addi t5, t6, 32                                                       # ir inst 44 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 45 fin
  lw t6, 0(a1)                                                          # ir inst 46 fin
  mv t5, t6                                                             # ir inst 47 fin
  li t1, 40
  mul t2, t5, t1
  add t6, a0, t2                                                        # ir inst 48 fin
  addi t5, t6, 36                                                       # ir inst 49 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 50 fin
  lw t6, 0(a1)                                                          # ir inst 51 fin
  addi t5, t6, 1                                                        # ir inst 52 fin
  li t2, 1000
  rem t6, t5, t2                                                        # ir inst 53 fin
  sw t6, 0(a1)                                                          # ir inst 54 fin
  j .F.enqueue_message.epilogue                                         # ir inst 55 fin
.F.enqueue_message.epilogue:
  addi sp, sp, 16
  ret
