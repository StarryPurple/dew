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

.globl .F.pseudo_rand
.F.pseudo_rand:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.pseudo_rand._0.entry.0:
  lw t6, 0(a0)                                                          # ir inst 1 fin
  li t2, 127
  mul t5, t6, t2                                                        # ir inst 2 fin
  li t2, 16777337
  add t6, t5, t2                                                        # ir inst 3 fin
  li t2, 16777215
  and t5, t6, t2                                                        # ir inst 4 fin
  sw t5, 0(a0)                                                          # ir inst 5 fin
  lw t6, 0(a0)                                                          # ir inst 6 fin
  mv a0, t6
  j .F.pseudo_rand.epilogue                                             # ir inst 7 fin
.F.pseudo_rand.epilogue:
  ret

.globl .F.init_population
.F.init_population:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.init_population._0.entry.0:
# Phi connections
  li t6, 0
  j .F.init_population._1.while.cond.0                                  # ir inst 1 fin
.F.init_population._1.while.cond.0:
  li t2, 64
  sltu t5, t6, t2                                                       # ir inst 3 fin
  bnez t5, .F.init_population._2.while.body.0
  j .F.init_population._6.while.exit.0                                  # ir inst 4 fin
.F.init_population._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.init_population._3.while.cond.1                                  # ir inst 5 fin
.F.init_population._3.while.cond.1:
  li t2, 16
  sltu t4, t5, t2                                                       # ir inst 7 fin
  bnez t4, .F.init_population._4.while.body.1
  j .F.init_population._5.while.exit.1                                  # ir inst 8 fin
.F.init_population._4.while.body.1:
  li t1, 68
  mul t2, t6, t1
  add t4, a0, t2                                                        # ir inst 9 fin
  addi t3, t4, 0                                                        # ir inst 10 fin
  slli t2, t5, 2
  add t4, t3, t2                                                        # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, a1
  call .F.pseudo_rand
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 12 fin
  li t2, 200
  rem s11, t3, t2                                                       # ir inst 13 fin
  addi t3, s11, -100                                                    # ir inst 14 fin
  sw t3, 0(t4)                                                          # ir inst 15 fin
  addi t4, t5, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.init_population._3.while.cond.1                                  # ir inst 17 fin
.F.init_population._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 18 fin
# Phi connections
  mv t6, t5
  j .F.init_population._1.while.cond.0                                  # ir inst 19 fin
.F.init_population._6.while.exit.0:
  j .F.init_population.epilogue                                         # ir inst 20 fin
.F.init_population.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.calculate_fitness
.F.calculate_fitness:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s11, 8(sp)
  sd s10, 16(sp)
.F.calculate_fitness._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.calculate_fitness._1.while.cond.0                                # ir inst 1 fin
.F.calculate_fitness._1.while.cond.0:
  li t2, 16
  sltu t3, t6, t2                                                       # ir inst 5 fin
  bnez t3, .F.calculate_fitness._2.while.body.0
  j .F.calculate_fitness._9.while.exit.0                                # ir inst 6 fin
.F.calculate_fitness._2.while.body.0:
  addi t3, a0, 0                                                        # ir inst 7 fin
  slli t2, t6, 2
  add s11, t3, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  add s11, t4, t3                                                       # ir inst 10 fin
  addi t3, a0, 0                                                        # ir inst 11 fin
  slli t2, t6, 2
  add s10, t3, t2                                                       # ir inst 12 fin
  lw t3, 0(s10)                                                         # ir inst 13 fin
  li t2, 90
  slt s10, t2, t3                                                       # ir inst 14 fin
  bnez s10, .F.calculate_fitness._3.lazy.then.0
  j .F.calculate_fitness._4.lazy.else.0                                 # ir inst 15 fin
.F.calculate_fitness._3.lazy.then.0:
# Phi connections
  li t3, 1
  j .F.calculate_fitness._5.lazy.exit.0                                 # ir inst 16 fin
.F.calculate_fitness._4.lazy.else.0:
  addi t3, a0, 0                                                        # ir inst 17 fin
  slli t2, t6, 2
  add s10, t3, t2                                                       # ir inst 18 fin
  lw t3, 0(s10)                                                         # ir inst 19 fin
  li t2, -90
  slt s10, t3, t2                                                       # ir inst 20 fin
# Phi connections
  mv t3, s10
  j .F.calculate_fitness._5.lazy.exit.0                                 # ir inst 21 fin
.F.calculate_fitness._5.lazy.exit.0:
  bnez t3, .F.calculate_fitness._6.if.then.0
  j .F.calculate_fitness._7.if.else.0                                   # ir inst 23 fin
.F.calculate_fitness._6.if.then.0:
  addi t3, a0, 0                                                        # ir inst 24 fin
  slli t2, t6, 2
  add s10, t3, t2                                                       # ir inst 25 fin
  lw t3, 0(s10)                                                         # ir inst 26 fin
  addi s10, a0, 0                                                       # ir inst 27 fin
  slli t2, t6, 2
  add s9, s10, t2                                                       # ir inst 28 fin
  lw s10, 0(s9)                                                         # ir inst 29 fin
  mul s9, t3, s10                                                       # ir inst 30 fin
  add t3, t5, s9                                                        # ir inst 31 fin
# Phi connections
  j .F.calculate_fitness._8.if.exit.0                                   # ir inst 32 fin
.F.calculate_fitness._7.if.else.0:
# Phi connections
  mv t3, t5
  j .F.calculate_fitness._8.if.exit.0                                   # ir inst 33 fin
.F.calculate_fitness._8.if.exit.0:
  addi s10, t6, 1                                                       # ir inst 35 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.calculate_fitness._1.while.cond.0                                # ir inst 36 fin
.F.calculate_fitness._9.while.exit.0:
  li t1, 500
  sub t6, t1, t4                                                        # ir inst 37 fin
  addi t4, a0, 64                                                       # ir inst 38 fin
  mul t3, t6, t6                                                        # ir inst 39 fin
  li t1, 0
  sub t6, t1, t3                                                        # ir inst 40 fin
  sub t3, t6, t5                                                        # ir inst 41 fin
  sw t3, 0(t4)                                                          # ir inst 42 fin
  j .F.calculate_fitness.epilogue                                       # ir inst 43 fin
.F.calculate_fitness.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.evaluate_population
.F.evaluate_population:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.evaluate_population._0.entry.0:
# Phi connections
  li t6, 0
  j .F.evaluate_population._1.while.cond.0                              # ir inst 1 fin
.F.evaluate_population._1.while.cond.0:
  li t2, 64
  sltu t5, t6, t2                                                       # ir inst 3 fin
  bnez t5, .F.evaluate_population._2.while.body.0
  j .F.evaluate_population._3.while.exit.0                              # ir inst 4 fin
.F.evaluate_population._2.while.body.0:
  li t1, 68
  mul t2, t6, t1
  add t5, a0, t2                                                        # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call .F.calculate_fitness
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  addi t5, t6, 1                                                        # ir inst 7 fin
# Phi connections
  mv t6, t5
  j .F.evaluate_population._1.while.cond.0                              # ir inst 8 fin
.F.evaluate_population._3.while.exit.0:
  j .F.evaluate_population.epilogue                                     # ir inst 9 fin
.F.evaluate_population.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.selection
.F.selection:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 2 / 12,        range:       48(sp) -       64(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.selection._0.entry.0:
# Phi connections
  li t4, -1
  li t5, -99999999
  li t6, 0
  j .F.selection._1.while.cond.0                                        # ir inst 1 fin
.F.selection._1.while.cond.0:
  li t2, 5
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.selection._2.while.body.0
  j .F.selection._6.while.exit.0                                        # ir inst 6 fin
.F.selection._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, a1
  call .F.pseudo_rand
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 7 fin
  mv s11, t3                                                            # ir inst 8 fin
  li t2, 64
  remu t3, s11, t2                                                      # ir inst 9 fin
  li t1, 68
  mul t2, t3, t1
  add s11, a0, t2                                                       # ir inst 10 fin
  addi s10, s11, 64                                                     # ir inst 11 fin
  lw s11, 0(s10)                                                        # ir inst 12 fin
  slt s10, t5, s11                                                      # ir inst 13 fin
  bnez s10, .F.selection._3.if.then.0
  j .F.selection._4.if.else.0                                           # ir inst 14 fin
.F.selection._3.if.then.0:
  li t1, 68
  mul t2, t3, t1
  add s11, a0, t2                                                       # ir inst 15 fin
  addi s10, s11, 64                                                     # ir inst 16 fin
  lw s11, 0(s10)                                                        # ir inst 17 fin
  mv s10, t3                                                            # ir inst 18 fin
# Phi connections
  mv t3, s10
  mv t5, s11
  j .F.selection._5.if.exit.0                                           # ir inst 19 fin
.F.selection._4.if.else.0:
# Phi connections
  mv t3, t4
  j .F.selection._5.if.exit.0                                           # ir inst 20 fin
.F.selection._5.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 23 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.selection._1.while.cond.0                                        # ir inst 24 fin
.F.selection._6.while.exit.0:
  mv a0, t4
  j .F.selection.epilogue                                               # ir inst 25 fin
.F.selection.epilogue:
  ld ra, 64(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.crossover
.F.crossover:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.crossover._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a0, a3
  call .F.pseudo_rand
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 1 fin
  li t2, 16
  rem t5, t6, t2                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.crossover._1.while.cond.0                                        # ir inst 3 fin
.F.crossover._1.while.cond.0:
  li t2, 16
  sltu t4, t6, t2                                                       # ir inst 5 fin
  bnez t4, .F.crossover._2.while.body.0
  j .F.crossover._6.while.exit.0                                        # ir inst 6 fin
.F.crossover._2.while.body.0:
  mv t4, t5                                                             # ir inst 7 fin
  sltu t3, t6, t4                                                       # ir inst 8 fin
  bnez t3, .F.crossover._3.if.then.0
  j .F.crossover._4.if.else.0                                           # ir inst 9 fin
.F.crossover._3.if.then.0:
  addi t4, a2, 0                                                        # ir inst 10 fin
  slli t2, t6, 2
  add t3, t4, t2                                                        # ir inst 11 fin
  addi t4, a0, 0                                                        # ir inst 12 fin
  slli t2, t6, 2
  add s11, t4, t2                                                       # ir inst 13 fin
  lw t4, 0(s11)                                                         # ir inst 14 fin
  sw t4, 0(t3)                                                          # ir inst 15 fin
  j .F.crossover._5.if.exit.0                                           # ir inst 16 fin
.F.crossover._4.if.else.0:
  addi t4, a2, 0                                                        # ir inst 17 fin
  slli t2, t6, 2
  add t3, t4, t2                                                        # ir inst 18 fin
  addi t4, a1, 0                                                        # ir inst 19 fin
  slli t2, t6, 2
  add s11, t4, t2                                                       # ir inst 20 fin
  lw t4, 0(s11)                                                         # ir inst 21 fin
  sw t4, 0(t3)                                                          # ir inst 22 fin
  j .F.crossover._5.if.exit.0                                           # ir inst 23 fin
.F.crossover._5.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t6, t4
  j .F.crossover._1.while.cond.0                                        # ir inst 25 fin
.F.crossover._6.while.exit.0:
  j .F.crossover.epilogue                                               # ir inst 26 fin
.F.crossover.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.mutate
.F.mutate:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.mutate._0.entry.0:
# Phi connections
  li t6, 0
  j .F.mutate._1.while.cond.0                                           # ir inst 1 fin
.F.mutate._1.while.cond.0:
  li t2, 16
  sltu t5, t6, t2                                                       # ir inst 3 fin
  bnez t5, .F.mutate._2.while.body.0
  j .F.mutate._6.while.exit.0                                           # ir inst 4 fin
.F.mutate._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  mv a0, a1
  call .F.pseudo_rand
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 5 fin
  li t2, 100
  rem t4, t5, t2                                                        # ir inst 6 fin
  li t2, 10
  slt t5, t4, t2                                                        # ir inst 7 fin
  bnez t5, .F.mutate._3.if.then.0
  j .F.mutate._4.if.else.0                                              # ir inst 8 fin
.F.mutate._3.if.then.0:
  addi t5, a0, 0                                                        # ir inst 9 fin
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 10 fin
  addi t5, a0, 0                                                        # ir inst 11 fin
  slli t2, t6, 2
  add t3, t5, t2                                                        # ir inst 12 fin
  lw t5, 0(t3)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, a1
  call .F.pseudo_rand
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 14 fin
  li t2, 20
  rem s11, t3, t2                                                       # ir inst 15 fin
  addi t3, s11, -10                                                     # ir inst 16 fin
  add s11, t5, t3                                                       # ir inst 17 fin
  sw s11, 0(t4)                                                         # ir inst 18 fin
  j .F.mutate._5.if.exit.0                                              # ir inst 19 fin
.F.mutate._4.if.else.0:
  j .F.mutate._5.if.exit.0                                              # ir inst 20 fin
.F.mutate._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.mutate._1.while.cond.0                                           # ir inst 22 fin
.F.mutate._6.while.exit.0:
  j .F.mutate.epilogue                                                  # ir inst 23 fin
.F.mutate.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl main
main:
# spill func args num: 0,             range:     8896(sp) -     8896(sp)
# local var size: 8844,               range:       48(sp) -     8892(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8896
  add sp, sp, t0
  sd s11, 32(sp)
  sd ra, 40(sp)
main._0.entry.0:
  li t1, 4400
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
  addi t5, t6, 0                                                        # ir inst 4 fin
# Phi connections
  li t6, 0
  j main._1.array.cond.0                                                # ir inst 5 fin
main._1.array.cond.0:
  li t2, 16
  slt t4, t6, t2                                                        # ir inst 7 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 8 fin
main._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t4
  j main._1.array.cond.0                                                # ir inst 12 fin
main._3.array.exit.0:
  li t1, 4400
  add t1, sp, t1
  addi t6, t1, 64                                                       # ir inst 13 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 16 fin
main._4.array.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 18 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 19 fin
main._5.array.body.1:
  li t1, 68
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 20 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 68
  li t1, 4400
  add t1, sp, t1
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
# alloca %14
  li t2, 4468
  add t2, sp, t2
  li t1, 12345
  sw t1, 0(t2)                                                          # ir inst 25 fin
# Start call preparation
  li t1, 4468
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.init_population
# ir inst 26 fin
# Phi connections
  li t6, 0
  j main._7.while.cond.0                                                # ir inst 27 fin
main._7.while.cond.0:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 29 fin
  bnez t5, main._8.while.body.0
  j main._21.while.exit.0                                               # ir inst 30 fin
main._8.while.body.0:
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F.evaluate_population
  ld t6, 0(sp)
# ir inst 31 fin
  li t1, 8824
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 34 fin
  addi t4, t5, 0                                                        # ir inst 35 fin
# Phi connections
  li t5, 0
  j main._9.array.cond.2                                                # ir inst 36 fin
main._9.array.cond.2:
  li t2, 16
  slt t3, t5, t2                                                        # ir inst 38 fin
  bnez t3, main._10.array.body.2
  j main._11.array.exit.2                                               # ir inst 39 fin
main._10.array.body.2:
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 40 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 41 fin
  addi t3, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t3
  j main._9.array.cond.2                                                # ir inst 43 fin
main._11.array.exit.2:
  li t1, 8824
  add t1, sp, t1
  addi t5, t1, 64                                                       # ir inst 44 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 45 fin
  li t1, 4472
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 46 fin
# Phi connections
  li t4, 0
  j main._12.array.cond.3                                               # ir inst 47 fin
main._12.array.cond.3:
  li t2, 64
  slt t3, t4, t2                                                        # ir inst 49 fin
  bnez t3, main._13.array.body.3
  j main._14.array.exit.3                                               # ir inst 50 fin
main._13.array.body.3:
  li t1, 68
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 51 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 68
  li t1, 8824
  add t1, sp, t1
  mv a1, t1
  mv a0, t3
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 52 fin
  addi t3, t4, 1                                                        # ir inst 53 fin
# Phi connections
  mv t4, t3
  j main._12.array.cond.3                                               # ir inst 54 fin
main._14.array.exit.3:
# Phi connections
  li t5, 0
  j main._15.while.cond.1                                               # ir inst 55 fin
main._15.while.cond.1:
  li t2, 64
  sltu t4, t5, t2                                                       # ir inst 57 fin
  bnez t4, main._16.while.body.1
  j main._17.while.exit.1                                               # ir inst 58 fin
main._16.while.body.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li t1, 4468
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.selection
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 59 fin
  mv t3, t4                                                             # ir inst 60 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 4468
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.selection
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 61 fin
  mv s11, t4                                                            # ir inst 62 fin
  li t1, 68
  mul t2, t3, t1
  addi t1, sp, 48
  add t4, t1, t2                                                        # ir inst 63 fin
  li t1, 68
  mul t2, s11, t1
  addi t1, sp, 48
  add t3, t1, t2                                                        # ir inst 64 fin
  li t1, 68
  mul t2, t5, t1
  li t1, 4472
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 65 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 4468
  add t1, sp, t1
  mv a3, t1
  mv a2, s11
  mv a1, t3
  mv a0, t4
  call .F.crossover
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 66 fin
  li t1, 68
  mul t2, t5, t1
  li t1, 4472
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 67 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 4468
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call .F.mutate
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 68 fin
  addi t4, t5, 1                                                        # ir inst 69 fin
# Phi connections
  mv t5, t4
  j main._15.while.cond.1                                               # ir inst 70 fin
main._17.while.exit.1:
# Phi connections
  li t5, 0
  j main._18.while.cond.2                                               # ir inst 71 fin
main._18.while.cond.2:
  li t2, 64
  sltu t4, t5, t2                                                       # ir inst 73 fin
  bnez t4, main._19.while.body.2
  j main._20.while.exit.2                                               # ir inst 74 fin
main._19.while.body.2:
  li t1, 68
  mul t2, t5, t1
  addi t1, sp, 48
  add t4, t1, t2                                                        # ir inst 75 fin
  li t1, 68
  mul t2, t5, t1
  li t1, 4472
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 76 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 68
  mv a1, t3
  mv a0, t4
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 77 fin
  addi t4, t5, 1                                                        # ir inst 78 fin
# Phi connections
  mv t5, t4
  j main._18.while.cond.2                                               # ir inst 79 fin
main._20.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 80 fin
# Phi connections
  mv t6, t5
  j main._7.while.cond.0                                                # ir inst 81 fin
main._21.while.exit.0:
# Start call preparation
  addi t1, sp, 48
  mv a0, t1
  call .F.evaluate_population
# ir inst 82 fin
# Phi connections
  li t5, -99999999
  li t6, 0
  j main._22.while.cond.3                                               # ir inst 83 fin
main._22.while.cond.3:
  li t2, 64
  sltu t4, t6, t2                                                       # ir inst 86 fin
  bnez t4, main._23.while.body.3
  j main._27.while.exit.3                                               # ir inst 87 fin
main._23.while.body.3:
  li t1, 68
  mul t2, t6, t1
  addi t1, sp, 48
  add t4, t1, t2                                                        # ir inst 88 fin
  addi t3, t4, 64                                                       # ir inst 89 fin
  lw t4, 0(t3)                                                          # ir inst 90 fin
  slt t3, t5, t4                                                        # ir inst 91 fin
  bnez t3, main._24.if.then.0
  j main._25.if.else.0                                                  # ir inst 92 fin
main._24.if.then.0:
  li t1, 68
  mul t2, t6, t1
  addi t1, sp, 48
  add t4, t1, t2                                                        # ir inst 93 fin
  addi t3, t4, 64                                                       # ir inst 94 fin
  lw t4, 0(t3)                                                          # ir inst 95 fin
# Phi connections
  j main._26.if.exit.0                                                  # ir inst 96 fin
main._25.if.else.0:
# Phi connections
  mv t4, t5
  j main._26.if.exit.0                                                  # ir inst 97 fin
main._26.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 99 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j main._22.while.cond.3                                               # ir inst 100 fin
main._27.while.exit.3:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 101 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 102 fin
  j main.epilogue                                                       # ir inst 103 fin
main.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  li t0, 8896
  add sp, sp, t0
  ret
