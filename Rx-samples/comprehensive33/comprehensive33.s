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

.globl main
main:
# spill func args num: 0,             range:    10832(sp) -    10832(sp)
# local var size: 10788,              range:       32(sp) -    10820(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10832
  add sp, sp, t0
  sd ra, 24(sp)
main._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 10592
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t4, 0
  j main._1.array.cond.0                                                # ir inst 5 fin
main._1.array.cond.0:
  li t2, 50
  slt t3, t4, t2                                                        # ir inst 7 fin
  bnez t3, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 8 fin
main._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 10 fin
  addi t3, t4, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, t3
  j main._1.array.cond.0                                                # ir inst 12 fin
main._3.array.exit.0:
  addi t5, t6, 0                                                        # ir inst 13 fin
# Phi connections
  li t6, 0
  j main._4.array.cond.1                                                # ir inst 14 fin
main._4.array.cond.1:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 17 fin
main._5.array.body.1:
  li t1, 200
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 18 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 200
  li t1, 10592
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t4
  j main._4.array.cond.1                                                # ir inst 21 fin
main._6.array.exit.1:
  addi t1, sp, 32
  li t6, 10000
  add t6, t1, t6                                                        # ir inst 22 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 25 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 26 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 27 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 29 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 30 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 31 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 16                                                       # ir inst 32 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 33 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 20                                                       # ir inst 34 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 35 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 24                                                       # ir inst 36 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 37 fin
  addi t5, t6, 0                                                        # ir inst 38 fin
# Phi connections
  li t6, 0
  j main._7.array.cond.2                                                # ir inst 39 fin
main._7.array.cond.2:
  li t2, 20
  slt t4, t6, t2                                                        # ir inst 41 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 42 fin
main._8.array.body.2:
  li t1, 28
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 43 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  li t1, 10792
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 44 fin
  addi t4, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t6, t4
  j main._7.array.cond.2                                                # ir inst 46 fin
main._9.array.exit.2:
# Start call preparation
  li a1, 98765
  addi t1, sp, 32
  mv a0, t1
  call .F.initialize_world
# ir inst 47 fin
# Phi connections
  li t6, 0
  j main._10.while.cond.0                                               # ir inst 48 fin
main._10.while.cond.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 50 fin
  bnez t5, main._11.while.body.0
  j main._15.while.exit.0                                               # ir inst 51 fin
main._11.while.body.0:
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 32
  mv a0, t1
  call .F.update_world
  ld t6, 0(sp)
# ir inst 52 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 32
  mv a0, t1
  call .F.process_interactions
  ld t6, 0(sp)
# ir inst 53 fin
  li t2, 10
  rem t5, t6, t2                                                        # ir inst 54 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 55 fin
  bnez t4, main._12.if.then.0
  j main._13.if.else.0                                                  # ir inst 56 fin
main._12.if.then.0:
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 32
  mv a0, t1
  call .F.run_diagnostics
  ld t6, 0(sp)
# ir inst 57 fin
  j main._14.if.exit.0                                                  # ir inst 58 fin
main._13.if.else.0:
  j main._14.if.exit.0                                                  # ir inst 59 fin
main._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 60 fin
# Phi connections
  mv t6, t5
  j main._10.while.cond.0                                               # ir inst 61 fin
main._15.while.exit.0:
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.final_report
# ir inst 62 fin
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 63 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 64 fin
  j main.epilogue                                                       # ir inst 65 fin
main.epilogue:
  ld ra, 24(sp)
  li t0, 10832
  add sp, sp, t0
  ret

.globl .F.initialize_world
.F.initialize_world:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 5 / 12,        range:       40(sp) -       80(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s8, 40(sp)
  sd s7, 48(sp)
  sd s10, 56(sp)
  sd s9, 64(sp)
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.initialize_world._0.entry.0:
# Phi connections
  li t5, 0
  mv t6, a1
  j .F.initialize_world._1.while.cond.0                                 # ir inst 1 fin
.F.initialize_world._1.while.cond.0:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.initialize_world._2.while.body.0
  j .F.initialize_world._3.while.exit.0                                 # ir inst 5 fin
.F.initialize_world._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.pm_rand_update
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, 65536
  div t3, t4, t2                                                        # ir inst 7 fin
  li t2, 32768
  rem t4, t3, t2                                                        # ir inst 8 fin
  li t2, 50
  rem t3, t4, t2                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, t4
  call .F.pm_rand_update
  mv s11, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 10 fin
  li t2, 65536
  div t4, s11, t2                                                       # ir inst 11 fin
  li t2, 32768
  rem s11, t4, t2                                                       # ir inst 12 fin
  li t2, 50
  rem t4, s11, t2                                                       # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, s11
  call .F.pm_rand_update
  mv s10, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 14 fin
  li t2, 65536
  div s11, s10, t2                                                      # ir inst 15 fin
  li t2, 32768
  rem s10, s11, t2                                                      # ir inst 16 fin
  li t2, 100
  rem s11, s10, t2                                                      # ir inst 17 fin
  addi s9, s11, 100                                                     # ir inst 18 fin
  li s11, 10000
  add s11, a0, s11                                                      # ir inst 19 fin
  mv s8, t5                                                             # ir inst 20 fin
  li t1, 28
  mul t2, s8, t1
  add s7, s11, t2                                                       # ir inst 21 fin
  addi s11, s7, 0                                                       # ir inst 22 fin
  sw t5, 0(s11)                                                         # ir inst 23 fin
  li s11, 10000
  add s11, a0, s11                                                      # ir inst 24 fin
  mv s8, t5                                                             # ir inst 25 fin
  li t1, 28
  mul t2, s8, t1
  add s7, s11, t2                                                       # ir inst 26 fin
  addi s11, s7, 4                                                       # ir inst 27 fin
  sw t3, 0(s11)                                                         # ir inst 28 fin
  li s11, 10000
  add s11, a0, s11                                                      # ir inst 29 fin
  mv s8, t5                                                             # ir inst 30 fin
  li t1, 28
  mul t2, s8, t1
  add s7, s11, t2                                                       # ir inst 31 fin
  addi s11, s7, 8                                                       # ir inst 32 fin
  sw t4, 0(s11)                                                         # ir inst 33 fin
  li s11, 10000
  add s11, a0, s11                                                      # ir inst 34 fin
  mv s8, t5                                                             # ir inst 35 fin
  li t1, 28
  mul t2, s8, t1
  add s7, s11, t2                                                       # ir inst 36 fin
  addi s11, s7, 12                                                      # ir inst 37 fin
  sw s9, 0(s11)                                                         # ir inst 38 fin
  li s11, 10000
  add s11, a0, s11                                                      # ir inst 39 fin
  mv s9, t5                                                             # ir inst 40 fin
  li t1, 28
  mul t2, s9, t1
  add s8, s11, t2                                                       # ir inst 41 fin
  addi s11, s8, 24                                                      # ir inst 42 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 43 fin
  addi s11, a0, 0                                                       # ir inst 44 fin
  mv s9, t4                                                             # ir inst 45 fin
  li t1, 200
  mul t2, s9, t1
  add t4, s11, t2                                                       # ir inst 46 fin
  mv s11, t3                                                            # ir inst 47 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 48 fin
  addi t4, t5, 1                                                        # ir inst 49 fin
  sw t4, 0(t3)                                                          # ir inst 50 fin
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 51 fin
  mv t3, t5                                                             # ir inst 52 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 53 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, s10
  mv a0, s11
  call .F.update_agent_target
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 54 fin
  addi t4, t5, 1                                                        # ir inst 55 fin
# Phi connections
  mv t5, t4
  mv t6, s10
  j .F.initialize_world._1.while.cond.0                                 # ir inst 56 fin
.F.initialize_world._3.while.exit.0:
# Phi connections
  li t5, 0
  j .F.initialize_world._4.while.cond.1                                 # ir inst 57 fin
.F.initialize_world._4.while.cond.1:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 60 fin
  bnez t4, .F.initialize_world._5.while.body.1
  j .F.initialize_world._15.while.exit.1                                # ir inst 61 fin
.F.initialize_world._5.while.body.1:
# Phi connections
  mv t4, t6
  li t6, 0
  j .F.initialize_world._6.while.cond.2                                 # ir inst 62 fin
.F.initialize_world._6.while.cond.2:
  li t2, 50
  slt t3, t6, t2                                                        # ir inst 65 fin
  bnez t3, .F.initialize_world._7.while.body.2
  j .F.initialize_world._14.while.exit.2                                # ir inst 66 fin
.F.initialize_world._7.while.body.2:
  addi t3, a0, 0                                                        # ir inst 67 fin
  mv s11, t5                                                            # ir inst 68 fin
  li t1, 200
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 69 fin
  mv t3, t6                                                             # ir inst 70 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 71 fin
  lw t3, 0(s11)                                                         # ir inst 72 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 73 fin
  bnez s11, .F.initialize_world._8.if.then.0
  j .F.initialize_world._12.if.else.0                                   # ir inst 74 fin
.F.initialize_world._8.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.pm_rand_update
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 75 fin
  li t2, 65536
  div s11, t3, t2                                                       # ir inst 76 fin
  li t2, 32768
  rem t3, s11, t2                                                       # ir inst 77 fin
  li t2, 10
  rem s11, t3, t2                                                       # ir inst 78 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 79 fin
  bnez s10, .F.initialize_world._9.if.then.1
  j .F.initialize_world._10.if.else.1                                   # ir inst 80 fin
.F.initialize_world._9.if.then.1:
  addi s11, a0, 0                                                       # ir inst 81 fin
  mv s10, t5                                                            # ir inst 82 fin
  li t1, 200
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 83 fin
  mv s11, t6                                                            # ir inst 84 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 85 fin
  li t2, 5
  rem s11, t3, t2                                                       # ir inst 86 fin
  addi s9, s11, 1                                                       # ir inst 87 fin
  li t1, -1
  mul s11, t1, s9                                                       # ir inst 88 fin
  sw s11, 0(s10)                                                        # ir inst 89 fin
  j .F.initialize_world._11.if.exit.1                                   # ir inst 90 fin
.F.initialize_world._10.if.else.1:
  j .F.initialize_world._11.if.exit.1                                   # ir inst 91 fin
.F.initialize_world._11.if.exit.1:
# Phi connections
  j .F.initialize_world._13.if.exit.0                                   # ir inst 92 fin
.F.initialize_world._12.if.else.0:
# Phi connections
  mv t3, t4
  j .F.initialize_world._13.if.exit.0                                   # ir inst 93 fin
.F.initialize_world._13.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 95 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.initialize_world._6.while.cond.2                                 # ir inst 96 fin
.F.initialize_world._14.while.exit.2:
  addi t6, t5, 1                                                        # ir inst 97 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.initialize_world._4.while.cond.1                                 # ir inst 98 fin
.F.initialize_world._15.while.exit.1:
  j .F.initialize_world.epilogue                                        # ir inst 99 fin
.F.initialize_world.epilogue:
  ld ra, 80(sp)
  ld s8, 40(sp)
  ld s7, 48(sp)
  ld s10, 56(sp)
  ld s9, 64(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.update_agent_target
.F.update_agent_target:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.update_agent_target._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  mv a0, a1
  call .F.pm_rand_update
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
  li t2, 65536
  div t5, t6, t2                                                        # ir inst 2 fin
  li t2, 32768
  rem t6, t5, t2                                                        # ir inst 3 fin
  addi t5, a0, 16                                                       # ir inst 4 fin
  li t2, 50
  rem t4, t6, t2                                                        # ir inst 5 fin
  sw t4, 0(t5)                                                          # ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.pm_rand_update
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  li t2, 65536
  div t6, t5, t2                                                        # ir inst 8 fin
  li t2, 32768
  rem t5, t6, t2                                                        # ir inst 9 fin
  addi t6, a0, 20                                                       # ir inst 10 fin
  li t2, 50
  rem t4, t5, t2                                                        # ir inst 11 fin
  sw t4, 0(t6)                                                          # ir inst 12 fin
  j .F.update_agent_target.epilogue                                     # ir inst 13 fin
.F.update_agent_target.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.update_world
.F.update_world:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 40(sp)
  sd s9, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.update_world._0.entry.0:
# Phi connections
  li t6, 0
  j .F.update_world._1.while.cond.0                                     # ir inst 1 fin
.F.update_world._1.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.update_world._2.while.body.0
  j .F.update_world._30.while.exit.0                                    # ir inst 4 fin
.F.update_world._2.while.body.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 7 fin
  addi t5, t3, 24                                                       # ir inst 8 fin
  lb t4, 0(t5)                                                          # ir inst 9 fin
  bnez t4, .F.update_world._3.if.then.0
  j .F.update_world._28.if.else.0                                       # ir inst 10 fin
.F.update_world._3.if.then.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 4                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  addi t5, t3, 8                                                        # ir inst 16 fin
  lw s11, 0(t5)                                                         # ir inst 17 fin
  addi t5, t3, 4                                                        # ir inst 18 fin
  lw s10, 0(t5)                                                         # ir inst 19 fin
  addi t5, t3, 16                                                       # ir inst 20 fin
  lw s9, 0(t5)                                                          # ir inst 21 fin
  slt t5, s10, s9                                                       # ir inst 22 fin
  bnez t5, .F.update_world._4.if.then.1
  j .F.update_world._5.if.else.1                                        # ir inst 23 fin
.F.update_world._4.if.then.1:
  addi t5, t3, 4                                                        # ir inst 24 fin
  addi s10, t3, 4                                                       # ir inst 25 fin
  lw s9, 0(s10)                                                         # ir inst 26 fin
  addi s10, s9, 1                                                       # ir inst 27 fin
  sw s10, 0(t5)                                                         # ir inst 28 fin
  j .F.update_world._9.if.exit.1                                        # ir inst 29 fin
.F.update_world._5.if.else.1:
  addi t5, t3, 4                                                        # ir inst 30 fin
  lw s10, 0(t5)                                                         # ir inst 31 fin
  addi t5, t3, 16                                                       # ir inst 32 fin
  lw s9, 0(t5)                                                          # ir inst 33 fin
  slt t5, s9, s10                                                       # ir inst 34 fin
  bnez t5, .F.update_world._6.if.then.2
  j .F.update_world._7.if.else.2                                        # ir inst 35 fin
.F.update_world._6.if.then.2:
  addi t5, t3, 4                                                        # ir inst 36 fin
  addi s10, t3, 4                                                       # ir inst 37 fin
  lw s9, 0(s10)                                                         # ir inst 38 fin
  addi s10, s9, -1                                                      # ir inst 39 fin
  sw s10, 0(t5)                                                         # ir inst 40 fin
  j .F.update_world._8.if.exit.2                                        # ir inst 41 fin
.F.update_world._7.if.else.2:
  j .F.update_world._8.if.exit.2                                        # ir inst 42 fin
.F.update_world._8.if.exit.2:
  j .F.update_world._9.if.exit.1                                        # ir inst 43 fin
.F.update_world._9.if.exit.1:
  addi t5, t3, 8                                                        # ir inst 44 fin
  lw s10, 0(t5)                                                         # ir inst 45 fin
  addi t5, t3, 20                                                       # ir inst 46 fin
  lw s9, 0(t5)                                                          # ir inst 47 fin
  slt t5, s10, s9                                                       # ir inst 48 fin
  bnez t5, .F.update_world._10.if.then.3
  j .F.update_world._11.if.else.3                                       # ir inst 49 fin
.F.update_world._10.if.then.3:
  addi t5, t3, 8                                                        # ir inst 50 fin
  addi s10, t3, 8                                                       # ir inst 51 fin
  lw s9, 0(s10)                                                         # ir inst 52 fin
  addi s10, s9, 1                                                       # ir inst 53 fin
  sw s10, 0(t5)                                                         # ir inst 54 fin
  j .F.update_world._15.if.exit.3                                       # ir inst 55 fin
.F.update_world._11.if.else.3:
  addi t5, t3, 8                                                        # ir inst 56 fin
  lw s10, 0(t5)                                                         # ir inst 57 fin
  addi t5, t3, 20                                                       # ir inst 58 fin
  lw s9, 0(t5)                                                          # ir inst 59 fin
  slt t5, s9, s10                                                       # ir inst 60 fin
  bnez t5, .F.update_world._12.if.then.4
  j .F.update_world._13.if.else.4                                       # ir inst 61 fin
.F.update_world._12.if.then.4:
  addi t5, t3, 8                                                        # ir inst 62 fin
  addi s10, t3, 8                                                       # ir inst 63 fin
  lw s9, 0(s10)                                                         # ir inst 64 fin
  addi s10, s9, -1                                                      # ir inst 65 fin
  sw s10, 0(t5)                                                         # ir inst 66 fin
  j .F.update_world._14.if.exit.4                                       # ir inst 67 fin
.F.update_world._13.if.else.4:
  j .F.update_world._14.if.exit.4                                       # ir inst 68 fin
.F.update_world._14.if.exit.4:
  j .F.update_world._15.if.exit.3                                       # ir inst 69 fin
.F.update_world._15.if.exit.3:
  addi t5, t3, 4                                                        # ir inst 70 fin
  addi s10, t3, 4                                                       # ir inst 71 fin
  lw s9, 0(s10)                                                         # ir inst 72 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 49
  li a1, 0
  mv a0, s9
  call .F.clamp
  mv s10, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 73 fin
  sw s10, 0(t5)                                                         # ir inst 74 fin
  addi t5, t3, 8                                                        # ir inst 75 fin
  addi s10, t3, 8                                                       # ir inst 76 fin
  lw s9, 0(s10)                                                         # ir inst 77 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 49
  li a1, 0
  mv a0, s9
  call .F.clamp
  mv s10, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 78 fin
  sw s10, 0(t5)                                                         # ir inst 79 fin
  addi t5, t3, 12                                                       # ir inst 80 fin
  addi s10, t3, 12                                                      # ir inst 81 fin
  lw s9, 0(s10)                                                         # ir inst 82 fin
  addi s10, s9, -1                                                      # ir inst 83 fin
  sw s10, 0(t5)                                                         # ir inst 84 fin
  addi t5, a0, 0                                                        # ir inst 85 fin
  addi s10, t3, 8                                                       # ir inst 86 fin
  lw s9, 0(s10)                                                         # ir inst 87 fin
  mv s10, s9                                                            # ir inst 88 fin
  li t1, 200
  mul t2, s10, t1
  add s9, t5, t2                                                        # ir inst 89 fin
  addi t5, t3, 4                                                        # ir inst 90 fin
  lw s10, 0(t5)                                                         # ir inst 91 fin
  mv t5, s10                                                            # ir inst 92 fin
  slli t2, t5, 2
  add s10, s9, t2                                                       # ir inst 93 fin
  lw t5, 0(s10)                                                         # ir inst 94 fin
  li t2, 0
  xor t0, t5, t2
  sltiu s10, t0, 1                                                      # ir inst 95 fin
  bnez s10, .F.update_world._16.if.then.5
  j .F.update_world._17.if.else.5                                       # ir inst 96 fin
.F.update_world._16.if.then.5:
  addi t5, a0, 0                                                        # ir inst 97 fin
  mv s10, s11                                                           # ir inst 98 fin
  li t1, 200
  mul t2, s10, t1
  add s9, t5, t2                                                        # ir inst 99 fin
  mv t5, t4                                                             # ir inst 100 fin
  slli t2, t5, 2
  add s10, s9, t2                                                       # ir inst 101 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 102 fin
  addi t5, a0, 0                                                        # ir inst 103 fin
  addi s10, t3, 8                                                       # ir inst 104 fin
  lw s9, 0(s10)                                                         # ir inst 105 fin
  mv s10, s9                                                            # ir inst 106 fin
  li t1, 200
  mul t2, s10, t1
  add s9, t5, t2                                                        # ir inst 107 fin
  addi t5, t3, 4                                                        # ir inst 108 fin
  lw s10, 0(t5)                                                         # ir inst 109 fin
  mv t5, s10                                                            # ir inst 110 fin
  slli t2, t5, 2
  add s10, s9, t2                                                       # ir inst 111 fin
  addi t5, t3, 0                                                        # ir inst 112 fin
  lw s9, 0(t5)                                                          # ir inst 113 fin
  addi t5, s9, 1                                                        # ir inst 114 fin
  sw t5, 0(s10)                                                         # ir inst 115 fin
  j .F.update_world._18.if.exit.5                                       # ir inst 116 fin
.F.update_world._17.if.else.5:
  addi t5, t3, 4                                                        # ir inst 117 fin
  sw t4, 0(t5)                                                          # ir inst 118 fin
  addi t5, t3, 8                                                        # ir inst 119 fin
  sw s11, 0(t5)                                                         # ir inst 120 fin
  addi t5, t3, 12                                                       # ir inst 121 fin
  addi t4, t3, 12                                                       # ir inst 122 fin
  lw s11, 0(t4)                                                         # ir inst 123 fin
  addi t4, s11, -5                                                      # ir inst 124 fin
  sw t4, 0(t5)                                                          # ir inst 125 fin
  j .F.update_world._18.if.exit.5                                       # ir inst 126 fin
.F.update_world._18.if.exit.5:
  addi t5, t3, 4                                                        # ir inst 127 fin
  lw t4, 0(t5)                                                          # ir inst 128 fin
  addi t5, t3, 16                                                       # ir inst 129 fin
  lw s11, 0(t5)                                                         # ir inst 130 fin
  xor t0, t4, s11
  sltiu t5, t0, 1                                                       # ir inst 131 fin
  bnez t5, .F.update_world._19.lazy.then.0
  j .F.update_world._20.lazy.else.0                                     # ir inst 132 fin
.F.update_world._19.lazy.then.0:
  addi t5, t3, 8                                                        # ir inst 133 fin
  lw t4, 0(t5)                                                          # ir inst 134 fin
  addi t5, t3, 20                                                       # ir inst 135 fin
  lw s11, 0(t5)                                                         # ir inst 136 fin
  xor t0, t4, s11
  sltiu t5, t0, 1                                                       # ir inst 137 fin
# Phi connections
  j .F.update_world._21.lazy.exit.0                                     # ir inst 138 fin
.F.update_world._20.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.update_world._21.lazy.exit.0                                     # ir inst 139 fin
.F.update_world._21.lazy.exit.0:
  bnez t5, .F.update_world._22.if.then.6
  j .F.update_world._23.if.else.6                                       # ir inst 141 fin
.F.update_world._22.if.then.6:
  addi t5, t3, 0                                                        # ir inst 142 fin
  lw t4, 0(t5)                                                          # ir inst 143 fin
  addi t5, t3, 12                                                       # ir inst 144 fin
  lw s11, 0(t5)                                                         # ir inst 145 fin
  add t5, t4, s11                                                       # ir inst 146 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  mv a0, t3
  call .F.update_agent_target
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 147 fin
  j .F.update_world._24.if.exit.6                                       # ir inst 148 fin
.F.update_world._23.if.else.6:
  j .F.update_world._24.if.exit.6                                       # ir inst 149 fin
.F.update_world._24.if.exit.6:
  addi t5, t3, 12                                                       # ir inst 150 fin
  lw t4, 0(t5)                                                          # ir inst 151 fin
  li t2, 0
  slt t0, t2, t4
  xori t5, t0, 1                                                        # ir inst 152 fin
  bnez t5, .F.update_world._25.if.then.7
  j .F.update_world._26.if.else.7                                       # ir inst 153 fin
.F.update_world._25.if.then.7:
  addi t5, t3, 24                                                       # ir inst 154 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 155 fin
  addi t5, a0, 0                                                        # ir inst 156 fin
  addi t4, t3, 8                                                        # ir inst 157 fin
  lw s11, 0(t4)                                                         # ir inst 158 fin
  mv t4, s11                                                            # ir inst 159 fin
  li t1, 200
  mul t2, t4, t1
  add s11, t5, t2                                                       # ir inst 160 fin
  addi t5, t3, 4                                                        # ir inst 161 fin
  lw t4, 0(t5)                                                          # ir inst 162 fin
  mv t5, t4                                                             # ir inst 163 fin
  slli t2, t5, 2
  add t4, s11, t2                                                       # ir inst 164 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 165 fin
  j .F.update_world._27.if.exit.7                                       # ir inst 166 fin
.F.update_world._26.if.else.7:
  j .F.update_world._27.if.exit.7                                       # ir inst 167 fin
.F.update_world._27.if.exit.7:
  j .F.update_world._29.if.exit.0                                       # ir inst 168 fin
.F.update_world._28.if.else.0:
  j .F.update_world._29.if.exit.0                                       # ir inst 169 fin
.F.update_world._29.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 170 fin
# Phi connections
  mv t6, t5
  j .F.update_world._1.while.cond.0                                     # ir inst 171 fin
.F.update_world._30.while.exit.0:
  j .F.update_world.epilogue                                            # ir inst 172 fin
.F.update_world.epilogue:
  ld ra, 64(sp)
  ld s10, 40(sp)
  ld s9, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.process_interactions
.F.process_interactions:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.process_interactions._0.entry.0:
# Phi connections
  li t6, 0
  j .F.process_interactions._1.while.cond.0                             # ir inst 1 fin
.F.process_interactions._1.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.process_interactions._2.while.body.0
  j .F.process_interactions._21.while.exit.0                            # ir inst 4 fin
.F.process_interactions._2.while.body.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 7 fin
  addi t5, t3, 24                                                       # ir inst 8 fin
  lb t4, 0(t5)                                                          # ir inst 9 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.process_interactions._3.if.then.0
  j .F.process_interactions._4.if.else.0                                # ir inst 11 fin
.F.process_interactions._3.if.then.0:
  addi t5, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t5
  j .F.process_interactions._1.while.cond.0                             # ir inst 13 fin
.F.process_interactions._4.if.else.0:
  j .F.process_interactions._5.if.exit.0                                # ir inst 14 fin
.F.process_interactions._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  j .F.process_interactions._6.while.cond.1                             # ir inst 16 fin
.F.process_interactions._6.while.cond.1:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 18 fin
  bnez t4, .F.process_interactions._7.while.body.1
  j .F.process_interactions._17.while.exit.1                            # ir inst 19 fin
.F.process_interactions._7.while.body.1:
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 20 fin
  mv t3, t5                                                             # ir inst 21 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 22 fin
  addi t4, s11, 24                                                      # ir inst 23 fin
  lb t3, 0(t4)                                                          # ir inst 24 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 25 fin
  bnez t4, .F.process_interactions._8.if.then.1
  j .F.process_interactions._9.if.else.1                                # ir inst 26 fin
.F.process_interactions._8.if.then.1:
  addi t4, t5, 1                                                        # ir inst 27 fin
# Phi connections
  mv t5, t4
  j .F.process_interactions._6.while.cond.1                             # ir inst 28 fin
.F.process_interactions._9.if.else.1:
  j .F.process_interactions._10.if.exit.1                               # ir inst 29 fin
.F.process_interactions._10.if.exit.1:
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 30 fin
  mv t3, t6                                                             # ir inst 31 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 32 fin
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 33 fin
  mv t3, t5                                                             # ir inst 34 fin
  li t1, 28
  mul t2, t3, t1
  add s10, t4, t2                                                       # ir inst 35 fin
  addi t4, s11, 4                                                       # ir inst 36 fin
  lw t3, 0(t4)                                                          # ir inst 37 fin
  addi t4, s10, 4                                                       # ir inst 38 fin
  lw s9, 0(t4)                                                          # ir inst 39 fin
  sub t4, t3, s9                                                        # ir inst 40 fin
  addi t3, s11, 8                                                       # ir inst 41 fin
  lw s9, 0(t3)                                                          # ir inst 42 fin
  addi t3, s10, 8                                                       # ir inst 43 fin
  lw s8, 0(t3)                                                          # ir inst 44 fin
  sub t3, s9, s8                                                        # ir inst 45 fin
  mul s9, t4, t4                                                        # ir inst 46 fin
  mul t4, t3, t3                                                        # ir inst 47 fin
  add t3, s9, t4                                                        # ir inst 48 fin
  li t2, 4
  slt t4, t3, t2                                                        # ir inst 49 fin
  bnez t4, .F.process_interactions._11.if.then.2
  j .F.process_interactions._15.if.else.2                               # ir inst 50 fin
.F.process_interactions._11.if.then.2:
  addi t4, s11, 12                                                      # ir inst 51 fin
  lw t3, 0(t4)                                                          # ir inst 52 fin
  addi t4, s10, 12                                                      # ir inst 53 fin
  lw s11, 0(t4)                                                         # ir inst 54 fin
  slt t4, s11, t3                                                       # ir inst 55 fin
  bnez t4, .F.process_interactions._12.if.then.3
  j .F.process_interactions._13.if.else.3                               # ir inst 56 fin
.F.process_interactions._12.if.then.3:
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 57 fin
  mv t3, t6                                                             # ir inst 58 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 59 fin
  addi t4, s11, 12                                                      # ir inst 60 fin
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 61 fin
  mv s11, t6                                                            # ir inst 62 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 63 fin
  addi t3, s10, 12                                                      # ir inst 64 fin
  lw s11, 0(t3)                                                         # ir inst 65 fin
  addi t3, s11, 10                                                      # ir inst 66 fin
  sw t3, 0(t4)                                                          # ir inst 67 fin
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 68 fin
  mv t3, t5                                                             # ir inst 69 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 70 fin
  addi t4, s11, 12                                                      # ir inst 71 fin
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 72 fin
  mv s11, t5                                                            # ir inst 73 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 74 fin
  addi t3, s10, 12                                                      # ir inst 75 fin
  lw s11, 0(t3)                                                         # ir inst 76 fin
  addi t3, s11, -10                                                     # ir inst 77 fin
  sw t3, 0(t4)                                                          # ir inst 78 fin
  j .F.process_interactions._14.if.exit.3                               # ir inst 79 fin
.F.process_interactions._13.if.else.3:
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 80 fin
  mv t3, t6                                                             # ir inst 81 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 82 fin
  addi t4, s11, 12                                                      # ir inst 83 fin
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 84 fin
  mv s11, t6                                                            # ir inst 85 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 86 fin
  addi t3, s10, 12                                                      # ir inst 87 fin
  lw s11, 0(t3)                                                         # ir inst 88 fin
  addi t3, s11, -10                                                     # ir inst 89 fin
  sw t3, 0(t4)                                                          # ir inst 90 fin
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 91 fin
  mv t3, t5                                                             # ir inst 92 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 93 fin
  addi t4, s11, 12                                                      # ir inst 94 fin
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 95 fin
  mv s11, t5                                                            # ir inst 96 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 97 fin
  addi t3, s10, 12                                                      # ir inst 98 fin
  lw s11, 0(t3)                                                         # ir inst 99 fin
  addi t3, s11, 10                                                      # ir inst 100 fin
  sw t3, 0(t4)                                                          # ir inst 101 fin
  j .F.process_interactions._14.if.exit.3                               # ir inst 102 fin
.F.process_interactions._14.if.exit.3:
  j .F.process_interactions._16.if.exit.2                               # ir inst 103 fin
.F.process_interactions._15.if.else.2:
  j .F.process_interactions._16.if.exit.2                               # ir inst 104 fin
.F.process_interactions._16.if.exit.2:
  addi t4, t5, 1                                                        # ir inst 105 fin
# Phi connections
  mv t5, t4
  j .F.process_interactions._6.while.cond.1                             # ir inst 106 fin
.F.process_interactions._17.while.exit.1:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 107 fin
  mv t4, t6                                                             # ir inst 108 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 109 fin
  addi t5, t3, 4                                                        # ir inst 110 fin
  lw t4, 0(t5)                                                          # ir inst 111 fin
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 112 fin
  mv t3, t6                                                             # ir inst 113 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t5, t2                                                       # ir inst 114 fin
  addi t5, s11, 8                                                       # ir inst 115 fin
  lw t3, 0(t5)                                                          # ir inst 116 fin
  addi t5, a0, 0                                                        # ir inst 117 fin
  mv s11, t3                                                            # ir inst 118 fin
  li t1, 200
  mul t2, s11, t1
  add s10, t5, t2                                                       # ir inst 119 fin
  mv t5, t4                                                             # ir inst 120 fin
  slli t2, t5, 2
  add s11, s10, t2                                                      # ir inst 121 fin
  lw t5, 0(s11)                                                         # ir inst 122 fin
  li t2, 0
  slt s11, t5, t2                                                       # ir inst 123 fin
  bnez s11, .F.process_interactions._18.if.then.4
  j .F.process_interactions._19.if.else.4                               # ir inst 124 fin
.F.process_interactions._18.if.then.4:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 125 fin
  mv s11, t6                                                            # ir inst 126 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t5, t2                                                       # ir inst 127 fin
  addi t5, s10, 12                                                      # ir inst 128 fin
  li s11, 10000
  add s11, a0, s11                                                      # ir inst 129 fin
  mv s10, t6                                                            # ir inst 130 fin
  li t1, 28
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 131 fin
  addi s11, s9, 12                                                      # ir inst 132 fin
  lw s10, 0(s11)                                                        # ir inst 133 fin
  addi s11, a0, 0                                                       # ir inst 134 fin
  mv s9, t3                                                             # ir inst 135 fin
  li t1, 200
  mul t2, s9, t1
  add s8, s11, t2                                                       # ir inst 136 fin
  mv s11, t4                                                            # ir inst 137 fin
  slli t2, s11, 2
  add s9, s8, t2                                                        # ir inst 138 fin
  lw s11, 0(s9)                                                         # ir inst 139 fin
  li t2, -10
  mul s9, s11, t2                                                       # ir inst 140 fin
  add s11, s10, s9                                                      # ir inst 141 fin
  sw s11, 0(t5)                                                         # ir inst 142 fin
  addi t5, a0, 0                                                        # ir inst 143 fin
  mv s11, t3                                                            # ir inst 144 fin
  li t1, 200
  mul t2, s11, t1
  add t3, t5, t2                                                        # ir inst 145 fin
  mv t5, t4                                                             # ir inst 146 fin
  slli t2, t5, 2
  add t4, t3, t2                                                        # ir inst 147 fin
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 148 fin
  mv t3, t6                                                             # ir inst 149 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t5, t2                                                       # ir inst 150 fin
  addi t5, s11, 0                                                       # ir inst 151 fin
  lw t3, 0(t5)                                                          # ir inst 152 fin
  addi t5, t3, 1                                                        # ir inst 153 fin
  sw t5, 0(t4)                                                          # ir inst 154 fin
  j .F.process_interactions._20.if.exit.4                               # ir inst 155 fin
.F.process_interactions._19.if.else.4:
  j .F.process_interactions._20.if.exit.4                               # ir inst 156 fin
.F.process_interactions._20.if.exit.4:
  addi t5, t6, 1                                                        # ir inst 157 fin
# Phi connections
  mv t6, t5
  j .F.process_interactions._1.while.cond.0                             # ir inst 158 fin
.F.process_interactions._21.while.exit.0:
  j .F.process_interactions.epilogue                                    # ir inst 159 fin
.F.process_interactions.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.run_diagnostics
.F.run_diagnostics:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd s10, 32(sp)
  sd ra, 40(sp)
.F.run_diagnostics._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.run_diagnostics._1.while.cond.0                                  # ir inst 1 fin
.F.run_diagnostics._1.while.cond.0:
  li t2, 20
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.run_diagnostics._2.while.body.0
  j .F.run_diagnostics._6.while.exit.0                                  # ir inst 6 fin
.F.run_diagnostics._2.while.body.0:
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 7 fin
  mv s11, t6                                                            # ir inst 8 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 9 fin
  addi t3, s10, 24                                                      # ir inst 10 fin
  lb s11, 0(t3)                                                         # ir inst 11 fin
  bnez s11, .F.run_diagnostics._3.if.then.0
  j .F.run_diagnostics._4.if.else.0                                     # ir inst 12 fin
.F.run_diagnostics._3.if.then.0:
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 13 fin
  mv s11, t6                                                            # ir inst 14 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 15 fin
  addi t3, s10, 12                                                      # ir inst 16 fin
  lw s11, 0(t3)                                                         # ir inst 17 fin
  add t3, t4, s11                                                       # ir inst 18 fin
  addi s11, t5, 1                                                       # ir inst 19 fin
# Phi connections
  mv t0, s11
  mv s11, t3
  mv t3, t0
  j .F.run_diagnostics._5.if.exit.0                                     # ir inst 20 fin
.F.run_diagnostics._4.if.else.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.run_diagnostics._5.if.exit.0                                     # ir inst 21 fin
.F.run_diagnostics._5.if.exit.0:
  addi s10, t6, 1                                                       # ir inst 24 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.run_diagnostics._1.while.cond.0                                  # ir inst 25 fin
.F.run_diagnostics._6.while.exit.0:
  li t1, 100000
  add t6, t1, t5                                                        # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 27 fin
  li t1, 200000
  add t6, t1, t4                                                        # ir inst 28 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  call .F.provoke_error
  ld a0, 0(sp)
# ir inst 30 fin
  j .F.run_diagnostics.epilogue                                         # ir inst 31 fin
.F.run_diagnostics.epilogue:
  ld ra, 40(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.final_report
.F.final_report:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.final_report._0.entry.0:
# Phi connections
  li t6, 0
  j .F.final_report._1.while.cond.0                                     # ir inst 1 fin
.F.final_report._1.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.final_report._2.while.body.0
  j .F.final_report._6.while.exit.0                                     # ir inst 4 fin
.F.final_report._2.while.body.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 7 fin
  addi t5, t3, 24                                                       # ir inst 8 fin
  lb t4, 0(t5)                                                          # ir inst 9 fin
  bnez t4, .F.final_report._3.if.then.0
  j .F.final_report._4.if.else.0                                        # ir inst 10 fin
.F.final_report._3.if.then.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 0                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  li t2, 10000
  mul t5, t4, t2                                                        # ir inst 16 fin
  li t4, 10000
  add t4, a0, t4                                                        # ir inst 17 fin
  mv t3, t6                                                             # ir inst 18 fin
  li t1, 28
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 19 fin
  addi t4, s11, 12                                                      # ir inst 20 fin
  lw t3, 0(t4)                                                          # ir inst 21 fin
  add t4, t5, t3                                                        # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 23 fin
  j .F.final_report._5.if.exit.0                                        # ir inst 24 fin
.F.final_report._4.if.else.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 25 fin
  mv t4, t6                                                             # ir inst 26 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 27 fin
  addi t5, t3, 0                                                        # ir inst 28 fin
  lw t4, 0(t5)                                                          # ir inst 29 fin
  li t2, 10000
  mul t5, t4, t2                                                        # ir inst 30 fin
  addi t4, t5, -1                                                       # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 32 fin
  j .F.final_report._5.if.exit.0                                        # ir inst 33 fin
.F.final_report._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 34 fin
# Phi connections
  mv t6, t5
  j .F.final_report._1.while.cond.0                                     # ir inst 35 fin
.F.final_report._6.while.exit.0:
  j .F.final_report.epilogue                                            # ir inst 36 fin
.F.final_report.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl .F.clamp
.F.clamp:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.clamp._0.entry.0:
  slt t6, a0, a1                                                        # ir inst 1 fin
  bnez t6, .F.clamp._1.if.then.0
  j .F.clamp._2.if.else.0                                               # ir inst 2 fin
.F.clamp._1.if.then.0:
  mv a0, a1
  j .F.clamp.epilogue                                                   # ir inst 3 fin
.F.clamp._2.if.else.0:
  j .F.clamp._3.if.exit.0                                               # ir inst 4 fin
.F.clamp._3.if.exit.0:
  slt t6, a2, a0                                                        # ir inst 5 fin
  bnez t6, .F.clamp._4.if.then.1
  j .F.clamp._5.if.else.1                                               # ir inst 6 fin
.F.clamp._4.if.then.1:
  mv a0, a2
  j .F.clamp.epilogue                                                   # ir inst 7 fin
.F.clamp._5.if.else.1:
  j .F.clamp._6.if.exit.1                                               # ir inst 8 fin
.F.clamp._6.if.exit.1:
  j .F.clamp.epilogue                                                   # ir inst 9 fin
.F.clamp.epilogue:
  ret

.globl .F.provoke_error
.F.provoke_error:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 56,                 range:       56(sp) -      112(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 3 / 12,        range:       24(sp) -       48(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s9, 24(sp)
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.provoke_error._0.entry.0:
  li t6, 10000
  add t6, a0, t6                                                        # ir inst 2 fin
  addi t5, t6, 0                                                        # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  li a2, 28
  mv a1, t5
  addi t1, sp, 56
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 4 fin
  addi t1, sp, 56
  addi t6, t1, 12                                                       # ir inst 5 fin
  li t1, -100
  sw t1, 0(t6)                                                          # ir inst 6 fin
# Phi connections
  li t6, 0
  j .F.provoke_error._1.while.cond.0                                    # ir inst 7 fin
.F.provoke_error._1.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 9 fin
  bnez t5, .F.provoke_error._2.while.body.0
  j .F.provoke_error._12.while.exit.0                                   # ir inst 10 fin
.F.provoke_error._2.while.body.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 24                                                       # ir inst 14 fin
  lb t4, 0(t5)                                                          # ir inst 15 fin
  bnez t4, .F.provoke_error._3.if.then.0
  j .F.provoke_error._10.if.else.0                                      # ir inst 16 fin
.F.provoke_error._3.if.then.0:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 17 fin
  mv t4, t6                                                             # ir inst 18 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 19 fin
  addi t5, t3, 12                                                       # ir inst 20 fin
  lw t4, 0(t5)                                                          # ir inst 21 fin
  li t2, 150
  slt t5, t2, t4                                                        # ir inst 22 fin
  bnez t5, .F.provoke_error._4.if.then.1
  j .F.provoke_error._8.if.else.1                                       # ir inst 23 fin
.F.provoke_error._4.if.then.1:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 25 fin
  mv t4, t6                                                             # ir inst 26 fin
  li t1, 28
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  mv a1, t3
  addi t1, sp, 84
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t6, 16(sp)
# ir inst 28 fin
  addi t1, sp, 84
  addi t5, t1, 12                                                       # ir inst 29 fin
  addi t1, sp, 84
  addi t4, t1, 12                                                       # ir inst 30 fin
  lw t3, 0(t4)                                                          # ir inst 31 fin
  li t2, 2
  div t4, t3, t2                                                        # ir inst 32 fin
  sw t4, 0(t5)                                                          # ir inst 33 fin
  addi t1, sp, 84
  addi t5, t1, 12                                                       # ir inst 34 fin
  lw t4, 0(t5)                                                          # ir inst 35 fin
  li t2, 100
  slt t5, t2, t4                                                        # ir inst 36 fin
  bnez t5, .F.provoke_error._5.if.then.2
  j .F.provoke_error._6.if.else.2                                       # ir inst 37 fin
.F.provoke_error._5.if.then.2:
  addi t1, sp, 84
  addi t5, t1, 0                                                        # ir inst 38 fin
  lw t4, 0(t5)                                                          # ir inst 39 fin
  li t2, 5000
  add t5, t4, t2                                                        # ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 41 fin
  j .F.provoke_error._7.if.exit.2                                       # ir inst 42 fin
.F.provoke_error._6.if.else.2:
  j .F.provoke_error._7.if.exit.2                                       # ir inst 43 fin
.F.provoke_error._7.if.exit.2:
  j .F.provoke_error._9.if.exit.1                                       # ir inst 44 fin
.F.provoke_error._8.if.else.1:
  j .F.provoke_error._9.if.exit.1                                       # ir inst 45 fin
.F.provoke_error._9.if.exit.1:
  j .F.provoke_error._11.if.exit.0                                      # ir inst 46 fin
.F.provoke_error._10.if.else.0:
  j .F.provoke_error._11.if.exit.0                                      # ir inst 47 fin
.F.provoke_error._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t6, t5
  j .F.provoke_error._1.while.cond.0                                    # ir inst 49 fin
.F.provoke_error._12.while.exit.0:
# Phi connections
  li t4, 0
  li t5, -1
  li t6, -1
  j .F.provoke_error._13.while.cond.1                                   # ir inst 50 fin
.F.provoke_error._13.while.cond.1:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 54 fin
  bnez t3, .F.provoke_error._14.while.body.1
  j .F.provoke_error._21.while.exit.1                                   # ir inst 55 fin
.F.provoke_error._14.while.body.1:
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 56 fin
  mv s11, t4                                                            # ir inst 57 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 58 fin
  addi t3, s10, 24                                                      # ir inst 59 fin
  lb s11, 0(t3)                                                         # ir inst 60 fin
  bnez s11, .F.provoke_error._15.if.then.3
  j .F.provoke_error._19.if.else.3                                      # ir inst 61 fin
.F.provoke_error._15.if.then.3:
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 62 fin
  mv s11, t4                                                            # ir inst 63 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 64 fin
  addi t3, s10, 12                                                      # ir inst 65 fin
  lw s11, 0(t3)                                                         # ir inst 66 fin
  slt t3, t5, s11                                                       # ir inst 67 fin
  bnez t3, .F.provoke_error._16.if.then.4
  j .F.provoke_error._17.if.else.4                                      # ir inst 68 fin
.F.provoke_error._16.if.then.4:
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 69 fin
  mv s11, t4                                                            # ir inst 70 fin
  li t1, 28
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 71 fin
  addi t3, s10, 12                                                      # ir inst 72 fin
  lw s11, 0(t3)                                                         # ir inst 73 fin
  li t3, 10000
  add t3, a0, t3                                                        # ir inst 74 fin
  mv s10, t4                                                            # ir inst 75 fin
  li t1, 28
  mul t2, s10, t1
  add s9, t3, t2                                                        # ir inst 76 fin
  addi t3, s9, 0                                                        # ir inst 77 fin
  lw s10, 0(t3)                                                         # ir inst 78 fin
# Phi connections
  mv t3, s10
  j .F.provoke_error._18.if.exit.4                                      # ir inst 79 fin
.F.provoke_error._17.if.else.4:
# Phi connections
  mv s11, t5
  mv t3, t6
  j .F.provoke_error._18.if.exit.4                                      # ir inst 80 fin
.F.provoke_error._18.if.exit.4:
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.provoke_error._20.if.exit.3                                      # ir inst 83 fin
.F.provoke_error._19.if.else.3:
# Phi connections
  mv t3, t5
  mv t5, t6
  j .F.provoke_error._20.if.exit.3                                      # ir inst 84 fin
.F.provoke_error._20.if.exit.3:
  addi s11, t4, 1                                                       # ir inst 87 fin
# Phi connections
  mv t4, s11
  mv t6, t5
  mv t5, t3
  j .F.provoke_error._13.while.cond.1                                   # ir inst 88 fin
.F.provoke_error._21.while.exit.1:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 89 fin
  bnez t5, .F.provoke_error._22.if.then.5
  j .F.provoke_error._23.if.else.5                                      # ir inst 90 fin
.F.provoke_error._22.if.then.5:
  li t5, 10000
  add t5, a0, t5                                                        # ir inst 91 fin
  mv t4, t6                                                             # ir inst 92 fin
  li t1, 28
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 93 fin
  addi t5, t6, 12                                                       # ir inst 94 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 95 fin
  j .F.provoke_error._24.if.exit.5                                      # ir inst 96 fin
.F.provoke_error._23.if.else.5:
  j .F.provoke_error._24.if.exit.5                                      # ir inst 97 fin
.F.provoke_error._24.if.exit.5:
  j .F.provoke_error.epilogue                                           # ir inst 98 fin
.F.provoke_error.epilogue:
  ld ra, 48(sp)
  ld s9, 24(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 112
  ret

.globl .F.another_simulation_scenario
.F.another_simulation_scenario:
# spill func args num: 0,             range:    10832(sp) -    10832(sp)
# local var size: 10788,              range:       32(sp) -    10820(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10832
  add sp, sp, t0
  sd ra, 24(sp)
.F.another_simulation_scenario._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 10592
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t4, 0
  j .F.another_simulation_scenario._1.array.cond.0                      # ir inst 5 fin
.F.another_simulation_scenario._1.array.cond.0:
  li t2, 50
  slt t3, t4, t2                                                        # ir inst 7 fin
  bnez t3, .F.another_simulation_scenario._2.array.body.0
  j .F.another_simulation_scenario._3.array.exit.0                      # ir inst 8 fin
.F.another_simulation_scenario._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 10 fin
  addi t3, t4, 1                                                        # ir inst 11 fin
# Phi connections
  mv t4, t3
  j .F.another_simulation_scenario._1.array.cond.0                      # ir inst 12 fin
.F.another_simulation_scenario._3.array.exit.0:
  addi t5, t6, 0                                                        # ir inst 13 fin
# Phi connections
  li t6, 0
  j .F.another_simulation_scenario._4.array.cond.1                      # ir inst 14 fin
.F.another_simulation_scenario._4.array.cond.1:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, .F.another_simulation_scenario._5.array.body.1
  j .F.another_simulation_scenario._6.array.exit.1                      # ir inst 17 fin
.F.another_simulation_scenario._5.array.body.1:
  li t1, 200
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 18 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 200
  li t1, 10592
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t4
  j .F.another_simulation_scenario._4.array.cond.1                      # ir inst 21 fin
.F.another_simulation_scenario._6.array.exit.1:
  addi t1, sp, 32
  li t6, 10000
  add t6, t1, t6                                                        # ir inst 22 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 25 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 26 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 27 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 29 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 30 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 31 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 16                                                       # ir inst 32 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 33 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 20                                                       # ir inst 34 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 35 fin
  li t1, 10792
  add t1, sp, t1
  addi t5, t1, 24                                                       # ir inst 36 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 37 fin
  addi t5, t6, 0                                                        # ir inst 38 fin
# Phi connections
  li t6, 0
  j .F.another_simulation_scenario._7.array.cond.2                      # ir inst 39 fin
.F.another_simulation_scenario._7.array.cond.2:
  li t2, 20
  slt t4, t6, t2                                                        # ir inst 41 fin
  bnez t4, .F.another_simulation_scenario._8.array.body.2
  j .F.another_simulation_scenario._9.array.exit.2                      # ir inst 42 fin
.F.another_simulation_scenario._8.array.body.2:
  li t1, 28
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 43 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  li t1, 10792
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 44 fin
  addi t4, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t6, t4
  j .F.another_simulation_scenario._7.array.cond.2                      # ir inst 46 fin
.F.another_simulation_scenario._9.array.exit.2:
# Start call preparation
  li a1, 11223
  addi t1, sp, 32
  mv a0, t1
  call .F.initialize_world
# ir inst 47 fin
# Phi connections
  li t6, 0
  j .F.another_simulation_scenario._10.while.cond.0                     # ir inst 48 fin
.F.another_simulation_scenario._10.while.cond.0:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 50 fin
  bnez t5, .F.another_simulation_scenario._11.while.body.0
  j .F.another_simulation_scenario._12.while.exit.0                     # ir inst 51 fin
.F.another_simulation_scenario._11.while.body.0:
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 32
  mv a0, t1
  call .F.update_world
  ld t6, 0(sp)
# ir inst 52 fin
  addi t5, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t5
  j .F.another_simulation_scenario._10.while.cond.0                     # ir inst 54 fin
.F.another_simulation_scenario._12.while.exit.0:
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.process_interactions
# ir inst 55 fin
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.final_report
# ir inst 56 fin
  j .F.another_simulation_scenario.epilogue                             # ir inst 57 fin
.F.another_simulation_scenario.epilogue:
  ld ra, 24(sp)
  li t0, 10832
  add sp, sp, t0
  ret
