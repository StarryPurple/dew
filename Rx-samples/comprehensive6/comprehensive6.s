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
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 0(sp)
main._0.entry.0:
# Start call preparation
  li a0, 1600
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.testStringSearchAlgorithms
# ir inst 2 fin
# Start call preparation
  call .F.testTextProcessingAlgorithms
# ir inst 3 fin
# Start call preparation
  call .F.testStringParsingAlgorithms
# ir inst 4 fin
# Start call preparation
  call .F.testStringCompressionAlgorithms
# ir inst 5 fin
# Start call preparation
  call .F.testAdvancedStringAlgorithms
# ir inst 6 fin
# Start call preparation
  li a0, 1699
  call printlnInt
# ir inst 7 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 8 fin
  j main.epilogue                                                       # ir inst 9 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testStringSearchAlgorithms
.F.testStringSearchAlgorithms:
# spill func args num: 0,             range:     4064(sp) -     4064(sp)
# local var size: 4040,               range:       16(sp) -     4056(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4064
  add sp, sp, t0
  sd ra, 8(sp)
.F.testStringSearchAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1601
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testStringSearchAlgorithms._1.array.cond.0                       # ir inst 4 fin
.F.testStringSearchAlgorithms._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testStringSearchAlgorithms._2.array.body.0
  j .F.testStringSearchAlgorithms._3.array.exit.0                       # ir inst 7 fin
.F.testStringSearchAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testStringSearchAlgorithms._1.array.cond.0                       # ir inst 11 fin
.F.testStringSearchAlgorithms._3.array.exit.0:
  li t1, 4016
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.testStringSearchAlgorithms._4.array.cond.1                       # ir inst 14 fin
.F.testStringSearchAlgorithms._4.array.cond.1:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.testStringSearchAlgorithms._5.array.body.1
  j .F.testStringSearchAlgorithms._6.array.exit.1                       # ir inst 17 fin
.F.testStringSearchAlgorithms._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.testStringSearchAlgorithms._4.array.cond.1                       # ir inst 21 fin
.F.testStringSearchAlgorithms._6.array.exit.1:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeTextString
# ir inst 22 fin
# Start call preparation
  li t1, 4016
  add t1, sp, t1
  mv a0, t1
  call .F.initializePatternString
# ir inst 23 fin
# Start call preparation
  li a3, 10
  li t1, 4016
  add t1, sp, t1
  mv a2, t1
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.naiveStringSearch
  mv t6, a0
# ir inst 24 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 25 fin
# Start call preparation
  li a3, 10
  li t1, 4016
  add t1, sp, t1
  mv a2, t1
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.kmpStringSearch
  mv t6, a0
# ir inst 26 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 27 fin
# Start call preparation
  li a3, 10
  li t1, 4016
  add t1, sp, t1
  mv a2, t1
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.boyerMooreStringSearch
  mv t6, a0
# ir inst 28 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 29 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.multiplePatternSearch
  mv t6, a0
# ir inst 30 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 31 fin
# Start call preparation
  li a0, 1602
  call printlnInt
# ir inst 32 fin
  j .F.testStringSearchAlgorithms.epilogue                              # ir inst 33 fin
.F.testStringSearchAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 4064
  add sp, sp, t0
  ret

.globl .F.initializeTextString
.F.initializeTextString:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.initializeTextString._0.entry.0:
# Phi connections
  li t5, 125
  li t6, 0
  j .F.initializeTextString._1.while.cond.0                             # ir inst 1 fin
.F.initializeTextString._1.while.cond.0:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.initializeTextString._2.while.body.0
  j .F.initializeTextString._3.while.exit.0                             # ir inst 5 fin
.F.initializeTextString._2.while.body.0:
  li t2, 166
  mul t4, t5, t2                                                        # ir inst 6 fin
  addi t5, t4, 1013                                                     # ir inst 7 fin
  li t2, 214743
  rem t4, t5, t2                                                        # ir inst 8 fin
  mv t5, t6                                                             # ir inst 9 fin
  slli t2, t5, 2
  add t3, a0, t2                                                        # ir inst 10 fin
  li t2, 95
  rem t5, t4, t2                                                        # ir inst 11 fin
  addi s11, t5, 32                                                      # ir inst 12 fin
  sw s11, 0(t3)                                                         # ir inst 13 fin
  addi t5, t6, 1                                                        # ir inst 14 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.initializeTextString._1.while.cond.0                             # ir inst 15 fin
.F.initializeTextString._3.while.exit.0:
  addi t6, a0, 400                                                      # ir inst 16 fin
  li t1, 65
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t6, a0, 404                                                      # ir inst 18 fin
  li t1, 66
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t6, a0, 408                                                      # ir inst 20 fin
  li t1, 67
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t6, a0, 412                                                      # ir inst 22 fin
  li t1, 68
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t6, a0, 2000                                                     # ir inst 24 fin
  li t1, 65
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t6, a0, 2004                                                     # ir inst 26 fin
  li t1, 66
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t6, a0, 2008                                                     # ir inst 28 fin
  li t1, 67
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t6, a0, 2012                                                     # ir inst 30 fin
  li t1, 68
  sw t1, 0(t6)                                                          # ir inst 31 fin
  j .F.initializeTextString.epilogue                                    # ir inst 32 fin
.F.initializeTextString.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.initializePatternString
.F.initializePatternString:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializePatternString._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  li t1, 65
  sw t1, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 4                                                        # ir inst 3 fin
  li t1, 66
  sw t1, 0(t6)                                                          # ir inst 4 fin
  addi t6, a0, 8                                                        # ir inst 5 fin
  li t1, 67
  sw t1, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 12                                                       # ir inst 7 fin
  li t1, 68
  sw t1, 0(t6)                                                          # ir inst 8 fin
# Phi connections
  li t6, 4
  j .F.initializePatternString._1.while.cond.0                          # ir inst 9 fin
.F.initializePatternString._1.while.cond.0:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 11 fin
  bnez t5, .F.initializePatternString._2.while.body.0
  j .F.initializePatternString._3.while.exit.0                          # ir inst 12 fin
.F.initializePatternString._2.while.body.0:
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.initializePatternString._1.while.cond.0                          # ir inst 17 fin
.F.initializePatternString._3.while.exit.0:
  j .F.initializePatternString.epilogue                                 # ir inst 18 fin
.F.initializePatternString.epilogue:
  ret

.globl .F.naiveStringSearch
.F.naiveStringSearch:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.naiveStringSearch._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.naiveStringSearch._1.while.cond.0                                # ir inst 1 fin
.F.naiveStringSearch._1.while.cond.0:
  sub t4, a1, a3                                                        # ir inst 4 fin
  slt t0, t4, t6
  xori t3, t0, 1                                                        # ir inst 5 fin
  bnez t3, .F.naiveStringSearch._2.while.body.0
  j .F.naiveStringSearch._12.while.exit.0                               # ir inst 6 fin
.F.naiveStringSearch._2.while.body.0:
# Phi connections
  li t4, 0
  j .F.naiveStringSearch._3.while.cond.1                                # ir inst 7 fin
.F.naiveStringSearch._3.while.cond.1:
  slt t3, t4, a3                                                        # ir inst 9 fin
  bnez t3, .F.naiveStringSearch._4.while.body.1
  j .F.naiveStringSearch._13.critical_edge.0                            # ir inst 10 fin
.F.naiveStringSearch._4.while.body.1:
  add t3, t6, t4                                                        # ir inst 11 fin
  mv s11, t3                                                            # ir inst 12 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  lw s11, 0(t3)                                                         # ir inst 14 fin
  mv t3, t4                                                             # ir inst 15 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 16 fin
  lw t3, 0(s10)                                                         # ir inst 17 fin
  xor t0, s11, t3
  sltu s10, zero, t0                                                    # ir inst 18 fin
  bnez s10, .F.naiveStringSearch._5.if.then.0
  j .F.naiveStringSearch._6.if.else.0                                   # ir inst 19 fin
.F.naiveStringSearch._5.if.then.0:
# Phi connections
  li t4, 0
  j .F.naiveStringSearch._8.while.exit.1                                # ir inst 20 fin
.F.naiveStringSearch._6.if.else.0:
  j .F.naiveStringSearch._7.if.exit.0                                   # ir inst 21 fin
.F.naiveStringSearch._7.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 22 fin
# Phi connections
  mv t4, t3
  j .F.naiveStringSearch._3.while.cond.1                                # ir inst 23 fin
.F.naiveStringSearch._8.while.exit.1:
  bnez t4, .F.naiveStringSearch._9.if.then.1
  j .F.naiveStringSearch._10.if.else.1                                  # ir inst 25 fin
.F.naiveStringSearch._9.if.then.1:
  addi t4, t5, 1                                                        # ir inst 26 fin
# Phi connections
  j .F.naiveStringSearch._11.if.exit.1                                  # ir inst 27 fin
.F.naiveStringSearch._10.if.else.1:
# Phi connections
  mv t4, t5
  j .F.naiveStringSearch._11.if.exit.1                                  # ir inst 28 fin
.F.naiveStringSearch._11.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.naiveStringSearch._1.while.cond.0                                # ir inst 31 fin
.F.naiveStringSearch._12.while.exit.0:
  mv a0, t5
  j .F.naiveStringSearch.epilogue                                       # ir inst 32 fin
.F.naiveStringSearch._13.critical_edge.0:
# Phi connections
  li t4, 1
  j .F.naiveStringSearch._8.while.exit.1                                # ir inst 33 fin
.F.naiveStringSearch.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.kmpStringSearch
.F.kmpStringSearch:
# spill func args num: 0,             range:      144(sp) -      144(sp)
# local var size: 80,                 range:       56(sp) -      136(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -144
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.kmpStringSearch._0.entry.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.kmpStringSearch._1.array.cond.0                                  # ir inst 3 fin
.F.kmpStringSearch._1.array.cond.0:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.kmpStringSearch._2.array.body.0
  j .F.kmpStringSearch._3.array.exit.0                                  # ir inst 6 fin
.F.kmpStringSearch._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.kmpStringSearch._1.array.cond.0                                  # ir inst 10 fin
.F.kmpStringSearch._3.array.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a1, a3
  mv a0, a2
  addi t1, sp, 56
  mv a2, t1
  call .F.computeLPSArray
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 11 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.kmpStringSearch._4.while.cond.0                                  # ir inst 12 fin
.F.kmpStringSearch._4.while.cond.0:
  slt t3, t5, a1                                                        # ir inst 16 fin
  bnez t3, .F.kmpStringSearch._5.while.body.0
  j .F.kmpStringSearch._21.while.exit.0                                 # ir inst 17 fin
.F.kmpStringSearch._5.while.body.0:
  mv t3, t4                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 19 fin
  lw t3, 0(s11)                                                         # ir inst 20 fin
  mv s11, t5                                                            # ir inst 21 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 22 fin
  lw s11, 0(s10)                                                        # ir inst 23 fin
  xor t0, t3, s11
  sltiu s10, t0, 1                                                      # ir inst 24 fin
  bnez s10, .F.kmpStringSearch._6.if.then.0
  j .F.kmpStringSearch._7.if.else.0                                     # ir inst 25 fin
.F.kmpStringSearch._6.if.then.0:
  addi t3, t5, 1                                                        # ir inst 26 fin
  addi s11, t4, 1                                                       # ir inst 27 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.kmpStringSearch._8.if.exit.0                                     # ir inst 28 fin
.F.kmpStringSearch._7.if.else.0:
# Phi connections
  j .F.kmpStringSearch._8.if.exit.0                                     # ir inst 29 fin
.F.kmpStringSearch._8.if.exit.0:
  xor t0, t4, a3
  sltiu t3, t0, 1                                                       # ir inst 32 fin
  bnez t3, .F.kmpStringSearch._9.if.then.1
  j .F.kmpStringSearch._10.if.else.1                                    # ir inst 33 fin
.F.kmpStringSearch._9.if.then.1:
  addi t3, t6, 1                                                        # ir inst 34 fin
  mv s11, t4                                                            # ir inst 35 fin
  addi s10, s11, -1                                                     # ir inst 36 fin
  slli t2, s10, 2
  addi t1, sp, 56
  add s11, t1, t2                                                       # ir inst 37 fin
  lw s10, 0(s11)                                                        # ir inst 38 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  mv t3, s10
  j .F.kmpStringSearch._20.if.exit.1                                    # ir inst 39 fin
.F.kmpStringSearch._10.if.else.1:
  slt t3, t5, a1                                                        # ir inst 40 fin
  bnez t3, .F.kmpStringSearch._11.lazy.then.0
  j .F.kmpStringSearch._12.lazy.else.0                                  # ir inst 41 fin
.F.kmpStringSearch._11.lazy.then.0:
  mv t3, t4                                                             # ir inst 42 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 43 fin
  lw t3, 0(s11)                                                         # ir inst 44 fin
  mv s11, t5                                                            # ir inst 45 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 46 fin
  lw s11, 0(s10)                                                        # ir inst 47 fin
  xor t0, t3, s11
  sltu s10, zero, t0                                                    # ir inst 48 fin
# Phi connections
  mv t3, s10
  j .F.kmpStringSearch._13.lazy.exit.0                                  # ir inst 49 fin
.F.kmpStringSearch._12.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.kmpStringSearch._13.lazy.exit.0                                  # ir inst 50 fin
.F.kmpStringSearch._13.lazy.exit.0:
  bnez t3, .F.kmpStringSearch._14.if.then.2
  j .F.kmpStringSearch._18.if.else.2                                    # ir inst 52 fin
.F.kmpStringSearch._14.if.then.2:
  li t2, 0
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 53 fin
  bnez t3, .F.kmpStringSearch._15.if.then.3
  j .F.kmpStringSearch._16.if.else.3                                    # ir inst 54 fin
.F.kmpStringSearch._15.if.then.3:
  mv t3, t4                                                             # ir inst 55 fin
  addi s11, t3, -1                                                      # ir inst 56 fin
  slli t2, s11, 2
  addi t1, sp, 56
  add t3, t1, t2                                                        # ir inst 57 fin
  lw s11, 0(t3)                                                         # ir inst 58 fin
# Phi connections
  mv t3, t5
  j .F.kmpStringSearch._17.if.exit.3                                    # ir inst 59 fin
.F.kmpStringSearch._16.if.else.3:
  addi t3, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv s11, t4
  j .F.kmpStringSearch._17.if.exit.3                                    # ir inst 61 fin
.F.kmpStringSearch._17.if.exit.3:
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.kmpStringSearch._19.if.exit.2                                    # ir inst 64 fin
.F.kmpStringSearch._18.if.else.2:
# Phi connections
  j .F.kmpStringSearch._19.if.exit.2                                    # ir inst 65 fin
.F.kmpStringSearch._19.if.exit.2:
# Phi connections
  mv t3, t4
  mv t4, t5
  mv t5, t6
  j .F.kmpStringSearch._20.if.exit.1                                    # ir inst 68 fin
.F.kmpStringSearch._20.if.exit.1:
# Phi connections
  mv t6, t5
  mv t5, t4
  mv t4, t3
  j .F.kmpStringSearch._4.while.cond.0                                  # ir inst 72 fin
.F.kmpStringSearch._21.while.exit.0:
  mv a0, t6
  j .F.kmpStringSearch.epilogue                                         # ir inst 73 fin
.F.kmpStringSearch.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 144
  ret

.globl .F.computeLPSArray
.F.computeLPSArray:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.computeLPSArray._0.entry.0:
  addi t6, a2, 0                                                        # ir inst 1 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 2 fin
# Phi connections
  li t5, 0
  li t6, 1
  j .F.computeLPSArray._1.while.cond.0                                  # ir inst 3 fin
.F.computeLPSArray._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 6 fin
  bnez t4, .F.computeLPSArray._2.while.body.0
  j .F.computeLPSArray._9.while.exit.0                                  # ir inst 7 fin
.F.computeLPSArray._2.while.body.0:
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 9 fin
  lw t4, 0(t3)                                                          # ir inst 10 fin
  mv t3, t5                                                             # ir inst 11 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
  xor t0, t4, t3
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.computeLPSArray._3.if.then.0
  j .F.computeLPSArray._4.if.else.0                                     # ir inst 15 fin
.F.computeLPSArray._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 16 fin
  mv t3, t6                                                             # ir inst 17 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 18 fin
  sw t4, 0(s11)                                                         # ir inst 19 fin
  addi t3, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.computeLPSArray._8.if.exit.0                                     # ir inst 21 fin
.F.computeLPSArray._4.if.else.0:
  li t2, 0
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 22 fin
  bnez t4, .F.computeLPSArray._5.if.then.1
  j .F.computeLPSArray._6.if.else.1                                     # ir inst 23 fin
.F.computeLPSArray._5.if.then.1:
  mv t4, t5                                                             # ir inst 24 fin
  addi t3, t4, -1                                                       # ir inst 25 fin
  slli t2, t3, 2
  add t4, a2, t2                                                        # ir inst 26 fin
  lw t3, 0(t4)                                                          # ir inst 27 fin
# Phi connections
  mv t5, t3
  j .F.computeLPSArray._7.if.exit.1                                     # ir inst 28 fin
.F.computeLPSArray._6.if.else.1:
  mv t4, t6                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 30 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 31 fin
  addi t4, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t6, t4
  j .F.computeLPSArray._7.if.exit.1                                     # ir inst 33 fin
.F.computeLPSArray._7.if.exit.1:
# Phi connections
  j .F.computeLPSArray._8.if.exit.0                                     # ir inst 36 fin
.F.computeLPSArray._8.if.exit.0:
# Phi connections
  j .F.computeLPSArray._1.while.cond.0                                  # ir inst 39 fin
.F.computeLPSArray._9.while.exit.0:
  j .F.computeLPSArray.epilogue                                         # ir inst 40 fin
.F.computeLPSArray.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.boyerMooreStringSearch
.F.boyerMooreStringSearch:
# spill func args num: 0,             range:     1056(sp) -     1056(sp)
# local var size: 1024,               range:       24(sp) -     1048(sp)
# return addr size: 0,                range:       24(sp) -       24(sp)
# callee save reg num: 3 / 12,        range:        0(sp) -       24(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1056
  sd s9, 0(sp)
  sd s10, 8(sp)
  sd s11, 16(sp)
.F.boyerMooreStringSearch._0.entry.0:
  addi t1, sp, 24
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.boyerMooreStringSearch._1.array.cond.0                           # ir inst 3 fin
.F.boyerMooreStringSearch._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.boyerMooreStringSearch._2.array.body.0
  j .F.boyerMooreStringSearch._3.array.exit.0                           # ir inst 6 fin
.F.boyerMooreStringSearch._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.boyerMooreStringSearch._1.array.cond.0                           # ir inst 10 fin
.F.boyerMooreStringSearch._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.boyerMooreStringSearch._4.while.cond.0                           # ir inst 11 fin
.F.boyerMooreStringSearch._4.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 13 fin
  bnez t5, .F.boyerMooreStringSearch._5.while.body.0
  j .F.boyerMooreStringSearch._12.while.exit.0                          # ir inst 14 fin
.F.boyerMooreStringSearch._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 16 fin
  lw t5, 0(t4)                                                          # ir inst 17 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 18 fin
  bnez t4, .F.boyerMooreStringSearch._6.lazy.then.0
  j .F.boyerMooreStringSearch._7.lazy.else.0                            # ir inst 19 fin
.F.boyerMooreStringSearch._6.lazy.then.0:
  mv t5, t6                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 21 fin
  lw t5, 0(t4)                                                          # ir inst 22 fin
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.boyerMooreStringSearch._8.lazy.exit.0                            # ir inst 24 fin
.F.boyerMooreStringSearch._7.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.boyerMooreStringSearch._8.lazy.exit.0                            # ir inst 25 fin
.F.boyerMooreStringSearch._8.lazy.exit.0:
  bnez t5, .F.boyerMooreStringSearch._9.if.then.0
  j .F.boyerMooreStringSearch._10.if.else.0                             # ir inst 27 fin
.F.boyerMooreStringSearch._9.if.then.0:
  mv t5, t6                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 29 fin
  lw t5, 0(t4)                                                          # ir inst 30 fin
  mv t4, t5                                                             # ir inst 31 fin
  slli t2, t4, 2
  addi t1, sp, 24
  add t5, t1, t2                                                        # ir inst 32 fin
  sw t6, 0(t5)                                                          # ir inst 33 fin
  j .F.boyerMooreStringSearch._11.if.exit.0                             # ir inst 34 fin
.F.boyerMooreStringSearch._10.if.else.0:
  j .F.boyerMooreStringSearch._11.if.exit.0                             # ir inst 35 fin
.F.boyerMooreStringSearch._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t6, t5
  j .F.boyerMooreStringSearch._4.while.cond.0                           # ir inst 37 fin
.F.boyerMooreStringSearch._12.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.boyerMooreStringSearch._13.while.cond.1                          # ir inst 38 fin
.F.boyerMooreStringSearch._13.while.cond.1:
  sub t4, a1, a3                                                        # ir inst 41 fin
  slt t0, t4, t5
  xori t3, t0, 1                                                        # ir inst 42 fin
  bnez t3, .F.boyerMooreStringSearch._14.while.body.1
  j .F.boyerMooreStringSearch._36.while.exit.1                          # ir inst 43 fin
.F.boyerMooreStringSearch._14.while.body.1:
  addi t4, a3, -1                                                       # ir inst 44 fin
# Phi connections
  j .F.boyerMooreStringSearch._15.while.cond.2                          # ir inst 45 fin
.F.boyerMooreStringSearch._15.while.cond.2:
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 47 fin
  bnez t3, .F.boyerMooreStringSearch._16.lazy.then.1
  j .F.boyerMooreStringSearch._17.lazy.else.1                           # ir inst 48 fin
.F.boyerMooreStringSearch._16.lazy.then.1:
  mv t3, t4                                                             # ir inst 49 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 50 fin
  lw t3, 0(s11)                                                         # ir inst 51 fin
  add s11, t5, t4                                                       # ir inst 52 fin
  mv s10, s11                                                           # ir inst 53 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 54 fin
  lw s10, 0(s11)                                                        # ir inst 55 fin
  xor t0, t3, s10
  sltiu s11, t0, 1                                                      # ir inst 56 fin
# Phi connections
  mv t3, s11
  j .F.boyerMooreStringSearch._18.lazy.exit.1                           # ir inst 57 fin
.F.boyerMooreStringSearch._17.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.boyerMooreStringSearch._18.lazy.exit.1                           # ir inst 58 fin
.F.boyerMooreStringSearch._18.lazy.exit.1:
  bnez t3, .F.boyerMooreStringSearch._19.while.body.2
  j .F.boyerMooreStringSearch._20.while.exit.2                          # ir inst 60 fin
.F.boyerMooreStringSearch._19.while.body.2:
  addi t3, t4, -1                                                       # ir inst 61 fin
# Phi connections
  mv t4, t3
  j .F.boyerMooreStringSearch._15.while.cond.2                          # ir inst 62 fin
.F.boyerMooreStringSearch._20.while.exit.2:
  li t2, 0
  slt t3, t4, t2                                                        # ir inst 63 fin
  bnez t3, .F.boyerMooreStringSearch._21.if.then.1
  j .F.boyerMooreStringSearch._25.if.else.1                             # ir inst 64 fin
.F.boyerMooreStringSearch._21.if.then.1:
  addi t3, t6, 1                                                        # ir inst 65 fin
  add s11, t5, a3                                                       # ir inst 66 fin
  slt s10, s11, a1                                                      # ir inst 67 fin
  bnez s10, .F.boyerMooreStringSearch._22.if.then.2
  j .F.boyerMooreStringSearch._23.if.else.2                             # ir inst 68 fin
.F.boyerMooreStringSearch._22.if.then.2:
  add s11, t5, a3                                                       # ir inst 69 fin
  add s10, t5, a3                                                       # ir inst 70 fin
  mv s9, s10                                                            # ir inst 71 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 72 fin
  lw s9, 0(s10)                                                         # ir inst 73 fin
  mv s10, s9                                                            # ir inst 74 fin
  slli t2, s10, 2
  addi t1, sp, 24
  add s9, t1, t2                                                        # ir inst 75 fin
  lw s10, 0(s9)                                                         # ir inst 76 fin
  sub s9, s11, s10                                                      # ir inst 77 fin
# Phi connections
  mv s11, s9
  j .F.boyerMooreStringSearch._24.if.exit.2                             # ir inst 78 fin
.F.boyerMooreStringSearch._23.if.else.2:
  addi s11, t5, 1                                                       # ir inst 79 fin
# Phi connections
  j .F.boyerMooreStringSearch._24.if.exit.2                             # ir inst 80 fin
.F.boyerMooreStringSearch._24.if.exit.2:
# Phi connections
  mv t4, s11
  mv t5, t3
  j .F.boyerMooreStringSearch._35.if.exit.1                             # ir inst 82 fin
.F.boyerMooreStringSearch._25.if.else.1:
  add t3, t5, t4                                                        # ir inst 83 fin
  mv s11, t3                                                            # ir inst 84 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 85 fin
  lw s11, 0(t3)                                                         # ir inst 86 fin
  li t2, 0
  slt t0, s11, t2
  xori t3, t0, 1                                                        # ir inst 87 fin
  bnez t3, .F.boyerMooreStringSearch._26.lazy.then.2
  j .F.boyerMooreStringSearch._27.lazy.else.2                           # ir inst 88 fin
.F.boyerMooreStringSearch._26.lazy.then.2:
  add t3, t5, t4                                                        # ir inst 89 fin
  mv s11, t3                                                            # ir inst 90 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 91 fin
  lw s11, 0(t3)                                                         # ir inst 92 fin
  li t2, 256
  slt t3, s11, t2                                                       # ir inst 93 fin
# Phi connections
  j .F.boyerMooreStringSearch._28.lazy.exit.2                           # ir inst 94 fin
.F.boyerMooreStringSearch._27.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.boyerMooreStringSearch._28.lazy.exit.2                           # ir inst 95 fin
.F.boyerMooreStringSearch._28.lazy.exit.2:
  bnez t3, .F.boyerMooreStringSearch._29.if.then.3
  j .F.boyerMooreStringSearch._30.if.else.3                             # ir inst 97 fin
.F.boyerMooreStringSearch._29.if.then.3:
  add t3, t5, t4                                                        # ir inst 98 fin
  mv s11, t3                                                            # ir inst 99 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 100 fin
  lw s11, 0(t3)                                                         # ir inst 101 fin
  mv t3, s11                                                            # ir inst 102 fin
  slli t2, t3, 2
  addi t1, sp, 24
  add s11, t1, t2                                                       # ir inst 103 fin
  lw t3, 0(s11)                                                         # ir inst 104 fin
  sub s11, t4, t3                                                       # ir inst 105 fin
# Phi connections
  mv t4, s11
  j .F.boyerMooreStringSearch._31.if.exit.3                             # ir inst 106 fin
.F.boyerMooreStringSearch._30.if.else.3:
# Phi connections
  li t4, 1
  j .F.boyerMooreStringSearch._31.if.exit.3                             # ir inst 107 fin
.F.boyerMooreStringSearch._31.if.exit.3:
  li t2, 1
  slt t3, t2, t4                                                        # ir inst 109 fin
  bnez t3, .F.boyerMooreStringSearch._32.if.then.4
  j .F.boyerMooreStringSearch._33.if.else.4                             # ir inst 110 fin
.F.boyerMooreStringSearch._32.if.then.4:
  add t3, t5, t4                                                        # ir inst 111 fin
# Phi connections
  mv t5, t3
  j .F.boyerMooreStringSearch._34.if.exit.4                             # ir inst 112 fin
.F.boyerMooreStringSearch._33.if.else.4:
  addi t4, t5, 1                                                        # ir inst 113 fin
# Phi connections
  mv t5, t4
  j .F.boyerMooreStringSearch._34.if.exit.4                             # ir inst 114 fin
.F.boyerMooreStringSearch._34.if.exit.4:
# Phi connections
  mv t4, t5
  mv t5, t6
  j .F.boyerMooreStringSearch._35.if.exit.1                             # ir inst 116 fin
.F.boyerMooreStringSearch._35.if.exit.1:
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.boyerMooreStringSearch._13.while.cond.1                          # ir inst 119 fin
.F.boyerMooreStringSearch._36.while.exit.1:
  mv a0, t6
  j .F.boyerMooreStringSearch.epilogue                                  # ir inst 120 fin
.F.boyerMooreStringSearch.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 1056
  ret

.globl .F.multiplePatternSearch
.F.multiplePatternSearch:
# spill func args num: 0,             range:      160(sp) -      160(sp)
# local var size: 120,                range:       40(sp) -      160(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -160
  sd ra, 32(sp)
.F.multiplePatternSearch._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 65
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 40
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 66
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 40
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 40
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 40
  addi t6, t1, 16                                                       # ir inst 10 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 40
  addi t6, t1, 20                                                       # ir inst 12 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 40
  addi t6, t1, 24                                                       # ir inst 14 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 40
  addi t6, t1, 28                                                       # ir inst 16 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 40
  addi t6, t1, 32                                                       # ir inst 18 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 40
  addi t6, t1, 36                                                       # ir inst 20 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 23 fin
  li t1, 67
  sw t1, 0(t6)                                                          # ir inst 24 fin
  addi t1, sp, 80
  addi t6, t1, 4                                                        # ir inst 25 fin
  li t1, 68
  sw t1, 0(t6)                                                          # ir inst 26 fin
  addi t1, sp, 80
  addi t6, t1, 8                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 28 fin
  addi t1, sp, 80
  addi t6, t1, 12                                                       # ir inst 29 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 30 fin
  addi t1, sp, 80
  addi t6, t1, 16                                                       # ir inst 31 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 32 fin
  addi t1, sp, 80
  addi t6, t1, 20                                                       # ir inst 33 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 34 fin
  addi t1, sp, 80
  addi t6, t1, 24                                                       # ir inst 35 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 36 fin
  addi t1, sp, 80
  addi t6, t1, 28                                                       # ir inst 37 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 38 fin
  addi t1, sp, 80
  addi t6, t1, 32                                                       # ir inst 39 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 40 fin
  addi t1, sp, 80
  addi t6, t1, 36                                                       # ir inst 41 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 42 fin
  addi t1, sp, 120
  addi t6, t1, 0                                                        # ir inst 44 fin
  li t1, 69
  sw t1, 0(t6)                                                          # ir inst 45 fin
  addi t1, sp, 120
  addi t6, t1, 4                                                        # ir inst 46 fin
  li t1, 70
  sw t1, 0(t6)                                                          # ir inst 47 fin
  addi t1, sp, 120
  addi t6, t1, 8                                                        # ir inst 48 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 49 fin
  addi t1, sp, 120
  addi t6, t1, 12                                                       # ir inst 50 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 51 fin
  addi t1, sp, 120
  addi t6, t1, 16                                                       # ir inst 52 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 53 fin
  addi t1, sp, 120
  addi t6, t1, 20                                                       # ir inst 54 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 55 fin
  addi t1, sp, 120
  addi t6, t1, 24                                                       # ir inst 56 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 57 fin
  addi t1, sp, 120
  addi t6, t1, 28                                                       # ir inst 58 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 59 fin
  addi t1, sp, 120
  addi t6, t1, 32                                                       # ir inst 60 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 61 fin
  addi t1, sp, 120
  addi t6, t1, 36                                                       # ir inst 62 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 63 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  li a3, 2
  addi t1, sp, 40
  mv a2, t1
  call .F.naiveStringSearch
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 64 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t6, 16(sp)
  li a3, 2
  addi t1, sp, 80
  mv a2, t1
  call .F.naiveStringSearch
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t6, 16(sp)
# ir inst 65 fin
  add t4, t6, t5                                                        # ir inst 66 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  li a3, 2
  addi t1, sp, 120
  mv a2, t1
  call .F.naiveStringSearch
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
# ir inst 67 fin
  add t5, t4, t6                                                        # ir inst 68 fin
  mv a0, t5
  j .F.multiplePatternSearch.epilogue                                   # ir inst 69 fin
.F.multiplePatternSearch.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 160
  ret

.globl .F.testTextProcessingAlgorithms
.F.testTextProcessingAlgorithms:
# spill func args num: 0,             range:     8016(sp) -     8016(sp)
# local var size: 8000,               range:       16(sp) -     8016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -8016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testTextProcessingAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1603
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testTextProcessingAlgorithms._1.array.cond.0                     # ir inst 4 fin
.F.testTextProcessingAlgorithms._1.array.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testTextProcessingAlgorithms._2.array.body.0
  j .F.testTextProcessingAlgorithms._3.array.exit.0                     # ir inst 7 fin
.F.testTextProcessingAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testTextProcessingAlgorithms._1.array.cond.0                     # ir inst 11 fin
.F.testTextProcessingAlgorithms._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeLargeText
# ir inst 12 fin
# Start call preparation
  li a1, 2000
  addi t1, sp, 16
  mv a0, t1
  call .F.characterFrequencyAnalysis
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 2000
  addi t1, sp, 16
  mv a0, t1
  call .F.textTransformationAlgorithms
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a1, 2000
  addi t1, sp, 16
  mv a0, t1
  call .F.wordCountingAlgorithms
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 2000
  addi t1, sp, 16
  mv a0, t1
  call .F.textFilteringAlgorithms
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1604
  call printlnInt
# ir inst 21 fin
  j .F.testTextProcessingAlgorithms.epilogue                            # ir inst 22 fin
.F.testTextProcessingAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 8016
  add sp, sp, t0
  ret

.globl .F.initializeLargeText
.F.initializeLargeText:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeLargeText._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 521
  j .F.initializeLargeText._1.while.cond.0                              # ir inst 1 fin
.F.initializeLargeText._1.while.cond.0:
  li t2, 2000
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.initializeLargeText._2.while.body.0
  j .F.initializeLargeText._15.while.exit.0                             # ir inst 5 fin
.F.initializeLargeText._2.while.body.0:
  li t2, 166
  mul t4, t6, t2                                                        # ir inst 6 fin
  li t2, 194223
  add t6, t4, t2                                                        # ir inst 7 fin
  li t2, 2147447
  rem t4, t6, t2                                                        # ir inst 8 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 9 fin
  bnez t6, .F.initializeLargeText._3.if.then.0
  j .F.initializeLargeText._4.if.else.0                                 # ir inst 10 fin
.F.initializeLargeText._3.if.then.0:
  li t1, 0
  sub t6, t1, t4                                                        # ir inst 11 fin
# Phi connections
  j .F.initializeLargeText._5.if.exit.0                                 # ir inst 12 fin
.F.initializeLargeText._4.if.else.0:
# Phi connections
  mv t6, t4
  j .F.initializeLargeText._5.if.exit.0                                 # ir inst 13 fin
.F.initializeLargeText._5.if.exit.0:
  li t2, 100
  rem t4, t6, t2                                                        # ir inst 15 fin
  li t2, 70
  slt t3, t4, t2                                                        # ir inst 16 fin
  bnez t3, .F.initializeLargeText._6.if.then.1
  j .F.initializeLargeText._7.if.else.1                                 # ir inst 17 fin
.F.initializeLargeText._6.if.then.1:
  mv t3, t5                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  li t2, 26
  rem t3, t6, t2                                                        # ir inst 20 fin
  addi s10, t3, 97                                                      # ir inst 21 fin
  sw s10, 0(s11)                                                        # ir inst 22 fin
  j .F.initializeLargeText._14.if.exit.1                                # ir inst 23 fin
.F.initializeLargeText._7.if.else.1:
  li t2, 85
  slt t3, t4, t2                                                        # ir inst 24 fin
  bnez t3, .F.initializeLargeText._8.if.then.2
  j .F.initializeLargeText._9.if.else.2                                 # ir inst 25 fin
.F.initializeLargeText._8.if.then.2:
  mv t3, t5                                                             # ir inst 26 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 27 fin
  li t2, 26
  rem t3, t6, t2                                                        # ir inst 28 fin
  addi s10, t3, 65                                                      # ir inst 29 fin
  sw s10, 0(s11)                                                        # ir inst 30 fin
  j .F.initializeLargeText._13.if.exit.2                                # ir inst 31 fin
.F.initializeLargeText._9.if.else.2:
  li t2, 95
  slt t3, t4, t2                                                        # ir inst 32 fin
  bnez t3, .F.initializeLargeText._10.if.then.3
  j .F.initializeLargeText._11.if.else.3                                # ir inst 33 fin
.F.initializeLargeText._10.if.then.3:
  mv t4, t5                                                             # ir inst 34 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 35 fin
  li t1, 32
  sw t1, 0(t3)                                                          # ir inst 36 fin
  j .F.initializeLargeText._12.if.exit.3                                # ir inst 37 fin
.F.initializeLargeText._11.if.else.3:
  mv t4, t5                                                             # ir inst 38 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 39 fin
  li t2, 15
  rem t4, t6, t2                                                        # ir inst 40 fin
  addi s11, t4, 33                                                      # ir inst 41 fin
  sw s11, 0(t3)                                                         # ir inst 42 fin
  j .F.initializeLargeText._12.if.exit.3                                # ir inst 43 fin
.F.initializeLargeText._12.if.exit.3:
  j .F.initializeLargeText._13.if.exit.2                                # ir inst 44 fin
.F.initializeLargeText._13.if.exit.2:
  j .F.initializeLargeText._14.if.exit.1                                # ir inst 45 fin
.F.initializeLargeText._14.if.exit.1:
  addi t4, t5, 1                                                        # ir inst 46 fin
# Phi connections
  mv t5, t4
  j .F.initializeLargeText._1.while.cond.0                              # ir inst 47 fin
.F.initializeLargeText._15.while.exit.0:
  j .F.initializeLargeText.epilogue                                     # ir inst 48 fin
.F.initializeLargeText.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.characterFrequencyAnalysis
.F.characterFrequencyAnalysis:
# spill func args num: 0,             range:     1040(sp) -     1040(sp)
# local var size: 1024,               range:       16(sp) -     1040(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1040
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.characterFrequencyAnalysis._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.characterFrequencyAnalysis._1.array.cond.0                       # ir inst 3 fin
.F.characterFrequencyAnalysis._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.characterFrequencyAnalysis._2.array.body.0
  j .F.characterFrequencyAnalysis._3.array.exit.0                       # ir inst 6 fin
.F.characterFrequencyAnalysis._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.characterFrequencyAnalysis._1.array.cond.0                       # ir inst 10 fin
.F.characterFrequencyAnalysis._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.characterFrequencyAnalysis._4.while.cond.0                       # ir inst 11 fin
.F.characterFrequencyAnalysis._4.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 13 fin
  bnez t5, .F.characterFrequencyAnalysis._5.while.body.0
  j .F.characterFrequencyAnalysis._12.while.exit.0                      # ir inst 14 fin
.F.characterFrequencyAnalysis._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 16 fin
  lw t5, 0(t4)                                                          # ir inst 17 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 18 fin
  bnez t4, .F.characterFrequencyAnalysis._6.lazy.then.0
  j .F.characterFrequencyAnalysis._7.lazy.else.0                        # ir inst 19 fin
.F.characterFrequencyAnalysis._6.lazy.then.0:
  mv t5, t6                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 21 fin
  lw t5, 0(t4)                                                          # ir inst 22 fin
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.characterFrequencyAnalysis._8.lazy.exit.0                        # ir inst 24 fin
.F.characterFrequencyAnalysis._7.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.characterFrequencyAnalysis._8.lazy.exit.0                        # ir inst 25 fin
.F.characterFrequencyAnalysis._8.lazy.exit.0:
  bnez t5, .F.characterFrequencyAnalysis._9.if.then.0
  j .F.characterFrequencyAnalysis._10.if.else.0                         # ir inst 27 fin
.F.characterFrequencyAnalysis._9.if.then.0:
  mv t5, t6                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 29 fin
  lw t5, 0(t4)                                                          # ir inst 30 fin
  mv t4, t5                                                             # ir inst 31 fin
  slli t2, t4, 2
  addi t1, sp, 16
  add t5, t1, t2                                                        # ir inst 32 fin
  mv t4, t6                                                             # ir inst 33 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 34 fin
  lw t4, 0(t3)                                                          # ir inst 35 fin
  mv t3, t4                                                             # ir inst 36 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 37 fin
  lw t3, 0(t4)                                                          # ir inst 38 fin
  addi t4, t3, 1                                                        # ir inst 39 fin
  sw t4, 0(t5)                                                          # ir inst 40 fin
  j .F.characterFrequencyAnalysis._11.if.exit.0                         # ir inst 41 fin
.F.characterFrequencyAnalysis._10.if.else.0:
  j .F.characterFrequencyAnalysis._11.if.exit.0                         # ir inst 42 fin
.F.characterFrequencyAnalysis._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 43 fin
# Phi connections
  mv t6, t5
  j .F.characterFrequencyAnalysis._4.while.cond.0                       # ir inst 44 fin
.F.characterFrequencyAnalysis._12.while.exit.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.characterFrequencyAnalysis._13.while.cond.1                      # ir inst 45 fin
.F.characterFrequencyAnalysis._13.while.cond.1:
  li t2, 256
  slt t3, t6, t2                                                        # ir inst 49 fin
  bnez t3, .F.characterFrequencyAnalysis._14.while.body.1
  j .F.characterFrequencyAnalysis._18.while.exit.1                      # ir inst 50 fin
.F.characterFrequencyAnalysis._14.while.body.1:
  mv t3, t6                                                             # ir inst 51 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 52 fin
  lw t3, 0(s11)                                                         # ir inst 53 fin
  slt s11, t4, t3                                                       # ir inst 54 fin
  bnez s11, .F.characterFrequencyAnalysis._15.if.then.1
  j .F.characterFrequencyAnalysis._16.if.else.1                         # ir inst 55 fin
.F.characterFrequencyAnalysis._15.if.then.1:
  mv t3, t6                                                             # ir inst 56 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 57 fin
  lw t3, 0(s11)                                                         # ir inst 58 fin
# Phi connections
  mv s11, t3
  mv t3, t6
  j .F.characterFrequencyAnalysis._17.if.exit.1                         # ir inst 59 fin
.F.characterFrequencyAnalysis._16.if.else.1:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.characterFrequencyAnalysis._17.if.exit.1                         # ir inst 60 fin
.F.characterFrequencyAnalysis._17.if.exit.1:
  addi s10, t6, 1                                                       # ir inst 63 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.characterFrequencyAnalysis._13.while.cond.1                      # ir inst 64 fin
.F.characterFrequencyAnalysis._18.while.exit.1:
  add t6, t5, t4                                                        # ir inst 65 fin
  mv a0, t6
  j .F.characterFrequencyAnalysis.epilogue                              # ir inst 66 fin
.F.characterFrequencyAnalysis.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 1040
  ret

.globl .F.textTransformationAlgorithms
.F.textTransformationAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.textTransformationAlgorithms._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.textTransformationAlgorithms._1.while.cond.0                     # ir inst 1 fin
.F.textTransformationAlgorithms._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.textTransformationAlgorithms._2.while.body.0
  j .F.textTransformationAlgorithms._9.while.exit.0                     # ir inst 5 fin
.F.textTransformationAlgorithms._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 97
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.textTransformationAlgorithms._3.lazy.then.0
  j .F.textTransformationAlgorithms._4.lazy.else.0                      # ir inst 10 fin
.F.textTransformationAlgorithms._3.lazy.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
  li t2, 122
  slt t0, t2, t4
  xori t3, t0, 1                                                        # ir inst 14 fin
# Phi connections
  mv t4, t3
  j .F.textTransformationAlgorithms._5.lazy.exit.0                      # ir inst 15 fin
.F.textTransformationAlgorithms._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.textTransformationAlgorithms._5.lazy.exit.0                      # ir inst 16 fin
.F.textTransformationAlgorithms._5.lazy.exit.0:
  bnez t4, .F.textTransformationAlgorithms._6.if.then.0
  j .F.textTransformationAlgorithms._7.if.else.0                        # ir inst 18 fin
.F.textTransformationAlgorithms._6.if.then.0:
  mv t4, t6                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 20 fin
  mv t4, t6                                                             # ir inst 21 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 22 fin
  lw t4, 0(s11)                                                         # ir inst 23 fin
  addi s11, t4, -32                                                     # ir inst 24 fin
  sw s11, 0(t3)                                                         # ir inst 25 fin
  addi t4, t5, 1                                                        # ir inst 26 fin
# Phi connections
  j .F.textTransformationAlgorithms._8.if.exit.0                        # ir inst 27 fin
.F.textTransformationAlgorithms._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.textTransformationAlgorithms._8.if.exit.0                        # ir inst 28 fin
.F.textTransformationAlgorithms._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.textTransformationAlgorithms._1.while.cond.0                     # ir inst 31 fin
.F.textTransformationAlgorithms._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.textTransformationAlgorithms._10.while.cond.1                    # ir inst 32 fin
.F.textTransformationAlgorithms._10.while.cond.1:
  slt t4, t6, a1                                                        # ir inst 35 fin
  bnez t4, .F.textTransformationAlgorithms._11.while.body.1
  j .F.textTransformationAlgorithms._18.while.exit.1                    # ir inst 36 fin
.F.textTransformationAlgorithms._11.while.body.1:
  mv t4, t6                                                             # ir inst 37 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 38 fin
  lw t4, 0(t3)                                                          # ir inst 39 fin
  li t2, 65
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 40 fin
  bnez t3, .F.textTransformationAlgorithms._12.lazy.then.1
  j .F.textTransformationAlgorithms._13.lazy.else.1                     # ir inst 41 fin
.F.textTransformationAlgorithms._12.lazy.then.1:
  mv t4, t6                                                             # ir inst 42 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 43 fin
  lw t4, 0(t3)                                                          # ir inst 44 fin
  li t2, 90
  slt t0, t2, t4
  xori t3, t0, 1                                                        # ir inst 45 fin
# Phi connections
  mv t4, t3
  j .F.textTransformationAlgorithms._14.lazy.exit.1                     # ir inst 46 fin
.F.textTransformationAlgorithms._13.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.textTransformationAlgorithms._14.lazy.exit.1                     # ir inst 47 fin
.F.textTransformationAlgorithms._14.lazy.exit.1:
  bnez t4, .F.textTransformationAlgorithms._15.if.then.1
  j .F.textTransformationAlgorithms._16.if.else.1                       # ir inst 49 fin
.F.textTransformationAlgorithms._15.if.then.1:
  mv t4, t6                                                             # ir inst 50 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 51 fin
  mv t4, t6                                                             # ir inst 52 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 53 fin
  lw t4, 0(s11)                                                         # ir inst 54 fin
  addi s11, t4, -65                                                     # ir inst 55 fin
  addi t4, s11, 3                                                       # ir inst 56 fin
  li t2, 26
  rem s11, t4, t2                                                       # ir inst 57 fin
  addi t4, s11, 65                                                      # ir inst 58 fin
  sw t4, 0(t3)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  j .F.textTransformationAlgorithms._17.if.exit.1                       # ir inst 61 fin
.F.textTransformationAlgorithms._16.if.else.1:
# Phi connections
  mv t4, t5
  j .F.textTransformationAlgorithms._17.if.exit.1                       # ir inst 62 fin
.F.textTransformationAlgorithms._17.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 64 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.textTransformationAlgorithms._10.while.cond.1                    # ir inst 65 fin
.F.textTransformationAlgorithms._18.while.exit.1:
# Phi connections
  li t6, 0
  j .F.textTransformationAlgorithms._19.while.cond.2                    # ir inst 66 fin
.F.textTransformationAlgorithms._19.while.cond.2:
  slt t4, t6, a1                                                        # ir inst 69 fin
  bnez t4, .F.textTransformationAlgorithms._20.while.body.2
  j .F.textTransformationAlgorithms._27.while.exit.2                    # ir inst 70 fin
.F.textTransformationAlgorithms._20.while.body.2:
  mv t4, t6                                                             # ir inst 71 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 72 fin
  lw t4, 0(t3)                                                          # ir inst 73 fin
  li t2, 65
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 74 fin
  bnez t3, .F.textTransformationAlgorithms._21.lazy.then.2
  j .F.textTransformationAlgorithms._22.lazy.else.2                     # ir inst 75 fin
.F.textTransformationAlgorithms._21.lazy.then.2:
  mv t4, t6                                                             # ir inst 76 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 77 fin
  lw t4, 0(t3)                                                          # ir inst 78 fin
  li t2, 90
  slt t0, t2, t4
  xori t3, t0, 1                                                        # ir inst 79 fin
# Phi connections
  mv t4, t3
  j .F.textTransformationAlgorithms._23.lazy.exit.2                     # ir inst 80 fin
.F.textTransformationAlgorithms._22.lazy.else.2:
# Phi connections
  li t4, 0
  j .F.textTransformationAlgorithms._23.lazy.exit.2                     # ir inst 81 fin
.F.textTransformationAlgorithms._23.lazy.exit.2:
  bnez t4, .F.textTransformationAlgorithms._24.if.then.2
  j .F.textTransformationAlgorithms._25.if.else.2                       # ir inst 83 fin
.F.textTransformationAlgorithms._24.if.then.2:
  mv t4, t6                                                             # ir inst 84 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 85 fin
  mv t4, t6                                                             # ir inst 86 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 87 fin
  lw t4, 0(s11)                                                         # ir inst 88 fin
  addi s11, t4, -65                                                     # ir inst 89 fin
  addi t4, s11, 13                                                      # ir inst 90 fin
  li t2, 26
  rem s11, t4, t2                                                       # ir inst 91 fin
  addi t4, s11, 65                                                      # ir inst 92 fin
  sw t4, 0(t3)                                                          # ir inst 93 fin
  addi t4, t5, 1                                                        # ir inst 94 fin
# Phi connections
  j .F.textTransformationAlgorithms._26.if.exit.2                       # ir inst 95 fin
.F.textTransformationAlgorithms._25.if.else.2:
# Phi connections
  mv t4, t5
  j .F.textTransformationAlgorithms._26.if.exit.2                       # ir inst 96 fin
.F.textTransformationAlgorithms._26.if.exit.2:
  addi t3, t6, 1                                                        # ir inst 98 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.textTransformationAlgorithms._19.while.cond.2                    # ir inst 99 fin
.F.textTransformationAlgorithms._27.while.exit.2:
  mv a0, t5
  j .F.textTransformationAlgorithms.epilogue                            # ir inst 100 fin
.F.textTransformationAlgorithms.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.wordCountingAlgorithms
.F.wordCountingAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.wordCountingAlgorithms._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.wordCountingAlgorithms._1.while.cond.0                           # ir inst 1 fin
.F.wordCountingAlgorithms._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.wordCountingAlgorithms._2.while.body.0
  j .F.wordCountingAlgorithms._15.while.exit.0                          # ir inst 6 fin
.F.wordCountingAlgorithms._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 32
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.wordCountingAlgorithms._3.lazy.then.0
  j .F.wordCountingAlgorithms._4.lazy.else.0                            # ir inst 11 fin
.F.wordCountingAlgorithms._3.lazy.then.0:
# Phi connections
  li t3, 1
  j .F.wordCountingAlgorithms._5.lazy.exit.0                            # ir inst 12 fin
.F.wordCountingAlgorithms._4.lazy.else.0:
  mv t3, t6                                                             # ir inst 13 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 14 fin
  lw t3, 0(s11)                                                         # ir inst 15 fin
  li t2, 9
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 16 fin
# Phi connections
  mv t3, s11
  j .F.wordCountingAlgorithms._5.lazy.exit.0                            # ir inst 17 fin
.F.wordCountingAlgorithms._5.lazy.exit.0:
  bnez t3, .F.wordCountingAlgorithms._6.lazy.then.1
  j .F.wordCountingAlgorithms._7.lazy.else.1                            # ir inst 19 fin
.F.wordCountingAlgorithms._6.lazy.then.1:
# Phi connections
  li t3, 1
  j .F.wordCountingAlgorithms._8.lazy.exit.1                            # ir inst 20 fin
.F.wordCountingAlgorithms._7.lazy.else.1:
  mv t3, t6                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 22 fin
  lw t3, 0(s11)                                                         # ir inst 23 fin
  li t2, 10
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 24 fin
# Phi connections
  mv t3, s11
  j .F.wordCountingAlgorithms._8.lazy.exit.1                            # ir inst 25 fin
.F.wordCountingAlgorithms._8.lazy.exit.1:
  bnez t3, .F.wordCountingAlgorithms._9.if.then.0
  j .F.wordCountingAlgorithms._10.if.else.0                             # ir inst 27 fin
.F.wordCountingAlgorithms._9.if.then.0:
# Phi connections
  mv t3, t4
  li t5, 0
  j .F.wordCountingAlgorithms._14.if.exit.0                             # ir inst 28 fin
.F.wordCountingAlgorithms._10.if.else.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 29 fin
  bnez t3, .F.wordCountingAlgorithms._11.if.then.1
  j .F.wordCountingAlgorithms._12.if.else.1                             # ir inst 30 fin
.F.wordCountingAlgorithms._11.if.then.1:
  addi t3, t4, 1                                                        # ir inst 31 fin
# Phi connections
  li t5, 1
  j .F.wordCountingAlgorithms._13.if.exit.1                             # ir inst 32 fin
.F.wordCountingAlgorithms._12.if.else.1:
# Phi connections
  mv t3, t4
  j .F.wordCountingAlgorithms._13.if.exit.1                             # ir inst 33 fin
.F.wordCountingAlgorithms._13.if.exit.1:
# Phi connections
  j .F.wordCountingAlgorithms._14.if.exit.0                             # ir inst 36 fin
.F.wordCountingAlgorithms._14.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 39 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.wordCountingAlgorithms._1.while.cond.0                           # ir inst 40 fin
.F.wordCountingAlgorithms._15.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.wordCountingAlgorithms._16.while.cond.1                          # ir inst 41 fin
.F.wordCountingAlgorithms._16.while.cond.1:
  addi t3, a1, -2                                                       # ir inst 44 fin
  slt s11, t5, t3                                                       # ir inst 45 fin
  bnez s11, .F.wordCountingAlgorithms._17.while.body.1
  j .F.wordCountingAlgorithms._36.while.exit.1                          # ir inst 46 fin
.F.wordCountingAlgorithms._17.while.body.1:
  mv t3, t5                                                             # ir inst 47 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 48 fin
  lw t3, 0(s11)                                                         # ir inst 49 fin
  li t2, 84
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 50 fin
  bnez s11, .F.wordCountingAlgorithms._18.lazy.then.2
  j .F.wordCountingAlgorithms._19.lazy.else.2                           # ir inst 51 fin
.F.wordCountingAlgorithms._18.lazy.then.2:
# Phi connections
  li t3, 1
  j .F.wordCountingAlgorithms._20.lazy.exit.2                           # ir inst 52 fin
.F.wordCountingAlgorithms._19.lazy.else.2:
  mv t3, t5                                                             # ir inst 53 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 54 fin
  lw t3, 0(s11)                                                         # ir inst 55 fin
  li t2, 116
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 56 fin
# Phi connections
  mv t3, s11
  j .F.wordCountingAlgorithms._20.lazy.exit.2                           # ir inst 57 fin
.F.wordCountingAlgorithms._20.lazy.exit.2:
  bnez t3, .F.wordCountingAlgorithms._21.lazy.then.3
  j .F.wordCountingAlgorithms._25.lazy.else.3                           # ir inst 59 fin
.F.wordCountingAlgorithms._21.lazy.then.3:
  mv t3, t5                                                             # ir inst 60 fin
  addi s11, t3, 1                                                       # ir inst 61 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 62 fin
  lw s11, 0(t3)                                                         # ir inst 63 fin
  li t2, 72
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 64 fin
  bnez t3, .F.wordCountingAlgorithms._22.lazy.then.4
  j .F.wordCountingAlgorithms._23.lazy.else.4                           # ir inst 65 fin
.F.wordCountingAlgorithms._22.lazy.then.4:
# Phi connections
  li t3, 1
  j .F.wordCountingAlgorithms._24.lazy.exit.4                           # ir inst 66 fin
.F.wordCountingAlgorithms._23.lazy.else.4:
  mv t3, t5                                                             # ir inst 67 fin
  addi s11, t3, 1                                                       # ir inst 68 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 69 fin
  lw s11, 0(t3)                                                         # ir inst 70 fin
  li t2, 104
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 71 fin
# Phi connections
  j .F.wordCountingAlgorithms._24.lazy.exit.4                           # ir inst 72 fin
.F.wordCountingAlgorithms._24.lazy.exit.4:
# Phi connections
  j .F.wordCountingAlgorithms._26.lazy.exit.3                           # ir inst 74 fin
.F.wordCountingAlgorithms._25.lazy.else.3:
# Phi connections
  li t3, 0
  j .F.wordCountingAlgorithms._26.lazy.exit.3                           # ir inst 75 fin
.F.wordCountingAlgorithms._26.lazy.exit.3:
  bnez t3, .F.wordCountingAlgorithms._27.lazy.then.5
  j .F.wordCountingAlgorithms._31.lazy.else.5                           # ir inst 77 fin
.F.wordCountingAlgorithms._27.lazy.then.5:
  mv t3, t5                                                             # ir inst 78 fin
  addi s11, t3, 2                                                       # ir inst 79 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 80 fin
  lw s11, 0(t3)                                                         # ir inst 81 fin
  li t2, 69
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 82 fin
  bnez t3, .F.wordCountingAlgorithms._28.lazy.then.6
  j .F.wordCountingAlgorithms._29.lazy.else.6                           # ir inst 83 fin
.F.wordCountingAlgorithms._28.lazy.then.6:
# Phi connections
  li t3, 1
  j .F.wordCountingAlgorithms._30.lazy.exit.6                           # ir inst 84 fin
.F.wordCountingAlgorithms._29.lazy.else.6:
  mv t3, t5                                                             # ir inst 85 fin
  addi s11, t3, 2                                                       # ir inst 86 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 87 fin
  lw s11, 0(t3)                                                         # ir inst 88 fin
  li t2, 101
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 89 fin
# Phi connections
  j .F.wordCountingAlgorithms._30.lazy.exit.6                           # ir inst 90 fin
.F.wordCountingAlgorithms._30.lazy.exit.6:
# Phi connections
  j .F.wordCountingAlgorithms._32.lazy.exit.5                           # ir inst 92 fin
.F.wordCountingAlgorithms._31.lazy.else.5:
# Phi connections
  li t3, 0
  j .F.wordCountingAlgorithms._32.lazy.exit.5                           # ir inst 93 fin
.F.wordCountingAlgorithms._32.lazy.exit.5:
  bnez t3, .F.wordCountingAlgorithms._33.if.then.2
  j .F.wordCountingAlgorithms._34.if.else.2                             # ir inst 95 fin
.F.wordCountingAlgorithms._33.if.then.2:
  addi t3, t6, 1                                                        # ir inst 96 fin
# Phi connections
  j .F.wordCountingAlgorithms._35.if.exit.2                             # ir inst 97 fin
.F.wordCountingAlgorithms._34.if.else.2:
# Phi connections
  mv t3, t6
  j .F.wordCountingAlgorithms._35.if.exit.2                             # ir inst 98 fin
.F.wordCountingAlgorithms._35.if.exit.2:
  addi s11, t5, 1                                                       # ir inst 100 fin
# Phi connections
  mv t5, s11
  mv t6, t3
  j .F.wordCountingAlgorithms._16.while.cond.1                          # ir inst 101 fin
.F.wordCountingAlgorithms._36.while.exit.1:
  add t5, t4, t6                                                        # ir inst 102 fin
  mv a0, t5
  j .F.wordCountingAlgorithms.epilogue                                  # ir inst 103 fin
.F.wordCountingAlgorithms.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.textFilteringAlgorithms
.F.textFilteringAlgorithms:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.textFilteringAlgorithms._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.textFilteringAlgorithms._1.while.cond.0                          # ir inst 1 fin
.F.textFilteringAlgorithms._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.textFilteringAlgorithms._2.while.body.0
  j .F.textFilteringAlgorithms._9.while.exit.0                          # ir inst 5 fin
.F.textFilteringAlgorithms._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 32
  slt t3, t4, t2                                                        # ir inst 9 fin
  bnez t3, .F.textFilteringAlgorithms._3.lazy.then.0
  j .F.textFilteringAlgorithms._4.lazy.else.0                           # ir inst 10 fin
.F.textFilteringAlgorithms._3.lazy.then.0:
# Phi connections
  li t4, 1
  j .F.textFilteringAlgorithms._5.lazy.exit.0                           # ir inst 11 fin
.F.textFilteringAlgorithms._4.lazy.else.0:
  mv t4, t6                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 13 fin
  lw t4, 0(t3)                                                          # ir inst 14 fin
  li t2, 126
  slt t3, t2, t4                                                        # ir inst 15 fin
# Phi connections
  mv t4, t3
  j .F.textFilteringAlgorithms._5.lazy.exit.0                           # ir inst 16 fin
.F.textFilteringAlgorithms._5.lazy.exit.0:
  bnez t4, .F.textFilteringAlgorithms._6.if.then.0
  j .F.textFilteringAlgorithms._7.if.else.0                             # ir inst 18 fin
.F.textFilteringAlgorithms._6.if.then.0:
  mv t4, t6                                                             # ir inst 19 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 20 fin
  li t1, 32
  sw t1, 0(t3)                                                          # ir inst 21 fin
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  j .F.textFilteringAlgorithms._8.if.exit.0                             # ir inst 23 fin
.F.textFilteringAlgorithms._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.textFilteringAlgorithms._8.if.exit.0                             # ir inst 24 fin
.F.textFilteringAlgorithms._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.textFilteringAlgorithms._1.while.cond.0                          # ir inst 27 fin
.F.textFilteringAlgorithms._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.textFilteringAlgorithms._10.while.cond.1                         # ir inst 28 fin
.F.textFilteringAlgorithms._10.while.cond.1:
  addi t4, a1, -1                                                       # ir inst 31 fin
  slt t3, t6, t4                                                        # ir inst 32 fin
  bnez t3, .F.textFilteringAlgorithms._11.while.body.1
  j .F.textFilteringAlgorithms._21.while.exit.1                         # ir inst 33 fin
.F.textFilteringAlgorithms._11.while.body.1:
  mv t4, t6                                                             # ir inst 34 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 35 fin
  lw t4, 0(t3)                                                          # ir inst 36 fin
  li t2, 32
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 37 fin
  bnez t3, .F.textFilteringAlgorithms._12.lazy.then.1
  j .F.textFilteringAlgorithms._13.lazy.else.1                          # ir inst 38 fin
.F.textFilteringAlgorithms._12.lazy.then.1:
  mv t4, t6                                                             # ir inst 39 fin
  addi t3, t4, 1                                                        # ir inst 40 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 41 fin
  lw t3, 0(t4)                                                          # ir inst 42 fin
  li t2, 32
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 43 fin
# Phi connections
  j .F.textFilteringAlgorithms._14.lazy.exit.1                          # ir inst 44 fin
.F.textFilteringAlgorithms._13.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.textFilteringAlgorithms._14.lazy.exit.1                          # ir inst 45 fin
.F.textFilteringAlgorithms._14.lazy.exit.1:
  bnez t4, .F.textFilteringAlgorithms._15.if.then.1
  j .F.textFilteringAlgorithms._19.if.else.1                            # ir inst 47 fin
.F.textFilteringAlgorithms._15.if.then.1:
  addi t4, t6, 1                                                        # ir inst 48 fin
# Phi connections
  j .F.textFilteringAlgorithms._16.while.cond.2                         # ir inst 49 fin
.F.textFilteringAlgorithms._16.while.cond.2:
  addi t3, a1, -1                                                       # ir inst 51 fin
  slt s11, t4, t3                                                       # ir inst 52 fin
  bnez s11, .F.textFilteringAlgorithms._17.while.body.2
  j .F.textFilteringAlgorithms._18.while.exit.2                         # ir inst 53 fin
.F.textFilteringAlgorithms._17.while.body.2:
  mv t3, t4                                                             # ir inst 54 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 55 fin
  mv t3, t4                                                             # ir inst 56 fin
  addi s10, t3, 1                                                       # ir inst 57 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 58 fin
  lw s10, 0(t3)                                                         # ir inst 59 fin
  sw s10, 0(s11)                                                        # ir inst 60 fin
  addi t3, t4, 1                                                        # ir inst 61 fin
# Phi connections
  mv t4, t3
  j .F.textFilteringAlgorithms._16.while.cond.2                         # ir inst 62 fin
.F.textFilteringAlgorithms._18.while.exit.2:
  mv t4, a1                                                             # ir inst 63 fin
  addi t3, t4, -1                                                       # ir inst 64 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 65 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 66 fin
  addi t4, t5, 1                                                        # ir inst 67 fin
# Phi connections
  j .F.textFilteringAlgorithms._20.if.exit.1                            # ir inst 68 fin
.F.textFilteringAlgorithms._19.if.else.1:
  addi t4, t6, 1                                                        # ir inst 69 fin
# Phi connections
  mv t6, t4
  mv t4, t5
  j .F.textFilteringAlgorithms._20.if.exit.1                            # ir inst 70 fin
.F.textFilteringAlgorithms._20.if.exit.1:
# Phi connections
  mv t5, t4
  j .F.textFilteringAlgorithms._10.while.cond.1                         # ir inst 73 fin
.F.textFilteringAlgorithms._21.while.exit.1:
  mv a0, t5
  j .F.textFilteringAlgorithms.epilogue                                 # ir inst 74 fin
.F.textFilteringAlgorithms.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testStringParsingAlgorithms
.F.testStringParsingAlgorithms:
# spill func args num: 0,             range:     4016(sp) -     4016(sp)
# local var size: 4000,               range:       16(sp) -     4016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testStringParsingAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1605
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testStringParsingAlgorithms._1.array.cond.0                      # ir inst 4 fin
.F.testStringParsingAlgorithms._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testStringParsingAlgorithms._2.array.body.0
  j .F.testStringParsingAlgorithms._3.array.exit.0                      # ir inst 7 fin
.F.testStringParsingAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testStringParsingAlgorithms._1.array.cond.0                      # ir inst 11 fin
.F.testStringParsingAlgorithms._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeParsingText
# ir inst 12 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.parseNumbersFromText
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.parseCSVLikeData
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.tokenizeText
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 1000
  addi t1, sp, 16
  mv a0, t1
  call .F.parseSimpleExpressions
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1606
  call printlnInt
# ir inst 21 fin
  j .F.testStringParsingAlgorithms.epilogue                             # ir inst 22 fin
.F.testStringParsingAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 4016
  add sp, sp, t0
  ret

.globl .F.initializeParsingText
.F.initializeParsingText:
# spill func args num: 0,             range:      224(sp) -      224(sp)
# local var size: 200,                range:       16(sp) -      216(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -224
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.initializeParsingText._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 49
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 16
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 50
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 16
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 51
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 16
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 44
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 16
  addi t6, t1, 16                                                       # ir inst 10 fin
  li t1, 52
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 16
  addi t6, t1, 20                                                       # ir inst 12 fin
  li t1, 53
  sw t1, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 16
  addi t6, t1, 24                                                       # ir inst 14 fin
  li t1, 54
  sw t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 16
  addi t6, t1, 28                                                       # ir inst 16 fin
  li t1, 44
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 16
  addi t6, t1, 32                                                       # ir inst 18 fin
  li t1, 55
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 16
  addi t6, t1, 36                                                       # ir inst 20 fin
  li t1, 56
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 16
  addi t6, t1, 40                                                       # ir inst 22 fin
  li t1, 57
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 16
  addi t6, t1, 44                                                       # ir inst 24 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t1, sp, 16
  addi t6, t1, 48                                                       # ir inst 26 fin
  li t1, 43
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t1, sp, 16
  addi t6, t1, 52                                                       # ir inst 28 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t1, sp, 16
  addi t6, t1, 56                                                       # ir inst 30 fin
  li t1, 49
  sw t1, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 16
  addi t6, t1, 60                                                       # ir inst 32 fin
  li t1, 50
  sw t1, 0(t6)                                                          # ir inst 33 fin
  addi t1, sp, 16
  addi t6, t1, 64                                                       # ir inst 34 fin
  li t1, 51
  sw t1, 0(t6)                                                          # ir inst 35 fin
  addi t1, sp, 16
  addi t6, t1, 68                                                       # ir inst 36 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 37 fin
  addi t1, sp, 16
  addi t6, t1, 72                                                       # ir inst 38 fin
  li t1, 45
  sw t1, 0(t6)                                                          # ir inst 39 fin
  addi t1, sp, 16
  addi t6, t1, 76                                                       # ir inst 40 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 41 fin
  addi t1, sp, 16
  addi t6, t1, 80                                                       # ir inst 42 fin
  li t1, 52
  sw t1, 0(t6)                                                          # ir inst 43 fin
  addi t1, sp, 16
  addi t6, t1, 84                                                       # ir inst 44 fin
  li t1, 53
  sw t1, 0(t6)                                                          # ir inst 45 fin
  addi t1, sp, 16
  addi t6, t1, 88                                                       # ir inst 46 fin
  li t1, 54
  sw t1, 0(t6)                                                          # ir inst 47 fin
  addi t1, sp, 16
  addi t6, t1, 92                                                       # ir inst 48 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 49 fin
  addi t1, sp, 16
  addi t6, t1, 96                                                       # ir inst 50 fin
  li t1, 42
  sw t1, 0(t6)                                                          # ir inst 51 fin
  addi t1, sp, 16
  addi t6, t1, 100                                                      # ir inst 52 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 53 fin
  addi t1, sp, 16
  addi t6, t1, 104                                                      # ir inst 54 fin
  li t1, 55
  sw t1, 0(t6)                                                          # ir inst 55 fin
  addi t1, sp, 16
  addi t6, t1, 108                                                      # ir inst 56 fin
  li t1, 56
  sw t1, 0(t6)                                                          # ir inst 57 fin
  addi t1, sp, 16
  addi t6, t1, 112                                                      # ir inst 58 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 59 fin
  addi t1, sp, 16
  addi t6, t1, 116                                                      # ir inst 60 fin
  li t1, 47
  sw t1, 0(t6)                                                          # ir inst 61 fin
  addi t1, sp, 16
  addi t6, t1, 120                                                      # ir inst 62 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 63 fin
  addi t1, sp, 16
  addi t6, t1, 124                                                      # ir inst 64 fin
  li t1, 57
  sw t1, 0(t6)                                                          # ir inst 65 fin
  addi t1, sp, 16
  addi t6, t1, 128                                                      # ir inst 66 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 67 fin
  addi t1, sp, 16
  addi t6, t1, 132                                                      # ir inst 68 fin
  li t1, 61
  sw t1, 0(t6)                                                          # ir inst 69 fin
  addi t1, sp, 16
  addi t6, t1, 136                                                      # ir inst 70 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 71 fin
  addi t1, sp, 16
  addi t6, t1, 140                                                      # ir inst 72 fin
  li t1, 49
  sw t1, 0(t6)                                                          # ir inst 73 fin
  addi t1, sp, 16
  addi t6, t1, 144                                                      # ir inst 74 fin
  li t1, 48
  sw t1, 0(t6)                                                          # ir inst 75 fin
  addi t1, sp, 16
  addi t6, t1, 148                                                      # ir inst 76 fin
  li t1, 48
  sw t1, 0(t6)                                                          # ir inst 77 fin
  addi t1, sp, 16
  addi t6, t1, 152                                                      # ir inst 78 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 79 fin
  addi t1, sp, 16
  addi t6, t1, 156                                                      # ir inst 80 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 81 fin
  addi t1, sp, 16
  addi t6, t1, 160                                                      # ir inst 82 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 83 fin
  addi t1, sp, 16
  addi t6, t1, 164                                                      # ir inst 84 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 85 fin
  addi t1, sp, 16
  addi t6, t1, 168                                                      # ir inst 86 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 87 fin
  addi t1, sp, 16
  addi t6, t1, 172                                                      # ir inst 88 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 89 fin
  addi t1, sp, 16
  addi t6, t1, 176                                                      # ir inst 90 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 91 fin
  addi t1, sp, 16
  addi t6, t1, 180                                                      # ir inst 92 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 93 fin
  addi t1, sp, 16
  addi t6, t1, 184                                                      # ir inst 94 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 95 fin
  addi t1, sp, 16
  addi t6, t1, 188                                                      # ir inst 96 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 97 fin
  addi t1, sp, 16
  addi t6, t1, 192                                                      # ir inst 98 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 99 fin
  addi t1, sp, 16
  addi t6, t1, 196                                                      # ir inst 100 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 101 fin
# Phi connections
  li t6, 0
  j .F.initializeParsingText._1.while.cond.0                            # ir inst 102 fin
.F.initializeParsingText._1.while.cond.0:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 104 fin
  bnez t5, .F.initializeParsingText._2.lazy.then.0
  j .F.initializeParsingText._3.lazy.else.0                             # ir inst 105 fin
.F.initializeParsingText._2.lazy.then.0:
  li t2, 1000
  slt t5, t6, t2                                                        # ir inst 106 fin
# Phi connections
  j .F.initializeParsingText._4.lazy.exit.0                             # ir inst 107 fin
.F.initializeParsingText._3.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.initializeParsingText._4.lazy.exit.0                             # ir inst 108 fin
.F.initializeParsingText._4.lazy.exit.0:
  bnez t5, .F.initializeParsingText._5.while.body.0
  j .F.initializeParsingText._6.while.exit.0                            # ir inst 110 fin
.F.initializeParsingText._5.while.body.0:
  mv t5, t6                                                             # ir inst 111 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 112 fin
  mv t5, t6                                                             # ir inst 113 fin
  slli t2, t5, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 114 fin
  lw t5, 0(t3)                                                          # ir inst 115 fin
  sw t5, 0(t4)                                                          # ir inst 116 fin
  addi t5, t6, 1                                                        # ir inst 117 fin
# Phi connections
  mv t6, t5
  j .F.initializeParsingText._1.while.cond.0                            # ir inst 118 fin
.F.initializeParsingText._6.while.exit.0:
# Phi connections
  li t5, 99
  j .F.initializeParsingText._7.while.cond.1                            # ir inst 119 fin
.F.initializeParsingText._7.while.cond.1:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 122 fin
  bnez t4, .F.initializeParsingText._8.while.body.1
  j .F.initializeParsingText._24.while.exit.1                           # ir inst 123 fin
.F.initializeParsingText._8.while.body.1:
  li t2, 525
  mul t4, t5, t2                                                        # ir inst 124 fin
  li t2, 54223
  add t5, t4, t2                                                        # ir inst 125 fin
  li t2, 483647
  rem t4, t5, t2                                                        # ir inst 126 fin
  li t2, 0
  slt t5, t4, t2                                                        # ir inst 127 fin
  bnez t5, .F.initializeParsingText._9.if.then.0
  j .F.initializeParsingText._10.if.else.0                              # ir inst 128 fin
.F.initializeParsingText._9.if.then.0:
  li t1, 0
  sub t5, t1, t4                                                        # ir inst 129 fin
# Phi connections
  j .F.initializeParsingText._11.if.exit.0                              # ir inst 130 fin
.F.initializeParsingText._10.if.else.0:
# Phi connections
  mv t5, t4
  j .F.initializeParsingText._11.if.exit.0                              # ir inst 131 fin
.F.initializeParsingText._11.if.exit.0:
  li t2, 100
  rem t4, t5, t2                                                        # ir inst 133 fin
  li t2, 40
  slt t3, t4, t2                                                        # ir inst 134 fin
  bnez t3, .F.initializeParsingText._12.if.then.1
  j .F.initializeParsingText._13.if.else.1                              # ir inst 135 fin
.F.initializeParsingText._12.if.then.1:
  mv t3, t6                                                             # ir inst 136 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 137 fin
  li t2, 10
  rem t3, t5, t2                                                        # ir inst 138 fin
  addi s10, t3, 48                                                      # ir inst 139 fin
  sw s10, 0(s11)                                                        # ir inst 140 fin
  j .F.initializeParsingText._23.if.exit.1                              # ir inst 141 fin
.F.initializeParsingText._13.if.else.1:
  li t2, 50
  slt t3, t4, t2                                                        # ir inst 142 fin
  bnez t3, .F.initializeParsingText._14.if.then.2
  j .F.initializeParsingText._15.if.else.2                              # ir inst 143 fin
.F.initializeParsingText._14.if.then.2:
  mv t3, t6                                                             # ir inst 144 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 145 fin
  li t1, 44
  sw t1, 0(s11)                                                         # ir inst 146 fin
  j .F.initializeParsingText._22.if.exit.2                              # ir inst 147 fin
.F.initializeParsingText._15.if.else.2:
  li t2, 60
  slt t3, t4, t2                                                        # ir inst 148 fin
  bnez t3, .F.initializeParsingText._16.if.then.3
  j .F.initializeParsingText._17.if.else.3                              # ir inst 149 fin
.F.initializeParsingText._16.if.then.3:
  mv t3, t6                                                             # ir inst 150 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 151 fin
  li t1, 32
  sw t1, 0(s11)                                                         # ir inst 152 fin
  j .F.initializeParsingText._21.if.exit.3                              # ir inst 153 fin
.F.initializeParsingText._17.if.else.3:
  li t2, 70
  slt t3, t4, t2                                                        # ir inst 154 fin
  bnez t3, .F.initializeParsingText._18.if.then.4
  j .F.initializeParsingText._19.if.else.4                              # ir inst 155 fin
.F.initializeParsingText._18.if.then.4:
  mv t4, t6                                                             # ir inst 156 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 157 fin
  li t2, 4
  rem t4, t5, t2                                                        # ir inst 158 fin
  addi s11, t4, 43                                                      # ir inst 159 fin
  sw s11, 0(t3)                                                         # ir inst 160 fin
  j .F.initializeParsingText._20.if.exit.4                              # ir inst 161 fin
.F.initializeParsingText._19.if.else.4:
  mv t4, t6                                                             # ir inst 162 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 163 fin
  li t2, 26
  rem t4, t5, t2                                                        # ir inst 164 fin
  addi s11, t4, 97                                                      # ir inst 165 fin
  sw s11, 0(t3)                                                         # ir inst 166 fin
  j .F.initializeParsingText._20.if.exit.4                              # ir inst 167 fin
.F.initializeParsingText._20.if.exit.4:
  j .F.initializeParsingText._21.if.exit.3                              # ir inst 168 fin
.F.initializeParsingText._21.if.exit.3:
  j .F.initializeParsingText._22.if.exit.2                              # ir inst 169 fin
.F.initializeParsingText._22.if.exit.2:
  j .F.initializeParsingText._23.if.exit.1                              # ir inst 170 fin
.F.initializeParsingText._23.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 171 fin
# Phi connections
  mv t6, t4
  j .F.initializeParsingText._7.while.cond.1                            # ir inst 172 fin
.F.initializeParsingText._24.while.exit.1:
  j .F.initializeParsingText.epilogue                                   # ir inst 173 fin
.F.initializeParsingText.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 224
  ret

.globl .F.parseNumbersFromText
.F.parseNumbersFromText:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.parseNumbersFromText._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.parseNumbersFromText._1.while.cond.0                             # ir inst 1 fin
.F.parseNumbersFromText._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.parseNumbersFromText._2.while.body.0
  j .F.parseNumbersFromText._15.while.exit.0                            # ir inst 6 fin
.F.parseNumbersFromText._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 48
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 10 fin
  bnez s11, .F.parseNumbersFromText._3.lazy.then.0
  j .F.parseNumbersFromText._4.lazy.else.0                              # ir inst 11 fin
.F.parseNumbersFromText._3.lazy.then.0:
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  li t2, 57
  slt t0, t2, t3
  xori s11, t0, 1                                                       # ir inst 15 fin
# Phi connections
  mv t3, s11
  j .F.parseNumbersFromText._5.lazy.exit.0                              # ir inst 16 fin
.F.parseNumbersFromText._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.parseNumbersFromText._5.lazy.exit.0                              # ir inst 17 fin
.F.parseNumbersFromText._5.lazy.exit.0:
  bnez t3, .F.parseNumbersFromText._6.if.then.0
  j .F.parseNumbersFromText._10.if.else.0                               # ir inst 19 fin
.F.parseNumbersFromText._6.if.then.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 20 fin
  bnez t3, .F.parseNumbersFromText._7.if.then.1
  j .F.parseNumbersFromText._8.if.else.1                                # ir inst 21 fin
.F.parseNumbersFromText._7.if.then.1:
# Phi connections
  li t3, 1
  j .F.parseNumbersFromText._9.if.exit.1                                # ir inst 22 fin
.F.parseNumbersFromText._8.if.else.1:
# Phi connections
  mv t3, t5
  j .F.parseNumbersFromText._9.if.exit.1                                # ir inst 23 fin
.F.parseNumbersFromText._9.if.exit.1:
# Phi connections
  mv s11, t4
  j .F.parseNumbersFromText._14.if.exit.0                               # ir inst 25 fin
.F.parseNumbersFromText._10.if.else.0:
  bnez t5, .F.parseNumbersFromText._11.if.then.2
  j .F.parseNumbersFromText._12.if.else.2                               # ir inst 26 fin
.F.parseNumbersFromText._11.if.then.2:
  addi t3, t4, 1                                                        # ir inst 27 fin
# Phi connections
  mv s11, t3
  li t3, 0
  j .F.parseNumbersFromText._13.if.exit.2                               # ir inst 28 fin
.F.parseNumbersFromText._12.if.else.2:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.parseNumbersFromText._13.if.exit.2                               # ir inst 29 fin
.F.parseNumbersFromText._13.if.exit.2:
# Phi connections
  j .F.parseNumbersFromText._14.if.exit.0                               # ir inst 32 fin
.F.parseNumbersFromText._14.if.exit.0:
  addi s10, t6, 1                                                       # ir inst 35 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.parseNumbersFromText._1.while.cond.0                             # ir inst 36 fin
.F.parseNumbersFromText._15.while.exit.0:
  bnez t5, .F.parseNumbersFromText._16.if.then.3
  j .F.parseNumbersFromText._17.if.else.3                               # ir inst 37 fin
.F.parseNumbersFromText._16.if.then.3:
  addi t6, t4, 1                                                        # ir inst 38 fin
# Phi connections
  j .F.parseNumbersFromText._18.if.exit.3                               # ir inst 39 fin
.F.parseNumbersFromText._17.if.else.3:
# Phi connections
  mv t6, t4
  j .F.parseNumbersFromText._18.if.exit.3                               # ir inst 40 fin
.F.parseNumbersFromText._18.if.exit.3:
  mv a0, t6
  j .F.parseNumbersFromText.epilogue                                    # ir inst 42 fin
.F.parseNumbersFromText.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.parseCSVLikeData
.F.parseCSVLikeData:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s10, 8(sp)
  sd s9, 16(sp)
  sd s8, 24(sp)
.F.parseCSVLikeData._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.parseCSVLikeData._1.while.cond.0                                 # ir inst 1 fin
.F.parseCSVLikeData._1.while.cond.0:
  slt s11, t3, a1                                                       # ir inst 6 fin
  bnez s11, .F.parseCSVLikeData._2.while.body.0
  j .F.parseCSVLikeData._24.while.exit.0                                # ir inst 7 fin
.F.parseCSVLikeData._2.while.body.0:
  mv s11, t3                                                            # ir inst 8 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 9 fin
  lw s11, 0(s10)                                                        # ir inst 10 fin
  li t2, 44
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 11 fin
  bnez s10, .F.parseCSVLikeData._3.if.then.0
  j .F.parseCSVLikeData._7.if.else.0                                    # ir inst 12 fin
.F.parseCSVLikeData._3.if.then.0:
  bnez t4, .F.parseCSVLikeData._4.if.then.1
  j .F.parseCSVLikeData._5.if.else.1                                    # ir inst 13 fin
.F.parseCSVLikeData._4.if.then.1:
  addi s11, t6, 1                                                       # ir inst 14 fin
# Phi connections
  li s10, 0
  j .F.parseCSVLikeData._6.if.exit.1                                    # ir inst 15 fin
.F.parseCSVLikeData._5.if.else.1:
# Phi connections
  mv s10, t4
  mv s11, t6
  j .F.parseCSVLikeData._6.if.exit.1                                    # ir inst 16 fin
.F.parseCSVLikeData._6.if.exit.1:
# Phi connections
  mv s9, s10
  mv s10, t5
  j .F.parseCSVLikeData._23.if.exit.0                                   # ir inst 19 fin
.F.parseCSVLikeData._7.if.else.0:
  mv s11, t3                                                            # ir inst 20 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 21 fin
  lw s11, 0(s10)                                                        # ir inst 22 fin
  li t2, 10
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 23 fin
  bnez s10, .F.parseCSVLikeData._8.lazy.then.0
  j .F.parseCSVLikeData._9.lazy.else.0                                  # ir inst 24 fin
.F.parseCSVLikeData._8.lazy.then.0:
# Phi connections
  li s11, 1
  j .F.parseCSVLikeData._10.lazy.exit.0                                 # ir inst 25 fin
.F.parseCSVLikeData._9.lazy.else.0:
  mv s11, t3                                                            # ir inst 26 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 27 fin
  lw s11, 0(s10)                                                        # ir inst 28 fin
  li t2, 13
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 29 fin
# Phi connections
  mv s11, s10
  j .F.parseCSVLikeData._10.lazy.exit.0                                 # ir inst 30 fin
.F.parseCSVLikeData._10.lazy.exit.0:
  bnez s11, .F.parseCSVLikeData._11.if.then.2
  j .F.parseCSVLikeData._15.if.else.2                                   # ir inst 32 fin
.F.parseCSVLikeData._11.if.then.2:
  bnez t4, .F.parseCSVLikeData._12.if.then.3
  j .F.parseCSVLikeData._13.if.else.3                                   # ir inst 33 fin
.F.parseCSVLikeData._12.if.then.3:
  addi s11, t6, 1                                                       # ir inst 34 fin
# Phi connections
  li s10, 0
  j .F.parseCSVLikeData._14.if.exit.3                                   # ir inst 35 fin
.F.parseCSVLikeData._13.if.else.3:
# Phi connections
  mv s10, t4
  mv s11, t6
  j .F.parseCSVLikeData._14.if.exit.3                                   # ir inst 36 fin
.F.parseCSVLikeData._14.if.exit.3:
  addi s9, t5, 1                                                        # ir inst 39 fin
# Phi connections
  mv t0, s9
  mv s9, s10
  mv s10, t0
  j .F.parseCSVLikeData._22.if.exit.2                                   # ir inst 40 fin
.F.parseCSVLikeData._15.if.else.2:
  mv s11, t3                                                            # ir inst 41 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 42 fin
  lw s11, 0(s10)                                                        # ir inst 43 fin
  li t2, 32
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 44 fin
  bnez s10, .F.parseCSVLikeData._16.if.then.4
  j .F.parseCSVLikeData._20.if.else.4                                   # ir inst 45 fin
.F.parseCSVLikeData._16.if.then.4:
  li t2, 0
  xor t0, t4, t2
  sltiu s11, t0, 1                                                      # ir inst 46 fin
  bnez s11, .F.parseCSVLikeData._17.if.then.5
  j .F.parseCSVLikeData._18.if.else.5                                   # ir inst 47 fin
.F.parseCSVLikeData._17.if.then.5:
# Phi connections
  li s11, 1
  j .F.parseCSVLikeData._19.if.exit.5                                   # ir inst 48 fin
.F.parseCSVLikeData._18.if.else.5:
# Phi connections
  mv s11, t4
  j .F.parseCSVLikeData._19.if.exit.5                                   # ir inst 49 fin
.F.parseCSVLikeData._19.if.exit.5:
# Phi connections
  j .F.parseCSVLikeData._21.if.exit.4                                   # ir inst 51 fin
.F.parseCSVLikeData._20.if.else.4:
# Phi connections
  mv s11, t4
  j .F.parseCSVLikeData._21.if.exit.4                                   # ir inst 52 fin
.F.parseCSVLikeData._21.if.exit.4:
# Phi connections
  mv s9, s11
  mv s10, t5
  mv s11, t6
  j .F.parseCSVLikeData._22.if.exit.2                                   # ir inst 54 fin
.F.parseCSVLikeData._22.if.exit.2:
# Phi connections
  j .F.parseCSVLikeData._23.if.exit.0                                   # ir inst 58 fin
.F.parseCSVLikeData._23.if.exit.0:
  addi s8, t3, 1                                                        # ir inst 62 fin
# Phi connections
  mv t3, s8
  mv t4, s9
  mv t5, s10
  mv t6, s11
  j .F.parseCSVLikeData._1.while.cond.0                                 # ir inst 63 fin
.F.parseCSVLikeData._24.while.exit.0:
  bnez t4, .F.parseCSVLikeData._25.if.then.6
  j .F.parseCSVLikeData._26.if.else.6                                   # ir inst 64 fin
.F.parseCSVLikeData._25.if.then.6:
  addi t4, t6, 1                                                        # ir inst 65 fin
# Phi connections
  mv t6, t4
  j .F.parseCSVLikeData._27.if.exit.6                                   # ir inst 66 fin
.F.parseCSVLikeData._26.if.else.6:
# Phi connections
  j .F.parseCSVLikeData._27.if.exit.6                                   # ir inst 67 fin
.F.parseCSVLikeData._27.if.exit.6:
  add t4, t6, t5                                                        # ir inst 69 fin
  mv a0, t4
  j .F.parseCSVLikeData.epilogue                                        # ir inst 70 fin
.F.parseCSVLikeData.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  ld s9, 16(sp)
  ld s8, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.tokenizeText
.F.tokenizeText:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.tokenizeText._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.tokenizeText._1.while.cond.0                                     # ir inst 1 fin
.F.tokenizeText._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.tokenizeText._2.while.body.0
  j .F.tokenizeText._57.while.exit.0                                    # ir inst 6 fin
.F.tokenizeText._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 48
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 10 fin
  bnez s11, .F.tokenizeText._3.lazy.then.0
  j .F.tokenizeText._4.lazy.else.0                                      # ir inst 11 fin
.F.tokenizeText._3.lazy.then.0:
  mv t3, t6                                                             # ir inst 12 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t3, 0(s11)                                                         # ir inst 14 fin
  li t2, 57
  slt t0, t2, t3
  xori s11, t0, 1                                                       # ir inst 15 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._5.lazy.exit.0                                      # ir inst 16 fin
.F.tokenizeText._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.tokenizeText._5.lazy.exit.0                                      # ir inst 17 fin
.F.tokenizeText._5.lazy.exit.0:
  bnez t3, .F.tokenizeText._6.if.then.0
  j .F.tokenizeText._7.if.else.0                                        # ir inst 19 fin
.F.tokenizeText._6.if.then.0:
# Phi connections
  li t3, 1
  j .F.tokenizeText._41.if.exit.0                                       # ir inst 20 fin
.F.tokenizeText._7.if.else.0:
  mv t3, t6                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 22 fin
  lw t3, 0(s11)                                                         # ir inst 23 fin
  li t2, 65
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 24 fin
  bnez s11, .F.tokenizeText._8.lazy.then.1
  j .F.tokenizeText._9.lazy.else.1                                      # ir inst 25 fin
.F.tokenizeText._8.lazy.then.1:
  mv t3, t6                                                             # ir inst 26 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 27 fin
  lw t3, 0(s11)                                                         # ir inst 28 fin
  li t2, 90
  slt t0, t2, t3
  xori s11, t0, 1                                                       # ir inst 29 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._10.lazy.exit.1                                     # ir inst 30 fin
.F.tokenizeText._9.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.tokenizeText._10.lazy.exit.1                                     # ir inst 31 fin
.F.tokenizeText._10.lazy.exit.1:
  bnez t3, .F.tokenizeText._11.lazy.then.2
  j .F.tokenizeText._12.lazy.else.2                                     # ir inst 33 fin
.F.tokenizeText._11.lazy.then.2:
# Phi connections
  li t3, 1
  j .F.tokenizeText._16.lazy.exit.2                                     # ir inst 34 fin
.F.tokenizeText._12.lazy.else.2:
  mv t3, t6                                                             # ir inst 35 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 36 fin
  lw t3, 0(s11)                                                         # ir inst 37 fin
  li t2, 97
  slt t0, t3, t2
  xori s11, t0, 1                                                       # ir inst 38 fin
  bnez s11, .F.tokenizeText._13.lazy.then.3
  j .F.tokenizeText._14.lazy.else.3                                     # ir inst 39 fin
.F.tokenizeText._13.lazy.then.3:
  mv t3, t6                                                             # ir inst 40 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 41 fin
  lw t3, 0(s11)                                                         # ir inst 42 fin
  li t2, 122
  slt t0, t2, t3
  xori s11, t0, 1                                                       # ir inst 43 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._15.lazy.exit.3                                     # ir inst 44 fin
.F.tokenizeText._14.lazy.else.3:
# Phi connections
  li t3, 0
  j .F.tokenizeText._15.lazy.exit.3                                     # ir inst 45 fin
.F.tokenizeText._15.lazy.exit.3:
# Phi connections
  j .F.tokenizeText._16.lazy.exit.2                                     # ir inst 47 fin
.F.tokenizeText._16.lazy.exit.2:
  bnez t3, .F.tokenizeText._17.if.then.1
  j .F.tokenizeText._18.if.else.1                                       # ir inst 49 fin
.F.tokenizeText._17.if.then.1:
# Phi connections
  li t3, 2
  j .F.tokenizeText._40.if.exit.1                                       # ir inst 50 fin
.F.tokenizeText._18.if.else.1:
  mv t3, t6                                                             # ir inst 51 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 52 fin
  lw t3, 0(s11)                                                         # ir inst 53 fin
  li t2, 43
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 54 fin
  bnez s11, .F.tokenizeText._19.lazy.then.4
  j .F.tokenizeText._20.lazy.else.4                                     # ir inst 55 fin
.F.tokenizeText._19.lazy.then.4:
# Phi connections
  li t3, 1
  j .F.tokenizeText._21.lazy.exit.4                                     # ir inst 56 fin
.F.tokenizeText._20.lazy.else.4:
  mv t3, t6                                                             # ir inst 57 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 58 fin
  lw t3, 0(s11)                                                         # ir inst 59 fin
  li t2, 45
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 60 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._21.lazy.exit.4                                     # ir inst 61 fin
.F.tokenizeText._21.lazy.exit.4:
  bnez t3, .F.tokenizeText._22.lazy.then.5
  j .F.tokenizeText._23.lazy.else.5                                     # ir inst 63 fin
.F.tokenizeText._22.lazy.then.5:
# Phi connections
  li t3, 1
  j .F.tokenizeText._24.lazy.exit.5                                     # ir inst 64 fin
.F.tokenizeText._23.lazy.else.5:
  mv t3, t6                                                             # ir inst 65 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 66 fin
  lw t3, 0(s11)                                                         # ir inst 67 fin
  li t2, 42
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 68 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._24.lazy.exit.5                                     # ir inst 69 fin
.F.tokenizeText._24.lazy.exit.5:
  bnez t3, .F.tokenizeText._25.lazy.then.6
  j .F.tokenizeText._26.lazy.else.6                                     # ir inst 71 fin
.F.tokenizeText._25.lazy.then.6:
# Phi connections
  li t3, 1
  j .F.tokenizeText._27.lazy.exit.6                                     # ir inst 72 fin
.F.tokenizeText._26.lazy.else.6:
  mv t3, t6                                                             # ir inst 73 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 74 fin
  lw t3, 0(s11)                                                         # ir inst 75 fin
  li t2, 47
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 76 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._27.lazy.exit.6                                     # ir inst 77 fin
.F.tokenizeText._27.lazy.exit.6:
  bnez t3, .F.tokenizeText._28.if.then.2
  j .F.tokenizeText._29.if.else.2                                       # ir inst 79 fin
.F.tokenizeText._28.if.then.2:
# Phi connections
  li t3, 3
  j .F.tokenizeText._39.if.exit.2                                       # ir inst 80 fin
.F.tokenizeText._29.if.else.2:
  mv t3, t6                                                             # ir inst 81 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 82 fin
  lw t3, 0(s11)                                                         # ir inst 83 fin
  li t2, 44
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 84 fin
  bnez s11, .F.tokenizeText._30.lazy.then.7
  j .F.tokenizeText._31.lazy.else.7                                     # ir inst 85 fin
.F.tokenizeText._30.lazy.then.7:
# Phi connections
  li t3, 1
  j .F.tokenizeText._32.lazy.exit.7                                     # ir inst 86 fin
.F.tokenizeText._31.lazy.else.7:
  mv t3, t6                                                             # ir inst 87 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 88 fin
  lw t3, 0(s11)                                                         # ir inst 89 fin
  li t2, 46
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 90 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._32.lazy.exit.7                                     # ir inst 91 fin
.F.tokenizeText._32.lazy.exit.7:
  bnez t3, .F.tokenizeText._33.lazy.then.8
  j .F.tokenizeText._34.lazy.else.8                                     # ir inst 93 fin
.F.tokenizeText._33.lazy.then.8:
# Phi connections
  li t3, 1
  j .F.tokenizeText._35.lazy.exit.8                                     # ir inst 94 fin
.F.tokenizeText._34.lazy.else.8:
  mv t3, t6                                                             # ir inst 95 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 96 fin
  lw t3, 0(s11)                                                         # ir inst 97 fin
  li t2, 59
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 98 fin
# Phi connections
  mv t3, s11
  j .F.tokenizeText._35.lazy.exit.8                                     # ir inst 99 fin
.F.tokenizeText._35.lazy.exit.8:
  bnez t3, .F.tokenizeText._36.if.then.3
  j .F.tokenizeText._37.if.else.3                                       # ir inst 101 fin
.F.tokenizeText._36.if.then.3:
# Phi connections
  li t3, 4
  j .F.tokenizeText._38.if.exit.3                                       # ir inst 102 fin
.F.tokenizeText._37.if.else.3:
# Phi connections
  li t3, 0
  j .F.tokenizeText._38.if.exit.3                                       # ir inst 103 fin
.F.tokenizeText._38.if.exit.3:
# Phi connections
  j .F.tokenizeText._39.if.exit.2                                       # ir inst 105 fin
.F.tokenizeText._39.if.exit.2:
# Phi connections
  j .F.tokenizeText._40.if.exit.1                                       # ir inst 107 fin
.F.tokenizeText._40.if.exit.1:
# Phi connections
  j .F.tokenizeText._41.if.exit.0                                       # ir inst 109 fin
.F.tokenizeText._41.if.exit.0:
  li t2, 0
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 111 fin
  bnez s11, .F.tokenizeText._42.lazy.then.9
  j .F.tokenizeText._43.lazy.else.9                                     # ir inst 112 fin
.F.tokenizeText._42.lazy.then.9:
  xor t0, t3, t5
  sltu s11, zero, t0                                                    # ir inst 113 fin
# Phi connections
  j .F.tokenizeText._44.lazy.exit.9                                     # ir inst 114 fin
.F.tokenizeText._43.lazy.else.9:
# Phi connections
  li s11, 0
  j .F.tokenizeText._44.lazy.exit.9                                     # ir inst 115 fin
.F.tokenizeText._44.lazy.exit.9:
  bnez s11, .F.tokenizeText._45.if.then.4
  j .F.tokenizeText._49.if.else.4                                       # ir inst 117 fin
.F.tokenizeText._45.if.then.4:
  li t2, 0
  xor t0, t5, t2
  sltu s11, zero, t0                                                    # ir inst 118 fin
  bnez s11, .F.tokenizeText._46.if.then.5
  j .F.tokenizeText._47.if.else.5                                       # ir inst 119 fin
.F.tokenizeText._46.if.then.5:
  addi s11, t4, 1                                                       # ir inst 120 fin
# Phi connections
  j .F.tokenizeText._48.if.exit.5                                       # ir inst 121 fin
.F.tokenizeText._47.if.else.5:
# Phi connections
  mv s11, t4
  j .F.tokenizeText._48.if.exit.5                                       # ir inst 122 fin
.F.tokenizeText._48.if.exit.5:
# Phi connections
  j .F.tokenizeText._56.if.exit.4                                       # ir inst 124 fin
.F.tokenizeText._49.if.else.4:
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 125 fin
  bnez s11, .F.tokenizeText._50.if.then.6
  j .F.tokenizeText._54.if.else.6                                       # ir inst 126 fin
.F.tokenizeText._50.if.then.6:
  li t2, 0
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 127 fin
  bnez t3, .F.tokenizeText._51.if.then.7
  j .F.tokenizeText._52.if.else.7                                       # ir inst 128 fin
.F.tokenizeText._51.if.then.7:
  addi t3, t4, 1                                                        # ir inst 129 fin
# Phi connections
  mv s11, t3
  li t3, 0
  j .F.tokenizeText._53.if.exit.7                                       # ir inst 130 fin
.F.tokenizeText._52.if.else.7:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.tokenizeText._53.if.exit.7                                       # ir inst 131 fin
.F.tokenizeText._53.if.exit.7:
# Phi connections
  j .F.tokenizeText._55.if.exit.6                                       # ir inst 134 fin
.F.tokenizeText._54.if.else.6:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.tokenizeText._55.if.exit.6                                       # ir inst 135 fin
.F.tokenizeText._55.if.exit.6:
# Phi connections
  j .F.tokenizeText._56.if.exit.4                                       # ir inst 138 fin
.F.tokenizeText._56.if.exit.4:
  addi s10, t6, 1                                                       # ir inst 141 fin
# Phi connections
  mv t4, s11
  mv t5, t3
  mv t6, s10
  j .F.tokenizeText._1.while.cond.0                                     # ir inst 142 fin
.F.tokenizeText._57.while.exit.0:
  li t2, 0
  xor t0, t5, t2
  sltu t6, zero, t0                                                     # ir inst 143 fin
  bnez t6, .F.tokenizeText._58.if.then.8
  j .F.tokenizeText._59.if.else.8                                       # ir inst 144 fin
.F.tokenizeText._58.if.then.8:
  addi t6, t4, 1                                                        # ir inst 145 fin
# Phi connections
  j .F.tokenizeText._60.if.exit.8                                       # ir inst 146 fin
.F.tokenizeText._59.if.else.8:
# Phi connections
  mv t6, t4
  j .F.tokenizeText._60.if.exit.8                                       # ir inst 147 fin
.F.tokenizeText._60.if.exit.8:
  mv a0, t6
  j .F.tokenizeText.epilogue                                            # ir inst 149 fin
.F.tokenizeText.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.parseSimpleExpressions
.F.parseSimpleExpressions:
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
.F.parseSimpleExpressions._0.entry.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.parseSimpleExpressions._1.while.cond.0                           # ir inst 1 fin
.F.parseSimpleExpressions._1.while.cond.0:
  slt s11, t3, a1                                                       # ir inst 6 fin
  bnez s11, .F.parseSimpleExpressions._2.while.body.0
  j .F.parseSimpleExpressions._39.while.exit.0                          # ir inst 7 fin
.F.parseSimpleExpressions._2.while.body.0:
  mv s11, t3                                                            # ir inst 8 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 9 fin
  lw s11, 0(s10)                                                        # ir inst 10 fin
  li t2, 48
  slt t0, s11, t2
  xori s10, t0, 1                                                       # ir inst 11 fin
  bnez s10, .F.parseSimpleExpressions._3.lazy.then.0
  j .F.parseSimpleExpressions._4.lazy.else.0                            # ir inst 12 fin
.F.parseSimpleExpressions._3.lazy.then.0:
  mv s11, t3                                                            # ir inst 13 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 14 fin
  lw s11, 0(s10)                                                        # ir inst 15 fin
  li t2, 57
  slt t0, t2, s11
  xori s10, t0, 1                                                       # ir inst 16 fin
# Phi connections
  mv s11, s10
  j .F.parseSimpleExpressions._5.lazy.exit.0                            # ir inst 17 fin
.F.parseSimpleExpressions._4.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.parseSimpleExpressions._5.lazy.exit.0                            # ir inst 18 fin
.F.parseSimpleExpressions._5.lazy.exit.0:
  bnez s11, .F.parseSimpleExpressions._6.if.then.0
  j .F.parseSimpleExpressions._16.if.else.0                             # ir inst 20 fin
.F.parseSimpleExpressions._6.if.then.0:
# Phi connections
  mv s11, t3
  j .F.parseSimpleExpressions._7.while.cond.1                           # ir inst 21 fin
.F.parseSimpleExpressions._7.while.cond.1:
  slt s10, s11, a1                                                      # ir inst 23 fin
  bnez s10, .F.parseSimpleExpressions._8.lazy.then.1
  j .F.parseSimpleExpressions._9.lazy.else.1                            # ir inst 24 fin
.F.parseSimpleExpressions._8.lazy.then.1:
  mv s10, s11                                                           # ir inst 25 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 26 fin
  lw s10, 0(s9)                                                         # ir inst 27 fin
  li t2, 48
  slt t0, s10, t2
  xori s9, t0, 1                                                        # ir inst 28 fin
# Phi connections
  mv s10, s9
  j .F.parseSimpleExpressions._10.lazy.exit.1                           # ir inst 29 fin
.F.parseSimpleExpressions._9.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.parseSimpleExpressions._10.lazy.exit.1                           # ir inst 30 fin
.F.parseSimpleExpressions._10.lazy.exit.1:
  bnez s10, .F.parseSimpleExpressions._11.lazy.then.2
  j .F.parseSimpleExpressions._12.lazy.else.2                           # ir inst 32 fin
.F.parseSimpleExpressions._11.lazy.then.2:
  mv s10, s11                                                           # ir inst 33 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 34 fin
  lw s10, 0(s9)                                                         # ir inst 35 fin
  li t2, 57
  slt t0, t2, s10
  xori s9, t0, 1                                                        # ir inst 36 fin
# Phi connections
  mv s10, s9
  j .F.parseSimpleExpressions._13.lazy.exit.2                           # ir inst 37 fin
.F.parseSimpleExpressions._12.lazy.else.2:
# Phi connections
  li s10, 0
  j .F.parseSimpleExpressions._13.lazy.exit.2                           # ir inst 38 fin
.F.parseSimpleExpressions._13.lazy.exit.2:
  bnez s10, .F.parseSimpleExpressions._14.while.body.1
  j .F.parseSimpleExpressions._15.while.exit.1                          # ir inst 40 fin
.F.parseSimpleExpressions._14.while.body.1:
  addi s10, s11, 1                                                      # ir inst 41 fin
# Phi connections
  mv s11, s10
  j .F.parseSimpleExpressions._7.while.cond.1                           # ir inst 42 fin
.F.parseSimpleExpressions._15.while.exit.1:
  addi s10, t4, 1                                                       # ir inst 43 fin
  addi s9, s11, -1                                                      # ir inst 44 fin
# Phi connections
  mv s11, s9
  mv t3, s10
  mv t4, t5
  mv t5, t6
  j .F.parseSimpleExpressions._38.if.exit.0                             # ir inst 45 fin
.F.parseSimpleExpressions._16.if.else.0:
  mv s11, t3                                                            # ir inst 46 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 47 fin
  lw s11, 0(s10)                                                        # ir inst 48 fin
  li t2, 43
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 49 fin
  bnez s10, .F.parseSimpleExpressions._17.lazy.then.3
  j .F.parseSimpleExpressions._18.lazy.else.3                           # ir inst 50 fin
.F.parseSimpleExpressions._17.lazy.then.3:
# Phi connections
  li s11, 1
  j .F.parseSimpleExpressions._19.lazy.exit.3                           # ir inst 51 fin
.F.parseSimpleExpressions._18.lazy.else.3:
  mv s11, t3                                                            # ir inst 52 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 53 fin
  lw s11, 0(s10)                                                        # ir inst 54 fin
  li t2, 45
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 55 fin
# Phi connections
  mv s11, s10
  j .F.parseSimpleExpressions._19.lazy.exit.3                           # ir inst 56 fin
.F.parseSimpleExpressions._19.lazy.exit.3:
  bnez s11, .F.parseSimpleExpressions._20.lazy.then.4
  j .F.parseSimpleExpressions._21.lazy.else.4                           # ir inst 58 fin
.F.parseSimpleExpressions._20.lazy.then.4:
# Phi connections
  li s11, 1
  j .F.parseSimpleExpressions._22.lazy.exit.4                           # ir inst 59 fin
.F.parseSimpleExpressions._21.lazy.else.4:
  mv s11, t3                                                            # ir inst 60 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 61 fin
  lw s11, 0(s10)                                                        # ir inst 62 fin
  li t2, 42
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 63 fin
# Phi connections
  mv s11, s10
  j .F.parseSimpleExpressions._22.lazy.exit.4                           # ir inst 64 fin
.F.parseSimpleExpressions._22.lazy.exit.4:
  bnez s11, .F.parseSimpleExpressions._23.lazy.then.5
  j .F.parseSimpleExpressions._24.lazy.else.5                           # ir inst 66 fin
.F.parseSimpleExpressions._23.lazy.then.5:
# Phi connections
  li s11, 1
  j .F.parseSimpleExpressions._25.lazy.exit.5                           # ir inst 67 fin
.F.parseSimpleExpressions._24.lazy.else.5:
  mv s11, t3                                                            # ir inst 68 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 69 fin
  lw s11, 0(s10)                                                        # ir inst 70 fin
  li t2, 47
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 71 fin
# Phi connections
  mv s11, s10
  j .F.parseSimpleExpressions._25.lazy.exit.5                           # ir inst 72 fin
.F.parseSimpleExpressions._25.lazy.exit.5:
  bnez s11, .F.parseSimpleExpressions._26.if.then.1
  j .F.parseSimpleExpressions._27.if.else.1                             # ir inst 74 fin
.F.parseSimpleExpressions._26.if.then.1:
  addi s11, t5, 1                                                       # ir inst 75 fin
# Phi connections
  mv t5, t6
  mv t0, s11
  mv s11, t4
  mv t4, t0
  j .F.parseSimpleExpressions._37.if.exit.1                             # ir inst 76 fin
.F.parseSimpleExpressions._27.if.else.1:
  mv s11, t3                                                            # ir inst 77 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 78 fin
  lw s11, 0(s10)                                                        # ir inst 79 fin
  li t2, 61
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 80 fin
  bnez s10, .F.parseSimpleExpressions._28.if.then.2
  j .F.parseSimpleExpressions._35.if.else.2                             # ir inst 81 fin
.F.parseSimpleExpressions._28.if.then.2:
  li t2, 0
  slt s11, t2, t4                                                       # ir inst 82 fin
  bnez s11, .F.parseSimpleExpressions._29.lazy.then.6
  j .F.parseSimpleExpressions._30.lazy.else.6                           # ir inst 83 fin
.F.parseSimpleExpressions._29.lazy.then.6:
  li t2, 0
  slt s11, t2, t5                                                       # ir inst 84 fin
# Phi connections
  j .F.parseSimpleExpressions._31.lazy.exit.6                           # ir inst 85 fin
.F.parseSimpleExpressions._30.lazy.else.6:
# Phi connections
  li s11, 0
  j .F.parseSimpleExpressions._31.lazy.exit.6                           # ir inst 86 fin
.F.parseSimpleExpressions._31.lazy.exit.6:
  bnez s11, .F.parseSimpleExpressions._32.if.then.3
  j .F.parseSimpleExpressions._33.if.else.3                             # ir inst 88 fin
.F.parseSimpleExpressions._32.if.then.3:
  addi s11, t6, 1                                                       # ir inst 89 fin
# Phi connections
  j .F.parseSimpleExpressions._34.if.exit.3                             # ir inst 90 fin
.F.parseSimpleExpressions._33.if.else.3:
# Phi connections
  mv s11, t6
  j .F.parseSimpleExpressions._34.if.exit.3                             # ir inst 91 fin
.F.parseSimpleExpressions._34.if.exit.3:
# Phi connections
  li t4, 0
  mv t5, s11
  li s11, 0
  j .F.parseSimpleExpressions._36.if.exit.2                             # ir inst 93 fin
.F.parseSimpleExpressions._35.if.else.2:
# Phi connections
  mv s11, t4
  mv t4, t5
  mv t5, t6
  j .F.parseSimpleExpressions._36.if.exit.2                             # ir inst 94 fin
.F.parseSimpleExpressions._36.if.exit.2:
# Phi connections
  j .F.parseSimpleExpressions._37.if.exit.1                             # ir inst 98 fin
.F.parseSimpleExpressions._37.if.exit.1:
# Phi connections
  mv t0, s11
  mv s11, t3
  mv t3, t0
  j .F.parseSimpleExpressions._38.if.exit.0                             # ir inst 102 fin
.F.parseSimpleExpressions._38.if.exit.0:
  addi s10, s11, 1                                                      # ir inst 107 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  mv t4, t3
  mv t3, s10
  j .F.parseSimpleExpressions._1.while.cond.0                           # ir inst 108 fin
.F.parseSimpleExpressions._39.while.exit.0:
  mv a0, t6
  j .F.parseSimpleExpressions.epilogue                                  # ir inst 109 fin
.F.parseSimpleExpressions.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.testStringCompressionAlgorithms
.F.testStringCompressionAlgorithms:
# spill func args num: 0,             range:     6016(sp) -     6016(sp)
# local var size: 6000,               range:       16(sp) -     6016(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6016
  add sp, sp, t0
  sd ra, 8(sp)
.F.testStringCompressionAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1607
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testStringCompressionAlgorithms._1.array.cond.0                  # ir inst 4 fin
.F.testStringCompressionAlgorithms._1.array.cond.0:
  li t2, 1500
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testStringCompressionAlgorithms._2.array.body.0
  j .F.testStringCompressionAlgorithms._3.array.exit.0                  # ir inst 7 fin
.F.testStringCompressionAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testStringCompressionAlgorithms._1.array.cond.0                  # ir inst 11 fin
.F.testStringCompressionAlgorithms._3.array.exit.0:
# Start call preparation
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeCompressionText
# ir inst 12 fin
# Start call preparation
  li a1, 1500
  addi t1, sp, 16
  mv a0, t1
  call .F.runLengthEncoding
  mv t6, a0
# ir inst 13 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 14 fin
# Start call preparation
  li a1, 1500
  addi t1, sp, 16
  mv a0, t1
  call .F.simpleDictionaryCompression
  mv t6, a0
# ir inst 15 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 16 fin
# Start call preparation
  li a1, 1500
  addi t1, sp, 16
  mv a0, t1
  call .F.patternBasedCompression
  mv t6, a0
# ir inst 17 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 18 fin
# Start call preparation
  li a1, 1500
  addi t1, sp, 16
  mv a0, t1
  call .F.frequencyBasedEncoding
  mv t6, a0
# ir inst 19 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 20 fin
# Start call preparation
  li a0, 1608
  call printlnInt
# ir inst 21 fin
  j .F.testStringCompressionAlgorithms.epilogue                         # ir inst 22 fin
.F.testStringCompressionAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 6016
  add sp, sp, t0
  ret

.globl .F.initializeCompressionText
.F.initializeCompressionText:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeCompressionText._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeCompressionText._1.while.cond.0                        # ir inst 1 fin
.F.initializeCompressionText._1.while.cond.0:
  li t2, 1500
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeCompressionText._2.while.body.0
  j .F.initializeCompressionText._15.while.exit.0                       # ir inst 4 fin
.F.initializeCompressionText._2.while.body.0:
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 5 fin
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.initializeCompressionText._3.if.then.0
  j .F.initializeCompressionText._4.if.else.0                           # ir inst 7 fin
.F.initializeCompressionText._3.if.then.0:
  mv t5, t6                                                             # ir inst 8 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 9 fin
  li t1, 65
  sw t1, 0(t4)                                                          # ir inst 10 fin
  j .F.initializeCompressionText._14.if.exit.0                          # ir inst 11 fin
.F.initializeCompressionText._4.if.else.0:
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 12 fin
  li t2, 40
  slt t4, t5, t2                                                        # ir inst 13 fin
  bnez t4, .F.initializeCompressionText._5.if.then.1
  j .F.initializeCompressionText._6.if.else.1                           # ir inst 14 fin
.F.initializeCompressionText._5.if.then.1:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 16 fin
  li t1, 66
  sw t1, 0(t4)                                                          # ir inst 17 fin
  j .F.initializeCompressionText._13.if.exit.1                          # ir inst 18 fin
.F.initializeCompressionText._6.if.else.1:
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 19 fin
  li t2, 60
  slt t4, t5, t2                                                        # ir inst 20 fin
  bnez t4, .F.initializeCompressionText._7.if.then.2
  j .F.initializeCompressionText._8.if.else.2                           # ir inst 21 fin
.F.initializeCompressionText._7.if.then.2:
  mv t5, t6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 23 fin
  li t1, 67
  sw t1, 0(t4)                                                          # ir inst 24 fin
  j .F.initializeCompressionText._12.if.exit.2                          # ir inst 25 fin
.F.initializeCompressionText._8.if.else.2:
  li t2, 100
  rem t5, t6, t2                                                        # ir inst 26 fin
  li t2, 80
  slt t4, t5, t2                                                        # ir inst 27 fin
  bnez t4, .F.initializeCompressionText._9.if.then.3
  j .F.initializeCompressionText._10.if.else.3                          # ir inst 28 fin
.F.initializeCompressionText._9.if.then.3:
  mv t5, t6                                                             # ir inst 29 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 30 fin
  li t1, 32
  sw t1, 0(t4)                                                          # ir inst 31 fin
  j .F.initializeCompressionText._11.if.exit.3                          # ir inst 32 fin
.F.initializeCompressionText._10.if.else.3:
  mv t5, t6                                                             # ir inst 33 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 34 fin
  li t2, 5
  rem t5, t6, t2                                                        # ir inst 35 fin
  addi t3, t5, 68                                                       # ir inst 36 fin
  sw t3, 0(t4)                                                          # ir inst 37 fin
  j .F.initializeCompressionText._11.if.exit.3                          # ir inst 38 fin
.F.initializeCompressionText._11.if.exit.3:
  j .F.initializeCompressionText._12.if.exit.2                          # ir inst 39 fin
.F.initializeCompressionText._12.if.exit.2:
  j .F.initializeCompressionText._13.if.exit.1                          # ir inst 40 fin
.F.initializeCompressionText._13.if.exit.1:
  j .F.initializeCompressionText._14.if.exit.0                          # ir inst 41 fin
.F.initializeCompressionText._14.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 42 fin
# Phi connections
  mv t6, t5
  j .F.initializeCompressionText._1.while.cond.0                        # ir inst 43 fin
.F.initializeCompressionText._15.while.exit.0:
  j .F.initializeCompressionText.epilogue                               # ir inst 44 fin
.F.initializeCompressionText.epilogue:
  ret

.globl .F.runLengthEncoding
.F.runLengthEncoding:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.runLengthEncoding._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.runLengthEncoding._1.while.cond.0                                # ir inst 1 fin
.F.runLengthEncoding._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.runLengthEncoding._2.while.body.0
  j .F.runLengthEncoding._12.while.exit.0                               # ir inst 5 fin
.F.runLengthEncoding._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
# Phi connections
  li t3, 1
  j .F.runLengthEncoding._3.while.cond.1                                # ir inst 9 fin
.F.runLengthEncoding._3.while.cond.1:
  add s11, t6, t3                                                       # ir inst 11 fin
  slt s10, s11, a1                                                      # ir inst 12 fin
  bnez s10, .F.runLengthEncoding._4.lazy.then.0
  j .F.runLengthEncoding._5.lazy.else.0                                 # ir inst 13 fin
.F.runLengthEncoding._4.lazy.then.0:
  add s11, t6, t3                                                       # ir inst 14 fin
  mv s10, s11                                                           # ir inst 15 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 16 fin
  lw s10, 0(s11)                                                        # ir inst 17 fin
  xor t0, s10, t4
  sltiu s11, t0, 1                                                      # ir inst 18 fin
# Phi connections
  j .F.runLengthEncoding._6.lazy.exit.0                                 # ir inst 19 fin
.F.runLengthEncoding._5.lazy.else.0:
# Phi connections
  li s11, 0
  j .F.runLengthEncoding._6.lazy.exit.0                                 # ir inst 20 fin
.F.runLengthEncoding._6.lazy.exit.0:
  bnez s11, .F.runLengthEncoding._7.while.body.1
  j .F.runLengthEncoding._8.while.exit.1                                # ir inst 22 fin
.F.runLengthEncoding._7.while.body.1:
  addi s11, t3, 1                                                       # ir inst 23 fin
# Phi connections
  mv t3, s11
  j .F.runLengthEncoding._3.while.cond.1                                # ir inst 24 fin
.F.runLengthEncoding._8.while.exit.1:
  li t2, 3
  slt t4, t2, t3                                                        # ir inst 25 fin
  bnez t4, .F.runLengthEncoding._9.if.then.0
  j .F.runLengthEncoding._10.if.else.0                                  # ir inst 26 fin
.F.runLengthEncoding._9.if.then.0:
  addi t4, t5, 2                                                        # ir inst 27 fin
# Phi connections
  j .F.runLengthEncoding._11.if.exit.0                                  # ir inst 28 fin
.F.runLengthEncoding._10.if.else.0:
  add t4, t5, t3                                                        # ir inst 29 fin
# Phi connections
  j .F.runLengthEncoding._11.if.exit.0                                  # ir inst 30 fin
.F.runLengthEncoding._11.if.exit.0:
  add s11, t6, t3                                                       # ir inst 32 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  j .F.runLengthEncoding._1.while.cond.0                                # ir inst 33 fin
.F.runLengthEncoding._12.while.exit.0:
  mv a0, t5
  j .F.runLengthEncoding.epilogue                                       # ir inst 34 fin
.F.runLengthEncoding.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.simpleDictionaryCompression
.F.simpleDictionaryCompression:
# spill func args num: 0,             range:     1040(sp) -     1040(sp)
# local var size: 1024,               range:       16(sp) -     1040(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1040
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.simpleDictionaryCompression._0.entry.0:
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.simpleDictionaryCompression._1.array.cond.0                      # ir inst 3 fin
.F.simpleDictionaryCompression._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.simpleDictionaryCompression._2.array.body.0
  j .F.simpleDictionaryCompression._3.array.exit.0                      # ir inst 6 fin
.F.simpleDictionaryCompression._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.simpleDictionaryCompression._1.array.cond.0                      # ir inst 10 fin
.F.simpleDictionaryCompression._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simpleDictionaryCompression._4.while.cond.0                      # ir inst 11 fin
.F.simpleDictionaryCompression._4.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 14 fin
  bnez t4, .F.simpleDictionaryCompression._5.while.body.0
  j .F.simpleDictionaryCompression._15.while.exit.0                     # ir inst 15 fin
.F.simpleDictionaryCompression._5.while.body.0:
  mv t4, t5                                                             # ir inst 16 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 17 fin
  lw t4, 0(t3)                                                          # ir inst 18 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 19 fin
  bnez t3, .F.simpleDictionaryCompression._6.lazy.then.0
  j .F.simpleDictionaryCompression._7.lazy.else.0                       # ir inst 20 fin
.F.simpleDictionaryCompression._6.lazy.then.0:
  mv t4, t5                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  li t2, 256
  slt t3, t4, t2                                                        # ir inst 24 fin
# Phi connections
  mv t4, t3
  j .F.simpleDictionaryCompression._8.lazy.exit.0                       # ir inst 25 fin
.F.simpleDictionaryCompression._7.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.simpleDictionaryCompression._8.lazy.exit.0                       # ir inst 26 fin
.F.simpleDictionaryCompression._8.lazy.exit.0:
  bnez t4, .F.simpleDictionaryCompression._9.if.then.0
  j .F.simpleDictionaryCompression._13.if.else.0                        # ir inst 28 fin
.F.simpleDictionaryCompression._9.if.then.0:
  mv t4, t5                                                             # ir inst 29 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 30 fin
  lw t4, 0(t3)                                                          # ir inst 31 fin
  mv t3, t4                                                             # ir inst 32 fin
  slli t2, t3, 2
  addi t1, sp, 16
  add t4, t1, t2                                                        # ir inst 33 fin
  lw t3, 0(t4)                                                          # ir inst 34 fin
  li t2, 0
  xor t0, t3, t2
  sltiu t4, t0, 1                                                       # ir inst 35 fin
  bnez t4, .F.simpleDictionaryCompression._10.if.then.1
  j .F.simpleDictionaryCompression._11.if.else.1                        # ir inst 36 fin
.F.simpleDictionaryCompression._10.if.then.1:
  addi t4, t6, 1                                                        # ir inst 37 fin
# Phi connections
  j .F.simpleDictionaryCompression._12.if.exit.1                        # ir inst 38 fin
.F.simpleDictionaryCompression._11.if.else.1:
# Phi connections
  mv t4, t6
  j .F.simpleDictionaryCompression._12.if.exit.1                        # ir inst 39 fin
.F.simpleDictionaryCompression._12.if.exit.1:
  mv t3, t5                                                             # ir inst 41 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 42 fin
  lw t3, 0(s11)                                                         # ir inst 43 fin
  mv s11, t3                                                            # ir inst 44 fin
  slli t2, s11, 2
  addi t1, sp, 16
  add t3, t1, t2                                                        # ir inst 45 fin
  mv s11, t5                                                            # ir inst 46 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 47 fin
  lw s11, 0(s10)                                                        # ir inst 48 fin
  mv s10, s11                                                           # ir inst 49 fin
  slli t2, s10, 2
  addi t1, sp, 16
  add s11, t1, t2                                                       # ir inst 50 fin
  lw s10, 0(s11)                                                        # ir inst 51 fin
  addi s11, s10, 1                                                      # ir inst 52 fin
  sw s11, 0(t3)                                                         # ir inst 53 fin
# Phi connections
  j .F.simpleDictionaryCompression._14.if.exit.0                        # ir inst 54 fin
.F.simpleDictionaryCompression._13.if.else.0:
# Phi connections
  mv t4, t6
  j .F.simpleDictionaryCompression._14.if.exit.0                        # ir inst 55 fin
.F.simpleDictionaryCompression._14.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 57 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.simpleDictionaryCompression._4.while.cond.0                      # ir inst 58 fin
.F.simpleDictionaryCompression._15.while.exit.0:
  li t2, 2
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 59 fin
  bnez t5, .F.simpleDictionaryCompression._16.if.then.2
  j .F.simpleDictionaryCompression._17.if.else.2                        # ir inst 60 fin
.F.simpleDictionaryCompression._16.if.then.2:
# Phi connections
  li t6, 1
  j .F.simpleDictionaryCompression._24.if.exit.2                        # ir inst 61 fin
.F.simpleDictionaryCompression._17.if.else.2:
  li t2, 4
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 62 fin
  bnez t5, .F.simpleDictionaryCompression._18.if.then.3
  j .F.simpleDictionaryCompression._19.if.else.3                        # ir inst 63 fin
.F.simpleDictionaryCompression._18.if.then.3:
# Phi connections
  li t6, 2
  j .F.simpleDictionaryCompression._23.if.exit.3                        # ir inst 64 fin
.F.simpleDictionaryCompression._19.if.else.3:
  li t2, 16
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 65 fin
  bnez t5, .F.simpleDictionaryCompression._20.if.then.4
  j .F.simpleDictionaryCompression._21.if.else.4                        # ir inst 66 fin
.F.simpleDictionaryCompression._20.if.then.4:
# Phi connections
  li t6, 4
  j .F.simpleDictionaryCompression._22.if.exit.4                        # ir inst 67 fin
.F.simpleDictionaryCompression._21.if.else.4:
# Phi connections
  li t6, 8
  j .F.simpleDictionaryCompression._22.if.exit.4                        # ir inst 68 fin
.F.simpleDictionaryCompression._22.if.exit.4:
# Phi connections
  j .F.simpleDictionaryCompression._23.if.exit.3                        # ir inst 70 fin
.F.simpleDictionaryCompression._23.if.exit.3:
# Phi connections
  j .F.simpleDictionaryCompression._24.if.exit.2                        # ir inst 72 fin
.F.simpleDictionaryCompression._24.if.exit.2:
  mul t5, a1, t6                                                        # ir inst 74 fin
  li t2, 8
  div t6, t5, t2                                                        # ir inst 75 fin
  mv a0, t6
  j .F.simpleDictionaryCompression.epilogue                             # ir inst 76 fin
.F.simpleDictionaryCompression.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 1040
  ret

.globl .F.patternBasedCompression
.F.patternBasedCompression:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s7, 0(sp)
  sd s8, 8(sp)
  sd s9, 16(sp)
  sd s11, 24(sp)
  sd s10, 32(sp)
.F.patternBasedCompression._0.entry.0:
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.patternBasedCompression._1.while.cond.0                          # ir inst 1 fin
.F.patternBasedCompression._1.while.cond.0:
  addi t3, a1, -1                                                       # ir inst 5 fin
  slt s11, t5, t3                                                       # ir inst 6 fin
  bnez s11, .F.patternBasedCompression._2.while.body.0
  j .F.patternBasedCompression._12.while.exit.0                         # ir inst 7 fin
.F.patternBasedCompression._2.while.body.0:
  mv t3, t5                                                             # ir inst 8 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 9 fin
  lw t3, 0(s11)                                                         # ir inst 10 fin
  slli s11, t3, 8                                                       # ir inst 11 fin
  mv t3, t5                                                             # ir inst 12 fin
  addi s10, t3, 1                                                       # ir inst 13 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s10, 0(t3)                                                         # ir inst 15 fin
  add t3, s11, s10                                                      # ir inst 16 fin
  addi s11, t5, 2                                                       # ir inst 17 fin
# Phi connections
  mv s10, s11
  li s11, 1
  j .F.patternBasedCompression._3.while.cond.1                          # ir inst 18 fin
.F.patternBasedCompression._3.while.cond.1:
  addi s9, a1, -1                                                       # ir inst 21 fin
  slt s8, s10, s9                                                       # ir inst 22 fin
  bnez s8, .F.patternBasedCompression._4.while.body.1
  j .F.patternBasedCompression._8.while.exit.1                          # ir inst 23 fin
.F.patternBasedCompression._4.while.body.1:
  mv s9, s10                                                            # ir inst 24 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 25 fin
  lw s9, 0(s8)                                                          # ir inst 26 fin
  slli s8, s9, 8                                                        # ir inst 27 fin
  mv s9, s10                                                            # ir inst 28 fin
  addi s7, s9, 1                                                        # ir inst 29 fin
  slli t2, s7, 2
  add s9, a0, t2                                                        # ir inst 30 fin
  lw s7, 0(s9)                                                          # ir inst 31 fin
  add s9, s8, s7                                                        # ir inst 32 fin
  xor t0, s9, t3
  sltiu s8, t0, 1                                                       # ir inst 33 fin
  bnez s8, .F.patternBasedCompression._5.if.then.0
  j .F.patternBasedCompression._6.if.else.0                             # ir inst 34 fin
.F.patternBasedCompression._5.if.then.0:
  addi s9, s11, 1                                                       # ir inst 35 fin
  addi s8, s10, 2                                                       # ir inst 36 fin
# Phi connections
  mv s10, s9
  mv s9, s8
  j .F.patternBasedCompression._7.if.exit.0                             # ir inst 37 fin
.F.patternBasedCompression._6.if.else.0:
  addi s9, s10, 1                                                       # ir inst 38 fin
# Phi connections
  mv s10, s11
  j .F.patternBasedCompression._7.if.exit.0                             # ir inst 39 fin
.F.patternBasedCompression._7.if.exit.0:
# Phi connections
  mv s11, s10
  mv s10, s9
  j .F.patternBasedCompression._3.while.cond.1                          # ir inst 42 fin
.F.patternBasedCompression._8.while.exit.1:
  li t2, 2
  slt t3, t2, s11                                                       # ir inst 43 fin
  bnez t3, .F.patternBasedCompression._9.if.then.1
  j .F.patternBasedCompression._10.if.else.1                            # ir inst 44 fin
.F.patternBasedCompression._9.if.then.1:
  addi t3, t4, 1                                                        # ir inst 45 fin
  add s10, t6, s11                                                      # ir inst 46 fin
# Phi connections
  mv s11, t3
  mv t3, s10
  j .F.patternBasedCompression._11.if.exit.1                            # ir inst 47 fin
.F.patternBasedCompression._10.if.else.1:
# Phi connections
  mv s11, t4
  mv t3, t6
  j .F.patternBasedCompression._11.if.exit.1                            # ir inst 48 fin
.F.patternBasedCompression._11.if.exit.1:
  addi s10, t5, 1                                                       # ir inst 51 fin
# Phi connections
  mv t4, s11
  mv t5, s10
  mv t6, t3
  j .F.patternBasedCompression._1.while.cond.0                          # ir inst 52 fin
.F.patternBasedCompression._12.while.exit.0:
  add t5, t4, t6                                                        # ir inst 53 fin
  mv a0, t5
  j .F.patternBasedCompression.epilogue                                 # ir inst 54 fin
.F.patternBasedCompression.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s9, 16(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.frequencyBasedEncoding
.F.frequencyBasedEncoding:
# spill func args num: 0,             range:     1040(sp) -     1040(sp)
# local var size: 1024,               range:        8(sp) -     1032(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1040
  sd s11, 0(sp)
.F.frequencyBasedEncoding._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.frequencyBasedEncoding._1.array.cond.0                           # ir inst 3 fin
.F.frequencyBasedEncoding._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.frequencyBasedEncoding._2.array.body.0
  j .F.frequencyBasedEncoding._3.array.exit.0                           # ir inst 6 fin
.F.frequencyBasedEncoding._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.frequencyBasedEncoding._1.array.cond.0                           # ir inst 10 fin
.F.frequencyBasedEncoding._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.frequencyBasedEncoding._4.while.cond.0                           # ir inst 11 fin
.F.frequencyBasedEncoding._4.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 13 fin
  bnez t5, .F.frequencyBasedEncoding._5.while.body.0
  j .F.frequencyBasedEncoding._12.while.exit.0                          # ir inst 14 fin
.F.frequencyBasedEncoding._5.while.body.0:
  mv t5, t6                                                             # ir inst 15 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 16 fin
  lw t5, 0(t4)                                                          # ir inst 17 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 18 fin
  bnez t4, .F.frequencyBasedEncoding._6.lazy.then.0
  j .F.frequencyBasedEncoding._7.lazy.else.0                            # ir inst 19 fin
.F.frequencyBasedEncoding._6.lazy.then.0:
  mv t5, t6                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 21 fin
  lw t5, 0(t4)                                                          # ir inst 22 fin
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 23 fin
# Phi connections
  mv t5, t4
  j .F.frequencyBasedEncoding._8.lazy.exit.0                            # ir inst 24 fin
.F.frequencyBasedEncoding._7.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.frequencyBasedEncoding._8.lazy.exit.0                            # ir inst 25 fin
.F.frequencyBasedEncoding._8.lazy.exit.0:
  bnez t5, .F.frequencyBasedEncoding._9.if.then.0
  j .F.frequencyBasedEncoding._10.if.else.0                             # ir inst 27 fin
.F.frequencyBasedEncoding._9.if.then.0:
  mv t5, t6                                                             # ir inst 28 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 29 fin
  lw t5, 0(t4)                                                          # ir inst 30 fin
  mv t4, t5                                                             # ir inst 31 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 32 fin
  mv t4, t6                                                             # ir inst 33 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 34 fin
  lw t4, 0(t3)                                                          # ir inst 35 fin
  mv t3, t4                                                             # ir inst 36 fin
  slli t2, t3, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 37 fin
  lw t3, 0(t4)                                                          # ir inst 38 fin
  addi t4, t3, 1                                                        # ir inst 39 fin
  sw t4, 0(t5)                                                          # ir inst 40 fin
  j .F.frequencyBasedEncoding._11.if.exit.0                             # ir inst 41 fin
.F.frequencyBasedEncoding._10.if.else.0:
  j .F.frequencyBasedEncoding._11.if.exit.0                             # ir inst 42 fin
.F.frequencyBasedEncoding._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 43 fin
# Phi connections
  mv t6, t5
  j .F.frequencyBasedEncoding._4.while.cond.0                           # ir inst 44 fin
.F.frequencyBasedEncoding._12.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.frequencyBasedEncoding._13.while.cond.1                          # ir inst 45 fin
.F.frequencyBasedEncoding._13.while.cond.1:
  li t2, 256
  slt t4, t6, t2                                                        # ir inst 48 fin
  bnez t4, .F.frequencyBasedEncoding._14.while.body.1
  j .F.frequencyBasedEncoding._27.while.exit.1                          # ir inst 49 fin
.F.frequencyBasedEncoding._14.while.body.1:
  mv t4, t6                                                             # ir inst 50 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 51 fin
  lw t4, 0(t3)                                                          # ir inst 52 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 53 fin
  bnez t3, .F.frequencyBasedEncoding._15.if.then.1
  j .F.frequencyBasedEncoding._25.if.else.1                             # ir inst 54 fin
.F.frequencyBasedEncoding._15.if.then.1:
  mv t4, t6                                                             # ir inst 55 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 56 fin
  lw t4, 0(t3)                                                          # ir inst 57 fin
  li t2, 2
  div t3, a1, t2                                                        # ir inst 58 fin
  slt s11, t3, t4                                                       # ir inst 59 fin
  bnez s11, .F.frequencyBasedEncoding._16.if.then.2
  j .F.frequencyBasedEncoding._17.if.else.2                             # ir inst 60 fin
.F.frequencyBasedEncoding._16.if.then.2:
# Phi connections
  li t4, 1
  j .F.frequencyBasedEncoding._24.if.exit.2                             # ir inst 61 fin
.F.frequencyBasedEncoding._17.if.else.2:
  mv t4, t6                                                             # ir inst 62 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 63 fin
  lw t4, 0(t3)                                                          # ir inst 64 fin
  li t2, 8
  div t3, a1, t2                                                        # ir inst 65 fin
  slt s11, t3, t4                                                       # ir inst 66 fin
  bnez s11, .F.frequencyBasedEncoding._18.if.then.3
  j .F.frequencyBasedEncoding._19.if.else.3                             # ir inst 67 fin
.F.frequencyBasedEncoding._18.if.then.3:
# Phi connections
  li t4, 3
  j .F.frequencyBasedEncoding._23.if.exit.3                             # ir inst 68 fin
.F.frequencyBasedEncoding._19.if.else.3:
  mv t4, t6                                                             # ir inst 69 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 70 fin
  lw t4, 0(t3)                                                          # ir inst 71 fin
  li t2, 32
  div t3, a1, t2                                                        # ir inst 72 fin
  slt s11, t3, t4                                                       # ir inst 73 fin
  bnez s11, .F.frequencyBasedEncoding._20.if.then.4
  j .F.frequencyBasedEncoding._21.if.else.4                             # ir inst 74 fin
.F.frequencyBasedEncoding._20.if.then.4:
# Phi connections
  li t4, 5
  j .F.frequencyBasedEncoding._22.if.exit.4                             # ir inst 75 fin
.F.frequencyBasedEncoding._21.if.else.4:
# Phi connections
  li t4, 8
  j .F.frequencyBasedEncoding._22.if.exit.4                             # ir inst 76 fin
.F.frequencyBasedEncoding._22.if.exit.4:
# Phi connections
  j .F.frequencyBasedEncoding._23.if.exit.3                             # ir inst 78 fin
.F.frequencyBasedEncoding._23.if.exit.3:
# Phi connections
  j .F.frequencyBasedEncoding._24.if.exit.2                             # ir inst 80 fin
.F.frequencyBasedEncoding._24.if.exit.2:
  mv t3, t6                                                             # ir inst 82 fin
  slli t2, t3, 2
  addi t1, sp, 8
  add s11, t1, t2                                                       # ir inst 83 fin
  lw t3, 0(s11)                                                         # ir inst 84 fin
  mul s11, t3, t4                                                       # ir inst 85 fin
  add t4, t5, s11                                                       # ir inst 86 fin
# Phi connections
  j .F.frequencyBasedEncoding._26.if.exit.1                             # ir inst 87 fin
.F.frequencyBasedEncoding._25.if.else.1:
# Phi connections
  mv t4, t5
  j .F.frequencyBasedEncoding._26.if.exit.1                             # ir inst 88 fin
.F.frequencyBasedEncoding._26.if.exit.1:
  addi t3, t6, 1                                                        # ir inst 90 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.frequencyBasedEncoding._13.while.cond.1                          # ir inst 91 fin
.F.frequencyBasedEncoding._27.while.exit.1:
  li t2, 8
  div t6, t5, t2                                                        # ir inst 92 fin
  mv a0, t6
  j .F.frequencyBasedEncoding.epilogue                                  # ir inst 93 fin
.F.frequencyBasedEncoding.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 1040
  ret

.globl .F.testAdvancedStringAlgorithms
.F.testAdvancedStringAlgorithms:
# spill func args num: 0,             range:     6416(sp) -     6416(sp)
# local var size: 6400,               range:       16(sp) -     6416(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -6416
  add sp, sp, t0
  sd ra, 8(sp)
.F.testAdvancedStringAlgorithms._0.entry.0:
# Start call preparation
  li a0, 1609
  call printlnInt
# ir inst 1 fin
  addi t1, sp, 16
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.testAdvancedStringAlgorithms._1.array.cond.0                     # ir inst 4 fin
.F.testAdvancedStringAlgorithms._1.array.cond.0:
  li t2, 800
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.testAdvancedStringAlgorithms._2.array.body.0
  j .F.testAdvancedStringAlgorithms._3.array.exit.0                     # ir inst 7 fin
.F.testAdvancedStringAlgorithms._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.testAdvancedStringAlgorithms._1.array.cond.0                     # ir inst 11 fin
.F.testAdvancedStringAlgorithms._3.array.exit.0:
  li t1, 3216
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.testAdvancedStringAlgorithms._4.array.cond.1                     # ir inst 14 fin
.F.testAdvancedStringAlgorithms._4.array.cond.1:
  li t2, 800
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.testAdvancedStringAlgorithms._5.array.body.1
  j .F.testAdvancedStringAlgorithms._6.array.exit.1                     # ir inst 17 fin
.F.testAdvancedStringAlgorithms._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.testAdvancedStringAlgorithms._4.array.cond.1                     # ir inst 21 fin
.F.testAdvancedStringAlgorithms._6.array.exit.1:
# Start call preparation
  li t1, 3216
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.initializeAdvancedTestStrings
# ir inst 22 fin
# Start call preparation
  li a3, 200
  li a2, 200
  li t1, 3216
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.longestCommonSubsequence
  mv t6, a0
# ir inst 23 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 24 fin
# Start call preparation
  li a3, 100
  li a2, 100
  li t1, 3216
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.calculateEditDistance
  mv t6, a0
# ir inst 25 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 26 fin
# Start call preparation
  li a1, 400
  addi t1, sp, 16
  mv a0, t1
  call .F.findLongestPalindrome
  mv t6, a0
# ir inst 27 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 28 fin
# Start call preparation
  li a3, 200
  li a2, 200
  li t1, 3216
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 16
  mv a0, t1
  call .F.detectStringRotations
  mv t6, a0
# ir inst 29 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 30 fin
# Start call preparation
  li a0, 1610
  call printlnInt
# ir inst 31 fin
  j .F.testAdvancedStringAlgorithms.epilogue                            # ir inst 32 fin
.F.testAdvancedStringAlgorithms.epilogue:
  ld ra, 8(sp)
  li t0, 6416
  add sp, sp, t0
  ret

.globl .F.initializeAdvancedTestStrings
.F.initializeAdvancedTestStrings:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.initializeAdvancedTestStrings._0.entry.0:
# Phi connections
  li t6, 0
  j .F.initializeAdvancedTestStrings._1.while.cond.0                    # ir inst 1 fin
.F.initializeAdvancedTestStrings._1.while.cond.0:
  li t2, 400
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.initializeAdvancedTestStrings._2.while.body.0
  j .F.initializeAdvancedTestStrings._3.while.exit.0                    # ir inst 4 fin
.F.initializeAdvancedTestStrings._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  li t2, 26
  rem t5, t6, t2                                                        # ir inst 7 fin
  addi t3, t5, 65                                                       # ir inst 8 fin
  sw t3, 0(t4)                                                          # ir inst 9 fin
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  addi t5, t6, 3                                                        # ir inst 12 fin
  li t2, 26
  rem t3, t5, t2                                                        # ir inst 13 fin
  addi t5, t3, 65                                                       # ir inst 14 fin
  sw t5, 0(t4)                                                          # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.initializeAdvancedTestStrings._1.while.cond.0                    # ir inst 17 fin
.F.initializeAdvancedTestStrings._3.while.exit.0:
  addi t6, a0, 400                                                      # ir inst 18 fin
  li t1, 88
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t6, a0, 404                                                      # ir inst 20 fin
  li t1, 89
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t6, a0, 408                                                      # ir inst 22 fin
  li t1, 90
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t6, a1, 600                                                      # ir inst 24 fin
  li t1, 88
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t6, a1, 604                                                      # ir inst 26 fin
  li t1, 89
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t6, a1, 608                                                      # ir inst 28 fin
  li t1, 90
  sw t1, 0(t6)                                                          # ir inst 29 fin
  j .F.initializeAdvancedTestStrings.epilogue                           # ir inst 30 fin
.F.initializeAdvancedTestStrings.epilogue:
  ret

.globl .F.longestCommonSubsequence
.F.longestCommonSubsequence:
# spill func args num: 0,             range:     1616(sp) -     1616(sp)
# local var size: 1608,               range:        8(sp) -     1616(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -1616
  sd s11, 0(sp)
.F.longestCommonSubsequence._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._1.array.cond.0                         # ir inst 3 fin
.F.longestCommonSubsequence._1.array.cond.0:
  li t2, 201
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.longestCommonSubsequence._2.array.body.0
  j .F.longestCommonSubsequence._3.array.exit.0                         # ir inst 6 fin
.F.longestCommonSubsequence._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._1.array.cond.0                         # ir inst 10 fin
.F.longestCommonSubsequence._3.array.exit.0:
  addi t1, sp, 812
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._4.array.cond.1                         # ir inst 13 fin
.F.longestCommonSubsequence._4.array.cond.1:
  li t2, 201
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.longestCommonSubsequence._5.array.body.1
  j .F.longestCommonSubsequence._6.array.exit.1                         # ir inst 16 fin
.F.longestCommonSubsequence._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._4.array.cond.1                         # ir inst 20 fin
.F.longestCommonSubsequence._6.array.exit.1:
# Phi connections
  li t6, 1
  j .F.longestCommonSubsequence._7.while.cond.0                         # ir inst 21 fin
.F.longestCommonSubsequence._7.while.cond.0:
  slt t0, a2, t6
  xori t5, t0, 1                                                        # ir inst 23 fin
  bnez t5, .F.longestCommonSubsequence._8.lazy.then.0
  j .F.longestCommonSubsequence._9.lazy.else.0                          # ir inst 24 fin
.F.longestCommonSubsequence._8.lazy.then.0:
  li t2, 200
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 25 fin
# Phi connections
  j .F.longestCommonSubsequence._10.lazy.exit.0                         # ir inst 26 fin
.F.longestCommonSubsequence._9.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._10.lazy.exit.0                         # ir inst 27 fin
.F.longestCommonSubsequence._10.lazy.exit.0:
  bnez t5, .F.longestCommonSubsequence._11.while.body.0
  j .F.longestCommonSubsequence._30.while.exit.0                        # ir inst 29 fin
.F.longestCommonSubsequence._11.while.body.0:
# Phi connections
  li t5, 1
  j .F.longestCommonSubsequence._12.while.cond.1                        # ir inst 30 fin
.F.longestCommonSubsequence._12.while.cond.1:
  slt t0, a3, t5
  xori t4, t0, 1                                                        # ir inst 32 fin
  bnez t4, .F.longestCommonSubsequence._13.lazy.then.1
  j .F.longestCommonSubsequence._14.lazy.else.1                         # ir inst 33 fin
.F.longestCommonSubsequence._13.lazy.then.1:
  li t2, 200
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 34 fin
# Phi connections
  j .F.longestCommonSubsequence._15.lazy.exit.1                         # ir inst 35 fin
.F.longestCommonSubsequence._14.lazy.else.1:
# Phi connections
  li t4, 0
  j .F.longestCommonSubsequence._15.lazy.exit.1                         # ir inst 36 fin
.F.longestCommonSubsequence._15.lazy.exit.1:
  bnez t4, .F.longestCommonSubsequence._16.while.body.1
  j .F.longestCommonSubsequence._23.while.exit.1                        # ir inst 38 fin
.F.longestCommonSubsequence._16.while.body.1:
  mv t4, t6                                                             # ir inst 39 fin
  addi t3, t4, -1                                                       # ir inst 40 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 41 fin
  lw t3, 0(t4)                                                          # ir inst 42 fin
  mv t4, t5                                                             # ir inst 43 fin
  addi s11, t4, -1                                                      # ir inst 44 fin
  slli t2, s11, 2
  add t4, a1, t2                                                        # ir inst 45 fin
  lw s11, 0(t4)                                                         # ir inst 46 fin
  xor t0, t3, s11
  sltiu t4, t0, 1                                                       # ir inst 47 fin
  bnez t4, .F.longestCommonSubsequence._17.if.then.0
  j .F.longestCommonSubsequence._18.if.else.0                           # ir inst 48 fin
.F.longestCommonSubsequence._17.if.then.0:
  mv t4, t5                                                             # ir inst 49 fin
  slli t2, t4, 2
  addi t1, sp, 812
  add t3, t1, t2                                                        # ir inst 50 fin
  mv t4, t5                                                             # ir inst 51 fin
  addi s11, t4, -1                                                      # ir inst 52 fin
  slli t2, s11, 2
  addi t1, sp, 8
  add t4, t1, t2                                                        # ir inst 53 fin
  lw s11, 0(t4)                                                         # ir inst 54 fin
  addi t4, s11, 1                                                       # ir inst 55 fin
  sw t4, 0(t3)                                                          # ir inst 56 fin
  j .F.longestCommonSubsequence._22.if.exit.0                           # ir inst 57 fin
.F.longestCommonSubsequence._18.if.else.0:
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 59 fin
  lw t4, 0(t3)                                                          # ir inst 60 fin
  mv t3, t5                                                             # ir inst 61 fin
  addi s11, t3, -1                                                      # ir inst 62 fin
  slli t2, s11, 2
  addi t1, sp, 812
  add t3, t1, t2                                                        # ir inst 63 fin
  lw s11, 0(t3)                                                         # ir inst 64 fin
  slt t3, s11, t4                                                       # ir inst 65 fin
  bnez t3, .F.longestCommonSubsequence._19.if.then.1
  j .F.longestCommonSubsequence._20.if.else.1                           # ir inst 66 fin
.F.longestCommonSubsequence._19.if.then.1:
  mv t4, t5                                                             # ir inst 67 fin
  slli t2, t4, 2
  addi t1, sp, 812
  add t3, t1, t2                                                        # ir inst 68 fin
  mv t4, t5                                                             # ir inst 69 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add s11, t1, t2                                                       # ir inst 70 fin
  lw t4, 0(s11)                                                         # ir inst 71 fin
  sw t4, 0(t3)                                                          # ir inst 72 fin
  j .F.longestCommonSubsequence._21.if.exit.1                           # ir inst 73 fin
.F.longestCommonSubsequence._20.if.else.1:
  mv t4, t5                                                             # ir inst 74 fin
  slli t2, t4, 2
  addi t1, sp, 812
  add t3, t1, t2                                                        # ir inst 75 fin
  mv t4, t5                                                             # ir inst 76 fin
  addi s11, t4, -1                                                      # ir inst 77 fin
  slli t2, s11, 2
  addi t1, sp, 812
  add t4, t1, t2                                                        # ir inst 78 fin
  lw s11, 0(t4)                                                         # ir inst 79 fin
  sw s11, 0(t3)                                                         # ir inst 80 fin
  j .F.longestCommonSubsequence._21.if.exit.1                           # ir inst 81 fin
.F.longestCommonSubsequence._21.if.exit.1:
  j .F.longestCommonSubsequence._22.if.exit.0                           # ir inst 82 fin
.F.longestCommonSubsequence._22.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 83 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._12.while.cond.1                        # ir inst 84 fin
.F.longestCommonSubsequence._23.while.exit.1:
# Phi connections
  li t5, 0
  j .F.longestCommonSubsequence._24.while.cond.2                        # ir inst 85 fin
.F.longestCommonSubsequence._24.while.cond.2:
  slt t0, a3, t5
  xori t4, t0, 1                                                        # ir inst 87 fin
  bnez t4, .F.longestCommonSubsequence._25.lazy.then.2
  j .F.longestCommonSubsequence._26.lazy.else.2                         # ir inst 88 fin
.F.longestCommonSubsequence._25.lazy.then.2:
  li t2, 200
  slt t0, t2, t5
  xori t4, t0, 1                                                        # ir inst 89 fin
# Phi connections
  j .F.longestCommonSubsequence._27.lazy.exit.2                         # ir inst 90 fin
.F.longestCommonSubsequence._26.lazy.else.2:
# Phi connections
  li t4, 0
  j .F.longestCommonSubsequence._27.lazy.exit.2                         # ir inst 91 fin
.F.longestCommonSubsequence._27.lazy.exit.2:
  bnez t4, .F.longestCommonSubsequence._28.while.body.2
  j .F.longestCommonSubsequence._29.while.exit.2                        # ir inst 93 fin
.F.longestCommonSubsequence._28.while.body.2:
  mv t4, t5                                                             # ir inst 94 fin
  slli t2, t4, 2
  addi t1, sp, 8
  add t3, t1, t2                                                        # ir inst 95 fin
  mv t4, t5                                                             # ir inst 96 fin
  slli t2, t4, 2
  addi t1, sp, 812
  add s11, t1, t2                                                       # ir inst 97 fin
  lw t4, 0(s11)                                                         # ir inst 98 fin
  sw t4, 0(t3)                                                          # ir inst 99 fin
  mv t4, t5                                                             # ir inst 100 fin
  slli t2, t4, 2
  addi t1, sp, 812
  add t3, t1, t2                                                        # ir inst 101 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 102 fin
  addi t4, t5, 1                                                        # ir inst 103 fin
# Phi connections
  mv t5, t4
  j .F.longestCommonSubsequence._24.while.cond.2                        # ir inst 104 fin
.F.longestCommonSubsequence._29.while.exit.2:
  addi t5, t6, 1                                                        # ir inst 105 fin
# Phi connections
  mv t6, t5
  j .F.longestCommonSubsequence._7.while.cond.0                         # ir inst 106 fin
.F.longestCommonSubsequence._30.while.exit.0:
  li t2, 200
  slt t0, t2, a3
  xori t6, t0, 1                                                        # ir inst 107 fin
  bnez t6, .F.longestCommonSubsequence._31.if.then.2
  j .F.longestCommonSubsequence._32.if.else.2                           # ir inst 108 fin
.F.longestCommonSubsequence._31.if.then.2:
  mv t6, a3                                                             # ir inst 109 fin
  slli t2, t6, 2
  addi t1, sp, 8
  add t5, t1, t2                                                        # ir inst 110 fin
  lw t6, 0(t5)                                                          # ir inst 111 fin
# Phi connections
  j .F.longestCommonSubsequence._33.if.exit.2                           # ir inst 112 fin
.F.longestCommonSubsequence._32.if.else.2:
  addi t1, sp, 8
  addi t6, t1, 800                                                      # ir inst 113 fin
  lw t5, 0(t6)                                                          # ir inst 114 fin
# Phi connections
  mv t6, t5
  j .F.longestCommonSubsequence._33.if.exit.2                           # ir inst 115 fin
.F.longestCommonSubsequence._33.if.exit.2:
  mv a0, t6
  j .F.longestCommonSubsequence.epilogue                                # ir inst 117 fin
.F.longestCommonSubsequence.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 1616
  ret

.globl .F.calculateEditDistance
.F.calculateEditDistance:
# spill func args num: 0,             range:      848(sp) -      848(sp)
# local var size: 808,                range:       40(sp) -      848(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -848
  sd s7, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s9, 24(sp)
  sd s11, 32(sp)
.F.calculateEditDistance._0.entry.0:
  li t2, 100
  slt t6, t2, a2                                                        # ir inst 1 fin
  bnez t6, .F.calculateEditDistance._1.if.then.0
  j .F.calculateEditDistance._2.if.else.0                               # ir inst 2 fin
.F.calculateEditDistance._1.if.then.0:
# Phi connections
  li t6, 100
  j .F.calculateEditDistance._3.if.exit.0                               # ir inst 3 fin
.F.calculateEditDistance._2.if.else.0:
# Phi connections
  mv t6, a2
  j .F.calculateEditDistance._3.if.exit.0                               # ir inst 4 fin
.F.calculateEditDistance._3.if.exit.0:
  li t2, 100
  slt t5, t2, a3                                                        # ir inst 6 fin
  bnez t5, .F.calculateEditDistance._4.if.then.1
  j .F.calculateEditDistance._5.if.else.1                               # ir inst 7 fin
.F.calculateEditDistance._4.if.then.1:
# Phi connections
  li t5, 100
  j .F.calculateEditDistance._6.if.exit.1                               # ir inst 8 fin
.F.calculateEditDistance._5.if.else.1:
# Phi connections
  mv t5, a3
  j .F.calculateEditDistance._6.if.exit.1                               # ir inst 9 fin
.F.calculateEditDistance._6.if.exit.1:
  addi t1, sp, 40
  addi t4, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t3, 0
  j .F.calculateEditDistance._7.array.cond.0                            # ir inst 13 fin
.F.calculateEditDistance._7.array.cond.0:
  li t2, 101
  slt s11, t3, t2                                                       # ir inst 15 fin
  bnez s11, .F.calculateEditDistance._8.array.body.0
  j .F.calculateEditDistance._9.array.exit.0                            # ir inst 16 fin
.F.calculateEditDistance._8.array.body.0:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 17 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 18 fin
  addi s11, t3, 1                                                       # ir inst 19 fin
# Phi connections
  mv t3, s11
  j .F.calculateEditDistance._7.array.cond.0                            # ir inst 20 fin
.F.calculateEditDistance._9.array.exit.0:
  addi t1, sp, 444
  addi t4, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t3, 0
  j .F.calculateEditDistance._10.array.cond.1                           # ir inst 23 fin
.F.calculateEditDistance._10.array.cond.1:
  li t2, 101
  slt s11, t3, t2                                                       # ir inst 25 fin
  bnez s11, .F.calculateEditDistance._11.array.body.1
  j .F.calculateEditDistance._12.array.exit.1                           # ir inst 26 fin
.F.calculateEditDistance._11.array.body.1:
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 27 fin
  li t1, 0
  sw t1, 0(s11)                                                         # ir inst 28 fin
  addi s11, t3, 1                                                       # ir inst 29 fin
# Phi connections
  mv t3, s11
  j .F.calculateEditDistance._10.array.cond.1                           # ir inst 30 fin
.F.calculateEditDistance._12.array.exit.1:
# Phi connections
  li t4, 0
  j .F.calculateEditDistance._13.while.cond.0                           # ir inst 31 fin
.F.calculateEditDistance._13.while.cond.0:
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 33 fin
  bnez t3, .F.calculateEditDistance._14.while.body.0
  j .F.calculateEditDistance._15.while.exit.0                           # ir inst 34 fin
.F.calculateEditDistance._14.while.body.0:
  mv t3, t4                                                             # ir inst 35 fin
  slli t2, t3, 2
  addi t1, sp, 40
  add s11, t1, t2                                                       # ir inst 36 fin
  sw t4, 0(s11)                                                         # ir inst 37 fin
  addi t3, t4, 1                                                        # ir inst 38 fin
# Phi connections
  mv t4, t3
  j .F.calculateEditDistance._13.while.cond.0                           # ir inst 39 fin
.F.calculateEditDistance._15.while.exit.0:
# Phi connections
  li t4, 1
  j .F.calculateEditDistance._16.while.cond.1                           # ir inst 40 fin
.F.calculateEditDistance._16.while.cond.1:
  slt t0, t6, t4
  xori t3, t0, 1                                                        # ir inst 42 fin
  bnez t3, .F.calculateEditDistance._17.while.body.1
  j .F.calculateEditDistance._33.while.exit.1                           # ir inst 43 fin
.F.calculateEditDistance._17.while.body.1:
  addi t1, sp, 444
  addi t3, t1, 0                                                        # ir inst 44 fin
  sw t4, 0(t3)                                                          # ir inst 45 fin
# Phi connections
  li t3, 1
  j .F.calculateEditDistance._18.while.cond.2                           # ir inst 46 fin
.F.calculateEditDistance._18.while.cond.2:
  slt t0, t5, t3
  xori s11, t0, 1                                                       # ir inst 48 fin
  bnez s11, .F.calculateEditDistance._19.while.body.2
  j .F.calculateEditDistance._29.while.exit.2                           # ir inst 49 fin
.F.calculateEditDistance._19.while.body.2:
  mv s11, t4                                                            # ir inst 50 fin
  addi s10, s11, -1                                                     # ir inst 51 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 52 fin
  lw s10, 0(s11)                                                        # ir inst 53 fin
  mv s11, t3                                                            # ir inst 54 fin
  addi s9, s11, -1                                                      # ir inst 55 fin
  slli t2, s9, 2
  add s11, a1, t2                                                       # ir inst 56 fin
  lw s9, 0(s11)                                                         # ir inst 57 fin
  xor t0, s10, s9
  sltiu s11, t0, 1                                                      # ir inst 58 fin
  bnez s11, .F.calculateEditDistance._20.if.then.2
  j .F.calculateEditDistance._21.if.else.2                              # ir inst 59 fin
.F.calculateEditDistance._20.if.then.2:
# Phi connections
  li s11, 0
  j .F.calculateEditDistance._22.if.exit.2                              # ir inst 60 fin
.F.calculateEditDistance._21.if.else.2:
# Phi connections
  li s11, 1
  j .F.calculateEditDistance._22.if.exit.2                              # ir inst 61 fin
.F.calculateEditDistance._22.if.exit.2:
  mv s10, t3                                                            # ir inst 63 fin
  slli t2, s10, 2
  addi t1, sp, 40
  add s9, t1, t2                                                        # ir inst 64 fin
  lw s10, 0(s9)                                                         # ir inst 65 fin
  addi s9, s10, 1                                                       # ir inst 66 fin
  mv s10, t3                                                            # ir inst 67 fin
  addi s8, s10, -1                                                      # ir inst 68 fin
  slli t2, s8, 2
  addi t1, sp, 444
  add s10, t1, t2                                                       # ir inst 69 fin
  lw s8, 0(s10)                                                         # ir inst 70 fin
  addi s10, s8, 1                                                       # ir inst 71 fin
  mv s8, t3                                                             # ir inst 72 fin
  addi s7, s8, -1                                                       # ir inst 73 fin
  slli t2, s7, 2
  addi t1, sp, 40
  add s8, t1, t2                                                        # ir inst 74 fin
  lw s7, 0(s8)                                                          # ir inst 75 fin
  add s8, s7, s11                                                       # ir inst 76 fin
  slt s11, s9, s10                                                      # ir inst 77 fin
  bnez s11, .F.calculateEditDistance._23.if.then.3
  j .F.calculateEditDistance._24.if.else.3                              # ir inst 78 fin
.F.calculateEditDistance._23.if.then.3:
# Phi connections
  mv s11, s9
  j .F.calculateEditDistance._25.if.exit.3                              # ir inst 79 fin
.F.calculateEditDistance._24.if.else.3:
# Phi connections
  mv s11, s10
  j .F.calculateEditDistance._25.if.exit.3                              # ir inst 80 fin
.F.calculateEditDistance._25.if.exit.3:
  slt s10, s8, s11                                                      # ir inst 82 fin
  bnez s10, .F.calculateEditDistance._26.if.then.4
  j .F.calculateEditDistance._27.if.else.4                              # ir inst 83 fin
.F.calculateEditDistance._26.if.then.4:
  mv s10, t3                                                            # ir inst 84 fin
  slli t2, s10, 2
  addi t1, sp, 444
  add s9, t1, t2                                                        # ir inst 85 fin
  sw s8, 0(s9)                                                          # ir inst 86 fin
  j .F.calculateEditDistance._28.if.exit.4                              # ir inst 87 fin
.F.calculateEditDistance._27.if.else.4:
  mv s10, t3                                                            # ir inst 88 fin
  slli t2, s10, 2
  addi t1, sp, 444
  add s9, t1, t2                                                        # ir inst 89 fin
  sw s11, 0(s9)                                                         # ir inst 90 fin
  j .F.calculateEditDistance._28.if.exit.4                              # ir inst 91 fin
.F.calculateEditDistance._28.if.exit.4:
  addi s11, t3, 1                                                       # ir inst 92 fin
# Phi connections
  mv t3, s11
  j .F.calculateEditDistance._18.while.cond.2                           # ir inst 93 fin
.F.calculateEditDistance._29.while.exit.2:
# Phi connections
  li t3, 0
  j .F.calculateEditDistance._30.while.cond.3                           # ir inst 94 fin
.F.calculateEditDistance._30.while.cond.3:
  slt t0, t5, t3
  xori s11, t0, 1                                                       # ir inst 96 fin
  bnez s11, .F.calculateEditDistance._31.while.body.3
  j .F.calculateEditDistance._32.while.exit.3                           # ir inst 97 fin
.F.calculateEditDistance._31.while.body.3:
  mv s11, t3                                                            # ir inst 98 fin
  slli t2, s11, 2
  addi t1, sp, 40
  add s10, t1, t2                                                       # ir inst 99 fin
  mv s11, t3                                                            # ir inst 100 fin
  slli t2, s11, 2
  addi t1, sp, 444
  add s9, t1, t2                                                        # ir inst 101 fin
  lw s11, 0(s9)                                                         # ir inst 102 fin
  sw s11, 0(s10)                                                        # ir inst 103 fin
  addi s11, t3, 1                                                       # ir inst 104 fin
# Phi connections
  mv t3, s11
  j .F.calculateEditDistance._30.while.cond.3                           # ir inst 105 fin
.F.calculateEditDistance._32.while.exit.3:
  addi t3, t4, 1                                                        # ir inst 106 fin
# Phi connections
  mv t4, t3
  j .F.calculateEditDistance._16.while.cond.1                           # ir inst 107 fin
.F.calculateEditDistance._33.while.exit.1:
  mv t6, t5                                                             # ir inst 108 fin
  slli t2, t6, 2
  addi t1, sp, 40
  add t5, t1, t2                                                        # ir inst 109 fin
  lw t6, 0(t5)                                                          # ir inst 110 fin
  mv a0, t6
  j .F.calculateEditDistance.epilogue                                   # ir inst 111 fin
.F.calculateEditDistance.epilogue:
  ld s7, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s9, 24(sp)
  ld s11, 32(sp)
  addi sp, sp, 848
  ret

.globl .F.findLongestPalindrome
.F.findLongestPalindrome:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 0,                range:       32(sp) -       32(sp)
# callee save reg num: 4 / 12,        range:        0(sp) -       32(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd s11, 0(sp)
  sd s8, 8(sp)
  sd s10, 16(sp)
  sd s9, 24(sp)
.F.findLongestPalindrome._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.findLongestPalindrome._1.while.cond.0                            # ir inst 1 fin
.F.findLongestPalindrome._1.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 4 fin
  bnez t4, .F.findLongestPalindrome._2.while.body.0
  j .F.findLongestPalindrome._15.while.exit.0                           # ir inst 5 fin
.F.findLongestPalindrome._2.while.body.0:
# Phi connections
  mv s11, t6
  mv t3, t5
  mv t4, t5
  j .F.findLongestPalindrome._3.while.cond.1                            # ir inst 6 fin
.F.findLongestPalindrome._3.while.cond.1:
  li t2, 0
  slt t0, t4, t2
  xori s10, t0, 1                                                       # ir inst 10 fin
  bnez s10, .F.findLongestPalindrome._4.lazy.then.0
  j .F.findLongestPalindrome._5.lazy.else.0                             # ir inst 11 fin
.F.findLongestPalindrome._4.lazy.then.0:
  slt s10, t3, a1                                                       # ir inst 12 fin
# Phi connections
  j .F.findLongestPalindrome._6.lazy.exit.0                             # ir inst 13 fin
.F.findLongestPalindrome._5.lazy.else.0:
# Phi connections
  li s10, 0
  j .F.findLongestPalindrome._6.lazy.exit.0                             # ir inst 14 fin
.F.findLongestPalindrome._6.lazy.exit.0:
  bnez s10, .F.findLongestPalindrome._7.lazy.then.1
  j .F.findLongestPalindrome._8.lazy.else.1                             # ir inst 16 fin
.F.findLongestPalindrome._7.lazy.then.1:
  mv s10, t4                                                            # ir inst 17 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 18 fin
  lw s10, 0(s9)                                                         # ir inst 19 fin
  mv s9, t3                                                             # ir inst 20 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 21 fin
  lw s9, 0(s8)                                                          # ir inst 22 fin
  xor t0, s10, s9
  sltiu s8, t0, 1                                                       # ir inst 23 fin
# Phi connections
  mv s10, s8
  j .F.findLongestPalindrome._9.lazy.exit.1                             # ir inst 24 fin
.F.findLongestPalindrome._8.lazy.else.1:
# Phi connections
  li s10, 0
  j .F.findLongestPalindrome._9.lazy.exit.1                             # ir inst 25 fin
.F.findLongestPalindrome._9.lazy.exit.1:
  bnez s10, .F.findLongestPalindrome._10.while.body.1
  j .F.findLongestPalindrome._14.while.exit.1                           # ir inst 27 fin
.F.findLongestPalindrome._10.while.body.1:
  sub s10, t3, t4                                                       # ir inst 28 fin
  addi s9, s10, 1                                                       # ir inst 29 fin
  slt s10, s11, s9                                                      # ir inst 30 fin
  bnez s10, .F.findLongestPalindrome._11.if.then.0
  j .F.findLongestPalindrome._12.if.else.0                              # ir inst 31 fin
.F.findLongestPalindrome._11.if.then.0:
# Phi connections
  mv s10, s9
  j .F.findLongestPalindrome._13.if.exit.0                              # ir inst 32 fin
.F.findLongestPalindrome._12.if.else.0:
# Phi connections
  mv s10, s11
  j .F.findLongestPalindrome._13.if.exit.0                              # ir inst 33 fin
.F.findLongestPalindrome._13.if.exit.0:
  addi s9, t4, -1                                                       # ir inst 35 fin
  addi t4, t3, 1                                                        # ir inst 36 fin
# Phi connections
  mv s11, s10
  mv t3, t4
  mv t4, s9
  j .F.findLongestPalindrome._3.while.cond.1                            # ir inst 37 fin
.F.findLongestPalindrome._14.while.exit.1:
  addi t4, t5, 1                                                        # ir inst 38 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  j .F.findLongestPalindrome._1.while.cond.0                            # ir inst 39 fin
.F.findLongestPalindrome._15.while.exit.0:
# Phi connections
  li t5, 0
  j .F.findLongestPalindrome._16.while.cond.2                           # ir inst 40 fin
.F.findLongestPalindrome._16.while.cond.2:
  addi t4, a1, -1                                                       # ir inst 43 fin
  slt t3, t5, t4                                                        # ir inst 44 fin
  bnez t3, .F.findLongestPalindrome._17.while.body.2
  j .F.findLongestPalindrome._30.while.exit.2                           # ir inst 45 fin
.F.findLongestPalindrome._17.while.body.2:
  addi t4, t5, 1                                                        # ir inst 46 fin
# Phi connections
  mv s11, t4
  mv t3, t5
  mv t4, t6
  j .F.findLongestPalindrome._18.while.cond.3                           # ir inst 47 fin
.F.findLongestPalindrome._18.while.cond.3:
  li t2, 0
  slt t0, t3, t2
  xori s10, t0, 1                                                       # ir inst 51 fin
  bnez s10, .F.findLongestPalindrome._19.lazy.then.2
  j .F.findLongestPalindrome._20.lazy.else.2                            # ir inst 52 fin
.F.findLongestPalindrome._19.lazy.then.2:
  slt s10, s11, a1                                                      # ir inst 53 fin
# Phi connections
  j .F.findLongestPalindrome._21.lazy.exit.2                            # ir inst 54 fin
.F.findLongestPalindrome._20.lazy.else.2:
# Phi connections
  li s10, 0
  j .F.findLongestPalindrome._21.lazy.exit.2                            # ir inst 55 fin
.F.findLongestPalindrome._21.lazy.exit.2:
  bnez s10, .F.findLongestPalindrome._22.lazy.then.3
  j .F.findLongestPalindrome._23.lazy.else.3                            # ir inst 57 fin
.F.findLongestPalindrome._22.lazy.then.3:
  mv s10, t3                                                            # ir inst 58 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 59 fin
  lw s10, 0(s9)                                                         # ir inst 60 fin
  mv s9, s11                                                            # ir inst 61 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 62 fin
  lw s9, 0(s8)                                                          # ir inst 63 fin
  xor t0, s10, s9
  sltiu s8, t0, 1                                                       # ir inst 64 fin
# Phi connections
  mv s10, s8
  j .F.findLongestPalindrome._24.lazy.exit.3                            # ir inst 65 fin
.F.findLongestPalindrome._23.lazy.else.3:
# Phi connections
  li s10, 0
  j .F.findLongestPalindrome._24.lazy.exit.3                            # ir inst 66 fin
.F.findLongestPalindrome._24.lazy.exit.3:
  bnez s10, .F.findLongestPalindrome._25.while.body.3
  j .F.findLongestPalindrome._29.while.exit.3                           # ir inst 68 fin
.F.findLongestPalindrome._25.while.body.3:
  sub s10, s11, t3                                                      # ir inst 69 fin
  addi s9, s10, 1                                                       # ir inst 70 fin
  slt s10, t4, s9                                                       # ir inst 71 fin
  bnez s10, .F.findLongestPalindrome._26.if.then.1
  j .F.findLongestPalindrome._27.if.else.1                              # ir inst 72 fin
.F.findLongestPalindrome._26.if.then.1:
# Phi connections
  mv s10, s9
  j .F.findLongestPalindrome._28.if.exit.1                              # ir inst 73 fin
.F.findLongestPalindrome._27.if.else.1:
# Phi connections
  mv s10, t4
  j .F.findLongestPalindrome._28.if.exit.1                              # ir inst 74 fin
.F.findLongestPalindrome._28.if.exit.1:
  addi s9, t3, -1                                                       # ir inst 76 fin
  addi t3, s11, 1                                                       # ir inst 77 fin
# Phi connections
  mv s11, t3
  mv t3, s9
  mv t4, s10
  j .F.findLongestPalindrome._18.while.cond.3                           # ir inst 78 fin
.F.findLongestPalindrome._29.while.exit.3:
  addi t3, t5, 1                                                        # ir inst 79 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.findLongestPalindrome._16.while.cond.2                           # ir inst 80 fin
.F.findLongestPalindrome._30.while.exit.2:
  mv a0, t6
  j .F.findLongestPalindrome.epilogue                                   # ir inst 81 fin
.F.findLongestPalindrome.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s10, 16(sp)
  ld s9, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.detectStringRotations
.F.detectStringRotations:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.detectStringRotations._0.entry.0:
  xor t0, a2, a3
  sltu t6, zero, t0                                                     # ir inst 1 fin
  bnez t6, .F.detectStringRotations._1.if.then.0
  j .F.detectStringRotations._2.if.else.0                               # ir inst 2 fin
.F.detectStringRotations._1.if.then.0:
  li a0, 0
  j .F.detectStringRotations.epilogue                                   # ir inst 3 fin
.F.detectStringRotations._2.if.else.0:
  j .F.detectStringRotations._3.if.exit.0                               # ir inst 4 fin
.F.detectStringRotations._3.if.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.detectStringRotations._4.while.cond.0                            # ir inst 5 fin
.F.detectStringRotations._4.while.cond.0:
  slt t4, t6, a2                                                        # ir inst 8 fin
  bnez t4, .F.detectStringRotations._5.lazy.then.0
  j .F.detectStringRotations._6.lazy.else.0                             # ir inst 9 fin
.F.detectStringRotations._5.lazy.then.0:
  li t2, 200
  slt t4, t6, t2                                                        # ir inst 10 fin
# Phi connections
  j .F.detectStringRotations._7.lazy.exit.0                             # ir inst 11 fin
.F.detectStringRotations._6.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.detectStringRotations._7.lazy.exit.0                             # ir inst 12 fin
.F.detectStringRotations._7.lazy.exit.0:
  bnez t4, .F.detectStringRotations._8.while.body.0
  j .F.detectStringRotations._21.while.exit.0                           # ir inst 14 fin
.F.detectStringRotations._8.while.body.0:
# Phi connections
  li t4, 0
  j .F.detectStringRotations._9.while.cond.1                            # ir inst 15 fin
.F.detectStringRotations._9.while.cond.1:
  slt t3, t4, a2                                                        # ir inst 17 fin
  bnez t3, .F.detectStringRotations._10.lazy.then.1
  j .F.detectStringRotations._11.lazy.else.1                            # ir inst 18 fin
.F.detectStringRotations._10.lazy.then.1:
  li t2, 200
  slt t3, t4, t2                                                        # ir inst 19 fin
# Phi connections
  j .F.detectStringRotations._12.lazy.exit.1                            # ir inst 20 fin
.F.detectStringRotations._11.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.detectStringRotations._12.lazy.exit.1                            # ir inst 21 fin
.F.detectStringRotations._12.lazy.exit.1:
  bnez t3, .F.detectStringRotations._13.while.body.1
  j .F.detectStringRotations._22.critical_edge.0                        # ir inst 23 fin
.F.detectStringRotations._13.while.body.1:
  add t3, t4, t6                                                        # ir inst 24 fin
  rem s11, t3, a2                                                       # ir inst 25 fin
  mv t3, t4                                                             # ir inst 26 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 27 fin
  lw t3, 0(s10)                                                         # ir inst 28 fin
  mv s10, s11                                                           # ir inst 29 fin
  slli t2, s10, 2
  add s11, a1, t2                                                       # ir inst 30 fin
  lw s10, 0(s11)                                                        # ir inst 31 fin
  xor t0, t3, s10
  sltu s11, zero, t0                                                    # ir inst 32 fin
  bnez s11, .F.detectStringRotations._14.if.then.1
  j .F.detectStringRotations._15.if.else.1                              # ir inst 33 fin
.F.detectStringRotations._14.if.then.1:
# Phi connections
  li t4, 0
  j .F.detectStringRotations._17.while.exit.1                           # ir inst 34 fin
.F.detectStringRotations._15.if.else.1:
  j .F.detectStringRotations._16.if.exit.1                              # ir inst 35 fin
.F.detectStringRotations._16.if.exit.1:
  addi t3, t4, 1                                                        # ir inst 36 fin
# Phi connections
  mv t4, t3
  j .F.detectStringRotations._9.while.cond.1                            # ir inst 37 fin
.F.detectStringRotations._17.while.exit.1:
  bnez t4, .F.detectStringRotations._18.if.then.2
  j .F.detectStringRotations._19.if.else.2                              # ir inst 39 fin
.F.detectStringRotations._18.if.then.2:
  addi t4, t5, 1                                                        # ir inst 40 fin
# Phi connections
  j .F.detectStringRotations._20.if.exit.2                              # ir inst 41 fin
.F.detectStringRotations._19.if.else.2:
# Phi connections
  mv t4, t5
  j .F.detectStringRotations._20.if.exit.2                              # ir inst 42 fin
.F.detectStringRotations._20.if.exit.2:
  addi t3, t6, 1                                                        # ir inst 44 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.detectStringRotations._4.while.cond.0                            # ir inst 45 fin
.F.detectStringRotations._21.while.exit.0:
  mv a0, t5
  j .F.detectStringRotations.epilogue                                   # ir inst 46 fin
.F.detectStringRotations._22.critical_edge.0:
# Phi connections
  li t4, 1
  j .F.detectStringRotations._17.while.exit.1                           # ir inst 47 fin
.F.detectStringRotations.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret
