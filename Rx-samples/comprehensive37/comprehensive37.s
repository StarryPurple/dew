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

.globl .F.push_stack
.F.push_stack:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.push_stack._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
  li t2, 255
  slt t5, t6, t2                                                        # ir inst 2 fin
  bnez t5, .F.push_stack._1.if.then.0
  j .F.push_stack._2.if.else.0                                          # ir inst 3 fin
.F.push_stack._1.if.then.0:
  lw t6, 0(a1)                                                          # ir inst 4 fin
  addi t5, t6, 1                                                        # ir inst 5 fin
  sw t5, 0(a1)                                                          # ir inst 6 fin
  lw t6, 0(a1)                                                          # ir inst 7 fin
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 9 fin
  sw a2, 0(t6)                                                          # ir inst 10 fin
  j .F.push_stack._3.if.exit.0                                          # ir inst 11 fin
.F.push_stack._2.if.else.0:
  j .F.push_stack._3.if.exit.0                                          # ir inst 12 fin
.F.push_stack._3.if.exit.0:
  j .F.push_stack.epilogue                                              # ir inst 13 fin
.F.push_stack.epilogue:
  ret

.globl .F.pop_stack
.F.pop_stack:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.pop_stack._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
  li t2, -1
  slt t5, t2, t6                                                        # ir inst 2 fin
  bnez t5, .F.pop_stack._1.if.then.0
  j .F.pop_stack._2.if.else.0                                           # ir inst 3 fin
.F.pop_stack._1.if.then.0:
  lw t6, 0(a1)                                                          # ir inst 4 fin
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  lw t6, 0(a1)                                                          # ir inst 8 fin
  addi t4, t6, -1                                                       # ir inst 9 fin
  sw t4, 0(a1)                                                          # ir inst 10 fin
  mv a0, t5
  j .F.pop_stack.epilogue                                               # ir inst 11 fin
.F.pop_stack._2.if.else.0:
  j .F.pop_stack._3.if.exit.0                                           # ir inst 12 fin
.F.pop_stack._3.if.exit.0:
  li a0, 0
  j .F.pop_stack.epilogue                                               # ir inst 13 fin
.F.pop_stack.epilogue:
  ret

.globl .F.load_program
.F.load_program:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.load_program._0.entry.0:
  li t1, 0
  mv t6, t1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 3 fin
  li t1, 1
  mv t6, t1                                                             # ir inst 4 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 5 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 6 fin
  li t1, 2
  mv t6, t1                                                             # ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 9 fin
  li t1, 3
  mv t6, t1                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 11 fin
  li t1, 256
  sw t1, 0(t5)                                                          # ir inst 12 fin
  li t1, 4
  mv t6, t1                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 14 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 15 fin
  li t1, 5
  mv t6, t1                                                             # ir inst 16 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 17 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 18 fin
  li t1, 6
  mv t6, t1                                                             # ir inst 19 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 20 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 21 fin
  li t1, 7
  mv t6, t1                                                             # ir inst 22 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 23 fin
  li t1, 257
  sw t1, 0(t5)                                                          # ir inst 24 fin
  li t1, 8
  mv t6, t1                                                             # ir inst 25 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 26 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 27 fin
  li t1, 9
  mv t6, t1                                                             # ir inst 28 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 29 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 30 fin
  li t1, 10
  mv t6, t1                                                             # ir inst 31 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 32 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 33 fin
  li t1, 11
  mv t6, t1                                                             # ir inst 34 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 35 fin
  li t1, 258
  sw t1, 0(t5)                                                          # ir inst 36 fin
  li t1, 12
  mv t6, t1                                                             # ir inst 37 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 38 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 39 fin
  li t1, 13
  mv t6, t1                                                             # ir inst 40 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 41 fin
  li t1, 256
  sw t1, 0(t5)                                                          # ir inst 42 fin
  li t1, 14
  mv t6, t1                                                             # ir inst 43 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 44 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 45 fin
  li t1, 15
  mv t6, t1                                                             # ir inst 46 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 47 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 48 fin
  li t1, 16
  mv t6, t1                                                             # ir inst 49 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 50 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 51 fin
  li t1, 17
  mv t6, t1                                                             # ir inst 52 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 53 fin
  li t1, 15
  sw t1, 0(t5)                                                          # ir inst 54 fin
  li t1, 18
  mv t6, t1                                                             # ir inst 55 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 56 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 57 fin
  li t1, 19
  mv t6, t1                                                             # ir inst 58 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 59 fin
  li t1, 256
  sw t1, 0(t5)                                                          # ir inst 60 fin
  li t1, 20
  mv t6, t1                                                             # ir inst 61 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 62 fin
  li t1, 9
  sw t1, 0(t5)                                                          # ir inst 63 fin
  li t1, 21
  mv t6, t1                                                             # ir inst 64 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 65 fin
  li t1, 50
  sw t1, 0(t5)                                                          # ir inst 66 fin
  li t1, 22
  mv t6, t1                                                             # ir inst 67 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 68 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 69 fin
  li t1, 23
  mv t6, t1                                                             # ir inst 70 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 71 fin
  li t1, 257
  sw t1, 0(t5)                                                          # ir inst 72 fin
  li t1, 24
  mv t6, t1                                                             # ir inst 73 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 74 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 75 fin
  li t1, 25
  mv t6, t1                                                             # ir inst 76 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 77 fin
  li t1, 258
  sw t1, 0(t5)                                                          # ir inst 78 fin
  li t1, 26
  mv t6, t1                                                             # ir inst 79 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 80 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 81 fin
  li t1, 27
  mv t6, t1                                                             # ir inst 82 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 83 fin
  li t1, 15
  sw t1, 0(t5)                                                          # ir inst 84 fin
  li t1, 28
  mv t6, t1                                                             # ir inst 85 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 86 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 87 fin
  li t1, 29
  mv t6, t1                                                             # ir inst 88 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 89 fin
  li t1, 257
  sw t1, 0(t5)                                                          # ir inst 90 fin
  li t1, 30
  mv t6, t1                                                             # ir inst 91 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 92 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 93 fin
  li t1, 31
  mv t6, t1                                                             # ir inst 94 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 95 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 96 fin
  li t1, 32
  mv t6, t1                                                             # ir inst 97 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 98 fin
  li t1, 257
  sw t1, 0(t5)                                                          # ir inst 99 fin
  li t1, 33
  mv t6, t1                                                             # ir inst 100 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 101 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 102 fin
  li t1, 34
  mv t6, t1                                                             # ir inst 103 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 104 fin
  li t1, 258
  sw t1, 0(t5)                                                          # ir inst 105 fin
  li t1, 35
  mv t6, t1                                                             # ir inst 106 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 107 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 108 fin
  li t1, 36
  mv t6, t1                                                             # ir inst 109 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 110 fin
  li t1, 12
  sw t1, 0(t5)                                                          # ir inst 111 fin
  li t1, 37
  mv t6, t1                                                             # ir inst 112 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 113 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 114 fin
  li t1, 38
  mv t6, t1                                                             # ir inst 115 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 116 fin
  li t1, 258
  sw t1, 0(t5)                                                          # ir inst 117 fin
  li t1, 39
  mv t6, t1                                                             # ir inst 118 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 119 fin
  li t1, 7
  sw t1, 0(t5)                                                          # ir inst 120 fin
  li t1, 40
  mv t6, t1                                                             # ir inst 121 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 122 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 123 fin
# Phi connections
  li t6, 0
  j .F.load_program._1.while.cond.0                                     # ir inst 124 fin
.F.load_program._1.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 126 fin
  bnez t5, .F.load_program._2.while.body.0
  j .F.load_program._3.while.exit.0                                     # ir inst 127 fin
.F.load_program._2.while.body.0:
  li t2, 10
  mul t5, t6, t2                                                        # ir inst 128 fin
  addi t4, t5, 100                                                      # ir inst 129 fin
  mv t5, t4                                                             # ir inst 130 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 131 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 132 fin
  mv t5, t4                                                             # ir inst 133 fin
  addi t3, t5, 1                                                        # ir inst 134 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 135 fin
  sw t6, 0(t5)                                                          # ir inst 136 fin
  mv t5, t4                                                             # ir inst 137 fin
  addi t3, t5, 2                                                        # ir inst 138 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 139 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 140 fin
  mv t5, t4                                                             # ir inst 141 fin
  addi t3, t5, 3                                                        # ir inst 142 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 143 fin
  addi t3, t6, 1                                                        # ir inst 144 fin
  sw t3, 0(t5)                                                          # ir inst 145 fin
  mv t5, t4                                                             # ir inst 146 fin
  addi t3, t5, 4                                                        # ir inst 147 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 148 fin
  li t1, 5
  sw t1, 0(t5)                                                          # ir inst 149 fin
  mv t5, t4                                                             # ir inst 150 fin
  addi t3, t5, 5                                                        # ir inst 151 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 152 fin
  li t1, 7
  sw t1, 0(t5)                                                          # ir inst 153 fin
  mv t5, t4                                                             # ir inst 154 fin
  addi t4, t5, 6                                                        # ir inst 155 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 156 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 157 fin
  addi t5, t6, 1                                                        # ir inst 158 fin
# Phi connections
  mv t6, t5
  j .F.load_program._1.while.cond.0                                     # ir inst 159 fin
.F.load_program._3.while.exit.0:
  addi t6, a0, 396                                                      # ir inst 160 fin
  li t1, 8
  sw t1, 0(t6)                                                          # ir inst 161 fin
  addi t6, a0, 400                                                      # ir inst 162 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 163 fin
  li t1, 400
  mv t6, t1                                                             # ir inst 164 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 165 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 166 fin
  li t1, 401
  mv t6, t1                                                             # ir inst 167 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 168 fin
  li t1, 500
  sw t1, 0(t5)                                                          # ir inst 169 fin
  li t1, 402
  mv t6, t1                                                             # ir inst 170 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 171 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 172 fin
  li t1, 403
  mv t6, t1                                                             # ir inst 173 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 174 fin
  li t1, 500
  sw t1, 0(t5)                                                          # ir inst 175 fin
  li t1, 404
  mv t6, t1                                                             # ir inst 176 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 177 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 178 fin
  li t1, 405
  mv t6, t1                                                             # ir inst 179 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 180 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 181 fin
  li t1, 406
  mv t6, t1                                                             # ir inst 182 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 183 fin
  li t1, 12
  sw t1, 0(t5)                                                          # ir inst 184 fin
  li t1, 407
  mv t6, t1                                                             # ir inst 185 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 186 fin
  li t1, 9
  sw t1, 0(t5)                                                          # ir inst 187 fin
  li t1, 408
  mv t6, t1                                                             # ir inst 188 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 189 fin
  li t1, 420
  sw t1, 0(t5)                                                          # ir inst 190 fin
  li t1, 409
  mv t6, t1                                                             # ir inst 191 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 192 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 193 fin
  li t1, 410
  mv t6, t1                                                             # ir inst 194 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 195 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 196 fin
  li t1, 411
  mv t6, t1                                                             # ir inst 197 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 198 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 199 fin
  li t1, 412
  mv t6, t1                                                             # ir inst 200 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 201 fin
  li t1, 500
  sw t1, 0(t5)                                                          # ir inst 202 fin
  li t1, 412
  mv t6, t1                                                             # ir inst 203 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 204 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 205 fin
  li t1, 413
  mv t6, t1                                                             # ir inst 206 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 207 fin
  li t1, 500
  sw t1, 0(t5)                                                          # ir inst 208 fin
  li t1, 414
  mv t6, t1                                                             # ir inst 209 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 210 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 211 fin
  li t1, 415
  mv t6, t1                                                             # ir inst 212 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 213 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 214 fin
  li t1, 416
  mv t6, t1                                                             # ir inst 215 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 216 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 217 fin
  li t1, 417
  mv t6, t1                                                             # ir inst 218 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 219 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 220 fin
  li t1, 417
  mv t6, t1                                                             # ir inst 221 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 222 fin
  li t1, 400
  sw t1, 0(t5)                                                          # ir inst 223 fin
  li t1, 600
  mv t6, t1                                                             # ir inst 224 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 225 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 226 fin
  li t1, 601
  mv t6, t1                                                             # ir inst 227 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 228 fin
  li t1, 700
  sw t1, 0(t5)                                                          # ir inst 229 fin
  li t1, 602
  mv t6, t1                                                             # ir inst 230 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 231 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 232 fin
  li t1, 603
  mv t6, t1                                                             # ir inst 233 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 234 fin
  li t1, 700
  sw t1, 0(t5)                                                          # ir inst 235 fin
  li t1, 604
  mv t6, t1                                                             # ir inst 236 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 237 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 238 fin
  li t1, 605
  mv t6, t1                                                             # ir inst 239 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 240 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 241 fin
  li t1, 606
  mv t6, t1                                                             # ir inst 242 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 243 fin
  li t1, 12
  sw t1, 0(t5)                                                          # ir inst 244 fin
  li t1, 607
  mv t6, t1                                                             # ir inst 245 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 246 fin
  li t1, 9
  sw t1, 0(t5)                                                          # ir inst 247 fin
  li t1, 608
  mv t6, t1                                                             # ir inst 248 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 249 fin
  li t1, 612
  sw t1, 0(t5)                                                          # ir inst 250 fin
  li t1, 609
  mv t6, t1                                                             # ir inst 251 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 252 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 253 fin
  li t1, 610
  mv t6, t1                                                             # ir inst 254 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 255 fin
  li t1, 700
  sw t1, 0(t5)                                                          # ir inst 256 fin
  li t1, 611
  mv t6, t1                                                             # ir inst 257 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 258 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 259 fin
  li t1, 612
  mv t6, t1                                                             # ir inst 260 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 261 fin
  li t1, 800
  sw t1, 0(t5)                                                          # ir inst 262 fin
  li t1, 612
  mv t6, t1                                                             # ir inst 263 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 264 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 265 fin
  li t1, 613
  mv t6, t1                                                             # ir inst 266 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 267 fin
  li t1, 700
  sw t1, 0(t5)                                                          # ir inst 268 fin
  li t1, 614
  mv t6, t1                                                             # ir inst 269 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 270 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 271 fin
  li t1, 615
  mv t6, t1                                                             # ir inst 272 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 273 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 274 fin
  li t1, 616
  mv t6, t1                                                             # ir inst 275 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 276 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 277 fin
  li t1, 617
  mv t6, t1                                                             # ir inst 278 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 279 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 280 fin
  li t1, 618
  mv t6, t1                                                             # ir inst 281 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 282 fin
  li t1, 600
  sw t1, 0(t5)                                                          # ir inst 283 fin
  li t1, 619
  mv t6, t1                                                             # ir inst 284 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 285 fin
  li t1, 14
  sw t1, 0(t5)                                                          # ir inst 286 fin
  li t1, 620
  mv t6, t1                                                             # ir inst 287 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 288 fin
  li t1, 700
  sw t1, 0(t5)                                                          # ir inst 289 fin
  li t1, 621
  mv t6, t1                                                             # ir inst 290 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 291 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 292 fin
  li t1, 622
  mv t6, t1                                                             # ir inst 293 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 294 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 295 fin
  li t1, 623
  mv t6, t1                                                             # ir inst 296 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 297 fin
  li t1, 4
  sw t1, 0(t5)                                                          # ir inst 298 fin
  li t1, 624
  mv t6, t1                                                             # ir inst 299 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 300 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 301 fin
  li t1, 625
  mv t6, t1                                                             # ir inst 302 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 303 fin
  li t1, 600
  sw t1, 0(t5)                                                          # ir inst 304 fin
  li t1, 626
  mv t6, t1                                                             # ir inst 305 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 306 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 307 fin
  li t1, 627
  mv t6, t1                                                             # ir inst 308 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 309 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 310 fin
  li t1, 628
  mv t6, t1                                                             # ir inst 311 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 312 fin
  li t1, 800
  sw t1, 0(t5)                                                          # ir inst 313 fin
  j .F.load_program.epilogue                                            # ir inst 314 fin
.F.load_program.epilogue:
  ret

.globl .F.execute_cycle
.F.execute_cycle:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 0 / 12,        range:       64(sp) -       64(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 64(sp)
.F.execute_cycle._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
  mv t5, t6                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 3 fin
  lw t5, 0(t6)                                                          # ir inst 4 fin
  lw t6, 0(a1)                                                          # ir inst 5 fin
  addi t4, t6, 1                                                        # ir inst 6 fin
  sw t4, 0(a1)                                                          # ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
  bnez t6, .F.execute_cycle._1.if.then.0
  j .F.execute_cycle._2.if.else.0                                       # ir inst 9 fin
.F.execute_cycle._1.if.then.0:
  li t1, 0
  sb t1, 0(a4)                                                          # ir inst 10 fin
  j .F.execute_cycle._63.if.exit.0                                      # ir inst 11 fin
.F.execute_cycle._2.if.else.0:
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 12 fin
  bnez t6, .F.execute_cycle._3.if.then.1
  j .F.execute_cycle._4.if.else.1                                       # ir inst 13 fin
.F.execute_cycle._3.if.then.1:
  lw t6, 0(a1)                                                          # ir inst 14 fin
  mv t4, t6                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 16 fin
  lw t4, 0(t6)                                                          # ir inst 17 fin
  lw t6, 0(a1)                                                          # ir inst 18 fin
  addi t3, t6, 1                                                        # ir inst 19 fin
  sw t3, 0(a1)                                                          # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t4
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
# ir inst 21 fin
  j .F.execute_cycle._62.if.exit.1                                      # ir inst 22 fin
.F.execute_cycle._4.if.else.1:
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 23 fin
  bnez t6, .F.execute_cycle._5.if.then.2
  j .F.execute_cycle._6.if.else.2                                       # ir inst 24 fin
.F.execute_cycle._5.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
# ir inst 25 fin
  j .F.execute_cycle._61.if.exit.2                                      # ir inst 26 fin
.F.execute_cycle._6.if.else.2:
  li t2, 3
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 27 fin
  bnez t6, .F.execute_cycle._7.if.then.3
  j .F.execute_cycle._8.if.else.3                                       # ir inst 28 fin
.F.execute_cycle._7.if.then.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
# ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 30 fin
  add t3, t4, t6                                                        # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t3
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
# ir inst 32 fin
  j .F.execute_cycle._60.if.exit.3                                      # ir inst 33 fin
.F.execute_cycle._8.if.else.3:
  li t2, 4
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 34 fin
  bnez t6, .F.execute_cycle._9.if.then.4
  j .F.execute_cycle._10.if.else.4                                      # ir inst 35 fin
.F.execute_cycle._9.if.then.4:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
# ir inst 36 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 37 fin
  sub t3, t4, t6                                                        # ir inst 38 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t3
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
# ir inst 39 fin
  j .F.execute_cycle._59.if.exit.4                                      # ir inst 40 fin
.F.execute_cycle._10.if.else.4:
  li t2, 5
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 41 fin
  bnez t6, .F.execute_cycle._11.if.then.5
  j .F.execute_cycle._12.if.else.5                                      # ir inst 42 fin
.F.execute_cycle._11.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
# ir inst 43 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 44 fin
  mul t3, t4, t6                                                        # ir inst 45 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t3
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
# ir inst 46 fin
  j .F.execute_cycle._58.if.exit.5                                      # ir inst 47 fin
.F.execute_cycle._12.if.else.5:
  li t2, 6
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 48 fin
  bnez t6, .F.execute_cycle._13.if.then.6
  j .F.execute_cycle._17.if.else.6                                      # ir inst 49 fin
.F.execute_cycle._13.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
# ir inst 50 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 51 fin
  li t2, 0
  xor t0, t6, t2
  sltu t3, zero, t0                                                     # ir inst 52 fin
  bnez t3, .F.execute_cycle._14.if.then.7
  j .F.execute_cycle._15.if.else.7                                      # ir inst 53 fin
.F.execute_cycle._14.if.then.7:
  div t3, t4, t6                                                        # ir inst 54 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t3
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
# ir inst 55 fin
  j .F.execute_cycle._16.if.exit.7                                      # ir inst 56 fin
.F.execute_cycle._15.if.else.7:
  li t1, 0
  sb t1, 0(a4)                                                          # ir inst 57 fin
  j .F.execute_cycle._16.if.exit.7                                      # ir inst 58 fin
.F.execute_cycle._16.if.exit.7:
  j .F.execute_cycle._57.if.exit.6                                      # ir inst 59 fin
.F.execute_cycle._17.if.else.6:
  li t2, 7
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 60 fin
  bnez t6, .F.execute_cycle._18.if.then.8
  j .F.execute_cycle._19.if.else.8                                      # ir inst 61 fin
.F.execute_cycle._18.if.then.8:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 62 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 63 fin
  j .F.execute_cycle._56.if.exit.8                                      # ir inst 64 fin
.F.execute_cycle._19.if.else.8:
  li t2, 8
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 65 fin
  bnez t6, .F.execute_cycle._20.if.then.9
  j .F.execute_cycle._21.if.else.9                                      # ir inst 66 fin
.F.execute_cycle._20.if.then.9:
  lw t6, 0(a1)                                                          # ir inst 67 fin
  mv t4, t6                                                             # ir inst 68 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 69 fin
  lw t4, 0(t6)                                                          # ir inst 70 fin
  sw t4, 0(a1)                                                          # ir inst 71 fin
  j .F.execute_cycle._55.if.exit.9                                      # ir inst 72 fin
.F.execute_cycle._21.if.else.9:
  li t2, 9
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 73 fin
  bnez t6, .F.execute_cycle._22.if.then.10
  j .F.execute_cycle._26.if.else.10                                     # ir inst 74 fin
.F.execute_cycle._22.if.then.10:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 75 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 76 fin
  bnez t4, .F.execute_cycle._23.if.then.11
  j .F.execute_cycle._24.if.else.11                                     # ir inst 77 fin
.F.execute_cycle._23.if.then.11:
  lw t6, 0(a1)                                                          # ir inst 78 fin
  mv t4, t6                                                             # ir inst 79 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 80 fin
  lw t4, 0(t6)                                                          # ir inst 81 fin
  sw t4, 0(a1)                                                          # ir inst 82 fin
  j .F.execute_cycle._25.if.exit.11                                     # ir inst 83 fin
.F.execute_cycle._24.if.else.11:
  lw t6, 0(a1)                                                          # ir inst 84 fin
  addi t4, t6, 1                                                        # ir inst 85 fin
  sw t4, 0(a1)                                                          # ir inst 86 fin
  j .F.execute_cycle._25.if.exit.11                                     # ir inst 87 fin
.F.execute_cycle._25.if.exit.11:
  j .F.execute_cycle._54.if.exit.10                                     # ir inst 88 fin
.F.execute_cycle._26.if.else.10:
  li t2, 10
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 89 fin
  bnez t6, .F.execute_cycle._27.if.then.12
  j .F.execute_cycle._31.if.else.12                                     # ir inst 90 fin
.F.execute_cycle._27.if.then.12:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 91 fin
  li t2, 0
  xor t0, t6, t2
  sltu t4, zero, t0                                                     # ir inst 92 fin
  bnez t4, .F.execute_cycle._28.if.then.13
  j .F.execute_cycle._29.if.else.13                                     # ir inst 93 fin
.F.execute_cycle._28.if.then.13:
  lw t6, 0(a1)                                                          # ir inst 94 fin
  mv t4, t6                                                             # ir inst 95 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 96 fin
  lw t4, 0(t6)                                                          # ir inst 97 fin
  sw t4, 0(a1)                                                          # ir inst 98 fin
  j .F.execute_cycle._30.if.exit.13                                     # ir inst 99 fin
.F.execute_cycle._29.if.else.13:
  lw t6, 0(a1)                                                          # ir inst 100 fin
  addi t4, t6, 1                                                        # ir inst 101 fin
  sw t4, 0(a1)                                                          # ir inst 102 fin
  j .F.execute_cycle._30.if.exit.13                                     # ir inst 103 fin
.F.execute_cycle._30.if.exit.13:
  j .F.execute_cycle._53.if.exit.12                                     # ir inst 104 fin
.F.execute_cycle._31.if.else.12:
  li t2, 11
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 105 fin
  bnez t6, .F.execute_cycle._32.if.then.14
  j .F.execute_cycle._36.if.else.14                                     # ir inst 106 fin
.F.execute_cycle._32.if.then.14:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 107 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 108 fin
  xor t0, t4, t6
  sltiu t3, t0, 1                                                       # ir inst 109 fin
  bnez t3, .F.execute_cycle._33.if.then.15
  j .F.execute_cycle._34.if.else.15                                     # ir inst 110 fin
.F.execute_cycle._33.if.then.15:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  li a2, 1
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 111 fin
  j .F.execute_cycle._35.if.exit.15                                     # ir inst 112 fin
.F.execute_cycle._34.if.else.15:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  li a2, 0
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 113 fin
  j .F.execute_cycle._35.if.exit.15                                     # ir inst 114 fin
.F.execute_cycle._35.if.exit.15:
  j .F.execute_cycle._52.if.exit.14                                     # ir inst 115 fin
.F.execute_cycle._36.if.else.14:
  li t2, 12
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 116 fin
  bnez t6, .F.execute_cycle._37.if.then.16
  j .F.execute_cycle._41.if.else.16                                     # ir inst 117 fin
.F.execute_cycle._37.if.then.16:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 118 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 119 fin
  slt t3, t4, t6                                                        # ir inst 120 fin
  bnez t3, .F.execute_cycle._38.if.then.17
  j .F.execute_cycle._39.if.else.17                                     # ir inst 121 fin
.F.execute_cycle._38.if.then.17:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  li a2, 1
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 122 fin
  j .F.execute_cycle._40.if.exit.17                                     # ir inst 123 fin
.F.execute_cycle._39.if.else.17:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, a3
  mv a0, a2
  li a2, 0
  call .F.push_stack
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 124 fin
  j .F.execute_cycle._40.if.exit.17                                     # ir inst 125 fin
.F.execute_cycle._40.if.exit.17:
  j .F.execute_cycle._51.if.exit.16                                     # ir inst 126 fin
.F.execute_cycle._41.if.else.16:
  li t2, 13
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 127 fin
  bnez t6, .F.execute_cycle._42.if.then.18
  j .F.execute_cycle._43.if.else.18                                     # ir inst 128 fin
.F.execute_cycle._42.if.then.18:
  lw t6, 0(a1)                                                          # ir inst 129 fin
  mv t4, t6                                                             # ir inst 130 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 131 fin
  lw t4, 0(t6)                                                          # ir inst 132 fin
  lw t6, 0(a1)                                                          # ir inst 133 fin
  addi t3, t6, 1                                                        # ir inst 134 fin
  sw t3, 0(a1)                                                          # ir inst 135 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  mv a1, a3
  mv a0, a2
  call .F.pop_stack
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
# ir inst 136 fin
  mv t3, t4                                                             # ir inst 137 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 138 fin
  sw t6, 0(t4)                                                          # ir inst 139 fin
  j .F.execute_cycle._50.if.exit.18                                     # ir inst 140 fin
.F.execute_cycle._43.if.else.18:
  li t2, 14
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 141 fin
  bnez t6, .F.execute_cycle._44.if.then.19
  j .F.execute_cycle._45.if.else.19                                     # ir inst 142 fin
.F.execute_cycle._44.if.then.19:
  lw t6, 0(a1)                                                          # ir inst 143 fin
  mv t4, t6                                                             # ir inst 144 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 145 fin
  lw t4, 0(t6)                                                          # ir inst 146 fin
  lw t6, 0(a1)                                                          # ir inst 147 fin
  addi t3, t6, 1                                                        # ir inst 148 fin
  sw t3, 0(a1)                                                          # ir inst 149 fin
  mv t6, t4                                                             # ir inst 150 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 151 fin
  lw t6, 0(t4)                                                          # ir inst 152 fin
# Start call preparation
  sd a2, 0(sp)
  sd a3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t6
  call .F.push_stack
  ld a2, 0(sp)
  ld a3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 153 fin
  j .F.execute_cycle._49.if.exit.19                                     # ir inst 154 fin
.F.execute_cycle._45.if.else.19:
  li t2, 15
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 155 fin
  bnez t6, .F.execute_cycle._46.if.then.20
  j .F.execute_cycle._47.if.else.20                                     # ir inst 156 fin
.F.execute_cycle._46.if.then.20:
  lw t6, 0(a3)                                                          # ir inst 157 fin
  mv t5, t6                                                             # ir inst 158 fin
  slli t2, t5, 2
  add t6, a2, t2                                                        # ir inst 159 fin
  lw t5, 0(t6)                                                          # ir inst 160 fin
# Start call preparation
  sd a2, 0(sp)
  sd a3, 8(sp)
  sd t5, 16(sp)
  mv a1, a3
  mv a0, a2
  mv a2, t5
  call .F.push_stack
  ld a2, 0(sp)
  ld a3, 8(sp)
  ld t5, 16(sp)
# ir inst 161 fin
  j .F.execute_cycle._48.if.exit.20                                     # ir inst 162 fin
.F.execute_cycle._47.if.else.20:
  j .F.execute_cycle._48.if.exit.20                                     # ir inst 163 fin
.F.execute_cycle._48.if.exit.20:
  j .F.execute_cycle._49.if.exit.19                                     # ir inst 164 fin
.F.execute_cycle._49.if.exit.19:
  j .F.execute_cycle._50.if.exit.18                                     # ir inst 165 fin
.F.execute_cycle._50.if.exit.18:
  j .F.execute_cycle._51.if.exit.16                                     # ir inst 166 fin
.F.execute_cycle._51.if.exit.16:
  j .F.execute_cycle._52.if.exit.14                                     # ir inst 167 fin
.F.execute_cycle._52.if.exit.14:
  j .F.execute_cycle._53.if.exit.12                                     # ir inst 168 fin
.F.execute_cycle._53.if.exit.12:
  j .F.execute_cycle._54.if.exit.10                                     # ir inst 169 fin
.F.execute_cycle._54.if.exit.10:
  j .F.execute_cycle._55.if.exit.9                                      # ir inst 170 fin
.F.execute_cycle._55.if.exit.9:
  j .F.execute_cycle._56.if.exit.8                                      # ir inst 171 fin
.F.execute_cycle._56.if.exit.8:
  j .F.execute_cycle._57.if.exit.6                                      # ir inst 172 fin
.F.execute_cycle._57.if.exit.6:
  j .F.execute_cycle._58.if.exit.5                                      # ir inst 173 fin
.F.execute_cycle._58.if.exit.5:
  j .F.execute_cycle._59.if.exit.4                                      # ir inst 174 fin
.F.execute_cycle._59.if.exit.4:
  j .F.execute_cycle._60.if.exit.3                                      # ir inst 175 fin
.F.execute_cycle._60.if.exit.3:
  j .F.execute_cycle._61.if.exit.2                                      # ir inst 176 fin
.F.execute_cycle._61.if.exit.2:
  j .F.execute_cycle._62.if.exit.1                                      # ir inst 177 fin
.F.execute_cycle._62.if.exit.1:
  j .F.execute_cycle._63.if.exit.0                                      # ir inst 178 fin
.F.execute_cycle._63.if.exit.0:
  j .F.execute_cycle.epilogue                                           # ir inst 179 fin
.F.execute_cycle.epilogue:
  ld ra, 64(sp)
  addi sp, sp, 80
  ret

.globl main
main:
# spill func args num: 0,             range:     5168(sp) -     5168(sp)
# local var size: 5129,               range:       32(sp) -     5161(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -5168
  add sp, sp, t0
  sd s11, 16(sp)
  sd ra, 24(sp)
main._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 6 fin
main._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j main._1.array.cond.0                                                # ir inst 10 fin
main._3.array.exit.0:
  li t1, 4128
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 16 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 20 fin
main._6.array.exit.1:
# alloca %12
  li t2, 5152
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 22 fin
# alloca %13
  li t2, 5156
  add t2, sp, t2
  li t1, -1
  sw t1, 0(t2)                                                          # ir inst 24 fin
# alloca %14
  li t2, 5160
  add t2, sp, t2
  li t1, 1
  sb t1, 0(t2)                                                          # ir inst 26 fin
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.load_program
# ir inst 27 fin
# Phi connections
  li t6, 0
  j main._7.while.cond.0                                                # ir inst 28 fin
main._7.while.cond.0:
  li t1, 5160
  add t1, sp, t1
  lb t5, 0(t1)                                                          # ir inst 30 fin
  bnez t5, main._8.while.body.0
  j main._25.critical_edge.0                                            # ir inst 31 fin
main._8.while.body.0:
  li t2, 5000
  slt t5, t2, t6                                                        # ir inst 32 fin
  bnez t5, main._9.if.then.0
  j main._10.if.else.0                                                  # ir inst 33 fin
main._9.if.then.0:
  j main._12.while.exit.0                                               # ir inst 34 fin
main._10.if.else.0:
  j main._11.if.exit.0                                                  # ir inst 35 fin
main._11.if.exit.0:
# Start call preparation
  sd t6, 0(sp)
  li t1, 5160
  add t1, sp, t1
  mv a4, t1
  li t1, 5156
  add t1, sp, t1
  mv a3, t1
  li t1, 4128
  add t1, sp, t1
  mv a2, t1
  li t1, 5152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call .F.execute_cycle
  ld t6, 0(sp)
# ir inst 36 fin
  addi t5, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t6, t5
  j main._7.while.cond.0                                                # ir inst 38 fin
main._12.while.exit.0:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 39 fin
  li t1, 5156
  add t1, sp, t1
  lw t5, 0(t1)                                                          # ir inst 40 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 41 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._13.while.cond.1                                               # ir inst 42 fin
main._13.while.cond.1:
  li t2, 256
  slt t3, t5, t2                                                        # ir inst 45 fin
  bnez t3, main._14.while.body.1
  j main._15.while.exit.1                                               # ir inst 46 fin
main._14.while.body.1:
  mv t3, t5                                                             # ir inst 47 fin
  slli t2, t3, 2
  li t1, 4128
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 48 fin
  lw t3, 0(s11)                                                         # ir inst 49 fin
  add s11, t4, t3                                                       # ir inst 50 fin
  addi t3, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j main._13.while.cond.1                                               # ir inst 52 fin
main._15.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 53 fin
# alloca %12
  li t2, 5152
  add t2, sp, t2
  li t1, 100
  sw t1, 0(t2)                                                          # ir inst 54 fin
# alloca %13
  li t2, 5156
  add t2, sp, t2
  li t1, -1
  sw t1, 0(t2)                                                          # ir inst 55 fin
# alloca %14
  li t2, 5160
  add t2, sp, t2
  li t1, 1
  sb t1, 0(t2)                                                          # ir inst 56 fin
# Phi connections
  li t5, 0
  j main._16.while.cond.2                                               # ir inst 57 fin
main._16.while.cond.2:
  li t1, 5160
  add t1, sp, t1
  lb t4, 0(t1)                                                          # ir inst 59 fin
  bnez t4, main._17.while.body.2
  j main._26.critical_edge.1                                            # ir inst 60 fin
main._17.while.body.2:
  li t2, 100
  slt t4, t2, t5                                                        # ir inst 61 fin
  bnez t4, main._18.if.then.1
  j main._19.if.else.1                                                  # ir inst 62 fin
main._18.if.then.1:
  j main._21.while.exit.2                                               # ir inst 63 fin
main._19.if.else.1:
  j main._20.if.exit.1                                                  # ir inst 64 fin
main._20.if.exit.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li t1, 5160
  add t1, sp, t1
  mv a4, t1
  li t1, 5156
  add t1, sp, t1
  mv a3, t1
  li t1, 4128
  add t1, sp, t1
  mv a2, t1
  li t1, 5152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 32
  mv a0, t1
  call .F.execute_cycle
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 65 fin
  addi t4, t5, 1                                                        # ir inst 66 fin
# Phi connections
  mv t5, t4
  j main._16.while.cond.2                                               # ir inst 67 fin
main._21.while.exit.2:
# Phi connections
  li t5, 0
  j main._22.while.cond.3                                               # ir inst 68 fin
main._22.while.cond.3:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 70 fin
  bnez t4, main._23.while.body.3
  j main._24.while.exit.3                                               # ir inst 71 fin
main._23.while.body.3:
  addi t4, t5, 1                                                        # ir inst 72 fin
# Phi connections
  mv t5, t4
  j main._22.while.cond.3                                               # ir inst 73 fin
main._24.while.exit.3:
# Start call preparation
  sd t6, 0(sp)
  li a0, 1
  call printlnInt
  ld t6, 0(sp)
# ir inst 74 fin
# Start call preparation
  sd t6, 0(sp)
  li a0, 0
  call exit
  ld t6, 0(sp)
# ir inst 75 fin
  j main.epilogue                                                       # ir inst 76 fin
main._25.critical_edge.0:
  j main._12.while.exit.0                                               # ir inst 77 fin
main._26.critical_edge.1:
  j main._21.while.exit.2                                               # ir inst 78 fin
main.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  li t0, 5168
  add sp, sp, t0
  ret
