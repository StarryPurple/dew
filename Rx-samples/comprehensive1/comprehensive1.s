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

.globl .F._anpJvSCOn26_better
.F._anpJvSCOn26_better:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._anpJvSCOn26_better._0.entry.0:
  addi t6, a1, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t6, a2, 0                                                        # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
  xor t0, t5, t4
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F._anpJvSCOn26_better._1.if.then.0
  j .F._anpJvSCOn26_better._5.if.else.0                                 # ir inst 6 fin
.F._anpJvSCOn26_better._1.if.then.0:
  addi t6, a1, 4                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
  addi t6, a2, 4                                                        # ir inst 9 fin
  lw t4, 0(t6)                                                          # ir inst 10 fin
  slt t6, t5, t4                                                        # ir inst 11 fin
  bnez t6, .F._anpJvSCOn26_better._2.if.then.1
  j .F._anpJvSCOn26_better._3.if.else.1                                 # ir inst 12 fin
.F._anpJvSCOn26_better._2.if.then.1:
  ld t6, 0(a1)                                                          # ir inst 13 fin
# Phi connections
  j .F._anpJvSCOn26_better._4.if.exit.1                                 # ir inst 14 fin
.F._anpJvSCOn26_better._3.if.else.1:
  ld t6, 0(a2)                                                          # ir inst 15 fin
# Phi connections
  j .F._anpJvSCOn26_better._4.if.exit.1                                 # ir inst 16 fin
.F._anpJvSCOn26_better._4.if.exit.1:
# Phi connections
  j .F._anpJvSCOn26_better._9.if.exit.0                                 # ir inst 18 fin
.F._anpJvSCOn26_better._5.if.else.0:
  addi t6, a1, 0                                                        # ir inst 19 fin
  lw t5, 0(t6)                                                          # ir inst 20 fin
  addi t6, a2, 0                                                        # ir inst 21 fin
  lw t4, 0(t6)                                                          # ir inst 22 fin
  slt t6, t4, t5                                                        # ir inst 23 fin
  bnez t6, .F._anpJvSCOn26_better._6.if.then.2
  j .F._anpJvSCOn26_better._7.if.else.2                                 # ir inst 24 fin
.F._anpJvSCOn26_better._6.if.then.2:
  ld t6, 0(a1)                                                          # ir inst 25 fin
# Phi connections
  j .F._anpJvSCOn26_better._8.if.exit.2                                 # ir inst 26 fin
.F._anpJvSCOn26_better._7.if.else.2:
  ld t6, 0(a2)                                                          # ir inst 27 fin
# Phi connections
  j .F._anpJvSCOn26_better._8.if.exit.2                                 # ir inst 28 fin
.F._anpJvSCOn26_better._8.if.exit.2:
# Phi connections
  j .F._anpJvSCOn26_better._9.if.exit.0                                 # ir inst 30 fin
.F._anpJvSCOn26_better._9.if.exit.0:
  sd t6, 0(a0)                                                          # ir inst 32 fin
  j .F._anpJvSCOn26_better.epilogue                                     # ir inst 33 fin
.F._anpJvSCOn26_better.epilogue:
  ret

.globl .F.new_segt
.F.new_segt:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 32,                 range:       40(sp) -       72(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 32(sp)
.F.new_segt._0.entry.0:
  ld t6, 0(a1)                                                          # ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
  sd t5, 0(a1)                                                          # ir inst 3 fin
  ld t6, 0(a1)                                                          # ir inst 4 fin
  slli t2, t6, 5
  add t5, a0, t2                                                        # ir inst 5 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 7 fin
  sw a2, 0(t6)                                                          # ir inst 8 fin
  addi t1, sp, 40
  addi t6, t1, 4                                                        # ir inst 9 fin
  sw a3, 0(t6)                                                          # ir inst 10 fin
  addi t1, sp, 40
  addi t6, t1, 8                                                        # ir inst 11 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 12 fin
  addi t1, sp, 40
  addi t6, t1, 16                                                       # ir inst 13 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 14 fin
  addi t1, sp, 40
  addi t6, t1, 24                                                       # ir inst 15 fin
# Start call preparation
  sd a1, 0(sp)
  sd a4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 8
  mv a1, a4
  mv a0, t6
  call memcpy
  ld a1, 0(sp)
  ld a4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 16 fin
# Start call preparation
  sd a1, 0(sp)
  sd t5, 8(sp)
  li a2, 32
  addi t1, sp, 40
  mv a1, t1
  mv a0, t5
  call memcpy
  ld a1, 0(sp)
  ld t5, 8(sp)
# ir inst 17 fin
  ld t6, 0(a1)                                                          # ir inst 18 fin
  mv a0, t6
  j .F.new_segt.epilogue                                                # ir inst 19 fin
.F.new_segt.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 80
  ret

.globl .F.build
.F.build:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 32,                 range:       48(sp) -       80(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd ra, 40(sp)
.F.build._0.entry.0:
  slt t6, a3, a2                                                        # ir inst 3 fin
  bnez t6, .F.build._1.if.then.0
  j .F.build._2.if.else.0                                               # ir inst 4 fin
.F.build._1.if.then.0:
  li a0, 0
  j .F.build.epilogue                                                   # ir inst 5 fin
.F.build._2.if.else.0:
  j .F.build._3.if.exit.0                                               # ir inst 6 fin
.F.build._3.if.exit.0:
  xor t0, a2, a3
  sltiu t6, t0, 1                                                       # ir inst 7 fin
  bnez t6, .F.build._4.if.then.1
  j .F.build._5.if.else.1                                               # ir inst 8 fin
.F.build._4.if.then.1:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 64
  addi t6, t1, 4                                                        # ir inst 12 fin
  sw a2, 0(t6)                                                          # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  li a2, 8
  addi t1, sp, 64
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  addi t1, sp, 48
  mv a4, t1
  call .F.new_segt
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 15 fin
  mv a0, t6
  j .F.build.epilogue                                                   # ir inst 16 fin
.F.build._5.if.else.1:
  j .F.build._6.if.exit.1                                               # ir inst 17 fin
.F.build._6.if.exit.1:
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 72
  addi t6, t1, 4                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  li a2, 8
  addi t1, sp, 72
  mv a1, t1
  addi t1, sp, 56
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 23 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  addi t1, sp, 56
  mv a4, t1
  call .F.new_segt
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 24 fin
  mv a0, t6
  j .F.build.epilogue                                                   # ir inst 25 fin
.F.build.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 80
  ret

.globl .F.update
.F.update:
# spill func args num: 0,             range:      160(sp) -      160(sp)
# local var size: 72,                 range:       88(sp) -      160(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 1 / 12,        range:       72(sp) -       80(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -160
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.update._0.entry.0:
  li t2, 0
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.update._1.if.then.0
  j .F.update._2.if.else.0                                              # ir inst 6 fin
.F.update._1.if.then.0:
  j .F.update.epilogue                                                  # ir inst 7 fin
.F.update._2.if.else.0:
  j .F.update._3.if.exit.0                                              # ir inst 8 fin
.F.update._3.if.exit.0:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 9 fin
  addi t5, t6, 0                                                        # ir inst 10 fin
  lw t6, 0(t5)                                                          # ir inst 11 fin
  slli t2, a2, 5
  add t5, a0, t2                                                        # ir inst 12 fin
  addi t4, t5, 4                                                        # ir inst 13 fin
  lw t5, 0(t4)                                                          # ir inst 14 fin
  slt t4, a3, t6                                                        # ir inst 15 fin
  bnez t4, .F.update._4.lazy.then.0
  j .F.update._5.lazy.else.0                                            # ir inst 16 fin
.F.update._4.lazy.then.0:
# Phi connections
  li t4, 1
  j .F.update._6.lazy.exit.0                                            # ir inst 17 fin
.F.update._5.lazy.else.0:
  slt t4, t5, a3                                                        # ir inst 18 fin
# Phi connections
  j .F.update._6.lazy.exit.0                                            # ir inst 19 fin
.F.update._6.lazy.exit.0:
  bnez t4, .F.update._7.if.then.1
  j .F.update._8.if.else.1                                              # ir inst 21 fin
.F.update._7.if.then.1:
  j .F.update.epilogue                                                  # ir inst 22 fin
.F.update._8.if.else.1:
  j .F.update._9.if.exit.1                                              # ir inst 23 fin
.F.update._9.if.exit.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 24 fin
  bnez t4, .F.update._10.if.then.2
  j .F.update._11.if.else.2                                             # ir inst 25 fin
.F.update._10.if.then.2:
  slli t2, a2, 5
  add t4, a0, t2                                                        # ir inst 26 fin
  addi t3, t4, 24                                                       # ir inst 27 fin
  addi t4, t3, 0                                                        # ir inst 28 fin
  lw t3, 0(t4)                                                          # ir inst 29 fin
  add s11, t3, a4                                                       # ir inst 30 fin
  sw s11, 0(t4)                                                         # ir inst 31 fin
  j .F.update.epilogue                                                  # ir inst 32 fin
.F.update._11.if.else.2:
  j .F.update._12.if.exit.2                                             # ir inst 33 fin
.F.update._12.if.exit.2:
  add t4, t6, t5                                                        # ir inst 34 fin
  li t2, 2
  div t3, t4, t2                                                        # ir inst 35 fin
  slt t0, t3, a3
  xori t4, t0, 1                                                        # ir inst 36 fin
  bnez t4, .F.update._13.if.then.3
  j .F.update._17.if.else.3                                             # ir inst 37 fin
.F.update._13.if.then.3:
  slli t2, a2, 5
  add t4, a0, t2                                                        # ir inst 38 fin
  addi s11, t4, 8                                                       # ir inst 39 fin
  ld t4, 0(s11)                                                         # ir inst 40 fin
  li t2, 0
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 41 fin
  bnez s11, .F.update._14.if.then.4
  j .F.update._15.if.else.4                                             # ir inst 42 fin
.F.update._14.if.then.4:
  slli t2, a2, 5
  add t4, a0, t2                                                        # ir inst 43 fin
  addi s11, t4, 8                                                       # ir inst 44 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a3, t3
  mv a2, t6
  call .F.build
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 45 fin
  sd t4, 0(s11)                                                         # ir inst 46 fin
  j .F.update._16.if.exit.4                                             # ir inst 47 fin
.F.update._15.if.else.4:
  j .F.update._16.if.exit.4                                             # ir inst 48 fin
.F.update._16.if.exit.4:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 49 fin
  addi t4, t6, 8                                                        # ir inst 50 fin
  ld t6, 0(t4)                                                          # ir inst 51 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a2, t6
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 52 fin
  j .F.update._21.if.exit.3                                             # ir inst 53 fin
.F.update._17.if.else.3:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 54 fin
  addi t4, t6, 16                                                       # ir inst 55 fin
  ld t6, 0(t4)                                                          # ir inst 56 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 57 fin
  bnez t4, .F.update._18.if.then.5
  j .F.update._19.if.else.5                                             # ir inst 58 fin
.F.update._18.if.then.5:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 59 fin
  addi t4, t6, 16                                                       # ir inst 60 fin
  addi t6, t3, 1                                                        # ir inst 61 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a3, t5
  mv a2, t6
  call .F.build
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 62 fin
  sd t3, 0(t4)                                                          # ir inst 63 fin
  j .F.update._20.if.exit.5                                             # ir inst 64 fin
.F.update._19.if.else.5:
  j .F.update._20.if.exit.5                                             # ir inst 65 fin
.F.update._20.if.exit.5:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 66 fin
  addi t5, t6, 16                                                       # ir inst 67 fin
  ld t6, 0(t5)                                                          # ir inst 68 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t6, 40(sp)
  mv a2, t6
  call .F.update
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t6, 40(sp)
# ir inst 69 fin
  j .F.update._21.if.exit.3                                             # ir inst 70 fin
.F.update._21.if.exit.3:
  addi t1, sp, 120
  addi t6, t1, 0                                                        # ir inst 72 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 73 fin
  addi t1, sp, 120
  addi t6, t1, 4                                                        # ir inst 74 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 75 fin
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 76 fin
  addi t5, t6, 8                                                        # ir inst 77 fin
  ld t6, 0(t5)                                                          # ir inst 78 fin
  li t2, 0
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 79 fin
  bnez t5, .F.update._22.if.then.6
  j .F.update._23.if.else.6                                             # ir inst 80 fin
.F.update._22.if.then.6:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 81 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a2, a0
  mv a1, t6
  addi t1, sp, 128
  mv a0, t1
  call .F._5760lXTxXwm_lc_val
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 83 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 128
  mv a1, t1
  addi t1, sp, 88
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 85 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 120
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 86 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  addi t1, sp, 96
  mv a2, t1
  addi t1, sp, 88
  mv a1, t1
  addi t1, sp, 136
  mv a0, t1
  call .F._anpJvSCOn26_better
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 87 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 136
  mv a1, t1
  addi t1, sp, 120
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 88 fin
  j .F.update._24.if.exit.6                                             # ir inst 89 fin
.F.update._23.if.else.6:
  j .F.update._24.if.exit.6                                             # ir inst 90 fin
.F.update._24.if.exit.6:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 91 fin
  addi t5, t6, 16                                                       # ir inst 92 fin
  ld t6, 0(t5)                                                          # ir inst 93 fin
  li t2, 0
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 94 fin
  bnez t5, .F.update._25.if.then.7
  j .F.update._26.if.else.7                                             # ir inst 95 fin
.F.update._25.if.then.7:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 96 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a2, a0
  mv a1, t6
  addi t1, sp, 144
  mv a0, t1
  call .F._5760lXTxXwm_rc_val
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 98 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 144
  mv a1, t1
  addi t1, sp, 104
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 100 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 120
  mv a1, t1
  addi t1, sp, 112
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 101 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  addi t1, sp, 112
  mv a2, t1
  addi t1, sp, 104
  mv a1, t1
  addi t1, sp, 152
  mv a0, t1
  call .F._anpJvSCOn26_better
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 102 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 152
  mv a1, t1
  addi t1, sp, 120
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 103 fin
  j .F.update._27.if.exit.7                                             # ir inst 104 fin
.F.update._26.if.else.7:
  j .F.update._27.if.exit.7                                             # ir inst 105 fin
.F.update._27.if.exit.7:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 106 fin
  addi t5, t6, 24                                                       # ir inst 107 fin
# Start call preparation
  sd t5, 0(sp)
  li a2, 8
  addi t1, sp, 120
  mv a1, t1
  mv a0, t5
  call memcpy
  ld t5, 0(sp)
# ir inst 108 fin
  j .F.update.epilogue                                                  # ir inst 109 fin
.F.update.epilogue:
  ld ra, 80(sp)
  ld s11, 72(sp)
  addi sp, sp, 160
  ret

.globl .F._5760lXTxXwm_lc_val
.F._5760lXTxXwm_lc_val:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F._5760lXTxXwm_lc_val._0.entry.0:
  addi t6, a1, 8                                                        # ir inst 1 fin
  ld t5, 0(t6)                                                          # ir inst 2 fin
  slli t2, t5, 5
  add t6, a2, t2                                                        # ir inst 3 fin
  addi t5, t6, 24                                                       # ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  li a2, 8
  mv a1, t5
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 5 fin
  j .F._5760lXTxXwm_lc_val.epilogue                                     # ir inst 6 fin
.F._5760lXTxXwm_lc_val.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F._5760lXTxXwm_rc_val
.F._5760lXTxXwm_rc_val:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F._5760lXTxXwm_rc_val._0.entry.0:
  addi t6, a1, 16                                                       # ir inst 1 fin
  ld t5, 0(t6)                                                          # ir inst 2 fin
  slli t2, t5, 5
  add t6, a2, t2                                                        # ir inst 3 fin
  addi t5, t6, 24                                                       # ir inst 4 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  li a2, 8
  mv a1, t5
  call memcpy
  ld a0, 0(sp)
  ld t5, 8(sp)
# ir inst 5 fin
  j .F._5760lXTxXwm_rc_val.epilogue                                     # ir inst 6 fin
.F._5760lXTxXwm_rc_val.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.merge
.F.merge:
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 72,                 range:       72(sp) -      144(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 0 / 12,        range:       64(sp) -       64(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd ra, 64(sp)
.F.merge._0.entry.0:
  li t2, 0
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 5 fin
  bnez t6, .F.merge._1.if.then.0
  j .F.merge._2.if.else.0                                               # ir inst 6 fin
.F.merge._1.if.then.0:
  mv a0, a3
  j .F.merge.epilogue                                                   # ir inst 7 fin
.F.merge._2.if.else.0:
  j .F.merge._3.if.exit.0                                               # ir inst 8 fin
.F.merge._3.if.exit.0:
  li t2, 0
  xor t0, a3, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
  bnez t6, .F.merge._4.if.then.1
  j .F.merge._5.if.else.1                                               # ir inst 10 fin
.F.merge._4.if.then.1:
  mv a0, a2
  j .F.merge.epilogue                                                   # ir inst 11 fin
.F.merge._5.if.else.1:
  j .F.merge._6.if.exit.1                                               # ir inst 12 fin
.F.merge._6.if.exit.1:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 13 fin
  addi t5, t6, 0                                                        # ir inst 14 fin
  lw t6, 0(t5)                                                          # ir inst 15 fin
  slli t2, a2, 5
  add t5, a0, t2                                                        # ir inst 16 fin
  addi t4, t5, 4                                                        # ir inst 17 fin
  lw t5, 0(t4)                                                          # ir inst 18 fin
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 19 fin
  bnez t4, .F.merge._7.if.then.2
  j .F.merge._8.if.else.2                                               # ir inst 20 fin
.F.merge._7.if.then.2:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 21 fin
  addi t5, t6, 24                                                       # ir inst 22 fin
  addi t6, t5, 0                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  slli t2, a3, 5
  add t4, a0, t2                                                        # ir inst 25 fin
  addi t3, t4, 24                                                       # ir inst 26 fin
  addi t4, t3, 0                                                        # ir inst 27 fin
  lw t3, 0(t4)                                                          # ir inst 28 fin
  add t4, t5, t3                                                        # ir inst 29 fin
  sw t4, 0(t6)                                                          # ir inst 30 fin
  mv a0, a2
  j .F.merge.epilogue                                                   # ir inst 31 fin
.F.merge._8.if.else.2:
  j .F.merge._9.if.exit.2                                               # ir inst 32 fin
.F.merge._9.if.exit.2:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 33 fin
  addi t5, t6, 8                                                        # ir inst 34 fin
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 35 fin
  addi t4, t6, 8                                                        # ir inst 36 fin
  ld t6, 0(t4)                                                          # ir inst 37 fin
  slli t2, a3, 5
  add t4, a0, t2                                                        # ir inst 38 fin
  addi t3, t4, 8                                                        # ir inst 39 fin
  ld t4, 0(t3)                                                          # ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a3, t4
  mv a2, t6
  call .F.merge
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 41 fin
  sd t3, 0(t5)                                                          # ir inst 42 fin
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 43 fin
  addi t5, t6, 16                                                       # ir inst 44 fin
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 45 fin
  addi t4, t6, 16                                                       # ir inst 46 fin
  ld t6, 0(t4)                                                          # ir inst 47 fin
  slli t2, a3, 5
  add t4, a0, t2                                                        # ir inst 48 fin
  addi t3, t4, 16                                                       # ir inst 49 fin
  ld t4, 0(t3)                                                          # ir inst 50 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a3, t4
  mv a2, t6
  call .F.merge
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 51 fin
  sd t3, 0(t5)                                                          # ir inst 52 fin
  addi t1, sp, 104
  addi t6, t1, 0                                                        # ir inst 54 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 55 fin
  addi t1, sp, 104
  addi t6, t1, 4                                                        # ir inst 56 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 57 fin
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 58 fin
  addi t5, t6, 8                                                        # ir inst 59 fin
  ld t6, 0(t5)                                                          # ir inst 60 fin
  li t2, 0
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 61 fin
  bnez t5, .F.merge._10.if.then.3
  j .F.merge._11.if.else.3                                              # ir inst 62 fin
.F.merge._10.if.then.3:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 63 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a2, a0
  mv a1, t6
  addi t1, sp, 112
  mv a0, t1
  call .F._5760lXTxXwm_lc_val
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 65 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 112
  mv a1, t1
  addi t1, sp, 72
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 67 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 104
  mv a1, t1
  addi t1, sp, 80
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 68 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  addi t1, sp, 80
  mv a2, t1
  addi t1, sp, 72
  mv a1, t1
  addi t1, sp, 120
  mv a0, t1
  call .F._anpJvSCOn26_better
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 69 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 120
  mv a1, t1
  addi t1, sp, 104
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 70 fin
  j .F.merge._12.if.exit.3                                              # ir inst 71 fin
.F.merge._11.if.else.3:
  j .F.merge._12.if.exit.3                                              # ir inst 72 fin
.F.merge._12.if.exit.3:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 73 fin
  addi t5, t6, 16                                                       # ir inst 74 fin
  ld t6, 0(t5)                                                          # ir inst 75 fin
  li t2, 0
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 76 fin
  bnez t5, .F.merge._13.if.then.4
  j .F.merge._14.if.else.4                                              # ir inst 77 fin
.F.merge._13.if.then.4:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 78 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a2, a0
  mv a1, t6
  addi t1, sp, 128
  mv a0, t1
  call .F._5760lXTxXwm_rc_val
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 80 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 128
  mv a1, t1
  addi t1, sp, 88
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 82 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 104
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 83 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  addi t1, sp, 96
  mv a2, t1
  addi t1, sp, 88
  mv a1, t1
  addi t1, sp, 136
  mv a0, t1
  call .F._anpJvSCOn26_better
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 84 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  li a2, 8
  addi t1, sp, 136
  mv a1, t1
  addi t1, sp, 104
  mv a0, t1
  call memcpy
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 85 fin
  j .F.merge._15.if.exit.4                                              # ir inst 86 fin
.F.merge._14.if.else.4:
  j .F.merge._15.if.exit.4                                              # ir inst 87 fin
.F.merge._15.if.exit.4:
  slli t2, a2, 5
  add t6, a0, t2                                                        # ir inst 88 fin
  addi t5, t6, 24                                                       # ir inst 89 fin
# Start call preparation
  sd a2, 0(sp)
  sd t5, 8(sp)
  li a2, 8
  addi t1, sp, 104
  mv a1, t1
  mv a0, t5
  call memcpy
  ld a2, 0(sp)
  ld t5, 8(sp)
# ir inst 90 fin
  mv a0, a2
  j .F.merge.epilogue                                                   # ir inst 91 fin
.F.merge.epilogue:
  ld ra, 64(sp)
  addi sp, sp, 144
  ret

.globl .F._250uMAnM4NY_push
.F._250uMAnM4NY_push:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._250uMAnM4NY_push._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, a0, 1608                                                     # ir inst 2 fin
  ld t4, 0(t5)                                                          # ir inst 3 fin
  slli t2, t4, 3
  add t5, t6, t2                                                        # ir inst 4 fin
  sd a1, 0(t5)                                                          # ir inst 5 fin
  addi t6, a0, 1608                                                     # ir inst 6 fin
  ld t5, 0(t6)                                                          # ir inst 7 fin
  addi t4, t5, 1                                                        # ir inst 8 fin
  sd t4, 0(t6)                                                          # ir inst 9 fin
  j .F._250uMAnM4NY_push.epilogue                                       # ir inst 10 fin
.F._250uMAnM4NY_push.epilogue:
  ret

.globl .F._250uMAnM4NY_clear
.F._250uMAnM4NY_clear:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F._250uMAnM4NY_clear._0.entry.0:
  addi t6, a0, 1608                                                     # ir inst 1 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 2 fin
  j .F._250uMAnM4NY_clear.epilogue                                      # ir inst 3 fin
.F._250uMAnM4NY_clear.epilogue:
  ret

.globl .F.prepare
.F.prepare:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.prepare._0.entry.0:
  li t1, 1728
  mul t2, a1, t1
  add t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 1624                                                     # ir inst 2 fin
  addi t6, t5, 0                                                        # ir inst 3 fin
  sd a2, 0(t6)                                                          # ir inst 4 fin
  li t1, 1728
  mul t2, a1, t1
  add t6, a0, t2                                                        # ir inst 5 fin
  addi t5, t6, 1616                                                     # ir inst 6 fin
  li t2, 0
  xor t0, a2, t2
  sltiu t6, t0, 1                                                       # ir inst 7 fin
  bnez t6, .F.prepare._1.if.then.0
  j .F.prepare._2.if.else.0                                             # ir inst 8 fin
.F.prepare._1.if.then.0:
# Phi connections
  li t6, 1
  j .F.prepare._3.if.exit.0                                             # ir inst 9 fin
.F.prepare._2.if.else.0:
  li t1, 1728
  mul t2, a2, t1
  add t6, a0, t2                                                        # ir inst 10 fin
  addi t4, t6, 1616                                                     # ir inst 11 fin
  lw t6, 0(t4)                                                          # ir inst 12 fin
  addi t4, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t6, t4
  j .F.prepare._3.if.exit.0                                             # ir inst 14 fin
.F.prepare._3.if.exit.0:
  sw t6, 0(t5)                                                          # ir inst 16 fin
# Phi connections
  li t6, 1
  j .F.prepare._4.while.cond.0                                          # ir inst 17 fin
.F.prepare._4.while.cond.0:
  li t2, 10
  sltu t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 19 fin
  bnez t5, .F.prepare._5.while.body.0
  j .F.prepare._9.while.exit.0                                          # ir inst 20 fin
.F.prepare._5.while.body.0:
  li t1, 1728
  mul t2, a1, t1
  add t5, a0, t2                                                        # ir inst 21 fin
  addi t4, t5, 1624                                                     # ir inst 22 fin
  addi t5, t6, -1                                                       # ir inst 23 fin
  slli t2, t5, 3
  add t3, t4, t2                                                        # ir inst 24 fin
  ld t5, 0(t3)                                                          # ir inst 25 fin
  li t2, 0
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 26 fin
  bnez t4, .F.prepare._6.if.then.1
  j .F.prepare._7.if.else.1                                             # ir inst 27 fin
.F.prepare._6.if.then.1:
  li t1, 1728
  mul t2, a1, t1
  add t4, a0, t2                                                        # ir inst 28 fin
  addi t3, t4, 1624                                                     # ir inst 29 fin
  slli t2, t6, 3
  add t4, t3, t2                                                        # ir inst 30 fin
  li t1, 1728
  mul t2, t5, t1
  add t3, a0, t2                                                        # ir inst 31 fin
  addi t5, t3, 1624                                                     # ir inst 32 fin
  addi t3, t6, -1                                                       # ir inst 33 fin
  slli t2, t3, 3
  add s11, t5, t2                                                       # ir inst 34 fin
  ld t5, 0(s11)                                                         # ir inst 35 fin
  sd t5, 0(t4)                                                          # ir inst 36 fin
  j .F.prepare._8.if.exit.1                                             # ir inst 37 fin
.F.prepare._7.if.else.1:
  j .F.prepare._8.if.exit.1                                             # ir inst 38 fin
.F.prepare._8.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 39 fin
# Phi connections
  mv t6, t5
  j .F.prepare._4.while.cond.0                                          # ir inst 40 fin
.F.prepare._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.prepare._10.while.cond.1                                         # ir inst 41 fin
.F.prepare._10.while.cond.1:
  li t1, 1728
  mul t2, a1, t1
  add t5, a0, t2                                                        # ir inst 43 fin
  addi t4, t5, 1608                                                     # ir inst 44 fin
  ld t5, 0(t4)                                                          # ir inst 45 fin
  sltu t4, t6, t5                                                       # ir inst 46 fin
  bnez t4, .F.prepare._11.while.body.1
  j .F.prepare._15.while.exit.1                                         # ir inst 47 fin
.F.prepare._11.while.body.1:
  li t1, 1728
  mul t2, a1, t1
  add t5, a0, t2                                                        # ir inst 48 fin
  addi t4, t5, 0                                                        # ir inst 49 fin
  slli t2, t6, 3
  add t5, t4, t2                                                        # ir inst 50 fin
  ld t4, 0(t5)                                                          # ir inst 51 fin
  addi t5, t6, 1                                                        # ir inst 52 fin
  xor t0, t4, a2
  sltiu t6, t0, 1                                                       # ir inst 53 fin
  bnez t6, .F.prepare._12.if.then.2
  j .F.prepare._13.if.else.2                                            # ir inst 54 fin
.F.prepare._12.if.then.2:
# Phi connections
  mv t6, t5
  j .F.prepare._10.while.cond.1                                         # ir inst 55 fin
.F.prepare._13.if.else.2:
  j .F.prepare._14.if.exit.2                                            # ir inst 56 fin
.F.prepare._14.if.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  mv a2, a1
  mv a1, t4
  call .F.prepare
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
# ir inst 57 fin
# Phi connections
  mv t6, t5
  j .F.prepare._10.while.cond.1                                         # ir inst 58 fin
.F.prepare._15.while.exit.1:
  j .F.prepare.epilogue                                                 # ir inst 59 fin
.F.prepare.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.lca
.F.lca:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s10, 0(sp)
  sd s9, 8(sp)
  sd s11, 16(sp)
.F.lca._0.entry.0:
  li t1, 1728
  mul t2, a1, t1
  add t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 1616                                                     # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  li t1, 1728
  mul t2, a2, t1
  add t5, a0, t2                                                        # ir inst 4 fin
  addi t4, t5, 1616                                                     # ir inst 5 fin
  lw t5, 0(t4)                                                          # ir inst 6 fin
  slt t4, t6, t5                                                        # ir inst 7 fin
  bnez t4, .F.lca._1.if.then.0
  j .F.lca._2.if.else.0                                                 # ir inst 8 fin
.F.lca._1.if.then.0:
# Phi connections
  mv t5, a2
  mv t6, a1
  j .F.lca._3.if.exit.0                                                 # ir inst 9 fin
.F.lca._2.if.else.0:
# Phi connections
  mv t5, a1
  mv t6, a2
  j .F.lca._3.if.exit.0                                                 # ir inst 10 fin
.F.lca._3.if.exit.0:
  li t1, 10
  mv t4, t1                                                             # ir inst 13 fin
# Phi connections
  mv t0, t4
  mv t4, t5
  mv t5, t0
  j .F.lca._4.while.cond.0                                              # ir inst 14 fin
.F.lca._4.while.cond.0:
  li t2, 0
  slt t0, t5, t2
  xori t3, t0, 1                                                        # ir inst 17 fin
  bnez t3, .F.lca._5.while.body.0
  j .F.lca._12.while.exit.0                                             # ir inst 18 fin
.F.lca._5.while.body.0:
  li t1, 1728
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 19 fin
  addi s11, t3, 1624                                                    # ir inst 20 fin
  mv t3, t5                                                             # ir inst 21 fin
  slli t2, t3, 3
  add s10, s11, t2                                                      # ir inst 22 fin
  ld t3, 0(s10)                                                         # ir inst 23 fin
  li t2, 0
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 24 fin
  bnez s11, .F.lca._6.lazy.then.0
  j .F.lca._7.lazy.else.0                                               # ir inst 25 fin
.F.lca._6.lazy.then.0:
  li t1, 1728
  mul t2, t3, t1
  add s11, a0, t2                                                       # ir inst 26 fin
  addi s10, s11, 1616                                                   # ir inst 27 fin
  lw s11, 0(s10)                                                        # ir inst 28 fin
  li t1, 1728
  mul t2, t6, t1
  add s10, a0, t2                                                       # ir inst 29 fin
  addi s9, s10, 1616                                                    # ir inst 30 fin
  lw s10, 0(s9)                                                         # ir inst 31 fin
  slt t0, s11, s10
  xori s9, t0, 1                                                        # ir inst 32 fin
# Phi connections
  mv s11, s9
  j .F.lca._8.lazy.exit.0                                               # ir inst 33 fin
.F.lca._7.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.lca._8.lazy.exit.0                                               # ir inst 34 fin
.F.lca._8.lazy.exit.0:
  bnez s11, .F.lca._9.if.then.1
  j .F.lca._10.if.else.1                                                # ir inst 36 fin
.F.lca._9.if.then.1:
# Phi connections
  j .F.lca._11.if.exit.1                                                # ir inst 37 fin
.F.lca._10.if.else.1:
# Phi connections
  mv t3, t4
  j .F.lca._11.if.exit.1                                                # ir inst 38 fin
.F.lca._11.if.exit.1:
  addi s11, t5, -1                                                      # ir inst 40 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.lca._4.while.cond.0                                              # ir inst 41 fin
.F.lca._12.while.exit.0:
  xor t0, t4, t6
  sltiu t5, t0, 1                                                       # ir inst 42 fin
  bnez t5, .F.lca._13.if.then.2
  j .F.lca._14.if.else.2                                                # ir inst 43 fin
.F.lca._13.if.then.2:
  mv a0, t4
  j .F.lca.epilogue                                                     # ir inst 44 fin
.F.lca._14.if.else.2:
  j .F.lca._15.if.exit.2                                                # ir inst 45 fin
.F.lca._15.if.exit.2:
  li t1, 10
  mv t5, t1                                                             # ir inst 46 fin
# Phi connections
  mv t0, t5
  mv t5, t6
  mv t6, t0
  j .F.lca._16.while.cond.1                                             # ir inst 47 fin
.F.lca._16.while.cond.1:
  li t2, 0
  slt t0, t6, t2
  xori t3, t0, 1                                                        # ir inst 51 fin
  bnez t3, .F.lca._17.while.body.1
  j .F.lca._21.while.exit.1                                             # ir inst 52 fin
.F.lca._17.while.body.1:
  li t1, 1728
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 53 fin
  addi s11, t3, 1624                                                    # ir inst 54 fin
  mv t3, t6                                                             # ir inst 55 fin
  slli t2, t3, 3
  add s10, s11, t2                                                      # ir inst 56 fin
  ld t3, 0(s10)                                                         # ir inst 57 fin
  li t1, 1728
  mul t2, t5, t1
  add s11, a0, t2                                                       # ir inst 58 fin
  addi s10, s11, 1624                                                   # ir inst 59 fin
  mv s11, t6                                                            # ir inst 60 fin
  slli t2, s11, 3
  add s9, s10, t2                                                       # ir inst 61 fin
  ld s11, 0(s9)                                                         # ir inst 62 fin
  xor t0, t3, s11
  sltu s10, zero, t0                                                    # ir inst 63 fin
  bnez s10, .F.lca._18.if.then.3
  j .F.lca._19.if.else.3                                                # ir inst 64 fin
.F.lca._18.if.then.3:
  li t1, 1728
  mul t2, t4, t1
  add t3, a0, t2                                                        # ir inst 65 fin
  addi s11, t3, 1624                                                    # ir inst 66 fin
  mv t3, t6                                                             # ir inst 67 fin
  slli t2, t3, 3
  add s10, s11, t2                                                      # ir inst 68 fin
  ld t3, 0(s10)                                                         # ir inst 69 fin
  li t1, 1728
  mul t2, t5, t1
  add s11, a0, t2                                                       # ir inst 70 fin
  addi s10, s11, 1624                                                   # ir inst 71 fin
  mv s11, t6                                                            # ir inst 72 fin
  slli t2, s11, 3
  add s9, s10, t2                                                       # ir inst 73 fin
  ld s11, 0(s9)                                                         # ir inst 74 fin
# Phi connections
  mv t5, s11
  j .F.lca._20.if.exit.3                                                # ir inst 75 fin
.F.lca._19.if.else.3:
# Phi connections
  mv t3, t4
  j .F.lca._20.if.exit.3                                                # ir inst 76 fin
.F.lca._20.if.exit.3:
  addi s11, t6, -1                                                      # ir inst 79 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.lca._16.while.cond.1                                             # ir inst 80 fin
.F.lca._21.while.exit.1:
  li t1, 1728
  mul t2, t4, t1
  add t6, a0, t2                                                        # ir inst 81 fin
  addi t5, t6, 1624                                                     # ir inst 82 fin
  addi t6, t5, 0                                                        # ir inst 83 fin
  ld t5, 0(t6)                                                          # ir inst 84 fin
  mv a0, t5
  j .F.lca.epilogue                                                     # ir inst 85 fin
.F.lca.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.dfs
.F.dfs:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 0 / 12,        range:       56(sp) -       56(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 56(sp)
.F.dfs._0.entry.0:
# Phi connections
  li t6, 0
  j .F.dfs._1.while.cond.0                                              # ir inst 1 fin
.F.dfs._1.while.cond.0:
  li t1, 1728
  mul t2, a3, t1
  add t5, a0, t2                                                        # ir inst 3 fin
  addi t4, t5, 1608                                                     # ir inst 4 fin
  ld t5, 0(t4)                                                          # ir inst 5 fin
  sltu t4, t6, t5                                                       # ir inst 6 fin
  bnez t4, .F.dfs._2.while.body.0
  j .F.dfs._6.while.exit.0                                              # ir inst 7 fin
.F.dfs._2.while.body.0:
  li t1, 1728
  mul t2, a3, t1
  add t5, a0, t2                                                        # ir inst 8 fin
  addi t4, t5, 0                                                        # ir inst 9 fin
  slli t2, t6, 3
  add t5, t4, t2                                                        # ir inst 10 fin
  ld t4, 0(t5)                                                          # ir inst 11 fin
  addi t5, t6, 1                                                        # ir inst 12 fin
  xor t0, t4, a4
  sltiu t6, t0, 1                                                       # ir inst 13 fin
  bnez t6, .F.dfs._3.if.then.0
  j .F.dfs._4.if.else.0                                                 # ir inst 14 fin
.F.dfs._3.if.then.0:
# Phi connections
  mv t6, t5
  j .F.dfs._1.while.cond.0                                              # ir inst 15 fin
.F.dfs._4.if.else.0:
  j .F.dfs._5.if.exit.0                                                 # ir inst 16 fin
.F.dfs._5.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  mv a4, a3
  mv a3, t4
  call .F.dfs
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
# ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.dfs._1.while.cond.0                                              # ir inst 18 fin
.F.dfs._6.while.exit.0:
  li t1, 1728
  mul t2, a3, t1
  add t6, a0, t2                                                        # ir inst 19 fin
  addi t5, t6, 1720                                                     # ir inst 20 fin
  li t1, 1728
  mul t2, a3, t1
  add t6, a0, t2                                                        # ir inst 21 fin
  addi t4, t6, 1712                                                     # ir inst 22 fin
  ld t6, 0(t4)                                                          # ir inst 23 fin
  slli t2, t6, 5
  add t4, a1, t2                                                        # ir inst 24 fin
  addi t6, t4, 24                                                       # ir inst 25 fin
  addi t4, t6, 4                                                        # ir inst 26 fin
  lw t6, 0(t4)                                                          # ir inst 27 fin
  sw t6, 0(t5)                                                          # ir inst 28 fin
  li t2, 0
  xor t0, a4, t2
  sltu t6, zero, t0                                                     # ir inst 29 fin
  bnez t6, .F.dfs._7.if.then.1
  j .F.dfs._8.if.else.1                                                 # ir inst 30 fin
.F.dfs._7.if.then.1:
  li t1, 1728
  mul t2, a4, t1
  add t6, a0, t2                                                        # ir inst 31 fin
  addi t5, t6, 1712                                                     # ir inst 32 fin
  li t1, 1728
  mul t2, a4, t1
  add t6, a0, t2                                                        # ir inst 33 fin
  addi t4, t6, 1712                                                     # ir inst 34 fin
  ld t6, 0(t4)                                                          # ir inst 35 fin
  li t1, 1728
  mul t2, a3, t1
  add t4, a0, t2                                                        # ir inst 36 fin
  addi t3, t4, 1712                                                     # ir inst 37 fin
  ld t4, 0(t3)                                                          # ir inst 38 fin
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a3, t4
  mv a0, a1
  mv a1, a2
  mv a2, t6
  call .F.merge
  mv t3, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 39 fin
  sd t3, 0(t5)                                                          # ir inst 40 fin
  j .F.dfs._9.if.exit.1                                                 # ir inst 41 fin
.F.dfs._8.if.else.1:
  j .F.dfs._9.if.exit.1                                                 # ir inst 42 fin
.F.dfs._9.if.exit.1:
  j .F.dfs.epilogue                                                     # ir inst 43 fin
.F.dfs.epilogue:
  ld ra, 56(sp)
  addi sp, sp, 64
  ret

.globl main
main:
# spill func args num: 0,             range:   413168(sp) -   413168(sp)
# local var size: 413096,             range:       72(sp) -   413168(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -413168
  add sp, sp, t0
  sd s9, 32(sp)
  sd s8, 40(sp)
  sd s10, 48(sp)
  sd s11, 56(sp)
  sd ra, 64(sp)
main._0.entry.0:
  li t1, 347400
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 3 fin
  addi t5, t6, 0                                                        # ir inst 4 fin
# Phi connections
  li t6, 0
  j main._1.array.cond.0                                                # ir inst 5 fin
main._1.array.cond.0:
  li t2, 201
  slt t4, t6, t2                                                        # ir inst 7 fin
  bnez t4, main._2.array.body.0
  j main._3.array.exit.0                                                # ir inst 8 fin
main._2.array.body.0:
  slli t2, t6, 3
  add t4, t5, t2                                                        # ir inst 9 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t4
  j main._1.array.cond.0                                                # ir inst 12 fin
main._3.array.exit.0:
  li t1, 347400
  add t1, sp, t1
  addi t6, t1, 1608                                                     # ir inst 13 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 14 fin
  li t1, 347400
  add t1, sp, t1
  addi t6, t1, 1616                                                     # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  li t1, 347400
  add t1, sp, t1
  addi t6, t1, 1624                                                     # ir inst 17 fin
  addi t5, t6, 0                                                        # ir inst 18 fin
# Phi connections
  li t6, 0
  j main._4.array.cond.1                                                # ir inst 19 fin
main._4.array.cond.1:
  li t2, 11
  slt t4, t6, t2                                                        # ir inst 21 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 22 fin
main._5.array.body.1:
  slli t2, t6, 3
  add t4, t5, t2                                                        # ir inst 23 fin
  li t1, 0
  sd t1, 0(t4)                                                          # ir inst 24 fin
  addi t4, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t6, t4
  j main._4.array.cond.1                                                # ir inst 26 fin
main._6.array.exit.1:
  li t1, 347400
  add t1, sp, t1
  addi t6, t1, 1712                                                     # ir inst 27 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 28 fin
  li t1, 347400
  add t1, sp, t1
  addi t6, t1, 1720                                                     # ir inst 29 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 30 fin
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 31 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 32 fin
main._7.array.cond.2:
  li t2, 201
  slt t4, t5, t2                                                        # ir inst 34 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 35 fin
main._8.array.body.2:
  li t1, 1728
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 36 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 1728
  li t1, 347400
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 37 fin
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 39 fin
main._9.array.exit.2:
  li t1, 413128
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 42 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 43 fin
  li t1, 413128
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 44 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 45 fin
  li t1, 413128
  add t1, sp, t1
  addi t6, t1, 8                                                        # ir inst 46 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 47 fin
  li t1, 413128
  add t1, sp, t1
  addi t6, t1, 16                                                       # ir inst 48 fin
  li t1, 0
  sd t1, 0(t6)                                                          # ir inst 49 fin
  li t1, 413128
  add t1, sp, t1
  addi t6, t1, 24                                                       # ir inst 50 fin
  addi t5, t6, 0                                                        # ir inst 51 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 52 fin
  addi t5, t6, 4                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 54 fin
  li t1, 349128
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 55 fin
# Phi connections
  li t5, 0
  j main._10.array.cond.3                                               # ir inst 56 fin
main._10.array.cond.3:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 58 fin
  bnez t4, main._11.array.body.3
  j main._12.array.exit.3                                               # ir inst 59 fin
main._11.array.body.3:
  slli t2, t5, 5
  add t4, t6, t2                                                        # ir inst 60 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li a2, 32
  li t1, 413128
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 61 fin
  addi t4, t5, 1                                                        # ir inst 62 fin
# Phi connections
  mv t5, t4
  j main._10.array.cond.3                                               # ir inst 63 fin
main._12.array.exit.3:
# alloca %37
  li t2, 413160
  add t2, sp, t2
  li t1, 0
  sd t1, 0(t2)                                                          # ir inst 65 fin
# Start call preparation
  call getInt
  mv t6, a0
# ir inst 66 fin
  mv t5, t6                                                             # ir inst 67 fin
# Start call preparation
  sd t5, 0(sp)
  call getInt
  mv t6, a0
  ld t5, 0(sp)
# ir inst 68 fin
  mv t4, t6                                                             # ir inst 69 fin
# Phi connections
  li t6, 1
  j main._13.while.cond.0                                               # ir inst 70 fin
main._13.while.cond.0:
  sltu t0, t5, t6
  xori t3, t0, 1                                                        # ir inst 72 fin
  bnez t3, main._14.while.body.0
  j main._15.while.exit.0                                               # ir inst 73 fin
main._14.while.body.0:
  li t1, 1728
  mul t2, t6, t1
  addi t1, sp, 72
  add t3, t1, t2                                                        # ir inst 74 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call .F._250uMAnM4NY_clear
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 75 fin
  li t1, 1728
  mul t2, t6, t1
  addi t1, sp, 72
  add t3, t1, t2                                                        # ir inst 76 fin
  addi s11, t3, 1712                                                    # ir inst 77 fin
  li t1, 200
  mv t3, t1                                                             # ir inst 78 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t3
  li a2, 1
  li t1, 413160
  add t1, sp, t1
  mv a1, t1
  li t1, 349128
  add t1, sp, t1
  mv a0, t1
  call .F.build
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 79 fin
  sd s10, 0(s11)                                                        # ir inst 80 fin
  addi t3, t6, 1                                                        # ir inst 81 fin
# Phi connections
  mv t6, t3
  j main._13.while.cond.0                                               # ir inst 82 fin
main._15.while.exit.0:
# Phi connections
  li t6, 0
  j main._16.while.cond.1                                               # ir inst 83 fin
main._16.while.cond.1:
  addi t3, t5, -1                                                       # ir inst 85 fin
  sltu s11, t6, t3                                                      # ir inst 86 fin
  bnez s11, main._17.while.body.1
  j main._18.while.exit.1                                               # ir inst 87 fin
main._17.while.body.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 88 fin
  mv s11, t3                                                            # ir inst 89 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 90 fin
  mv s10, t3                                                            # ir inst 91 fin
  li t1, 1728
  mul t2, s11, t1
  addi t1, sp, 72
  add t3, t1, t2                                                        # ir inst 92 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s10
  mv a0, t3
  call .F._250uMAnM4NY_push
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 93 fin
  li t1, 1728
  mul t2, s10, t1
  addi t1, sp, 72
  add t3, t1, t2                                                        # ir inst 94 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  mv a0, t3
  call .F._250uMAnM4NY_push
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 95 fin
  addi t3, t6, 1                                                        # ir inst 96 fin
# Phi connections
  mv t6, t3
  j main._16.while.cond.1                                               # ir inst 97 fin
main._18.while.exit.1:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  li a2, 0
  li a1, 1
  addi t1, sp, 72
  mv a0, t1
  call .F.prepare
  ld t4, 0(sp)
  ld t5, 8(sp)
# ir inst 98 fin
# Phi connections
  li t6, 0
  j main._19.while.cond.2                                               # ir inst 99 fin
main._19.while.cond.2:
  sltu t3, t6, t4                                                       # ir inst 101 fin
  bnez t3, main._20.while.body.2
  j main._24.while.exit.2                                               # ir inst 102 fin
main._20.while.body.2:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 103 fin
  mv s11, t3                                                            # ir inst 104 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 105 fin
  mv s10, t3                                                            # ir inst 106 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  call getInt
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 107 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, s10
  mv a1, s11
  addi t1, sp, 72
  mv a0, t1
  call .F.lca
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 108 fin
  li t1, 1728
  mul t2, s11, t1
  addi t1, sp, 72
  add s8, t1, t2                                                        # ir inst 109 fin
  addi s11, s8, 1712                                                    # ir inst 110 fin
  ld s8, 0(s11)                                                         # ir inst 111 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a4, 1
  mv a3, t3
  mv a2, s8
  li t1, 413160
  add t1, sp, t1
  mv a1, t1
  li t1, 349128
  add t1, sp, t1
  mv a0, t1
  call .F.update
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 112 fin
  li t1, 1728
  mul t2, s10, t1
  addi t1, sp, 72
  add s11, t1, t2                                                       # ir inst 113 fin
  addi s10, s11, 1712                                                   # ir inst 114 fin
  ld s11, 0(s10)                                                        # ir inst 115 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a4, 1
  mv a3, t3
  mv a2, s11
  li t1, 413160
  add t1, sp, t1
  mv a1, t1
  li t1, 349128
  add t1, sp, t1
  mv a0, t1
  call .F.update
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 116 fin
  li t1, 1728
  mul t2, s9, t1
  addi t1, sp, 72
  add s11, t1, t2                                                       # ir inst 117 fin
  addi s10, s11, 1712                                                   # ir inst 118 fin
  ld s11, 0(s10)                                                        # ir inst 119 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a4, -1
  mv a3, t3
  mv a2, s11
  li t1, 413160
  add t1, sp, t1
  mv a1, t1
  li t1, 349128
  add t1, sp, t1
  mv a0, t1
  call .F.update
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 120 fin
  li t1, 1728
  mul t2, s9, t1
  addi t1, sp, 72
  add s11, t1, t2                                                       # ir inst 121 fin
  addi s10, s11, 1624                                                   # ir inst 122 fin
  addi s11, s10, 0                                                      # ir inst 123 fin
  ld s10, 0(s11)                                                        # ir inst 124 fin
  li t2, 0
  xor t0, s10, t2
  sltu s11, zero, t0                                                    # ir inst 125 fin
  bnez s11, main._21.if.then.0
  j main._22.if.else.0                                                  # ir inst 126 fin
main._21.if.then.0:
  li t1, 1728
  mul t2, s9, t1
  addi t1, sp, 72
  add s11, t1, t2                                                       # ir inst 127 fin
  addi s10, s11, 1624                                                   # ir inst 128 fin
  addi s11, s10, 0                                                      # ir inst 129 fin
  ld s10, 0(s11)                                                        # ir inst 130 fin
  li t1, 1728
  mul t2, s10, t1
  addi t1, sp, 72
  add s11, t1, t2                                                       # ir inst 131 fin
  addi s10, s11, 1712                                                   # ir inst 132 fin
  ld s11, 0(s10)                                                        # ir inst 133 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a4, -1
  mv a3, t3
  mv a2, s11
  li t1, 413160
  add t1, sp, t1
  mv a1, t1
  li t1, 349128
  add t1, sp, t1
  mv a0, t1
  call .F.update
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 134 fin
  j main._23.if.exit.0                                                  # ir inst 135 fin
main._22.if.else.0:
  j main._23.if.exit.0                                                  # ir inst 136 fin
main._23.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 137 fin
# Phi connections
  mv t6, t3
  j main._19.while.cond.2                                               # ir inst 138 fin
main._24.while.exit.2:
# Start call preparation
  sd t5, 0(sp)
  li a4, 0
  li a3, 1
  li t1, 413160
  add t1, sp, t1
  mv a2, t1
  li t1, 349128
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 72
  mv a0, t1
  call .F.dfs
  ld t5, 0(sp)
# ir inst 139 fin
# Phi connections
  li t6, 1
  j main._25.while.cond.3                                               # ir inst 140 fin
main._25.while.cond.3:
  sltu t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 142 fin
  bnez t4, main._26.while.body.3
  j main._27.while.exit.3                                               # ir inst 143 fin
main._26.while.body.3:
  li t1, 1728
  mul t2, t6, t1
  addi t1, sp, 72
  add t4, t1, t2                                                        # ir inst 144 fin
  addi t3, t4, 1720                                                     # ir inst 145 fin
  lw t4, 0(t3)                                                          # ir inst 146 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 147 fin
  addi t4, t6, 1                                                        # ir inst 148 fin
# Phi connections
  mv t6, t4
  j main._25.while.cond.3                                               # ir inst 149 fin
main._27.while.exit.3:
# Start call preparation
  li a0, 0
  call exit
# ir inst 150 fin
  j main.epilogue                                                       # ir inst 151 fin
main.epilogue:
  ld ra, 64(sp)
  ld s9, 32(sp)
  ld s8, 40(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  li t0, 413168
  add sp, sp, t0
  ret
