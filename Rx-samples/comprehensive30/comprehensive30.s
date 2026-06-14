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
# spill func args num: 0,             range:     4160(sp) -     4160(sp)
# local var size: 4100,               range:       48(sp) -     4148(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4160
  add sp, sp, t0
  sd s11, 32(sp)
  sd ra, 40(sp)
main._0.entry.0:
  addi t1, sp, 48
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
# alloca %6
  li t2, 4144
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 12 fin
# Start call preparation
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.init_heap
# ir inst 13 fin
# Start call preparation
  li a2, 100
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
# ir inst 14 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 15 fin
  bnez t5, main._4.if.then.0
  j main._5.if.else.0                                                   # ir inst 16 fin
main._4.if.then.0:
# Start call preparation
  sd t6, 0(sp)
  li a0, 1001
  call printlnInt
  ld t6, 0(sp)
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 1
  li a2, 100
  mv a1, t6
  addi t1, sp, 48
  mv a0, t1
  call .F.fill_memory
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 1
  li a2, 100
  mv a1, t6
  addi t1, sp, 48
  mv a0, t1
  call .F.verify_memory
  ld t6, 0(sp)
# ir inst 19 fin
  j main._6.if.exit.0                                                   # ir inst 20 fin
main._5.if.else.0:
  j main._6.if.exit.0                                                   # ir inst 21 fin
main._6.if.exit.0:
# Start call preparation
  sd t6, 0(sp)
  li a2, 200
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_malloc
  mv t5, a0
  ld t6, 0(sp)
# ir inst 22 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 23 fin
  bnez t4, main._7.if.then.1
  j main._8.if.else.1                                                   # ir inst 24 fin
main._7.if.then.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a0, 1002
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 25 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a3, 2
  li a2, 200
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.fill_memory
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 26 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a3, 2
  li a2, 200
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.verify_memory
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 27 fin
  j main._9.if.exit.1                                                   # ir inst 28 fin
main._8.if.else.1:
  j main._9.if.exit.1                                                   # ir inst 29 fin
main._9.if.exit.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a2, 150
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_malloc
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 30 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 31 fin
  bnez t3, main._10.if.then.2
  j main._11.if.else.2                                                  # ir inst 32 fin
main._10.if.then.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 1003
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 33 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a3, 3
  li a2, 150
  mv a1, t4
  addi t1, sp, 48
  mv a0, t1
  call .F.fill_memory
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 34 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a3, 3
  li a2, 150
  mv a1, t4
  addi t1, sp, 48
  mv a0, t1
  call .F.verify_memory
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 35 fin
  j main._12.if.exit.2                                                  # ir inst 36 fin
main._11.if.else.2:
  j main._12.if.exit.2                                                  # ir inst 37 fin
main._12.if.exit.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t5
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_free
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 38 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a3, 2
  li a2, 200
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.verify_memory
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 39 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  li a0, 1004
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 40 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  li a2, 50
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_malloc
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 41 fin
  li t2, 0
  slt t3, t2, t5                                                        # ir inst 42 fin
  bnez t3, main._13.if.then.3
  j main._14.if.else.3                                                  # ir inst 43 fin
main._13.if.then.3:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 1005
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 44 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a3, 4
  li a2, 50
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.fill_memory
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 45 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a3, 2
  li a2, 50
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.verify_memory
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 46 fin
  j main._15.if.exit.3                                                  # ir inst 47 fin
main._14.if.else.3:
  j main._15.if.exit.3                                                  # ir inst 48 fin
main._15.if.exit.3:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 250
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_malloc
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 49 fin
  li t2, 0
  slt s11, t3, t2                                                       # ir inst 50 fin
  bnez s11, main._16.if.then.4
  j main._17.if.else.4                                                  # ir inst 51 fin
main._16.if.then.4:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a0, 1006
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 52 fin
  j main._18.if.exit.4                                                  # ir inst 53 fin
main._17.if.else.4:
  j main._18.if.exit.4                                                  # ir inst 54 fin
main._18.if.exit.4:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_free
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 55 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a2, t4
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_free
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 56 fin
# Start call preparation
  sd t5, 0(sp)
  mv a2, t5
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_free
  ld t5, 0(sp)
# ir inst 57 fin
# Start call preparation
  li a0, 1007
  call printlnInt
# ir inst 58 fin
# Start call preparation
  li a2, 800
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
# ir inst 59 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 60 fin
  bnez t5, main._19.if.then.5
  j main._20.if.else.5                                                  # ir inst 61 fin
main._19.if.then.5:
# Start call preparation
  sd t6, 0(sp)
  li a0, 1008
  call printlnInt
  ld t6, 0(sp)
# ir inst 62 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 5
  li a2, 800
  mv a1, t6
  addi t1, sp, 48
  mv a0, t1
  call .F.fill_memory
  ld t6, 0(sp)
# ir inst 63 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 5
  li a2, 800
  mv a1, t6
  addi t1, sp, 48
  mv a0, t1
  call .F.verify_memory
  ld t6, 0(sp)
# ir inst 64 fin
  j main._21.if.exit.5                                                  # ir inst 65 fin
main._20.if.else.5:
  j main._21.if.exit.5                                                  # ir inst 66 fin
main._21.if.exit.5:
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 67 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 68 fin
  j main.epilogue                                                       # ir inst 69 fin
main.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  li t0, 4160
  add sp, sp, t0
  ret

.globl .F.init_heap
.F.init_heap:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_heap._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 1024
  mv t5, t1                                                             # ir inst 2 fin
  addi t4, t5, -2                                                       # ir inst 3 fin
  sw t4, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 4                                                        # ir inst 5 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 8                                                        # ir inst 7 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 8 fin
  li t1, 0
  sw t1, 0(a1)                                                          # ir inst 9 fin
  j .F.init_heap.epilogue                                               # ir inst 10 fin
.F.init_heap.epilogue:
  ret

.globl .F.my_malloc
.F.my_malloc:
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
.F.my_malloc._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
# Phi connections
  mv t5, t6
  li t6, -1
  j .F.my_malloc._1.while.cond.0                                        # ir inst 2 fin
.F.my_malloc._1.while.cond.0:
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 5 fin
  bnez t4, .F.my_malloc._2.while.body.0
  j .F.my_malloc._21.while.exit.0                                       # ir inst 6 fin
.F.my_malloc._2.while.body.0:
  mv t4, t5                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 8 fin
  lw t4, 0(t3)                                                          # ir inst 9 fin
  mv t3, t5                                                             # ir inst 10 fin
  addi s11, t3, 1                                                       # ir inst 11 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  lw s11, 0(t3)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 14 fin
  bnez t3, .F.my_malloc._3.lazy.then.0
  j .F.my_malloc._4.lazy.else.0                                         # ir inst 15 fin
.F.my_malloc._3.lazy.then.0:
  slt t0, t4, a2
  xori t3, t0, 1                                                        # ir inst 16 fin
# Phi connections
  j .F.my_malloc._5.lazy.exit.0                                         # ir inst 17 fin
.F.my_malloc._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.my_malloc._5.lazy.exit.0                                         # ir inst 18 fin
.F.my_malloc._5.lazy.exit.0:
  bnez t3, .F.my_malloc._6.if.then.0
  j .F.my_malloc._19.if.else.0                                          # ir inst 20 fin
.F.my_malloc._6.if.then.0:
  sub t3, t4, a2                                                        # ir inst 21 fin
  addi t4, t3, -2                                                       # ir inst 22 fin
  li t2, 2
  slt t3, t2, t4                                                        # ir inst 23 fin
  bnez t3, .F.my_malloc._7.if.then.1
  j .F.my_malloc._8.if.else.1                                           # ir inst 24 fin
.F.my_malloc._7.if.then.1:
  addi t3, t5, 2                                                        # ir inst 25 fin
  add s11, t3, a2                                                       # ir inst 26 fin
  mv t3, s11                                                            # ir inst 27 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 28 fin
  sw t4, 0(s10)                                                         # ir inst 29 fin
  mv t3, s11                                                            # ir inst 30 fin
  addi s10, t3, 1                                                       # ir inst 31 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 32 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 33 fin
  mv t3, s11                                                            # ir inst 34 fin
  addi s10, t3, 2                                                       # ir inst 35 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 36 fin
  mv s10, t5                                                            # ir inst 37 fin
  addi s9, s10, 2                                                       # ir inst 38 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 39 fin
  lw s9, 0(s10)                                                         # ir inst 40 fin
  sw s9, 0(t3)                                                          # ir inst 41 fin
  mv t3, t5                                                             # ir inst 42 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 43 fin
  sw a2, 0(s10)                                                         # ir inst 44 fin
  mv t3, t5                                                             # ir inst 45 fin
  addi s10, t3, 1                                                       # ir inst 46 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 47 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 48 fin
  mv t3, t5                                                             # ir inst 49 fin
  addi s10, t3, 2                                                       # ir inst 50 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 51 fin
  sw s11, 0(t3)                                                         # ir inst 52 fin
  j .F.my_malloc._9.if.exit.1                                           # ir inst 53 fin
.F.my_malloc._8.if.else.1:
  mv t3, t5                                                             # ir inst 54 fin
  addi s11, t3, 1                                                       # ir inst 55 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 56 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 57 fin
  j .F.my_malloc._9.if.exit.1                                           # ir inst 58 fin
.F.my_malloc._9.if.exit.1:
  li t2, -1
  xor t0, t6, t2
  sltiu t3, t0, 1                                                       # ir inst 59 fin
  bnez t3, .F.my_malloc._10.if.then.2
  j .F.my_malloc._14.if.else.2                                          # ir inst 60 fin
.F.my_malloc._10.if.then.2:
  li t2, 2
  slt t3, t2, t4                                                        # ir inst 61 fin
  bnez t3, .F.my_malloc._11.if.then.3
  j .F.my_malloc._12.if.else.3                                          # ir inst 62 fin
.F.my_malloc._11.if.then.3:
  addi t3, t5, 2                                                        # ir inst 63 fin
  add s11, t3, a2                                                       # ir inst 64 fin
  sw s11, 0(a1)                                                         # ir inst 65 fin
  j .F.my_malloc._13.if.exit.3                                          # ir inst 66 fin
.F.my_malloc._12.if.else.3:
  mv t3, t5                                                             # ir inst 67 fin
  addi s11, t3, 2                                                       # ir inst 68 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 69 fin
  lw s11, 0(t3)                                                         # ir inst 70 fin
  sw s11, 0(a1)                                                         # ir inst 71 fin
  j .F.my_malloc._13.if.exit.3                                          # ir inst 72 fin
.F.my_malloc._13.if.exit.3:
  j .F.my_malloc._18.if.exit.2                                          # ir inst 73 fin
.F.my_malloc._14.if.else.2:
  li t2, 2
  slt t3, t2, t4                                                        # ir inst 74 fin
  bnez t3, .F.my_malloc._15.if.then.4
  j .F.my_malloc._16.if.else.4                                          # ir inst 75 fin
.F.my_malloc._15.if.then.4:
  mv t4, t6                                                             # ir inst 76 fin
  addi t3, t4, 2                                                        # ir inst 77 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 78 fin
  addi t3, t5, 2                                                        # ir inst 79 fin
  add s11, t3, a2                                                       # ir inst 80 fin
  sw s11, 0(t4)                                                         # ir inst 81 fin
  j .F.my_malloc._17.if.exit.4                                          # ir inst 82 fin
.F.my_malloc._16.if.else.4:
  mv t4, t6                                                             # ir inst 83 fin
  addi t6, t4, 2                                                        # ir inst 84 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 85 fin
  mv t6, t5                                                             # ir inst 86 fin
  addi t3, t6, 2                                                        # ir inst 87 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 88 fin
  lw t3, 0(t6)                                                          # ir inst 89 fin
  sw t3, 0(t4)                                                          # ir inst 90 fin
  j .F.my_malloc._17.if.exit.4                                          # ir inst 91 fin
.F.my_malloc._17.if.exit.4:
  j .F.my_malloc._18.if.exit.2                                          # ir inst 92 fin
.F.my_malloc._18.if.exit.2:
  addi t6, t5, 2                                                        # ir inst 93 fin
  mv a0, t6
  j .F.my_malloc.epilogue                                               # ir inst 94 fin
.F.my_malloc._19.if.else.0:
  j .F.my_malloc._20.if.exit.0                                          # ir inst 95 fin
.F.my_malloc._20.if.exit.0:
  mv t6, t5                                                             # ir inst 96 fin
  addi t4, t6, 2                                                        # ir inst 97 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 98 fin
  lw t4, 0(t6)                                                          # ir inst 99 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.my_malloc._1.while.cond.0                                        # ir inst 100 fin
.F.my_malloc._21.while.exit.0:
  li a0, -1
  j .F.my_malloc.epilogue                                               # ir inst 101 fin
.F.my_malloc.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.my_free
.F.my_free:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 1 / 12,        range:       16(sp) -       24(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 16(sp)
  sd ra, 24(sp)
.F.my_free._0.entry.0:
  li t2, 2
  slt t0, t2, a2
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.my_free._1.if.then.0
  j .F.my_free._2.if.else.0                                             # ir inst 2 fin
.F.my_free._1.if.then.0:
  j .F.my_free.epilogue                                                 # ir inst 3 fin
.F.my_free._2.if.else.0:
  j .F.my_free._3.if.exit.0                                             # ir inst 4 fin
.F.my_free._3.if.exit.0:
  addi t6, a2, -2                                                       # ir inst 5 fin
  mv t5, t6                                                             # ir inst 6 fin
  addi t4, t5, 1                                                        # ir inst 7 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 9 fin
  lw t5, 0(a1)                                                          # ir inst 10 fin
# Phi connections
  mv t4, t5
  li t5, -1
  j .F.my_free._4.while.cond.0                                          # ir inst 11 fin
.F.my_free._4.while.cond.0:
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 14 fin
  bnez t3, .F.my_free._5.lazy.then.0
  j .F.my_free._6.lazy.else.0                                           # ir inst 15 fin
.F.my_free._5.lazy.then.0:
  slt t3, t4, t6                                                        # ir inst 16 fin
# Phi connections
  j .F.my_free._7.lazy.exit.0                                           # ir inst 17 fin
.F.my_free._6.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.my_free._7.lazy.exit.0                                           # ir inst 18 fin
.F.my_free._7.lazy.exit.0:
  bnez t3, .F.my_free._8.while.body.0
  j .F.my_free._9.while.exit.0                                          # ir inst 20 fin
.F.my_free._8.while.body.0:
  mv t3, t4                                                             # ir inst 21 fin
  addi s11, t3, 2                                                       # ir inst 22 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 23 fin
  lw s11, 0(t3)                                                         # ir inst 24 fin
# Phi connections
  mv t5, t4
  mv t4, s11
  j .F.my_free._4.while.cond.0                                          # ir inst 25 fin
.F.my_free._9.while.exit.0:
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 26 fin
  bnez t4, .F.my_free._10.if.then.1
  j .F.my_free._11.if.else.1                                            # ir inst 27 fin
.F.my_free._10.if.then.1:
  mv t4, t6                                                             # ir inst 28 fin
  addi t3, t4, 2                                                        # ir inst 29 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 30 fin
  lw t3, 0(a1)                                                          # ir inst 31 fin
  sw t3, 0(t4)                                                          # ir inst 32 fin
  sw t6, 0(a1)                                                          # ir inst 33 fin
  j .F.my_free._12.if.exit.1                                            # ir inst 34 fin
.F.my_free._11.if.else.1:
  mv t4, t6                                                             # ir inst 35 fin
  addi t3, t4, 2                                                        # ir inst 36 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 37 fin
  mv t3, t5                                                             # ir inst 38 fin
  addi s11, t3, 2                                                       # ir inst 39 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 40 fin
  lw s11, 0(t3)                                                         # ir inst 41 fin
  sw s11, 0(t4)                                                         # ir inst 42 fin
  mv t4, t5                                                             # ir inst 43 fin
  addi t5, t4, 2                                                        # ir inst 44 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 45 fin
  sw t6, 0(t4)                                                          # ir inst 46 fin
  j .F.my_free._12.if.exit.1                                            # ir inst 47 fin
.F.my_free._12.if.exit.1:
  lw t6, 0(a1)                                                          # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F.coalesce
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 49 fin
  j .F.my_free.epilogue                                                 # ir inst 50 fin
.F.my_free.epilogue:
  ld ra, 24(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.coalesce
.F.coalesce:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.coalesce._0.entry.0:
# Phi connections
  mv t6, a1
  j .F.coalesce._1.while.cond.0                                         # ir inst 1 fin
.F.coalesce._1.while.cond.0:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 3 fin
  bnez t5, .F.coalesce._2.while.body.0
  j .F.coalesce._6.while.exit.0                                         # ir inst 4 fin
.F.coalesce._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  addi t4, t5, 2                                                        # ir inst 6 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t5)                                                          # ir inst 8 fin
  mv t5, t6                                                             # ir inst 9 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 10 fin
  lw t5, 0(t3)                                                          # ir inst 11 fin
  addi t3, t6, 2                                                        # ir inst 12 fin
  add s11, t3, t5                                                       # ir inst 13 fin
  xor t0, s11, t4
  sltiu t3, t0, 1                                                       # ir inst 14 fin
  bnez t3, .F.coalesce._3.if.then.0
  j .F.coalesce._4.if.else.0                                            # ir inst 15 fin
.F.coalesce._3.if.then.0:
  mv t3, t4                                                             # ir inst 16 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 17 fin
  lw t3, 0(s11)                                                         # ir inst 18 fin
  addi s11, t5, 2                                                       # ir inst 19 fin
  add t5, s11, t3                                                       # ir inst 20 fin
  mv t3, t6                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 22 fin
  sw t5, 0(s11)                                                         # ir inst 23 fin
  mv t5, t6                                                             # ir inst 24 fin
  addi t3, t5, 2                                                        # ir inst 25 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 26 fin
  mv t3, t4                                                             # ir inst 27 fin
  addi t4, t3, 2                                                        # ir inst 28 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 29 fin
  lw t4, 0(t3)                                                          # ir inst 30 fin
  sw t4, 0(t5)                                                          # ir inst 31 fin
# Phi connections
  j .F.coalesce._5.if.exit.0                                            # ir inst 32 fin
.F.coalesce._4.if.else.0:
  mv t5, t6                                                             # ir inst 33 fin
  addi t6, t5, 2                                                        # ir inst 34 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 35 fin
  lw t6, 0(t5)                                                          # ir inst 36 fin
# Phi connections
  j .F.coalesce._5.if.exit.0                                            # ir inst 37 fin
.F.coalesce._5.if.exit.0:
# Phi connections
  j .F.coalesce._1.while.cond.0                                         # ir inst 39 fin
.F.coalesce._6.while.exit.0:
  j .F.coalesce.epilogue                                                # ir inst 40 fin
.F.coalesce.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.fill_memory
.F.fill_memory:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.fill_memory._0.entry.0:
# Phi connections
  li t6, 0
  j .F.fill_memory._1.while.cond.0                                      # ir inst 1 fin
.F.fill_memory._1.while.cond.0:
  slt t5, t6, a2                                                        # ir inst 3 fin
  bnez t5, .F.fill_memory._2.while.body.0
  j .F.fill_memory._3.while.exit.0                                      # ir inst 4 fin
.F.fill_memory._2.while.body.0:
  add t5, a1, t6                                                        # ir inst 5 fin
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 7 fin
  li t2, 10000
  mul t4, a3, t2                                                        # ir inst 8 fin
  add t3, t4, t6                                                        # ir inst 9 fin
  sw t3, 0(t5)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.fill_memory._1.while.cond.0                                      # ir inst 12 fin
.F.fill_memory._3.while.exit.0:
  j .F.fill_memory.epilogue                                             # ir inst 13 fin
.F.fill_memory.epilogue:
  ret

.globl .F.verify_memory
.F.verify_memory:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd ra, 8(sp)
.F.verify_memory._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.verify_memory._1.while.cond.0                                    # ir inst 1 fin
.F.verify_memory._1.while.cond.0:
  slt t4, t5, a2                                                        # ir inst 4 fin
  bnez t4, .F.verify_memory._2.while.body.0
  j .F.verify_memory._6.while.exit.0                                    # ir inst 5 fin
.F.verify_memory._2.while.body.0:
  add t4, a1, t5                                                        # ir inst 6 fin
  mv t3, t4                                                             # ir inst 7 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  li t2, 10000
  mul t4, a3, t2                                                        # ir inst 10 fin
  add s11, t4, t5                                                       # ir inst 11 fin
  xor t0, t3, s11
  sltu t4, zero, t0                                                     # ir inst 12 fin
  bnez t4, .F.verify_memory._3.if.then.0
  j .F.verify_memory._4.if.else.0                                       # ir inst 13 fin
.F.verify_memory._3.if.then.0:
  addi t4, t6, 1                                                        # ir inst 14 fin
# Phi connections
  j .F.verify_memory._5.if.exit.0                                       # ir inst 15 fin
.F.verify_memory._4.if.else.0:
# Phi connections
  mv t4, t6
  j .F.verify_memory._5.if.exit.0                                       # ir inst 16 fin
.F.verify_memory._5.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.verify_memory._1.while.cond.0                                    # ir inst 19 fin
.F.verify_memory._6.while.exit.0:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 20 fin
  bnez t5, .F.verify_memory._7.if.then.1
  j .F.verify_memory._8.if.else.1                                       # ir inst 21 fin
.F.verify_memory._7.if.then.1:
# Start call preparation
  li a0, -999
  call printlnInt
# ir inst 22 fin
  j .F.verify_memory._9.if.exit.1                                       # ir inst 23 fin
.F.verify_memory._8.if.else.1:
  j .F.verify_memory._9.if.exit.1                                       # ir inst 24 fin
.F.verify_memory._9.if.exit.1:
  j .F.verify_memory.epilogue                                           # ir inst 25 fin
.F.verify_memory.epilogue:
  ld ra, 8(sp)
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.complex_memory_churn
.F.complex_memory_churn:
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 80,                 range:       56(sp) -      136(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd ra, 48(sp)
.F.complex_memory_churn._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.complex_memory_churn._1.array.cond.0                             # ir inst 3 fin
.F.complex_memory_churn._1.array.cond.0:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.complex_memory_churn._2.array.body.0
  j .F.complex_memory_churn._3.array.exit.0                             # ir inst 6 fin
.F.complex_memory_churn._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.complex_memory_churn._1.array.cond.0                             # ir inst 10 fin
.F.complex_memory_churn._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.complex_memory_churn._4.while.cond.0                             # ir inst 11 fin
.F.complex_memory_churn._4.while.cond.0:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.complex_memory_churn._5.while.body.0
  j .F.complex_memory_churn._9.while.exit.0                             # ir inst 14 fin
.F.complex_memory_churn._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t4, t1, t2                                                        # ir inst 16 fin
  slli t5, t6, 1                                                        # ir inst 17 fin
  addi t3, t5, 20                                                       # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  mv a2, t3
  call .F.my_malloc
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 19 fin
  sw t5, 0(t4)                                                          # ir inst 20 fin
  mv t5, t6                                                             # ir inst 21 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t4, t1, t2                                                        # ir inst 22 fin
  lw t5, 0(t4)                                                          # ir inst 23 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 24 fin
  bnez t4, .F.complex_memory_churn._6.if.then.0
  j .F.complex_memory_churn._7.if.else.0                                # ir inst 25 fin
.F.complex_memory_churn._6.if.then.0:
  mv t5, t6                                                             # ir inst 26 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t4, t1, t2                                                        # ir inst 27 fin
  lw t5, 0(t4)                                                          # ir inst 28 fin
  slli t4, t6, 1                                                        # ir inst 29 fin
  addi t3, t4, 20                                                       # ir inst 30 fin
  addi t4, t6, 10                                                       # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, t4
  mv a2, t3
  mv a1, t5
  call .F.fill_memory
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 32 fin
  j .F.complex_memory_churn._8.if.exit.0                                # ir inst 33 fin
.F.complex_memory_churn._7.if.else.0:
  j .F.complex_memory_churn._8.if.exit.0                                # ir inst 34 fin
.F.complex_memory_churn._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 35 fin
# Phi connections
  mv t6, t5
  j .F.complex_memory_churn._4.while.cond.0                             # ir inst 36 fin
.F.complex_memory_churn._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.complex_memory_churn._10.while.cond.1                            # ir inst 37 fin
.F.complex_memory_churn._10.while.cond.1:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 39 fin
  bnez t5, .F.complex_memory_churn._11.while.body.1
  j .F.complex_memory_churn._15.while.exit.1                            # ir inst 40 fin
.F.complex_memory_churn._11.while.body.1:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 41 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 42 fin
  bnez t4, .F.complex_memory_churn._12.if.then.1
  j .F.complex_memory_churn._13.if.else.1                               # ir inst 43 fin
.F.complex_memory_churn._12.if.then.1:
  mv t5, t6                                                             # ir inst 44 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t4, t1, t2                                                        # ir inst 45 fin
  lw t5, 0(t4)                                                          # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  call .F.my_free
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 47 fin
  j .F.complex_memory_churn._14.if.exit.1                               # ir inst 48 fin
.F.complex_memory_churn._13.if.else.1:
  j .F.complex_memory_churn._14.if.exit.1                               # ir inst 49 fin
.F.complex_memory_churn._14.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F.complex_memory_churn._10.while.cond.1                            # ir inst 51 fin
.F.complex_memory_churn._15.while.exit.1:
# Phi connections
  li t6, 1
  j .F.complex_memory_churn._16.while.cond.2                            # ir inst 52 fin
.F.complex_memory_churn._16.while.cond.2:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 54 fin
  bnez t5, .F.complex_memory_churn._17.while.body.2
  j .F.complex_memory_churn._21.while.exit.2                            # ir inst 55 fin
.F.complex_memory_churn._17.while.body.2:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 56 fin
  li t2, 0
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 57 fin
  bnez t4, .F.complex_memory_churn._18.if.then.2
  j .F.complex_memory_churn._19.if.else.2                               # ir inst 58 fin
.F.complex_memory_churn._18.if.then.2:
  mv t5, t6                                                             # ir inst 59 fin
  slli t2, t5, 2
  addi t1, sp, 56
  add t4, t1, t2                                                        # ir inst 60 fin
  lw t5, 0(t4)                                                          # ir inst 61 fin
  slli t4, t6, 1                                                        # ir inst 62 fin
  addi t3, t4, 20                                                       # ir inst 63 fin
  addi t4, t6, 10                                                       # ir inst 64 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, t4
  mv a2, t3
  mv a1, t5
  call .F.verify_memory
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 65 fin
  j .F.complex_memory_churn._20.if.exit.2                               # ir inst 66 fin
.F.complex_memory_churn._19.if.else.2:
  j .F.complex_memory_churn._20.if.exit.2                               # ir inst 67 fin
.F.complex_memory_churn._20.if.exit.2:
  addi t5, t6, 1                                                        # ir inst 68 fin
# Phi connections
  mv t6, t5
  j .F.complex_memory_churn._16.while.cond.2                            # ir inst 69 fin
.F.complex_memory_churn._21.while.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  li a2, 300
  call .F.my_malloc
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 70 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 71 fin
  bnez t5, .F.complex_memory_churn._22.if.then.3
  j .F.complex_memory_churn._23.if.else.3                               # ir inst 72 fin
.F.complex_memory_churn._22.if.then.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a3, 100
  li a2, 300
  mv a1, t6
  call .F.fill_memory
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 73 fin
  j .F.complex_memory_churn._24.if.exit.3                               # ir inst 74 fin
.F.complex_memory_churn._23.if.else.3:
  j .F.complex_memory_churn._24.if.exit.3                               # ir inst 75 fin
.F.complex_memory_churn._24.if.exit.3:
# Phi connections
  li t5, 1
  j .F.complex_memory_churn._25.while.cond.3                            # ir inst 76 fin
.F.complex_memory_churn._25.while.cond.3:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 78 fin
  bnez t4, .F.complex_memory_churn._26.while.body.3
  j .F.complex_memory_churn._30.while.exit.3                            # ir inst 79 fin
.F.complex_memory_churn._26.while.body.3:
  li t2, 2
  rem t4, t5, t2                                                        # ir inst 80 fin
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 81 fin
  bnez t3, .F.complex_memory_churn._27.if.then.4
  j .F.complex_memory_churn._28.if.else.4                               # ir inst 82 fin
.F.complex_memory_churn._27.if.then.4:
  mv t4, t5                                                             # ir inst 83 fin
  slli t2, t4, 2
  addi t1, sp, 56
  add t3, t1, t2                                                        # ir inst 84 fin
  lw t4, 0(t3)                                                          # ir inst 85 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t4
  call .F.my_free
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 86 fin
  j .F.complex_memory_churn._29.if.exit.4                               # ir inst 87 fin
.F.complex_memory_churn._28.if.else.4:
  j .F.complex_memory_churn._29.if.exit.4                               # ir inst 88 fin
.F.complex_memory_churn._29.if.exit.4:
  addi t4, t5, 1                                                        # ir inst 89 fin
# Phi connections
  mv t5, t4
  j .F.complex_memory_churn._25.while.cond.3                            # ir inst 90 fin
.F.complex_memory_churn._30.while.exit.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  mv a2, t6
  call .F.my_free
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 91 fin
  li t1, 1024
  mv t6, t1                                                             # ir inst 92 fin
  addi t5, t6, -100                                                     # ir inst 93 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a2, t5
  call .F.my_malloc
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 94 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 95 fin
  bnez t5, .F.complex_memory_churn._31.if.then.5
  j .F.complex_memory_churn._32.if.else.5                               # ir inst 96 fin
.F.complex_memory_churn._31.if.then.5:
# Start call preparation
  li a0, 8888
  call printlnInt
# ir inst 97 fin
  j .F.complex_memory_churn._33.if.exit.5                               # ir inst 98 fin
.F.complex_memory_churn._32.if.else.5:
  j .F.complex_memory_churn._33.if.exit.5                               # ir inst 99 fin
.F.complex_memory_churn._33.if.exit.5:
  j .F.complex_memory_churn.epilogue                                    # ir inst 100 fin
.F.complex_memory_churn.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 144
  ret

.globl .F.another_level_of_scope
.F.another_level_of_scope:
# spill func args num: 0,             range:     4176(sp) -     4176(sp)
# local var size: 4120,               range:       56(sp) -     4176(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4176
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.another_level_of_scope._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.another_level_of_scope._1.array.cond.0                           # ir inst 3 fin
.F.another_level_of_scope._1.array.cond.0:
  li t2, 1024
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.another_level_of_scope._2.array.body.0
  j .F.another_level_of_scope._3.array.exit.0                           # ir inst 6 fin
.F.another_level_of_scope._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.another_level_of_scope._1.array.cond.0                           # ir inst 10 fin
.F.another_level_of_scope._3.array.exit.0:
# alloca %6
  li t2, 4152
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 12 fin
# Start call preparation
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.init_heap
# ir inst 13 fin
# Start call preparation
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.complex_memory_churn
# ir inst 14 fin
# Start call preparation
  li a2, 50
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
# ir inst 15 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 16 fin
  bnez t5, .F.another_level_of_scope._4.if.then.0
  j .F.another_level_of_scope._5.if.else.0                              # ir inst 17 fin
.F.another_level_of_scope._4.if.then.0:
# Start call preparation
  sd t6, 0(sp)
  li a3, 50
  li a2, 50
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.fill_memory
  ld t6, 0(sp)
# ir inst 18 fin
# Phi connections
  j .F.another_level_of_scope._6.if.exit.0                              # ir inst 19 fin
.F.another_level_of_scope._5.if.else.0:
# Phi connections
  li t6, 0
  j .F.another_level_of_scope._6.if.exit.0                              # ir inst 20 fin
.F.another_level_of_scope._6.if.exit.0:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 22 fin
  bnez t5, .F.another_level_of_scope._7.if.then.1
  j .F.another_level_of_scope._8.if.else.1                              # ir inst 23 fin
.F.another_level_of_scope._7.if.then.1:
# Start call preparation
  sd t6, 0(sp)
  li a3, 50
  li a2, 50
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.verify_memory
  ld t6, 0(sp)
# ir inst 24 fin
  j .F.another_level_of_scope._9.if.exit.1                              # ir inst 25 fin
.F.another_level_of_scope._8.if.else.1:
  j .F.another_level_of_scope._9.if.exit.1                              # ir inst 26 fin
.F.another_level_of_scope._9.if.exit.1:
  li t1, 1
  li t2, 1
  xor t0, t1, t2
  sltiu t6, t0, 1                                                       # ir inst 27 fin
  bnez t6, .F.another_level_of_scope._10.if.then.2
  j .F.another_level_of_scope._17.if.else.2                             # ir inst 28 fin
.F.another_level_of_scope._10.if.then.2:
# Phi connections
  li t6, 0
  j .F.another_level_of_scope._11.while.cond.0                          # ir inst 29 fin
.F.another_level_of_scope._11.while.cond.0:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 31 fin
  bnez t5, .F.another_level_of_scope._12.while.body.0
  j .F.another_level_of_scope._16.while.exit.0                          # ir inst 32 fin
.F.another_level_of_scope._12.while.body.0:
  li t2, 5
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 33 fin
  bnez t5, .F.another_level_of_scope._13.if.then.3
  j .F.another_level_of_scope._14.if.else.3                             # ir inst 34 fin
.F.another_level_of_scope._13.if.then.3:
  addi t5, t6, 5                                                        # ir inst 35 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 36 fin
  j .F.another_level_of_scope._15.if.exit.3                             # ir inst 37 fin
.F.another_level_of_scope._14.if.else.3:
  j .F.another_level_of_scope._15.if.exit.3                             # ir inst 38 fin
.F.another_level_of_scope._15.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F.another_level_of_scope._11.while.cond.0                          # ir inst 40 fin
.F.another_level_of_scope._16.while.exit.0:
  j .F.another_level_of_scope._18.if.exit.2                             # ir inst 41 fin
.F.another_level_of_scope._17.if.else.2:
  j .F.another_level_of_scope._18.if.exit.2                             # ir inst 42 fin
.F.another_level_of_scope._18.if.exit.2:
# Start call preparation
  li a2, 10
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
# ir inst 43 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 44 fin
  bnez t5, .F.another_level_of_scope._19.if.then.4
  j .F.another_level_of_scope._20.if.else.4                             # ir inst 45 fin
.F.another_level_of_scope._19.if.then.4:
# Start call preparation
  sd t6, 0(sp)
  li a3, 99
  li a2, 10
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.fill_memory
  ld t6, 0(sp)
# ir inst 46 fin
  j .F.another_level_of_scope._21.if.exit.4                             # ir inst 47 fin
.F.another_level_of_scope._20.if.else.4:
  j .F.another_level_of_scope._21.if.exit.4                             # ir inst 48 fin
.F.another_level_of_scope._21.if.exit.4:
  j .F.another_level_of_scope._22.if.then.5                             # ir inst 49 fin
.F.another_level_of_scope._22.if.then.5:
# Start call preparation
  li a2, 20
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
# ir inst 50 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 51 fin
  bnez t5, .F.another_level_of_scope._23.if.then.6
  j .F.another_level_of_scope._24.if.else.6                             # ir inst 52 fin
.F.another_level_of_scope._23.if.then.6:
# Start call preparation
  sd t6, 0(sp)
  li a3, 88
  li a2, 20
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.fill_memory
  ld t6, 0(sp)
# ir inst 53 fin
# Phi connections
  j .F.another_level_of_scope._25.if.exit.6                             # ir inst 54 fin
.F.another_level_of_scope._24.if.else.6:
# Phi connections
  li t6, 0
  j .F.another_level_of_scope._25.if.exit.6                             # ir inst 55 fin
.F.another_level_of_scope._25.if.exit.6:
# Phi connections
  j .F.another_level_of_scope._27.if.exit.5                             # ir inst 57 fin
.F.another_level_of_scope._26.if.else.5:
# Phi connections
  li t6, 0
  j .F.another_level_of_scope._27.if.exit.5                             # ir inst 58 fin
.F.another_level_of_scope._27.if.exit.5:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 60 fin
  bnez t5, .F.another_level_of_scope._28.if.then.7
  j .F.another_level_of_scope._29.if.else.7                             # ir inst 61 fin
.F.another_level_of_scope._28.if.then.7:
# Start call preparation
  sd t6, 0(sp)
  li a3, 88
  li a2, 20
  mv a1, t6
  addi t1, sp, 56
  mv a0, t1
  call .F.verify_memory
  ld t6, 0(sp)
# ir inst 62 fin
  j .F.another_level_of_scope._30.if.exit.7                             # ir inst 63 fin
.F.another_level_of_scope._29.if.else.7:
  j .F.another_level_of_scope._30.if.exit.7                             # ir inst 64 fin
.F.another_level_of_scope._30.if.exit.7:
# Phi connections
  li t6, 0
  j .F.another_level_of_scope._31.while.cond.1                          # ir inst 65 fin
.F.another_level_of_scope._31.while.cond.1:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 67 fin
  bnez t5, .F.another_level_of_scope._32.while.body.1
  j .F.another_level_of_scope._48.while.exit.1                          # ir inst 68 fin
.F.another_level_of_scope._32.while.body.1:
  li t1, 4156
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 70 fin
# Phi connections
  li t4, 0
  j .F.another_level_of_scope._33.array.cond.1                          # ir inst 71 fin
.F.another_level_of_scope._33.array.cond.1:
  li t2, 5
  slt t3, t4, t2                                                        # ir inst 73 fin
  bnez t3, .F.another_level_of_scope._34.array.body.1
  j .F.another_level_of_scope._35.array.exit.1                          # ir inst 74 fin
.F.another_level_of_scope._34.array.body.1:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 75 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 76 fin
  addi t3, t4, 1                                                        # ir inst 77 fin
# Phi connections
  mv t4, t3
  j .F.another_level_of_scope._33.array.cond.1                          # ir inst 78 fin
.F.another_level_of_scope._35.array.exit.1:
# Phi connections
  li t5, 0
  j .F.another_level_of_scope._36.while.cond.2                          # ir inst 79 fin
.F.another_level_of_scope._36.while.cond.2:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 81 fin
  bnez t4, .F.another_level_of_scope._37.while.body.2
  j .F.another_level_of_scope._41.while.exit.2                          # ir inst 82 fin
.F.another_level_of_scope._37.while.body.2:
  add t4, t6, t5                                                        # ir inst 83 fin
  addi t3, t4, 1                                                        # ir inst 84 fin
  slli t4, t3, 1                                                        # ir inst 85 fin
  mv t3, t5                                                             # ir inst 86 fin
  slli t2, t3, 2
  li t1, 4156
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 87 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_malloc
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 88 fin
  sw t3, 0(s11)                                                         # ir inst 89 fin
  mv t3, t5                                                             # ir inst 90 fin
  slli t2, t3, 2
  li t1, 4156
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 91 fin
  lw t3, 0(s11)                                                         # ir inst 92 fin
  li t2, 0
  slt s11, t2, t3                                                       # ir inst 93 fin
  bnez s11, .F.another_level_of_scope._38.if.then.8
  j .F.another_level_of_scope._39.if.else.8                             # ir inst 94 fin
.F.another_level_of_scope._38.if.then.8:
  mv t3, t5                                                             # ir inst 95 fin
  slli t2, t3, 2
  li t1, 4156
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 96 fin
  lw t3, 0(s11)                                                         # ir inst 97 fin
  li t2, 10
  mul s11, t6, t2                                                       # ir inst 98 fin
  add s10, s11, t5                                                      # ir inst 99 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, s10
  mv a2, t4
  mv a1, t3
  addi t1, sp, 56
  mv a0, t1
  call .F.fill_memory
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 100 fin
  j .F.another_level_of_scope._40.if.exit.8                             # ir inst 101 fin
.F.another_level_of_scope._39.if.else.8:
  j .F.another_level_of_scope._40.if.exit.8                             # ir inst 102 fin
.F.another_level_of_scope._40.if.exit.8:
  addi t4, t5, 1                                                        # ir inst 103 fin
# Phi connections
  mv t5, t4
  j .F.another_level_of_scope._36.while.cond.2                          # ir inst 104 fin
.F.another_level_of_scope._41.while.exit.2:
# Phi connections
  li t5, 0
  j .F.another_level_of_scope._42.while.cond.3                          # ir inst 105 fin
.F.another_level_of_scope._42.while.cond.3:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 107 fin
  bnez t4, .F.another_level_of_scope._43.while.body.3
  j .F.another_level_of_scope._47.while.exit.3                          # ir inst 108 fin
.F.another_level_of_scope._43.while.body.3:
  mv t4, t5                                                             # ir inst 109 fin
  slli t2, t4, 2
  li t1, 4156
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 110 fin
  lw t4, 0(t3)                                                          # ir inst 111 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 112 fin
  bnez t3, .F.another_level_of_scope._44.if.then.9
  j .F.another_level_of_scope._45.if.else.9                             # ir inst 113 fin
.F.another_level_of_scope._44.if.then.9:
  mv t4, t5                                                             # ir inst 114 fin
  slli t2, t4, 2
  li t1, 4156
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 115 fin
  lw t4, 0(t3)                                                          # ir inst 116 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_free
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 117 fin
  j .F.another_level_of_scope._46.if.exit.9                             # ir inst 118 fin
.F.another_level_of_scope._45.if.else.9:
  j .F.another_level_of_scope._46.if.exit.9                             # ir inst 119 fin
.F.another_level_of_scope._46.if.exit.9:
  addi t4, t5, 1                                                        # ir inst 120 fin
# Phi connections
  mv t5, t4
  j .F.another_level_of_scope._42.while.cond.3                          # ir inst 121 fin
.F.another_level_of_scope._47.while.exit.3:
  addi t5, t6, 1                                                        # ir inst 122 fin
# Phi connections
  mv t6, t5
  j .F.another_level_of_scope._31.while.cond.1                          # ir inst 123 fin
.F.another_level_of_scope._48.while.exit.1:
  li t1, 1024
  mv t6, t1                                                             # ir inst 124 fin
  addi t5, t6, -50                                                      # ir inst 125 fin
# Start call preparation
  sd t5, 0(sp)
  mv a2, t5
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
  ld t5, 0(sp)
# ir inst 126 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 127 fin
  bnez t5, .F.another_level_of_scope._49.if.then.10
  j .F.another_level_of_scope._50.if.else.10                            # ir inst 128 fin
.F.another_level_of_scope._49.if.then.10:
# Start call preparation
  li a0, 7777
  call printlnInt
# ir inst 129 fin
  j .F.another_level_of_scope._51.if.exit.10                            # ir inst 130 fin
.F.another_level_of_scope._50.if.else.10:
# Start call preparation
  li a0, -7777
  call printlnInt
# ir inst 131 fin
  j .F.another_level_of_scope._51.if.exit.10                            # ir inst 132 fin
.F.another_level_of_scope._51.if.exit.10:
  li t1, 10
  li t2, 5
  slt t6, t2, t1                                                        # ir inst 133 fin
  bnez t6, .F.another_level_of_scope._52.if.then.11
  j .F.another_level_of_scope._53.if.else.11                            # ir inst 134 fin
.F.another_level_of_scope._52.if.then.11:
# Start call preparation
  li a0, 21
  call printlnInt
# ir inst 135 fin
  j .F.another_level_of_scope._54.if.exit.11                            # ir inst 136 fin
.F.another_level_of_scope._53.if.else.11:
  j .F.another_level_of_scope._54.if.exit.11                            # ir inst 137 fin
.F.another_level_of_scope._54.if.exit.11:
# Start call preparation
  li a0, 10
  call printlnInt
# ir inst 138 fin
# Start call preparation
  li a2, 1
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_malloc
  mv t6, a0
# ir inst 139 fin
# Start call preparation
  sd t6, 0(sp)
  mv a2, t6
  li t1, 4152
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.my_free
  ld t6, 0(sp)
# ir inst 140 fin
  j .F.another_level_of_scope.epilogue                                  # ir inst 141 fin
.F.another_level_of_scope.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 4176
  add sp, sp, t0
  ret
