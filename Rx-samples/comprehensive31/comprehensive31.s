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
# spill func args num: 0,             range:     5136(sp) -     5136(sp)
# local var size: 5128,               range:        8(sp) -     5136(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5136
  add sp, sp, t0
  sd ra, 0(sp)
main._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 8
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 256
  mv t5, t1                                                             # ir inst 5 fin
  addi t4, t5, -1                                                       # ir inst 6 fin
  sw t4, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 8
  addi t6, t1, 8                                                        # ir inst 8 fin
  addi t5, t6, 0                                                        # ir inst 9 fin
# Phi connections
  li t6, 0
  j main._1.array.cond.0                                                # ir inst 10 fin
main._1.array.cond.0:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 12 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 13 fin
main._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 15 fin
  addi t4, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t4
  j main._1.array.cond.0                                                # ir inst 17 fin
main._3.array.exit.0:
  addi t1, sp, 8
  addi t6, t1, 1032                                                     # ir inst 18 fin
  addi t5, t6, 0                                                        # ir inst 19 fin
# Phi connections
  li t6, 0
  j main._4.array.cond.1                                                # ir inst 20 fin
main._4.array.cond.1:
  li t2, 1024
  slt t4, t6, t2                                                        # ir inst 22 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 23 fin
main._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 25 fin
  addi t4, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t4
  j main._4.array.cond.1                                                # ir inst 27 fin
main._6.array.exit.1:
# Start call preparation
  addi t1, sp, 8
  mv a0, t1
  call .F.load_program
# ir inst 28 fin
# Start call preparation
  addi t1, sp, 8
  mv a0, t1
  call .F.execute
# ir inst 29 fin
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 30 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 31 fin
  j main.epilogue                                                       # ir inst 32 fin
main.epilogue:
  ld ra, 0(sp)
  li t0, 5136
  add sp, sp, t0
  ret

.globl .F.load_program
.F.load_program:
# spill func args num: 0,             range:     4144(sp) -     4144(sp)
# local var size: 4096,               range:       40(sp) -     4136(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 3 / 12,        range:        8(sp) -       32(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4144
  add sp, sp, t0
  sd s9, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.load_program._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.load_program._1.array.cond.0                                     # ir inst 3 fin
.F.load_program._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.load_program._2.array.body.0
  j .F.load_program._3.array.exit.0                                     # ir inst 6 fin
.F.load_program._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.load_program._1.array.cond.0                                     # ir inst 10 fin
.F.load_program._3.array.exit.0:
  li t1, 0
  mv t6, t1                                                             # ir inst 11 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 12 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 13 fin
  li t1, 1
  mv t6, t1                                                             # ir inst 14 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 15 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 16 fin
  li t1, 2
  mv t6, t1                                                             # ir inst 17 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 18 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 19 fin
  li t1, 3
  mv t6, t1                                                             # ir inst 20 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 21 fin
  li t1, 20
  sw t1, 0(t5)                                                          # ir inst 22 fin
  li t1, 4
  mv t6, t1                                                             # ir inst 23 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 24 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 25 fin
  li t1, 5
  mv t6, t1                                                             # ir inst 26 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 27 fin
  li t1, 50
  sw t1, 0(t5)                                                          # ir inst 28 fin
  li t1, 6
  mv t6, t1                                                             # ir inst 29 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 30 fin
  li t1, 15
  sw t1, 0(t5)                                                          # ir inst 31 fin
  li t1, 7
  mv t6, t1                                                             # ir inst 32 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 33 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 34 fin
  li t1, 50
  mv t6, t1                                                             # ir inst 35 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 36 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 37 fin
  li t1, 51
  mv t6, t1                                                             # ir inst 38 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 39 fin
  li t1, 5
  sw t1, 0(t5)                                                          # ir inst 40 fin
  li t1, 52
  mv t6, t1                                                             # ir inst 41 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 42 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 43 fin
  li t1, 53
  mv t6, t1                                                             # ir inst 44 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 45 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 46 fin
  li t1, 54
  mv t6, t1                                                             # ir inst 47 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 48 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 49 fin
  li t1, 55
  mv t6, t1                                                             # ir inst 50 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 51 fin
  li t1, 15
  sw t1, 0(t5)                                                          # ir inst 52 fin
  li t1, 56
  mv t6, t1                                                             # ir inst 53 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 54 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 55 fin
  li t1, 57
  mv t6, t1                                                             # ir inst 56 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 57 fin
  li t1, 100
  sw t1, 0(t5)                                                          # ir inst 58 fin
  li t1, 58
  mv t6, t1                                                             # ir inst 59 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 60 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 61 fin
  li t1, 59
  mv t6, t1                                                             # ir inst 62 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 63 fin
  li t1, 200
  sw t1, 0(t5)                                                          # ir inst 64 fin
  li t1, 60
  mv t6, t1                                                             # ir inst 65 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 66 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 67 fin
  li t1, 61
  mv t6, t1                                                             # ir inst 68 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 69 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 70 fin
  li t1, 100
  mv t6, t1                                                             # ir inst 71 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 72 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 73 fin
  li t1, 101
  mv t6, t1                                                             # ir inst 74 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 75 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 76 fin
  li t1, 102
  mv t6, t1                                                             # ir inst 77 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 78 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 79 fin
  li t1, 103
  mv t6, t1                                                             # ir inst 80 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 81 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 82 fin
# Phi connections
  li t5, 104
  li t6, 0
  j .F.load_program._4.while.cond.0                                     # ir inst 83 fin
.F.load_program._4.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 86 fin
  bnez t4, .F.load_program._5.while.body.0
  j .F.load_program._6.while.exit.0                                     # ir inst 87 fin
.F.load_program._5.while.body.0:
  mv t4, t5                                                             # ir inst 88 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 89 fin
  li t1, 3
  sw t1, 0(t3)                                                          # ir inst 90 fin
  addi t4, t5, 1                                                        # ir inst 91 fin
  mv t3, t4                                                             # ir inst 92 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 93 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 94 fin
  addi t3, t4, 1                                                        # ir inst 95 fin
  mv t4, t3                                                             # ir inst 96 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 97 fin
  addi t4, a0, 8                                                        # ir inst 98 fin
  addi s10, a0, 4                                                       # ir inst 99 fin
  lw s9, 0(s10)                                                         # ir inst 100 fin
  mv s10, s9                                                            # ir inst 101 fin
  slli t2, s10, 2
  add s9, t4, t2                                                        # ir inst 102 fin
  lw t4, 0(s9)                                                          # ir inst 103 fin
  sw t4, 0(s11)                                                         # ir inst 104 fin
  addi t4, t3, 1                                                        # ir inst 105 fin
  mv t3, t4                                                             # ir inst 106 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 107 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 108 fin
  addi t3, t4, 1                                                        # ir inst 109 fin
  mv t4, t3                                                             # ir inst 110 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 111 fin
  addi t4, a0, 8                                                        # ir inst 112 fin
  addi s10, a0, 4                                                       # ir inst 113 fin
  lw s9, 0(s10)                                                         # ir inst 114 fin
  addi s10, s9, -1                                                      # ir inst 115 fin
  mv s9, s10                                                            # ir inst 116 fin
  slli t2, s9, 2
  add s10, t4, t2                                                       # ir inst 117 fin
  lw t4, 0(s10)                                                         # ir inst 118 fin
  sw t4, 0(s11)                                                         # ir inst 119 fin
  addi t4, t3, 1                                                        # ir inst 120 fin
  addi t3, t6, 1                                                        # ir inst 121 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.load_program._4.while.cond.0                                     # ir inst 122 fin
.F.load_program._6.while.exit.0:
  mv t6, t5                                                             # ir inst 123 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t4, t1, t2                                                        # ir inst 124 fin
  li t1, 2
  sw t1, 0(t4)                                                          # ir inst 125 fin
  addi t6, t5, 1                                                        # ir inst 126 fin
  mv t5, t6                                                             # ir inst 127 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add t4, t1, t2                                                        # ir inst 128 fin
  li t1, 15
  sw t1, 0(t4)                                                          # ir inst 129 fin
  addi t5, t6, 1                                                        # ir inst 130 fin
  mv t6, t5                                                             # ir inst 131 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 132 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 133 fin
  li t1, 200
  mv t6, t1                                                             # ir inst 134 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 135 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 136 fin
  li t1, 201
  mv t6, t1                                                             # ir inst 137 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 138 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 139 fin
  li t1, 202
  mv t6, t1                                                             # ir inst 140 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 141 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 142 fin
  li t1, 203
  mv t6, t1                                                             # ir inst 143 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 144 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 145 fin
  li t1, 204
  mv t6, t1                                                             # ir inst 146 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 147 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 148 fin
  li t1, 205
  mv t6, t1                                                             # ir inst 149 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 150 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 151 fin
  li t1, 206
  mv t6, t1                                                             # ir inst 152 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 153 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 154 fin
  li t1, 207
  mv t6, t1                                                             # ir inst 155 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 156 fin
  addi t6, a0, 8                                                        # ir inst 157 fin
  addi t4, a0, 4                                                        # ir inst 158 fin
  lw t3, 0(t4)                                                          # ir inst 159 fin
  addi t4, t3, -2                                                       # ir inst 160 fin
  mv t3, t4                                                             # ir inst 161 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 162 fin
  lw t6, 0(t4)                                                          # ir inst 163 fin
  sw t6, 0(t5)                                                          # ir inst 164 fin
  li t1, 208
  mv t6, t1                                                             # ir inst 165 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 166 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 167 fin
  li t1, 209
  mv t6, t1                                                             # ir inst 168 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 169 fin
  addi t6, a0, 8                                                        # ir inst 170 fin
  addi t4, a0, 4                                                        # ir inst 171 fin
  lw t3, 0(t4)                                                          # ir inst 172 fin
  addi t4, t3, -2                                                       # ir inst 173 fin
  mv t3, t4                                                             # ir inst 174 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 175 fin
  lw t6, 0(t4)                                                          # ir inst 176 fin
  sw t6, 0(t5)                                                          # ir inst 177 fin
  li t1, 210
  mv t6, t1                                                             # ir inst 178 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 179 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 180 fin
  li t1, 211
  mv t6, t1                                                             # ir inst 181 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 182 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 183 fin
  addi t6, a0, 8                                                        # ir inst 184 fin
  addi t5, a0, 4                                                        # ir inst 185 fin
  lw t4, 0(t5)                                                          # ir inst 186 fin
  addi t5, t4, -2                                                       # ir inst 187 fin
  mv t4, t5                                                             # ir inst 188 fin
  slli t2, t4, 2
  add t5, t6, t2                                                        # ir inst 189 fin
  addi t6, a0, 8                                                        # ir inst 190 fin
  addi t4, a0, 4                                                        # ir inst 191 fin
  lw t3, 0(t4)                                                          # ir inst 192 fin
  mv t4, t3                                                             # ir inst 193 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 194 fin
  lw t6, 0(t3)                                                          # ir inst 195 fin
  sw t6, 0(t5)                                                          # ir inst 196 fin
  li t1, 212
  mv t6, t1                                                             # ir inst 197 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 198 fin
  addi t6, a0, 8                                                        # ir inst 199 fin
  addi t4, a0, 4                                                        # ir inst 200 fin
  lw t3, 0(t4)                                                          # ir inst 201 fin
  addi t4, t3, -2                                                       # ir inst 202 fin
  mv t3, t4                                                             # ir inst 203 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 204 fin
  lw t6, 0(t4)                                                          # ir inst 205 fin
  sw t6, 0(t5)                                                          # ir inst 206 fin
  li t1, 213
  mv t6, t1                                                             # ir inst 207 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 208 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 209 fin
  li t1, 214
  mv t6, t1                                                             # ir inst 210 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 211 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 212 fin
  li t1, 215
  mv t6, t1                                                             # ir inst 213 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 214 fin
  addi t6, a0, 8                                                        # ir inst 215 fin
  addi t4, a0, 4                                                        # ir inst 216 fin
  lw t3, 0(t4)                                                          # ir inst 217 fin
  addi t4, t3, -1                                                       # ir inst 218 fin
  mv t3, t4                                                             # ir inst 219 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 220 fin
  lw t6, 0(t4)                                                          # ir inst 221 fin
  sw t6, 0(t5)                                                          # ir inst 222 fin
  li t1, 216
  mv t6, t1                                                             # ir inst 223 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 224 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 225 fin
  li t1, 217
  mv t6, t1                                                             # ir inst 226 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 227 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 228 fin
  li t1, 218
  mv t6, t1                                                             # ir inst 229 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 230 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 231 fin
  li t1, 219
  mv t6, t1                                                             # ir inst 232 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 233 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 234 fin
  li t1, 220
  mv t6, t1                                                             # ir inst 235 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 236 fin
  addi t6, a0, 8                                                        # ir inst 237 fin
  addi t4, a0, 4                                                        # ir inst 238 fin
  lw t3, 0(t4)                                                          # ir inst 239 fin
  addi t4, t3, -1                                                       # ir inst 240 fin
  mv t3, t4                                                             # ir inst 241 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 242 fin
  lw t6, 0(t4)                                                          # ir inst 243 fin
  sw t6, 0(t5)                                                          # ir inst 244 fin
  addi t6, a0, 8                                                        # ir inst 245 fin
  addi t5, a0, 4                                                        # ir inst 246 fin
  lw t4, 0(t5)                                                          # ir inst 247 fin
  addi t5, t4, -1                                                       # ir inst 248 fin
  mv t4, t5                                                             # ir inst 249 fin
  slli t2, t4, 2
  add t5, t6, t2                                                        # ir inst 250 fin
  addi t6, a0, 8                                                        # ir inst 251 fin
  addi t4, a0, 4                                                        # ir inst 252 fin
  lw t3, 0(t4)                                                          # ir inst 253 fin
  mv t4, t3                                                             # ir inst 254 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 255 fin
  lw t6, 0(t3)                                                          # ir inst 256 fin
  sw t6, 0(t5)                                                          # ir inst 257 fin
  li t1, 221
  mv t6, t1                                                             # ir inst 258 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 259 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 260 fin
  li t1, 222
  mv t6, t1                                                             # ir inst 261 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 262 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 263 fin
  li t1, 223
  mv t6, t1                                                             # ir inst 264 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 265 fin
  addi t6, a0, 8                                                        # ir inst 266 fin
  addi t4, a0, 4                                                        # ir inst 267 fin
  lw t3, 0(t4)                                                          # ir inst 268 fin
  mv t4, t3                                                             # ir inst 269 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 270 fin
  lw t6, 0(t3)                                                          # ir inst 271 fin
  sw t6, 0(t5)                                                          # ir inst 272 fin
  li t1, 224
  mv t6, t1                                                             # ir inst 273 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 274 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 275 fin
  li t1, 225
  mv t6, t1                                                             # ir inst 276 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 277 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 278 fin
  li t1, 226
  mv t6, t1                                                             # ir inst 279 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 280 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 281 fin
  li t1, 227
  mv t6, t1                                                             # ir inst 282 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 283 fin
  li t1, 12
  sw t1, 0(t5)                                                          # ir inst 284 fin
  li t1, 228
  mv t6, t1                                                             # ir inst 285 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 286 fin
  li t1, 206
  sw t1, 0(t5)                                                          # ir inst 287 fin
  li t1, 229
  mv t6, t1                                                             # ir inst 288 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 289 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 290 fin
  li t1, 230
  mv t6, t1                                                             # ir inst 291 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 292 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 293 fin
  li t1, 231
  mv t6, t1                                                             # ir inst 294 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 295 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 296 fin
  addi t6, a0, 1032                                                     # ir inst 297 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 4096
  addi t1, sp, 40
  mv a1, t1
  mv a0, t6
  call memcpy
  ld t6, 0(sp)
# ir inst 298 fin
  j .F.load_program.epilogue                                            # ir inst 299 fin
.F.load_program.epilogue:
  ld ra, 32(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  li t0, 4144
  add sp, sp, t0
  ret

.globl .F.execute
.F.execute:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.execute._0.entry.0:
# Phi connections
  li t6, 1
  j .F.execute._1.while.cond.0                                          # ir inst 1 fin
.F.execute._1.while.cond.0:
  bnez t6, .F.execute._2.while.body.0
  j .F.execute._69.while.exit.0                                         # ir inst 3 fin
.F.execute._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.fetch
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 4 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 5 fin
  bnez t4, .F.execute._3.if.then.0
  j .F.execute._4.if.else.0                                             # ir inst 6 fin
.F.execute._3.if.then.0:
# Phi connections
  li t6, 0
  j .F.execute._68.if.exit.0                                            # ir inst 7 fin
.F.execute._4.if.else.0:
  li t2, 1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 8 fin
  bnez t4, .F.execute._5.if.then.1
  j .F.execute._6.if.else.1                                             # ir inst 9 fin
.F.execute._5.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.fetch
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F.push
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 11 fin
# Phi connections
  j .F.execute._67.if.exit.1                                            # ir inst 12 fin
.F.execute._6.if.else.1:
  li t2, 2
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 13 fin
  bnez t4, .F.execute._7.if.then.2
  j .F.execute._8.if.else.2                                             # ir inst 14 fin
.F.execute._7.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 15 fin
# Phi connections
  j .F.execute._66.if.exit.2                                            # ir inst 16 fin
.F.execute._8.if.else.2:
  li t2, 3
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 17 fin
  bnez t4, .F.execute._9.if.then.3
  j .F.execute._10.if.else.3                                            # ir inst 18 fin
.F.execute._9.if.then.3:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 20 fin
  add s11, t3, t4                                                       # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s11
  call .F.push
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 22 fin
# Phi connections
  j .F.execute._65.if.exit.3                                            # ir inst 23 fin
.F.execute._10.if.else.3:
  li t2, 4
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 24 fin
  bnez t4, .F.execute._11.if.then.4
  j .F.execute._12.if.else.4                                            # ir inst 25 fin
.F.execute._11.if.then.4:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 27 fin
  sub s11, t3, t4                                                       # ir inst 28 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s11
  call .F.push
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 29 fin
# Phi connections
  j .F.execute._64.if.exit.4                                            # ir inst 30 fin
.F.execute._12.if.else.4:
  li t2, 5
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 31 fin
  bnez t4, .F.execute._13.if.then.5
  j .F.execute._14.if.else.5                                            # ir inst 32 fin
.F.execute._13.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 34 fin
  mul s11, t3, t4                                                       # ir inst 35 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s11
  call .F.push
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 36 fin
# Phi connections
  j .F.execute._63.if.exit.5                                            # ir inst 37 fin
.F.execute._14.if.else.5:
  li t2, 6
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 38 fin
  bnez t4, .F.execute._15.if.then.6
  j .F.execute._19.if.else.6                                            # ir inst 39 fin
.F.execute._15.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
  li t2, 0
  xor t0, t4, t2
  sltu s11, zero, t0                                                    # ir inst 42 fin
  bnez s11, .F.execute._16.if.then.7
  j .F.execute._17.if.else.7                                            # ir inst 43 fin
.F.execute._16.if.then.7:
  div s11, t3, t4                                                       # ir inst 44 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s11
  call .F.push
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 45 fin
# Phi connections
  mv t4, t6
  j .F.execute._18.if.exit.7                                            # ir inst 46 fin
.F.execute._17.if.else.7:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, -1
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 47 fin
# Phi connections
  li t4, 0
  j .F.execute._18.if.exit.7                                            # ir inst 48 fin
.F.execute._18.if.exit.7:
# Phi connections
  mv t6, t4
  j .F.execute._62.if.exit.6                                            # ir inst 50 fin
.F.execute._19.if.else.6:
  li t2, 7
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 51 fin
  bnez t4, .F.execute._20.if.then.8
  j .F.execute._24.if.else.8                                            # ir inst 52 fin
.F.execute._20.if.then.8:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 53 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 54 fin
  xor t0, t3, t4
  sltiu s11, t0, 1                                                      # ir inst 55 fin
  bnez s11, .F.execute._21.if.then.9
  j .F.execute._22.if.else.9                                            # ir inst 56 fin
.F.execute._21.if.then.9:
# Phi connections
  li t4, 1
  j .F.execute._23.if.exit.9                                            # ir inst 57 fin
.F.execute._22.if.else.9:
# Phi connections
  li t4, 0
  j .F.execute._23.if.exit.9                                            # ir inst 58 fin
.F.execute._23.if.exit.9:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F.push
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 60 fin
# Phi connections
  j .F.execute._61.if.exit.8                                            # ir inst 61 fin
.F.execute._24.if.else.8:
  li t2, 8
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 62 fin
  bnez t4, .F.execute._25.if.then.10
  j .F.execute._29.if.else.10                                           # ir inst 63 fin
.F.execute._25.if.then.10:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 64 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 65 fin
  slt s11, t3, t4                                                       # ir inst 66 fin
  bnez s11, .F.execute._26.if.then.11
  j .F.execute._27.if.else.11                                           # ir inst 67 fin
.F.execute._26.if.then.11:
# Phi connections
  li t4, 1
  j .F.execute._28.if.exit.11                                           # ir inst 68 fin
.F.execute._27.if.else.11:
# Phi connections
  li t4, 0
  j .F.execute._28.if.exit.11                                           # ir inst 69 fin
.F.execute._28.if.exit.11:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F.push
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 71 fin
# Phi connections
  j .F.execute._60.if.exit.10                                           # ir inst 72 fin
.F.execute._29.if.else.10:
  li t2, 9
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 73 fin
  bnez t4, .F.execute._30.if.then.12
  j .F.execute._34.if.else.12                                           # ir inst 74 fin
.F.execute._30.if.then.12:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 75 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 76 fin
  slt s11, t4, t3                                                       # ir inst 77 fin
  bnez s11, .F.execute._31.if.then.13
  j .F.execute._32.if.else.13                                           # ir inst 78 fin
.F.execute._31.if.then.13:
# Phi connections
  li t4, 1
  j .F.execute._33.if.exit.13                                           # ir inst 79 fin
.F.execute._32.if.else.13:
# Phi connections
  li t4, 0
  j .F.execute._33.if.exit.13                                           # ir inst 80 fin
.F.execute._33.if.exit.13:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F.push
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 82 fin
# Phi connections
  j .F.execute._59.if.exit.12                                           # ir inst 83 fin
.F.execute._34.if.else.12:
  li t2, 10
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 84 fin
  bnez t4, .F.execute._35.if.then.14
  j .F.execute._36.if.else.14                                           # ir inst 85 fin
.F.execute._35.if.then.14:
  addi t4, a0, 0                                                        # ir inst 86 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.fetch
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 87 fin
  sw t3, 0(t4)                                                          # ir inst 88 fin
# Phi connections
  j .F.execute._58.if.exit.14                                           # ir inst 89 fin
.F.execute._36.if.else.14:
  li t2, 11
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 90 fin
  bnez t4, .F.execute._37.if.then.15
  j .F.execute._41.if.else.15                                           # ir inst 91 fin
.F.execute._37.if.then.15:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.fetch
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 92 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 93 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 94 fin
  bnez s11, .F.execute._38.if.then.16
  j .F.execute._39.if.else.16                                           # ir inst 95 fin
.F.execute._38.if.then.16:
  addi t3, a0, 0                                                        # ir inst 96 fin
  sw t4, 0(t3)                                                          # ir inst 97 fin
  j .F.execute._40.if.exit.16                                           # ir inst 98 fin
.F.execute._39.if.else.16:
  j .F.execute._40.if.exit.16                                           # ir inst 99 fin
.F.execute._40.if.exit.16:
# Phi connections
  j .F.execute._57.if.exit.15                                           # ir inst 100 fin
.F.execute._41.if.else.15:
  li t2, 12
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 101 fin
  bnez t4, .F.execute._42.if.then.17
  j .F.execute._46.if.else.17                                           # ir inst 102 fin
.F.execute._42.if.then.17:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.fetch
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 103 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 104 fin
  li t2, 0
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 105 fin
  bnez s11, .F.execute._43.if.then.18
  j .F.execute._44.if.else.18                                           # ir inst 106 fin
.F.execute._43.if.then.18:
  addi t3, a0, 0                                                        # ir inst 107 fin
  sw t4, 0(t3)                                                          # ir inst 108 fin
  j .F.execute._45.if.exit.18                                           # ir inst 109 fin
.F.execute._44.if.else.18:
  j .F.execute._45.if.exit.18                                           # ir inst 110 fin
.F.execute._45.if.exit.18:
# Phi connections
  j .F.execute._56.if.exit.17                                           # ir inst 111 fin
.F.execute._46.if.else.17:
  li t2, 13
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 112 fin
  bnez t4, .F.execute._47.if.then.19
  j .F.execute._48.if.else.19                                           # ir inst 113 fin
.F.execute._47.if.then.19:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.fetch
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 114 fin
  addi t3, a0, 0                                                        # ir inst 115 fin
  lw s11, 0(t3)                                                         # ir inst 116 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  call .F.push
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 117 fin
  addi t3, a0, 0                                                        # ir inst 118 fin
  sw t4, 0(t3)                                                          # ir inst 119 fin
# Phi connections
  j .F.execute._55.if.exit.19                                           # ir inst 120 fin
.F.execute._48.if.else.19:
  li t2, 14
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 121 fin
  bnez t4, .F.execute._49.if.then.20
  j .F.execute._50.if.else.20                                           # ir inst 122 fin
.F.execute._49.if.then.20:
  addi t4, a0, 0                                                        # ir inst 123 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.pop
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 124 fin
  sw t3, 0(t4)                                                          # ir inst 125 fin
# Phi connections
  j .F.execute._54.if.exit.20                                           # ir inst 126 fin
.F.execute._50.if.else.20:
  li t2, 15
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 127 fin
  bnez t4, .F.execute._51.if.then.21
  j .F.execute._52.if.else.21                                           # ir inst 128 fin
.F.execute._51.if.then.21:
  addi t5, a0, 8                                                        # ir inst 129 fin
  addi t4, a0, 4                                                        # ir inst 130 fin
  lw t3, 0(t4)                                                          # ir inst 131 fin
  mv t4, t3                                                             # ir inst 132 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 133 fin
  lw t5, 0(t3)                                                          # ir inst 134 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 135 fin
# Phi connections
  j .F.execute._53.if.exit.21                                           # ir inst 136 fin
.F.execute._52.if.else.21:
# Start call preparation
  sd a0, 0(sp)
  li a0, -2
  call printlnInt
  ld a0, 0(sp)
# ir inst 137 fin
# Phi connections
  li t6, 0
  j .F.execute._53.if.exit.21                                           # ir inst 138 fin
.F.execute._53.if.exit.21:
# Phi connections
  j .F.execute._54.if.exit.20                                           # ir inst 140 fin
.F.execute._54.if.exit.20:
# Phi connections
  j .F.execute._55.if.exit.19                                           # ir inst 142 fin
.F.execute._55.if.exit.19:
# Phi connections
  j .F.execute._56.if.exit.17                                           # ir inst 144 fin
.F.execute._56.if.exit.17:
# Phi connections
  j .F.execute._57.if.exit.15                                           # ir inst 146 fin
.F.execute._57.if.exit.15:
# Phi connections
  j .F.execute._58.if.exit.14                                           # ir inst 148 fin
.F.execute._58.if.exit.14:
# Phi connections
  j .F.execute._59.if.exit.12                                           # ir inst 150 fin
.F.execute._59.if.exit.12:
# Phi connections
  j .F.execute._60.if.exit.10                                           # ir inst 152 fin
.F.execute._60.if.exit.10:
# Phi connections
  j .F.execute._61.if.exit.8                                            # ir inst 154 fin
.F.execute._61.if.exit.8:
# Phi connections
  j .F.execute._62.if.exit.6                                            # ir inst 156 fin
.F.execute._62.if.exit.6:
# Phi connections
  j .F.execute._63.if.exit.5                                            # ir inst 158 fin
.F.execute._63.if.exit.5:
# Phi connections
  j .F.execute._64.if.exit.4                                            # ir inst 160 fin
.F.execute._64.if.exit.4:
# Phi connections
  j .F.execute._65.if.exit.3                                            # ir inst 162 fin
.F.execute._65.if.exit.3:
# Phi connections
  j .F.execute._66.if.exit.2                                            # ir inst 164 fin
.F.execute._66.if.exit.2:
# Phi connections
  j .F.execute._67.if.exit.1                                            # ir inst 166 fin
.F.execute._67.if.exit.1:
# Phi connections
  j .F.execute._68.if.exit.0                                            # ir inst 168 fin
.F.execute._68.if.exit.0:
# Phi connections
  j .F.execute._1.while.cond.0                                          # ir inst 170 fin
.F.execute._69.while.exit.0:
  j .F.execute.epilogue                                                 # ir inst 171 fin
.F.execute.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.fetch
.F.fetch:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.fetch._0.entry.0:
  addi t6, a0, 1032                                                     # ir inst 1 fin
  addi t5, a0, 0                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  mv t5, t4                                                             # ir inst 4 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 5 fin
  lw t6, 0(t4)                                                          # ir inst 6 fin
  addi t5, a0, 0                                                        # ir inst 7 fin
  addi t4, a0, 0                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  addi t4, t3, 1                                                        # ir inst 10 fin
  sw t4, 0(t5)                                                          # ir inst 11 fin
  mv a0, t6
  j .F.fetch.epilogue                                                   # ir inst 12 fin
.F.fetch.epilogue:
  ret

.globl .F.push
.F.push:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.push._0.entry.0:
  addi t6, a0, 4                                                        # ir inst 1 fin
  addi t5, a0, 4                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  li t1, 256
  mv t4, t1                                                             # ir inst 5 fin
  rem t3, t5, t4                                                        # ir inst 6 fin
  sw t3, 0(t6)                                                          # ir inst 7 fin
  addi t6, a0, 8                                                        # ir inst 8 fin
  addi t5, a0, 4                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  mv t5, t4                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  sw a1, 0(t4)                                                          # ir inst 13 fin
  j .F.push.epilogue                                                    # ir inst 14 fin
.F.push.epilogue:
  ret

.globl .F.pop
.F.pop:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.pop._0.entry.0:
  addi t6, a0, 8                                                        # ir inst 1 fin
  addi t5, a0, 4                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  mv t5, t4                                                             # ir inst 4 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 5 fin
  lw t6, 0(t4)                                                          # ir inst 6 fin
  addi t5, a0, 4                                                        # ir inst 7 fin
  addi t4, a0, 4                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  addi t4, t3, -1                                                       # ir inst 10 fin
  sw t4, 0(t5)                                                          # ir inst 11 fin
  addi t5, a0, 4                                                        # ir inst 12 fin
  lw t4, 0(t5)                                                          # ir inst 13 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 14 fin
  bnez t5, .F.pop._1.if.then.0
  j .F.pop._2.if.else.0                                                 # ir inst 15 fin
.F.pop._1.if.then.0:
  addi t5, a0, 4                                                        # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  li t1, 256
  mv t3, t1                                                             # ir inst 18 fin
  add s11, t4, t3                                                       # ir inst 19 fin
  sw s11, 0(t5)                                                         # ir inst 20 fin
  j .F.pop._3.if.exit.0                                                 # ir inst 21 fin
.F.pop._2.if.else.0:
  j .F.pop._3.if.exit.0                                                 # ir inst 22 fin
.F.pop._3.if.exit.0:
  mv a0, t6
  j .F.pop.epilogue                                                     # ir inst 23 fin
.F.pop.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.deep_recursive_test
.F.deep_recursive_test:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.deep_recursive_test._0.entry.0:
  li t2, 0
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.deep_recursive_test._1.if.then.0
  j .F.deep_recursive_test._2.if.else.0                                 # ir inst 2 fin
.F.deep_recursive_test._1.if.then.0:
  j .F.deep_recursive_test.epilogue                                     # ir inst 3 fin
.F.deep_recursive_test._2.if.else.0:
  j .F.deep_recursive_test._3.if.exit.0                                 # ir inst 4 fin
.F.deep_recursive_test._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F.push
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 5 fin
  addi t6, a1, -1                                                       # ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F.deep_recursive_test
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  call .F.pop
  mv t6, a0
  ld a0, 0(sp)
# ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F.push
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 10 fin
  j .F.deep_recursive_test.epilogue                                     # ir inst 11 fin
.F.deep_recursive_test.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.complex_stack_manipulation
.F.complex_stack_manipulation:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.complex_stack_manipulation._0.entry.0:
# Phi connections
  li t6, 0
  j .F.complex_stack_manipulation._1.while.cond.0                       # ir inst 1 fin
.F.complex_stack_manipulation._1.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.complex_stack_manipulation._2.while.body.0
  j .F.complex_stack_manipulation._3.while.exit.0                       # ir inst 4 fin
.F.complex_stack_manipulation._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F.push
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 5 fin
  addi t5, t6, 1                                                        # ir inst 6 fin
# Phi connections
  mv t6, t5
  j .F.complex_stack_manipulation._1.while.cond.0                       # ir inst 7 fin
.F.complex_stack_manipulation._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.complex_stack_manipulation._4.while.cond.1                       # ir inst 8 fin
.F.complex_stack_manipulation._4.while.cond.1:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 10 fin
  bnez t5, .F.complex_stack_manipulation._5.while.body.1
  j .F.complex_stack_manipulation._6.while.exit.1                       # ir inst 11 fin
.F.complex_stack_manipulation._5.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.pop
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call .F.pop
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 13 fin
  add t3, t5, t4                                                        # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  call .F.push
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t6, 16(sp)
# ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.complex_stack_manipulation._4.while.cond.1                       # ir inst 17 fin
.F.complex_stack_manipulation._6.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  call .F.pop
  mv t6, a0
  ld a0, 0(sp)
# ir inst 18 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 19 fin
  j .F.complex_stack_manipulation.epilogue                              # ir inst 20 fin
.F.complex_stack_manipulation.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.run_fibonacci_in_vm
.F.run_fibonacci_in_vm:
# spill func args num: 0,             range:     8240(sp) -     8240(sp)
# local var size: 8192,               range:       48(sp) -     8240(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8240
  add sp, sp, t0
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.run_fibonacci_in_vm._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.run_fibonacci_in_vm._1.array.cond.0                              # ir inst 3 fin
.F.run_fibonacci_in_vm._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.run_fibonacci_in_vm._2.array.body.0
  j .F.run_fibonacci_in_vm._3.array.exit.0                              # ir inst 6 fin
.F.run_fibonacci_in_vm._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.run_fibonacci_in_vm._1.array.cond.0                              # ir inst 10 fin
.F.run_fibonacci_in_vm._3.array.exit.0:
  li t1, 0
  mv t6, t1                                                             # ir inst 11 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 12 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 13 fin
  li t1, 1
  mv t6, t1                                                             # ir inst 14 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 15 fin
  sw a1, 0(t5)                                                          # ir inst 16 fin
  li t1, 2
  mv t6, t1                                                             # ir inst 17 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 18 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 19 fin
  li t1, 3
  mv t6, t1                                                             # ir inst 20 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 21 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 22 fin
  li t1, 4
  mv t6, t1                                                             # ir inst 23 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 24 fin
  li t1, 15
  sw t1, 0(t5)                                                          # ir inst 25 fin
  li t1, 5
  mv t6, t1                                                             # ir inst 26 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 28 fin
  li t1, 10
  mv t6, t1                                                             # ir inst 29 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 30 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 31 fin
  li t1, 11
  mv t6, t1                                                             # ir inst 32 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 33 fin
  addi t6, a0, 8                                                        # ir inst 34 fin
  addi t4, a0, 4                                                        # ir inst 35 fin
  lw t3, 0(t4)                                                          # ir inst 36 fin
  mv t4, t3                                                             # ir inst 37 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 38 fin
  lw t6, 0(t3)                                                          # ir inst 39 fin
  sw t6, 0(t5)                                                          # ir inst 40 fin
  li t1, 12
  mv t6, t1                                                             # ir inst 41 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 42 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 43 fin
  li t1, 13
  mv t6, t1                                                             # ir inst 44 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 45 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 46 fin
  li t1, 14
  mv t6, t1                                                             # ir inst 47 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 48 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 49 fin
  li t1, 15
  mv t6, t1                                                             # ir inst 50 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 51 fin
  li t1, 11
  sw t1, 0(t5)                                                          # ir inst 52 fin
  li t1, 16
  mv t6, t1                                                             # ir inst 53 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 54 fin
  li t1, 30
  sw t1, 0(t5)                                                          # ir inst 55 fin
  li t1, 17
  mv t6, t1                                                             # ir inst 56 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 57 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 58 fin
  li t1, 18
  mv t6, t1                                                             # ir inst 59 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 60 fin
  addi t6, a0, 8                                                        # ir inst 61 fin
  addi t4, a0, 4                                                        # ir inst 62 fin
  lw t3, 0(t4)                                                          # ir inst 63 fin
  mv t4, t3                                                             # ir inst 64 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 65 fin
  lw t6, 0(t3)                                                          # ir inst 66 fin
  sw t6, 0(t5)                                                          # ir inst 67 fin
  li t1, 19
  mv t6, t1                                                             # ir inst 68 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 69 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 70 fin
  li t1, 20
  mv t6, t1                                                             # ir inst 71 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 72 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 73 fin
  li t1, 21
  mv t6, t1                                                             # ir inst 74 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 75 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 76 fin
  li t1, 22
  mv t6, t1                                                             # ir inst 77 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 78 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 79 fin
  li t1, 23
  mv t6, t1                                                             # ir inst 80 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 81 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 82 fin
  li t1, 24
  mv t6, t1                                                             # ir inst 83 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 84 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 85 fin
  li t1, 25
  mv t6, t1                                                             # ir inst 86 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 87 fin
  addi t6, a0, 8                                                        # ir inst 88 fin
  addi t4, a0, 4                                                        # ir inst 89 fin
  lw t3, 0(t4)                                                          # ir inst 90 fin
  addi t4, t3, 1                                                        # ir inst 91 fin
  mv t3, t4                                                             # ir inst 92 fin
  slli t2, t3, 2
  add t4, t6, t2                                                        # ir inst 93 fin
  lw t6, 0(t4)                                                          # ir inst 94 fin
  sw t6, 0(t5)                                                          # ir inst 95 fin
  li t1, 26
  mv t6, t1                                                             # ir inst 96 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 97 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 98 fin
  li t1, 27
  mv t6, t1                                                             # ir inst 99 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 100 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 101 fin
  li t1, 28
  mv t6, t1                                                             # ir inst 102 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 103 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 104 fin
  li t1, 29
  mv t6, t1                                                             # ir inst 105 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 106 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 107 fin
  li t1, 30
  mv t6, t1                                                             # ir inst 108 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 109 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 110 fin
  li t1, 31
  mv t6, t1                                                             # ir inst 111 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 112 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 113 fin
  li t1, 32
  mv t6, t1                                                             # ir inst 114 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 115 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 116 fin
  li t1, 30
  mv t6, t1                                                             # ir inst 117 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 118 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 119 fin
  li t1, 31
  mv t6, t1                                                             # ir inst 120 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 121 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 122 fin
  li t1, 32
  mv t6, t1                                                             # ir inst 123 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 124 fin
  addi t6, a0, 8                                                        # ir inst 125 fin
  addi t4, a0, 4                                                        # ir inst 126 fin
  lw t3, 0(t4)                                                          # ir inst 127 fin
  mv t4, t3                                                             # ir inst 128 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 129 fin
  lw t6, 0(t3)                                                          # ir inst 130 fin
  sw t6, 0(t5)                                                          # ir inst 131 fin
  li t1, 33
  mv t6, t1                                                             # ir inst 132 fin
  slli t2, t6, 2
  addi t1, sp, 48
  add t5, t1, t2                                                        # ir inst 133 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 134 fin
  addi t6, a0, 1032                                                     # ir inst 136 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a2, 4096
  mv a1, t6
  li t1, 4144
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 137 fin
  addi t6, a0, 0                                                        # ir inst 138 fin
  lw t5, 0(t6)                                                          # ir inst 139 fin
  addi t6, a0, 4                                                        # ir inst 140 fin
  lw t4, 0(t6)                                                          # ir inst 141 fin
  addi t6, a0, 1032                                                     # ir inst 142 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 4096
  addi t1, sp, 48
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 143 fin
  addi t6, a0, 0                                                        # ir inst 144 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 145 fin
  addi t6, a0, 4                                                        # ir inst 146 fin
  li t1, 256
  mv t3, t1                                                             # ir inst 147 fin
  addi s11, t3, -1                                                      # ir inst 148 fin
  sw s11, 0(t6)                                                         # ir inst 149 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  call .F.execute
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 150 fin
  addi t6, a0, 1032                                                     # ir inst 151 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 4096
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 152 fin
  addi t6, a0, 0                                                        # ir inst 153 fin
  sw t5, 0(t6)                                                          # ir inst 154 fin
  addi t6, a0, 4                                                        # ir inst 155 fin
  sw t4, 0(t6)                                                          # ir inst 156 fin
  j .F.run_fibonacci_in_vm.epilogue                                     # ir inst 157 fin
.F.run_fibonacci_in_vm.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  li t0, 8240
  add sp, sp, t0
  ret

.globl .F.error_case_test
.F.error_case_test:
# spill func args num: 0,             range:     5152(sp) -     5152(sp)
# local var size: 5128,               range:       16(sp) -     5144(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5152
  add sp, sp, t0
  sd ra, 8(sp)
.F.error_case_test._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 5128
  mv a1, a0
  addi t1, sp, 16
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 2 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 3 fin
  addi t1, sp, 16
  addi t5, t1, 4                                                        # ir inst 4 fin
  lw t4, 0(t5)                                                          # ir inst 5 fin
  addi t5, t4, 10                                                       # ir inst 6 fin
  sw t5, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  li t1, 256
  mv t6, t1                                                             # ir inst 10 fin
  slt t4, t6, t5                                                        # ir inst 11 fin
  bnez t4, .F.error_case_test._1.if.then.0
  j .F.error_case_test._2.if.else.0                                     # ir inst 12 fin
.F.error_case_test._1.if.then.0:
# Start call preparation
  li a0, -100
  call printlnInt
# ir inst 13 fin
  j .F.error_case_test._3.if.exit.0                                     # ir inst 14 fin
.F.error_case_test._2.if.else.0:
  j .F.error_case_test._3.if.exit.0                                     # ir inst 15 fin
.F.error_case_test._3.if.exit.0:
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 16 fin
  li t1, 256
  mv t5, t1                                                             # ir inst 17 fin
  addi t4, t5, -10                                                      # ir inst 18 fin
  sw t4, 0(t6)                                                          # ir inst 19 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.pop
  mv t6, a0
# ir inst 20 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 21 fin
  j .F.error_case_test.epilogue                                         # ir inst 22 fin
.F.error_case_test.epilogue:
  ld ra, 8(sp)
  li t0, 5152
  add sp, sp, t0
  ret

.globl .F.another_test_scenario
.F.another_test_scenario:
# spill func args num: 0,             range:    10272(sp) -    10272(sp)
# local var size: 10256,              range:        8(sp) -    10264(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10272
  add sp, sp, t0
  sd ra, 0(sp)
.F.another_test_scenario._0.entry.0:
  li t1, 5136
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 4 fin
  li t1, 5136
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 5 fin
  li t1, 256
  mv t5, t1                                                             # ir inst 6 fin
  addi t4, t5, -1                                                       # ir inst 7 fin
  sw t4, 0(t6)                                                          # ir inst 8 fin
  li t1, 5136
  add t1, sp, t1
  addi t6, t1, 8                                                        # ir inst 9 fin
  addi t5, t6, 0                                                        # ir inst 10 fin
# Phi connections
  li t6, 0
  j .F.another_test_scenario._1.array.cond.0                            # ir inst 11 fin
.F.another_test_scenario._1.array.cond.0:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 13 fin
  bnez t4, .F.another_test_scenario._2.array.body.0
  j .F.another_test_scenario._3.array.exit.0                            # ir inst 14 fin
.F.another_test_scenario._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 16 fin
  addi t4, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t4
  j .F.another_test_scenario._1.array.cond.0                            # ir inst 18 fin
.F.another_test_scenario._3.array.exit.0:
  li t1, 5136
  add t1, sp, t1
  addi t6, t1, 1032                                                     # ir inst 19 fin
  addi t5, t6, 0                                                        # ir inst 20 fin
# Phi connections
  li t6, 0
  j .F.another_test_scenario._4.array.cond.1                            # ir inst 21 fin
.F.another_test_scenario._4.array.cond.1:
  li t2, 1024
  slt t4, t6, t2                                                        # ir inst 23 fin
  bnez t4, .F.another_test_scenario._5.array.body.1
  j .F.another_test_scenario._6.array.exit.1                            # ir inst 24 fin
.F.another_test_scenario._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 26 fin
  addi t4, t6, 1                                                        # ir inst 27 fin
# Phi connections
  mv t6, t4
  j .F.another_test_scenario._4.array.cond.1                            # ir inst 28 fin
.F.another_test_scenario._6.array.exit.1:
# Start call preparation
  li a1, 15
  li t1, 5136
  add t1, sp, t1
  mv a0, t1
  call .F.run_fibonacci_in_vm
# ir inst 29 fin
# Start call preparation
  li t1, 5136
  add t1, sp, t1
  mv a0, t1
  call .F.complex_stack_manipulation
# ir inst 30 fin
# Start call preparation
  li a1, 30
  li t1, 5136
  add t1, sp, t1
  mv a0, t1
  call .F.deep_recursive_test
# ir inst 31 fin
# Start call preparation
  li a2, 5128
  li t1, 5136
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call memcpy
# ir inst 32 fin
# Start call preparation
  addi t1, sp, 8
  mv a0, t1
  call .F.error_case_test
# ir inst 33 fin
  j .F.another_test_scenario.epilogue                                   # ir inst 34 fin
.F.another_test_scenario.epilogue:
  ld ra, 0(sp)
  li t0, 10272
  add sp, sp, t0
  ret
