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

.globl .F.create_node
.F.create_node:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.create_node._0.entry.0:
  li t6, 9800
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t6, 9800
  add t6, a0, t6                                                        # ir inst 3 fin
  li t4, 9800
  add t4, a0, t4                                                        # ir inst 4 fin
  lw t3, 0(t4)                                                          # ir inst 5 fin
  addi t4, t3, 1                                                        # ir inst 6 fin
  sw t4, 0(t6)                                                          # ir inst 7 fin
  li t6, 8800
  add t6, a0, t6                                                        # ir inst 8 fin
  mv t4, t5                                                             # ir inst 9 fin
  add t3, t6, t4                                                        # ir inst 10 fin
  sb a1, 0(t3)                                                          # ir inst 11 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 15 fin
# Phi connections
  li t6, 0
  j .F.create_node._1.while.cond.0                                      # ir inst 16 fin
.F.create_node._1.while.cond.0:
  li t2, 4
  slt t4, t6, t2                                                        # ir inst 18 fin
  bnez t4, .F.create_node._2.while.body.0
  j .F.create_node._3.while.exit.0                                      # ir inst 19 fin
.F.create_node._2.while.body.0:
  addi t4, a0, 0                                                        # ir inst 20 fin
  mv t3, t5                                                             # ir inst 21 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 22 fin
  mv t4, t6                                                             # ir inst 23 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 24 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 25 fin
  addi t4, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t4
  j .F.create_node._1.while.cond.0                                      # ir inst 27 fin
.F.create_node._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.create_node._4.while.cond.1                                      # ir inst 28 fin
.F.create_node._4.while.cond.1:
  li t2, 5
  slt t4, t6, t2                                                        # ir inst 30 fin
  bnez t4, .F.create_node._5.while.body.1
  j .F.create_node._6.while.exit.1                                      # ir inst 31 fin
.F.create_node._5.while.body.1:
  li t4, 4000
  add t4, a0, t4                                                        # ir inst 32 fin
  mv t3, t5                                                             # ir inst 33 fin
  li t1, 24
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 34 fin
  mv t4, t6                                                             # ir inst 35 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 36 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 37 fin
  addi t4, t6, 1                                                        # ir inst 38 fin
# Phi connections
  mv t6, t4
  j .F.create_node._4.while.cond.1                                      # ir inst 39 fin
.F.create_node._6.while.exit.1:
  mv a0, t5
  j .F.create_node.epilogue                                             # ir inst 40 fin
.F.create_node.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.split_child
.F.split_child:
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
.F.split_child._0.entry.0:
  li t6, 8800
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a3                                                             # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  lb t6, 0(t4)                                                          # ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a1, t6
  call .F.create_node
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 5 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 6 fin
  mv t4, t5                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 8 fin
  li t1, 2
  sw t1, 0(t3)                                                          # ir inst 9 fin
# Phi connections
  li t6, 0
  j .F.split_child._1.while.cond.0                                      # ir inst 10 fin
.F.split_child._1.while.cond.0:
  li t2, 2
  slt t4, t6, t2                                                        # ir inst 12 fin
  bnez t4, .F.split_child._2.while.body.0
  j .F.split_child._3.while.exit.0                                      # ir inst 13 fin
.F.split_child._2.while.body.0:
  addi t4, a0, 0                                                        # ir inst 14 fin
  mv t3, t5                                                             # ir inst 15 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 16 fin
  mv t4, t6                                                             # ir inst 17 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 18 fin
  addi t4, a0, 0                                                        # ir inst 19 fin
  mv s11, a3                                                            # ir inst 20 fin
  li t1, 20
  mul t2, s11, t1
  add s10, t4, t2                                                       # ir inst 21 fin
  addi t4, t6, 2                                                        # ir inst 22 fin
  addi s11, t4, 1                                                       # ir inst 23 fin
  mv t4, s11                                                            # ir inst 24 fin
  slli t2, t4, 2
  add s11, s10, t2                                                      # ir inst 25 fin
  lw t4, 0(s11)                                                         # ir inst 26 fin
  sw t4, 0(t3)                                                          # ir inst 27 fin
  addi t4, t6, 1                                                        # ir inst 28 fin
# Phi connections
  mv t6, t4
  j .F.split_child._1.while.cond.0                                      # ir inst 29 fin
.F.split_child._3.while.exit.0:
  li t6, 8800
  add t6, a0, t6                                                        # ir inst 30 fin
  mv t4, a3                                                             # ir inst 31 fin
  add t3, t6, t4                                                        # ir inst 32 fin
  lb t6, 0(t3)                                                          # ir inst 33 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 34 fin
  bnez t4, .F.split_child._4.if.then.0
  j .F.split_child._8.if.else.0                                         # ir inst 35 fin
.F.split_child._4.if.then.0:
# Phi connections
  li t6, 0
  j .F.split_child._5.while.cond.1                                      # ir inst 36 fin
.F.split_child._5.while.cond.1:
  li t2, 3
  slt t4, t6, t2                                                        # ir inst 38 fin
  bnez t4, .F.split_child._6.while.body.1
  j .F.split_child._7.while.exit.1                                      # ir inst 39 fin
.F.split_child._6.while.body.1:
  li t4, 4000
  add t4, a0, t4                                                        # ir inst 40 fin
  mv t3, t5                                                             # ir inst 41 fin
  li t1, 24
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 42 fin
  mv t4, t6                                                             # ir inst 43 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 44 fin
  li t4, 4000
  add t4, a0, t4                                                        # ir inst 45 fin
  mv s11, a3                                                            # ir inst 46 fin
  li t1, 24
  mul t2, s11, t1
  add s10, t4, t2                                                       # ir inst 47 fin
  addi t4, t6, 2                                                        # ir inst 48 fin
  addi s11, t4, 1                                                       # ir inst 49 fin
  mv t4, s11                                                            # ir inst 50 fin
  slli t2, t4, 2
  add s11, s10, t2                                                      # ir inst 51 fin
  lw t4, 0(s11)                                                         # ir inst 52 fin
  sw t4, 0(t3)                                                          # ir inst 53 fin
  addi t4, t6, 1                                                        # ir inst 54 fin
# Phi connections
  mv t6, t4
  j .F.split_child._5.while.cond.1                                      # ir inst 55 fin
.F.split_child._7.while.exit.1:
  j .F.split_child._9.if.exit.0                                         # ir inst 56 fin
.F.split_child._8.if.else.0:
  j .F.split_child._9.if.exit.0                                         # ir inst 57 fin
.F.split_child._9.if.exit.0:
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 58 fin
  mv t4, a3                                                             # ir inst 59 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 60 fin
  li t1, 2
  sw t1, 0(t3)                                                          # ir inst 61 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 62 fin
  mv t4, a1                                                             # ir inst 63 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 64 fin
  lw t6, 0(t3)                                                          # ir inst 65 fin
# Phi connections
  j .F.split_child._10.while.cond.2                                     # ir inst 66 fin
.F.split_child._10.while.cond.2:
  slt t4, a2, t6                                                        # ir inst 68 fin
  bnez t4, .F.split_child._11.while.body.2
  j .F.split_child._12.while.exit.2                                     # ir inst 69 fin
.F.split_child._11.while.body.2:
  li t4, 4000
  add t4, a0, t4                                                        # ir inst 70 fin
  mv t3, a1                                                             # ir inst 71 fin
  li t1, 24
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 72 fin
  mv t4, t6                                                             # ir inst 73 fin
  addi t3, t4, 1                                                        # ir inst 74 fin
  slli t2, t3, 2
  add t4, s11, t2                                                       # ir inst 75 fin
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 76 fin
  mv s11, a1                                                            # ir inst 77 fin
  li t1, 24
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 78 fin
  mv t3, t6                                                             # ir inst 79 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 80 fin
  lw t3, 0(s11)                                                         # ir inst 81 fin
  sw t3, 0(t4)                                                          # ir inst 82 fin
  addi t4, t6, -1                                                       # ir inst 83 fin
# Phi connections
  mv t6, t4
  j .F.split_child._10.while.cond.2                                     # ir inst 84 fin
.F.split_child._12.while.exit.2:
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 85 fin
  mv t4, a1                                                             # ir inst 86 fin
  li t1, 24
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 87 fin
  mv t6, a2                                                             # ir inst 88 fin
  addi t4, t6, 1                                                        # ir inst 89 fin
  slli t2, t4, 2
  add t6, t3, t2                                                        # ir inst 90 fin
  sw t5, 0(t6)                                                          # ir inst 91 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 92 fin
  mv t5, a1                                                             # ir inst 93 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 94 fin
  lw t6, 0(t4)                                                          # ir inst 95 fin
  addi t5, t6, -1                                                       # ir inst 96 fin
# Phi connections
  mv t6, t5
  j .F.split_child._13.while.cond.3                                     # ir inst 97 fin
.F.split_child._13.while.cond.3:
  slt t0, t6, a2
  xori t5, t0, 1                                                        # ir inst 99 fin
  bnez t5, .F.split_child._14.while.body.3
  j .F.split_child._15.while.exit.3                                     # ir inst 100 fin
.F.split_child._14.while.body.3:
  addi t5, a0, 0                                                        # ir inst 101 fin
  mv t4, a1                                                             # ir inst 102 fin
  li t1, 20
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 103 fin
  mv t5, t6                                                             # ir inst 104 fin
  addi t4, t5, 1                                                        # ir inst 105 fin
  slli t2, t4, 2
  add t5, t3, t2                                                        # ir inst 106 fin
  addi t4, a0, 0                                                        # ir inst 107 fin
  mv t3, a1                                                             # ir inst 108 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 109 fin
  mv t4, t6                                                             # ir inst 110 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 111 fin
  lw t4, 0(t3)                                                          # ir inst 112 fin
  sw t4, 0(t5)                                                          # ir inst 113 fin
  addi t5, t6, -1                                                       # ir inst 114 fin
# Phi connections
  mv t6, t5
  j .F.split_child._13.while.cond.3                                     # ir inst 115 fin
.F.split_child._15.while.exit.3:
  addi t6, a0, 0                                                        # ir inst 116 fin
  mv t5, a1                                                             # ir inst 117 fin
  li t1, 20
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 118 fin
  mv t6, a2                                                             # ir inst 119 fin
  slli t2, t6, 2
  add t5, t4, t2                                                        # ir inst 120 fin
  addi t6, a0, 0                                                        # ir inst 121 fin
  mv t4, a3                                                             # ir inst 122 fin
  li t1, 20
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 123 fin
  li t1, 2
  mv t6, t1                                                             # ir inst 124 fin
  slli t2, t6, 2
  add t4, t3, t2                                                        # ir inst 125 fin
  lw t6, 0(t4)                                                          # ir inst 126 fin
  sw t6, 0(t5)                                                          # ir inst 127 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 128 fin
  mv t5, a1                                                             # ir inst 129 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 130 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 131 fin
  mv t5, a1                                                             # ir inst 132 fin
  slli t2, t5, 2
  add t3, t6, t2                                                        # ir inst 133 fin
  lw t6, 0(t3)                                                          # ir inst 134 fin
  addi t5, t6, 1                                                        # ir inst 135 fin
  sw t5, 0(t4)                                                          # ir inst 136 fin
  j .F.split_child.epilogue                                             # ir inst 137 fin
.F.split_child.epilogue:
  ld ra, 64(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.insert_non_full
.F.insert_non_full:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 3 / 12,        range:       56(sp) -       80(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s9, 56(sp)
  sd s11, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
.F.insert_non_full._0.entry.0:
  li t2, 0
  slt t6, a1, t2                                                        # ir inst 1 fin
  bnez t6, .F.insert_non_full._1.if.then.0
  j .F.insert_non_full._2.if.else.0                                     # ir inst 2 fin
.F.insert_non_full._1.if.then.0:
  j .F.insert_non_full.epilogue                                         # ir inst 3 fin
.F.insert_non_full._2.if.else.0:
  j .F.insert_non_full._3.if.exit.0                                     # ir inst 4 fin
.F.insert_non_full._3.if.exit.0:
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  lw t6, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, -1                                                       # ir inst 9 fin
  li t6, 8800
  add t6, a0, t6                                                        # ir inst 10 fin
  mv t4, a1                                                             # ir inst 11 fin
  add t3, t6, t4                                                        # ir inst 12 fin
  lb t6, 0(t3)                                                          # ir inst 13 fin
  bnez t6, .F.insert_non_full._4.if.then.1
  j .F.insert_non_full._11.if.else.1                                    # ir inst 14 fin
.F.insert_non_full._4.if.then.1:
# Phi connections
  mv t6, t5
  j .F.insert_non_full._5.while.cond.0                                  # ir inst 15 fin
.F.insert_non_full._5.while.cond.0:
  li t2, 0
  slt t0, t6, t2
  xori t4, t0, 1                                                        # ir inst 17 fin
  bnez t4, .F.insert_non_full._6.while.body.0
  j .F.insert_non_full._28.critical_edge.0                              # ir inst 18 fin
.F.insert_non_full._6.while.body.0:
  addi t4, a0, 0                                                        # ir inst 19 fin
  mv t3, a1                                                             # ir inst 20 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 21 fin
  mv t4, t6                                                             # ir inst 22 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 23 fin
  lw t4, 0(t3)                                                          # ir inst 24 fin
  slt t0, a2, t4
  xori t3, t0, 1                                                        # ir inst 25 fin
  bnez t3, .F.insert_non_full._7.if.then.2
  j .F.insert_non_full._8.if.else.2                                     # ir inst 26 fin
.F.insert_non_full._7.if.then.2:
  j .F.insert_non_full._10.while.exit.0                                 # ir inst 27 fin
.F.insert_non_full._8.if.else.2:
  j .F.insert_non_full._9.if.exit.2                                     # ir inst 28 fin
.F.insert_non_full._9.if.exit.2:
  addi t4, a0, 0                                                        # ir inst 29 fin
  mv t3, a1                                                             # ir inst 30 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 31 fin
  mv t4, t6                                                             # ir inst 32 fin
  addi t3, t4, 1                                                        # ir inst 33 fin
  slli t2, t3, 2
  add t4, s11, t2                                                       # ir inst 34 fin
  addi t3, a0, 0                                                        # ir inst 35 fin
  mv s11, a1                                                            # ir inst 36 fin
  li t1, 20
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 37 fin
  mv t3, t6                                                             # ir inst 38 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 39 fin
  lw t3, 0(s11)                                                         # ir inst 40 fin
  sw t3, 0(t4)                                                          # ir inst 41 fin
  addi t4, t6, -1                                                       # ir inst 42 fin
# Phi connections
  mv t6, t4
  j .F.insert_non_full._5.while.cond.0                                  # ir inst 43 fin
.F.insert_non_full._10.while.exit.0:
  addi t4, a0, 0                                                        # ir inst 44 fin
  mv t3, a1                                                             # ir inst 45 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 46 fin
  addi t4, t6, 1                                                        # ir inst 47 fin
  mv t3, t4                                                             # ir inst 48 fin
  slli t2, t3, 2
  add t4, s11, t2                                                       # ir inst 49 fin
  sw a2, 0(t4)                                                          # ir inst 50 fin
  li t4, 9000
  add t4, a0, t4                                                        # ir inst 51 fin
  mv t3, a1                                                             # ir inst 52 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 53 fin
  li t4, 9000
  add t4, a0, t4                                                        # ir inst 54 fin
  mv t3, a1                                                             # ir inst 55 fin
  slli t2, t3, 2
  add s10, t4, t2                                                       # ir inst 56 fin
  lw t4, 0(s10)                                                         # ir inst 57 fin
  addi t3, t4, 1                                                        # ir inst 58 fin
  sw t3, 0(s11)                                                         # ir inst 59 fin
  j .F.insert_non_full._27.if.exit.1                                    # ir inst 60 fin
.F.insert_non_full._11.if.else.1:
# Phi connections
  j .F.insert_non_full._12.while.cond.1                                 # ir inst 61 fin
.F.insert_non_full._12.while.cond.1:
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 63 fin
  bnez t4, .F.insert_non_full._13.while.body.1
  j .F.insert_non_full._29.critical_edge.1                              # ir inst 64 fin
.F.insert_non_full._13.while.body.1:
  addi t4, a0, 0                                                        # ir inst 65 fin
  mv t3, a1                                                             # ir inst 66 fin
  li t1, 20
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 67 fin
  mv t4, t5                                                             # ir inst 68 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 69 fin
  lw t4, 0(t3)                                                          # ir inst 70 fin
  slt t0, a2, t4
  xori t3, t0, 1                                                        # ir inst 71 fin
  bnez t3, .F.insert_non_full._14.if.then.3
  j .F.insert_non_full._15.if.else.3                                    # ir inst 72 fin
.F.insert_non_full._14.if.then.3:
  j .F.insert_non_full._17.while.exit.1                                 # ir inst 73 fin
.F.insert_non_full._15.if.else.3:
  j .F.insert_non_full._16.if.exit.3                                    # ir inst 74 fin
.F.insert_non_full._16.if.exit.3:
  addi t4, t5, -1                                                       # ir inst 75 fin
# Phi connections
  mv t5, t4
  j .F.insert_non_full._12.while.cond.1                                 # ir inst 76 fin
.F.insert_non_full._17.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 77 fin
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 78 fin
  mv s11, a1                                                            # ir inst 79 fin
  li t1, 24
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 80 fin
  mv t3, t4                                                             # ir inst 81 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 82 fin
  lw t3, 0(s11)                                                         # ir inst 83 fin
  li t2, 0
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 84 fin
  bnez s11, .F.insert_non_full._18.lazy.then.0
  j .F.insert_non_full._19.lazy.else.0                                  # ir inst 85 fin
.F.insert_non_full._18.lazy.then.0:
  li s11, 9000
  add s11, a0, s11                                                      # ir inst 86 fin
  mv s10, t3                                                            # ir inst 87 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 88 fin
  lw s11, 0(s9)                                                         # ir inst 89 fin
  li t2, 4
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 90 fin
# Phi connections
  mv s11, s10
  j .F.insert_non_full._20.lazy.exit.0                                  # ir inst 91 fin
.F.insert_non_full._19.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.insert_non_full._20.lazy.exit.0                                  # ir inst 92 fin
.F.insert_non_full._20.lazy.exit.0:
  bnez s11, .F.insert_non_full._21.if.then.4
  j .F.insert_non_full._25.if.else.4                                    # ir inst 94 fin
.F.insert_non_full._21.if.then.4:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a3, t3
  mv a2, t4
  call .F.split_child
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 95 fin
  addi t3, a0, 0                                                        # ir inst 96 fin
  mv s11, a1                                                            # ir inst 97 fin
  li t1, 20
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 98 fin
  mv t3, t4                                                             # ir inst 99 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 100 fin
  lw t3, 0(s11)                                                         # ir inst 101 fin
  slt s11, t3, a2                                                       # ir inst 102 fin
  bnez s11, .F.insert_non_full._22.if.then.5
  j .F.insert_non_full._23.if.else.5                                    # ir inst 103 fin
.F.insert_non_full._22.if.then.5:
  addi t3, t4, 1                                                        # ir inst 104 fin
# Phi connections
  j .F.insert_non_full._24.if.exit.5                                    # ir inst 105 fin
.F.insert_non_full._23.if.else.5:
# Phi connections
  mv t3, t4
  j .F.insert_non_full._24.if.exit.5                                    # ir inst 106 fin
.F.insert_non_full._24.if.exit.5:
# Phi connections
  mv t4, t3
  j .F.insert_non_full._26.if.exit.4                                    # ir inst 108 fin
.F.insert_non_full._25.if.else.4:
# Phi connections
  j .F.insert_non_full._26.if.exit.4                                    # ir inst 109 fin
.F.insert_non_full._26.if.exit.4:
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 111 fin
  mv s11, a1                                                            # ir inst 112 fin
  li t1, 24
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 113 fin
  mv t3, t4                                                             # ir inst 114 fin
  slli t2, t3, 2
  add t4, s10, t2                                                       # ir inst 115 fin
  lw t3, 0(t4)                                                          # ir inst 116 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t3
  call .F.insert_non_full
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 117 fin
  j .F.insert_non_full._27.if.exit.1                                    # ir inst 118 fin
.F.insert_non_full._27.if.exit.1:
  j .F.insert_non_full.epilogue                                         # ir inst 119 fin
.F.insert_non_full._28.critical_edge.0:
  j .F.insert_non_full._10.while.exit.0                                 # ir inst 120 fin
.F.insert_non_full._29.critical_edge.1:
  j .F.insert_non_full._17.while.exit.1                                 # ir inst 121 fin
.F.insert_non_full.epilogue:
  ld ra, 80(sp)
  ld s9, 56(sp)
  ld s11, 64(sp)
  ld s10, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.insert
.F.insert:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.insert._0.entry.0:
  li t6, 9804
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.insert._1.if.then.0
  j .F.insert._2.if.else.0                                              # ir inst 4 fin
.F.insert._1.if.then.0:
  li t6, 9804
  add t6, a0, t6                                                        # ir inst 5 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a1, 1
  call .F.create_node
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 6 fin
  sw t5, 0(t6)                                                          # ir inst 7 fin
  addi t6, a0, 0                                                        # ir inst 8 fin
  li t5, 9804
  add t5, a0, t5                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  mv t5, t4                                                             # ir inst 11 fin
  li t1, 20
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 12 fin
  addi t6, t4, 0                                                        # ir inst 13 fin
  sw a1, 0(t6)                                                          # ir inst 14 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 15 fin
  li t5, 9804
  add t5, a0, t5                                                        # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  mv t5, t4                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, 1
  sw t1, 0(t4)                                                          # ir inst 20 fin
  j .F.insert.epilogue                                                  # ir inst 21 fin
.F.insert._2.if.else.0:
  j .F.insert._3.if.exit.0                                              # ir inst 22 fin
.F.insert._3.if.exit.0:
  li t6, 9804
  add t6, a0, t6                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  li t6, 9000
  add t6, a0, t6                                                        # ir inst 25 fin
  mv t4, t5                                                             # ir inst 26 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 27 fin
  lw t6, 0(t3)                                                          # ir inst 28 fin
  li t2, 4
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 29 fin
  bnez t4, .F.insert._4.if.then.1
  j .F.insert._5.if.else.1                                              # ir inst 30 fin
.F.insert._4.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  li a1, 0
  call .F.create_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 31 fin
  li t4, 9804
  add t4, a0, t4                                                        # ir inst 32 fin
  sw t6, 0(t4)                                                          # ir inst 33 fin
  li t4, 4000
  add t4, a0, t4                                                        # ir inst 34 fin
  mv t3, t6                                                             # ir inst 35 fin
  li t1, 24
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 36 fin
  addi t4, s11, 0                                                       # ir inst 37 fin
  sw t5, 0(t4)                                                          # ir inst 38 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t5
  li a2, 0
  mv a1, t6
  call .F.split_child
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, a1
  mv a1, t6
  call .F.insert_non_full
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 40 fin
  j .F.insert._6.if.exit.1                                              # ir inst 41 fin
.F.insert._5.if.else.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a2, a1
  mv a1, t5
  call .F.insert_non_full
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 42 fin
  j .F.insert._6.if.exit.1                                              # ir inst 43 fin
.F.insert._6.if.exit.1:
  j .F.insert.epilogue                                                  # ir inst 44 fin
.F.insert.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.search_recursive
.F.search_recursive:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.search_recursive._0.entry.0:
# Phi connections
  li t6, 0
  j .F.search_recursive._1.while.cond.0                                 # ir inst 1 fin
.F.search_recursive._1.while.cond.0:
  li t5, 9000
  add t5, a0, t5                                                        # ir inst 3 fin
  mv t4, a1                                                             # ir inst 4 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 5 fin
  lw t5, 0(t3)                                                          # ir inst 6 fin
  slt t4, t6, t5                                                        # ir inst 7 fin
  bnez t4, .F.search_recursive._2.while.body.0
  j .F.search_recursive._16.critical_edge.0                             # ir inst 8 fin
.F.search_recursive._2.while.body.0:
  addi t5, a0, 0                                                        # ir inst 9 fin
  mv t4, a1                                                             # ir inst 10 fin
  li t1, 20
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 11 fin
  mv t5, t6                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t4, t3, t2                                                        # ir inst 13 fin
  lw t5, 0(t4)                                                          # ir inst 14 fin
  slt t4, a2, t5                                                        # ir inst 15 fin
  bnez t4, .F.search_recursive._3.if.then.0
  j .F.search_recursive._4.if.else.0                                    # ir inst 16 fin
.F.search_recursive._3.if.then.0:
  j .F.search_recursive._9.while.exit.0                                 # ir inst 17 fin
.F.search_recursive._4.if.else.0:
  j .F.search_recursive._5.if.exit.0                                    # ir inst 18 fin
.F.search_recursive._5.if.exit.0:
  addi t5, a0, 0                                                        # ir inst 19 fin
  mv t4, a1                                                             # ir inst 20 fin
  li t1, 20
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 21 fin
  mv t5, t6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t4, t3, t2                                                        # ir inst 23 fin
  lw t5, 0(t4)                                                          # ir inst 24 fin
  xor t0, a2, t5
  sltiu t4, t0, 1                                                       # ir inst 25 fin
  bnez t4, .F.search_recursive._6.if.then.1
  j .F.search_recursive._7.if.else.1                                    # ir inst 26 fin
.F.search_recursive._6.if.then.1:
  li a0, 1
  j .F.search_recursive.epilogue                                        # ir inst 27 fin
.F.search_recursive._7.if.else.1:
  j .F.search_recursive._8.if.exit.1                                    # ir inst 28 fin
.F.search_recursive._8.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t5
  j .F.search_recursive._1.while.cond.0                                 # ir inst 30 fin
.F.search_recursive._9.while.exit.0:
  li t5, 8800
  add t5, a0, t5                                                        # ir inst 31 fin
  mv t4, a1                                                             # ir inst 32 fin
  add t3, t5, t4                                                        # ir inst 33 fin
  lb t5, 0(t3)                                                          # ir inst 34 fin
  bnez t5, .F.search_recursive._10.if.then.2
  j .F.search_recursive._11.if.else.2                                   # ir inst 35 fin
.F.search_recursive._10.if.then.2:
  li a0, 0
  j .F.search_recursive.epilogue                                        # ir inst 36 fin
.F.search_recursive._11.if.else.2:
  li t5, 4000
  add t5, a0, t5                                                        # ir inst 37 fin
  mv t4, a1                                                             # ir inst 38 fin
  li t1, 24
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 39 fin
  mv t5, t6                                                             # ir inst 40 fin
  slli t2, t5, 2
  add t4, t3, t2                                                        # ir inst 41 fin
  lw t5, 0(t4)                                                          # ir inst 42 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 43 fin
  bnez t4, .F.search_recursive._12.if.then.3
  j .F.search_recursive._13.if.else.3                                   # ir inst 44 fin
.F.search_recursive._12.if.then.3:
  li a0, 0
  j .F.search_recursive.epilogue                                        # ir inst 45 fin
.F.search_recursive._13.if.else.3:
  j .F.search_recursive._14.if.exit.3                                   # ir inst 46 fin
.F.search_recursive._14.if.exit.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, t5
  call .F.search_recursive
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 47 fin
  mv a0, t4
  j .F.search_recursive.epilogue                                        # ir inst 48 fin
.F.search_recursive._15.if.exit.2:
.F.search_recursive._16.critical_edge.0:
  j .F.search_recursive._9.while.exit.0                                 # ir inst 50 fin
.F.search_recursive.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.traverse_and_sum
.F.traverse_and_sum:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 3 / 12,        range:       48(sp) -       72(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s9, 48(sp)
  sd s10, 56(sp)
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.traverse_and_sum._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.traverse_and_sum._1.if.then.0
  j .F.traverse_and_sum._2.if.else.0                                    # ir inst 2 fin
.F.traverse_and_sum._1.if.then.0:
  li a0, 0
  j .F.traverse_and_sum.epilogue                                        # ir inst 3 fin
.F.traverse_and_sum._2.if.else.0:
  j .F.traverse_and_sum._3.if.exit.0                                    # ir inst 4 fin
.F.traverse_and_sum._3.if.exit.0:
  li t6, 8800
  add t6, a0, t6                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  add t4, t6, t5                                                        # ir inst 7 fin
  lb t6, 0(t4)                                                          # ir inst 8 fin
# Phi connections
  li t4, 0
  li t5, 0
  j .F.traverse_and_sum._4.while.cond.0                                 # ir inst 9 fin
.F.traverse_and_sum._4.while.cond.0:
  li t3, 9000
  add t3, a0, t3                                                        # ir inst 12 fin
  mv s11, a1                                                            # ir inst 13 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 14 fin
  lw t3, 0(s10)                                                         # ir inst 15 fin
  slt s11, t5, t3                                                       # ir inst 16 fin
  bnez s11, .F.traverse_and_sum._5.while.body.0
  j .F.traverse_and_sum._9.while.exit.0                                 # ir inst 17 fin
.F.traverse_and_sum._5.while.body.0:
  li t2, 0
  xor t0, t6, t2
  sltiu t3, t0, 1                                                       # ir inst 18 fin
  bnez t3, .F.traverse_and_sum._6.if.then.1
  j .F.traverse_and_sum._7.if.else.1                                    # ir inst 19 fin
.F.traverse_and_sum._6.if.then.1:
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 20 fin
  mv s11, a1                                                            # ir inst 21 fin
  li t1, 24
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 22 fin
  mv t3, t5                                                             # ir inst 23 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 24 fin
  lw t3, 0(s11)                                                         # ir inst 25 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a1, t3
  call .F.traverse_and_sum
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 26 fin
  add t3, t4, s11                                                       # ir inst 27 fin
# Phi connections
  j .F.traverse_and_sum._8.if.exit.1                                    # ir inst 28 fin
.F.traverse_and_sum._7.if.else.1:
# Phi connections
  mv t3, t4
  j .F.traverse_and_sum._8.if.exit.1                                    # ir inst 29 fin
.F.traverse_and_sum._8.if.exit.1:
  addi s11, a0, 0                                                       # ir inst 31 fin
  mv s10, a1                                                            # ir inst 32 fin
  li t1, 20
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 33 fin
  mv s11, t5                                                            # ir inst 34 fin
  slli t2, s11, 2
  add s10, s9, t2                                                       # ir inst 35 fin
  lw s11, 0(s10)                                                        # ir inst 36 fin
  add s10, t3, s11                                                      # ir inst 37 fin
  addi t3, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t4, s10
  mv t5, t3
  j .F.traverse_and_sum._4.while.cond.0                                 # ir inst 39 fin
.F.traverse_and_sum._9.while.exit.0:
  li t2, 0
  xor t0, t6, t2
  sltiu t3, t0, 1                                                       # ir inst 40 fin
  bnez t3, .F.traverse_and_sum._10.if.then.2
  j .F.traverse_and_sum._11.if.else.2                                   # ir inst 41 fin
.F.traverse_and_sum._10.if.then.2:
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 42 fin
  mv t3, a1                                                             # ir inst 43 fin
  li t1, 24
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 44 fin
  mv t6, t5                                                             # ir inst 45 fin
  slli t2, t6, 2
  add t5, s11, t2                                                       # ir inst 46 fin
  lw t6, 0(t5)                                                          # ir inst 47 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  call .F.traverse_and_sum
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 48 fin
  add t6, t4, t5                                                        # ir inst 49 fin
# Phi connections
  j .F.traverse_and_sum._12.if.exit.2                                   # ir inst 50 fin
.F.traverse_and_sum._11.if.else.2:
# Phi connections
  mv t6, t4
  j .F.traverse_and_sum._12.if.exit.2                                   # ir inst 51 fin
.F.traverse_and_sum._12.if.exit.2:
  mv a0, t6
  j .F.traverse_and_sum.epilogue                                        # ir inst 53 fin
.F.traverse_and_sum.epilogue:
  ld ra, 72(sp)
  ld s9, 48(sp)
  ld s10, 56(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.get_height
.F.get_height:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.get_height._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.get_height._1.if.then.0
  j .F.get_height._2.if.else.0                                          # ir inst 2 fin
.F.get_height._1.if.then.0:
  li a0, 0
  j .F.get_height.epilogue                                              # ir inst 3 fin
.F.get_height._2.if.else.0:
  j .F.get_height._3.if.exit.0                                          # ir inst 4 fin
.F.get_height._3.if.exit.0:
  li t6, 8800
  add t6, a0, t6                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  add t4, t6, t5                                                        # ir inst 7 fin
  lb t6, 0(t4)                                                          # ir inst 8 fin
  bnez t6, .F.get_height._4.if.then.1
  j .F.get_height._5.if.else.1                                          # ir inst 9 fin
.F.get_height._4.if.then.1:
  li a0, 1
  j .F.get_height.epilogue                                              # ir inst 10 fin
.F.get_height._5.if.else.1:
  j .F.get_height._6.if.exit.1                                          # ir inst 11 fin
.F.get_height._6.if.exit.1:
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 12 fin
  mv t5, a1                                                             # ir inst 13 fin
  li t1, 24
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 14 fin
  addi t6, t4, 0                                                        # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F.get_height
  mv t6, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 17 fin
  addi t5, t6, 1                                                        # ir inst 18 fin
  mv a0, t5
  j .F.get_height.epilogue                                              # ir inst 19 fin
.F.get_height.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl main
main:
# spill func args num: 0,             range:    10304(sp) -    10304(sp)
# local var size: 10252,              range:       48(sp) -    10300(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -10304
  add sp, sp, t0
  sd s11, 32(sp)
  sd ra, 40(sp)
main._0.entry.0:
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 9856
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t4, 0
  j main._1.array.cond.0                                                # ir inst 5 fin
main._1.array.cond.0:
  li t2, 5
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
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 17 fin
main._5.array.body.1:
  li t1, 20
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 18 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 20
  li t1, 9856
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
  addi t1, sp, 48
  li t6, 4000
  add t6, t1, t6                                                        # ir inst 22 fin
  li t1, 9876
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 24 fin
# Phi connections
  li t4, 0
  j main._7.array.cond.2                                                # ir inst 25 fin
main._7.array.cond.2:
  li t2, 6
  slt t3, t4, t2                                                        # ir inst 27 fin
  bnez t3, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 28 fin
main._8.array.body.2:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 29 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 30 fin
  addi t3, t4, 1                                                        # ir inst 31 fin
# Phi connections
  mv t4, t3
  j main._7.array.cond.2                                                # ir inst 32 fin
main._9.array.exit.2:
  addi t5, t6, 0                                                        # ir inst 33 fin
# Phi connections
  li t6, 0
  j main._10.array.cond.3                                               # ir inst 34 fin
main._10.array.cond.3:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 36 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 37 fin
main._11.array.body.3:
  li t1, 24
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 38 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 24
  li t1, 9876
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 39 fin
  addi t4, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t6, t4
  j main._10.array.cond.3                                               # ir inst 41 fin
main._12.array.exit.3:
  addi t1, sp, 48
  li t6, 8800
  add t6, t1, t6                                                        # ir inst 42 fin
  addi t5, t6, 0                                                        # ir inst 43 fin
# Phi connections
  li t6, 0
  j main._13.array.cond.4                                               # ir inst 44 fin
main._13.array.cond.4:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 46 fin
  bnez t4, main._14.array.body.4
  j main._15.array.exit.4                                               # ir inst 47 fin
main._14.array.body.4:
  add t4, t5, t6                                                        # ir inst 48 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 49 fin
  addi t4, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t4
  j main._13.array.cond.4                                               # ir inst 51 fin
main._15.array.exit.4:
  addi t1, sp, 48
  li t6, 9000
  add t6, t1, t6                                                        # ir inst 52 fin
  addi t5, t6, 0                                                        # ir inst 53 fin
# Phi connections
  li t6, 0
  j main._16.array.cond.5                                               # ir inst 54 fin
main._16.array.cond.5:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 56 fin
  bnez t4, main._17.array.body.5
  j main._18.array.exit.5                                               # ir inst 57 fin
main._17.array.body.5:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 58 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t6, 1                                                        # ir inst 60 fin
# Phi connections
  mv t6, t4
  j main._16.array.cond.5                                               # ir inst 61 fin
main._18.array.exit.5:
  addi t1, sp, 48
  li t6, 9800
  add t6, t1, t6                                                        # ir inst 62 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 63 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 64 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 65 fin
  li t1, 9900
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 67 fin
# Phi connections
  li t5, 0
  j main._19.array.cond.6                                               # ir inst 68 fin
main._19.array.cond.6:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 70 fin
  bnez t4, main._20.array.body.6
  j main._21.array.exit.6                                               # ir inst 71 fin
main._20.array.body.6:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 72 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 73 fin
  addi t4, t5, 1                                                        # ir inst 74 fin
# Phi connections
  mv t5, t4
  j main._19.array.cond.6                                               # ir inst 75 fin
main._21.array.exit.6:
# Phi connections
  li t5, 100
  li t6, 0
  j main._22.while.cond.0                                               # ir inst 76 fin
main._22.while.cond.0:
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 79 fin
  bnez t4, main._23.while.body.0
  j main._24.while.exit.0                                               # ir inst 80 fin
main._23.while.body.0:
  addi t4, t5, 37                                                       # ir inst 81 fin
  li t2, 251
  rem t5, t4, t2                                                        # ir inst 82 fin
  mv t4, t6                                                             # ir inst 83 fin
  slli t2, t4, 2
  li t1, 9900
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 84 fin
  sw t5, 0(t3)                                                          # ir inst 85 fin
  addi t4, t6, 1                                                        # ir inst 86 fin
# Phi connections
  mv t6, t4
  j main._22.while.cond.0                                               # ir inst 87 fin
main._24.while.exit.0:
# Phi connections
  li t6, 0
  j main._25.while.cond.1                                               # ir inst 88 fin
main._25.while.cond.1:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 90 fin
  bnez t5, main._26.while.body.1
  j main._27.while.exit.1                                               # ir inst 91 fin
main._26.while.body.1:
  mv t5, t6                                                             # ir inst 92 fin
  slli t2, t5, 2
  li t1, 9900
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 93 fin
  lw t5, 0(t4)                                                          # ir inst 94 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 95 fin
  addi t5, t6, 1                                                        # ir inst 96 fin
# Phi connections
  mv t6, t5
  j main._25.while.cond.1                                               # ir inst 97 fin
main._27.while.exit.1:
# Phi connections
  li t5, 0
  li t6, 0
  j main._28.while.cond.2                                               # ir inst 98 fin
main._28.while.cond.2:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 101 fin
  bnez t4, main._29.while.body.2
  j main._33.while.exit.2                                               # ir inst 102 fin
main._29.while.body.2:
  addi t1, sp, 48
  li t4, 9804
  add t4, t1, t4                                                        # ir inst 103 fin
  lw t3, 0(t4)                                                          # ir inst 104 fin
  mv t4, t5                                                             # ir inst 105 fin
  slli t2, t4, 2
  li t1, 9900
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 106 fin
  lw t4, 0(s11)                                                         # ir inst 107 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t4
  mv a1, t3
  addi t1, sp, 48
  mv a0, t1
  call .F.search_recursive
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 108 fin
  bnez s11, main._30.if.then.0
  j main._31.if.else.0                                                  # ir inst 109 fin
main._30.if.then.0:
  addi t4, t6, 1                                                        # ir inst 110 fin
# Phi connections
  j main._32.if.exit.0                                                  # ir inst 111 fin
main._31.if.else.0:
# Phi connections
  mv t4, t6
  j main._32.if.exit.0                                                  # ir inst 112 fin
main._32.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 114 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j main._28.while.cond.2                                               # ir inst 115 fin
main._33.while.exit.2:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 116 fin
# Phi connections
  li t5, 0
  li t6, 0
  j main._34.while.cond.3                                               # ir inst 117 fin
main._34.while.cond.3:
  li t2, 50
  slt t4, t5, t2                                                        # ir inst 120 fin
  bnez t4, main._35.while.body.3
  j main._39.while.exit.3                                               # ir inst 121 fin
main._35.while.body.3:
  addi t1, sp, 48
  li t4, 9804
  add t4, t1, t4                                                        # ir inst 122 fin
  lw t3, 0(t4)                                                          # ir inst 123 fin
  addi t4, t5, 300                                                      # ir inst 124 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t4
  mv a1, t3
  addi t1, sp, 48
  mv a0, t1
  call .F.search_recursive
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 125 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t4, t0, 1                                                       # ir inst 126 fin
  bnez t4, main._36.if.then.1
  j main._37.if.else.1                                                  # ir inst 127 fin
main._36.if.then.1:
  addi t4, t6, 1                                                        # ir inst 128 fin
# Phi connections
  j main._38.if.exit.1                                                  # ir inst 129 fin
main._37.if.else.1:
# Phi connections
  mv t4, t6
  j main._38.if.exit.1                                                  # ir inst 130 fin
main._38.if.exit.1:
  addi t3, t5, 1                                                        # ir inst 132 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j main._34.while.cond.3                                               # ir inst 133 fin
main._39.while.exit.3:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 134 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 135 fin
  lw t5, 0(t6)                                                          # ir inst 136 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.traverse_and_sum
  mv t6, a0
  ld t5, 0(sp)
# ir inst 137 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 138 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 139 fin
  lw t5, 0(t6)                                                          # ir inst 140 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.get_height
  mv t6, a0
  ld t5, 0(sp)
# ir inst 141 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 142 fin
# Start call preparation
  li a1, 500
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
# ir inst 143 fin
# Start call preparation
  li a1, 501
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
# ir inst 144 fin
# Start call preparation
  li a1, 502
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
# ir inst 145 fin
# Start call preparation
  li a1, 503
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
# ir inst 146 fin
# Start call preparation
  li a1, 504
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
# ir inst 147 fin
# Start call preparation
  li a1, 505
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
# ir inst 148 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 149 fin
  lw t5, 0(t6)                                                          # ir inst 150 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.traverse_and_sum
  mv t6, a0
  ld t5, 0(sp)
# ir inst 151 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 152 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 153 fin
  lw t5, 0(t6)                                                          # ir inst 154 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.get_height
  mv t6, a0
  ld t5, 0(sp)
# ir inst 155 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 156 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 157 fin
  lw t5, 0(t6)                                                          # ir inst 158 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 503
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.search_recursive
  mv t6, a0
  ld t5, 0(sp)
# ir inst 159 fin
  bnez t6, main._40.if.then.2
  j main._41.if.else.2                                                  # ir inst 160 fin
main._40.if.then.2:
# Phi connections
  li t6, 1
  j main._42.if.exit.2                                                  # ir inst 161 fin
main._41.if.else.2:
# Phi connections
  li t6, 0
  j main._42.if.exit.2                                                  # ir inst 162 fin
main._42.if.exit.2:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 164 fin
  addi t1, sp, 48
  li t5, 9804
  add t5, t1, t5                                                        # ir inst 165 fin
  lw t4, 0(t5)                                                          # ir inst 166 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  li a2, 999
  mv a1, t4
  addi t1, sp, 48
  mv a0, t1
  call .F.search_recursive
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 167 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 168 fin
  bnez t4, main._43.if.then.3
  j main._44.if.else.3                                                  # ir inst 169 fin
main._43.if.then.3:
# Phi connections
  li t6, 2
  j main._45.if.exit.3                                                  # ir inst 170 fin
main._44.if.else.3:
# Phi connections
  j main._45.if.exit.3                                                  # ir inst 171 fin
main._45.if.exit.3:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 173 fin
# Phi connections
  li t6, 100
  j main._46.while.cond.4                                               # ir inst 174 fin
main._46.while.cond.4:
  li t2, 150
  slt t5, t6, t2                                                        # ir inst 176 fin
  bnez t5, main._47.while.body.4
  j main._48.while.exit.4                                               # ir inst 177 fin
main._47.while.body.4:
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 178 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.insert
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 179 fin
  addi t5, t6, 1                                                        # ir inst 180 fin
# Phi connections
  mv t6, t5
  j main._46.while.cond.4                                               # ir inst 181 fin
main._48.while.exit.4:
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 182 fin
  lw t5, 0(t6)                                                          # ir inst 183 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.traverse_and_sum
  mv t6, a0
  ld t5, 0(sp)
# ir inst 184 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 185 fin
  addi t1, sp, 48
  li t6, 9804
  add t6, t1, t6                                                        # ir inst 186 fin
  lw t5, 0(t6)                                                          # ir inst 187 fin
# Start call preparation
  sd t5, 0(sp)
  mv a1, t5
  addi t1, sp, 48
  mv a0, t1
  call .F.get_height
  mv t6, a0
  ld t5, 0(sp)
# ir inst 188 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 189 fin
# Phi connections
  li t5, 0
  li t6, 0
  j main._49.while.cond.5                                               # ir inst 190 fin
main._49.while.cond.5:
  addi t1, sp, 48
  li t4, 9800
  add t4, t1, t4                                                        # ir inst 193 fin
  lw t3, 0(t4)                                                          # ir inst 194 fin
  slt t4, t5, t3                                                        # ir inst 195 fin
  bnez t4, main._50.while.body.5
  j main._54.while.exit.5                                               # ir inst 196 fin
main._50.while.body.5:
  addi t1, sp, 48
  li t4, 9000
  add t4, t1, t4                                                        # ir inst 197 fin
  mv t3, t5                                                             # ir inst 198 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 199 fin
  lw t4, 0(s11)                                                         # ir inst 200 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 201 fin
  bnez t3, main._51.if.then.4
  j main._52.if.else.4                                                  # ir inst 202 fin
main._51.if.then.4:
  addi t4, t6, 1                                                        # ir inst 203 fin
# Phi connections
  j main._53.if.exit.4                                                  # ir inst 204 fin
main._52.if.else.4:
# Phi connections
  mv t4, t6
  j main._53.if.exit.4                                                  # ir inst 205 fin
main._53.if.exit.4:
  addi t3, t5, 1                                                        # ir inst 207 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j main._49.while.cond.5                                               # ir inst 208 fin
main._54.while.exit.5:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 209 fin
# Phi connections
  li t6, 0
  j main._55.while.cond.6                                               # ir inst 210 fin
main._55.while.cond.6:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 212 fin
  bnez t5, main._56.while.body.6
  j main._60.while.exit.6                                               # ir inst 213 fin
main._56.while.body.6:
  li t2, 5
  slt t5, t2, t6                                                        # ir inst 214 fin
  bnez t5, main._57.if.then.5
  j main._58.if.else.5                                                  # ir inst 215 fin
main._57.if.then.5:
  j main._59.if.exit.5                                                  # ir inst 216 fin
main._58.if.else.5:
  j main._59.if.exit.5                                                  # ir inst 217 fin
main._59.if.exit.5:
  addi t5, t6, 1                                                        # ir inst 218 fin
# Phi connections
  mv t6, t5
  j main._55.while.cond.6                                               # ir inst 219 fin
main._60.while.exit.6:
  j main._62.if.else.6                                                  # ir inst 220 fin
main._61.if.then.6:
# Start call preparation
  li a0, 999
  call printlnInt
# ir inst 221 fin
  j main._63.if.exit.6                                                  # ir inst 222 fin
main._62.if.else.6:
# Start call preparation
  li a0, 888
  call printlnInt
# ir inst 223 fin
  j main._63.if.exit.6                                                  # ir inst 224 fin
main._63.if.exit.6:
# Start call preparation
  li a0, 0
  call exit
# ir inst 225 fin
  j main.epilogue                                                       # ir inst 226 fin
main.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  li t0, 10304
  add sp, sp, t0
  ret
