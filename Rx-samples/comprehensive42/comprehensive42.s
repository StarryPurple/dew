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

.globl .F.init_heap
.F.init_heap:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_heap._0.entry.0:
# Phi connections
  li t6, 0
  j .F.init_heap._1.while.cond.0                                        # ir inst 1 fin
.F.init_heap._1.while.cond.0:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.init_heap._2.while.body.0
  j .F.init_heap._3.while.exit.0                                        # ir inst 4 fin
.F.init_heap._2.while.body.0:
  slli t5, t6, 4                                                        # ir inst 5 fin
  mv t4, t5                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 7 fin
  addi t4, t6, 1                                                        # ir inst 8 fin
  slli t3, t4, 4                                                        # ir inst 9 fin
  sw t3, 0(t5)                                                          # ir inst 10 fin
  addi t5, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.init_heap._1.while.cond.0                                        # ir inst 12 fin
.F.init_heap._3.while.exit.0:
  li t1, 1008
  mv t6, t1                                                             # ir inst 13 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 14 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 15 fin
  li t1, 0
  sw t1, 0(a1)                                                          # ir inst 16 fin
  j .F.init_heap.epilogue                                               # ir inst 17 fin
.F.init_heap.epilogue:
  ret

.globl .F.alloc
.F.alloc:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.alloc._0.entry.0:
  lw t6, 0(a1)                                                          # ir inst 1 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.alloc._1.if.then.0
  j .F.alloc._2.if.else.0                                               # ir inst 3 fin
.F.alloc._1.if.then.0:
  li a0, -1
  j .F.alloc.epilogue                                                   # ir inst 4 fin
.F.alloc._2.if.else.0:
  j .F.alloc._3.if.exit.0                                               # ir inst 5 fin
.F.alloc._3.if.exit.0:
  lw t6, 0(a1)                                                          # ir inst 6 fin
  mv t5, t6                                                             # ir inst 7 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t5, 0(t4)                                                          # ir inst 9 fin
  sw t5, 0(a1)                                                          # ir inst 10 fin
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 12 fin
  li t1, -2
  sw t1, 0(t4)                                                          # ir inst 13 fin
  mv a0, t6
  j .F.alloc.epilogue                                                   # ir inst 14 fin
.F.alloc.epilogue:
  ret

.globl .F.free
.F.free:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.free._0.entry.0:
  mv t6, a2                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 2 fin
  lw t6, 0(a1)                                                          # ir inst 3 fin
  sw t6, 0(t5)                                                          # ir inst 4 fin
  sw a2, 0(a1)                                                          # ir inst 5 fin
  j .F.free.epilogue                                                    # ir inst 6 fin
.F.free.epilogue:
  ret

.globl main
main:
# spill func args num: 0,             range:     4416(sp) -     4416(sp)
# local var size: 4356,               range:       48(sp) -     4404(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4416
  add sp, sp, t0
  sd s10, 24(sp)
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
  li t1, 4148
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 15 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 16 fin
main._4.array.cond.1:
  li t2, 64
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
  li t6, 0
  j main._7.while.cond.0                                                # ir inst 24 fin
main._7.while.cond.0:
  li t2, 64
  slt t5, t6, t2                                                        # ir inst 26 fin
  bnez t5, main._8.while.body.0
  j main._12.while.exit.0                                               # ir inst 27 fin
main._8.while.body.0:
# Start call preparation
  sd t6, 0(sp)
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.alloc
  mv t5, a0
  ld t6, 0(sp)
# ir inst 28 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 29 fin
  bnez t4, main._9.if.then.0
  j main._10.if.else.0                                                  # ir inst 30 fin
main._9.if.then.0:
  mv t4, t6                                                             # ir inst 31 fin
  slli t2, t4, 2
  li t1, 4148
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 32 fin
  sw t5, 0(t3)                                                          # ir inst 33 fin
  j main._11.if.exit.0                                                  # ir inst 34 fin
main._10.if.else.0:
  j main._11.if.exit.0                                                  # ir inst 35 fin
main._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t5
  j main._7.while.cond.0                                                # ir inst 37 fin
main._12.while.exit.0:
# Phi connections
  li t6, 0
  j main._13.while.cond.1                                               # ir inst 38 fin
main._13.while.cond.1:
  li t2, 32
  slt t5, t6, t2                                                        # ir inst 40 fin
  bnez t5, main._14.while.body.1
  j main._18.while.exit.1                                               # ir inst 41 fin
main._14.while.body.1:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 42 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 43 fin
  bnez t4, main._15.if.then.1
  j main._16.if.else.1                                                  # ir inst 44 fin
main._15.if.then.1:
  mv t5, t6                                                             # ir inst 45 fin
  slli t2, t5, 2
  li t1, 4148
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 46 fin
  lw t5, 0(t4)                                                          # ir inst 47 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a2, t5
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.free
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 48 fin
  mv t5, t6                                                             # ir inst 49 fin
  slli t2, t5, 2
  li t1, 4148
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 50 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 51 fin
  j main._17.if.exit.1                                                  # ir inst 52 fin
main._16.if.else.1:
  j main._17.if.exit.1                                                  # ir inst 53 fin
main._17.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 54 fin
# Phi connections
  mv t6, t5
  j main._13.while.cond.1                                               # ir inst 55 fin
main._18.while.exit.1:
# Phi connections
  li t6, 0
  j main._19.while.cond.2                                               # ir inst 56 fin
main._19.while.cond.2:
  li t2, 16
  slt t5, t6, t2                                                        # ir inst 58 fin
  bnez t5, main._20.while.body.2
  j main._33.while.exit.2                                               # ir inst 59 fin
main._20.while.body.2:
# Start call preparation
  sd t6, 0(sp)
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.alloc
  mv t5, a0
  ld t6, 0(sp)
# ir inst 60 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 61 fin
  bnez t4, main._21.if.then.2
  j main._31.if.else.2                                                  # ir inst 62 fin
main._21.if.then.2:
# Phi connections
  li t3, 0
  li t4, 0
  j main._22.while.cond.3                                               # ir inst 63 fin
main._22.while.cond.3:
  li t2, 64
  slt s11, t4, t2                                                       # ir inst 66 fin
  bnez s11, main._23.while.body.3
  j main._30.while.exit.3                                               # ir inst 67 fin
main._23.while.body.3:
  mv s11, t4                                                            # ir inst 68 fin
  slli t2, s11, 2
  li t1, 4148
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 69 fin
  lw s11, 0(s10)                                                        # ir inst 70 fin
  li t2, -1
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 71 fin
  bnez s10, main._24.lazy.then.0
  j main._25.lazy.else.0                                                # ir inst 72 fin
main._24.lazy.then.0:
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 73 fin
# Phi connections
  j main._26.lazy.exit.0                                                # ir inst 74 fin
main._25.lazy.else.0:
# Phi connections
  li s11, 0
  j main._26.lazy.exit.0                                                # ir inst 75 fin
main._26.lazy.exit.0:
  bnez s11, main._27.if.then.3
  j main._28.if.else.3                                                  # ir inst 77 fin
main._27.if.then.3:
  mv s11, t4                                                            # ir inst 78 fin
  slli t2, s11, 2
  li t1, 4148
  add t1, sp, t1
  add s10, t1, t2                                                       # ir inst 79 fin
  sw t5, 0(s10)                                                         # ir inst 80 fin
# Phi connections
  li t3, 1
  j main._29.if.exit.3                                                  # ir inst 81 fin
main._28.if.else.3:
# Phi connections
  j main._29.if.exit.3                                                  # ir inst 82 fin
main._29.if.exit.3:
  addi s11, t4, 1                                                       # ir inst 84 fin
# Phi connections
  mv t4, s11
  j main._22.while.cond.3                                               # ir inst 85 fin
main._30.while.exit.3:
  j main._32.if.exit.2                                                  # ir inst 86 fin
main._31.if.else.2:
  j main._32.if.exit.2                                                  # ir inst 87 fin
main._32.if.exit.2:
  addi t5, t6, 1                                                        # ir inst 88 fin
# Phi connections
  mv t6, t5
  j main._19.while.cond.2                                               # ir inst 89 fin
main._33.while.exit.2:
# Phi connections
  li t5, 0
  li t6, 0
  j main._34.while.cond.4                                               # ir inst 90 fin
main._34.while.cond.4:
  li t2, 64
  slt t4, t6, t2                                                        # ir inst 93 fin
  bnez t4, main._35.while.body.4
  j main._39.while.exit.4                                               # ir inst 94 fin
main._35.while.body.4:
  mv t4, t6                                                             # ir inst 95 fin
  slli t2, t4, 2
  li t1, 4148
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 96 fin
  lw t4, 0(t3)                                                          # ir inst 97 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 98 fin
  bnez t3, main._36.if.then.4
  j main._37.if.else.4                                                  # ir inst 99 fin
main._36.if.then.4:
  addi t4, t5, 1                                                        # ir inst 100 fin
# Phi connections
  j main._38.if.exit.4                                                  # ir inst 101 fin
main._37.if.else.4:
# Phi connections
  mv t4, t5
  j main._38.if.exit.4                                                  # ir inst 102 fin
main._38.if.exit.4:
  addi t3, t6, 1                                                        # ir inst 104 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j main._34.while.cond.4                                               # ir inst 105 fin
main._39.while.exit.4:
  li t2, 40
  slt t6, t2, t5                                                        # ir inst 106 fin
  bnez t6, main._40.if.then.5
  j main._53.if.else.5                                                  # ir inst 107 fin
main._40.if.then.5:
  li t1, 4144
  add t1, sp, t1
  lw t6, 0(t1)                                                          # ir inst 108 fin
# Phi connections
  li t3, 0
  li t4, 0
  j main._41.while.cond.5                                               # ir inst 109 fin
main._41.while.cond.5:
  li t2, -1
  xor t0, t6, t2
  sltu s11, zero, t0                                                    # ir inst 113 fin
  bnez s11, main._42.while.body.5
  j main._49.while.exit.5                                               # ir inst 114 fin
main._42.while.body.5:
  addi s11, t4, 1                                                       # ir inst 115 fin
  mv t4, t6                                                             # ir inst 116 fin
  slli t2, t4, 2
  addi t1, sp, 48
  add s10, t1, t2                                                       # ir inst 117 fin
  lw t4, 0(s10)                                                         # ir inst 118 fin
  addi s10, t6, 16                                                      # ir inst 119 fin
  xor t0, t4, s10
  sltu t6, zero, t0                                                     # ir inst 120 fin
  bnez t6, main._43.if.then.6
  j main._47.if.else.6                                                  # ir inst 121 fin
main._43.if.then.6:
  slt t6, t3, s11                                                       # ir inst 122 fin
  bnez t6, main._44.if.then.7
  j main._45.if.else.7                                                  # ir inst 123 fin
main._44.if.then.7:
# Phi connections
  mv t6, s11
  j main._46.if.exit.7                                                  # ir inst 124 fin
main._45.if.else.7:
# Phi connections
  mv t6, t3
  j main._46.if.exit.7                                                  # ir inst 125 fin
main._46.if.exit.7:
# Phi connections
  mv s11, t6
  li t6, 0
  j main._48.if.exit.6                                                  # ir inst 127 fin
main._47.if.else.6:
# Phi connections
  mv t6, s11
  mv s11, t3
  j main._48.if.exit.6                                                  # ir inst 128 fin
main._48.if.exit.6:
# Phi connections
  mv t3, s11
  mv t0, t4
  mv t4, t6
  mv t6, t0
  j main._41.while.cond.5                                               # ir inst 131 fin
main._49.while.exit.5:
  li t1, 64
  sub t6, t1, t5                                                        # ir inst 132 fin
  li t2, 0
  slt t4, t2, t6                                                        # ir inst 133 fin
  bnez t4, main._50.if.then.8
  j main._51.if.else.8                                                  # ir inst 134 fin
main._50.if.then.8:
  li t2, 100
  mul t4, t3, t2                                                        # ir inst 135 fin
  div t3, t4, t6                                                        # ir inst 136 fin
# Phi connections
  mv t6, t3
  j main._52.if.exit.8                                                  # ir inst 137 fin
main._51.if.else.8:
# Phi connections
  li t6, 0
  j main._52.if.exit.8                                                  # ir inst 138 fin
main._52.if.exit.8:
# Phi connections
  j main._54.if.exit.5                                                  # ir inst 140 fin
main._53.if.else.5:
# Phi connections
  li t6, 0
  j main._54.if.exit.5                                                  # ir inst 141 fin
main._54.if.exit.5:
  li t2, 48
  slt t4, t5, t2                                                        # ir inst 143 fin
  bnez t4, main._55.if.then.9
  j main._65.if.else.9                                                  # ir inst 144 fin
main._55.if.then.9:
# Phi connections
  li t5, 32
  j main._56.while.cond.6                                               # ir inst 145 fin
main._56.while.cond.6:
  li t2, 64
  slt t4, t5, t2                                                        # ir inst 147 fin
  bnez t4, main._57.while.body.6
  j main._64.while.exit.6                                               # ir inst 148 fin
main._57.while.body.6:
  li t2, 3
  rem t4, t5, t2                                                        # ir inst 149 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 150 fin
  bnez t3, main._58.if.then.10
  j main._62.if.else.10                                                 # ir inst 151 fin
main._58.if.then.10:
  mv t4, t5                                                             # ir inst 152 fin
  slli t2, t4, 2
  li t1, 4148
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 153 fin
  lw t4, 0(t3)                                                          # ir inst 154 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 155 fin
  bnez t3, main._59.if.then.11
  j main._60.if.else.11                                                 # ir inst 156 fin
main._59.if.then.11:
  mv t4, t5                                                             # ir inst 157 fin
  slli t2, t4, 2
  li t1, 4148
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 158 fin
  lw t4, 0(t3)                                                          # ir inst 159 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t4
  li t1, 4144
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 48
  mv a0, t1
  call .F.free
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 160 fin
  mv t4, t5                                                             # ir inst 161 fin
  slli t2, t4, 2
  li t1, 4148
  add t1, sp, t1
  add t3, t1, t2                                                        # ir inst 162 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 163 fin
  j main._61.if.exit.11                                                 # ir inst 164 fin
main._60.if.else.11:
  j main._61.if.exit.11                                                 # ir inst 165 fin
main._61.if.exit.11:
  j main._63.if.exit.10                                                 # ir inst 166 fin
main._62.if.else.10:
  j main._63.if.exit.10                                                 # ir inst 167 fin
main._63.if.exit.10:
  addi t4, t5, 1                                                        # ir inst 168 fin
# Phi connections
  mv t5, t4
  j main._56.while.cond.6                                               # ir inst 169 fin
main._64.while.exit.6:
  j main._66.if.exit.9                                                  # ir inst 170 fin
main._65.if.else.9:
  j main._66.if.exit.9                                                  # ir inst 171 fin
main._66.if.exit.9:
# Phi connections
  li t4, 0
  li t5, 0
  j main._67.while.cond.7                                               # ir inst 172 fin
main._67.while.cond.7:
  li t2, 1024
  slt t3, t5, t2                                                        # ir inst 175 fin
  bnez t3, main._68.while.body.7
  j main._72.while.exit.7                                               # ir inst 176 fin
main._68.while.body.7:
  mv t3, t5                                                             # ir inst 177 fin
  slli t2, t3, 2
  addi t1, sp, 48
  add s11, t1, t2                                                       # ir inst 178 fin
  lw t3, 0(s11)                                                         # ir inst 179 fin
  li t2, -2
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 180 fin
  bnez s11, main._69.if.then.12
  j main._70.if.else.12                                                 # ir inst 181 fin
main._69.if.then.12:
  add t3, t4, t5                                                        # ir inst 182 fin
# Phi connections
  j main._71.if.exit.12                                                 # ir inst 183 fin
main._70.if.else.12:
# Phi connections
  mv t3, t4
  j main._71.if.exit.12                                                 # ir inst 184 fin
main._71.if.exit.12:
  addi s11, t5, 1                                                       # ir inst 186 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j main._67.while.cond.7                                               # ir inst 187 fin
main._72.while.exit.7:
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call printlnInt
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 188 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 189 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 190 fin
  j main.epilogue                                                       # ir inst 191 fin
main.epilogue:
  ld ra, 40(sp)
  ld s10, 24(sp)
  ld s11, 32(sp)
  li t0, 4416
  add sp, sp, t0
  ret
