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

.globl .F.load_program
.F.load_program:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.load_program._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 8
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 16                                                       # ir inst 9 fin
  li t1, 15
  sw t1, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 20                                                       # ir inst 11 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 24                                                       # ir inst 13 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t6, a0, 28                                                       # ir inst 15 fin
  li t1, 11
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t6, a0, 32                                                       # ir inst 17 fin
  li t1, 9
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t6, a0, 36                                                       # ir inst 19 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 40                                                       # ir inst 21 fin
  li t1, 7
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 44                                                       # ir inst 23 fin
  li t1, 20
  sw t1, 0(t6)                                                          # ir inst 24 fin
  addi t6, a0, 48                                                       # ir inst 25 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 26 fin
  addi t6, a0, 52                                                       # ir inst 27 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 28 fin
  addi t6, a0, 56                                                       # ir inst 29 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 30 fin
  addi t6, a0, 60                                                       # ir inst 31 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 32 fin
  addi t6, a0, 64                                                       # ir inst 33 fin
  li t1, 7
  sw t1, 0(t6)                                                          # ir inst 34 fin
  addi t6, a0, 68                                                       # ir inst 35 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 36 fin
  addi t6, a0, 72                                                       # ir inst 37 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 38 fin
  addi t6, a0, 76                                                       # ir inst 39 fin
  li t1, 7
  sw t1, 0(t6)                                                          # ir inst 40 fin
  addi t6, a0, 80                                                       # ir inst 41 fin
  li t1, 12
  sw t1, 0(t6)                                                          # ir inst 42 fin
  addi t6, a0, 84                                                       # ir inst 43 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 44 fin
  addi t6, a0, 88                                                       # ir inst 45 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 46 fin
# Phi connections
  li t6, 30
  j .F.load_program._1.while.cond.0                                     # ir inst 47 fin
.F.load_program._1.while.cond.0:
  li t2, 250
  slt t5, t6, t2                                                        # ir inst 49 fin
  bnez t5, .F.load_program._2.while.body.0
  j .F.load_program._3.while.exit.0                                     # ir inst 50 fin
.F.load_program._2.while.body.0:
  mv t5, t6                                                             # ir inst 51 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 52 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 53 fin
  mv t5, t6                                                             # ir inst 54 fin
  addi t4, t5, 1                                                        # ir inst 55 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 56 fin
  sw t6, 0(t5)                                                          # ir inst 57 fin
  mv t5, t6                                                             # ir inst 58 fin
  addi t4, t5, 2                                                        # ir inst 59 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 60 fin
  li t1, 15
  sw t1, 0(t5)                                                          # ir inst 61 fin
  mv t5, t6                                                             # ir inst 62 fin
  addi t4, t5, 3                                                        # ir inst 63 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 64 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 65 fin
  addi t5, t6, 4                                                        # ir inst 66 fin
# Phi connections
  mv t6, t5
  j .F.load_program._1.while.cond.0                                     # ir inst 67 fin
.F.load_program._3.while.exit.0:
  j .F.load_program.epilogue                                            # ir inst 68 fin
.F.load_program.epilogue:
  ret

.globl .F.self_modify_code
.F.self_modify_code:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.self_modify_code._0.entry.0:
  li t2, 10
  slt t6, t2, a1                                                        # ir inst 1 fin
  bnez t6, .F.self_modify_code._1.lazy.then.0
  j .F.self_modify_code._2.lazy.else.0                                  # ir inst 2 fin
.F.self_modify_code._1.lazy.then.0:
  mv t6, a1                                                             # ir inst 3 fin
  addi t5, t6, -1                                                       # ir inst 4 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 5 fin
  lw t5, 0(t6)                                                          # ir inst 6 fin
  li t2, 15
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 7 fin
# Phi connections
  j .F.self_modify_code._3.lazy.exit.0                                  # ir inst 8 fin
.F.self_modify_code._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.self_modify_code._3.lazy.exit.0                                  # ir inst 9 fin
.F.self_modify_code._3.lazy.exit.0:
  bnez t6, .F.self_modify_code._4.if.then.0
  j .F.self_modify_code._5.if.else.0                                    # ir inst 11 fin
.F.self_modify_code._4.if.then.0:
  mv t6, a1                                                             # ir inst 12 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 13 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 14 fin
  j .F.self_modify_code._6.if.exit.0                                    # ir inst 15 fin
.F.self_modify_code._5.if.else.0:
  j .F.self_modify_code._6.if.exit.0                                    # ir inst 16 fin
.F.self_modify_code._6.if.exit.0:
  j .F.self_modify_code.epilogue                                        # ir inst 17 fin
.F.self_modify_code.epilogue:
  ret

.globl main
main:
# spill func args num: 0,             range:     2128(sp) -     2128(sp)
# local var size: 2048,               range:       80(sp) -     2128(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 5 / 12,        range:       32(sp) -       72(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -2128
  add sp, sp, t0
  sd s11, 32(sp)
  sd s7, 40(sp)
  sd s8, 48(sp)
  sd s10, 56(sp)
  sd s9, 64(sp)
  sd ra, 72(sp)
main._0.entry.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 256
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
  addi t1, sp, 1104
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
# Start call preparation
  addi t1, sp, 80
  mv a0, t1
  call .F.load_program
# ir inst 21 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, -1
  j main._7.while.cond.0                                                # ir inst 22 fin
main._7.while.cond.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 26 fin
  bnez t3, main._8.while.body.0
  j main._75.while.exit.0                                               # ir inst 27 fin
main._8.while.body.0:
  mv t3, t4                                                             # ir inst 28 fin
  slli t2, t3, 2
  addi t1, sp, 80
  add s11, t1, t2                                                       # ir inst 29 fin
  lw t3, 0(s11)                                                         # ir inst 30 fin
  addi s11, t4, 1                                                       # ir inst 31 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s11
  addi t1, sp, 80
  mv a0, t1
  call .F.self_modify_code
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 32 fin
  li t2, 1
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 33 fin
  bnez t4, main._9.if.then.0
  j main._10.if.else.0                                                  # ir inst 34 fin
main._9.if.then.0:
  mv t4, s11                                                            # ir inst 35 fin
  slli t2, t4, 2
  addi t1, sp, 80
  add s10, t1, t2                                                       # ir inst 36 fin
  lw t4, 0(s10)                                                         # ir inst 37 fin
  addi s10, s11, 1                                                      # ir inst 38 fin
  addi s9, t6, 1                                                        # ir inst 39 fin
  mv s8, s9                                                             # ir inst 40 fin
  slli t2, s8, 2
  addi t1, sp, 1104
  add s7, t1, t2                                                        # ir inst 41 fin
  sw t4, 0(s7)                                                          # ir inst 42 fin
# Phi connections
  mv t4, s10
  mv t6, s9
  j main._68.if.exit.0                                                  # ir inst 43 fin
main._10.if.else.0:
  li t2, 2
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 44 fin
  bnez t4, main._11.if.then.1
  j main._12.if.else.1                                                  # ir inst 45 fin
main._11.if.then.1:
  addi t4, t6, -1                                                       # ir inst 46 fin
# Phi connections
  mv t6, t4
  mv t4, s11
  j main._67.if.exit.1                                                  # ir inst 47 fin
main._12.if.else.1:
  li t2, 3
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 48 fin
  bnez t4, main._13.if.then.2
  j main._14.if.else.2                                                  # ir inst 49 fin
main._13.if.then.2:
  mv t4, t6                                                             # ir inst 50 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 51 fin
  lw t4, 0(s10)                                                         # ir inst 52 fin
  addi s10, t6, -1                                                      # ir inst 53 fin
  mv s9, s10                                                            # ir inst 54 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 55 fin
  lw s9, 0(s8)                                                          # ir inst 56 fin
  mv s8, s10                                                            # ir inst 57 fin
  slli t2, s8, 2
  addi t1, sp, 1104
  add s7, t1, t2                                                        # ir inst 58 fin
  add s8, s9, t4                                                        # ir inst 59 fin
  sw s8, 0(s7)                                                          # ir inst 60 fin
# Phi connections
  mv t4, s11
  mv t6, s10
  j main._66.if.exit.2                                                  # ir inst 61 fin
main._14.if.else.2:
  li t2, 4
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 62 fin
  bnez t4, main._15.if.then.3
  j main._16.if.else.3                                                  # ir inst 63 fin
main._15.if.then.3:
  mv t4, t6                                                             # ir inst 64 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 65 fin
  lw t4, 0(s10)                                                         # ir inst 66 fin
  addi s10, t6, -1                                                      # ir inst 67 fin
  mv s9, s10                                                            # ir inst 68 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 69 fin
  lw s9, 0(s8)                                                          # ir inst 70 fin
  mv s8, s10                                                            # ir inst 71 fin
  slli t2, s8, 2
  addi t1, sp, 1104
  add s7, t1, t2                                                        # ir inst 72 fin
  sub s8, s9, t4                                                        # ir inst 73 fin
  sw s8, 0(s7)                                                          # ir inst 74 fin
# Phi connections
  mv t4, s11
  mv t6, s10
  j main._65.if.exit.3                                                  # ir inst 75 fin
main._16.if.else.3:
  li t2, 5
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 76 fin
  bnez t4, main._17.if.then.4
  j main._18.if.else.4                                                  # ir inst 77 fin
main._17.if.then.4:
  mv t4, t6                                                             # ir inst 78 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 79 fin
  lw t4, 0(s10)                                                         # ir inst 80 fin
  addi s10, t6, -1                                                      # ir inst 81 fin
  mv s9, s10                                                            # ir inst 82 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 83 fin
  lw s9, 0(s8)                                                          # ir inst 84 fin
  mv s8, s10                                                            # ir inst 85 fin
  slli t2, s8, 2
  addi t1, sp, 1104
  add s7, t1, t2                                                        # ir inst 86 fin
  mul s8, s9, t4                                                        # ir inst 87 fin
  sw s8, 0(s7)                                                          # ir inst 88 fin
# Phi connections
  mv t4, s11
  mv t6, s10
  j main._64.if.exit.4                                                  # ir inst 89 fin
main._18.if.else.4:
  li t2, 6
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 90 fin
  bnez t4, main._19.if.then.5
  j main._20.if.else.5                                                  # ir inst 91 fin
main._19.if.then.5:
  mv t4, t6                                                             # ir inst 92 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 93 fin
  lw t4, 0(s10)                                                         # ir inst 94 fin
  addi s10, t6, -1                                                      # ir inst 95 fin
  mv s9, s10                                                            # ir inst 96 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 97 fin
  lw s9, 0(s8)                                                          # ir inst 98 fin
  mv s8, s10                                                            # ir inst 99 fin
  slli t2, s8, 2
  addi t1, sp, 1104
  add s7, t1, t2                                                        # ir inst 100 fin
  div s8, s9, t4                                                        # ir inst 101 fin
  sw s8, 0(s7)                                                          # ir inst 102 fin
# Phi connections
  mv t4, s11
  mv t6, s10
  j main._63.if.exit.5                                                  # ir inst 103 fin
main._20.if.else.5:
  li t2, 7
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 104 fin
  bnez t4, main._21.if.then.6
  j main._22.if.else.6                                                  # ir inst 105 fin
main._21.if.then.6:
  mv t4, s11                                                            # ir inst 106 fin
  slli t2, t4, 2
  addi t1, sp, 80
  add s10, t1, t2                                                       # ir inst 107 fin
  lw t4, 0(s10)                                                         # ir inst 108 fin
# Phi connections
  j main._62.if.exit.6                                                  # ir inst 109 fin
main._22.if.else.6:
  li t2, 8
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 110 fin
  bnez t4, main._23.if.then.7
  j main._27.if.else.7                                                  # ir inst 111 fin
main._23.if.then.7:
  mv t4, t6                                                             # ir inst 112 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 113 fin
  lw t4, 0(s10)                                                         # ir inst 114 fin
  addi s10, t6, -1                                                      # ir inst 115 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s9, t0, 1                                                       # ir inst 116 fin
  bnez s9, main._24.if.then.8
  j main._25.if.else.8                                                  # ir inst 117 fin
main._24.if.then.8:
  mv t4, s11                                                            # ir inst 118 fin
  slli t2, t4, 2
  addi t1, sp, 80
  add s9, t1, t2                                                        # ir inst 119 fin
  lw t4, 0(s9)                                                          # ir inst 120 fin
# Phi connections
  j main._26.if.exit.8                                                  # ir inst 121 fin
main._25.if.else.8:
  addi t4, s11, 1                                                       # ir inst 122 fin
# Phi connections
  j main._26.if.exit.8                                                  # ir inst 123 fin
main._26.if.exit.8:
# Phi connections
  mv t6, s10
  j main._61.if.exit.7                                                  # ir inst 125 fin
main._27.if.else.7:
  li t2, 9
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 126 fin
  bnez t4, main._28.if.then.9
  j main._32.if.else.9                                                  # ir inst 127 fin
main._28.if.then.9:
  mv t4, t6                                                             # ir inst 128 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 129 fin
  lw t4, 0(s10)                                                         # ir inst 130 fin
  addi s10, t6, -1                                                      # ir inst 131 fin
  li t2, 0
  xor t0, t4, t2
  sltu s9, zero, t0                                                     # ir inst 132 fin
  bnez s9, main._29.if.then.10
  j main._30.if.else.10                                                 # ir inst 133 fin
main._29.if.then.10:
  mv t4, s11                                                            # ir inst 134 fin
  slli t2, t4, 2
  addi t1, sp, 80
  add s9, t1, t2                                                        # ir inst 135 fin
  lw t4, 0(s9)                                                          # ir inst 136 fin
# Phi connections
  j main._31.if.exit.10                                                 # ir inst 137 fin
main._30.if.else.10:
  addi t4, s11, 1                                                       # ir inst 138 fin
# Phi connections
  j main._31.if.exit.10                                                 # ir inst 139 fin
main._31.if.exit.10:
# Phi connections
  mv t6, s10
  j main._60.if.exit.9                                                  # ir inst 141 fin
main._32.if.else.9:
  li t2, 10
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 142 fin
  bnez t4, main._33.if.then.11
  j main._37.if.else.11                                                 # ir inst 143 fin
main._33.if.then.11:
  mv t4, t6                                                             # ir inst 144 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 145 fin
  lw t4, 0(s10)                                                         # ir inst 146 fin
  addi s10, t6, -1                                                      # ir inst 147 fin
  mv s9, s10                                                            # ir inst 148 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 149 fin
  lw s9, 0(s8)                                                          # ir inst 150 fin
  xor t0, s9, t4
  sltiu s8, t0, 1                                                       # ir inst 151 fin
  bnez s8, main._34.if.then.12
  j main._35.if.else.12                                                 # ir inst 152 fin
main._34.if.then.12:
  mv t4, s10                                                            # ir inst 153 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 154 fin
  li t1, 1
  sw t1, 0(s9)                                                          # ir inst 155 fin
  j main._36.if.exit.12                                                 # ir inst 156 fin
main._35.if.else.12:
  mv t4, s10                                                            # ir inst 157 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 158 fin
  li t1, 0
  sw t1, 0(s9)                                                          # ir inst 159 fin
  j main._36.if.exit.12                                                 # ir inst 160 fin
main._36.if.exit.12:
# Phi connections
  mv t6, s10
  j main._59.if.exit.11                                                 # ir inst 161 fin
main._37.if.else.11:
  li t2, 11
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 162 fin
  bnez t4, main._38.if.then.13
  j main._42.if.else.13                                                 # ir inst 163 fin
main._38.if.then.13:
  mv t4, t6                                                             # ir inst 164 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 165 fin
  lw t4, 0(s10)                                                         # ir inst 166 fin
  addi s10, t6, -1                                                      # ir inst 167 fin
  mv s9, s10                                                            # ir inst 168 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 169 fin
  lw s9, 0(s8)                                                          # ir inst 170 fin
  slt s8, s9, t4                                                        # ir inst 171 fin
  bnez s8, main._39.if.then.14
  j main._40.if.else.14                                                 # ir inst 172 fin
main._39.if.then.14:
  mv t4, s10                                                            # ir inst 173 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 174 fin
  li t1, 1
  sw t1, 0(s9)                                                          # ir inst 175 fin
  j main._41.if.exit.14                                                 # ir inst 176 fin
main._40.if.else.14:
  mv t4, s10                                                            # ir inst 177 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 178 fin
  li t1, 0
  sw t1, 0(s9)                                                          # ir inst 179 fin
  j main._41.if.exit.14                                                 # ir inst 180 fin
main._41.if.exit.14:
# Phi connections
  mv t6, s10
  j main._58.if.exit.13                                                 # ir inst 181 fin
main._42.if.else.13:
  li t2, 12
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 182 fin
  bnez t4, main._43.if.then.15
  j main._47.if.else.15                                                 # ir inst 183 fin
main._43.if.then.15:
  mv t4, t6                                                             # ir inst 184 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 185 fin
  lw t4, 0(s10)                                                         # ir inst 186 fin
  addi s10, t6, -1                                                      # ir inst 187 fin
  mv s9, s10                                                            # ir inst 188 fin
  slli t2, s9, 2
  addi t1, sp, 1104
  add s8, t1, t2                                                        # ir inst 189 fin
  lw s9, 0(s8)                                                          # ir inst 190 fin
  slt s8, t4, s9                                                        # ir inst 191 fin
  bnez s8, main._44.if.then.16
  j main._45.if.else.16                                                 # ir inst 192 fin
main._44.if.then.16:
  mv t4, s10                                                            # ir inst 193 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 194 fin
  li t1, 1
  sw t1, 0(s9)                                                          # ir inst 195 fin
  j main._46.if.exit.16                                                 # ir inst 196 fin
main._45.if.else.16:
  mv t4, s10                                                            # ir inst 197 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 198 fin
  li t1, 0
  sw t1, 0(s9)                                                          # ir inst 199 fin
  j main._46.if.exit.16                                                 # ir inst 200 fin
main._46.if.exit.16:
# Phi connections
  mv t6, s10
  j main._57.if.exit.15                                                 # ir inst 201 fin
main._47.if.else.15:
  li t2, 13
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 202 fin
  bnez t4, main._48.if.then.17
  j main._49.if.else.17                                                 # ir inst 203 fin
main._48.if.then.17:
  mv t4, t6                                                             # ir inst 204 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add s10, t1, t2                                                       # ir inst 205 fin
  lw t4, 0(s10)                                                         # ir inst 206 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 207 fin
# Phi connections
  j main._56.if.exit.17                                                 # ir inst 208 fin
main._49.if.else.17:
  li t2, 14
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 209 fin
  bnez t4, main._50.if.then.18
  j main._51.if.else.18                                                 # ir inst 210 fin
main._50.if.then.18:
# Phi connections
  li t5, 1
  j main._55.if.exit.18                                                 # ir inst 211 fin
main._51.if.else.18:
  li t2, 15
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 212 fin
  bnez t4, main._52.if.then.19
  j main._53.if.else.19                                                 # ir inst 213 fin
main._52.if.then.19:
  mv t4, t6                                                             # ir inst 214 fin
  slli t2, t4, 2
  addi t1, sp, 1104
  add t3, t1, t2                                                        # ir inst 215 fin
  lw t4, 0(t3)                                                          # ir inst 216 fin
  addi t3, t6, 1                                                        # ir inst 217 fin
  mv s10, t3                                                            # ir inst 218 fin
  slli t2, s10, 2
  addi t1, sp, 1104
  add s9, t1, t2                                                        # ir inst 219 fin
  sw t4, 0(s9)                                                          # ir inst 220 fin
# Phi connections
  mv t6, t3
  j main._54.if.exit.19                                                 # ir inst 221 fin
main._53.if.else.19:
# Phi connections
  j main._54.if.exit.19                                                 # ir inst 222 fin
main._54.if.exit.19:
# Phi connections
  j main._55.if.exit.18                                                 # ir inst 224 fin
main._55.if.exit.18:
# Phi connections
  j main._56.if.exit.17                                                 # ir inst 227 fin
main._56.if.exit.17:
# Phi connections
  j main._57.if.exit.15                                                 # ir inst 230 fin
main._57.if.exit.15:
# Phi connections
  j main._58.if.exit.13                                                 # ir inst 233 fin
main._58.if.exit.13:
# Phi connections
  j main._59.if.exit.11                                                 # ir inst 236 fin
main._59.if.exit.11:
# Phi connections
  mv t4, s11
  j main._60.if.exit.9                                                  # ir inst 239 fin
main._60.if.exit.9:
# Phi connections
  j main._61.if.exit.7                                                  # ir inst 243 fin
main._61.if.exit.7:
# Phi connections
  j main._62.if.exit.6                                                  # ir inst 247 fin
main._62.if.exit.6:
# Phi connections
  j main._63.if.exit.5                                                  # ir inst 251 fin
main._63.if.exit.5:
# Phi connections
  j main._64.if.exit.4                                                  # ir inst 255 fin
main._64.if.exit.4:
# Phi connections
  j main._65.if.exit.3                                                  # ir inst 259 fin
main._65.if.exit.3:
# Phi connections
  j main._66.if.exit.2                                                  # ir inst 263 fin
main._66.if.exit.2:
# Phi connections
  j main._67.if.exit.1                                                  # ir inst 267 fin
main._67.if.exit.1:
# Phi connections
  j main._68.if.exit.0                                                  # ir inst 271 fin
main._68.if.exit.0:
  li t2, 0
  slt t3, t4, t2                                                        # ir inst 275 fin
  bnez t3, main._69.lazy.then.0
  j main._70.lazy.else.0                                                # ir inst 276 fin
main._69.lazy.then.0:
# Phi connections
  li t3, 1
  j main._71.lazy.exit.0                                                # ir inst 277 fin
main._70.lazy.else.0:
  li t2, 256
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 278 fin
# Phi connections
  j main._71.lazy.exit.0                                                # ir inst 279 fin
main._71.lazy.exit.0:
  bnez t3, main._72.if.then.20
  j main._73.if.else.20                                                 # ir inst 281 fin
main._72.if.then.20:
# Phi connections
  li t5, 1
  j main._74.if.exit.20                                                 # ir inst 282 fin
main._73.if.else.20:
# Phi connections
  j main._74.if.exit.20                                                 # ir inst 283 fin
main._74.if.exit.20:
# Phi connections
  j main._7.while.cond.0                                                # ir inst 285 fin
main._75.while.exit.0:
# Start call preparation
  li a0, 0
  call exit
# ir inst 286 fin
  j main.epilogue                                                       # ir inst 287 fin
main.epilogue:
  ld ra, 72(sp)
  ld s11, 32(sp)
  ld s7, 40(sp)
  ld s8, 48(sp)
  ld s10, 56(sp)
  ld s9, 64(sp)
  li t0, 2128
  add sp, sp, t0
  ret
