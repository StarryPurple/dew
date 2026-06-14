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

.globl .F.setup_scene
.F.setup_scene:
# spill func args num: 0,             range:      176(sp) -      176(sp)
# local var size: 144,                range:       32(sp) -      176(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -176
  sd ra, 24(sp)
.F.setup_scene._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t1, sp, 32
  addi t5, t1, 0                                                        # ir inst 3 fin
  addi t4, t5, 0                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 5 fin
  addi t4, t5, 4                                                        # ir inst 6 fin
  li t1, -80
  sw t1, 0(t4)                                                          # ir inst 7 fin
  addi t4, t5, 8                                                        # ir inst 8 fin
  li t1, 240
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t1, sp, 32
  addi t5, t1, 12                                                       # ir inst 10 fin
  li t1, 80
  sw t1, 0(t5)                                                          # ir inst 11 fin
  addi t1, sp, 32
  addi t5, t1, 16                                                       # ir inst 12 fin
  addi t4, t5, 0                                                        # ir inst 13 fin
  li t1, 255
  sw t1, 0(t4)                                                          # ir inst 14 fin
  addi t4, t5, 4                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 16 fin
  addi t4, t5, 8                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  addi t1, sp, 32
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 19 fin
  addi t6, a0, 28                                                       # ir inst 20 fin
  addi t1, sp, 60
  addi t5, t1, 0                                                        # ir inst 22 fin
  addi t4, t5, 0                                                        # ir inst 23 fin
  li t1, 160
  sw t1, 0(t4)                                                          # ir inst 24 fin
  addi t4, t5, 4                                                        # ir inst 25 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 26 fin
  addi t4, t5, 8                                                        # ir inst 27 fin
  li t1, 320
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t1, sp, 60
  addi t5, t1, 12                                                       # ir inst 29 fin
  li t1, 80
  sw t1, 0(t5)                                                          # ir inst 30 fin
  addi t1, sp, 60
  addi t5, t1, 16                                                       # ir inst 31 fin
  addi t4, t5, 0                                                        # ir inst 32 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 33 fin
  addi t4, t5, 4                                                        # ir inst 34 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 35 fin
  addi t4, t5, 8                                                        # ir inst 36 fin
  li t1, 255
  sw t1, 0(t4)                                                          # ir inst 37 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  addi t1, sp, 60
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 38 fin
  addi t6, a0, 56                                                       # ir inst 39 fin
  addi t1, sp, 88
  addi t5, t1, 0                                                        # ir inst 41 fin
  addi t4, t5, 0                                                        # ir inst 42 fin
  li t1, -160
  sw t1, 0(t4)                                                          # ir inst 43 fin
  addi t4, t5, 4                                                        # ir inst 44 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 45 fin
  addi t4, t5, 8                                                        # ir inst 46 fin
  li t1, 320
  sw t1, 0(t4)                                                          # ir inst 47 fin
  addi t1, sp, 88
  addi t5, t1, 12                                                       # ir inst 48 fin
  li t1, 80
  sw t1, 0(t5)                                                          # ir inst 49 fin
  addi t1, sp, 88
  addi t5, t1, 16                                                       # ir inst 50 fin
  addi t4, t5, 0                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 52 fin
  addi t4, t5, 4                                                        # ir inst 53 fin
  li t1, 255
  sw t1, 0(t4)                                                          # ir inst 54 fin
  addi t4, t5, 8                                                        # ir inst 55 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 56 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  addi t1, sp, 88
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 57 fin
  addi t6, a0, 84                                                       # ir inst 58 fin
  addi t1, sp, 116
  addi t5, t1, 0                                                        # ir inst 60 fin
  addi t4, t5, 0                                                        # ir inst 61 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 62 fin
  addi t4, t5, 4                                                        # ir inst 63 fin
  li t1, -16080
  sw t1, 0(t4)                                                          # ir inst 64 fin
  addi t4, t5, 8                                                        # ir inst 65 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 66 fin
  addi t1, sp, 116
  addi t5, t1, 12                                                       # ir inst 67 fin
  li t1, 16000
  sw t1, 0(t5)                                                          # ir inst 68 fin
  addi t1, sp, 116
  addi t5, t1, 16                                                       # ir inst 69 fin
  addi t4, t5, 0                                                        # ir inst 70 fin
  li t1, 200
  sw t1, 0(t4)                                                          # ir inst 71 fin
  addi t4, t5, 4                                                        # ir inst 72 fin
  li t1, 200
  sw t1, 0(t4)                                                          # ir inst 73 fin
  addi t4, t5, 8                                                        # ir inst 74 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 75 fin
# Start call preparation
  sd a1, 0(sp)
  sd t6, 8(sp)
  li a2, 28
  addi t1, sp, 116
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a1, 0(sp)
  ld t6, 8(sp)
# ir inst 76 fin
  addi t6, a1, 0                                                        # ir inst 77 fin
  addi t1, sp, 144
  addi t5, t1, 0                                                        # ir inst 79 fin
  addi t4, t5, 0                                                        # ir inst 80 fin
  li t1, -1600
  sw t1, 0(t4)                                                          # ir inst 81 fin
  addi t4, t5, 4                                                        # ir inst 82 fin
  li t1, 1600
  sw t1, 0(t4)                                                          # ir inst 83 fin
  addi t4, t5, 8                                                        # ir inst 84 fin
  li t1, -1600
  sw t1, 0(t4)                                                          # ir inst 85 fin
  addi t1, sp, 144
  addi t5, t1, 12                                                       # ir inst 86 fin
  li t1, 150
  sw t1, 0(t5)                                                          # ir inst 87 fin
# Start call preparation
  sd a1, 0(sp)
  sd t6, 8(sp)
  li a2, 16
  addi t1, sp, 144
  mv a1, t1
  mv a0, t6
  call memcpy
  ld a1, 0(sp)
  ld t6, 8(sp)
# ir inst 88 fin
  addi t6, a1, 16                                                       # ir inst 89 fin
  addi t1, sp, 160
  addi t5, t1, 0                                                        # ir inst 91 fin
  addi t4, t5, 0                                                        # ir inst 92 fin
  li t1, 1600
  sw t1, 0(t4)                                                          # ir inst 93 fin
  addi t4, t5, 4                                                        # ir inst 94 fin
  li t1, 2400
  sw t1, 0(t4)                                                          # ir inst 95 fin
  addi t4, t5, 8                                                        # ir inst 96 fin
  li t1, -800
  sw t1, 0(t4)                                                          # ir inst 97 fin
  addi t1, sp, 160
  addi t5, t1, 12                                                       # ir inst 98 fin
  li t1, 120
  sw t1, 0(t5)                                                          # ir inst 99 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 16
  addi t1, sp, 160
  mv a1, t1
  mv a0, t6
  call memcpy
  ld t6, 0(sp)
# ir inst 100 fin
  j .F.setup_scene.epilogue                                             # ir inst 101 fin
.F.setup_scene.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 176
  ret

.globl .F.vec_dot
.F.vec_dot:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.vec_dot._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t6, a1, 0                                                        # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
  mul t6, t5, t4                                                        # ir inst 5 fin
  addi t5, a0, 4                                                        # ir inst 6 fin
  lw t4, 0(t5)                                                          # ir inst 7 fin
  addi t5, a1, 4                                                        # ir inst 8 fin
  lw t3, 0(t5)                                                          # ir inst 9 fin
  mul t5, t4, t3                                                        # ir inst 10 fin
  add t4, t6, t5                                                        # ir inst 11 fin
  addi t6, a0, 8                                                        # ir inst 12 fin
  lw t5, 0(t6)                                                          # ir inst 13 fin
  addi t6, a1, 8                                                        # ir inst 14 fin
  lw t3, 0(t6)                                                          # ir inst 15 fin
  mul t6, t5, t3                                                        # ir inst 16 fin
  add t5, t4, t6                                                        # ir inst 17 fin
  li t2, 80
  div t6, t5, t2                                                        # ir inst 18 fin
  mv a0, t6
  j .F.vec_dot.epilogue                                                 # ir inst 19 fin
.F.vec_dot.epilogue:
  ret

.globl .F.vec_sub
.F.vec_sub:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 12,                 range:       16(sp) -       28(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 8(sp)
.F.vec_sub._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  addi t5, a1, 0                                                        # ir inst 3 fin
  lw t4, 0(t5)                                                          # ir inst 4 fin
  addi t5, a2, 0                                                        # ir inst 5 fin
  lw t3, 0(t5)                                                          # ir inst 6 fin
  sub t5, t4, t3                                                        # ir inst 7 fin
  sw t5, 0(t6)                                                          # ir inst 8 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 9 fin
  addi t5, a1, 4                                                        # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  addi t5, a2, 4                                                        # ir inst 12 fin
  lw t3, 0(t5)                                                          # ir inst 13 fin
  sub t5, t4, t3                                                        # ir inst 14 fin
  sw t5, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 16 fin
  addi t5, a1, 8                                                        # ir inst 17 fin
  lw t4, 0(t5)                                                          # ir inst 18 fin
  addi t5, a2, 8                                                        # ir inst 19 fin
  lw t3, 0(t5)                                                          # ir inst 20 fin
  sub t5, t4, t3                                                        # ir inst 21 fin
  sw t5, 0(t6)                                                          # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 12
  addi t1, sp, 16
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 23 fin
  j .F.vec_sub.epilogue                                                 # ir inst 24 fin
.F.vec_sub.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 32
  ret

.globl .F.intersect
.F.intersect:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 12,                 range:       64(sp) -       76(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.intersect._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 2 fin
  addi t5, a1, 0                                                        # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  mv a1, t6
  addi t1, sp, 64
  mv a0, t1
  call .F.vec_sub
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 4 fin
  addi t6, a0, 12                                                       # ir inst 5 fin
  addi t5, a0, 12                                                       # ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t5
  mv a0, t6
  call .F.vec_dot
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 7 fin
  addi t6, a0, 12                                                       # ir inst 8 fin
# Start call preparation
  sd a1, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t6
  addi t1, sp, 64
  mv a0, t1
  call .F.vec_dot
  mv t5, a0
  ld a1, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 9 fin
  slli t6, t5, 1                                                        # ir inst 10 fin
# Start call preparation
  sd a1, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 64
  mv a1, t1
  addi t1, sp, 64
  mv a0, t1
  call .F.vec_dot
  mv t5, a0
  ld a1, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 11 fin
  addi t3, a1, 12                                                       # ir inst 12 fin
  lw s11, 0(t3)                                                         # ir inst 13 fin
  addi t3, a1, 12                                                       # ir inst 14 fin
  lw s10, 0(t3)                                                         # ir inst 15 fin
  mul t3, s11, s10                                                      # ir inst 16 fin
  li t2, 80
  div s11, t3, t2                                                       # ir inst 17 fin
  sub t3, t5, s11                                                       # ir inst 18 fin
  mul t5, t6, t6                                                        # ir inst 19 fin
  slli s11, t4, 2                                                       # ir inst 20 fin
  mul s10, s11, t3                                                      # ir inst 21 fin
  li t2, 80
  div t3, s10, t2                                                       # ir inst 22 fin
  sub s11, t5, t3                                                       # ir inst 23 fin
  li t2, 0
  slt t5, s11, t2                                                       # ir inst 24 fin
  bnez t5, .F.intersect._1.if.then.0
  j .F.intersect._2.if.else.0                                           # ir inst 25 fin
.F.intersect._1.if.then.0:
  li a0, -1
  j .F.intersect.epilogue                                               # ir inst 26 fin
.F.intersect._2.if.else.0:
  j .F.intersect._3.if.exit.0                                           # ir inst 27 fin
.F.intersect._3.if.exit.0:
  li t1, 0
  sub t5, t1, t6                                                        # ir inst 28 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  mv a0, s11
  call .F.isqrt
  mv t6, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 29 fin
  sub t3, t5, t6                                                        # ir inst 30 fin
  slli t6, t4, 1                                                        # ir inst 31 fin
  li t2, 80
  div t5, t6, t2                                                        # ir inst 32 fin
  div t6, t3, t5                                                        # ir inst 33 fin
  mv a0, t6
  j .F.intersect.epilogue                                               # ir inst 34 fin
.F.intersect.epilogue:
  ld ra, 56(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 80
  ret

.globl .F.isqrt
.F.isqrt:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.isqrt._0.entry.0:
  li t2, 0
  slt t6, a0, t2                                                        # ir inst 1 fin
  bnez t6, .F.isqrt._1.if.then.0
  j .F.isqrt._2.if.else.0                                               # ir inst 2 fin
.F.isqrt._1.if.then.0:
  li a0, 0
  j .F.isqrt.epilogue                                                   # ir inst 3 fin
.F.isqrt._2.if.else.0:
  j .F.isqrt._3.if.exit.0                                               # ir inst 4 fin
.F.isqrt._3.if.exit.0:
  addi t6, a0, 1                                                        # ir inst 5 fin
  li t2, 2
  div t5, t6, t2                                                        # ir inst 6 fin
# Phi connections
  mv t6, t5
  mv t5, a0
  j .F.isqrt._4.while.cond.0                                            # ir inst 7 fin
.F.isqrt._4.while.cond.0:
  slt t4, t6, t5                                                        # ir inst 10 fin
  bnez t4, .F.isqrt._5.while.body.0
  j .F.isqrt._6.while.exit.0                                            # ir inst 11 fin
.F.isqrt._5.while.body.0:
  div t4, a0, t6                                                        # ir inst 12 fin
  add t3, t6, t4                                                        # ir inst 13 fin
  li t2, 2
  div t4, t3, t2                                                        # ir inst 14 fin
# Phi connections
  mv t5, t6
  mv t6, t4
  j .F.isqrt._4.while.cond.0                                            # ir inst 15 fin
.F.isqrt._6.while.exit.0:
  mv a0, t5
  j .F.isqrt.epilogue                                                   # ir inst 16 fin
.F.isqrt.epilogue:
  ret

.globl main
main:
# spill func args num: 0,             range:    16944(sp) -    16944(sp)
# local var size: 16876,              range:       64(sp) -    16940(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -16944
  add sp, sp, t0
  sd s9, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
main._0.entry.0:
  li t1, 16448
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 4 fin
main._1.array.cond.0:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 7 fin
main._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j main._1.array.cond.0                                                # ir inst 11 fin
main._3.array.exit.0:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 16 fin
main._5.array.body.1:
  slli t2, t5, 8
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 256
  li t1, 16448
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 20 fin
main._6.array.exit.1:
  li t1, 16816
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 23 fin
  addi t5, t6, 0                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 25 fin
  addi t5, t6, 4                                                        # ir inst 26 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 27 fin
  addi t5, t6, 8                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 29 fin
  li t1, 16816
  add t1, sp, t1
  addi t6, t1, 12                                                       # ir inst 30 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 31 fin
  li t1, 16816
  add t1, sp, t1
  addi t6, t1, 16                                                       # ir inst 32 fin
  addi t5, t6, 0                                                        # ir inst 33 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 34 fin
  addi t5, t6, 4                                                        # ir inst 35 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 36 fin
  addi t5, t6, 8                                                        # ir inst 37 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 38 fin
  li t1, 16704
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 39 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 40 fin
main._7.array.cond.2:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 42 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 43 fin
main._8.array.body.2:
  li t1, 28
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 44 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 28
  li t1, 16816
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 45 fin
  addi t4, t5, 1                                                        # ir inst 46 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 47 fin
main._9.array.exit.2:
  li t1, 16876
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 50 fin
  addi t5, t6, 0                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 52 fin
  addi t5, t6, 4                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 54 fin
  addi t5, t6, 8                                                        # ir inst 55 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 56 fin
  li t1, 16876
  add t1, sp, t1
  addi t6, t1, 12                                                       # ir inst 57 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 58 fin
  li t1, 16844
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 59 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 60 fin
main._10.array.cond.3:
  li t2, 2
  slt t4, t5, t2                                                        # ir inst 62 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 63 fin
main._11.array.body.3:
  slli t2, t5, 4
  add t4, t6, t2                                                        # ir inst 64 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 16
  li t1, 16876
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 65 fin
  addi t4, t5, 1                                                        # ir inst 66 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 67 fin
main._12.array.exit.3:
# Start call preparation
  li t1, 16844
  add t1, sp, t1
  mv a1, t1
  li t1, 16704
  add t1, sp, t1
  mv a0, t1
  call .F.setup_scene
# ir inst 68 fin
# Phi connections
  li t6, 0
  j main._13.while.cond.0                                               # ir inst 69 fin
main._13.while.cond.0:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 71 fin
  bnez t5, main._14.while.body.0
  j main._27.while.exit.0                                               # ir inst 72 fin
main._14.while.body.0:
# Phi connections
  li t5, 0
  j main._15.while.cond.1                                               # ir inst 73 fin
main._15.while.cond.1:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 75 fin
  bnez t4, main._16.while.body.1
  j main._26.while.exit.1                                               # ir inst 76 fin
main._16.while.body.1:
  li t1, 16892
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 78 fin
  addi t3, t5, -32                                                      # ir inst 79 fin
  li t2, 80
  mul s11, t3, t2                                                       # ir inst 80 fin
  li t2, 64
  div t3, s11, t2                                                       # ir inst 81 fin
  sw t3, 0(t4)                                                          # ir inst 82 fin
  li t1, 16892
  add t1, sp, t1
  addi t4, t1, 4                                                        # ir inst 83 fin
  addi t3, t6, -32                                                      # ir inst 84 fin
  li t2, 80
  mul s11, t3, t2                                                       # ir inst 85 fin
  li t2, 64
  div t3, s11, t2                                                       # ir inst 86 fin
  sw t3, 0(t4)                                                          # ir inst 87 fin
  li t1, 16892
  add t1, sp, t1
  addi t4, t1, 8                                                        # ir inst 88 fin
  li t1, 80
  sw t1, 0(t4)                                                          # ir inst 89 fin
  li t1, 16904
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 91 fin
  addi t3, t4, 0                                                        # ir inst 92 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 93 fin
  addi t3, t4, 4                                                        # ir inst 94 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 95 fin
  addi t3, t4, 8                                                        # ir inst 96 fin
  li t1, -80
  sw t1, 0(t3)                                                          # ir inst 97 fin
  li t1, 16904
  add t1, sp, t1
  addi t4, t1, 12                                                       # ir inst 98 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 12
  li t1, 16892
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 99 fin
  li t1, 16928
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 101 fin
  li t1, 20
  sw t1, 0(t4)                                                          # ir inst 102 fin
  li t1, 16928
  add t1, sp, t1
  addi t4, t1, 4                                                        # ir inst 103 fin
  li t1, 20
  sw t1, 0(t4)                                                          # ir inst 104 fin
  li t1, 16928
  add t1, sp, t1
  addi t4, t1, 8                                                        # ir inst 105 fin
  li t1, 40
  sw t1, 0(t4)                                                          # ir inst 106 fin
# Phi connections
  li t3, 800000
  li t4, 0
  j main._17.while.cond.2                                               # ir inst 107 fin
main._17.while.cond.2:
  li t2, 4
  slt s11, t4, t2                                                       # ir inst 110 fin
  bnez s11, main._18.while.body.2
  j main._25.while.exit.2                                               # ir inst 111 fin
main._18.while.body.2:
  mv s11, t4                                                            # ir inst 112 fin
  li t1, 28
  mul t2, s11, t1
  li t1, 16704
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 113 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s10
  li t1, 16904
  add t1, sp, t1
  mv a0, t1
  call .F.intersect
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 114 fin
  li t2, 0
  slt s10, t2, s11                                                      # ir inst 115 fin
  bnez s10, main._19.lazy.then.0
  j main._20.lazy.else.0                                                # ir inst 116 fin
main._19.lazy.then.0:
  slt s10, s11, t3                                                      # ir inst 117 fin
# Phi connections
  j main._21.lazy.exit.0                                                # ir inst 118 fin
main._20.lazy.else.0:
# Phi connections
  li s10, 0
  j main._21.lazy.exit.0                                                # ir inst 119 fin
main._21.lazy.exit.0:
  bnez s10, main._22.if.then.0
  j main._23.if.else.0                                                  # ir inst 121 fin
main._22.if.then.0:
  mv s10, t4                                                            # ir inst 122 fin
  li t1, 28
  mul t2, s10, t1
  li t1, 16704
  add t1, sp, t1
  add s9, t1, t2                                                        # ir inst 123 fin
  addi s10, s9, 16                                                      # ir inst 124 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 12
  mv a1, s10
  li t1, 16928
  add t1, sp, t1
  mv a0, t1
  call memcpy
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 125 fin
# Phi connections
  mv t3, s11
  j main._24.if.exit.0                                                  # ir inst 126 fin
main._23.if.else.0:
# Phi connections
  j main._24.if.exit.0                                                  # ir inst 127 fin
main._24.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 129 fin
# Phi connections
  mv t4, s11
  j main._17.while.cond.2                                               # ir inst 130 fin
main._25.while.exit.2:
  mv t4, t5                                                             # ir inst 131 fin
  slli t2, t4, 8
  addi t1, sp, 64
  add t3, t1, t2                                                        # ir inst 132 fin
  mv t4, t6                                                             # ir inst 133 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 134 fin
  li t1, 16928
  add t1, sp, t1
  addi t4, t1, 0                                                        # ir inst 135 fin
  lw t3, 0(t4)                                                          # ir inst 136 fin
  li t1, 16928
  add t1, sp, t1
  addi t4, t1, 4                                                        # ir inst 137 fin
  lw s10, 0(t4)                                                         # ir inst 138 fin
  add t4, t3, s10                                                       # ir inst 139 fin
  li t1, 16928
  add t1, sp, t1
  addi t3, t1, 8                                                        # ir inst 140 fin
  lw s10, 0(t3)                                                         # ir inst 141 fin
  add t3, t4, s10                                                       # ir inst 142 fin
  li t2, 3
  div t4, t3, t2                                                        # ir inst 143 fin
  sw t4, 0(s11)                                                         # ir inst 144 fin
  addi t4, t5, 1                                                        # ir inst 145 fin
# Phi connections
  mv t5, t4
  j main._15.while.cond.1                                               # ir inst 146 fin
main._26.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 147 fin
# Phi connections
  mv t6, t5
  j main._13.while.cond.0                                               # ir inst 148 fin
main._27.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j main._28.while.cond.3                                               # ir inst 149 fin
main._28.while.cond.3:
  li t2, 64
  slt t4, t6, t2                                                        # ir inst 152 fin
  bnez t4, main._29.while.body.3
  j main._33.while.exit.3                                               # ir inst 153 fin
main._29.while.body.3:
# Phi connections
  li t3, 0
  mv t4, t5
  j main._30.while.cond.4                                               # ir inst 154 fin
main._30.while.cond.4:
  li t2, 64
  slt s11, t3, t2                                                       # ir inst 157 fin
  bnez s11, main._31.while.body.4
  j main._32.while.exit.4                                               # ir inst 158 fin
main._31.while.body.4:
  mv s11, t3                                                            # ir inst 159 fin
  slli t2, s11, 8
  addi t1, sp, 64
  add s10, t1, t2                                                       # ir inst 160 fin
  mv s11, t6                                                            # ir inst 161 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 162 fin
  lw s11, 0(s9)                                                         # ir inst 163 fin
  slli s10, t6, 6                                                       # ir inst 164 fin
  add s9, t3, s10                                                       # ir inst 165 fin
  mul s10, s11, s9                                                      # ir inst 166 fin
  add s11, t4, s10                                                      # ir inst 167 fin
  addi s10, t3, 1                                                       # ir inst 168 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j main._30.while.cond.4                                               # ir inst 169 fin
main._32.while.exit.4:
  addi t3, t6, 1                                                        # ir inst 170 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j main._28.while.cond.3                                               # ir inst 171 fin
main._33.while.exit.3:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 172 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 173 fin
  j main.epilogue                                                       # ir inst 174 fin
main.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  li t0, 16944
  add sp, sp, t0
  ret
