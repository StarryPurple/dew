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

.globl .F.init_fsm
.F.init_fsm:
# spill func args num: 0,             range:     4704(sp) -     4704(sp)
# local var size: 4652,               range:       40(sp) -     4692(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4704
  add sp, sp, t0
  sd ra, 32(sp)
.F.init_fsm._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 40
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 40
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 4672
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 9 fin
  li t1, 4672
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 11 fin
  li t1, 4672
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 12 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 13 fin
  li t1, 4672
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 14 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 15 fin
  li t1, 4672
  add t1, sp, t1
  addi t5, t1, 16                                                       # ir inst 16 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 17 fin
  addi t5, t6, 0                                                        # ir inst 18 fin
# Phi connections
  li t6, 0
  j .F.init_fsm._1.array.cond.0                                         # ir inst 19 fin
.F.init_fsm._1.array.cond.0:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 21 fin
  bnez t4, .F.init_fsm._2.array.body.0
  j .F.init_fsm._3.array.exit.0                                         # ir inst 22 fin
.F.init_fsm._2.array.body.0:
  li t1, 20
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 20
  li t1, 4672
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 24 fin
  addi t4, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t4
  j .F.init_fsm._1.array.cond.0                                         # ir inst 26 fin
.F.init_fsm._3.array.exit.0:
  addi t1, sp, 40
  li t6, 4008
  add t6, t1, t6                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 28 fin
  addi t1, sp, 40
  li t6, 4012
  add t6, t1, t6                                                        # ir inst 29 fin
  addi t5, t6, 0                                                        # ir inst 30 fin
# Phi connections
  li t6, 0
  j .F.init_fsm._4.array.cond.1                                         # ir inst 31 fin
.F.init_fsm._4.array.cond.1:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 33 fin
  bnez t4, .F.init_fsm._5.array.body.1
  j .F.init_fsm._6.array.exit.1                                         # ir inst 34 fin
.F.init_fsm._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 35 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 36 fin
  addi t4, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t6, t4
  j .F.init_fsm._4.array.cond.1                                         # ir inst 38 fin
.F.init_fsm._6.array.exit.1:
  addi t1, sp, 40
  li t6, 4412
  add t6, t1, t6                                                        # ir inst 39 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 40 fin
  addi t1, sp, 40
  li t6, 4416
  add t6, t1, t6                                                        # ir inst 41 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 42 fin
  addi t1, sp, 40
  li t6, 4420
  add t6, t1, t6                                                        # ir inst 43 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 44 fin
  addi t1, sp, 40
  li t6, 4424
  add t6, t1, t6                                                        # ir inst 45 fin
  addi t5, t6, 0                                                        # ir inst 46 fin
# Phi connections
  li t6, 0
  j .F.init_fsm._7.array.cond.2                                         # ir inst 47 fin
.F.init_fsm._7.array.cond.2:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 49 fin
  bnez t4, .F.init_fsm._8.array.body.2
  j .F.init_fsm._9.array.exit.2                                         # ir inst 50 fin
.F.init_fsm._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 52 fin
  addi t4, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t4
  j .F.init_fsm._7.array.cond.2                                         # ir inst 54 fin
.F.init_fsm._9.array.exit.2:
  addi t1, sp, 40
  li t6, 4624
  add t6, t1, t6                                                        # ir inst 55 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 56 fin
  addi t1, sp, 40
  li t6, 4628
  add t6, t1, t6                                                        # ir inst 57 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 58 fin
# Phi connections
  li t6, 0
  j .F.init_fsm._10.while.cond.0                                        # ir inst 59 fin
.F.init_fsm._10.while.cond.0:
  li t2, 50
  sltu t5, t6, t2                                                       # ir inst 61 fin
  bnez t5, .F.init_fsm._11.while.body.0
  j .F.init_fsm._12.while.exit.0                                        # ir inst 62 fin
.F.init_fsm._11.while.body.0:
  addi t1, sp, 40
  li t5, 4424
  add t5, t1, t5                                                        # ir inst 63 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 64 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 65 fin
  addi t5, t6, 1                                                        # ir inst 66 fin
# Phi connections
  mv t6, t5
  j .F.init_fsm._10.while.cond.0                                        # ir inst 67 fin
.F.init_fsm._12.while.exit.0:
  addi t1, sp, 40
  li t6, 4424
  add t6, t1, t6                                                        # ir inst 68 fin
  li t1, 0
  mv t5, t1                                                             # ir inst 69 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 70 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 71 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 4632
  addi t1, sp, 40
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 72 fin
  j .F.init_fsm.epilogue                                                # ir inst 73 fin
.F.init_fsm.epilogue:
  ld ra, 32(sp)
  li t0, 4704
  add sp, sp, t0
  ret

.globl .F.add_transition
.F.add_transition:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 20,                 range:       24(sp) -       44(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 16(sp)
.F.add_transition._0.entry.0:
  li t6, 4008
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t1, 200
  mv t6, t1                                                             # ir inst 3 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.add_transition._1.if.then.0
  j .F.add_transition._2.if.else.0                                      # ir inst 5 fin
.F.add_transition._1.if.then.0:
  li a0, 0
  j .F.add_transition.epilogue                                          # ir inst 6 fin
.F.add_transition._2.if.else.0:
  j .F.add_transition._3.if.exit.0                                      # ir inst 7 fin
.F.add_transition._3.if.exit.0:
  addi t6, a0, 8                                                        # ir inst 8 fin
  li t5, 4008
  add t5, a0, t5                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  mv t5, t4                                                             # ir inst 11 fin
  li t1, 20
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 12 fin
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 14 fin
  sw a1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 24
  addi t6, t1, 4                                                        # ir inst 16 fin
  sw a2, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 24
  addi t6, t1, 8                                                        # ir inst 18 fin
  sw a3, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 24
  addi t6, t1, 12                                                       # ir inst 20 fin
  sw a4, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 24
  addi t6, t1, 16                                                       # ir inst 22 fin
  sw a5, 0(t6)                                                          # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  li a2, 20
  addi t1, sp, 24
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
# ir inst 24 fin
  li t6, 4008
  add t6, a0, t6                                                        # ir inst 25 fin
  li t5, 4008
  add t5, a0, t5                                                        # ir inst 26 fin
  lw t4, 0(t5)                                                          # ir inst 27 fin
  addi t5, t4, 1                                                        # ir inst 28 fin
  sw t5, 0(t6)                                                          # ir inst 29 fin
  li a0, 1
  j .F.add_transition.epilogue                                          # ir inst 30 fin
.F.add_transition.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 48
  ret

.globl .F.fsm_add_event
.F.fsm_add_event:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.fsm_add_event._0.entry.0:
  li t6, 4420
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t1, 100
  mv t6, t1                                                             # ir inst 3 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.fsm_add_event._1.if.then.0
  j .F.fsm_add_event._2.if.else.0                                       # ir inst 5 fin
.F.fsm_add_event._1.if.then.0:
  li a0, 0
  j .F.fsm_add_event.epilogue                                           # ir inst 6 fin
.F.fsm_add_event._2.if.else.0:
  j .F.fsm_add_event._3.if.exit.0                                       # ir inst 7 fin
.F.fsm_add_event._3.if.exit.0:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 8 fin
  li t5, 4416
  add t5, a0, t5                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  mv t5, t4                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  sw a1, 0(t4)                                                          # ir inst 13 fin
  li t6, 4416
  add t6, a0, t6                                                        # ir inst 14 fin
  li t5, 4416
  add t5, a0, t5                                                        # ir inst 15 fin
  lw t4, 0(t5)                                                          # ir inst 16 fin
  addi t5, t4, 1                                                        # ir inst 17 fin
  li t1, 100
  mv t4, t1                                                             # ir inst 18 fin
  rem t3, t5, t4                                                        # ir inst 19 fin
  sw t3, 0(t6)                                                          # ir inst 20 fin
  li t6, 4420
  add t6, a0, t6                                                        # ir inst 21 fin
  li t5, 4420
  add t5, a0, t5                                                        # ir inst 22 fin
  lw t4, 0(t5)                                                          # ir inst 23 fin
  addi t5, t4, 1                                                        # ir inst 24 fin
  sw t5, 0(t6)                                                          # ir inst 25 fin
  li a0, 1
  j .F.fsm_add_event.epilogue                                           # ir inst 26 fin
.F.fsm_add_event.epilogue:
  ret

.globl .F.fsm_get_event
.F.fsm_get_event:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.fsm_get_event._0.entry.0:
  li t6, 4420
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t0, t2, t5
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.fsm_get_event._1.if.then.0
  j .F.fsm_get_event._2.if.else.0                                       # ir inst 4 fin
.F.fsm_get_event._1.if.then.0:
  li a0, -1
  j .F.fsm_get_event.epilogue                                           # ir inst 5 fin
.F.fsm_get_event._2.if.else.0:
  j .F.fsm_get_event._3.if.exit.0                                       # ir inst 6 fin
.F.fsm_get_event._3.if.exit.0:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 7 fin
  li t5, 4412
  add t5, a0, t5                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  mv t5, t4                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 11 fin
  lw t6, 0(t4)                                                          # ir inst 12 fin
  li t5, 4412
  add t5, a0, t5                                                        # ir inst 13 fin
  li t4, 4412
  add t4, a0, t4                                                        # ir inst 14 fin
  lw t3, 0(t4)                                                          # ir inst 15 fin
  addi t4, t3, 1                                                        # ir inst 16 fin
  li t1, 100
  mv t3, t1                                                             # ir inst 17 fin
  rem s11, t4, t3                                                       # ir inst 18 fin
  sw s11, 0(t5)                                                         # ir inst 19 fin
  li t5, 4420
  add t5, a0, t5                                                        # ir inst 20 fin
  li t4, 4420
  add t4, a0, t4                                                        # ir inst 21 fin
  lw t3, 0(t4)                                                          # ir inst 22 fin
  addi t4, t3, -1                                                       # ir inst 23 fin
  sw t4, 0(t5)                                                          # ir inst 24 fin
  mv a0, t6
  j .F.fsm_get_event.epilogue                                           # ir inst 25 fin
.F.fsm_get_event.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.evaluate_condition
.F.evaluate_condition:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.evaluate_condition._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.evaluate_condition._1.if.then.0
  j .F.evaluate_condition._2.if.else.0                                  # ir inst 2 fin
.F.evaluate_condition._1.if.then.0:
  li a0, 1
  j .F.evaluate_condition.epilogue                                      # ir inst 3 fin
.F.evaluate_condition._2.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 4 fin
  bnez t6, .F.evaluate_condition._3.if.then.1
  j .F.evaluate_condition._4.if.else.1                                  # ir inst 5 fin
.F.evaluate_condition._3.if.then.1:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 6 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 7 fin
.F.evaluate_condition._4.if.else.1:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 8 fin
  bnez t6, .F.evaluate_condition._5.if.then.2
  j .F.evaluate_condition._9.if.else.2                                  # ir inst 9 fin
.F.evaluate_condition._5.if.then.2:
  li t2, 1
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 10 fin
  bnez t6, .F.evaluate_condition._6.lazy.then.0
  j .F.evaluate_condition._7.lazy.else.0                                # ir inst 11 fin
.F.evaluate_condition._6.lazy.then.0:
  li t2, 2
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 12 fin
# Phi connections
  j .F.evaluate_condition._8.lazy.exit.0                                # ir inst 13 fin
.F.evaluate_condition._7.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.evaluate_condition._8.lazy.exit.0                                # ir inst 14 fin
.F.evaluate_condition._8.lazy.exit.0:
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 16 fin
.F.evaluate_condition._9.if.else.2:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 17 fin
  bnez t6, .F.evaluate_condition._10.if.then.3
  j .F.evaluate_condition._14.if.else.3                                 # ir inst 18 fin
.F.evaluate_condition._10.if.then.3:
  li t2, 0
  slt t6, t2, a3                                                        # ir inst 19 fin
  bnez t6, .F.evaluate_condition._11.lazy.then.1
  j .F.evaluate_condition._12.lazy.else.1                               # ir inst 20 fin
.F.evaluate_condition._11.lazy.then.1:
  li t2, 2
  rem t6, a3, t2                                                        # ir inst 21 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.evaluate_condition._13.lazy.exit.1                               # ir inst 23 fin
.F.evaluate_condition._12.lazy.else.1:
# Phi connections
  li t6, 0
  j .F.evaluate_condition._13.lazy.exit.1                               # ir inst 24 fin
.F.evaluate_condition._13.lazy.exit.1:
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 26 fin
.F.evaluate_condition._14.if.else.3:
  li t2, 4
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 27 fin
  bnez t6, .F.evaluate_condition._15.if.then.4
  j .F.evaluate_condition._19.if.else.4                                 # ir inst 28 fin
.F.evaluate_condition._15.if.then.4:
  li t2, 4
  xor t0, a1, t2
  sltu t6, zero, t0                                                     # ir inst 29 fin
  bnez t6, .F.evaluate_condition._16.lazy.then.2
  j .F.evaluate_condition._17.lazy.else.2                               # ir inst 30 fin
.F.evaluate_condition._16.lazy.then.2:
  li t2, 3
  xor t0, a2, t2
  sltu t6, zero, t0                                                     # ir inst 31 fin
# Phi connections
  j .F.evaluate_condition._18.lazy.exit.2                               # ir inst 32 fin
.F.evaluate_condition._17.lazy.else.2:
# Phi connections
  li t6, 0
  j .F.evaluate_condition._18.lazy.exit.2                               # ir inst 33 fin
.F.evaluate_condition._18.lazy.exit.2:
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 35 fin
.F.evaluate_condition._19.if.else.4:
  li t2, 5
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 36 fin
  bnez t6, .F.evaluate_condition._20.if.then.5
  j .F.evaluate_condition._36.if.else.5                                 # ir inst 37 fin
.F.evaluate_condition._20.if.then.5:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 38 fin
  bnez t6, .F.evaluate_condition._21.if.then.6
  j .F.evaluate_condition._28.if.else.6                                 # ir inst 39 fin
.F.evaluate_condition._21.if.then.6:
  li t2, 2
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 40 fin
  bnez t6, .F.evaluate_condition._22.if.then.7
  j .F.evaluate_condition._23.if.else.7                                 # ir inst 41 fin
.F.evaluate_condition._22.if.then.7:
  li t2, 10
  slt t6, t2, a3                                                        # ir inst 42 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 43 fin
.F.evaluate_condition._23.if.else.7:
  li t2, 3
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 44 fin
  bnez t6, .F.evaluate_condition._24.if.then.8
  j .F.evaluate_condition._25.if.else.8                                 # ir inst 45 fin
.F.evaluate_condition._24.if.then.8:
  li t2, 5
  slt t6, a3, t2                                                        # ir inst 46 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 47 fin
.F.evaluate_condition._25.if.else.8:
  li t2, 3
  rem t6, a3, t2                                                        # ir inst 48 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 49 fin
  mv a0, t5
  j .F.evaluate_condition.epilogue                                      # ir inst 50 fin
.F.evaluate_condition._26.if.exit.8:
  j .F.evaluate_condition._27.if.exit.7                                 # ir inst 51 fin
.F.evaluate_condition._27.if.exit.7:
  j .F.evaluate_condition._35.if.exit.6                                 # ir inst 52 fin
.F.evaluate_condition._28.if.else.6:
  li t2, 3
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 53 fin
  bnez t6, .F.evaluate_condition._29.if.then.9
  j .F.evaluate_condition._33.if.else.9                                 # ir inst 54 fin
.F.evaluate_condition._29.if.then.9:
  li t2, 4
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 55 fin
  bnez t6, .F.evaluate_condition._30.lazy.then.3
  j .F.evaluate_condition._31.lazy.else.3                               # ir inst 56 fin
.F.evaluate_condition._30.lazy.then.3:
# Phi connections
  li t6, 1
  j .F.evaluate_condition._32.lazy.exit.3                               # ir inst 57 fin
.F.evaluate_condition._31.lazy.else.3:
  li t2, 5
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 58 fin
# Phi connections
  j .F.evaluate_condition._32.lazy.exit.3                               # ir inst 59 fin
.F.evaluate_condition._32.lazy.exit.3:
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 61 fin
.F.evaluate_condition._33.if.else.9:
  li a0, 0
  j .F.evaluate_condition.epilogue                                      # ir inst 62 fin
.F.evaluate_condition._34.if.exit.9:
  j .F.evaluate_condition._35.if.exit.6                                 # ir inst 63 fin
.F.evaluate_condition._35.if.exit.6:
  j .F.evaluate_condition._58.if.exit.5                                 # ir inst 64 fin
.F.evaluate_condition._36.if.else.5:
  li t2, 6
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 65 fin
  bnez t6, .F.evaluate_condition._37.if.then.10
  j .F.evaluate_condition._56.if.else.10                                # ir inst 66 fin
.F.evaluate_condition._37.if.then.10:
  li t2, 3
  mul t6, a1, t2                                                        # ir inst 67 fin
  add t5, t6, a2                                                        # ir inst 68 fin
  li t2, 2
  div t6, a3, t2                                                        # ir inst 69 fin
  slt t4, t6, t5                                                        # ir inst 70 fin
  bnez t4, .F.evaluate_condition._38.if.then.11
  j .F.evaluate_condition._45.if.else.11                                # ir inst 71 fin
.F.evaluate_condition._38.if.then.11:
  li t2, 6
  slt t6, a1, t2                                                        # ir inst 72 fin
  bnez t6, .F.evaluate_condition._39.if.then.12
  j .F.evaluate_condition._40.if.else.12                                # ir inst 73 fin
.F.evaluate_condition._39.if.then.12:
  li t2, 8
  xor t0, a2, t2
  sltu t6, zero, t0                                                     # ir inst 74 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 75 fin
.F.evaluate_condition._40.if.else.12:
  li t2, 7
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 76 fin
  bnez t6, .F.evaluate_condition._41.lazy.then.4
  j .F.evaluate_condition._42.lazy.else.4                               # ir inst 77 fin
.F.evaluate_condition._41.lazy.then.4:
# Phi connections
  li t6, 1
  j .F.evaluate_condition._43.lazy.exit.4                               # ir inst 78 fin
.F.evaluate_condition._42.lazy.else.4:
  li t2, 9
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 79 fin
# Phi connections
  j .F.evaluate_condition._43.lazy.exit.4                               # ir inst 80 fin
.F.evaluate_condition._43.lazy.exit.4:
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 82 fin
.F.evaluate_condition._44.if.exit.12:
  j .F.evaluate_condition._55.if.exit.11                                # ir inst 83 fin
.F.evaluate_condition._45.if.else.11:
  li t2, 4
  rem t6, t5, t2                                                        # ir inst 84 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 85 fin
  bnez t4, .F.evaluate_condition._46.if.then.13
  j .F.evaluate_condition._47.if.else.13                                # ir inst 86 fin
.F.evaluate_condition._46.if.then.13:
  slt t6, t5, a3                                                        # ir inst 87 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 88 fin
.F.evaluate_condition._47.if.else.13:
  li t2, 4
  rem t6, t5, t2                                                        # ir inst 89 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 90 fin
  bnez t4, .F.evaluate_condition._48.if.then.14
  j .F.evaluate_condition._49.if.else.14                                # ir inst 91 fin
.F.evaluate_condition._48.if.then.14:
  slt t6, a3, t5                                                        # ir inst 92 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 93 fin
.F.evaluate_condition._49.if.else.14:
  li t2, 4
  rem t6, t5, t2                                                        # ir inst 94 fin
  li t2, 2
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 95 fin
  bnez t4, .F.evaluate_condition._50.if.then.15
  j .F.evaluate_condition._51.if.else.15                                # ir inst 96 fin
.F.evaluate_condition._50.if.then.15:
  xor t0, a3, t5
  sltiu t6, t0, 1                                                       # ir inst 97 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 98 fin
.F.evaluate_condition._51.if.else.15:
  xor t0, a3, t5
  sltu t6, zero, t0                                                     # ir inst 99 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 100 fin
.F.evaluate_condition._52.if.exit.15:
  j .F.evaluate_condition._53.if.exit.14                                # ir inst 101 fin
.F.evaluate_condition._53.if.exit.14:
  j .F.evaluate_condition._54.if.exit.13                                # ir inst 102 fin
.F.evaluate_condition._54.if.exit.13:
  j .F.evaluate_condition._55.if.exit.11                                # ir inst 103 fin
.F.evaluate_condition._55.if.exit.11:
  j .F.evaluate_condition._57.if.exit.10                                # ir inst 104 fin
.F.evaluate_condition._56.if.else.10:
  add t6, a0, a1                                                        # ir inst 105 fin
  add t5, t6, a2                                                        # ir inst 106 fin
  add t6, t5, a3                                                        # ir inst 107 fin
  li t2, 7
  rem t5, t6, t2                                                        # ir inst 108 fin
  li t2, 3
  slt t6, t2, t5                                                        # ir inst 109 fin
  mv a0, t6
  j .F.evaluate_condition.epilogue                                      # ir inst 110 fin
.F.evaluate_condition._57.if.exit.10:
  j .F.evaluate_condition._58.if.exit.5                                 # ir inst 111 fin
.F.evaluate_condition._58.if.exit.5:
  j .F.evaluate_condition._59.if.exit.4                                 # ir inst 112 fin
.F.evaluate_condition._59.if.exit.4:
  j .F.evaluate_condition._60.if.exit.3                                 # ir inst 113 fin
.F.evaluate_condition._60.if.exit.3:
  j .F.evaluate_condition._61.if.exit.2                                 # ir inst 114 fin
.F.evaluate_condition._61.if.exit.2:
  j .F.evaluate_condition._62.if.exit.1                                 # ir inst 115 fin
.F.evaluate_condition._62.if.exit.1:
  j .F.evaluate_condition._63.if.exit.0                                 # ir inst 116 fin
.F.evaluate_condition._63.if.exit.0:
.F.evaluate_condition.epilogue:
  ret

.globl .F.execute_action
.F.execute_action:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.execute_action._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.execute_action._1.if.then.0
  j .F.execute_action._2.if.else.0                                      # ir inst 2 fin
.F.execute_action._1.if.then.0:
  li a0, 0
  j .F.execute_action.epilogue                                          # ir inst 3 fin
.F.execute_action._2.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 4 fin
  bnez t6, .F.execute_action._3.if.then.1
  j .F.execute_action._4.if.else.1                                      # ir inst 5 fin
.F.execute_action._3.if.then.1:
  lw t6, 0(a2)                                                          # ir inst 6 fin
  addi t5, t6, 1                                                        # ir inst 7 fin
  sw t5, 0(a2)                                                          # ir inst 8 fin
  li a0, 1
  j .F.execute_action.epilogue                                          # ir inst 9 fin
.F.execute_action._4.if.else.1:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 10 fin
  bnez t6, .F.execute_action._5.if.then.2
  j .F.execute_action._6.if.else.2                                      # ir inst 11 fin
.F.execute_action._5.if.then.2:
  lw t6, 0(a2)                                                          # ir inst 12 fin
  slli t5, t6, 1                                                        # ir inst 13 fin
  sw t5, 0(a2)                                                          # ir inst 14 fin
  li a0, 2
  j .F.execute_action.epilogue                                          # ir inst 15 fin
.F.execute_action._6.if.else.2:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 16 fin
  bnez t6, .F.execute_action._7.if.then.3
  j .F.execute_action._11.if.else.3                                     # ir inst 17 fin
.F.execute_action._7.if.then.3:
  lw t6, 0(a2)                                                          # ir inst 18 fin
  addi t5, t6, -1                                                       # ir inst 19 fin
  sw t5, 0(a2)                                                          # ir inst 20 fin
  lw t6, 0(a2)                                                          # ir inst 21 fin
  li t2, 0
  slt t5, t6, t2                                                        # ir inst 22 fin
  bnez t5, .F.execute_action._8.if.then.4
  j .F.execute_action._9.if.else.4                                      # ir inst 23 fin
.F.execute_action._8.if.then.4:
  li t1, 0
  sw t1, 0(a2)                                                          # ir inst 24 fin
  j .F.execute_action._10.if.exit.4                                     # ir inst 25 fin
.F.execute_action._9.if.else.4:
  j .F.execute_action._10.if.exit.4                                     # ir inst 26 fin
.F.execute_action._10.if.exit.4:
  li a0, 3
  j .F.execute_action.epilogue                                          # ir inst 27 fin
.F.execute_action._11.if.else.3:
  li t2, 4
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 28 fin
  bnez t6, .F.execute_action._12.if.then.5
  j .F.execute_action._13.if.else.5                                     # ir inst 29 fin
.F.execute_action._12.if.then.5:
  lw t6, 0(a2)                                                          # ir inst 30 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 31 fin
  addi t6, t5, 17                                                       # ir inst 32 fin
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 33 fin
  sw t5, 0(a2)                                                          # ir inst 34 fin
  li t6, 4624
  add t6, a1, t6                                                        # ir inst 35 fin
  li t5, 4624
  add t5, a1, t5                                                        # ir inst 36 fin
  lw t4, 0(t5)                                                          # ir inst 37 fin
  addi t5, t4, 1                                                        # ir inst 38 fin
  sw t5, 0(t6)                                                          # ir inst 39 fin
  li a0, 4
  j .F.execute_action.epilogue                                          # ir inst 40 fin
.F.execute_action._13.if.else.5:
  li t2, 5
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 41 fin
  bnez t6, .F.execute_action._14.if.then.6
  j .F.execute_action._21.if.else.6                                     # ir inst 42 fin
.F.execute_action._14.if.then.6:
  lw t6, 0(a2)                                                          # ir inst 43 fin
  li t2, 50
  slt t5, t2, t6                                                        # ir inst 44 fin
  bnez t5, .F.execute_action._15.if.then.7
  j .F.execute_action._16.if.else.7                                     # ir inst 45 fin
.F.execute_action._15.if.then.7:
  lw t6, 0(a2)                                                          # ir inst 46 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 47 fin
  sw t5, 0(a2)                                                          # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a1
  li a1, 5
  call .F.fsm_add_event
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 49 fin
  j .F.execute_action._20.if.exit.7                                     # ir inst 50 fin
.F.execute_action._16.if.else.7:
  lw t6, 0(a2)                                                          # ir inst 51 fin
  li t2, 25
  slt t5, t2, t6                                                        # ir inst 52 fin
  bnez t5, .F.execute_action._17.if.then.8
  j .F.execute_action._18.if.else.8                                     # ir inst 53 fin
.F.execute_action._17.if.then.8:
  lw t6, 0(a2)                                                          # ir inst 54 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 55 fin
  sw t5, 0(a2)                                                          # ir inst 56 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a1
  li a1, 1
  call .F.fsm_add_event
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 57 fin
  j .F.execute_action._19.if.exit.8                                     # ir inst 58 fin
.F.execute_action._18.if.else.8:
  lw t6, 0(a2)                                                          # ir inst 59 fin
  addi t5, t6, 10                                                       # ir inst 60 fin
  sw t5, 0(a2)                                                          # ir inst 61 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a1
  li a1, 2
  call .F.fsm_add_event
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 62 fin
  j .F.execute_action._19.if.exit.8                                     # ir inst 63 fin
.F.execute_action._19.if.exit.8:
  j .F.execute_action._20.if.exit.7                                     # ir inst 64 fin
.F.execute_action._20.if.exit.7:
  li a0, 5
  j .F.execute_action.epilogue                                          # ir inst 65 fin
.F.execute_action._21.if.else.6:
  li t2, 6
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 66 fin
  bnez t6, .F.execute_action._22.if.then.9
  j .F.execute_action._32.if.else.9                                     # ir inst 67 fin
.F.execute_action._22.if.then.9:
# Phi connections
  li t6, 0
  j .F.execute_action._23.while.cond.0                                  # ir inst 68 fin
.F.execute_action._23.while.cond.0:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 70 fin
  bnez t5, .F.execute_action._24.while.body.0
  j .F.execute_action._31.while.exit.0                                  # ir inst 71 fin
.F.execute_action._24.while.body.0:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 72 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 73 fin
  bnez t4, .F.execute_action._25.if.then.10
  j .F.execute_action._26.if.else.10                                    # ir inst 74 fin
.F.execute_action._25.if.then.10:
  lw t5, 0(a2)                                                          # ir inst 75 fin
  add t4, t5, t6                                                        # ir inst 76 fin
  sw t4, 0(a2)                                                          # ir inst 77 fin
  j .F.execute_action._27.if.exit.10                                    # ir inst 78 fin
.F.execute_action._26.if.else.10:
  lw t5, 0(a2)                                                          # ir inst 79 fin
  sub t4, t5, t6                                                        # ir inst 80 fin
  sw t4, 0(a2)                                                          # ir inst 81 fin
  j .F.execute_action._27.if.exit.10                                    # ir inst 82 fin
.F.execute_action._27.if.exit.10:
  lw t5, 0(a2)                                                          # ir inst 83 fin
  li t2, 3
  rem t4, t5, t2                                                        # ir inst 84 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 85 fin
  bnez t5, .F.execute_action._28.if.then.11
  j .F.execute_action._29.if.else.11                                    # ir inst 86 fin
.F.execute_action._28.if.then.11:
  addi t5, t6, 1                                                        # ir inst 87 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, a1
  mv a1, t5
  call .F.fsm_add_event
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 88 fin
  j .F.execute_action._30.if.exit.11                                    # ir inst 89 fin
.F.execute_action._29.if.else.11:
  j .F.execute_action._30.if.exit.11                                    # ir inst 90 fin
.F.execute_action._30.if.exit.11:
  addi t5, t6, 1                                                        # ir inst 91 fin
# Phi connections
  mv t6, t5
  j .F.execute_action._23.while.cond.0                                  # ir inst 92 fin
.F.execute_action._31.while.exit.0:
  li a0, 6
  j .F.execute_action.epilogue                                          # ir inst 93 fin
.F.execute_action._32.if.else.9:
# Phi connections
  mv t5, a0
  li t6, 0
  j .F.execute_action._33.while.cond.1                                  # ir inst 94 fin
.F.execute_action._33.while.cond.1:
  li t2, 10
  rem t4, a0, t2                                                        # ir inst 97 fin
  slt t3, t6, t4                                                        # ir inst 98 fin
  bnez t3, .F.execute_action._34.while.body.1
  j .F.execute_action._38.while.exit.1                                  # ir inst 99 fin
.F.execute_action._34.while.body.1:
  slli t4, t5, 1                                                        # ir inst 100 fin
  lw t3, 0(a2)                                                          # ir inst 101 fin
  add s11, t4, t3                                                       # ir inst 102 fin
  li t2, 1000
  slt t4, t2, s11                                                       # ir inst 103 fin
  bnez t4, .F.execute_action._35.if.then.12
  j .F.execute_action._36.if.else.12                                    # ir inst 104 fin
.F.execute_action._35.if.then.12:
  li t2, 1000
  rem t4, s11, t2                                                       # ir inst 105 fin
# Phi connections
  j .F.execute_action._37.if.exit.12                                    # ir inst 106 fin
.F.execute_action._36.if.else.12:
# Phi connections
  mv t4, s11
  j .F.execute_action._37.if.exit.12                                    # ir inst 107 fin
.F.execute_action._37.if.exit.12:
  addi t3, t6, 1                                                        # ir inst 109 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.execute_action._33.while.cond.1                                  # ir inst 110 fin
.F.execute_action._38.while.exit.1:
  li t2, 100
  rem t6, t5, t2                                                        # ir inst 111 fin
  sw t6, 0(a2)                                                          # ir inst 112 fin
  j .F.execute_action.epilogue                                          # ir inst 113 fin
.F.execute_action._39.if.exit.9:
  j .F.execute_action._40.if.exit.6                                     # ir inst 114 fin
.F.execute_action._40.if.exit.6:
  j .F.execute_action._41.if.exit.5                                     # ir inst 115 fin
.F.execute_action._41.if.exit.5:
  j .F.execute_action._42.if.exit.3                                     # ir inst 116 fin
.F.execute_action._42.if.exit.3:
  j .F.execute_action._43.if.exit.2                                     # ir inst 117 fin
.F.execute_action._43.if.exit.2:
  j .F.execute_action._44.if.exit.1                                     # ir inst 118 fin
.F.execute_action._44.if.exit.1:
  j .F.execute_action._45.if.exit.0                                     # ir inst 119 fin
.F.execute_action._45.if.exit.0:
.F.execute_action.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.fsm_step
.F.fsm_step:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 3 / 12,        range:       48(sp) -       72(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 48(sp)
  sd s9, 56(sp)
  sd s10, 64(sp)
  sd ra, 72(sp)
.F.fsm_step._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F.fsm_get_event
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.fsm_step._1.if.then.0
  j .F.fsm_step._2.if.else.0                                            # ir inst 3 fin
.F.fsm_step._1.if.then.0:
  li a0, 0
  j .F.fsm_step.epilogue                                                # ir inst 4 fin
.F.fsm_step._2.if.else.0:
  j .F.fsm_step._3.if.exit.0                                            # ir inst 5 fin
.F.fsm_step._3.if.exit.0:
# Phi connections
  li t5, 0
  j .F.fsm_step._4.while.cond.0                                         # ir inst 6 fin
.F.fsm_step._4.while.cond.0:
  li t4, 4008
  add t4, a0, t4                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  slt t4, t5, t3                                                        # ir inst 10 fin
  bnez t4, .F.fsm_step._5.while.body.0
  j .F.fsm_step._15.while.exit.0                                        # ir inst 11 fin
.F.fsm_step._5.while.body.0:
  addi t4, a0, 8                                                        # ir inst 12 fin
  mv t3, t5                                                             # ir inst 13 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 14 fin
  addi t4, s11, 0                                                       # ir inst 15 fin
  lw t3, 0(t4)                                                          # ir inst 16 fin
  addi t4, a0, 0                                                        # ir inst 17 fin
  lw s10, 0(t4)                                                         # ir inst 18 fin
  xor t0, t3, s10
  sltiu t4, t0, 1                                                       # ir inst 19 fin
  bnez t4, .F.fsm_step._6.lazy.then.0
  j .F.fsm_step._7.lazy.else.0                                          # ir inst 20 fin
.F.fsm_step._6.lazy.then.0:
  addi t4, s11, 4                                                       # ir inst 21 fin
  lw t3, 0(t4)                                                          # ir inst 22 fin
  xor t0, t3, t6
  sltiu t4, t0, 1                                                       # ir inst 23 fin
# Phi connections
  j .F.fsm_step._8.lazy.exit.0                                          # ir inst 24 fin
.F.fsm_step._7.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.fsm_step._8.lazy.exit.0                                          # ir inst 25 fin
.F.fsm_step._8.lazy.exit.0:
  bnez t4, .F.fsm_step._9.if.then.1
  j .F.fsm_step._13.if.else.1                                           # ir inst 27 fin
.F.fsm_step._9.if.then.1:
  addi t4, s11, 16                                                      # ir inst 28 fin
  lw t3, 0(t4)                                                          # ir inst 29 fin
  addi t4, a0, 0                                                        # ir inst 30 fin
  lw s10, 0(t4)                                                         # ir inst 31 fin
  lw t4, 0(a1)                                                          # ir inst 32 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, t4
  mv a2, t6
  mv a1, s10
  mv a0, t3
  call .F.evaluate_condition
  mv s9, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 33 fin
  bnez s9, .F.fsm_step._10.if.then.2
  j .F.fsm_step._11.if.else.2                                           # ir inst 34 fin
.F.fsm_step._10.if.then.2:
  addi t4, a0, 4                                                        # ir inst 35 fin
  addi t3, a0, 0                                                        # ir inst 36 fin
  lw s10, 0(t3)                                                         # ir inst 37 fin
  sw s10, 0(t4)                                                         # ir inst 38 fin
  addi t4, a0, 0                                                        # ir inst 39 fin
  addi t3, s11, 8                                                       # ir inst 40 fin
  lw s10, 0(t3)                                                         # ir inst 41 fin
  sw s10, 0(t4)                                                         # ir inst 42 fin
  li t4, 4424
  add t4, a0, t4                                                        # ir inst 43 fin
  addi t3, a0, 0                                                        # ir inst 44 fin
  lw s10, 0(t3)                                                         # ir inst 45 fin
  mv t3, s10                                                            # ir inst 46 fin
  slli t2, t3, 2
  add s10, t4, t2                                                       # ir inst 47 fin
  li t4, 4424
  add t4, a0, t4                                                        # ir inst 48 fin
  addi t3, a0, 0                                                        # ir inst 49 fin
  lw s9, 0(t3)                                                          # ir inst 50 fin
  mv t3, s9                                                             # ir inst 51 fin
  slli t2, t3, 2
  add s9, t4, t2                                                        # ir inst 52 fin
  lw t4, 0(s9)                                                          # ir inst 53 fin
  addi t3, t4, 1                                                        # ir inst 54 fin
  sw t3, 0(s10)                                                         # ir inst 55 fin
  li t4, 4628
  add t4, a0, t4                                                        # ir inst 56 fin
  li t3, 4628
  add t3, a0, t3                                                        # ir inst 57 fin
  lw s10, 0(t3)                                                         # ir inst 58 fin
  addi t3, s10, 1                                                       # ir inst 59 fin
  sw t3, 0(t4)                                                          # ir inst 60 fin
  addi t4, s11, 12                                                      # ir inst 61 fin
  lw t3, 0(t4)                                                          # ir inst 62 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, a1
  mv a1, a0
  mv a0, t3
  call .F.execute_action
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 63 fin
  li a0, 1
  j .F.fsm_step.epilogue                                                # ir inst 64 fin
.F.fsm_step._11.if.else.2:
  j .F.fsm_step._12.if.exit.2                                           # ir inst 65 fin
.F.fsm_step._12.if.exit.2:
  j .F.fsm_step._14.if.exit.1                                           # ir inst 66 fin
.F.fsm_step._13.if.else.1:
  j .F.fsm_step._14.if.exit.1                                           # ir inst 67 fin
.F.fsm_step._14.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 68 fin
# Phi connections
  mv t5, t4
  j .F.fsm_step._4.while.cond.0                                         # ir inst 69 fin
.F.fsm_step._15.while.exit.0:
  li t6, 4624
  add t6, a0, t6                                                        # ir inst 70 fin
  li t5, 4624
  add t5, a0, t5                                                        # ir inst 71 fin
  lw t4, 0(t5)                                                          # ir inst 72 fin
  addi t5, t4, 1                                                        # ir inst 73 fin
  sw t5, 0(t6)                                                          # ir inst 74 fin
  li a0, 0
  j .F.fsm_step.epilogue                                                # ir inst 75 fin
.F.fsm_step.epilogue:
  ld ra, 72(sp)
  ld s11, 48(sp)
  ld s9, 56(sp)
  ld s10, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.init_protocol_parser
.F.init_protocol_parser:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_protocol_parser._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  addi t5, t6, 0                                                        # ir inst 4 fin
# Phi connections
  li t6, 0
  j .F.init_protocol_parser._1.array.cond.0                             # ir inst 5 fin
.F.init_protocol_parser._1.array.cond.0:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 7 fin
  bnez t4, .F.init_protocol_parser._2.array.body.0
  j .F.init_protocol_parser._3.array.exit.0                             # ir inst 8 fin
.F.init_protocol_parser._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t4
  j .F.init_protocol_parser._1.array.cond.0                             # ir inst 12 fin
.F.init_protocol_parser._3.array.exit.0:
  li t6, 4004
  add t6, a0, t6                                                        # ir inst 13 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 14 fin
  li t6, 4008
  add t6, a0, t6                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 18 fin
  li t6, 4016
  add t6, a0, t6                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 20 fin
  li t6, 4020
  add t6, a0, t6                                                        # ir inst 21 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 22 fin
  j .F.init_protocol_parser.epilogue                                    # ir inst 23 fin
.F.init_protocol_parser.epilogue:
  ret

.globl .F.parse_packet
.F.parse_packet:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.parse_packet._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.parse_packet._1.if.then.0
  j .F.parse_packet._5.if.else.0                                        # ir inst 4 fin
.F.parse_packet._1.if.then.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.parse_packet._2.if.then.1
  j .F.parse_packet._3.if.else.1                                        # ir inst 6 fin
.F.parse_packet._2.if.then.1:
  addi t6, a0, 0                                                        # ir inst 7 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 8 fin
  li t6, 4020
  add t6, a0, t6                                                        # ir inst 9 fin
  addi t5, a3, 1                                                        # ir inst 10 fin
  sw t5, 0(t6)                                                          # ir inst 11 fin
  li a0, 1
  j .F.parse_packet.epilogue                                            # ir inst 12 fin
.F.parse_packet._3.if.else.1:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 13 fin
  li t5, 4012
  add t5, a0, t5                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  addi t5, t4, 1                                                        # ir inst 16 fin
  sw t5, 0(t6)                                                          # ir inst 17 fin
  li a0, -1
  j .F.parse_packet.epilogue                                            # ir inst 18 fin
.F.parse_packet._4.if.exit.1:
  j .F.parse_packet._48.if.exit.0                                       # ir inst 19 fin
.F.parse_packet._5.if.else.0:
  addi t6, a0, 0                                                        # ir inst 20 fin
  lw t5, 0(t6)                                                          # ir inst 21 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 22 fin
  bnez t6, .F.parse_packet._6.if.then.2
  j .F.parse_packet._16.if.else.2                                       # ir inst 23 fin
.F.parse_packet._6.if.then.2:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 24 fin
  bnez t6, .F.parse_packet._7.lazy.then.0
  j .F.parse_packet._8.lazy.else.0                                      # ir inst 25 fin
.F.parse_packet._7.lazy.then.0:
  li t6, 4020
  add t6, a0, t6                                                        # ir inst 26 fin
  lw t5, 0(t6)                                                          # ir inst 27 fin
  xor t0, a3, t5
  sltiu t6, t0, 1                                                       # ir inst 28 fin
# Phi connections
  j .F.parse_packet._9.lazy.exit.0                                      # ir inst 29 fin
.F.parse_packet._8.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.parse_packet._9.lazy.exit.0                                      # ir inst 30 fin
.F.parse_packet._9.lazy.exit.0:
  bnez t6, .F.parse_packet._10.if.then.3
  j .F.parse_packet._11.if.else.3                                       # ir inst 32 fin
.F.parse_packet._10.if.then.3:
  addi t6, a0, 0                                                        # ir inst 33 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 34 fin
  li t6, 4020
  add t6, a0, t6                                                        # ir inst 35 fin
  addi t5, a3, 1                                                        # ir inst 36 fin
  sw t5, 0(t6)                                                          # ir inst 37 fin
  li a0, 2
  j .F.parse_packet.epilogue                                            # ir inst 38 fin
.F.parse_packet._11.if.else.3:
  li t2, 5
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 39 fin
  bnez t6, .F.parse_packet._12.if.then.4
  j .F.parse_packet._13.if.else.4                                       # ir inst 40 fin
.F.parse_packet._12.if.then.4:
  addi t6, a0, 0                                                        # ir inst 41 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 42 fin
  li a0, 0
  j .F.parse_packet.epilogue                                            # ir inst 43 fin
.F.parse_packet._13.if.else.4:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 44 fin
  li t5, 4012
  add t5, a0, t5                                                        # ir inst 45 fin
  lw t4, 0(t5)                                                          # ir inst 46 fin
  addi t5, t4, 1                                                        # ir inst 47 fin
  sw t5, 0(t6)                                                          # ir inst 48 fin
  li a0, -1
  j .F.parse_packet.epilogue                                            # ir inst 49 fin
.F.parse_packet._14.if.exit.4:
  j .F.parse_packet._15.if.exit.3                                       # ir inst 50 fin
.F.parse_packet._15.if.exit.3:
  j .F.parse_packet._47.if.exit.2                                       # ir inst 51 fin
.F.parse_packet._16.if.else.2:
  addi t6, a0, 0                                                        # ir inst 52 fin
  lw t5, 0(t6)                                                          # ir inst 53 fin
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 54 fin
  bnez t6, .F.parse_packet._17.if.then.5
  j .F.parse_packet._36.if.else.5                                       # ir inst 55 fin
.F.parse_packet._17.if.then.5:
  li t2, 3
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 56 fin
  bnez t6, .F.parse_packet._18.if.then.6
  j .F.parse_packet._25.if.else.6                                       # ir inst 57 fin
.F.parse_packet._18.if.then.6:
  li t6, 4020
  add t6, a0, t6                                                        # ir inst 58 fin
  lw t5, 0(t6)                                                          # ir inst 59 fin
  xor t0, a3, t5
  sltiu t6, t0, 1                                                       # ir inst 60 fin
  bnez t6, .F.parse_packet._19.if.then.7
  j .F.parse_packet._23.if.else.7                                       # ir inst 61 fin
.F.parse_packet._19.if.then.7:
  li t6, 4004
  add t6, a0, t6                                                        # ir inst 62 fin
  lw t5, 0(t6)                                                          # ir inst 63 fin
  li t1, 1000
  mv t6, t1                                                             # ir inst 64 fin
  slt t4, t5, t6                                                        # ir inst 65 fin
  bnez t4, .F.parse_packet._20.if.then.8
  j .F.parse_packet._21.if.else.8                                       # ir inst 66 fin
.F.parse_packet._20.if.then.8:
  addi t6, a0, 4                                                        # ir inst 67 fin
  li t5, 4004
  add t5, a0, t5                                                        # ir inst 68 fin
  lw t4, 0(t5)                                                          # ir inst 69 fin
  mv t5, t4                                                             # ir inst 70 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 71 fin
  sw a2, 0(t4)                                                          # ir inst 72 fin
  li t6, 4004
  add t6, a0, t6                                                        # ir inst 73 fin
  li t5, 4004
  add t5, a0, t5                                                        # ir inst 74 fin
  lw t4, 0(t5)                                                          # ir inst 75 fin
  addi t5, t4, 1                                                        # ir inst 76 fin
  sw t5, 0(t6)                                                          # ir inst 77 fin
  j .F.parse_packet._22.if.exit.8                                       # ir inst 78 fin
.F.parse_packet._21.if.else.8:
  j .F.parse_packet._22.if.exit.8                                       # ir inst 79 fin
.F.parse_packet._22.if.exit.8:
  li t6, 4020
  add t6, a0, t6                                                        # ir inst 80 fin
  addi t5, a3, 1                                                        # ir inst 81 fin
  sw t5, 0(t6)                                                          # ir inst 82 fin
  li t6, 4008
  add t6, a0, t6                                                        # ir inst 83 fin
  li t5, 4008
  add t5, a0, t5                                                        # ir inst 84 fin
  lw t4, 0(t5)                                                          # ir inst 85 fin
  addi t5, t4, 1                                                        # ir inst 86 fin
  sw t5, 0(t6)                                                          # ir inst 87 fin
  li a0, 3
  j .F.parse_packet.epilogue                                            # ir inst 88 fin
.F.parse_packet._23.if.else.7:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 89 fin
  li t5, 4012
  add t5, a0, t5                                                        # ir inst 90 fin
  lw t4, 0(t5)                                                          # ir inst 91 fin
  addi t5, t4, 1                                                        # ir inst 92 fin
  sw t5, 0(t6)                                                          # ir inst 93 fin
  li a0, 4
  j .F.parse_packet.epilogue                                            # ir inst 94 fin
.F.parse_packet._24.if.exit.7:
  j .F.parse_packet._35.if.exit.6                                       # ir inst 95 fin
.F.parse_packet._25.if.else.6:
  li t2, 4
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 96 fin
  bnez t6, .F.parse_packet._26.if.then.9
  j .F.parse_packet._27.if.else.9                                       # ir inst 97 fin
.F.parse_packet._26.if.then.9:
  addi t6, a0, 0                                                        # ir inst 98 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 99 fin
  li a0, 5
  j .F.parse_packet.epilogue                                            # ir inst 100 fin
.F.parse_packet._27.if.else.9:
  li t2, 6
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 101 fin
  bnez t6, .F.parse_packet._28.if.then.10
  j .F.parse_packet._29.if.else.10                                      # ir inst 102 fin
.F.parse_packet._28.if.then.10:
  li a0, 6
  j .F.parse_packet.epilogue                                            # ir inst 103 fin
.F.parse_packet._29.if.else.10:
  li t2, 5
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 104 fin
  bnez t6, .F.parse_packet._30.if.then.11
  j .F.parse_packet._31.if.else.11                                      # ir inst 105 fin
.F.parse_packet._30.if.then.11:
  addi t6, a0, 0                                                        # ir inst 106 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 107 fin
  li t6, 4004
  add t6, a0, t6                                                        # ir inst 108 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 109 fin
  li a0, 0
  j .F.parse_packet.epilogue                                            # ir inst 110 fin
.F.parse_packet._31.if.else.11:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 111 fin
  li t5, 4012
  add t5, a0, t5                                                        # ir inst 112 fin
  lw t4, 0(t5)                                                          # ir inst 113 fin
  addi t5, t4, 1                                                        # ir inst 114 fin
  sw t5, 0(t6)                                                          # ir inst 115 fin
  li a0, -1
  j .F.parse_packet.epilogue                                            # ir inst 116 fin
.F.parse_packet._32.if.exit.11:
  j .F.parse_packet._33.if.exit.10                                      # ir inst 117 fin
.F.parse_packet._33.if.exit.10:
  j .F.parse_packet._34.if.exit.9                                       # ir inst 118 fin
.F.parse_packet._34.if.exit.9:
  j .F.parse_packet._35.if.exit.6                                       # ir inst 119 fin
.F.parse_packet._35.if.exit.6:
  j .F.parse_packet._46.if.exit.5                                       # ir inst 120 fin
.F.parse_packet._36.if.else.5:
  addi t6, a0, 0                                                        # ir inst 121 fin
  lw t5, 0(t6)                                                          # ir inst 122 fin
  li t2, 3
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 123 fin
  bnez t6, .F.parse_packet._37.if.then.12
  j .F.parse_packet._44.if.else.12                                      # ir inst 124 fin
.F.parse_packet._37.if.then.12:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 125 fin
  bnez t6, .F.parse_packet._38.if.then.13
  j .F.parse_packet._39.if.else.13                                      # ir inst 126 fin
.F.parse_packet._38.if.then.13:
  addi t6, a0, 0                                                        # ir inst 127 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 128 fin
  li t6, 4004
  add t6, a0, t6                                                        # ir inst 129 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 130 fin
  li a0, 7
  j .F.parse_packet.epilogue                                            # ir inst 131 fin
.F.parse_packet._39.if.else.13:
  li t2, 5
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 132 fin
  bnez t6, .F.parse_packet._40.if.then.14
  j .F.parse_packet._41.if.else.14                                      # ir inst 133 fin
.F.parse_packet._40.if.then.14:
  addi t6, a0, 0                                                        # ir inst 134 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 135 fin
  li t6, 4004
  add t6, a0, t6                                                        # ir inst 136 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 137 fin
  li a0, 0
  j .F.parse_packet.epilogue                                            # ir inst 138 fin
.F.parse_packet._41.if.else.14:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 139 fin
  li t5, 4012
  add t5, a0, t5                                                        # ir inst 140 fin
  lw t4, 0(t5)                                                          # ir inst 141 fin
  addi t5, t4, 1                                                        # ir inst 142 fin
  sw t5, 0(t6)                                                          # ir inst 143 fin
  li a0, -1
  j .F.parse_packet.epilogue                                            # ir inst 144 fin
.F.parse_packet._42.if.exit.14:
  j .F.parse_packet._43.if.exit.13                                      # ir inst 145 fin
.F.parse_packet._43.if.exit.13:
  j .F.parse_packet._45.if.exit.12                                      # ir inst 146 fin
.F.parse_packet._44.if.else.12:
  li t6, 4012
  add t6, a0, t6                                                        # ir inst 147 fin
  li t5, 4012
  add t5, a0, t5                                                        # ir inst 148 fin
  lw t4, 0(t5)                                                          # ir inst 149 fin
  addi t5, t4, 1                                                        # ir inst 150 fin
  sw t5, 0(t6)                                                          # ir inst 151 fin
  addi t6, a0, 0                                                        # ir inst 152 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 153 fin
  li a0, -1
  j .F.parse_packet.epilogue                                            # ir inst 154 fin
.F.parse_packet._45.if.exit.12:
  j .F.parse_packet._46.if.exit.5                                       # ir inst 155 fin
.F.parse_packet._46.if.exit.5:
  j .F.parse_packet._47.if.exit.2                                       # ir inst 156 fin
.F.parse_packet._47.if.exit.2:
  j .F.parse_packet._48.if.exit.0                                       # ir inst 157 fin
.F.parse_packet._48.if.exit.0:
.F.parse_packet.epilogue:
  ret

.globl .F.init_task_scheduler
.F.init_task_scheduler:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 28,                 range:       40(sp) -       68(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 32(sp)
.F.init_task_scheduler._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 3 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 4 fin
  addi t1, sp, 40
  addi t5, t1, 4                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 6 fin
  addi t1, sp, 40
  addi t5, t1, 8                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 8 fin
  addi t1, sp, 40
  addi t5, t1, 12                                                       # ir inst 9 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 10 fin
  addi t1, sp, 40
  addi t5, t1, 16                                                       # ir inst 11 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 12 fin
  addi t1, sp, 40
  addi t5, t1, 20                                                       # ir inst 13 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 14 fin
  addi t1, sp, 40
  addi t5, t1, 24                                                       # ir inst 15 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 16 fin
  addi t5, t6, 0                                                        # ir inst 17 fin
# Phi connections
  li t6, 0
  j .F.init_task_scheduler._1.array.cond.0                              # ir inst 18 fin
.F.init_task_scheduler._1.array.cond.0:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 20 fin
  bnez t4, .F.init_task_scheduler._2.array.body.0
  j .F.init_task_scheduler._3.array.exit.0                              # ir inst 21 fin
.F.init_task_scheduler._2.array.body.0:
  li t1, 28
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 28
  addi t1, sp, 40
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 23 fin
  addi t4, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t6, t4
  j .F.init_task_scheduler._1.array.cond.0                              # ir inst 25 fin
.F.init_task_scheduler._3.array.exit.0:
  li t6, 2800
  add t6, a0, t6                                                        # ir inst 26 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 27 fin
  li t6, 2804
  add t6, a0, t6                                                        # ir inst 28 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 29 fin
  li t6, 2808
  add t6, a0, t6                                                        # ir inst 30 fin
  addi t5, t6, 0                                                        # ir inst 31 fin
# Phi connections
  li t6, 0
  j .F.init_task_scheduler._4.array.cond.1                              # ir inst 32 fin
.F.init_task_scheduler._4.array.cond.1:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 34 fin
  bnez t4, .F.init_task_scheduler._5.array.body.1
  j .F.init_task_scheduler._6.array.exit.1                              # ir inst 35 fin
.F.init_task_scheduler._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 36 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 37 fin
  addi t4, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t6, t4
  j .F.init_task_scheduler._4.array.cond.1                              # ir inst 39 fin
.F.init_task_scheduler._6.array.exit.1:
  li t6, 3208
  add t6, a0, t6                                                        # ir inst 40 fin
  addi t5, t6, 0                                                        # ir inst 41 fin
# Phi connections
  li t6, 0
  j .F.init_task_scheduler._7.array.cond.2                              # ir inst 42 fin
.F.init_task_scheduler._7.array.cond.2:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 44 fin
  bnez t4, .F.init_task_scheduler._8.array.body.2
  j .F.init_task_scheduler._9.array.exit.2                              # ir inst 45 fin
.F.init_task_scheduler._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 46 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 47 fin
  addi t4, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t6, t4
  j .F.init_task_scheduler._7.array.cond.2                              # ir inst 49 fin
.F.init_task_scheduler._9.array.exit.2:
  li t6, 3608
  add t6, a0, t6                                                        # ir inst 50 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 51 fin
  li t6, 3612
  add t6, a0, t6                                                        # ir inst 52 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 53 fin
  li t6, 3616
  add t6, a0, t6                                                        # ir inst 54 fin
  li t1, 10
  sw t1, 0(t6)                                                          # ir inst 55 fin
  li t6, 3620
  add t6, a0, t6                                                        # ir inst 56 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 57 fin
  j .F.init_task_scheduler.epilogue                                     # ir inst 58 fin
.F.init_task_scheduler.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 80
  ret

.globl .F.add_task
.F.add_task:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 28,                 range:       64(sp) -       92(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.add_task._0.entry.0:
  li t6, 2800
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t1, 100
  mv t6, t1                                                             # ir inst 3 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.add_task._1.if.then.0
  j .F.add_task._2.if.else.0                                            # ir inst 5 fin
.F.add_task._1.if.then.0:
  li a0, -1
  j .F.add_task.epilogue                                                # ir inst 6 fin
.F.add_task._2.if.else.0:
  j .F.add_task._3.if.exit.0                                            # ir inst 7 fin
.F.add_task._3.if.exit.0:
  li t6, 2800
  add t6, a0, t6                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  addi t6, a0, 0                                                        # ir inst 10 fin
  mv t4, t5                                                             # ir inst 11 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 12 fin
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 14 fin
  sw t5, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 64
  addi t6, t1, 4                                                        # ir inst 16 fin
  sw a1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 64
  addi t6, t1, 8                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 64
  addi t6, t1, 12                                                       # ir inst 20 fin
  sw a2, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 64
  addi t6, t1, 16                                                       # ir inst 22 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 64
  addi t6, t1, 20                                                       # ir inst 24 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t1, sp, 64
  addi t6, t1, 24                                                       # ir inst 26 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t5, 24(sp)
  li a2, 28
  addi t1, sp, 64
  mv a1, t1
  mv a0, t3
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t5, 24(sp)
# ir inst 28 fin
# Phi connections
  li t6, 0
  j .F.add_task._4.while.cond.0                                         # ir inst 29 fin
.F.add_task._4.while.cond.0:
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 31 fin
  lw t3, 0(t4)                                                          # ir inst 32 fin
  slt t4, t6, t3                                                        # ir inst 33 fin
  bnez t4, .F.add_task._5.while.body.0
  j .F.add_task._13.critical_edge.0                                     # ir inst 34 fin
.F.add_task._5.while.body.0:
  li t4, 2808
  add t4, a0, t4                                                        # ir inst 35 fin
  mv t3, t6                                                             # ir inst 36 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 37 fin
  lw t4, 0(s11)                                                         # ir inst 38 fin
  addi t3, a0, 0                                                        # ir inst 39 fin
  mv s11, t4                                                            # ir inst 40 fin
  li t1, 28
  mul t2, s11, t1
  add t4, t3, t2                                                        # ir inst 41 fin
  addi t3, t4, 4                                                        # ir inst 42 fin
  lw t4, 0(t3)                                                          # ir inst 43 fin
  slt t3, t4, a1                                                        # ir inst 44 fin
  bnez t3, .F.add_task._6.if.then.1
  j .F.add_task._7.if.else.1                                            # ir inst 45 fin
.F.add_task._6.if.then.1:
  j .F.add_task._9.while.exit.0                                         # ir inst 46 fin
.F.add_task._7.if.else.1:
  j .F.add_task._8.if.exit.1                                            # ir inst 47 fin
.F.add_task._8.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t6, t4
  j .F.add_task._4.while.cond.0                                         # ir inst 49 fin
.F.add_task._9.while.exit.0:
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 50 fin
  lw t3, 0(t4)                                                          # ir inst 51 fin
# Phi connections
  mv t4, t3
  j .F.add_task._10.while.cond.1                                        # ir inst 52 fin
.F.add_task._10.while.cond.1:
  slt t3, t6, t4                                                        # ir inst 54 fin
  bnez t3, .F.add_task._11.while.body.1
  j .F.add_task._12.while.exit.1                                        # ir inst 55 fin
.F.add_task._11.while.body.1:
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 56 fin
  mv s11, t4                                                            # ir inst 57 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 58 fin
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 59 fin
  mv s11, t4                                                            # ir inst 60 fin
  addi s9, s11, -1                                                      # ir inst 61 fin
  slli t2, s9, 2
  add s11, t3, t2                                                       # ir inst 62 fin
  lw t3, 0(s11)                                                         # ir inst 63 fin
  sw t3, 0(s10)                                                         # ir inst 64 fin
  addi t3, t4, -1                                                       # ir inst 65 fin
# Phi connections
  mv t4, t3
  j .F.add_task._10.while.cond.1                                        # ir inst 66 fin
.F.add_task._12.while.exit.1:
  li t4, 2808
  add t4, a0, t4                                                        # ir inst 67 fin
  mv t3, t6                                                             # ir inst 68 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 69 fin
  sw t5, 0(s11)                                                         # ir inst 70 fin
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 71 fin
  li t3, 3608
  add t3, a0, t3                                                        # ir inst 72 fin
  lw s11, 0(t3)                                                         # ir inst 73 fin
  addi t3, s11, 1                                                       # ir inst 74 fin
  sw t3, 0(t4)                                                          # ir inst 75 fin
  li t4, 2800
  add t4, a0, t4                                                        # ir inst 76 fin
  li t3, 2800
  add t3, a0, t3                                                        # ir inst 77 fin
  lw s11, 0(t3)                                                         # ir inst 78 fin
  addi t3, s11, 1                                                       # ir inst 79 fin
  sw t3, 0(t4)                                                          # ir inst 80 fin
  mv a0, t5
  j .F.add_task.epilogue                                                # ir inst 81 fin
.F.add_task._13.critical_edge.0:
  j .F.add_task._9.while.exit.0                                         # ir inst 82 fin
.F.add_task.epilogue:
  ld ra, 56(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 96
  ret

.globl .F.schedule_next_task
.F.schedule_next_task:
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
.F.schedule_next_task._0.entry.0:
  li t6, 3620
  add t6, a0, t6                                                        # ir inst 1 fin
  li t5, 3620
  add t5, a0, t5                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  addi t5, t4, 1                                                        # ir inst 4 fin
  sw t5, 0(t6)                                                          # ir inst 5 fin
  li t6, 2804
  add t6, a0, t6                                                        # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t5, t2
  sltu t6, zero, t0                                                     # ir inst 8 fin
  bnez t6, .F.schedule_next_task._1.if.then.0
  j .F.schedule_next_task._32.if.else.0                                 # ir inst 9 fin
.F.schedule_next_task._1.if.then.0:
  li t6, 2804
  add t6, a0, t6                                                        # ir inst 10 fin
  lw t5, 0(t6)                                                          # ir inst 11 fin
  addi t6, a0, 0                                                        # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 14 fin
  addi t6, t3, 12                                                       # ir inst 15 fin
  addi t4, a0, 0                                                        # ir inst 16 fin
  mv t3, t5                                                             # ir inst 17 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 18 fin
  addi t4, s11, 12                                                      # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  addi t4, t3, -1                                                       # ir inst 21 fin
  sw t4, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 0                                                        # ir inst 23 fin
  mv t4, t5                                                             # ir inst 24 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 25 fin
  addi t6, t3, 24                                                       # ir inst 26 fin
  addi t4, a0, 0                                                        # ir inst 27 fin
  mv t3, t5                                                             # ir inst 28 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 29 fin
  addi t4, s11, 24                                                      # ir inst 30 fin
  lw t3, 0(t4)                                                          # ir inst 31 fin
  addi t4, t3, 1                                                        # ir inst 32 fin
  sw t4, 0(t6)                                                          # ir inst 33 fin
  addi t6, a0, 0                                                        # ir inst 34 fin
  mv t4, t5                                                             # ir inst 35 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 36 fin
  addi t6, t3, 12                                                       # ir inst 37 fin
  lw t4, 0(t6)                                                          # ir inst 38 fin
  li t2, 0
  slt t0, t2, t4
  xori t6, t0, 1                                                        # ir inst 39 fin
  bnez t6, .F.schedule_next_task._2.if.then.1
  j .F.schedule_next_task._3.if.else.1                                  # ir inst 40 fin
.F.schedule_next_task._2.if.then.1:
  addi t6, a0, 0                                                        # ir inst 41 fin
  mv t4, t5                                                             # ir inst 42 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 43 fin
  addi t6, t3, 8                                                        # ir inst 44 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 45 fin
  li t6, 2804
  add t6, a0, t6                                                        # ir inst 46 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 47 fin
  j .F.schedule_next_task._31.if.exit.1                                 # ir inst 48 fin
.F.schedule_next_task._3.if.else.1:
  li t6, 3608
  add t6, a0, t6                                                        # ir inst 49 fin
  lw t4, 0(t6)                                                          # ir inst 50 fin
  li t2, 0
  slt t6, t2, t4                                                        # ir inst 51 fin
  bnez t6, .F.schedule_next_task._4.if.then.2
  j .F.schedule_next_task._17.if.else.2                                 # ir inst 52 fin
.F.schedule_next_task._4.if.then.2:
  li t6, 2808
  add t6, a0, t6                                                        # ir inst 53 fin
  addi t4, t6, 0                                                        # ir inst 54 fin
  lw t6, 0(t4)                                                          # ir inst 55 fin
  addi t4, a0, 0                                                        # ir inst 56 fin
  mv t3, t5                                                             # ir inst 57 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 58 fin
  addi t4, s11, 4                                                       # ir inst 59 fin
  lw t3, 0(t4)                                                          # ir inst 60 fin
  addi t4, a0, 0                                                        # ir inst 61 fin
  mv s11, t6                                                            # ir inst 62 fin
  li t1, 28
  mul t2, s11, t1
  add t6, t4, t2                                                        # ir inst 63 fin
  addi t4, t6, 4                                                        # ir inst 64 fin
  lw t6, 0(t4)                                                          # ir inst 65 fin
  slt t4, t3, t6                                                        # ir inst 66 fin
  bnez t4, .F.schedule_next_task._5.if.then.3
  j .F.schedule_next_task._6.if.else.3                                  # ir inst 67 fin
.F.schedule_next_task._5.if.then.3:
# Phi connections
  li t6, 1
  j .F.schedule_next_task._16.if.exit.3                                 # ir inst 68 fin
.F.schedule_next_task._6.if.else.3:
  xor t0, t6, t3
  sltiu t4, t0, 1                                                       # ir inst 69 fin
  bnez t4, .F.schedule_next_task._7.if.then.4
  j .F.schedule_next_task._11.if.else.4                                 # ir inst 70 fin
.F.schedule_next_task._7.if.then.4:
  addi t6, a0, 0                                                        # ir inst 71 fin
  mv t4, t5                                                             # ir inst 72 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 73 fin
  addi t6, t3, 24                                                       # ir inst 74 fin
  lw t4, 0(t6)                                                          # ir inst 75 fin
  li t6, 3616
  add t6, a0, t6                                                        # ir inst 76 fin
  lw t3, 0(t6)                                                          # ir inst 77 fin
  rem t6, t4, t3                                                        # ir inst 78 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 79 fin
  bnez t4, .F.schedule_next_task._8.if.then.5
  j .F.schedule_next_task._9.if.else.5                                  # ir inst 80 fin
.F.schedule_next_task._8.if.then.5:
# Phi connections
  li t6, 1
  j .F.schedule_next_task._10.if.exit.5                                 # ir inst 81 fin
.F.schedule_next_task._9.if.else.5:
# Phi connections
  li t6, 0
  j .F.schedule_next_task._10.if.exit.5                                 # ir inst 82 fin
.F.schedule_next_task._10.if.exit.5:
# Phi connections
  j .F.schedule_next_task._15.if.exit.4                                 # ir inst 84 fin
.F.schedule_next_task._11.if.else.4:
  li t6, 3620
  add t6, a0, t6                                                        # ir inst 85 fin
  lw t4, 0(t6)                                                          # ir inst 86 fin
  li t2, 50
  rem t6, t4, t2                                                        # ir inst 87 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 88 fin
  bnez t4, .F.schedule_next_task._12.if.then.6
  j .F.schedule_next_task._13.if.else.6                                 # ir inst 89 fin
.F.schedule_next_task._12.if.then.6:
# Phi connections
  li t6, 1
  j .F.schedule_next_task._14.if.exit.6                                 # ir inst 90 fin
.F.schedule_next_task._13.if.else.6:
# Phi connections
  li t6, 0
  j .F.schedule_next_task._14.if.exit.6                                 # ir inst 91 fin
.F.schedule_next_task._14.if.exit.6:
# Phi connections
  j .F.schedule_next_task._15.if.exit.4                                 # ir inst 93 fin
.F.schedule_next_task._15.if.exit.4:
# Phi connections
  j .F.schedule_next_task._16.if.exit.3                                 # ir inst 95 fin
.F.schedule_next_task._16.if.exit.3:
# Phi connections
  j .F.schedule_next_task._18.if.exit.2                                 # ir inst 97 fin
.F.schedule_next_task._17.if.else.2:
# Phi connections
  li t6, 0
  j .F.schedule_next_task._18.if.exit.2                                 # ir inst 98 fin
.F.schedule_next_task._18.if.exit.2:
  bnez t6, .F.schedule_next_task._19.if.then.7
  j .F.schedule_next_task._29.if.else.7                                 # ir inst 100 fin
.F.schedule_next_task._19.if.then.7:
  addi t6, a0, 0                                                        # ir inst 101 fin
  mv t4, t5                                                             # ir inst 102 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 103 fin
  addi t6, t3, 8                                                        # ir inst 104 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 105 fin
# Phi connections
  li t6, 0
  j .F.schedule_next_task._20.while.cond.0                              # ir inst 106 fin
.F.schedule_next_task._20.while.cond.0:
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 108 fin
  lw t3, 0(t4)                                                          # ir inst 109 fin
  slt t4, t6, t3                                                        # ir inst 110 fin
  bnez t4, .F.schedule_next_task._21.while.body.0
  j .F.schedule_next_task._43.critical_edge.0                           # ir inst 111 fin
.F.schedule_next_task._21.while.body.0:
  li t4, 2808
  add t4, a0, t4                                                        # ir inst 112 fin
  mv t3, t6                                                             # ir inst 113 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 114 fin
  lw t4, 0(s11)                                                         # ir inst 115 fin
  addi t3, a0, 0                                                        # ir inst 116 fin
  mv s11, t4                                                            # ir inst 117 fin
  li t1, 28
  mul t2, s11, t1
  add t4, t3, t2                                                        # ir inst 118 fin
  addi t3, t4, 4                                                        # ir inst 119 fin
  lw t4, 0(t3)                                                          # ir inst 120 fin
  addi t3, a0, 0                                                        # ir inst 121 fin
  mv s11, t5                                                            # ir inst 122 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 123 fin
  addi t3, s10, 4                                                       # ir inst 124 fin
  lw s11, 0(t3)                                                         # ir inst 125 fin
  slt t3, t4, s11                                                       # ir inst 126 fin
  bnez t3, .F.schedule_next_task._22.if.then.8
  j .F.schedule_next_task._23.if.else.8                                 # ir inst 127 fin
.F.schedule_next_task._22.if.then.8:
  j .F.schedule_next_task._25.while.exit.0                              # ir inst 128 fin
.F.schedule_next_task._23.if.else.8:
  j .F.schedule_next_task._24.if.exit.8                                 # ir inst 129 fin
.F.schedule_next_task._24.if.exit.8:
  addi t4, t6, 1                                                        # ir inst 130 fin
# Phi connections
  mv t6, t4
  j .F.schedule_next_task._20.while.cond.0                              # ir inst 131 fin
.F.schedule_next_task._25.while.exit.0:
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 132 fin
  lw t3, 0(t4)                                                          # ir inst 133 fin
# Phi connections
  mv t4, t3
  j .F.schedule_next_task._26.while.cond.1                              # ir inst 134 fin
.F.schedule_next_task._26.while.cond.1:
  slt t3, t6, t4                                                        # ir inst 136 fin
  bnez t3, .F.schedule_next_task._27.while.body.1
  j .F.schedule_next_task._28.while.exit.1                              # ir inst 137 fin
.F.schedule_next_task._27.while.body.1:
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 138 fin
  mv s11, t4                                                            # ir inst 139 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 140 fin
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 141 fin
  mv s11, t4                                                            # ir inst 142 fin
  addi s9, s11, -1                                                      # ir inst 143 fin
  slli t2, s9, 2
  add s11, t3, t2                                                       # ir inst 144 fin
  lw t3, 0(s11)                                                         # ir inst 145 fin
  sw t3, 0(s10)                                                         # ir inst 146 fin
  addi t3, t4, -1                                                       # ir inst 147 fin
# Phi connections
  mv t4, t3
  j .F.schedule_next_task._26.while.cond.1                              # ir inst 148 fin
.F.schedule_next_task._28.while.exit.1:
  li t4, 2808
  add t4, a0, t4                                                        # ir inst 149 fin
  mv t3, t6                                                             # ir inst 150 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 151 fin
  sw t5, 0(s11)                                                         # ir inst 152 fin
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 153 fin
  li t3, 3608
  add t3, a0, t3                                                        # ir inst 154 fin
  lw s11, 0(t3)                                                         # ir inst 155 fin
  addi t3, s11, 1                                                       # ir inst 156 fin
  sw t3, 0(t4)                                                          # ir inst 157 fin
  li t4, 2804
  add t4, a0, t4                                                        # ir inst 158 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 159 fin
  j .F.schedule_next_task._30.if.exit.7                                 # ir inst 160 fin
.F.schedule_next_task._29.if.else.7:
  j .F.schedule_next_task._30.if.exit.7                                 # ir inst 161 fin
.F.schedule_next_task._30.if.exit.7:
  j .F.schedule_next_task._31.if.exit.1                                 # ir inst 162 fin
.F.schedule_next_task._31.if.exit.1:
  j .F.schedule_next_task._33.if.exit.0                                 # ir inst 163 fin
.F.schedule_next_task._32.if.else.0:
  j .F.schedule_next_task._33.if.exit.0                                 # ir inst 164 fin
.F.schedule_next_task._33.if.exit.0:
  li t4, 2804
  add t4, a0, t4                                                        # ir inst 165 fin
  lw t3, 0(t4)                                                          # ir inst 166 fin
  li t2, -1
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 167 fin
  bnez t4, .F.schedule_next_task._34.lazy.then.0
  j .F.schedule_next_task._35.lazy.else.0                               # ir inst 168 fin
.F.schedule_next_task._34.lazy.then.0:
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 169 fin
  lw t3, 0(t4)                                                          # ir inst 170 fin
  li t2, 0
  slt t4, t2, t3                                                        # ir inst 171 fin
# Phi connections
  j .F.schedule_next_task._36.lazy.exit.0                               # ir inst 172 fin
.F.schedule_next_task._35.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.schedule_next_task._36.lazy.exit.0                               # ir inst 173 fin
.F.schedule_next_task._36.lazy.exit.0:
  bnez t4, .F.schedule_next_task._37.if.then.9
  j .F.schedule_next_task._41.if.else.9                                 # ir inst 175 fin
.F.schedule_next_task._37.if.then.9:
  li t4, 2804
  add t4, a0, t4                                                        # ir inst 176 fin
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 177 fin
  addi s11, t3, 0                                                       # ir inst 178 fin
  lw t3, 0(s11)                                                         # ir inst 179 fin
  sw t3, 0(t4)                                                          # ir inst 180 fin
  addi t4, a0, 0                                                        # ir inst 181 fin
  li t3, 2804
  add t3, a0, t3                                                        # ir inst 182 fin
  lw s11, 0(t3)                                                         # ir inst 183 fin
  mv t3, s11                                                            # ir inst 184 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 185 fin
  addi t4, s11, 8                                                       # ir inst 186 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 187 fin
# Phi connections
  li t4, 0
  j .F.schedule_next_task._38.while.cond.2                              # ir inst 188 fin
.F.schedule_next_task._38.while.cond.2:
  li t3, 3608
  add t3, a0, t3                                                        # ir inst 190 fin
  lw s11, 0(t3)                                                         # ir inst 191 fin
  addi t3, s11, -1                                                      # ir inst 192 fin
  slt s11, t4, t3                                                       # ir inst 193 fin
  bnez s11, .F.schedule_next_task._39.while.body.2
  j .F.schedule_next_task._40.while.exit.2                              # ir inst 194 fin
.F.schedule_next_task._39.while.body.2:
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 195 fin
  mv s11, t4                                                            # ir inst 196 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 197 fin
  li t3, 2808
  add t3, a0, t3                                                        # ir inst 198 fin
  mv s11, t4                                                            # ir inst 199 fin
  addi s9, s11, 1                                                       # ir inst 200 fin
  slli t2, s9, 2
  add s11, t3, t2                                                       # ir inst 201 fin
  lw t3, 0(s11)                                                         # ir inst 202 fin
  sw t3, 0(s10)                                                         # ir inst 203 fin
  addi t3, t4, 1                                                        # ir inst 204 fin
# Phi connections
  mv t4, t3
  j .F.schedule_next_task._38.while.cond.2                              # ir inst 205 fin
.F.schedule_next_task._40.while.exit.2:
  li t4, 3608
  add t4, a0, t4                                                        # ir inst 206 fin
  li t3, 3608
  add t3, a0, t3                                                        # ir inst 207 fin
  lw s11, 0(t3)                                                         # ir inst 208 fin
  addi t3, s11, -1                                                      # ir inst 209 fin
  sw t3, 0(t4)                                                          # ir inst 210 fin
  j .F.schedule_next_task._42.if.exit.9                                 # ir inst 211 fin
.F.schedule_next_task._41.if.else.9:
  j .F.schedule_next_task._42.if.exit.9                                 # ir inst 212 fin
.F.schedule_next_task._42.if.exit.9:
  li t4, 2804
  add t4, a0, t4                                                        # ir inst 213 fin
  lw t3, 0(t4)                                                          # ir inst 214 fin
  mv a0, t3
  j .F.schedule_next_task.epilogue                                      # ir inst 215 fin
.F.schedule_next_task._43.critical_edge.0:
  j .F.schedule_next_task._25.while.exit.0                              # ir inst 216 fin
.F.schedule_next_task.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.complex_nested_control_flow
.F.complex_nested_control_flow:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.complex_nested_control_flow._0.entry.0:
  li t2, 0
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.complex_nested_control_flow._1.if.then.0
  j .F.complex_nested_control_flow._2.if.else.0                         # ir inst 2 fin
.F.complex_nested_control_flow._1.if.then.0:
  mv a0, a1
  j .F.complex_nested_control_flow.epilogue                             # ir inst 3 fin
.F.complex_nested_control_flow._2.if.else.0:
  j .F.complex_nested_control_flow._3.if.exit.0                         # ir inst 4 fin
.F.complex_nested_control_flow._3.if.exit.0:
  li t2, 7
  rem t6, a0, t2                                                        # ir inst 5 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.complex_nested_control_flow._4.if.then.1
  j .F.complex_nested_control_flow._59.if.else.1                        # ir inst 7 fin
.F.complex_nested_control_flow._4.if.then.1:
  li t2, 100
  slt t6, t2, a1                                                        # ir inst 8 fin
  bnez t6, .F.complex_nested_control_flow._5.if.then.2
  j .F.complex_nested_control_flow._42.if.else.2                        # ir inst 9 fin
.F.complex_nested_control_flow._5.if.then.2:
  li t2, 3
  rem t6, a1, t2                                                        # ir inst 10 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 11 fin
  bnez t5, .F.complex_nested_control_flow._6.if.then.3
  j .F.complex_nested_control_flow._22.if.else.3                        # ir inst 12 fin
.F.complex_nested_control_flow._6.if.then.3:
# Phi connections
  li t5, 0
  mv t6, a1
  j .F.complex_nested_control_flow._7.while.cond.0                      # ir inst 13 fin
.F.complex_nested_control_flow._7.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 16 fin
  bnez t4, .F.complex_nested_control_flow._8.while.body.0
  j .F.complex_nested_control_flow._21.while.exit.0                     # ir inst 17 fin
.F.complex_nested_control_flow._8.while.body.0:
  li t2, 2
  rem t4, t5, t2                                                        # ir inst 18 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 19 fin
  bnez t3, .F.complex_nested_control_flow._9.if.then.4
  j .F.complex_nested_control_flow._16.if.else.4                        # ir inst 20 fin
.F.complex_nested_control_flow._9.if.then.4:
  slli t4, t5, 1                                                        # ir inst 21 fin
  add t3, t6, t4                                                        # ir inst 22 fin
  li t2, 1000
  slt t4, t2, t3                                                        # ir inst 23 fin
  bnez t4, .F.complex_nested_control_flow._10.if.then.5
  j .F.complex_nested_control_flow._14.if.else.5                        # ir inst 24 fin
.F.complex_nested_control_flow._10.if.then.5:
  li t2, 1000
  rem t4, t3, t2                                                        # ir inst 25 fin
  li t2, 100
  slt s11, t4, t2                                                       # ir inst 26 fin
  bnez s11, .F.complex_nested_control_flow._11.if.then.6
  j .F.complex_nested_control_flow._12.if.else.6                        # ir inst 27 fin
.F.complex_nested_control_flow._11.if.then.6:
  addi s11, t4, 50                                                      # ir inst 28 fin
# Phi connections
  mv t4, s11
  j .F.complex_nested_control_flow._13.if.exit.6                        # ir inst 29 fin
.F.complex_nested_control_flow._12.if.else.6:
# Phi connections
  j .F.complex_nested_control_flow._13.if.exit.6                        # ir inst 30 fin
.F.complex_nested_control_flow._13.if.exit.6:
# Phi connections
  j .F.complex_nested_control_flow._15.if.exit.5                        # ir inst 32 fin
.F.complex_nested_control_flow._14.if.else.5:
# Phi connections
  mv t4, t3
  j .F.complex_nested_control_flow._15.if.exit.5                        # ir inst 33 fin
.F.complex_nested_control_flow._15.if.exit.5:
# Phi connections
  j .F.complex_nested_control_flow._20.if.exit.4                        # ir inst 35 fin
.F.complex_nested_control_flow._16.if.else.4:
  sub t4, t6, t5                                                        # ir inst 36 fin
  li t2, 0
  slt t3, t4, t2                                                        # ir inst 37 fin
  bnez t3, .F.complex_nested_control_flow._17.if.then.7
  j .F.complex_nested_control_flow._18.if.else.7                        # ir inst 38 fin
.F.complex_nested_control_flow._17.if.then.7:
  li t1, 0
  sub t3, t1, t4                                                        # ir inst 39 fin
# Phi connections
  mv t4, t3
  j .F.complex_nested_control_flow._19.if.exit.7                        # ir inst 40 fin
.F.complex_nested_control_flow._18.if.else.7:
# Phi connections
  j .F.complex_nested_control_flow._19.if.exit.7                        # ir inst 41 fin
.F.complex_nested_control_flow._19.if.exit.7:
# Phi connections
  j .F.complex_nested_control_flow._20.if.exit.4                        # ir inst 43 fin
.F.complex_nested_control_flow._20.if.exit.4:
  addi t3, t5, 1                                                        # ir inst 45 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.complex_nested_control_flow._7.while.cond.0                      # ir inst 46 fin
.F.complex_nested_control_flow._21.while.exit.0:
# Phi connections
  mv t5, t6
  j .F.complex_nested_control_flow._41.if.exit.3                        # ir inst 47 fin
.F.complex_nested_control_flow._22.if.else.3:
  li t2, 3
  rem t6, a1, t2                                                        # ir inst 48 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 49 fin
  bnez t5, .F.complex_nested_control_flow._23.if.then.8
  j .F.complex_nested_control_flow._39.if.else.8                        # ir inst 50 fin
.F.complex_nested_control_flow._23.if.then.8:
# Phi connections
  mv t5, a0
  mv t6, a1
  j .F.complex_nested_control_flow._24.while.cond.1                     # ir inst 51 fin
.F.complex_nested_control_flow._24.while.cond.1:
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 54 fin
  bnez t4, .F.complex_nested_control_flow._25.while.body.1
  j .F.complex_nested_control_flow._67.critical_edge.0                  # ir inst 55 fin
.F.complex_nested_control_flow._25.while.body.1:
  li t2, 4
  rem t4, t5, t2                                                        # ir inst 56 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 57 fin
  bnez t3, .F.complex_nested_control_flow._26.if.then.9
  j .F.complex_nested_control_flow._27.if.else.9                        # ir inst 58 fin
.F.complex_nested_control_flow._26.if.then.9:
  slli t4, t6, 1                                                        # ir inst 59 fin
# Phi connections
  j .F.complex_nested_control_flow._34.if.exit.9                        # ir inst 60 fin
.F.complex_nested_control_flow._27.if.else.9:
  li t2, 4
  rem t4, t5, t2                                                        # ir inst 61 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 62 fin
  bnez t3, .F.complex_nested_control_flow._28.if.then.10
  j .F.complex_nested_control_flow._29.if.else.10                       # ir inst 63 fin
.F.complex_nested_control_flow._28.if.then.10:
  add t4, t6, t5                                                        # ir inst 64 fin
# Phi connections
  j .F.complex_nested_control_flow._33.if.exit.10                       # ir inst 65 fin
.F.complex_nested_control_flow._29.if.else.10:
  li t2, 4
  rem t4, t5, t2                                                        # ir inst 66 fin
  li t2, 2
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 67 fin
  bnez t3, .F.complex_nested_control_flow._30.if.then.11
  j .F.complex_nested_control_flow._31.if.else.11                       # ir inst 68 fin
.F.complex_nested_control_flow._30.if.then.11:
  sub t4, t6, t5                                                        # ir inst 69 fin
# Phi connections
  j .F.complex_nested_control_flow._32.if.exit.11                       # ir inst 70 fin
.F.complex_nested_control_flow._31.if.else.11:
  li t2, 2
  div t4, t6, t2                                                        # ir inst 71 fin
# Phi connections
  j .F.complex_nested_control_flow._32.if.exit.11                       # ir inst 72 fin
.F.complex_nested_control_flow._32.if.exit.11:
# Phi connections
  j .F.complex_nested_control_flow._33.if.exit.10                       # ir inst 74 fin
.F.complex_nested_control_flow._33.if.exit.10:
# Phi connections
  j .F.complex_nested_control_flow._34.if.exit.9                        # ir inst 76 fin
.F.complex_nested_control_flow._34.if.exit.9:
  li t2, 500
  slt t3, t2, t4                                                        # ir inst 78 fin
  bnez t3, .F.complex_nested_control_flow._35.if.then.12
  j .F.complex_nested_control_flow._36.if.else.12                       # ir inst 79 fin
.F.complex_nested_control_flow._35.if.then.12:
# Phi connections
  mv t5, t4
  j .F.complex_nested_control_flow._38.while.exit.1                     # ir inst 80 fin
.F.complex_nested_control_flow._36.if.else.12:
  j .F.complex_nested_control_flow._37.if.exit.12                       # ir inst 81 fin
.F.complex_nested_control_flow._37.if.exit.12:
  addi t3, t5, -1                                                       # ir inst 82 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.complex_nested_control_flow._24.while.cond.1                     # ir inst 83 fin
.F.complex_nested_control_flow._38.while.exit.1:
# Phi connections
  j .F.complex_nested_control_flow._40.if.exit.8                        # ir inst 85 fin
.F.complex_nested_control_flow._39.if.else.8:
  addi t5, a0, -1                                                       # ir inst 86 fin
  li t2, 2
  div t4, a1, t2                                                        # ir inst 87 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  mv a0, t5
  call .F.complex_nested_control_flow
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 88 fin
# Phi connections
  mv t5, t3
  j .F.complex_nested_control_flow._40.if.exit.8                        # ir inst 89 fin
.F.complex_nested_control_flow._40.if.exit.8:
# Phi connections
  j .F.complex_nested_control_flow._41.if.exit.3                        # ir inst 91 fin
.F.complex_nested_control_flow._41.if.exit.3:
# Phi connections
  j .F.complex_nested_control_flow._58.if.exit.2                        # ir inst 93 fin
.F.complex_nested_control_flow._42.if.else.2:
  li t2, 50
  slt t5, t2, a1                                                        # ir inst 94 fin
  bnez t5, .F.complex_nested_control_flow._43.if.then.13
  j .F.complex_nested_control_flow._56.if.else.13                       # ir inst 95 fin
.F.complex_nested_control_flow._43.if.then.13:
# Phi connections
  li t4, 0
  mv t5, a1
  j .F.complex_nested_control_flow._44.while.cond.2                     # ir inst 96 fin
.F.complex_nested_control_flow._44.while.cond.2:
  li t2, 10
  slt t3, t4, t2                                                        # ir inst 99 fin
  bnez t3, .F.complex_nested_control_flow._45.while.body.2
  j .F.complex_nested_control_flow._55.while.exit.2                     # ir inst 100 fin
.F.complex_nested_control_flow._45.while.body.2:
  li t2, 3
  rem t3, t4, t2                                                        # ir inst 101 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 102 fin
  bnez s11, .F.complex_nested_control_flow._46.if.then.14
  j .F.complex_nested_control_flow._47.if.else.14                       # ir inst 103 fin
.F.complex_nested_control_flow._46.if.then.14:
  mul t3, t4, a0                                                        # ir inst 104 fin
  add s11, t5, t3                                                       # ir inst 105 fin
# Phi connections
  mv t3, s11
  j .F.complex_nested_control_flow._54.if.exit.14                       # ir inst 106 fin
.F.complex_nested_control_flow._47.if.else.14:
  li t2, 3
  rem t3, t4, t2                                                        # ir inst 107 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 108 fin
  bnez s11, .F.complex_nested_control_flow._48.if.then.15
  j .F.complex_nested_control_flow._49.if.else.15                       # ir inst 109 fin
.F.complex_nested_control_flow._48.if.then.15:
  mul t3, t4, a0                                                        # ir inst 110 fin
  sub s11, t5, t3                                                       # ir inst 111 fin
# Phi connections
  mv t3, s11
  j .F.complex_nested_control_flow._53.if.exit.15                       # ir inst 112 fin
.F.complex_nested_control_flow._49.if.else.15:
  addi t3, t4, 1                                                        # ir inst 113 fin
  mul s11, t5, t3                                                       # ir inst 114 fin
  li t2, 800
  slt t3, t2, s11                                                       # ir inst 115 fin
  bnez t3, .F.complex_nested_control_flow._50.if.then.16
  j .F.complex_nested_control_flow._51.if.else.16                       # ir inst 116 fin
.F.complex_nested_control_flow._50.if.then.16:
  li t2, 800
  rem t3, s11, t2                                                       # ir inst 117 fin
# Phi connections
  j .F.complex_nested_control_flow._52.if.exit.16                       # ir inst 118 fin
.F.complex_nested_control_flow._51.if.else.16:
# Phi connections
  mv t3, s11
  j .F.complex_nested_control_flow._52.if.exit.16                       # ir inst 119 fin
.F.complex_nested_control_flow._52.if.exit.16:
# Phi connections
  j .F.complex_nested_control_flow._53.if.exit.15                       # ir inst 121 fin
.F.complex_nested_control_flow._53.if.exit.15:
# Phi connections
  j .F.complex_nested_control_flow._54.if.exit.14                       # ir inst 123 fin
.F.complex_nested_control_flow._54.if.exit.14:
  addi s11, t4, 1                                                       # ir inst 125 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.complex_nested_control_flow._44.while.cond.2                     # ir inst 126 fin
.F.complex_nested_control_flow._55.while.exit.2:
# Phi connections
  j .F.complex_nested_control_flow._57.if.exit.13                       # ir inst 127 fin
.F.complex_nested_control_flow._56.if.else.13:
  addi t5, a0, -2                                                       # ir inst 128 fin
  add t4, a1, a0                                                        # ir inst 129 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  mv a0, t5
  call .F.complex_nested_control_flow
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 130 fin
# Phi connections
  mv t5, t3
  j .F.complex_nested_control_flow._57.if.exit.13                       # ir inst 131 fin
.F.complex_nested_control_flow._57.if.exit.13:
# Phi connections
  j .F.complex_nested_control_flow._58.if.exit.2                        # ir inst 133 fin
.F.complex_nested_control_flow._58.if.exit.2:
# Phi connections
  j .F.complex_nested_control_flow._66.if.exit.1                        # ir inst 135 fin
.F.complex_nested_control_flow._59.if.else.1:
  li t2, 7
  rem t5, a0, t2                                                        # ir inst 136 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 137 fin
  bnez t4, .F.complex_nested_control_flow._60.if.then.17
  j .F.complex_nested_control_flow._64.if.else.17                       # ir inst 138 fin
.F.complex_nested_control_flow._60.if.then.17:
  li t2, 10
  mul t5, a0, t2                                                        # ir inst 139 fin
  slt t4, t5, a1                                                        # ir inst 140 fin
  bnez t4, .F.complex_nested_control_flow._61.if.then.18
  j .F.complex_nested_control_flow._62.if.else.18                       # ir inst 141 fin
.F.complex_nested_control_flow._61.if.then.18:
  addi t5, a0, -1                                                       # ir inst 142 fin
  sub t4, a1, a0                                                        # ir inst 143 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  mv a0, t5
  call .F.complex_nested_control_flow
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 144 fin
# Phi connections
  mv t5, t3
  j .F.complex_nested_control_flow._63.if.exit.18                       # ir inst 145 fin
.F.complex_nested_control_flow._62.if.else.18:
  addi t5, a0, -1                                                       # ir inst 146 fin
  add t4, a1, a0                                                        # ir inst 147 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  mv a0, t5
  call .F.complex_nested_control_flow
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 148 fin
# Phi connections
  mv t5, t3
  j .F.complex_nested_control_flow._63.if.exit.18                       # ir inst 149 fin
.F.complex_nested_control_flow._63.if.exit.18:
# Phi connections
  j .F.complex_nested_control_flow._65.if.exit.17                       # ir inst 151 fin
.F.complex_nested_control_flow._64.if.else.17:
  addi t5, a0, -1                                                       # ir inst 152 fin
  slli t4, a1, 1                                                        # ir inst 153 fin
  add t3, t4, a0                                                        # ir inst 154 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  mv a0, t5
  call .F.complex_nested_control_flow
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 155 fin
# Phi connections
  mv t5, t4
  j .F.complex_nested_control_flow._65.if.exit.17                       # ir inst 156 fin
.F.complex_nested_control_flow._65.if.exit.17:
# Phi connections
  j .F.complex_nested_control_flow._66.if.exit.1                        # ir inst 158 fin
.F.complex_nested_control_flow._66.if.exit.1:
  li t2, 10000
  rem t4, t5, t2                                                        # ir inst 160 fin
  mv a0, t4
  j .F.complex_nested_control_flow.epilogue                             # ir inst 161 fin
.F.complex_nested_control_flow._67.critical_edge.0:
# Phi connections
  mv t5, t6
  j .F.complex_nested_control_flow._38.while.exit.1                     # ir inst 162 fin
.F.complex_nested_control_flow.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.test_complex_control_flow
.F.test_complex_control_flow:
# spill func args num: 0,             range:    16976(sp) -    16976(sp)
# local var size: 16920,              range:       56(sp) -    16976(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -16976
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.test_complex_control_flow._0.entry.0:
# Start call preparation
  li a0, 20001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  addi t1, sp, 56
  mv a0, t1
  call .F.init_fsm
# ir inst 3 fin
# alloca %1
  li t2, 4688
  add t2, sp, t2
  li t1, 42
  sw t1, 0(t2)                                                          # ir inst 5 fin
# Start call preparation
  li a5, 0
  li a4, 1
  li a3, 1
  li a2, 0
  li a1, 0
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  li a5, 1
  li a4, 2
  li a3, 2
  li a2, 1
  li a1, 1
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 7 fin
# Start call preparation
  li a5, 5
  li a4, 3
  li a3, 1
  li a2, 2
  li a1, 2
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  li a5, 4
  li a4, 4
  li a3, 4
  li a2, 3
  li a1, 2
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 9 fin
# Start call preparation
  li a5, 6
  li a4, 5
  li a3, 1
  li a2, 5
  li a1, 4
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 10 fin
# Start call preparation
  li a5, 2
  li a4, 6
  li a3, 6
  li a2, 6
  li a1, 1
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 11 fin
# Start call preparation
  li a5, 3
  li a4, 1
  li a3, 1
  li a2, 7
  li a1, 6
  addi t1, sp, 56
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 12 fin
# Phi connections
  li t6, 0
  j .F.test_complex_control_flow._1.while.cond.0                        # ir inst 13 fin
.F.test_complex_control_flow._1.while.cond.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 15 fin
  bnez t5, .F.test_complex_control_flow._2.while.body.0
  j .F.test_complex_control_flow._3.while.exit.0                        # ir inst 16 fin
.F.test_complex_control_flow._2.while.body.0:
  li t2, 7
  mul t5, t6, t2                                                        # ir inst 17 fin
  addi t4, t5, 3                                                        # ir inst 18 fin
  li t2, 10
  rem t5, t4, t2                                                        # ir inst 19 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 56
  mv a0, t1
  call .F.fsm_add_event
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 20 fin
  addi t5, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.test_complex_control_flow._1.while.cond.0                        # ir inst 22 fin
.F.test_complex_control_flow._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.test_complex_control_flow._4.while.cond.1                        # ir inst 23 fin
.F.test_complex_control_flow._4.while.cond.1:
  li t2, 150
  slt t5, t6, t2                                                        # ir inst 25 fin
  bnez t5, .F.test_complex_control_flow._5.while.body.1
  j .F.test_complex_control_flow._9.while.exit.1                        # ir inst 26 fin
.F.test_complex_control_flow._5.while.body.1:
# Start call preparation
  sd t6, 0(sp)
  li t1, 4688
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.fsm_step
  mv t5, a0
  ld t6, 0(sp)
# ir inst 27 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 28 fin
  bnez t4, .F.test_complex_control_flow._6.if.then.0
  j .F.test_complex_control_flow._7.if.else.0                           # ir inst 29 fin
.F.test_complex_control_flow._6.if.then.0:
# Start call preparation
  sd t6, 0(sp)
  li a1, 1
  addi t1, sp, 56
  mv a0, t1
  call .F.fsm_add_event
  mv t5, a0
  ld t6, 0(sp)
# ir inst 30 fin
  j .F.test_complex_control_flow._8.if.exit.0                           # ir inst 31 fin
.F.test_complex_control_flow._7.if.else.0:
  j .F.test_complex_control_flow._8.if.exit.0                           # ir inst 32 fin
.F.test_complex_control_flow._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 33 fin
# Phi connections
  mv t6, t5
  j .F.test_complex_control_flow._4.while.cond.1                        # ir inst 34 fin
.F.test_complex_control_flow._9.while.exit.1:
  addi t1, sp, 56
  li t6, 4628
  add t6, t1, t6                                                        # ir inst 35 fin
  lw t5, 0(t6)                                                          # ir inst 36 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 37 fin
  addi t1, sp, 56
  li t6, 4624
  add t6, t1, t6                                                        # ir inst 38 fin
  lw t5, 0(t6)                                                          # ir inst 39 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 40 fin
  li t1, 4688
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 41 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 42 fin
# Start call preparation
  li t1, 4692
  add t1, sp, t1
  mv a0, t1
  call .F.init_protocol_parser
# ir inst 44 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_complex_control_flow._10.while.cond.2                       # ir inst 45 fin
.F.test_complex_control_flow._10.while.cond.2:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 48 fin
  bnez t4, .F.test_complex_control_flow._11.while.body.2
  j .F.test_complex_control_flow._27.while.exit.2                       # ir inst 49 fin
.F.test_complex_control_flow._11.while.body.2:
  li t2, 7
  rem t4, t5, t2                                                        # ir inst 50 fin
  addi t3, t4, 1                                                        # ir inst 51 fin
  li t2, 13
  mul t4, t5, t2                                                        # ir inst 52 fin
  addi s11, t4, 7                                                       # ir inst 53 fin
  addi t4, t5, 1                                                        # ir inst 54 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t4
  mv a2, s11
  mv a1, t3
  li t1, 4692
  add t1, sp, t1
  mv a0, t1
  call .F.parse_packet
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 55 fin
  li t2, 0
  slt t3, t2, s10                                                       # ir inst 56 fin
  bnez t3, .F.test_complex_control_flow._12.if.then.1
  j .F.test_complex_control_flow._13.if.else.1                          # ir inst 57 fin
.F.test_complex_control_flow._12.if.then.1:
  addi t3, t6, 1                                                        # ir inst 58 fin
# Phi connections
  j .F.test_complex_control_flow._14.if.exit.1                          # ir inst 59 fin
.F.test_complex_control_flow._13.if.else.1:
# Phi connections
  mv t3, t6
  j .F.test_complex_control_flow._14.if.exit.1                          # ir inst 60 fin
.F.test_complex_control_flow._14.if.exit.1:
  li t1, 4692
  add t1, sp, t1
  addi s11, t1, 0                                                       # ir inst 62 fin
  lw s10, 0(s11)                                                        # ir inst 63 fin
  li t2, 2
  xor t0, s10, t2
  sltiu s11, t0, 1                                                      # ir inst 64 fin
  bnez s11, .F.test_complex_control_flow._15.lazy.then.0
  j .F.test_complex_control_flow._16.lazy.else.0                        # ir inst 65 fin
.F.test_complex_control_flow._15.lazy.then.0:
  li t2, 10
  rem s11, t5, t2                                                       # ir inst 66 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 67 fin
# Phi connections
  mv s11, s10
  j .F.test_complex_control_flow._17.lazy.exit.0                        # ir inst 68 fin
.F.test_complex_control_flow._16.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.test_complex_control_flow._17.lazy.exit.0                        # ir inst 69 fin
.F.test_complex_control_flow._17.lazy.exit.0:
  bnez s11, .F.test_complex_control_flow._18.if.then.2
  j .F.test_complex_control_flow._19.if.else.2                          # ir inst 71 fin
.F.test_complex_control_flow._18.if.then.2:
  addi s11, t4, 1                                                       # ir inst 72 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a3, s11
  li a2, 0
  li a1, 6
  li t1, 4692
  add t1, sp, t1
  mv a0, t1
  call .F.parse_packet
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 73 fin
  j .F.test_complex_control_flow._20.if.exit.2                          # ir inst 74 fin
.F.test_complex_control_flow._19.if.else.2:
  j .F.test_complex_control_flow._20.if.exit.2                          # ir inst 75 fin
.F.test_complex_control_flow._20.if.exit.2:
  li t1, 4692
  add t1, sp, t1
  li t4, 4012
  add t4, t1, t4                                                        # ir inst 76 fin
  lw s11, 0(t4)                                                         # ir inst 77 fin
  li t2, 5
  slt t4, t2, s11                                                       # ir inst 78 fin
  bnez t4, .F.test_complex_control_flow._21.lazy.then.1
  j .F.test_complex_control_flow._22.lazy.else.1                        # ir inst 79 fin
.F.test_complex_control_flow._21.lazy.then.1:
  li t2, 15
  rem t4, t5, t2                                                        # ir inst 80 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 81 fin
# Phi connections
  mv t4, s11
  j .F.test_complex_control_flow._23.lazy.exit.1                        # ir inst 82 fin
.F.test_complex_control_flow._22.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.test_complex_control_flow._23.lazy.exit.1                        # ir inst 83 fin
.F.test_complex_control_flow._23.lazy.exit.1:
  bnez t4, .F.test_complex_control_flow._24.if.then.3
  j .F.test_complex_control_flow._25.if.else.3                          # ir inst 85 fin
.F.test_complex_control_flow._24.if.then.3:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a3, 0
  li a2, 0
  li a1, 5
  li t1, 4692
  add t1, sp, t1
  mv a0, t1
  call .F.parse_packet
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 86 fin
  j .F.test_complex_control_flow._26.if.exit.3                          # ir inst 87 fin
.F.test_complex_control_flow._25.if.else.3:
  j .F.test_complex_control_flow._26.if.exit.3                          # ir inst 88 fin
.F.test_complex_control_flow._26.if.exit.3:
  addi t4, t5, 1                                                        # ir inst 89 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.test_complex_control_flow._10.while.cond.2                       # ir inst 90 fin
.F.test_complex_control_flow._27.while.exit.2:
  li t1, 4692
  add t1, sp, t1
  li t5, 4008
  add t5, t1, t5                                                        # ir inst 91 fin
  lw t4, 0(t5)                                                          # ir inst 92 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 93 fin
  li t1, 4692
  add t1, sp, t1
  li t5, 4012
  add t5, t1, t5                                                        # ir inst 94 fin
  lw t4, 0(t5)                                                          # ir inst 95 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 96 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 97 fin
# Start call preparation
  li t1, 8716
  add t1, sp, t1
  mv a0, t1
  call .F.init_task_scheduler
# ir inst 99 fin
# Phi connections
  li t6, 0
  j .F.test_complex_control_flow._28.while.cond.3                       # ir inst 100 fin
.F.test_complex_control_flow._28.while.cond.3:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 102 fin
  bnez t5, .F.test_complex_control_flow._29.while.body.3
  j .F.test_complex_control_flow._30.while.exit.3                       # ir inst 103 fin
.F.test_complex_control_flow._29.while.body.3:
  li t2, 4
  rem t5, t6, t2                                                        # ir inst 104 fin
  addi t4, t5, 1                                                        # ir inst 105 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 106 fin
  addi t3, t5, 5                                                        # ir inst 107 fin
  li t2, 20
  rem t5, t3, t2                                                        # ir inst 108 fin
  addi t3, t5, 1                                                        # ir inst 109 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t3
  mv a1, t4
  li t1, 8716
  add t1, sp, t1
  mv a0, t1
  call .F.add_task
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 110 fin
  addi t5, t6, 1                                                        # ir inst 111 fin
# Phi connections
  mv t6, t5
  j .F.test_complex_control_flow._28.while.cond.3                       # ir inst 112 fin
.F.test_complex_control_flow._30.while.exit.3:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_complex_control_flow._31.while.cond.4                       # ir inst 113 fin
.F.test_complex_control_flow._31.while.cond.4:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 116 fin
  bnez t4, .F.test_complex_control_flow._32.while.body.4
  j .F.test_complex_control_flow._42.while.exit.4                       # ir inst 117 fin
.F.test_complex_control_flow._32.while.body.4:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li t1, 8716
  add t1, sp, t1
  mv a0, t1
  call .F.schedule_next_task
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 118 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 119 fin
  bnez t3, .F.test_complex_control_flow._33.if.then.4
  j .F.test_complex_control_flow._34.if.else.4                          # ir inst 120 fin
.F.test_complex_control_flow._33.if.then.4:
  addi t4, t5, 1                                                        # ir inst 121 fin
# Phi connections
  j .F.test_complex_control_flow._35.if.exit.4                          # ir inst 122 fin
.F.test_complex_control_flow._34.if.else.4:
# Phi connections
  mv t4, t5
  j .F.test_complex_control_flow._35.if.exit.4                          # ir inst 123 fin
.F.test_complex_control_flow._35.if.exit.4:
  li t2, 50
  rem t3, t6, t2                                                        # ir inst 125 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 126 fin
  bnez s11, .F.test_complex_control_flow._36.lazy.then.2
  j .F.test_complex_control_flow._37.lazy.else.2                        # ir inst 127 fin
.F.test_complex_control_flow._36.lazy.then.2:
  li t1, 8716
  add t1, sp, t1
  li t3, 2800
  add t3, t1, t3                                                        # ir inst 128 fin
  lw s11, 0(t3)                                                         # ir inst 129 fin
  li t1, 100
  mv t3, t1                                                             # ir inst 130 fin
  slt s10, s11, t3                                                      # ir inst 131 fin
# Phi connections
  mv t3, s10
  j .F.test_complex_control_flow._38.lazy.exit.2                        # ir inst 132 fin
.F.test_complex_control_flow._37.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.test_complex_control_flow._38.lazy.exit.2                        # ir inst 133 fin
.F.test_complex_control_flow._38.lazy.exit.2:
  bnez t3, .F.test_complex_control_flow._39.if.then.5
  j .F.test_complex_control_flow._40.if.else.5                          # ir inst 135 fin
.F.test_complex_control_flow._39.if.then.5:
  li t2, 50
  div t3, t6, t2                                                        # ir inst 136 fin
  li t2, 4
  rem s11, t3, t2                                                       # ir inst 137 fin
  addi t3, s11, 1                                                       # ir inst 138 fin
  li t2, 10
  div s11, t6, t2                                                       # ir inst 139 fin
  li t2, 15
  rem s10, s11, t2                                                      # ir inst 140 fin
  addi s11, s10, 1                                                      # ir inst 141 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, s11
  mv a1, t3
  li t1, 8716
  add t1, sp, t1
  mv a0, t1
  call .F.add_task
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 142 fin
  j .F.test_complex_control_flow._41.if.exit.5                          # ir inst 143 fin
.F.test_complex_control_flow._40.if.else.5:
  j .F.test_complex_control_flow._41.if.exit.5                          # ir inst 144 fin
.F.test_complex_control_flow._41.if.exit.5:
  addi t3, t6, 1                                                        # ir inst 145 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.test_complex_control_flow._31.while.cond.4                       # ir inst 146 fin
.F.test_complex_control_flow._42.while.exit.4:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 147 fin
  li t1, 8716
  add t1, sp, t1
  li t6, 2800
  add t6, t1, t6                                                        # ir inst 148 fin
  lw t5, 0(t6)                                                          # ir inst 149 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 150 fin
# Phi connections
  li t5, 0
  li t6, 1
  j .F.test_complex_control_flow._43.while.cond.5                       # ir inst 151 fin
.F.test_complex_control_flow._43.while.cond.5:
  li t2, 20
  slt t0, t2, t6
  xori t4, t0, 1                                                        # ir inst 154 fin
  bnez t4, .F.test_complex_control_flow._44.while.body.5
  j .F.test_complex_control_flow._45.while.exit.5                       # ir inst 155 fin
.F.test_complex_control_flow._44.while.body.5:
  li t2, 17
  mul t4, t6, t2                                                        # ir inst 156 fin
  addi t3, t4, 3                                                        # ir inst 157 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  mv a0, t6
  call .F.complex_nested_control_flow
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 158 fin
  add t3, t5, t4                                                        # ir inst 159 fin
  addi t4, t6, 1                                                        # ir inst 160 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.test_complex_control_flow._43.while.cond.5                       # ir inst 161 fin
.F.test_complex_control_flow._45.while.exit.5:
  li t2, 100000
  rem t6, t5, t2                                                        # ir inst 162 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 163 fin
# Start call preparation
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.init_fsm
# ir inst 165 fin
# alloca %105
  li t2, 16972
  add t2, sp, t2
  li t1, 17
  sw t1, 0(t2)                                                          # ir inst 167 fin
# Start call preparation
  li a5, 0
  li a4, 2
  li a3, 2
  li a2, 0
  li a1, 0
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 168 fin
# Start call preparation
  li a5, 2
  li a4, 4
  li a3, 3
  li a2, 1
  li a1, 2
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 169 fin
# Start call preparation
  li a5, 1
  li a4, 6
  li a3, 4
  li a2, 4
  li a1, 3
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 170 fin
# Start call preparation
  li a5, 0
  li a4, 1
  li a3, 0
  li a2, 9
  li a1, 4
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.add_transition
  mv t6, a0
# ir inst 171 fin
# Phi connections
  li t6, 0
  j .F.test_complex_control_flow._46.while.cond.6                       # ir inst 172 fin
.F.test_complex_control_flow._46.while.cond.6:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 174 fin
  bnez t5, .F.test_complex_control_flow._47.while.body.6
  j .F.test_complex_control_flow._66.while.exit.6                       # ir inst 175 fin
.F.test_complex_control_flow._47.while.body.6:
# Start call preparation
  sd t6, 0(sp)
  li t1, 4688
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.fsm_step
  mv t5, a0
  ld t6, 0(sp)
# ir inst 176 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 177 fin
  bnez t4, .F.test_complex_control_flow._48.if.then.6
  j .F.test_complex_control_flow._49.if.else.6                          # ir inst 178 fin
.F.test_complex_control_flow._48.if.then.6:
  li t2, 5
  rem t5, t6, t2                                                        # ir inst 179 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 56
  mv a0, t1
  call .F.fsm_add_event
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 180 fin
  j .F.test_complex_control_flow._50.if.exit.6                          # ir inst 181 fin
.F.test_complex_control_flow._49.if.else.6:
  j .F.test_complex_control_flow._50.if.exit.6                          # ir inst 182 fin
.F.test_complex_control_flow._50.if.exit.6:
# Start call preparation
  sd t6, 0(sp)
  li t1, 16972
  add t1, sp, t1
  mv a1, t1
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.fsm_step
  mv t5, a0
  ld t6, 0(sp)
# ir inst 183 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 184 fin
  bnez t4, .F.test_complex_control_flow._51.if.then.7
  j .F.test_complex_control_flow._52.if.else.7                          # ir inst 185 fin
.F.test_complex_control_flow._51.if.then.7:
  li t2, 3
  rem t5, t6, t2                                                        # ir inst 186 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.fsm_add_event
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 187 fin
  j .F.test_complex_control_flow._53.if.exit.7                          # ir inst 188 fin
.F.test_complex_control_flow._52.if.else.7:
  j .F.test_complex_control_flow._53.if.exit.7                          # ir inst 189 fin
.F.test_complex_control_flow._53.if.exit.7:
  addi t1, sp, 56
  addi t5, t1, 0                                                        # ir inst 190 fin
  lw t4, 0(t5)                                                          # ir inst 191 fin
  li t2, 2
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 192 fin
  bnez t5, .F.test_complex_control_flow._54.lazy.then.3
  j .F.test_complex_control_flow._55.lazy.else.3                        # ir inst 193 fin
.F.test_complex_control_flow._54.lazy.then.3:
  li t1, 12340
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 194 fin
  lw t4, 0(t5)                                                          # ir inst 195 fin
  li t2, 3
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 196 fin
# Phi connections
  j .F.test_complex_control_flow._56.lazy.exit.3                        # ir inst 197 fin
.F.test_complex_control_flow._55.lazy.else.3:
# Phi connections
  li t5, 0
  j .F.test_complex_control_flow._56.lazy.exit.3                        # ir inst 198 fin
.F.test_complex_control_flow._56.lazy.exit.3:
  bnez t5, .F.test_complex_control_flow._57.if.then.8
  j .F.test_complex_control_flow._58.if.else.8                          # ir inst 200 fin
.F.test_complex_control_flow._57.if.then.8:
# Start call preparation
  sd t6, 0(sp)
  li a1, 2
  li t1, 12340
  add t1, sp, t1
  mv a0, t1
  call .F.fsm_add_event
  mv t5, a0
  ld t6, 0(sp)
# ir inst 201 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 6
  addi t1, sp, 56
  mv a0, t1
  call .F.fsm_add_event
  mv t5, a0
  ld t6, 0(sp)
# ir inst 202 fin
  j .F.test_complex_control_flow._59.if.exit.8                          # ir inst 203 fin
.F.test_complex_control_flow._58.if.else.8:
  j .F.test_complex_control_flow._59.if.exit.8                          # ir inst 204 fin
.F.test_complex_control_flow._59.if.exit.8:
  li t1, 4688
  add t1, sp, t1
  lw t5, 0(t1)                                                          # ir inst 205 fin
  li t2, 80
  slt t4, t2, t5                                                        # ir inst 206 fin
  bnez t4, .F.test_complex_control_flow._60.lazy.then.4
  j .F.test_complex_control_flow._61.lazy.else.4                        # ir inst 207 fin
.F.test_complex_control_flow._60.lazy.then.4:
  li t1, 16972
  add t1, sp, t1
  lw t5, 0(t1)                                                          # ir inst 208 fin
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 209 fin
# Phi connections
  mv t5, t4
  j .F.test_complex_control_flow._62.lazy.exit.4                        # ir inst 210 fin
.F.test_complex_control_flow._61.lazy.else.4:
# Phi connections
  li t5, 0
  j .F.test_complex_control_flow._62.lazy.exit.4                        # ir inst 211 fin
.F.test_complex_control_flow._62.lazy.exit.4:
  bnez t5, .F.test_complex_control_flow._63.if.then.9
  j .F.test_complex_control_flow._64.if.else.9                          # ir inst 213 fin
.F.test_complex_control_flow._63.if.then.9:
  li t1, 16972
  add t1, sp, t1
  lw t5, 0(t1)                                                          # ir inst 214 fin
  li t1, 4688
  add t1, sp, t1
  lw t4, 0(t1)                                                          # ir inst 215 fin
  li t2, 4
  div t3, t4, t2                                                        # ir inst 216 fin
  add t4, t5, t3                                                        # ir inst 217 fin
# alloca %105
  li t2, 16972
  add t2, sp, t2
  sw t4, 0(t2)                                                          # ir inst 218 fin
  li t1, 4688
  add t1, sp, t1
  lw t5, 0(t1)                                                          # ir inst 219 fin
  addi t4, t5, -10                                                      # ir inst 220 fin
# alloca %1
  li t2, 4688
  add t2, sp, t2
  sw t4, 0(t2)                                                          # ir inst 221 fin
  j .F.test_complex_control_flow._65.if.exit.9                          # ir inst 222 fin
.F.test_complex_control_flow._64.if.else.9:
  j .F.test_complex_control_flow._65.if.exit.9                          # ir inst 223 fin
.F.test_complex_control_flow._65.if.exit.9:
  addi t5, t6, 1                                                        # ir inst 224 fin
# Phi connections
  mv t6, t5
  j .F.test_complex_control_flow._46.while.cond.6                       # ir inst 225 fin
.F.test_complex_control_flow._66.while.exit.6:
  li t1, 12340
  add t1, sp, t1
  li t6, 4628
  add t6, t1, t6                                                        # ir inst 226 fin
  lw t5, 0(t6)                                                          # ir inst 227 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 228 fin
  li t1, 16972
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 229 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 230 fin
# Start call preparation
  li a0, 20999
  call printlnInt
# ir inst 231 fin
  j .F.test_complex_control_flow.epilogue                               # ir inst 232 fin
.F.test_complex_control_flow.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 16976
  add sp, sp, t0
  ret

.globl main
main:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
main._0.entry.0:
# Start call preparation
  call .F.test_complex_control_flow
# ir inst 1 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 2 fin
  j main.epilogue                                                       # ir inst 3 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret
