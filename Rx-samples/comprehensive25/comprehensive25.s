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
  li a0, 25000
  call printlnInt
# ir inst 1 fin
# Start call preparation
  li a0, 7
  call .F.performBasicConsensusTest
# ir inst 2 fin
# Start call preparation
  li a1, 2
  li a0, 7
  call .F.performByzantineFaultToleranceTest
# ir inst 3 fin
# Start call preparation
  li a0, 7
  call .F.performNetworkPartitionTest
# ir inst 4 fin
# Start call preparation
  li a0, 7
  call .F.performLeaderElectionTest
# ir inst 5 fin
# Start call preparation
  li a1, 100
  li a0, 7
  call .F.performAsynchronousConsensusTest
# ir inst 6 fin
# Start call preparation
  li a0, 25999
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

.globl .F.performBasicConsensusTest
.F.performBasicConsensusTest:
# spill func args num: 0,             range:     3360(sp) -     3360(sp)
# local var size: 3312,               range:       40(sp) -     3352(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -3360
  add sp, sp, t0
  sd ra, 32(sp)
.F.performBasicConsensusTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 25001
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performBasicConsensusTest._1.array.cond.0                        # ir inst 4 fin
.F.performBasicConsensusTest._1.array.cond.0:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performBasicConsensusTest._2.array.body.0
  j .F.performBasicConsensusTest._3.array.exit.0                        # ir inst 7 fin
.F.performBasicConsensusTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performBasicConsensusTest._1.array.cond.0                        # ir inst 11 fin
.F.performBasicConsensusTest._3.array.exit.0:
  addi t1, sp, 68
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performBasicConsensusTest._4.array.cond.1                        # ir inst 14 fin
.F.performBasicConsensusTest._4.array.cond.1:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performBasicConsensusTest._5.array.body.1
  j .F.performBasicConsensusTest._6.array.exit.1                        # ir inst 17 fin
.F.performBasicConsensusTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performBasicConsensusTest._4.array.cond.1                        # ir inst 21 fin
.F.performBasicConsensusTest._6.array.exit.1:
  addi t1, sp, 96
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performBasicConsensusTest._7.array.cond.2                        # ir inst 24 fin
.F.performBasicConsensusTest._7.array.cond.2:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performBasicConsensusTest._8.array.body.2
  j .F.performBasicConsensusTest._9.array.exit.2                        # ir inst 27 fin
.F.performBasicConsensusTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performBasicConsensusTest._7.array.cond.2                        # ir inst 31 fin
.F.performBasicConsensusTest._9.array.exit.2:
  li t1, 2924
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 34 fin
# Phi connections
  li t5, 0
  j .F.performBasicConsensusTest._10.array.cond.3                       # ir inst 35 fin
.F.performBasicConsensusTest._10.array.cond.3:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 37 fin
  bnez t4, .F.performBasicConsensusTest._11.array.body.3
  j .F.performBasicConsensusTest._12.array.exit.3                       # ir inst 38 fin
.F.performBasicConsensusTest._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 39 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 40 fin
  addi t4, t5, 1                                                        # ir inst 41 fin
# Phi connections
  mv t5, t4
  j .F.performBasicConsensusTest._10.array.cond.3                       # ir inst 42 fin
.F.performBasicConsensusTest._12.array.exit.3:
  addi t1, sp, 124
  addi t6, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t5, 0
  j .F.performBasicConsensusTest._13.array.cond.4                       # ir inst 44 fin
.F.performBasicConsensusTest._13.array.cond.4:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 46 fin
  bnez t4, .F.performBasicConsensusTest._14.array.body.4
  j .F.performBasicConsensusTest._15.array.exit.4                       # ir inst 47 fin
.F.performBasicConsensusTest._14.array.body.4:
  li t1, 400
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 400
  li t1, 2924
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 49 fin
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j .F.performBasicConsensusTest._13.array.cond.4                       # ir inst 51 fin
.F.performBasicConsensusTest._15.array.exit.4:
  li t1, 3324
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 53 fin
# Phi connections
  li t5, 0
  j .F.performBasicConsensusTest._16.array.cond.5                       # ir inst 54 fin
.F.performBasicConsensusTest._16.array.cond.5:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 56 fin
  bnez t4, .F.performBasicConsensusTest._17.array.body.5
  j .F.performBasicConsensusTest._18.array.exit.5                       # ir inst 57 fin
.F.performBasicConsensusTest._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 58 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 59 fin
  addi t4, t5, 1                                                        # ir inst 60 fin
# Phi connections
  mv t5, t4
  j .F.performBasicConsensusTest._16.array.cond.5                       # ir inst 61 fin
.F.performBasicConsensusTest._18.array.exit.5:
# Phi connections
  li t6, 0
  j .F.performBasicConsensusTest._19.while.cond.0                       # ir inst 62 fin
.F.performBasicConsensusTest._19.while.cond.0:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 64 fin
  bnez t5, .F.performBasicConsensusTest._20.while.body.0
  j .F.performBasicConsensusTest._30.while.exit.0                       # ir inst 65 fin
.F.performBasicConsensusTest._20.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 96
  mv a3, t1
  addi t1, sp, 68
  mv a2, t1
  addi t1, sp, 40
  mv a1, t1
  call .F.conductLeaderElection
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 66 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 67 fin
  bnez t4, .F.performBasicConsensusTest._21.if.then.0
  j .F.performBasicConsensusTest._28.if.else.0                          # ir inst 68 fin
.F.performBasicConsensusTest._21.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  li t1, 3324
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 124
  mv a2, t1
  mv a1, a0
  mv a0, t5
  call .F.performLogReplication
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 69 fin
  bnez t4, .F.performBasicConsensusTest._22.if.then.1
  j .F.performBasicConsensusTest._26.if.else.1                          # ir inst 70 fin
.F.performBasicConsensusTest._22.if.then.1:
  li t1, 25000
  add t5, t1, t6                                                        # ir inst 71 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 72 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  li t1, 3324
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 124
  mv a1, t1
  call .F.verifyLogConsistency
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 73 fin
  bnez t5, .F.performBasicConsensusTest._23.if.then.2
  j .F.performBasicConsensusTest._24.if.else.2                          # ir inst 74 fin
.F.performBasicConsensusTest._23.if.then.2:
  li t1, 25100
  add t5, t1, t6                                                        # ir inst 75 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 76 fin
  j .F.performBasicConsensusTest._25.if.exit.2                          # ir inst 77 fin
.F.performBasicConsensusTest._24.if.else.2:
  j .F.performBasicConsensusTest._25.if.exit.2                          # ir inst 78 fin
.F.performBasicConsensusTest._25.if.exit.2:
  j .F.performBasicConsensusTest._27.if.exit.1                          # ir inst 79 fin
.F.performBasicConsensusTest._26.if.else.1:
  j .F.performBasicConsensusTest._27.if.exit.1                          # ir inst 80 fin
.F.performBasicConsensusTest._27.if.exit.1:
  j .F.performBasicConsensusTest._29.if.exit.0                          # ir inst 81 fin
.F.performBasicConsensusTest._28.if.else.0:
  j .F.performBasicConsensusTest._29.if.exit.0                          # ir inst 82 fin
.F.performBasicConsensusTest._29.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 83 fin
# Phi connections
  mv t6, t5
  j .F.performBasicConsensusTest._19.while.cond.0                       # ir inst 84 fin
.F.performBasicConsensusTest._30.while.exit.0:
# Start call preparation
  li a0, 25099
  call printlnInt
# ir inst 85 fin
  j .F.performBasicConsensusTest.epilogue                               # ir inst 86 fin
.F.performBasicConsensusTest.epilogue:
  ld ra, 32(sp)
  li t0, 3360
  add sp, sp, t0
  ret

.globl .F.conductLeaderElection
.F.conductLeaderElection:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 36,                 range:       80(sp) -      116(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 1 / 12,        range:       64(sp) -       72(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.conductLeaderElection._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a1, a0
  mv a0, a2
  call .F.findMaxTerm
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 1 fin
  addi t5, t6, 1                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.conductLeaderElection._1.while.cond.0                            # ir inst 3 fin
.F.conductLeaderElection._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 5 fin
  bnez t4, .F.conductLeaderElection._2.while.body.0
  j .F.conductLeaderElection._3.while.exit.0                            # ir inst 6 fin
.F.conductLeaderElection._2.while.body.0:
  mv t4, t6                                                             # ir inst 7 fin
  slli t2, t4, 2
  add t3, a3, t2                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t3)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F.conductLeaderElection._1.while.cond.0                            # ir inst 11 fin
.F.conductLeaderElection._3.while.exit.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t4, 0
  j .F.conductLeaderElection._4.array.cond.0                            # ir inst 14 fin
.F.conductLeaderElection._4.array.cond.0:
  li t2, 7
  slt t3, t4, t2                                                        # ir inst 16 fin
  bnez t3, .F.conductLeaderElection._5.array.body.0
  j .F.conductLeaderElection._6.array.exit.0                            # ir inst 17 fin
.F.conductLeaderElection._5.array.body.0:
  add t3, t6, t4                                                        # ir inst 18 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 19 fin
  addi t3, t4, 1                                                        # ir inst 20 fin
# Phi connections
  mv t4, t3
  j .F.conductLeaderElection._4.array.cond.0                            # ir inst 21 fin
.F.conductLeaderElection._6.array.exit.0:
# Phi connections
  li t6, 0
  j .F.conductLeaderElection._7.while.cond.1                            # ir inst 22 fin
.F.conductLeaderElection._7.while.cond.1:
  slt t4, t6, a0                                                        # ir inst 24 fin
  bnez t4, .F.conductLeaderElection._8.while.body.1
  j .F.conductLeaderElection._12.while.exit.1                           # ir inst 25 fin
.F.conductLeaderElection._8.while.body.1:
  mv t4, t6                                                             # ir inst 26 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 27 fin
  lw t4, 0(t3)                                                          # ir inst 28 fin
  mv t3, t6                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 30 fin
  lw t3, 0(s11)                                                         # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t3, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  mv a3, t5
  mv a2, t3
  mv a1, t4
  mv a0, t6
  call .F.shouldBecomeCandidate
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t3, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 32 fin
  bnez s11, .F.conductLeaderElection._9.if.then.0
  j .F.conductLeaderElection._10.if.else.0                              # ir inst 33 fin
.F.conductLeaderElection._9.if.then.0:
  mv t4, t6                                                             # ir inst 34 fin
  addi t1, sp, 80
  add t3, t1, t4                                                        # ir inst 35 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 36 fin
  mv t4, t6                                                             # ir inst 37 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 38 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 39 fin
  mv t4, t6                                                             # ir inst 40 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 41 fin
  sw t5, 0(t3)                                                          # ir inst 42 fin
  j .F.conductLeaderElection._11.if.exit.0                              # ir inst 43 fin
.F.conductLeaderElection._10.if.else.0:
  j .F.conductLeaderElection._11.if.exit.0                              # ir inst 44 fin
.F.conductLeaderElection._11.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 45 fin
# Phi connections
  mv t6, t4
  j .F.conductLeaderElection._7.while.cond.1                            # ir inst 46 fin
.F.conductLeaderElection._12.while.exit.1:
  addi t1, sp, 88
  addi t6, t1, 0                                                        # ir inst 48 fin
# Phi connections
  li t4, 0
  j .F.conductLeaderElection._13.array.cond.1                           # ir inst 49 fin
.F.conductLeaderElection._13.array.cond.1:
  li t2, 7
  slt t3, t4, t2                                                        # ir inst 51 fin
  bnez t3, .F.conductLeaderElection._14.array.body.1
  j .F.conductLeaderElection._15.array.exit.1                           # ir inst 52 fin
.F.conductLeaderElection._14.array.body.1:
  slli t2, t4, 2
  add t3, t6, t2                                                        # ir inst 53 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 54 fin
  addi t3, t4, 1                                                        # ir inst 55 fin
# Phi connections
  mv t4, t3
  j .F.conductLeaderElection._13.array.cond.1                           # ir inst 56 fin
.F.conductLeaderElection._15.array.exit.1:
# Phi connections
  li t6, 0
  j .F.conductLeaderElection._16.while.cond.2                           # ir inst 57 fin
.F.conductLeaderElection._16.while.cond.2:
  slt t4, t6, a0                                                        # ir inst 59 fin
  bnez t4, .F.conductLeaderElection._17.while.body.2
  j .F.conductLeaderElection._27.while.exit.2                           # ir inst 60 fin
.F.conductLeaderElection._17.while.body.2:
  mv t4, t6                                                             # ir inst 61 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 62 fin
  lw t4, 0(t3)                                                          # ir inst 63 fin
  li t2, 1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 64 fin
  bnez t3, .F.conductLeaderElection._18.if.then.1
  j .F.conductLeaderElection._25.if.else.1                              # ir inst 65 fin
.F.conductLeaderElection._18.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a4, t5
  mv a3, a2
  addi t1, sp, 80
  mv a2, t1
  mv a1, a0
  mv a0, t6
  call .F.decideVote
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 66 fin
  li t2, 0
  slt t0, t4, t2
  xori t3, t0, 1                                                        # ir inst 67 fin
  bnez t3, .F.conductLeaderElection._19.lazy.then.0
  j .F.conductLeaderElection._20.lazy.else.0                            # ir inst 68 fin
.F.conductLeaderElection._19.lazy.then.0:
  slt t3, t4, a0                                                        # ir inst 69 fin
# Phi connections
  j .F.conductLeaderElection._21.lazy.exit.0                            # ir inst 70 fin
.F.conductLeaderElection._20.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.conductLeaderElection._21.lazy.exit.0                            # ir inst 71 fin
.F.conductLeaderElection._21.lazy.exit.0:
  bnez t3, .F.conductLeaderElection._22.if.then.2
  j .F.conductLeaderElection._23.if.else.2                              # ir inst 73 fin
.F.conductLeaderElection._22.if.then.2:
  mv t3, t6                                                             # ir inst 74 fin
  slli t2, t3, 2
  add s11, a3, t2                                                       # ir inst 75 fin
  sw t4, 0(s11)                                                         # ir inst 76 fin
  mv t3, t4                                                             # ir inst 77 fin
  slli t2, t3, 2
  addi t1, sp, 88
  add s11, t1, t2                                                       # ir inst 78 fin
  mv t3, t4                                                             # ir inst 79 fin
  slli t2, t3, 2
  addi t1, sp, 88
  add t4, t1, t2                                                        # ir inst 80 fin
  lw t3, 0(t4)                                                          # ir inst 81 fin
  addi t4, t3, 1                                                        # ir inst 82 fin
  sw t4, 0(s11)                                                         # ir inst 83 fin
  j .F.conductLeaderElection._24.if.exit.2                              # ir inst 84 fin
.F.conductLeaderElection._23.if.else.2:
  j .F.conductLeaderElection._24.if.exit.2                              # ir inst 85 fin
.F.conductLeaderElection._24.if.exit.2:
  j .F.conductLeaderElection._26.if.exit.1                              # ir inst 86 fin
.F.conductLeaderElection._25.if.else.1:
  j .F.conductLeaderElection._26.if.exit.1                              # ir inst 87 fin
.F.conductLeaderElection._26.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 88 fin
# Phi connections
  mv t6, t4
  j .F.conductLeaderElection._16.while.cond.2                           # ir inst 89 fin
.F.conductLeaderElection._27.while.exit.2:
# Phi connections
  li t6, 0
  j .F.conductLeaderElection._28.while.cond.3                           # ir inst 90 fin
.F.conductLeaderElection._28.while.cond.3:
  slt t5, t6, a0                                                        # ir inst 92 fin
  bnez t5, .F.conductLeaderElection._29.while.body.3
  j .F.conductLeaderElection._33.while.exit.3                           # ir inst 93 fin
.F.conductLeaderElection._29.while.body.3:
  mv t5, t6                                                             # ir inst 94 fin
  addi t1, sp, 80
  add t4, t1, t5                                                        # ir inst 95 fin
  lb t5, 0(t4)                                                          # ir inst 96 fin
  bnez t5, .F.conductLeaderElection._30.if.then.3
  j .F.conductLeaderElection._31.if.else.3                              # ir inst 97 fin
.F.conductLeaderElection._30.if.then.3:
  mv t5, t6                                                             # ir inst 98 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 99 fin
  sw t6, 0(t4)                                                          # ir inst 100 fin
  mv t5, t6                                                             # ir inst 101 fin
  slli t2, t5, 2
  addi t1, sp, 88
  add t4, t1, t2                                                        # ir inst 102 fin
  mv t5, t6                                                             # ir inst 103 fin
  slli t2, t5, 2
  addi t1, sp, 88
  add t3, t1, t2                                                        # ir inst 104 fin
  lw t5, 0(t3)                                                          # ir inst 105 fin
  addi t3, t5, 1                                                        # ir inst 106 fin
  sw t3, 0(t4)                                                          # ir inst 107 fin
  j .F.conductLeaderElection._32.if.exit.3                              # ir inst 108 fin
.F.conductLeaderElection._31.if.else.3:
  j .F.conductLeaderElection._32.if.exit.3                              # ir inst 109 fin
.F.conductLeaderElection._32.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 110 fin
# Phi connections
  mv t6, t5
  j .F.conductLeaderElection._28.while.cond.3                           # ir inst 111 fin
.F.conductLeaderElection._33.while.exit.3:
  li t2, 2
  div t6, a0, t2                                                        # ir inst 112 fin
  addi t5, t6, 1                                                        # ir inst 113 fin
# Phi connections
  li t6, 0
  j .F.conductLeaderElection._34.while.cond.4                           # ir inst 114 fin
.F.conductLeaderElection._34.while.cond.4:
  slt t4, t6, a0                                                        # ir inst 116 fin
  bnez t4, .F.conductLeaderElection._35.while.body.4
  j .F.conductLeaderElection._40.critical_edge.0                        # ir inst 117 fin
.F.conductLeaderElection._35.while.body.4:
  mv t4, t6                                                             # ir inst 118 fin
  slli t2, t4, 2
  addi t1, sp, 88
  add t3, t1, t2                                                        # ir inst 119 fin
  lw t4, 0(t3)                                                          # ir inst 120 fin
  slt t0, t4, t5
  xori t3, t0, 1                                                        # ir inst 121 fin
  bnez t3, .F.conductLeaderElection._36.if.then.4
  j .F.conductLeaderElection._37.if.else.4                              # ir inst 122 fin
.F.conductLeaderElection._36.if.then.4:
  mv t4, t6                                                             # ir inst 123 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 124 fin
  li t1, 2
  sw t1, 0(t3)                                                          # ir inst 125 fin
# Phi connections
  j .F.conductLeaderElection._39.while.exit.4                           # ir inst 126 fin
.F.conductLeaderElection._37.if.else.4:
  j .F.conductLeaderElection._38.if.exit.4                              # ir inst 127 fin
.F.conductLeaderElection._38.if.exit.4:
  addi t4, t6, 1                                                        # ir inst 128 fin
# Phi connections
  mv t6, t4
  j .F.conductLeaderElection._34.while.cond.4                           # ir inst 129 fin
.F.conductLeaderElection._39.while.exit.4:
  mv a0, t6
  j .F.conductLeaderElection.epilogue                                   # ir inst 131 fin
.F.conductLeaderElection._40.critical_edge.0:
# Phi connections
  li t6, -1
  j .F.conductLeaderElection._39.while.exit.4                           # ir inst 132 fin
.F.conductLeaderElection.epilogue:
  ld ra, 72(sp)
  ld s11, 64(sp)
  addi sp, sp, 128
  ret

.globl .F.decideVote
.F.decideVote:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 1 / 12,        range:       72(sp) -       80(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.decideVote._0.entry.0:
# Phi connections
  li t4, -1
  li t5, -1
  li t6, 0
  j .F.decideVote._1.while.cond.0                                       # ir inst 1 fin
.F.decideVote._1.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 5 fin
  bnez t3, .F.decideVote._2.while.body.0
  j .F.decideVote._9.while.exit.0                                       # ir inst 6 fin
.F.decideVote._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  add s11, a2, t3                                                       # ir inst 8 fin
  lb t3, 0(s11)                                                         # ir inst 9 fin
  bnez t3, .F.decideVote._3.if.then.0
  j .F.decideVote._7.if.else.0                                          # ir inst 10 fin
.F.decideVote._3.if.then.0:
  mv t3, t6                                                             # ir inst 11 fin
  slli t2, t3, 2
  add s11, a3, t2                                                       # ir inst 12 fin
  lw t3, 0(s11)                                                         # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a3, a4
  mv a2, t3
  mv a1, a0
  mv a0, t6
  call .F.calculateCandidateScore
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 14 fin
  slt t3, t5, s11                                                       # ir inst 15 fin
  bnez t3, .F.decideVote._4.if.then.1
  j .F.decideVote._5.if.else.1                                          # ir inst 16 fin
.F.decideVote._4.if.then.1:
# Phi connections
  mv t3, s11
  mv s11, t6
  j .F.decideVote._6.if.exit.1                                          # ir inst 17 fin
.F.decideVote._5.if.else.1:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.decideVote._6.if.exit.1                                          # ir inst 18 fin
.F.decideVote._6.if.exit.1:
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.decideVote._8.if.exit.0                                          # ir inst 21 fin
.F.decideVote._7.if.else.0:
# Phi connections
  mv t3, t4
  j .F.decideVote._8.if.exit.0                                          # ir inst 22 fin
.F.decideVote._8.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 25 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.decideVote._1.while.cond.0                                       # ir inst 26 fin
.F.decideVote._9.while.exit.0:
  mv a0, t4
  j .F.decideVote.epilogue                                              # ir inst 27 fin
.F.decideVote.epilogue:
  ld ra, 80(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.calculateCandidateScore
.F.calculateCandidateScore:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.calculateCandidateScore._0.entry.0:
  li t2, 100
  mul t6, a2, t2                                                        # ir inst 1 fin
  sub t5, t6, a0                                                        # ir inst 2 fin
  li t2, 7
  mul t6, a1, t2                                                        # ir inst 3 fin
  li t2, 11
  mul t4, a0, t2                                                        # ir inst 4 fin
  add t3, t6, t4                                                        # ir inst 5 fin
  li t2, 50
  rem t6, t3, t2                                                        # ir inst 6 fin
  add t4, t5, t6                                                        # ir inst 7 fin
  sub t6, a1, a0                                                        # ir inst 8 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.abs
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 9 fin
  li t2, 5
  mul t6, t5, t2                                                        # ir inst 10 fin
  sub t5, t4, t6                                                        # ir inst 11 fin
  mv a0, t5
  j .F.calculateCandidateScore.epilogue                                 # ir inst 12 fin
.F.calculateCandidateScore.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.performLogReplication
.F.performLogReplication:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 1 / 12,        range:       64(sp) -       72(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.performLogReplication._0.entry.0:
  mv t6, a0                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t6, 32(sp)
  mv a1, t6
  call .F.generateLogEntry
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t6, 32(sp)
# ir inst 4 fin
  mv t6, a0                                                             # ir inst 5 fin
  slli t2, t6, 2
  add t4, a3, t2                                                        # ir inst 6 fin
  lw t6, 0(t4)                                                          # ir inst 7 fin
  li t2, 100
  slt t4, t6, t2                                                        # ir inst 8 fin
  bnez t4, .F.performLogReplication._1.if.then.0
  j .F.performLogReplication._2.if.else.0                               # ir inst 9 fin
.F.performLogReplication._1.if.then.0:
  mv t6, a0                                                             # ir inst 10 fin
  li t1, 400
  mul t2, t6, t1
  add t4, a2, t2                                                        # ir inst 11 fin
  mv t6, a0                                                             # ir inst 12 fin
  slli t2, t6, 2
  add t3, a3, t2                                                        # ir inst 13 fin
  lw t6, 0(t3)                                                          # ir inst 14 fin
  mv t3, t6                                                             # ir inst 15 fin
  slli t2, t3, 2
  add t6, t4, t2                                                        # ir inst 16 fin
  sw t5, 0(t6)                                                          # ir inst 17 fin
  mv t6, a0                                                             # ir inst 18 fin
  slli t2, t6, 2
  add t4, a3, t2                                                        # ir inst 19 fin
  mv t6, a0                                                             # ir inst 20 fin
  slli t2, t6, 2
  add t3, a3, t2                                                        # ir inst 21 fin
  lw t6, 0(t3)                                                          # ir inst 22 fin
  addi t3, t6, 1                                                        # ir inst 23 fin
  sw t3, 0(t4)                                                          # ir inst 24 fin
  j .F.performLogReplication._3.if.exit.0                               # ir inst 25 fin
.F.performLogReplication._2.if.else.0:
  j .F.performLogReplication._3.if.exit.0                               # ir inst 26 fin
.F.performLogReplication._3.if.exit.0:
# Phi connections
  li t4, 1
  li t6, 0
  j .F.performLogReplication._4.while.cond.0                            # ir inst 27 fin
.F.performLogReplication._4.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 30 fin
  bnez t3, .F.performLogReplication._5.while.body.0
  j .F.performLogReplication._12.while.exit.0                           # ir inst 31 fin
.F.performLogReplication._5.while.body.0:
  xor t0, t6, a0
  sltu t3, zero, t0                                                     # ir inst 32 fin
  bnez t3, .F.performLogReplication._6.if.then.1
  j .F.performLogReplication._10.if.else.1                              # ir inst 33 fin
.F.performLogReplication._6.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a4, a3
  mv a3, a2
  mv a2, t5
  mv a1, t6
  call .F.replicateToFollower
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 34 fin
  bnez t3, .F.performLogReplication._7.if.then.2
  j .F.performLogReplication._8.if.else.2                               # ir inst 35 fin
.F.performLogReplication._7.if.then.2:
  addi t3, t4, 1                                                        # ir inst 36 fin
# Phi connections
  j .F.performLogReplication._9.if.exit.2                               # ir inst 37 fin
.F.performLogReplication._8.if.else.2:
# Phi connections
  mv t3, t4
  j .F.performLogReplication._9.if.exit.2                               # ir inst 38 fin
.F.performLogReplication._9.if.exit.2:
# Phi connections
  j .F.performLogReplication._11.if.exit.1                              # ir inst 40 fin
.F.performLogReplication._10.if.else.1:
# Phi connections
  mv t3, t4
  j .F.performLogReplication._11.if.exit.1                              # ir inst 41 fin
.F.performLogReplication._11.if.exit.1:
  addi s11, t6, 1                                                       # ir inst 43 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.performLogReplication._4.while.cond.0                            # ir inst 44 fin
.F.performLogReplication._12.while.exit.0:
  li t2, 2
  div t6, a1, t2                                                        # ir inst 45 fin
  addi t5, t6, 1                                                        # ir inst 46 fin
  slt t0, t4, t5
  xori t6, t0, 1                                                        # ir inst 47 fin
  mv a0, t6
  j .F.performLogReplication.epilogue                                   # ir inst 48 fin
.F.performLogReplication.epilogue:
  ld ra, 72(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.replicateToFollower
.F.replicateToFollower:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.replicateToFollower._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  call .F.simulateNetworkReliability
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
# ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.replicateToFollower._1.if.then.0
  j .F.replicateToFollower._2.if.else.0                                 # ir inst 3 fin
.F.replicateToFollower._1.if.then.0:
  li a0, 0
  j .F.replicateToFollower.epilogue                                     # ir inst 4 fin
.F.replicateToFollower._2.if.else.0:
  j .F.replicateToFollower._3.if.exit.0                                 # ir inst 5 fin
.F.replicateToFollower._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  mv a2, a3
  mv a3, a4
  call .F.checkLogConsistency
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
# ir inst 6 fin
  bnez t6, .F.replicateToFollower._4.lazy.then.0
  j .F.replicateToFollower._5.lazy.else.0                               # ir inst 7 fin
.F.replicateToFollower._4.lazy.then.0:
  mv t6, a1                                                             # ir inst 8 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 9 fin
  lw t6, 0(t5)                                                          # ir inst 10 fin
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.replicateToFollower._6.lazy.exit.0                               # ir inst 12 fin
.F.replicateToFollower._5.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.replicateToFollower._6.lazy.exit.0                               # ir inst 13 fin
.F.replicateToFollower._6.lazy.exit.0:
  bnez t6, .F.replicateToFollower._7.if.then.1
  j .F.replicateToFollower._8.if.else.1                                 # ir inst 15 fin
.F.replicateToFollower._7.if.then.1:
  mv t6, a1                                                             # ir inst 16 fin
  li t1, 400
  mul t2, t6, t1
  add t5, a3, t2                                                        # ir inst 17 fin
  mv t6, a1                                                             # ir inst 18 fin
  slli t2, t6, 2
  add t4, a4, t2                                                        # ir inst 19 fin
  lw t6, 0(t4)                                                          # ir inst 20 fin
  mv t4, t6                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 22 fin
  sw a2, 0(t6)                                                          # ir inst 23 fin
  mv t6, a1                                                             # ir inst 24 fin
  slli t2, t6, 2
  add t5, a4, t2                                                        # ir inst 25 fin
  mv t6, a1                                                             # ir inst 26 fin
  slli t2, t6, 2
  add t4, a4, t2                                                        # ir inst 27 fin
  lw t6, 0(t4)                                                          # ir inst 28 fin
  addi t4, t6, 1                                                        # ir inst 29 fin
  sw t4, 0(t5)                                                          # ir inst 30 fin
  li a0, 1
  j .F.replicateToFollower.epilogue                                     # ir inst 31 fin
.F.replicateToFollower._8.if.else.1:
  j .F.replicateToFollower._9.if.exit.1                                 # ir inst 32 fin
.F.replicateToFollower._9.if.exit.1:
  li a0, 0
  j .F.replicateToFollower.epilogue                                     # ir inst 33 fin
.F.replicateToFollower.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.performByzantineFaultToleranceTest
.F.performByzantineFaultToleranceTest:
# spill func args num: 0,             range:      912(sp) -      912(sp)
# local var size: 852,                range:       48(sp) -      900(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 0 / 12,        range:       40(sp) -       40(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -912
  sd ra, 40(sp)
.F.performByzantineFaultToleranceTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  li a0, 25201
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
  addi t1, sp, 48
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._1.array.cond.0               # ir inst 4 fin
.F.performByzantineFaultToleranceTest._1.array.cond.0:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performByzantineFaultToleranceTest._2.array.body.0
  j .F.performByzantineFaultToleranceTest._3.array.exit.0               # ir inst 7 fin
.F.performByzantineFaultToleranceTest._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 8 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._1.array.cond.0               # ir inst 11 fin
.F.performByzantineFaultToleranceTest._3.array.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performByzantineFaultToleranceTest._4.while.cond.0               # ir inst 12 fin
.F.performByzantineFaultToleranceTest._4.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 15 fin
  bnez t4, .F.performByzantineFaultToleranceTest._5.lazy.then.0
  j .F.performByzantineFaultToleranceTest._6.lazy.else.0                # ir inst 16 fin
.F.performByzantineFaultToleranceTest._5.lazy.then.0:
  slt t4, t5, a1                                                        # ir inst 17 fin
# Phi connections
  j .F.performByzantineFaultToleranceTest._7.lazy.exit.0                # ir inst 18 fin
.F.performByzantineFaultToleranceTest._6.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performByzantineFaultToleranceTest._7.lazy.exit.0                # ir inst 19 fin
.F.performByzantineFaultToleranceTest._7.lazy.exit.0:
  bnez t4, .F.performByzantineFaultToleranceTest._8.while.body.0
  j .F.performByzantineFaultToleranceTest._12.while.exit.0              # ir inst 21 fin
.F.performByzantineFaultToleranceTest._8.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.shouldBeByzantine
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 22 fin
  bnez t4, .F.performByzantineFaultToleranceTest._9.if.then.0
  j .F.performByzantineFaultToleranceTest._10.if.else.0                 # ir inst 23 fin
.F.performByzantineFaultToleranceTest._9.if.then.0:
  mv t4, t6                                                             # ir inst 24 fin
  addi t1, sp, 48
  add t3, t1, t4                                                        # ir inst 25 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 26 fin
  addi t4, t5, 1                                                        # ir inst 27 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._11.if.exit.0                 # ir inst 28 fin
.F.performByzantineFaultToleranceTest._10.if.else.0:
# Phi connections
  j .F.performByzantineFaultToleranceTest._11.if.exit.0                 # ir inst 29 fin
.F.performByzantineFaultToleranceTest._11.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 31 fin
# Phi connections
  mv t6, t4
  j .F.performByzantineFaultToleranceTest._4.while.cond.0               # ir inst 32 fin
.F.performByzantineFaultToleranceTest._12.while.exit.0:
  addi t1, sp, 56
  addi t6, t1, 0                                                        # ir inst 34 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._13.array.cond.1              # ir inst 35 fin
.F.performByzantineFaultToleranceTest._13.array.cond.1:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 37 fin
  bnez t4, .F.performByzantineFaultToleranceTest._14.array.body.1
  j .F.performByzantineFaultToleranceTest._15.array.exit.1              # ir inst 38 fin
.F.performByzantineFaultToleranceTest._14.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 39 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 40 fin
  addi t4, t5, 1                                                        # ir inst 41 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._13.array.cond.1              # ir inst 42 fin
.F.performByzantineFaultToleranceTest._15.array.exit.1:
  addi t1, sp, 364
  addi t6, t1, 0                                                        # ir inst 45 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._16.array.cond.2              # ir inst 46 fin
.F.performByzantineFaultToleranceTest._16.array.cond.2:
  li t2, 10
  slt t4, t5, t2                                                        # ir inst 48 fin
  bnez t4, .F.performByzantineFaultToleranceTest._17.array.body.2
  j .F.performByzantineFaultToleranceTest._18.array.exit.2              # ir inst 49 fin
.F.performByzantineFaultToleranceTest._17.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 50 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 51 fin
  addi t4, t5, 1                                                        # ir inst 52 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._16.array.cond.2              # ir inst 53 fin
.F.performByzantineFaultToleranceTest._18.array.exit.2:
  addi t1, sp, 84
  addi t6, t1, 0                                                        # ir inst 54 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._19.array.cond.3              # ir inst 55 fin
.F.performByzantineFaultToleranceTest._19.array.cond.3:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 57 fin
  bnez t4, .F.performByzantineFaultToleranceTest._20.array.body.3
  j .F.performByzantineFaultToleranceTest._21.array.exit.3              # ir inst 58 fin
.F.performByzantineFaultToleranceTest._20.array.body.3:
  li t1, 40
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 59 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 40
  addi t1, sp, 364
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 60 fin
  addi t4, t5, 1                                                        # ir inst 61 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._19.array.cond.3              # ir inst 62 fin
.F.performByzantineFaultToleranceTest._21.array.exit.3:
  addi t1, sp, 404
  addi t6, t1, 0                                                        # ir inst 64 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._22.array.cond.4              # ir inst 65 fin
.F.performByzantineFaultToleranceTest._22.array.cond.4:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 67 fin
  bnez t4, .F.performByzantineFaultToleranceTest._23.array.body.4
  j .F.performByzantineFaultToleranceTest._24.array.exit.4              # ir inst 68 fin
.F.performByzantineFaultToleranceTest._23.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 69 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 70 fin
  addi t4, t5, 1                                                        # ir inst 71 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._22.array.cond.4              # ir inst 72 fin
.F.performByzantineFaultToleranceTest._24.array.exit.4:
  addi t1, sp, 888
  addi t6, t1, 0                                                        # ir inst 75 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._25.array.cond.5              # ir inst 76 fin
.F.performByzantineFaultToleranceTest._25.array.cond.5:
  li t2, 3
  slt t4, t5, t2                                                        # ir inst 78 fin
  bnez t4, .F.performByzantineFaultToleranceTest._26.array.body.5
  j .F.performByzantineFaultToleranceTest._27.array.exit.5              # ir inst 79 fin
.F.performByzantineFaultToleranceTest._26.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 80 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 81 fin
  addi t4, t5, 1                                                        # ir inst 82 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._25.array.cond.5              # ir inst 83 fin
.F.performByzantineFaultToleranceTest._27.array.exit.5:
  addi t1, sp, 804
  addi t6, t1, 0                                                        # ir inst 84 fin
# Phi connections
  li t5, 0
  j .F.performByzantineFaultToleranceTest._28.array.cond.6              # ir inst 85 fin
.F.performByzantineFaultToleranceTest._28.array.cond.6:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 87 fin
  bnez t4, .F.performByzantineFaultToleranceTest._29.array.body.6
  j .F.performByzantineFaultToleranceTest._30.array.exit.6              # ir inst 88 fin
.F.performByzantineFaultToleranceTest._29.array.body.6:
  li t1, 12
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 89 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 12
  addi t1, sp, 888
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 90 fin
  addi t4, t5, 1                                                        # ir inst 91 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineFaultToleranceTest._28.array.cond.6              # ir inst 92 fin
.F.performByzantineFaultToleranceTest._30.array.exit.6:
# Phi connections
  li t6, 0
  j .F.performByzantineFaultToleranceTest._31.while.cond.1              # ir inst 93 fin
.F.performByzantineFaultToleranceTest._31.while.cond.1:
  li t2, 20
  slt t5, t6, t2                                                        # ir inst 95 fin
  bnez t5, .F.performByzantineFaultToleranceTest._32.while.body.1
  j .F.performByzantineFaultToleranceTest._42.while.exit.1              # ir inst 96 fin
.F.performByzantineFaultToleranceTest._32.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a4, t6
  addi t1, sp, 804
  mv a3, t1
  addi t1, sp, 56
  mv a2, t1
  addi t1, sp, 48
  mv a1, t1
  call .F.conductByzantineValueProposal
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 97 fin
  bnez t5, .F.performByzantineFaultToleranceTest._33.if.then.1
  j .F.performByzantineFaultToleranceTest._40.if.else.1                 # ir inst 98 fin
.F.performByzantineFaultToleranceTest._33.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a4, t6
  addi t1, sp, 84
  mv a3, t1
  addi t1, sp, 804
  mv a2, t1
  addi t1, sp, 48
  mv a1, t1
  call .F.performByzantineAgreement
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 99 fin
  bnez t5, .F.performByzantineFaultToleranceTest._34.if.then.2
  j .F.performByzantineFaultToleranceTest._38.if.else.2                 # ir inst 100 fin
.F.performByzantineFaultToleranceTest._34.if.then.2:
  li t1, 25200
  add t5, t1, t6                                                        # ir inst 101 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 102 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 804
  mv a2, t1
  addi t1, sp, 48
  mv a1, t1
  call .F.verifyHonestNodeAgreement
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 103 fin
  bnez t5, .F.performByzantineFaultToleranceTest._35.if.then.3
  j .F.performByzantineFaultToleranceTest._36.if.else.3                 # ir inst 104 fin
.F.performByzantineFaultToleranceTest._35.if.then.3:
  li t1, 25220
  add t5, t1, t6                                                        # ir inst 105 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 106 fin
  j .F.performByzantineFaultToleranceTest._37.if.exit.3                 # ir inst 107 fin
.F.performByzantineFaultToleranceTest._36.if.else.3:
  j .F.performByzantineFaultToleranceTest._37.if.exit.3                 # ir inst 108 fin
.F.performByzantineFaultToleranceTest._37.if.exit.3:
  j .F.performByzantineFaultToleranceTest._39.if.exit.2                 # ir inst 109 fin
.F.performByzantineFaultToleranceTest._38.if.else.2:
  j .F.performByzantineFaultToleranceTest._39.if.exit.2                 # ir inst 110 fin
.F.performByzantineFaultToleranceTest._39.if.exit.2:
  j .F.performByzantineFaultToleranceTest._41.if.exit.1                 # ir inst 111 fin
.F.performByzantineFaultToleranceTest._40.if.else.1:
  j .F.performByzantineFaultToleranceTest._41.if.exit.1                 # ir inst 112 fin
.F.performByzantineFaultToleranceTest._41.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 113 fin
# Phi connections
  mv t6, t5
  j .F.performByzantineFaultToleranceTest._31.while.cond.1              # ir inst 114 fin
.F.performByzantineFaultToleranceTest._42.while.exit.1:
# Start call preparation
  li a0, 25299
  call printlnInt
# ir inst 115 fin
  j .F.performByzantineFaultToleranceTest.epilogue                      # ir inst 116 fin
.F.performByzantineFaultToleranceTest.epilogue:
  ld ra, 40(sp)
  addi sp, sp, 912
  ret

.globl .F.conductByzantineValueProposal
.F.conductByzantineValueProposal:
# spill func args num: 0,             range:      112(sp) -      112(sp)
# local var size: 0,                  range:      104(sp) -      104(sp)
# return addr size: 8,                range:       96(sp) -      104(sp)
# callee save reg num: 3 / 12,        range:       72(sp) -       96(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -112
  sd s9, 72(sp)
  sd s10, 80(sp)
  sd s11, 88(sp)
  sd ra, 96(sp)
.F.conductByzantineValueProposal._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.conductByzantineValueProposal._1.while.cond.0                    # ir inst 1 fin
.F.conductByzantineValueProposal._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.conductByzantineValueProposal._2.while.body.0
  j .F.conductByzantineValueProposal._6.while.exit.0                    # ir inst 5 fin
.F.conductByzantineValueProposal._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  add t3, a1, t4                                                        # ir inst 7 fin
  lb t4, 0(t3)                                                          # ir inst 8 fin
  bnez t4, .F.conductByzantineValueProposal._3.if.then.0
  j .F.conductByzantineValueProposal._4.if.else.0                       # ir inst 9 fin
.F.conductByzantineValueProposal._3.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a2, 1
  mv a1, a4
  mv a0, t6
  call .F.generateMaliciousValue
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t4, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  li a2, 2
  mv a1, a4
  mv a0, t6
  call .F.generateMaliciousValue
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t4, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 11 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  li a2, 3
  mv a1, a4
  mv a0, t6
  call .F.generateMaliciousValue
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 12 fin
  mv s10, t6                                                            # ir inst 13 fin
  li t1, 12
  mul t2, s10, t1
  add s9, a3, t2                                                        # ir inst 14 fin
  addi s10, s9, 0                                                       # ir inst 15 fin
  sw t4, 0(s10)                                                         # ir inst 16 fin
  mv s10, t6                                                            # ir inst 17 fin
  li t1, 12
  mul t2, s10, t1
  add s9, a3, t2                                                        # ir inst 18 fin
  addi s10, s9, 4                                                       # ir inst 19 fin
  sw t3, 0(s10)                                                         # ir inst 20 fin
  mv t3, t6                                                             # ir inst 21 fin
  li t1, 12
  mul t2, t3, t1
  add s10, a3, t2                                                       # ir inst 22 fin
  addi t3, s10, 8                                                       # ir inst 23 fin
  sw s11, 0(t3)                                                         # ir inst 24 fin
  mv t3, t6                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 26 fin
  sw t4, 0(s11)                                                         # ir inst 27 fin
  j .F.conductByzantineValueProposal._5.if.exit.0                       # ir inst 28 fin
.F.conductByzantineValueProposal._4.if.else.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a1, a4
  mv a0, t6
  call .F.generateHonestValue
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 29 fin
  mv t3, t6                                                             # ir inst 30 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a3, t2                                                       # ir inst 31 fin
  addi t3, s11, 0                                                       # ir inst 32 fin
  sw t4, 0(t3)                                                          # ir inst 33 fin
  mv t3, t6                                                             # ir inst 34 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a3, t2                                                       # ir inst 35 fin
  addi t3, s11, 4                                                       # ir inst 36 fin
  sw t4, 0(t3)                                                          # ir inst 37 fin
  mv t3, t6                                                             # ir inst 38 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a3, t2                                                       # ir inst 39 fin
  addi t3, s11, 8                                                       # ir inst 40 fin
  sw t4, 0(t3)                                                          # ir inst 41 fin
  mv t3, t6                                                             # ir inst 42 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 43 fin
  sw t4, 0(s11)                                                         # ir inst 44 fin
  j .F.conductByzantineValueProposal._5.if.exit.0                       # ir inst 45 fin
.F.conductByzantineValueProposal._5.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 46 fin
  addi t3, t6, 1                                                        # ir inst 47 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.conductByzantineValueProposal._1.while.cond.0                    # ir inst 48 fin
.F.conductByzantineValueProposal._6.while.exit.0:
  slt t0, t5, a0
  xori t6, t0, 1                                                        # ir inst 49 fin
  mv a0, t6
  j .F.conductByzantineValueProposal.epilogue                           # ir inst 50 fin
.F.conductByzantineValueProposal.epilogue:
  ld ra, 96(sp)
  ld s9, 72(sp)
  ld s10, 80(sp)
  ld s11, 88(sp)
  addi sp, sp, 112
  ret

.globl .F.performByzantineAgreement
.F.performByzantineAgreement:
# spill func args num: 0,             range:      320(sp) -      320(sp)
# local var size: 231,                range:       88(sp) -      319(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 2 / 12,        range:       64(sp) -       80(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -320
  sd s11, 64(sp)
  sd s10, 72(sp)
  sd ra, 80(sp)
.F.performByzantineAgreement._0.entry.0:
  addi t1, sp, 284
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performByzantineAgreement._1.array.cond.0                        # ir inst 4 fin
.F.performByzantineAgreement._1.array.cond.0:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performByzantineAgreement._2.array.body.0
  j .F.performByzantineAgreement._3.array.exit.0                        # ir inst 7 fin
.F.performByzantineAgreement._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineAgreement._1.array.cond.0                        # ir inst 11 fin
.F.performByzantineAgreement._3.array.exit.0:
  addi t1, sp, 88
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.performByzantineAgreement._4.array.cond.1                        # ir inst 13 fin
.F.performByzantineAgreement._4.array.cond.1:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.performByzantineAgreement._5.array.body.1
  j .F.performByzantineAgreement._6.array.exit.1                        # ir inst 16 fin
.F.performByzantineAgreement._5.array.body.1:
  li t1, 28
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 17 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  li a2, 28
  addi t1, sp, 284
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineAgreement._4.array.cond.1                        # ir inst 20 fin
.F.performByzantineAgreement._6.array.exit.1:
# Phi connections
  li t6, 0
  j .F.performByzantineAgreement._7.while.cond.0                        # ir inst 21 fin
.F.performByzantineAgreement._7.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 23 fin
  bnez t5, .F.performByzantineAgreement._8.while.body.0
  j .F.performByzantineAgreement._15.while.exit.0                       # ir inst 24 fin
.F.performByzantineAgreement._8.while.body.0:
# Phi connections
  li t5, 0
  j .F.performByzantineAgreement._9.while.cond.1                        # ir inst 25 fin
.F.performByzantineAgreement._9.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 27 fin
  bnez t4, .F.performByzantineAgreement._10.while.body.1
  j .F.performByzantineAgreement._14.while.exit.1                       # ir inst 28 fin
.F.performByzantineAgreement._10.while.body.1:
  mv t4, t5                                                             # ir inst 29 fin
  li t1, 12
  mul t2, t4, t1
  add t3, a2, t2                                                        # ir inst 30 fin
  addi t4, t3, 0                                                        # ir inst 31 fin
  lw t3, 0(t4)                                                          # ir inst 32 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd t3, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a3, a4
  mv a2, t3
  mv a1, t5
  mv a0, t6
  call .F.generateSignature
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld t3, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 33 fin
  mv t3, t6                                                             # ir inst 34 fin
  add s11, a1, t3                                                       # ir inst 35 fin
  lb t3, 0(s11)                                                         # ir inst 36 fin
  bnez t3, .F.performByzantineAgreement._11.if.then.0
  j .F.performByzantineAgreement._12.if.else.0                          # ir inst 37 fin
.F.performByzantineAgreement._11.if.then.0:
  mv t3, t6                                                             # ir inst 38 fin
  li t1, 28
  mul t2, t3, t1
  addi t1, sp, 88
  add s11, t1, t2                                                       # ir inst 39 fin
  mv t3, t5                                                             # ir inst 40 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 41 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a4, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a2, t5
  mv a1, t6
  mv a0, t4
  call .F.corruptSignature
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a4, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 42 fin
  sw t3, 0(s10)                                                         # ir inst 43 fin
  j .F.performByzantineAgreement._13.if.exit.0                          # ir inst 44 fin
.F.performByzantineAgreement._12.if.else.0:
  mv t3, t6                                                             # ir inst 45 fin
  li t1, 28
  mul t2, t3, t1
  addi t1, sp, 88
  add s11, t1, t2                                                       # ir inst 46 fin
  mv t3, t5                                                             # ir inst 47 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 48 fin
  sw t4, 0(s10)                                                         # ir inst 49 fin
  j .F.performByzantineAgreement._13.if.exit.0                          # ir inst 50 fin
.F.performByzantineAgreement._13.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineAgreement._9.while.cond.1                        # ir inst 52 fin
.F.performByzantineAgreement._14.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t5
  j .F.performByzantineAgreement._7.while.cond.0                        # ir inst 54 fin
.F.performByzantineAgreement._15.while.exit.0:
  addi t1, sp, 312
  addi t6, t1, 0                                                        # ir inst 56 fin
# Phi connections
  li t5, 0
  j .F.performByzantineAgreement._16.array.cond.2                       # ir inst 57 fin
.F.performByzantineAgreement._16.array.cond.2:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 59 fin
  bnez t4, .F.performByzantineAgreement._17.array.body.2
  j .F.performByzantineAgreement._18.array.exit.2                       # ir inst 60 fin
.F.performByzantineAgreement._17.array.body.2:
  add t4, t6, t5                                                        # ir inst 61 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 62 fin
  addi t4, t5, 1                                                        # ir inst 63 fin
# Phi connections
  mv t5, t4
  j .F.performByzantineAgreement._16.array.cond.2                       # ir inst 64 fin
.F.performByzantineAgreement._18.array.exit.2:
# Phi connections
  li t6, 0
  j .F.performByzantineAgreement._19.while.cond.2                       # ir inst 65 fin
.F.performByzantineAgreement._19.while.cond.2:
  slt t5, t6, a0                                                        # ir inst 67 fin
  bnez t5, .F.performByzantineAgreement._20.while.body.2
  j .F.performByzantineAgreement._24.while.exit.2                       # ir inst 68 fin
.F.performByzantineAgreement._20.while.body.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  mv a4, a1
  mv a3, a2
  addi t1, sp, 88
  mv a2, t1
  mv a1, a0
  mv a0, t6
  call .F.countValidSignatures
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 69 fin
  addi t4, a0, -1                                                       # ir inst 70 fin
  li t2, 3
  div t3, t4, t2                                                        # ir inst 71 fin
  sub t4, a0, t3                                                        # ir inst 72 fin
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 73 fin
  bnez t3, .F.performByzantineAgreement._21.if.then.1
  j .F.performByzantineAgreement._22.if.else.1                          # ir inst 74 fin
.F.performByzantineAgreement._21.if.then.1:
  mv t5, t6                                                             # ir inst 75 fin
  addi t1, sp, 312
  add t4, t1, t5                                                        # ir inst 76 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 77 fin
  j .F.performByzantineAgreement._23.if.exit.1                          # ir inst 78 fin
.F.performByzantineAgreement._22.if.else.1:
  j .F.performByzantineAgreement._23.if.exit.1                          # ir inst 79 fin
.F.performByzantineAgreement._23.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 80 fin
# Phi connections
  mv t6, t5
  j .F.performByzantineAgreement._19.while.cond.2                       # ir inst 81 fin
.F.performByzantineAgreement._24.while.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  addi t1, sp, 312
  mv a1, t1
  call .F.checkProposalAgreement
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 82 fin
  mv a0, t6
  j .F.performByzantineAgreement.epilogue                               # ir inst 83 fin
.F.performByzantineAgreement.epilogue:
  ld ra, 80(sp)
  ld s11, 64(sp)
  ld s10, 72(sp)
  addi sp, sp, 320
  ret

.globl .F.performNetworkPartitionTest
.F.performNetworkPartitionTest:
# spill func args num: 0,             range:      128(sp) -      128(sp)
# local var size: 84,                 range:       40(sp) -      124(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -128
  sd ra, 32(sp)
.F.performNetworkPartitionTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 25301
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 89
  addi t6, t1, 0                                                        # ir inst 4 fin
# Phi connections
  li t5, 0
  j .F.performNetworkPartitionTest._1.array.cond.0                      # ir inst 5 fin
.F.performNetworkPartitionTest._1.array.cond.0:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 7 fin
  bnez t4, .F.performNetworkPartitionTest._2.array.body.0
  j .F.performNetworkPartitionTest._3.array.exit.0                      # ir inst 8 fin
.F.performNetworkPartitionTest._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 9 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 10 fin
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, t4
  j .F.performNetworkPartitionTest._1.array.cond.0                      # ir inst 12 fin
.F.performNetworkPartitionTest._3.array.exit.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performNetworkPartitionTest._4.array.cond.1                      # ir inst 14 fin
.F.performNetworkPartitionTest._4.array.cond.1:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performNetworkPartitionTest._5.array.body.1
  j .F.performNetworkPartitionTest._6.array.exit.1                      # ir inst 17 fin
.F.performNetworkPartitionTest._5.array.body.1:
  li t1, 7
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 18 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 7
  addi t1, sp, 89
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performNetworkPartitionTest._4.array.cond.1                      # ir inst 21 fin
.F.performNetworkPartitionTest._6.array.exit.1:
  addi t1, sp, 96
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performNetworkPartitionTest._7.array.cond.2                      # ir inst 24 fin
.F.performNetworkPartitionTest._7.array.cond.2:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performNetworkPartitionTest._8.array.body.2
  j .F.performNetworkPartitionTest._9.array.exit.2                      # ir inst 27 fin
.F.performNetworkPartitionTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performNetworkPartitionTest._7.array.cond.2                      # ir inst 31 fin
.F.performNetworkPartitionTest._9.array.exit.2:
# Phi connections
  li t6, 0
  j .F.performNetworkPartitionTest._10.while.cond.0                     # ir inst 32 fin
.F.performNetworkPartitionTest._10.while.cond.0:
  li t2, 10
  slt t5, t6, t2                                                        # ir inst 34 fin
  bnez t5, .F.performNetworkPartitionTest._11.while.body.0
  j .F.performNetworkPartitionTest._18.while.exit.0                     # ir inst 35 fin
.F.performNetworkPartitionTest._11.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a3, t6
  addi t1, sp, 96
  mv a2, t1
  addi t1, sp, 40
  mv a1, t1
  call .F.createNetworkPartition
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 36 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 96
  mv a2, t1
  addi t1, sp, 40
  mv a1, t1
  call .F.testConsensusUnderPartition
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 37 fin
  bnez t5, .F.performNetworkPartitionTest._12.if.then.0
  j .F.performNetworkPartitionTest._13.if.else.0                        # ir inst 38 fin
.F.performNetworkPartitionTest._12.if.then.0:
  li t1, 25300
  add t5, t1, t6                                                        # ir inst 39 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 40 fin
  j .F.performNetworkPartitionTest._14.if.exit.0                        # ir inst 41 fin
.F.performNetworkPartitionTest._13.if.else.0:
  j .F.performNetworkPartitionTest._14.if.exit.0                        # ir inst 42 fin
.F.performNetworkPartitionTest._14.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 96
  mv a2, t1
  addi t1, sp, 40
  mv a1, t1
  call .F.healNetworkPartition
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 43 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 40
  mv a1, t1
  call .F.testPartitionRecovery
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 44 fin
  bnez t5, .F.performNetworkPartitionTest._15.if.then.1
  j .F.performNetworkPartitionTest._16.if.else.1                        # ir inst 45 fin
.F.performNetworkPartitionTest._15.if.then.1:
  li t1, 25310
  add t5, t1, t6                                                        # ir inst 46 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 47 fin
  j .F.performNetworkPartitionTest._17.if.exit.1                        # ir inst 48 fin
.F.performNetworkPartitionTest._16.if.else.1:
  j .F.performNetworkPartitionTest._17.if.exit.1                        # ir inst 49 fin
.F.performNetworkPartitionTest._17.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F.performNetworkPartitionTest._10.while.cond.0                     # ir inst 51 fin
.F.performNetworkPartitionTest._18.while.exit.0:
# Start call preparation
  li a0, 25399
  call printlnInt
# ir inst 52 fin
  j .F.performNetworkPartitionTest.epilogue                             # ir inst 53 fin
.F.performNetworkPartitionTest.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 128
  ret

.globl .F.createNetworkPartition
.F.createNetworkPartition:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       48(sp) -       48(sp)
# return addr size: 8,                range:       40(sp) -       48(sp)
# callee save reg num: 1 / 12,        range:       32(sp) -       40(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 32(sp)
  sd ra, 40(sp)
.F.createNetworkPartition._0.entry.0:
# Phi connections
  li t6, 0
  j .F.createNetworkPartition._1.while.cond.0                           # ir inst 1 fin
.F.createNetworkPartition._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.createNetworkPartition._2.while.body.0
  j .F.createNetworkPartition._6.while.exit.0                           # ir inst 4 fin
.F.createNetworkPartition._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.createNetworkPartition._3.while.cond.1                           # ir inst 5 fin
.F.createNetworkPartition._3.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 7 fin
  bnez t4, .F.createNetworkPartition._4.while.body.1
  j .F.createNetworkPartition._5.while.exit.1                           # ir inst 8 fin
.F.createNetworkPartition._4.while.body.1:
  mv t4, t6                                                             # ir inst 9 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 10 fin
  mv t4, t5                                                             # ir inst 11 fin
  add s11, t3, t4                                                       # ir inst 12 fin
  li t1, 0
  sb t1, 0(s11)                                                         # ir inst 13 fin
  addi t4, t5, 1                                                        # ir inst 14 fin
# Phi connections
  mv t5, t4
  j .F.createNetworkPartition._3.while.cond.1                           # ir inst 15 fin
.F.createNetworkPartition._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.createNetworkPartition._1.while.cond.0                           # ir inst 17 fin
.F.createNetworkPartition._6.while.exit.0:
  li t2, 3
  rem t6, a3, t2                                                        # ir inst 18 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 19 fin
  bnez t5, .F.createNetworkPartition._7.if.then.0
  j .F.createNetworkPartition._8.if.else.0                              # ir inst 20 fin
.F.createNetworkPartition._7.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  call .F.createBinaryPartition
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 21 fin
  j .F.createNetworkPartition._12.if.exit.0                             # ir inst 22 fin
.F.createNetworkPartition._8.if.else.0:
  li t2, 3
  rem t6, a3, t2                                                        # ir inst 23 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 24 fin
  bnez t5, .F.createNetworkPartition._9.if.then.1
  j .F.createNetworkPartition._10.if.else.1                             # ir inst 25 fin
.F.createNetworkPartition._9.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.createAsymmetricPartition
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 26 fin
  j .F.createNetworkPartition._11.if.exit.1                             # ir inst 27 fin
.F.createNetworkPartition._10.if.else.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.createMultiwayPartition
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 28 fin
  j .F.createNetworkPartition._11.if.exit.1                             # ir inst 29 fin
.F.createNetworkPartition._11.if.exit.1:
  j .F.createNetworkPartition._12.if.exit.0                             # ir inst 30 fin
.F.createNetworkPartition._12.if.exit.0:
  j .F.createNetworkPartition.epilogue                                  # ir inst 31 fin
.F.createNetworkPartition.epilogue:
  ld ra, 40(sp)
  ld s11, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.performLeaderElectionTest
.F.performLeaderElectionTest:
# spill func args num: 0,             range:      192(sp) -      192(sp)
# local var size: 140,                range:       40(sp) -      180(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -192
  sd ra, 32(sp)
.F.performLeaderElectionTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  li a0, 25401
  call printlnInt
  ld a0, 0(sp)
# ir inst 1 fin
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performLeaderElectionTest._1.array.cond.0                        # ir inst 4 fin
.F.performLeaderElectionTest._1.array.cond.0:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performLeaderElectionTest._2.array.body.0
  j .F.performLeaderElectionTest._3.array.exit.0                        # ir inst 7 fin
.F.performLeaderElectionTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performLeaderElectionTest._1.array.cond.0                        # ir inst 11 fin
.F.performLeaderElectionTest._3.array.exit.0:
  addi t1, sp, 68
  addi t6, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t5, 0
  j .F.performLeaderElectionTest._4.array.cond.1                        # ir inst 14 fin
.F.performLeaderElectionTest._4.array.cond.1:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 16 fin
  bnez t4, .F.performLeaderElectionTest._5.array.body.1
  j .F.performLeaderElectionTest._6.array.exit.1                        # ir inst 17 fin
.F.performLeaderElectionTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 18 fin
  li t1, 100
  sw t1, 0(t4)                                                          # ir inst 19 fin
  addi t4, t5, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  j .F.performLeaderElectionTest._4.array.cond.1                        # ir inst 21 fin
.F.performLeaderElectionTest._6.array.exit.1:
  addi t1, sp, 96
  addi t6, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t5, 0
  j .F.performLeaderElectionTest._7.array.cond.2                        # ir inst 24 fin
.F.performLeaderElectionTest._7.array.cond.2:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 26 fin
  bnez t4, .F.performLeaderElectionTest._8.array.body.2
  j .F.performLeaderElectionTest._9.array.exit.2                        # ir inst 27 fin
.F.performLeaderElectionTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 28 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 29 fin
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.performLeaderElectionTest._7.array.cond.2                        # ir inst 31 fin
.F.performLeaderElectionTest._9.array.exit.2:
  addi t1, sp, 173
  addi t6, t1, 0                                                        # ir inst 34 fin
# Phi connections
  li t5, 0
  j .F.performLeaderElectionTest._10.array.cond.3                       # ir inst 35 fin
.F.performLeaderElectionTest._10.array.cond.3:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 37 fin
  bnez t4, .F.performLeaderElectionTest._11.array.body.3
  j .F.performLeaderElectionTest._12.array.exit.3                       # ir inst 38 fin
.F.performLeaderElectionTest._11.array.body.3:
  add t4, t6, t5                                                        # ir inst 39 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 40 fin
  addi t4, t5, 1                                                        # ir inst 41 fin
# Phi connections
  mv t5, t4
  j .F.performLeaderElectionTest._10.array.cond.3                       # ir inst 42 fin
.F.performLeaderElectionTest._12.array.exit.3:
  addi t1, sp, 124
  addi t6, t1, 0                                                        # ir inst 43 fin
# Phi connections
  li t5, 0
  j .F.performLeaderElectionTest._13.array.cond.4                       # ir inst 44 fin
.F.performLeaderElectionTest._13.array.cond.4:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 46 fin
  bnez t4, .F.performLeaderElectionTest._14.array.body.4
  j .F.performLeaderElectionTest._15.array.exit.4                       # ir inst 47 fin
.F.performLeaderElectionTest._14.array.body.4:
  li t1, 7
  mul t2, t5, t1
  add t4, t6, t2                                                        # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 7
  addi t1, sp, 173
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 49 fin
  addi t4, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t4
  j .F.performLeaderElectionTest._13.array.cond.4                       # ir inst 51 fin
.F.performLeaderElectionTest._15.array.exit.4:
# Phi connections
  li t6, 0
  j .F.performLeaderElectionTest._16.while.cond.0                       # ir inst 52 fin
.F.performLeaderElectionTest._16.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 54 fin
  bnez t5, .F.performLeaderElectionTest._17.while.body.0
  j .F.performLeaderElectionTest._18.while.exit.0                       # ir inst 55 fin
.F.performLeaderElectionTest._17.while.body.0:
  mv t5, t6                                                             # ir inst 56 fin
  slli t2, t5, 2
  addi t1, sp, 40
  add t4, t1, t2                                                        # ir inst 57 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.generateNodePriority
  mv t5, a0
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 58 fin
  sw t5, 0(t4)                                                          # ir inst 59 fin
  addi t5, t6, 1                                                        # ir inst 60 fin
# Phi connections
  mv t6, t5
  j .F.performLeaderElectionTest._16.while.cond.0                       # ir inst 61 fin
.F.performLeaderElectionTest._18.while.exit.0:
# Phi connections
  li t6, 0
  j .F.performLeaderElectionTest._19.while.cond.1                       # ir inst 62 fin
.F.performLeaderElectionTest._19.while.cond.1:
  li t2, 15
  slt t5, t6, t2                                                        # ir inst 64 fin
  bnez t5, .F.performLeaderElectionTest._20.while.body.1
  j .F.performLeaderElectionTest._27.while.exit.1                       # ir inst 65 fin
.F.performLeaderElectionTest._20.while.body.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a2, t6
  addi t1, sp, 68
  mv a1, t1
  call .F.simulateNodeFailures
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 66 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 124
  mv a2, t1
  addi t1, sp, 68
  mv a1, t1
  call .F.updateFailureDetectors
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 67 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 96
  mv a4, t1
  addi t1, sp, 124
  mv a3, t1
  addi t1, sp, 68
  mv a2, t1
  addi t1, sp, 40
  mv a1, t1
  call .F.conductFailureAwareElection
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 68 fin
  li t2, 0
  slt t0, t5, t2
  xori t4, t0, 1                                                        # ir inst 69 fin
  bnez t4, .F.performLeaderElectionTest._21.if.then.0
  j .F.performLeaderElectionTest._25.if.else.0                          # ir inst 70 fin
.F.performLeaderElectionTest._21.if.then.0:
  li t1, 25400
  add t4, t1, t5                                                        # ir inst 71 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call printlnInt
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 72 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  addi t1, sp, 124
  mv a3, t1
  addi t1, sp, 68
  mv a2, t1
  mv a1, a0
  mv a0, t5
  call .F.testLeadershipStability
  mv t4, a0
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 73 fin
  bnez t4, .F.performLeaderElectionTest._22.if.then.1
  j .F.performLeaderElectionTest._23.if.else.1                          # ir inst 74 fin
.F.performLeaderElectionTest._22.if.then.1:
  li t1, 25410
  add t5, t1, t6                                                        # ir inst 75 fin
# Start call preparation
  sd a0, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t5
  call printlnInt
  ld a0, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 76 fin
  j .F.performLeaderElectionTest._24.if.exit.1                          # ir inst 77 fin
.F.performLeaderElectionTest._23.if.else.1:
  j .F.performLeaderElectionTest._24.if.exit.1                          # ir inst 78 fin
.F.performLeaderElectionTest._24.if.exit.1:
  j .F.performLeaderElectionTest._26.if.exit.0                          # ir inst 79 fin
.F.performLeaderElectionTest._25.if.else.0:
  j .F.performLeaderElectionTest._26.if.exit.0                          # ir inst 80 fin
.F.performLeaderElectionTest._26.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  addi t1, sp, 68
  mv a1, t1
  call .F.simulateNodeRecovery
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 81 fin
  addi t5, t6, 1                                                        # ir inst 82 fin
# Phi connections
  mv t6, t5
  j .F.performLeaderElectionTest._19.while.cond.1                       # ir inst 83 fin
.F.performLeaderElectionTest._27.while.exit.1:
# Start call preparation
  li a0, 25499
  call printlnInt
# ir inst 84 fin
  j .F.performLeaderElectionTest.epilogue                               # ir inst 85 fin
.F.performLeaderElectionTest.epilogue:
  ld ra, 32(sp)
  addi sp, sp, 192
  ret

.globl .F.performAsynchronousConsensusTest
.F.performAsynchronousConsensusTest:
# spill func args num: 0,             range:    12544(sp) -    12544(sp)
# local var size: 12468,              range:       64(sp) -    12532(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 1 / 12,        range:       48(sp) -       56(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -12544
  add sp, sp, t0
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.performAsynchronousConsensusTest._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  li a0, 25501
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t5, 0
  j .F.performAsynchronousConsensusTest._1.array.cond.0                 # ir inst 4 fin
.F.performAsynchronousConsensusTest._1.array.cond.0:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
  bnez t4, .F.performAsynchronousConsensusTest._2.array.body.0
  j .F.performAsynchronousConsensusTest._3.array.exit.0                 # ir inst 7 fin
.F.performAsynchronousConsensusTest._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t5, 1                                                        # ir inst 10 fin
# Phi connections
  mv t5, t4
  j .F.performAsynchronousConsensusTest._1.array.cond.0                 # ir inst 11 fin
.F.performAsynchronousConsensusTest._3.array.exit.0:
# alloca %8
  li t2, 4064
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 13 fin
# alloca %9
  li t2, 4068
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 15 fin
# alloca %10
  li t2, 4072
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 17 fin
  li t1, 4076
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 19 fin
# Phi connections
  li t5, 0
  j .F.performAsynchronousConsensusTest._4.array.cond.1                 # ir inst 20 fin
.F.performAsynchronousConsensusTest._4.array.cond.1:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 22 fin
  bnez t4, .F.performAsynchronousConsensusTest._5.array.body.1
  j .F.performAsynchronousConsensusTest._6.array.exit.1                 # ir inst 23 fin
.F.performAsynchronousConsensusTest._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 25 fin
  addi t4, t5, 1                                                        # ir inst 26 fin
# Phi connections
  mv t5, t4
  j .F.performAsynchronousConsensusTest._4.array.cond.1                 # ir inst 27 fin
.F.performAsynchronousConsensusTest._6.array.exit.1:
  li t1, 8076
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 29 fin
# Phi connections
  li t5, 0
  j .F.performAsynchronousConsensusTest._7.array.cond.2                 # ir inst 30 fin
.F.performAsynchronousConsensusTest._7.array.cond.2:
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 32 fin
  bnez t4, .F.performAsynchronousConsensusTest._8.array.body.2
  j .F.performAsynchronousConsensusTest._9.array.exit.2                 # ir inst 33 fin
.F.performAsynchronousConsensusTest._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 34 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 35 fin
  addi t4, t5, 1                                                        # ir inst 36 fin
# Phi connections
  mv t5, t4
  j .F.performAsynchronousConsensusTest._7.array.cond.2                 # ir inst 37 fin
.F.performAsynchronousConsensusTest._9.array.exit.2:
  li t1, 12076
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 39 fin
# Phi connections
  li t5, 0
  j .F.performAsynchronousConsensusTest._10.array.cond.3                # ir inst 40 fin
.F.performAsynchronousConsensusTest._10.array.cond.3:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 42 fin
  bnez t4, .F.performAsynchronousConsensusTest._11.array.body.3
  j .F.performAsynchronousConsensusTest._12.array.exit.3                # ir inst 43 fin
.F.performAsynchronousConsensusTest._11.array.body.3:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 44 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 45 fin
  addi t4, t5, 1                                                        # ir inst 46 fin
# Phi connections
  mv t5, t4
  j .F.performAsynchronousConsensusTest._10.array.cond.3                # ir inst 47 fin
.F.performAsynchronousConsensusTest._12.array.exit.3:
  li t1, 12104
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 49 fin
# Phi connections
  li t5, 0
  j .F.performAsynchronousConsensusTest._13.array.cond.4                # ir inst 50 fin
.F.performAsynchronousConsensusTest._13.array.cond.4:
  li t2, 7
  slt t4, t5, t2                                                        # ir inst 52 fin
  bnez t4, .F.performAsynchronousConsensusTest._14.array.body.4
  j .F.performAsynchronousConsensusTest._15.array.exit.4                # ir inst 53 fin
.F.performAsynchronousConsensusTest._14.array.body.4:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 54 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 55 fin
  addi t4, t5, 1                                                        # ir inst 56 fin
# Phi connections
  mv t5, t4
  j .F.performAsynchronousConsensusTest._13.array.cond.4                # ir inst 57 fin
.F.performAsynchronousConsensusTest._15.array.exit.4:
  li t1, 12132
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 59 fin
# Phi connections
  li t5, 0
  j .F.performAsynchronousConsensusTest._16.array.cond.5                # ir inst 60 fin
.F.performAsynchronousConsensusTest._16.array.cond.5:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 62 fin
  bnez t4, .F.performAsynchronousConsensusTest._17.array.body.5
  j .F.performAsynchronousConsensusTest._18.array.exit.5                # ir inst 63 fin
.F.performAsynchronousConsensusTest._17.array.body.5:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 64 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 65 fin
  addi t4, t5, 1                                                        # ir inst 66 fin
# Phi connections
  mv t5, t4
  j .F.performAsynchronousConsensusTest._16.array.cond.5                # ir inst 67 fin
.F.performAsynchronousConsensusTest._18.array.exit.5:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.performAsynchronousConsensusTest._19.while.cond.0                # ir inst 68 fin
.F.performAsynchronousConsensusTest._19.while.cond.0:
  slt t4, t5, a1                                                        # ir inst 71 fin
  bnez t4, .F.performAsynchronousConsensusTest._20.lazy.then.0
  j .F.performAsynchronousConsensusTest._21.lazy.else.0                 # ir inst 72 fin
.F.performAsynchronousConsensusTest._20.lazy.then.0:
  li t2, 50
  slt t4, t6, t2                                                        # ir inst 73 fin
# Phi connections
  j .F.performAsynchronousConsensusTest._22.lazy.exit.0                 # ir inst 74 fin
.F.performAsynchronousConsensusTest._21.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.performAsynchronousConsensusTest._22.lazy.exit.0                 # ir inst 75 fin
.F.performAsynchronousConsensusTest._22.lazy.exit.0:
  bnez t4, .F.performAsynchronousConsensusTest._23.while.body.0
  j .F.performAsynchronousConsensusTest._30.while.exit.0                # ir inst 77 fin
.F.performAsynchronousConsensusTest._23.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a2, t5
  li t1, 12076
  add t1, sp, t1
  mv a1, t1
  call .F.generateAsyncProposals
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 78 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  sd t5, -8(sp)
  li t1, 4072
  add t1, sp, t1
  mv a7, t1
  li t1, 4068
  add t1, sp, t1
  mv a6, t1
  li t1, 4064
  add t1, sp, t1
  mv a5, t1
  li t1, 8076
  add t1, sp, t1
  mv a4, t1
  li t1, 4076
  add t1, sp, t1
  mv a3, t1
  addi t1, sp, 64
  mv a2, t1
  li t1, 12076
  add t1, sp, t1
  mv a1, t1
  call .F.enqueueProposalsWithDelays
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 79 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a7, t5
  li t1, 12104
  add t1, sp, t1
  mv a6, t1
  li t1, 4072
  add t1, sp, t1
  mv a5, t1
  li t1, 4068
  add t1, sp, t1
  mv a4, t1
  li t1, 4064
  add t1, sp, t1
  mv a3, t1
  li t1, 8076
  add t1, sp, t1
  mv a2, t1
  li t1, 4076
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 64
  mv a0, t1
  call .F.processAsyncMessages
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 80 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 81 fin
  bnez t3, .F.performAsynchronousConsensusTest._24.if.then.0
  j .F.performAsynchronousConsensusTest._28.if.else.0                   # ir inst 82 fin
.F.performAsynchronousConsensusTest._24.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 12104
  add t1, sp, t1
  mv a1, t1
  call .F.checkAsyncConsensus
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 83 fin
  bnez t4, .F.performAsynchronousConsensusTest._25.if.then.1
  j .F.performAsynchronousConsensusTest._26.if.else.1                   # ir inst 84 fin
.F.performAsynchronousConsensusTest._25.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li t1, 12104
  add t1, sp, t1
  mv a1, t1
  call .F.extractConsensusValue
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 85 fin
  mv t3, t6                                                             # ir inst 86 fin
  slli t2, t3, 2
  li t1, 12132
  add t1, sp, t1
  add s11, t1, t2                                                       # ir inst 87 fin
  sw t4, 0(s11)                                                         # ir inst 88 fin
  addi t4, t6, 1                                                        # ir inst 89 fin
  li t1, 25500
  add t3, t1, t4                                                        # ir inst 90 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, t3
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 91 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  li t1, 12104
  add t1, sp, t1
  mv a1, t1
  call .F.resetNodeDecisions
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 92 fin
# Phi connections
  j .F.performAsynchronousConsensusTest._27.if.exit.1                   # ir inst 93 fin
.F.performAsynchronousConsensusTest._26.if.else.1:
# Phi connections
  mv t4, t6
  j .F.performAsynchronousConsensusTest._27.if.exit.1                   # ir inst 94 fin
.F.performAsynchronousConsensusTest._27.if.exit.1:
# Phi connections
  j .F.performAsynchronousConsensusTest._29.if.exit.0                   # ir inst 96 fin
.F.performAsynchronousConsensusTest._28.if.else.0:
# Phi connections
  mv t4, t6
  j .F.performAsynchronousConsensusTest._29.if.exit.0                   # ir inst 97 fin
.F.performAsynchronousConsensusTest._29.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 99 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.performAsynchronousConsensusTest._19.while.cond.0                # ir inst 100 fin
.F.performAsynchronousConsensusTest._30.while.exit.0:
# Start call preparation
  sd t6, 0(sp)
  mv a1, t6
  li t1, 12132
  add t1, sp, t1
  mv a0, t1
  call .F.verifyConsensusHistory
  mv t5, a0
  ld t6, 0(sp)
# ir inst 101 fin
  bnez t5, .F.performAsynchronousConsensusTest._31.if.then.2
  j .F.performAsynchronousConsensusTest._32.if.else.2                   # ir inst 102 fin
.F.performAsynchronousConsensusTest._31.if.then.2:
# Start call preparation
  li a0, 25550
  call printlnInt
# ir inst 103 fin
  j .F.performAsynchronousConsensusTest._33.if.exit.2                   # ir inst 104 fin
.F.performAsynchronousConsensusTest._32.if.else.2:
  j .F.performAsynchronousConsensusTest._33.if.exit.2                   # ir inst 105 fin
.F.performAsynchronousConsensusTest._33.if.exit.2:
# Start call preparation
  li a0, 25599
  call printlnInt
# ir inst 106 fin
  j .F.performAsynchronousConsensusTest.epilogue                        # ir inst 107 fin
.F.performAsynchronousConsensusTest.epilogue:
  ld ra, 56(sp)
  ld s11, 48(sp)
  li t0, 12544
  add sp, sp, t0
  ret

.globl .F.findMaxTerm
.F.findMaxTerm:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.findMaxTerm._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.findMaxTerm._1.while.cond.0                                      # ir inst 1 fin
.F.findMaxTerm._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.findMaxTerm._2.while.body.0
  j .F.findMaxTerm._6.while.exit.0                                      # ir inst 5 fin
.F.findMaxTerm._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  slt t3, t5, t4                                                        # ir inst 9 fin
  bnez t3, .F.findMaxTerm._3.if.then.0
  j .F.findMaxTerm._4.if.else.0                                         # ir inst 10 fin
.F.findMaxTerm._3.if.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  j .F.findMaxTerm._5.if.exit.0                                         # ir inst 14 fin
.F.findMaxTerm._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.findMaxTerm._5.if.exit.0                                         # ir inst 15 fin
.F.findMaxTerm._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.findMaxTerm._1.while.cond.0                                      # ir inst 18 fin
.F.findMaxTerm._6.while.exit.0:
  mv a0, t5
  j .F.findMaxTerm.epilogue                                             # ir inst 19 fin
.F.findMaxTerm.epilogue:
  ret

.globl .F.shouldBecomeCandidate
.F.shouldBecomeCandidate:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.shouldBecomeCandidate._0.entry.0:
  li t2, 2
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.shouldBecomeCandidate._1.if.then.0
  j .F.shouldBecomeCandidate._2.if.else.0                               # ir inst 2 fin
.F.shouldBecomeCandidate._1.if.then.0:
  li a0, 0
  j .F.shouldBecomeCandidate.epilogue                                   # ir inst 3 fin
.F.shouldBecomeCandidate._2.if.else.0:
  j .F.shouldBecomeCandidate._3.if.exit.0                               # ir inst 4 fin
.F.shouldBecomeCandidate._3.if.exit.0:
  li t2, 17
  mul t6, a0, t2                                                        # ir inst 5 fin
  li t2, 7
  mul t5, a3, t2                                                        # ir inst 6 fin
  add t4, t6, t5                                                        # ir inst 7 fin
  li t2, 100
  rem t6, t4, t2                                                        # ir inst 8 fin
  li t2, 30
  slt t5, t6, t2                                                        # ir inst 9 fin
  mv a0, t5
  j .F.shouldBecomeCandidate.epilogue                                   # ir inst 10 fin
.F.shouldBecomeCandidate.epilogue:
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
  mv a0, t6
  j .F.abs.epilogue                                                     # ir inst 4 fin
.F.abs._2.if.else.0:
  j .F.abs._3.if.exit.0                                                 # ir inst 5 fin
.F.abs._3.if.exit.0:
  j .F.abs.epilogue                                                     # ir inst 6 fin
.F.abs.epilogue:
  ret

.globl .F.generateLogEntry
.F.generateLogEntry:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generateLogEntry._0.entry.0:
  li t2, 1000
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 10
  mul t5, a1, t2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  add t6, a0, a1                                                        # ir inst 4 fin
  li t2, 7
  rem t5, t6, t2                                                        # ir inst 5 fin
  add t6, t4, t5                                                        # ir inst 6 fin
  mv a0, t6
  j .F.generateLogEntry.epilogue                                        # ir inst 7 fin
.F.generateLogEntry.epilogue:
  ret

.globl .F.simulateNetworkReliability
.F.simulateNetworkReliability:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulateNetworkReliability._0.entry.0:
  li t2, 13
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 19
  mul t5, a1, t2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  li t2, 100
  rem t6, t4, t2                                                        # ir inst 4 fin
  li t2, 15
  slt t5, t2, t6                                                        # ir inst 5 fin
  mv a0, t5
  j .F.simulateNetworkReliability.epilogue                              # ir inst 6 fin
.F.simulateNetworkReliability.epilogue:
  ret

.globl .F.checkLogConsistency
.F.checkLogConsistency:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.checkLogConsistency._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t2, t6, 2
  add t5, a3, t2                                                        # ir inst 2 fin
  lw t6, 0(t5)                                                          # ir inst 3 fin
  mv t5, a0                                                             # ir inst 4 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 5 fin
  lw t5, 0(t4)                                                          # ir inst 6 fin
  slt t4, t5, t6                                                        # ir inst 7 fin
  bnez t4, .F.checkLogConsistency._1.if.then.0
  j .F.checkLogConsistency._2.if.else.0                                 # ir inst 8 fin
.F.checkLogConsistency._1.if.then.0:
  li a0, 0
  j .F.checkLogConsistency.epilogue                                     # ir inst 9 fin
.F.checkLogConsistency._2.if.else.0:
  j .F.checkLogConsistency._3.if.exit.0                                 # ir inst 10 fin
.F.checkLogConsistency._3.if.exit.0:
# Phi connections
  li t6, 0
  j .F.checkLogConsistency._4.while.cond.0                              # ir inst 11 fin
.F.checkLogConsistency._4.while.cond.0:
  mv t5, a1                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t4, a3, t2                                                        # ir inst 14 fin
  lw t5, 0(t4)                                                          # ir inst 15 fin
  slt t4, t6, t5                                                        # ir inst 16 fin
  bnez t4, .F.checkLogConsistency._5.while.body.0
  j .F.checkLogConsistency._9.while.exit.0                              # ir inst 17 fin
.F.checkLogConsistency._5.while.body.0:
  mv t5, a0                                                             # ir inst 18 fin
  li t1, 400
  mul t2, t5, t1
  add t4, a2, t2                                                        # ir inst 19 fin
  mv t5, t6                                                             # ir inst 20 fin
  slli t2, t5, 2
  add t3, t4, t2                                                        # ir inst 21 fin
  lw t5, 0(t3)                                                          # ir inst 22 fin
  mv t4, a1                                                             # ir inst 23 fin
  li t1, 400
  mul t2, t4, t1
  add t3, a2, t2                                                        # ir inst 24 fin
  mv t4, t6                                                             # ir inst 25 fin
  slli t2, t4, 2
  add s11, t3, t2                                                       # ir inst 26 fin
  lw t4, 0(s11)                                                         # ir inst 27 fin
  xor t0, t5, t4
  sltu t3, zero, t0                                                     # ir inst 28 fin
  bnez t3, .F.checkLogConsistency._6.if.then.1
  j .F.checkLogConsistency._7.if.else.1                                 # ir inst 29 fin
.F.checkLogConsistency._6.if.then.1:
  li a0, 0
  j .F.checkLogConsistency.epilogue                                     # ir inst 30 fin
.F.checkLogConsistency._7.if.else.1:
  j .F.checkLogConsistency._8.if.exit.1                                 # ir inst 31 fin
.F.checkLogConsistency._8.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t6, t5
  j .F.checkLogConsistency._4.while.cond.0                              # ir inst 33 fin
.F.checkLogConsistency._9.while.exit.0:
  li a0, 1
  j .F.checkLogConsistency.epilogue                                     # ir inst 34 fin
.F.checkLogConsistency.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.verifyLogConsistency
.F.verifyLogConsistency:
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
.F.verifyLogConsistency._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.verifyLogConsistency._1.if.then.0
  j .F.verifyLogConsistency._2.if.else.0                                # ir inst 2 fin
.F.verifyLogConsistency._1.if.then.0:
  li a0, 1
  j .F.verifyLogConsistency.epilogue                                    # ir inst 3 fin
.F.verifyLogConsistency._2.if.else.0:
  j .F.verifyLogConsistency._3.if.exit.0                                # ir inst 4 fin
.F.verifyLogConsistency._3.if.exit.0:
  addi t6, a2, 0                                                        # ir inst 5 fin
  lw t5, 0(t6)                                                          # ir inst 6 fin
# Phi connections
  li t6, 1
  j .F.verifyLogConsistency._4.while.cond.0                             # ir inst 7 fin
.F.verifyLogConsistency._4.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 9 fin
  bnez t4, .F.verifyLogConsistency._5.while.body.0
  j .F.verifyLogConsistency._9.while.exit.0                             # ir inst 10 fin
.F.verifyLogConsistency._5.while.body.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
  xor t0, t4, t5
  sltu t3, zero, t0                                                     # ir inst 14 fin
  bnez t3, .F.verifyLogConsistency._6.if.then.1
  j .F.verifyLogConsistency._7.if.else.1                                # ir inst 15 fin
.F.verifyLogConsistency._6.if.then.1:
  li a0, 0
  j .F.verifyLogConsistency.epilogue                                    # ir inst 16 fin
.F.verifyLogConsistency._7.if.else.1:
  j .F.verifyLogConsistency._8.if.exit.1                                # ir inst 17 fin
.F.verifyLogConsistency._8.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 18 fin
# Phi connections
  mv t6, t4
  j .F.verifyLogConsistency._4.while.cond.0                             # ir inst 19 fin
.F.verifyLogConsistency._9.while.exit.0:
# Phi connections
  li t6, 0
  j .F.verifyLogConsistency._10.while.cond.1                            # ir inst 20 fin
.F.verifyLogConsistency._10.while.cond.1:
  slt t4, t6, t5                                                        # ir inst 22 fin
  bnez t4, .F.verifyLogConsistency._11.while.body.1
  j .F.verifyLogConsistency._18.while.exit.1                            # ir inst 23 fin
.F.verifyLogConsistency._11.while.body.1:
  addi t4, a1, 0                                                        # ir inst 24 fin
  mv t3, t6                                                             # ir inst 25 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 26 fin
  lw t4, 0(s11)                                                         # ir inst 27 fin
# Phi connections
  li t3, 1
  j .F.verifyLogConsistency._12.while.cond.2                            # ir inst 28 fin
.F.verifyLogConsistency._12.while.cond.2:
  slt s11, t3, a0                                                       # ir inst 30 fin
  bnez s11, .F.verifyLogConsistency._13.while.body.2
  j .F.verifyLogConsistency._17.while.exit.2                            # ir inst 31 fin
.F.verifyLogConsistency._13.while.body.2:
  mv s11, t3                                                            # ir inst 32 fin
  li t1, 400
  mul t2, s11, t1
  add s10, a1, t2                                                       # ir inst 33 fin
  mv s11, t6                                                            # ir inst 34 fin
  slli t2, s11, 2
  add s9, s10, t2                                                       # ir inst 35 fin
  lw s11, 0(s9)                                                         # ir inst 36 fin
  xor t0, s11, t4
  sltu s10, zero, t0                                                    # ir inst 37 fin
  bnez s10, .F.verifyLogConsistency._14.if.then.2
  j .F.verifyLogConsistency._15.if.else.2                               # ir inst 38 fin
.F.verifyLogConsistency._14.if.then.2:
  li a0, 0
  j .F.verifyLogConsistency.epilogue                                    # ir inst 39 fin
.F.verifyLogConsistency._15.if.else.2:
  j .F.verifyLogConsistency._16.if.exit.2                               # ir inst 40 fin
.F.verifyLogConsistency._16.if.exit.2:
  addi s11, t3, 1                                                       # ir inst 41 fin
# Phi connections
  mv t3, s11
  j .F.verifyLogConsistency._12.while.cond.2                            # ir inst 42 fin
.F.verifyLogConsistency._17.while.exit.2:
  addi t4, t6, 1                                                        # ir inst 43 fin
# Phi connections
  mv t6, t4
  j .F.verifyLogConsistency._10.while.cond.1                            # ir inst 44 fin
.F.verifyLogConsistency._18.while.exit.1:
  li a0, 1
  j .F.verifyLogConsistency.epilogue                                    # ir inst 45 fin
.F.verifyLogConsistency.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.shouldBeByzantine
.F.shouldBeByzantine:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.shouldBeByzantine._0.entry.0:
  li t2, 23
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 7
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 2
  slt t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.shouldBeByzantine.epilogue                                       # ir inst 4 fin
.F.shouldBeByzantine.epilogue:
  ret

.globl .F.generateMaliciousValue
.F.generateMaliciousValue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generateMaliciousValue._0.entry.0:
  li t2, 100
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 10
  mul t5, a1, t2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  add t6, t4, a2                                                        # ir inst 4 fin
  li t2, 9999
  add t5, t6, t2                                                        # ir inst 5 fin
  mv a0, t5
  j .F.generateMaliciousValue.epilogue                                  # ir inst 6 fin
.F.generateMaliciousValue.epilogue:
  ret

.globl .F.generateHonestValue
.F.generateHonestValue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generateHonestValue._0.entry.0:
  li t2, 42
  mul t6, a1, t2                                                        # ir inst 1 fin
  addi t5, t6, 1000                                                     # ir inst 2 fin
  mv a0, t5
  j .F.generateHonestValue.epilogue                                     # ir inst 3 fin
.F.generateHonestValue.epilogue:
  ret

.globl .F.generateSignature
.F.generateSignature:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generateSignature._0.entry.0:
  li t2, 1000
  mul t6, a0, t2                                                        # ir inst 1 fin
  li t2, 100
  mul t5, a1, t2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  li t2, 100
  rem t6, a2, t2                                                        # ir inst 4 fin
  add t5, t4, t6                                                        # ir inst 5 fin
  li t2, 10
  rem t6, a3, t2                                                        # ir inst 6 fin
  add t4, t5, t6                                                        # ir inst 7 fin
  mv a0, t4
  j .F.generateSignature.epilogue                                       # ir inst 8 fin
.F.generateSignature.epilogue:
  ret

.globl .F.corruptSignature
.F.corruptSignature:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.corruptSignature._0.entry.0:
  li t2, 7
  mul t6, a1, t2                                                        # ir inst 1 fin
  li t2, 11
  mul t5, a2, t2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  li t2, 1000
  rem t6, t4, t2                                                        # ir inst 4 fin
  add t5, a0, t6                                                        # ir inst 5 fin
  mv a0, t5
  j .F.corruptSignature.epilogue                                        # ir inst 6 fin
.F.corruptSignature.epilogue:
  ret

.globl .F.countValidSignatures
.F.countValidSignatures:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 2 / 12,        range:       72(sp) -       88(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s10, 72(sp)
  sd s11, 80(sp)
  sd ra, 88(sp)
.F.countValidSignatures._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.countValidSignatures._1.while.cond.0                             # ir inst 1 fin
.F.countValidSignatures._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.countValidSignatures._2.while.body.0
  j .F.countValidSignatures._9.while.exit.0                             # ir inst 5 fin
.F.countValidSignatures._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  add t3, a4, t4                                                        # ir inst 7 fin
  lb t4, 0(t3)                                                          # ir inst 8 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.countValidSignatures._3.if.then.0
  j .F.countValidSignatures._7.if.else.0                                # ir inst 10 fin
.F.countValidSignatures._3.if.then.0:
  mv t4, a0                                                             # ir inst 11 fin
  li t1, 12
  mul t2, t4, t1
  add t3, a3, t2                                                        # ir inst 12 fin
  addi t4, t3, 0                                                        # ir inst 13 fin
  lw t3, 0(t4)                                                          # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  li a3, 0
  mv a2, t3
  mv a1, a0
  mv a0, t6
  call .F.generateSignature
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 15 fin
  mv t3, t6                                                             # ir inst 16 fin
  li t1, 28
  mul t2, t3, t1
  add s11, a2, t2                                                       # ir inst 17 fin
  mv t3, a0                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s10, s11, t2                                                      # ir inst 19 fin
  lw t3, 0(s10)                                                         # ir inst 20 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t3, 40(sp)
  sd t4, 48(sp)
  sd t5, 56(sp)
  sd t6, 64(sp)
  mv a1, t4
  mv a0, t3
  call .F.verifySignature
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t3, 40(sp)
  ld t4, 48(sp)
  ld t5, 56(sp)
  ld t6, 64(sp)
# ir inst 21 fin
  bnez s11, .F.countValidSignatures._4.if.then.1
  j .F.countValidSignatures._5.if.else.1                                # ir inst 22 fin
.F.countValidSignatures._4.if.then.1:
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  j .F.countValidSignatures._6.if.exit.1                                # ir inst 24 fin
.F.countValidSignatures._5.if.else.1:
# Phi connections
  mv t4, t5
  j .F.countValidSignatures._6.if.exit.1                                # ir inst 25 fin
.F.countValidSignatures._6.if.exit.1:
# Phi connections
  j .F.countValidSignatures._8.if.exit.0                                # ir inst 27 fin
.F.countValidSignatures._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.countValidSignatures._8.if.exit.0                                # ir inst 28 fin
.F.countValidSignatures._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.countValidSignatures._1.while.cond.0                             # ir inst 31 fin
.F.countValidSignatures._9.while.exit.0:
  mv a0, t5
  j .F.countValidSignatures.epilogue                                    # ir inst 32 fin
.F.countValidSignatures.epilogue:
  ld ra, 88(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.verifySignature
.F.verifySignature:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.verifySignature._0.entry.0:
  sub t6, a0, a1                                                        # ir inst 1 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.abs
  mv t5, a0
  ld t6, 0(sp)
# ir inst 2 fin
  li t2, 100
  slt t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.verifySignature.epilogue                                         # ir inst 4 fin
.F.verifySignature.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.checkProposalAgreement
.F.checkProposalAgreement:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.checkProposalAgreement._0.entry.0:
# Phi connections
  li t4, -1
  li t5, 0
  li t6, 0
  j .F.checkProposalAgreement._1.while.cond.0                           # ir inst 1 fin
.F.checkProposalAgreement._1.while.cond.0:
  slt t3, t6, a0                                                        # ir inst 5 fin
  bnez t3, .F.checkProposalAgreement._2.while.body.0
  j .F.checkProposalAgreement._12.while.exit.0                          # ir inst 6 fin
.F.checkProposalAgreement._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  add s11, a1, t3                                                       # ir inst 8 fin
  lb t3, 0(s11)                                                         # ir inst 9 fin
  bnez t3, .F.checkProposalAgreement._3.if.then.0
  j .F.checkProposalAgreement._10.if.else.0                             # ir inst 10 fin
.F.checkProposalAgreement._3.if.then.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 11 fin
  bnez t3, .F.checkProposalAgreement._4.if.then.1
  j .F.checkProposalAgreement._5.if.else.1                              # ir inst 12 fin
.F.checkProposalAgreement._4.if.then.1:
  mv t3, t6                                                             # ir inst 13 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a2, t2                                                       # ir inst 14 fin
  addi t3, s11, 0                                                       # ir inst 15 fin
  lw s11, 0(t3)                                                         # ir inst 16 fin
# Phi connections
  li t3, 1
  j .F.checkProposalAgreement._9.if.exit.1                              # ir inst 17 fin
.F.checkProposalAgreement._5.if.else.1:
  mv t3, t6                                                             # ir inst 18 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a2, t2                                                       # ir inst 19 fin
  addi t3, s11, 0                                                       # ir inst 20 fin
  lw s11, 0(t3)                                                         # ir inst 21 fin
  xor t0, s11, t4
  sltu t3, zero, t0                                                     # ir inst 22 fin
  bnez t3, .F.checkProposalAgreement._6.if.then.2
  j .F.checkProposalAgreement._7.if.else.2                              # ir inst 23 fin
.F.checkProposalAgreement._6.if.then.2:
  li a0, 0
  j .F.checkProposalAgreement.epilogue                                  # ir inst 24 fin
.F.checkProposalAgreement._7.if.else.2:
  j .F.checkProposalAgreement._8.if.exit.2                              # ir inst 25 fin
.F.checkProposalAgreement._8.if.exit.2:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.checkProposalAgreement._9.if.exit.1                              # ir inst 26 fin
.F.checkProposalAgreement._9.if.exit.1:
# Phi connections
  mv t4, t3
  mv t3, s11
  j .F.checkProposalAgreement._11.if.exit.0                             # ir inst 29 fin
.F.checkProposalAgreement._10.if.else.0:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.checkProposalAgreement._11.if.exit.0                             # ir inst 30 fin
.F.checkProposalAgreement._11.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 33 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.checkProposalAgreement._1.while.cond.0                           # ir inst 34 fin
.F.checkProposalAgreement._12.while.exit.0:
  mv a0, t5
  j .F.checkProposalAgreement.epilogue                                  # ir inst 35 fin
.F.checkProposalAgreement.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.verifyHonestNodeAgreement
.F.verifyHonestNodeAgreement:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.verifyHonestNodeAgreement._0.entry.0:
# Phi connections
  li t4, -1
  li t5, 0
  li t6, 0
  j .F.verifyHonestNodeAgreement._1.while.cond.0                        # ir inst 1 fin
.F.verifyHonestNodeAgreement._1.while.cond.0:
  slt t3, t6, a0                                                        # ir inst 5 fin
  bnez t3, .F.verifyHonestNodeAgreement._2.while.body.0
  j .F.verifyHonestNodeAgreement._12.while.exit.0                       # ir inst 6 fin
.F.verifyHonestNodeAgreement._2.while.body.0:
  mv t3, t6                                                             # ir inst 7 fin
  add s11, a1, t3                                                       # ir inst 8 fin
  lb t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 10 fin
  bnez s11, .F.verifyHonestNodeAgreement._3.if.then.0
  j .F.verifyHonestNodeAgreement._10.if.else.0                          # ir inst 11 fin
.F.verifyHonestNodeAgreement._3.if.then.0:
  li t2, 0
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 12 fin
  bnez t3, .F.verifyHonestNodeAgreement._4.if.then.1
  j .F.verifyHonestNodeAgreement._5.if.else.1                           # ir inst 13 fin
.F.verifyHonestNodeAgreement._4.if.then.1:
  mv t3, t6                                                             # ir inst 14 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a2, t2                                                       # ir inst 15 fin
  addi t3, s11, 0                                                       # ir inst 16 fin
  lw s11, 0(t3)                                                         # ir inst 17 fin
# Phi connections
  li t3, 1
  j .F.verifyHonestNodeAgreement._9.if.exit.1                           # ir inst 18 fin
.F.verifyHonestNodeAgreement._5.if.else.1:
  mv t3, t6                                                             # ir inst 19 fin
  li t1, 12
  mul t2, t3, t1
  add s11, a2, t2                                                       # ir inst 20 fin
  addi t3, s11, 0                                                       # ir inst 21 fin
  lw s11, 0(t3)                                                         # ir inst 22 fin
  xor t0, s11, t4
  sltu t3, zero, t0                                                     # ir inst 23 fin
  bnez t3, .F.verifyHonestNodeAgreement._6.if.then.2
  j .F.verifyHonestNodeAgreement._7.if.else.2                           # ir inst 24 fin
.F.verifyHonestNodeAgreement._6.if.then.2:
  li a0, 0
  j .F.verifyHonestNodeAgreement.epilogue                               # ir inst 25 fin
.F.verifyHonestNodeAgreement._7.if.else.2:
  j .F.verifyHonestNodeAgreement._8.if.exit.2                           # ir inst 26 fin
.F.verifyHonestNodeAgreement._8.if.exit.2:
# Phi connections
  mv s11, t4
  mv t3, t5
  j .F.verifyHonestNodeAgreement._9.if.exit.1                           # ir inst 27 fin
.F.verifyHonestNodeAgreement._9.if.exit.1:
# Phi connections
  mv t4, t3
  mv t3, s11
  j .F.verifyHonestNodeAgreement._11.if.exit.0                          # ir inst 30 fin
.F.verifyHonestNodeAgreement._10.if.else.0:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.verifyHonestNodeAgreement._11.if.exit.0                          # ir inst 31 fin
.F.verifyHonestNodeAgreement._11.if.exit.0:
  addi s11, t6, 1                                                       # ir inst 34 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.verifyHonestNodeAgreement._1.while.cond.0                        # ir inst 35 fin
.F.verifyHonestNodeAgreement._12.while.exit.0:
  mv a0, t5
  j .F.verifyHonestNodeAgreement.epilogue                               # ir inst 36 fin
.F.verifyHonestNodeAgreement.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.createBinaryPartition
.F.createBinaryPartition:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.createBinaryPartition._0.entry.0:
  li t2, 2
  div t6, a0, t2                                                        # ir inst 1 fin
# Phi connections
  li t5, 0
  j .F.createBinaryPartition._1.while.cond.0                            # ir inst 2 fin
.F.createBinaryPartition._1.while.cond.0:
  slt t4, t5, a0                                                        # ir inst 4 fin
  bnez t4, .F.createBinaryPartition._2.while.body.0
  j .F.createBinaryPartition._6.while.exit.0                            # ir inst 5 fin
.F.createBinaryPartition._2.while.body.0:
  slt t4, t5, t6                                                        # ir inst 6 fin
  bnez t4, .F.createBinaryPartition._3.if.then.0
  j .F.createBinaryPartition._4.if.else.0                               # ir inst 7 fin
.F.createBinaryPartition._3.if.then.0:
  mv t4, t5                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 9 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 10 fin
  j .F.createBinaryPartition._5.if.exit.0                               # ir inst 11 fin
.F.createBinaryPartition._4.if.else.0:
  mv t4, t5                                                             # ir inst 12 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 13 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 14 fin
  j .F.createBinaryPartition._5.if.exit.0                               # ir inst 15 fin
.F.createBinaryPartition._5.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.createBinaryPartition._1.while.cond.0                            # ir inst 17 fin
.F.createBinaryPartition._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.updateConnectivityMatrix
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 18 fin
  j .F.createBinaryPartition.epilogue                                   # ir inst 19 fin
.F.createBinaryPartition.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.createAsymmetricPartition
.F.createAsymmetricPartition:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.createAsymmetricPartition._0.entry.0:
  slli t6, a0, 1                                                        # ir inst 1 fin
  li t2, 3
  div t5, t6, t2                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.createAsymmetricPartition._1.while.cond.0                        # ir inst 3 fin
.F.createAsymmetricPartition._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 5 fin
  bnez t4, .F.createAsymmetricPartition._2.while.body.0
  j .F.createAsymmetricPartition._6.while.exit.0                        # ir inst 6 fin
.F.createAsymmetricPartition._2.while.body.0:
  slt t4, t6, t5                                                        # ir inst 7 fin
  bnez t4, .F.createAsymmetricPartition._3.if.then.0
  j .F.createAsymmetricPartition._4.if.else.0                           # ir inst 8 fin
.F.createAsymmetricPartition._3.if.then.0:
  mv t4, t6                                                             # ir inst 9 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 10 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 11 fin
  j .F.createAsymmetricPartition._5.if.exit.0                           # ir inst 12 fin
.F.createAsymmetricPartition._4.if.else.0:
  mv t4, t6                                                             # ir inst 13 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 14 fin
  li t1, 1
  sw t1, 0(t3)                                                          # ir inst 15 fin
  j .F.createAsymmetricPartition._5.if.exit.0                           # ir inst 16 fin
.F.createAsymmetricPartition._5.if.exit.0:
  addi t4, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t4
  j .F.createAsymmetricPartition._1.while.cond.0                        # ir inst 18 fin
.F.createAsymmetricPartition._6.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.updateConnectivityMatrix
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 19 fin
  j .F.createAsymmetricPartition.epilogue                               # ir inst 20 fin
.F.createAsymmetricPartition.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.createMultiwayPartition
.F.createMultiwayPartition:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.createMultiwayPartition._0.entry.0:
# Phi connections
  li t6, 0
  j .F.createMultiwayPartition._1.while.cond.0                          # ir inst 1 fin
.F.createMultiwayPartition._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.createMultiwayPartition._2.while.body.0
  j .F.createMultiwayPartition._3.while.exit.0                          # ir inst 4 fin
.F.createMultiwayPartition._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 6 fin
  li t2, 3
  rem t5, t6, t2                                                        # ir inst 7 fin
  sw t5, 0(t4)                                                          # ir inst 8 fin
  addi t5, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.createMultiwayPartition._1.while.cond.0                          # ir inst 10 fin
.F.createMultiwayPartition._3.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.updateConnectivityMatrix
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 11 fin
  j .F.createMultiwayPartition.epilogue                                 # ir inst 12 fin
.F.createMultiwayPartition.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.updateConnectivityMatrix
.F.updateConnectivityMatrix:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
  sd s10, 8(sp)
.F.updateConnectivityMatrix._0.entry.0:
# Phi connections
  li t6, 0
  j .F.updateConnectivityMatrix._1.while.cond.0                         # ir inst 1 fin
.F.updateConnectivityMatrix._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.updateConnectivityMatrix._2.while.body.0
  j .F.updateConnectivityMatrix._9.while.exit.0                         # ir inst 4 fin
.F.updateConnectivityMatrix._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.updateConnectivityMatrix._3.while.cond.1                         # ir inst 5 fin
.F.updateConnectivityMatrix._3.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 7 fin
  bnez t4, .F.updateConnectivityMatrix._4.while.body.1
  j .F.updateConnectivityMatrix._8.while.exit.1                         # ir inst 8 fin
.F.updateConnectivityMatrix._4.while.body.1:
  xor t0, t6, t5
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F.updateConnectivityMatrix._5.if.then.0
  j .F.updateConnectivityMatrix._6.if.else.0                            # ir inst 10 fin
.F.updateConnectivityMatrix._5.if.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  add s11, t3, t4                                                       # ir inst 14 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 15 fin
  j .F.updateConnectivityMatrix._7.if.exit.0                            # ir inst 16 fin
.F.updateConnectivityMatrix._6.if.else.0:
  mv t4, t6                                                             # ir inst 17 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 18 fin
  mv t4, t5                                                             # ir inst 19 fin
  add s11, t3, t4                                                       # ir inst 20 fin
  mv t4, t6                                                             # ir inst 21 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 22 fin
  lw t4, 0(t3)                                                          # ir inst 23 fin
  mv t3, t5                                                             # ir inst 24 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 25 fin
  lw t3, 0(s10)                                                         # ir inst 26 fin
  xor t0, t4, t3
  sltiu s10, t0, 1                                                      # ir inst 27 fin
  sb s10, 0(s11)                                                        # ir inst 28 fin
  j .F.updateConnectivityMatrix._7.if.exit.0                            # ir inst 29 fin
.F.updateConnectivityMatrix._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  j .F.updateConnectivityMatrix._3.while.cond.1                         # ir inst 31 fin
.F.updateConnectivityMatrix._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 32 fin
# Phi connections
  mv t6, t5
  j .F.updateConnectivityMatrix._1.while.cond.0                         # ir inst 33 fin
.F.updateConnectivityMatrix._9.while.exit.0:
  j .F.updateConnectivityMatrix.epilogue                                # ir inst 34 fin
.F.updateConnectivityMatrix.epilogue:
  ld s11, 0(sp)
  ld s10, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.testConsensusUnderPartition
.F.testConsensusUnderPartition:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 0 / 12,        range:       48(sp) -       48(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd ra, 48(sp)
.F.testConsensusUnderPartition._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a1, a2
  call .F.findMaxPartitionId
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
# Phi connections
  li t5, 0
  j .F.testConsensusUnderPartition._1.while.cond.0                      # ir inst 2 fin
.F.testConsensusUnderPartition._1.while.cond.0:
  slt t0, t6, t5
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.testConsensusUnderPartition._2.while.body.0
  j .F.testConsensusUnderPartition._9.while.exit.0                      # ir inst 5 fin
.F.testConsensusUnderPartition._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a1, a2
  mv a2, t5
  call .F.countPartitionSize
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 6 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 7 fin
  bnez t3, .F.testConsensusUnderPartition._3.if.then.0
  j .F.testConsensusUnderPartition._7.if.else.0                         # ir inst 8 fin
.F.testConsensusUnderPartition._3.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a3, a1
  mv a1, a2
  mv a2, t5
  call .F.testPartitionInternalConsensus
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 9 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 10 fin
  bnez t3, .F.testConsensusUnderPartition._4.if.then.1
  j .F.testConsensusUnderPartition._5.if.else.1                         # ir inst 11 fin
.F.testConsensusUnderPartition._4.if.then.1:
  li a0, 0
  j .F.testConsensusUnderPartition.epilogue                             # ir inst 12 fin
.F.testConsensusUnderPartition._5.if.else.1:
  j .F.testConsensusUnderPartition._6.if.exit.1                         # ir inst 13 fin
.F.testConsensusUnderPartition._6.if.exit.1:
  j .F.testConsensusUnderPartition._8.if.exit.0                         # ir inst 14 fin
.F.testConsensusUnderPartition._7.if.else.0:
  j .F.testConsensusUnderPartition._8.if.exit.0                         # ir inst 15 fin
.F.testConsensusUnderPartition._8.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 16 fin
# Phi connections
  mv t5, t4
  j .F.testConsensusUnderPartition._1.while.cond.0                      # ir inst 17 fin
.F.testConsensusUnderPartition._9.while.exit.0:
  li a0, 1
  j .F.testConsensusUnderPartition.epilogue                             # ir inst 18 fin
.F.testConsensusUnderPartition.epilogue:
  ld ra, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.healNetworkPartition
.F.healNetworkPartition:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.healNetworkPartition._0.entry.0:
# Phi connections
  li t6, 0
  j .F.healNetworkPartition._1.while.cond.0                             # ir inst 1 fin
.F.healNetworkPartition._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.healNetworkPartition._2.while.body.0
  j .F.healNetworkPartition._6.while.exit.0                             # ir inst 4 fin
.F.healNetworkPartition._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
# Phi connections
  li t5, 0
  j .F.healNetworkPartition._3.while.cond.1                             # ir inst 8 fin
.F.healNetworkPartition._3.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 10 fin
  bnez t4, .F.healNetworkPartition._4.while.body.1
  j .F.healNetworkPartition._5.while.exit.1                             # ir inst 11 fin
.F.healNetworkPartition._4.while.body.1:
  mv t4, t6                                                             # ir inst 12 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 13 fin
  mv t4, t5                                                             # ir inst 14 fin
  add s11, t3, t4                                                       # ir inst 15 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 16 fin
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  j .F.healNetworkPartition._3.while.cond.1                             # ir inst 18 fin
.F.healNetworkPartition._5.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 19 fin
# Phi connections
  mv t6, t5
  j .F.healNetworkPartition._1.while.cond.0                             # ir inst 20 fin
.F.healNetworkPartition._6.while.exit.0:
  j .F.healNetworkPartition.epilogue                                    # ir inst 21 fin
.F.healNetworkPartition.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.testPartitionRecovery
.F.testPartitionRecovery:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.testPartitionRecovery._0.entry.0:
# Phi connections
  li t6, 0
  j .F.testPartitionRecovery._1.while.cond.0                            # ir inst 1 fin
.F.testPartitionRecovery._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.testPartitionRecovery._2.while.body.0
  j .F.testPartitionRecovery._9.while.exit.0                            # ir inst 4 fin
.F.testPartitionRecovery._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.testPartitionRecovery._3.while.cond.1                            # ir inst 5 fin
.F.testPartitionRecovery._3.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 7 fin
  bnez t4, .F.testPartitionRecovery._4.while.body.1
  j .F.testPartitionRecovery._8.while.exit.1                            # ir inst 8 fin
.F.testPartitionRecovery._4.while.body.1:
  mv t4, t6                                                             # ir inst 9 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a1, t2                                                        # ir inst 10 fin
  mv t4, t5                                                             # ir inst 11 fin
  add s11, t3, t4                                                       # ir inst 12 fin
  lb t4, 0(s11)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 14 fin
  bnez t3, .F.testPartitionRecovery._5.if.then.0
  j .F.testPartitionRecovery._6.if.else.0                               # ir inst 15 fin
.F.testPartitionRecovery._5.if.then.0:
  li a0, 0
  j .F.testPartitionRecovery.epilogue                                   # ir inst 16 fin
.F.testPartitionRecovery._6.if.else.0:
  j .F.testPartitionRecovery._7.if.exit.0                               # ir inst 17 fin
.F.testPartitionRecovery._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 18 fin
# Phi connections
  mv t5, t4
  j .F.testPartitionRecovery._3.while.cond.1                            # ir inst 19 fin
.F.testPartitionRecovery._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.testPartitionRecovery._1.while.cond.0                            # ir inst 21 fin
.F.testPartitionRecovery._9.while.exit.0:
  li a0, 1
  j .F.testPartitionRecovery.epilogue                                   # ir inst 22 fin
.F.testPartitionRecovery.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.generateNodePriority
.F.generateNodePriority:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generateNodePriority._0.entry.0:
  li t2, 147
  mul t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 73                                                       # ir inst 2 fin
  li t2, 1000
  rem t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.generateNodePriority.epilogue                                    # ir inst 4 fin
.F.generateNodePriority.epilogue:
  ret

.globl .F.simulateNodeFailures
.F.simulateNodeFailures:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulateNodeFailures._0.entry.0:
# Phi connections
  li t6, 0
  j .F.simulateNodeFailures._1.while.cond.0                             # ir inst 1 fin
.F.simulateNodeFailures._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.simulateNodeFailures._2.while.body.0
  j .F.simulateNodeFailures._9.while.exit.0                             # ir inst 4 fin
.F.simulateNodeFailures._2.while.body.0:
  li t2, 19
  mul t5, t6, t2                                                        # ir inst 5 fin
  li t2, 7
  mul t4, a2, t2                                                        # ir inst 6 fin
  add t3, t5, t4                                                        # ir inst 7 fin
  li t2, 100
  rem t5, t3, t2                                                        # ir inst 8 fin
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 9 fin
  bnez t4, .F.simulateNodeFailures._3.if.then.0
  j .F.simulateNodeFailures._7.if.else.0                                # ir inst 10 fin
.F.simulateNodeFailures._3.if.then.0:
  mv t5, t6                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 12 fin
  mv t5, t6                                                             # ir inst 13 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 14 fin
  lw t5, 0(t3)                                                          # ir inst 15 fin
  addi t3, t5, -25                                                      # ir inst 16 fin
  sw t3, 0(t4)                                                          # ir inst 17 fin
  mv t5, t6                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 19 fin
  lw t5, 0(t4)                                                          # ir inst 20 fin
  li t2, 0
  slt t4, t5, t2                                                        # ir inst 21 fin
  bnez t4, .F.simulateNodeFailures._4.if.then.1
  j .F.simulateNodeFailures._5.if.else.1                                # ir inst 22 fin
.F.simulateNodeFailures._4.if.then.1:
  mv t5, t6                                                             # ir inst 23 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 25 fin
  j .F.simulateNodeFailures._6.if.exit.1                                # ir inst 26 fin
.F.simulateNodeFailures._5.if.else.1:
  j .F.simulateNodeFailures._6.if.exit.1                                # ir inst 27 fin
.F.simulateNodeFailures._6.if.exit.1:
  j .F.simulateNodeFailures._8.if.exit.0                                # ir inst 28 fin
.F.simulateNodeFailures._7.if.else.0:
  j .F.simulateNodeFailures._8.if.exit.0                                # ir inst 29 fin
.F.simulateNodeFailures._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t6, t5
  j .F.simulateNodeFailures._1.while.cond.0                             # ir inst 31 fin
.F.simulateNodeFailures._9.while.exit.0:
  j .F.simulateNodeFailures.epilogue                                    # ir inst 32 fin
.F.simulateNodeFailures.epilogue:
  ret

.globl .F.updateFailureDetectors
.F.updateFailureDetectors:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.updateFailureDetectors._0.entry.0:
# Phi connections
  li t6, 0
  j .F.updateFailureDetectors._1.while.cond.0                           # ir inst 1 fin
.F.updateFailureDetectors._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.updateFailureDetectors._2.while.body.0
  j .F.updateFailureDetectors._9.while.exit.0                           # ir inst 4 fin
.F.updateFailureDetectors._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.updateFailureDetectors._3.while.cond.1                           # ir inst 5 fin
.F.updateFailureDetectors._3.while.cond.1:
  slt t4, t5, a0                                                        # ir inst 7 fin
  bnez t4, .F.updateFailureDetectors._4.while.body.1
  j .F.updateFailureDetectors._8.while.exit.1                           # ir inst 8 fin
.F.updateFailureDetectors._4.while.body.1:
  xor t0, t6, t5
  sltu t4, zero, t0                                                     # ir inst 9 fin
  bnez t4, .F.updateFailureDetectors._5.if.then.0
  j .F.updateFailureDetectors._6.if.else.0                              # ir inst 10 fin
.F.updateFailureDetectors._5.if.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a2, t2                                                        # ir inst 12 fin
  mv t4, t5                                                             # ir inst 13 fin
  add s11, t3, t4                                                       # ir inst 14 fin
  mv t4, t5                                                             # ir inst 15 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 16 fin
  lw t4, 0(t3)                                                          # ir inst 17 fin
  li t2, 30
  slt t3, t4, t2                                                        # ir inst 18 fin
  sb t3, 0(s11)                                                         # ir inst 19 fin
  j .F.updateFailureDetectors._7.if.exit.0                              # ir inst 20 fin
.F.updateFailureDetectors._6.if.else.0:
  j .F.updateFailureDetectors._7.if.exit.0                              # ir inst 21 fin
.F.updateFailureDetectors._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 22 fin
# Phi connections
  mv t5, t4
  j .F.updateFailureDetectors._3.while.cond.1                           # ir inst 23 fin
.F.updateFailureDetectors._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 24 fin
# Phi connections
  mv t6, t5
  j .F.updateFailureDetectors._1.while.cond.0                           # ir inst 25 fin
.F.updateFailureDetectors._9.while.exit.0:
  j .F.updateFailureDetectors.epilogue                                  # ir inst 26 fin
.F.updateFailureDetectors.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.conductFailureAwareElection
.F.conductFailureAwareElection:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 3 / 12,        range:       64(sp) -       88(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s9, 64(sp)
  sd s10, 72(sp)
  sd s11, 80(sp)
  sd ra, 88(sp)
.F.conductFailureAwareElection._0.entry.0:
# Phi connections
  li t4, 0
  li t5, -1
  li t6, -1
  j .F.conductFailureAwareElection._1.while.cond.0                      # ir inst 1 fin
.F.conductFailureAwareElection._1.while.cond.0:
  slt t3, t4, a0                                                        # ir inst 5 fin
  bnez t3, .F.conductFailureAwareElection._2.while.body.0
  j .F.conductFailureAwareElection._9.while.exit.0                      # ir inst 6 fin
.F.conductFailureAwareElection._2.while.body.0:
  mv t3, t4                                                             # ir inst 7 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 8 fin
  lw t3, 0(s11)                                                         # ir inst 9 fin
  li t2, 30
  slt s11, t2, t3                                                       # ir inst 10 fin
  bnez s11, .F.conductFailureAwareElection._3.if.then.0
  j .F.conductFailureAwareElection._7.if.else.0                         # ir inst 11 fin
.F.conductFailureAwareElection._3.if.then.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a2, a3
  mv a1, a0
  mv a0, t4
  call .F.countDetectedFailures
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 12 fin
  mv s11, t4                                                            # ir inst 13 fin
  slli t2, s11, 2
  add s10, a2, t2                                                       # ir inst 14 fin
  lw s11, 0(s10)                                                        # ir inst 15 fin
  li t2, 10
  mul s10, s11, t2                                                      # ir inst 16 fin
  mv s11, t4                                                            # ir inst 17 fin
  slli t2, s11, 2
  add s9, a1, t2                                                        # ir inst 18 fin
  lw s11, 0(s9)                                                         # ir inst 19 fin
  sub s9, a0, t3                                                        # ir inst 20 fin
  li t2, 100
  mul t3, s9, t2                                                        # ir inst 21 fin
  add s9, s10, s11                                                      # ir inst 22 fin
  add s11, s9, t3                                                       # ir inst 23 fin
  slt t3, t5, s11                                                       # ir inst 24 fin
  bnez t3, .F.conductFailureAwareElection._4.if.then.1
  j .F.conductFailureAwareElection._5.if.else.1                         # ir inst 25 fin
.F.conductFailureAwareElection._4.if.then.1:
# Phi connections
  mv t3, t4
  j .F.conductFailureAwareElection._6.if.exit.1                         # ir inst 26 fin
.F.conductFailureAwareElection._5.if.else.1:
# Phi connections
  mv s11, t5
  mv t3, t6
  j .F.conductFailureAwareElection._6.if.exit.1                         # ir inst 27 fin
.F.conductFailureAwareElection._6.if.exit.1:
# Phi connections
  mv t5, t3
  mv t3, s11
  j .F.conductFailureAwareElection._8.if.exit.0                         # ir inst 30 fin
.F.conductFailureAwareElection._7.if.else.0:
# Phi connections
  mv t3, t5
  mv t5, t6
  j .F.conductFailureAwareElection._8.if.exit.0                         # ir inst 31 fin
.F.conductFailureAwareElection._8.if.exit.0:
  addi s11, t4, 1                                                       # ir inst 34 fin
# Phi connections
  mv t4, s11
  mv t6, t5
  mv t5, t3
  j .F.conductFailureAwareElection._1.while.cond.0                      # ir inst 35 fin
.F.conductFailureAwareElection._9.while.exit.0:
  mv a0, t6
  j .F.conductFailureAwareElection.epilogue                             # ir inst 36 fin
.F.conductFailureAwareElection.epilogue:
  ld ra, 88(sp)
  ld s9, 64(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.testLeadershipStability
.F.testLeadershipStability:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.testLeadershipStability._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.testLeadershipStability._1.while.cond.0                          # ir inst 1 fin
.F.testLeadershipStability._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.testLeadershipStability._2.while.body.0
  j .F.testLeadershipStability._12.while.exit.0                         # ir inst 5 fin
.F.testLeadershipStability._2.while.body.0:
  xor t0, t6, a0
  sltu t4, zero, t0                                                     # ir inst 6 fin
  bnez t4, .F.testLeadershipStability._3.lazy.then.0
  j .F.testLeadershipStability._4.lazy.else.0                           # ir inst 7 fin
.F.testLeadershipStability._3.lazy.then.0:
  mv t4, t6                                                             # ir inst 8 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 9 fin
  lw t4, 0(t3)                                                          # ir inst 10 fin
  li t2, 30
  slt t3, t2, t4                                                        # ir inst 11 fin
# Phi connections
  mv t4, t3
  j .F.testLeadershipStability._5.lazy.exit.0                           # ir inst 12 fin
.F.testLeadershipStability._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.testLeadershipStability._5.lazy.exit.0                           # ir inst 13 fin
.F.testLeadershipStability._5.lazy.exit.0:
  bnez t4, .F.testLeadershipStability._6.if.then.0
  j .F.testLeadershipStability._10.if.else.0                            # ir inst 15 fin
.F.testLeadershipStability._6.if.then.0:
  mv t4, t6                                                             # ir inst 16 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a3, t2                                                        # ir inst 17 fin
  mv t4, a0                                                             # ir inst 18 fin
  add s11, t3, t4                                                       # ir inst 19 fin
  lb t4, 0(s11)                                                         # ir inst 20 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 21 fin
  bnez t3, .F.testLeadershipStability._7.if.then.1
  j .F.testLeadershipStability._8.if.else.1                             # ir inst 22 fin
.F.testLeadershipStability._7.if.then.1:
  addi t4, t5, 1                                                        # ir inst 23 fin
# Phi connections
  j .F.testLeadershipStability._9.if.exit.1                             # ir inst 24 fin
.F.testLeadershipStability._8.if.else.1:
# Phi connections
  mv t4, t5
  j .F.testLeadershipStability._9.if.exit.1                             # ir inst 25 fin
.F.testLeadershipStability._9.if.exit.1:
# Phi connections
  j .F.testLeadershipStability._11.if.exit.0                            # ir inst 27 fin
.F.testLeadershipStability._10.if.else.0:
# Phi connections
  mv t4, t5
  j .F.testLeadershipStability._11.if.exit.0                            # ir inst 28 fin
.F.testLeadershipStability._11.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 30 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.testLeadershipStability._1.while.cond.0                          # ir inst 31 fin
.F.testLeadershipStability._12.while.exit.0:
  addi t6, a1, -1                                                       # ir inst 32 fin
  li t2, 2
  div t4, t6, t2                                                        # ir inst 33 fin
  slt t0, t5, t4
  xori t6, t0, 1                                                        # ir inst 34 fin
  mv a0, t6
  j .F.testLeadershipStability.epilogue                                 # ir inst 35 fin
.F.testLeadershipStability.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.simulateNodeRecovery
.F.simulateNodeRecovery:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulateNodeRecovery._0.entry.0:
# Phi connections
  li t6, 0
  j .F.simulateNodeRecovery._1.while.cond.0                             # ir inst 1 fin
.F.simulateNodeRecovery._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.simulateNodeRecovery._2.while.body.0
  j .F.simulateNodeRecovery._9.while.exit.0                             # ir inst 4 fin
.F.simulateNodeRecovery._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  lw t5, 0(t4)                                                          # ir inst 7 fin
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 8 fin
  bnez t4, .F.simulateNodeRecovery._3.if.then.0
  j .F.simulateNodeRecovery._7.if.else.0                                # ir inst 9 fin
.F.simulateNodeRecovery._3.if.then.0:
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  mv t5, t6                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 13 fin
  lw t5, 0(t3)                                                          # ir inst 14 fin
  addi t3, t5, 15                                                       # ir inst 15 fin
  sw t3, 0(t4)                                                          # ir inst 16 fin
  mv t5, t6                                                             # ir inst 17 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 18 fin
  lw t5, 0(t4)                                                          # ir inst 19 fin
  li t2, 100
  slt t4, t2, t5                                                        # ir inst 20 fin
  bnez t4, .F.simulateNodeRecovery._4.if.then.1
  j .F.simulateNodeRecovery._5.if.else.1                                # ir inst 21 fin
.F.simulateNodeRecovery._4.if.then.1:
  mv t5, t6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 23 fin
  li t1, 100
  sw t1, 0(t4)                                                          # ir inst 24 fin
  j .F.simulateNodeRecovery._6.if.exit.1                                # ir inst 25 fin
.F.simulateNodeRecovery._5.if.else.1:
  j .F.simulateNodeRecovery._6.if.exit.1                                # ir inst 26 fin
.F.simulateNodeRecovery._6.if.exit.1:
  j .F.simulateNodeRecovery._8.if.exit.0                                # ir inst 27 fin
.F.simulateNodeRecovery._7.if.else.0:
  j .F.simulateNodeRecovery._8.if.exit.0                                # ir inst 28 fin
.F.simulateNodeRecovery._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t5
  j .F.simulateNodeRecovery._1.while.cond.0                             # ir inst 30 fin
.F.simulateNodeRecovery._9.while.exit.0:
  j .F.simulateNodeRecovery.epilogue                                    # ir inst 31 fin
.F.simulateNodeRecovery.epilogue:
  ret

.globl .F.generateAsyncProposals
.F.generateAsyncProposals:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.generateAsyncProposals._0.entry.0:
# Phi connections
  li t6, 0
  j .F.generateAsyncProposals._1.while.cond.0                           # ir inst 1 fin
.F.generateAsyncProposals._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.generateAsyncProposals._2.while.body.0
  j .F.generateAsyncProposals._3.while.exit.0                           # ir inst 4 fin
.F.generateAsyncProposals._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  li t2, 100
  mul t5, a2, t2                                                        # ir inst 7 fin
  li t2, 10
  mul t3, t6, t2                                                        # ir inst 8 fin
  add s11, t5, t3                                                       # ir inst 9 fin
  add t5, a2, t6                                                        # ir inst 10 fin
  li t2, 7
  rem t3, t5, t2                                                        # ir inst 11 fin
  add t5, s11, t3                                                       # ir inst 12 fin
  sw t5, 0(t4)                                                          # ir inst 13 fin
  addi t5, t6, 1                                                        # ir inst 14 fin
# Phi connections
  mv t6, t5
  j .F.generateAsyncProposals._1.while.cond.0                           # ir inst 15 fin
.F.generateAsyncProposals._3.while.exit.0:
  j .F.generateAsyncProposals.epilogue                                  # ir inst 16 fin
.F.generateAsyncProposals.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.enqueueProposalsWithDelays
.F.enqueueProposalsWithDelays:
# spill func args num: 1,             range:        8(sp) -        8(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.enqueueProposalsWithDelays._0.entry.0:
# Phi connections
  li t6, 0
  j .F.enqueueProposalsWithDelays._1.while.cond.0                       # ir inst 1 fin
.F.enqueueProposalsWithDelays._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.enqueueProposalsWithDelays._2.lazy.then.0
  j .F.enqueueProposalsWithDelays._3.lazy.else.0                        # ir inst 4 fin
.F.enqueueProposalsWithDelays._2.lazy.then.0:
  lw t5, 0(a7)                                                          # ir inst 5 fin
  li t2, 1000
  slt t4, t5, t2                                                        # ir inst 6 fin
# Phi connections
  mv t5, t4
  j .F.enqueueProposalsWithDelays._4.lazy.exit.0                        # ir inst 7 fin
.F.enqueueProposalsWithDelays._3.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.enqueueProposalsWithDelays._4.lazy.exit.0                        # ir inst 8 fin
.F.enqueueProposalsWithDelays._4.lazy.exit.0:
  bnez t5, .F.enqueueProposalsWithDelays._5.while.body.0
  j .F.enqueueProposalsWithDelays._6.while.exit.0                       # ir inst 10 fin
.F.enqueueProposalsWithDelays._5.while.body.0:
  li t2, 13
  mul t5, t6, t2                                                        # ir inst 11 fin
  ld t1, 8(sp)
  li t2, 7
  mul t4, t1, t2                                                        # ir inst 12 fin
  add t3, t5, t4                                                        # ir inst 13 fin
  li t2, 20
  rem t5, t3, t2                                                        # ir inst 14 fin
  lw t4, 0(a6)                                                          # ir inst 15 fin
  mv t3, t4                                                             # ir inst 16 fin
  slli t2, t3, 2
  add t4, a2, t2                                                        # ir inst 17 fin
  mv t3, t6                                                             # ir inst 18 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 19 fin
  lw t3, 0(s11)                                                         # ir inst 20 fin
  sw t3, 0(t4)                                                          # ir inst 21 fin
  lw t4, 0(a6)                                                          # ir inst 22 fin
  mv t3, t4                                                             # ir inst 23 fin
  slli t2, t3, 2
  add t4, a3, t2                                                        # ir inst 24 fin
  sw t5, 0(t4)                                                          # ir inst 25 fin
  lw t5, 0(a6)                                                          # ir inst 26 fin
  mv t4, t5                                                             # ir inst 27 fin
  slli t2, t4, 2
  add t5, a4, t2                                                        # ir inst 28 fin
  ld t1, 8(sp)
  sw t1, 0(t5)                                                          # ir inst 29 fin
  lw t5, 0(a6)                                                          # ir inst 30 fin
  addi t4, t5, 1                                                        # ir inst 31 fin
  li t2, 1000
  rem t5, t4, t2                                                        # ir inst 32 fin
  sw t5, 0(a6)                                                          # ir inst 33 fin
  lw t5, 0(a7)                                                          # ir inst 34 fin
  addi t4, t5, 1                                                        # ir inst 35 fin
  sw t4, 0(a7)                                                          # ir inst 36 fin
  addi t5, t6, 1                                                        # ir inst 37 fin
# Phi connections
  mv t6, t5
  j .F.enqueueProposalsWithDelays._1.while.cond.0                       # ir inst 38 fin
.F.enqueueProposalsWithDelays._6.while.exit.0:
  j .F.enqueueProposalsWithDelays.epilogue                              # ir inst 39 fin
.F.enqueueProposalsWithDelays.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.processAsyncMessages
.F.processAsyncMessages:
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
.F.processAsyncMessages._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.processAsyncMessages._1.while.cond.0                             # ir inst 1 fin
.F.processAsyncMessages._1.while.cond.0:
  lw t4, 0(a5)                                                          # ir inst 4 fin
  slt t3, t5, t4                                                        # ir inst 5 fin
  bnez t3, .F.processAsyncMessages._2.lazy.then.0
  j .F.processAsyncMessages._3.lazy.else.0                              # ir inst 6 fin
.F.processAsyncMessages._2.lazy.then.0:
  lw t4, 0(a5)                                                          # ir inst 7 fin
  li t2, 0
  slt t3, t2, t4                                                        # ir inst 8 fin
# Phi connections
  mv t4, t3
  j .F.processAsyncMessages._4.lazy.exit.0                              # ir inst 9 fin
.F.processAsyncMessages._3.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.processAsyncMessages._4.lazy.exit.0                              # ir inst 10 fin
.F.processAsyncMessages._4.lazy.exit.0:
  bnez t4, .F.processAsyncMessages._5.while.body.0
  j .F.processAsyncMessages._9.while.exit.0                             # ir inst 12 fin
.F.processAsyncMessages._5.while.body.0:
  lw t4, 0(a3)                                                          # ir inst 13 fin
  mv t3, t4                                                             # ir inst 14 fin
  slli t2, t3, 2
  add t4, a2, t2                                                        # ir inst 15 fin
  lw t3, 0(t4)                                                          # ir inst 16 fin
  lw t4, 0(a3)                                                          # ir inst 17 fin
  mv s11, t4                                                            # ir inst 18 fin
  slli t2, s11, 2
  add t4, a1, t2                                                        # ir inst 19 fin
  lw s11, 0(t4)                                                         # ir inst 20 fin
  add t4, t3, s11                                                       # ir inst 21 fin
  slt t0, a7, t4
  xori t3, t0, 1                                                        # ir inst 22 fin
  bnez t3, .F.processAsyncMessages._6.if.then.0
  j .F.processAsyncMessages._7.if.else.0                                # ir inst 23 fin
.F.processAsyncMessages._6.if.then.0:
  lw t4, 0(a3)                                                          # ir inst 24 fin
  mv t3, t4                                                             # ir inst 25 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 26 fin
  lw t3, 0(t4)                                                          # ir inst 27 fin
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
  mv a2, a7
  mv a1, a6
  mv a0, t3
  call .F.processAsyncMessage
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
# ir inst 28 fin
  lw t4, 0(a3)                                                          # ir inst 29 fin
  addi t3, t4, 1                                                        # ir inst 30 fin
  li t2, 1000
  rem t4, t3, t2                                                        # ir inst 31 fin
  sw t4, 0(a3)                                                          # ir inst 32 fin
  lw t4, 0(a5)                                                          # ir inst 33 fin
  addi t3, t4, -1                                                       # ir inst 34 fin
  sw t3, 0(a5)                                                          # ir inst 35 fin
  addi t4, t6, 1                                                        # ir inst 36 fin
# Phi connections
  j .F.processAsyncMessages._8.if.exit.0                                # ir inst 37 fin
.F.processAsyncMessages._7.if.else.0:
  lw t4, 0(a3)                                                          # ir inst 38 fin
  lw t3, 0(a3)                                                          # ir inst 39 fin
  addi s11, t3, 1                                                       # ir inst 40 fin
  li t2, 1000
  rem t3, s11, t2                                                       # ir inst 41 fin
  sw t3, 0(a3)                                                          # ir inst 42 fin
  lw t3, 0(a5)                                                          # ir inst 43 fin
  addi s11, t3, -1                                                      # ir inst 44 fin
  sw s11, 0(a5)                                                         # ir inst 45 fin
  lw t3, 0(a4)                                                          # ir inst 46 fin
  mv s11, t3                                                            # ir inst 47 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 48 fin
  mv s11, t4                                                            # ir inst 49 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 50 fin
  lw s11, 0(s10)                                                        # ir inst 51 fin
  sw s11, 0(t3)                                                         # ir inst 52 fin
  lw t3, 0(a4)                                                          # ir inst 53 fin
  mv s11, t3                                                            # ir inst 54 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 55 fin
  mv s11, t4                                                            # ir inst 56 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 57 fin
  lw s11, 0(s10)                                                        # ir inst 58 fin
  sw s11, 0(t3)                                                         # ir inst 59 fin
  lw t3, 0(a4)                                                          # ir inst 60 fin
  mv s11, t3                                                            # ir inst 61 fin
  slli t2, s11, 2
  add t3, a2, t2                                                        # ir inst 62 fin
  mv s11, t4                                                            # ir inst 63 fin
  slli t2, s11, 2
  add t4, a2, t2                                                        # ir inst 64 fin
  lw s11, 0(t4)                                                         # ir inst 65 fin
  sw s11, 0(t3)                                                         # ir inst 66 fin
  lw t4, 0(a4)                                                          # ir inst 67 fin
  addi t3, t4, 1                                                        # ir inst 68 fin
  li t2, 1000
  rem t4, t3, t2                                                        # ir inst 69 fin
  sw t4, 0(a4)                                                          # ir inst 70 fin
  lw t4, 0(a5)                                                          # ir inst 71 fin
  addi t3, t4, 1                                                        # ir inst 72 fin
  sw t3, 0(a5)                                                          # ir inst 73 fin
# Phi connections
  mv t4, t6
  j .F.processAsyncMessages._8.if.exit.0                                # ir inst 74 fin
.F.processAsyncMessages._8.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 76 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.processAsyncMessages._1.while.cond.0                             # ir inst 77 fin
.F.processAsyncMessages._9.while.exit.0:
  mv a0, t6
  j .F.processAsyncMessages.epilogue                                    # ir inst 78 fin
.F.processAsyncMessages.epilogue:
  ld ra, 104(sp)
  ld s10, 88(sp)
  ld s11, 96(sp)
  addi sp, sp, 112
  ret

.globl .F.processAsyncMessage
.F.processAsyncMessage:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.processAsyncMessage._0.entry.0:
  li t2, 10
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 7
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 0
  slt t0, t5, t2
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.processAsyncMessage._1.lazy.then.0
  j .F.processAsyncMessage._2.lazy.else.0                               # ir inst 4 fin
.F.processAsyncMessage._1.lazy.then.0:
  li t2, 7
  slt t6, t5, t2                                                        # ir inst 5 fin
# Phi connections
  j .F.processAsyncMessage._3.lazy.exit.0                               # ir inst 6 fin
.F.processAsyncMessage._2.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.processAsyncMessage._3.lazy.exit.0                               # ir inst 7 fin
.F.processAsyncMessage._3.lazy.exit.0:
  bnez t6, .F.processAsyncMessage._4.if.then.0
  j .F.processAsyncMessage._8.if.else.0                                 # ir inst 9 fin
.F.processAsyncMessage._4.if.then.0:
  mv t6, t5                                                             # ir inst 10 fin
  slli t2, t6, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  lw t6, 0(t4)                                                          # ir inst 12 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 13 fin
  bnez t4, .F.processAsyncMessage._5.if.then.1
  j .F.processAsyncMessage._6.if.else.1                                 # ir inst 14 fin
.F.processAsyncMessage._5.if.then.1:
  mv t6, t5                                                             # ir inst 15 fin
  slli t2, t6, 2
  add t5, a1, t2                                                        # ir inst 16 fin
  sw a0, 0(t5)                                                          # ir inst 17 fin
  j .F.processAsyncMessage._7.if.exit.1                                 # ir inst 18 fin
.F.processAsyncMessage._6.if.else.1:
  j .F.processAsyncMessage._7.if.exit.1                                 # ir inst 19 fin
.F.processAsyncMessage._7.if.exit.1:
  j .F.processAsyncMessage._9.if.exit.0                                 # ir inst 20 fin
.F.processAsyncMessage._8.if.else.0:
  j .F.processAsyncMessage._9.if.exit.0                                 # ir inst 21 fin
.F.processAsyncMessage._9.if.exit.0:
  j .F.processAsyncMessage.epilogue                                     # ir inst 22 fin
.F.processAsyncMessage.epilogue:
  ret

.globl .F.checkAsyncConsensus
.F.checkAsyncConsensus:
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
.F.checkAsyncConsensus._0.entry.0:
# Phi connections
  li t3, 0
  li t4, -1
  li t5, 1
  li t6, 0
  j .F.checkAsyncConsensus._1.while.cond.0                              # ir inst 1 fin
.F.checkAsyncConsensus._1.while.cond.0:
  slt s11, t6, a0                                                       # ir inst 6 fin
  bnez s11, .F.checkAsyncConsensus._2.while.body.0
  j .F.checkAsyncConsensus._12.while.exit.0                             # ir inst 7 fin
.F.checkAsyncConsensus._2.while.body.0:
  mv s11, t6                                                            # ir inst 8 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 9 fin
  lw s11, 0(s10)                                                        # ir inst 10 fin
  li t2, -1
  xor t0, s11, t2
  sltu s10, zero, t0                                                    # ir inst 11 fin
  bnez s10, .F.checkAsyncConsensus._3.if.then.0
  j .F.checkAsyncConsensus._10.if.else.0                                # ir inst 12 fin
.F.checkAsyncConsensus._3.if.then.0:
  addi s11, t3, 1                                                       # ir inst 13 fin
  li t2, -1
  xor t0, t4, t2
  sltiu s10, t0, 1                                                      # ir inst 14 fin
  bnez s10, .F.checkAsyncConsensus._4.if.then.1
  j .F.checkAsyncConsensus._5.if.else.1                                 # ir inst 15 fin
.F.checkAsyncConsensus._4.if.then.1:
  mv s10, t6                                                            # ir inst 16 fin
  slli t2, s10, 2
  add s9, a1, t2                                                        # ir inst 17 fin
  lw s10, 0(s9)                                                         # ir inst 18 fin
# Phi connections
  mv s9, s10
  mv s10, t5
  j .F.checkAsyncConsensus._9.if.exit.1                                 # ir inst 19 fin
.F.checkAsyncConsensus._5.if.else.1:
  mv s10, t6                                                            # ir inst 20 fin
  slli t2, s10, 2
  add s9, a1, t2                                                        # ir inst 21 fin
  lw s10, 0(s9)                                                         # ir inst 22 fin
  xor t0, s10, t4
  sltu s9, zero, t0                                                     # ir inst 23 fin
  bnez s9, .F.checkAsyncConsensus._6.if.then.2
  j .F.checkAsyncConsensus._7.if.else.2                                 # ir inst 24 fin
.F.checkAsyncConsensus._6.if.then.2:
# Phi connections
  li s10, 0
  j .F.checkAsyncConsensus._8.if.exit.2                                 # ir inst 25 fin
.F.checkAsyncConsensus._7.if.else.2:
# Phi connections
  mv s10, t5
  j .F.checkAsyncConsensus._8.if.exit.2                                 # ir inst 26 fin
.F.checkAsyncConsensus._8.if.exit.2:
# Phi connections
  mv s9, t4
  j .F.checkAsyncConsensus._9.if.exit.1                                 # ir inst 28 fin
.F.checkAsyncConsensus._9.if.exit.1:
# Phi connections
  mv t4, s10
  mv s10, s11
  mv s11, s9
  j .F.checkAsyncConsensus._11.if.exit.0                                # ir inst 31 fin
.F.checkAsyncConsensus._10.if.else.0:
# Phi connections
  mv s10, t3
  mv s11, t4
  mv t4, t5
  j .F.checkAsyncConsensus._11.if.exit.0                                # ir inst 32 fin
.F.checkAsyncConsensus._11.if.exit.0:
  addi s9, t6, 1                                                        # ir inst 36 fin
# Phi connections
  mv t3, s10
  mv t5, t4
  mv t6, s9
  mv t4, s11
  j .F.checkAsyncConsensus._1.while.cond.0                              # ir inst 37 fin
.F.checkAsyncConsensus._12.while.exit.0:
  li t2, 2
  div t6, a0, t2                                                        # ir inst 38 fin
  addi t4, t6, 1                                                        # ir inst 39 fin
  slt t0, t3, t4
  xori t6, t0, 1                                                        # ir inst 40 fin
  bnez t6, .F.checkAsyncConsensus._13.lazy.then.0
  j .F.checkAsyncConsensus._14.lazy.else.0                              # ir inst 41 fin
.F.checkAsyncConsensus._13.lazy.then.0:
# Phi connections
  mv t6, t5
  j .F.checkAsyncConsensus._15.lazy.exit.0                              # ir inst 42 fin
.F.checkAsyncConsensus._14.lazy.else.0:
# Phi connections
  li t6, 0
  j .F.checkAsyncConsensus._15.lazy.exit.0                              # ir inst 43 fin
.F.checkAsyncConsensus._15.lazy.exit.0:
  mv a0, t6
  j .F.checkAsyncConsensus.epilogue                                     # ir inst 45 fin
.F.checkAsyncConsensus.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.extractConsensusValue
.F.extractConsensusValue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.extractConsensusValue._0.entry.0:
# Phi connections
  li t6, 0
  j .F.extractConsensusValue._1.while.cond.0                            # ir inst 1 fin
.F.extractConsensusValue._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.extractConsensusValue._2.while.body.0
  j .F.extractConsensusValue._6.while.exit.0                            # ir inst 4 fin
.F.extractConsensusValue._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  lw t5, 0(t4)                                                          # ir inst 7 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 8 fin
  bnez t4, .F.extractConsensusValue._3.if.then.0
  j .F.extractConsensusValue._4.if.else.0                               # ir inst 9 fin
.F.extractConsensusValue._3.if.then.0:
  mv t5, t6                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 11 fin
  lw t5, 0(t4)                                                          # ir inst 12 fin
  mv a0, t5
  j .F.extractConsensusValue.epilogue                                   # ir inst 13 fin
.F.extractConsensusValue._4.if.else.0:
  j .F.extractConsensusValue._5.if.exit.0                               # ir inst 14 fin
.F.extractConsensusValue._5.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t5
  j .F.extractConsensusValue._1.while.cond.0                            # ir inst 16 fin
.F.extractConsensusValue._6.while.exit.0:
  li a0, -1
  j .F.extractConsensusValue.epilogue                                   # ir inst 17 fin
.F.extractConsensusValue.epilogue:
  ret

.globl .F.resetNodeDecisions
.F.resetNodeDecisions:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.resetNodeDecisions._0.entry.0:
# Phi connections
  li t6, 0
  j .F.resetNodeDecisions._1.while.cond.0                               # ir inst 1 fin
.F.resetNodeDecisions._1.while.cond.0:
  slt t5, t6, a0                                                        # ir inst 3 fin
  bnez t5, .F.resetNodeDecisions._2.while.body.0
  j .F.resetNodeDecisions._3.while.exit.0                               # ir inst 4 fin
.F.resetNodeDecisions._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 6 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 7 fin
  addi t5, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.resetNodeDecisions._1.while.cond.0                               # ir inst 9 fin
.F.resetNodeDecisions._3.while.exit.0:
  j .F.resetNodeDecisions.epilogue                                      # ir inst 10 fin
.F.resetNodeDecisions.epilogue:
  ret

.globl .F.verifyConsensusHistory
.F.verifyConsensusHistory:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.verifyConsensusHistory._0.entry.0:
  li t2, 1
  slt t0, t2, a1
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.verifyConsensusHistory._1.if.then.0
  j .F.verifyConsensusHistory._2.if.else.0                              # ir inst 2 fin
.F.verifyConsensusHistory._1.if.then.0:
  li a0, 1
  j .F.verifyConsensusHistory.epilogue                                  # ir inst 3 fin
.F.verifyConsensusHistory._2.if.else.0:
  j .F.verifyConsensusHistory._3.if.exit.0                              # ir inst 4 fin
.F.verifyConsensusHistory._3.if.exit.0:
# Phi connections
  li t6, 1
  j .F.verifyConsensusHistory._4.while.cond.0                           # ir inst 5 fin
.F.verifyConsensusHistory._4.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 7 fin
  bnez t5, .F.verifyConsensusHistory._5.while.body.0
  j .F.verifyConsensusHistory._9.while.exit.0                           # ir inst 8 fin
.F.verifyConsensusHistory._5.while.body.0:
  mv t5, t6                                                             # ir inst 9 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 10 fin
  lw t5, 0(t4)                                                          # ir inst 11 fin
  mv t4, t6                                                             # ir inst 12 fin
  addi t3, t4, -1                                                       # ir inst 13 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  lw t3, 0(t4)                                                          # ir inst 15 fin
  slt t0, t3, t5
  xori t4, t0, 1                                                        # ir inst 16 fin
  bnez t4, .F.verifyConsensusHistory._6.if.then.1
  j .F.verifyConsensusHistory._7.if.else.1                              # ir inst 17 fin
.F.verifyConsensusHistory._6.if.then.1:
  li a0, 0
  j .F.verifyConsensusHistory.epilogue                                  # ir inst 18 fin
.F.verifyConsensusHistory._7.if.else.1:
  j .F.verifyConsensusHistory._8.if.exit.1                              # ir inst 19 fin
.F.verifyConsensusHistory._8.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t6, t5
  j .F.verifyConsensusHistory._4.while.cond.0                           # ir inst 21 fin
.F.verifyConsensusHistory._9.while.exit.0:
  li a0, 1
  j .F.verifyConsensusHistory.epilogue                                  # ir inst 22 fin
.F.verifyConsensusHistory.epilogue:
  ret

.globl .F.findMaxPartitionId
.F.findMaxPartitionId:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.findMaxPartitionId._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.findMaxPartitionId._1.while.cond.0                               # ir inst 1 fin
.F.findMaxPartitionId._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.findMaxPartitionId._2.while.body.0
  j .F.findMaxPartitionId._6.while.exit.0                               # ir inst 5 fin
.F.findMaxPartitionId._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  slt t3, t5, t4                                                        # ir inst 9 fin
  bnez t3, .F.findMaxPartitionId._3.if.then.0
  j .F.findMaxPartitionId._4.if.else.0                                  # ir inst 10 fin
.F.findMaxPartitionId._3.if.then.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
# Phi connections
  j .F.findMaxPartitionId._5.if.exit.0                                  # ir inst 14 fin
.F.findMaxPartitionId._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.findMaxPartitionId._5.if.exit.0                                  # ir inst 15 fin
.F.findMaxPartitionId._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.findMaxPartitionId._1.while.cond.0                               # ir inst 18 fin
.F.findMaxPartitionId._6.while.exit.0:
  mv a0, t5
  j .F.findMaxPartitionId.epilogue                                      # ir inst 19 fin
.F.findMaxPartitionId.epilogue:
  ret

.globl .F.countPartitionSize
.F.countPartitionSize:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.countPartitionSize._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.countPartitionSize._1.while.cond.0                               # ir inst 1 fin
.F.countPartitionSize._1.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 4 fin
  bnez t4, .F.countPartitionSize._2.while.body.0
  j .F.countPartitionSize._6.while.exit.0                               # ir inst 5 fin
.F.countPartitionSize._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t3)                                                          # ir inst 8 fin
  xor t0, t4, a2
  sltiu t3, t0, 1                                                       # ir inst 9 fin
  bnez t3, .F.countPartitionSize._3.if.then.0
  j .F.countPartitionSize._4.if.else.0                                  # ir inst 10 fin
.F.countPartitionSize._3.if.then.0:
  addi t4, t5, 1                                                        # ir inst 11 fin
# Phi connections
  j .F.countPartitionSize._5.if.exit.0                                  # ir inst 12 fin
.F.countPartitionSize._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.countPartitionSize._5.if.exit.0                                  # ir inst 13 fin
.F.countPartitionSize._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.countPartitionSize._1.while.cond.0                               # ir inst 16 fin
.F.countPartitionSize._6.while.exit.0:
  mv a0, t5
  j .F.countPartitionSize.epilogue                                      # ir inst 17 fin
.F.countPartitionSize.epilogue:
  ret

.globl .F.testPartitionInternalConsensus
.F.testPartitionInternalConsensus:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.testPartitionInternalConsensus._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  call .F.countPartitionSize
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 1 fin
  li t2, 1
  slt t0, t2, t6
  xori t5, t0, 1                                                        # ir inst 2 fin
  bnez t5, .F.testPartitionInternalConsensus._1.if.then.0
  j .F.testPartitionInternalConsensus._2.if.else.0                      # ir inst 3 fin
.F.testPartitionInternalConsensus._1.if.then.0:
  li a0, 1
  j .F.testPartitionInternalConsensus.epilogue                          # ir inst 4 fin
.F.testPartitionInternalConsensus._2.if.else.0:
  j .F.testPartitionInternalConsensus._3.if.exit.0                      # ir inst 5 fin
.F.testPartitionInternalConsensus._3.if.exit.0:
# Phi connections
  li t5, -1
  li t6, 0
  j .F.testPartitionInternalConsensus._4.while.cond.0                   # ir inst 6 fin
.F.testPartitionInternalConsensus._4.while.cond.0:
  slt t4, t6, a0                                                        # ir inst 9 fin
  bnez t4, .F.testPartitionInternalConsensus._5.while.body.0
  j .F.testPartitionInternalConsensus._15.while.exit.0                  # ir inst 10 fin
.F.testPartitionInternalConsensus._5.while.body.0:
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  lw t4, 0(t3)                                                          # ir inst 13 fin
  xor t0, t4, a2
  sltiu t3, t0, 1                                                       # ir inst 14 fin
  bnez t3, .F.testPartitionInternalConsensus._6.if.then.1
  j .F.testPartitionInternalConsensus._13.if.else.1                     # ir inst 15 fin
.F.testPartitionInternalConsensus._6.if.then.1:
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 16 fin
  bnez t4, .F.testPartitionInternalConsensus._7.if.then.2
  j .F.testPartitionInternalConsensus._8.if.else.2                      # ir inst 17 fin
.F.testPartitionInternalConsensus._7.if.then.2:
# Phi connections
  mv t4, t6
  j .F.testPartitionInternalConsensus._12.if.exit.2                     # ir inst 18 fin
.F.testPartitionInternalConsensus._8.if.else.2:
  mv t4, t5                                                             # ir inst 19 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a3, t2                                                        # ir inst 20 fin
  mv t4, t6                                                             # ir inst 21 fin
  add s11, t3, t4                                                       # ir inst 22 fin
  lb t4, 0(s11)                                                         # ir inst 23 fin
  li t2, 0
  xor t0, t4, t2
  sltiu t3, t0, 1                                                       # ir inst 24 fin
  bnez t3, .F.testPartitionInternalConsensus._9.if.then.3
  j .F.testPartitionInternalConsensus._10.if.else.3                     # ir inst 25 fin
.F.testPartitionInternalConsensus._9.if.then.3:
  li a0, 0
  j .F.testPartitionInternalConsensus.epilogue                          # ir inst 26 fin
.F.testPartitionInternalConsensus._10.if.else.3:
  j .F.testPartitionInternalConsensus._11.if.exit.3                     # ir inst 27 fin
.F.testPartitionInternalConsensus._11.if.exit.3:
# Phi connections
  mv t4, t5
  j .F.testPartitionInternalConsensus._12.if.exit.2                     # ir inst 28 fin
.F.testPartitionInternalConsensus._12.if.exit.2:
# Phi connections
  mv t5, t4
  j .F.testPartitionInternalConsensus._14.if.exit.1                     # ir inst 30 fin
.F.testPartitionInternalConsensus._13.if.else.1:
# Phi connections
  j .F.testPartitionInternalConsensus._14.if.exit.1                     # ir inst 31 fin
.F.testPartitionInternalConsensus._14.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 33 fin
# Phi connections
  mv t6, t4
  j .F.testPartitionInternalConsensus._4.while.cond.0                   # ir inst 34 fin
.F.testPartitionInternalConsensus._15.while.exit.0:
  li a0, 1
  j .F.testPartitionInternalConsensus.epilogue                          # ir inst 35 fin
.F.testPartitionInternalConsensus.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.countDetectedFailures
.F.countDetectedFailures:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.countDetectedFailures._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.countDetectedFailures._1.while.cond.0                            # ir inst 1 fin
.F.countDetectedFailures._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.countDetectedFailures._2.while.body.0
  j .F.countDetectedFailures._9.while.exit.0                            # ir inst 5 fin
.F.countDetectedFailures._2.while.body.0:
  xor t0, t6, a0
  sltu t4, zero, t0                                                     # ir inst 6 fin
  bnez t4, .F.countDetectedFailures._3.lazy.then.0
  j .F.countDetectedFailures._4.lazy.else.0                             # ir inst 7 fin
.F.countDetectedFailures._3.lazy.then.0:
  mv t4, a0                                                             # ir inst 8 fin
  li t1, 7
  mul t2, t4, t1
  add t3, a2, t2                                                        # ir inst 9 fin
  mv t4, t6                                                             # ir inst 10 fin
  add s11, t3, t4                                                       # ir inst 11 fin
  lb t4, 0(s11)                                                         # ir inst 12 fin
# Phi connections
  j .F.countDetectedFailures._5.lazy.exit.0                             # ir inst 13 fin
.F.countDetectedFailures._4.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.countDetectedFailures._5.lazy.exit.0                             # ir inst 14 fin
.F.countDetectedFailures._5.lazy.exit.0:
  bnez t4, .F.countDetectedFailures._6.if.then.0
  j .F.countDetectedFailures._7.if.else.0                               # ir inst 16 fin
.F.countDetectedFailures._6.if.then.0:
  addi t4, t5, 1                                                        # ir inst 17 fin
# Phi connections
  j .F.countDetectedFailures._8.if.exit.0                               # ir inst 18 fin
.F.countDetectedFailures._7.if.else.0:
# Phi connections
  mv t4, t5
  j .F.countDetectedFailures._8.if.exit.0                               # ir inst 19 fin
.F.countDetectedFailures._8.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.countDetectedFailures._1.while.cond.0                            # ir inst 22 fin
.F.countDetectedFailures._9.while.exit.0:
  mv a0, t5
  j .F.countDetectedFailures.epilogue                                   # ir inst 23 fin
.F.countDetectedFailures.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret
