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

.globl .F.setup_fsm
.F.setup_fsm:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.setup_fsm._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
  li t1, 1
  sd t1, 0(t5)                                                          # ir inst 3 fin
  addi t6, a0, 0                                                        # ir inst 4 fin
  addi t5, t6, 8                                                        # ir inst 5 fin
  li t1, 2
  sd t1, 0(t5)                                                          # ir inst 6 fin
  addi t6, a0, 0                                                        # ir inst 7 fin
  addi t5, t6, 16                                                       # ir inst 8 fin
  li t1, 0
  sd t1, 0(t5)                                                          # ir inst 9 fin
  addi t6, a1, 0                                                        # ir inst 10 fin
  addi t5, t6, 0                                                        # ir inst 11 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 12 fin
  addi t6, a1, 0                                                        # ir inst 13 fin
  addi t5, t6, 4                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 15 fin
  addi t6, a1, 0                                                        # ir inst 16 fin
  addi t5, t6, 8                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 18 fin
  addi t6, a0, 24                                                       # ir inst 19 fin
  addi t5, t6, 0                                                        # ir inst 20 fin
  li t1, 3
  sd t1, 0(t5)                                                          # ir inst 21 fin
  addi t6, a0, 24                                                       # ir inst 22 fin
  addi t5, t6, 8                                                        # ir inst 23 fin
  li t1, 4
  sd t1, 0(t5)                                                          # ir inst 24 fin
  addi t6, a0, 24                                                       # ir inst 25 fin
  addi t5, t6, 16                                                       # ir inst 26 fin
  li t1, 0
  sd t1, 0(t5)                                                          # ir inst 27 fin
  addi t6, a1, 12                                                       # ir inst 28 fin
  addi t5, t6, 0                                                        # ir inst 29 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 30 fin
  addi t6, a1, 12                                                       # ir inst 31 fin
  addi t5, t6, 4                                                        # ir inst 32 fin
  li t1, 3
  sw t1, 0(t5)                                                          # ir inst 33 fin
  addi t6, a1, 12                                                       # ir inst 34 fin
  addi t5, t6, 8                                                        # ir inst 35 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 36 fin
  addi t6, a0, 48                                                       # ir inst 37 fin
  addi t5, t6, 0                                                        # ir inst 38 fin
  li t1, 5
  sd t1, 0(t5)                                                          # ir inst 39 fin
  addi t6, a0, 48                                                       # ir inst 40 fin
  addi t5, t6, 8                                                        # ir inst 41 fin
  li t1, 6
  sd t1, 0(t5)                                                          # ir inst 42 fin
  addi t6, a0, 48                                                       # ir inst 43 fin
  addi t5, t6, 16                                                       # ir inst 44 fin
  li t1, 1
  sd t1, 0(t5)                                                          # ir inst 45 fin
  addi t6, a1, 24                                                       # ir inst 46 fin
  addi t5, t6, 0                                                        # ir inst 47 fin
  li t1, 5
  sw t1, 0(t5)                                                          # ir inst 48 fin
  addi t6, a1, 24                                                       # ir inst 49 fin
  addi t5, t6, 4                                                        # ir inst 50 fin
  li t1, 8
  sw t1, 0(t5)                                                          # ir inst 51 fin
  addi t6, a1, 24                                                       # ir inst 52 fin
  addi t5, t6, 8                                                        # ir inst 53 fin
  li t1, 13
  sw t1, 0(t5)                                                          # ir inst 54 fin
  addi t6, a0, 72                                                       # ir inst 55 fin
  addi t5, t6, 0                                                        # ir inst 56 fin
  li t1, 7
  sd t1, 0(t5)                                                          # ir inst 57 fin
  addi t6, a0, 72                                                       # ir inst 58 fin
  addi t5, t6, 8                                                        # ir inst 59 fin
  li t1, 0
  sd t1, 0(t5)                                                          # ir inst 60 fin
  addi t6, a0, 72                                                       # ir inst 61 fin
  addi t5, t6, 16                                                       # ir inst 62 fin
  li t1, 1
  sd t1, 0(t5)                                                          # ir inst 63 fin
  addi t6, a1, 36                                                       # ir inst 64 fin
  addi t5, t6, 0                                                        # ir inst 65 fin
  li t1, 21
  sw t1, 0(t5)                                                          # ir inst 66 fin
  addi t6, a1, 36                                                       # ir inst 67 fin
  addi t5, t6, 4                                                        # ir inst 68 fin
  li t1, 34
  sw t1, 0(t5)                                                          # ir inst 69 fin
  addi t6, a1, 36                                                       # ir inst 70 fin
  addi t5, t6, 8                                                        # ir inst 71 fin
  li t1, 55
  sw t1, 0(t5)                                                          # ir inst 72 fin
  addi t6, a0, 96                                                       # ir inst 73 fin
  addi t5, t6, 0                                                        # ir inst 74 fin
  li t1, 2
  sd t1, 0(t5)                                                          # ir inst 75 fin
  addi t6, a0, 96                                                       # ir inst 76 fin
  addi t5, t6, 8                                                        # ir inst 77 fin
  li t1, 5
  sd t1, 0(t5)                                                          # ir inst 78 fin
  addi t6, a0, 96                                                       # ir inst 79 fin
  addi t5, t6, 16                                                       # ir inst 80 fin
  li t1, 4
  sd t1, 0(t5)                                                          # ir inst 81 fin
  addi t6, a1, 48                                                       # ir inst 82 fin
  addi t5, t6, 0                                                        # ir inst 83 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 84 fin
  addi t6, a1, 48                                                       # ir inst 85 fin
  addi t5, t6, 4                                                        # ir inst 86 fin
  li t1, -2
  sw t1, 0(t5)                                                          # ir inst 87 fin
  addi t6, a1, 48                                                       # ir inst 88 fin
  addi t5, t6, 8                                                        # ir inst 89 fin
  li t1, -3
  sw t1, 0(t5)                                                          # ir inst 90 fin
  addi t6, a0, 120                                                      # ir inst 91 fin
  addi t5, t6, 0                                                        # ir inst 92 fin
  li t1, 6
  sd t1, 0(t5)                                                          # ir inst 93 fin
  addi t6, a0, 120                                                      # ir inst 94 fin
  addi t5, t6, 8                                                        # ir inst 95 fin
  li t1, 7
  sd t1, 0(t5)                                                          # ir inst 96 fin
  addi t6, a0, 120                                                      # ir inst 97 fin
  addi t5, t6, 16                                                       # ir inst 98 fin
  li t1, 3
  sd t1, 0(t5)                                                          # ir inst 99 fin
  addi t6, a1, 60                                                       # ir inst 100 fin
  addi t5, t6, 0                                                        # ir inst 101 fin
  li t1, 10
  sw t1, 0(t5)                                                          # ir inst 102 fin
  addi t6, a1, 60                                                       # ir inst 103 fin
  addi t5, t6, 4                                                        # ir inst 104 fin
  li t1, 20
  sw t1, 0(t5)                                                          # ir inst 105 fin
  addi t6, a1, 60                                                       # ir inst 106 fin
  addi t5, t6, 8                                                        # ir inst 107 fin
  li t1, 30
  sw t1, 0(t5)                                                          # ir inst 108 fin
  addi t6, a0, 144                                                      # ir inst 109 fin
  addi t5, t6, 0                                                        # ir inst 110 fin
  li t1, 0
  sd t1, 0(t5)                                                          # ir inst 111 fin
  addi t6, a0, 144                                                      # ir inst 112 fin
  addi t5, t6, 8                                                        # ir inst 113 fin
  li t1, 1
  sd t1, 0(t5)                                                          # ir inst 114 fin
  addi t6, a0, 144                                                      # ir inst 115 fin
  addi t5, t6, 16                                                       # ir inst 116 fin
  li t1, 2
  sd t1, 0(t5)                                                          # ir inst 117 fin
  addi t6, a1, 72                                                       # ir inst 118 fin
  addi t5, t6, 0                                                        # ir inst 119 fin
  li t1, 40
  sw t1, 0(t5)                                                          # ir inst 120 fin
  addi t6, a1, 72                                                       # ir inst 121 fin
  addi t5, t6, 4                                                        # ir inst 122 fin
  li t1, 50
  sw t1, 0(t5)                                                          # ir inst 123 fin
  addi t6, a1, 72                                                       # ir inst 124 fin
  addi t5, t6, 8                                                        # ir inst 125 fin
  li t1, 60
  sw t1, 0(t5)                                                          # ir inst 126 fin
  addi t6, a0, 168                                                      # ir inst 127 fin
  addi t5, t6, 0                                                        # ir inst 128 fin
  li t1, 4
  sd t1, 0(t5)                                                          # ir inst 129 fin
  addi t6, a0, 168                                                      # ir inst 130 fin
  addi t5, t6, 8                                                        # ir inst 131 fin
  li t1, 3
  sd t1, 0(t5)                                                          # ir inst 132 fin
  addi t6, a0, 168                                                      # ir inst 133 fin
  addi t5, t6, 16                                                       # ir inst 134 fin
  li t1, 5
  sd t1, 0(t5)                                                          # ir inst 135 fin
  addi t6, a1, 84                                                       # ir inst 136 fin
  addi t5, t6, 0                                                        # ir inst 137 fin
  li t1, 70
  sw t1, 0(t5)                                                          # ir inst 138 fin
  addi t6, a1, 84                                                       # ir inst 139 fin
  addi t5, t6, 4                                                        # ir inst 140 fin
  li t1, 80
  sw t1, 0(t5)                                                          # ir inst 141 fin
  addi t6, a1, 84                                                       # ir inst 142 fin
  addi t5, t6, 8                                                        # ir inst 143 fin
  li t1, 90
  sw t1, 0(t5)                                                          # ir inst 144 fin
  j .F.setup_fsm.epilogue                                               # ir inst 145 fin
.F.setup_fsm.epilogue:
  ret

.globl .F.run_fsm
.F.run_fsm:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 0,                range:       48(sp) -       48(sp)
# callee save reg num: 6 / 12,        range:        0(sp) -       48(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s10, 0(sp)
  sd s9, 8(sp)
  sd s8, 16(sp)
  sd s7, 24(sp)
  sd s6, 32(sp)
  sd s11, 40(sp)
.F.run_fsm._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.run_fsm._1.while.cond.0                                          # ir inst 1 fin
.F.run_fsm._1.while.cond.0:
  sltu t3, t4, a3                                                       # ir inst 5 fin
  bnez t3, .F.run_fsm._2.while.body.0
  j .F.run_fsm._24.while.exit.0                                         # ir inst 6 fin
.F.run_fsm._2.while.body.0:
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 7 fin
  lw s11, 0(t3)                                                         # ir inst 8 fin
  li t2, 0
  slt t0, s11, t2
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.run_fsm._3.if.then.0
  j .F.run_fsm._22.if.else.0                                            # ir inst 10 fin
.F.run_fsm._3.if.then.0:
  li t2, 3
  slt t3, s11, t2                                                       # ir inst 11 fin
  bnez t3, .F.run_fsm._4.if.then.1
  j .F.run_fsm._20.if.else.1                                            # ir inst 12 fin
.F.run_fsm._4.if.then.1:
  li t1, 12
  mul t2, t6, t1
  add t3, a1, t2                                                        # ir inst 13 fin
  mv s10, s11                                                           # ir inst 14 fin
  slli t2, s10, 2
  add s9, t3, t2                                                        # ir inst 15 fin
  lw t3, 0(s9)                                                          # ir inst 16 fin
  li t1, 24
  mul t2, t6, t1
  add s10, a0, t2                                                       # ir inst 17 fin
  mv s9, s11                                                            # ir inst 18 fin
  slli t2, s9, 3
  add s11, s10, t2                                                      # ir inst 19 fin
  ld s10, 0(s11)                                                        # ir inst 20 fin
  li t2, 0
  slt s11, t2, t3                                                       # ir inst 21 fin
  bnez s11, .F.run_fsm._5.if.then.2
  j .F.run_fsm._9.if.else.2                                             # ir inst 22 fin
.F.run_fsm._5.if.then.2:
  li t2, 2
  remu s11, t6, t2                                                      # ir inst 23 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s9, t0, 1                                                       # ir inst 24 fin
  bnez s9, .F.run_fsm._6.if.then.3
  j .F.run_fsm._7.if.else.3                                             # ir inst 25 fin
.F.run_fsm._6.if.then.3:
  slli s11, t3, 1                                                       # ir inst 26 fin
  add s9, t5, s11                                                       # ir inst 27 fin
# Phi connections
  mv s11, s9
  j .F.run_fsm._8.if.exit.3                                             # ir inst 28 fin
.F.run_fsm._7.if.else.3:
  add s11, t5, t3                                                       # ir inst 29 fin
# Phi connections
  j .F.run_fsm._8.if.exit.3                                             # ir inst 30 fin
.F.run_fsm._8.if.exit.3:
# Phi connections
  j .F.run_fsm._13.if.exit.2                                            # ir inst 32 fin
.F.run_fsm._9.if.else.2:
  li t2, 100
  slt s11, t2, t5                                                       # ir inst 33 fin
  bnez s11, .F.run_fsm._10.if.then.4
  j .F.run_fsm._11.if.else.4                                            # ir inst 34 fin
.F.run_fsm._10.if.then.4:
  add s11, t5, t3                                                       # ir inst 35 fin
# Phi connections
  j .F.run_fsm._12.if.exit.4                                            # ir inst 36 fin
.F.run_fsm._11.if.else.4:
  sub s11, t5, t3                                                       # ir inst 37 fin
# Phi connections
  j .F.run_fsm._12.if.exit.4                                            # ir inst 38 fin
.F.run_fsm._12.if.exit.4:
# Phi connections
  j .F.run_fsm._13.if.exit.2                                            # ir inst 40 fin
.F.run_fsm._13.if.exit.2:
# Phi connections
  li s8, 0
  li s9, 0
  j .F.run_fsm._14.while.cond.1                                         # ir inst 42 fin
.F.run_fsm._14.while.cond.1:
  li t2, 10
  rem s7, t3, t2                                                        # ir inst 45 fin
  slt s6, s8, s7                                                        # ir inst 46 fin
  bnez s6, .F.run_fsm._15.while.body.1
  j .F.run_fsm._19.while.exit.1                                         # ir inst 47 fin
.F.run_fsm._15.while.body.1:
  li t2, 2
  rem s7, s8, t2                                                        # ir inst 48 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 49 fin
  bnez s6, .F.run_fsm._16.if.then.5
  j .F.run_fsm._17.if.else.5                                            # ir inst 50 fin
.F.run_fsm._16.if.then.5:
  add s7, s9, s8                                                        # ir inst 51 fin
# Phi connections
  j .F.run_fsm._18.if.exit.5                                            # ir inst 52 fin
.F.run_fsm._17.if.else.5:
  sub s7, s9, s8                                                        # ir inst 53 fin
# Phi connections
  j .F.run_fsm._18.if.exit.5                                            # ir inst 54 fin
.F.run_fsm._18.if.exit.5:
  addi s6, s8, 1                                                        # ir inst 56 fin
# Phi connections
  mv s8, s6
  mv s9, s7
  j .F.run_fsm._14.while.cond.1                                         # ir inst 57 fin
.F.run_fsm._19.while.exit.1:
  add t3, s11, s9                                                       # ir inst 58 fin
# Phi connections
  mv s11, t3
  mv t3, s10
  j .F.run_fsm._21.if.exit.1                                            # ir inst 59 fin
.F.run_fsm._20.if.else.1:
# Phi connections
  mv s11, t5
  mv t3, t6
  j .F.run_fsm._21.if.exit.1                                            # ir inst 60 fin
.F.run_fsm._21.if.exit.1:
# Phi connections
  mv t6, t3
  mv t3, s11
  j .F.run_fsm._23.if.exit.0                                            # ir inst 63 fin
.F.run_fsm._22.if.else.0:
# Phi connections
  mv t3, t5
  j .F.run_fsm._23.if.exit.0                                            # ir inst 64 fin
.F.run_fsm._23.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 67 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.run_fsm._1.while.cond.0                                          # ir inst 68 fin
.F.run_fsm._24.while.exit.0:
  mv a0, t5
  j .F.run_fsm.epilogue                                                 # ir inst 69 fin
.F.run_fsm.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s8, 16(sp)
  ld s7, 24(sp)
  ld s6, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.generate_inputs
.F.generate_inputs:
# spill func args num: 0,             range:      448(sp) -      448(sp)
# local var size: 400,                range:       48(sp) -      448(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -448
  sd ra, 40(sp)
.F.generate_inputs._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.generate_inputs._1.array.cond.0                                  # ir inst 3 fin
.F.generate_inputs._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.generate_inputs._2.array.body.0
  j .F.generate_inputs._3.array.exit.0                                  # ir inst 6 fin
.F.generate_inputs._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.generate_inputs._1.array.cond.0                                  # ir inst 10 fin
.F.generate_inputs._3.array.exit.0:
# Phi connections
  li t5, 0
  mv t6, a1
  j .F.generate_inputs._4.while.cond.0                                  # ir inst 11 fin
.F.generate_inputs._4.while.cond.0:
  slt t4, t5, a2                                                        # ir inst 14 fin
  bnez t4, .F.generate_inputs._5.while.body.0
  j .F.generate_inputs._6.while.exit.0                                  # ir inst 15 fin
.F.generate_inputs._5.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.pm_rand_update
  mv t4, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 16 fin
  li t2, 65536
  div t6, t4, t2                                                        # ir inst 17 fin
  mv t4, t5                                                             # ir inst 18 fin
  slli t2, t4, 2
  addi t1, sp, 48
  add t3, t1, t2                                                        # ir inst 19 fin
  li t2, 3
  rem t4, t6, t2                                                        # ir inst 20 fin
  sw t4, 0(t3)                                                          # ir inst 21 fin
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  j .F.generate_inputs._4.while.cond.0                                  # ir inst 23 fin
.F.generate_inputs._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 400
  addi t1, sp, 48
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 24 fin
  j .F.generate_inputs.epilogue                                         # ir inst 25 fin
.F.generate_inputs.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 448
  ret

.globl main
main:
# spill func args num: 0,             range:     2800(sp) -     2800(sp)
# local var size: 2724,               range:       64(sp) -     2788(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 4 / 12,        range:       24(sp) -       56(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -2800
  add sp, sp, t0
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s8, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
main._0.entry.0:
  addi t1, sp, 1456
  addi t6, t1, 0                                                        # ir inst 6 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 7 fin
main._1.array.cond.0:
  li t2, 3
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 10 fin
main._2.array.body.0:
  slli t2, t5, 3
  add t4, t6, t2                                                        # ir inst 11 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  j main._1.array.cond.0                                                # ir inst 14 fin
main._3.array.exit.0:
  addi t1, sp, 1264
  addi t6, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 16 fin
main._4.array.cond.1:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 18 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 19 fin
main._5.array.body.1:
  li t1, 24
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 20 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 24
  addi t1, sp, 1456
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 21 fin
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 23 fin
main._6.array.exit.1:
  addi t1, sp, 1576
  addi t6, t1, 0                                                        # ir inst 26 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 27 fin
main._7.array.cond.2:
  li t2, 3
  slt t4, t5, t2                                                        # ir inst 29 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 30 fin
main._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 31 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 32 fin
  addi t4, t5, 1                                                        # ir inst 33 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 34 fin
main._9.array.exit.2:
  addi t1, sp, 1480
  addi t6, t1, 0                                                        # ir inst 35 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 36 fin
main._10.array.cond.3:
  li t2, 8
  slt t4, t5, t2                                                        # ir inst 38 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 39 fin
main._11.array.body.3:
  li t1, 12
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 40 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 12
  addi t1, sp, 1576
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 41 fin
  addi t4, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 43 fin
main._12.array.exit.3:
# Start call preparation
  addi t1, sp, 1480
  mv a1, t1
  addi t1, sp, 1264
  mv a0, t1
  call .F.setup_fsm
# ir inst 44 fin
# Start call preparation
  li a2, 100
  li a1, 42
  addi t1, sp, 1588
  mv a0, t1
  call .F.generate_inputs
# ir inst 46 fin
# Start call preparation
  li a2, 400
  addi t1, sp, 1588
  mv a1, t1
  addi t1, sp, 64
  mv a0, t1
  call memcpy
# ir inst 47 fin
# Start call preparation
  li a3, 100
  addi t1, sp, 64
  mv a2, t1
  addi t1, sp, 1480
  mv a1, t1
  addi t1, sp, 1264
  mv a0, t1
  call .F.run_fsm
  mv t6, a0
# ir inst 48 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 49 fin
# Start call preparation
  li a2, 80
  li a1, 1337
  addi t1, sp, 1988
  mv a0, t1
  call .F.generate_inputs
# ir inst 51 fin
# Start call preparation
  li a2, 400
  addi t1, sp, 1988
  mv a1, t1
  addi t1, sp, 464
  mv a0, t1
  call memcpy
# ir inst 52 fin
# Start call preparation
  li a3, 80
  addi t1, sp, 464
  mv a2, t1
  addi t1, sp, 1480
  mv a1, t1
  addi t1, sp, 1264
  mv a0, t1
  call .F.run_fsm
  mv t6, a0
# ir inst 53 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 54 fin
  li t1, 2388
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 56 fin
# Phi connections
  li t5, 0
  j main._13.array.cond.4                                               # ir inst 57 fin
main._13.array.cond.4:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 59 fin
  bnez t4, main._14.array.body.4
  j main._15.array.exit.4                                               # ir inst 60 fin
main._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 62 fin
  addi t4, t5, 1                                                        # ir inst 63 fin
# Phi connections
  mv t5, t4
  j main._13.array.cond.4                                               # ir inst 64 fin
main._15.array.exit.4:
# Phi connections
  li t6, 0
  j main._16.while.cond.0                                               # ir inst 65 fin
main._16.while.cond.0:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 67 fin
  bnez t5, main._17.while.body.0
  j main._18.while.exit.0                                               # ir inst 68 fin
main._17.while.body.0:
  mv t5, t6                                                             # ir inst 69 fin
  slli t2, t5, 2
  li t1, 2388
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 70 fin
  mul t5, t6, t6                                                        # ir inst 71 fin
  li t2, 3
  rem t3, t5, t2                                                        # ir inst 72 fin
  sw t3, 0(t4)                                                          # ir inst 73 fin
  addi t5, t6, 1                                                        # ir inst 74 fin
# Phi connections
  mv t6, t5
  j main._16.while.cond.0                                               # ir inst 75 fin
main._18.while.exit.0:
# Start call preparation
  li a2, 400
  li t1, 2388
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 864
  mv a0, t1
  call memcpy
# ir inst 76 fin
# Start call preparation
  li a3, 50
  addi t1, sp, 864
  mv a2, t1
  addi t1, sp, 1480
  mv a1, t1
  addi t1, sp, 1264
  mv a0, t1
  call .F.run_fsm
  mv t6, a0
# ir inst 77 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 78 fin
# Phi connections
  li t5, 0
  li t6, 0
  j main._19.while.cond.1                                               # ir inst 79 fin
main._19.while.cond.1:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 82 fin
  bnez t4, main._20.while.body.1
  j main._33.while.exit.1                                               # ir inst 83 fin
main._20.while.body.1:
# Phi connections
  mv t3, t5
  li t4, 0
  j main._21.while.cond.2                                               # ir inst 84 fin
main._21.while.cond.2:
  li t2, 10
  slt s11, t4, t2                                                       # ir inst 87 fin
  bnez s11, main._22.while.body.2
  j main._32.while.exit.2                                               # ir inst 88 fin
main._22.while.body.2:
  li t2, 2
  rem s11, t6, t2                                                       # ir inst 89 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 90 fin
  bnez s10, main._23.if.then.0
  j main._27.if.else.0                                                  # ir inst 91 fin
main._23.if.then.0:
  li t2, 3
  rem s11, t4, t2                                                       # ir inst 92 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 93 fin
  bnez s10, main._24.if.then.1
  j main._25.if.else.1                                                  # ir inst 94 fin
main._24.if.then.1:
  addi s11, t3, 1                                                       # ir inst 95 fin
# Phi connections
  j main._26.if.exit.1                                                  # ir inst 96 fin
main._25.if.else.1:
  addi s11, t3, -1                                                      # ir inst 97 fin
# Phi connections
  j main._26.if.exit.1                                                  # ir inst 98 fin
main._26.if.exit.1:
# Phi connections
  j main._31.if.exit.0                                                  # ir inst 100 fin
main._27.if.else.0:
  li t2, 2
  rem s11, t4, t2                                                       # ir inst 101 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 102 fin
  bnez s10, main._28.if.then.2
  j main._29.if.else.2                                                  # ir inst 103 fin
main._28.if.then.2:
  addi s11, t3, 2                                                       # ir inst 104 fin
# Phi connections
  j main._30.if.exit.2                                                  # ir inst 105 fin
main._29.if.else.2:
  addi s11, t3, -2                                                      # ir inst 106 fin
# Phi connections
  j main._30.if.exit.2                                                  # ir inst 107 fin
main._30.if.exit.2:
# Phi connections
  j main._31.if.exit.0                                                  # ir inst 109 fin
main._31.if.exit.0:
  addi s10, t4, 1                                                       # ir inst 111 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j main._21.while.cond.2                                               # ir inst 112 fin
main._32.while.exit.2:
  addi t4, t6, 1                                                        # ir inst 113 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j main._19.while.cond.1                                               # ir inst 114 fin
main._33.while.exit.1:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 115 fin
  li t1, 10
  li t2, 20
  slt t6, t2, t1                                                        # ir inst 116 fin
  bnez t6, main._34.if.then.3
  j main._38.if.else.3                                                  # ir inst 117 fin
main._34.if.then.3:
  li t1, 20
  li t2, 30
  slt t6, t2, t1                                                        # ir inst 118 fin
  bnez t6, main._35.if.then.4
  j main._36.if.else.4                                                  # ir inst 119 fin
main._35.if.then.4:
# Start call preparation
  li a0, 1
  call printlnInt
# ir inst 120 fin
  j main._37.if.exit.4                                                  # ir inst 121 fin
main._36.if.else.4:
# Start call preparation
  li a0, 2
  call printlnInt
# ir inst 122 fin
  j main._37.if.exit.4                                                  # ir inst 123 fin
main._37.if.exit.4:
  j main._45.if.exit.3                                                  # ir inst 124 fin
main._38.if.else.3:
  li t1, 20
  li t2, 30
  slt t6, t1, t2                                                        # ir inst 125 fin
  bnez t6, main._39.if.then.5
  j main._43.if.else.5                                                  # ir inst 126 fin
main._39.if.then.5:
  li t1, 10
  li t2, 30
  slt t6, t1, t2                                                        # ir inst 127 fin
  bnez t6, main._40.if.then.6
  j main._41.if.else.6                                                  # ir inst 128 fin
main._40.if.then.6:
# Start call preparation
  li a0, 3
  call printlnInt
# ir inst 129 fin
  j main._42.if.exit.6                                                  # ir inst 130 fin
main._41.if.else.6:
# Start call preparation
  li a0, 4
  call printlnInt
# ir inst 131 fin
  j main._42.if.exit.6                                                  # ir inst 132 fin
main._42.if.exit.6:
  j main._44.if.exit.5                                                  # ir inst 133 fin
main._43.if.else.5:
# Start call preparation
  li a0, 5
  call printlnInt
# ir inst 134 fin
  j main._44.if.exit.5                                                  # ir inst 135 fin
main._44.if.exit.5:
  j main._45.if.exit.3                                                  # ir inst 136 fin
main._45.if.exit.3:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j main._46.while.cond.3                                               # ir inst 137 fin
main._46.while.cond.3:
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 142 fin
  bnez s11, main._47.while.body.3
  j main._63.while.exit.3                                               # ir inst 143 fin
main._47.while.body.3:
  li t2, 6
  rem s11, t3, t2                                                       # ir inst 144 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 145 fin
  bnez s10, main._48.if.then.7
  j main._49.if.else.7                                                  # ir inst 146 fin
main._48.if.then.7:
  addi s10, t5, 1                                                       # ir inst 147 fin
# Phi connections
  mv s9, t4
  mv s11, t6
  j main._62.if.exit.7                                                  # ir inst 148 fin
main._49.if.else.7:
  li t2, 1
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 149 fin
  bnez s10, main._50.if.then.8
  j main._51.if.else.8                                                  # ir inst 150 fin
main._50.if.then.8:
  addi s10, t5, -1                                                      # ir inst 151 fin
# Phi connections
  mv s9, t4
  mv s11, t6
  j main._61.if.exit.8                                                  # ir inst 152 fin
main._51.if.else.8:
  li t2, 2
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 153 fin
  bnez s10, main._52.if.then.9
  j main._53.if.else.9                                                  # ir inst 154 fin
main._52.if.then.9:
  add s10, t4, t5                                                       # ir inst 155 fin
# Phi connections
  mv s11, t6
  j main._60.if.exit.9                                                  # ir inst 156 fin
main._53.if.else.9:
  li t2, 3
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 157 fin
  bnez s10, main._54.if.then.10
  j main._55.if.else.10                                                 # ir inst 158 fin
main._54.if.then.10:
  sub s10, t4, t5                                                       # ir inst 159 fin
# Phi connections
  mv s11, t6
  j main._59.if.exit.10                                                 # ir inst 160 fin
main._55.if.else.10:
  li t2, 4
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 161 fin
  bnez s10, main._56.if.then.11
  j main._57.if.else.11                                                 # ir inst 162 fin
main._56.if.then.11:
  add s11, t6, t4                                                       # ir inst 163 fin
# Phi connections
  j main._58.if.exit.11                                                 # ir inst 164 fin
main._57.if.else.11:
  sub s11, t6, t4                                                       # ir inst 165 fin
# Phi connections
  j main._58.if.exit.11                                                 # ir inst 166 fin
main._58.if.exit.11:
# Phi connections
  mv s10, t4
  j main._59.if.exit.10                                                 # ir inst 168 fin
main._59.if.exit.10:
# Phi connections
  j main._60.if.exit.9                                                  # ir inst 171 fin
main._60.if.exit.9:
# Phi connections
  mv s9, s10
  mv s10, t5
  j main._61.if.exit.8                                                  # ir inst 174 fin
main._61.if.exit.8:
# Phi connections
  j main._62.if.exit.7                                                  # ir inst 178 fin
main._62.if.exit.7:
  addi s8, t3, 1                                                        # ir inst 182 fin
# Phi connections
  mv t3, s8
  mv t4, s9
  mv t5, s10
  mv t6, s11
  j main._46.while.cond.3                                               # ir inst 183 fin
main._63.while.exit.3:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 184 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 185 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 186 fin
  li t1, 100
  li t2, 50
  slt t6, t2, t1                                                        # ir inst 187 fin
  bnez t6, main._64.if.then.12
  j main._68.if.else.12                                                 # ir inst 188 fin
main._64.if.then.12:
  li t1, 200
  li t2, 150
  slt t6, t2, t1                                                        # ir inst 189 fin
  bnez t6, main._65.if.then.13
  j main._66.if.else.13                                                 # ir inst 190 fin
main._65.if.then.13:
# Start call preparation
  li a0, 301
  call printlnInt
# ir inst 191 fin
  j main._67.if.exit.13                                                 # ir inst 192 fin
main._66.if.else.13:
  j main._67.if.exit.13                                                 # ir inst 193 fin
main._67.if.exit.13:
# Start call preparation
  li a0, 201
  call printlnInt
# ir inst 194 fin
  j main._69.if.exit.12                                                 # ir inst 195 fin
main._68.if.else.12:
  j main._69.if.exit.12                                                 # ir inst 196 fin
main._69.if.exit.12:
# Start call preparation
  li a0, 101
  call printlnInt
# ir inst 197 fin
# Phi connections
  li t6, 0
  j main._70.while.cond.4                                               # ir inst 198 fin
main._70.while.cond.4:
  li t2, 1
  slt t5, t6, t2                                                        # ir inst 200 fin
  bnez t5, main._71.while.body.4
  j main._72.while.exit.4                                               # ir inst 201 fin
main._71.while.body.4:
  addi t5, t6, 1                                                        # ir inst 202 fin
# Phi connections
  mv t6, t5
  j main._70.while.cond.4                                               # ir inst 203 fin
main._72.while.exit.4:
# Phi connections
  li t6, 0
  j main._73.while.cond.5                                               # ir inst 204 fin
main._73.while.cond.5:
  li t2, 2
  slt t5, t6, t2                                                        # ir inst 206 fin
  bnez t5, main._74.while.body.5
  j main._78.while.exit.5                                               # ir inst 207 fin
main._74.while.body.5:
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 208 fin
  bnez t5, main._75.if.then.14
  j main._76.if.else.14                                                 # ir inst 209 fin
main._75.if.then.14:
# Start call preparation
  sd t6, 0(sp)
  li a0, 790
  call printlnInt
  ld t6, 0(sp)
# ir inst 210 fin
  j main._77.if.exit.14                                                 # ir inst 211 fin
main._76.if.else.14:
  j main._77.if.exit.14                                                 # ir inst 212 fin
main._77.if.exit.14:
# Start call preparation
  sd t6, 0(sp)
  li a0, 456
  call printlnInt
  ld t6, 0(sp)
# ir inst 213 fin
  addi t5, t6, 1                                                        # ir inst 214 fin
# Phi connections
  mv t6, t5
  j main._73.while.cond.5                                               # ir inst 215 fin
main._78.while.exit.5:
# Phi connections
  li t5, 0
  li t6, 0
  j main._79.while.cond.6                                               # ir inst 216 fin
main._79.while.cond.6:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 219 fin
  bnez t4, main._80.while.body.6
  j main._84.while.exit.6                                               # ir inst 220 fin
main._80.while.body.6:
  mul t4, t6, t6                                                        # ir inst 221 fin
  li t2, 2
  rem t3, t6, t2                                                        # ir inst 222 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 223 fin
  bnez s11, main._81.if.then.15
  j main._82.if.else.15                                                 # ir inst 224 fin
main._81.if.then.15:
  slli t3, t6, 1                                                        # ir inst 225 fin
  add s11, t5, t3                                                       # ir inst 226 fin
# Phi connections
  mv t3, s11
  j main._83.if.exit.15                                                 # ir inst 227 fin
main._82.if.else.15:
# Phi connections
  mv t3, t5
  j main._83.if.exit.15                                                 # ir inst 228 fin
main._83.if.exit.15:
  add s11, t3, t4                                                       # ir inst 230 fin
  addi t4, t6, 1                                                        # ir inst 231 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j main._79.while.cond.6                                               # ir inst 232 fin
main._84.while.exit.6:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 233 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 234 fin
  j main.epilogue                                                       # ir inst 235 fin
main.epilogue:
  ld ra, 56(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s8, 40(sp)
  ld s11, 48(sp)
  li t0, 2800
  add sp, sp, t0
  ret
