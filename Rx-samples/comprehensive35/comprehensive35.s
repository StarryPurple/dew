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
# spill func args num: 0,             range:     1728(sp) -     1728(sp)
# local var size: 1680,               range:       48(sp) -     1728(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1728
  sd s11, 32(sp)
  sd ra, 40(sp)
main._0.entry.0:
  addi t1, sp, 1648
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 4 fin
main._1.array.cond.0:
  li t2, 20
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
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 16 fin
main._5.array.body.1:
  li t1, 80
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 80
  addi t1, sp, 1648
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
# Start call preparation
  li a1, 54321
  addi t1, sp, 48
  mv a0, t1
  call .F.generate_maze
# ir inst 21 fin
  addi t1, sp, 48
  addi t6, t1, 80                                                       # ir inst 22 fin
  addi t5, t6, 4                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 24 fin
  addi t1, sp, 48
  addi t6, t1, 1440                                                     # ir inst 25 fin
  addi t5, t6, 72                                                       # ir inst 26 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 27 fin
  li t1, 1
  mv t6, t1                                                             # ir inst 28 fin
  li t1, 1
  mv t5, t1                                                             # ir inst 29 fin
  li t1, 18
  mv t4, t1                                                             # ir inst 30 fin
  li t1, 18
  mv t3, t1                                                             # ir inst 31 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a4, t3
  mv a3, t4
  mv a2, t5
  mv a1, t6
  addi t1, sp, 48
  mv a0, t1
  call .F.solve_maze
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 32 fin
# Start call preparation
  mv a0, s11
  call printlnInt
# ir inst 33 fin
# Start call preparation
  call .F.solve_logic_puzzle
  mv t6, a0
# ir inst 34 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 35 fin
# Start call preparation
  call .F.run_control_flow_puzzle
  mv t6, a0
# ir inst 36 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 37 fin
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 38 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 39 fin
  j main.epilogue                                                       # ir inst 40 fin
main.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 1728
  ret

.globl .F.generate_maze
.F.generate_maze:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.generate_maze._0.entry.0:
# Phi connections
  mv t5, a1
  li t6, 0
  j .F.generate_maze._1.while.cond.0                                    # ir inst 1 fin
.F.generate_maze._1.while.cond.0:
  li t2, 20
  sltu t4, t6, t2                                                       # ir inst 4 fin
  bnez t4, .F.generate_maze._2.while.body.0
  j .F.generate_maze._21.while.exit.0                                   # ir inst 5 fin
.F.generate_maze._2.while.body.0:
# Phi connections
  mv t4, t5
  li t5, 0
  j .F.generate_maze._3.while.cond.1                                    # ir inst 6 fin
.F.generate_maze._3.while.cond.1:
  li t2, 20
  sltu t3, t5, t2                                                       # ir inst 9 fin
  bnez t3, .F.generate_maze._4.while.body.1
  j .F.generate_maze._20.while.exit.1                                   # ir inst 10 fin
.F.generate_maze._4.while.body.1:
  li t2, 0
  xor t0, t6, t2
  sltiu t3, t0, 1                                                       # ir inst 11 fin
  bnez t3, .F.generate_maze._5.lazy.then.0
  j .F.generate_maze._6.lazy.else.0                                     # ir inst 12 fin
.F.generate_maze._5.lazy.then.0:
# Phi connections
  li t3, 1
  j .F.generate_maze._7.lazy.exit.0                                     # ir inst 13 fin
.F.generate_maze._6.lazy.else.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 14 fin
# Phi connections
  j .F.generate_maze._7.lazy.exit.0                                     # ir inst 15 fin
.F.generate_maze._7.lazy.exit.0:
  bnez t3, .F.generate_maze._8.lazy.then.1
  j .F.generate_maze._9.lazy.else.1                                     # ir inst 17 fin
.F.generate_maze._8.lazy.then.1:
# Phi connections
  li t3, 1
  j .F.generate_maze._10.lazy.exit.1                                    # ir inst 18 fin
.F.generate_maze._9.lazy.else.1:
  li t2, 19
  xor t0, t6, t2
  sltiu t3, t0, 1                                                       # ir inst 19 fin
# Phi connections
  j .F.generate_maze._10.lazy.exit.1                                    # ir inst 20 fin
.F.generate_maze._10.lazy.exit.1:
  bnez t3, .F.generate_maze._11.lazy.then.2
  j .F.generate_maze._12.lazy.else.2                                    # ir inst 22 fin
.F.generate_maze._11.lazy.then.2:
# Phi connections
  li t3, 1
  j .F.generate_maze._13.lazy.exit.2                                    # ir inst 23 fin
.F.generate_maze._12.lazy.else.2:
  li t2, 19
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 24 fin
# Phi connections
  j .F.generate_maze._13.lazy.exit.2                                    # ir inst 25 fin
.F.generate_maze._13.lazy.exit.2:
  bnez t3, .F.generate_maze._14.if.then.0
  j .F.generate_maze._15.if.else.0                                      # ir inst 27 fin
.F.generate_maze._14.if.then.0:
  li t1, 80
  mul t2, t6, t1
  add t3, a0, t2                                                        # ir inst 28 fin
  slli t2, t5, 2
  add s11, t3, t2                                                       # ir inst 29 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 30 fin
# Phi connections
  mv t3, t4
  j .F.generate_maze._19.if.exit.0                                      # ir inst 31 fin
.F.generate_maze._15.if.else.0:
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
# ir inst 32 fin
  li t2, 65536
  div s11, t3, t2                                                       # ir inst 33 fin
  li t2, 32768
  rem t3, s11, t2                                                       # ir inst 34 fin
  li t2, 4
  rem s11, t3, t2                                                       # ir inst 35 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 36 fin
  bnez s10, .F.generate_maze._16.if.then.1
  j .F.generate_maze._17.if.else.1                                      # ir inst 37 fin
.F.generate_maze._16.if.then.1:
  li t1, 80
  mul t2, t6, t1
  add s11, a0, t2                                                       # ir inst 38 fin
  slli t2, t5, 2
  add s10, s11, t2                                                      # ir inst 39 fin
  li t1, 1
  sw t1, 0(s10)                                                         # ir inst 40 fin
  j .F.generate_maze._18.if.exit.1                                      # ir inst 41 fin
.F.generate_maze._17.if.else.1:
  li t1, 80
  mul t2, t6, t1
  add s11, a0, t2                                                       # ir inst 42 fin
  slli t2, t5, 2
  add s10, s11, t2                                                      # ir inst 43 fin
  li t1, 0
  sw t1, 0(s10)                                                         # ir inst 44 fin
  j .F.generate_maze._18.if.exit.1                                      # ir inst 45 fin
.F.generate_maze._18.if.exit.1:
# Phi connections
  j .F.generate_maze._19.if.exit.0                                      # ir inst 46 fin
.F.generate_maze._19.if.exit.0:
  addi s11, t5, 1                                                       # ir inst 48 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.generate_maze._3.while.cond.1                                    # ir inst 49 fin
.F.generate_maze._20.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.generate_maze._1.while.cond.0                                    # ir inst 51 fin
.F.generate_maze._21.while.exit.0:
  j .F.generate_maze.epilogue                                           # ir inst 52 fin
.F.generate_maze.epilogue:
  ld ra, 56(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.solve_maze
.F.solve_maze:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 0,                range:       56(sp) -       56(sp)
# callee save reg num: 7 / 12,        range:        0(sp) -       56(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s5, 0(sp)
  sd s6, 8(sp)
  sd s11, 16(sp)
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s7, 40(sp)
  sd s8, 48(sp)
.F.solve_maze._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 0
  mv t5, a2
  mv t6, a1
  j .F.solve_maze._1.while.cond.0                                       # ir inst 1 fin
.F.solve_maze._1.while.cond.0:
  li t2, 1000
  slt s11, t4, t2                                                       # ir inst 6 fin
  bnez s11, .F.solve_maze._2.while.body.0
  j .F.solve_maze._27.while.exit.0                                      # ir inst 7 fin
.F.solve_maze._2.while.body.0:
  xor t0, t6, a3
  sltiu s11, t0, 1                                                      # ir inst 8 fin
  bnez s11, .F.solve_maze._3.lazy.then.0
  j .F.solve_maze._4.lazy.else.0                                        # ir inst 9 fin
.F.solve_maze._3.lazy.then.0:
  xor t0, t5, a4
  sltiu s11, t0, 1                                                      # ir inst 10 fin
# Phi connections
  j .F.solve_maze._5.lazy.exit.0                                        # ir inst 11 fin
.F.solve_maze._4.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.solve_maze._5.lazy.exit.0                                        # ir inst 12 fin
.F.solve_maze._5.lazy.exit.0:
  bnez s11, .F.solve_maze._6.if.then.0
  j .F.solve_maze._7.if.else.0                                          # ir inst 14 fin
.F.solve_maze._6.if.then.0:
  mv a0, t4
  j .F.solve_maze.epilogue                                              # ir inst 15 fin
.F.solve_maze._7.if.else.0:
  j .F.solve_maze._8.if.exit.0                                          # ir inst 16 fin
.F.solve_maze._8.if.exit.0:
# Phi connections
  li s11, 0
  j .F.solve_maze._9.while.cond.1                                       # ir inst 17 fin
.F.solve_maze._9.while.cond.1:
  li t2, 4
  slt s10, s11, t2                                                      # ir inst 19 fin
  bnez s10, .F.solve_maze._10.while.body.1
  j .F.solve_maze._28.critical_edge.0                                   # ir inst 20 fin
.F.solve_maze._10.while.body.1:
  addi s10, t3, 3                                                       # ir inst 21 fin
  add s9, s10, s11                                                      # ir inst 22 fin
  li t2, 4
  rem s10, s9, t2                                                       # ir inst 23 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 24 fin
  bnez s9, .F.solve_maze._11.if.then.1
  j .F.solve_maze._12.if.else.1                                         # ir inst 25 fin
.F.solve_maze._11.if.then.1:
  addi s9, t5, -1                                                       # ir inst 26 fin
# Phi connections
  mv s8, t6
  j .F.solve_maze._19.if.exit.1                                         # ir inst 27 fin
.F.solve_maze._12.if.else.1:
  li t2, 1
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 28 fin
  bnez s9, .F.solve_maze._13.if.then.2
  j .F.solve_maze._14.if.else.2                                         # ir inst 29 fin
.F.solve_maze._13.if.then.2:
  addi s9, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv s8, s9
  mv s9, t5
  j .F.solve_maze._18.if.exit.2                                         # ir inst 31 fin
.F.solve_maze._14.if.else.2:
  li t2, 2
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 32 fin
  bnez s9, .F.solve_maze._15.if.then.3
  j .F.solve_maze._16.if.else.3                                         # ir inst 33 fin
.F.solve_maze._15.if.then.3:
  addi s9, t5, 1                                                        # ir inst 34 fin
# Phi connections
  mv s8, t6
  j .F.solve_maze._17.if.exit.3                                         # ir inst 35 fin
.F.solve_maze._16.if.else.3:
  addi s9, t6, -1                                                       # ir inst 36 fin
# Phi connections
  mv s8, s9
  mv s9, t5
  j .F.solve_maze._17.if.exit.3                                         # ir inst 37 fin
.F.solve_maze._17.if.exit.3:
# Phi connections
  j .F.solve_maze._18.if.exit.2                                         # ir inst 40 fin
.F.solve_maze._18.if.exit.2:
# Phi connections
  j .F.solve_maze._19.if.exit.1                                         # ir inst 43 fin
.F.solve_maze._19.if.exit.1:
  mv s7, s9                                                             # ir inst 46 fin
  li t1, 80
  mul t2, s7, t1
  add s6, a0, t2                                                        # ir inst 47 fin
  mv s7, s8                                                             # ir inst 48 fin
  slli t2, s7, 2
  add s5, s6, t2                                                        # ir inst 49 fin
  lw s7, 0(s5)                                                          # ir inst 50 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 51 fin
  bnez s6, .F.solve_maze._20.if.then.4
  j .F.solve_maze._21.if.else.4                                         # ir inst 52 fin
.F.solve_maze._20.if.then.4:
# Phi connections
  mv s11, s8
  li s8, 1
  mv t0, s9
  mv s9, s10
  mv s10, t0
  j .F.solve_maze._23.while.exit.1                                      # ir inst 53 fin
.F.solve_maze._21.if.else.4:
  j .F.solve_maze._22.if.exit.4                                         # ir inst 54 fin
.F.solve_maze._22.if.exit.4:
  addi s10, s11, 1                                                      # ir inst 55 fin
# Phi connections
  mv s11, s10
  j .F.solve_maze._9.while.cond.1                                       # ir inst 56 fin
.F.solve_maze._23.while.exit.1:
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 61 fin
  bnez s7, .F.solve_maze._24.if.then.5
  j .F.solve_maze._25.if.else.5                                         # ir inst 62 fin
.F.solve_maze._24.if.then.5:
  li a0, -1
  j .F.solve_maze.epilogue                                              # ir inst 63 fin
.F.solve_maze._25.if.else.5:
  j .F.solve_maze._26.if.exit.5                                         # ir inst 64 fin
.F.solve_maze._26.if.exit.5:
  addi s8, t4, 1                                                        # ir inst 65 fin
# Phi connections
  mv t3, s9
  mv t4, s8
  mv t5, s10
  mv t6, s11
  j .F.solve_maze._1.while.cond.0                                       # ir inst 66 fin
.F.solve_maze._27.while.exit.0:
  li a0, -1
  j .F.solve_maze.epilogue                                              # ir inst 67 fin
.F.solve_maze._28.critical_edge.0:
# Phi connections
  li s8, 0
  mv s9, t3
  mv s10, t5
  mv s11, t6
  j .F.solve_maze._23.while.exit.1                                      # ir inst 68 fin
.F.solve_maze.epilogue:
  ld s5, 0(sp)
  ld s6, 8(sp)
  ld s11, 16(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s7, 40(sp)
  ld s8, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.solve_logic_puzzle
.F.solve_logic_puzzle:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s0, 0(sp)
  sd s5, 8(sp)
  sd s1, 16(sp)
  sd s6, 24(sp)
  sd s7, 32(sp)
  sd s8, 40(sp)
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd s9, 64(sp)
.F.solve_logic_puzzle._0.entry.0:
# Phi connections
  li t6, 0
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 1 fin
.F.solve_logic_puzzle._1.while.cond.0:
  li t2, 10000
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.solve_logic_puzzle._2.while.body.0
  j .F.solve_logic_puzzle._48.while.exit.0                              # ir inst 4 fin
.F.solve_logic_puzzle._2.while.body.0:
  li t2, 5
  rem t5, t6, t2                                                        # ir inst 5 fin
  addi t4, t5, 1                                                        # ir inst 6 fin
  li t2, 5
  div t5, t6, t2                                                        # ir inst 7 fin
  li t2, 5
  rem t3, t5, t2                                                        # ir inst 8 fin
  addi t5, t3, 1                                                        # ir inst 9 fin
  li t2, 25
  div t3, t6, t2                                                        # ir inst 10 fin
  li t2, 5
  rem s11, t3, t2                                                       # ir inst 11 fin
  addi t3, s11, 1                                                       # ir inst 12 fin
  li t2, 125
  div s11, t6, t2                                                       # ir inst 13 fin
  li t2, 5
  rem s10, s11, t2                                                      # ir inst 14 fin
  addi s11, s10, 1                                                      # ir inst 15 fin
  li t2, 625
  div s10, t6, t2                                                       # ir inst 16 fin
  li t2, 5
  rem s9, s10, t2                                                       # ir inst 17 fin
  addi s10, s9, 1                                                       # ir inst 18 fin
  xor t0, t4, t5
  sltiu s9, t0, 1                                                       # ir inst 19 fin
  bnez s9, .F.solve_logic_puzzle._3.lazy.then.0
  j .F.solve_logic_puzzle._4.lazy.else.0                                # ir inst 20 fin
.F.solve_logic_puzzle._3.lazy.then.0:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._5.lazy.exit.0                                # ir inst 21 fin
.F.solve_logic_puzzle._4.lazy.else.0:
  xor t0, t4, t3
  sltiu s9, t0, 1                                                       # ir inst 22 fin
# Phi connections
  j .F.solve_logic_puzzle._5.lazy.exit.0                                # ir inst 23 fin
.F.solve_logic_puzzle._5.lazy.exit.0:
  bnez s9, .F.solve_logic_puzzle._6.lazy.then.1
  j .F.solve_logic_puzzle._7.lazy.else.1                                # ir inst 25 fin
.F.solve_logic_puzzle._6.lazy.then.1:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._8.lazy.exit.1                                # ir inst 26 fin
.F.solve_logic_puzzle._7.lazy.else.1:
  xor t0, t4, s11
  sltiu s9, t0, 1                                                       # ir inst 27 fin
# Phi connections
  j .F.solve_logic_puzzle._8.lazy.exit.1                                # ir inst 28 fin
.F.solve_logic_puzzle._8.lazy.exit.1:
  bnez s9, .F.solve_logic_puzzle._9.lazy.then.2
  j .F.solve_logic_puzzle._10.lazy.else.2                               # ir inst 30 fin
.F.solve_logic_puzzle._9.lazy.then.2:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._11.lazy.exit.2                               # ir inst 31 fin
.F.solve_logic_puzzle._10.lazy.else.2:
  xor t0, t4, s10
  sltiu s9, t0, 1                                                       # ir inst 32 fin
# Phi connections
  j .F.solve_logic_puzzle._11.lazy.exit.2                               # ir inst 33 fin
.F.solve_logic_puzzle._11.lazy.exit.2:
  bnez s9, .F.solve_logic_puzzle._12.lazy.then.3
  j .F.solve_logic_puzzle._13.lazy.else.3                               # ir inst 35 fin
.F.solve_logic_puzzle._12.lazy.then.3:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._14.lazy.exit.3                               # ir inst 36 fin
.F.solve_logic_puzzle._13.lazy.else.3:
  xor t0, t5, t3
  sltiu s9, t0, 1                                                       # ir inst 37 fin
# Phi connections
  j .F.solve_logic_puzzle._14.lazy.exit.3                               # ir inst 38 fin
.F.solve_logic_puzzle._14.lazy.exit.3:
  bnez s9, .F.solve_logic_puzzle._15.lazy.then.4
  j .F.solve_logic_puzzle._16.lazy.else.4                               # ir inst 40 fin
.F.solve_logic_puzzle._15.lazy.then.4:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._17.lazy.exit.4                               # ir inst 41 fin
.F.solve_logic_puzzle._16.lazy.else.4:
  xor t0, t5, s11
  sltiu s9, t0, 1                                                       # ir inst 42 fin
# Phi connections
  j .F.solve_logic_puzzle._17.lazy.exit.4                               # ir inst 43 fin
.F.solve_logic_puzzle._17.lazy.exit.4:
  bnez s9, .F.solve_logic_puzzle._18.lazy.then.5
  j .F.solve_logic_puzzle._19.lazy.else.5                               # ir inst 45 fin
.F.solve_logic_puzzle._18.lazy.then.5:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._20.lazy.exit.5                               # ir inst 46 fin
.F.solve_logic_puzzle._19.lazy.else.5:
  xor t0, t5, s10
  sltiu s9, t0, 1                                                       # ir inst 47 fin
# Phi connections
  j .F.solve_logic_puzzle._20.lazy.exit.5                               # ir inst 48 fin
.F.solve_logic_puzzle._20.lazy.exit.5:
  bnez s9, .F.solve_logic_puzzle._21.lazy.then.6
  j .F.solve_logic_puzzle._22.lazy.else.6                               # ir inst 50 fin
.F.solve_logic_puzzle._21.lazy.then.6:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._23.lazy.exit.6                               # ir inst 51 fin
.F.solve_logic_puzzle._22.lazy.else.6:
  xor t0, t3, s11
  sltiu s9, t0, 1                                                       # ir inst 52 fin
# Phi connections
  j .F.solve_logic_puzzle._23.lazy.exit.6                               # ir inst 53 fin
.F.solve_logic_puzzle._23.lazy.exit.6:
  bnez s9, .F.solve_logic_puzzle._24.lazy.then.7
  j .F.solve_logic_puzzle._25.lazy.else.7                               # ir inst 55 fin
.F.solve_logic_puzzle._24.lazy.then.7:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._26.lazy.exit.7                               # ir inst 56 fin
.F.solve_logic_puzzle._25.lazy.else.7:
  xor t0, t3, s10
  sltiu s9, t0, 1                                                       # ir inst 57 fin
# Phi connections
  j .F.solve_logic_puzzle._26.lazy.exit.7                               # ir inst 58 fin
.F.solve_logic_puzzle._26.lazy.exit.7:
  bnez s9, .F.solve_logic_puzzle._27.lazy.then.8
  j .F.solve_logic_puzzle._28.lazy.else.8                               # ir inst 60 fin
.F.solve_logic_puzzle._27.lazy.then.8:
# Phi connections
  li s9, 1
  j .F.solve_logic_puzzle._29.lazy.exit.8                               # ir inst 61 fin
.F.solve_logic_puzzle._28.lazy.else.8:
  xor t0, s11, s10
  sltiu s9, t0, 1                                                       # ir inst 62 fin
# Phi connections
  j .F.solve_logic_puzzle._29.lazy.exit.8                               # ir inst 63 fin
.F.solve_logic_puzzle._29.lazy.exit.8:
  bnez s9, .F.solve_logic_puzzle._30.if.then.0
  j .F.solve_logic_puzzle._31.if.else.0                                 # ir inst 65 fin
.F.solve_logic_puzzle._30.if.then.0:
  addi s9, t6, 1                                                        # ir inst 66 fin
# Phi connections
  mv t6, s9
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 67 fin
.F.solve_logic_puzzle._31.if.else.0:
  j .F.solve_logic_puzzle._32.if.exit.0                                 # ir inst 68 fin
.F.solve_logic_puzzle._32.if.exit.0:
  li t2, 1
  xor t0, t3, t2
  sltiu s9, t0, 1                                                       # ir inst 69 fin
  li t2, 2
  xor t0, t5, t2
  sltiu s8, t0, 1                                                       # ir inst 70 fin
  li t2, 5
  xor t0, t4, t2
  sltiu s7, t0, 1                                                       # ir inst 71 fin
  li t2, 1
  xor t0, s11, t2
  sltu s6, zero, t0                                                     # ir inst 72 fin
  li t2, 4
  xor t0, s10, t2
  sltiu s5, t0, 1                                                       # ir inst 73 fin
  li t2, 3
  xor t0, t4, t2
  sltiu s0, t0, 1                                                       # ir inst 74 fin
  xor t0, s0, s9
  sltu s1, zero, t0                                                     # ir inst 75 fin
  bnez s1, .F.solve_logic_puzzle._33.if.then.1
  j .F.solve_logic_puzzle._34.if.else.1                                 # ir inst 76 fin
.F.solve_logic_puzzle._33.if.then.1:
  addi s9, t6, 1                                                        # ir inst 77 fin
# Phi connections
  mv t6, s9
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 78 fin
.F.solve_logic_puzzle._34.if.else.1:
  j .F.solve_logic_puzzle._35.if.exit.1                                 # ir inst 79 fin
.F.solve_logic_puzzle._35.if.exit.1:
  li t2, 2
  xor t0, t5, t2
  sltiu s9, t0, 1                                                       # ir inst 80 fin
  xor t0, s9, s8
  sltu s0, zero, t0                                                     # ir inst 81 fin
  bnez s0, .F.solve_logic_puzzle._36.if.then.2
  j .F.solve_logic_puzzle._37.if.else.2                                 # ir inst 82 fin
.F.solve_logic_puzzle._36.if.then.2:
  addi s9, t6, 1                                                        # ir inst 83 fin
# Phi connections
  mv t6, s9
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 84 fin
.F.solve_logic_puzzle._37.if.else.2:
  j .F.solve_logic_puzzle._38.if.exit.2                                 # ir inst 85 fin
.F.solve_logic_puzzle._38.if.exit.2:
  li t2, 4
  xor t0, t3, t2
  sltiu s9, t0, 1                                                       # ir inst 86 fin
  xor t0, s9, s7
  sltu s8, zero, t0                                                     # ir inst 87 fin
  bnez s8, .F.solve_logic_puzzle._39.if.then.3
  j .F.solve_logic_puzzle._40.if.else.3                                 # ir inst 88 fin
.F.solve_logic_puzzle._39.if.then.3:
  addi s9, t6, 1                                                        # ir inst 89 fin
# Phi connections
  mv t6, s9
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 90 fin
.F.solve_logic_puzzle._40.if.else.3:
  j .F.solve_logic_puzzle._41.if.exit.3                                 # ir inst 91 fin
.F.solve_logic_puzzle._41.if.exit.3:
  li t2, 1
  xor t0, s11, t2
  sltiu s9, t0, 1                                                       # ir inst 92 fin
  xor t0, s9, s6
  sltu s8, zero, t0                                                     # ir inst 93 fin
  bnez s8, .F.solve_logic_puzzle._42.if.then.4
  j .F.solve_logic_puzzle._43.if.else.4                                 # ir inst 94 fin
.F.solve_logic_puzzle._42.if.then.4:
  addi s9, t6, 1                                                        # ir inst 95 fin
# Phi connections
  mv t6, s9
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 96 fin
.F.solve_logic_puzzle._43.if.else.4:
  j .F.solve_logic_puzzle._44.if.exit.4                                 # ir inst 97 fin
.F.solve_logic_puzzle._44.if.exit.4:
  li t2, 3
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 98 fin
  xor t0, s9, s5
  sltu s8, zero, t0                                                     # ir inst 99 fin
  bnez s8, .F.solve_logic_puzzle._45.if.then.5
  j .F.solve_logic_puzzle._46.if.else.5                                 # ir inst 100 fin
.F.solve_logic_puzzle._45.if.then.5:
  addi s9, t6, 1                                                        # ir inst 101 fin
# Phi connections
  mv t6, s9
  j .F.solve_logic_puzzle._1.while.cond.0                               # ir inst 102 fin
.F.solve_logic_puzzle._46.if.else.5:
  j .F.solve_logic_puzzle._47.if.exit.5                                 # ir inst 103 fin
.F.solve_logic_puzzle._47.if.exit.5:
  li t2, 10000
  mul t6, t4, t2                                                        # ir inst 104 fin
  li t2, 1000
  mul t4, t5, t2                                                        # ir inst 105 fin
  add t5, t6, t4                                                        # ir inst 106 fin
  li t2, 100
  mul t6, t3, t2                                                        # ir inst 107 fin
  add t4, t5, t6                                                        # ir inst 108 fin
  li t2, 10
  mul t6, s11, t2                                                       # ir inst 109 fin
  add t5, t4, t6                                                        # ir inst 110 fin
  add t6, t5, s10                                                       # ir inst 111 fin
  mv a0, t6
  j .F.solve_logic_puzzle.epilogue                                      # ir inst 112 fin
.F.solve_logic_puzzle._48.while.exit.0:
  li a0, -1
  j .F.solve_logic_puzzle.epilogue                                      # ir inst 113 fin
.F.solve_logic_puzzle.epilogue:
  ld s0, 0(sp)
  ld s5, 8(sp)
  ld s1, 16(sp)
  ld s6, 24(sp)
  ld s7, 32(sp)
  ld s8, 40(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  ld s9, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.run_control_flow_puzzle
.F.run_control_flow_puzzle:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s8, 0(sp)
  sd s9, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
  sd s5, 32(sp)
  sd s0, 40(sp)
  sd s7, 48(sp)
  sd s1, 56(sp)
  sd s6, 64(sp)
.F.run_control_flow_puzzle._0.entry.0:
# Phi connections
  li t3, 1
  li t4, 1
  li t5, 0
  li t6, 1
  j .F.run_control_flow_puzzle._1.while.cond.0                          # ir inst 1 fin
.F.run_control_flow_puzzle._1.while.cond.0:
  li t2, 100
  slt s11, t5, t2                                                       # ir inst 6 fin
  bnez s11, .F.run_control_flow_puzzle._2.while.body.0
  j .F.run_control_flow_puzzle._33.while.exit.0                         # ir inst 7 fin
.F.run_control_flow_puzzle._2.while.body.0:
# Phi connections
  mv s8, t3
  mv s9, t4
  li s10, 0
  mv s11, t6
  j .F.run_control_flow_puzzle._3.while.cond.1                          # ir inst 8 fin
.F.run_control_flow_puzzle._3.while.cond.1:
  li t2, 5
  slt s7, s10, t2                                                       # ir inst 13 fin
  bnez s7, .F.run_control_flow_puzzle._4.while.body.1
  j .F.run_control_flow_puzzle._23.while.exit.1                         # ir inst 14 fin
.F.run_control_flow_puzzle._4.while.body.1:
  li t2, 2
  rem s7, t5, t2                                                        # ir inst 15 fin
  li t2, 0
  xor t0, s7, t2
  sltiu s6, t0, 1                                                       # ir inst 16 fin
  bnez s6, .F.run_control_flow_puzzle._5.if.then.0
  j .F.run_control_flow_puzzle._12.if.else.0                            # ir inst 17 fin
.F.run_control_flow_puzzle._5.if.then.0:
  addi s7, s10, 1                                                       # ir inst 18 fin
  rem s6, s9, s7                                                        # ir inst 19 fin
  add s7, s11, s6                                                       # ir inst 20 fin
  li t2, 100
  slt s6, t2, s7                                                        # ir inst 21 fin
  bnez s6, .F.run_control_flow_puzzle._6.if.then.1
  j .F.run_control_flow_puzzle._10.if.else.1                            # ir inst 22 fin
.F.run_control_flow_puzzle._6.if.then.1:
# Phi connections
  li s5, 0
  mv s6, s9
  j .F.run_control_flow_puzzle._7.while.cond.2                          # ir inst 23 fin
.F.run_control_flow_puzzle._7.while.cond.2:
  li t2, 3
  slt s0, s5, t2                                                        # ir inst 26 fin
  bnez s0, .F.run_control_flow_puzzle._8.while.body.2
  j .F.run_control_flow_puzzle._9.while.exit.2                          # ir inst 27 fin
.F.run_control_flow_puzzle._8.while.body.2:
  mul s0, s8, s5                                                        # ir inst 28 fin
  add s1, s6, s0                                                        # ir inst 29 fin
  addi s0, s5, 1                                                        # ir inst 30 fin
# Phi connections
  mv s5, s0
  mv s6, s1
  j .F.run_control_flow_puzzle._7.while.cond.2                          # ir inst 31 fin
.F.run_control_flow_puzzle._9.while.exit.2:
# Phi connections
  j .F.run_control_flow_puzzle._11.if.exit.1                            # ir inst 32 fin
.F.run_control_flow_puzzle._10.if.else.1:
  addi s6, s9, 1                                                        # ir inst 33 fin
# Phi connections
  j .F.run_control_flow_puzzle._11.if.exit.1                            # ir inst 34 fin
.F.run_control_flow_puzzle._11.if.exit.1:
# Phi connections
  mv s5, s8
  j .F.run_control_flow_puzzle._22.if.exit.0                            # ir inst 36 fin
.F.run_control_flow_puzzle._12.if.else.0:
  addi s7, s10, 1                                                       # ir inst 37 fin
  rem s6, s11, s7                                                       # ir inst 38 fin
  add s7, s9, s6                                                        # ir inst 39 fin
  li t2, 150
  slt s6, t2, s7                                                        # ir inst 40 fin
  bnez s6, .F.run_control_flow_puzzle._13.if.then.2
  j .F.run_control_flow_puzzle._20.if.else.2                            # ir inst 41 fin
.F.run_control_flow_puzzle._13.if.then.2:
# Phi connections
  li s0, 0
  mv s5, s8
  mv s6, s11
  j .F.run_control_flow_puzzle._14.while.cond.3                         # ir inst 42 fin
.F.run_control_flow_puzzle._14.while.cond.3:
  li t2, 4
  slt s1, s0, t2                                                        # ir inst 46 fin
  bnez s1, .F.run_control_flow_puzzle._15.while.body.3
  j .F.run_control_flow_puzzle._19.while.exit.3                         # ir inst 47 fin
.F.run_control_flow_puzzle._15.while.body.3:
  mul s1, s6, s0                                                        # ir inst 48 fin
  add a0, s5, s1                                                        # ir inst 49 fin
  li t2, 3
  rem s1, a0, t2                                                        # ir inst 50 fin
  li t2, 0
  xor t0, s1, t2
  sltiu a1, t0, 1                                                       # ir inst 51 fin
  bnez a1, .F.run_control_flow_puzzle._16.if.then.3
  j .F.run_control_flow_puzzle._17.if.else.3                            # ir inst 52 fin
.F.run_control_flow_puzzle._16.if.then.3:
  sub s1, s6, s0                                                        # ir inst 53 fin
# Phi connections
  j .F.run_control_flow_puzzle._18.if.exit.3                            # ir inst 54 fin
.F.run_control_flow_puzzle._17.if.else.3:
# Phi connections
  mv s1, s6
  j .F.run_control_flow_puzzle._18.if.exit.3                            # ir inst 55 fin
.F.run_control_flow_puzzle._18.if.exit.3:
  addi a1, s0, 1                                                        # ir inst 57 fin
# Phi connections
  mv s0, a1
  mv s5, a0
  mv s6, s1
  j .F.run_control_flow_puzzle._14.while.cond.3                         # ir inst 58 fin
.F.run_control_flow_puzzle._19.while.exit.3:
# Phi connections
  j .F.run_control_flow_puzzle._21.if.exit.2                            # ir inst 59 fin
.F.run_control_flow_puzzle._20.if.else.2:
# Phi connections
  mv s5, s8
  mv s6, s11
  j .F.run_control_flow_puzzle._21.if.exit.2                            # ir inst 60 fin
.F.run_control_flow_puzzle._21.if.exit.2:
# Phi connections
  mv t0, s6
  mv s6, s7
  mv s7, t0
  j .F.run_control_flow_puzzle._22.if.exit.0                            # ir inst 63 fin
.F.run_control_flow_puzzle._22.if.exit.0:
  addi s0, s10, 1                                                       # ir inst 67 fin
# Phi connections
  mv s8, s5
  mv s9, s6
  mv s10, s0
  mv s11, s7
  j .F.run_control_flow_puzzle._3.while.cond.1                          # ir inst 68 fin
.F.run_control_flow_puzzle._23.while.exit.1:
  li t2, 10
  rem s10, t5, t2                                                       # ir inst 69 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s7, t0, 1                                                       # ir inst 70 fin
  bnez s7, .F.run_control_flow_puzzle._24.if.then.4
  j .F.run_control_flow_puzzle._31.if.else.4                            # ir inst 71 fin
.F.run_control_flow_puzzle._24.if.then.4:
  add s10, s11, s9                                                      # ir inst 72 fin
  add s7, s10, s8                                                       # ir inst 73 fin
  li t2, 7
  rem s10, s7, t2                                                       # ir inst 74 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s7, t0, 1                                                       # ir inst 75 fin
  bnez s7, .F.run_control_flow_puzzle._25.if.then.5
  j .F.run_control_flow_puzzle._29.if.else.5                            # ir inst 76 fin
.F.run_control_flow_puzzle._25.if.then.5:
  li t2, 50
  slt s10, t2, t5                                                       # ir inst 77 fin
  bnez s10, .F.run_control_flow_puzzle._26.if.then.6
  j .F.run_control_flow_puzzle._27.if.else.6                            # ir inst 78 fin
.F.run_control_flow_puzzle._26.if.then.6:
  addi s10, t5, 1                                                       # ir inst 79 fin
# Phi connections
  j .F.run_control_flow_puzzle._28.if.exit.6                            # ir inst 80 fin
.F.run_control_flow_puzzle._27.if.else.6:
# Phi connections
  mv s10, t5
  j .F.run_control_flow_puzzle._28.if.exit.6                            # ir inst 81 fin
.F.run_control_flow_puzzle._28.if.exit.6:
  add s7, s8, s10                                                       # ir inst 83 fin
# Phi connections
  mv s10, s7
  j .F.run_control_flow_puzzle._30.if.exit.5                            # ir inst 84 fin
.F.run_control_flow_puzzle._29.if.else.5:
# Phi connections
  mv s10, s8
  j .F.run_control_flow_puzzle._30.if.exit.5                            # ir inst 85 fin
.F.run_control_flow_puzzle._30.if.exit.5:
# Phi connections
  j .F.run_control_flow_puzzle._32.if.exit.4                            # ir inst 87 fin
.F.run_control_flow_puzzle._31.if.else.4:
# Phi connections
  mv s10, s8
  j .F.run_control_flow_puzzle._32.if.exit.4                            # ir inst 88 fin
.F.run_control_flow_puzzle._32.if.exit.4:
  addi s8, t5, 1                                                        # ir inst 90 fin
# Phi connections
  mv t3, s10
  mv t4, s9
  mv t5, s8
  mv t6, s11
  j .F.run_control_flow_puzzle._1.while.cond.0                          # ir inst 91 fin
.F.run_control_flow_puzzle._33.while.exit.0:
  add t5, t6, t4                                                        # ir inst 92 fin
  add t6, t5, t3                                                        # ir inst 93 fin
  mv a0, t6
  j .F.run_control_flow_puzzle.epilogue                                 # ir inst 94 fin
.F.run_control_flow_puzzle.epilogue:
  ld s8, 0(sp)
  ld s9, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  ld s5, 32(sp)
  ld s0, 40(sp)
  ld s7, 48(sp)
  ld s1, 56(sp)
  ld s6, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.another_puzzle
.F.another_puzzle:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 4 / 12,        range:        8(sp) -       40(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.another_puzzle._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.another_puzzle._1.while.cond.0                                   # ir inst 1 fin
.F.another_puzzle._1.while.cond.0:
  li t2, 500
  slt t3, t5, t2                                                        # ir inst 5 fin
  bnez t3, .F.another_puzzle._2.while.body.0
  j .F.another_puzzle._18.while.exit.0                                  # ir inst 6 fin
.F.another_puzzle._2.while.body.0:
  addi t3, t4, 1                                                        # ir inst 7 fin
  li t2, 3
  mul s11, t5, t2                                                       # ir inst 8 fin
  add s10, t6, s11                                                      # ir inst 9 fin
  li t2, 17
  rem t6, s10, t2                                                       # ir inst 10 fin
  li t2, 5
  slt s11, t6, t2                                                       # ir inst 11 fin
  bnez s11, .F.another_puzzle._3.if.then.0
  j .F.another_puzzle._7.if.else.0                                      # ir inst 12 fin
.F.another_puzzle._3.if.then.0:
# Phi connections
  li s10, 0
  mv s11, t3
  j .F.another_puzzle._4.while.cond.1                                   # ir inst 13 fin
.F.another_puzzle._4.while.cond.1:
  slt s9, s10, t6                                                       # ir inst 16 fin
  bnez s9, .F.another_puzzle._5.while.body.1
  j .F.another_puzzle._6.while.exit.1                                   # ir inst 17 fin
.F.another_puzzle._5.while.body.1:
  add s9, s11, s10                                                      # ir inst 18 fin
  addi s8, s10, 1                                                       # ir inst 19 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F.another_puzzle._4.while.cond.1                                   # ir inst 20 fin
.F.another_puzzle._6.while.exit.1:
# Phi connections
  mv t3, s11
  j .F.another_puzzle._17.if.exit.0                                     # ir inst 21 fin
.F.another_puzzle._7.if.else.0:
  li t2, 12
  slt s11, t6, t2                                                       # ir inst 22 fin
  bnez s11, .F.another_puzzle._8.if.then.1
  j .F.another_puzzle._12.if.else.1                                     # ir inst 23 fin
.F.another_puzzle._8.if.then.1:
# Phi connections
  li s10, 10
  mv s11, t3
  j .F.another_puzzle._9.while.cond.2                                   # ir inst 24 fin
.F.another_puzzle._9.while.cond.2:
  slt s9, t6, s10                                                       # ir inst 27 fin
  bnez s9, .F.another_puzzle._10.while.body.2
  j .F.another_puzzle._11.while.exit.2                                  # ir inst 28 fin
.F.another_puzzle._10.while.body.2:
  sub s9, s11, s10                                                      # ir inst 29 fin
  addi s8, s10, -1                                                      # ir inst 30 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F.another_puzzle._9.while.cond.2                                   # ir inst 31 fin
.F.another_puzzle._11.while.exit.2:
# Phi connections
  mv t3, s11
  j .F.another_puzzle._16.if.exit.1                                     # ir inst 32 fin
.F.another_puzzle._12.if.else.1:
  slli s11, t3, 1                                                       # ir inst 33 fin
  li t2, 10000
  slt t3, t2, s11                                                       # ir inst 34 fin
  bnez t3, .F.another_puzzle._13.if.then.2
  j .F.another_puzzle._14.if.else.2                                     # ir inst 35 fin
.F.another_puzzle._13.if.then.2:
  li t2, 3
  div t3, s11, t2                                                       # ir inst 36 fin
# Phi connections
  j .F.another_puzzle._15.if.exit.2                                     # ir inst 37 fin
.F.another_puzzle._14.if.else.2:
# Phi connections
  mv t3, s11
  j .F.another_puzzle._15.if.exit.2                                     # ir inst 38 fin
.F.another_puzzle._15.if.exit.2:
# Phi connections
  j .F.another_puzzle._16.if.exit.1                                     # ir inst 40 fin
.F.another_puzzle._16.if.exit.1:
# Phi connections
  j .F.another_puzzle._17.if.exit.0                                     # ir inst 42 fin
.F.another_puzzle._17.if.exit.0:
  addi s11, t5, 1                                                       # ir inst 44 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.another_puzzle._1.while.cond.0                                   # ir inst 45 fin
.F.another_puzzle._18.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 46 fin
  j .F.another_puzzle.epilogue                                          # ir inst 47 fin
.F.another_puzzle.epilogue:
  ld ra, 40(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.yet_another_control_flow
.F.yet_another_control_flow:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 8 / 12,        range:        8(sp) -       72(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s0, 8(sp)
  sd s5, 16(sp)
  sd s11, 24(sp)
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s8, 48(sp)
  sd s7, 56(sp)
  sd s6, 64(sp)
  sd ra, 72(sp)
.F.yet_another_control_flow._0.entry.0:
# Phi connections
  li t4, 1
  li t5, 1
  li t6, 0
  j .F.yet_another_control_flow._1.while.cond.0                         # ir inst 1 fin
.F.yet_another_control_flow._1.while.cond.0:
  li t2, 10
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.yet_another_control_flow._2.while.body.0
  j .F.yet_another_control_flow._15.while.exit.0                        # ir inst 6 fin
.F.yet_another_control_flow._2.while.body.0:
# Phi connections
  mv s10, t4
  mv s11, t5
  li t3, 0
  j .F.yet_another_control_flow._3.while.cond.1                         # ir inst 7 fin
.F.yet_another_control_flow._3.while.cond.1:
  li t2, 10
  slt s9, t3, t2                                                        # ir inst 11 fin
  bnez s9, .F.yet_another_control_flow._4.while.body.1
  j .F.yet_another_control_flow._14.while.exit.1                        # ir inst 12 fin
.F.yet_another_control_flow._4.while.body.1:
# Phi connections
  mv s7, s10
  mv s8, s11
  li s9, 0
  j .F.yet_another_control_flow._5.while.cond.2                         # ir inst 13 fin
.F.yet_another_control_flow._5.while.cond.2:
  li t2, 10
  slt s6, s9, t2                                                        # ir inst 17 fin
  bnez s6, .F.yet_another_control_flow._6.while.body.2
  j .F.yet_another_control_flow._13.while.exit.2                        # ir inst 18 fin
.F.yet_another_control_flow._6.while.body.2:
  slli s6, t3, 1                                                        # ir inst 19 fin
  add s5, t6, s6                                                        # ir inst 20 fin
  li t2, 3
  mul s6, s9, t2                                                        # ir inst 21 fin
  add s0, s5, s6                                                        # ir inst 22 fin
  li t2, 5
  rem s6, s0, t2                                                        # ir inst 23 fin
  li t2, 0
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 24 fin
  bnez s5, .F.yet_another_control_flow._7.if.then.0
  j .F.yet_another_control_flow._8.if.else.0                            # ir inst 25 fin
.F.yet_another_control_flow._7.if.then.0:
  addi s6, s7, 1                                                        # ir inst 26 fin
# Phi connections
  mv s5, s6
  mv s6, s8
  j .F.yet_another_control_flow._9.if.exit.0                            # ir inst 27 fin
.F.yet_another_control_flow._8.if.else.0:
  addi s6, s8, 1                                                        # ir inst 28 fin
# Phi connections
  mv s5, s7
  j .F.yet_another_control_flow._9.if.exit.0                            # ir inst 29 fin
.F.yet_another_control_flow._9.if.exit.0:
  slt s0, s6, s5                                                        # ir inst 32 fin
  bnez s0, .F.yet_another_control_flow._10.if.then.1
  j .F.yet_another_control_flow._11.if.else.1                           # ir inst 33 fin
.F.yet_another_control_flow._10.if.then.1:
# Phi connections
  mv t0, s5
  mv s5, s6
  mv s6, t0
  j .F.yet_another_control_flow._12.if.exit.1                           # ir inst 34 fin
.F.yet_another_control_flow._11.if.else.1:
# Phi connections
  j .F.yet_another_control_flow._12.if.exit.1                           # ir inst 35 fin
.F.yet_another_control_flow._12.if.exit.1:
  addi s0, s9, 1                                                        # ir inst 38 fin
# Phi connections
  mv s7, s5
  mv s8, s6
  mv s9, s0
  j .F.yet_another_control_flow._5.while.cond.2                         # ir inst 39 fin
.F.yet_another_control_flow._13.while.exit.2:
  addi s9, t3, 1                                                        # ir inst 40 fin
# Phi connections
  mv s10, s7
  mv s11, s8
  mv t3, s9
  j .F.yet_another_control_flow._3.while.cond.1                         # ir inst 41 fin
.F.yet_another_control_flow._14.while.exit.1:
  addi t3, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F.yet_another_control_flow._1.while.cond.0                         # ir inst 43 fin
.F.yet_another_control_flow._15.while.exit.0:
  li t2, 1000
  mul t6, t4, t2                                                        # ir inst 44 fin
  add t4, t6, t5                                                        # ir inst 45 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 46 fin
  j .F.yet_another_control_flow.epilogue                                # ir inst 47 fin
.F.yet_another_control_flow.epilogue:
  ld ra, 72(sp)
  ld s0, 8(sp)
  ld s5, 16(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s8, 48(sp)
  ld s7, 56(sp)
  ld s6, 64(sp)
  addi sp, sp, 80
  ret
