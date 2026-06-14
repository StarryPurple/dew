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

.globl .F._250uMAnM4NY_new
.F._250uMAnM4NY_new:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._250uMAnM4NY_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  sw a1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  sw a2, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 16                                                       # ir inst 9 fin
  li t1, 1
  sb t1, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 20                                                       # ir inst 11 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 24                                                       # ir inst 13 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t6, a0, 28                                                       # ir inst 15 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t6, a0, 32                                                       # ir inst 17 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t6, a0, 36                                                       # ir inst 19 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 40                                                       # ir inst 21 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 44                                                       # ir inst 23 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 24 fin
  j .F._250uMAnM4NY_new.epilogue                                        # ir inst 25 fin
.F._250uMAnM4NY_new.epilogue:
  ret

.globl .F._7GLwwskssmg_new
.F._7GLwwskssmg_new:
# spill func args num: 0,             range:   104128(sp) -   104128(sp)
# local var size: 104080,             range:       40(sp) -   104120(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -104128
  add sp, sp, t0
  sd ra, 32(sp)
.F._7GLwwskssmg_new._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a2, 0
  li a1, 0
  li t1, 104072
  add t1, sp, t1
  mv a0, t1
  call .F._250uMAnM4NY_new
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 4 fin
  addi t5, t6, 0                                                        # ir inst 5 fin
# Phi connections
  li t6, 0
  j .F._7GLwwskssmg_new._1.array.cond.0                                 # ir inst 6 fin
.F._7GLwwskssmg_new._1.array.cond.0:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 8 fin
  bnez t4, .F._7GLwwskssmg_new._2.array.body.0
  j .F._7GLwwskssmg_new._3.array.exit.0                                 # ir inst 9 fin
.F._7GLwwskssmg_new._2.array.body.0:
  li t1, 48
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 48
  li t1, 104072
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t4
  j .F._7GLwwskssmg_new._1.array.cond.0                                 # ir inst 13 fin
.F._7GLwwskssmg_new._3.array.exit.0:
  addi t1, sp, 40
  li t6, 96000
  add t6, t1, t6                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 40
  li t6, 96004
  add t6, t1, t6                                                        # ir inst 16 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 40
  li t6, 96008
  add t6, t1, t6                                                        # ir inst 18 fin
  addi t5, t6, 0                                                        # ir inst 19 fin
# Phi connections
  li t6, 0
  j .F._7GLwwskssmg_new._4.array.cond.1                                 # ir inst 20 fin
.F._7GLwwskssmg_new._4.array.cond.1:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 22 fin
  bnez t4, .F._7GLwwskssmg_new._5.array.body.1
  j .F._7GLwwskssmg_new._6.array.exit.1                                 # ir inst 23 fin
.F._7GLwwskssmg_new._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 25 fin
  addi t4, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t4
  j .F._7GLwwskssmg_new._4.array.cond.1                                 # ir inst 27 fin
.F._7GLwwskssmg_new._6.array.exit.1:
  addi t1, sp, 40
  li t6, 104008
  add t6, t1, t6                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t1, sp, 40
  li t6, 104012
  add t6, t1, t6                                                        # ir inst 30 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 40
  li t6, 104016
  add t6, t1, t6                                                        # ir inst 32 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 33 fin
  addi t1, sp, 40
  li t6, 104020
  add t6, t1, t6                                                        # ir inst 34 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 35 fin
  addi t1, sp, 40
  li t6, 104024
  add t6, t1, t6                                                        # ir inst 36 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 37 fin
  addi t1, sp, 40
  li t6, 104028
  add t6, t1, t6                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 39 fin
# Phi connections
  li t6, 0
  j .F._7GLwwskssmg_new._7.while.cond.0                                 # ir inst 40 fin
.F._7GLwwskssmg_new._7.while.cond.0:
  li t2, 2000
  slt t5, t6, t2                                                        # ir inst 42 fin
  bnez t5, .F._7GLwwskssmg_new._8.while.body.0
  j .F._7GLwwskssmg_new._9.while.exit.0                                 # ir inst 43 fin
.F._7GLwwskssmg_new._8.while.body.0:
  addi t1, sp, 40
  li t5, 96008
  add t5, t1, t5                                                        # ir inst 44 fin
  mv t4, t6                                                             # ir inst 45 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 46 fin
  sw t6, 0(t3)                                                          # ir inst 47 fin
  addi t5, t6, 1                                                        # ir inst 48 fin
# Phi connections
  mv t6, t5
  j .F._7GLwwskssmg_new._7.while.cond.0                                 # ir inst 49 fin
.F._7GLwwskssmg_new._9.while.exit.0:
  addi t1, sp, 40
  li t6, 104008
  add t6, t1, t6                                                        # ir inst 50 fin
  li t1, 2000
  sw t1, 0(t6)                                                          # ir inst 51 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 104032
  addi t1, sp, 40
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 52 fin
  j .F._7GLwwskssmg_new.epilogue                                        # ir inst 53 fin
.F._7GLwwskssmg_new.epilogue:
  ld ra, 32(sp)
  li t0, 104128
  add sp, sp, t0
  ret

.globl .F._7GLwwskssmg_allocate_node
.F._7GLwwskssmg_allocate_node:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 48,                 range:       48(sp) -       96(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd ra, 40(sp)
.F._7GLwwskssmg_allocate_node._0.entry.0:
  li t6, 104008
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F._7GLwwskssmg_allocate_node._1.if.then.0
  j .F._7GLwwskssmg_allocate_node._2.if.else.0                          # ir inst 4 fin
.F._7GLwwskssmg_allocate_node._1.if.then.0:
  li a0, -1
  j .F._7GLwwskssmg_allocate_node.epilogue                              # ir inst 5 fin
.F._7GLwwskssmg_allocate_node._2.if.else.0:
  j .F._7GLwwskssmg_allocate_node._3.if.exit.0                          # ir inst 6 fin
.F._7GLwwskssmg_allocate_node._3.if.exit.0:
  li t6, 104008
  add t6, a0, t6                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
  addi t4, t5, -1                                                       # ir inst 9 fin
  sw t4, 0(t6)                                                          # ir inst 10 fin
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 11 fin
  li t5, 104008
  add t5, a0, t5                                                        # ir inst 12 fin
  lw t4, 0(t5)                                                          # ir inst 13 fin
  mv t5, t4                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 15 fin
  lw t6, 0(t4)                                                          # ir inst 16 fin
  addi t5, a0, 0                                                        # ir inst 17 fin
  mv t4, t6                                                             # ir inst 18 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t6, 32(sp)
  addi t1, sp, 48
  mv a0, t1
  call .F._250uMAnM4NY_new
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t6, 32(sp)
# ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t6, 16(sp)
  li a2, 48
  addi t1, sp, 48
  mv a1, t1
  mv a0, t3
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t6, 16(sp)
# ir inst 22 fin
  li t5, 96000
  add t5, a0, t5                                                        # ir inst 23 fin
  lw t4, 0(t5)                                                          # ir inst 24 fin
  addi t3, t4, 1                                                        # ir inst 25 fin
  sw t3, 0(t5)                                                          # ir inst 26 fin
  mv a0, t6
  j .F._7GLwwskssmg_allocate_node.epilogue                              # ir inst 27 fin
.F._7GLwwskssmg_allocate_node.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 96
  ret

.globl .F._7GLwwskssmg_deallocate_node
.F._7GLwwskssmg_deallocate_node:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._7GLwwskssmg_deallocate_node._0.entry.0:
  li t6, 104008
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 2000
  slt t6, t5, t2                                                        # ir inst 3 fin
  bnez t6, .F._7GLwwskssmg_deallocate_node._1.if.then.0
  j .F._7GLwwskssmg_deallocate_node._2.if.else.0                        # ir inst 4 fin
.F._7GLwwskssmg_deallocate_node._1.if.then.0:
  li t6, 96008
  add t6, a0, t6                                                        # ir inst 5 fin
  li t5, 104008
  add t5, a0, t5                                                        # ir inst 6 fin
  lw t4, 0(t5)                                                          # ir inst 7 fin
  mv t5, t4                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 9 fin
  sw a1, 0(t4)                                                          # ir inst 10 fin
  li t6, 104008
  add t6, a0, t6                                                        # ir inst 11 fin
  lw t5, 0(t6)                                                          # ir inst 12 fin
  addi t4, t5, 1                                                        # ir inst 13 fin
  sw t4, 0(t6)                                                          # ir inst 14 fin
  li t6, 96000
  add t6, a0, t6                                                        # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
  addi t4, t5, -1                                                       # ir inst 17 fin
  sw t4, 0(t6)                                                          # ir inst 18 fin
  j .F._7GLwwskssmg_deallocate_node._3.if.exit.0                        # ir inst 19 fin
.F._7GLwwskssmg_deallocate_node._2.if.else.0:
  j .F._7GLwwskssmg_deallocate_node._3.if.exit.0                        # ir inst 20 fin
.F._7GLwwskssmg_deallocate_node._3.if.exit.0:
  j .F._7GLwwskssmg_deallocate_node.epilogue                            # ir inst 21 fin
.F._7GLwwskssmg_deallocate_node.epilogue:
  ret

.globl .F._7GLwwskssmg_get_height
.F._7GLwwskssmg_get_height:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._7GLwwskssmg_get_height._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_get_height._1.if.then.0
  j .F._7GLwwskssmg_get_height._2.if.else.0                             # ir inst 2 fin
.F._7GLwwskssmg_get_height._1.if.then.0:
  li a0, 0
  j .F._7GLwwskssmg_get_height.epilogue                                 # ir inst 3 fin
.F._7GLwwskssmg_get_height._2.if.else.0:
  j .F._7GLwwskssmg_get_height._3.if.exit.0                             # ir inst 4 fin
.F._7GLwwskssmg_get_height._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 8                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  mv a0, t5
  j .F._7GLwwskssmg_get_height.epilogue                                 # ir inst 10 fin
.F._7GLwwskssmg_get_height.epilogue:
  ret

.globl .F._7GLwwskssmg_get_balance
.F._7GLwwskssmg_get_balance:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 32(sp)
.F._7GLwwskssmg_get_balance._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_get_balance._1.if.then.0
  j .F._7GLwwskssmg_get_balance._2.if.else.0                            # ir inst 2 fin
.F._7GLwwskssmg_get_balance._1.if.then.0:
  li a0, 0
  j .F._7GLwwskssmg_get_balance.epilogue                                # ir inst 3 fin
.F._7GLwwskssmg_get_balance._2.if.else.0:
  j .F._7GLwwskssmg_get_balance._3.if.exit.0                            # ir inst 4 fin
.F._7GLwwskssmg_get_balance._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 36                                                       # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_get_height
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 10 fin
  addi t5, a0, 0                                                        # ir inst 11 fin
  mv t4, a1                                                             # ir inst 12 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 40                                                       # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  call .F._7GLwwskssmg_get_height
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 16 fin
  sub t4, t6, t5                                                        # ir inst 17 fin
  mv a0, t4
  j .F._7GLwwskssmg_get_balance.epilogue                                # ir inst 18 fin
.F._7GLwwskssmg_get_balance.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._7GLwwskssmg_update_height
.F._7GLwwskssmg_update_height:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F._7GLwwskssmg_update_height._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltu t6, zero, t0                                                     # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_update_height._1.if.then.0
  j .F._7GLwwskssmg_update_height._5.if.else.0                          # ir inst 2 fin
.F._7GLwwskssmg_update_height._1.if.then.0:
  addi t6, a0, 0                                                        # ir inst 3 fin
  mv t5, a1                                                             # ir inst 4 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 5 fin
  addi t6, t4, 36                                                       # ir inst 6 fin
  lw t5, 0(t6)                                                          # ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_get_height
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 8 fin
  addi t5, a0, 0                                                        # ir inst 9 fin
  mv t4, a1                                                             # ir inst 10 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 11 fin
  addi t5, t3, 40                                                       # ir inst 12 fin
  lw t4, 0(t5)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F._7GLwwskssmg_get_height
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 14 fin
  addi t4, a0, 0                                                        # ir inst 15 fin
  mv t3, a1                                                             # ir inst 16 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 17 fin
  addi t4, s11, 8                                                       # ir inst 18 fin
  slt t3, t5, t6                                                        # ir inst 19 fin
  bnez t3, .F._7GLwwskssmg_update_height._2.if.then.1
  j .F._7GLwwskssmg_update_height._3.if.else.1                          # ir inst 20 fin
.F._7GLwwskssmg_update_height._2.if.then.1:
# Phi connections
  j .F._7GLwwskssmg_update_height._4.if.exit.1                          # ir inst 21 fin
.F._7GLwwskssmg_update_height._3.if.else.1:
# Phi connections
  mv t6, t5
  j .F._7GLwwskssmg_update_height._4.if.exit.1                          # ir inst 22 fin
.F._7GLwwskssmg_update_height._4.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 24 fin
  sw t5, 0(t4)                                                          # ir inst 25 fin
  addi t6, a0, 0                                                        # ir inst 26 fin
  mv t5, a1                                                             # ir inst 27 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 28 fin
  addi t6, t4, 12                                                       # ir inst 29 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  call .F._7GLwwskssmg_get_balance
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 30 fin
  sw t5, 0(t6)                                                          # ir inst 31 fin
  j .F._7GLwwskssmg_update_height._6.if.exit.0                          # ir inst 32 fin
.F._7GLwwskssmg_update_height._5.if.else.0:
  j .F._7GLwwskssmg_update_height._6.if.exit.0                          # ir inst 33 fin
.F._7GLwwskssmg_update_height._6.if.exit.0:
  j .F._7GLwwskssmg_update_height.epilogue                              # ir inst 34 fin
.F._7GLwwskssmg_update_height.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._7GLwwskssmg_right_rotate
.F._7GLwwskssmg_right_rotate:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F._7GLwwskssmg_right_rotate._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 3 fin
  addi t6, t4, 36                                                       # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
  addi t6, a0, 0                                                        # ir inst 6 fin
  mv t4, t5                                                             # ir inst 7 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 8 fin
  addi t6, t3, 40                                                       # ir inst 9 fin
  lw t4, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 0                                                        # ir inst 11 fin
  mv t3, t5                                                             # ir inst 12 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 13 fin
  addi t6, s11, 40                                                      # ir inst 14 fin
  sw a1, 0(t6)                                                          # ir inst 15 fin
  addi t6, a0, 0                                                        # ir inst 16 fin
  mv t3, a1                                                             # ir inst 17 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 18 fin
  addi t6, s11, 36                                                      # ir inst 19 fin
  sw t4, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 0                                                        # ir inst 21 fin
  mv t3, a1                                                             # ir inst 22 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 23 fin
  addi t6, s11, 44                                                      # ir inst 24 fin
  sw t5, 0(t6)                                                          # ir inst 25 fin
  li t2, -1
  xor t0, t4, t2
  sltu t6, zero, t0                                                     # ir inst 26 fin
  bnez t6, .F._7GLwwskssmg_right_rotate._1.if.then.0
  j .F._7GLwwskssmg_right_rotate._2.if.else.0                           # ir inst 27 fin
.F._7GLwwskssmg_right_rotate._1.if.then.0:
  addi t6, a0, 0                                                        # ir inst 28 fin
  mv t3, t4                                                             # ir inst 29 fin
  li t1, 48
  mul t2, t3, t1
  add t4, t6, t2                                                        # ir inst 30 fin
  addi t6, t4, 44                                                       # ir inst 31 fin
  sw a1, 0(t6)                                                          # ir inst 32 fin
  j .F._7GLwwskssmg_right_rotate._3.if.exit.0                           # ir inst 33 fin
.F._7GLwwskssmg_right_rotate._2.if.else.0:
  j .F._7GLwwskssmg_right_rotate._3.if.exit.0                           # ir inst 34 fin
.F._7GLwwskssmg_right_rotate._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  call .F._7GLwwskssmg_update_height
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 35 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F._7GLwwskssmg_update_height
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 36 fin
  li t6, 104024
  add t6, a0, t6                                                        # ir inst 37 fin
  lw t4, 0(t6)                                                          # ir inst 38 fin
  addi t3, t4, 1                                                        # ir inst 39 fin
  sw t3, 0(t6)                                                          # ir inst 40 fin
  mv a0, t5
  j .F._7GLwwskssmg_right_rotate.epilogue                               # ir inst 41 fin
.F._7GLwwskssmg_right_rotate.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl .F._7GLwwskssmg_left_rotate
.F._7GLwwskssmg_left_rotate:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F._7GLwwskssmg_left_rotate._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 3 fin
  addi t6, t4, 40                                                       # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
  addi t6, a0, 0                                                        # ir inst 6 fin
  mv t4, t5                                                             # ir inst 7 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 8 fin
  addi t6, t3, 36                                                       # ir inst 9 fin
  lw t4, 0(t6)                                                          # ir inst 10 fin
  addi t6, a0, 0                                                        # ir inst 11 fin
  mv t3, t5                                                             # ir inst 12 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 13 fin
  addi t6, s11, 36                                                      # ir inst 14 fin
  sw a1, 0(t6)                                                          # ir inst 15 fin
  addi t6, a0, 0                                                        # ir inst 16 fin
  mv t3, a1                                                             # ir inst 17 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 18 fin
  addi t6, s11, 40                                                      # ir inst 19 fin
  sw t4, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 0                                                        # ir inst 21 fin
  mv t3, a1                                                             # ir inst 22 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t6, t2                                                       # ir inst 23 fin
  addi t6, s11, 44                                                      # ir inst 24 fin
  sw t5, 0(t6)                                                          # ir inst 25 fin
  li t2, -1
  xor t0, t4, t2
  sltu t6, zero, t0                                                     # ir inst 26 fin
  bnez t6, .F._7GLwwskssmg_left_rotate._1.if.then.0
  j .F._7GLwwskssmg_left_rotate._2.if.else.0                            # ir inst 27 fin
.F._7GLwwskssmg_left_rotate._1.if.then.0:
  addi t6, a0, 0                                                        # ir inst 28 fin
  mv t3, t4                                                             # ir inst 29 fin
  li t1, 48
  mul t2, t3, t1
  add t4, t6, t2                                                        # ir inst 30 fin
  addi t6, t4, 44                                                       # ir inst 31 fin
  sw a1, 0(t6)                                                          # ir inst 32 fin
  j .F._7GLwwskssmg_left_rotate._3.if.exit.0                            # ir inst 33 fin
.F._7GLwwskssmg_left_rotate._2.if.else.0:
  j .F._7GLwwskssmg_left_rotate._3.if.exit.0                            # ir inst 34 fin
.F._7GLwwskssmg_left_rotate._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  call .F._7GLwwskssmg_update_height
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 35 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  mv a1, t5
  call .F._7GLwwskssmg_update_height
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 36 fin
  li t6, 104024
  add t6, a0, t6                                                        # ir inst 37 fin
  lw t4, 0(t6)                                                          # ir inst 38 fin
  addi t3, t4, 1                                                        # ir inst 39 fin
  sw t3, 0(t6)                                                          # ir inst 40 fin
  mv a0, t5
  j .F._7GLwwskssmg_left_rotate.epilogue                                # ir inst 41 fin
.F._7GLwwskssmg_left_rotate.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl .F._7GLwwskssmg_insert
.F._7GLwwskssmg_insert:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 48(sp)
  sd ra, 56(sp)
.F._7GLwwskssmg_insert._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_insert._1.if.then.0
  j .F._7GLwwskssmg_insert._2.if.else.0                                 # ir inst 2 fin
.F._7GLwwskssmg_insert._1.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a1, a3
  call .F._7GLwwskssmg_allocate_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 3 fin
  li t5, 104016
  add t5, a0, t5                                                        # ir inst 4 fin
  lw t4, 0(t5)                                                          # ir inst 5 fin
  addi t3, t4, 1                                                        # ir inst 6 fin
  sw t3, 0(t5)                                                          # ir inst 7 fin
  mv a0, t6
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 8 fin
.F._7GLwwskssmg_insert._2.if.else.0:
  j .F._7GLwwskssmg_insert._3.if.exit.0                                 # ir inst 9 fin
.F._7GLwwskssmg_insert._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 10 fin
  mv t5, a1                                                             # ir inst 11 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 12 fin
  addi t6, t4, 4                                                        # ir inst 13 fin
  lw t5, 0(t6)                                                          # ir inst 14 fin
  slt t6, a2, t5                                                        # ir inst 15 fin
  bnez t6, .F._7GLwwskssmg_insert._4.if.then.1
  j .F._7GLwwskssmg_insert._8.if.else.1                                 # ir inst 16 fin
.F._7GLwwskssmg_insert._4.if.then.1:
  addi t6, a0, 0                                                        # ir inst 17 fin
  mv t5, a1                                                             # ir inst 18 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 19 fin
  addi t6, t4, 36                                                       # ir inst 20 fin
  lw t5, 0(t6)                                                          # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, t5
  call .F._7GLwwskssmg_insert
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 22 fin
  addi t5, a0, 0                                                        # ir inst 23 fin
  mv t4, a1                                                             # ir inst 24 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 25 fin
  addi t5, t3, 36                                                       # ir inst 26 fin
  sw t6, 0(t5)                                                          # ir inst 27 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 28 fin
  bnez t5, .F._7GLwwskssmg_insert._5.if.then.2
  j .F._7GLwwskssmg_insert._6.if.else.2                                 # ir inst 29 fin
.F._7GLwwskssmg_insert._5.if.then.2:
  addi t5, a0, 0                                                        # ir inst 30 fin
  mv t4, t6                                                             # ir inst 31 fin
  li t1, 48
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 32 fin
  addi t5, t6, 44                                                       # ir inst 33 fin
  sw a1, 0(t5)                                                          # ir inst 34 fin
  j .F._7GLwwskssmg_insert._7.if.exit.2                                 # ir inst 35 fin
.F._7GLwwskssmg_insert._6.if.else.2:
  j .F._7GLwwskssmg_insert._7.if.exit.2                                 # ir inst 36 fin
.F._7GLwwskssmg_insert._7.if.exit.2:
  j .F._7GLwwskssmg_insert._15.if.exit.1                                # ir inst 37 fin
.F._7GLwwskssmg_insert._8.if.else.1:
  addi t6, a0, 0                                                        # ir inst 38 fin
  mv t5, a1                                                             # ir inst 39 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 40 fin
  addi t6, t4, 4                                                        # ir inst 41 fin
  lw t5, 0(t6)                                                          # ir inst 42 fin
  slt t6, t5, a2                                                        # ir inst 43 fin
  bnez t6, .F._7GLwwskssmg_insert._9.if.then.3
  j .F._7GLwwskssmg_insert._13.if.else.3                                # ir inst 44 fin
.F._7GLwwskssmg_insert._9.if.then.3:
  addi t6, a0, 0                                                        # ir inst 45 fin
  mv t5, a1                                                             # ir inst 46 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 47 fin
  addi t6, t4, 40                                                       # ir inst 48 fin
  lw t5, 0(t6)                                                          # ir inst 49 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, t5
  call .F._7GLwwskssmg_insert
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 50 fin
  addi t5, a0, 0                                                        # ir inst 51 fin
  mv t4, a1                                                             # ir inst 52 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 53 fin
  addi t5, t3, 40                                                       # ir inst 54 fin
  sw t6, 0(t5)                                                          # ir inst 55 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 56 fin
  bnez t5, .F._7GLwwskssmg_insert._10.if.then.4
  j .F._7GLwwskssmg_insert._11.if.else.4                                # ir inst 57 fin
.F._7GLwwskssmg_insert._10.if.then.4:
  addi t5, a0, 0                                                        # ir inst 58 fin
  mv t4, t6                                                             # ir inst 59 fin
  li t1, 48
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 60 fin
  addi t5, t6, 44                                                       # ir inst 61 fin
  sw a1, 0(t5)                                                          # ir inst 62 fin
  j .F._7GLwwskssmg_insert._12.if.exit.4                                # ir inst 63 fin
.F._7GLwwskssmg_insert._11.if.else.4:
  j .F._7GLwwskssmg_insert._12.if.exit.4                                # ir inst 64 fin
.F._7GLwwskssmg_insert._12.if.exit.4:
  j .F._7GLwwskssmg_insert._14.if.exit.3                                # ir inst 65 fin
.F._7GLwwskssmg_insert._13.if.else.3:
  addi t6, a0, 0                                                        # ir inst 66 fin
  mv t5, a1                                                             # ir inst 67 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 68 fin
  addi t6, t4, 0                                                        # ir inst 69 fin
  sw a3, 0(t6)                                                          # ir inst 70 fin
  addi t6, a0, 0                                                        # ir inst 71 fin
  mv t5, a1                                                             # ir inst 72 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 73 fin
  addi t6, t4, 20                                                       # ir inst 74 fin
  lw t5, 0(t6)                                                          # ir inst 75 fin
  addi t4, t5, 1                                                        # ir inst 76 fin
  sw t4, 0(t6)                                                          # ir inst 77 fin
  mv a0, a1
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 78 fin
.F._7GLwwskssmg_insert._14.if.exit.3:
  j .F._7GLwwskssmg_insert._15.if.exit.1                                # ir inst 79 fin
.F._7GLwwskssmg_insert._15.if.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._7GLwwskssmg_update_height
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 80 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._7GLwwskssmg_get_balance
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 81 fin
  li t2, 1
  slt t5, t2, t6                                                        # ir inst 82 fin
  bnez t5, .F._7GLwwskssmg_insert._16.lazy.then.0
  j .F._7GLwwskssmg_insert._17.lazy.else.0                              # ir inst 83 fin
.F._7GLwwskssmg_insert._16.lazy.then.0:
  addi t5, a0, 0                                                        # ir inst 84 fin
  addi t4, a0, 0                                                        # ir inst 85 fin
  mv t3, a1                                                             # ir inst 86 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 87 fin
  addi t4, s11, 36                                                      # ir inst 88 fin
  lw t3, 0(t4)                                                          # ir inst 89 fin
  mv t4, t3                                                             # ir inst 90 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 91 fin
  addi t5, t3, 4                                                        # ir inst 92 fin
  lw t4, 0(t5)                                                          # ir inst 93 fin
  slt t5, a2, t4                                                        # ir inst 94 fin
# Phi connections
  j .F._7GLwwskssmg_insert._18.lazy.exit.0                              # ir inst 95 fin
.F._7GLwwskssmg_insert._17.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._7GLwwskssmg_insert._18.lazy.exit.0                              # ir inst 96 fin
.F._7GLwwskssmg_insert._18.lazy.exit.0:
  bnez t5, .F._7GLwwskssmg_insert._19.if.then.5
  j .F._7GLwwskssmg_insert._20.if.else.5                                # ir inst 98 fin
.F._7GLwwskssmg_insert._19.if.then.5:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  call .F._7GLwwskssmg_right_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 99 fin
  mv a0, t5
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 100 fin
.F._7GLwwskssmg_insert._20.if.else.5:
  j .F._7GLwwskssmg_insert._21.if.exit.5                                # ir inst 101 fin
.F._7GLwwskssmg_insert._21.if.exit.5:
  li t2, -1
  slt t5, t6, t2                                                        # ir inst 102 fin
  bnez t5, .F._7GLwwskssmg_insert._22.lazy.then.1
  j .F._7GLwwskssmg_insert._23.lazy.else.1                              # ir inst 103 fin
.F._7GLwwskssmg_insert._22.lazy.then.1:
  addi t5, a0, 0                                                        # ir inst 104 fin
  addi t4, a0, 0                                                        # ir inst 105 fin
  mv t3, a1                                                             # ir inst 106 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 107 fin
  addi t4, s11, 40                                                      # ir inst 108 fin
  lw t3, 0(t4)                                                          # ir inst 109 fin
  mv t4, t3                                                             # ir inst 110 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 111 fin
  addi t5, t3, 4                                                        # ir inst 112 fin
  lw t4, 0(t5)                                                          # ir inst 113 fin
  slt t5, t4, a2                                                        # ir inst 114 fin
# Phi connections
  j .F._7GLwwskssmg_insert._24.lazy.exit.1                              # ir inst 115 fin
.F._7GLwwskssmg_insert._23.lazy.else.1:
# Phi connections
  li t5, 0
  j .F._7GLwwskssmg_insert._24.lazy.exit.1                              # ir inst 116 fin
.F._7GLwwskssmg_insert._24.lazy.exit.1:
  bnez t5, .F._7GLwwskssmg_insert._25.if.then.6
  j .F._7GLwwskssmg_insert._26.if.else.6                                # ir inst 118 fin
.F._7GLwwskssmg_insert._25.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  call .F._7GLwwskssmg_left_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 119 fin
  mv a0, t5
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 120 fin
.F._7GLwwskssmg_insert._26.if.else.6:
  j .F._7GLwwskssmg_insert._27.if.exit.6                                # ir inst 121 fin
.F._7GLwwskssmg_insert._27.if.exit.6:
  li t2, 1
  slt t5, t2, t6                                                        # ir inst 122 fin
  bnez t5, .F._7GLwwskssmg_insert._28.lazy.then.2
  j .F._7GLwwskssmg_insert._29.lazy.else.2                              # ir inst 123 fin
.F._7GLwwskssmg_insert._28.lazy.then.2:
  addi t5, a0, 0                                                        # ir inst 124 fin
  addi t4, a0, 0                                                        # ir inst 125 fin
  mv t3, a1                                                             # ir inst 126 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 127 fin
  addi t4, s11, 36                                                      # ir inst 128 fin
  lw t3, 0(t4)                                                          # ir inst 129 fin
  mv t4, t3                                                             # ir inst 130 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 131 fin
  addi t5, t3, 4                                                        # ir inst 132 fin
  lw t4, 0(t5)                                                          # ir inst 133 fin
  slt t5, t4, a2                                                        # ir inst 134 fin
# Phi connections
  j .F._7GLwwskssmg_insert._30.lazy.exit.2                              # ir inst 135 fin
.F._7GLwwskssmg_insert._29.lazy.else.2:
# Phi connections
  li t5, 0
  j .F._7GLwwskssmg_insert._30.lazy.exit.2                              # ir inst 136 fin
.F._7GLwwskssmg_insert._30.lazy.exit.2:
  bnez t5, .F._7GLwwskssmg_insert._31.if.then.7
  j .F._7GLwwskssmg_insert._35.if.else.7                                # ir inst 138 fin
.F._7GLwwskssmg_insert._31.if.then.7:
  addi t5, a0, 0                                                        # ir inst 139 fin
  mv t4, a1                                                             # ir inst 140 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 141 fin
  addi t5, t3, 36                                                       # ir inst 142 fin
  lw t4, 0(t5)                                                          # ir inst 143 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  mv a1, t4
  call .F._7GLwwskssmg_left_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 144 fin
  addi t4, a0, 0                                                        # ir inst 145 fin
  mv t3, a1                                                             # ir inst 146 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 147 fin
  addi t4, s11, 36                                                      # ir inst 148 fin
  sw t5, 0(t4)                                                          # ir inst 149 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 150 fin
  bnez t4, .F._7GLwwskssmg_insert._32.if.then.8
  j .F._7GLwwskssmg_insert._33.if.else.8                                # ir inst 151 fin
.F._7GLwwskssmg_insert._32.if.then.8:
  addi t4, a0, 0                                                        # ir inst 152 fin
  mv t3, t5                                                             # ir inst 153 fin
  li t1, 48
  mul t2, t3, t1
  add t5, t4, t2                                                        # ir inst 154 fin
  addi t4, t5, 44                                                       # ir inst 155 fin
  sw a1, 0(t4)                                                          # ir inst 156 fin
  j .F._7GLwwskssmg_insert._34.if.exit.8                                # ir inst 157 fin
.F._7GLwwskssmg_insert._33.if.else.8:
  j .F._7GLwwskssmg_insert._34.if.exit.8                                # ir inst 158 fin
.F._7GLwwskssmg_insert._34.if.exit.8:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  call .F._7GLwwskssmg_right_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 159 fin
  mv a0, t5
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 160 fin
.F._7GLwwskssmg_insert._35.if.else.7:
  j .F._7GLwwskssmg_insert._36.if.exit.7                                # ir inst 161 fin
.F._7GLwwskssmg_insert._36.if.exit.7:
  li t2, -1
  slt t5, t6, t2                                                        # ir inst 162 fin
  bnez t5, .F._7GLwwskssmg_insert._37.lazy.then.3
  j .F._7GLwwskssmg_insert._38.lazy.else.3                              # ir inst 163 fin
.F._7GLwwskssmg_insert._37.lazy.then.3:
  addi t6, a0, 0                                                        # ir inst 164 fin
  addi t5, a0, 0                                                        # ir inst 165 fin
  mv t4, a1                                                             # ir inst 166 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 167 fin
  addi t5, t3, 40                                                       # ir inst 168 fin
  lw t4, 0(t5)                                                          # ir inst 169 fin
  mv t5, t4                                                             # ir inst 170 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 171 fin
  addi t6, t4, 4                                                        # ir inst 172 fin
  lw t5, 0(t6)                                                          # ir inst 173 fin
  slt t6, a2, t5                                                        # ir inst 174 fin
# Phi connections
  j .F._7GLwwskssmg_insert._39.lazy.exit.3                              # ir inst 175 fin
.F._7GLwwskssmg_insert._38.lazy.else.3:
# Phi connections
  li t6, 0
  j .F._7GLwwskssmg_insert._39.lazy.exit.3                              # ir inst 176 fin
.F._7GLwwskssmg_insert._39.lazy.exit.3:
  bnez t6, .F._7GLwwskssmg_insert._40.if.then.9
  j .F._7GLwwskssmg_insert._44.if.else.9                                # ir inst 178 fin
.F._7GLwwskssmg_insert._40.if.then.9:
  addi t6, a0, 0                                                        # ir inst 179 fin
  mv t5, a1                                                             # ir inst 180 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 181 fin
  addi t6, t4, 40                                                       # ir inst 182 fin
  lw t5, 0(t6)                                                          # ir inst 183 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_right_rotate
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 184 fin
  addi t5, a0, 0                                                        # ir inst 185 fin
  mv t4, a1                                                             # ir inst 186 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 187 fin
  addi t5, t3, 40                                                       # ir inst 188 fin
  sw t6, 0(t5)                                                          # ir inst 189 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 190 fin
  bnez t5, .F._7GLwwskssmg_insert._41.if.then.10
  j .F._7GLwwskssmg_insert._42.if.else.10                               # ir inst 191 fin
.F._7GLwwskssmg_insert._41.if.then.10:
  addi t5, a0, 0                                                        # ir inst 192 fin
  mv t4, t6                                                             # ir inst 193 fin
  li t1, 48
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 194 fin
  addi t5, t6, 44                                                       # ir inst 195 fin
  sw a1, 0(t5)                                                          # ir inst 196 fin
  j .F._7GLwwskssmg_insert._43.if.exit.10                               # ir inst 197 fin
.F._7GLwwskssmg_insert._42.if.else.10:
  j .F._7GLwwskssmg_insert._43.if.exit.10                               # ir inst 198 fin
.F._7GLwwskssmg_insert._43.if.exit.10:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F._7GLwwskssmg_left_rotate
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 199 fin
  mv a0, t6
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 200 fin
.F._7GLwwskssmg_insert._44.if.else.9:
  j .F._7GLwwskssmg_insert._45.if.exit.9                                # ir inst 201 fin
.F._7GLwwskssmg_insert._45.if.exit.9:
  mv a0, a1
  j .F._7GLwwskssmg_insert.epilogue                                     # ir inst 202 fin
.F._7GLwwskssmg_insert.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F._7GLwwskssmg_search
.F._7GLwwskssmg_search:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._7GLwwskssmg_search._0.entry.0:
  li t6, 104028
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t4, t5, 1                                                        # ir inst 3 fin
  sw t4, 0(t6)                                                          # ir inst 4 fin
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F._7GLwwskssmg_search._1.lazy.then.0
  j .F._7GLwwskssmg_search._2.lazy.else.0                               # ir inst 6 fin
.F._7GLwwskssmg_search._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F._7GLwwskssmg_search._3.lazy.exit.0                               # ir inst 7 fin
.F._7GLwwskssmg_search._2.lazy.else.0:
  addi t6, a0, 0                                                        # ir inst 8 fin
  mv t5, a1                                                             # ir inst 9 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 10 fin
  addi t6, t4, 4                                                        # ir inst 11 fin
  lw t5, 0(t6)                                                          # ir inst 12 fin
  xor t0, t5, a2
  sltiu t6, t0, 1                                                       # ir inst 13 fin
# Phi connections
  j .F._7GLwwskssmg_search._3.lazy.exit.0                               # ir inst 14 fin
.F._7GLwwskssmg_search._3.lazy.exit.0:
  bnez t6, .F._7GLwwskssmg_search._4.if.then.0
  j .F._7GLwwskssmg_search._5.if.else.0                                 # ir inst 16 fin
.F._7GLwwskssmg_search._4.if.then.0:
  mv a0, a1
  j .F._7GLwwskssmg_search.epilogue                                     # ir inst 17 fin
.F._7GLwwskssmg_search._5.if.else.0:
  j .F._7GLwwskssmg_search._6.if.exit.0                                 # ir inst 18 fin
.F._7GLwwskssmg_search._6.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 19 fin
  mv t5, a1                                                             # ir inst 20 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 21 fin
  addi t6, t4, 4                                                        # ir inst 22 fin
  lw t5, 0(t6)                                                          # ir inst 23 fin
  slt t6, a2, t5                                                        # ir inst 24 fin
  bnez t6, .F._7GLwwskssmg_search._7.if.then.1
  j .F._7GLwwskssmg_search._8.if.else.1                                 # ir inst 25 fin
.F._7GLwwskssmg_search._7.if.then.1:
  addi t6, a0, 0                                                        # ir inst 26 fin
  mv t5, a1                                                             # ir inst 27 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 28 fin
  addi t6, t4, 36                                                       # ir inst 29 fin
  lw t5, 0(t6)                                                          # ir inst 30 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F._7GLwwskssmg_search
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 31 fin
  mv a0, t6
  j .F._7GLwwskssmg_search.epilogue                                     # ir inst 32 fin
.F._7GLwwskssmg_search._8.if.else.1:
  addi t6, a0, 0                                                        # ir inst 33 fin
  mv t5, a1                                                             # ir inst 34 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 35 fin
  addi t6, t4, 40                                                       # ir inst 36 fin
  lw t5, 0(t6)                                                          # ir inst 37 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_search
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
# ir inst 38 fin
  mv a0, t6
  j .F._7GLwwskssmg_search.epilogue                                     # ir inst 39 fin
.F._7GLwwskssmg_search._9.if.exit.1:
.F._7GLwwskssmg_search.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._7GLwwskssmg_find_min
.F._7GLwwskssmg_find_min:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._7GLwwskssmg_find_min._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_find_min._1.if.then.0
  j .F._7GLwwskssmg_find_min._2.if.else.0                               # ir inst 2 fin
.F._7GLwwskssmg_find_min._1.if.then.0:
  li a0, -1
  j .F._7GLwwskssmg_find_min.epilogue                                   # ir inst 3 fin
.F._7GLwwskssmg_find_min._2.if.else.0:
  j .F._7GLwwskssmg_find_min._3.if.exit.0                               # ir inst 4 fin
.F._7GLwwskssmg_find_min._3.if.exit.0:
# Phi connections
  mv t6, a1
  j .F._7GLwwskssmg_find_min._4.while.cond.0                            # ir inst 5 fin
.F._7GLwwskssmg_find_min._4.while.cond.0:
  addi t5, a0, 0                                                        # ir inst 7 fin
  mv t4, t6                                                             # ir inst 8 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 9 fin
  addi t5, t3, 36                                                       # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  li t2, -1
  xor t0, t4, t2
  sltu t5, zero, t0                                                     # ir inst 12 fin
  bnez t5, .F._7GLwwskssmg_find_min._5.while.body.0
  j .F._7GLwwskssmg_find_min._6.while.exit.0                            # ir inst 13 fin
.F._7GLwwskssmg_find_min._5.while.body.0:
  addi t5, a0, 0                                                        # ir inst 14 fin
  mv t4, t6                                                             # ir inst 15 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 16 fin
  addi t5, t3, 36                                                       # ir inst 17 fin
  lw t4, 0(t5)                                                          # ir inst 18 fin
# Phi connections
  mv t6, t4
  j .F._7GLwwskssmg_find_min._4.while.cond.0                            # ir inst 19 fin
.F._7GLwwskssmg_find_min._6.while.exit.0:
  mv a0, t6
  j .F._7GLwwskssmg_find_min.epilogue                                   # ir inst 20 fin
.F._7GLwwskssmg_find_min.epilogue:
  ret

.globl .F._7GLwwskssmg_delete_node
.F._7GLwwskssmg_delete_node:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F._7GLwwskssmg_delete_node._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_delete_node._1.if.then.0
  j .F._7GLwwskssmg_delete_node._2.if.else.0                            # ir inst 2 fin
.F._7GLwwskssmg_delete_node._1.if.then.0:
  mv a0, a1
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 3 fin
.F._7GLwwskssmg_delete_node._2.if.else.0:
  j .F._7GLwwskssmg_delete_node._3.if.exit.0                            # ir inst 4 fin
.F._7GLwwskssmg_delete_node._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 4                                                        # ir inst 8 fin
  lw t5, 0(t6)                                                          # ir inst 9 fin
  slt t6, a2, t5                                                        # ir inst 10 fin
  bnez t6, .F._7GLwwskssmg_delete_node._4.if.then.1
  j .F._7GLwwskssmg_delete_node._8.if.else.1                            # ir inst 11 fin
.F._7GLwwskssmg_delete_node._4.if.then.1:
  addi t6, a0, 0                                                        # ir inst 12 fin
  mv t5, a1                                                             # ir inst 13 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 14 fin
  addi t6, t4, 36                                                       # ir inst 15 fin
  lw t5, 0(t6)                                                          # ir inst 16 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F._7GLwwskssmg_delete_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 17 fin
  addi t5, a0, 0                                                        # ir inst 18 fin
  mv t4, a1                                                             # ir inst 19 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 20 fin
  addi t5, t3, 36                                                       # ir inst 21 fin
  sw t6, 0(t5)                                                          # ir inst 22 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 23 fin
  bnez t5, .F._7GLwwskssmg_delete_node._5.if.then.2
  j .F._7GLwwskssmg_delete_node._6.if.else.2                            # ir inst 24 fin
.F._7GLwwskssmg_delete_node._5.if.then.2:
  addi t5, a0, 0                                                        # ir inst 25 fin
  mv t4, t6                                                             # ir inst 26 fin
  li t1, 48
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 27 fin
  addi t5, t6, 44                                                       # ir inst 28 fin
  sw a1, 0(t5)                                                          # ir inst 29 fin
  j .F._7GLwwskssmg_delete_node._7.if.exit.2                            # ir inst 30 fin
.F._7GLwwskssmg_delete_node._6.if.else.2:
  j .F._7GLwwskssmg_delete_node._7.if.exit.2                            # ir inst 31 fin
.F._7GLwwskssmg_delete_node._7.if.exit.2:
  j .F._7GLwwskssmg_delete_node._27.if.exit.1                           # ir inst 32 fin
.F._7GLwwskssmg_delete_node._8.if.else.1:
  addi t6, a0, 0                                                        # ir inst 33 fin
  mv t5, a1                                                             # ir inst 34 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 35 fin
  addi t6, t4, 4                                                        # ir inst 36 fin
  lw t5, 0(t6)                                                          # ir inst 37 fin
  slt t6, t5, a2                                                        # ir inst 38 fin
  bnez t6, .F._7GLwwskssmg_delete_node._9.if.then.3
  j .F._7GLwwskssmg_delete_node._13.if.else.3                           # ir inst 39 fin
.F._7GLwwskssmg_delete_node._9.if.then.3:
  addi t6, a0, 0                                                        # ir inst 40 fin
  mv t5, a1                                                             # ir inst 41 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 42 fin
  addi t6, t4, 40                                                       # ir inst 43 fin
  lw t5, 0(t6)                                                          # ir inst 44 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F._7GLwwskssmg_delete_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
# ir inst 45 fin
  addi t5, a0, 0                                                        # ir inst 46 fin
  mv t4, a1                                                             # ir inst 47 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 48 fin
  addi t5, t3, 40                                                       # ir inst 49 fin
  sw t6, 0(t5)                                                          # ir inst 50 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 51 fin
  bnez t5, .F._7GLwwskssmg_delete_node._10.if.then.4
  j .F._7GLwwskssmg_delete_node._11.if.else.4                           # ir inst 52 fin
.F._7GLwwskssmg_delete_node._10.if.then.4:
  addi t5, a0, 0                                                        # ir inst 53 fin
  mv t4, t6                                                             # ir inst 54 fin
  li t1, 48
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 55 fin
  addi t5, t6, 44                                                       # ir inst 56 fin
  sw a1, 0(t5)                                                          # ir inst 57 fin
  j .F._7GLwwskssmg_delete_node._12.if.exit.4                           # ir inst 58 fin
.F._7GLwwskssmg_delete_node._11.if.else.4:
  j .F._7GLwwskssmg_delete_node._12.if.exit.4                           # ir inst 59 fin
.F._7GLwwskssmg_delete_node._12.if.exit.4:
  j .F._7GLwwskssmg_delete_node._26.if.exit.3                           # ir inst 60 fin
.F._7GLwwskssmg_delete_node._13.if.else.3:
  addi t6, a0, 0                                                        # ir inst 61 fin
  mv t5, a1                                                             # ir inst 62 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 63 fin
  addi t6, t4, 20                                                       # ir inst 64 fin
  lw t5, 0(t6)                                                          # ir inst 65 fin
  li t2, 1
  slt t6, t2, t5                                                        # ir inst 66 fin
  bnez t6, .F._7GLwwskssmg_delete_node._14.if.then.5
  j .F._7GLwwskssmg_delete_node._15.if.else.5                           # ir inst 67 fin
.F._7GLwwskssmg_delete_node._14.if.then.5:
  addi t6, a0, 0                                                        # ir inst 68 fin
  mv t5, a1                                                             # ir inst 69 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 70 fin
  addi t6, t4, 20                                                       # ir inst 71 fin
  lw t5, 0(t6)                                                          # ir inst 72 fin
  addi t4, t5, -1                                                       # ir inst 73 fin
  sw t4, 0(t6)                                                          # ir inst 74 fin
  mv a0, a1
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 75 fin
.F._7GLwwskssmg_delete_node._15.if.else.5:
  j .F._7GLwwskssmg_delete_node._16.if.exit.5                           # ir inst 76 fin
.F._7GLwwskssmg_delete_node._16.if.exit.5:
  addi t6, a0, 0                                                        # ir inst 77 fin
  mv t5, a1                                                             # ir inst 78 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 79 fin
  addi t6, t4, 36                                                       # ir inst 80 fin
  lw t5, 0(t6)                                                          # ir inst 81 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 82 fin
  bnez t6, .F._7GLwwskssmg_delete_node._17.if.then.6
  j .F._7GLwwskssmg_delete_node._18.if.else.6                           # ir inst 83 fin
.F._7GLwwskssmg_delete_node._17.if.then.6:
  addi t6, a0, 0                                                        # ir inst 84 fin
  mv t5, a1                                                             # ir inst 85 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 86 fin
  addi t6, t4, 40                                                       # ir inst 87 fin
  lw t5, 0(t6)                                                          # ir inst 88 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  call .F._7GLwwskssmg_deallocate_node
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 89 fin
  li t6, 104020
  add t6, a0, t6                                                        # ir inst 90 fin
  lw t4, 0(t6)                                                          # ir inst 91 fin
  addi t3, t4, 1                                                        # ir inst 92 fin
  sw t3, 0(t6)                                                          # ir inst 93 fin
  mv a0, t5
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 94 fin
.F._7GLwwskssmg_delete_node._18.if.else.6:
  addi t6, a0, 0                                                        # ir inst 95 fin
  mv t5, a1                                                             # ir inst 96 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 97 fin
  addi t6, t4, 40                                                       # ir inst 98 fin
  lw t5, 0(t6)                                                          # ir inst 99 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 100 fin
  bnez t6, .F._7GLwwskssmg_delete_node._19.if.then.7
  j .F._7GLwwskssmg_delete_node._20.if.else.7                           # ir inst 101 fin
.F._7GLwwskssmg_delete_node._19.if.then.7:
  addi t6, a0, 0                                                        # ir inst 102 fin
  mv t5, a1                                                             # ir inst 103 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 104 fin
  addi t6, t4, 36                                                       # ir inst 105 fin
  lw t5, 0(t6)                                                          # ir inst 106 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  call .F._7GLwwskssmg_deallocate_node
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 107 fin
  li t6, 104020
  add t6, a0, t6                                                        # ir inst 108 fin
  lw t4, 0(t6)                                                          # ir inst 109 fin
  addi t3, t4, 1                                                        # ir inst 110 fin
  sw t3, 0(t6)                                                          # ir inst 111 fin
  mv a0, t5
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 112 fin
.F._7GLwwskssmg_delete_node._20.if.else.7:
  j .F._7GLwwskssmg_delete_node._21.if.exit.7                           # ir inst 113 fin
.F._7GLwwskssmg_delete_node._21.if.exit.7:
  j .F._7GLwwskssmg_delete_node._22.if.exit.6                           # ir inst 114 fin
.F._7GLwwskssmg_delete_node._22.if.exit.6:
  addi t6, a0, 0                                                        # ir inst 115 fin
  mv t5, a1                                                             # ir inst 116 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 117 fin
  addi t6, t4, 40                                                       # ir inst 118 fin
  lw t5, 0(t6)                                                          # ir inst 119 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_find_min
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 120 fin
  addi t5, a0, 0                                                        # ir inst 121 fin
  mv t4, a1                                                             # ir inst 122 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 123 fin
  addi t5, t3, 4                                                        # ir inst 124 fin
  addi t4, a0, 0                                                        # ir inst 125 fin
  mv t3, t6                                                             # ir inst 126 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 127 fin
  addi t4, s11, 4                                                       # ir inst 128 fin
  lw t3, 0(t4)                                                          # ir inst 129 fin
  sw t3, 0(t5)                                                          # ir inst 130 fin
  addi t5, a0, 0                                                        # ir inst 131 fin
  mv t4, a1                                                             # ir inst 132 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 133 fin
  addi t5, t3, 0                                                        # ir inst 134 fin
  addi t4, a0, 0                                                        # ir inst 135 fin
  mv t3, t6                                                             # ir inst 136 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 137 fin
  addi t4, s11, 0                                                       # ir inst 138 fin
  lw t3, 0(t4)                                                          # ir inst 139 fin
  sw t3, 0(t5)                                                          # ir inst 140 fin
  addi t5, a0, 0                                                        # ir inst 141 fin
  mv t4, a1                                                             # ir inst 142 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 143 fin
  addi t5, t3, 20                                                       # ir inst 144 fin
  addi t4, a0, 0                                                        # ir inst 145 fin
  mv t3, t6                                                             # ir inst 146 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 147 fin
  addi t4, s11, 20                                                      # ir inst 148 fin
  lw t3, 0(t4)                                                          # ir inst 149 fin
  sw t3, 0(t5)                                                          # ir inst 150 fin
  addi t5, a0, 0                                                        # ir inst 151 fin
  mv t4, a1                                                             # ir inst 152 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 153 fin
  addi t5, t3, 40                                                       # ir inst 154 fin
  lw t4, 0(t5)                                                          # ir inst 155 fin
  addi t5, a0, 0                                                        # ir inst 156 fin
  mv t3, t6                                                             # ir inst 157 fin
  li t1, 48
  mul t2, t3, t1
  add t6, t5, t2                                                        # ir inst 158 fin
  addi t5, t6, 4                                                        # ir inst 159 fin
  lw t6, 0(t5)                                                          # ir inst 160 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a2, t6
  mv a1, t4
  call .F._7GLwwskssmg_delete_node
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 161 fin
  addi t6, a0, 0                                                        # ir inst 162 fin
  mv t4, a1                                                             # ir inst 163 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t6, t2                                                        # ir inst 164 fin
  addi t6, t3, 40                                                       # ir inst 165 fin
  sw t5, 0(t6)                                                          # ir inst 166 fin
  li t2, -1
  xor t0, t5, t2
  sltu t6, zero, t0                                                     # ir inst 167 fin
  bnez t6, .F._7GLwwskssmg_delete_node._23.if.then.8
  j .F._7GLwwskssmg_delete_node._24.if.else.8                           # ir inst 168 fin
.F._7GLwwskssmg_delete_node._23.if.then.8:
  addi t6, a0, 0                                                        # ir inst 169 fin
  mv t4, t5                                                             # ir inst 170 fin
  li t1, 48
  mul t2, t4, t1
  add t5, t6, t2                                                        # ir inst 171 fin
  addi t6, t5, 44                                                       # ir inst 172 fin
  sw a1, 0(t6)                                                          # ir inst 173 fin
  j .F._7GLwwskssmg_delete_node._25.if.exit.8                           # ir inst 174 fin
.F._7GLwwskssmg_delete_node._24.if.else.8:
  j .F._7GLwwskssmg_delete_node._25.if.exit.8                           # ir inst 175 fin
.F._7GLwwskssmg_delete_node._25.if.exit.8:
  j .F._7GLwwskssmg_delete_node._26.if.exit.3                           # ir inst 176 fin
.F._7GLwwskssmg_delete_node._26.if.exit.3:
  j .F._7GLwwskssmg_delete_node._27.if.exit.1                           # ir inst 177 fin
.F._7GLwwskssmg_delete_node._27.if.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F._7GLwwskssmg_update_height
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 178 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F._7GLwwskssmg_get_balance
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 179 fin
  li t2, 1
  slt t5, t2, t6                                                        # ir inst 180 fin
  bnez t5, .F._7GLwwskssmg_delete_node._28.lazy.then.0
  j .F._7GLwwskssmg_delete_node._29.lazy.else.0                         # ir inst 181 fin
.F._7GLwwskssmg_delete_node._28.lazy.then.0:
  addi t5, a0, 0                                                        # ir inst 182 fin
  mv t4, a1                                                             # ir inst 183 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 184 fin
  addi t5, t3, 36                                                       # ir inst 185 fin
  lw t4, 0(t5)                                                          # ir inst 186 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F._7GLwwskssmg_get_balance
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 187 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 188 fin
# Phi connections
  mv t5, t4
  j .F._7GLwwskssmg_delete_node._30.lazy.exit.0                         # ir inst 189 fin
.F._7GLwwskssmg_delete_node._29.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._7GLwwskssmg_delete_node._30.lazy.exit.0                         # ir inst 190 fin
.F._7GLwwskssmg_delete_node._30.lazy.exit.0:
  bnez t5, .F._7GLwwskssmg_delete_node._31.if.then.9
  j .F._7GLwwskssmg_delete_node._32.if.else.9                           # ir inst 192 fin
.F._7GLwwskssmg_delete_node._31.if.then.9:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  call .F._7GLwwskssmg_right_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 193 fin
  mv a0, t5
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 194 fin
.F._7GLwwskssmg_delete_node._32.if.else.9:
  j .F._7GLwwskssmg_delete_node._33.if.exit.9                           # ir inst 195 fin
.F._7GLwwskssmg_delete_node._33.if.exit.9:
  li t2, 1
  slt t5, t2, t6                                                        # ir inst 196 fin
  bnez t5, .F._7GLwwskssmg_delete_node._34.lazy.then.1
  j .F._7GLwwskssmg_delete_node._35.lazy.else.1                         # ir inst 197 fin
.F._7GLwwskssmg_delete_node._34.lazy.then.1:
  addi t5, a0, 0                                                        # ir inst 198 fin
  mv t4, a1                                                             # ir inst 199 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 200 fin
  addi t5, t3, 36                                                       # ir inst 201 fin
  lw t4, 0(t5)                                                          # ir inst 202 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F._7GLwwskssmg_get_balance
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 203 fin
  li t2, 0
  slt t4, t5, t2                                                        # ir inst 204 fin
# Phi connections
  mv t5, t4
  j .F._7GLwwskssmg_delete_node._36.lazy.exit.1                         # ir inst 205 fin
.F._7GLwwskssmg_delete_node._35.lazy.else.1:
# Phi connections
  li t5, 0
  j .F._7GLwwskssmg_delete_node._36.lazy.exit.1                         # ir inst 206 fin
.F._7GLwwskssmg_delete_node._36.lazy.exit.1:
  bnez t5, .F._7GLwwskssmg_delete_node._37.if.then.10
  j .F._7GLwwskssmg_delete_node._41.if.else.10                          # ir inst 208 fin
.F._7GLwwskssmg_delete_node._37.if.then.10:
  addi t5, a0, 0                                                        # ir inst 209 fin
  mv t4, a1                                                             # ir inst 210 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 211 fin
  addi t5, t3, 36                                                       # ir inst 212 fin
  lw t4, 0(t5)                                                          # ir inst 213 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F._7GLwwskssmg_left_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 214 fin
  addi t4, a0, 0                                                        # ir inst 215 fin
  mv t3, a1                                                             # ir inst 216 fin
  li t1, 48
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 217 fin
  addi t4, s11, 36                                                      # ir inst 218 fin
  sw t5, 0(t4)                                                          # ir inst 219 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 220 fin
  bnez t4, .F._7GLwwskssmg_delete_node._38.if.then.11
  j .F._7GLwwskssmg_delete_node._39.if.else.11                          # ir inst 221 fin
.F._7GLwwskssmg_delete_node._38.if.then.11:
  addi t4, a0, 0                                                        # ir inst 222 fin
  mv t3, t5                                                             # ir inst 223 fin
  li t1, 48
  mul t2, t3, t1
  add t5, t4, t2                                                        # ir inst 224 fin
  addi t4, t5, 44                                                       # ir inst 225 fin
  sw a1, 0(t4)                                                          # ir inst 226 fin
  j .F._7GLwwskssmg_delete_node._40.if.exit.11                          # ir inst 227 fin
.F._7GLwwskssmg_delete_node._39.if.else.11:
  j .F._7GLwwskssmg_delete_node._40.if.exit.11                          # ir inst 228 fin
.F._7GLwwskssmg_delete_node._40.if.exit.11:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  call .F._7GLwwskssmg_right_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 229 fin
  mv a0, t5
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 230 fin
.F._7GLwwskssmg_delete_node._41.if.else.10:
  j .F._7GLwwskssmg_delete_node._42.if.exit.10                          # ir inst 231 fin
.F._7GLwwskssmg_delete_node._42.if.exit.10:
  li t2, -1
  slt t5, t6, t2                                                        # ir inst 232 fin
  bnez t5, .F._7GLwwskssmg_delete_node._43.lazy.then.2
  j .F._7GLwwskssmg_delete_node._44.lazy.else.2                         # ir inst 233 fin
.F._7GLwwskssmg_delete_node._43.lazy.then.2:
  addi t5, a0, 0                                                        # ir inst 234 fin
  mv t4, a1                                                             # ir inst 235 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 236 fin
  addi t5, t3, 40                                                       # ir inst 237 fin
  lw t4, 0(t5)                                                          # ir inst 238 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  mv a1, t4
  call .F._7GLwwskssmg_get_balance
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 239 fin
  li t2, 0
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 240 fin
# Phi connections
  mv t5, t4
  j .F._7GLwwskssmg_delete_node._45.lazy.exit.2                         # ir inst 241 fin
.F._7GLwwskssmg_delete_node._44.lazy.else.2:
# Phi connections
  li t5, 0
  j .F._7GLwwskssmg_delete_node._45.lazy.exit.2                         # ir inst 242 fin
.F._7GLwwskssmg_delete_node._45.lazy.exit.2:
  bnez t5, .F._7GLwwskssmg_delete_node._46.if.then.12
  j .F._7GLwwskssmg_delete_node._47.if.else.12                          # ir inst 244 fin
.F._7GLwwskssmg_delete_node._46.if.then.12:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  call .F._7GLwwskssmg_left_rotate
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 245 fin
  mv a0, t5
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 246 fin
.F._7GLwwskssmg_delete_node._47.if.else.12:
  j .F._7GLwwskssmg_delete_node._48.if.exit.12                          # ir inst 247 fin
.F._7GLwwskssmg_delete_node._48.if.exit.12:
  li t2, -1
  slt t5, t6, t2                                                        # ir inst 248 fin
  bnez t5, .F._7GLwwskssmg_delete_node._49.lazy.then.3
  j .F._7GLwwskssmg_delete_node._50.lazy.else.3                         # ir inst 249 fin
.F._7GLwwskssmg_delete_node._49.lazy.then.3:
  addi t6, a0, 0                                                        # ir inst 250 fin
  mv t5, a1                                                             # ir inst 251 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 252 fin
  addi t6, t4, 40                                                       # ir inst 253 fin
  lw t5, 0(t6)                                                          # ir inst 254 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_get_balance
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 255 fin
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 256 fin
# Phi connections
  mv t6, t5
  j .F._7GLwwskssmg_delete_node._51.lazy.exit.3                         # ir inst 257 fin
.F._7GLwwskssmg_delete_node._50.lazy.else.3:
# Phi connections
  li t6, 0
  j .F._7GLwwskssmg_delete_node._51.lazy.exit.3                         # ir inst 258 fin
.F._7GLwwskssmg_delete_node._51.lazy.exit.3:
  bnez t6, .F._7GLwwskssmg_delete_node._52.if.then.13
  j .F._7GLwwskssmg_delete_node._56.if.else.13                          # ir inst 260 fin
.F._7GLwwskssmg_delete_node._52.if.then.13:
  addi t6, a0, 0                                                        # ir inst 261 fin
  mv t5, a1                                                             # ir inst 262 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 263 fin
  addi t6, t4, 40                                                       # ir inst 264 fin
  lw t5, 0(t6)                                                          # ir inst 265 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  mv a1, t5
  call .F._7GLwwskssmg_right_rotate
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
# ir inst 266 fin
  addi t5, a0, 0                                                        # ir inst 267 fin
  mv t4, a1                                                             # ir inst 268 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 269 fin
  addi t5, t3, 40                                                       # ir inst 270 fin
  sw t6, 0(t5)                                                          # ir inst 271 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 272 fin
  bnez t5, .F._7GLwwskssmg_delete_node._53.if.then.14
  j .F._7GLwwskssmg_delete_node._54.if.else.14                          # ir inst 273 fin
.F._7GLwwskssmg_delete_node._53.if.then.14:
  addi t5, a0, 0                                                        # ir inst 274 fin
  mv t4, t6                                                             # ir inst 275 fin
  li t1, 48
  mul t2, t4, t1
  add t6, t5, t2                                                        # ir inst 276 fin
  addi t5, t6, 44                                                       # ir inst 277 fin
  sw a1, 0(t5)                                                          # ir inst 278 fin
  j .F._7GLwwskssmg_delete_node._55.if.exit.14                          # ir inst 279 fin
.F._7GLwwskssmg_delete_node._54.if.else.14:
  j .F._7GLwwskssmg_delete_node._55.if.exit.14                          # ir inst 280 fin
.F._7GLwwskssmg_delete_node._55.if.exit.14:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F._7GLwwskssmg_left_rotate
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 281 fin
  mv a0, t6
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 282 fin
.F._7GLwwskssmg_delete_node._56.if.else.13:
  j .F._7GLwwskssmg_delete_node._57.if.exit.13                          # ir inst 283 fin
.F._7GLwwskssmg_delete_node._57.if.exit.13:
  mv a0, a1
  j .F._7GLwwskssmg_delete_node.epilogue                                # ir inst 284 fin
.F._7GLwwskssmg_delete_node.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._7GLwwskssmg_inorder_traversal
.F._7GLwwskssmg_inorder_traversal:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F._7GLwwskssmg_inorder_traversal._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltu t6, zero, t0                                                     # ir inst 1 fin
  bnez t6, .F._7GLwwskssmg_inorder_traversal._1.lazy.then.0
  j .F._7GLwwskssmg_inorder_traversal._2.lazy.else.0                    # ir inst 2 fin
.F._7GLwwskssmg_inorder_traversal._1.lazy.then.0:
  lw t6, 0(a3)                                                          # ir inst 3 fin
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 4 fin
# Phi connections
  mv t6, t5
  j .F._7GLwwskssmg_inorder_traversal._3.lazy.exit.0                    # ir inst 5 fin
.F._7GLwwskssmg_inorder_traversal._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F._7GLwwskssmg_inorder_traversal._3.lazy.exit.0                    # ir inst 6 fin
.F._7GLwwskssmg_inorder_traversal._3.lazy.exit.0:
  bnez t6, .F._7GLwwskssmg_inorder_traversal._4.if.then.0
  j .F._7GLwwskssmg_inorder_traversal._5.if.else.0                      # ir inst 8 fin
.F._7GLwwskssmg_inorder_traversal._4.if.then.0:
  addi t6, a0, 0                                                        # ir inst 9 fin
  mv t5, a1                                                             # ir inst 10 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 11 fin
  addi t6, t4, 36                                                       # ir inst 12 fin
  lw t5, 0(t6)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a1, t5
  call .F._7GLwwskssmg_inorder_traversal
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 14 fin
  lw t6, 0(a3)                                                          # ir inst 15 fin
  mv t5, t6                                                             # ir inst 16 fin
  slli t2, t5, 2
  add t6, a2, t2                                                        # ir inst 17 fin
  addi t5, a0, 0                                                        # ir inst 18 fin
  mv t4, a1                                                             # ir inst 19 fin
  li t1, 48
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 20 fin
  addi t5, t3, 0                                                        # ir inst 21 fin
  lw t4, 0(t5)                                                          # ir inst 22 fin
  sw t4, 0(t6)                                                          # ir inst 23 fin
  lw t6, 0(a3)                                                          # ir inst 24 fin
  addi t5, t6, 1                                                        # ir inst 25 fin
  sw t5, 0(a3)                                                          # ir inst 26 fin
  addi t6, a0, 0                                                        # ir inst 27 fin
  mv t5, a1                                                             # ir inst 28 fin
  li t1, 48
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 29 fin
  addi t6, t4, 40                                                       # ir inst 30 fin
  lw t5, 0(t6)                                                          # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd t5, 24(sp)
  mv a1, t5
  call .F._7GLwwskssmg_inorder_traversal
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld t5, 24(sp)
# ir inst 32 fin
  j .F._7GLwwskssmg_inorder_traversal._6.if.exit.0                      # ir inst 33 fin
.F._7GLwwskssmg_inorder_traversal._5.if.else.0:
  j .F._7GLwwskssmg_inorder_traversal._6.if.exit.0                      # ir inst 34 fin
.F._7GLwwskssmg_inorder_traversal._6.if.exit.0:
  j .F._7GLwwskssmg_inorder_traversal.epilogue                          # ir inst 35 fin
.F._7GLwwskssmg_inorder_traversal.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F._83laIxrrFTG_new
.F._83laIxrrFTG_new:
# spill func args num: 0,             range:      208(sp) -      208(sp)
# local var size: 160,                range:       48(sp) -      208(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -208
  sd ra, 40(sp)
.F._83laIxrrFTG_new._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t1, sp, 48
  addi t5, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t4, 0
  j .F._83laIxrrFTG_new._1.array.cond.0                                 # ir inst 4 fin
.F._83laIxrrFTG_new._1.array.cond.0:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 6 fin
  bnez t3, .F._83laIxrrFTG_new._2.array.body.0
  j .F._83laIxrrFTG_new._3.array.exit.0                                 # ir inst 7 fin
.F._83laIxrrFTG_new._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 9 fin
  addi t3, t4, 1                                                        # ir inst 10 fin
# Phi connections
  mv t4, t3
  j .F._83laIxrrFTG_new._1.array.cond.0                                 # ir inst 11 fin
.F._83laIxrrFTG_new._3.array.exit.0:
  addi t5, t6, 0                                                        # ir inst 12 fin
# Phi connections
  li t6, 0
  j .F._83laIxrrFTG_new._4.array.cond.1                                 # ir inst 13 fin
.F._83laIxrrFTG_new._4.array.cond.1:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 15 fin
  bnez t4, .F._83laIxrrFTG_new._5.array.body.1
  j .F._83laIxrrFTG_new._6.array.exit.1                                 # ir inst 16 fin
.F._83laIxrrFTG_new._5.array.body.1:
  li t1, 80
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 80
  addi t1, sp, 48
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 18 fin
  addi t4, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t4
  j .F._83laIxrrFTG_new._4.array.cond.1                                 # ir inst 20 fin
.F._83laIxrrFTG_new._6.array.exit.1:
  li t6, 80000
  add t6, a0, t6                                                        # ir inst 21 fin
  addi t5, t6, 0                                                        # ir inst 22 fin
# Phi connections
  li t6, 0
  j .F._83laIxrrFTG_new._7.array.cond.2                                 # ir inst 23 fin
.F._83laIxrrFTG_new._7.array.cond.2:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 25 fin
  bnez t4, .F._83laIxrrFTG_new._8.array.body.2
  j .F._83laIxrrFTG_new._9.array.exit.2                                 # ir inst 26 fin
.F._83laIxrrFTG_new._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t4
  j .F._83laIxrrFTG_new._7.array.cond.2                                 # ir inst 30 fin
.F._83laIxrrFTG_new._9.array.exit.2:
  li t6, 84000
  add t6, a0, t6                                                        # ir inst 31 fin
  addi t1, sp, 128
  addi t5, t1, 0                                                        # ir inst 33 fin
# Phi connections
  li t4, 0
  j .F._83laIxrrFTG_new._10.array.cond.3                                # ir inst 34 fin
.F._83laIxrrFTG_new._10.array.cond.3:
  li t2, 20
  slt t3, t4, t2                                                        # ir inst 36 fin
  bnez t3, .F._83laIxrrFTG_new._11.array.body.3
  j .F._83laIxrrFTG_new._12.array.exit.3                                # ir inst 37 fin
.F._83laIxrrFTG_new._11.array.body.3:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
# Phi connections
  mv t4, t3
  j .F._83laIxrrFTG_new._10.array.cond.3                                # ir inst 41 fin
.F._83laIxrrFTG_new._12.array.exit.3:
  addi t5, t6, 0                                                        # ir inst 42 fin
# Phi connections
  li t6, 0
  j .F._83laIxrrFTG_new._13.array.cond.4                                # ir inst 43 fin
.F._83laIxrrFTG_new._13.array.cond.4:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 45 fin
  bnez t4, .F._83laIxrrFTG_new._14.array.body.4
  j .F._83laIxrrFTG_new._15.array.exit.4                                # ir inst 46 fin
.F._83laIxrrFTG_new._14.array.body.4:
  li t1, 80
  mul t2, t6, t1
  add t4, t5, t2                                                        # ir inst 47 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 80
  addi t1, sp, 128
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 48 fin
  addi t4, t6, 1                                                        # ir inst 49 fin
# Phi connections
  mv t6, t4
  j .F._83laIxrrFTG_new._13.array.cond.4                                # ir inst 50 fin
.F._83laIxrrFTG_new._15.array.exit.4:
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 51 fin
  sw a1, 0(t6)                                                          # ir inst 52 fin
  li t6, 164004
  add t6, a0, t6                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 54 fin
  li t6, 164008
  add t6, a0, t6                                                        # ir inst 55 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 56 fin
  li t6, 164012
  add t6, a0, t6                                                        # ir inst 57 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 58 fin
  li t6, 164016
  add t6, a0, t6                                                        # ir inst 59 fin
  li t1, 31
  sw t1, 0(t6)                                                          # ir inst 60 fin
  li t6, 164020
  add t6, a0, t6                                                        # ir inst 61 fin
  li t1, 17
  sw t1, 0(t6)                                                          # ir inst 62 fin
  li t6, 164024
  add t6, a0, t6                                                        # ir inst 63 fin
  li t1, 1000003
  sw t1, 0(t6)                                                          # ir inst 64 fin
  j .F._83laIxrrFTG_new.epilogue                                        # ir inst 65 fin
.F._83laIxrrFTG_new.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 208
  ret

.globl .F._83laIxrrFTG_hash_function
.F._83laIxrrFTG_hash_function:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._83laIxrrFTG_hash_function._0.entry.0:
  li t6, 164016
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  mul t6, t5, a1                                                        # ir inst 3 fin
  li t5, 164020
  add t5, a0, t5                                                        # ir inst 4 fin
  lw t4, 0(t5)                                                          # ir inst 5 fin
  add t5, t6, t4                                                        # ir inst 6 fin
  li t6, 164024
  add t6, a0, t6                                                        # ir inst 7 fin
  lw t4, 0(t6)                                                          # ir inst 8 fin
  rem t6, t5, t4                                                        # ir inst 9 fin
  li t5, 164000
  add t5, a0, t5                                                        # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  rem t5, t6, t4                                                        # ir inst 12 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 13 fin
  bnez t6, .F._83laIxrrFTG_hash_function._1.if.then.0
  j .F._83laIxrrFTG_hash_function._2.if.else.0                          # ir inst 14 fin
.F._83laIxrrFTG_hash_function._1.if.then.0:
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 15 fin
  lw t4, 0(t6)                                                          # ir inst 16 fin
  add t6, t5, t4                                                        # ir inst 17 fin
  mv a0, t6
  j .F._83laIxrrFTG_hash_function.epilogue                              # ir inst 18 fin
.F._83laIxrrFTG_hash_function._2.if.else.0:
  j .F._83laIxrrFTG_hash_function._3.if.exit.0                          # ir inst 19 fin
.F._83laIxrrFTG_hash_function._3.if.exit.0:
  mv a0, t5
  j .F._83laIxrrFTG_hash_function.epilogue                              # ir inst 20 fin
.F._83laIxrrFTG_hash_function.epilogue:
  ret

.globl .F._83laIxrrFTG_insert
.F._83laIxrrFTG_insert:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F._83laIxrrFTG_insert._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F._83laIxrrFTG_hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Phi connections
  li t5, 0
  j .F._83laIxrrFTG_insert._1.while.cond.0                              # ir inst 2 fin
.F._83laIxrrFTG_insert._1.while.cond.0:
  li t4, 80000
  add t4, a0, t4                                                        # ir inst 4 fin
  mv t3, t6                                                             # ir inst 5 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 6 fin
  lw t4, 0(s11)                                                         # ir inst 7 fin
  slt t3, t5, t4                                                        # ir inst 8 fin
  bnez t3, .F._83laIxrrFTG_insert._2.while.body.0
  j .F._83laIxrrFTG_insert._6.while.exit.0                              # ir inst 9 fin
.F._83laIxrrFTG_insert._2.while.body.0:
  li t4, 84000
  add t4, a0, t4                                                        # ir inst 10 fin
  mv t3, t6                                                             # ir inst 11 fin
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  xor t0, t4, a1
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F._83laIxrrFTG_insert._3.if.then.0
  j .F._83laIxrrFTG_insert._4.if.else.0                                 # ir inst 17 fin
.F._83laIxrrFTG_insert._3.if.then.0:
  addi t4, a0, 0                                                        # ir inst 18 fin
  mv t3, t6                                                             # ir inst 19 fin
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 20 fin
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 22 fin
  sw a2, 0(t3)                                                          # ir inst 23 fin
  j .F._83laIxrrFTG_insert.epilogue                                     # ir inst 24 fin
.F._83laIxrrFTG_insert._4.if.else.0:
  j .F._83laIxrrFTG_insert._5.if.exit.0                                 # ir inst 25 fin
.F._83laIxrrFTG_insert._5.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F._83laIxrrFTG_insert._1.while.cond.0                              # ir inst 27 fin
.F._83laIxrrFTG_insert._6.while.exit.0:
  li t5, 80000
  add t5, a0, t5                                                        # ir inst 28 fin
  mv t4, t6                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 30 fin
  lw t5, 0(t3)                                                          # ir inst 31 fin
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 32 fin
  bnez t4, .F._83laIxrrFTG_insert._7.if.then.1
  j .F._83laIxrrFTG_insert._14.if.else.1                                # ir inst 33 fin
.F._83laIxrrFTG_insert._7.if.then.1:
  li t5, 84000
  add t5, a0, t5                                                        # ir inst 34 fin
  mv t4, t6                                                             # ir inst 35 fin
  li t1, 80
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 36 fin
  li t5, 80000
  add t5, a0, t5                                                        # ir inst 37 fin
  mv t4, t6                                                             # ir inst 38 fin
  slli t2, t4, 2
  add s11, t5, t2                                                       # ir inst 39 fin
  lw t5, 0(s11)                                                         # ir inst 40 fin
  mv t4, t5                                                             # ir inst 41 fin
  slli t2, t4, 2
  add t5, t3, t2                                                        # ir inst 42 fin
  sw a1, 0(t5)                                                          # ir inst 43 fin
  addi t5, a0, 0                                                        # ir inst 44 fin
  mv t4, t6                                                             # ir inst 45 fin
  li t1, 80
  mul t2, t4, t1
  add t3, t5, t2                                                        # ir inst 46 fin
  li t5, 80000
  add t5, a0, t5                                                        # ir inst 47 fin
  mv t4, t6                                                             # ir inst 48 fin
  slli t2, t4, 2
  add s11, t5, t2                                                       # ir inst 49 fin
  lw t5, 0(s11)                                                         # ir inst 50 fin
  mv t4, t5                                                             # ir inst 51 fin
  slli t2, t4, 2
  add t5, t3, t2                                                        # ir inst 52 fin
  sw a2, 0(t5)                                                          # ir inst 53 fin
  li t5, 80000
  add t5, a0, t5                                                        # ir inst 54 fin
  mv t4, t6                                                             # ir inst 55 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 56 fin
  lw t5, 0(t3)                                                          # ir inst 57 fin
  addi t4, t5, 1                                                        # ir inst 58 fin
  sw t4, 0(t3)                                                          # ir inst 59 fin
  li t5, 164004
  add t5, a0, t5                                                        # ir inst 60 fin
  lw t4, 0(t5)                                                          # ir inst 61 fin
  addi t3, t4, 1                                                        # ir inst 62 fin
  sw t3, 0(t5)                                                          # ir inst 63 fin
  li t5, 80000
  add t5, a0, t5                                                        # ir inst 64 fin
  mv t4, t6                                                             # ir inst 65 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 66 fin
  lw t5, 0(t6)                                                          # ir inst 67 fin
  li t2, 1
  slt t6, t2, t5                                                        # ir inst 68 fin
  bnez t6, .F._83laIxrrFTG_insert._8.if.then.2
  j .F._83laIxrrFTG_insert._9.if.else.2                                 # ir inst 69 fin
.F._83laIxrrFTG_insert._8.if.then.2:
  li t6, 164008
  add t6, a0, t6                                                        # ir inst 70 fin
  lw t5, 0(t6)                                                          # ir inst 71 fin
  addi t4, t5, 1                                                        # ir inst 72 fin
  sw t4, 0(t6)                                                          # ir inst 73 fin
  j .F._83laIxrrFTG_insert._10.if.exit.2                                # ir inst 74 fin
.F._83laIxrrFTG_insert._9.if.else.2:
  j .F._83laIxrrFTG_insert._10.if.exit.2                                # ir inst 75 fin
.F._83laIxrrFTG_insert._10.if.exit.2:
  li t6, 164004
  add t6, a0, t6                                                        # ir inst 76 fin
  lw t5, 0(t6)                                                          # ir inst 77 fin
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 78 fin
  lw t4, 0(t6)                                                          # ir inst 79 fin
  li t2, 3
  mul t6, t4, t2                                                        # ir inst 80 fin
  li t2, 4
  div t4, t6, t2                                                        # ir inst 81 fin
  slt t6, t4, t5                                                        # ir inst 82 fin
  bnez t6, .F._83laIxrrFTG_insert._11.if.then.3
  j .F._83laIxrrFTG_insert._12.if.else.3                                # ir inst 83 fin
.F._83laIxrrFTG_insert._11.if.then.3:
# Start call preparation
  sd a0, 0(sp)
  call .F._83laIxrrFTG_resize
  ld a0, 0(sp)
# ir inst 84 fin
  j .F._83laIxrrFTG_insert._13.if.exit.3                                # ir inst 85 fin
.F._83laIxrrFTG_insert._12.if.else.3:
  j .F._83laIxrrFTG_insert._13.if.exit.3                                # ir inst 86 fin
.F._83laIxrrFTG_insert._13.if.exit.3:
  j .F._83laIxrrFTG_insert._15.if.exit.1                                # ir inst 87 fin
.F._83laIxrrFTG_insert._14.if.else.1:
  j .F._83laIxrrFTG_insert._15.if.exit.1                                # ir inst 88 fin
.F._83laIxrrFTG_insert._15.if.exit.1:
  j .F._83laIxrrFTG_insert.epilogue                                     # ir inst 89 fin
.F._83laIxrrFTG_insert.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._83laIxrrFTG_search
.F._83laIxrrFTG_search:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 1 / 12,        range:       24(sp) -       32(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd ra, 32(sp)
.F._83laIxrrFTG_search._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F._83laIxrrFTG_hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
# Phi connections
  li t5, 0
  j .F._83laIxrrFTG_search._1.while.cond.0                              # ir inst 2 fin
.F._83laIxrrFTG_search._1.while.cond.0:
  li t4, 80000
  add t4, a0, t4                                                        # ir inst 4 fin
  mv t3, t6                                                             # ir inst 5 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 6 fin
  lw t4, 0(s11)                                                         # ir inst 7 fin
  slt t3, t5, t4                                                        # ir inst 8 fin
  bnez t3, .F._83laIxrrFTG_search._2.while.body.0
  j .F._83laIxrrFTG_search._6.while.exit.0                              # ir inst 9 fin
.F._83laIxrrFTG_search._2.while.body.0:
  li t4, 84000
  add t4, a0, t4                                                        # ir inst 10 fin
  mv t3, t6                                                             # ir inst 11 fin
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  xor t0, t4, a1
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F._83laIxrrFTG_search._3.if.then.0
  j .F._83laIxrrFTG_search._4.if.else.0                                 # ir inst 17 fin
.F._83laIxrrFTG_search._3.if.then.0:
  addi t4, a0, 0                                                        # ir inst 18 fin
  mv t3, t6                                                             # ir inst 19 fin
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 20 fin
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  mv a0, t4
  j .F._83laIxrrFTG_search.epilogue                                     # ir inst 24 fin
.F._83laIxrrFTG_search._4.if.else.0:
  j .F._83laIxrrFTG_search._5.if.exit.0                                 # ir inst 25 fin
.F._83laIxrrFTG_search._5.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F._83laIxrrFTG_search._1.while.cond.0                              # ir inst 27 fin
.F._83laIxrrFTG_search._6.while.exit.0:
  li a0, -1
  j .F._83laIxrrFTG_search.epilogue                                     # ir inst 28 fin
.F._83laIxrrFTG_search.epilogue:
  ld ra, 32(sp)
  ld s11, 24(sp)
  addi sp, sp, 48
  ret

.globl .F._83laIxrrFTG_delete
.F._83laIxrrFTG_delete:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 3 / 12,        range:       24(sp) -       48(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 24(sp)
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F._83laIxrrFTG_delete._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F._83laIxrrFTG_hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
# Phi connections
  li t5, 0
  j .F._83laIxrrFTG_delete._1.while.cond.0                              # ir inst 2 fin
.F._83laIxrrFTG_delete._1.while.cond.0:
  li t4, 80000
  add t4, a0, t4                                                        # ir inst 4 fin
  mv t3, t6                                                             # ir inst 5 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 6 fin
  lw t4, 0(s11)                                                         # ir inst 7 fin
  slt t3, t5, t4                                                        # ir inst 8 fin
  bnez t3, .F._83laIxrrFTG_delete._2.while.body.0
  j .F._83laIxrrFTG_delete._9.while.exit.0                              # ir inst 9 fin
.F._83laIxrrFTG_delete._2.while.body.0:
  li t4, 84000
  add t4, a0, t4                                                        # ir inst 10 fin
  mv t3, t6                                                             # ir inst 11 fin
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, s11, t2                                                       # ir inst 14 fin
  lw t4, 0(t3)                                                          # ir inst 15 fin
  xor t0, t4, a1
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F._83laIxrrFTG_delete._3.if.then.0
  j .F._83laIxrrFTG_delete._7.if.else.0                                 # ir inst 17 fin
.F._83laIxrrFTG_delete._3.if.then.0:
# Phi connections
  mv t4, t5
  j .F._83laIxrrFTG_delete._4.while.cond.1                              # ir inst 18 fin
.F._83laIxrrFTG_delete._4.while.cond.1:
  li t3, 80000
  add t3, a0, t3                                                        # ir inst 20 fin
  mv s11, t6                                                            # ir inst 21 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 22 fin
  lw t3, 0(s10)                                                         # ir inst 23 fin
  addi s11, t3, -1                                                      # ir inst 24 fin
  slt t3, t4, s11                                                       # ir inst 25 fin
  bnez t3, .F._83laIxrrFTG_delete._5.while.body.1
  j .F._83laIxrrFTG_delete._6.while.exit.1                              # ir inst 26 fin
.F._83laIxrrFTG_delete._5.while.body.1:
  li t3, 84000
  add t3, a0, t3                                                        # ir inst 27 fin
  mv s11, t6                                                            # ir inst 28 fin
  li t1, 80
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 29 fin
  mv t3, t4                                                             # ir inst 30 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 31 fin
  li t3, 84000
  add t3, a0, t3                                                        # ir inst 32 fin
  mv s10, t6                                                            # ir inst 33 fin
  li t1, 80
  mul t2, s10, t1
  add s9, t3, t2                                                        # ir inst 34 fin
  addi t3, t4, 1                                                        # ir inst 35 fin
  mv s10, t3                                                            # ir inst 36 fin
  slli t2, s10, 2
  add t3, s9, t2                                                        # ir inst 37 fin
  lw s10, 0(t3)                                                         # ir inst 38 fin
  sw s10, 0(s11)                                                        # ir inst 39 fin
  addi t3, a0, 0                                                        # ir inst 40 fin
  mv s11, t6                                                            # ir inst 41 fin
  li t1, 80
  mul t2, s11, t1
  add s10, t3, t2                                                       # ir inst 42 fin
  mv t3, t4                                                             # ir inst 43 fin
  slli t2, t3, 2
  add s11, s10, t2                                                      # ir inst 44 fin
  addi t3, a0, 0                                                        # ir inst 45 fin
  mv s10, t6                                                            # ir inst 46 fin
  li t1, 80
  mul t2, s10, t1
  add s9, t3, t2                                                        # ir inst 47 fin
  addi t3, t4, 1                                                        # ir inst 48 fin
  mv s10, t3                                                            # ir inst 49 fin
  slli t2, s10, 2
  add t3, s9, t2                                                        # ir inst 50 fin
  lw s10, 0(t3)                                                         # ir inst 51 fin
  sw s10, 0(s11)                                                        # ir inst 52 fin
  addi t3, t4, 1                                                        # ir inst 53 fin
# Phi connections
  mv t4, t3
  j .F._83laIxrrFTG_delete._4.while.cond.1                              # ir inst 54 fin
.F._83laIxrrFTG_delete._6.while.exit.1:
  li t4, 80000
  add t4, a0, t4                                                        # ir inst 55 fin
  mv t3, t6                                                             # ir inst 56 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 57 fin
  lw t4, 0(s11)                                                         # ir inst 58 fin
  addi t3, t4, -1                                                       # ir inst 59 fin
  sw t3, 0(s11)                                                         # ir inst 60 fin
  li t4, 164004
  add t4, a0, t4                                                        # ir inst 61 fin
  lw t3, 0(t4)                                                          # ir inst 62 fin
  addi s11, t3, -1                                                      # ir inst 63 fin
  sw s11, 0(t4)                                                         # ir inst 64 fin
  li a0, 1
  j .F._83laIxrrFTG_delete.epilogue                                     # ir inst 65 fin
.F._83laIxrrFTG_delete._7.if.else.0:
  j .F._83laIxrrFTG_delete._8.if.exit.0                                 # ir inst 66 fin
.F._83laIxrrFTG_delete._8.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 67 fin
# Phi connections
  mv t5, t4
  j .F._83laIxrrFTG_delete._1.while.cond.0                              # ir inst 68 fin
.F._83laIxrrFTG_delete._9.while.exit.0:
  li a0, 0
  j .F._83laIxrrFTG_delete.epilogue                                     # ir inst 69 fin
.F._83laIxrrFTG_delete.epilogue:
  ld ra, 48(sp)
  ld s9, 24(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._83laIxrrFTG_resize
.F._83laIxrrFTG_resize:
# spill func args num: 0,             range:   328240(sp) -   328240(sp)
# local var size: 328160,             range:       72(sp) -   328232(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -328240
  add sp, sp, t0
  sd s10, 40(sp)
  sd s9, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
.F._83laIxrrFTG_resize._0.entry.0:
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 900
  slt t0, t5, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F._83laIxrrFTG_resize._1.if.then.0
  j .F._83laIxrrFTG_resize._2.if.else.0                                 # ir inst 4 fin
.F._83laIxrrFTG_resize._1.if.then.0:
  j .F._83laIxrrFTG_resize.epilogue                                     # ir inst 5 fin
.F._83laIxrrFTG_resize._2.if.else.0:
  j .F._83laIxrrFTG_resize._3.if.exit.0                                 # ir inst 6 fin
.F._83laIxrrFTG_resize._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 8 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a2, 80000
  mv a1, t6
  addi t1, sp, 72
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 9 fin
  li t6, 84000
  add t6, a0, t6                                                        # ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a2, 80000
  mv a1, t6
  li t1, 80072
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 12 fin
  li t6, 80000
  add t6, a0, t6                                                        # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li a2, 4000
  mv a1, t6
  li t1, 160072
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 15 fin
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 16 fin
  lw t5, 0(t6)                                                          # ir inst 17 fin
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 18 fin
  li t4, 164000
  add t4, a0, t4                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  slli t4, t3, 1                                                        # ir inst 21 fin
  sw t4, 0(t6)                                                          # ir inst 22 fin
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 23 fin
  lw t4, 0(t6)                                                          # ir inst 24 fin
  li t2, 1000
  slt t6, t2, t4                                                        # ir inst 25 fin
  bnez t6, .F._83laIxrrFTG_resize._4.if.then.1
  j .F._83laIxrrFTG_resize._5.if.else.1                                 # ir inst 26 fin
.F._83laIxrrFTG_resize._4.if.then.1:
  li t6, 164000
  add t6, a0, t6                                                        # ir inst 27 fin
  li t1, 1000
  sw t1, 0(t6)                                                          # ir inst 28 fin
  j .F._83laIxrrFTG_resize._6.if.exit.1                                 # ir inst 29 fin
.F._83laIxrrFTG_resize._5.if.else.1:
  j .F._83laIxrrFTG_resize._6.if.exit.1                                 # ir inst 30 fin
.F._83laIxrrFTG_resize._6.if.exit.1:
  addi t6, a0, 0                                                        # ir inst 31 fin
  li t1, 244072
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 34 fin
# Phi connections
  li t3, 0
  j .F._83laIxrrFTG_resize._7.array.cond.0                              # ir inst 35 fin
.F._83laIxrrFTG_resize._7.array.cond.0:
  li t2, 20
  slt s11, t3, t2                                                       # ir inst 37 fin
  bnez s11, .F._83laIxrrFTG_resize._8.array.body.0
  j .F._83laIxrrFTG_resize._9.array.exit.0                              # ir inst 38 fin
.F._83laIxrrFTG_resize._8.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 39 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 40 fin
  addi s11, t3, 1                                                       # ir inst 41 fin
# Phi connections
  mv t3, s11
  j .F._83laIxrrFTG_resize._7.array.cond.0                              # ir inst 42 fin
.F._83laIxrrFTG_resize._9.array.exit.0:
  li t1, 164072
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t3, 0
  j .F._83laIxrrFTG_resize._10.array.cond.1                             # ir inst 44 fin
.F._83laIxrrFTG_resize._10.array.cond.1:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 46 fin
  bnez s11, .F._83laIxrrFTG_resize._11.array.body.1
  j .F._83laIxrrFTG_resize._12.array.exit.1                             # ir inst 47 fin
.F._83laIxrrFTG_resize._11.array.body.1:
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 80
  li t1, 244072
  add t1, sp, t1
  mv a1, t1
  mv a0, s11
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 49 fin
  addi s11, t3, 1                                                       # ir inst 50 fin
# Phi connections
  mv t3, s11
  j .F._83laIxrrFTG_resize._10.array.cond.1                             # ir inst 51 fin
.F._83laIxrrFTG_resize._12.array.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 80000
  li t1, 164072
  add t1, sp, t1
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 52 fin
  li t6, 84000
  add t6, a0, t6                                                        # ir inst 53 fin
  li t1, 324152
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 56 fin
# Phi connections
  li t3, 0
  j .F._83laIxrrFTG_resize._13.array.cond.2                             # ir inst 57 fin
.F._83laIxrrFTG_resize._13.array.cond.2:
  li t2, 20
  slt s11, t3, t2                                                       # ir inst 59 fin
  bnez s11, .F._83laIxrrFTG_resize._14.array.body.2
  j .F._83laIxrrFTG_resize._15.array.exit.2                             # ir inst 60 fin
.F._83laIxrrFTG_resize._14.array.body.2:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 61 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 62 fin
  addi s11, t3, 1                                                       # ir inst 63 fin
# Phi connections
  mv t3, s11
  j .F._83laIxrrFTG_resize._13.array.cond.2                             # ir inst 64 fin
.F._83laIxrrFTG_resize._15.array.exit.2:
  li t1, 244152
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 65 fin
# Phi connections
  li t3, 0
  j .F._83laIxrrFTG_resize._16.array.cond.3                             # ir inst 66 fin
.F._83laIxrrFTG_resize._16.array.cond.3:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 68 fin
  bnez s11, .F._83laIxrrFTG_resize._17.array.body.3
  j .F._83laIxrrFTG_resize._18.array.exit.3                             # ir inst 69 fin
.F._83laIxrrFTG_resize._17.array.body.3:
  li t1, 80
  mul t2, t3, t1
  add s11, t4, t2                                                       # ir inst 70 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li a2, 80
  li t1, 324152
  add t1, sp, t1
  mv a1, t1
  mv a0, s11
  call memcpy
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 71 fin
  addi s11, t3, 1                                                       # ir inst 72 fin
# Phi connections
  mv t3, s11
  j .F._83laIxrrFTG_resize._16.array.cond.3                             # ir inst 73 fin
.F._83laIxrrFTG_resize._18.array.exit.3:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 80000
  li t1, 244152
  add t1, sp, t1
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 74 fin
  li t6, 80000
  add t6, a0, t6                                                        # ir inst 75 fin
  li t1, 324232
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 77 fin
# Phi connections
  li t3, 0
  j .F._83laIxrrFTG_resize._19.array.cond.4                             # ir inst 78 fin
.F._83laIxrrFTG_resize._19.array.cond.4:
  li t2, 1000
  slt s11, t3, t2                                                       # ir inst 80 fin
  bnez s11, .F._83laIxrrFTG_resize._20.array.body.4
  j .F._83laIxrrFTG_resize._21.array.exit.4                             # ir inst 81 fin
.F._83laIxrrFTG_resize._20.array.body.4:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 82 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 83 fin
  addi s11, t3, 1                                                       # ir inst 84 fin
# Phi connections
  mv t3, s11
  j .F._83laIxrrFTG_resize._19.array.cond.4                             # ir inst 85 fin
.F._83laIxrrFTG_resize._21.array.exit.4:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 4000
  li t1, 324232
  add t1, sp, t1
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 86 fin
  li t6, 164004
  add t6, a0, t6                                                        # ir inst 87 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 88 fin
  li t6, 164012
  add t6, a0, t6                                                        # ir inst 89 fin
  lw t4, 0(t6)                                                          # ir inst 90 fin
  addi t3, t4, 1                                                        # ir inst 91 fin
  sw t3, 0(t6)                                                          # ir inst 92 fin
# Phi connections
  li t6, 0
  j .F._83laIxrrFTG_resize._22.while.cond.0                             # ir inst 93 fin
.F._83laIxrrFTG_resize._22.while.cond.0:
  slt t4, t6, t5                                                        # ir inst 95 fin
  bnez t4, .F._83laIxrrFTG_resize._23.while.body.0
  j .F._83laIxrrFTG_resize._27.while.exit.0                             # ir inst 96 fin
.F._83laIxrrFTG_resize._23.while.body.0:
# Phi connections
  li t4, 0
  j .F._83laIxrrFTG_resize._24.while.cond.1                             # ir inst 97 fin
.F._83laIxrrFTG_resize._24.while.cond.1:
  mv t3, t6                                                             # ir inst 99 fin
  slli t2, t3, 2
  li t1, 160072
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 100 fin
  lw t3, 0(s11)                                                         # ir inst 101 fin
  slt s11, t4, t3                                                       # ir inst 102 fin
  bnez s11, .F._83laIxrrFTG_resize._25.while.body.1
  j .F._83laIxrrFTG_resize._26.while.exit.1                             # ir inst 103 fin
.F._83laIxrrFTG_resize._25.while.body.1:
  mv t3, t6                                                             # ir inst 104 fin
  li t1, 80
  mul t2, t3, t1
  li t1, 80072
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 105 fin
  mv t3, t4                                                             # ir inst 106 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 107 fin
  lw t3, 0(s10)                                                         # ir inst 108 fin
  mv s11, t6                                                            # ir inst 109 fin
  li t1, 80
  mul t2, s11, t1
  addi t1, sp, 72
  add s10, t1, t2                                                       # ir inst 110 fin
  mv s11, t4                                                            # ir inst 111 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 112 fin
  lw s11, 0(s9)                                                         # ir inst 113 fin
# Start call preparation
  sd a0, 0(sp)
  sd t3, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a2, s11
  mv a1, t3
  call .F._83laIxrrFTG_insert
  ld a0, 0(sp)
  ld t3, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 114 fin
  addi t3, t4, 1                                                        # ir inst 115 fin
# Phi connections
  mv t4, t3
  j .F._83laIxrrFTG_resize._24.while.cond.1                             # ir inst 116 fin
.F._83laIxrrFTG_resize._26.while.exit.1:
  addi t4, t6, 1                                                        # ir inst 117 fin
# Phi connections
  mv t6, t4
  j .F._83laIxrrFTG_resize._22.while.cond.0                             # ir inst 118 fin
.F._83laIxrrFTG_resize._27.while.exit.0:
  j .F._83laIxrrFTG_resize.epilogue                                     # ir inst 119 fin
.F._83laIxrrFTG_resize.epilogue:
  ld ra, 64(sp)
  ld s10, 40(sp)
  ld s9, 48(sp)
  ld s11, 56(sp)
  li t0, 328240
  add sp, sp, t0
  ret

.globl .F._bC9qHXNq9fZ_new
.F._bC9qHXNq9fZ_new:
# spill func args num: 0,             range:    46048(sp) -    46048(sp)
# local var size: 46020,              range:       16(sp) -    46036(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -46048
  add sp, sp, t0
  sd ra, 8(sp)
.F._bC9qHXNq9fZ_new._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  addi t5, t6, 0                                                        # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F._bC9qHXNq9fZ_new._1.array.cond.0                                 # ir inst 4 fin
.F._bC9qHXNq9fZ_new._1.array.cond.0:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F._bC9qHXNq9fZ_new._2.array.body.0
  j .F._bC9qHXNq9fZ_new._3.array.exit.0                                 # ir inst 7 fin
.F._bC9qHXNq9fZ_new._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F._bC9qHXNq9fZ_new._1.array.cond.0                                 # ir inst 11 fin
.F._bC9qHXNq9fZ_new._3.array.exit.0:
  addi t1, sp, 16
  addi t6, t1, 2000                                                     # ir inst 12 fin
  addi t5, t6, 0                                                        # ir inst 13 fin
# Phi connections
  li t6, 0
  j .F._bC9qHXNq9fZ_new._4.array.cond.1                                 # ir inst 14 fin
.F._bC9qHXNq9fZ_new._4.array.cond.1:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, .F._bC9qHXNq9fZ_new._5.array.body.1
  j .F._bC9qHXNq9fZ_new._6.array.exit.1                                 # ir inst 17 fin
.F._bC9qHXNq9fZ_new._5.array.body.1:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t4
  j .F._bC9qHXNq9fZ_new._4.array.cond.1                                 # ir inst 21 fin
.F._bC9qHXNq9fZ_new._6.array.exit.1:
  addi t1, sp, 16
  li t6, 4000
  add t6, t1, t6                                                        # ir inst 22 fin
  addi t5, t6, 0                                                        # ir inst 23 fin
# Phi connections
  li t6, 0
  j .F._bC9qHXNq9fZ_new._7.array.cond.2                                 # ir inst 24 fin
.F._bC9qHXNq9fZ_new._7.array.cond.2:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 26 fin
  bnez t4, .F._bC9qHXNq9fZ_new._8.array.body.2
  j .F._bC9qHXNq9fZ_new._9.array.exit.2                                 # ir inst 27 fin
.F._bC9qHXNq9fZ_new._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t4
  j .F._bC9qHXNq9fZ_new._7.array.cond.2                                 # ir inst 31 fin
.F._bC9qHXNq9fZ_new._9.array.exit.2:
  addi t1, sp, 16
  li t6, 6000
  add t6, t1, t6                                                        # ir inst 32 fin
  addi t5, t6, 0                                                        # ir inst 33 fin
# Phi connections
  li t6, 0
  j .F._bC9qHXNq9fZ_new._10.array.cond.3                                # ir inst 34 fin
.F._bC9qHXNq9fZ_new._10.array.cond.3:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 36 fin
  bnez t4, .F._bC9qHXNq9fZ_new._11.array.body.3
  j .F._bC9qHXNq9fZ_new._12.array.exit.3                                # ir inst 37 fin
.F._bC9qHXNq9fZ_new._11.array.body.3:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 38 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 39 fin
  addi t4, t6, 1                                                        # ir inst 40 fin
# Phi connections
  mv t6, t4
  j .F._bC9qHXNq9fZ_new._10.array.cond.3                                # ir inst 41 fin
.F._bC9qHXNq9fZ_new._12.array.exit.3:
  addi t1, sp, 16
  li t6, 46000
  add t6, t1, t6                                                        # ir inst 42 fin
  sw a1, 0(t6)                                                          # ir inst 43 fin
  addi t1, sp, 16
  li t6, 46004
  add t6, t1, t6                                                        # ir inst 44 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 45 fin
  addi t1, sp, 16
  li t6, 46008
  add t6, t1, t6                                                        # ir inst 46 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 47 fin
  addi t1, sp, 16
  li t6, 46012
  add t6, t1, t6                                                        # ir inst 48 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 49 fin
  addi t1, sp, 16
  li t6, 46016
  add t6, t1, t6                                                        # ir inst 50 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 51 fin
# Phi connections
  li t6, 0
  j .F._bC9qHXNq9fZ_new._13.while.cond.0                                # ir inst 52 fin
.F._bC9qHXNq9fZ_new._13.while.cond.0:
  li t2, 10000
  slt t5, t6, t2                                                        # ir inst 54 fin
  bnez t5, .F._bC9qHXNq9fZ_new._14.while.body.0
  j .F._bC9qHXNq9fZ_new._15.while.exit.0                                # ir inst 55 fin
.F._bC9qHXNq9fZ_new._14.while.body.0:
  addi t1, sp, 16
  li t5, 6000
  add t5, t1, t5                                                        # ir inst 56 fin
  mv t4, t6                                                             # ir inst 57 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 58 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 59 fin
  addi t5, t6, 1                                                        # ir inst 60 fin
# Phi connections
  mv t6, t5
  j .F._bC9qHXNq9fZ_new._13.while.cond.0                                # ir inst 61 fin
.F._bC9qHXNq9fZ_new._15.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 46020
  addi t1, sp, 16
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 62 fin
  j .F._bC9qHXNq9fZ_new.epilogue                                        # ir inst 63 fin
.F._bC9qHXNq9fZ_new.epilogue:
  ld ra, 8(sp)
  li t0, 46048
  add sp, sp, t0
  ret

.globl .F._bC9qHXNq9fZ_get
.F._bC9qHXNq9fZ_get:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F._bC9qHXNq9fZ_get._0.entry.0:
  li t6, 46008
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t4, t5, 1                                                        # ir inst 3 fin
  sw t4, 0(t6)                                                          # ir inst 4 fin
  li t2, 0
  slt t6, a1, t2                                                        # ir inst 5 fin
  bnez t6, .F._bC9qHXNq9fZ_get._1.lazy.then.0
  j .F._bC9qHXNq9fZ_get._2.lazy.else.0                                  # ir inst 6 fin
.F._bC9qHXNq9fZ_get._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F._bC9qHXNq9fZ_get._3.lazy.exit.0                                  # ir inst 7 fin
.F._bC9qHXNq9fZ_get._2.lazy.else.0:
  li t2, 10000
  slt t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 8 fin
# Phi connections
  j .F._bC9qHXNq9fZ_get._3.lazy.exit.0                                  # ir inst 9 fin
.F._bC9qHXNq9fZ_get._3.lazy.exit.0:
  bnez t6, .F._bC9qHXNq9fZ_get._4.if.then.0
  j .F._bC9qHXNq9fZ_get._5.if.else.0                                    # ir inst 11 fin
.F._bC9qHXNq9fZ_get._4.if.then.0:
  li t6, 46016
  add t6, a0, t6                                                        # ir inst 12 fin
  lw t5, 0(t6)                                                          # ir inst 13 fin
  addi t4, t5, 1                                                        # ir inst 14 fin
  sw t4, 0(t6)                                                          # ir inst 15 fin
  li a0, -1
  j .F._bC9qHXNq9fZ_get.epilogue                                        # ir inst 16 fin
.F._bC9qHXNq9fZ_get._5.if.else.0:
  j .F._bC9qHXNq9fZ_get._6.if.exit.0                                    # ir inst 17 fin
.F._bC9qHXNq9fZ_get._6.if.exit.0:
  li t6, 6000
  add t6, a0, t6                                                        # ir inst 18 fin
  mv t5, a1                                                             # ir inst 19 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 20 fin
  lw t6, 0(t4)                                                          # ir inst 21 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 22 fin
  bnez t5, .F._bC9qHXNq9fZ_get._7.if.then.1
  j .F._bC9qHXNq9fZ_get._8.if.else.1                                    # ir inst 23 fin
.F._bC9qHXNq9fZ_get._7.if.then.1:
  li t5, 46016
  add t5, a0, t5                                                        # ir inst 24 fin
  lw t4, 0(t5)                                                          # ir inst 25 fin
  addi t3, t4, 1                                                        # ir inst 26 fin
  sw t3, 0(t5)                                                          # ir inst 27 fin
  li a0, -1
  j .F._bC9qHXNq9fZ_get.epilogue                                        # ir inst 28 fin
.F._bC9qHXNq9fZ_get._8.if.else.1:
  j .F._bC9qHXNq9fZ_get._9.if.exit.1                                    # ir inst 29 fin
.F._bC9qHXNq9fZ_get._9.if.exit.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a1, t6
  call .F._bC9qHXNq9fZ_update_usage_order
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 30 fin
  li t5, 46012
  add t5, a0, t5                                                        # ir inst 31 fin
  lw t4, 0(t5)                                                          # ir inst 32 fin
  addi t3, t4, 1                                                        # ir inst 33 fin
  sw t3, 0(t5)                                                          # ir inst 34 fin
  addi t5, a0, 0                                                        # ir inst 35 fin
  mv t4, t6                                                             # ir inst 36 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 37 fin
  lw t5, 0(t6)                                                          # ir inst 38 fin
  mv a0, t5
  j .F._bC9qHXNq9fZ_get.epilogue                                        # ir inst 39 fin
.F._bC9qHXNq9fZ_get.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._bC9qHXNq9fZ_put
.F._bC9qHXNq9fZ_put:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F._bC9qHXNq9fZ_put._0.entry.0:
  li t2, 0
  slt t6, a1, t2                                                        # ir inst 1 fin
  bnez t6, .F._bC9qHXNq9fZ_put._1.lazy.then.0
  j .F._bC9qHXNq9fZ_put._2.lazy.else.0                                  # ir inst 2 fin
.F._bC9qHXNq9fZ_put._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F._bC9qHXNq9fZ_put._3.lazy.exit.0                                  # ir inst 3 fin
.F._bC9qHXNq9fZ_put._2.lazy.else.0:
  li t2, 10000
  slt t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F._bC9qHXNq9fZ_put._3.lazy.exit.0                                  # ir inst 5 fin
.F._bC9qHXNq9fZ_put._3.lazy.exit.0:
  bnez t6, .F._bC9qHXNq9fZ_put._4.if.then.0
  j .F._bC9qHXNq9fZ_put._5.if.else.0                                    # ir inst 7 fin
.F._bC9qHXNq9fZ_put._4.if.then.0:
  j .F._bC9qHXNq9fZ_put.epilogue                                        # ir inst 8 fin
.F._bC9qHXNq9fZ_put._5.if.else.0:
  j .F._bC9qHXNq9fZ_put._6.if.exit.0                                    # ir inst 9 fin
.F._bC9qHXNq9fZ_put._6.if.exit.0:
  li t6, 6000
  add t6, a0, t6                                                        # ir inst 10 fin
  mv t5, a1                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  lw t6, 0(t4)                                                          # ir inst 13 fin
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 14 fin
  bnez t5, .F._bC9qHXNq9fZ_put._7.if.then.1
  j .F._bC9qHXNq9fZ_put._8.if.else.1                                    # ir inst 15 fin
.F._bC9qHXNq9fZ_put._7.if.then.1:
  addi t5, a0, 0                                                        # ir inst 16 fin
  mv t4, t6                                                             # ir inst 17 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 18 fin
  sw a2, 0(t3)                                                          # ir inst 19 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  call .F._bC9qHXNq9fZ_update_usage_order
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 20 fin
  j .F._bC9qHXNq9fZ_put.epilogue                                        # ir inst 21 fin
.F._bC9qHXNq9fZ_put._8.if.else.1:
  j .F._bC9qHXNq9fZ_put._9.if.exit.1                                    # ir inst 22 fin
.F._bC9qHXNq9fZ_put._9.if.exit.1:
  li t6, 46004
  add t6, a0, t6                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  li t6, 46000
  add t6, a0, t6                                                        # ir inst 25 fin
  lw t4, 0(t6)                                                          # ir inst 26 fin
  slt t6, t5, t4                                                        # ir inst 27 fin
  bnez t6, .F._bC9qHXNq9fZ_put._10.if.then.2
  j .F._bC9qHXNq9fZ_put._11.if.else.2                                   # ir inst 28 fin
.F._bC9qHXNq9fZ_put._10.if.then.2:
  li t6, 46004
  add t6, a0, t6                                                        # ir inst 29 fin
  lw t5, 0(t6)                                                          # ir inst 30 fin
  addi t6, a0, 2000                                                     # ir inst 31 fin
  mv t4, t5                                                             # ir inst 32 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 33 fin
  sw a1, 0(t3)                                                          # ir inst 34 fin
  addi t6, a0, 0                                                        # ir inst 35 fin
  mv t4, t5                                                             # ir inst 36 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 37 fin
  sw a2, 0(t3)                                                          # ir inst 38 fin
  li t6, 6000
  add t6, a0, t6                                                        # ir inst 39 fin
  mv t4, a1                                                             # ir inst 40 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 41 fin
  sw t5, 0(t3)                                                          # ir inst 42 fin
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 43 fin
  mv t4, t5                                                             # ir inst 44 fin
  slli t2, t4, 2
  add t5, t6, t2                                                        # ir inst 45 fin
  li t6, 46008
  add t6, a0, t6                                                        # ir inst 46 fin
  lw t4, 0(t6)                                                          # ir inst 47 fin
  sw t4, 0(t5)                                                          # ir inst 48 fin
  li t6, 46004
  add t6, a0, t6                                                        # ir inst 49 fin
  lw t5, 0(t6)                                                          # ir inst 50 fin
  addi t4, t5, 1                                                        # ir inst 51 fin
  sw t4, 0(t6)                                                          # ir inst 52 fin
  j .F._bC9qHXNq9fZ_put._24.if.exit.2                                   # ir inst 53 fin
.F._bC9qHXNq9fZ_put._11.if.else.2:
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 54 fin
  addi t5, t6, 0                                                        # ir inst 55 fin
  lw t6, 0(t5)                                                          # ir inst 56 fin
# Phi connections
  li t4, 1
  li t5, 0
  j .F._bC9qHXNq9fZ_put._12.while.cond.0                                # ir inst 57 fin
.F._bC9qHXNq9fZ_put._12.while.cond.0:
  li t3, 46000
  add t3, a0, t3                                                        # ir inst 61 fin
  lw s11, 0(t3)                                                         # ir inst 62 fin
  slt t3, t4, s11                                                       # ir inst 63 fin
  bnez t3, .F._bC9qHXNq9fZ_put._13.while.body.0
  j .F._bC9qHXNq9fZ_put._17.while.exit.0                                # ir inst 64 fin
.F._bC9qHXNq9fZ_put._13.while.body.0:
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 65 fin
  mv s11, t4                                                            # ir inst 66 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 67 fin
  lw t3, 0(s10)                                                         # ir inst 68 fin
  slt s11, t3, t6                                                       # ir inst 69 fin
  bnez s11, .F._bC9qHXNq9fZ_put._14.if.then.3
  j .F._bC9qHXNq9fZ_put._15.if.else.3                                   # ir inst 70 fin
.F._bC9qHXNq9fZ_put._14.if.then.3:
  li t3, 4000
  add t3, a0, t3                                                        # ir inst 71 fin
  mv s11, t4                                                            # ir inst 72 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 73 fin
  lw t3, 0(s10)                                                         # ir inst 74 fin
# Phi connections
  mv t6, t3
  mv t3, t4
  j .F._bC9qHXNq9fZ_put._16.if.exit.3                                   # ir inst 75 fin
.F._bC9qHXNq9fZ_put._15.if.else.3:
# Phi connections
  mv t3, t5
  j .F._bC9qHXNq9fZ_put._16.if.exit.3                                   # ir inst 76 fin
.F._bC9qHXNq9fZ_put._16.if.exit.3:
  addi s11, t4, 1                                                       # ir inst 79 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F._bC9qHXNq9fZ_put._12.while.cond.0                                # ir inst 80 fin
.F._bC9qHXNq9fZ_put._17.while.exit.0:
  addi t6, a0, 2000                                                     # ir inst 81 fin
  mv t4, t5                                                             # ir inst 82 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 83 fin
  lw t6, 0(t3)                                                          # ir inst 84 fin
  li t2, 0
  slt t0, t6, t2
  xori t4, t0, 1                                                        # ir inst 85 fin
  bnez t4, .F._bC9qHXNq9fZ_put._18.lazy.then.1
  j .F._bC9qHXNq9fZ_put._19.lazy.else.1                                 # ir inst 86 fin
.F._bC9qHXNq9fZ_put._18.lazy.then.1:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 87 fin
# Phi connections
  j .F._bC9qHXNq9fZ_put._20.lazy.exit.1                                 # ir inst 88 fin
.F._bC9qHXNq9fZ_put._19.lazy.else.1:
# Phi connections
  li t4, 0
  j .F._bC9qHXNq9fZ_put._20.lazy.exit.1                                 # ir inst 89 fin
.F._bC9qHXNq9fZ_put._20.lazy.exit.1:
  bnez t4, .F._bC9qHXNq9fZ_put._21.if.then.4
  j .F._bC9qHXNq9fZ_put._22.if.else.4                                   # ir inst 91 fin
.F._bC9qHXNq9fZ_put._21.if.then.4:
  li t4, 6000
  add t4, a0, t4                                                        # ir inst 92 fin
  mv t3, t6                                                             # ir inst 93 fin
  slli t2, t3, 2
  add t6, t4, t2                                                        # ir inst 94 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 95 fin
  j .F._bC9qHXNq9fZ_put._23.if.exit.4                                   # ir inst 96 fin
.F._bC9qHXNq9fZ_put._22.if.else.4:
  j .F._bC9qHXNq9fZ_put._23.if.exit.4                                   # ir inst 97 fin
.F._bC9qHXNq9fZ_put._23.if.exit.4:
  addi t6, a0, 2000                                                     # ir inst 98 fin
  mv t4, t5                                                             # ir inst 99 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 100 fin
  sw a1, 0(t3)                                                          # ir inst 101 fin
  addi t6, a0, 0                                                        # ir inst 102 fin
  mv t4, t5                                                             # ir inst 103 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 104 fin
  sw a2, 0(t3)                                                          # ir inst 105 fin
  li t6, 6000
  add t6, a0, t6                                                        # ir inst 106 fin
  mv t4, a1                                                             # ir inst 107 fin
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 108 fin
  sw t5, 0(t3)                                                          # ir inst 109 fin
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 110 fin
  mv t4, t5                                                             # ir inst 111 fin
  slli t2, t4, 2
  add t5, t6, t2                                                        # ir inst 112 fin
  li t6, 46008
  add t6, a0, t6                                                        # ir inst 113 fin
  lw t4, 0(t6)                                                          # ir inst 114 fin
  sw t4, 0(t5)                                                          # ir inst 115 fin
  j .F._bC9qHXNq9fZ_put._24.if.exit.2                                   # ir inst 116 fin
.F._bC9qHXNq9fZ_put._24.if.exit.2:
  j .F._bC9qHXNq9fZ_put.epilogue                                        # ir inst 117 fin
.F._bC9qHXNq9fZ_put.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F._bC9qHXNq9fZ_update_usage_order
.F._bC9qHXNq9fZ_update_usage_order:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._bC9qHXNq9fZ_update_usage_order._0.entry.0:
  li t6, 4000
  add t6, a0, t6                                                        # ir inst 1 fin
  mv t5, a1                                                             # ir inst 2 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 3 fin
  li t6, 46008
  add t6, a0, t6                                                        # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
  sw t5, 0(t4)                                                          # ir inst 6 fin
  j .F._bC9qHXNq9fZ_update_usage_order.epilogue                         # ir inst 7 fin
.F._bC9qHXNq9fZ_update_usage_order.epilogue:
  ret

.globl .F._bC9qHXNq9fZ_get_cache_statistics
.F._bC9qHXNq9fZ_get_cache_statistics:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._bC9qHXNq9fZ_get_cache_statistics._0.entry.0:
  li t6, 46008
  add t6, a1, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t6, t2, t5                                                        # ir inst 3 fin
  bnez t6, .F._bC9qHXNq9fZ_get_cache_statistics._1.if.then.0
  j .F._bC9qHXNq9fZ_get_cache_statistics._2.if.else.0                   # ir inst 4 fin
.F._bC9qHXNq9fZ_get_cache_statistics._1.if.then.0:
  li t6, 46012
  add t6, a1, t6                                                        # ir inst 5 fin
  lw t5, 0(t6)                                                          # ir inst 6 fin
  li t2, 100
  mul t6, t5, t2                                                        # ir inst 7 fin
  li t5, 46008
  add t5, a1, t5                                                        # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  div t5, t6, t4                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F._bC9qHXNq9fZ_get_cache_statistics._3.if.exit.0                   # ir inst 11 fin
.F._bC9qHXNq9fZ_get_cache_statistics._2.if.else.0:
# Phi connections
  li t6, 0
  j .F._bC9qHXNq9fZ_get_cache_statistics._3.if.exit.0                   # ir inst 12 fin
.F._bC9qHXNq9fZ_get_cache_statistics._3.if.exit.0:
  addi t5, a0, 0                                                        # ir inst 14 fin
  li t4, 46012
  add t4, a1, t4                                                        # ir inst 15 fin
  lw t3, 0(t4)                                                          # ir inst 16 fin
  sw t3, 0(t5)                                                          # ir inst 17 fin
  addi t5, a0, 4                                                        # ir inst 18 fin
  li t4, 46016
  add t4, a1, t4                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  sw t3, 0(t5)                                                          # ir inst 21 fin
  addi t5, a0, 8                                                        # ir inst 22 fin
  li t4, 46008
  add t4, a1, t4                                                        # ir inst 23 fin
  lw t3, 0(t4)                                                          # ir inst 24 fin
  sw t3, 0(t5)                                                          # ir inst 25 fin
  addi t5, a0, 12                                                       # ir inst 26 fin
  sw t6, 0(t5)                                                          # ir inst 27 fin
  addi t6, a0, 16                                                       # ir inst 28 fin
  li t5, 46004
  add t5, a1, t5                                                        # ir inst 29 fin
  lw t4, 0(t5)                                                          # ir inst 30 fin
  sw t4, 0(t6)                                                          # ir inst 31 fin
  j .F._bC9qHXNq9fZ_get_cache_statistics.epilogue                       # ir inst 32 fin
.F._bC9qHXNq9fZ_get_cache_statistics.epilogue:
  ret

.globl .F._5xhK14xBtVu_new
.F._5xhK14xBtVu_new:
# spill func args num: 0,             range:    90048(sp) -    90048(sp)
# local var size: 90024,              range:       16(sp) -    90040(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -90048
  add sp, sp, t0
  sd ra, 8(sp)
.F._5xhK14xBtVu_new._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  addi t5, t6, 0                                                        # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F._5xhK14xBtVu_new._1.array.cond.0                                 # ir inst 4 fin
.F._5xhK14xBtVu_new._1.array.cond.0:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F._5xhK14xBtVu_new._2.array.body.0
  j .F._5xhK14xBtVu_new._3.array.exit.0                                 # ir inst 7 fin
.F._5xhK14xBtVu_new._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F._5xhK14xBtVu_new._1.array.cond.0                                 # ir inst 11 fin
.F._5xhK14xBtVu_new._3.array.exit.0:
  addi t1, sp, 16
  li t6, 40000
  add t6, t1, t6                                                        # ir inst 12 fin
  addi t5, t6, 0                                                        # ir inst 13 fin
# Phi connections
  li t6, 0
  j .F._5xhK14xBtVu_new._4.array.cond.1                                 # ir inst 14 fin
.F._5xhK14xBtVu_new._4.array.cond.1:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 16 fin
  bnez t4, .F._5xhK14xBtVu_new._5.array.body.1
  j .F._5xhK14xBtVu_new._6.array.exit.1                                 # ir inst 17 fin
.F._5xhK14xBtVu_new._5.array.body.1:
  add t4, t5, t6                                                        # ir inst 18 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t4
  j .F._5xhK14xBtVu_new._4.array.cond.1                                 # ir inst 21 fin
.F._5xhK14xBtVu_new._6.array.exit.1:
  addi t1, sp, 16
  li t6, 50000
  add t6, t1, t6                                                        # ir inst 22 fin
  addi t5, t6, 0                                                        # ir inst 23 fin
# Phi connections
  li t6, 0
  j .F._5xhK14xBtVu_new._7.array.cond.2                                 # ir inst 24 fin
.F._5xhK14xBtVu_new._7.array.cond.2:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 26 fin
  bnez t4, .F._5xhK14xBtVu_new._8.array.body.2
  j .F._5xhK14xBtVu_new._9.array.exit.2                                 # ir inst 27 fin
.F._5xhK14xBtVu_new._8.array.body.2:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t4
  j .F._5xhK14xBtVu_new._7.array.cond.2                                 # ir inst 31 fin
.F._5xhK14xBtVu_new._9.array.exit.2:
  addi t1, sp, 16
  li t6, 90000
  add t6, t1, t6                                                        # ir inst 32 fin
  sw a1, 0(t6)                                                          # ir inst 33 fin
  addi t1, sp, 16
  li t6, 90004
  add t6, t1, t6                                                        # ir inst 34 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 35 fin
  addi t1, sp, 16
  li t6, 90008
  add t6, t1, t6                                                        # ir inst 36 fin
  sw a1, 0(t6)                                                          # ir inst 37 fin
  addi t1, sp, 16
  li t6, 90012
  add t6, t1, t6                                                        # ir inst 38 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 39 fin
  addi t1, sp, 16
  li t6, 90016
  add t6, t1, t6                                                        # ir inst 40 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 41 fin
  addi t1, sp, 16
  li t6, 90020
  add t6, t1, t6                                                        # ir inst 42 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 43 fin
  addi t1, sp, 16
  li t6, 50000
  add t6, t1, t6                                                        # ir inst 44 fin
  addi t5, t6, 0                                                        # ir inst 45 fin
  sw a1, 0(t5)                                                          # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 90024
  addi t1, sp, 16
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 47 fin
  j .F._5xhK14xBtVu_new.epilogue                                        # ir inst 48 fin
.F._5xhK14xBtVu_new.epilogue:
  ld ra, 8(sp)
  li t0, 90048
  add sp, sp, t0
  ret

.globl .F._5xhK14xBtVu_allocate
.F._5xhK14xBtVu_allocate:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s10, 24(sp)
  sd s11, 32(sp)
  sd ra, 40(sp)
.F._5xhK14xBtVu_allocate._0.entry.0:
  li t2, 0
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F._5xhK14xBtVu_allocate._1.lazy.then.0
  j .F._5xhK14xBtVu_allocate._2.lazy.else.0                             # ir inst 2 fin
.F._5xhK14xBtVu_allocate._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F._5xhK14xBtVu_allocate._3.lazy.exit.0                             # ir inst 3 fin
.F._5xhK14xBtVu_allocate._2.lazy.else.0:
  li t6, 90008
  add t6, a0, t6                                                        # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
  slt t6, t5, a1                                                        # ir inst 6 fin
# Phi connections
  j .F._5xhK14xBtVu_allocate._3.lazy.exit.0                             # ir inst 7 fin
.F._5xhK14xBtVu_allocate._3.lazy.exit.0:
  bnez t6, .F._5xhK14xBtVu_allocate._4.if.then.0
  j .F._5xhK14xBtVu_allocate._5.if.else.0                               # ir inst 9 fin
.F._5xhK14xBtVu_allocate._4.if.then.0:
  li a0, -1
  j .F._5xhK14xBtVu_allocate.epilogue                                   # ir inst 10 fin
.F._5xhK14xBtVu_allocate._5.if.else.0:
  j .F._5xhK14xBtVu_allocate._6.if.exit.0                               # ir inst 11 fin
.F._5xhK14xBtVu_allocate._6.if.exit.0:
# Phi connections
  li t6, 0
  j .F._5xhK14xBtVu_allocate._7.while.cond.0                            # ir inst 12 fin
.F._5xhK14xBtVu_allocate._7.while.cond.0:
  li t2, 10000
  slt t5, t6, t2                                                        # ir inst 14 fin
  bnez t5, .F._5xhK14xBtVu_allocate._8.while.body.0
  j .F._5xhK14xBtVu_allocate._24.while.exit.0                           # ir inst 15 fin
.F._5xhK14xBtVu_allocate._8.while.body.0:
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 16 fin
  mv t4, t6                                                             # ir inst 17 fin
  add t3, t5, t4                                                        # ir inst 18 fin
  lb t5, 0(t3)                                                          # ir inst 19 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 20 fin
  bnez t4, .F._5xhK14xBtVu_allocate._9.lazy.then.1
  j .F._5xhK14xBtVu_allocate._10.lazy.else.1                            # ir inst 21 fin
.F._5xhK14xBtVu_allocate._9.lazy.then.1:
  li t5, 50000
  add t5, a0, t5                                                        # ir inst 22 fin
  mv t4, t6                                                             # ir inst 23 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 24 fin
  lw t5, 0(t3)                                                          # ir inst 25 fin
  slt t0, t5, a1
  xori t4, t0, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F._5xhK14xBtVu_allocate._11.lazy.exit.1                            # ir inst 27 fin
.F._5xhK14xBtVu_allocate._10.lazy.else.1:
# Phi connections
  li t5, 0
  j .F._5xhK14xBtVu_allocate._11.lazy.exit.1                            # ir inst 28 fin
.F._5xhK14xBtVu_allocate._11.lazy.exit.1:
  bnez t5, .F._5xhK14xBtVu_allocate._12.if.then.1
  j .F._5xhK14xBtVu_allocate._22.if.else.1                              # ir inst 30 fin
.F._5xhK14xBtVu_allocate._12.if.then.1:
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 31 fin
  mv t4, t6                                                             # ir inst 32 fin
  add t3, t5, t4                                                        # ir inst 33 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 34 fin
  addi t5, a0, 0                                                        # ir inst 35 fin
  mv t4, t6                                                             # ir inst 36 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 37 fin
  sw t6, 0(t3)                                                          # ir inst 38 fin
  li t5, 50000
  add t5, a0, t5                                                        # ir inst 39 fin
  mv t4, t6                                                             # ir inst 40 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 41 fin
  lw t5, 0(t3)                                                          # ir inst 42 fin
  slt t4, a1, t5                                                        # ir inst 43 fin
  bnez t4, .F._5xhK14xBtVu_allocate._13.if.then.2
  j .F._5xhK14xBtVu_allocate._20.if.else.2                              # ir inst 44 fin
.F._5xhK14xBtVu_allocate._13.if.then.2:
  li t5, 50000
  add t5, a0, t5                                                        # ir inst 45 fin
  mv t4, t6                                                             # ir inst 46 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 47 fin
  lw t5, 0(t3)                                                          # ir inst 48 fin
  sub t4, t5, a1                                                        # ir inst 49 fin
  li t5, 50000
  add t5, a0, t5                                                        # ir inst 50 fin
  mv t3, t6                                                             # ir inst 51 fin
  slli t2, t3, 2
  add s11, t5, t2                                                       # ir inst 52 fin
  sw a1, 0(s11)                                                         # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F._5xhK14xBtVu_allocate._14.while.cond.1                           # ir inst 54 fin
.F._5xhK14xBtVu_allocate._14.while.cond.1:
  li t2, 10000
  slt t3, t5, t2                                                        # ir inst 56 fin
  bnez t3, .F._5xhK14xBtVu_allocate._15.while.body.1
  j .F._5xhK14xBtVu_allocate._25.critical_edge.0                        # ir inst 57 fin
.F._5xhK14xBtVu_allocate._15.while.body.1:
  li t3, 50000
  add t3, a0, t3                                                        # ir inst 58 fin
  mv s11, t5                                                            # ir inst 59 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 60 fin
  lw t3, 0(s10)                                                         # ir inst 61 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 62 fin
  bnez s11, .F._5xhK14xBtVu_allocate._16.if.then.3
  j .F._5xhK14xBtVu_allocate._17.if.else.3                              # ir inst 63 fin
.F._5xhK14xBtVu_allocate._16.if.then.3:
  li t3, 50000
  add t3, a0, t3                                                        # ir inst 64 fin
  mv s11, t5                                                            # ir inst 65 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 66 fin
  sw t4, 0(s10)                                                         # ir inst 67 fin
  j .F._5xhK14xBtVu_allocate._19.while.exit.1                           # ir inst 68 fin
.F._5xhK14xBtVu_allocate._17.if.else.3:
  j .F._5xhK14xBtVu_allocate._18.if.exit.3                              # ir inst 69 fin
.F._5xhK14xBtVu_allocate._18.if.exit.3:
  addi t3, t5, 1                                                        # ir inst 70 fin
# Phi connections
  mv t5, t3
  j .F._5xhK14xBtVu_allocate._14.while.cond.1                           # ir inst 71 fin
.F._5xhK14xBtVu_allocate._19.while.exit.1:
  j .F._5xhK14xBtVu_allocate._21.if.exit.2                              # ir inst 72 fin
.F._5xhK14xBtVu_allocate._20.if.else.2:
  j .F._5xhK14xBtVu_allocate._21.if.exit.2                              # ir inst 73 fin
.F._5xhK14xBtVu_allocate._21.if.exit.2:
  li t5, 90004
  add t5, a0, t5                                                        # ir inst 74 fin
  lw t4, 0(t5)                                                          # ir inst 75 fin
  add t3, t4, a1                                                        # ir inst 76 fin
  sw t3, 0(t5)                                                          # ir inst 77 fin
  li t5, 90008
  add t5, a0, t5                                                        # ir inst 78 fin
  lw t4, 0(t5)                                                          # ir inst 79 fin
  sub t3, t4, a1                                                        # ir inst 80 fin
  sw t3, 0(t5)                                                          # ir inst 81 fin
  li t5, 90012
  add t5, a0, t5                                                        # ir inst 82 fin
  lw t4, 0(t5)                                                          # ir inst 83 fin
  addi t3, t4, 1                                                        # ir inst 84 fin
  sw t3, 0(t5)                                                          # ir inst 85 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  call .F._5xhK14xBtVu_calculate_fragmentation
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 86 fin
  mv a0, t6
  j .F._5xhK14xBtVu_allocate.epilogue                                   # ir inst 87 fin
.F._5xhK14xBtVu_allocate._22.if.else.1:
  j .F._5xhK14xBtVu_allocate._23.if.exit.1                              # ir inst 88 fin
.F._5xhK14xBtVu_allocate._23.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 89 fin
# Phi connections
  mv t6, t5
  j .F._5xhK14xBtVu_allocate._7.while.cond.0                            # ir inst 90 fin
.F._5xhK14xBtVu_allocate._24.while.exit.0:
  li a0, -1
  j .F._5xhK14xBtVu_allocate.epilogue                                   # ir inst 91 fin
.F._5xhK14xBtVu_allocate._25.critical_edge.0:
  j .F._5xhK14xBtVu_allocate._19.while.exit.1                           # ir inst 92 fin
.F._5xhK14xBtVu_allocate.epilogue:
  ld ra, 40(sp)
  ld s10, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F._5xhK14xBtVu_deallocate
.F._5xhK14xBtVu_deallocate:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F._5xhK14xBtVu_deallocate._0.entry.0:
  li t2, 0
  slt t6, a1, t2                                                        # ir inst 1 fin
  bnez t6, .F._5xhK14xBtVu_deallocate._1.lazy.then.0
  j .F._5xhK14xBtVu_deallocate._2.lazy.else.0                           # ir inst 2 fin
.F._5xhK14xBtVu_deallocate._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F._5xhK14xBtVu_deallocate._3.lazy.exit.0                           # ir inst 3 fin
.F._5xhK14xBtVu_deallocate._2.lazy.else.0:
  li t2, 10000
  slt t0, a1, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F._5xhK14xBtVu_deallocate._3.lazy.exit.0                           # ir inst 5 fin
.F._5xhK14xBtVu_deallocate._3.lazy.exit.0:
  bnez t6, .F._5xhK14xBtVu_deallocate._4.lazy.then.1
  j .F._5xhK14xBtVu_deallocate._5.lazy.else.1                           # ir inst 7 fin
.F._5xhK14xBtVu_deallocate._4.lazy.then.1:
# Phi connections
  li t6, 1
  j .F._5xhK14xBtVu_deallocate._6.lazy.exit.1                           # ir inst 8 fin
.F._5xhK14xBtVu_deallocate._5.lazy.else.1:
  li t6, 40000
  add t6, a0, t6                                                        # ir inst 9 fin
  mv t5, a1                                                             # ir inst 10 fin
  add t4, t6, t5                                                        # ir inst 11 fin
  lb t6, 0(t4)                                                          # ir inst 12 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 13 fin
# Phi connections
  mv t6, t5
  j .F._5xhK14xBtVu_deallocate._6.lazy.exit.1                           # ir inst 14 fin
.F._5xhK14xBtVu_deallocate._6.lazy.exit.1:
  bnez t6, .F._5xhK14xBtVu_deallocate._7.if.then.0
  j .F._5xhK14xBtVu_deallocate._8.if.else.0                             # ir inst 16 fin
.F._5xhK14xBtVu_deallocate._7.if.then.0:
  li a0, 0
  j .F._5xhK14xBtVu_deallocate.epilogue                                 # ir inst 17 fin
.F._5xhK14xBtVu_deallocate._8.if.else.0:
  j .F._5xhK14xBtVu_deallocate._9.if.exit.0                             # ir inst 18 fin
.F._5xhK14xBtVu_deallocate._9.if.exit.0:
  li t6, 50000
  add t6, a0, t6                                                        # ir inst 19 fin
  mv t5, a1                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 21 fin
  lw t6, 0(t4)                                                          # ir inst 22 fin
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 23 fin
  mv t4, a1                                                             # ir inst 24 fin
  add t3, t5, t4                                                        # ir inst 25 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 26 fin
  li t5, 90004
  add t5, a0, t5                                                        # ir inst 27 fin
  lw t4, 0(t5)                                                          # ir inst 28 fin
  sub t3, t4, t6                                                        # ir inst 29 fin
  sw t3, 0(t5)                                                          # ir inst 30 fin
  li t5, 90008
  add t5, a0, t5                                                        # ir inst 31 fin
  lw t4, 0(t5)                                                          # ir inst 32 fin
  add t3, t4, t6                                                        # ir inst 33 fin
  sw t3, 0(t5)                                                          # ir inst 34 fin
  li t6, 90016
  add t6, a0, t6                                                        # ir inst 35 fin
  lw t5, 0(t6)                                                          # ir inst 36 fin
  addi t4, t5, 1                                                        # ir inst 37 fin
  sw t4, 0(t6)                                                          # ir inst 38 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._5xhK14xBtVu_coalesce_free_blocks
  ld a0, 0(sp)
# ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  call .F._5xhK14xBtVu_calculate_fragmentation
  ld a0, 0(sp)
# ir inst 40 fin
  li a0, 1
  j .F._5xhK14xBtVu_deallocate.epilogue                                 # ir inst 41 fin
.F._5xhK14xBtVu_deallocate.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._5xhK14xBtVu_coalesce_free_blocks
.F._5xhK14xBtVu_coalesce_free_blocks:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F._5xhK14xBtVu_coalesce_free_blocks._0.entry.0:
# Phi connections
  li t6, 0
  j .F._5xhK14xBtVu_coalesce_free_blocks._1.while.cond.0                # ir inst 1 fin
.F._5xhK14xBtVu_coalesce_free_blocks._1.while.cond.0:
  li t2, 9999
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F._5xhK14xBtVu_coalesce_free_blocks._2.while.body.0
  j .F._5xhK14xBtVu_coalesce_free_blocks._9.while.exit.0                # ir inst 4 fin
.F._5xhK14xBtVu_coalesce_free_blocks._2.while.body.0:
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 5 fin
  mv t4, t6                                                             # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  lb t5, 0(t3)                                                          # ir inst 8 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F._5xhK14xBtVu_coalesce_free_blocks._3.lazy.then.0
  j .F._5xhK14xBtVu_coalesce_free_blocks._4.lazy.else.0                 # ir inst 10 fin
.F._5xhK14xBtVu_coalesce_free_blocks._3.lazy.then.0:
  li t5, 40000
  add t5, a0, t5                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
  mv t3, t4                                                             # ir inst 13 fin
  add t4, t5, t3                                                        # ir inst 14 fin
  lb t5, 0(t4)                                                          # ir inst 15 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F._5xhK14xBtVu_coalesce_free_blocks._5.lazy.exit.0                 # ir inst 17 fin
.F._5xhK14xBtVu_coalesce_free_blocks._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F._5xhK14xBtVu_coalesce_free_blocks._5.lazy.exit.0                 # ir inst 18 fin
.F._5xhK14xBtVu_coalesce_free_blocks._5.lazy.exit.0:
  bnez t5, .F._5xhK14xBtVu_coalesce_free_blocks._6.if.then.0
  j .F._5xhK14xBtVu_coalesce_free_blocks._7.if.else.0                   # ir inst 20 fin
.F._5xhK14xBtVu_coalesce_free_blocks._6.if.then.0:
  li t5, 50000
  add t5, a0, t5                                                        # ir inst 21 fin
  mv t4, t6                                                             # ir inst 22 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 23 fin
  lw t5, 0(t3)                                                          # ir inst 24 fin
  li t4, 50000
  add t4, a0, t4                                                        # ir inst 25 fin
  addi s11, t6, 1                                                       # ir inst 26 fin
  mv s10, s11                                                           # ir inst 27 fin
  slli t2, s10, 2
  add s11, t4, t2                                                       # ir inst 28 fin
  lw t4, 0(s11)                                                         # ir inst 29 fin
  add s11, t5, t4                                                       # ir inst 30 fin
  sw s11, 0(t3)                                                         # ir inst 31 fin
  li t5, 50000
  add t5, a0, t5                                                        # ir inst 32 fin
  addi t4, t6, 1                                                        # ir inst 33 fin
  mv t3, t4                                                             # ir inst 34 fin
  slli t2, t3, 2
  add t4, t5, t2                                                        # ir inst 35 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 36 fin
  j .F._5xhK14xBtVu_coalesce_free_blocks._8.if.exit.0                   # ir inst 37 fin
.F._5xhK14xBtVu_coalesce_free_blocks._7.if.else.0:
  j .F._5xhK14xBtVu_coalesce_free_blocks._8.if.exit.0                   # ir inst 38 fin
.F._5xhK14xBtVu_coalesce_free_blocks._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F._5xhK14xBtVu_coalesce_free_blocks._1.while.cond.0                # ir inst 40 fin
.F._5xhK14xBtVu_coalesce_free_blocks._9.while.exit.0:
  j .F._5xhK14xBtVu_coalesce_free_blocks.epilogue                       # ir inst 41 fin
.F._5xhK14xBtVu_coalesce_free_blocks.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F._5xhK14xBtVu_calculate_fragmentation
.F._5xhK14xBtVu_calculate_fragmentation:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F._5xhK14xBtVu_calculate_fragmentation._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F._5xhK14xBtVu_calculate_fragmentation._1.while.cond.0             # ir inst 1 fin
.F._5xhK14xBtVu_calculate_fragmentation._1.while.cond.0:
  li t2, 10000
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F._5xhK14xBtVu_calculate_fragmentation._2.while.body.0
  j .F._5xhK14xBtVu_calculate_fragmentation._12.while.exit.0            # ir inst 5 fin
.F._5xhK14xBtVu_calculate_fragmentation._2.while.body.0:
  li t4, 40000
  add t4, a0, t4                                                        # ir inst 6 fin
  mv t3, t6                                                             # ir inst 7 fin
  add s11, t4, t3                                                       # ir inst 8 fin
  lb t4, 0(s11)                                                         # ir inst 9 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 10 fin
  bnez t3, .F._5xhK14xBtVu_calculate_fragmentation._3.lazy.then.0
  j .F._5xhK14xBtVu_calculate_fragmentation._4.lazy.else.0              # ir inst 11 fin
.F._5xhK14xBtVu_calculate_fragmentation._3.lazy.then.0:
  li t4, 50000
  add t4, a0, t4                                                        # ir inst 12 fin
  mv t3, t6                                                             # ir inst 13 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 14 fin
  lw t4, 0(s11)                                                         # ir inst 15 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 16 fin
# Phi connections
  mv t4, t3
  j .F._5xhK14xBtVu_calculate_fragmentation._5.lazy.exit.0              # ir inst 17 fin
.F._5xhK14xBtVu_calculate_fragmentation._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F._5xhK14xBtVu_calculate_fragmentation._5.lazy.exit.0              # ir inst 18 fin
.F._5xhK14xBtVu_calculate_fragmentation._5.lazy.exit.0:
  bnez t4, .F._5xhK14xBtVu_calculate_fragmentation._6.if.then.0
  j .F._5xhK14xBtVu_calculate_fragmentation._10.if.else.0               # ir inst 20 fin
.F._5xhK14xBtVu_calculate_fragmentation._6.if.then.0:
  li t4, 50000
  add t4, a0, t4                                                        # ir inst 21 fin
  mv t3, t6                                                             # ir inst 22 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 23 fin
  lw t4, 0(s11)                                                         # ir inst 24 fin
  slt t3, t5, t4                                                        # ir inst 25 fin
  bnez t3, .F._5xhK14xBtVu_calculate_fragmentation._7.if.then.1
  j .F._5xhK14xBtVu_calculate_fragmentation._8.if.else.1                # ir inst 26 fin
.F._5xhK14xBtVu_calculate_fragmentation._7.if.then.1:
  li t4, 50000
  add t4, a0, t4                                                        # ir inst 27 fin
  mv t3, t6                                                             # ir inst 28 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 29 fin
  lw t4, 0(s11)                                                         # ir inst 30 fin
# Phi connections
  j .F._5xhK14xBtVu_calculate_fragmentation._9.if.exit.1                # ir inst 31 fin
.F._5xhK14xBtVu_calculate_fragmentation._8.if.else.1:
# Phi connections
  mv t4, t5
  j .F._5xhK14xBtVu_calculate_fragmentation._9.if.exit.1                # ir inst 32 fin
.F._5xhK14xBtVu_calculate_fragmentation._9.if.exit.1:
# Phi connections
  j .F._5xhK14xBtVu_calculate_fragmentation._11.if.exit.0               # ir inst 34 fin
.F._5xhK14xBtVu_calculate_fragmentation._10.if.else.0:
# Phi connections
  mv t4, t5
  j .F._5xhK14xBtVu_calculate_fragmentation._11.if.exit.0               # ir inst 35 fin
.F._5xhK14xBtVu_calculate_fragmentation._11.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F._5xhK14xBtVu_calculate_fragmentation._1.while.cond.0             # ir inst 38 fin
.F._5xhK14xBtVu_calculate_fragmentation._12.while.exit.0:
  li t6, 90008
  add t6, a0, t6                                                        # ir inst 39 fin
  lw t4, 0(t6)                                                          # ir inst 40 fin
  li t2, 0
  slt t6, t2, t4                                                        # ir inst 41 fin
  bnez t6, .F._5xhK14xBtVu_calculate_fragmentation._13.if.then.2
  j .F._5xhK14xBtVu_calculate_fragmentation._14.if.else.2               # ir inst 42 fin
.F._5xhK14xBtVu_calculate_fragmentation._13.if.then.2:
  li t6, 90020
  add t6, a0, t6                                                        # ir inst 43 fin
  li t2, 100
  mul t4, t5, t2                                                        # ir inst 44 fin
  li t5, 90008
  add t5, a0, t5                                                        # ir inst 45 fin
  lw t3, 0(t5)                                                          # ir inst 46 fin
  div t5, t4, t3                                                        # ir inst 47 fin
  li t1, 100
  sub t4, t1, t5                                                        # ir inst 48 fin
  sw t4, 0(t6)                                                          # ir inst 49 fin
  j .F._5xhK14xBtVu_calculate_fragmentation._15.if.exit.2               # ir inst 50 fin
.F._5xhK14xBtVu_calculate_fragmentation._14.if.else.2:
  li t6, 90020
  add t6, a0, t6                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 52 fin
  j .F._5xhK14xBtVu_calculate_fragmentation._15.if.exit.2               # ir inst 53 fin
.F._5xhK14xBtVu_calculate_fragmentation._15.if.exit.2:
  j .F._5xhK14xBtVu_calculate_fragmentation.epilogue                    # ir inst 54 fin
.F._5xhK14xBtVu_calculate_fragmentation.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F._5xhK14xBtVu_get_memory_statistics
.F._5xhK14xBtVu_get_memory_statistics:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._5xhK14xBtVu_get_memory_statistics._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t5, 90004
  add t5, a1, t5                                                        # ir inst 2 fin
  lw t4, 0(t5)                                                          # ir inst 3 fin
  sw t4, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 4                                                        # ir inst 5 fin
  li t5, 90008
  add t5, a1, t5                                                        # ir inst 6 fin
  lw t4, 0(t5)                                                          # ir inst 7 fin
  sw t4, 0(t6)                                                          # ir inst 8 fin
  addi t6, a0, 8                                                        # ir inst 9 fin
  li t5, 90012
  add t5, a1, t5                                                        # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  sw t4, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 12                                                       # ir inst 13 fin
  li t5, 90016
  add t5, a1, t5                                                        # ir inst 14 fin
  lw t4, 0(t5)                                                          # ir inst 15 fin
  sw t4, 0(t6)                                                          # ir inst 16 fin
  addi t6, a0, 16                                                       # ir inst 17 fin
  li t5, 90020
  add t5, a1, t5                                                        # ir inst 18 fin
  lw t4, 0(t5)                                                          # ir inst 19 fin
  sw t4, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 20                                                       # ir inst 21 fin
  li t5, 90000
  add t5, a1, t5                                                        # ir inst 22 fin
  lw t4, 0(t5)                                                          # ir inst 23 fin
  sw t4, 0(t6)                                                          # ir inst 24 fin
  j .F._5xhK14xBtVu_get_memory_statistics.epilogue                      # ir inst 25 fin
.F._5xhK14xBtVu_get_memory_statistics.epilogue:
  ret

.globl main
main:
# spill func args num: 0,             range:   404224(sp) -   404224(sp)
# local var size: 404148,             range:       72(sp) -   404220(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -404224
  add sp, sp, t0
  sd s8, 32(sp)
  sd s9, 40(sp)
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
main._0.entry.0:
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F._7GLwwskssmg_new
# ir inst 2 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 3 fin
# Phi connections
  li t5, 0
  j main._1.while.cond.0                                                # ir inst 4 fin
main._1.while.cond.0:
  slt t4, t5, t6                                                        # ir inst 6 fin
  bnez t4, main._2.while.body.0
  j main._15.while.exit.0                                               # ir inst 7 fin
main._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 8 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 9 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call getInt
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
  li t2, 1
  xor t0, t4, t2
  sltiu s10, t0, 1                                                      # ir inst 11 fin
  bnez s10, main._3.if.then.0
  j main._4.if.else.0                                                   # ir inst 12 fin
main._3.if.then.0:
  addi t1, sp, 72
  li s10, 96004
  add s10, t1, s10                                                      # ir inst 13 fin
  addi t1, sp, 72
  li s9, 96004
  add s9, t1, s9                                                        # ir inst 14 fin
  lw s8, 0(s9)                                                          # ir inst 15 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, s11
  mv a2, t3
  mv a1, s8
  addi t1, sp, 72
  mv a0, t1
  call .F._7GLwwskssmg_insert
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 16 fin
  sw s9, 0(s10)                                                         # ir inst 17 fin
  j main._14.if.exit.0                                                  # ir inst 18 fin
main._4.if.else.0:
  li t2, 2
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 19 fin
  bnez s11, main._5.if.then.1
  j main._6.if.else.1                                                   # ir inst 20 fin
main._5.if.then.1:
  addi t1, sp, 72
  li s11, 96004
  add s11, t1, s11                                                      # ir inst 21 fin
  addi t1, sp, 72
  li s10, 96004
  add s10, t1, s10                                                      # ir inst 22 fin
  lw s9, 0(s10)                                                         # ir inst 23 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t3
  mv a1, s9
  addi t1, sp, 72
  mv a0, t1
  call .F._7GLwwskssmg_delete_node
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 24 fin
  sw s10, 0(s11)                                                        # ir inst 25 fin
  j main._13.if.exit.1                                                  # ir inst 26 fin
main._6.if.else.1:
  li t2, 3
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 27 fin
  bnez s11, main._7.if.then.2
  j main._11.if.else.2                                                  # ir inst 28 fin
main._7.if.then.2:
  addi t1, sp, 72
  li t4, 96004
  add t4, t1, t4                                                        # ir inst 29 fin
  lw s11, 0(t4)                                                         # ir inst 30 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t3
  mv a1, s11
  addi t1, sp, 72
  mv a0, t1
  call .F._7GLwwskssmg_search
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 31 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 32 fin
  bnez t3, main._8.if.then.3
  j main._9.if.else.3                                                   # ir inst 33 fin
main._8.if.then.3:
  addi t1, sp, 72
  addi t3, t1, 0                                                        # ir inst 34 fin
  mv s11, t4                                                            # ir inst 35 fin
  li t1, 48
  mul t2, s11, t1
  add t4, t3, t2                                                        # ir inst 36 fin
  addi t3, t4, 0                                                        # ir inst 37 fin
  lw t4, 0(t3)                                                          # ir inst 38 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 39 fin
  j main._10.if.exit.3                                                  # ir inst 40 fin
main._9.if.else.3:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  li a0, -1
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 41 fin
  j main._10.if.exit.3                                                  # ir inst 42 fin
main._10.if.exit.3:
  j main._12.if.exit.2                                                  # ir inst 43 fin
main._11.if.else.2:
  j main._12.if.exit.2                                                  # ir inst 44 fin
main._12.if.exit.2:
  j main._13.if.exit.1                                                  # ir inst 45 fin
main._13.if.exit.1:
  j main._14.if.exit.0                                                  # ir inst 46 fin
main._14.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 47 fin
# Phi connections
  mv t5, t4
  j main._1.while.cond.0                                                # ir inst 48 fin
main._15.while.exit.0:
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 49 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  li t1, 104104
  add t1, sp, t1
  mv a0, t1
  call .F._83laIxrrFTG_new
  ld t6, 0(sp)
# ir inst 51 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 52 fin
# Phi connections
  li t5, 0
  j main._16.while.cond.1                                               # ir inst 53 fin
main._16.while.cond.1:
  slt t4, t5, t6                                                        # ir inst 55 fin
  bnez t4, main._17.while.body.1
  j main._30.while.exit.1                                               # ir inst 56 fin
main._17.while.body.1:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 57 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 58 fin
  li t2, 1
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 59 fin
  bnez s11, main._18.if.then.4
  j main._19.if.else.4                                                  # ir inst 60 fin
main._18.if.then.4:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call getInt
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 61 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, s11
  mv a1, t3
  li t1, 104104
  add t1, sp, t1
  mv a0, t1
  call .F._83laIxrrFTG_insert
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 62 fin
  j main._29.if.exit.4                                                  # ir inst 63 fin
main._19.if.else.4:
  li t2, 2
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 64 fin
  bnez s11, main._20.if.then.5
  j main._21.if.else.5                                                  # ir inst 65 fin
main._20.if.then.5:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  li t1, 104104
  add t1, sp, t1
  mv a0, t1
  call .F._83laIxrrFTG_search
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 66 fin
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
# ir inst 67 fin
  j main._28.if.exit.5                                                  # ir inst 68 fin
main._21.if.else.5:
  li t2, 3
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 69 fin
  bnez s11, main._22.if.then.6
  j main._26.if.else.6                                                  # ir inst 70 fin
main._22.if.then.6:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  li t1, 104104
  add t1, sp, t1
  mv a0, t1
  call .F._83laIxrrFTG_delete
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 71 fin
  bnez t4, main._23.if.then.7
  j main._24.if.else.7                                                  # ir inst 72 fin
main._23.if.then.7:
# Phi connections
  li t4, 1
  j main._25.if.exit.7                                                  # ir inst 73 fin
main._24.if.else.7:
# Phi connections
  li t4, 0
  j main._25.if.exit.7                                                  # ir inst 74 fin
main._25.if.exit.7:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 76 fin
  j main._27.if.exit.6                                                  # ir inst 77 fin
main._26.if.else.6:
  j main._27.if.exit.6                                                  # ir inst 78 fin
main._27.if.exit.6:
  j main._28.if.exit.5                                                  # ir inst 79 fin
main._28.if.exit.5:
  j main._29.if.exit.4                                                  # ir inst 80 fin
main._29.if.exit.4:
  addi t4, t5, 1                                                        # ir inst 81 fin
# Phi connections
  mv t5, t4
  j main._16.while.cond.1                                               # ir inst 82 fin
main._30.while.exit.1:
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 83 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  li t1, 268132
  add t1, sp, t1
  mv a0, t1
  call .F._bC9qHXNq9fZ_new
  ld t6, 0(sp)
# ir inst 85 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 86 fin
# Phi connections
  li t5, 0
  j main._31.while.cond.2                                               # ir inst 87 fin
main._31.while.cond.2:
  slt t4, t5, t6                                                        # ir inst 89 fin
  bnez t4, main._32.while.body.2
  j main._39.while.exit.2                                               # ir inst 90 fin
main._32.while.body.2:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 91 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 92 fin
  li t2, 1
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 93 fin
  bnez s11, main._33.if.then.8
  j main._34.if.else.8                                                  # ir inst 94 fin
main._33.if.then.8:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call getInt
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 95 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, s11
  mv a1, t3
  li t1, 268132
  add t1, sp, t1
  mv a0, t1
  call .F._bC9qHXNq9fZ_put
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 96 fin
  j main._38.if.exit.8                                                  # ir inst 97 fin
main._34.if.else.8:
  li t2, 2
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 98 fin
  bnez s11, main._35.if.then.9
  j main._36.if.else.9                                                  # ir inst 99 fin
main._35.if.then.9:
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  li t1, 268132
  add t1, sp, t1
  mv a0, t1
  call .F._bC9qHXNq9fZ_get
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 100 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 101 fin
  j main._37.if.exit.9                                                  # ir inst 102 fin
main._36.if.else.9:
  j main._37.if.exit.9                                                  # ir inst 103 fin
main._37.if.exit.9:
  j main._38.if.exit.8                                                  # ir inst 104 fin
main._38.if.exit.8:
  addi t4, t5, 1                                                        # ir inst 105 fin
# Phi connections
  mv t5, t4
  j main._31.while.cond.2                                               # ir inst 106 fin
main._39.while.exit.2:
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 107 fin
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  li t1, 314152
  add t1, sp, t1
  mv a0, t1
  call .F._5xhK14xBtVu_new
  ld t6, 0(sp)
# ir inst 109 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 110 fin
# Phi connections
  li t5, 0
  j main._40.while.cond.3                                               # ir inst 111 fin
main._40.while.cond.3:
  slt t4, t5, t6                                                        # ir inst 113 fin
  bnez t4, main._41.while.body.3
  j main._51.while.exit.3                                               # ir inst 114 fin
main._41.while.body.3:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 115 fin
  li t2, 1
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 116 fin
  bnez t3, main._42.if.then.10
  j main._43.if.else.10                                                 # ir inst 117 fin
main._42.if.then.10:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 118 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  li t1, 314152
  add t1, sp, t1
  mv a0, t1
  call .F._5xhK14xBtVu_allocate
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 119 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, s11
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 120 fin
  j main._50.if.exit.10                                                 # ir inst 121 fin
main._43.if.else.10:
  li t2, 2
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 122 fin
  bnez t3, main._44.if.then.11
  j main._48.if.else.11                                                 # ir inst 123 fin
main._44.if.then.11:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  call getInt
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 124 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  li t1, 314152
  add t1, sp, t1
  mv a0, t1
  call .F._5xhK14xBtVu_deallocate
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 125 fin
  bnez t3, main._45.if.then.12
  j main._46.if.else.12                                                 # ir inst 126 fin
main._45.if.then.12:
# Phi connections
  li t4, 1
  j main._47.if.exit.12                                                 # ir inst 127 fin
main._46.if.else.12:
# Phi connections
  li t4, 0
  j main._47.if.exit.12                                                 # ir inst 128 fin
main._47.if.exit.12:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 130 fin
  j main._49.if.exit.11                                                 # ir inst 131 fin
main._48.if.else.11:
  j main._49.if.exit.11                                                 # ir inst 132 fin
main._49.if.exit.11:
  j main._50.if.exit.10                                                 # ir inst 133 fin
main._50.if.exit.10:
  addi t4, t5, 1                                                        # ir inst 134 fin
# Phi connections
  mv t5, t4
  j main._40.while.cond.3                                               # ir inst 135 fin
main._51.while.exit.3:
  addi t1, sp, 72
  li t6, 96000
  add t6, t1, t6                                                        # ir inst 136 fin
  lw t5, 0(t6)                                                          # ir inst 137 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 138 fin
  addi t1, sp, 72
  li t6, 104024
  add t6, t1, t6                                                        # ir inst 139 fin
  lw t5, 0(t6)                                                          # ir inst 140 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 141 fin
  addi t1, sp, 72
  li t6, 104028
  add t6, t1, t6                                                        # ir inst 142 fin
  lw t5, 0(t6)                                                          # ir inst 143 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 144 fin
  li t1, 104104
  add t1, sp, t1
  li t6, 164004
  add t6, t1, t6                                                        # ir inst 145 fin
  lw t5, 0(t6)                                                          # ir inst 146 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 147 fin
  li t1, 104104
  add t1, sp, t1
  li t6, 164008
  add t6, t1, t6                                                        # ir inst 148 fin
  lw t5, 0(t6)                                                          # ir inst 149 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 150 fin
  li t1, 104104
  add t1, sp, t1
  li t6, 164012
  add t6, t1, t6                                                        # ir inst 151 fin
  lw t5, 0(t6)                                                          # ir inst 152 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 153 fin
# Start call preparation
  li t1, 268132
  add t1, sp, t1
  mv a1, t1
  li t1, 404176
  add t1, sp, t1
  mv a0, t1
  call .F._bC9qHXNq9fZ_get_cache_statistics
# ir inst 155 fin
# Phi connections
  li t6, 0
  j main._52.while.cond.4                                               # ir inst 156 fin
main._52.while.cond.4:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 158 fin
  bnez t5, main._53.while.body.4
  j main._54.while.exit.4                                               # ir inst 159 fin
main._53.while.body.4:
  mv t5, t6                                                             # ir inst 160 fin
  slli t2, t5, 2
  li t1, 404176
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 161 fin
  lw t5, 0(t4)                                                          # ir inst 162 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 163 fin
  addi t5, t6, 1                                                        # ir inst 164 fin
# Phi connections
  mv t6, t5
  j main._52.while.cond.4                                               # ir inst 165 fin
main._54.while.exit.4:
# Start call preparation
  li t1, 314152
  add t1, sp, t1
  mv a1, t1
  li t1, 404196
  add t1, sp, t1
  mv a0, t1
  call .F._5xhK14xBtVu_get_memory_statistics
# ir inst 167 fin
# Phi connections
  li t6, 0
  j main._55.while.cond.5                                               # ir inst 168 fin
main._55.while.cond.5:
  li t2, 6
  slt t5, t6, t2                                                        # ir inst 170 fin
  bnez t5, main._56.while.body.5
  j main._57.while.exit.5                                               # ir inst 171 fin
main._56.while.body.5:
  mv t5, t6                                                             # ir inst 172 fin
  slli t2, t5, 2
  li t1, 404196
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 173 fin
  lw t5, 0(t4)                                                          # ir inst 174 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 175 fin
  addi t5, t6, 1                                                        # ir inst 176 fin
# Phi connections
  mv t6, t5
  j main._55.while.cond.5                                               # ir inst 177 fin
main._57.while.exit.5:
  addi t1, sp, 72
  li t6, 96000
  add t6, t1, t6                                                        # ir inst 178 fin
  lw t5, 0(t6)                                                          # ir inst 179 fin
  li t2, 10
  mul t6, t5, t2                                                        # ir inst 180 fin
  addi t1, sp, 72
  li t5, 104024
  add t5, t1, t5                                                        # ir inst 181 fin
  lw t4, 0(t5)                                                          # ir inst 182 fin
  add t5, t6, t4                                                        # ir inst 183 fin
  li t1, 104104
  add t1, sp, t1
  li t6, 164004
  add t6, t1, t6                                                        # ir inst 184 fin
  lw t4, 0(t6)                                                          # ir inst 185 fin
  li t2, 5
  mul t6, t4, t2                                                        # ir inst 186 fin
  li t1, 104104
  add t1, sp, t1
  li t4, 164008
  add t4, t1, t4                                                        # ir inst 187 fin
  lw t3, 0(t4)                                                          # ir inst 188 fin
  add t4, t6, t3                                                        # ir inst 189 fin
  li t1, 404176
  add t1, sp, t1
  addi t6, t1, 12                                                       # ir inst 190 fin
  lw t3, 0(t6)                                                          # ir inst 191 fin
  li t1, 404196
  add t1, sp, t1
  addi t6, t1, 16                                                       # ir inst 192 fin
  lw s11, 0(t6)                                                         # ir inst 193 fin
  li t1, 100
  sub t6, t1, s11                                                       # ir inst 194 fin
  add s11, t5, t4                                                       # ir inst 195 fin
  add t5, s11, t3                                                       # ir inst 196 fin
  add t4, t5, t6                                                        # ir inst 197 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 198 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 199 fin
  j main.epilogue                                                       # ir inst 200 fin
main.epilogue:
  ld ra, 64(sp)
  ld s8, 32(sp)
  ld s9, 40(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  li t0, 404224
  add sp, sp, t0
  ret
