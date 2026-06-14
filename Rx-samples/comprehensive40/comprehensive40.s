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

.globl .F.init_matrix
.F.init_matrix:
# spill func args num: 0,             range:     6448(sp) -     6448(sp)
# local var size: 6400,               range:       40(sp) -     6440(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6448
  add sp, sp, t0
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.init_matrix._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  li a2, 6400
  addi t1, sp, 40
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.init_matrix._1.while.cond.0                                      # ir inst 3 fin
.F.init_matrix._1.while.cond.0:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 5 fin
  bnez t5, .F.init_matrix._2.while.body.0
  j .F.init_matrix._6.while.exit.0                                      # ir inst 6 fin
.F.init_matrix._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.init_matrix._3.while.cond.1                                      # ir inst 7 fin
.F.init_matrix._3.while.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, .F.init_matrix._4.while.body.1
  j .F.init_matrix._5.while.exit.1                                      # ir inst 10 fin
.F.init_matrix._4.while.body.1:
  mv t4, t6                                                             # ir inst 11 fin
  li t1, 160
  mul t2, t4, t1
  addi t1, sp, 40
  add t3, t1, t2                                                        # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 14 fin
  li t2, 40
  mul t4, t6, t2                                                        # ir inst 15 fin
  add t3, t4, t5                                                        # ir inst 16 fin
  add t4, t3, a2                                                        # ir inst 17 fin
  li t2, 100
  rem t3, t4, t2                                                        # ir inst 18 fin
  sw t3, 0(s11)                                                         # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.init_matrix._3.while.cond.1                                      # ir inst 21 fin
.F.init_matrix._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 22 fin
# Phi connections
  mv t6, t5
  j .F.init_matrix._1.while.cond.0                                      # ir inst 23 fin
.F.init_matrix._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 6400
  addi t1, sp, 40
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 24 fin
  j .F.init_matrix.epilogue                                             # ir inst 25 fin
.F.init_matrix.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  li t0, 6448
  add sp, sp, t0
  ret

.globl .F.matrix_multiply
.F.matrix_multiply:
# spill func args num: 0,             range:     6656(sp) -     6656(sp)
# local var size: 6560,               range:       88(sp) -     6648(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 4 / 12,        range:       48(sp) -       80(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6656
  add sp, sp, t0
  sd s8, 48(sp)
  sd s9, 56(sp)
  sd s11, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
.F.matrix_multiply._0.entry.0:
  li t1, 6488
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.matrix_multiply._1.array.cond.0                                  # ir inst 4 fin
.F.matrix_multiply._1.array.cond.0:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.matrix_multiply._2.array.body.0
  j .F.matrix_multiply._3.array.exit.0                                  # ir inst 7 fin
.F.matrix_multiply._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.matrix_multiply._1.array.cond.0                                  # ir inst 11 fin
.F.matrix_multiply._3.array.exit.0:
  addi t1, sp, 88
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.matrix_multiply._4.array.cond.1                                  # ir inst 13 fin
.F.matrix_multiply._4.array.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.matrix_multiply._5.array.body.1
  j .F.matrix_multiply._6.array.exit.1                                  # ir inst 16 fin
.F.matrix_multiply._5.array.body.1:
  li t1, 160
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  li a2, 160
  li t1, 6488
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.matrix_multiply._4.array.cond.1                                  # ir inst 20 fin
.F.matrix_multiply._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F.matrix_multiply._7.while.cond.0                                  # ir inst 21 fin
.F.matrix_multiply._7.while.cond.0:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 23 fin
  bnez t5, .F.matrix_multiply._8.while.body.0
  j .F.matrix_multiply._15.while.exit.0                                 # ir inst 24 fin
.F.matrix_multiply._8.while.body.0:
# Phi connections
  li t5, 0
  j .F.matrix_multiply._9.while.cond.1                                  # ir inst 25 fin
.F.matrix_multiply._9.while.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.matrix_multiply._10.while.body.1
  j .F.matrix_multiply._14.while.exit.1                                 # ir inst 28 fin
.F.matrix_multiply._10.while.body.1:
# Phi connections
  li t3, 0
  li t4, 0
  j .F.matrix_multiply._11.while.cond.2                                 # ir inst 29 fin
.F.matrix_multiply._11.while.cond.2:
  li t2, 40
  slt s11, t3, t2                                                       # ir inst 32 fin
  bnez s11, .F.matrix_multiply._12.while.body.2
  j .F.matrix_multiply._13.while.exit.2                                 # ir inst 33 fin
.F.matrix_multiply._12.while.body.2:
  mv s11, t6                                                            # ir inst 34 fin
  li t1, 160
  mul t2, s11, t1
  add s10, a1, t2                                                       # ir inst 35 fin
  mv s11, t3                                                            # ir inst 36 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 37 fin
  lw s11, 0(s9)                                                         # ir inst 38 fin
  mv s10, t3                                                            # ir inst 39 fin
  li t1, 160
  mul t2, s10, t1
  add s9, a2, t2                                                        # ir inst 40 fin
  mv s10, t5                                                            # ir inst 41 fin
  slli t2, s10, 2
  add s8, s9, t2                                                        # ir inst 42 fin
  lw s10, 0(s8)                                                         # ir inst 43 fin
  mul s9, s11, s10                                                      # ir inst 44 fin
  add s11, t4, s9                                                       # ir inst 45 fin
  addi s10, t3, 1                                                       # ir inst 46 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.matrix_multiply._11.while.cond.2                                 # ir inst 47 fin
.F.matrix_multiply._13.while.exit.2:
  mv t3, t6                                                             # ir inst 48 fin
  li t1, 160
  mul t2, t3, t1
  addi t1, sp, 88
  add s11, t1, t2                                                       # ir inst 49 fin
  mv t3, t5                                                             # ir inst 50 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 51 fin
  sw t4, 0(s10)                                                         # ir inst 52 fin
  addi t4, t5, 1                                                        # ir inst 53 fin
# Phi connections
  mv t5, t4
  j .F.matrix_multiply._9.while.cond.1                                  # ir inst 54 fin
.F.matrix_multiply._14.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 55 fin
# Phi connections
  mv t6, t5
  j .F.matrix_multiply._7.while.cond.0                                  # ir inst 56 fin
.F.matrix_multiply._15.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 6400
  addi t1, sp, 88
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 57 fin
  j .F.matrix_multiply.epilogue                                         # ir inst 58 fin
.F.matrix_multiply.epilogue:
  ld ra, 80(sp)
  ld s8, 48(sp)
  ld s9, 56(sp)
  ld s11, 64(sp)
  ld s10, 72(sp)
  li t0, 6656
  add sp, sp, t0
  ret

.globl .F.apply_stencil
.F.apply_stencil:
# spill func args num: 0,             range:     6624(sp) -     6624(sp)
# local var size: 6560,               range:       64(sp) -     6624(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6624
  add sp, sp, t0
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.apply_stencil._0.entry.0:
  li t1, 6464
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.apply_stencil._1.array.cond.0                                    # ir inst 4 fin
.F.apply_stencil._1.array.cond.0:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.apply_stencil._2.array.body.0
  j .F.apply_stencil._3.array.exit.0                                    # ir inst 7 fin
.F.apply_stencil._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.apply_stencil._1.array.cond.0                                    # ir inst 11 fin
.F.apply_stencil._3.array.exit.0:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.apply_stencil._4.array.cond.1                                    # ir inst 13 fin
.F.apply_stencil._4.array.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.apply_stencil._5.array.body.1
  j .F.apply_stencil._6.array.exit.1                                    # ir inst 16 fin
.F.apply_stencil._5.array.body.1:
  li t1, 160
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 160
  li t1, 6464
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.apply_stencil._4.array.cond.1                                    # ir inst 20 fin
.F.apply_stencil._6.array.exit.1:
# Phi connections
  li t6, 1
  j .F.apply_stencil._7.while.cond.0                                    # ir inst 21 fin
.F.apply_stencil._7.while.cond.0:
  li t2, 39
  slt t5, t6, t2                                                        # ir inst 23 fin
  bnez t5, .F.apply_stencil._8.while.body.0
  j .F.apply_stencil._12.while.exit.0                                   # ir inst 24 fin
.F.apply_stencil._8.while.body.0:
# Phi connections
  li t5, 1
  j .F.apply_stencil._9.while.cond.1                                    # ir inst 25 fin
.F.apply_stencil._9.while.cond.1:
  li t2, 39
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.apply_stencil._10.while.body.1
  j .F.apply_stencil._11.while.exit.1                                   # ir inst 28 fin
.F.apply_stencil._10.while.body.1:
  mv t4, t6                                                             # ir inst 29 fin
  addi t3, t4, -1                                                       # ir inst 30 fin
  li t1, 160
  mul t2, t3, t1
  add t4, a1, t2                                                        # ir inst 31 fin
  mv t3, t5                                                             # ir inst 32 fin
  addi s11, t3, -1                                                      # ir inst 33 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 34 fin
  lw t4, 0(t3)                                                          # ir inst 35 fin
  mv t3, t6                                                             # ir inst 36 fin
  addi s11, t3, -1                                                      # ir inst 37 fin
  li t1, 160
  mul t2, s11, t1
  add t3, a1, t2                                                        # ir inst 38 fin
  mv s11, t5                                                            # ir inst 39 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 40 fin
  lw t3, 0(s10)                                                         # ir inst 41 fin
  add s11, t4, t3                                                       # ir inst 42 fin
  mv t4, t6                                                             # ir inst 43 fin
  addi t3, t4, -1                                                       # ir inst 44 fin
  li t1, 160
  mul t2, t3, t1
  add t4, a1, t2                                                        # ir inst 45 fin
  mv t3, t5                                                             # ir inst 46 fin
  addi s10, t3, 1                                                       # ir inst 47 fin
  slli t2, s10, 2
  add t3, t4, t2                                                        # ir inst 48 fin
  lw t4, 0(t3)                                                          # ir inst 49 fin
  add t3, s11, t4                                                       # ir inst 50 fin
  mv t4, t6                                                             # ir inst 51 fin
  li t1, 160
  mul t2, t4, t1
  add s11, a1, t2                                                       # ir inst 52 fin
  mv t4, t5                                                             # ir inst 53 fin
  addi s10, t4, -1                                                      # ir inst 54 fin
  slli t2, s10, 2
  add t4, s11, t2                                                       # ir inst 55 fin
  lw s11, 0(t4)                                                         # ir inst 56 fin
  add t4, t3, s11                                                       # ir inst 57 fin
  mv t3, t6                                                             # ir inst 58 fin
  li t1, 160
  mul t2, t3, t1
  add s11, a1, t2                                                       # ir inst 59 fin
  mv t3, t5                                                             # ir inst 60 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 61 fin
  lw t3, 0(s10)                                                         # ir inst 62 fin
  li t2, -8
  mul s11, t3, t2                                                       # ir inst 63 fin
  add t3, t4, s11                                                       # ir inst 64 fin
  mv t4, t6                                                             # ir inst 65 fin
  li t1, 160
  mul t2, t4, t1
  add s11, a1, t2                                                       # ir inst 66 fin
  mv t4, t5                                                             # ir inst 67 fin
  addi s10, t4, 1                                                       # ir inst 68 fin
  slli t2, s10, 2
  add t4, s11, t2                                                       # ir inst 69 fin
  lw s11, 0(t4)                                                         # ir inst 70 fin
  add t4, t3, s11                                                       # ir inst 71 fin
  mv t3, t6                                                             # ir inst 72 fin
  addi s11, t3, 1                                                       # ir inst 73 fin
  li t1, 160
  mul t2, s11, t1
  add t3, a1, t2                                                        # ir inst 74 fin
  mv s11, t5                                                            # ir inst 75 fin
  addi s10, s11, -1                                                     # ir inst 76 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 77 fin
  lw t3, 0(s11)                                                         # ir inst 78 fin
  add s11, t4, t3                                                       # ir inst 79 fin
  mv t4, t6                                                             # ir inst 80 fin
  addi t3, t4, 1                                                        # ir inst 81 fin
  li t1, 160
  mul t2, t3, t1
  add t4, a1, t2                                                        # ir inst 82 fin
  mv t3, t5                                                             # ir inst 83 fin
  slli t2, t3, 2
  add s10, t4, t2                                                       # ir inst 84 fin
  lw t4, 0(s10)                                                         # ir inst 85 fin
  add t3, s11, t4                                                       # ir inst 86 fin
  mv t4, t6                                                             # ir inst 87 fin
  addi s11, t4, 1                                                       # ir inst 88 fin
  li t1, 160
  mul t2, s11, t1
  add t4, a1, t2                                                        # ir inst 89 fin
  mv s11, t5                                                            # ir inst 90 fin
  addi s10, s11, 1                                                      # ir inst 91 fin
  slli t2, s10, 2
  add s11, t4, t2                                                       # ir inst 92 fin
  lw t4, 0(s11)                                                         # ir inst 93 fin
  add s11, t3, t4                                                       # ir inst 94 fin
  mv t4, t6                                                             # ir inst 95 fin
  li t1, 160
  mul t2, t4, t1
  addi t1, sp, 64
  add t3, t1, t2                                                        # ir inst 96 fin
  mv t4, t5                                                             # ir inst 97 fin
  slli t2, t4, 2
  add s10, t3, t2                                                       # ir inst 98 fin
  li t2, 3
  div t4, s11, t2                                                       # ir inst 99 fin
  sw t4, 0(s10)                                                         # ir inst 100 fin
  addi t4, t5, 1                                                        # ir inst 101 fin
# Phi connections
  mv t5, t4
  j .F.apply_stencil._9.while.cond.1                                    # ir inst 102 fin
.F.apply_stencil._11.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 103 fin
# Phi connections
  mv t6, t5
  j .F.apply_stencil._7.while.cond.0                                    # ir inst 104 fin
.F.apply_stencil._12.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 6400
  addi t1, sp, 64
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 105 fin
  j .F.apply_stencil.epilogue                                           # ir inst 106 fin
.F.apply_stencil.epilogue:
  ld ra, 56(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  li t0, 6624
  add sp, sp, t0
  ret

.globl .F.transpose_and_add
.F.transpose_and_add:
# spill func args num: 0,             range:     6448(sp) -     6448(sp)
# local var size: 6400,               range:       48(sp) -     6448(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 3 / 12,        range:       16(sp) -       40(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6448
  add sp, sp, t0
  sd s10, 16(sp)
  sd s9, 24(sp)
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.transpose_and_add._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  li a2, 6400
  addi t1, sp, 48
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.transpose_and_add._1.while.cond.0                                # ir inst 3 fin
.F.transpose_and_add._1.while.cond.0:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 5 fin
  bnez t5, .F.transpose_and_add._2.while.body.0
  j .F.transpose_and_add._6.while.exit.0                                # ir inst 6 fin
.F.transpose_and_add._2.while.body.0:
# Phi connections
  mv t5, t6
  j .F.transpose_and_add._3.while.cond.1                                # ir inst 7 fin
.F.transpose_and_add._3.while.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, .F.transpose_and_add._4.while.body.1
  j .F.transpose_and_add._5.while.exit.1                                # ir inst 10 fin
.F.transpose_and_add._4.while.body.1:
  mv t4, t6                                                             # ir inst 11 fin
  li t1, 160
  mul t2, t4, t1
  addi t1, sp, 48
  add t3, t1, t2                                                        # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 14 fin
  lw t4, 0(s11)                                                         # ir inst 15 fin
  mv t3, t6                                                             # ir inst 16 fin
  li t1, 160
  mul t2, t3, t1
  addi t1, sp, 48
  add s11, t1, t2                                                       # ir inst 17 fin
  mv t3, t5                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 19 fin
  mv t3, t5                                                             # ir inst 20 fin
  li t1, 160
  mul t2, t3, t1
  addi t1, sp, 48
  add s11, t1, t2                                                       # ir inst 21 fin
  mv t3, t6                                                             # ir inst 22 fin
  slli t2, t3, 2
  add s9, s11, t2                                                       # ir inst 23 fin
  lw t3, 0(s9)                                                          # ir inst 24 fin
  add s11, t3, t4                                                       # ir inst 25 fin
  sw s11, 0(s10)                                                        # ir inst 26 fin
  mv t3, t5                                                             # ir inst 27 fin
  li t1, 160
  mul t2, t3, t1
  addi t1, sp, 48
  add s11, t1, t2                                                       # ir inst 28 fin
  mv t3, t6                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 30 fin
  mv t3, t5                                                             # ir inst 31 fin
  li t1, 160
  mul t2, t3, t1
  addi t1, sp, 48
  add s11, t1, t2                                                       # ir inst 32 fin
  mv t3, t6                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s9, s11, t2                                                       # ir inst 34 fin
  lw t3, 0(s9)                                                          # ir inst 35 fin
  add s11, t4, t3                                                       # ir inst 36 fin
  sw s11, 0(s10)                                                        # ir inst 37 fin
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t4
  j .F.transpose_and_add._3.while.cond.1                                # ir inst 39 fin
.F.transpose_and_add._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t6, t5
  j .F.transpose_and_add._1.while.cond.0                                # ir inst 41 fin
.F.transpose_and_add._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 6400
  addi t1, sp, 48
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 42 fin
  j .F.transpose_and_add.epilogue                                       # ir inst 43 fin
.F.transpose_and_add.epilogue:
  ld ra, 40(sp)
  ld s10, 16(sp)
  ld s9, 24(sp)
  ld s11, 32(sp)
  li t0, 6448
  add sp, sp, t0
  ret

.globl .F.sub_matrix_sum
.F.sub_matrix_sum:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s11, 16(sp)
.F.sub_matrix_sum._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.sub_matrix_sum._1.while.cond.0                                   # ir inst 1 fin
.F.sub_matrix_sum._1.while.cond.0:
  li t2, 20
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.sub_matrix_sum._2.while.body.0
  j .F.sub_matrix_sum._6.while.exit.0                                   # ir inst 5 fin
.F.sub_matrix_sum._2.while.body.0:
# Phi connections
  mv t3, t5
  li t4, 0
  j .F.sub_matrix_sum._3.while.cond.1                                   # ir inst 6 fin
.F.sub_matrix_sum._3.while.cond.1:
  li t2, 20
  slt s11, t4, t2                                                       # ir inst 9 fin
  bnez s11, .F.sub_matrix_sum._4.while.body.1
  j .F.sub_matrix_sum._5.while.exit.1                                   # ir inst 10 fin
.F.sub_matrix_sum._4.while.body.1:
  mv s11, t6                                                            # ir inst 11 fin
  li t1, 160
  mul t2, s11, t1
  add s10, a0, t2                                                       # ir inst 12 fin
  mv s11, t4                                                            # ir inst 13 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 14 fin
  lw s11, 0(s9)                                                         # ir inst 15 fin
  add s10, t3, s11                                                      # ir inst 16 fin
  addi s11, t4, 1                                                       # ir inst 17 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.sub_matrix_sum._3.while.cond.1                                   # ir inst 18 fin
.F.sub_matrix_sum._5.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.sub_matrix_sum._1.while.cond.0                                   # ir inst 20 fin
.F.sub_matrix_sum._6.while.exit.0:
# Phi connections
  li t6, 20
  j .F.sub_matrix_sum._7.while.cond.2                                   # ir inst 21 fin
.F.sub_matrix_sum._7.while.cond.2:
  li t2, 40
  slt t4, t6, t2                                                        # ir inst 24 fin
  bnez t4, .F.sub_matrix_sum._8.while.body.2
  j .F.sub_matrix_sum._12.while.exit.2                                  # ir inst 25 fin
.F.sub_matrix_sum._8.while.body.2:
# Phi connections
  mv t3, t5
  li t4, 20
  j .F.sub_matrix_sum._9.while.cond.3                                   # ir inst 26 fin
.F.sub_matrix_sum._9.while.cond.3:
  li t2, 40
  slt s11, t4, t2                                                       # ir inst 29 fin
  bnez s11, .F.sub_matrix_sum._10.while.body.3
  j .F.sub_matrix_sum._11.while.exit.3                                  # ir inst 30 fin
.F.sub_matrix_sum._10.while.body.3:
  mv s11, t6                                                            # ir inst 31 fin
  li t1, 160
  mul t2, s11, t1
  add s10, a0, t2                                                       # ir inst 32 fin
  mv s11, t4                                                            # ir inst 33 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 34 fin
  lw s11, 0(s9)                                                         # ir inst 35 fin
  add s10, t3, s11                                                      # ir inst 36 fin
  addi s11, t4, 1                                                       # ir inst 37 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.sub_matrix_sum._9.while.cond.3                                   # ir inst 38 fin
.F.sub_matrix_sum._11.while.exit.3:
  addi t4, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.sub_matrix_sum._7.while.cond.2                                   # ir inst 40 fin
.F.sub_matrix_sum._12.while.exit.2:
  mv a0, t5
  j .F.sub_matrix_sum.epilogue                                          # ir inst 41 fin
.F.sub_matrix_sum.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.diagonal_processing
.F.diagonal_processing:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.diagonal_processing._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.diagonal_processing._1.while.cond.0                              # ir inst 1 fin
.F.diagonal_processing._1.while.cond.0:
  li t2, 40
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.diagonal_processing._2.while.body.0
  j .F.diagonal_processing._6.while.exit.0                              # ir inst 5 fin
.F.diagonal_processing._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  li t1, 160
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 9 fin
  lw t4, 0(s11)                                                         # ir inst 10 fin
  li t2, 50
  slt t3, t2, t4                                                        # ir inst 11 fin
  bnez t3, .F.diagonal_processing._3.if.then.0
  j .F.diagonal_processing._4.if.else.0                                 # ir inst 12 fin
.F.diagonal_processing._3.if.then.0:
  mv t4, t6                                                             # ir inst 13 fin
  li t1, 160
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 14 fin
  li t1, 39
  sub t4, t1, t6                                                        # ir inst 15 fin
  mv s11, t4                                                            # ir inst 16 fin
  slli t2, s11, 2
  add t4, t3, t2                                                        # ir inst 17 fin
  lw t3, 0(t4)                                                          # ir inst 18 fin
  add t4, t5, t3                                                        # ir inst 19 fin
# Phi connections
  j .F.diagonal_processing._5.if.exit.0                                 # ir inst 20 fin
.F.diagonal_processing._4.if.else.0:
  mv t4, t6                                                             # ir inst 21 fin
  li t1, 160
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 22 fin
  mv t4, t6                                                             # ir inst 23 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 24 fin
  lw t4, 0(s11)                                                         # ir inst 25 fin
  sub t3, t5, t4                                                        # ir inst 26 fin
# Phi connections
  mv t4, t3
  j .F.diagonal_processing._5.if.exit.0                                 # ir inst 27 fin
.F.diagonal_processing._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.diagonal_processing._1.while.cond.0                              # ir inst 30 fin
.F.diagonal_processing._6.while.exit.0:
  mv a0, t5
  j .F.diagonal_processing.epilogue                                     # ir inst 31 fin
.F.diagonal_processing.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl main
main:
# spill func args num: 0,             range:   141184(sp) -   141184(sp)
# local var size: 141120,             range:       56(sp) -   141176(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 3 / 12,        range:       24(sp) -       48(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -141184
  add sp, sp, t0
  sd s9, 24(sp)
  sd s11, 32(sp)
  sd s10, 40(sp)
  sd ra, 48(sp)
main._0.entry.0:
  li t1, 89656
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 16 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 17 fin
main._1.array.cond.0:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 19 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 20 fin
main._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 22 fin
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j main._1.array.cond.0                                                # ir inst 24 fin
main._3.array.exit.0:
  li t1, 83256
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 25 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 26 fin
main._4.array.cond.1:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 28 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 29 fin
main._5.array.body.1:
  li t1, 160
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 30 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 160
  li t1, 89656
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 31 fin
  addi t4, t5, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 33 fin
main._6.array.exit.1:
  li t1, 96216
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 36 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 37 fin
main._7.array.cond.2:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 39 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 40 fin
main._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 41 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 42 fin
  addi t4, t5, 1                                                        # ir inst 43 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 44 fin
main._9.array.exit.2:
  li t1, 89816
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 45 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 46 fin
main._10.array.cond.3:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 48 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 49 fin
main._11.array.body.3:
  li t1, 160
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 50 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 160
  li t1, 96216
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 51 fin
  addi t4, t5, 1                                                        # ir inst 52 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 53 fin
main._12.array.exit.3:
# Start call preparation
  li a2, 6400
  li t1, 83256
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call memcpy
# ir inst 55 fin
# Start call preparation
  li a2, 123
  addi t1, sp, 56
  mv a1, t1
  li t1, 96376
  add t1, sp, t1
  mv a0, t1
  call .F.init_matrix
# ir inst 56 fin
# Start call preparation
  li a2, 6400
  li t1, 96376
  add t1, sp, t1
  mv a1, t1
  li t1, 83256
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 57 fin
# Start call preparation
  li a2, 6400
  li t1, 89816
  add t1, sp, t1
  mv a1, t1
  li t1, 6456
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 59 fin
# Start call preparation
  li a2, 456
  li t1, 6456
  add t1, sp, t1
  mv a1, t1
  li t1, 102776
  add t1, sp, t1
  mv a0, t1
  call .F.init_matrix
# ir inst 60 fin
# Start call preparation
  li a2, 6400
  li t1, 102776
  add t1, sp, t1
  mv a1, t1
  li t1, 89816
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 61 fin
# Start call preparation
  li a2, 6400
  li t1, 83256
  add t1, sp, t1
  mv a1, t1
  li t1, 12856
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 63 fin
# Start call preparation
  li a2, 6400
  li t1, 89816
  add t1, sp, t1
  mv a1, t1
  li t1, 19256
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 64 fin
# Start call preparation
  li t1, 19256
  add t1, sp, t1
  mv a2, t1
  li t1, 12856
  add t1, sp, t1
  mv a1, t1
  li t1, 109176
  add t1, sp, t1
  mv a0, t1
  call .F.matrix_multiply
# ir inst 65 fin
# Phi connections
  li t6, 0
  j main._13.while.cond.0                                               # ir inst 66 fin
main._13.while.cond.0:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 68 fin
  bnez t5, main._14.while.body.0
  j main._15.while.exit.0                                               # ir inst 69 fin
main._14.while.body.0:
# Start call preparation
  sd t6, 0(sp)
  li a2, 6400
  li t1, 109176
  add t1, sp, t1
  mv a1, t1
  li t1, 25656
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 71 fin
# Start call preparation
  sd t6, 0(sp)
  li t1, 25656
  add t1, sp, t1
  mv a1, t1
  li t1, 115576
  add t1, sp, t1
  mv a0, t1
  call .F.apply_stencil
  ld t6, 0(sp)
# ir inst 72 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 6400
  li t1, 115576
  add t1, sp, t1
  mv a1, t1
  li t1, 109176
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 73 fin
  addi t5, t6, 1                                                        # ir inst 74 fin
# Phi connections
  mv t6, t5
  j main._13.while.cond.0                                               # ir inst 75 fin
main._15.while.exit.0:
# Start call preparation
  li a2, 6400
  li t1, 109176
  add t1, sp, t1
  mv a1, t1
  li t1, 32056
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 76 fin
# Start call preparation
  li t1, 32056
  add t1, sp, t1
  mv a0, t1
  call .F.sub_matrix_sum
  mv t6, a0
# ir inst 77 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 78 fin
# Start call preparation
  li a2, 6400
  li t1, 109176
  add t1, sp, t1
  mv a1, t1
  li t1, 38456
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 79 fin
# Start call preparation
  li t1, 38456
  add t1, sp, t1
  mv a0, t1
  call .F.diagonal_processing
  mv t6, a0
# ir inst 80 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 81 fin
# Start call preparation
  li a2, 6400
  li t1, 109176
  add t1, sp, t1
  mv a1, t1
  li t1, 44856
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 83 fin
# Start call preparation
  li t1, 44856
  add t1, sp, t1
  mv a1, t1
  li t1, 121976
  add t1, sp, t1
  mv a0, t1
  call .F.transpose_and_add
# ir inst 84 fin
# Start call preparation
  li a2, 6400
  li t1, 121976
  add t1, sp, t1
  mv a1, t1
  li t1, 51256
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 85 fin
# Start call preparation
  li t1, 51256
  add t1, sp, t1
  mv a0, t1
  call .F.sub_matrix_sum
  mv t6, a0
# ir inst 86 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 87 fin
# Start call preparation
  li a2, 6400
  li t1, 121976
  add t1, sp, t1
  mv a1, t1
  li t1, 57656
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 88 fin
# Start call preparation
  li t1, 57656
  add t1, sp, t1
  mv a0, t1
  call .F.diagonal_processing
  mv t6, a0
# ir inst 89 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 90 fin
# Start call preparation
  li a2, 6400
  li t1, 121976
  add t1, sp, t1
  mv a1, t1
  li t1, 64056
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 92 fin
# Start call preparation
  li a2, 6400
  li t1, 83256
  add t1, sp, t1
  mv a1, t1
  li t1, 70456
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 93 fin
# Start call preparation
  li t1, 70456
  add t1, sp, t1
  mv a2, t1
  li t1, 64056
  add t1, sp, t1
  mv a1, t1
  li t1, 128376
  add t1, sp, t1
  mv a0, t1
  call .F.matrix_multiply
# ir inst 94 fin
# Start call preparation
  li a2, 6400
  li t1, 128376
  add t1, sp, t1
  mv a1, t1
  li t1, 76856
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 95 fin
# Start call preparation
  li t1, 76856
  add t1, sp, t1
  mv a0, t1
  call .F.sub_matrix_sum
  mv t6, a0
# ir inst 96 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 97 fin
# Phi connections
  li t5, 0
  li t6, 0
  j main._16.while.cond.1                                               # ir inst 98 fin
main._16.while.cond.1:
  li t2, 40
  slt t4, t6, t2                                                        # ir inst 101 fin
  bnez t4, main._17.while.body.1
  j main._24.while.exit.1                                               # ir inst 102 fin
main._17.while.body.1:
# Phi connections
  li t3, 0
  mv t4, t5
  j main._18.while.cond.2                                               # ir inst 103 fin
main._18.while.cond.2:
  li t2, 40
  slt s11, t3, t2                                                       # ir inst 106 fin
  bnez s11, main._19.while.body.2
  j main._23.while.exit.2                                               # ir inst 107 fin
main._19.while.body.2:
  add s11, t6, t3                                                       # ir inst 108 fin
  li t2, 2
  rem s10, s11, t2                                                      # ir inst 109 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s11, t0, 1                                                      # ir inst 110 fin
  bnez s11, main._20.if.then.0
  j main._21.if.else.0                                                  # ir inst 111 fin
main._20.if.then.0:
  mv s11, t6                                                            # ir inst 112 fin
  li t1, 160
  mul t2, s11, t1
  li t1, 128376
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 113 fin
  mv s11, t3                                                            # ir inst 114 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 115 fin
  lw s11, 0(s9)                                                         # ir inst 116 fin
  add s10, t4, s11                                                      # ir inst 117 fin
# Phi connections
  mv s11, s10
  j main._22.if.exit.0                                                  # ir inst 118 fin
main._21.if.else.0:
  mv s11, t6                                                            # ir inst 119 fin
  li t1, 160
  mul t2, s11, t1
  li t1, 128376
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 120 fin
  mv s11, t3                                                            # ir inst 121 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 122 fin
  lw s11, 0(s9)                                                         # ir inst 123 fin
  sub s10, t4, s11                                                      # ir inst 124 fin
# Phi connections
  mv s11, s10
  j main._22.if.exit.0                                                  # ir inst 125 fin
main._22.if.exit.0:
  addi s10, t3, 1                                                       # ir inst 127 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j main._18.while.cond.2                                               # ir inst 128 fin
main._23.while.exit.2:
  addi t3, t6, 1                                                        # ir inst 129 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j main._16.while.cond.1                                               # ir inst 130 fin
main._24.while.exit.1:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 131 fin
# Phi connections
  li t6, 0
  j main._25.while.cond.3                                               # ir inst 132 fin
main._25.while.cond.3:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 134 fin
  bnez t5, main._26.while.body.3
  j main._33.while.exit.3                                               # ir inst 135 fin
main._26.while.body.3:
# Phi connections
  li t4, -999999
  li t5, 0
  j main._27.while.cond.4                                               # ir inst 136 fin
main._27.while.cond.4:
  li t2, 40
  slt t3, t5, t2                                                        # ir inst 139 fin
  bnez t3, main._28.while.body.4
  j main._32.while.exit.4                                               # ir inst 140 fin
main._28.while.body.4:
  mv t3, t6                                                             # ir inst 141 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 128376
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 142 fin
  mv t3, t5                                                             # ir inst 143 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 144 fin
  lw t3, 0(s10)                                                         # ir inst 145 fin
  slt s11, t4, t3                                                       # ir inst 146 fin
  bnez s11, main._29.if.then.1
  j main._30.if.else.1                                                  # ir inst 147 fin
main._29.if.then.1:
  mv t3, t6                                                             # ir inst 148 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 128376
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 149 fin
  mv t3, t5                                                             # ir inst 150 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 151 fin
  lw t3, 0(s10)                                                         # ir inst 152 fin
# Phi connections
  j main._31.if.exit.1                                                  # ir inst 153 fin
main._30.if.else.1:
# Phi connections
  mv t3, t4
  j main._31.if.exit.1                                                  # ir inst 154 fin
main._31.if.exit.1:
  addi s11, t5, 1                                                       # ir inst 156 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._27.while.cond.4                                               # ir inst 157 fin
main._32.while.exit.4:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 158 fin
  addi t5, t6, 1                                                        # ir inst 159 fin
# Phi connections
  mv t6, t5
  j main._25.while.cond.3                                               # ir inst 160 fin
main._33.while.exit.3:
# Phi connections
  li t6, 0
  j main._34.while.cond.5                                               # ir inst 161 fin
main._34.while.cond.5:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 163 fin
  bnez t5, main._35.while.body.5
  j main._42.while.exit.5                                               # ir inst 164 fin
main._35.while.body.5:
# Phi connections
  li t4, 999999
  li t5, 0
  j main._36.while.cond.6                                               # ir inst 165 fin
main._36.while.cond.6:
  li t2, 40
  slt t3, t5, t2                                                        # ir inst 168 fin
  bnez t3, main._37.while.body.6
  j main._41.while.exit.6                                               # ir inst 169 fin
main._37.while.body.6:
  mv t3, t5                                                             # ir inst 170 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 128376
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 171 fin
  mv t3, t6                                                             # ir inst 172 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 173 fin
  lw t3, 0(s10)                                                         # ir inst 174 fin
  slt s11, t3, t4                                                       # ir inst 175 fin
  bnez s11, main._38.if.then.2
  j main._39.if.else.2                                                  # ir inst 176 fin
main._38.if.then.2:
  mv t3, t5                                                             # ir inst 177 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 128376
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 178 fin
  mv t3, t6                                                             # ir inst 179 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 180 fin
  lw t3, 0(s10)                                                         # ir inst 181 fin
# Phi connections
  j main._40.if.exit.2                                                  # ir inst 182 fin
main._39.if.else.2:
# Phi connections
  mv t3, t4
  j main._40.if.exit.2                                                  # ir inst 183 fin
main._40.if.exit.2:
  addi s11, t5, 1                                                       # ir inst 185 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._36.while.cond.6                                               # ir inst 186 fin
main._41.while.exit.6:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 187 fin
  addi t5, t6, 1                                                        # ir inst 188 fin
# Phi connections
  mv t6, t5
  j main._34.while.cond.5                                               # ir inst 189 fin
main._42.while.exit.5:
# Start call preparation
  li a2, 6400
  li t1, 83256
  add t1, sp, t1
  mv a1, t1
  li t1, 134776
  add t1, sp, t1
  mv a0, t1
  call memcpy
# ir inst 191 fin
# Phi connections
  li t6, 0
  j main._43.while.cond.7                                               # ir inst 192 fin
main._43.while.cond.7:
  li t2, 40
  slt t5, t6, t2                                                        # ir inst 194 fin
  bnez t5, main._44.while.body.7
  j main._48.while.exit.7                                               # ir inst 195 fin
main._44.while.body.7:
# Phi connections
  li t5, 0
  j main._45.while.cond.8                                               # ir inst 196 fin
main._45.while.cond.8:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 198 fin
  bnez t4, main._46.while.body.8
  j main._47.while.exit.8                                               # ir inst 199 fin
main._46.while.body.8:
  mv t4, t6                                                             # ir inst 200 fin
  li t1, 160
  mul t2, t4, t1
  li t1, 134776
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 201 fin
  mv t4, t5                                                             # ir inst 202 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 203 fin
  lw t4, 0(s11)                                                         # ir inst 204 fin
  mv t3, t6                                                             # ir inst 205 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 134776
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 206 fin
  mv t3, t5                                                             # ir inst 207 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 208 fin
  mv t3, t5                                                             # ir inst 209 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 134776
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 210 fin
  mv t3, t6                                                             # ir inst 211 fin
  slli t2, t3, 2
  add s9, s11, t2                                                       # ir inst 212 fin
  lw t3, 0(s9)                                                          # ir inst 213 fin
  sw t3, 0(s10)                                                         # ir inst 214 fin
  mv t3, t5                                                             # ir inst 215 fin
  li t1, 160
  mul t2, t3, t1
  li t1, 134776
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 216 fin
  mv t3, t6                                                             # ir inst 217 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 218 fin
  sw t4, 0(s10)                                                         # ir inst 219 fin
  addi t4, t5, 1                                                        # ir inst 220 fin
# Phi connections
  mv t5, t4
  j main._45.while.cond.8                                               # ir inst 221 fin
main._47.while.exit.8:
  addi t5, t6, 1                                                        # ir inst 222 fin
# Phi connections
  mv t6, t5
  j main._43.while.cond.7                                               # ir inst 223 fin
main._48.while.exit.7:
# Phi connections
  li t5, 0
  li t6, 0
  j main._49.while.cond.9                                               # ir inst 224 fin
main._49.while.cond.9:
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 227 fin
  bnez t4, main._50.while.body.9
  j main._54.while.exit.9                                               # ir inst 228 fin
main._50.while.body.9:
# Phi connections
  li t3, 0
  mv t4, t6
  j main._51.while.cond.10                                              # ir inst 229 fin
main._51.while.cond.10:
  li t2, 40
  slt s11, t3, t2                                                       # ir inst 232 fin
  bnez s11, main._52.while.body.10
  j main._53.while.exit.10                                              # ir inst 233 fin
main._52.while.body.10:
  mv s11, t5                                                            # ir inst 234 fin
  li t1, 160
  mul t2, s11, t1
  li t1, 134776
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 235 fin
  mv s11, t3                                                            # ir inst 236 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 237 fin
  lw s11, 0(s9)                                                         # ir inst 238 fin
  add s10, t4, s11                                                      # ir inst 239 fin
  addi s11, t3, 1                                                       # ir inst 240 fin
# Phi connections
  mv t3, s11
  mv t4, s10
  j main._51.while.cond.10                                              # ir inst 241 fin
main._53.while.exit.10:
  addi t3, t5, 1                                                        # ir inst 242 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j main._49.while.cond.9                                               # ir inst 243 fin
main._54.while.exit.9:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 244 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 245 fin
  j main.epilogue                                                       # ir inst 246 fin
main.epilogue:
  ld ra, 48(sp)
  ld s9, 24(sp)
  ld s11, 32(sp)
  ld s10, 40(sp)
  li t0, 141184
  add sp, sp, t0
  ret
