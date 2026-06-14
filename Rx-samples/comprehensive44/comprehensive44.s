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

.globl .F.init_world
.F.init_world:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.init_world._0.entry.0:
# Phi connections
  li t6, 0
  j .F.init_world._1.while.cond.0                                       # ir inst 1 fin
.F.init_world._1.while.cond.0:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.init_world._2.while.body.0
  j .F.init_world._6.while.exit.0                                       # ir inst 4 fin
.F.init_world._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.init_world._3.while.cond.1                                       # ir inst 5 fin
.F.init_world._3.while.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.init_world._4.while.body.1
  j .F.init_world._5.while.exit.1                                       # ir inst 8 fin
.F.init_world._4.while.body.1:
  mv t4, t6                                                             # ir inst 9 fin
  slli t2, t4, 8
  add t3, a0, t2                                                        # ir inst 10 fin
  mv t4, t5                                                             # ir inst 11 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 12 fin
  mul t4, t6, t5                                                        # ir inst 13 fin
  add t3, t4, t6                                                        # ir inst 14 fin
  add t4, t3, t5                                                        # ir inst 15 fin
  li t2, 100
  rem t3, t4, t2                                                        # ir inst 16 fin
  sw t3, 0(s11)                                                         # ir inst 17 fin
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.init_world._3.while.cond.1                                       # ir inst 19 fin
.F.init_world._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.init_world._1.while.cond.0                                       # ir inst 21 fin
.F.init_world._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.init_world._7.while.cond.2                                       # ir inst 22 fin
.F.init_world._7.while.cond.2:
  li t2, 32
  slt t5, t6, t2                                                        # ir inst 24 fin
  bnez t5, .F.init_world._8.while.body.2
  j .F.init_world._9.while.exit.2                                       # ir inst 25 fin
.F.init_world._8.while.body.2:
  mv t5, t6                                                             # ir inst 26 fin
  li t1, 28
  mul t2, t5, t1
  add t4, a1, t2                                                        # ir inst 27 fin
  addi t5, t4, 0                                                        # ir inst 28 fin
  sw t6, 0(t5)                                                          # ir inst 29 fin
  mv t5, t6                                                             # ir inst 30 fin
  li t1, 28
  mul t2, t5, t1
  add t4, a1, t2                                                        # ir inst 31 fin
  addi t5, t4, 4                                                        # ir inst 32 fin
  li t2, 13
  mul t4, t6, t2                                                        # ir inst 33 fin
  li t2, 64
  rem t3, t4, t2                                                        # ir inst 34 fin
  sw t3, 0(t5)                                                          # ir inst 35 fin
  mv t5, t6                                                             # ir inst 36 fin
  li t1, 28
  mul t2, t5, t1
  add t4, a1, t2                                                        # ir inst 37 fin
  addi t5, t4, 8                                                        # ir inst 38 fin
  li t2, 31
  mul t4, t6, t2                                                        # ir inst 39 fin
  li t2, 64
  rem t3, t4, t2                                                        # ir inst 40 fin
  sw t3, 0(t5)                                                          # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  li t1, 28
  mul t2, t5, t1
  add t4, a1, t2                                                        # ir inst 43 fin
  addi t5, t4, 12                                                       # ir inst 44 fin
  li t1, 100
  sw t1, 0(t5)                                                          # ir inst 45 fin
  mv t5, t6                                                             # ir inst 46 fin
  li t1, 28
  mul t2, t5, t1
  add t4, a1, t2                                                        # ir inst 47 fin
  addi t5, t4, 24                                                       # ir inst 48 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 49 fin
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F.init_world._7.while.cond.2                                       # ir inst 51 fin
.F.init_world._9.while.exit.2:
  j .F.init_world.epilogue                                              # ir inst 52 fin
.F.init_world.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.find_new_target
.F.find_new_target:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 0,                range:       64(sp) -       64(sp)
# callee save reg num: 8 / 12,        range:        0(sp) -       64(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s7, 32(sp)
  sd s6, 40(sp)
  sd s0, 48(sp)
  sd s5, 56(sp)
.F.find_new_target._0.entry.0:
# Phi connections
  li t3, -1
  li t4, -1
  li t5, -1
  li t6, -5
  j .F.find_new_target._1.while.cond.0                                  # ir inst 1 fin
.F.find_new_target._1.while.cond.0:
  li t2, 5
  slt t0, t2, t6
  xori s11, t0, 1                                                       # ir inst 6 fin
  bnez s11, .F.find_new_target._2.while.body.0
  j .F.find_new_target._9.while.exit.0                                  # ir inst 7 fin
.F.find_new_target._2.while.body.0:
# Phi connections
  mv s9, t3
  mv s10, t4
  mv s11, t5
  li t5, -5
  j .F.find_new_target._3.while.cond.1                                  # ir inst 8 fin
.F.find_new_target._3.while.cond.1:
  li t2, 5
  slt t0, t2, t5
  xori s8, t0, 1                                                        # ir inst 13 fin
  bnez s8, .F.find_new_target._4.while.body.1
  j .F.find_new_target._8.while.exit.1                                  # ir inst 14 fin
.F.find_new_target._4.while.body.1:
  addi s8, a0, 4                                                        # ir inst 15 fin
  lw s7, 0(s8)                                                          # ir inst 16 fin
  add s8, s7, t6                                                        # ir inst 17 fin
  addi s7, s8, 64                                                       # ir inst 18 fin
  li t2, 64
  rem s8, s7, t2                                                        # ir inst 19 fin
  addi s7, a0, 8                                                        # ir inst 20 fin
  lw s6, 0(s7)                                                          # ir inst 21 fin
  add s7, s6, t5                                                        # ir inst 22 fin
  addi s6, s7, 64                                                       # ir inst 23 fin
  li t2, 64
  rem s7, s6, t2                                                        # ir inst 24 fin
  mv s6, s8                                                             # ir inst 25 fin
  slli t2, s6, 8
  add s5, a1, t2                                                        # ir inst 26 fin
  mv s6, s7                                                             # ir inst 27 fin
  slli t2, s6, 2
  add s0, s5, t2                                                        # ir inst 28 fin
  lw s6, 0(s0)                                                          # ir inst 29 fin
  slt s5, s11, s6                                                       # ir inst 30 fin
  bnez s5, .F.find_new_target._5.if.then.0
  j .F.find_new_target._6.if.else.0                                     # ir inst 31 fin
.F.find_new_target._5.if.then.0:
  mv s6, s8                                                             # ir inst 32 fin
  slli t2, s6, 8
  add s5, a1, t2                                                        # ir inst 33 fin
  mv s6, s7                                                             # ir inst 34 fin
  slli t2, s6, 2
  add s0, s5, t2                                                        # ir inst 35 fin
  lw s6, 0(s0)                                                          # ir inst 36 fin
# Phi connections
  mv t0, s6
  mv s6, s8
  mv s8, t0
  j .F.find_new_target._7.if.exit.0                                     # ir inst 37 fin
.F.find_new_target._6.if.else.0:
# Phi connections
  mv s6, s9
  mv s7, s10
  mv s8, s11
  j .F.find_new_target._7.if.exit.0                                     # ir inst 38 fin
.F.find_new_target._7.if.exit.0:
  addi s5, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv s9, s6
  mv s10, s7
  mv s11, s8
  mv t5, s5
  j .F.find_new_target._3.while.cond.1                                  # ir inst 43 fin
.F.find_new_target._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t3, s9
  mv t4, s10
  mv t6, t5
  mv t5, s11
  j .F.find_new_target._1.while.cond.0                                  # ir inst 45 fin
.F.find_new_target._9.while.exit.0:
  li t2, 1000
  mul t6, t3, t2                                                        # ir inst 46 fin
  add t5, t6, t4                                                        # ir inst 47 fin
  mv a0, t5
  j .F.find_new_target.epilogue                                         # ir inst 48 fin
.F.find_new_target.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s7, 32(sp)
  ld s6, 40(sp)
  ld s0, 48(sp)
  ld s5, 56(sp)
  addi sp, sp, 64
  ret

.globl .F.update_agent
.F.update_agent:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.update_agent._0.entry.0:
  addi t6, a0, 12                                                       # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t0, t2, t5
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.update_agent._1.if.then.0
  j .F.update_agent._2.if.else.0                                        # ir inst 4 fin
.F.update_agent._1.if.then.0:
  j .F.update_agent.epilogue                                            # ir inst 5 fin
.F.update_agent._2.if.else.0:
  j .F.update_agent._3.if.exit.0                                        # ir inst 6 fin
.F.update_agent._3.if.exit.0:
  addi t6, a0, 12                                                       # ir inst 7 fin
  addi t5, a0, 12                                                       # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  addi t5, t4, -1                                                       # ir inst 10 fin
  sw t5, 0(t6)                                                          # ir inst 11 fin
  addi t6, a0, 24                                                       # ir inst 12 fin
  lw t5, 0(t6)                                                          # ir inst 13 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 14 fin
  bnez t6, .F.update_agent._4.if.then.1
  j .F.update_agent._5.if.else.1                                        # ir inst 15 fin
.F.update_agent._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F.find_new_target
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 16 fin
  addi t5, a0, 16                                                       # ir inst 17 fin
  li t2, 1000
  div t4, t6, t2                                                        # ir inst 18 fin
  sw t4, 0(t5)                                                          # ir inst 19 fin
  addi t5, a0, 20                                                       # ir inst 20 fin
  li t2, 1000
  rem t4, t6, t2                                                        # ir inst 21 fin
  sw t4, 0(t5)                                                          # ir inst 22 fin
  addi t6, a0, 24                                                       # ir inst 23 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 24 fin
  j .F.update_agent._36.if.exit.1                                       # ir inst 25 fin
.F.update_agent._5.if.else.1:
  addi t6, a0, 24                                                       # ir inst 26 fin
  lw t5, 0(t6)                                                          # ir inst 27 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 28 fin
  bnez t6, .F.update_agent._6.if.then.2
  j .F.update_agent._25.if.else.2                                       # ir inst 29 fin
.F.update_agent._6.if.then.2:
  addi t6, a0, 4                                                        # ir inst 30 fin
  lw t5, 0(t6)                                                          # ir inst 31 fin
  addi t6, a0, 16                                                       # ir inst 32 fin
  lw t4, 0(t6)                                                          # ir inst 33 fin
  xor t0, t5, t4
  sltiu t6, t0, 1                                                       # ir inst 34 fin
  bnez t6, .F.update_agent._7.lazy.then.0
  j .F.update_agent._8.lazy.else.0                                      # ir inst 35 fin
.F.update_agent._7.lazy.then.0:
  addi t6, a0, 8                                                        # ir inst 36 fin
  lw t5, 0(t6)                                                          # ir inst 37 fin
  addi t6, a0, 20                                                       # ir inst 38 fin
  lw t4, 0(t6)                                                          # ir inst 39 fin
  xor t0, t5, t4
  sltiu t6, t0, 1                                                       # ir inst 40 fin
# Phi connections
  j .F.update_agent._9.lazy.exit.0                                      # ir inst 41 fin
.F.update_agent._8.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.update_agent._9.lazy.exit.0                                      # ir inst 42 fin
.F.update_agent._9.lazy.exit.0:
  bnez t6, .F.update_agent._10.if.then.3
  j .F.update_agent._11.if.else.3                                       # ir inst 44 fin
.F.update_agent._10.if.then.3:
  addi t6, a0, 24                                                       # ir inst 45 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 46 fin
  j .F.update_agent._24.if.exit.3                                       # ir inst 47 fin
.F.update_agent._11.if.else.3:
  addi t6, a0, 4                                                        # ir inst 48 fin
  lw t5, 0(t6)                                                          # ir inst 49 fin
  addi t6, a0, 16                                                       # ir inst 50 fin
  lw t4, 0(t6)                                                          # ir inst 51 fin
  slt t6, t5, t4                                                        # ir inst 52 fin
  bnez t6, .F.update_agent._12.if.then.4
  j .F.update_agent._13.if.else.4                                       # ir inst 53 fin
.F.update_agent._12.if.then.4:
  addi t6, a0, 4                                                        # ir inst 54 fin
  addi t5, a0, 4                                                        # ir inst 55 fin
  lw t4, 0(t5)                                                          # ir inst 56 fin
  addi t5, t4, 1                                                        # ir inst 57 fin
  sw t5, 0(t6)                                                          # ir inst 58 fin
  j .F.update_agent._17.if.exit.4                                       # ir inst 59 fin
.F.update_agent._13.if.else.4:
  addi t6, a0, 4                                                        # ir inst 60 fin
  lw t5, 0(t6)                                                          # ir inst 61 fin
  addi t6, a0, 16                                                       # ir inst 62 fin
  lw t4, 0(t6)                                                          # ir inst 63 fin
  slt t6, t4, t5                                                        # ir inst 64 fin
  bnez t6, .F.update_agent._14.if.then.5
  j .F.update_agent._15.if.else.5                                       # ir inst 65 fin
.F.update_agent._14.if.then.5:
  addi t6, a0, 4                                                        # ir inst 66 fin
  addi t5, a0, 4                                                        # ir inst 67 fin
  lw t4, 0(t5)                                                          # ir inst 68 fin
  addi t5, t4, -1                                                       # ir inst 69 fin
  sw t5, 0(t6)                                                          # ir inst 70 fin
  j .F.update_agent._16.if.exit.5                                       # ir inst 71 fin
.F.update_agent._15.if.else.5:
  j .F.update_agent._16.if.exit.5                                       # ir inst 72 fin
.F.update_agent._16.if.exit.5:
  j .F.update_agent._17.if.exit.4                                       # ir inst 73 fin
.F.update_agent._17.if.exit.4:
  addi t6, a0, 8                                                        # ir inst 74 fin
  lw t5, 0(t6)                                                          # ir inst 75 fin
  addi t6, a0, 20                                                       # ir inst 76 fin
  lw t4, 0(t6)                                                          # ir inst 77 fin
  slt t6, t5, t4                                                        # ir inst 78 fin
  bnez t6, .F.update_agent._18.if.then.6
  j .F.update_agent._19.if.else.6                                       # ir inst 79 fin
.F.update_agent._18.if.then.6:
  addi t6, a0, 8                                                        # ir inst 80 fin
  addi t5, a0, 8                                                        # ir inst 81 fin
  lw t4, 0(t5)                                                          # ir inst 82 fin
  addi t5, t4, 1                                                        # ir inst 83 fin
  sw t5, 0(t6)                                                          # ir inst 84 fin
  j .F.update_agent._23.if.exit.6                                       # ir inst 85 fin
.F.update_agent._19.if.else.6:
  addi t6, a0, 8                                                        # ir inst 86 fin
  lw t5, 0(t6)                                                          # ir inst 87 fin
  addi t6, a0, 20                                                       # ir inst 88 fin
  lw t4, 0(t6)                                                          # ir inst 89 fin
  slt t6, t4, t5                                                        # ir inst 90 fin
  bnez t6, .F.update_agent._20.if.then.7
  j .F.update_agent._21.if.else.7                                       # ir inst 91 fin
.F.update_agent._20.if.then.7:
  addi t6, a0, 8                                                        # ir inst 92 fin
  addi t5, a0, 8                                                        # ir inst 93 fin
  lw t4, 0(t5)                                                          # ir inst 94 fin
  addi t5, t4, -1                                                       # ir inst 95 fin
  sw t5, 0(t6)                                                          # ir inst 96 fin
  j .F.update_agent._22.if.exit.7                                       # ir inst 97 fin
.F.update_agent._21.if.else.7:
  j .F.update_agent._22.if.exit.7                                       # ir inst 98 fin
.F.update_agent._22.if.exit.7:
  j .F.update_agent._23.if.exit.6                                       # ir inst 99 fin
.F.update_agent._23.if.exit.6:
  j .F.update_agent._24.if.exit.3                                       # ir inst 100 fin
.F.update_agent._24.if.exit.3:
  j .F.update_agent._35.if.exit.2                                       # ir inst 101 fin
.F.update_agent._25.if.else.2:
  addi t6, a0, 24                                                       # ir inst 102 fin
  lw t5, 0(t6)                                                          # ir inst 103 fin
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 104 fin
  bnez t6, .F.update_agent._26.if.then.8
  j .F.update_agent._33.if.else.8                                       # ir inst 105 fin
.F.update_agent._26.if.then.8:
  addi t6, a0, 4                                                        # ir inst 106 fin
  lw t5, 0(t6)                                                          # ir inst 107 fin
  mv t6, t5                                                             # ir inst 108 fin
  slli t2, t6, 8
  add t5, a1, t2                                                        # ir inst 109 fin
  addi t6, a0, 8                                                        # ir inst 110 fin
  lw t4, 0(t6)                                                          # ir inst 111 fin
  mv t6, t4                                                             # ir inst 112 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 113 fin
  lw t6, 0(t4)                                                          # ir inst 114 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 115 fin
  bnez t5, .F.update_agent._27.if.then.9
  j .F.update_agent._31.if.else.9                                       # ir inst 116 fin
.F.update_agent._27.if.then.9:
  addi t5, a0, 12                                                       # ir inst 117 fin
  addi t4, a0, 12                                                       # ir inst 118 fin
  lw t3, 0(t4)                                                          # ir inst 119 fin
  li t2, 5
  div t4, t6, t2                                                        # ir inst 120 fin
  add s11, t3, t4                                                       # ir inst 121 fin
  sw s11, 0(t5)                                                         # ir inst 122 fin
  addi t5, a0, 4                                                        # ir inst 123 fin
  lw t4, 0(t5)                                                          # ir inst 124 fin
  mv t5, t4                                                             # ir inst 125 fin
  slli t2, t5, 8
  add t4, a1, t2                                                        # ir inst 126 fin
  addi t5, a0, 8                                                        # ir inst 127 fin
  lw t3, 0(t5)                                                          # ir inst 128 fin
  mv t5, t3                                                             # ir inst 129 fin
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 130 fin
  addi t5, a0, 4                                                        # ir inst 131 fin
  lw t4, 0(t5)                                                          # ir inst 132 fin
  mv t5, t4                                                             # ir inst 133 fin
  slli t2, t5, 8
  add t4, a1, t2                                                        # ir inst 134 fin
  addi t5, a0, 8                                                        # ir inst 135 fin
  lw s11, 0(t5)                                                         # ir inst 136 fin
  mv t5, s11                                                            # ir inst 137 fin
  slli t2, t5, 2
  add s11, t4, t2                                                       # ir inst 138 fin
  lw t5, 0(s11)                                                         # ir inst 139 fin
  li t2, 10
  div t4, t6, t2                                                        # ir inst 140 fin
  sub t6, t5, t4                                                        # ir inst 141 fin
  addi t5, t6, -1                                                       # ir inst 142 fin
  sw t5, 0(t3)                                                          # ir inst 143 fin
  addi t6, a0, 4                                                        # ir inst 144 fin
  lw t5, 0(t6)                                                          # ir inst 145 fin
  mv t6, t5                                                             # ir inst 146 fin
  slli t2, t6, 8
  add t5, a1, t2                                                        # ir inst 147 fin
  addi t6, a0, 8                                                        # ir inst 148 fin
  lw t4, 0(t6)                                                          # ir inst 149 fin
  mv t6, t4                                                             # ir inst 150 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 151 fin
  lw t6, 0(t4)                                                          # ir inst 152 fin
  li t2, 0
  slt t5, t6, t2                                                        # ir inst 153 fin
  bnez t5, .F.update_agent._28.if.then.10
  j .F.update_agent._29.if.else.10                                      # ir inst 154 fin
.F.update_agent._28.if.then.10:
  addi t6, a0, 4                                                        # ir inst 155 fin
  lw t5, 0(t6)                                                          # ir inst 156 fin
  mv t6, t5                                                             # ir inst 157 fin
  slli t2, t6, 8
  add t5, a1, t2                                                        # ir inst 158 fin
  addi t6, a0, 8                                                        # ir inst 159 fin
  lw t4, 0(t6)                                                          # ir inst 160 fin
  mv t6, t4                                                             # ir inst 161 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 162 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 163 fin
  j .F.update_agent._30.if.exit.10                                      # ir inst 164 fin
.F.update_agent._29.if.else.10:
  j .F.update_agent._30.if.exit.10                                      # ir inst 165 fin
.F.update_agent._30.if.exit.10:
  j .F.update_agent._32.if.exit.9                                       # ir inst 166 fin
.F.update_agent._31.if.else.9:
  j .F.update_agent._32.if.exit.9                                       # ir inst 167 fin
.F.update_agent._32.if.exit.9:
  addi t6, a0, 24                                                       # ir inst 168 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 169 fin
  j .F.update_agent._34.if.exit.8                                       # ir inst 170 fin
.F.update_agent._33.if.else.8:
  j .F.update_agent._34.if.exit.8                                       # ir inst 171 fin
.F.update_agent._34.if.exit.8:
  j .F.update_agent._35.if.exit.2                                       # ir inst 172 fin
.F.update_agent._35.if.exit.2:
  j .F.update_agent._36.if.exit.1                                       # ir inst 173 fin
.F.update_agent._36.if.exit.1:
  j .F.update_agent.epilogue                                            # ir inst 174 fin
.F.update_agent.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl main
main:
# spill func args num: 0,             range:    17632(sp) -    17632(sp)
# local var size: 17564,              range:       56(sp) -    17620(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 3 / 12,        range:       24(sp) -       48(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -17632
  add sp, sp, t0
  sd s9, 24(sp)
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
main._0.entry.0:
  li t1, 16440
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 4 fin
main._1.array.cond.0:
  li t2, 64
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
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 16 fin
main._5.array.body.1:
  slli t2, t5, 8
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 256
  li t1, 16440
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 20 fin
main._6.array.exit.1:
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 24 fin
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 26 fin
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 8                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 28 fin
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 12                                                       # ir inst 29 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 30 fin
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 16                                                       # ir inst 31 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 32 fin
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 20                                                       # ir inst 33 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 34 fin
  li t1, 17592
  add t1, sp, t1
  addi t6, t1, 24                                                       # ir inst 35 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 36 fin
  li t1, 16696
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 37 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 38 fin
main._7.array.cond.2:
  li t2, 32
  slt t4, t5, t2                                                        # ir inst 40 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 41 fin
main._8.array.body.2:
  li t1, 28
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 42 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  li t1, 17592
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 43 fin
  addi t4, t5, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 45 fin
main._9.array.exit.2:
# Start call preparation
  li t1, 16696
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.init_world
# ir inst 46 fin
# Phi connections
  li t6, 0
  j main._10.while.cond.0                                               # ir inst 47 fin
main._10.while.cond.0:
  li t2, 200
  slt t5, t6, t2                                                        # ir inst 49 fin
  bnez t5, main._11.while.body.0
  j main._21.while.exit.0                                               # ir inst 50 fin
main._11.while.body.0:
# Phi connections
  li t5, 0
  j main._12.while.cond.1                                               # ir inst 51 fin
main._12.while.cond.1:
  li t2, 32
  slt t4, t5, t2                                                        # ir inst 53 fin
  bnez t4, main._13.while.body.1
  j main._14.while.exit.1                                               # ir inst 54 fin
main._13.while.body.1:
  mv t4, t5                                                             # ir inst 55 fin
  li t1, 28
  mul t2, t4, t1
  li t1, 16696
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 56 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 56
  mv a1, t1
  mv a0, t3
  call .F.update_agent
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 57 fin
  addi t4, t5, 1                                                        # ir inst 58 fin
# Phi connections
  mv t5, t4
  j main._12.while.cond.1                                               # ir inst 59 fin
main._14.while.exit.1:
  li t2, 20
  rem t5, t6, t2                                                        # ir inst 60 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 61 fin
  bnez t4, main._15.if.then.0
  j main._19.if.else.0                                                  # ir inst 62 fin
main._15.if.then.0:
# Phi connections
  li t4, 0
  li t5, 0
  j main._16.while.cond.2                                               # ir inst 63 fin
main._16.while.cond.2:
  li t2, 32
  slt t3, t5, t2                                                        # ir inst 66 fin
  bnez t3, main._17.while.body.2
  j main._18.while.exit.2                                               # ir inst 67 fin
main._17.while.body.2:
  mv t3, t5                                                             # ir inst 68 fin
  li t1, 28
  mul t2, t3, t1
  li t1, 16696
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 69 fin
  addi t3, s11, 12                                                      # ir inst 70 fin
  lw s11, 0(t3)                                                         # ir inst 71 fin
  add t3, t4, s11                                                       # ir inst 72 fin
  addi s11, t5, 1                                                       # ir inst 73 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._16.while.cond.2                                               # ir inst 74 fin
main._18.while.exit.2:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 75 fin
  j main._20.if.exit.0                                                  # ir inst 76 fin
main._19.if.else.0:
  j main._20.if.exit.0                                                  # ir inst 77 fin
main._20.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 78 fin
# Phi connections
  mv t6, t5
  j main._10.while.cond.0                                               # ir inst 79 fin
main._21.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j main._22.while.cond.3                                               # ir inst 80 fin
main._22.while.cond.3:
  li t2, 64
  slt t4, t6, t2                                                        # ir inst 83 fin
  bnez t4, main._23.while.body.3
  j main._27.while.exit.3                                               # ir inst 84 fin
main._23.while.body.3:
# Phi connections
  mv t3, t5
  li t4, 0
  j main._24.while.cond.4                                               # ir inst 85 fin
main._24.while.cond.4:
  li t2, 64
  slt s11, t4, t2                                                       # ir inst 88 fin
  bnez s11, main._25.while.body.4
  j main._26.while.exit.4                                               # ir inst 89 fin
main._25.while.body.4:
  mv s11, t6                                                            # ir inst 90 fin
  slli t2, s11, 8
  addi t1, sp, 56
  add s10, t1, t2                                                       # ir inst 91 fin
  mv s11, t4                                                            # ir inst 92 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 93 fin
  lw s11, 0(s9)                                                         # ir inst 94 fin
  add s10, t3, s11                                                      # ir inst 95 fin
  addi s11, t4, 1                                                       # ir inst 96 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j main._24.while.cond.4                                               # ir inst 97 fin
main._26.while.exit.4:
  addi t4, t6, 1                                                        # ir inst 98 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j main._22.while.cond.3                                               # ir inst 99 fin
main._27.while.exit.3:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 100 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 101 fin
  j main.epilogue                                                       # ir inst 102 fin
main.epilogue:
  ld ra, 48(sp)
  ld s9, 24(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 17632
  add sp, sp, t0
  ret
