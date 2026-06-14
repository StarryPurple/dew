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
# spill func args num: 0,             range:     4880(sp) -     4880(sp)
# local var size: 4864,               range:       16(sp) -     4880(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4880
  add sp, sp, t0
  sd ra, 8(sp)
main._0.entry.0:
  addi t1, sp, 16
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
# Start call preparation
  li a1, 12345
  addi t1, sp, 16
  mv a0, t1
  call .F.generate_text
# ir inst 11 fin
  li t1, 4112
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 14 fin
main._4.array.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 17 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 21 fin
main._6.array.exit.1:
  li t1, 4112
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 22 fin
  li t1, 65
  sw t1, 0(t6)                                                          # ir inst 23 fin
  li t1, 4112
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 24 fin
  li t1, 66
  sw t1, 0(t6)                                                          # ir inst 25 fin
  li t1, 4112
  add t1, sp, t1
  addi t6, t1, 8                                                        # ir inst 26 fin
  li t1, 67
  sw t1, 0(t6)                                                          # ir inst 27 fin
  li t1, 4368
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 29 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 30 fin
main._7.array.cond.2:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 32 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 33 fin
main._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 34 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 35 fin
  addi t4, t5, 1                                                        # ir inst 36 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 37 fin
main._9.array.exit.2:
  li t1, 4368
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 38 fin
  li t1, 88
  sw t1, 0(t6)                                                          # ir inst 39 fin
  li t1, 4368
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 40 fin
  li t1, 89
  sw t1, 0(t6)                                                          # ir inst 41 fin
  li t1, 4368
  add t1, sp, t1
  addi t6, t1, 8                                                        # ir inst 42 fin
  li t1, 90
  sw t1, 0(t6)                                                          # ir inst 43 fin
  li t1, 4368
  add t1, sp, t1
  addi t6, t1, 12                                                       # ir inst 44 fin
  li t1, 88
  sw t1, 0(t6)                                                          # ir inst 45 fin
  li t1, 4368
  add t1, sp, t1
  addi t6, t1, 16                                                       # ir inst 46 fin
  li t1, 89
  sw t1, 0(t6)                                                          # ir inst 47 fin
  li t1, 4624
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 49 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 50 fin
main._10.array.cond.3:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 52 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 53 fin
main._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 54 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 55 fin
  addi t4, t5, 1                                                        # ir inst 56 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 57 fin
main._12.array.exit.3:
  li t1, 4624
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 58 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 59 fin
  li t1, 4624
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 60 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 61 fin
# Start call preparation
  li a2, 3
  li t1, 4112
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.find_pattern
  mv t6, a0
# ir inst 62 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 63 fin
# Start call preparation
  li a3, 90
  li a2, 5
  li t1, 4368
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.find_pattern_with_wildcard
  mv t6, a0
# ir inst 64 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 65 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.find_complex_pattern
  mv t6, a0
# ir inst 66 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 67 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.analyze_text_frequency
  mv t6, a0
# ir inst 68 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 69 fin
# Start call preparation
  li a2, 3
  li t1, 4112
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.trigger_error_path
  mv t6, a0
# ir inst 70 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 71 fin
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 72 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 73 fin
  j main.epilogue                                                       # ir inst 74 fin
main.epilogue:
  ld ra, 8(sp)
  li t0, 4880
  add sp, sp, t0
  ret

.globl .F.generate_text
.F.generate_text:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.generate_text._0.entry.0:
# Phi connections
  mv t5, a1
  li t6, 0
  j .F.generate_text._1.while.cond.0                                    # ir inst 1 fin
.F.generate_text._1.while.cond.0:
  li t1, 1024
  mv t4, t1                                                             # ir inst 4 fin
  slt t3, t6, t4                                                        # ir inst 5 fin
  bnez t3, .F.generate_text._2.while.body.0
  j .F.generate_text._12.while.exit.0                                   # ir inst 6 fin
.F.generate_text._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call .F.pm_rand_update
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
  li t2, 65536
  div t5, t4, t2                                                        # ir inst 8 fin
  li t2, 32768
  rem t4, t5, t2                                                        # ir inst 9 fin
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 11 fin
  li t2, 26
  rem t5, t4, t2                                                        # ir inst 12 fin
  addi s11, t5, 65                                                      # ir inst 13 fin
  sw s11, 0(t3)                                                         # ir inst 14 fin
  li t2, 10
  rem t5, t6, t2                                                        # ir inst 15 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.generate_text._3.if.then.0
  j .F.generate_text._4.if.else.0                                       # ir inst 17 fin
.F.generate_text._3.if.then.0:
  mv t5, t6                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 19 fin
  li t2, 100
  div t5, t6, t2                                                        # ir inst 20 fin
  addi s11, t5, 65                                                      # ir inst 21 fin
  sw s11, 0(t3)                                                         # ir inst 22 fin
  j .F.generate_text._5.if.exit.0                                       # ir inst 23 fin
.F.generate_text._4.if.else.0:
  j .F.generate_text._5.if.exit.0                                       # ir inst 24 fin
.F.generate_text._5.if.exit.0:
  li t2, 27
  rem t5, t6, t2                                                        # ir inst 25 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 26 fin
  bnez t3, .F.generate_text._6.if.then.1
  j .F.generate_text._7.if.else.1                                       # ir inst 27 fin
.F.generate_text._6.if.then.1:
  mv t5, t6                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 29 fin
  li t1, 66
  sw t1, 0(t3)                                                          # ir inst 30 fin
  j .F.generate_text._8.if.exit.1                                       # ir inst 31 fin
.F.generate_text._7.if.else.1:
  j .F.generate_text._8.if.exit.1                                       # ir inst 32 fin
.F.generate_text._8.if.exit.1:
  li t2, 42
  rem t5, t6, t2                                                        # ir inst 33 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 34 fin
  bnez t3, .F.generate_text._9.if.then.2
  j .F.generate_text._10.if.else.2                                      # ir inst 35 fin
.F.generate_text._9.if.then.2:
  mv t5, t6                                                             # ir inst 36 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 37 fin
  li t1, 67
  sw t1, 0(t3)                                                          # ir inst 38 fin
  j .F.generate_text._11.if.exit.2                                      # ir inst 39 fin
.F.generate_text._10.if.else.2:
  j .F.generate_text._11.if.exit.2                                      # ir inst 40 fin
.F.generate_text._11.if.exit.2:
  addi t5, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.generate_text._1.while.cond.0                                    # ir inst 42 fin
.F.generate_text._12.while.exit.0:
  j .F.generate_text.epilogue                                           # ir inst 43 fin
.F.generate_text.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.find_pattern
.F.find_pattern:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.find_pattern._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.find_pattern._1.while.cond.0                                     # ir inst 1 fin
.F.find_pattern._1.while.cond.0:
  li t1, 1024
  mv t4, t1                                                             # ir inst 4 fin
  sub t3, t4, a2                                                        # ir inst 5 fin
  slt t0, t3, t6
  xori t4, t0, 1                                                        # ir inst 6 fin
  bnez t4, .F.find_pattern._2.while.body.0
  j .F.find_pattern._12.while.exit.0                                    # ir inst 7 fin
.F.find_pattern._2.while.body.0:
# Phi connections
  li t4, 0
  j .F.find_pattern._3.while.cond.1                                     # ir inst 8 fin
.F.find_pattern._3.while.cond.1:
  slt t3, t4, a2                                                        # ir inst 10 fin
  bnez t3, .F.find_pattern._4.while.body.1
  j .F.find_pattern._13.critical_edge.0                                 # ir inst 11 fin
.F.find_pattern._4.while.body.1:
  add t3, t6, t4                                                        # ir inst 12 fin
  mv s11, t3                                                            # ir inst 13 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s11, 0(t3)                                                         # ir inst 15 fin
  mv t3, t4                                                             # ir inst 16 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 17 fin
  lw t3, 0(s10)                                                         # ir inst 18 fin
  xor t0, s11, t3
  sltu s10, zero, t0                                                    # ir inst 19 fin
  bnez s10, .F.find_pattern._5.if.then.0
  j .F.find_pattern._6.if.else.0                                        # ir inst 20 fin
.F.find_pattern._5.if.then.0:
# Phi connections
  li t4, 0
  j .F.find_pattern._8.while.exit.1                                     # ir inst 21 fin
.F.find_pattern._6.if.else.0:
  j .F.find_pattern._7.if.exit.0                                        # ir inst 22 fin
.F.find_pattern._7.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 23 fin
# Phi connections
  mv t4, t3
  j .F.find_pattern._3.while.cond.1                                     # ir inst 24 fin
.F.find_pattern._8.while.exit.1:
  bnez t4, .F.find_pattern._9.if.then.1
  j .F.find_pattern._10.if.else.1                                       # ir inst 26 fin
.F.find_pattern._9.if.then.1:
  addi t4, t5, 1                                                        # ir inst 27 fin
# Phi connections
  j .F.find_pattern._11.if.exit.1                                       # ir inst 28 fin
.F.find_pattern._10.if.else.1:
# Phi connections
  mv t4, t5
  j .F.find_pattern._11.if.exit.1                                       # ir inst 29 fin
.F.find_pattern._11.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.find_pattern._1.while.cond.0                                     # ir inst 32 fin
.F.find_pattern._12.while.exit.0:
  mv a0, t5
  j .F.find_pattern.epilogue                                            # ir inst 33 fin
.F.find_pattern._13.critical_edge.0:
# Phi connections
  li t4, 1
  j .F.find_pattern._8.while.exit.1                                     # ir inst 34 fin
.F.find_pattern.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.find_pattern_with_wildcard
.F.find_pattern_with_wildcard:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.find_pattern_with_wildcard._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.find_pattern_with_wildcard._1.while.cond.0                       # ir inst 1 fin
.F.find_pattern_with_wildcard._1.while.cond.0:
  li t1, 1024
  mv t4, t1                                                             # ir inst 4 fin
  sub t3, t4, a2                                                        # ir inst 5 fin
  slt t0, t3, t6
  xori t4, t0, 1                                                        # ir inst 6 fin
  bnez t4, .F.find_pattern_with_wildcard._2.while.body.0
  j .F.find_pattern_with_wildcard._15.while.exit.0                      # ir inst 7 fin
.F.find_pattern_with_wildcard._2.while.body.0:
# Phi connections
  li t4, 0
  j .F.find_pattern_with_wildcard._3.while.cond.1                       # ir inst 8 fin
.F.find_pattern_with_wildcard._3.while.cond.1:
  slt t3, t4, a2                                                        # ir inst 10 fin
  bnez t3, .F.find_pattern_with_wildcard._4.while.body.1
  j .F.find_pattern_with_wildcard._16.critical_edge.0                   # ir inst 11 fin
.F.find_pattern_with_wildcard._4.while.body.1:
  mv t3, t4                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  xor t0, t3, a3
  sltu s11, zero, t0                                                    # ir inst 15 fin
  bnez s11, .F.find_pattern_with_wildcard._5.lazy.then.0
  j .F.find_pattern_with_wildcard._6.lazy.else.0                        # ir inst 16 fin
.F.find_pattern_with_wildcard._5.lazy.then.0:
  add t3, t6, t4                                                        # ir inst 17 fin
  mv s11, t3                                                            # ir inst 18 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 19 fin
  lw s11, 0(t3)                                                         # ir inst 20 fin
  mv t3, t4                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 22 fin
  lw t3, 0(s10)                                                         # ir inst 23 fin
  xor t0, s11, t3
  sltu s10, zero, t0                                                    # ir inst 24 fin
# Phi connections
  mv t3, s10
  j .F.find_pattern_with_wildcard._7.lazy.exit.0                        # ir inst 25 fin
.F.find_pattern_with_wildcard._6.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.find_pattern_with_wildcard._7.lazy.exit.0                        # ir inst 26 fin
.F.find_pattern_with_wildcard._7.lazy.exit.0:
  bnez t3, .F.find_pattern_with_wildcard._8.if.then.0
  j .F.find_pattern_with_wildcard._9.if.else.0                          # ir inst 28 fin
.F.find_pattern_with_wildcard._8.if.then.0:
# Phi connections
  li t4, 0
  j .F.find_pattern_with_wildcard._11.while.exit.1                      # ir inst 29 fin
.F.find_pattern_with_wildcard._9.if.else.0:
  j .F.find_pattern_with_wildcard._10.if.exit.0                         # ir inst 30 fin
.F.find_pattern_with_wildcard._10.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 31 fin
# Phi connections
  mv t4, t3
  j .F.find_pattern_with_wildcard._3.while.cond.1                       # ir inst 32 fin
.F.find_pattern_with_wildcard._11.while.exit.1:
  bnez t4, .F.find_pattern_with_wildcard._12.if.then.1
  j .F.find_pattern_with_wildcard._13.if.else.1                         # ir inst 34 fin
.F.find_pattern_with_wildcard._12.if.then.1:
  addi t4, t5, 1                                                        # ir inst 35 fin
# Phi connections
  j .F.find_pattern_with_wildcard._14.if.exit.1                         # ir inst 36 fin
.F.find_pattern_with_wildcard._13.if.else.1:
# Phi connections
  mv t4, t5
  j .F.find_pattern_with_wildcard._14.if.exit.1                         # ir inst 37 fin
.F.find_pattern_with_wildcard._14.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.find_pattern_with_wildcard._1.while.cond.0                       # ir inst 40 fin
.F.find_pattern_with_wildcard._15.while.exit.0:
  mv a0, t5
  j .F.find_pattern_with_wildcard.epilogue                              # ir inst 41 fin
.F.find_pattern_with_wildcard._16.critical_edge.0:
# Phi connections
  li t4, 1
  j .F.find_pattern_with_wildcard._11.while.exit.1                      # ir inst 42 fin
.F.find_pattern_with_wildcard.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.find_complex_pattern
.F.find_complex_pattern:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.find_complex_pattern._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.find_complex_pattern._1.while.cond.0                             # ir inst 1 fin
.F.find_complex_pattern._1.while.cond.0:
  li t1, 1024
  mv t4, t1                                                             # ir inst 4 fin
  addi t3, t4, -5                                                       # ir inst 5 fin
  slt t4, t6, t3                                                        # ir inst 6 fin
  bnez t4, .F.find_complex_pattern._2.while.body.0
  j .F.find_complex_pattern._18.while.exit.0                            # ir inst 7 fin
.F.find_complex_pattern._2.while.body.0:
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  lw t4, 0(t3)                                                          # ir inst 10 fin
  mv t3, t6                                                             # ir inst 11 fin
  addi s11, t3, 3                                                       # ir inst 12 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  lw s11, 0(t3)                                                         # ir inst 14 fin
  xor t0, t4, s11
  sltiu t3, t0, 1                                                       # ir inst 15 fin
  bnez t3, .F.find_complex_pattern._3.lazy.then.0
  j .F.find_complex_pattern._4.lazy.else.0                              # ir inst 16 fin
.F.find_complex_pattern._3.lazy.then.0:
  mv t4, t6                                                             # ir inst 17 fin
  addi t3, t4, 1                                                        # ir inst 18 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  mv t4, t6                                                             # ir inst 21 fin
  addi s11, t4, 4                                                       # ir inst 22 fin
  slli t2, s11, 2
  add t4, a0, t2                                                        # ir inst 23 fin
  lw s11, 0(t4)                                                         # ir inst 24 fin
  xor t0, t3, s11
  sltiu t4, t0, 1                                                       # ir inst 25 fin
# Phi connections
  j .F.find_complex_pattern._5.lazy.exit.0                              # ir inst 26 fin
.F.find_complex_pattern._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.find_complex_pattern._5.lazy.exit.0                              # ir inst 27 fin
.F.find_complex_pattern._5.lazy.exit.0:
  bnez t4, .F.find_complex_pattern._6.lazy.then.1
  j .F.find_complex_pattern._7.lazy.else.1                              # ir inst 29 fin
.F.find_complex_pattern._6.lazy.then.1:
  mv t4, t6                                                             # ir inst 30 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 31 fin
  lw t4, 0(t3)                                                          # ir inst 32 fin
  mv t3, t6                                                             # ir inst 33 fin
  addi s11, t3, 2                                                       # ir inst 34 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 35 fin
  lw s11, 0(t3)                                                         # ir inst 36 fin
  slt t3, t4, s11                                                       # ir inst 37 fin
# Phi connections
  mv t4, t3
  j .F.find_complex_pattern._8.lazy.exit.1                              # ir inst 38 fin
.F.find_complex_pattern._7.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.find_complex_pattern._8.lazy.exit.1                              # ir inst 39 fin
.F.find_complex_pattern._8.lazy.exit.1:
  bnez t4, .F.find_complex_pattern._9.if.then.0
  j .F.find_complex_pattern._16.if.else.0                               # ir inst 41 fin
.F.find_complex_pattern._9.if.then.0:
# Phi connections
  li t3, 0
  li t4, 0
  j .F.find_complex_pattern._10.while.cond.1                            # ir inst 42 fin
.F.find_complex_pattern._10.while.cond.1:
  li t2, 5
  slt s11, t4, t2                                                       # ir inst 45 fin
  bnez s11, .F.find_complex_pattern._11.while.body.1
  j .F.find_complex_pattern._12.while.exit.1                            # ir inst 46 fin
.F.find_complex_pattern._11.while.body.1:
  add s11, t6, t4                                                       # ir inst 47 fin
  mv s10, s11                                                           # ir inst 48 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 49 fin
  lw s10, 0(s11)                                                        # ir inst 50 fin
  add s11, t3, s10                                                      # ir inst 51 fin
  addi s10, t4, 1                                                       # ir inst 52 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.find_complex_pattern._10.while.cond.1                            # ir inst 53 fin
.F.find_complex_pattern._12.while.exit.1:
  li t2, 350
  slt t4, t2, t3                                                        # ir inst 54 fin
  bnez t4, .F.find_complex_pattern._13.if.then.1
  j .F.find_complex_pattern._14.if.else.1                               # ir inst 55 fin
.F.find_complex_pattern._13.if.then.1:
  addi t4, t5, 1                                                        # ir inst 56 fin
# Phi connections
  j .F.find_complex_pattern._15.if.exit.1                               # ir inst 57 fin
.F.find_complex_pattern._14.if.else.1:
# Phi connections
  mv t4, t5
  j .F.find_complex_pattern._15.if.exit.1                               # ir inst 58 fin
.F.find_complex_pattern._15.if.exit.1:
# Phi connections
  j .F.find_complex_pattern._17.if.exit.0                               # ir inst 60 fin
.F.find_complex_pattern._16.if.else.0:
# Phi connections
  mv t4, t5
  j .F.find_complex_pattern._17.if.exit.0                               # ir inst 61 fin
.F.find_complex_pattern._17.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 63 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.find_complex_pattern._1.while.cond.0                             # ir inst 64 fin
.F.find_complex_pattern._18.while.exit.0:
  mv a0, t5
  j .F.find_complex_pattern.epilogue                                    # ir inst 65 fin
.F.find_complex_pattern.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.analyze_text_frequency
.F.analyze_text_frequency:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 104,                range:       16(sp) -      120(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.analyze_text_frequency._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.analyze_text_frequency._1.array.cond.0                           # ir inst 3 fin
.F.analyze_text_frequency._1.array.cond.0:
  li t2, 26
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.analyze_text_frequency._2.array.body.0
  j .F.analyze_text_frequency._3.array.exit.0                           # ir inst 6 fin
.F.analyze_text_frequency._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.analyze_text_frequency._1.array.cond.0                           # ir inst 10 fin
.F.analyze_text_frequency._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.analyze_text_frequency._4.while.cond.0                           # ir inst 11 fin
.F.analyze_text_frequency._4.while.cond.0:
  li t1, 1024
  mv t5, t1                                                             # ir inst 13 fin
  slt t4, t6, t5                                                        # ir inst 14 fin
  bnez t4, .F.analyze_text_frequency._5.while.body.0
  j .F.analyze_text_frequency._12.while.exit.0                          # ir inst 15 fin
.F.analyze_text_frequency._5.while.body.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 17 fin
  lw t5, 0(t4)                                                          # ir inst 18 fin
  li t2, 65
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 19 fin
  bnez t4, .F.analyze_text_frequency._6.lazy.then.0
  j .F.analyze_text_frequency._7.lazy.else.0                            # ir inst 20 fin
.F.analyze_text_frequency._6.lazy.then.0:
  li t2, 90
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 21 fin
# Phi connections
  j .F.analyze_text_frequency._8.lazy.exit.0                            # ir inst 22 fin
.F.analyze_text_frequency._7.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.analyze_text_frequency._8.lazy.exit.0                            # ir inst 23 fin
.F.analyze_text_frequency._8.lazy.exit.0:
  bnez t4, .F.analyze_text_frequency._9.if.then.0
  j .F.analyze_text_frequency._10.if.else.0                             # ir inst 25 fin
.F.analyze_text_frequency._9.if.then.0:
  mv t4, t5                                                             # ir inst 26 fin
  addi t3, t4, -65                                                      # ir inst 27 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 28 fin
  mv t3, t5                                                             # ir inst 29 fin
  addi t5, t3, -65                                                      # ir inst 30 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 31 fin
  lw t5, 0(t3)                                                          # ir inst 32 fin
  addi t3, t5, 1                                                        # ir inst 33 fin
  sw t3, 0(t4)                                                          # ir inst 34 fin
  j .F.analyze_text_frequency._11.if.exit.0                             # ir inst 35 fin
.F.analyze_text_frequency._10.if.else.0:
  j .F.analyze_text_frequency._11.if.exit.0                             # ir inst 36 fin
.F.analyze_text_frequency._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t6, t5
  j .F.analyze_text_frequency._4.while.cond.0                           # ir inst 38 fin
.F.analyze_text_frequency._12.while.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, -1
  j .F.analyze_text_frequency._13.while.cond.1                          # ir inst 39 fin
.F.analyze_text_frequency._13.while.cond.1:
  li t2, 26
  slt t3, t4, t2                                                        # ir inst 43 fin
  bnez t3, .F.analyze_text_frequency._14.while.body.1
  j .F.analyze_text_frequency._18.while.exit.1                          # ir inst 44 fin
.F.analyze_text_frequency._14.while.body.1:
  mv t3, t4                                                             # ir inst 45 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 46 fin
  lw t3, 0(s11)                                                         # ir inst 47 fin
  slt s11, t5, t3                                                       # ir inst 48 fin
  bnez s11, .F.analyze_text_frequency._15.if.then.1
  j .F.analyze_text_frequency._16.if.else.1                             # ir inst 49 fin
.F.analyze_text_frequency._15.if.then.1:
  mv t3, t4                                                             # ir inst 50 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 51 fin
  lw t3, 0(s11)                                                         # ir inst 52 fin
  addi s11, t4, 65                                                      # ir inst 53 fin
# Phi connections
  mv t0, s11
  mv s11, t3
  mv t3, t0
  j .F.analyze_text_frequency._17.if.exit.1                             # ir inst 54 fin
.F.analyze_text_frequency._16.if.else.1:
# Phi connections
  mv s11, t5
  mv t3, t6
  j .F.analyze_text_frequency._17.if.exit.1                             # ir inst 55 fin
.F.analyze_text_frequency._17.if.exit.1:
  addi s10, t4, 1                                                       # ir inst 58 fin
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F.analyze_text_frequency._13.while.cond.1                          # ir inst 59 fin
.F.analyze_text_frequency._18.while.exit.1:
  li t2, 1000
  mul t4, t6, t2                                                        # ir inst 60 fin
  add t6, t4, t5                                                        # ir inst 61 fin
  mv a0, t6
  j .F.analyze_text_frequency.epilogue                                  # ir inst 62 fin
.F.analyze_text_frequency.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 128
  ret

.globl .F.state_machine_search
.F.state_machine_search:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.state_machine_search._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.state_machine_search._1.while.cond.0                             # ir inst 1 fin
.F.state_machine_search._1.while.cond.0:
  li t1, 1024
  mv t3, t1                                                             # ir inst 5 fin
  slt s11, t4, t3                                                       # ir inst 6 fin
  bnez s11, .F.state_machine_search._2.while.body.0
  j .F.state_machine_search._33.while.exit.0                            # ir inst 7 fin
.F.state_machine_search._2.while.body.0:
  mv t3, t4                                                             # ir inst 8 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 9 fin
  lw t3, 0(s11)                                                         # ir inst 10 fin
  li t2, 0
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 11 fin
  bnez s11, .F.state_machine_search._3.if.then.0
  j .F.state_machine_search._7.if.else.0                                # ir inst 12 fin
.F.state_machine_search._3.if.then.0:
  li t2, 65
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 13 fin
  bnez s11, .F.state_machine_search._4.if.then.1
  j .F.state_machine_search._5.if.else.1                                # ir inst 14 fin
.F.state_machine_search._4.if.then.1:
# Phi connections
  li s11, 1
  j .F.state_machine_search._6.if.exit.1                                # ir inst 15 fin
.F.state_machine_search._5.if.else.1:
# Phi connections
  mv s11, t6
  j .F.state_machine_search._6.if.exit.1                                # ir inst 16 fin
.F.state_machine_search._6.if.exit.1:
# Phi connections
  mv t3, t5
  mv t6, s11
  j .F.state_machine_search._32.if.exit.0                               # ir inst 18 fin
.F.state_machine_search._7.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 19 fin
  bnez s11, .F.state_machine_search._8.if.then.2
  j .F.state_machine_search._15.if.else.2                               # ir inst 20 fin
.F.state_machine_search._8.if.then.2:
  li t2, 66
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 21 fin
  bnez s11, .F.state_machine_search._9.if.then.3
  j .F.state_machine_search._10.if.else.3                               # ir inst 22 fin
.F.state_machine_search._9.if.then.3:
# Phi connections
  li s11, 2
  j .F.state_machine_search._14.if.exit.3                               # ir inst 23 fin
.F.state_machine_search._10.if.else.3:
  li t2, 65
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 24 fin
  bnez s11, .F.state_machine_search._11.if.then.4
  j .F.state_machine_search._12.if.else.4                               # ir inst 25 fin
.F.state_machine_search._11.if.then.4:
# Phi connections
  li s11, 0
  j .F.state_machine_search._13.if.exit.4                               # ir inst 26 fin
.F.state_machine_search._12.if.else.4:
# Phi connections
  mv s11, t6
  j .F.state_machine_search._13.if.exit.4                               # ir inst 27 fin
.F.state_machine_search._13.if.exit.4:
# Phi connections
  j .F.state_machine_search._14.if.exit.3                               # ir inst 29 fin
.F.state_machine_search._14.if.exit.3:
# Phi connections
  mv t3, t5
  mv t6, s11
  j .F.state_machine_search._31.if.exit.2                               # ir inst 31 fin
.F.state_machine_search._15.if.else.2:
  li t2, 2
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 32 fin
  bnez s11, .F.state_machine_search._16.if.then.5
  j .F.state_machine_search._23.if.else.5                               # ir inst 33 fin
.F.state_machine_search._16.if.then.5:
  li t2, 67
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 34 fin
  bnez s11, .F.state_machine_search._17.if.then.6
  j .F.state_machine_search._18.if.else.6                               # ir inst 35 fin
.F.state_machine_search._17.if.then.6:
# Phi connections
  li s11, 3
  j .F.state_machine_search._22.if.exit.6                               # ir inst 36 fin
.F.state_machine_search._18.if.else.6:
  li t2, 65
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 37 fin
  bnez s11, .F.state_machine_search._19.if.then.7
  j .F.state_machine_search._20.if.else.7                               # ir inst 38 fin
.F.state_machine_search._19.if.then.7:
# Phi connections
  li s11, 1
  j .F.state_machine_search._21.if.exit.7                               # ir inst 39 fin
.F.state_machine_search._20.if.else.7:
# Phi connections
  li s11, 0
  j .F.state_machine_search._21.if.exit.7                               # ir inst 40 fin
.F.state_machine_search._21.if.exit.7:
# Phi connections
  j .F.state_machine_search._22.if.exit.6                               # ir inst 42 fin
.F.state_machine_search._22.if.exit.6:
# Phi connections
  mv t3, t5
  mv t6, s11
  j .F.state_machine_search._30.if.exit.5                               # ir inst 44 fin
.F.state_machine_search._23.if.else.5:
  li t2, 3
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 45 fin
  bnez s11, .F.state_machine_search._24.if.then.8
  j .F.state_machine_search._28.if.else.8                               # ir inst 46 fin
.F.state_machine_search._24.if.then.8:
  addi s11, t5, 1                                                       # ir inst 47 fin
  li t2, 65
  xor t0, t3, t2
  sltiu s10, t0, 1                                                      # ir inst 48 fin
  bnez s10, .F.state_machine_search._25.if.then.9
  j .F.state_machine_search._26.if.else.9                               # ir inst 49 fin
.F.state_machine_search._25.if.then.9:
# Phi connections
  li t3, 1
  j .F.state_machine_search._27.if.exit.9                               # ir inst 50 fin
.F.state_machine_search._26.if.else.9:
# Phi connections
  li t3, 0
  j .F.state_machine_search._27.if.exit.9                               # ir inst 51 fin
.F.state_machine_search._27.if.exit.9:
# Phi connections
  mv t6, t3
  mv t3, s11
  j .F.state_machine_search._29.if.exit.8                               # ir inst 53 fin
.F.state_machine_search._28.if.else.8:
# Phi connections
  mv t3, t5
  j .F.state_machine_search._29.if.exit.8                               # ir inst 54 fin
.F.state_machine_search._29.if.exit.8:
# Phi connections
  j .F.state_machine_search._30.if.exit.5                               # ir inst 57 fin
.F.state_machine_search._30.if.exit.5:
# Phi connections
  j .F.state_machine_search._31.if.exit.2                               # ir inst 60 fin
.F.state_machine_search._31.if.exit.2:
# Phi connections
  j .F.state_machine_search._32.if.exit.0                               # ir inst 63 fin
.F.state_machine_search._32.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 66 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.state_machine_search._1.while.cond.0                             # ir inst 67 fin
.F.state_machine_search._33.while.exit.0:
  mv a0, t5
  j .F.state_machine_search.epilogue                                    # ir inst 68 fin
.F.state_machine_search.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.trigger_error_path
.F.trigger_error_path:
# spill func args num: 0,             range:     4160(sp) -     4160(sp)
# local var size: 4096,               range:       56(sp) -     4152(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 3 / 12,        range:       24(sp) -       48(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4160
  add sp, sp, t0
  sd s10, 24(sp)
  sd s9, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.trigger_error_path._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  li a2, 4096
  mv a1, a0
  addi t1, sp, 56
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.trigger_error_path._1.while.cond.0                               # ir inst 3 fin
.F.trigger_error_path._1.while.cond.0:
  li t1, 1024
  mv t5, t1                                                             # ir inst 5 fin
  slt t4, t6, t5                                                        # ir inst 6 fin
  bnez t4, .F.trigger_error_path._2.while.body.0
  j .F.trigger_error_path._3.while.exit.0                               # ir inst 7 fin
.F.trigger_error_path._2.while.body.0:
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t4, t1, t2                                                        # ir inst 9 fin
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t3, t1, t2                                                        # ir inst 11 fin
  lw t5, 0(t3)                                                          # ir inst 12 fin
  li t2, 10
  rem t3, t6, t2                                                        # ir inst 13 fin
  add s11, t5, t3                                                       # ir inst 14 fin
  sw s11, 0(t4)                                                         # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.trigger_error_path._1.while.cond.0                               # ir inst 17 fin
.F.trigger_error_path._3.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.trigger_error_path._4.while.cond.1                               # ir inst 18 fin
.F.trigger_error_path._4.while.cond.1:
  li t1, 1024
  mv t4, t1                                                             # ir inst 21 fin
  sub t3, t4, a2                                                        # ir inst 22 fin
  slt t0, t3, t5
  xori t4, t0, 1                                                        # ir inst 23 fin
  bnez t4, .F.trigger_error_path._5.while.body.1
  j .F.trigger_error_path._27.while.exit.1                              # ir inst 24 fin
.F.trigger_error_path._5.while.body.1:
# Phi connections
  li t3, 0
  li t4, 0
  j .F.trigger_error_path._6.while.cond.2                               # ir inst 25 fin
.F.trigger_error_path._6.while.cond.2:
  slt s11, t3, a2                                                       # ir inst 28 fin
  bnez s11, .F.trigger_error_path._7.while.body.2
  j .F.trigger_error_path._11.while.exit.2                              # ir inst 29 fin
.F.trigger_error_path._7.while.body.2:
  add s11, t5, t3                                                       # ir inst 30 fin
  mv s10, s11                                                           # ir inst 31 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 32 fin
  lw s10, 0(s11)                                                        # ir inst 33 fin
  mv s11, t3                                                            # ir inst 34 fin
  slli t2, s11, 2
  add s9, a1, t2                                                        # ir inst 35 fin
  lw s11, 0(s9)                                                         # ir inst 36 fin
  xor t0, s10, s11
  sltiu s9, t0, 1                                                       # ir inst 37 fin
  bnez s9, .F.trigger_error_path._8.if.then.0
  j .F.trigger_error_path._9.if.else.0                                  # ir inst 38 fin
.F.trigger_error_path._8.if.then.0:
  addi s11, t4, 1                                                       # ir inst 39 fin
# Phi connections
  j .F.trigger_error_path._10.if.exit.0                                 # ir inst 40 fin
.F.trigger_error_path._9.if.else.0:
# Phi connections
  mv s11, t4
  j .F.trigger_error_path._10.if.exit.0                                 # ir inst 41 fin
.F.trigger_error_path._10.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 43 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.trigger_error_path._6.while.cond.2                               # ir inst 44 fin
.F.trigger_error_path._11.while.exit.2:
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 45 fin
  bnez t3, .F.trigger_error_path._12.if.then.1
  j .F.trigger_error_path._25.if.else.1                                 # ir inst 46 fin
.F.trigger_error_path._12.if.then.1:
  li t2, 2
  slt t3, t4, t2                                                        # ir inst 47 fin
  bnez t3, .F.trigger_error_path._13.if.then.2
  j .F.trigger_error_path._14.if.else.2                                 # ir inst 48 fin
.F.trigger_error_path._13.if.then.2:
# Phi connections
  li t3, 0
  j .F.trigger_error_path._15.if.exit.2                                 # ir inst 49 fin
.F.trigger_error_path._14.if.else.2:
# Phi connections
  li t3, 1
  j .F.trigger_error_path._15.if.exit.2                                 # ir inst 50 fin
.F.trigger_error_path._15.if.exit.2:
# Phi connections
  li s11, 2
  j .F.trigger_error_path._16.while.cond.3                              # ir inst 52 fin
.F.trigger_error_path._16.while.cond.3:
  mul s10, s11, s11                                                     # ir inst 54 fin
  slt t0, t4, s10
  xori s9, t0, 1                                                        # ir inst 55 fin
  bnez s9, .F.trigger_error_path._17.while.body.3
  j .F.trigger_error_path._37.critical_edge.0                           # ir inst 56 fin
.F.trigger_error_path._17.while.body.3:
  rem s10, t4, s11                                                      # ir inst 57 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 58 fin
  bnez s9, .F.trigger_error_path._18.if.then.3
  j .F.trigger_error_path._19.if.else.3                                 # ir inst 59 fin
.F.trigger_error_path._18.if.then.3:
# Phi connections
  li t4, 0
  j .F.trigger_error_path._21.while.exit.3                              # ir inst 60 fin
.F.trigger_error_path._19.if.else.3:
  j .F.trigger_error_path._20.if.exit.3                                 # ir inst 61 fin
.F.trigger_error_path._20.if.exit.3:
  addi s10, s11, 1                                                      # ir inst 62 fin
# Phi connections
  mv s11, s10
  j .F.trigger_error_path._16.while.cond.3                              # ir inst 63 fin
.F.trigger_error_path._21.while.exit.3:
  bnez t4, .F.trigger_error_path._22.if.then.4
  j .F.trigger_error_path._23.if.else.4                                 # ir inst 65 fin
.F.trigger_error_path._22.if.then.4:
  addi t4, t6, 1                                                        # ir inst 66 fin
# Phi connections
  j .F.trigger_error_path._24.if.exit.4                                 # ir inst 67 fin
.F.trigger_error_path._23.if.else.4:
# Phi connections
  mv t4, t6
  j .F.trigger_error_path._24.if.exit.4                                 # ir inst 68 fin
.F.trigger_error_path._24.if.exit.4:
# Phi connections
  j .F.trigger_error_path._26.if.exit.1                                 # ir inst 70 fin
.F.trigger_error_path._25.if.else.1:
# Phi connections
  mv t4, t6
  j .F.trigger_error_path._26.if.exit.1                                 # ir inst 71 fin
.F.trigger_error_path._26.if.exit.1:
  addi s11, t5, 1                                                       # ir inst 73 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j .F.trigger_error_path._4.while.cond.1                               # ir inst 74 fin
.F.trigger_error_path._27.while.exit.1:
# Phi connections
  li s11, 0
  li t4, 0
  j .F.trigger_error_path._28.while.cond.4                              # ir inst 75 fin
.F.trigger_error_path._28.while.cond.4:
  li t2, 100
  slt s10, s11, t2                                                      # ir inst 78 fin
  bnez s10, .F.trigger_error_path._29.while.body.4
  j .F.trigger_error_path._33.while.exit.4                              # ir inst 79 fin
.F.trigger_error_path._29.while.body.4:
  li t2, 3
  rem s10, s11, t2                                                      # ir inst 80 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 81 fin
  bnez s9, .F.trigger_error_path._30.if.then.5
  j .F.trigger_error_path._31.if.else.5                                 # ir inst 82 fin
.F.trigger_error_path._30.if.then.5:
  mv s10, s11                                                           # ir inst 83 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 84 fin
  lw s10, 0(s9)                                                         # ir inst 85 fin
  add s9, t4, s10                                                       # ir inst 86 fin
# Phi connections
  mv s10, s9
  j .F.trigger_error_path._32.if.exit.5                                 # ir inst 87 fin
.F.trigger_error_path._31.if.else.5:
  mv s10, s11                                                           # ir inst 88 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 89 fin
  lw s10, 0(s9)                                                         # ir inst 90 fin
  sub s9, t4, s10                                                       # ir inst 91 fin
# Phi connections
  mv s10, s9
  j .F.trigger_error_path._32.if.exit.5                                 # ir inst 92 fin
.F.trigger_error_path._32.if.exit.5:
  addi s9, s11, 1                                                       # ir inst 94 fin
# Phi connections
  mv s11, s9
  mv t4, s10
  j .F.trigger_error_path._28.while.cond.4                              # ir inst 95 fin
.F.trigger_error_path._33.while.exit.4:
  add s11, t6, t4                                                       # ir inst 96 fin
  li t2, 1000
  slt t4, t2, s11                                                       # ir inst 97 fin
  bnez t4, .F.trigger_error_path._34.if.then.6
  j .F.trigger_error_path._35.if.else.6                                 # ir inst 98 fin
.F.trigger_error_path._34.if.then.6:
  li a0, 0
  j .F.trigger_error_path.epilogue                                      # ir inst 99 fin
.F.trigger_error_path._35.if.else.6:
  j .F.trigger_error_path._36.if.exit.6                                 # ir inst 100 fin
.F.trigger_error_path._36.if.exit.6:
  mv a0, s11
  j .F.trigger_error_path.epilogue                                      # ir inst 101 fin
.F.trigger_error_path._37.critical_edge.0:
# Phi connections
  mv t4, t3
  j .F.trigger_error_path._21.while.exit.3                              # ir inst 102 fin
.F.trigger_error_path.epilogue:
  ld ra, 48(sp)
  ld s10, 24(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  li t0, 4160
  add sp, sp, t0
  ret

.globl .F.another_level_of_search
.F.another_level_of_search:
# spill func args num: 0,             range:      304(sp) -      304(sp)
# local var size: 256,                range:       40(sp) -      296(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -304
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.another_level_of_search._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.another_level_of_search._1.array.cond.0                          # ir inst 3 fin
.F.another_level_of_search._1.array.cond.0:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.another_level_of_search._2.array.body.0
  j .F.another_level_of_search._3.array.exit.0                          # ir inst 6 fin
.F.another_level_of_search._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.another_level_of_search._1.array.cond.0                          # ir inst 10 fin
.F.another_level_of_search._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.another_level_of_search._4.while.cond.0                          # ir inst 11 fin
.F.another_level_of_search._4.while.cond.0:
  li t1, 64
  mv t5, t1                                                             # ir inst 13 fin
  slt t4, t6, t5                                                        # ir inst 14 fin
  bnez t4, .F.another_level_of_search._5.while.body.0
  j .F.another_level_of_search._6.while.exit.0                          # ir inst 15 fin
.F.another_level_of_search._5.while.body.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add t4, t1, t2                                                        # ir inst 17 fin
  li t2, 5
  rem t5, t6, t2                                                        # ir inst 18 fin
  addi t3, t5, 70                                                       # ir inst 19 fin
  sw t3, 0(t4)                                                          # ir inst 20 fin
  addi t5, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.another_level_of_search._4.while.cond.0                          # ir inst 22 fin
.F.another_level_of_search._6.while.exit.0:
# Phi connections
  li t6, 0
  j .F.another_level_of_search._7.while.cond.1                          # ir inst 23 fin
.F.another_level_of_search._7.while.cond.1:
  li t1, 960
  mv t5, t1                                                             # ir inst 25 fin
  slt t4, t6, t5                                                        # ir inst 26 fin
  bnez t4, .F.another_level_of_search._8.while.body.1
  j .F.another_level_of_search._19.critical_edge.0                      # ir inst 27 fin
.F.another_level_of_search._8.while.body.1:
# Phi connections
  li t5, 0
  j .F.another_level_of_search._9.while.cond.2                          # ir inst 28 fin
.F.another_level_of_search._9.while.cond.2:
  li t1, 64
  mv t4, t1                                                             # ir inst 30 fin
  slt t3, t5, t4                                                        # ir inst 31 fin
  bnez t3, .F.another_level_of_search._10.while.body.2
  j .F.another_level_of_search._20.critical_edge.1                      # ir inst 32 fin
.F.another_level_of_search._10.while.body.2:
  add t4, t6, t5                                                        # ir inst 33 fin
  mv t3, t4                                                             # ir inst 34 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 35 fin
  lw t3, 0(t4)                                                          # ir inst 36 fin
  mv t4, t5                                                             # ir inst 37 fin
  slli t2, t4, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 38 fin
  lw t4, 0(s11)                                                         # ir inst 39 fin
  xor t0, t3, t4
  sltu s11, zero, t0                                                    # ir inst 40 fin
  bnez s11, .F.another_level_of_search._11.if.then.0
  j .F.another_level_of_search._12.if.else.0                            # ir inst 41 fin
.F.another_level_of_search._11.if.then.0:
# Phi connections
  li t5, 0
  j .F.another_level_of_search._14.while.exit.2                         # ir inst 42 fin
.F.another_level_of_search._12.if.else.0:
  j .F.another_level_of_search._13.if.exit.0                            # ir inst 43 fin
.F.another_level_of_search._13.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  j .F.another_level_of_search._9.while.cond.2                          # ir inst 45 fin
.F.another_level_of_search._14.while.exit.2:
  bnez t5, .F.another_level_of_search._15.if.then.1
  j .F.another_level_of_search._16.if.else.1                            # ir inst 47 fin
.F.another_level_of_search._15.if.then.1:
# Phi connections
  mv t5, t6
  j .F.another_level_of_search._18.while.exit.1                         # ir inst 48 fin
.F.another_level_of_search._16.if.else.1:
  j .F.another_level_of_search._17.if.exit.1                            # ir inst 49 fin
.F.another_level_of_search._17.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F.another_level_of_search._7.while.cond.1                          # ir inst 51 fin
.F.another_level_of_search._18.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 53 fin
  j .F.another_level_of_search.epilogue                                 # ir inst 54 fin
.F.another_level_of_search._19.critical_edge.0:
# Phi connections
  li t5, -1
  j .F.another_level_of_search._18.while.exit.1                         # ir inst 55 fin
.F.another_level_of_search._20.critical_edge.1:
# Phi connections
  li t5, 1
  j .F.another_level_of_search._14.while.exit.2                         # ir inst 56 fin
.F.another_level_of_search.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 304
  ret

.globl .F.yet_another_search_function
.F.yet_another_search_function:
# spill func args num: 0,             range:     4112(sp) -     4112(sp)
# local var size: 4096,               range:       16(sp) -     4112(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4112
  add sp, sp, t0
  sd ra, 8(sp)
.F.yet_another_search_function._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.yet_another_search_function._1.array.cond.0                      # ir inst 3 fin
.F.yet_another_search_function._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.yet_another_search_function._2.array.body.0
  j .F.yet_another_search_function._3.array.exit.0                      # ir inst 6 fin
.F.yet_another_search_function._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.yet_another_search_function._1.array.cond.0                      # ir inst 10 fin
.F.yet_another_search_function._3.array.exit.0:
# Start call preparation
  li a1, 54321
  addi t1, sp, 16
  mv a0, t1
  call .F.generate_text
# ir inst 11 fin
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.state_machine_search
  mv t6, a0
# ir inst 12 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 16
  mv a0, t1
  call .F.another_level_of_search
  ld t6, 0(sp)
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
  j .F.yet_another_search_function.epilogue                             # ir inst 15 fin
.F.yet_another_search_function.epilogue:
  ld ra, 8(sp)
  li t0, 4112
  add sp, sp, t0
  ret
