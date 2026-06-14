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
# spill func args num: 0,             range:     8256(sp) -     8256(sp)
# local var size: 8216,               range:       32(sp) -     8248(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8256
  add sp, sp, t0
  sd ra, 24(sp)
main._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 5 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 7 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 9 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 10 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j main._1.array.cond.0                                                # ir inst 13 fin
main._1.array.cond.0:
  li t2, 512
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 16 fin
main._2.array.body.0:
  slli t2, t6, 4
  add t4, t5, t2                                                        # ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 8232
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j main._1.array.cond.0                                                # ir inst 20 fin
main._3.array.exit.0:
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 21 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t1, sp, 32
  li t6, 8196
  add t6, t1, t6                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 24 fin
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.initialize_pool
# ir inst 25 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 26 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 100
  li a1, 4
  addi t1, sp, 32
  mv a0, t1
  call .F.build_complex_tree
  mv t5, a0
  ld t6, 0(sp)
# ir inst 27 fin
  sw t5, 0(t6)                                                          # ir inst 28 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 29 fin
  lw t5, 0(t6)                                                          # ir inst 30 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.sum_tree
  mv t6, a0
  ld t5, 0(sp)
# ir inst 31 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 32 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 33 fin
  lw t5, 0(t6)                                                          # ir inst 34 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.find_height
  mv t6, a0
  ld t5, 0(sp)
# ir inst 35 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 36 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 37 fin
  lw t5, 0(t6)                                                          # ir inst 38 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 125
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.find_value
  mv t6, a0
  ld t5, 0(sp)
# ir inst 39 fin
  bnez t6, main._4.if.then.0
  j main._5.if.else.0                                                   # ir inst 40 fin
main._4.if.then.0:
# Start call preparation
  li a0, 125
  call printlnInt
# ir inst 41 fin
  j main._6.if.exit.0                                                   # ir inst 42 fin
main._5.if.else.0:
# Start call preparation
  li a0, -1
  call printlnInt
# ir inst 43 fin
  j main._6.if.exit.0                                                   # ir inst 44 fin
main._6.if.exit.0:
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 45 fin
  lw t5, 0(t6)                                                          # ir inst 46 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.mirror_tree
  ld t5, 0(sp)
# ir inst 47 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.sum_tree
  mv t6, a0
  ld t5, 0(sp)
# ir inst 48 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 49 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 50 fin
  lw t5, 0(t6)                                                          # ir inst 51 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 10
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.process_with_shadow_error
  mv t6, a0
  ld t5, 0(sp)
# ir inst 52 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 53 fin
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 54 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 55 fin
  j main.epilogue                                                       # ir inst 56 fin
main.epilogue:
  ld ra, 24(sp)
  li t0, 8256
  add sp, sp, t0
  ret

.globl .F.initialize_pool
.F.initialize_pool:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initialize_pool._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initialize_pool._1.while.cond.0                                  # ir inst 1 fin
.F.initialize_pool._1.while.cond.0:
  li t2, 512
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initialize_pool._2.while.body.0
  j .F.initialize_pool._3.while.exit.0                                  # ir inst 4 fin
.F.initialize_pool._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 7 fin
  addi t5, t3, 8                                                        # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
  sw t4, 0(t5)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.initialize_pool._1.while.cond.0                                  # ir inst 12 fin
.F.initialize_pool._3.while.exit.0:
  addi t6, a0, 0                                                        # ir inst 13 fin
  li t5, 8176
  add t5, t6, t5                                                        # ir inst 14 fin
  addi t6, t5, 8                                                        # ir inst 15 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 16 fin
  li t6, 8196
  add t6, a0, t6                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 18 fin
  j .F.initialize_pool.epilogue                                         # ir inst 19 fin
.F.initialize_pool.epilogue:
  ret

.globl .F.alloc_node
.F.alloc_node:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.alloc_node._0.entry.0:
  li t6, 8196
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.alloc_node._1.if.then.0
  j .F.alloc_node._2.if.else.0                                          # ir inst 4 fin
.F.alloc_node._1.if.then.0:
  li a0, -1
  j .F.alloc_node.epilogue                                              # ir inst 5 fin
.F.alloc_node._2.if.else.0:
  j .F.alloc_node._3.if.exit.0                                          # ir inst 6 fin
.F.alloc_node._3.if.exit.0:
  li t6, 8196
  add t6, a0, t6                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
  li t6, 8196
  add t6, a0, t6                                                        # ir inst 9 fin
  addi t4, a0, 0                                                        # ir inst 10 fin
  mv t3, t5                                                             # ir inst 11 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 12 fin
  addi t4, s11, 8                                                       # ir inst 13 fin
  lw t3, 0(t4)                                                          # ir inst 14 fin
  sw t3, 0(t6)                                                          # ir inst 15 fin
  addi t6, a0, 0                                                        # ir inst 16 fin
  mv t4, t5                                                             # ir inst 17 fin
  slli t2, t4, 4
  add t3, t6, t2                                                        # ir inst 18 fin
  addi t6, t3, 8                                                        # ir inst 19 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 0                                                        # ir inst 21 fin
  mv t4, t5                                                             # ir inst 22 fin
  slli t2, t4, 4
  add t3, t6, t2                                                        # ir inst 23 fin
  addi t6, t3, 12                                                       # ir inst 24 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 25 fin
  mv a0, t5
  j .F.alloc_node.epilogue                                              # ir inst 26 fin
.F.alloc_node.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.build_complex_tree
.F.build_complex_tree:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 1 / 12,        range:       56(sp) -       64(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.build_complex_tree._0.entry.0:
  li t2, 0
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.build_complex_tree._1.if.then.0
  j .F.build_complex_tree._5.if.else.0                                  # ir inst 2 fin
.F.build_complex_tree._1.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.alloc_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 3 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 4 fin
  bnez t5, .F.build_complex_tree._2.if.then.1
  j .F.build_complex_tree._3.if.else.1                                  # ir inst 5 fin
.F.build_complex_tree._2.if.then.1:
  addi t5, a0, 0                                                        # ir inst 6 fin
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 8 fin
  addi t5, t3, 0                                                        # ir inst 9 fin
  li t1, 2
  sw t1, 0(t5)                                                          # ir inst 10 fin
  addi t5, a0, 0                                                        # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 4                                                        # ir inst 14 fin
  li t2, 256
  rem t4, a2, t2                                                        # ir inst 15 fin
  sw t4, 0(t5)                                                          # ir inst 16 fin
  j .F.build_complex_tree._4.if.exit.1                                  # ir inst 17 fin
.F.build_complex_tree._3.if.else.1:
  j .F.build_complex_tree._4.if.exit.1                                  # ir inst 18 fin
.F.build_complex_tree._4.if.exit.1:
  mv a0, t6
  j .F.build_complex_tree.epilogue                                      # ir inst 19 fin
.F.build_complex_tree._5.if.else.0:
  j .F.build_complex_tree._6.if.exit.0                                  # ir inst 20 fin
.F.build_complex_tree._6.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.alloc_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 21 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 22 fin
  bnez t5, .F.build_complex_tree._7.if.then.2
  j .F.build_complex_tree._8.if.else.2                                  # ir inst 23 fin
.F.build_complex_tree._7.if.then.2:
  li a0, -1
  j .F.build_complex_tree.epilogue                                      # ir inst 24 fin
.F.build_complex_tree._8.if.else.2:
  j .F.build_complex_tree._9.if.exit.2                                  # ir inst 25 fin
.F.build_complex_tree._9.if.exit.2:
  addi t5, a0, 0                                                        # ir inst 26 fin
  mv t4, t6                                                             # ir inst 27 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 28 fin
  addi t5, t3, 0                                                        # ir inst 29 fin
  li t1, 1
  sw t1, 0(t5)                                                          # ir inst 30 fin
  addi t5, a0, 0                                                        # ir inst 31 fin
  mv t4, t6                                                             # ir inst 32 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 33 fin
  addi t5, t3, 4                                                        # ir inst 34 fin
  sw a2, 0(t5)                                                          # ir inst 35 fin
  addi t5, a0, 0                                                        # ir inst 36 fin
  mv t4, t6                                                             # ir inst 37 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 38 fin
  addi t5, t3, 8                                                        # ir inst 39 fin
  addi t4, a1, -1                                                       # ir inst 40 fin
  slli t3, a2, 1                                                        # ir inst 41 fin
  addi s11, t3, 1                                                       # ir inst 42 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a2, s11
  mv a1, t4
  call .F.build_complex_tree
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 43 fin
  sw t3, 0(t5)                                                          # ir inst 44 fin
  addi t5, a0, 0                                                        # ir inst 45 fin
  mv t4, t6                                                             # ir inst 46 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 47 fin
  addi t5, t3, 12                                                       # ir inst 48 fin
  addi t4, a1, -1                                                       # ir inst 49 fin
  li t2, 3
  mul t3, a2, t2                                                        # ir inst 50 fin
  addi s11, t3, -1                                                      # ir inst 51 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, s11
  mv a1, t4
  call .F.build_complex_tree
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 52 fin
  sw t3, 0(t5)                                                          # ir inst 53 fin
  mv a0, t6
  j .F.build_complex_tree.epilogue                                      # ir inst 54 fin
.F.build_complex_tree.epilogue:
  ld ra, 64(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.sum_tree
.F.sum_tree:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.sum_tree._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.sum_tree._1.if.then.0
  j .F.sum_tree._2.if.else.0                                            # ir inst 2 fin
.F.sum_tree._1.if.then.0:
  li a0, 0
  j .F.sum_tree.epilogue                                                # ir inst 3 fin
.F.sum_tree._2.if.else.0:
  j .F.sum_tree._3.if.exit.0                                            # ir inst 4 fin
.F.sum_tree._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 0                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 10 fin
  bnez t6, .F.sum_tree._4.if.then.1
  j .F.sum_tree._5.if.else.1                                            # ir inst 11 fin
.F.sum_tree._4.if.then.1:
  addi t6, t4, 4                                                        # ir inst 12 fin
  lw t5, 0(t6)                                                          # ir inst 13 fin
  mv a0, t5
  j .F.sum_tree.epilogue                                                # ir inst 14 fin
.F.sum_tree._5.if.else.1:
  j .F.sum_tree._6.if.exit.1                                            # ir inst 15 fin
.F.sum_tree._6.if.exit.1:
  addi t6, t4, 8                                                        # ir inst 16 fin
  lw t5, 0(t6)                                                          # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.sum_tree
  mv t6, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 18 fin
  addi t5, t4, 12                                                       # ir inst 19 fin
  lw t3, 0(t5)                                                          # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  call .F.sum_tree
  mv t5, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 21 fin
  addi t3, t4, 4                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  add t3, t4, t6                                                        # ir inst 24 fin
  add t6, t3, t5                                                        # ir inst 25 fin
  mv a0, t6
  j .F.sum_tree.epilogue                                                # ir inst 26 fin
.F.sum_tree.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.find_height
.F.find_height:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F.find_height._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.find_height._1.if.then.0
  j .F.find_height._2.if.else.0                                         # ir inst 2 fin
.F.find_height._1.if.then.0:
  li a0, 0
  j .F.find_height.epilogue                                             # ir inst 3 fin
.F.find_height._2.if.else.0:
  j .F.find_height._3.if.exit.0                                         # ir inst 4 fin
.F.find_height._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 8                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.find_height
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 10 fin
  addi t5, a0, 0                                                        # ir inst 11 fin
  mv t4, a1                                                             # ir inst 12 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 12                                                       # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  call .F.find_height
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 16 fin
  slt t4, t5, t6                                                        # ir inst 17 fin
  bnez t4, .F.find_height._4.if.then.1
  j .F.find_height._5.if.else.1                                         # ir inst 18 fin
.F.find_height._4.if.then.1:
  addi t4, t6, 1                                                        # ir inst 19 fin
  mv a0, t4
  j .F.find_height.epilogue                                             # ir inst 20 fin
.F.find_height._5.if.else.1:
  addi t6, t5, 1                                                        # ir inst 21 fin
  mv a0, t6
  j .F.find_height.epilogue                                             # ir inst 22 fin
.F.find_height._6.if.exit.1:
.F.find_height.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.find_value
.F.find_value:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.find_value._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.find_value._1.if.then.0
  j .F.find_value._2.if.else.0                                          # ir inst 2 fin
.F.find_value._1.if.then.0:
  li a0, 0
  j .F.find_value.epilogue                                              # ir inst 3 fin
.F.find_value._2.if.else.0:
  j .F.find_value._3.if.exit.0                                          # ir inst 4 fin
.F.find_value._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 4                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  xor t0, t5, a2
  sltiu t6, t0, 1                                                       # ir inst 10 fin
  bnez t6, .F.find_value._4.if.then.1
  j .F.find_value._5.if.else.1                                          # ir inst 11 fin
.F.find_value._4.if.then.1:
  li a0, 1
  j .F.find_value.epilogue                                              # ir inst 12 fin
.F.find_value._5.if.else.1:
  j .F.find_value._6.if.exit.1                                          # ir inst 13 fin
.F.find_value._6.if.exit.1:
  addi t6, t4, 8                                                        # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F.find_value
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
# ir inst 16 fin
  bnez t6, .F.find_value._7.if.then.2
  j .F.find_value._8.if.else.2                                          # ir inst 17 fin
.F.find_value._7.if.then.2:
  li a0, 1
  j .F.find_value.epilogue                                              # ir inst 18 fin
.F.find_value._8.if.else.2:
  j .F.find_value._9.if.exit.2                                          # ir inst 19 fin
.F.find_value._9.if.exit.2:
  addi t6, t4, 12                                                       # ir inst 20 fin
  lw t5, 0(t6)                                                          # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.find_value
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
# ir inst 22 fin
  bnez t6, .F.find_value._10.if.then.3
  j .F.find_value._11.if.else.3                                         # ir inst 23 fin
.F.find_value._10.if.then.3:
  li a0, 1
  j .F.find_value.epilogue                                              # ir inst 24 fin
.F.find_value._11.if.else.3:
  j .F.find_value._12.if.exit.3                                         # ir inst 25 fin
.F.find_value._12.if.exit.3:
  li a0, 0
  j .F.find_value.epilogue                                              # ir inst 26 fin
.F.find_value.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.mirror_tree
.F.mirror_tree:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.mirror_tree._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.mirror_tree._1.if.then.0
  j .F.mirror_tree._2.if.else.0                                         # ir inst 2 fin
.F.mirror_tree._1.if.then.0:
  j .F.mirror_tree.epilogue                                             # ir inst 3 fin
.F.mirror_tree._2.if.else.0:
  j .F.mirror_tree._3.if.exit.0                                         # ir inst 4 fin
.F.mirror_tree._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 8                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  addi t6, t4, 8                                                        # ir inst 10 fin
  addi t3, t4, 12                                                       # ir inst 11 fin
  lw s11, 0(t3)                                                         # ir inst 12 fin
  sw s11, 0(t6)                                                         # ir inst 13 fin
  addi t6, t4, 12                                                       # ir inst 14 fin
  sw t5, 0(t6)                                                          # ir inst 15 fin
  addi t6, t4, 8                                                        # ir inst 16 fin
  lw t5, 0(t6)                                                          # ir inst 17 fin
  addi t6, t4, 12                                                       # ir inst 18 fin
  lw t4, 0(t6)                                                          # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.mirror_tree
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
# ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  mv a1, t4
  call .F.mirror_tree
  ld a0, 0(sp)
  ld t4, 8(sp)
# ir inst 21 fin
  j .F.mirror_tree.epilogue                                             # ir inst 22 fin
.F.mirror_tree.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl .F.process_with_shadow_error
.F.process_with_shadow_error:
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
.F.process_with_shadow_error._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.process_with_shadow_error._1.if.then.0
  j .F.process_with_shadow_error._2.if.else.0                           # ir inst 2 fin
.F.process_with_shadow_error._1.if.then.0:
  li a0, 0
  j .F.process_with_shadow_error.epilogue                               # ir inst 3 fin
.F.process_with_shadow_error._2.if.else.0:
  j .F.process_with_shadow_error._3.if.exit.0                           # ir inst 4 fin
.F.process_with_shadow_error._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 4                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  slt t6, a2, t5                                                        # ir inst 10 fin
  bnez t6, .F.process_with_shadow_error._4.if.then.1
  j .F.process_with_shadow_error._8.if.else.1                           # ir inst 11 fin
.F.process_with_shadow_error._4.if.then.1:
  addi t6, t4, 4                                                        # ir inst 12 fin
  lw t5, 0(t6)                                                          # ir inst 13 fin
  addi t6, a2, 10                                                       # ir inst 14 fin
  addi t3, t4, 0                                                        # ir inst 15 fin
  lw s11, 0(t3)                                                         # ir inst 16 fin
  li t2, 1
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 17 fin
  bnez t3, .F.process_with_shadow_error._5.if.then.2
  j .F.process_with_shadow_error._6.if.else.2                           # ir inst 18 fin
.F.process_with_shadow_error._5.if.then.2:
  addi t3, t4, 8                                                        # ir inst 19 fin
  lw s11, 0(t3)                                                         # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t6
  mv a1, s11
  call .F.process_with_shadow_error
  mv t3, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 21 fin
  add s11, t5, t3                                                       # ir inst 22 fin
  addi t3, t4, 12                                                       # ir inst 23 fin
  lw s10, 0(t3)                                                         # ir inst 24 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, t6
  mv a1, s10
  call .F.process_with_shadow_error
  mv t3, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 25 fin
  add t6, s11, t3                                                       # ir inst 26 fin
# Phi connections
  j .F.process_with_shadow_error._7.if.exit.2                           # ir inst 27 fin
.F.process_with_shadow_error._6.if.else.2:
# Phi connections
  mv t6, t5
  j .F.process_with_shadow_error._7.if.exit.2                           # ir inst 28 fin
.F.process_with_shadow_error._7.if.exit.2:
# Phi connections
  j .F.process_with_shadow_error._12.if.exit.1                          # ir inst 30 fin
.F.process_with_shadow_error._8.if.else.1:
  addi t6, t4, 0                                                        # ir inst 31 fin
  lw t5, 0(t6)                                                          # ir inst 32 fin
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 33 fin
  bnez t6, .F.process_with_shadow_error._9.if.then.3
  j .F.process_with_shadow_error._10.if.else.3                          # ir inst 34 fin
.F.process_with_shadow_error._9.if.then.3:
  addi t6, a2, -2                                                       # ir inst 35 fin
  addi t5, t4, 8                                                        # ir inst 36 fin
  lw t3, 0(t5)                                                          # ir inst 37 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  mv a1, t3
  call .F.process_with_shadow_error
  mv t5, a0
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 38 fin
  addi t3, t4, 12                                                       # ir inst 39 fin
  lw t4, 0(t3)                                                          # ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  mv a1, t4
  call .F.process_with_shadow_error
  mv t3, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
  add t6, t5, t3                                                        # ir inst 42 fin
# Phi connections
  j .F.process_with_shadow_error._11.if.exit.3                          # ir inst 43 fin
.F.process_with_shadow_error._10.if.else.3:
# Phi connections
  li t6, 0
  j .F.process_with_shadow_error._11.if.exit.3                          # ir inst 44 fin
.F.process_with_shadow_error._11.if.exit.3:
# Phi connections
  j .F.process_with_shadow_error._12.if.exit.1                          # ir inst 46 fin
.F.process_with_shadow_error._12.if.exit.1:
  mv a0, t6
  j .F.process_with_shadow_error.epilogue                               # ir inst 48 fin
.F.process_with_shadow_error.epilogue:
  ld ra, 64(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.prune_tree
.F.prune_tree:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.prune_tree._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.prune_tree._1.lazy.then.0
  j .F.prune_tree._2.lazy.else.0                                        # ir inst 2 fin
.F.prune_tree._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.prune_tree._3.lazy.exit.0                                        # ir inst 3 fin
.F.prune_tree._2.lazy.else.0:
  slt t0, a3, a2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.prune_tree._3.lazy.exit.0                                        # ir inst 5 fin
.F.prune_tree._3.lazy.exit.0:
  bnez t6, .F.prune_tree._4.if.then.0
  j .F.prune_tree._5.if.else.0                                          # ir inst 7 fin
.F.prune_tree._4.if.then.0:
  j .F.prune_tree.epilogue                                              # ir inst 8 fin
.F.prune_tree._5.if.else.0:
  j .F.prune_tree._6.if.exit.0                                          # ir inst 9 fin
.F.prune_tree._6.if.exit.0:
  addi t6, a2, -1                                                       # ir inst 10 fin
  xor t0, a3, t6
  sltiu t5, t0, 1                                                       # ir inst 11 fin
  bnez t5, .F.prune_tree._7.if.then.1
  j .F.prune_tree._8.if.else.1                                          # ir inst 12 fin
.F.prune_tree._7.if.then.1:
  addi t6, a0, 0                                                        # ir inst 13 fin
  mv t5, a1                                                             # ir inst 14 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 15 fin
  addi t6, t4, 8                                                        # ir inst 16 fin
  lw t5, 0(t6)                                                          # ir inst 17 fin
  addi t6, t4, 12                                                       # ir inst 18 fin
  lw t4, 0(t6)                                                          # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  mv a1, t5
  call .F.free_tree
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
# ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  mv a1, t4
  call .F.free_tree
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
# ir inst 21 fin
  addi t6, a0, 0                                                        # ir inst 22 fin
  mv t5, a1                                                             # ir inst 23 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 24 fin
  addi t6, t4, 8                                                        # ir inst 25 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 26 fin
  addi t6, t4, 12                                                       # ir inst 27 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 28 fin
  addi t6, t4, 0                                                        # ir inst 29 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 30 fin
  j .F.prune_tree._9.if.exit.1                                          # ir inst 31 fin
.F.prune_tree._8.if.else.1:
  addi t6, a0, 0                                                        # ir inst 32 fin
  mv t5, a1                                                             # ir inst 33 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 34 fin
  addi t6, t4, 8                                                        # ir inst 35 fin
  lw t5, 0(t6)                                                          # ir inst 36 fin
  addi t6, t4, 12                                                       # ir inst 37 fin
  lw t4, 0(t6)                                                          # ir inst 38 fin
  addi t6, a3, 1                                                        # ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, t6
  mv a1, t5
  call .F.prune_tree
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 40 fin
  addi t6, a3, 1                                                        # ir inst 41 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a3, t6
  mv a1, t4
  call .F.prune_tree
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 42 fin
  j .F.prune_tree._9.if.exit.1                                          # ir inst 43 fin
.F.prune_tree._9.if.exit.1:
  j .F.prune_tree.epilogue                                              # ir inst 44 fin
.F.prune_tree.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.free_tree
.F.free_tree:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.free_tree._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.free_tree._1.if.then.0
  j .F.free_tree._2.if.else.0                                           # ir inst 2 fin
.F.free_tree._1.if.then.0:
  j .F.free_tree.epilogue                                               # ir inst 3 fin
.F.free_tree._2.if.else.0:
  j .F.free_tree._3.if.exit.0                                           # ir inst 4 fin
.F.free_tree._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 8                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.free_tree
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 10 fin
  addi t6, a0, 0                                                        # ir inst 11 fin
  mv t5, a1                                                             # ir inst 12 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 13 fin
  addi t6, t4, 12                                                       # ir inst 14 fin
  lw t5, 0(t6)                                                          # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F.free_tree
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 16 fin
  addi t6, a0, 0                                                        # ir inst 17 fin
  mv t5, a1                                                             # ir inst 18 fin
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 19 fin
  addi t6, t4, 8                                                        # ir inst 20 fin
  li t5, 8196
  add t5, a0, t5                                                        # ir inst 21 fin
  lw t4, 0(t5)                                                          # ir inst 22 fin
  sw t4, 0(t6)                                                          # ir inst 23 fin
  li t6, 8196
  add t6, a0, t6                                                        # ir inst 24 fin
  sw a1, 0(t6)                                                          # ir inst 25 fin
  j .F.free_tree.epilogue                                               # ir inst 26 fin
.F.free_tree.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.another_tree_operation
.F.another_tree_operation:
# spill func args num: 0,             range:     8256(sp) -     8256(sp)
# local var size: 8216,               range:       32(sp) -     8248(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8256
  add sp, sp, t0
  sd ra, 24(sp)
.F.another_tree_operation._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 5 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 7 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 9 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 10 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F.another_tree_operation._1.array.cond.0                           # ir inst 13 fin
.F.another_tree_operation._1.array.cond.0:
  li t2, 512
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F.another_tree_operation._2.array.body.0
  j .F.another_tree_operation._3.array.exit.0                           # ir inst 16 fin
.F.another_tree_operation._2.array.body.0:
  slli t2, t6, 4
  add t4, t5, t2                                                        # ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 8232
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F.another_tree_operation._1.array.cond.0                           # ir inst 20 fin
.F.another_tree_operation._3.array.exit.0:
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 21 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t1, sp, 32
  li t6, 8196
  add t6, t1, t6                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 24 fin
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.initialize_pool
# ir inst 25 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 26 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 50
  li a1, 5
  addi t1, sp, 32
  mv a0, t1
  call .F.build_complex_tree
  mv t5, a0
  ld t6, 0(sp)
# ir inst 27 fin
  sw t5, 0(t6)                                                          # ir inst 28 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 29 fin
  lw t5, 0(t6)                                                          # ir inst 30 fin
# Start call preparation
  sd t5, 0(sp)
  li a3, 0
  li a2, 3
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.prune_tree
  ld t5, 0(sp)
# ir inst 31 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.sum_tree
  mv t6, a0
  ld t5, 0(sp)
# ir inst 32 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 33 fin
  j .F.another_tree_operation.epilogue                                  # ir inst 34 fin
.F.another_tree_operation.epilogue:
  ld ra, 24(sp)
  li t0, 8256
  add sp, sp, t0
  ret

.globl .F.yet_another_scenario
.F.yet_another_scenario:
# spill func args num: 0,             range:     8256(sp) -     8256(sp)
# local var size: 8216,               range:       32(sp) -     8248(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8256
  add sp, sp, t0
  sd ra, 24(sp)
.F.yet_another_scenario._0.entry.0:
  addi t1, sp, 32
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 5 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 7 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 9 fin
  li t1, 8232
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 10 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F.yet_another_scenario._1.array.cond.0                             # ir inst 13 fin
.F.yet_another_scenario._1.array.cond.0:
  li t2, 512
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F.yet_another_scenario._2.array.body.0
  j .F.yet_another_scenario._3.array.exit.0                             # ir inst 16 fin
.F.yet_another_scenario._2.array.body.0:
  slli t2, t6, 4
  add t4, t5, t2                                                        # ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 8232
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F.yet_another_scenario._1.array.cond.0                             # ir inst 20 fin
.F.yet_another_scenario._3.array.exit.0:
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 21 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t1, sp, 32
  li t6, 8196
  add t6, t1, t6                                                        # ir inst 23 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 24 fin
# Start call preparation
  addi t1, sp, 32
  mv a0, t1
  call .F.initialize_pool
# ir inst 25 fin
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 26 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 20
  li a1, 6
  addi t1, sp, 32
  mv a0, t1
  call .F.build_complex_tree
  mv t5, a0
  ld t6, 0(sp)
# ir inst 27 fin
  sw t5, 0(t6)                                                          # ir inst 28 fin
# Phi connections
  li t6, 0
  j .F.yet_another_scenario._4.while.cond.0                             # ir inst 29 fin
.F.yet_another_scenario._4.while.cond.0:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 31 fin
  bnez t5, .F.yet_another_scenario._5.while.body.0
  j .F.yet_another_scenario._6.while.exit.0                             # ir inst 32 fin
.F.yet_another_scenario._5.while.body.0:
  addi t1, sp, 32
  li t5, 8192
  add t5, t1, t5                                                        # ir inst 33 fin
  lw t4, 0(t5)                                                          # ir inst 34 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t4
  addi t1, sp, 32
  mv a0, t1
  call .F.mirror_tree
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 35 fin
  addi t5, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t5
  j .F.yet_another_scenario._4.while.cond.0                             # ir inst 37 fin
.F.yet_another_scenario._6.while.exit.0:
  addi t1, sp, 32
  li t6, 8192
  add t6, t1, t6                                                        # ir inst 38 fin
  lw t5, 0(t6)                                                          # ir inst 39 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 32
  mv a0, t1
  call .F.find_height
  mv t6, a0
  ld t5, 0(sp)
# ir inst 40 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 41 fin
# Start call preparation
  call .F.another_tree_operation
# ir inst 42 fin
  j .F.yet_another_scenario.epilogue                                    # ir inst 43 fin
.F.yet_another_scenario.epilogue:
  ld ra, 24(sp)
  li t0, 8256
  add sp, sp, t0
  ret
