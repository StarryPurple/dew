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
# spill func args num: 0,             range:      320(sp) -      320(sp)
# local var size: 240,                range:       72(sp) -      312(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 4 / 12,        range:       32(sp) -       64(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -320
  sd s8, 32(sp)
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd ra, 64(sp)
main._0.entry.0:
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 60
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
# Phi connections
  li t6, 0
  j main._4.while.cond.0                                                # ir inst 11 fin
main._4.while.cond.0:
  li t2, 60
  sltu t5, t6, t2                                                       # ir inst 13 fin
  bnez t5, main._5.while.body.0
  j main._6.while.exit.0                                                # ir inst 14 fin
main._5.while.body.0:
  slli t2, t6, 2
  addi t1, sp, 72
  add t5, t1, t2                                                        # ir inst 15 fin
  mv t4, t6                                                             # ir inst 16 fin
  li t2, 8
  rem t3, t4, t2                                                        # ir inst 17 fin
  sw t3, 0(t5)                                                          # ir inst 18 fin
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j main._4.while.cond.0                                                # ir inst 20 fin
main._6.while.exit.0:
# Phi connections
  li s11, 0
  li t3, 0
  li t4, 0
  li t5, -1
  li t6, 0
  j main._7.while.cond.1                                                # ir inst 21 fin
main._7.while.cond.1:
  li t2, 60
  sltu s10, t4, t2                                                      # ir inst 27 fin
  bnez s10, main._8.while.body.1
  j main._30.while.exit.1                                               # ir inst 28 fin
main._8.while.body.1:
  slli t2, t4, 2
  addi t1, sp, 72
  add s10, t1, t2                                                       # ir inst 29 fin
  lw s9, 0(s10)                                                         # ir inst 30 fin
  mv s10, t4                                                            # ir inst 31 fin
  li t2, 10
  mul s8, s10, t2                                                       # ir inst 32 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a5, s11
  mv a4, t5
  mv a3, t6
  mv a2, s8
  mv a1, s9
  mv a0, t3
  call .F.process_event
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 33 fin
  li t2, 1
  xor t0, s10, t2
  sltiu t3, t0, 1                                                       # ir inst 34 fin
  bnez t3, main._9.if.then.0
  j main._10.if.else.0                                                  # ir inst 35 fin
main._9.if.then.0:
# Phi connections
  mv t3, s10
  li t5, -1
  li t6, 0
  j main._23.if.exit.0                                                  # ir inst 36 fin
main._10.if.else.0:
  li t2, 2
  xor t0, s10, t2
  sltiu t3, t0, 1                                                       # ir inst 37 fin
  bnez t3, main._11.if.then.1
  j main._18.if.else.1                                                  # ir inst 38 fin
main._11.if.then.1:
  li t2, 2
  xor t0, s9, t2
  sltiu t3, t0, 1                                                       # ir inst 39 fin
  bnez t3, main._12.if.then.2
  j main._13.if.else.2                                                  # ir inst 40 fin
main._12.if.then.2:
  addi t3, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv s9, t5
  j main._17.if.exit.2                                                  # ir inst 42 fin
main._13.if.else.2:
  li t2, 3
  xor t0, s9, t2
  sltiu t3, t0, 1                                                       # ir inst 43 fin
  bnez t3, main._14.if.then.3
  j main._15.if.else.3                                                  # ir inst 44 fin
main._14.if.then.3:
# Phi connections
  mv t3, s8
  j main._16.if.exit.3                                                  # ir inst 45 fin
main._15.if.else.3:
# Phi connections
  mv t3, t5
  j main._16.if.exit.3                                                  # ir inst 46 fin
main._16.if.exit.3:
# Phi connections
  mv s9, t3
  mv t3, t6
  j main._17.if.exit.2                                                  # ir inst 48 fin
main._17.if.exit.2:
# Phi connections
  mv t5, s9
  mv t6, t3
  mv t3, s10
  j main._22.if.exit.1                                                  # ir inst 51 fin
main._18.if.else.1:
  li t2, 4
  xor t0, s10, t2
  sltiu t3, t0, 1                                                       # ir inst 52 fin
  bnez t3, main._19.if.then.4
  j main._20.if.else.4                                                  # ir inst 53 fin
main._19.if.then.4:
# Phi connections
  li s11, 0
  li t3, 0
  j main._21.if.exit.4                                                  # ir inst 54 fin
main._20.if.else.4:
# Phi connections
  mv t3, s10
  j main._21.if.exit.4                                                  # ir inst 55 fin
main._21.if.exit.4:
# Phi connections
  j main._22.if.exit.1                                                  # ir inst 58 fin
main._22.if.exit.1:
# Phi connections
  j main._23.if.exit.0                                                  # ir inst 63 fin
main._23.if.exit.0:
  addi s10, t6, -5                                                      # ir inst 68 fin
  slt s9, t5, s10                                                       # ir inst 69 fin
  bnez s9, main._24.if.then.5
  j main._28.if.else.5                                                  # ir inst 70 fin
main._24.if.then.5:
  addi s10, s11, 1                                                      # ir inst 71 fin
  li t2, 3
  slt s9, t2, s10                                                       # ir inst 72 fin
  bnez s9, main._25.if.then.6
  j main._26.if.else.6                                                  # ir inst 73 fin
main._25.if.then.6:
# Phi connections
  li s9, 4
  j main._27.if.exit.6                                                  # ir inst 74 fin
main._26.if.else.6:
# Phi connections
  mv s9, t3
  j main._27.if.exit.6                                                  # ir inst 75 fin
main._27.if.exit.6:
# Phi connections
  mv s11, s10
  mv t3, s9
  j main._29.if.exit.5                                                  # ir inst 77 fin
main._28.if.else.5:
# Phi connections
  j main._29.if.exit.5                                                  # ir inst 78 fin
main._29.if.exit.5:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t3
  call printInt
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 81 fin
  addi s10, t4, 1                                                       # ir inst 82 fin
# Phi connections
  mv t4, s10
  j main._7.while.cond.1                                                # ir inst 83 fin
main._30.while.exit.1:
# Start call preparation
  li a0, 0
  call exit
# ir inst 84 fin
  j main.epilogue                                                       # ir inst 85 fin
main.epilogue:
  ld ra, 64(sp)
  ld s8, 32(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  addi sp, sp, 320
  ret

.globl .F.process_event
.F.process_event:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.process_event._0.entry.0:
  li t2, 0
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.process_event._1.if.then.0
  j .F.process_event._5.if.else.0                                       # ir inst 2 fin
.F.process_event._1.if.then.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.process_event._2.if.then.1
  j .F.process_event._3.if.else.1                                       # ir inst 4 fin
.F.process_event._2.if.then.1:
# Phi connections
  li t6, 1
  j .F.process_event._4.if.exit.1                                       # ir inst 5 fin
.F.process_event._3.if.else.1:
# Phi connections
  mv t6, a0
  j .F.process_event._4.if.exit.1                                       # ir inst 6 fin
.F.process_event._4.if.exit.1:
# Phi connections
  j .F.process_event._48.if.exit.0                                      # ir inst 8 fin
.F.process_event._5.if.else.0:
  li t2, 1
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
  bnez t6, .F.process_event._6.if.then.2
  j .F.process_event._13.if.else.2                                      # ir inst 10 fin
.F.process_event._6.if.then.2:
  li t2, 1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 11 fin
  bnez t6, .F.process_event._7.if.then.3
  j .F.process_event._8.if.else.3                                       # ir inst 12 fin
.F.process_event._7.if.then.3:
# Phi connections
  li t6, 2
  j .F.process_event._12.if.exit.3                                      # ir inst 13 fin
.F.process_event._8.if.else.3:
  li t2, 6
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 14 fin
  bnez t6, .F.process_event._9.if.then.4
  j .F.process_event._10.if.else.4                                      # ir inst 15 fin
.F.process_event._9.if.then.4:
# Phi connections
  li t6, 0
  j .F.process_event._11.if.exit.4                                      # ir inst 16 fin
.F.process_event._10.if.else.4:
# Phi connections
  mv t6, a0
  j .F.process_event._11.if.exit.4                                      # ir inst 17 fin
.F.process_event._11.if.exit.4:
# Phi connections
  j .F.process_event._12.if.exit.3                                      # ir inst 19 fin
.F.process_event._12.if.exit.3:
# Phi connections
  j .F.process_event._47.if.exit.2                                      # ir inst 21 fin
.F.process_event._13.if.else.2:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 22 fin
  bnez t6, .F.process_event._14.if.then.5
  j .F.process_event._33.if.else.5                                      # ir inst 23 fin
.F.process_event._14.if.then.5:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 24 fin
  bnez t6, .F.process_event._15.if.then.6
  j .F.process_event._19.if.else.6                                      # ir inst 25 fin
.F.process_event._15.if.then.6:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  mv a0, a2
  call .F.validate_checksum
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
# ir inst 26 fin
  bnez t6, .F.process_event._16.if.then.7
  j .F.process_event._17.if.else.7                                      # ir inst 27 fin
.F.process_event._16.if.then.7:
# Phi connections
  mv t6, a0
  j .F.process_event._18.if.exit.7                                      # ir inst 28 fin
.F.process_event._17.if.else.7:
# Phi connections
  li t6, 4
  j .F.process_event._18.if.exit.7                                      # ir inst 29 fin
.F.process_event._18.if.exit.7:
# Phi connections
  j .F.process_event._32.if.exit.6                                      # ir inst 31 fin
.F.process_event._19.if.else.6:
  li t2, 3
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 32 fin
  bnez t6, .F.process_event._20.if.then.8
  j .F.process_event._24.if.else.8                                      # ir inst 33 fin
.F.process_event._20.if.then.8:
  slt t6, a4, a2                                                        # ir inst 34 fin
  bnez t6, .F.process_event._21.if.then.9
  j .F.process_event._22.if.else.9                                      # ir inst 35 fin
.F.process_event._21.if.then.9:
  j .F.process_event._23.if.exit.9                                      # ir inst 36 fin
.F.process_event._22.if.else.9:
  j .F.process_event._23.if.exit.9                                      # ir inst 37 fin
.F.process_event._23.if.exit.9:
# Phi connections
  mv t6, a0
  j .F.process_event._31.if.exit.8                                      # ir inst 38 fin
.F.process_event._24.if.else.8:
  li t2, 4
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 39 fin
  bnez t6, .F.process_event._25.if.then.10
  j .F.process_event._26.if.else.10                                     # ir inst 40 fin
.F.process_event._25.if.then.10:
# Phi connections
  li t6, 3
  j .F.process_event._30.if.exit.10                                     # ir inst 41 fin
.F.process_event._26.if.else.10:
  li t2, 7
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 42 fin
  bnez t6, .F.process_event._27.if.then.11
  j .F.process_event._28.if.else.11                                     # ir inst 43 fin
.F.process_event._27.if.then.11:
# Phi connections
  li t6, 4
  j .F.process_event._29.if.exit.11                                     # ir inst 44 fin
.F.process_event._28.if.else.11:
# Phi connections
  mv t6, a0
  j .F.process_event._29.if.exit.11                                     # ir inst 45 fin
.F.process_event._29.if.exit.11:
# Phi connections
  j .F.process_event._30.if.exit.10                                     # ir inst 47 fin
.F.process_event._30.if.exit.10:
# Phi connections
  j .F.process_event._31.if.exit.8                                      # ir inst 49 fin
.F.process_event._31.if.exit.8:
# Phi connections
  j .F.process_event._32.if.exit.6                                      # ir inst 51 fin
.F.process_event._32.if.exit.6:
# Phi connections
  j .F.process_event._46.if.exit.5                                      # ir inst 53 fin
.F.process_event._33.if.else.5:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 54 fin
  bnez t6, .F.process_event._34.if.then.12
  j .F.process_event._41.if.else.12                                     # ir inst 55 fin
.F.process_event._34.if.then.12:
  li t2, 5
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 56 fin
  bnez t6, .F.process_event._35.if.then.13
  j .F.process_event._36.if.else.13                                     # ir inst 57 fin
.F.process_event._35.if.then.13:
# Phi connections
  li t6, 0
  j .F.process_event._40.if.exit.13                                     # ir inst 58 fin
.F.process_event._36.if.else.13:
  li t2, 6
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 59 fin
  bnez t6, .F.process_event._37.if.then.14
  j .F.process_event._38.if.else.14                                     # ir inst 60 fin
.F.process_event._37.if.then.14:
# Phi connections
  li t6, 0
  j .F.process_event._39.if.exit.14                                     # ir inst 61 fin
.F.process_event._38.if.else.14:
# Phi connections
  mv t6, a0
  j .F.process_event._39.if.exit.14                                     # ir inst 62 fin
.F.process_event._39.if.exit.14:
# Phi connections
  j .F.process_event._40.if.exit.13                                     # ir inst 64 fin
.F.process_event._40.if.exit.13:
# Phi connections
  j .F.process_event._45.if.exit.12                                     # ir inst 66 fin
.F.process_event._41.if.else.12:
  li t2, 4
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 67 fin
  bnez t6, .F.process_event._42.if.then.15
  j .F.process_event._43.if.else.15                                     # ir inst 68 fin
.F.process_event._42.if.then.15:
  j .F.process_event._44.if.exit.15                                     # ir inst 69 fin
.F.process_event._43.if.else.15:
  j .F.process_event._44.if.exit.15                                     # ir inst 70 fin
.F.process_event._44.if.exit.15:
# Phi connections
  mv t6, a0
  j .F.process_event._45.if.exit.12                                     # ir inst 71 fin
.F.process_event._45.if.exit.12:
# Phi connections
  j .F.process_event._46.if.exit.5                                      # ir inst 73 fin
.F.process_event._46.if.exit.5:
# Phi connections
  j .F.process_event._47.if.exit.2                                      # ir inst 75 fin
.F.process_event._47.if.exit.2:
# Phi connections
  j .F.process_event._48.if.exit.0                                      # ir inst 77 fin
.F.process_event._48.if.exit.0:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.complex_state_logic
  mv t5, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 79 fin
  mv a0, t5
  j .F.process_event.epilogue                                           # ir inst 80 fin
.F.process_event.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret

.globl .F.validate_checksum
.F.validate_checksum:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.validate_checksum._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 1
  j .F.validate_checksum._1.while.cond.0                                # ir inst 1 fin
.F.validate_checksum._1.while.cond.0:
  slt t0, a0, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.validate_checksum._2.while.body.0
  j .F.validate_checksum._6.while.exit.0                                # ir inst 5 fin
.F.validate_checksum._2.while.body.0:
  rem t4, a0, t6                                                        # ir inst 6 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 7 fin
  bnez t3, .F.validate_checksum._3.if.then.0
  j .F.validate_checksum._4.if.else.0                                   # ir inst 8 fin
.F.validate_checksum._3.if.then.0:
  add t4, t5, t6                                                        # ir inst 9 fin
# Phi connections
  j .F.validate_checksum._5.if.exit.0                                   # ir inst 10 fin
.F.validate_checksum._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.validate_checksum._5.if.exit.0                                   # ir inst 11 fin
.F.validate_checksum._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 13 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.validate_checksum._1.while.cond.0                                # ir inst 14 fin
.F.validate_checksum._6.while.exit.0:
  li t2, 2
  rem t6, t5, t2                                                        # ir inst 15 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 16 fin
  mv a0, t5
  j .F.validate_checksum.epilogue                                       # ir inst 17 fin
.F.validate_checksum.epilogue:
  ret

.globl .F.complex_state_logic
.F.complex_state_logic:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 2 / 12,        range:       24(sp) -       40(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 24(sp)
  sd s10, 32(sp)
  sd ra, 40(sp)
.F.complex_state_logic._0.entry.0:
  li t2, 6
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.complex_state_logic._1.if.then.0
  j .F.complex_state_logic._5.if.else.0                                 # ir inst 2 fin
.F.complex_state_logic._1.if.then.0:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.complex_state_logic._2.if.then.1
  j .F.complex_state_logic._3.if.else.1                                 # ir inst 4 fin
.F.complex_state_logic._2.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  mv a1, a2
  call .F.perform_recovery
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 5 fin
# Phi connections
  j .F.complex_state_logic._4.if.exit.1                                 # ir inst 6 fin
.F.complex_state_logic._3.if.else.1:
# Phi connections
  mv t6, a0
  j .F.complex_state_logic._4.if.exit.1                                 # ir inst 7 fin
.F.complex_state_logic._4.if.exit.1:
# Phi connections
  j .F.complex_state_logic._6.if.exit.0                                 # ir inst 9 fin
.F.complex_state_logic._5.if.else.0:
# Phi connections
  mv t6, a0
  j .F.complex_state_logic._6.if.exit.0                                 # ir inst 10 fin
.F.complex_state_logic._6.if.exit.0:
# Phi connections
  li t4, 0
  mv t5, a2
  j .F.complex_state_logic._7.while.cond.0                              # ir inst 12 fin
.F.complex_state_logic._7.while.cond.0:
  li t2, 5
  slt t3, t4, t2                                                        # ir inst 15 fin
  bnez t3, .F.complex_state_logic._8.while.body.0
  j .F.complex_state_logic._9.while.exit.0                              # ir inst 16 fin
.F.complex_state_logic._8.while.body.0:
  addi t3, t4, 2                                                        # ir inst 17 fin
  div s11, t5, t3                                                       # ir inst 18 fin
  mul t3, t4, t4                                                        # ir inst 19 fin
  add s10, s11, t3                                                      # ir inst 20 fin
  addi t3, t4, 1                                                        # ir inst 21 fin
# Phi connections
  mv t4, t3
  mv t5, s10
  j .F.complex_state_logic._7.while.cond.0                              # ir inst 22 fin
.F.complex_state_logic._9.while.exit.0:
  li t2, 10
  rem t4, t5, t2                                                        # ir inst 23 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t5, t0, 1                                                       # ir inst 24 fin
  bnez t5, .F.complex_state_logic._10.if.then.2
  j .F.complex_state_logic._14.if.else.2                                # ir inst 25 fin
.F.complex_state_logic._10.if.then.2:
  li t2, 4
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 26 fin
  bnez t5, .F.complex_state_logic._11.if.then.3
  j .F.complex_state_logic._12.if.else.3                                # ir inst 27 fin
.F.complex_state_logic._11.if.then.3:
# Phi connections
  li t5, 4
  j .F.complex_state_logic._13.if.exit.3                                # ir inst 28 fin
.F.complex_state_logic._12.if.else.3:
# Phi connections
  mv t5, t6
  j .F.complex_state_logic._13.if.exit.3                                # ir inst 29 fin
.F.complex_state_logic._13.if.exit.3:
# Phi connections
  mv t6, t5
  j .F.complex_state_logic._15.if.exit.2                                # ir inst 31 fin
.F.complex_state_logic._14.if.else.2:
# Phi connections
  j .F.complex_state_logic._15.if.exit.2                                # ir inst 32 fin
.F.complex_state_logic._15.if.exit.2:
  mv a0, t6
  j .F.complex_state_logic.epilogue                                     # ir inst 34 fin
.F.complex_state_logic.epilogue:
  ld ra, 40(sp)
  ld s11, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.perform_recovery
.F.perform_recovery:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.perform_recovery._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.perform_recovery._1.while.cond.0                                 # ir inst 1 fin
.F.perform_recovery._1.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.perform_recovery._2.while.body.0
  j .F.perform_recovery._3.while.exit.0                                 # ir inst 5 fin
.F.perform_recovery._2.while.body.0:
  addi t4, t6, 1                                                        # ir inst 6 fin
  rem t3, a1, t4                                                        # ir inst 7 fin
  add t4, t5, t3                                                        # ir inst 8 fin
  addi t3, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.perform_recovery._1.while.cond.0                                 # ir inst 10 fin
.F.perform_recovery._3.while.exit.0:
  li t2, 20
  slt t6, t2, t5                                                        # ir inst 11 fin
  bnez t6, .F.perform_recovery._4.if.then.0
  j .F.perform_recovery._5.if.else.0                                    # ir inst 12 fin
.F.perform_recovery._4.if.then.0:
  j .F.perform_recovery.epilogue                                        # ir inst 13 fin
.F.perform_recovery._5.if.else.0:
  li a0, 4
  j .F.perform_recovery.epilogue                                        # ir inst 14 fin
.F.perform_recovery._6.if.exit.0:
.F.perform_recovery.epilogue:
  ret

.globl .F.another_layer_of_protocol
.F.another_layer_of_protocol:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.another_layer_of_protocol._0.entry.0:
  li t2, 2
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.another_layer_of_protocol._1.if.then.0
  j .F.another_layer_of_protocol._5.if.else.0                           # ir inst 2 fin
.F.another_layer_of_protocol._1.if.then.0:
# Phi connections
  mv t5, a1
  li t6, 0
  j .F.another_layer_of_protocol._2.while.cond.0                        # ir inst 3 fin
.F.another_layer_of_protocol._2.while.cond.0:
  li t2, 5
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F.another_layer_of_protocol._3.while.body.0
  j .F.another_layer_of_protocol._4.while.exit.0                        # ir inst 7 fin
.F.another_layer_of_protocol._3.while.body.0:
  add t4, t5, t6                                                        # ir inst 8 fin
  addi t3, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.another_layer_of_protocol._2.while.cond.0                        # ir inst 10 fin
.F.another_layer_of_protocol._4.while.exit.0:
# Phi connections
  mv t6, t5
  j .F.another_layer_of_protocol._9.if.exit.0                           # ir inst 11 fin
.F.another_layer_of_protocol._5.if.else.0:
  li t2, 3
  xor t0, a0, t2
  sltiu t6, t0, 1                                                       # ir inst 12 fin
  bnez t6, .F.another_layer_of_protocol._6.if.then.1
  j .F.another_layer_of_protocol._7.if.else.1                           # ir inst 13 fin
.F.another_layer_of_protocol._6.if.then.1:
  addi t6, a1, -10                                                      # ir inst 14 fin
# Phi connections
  j .F.another_layer_of_protocol._8.if.exit.1                           # ir inst 15 fin
.F.another_layer_of_protocol._7.if.else.1:
# Phi connections
  mv t6, a1
  j .F.another_layer_of_protocol._8.if.exit.1                           # ir inst 16 fin
.F.another_layer_of_protocol._8.if.exit.1:
# Phi connections
  j .F.another_layer_of_protocol._9.if.exit.0                           # ir inst 18 fin
.F.another_layer_of_protocol._9.if.exit.0:
  mv a0, t6
  j .F.another_layer_of_protocol.epilogue                               # ir inst 20 fin
.F.another_layer_of_protocol.epilogue:
  ret

.globl .F.yet_another_protocol_function
.F.yet_another_protocol_function:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.yet_another_protocol_function._0.entry.0:
  add t6, a0, a1                                                        # ir inst 1 fin
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.yet_another_protocol_function._1.while.cond.0                    # ir inst 2 fin
.F.yet_another_protocol_function._1.while.cond.0:
  li t2, 3
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F.yet_another_protocol_function._2.while.body.0
  j .F.yet_another_protocol_function._3.while.exit.0                    # ir inst 6 fin
.F.yet_another_protocol_function._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  mv a0, t6
  call .F.another_layer_of_protocol
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 7 fin
  addi t3, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.yet_another_protocol_function._1.while.cond.0                    # ir inst 9 fin
.F.yet_another_protocol_function._3.while.exit.0:
  mv a0, t5
  j .F.yet_another_protocol_function.epilogue                           # ir inst 10 fin
.F.yet_another_protocol_function.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.process_complex_packet
.F.process_complex_packet:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd ra, 40(sp)
.F.process_complex_packet._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.yet_another_protocol_function
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
  mv a0, a1
  mv a1, a2
  call .F.yet_another_protocol_function
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 2 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, a2
  call .F.yet_another_protocol_function
  mv t4, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 3 fin
  sub t3, t6, t5                                                        # ir inst 4 fin
  add t6, t3, t4                                                        # ir inst 5 fin
  mv a0, t6
  j .F.process_complex_packet.epilogue                                  # ir inst 6 fin
.F.process_complex_packet.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 48
  ret
