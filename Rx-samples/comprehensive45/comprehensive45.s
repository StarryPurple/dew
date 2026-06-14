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

.globl .F.generate_input
.F.generate_input:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generate_input._0.entry.0:
# Phi connections
  li t6, 0
  j .F.generate_input._1.while.cond.0                                   # ir inst 1 fin
.F.generate_input._1.while.cond.0:
  li t2, 512
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.generate_input._2.while.body.0
  j .F.generate_input._6.while.exit.0                                   # ir inst 4 fin
.F.generate_input._2.while.body.0:
  li t2, 20
  rem t5, t6, t2                                                        # ir inst 5 fin
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.generate_input._3.if.then.0
  j .F.generate_input._4.if.else.0                                      # ir inst 7 fin
.F.generate_input._3.if.then.0:
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 9 fin
  li t2, 10
  rem t5, t6, t2                                                        # ir inst 10 fin
  addi t3, t5, 65                                                       # ir inst 11 fin
  sw t3, 0(t4)                                                          # ir inst 12 fin
  j .F.generate_input._5.if.exit.0                                      # ir inst 13 fin
.F.generate_input._4.if.else.0:
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  li t2, 17
  mul t5, t6, t2                                                        # ir inst 16 fin
  li t2, 15
  rem t3, t5, t2                                                        # ir inst 17 fin
  addi t5, t3, 97                                                       # ir inst 18 fin
  sw t5, 0(t4)                                                          # ir inst 19 fin
  j .F.generate_input._5.if.exit.0                                      # ir inst 20 fin
.F.generate_input._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.generate_input._1.while.cond.0                                   # ir inst 22 fin
.F.generate_input._6.while.exit.0:
# Phi connections
  li t6, 100
  j .F.generate_input._7.while.cond.1                                   # ir inst 23 fin
.F.generate_input._7.while.cond.1:
  li t2, 120
  slt t5, t6, t2                                                        # ir inst 25 fin
  bnez t5, .F.generate_input._8.while.body.1
  j .F.generate_input._9.while.exit.1                                   # ir inst 26 fin
.F.generate_input._8.while.body.1:
  mv t5, t6                                                             # ir inst 27 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 28 fin
  mv t5, t6                                                             # ir inst 29 fin
  addi t3, t5, -20                                                      # ir inst 30 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 31 fin
  lw t3, 0(t5)                                                          # ir inst 32 fin
  sw t3, 0(t4)                                                          # ir inst 33 fin
  addi t5, t6, 1                                                        # ir inst 34 fin
# Phi connections
  mv t6, t5
  j .F.generate_input._7.while.cond.1                                   # ir inst 35 fin
.F.generate_input._9.while.exit.1:
# Phi connections
  li t6, 300
  j .F.generate_input._10.while.cond.2                                  # ir inst 36 fin
.F.generate_input._10.while.cond.2:
  li t2, 330
  slt t5, t6, t2                                                        # ir inst 38 fin
  bnez t5, .F.generate_input._11.while.body.2
  j .F.generate_input._12.while.exit.2                                  # ir inst 39 fin
.F.generate_input._11.while.body.2:
  mv t5, t6                                                             # ir inst 40 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  addi t3, t5, -30                                                      # ir inst 43 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 44 fin
  lw t3, 0(t5)                                                          # ir inst 45 fin
  sw t3, 0(t4)                                                          # ir inst 46 fin
  addi t5, t6, 1                                                        # ir inst 47 fin
# Phi connections
  mv t6, t5
  j .F.generate_input._10.while.cond.2                                  # ir inst 48 fin
.F.generate_input._12.while.exit.2:
  j .F.generate_input.epilogue                                          # ir inst 49 fin
.F.generate_input.epilogue:
  ret

.globl .F.find_longest_match
.F.find_longest_match:
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
.F.find_longest_match._0.entry.0:
  addi t6, a1, -1                                                       # ir inst 1 fin
# Phi connections
  li t4, 0
  li t5, 0
  j .F.find_longest_match._1.while.cond.0                               # ir inst 2 fin
.F.find_longest_match._1.while.cond.0:
  slt t0, t6, a2
  xori t3, t0, 1                                                        # ir inst 6 fin
  bnez t3, .F.find_longest_match._2.while.body.0
  j .F.find_longest_match._15.while.exit.0                              # ir inst 7 fin
.F.find_longest_match._2.while.body.0:
# Phi connections
  li t3, 0
  j .F.find_longest_match._3.while.cond.1                               # ir inst 8 fin
.F.find_longest_match._3.while.cond.1:
  add s11, a1, t3                                                       # ir inst 10 fin
  li t2, 512
  slt s10, s11, t2                                                      # ir inst 11 fin
  bnez s10, .F.find_longest_match._4.lazy.then.0
  j .F.find_longest_match._5.lazy.else.0                                # ir inst 12 fin
.F.find_longest_match._4.lazy.then.0:
  li t2, 18
  slt s11, t3, t2                                                       # ir inst 13 fin
# Phi connections
  j .F.find_longest_match._6.lazy.exit.0                                # ir inst 14 fin
.F.find_longest_match._5.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.find_longest_match._6.lazy.exit.0                                # ir inst 15 fin
.F.find_longest_match._6.lazy.exit.0:
  bnez s11, .F.find_longest_match._7.lazy.then.1
  j .F.find_longest_match._8.lazy.else.1                                # ir inst 17 fin
.F.find_longest_match._7.lazy.then.1:
  add s11, t6, t3                                                       # ir inst 18 fin
  mv s10, s11                                                           # ir inst 19 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 20 fin
  lw s10, 0(s11)                                                        # ir inst 21 fin
  add s11, a1, t3                                                       # ir inst 22 fin
  mv s9, s11                                                            # ir inst 23 fin
  slli t2, s9, 2
  add s11, a0, t2                                                       # ir inst 24 fin
  lw s9, 0(s11)                                                         # ir inst 25 fin
  xor t0, s10, s9
  sltiu s11, t0, 1                                                      # ir inst 26 fin
# Phi connections
  j .F.find_longest_match._9.lazy.exit.1                                # ir inst 27 fin
.F.find_longest_match._8.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.find_longest_match._9.lazy.exit.1                                # ir inst 28 fin
.F.find_longest_match._9.lazy.exit.1:
  bnez s11, .F.find_longest_match._10.while.body.1
  j .F.find_longest_match._11.while.exit.1                              # ir inst 30 fin
.F.find_longest_match._10.while.body.1:
  addi s11, t3, 1                                                       # ir inst 31 fin
# Phi connections
  mv t3, s11
  j .F.find_longest_match._3.while.cond.1                               # ir inst 32 fin
.F.find_longest_match._11.while.exit.1:
  slt s11, t4, t3                                                       # ir inst 33 fin
  bnez s11, .F.find_longest_match._12.if.then.0
  j .F.find_longest_match._13.if.else.0                                 # ir inst 34 fin
.F.find_longest_match._12.if.then.0:
  sub s11, a1, t6                                                       # ir inst 35 fin
# Phi connections
  mv t0, s11
  mv s11, t3
  mv t3, t0
  j .F.find_longest_match._14.if.exit.0                                 # ir inst 36 fin
.F.find_longest_match._13.if.else.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.find_longest_match._14.if.exit.0                                 # ir inst 37 fin
.F.find_longest_match._14.if.exit.0:
  addi s10, t6, -1                                                      # ir inst 40 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.find_longest_match._1.while.cond.0                               # ir inst 41 fin
.F.find_longest_match._15.while.exit.0:
  li t2, 3
  slt t0, t4, t2
  xori t6, t0, 1                                                        # ir inst 42 fin
  bnez t6, .F.find_longest_match._16.if.then.1
  j .F.find_longest_match._17.if.else.1                                 # ir inst 43 fin
.F.find_longest_match._16.if.then.1:
  li t2, 1000
  mul t6, t5, t2                                                        # ir inst 44 fin
  add t5, t6, t4                                                        # ir inst 45 fin
  mv a0, t5
  j .F.find_longest_match.epilogue                                      # ir inst 46 fin
.F.find_longest_match._17.if.else.1:
  j .F.find_longest_match._18.if.exit.1                                 # ir inst 47 fin
.F.find_longest_match._18.if.exit.1:
  li a0, 0
  j .F.find_longest_match.epilogue                                      # ir inst 48 fin
.F.find_longest_match.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl main
main:
# spill func args num: 0,             range:     4160(sp) -     4160(sp)
# local var size: 4096,               range:       64(sp) -     4160(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4160
  add sp, sp, t0
  sd s9, 32(sp)
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
main._0.entry.0:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 512
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
  li t1, 2112
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 512
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
  addi t1, sp, 64
  mv a0, t1
  call .F.generate_input
# ir inst 21 fin
# Phi connections
  li t5, 0
  li t6, 0
  j main._7.while.cond.0                                                # ir inst 22 fin
main._7.while.cond.0:
  li t2, 512
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, main._8.while.body.0
  j main._18.while.exit.0                                               # ir inst 26 fin
main._8.while.body.0:
  li t2, 128
  slt t4, t2, t5                                                        # ir inst 27 fin
  bnez t4, main._9.if.then.0
  j main._10.if.else.0                                                  # ir inst 28 fin
main._9.if.then.0:
  addi t4, t5, -128                                                     # ir inst 29 fin
# Phi connections
  j main._11.if.exit.0                                                  # ir inst 30 fin
main._10.if.else.0:
# Phi connections
  li t4, 0
  j main._11.if.exit.0                                                  # ir inst 31 fin
main._11.if.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  mv a1, t5
  addi t1, sp, 64
  mv a0, t1
  call .F.find_longest_match
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 33 fin
  li t2, 0
  slt t4, t2, t3                                                        # ir inst 34 fin
  bnez t4, main._12.if.then.1
  j main._13.if.else.1                                                  # ir inst 35 fin
main._12.if.then.1:
  li t2, 1000
  div t4, t3, t2                                                        # ir inst 36 fin
  li t2, 1000
  rem s11, t3, t2                                                       # ir inst 37 fin
  mv t3, t6                                                             # ir inst 38 fin
  slli t2, t3, 2
  li t1, 2112
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 39 fin
  li t1, 1
  sw t1, 0(s10)                                                         # ir inst 40 fin
  addi t3, t6, 1                                                        # ir inst 41 fin
  mv s10, t3                                                            # ir inst 42 fin
  slli t2, s10, 2
  li t1, 2112
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 43 fin
  sw t4, 0(s9)                                                          # ir inst 44 fin
  addi t4, t3, 1                                                        # ir inst 45 fin
  mv t3, t4                                                             # ir inst 46 fin
  slli t2, t3, 2
  li t1, 2112
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 47 fin
  sw s11, 0(s10)                                                        # ir inst 48 fin
  addi t3, t4, 1                                                        # ir inst 49 fin
  add t4, t5, s11                                                       # ir inst 50 fin
# Phi connections
  mv t5, t3
  j main._17.if.exit.1                                                  # ir inst 51 fin
main._13.if.else.1:
  mv t4, t5                                                             # ir inst 52 fin
  slli t2, t4, 2
  addi t1, sp, 64
  add t3, t1, t2                                                        # ir inst 53 fin
  lw t4, 0(t3)                                                          # ir inst 54 fin
  li t2, 510
  slt t3, t6, t2                                                        # ir inst 55 fin
  bnez t3, main._14.if.then.2
  j main._15.if.else.2                                                  # ir inst 56 fin
main._14.if.then.2:
  mv t3, t6                                                             # ir inst 57 fin
  slli t2, t3, 2
  li t1, 2112
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 58 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 59 fin
  addi t3, t6, 1                                                        # ir inst 60 fin
# Phi connections
  j main._16.if.exit.2                                                  # ir inst 61 fin
main._15.if.else.2:
# Phi connections
  mv t3, t6
  j main._16.if.exit.2                                                  # ir inst 62 fin
main._16.if.exit.2:
  mv s11, t3                                                            # ir inst 64 fin
  slli t2, s11, 2
  li t1, 2112
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 65 fin
  sw t4, 0(s10)                                                         # ir inst 66 fin
  addi t4, t3, 1                                                        # ir inst 67 fin
  addi t3, t5, 1                                                        # ir inst 68 fin
# Phi connections
  mv t5, t4
  mv t4, t3
  j main._17.if.exit.1                                                  # ir inst 69 fin
main._17.if.exit.1:
# Phi connections
  mv t6, t5
  mv t5, t4
  j main._7.while.cond.0                                                # ir inst 72 fin
main._18.while.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  j main._19.while.cond.1                                               # ir inst 73 fin
main._19.while.cond.1:
  slt t3, t5, t6                                                        # ir inst 76 fin
  bnez t3, main._20.while.body.1
  j main._21.while.exit.1                                               # ir inst 77 fin
main._20.while.body.1:
  mv t3, t5                                                             # ir inst 78 fin
  slli t2, t3, 2
  li t1, 2112
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 79 fin
  lw t3, 0(s11)                                                         # ir inst 80 fin
  addi s11, t5, 1                                                       # ir inst 81 fin
  mul s10, t3, s11                                                      # ir inst 82 fin
  add t3, t4, s10                                                       # ir inst 83 fin
  addi s11, t5, 1                                                       # ir inst 84 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._19.while.cond.1                                               # ir inst 85 fin
main._21.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 86 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 87 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 88 fin
  j main.epilogue                                                       # ir inst 89 fin
main.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  li t0, 4160
  add sp, sp, t0
  ret
