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
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 0,                  range:      136(sp) -      136(sp)
# return addr size: 8,                range:      128(sp) -      136(sp)
# callee save reg num: 9 / 12,        range:       56(sp) -      128(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd s7, 56(sp)
  sd s9, 64(sp)
  sd s10, 72(sp)
  sd s11, 80(sp)
  sd s8, 88(sp)
  sd s1, 96(sp)
  sd s6, 104(sp)
  sd s5, 112(sp)
  sd s0, 120(sp)
  sd ra, 128(sp)
main._0.entry.0:
# Phi connections
  li s7, 0
  li s8, 0
  li s9, 800
  li s10, 0
  li s11, 1000
  li t3, 1500
  li t4, 0
  li t5, 0
  li t6, 0
  j main._1.while.cond.0                                                # ir inst 1 fin
main._1.while.cond.0:
  li t2, 200
  slt s6, t6, t2                                                        # ir inst 11 fin
  bnez s6, main._2.while.body.0
  j main._54.while.exit.0                                               # ir inst 12 fin
main._2.while.body.0:
  li t2, 3
  rem s6, t6, t2                                                        # ir inst 13 fin
  li t2, 7
  mul s5, t6, t2                                                        # ir inst 14 fin
  addi s0, s5, 15                                                       # ir inst 15 fin
  li t2, 50
  rem s5, s0, t2                                                        # ir inst 16 fin
  addi s0, s5, 10                                                       # ir inst 17 fin
  li t2, 0
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 18 fin
  bnez s5, main._3.if.then.0
  j main._4.if.else.0                                                   # ir inst 19 fin
main._3.if.then.0:
  add s5, t4, s0                                                        # ir inst 20 fin
# Phi connections
  mv t4, s5
  j main._8.if.exit.0                                                   # ir inst 21 fin
main._4.if.else.0:
  li t2, 1
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 22 fin
  bnez s5, main._5.if.then.1
  j main._6.if.else.1                                                   # ir inst 23 fin
main._5.if.then.1:
  add s6, s8, s0                                                        # ir inst 24 fin
# Phi connections
  mv s8, s6
  j main._7.if.exit.1                                                   # ir inst 25 fin
main._6.if.else.1:
  add s6, t5, s0                                                        # ir inst 26 fin
# Phi connections
  mv t5, s6
  j main._7.if.exit.1                                                   # ir inst 27 fin
main._7.if.exit.1:
# Phi connections
  j main._8.if.exit.0                                                   # ir inst 30 fin
main._8.if.exit.0:
  li t2, 10
  rem s6, t6, t2                                                        # ir inst 34 fin
  li t2, 0
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 35 fin
  bnez s5, main._9.if.then.2
  j main._10.if.else.2                                                  # ir inst 36 fin
main._9.if.then.2:
  addi s6, s11, 200                                                     # ir inst 37 fin
  addi s5, t3, 300                                                      # ir inst 38 fin
  addi s0, s9, 150                                                      # ir inst 39 fin
# Phi connections
  mv t0, s5
  mv s5, s6
  mv s6, t0
  j main._11.if.exit.2                                                  # ir inst 40 fin
main._10.if.else.2:
# Phi connections
  mv s0, s9
  mv s5, s11
  mv s6, t3
  j main._11.if.exit.2                                                  # ir inst 41 fin
main._11.if.exit.2:
  li t2, 0
  slt s1, t2, t4                                                        # ir inst 45 fin
  bnez s1, main._12.if.then.3
  j main._16.if.else.3                                                  # ir inst 46 fin
main._12.if.then.3:
  slt t0, s5, t4
  xori s1, t0, 1                                                        # ir inst 47 fin
  bnez s1, main._13.if.then.4
  j main._14.if.else.4                                                  # ir inst 48 fin
main._13.if.then.4:
# Phi connections
  li s1, 1
  j main._15.if.exit.4                                                  # ir inst 49 fin
main._14.if.else.4:
# Phi connections
  li s1, 0
  j main._15.if.exit.4                                                  # ir inst 50 fin
main._15.if.exit.4:
# Phi connections
  j main._17.if.exit.3                                                  # ir inst 52 fin
main._16.if.else.3:
# Phi connections
  li s1, 0
  j main._17.if.exit.3                                                  # ir inst 53 fin
main._17.if.exit.3:
  li t2, 0
  slt a0, t2, s8                                                        # ir inst 55 fin
  bnez a0, main._18.if.then.5
  j main._22.if.else.5                                                  # ir inst 56 fin
main._18.if.then.5:
  slt t0, s6, s8
  xori a0, t0, 1                                                        # ir inst 57 fin
  bnez a0, main._19.if.then.6
  j main._20.if.else.6                                                  # ir inst 58 fin
main._19.if.then.6:
# Phi connections
  li a0, 1
  j main._21.if.exit.6                                                  # ir inst 59 fin
main._20.if.else.6:
# Phi connections
  li a0, 0
  j main._21.if.exit.6                                                  # ir inst 60 fin
main._21.if.exit.6:
# Phi connections
  j main._23.if.exit.5                                                  # ir inst 62 fin
main._22.if.else.5:
# Phi connections
  li a0, 0
  j main._23.if.exit.5                                                  # ir inst 63 fin
main._23.if.exit.5:
  li t2, 0
  slt a1, t2, t5                                                        # ir inst 65 fin
  bnez a1, main._24.if.then.7
  j main._28.if.else.7                                                  # ir inst 66 fin
main._24.if.then.7:
  slt t0, s0, t5
  xori a1, t0, 1                                                        # ir inst 67 fin
  bnez a1, main._25.if.then.8
  j main._26.if.else.8                                                  # ir inst 68 fin
main._25.if.then.8:
# Phi connections
  li a1, 1
  j main._27.if.exit.8                                                  # ir inst 69 fin
main._26.if.else.8:
# Phi connections
  li a1, 0
  j main._27.if.exit.8                                                  # ir inst 70 fin
main._27.if.exit.8:
# Phi connections
  j main._29.if.exit.7                                                  # ir inst 72 fin
main._28.if.else.7:
# Phi connections
  li a1, 0
  j main._29.if.exit.7                                                  # ir inst 73 fin
main._29.if.exit.7:
  bnez s1, main._30.if.then.9
  j main._34.if.else.9                                                  # ir inst 75 fin
main._30.if.then.9:
  li t2, 50
  slt s1, t2, t4                                                        # ir inst 76 fin
  bnez s1, main._31.if.then.10
  j main._32.if.else.10                                                 # ir inst 77 fin
main._31.if.then.10:
  li t2, 5
  mul s1, t4, t2                                                        # ir inst 78 fin
# Phi connections
  li a2, 100
  j main._33.if.exit.10                                                 # ir inst 79 fin
main._32.if.else.10:
  li t2, 10
  mul s1, t4, t2                                                        # ir inst 80 fin
# Phi connections
  li a2, 0
  j main._33.if.exit.10                                                 # ir inst 81 fin
main._33.if.exit.10:
  sub a3, s5, t4                                                        # ir inst 84 fin
  add a4, s7, s1                                                        # ir inst 85 fin
  add s1, s10, t4                                                       # ir inst 86 fin
# Phi connections
  mv s5, a3
  li t4, 0
  mv a3, a2
  mv a2, a4
  j main._35.if.exit.9                                                  # ir inst 87 fin
main._34.if.else.9:
# Phi connections
  li a3, 0
  mv a2, s7
  mv s1, s10
  j main._35.if.exit.9                                                  # ir inst 88 fin
main._35.if.exit.9:
  bnez a0, main._36.if.then.11
  j main._40.if.else.11                                                 # ir inst 94 fin
main._36.if.then.11:
  li t2, 40
  slt a0, t2, s8                                                        # ir inst 95 fin
  bnez a0, main._37.if.then.12
  j main._38.if.else.12                                                 # ir inst 96 fin
main._37.if.then.12:
  li t2, 12
  mul a0, s8, t2                                                        # ir inst 97 fin
# Phi connections
  j main._39.if.exit.12                                                 # ir inst 98 fin
main._38.if.else.12:
  li t2, 15
  mul a0, s8, t2                                                        # ir inst 99 fin
# Phi connections
  j main._39.if.exit.12                                                 # ir inst 100 fin
main._39.if.exit.12:
  sub a4, s6, s8                                                        # ir inst 102 fin
  add a5, a2, a0                                                        # ir inst 103 fin
  add a0, s1, s8                                                        # ir inst 104 fin
# Phi connections
  li s1, 0
  mv s6, a0
  mv s8, a4
  mv a0, a5
  j main._41.if.exit.11                                                 # ir inst 105 fin
main._40.if.else.11:
# Phi connections
  mv a0, a2
  mv t0, s1
  mv s1, s8
  mv s8, s6
  mv s6, t0
  j main._41.if.exit.11                                                 # ir inst 106 fin
main._41.if.exit.11:
  bnez a1, main._42.if.then.13
  j main._46.if.else.13                                                 # ir inst 111 fin
main._42.if.then.13:
  li t2, 30
  slt a1, t2, t5                                                        # ir inst 112 fin
  bnez a1, main._43.if.then.14
  j main._44.if.else.14                                                 # ir inst 113 fin
main._43.if.then.14:
  li t2, 18
  mul a1, t5, t2                                                        # ir inst 114 fin
# Phi connections
  j main._45.if.exit.14                                                 # ir inst 115 fin
main._44.if.else.14:
  li t2, 20
  mul a1, t5, t2                                                        # ir inst 116 fin
# Phi connections
  j main._45.if.exit.14                                                 # ir inst 117 fin
main._45.if.exit.14:
  sub a2, s0, t5                                                        # ir inst 119 fin
  add a4, a0, a1                                                        # ir inst 120 fin
  add a1, s6, t5                                                        # ir inst 121 fin
# Phi connections
  mv a0, a4
  mv s0, a2
  mv s6, a1
  li t5, 0
  j main._47.if.exit.13                                                 # ir inst 122 fin
main._46.if.else.13:
# Phi connections
  j main._47.if.exit.13                                                 # ir inst 123 fin
main._47.if.exit.13:
  li t2, 25
  rem a1, t6, t2                                                        # ir inst 128 fin
  li t2, 0
  xor t0, a1, t2
  sltiu a2, t0, 1                                                       # ir inst 129 fin
  bnez a2, main._48.if.then.15
  j main._52.if.else.15                                                 # ir inst 130 fin
main._48.if.then.15:
# Start call preparation
  sd a0, 0(sp)
  sd a3, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, a0
  mv a2, s0
  mv a1, s8
  mv a0, s5
  call .F.perform_audit
  mv a1, a0
  ld a0, 0(sp)
  ld a3, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 131 fin
  li t2, 0
  slt a2, a1, t2                                                        # ir inst 132 fin
  bnez a2, main._49.if.then.16
  j main._50.if.else.16                                                 # ir inst 133 fin
main._49.if.then.16:
  add a1, a0, a3                                                        # ir inst 134 fin
# Phi connections
  j main._51.if.exit.16                                                 # ir inst 135 fin
main._50.if.else.16:
# Phi connections
  mv a1, a0
  j main._51.if.exit.16                                                 # ir inst 136 fin
main._51.if.exit.16:
# Phi connections
  mv a0, a1
  j main._53.if.exit.15                                                 # ir inst 138 fin
main._52.if.else.15:
# Phi connections
  j main._53.if.exit.15                                                 # ir inst 139 fin
main._53.if.exit.15:
  addi a1, t6, 1                                                        # ir inst 141 fin
# Phi connections
  mv s7, a0
  mv s9, s0
  mv s10, s6
  mv s11, s5
  mv t3, s8
  mv t6, a1
  mv s8, s1
  j main._1.while.cond.0                                                # ir inst 142 fin
main._54.while.exit.0:
# Start call preparation
  sd t3, 0(sp)
  mv a0, s7
  call printlnInt
  ld t3, 0(sp)
# ir inst 143 fin
# Start call preparation
  sd t3, 0(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
# ir inst 144 fin
# Start call preparation
  sd t3, 0(sp)
  mv a0, s11
  call printlnInt
  ld t3, 0(sp)
# ir inst 145 fin
# Start call preparation
  sd t3, 0(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
# ir inst 146 fin
# Start call preparation
  mv a0, s9
  call printlnInt
# ir inst 147 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 148 fin
  j main.epilogue                                                       # ir inst 149 fin
main.epilogue:
  ld ra, 128(sp)
  ld s7, 56(sp)
  ld s9, 64(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  ld s8, 88(sp)
  ld s1, 96(sp)
  ld s6, 104(sp)
  ld s5, 112(sp)
  ld s0, 120(sp)
  addi sp, sp, 144
  ret

.globl .F.perform_audit
.F.perform_audit:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.perform_audit._0.entry.0:
  li t2, 100
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.perform_audit._1.if.then.0
  j .F.perform_audit._2.if.else.0                                       # ir inst 2 fin
.F.perform_audit._1.if.then.0:
# Phi connections
  li t6, -10
  j .F.perform_audit._3.if.exit.0                                       # ir inst 3 fin
.F.perform_audit._2.if.else.0:
# Phi connections
  li t6, 5
  j .F.perform_audit._3.if.exit.0                                       # ir inst 4 fin
.F.perform_audit._3.if.exit.0:
  li t2, 150
  slt t5, a1, t2                                                        # ir inst 6 fin
  bnez t5, .F.perform_audit._4.if.then.1
  j .F.perform_audit._5.if.else.1                                       # ir inst 7 fin
.F.perform_audit._4.if.then.1:
  addi t5, t6, -10                                                      # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.perform_audit._6.if.exit.1                                       # ir inst 9 fin
.F.perform_audit._5.if.else.1:
  addi t5, t6, 5                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.perform_audit._6.if.exit.1                                       # ir inst 11 fin
.F.perform_audit._6.if.exit.1:
  li t2, 80
  slt t5, a2, t2                                                        # ir inst 13 fin
  bnez t5, .F.perform_audit._7.if.then.2
  j .F.perform_audit._8.if.else.2                                       # ir inst 14 fin
.F.perform_audit._7.if.then.2:
  addi t5, t6, -10                                                      # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F.perform_audit._9.if.exit.2                                       # ir inst 16 fin
.F.perform_audit._8.if.else.2:
  addi t5, t6, 5                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.perform_audit._9.if.exit.2                                       # ir inst 18 fin
.F.perform_audit._9.if.exit.2:
  li t2, 50000
  slt t5, t2, a3                                                        # ir inst 20 fin
  bnez t5, .F.perform_audit._10.if.then.3
  j .F.perform_audit._11.if.else.3                                      # ir inst 21 fin
.F.perform_audit._10.if.then.3:
  addi t5, t6, 20                                                       # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.perform_audit._15.if.exit.3                                      # ir inst 23 fin
.F.perform_audit._11.if.else.3:
  li t2, 20000
  slt t5, t2, a3                                                        # ir inst 24 fin
  bnez t5, .F.perform_audit._12.if.then.4
  j .F.perform_audit._13.if.else.4                                      # ir inst 25 fin
.F.perform_audit._12.if.then.4:
  addi t5, t6, 10                                                       # ir inst 26 fin
# Phi connections
  mv t6, t5
  j .F.perform_audit._14.if.exit.4                                      # ir inst 27 fin
.F.perform_audit._13.if.else.4:
# Phi connections
  j .F.perform_audit._14.if.exit.4                                      # ir inst 28 fin
.F.perform_audit._14.if.exit.4:
# Phi connections
  j .F.perform_audit._15.if.exit.3                                      # ir inst 30 fin
.F.perform_audit._15.if.exit.3:
# Phi connections
  mv t4, a3
  li t5, 0
  j .F.perform_audit._16.while.cond.0                                   # ir inst 32 fin
.F.perform_audit._16.while.cond.0:
  li t2, 5
  slt t3, t5, t2                                                        # ir inst 35 fin
  bnez t3, .F.perform_audit._17.while.body.0
  j .F.perform_audit._18.while.exit.0                                   # ir inst 36 fin
.F.perform_audit._17.while.body.0:
  addi t3, t5, 1                                                        # ir inst 37 fin
  div s11, t4, t3                                                       # ir inst 38 fin
  addi t3, t5, 1                                                        # ir inst 39 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.perform_audit._16.while.cond.0                                   # ir inst 40 fin
.F.perform_audit._18.while.exit.0:
  li t2, 10
  rem t5, t4, t2                                                        # ir inst 41 fin
  add t4, t6, t5                                                        # ir inst 42 fin
  li t2, 15
  slt t6, t2, t4                                                        # ir inst 43 fin
  bnez t6, .F.perform_audit._19.if.then.5
  j .F.perform_audit._20.if.else.5                                      # ir inst 44 fin
.F.perform_audit._19.if.then.5:
# Phi connections
  li t6, 1
  j .F.perform_audit._24.if.exit.5                                      # ir inst 45 fin
.F.perform_audit._20.if.else.5:
  li t2, 0
  slt t6, t2, t4                                                        # ir inst 46 fin
  bnez t6, .F.perform_audit._21.if.then.6
  j .F.perform_audit._22.if.else.6                                      # ir inst 47 fin
.F.perform_audit._21.if.then.6:
# Phi connections
  li t6, 0
  j .F.perform_audit._23.if.exit.6                                      # ir inst 48 fin
.F.perform_audit._22.if.else.6:
# Phi connections
  li t6, -1
  j .F.perform_audit._23.if.exit.6                                      # ir inst 49 fin
.F.perform_audit._23.if.exit.6:
# Phi connections
  j .F.perform_audit._24.if.exit.5                                      # ir inst 51 fin
.F.perform_audit._24.if.exit.5:
  mv a0, t6
  j .F.perform_audit.epilogue                                           # ir inst 53 fin
.F.perform_audit.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.another_level_of_processing
.F.another_level_of_processing:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.another_level_of_processing._0.entry.0:
# Phi connections
  li t5, 0
  mv t6, a0
  j .F.another_level_of_processing._1.while.cond.0                      # ir inst 1 fin
.F.another_level_of_processing._1.while.cond.0:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.another_level_of_processing._2.while.body.0
  j .F.another_level_of_processing._9.while.exit.0                      # ir inst 5 fin
.F.another_level_of_processing._2.while.body.0:
  li t2, 2
  rem t4, t5, t2                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.another_level_of_processing._3.if.then.0
  j .F.another_level_of_processing._4.if.else.0                         # ir inst 8 fin
.F.another_level_of_processing._3.if.then.0:
  mul t4, a1, t5                                                        # ir inst 9 fin
  add t3, t6, t4                                                        # ir inst 10 fin
# Phi connections
  mv t4, t3
  j .F.another_level_of_processing._5.if.exit.0                         # ir inst 11 fin
.F.another_level_of_processing._4.if.else.0:
  mul t4, a1, t5                                                        # ir inst 12 fin
  li t2, 2
  div t3, t4, t2                                                        # ir inst 13 fin
  sub t4, t6, t3                                                        # ir inst 14 fin
# Phi connections
  j .F.another_level_of_processing._5.if.exit.0                         # ir inst 15 fin
.F.another_level_of_processing._5.if.exit.0:
# Phi connections
  li t3, 0
  j .F.another_level_of_processing._6.while.cond.1                      # ir inst 17 fin
.F.another_level_of_processing._6.while.cond.1:
  li t2, 5
  slt s11, t3, t2                                                       # ir inst 20 fin
  bnez s11, .F.another_level_of_processing._7.while.body.1
  j .F.another_level_of_processing._8.while.exit.1                      # ir inst 21 fin
.F.another_level_of_processing._7.while.body.1:
  add s11, t4, t3                                                       # ir inst 22 fin
  addi s10, t3, 1                                                       # ir inst 23 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.another_level_of_processing._6.while.cond.1                      # ir inst 24 fin
.F.another_level_of_processing._8.while.exit.1:
  addi t3, t5, 1                                                        # ir inst 25 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.another_level_of_processing._1.while.cond.0                      # ir inst 26 fin
.F.another_level_of_processing._9.while.exit.0:
  mv a0, t6
  j .F.another_level_of_processing.epilogue                             # ir inst 27 fin
.F.another_level_of_processing.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.yet_another_function
.F.yet_another_function:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.yet_another_function._0.entry.0:
  slt t6, a1, a0                                                        # ir inst 1 fin
  bnez t6, .F.yet_another_function._1.if.then.0
  j .F.yet_another_function._2.if.else.0                                # ir inst 2 fin
.F.yet_another_function._1.if.then.0:
  sub t6, a0, a1                                                        # ir inst 3 fin
# Phi connections
  j .F.yet_another_function._3.if.exit.0                                # ir inst 4 fin
.F.yet_another_function._2.if.else.0:
  sub t6, a1, a0                                                        # ir inst 5 fin
# Phi connections
  j .F.yet_another_function._3.if.exit.0                                # ir inst 6 fin
.F.yet_another_function._3.if.exit.0:
# Phi connections
  li t5, 0
  j .F.yet_another_function._4.while.cond.0                             # ir inst 8 fin
.F.yet_another_function._4.while.cond.0:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 11 fin
  bnez t4, .F.yet_another_function._5.while.body.0
  j .F.yet_another_function._6.while.exit.0                             # ir inst 12 fin
.F.yet_another_function._5.while.body.0:
  addi t4, t5, 1                                                        # ir inst 13 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  mv a0, t6
  call .F.another_level_of_processing
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 14 fin
  addi t4, t5, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.yet_another_function._4.while.cond.0                             # ir inst 16 fin
.F.yet_another_function._6.while.exit.0:
  li t2, 1000
  slt t5, t2, t6                                                        # ir inst 17 fin
  bnez t5, .F.yet_another_function._7.if.then.1
  j .F.yet_another_function._8.if.else.1                                # ir inst 18 fin
.F.yet_another_function._7.if.then.1:
  li a0, 1000
  j .F.yet_another_function.epilogue                                    # ir inst 19 fin
.F.yet_another_function._8.if.else.1:
  j .F.yet_another_function._9.if.exit.1                                # ir inst 20 fin
.F.yet_another_function._9.if.exit.1:
  mv a0, t6
  j .F.yet_another_function.epilogue                                    # ir inst 21 fin
.F.yet_another_function.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.process_complex_data
.F.process_complex_data:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.process_complex_data._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.yet_another_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a0, a1
  mv a1, a2
  call .F.yet_another_function
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, a2
  call .F.yet_another_function
  mv t4, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 3 fin
  add t3, t6, t5                                                        # ir inst 4 fin
  add t6, t3, t4                                                        # ir inst 5 fin
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.process_complex_data._1.while.cond.0                             # ir inst 6 fin
.F.process_complex_data._1.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 9 fin
  bnez t4, .F.process_complex_data._2.while.body.0
  j .F.process_complex_data._3.while.exit.0                             # ir inst 10 fin
.F.process_complex_data._2.while.body.0:
  mul t4, t6, t6                                                        # ir inst 11 fin
  sub t3, t5, t4                                                        # ir inst 12 fin
  addi t4, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.process_complex_data._1.while.cond.0                             # ir inst 14 fin
.F.process_complex_data._3.while.exit.0:
  mv a0, t5
  j .F.process_complex_data.epilogue                                    # ir inst 15 fin
.F.process_complex_data.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.simulate_external_factors
.F.simulate_external_factors:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulate_external_factors._0.entry.0:
  li t2, 5
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.simulate_external_factors._1.if.then.0
  j .F.simulate_external_factors._2.if.else.0                           # ir inst 3 fin
.F.simulate_external_factors._1.if.then.0:
# Phi connections
  li t6, -500
  j .F.simulate_external_factors._12.if.exit.0                          # ir inst 4 fin
.F.simulate_external_factors._2.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 5 fin
  bnez t5, .F.simulate_external_factors._3.if.then.1
  j .F.simulate_external_factors._4.if.else.1                           # ir inst 6 fin
.F.simulate_external_factors._3.if.then.1:
# Phi connections
  li t6, 200
  j .F.simulate_external_factors._11.if.exit.1                          # ir inst 7 fin
.F.simulate_external_factors._4.if.else.1:
  li t2, 2
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.simulate_external_factors._5.if.then.2
  j .F.simulate_external_factors._6.if.else.2                           # ir inst 9 fin
.F.simulate_external_factors._5.if.then.2:
# Phi connections
  li t6, 0
  j .F.simulate_external_factors._10.if.exit.2                          # ir inst 10 fin
.F.simulate_external_factors._6.if.else.2:
  li t2, 3
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 11 fin
  bnez t5, .F.simulate_external_factors._7.if.then.3
  j .F.simulate_external_factors._8.if.else.3                           # ir inst 12 fin
.F.simulate_external_factors._7.if.then.3:
# Phi connections
  li t6, 1000
  j .F.simulate_external_factors._9.if.exit.3                           # ir inst 13 fin
.F.simulate_external_factors._8.if.else.3:
# Phi connections
  li t6, -100
  j .F.simulate_external_factors._9.if.exit.3                           # ir inst 14 fin
.F.simulate_external_factors._9.if.exit.3:
# Phi connections
  j .F.simulate_external_factors._10.if.exit.2                          # ir inst 16 fin
.F.simulate_external_factors._10.if.exit.2:
# Phi connections
  j .F.simulate_external_factors._11.if.exit.1                          # ir inst 18 fin
.F.simulate_external_factors._11.if.exit.1:
# Phi connections
  j .F.simulate_external_factors._12.if.exit.0                          # ir inst 20 fin
.F.simulate_external_factors._12.if.exit.0:
  mv a0, t6
  j .F.simulate_external_factors.epilogue                               # ir inst 22 fin
.F.simulate_external_factors.epilogue:
  ret

.globl .F.final_check
.F.final_check:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.final_check._0.entry.0:
  li t2, 500
  slt t6, t2, a0                                                        # ir inst 1 fin
  bnez t6, .F.final_check._1.if.then.0
  j .F.final_check._2.if.else.0                                         # ir inst 2 fin
.F.final_check._1.if.then.0:
# Phi connections
  li t6, 1
  j .F.final_check._3.if.exit.0                                         # ir inst 3 fin
.F.final_check._2.if.else.0:
# Phi connections
  li t6, 0
  j .F.final_check._3.if.exit.0                                         # ir inst 4 fin
.F.final_check._3.if.exit.0:
  li t2, 800
  slt t5, t2, a1                                                        # ir inst 6 fin
  bnez t5, .F.final_check._4.if.then.1
  j .F.final_check._5.if.else.1                                         # ir inst 7 fin
.F.final_check._4.if.then.1:
  addi t5, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.final_check._6.if.exit.1                                         # ir inst 9 fin
.F.final_check._5.if.else.1:
# Phi connections
  j .F.final_check._6.if.exit.1                                         # ir inst 10 fin
.F.final_check._6.if.exit.1:
  li t2, 400
  slt t5, t2, a2                                                        # ir inst 12 fin
  bnez t5, .F.final_check._7.if.then.2
  j .F.final_check._8.if.else.2                                         # ir inst 13 fin
.F.final_check._7.if.then.2:
  addi t5, t6, 1                                                        # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.final_check._9.if.exit.2                                         # ir inst 15 fin
.F.final_check._8.if.else.2:
# Phi connections
  j .F.final_check._9.if.exit.2                                         # ir inst 16 fin
.F.final_check._9.if.exit.2:
  li t2, 100000
  slt t5, t2, a3                                                        # ir inst 18 fin
  bnez t5, .F.final_check._10.if.then.3
  j .F.final_check._11.if.else.3                                        # ir inst 19 fin
.F.final_check._10.if.then.3:
  addi t5, t6, 2                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.final_check._12.if.exit.3                                        # ir inst 21 fin
.F.final_check._11.if.else.3:
# Phi connections
  j .F.final_check._12.if.exit.3                                        # ir inst 22 fin
.F.final_check._12.if.exit.3:
  mv a0, t6
  j .F.final_check.epilogue                                             # ir inst 24 fin
.F.final_check.epilogue:
  ret
