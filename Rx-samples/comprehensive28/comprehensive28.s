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
# spill func args num: 0,             range:     4864(sp) -     4864(sp)
# local var size: 4800,               range:       56(sp) -     4856(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4864
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
main._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 200
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
  addi t1, sp, 856
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 16 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 20 fin
main._6.array.exit.1:
  addi t1, sp, 1656
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 23 fin
main._7.array.cond.2:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 26 fin
main._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 30 fin
main._9.array.exit.2:
  li t1, 2456
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 32 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 33 fin
main._10.array.cond.3:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 35 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 36 fin
main._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 37 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 38 fin
  addi t4, t5, 1                                                        # ir inst 39 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 40 fin
main._12.array.exit.3:
  li t1, 3256
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 42 fin
# Phi connections
  li t5, 0
  j main._13.array.cond.4                                               # ir inst 43 fin
main._13.array.cond.4:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 45 fin
  bnez t4, main._14.array.body.4
  j main._15.array.exit.4                                               # ir inst 46 fin
main._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 47 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 48 fin
  addi t4, t5, 1                                                        # ir inst 49 fin
# Phi connections
  mv t5, t4
  j main._13.array.cond.4                                               # ir inst 50 fin
main._15.array.exit.4:
  li t1, 4056
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 52 fin
# Phi connections
  li t5, 0
  j main._16.array.cond.5                                               # ir inst 53 fin
main._16.array.cond.5:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 55 fin
  bnez t4, main._17.array.body.5
  j main._18.array.exit.5                                               # ir inst 56 fin
main._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 57 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 58 fin
  addi t4, t5, 1                                                        # ir inst 59 fin
# Phi connections
  mv t5, t4
  j main._16.array.cond.5                                               # ir inst 60 fin
main._18.array.exit.5:
# Phi connections
  li t4, -1
  li t5, 0
  li t6, 0
  j main._19.while.cond.0                                               # ir inst 61 fin
main._19.while.cond.0:
  li t2, 50
  slt t3, t6, t2                                                        # ir inst 65 fin
  bnez t3, main._20.while.body.0
  j main._21.while.exit.0                                               # ir inst 66 fin
main._20.while.body.0:
  li t2, 17
  mul t3, t6, t2                                                        # ir inst 67 fin
  addi s11, t3, 23                                                      # ir inst 68 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a1, 1000
  mv a0, s11
  call .F.generate_pseudo_random_value
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 69 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  sd t5, -8(sp)
  mv a7, t3
  mv a6, t4
  li t1, 4056
  add t1, sp, t1
  mv a5, t1
  li t1, 3256
  add t1, sp, t1
  mv a4, t1
  li t1, 2456
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1656
  mv a2, t1
  addi t1, sp, 856
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.insert_into_bst
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 70 fin
  addi t3, t5, 1                                                        # ir inst 71 fin
  addi s10, t6, 1                                                       # ir inst 72 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j main._19.while.cond.0                                               # ir inst 73 fin
main._21.while.exit.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a7, t5
  mv a6, t4
  li t1, 4056
  add t1, sp, t1
  mv a5, t1
  li t1, 3256
  add t1, sp, t1
  mv a4, t1
  li t1, 2456
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1656
  mv a2, t1
  addi t1, sp, 856
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.perform_tree_analysis
  mv t6, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 74 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 75 fin
# Phi connections
  mv t6, t4
  li t4, 0
  j main._22.while.cond.1                                               # ir inst 76 fin
main._22.while.cond.1:
  li t2, 8
  slt t3, t4, t2                                                        # ir inst 79 fin
  bnez t3, main._23.while.body.1
  j main._24.while.exit.1                                               # ir inst 80 fin
main._23.while.body.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a7, t5
  mv a6, t6
  li t1, 4056
  add t1, sp, t1
  mv a5, t1
  li t1, 3256
  add t1, sp, t1
  mv a4, t1
  li t1, 2456
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1656
  mv a2, t1
  addi t1, sp, 856
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.perform_tree_rebalancing
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 81 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  sd t4, -8(sp)
  mv a7, t5
  mv a6, t3
  li t1, 4056
  add t1, sp, t1
  mv a5, t1
  li t1, 3256
  add t1, sp, t1
  mv a4, t1
  li t1, 2456
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1656
  mv a2, t1
  addi t1, sp, 856
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.perform_comprehensive_tree_traversal
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 82 fin
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
# ir inst 83 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  sd t4, -8(sp)
  mv a7, t5
  mv a6, t3
  li t1, 4056
  add t1, sp, t1
  mv a5, t1
  li t1, 3256
  add t1, sp, t1
  mv a4, t1
  li t1, 2456
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1656
  mv a2, t1
  addi t1, sp, 856
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.compute_complex_tree_properties
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 84 fin
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
# ir inst 85 fin
  addi s11, t4, 1                                                       # ir inst 86 fin
# Phi connections
  mv t4, s11
  mv t6, t3
  j main._22.while.cond.1                                               # ir inst 87 fin
main._24.while.exit.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a7, t5
  mv a6, t6
  li t1, 4056
  add t1, sp, t1
  mv a5, t1
  li t1, 3256
  add t1, sp, t1
  mv a4, t1
  li t1, 2456
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 1656
  mv a2, t1
  addi t1, sp, 856
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call .F.validate_tree_integrity
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 88 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 89 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 90 fin
  j main.epilogue                                                       # ir inst 91 fin
main.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 4864
  add sp, sp, t0
  ret

.globl .F.generate_pseudo_random_value
.F.generate_pseudo_random_value:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generate_pseudo_random_value._0.entry.0:
  li t2, 15
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 12345
  add t5, t6, t2                                                        # ir inst 2 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 3 fin
  bnez t6, .F.generate_pseudo_random_value._1.if.then.0
  j .F.generate_pseudo_random_value._2.if.else.0                        # ir inst 4 fin
.F.generate_pseudo_random_value._1.if.then.0:
  li t1, 0
  sub t6, t1, t5                                                        # ir inst 5 fin
# Phi connections
  j .F.generate_pseudo_random_value._3.if.exit.0                        # ir inst 6 fin
.F.generate_pseudo_random_value._2.if.else.0:
# Phi connections
  mv t6, t5
  j .F.generate_pseudo_random_value._3.if.exit.0                        # ir inst 7 fin
.F.generate_pseudo_random_value._3.if.exit.0:
  rem t5, t6, a1                                                        # ir inst 9 fin
  mv a0, t5
  j .F.generate_pseudo_random_value.epilogue                            # ir inst 10 fin
.F.generate_pseudo_random_value.epilogue:
  ret

.globl .F.insert_into_bst
.F.insert_into_bst:
# spill func args num: 1,             range:       72(sp) -       72(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 56(sp)
.F.insert_into_bst._0.entry.0:
  ld t1, 72(sp)
  mv t6, t1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  sw a7, 0(t5)                                                          # ir inst 3 fin
  ld t1, 72(sp)
  mv t6, t1                                                             # ir inst 4 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 5 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 6 fin
  ld t1, 72(sp)
  mv t6, t1                                                             # ir inst 7 fin
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 9 fin
  ld t1, 72(sp)
  mv t6, t1                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 11 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 12 fin
  ld t1, 72(sp)
  mv t6, t1                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 14 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 15 fin
  ld t1, 72(sp)
  mv t6, t1                                                             # ir inst 16 fin
  slli t2, t6, 2
  add t5, a5, t2                                                        # ir inst 17 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 18 fin
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 19 fin
  bnez t6, .F.insert_into_bst._1.if.then.0
  j .F.insert_into_bst._2.if.else.0                                     # ir inst 20 fin
.F.insert_into_bst._1.if.then.0:
  ld t1, 72(sp)
  mv a0, t1
  j .F.insert_into_bst.epilogue                                         # ir inst 21 fin
.F.insert_into_bst._2.if.else.0:
  j .F.insert_into_bst._3.if.exit.0                                     # ir inst 22 fin
.F.insert_into_bst._3.if.exit.0:
# Phi connections
  mv t5, a6
  li t6, 0
  j .F.insert_into_bst._4.while.cond.0                                  # ir inst 23 fin
.F.insert_into_bst._4.while.cond.0:
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 26 fin
  bnez t4, .F.insert_into_bst._5.while.body.0
  j .F.insert_into_bst._15.while.exit.0                                 # ir inst 27 fin
.F.insert_into_bst._5.while.body.0:
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 29 fin
  lw t4, 0(t3)                                                          # ir inst 30 fin
  slt t3, a7, t4                                                        # ir inst 31 fin
  bnez t3, .F.insert_into_bst._6.if.then.1
  j .F.insert_into_bst._10.if.else.1                                    # ir inst 32 fin
.F.insert_into_bst._6.if.then.1:
  mv t4, t5                                                             # ir inst 33 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 34 fin
  lw t4, 0(t3)                                                          # ir inst 35 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 36 fin
  bnez t3, .F.insert_into_bst._7.if.then.2
  j .F.insert_into_bst._8.if.else.2                                     # ir inst 37 fin
.F.insert_into_bst._7.if.then.2:
  mv t4, t5                                                             # ir inst 38 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 39 fin
  ld t1, 72(sp)
  sw t1, 0(t3)                                                          # ir inst 40 fin
  ld t1, 72(sp)
  mv t4, t1                                                             # ir inst 41 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 42 fin
  sw t5, 0(t3)                                                          # ir inst 43 fin
# Phi connections
  mv t3, t5
  li t4, 1
  j .F.insert_into_bst._9.if.exit.2                                     # ir inst 44 fin
.F.insert_into_bst._8.if.else.2:
  mv t4, t5                                                             # ir inst 45 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 46 fin
  lw t4, 0(t3)                                                          # ir inst 47 fin
# Phi connections
  mv t3, t4
  mv t4, t6
  j .F.insert_into_bst._9.if.exit.2                                     # ir inst 48 fin
.F.insert_into_bst._9.if.exit.2:
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.insert_into_bst._14.if.exit.1                                    # ir inst 51 fin
.F.insert_into_bst._10.if.else.1:
  mv t4, t5                                                             # ir inst 52 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 53 fin
  lw t4, 0(t3)                                                          # ir inst 54 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 55 fin
  bnez t3, .F.insert_into_bst._11.if.then.3
  j .F.insert_into_bst._12.if.else.3                                    # ir inst 56 fin
.F.insert_into_bst._11.if.then.3:
  mv t4, t5                                                             # ir inst 57 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 58 fin
  ld t1, 72(sp)
  sw t1, 0(t3)                                                          # ir inst 59 fin
  ld t1, 72(sp)
  mv t4, t1                                                             # ir inst 60 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 61 fin
  sw t5, 0(t3)                                                          # ir inst 62 fin
# Phi connections
  li t6, 1
  j .F.insert_into_bst._13.if.exit.3                                    # ir inst 63 fin
.F.insert_into_bst._12.if.else.3:
  mv t4, t5                                                             # ir inst 64 fin
  slli t2, t4, 2
  add t5, a2, t2                                                        # ir inst 65 fin
  lw t4, 0(t5)                                                          # ir inst 66 fin
# Phi connections
  mv t5, t4
  j .F.insert_into_bst._13.if.exit.3                                    # ir inst 67 fin
.F.insert_into_bst._13.if.exit.3:
# Phi connections
  j .F.insert_into_bst._14.if.exit.1                                    # ir inst 70 fin
.F.insert_into_bst._14.if.exit.1:
# Phi connections
  j .F.insert_into_bst._4.while.cond.0                                  # ir inst 73 fin
.F.insert_into_bst._15.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  ld t1, 72(sp)
  mv a6, t1
  call .F.update_tree_properties_bottom_up
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
# ir inst 74 fin
  mv a0, a6
  j .F.insert_into_bst.epilogue                                         # ir inst 75 fin
.F.insert_into_bst.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.update_tree_properties_bottom_up
.F.update_tree_properties_bottom_up:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 1 / 12,        range:       72(sp) -       80(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.update_tree_properties_bottom_up._0.entry.0:
# Phi connections
  mv t6, a6
  j .F.update_tree_properties_bottom_up._1.while.cond.0                 # ir inst 1 fin
.F.update_tree_properties_bottom_up._1.while.cond.0:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 3 fin
  bnez t5, .F.update_tree_properties_bottom_up._2.while.body.0
  j .F.update_tree_properties_bottom_up._15.while.exit.0                # ir inst 4 fin
.F.update_tree_properties_bottom_up._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  lw t5, 0(t4)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 8 fin
  bnez t4, .F.update_tree_properties_bottom_up._3.if.then.0
  j .F.update_tree_properties_bottom_up._4.if.else.0                    # ir inst 9 fin
.F.update_tree_properties_bottom_up._3.if.then.0:
# Phi connections
  li t5, 0
  j .F.update_tree_properties_bottom_up._5.if.exit.0                    # ir inst 10 fin
.F.update_tree_properties_bottom_up._4.if.else.0:
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 12 fin
  lw t5, 0(t4)                                                          # ir inst 13 fin
  mv t4, t5                                                             # ir inst 14 fin
  slli t2, t4, 2
  add t5, a4, t2                                                        # ir inst 15 fin
  lw t4, 0(t5)                                                          # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.update_tree_properties_bottom_up._5.if.exit.0                    # ir inst 17 fin
.F.update_tree_properties_bottom_up._5.if.exit.0:
  mv t4, t6                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 20 fin
  lw t4, 0(t3)                                                          # ir inst 21 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 22 fin
  bnez t3, .F.update_tree_properties_bottom_up._6.if.then.1
  j .F.update_tree_properties_bottom_up._7.if.else.1                    # ir inst 23 fin
.F.update_tree_properties_bottom_up._6.if.then.1:
# Phi connections
  li t4, 0
  j .F.update_tree_properties_bottom_up._8.if.exit.1                    # ir inst 24 fin
.F.update_tree_properties_bottom_up._7.if.else.1:
  mv t4, t6                                                             # ir inst 25 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 26 fin
  lw t4, 0(t3)                                                          # ir inst 27 fin
  mv t3, t4                                                             # ir inst 28 fin
  slli t2, t3, 2
  add t4, a4, t2                                                        # ir inst 29 fin
  lw t3, 0(t4)                                                          # ir inst 30 fin
# Phi connections
  mv t4, t3
  j .F.update_tree_properties_bottom_up._8.if.exit.1                    # ir inst 31 fin
.F.update_tree_properties_bottom_up._8.if.exit.1:
  mv t3, t6                                                             # ir inst 33 fin
  slli t2, t3, 2
  add s11, a4, t2                                                       # ir inst 34 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a4, 24(sp)
  sd a5, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a1, t4
  mv a0, t5
  call .F.max
  mv t3, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a4, 24(sp)
  ld a5, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 35 fin
  addi t5, t3, 1                                                        # ir inst 36 fin
  sw t5, 0(s11)                                                         # ir inst 37 fin
  mv t5, t6                                                             # ir inst 38 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 39 fin
  lw t5, 0(t4)                                                          # ir inst 40 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 41 fin
  bnez t4, .F.update_tree_properties_bottom_up._9.if.then.2
  j .F.update_tree_properties_bottom_up._10.if.else.2                   # ir inst 42 fin
.F.update_tree_properties_bottom_up._9.if.then.2:
# Phi connections
  li t5, 0
  j .F.update_tree_properties_bottom_up._11.if.exit.2                   # ir inst 43 fin
.F.update_tree_properties_bottom_up._10.if.else.2:
  mv t5, t6                                                             # ir inst 44 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 45 fin
  lw t5, 0(t4)                                                          # ir inst 46 fin
  mv t4, t5                                                             # ir inst 47 fin
  slli t2, t4, 2
  add t5, a5, t2                                                        # ir inst 48 fin
  lw t4, 0(t5)                                                          # ir inst 49 fin
# Phi connections
  mv t5, t4
  j .F.update_tree_properties_bottom_up._11.if.exit.2                   # ir inst 50 fin
.F.update_tree_properties_bottom_up._11.if.exit.2:
  mv t4, t6                                                             # ir inst 52 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 53 fin
  lw t4, 0(t3)                                                          # ir inst 54 fin
  li t2, -1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 55 fin
  bnez t3, .F.update_tree_properties_bottom_up._12.if.then.3
  j .F.update_tree_properties_bottom_up._13.if.else.3                   # ir inst 56 fin
.F.update_tree_properties_bottom_up._12.if.then.3:
# Phi connections
  li t4, 0
  j .F.update_tree_properties_bottom_up._14.if.exit.3                   # ir inst 57 fin
.F.update_tree_properties_bottom_up._13.if.else.3:
  mv t4, t6                                                             # ir inst 58 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 59 fin
  lw t4, 0(t3)                                                          # ir inst 60 fin
  mv t3, t4                                                             # ir inst 61 fin
  slli t2, t3, 2
  add t4, a5, t2                                                        # ir inst 62 fin
  lw t3, 0(t4)                                                          # ir inst 63 fin
# Phi connections
  mv t4, t3
  j .F.update_tree_properties_bottom_up._14.if.exit.3                   # ir inst 64 fin
.F.update_tree_properties_bottom_up._14.if.exit.3:
  mv t3, t6                                                             # ir inst 66 fin
  slli t2, t3, 2
  add s11, a5, t2                                                       # ir inst 67 fin
  add t3, t5, t4                                                        # ir inst 68 fin
  addi t5, t3, 1                                                        # ir inst 69 fin
  sw t5, 0(s11)                                                         # ir inst 70 fin
  mv t5, t6                                                             # ir inst 71 fin
  slli t2, t5, 2
  add t6, a3, t2                                                        # ir inst 72 fin
  lw t5, 0(t6)                                                          # ir inst 73 fin
# Phi connections
  mv t6, t5
  j .F.update_tree_properties_bottom_up._1.while.cond.0                 # ir inst 74 fin
.F.update_tree_properties_bottom_up._15.while.exit.0:
  j .F.update_tree_properties_bottom_up.epilogue                        # ir inst 75 fin
.F.update_tree_properties_bottom_up.epilogue:
  ld ra, 80(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.max
.F.max:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.max._0.entry.0:
  slt t6, a1, a0                                                        # ir inst 1 fin
  bnez t6, .F.max._1.if.then.0
  j .F.max._2.if.else.0                                                 # ir inst 2 fin
.F.max._1.if.then.0:
# Phi connections
  mv t6, a0
  j .F.max._3.if.exit.0                                                 # ir inst 3 fin
.F.max._2.if.else.0:
# Phi connections
  mv t6, a1
  j .F.max._3.if.exit.0                                                 # ir inst 4 fin
.F.max._3.if.exit.0:
  mv a0, t6
  j .F.max.epilogue                                                     # ir inst 6 fin
.F.max.epilogue:
  ret

.globl .F.min
.F.min:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.min._0.entry.0:
  slt t6, a0, a1                                                        # ir inst 1 fin
  bnez t6, .F.min._1.if.then.0
  j .F.min._2.if.else.0                                                 # ir inst 2 fin
.F.min._1.if.then.0:
# Phi connections
  mv t6, a0
  j .F.min._3.if.exit.0                                                 # ir inst 3 fin
.F.min._2.if.else.0:
# Phi connections
  mv t6, a1
  j .F.min._3.if.exit.0                                                 # ir inst 4 fin
.F.min._3.if.exit.0:
  mv a0, t6
  j .F.min.epilogue                                                     # ir inst 6 fin
.F.min.epilogue:
  ret

.globl .F.abs
.F.abs:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.abs._0.entry.0:
  li t2, 0
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.abs._1.if.then.0
  j .F.abs._2.if.else.0                                                 # ir inst 2 fin
.F.abs._1.if.then.0:
  li t1, 0
  sub t6, t1, a0                                                        # ir inst 3 fin
# Phi connections
  j .F.abs._3.if.exit.0                                                 # ir inst 4 fin
.F.abs._2.if.else.0:
# Phi connections
  mv t6, a0
  j .F.abs._3.if.exit.0                                                 # ir inst 5 fin
.F.abs._3.if.exit.0:
  mv a0, t6
  j .F.abs.epilogue                                                     # ir inst 7 fin
.F.abs.epilogue:
  ret

.globl .F.perform_tree_analysis
.F.perform_tree_analysis:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 2 / 12,        range:       88(sp) -      104(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 88(sp)
  sd s10, 96(sp)
  sd ra, 104(sp)
.F.perform_tree_analysis._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_tree_analysis._1.if.then.0
  j .F.perform_tree_analysis._2.if.else.0                               # ir inst 2 fin
.F.perform_tree_analysis._1.if.then.0:
  li a0, 0
  j .F.perform_tree_analysis.epilogue                                   # ir inst 3 fin
.F.perform_tree_analysis._2.if.else.0:
  j .F.perform_tree_analysis._3.if.exit.0                               # ir inst 4 fin
.F.perform_tree_analysis._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  mv t5, a6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, a5, t2                                                        # ir inst 9 fin
  lw t5, 0(t4)                                                          # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  call .F.compute_tree_balance_factor
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  li t1, 0
  sd t1, -8(sp)
  li a7, 0
  call .F.compute_all_paths_sum
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 12 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd t4, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  li a7, 0
  call .F.compute_node_depth_variance
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld t4, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 13 fin
  mul s10, t6, t5                                                       # ir inst 14 fin
  li t2, 17
  mul t6, t4, t2                                                        # ir inst 15 fin
  add t5, s10, t6                                                       # ir inst 16 fin
  li t2, 1000
  rem t6, t3, t2                                                        # ir inst 17 fin
  add t4, t5, t6                                                        # ir inst 18 fin
  add t6, t4, s11                                                       # ir inst 19 fin
  li t2, 10000
  rem t5, t6, t2                                                        # ir inst 20 fin
  mv a0, t5
  j .F.perform_tree_analysis.epilogue                                   # ir inst 21 fin
.F.perform_tree_analysis.epilogue:
  ld ra, 104(sp)
  ld s11, 88(sp)
  ld s10, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.compute_tree_balance_factor
.F.compute_tree_balance_factor:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.compute_tree_balance_factor._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_tree_balance_factor._1.if.then.0
  j .F.compute_tree_balance_factor._2.if.else.0                         # ir inst 2 fin
.F.compute_tree_balance_factor._1.if.then.0:
  li a0, 0
  j .F.compute_tree_balance_factor.epilogue                             # ir inst 3 fin
.F.compute_tree_balance_factor._2.if.else.0:
  j .F.compute_tree_balance_factor._3.if.exit.0                         # ir inst 4 fin
.F.compute_tree_balance_factor._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.compute_tree_balance_factor._4.if.then.1
  j .F.compute_tree_balance_factor._5.if.else.1                         # ir inst 9 fin
.F.compute_tree_balance_factor._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.compute_tree_balance_factor._6.if.exit.1                         # ir inst 10 fin
.F.compute_tree_balance_factor._5.if.else.1:
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t6, a4, t2                                                        # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.compute_tree_balance_factor._6.if.exit.1                         # ir inst 17 fin
.F.compute_tree_balance_factor._6.if.exit.1:
  mv t5, a6                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 20 fin
  lw t5, 0(t4)                                                          # ir inst 21 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 22 fin
  bnez t4, .F.compute_tree_balance_factor._7.if.then.2
  j .F.compute_tree_balance_factor._8.if.else.2                         # ir inst 23 fin
.F.compute_tree_balance_factor._7.if.then.2:
# Phi connections
  li t5, 0
  j .F.compute_tree_balance_factor._9.if.exit.2                         # ir inst 24 fin
.F.compute_tree_balance_factor._8.if.else.2:
  mv t5, a6                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 26 fin
  lw t5, 0(t4)                                                          # ir inst 27 fin
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add t5, a4, t2                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.compute_tree_balance_factor._9.if.exit.2                         # ir inst 31 fin
.F.compute_tree_balance_factor._9.if.exit.2:
  sub t4, t6, t5                                                        # ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  mv a0, t4
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
# ir inst 34 fin
  mv t5, a6                                                             # ir inst 35 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 36 fin
  lw t5, 0(t4)                                                          # ir inst 37 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.compute_tree_balance_factor
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 38 fin
  mv t5, a6                                                             # ir inst 39 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 40 fin
  lw t5, 0(t3)                                                          # ir inst 41 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.compute_tree_balance_factor
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 42 fin
  add t5, t6, t4                                                        # ir inst 43 fin
  add t6, t5, t3                                                        # ir inst 44 fin
  mv a0, t6
  j .F.compute_tree_balance_factor.epilogue                             # ir inst 45 fin
.F.compute_tree_balance_factor.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.compute_all_paths_sum
.F.compute_all_paths_sum:
# spill func args num: 1,             range:      104(sp) -      104(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 1 / 12,        range:       88(sp) -       96(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.compute_all_paths_sum._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_all_paths_sum._1.if.then.0
  j .F.compute_all_paths_sum._2.if.else.0                               # ir inst 2 fin
.F.compute_all_paths_sum._1.if.then.0:
  li a0, 0
  j .F.compute_all_paths_sum.epilogue                                   # ir inst 3 fin
.F.compute_all_paths_sum._2.if.else.0:
  j .F.compute_all_paths_sum._3.if.exit.0                               # ir inst 4 fin
.F.compute_all_paths_sum._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  ld t1, 104(sp)
  addi t5, t1, 1                                                        # ir inst 8 fin
  mul t4, t6, t5                                                        # ir inst 9 fin
  add t6, a7, t4                                                        # ir inst 10 fin
  mv t5, a6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 12 fin
  lw t5, 0(t4)                                                          # ir inst 13 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 14 fin
  bnez t4, .F.compute_all_paths_sum._4.lazy.then.0
  j .F.compute_all_paths_sum._5.lazy.else.0                             # ir inst 15 fin
.F.compute_all_paths_sum._4.lazy.then.0:
  mv t5, a6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 17 fin
  lw t5, 0(t4)                                                          # ir inst 18 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.compute_all_paths_sum._6.lazy.exit.0                             # ir inst 20 fin
.F.compute_all_paths_sum._5.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.compute_all_paths_sum._6.lazy.exit.0                             # ir inst 21 fin
.F.compute_all_paths_sum._6.lazy.exit.0:
  bnez t5, .F.compute_all_paths_sum._7.if.then.1
  j .F.compute_all_paths_sum._8.if.else.1                               # ir inst 23 fin
.F.compute_all_paths_sum._7.if.then.1:
  mv a0, t6
  j .F.compute_all_paths_sum.epilogue                                   # ir inst 24 fin
.F.compute_all_paths_sum._8.if.else.1:
  j .F.compute_all_paths_sum._9.if.exit.1                               # ir inst 25 fin
.F.compute_all_paths_sum._9.if.exit.1:
  mv t5, a6                                                             # ir inst 26 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 27 fin
  lw t5, 0(t4)                                                          # ir inst 28 fin
  ld t1, 104(sp)
  addi t4, t1, 1                                                        # ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  sd t4, -8(sp)
  mv a7, t6
  mv a6, t5
  call .F.compute_all_paths_sum
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 30 fin
  mv t5, a6                                                             # ir inst 31 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 32 fin
  lw t5, 0(t4)                                                          # ir inst 33 fin
  ld t1, 104(sp)
  addi t4, t1, 1                                                        # ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  sd t4, -8(sp)
  mv a7, t6
  mv a6, t5
  call .F.compute_all_paths_sum
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 35 fin
  add t6, t3, s11                                                       # ir inst 36 fin
  mv a0, t6
  j .F.compute_all_paths_sum.epilogue                                   # ir inst 37 fin
.F.compute_all_paths_sum.epilogue:
  ld ra, 96(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.compute_node_depth_variance
.F.compute_node_depth_variance:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 1 / 12,        range:       96(sp) -      104(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 96(sp)
  sd ra, 104(sp)
.F.compute_node_depth_variance._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_node_depth_variance._1.if.then.0
  j .F.compute_node_depth_variance._2.if.else.0                         # ir inst 2 fin
.F.compute_node_depth_variance._1.if.then.0:
  li a0, 0
  j .F.compute_node_depth_variance.epilogue                             # ir inst 3 fin
.F.compute_node_depth_variance._2.if.else.0:
  j .F.compute_node_depth_variance._3.if.exit.0                         # ir inst 4 fin
.F.compute_node_depth_variance._3.if.exit.0:
  mul t6, a7, a7                                                        # ir inst 5 fin
  mv t5, a6                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 7 fin
  lw t5, 0(t4)                                                          # ir inst 8 fin
  li t2, 7
  rem t4, t5, t2                                                        # ir inst 9 fin
  add t5, t6, t4                                                        # ir inst 10 fin
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t4, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t4)                                                          # ir inst 13 fin
  addi t4, a7, 1                                                        # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  mv a7, t4
  mv a6, t6
  call .F.compute_node_depth_variance
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 15 fin
  mv t6, a6                                                             # ir inst 16 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 17 fin
  lw t6, 0(t4)                                                          # ir inst 18 fin
  addi t4, a7, 1                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a7, t4
  mv a6, t6
  call .F.compute_node_depth_variance
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 20 fin
  add t6, t5, t3                                                        # ir inst 21 fin
  add t5, t6, s11                                                       # ir inst 22 fin
  mv a0, t5
  j .F.compute_node_depth_variance.epilogue                             # ir inst 23 fin
.F.compute_node_depth_variance.epilogue:
  ld ra, 104(sp)
  ld s11, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.perform_tree_rebalancing
.F.perform_tree_rebalancing:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 1 / 12,        range:       88(sp) -       96(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.perform_tree_rebalancing._0.entry.0:
# Phi connections
  li t4, 0
  mv t5, a6
  li t6, 0
  j .F.perform_tree_rebalancing._1.while.cond.0                         # ir inst 1 fin
.F.perform_tree_rebalancing._1.while.cond.0:
  slt t3, t4, a7                                                        # ir inst 5 fin
  bnez t3, .F.perform_tree_rebalancing._2.lazy.then.0
  j .F.perform_tree_rebalancing._3.lazy.else.0                          # ir inst 6 fin
.F.perform_tree_rebalancing._2.lazy.then.0:
  li t2, 5
  slt t3, t6, t2                                                        # ir inst 7 fin
# Phi connections
  j .F.perform_tree_rebalancing._4.lazy.exit.0                          # ir inst 8 fin
.F.perform_tree_rebalancing._3.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.perform_tree_rebalancing._4.lazy.exit.0                          # ir inst 9 fin
.F.perform_tree_rebalancing._4.lazy.exit.0:
  bnez t3, .F.perform_tree_rebalancing._5.while.body.0
  j .F.perform_tree_rebalancing._9.while.exit.0                         # ir inst 11 fin
.F.perform_tree_rebalancing._5.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t4
  call .F.needs_rebalancing
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 12 fin
  bnez t3, .F.perform_tree_rebalancing._6.if.then.0
  j .F.perform_tree_rebalancing._7.if.else.0                            # ir inst 13 fin
.F.perform_tree_rebalancing._6.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a7, t4
  mv a6, t5
  call .F.perform_rotation_at_node
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 14 fin
  addi s11, t6, 1                                                       # ir inst 15 fin
# Phi connections
  mv t6, s11
  j .F.perform_tree_rebalancing._8.if.exit.0                            # ir inst 16 fin
.F.perform_tree_rebalancing._7.if.else.0:
# Phi connections
  mv t3, t5
  j .F.perform_tree_rebalancing._8.if.exit.0                            # ir inst 17 fin
.F.perform_tree_rebalancing._8.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 20 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.perform_tree_rebalancing._1.while.cond.0                         # ir inst 21 fin
.F.perform_tree_rebalancing._9.while.exit.0:
  mv a0, t5
  j .F.perform_tree_rebalancing.epilogue                                # ir inst 22 fin
.F.perform_tree_rebalancing.epilogue:
  ld ra, 96(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.needs_rebalancing
.F.needs_rebalancing:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.needs_rebalancing._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.needs_rebalancing._1.if.then.0
  j .F.needs_rebalancing._2.if.else.0                                   # ir inst 2 fin
.F.needs_rebalancing._1.if.then.0:
  li a0, 0
  j .F.needs_rebalancing.epilogue                                       # ir inst 3 fin
.F.needs_rebalancing._2.if.else.0:
  j .F.needs_rebalancing._3.if.exit.0                                   # ir inst 4 fin
.F.needs_rebalancing._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.needs_rebalancing._4.if.then.1
  j .F.needs_rebalancing._5.if.else.1                                   # ir inst 9 fin
.F.needs_rebalancing._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.needs_rebalancing._6.if.exit.1                                   # ir inst 10 fin
.F.needs_rebalancing._5.if.else.1:
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t6, a4, t2                                                        # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.needs_rebalancing._6.if.exit.1                                   # ir inst 17 fin
.F.needs_rebalancing._6.if.exit.1:
  mv t5, a6                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 20 fin
  lw t5, 0(t4)                                                          # ir inst 21 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 22 fin
  bnez t4, .F.needs_rebalancing._7.if.then.2
  j .F.needs_rebalancing._8.if.else.2                                   # ir inst 23 fin
.F.needs_rebalancing._7.if.then.2:
# Phi connections
  li t5, 0
  j .F.needs_rebalancing._9.if.exit.2                                   # ir inst 24 fin
.F.needs_rebalancing._8.if.else.2:
  mv t5, a6                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 26 fin
  lw t5, 0(t4)                                                          # ir inst 27 fin
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add t5, a4, t2                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.needs_rebalancing._9.if.exit.2                                   # ir inst 31 fin
.F.needs_rebalancing._9.if.exit.2:
  sub t4, t6, t5                                                        # ir inst 33 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call .F.abs
  mv t6, a0
  ld t4, 0(sp)
# ir inst 34 fin
  li t2, 2
  slt t5, t2, t6                                                        # ir inst 35 fin
  mv a0, t5
  j .F.needs_rebalancing.epilogue                                       # ir inst 36 fin
.F.needs_rebalancing.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.perform_rotation_at_node
.F.perform_rotation_at_node:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 0 / 12,        range:       88(sp) -       88(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 88(sp)
.F.perform_rotation_at_node._0.entry.0:
  li t2, -1
  xor t0, a7, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_rotation_at_node._1.if.then.0
  j .F.perform_rotation_at_node._2.if.else.0                            # ir inst 2 fin
.F.perform_rotation_at_node._1.if.then.0:
  mv a0, a6
  j .F.perform_rotation_at_node.epilogue                                # ir inst 3 fin
.F.perform_rotation_at_node._2.if.else.0:
  j .F.perform_rotation_at_node._3.if.exit.0                            # ir inst 4 fin
.F.perform_rotation_at_node._3.if.exit.0:
  mv t6, a7                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.perform_rotation_at_node._4.if.then.1
  j .F.perform_rotation_at_node._5.if.else.1                            # ir inst 9 fin
.F.perform_rotation_at_node._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.perform_rotation_at_node._6.if.exit.1                            # ir inst 10 fin
.F.perform_rotation_at_node._5.if.else.1:
  mv t6, a7                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t6, a4, t2                                                        # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.perform_rotation_at_node._6.if.exit.1                            # ir inst 17 fin
.F.perform_rotation_at_node._6.if.exit.1:
  mv t5, a7                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 20 fin
  lw t5, 0(t4)                                                          # ir inst 21 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 22 fin
  bnez t4, .F.perform_rotation_at_node._7.if.then.2
  j .F.perform_rotation_at_node._8.if.else.2                            # ir inst 23 fin
.F.perform_rotation_at_node._7.if.then.2:
# Phi connections
  li t5, 0
  j .F.perform_rotation_at_node._9.if.exit.2                            # ir inst 24 fin
.F.perform_rotation_at_node._8.if.else.2:
  mv t5, a7                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 26 fin
  lw t5, 0(t4)                                                          # ir inst 27 fin
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add t5, a4, t2                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.perform_rotation_at_node._9.if.exit.2                            # ir inst 31 fin
.F.perform_rotation_at_node._9.if.exit.2:
  addi t4, t5, 1                                                        # ir inst 33 fin
  slt t3, t4, t6                                                        # ir inst 34 fin
  bnez t3, .F.perform_rotation_at_node._10.if.then.3
  j .F.perform_rotation_at_node._11.if.else.3                           # ir inst 35 fin
.F.perform_rotation_at_node._10.if.then.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  call .F.perform_right_rotation
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 36 fin
  mv a0, t4
  j .F.perform_rotation_at_node.epilogue                                # ir inst 37 fin
.F.perform_rotation_at_node._11.if.else.3:
  addi t4, t6, 1                                                        # ir inst 38 fin
  slt t6, t4, t5                                                        # ir inst 39 fin
  bnez t6, .F.perform_rotation_at_node._12.if.then.4
  j .F.perform_rotation_at_node._13.if.else.4                           # ir inst 40 fin
.F.perform_rotation_at_node._12.if.then.4:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  call .F.perform_left_rotation
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
# ir inst 41 fin
  mv a0, t6
  j .F.perform_rotation_at_node.epilogue                                # ir inst 42 fin
.F.perform_rotation_at_node._13.if.else.4:
  j .F.perform_rotation_at_node._14.if.exit.4                           # ir inst 43 fin
.F.perform_rotation_at_node._14.if.exit.4:
  j .F.perform_rotation_at_node._15.if.exit.3                           # ir inst 44 fin
.F.perform_rotation_at_node._15.if.exit.3:
  mv a0, a6
  j .F.perform_rotation_at_node.epilogue                                # ir inst 45 fin
.F.perform_rotation_at_node.epilogue:
  ld ra, 88(sp)
  addi sp, sp, 96
  ret

.globl .F.perform_right_rotation
.F.perform_right_rotation:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.perform_right_rotation._0.entry.0:
  mv t6, a7                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 4 fin
  bnez t5, .F.perform_right_rotation._1.if.then.0
  j .F.perform_right_rotation._2.if.else.0                              # ir inst 5 fin
.F.perform_right_rotation._1.if.then.0:
  mv a0, a6
  j .F.perform_right_rotation.epilogue                                  # ir inst 6 fin
.F.perform_right_rotation._2.if.else.0:
  j .F.perform_right_rotation._3.if.exit.0                              # ir inst 7 fin
.F.perform_right_rotation._3.if.exit.0:
  mv t6, a7                                                             # ir inst 8 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 9 fin
  lw t6, 0(t5)                                                          # ir inst 10 fin
  mv t5, a7                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  sw t5, 0(t4)                                                          # ir inst 16 fin
  mv t5, t6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 18 fin
  lw t5, 0(t4)                                                          # ir inst 19 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 20 fin
  bnez t4, .F.perform_right_rotation._4.if.then.1
  j .F.perform_right_rotation._5.if.else.1                              # ir inst 21 fin
.F.perform_right_rotation._4.if.then.1:
  mv t5, t6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 23 fin
  lw t5, 0(t4)                                                          # ir inst 24 fin
  mv t4, t5                                                             # ir inst 25 fin
  slli t2, t4, 2
  add t5, a3, t2                                                        # ir inst 26 fin
  sw a7, 0(t5)                                                          # ir inst 27 fin
  j .F.perform_right_rotation._6.if.exit.1                              # ir inst 28 fin
.F.perform_right_rotation._5.if.else.1:
  j .F.perform_right_rotation._6.if.exit.1                              # ir inst 29 fin
.F.perform_right_rotation._6.if.exit.1:
  mv t5, t6                                                             # ir inst 30 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 31 fin
  sw a7, 0(t4)                                                          # ir inst 32 fin
  mv t5, t6                                                             # ir inst 33 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 34 fin
  mv t5, a7                                                             # ir inst 35 fin
  slli t2, t5, 2
  add t3, a3, t2                                                        # ir inst 36 fin
  lw t5, 0(t3)                                                          # ir inst 37 fin
  sw t5, 0(t4)                                                          # ir inst 38 fin
  mv t5, a7                                                             # ir inst 39 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 40 fin
  sw t6, 0(t4)                                                          # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 43 fin
  lw t5, 0(t4)                                                          # ir inst 44 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 45 fin
  bnez t4, .F.perform_right_rotation._7.if.then.2
  j .F.perform_right_rotation._11.if.else.2                             # ir inst 46 fin
.F.perform_right_rotation._7.if.then.2:
  mv t5, t6                                                             # ir inst 47 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 48 fin
  lw t5, 0(t4)                                                          # ir inst 49 fin
  mv t4, t5                                                             # ir inst 50 fin
  slli t2, t4, 2
  add t5, a1, t2                                                        # ir inst 51 fin
  lw t4, 0(t5)                                                          # ir inst 52 fin
  xor t0, t4, a7
  sltiu t5, t0, 1                                                       # ir inst 53 fin
  bnez t5, .F.perform_right_rotation._8.if.then.3
  j .F.perform_right_rotation._9.if.else.3                              # ir inst 54 fin
.F.perform_right_rotation._8.if.then.3:
  mv t5, t6                                                             # ir inst 55 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 56 fin
  lw t5, 0(t4)                                                          # ir inst 57 fin
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 2
  add t5, a1, t2                                                        # ir inst 59 fin
  sw t6, 0(t5)                                                          # ir inst 60 fin
  j .F.perform_right_rotation._10.if.exit.3                             # ir inst 61 fin
.F.perform_right_rotation._9.if.else.3:
  mv t5, t6                                                             # ir inst 62 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 63 fin
  lw t5, 0(t4)                                                          # ir inst 64 fin
  mv t4, t5                                                             # ir inst 65 fin
  slli t2, t4, 2
  add t5, a2, t2                                                        # ir inst 66 fin
  sw t6, 0(t5)                                                          # ir inst 67 fin
  j .F.perform_right_rotation._10.if.exit.3                             # ir inst 68 fin
.F.perform_right_rotation._10.if.exit.3:
  j .F.perform_right_rotation._12.if.exit.2                             # ir inst 69 fin
.F.perform_right_rotation._11.if.else.2:
  j .F.perform_right_rotation._12.if.exit.2                             # ir inst 70 fin
.F.perform_right_rotation._12.if.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a6, a7
  call .F.update_tree_properties_bottom_up
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 71 fin
  xor t0, a6, a7
  sltiu t5, t0, 1                                                       # ir inst 72 fin
  bnez t5, .F.perform_right_rotation._13.if.then.4
  j .F.perform_right_rotation._14.if.else.4                             # ir inst 73 fin
.F.perform_right_rotation._13.if.then.4:
  mv a0, t6
  j .F.perform_right_rotation.epilogue                                  # ir inst 74 fin
.F.perform_right_rotation._14.if.else.4:
  mv a0, a6
  j .F.perform_right_rotation.epilogue                                  # ir inst 75 fin
.F.perform_right_rotation._15.if.exit.4:
.F.perform_right_rotation.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.perform_left_rotation
.F.perform_left_rotation:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.perform_left_rotation._0.entry.0:
  mv t6, a7                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 4 fin
  bnez t5, .F.perform_left_rotation._1.if.then.0
  j .F.perform_left_rotation._2.if.else.0                               # ir inst 5 fin
.F.perform_left_rotation._1.if.then.0:
  mv a0, a6
  j .F.perform_left_rotation.epilogue                                   # ir inst 6 fin
.F.perform_left_rotation._2.if.else.0:
  j .F.perform_left_rotation._3.if.exit.0                               # ir inst 7 fin
.F.perform_left_rotation._3.if.exit.0:
  mv t6, a7                                                             # ir inst 8 fin
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 9 fin
  lw t6, 0(t5)                                                          # ir inst 10 fin
  mv t5, a7                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  sw t5, 0(t4)                                                          # ir inst 16 fin
  mv t5, t6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 18 fin
  lw t5, 0(t4)                                                          # ir inst 19 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 20 fin
  bnez t4, .F.perform_left_rotation._4.if.then.1
  j .F.perform_left_rotation._5.if.else.1                               # ir inst 21 fin
.F.perform_left_rotation._4.if.then.1:
  mv t5, t6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 23 fin
  lw t5, 0(t4)                                                          # ir inst 24 fin
  mv t4, t5                                                             # ir inst 25 fin
  slli t2, t4, 2
  add t5, a3, t2                                                        # ir inst 26 fin
  sw a7, 0(t5)                                                          # ir inst 27 fin
  j .F.perform_left_rotation._6.if.exit.1                               # ir inst 28 fin
.F.perform_left_rotation._5.if.else.1:
  j .F.perform_left_rotation._6.if.exit.1                               # ir inst 29 fin
.F.perform_left_rotation._6.if.exit.1:
  mv t5, t6                                                             # ir inst 30 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 31 fin
  sw a7, 0(t4)                                                          # ir inst 32 fin
  mv t5, t6                                                             # ir inst 33 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 34 fin
  mv t5, a7                                                             # ir inst 35 fin
  slli t2, t5, 2
  add t3, a3, t2                                                        # ir inst 36 fin
  lw t5, 0(t3)                                                          # ir inst 37 fin
  sw t5, 0(t4)                                                          # ir inst 38 fin
  mv t5, a7                                                             # ir inst 39 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 40 fin
  sw t6, 0(t4)                                                          # ir inst 41 fin
  mv t5, t6                                                             # ir inst 42 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 43 fin
  lw t5, 0(t4)                                                          # ir inst 44 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 45 fin
  bnez t4, .F.perform_left_rotation._7.if.then.2
  j .F.perform_left_rotation._11.if.else.2                              # ir inst 46 fin
.F.perform_left_rotation._7.if.then.2:
  mv t5, t6                                                             # ir inst 47 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 48 fin
  lw t5, 0(t4)                                                          # ir inst 49 fin
  mv t4, t5                                                             # ir inst 50 fin
  slli t2, t4, 2
  add t5, a1, t2                                                        # ir inst 51 fin
  lw t4, 0(t5)                                                          # ir inst 52 fin
  xor t0, t4, a7
  sltiu t5, t0, 1                                                       # ir inst 53 fin
  bnez t5, .F.perform_left_rotation._8.if.then.3
  j .F.perform_left_rotation._9.if.else.3                               # ir inst 54 fin
.F.perform_left_rotation._8.if.then.3:
  mv t5, t6                                                             # ir inst 55 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 56 fin
  lw t5, 0(t4)                                                          # ir inst 57 fin
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 2
  add t5, a1, t2                                                        # ir inst 59 fin
  sw t6, 0(t5)                                                          # ir inst 60 fin
  j .F.perform_left_rotation._10.if.exit.3                              # ir inst 61 fin
.F.perform_left_rotation._9.if.else.3:
  mv t5, t6                                                             # ir inst 62 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 63 fin
  lw t5, 0(t4)                                                          # ir inst 64 fin
  mv t4, t5                                                             # ir inst 65 fin
  slli t2, t4, 2
  add t5, a2, t2                                                        # ir inst 66 fin
  sw t6, 0(t5)                                                          # ir inst 67 fin
  j .F.perform_left_rotation._10.if.exit.3                              # ir inst 68 fin
.F.perform_left_rotation._10.if.exit.3:
  j .F.perform_left_rotation._12.if.exit.2                              # ir inst 69 fin
.F.perform_left_rotation._11.if.else.2:
  j .F.perform_left_rotation._12.if.exit.2                              # ir inst 70 fin
.F.perform_left_rotation._12.if.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a6, a7
  call .F.update_tree_properties_bottom_up
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 71 fin
  xor t0, a6, a7
  sltiu t5, t0, 1                                                       # ir inst 72 fin
  bnez t5, .F.perform_left_rotation._13.if.then.4
  j .F.perform_left_rotation._14.if.else.4                              # ir inst 73 fin
.F.perform_left_rotation._13.if.then.4:
  mv a0, t6
  j .F.perform_left_rotation.epilogue                                   # ir inst 74 fin
.F.perform_left_rotation._14.if.else.4:
  mv a0, a6
  j .F.perform_left_rotation.epilogue                                   # ir inst 75 fin
.F.perform_left_rotation._15.if.exit.4:
.F.perform_left_rotation.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.perform_comprehensive_tree_traversal
.F.perform_comprehensive_tree_traversal:
# spill func args num: 1,             range:      120(sp) -      120(sp)
# local var size: 0,                  range:      120(sp) -      120(sp)
# return addr size: 8,                range:      112(sp) -      120(sp)
# callee save reg num: 2 / 12,        range:       96(sp) -      112(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 96(sp)
  sd s10, 104(sp)
  sd ra, 112(sp)
.F.perform_comprehensive_tree_traversal._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  ld t1, 120(sp)
  mv a7, t1
  call .F.perform_inorder_traversal_with_computation
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  ld t1, 120(sp)
  mv a7, t1
  call .F.perform_preorder_traversal_with_computation
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  ld t1, 120(sp)
  mv a7, t1
  call .F.perform_postorder_traversal_with_computation
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  call .F.perform_level_order_traversal_simulation
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd t4, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  li a7, 0
  call .F.compute_diagonal_traversal_sum
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld t4, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 5 fin
  li t2, 13
  mul s10, t6, t2                                                       # ir inst 6 fin
  li t2, 17
  mul t6, t5, t2                                                        # ir inst 7 fin
  add t5, s10, t6                                                       # ir inst 8 fin
  li t2, 19
  mul t6, t4, t2                                                        # ir inst 9 fin
  add t4, t5, t6                                                        # ir inst 10 fin
  li t2, 23
  mul t6, t3, t2                                                        # ir inst 11 fin
  add t5, t4, t6                                                        # ir inst 12 fin
  li t2, 29
  mul t6, s11, t2                                                       # ir inst 13 fin
  add t4, t5, t6                                                        # ir inst 14 fin
  li t2, 100000
  rem t6, t4, t2                                                        # ir inst 15 fin
  mv a0, t6
  j .F.perform_comprehensive_tree_traversal.epilogue                    # ir inst 16 fin
.F.perform_comprehensive_tree_traversal.epilogue:
  ld ra, 112(sp)
  ld s11, 96(sp)
  ld s10, 104(sp)
  addi sp, sp, 128
  ret

.globl .F.perform_inorder_traversal_with_computation
.F.perform_inorder_traversal_with_computation:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 1 / 12,        range:       88(sp) -       96(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.perform_inorder_traversal_with_computation._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_inorder_traversal_with_computation._1.if.then.0
  j .F.perform_inorder_traversal_with_computation._2.if.else.0          # ir inst 2 fin
.F.perform_inorder_traversal_with_computation._1.if.then.0:
  li a0, 0
  j .F.perform_inorder_traversal_with_computation.epilogue              # ir inst 3 fin
.F.perform_inorder_traversal_with_computation._2.if.else.0:
  j .F.perform_inorder_traversal_with_computation._3.if.exit.0          # ir inst 4 fin
.F.perform_inorder_traversal_with_computation._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a6, t6
  call .F.perform_inorder_traversal_with_computation
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 8 fin
  mv t6, a6                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 10 fin
  lw t6, 0(t4)                                                          # ir inst 11 fin
  addi t4, a7, 1                                                        # ir inst 12 fin
  mul t3, t6, t4                                                        # ir inst 13 fin
  mv t6, a6                                                             # ir inst 14 fin
  slli t2, t6, 2
  add t4, a4, t2                                                        # ir inst 15 fin
  lw t6, 0(t4)                                                          # ir inst 16 fin
  mv t4, a6                                                             # ir inst 17 fin
  slli t2, t4, 2
  add s11, a5, t2                                                       # ir inst 18 fin
  lw t4, 0(s11)                                                         # ir inst 19 fin
  mul s11, t6, t4                                                       # ir inst 20 fin
  add t6, t3, s11                                                       # ir inst 21 fin
  mv t4, a6                                                             # ir inst 22 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 23 fin
  lw t4, 0(t3)                                                          # ir inst 24 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t4
  call .F.perform_inorder_traversal_with_computation
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 25 fin
  add t4, t5, t6                                                        # ir inst 26 fin
  add t6, t4, t3                                                        # ir inst 27 fin
  mv a0, t6
  j .F.perform_inorder_traversal_with_computation.epilogue              # ir inst 28 fin
.F.perform_inorder_traversal_with_computation.epilogue:
  ld ra, 96(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.perform_preorder_traversal_with_computation
.F.perform_preorder_traversal_with_computation:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 0 / 12,        range:       88(sp) -       88(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 88(sp)
.F.perform_preorder_traversal_with_computation._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_preorder_traversal_with_computation._1.if.then.0
  j .F.perform_preorder_traversal_with_computation._2.if.else.0         # ir inst 2 fin
.F.perform_preorder_traversal_with_computation._1.if.then.0:
  li a0, 0
  j .F.perform_preorder_traversal_with_computation.epilogue             # ir inst 3 fin
.F.perform_preorder_traversal_with_computation._2.if.else.0:
  j .F.perform_preorder_traversal_with_computation._3.if.exit.0         # ir inst 4 fin
.F.perform_preorder_traversal_with_computation._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  addi t5, a7, 2                                                        # ir inst 8 fin
  mul t4, t6, t5                                                        # ir inst 9 fin
  mv t6, a6                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 11 fin
  lw t6, 0(t5)                                                          # ir inst 12 fin
  mv t5, a6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, a4, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  mul t3, t6, t5                                                        # ir inst 16 fin
  add t6, t4, t3                                                        # ir inst 17 fin
  mv t5, a6                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 19 fin
  lw t5, 0(t4)                                                          # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t5
  call .F.perform_preorder_traversal_with_computation
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 21 fin
  mv t5, a6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 23 fin
  lw t5, 0(t3)                                                          # ir inst 24 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t5
  call .F.perform_preorder_traversal_with_computation
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 25 fin
  add t5, t6, t4                                                        # ir inst 26 fin
  add t6, t5, t3                                                        # ir inst 27 fin
  mv a0, t6
  j .F.perform_preorder_traversal_with_computation.epilogue             # ir inst 28 fin
.F.perform_preorder_traversal_with_computation.epilogue:
  ld ra, 88(sp)
  addi sp, sp, 96
  ret

.globl .F.perform_postorder_traversal_with_computation
.F.perform_postorder_traversal_with_computation:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 2 / 12,        range:       88(sp) -      104(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s10, 88(sp)
  sd s11, 96(sp)
  sd ra, 104(sp)
.F.perform_postorder_traversal_with_computation._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_postorder_traversal_with_computation._1.if.then.0
  j .F.perform_postorder_traversal_with_computation._2.if.else.0        # ir inst 2 fin
.F.perform_postorder_traversal_with_computation._1.if.then.0:
  li a0, 0
  j .F.perform_postorder_traversal_with_computation.epilogue            # ir inst 3 fin
.F.perform_postorder_traversal_with_computation._2.if.else.0:
  j .F.perform_postorder_traversal_with_computation._3.if.exit.0        # ir inst 4 fin
.F.perform_postorder_traversal_with_computation._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a6, t6
  call .F.perform_postorder_traversal_with_computation
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 8 fin
  mv t6, a6                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 10 fin
  lw t6, 0(t4)                                                          # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t6
  call .F.perform_postorder_traversal_with_computation
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 12 fin
  mv t6, a6                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw t6, 0(t3)                                                          # ir inst 15 fin
  addi t3, a7, 3                                                        # ir inst 16 fin
  mul s11, t6, t3                                                       # ir inst 17 fin
  mv t6, a6                                                             # ir inst 18 fin
  slli t2, t6, 2
  add t3, a5, t2                                                        # ir inst 19 fin
  lw t6, 0(t3)                                                          # ir inst 20 fin
  mv t3, a6                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s10, a5, t2                                                       # ir inst 22 fin
  lw t3, 0(s10)                                                         # ir inst 23 fin
  mul s10, t6, t3                                                       # ir inst 24 fin
  add t6, s11, s10                                                      # ir inst 25 fin
  add t3, t5, t4                                                        # ir inst 26 fin
  add t5, t3, t6                                                        # ir inst 27 fin
  mv a0, t5
  j .F.perform_postorder_traversal_with_computation.epilogue            # ir inst 28 fin
.F.perform_postorder_traversal_with_computation.epilogue:
  ld ra, 104(sp)
  ld s10, 88(sp)
  ld s11, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.perform_level_order_traversal_simulation
.F.perform_level_order_traversal_simulation:
# spill func args num: 1,             range:      872(sp) -      872(sp)
# local var size: 800,                range:       72(sp) -      872(sp)
# return addr size: 0,                range:       72(sp) -       72(sp)
# callee save reg num: 9 / 12,        range:        0(sp) -       72(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -880
  sd s7, 0(sp)
  sd s11, 8(sp)
  sd s10, 16(sp)
  sd s9, 24(sp)
  sd s5, 32(sp)
  sd s0, 40(sp)
  sd s8, 48(sp)
  sd s1, 56(sp)
  sd s6, 64(sp)
.F.perform_level_order_traversal_simulation._0.entry.0:
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.perform_level_order_traversal_simulation._1.array.cond.0         # ir inst 3 fin
.F.perform_level_order_traversal_simulation._1.array.cond.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.perform_level_order_traversal_simulation._2.array.body.0
  j .F.perform_level_order_traversal_simulation._3.array.exit.0         # ir inst 6 fin
.F.perform_level_order_traversal_simulation._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.perform_level_order_traversal_simulation._1.array.cond.0         # ir inst 10 fin
.F.perform_level_order_traversal_simulation._3.array.exit.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 11 fin
  bnez t6, .F.perform_level_order_traversal_simulation._4.if.then.0
  j .F.perform_level_order_traversal_simulation._5.if.else.0            # ir inst 12 fin
.F.perform_level_order_traversal_simulation._4.if.then.0:
  li a0, 0
  j .F.perform_level_order_traversal_simulation.epilogue                # ir inst 13 fin
.F.perform_level_order_traversal_simulation._5.if.else.0:
  j .F.perform_level_order_traversal_simulation._6.if.exit.0            # ir inst 14 fin
.F.perform_level_order_traversal_simulation._6.if.exit.0:
  li t1, 0
  mv t6, t1                                                             # ir inst 15 fin
  slli t2, t6, 2
  addi t1, sp, 72
  add t5, t1, t2                                                        # ir inst 16 fin
  sw a6, 0(t5)                                                          # ir inst 17 fin
# Phi connections
  li t3, 0
  li t4, 1
  li t5, 0
  li t6, 1
  j .F.perform_level_order_traversal_simulation._7.while.cond.0         # ir inst 18 fin
.F.perform_level_order_traversal_simulation._7.while.cond.0:
  slt s11, t3, t4                                                       # ir inst 23 fin
  bnez s11, .F.perform_level_order_traversal_simulation._8.while.body.0
  j .F.perform_level_order_traversal_simulation._21.while.exit.0        # ir inst 24 fin
.F.perform_level_order_traversal_simulation._8.while.body.0:
  sub s11, t4, t3                                                       # ir inst 25 fin
# Phi connections
  mv s9, t3
  mv s10, t4
  li t3, 0
  li t4, 0
  j .F.perform_level_order_traversal_simulation._9.while.cond.1         # ir inst 26 fin
.F.perform_level_order_traversal_simulation._9.while.cond.1:
  slt s8, t4, s11                                                       # ir inst 31 fin
  bnez s8, .F.perform_level_order_traversal_simulation._10.lazy.then.0
  j .F.perform_level_order_traversal_simulation._11.lazy.else.0         # ir inst 32 fin
.F.perform_level_order_traversal_simulation._10.lazy.then.0:
  slt s8, s9, s10                                                       # ir inst 33 fin
# Phi connections
  j .F.perform_level_order_traversal_simulation._12.lazy.exit.0         # ir inst 34 fin
.F.perform_level_order_traversal_simulation._11.lazy.else.0:
# Phi connections
  li s8, 0
  j .F.perform_level_order_traversal_simulation._12.lazy.exit.0         # ir inst 35 fin
.F.perform_level_order_traversal_simulation._12.lazy.exit.0:
  bnez s8, .F.perform_level_order_traversal_simulation._13.while.body.1
  j .F.perform_level_order_traversal_simulation._20.while.exit.1        # ir inst 37 fin
.F.perform_level_order_traversal_simulation._13.while.body.1:
  mv s8, s9                                                             # ir inst 38 fin
  slli t2, s8, 2
  addi t1, sp, 72
  add s7, t1, t2                                                        # ir inst 39 fin
  lw s8, 0(s7)                                                          # ir inst 40 fin
  addi s7, s9, 1                                                        # ir inst 41 fin
  mv s6, s8                                                             # ir inst 42 fin
  slli t2, s6, 2
  add s5, a0, t2                                                        # ir inst 43 fin
  lw s6, 0(s5)                                                          # ir inst 44 fin
  mul s5, s6, t6                                                        # ir inst 45 fin
  add s6, t3, s5                                                        # ir inst 46 fin
  mv s5, s8                                                             # ir inst 47 fin
  slli t2, s5, 2
  add s0, a4, t2                                                        # ir inst 48 fin
  lw s5, 0(s0)                                                          # ir inst 49 fin
  ld t1, 872(sp)
  addi s0, t1, 1                                                        # ir inst 50 fin
  mul s1, s5, s0                                                        # ir inst 51 fin
  add s5, s6, s1                                                        # ir inst 52 fin
  mv s6, s8                                                             # ir inst 53 fin
  slli t2, s6, 2
  add s0, a1, t2                                                        # ir inst 54 fin
  lw s6, 0(s0)                                                          # ir inst 55 fin
  li t2, -1
  xor t0, s6, t2
  sltu s0, zero, t0                                                     # ir inst 56 fin
  bnez s0, .F.perform_level_order_traversal_simulation._14.if.then.1
  j .F.perform_level_order_traversal_simulation._15.if.else.1           # ir inst 57 fin
.F.perform_level_order_traversal_simulation._14.if.then.1:
  mv s6, s10                                                            # ir inst 58 fin
  slli t2, s6, 2
  addi t1, sp, 72
  add s0, t1, t2                                                        # ir inst 59 fin
  mv s6, s8                                                             # ir inst 60 fin
  slli t2, s6, 2
  add s1, a1, t2                                                        # ir inst 61 fin
  lw s6, 0(s1)                                                          # ir inst 62 fin
  sw s6, 0(s0)                                                          # ir inst 63 fin
  addi s6, s10, 1                                                       # ir inst 64 fin
# Phi connections
  j .F.perform_level_order_traversal_simulation._16.if.exit.1           # ir inst 65 fin
.F.perform_level_order_traversal_simulation._15.if.else.1:
# Phi connections
  mv s6, s10
  j .F.perform_level_order_traversal_simulation._16.if.exit.1           # ir inst 66 fin
.F.perform_level_order_traversal_simulation._16.if.exit.1:
  mv s0, s8                                                             # ir inst 68 fin
  slli t2, s0, 2
  add s1, a2, t2                                                        # ir inst 69 fin
  lw s0, 0(s1)                                                          # ir inst 70 fin
  li t2, -1
  xor t0, s0, t2
  sltu s1, zero, t0                                                     # ir inst 71 fin
  bnez s1, .F.perform_level_order_traversal_simulation._17.if.then.2
  j .F.perform_level_order_traversal_simulation._18.if.else.2           # ir inst 72 fin
.F.perform_level_order_traversal_simulation._17.if.then.2:
  mv s0, s6                                                             # ir inst 73 fin
  slli t2, s0, 2
  addi t1, sp, 72
  add s1, t1, t2                                                        # ir inst 74 fin
  mv s0, s8                                                             # ir inst 75 fin
  slli t2, s0, 2
  add s8, a2, t2                                                        # ir inst 76 fin
  lw s0, 0(s8)                                                          # ir inst 77 fin
  sw s0, 0(s1)                                                          # ir inst 78 fin
  addi s8, s6, 1                                                        # ir inst 79 fin
# Phi connections
  j .F.perform_level_order_traversal_simulation._19.if.exit.2           # ir inst 80 fin
.F.perform_level_order_traversal_simulation._18.if.else.2:
# Phi connections
  mv s8, s6
  j .F.perform_level_order_traversal_simulation._19.if.exit.2           # ir inst 81 fin
.F.perform_level_order_traversal_simulation._19.if.exit.2:
  addi s6, t4, 1                                                        # ir inst 83 fin
# Phi connections
  mv s9, s7
  mv s10, s8
  mv t3, s5
  mv t4, s6
  j .F.perform_level_order_traversal_simulation._9.while.cond.1         # ir inst 84 fin
.F.perform_level_order_traversal_simulation._20.while.exit.1:
  mul t4, t3, t6                                                        # ir inst 85 fin
  add t3, t5, t4                                                        # ir inst 86 fin
  addi t4, t6, 1                                                        # ir inst 87 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  mv t3, s9
  mv t4, s10
  j .F.perform_level_order_traversal_simulation._7.while.cond.0         # ir inst 88 fin
.F.perform_level_order_traversal_simulation._21.while.exit.0:
  mv a0, t5
  j .F.perform_level_order_traversal_simulation.epilogue                # ir inst 89 fin
.F.perform_level_order_traversal_simulation.epilogue:
  ld s7, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  ld s9, 24(sp)
  ld s5, 32(sp)
  ld s0, 40(sp)
  ld s8, 48(sp)
  ld s1, 56(sp)
  ld s6, 64(sp)
  addi sp, sp, 880
  ret

.globl .F.compute_diagonal_traversal_sum
.F.compute_diagonal_traversal_sum:
# spill func args num: 1,             range:      104(sp) -      104(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 0 / 12,        range:       96(sp) -       96(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd ra, 96(sp)
.F.compute_diagonal_traversal_sum._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_diagonal_traversal_sum._1.if.then.0
  j .F.compute_diagonal_traversal_sum._2.if.else.0                      # ir inst 2 fin
.F.compute_diagonal_traversal_sum._1.if.then.0:
  li a0, 0
  j .F.compute_diagonal_traversal_sum.epilogue                          # ir inst 3 fin
.F.compute_diagonal_traversal_sum._2.if.else.0:
  j .F.compute_diagonal_traversal_sum._3.if.exit.0                      # ir inst 4 fin
.F.compute_diagonal_traversal_sum._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  addi t5, a7, 1                                                        # ir inst 8 fin
  mul t4, t6, t5                                                        # ir inst 9 fin
  mv t6, a6                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 11 fin
  lw t6, 0(t5)                                                          # ir inst 12 fin
  ld t1, 104(sp)
  addi t5, t1, 1                                                        # ir inst 13 fin
  mul t3, t6, t5                                                        # ir inst 14 fin
  add t6, t4, t3                                                        # ir inst 15 fin
  mv t5, a6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 17 fin
  lw t5, 0(t4)                                                          # ir inst 18 fin
  addi t4, a7, 1                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  ld t1, 104(sp)
  sd t1, -8(sp)
  mv a7, t4
  mv a6, t5
  call .F.compute_diagonal_traversal_sum
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 20 fin
  mv t5, a6                                                             # ir inst 21 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 22 fin
  lw t5, 0(t4)                                                          # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  ld t1, 104(sp)
  sd t1, -8(sp)
  mv a6, t5
  call .F.compute_diagonal_traversal_sum
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 24 fin
  add t5, t6, t3                                                        # ir inst 25 fin
  add t6, t5, t4                                                        # ir inst 26 fin
  mv a0, t6
  j .F.compute_diagonal_traversal_sum.epilogue                          # ir inst 27 fin
.F.compute_diagonal_traversal_sum.epilogue:
  ld ra, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.compute_complex_tree_properties
.F.compute_complex_tree_properties:
# spill func args num: 1,             range:      120(sp) -      120(sp)
# local var size: 0,                  range:      120(sp) -      120(sp)
# return addr size: 8,                range:      112(sp) -      120(sp)
# callee save reg num: 2 / 12,        range:       96(sp) -      112(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 96(sp)
  sd s10, 104(sp)
  sd ra, 112(sp)
.F.compute_complex_tree_properties._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  ld t1, 120(sp)
  mv a7, t1
  call .F.compute_fibonacci_sum_for_nodes
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  call .F.compute_prime_factor_analysis
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  li a7, 1
  call .F.compute_recursive_depth_product
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  ld t1, 120(sp)
  mv a7, t1
  call .F.perform_mathematical_sequence_analysis
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd t4, 64(sp)
  sd a7, 72(sp)
  sd t5, 80(sp)
  sd t6, 88(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  call .F.perform_nested_loop_computation_on_tree
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld t4, 64(sp)
  ld a7, 72(sp)
  ld t5, 80(sp)
  ld t6, 88(sp)
# ir inst 5 fin
  li t2, 7
  mul s10, t6, t2                                                       # ir inst 6 fin
  li t2, 11
  mul t6, t5, t2                                                        # ir inst 7 fin
  add t5, s10, t6                                                       # ir inst 8 fin
  li t2, 13
  mul t6, t4, t2                                                        # ir inst 9 fin
  add t4, t5, t6                                                        # ir inst 10 fin
  li t2, 17
  mul t6, t3, t2                                                        # ir inst 11 fin
  add t5, t4, t6                                                        # ir inst 12 fin
  li t2, 19
  mul t6, s11, t2                                                       # ir inst 13 fin
  add t4, t5, t6                                                        # ir inst 14 fin
  li t2, 1000000
  rem t6, t4, t2                                                        # ir inst 15 fin
  mv a0, t6
  j .F.compute_complex_tree_properties.epilogue                         # ir inst 16 fin
.F.compute_complex_tree_properties.epilogue:
  ld ra, 112(sp)
  ld s11, 96(sp)
  ld s10, 104(sp)
  addi sp, sp, 128
  ret

.globl .F.compute_fibonacci_sum_for_nodes
.F.compute_fibonacci_sum_for_nodes:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 0 / 12,        range:       88(sp) -       88(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 88(sp)
.F.compute_fibonacci_sum_for_nodes._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_fibonacci_sum_for_nodes._1.if.then.0
  j .F.compute_fibonacci_sum_for_nodes._2.if.else.0                     # ir inst 2 fin
.F.compute_fibonacci_sum_for_nodes._1.if.then.0:
  li a0, 0
  j .F.compute_fibonacci_sum_for_nodes.epilogue                         # ir inst 3 fin
.F.compute_fibonacci_sum_for_nodes._2.if.else.0:
  j .F.compute_fibonacci_sum_for_nodes._3.if.exit.0                     # ir inst 4 fin
.F.compute_fibonacci_sum_for_nodes._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, 20
  rem t5, t6, t2                                                        # ir inst 8 fin
  li t2, 5
  rem t6, a7, t2                                                        # ir inst 9 fin
  add t4, t5, t6                                                        # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  mv a0, t4
  call .F.compute_fibonacci_iterative
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
# ir inst 11 fin
  mv t5, a6                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 13 fin
  lw t5, 0(t4)                                                          # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t5
  call .F.compute_fibonacci_sum_for_nodes
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 15 fin
  mv t5, a6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 17 fin
  lw t5, 0(t3)                                                          # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t5
  call .F.compute_fibonacci_sum_for_nodes
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 19 fin
  add t5, t6, t4                                                        # ir inst 20 fin
  add t6, t5, t3                                                        # ir inst 21 fin
  mv a0, t6
  j .F.compute_fibonacci_sum_for_nodes.epilogue                         # ir inst 22 fin
.F.compute_fibonacci_sum_for_nodes.epilogue:
  ld ra, 88(sp)
  addi sp, sp, 96
  ret

.globl .F.compute_fibonacci_iterative
.F.compute_fibonacci_iterative:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.compute_fibonacci_iterative._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.compute_fibonacci_iterative._1.if.then.0
  j .F.compute_fibonacci_iterative._2.if.else.0                         # ir inst 2 fin
.F.compute_fibonacci_iterative._1.if.then.0:
  j .F.compute_fibonacci_iterative.epilogue                             # ir inst 3 fin
.F.compute_fibonacci_iterative._2.if.else.0:
  j .F.compute_fibonacci_iterative._3.if.exit.0                         # ir inst 4 fin
.F.compute_fibonacci_iterative._3.if.exit.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 2
  j .F.compute_fibonacci_iterative._4.while.cond.0                      # ir inst 5 fin
.F.compute_fibonacci_iterative._4.while.cond.0:
  slt t0, a0, t6
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.compute_fibonacci_iterative._5.while.body.0
  j .F.compute_fibonacci_iterative._6.while.exit.0                      # ir inst 10 fin
.F.compute_fibonacci_iterative._5.while.body.0:
  add t3, t4, t5                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t4
  mv t4, t5
  mv t5, t3
  j .F.compute_fibonacci_iterative._4.while.cond.0                      # ir inst 13 fin
.F.compute_fibonacci_iterative._6.while.exit.0:
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 14 fin
  mv a0, t6
  j .F.compute_fibonacci_iterative.epilogue                             # ir inst 15 fin
.F.compute_fibonacci_iterative.epilogue:
  ret

.globl .F.compute_prime_factor_analysis
.F.compute_prime_factor_analysis:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 0 / 12,        range:       96(sp) -       96(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd ra, 96(sp)
.F.compute_prime_factor_analysis._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_prime_factor_analysis._1.if.then.0
  j .F.compute_prime_factor_analysis._2.if.else.0                       # ir inst 2 fin
.F.compute_prime_factor_analysis._1.if.then.0:
  li a0, 0
  j .F.compute_prime_factor_analysis.epilogue                           # ir inst 3 fin
.F.compute_prime_factor_analysis._2.if.else.0:
  j .F.compute_prime_factor_analysis._3.if.exit.0                       # ir inst 4 fin
.F.compute_prime_factor_analysis._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a0, t6
  call .F.abs
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 8 fin
  addi t6, t5, 1                                                        # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a0, t6
  call .F.count_prime_factors
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 10 fin
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t4, a4, t2                                                        # ir inst 12 fin
  lw t6, 0(t4)                                                          # ir inst 13 fin
  addi t4, t6, 1                                                        # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  mv a0, t4
  call .F.count_prime_factors
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
# ir inst 15 fin
  mv t4, a6                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, a5, t2                                                        # ir inst 17 fin
  lw t4, 0(t3)                                                          # ir inst 18 fin
  addi t3, t4, 1                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  mv a0, t3
  call .F.count_prime_factors
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 20 fin
  li t2, 5
  mul t3, t5, t2                                                        # ir inst 21 fin
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 22 fin
  add t6, t3, t5                                                        # ir inst 23 fin
  li t2, 7
  mul t5, t4, t2                                                        # ir inst 24 fin
  add t4, t6, t5                                                        # ir inst 25 fin
  mv t6, a6                                                             # ir inst 26 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 27 fin
  lw t6, 0(t5)                                                          # ir inst 28 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t6, 72(sp)
  mv a6, t6
  call .F.compute_prime_factor_analysis
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t6, 72(sp)
# ir inst 29 fin
  mv t6, a6                                                             # ir inst 30 fin
  slli t2, t6, 2
  add t3, a2, t2                                                        # ir inst 31 fin
  lw t6, 0(t3)                                                          # ir inst 32 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t6
  call .F.compute_prime_factor_analysis
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 33 fin
  add t6, t4, t5                                                        # ir inst 34 fin
  add t5, t6, t3                                                        # ir inst 35 fin
  mv a0, t5
  j .F.compute_prime_factor_analysis.epilogue                           # ir inst 36 fin
.F.compute_prime_factor_analysis.epilogue:
  ld ra, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.count_prime_factors
.F.count_prime_factors:
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
.F.count_prime_factors._0.entry.0:
# Phi connections
  mv t4, a0
  li t5, 0
  li t6, 2
  j .F.count_prime_factors._1.while.cond.0                              # ir inst 1 fin
.F.count_prime_factors._1.while.cond.0:
  mul t3, t6, t6                                                        # ir inst 5 fin
  slt t0, t4, t3
  xori s11, t0, 1                                                       # ir inst 6 fin
  bnez s11, .F.count_prime_factors._2.while.body.0
  j .F.count_prime_factors._6.while.exit.0                              # ir inst 7 fin
.F.count_prime_factors._2.while.body.0:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.count_prime_factors._3.while.cond.1                              # ir inst 8 fin
.F.count_prime_factors._3.while.cond.1:
  rem s10, s11, t6                                                      # ir inst 11 fin
  li t2, 0
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 12 fin
  bnez s9, .F.count_prime_factors._4.while.body.1
  j .F.count_prime_factors._5.while.exit.1                              # ir inst 13 fin
.F.count_prime_factors._4.while.body.1:
  addi s10, t3, 1                                                       # ir inst 14 fin
  div s9, s11, t6                                                       # ir inst 15 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  j .F.count_prime_factors._3.while.cond.1                              # ir inst 16 fin
.F.count_prime_factors._5.while.exit.1:
  addi s10, t6, 1                                                       # ir inst 17 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.count_prime_factors._1.while.cond.0                              # ir inst 18 fin
.F.count_prime_factors._6.while.exit.0:
  li t2, 1
  slt t6, t2, t4                                                        # ir inst 19 fin
  bnez t6, .F.count_prime_factors._7.if.then.0
  j .F.count_prime_factors._8.if.else.0                                 # ir inst 20 fin
.F.count_prime_factors._7.if.then.0:
  addi t6, t5, 1                                                        # ir inst 21 fin
# Phi connections
  j .F.count_prime_factors._9.if.exit.0                                 # ir inst 22 fin
.F.count_prime_factors._8.if.else.0:
# Phi connections
  mv t6, t5
  j .F.count_prime_factors._9.if.exit.0                                 # ir inst 23 fin
.F.count_prime_factors._9.if.exit.0:
  mv a0, t6
  j .F.count_prime_factors.epilogue                                     # ir inst 25 fin
.F.count_prime_factors.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.compute_recursive_depth_product
.F.compute_recursive_depth_product:
# spill func args num: 1,             range:      120(sp) -      120(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 1 / 12,        range:       96(sp) -      104(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 96(sp)
  sd ra, 104(sp)
.F.compute_recursive_depth_product._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_recursive_depth_product._1.if.then.0
  j .F.compute_recursive_depth_product._2.if.else.0                     # ir inst 2 fin
.F.compute_recursive_depth_product._1.if.then.0:
  li a0, 1
  j .F.compute_recursive_depth_product.epilogue                         # ir inst 3 fin
.F.compute_recursive_depth_product._2.if.else.0:
  j .F.compute_recursive_depth_product._3.if.exit.0                     # ir inst 4 fin
.F.compute_recursive_depth_product._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, 10
  rem t5, t6, t2                                                        # ir inst 8 fin
  addi t6, t5, 1                                                        # ir inst 9 fin
  li t2, 5
  rem t5, a7, t2                                                        # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
  mul t5, t6, t4                                                        # ir inst 12 fin
  ld t1, 120(sp)
  li t2, 3
  rem t6, t1, t2                                                        # ir inst 13 fin
  addi t4, t6, 1                                                        # ir inst 14 fin
  add t6, t5, t4                                                        # ir inst 15 fin
  mv t5, a6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 17 fin
  lw t5, 0(t4)                                                          # ir inst 18 fin
  addi t4, a7, 1                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  mv a7, t4
  mv a6, t5
  call .F.compute_recursive_depth_product
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 20 fin
  mv t5, a6                                                             # ir inst 21 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 22 fin
  lw t5, 0(t4)                                                          # ir inst 23 fin
  addi t4, a7, 1                                                        # ir inst 24 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  ld t1, 120(sp)
  sd t1, -8(sp)
  mv a7, t4
  mv a6, t5
  call .F.compute_recursive_depth_product
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 25 fin
  mul t5, t6, t3                                                        # ir inst 26 fin
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 27 fin
  mul t5, t6, s11                                                       # ir inst 28 fin
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 29 fin
  li t2, 100000
  rem t5, t6, t2                                                        # ir inst 30 fin
  mv a0, t5
  j .F.compute_recursive_depth_product.epilogue                         # ir inst 31 fin
.F.compute_recursive_depth_product.epilogue:
  ld ra, 104(sp)
  ld s11, 96(sp)
  addi sp, sp, 128
  ret

.globl .F.perform_mathematical_sequence_analysis
.F.perform_mathematical_sequence_analysis:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 0,                  range:      120(sp) -      120(sp)
# return addr size: 8,                range:      112(sp) -      120(sp)
# callee save reg num: 2 / 12,        range:       96(sp) -      112(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 96(sp)
  sd s10, 104(sp)
  sd ra, 112(sp)
.F.perform_mathematical_sequence_analysis._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_mathematical_sequence_analysis._1.if.then.0
  j .F.perform_mathematical_sequence_analysis._2.if.else.0              # ir inst 2 fin
.F.perform_mathematical_sequence_analysis._1.if.then.0:
  li a0, 0
  j .F.perform_mathematical_sequence_analysis.epilogue                  # ir inst 3 fin
.F.perform_mathematical_sequence_analysis._2.if.else.0:
  j .F.perform_mathematical_sequence_analysis._3.if.exit.0              # ir inst 4 fin
.F.perform_mathematical_sequence_analysis._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  mv t5, a6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, a4, t2                                                        # ir inst 9 fin
  lw t5, 0(t4)                                                          # ir inst 10 fin
  mv t4, a6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a5, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  mv a2, t4
  mv a1, t5
  mv a0, t6
  call .F.compute_arithmetic_sequence_sum
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 14 fin
  mv t6, a6                                                             # ir inst 15 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 16 fin
  lw t6, 0(t5)                                                          # ir inst 17 fin
  li t2, 5
  rem t5, t6, t2                                                        # ir inst 18 fin
  addi t6, t5, 1                                                        # ir inst 19 fin
  mv t5, a6                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, a4, t2                                                        # ir inst 21 fin
  lw t5, 0(t4)                                                          # ir inst 22 fin
  li t2, 3
  rem t4, t5, t2                                                        # ir inst 23 fin
  addi t5, t4, 1                                                        # ir inst 24 fin
  li t2, 7
  rem t4, a7, t2                                                        # ir inst 25 fin
  addi s11, t4, 3                                                       # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  mv a2, s11
  mv a1, t5
  mv a0, t6
  call .F.compute_geometric_sequence_sum
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 27 fin
  mv t6, a6                                                             # ir inst 28 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 29 fin
  lw t6, 0(t5)                                                          # ir inst 30 fin
  mv t5, a6                                                             # ir inst 31 fin
  slli t2, t5, 2
  add s11, a4, t2                                                       # ir inst 32 fin
  lw t5, 0(s11)                                                         # ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd t4, 64(sp)
  sd a7, 72(sp)
  sd t5, 80(sp)
  sd t6, 88(sp)
  mv a2, a7
  mv a1, t5
  mv a0, t6
  call .F.compute_quadratic_sequence_sum
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld t4, 64(sp)
  ld a7, 72(sp)
  ld t5, 80(sp)
  ld t6, 88(sp)
# ir inst 34 fin
  mv t6, a6                                                             # ir inst 35 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 36 fin
  lw t6, 0(t5)                                                          # ir inst 37 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd a6, 56(sp)
  sd t4, 64(sp)
  sd a7, 72(sp)
  sd t6, 80(sp)
  mv a6, t6
  call .F.perform_mathematical_sequence_analysis
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld a6, 56(sp)
  ld t4, 64(sp)
  ld a7, 72(sp)
  ld t6, 80(sp)
# ir inst 38 fin
  mv t6, a6                                                             # ir inst 39 fin
  slli t2, t6, 2
  add s10, a2, t2                                                       # ir inst 40 fin
  lw t6, 0(s10)                                                         # ir inst 41 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t3, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  mv a6, t6
  call .F.perform_mathematical_sequence_analysis
  mv s10, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t3, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 42 fin
  add t6, t3, t4                                                        # ir inst 43 fin
  add t4, t6, s11                                                       # ir inst 44 fin
  add t6, t4, t5                                                        # ir inst 45 fin
  add t5, t6, s10                                                       # ir inst 46 fin
  mv a0, t5
  j .F.perform_mathematical_sequence_analysis.epilogue                  # ir inst 47 fin
.F.perform_mathematical_sequence_analysis.epilogue:
  ld ra, 112(sp)
  ld s11, 96(sp)
  ld s10, 104(sp)
  addi sp, sp, 128
  ret

.globl .F.compute_arithmetic_sequence_sum
.F.compute_arithmetic_sequence_sum:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.compute_arithmetic_sequence_sum._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a2
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a1, 20
  mv a0, t6
  call .F.min
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 2 fin
  li t2, 100
  rem t6, a0, t2                                                        # ir inst 3 fin
  li t2, 10
  rem t4, a1, t2                                                        # ir inst 4 fin
  slli t3, t6, 1                                                        # ir inst 5 fin
  addi t6, t5, -1                                                       # ir inst 6 fin
  mul s11, t6, t4                                                       # ir inst 7 fin
  add t6, t3, s11                                                       # ir inst 8 fin
  mul t4, t5, t6                                                        # ir inst 9 fin
  li t2, 2
  div t6, t4, t2                                                        # ir inst 10 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.abs
  mv t5, a0
  ld t6, 0(sp)
# ir inst 11 fin
  li t2, 10000
  rem t6, t5, t2                                                        # ir inst 12 fin
  mv a0, t6
  j .F.compute_arithmetic_sequence_sum.epilogue                         # ir inst 13 fin
.F.compute_arithmetic_sequence_sum.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.compute_geometric_sequence_sum
.F.compute_geometric_sequence_sum:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.compute_geometric_sequence_sum._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a2
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a1, 15
  mv a0, t6
  call .F.min
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 3 fin
  li t2, 10
  rem t4, t6, t2                                                        # ir inst 4 fin
  addi t6, t4, 1                                                        # ir inst 5 fin
# Start call preparation
  sd a1, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, a1
  call .F.abs
  mv t4, a0
  ld a1, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  li t2, 3
  rem t3, t4, t2                                                        # ir inst 7 fin
  addi t4, t3, 1                                                        # ir inst 8 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.compute_geometric_sequence_sum._1.if.then.0
  j .F.compute_geometric_sequence_sum._2.if.else.0                      # ir inst 10 fin
.F.compute_geometric_sequence_sum._1.if.then.0:
  mul t3, t6, t5                                                        # ir inst 11 fin
  li t2, 10000
  rem s11, t3, t2                                                       # ir inst 12 fin
  mv a0, s11
  j .F.compute_geometric_sequence_sum.epilogue                          # ir inst 13 fin
.F.compute_geometric_sequence_sum._2.if.else.0:
  j .F.compute_geometric_sequence_sum._3.if.exit.0                      # ir inst 14 fin
.F.compute_geometric_sequence_sum._3.if.exit.0:
# Phi connections
  mv s11, t6
  li t3, 0
  li t6, 0
  j .F.compute_geometric_sequence_sum._4.while.cond.0                   # ir inst 15 fin
.F.compute_geometric_sequence_sum._4.while.cond.0:
  slt s10, t3, t5                                                       # ir inst 19 fin
  bnez s10, .F.compute_geometric_sequence_sum._5.while.body.0
  j .F.compute_geometric_sequence_sum._6.while.exit.0                   # ir inst 20 fin
.F.compute_geometric_sequence_sum._5.while.body.0:
  add s10, t6, s11                                                      # ir inst 21 fin
  li t2, 10000
  rem s9, s10, t2                                                       # ir inst 22 fin
  mul s10, s11, t4                                                      # ir inst 23 fin
  li t2, 1000
  rem s11, s10, t2                                                      # ir inst 24 fin
  addi s10, t3, 1                                                       # ir inst 25 fin
# Phi connections
  mv t3, s10
  mv t6, s9
  j .F.compute_geometric_sequence_sum._4.while.cond.0                   # ir inst 26 fin
.F.compute_geometric_sequence_sum._6.while.exit.0:
  mv a0, t6
  j .F.compute_geometric_sequence_sum.epilogue                          # ir inst 27 fin
.F.compute_geometric_sequence_sum.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.compute_quadratic_sequence_sum
.F.compute_quadratic_sequence_sum:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 4 / 12,        range:       40(sp) -       72(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 40(sp)
  sd s8, 48(sp)
  sd s9, 56(sp)
  sd s10, 64(sp)
  sd ra, 72(sp)
.F.compute_quadratic_sequence_sum._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a2
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  li a1, 25
  mv a0, t6
  call .F.min
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 3 fin
  li t2, 10
  rem t4, t6, t2                                                        # ir inst 4 fin
  addi t6, t4, 1                                                        # ir inst 5 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, a1
  call .F.abs
  mv t4, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 6 fin
  li t2, 5
  rem t3, t4, t2                                                        # ir inst 7 fin
  addi t4, t3, 1                                                        # ir inst 8 fin
# Phi connections
  li s11, 0
  li t3, 1
  j .F.compute_quadratic_sequence_sum._1.while.cond.0                   # ir inst 9 fin
.F.compute_quadratic_sequence_sum._1.while.cond.0:
  slt t0, t5, t3
  xori s10, t0, 1                                                       # ir inst 12 fin
  bnez s10, .F.compute_quadratic_sequence_sum._2.while.body.0
  j .F.compute_quadratic_sequence_sum._3.while.exit.0                   # ir inst 13 fin
.F.compute_quadratic_sequence_sum._2.while.body.0:
  mul s10, t6, t3                                                       # ir inst 14 fin
  mul s9, s10, t3                                                       # ir inst 15 fin
  mul s10, t4, t3                                                       # ir inst 16 fin
  add s8, s9, s10                                                       # ir inst 17 fin
  li t2, 7
  rem s10, a2, t2                                                       # ir inst 18 fin
  add s9, s8, s10                                                       # ir inst 19 fin
  add s10, s11, s9                                                      # ir inst 20 fin
  li t2, 10000
  rem s9, s10, t2                                                       # ir inst 21 fin
  addi s10, t3, 1                                                       # ir inst 22 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  j .F.compute_quadratic_sequence_sum._1.while.cond.0                   # ir inst 23 fin
.F.compute_quadratic_sequence_sum._3.while.exit.0:
  mv a0, s11
  j .F.compute_quadratic_sequence_sum.epilogue                          # ir inst 24 fin
.F.compute_quadratic_sequence_sum.epilogue:
  ld ra, 72(sp)
  ld s11, 40(sp)
  ld s8, 48(sp)
  ld s9, 56(sp)
  ld s10, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.perform_nested_loop_computation_on_tree
.F.perform_nested_loop_computation_on_tree:
# spill func args num: 1,             range:      120(sp) -      120(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 5 / 12,        range:       64(sp) -      104(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s10, 64(sp)
  sd s7, 72(sp)
  sd s8, 80(sp)
  sd s9, 88(sp)
  sd s11, 96(sp)
  sd ra, 104(sp)
.F.perform_nested_loop_computation_on_tree._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.perform_nested_loop_computation_on_tree._1.while.cond.0          # ir inst 1 fin
.F.perform_nested_loop_computation_on_tree._1.while.cond.0:
  slt t4, t5, a7                                                        # ir inst 4 fin
  bnez t4, .F.perform_nested_loop_computation_on_tree._2.while.body.0
  j .F.perform_nested_loop_computation_on_tree._9.while.exit.0          # ir inst 5 fin
.F.perform_nested_loop_computation_on_tree._2.while.body.0:
# Phi connections
  mv t3, t6
  li t4, 0
  j .F.perform_nested_loop_computation_on_tree._3.while.cond.1          # ir inst 6 fin
.F.perform_nested_loop_computation_on_tree._3.while.cond.1:
  mv s11, t5                                                            # ir inst 9 fin
  slli t2, s11, 2
  add s10, a5, t2                                                       # ir inst 10 fin
  lw s11, 0(s10)                                                        # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a4, 8(sp)
  sd a5, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd a7, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  li a1, 15
  mv a0, s11
  call .F.min
  mv s10, a0
  ld a0, 0(sp)
  ld a4, 8(sp)
  ld a5, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld a7, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 12 fin
  slt s11, t4, s10                                                      # ir inst 13 fin
  bnez s11, .F.perform_nested_loop_computation_on_tree._4.while.body.1
  j .F.perform_nested_loop_computation_on_tree._8.while.exit.1          # ir inst 14 fin
.F.perform_nested_loop_computation_on_tree._4.while.body.1:
# Phi connections
  mv s10, t3
  li s11, 0
  j .F.perform_nested_loop_computation_on_tree._5.while.cond.2          # ir inst 15 fin
.F.perform_nested_loop_computation_on_tree._5.while.cond.2:
  mv s9, t5                                                             # ir inst 18 fin
  slli t2, s9, 2
  add s8, a4, t2                                                        # ir inst 19 fin
  lw s9, 0(s8)                                                          # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a4, 8(sp)
  sd a5, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd a7, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  li a1, 8
  mv a0, s9
  call .F.min
  mv s8, a0
  ld a0, 0(sp)
  ld a4, 8(sp)
  ld a5, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld a7, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 21 fin
  slt s9, s11, s8                                                       # ir inst 22 fin
  bnez s9, .F.perform_nested_loop_computation_on_tree._6.while.body.2
  j .F.perform_nested_loop_computation_on_tree._7.while.exit.2          # ir inst 23 fin
.F.perform_nested_loop_computation_on_tree._6.while.body.2:
  mv s9, t5                                                             # ir inst 24 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 25 fin
  lw s9, 0(s8)                                                          # ir inst 26 fin
  addi s8, t4, 1                                                        # ir inst 27 fin
  mul s7, s9, s8                                                        # ir inst 28 fin
  addi s9, s11, 1                                                       # ir inst 29 fin
  mul s8, s7, s9                                                        # ir inst 30 fin
  addi s9, t5, 1                                                        # ir inst 31 fin
  ld t1, 120(sp)
  mul s7, t1, s9                                                        # ir inst 32 fin
  add s9, s8, s7                                                        # ir inst 33 fin
  li t2, 1000
  rem s8, s9, t2                                                        # ir inst 34 fin
  add s9, s10, s8                                                       # ir inst 35 fin
  li t2, 100000
  rem s8, s9, t2                                                        # ir inst 36 fin
  mv s9, t5                                                             # ir inst 37 fin
  slli t2, s9, 2
  add s7, a0, t2                                                        # ir inst 38 fin
  lw s9, 0(s7)                                                          # ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  sd a4, 8(sp)
  sd a5, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd a7, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  ld t1, 120(sp)
  mv a3, t1
  mv a2, s11
  mv a1, t4
  mv a0, s9
  call .F.perform_inner_nested_computation
  mv s7, a0
  ld a0, 0(sp)
  ld a4, 8(sp)
  ld a5, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld a7, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 40 fin
  add s9, s8, s7                                                        # ir inst 41 fin
  li t2, 100000
  rem s8, s9, t2                                                        # ir inst 42 fin
  addi s9, s11, 1                                                       # ir inst 43 fin
# Phi connections
  mv s10, s8
  mv s11, s9
  j .F.perform_nested_loop_computation_on_tree._5.while.cond.2          # ir inst 44 fin
.F.perform_nested_loop_computation_on_tree._7.while.exit.2:
  addi s11, t4, 1                                                       # ir inst 45 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.perform_nested_loop_computation_on_tree._3.while.cond.1          # ir inst 46 fin
.F.perform_nested_loop_computation_on_tree._8.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 47 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.perform_nested_loop_computation_on_tree._1.while.cond.0          # ir inst 48 fin
.F.perform_nested_loop_computation_on_tree._9.while.exit.0:
  mv a0, t6
  j .F.perform_nested_loop_computation_on_tree.epilogue                 # ir inst 49 fin
.F.perform_nested_loop_computation_on_tree.epilogue:
  ld ra, 104(sp)
  ld s10, 64(sp)
  ld s7, 72(sp)
  ld s8, 80(sp)
  ld s9, 88(sp)
  ld s11, 96(sp)
  addi sp, sp, 128
  ret

.globl .F.perform_inner_nested_computation
.F.perform_inner_nested_computation:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 6 / 12,        range:       56(sp) -      104(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s9, 56(sp)
  sd s6, 64(sp)
  sd s8, 72(sp)
  sd s7, 80(sp)
  sd s10, 88(sp)
  sd s11, 96(sp)
  sd ra, 104(sp)
.F.perform_inner_nested_computation._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 1 fin
  li t2, 50
  rem t5, t6, t2                                                        # ir inst 2 fin
  addi t6, t5, 1                                                        # ir inst 3 fin
# Phi connections
  li t4, 1
  li t5, 0
  j .F.perform_inner_nested_computation._1.while.cond.0                 # ir inst 4 fin
.F.perform_inner_nested_computation._1.while.cond.0:
  addi t3, a1, 1                                                        # ir inst 7 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a1, 5
  mv a0, t3
  call .F.min
  mv s11, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 8 fin
  slt t0, s11, t4
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.perform_inner_nested_computation._2.while.body.0
  j .F.perform_inner_nested_computation._9.while.exit.0                 # ir inst 10 fin
.F.perform_inner_nested_computation._2.while.body.0:
# Phi connections
  li s11, 1
  mv t3, t5
  j .F.perform_inner_nested_computation._3.while.cond.1                 # ir inst 11 fin
.F.perform_inner_nested_computation._3.while.cond.1:
  addi s10, a2, 1                                                       # ir inst 14 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a1, 4
  mv a0, s10
  call .F.min
  mv s9, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 15 fin
  slt t0, s9, s11
  xori s10, t0, 1                                                       # ir inst 16 fin
  bnez s10, .F.perform_inner_nested_computation._4.while.body.1
  j .F.perform_inner_nested_computation._8.while.exit.1                 # ir inst 17 fin
.F.perform_inner_nested_computation._4.while.body.1:
# Phi connections
  mv s9, t3
  li s10, 1
  j .F.perform_inner_nested_computation._5.while.cond.2                 # ir inst 18 fin
.F.perform_inner_nested_computation._5.while.cond.2:
  addi s8, a3, 1                                                        # ir inst 21 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a1, 3
  mv a0, s8
  call .F.min
  mv s7, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 22 fin
  slt t0, s7, s10
  xori s8, t0, 1                                                        # ir inst 23 fin
  bnez s8, .F.perform_inner_nested_computation._6.while.body.2
  j .F.perform_inner_nested_computation._7.while.exit.2                 # ir inst 24 fin
.F.perform_inner_nested_computation._6.while.body.2:
  mul s8, t6, t4                                                        # ir inst 25 fin
  mul s7, s8, s11                                                       # ir inst 26 fin
  mul s8, s7, s10                                                       # ir inst 27 fin
  mul s7, t4, t4                                                        # ir inst 28 fin
  add s6, s8, s7                                                        # ir inst 29 fin
  mul s8, s11, s11                                                      # ir inst 30 fin
  add s7, s6, s8                                                        # ir inst 31 fin
  mul s8, s10, s10                                                      # ir inst 32 fin
  add s6, s7, s8                                                        # ir inst 33 fin
  li t2, 1000
  rem s8, s6, t2                                                        # ir inst 34 fin
  add s7, s9, s8                                                        # ir inst 35 fin
  li t2, 10000
  rem s8, s7, t2                                                        # ir inst 36 fin
  addi s7, s10, 1                                                       # ir inst 37 fin
# Phi connections
  mv s9, s8
  mv s10, s7
  j .F.perform_inner_nested_computation._5.while.cond.2                 # ir inst 38 fin
.F.perform_inner_nested_computation._7.while.exit.2:
  addi s10, s11, 1                                                      # ir inst 39 fin
# Phi connections
  mv s11, s10
  mv t3, s9
  j .F.perform_inner_nested_computation._3.while.cond.1                 # ir inst 40 fin
.F.perform_inner_nested_computation._8.while.exit.1:
  addi s11, t4, 1                                                       # ir inst 41 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.perform_inner_nested_computation._1.while.cond.0                 # ir inst 42 fin
.F.perform_inner_nested_computation._9.while.exit.0:
  mv a0, t5
  j .F.perform_inner_nested_computation.epilogue                        # ir inst 43 fin
.F.perform_inner_nested_computation.epilogue:
  ld ra, 104(sp)
  ld s9, 56(sp)
  ld s6, 64(sp)
  ld s8, 72(sp)
  ld s7, 80(sp)
  ld s10, 88(sp)
  ld s11, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.validate_tree_integrity
.F.validate_tree_integrity:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 1 / 12,        range:       96(sp) -      104(sp)
# max caller save reg num: 12 / 12,   range:        0(sp) -       96(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 96(sp)
  sd ra, 104(sp)
.F.validate_tree_integrity._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  li a7, -1
  call .F.validate_tree_structure_recursive
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
# ir inst 1 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  call .F.validate_tree_properties_comprehensive
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  call .F.validate_tree_consistency_checks
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd a7, 64(sp)
  sd t5, 72(sp)
  sd t6, 80(sp)
  call .F.validate_edge_cases_and_boundaries
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld a7, 64(sp)
  ld t5, 72(sp)
  ld t6, 80(sp)
# ir inst 4 fin
  li t2, 13
  mul s11, t6, t2                                                       # ir inst 5 fin
  li t2, 17
  mul t6, t5, t2                                                        # ir inst 6 fin
  add t5, s11, t6                                                       # ir inst 7 fin
  li t2, 19
  mul t6, t4, t2                                                        # ir inst 8 fin
  add t4, t5, t6                                                        # ir inst 9 fin
  li t2, 23
  mul t6, t3, t2                                                        # ir inst 10 fin
  add t5, t4, t6                                                        # ir inst 11 fin
  li t2, 1000000
  rem t6, t5, t2                                                        # ir inst 12 fin
  mv a0, t6
  j .F.validate_tree_integrity.epilogue                                 # ir inst 13 fin
.F.validate_tree_integrity.epilogue:
  ld ra, 104(sp)
  ld s11, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.validate_tree_structure_recursive
.F.validate_tree_structure_recursive:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.validate_tree_structure_recursive._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.validate_tree_structure_recursive._1.if.then.0
  j .F.validate_tree_structure_recursive._2.if.else.0                   # ir inst 2 fin
.F.validate_tree_structure_recursive._1.if.then.0:
  li a0, 1
  j .F.validate_tree_structure_recursive.epilogue                       # ir inst 3 fin
.F.validate_tree_structure_recursive._2.if.else.0:
  j .F.validate_tree_structure_recursive._3.if.exit.0                   # ir inst 4 fin
.F.validate_tree_structure_recursive._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  xor t0, t6, a7
  sltu t5, zero, t0                                                     # ir inst 8 fin
  bnez t5, .F.validate_tree_structure_recursive._4.if.then.1
  j .F.validate_tree_structure_recursive._5.if.else.1                   # ir inst 9 fin
.F.validate_tree_structure_recursive._4.if.then.1:
  li a0, 0
  j .F.validate_tree_structure_recursive.epilogue                       # ir inst 10 fin
.F.validate_tree_structure_recursive._5.if.else.1:
  j .F.validate_tree_structure_recursive._6.if.exit.1                   # ir inst 11 fin
.F.validate_tree_structure_recursive._6.if.exit.1:
  mv t6, a6                                                             # ir inst 12 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 13 fin
  lw t6, 0(t5)                                                          # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  mv a7, a6
  mv a6, t6
  call .F.validate_tree_structure_recursive
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 15 fin
  mv t6, a6                                                             # ir inst 16 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 17 fin
  lw t6, 0(t4)                                                          # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a7, a6
  mv a6, t6
  call .F.validate_tree_structure_recursive
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  sd t5, 64(sp)
  call .F.validate_bst_property_at_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
  ld t5, 64(sp)
# ir inst 20 fin
  mul t3, t5, t4                                                        # ir inst 21 fin
  mul t5, t3, t6                                                        # ir inst 22 fin
  mv a0, t5
  j .F.validate_tree_structure_recursive.epilogue                       # ir inst 23 fin
.F.validate_tree_structure_recursive.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.validate_bst_property_at_node
.F.validate_bst_property_at_node:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.validate_bst_property_at_node._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.validate_bst_property_at_node._1.if.then.0
  j .F.validate_bst_property_at_node._2.if.else.0                       # ir inst 2 fin
.F.validate_bst_property_at_node._1.if.then.0:
  li a0, 1
  j .F.validate_bst_property_at_node.epilogue                           # ir inst 3 fin
.F.validate_bst_property_at_node._2.if.else.0:
  j .F.validate_bst_property_at_node._3.if.exit.0                       # ir inst 4 fin
.F.validate_bst_property_at_node._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.find_maximum_in_subtree
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 8 fin
  mv t6, a6                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 10 fin
  lw t6, 0(t4)                                                          # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t6
  call .F.find_minimum_in_subtree
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 12 fin
  mv t6, a6                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 14 fin
  lw t6, 0(t3)                                                          # ir inst 15 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.validate_bst_property_at_node._4.lazy.then.0
  j .F.validate_bst_property_at_node._5.lazy.else.0                     # ir inst 17 fin
.F.validate_bst_property_at_node._4.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.validate_bst_property_at_node._6.lazy.exit.0                     # ir inst 18 fin
.F.validate_bst_property_at_node._5.lazy.else.0:
  mv t6, a6                                                             # ir inst 19 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 20 fin
  lw t6, 0(t3)                                                          # ir inst 21 fin
  slt t3, t5, t6                                                        # ir inst 22 fin
# Phi connections
  mv t6, t3
  j .F.validate_bst_property_at_node._6.lazy.exit.0                     # ir inst 23 fin
.F.validate_bst_property_at_node._6.lazy.exit.0:
  mv t5, a6                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 26 fin
  lw t5, 0(t3)                                                          # ir inst 27 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 28 fin
  bnez t3, .F.validate_bst_property_at_node._7.lazy.then.1
  j .F.validate_bst_property_at_node._8.lazy.else.1                     # ir inst 29 fin
.F.validate_bst_property_at_node._7.lazy.then.1:
# Phi connections
  li t5, 1
  j .F.validate_bst_property_at_node._9.lazy.exit.1                     # ir inst 30 fin
.F.validate_bst_property_at_node._8.lazy.else.1:
  mv t5, a6                                                             # ir inst 31 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 32 fin
  lw t5, 0(t3)                                                          # ir inst 33 fin
  slt t3, t5, t4                                                        # ir inst 34 fin
# Phi connections
  mv t5, t3
  j .F.validate_bst_property_at_node._9.lazy.exit.1                     # ir inst 35 fin
.F.validate_bst_property_at_node._9.lazy.exit.1:
  bnez t6, .F.validate_bst_property_at_node._10.lazy.then.2
  j .F.validate_bst_property_at_node._11.lazy.else.2                    # ir inst 37 fin
.F.validate_bst_property_at_node._10.lazy.then.2:
# Phi connections
  mv t6, t5
  j .F.validate_bst_property_at_node._12.lazy.exit.2                    # ir inst 38 fin
.F.validate_bst_property_at_node._11.lazy.else.2:
# Phi connections
  li t6, 0
  j .F.validate_bst_property_at_node._12.lazy.exit.2                    # ir inst 39 fin
.F.validate_bst_property_at_node._12.lazy.exit.2:
  bnez t6, .F.validate_bst_property_at_node._13.if.then.1
  j .F.validate_bst_property_at_node._14.if.else.1                      # ir inst 41 fin
.F.validate_bst_property_at_node._13.if.then.1:
# Phi connections
  li t6, 1
  j .F.validate_bst_property_at_node._15.if.exit.1                      # ir inst 42 fin
.F.validate_bst_property_at_node._14.if.else.1:
# Phi connections
  li t6, 0
  j .F.validate_bst_property_at_node._15.if.exit.1                      # ir inst 43 fin
.F.validate_bst_property_at_node._15.if.exit.1:
  mv a0, t6
  j .F.validate_bst_property_at_node.epilogue                           # ir inst 45 fin
.F.validate_bst_property_at_node.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.find_maximum_in_subtree
.F.find_maximum_in_subtree:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.find_maximum_in_subtree._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.find_maximum_in_subtree._1.if.then.0
  j .F.find_maximum_in_subtree._2.if.else.0                             # ir inst 2 fin
.F.find_maximum_in_subtree._1.if.then.0:
  li a0, -100000
  j .F.find_maximum_in_subtree.epilogue                                 # ir inst 3 fin
.F.find_maximum_in_subtree._2.if.else.0:
  j .F.find_maximum_in_subtree._3.if.exit.0                             # ir inst 4 fin
.F.find_maximum_in_subtree._3.if.exit.0:
# Phi connections
  mv t6, a6
  j .F.find_maximum_in_subtree._4.while.cond.0                          # ir inst 5 fin
.F.find_maximum_in_subtree._4.while.cond.0:
  mv t5, t6                                                             # ir inst 7 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 8 fin
  lw t5, 0(t4)                                                          # ir inst 9 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 10 fin
  bnez t4, .F.find_maximum_in_subtree._5.while.body.0
  j .F.find_maximum_in_subtree._6.while.exit.0                          # ir inst 11 fin
.F.find_maximum_in_subtree._5.while.body.0:
  mv t5, t6                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 13 fin
  lw t5, 0(t4)                                                          # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.find_maximum_in_subtree._4.while.cond.0                          # ir inst 15 fin
.F.find_maximum_in_subtree._6.while.exit.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 17 fin
  lw t5, 0(t6)                                                          # ir inst 18 fin
  mv a0, t5
  j .F.find_maximum_in_subtree.epilogue                                 # ir inst 19 fin
.F.find_maximum_in_subtree.epilogue:
  ret

.globl .F.find_minimum_in_subtree
.F.find_minimum_in_subtree:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.find_minimum_in_subtree._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.find_minimum_in_subtree._1.if.then.0
  j .F.find_minimum_in_subtree._2.if.else.0                             # ir inst 2 fin
.F.find_minimum_in_subtree._1.if.then.0:
  li a0, 100000
  j .F.find_minimum_in_subtree.epilogue                                 # ir inst 3 fin
.F.find_minimum_in_subtree._2.if.else.0:
  j .F.find_minimum_in_subtree._3.if.exit.0                             # ir inst 4 fin
.F.find_minimum_in_subtree._3.if.exit.0:
# Phi connections
  mv t6, a6
  j .F.find_minimum_in_subtree._4.while.cond.0                          # ir inst 5 fin
.F.find_minimum_in_subtree._4.while.cond.0:
  mv t5, t6                                                             # ir inst 7 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 8 fin
  lw t5, 0(t4)                                                          # ir inst 9 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 10 fin
  bnez t4, .F.find_minimum_in_subtree._5.while.body.0
  j .F.find_minimum_in_subtree._6.while.exit.0                          # ir inst 11 fin
.F.find_minimum_in_subtree._5.while.body.0:
  mv t5, t6                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 13 fin
  lw t5, 0(t4)                                                          # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.find_minimum_in_subtree._4.while.cond.0                          # ir inst 15 fin
.F.find_minimum_in_subtree._6.while.exit.0:
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 17 fin
  lw t5, 0(t6)                                                          # ir inst 18 fin
  mv a0, t5
  j .F.find_minimum_in_subtree.epilogue                                 # ir inst 19 fin
.F.find_minimum_in_subtree.epilogue:
  ret

.globl .F.validate_tree_properties_comprehensive
.F.validate_tree_properties_comprehensive:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      112(sp) -      112(sp)
# return addr size: 8,                range:      104(sp) -      112(sp)
# callee save reg num: 2 / 12,        range:       88(sp) -      104(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s11, 88(sp)
  sd s10, 96(sp)
  sd ra, 104(sp)
.F.validate_tree_properties_comprehensive._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.validate_tree_properties_comprehensive._1.while.cond.0           # ir inst 1 fin
.F.validate_tree_properties_comprehensive._1.while.cond.0:
  slt t4, t5, a7                                                        # ir inst 4 fin
  bnez t4, .F.validate_tree_properties_comprehensive._2.while.body.0
  j .F.validate_tree_properties_comprehensive._9.while.exit.0           # ir inst 5 fin
.F.validate_tree_properties_comprehensive._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a7, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.compute_expected_height
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a7, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t5
  call .F.compute_expected_subtree_size
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 7 fin
  mv s11, t5                                                            # ir inst 8 fin
  slli t2, s11, 2
  add s10, a4, t2                                                       # ir inst 9 fin
  lw s11, 0(s10)                                                        # ir inst 10 fin
  xor t0, t4, s11
  sltiu s10, t0, 1                                                      # ir inst 11 fin
  bnez s10, .F.validate_tree_properties_comprehensive._3.if.then.0
  j .F.validate_tree_properties_comprehensive._4.if.else.0              # ir inst 12 fin
.F.validate_tree_properties_comprehensive._3.if.then.0:
  addi t4, t6, 10                                                       # ir inst 13 fin
# Phi connections
  j .F.validate_tree_properties_comprehensive._5.if.exit.0              # ir inst 14 fin
.F.validate_tree_properties_comprehensive._4.if.else.0:
# Phi connections
  mv t4, t6
  j .F.validate_tree_properties_comprehensive._5.if.exit.0              # ir inst 15 fin
.F.validate_tree_properties_comprehensive._5.if.exit.0:
  mv s11, t5                                                            # ir inst 17 fin
  slli t2, s11, 2
  add s10, a5, t2                                                       # ir inst 18 fin
  lw s11, 0(s10)                                                        # ir inst 19 fin
  xor t0, t3, s11
  sltiu s10, t0, 1                                                      # ir inst 20 fin
  bnez s10, .F.validate_tree_properties_comprehensive._6.if.then.1
  j .F.validate_tree_properties_comprehensive._7.if.else.1              # ir inst 21 fin
.F.validate_tree_properties_comprehensive._6.if.then.1:
  addi t3, t4, 15                                                       # ir inst 22 fin
# Phi connections
  mv t4, t3
  j .F.validate_tree_properties_comprehensive._8.if.exit.1              # ir inst 23 fin
.F.validate_tree_properties_comprehensive._7.if.else.1:
# Phi connections
  j .F.validate_tree_properties_comprehensive._8.if.exit.1              # ir inst 24 fin
.F.validate_tree_properties_comprehensive._8.if.exit.1:
  addi t3, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.validate_tree_properties_comprehensive._1.while.cond.0           # ir inst 27 fin
.F.validate_tree_properties_comprehensive._9.while.exit.0:
  mv a0, t6
  j .F.validate_tree_properties_comprehensive.epilogue                  # ir inst 28 fin
.F.validate_tree_properties_comprehensive.epilogue:
  ld ra, 104(sp)
  ld s11, 88(sp)
  ld s10, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.compute_expected_height
.F.compute_expected_height:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.compute_expected_height._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_expected_height._1.if.then.0
  j .F.compute_expected_height._2.if.else.0                             # ir inst 2 fin
.F.compute_expected_height._1.if.then.0:
  li a0, 0
  j .F.compute_expected_height.epilogue                                 # ir inst 3 fin
.F.compute_expected_height._2.if.else.0:
  j .F.compute_expected_height._3.if.exit.0                             # ir inst 4 fin
.F.compute_expected_height._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.compute_expected_height._4.if.then.1
  j .F.compute_expected_height._5.if.else.1                             # ir inst 9 fin
.F.compute_expected_height._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.compute_expected_height._6.if.exit.1                             # ir inst 10 fin
.F.compute_expected_height._5.if.else.1:
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.compute_expected_height
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.compute_expected_height._6.if.exit.1                             # ir inst 15 fin
.F.compute_expected_height._6.if.exit.1:
  mv t5, a6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 18 fin
  lw t5, 0(t4)                                                          # ir inst 19 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 20 fin
  bnez t4, .F.compute_expected_height._7.if.then.2
  j .F.compute_expected_height._8.if.else.2                             # ir inst 21 fin
.F.compute_expected_height._7.if.then.2:
# Phi connections
  li t5, 0
  j .F.compute_expected_height._9.if.exit.2                             # ir inst 22 fin
.F.compute_expected_height._8.if.else.2:
  mv t5, a6                                                             # ir inst 23 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 24 fin
  lw t5, 0(t4)                                                          # ir inst 25 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a6, t5
  call .F.compute_expected_height
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F.compute_expected_height._9.if.exit.2                             # ir inst 27 fin
.F.compute_expected_height._9.if.exit.2:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.max
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 29 fin
  addi t6, t4, 1                                                        # ir inst 30 fin
  mv a0, t6
  j .F.compute_expected_height.epilogue                                 # ir inst 31 fin
.F.compute_expected_height.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.compute_expected_subtree_size
.F.compute_expected_subtree_size:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.compute_expected_subtree_size._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.compute_expected_subtree_size._1.if.then.0
  j .F.compute_expected_subtree_size._2.if.else.0                       # ir inst 2 fin
.F.compute_expected_subtree_size._1.if.then.0:
  li a0, 0
  j .F.compute_expected_subtree_size.epilogue                           # ir inst 3 fin
.F.compute_expected_subtree_size._2.if.else.0:
  j .F.compute_expected_subtree_size._3.if.exit.0                       # ir inst 4 fin
.F.compute_expected_subtree_size._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.compute_expected_subtree_size._4.if.then.1
  j .F.compute_expected_subtree_size._5.if.else.1                       # ir inst 9 fin
.F.compute_expected_subtree_size._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.compute_expected_subtree_size._6.if.exit.1                       # ir inst 10 fin
.F.compute_expected_subtree_size._5.if.else.1:
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.compute_expected_subtree_size
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.compute_expected_subtree_size._6.if.exit.1                       # ir inst 15 fin
.F.compute_expected_subtree_size._6.if.exit.1:
  mv t5, a6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 18 fin
  lw t5, 0(t4)                                                          # ir inst 19 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 20 fin
  bnez t4, .F.compute_expected_subtree_size._7.if.then.2
  j .F.compute_expected_subtree_size._8.if.else.2                       # ir inst 21 fin
.F.compute_expected_subtree_size._7.if.then.2:
# Phi connections
  li t5, 0
  j .F.compute_expected_subtree_size._9.if.exit.2                       # ir inst 22 fin
.F.compute_expected_subtree_size._8.if.else.2:
  mv t5, a6                                                             # ir inst 23 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 24 fin
  lw t5, 0(t4)                                                          # ir inst 25 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a6, t5
  call .F.compute_expected_subtree_size
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F.compute_expected_subtree_size._9.if.exit.2                       # ir inst 27 fin
.F.compute_expected_subtree_size._9.if.exit.2:
  add t4, t6, t5                                                        # ir inst 29 fin
  addi t6, t4, 1                                                        # ir inst 30 fin
  mv a0, t6
  j .F.compute_expected_subtree_size.epilogue                           # ir inst 31 fin
.F.compute_expected_subtree_size.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.validate_tree_consistency_checks
.F.validate_tree_consistency_checks:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.validate_tree_consistency_checks._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  call .F.count_reachable_nodes_from_root
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
# ir inst 1 fin
  xor t0, t6, a7
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.validate_tree_consistency_checks._1.if.then.0
  j .F.validate_tree_consistency_checks._2.if.else.0                    # ir inst 3 fin
.F.validate_tree_consistency_checks._1.if.then.0:
# Phi connections
  li t6, 100
  j .F.validate_tree_consistency_checks._3.if.exit.0                    # ir inst 4 fin
.F.validate_tree_consistency_checks._2.if.else.0:
# Phi connections
  li t6, 0
  j .F.validate_tree_consistency_checks._3.if.exit.0                    # ir inst 5 fin
.F.validate_tree_consistency_checks._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  call .F.detect_cycles_in_tree
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 7 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 8 fin
  bnez t4, .F.validate_tree_consistency_checks._4.if.then.1
  j .F.validate_tree_consistency_checks._5.if.else.1                    # ir inst 9 fin
.F.validate_tree_consistency_checks._4.if.then.1:
  addi t5, t6, 200                                                      # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.validate_tree_consistency_checks._6.if.exit.1                    # ir inst 11 fin
.F.validate_tree_consistency_checks._5.if.else.1:
# Phi connections
  j .F.validate_tree_consistency_checks._6.if.exit.1                    # ir inst 12 fin
.F.validate_tree_consistency_checks._6.if.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  call .F.check_balance_consistency
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 14 fin
  add t4, t6, t5                                                        # ir inst 15 fin
  mv a0, t4
  j .F.validate_tree_consistency_checks.epilogue                        # ir inst 16 fin
.F.validate_tree_consistency_checks.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.count_reachable_nodes_from_root
.F.count_reachable_nodes_from_root:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.count_reachable_nodes_from_root._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.count_reachable_nodes_from_root._1.if.then.0
  j .F.count_reachable_nodes_from_root._2.if.else.0                     # ir inst 2 fin
.F.count_reachable_nodes_from_root._1.if.then.0:
  li a0, 0
  j .F.count_reachable_nodes_from_root.epilogue                         # ir inst 3 fin
.F.count_reachable_nodes_from_root._2.if.else.0:
  j .F.count_reachable_nodes_from_root._3.if.exit.0                     # ir inst 4 fin
.F.count_reachable_nodes_from_root._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.count_reachable_nodes_from_root
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 8 fin
  mv t6, a6                                                             # ir inst 9 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 10 fin
  lw t6, 0(t4)                                                          # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.count_reachable_nodes_from_root
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 12 fin
  addi t6, t5, 1                                                        # ir inst 13 fin
  add t5, t6, t4                                                        # ir inst 14 fin
  mv a0, t5
  j .F.count_reachable_nodes_from_root.epilogue                         # ir inst 15 fin
.F.count_reachable_nodes_from_root.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.detect_cycles_in_tree
.F.detect_cycles_in_tree:
# spill func args num: 0,             range:      272(sp) -      272(sp)
# local var size: 200,                range:       72(sp) -      272(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 0 / 12,        range:       64(sp) -       64(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -272
  sd ra, 64(sp)
.F.detect_cycles_in_tree._0.entry.0:
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.detect_cycles_in_tree._1.array.cond.0                            # ir inst 3 fin
.F.detect_cycles_in_tree._1.array.cond.0:
  li t2, 200
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.detect_cycles_in_tree._2.array.body.0
  j .F.detect_cycles_in_tree._3.array.exit.0                            # ir inst 6 fin
.F.detect_cycles_in_tree._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.detect_cycles_in_tree._1.array.cond.0                            # ir inst 10 fin
.F.detect_cycles_in_tree._3.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  addi t1, sp, 72
  mv a7, t1
  call .F.perform_dfs_cycle_detection
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
# ir inst 11 fin
  mv a0, t6
  j .F.detect_cycles_in_tree.epilogue                                   # ir inst 12 fin
.F.detect_cycles_in_tree.epilogue:
  ld ra, 64(sp)
  addi sp, sp, 272
  ret

.globl .F.perform_dfs_cycle_detection
.F.perform_dfs_cycle_detection:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 0 / 12,        range:       88(sp) -       88(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 88(sp)
.F.perform_dfs_cycle_detection._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.perform_dfs_cycle_detection._1.if.then.0
  j .F.perform_dfs_cycle_detection._2.if.else.0                         # ir inst 2 fin
.F.perform_dfs_cycle_detection._1.if.then.0:
  li a0, 0
  j .F.perform_dfs_cycle_detection.epilogue                             # ir inst 3 fin
.F.perform_dfs_cycle_detection._2.if.else.0:
  j .F.perform_dfs_cycle_detection._3.if.exit.0                         # ir inst 4 fin
.F.perform_dfs_cycle_detection._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  add t5, a7, t6                                                        # ir inst 6 fin
  lb t6, 0(t5)                                                          # ir inst 7 fin
  bnez t6, .F.perform_dfs_cycle_detection._4.if.then.1
  j .F.perform_dfs_cycle_detection._5.if.else.1                         # ir inst 8 fin
.F.perform_dfs_cycle_detection._4.if.then.1:
  li a0, 1
  j .F.perform_dfs_cycle_detection.epilogue                             # ir inst 9 fin
.F.perform_dfs_cycle_detection._5.if.else.1:
  j .F.perform_dfs_cycle_detection._6.if.exit.1                         # ir inst 10 fin
.F.perform_dfs_cycle_detection._6.if.exit.1:
  mv t6, a6                                                             # ir inst 11 fin
  add t5, a7, t6                                                        # ir inst 12 fin
  li t1, 1
  sb t1, 0(t5)                                                          # ir inst 13 fin
  mv t6, a6                                                             # ir inst 14 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 15 fin
  lw t6, 0(t5)                                                          # ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a6, t6
  call .F.perform_dfs_cycle_detection
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 17 fin
  mv t6, a6                                                             # ir inst 18 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 19 fin
  lw t6, 0(t4)                                                          # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a6, t6
  call .F.perform_dfs_cycle_detection
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 21 fin
  mv t6, a6                                                             # ir inst 22 fin
  add t3, a7, t6                                                        # ir inst 23 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 24 fin
  add t6, t5, t4                                                        # ir inst 25 fin
  mv a0, t6
  j .F.perform_dfs_cycle_detection.epilogue                             # ir inst 26 fin
.F.perform_dfs_cycle_detection.epilogue:
  ld ra, 88(sp)
  addi sp, sp, 96
  ret

.globl .F.check_balance_consistency
.F.check_balance_consistency:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.check_balance_consistency._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.check_balance_consistency._1.if.then.0
  j .F.check_balance_consistency._2.if.else.0                           # ir inst 2 fin
.F.check_balance_consistency._1.if.then.0:
  li a0, 0
  j .F.check_balance_consistency.epilogue                               # ir inst 3 fin
.F.check_balance_consistency._2.if.else.0:
  j .F.check_balance_consistency._3.if.exit.0                           # ir inst 4 fin
.F.check_balance_consistency._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.check_balance_consistency._4.if.then.1
  j .F.check_balance_consistency._5.if.else.1                           # ir inst 9 fin
.F.check_balance_consistency._4.if.then.1:
# Phi connections
  li t6, 0
  j .F.check_balance_consistency._6.if.exit.1                           # ir inst 10 fin
.F.check_balance_consistency._5.if.else.1:
  mv t6, a6                                                             # ir inst 11 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 12 fin
  lw t6, 0(t5)                                                          # ir inst 13 fin
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t6, a4, t2                                                        # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.check_balance_consistency._6.if.exit.1                           # ir inst 17 fin
.F.check_balance_consistency._6.if.exit.1:
  mv t5, a6                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 20 fin
  lw t5, 0(t4)                                                          # ir inst 21 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 22 fin
  bnez t4, .F.check_balance_consistency._7.if.then.2
  j .F.check_balance_consistency._8.if.else.2                           # ir inst 23 fin
.F.check_balance_consistency._7.if.then.2:
# Phi connections
  li t5, 0
  j .F.check_balance_consistency._9.if.exit.2                           # ir inst 24 fin
.F.check_balance_consistency._8.if.else.2:
  mv t5, a6                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 26 fin
  lw t5, 0(t4)                                                          # ir inst 27 fin
  mv t4, t5                                                             # ir inst 28 fin
  slli t2, t4, 2
  add t5, a4, t2                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.check_balance_consistency._9.if.exit.2                           # ir inst 31 fin
.F.check_balance_consistency._9.if.exit.2:
  sub t4, t6, t5                                                        # ir inst 33 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t4, 56(sp)
  mv a0, t4
  call .F.abs
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t4, 56(sp)
# ir inst 34 fin
  li t2, 3
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 35 fin
  bnez t5, .F.check_balance_consistency._10.if.then.3
  j .F.check_balance_consistency._11.if.else.3                          # ir inst 36 fin
.F.check_balance_consistency._10.if.then.3:
# Phi connections
  li t6, 10
  j .F.check_balance_consistency._12.if.exit.3                          # ir inst 37 fin
.F.check_balance_consistency._11.if.else.3:
# Phi connections
  li t6, 0
  j .F.check_balance_consistency._12.if.exit.3                          # ir inst 38 fin
.F.check_balance_consistency._12.if.exit.3:
  mv t5, a6                                                             # ir inst 40 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 41 fin
  lw t5, 0(t4)                                                          # ir inst 42 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.check_balance_consistency
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 43 fin
  mv t5, a6                                                             # ir inst 44 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 45 fin
  lw t5, 0(t3)                                                          # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.check_balance_consistency
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 47 fin
  add t5, t6, t4                                                        # ir inst 48 fin
  add t6, t5, t3                                                        # ir inst 49 fin
  mv a0, t6
  j .F.check_balance_consistency.epilogue                               # ir inst 50 fin
.F.check_balance_consistency.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.validate_edge_cases_and_boundaries
.F.validate_edge_cases_and_boundaries:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.validate_edge_cases_and_boundaries._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.validate_edge_cases_and_boundaries._1.lazy.then.0
  j .F.validate_edge_cases_and_boundaries._2.lazy.else.0                # ir inst 2 fin
.F.validate_edge_cases_and_boundaries._1.lazy.then.0:
  li t2, 0
  xor t0, a7, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
# Phi connections
  j .F.validate_edge_cases_and_boundaries._3.lazy.exit.0                # ir inst 4 fin
.F.validate_edge_cases_and_boundaries._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.validate_edge_cases_and_boundaries._3.lazy.exit.0                # ir inst 5 fin
.F.validate_edge_cases_and_boundaries._3.lazy.exit.0:
  bnez t6, .F.validate_edge_cases_and_boundaries._4.if.then.0
  j .F.validate_edge_cases_and_boundaries._5.if.else.0                  # ir inst 7 fin
.F.validate_edge_cases_and_boundaries._4.if.then.0:
# Phi connections
  li t6, 50
  j .F.validate_edge_cases_and_boundaries._6.if.exit.0                  # ir inst 8 fin
.F.validate_edge_cases_and_boundaries._5.if.else.0:
# Phi connections
  li t6, 0
  j .F.validate_edge_cases_and_boundaries._6.if.exit.0                  # ir inst 9 fin
.F.validate_edge_cases_and_boundaries._6.if.exit.0:
  li t2, -1
  xor t0, a6, t2
  sltu t5, zero, t0                                                     # ir inst 11 fin
  bnez t5, .F.validate_edge_cases_and_boundaries._7.lazy.then.1
  j .F.validate_edge_cases_and_boundaries._8.lazy.else.1                # ir inst 12 fin
.F.validate_edge_cases_and_boundaries._7.lazy.then.1:
  mv t5, a6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 14 fin
  lw t5, 0(t4)                                                          # ir inst 15 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.validate_edge_cases_and_boundaries._9.lazy.exit.1                # ir inst 17 fin
.F.validate_edge_cases_and_boundaries._8.lazy.else.1:
# Phi connections
  li t5, 0
  j .F.validate_edge_cases_and_boundaries._9.lazy.exit.1                # ir inst 18 fin
.F.validate_edge_cases_and_boundaries._9.lazy.exit.1:
  bnez t5, .F.validate_edge_cases_and_boundaries._10.if.then.1
  j .F.validate_edge_cases_and_boundaries._11.if.else.1                 # ir inst 20 fin
.F.validate_edge_cases_and_boundaries._10.if.then.1:
  addi t5, t6, 30                                                       # ir inst 21 fin
# Phi connections
  mv t6, t5
  j .F.validate_edge_cases_and_boundaries._12.if.exit.1                 # ir inst 22 fin
.F.validate_edge_cases_and_boundaries._11.if.else.1:
# Phi connections
  j .F.validate_edge_cases_and_boundaries._12.if.exit.1                 # ir inst 23 fin
.F.validate_edge_cases_and_boundaries._12.if.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  call .F.count_single_node_subtrees
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 25 fin
  li t2, 5
  mul t4, t5, t2                                                        # ir inst 26 fin
  add t5, t6, t4                                                        # ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  call .F.count_leaf_nodes
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
# ir inst 28 fin
  sub t4, a7, t6                                                        # ir inst 29 fin
  li t2, 0
  slt t3, t2, t6                                                        # ir inst 30 fin
  bnez t3, .F.validate_edge_cases_and_boundaries._13.lazy.then.2
  j .F.validate_edge_cases_and_boundaries._14.lazy.else.2               # ir inst 31 fin
.F.validate_edge_cases_and_boundaries._13.lazy.then.2:
  li t2, 0
  slt t0, t4, t2
  xori t6, t0, 1                                                        # ir inst 32 fin
# Phi connections
  j .F.validate_edge_cases_and_boundaries._15.lazy.exit.2               # ir inst 33 fin
.F.validate_edge_cases_and_boundaries._14.lazy.else.2:
# Phi connections
  li t6, 0
  j .F.validate_edge_cases_and_boundaries._15.lazy.exit.2               # ir inst 34 fin
.F.validate_edge_cases_and_boundaries._15.lazy.exit.2:
  bnez t6, .F.validate_edge_cases_and_boundaries._16.if.then.2
  j .F.validate_edge_cases_and_boundaries._17.if.else.2                 # ir inst 36 fin
.F.validate_edge_cases_and_boundaries._16.if.then.2:
  addi t6, t5, 25                                                       # ir inst 37 fin
# Phi connections
  j .F.validate_edge_cases_and_boundaries._18.if.exit.2                 # ir inst 38 fin
.F.validate_edge_cases_and_boundaries._17.if.else.2:
# Phi connections
  mv t6, t5
  j .F.validate_edge_cases_and_boundaries._18.if.exit.2                 # ir inst 39 fin
.F.validate_edge_cases_and_boundaries._18.if.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  li a7, 0
  call .F.find_maximum_depth
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 41 fin
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 42 fin
  bnez t4, .F.validate_edge_cases_and_boundaries._19.lazy.then.3
  j .F.validate_edge_cases_and_boundaries._20.lazy.else.3               # ir inst 43 fin
.F.validate_edge_cases_and_boundaries._19.lazy.then.3:
  slt t0, a7, t5
  xori t4, t0, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  j .F.validate_edge_cases_and_boundaries._21.lazy.exit.3               # ir inst 45 fin
.F.validate_edge_cases_and_boundaries._20.lazy.else.3:
# Phi connections
  li t5, 0
  j .F.validate_edge_cases_and_boundaries._21.lazy.exit.3               # ir inst 46 fin
.F.validate_edge_cases_and_boundaries._21.lazy.exit.3:
  bnez t5, .F.validate_edge_cases_and_boundaries._22.if.then.3
  j .F.validate_edge_cases_and_boundaries._23.if.else.3                 # ir inst 48 fin
.F.validate_edge_cases_and_boundaries._22.if.then.3:
  addi t5, t6, 20                                                       # ir inst 49 fin
# Phi connections
  mv t6, t5
  j .F.validate_edge_cases_and_boundaries._24.if.exit.3                 # ir inst 50 fin
.F.validate_edge_cases_and_boundaries._23.if.else.3:
# Phi connections
  j .F.validate_edge_cases_and_boundaries._24.if.exit.3                 # ir inst 51 fin
.F.validate_edge_cases_and_boundaries._24.if.exit.3:
  mv a0, t6
  j .F.validate_edge_cases_and_boundaries.epilogue                      # ir inst 53 fin
.F.validate_edge_cases_and_boundaries.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.count_single_node_subtrees
.F.count_single_node_subtrees:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 0 / 12,        range:       80(sp) -       80(sp)
# max caller save reg num: 10 / 12,   range:        0(sp) -       80(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 80(sp)
.F.count_single_node_subtrees._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.count_single_node_subtrees._1.if.then.0
  j .F.count_single_node_subtrees._2.if.else.0                          # ir inst 2 fin
.F.count_single_node_subtrees._1.if.then.0:
  li a0, 0
  j .F.count_single_node_subtrees.epilogue                              # ir inst 3 fin
.F.count_single_node_subtrees._2.if.else.0:
  j .F.count_single_node_subtrees._3.if.exit.0                          # ir inst 4 fin
.F.count_single_node_subtrees._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.count_single_node_subtrees._4.lazy.then.0
  j .F.count_single_node_subtrees._5.lazy.else.0                        # ir inst 9 fin
.F.count_single_node_subtrees._4.lazy.then.0:
  mv t6, a6                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 11 fin
  lw t6, 0(t5)                                                          # ir inst 12 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F.count_single_node_subtrees._6.lazy.exit.0                        # ir inst 14 fin
.F.count_single_node_subtrees._5.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.count_single_node_subtrees._6.lazy.exit.0                        # ir inst 15 fin
.F.count_single_node_subtrees._6.lazy.exit.0:
  bnez t6, .F.count_single_node_subtrees._7.if.then.1
  j .F.count_single_node_subtrees._8.if.else.1                          # ir inst 17 fin
.F.count_single_node_subtrees._7.if.then.1:
# Phi connections
  li t6, 1
  j .F.count_single_node_subtrees._9.if.exit.1                          # ir inst 18 fin
.F.count_single_node_subtrees._8.if.else.1:
# Phi connections
  li t6, 0
  j .F.count_single_node_subtrees._9.if.exit.1                          # ir inst 19 fin
.F.count_single_node_subtrees._9.if.exit.1:
  mv t5, a6                                                             # ir inst 21 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 22 fin
  lw t5, 0(t4)                                                          # ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.count_single_node_subtrees
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 24 fin
  mv t5, a6                                                             # ir inst 25 fin
  slli t2, t5, 2
  add t3, a2, t2                                                        # ir inst 26 fin
  lw t5, 0(t3)                                                          # ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a6, t5
  call .F.count_single_node_subtrees
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 28 fin
  add t5, t6, t4                                                        # ir inst 29 fin
  add t6, t5, t3                                                        # ir inst 30 fin
  mv a0, t6
  j .F.count_single_node_subtrees.epilogue                              # ir inst 31 fin
.F.count_single_node_subtrees.epilogue:
  ld ra, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.count_leaf_nodes
.F.count_leaf_nodes:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 0 / 12,        range:       72(sp) -       72(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 72(sp)
.F.count_leaf_nodes._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.count_leaf_nodes._1.if.then.0
  j .F.count_leaf_nodes._2.if.else.0                                    # ir inst 2 fin
.F.count_leaf_nodes._1.if.then.0:
  li a0, 0
  j .F.count_leaf_nodes.epilogue                                        # ir inst 3 fin
.F.count_leaf_nodes._2.if.else.0:
  j .F.count_leaf_nodes._3.if.exit.0                                    # ir inst 4 fin
.F.count_leaf_nodes._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 8 fin
  bnez t5, .F.count_leaf_nodes._4.lazy.then.0
  j .F.count_leaf_nodes._5.lazy.else.0                                  # ir inst 9 fin
.F.count_leaf_nodes._4.lazy.then.0:
  mv t6, a6                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 11 fin
  lw t6, 0(t5)                                                          # ir inst 12 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F.count_leaf_nodes._6.lazy.exit.0                                  # ir inst 14 fin
.F.count_leaf_nodes._5.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.count_leaf_nodes._6.lazy.exit.0                                  # ir inst 15 fin
.F.count_leaf_nodes._6.lazy.exit.0:
  bnez t6, .F.count_leaf_nodes._7.if.then.1
  j .F.count_leaf_nodes._8.if.else.1                                    # ir inst 17 fin
.F.count_leaf_nodes._7.if.then.1:
  li a0, 1
  j .F.count_leaf_nodes.epilogue                                        # ir inst 18 fin
.F.count_leaf_nodes._8.if.else.1:
  j .F.count_leaf_nodes._9.if.exit.1                                    # ir inst 19 fin
.F.count_leaf_nodes._9.if.exit.1:
  mv t6, a6                                                             # ir inst 20 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 21 fin
  lw t6, 0(t5)                                                          # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.count_leaf_nodes
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld t6, 56(sp)
# ir inst 23 fin
  mv t6, a6                                                             # ir inst 24 fin
  slli t2, t6, 2
  add t4, a2, t2                                                        # ir inst 25 fin
  lw t6, 0(t4)                                                          # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a6, t6
  call .F.count_leaf_nodes
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 27 fin
  add t6, t5, t4                                                        # ir inst 28 fin
  mv a0, t6
  j .F.count_leaf_nodes.epilogue                                        # ir inst 29 fin
.F.count_leaf_nodes.epilogue:
  ld ra, 72(sp)
  addi sp, sp, 80
  ret

.globl .F.find_maximum_depth
.F.find_maximum_depth:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 0 / 12,        range:       88(sp) -       88(sp)
# max caller save reg num: 11 / 12,   range:        0(sp) -       88(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 88(sp)
.F.find_maximum_depth._0.entry.0:
  li t2, -1
  xor t0, a6, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.find_maximum_depth._1.if.then.0
  j .F.find_maximum_depth._2.if.else.0                                  # ir inst 2 fin
.F.find_maximum_depth._1.if.then.0:
  mv a0, a7
  j .F.find_maximum_depth.epilogue                                      # ir inst 3 fin
.F.find_maximum_depth._2.if.else.0:
  j .F.find_maximum_depth._3.if.exit.0                                  # ir inst 4 fin
.F.find_maximum_depth._3.if.exit.0:
  mv t6, a6                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 6 fin
  lw t6, 0(t5)                                                          # ir inst 7 fin
  addi t5, a7, 1                                                        # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t5, 64(sp)
  sd t6, 72(sp)
  mv a7, t5
  mv a6, t6
  call .F.find_maximum_depth
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t5, 64(sp)
  ld t6, 72(sp)
# ir inst 9 fin
  mv t6, a6                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t5, a2, t2                                                        # ir inst 11 fin
  lw t6, 0(t5)                                                          # ir inst 12 fin
  addi t5, a7, 1                                                        # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a7, t5
  mv a6, t6
  call .F.find_maximum_depth
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 14 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  mv a1, t3
  mv a0, t4
  call .F.max
  mv t6, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
# ir inst 15 fin
  mv a0, t6
  j .F.find_maximum_depth.epilogue                                      # ir inst 16 fin
.F.find_maximum_depth.epilogue:
  ld ra, 88(sp)
  addi sp, sp, 96
  ret
