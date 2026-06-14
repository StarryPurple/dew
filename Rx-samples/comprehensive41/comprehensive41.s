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

.globl .F.new_fs
.F.new_fs:
# spill func args num: 0,             range:    70080(sp) -    70080(sp)
# local var size: 70040,              range:       40(sp) -    70080(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -70080
  add sp, sp, t0
  sd ra, 32(sp)
.F.new_fs._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
  addi t5, t6, 0                                                        # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.new_fs._1.array.cond.0                                           # ir inst 4 fin
.F.new_fs._1.array.cond.0:
  li t2, 16384
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F.new_fs._2.array.body.0
  j .F.new_fs._3.array.exit.0                                           # ir inst 7 fin
.F.new_fs._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F.new_fs._1.array.cond.0                                           # ir inst 11 fin
.F.new_fs._3.array.exit.0:
  addi t1, sp, 40
  li t6, 65536
  add t6, t1, t6                                                        # ir inst 12 fin
  addi t5, t6, 0                                                        # ir inst 13 fin
# Phi connections
  li t6, 0
  j .F.new_fs._4.array.cond.1                                           # ir inst 14 fin
.F.new_fs._4.array.cond.1:
  li t2, 128
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, .F.new_fs._5.array.body.1
  j .F.new_fs._6.array.exit.1                                           # ir inst 17 fin
.F.new_fs._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t4
  j .F.new_fs._4.array.cond.1                                           # ir inst 21 fin
.F.new_fs._6.array.exit.1:
  addi t1, sp, 40
  li t6, 66048
  add t6, t1, t6                                                        # ir inst 22 fin
  addi t5, t6, 0                                                        # ir inst 23 fin
# Phi connections
  li t6, 0
  j .F.new_fs._7.array.cond.2                                           # ir inst 24 fin
.F.new_fs._7.array.cond.2:
  li t2, 128
  slt t4, t6, t2                                                        # ir inst 26 fin
  bnez t4, .F.new_fs._8.array.body.2
  j .F.new_fs._9.array.exit.2                                           # ir inst 27 fin
.F.new_fs._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t4
  j .F.new_fs._7.array.cond.2                                           # ir inst 31 fin
.F.new_fs._9.array.exit.2:
  addi t1, sp, 40
  li t6, 66560
  add t6, t1, t6                                                        # ir inst 32 fin
  li t1, 70056
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 34 fin
# Phi connections
  li t4, 0
  j .F.new_fs._10.array.cond.3                                          # ir inst 35 fin
.F.new_fs._10.array.cond.3:
  li t2, 6
  slt t3, t4, t2                                                        # ir inst 37 fin
  bnez t3, .F.new_fs._11.array.body.3
  j .F.new_fs._12.array.exit.3                                          # ir inst 38 fin
.F.new_fs._11.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 39 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 40 fin
  addi t3, t4, 1                                                        # ir inst 41 fin
# Phi connections
  mv t4, t3
  j .F.new_fs._10.array.cond.3                                          # ir inst 42 fin
.F.new_fs._12.array.exit.3:
  addi t5, t6, 0                                                        # ir inst 43 fin
# Phi connections
  li t6, 0
  j .F.new_fs._13.array.cond.4                                          # ir inst 44 fin
.F.new_fs._13.array.cond.4:
  li t2, 128
  slt t4, t6, t2                                                        # ir inst 46 fin
  bnez t4, .F.new_fs._14.array.body.4
  j .F.new_fs._15.array.exit.4                                          # ir inst 47 fin
.F.new_fs._14.array.body.4:
  li t1, 24
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 24
  li t1, 70056
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 49 fin
  addi t4, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t4
  j .F.new_fs._13.array.cond.4                                          # ir inst 51 fin
.F.new_fs._15.array.exit.4:
  addi t1, sp, 40
  li t6, 69632
  add t6, t1, t6                                                        # ir inst 52 fin
  addi t5, t6, 0                                                        # ir inst 53 fin
# Phi connections
  li t6, 0
  j .F.new_fs._16.array.cond.5                                          # ir inst 54 fin
.F.new_fs._16.array.cond.5:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 56 fin
  bnez t4, .F.new_fs._17.array.body.5
  j .F.new_fs._18.array.exit.5                                          # ir inst 57 fin
.F.new_fs._17.array.body.5:
  add t4, t5, t6                                                        # ir inst 58 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t6, 1                                                        # ir inst 60 fin
# Phi connections
  mv t6, t4
  j .F.new_fs._16.array.cond.5                                          # ir inst 61 fin
.F.new_fs._18.array.exit.5:
  addi t1, sp, 40
  li t6, 69888
  add t6, t1, t6                                                        # ir inst 62 fin
  addi t5, t6, 0                                                        # ir inst 63 fin
# Phi connections
  li t6, 0
  j .F.new_fs._19.array.cond.6                                          # ir inst 64 fin
.F.new_fs._19.array.cond.6:
  li t2, 128
  slt t4, t6, t2                                                        # ir inst 66 fin
  bnez t4, .F.new_fs._20.array.body.6
  j .F.new_fs._21.array.exit.6                                          # ir inst 67 fin
.F.new_fs._20.array.body.6:
  add t4, t5, t6                                                        # ir inst 68 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 69 fin
  addi t4, t6, 1                                                        # ir inst 70 fin
# Phi connections
  mv t6, t4
  j .F.new_fs._19.array.cond.6                                          # ir inst 71 fin
.F.new_fs._21.array.exit.6:
# Start call preparation
  sd a0, 0(sp)
  li a2, 70016
  addi t1, sp, 40
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 72 fin
  j .F.new_fs.epilogue                                                  # ir inst 73 fin
.F.new_fs.epilogue:
  ld ra, 32(sp)
  li t0, 70080
  add sp, sp, t0
  ret

.globl .F.fs_format
.F.fs_format:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F.fs_format._0.entry.0:
# Phi connections
  li t6, 0
  j .F.fs_format._1.while.cond.0                                        # ir inst 1 fin
.F.fs_format._1.while.cond.0:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.fs_format._2.while.body.0
  j .F.fs_format._3.while.exit.0                                        # ir inst 4 fin
.F.fs_format._2.while.body.0:
  li t5, 69632
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.fs_format._1.while.cond.0                                        # ir inst 10 fin
.F.fs_format._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.fs_format._4.while.cond.1                                        # ir inst 11 fin
.F.fs_format._4.while.cond.1:
  li t2, 128
  slt t5, t6, t2                                                        # ir inst 13 fin
  bnez t5, .F.fs_format._5.while.body.1
  j .F.fs_format._6.while.exit.1                                        # ir inst 14 fin
.F.fs_format._5.while.body.1:
  li t5, 69888
  add t5, a0, t5                                                        # ir inst 15 fin
  mv t4, t6                                                             # ir inst 16 fin
  add t3, t5, t4                                                        # ir inst 17 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.fs_format._4.while.cond.1                                        # ir inst 20 fin
.F.fs_format._6.while.exit.1:
# Start call preparation
  sd a0, 0(sp)
  call .F.allocate_inode
  mv t6, a0
  ld a0, 0(sp)
# ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.allocate_block
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 22 fin
  li t4, 65536
  add t4, a0, t4                                                        # ir inst 23 fin
  mv t3, t6                                                             # ir inst 24 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 25 fin
  li t1, 2
  sw t1, 0(s11)                                                         # ir inst 26 fin
  li t4, 66048
  add t4, a0, t4                                                        # ir inst 27 fin
  mv t3, t6                                                             # ir inst 28 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 29 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 30 fin
  li t4, 66560
  add t4, a0, t4                                                        # ir inst 31 fin
  mv t3, t6                                                             # ir inst 32 fin
  li t1, 24
  mul t2, t3, t1
  add t6, t4, t2                                                        # ir inst 33 fin
  addi t4, t6, 0                                                        # ir inst 34 fin
  sw t5, 0(t4)                                                          # ir inst 35 fin
  j .F.fs_format.epilogue                                               # ir inst 36 fin
.F.fs_format.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl .F.allocate_inode
.F.allocate_inode:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.allocate_inode._0.entry.0:
# Phi connections
  li t6, 0
  j .F.allocate_inode._1.while.cond.0                                   # ir inst 1 fin
.F.allocate_inode._1.while.cond.0:
  li t2, 128
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.allocate_inode._2.while.body.0
  j .F.allocate_inode._9.while.exit.0                                   # ir inst 4 fin
.F.allocate_inode._2.while.body.0:
  li t5, 69888
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  lb t5, 0(t3)                                                          # ir inst 8 fin
  bnez t5, .F.allocate_inode._3.if.then.0
  j .F.allocate_inode._7.if.else.0                                      # ir inst 9 fin
.F.allocate_inode._3.if.then.0:
  li t5, 69888
  add t5, a0, t5                                                        # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  add t3, t5, t4                                                        # ir inst 12 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 13 fin
  li t5, 65536
  add t5, a0, t5                                                        # ir inst 14 fin
  mv t4, t6                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 16 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 17 fin
  li t5, 66048
  add t5, a0, t5                                                        # ir inst 18 fin
  mv t4, t6                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 20 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 21 fin
# Phi connections
  li t5, 0
  j .F.allocate_inode._4.while.cond.1                                   # ir inst 22 fin
.F.allocate_inode._4.while.cond.1:
  li t2, 6
  slt t4, t5, t2                                                        # ir inst 24 fin
  bnez t4, .F.allocate_inode._5.while.body.1
  j .F.allocate_inode._6.while.exit.1                                   # ir inst 25 fin
.F.allocate_inode._5.while.body.1:
  li t4, 66560
  add t4, a0, t4                                                        # ir inst 26 fin
  mv t3, t6                                                             # ir inst 27 fin
  li t1, 24
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 28 fin
  mv t4, t5                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 30 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 31 fin
  addi t4, t5, 1                                                        # ir inst 32 fin
# Phi connections
  mv t5, t4
  j .F.allocate_inode._4.while.cond.1                                   # ir inst 33 fin
.F.allocate_inode._6.while.exit.1:
  mv a0, t6
  j .F.allocate_inode.epilogue                                          # ir inst 34 fin
.F.allocate_inode._7.if.else.0:
  j .F.allocate_inode._8.if.exit.0                                      # ir inst 35 fin
.F.allocate_inode._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t5
  j .F.allocate_inode._1.while.cond.0                                   # ir inst 37 fin
.F.allocate_inode._9.while.exit.0:
  li a0, -1
  j .F.allocate_inode.epilogue                                          # ir inst 38 fin
.F.allocate_inode.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.allocate_block
.F.allocate_block:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.allocate_block._0.entry.0:
# Phi connections
  li t6, 0
  j .F.allocate_block._1.while.cond.0                                   # ir inst 1 fin
.F.allocate_block._1.while.cond.0:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.allocate_block._2.while.body.0
  j .F.allocate_block._6.while.exit.0                                   # ir inst 4 fin
.F.allocate_block._2.while.body.0:
  li t5, 69632
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  lb t5, 0(t3)                                                          # ir inst 8 fin
  bnez t5, .F.allocate_block._3.if.then.0
  j .F.allocate_block._4.if.else.0                                      # ir inst 9 fin
.F.allocate_block._3.if.then.0:
  li t5, 69632
  add t5, a0, t5                                                        # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  add t3, t5, t4                                                        # ir inst 12 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 13 fin
  mv a0, t6
  j .F.allocate_block.epilogue                                          # ir inst 14 fin
.F.allocate_block._4.if.else.0:
  j .F.allocate_block._5.if.exit.0                                      # ir inst 15 fin
.F.allocate_block._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.allocate_block._1.while.cond.0                                   # ir inst 17 fin
.F.allocate_block._6.while.exit.0:
  li a0, -1
  j .F.allocate_block.epilogue                                          # ir inst 18 fin
.F.allocate_block.epilogue:
  ret

.globl .F.find_in_dir
.F.find_in_dir:
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
.F.find_in_dir._0.entry.0:
  li t6, 66048
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
  li t2, 24
  div t5, t6, t2                                                        # ir inst 5 fin
# Phi connections
  li t6, 0
  j .F.find_in_dir._1.while.cond.0                                      # ir inst 6 fin
.F.find_in_dir._1.while.cond.0:
  slt t4, t6, t5                                                        # ir inst 8 fin
  bnez t4, .F.find_in_dir._2.while.body.0
  j .F.find_in_dir._12.while.exit.0                                     # ir inst 9 fin
.F.find_in_dir._2.while.body.0:
  li t2, 24
  mul t4, t6, t2                                                        # ir inst 10 fin
  li t2, 64
  div t3, t4, t2                                                        # ir inst 11 fin
  li t2, 24
  mul t4, t6, t2                                                        # ir inst 12 fin
  li t2, 64
  rem s11, t4, t2                                                       # ir inst 13 fin
  li t4, 66560
  add t4, a0, t4                                                        # ir inst 14 fin
  mv s10, a1                                                            # ir inst 15 fin
  li t1, 24
  mul t2, s10, t1
  add s9, t4, t2                                                        # ir inst 16 fin
  mv t4, t3                                                             # ir inst 17 fin
  slli t2, t4, 2
  add t3, s9, t2                                                        # ir inst 18 fin
  lw t4, 0(t3)                                                          # ir inst 19 fin
  slli t3, t4, 6                                                        # ir inst 20 fin
  add t4, t3, s11                                                       # ir inst 21 fin
# Phi connections
  li t3, 0
  j .F.find_in_dir._3.while.cond.1                                      # ir inst 22 fin
.F.find_in_dir._3.while.cond.1:
  li t2, 16
  slt s11, t3, t2                                                       # ir inst 24 fin
  bnez s11, .F.find_in_dir._4.while.body.1
  j .F.find_in_dir._13.critical_edge.0                                  # ir inst 25 fin
.F.find_in_dir._4.while.body.1:
  addi s11, a0, 0                                                       # ir inst 26 fin
  add s10, t4, t3                                                       # ir inst 27 fin
  mv s9, s10                                                            # ir inst 28 fin
  slli t2, s9, 2
  add s10, s11, t2                                                      # ir inst 29 fin
  lw s11, 0(s10)                                                        # ir inst 30 fin
  mv s10, t3                                                            # ir inst 31 fin
  slli t2, s10, 2
  add s9, a2, t2                                                        # ir inst 32 fin
  lw s10, 0(s9)                                                         # ir inst 33 fin
  xor t0, s11, s10
  sltu s9, zero, t0                                                     # ir inst 34 fin
  bnez s9, .F.find_in_dir._5.if.then.0
  j .F.find_in_dir._6.if.else.0                                         # ir inst 35 fin
.F.find_in_dir._5.if.then.0:
# Phi connections
  li t3, 0
  j .F.find_in_dir._8.while.exit.1                                      # ir inst 36 fin
.F.find_in_dir._6.if.else.0:
  j .F.find_in_dir._7.if.exit.0                                         # ir inst 37 fin
.F.find_in_dir._7.if.exit.0:
  addi s11, t3, 1                                                       # ir inst 38 fin
# Phi connections
  mv t3, s11
  j .F.find_in_dir._3.while.cond.1                                      # ir inst 39 fin
.F.find_in_dir._8.while.exit.1:
  bnez t3, .F.find_in_dir._9.if.then.1
  j .F.find_in_dir._10.if.else.1                                        # ir inst 41 fin
.F.find_in_dir._9.if.then.1:
  addi t3, a0, 0                                                        # ir inst 42 fin
  addi s11, t4, 16                                                      # ir inst 43 fin
  mv s10, s11                                                           # ir inst 44 fin
  slli t2, s10, 2
  add s11, t3, t2                                                       # ir inst 45 fin
  lw t3, 0(s11)                                                         # ir inst 46 fin
  mv a0, t3
  j .F.find_in_dir.epilogue                                             # ir inst 47 fin
.F.find_in_dir._10.if.else.1:
  j .F.find_in_dir._11.if.exit.1                                        # ir inst 48 fin
.F.find_in_dir._11.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t3
  j .F.find_in_dir._1.while.cond.0                                      # ir inst 50 fin
.F.find_in_dir._12.while.exit.0:
  li a0, -1
  j .F.find_in_dir.epilogue                                             # ir inst 51 fin
.F.find_in_dir._13.critical_edge.0:
# Phi connections
  li t3, 1
  j .F.find_in_dir._8.while.exit.1                                      # ir inst 52 fin
.F.find_in_dir.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.create_file
.F.create_file:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 64,                 range:       64(sp) -      128(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.create_file._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a1, a2
  addi t1, sp, 64
  mv a0, t1
  li a2, 64
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  addi t1, sp, 64
  mv a2, t1
  call .F.find_in_dir
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 3 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 4 fin
  bnez t5, .F.create_file._1.if.then.0
  j .F.create_file._2.if.else.0                                         # ir inst 5 fin
.F.create_file._1.if.then.0:
  li a0, -1
  j .F.create_file.epilogue                                             # ir inst 6 fin
.F.create_file._2.if.else.0:
  j .F.create_file._3.if.exit.0                                         # ir inst 7 fin
.F.create_file._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.allocate_inode
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 8 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 9 fin
  bnez t5, .F.create_file._4.if.then.1
  j .F.create_file._5.if.else.1                                         # ir inst 10 fin
.F.create_file._4.if.then.1:
  li a0, -1
  j .F.create_file.epilogue                                             # ir inst 11 fin
.F.create_file._5.if.else.1:
  j .F.create_file._6.if.exit.1                                         # ir inst 12 fin
.F.create_file._6.if.exit.1:
  li t5, 65536
  add t5, a0, t5                                                        # ir inst 13 fin
  mv t4, t6                                                             # ir inst 14 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 15 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 16 fin
  li t5, 66048
  add t5, a0, t5                                                        # ir inst 17 fin
  mv t4, a1                                                             # ir inst 18 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 19 fin
  lw t5, 0(t3)                                                          # ir inst 20 fin
  li t2, 64
  div t4, t5, t2                                                        # ir inst 21 fin
  li t2, 64
  rem t3, t5, t2                                                        # ir inst 22 fin
  li s11, 66560
  add s11, a0, s11                                                      # ir inst 23 fin
  mv s10, a1                                                            # ir inst 24 fin
  li t1, 24
  mul t2, s10, t1
  add s9, s11, t2                                                       # ir inst 25 fin
  mv s11, t4                                                            # ir inst 26 fin
  slli t2, s11, 2
  add t4, s9, t2                                                        # ir inst 27 fin
  lw s11, 0(t4)                                                         # ir inst 28 fin
  slli t4, s11, 6                                                       # ir inst 29 fin
  add s11, t4, t3                                                       # ir inst 30 fin
# Phi connections
  li t4, 0
  j .F.create_file._7.while.cond.0                                      # ir inst 31 fin
.F.create_file._7.while.cond.0:
  li t2, 16
  slt t3, t4, t2                                                        # ir inst 33 fin
  bnez t3, .F.create_file._8.while.body.0
  j .F.create_file._9.while.exit.0                                      # ir inst 34 fin
.F.create_file._8.while.body.0:
  addi t3, a0, 0                                                        # ir inst 35 fin
  add s10, s11, t4                                                      # ir inst 36 fin
  mv s9, s10                                                            # ir inst 37 fin
  slli t2, s9, 2
  add s10, t3, t2                                                       # ir inst 38 fin
  mv t3, t4                                                             # ir inst 39 fin
  slli t2, t3, 2
  add s9, a2, t2                                                        # ir inst 40 fin
  lw t3, 0(s9)                                                          # ir inst 41 fin
  sw t3, 0(s10)                                                         # ir inst 42 fin
  addi t3, t4, 1                                                        # ir inst 43 fin
# Phi connections
  mv t4, t3
  j .F.create_file._7.while.cond.0                                      # ir inst 44 fin
.F.create_file._9.while.exit.0:
  addi t4, a0, 0                                                        # ir inst 45 fin
  addi t3, s11, 16                                                      # ir inst 46 fin
  mv s11, t3                                                            # ir inst 47 fin
  slli t2, s11, 2
  add t3, t4, t2                                                        # ir inst 48 fin
  sw t6, 0(t3)                                                          # ir inst 49 fin
  li t4, 66048
  add t4, a0, t4                                                        # ir inst 50 fin
  mv t3, a1                                                             # ir inst 51 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 52 fin
  addi t4, t5, 24                                                       # ir inst 53 fin
  sw t4, 0(s11)                                                         # ir inst 54 fin
  mv a0, t6
  j .F.create_file.epilogue                                             # ir inst 55 fin
.F.create_file.epilogue:
  ld ra, 56(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 128
  ret

.globl .F.write_file
.F.write_file:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 5 / 12,        range:       56(sp) -       96(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s7, 56(sp)
  sd s8, 64(sp)
  sd s10, 72(sp)
  sd s9, 80(sp)
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.write_file._0.entry.0:
  li t2, 100
  slt t6, t2, a3                                                        # ir inst 1 fin
  bnez t6, .F.write_file._1.if.then.0
  j .F.write_file._2.if.else.0                                          # ir inst 2 fin
.F.write_file._1.if.then.0:
# Phi connections
  li t6, 100
  j .F.write_file._3.if.exit.0                                          # ir inst 3 fin
.F.write_file._2.if.else.0:
# Phi connections
  mv t6, a3
  j .F.write_file._3.if.exit.0                                          # ir inst 4 fin
.F.write_file._3.if.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  j .F.write_file._4.while.cond.0                                       # ir inst 6 fin
.F.write_file._4.while.cond.0:
  slt t3, t4, t6                                                        # ir inst 9 fin
  bnez t3, .F.write_file._5.while.body.0
  j .F.write_file._15.while.exit.0                                      # ir inst 10 fin
.F.write_file._5.while.body.0:
  li t3, 66048
  add t3, a0, t3                                                        # ir inst 11 fin
  mv s11, a1                                                            # ir inst 12 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 13 fin
  lw t3, 0(s10)                                                         # ir inst 14 fin
  li t2, 64
  div s11, t3, t2                                                       # ir inst 15 fin
  li t2, 6
  slt t0, s11, t2
  xori t3, t0, 1                                                        # ir inst 16 fin
  bnez t3, .F.write_file._6.if.then.1
  j .F.write_file._7.if.else.1                                          # ir inst 17 fin
.F.write_file._6.if.then.1:
  li a0, -1
  j .F.write_file.epilogue                                              # ir inst 18 fin
.F.write_file._7.if.else.1:
  j .F.write_file._8.if.exit.1                                          # ir inst 19 fin
.F.write_file._8.if.exit.1:
  li t3, 66560
  add t3, a0, t3                                                        # ir inst 20 fin
  mv s10, a1                                                            # ir inst 21 fin
  li t1, 24
  mul t2, s10, t1
  add s9, t3, t2                                                        # ir inst 22 fin
  mv t3, s11                                                            # ir inst 23 fin
  slli t2, t3, 2
  add s10, s9, t2                                                       # ir inst 24 fin
  lw t3, 0(s10)                                                         # ir inst 25 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s10, t0, 1                                                      # ir inst 26 fin
  bnez s10, .F.write_file._9.if.then.2
  j .F.write_file._13.if.else.2                                         # ir inst 27 fin
.F.write_file._9.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  call .F.allocate_block
  mv s10, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 28 fin
  li t2, -1
  xor t0, s10, t2
  sltiu s9, t0, 1                                                       # ir inst 29 fin
  bnez s9, .F.write_file._10.if.then.3
  j .F.write_file._11.if.else.3                                         # ir inst 30 fin
.F.write_file._10.if.then.3:
  li a0, -1
  j .F.write_file.epilogue                                              # ir inst 31 fin
.F.write_file._11.if.else.3:
  j .F.write_file._12.if.exit.3                                         # ir inst 32 fin
.F.write_file._12.if.exit.3:
  li s9, 66560
  add s9, a0, s9                                                        # ir inst 33 fin
  mv s8, a1                                                             # ir inst 34 fin
  li t1, 24
  mul t2, s8, t1
  add s7, s9, t2                                                        # ir inst 35 fin
  mv s9, s11                                                            # ir inst 36 fin
  slli t2, s9, 2
  add s11, s7, t2                                                       # ir inst 37 fin
  sw s10, 0(s11)                                                        # ir inst 38 fin
# Phi connections
  mv t3, s10
  j .F.write_file._14.if.exit.2                                         # ir inst 39 fin
.F.write_file._13.if.else.2:
# Phi connections
  j .F.write_file._14.if.exit.2                                         # ir inst 40 fin
.F.write_file._14.if.exit.2:
  li s11, 66048
  add s11, a0, s11                                                      # ir inst 42 fin
  mv s10, a1                                                            # ir inst 43 fin
  slli t2, s10, 2
  add s9, s11, t2                                                       # ir inst 44 fin
  lw s11, 0(s9)                                                         # ir inst 45 fin
  li t2, 64
  rem s10, s11, t2                                                      # ir inst 46 fin
  slli s11, t3, 6                                                       # ir inst 47 fin
  add t3, s11, s10                                                      # ir inst 48 fin
  addi s11, a0, 0                                                       # ir inst 49 fin
  mv s10, t3                                                            # ir inst 50 fin
  slli t2, s10, 2
  add t3, s11, t2                                                       # ir inst 51 fin
  mv s11, t4                                                            # ir inst 52 fin
  slli t2, s11, 2
  add s10, a2, t2                                                       # ir inst 53 fin
  lw s11, 0(s10)                                                        # ir inst 54 fin
  sw s11, 0(t3)                                                         # ir inst 55 fin
  li t3, 66048
  add t3, a0, t3                                                        # ir inst 56 fin
  mv s11, a1                                                            # ir inst 57 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 58 fin
  li t3, 66048
  add t3, a0, t3                                                        # ir inst 59 fin
  mv s11, a1                                                            # ir inst 60 fin
  slli t2, s11, 2
  add s9, t3, t2                                                        # ir inst 61 fin
  lw t3, 0(s9)                                                          # ir inst 62 fin
  addi s11, t3, 1                                                       # ir inst 63 fin
  sw s11, 0(s10)                                                        # ir inst 64 fin
  addi t3, t4, 1                                                        # ir inst 65 fin
  addi t4, t5, 1                                                        # ir inst 66 fin
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F.write_file._4.while.cond.0                                       # ir inst 67 fin
.F.write_file._15.while.exit.0:
  mv a0, t5
  j .F.write_file.epilogue                                              # ir inst 68 fin
.F.write_file.epilogue:
  ld ra, 96(sp)
  ld s7, 56(sp)
  ld s8, 64(sp)
  ld s10, 72(sp)
  ld s9, 80(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.read_file
.F.read_file:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s9, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s11, 24(sp)
.F.read_file._0.entry.0:
  li t6, 66048
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  lw t6, 0(t4)                                                          # ir inst 4 fin
# Phi connections
  li t4, 0
  li t5, 0
  j .F.read_file._1.while.cond.0                                        # ir inst 5 fin
.F.read_file._1.while.cond.0:
  slt t3, t5, t6                                                        # ir inst 8 fin
  bnez t3, .F.read_file._2.while.body.0
  j .F.read_file._3.while.exit.0                                        # ir inst 9 fin
.F.read_file._2.while.body.0:
  li t2, 64
  div t3, t5, t2                                                        # ir inst 10 fin
  li t2, 64
  rem s11, t5, t2                                                       # ir inst 11 fin
  li s10, 66560
  add s10, a0, s10                                                      # ir inst 12 fin
  mv s9, a1                                                             # ir inst 13 fin
  li t1, 24
  mul t2, s9, t1
  add s8, s10, t2                                                       # ir inst 14 fin
  mv s10, t3                                                            # ir inst 15 fin
  slli t2, s10, 2
  add t3, s8, t2                                                        # ir inst 16 fin
  lw s10, 0(t3)                                                         # ir inst 17 fin
  slli t3, s10, 6                                                       # ir inst 18 fin
  add s10, t3, s11                                                      # ir inst 19 fin
  addi t3, a0, 0                                                        # ir inst 20 fin
  mv s11, s10                                                           # ir inst 21 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 22 fin
  lw t3, 0(s10)                                                         # ir inst 23 fin
  add s11, t4, t3                                                       # ir inst 24 fin
  addi t3, t5, 1                                                        # ir inst 25 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.read_file._1.while.cond.0                                        # ir inst 26 fin
.F.read_file._3.while.exit.0:
  mv a0, t4
  j .F.read_file.epilogue                                               # ir inst 27 fin
.F.read_file.epilogue:
  ld s9, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s11, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.str_to_arr
.F.str_to_arr:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 64,                 range:       16(sp) -       80(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 8(sp)
.F.str_to_arr._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.str_to_arr._1.array.cond.0                                       # ir inst 3 fin
.F.str_to_arr._1.array.cond.0:
  li t2, 16
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.str_to_arr._2.array.body.0
  j .F.str_to_arr._3.array.exit.0                                       # ir inst 6 fin
.F.str_to_arr._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.str_to_arr._1.array.cond.0                                       # ir inst 10 fin
.F.str_to_arr._3.array.exit.0:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 11 fin
  bnez t6, .F.str_to_arr._4.if.then.0
  j .F.str_to_arr._5.if.else.0                                          # ir inst 12 fin
.F.str_to_arr._4.if.then.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 13 fin
  li t1, 102
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 15 fin
  li t1, 105
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 17 fin
  li t1, 108
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 19 fin
  li t1, 101
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 16
  addi t6, t1, 16                                                       # ir inst 21 fin
  li t1, 49
  sw t1, 0(t6)                                                          # ir inst 22 fin
  j .F.str_to_arr._12.if.exit.0                                         # ir inst 23 fin
.F.str_to_arr._5.if.else.0:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 24 fin
  bnez t6, .F.str_to_arr._6.if.then.1
  j .F.str_to_arr._7.if.else.1                                          # ir inst 25 fin
.F.str_to_arr._6.if.then.1:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 26 fin
  li t1, 100
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 28 fin
  li t1, 97
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 30 fin
  li t1, 116
  sw t1, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 32 fin
  li t1, 97
  sw t1, 0(t6)                                                          # ir inst 33 fin
  j .F.str_to_arr._11.if.exit.1                                         # ir inst 34 fin
.F.str_to_arr._7.if.else.1:
  li t2, 3
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 35 fin
  bnez t6, .F.str_to_arr._8.if.then.2
  j .F.str_to_arr._9.if.else.2                                          # ir inst 36 fin
.F.str_to_arr._8.if.then.2:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 37 fin
  li t1, 116
  sw t1, 0(t6)                                                          # ir inst 38 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 39 fin
  li t1, 101
  sw t1, 0(t6)                                                          # ir inst 40 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 41 fin
  li t1, 109
  sw t1, 0(t6)                                                          # ir inst 42 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 43 fin
  li t1, 112
  sw t1, 0(t6)                                                          # ir inst 44 fin
  j .F.str_to_arr._10.if.exit.2                                         # ir inst 45 fin
.F.str_to_arr._9.if.else.2:
  j .F.str_to_arr._10.if.exit.2                                         # ir inst 46 fin
.F.str_to_arr._10.if.exit.2:
  j .F.str_to_arr._11.if.exit.1                                         # ir inst 47 fin
.F.str_to_arr._11.if.exit.1:
  j .F.str_to_arr._12.if.exit.0                                         # ir inst 48 fin
.F.str_to_arr._12.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 64
  addi t1, sp, 16
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 49 fin
  j .F.str_to_arr.epilogue                                              # ir inst 50 fin
.F.str_to_arr.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 80
  ret

.globl main
main:
# spill func args num: 0,             range:    72912(sp) -    72912(sp)
# local var size: 72864,              range:       48(sp) -    72912(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -72912
  add sp, sp, t0
  sd s11, 24(sp)
  sd s10, 32(sp)
  sd ra, 40(sp)
main._0.entry.0:
# Start call preparation
  addi t1, sp, 1504
  mv a0, t1
  call .F.new_fs
# ir inst 9 fin
# Start call preparation
  addi t1, sp, 1504
  mv a0, t1
  call .F.fs_format
# ir inst 10 fin
# Start call preparation
  li a1, 1
  li t1, 71520
  add t1, sp, t1
  mv a0, t1
  call .F.str_to_arr
# ir inst 12 fin
# Start call preparation
  li a2, 64
  li t1, 71520
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call memcpy
# ir inst 13 fin
# Start call preparation
  addi t1, sp, 48
  mv a2, t1
  li a1, 0
  addi t1, sp, 1504
  mv a0, t1
  call .F.create_file
  mv t6, a0
# ir inst 14 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 15 fin
  li t1, 71584
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 17 fin
# Phi connections
  li t4, 0
  j main._1.array.cond.0                                                # ir inst 18 fin
main._1.array.cond.0:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 20 fin
  bnez t3, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 21 fin
main._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 22 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 23 fin
  addi t3, t4, 1                                                        # ir inst 24 fin
# Phi connections
  mv t4, t3
  j main._1.array.cond.0                                                # ir inst 25 fin
main._3.array.exit.0:
# Phi connections
  li t5, 0
  j main._4.while.cond.0                                                # ir inst 26 fin
main._4.while.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 28 fin
  bnez t4, main._5.while.body.0
  j main._6.while.exit.0                                                # ir inst 29 fin
main._5.while.body.0:
  mv t4, t5                                                             # ir inst 30 fin
  slli t2, t4, 2
  li t1, 71584
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 31 fin
  li t2, 3
  mul t4, t5, t2                                                        # ir inst 32 fin
  sw t4, 0(t3)                                                          # ir inst 33 fin
  addi t4, t5, 1                                                        # ir inst 34 fin
# Phi connections
  mv t5, t4
  j main._4.while.cond.0                                                # ir inst 35 fin
main._6.while.exit.0:
# Start call preparation
  sd t6, 0(sp)
  li a2, 400
  li t1, 71584
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 112
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 36 fin
# Start call preparation
  sd t6, 0(sp)
  li a3, 80
  addi t1, sp, 112
  mv a2, t1
  mv a1, t6
  addi t1, sp, 1504
  mv a0, t1
  call .F.write_file
  mv t5, a0
  ld t6, 0(sp)
# ir inst 37 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 38 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 1504
  mv a0, t1
  call .F.read_file
  mv t5, a0
  ld t6, 0(sp)
# ir inst 39 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 40 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 2
  li t1, 71984
  add t1, sp, t1
  mv a0, t1
  call .F.str_to_arr
  ld t6, 0(sp)
# ir inst 42 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 64
  li t1, 71984
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 512
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 43 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 512
  mv a2, t1
  li a1, 0
  addi t1, sp, 1504
  mv a0, t1
  call .F.create_file
  mv t5, a0
  ld t6, 0(sp)
# ir inst 44 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 45 fin
  li t1, 72048
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 47 fin
# Phi connections
  li t3, 0
  j main._7.array.cond.1                                                # ir inst 48 fin
main._7.array.cond.1:
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 50 fin
  bnez s11, main._8.array.body.1
  j main._9.array.exit.1                                                # ir inst 51 fin
main._8.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 52 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 53 fin
  addi s11, t3, 1                                                       # ir inst 54 fin
# Phi connections
  mv t3, s11
  j main._7.array.cond.1                                                # ir inst 55 fin
main._9.array.exit.1:
# Phi connections
  li t4, 0
  j main._10.while.cond.1                                               # ir inst 56 fin
main._10.while.cond.1:
  li t2, 100
  slt t3, t4, t2                                                        # ir inst 58 fin
  bnez t3, main._11.while.body.1
  j main._12.while.exit.1                                               # ir inst 59 fin
main._11.while.body.1:
  mv t3, t4                                                             # ir inst 60 fin
  slli t2, t3, 2
  li t1, 72048
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 61 fin
  li t1, 100
  sub t3, t1, t4                                                        # ir inst 62 fin
  sw t3, 0(s11)                                                         # ir inst 63 fin
  addi t3, t4, 1                                                        # ir inst 64 fin
# Phi connections
  mv t4, t3
  j main._10.while.cond.1                                               # ir inst 65 fin
main._12.while.exit.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a2, 400
  li t1, 72048
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 576
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 66 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a3, 150
  addi t1, sp, 576
  mv a2, t1
  mv a1, t5
  addi t1, sp, 1504
  mv a0, t1
  call .F.write_file
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 67 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 68 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 1504
  mv a0, t1
  call .F.read_file
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 69 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 70 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 64
  li t1, 71520
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 976
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 71 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 976
  mv a2, t1
  li a1, 0
  addi t1, sp, 1504
  mv a0, t1
  call .F.find_in_dir
  mv t5, a0
  ld t6, 0(sp)
# ir inst 72 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 73 fin
# Start call preparation
  sd t6, 0(sp)
  li a1, 3
  li t1, 72448
  add t1, sp, t1
  mv a0, t1
  call .F.str_to_arr
  ld t6, 0(sp)
# ir inst 75 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 64
  li t1, 72448
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1040
  mv a0, t1
  call memcpy
  ld t6, 0(sp)
# ir inst 76 fin
# Start call preparation
  sd t6, 0(sp)
  addi t1, sp, 1040
  mv a2, t1
  li a1, 0
  addi t1, sp, 1504
  mv a0, t1
  call .F.find_in_dir
  mv t5, a0
  ld t6, 0(sp)
# ir inst 77 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 78 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._13.while.cond.2                                               # ir inst 79 fin
main._13.while.cond.2:
  li t2, 256
  slt t3, t4, t2                                                        # ir inst 82 fin
  bnez t3, main._14.while.body.2
  j main._18.while.exit.2                                               # ir inst 83 fin
main._14.while.body.2:
  addi t1, sp, 1504
  li t3, 69632
  add t3, t1, t3                                                        # ir inst 84 fin
  mv s11, t4                                                            # ir inst 85 fin
  add s10, t3, s11                                                      # ir inst 86 fin
  lb t3, 0(s10)                                                         # ir inst 87 fin
  bnez t3, main._15.if.then.0
  j main._16.if.else.0                                                  # ir inst 88 fin
main._15.if.then.0:
  addi t3, t5, 1                                                        # ir inst 89 fin
# Phi connections
  j main._17.if.exit.0                                                  # ir inst 90 fin
main._16.if.else.0:
# Phi connections
  mv t3, t5
  j main._17.if.exit.0                                                  # ir inst 91 fin
main._17.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 93 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j main._13.while.cond.2                                               # ir inst 94 fin
main._18.while.exit.2:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 95 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._19.while.cond.3                                               # ir inst 96 fin
main._19.while.cond.3:
  li t2, 128
  slt t3, t4, t2                                                        # ir inst 99 fin
  bnez t3, main._20.while.body.3
  j main._24.while.exit.3                                               # ir inst 100 fin
main._20.while.body.3:
  addi t1, sp, 1504
  li t3, 69888
  add t3, t1, t3                                                        # ir inst 101 fin
  mv s11, t4                                                            # ir inst 102 fin
  add s10, t3, s11                                                      # ir inst 103 fin
  lb t3, 0(s10)                                                         # ir inst 104 fin
  bnez t3, main._21.if.then.1
  j main._22.if.else.1                                                  # ir inst 105 fin
main._21.if.then.1:
  addi t3, t5, 1                                                        # ir inst 106 fin
# Phi connections
  j main._23.if.exit.1                                                  # ir inst 107 fin
main._22.if.else.1:
# Phi connections
  mv t3, t5
  j main._23.if.exit.1                                                  # ir inst 108 fin
main._23.if.exit.1:
  addi s11, t4, 1                                                       # ir inst 110 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j main._19.while.cond.3                                               # ir inst 111 fin
main._24.while.exit.3:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 112 fin
# Phi connections
  li t4, 0
  li t5, 0
  j main._25.while.cond.4                                               # ir inst 113 fin
main._25.while.cond.4:
  li t2, 16384
  slt t3, t4, t2                                                        # ir inst 116 fin
  bnez t3, main._26.while.body.4
  j main._27.while.exit.4                                               # ir inst 117 fin
main._26.while.body.4:
  addi t1, sp, 1504
  addi t3, t1, 0                                                        # ir inst 118 fin
  mv s11, t4                                                            # ir inst 119 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 120 fin
  lw t3, 0(s10)                                                         # ir inst 121 fin
  add s11, t5, t3                                                       # ir inst 122 fin
  addi t3, t4, 1                                                        # ir inst 123 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._25.while.cond.4                                               # ir inst 124 fin
main._27.while.exit.4:
  li t2, 10000
  rem t4, t5, t2                                                        # ir inst 125 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 126 fin
# Phi connections
  li t5, 0
  j main._28.while.cond.5                                               # ir inst 127 fin
main._28.while.cond.5:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 129 fin
  bnez t4, main._29.while.body.5
  j main._36.while.exit.5                                               # ir inst 130 fin
main._29.while.body.5:
  li t1, 72512
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 132 fin
# Phi connections
  li t3, 0
  j main._30.array.cond.2                                               # ir inst 133 fin
main._30.array.cond.2:
  li t2, 100
  slt s11, t3, t2                                                       # ir inst 135 fin
  bnez s11, main._31.array.body.2
  j main._32.array.exit.2                                               # ir inst 136 fin
main._31.array.body.2:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 137 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 138 fin
  addi s11, t3, 1                                                       # ir inst 139 fin
# Phi connections
  mv t3, s11
  j main._30.array.cond.2                                               # ir inst 140 fin
main._32.array.exit.2:
# Phi connections
  li t4, 0
  j main._33.while.cond.6                                               # ir inst 141 fin
main._33.while.cond.6:
  li t2, 10
  slt t3, t4, t2                                                        # ir inst 143 fin
  bnez t3, main._34.while.body.6
  j main._35.while.exit.6                                               # ir inst 144 fin
main._34.while.body.6:
  mv t3, t4                                                             # ir inst 145 fin
  slli t2, t3, 2
  li t1, 72512
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 146 fin
  li t2, 10
  mul t3, t5, t2                                                        # ir inst 147 fin
  add s10, t3, t4                                                       # ir inst 148 fin
  sw s10, 0(s11)                                                        # ir inst 149 fin
  addi t3, t4, 1                                                        # ir inst 150 fin
# Phi connections
  mv t4, t3
  j main._33.while.cond.6                                               # ir inst 151 fin
main._35.while.exit.6:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a2, 400
  li t1, 72512
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 1104
  mv a0, t1
  call memcpy
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 152 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a3, 10
  addi t1, sp, 1104
  mv a2, t1
  mv a1, t6
  addi t1, sp, 1504
  mv a0, t1
  call .F.write_file
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 153 fin
  addi t4, t5, 1                                                        # ir inst 154 fin
# Phi connections
  mv t5, t4
  j main._28.while.cond.5                                               # ir inst 155 fin
main._36.while.exit.5:
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  addi t1, sp, 1504
  mv a0, t1
  call .F.read_file
  mv t5, a0
  ld t6, 0(sp)
# ir inst 156 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 157 fin
# Phi connections
  li t6, 0
  j main._37.while.cond.7                                               # ir inst 158 fin
main._37.while.cond.7:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 160 fin
  bnez t5, main._38.while.body.7
  j main._39.while.exit.7                                               # ir inst 161 fin
main._38.while.body.7:
  addi t5, t6, 1                                                        # ir inst 162 fin
# Phi connections
  mv t6, t5
  j main._37.while.cond.7                                               # ir inst 163 fin
main._39.while.exit.7:
# Start call preparation
  li a0, 1
  call printlnInt
# ir inst 164 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 165 fin
  j main.epilogue                                                       # ir inst 166 fin
main.epilogue:
  ld ra, 40(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  li t0, 72912
  add sp, sp, t0
  ret
