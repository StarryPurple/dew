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

.globl .F.init_allocator
.F.init_allocator:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_allocator._0.entry.0:
  lb t6, 0(a1)                                                          # ir inst 1 fin
  bnez t6, .F.init_allocator._1.if.then.0
  j .F.init_allocator._2.if.else.0                                      # ir inst 2 fin
.F.init_allocator._1.if.then.0:
  j .F.init_allocator.epilogue                                          # ir inst 3 fin
.F.init_allocator._2.if.else.0:
  j .F.init_allocator._3.if.exit.0                                      # ir inst 4 fin
.F.init_allocator._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  li t1, 2046
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 4                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 8                                                        # ir inst 9 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 10 fin
  li t1, 1
  sb t1, 0(a1)                                                          # ir inst 11 fin
  j .F.init_allocator.epilogue                                          # ir inst 12 fin
.F.init_allocator.epilogue:
  ret

.globl .F.custom_alloc
.F.custom_alloc:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.custom_alloc._0.entry.0:
  li t2, 0
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.custom_alloc._1.if.then.0
  j .F.custom_alloc._2.if.else.0                                        # ir inst 2 fin
.F.custom_alloc._1.if.then.0:
  li a0, -1
  j .F.custom_alloc.epilogue                                            # ir inst 3 fin
.F.custom_alloc._2.if.else.0:
  j .F.custom_alloc._3.if.exit.0                                        # ir inst 4 fin
.F.custom_alloc._3.if.exit.0:
# Phi connections
  li t4, -1
  li t5, 0
  li t6, 2049
  j .F.custom_alloc._4.while.cond.0                                     # ir inst 5 fin
.F.custom_alloc._4.while.cond.0:
  li t2, 2048
  slt t3, t5, t2                                                        # ir inst 9 fin
  bnez t3, .F.custom_alloc._5.while.body.0
  j .F.custom_alloc._25.critical_edge.0                                 # ir inst 10 fin
.F.custom_alloc._5.while.body.0:
  mv t3, t5                                                             # ir inst 11 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
  mv s11, t5                                                            # ir inst 14 fin
  addi s10, s11, 1                                                      # ir inst 15 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 16 fin
  lw s10, 0(s11)                                                        # ir inst 17 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s11, t0, 1                                                      # ir inst 18 fin
  bnez s11, .F.custom_alloc._6.if.then.1
  j .F.custom_alloc._13.if.else.1                                       # ir inst 19 fin
.F.custom_alloc._6.if.then.1:
  slt t0, t3, a1
  xori s11, t0, 1                                                       # ir inst 20 fin
  bnez s11, .F.custom_alloc._7.if.then.2
  j .F.custom_alloc._11.if.else.2                                       # ir inst 21 fin
.F.custom_alloc._7.if.then.2:
  slt s11, t3, t6                                                       # ir inst 22 fin
  bnez s11, .F.custom_alloc._8.if.then.3
  j .F.custom_alloc._9.if.else.3                                        # ir inst 23 fin
.F.custom_alloc._8.if.then.3:
# Phi connections
  mv s10, t5
  mv s11, t3
  j .F.custom_alloc._10.if.exit.3                                       # ir inst 24 fin
.F.custom_alloc._9.if.else.3:
# Phi connections
  mv s10, t4
  mv s11, t6
  j .F.custom_alloc._10.if.exit.3                                       # ir inst 25 fin
.F.custom_alloc._10.if.exit.3:
# Phi connections
  j .F.custom_alloc._12.if.exit.2                                       # ir inst 28 fin
.F.custom_alloc._11.if.else.2:
# Phi connections
  mv s10, t4
  mv s11, t6
  j .F.custom_alloc._12.if.exit.2                                       # ir inst 29 fin
.F.custom_alloc._12.if.exit.2:
# Phi connections
  mv t6, s11
  mv s11, s10
  j .F.custom_alloc._14.if.exit.1                                       # ir inst 32 fin
.F.custom_alloc._13.if.else.1:
# Phi connections
  mv s11, t4
  j .F.custom_alloc._14.if.exit.1                                       # ir inst 33 fin
.F.custom_alloc._14.if.exit.1:
  li t2, 0
  slt t0, t2, t3
  xori s10, t0, 1                                                       # ir inst 36 fin
  bnez s10, .F.custom_alloc._15.if.then.4
  j .F.custom_alloc._16.if.else.4                                       # ir inst 37 fin
.F.custom_alloc._15.if.then.4:
# Phi connections
  mv t6, s11
  j .F.custom_alloc._18.while.exit.0                                    # ir inst 38 fin
.F.custom_alloc._16.if.else.4:
  j .F.custom_alloc._17.if.exit.4                                       # ir inst 39 fin
.F.custom_alloc._17.if.exit.4:
  add s10, t5, t3                                                       # ir inst 40 fin
  addi t5, s10, 2                                                       # ir inst 41 fin
# Phi connections
  mv t4, s11
  j .F.custom_alloc._4.while.cond.0                                     # ir inst 42 fin
.F.custom_alloc._18.while.exit.0:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 44 fin
  bnez t5, .F.custom_alloc._19.if.then.5
  j .F.custom_alloc._23.if.else.5                                       # ir inst 45 fin
.F.custom_alloc._19.if.then.5:
  mv t5, t6                                                             # ir inst 46 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 47 fin
  lw t5, 0(t3)                                                          # ir inst 48 fin
  sub t3, t5, a1                                                        # ir inst 49 fin
  addi t5, t3, -2                                                       # ir inst 50 fin
  li t2, 2
  slt t3, t2, t5                                                        # ir inst 51 fin
  bnez t3, .F.custom_alloc._20.if.then.6
  j .F.custom_alloc._21.if.else.6                                       # ir inst 52 fin
.F.custom_alloc._20.if.then.6:
  mv t3, t6                                                             # ir inst 53 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 54 fin
  sw a1, 0(s11)                                                         # ir inst 55 fin
  mv t3, t6                                                             # ir inst 56 fin
  addi s11, t3, 1                                                       # ir inst 57 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 58 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 59 fin
  add t3, t6, a1                                                        # ir inst 60 fin
  addi s11, t3, 2                                                       # ir inst 61 fin
  mv t3, s11                                                            # ir inst 62 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 63 fin
  sw t5, 0(s10)                                                         # ir inst 64 fin
  mv t5, s11                                                            # ir inst 65 fin
  addi t3, t5, 1                                                        # ir inst 66 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 67 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 68 fin
  j .F.custom_alloc._22.if.exit.6                                       # ir inst 69 fin
.F.custom_alloc._21.if.else.6:
  mv t5, t6                                                             # ir inst 70 fin
  addi t3, t5, 1                                                        # ir inst 71 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 72 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 73 fin
  j .F.custom_alloc._22.if.exit.6                                       # ir inst 74 fin
.F.custom_alloc._22.if.exit.6:
  addi t5, t6, 2                                                        # ir inst 75 fin
  mv a0, t5
  j .F.custom_alloc.epilogue                                            # ir inst 76 fin
.F.custom_alloc._23.if.else.5:
  j .F.custom_alloc._24.if.exit.5                                       # ir inst 77 fin
.F.custom_alloc._24.if.exit.5:
  li a0, -1
  j .F.custom_alloc.epilogue                                            # ir inst 78 fin
.F.custom_alloc._25.critical_edge.0:
# Phi connections
  mv t6, t4
  j .F.custom_alloc._18.while.exit.0                                    # ir inst 79 fin
.F.custom_alloc.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.custom_free
.F.custom_free:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.custom_free._0.entry.0:
  li t2, 2
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.custom_free._1.if.then.0
  j .F.custom_free._2.if.else.0                                         # ir inst 2 fin
.F.custom_free._1.if.then.0:
  j .F.custom_free.epilogue                                             # ir inst 3 fin
.F.custom_free._2.if.else.0:
  j .F.custom_free._3.if.exit.0                                         # ir inst 4 fin
.F.custom_free._3.if.exit.0:
  addi t6, a1, -2                                                       # ir inst 5 fin
  mv t5, t6                                                             # ir inst 6 fin
  addi t6, t5, 1                                                        # ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 9 fin
# Phi connections
  li t6, 0
  j .F.custom_free._4.while.cond.0                                      # ir inst 10 fin
.F.custom_free._4.while.cond.0:
  li t2, 2048
  slt t5, t6, t2                                                        # ir inst 12 fin
  bnez t5, .F.custom_free._5.while.body.0
  j .F.custom_free._19.critical_edge.0                                  # ir inst 13 fin
.F.custom_free._5.while.body.0:
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 15 fin
  lw t5, 0(t4)                                                          # ir inst 16 fin
  li t2, 0
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 17 fin
  bnez t4, .F.custom_free._6.if.then.1
  j .F.custom_free._7.if.else.1                                         # ir inst 18 fin
.F.custom_free._6.if.then.1:
  j .F.custom_free._18.while.exit.0                                     # ir inst 19 fin
.F.custom_free._7.if.else.1:
  j .F.custom_free._8.if.exit.1                                         # ir inst 20 fin
.F.custom_free._8.if.exit.1:
  add t4, t6, t5                                                        # ir inst 21 fin
  addi t3, t4, 2                                                        # ir inst 22 fin
  li t2, 2048
  slt t4, t3, t2                                                        # ir inst 23 fin
  bnez t4, .F.custom_free._9.if.then.2
  j .F.custom_free._16.if.else.2                                        # ir inst 24 fin
.F.custom_free._9.if.then.2:
  mv t4, t6                                                             # ir inst 25 fin
  addi s11, t4, 1                                                       # ir inst 26 fin
  slli t2, s11, 2
  add t4, a0, t2                                                        # ir inst 27 fin
  lw s11, 0(t4)                                                         # ir inst 28 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 29 fin
  bnez t4, .F.custom_free._10.if.then.3
  j .F.custom_free._14.if.else.3                                        # ir inst 30 fin
.F.custom_free._10.if.then.3:
  mv t4, t3                                                             # ir inst 31 fin
  addi s11, t4, 1                                                       # ir inst 32 fin
  slli t2, s11, 2
  add t4, a0, t2                                                        # ir inst 33 fin
  lw s11, 0(t4)                                                         # ir inst 34 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 35 fin
  bnez t4, .F.custom_free._11.if.then.4
  j .F.custom_free._12.if.else.4                                        # ir inst 36 fin
.F.custom_free._11.if.then.4:
  mv t4, t3                                                             # ir inst 37 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 38 fin
  lw t4, 0(s11)                                                         # ir inst 39 fin
  mv s11, t6                                                            # ir inst 40 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 41 fin
  add s11, t5, t4                                                       # ir inst 42 fin
  addi t5, s11, 2                                                       # ir inst 43 fin
  sw t5, 0(s10)                                                         # ir inst 44 fin
# Phi connections
  j .F.custom_free._4.while.cond.0                                      # ir inst 45 fin
.F.custom_free._12.if.else.4:
  j .F.custom_free._13.if.exit.4                                        # ir inst 46 fin
.F.custom_free._13.if.exit.4:
  j .F.custom_free._15.if.exit.3                                        # ir inst 47 fin
.F.custom_free._14.if.else.3:
  j .F.custom_free._15.if.exit.3                                        # ir inst 48 fin
.F.custom_free._15.if.exit.3:
  j .F.custom_free._17.if.exit.2                                        # ir inst 49 fin
.F.custom_free._16.if.else.2:
  j .F.custom_free._17.if.exit.2                                        # ir inst 50 fin
.F.custom_free._17.if.exit.2:
# Phi connections
  mv t6, t3
  j .F.custom_free._4.while.cond.0                                      # ir inst 51 fin
.F.custom_free._18.while.exit.0:
  j .F.custom_free.epilogue                                             # ir inst 52 fin
.F.custom_free._19.critical_edge.0:
  j .F.custom_free._18.while.exit.0                                     # ir inst 53 fin
.F.custom_free.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl main
main:
# spill func args num: 0,             range:     8704(sp) -     8704(sp)
# local var size: 8596,               range:      104(sp) -     8700(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 8 / 12,        range:       32(sp) -       96(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8704
  add sp, sp, t0
  sd s5, 32(sp)
  sd s0, 40(sp)
  sd s11, 48(sp)
  sd s8, 56(sp)
  sd s7, 64(sp)
  sd s6, 72(sp)
  sd s9, 80(sp)
  sd s10, 88(sp)
  sd ra, 96(sp)
main._0.entry.0:
  addi t1, sp, 104
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 2048
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
# alloca %6
  li t2, 8296
  add t2, sp, t2
  li t1, 0
  sb t1, 0(t2)                                                          # ir inst 12 fin
# Start call preparation
  li t1, 8296
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 104
  mv a0, t1
  call .F.init_allocator
# ir inst 13 fin
  li t1, 8300
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 16 fin
main._4.array.cond.1:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 18 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 19 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 20 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 21 fin
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 23 fin
main._6.array.exit.1:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j main._7.while.cond.0                                                # ir inst 24 fin
main._7.while.cond.0:
  li t2, 200
  slt s11, t4, t2                                                       # ir inst 29 fin
  bnez s11, main._8.while.body.0
  j main._54.while.exit.0                                               # ir inst 30 fin
main._8.while.body.0:
  li t2, 10
  rem s11, t4, t2                                                       # ir inst 31 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 32 fin
  bnez s10, main._9.if.then.0
  j main._10.if.else.0                                                  # ir inst 33 fin
main._9.if.then.0:
# Phi connections
  li s11, 10
  j main._35.if.exit.0                                                  # ir inst 34 fin
main._10.if.else.0:
  li t2, 1
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 35 fin
  bnez s10, main._11.if.then.1
  j main._12.if.else.1                                                  # ir inst 36 fin
main._11.if.then.1:
# Phi connections
  li s11, 50
  j main._34.if.exit.1                                                  # ir inst 37 fin
main._12.if.else.1:
  li t2, 2
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 38 fin
  bnez s10, main._13.if.then.2
  j main._14.if.else.2                                                  # ir inst 39 fin
main._13.if.then.2:
# Phi connections
  li s11, 25
  j main._33.if.exit.2                                                  # ir inst 40 fin
main._14.if.else.2:
  li t2, 3
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 41 fin
  bnez s10, main._15.if.then.3
  j main._16.if.else.3                                                  # ir inst 42 fin
main._15.if.then.3:
# Phi connections
  li s11, 120
  j main._32.if.exit.3                                                  # ir inst 43 fin
main._16.if.else.3:
  li t2, 4
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 44 fin
  bnez s10, main._17.if.then.4
  j main._18.if.else.4                                                  # ir inst 45 fin
main._17.if.then.4:
# Phi connections
  li s11, 5
  j main._31.if.exit.4                                                  # ir inst 46 fin
main._18.if.else.4:
  li t2, 5
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 47 fin
  bnez s10, main._19.if.then.5
  j main._20.if.else.5                                                  # ir inst 48 fin
main._19.if.then.5:
# Phi connections
  li s11, 80
  j main._30.if.exit.5                                                  # ir inst 49 fin
main._20.if.else.5:
  li t2, 6
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 50 fin
  bnez s10, main._21.if.then.6
  j main._22.if.else.6                                                  # ir inst 51 fin
main._21.if.then.6:
# Phi connections
  li s11, 200
  j main._29.if.exit.6                                                  # ir inst 52 fin
main._22.if.else.6:
  li t2, 7
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 53 fin
  bnez s10, main._23.if.then.7
  j main._24.if.else.7                                                  # ir inst 54 fin
main._23.if.then.7:
# Phi connections
  li s11, 15
  j main._28.if.exit.7                                                  # ir inst 55 fin
main._24.if.else.7:
  li t2, 8
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 56 fin
  bnez s10, main._25.if.then.8
  j main._26.if.else.8                                                  # ir inst 57 fin
main._25.if.then.8:
# Phi connections
  li s11, 30
  j main._27.if.exit.8                                                  # ir inst 58 fin
main._26.if.else.8:
# Phi connections
  li s11, 60
  j main._27.if.exit.8                                                  # ir inst 59 fin
main._27.if.exit.8:
# Phi connections
  j main._28.if.exit.7                                                  # ir inst 61 fin
main._28.if.exit.7:
# Phi connections
  j main._29.if.exit.6                                                  # ir inst 63 fin
main._29.if.exit.6:
# Phi connections
  j main._30.if.exit.5                                                  # ir inst 65 fin
main._30.if.exit.5:
# Phi connections
  j main._31.if.exit.4                                                  # ir inst 67 fin
main._31.if.exit.4:
# Phi connections
  j main._32.if.exit.3                                                  # ir inst 69 fin
main._32.if.exit.3:
# Phi connections
  j main._33.if.exit.2                                                  # ir inst 71 fin
main._33.if.exit.2:
# Phi connections
  j main._34.if.exit.1                                                  # ir inst 73 fin
main._34.if.exit.1:
# Phi connections
  j main._35.if.exit.0                                                  # ir inst 75 fin
main._35.if.exit.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_alloc
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 77 fin
  li t2, -1
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 78 fin
  bnez s9, main._36.if.then.9
  j main._43.if.else.9                                                  # ir inst 79 fin
main._36.if.then.9:
  li t2, 100
  slt s9, t6, t2                                                        # ir inst 80 fin
  bnez s9, main._37.if.then.10
  j main._38.if.else.10                                                 # ir inst 81 fin
main._37.if.then.10:
  mv s9, t6                                                             # ir inst 82 fin
  slli t2, s9, 2
  li t1, 8300
  add t1, sp, t1
  add s8, t1, t2                                                        # ir inst 83 fin
  sw s10, 0(s8)                                                         # ir inst 84 fin
  addi s9, t6, 1                                                        # ir inst 85 fin
# Phi connections
  j main._39.if.exit.10                                                 # ir inst 86 fin
main._38.if.else.10:
# Phi connections
  mv s9, t6
  j main._39.if.exit.10                                                 # ir inst 87 fin
main._39.if.exit.10:
  addi s8, t3, 1                                                        # ir inst 89 fin
# Phi connections
  li s7, 0
  j main._40.while.cond.1                                               # ir inst 90 fin
main._40.while.cond.1:
  slt s6, s7, s11                                                       # ir inst 92 fin
  bnez s6, main._41.while.body.1
  j main._42.while.exit.1                                               # ir inst 93 fin
main._41.while.body.1:
  add s6, s10, s7                                                       # ir inst 94 fin
  mv s5, s6                                                             # ir inst 95 fin
  slli t2, s5, 2
  addi t1, sp, 104
  add s6, t1, t2                                                        # ir inst 96 fin
  add s5, s10, s7                                                       # ir inst 97 fin
  li t2, 128
  rem s0, s5, t2                                                        # ir inst 98 fin
  sw s0, 0(s6)                                                          # ir inst 99 fin
  addi s6, s7, 1                                                        # ir inst 100 fin
# Phi connections
  mv s7, s6
  j main._40.while.cond.1                                               # ir inst 101 fin
main._42.while.exit.1:
# Phi connections
  mv s10, t5
  mv s11, s9
  mv s9, s8
  j main._44.if.exit.9                                                  # ir inst 102 fin
main._43.if.else.9:
  addi s11, t5, 1                                                       # ir inst 103 fin
# Phi connections
  mv s9, t3
  mv s10, s11
  mv s11, t6
  j main._44.if.exit.9                                                  # ir inst 104 fin
main._44.if.exit.9:
  li t2, 5
  rem s8, t4, t2                                                        # ir inst 108 fin
  li t2, 4
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 109 fin
  bnez s7, main._45.if.then.11
  j main._52.if.else.11                                                 # ir inst 110 fin
main._45.if.then.11:
  li t2, 0
  slt s8, t2, s11                                                       # ir inst 111 fin
  bnez s8, main._46.if.then.12
  j main._50.if.else.12                                                 # ir inst 112 fin
main._46.if.then.12:
  li t2, 17
  mul s8, t4, t2                                                        # ir inst 113 fin
  rem s7, s8, s11                                                       # ir inst 114 fin
  mv s8, s7                                                             # ir inst 115 fin
  slli t2, s8, 2
  li t1, 8300
  add t1, sp, t1
  add s6, t1, t2                                                        # ir inst 116 fin
  lw s8, 0(s6)                                                          # ir inst 117 fin
  li t2, 0
  xor t0, s8, t2
  sltu s6, zero, t0                                                     # ir inst 118 fin
  bnez s6, main._47.if.then.13
  j main._48.if.else.13                                                 # ir inst 119 fin
main._47.if.then.13:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s8
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_free
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 120 fin
  mv s8, s7                                                             # ir inst 121 fin
  slli t2, s8, 2
  li t1, 8300
  add t1, sp, t1
  add s7, t1, t2                                                        # ir inst 122 fin
  li t1, 0
  sw t1, 0(s7)                                                          # ir inst 123 fin
  j main._49.if.exit.13                                                 # ir inst 124 fin
main._48.if.else.13:
  j main._49.if.exit.13                                                 # ir inst 125 fin
main._49.if.exit.13:
  j main._51.if.exit.12                                                 # ir inst 126 fin
main._50.if.else.12:
  j main._51.if.exit.12                                                 # ir inst 127 fin
main._51.if.exit.12:
  j main._53.if.exit.11                                                 # ir inst 128 fin
main._52.if.else.11:
  j main._53.if.exit.11                                                 # ir inst 129 fin
main._53.if.exit.11:
  addi s8, t4, 1                                                        # ir inst 130 fin
# Phi connections
  mv t3, s9
  mv t4, s8
  mv t5, s10
  mv t6, s11
  j main._7.while.cond.0                                                # ir inst 131 fin
main._54.while.exit.0:
# Phi connections
  li s11, 0
  li t4, 0
  j main._55.while.cond.2                                               # ir inst 132 fin
main._55.while.cond.2:
  slt s10, t4, t6                                                       # ir inst 135 fin
  bnez s10, main._56.while.body.2
  j main._63.while.exit.2                                               # ir inst 136 fin
main._56.while.body.2:
  mv s10, t4                                                            # ir inst 137 fin
  slli t2, s10, 2
  li t1, 8300
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 138 fin
  lw s10, 0(s9)                                                         # ir inst 139 fin
  li t2, 0
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 140 fin
  bnez s9, main._57.if.then.14
  j main._61.if.else.14                                                 # ir inst 141 fin
main._57.if.then.14:
  addi s9, s10, -2                                                      # ir inst 142 fin
  mv s8, s9                                                             # ir inst 143 fin
  slli t2, s8, 2
  addi t1, sp, 104
  add s9, t1, t2                                                        # ir inst 144 fin
  lw s8, 0(s9)                                                          # ir inst 145 fin
# Phi connections
  mv s7, s11
  li s9, 0
  j main._58.while.cond.3                                               # ir inst 146 fin
main._58.while.cond.3:
  slt s6, s9, s8                                                        # ir inst 149 fin
  bnez s6, main._59.while.body.3
  j main._60.while.exit.3                                               # ir inst 150 fin
main._59.while.body.3:
  add s6, s10, s9                                                       # ir inst 151 fin
  mv s5, s6                                                             # ir inst 152 fin
  slli t2, s5, 2
  addi t1, sp, 104
  add s6, t1, t2                                                        # ir inst 153 fin
  lw s5, 0(s6)                                                          # ir inst 154 fin
  add s6, s7, s5                                                        # ir inst 155 fin
  addi s5, s9, 1                                                        # ir inst 156 fin
# Phi connections
  mv s7, s6
  mv s9, s5
  j main._58.while.cond.3                                               # ir inst 157 fin
main._60.while.exit.3:
# Phi connections
  mv s10, s7
  j main._62.if.exit.14                                                 # ir inst 158 fin
main._61.if.else.14:
# Phi connections
  mv s10, s11
  j main._62.if.exit.14                                                 # ir inst 159 fin
main._62.if.exit.14:
  addi s9, t4, 1                                                        # ir inst 161 fin
# Phi connections
  mv s11, s10
  mv t4, s9
  j main._55.while.cond.2                                               # ir inst 162 fin
main._63.while.exit.2:
# Phi connections
  li t4, 0
  li t6, 0
  j main._64.while.cond.4                                               # ir inst 163 fin
main._64.while.cond.4:
  li t2, 2048
  slt s10, t4, t2                                                       # ir inst 166 fin
  bnez s10, main._65.while.body.4
  j main._154.critical_edge.0                                           # ir inst 167 fin
main._65.while.body.4:
  mv s10, t4                                                            # ir inst 168 fin
  slli t2, s10, 2
  addi t1, sp, 104
  add s9, t1, t2                                                        # ir inst 169 fin
  lw s10, 0(s9)                                                         # ir inst 170 fin
  mv s9, t4                                                             # ir inst 171 fin
  addi s8, s9, 1                                                        # ir inst 172 fin
  slli t2, s8, 2
  addi t1, sp, 104
  add s9, t1, t2                                                        # ir inst 173 fin
  lw s8, 0(s9)                                                          # ir inst 174 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s9, t0, 1                                                       # ir inst 175 fin
  bnez s9, main._66.if.then.15
  j main._67.if.else.15                                                 # ir inst 176 fin
main._66.if.then.15:
  add s9, t6, s10                                                       # ir inst 177 fin
# Phi connections
  j main._68.if.exit.15                                                 # ir inst 178 fin
main._67.if.else.15:
# Phi connections
  mv s9, t6
  j main._68.if.exit.15                                                 # ir inst 179 fin
main._68.if.exit.15:
  li t2, 0
  slt t0, t2, s10
  xori s8, t0, 1                                                        # ir inst 181 fin
  bnez s8, main._69.if.then.16
  j main._70.if.else.16                                                 # ir inst 182 fin
main._69.if.then.16:
# Phi connections
  mv t4, s9
  j main._72.while.exit.4                                               # ir inst 183 fin
main._70.if.else.16:
  j main._71.if.exit.16                                                 # ir inst 184 fin
main._71.if.exit.16:
  add s8, t4, s10                                                       # ir inst 185 fin
  addi t4, s8, 2                                                        # ir inst 186 fin
# Phi connections
  mv t6, s9
  j main._64.while.cond.4                                               # ir inst 187 fin
main._72.while.exit.4:
  j main._73.if.then.17                                                 # ir inst 189 fin
main._73.if.then.17:
# Phi connections
  li s10, 1
  j main._74.while.cond.5                                               # ir inst 190 fin
main._74.while.cond.5:
  li t2, 5
  slt s9, s10, t2                                                       # ir inst 192 fin
  bnez s9, main._75.while.body.5
  j main._79.while.exit.5                                               # ir inst 193 fin
main._75.while.body.5:
# Phi connections
  li s9, 0
  j main._76.while.cond.6                                               # ir inst 194 fin
main._76.while.cond.6:
  slt s8, s9, s10                                                       # ir inst 196 fin
  bnez s8, main._77.while.body.6
  j main._78.while.exit.6                                               # ir inst 197 fin
main._77.while.body.6:
  addi s8, s9, 1                                                        # ir inst 198 fin
# Phi connections
  mv s9, s8
  j main._76.while.cond.6                                               # ir inst 199 fin
main._78.while.exit.6:
  addi s9, s10, 1                                                       # ir inst 200 fin
# Phi connections
  mv s10, s9
  j main._74.while.cond.5                                               # ir inst 201 fin
main._79.while.exit.5:
  j main._81.if.exit.17                                                 # ir inst 202 fin
main._80.if.else.17:
  j main._81.if.exit.17                                                 # ir inst 203 fin
main._81.if.exit.17:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 204 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t5
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 205 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, s11
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 206 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 207 fin
# Phi connections
  li t4, 0
  j main._82.while.cond.7                                               # ir inst 208 fin
main._82.while.cond.7:
  li t2, 100
  slt s10, t4, t2                                                       # ir inst 210 fin
  bnez s10, main._83.while.body.7
  j main._87.while.exit.7                                               # ir inst 211 fin
main._83.while.body.7:
  mv s10, t4                                                            # ir inst 212 fin
  slli t2, s10, 2
  li t1, 8300
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 213 fin
  lw s10, 0(s9)                                                         # ir inst 214 fin
  li t2, 0
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 215 fin
  bnez s9, main._84.if.then.18
  j main._85.if.else.18                                                 # ir inst 216 fin
main._84.if.then.18:
  mv s10, t4                                                            # ir inst 217 fin
  slli t2, s10, 2
  li t1, 8300
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 218 fin
  lw s10, 0(s9)                                                         # ir inst 219 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s10
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_free
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 220 fin
  j main._86.if.exit.18                                                 # ir inst 221 fin
main._85.if.else.18:
  j main._86.if.exit.18                                                 # ir inst 222 fin
main._86.if.exit.18:
  addi s10, t4, 1                                                       # ir inst 223 fin
# Phi connections
  mv t4, s10
  j main._82.while.cond.7                                               # ir inst 224 fin
main._87.while.exit.7:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a1, 1024
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_alloc
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 225 fin
  li t2, -1
  xor t0, t4, t2
  sltu s10, zero, t0                                                    # ir inst 226 fin
  bnez s10, main._88.if.then.19
  j main._89.if.else.19                                                 # ir inst 227 fin
main._88.if.then.19:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a0, 1
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 228 fin
  j main._90.if.exit.19                                                 # ir inst 229 fin
main._89.if.else.19:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a0, 0
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 230 fin
  j main._90.if.exit.19                                                 # ir inst 231 fin
main._90.if.exit.19:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a1, 1024
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_alloc
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 232 fin
  li t2, -1
  xor t0, s10, t2
  sltu s9, zero, t0                                                     # ir inst 233 fin
  bnez s9, main._91.if.then.20
  j main._92.if.else.20                                                 # ir inst 234 fin
main._91.if.then.20:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a0, 1
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 235 fin
  j main._93.if.exit.20                                                 # ir inst 236 fin
main._92.if.else.20:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a0, 0
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 237 fin
  j main._93.if.exit.20                                                 # ir inst 238 fin
main._93.if.exit.20:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_free
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 239 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a1, 2000
  addi t1, sp, 104
  mv a0, t1
  call .F.custom_alloc
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 240 fin
  li t2, -1
  xor t0, t4, t2
  sltu s10, zero, t0                                                    # ir inst 241 fin
  bnez s10, main._94.if.then.21
  j main._95.if.else.21                                                 # ir inst 242 fin
main._94.if.then.21:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 1
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 243 fin
  j main._96.if.exit.21                                                 # ir inst 244 fin
main._95.if.else.21:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 0
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 245 fin
  j main._96.if.exit.21                                                 # ir inst 246 fin
main._96.if.exit.21:
# Phi connections
  li s10, 0
  li t4, 0
  j main._97.while.cond.8                                               # ir inst 247 fin
main._97.while.cond.8:
  li t2, 2048
  slt s9, t4, t2                                                        # ir inst 250 fin
  bnez s9, main._98.while.body.8
  j main._99.while.exit.8                                               # ir inst 251 fin
main._98.while.body.8:
  mv s9, t4                                                             # ir inst 252 fin
  slli t2, s9, 2
  addi t1, sp, 104
  add s8, t1, t2                                                        # ir inst 253 fin
  lw s9, 0(s8)                                                          # ir inst 254 fin
  add s8, s10, s9                                                       # ir inst 255 fin
  addi s9, t4, 1                                                        # ir inst 256 fin
# Phi connections
  mv s10, s8
  mv t4, s9
  j main._97.while.cond.8                                               # ir inst 257 fin
main._99.while.exit.8:
  li t2, 1000
  rem t4, s10, t2                                                       # ir inst 258 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 259 fin
  j main._104.if.else.22                                                # ir inst 260 fin
main._100.if.then.22:
# Phi connections
  li s10, 0
  li t4, 0
  j main._101.while.cond.9                                              # ir inst 261 fin
main._101.while.cond.9:
  li t2, 1000
  slt s9, t4, t2                                                        # ir inst 264 fin
  bnez s9, main._102.while.body.9
  j main._103.while.exit.9                                              # ir inst 265 fin
main._102.while.body.9:
  add s9, s10, t4                                                       # ir inst 266 fin
  addi s8, t4, 1                                                        # ir inst 267 fin
# Phi connections
  mv s10, s9
  mv t4, s8
  j main._101.while.cond.9                                              # ir inst 268 fin
main._103.while.exit.9:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 269 fin
  j main._105.if.exit.22                                                # ir inst 270 fin
main._104.if.else.22:
  j main._105.if.exit.22                                                # ir inst 271 fin
main._105.if.exit.22:
# Phi connections
  li s10, 0
  li t4, 0
  j main._106.while.cond.10                                             # ir inst 272 fin
main._106.while.cond.10:
  li t2, 50
  slt s9, t4, t2                                                        # ir inst 275 fin
  bnez s9, main._107.while.body.10
  j main._114.while.exit.10                                             # ir inst 276 fin
main._107.while.body.10:
# Phi connections
  mv s8, s10
  li s9, 0
  j main._108.while.cond.11                                             # ir inst 277 fin
main._108.while.cond.11:
  li t2, 50
  slt s7, s9, t2                                                        # ir inst 280 fin
  bnez s7, main._109.while.body.11
  j main._113.while.exit.11                                             # ir inst 281 fin
main._109.while.body.11:
  mul s7, t4, s9                                                        # ir inst 282 fin
  li t2, 3
  rem s6, s7, t2                                                        # ir inst 283 fin
  li t2, 0
  xor t0, s6, t2
  sltiu s7, t0, 1                                                       # ir inst 284 fin
  bnez s7, main._110.if.then.23
  j main._111.if.else.23                                                # ir inst 285 fin
main._110.if.then.23:
  add s7, s8, t4                                                        # ir inst 286 fin
  sub s6, s7, s9                                                        # ir inst 287 fin
# Phi connections
  mv s7, s6
  j main._112.if.exit.23                                                # ir inst 288 fin
main._111.if.else.23:
  add s7, s8, s9                                                        # ir inst 289 fin
  sub s6, s7, t4                                                        # ir inst 290 fin
# Phi connections
  mv s7, s6
  j main._112.if.exit.23                                                # ir inst 291 fin
main._112.if.exit.23:
  addi s6, s9, 1                                                        # ir inst 293 fin
# Phi connections
  mv s8, s7
  mv s9, s6
  j main._108.while.cond.11                                             # ir inst 294 fin
main._113.while.exit.11:
  addi s9, t4, 1                                                        # ir inst 295 fin
# Phi connections
  mv s10, s8
  mv t4, s9
  j main._106.while.cond.10                                             # ir inst 296 fin
main._114.while.exit.10:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 297 fin
  li t1, 10
  li t2, 20
  slt t4, t1, t2                                                        # ir inst 298 fin
  bnez t4, main._115.if.then.24
  j main._116.if.else.24                                                # ir inst 299 fin
main._115.if.then.24:
# Phi connections
  li t4, 40
  j main._117.if.exit.24                                                # ir inst 300 fin
main._116.if.else.24:
# Phi connections
  li t4, 50
  j main._117.if.exit.24                                                # ir inst 301 fin
main._117.if.exit.24:
  j main._118.if.then.25                                                # ir inst 303 fin
main._118.if.then.25:
  j main._120.if.else.26                                                # ir inst 304 fin
main._119.if.then.26:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a0, 100
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 305 fin
  j main._121.if.exit.26                                                # ir inst 306 fin
main._120.if.else.26:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a0, 200
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 307 fin
  j main._121.if.exit.26                                                # ir inst 308 fin
main._121.if.exit.26:
  j main._123.if.exit.25                                                # ir inst 309 fin
main._122.if.else.25:
  j main._123.if.exit.25                                                # ir inst 310 fin
main._123.if.exit.25:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 311 fin
# Phi connections
  li t4, 1
  j main._124.while.cond.12                                             # ir inst 312 fin
main._124.while.cond.12:
  li t2, 3
  slt s10, t4, t2                                                       # ir inst 314 fin
  bnez s10, main._125.while.body.12
  j main._129.while.exit.12                                             # ir inst 315 fin
main._125.while.body.12:
  li t2, 1
  xor t0, t4, t2
  sltiu s10, t0, 1                                                      # ir inst 316 fin
  bnez s10, main._126.if.then.27
  j main._127.if.else.27                                                # ir inst 317 fin
main._126.if.then.27:
# Phi connections
  li s10, 110
  j main._128.if.exit.27                                                # ir inst 318 fin
main._127.if.else.27:
# Phi connections
  li s10, 10
  j main._128.if.exit.27                                                # ir inst 319 fin
main._128.if.exit.27:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 321 fin
  addi s10, t4, 1                                                       # ir inst 322 fin
# Phi connections
  mv t4, s10
  j main._124.while.cond.12                                             # ir inst 323 fin
main._129.while.exit.12:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 5
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 324 fin
# Phi connections
  li t4, 0
  j main._130.while.cond.13                                             # ir inst 325 fin
main._130.while.cond.13:
  li t2, 1
  slt s10, t4, t2                                                       # ir inst 327 fin
  bnez s10, main._131.while.body.13
  j main._135.while.exit.13                                             # ir inst 328 fin
main._131.while.body.13:
  j main._132.if.then.28                                                # ir inst 329 fin
main._132.if.then.28:
# Phi connections
  li s10, 456
  j main._134.if.exit.28                                                # ir inst 330 fin
main._133.if.else.28:
# Phi connections
  li s10, 123
  j main._134.if.exit.28                                                # ir inst 331 fin
main._134.if.exit.28:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, s10
  call printlnInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 333 fin
  addi s10, t4, 1                                                       # ir inst 334 fin
# Phi connections
  mv t4, s10
  j main._130.while.cond.13                                             # ir inst 335 fin
main._135.while.exit.13:
  j main._136.if.then.29                                                # ir inst 336 fin
main._136.if.then.29:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 111
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 337 fin
  j main._138.if.exit.29                                                # ir inst 338 fin
main._137.if.else.29:
  j main._138.if.exit.29                                                # ir inst 339 fin
main._138.if.exit.29:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 222
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 340 fin
  li t1, 0
  li t2, 0
  xor t0, t1, t2
  sltiu t4, t0, 1                                                       # ir inst 341 fin
  bnez t4, main._139.if.then.30
  j main._140.if.else.30                                                # ir inst 342 fin
main._139.if.then.30:
  j main._141.if.exit.30                                                # ir inst 343 fin
main._140.if.else.30:
  j main._141.if.exit.30                                                # ir inst 344 fin
main._141.if.exit.30:
  j main._142.if.then.31                                                # ir inst 345 fin
main._142.if.then.31:
  j main._144.if.exit.31                                                # ir inst 346 fin
main._143.if.else.31:
  j main._144.if.exit.31                                                # ir inst 347 fin
main._144.if.exit.31:
  li t1, 0
  li t2, 0
  xor t0, t1, t2
  sltiu t4, t0, 1                                                       # ir inst 348 fin
  bnez t4, main._145.if.then.32
  j main._146.if.else.32                                                # ir inst 349 fin
main._145.if.then.32:
  j main._147.if.exit.32                                                # ir inst 350 fin
main._146.if.else.32:
  j main._147.if.exit.32                                                # ir inst 351 fin
main._147.if.exit.32:
  j main._148.if.then.33                                                # ir inst 352 fin
main._148.if.then.33:
  j main._149.if.then.34                                                # ir inst 353 fin
main._149.if.then.34:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 70
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 354 fin
  j main._151.if.exit.34                                                # ir inst 355 fin
main._150.if.else.34:
  j main._151.if.exit.34                                                # ir inst 356 fin
main._151.if.exit.34:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 60
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 357 fin
  j main._153.if.exit.33                                                # ir inst 358 fin
main._152.if.else.33:
  j main._153.if.exit.33                                                # ir inst 359 fin
main._153.if.exit.33:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 50
  call printlnInt
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 360 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 0
  call exit
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 361 fin
  j main.epilogue                                                       # ir inst 362 fin
main._154.critical_edge.0:
# Phi connections
  mv t4, t6
  j main._72.while.exit.4                                               # ir inst 363 fin
main.epilogue:
  ld ra, 96(sp)
  ld s5, 32(sp)
  ld s0, 40(sp)
  ld s11, 48(sp)
  ld s8, 56(sp)
  ld s7, 64(sp)
  ld s6, 72(sp)
  ld s9, 80(sp)
  ld s10, 88(sp)
  li t0, 8704
  add sp, sp, t0
  ret
