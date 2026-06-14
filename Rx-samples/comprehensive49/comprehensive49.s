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
# spill func args num: 0,             range:     4128(sp) -     4128(sp)
# local var size: 4096,               range:       32(sp) -     4128(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4128
  add sp, sp, t0
  sd ra, 24(sp)
main._0.entry.0:
  addi t1, sp, 32
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
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 11 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 32
  addi t6, t1, 4                                                        # ir inst 13 fin
  li t1, 1020
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 32
  addi t6, t1, 8                                                        # ir inst 15 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 32
  addi t6, t1, 12                                                       # ir inst 17 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 18 fin
# Start call preparation
  li a1, 256
  addi t1, sp, 32
  mv a0, t1
  call .F.allocate
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 128
  addi t1, sp, 32
  mv a0, t1
  call .F.allocate
  mv t5, a0
  ld t6, 0(sp)
# ir inst 21 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 22 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 512
  addi t1, sp, 32
  mv a0, t1
  call .F.allocate
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 23 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 24 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.deallocate
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 25 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  li a1, 64
  addi t1, sp, 32
  mv a0, t1
  call .F.allocate
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 26 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 27 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  addi t1, sp, 32
  mv a0, t1
  call .F.deallocate
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 28 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a1, t4
  addi t1, sp, 32
  mv a0, t1
  call .F.deallocate
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 29 fin
# Start call preparation
  sd t5, 0(sp)
  li a1, 768
  addi t1, sp, 32
  mv a0, t1
  call .F.allocate
  mv t6, a0
  ld t5, 0(sp)
# ir inst 30 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 31 fin
# Phi connections
  li t6, 0
  j main._4.while.cond.0                                                # ir inst 32 fin
main._4.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 34 fin
  bnez t4, main._5.while.body.0
  j main._9.while.exit.0                                                # ir inst 35 fin
main._5.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a1, 10
  addi t1, sp, 32
  mv a0, t1
  call .F.allocate
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 36 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 37 fin
  bnez t3, main._6.if.then.0
  j main._7.if.else.0                                                   # ir inst 38 fin
main._6.if.then.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.deallocate
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 39 fin
  j main._8.if.exit.0                                                   # ir inst 40 fin
main._7.if.else.0:
  j main._8.if.exit.0                                                   # ir inst 41 fin
main._8.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t6, t4
  j main._4.while.cond.0                                                # ir inst 43 fin
main._9.while.exit.0:
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.print_memory_state
# ir inst 44 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 45 fin
  j main.epilogue                                                       # ir inst 46 fin
main.epilogue:
  ld ra, 24(sp)
  li t0, 4128
  add sp, sp, t0
  ret

.globl .F.allocate
.F.allocate:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.allocate._0.entry.0:
# Phi connections
  li t4, 1025
  li t5, -1
  li t6, 0
  j .F.allocate._1.while.cond.0                                         # ir inst 1 fin
.F.allocate._1.while.cond.0:
  li t2, -1
  xor t0, t6, t2
  sltu t3, zero, t0                                                     # ir inst 5 fin
  bnez t3, .F.allocate._2.while.body.0
  j .F.allocate._12.while.exit.0                                        # ir inst 6 fin
.F.allocate._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  mv s11, t6                                                            # ir inst 10 fin
  addi s10, s11, 1                                                      # ir inst 11 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw s10, 0(s11)                                                        # ir inst 13 fin
  li t2, 1
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.allocate._3.if.then.0
  j .F.allocate._10.if.else.0                                           # ir inst 15 fin
.F.allocate._3.if.then.0:
  slt t0, s10, a1
  xori t3, t0, 1                                                        # ir inst 16 fin
  bnez t3, .F.allocate._4.if.then.1
  j .F.allocate._8.if.else.1                                            # ir inst 17 fin
.F.allocate._4.if.then.1:
  slt t3, s10, t4                                                       # ir inst 18 fin
  bnez t3, .F.allocate._5.if.then.2
  j .F.allocate._6.if.else.2                                            # ir inst 19 fin
.F.allocate._5.if.then.2:
# Phi connections
  mv s11, s10
  mv t3, t6
  j .F.allocate._7.if.exit.2                                            # ir inst 20 fin
.F.allocate._6.if.else.2:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.allocate._7.if.exit.2                                            # ir inst 21 fin
.F.allocate._7.if.exit.2:
# Phi connections
  j .F.allocate._9.if.exit.1                                            # ir inst 24 fin
.F.allocate._8.if.else.1:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.allocate._9.if.exit.1                                            # ir inst 25 fin
.F.allocate._9.if.exit.1:
# Phi connections
  mv t4, t3
  mv t3, s11
  j .F.allocate._11.if.exit.0                                           # ir inst 28 fin
.F.allocate._10.if.else.0:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.allocate._11.if.exit.0                                           # ir inst 29 fin
.F.allocate._11.if.exit.0:
  mv s11, t6                                                            # ir inst 32 fin
  addi t6, s11, 3                                                       # ir inst 33 fin
  slli t2, t6, 2
  add s11, a0, t2                                                       # ir inst 34 fin
  lw t6, 0(s11)                                                         # ir inst 35 fin
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F.allocate._1.while.cond.0                                         # ir inst 36 fin
.F.allocate._12.while.exit.0:
  li t2, -1
  xor t0, t5, t2
  sltu t6, zero, t0                                                     # ir inst 37 fin
  bnez t6, .F.allocate._13.if.then.3
  j .F.allocate._20.if.else.3                                           # ir inst 38 fin
.F.allocate._13.if.then.3:
  mv t6, t5                                                             # ir inst 39 fin
  addi t4, t6, 1                                                        # ir inst 40 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 41 fin
  lw t4, 0(t6)                                                          # ir inst 42 fin
  sub t6, t4, a1                                                        # ir inst 43 fin
  addi t4, t6, -4                                                       # ir inst 44 fin
  li t2, 8
  slt t6, t2, t4                                                        # ir inst 45 fin
  bnez t6, .F.allocate._14.if.then.4
  j .F.allocate._18.if.else.4                                           # ir inst 46 fin
.F.allocate._14.if.then.4:
  mv t6, t5                                                             # ir inst 47 fin
  addi t3, t6, 1                                                        # ir inst 48 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 49 fin
  sw a1, 0(t6)                                                          # ir inst 50 fin
  mv t6, t5                                                             # ir inst 51 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 52 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 53 fin
  add t6, t5, a1                                                        # ir inst 54 fin
  addi t3, t6, 4                                                        # ir inst 55 fin
  mv t6, t3                                                             # ir inst 56 fin
  slli t2, t6, 2
  add s11, a0, t2                                                       # ir inst 57 fin
  li t1, 1
  sw t1, 0(s11)                                                         # ir inst 58 fin
  mv t6, t3                                                             # ir inst 59 fin
  addi s11, t6, 1                                                       # ir inst 60 fin
  slli t2, s11, 2
  add t6, a0, t2                                                        # ir inst 61 fin
  sw t4, 0(t6)                                                          # ir inst 62 fin
  mv t6, t3                                                             # ir inst 63 fin
  addi t4, t6, 2                                                        # ir inst 64 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 65 fin
  sw t5, 0(t6)                                                          # ir inst 66 fin
  mv t6, t3                                                             # ir inst 67 fin
  addi t4, t6, 3                                                        # ir inst 68 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 69 fin
  mv t4, t5                                                             # ir inst 70 fin
  addi s11, t4, 3                                                       # ir inst 71 fin
  slli t2, s11, 2
  add t4, a0, t2                                                        # ir inst 72 fin
  lw s11, 0(t4)                                                         # ir inst 73 fin
  sw s11, 0(t6)                                                         # ir inst 74 fin
  mv t6, t5                                                             # ir inst 75 fin
  addi t4, t6, 3                                                        # ir inst 76 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 77 fin
  lw t4, 0(t6)                                                          # ir inst 78 fin
  li t2, -1
  xor t0, t4, t2
  sltu t6, zero, t0                                                     # ir inst 79 fin
  bnez t6, .F.allocate._15.if.then.5
  j .F.allocate._16.if.else.5                                           # ir inst 80 fin
.F.allocate._15.if.then.5:
  mv t6, t4                                                             # ir inst 81 fin
  addi t4, t6, 2                                                        # ir inst 82 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 83 fin
  sw t3, 0(t6)                                                          # ir inst 84 fin
  j .F.allocate._17.if.exit.5                                           # ir inst 85 fin
.F.allocate._16.if.else.5:
  j .F.allocate._17.if.exit.5                                           # ir inst 86 fin
.F.allocate._17.if.exit.5:
  mv t6, t5                                                             # ir inst 87 fin
  addi t4, t6, 3                                                        # ir inst 88 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 89 fin
  sw t3, 0(t6)                                                          # ir inst 90 fin
  j .F.allocate._19.if.exit.4                                           # ir inst 91 fin
.F.allocate._18.if.else.4:
  mv t6, t5                                                             # ir inst 92 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 93 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 94 fin
  j .F.allocate._19.if.exit.4                                           # ir inst 95 fin
.F.allocate._19.if.exit.4:
  addi t6, t5, 4                                                        # ir inst 96 fin
  mv a0, t6
  j .F.allocate.epilogue                                                # ir inst 97 fin
.F.allocate._20.if.else.3:
  j .F.allocate._21.if.exit.3                                           # ir inst 98 fin
.F.allocate._21.if.exit.3:
  li a0, -1
  j .F.allocate.epilogue                                                # ir inst 99 fin
.F.allocate.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.deallocate
.F.deallocate:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.deallocate._0.entry.0:
  li t2, 4
  slt t6, a1, t2                                                        # ir inst 1 fin
  bnez t6, .F.deallocate._1.if.then.0
  j .F.deallocate._2.if.else.0                                          # ir inst 2 fin
.F.deallocate._1.if.then.0:
  j .F.deallocate.epilogue                                              # ir inst 3 fin
.F.deallocate._2.if.else.0:
  j .F.deallocate._3.if.exit.0                                          # ir inst 4 fin
.F.deallocate._3.if.exit.0:
  addi t6, a1, -4                                                       # ir inst 5 fin
  mv t5, t6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 8 fin
  mv t5, t6                                                             # ir inst 9 fin
  addi t4, t5, 3                                                        # ir inst 10 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 11 fin
  lw t4, 0(t5)                                                          # ir inst 12 fin
  li t2, -1
  xor t0, t4, t2
  sltu t5, zero, t0                                                     # ir inst 13 fin
  bnez t5, .F.deallocate._4.if.then.1
  j .F.deallocate._11.if.else.1                                         # ir inst 14 fin
.F.deallocate._4.if.then.1:
  mv t5, t4                                                             # ir inst 15 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 16 fin
  lw t5, 0(t3)                                                          # ir inst 17 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 18 fin
  bnez t3, .F.deallocate._5.if.then.2
  j .F.deallocate._9.if.else.2                                          # ir inst 19 fin
.F.deallocate._5.if.then.2:
  mv t5, t4                                                             # ir inst 20 fin
  addi t3, t5, 1                                                        # ir inst 21 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 22 fin
  lw t3, 0(t5)                                                          # ir inst 23 fin
  mv t5, t6                                                             # ir inst 24 fin
  addi s11, t5, 1                                                       # ir inst 25 fin
  slli t2, s11, 2
  add t5, a0, t2                                                        # ir inst 26 fin
  mv s11, t6                                                            # ir inst 27 fin
  addi s10, s11, 1                                                      # ir inst 28 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 29 fin
  lw s10, 0(s11)                                                        # ir inst 30 fin
  add s11, s10, t3                                                      # ir inst 31 fin
  addi t3, s11, 4                                                       # ir inst 32 fin
  sw t3, 0(t5)                                                          # ir inst 33 fin
  mv t5, t4                                                             # ir inst 34 fin
  addi t4, t5, 3                                                        # ir inst 35 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 36 fin
  lw t4, 0(t5)                                                          # ir inst 37 fin
  mv t5, t6                                                             # ir inst 38 fin
  addi t3, t5, 3                                                        # ir inst 39 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 40 fin
  sw t4, 0(t5)                                                          # ir inst 41 fin
  li t2, -1
  xor t0, t4, t2
  sltu t5, zero, t0                                                     # ir inst 42 fin
  bnez t5, .F.deallocate._6.if.then.3
  j .F.deallocate._7.if.else.3                                          # ir inst 43 fin
.F.deallocate._6.if.then.3:
  mv t5, t4                                                             # ir inst 44 fin
  addi t4, t5, 2                                                        # ir inst 45 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 46 fin
  sw t6, 0(t5)                                                          # ir inst 47 fin
  j .F.deallocate._8.if.exit.3                                          # ir inst 48 fin
.F.deallocate._7.if.else.3:
  j .F.deallocate._8.if.exit.3                                          # ir inst 49 fin
.F.deallocate._8.if.exit.3:
  j .F.deallocate._10.if.exit.2                                         # ir inst 50 fin
.F.deallocate._9.if.else.2:
  j .F.deallocate._10.if.exit.2                                         # ir inst 51 fin
.F.deallocate._10.if.exit.2:
  j .F.deallocate._12.if.exit.1                                         # ir inst 52 fin
.F.deallocate._11.if.else.1:
  j .F.deallocate._12.if.exit.1                                         # ir inst 53 fin
.F.deallocate._12.if.exit.1:
  mv t5, t6                                                             # ir inst 54 fin
  addi t4, t5, 2                                                        # ir inst 55 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 56 fin
  lw t4, 0(t5)                                                          # ir inst 57 fin
  li t2, -1
  xor t0, t4, t2
  sltu t5, zero, t0                                                     # ir inst 58 fin
  bnez t5, .F.deallocate._13.if.then.4
  j .F.deallocate._20.if.else.4                                         # ir inst 59 fin
.F.deallocate._13.if.then.4:
  mv t5, t4                                                             # ir inst 60 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 61 fin
  lw t5, 0(t3)                                                          # ir inst 62 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 63 fin
  bnez t3, .F.deallocate._14.if.then.5
  j .F.deallocate._18.if.else.5                                         # ir inst 64 fin
.F.deallocate._14.if.then.5:
  mv t5, t6                                                             # ir inst 65 fin
  addi t3, t5, 1                                                        # ir inst 66 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 67 fin
  lw t3, 0(t5)                                                          # ir inst 68 fin
  mv t5, t4                                                             # ir inst 69 fin
  addi s11, t5, 1                                                       # ir inst 70 fin
  slli t2, s11, 2
  add t5, a0, t2                                                        # ir inst 71 fin
  mv s11, t4                                                            # ir inst 72 fin
  addi s10, s11, 1                                                      # ir inst 73 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 74 fin
  lw s10, 0(s11)                                                        # ir inst 75 fin
  add s11, s10, t3                                                      # ir inst 76 fin
  addi t3, s11, 4                                                       # ir inst 77 fin
  sw t3, 0(t5)                                                          # ir inst 78 fin
  mv t5, t6                                                             # ir inst 79 fin
  addi t6, t5, 3                                                        # ir inst 80 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 81 fin
  lw t6, 0(t5)                                                          # ir inst 82 fin
  mv t5, t4                                                             # ir inst 83 fin
  addi t3, t5, 3                                                        # ir inst 84 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 85 fin
  sw t6, 0(t5)                                                          # ir inst 86 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 87 fin
  bnez t5, .F.deallocate._15.if.then.6
  j .F.deallocate._16.if.else.6                                         # ir inst 88 fin
.F.deallocate._15.if.then.6:
  mv t5, t6                                                             # ir inst 89 fin
  addi t6, t5, 2                                                        # ir inst 90 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 91 fin
  sw t4, 0(t5)                                                          # ir inst 92 fin
  j .F.deallocate._17.if.exit.6                                         # ir inst 93 fin
.F.deallocate._16.if.else.6:
  j .F.deallocate._17.if.exit.6                                         # ir inst 94 fin
.F.deallocate._17.if.exit.6:
  j .F.deallocate._19.if.exit.5                                         # ir inst 95 fin
.F.deallocate._18.if.else.5:
  j .F.deallocate._19.if.exit.5                                         # ir inst 96 fin
.F.deallocate._19.if.exit.5:
  j .F.deallocate._21.if.exit.4                                         # ir inst 97 fin
.F.deallocate._20.if.else.4:
  j .F.deallocate._21.if.exit.4                                         # ir inst 98 fin
.F.deallocate._21.if.exit.4:
  j .F.deallocate.epilogue                                              # ir inst 99 fin
.F.deallocate.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.print_memory_state
.F.print_memory_state:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 4 / 12,        range:       24(sp) -       56(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 24(sp)
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s8, 48(sp)
  sd ra, 56(sp)
.F.print_memory_state._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.print_memory_state._1.while.cond.0                               # ir inst 1 fin
.F.print_memory_state._1.while.cond.0:
  li t2, -1
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 6 fin
  bnez s11, .F.print_memory_state._2.while.body.0
  j .F.print_memory_state._6.while.exit.0                               # ir inst 7 fin
.F.print_memory_state._2.while.body.0:
  mv s11, t3                                                            # ir inst 8 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 9 fin
  lw s11, 0(s10)                                                        # ir inst 10 fin
  mv s10, t3                                                            # ir inst 11 fin
  addi s9, s10, 1                                                       # ir inst 12 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 13 fin
  lw s9, 0(s10)                                                         # ir inst 14 fin
  li t2, 1
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 15 fin
  bnez s10, .F.print_memory_state._3.if.then.0
  j .F.print_memory_state._4.if.else.0                                  # ir inst 16 fin
.F.print_memory_state._3.if.then.0:
  add s11, t4, s9                                                       # ir inst 17 fin
  addi s10, t6, 1                                                       # ir inst 18 fin
# Phi connections
  mv s9, s11
  mv s11, s10
  mv s10, t5
  j .F.print_memory_state._5.if.exit.0                                  # ir inst 19 fin
.F.print_memory_state._4.if.else.0:
  add s11, t5, s9                                                       # ir inst 20 fin
# Phi connections
  mv s9, t4
  mv s10, s11
  mv s11, t6
  j .F.print_memory_state._5.if.exit.0                                  # ir inst 21 fin
.F.print_memory_state._5.if.exit.0:
  mv s8, t3                                                             # ir inst 25 fin
  addi t3, s8, 3                                                        # ir inst 26 fin
  slli t2, t3, 2
  add s8, a0, t2                                                        # ir inst 27 fin
  lw t3, 0(s8)                                                          # ir inst 28 fin
# Phi connections
  mv t4, s9
  mv t5, s10
  mv t6, s11
  j .F.print_memory_state._1.while.cond.0                               # ir inst 29 fin
.F.print_memory_state._6.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 30 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 31 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 32 fin
  j .F.print_memory_state.epilogue                                      # ir inst 33 fin
.F.print_memory_state.epilogue:
  ld ra, 56(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s8, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.deep_recursive_check
.F.deep_recursive_check:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.deep_recursive_check._0.entry.0:
  li t2, 0
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.deep_recursive_check._1.if.then.0
  j .F.deep_recursive_check._2.if.else.0                                # ir inst 2 fin
.F.deep_recursive_check._1.if.then.0:
  li a0, 1
  j .F.deep_recursive_check.epilogue                                    # ir inst 3 fin
.F.deep_recursive_check._2.if.else.0:
  j .F.deep_recursive_check._3.if.exit.0                                # ir inst 4 fin
.F.deep_recursive_check._3.if.exit.0:
  li t2, -1
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.deep_recursive_check._4.if.then.1
  j .F.deep_recursive_check._5.if.else.1                                # ir inst 6 fin
.F.deep_recursive_check._4.if.then.1:
  li a0, 0
  j .F.deep_recursive_check.epilogue                                    # ir inst 7 fin
.F.deep_recursive_check._5.if.else.1:
  j .F.deep_recursive_check._6.if.exit.1                                # ir inst 8 fin
.F.deep_recursive_check._6.if.exit.1:
  mv t6, a2                                                             # ir inst 9 fin
  addi t5, t6, 1                                                        # ir inst 10 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 11 fin
  lw t5, 0(t6)                                                          # ir inst 12 fin
  li t2, 100
  slt t6, t2, t5                                                        # ir inst 13 fin
  bnez t6, .F.deep_recursive_check._7.if.then.2
  j .F.deep_recursive_check._8.if.else.2                                # ir inst 14 fin
.F.deep_recursive_check._7.if.then.2:
  addi t6, a1, -1                                                       # ir inst 15 fin
  mv t5, a2                                                             # ir inst 16 fin
  addi t4, t5, 3                                                        # ir inst 17 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  mv a2, t4
  mv a1, t6
  call .F.deep_recursive_check
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.deep_recursive_check._9.if.exit.2                                # ir inst 21 fin
.F.deep_recursive_check._8.if.else.2:
  addi t6, a1, -1                                                       # ir inst 22 fin
  mv t5, a2                                                             # ir inst 23 fin
  addi t4, t5, 2                                                        # ir inst 24 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 25 fin
  lw t4, 0(t5)                                                          # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  mv a1, t6
  call .F.deep_recursive_check
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 27 fin
# Phi connections
  mv t6, t5
  j .F.deep_recursive_check._9.if.exit.2                                # ir inst 28 fin
.F.deep_recursive_check._9.if.exit.2:
  mv a0, t6
  j .F.deep_recursive_check.epilogue                                    # ir inst 30 fin
.F.deep_recursive_check.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.another_utility_function
.F.another_utility_function:
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
.F.another_utility_function._0.entry.0:
# Phi connections
  mv t5, a1
  li t6, 0
  j .F.another_utility_function._1.while.cond.0                         # ir inst 1 fin
.F.another_utility_function._1.while.cond.0:
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 4 fin
  bnez t4, .F.another_utility_function._2.while.body.0
  j .F.another_utility_function._9.while.exit.0                         # ir inst 5 fin
.F.another_utility_function._2.while.body.0:
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.another_utility_function._3.if.then.0
  j .F.another_utility_function._7.if.else.0                            # ir inst 10 fin
.F.another_utility_function._3.if.then.0:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F.another_utility_function._4.while.cond.1                         # ir inst 11 fin
.F.another_utility_function._4.while.cond.1:
  mv s11, t5                                                            # ir inst 14 fin
  addi s10, s11, 1                                                      # ir inst 15 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 16 fin
  lw s10, 0(s11)                                                        # ir inst 17 fin
  slt s11, t4, s10                                                      # ir inst 18 fin
  bnez s11, .F.another_utility_function._5.while.body.1
  j .F.another_utility_function._6.while.exit.1                         # ir inst 19 fin
.F.another_utility_function._5.while.body.1:
  addi s11, t5, 4                                                       # ir inst 20 fin
  add s10, s11, t4                                                      # ir inst 21 fin
  mv s11, s10                                                           # ir inst 22 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 23 fin
  lw s11, 0(s10)                                                        # ir inst 24 fin
  li t2, 3
  rem s10, t4, t2                                                       # ir inst 25 fin
  addi s9, s10, -1                                                      # ir inst 26 fin
  mul s10, s11, s9                                                      # ir inst 27 fin
  add s11, t3, s10                                                      # ir inst 28 fin
  addi s10, t4, 1                                                       # ir inst 29 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j .F.another_utility_function._4.while.cond.1                         # ir inst 30 fin
.F.another_utility_function._6.while.exit.1:
# Phi connections
  mv t4, t3
  j .F.another_utility_function._8.if.exit.0                            # ir inst 31 fin
.F.another_utility_function._7.if.else.0:
# Phi connections
  mv t4, t6
  j .F.another_utility_function._8.if.exit.0                            # ir inst 32 fin
.F.another_utility_function._8.if.exit.0:
  mv t3, t5                                                             # ir inst 34 fin
  addi t5, t3, 3                                                        # ir inst 35 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 36 fin
  lw t5, 0(t3)                                                          # ir inst 37 fin
# Phi connections
  mv t6, t4
  j .F.another_utility_function._1.while.cond.0                         # ir inst 38 fin
.F.another_utility_function._9.while.exit.0:
  mv a0, t6
  j .F.another_utility_function.epilogue                                # ir inst 39 fin
.F.another_utility_function.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.complex_memory_scan
.F.complex_memory_scan:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.complex_memory_scan._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.complex_memory_scan._1.while.cond.0                              # ir inst 1 fin
.F.complex_memory_scan._1.while.cond.0:
  li t2, 5
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.complex_memory_scan._2.while.body.0
  j .F.complex_memory_scan._3.while.exit.0                              # ir inst 5 fin
.F.complex_memory_scan._2.while.body.0:
  li t2, 10
  mul t4, t6, t2                                                        # ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F.another_utility_function
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 7 fin
  add t4, t5, t3                                                        # ir inst 8 fin
  addi t3, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.complex_memory_scan._1.while.cond.0                              # ir inst 10 fin
.F.complex_memory_scan._3.while.exit.0:
  mv a0, t5
  j .F.complex_memory_scan.epilogue                                     # ir inst 11 fin
.F.complex_memory_scan.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret
