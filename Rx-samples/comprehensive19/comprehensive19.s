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

.globl .F.init_memory_pool
.F.init_memory_pool:
# spill func args num: 0,             range:    16064(sp) -    16064(sp)
# local var size: 16020,              range:       40(sp) -    16060(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -16064
  add sp, sp, t0
  sd ra, 32(sp)
.F.init_memory_pool._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 16052
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 5 fin
  li t1, 16052
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 6 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 7 fin
  addi t5, t6, 0                                                        # ir inst 8 fin
# Phi connections
  li t6, 0
  j .F.init_memory_pool._1.array.cond.0                                 # ir inst 9 fin
.F.init_memory_pool._1.array.cond.0:
  li t2, 2000
  slt t4, t6, t2                                                        # ir inst 11 fin
  bnez t4, .F.init_memory_pool._2.array.body.0
  j .F.init_memory_pool._3.array.exit.0                                 # ir inst 12 fin
.F.init_memory_pool._2.array.body.0:
  slli t2, t6, 3
  add t4, t5, t2                                                        # ir inst 13 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 8
  li t1, 16052
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 14 fin
  addi t4, t6, 1                                                        # ir inst 15 fin
# Phi connections
  mv t6, t4
  j .F.init_memory_pool._1.array.cond.0                                 # ir inst 16 fin
.F.init_memory_pool._3.array.exit.0:
  addi t1, sp, 40
  li t6, 16000
  add t6, t1, t6                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 18 fin
  addi t1, sp, 40
  li t6, 16004
  add t6, t1, t6                                                        # ir inst 19 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 20 fin
  addi t1, sp, 40
  li t6, 16008
  add t6, t1, t6                                                        # ir inst 21 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 22 fin
# Phi connections
  li t6, 0
  j .F.init_memory_pool._4.while.cond.0                                 # ir inst 23 fin
.F.init_memory_pool._4.while.cond.0:
  li t2, 1999
  sltu t5, t6, t2                                                       # ir inst 25 fin
  bnez t5, .F.init_memory_pool._5.while.body.0
  j .F.init_memory_pool._6.while.exit.0                                 # ir inst 26 fin
.F.init_memory_pool._5.while.body.0:
  addi t1, sp, 40
  addi t5, t1, 0                                                        # ir inst 27 fin
  slli t2, t6, 3
  add t4, t5, t2                                                        # ir inst 28 fin
  addi t5, t4, 4                                                        # ir inst 29 fin
  mv t4, t6                                                             # ir inst 30 fin
  addi t3, t4, 1                                                        # ir inst 31 fin
  sw t3, 0(t5)                                                          # ir inst 32 fin
  addi t5, t6, 1                                                        # ir inst 33 fin
# Phi connections
  mv t6, t5
  j .F.init_memory_pool._4.while.cond.0                                 # ir inst 34 fin
.F.init_memory_pool._6.while.exit.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 35 fin
  li t5, 15992
  add t5, t6, t5                                                        # ir inst 36 fin
  addi t6, t5, 4                                                        # ir inst 37 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 38 fin
# Start call preparation
  sd a0, 0(sp)
  li a2, 16012
  addi t1, sp, 40
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 39 fin
  j .F.init_memory_pool.epilogue                                        # ir inst 40 fin
.F.init_memory_pool.epilogue:
  ld ra, 32(sp)
  li t0, 16064
  add sp, sp, t0
  ret

.globl .F.allocate_node
.F.allocate_node:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.allocate_node._0.entry.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.allocate_node._1.if.then.0
  j .F.allocate_node._2.if.else.0                                       # ir inst 4 fin
.F.allocate_node._1.if.then.0:
  li a0, -1
  j .F.allocate_node.epilogue                                           # ir inst 5 fin
.F.allocate_node._2.if.else.0:
  j .F.allocate_node._3.if.exit.0                                       # ir inst 6 fin
.F.allocate_node._3.if.exit.0:
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 7 fin
  lw t5, 0(t6)                                                          # ir inst 8 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 9 fin
  addi t4, a0, 0                                                        # ir inst 10 fin
  mv t3, t5                                                             # ir inst 11 fin
  slli t2, t3, 3
  add s11, t4, t2                                                       # ir inst 12 fin
  addi t4, s11, 4                                                       # ir inst 13 fin
  lw t3, 0(t4)                                                          # ir inst 14 fin
  sw t3, 0(t6)                                                          # ir inst 15 fin
  addi t6, a0, 0                                                        # ir inst 16 fin
  mv t4, t5                                                             # ir inst 17 fin
  slli t2, t4, 3
  add t3, t6, t2                                                        # ir inst 18 fin
  addi t6, t3, 0                                                        # ir inst 19 fin
  sw a1, 0(t6)                                                          # ir inst 20 fin
  addi t6, a0, 0                                                        # ir inst 21 fin
  mv t4, t5                                                             # ir inst 22 fin
  slli t2, t4, 3
  add t3, t6, t2                                                        # ir inst 23 fin
  addi t6, t3, 4                                                        # ir inst 24 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 25 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 26 fin
  li t4, 16004
  add t4, a0, t4                                                        # ir inst 27 fin
  lw t3, 0(t4)                                                          # ir inst 28 fin
  addi t4, t3, 1                                                        # ir inst 29 fin
  sw t4, 0(t6)                                                          # ir inst 30 fin
  mv a0, t5
  j .F.allocate_node.epilogue                                           # ir inst 31 fin
.F.allocate_node.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.deallocate_node
.F.deallocate_node:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.deallocate_node._0.entry.0:
  li t2, -1
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.deallocate_node._1.if.then.0
  j .F.deallocate_node._2.if.else.0                                     # ir inst 2 fin
.F.deallocate_node._1.if.then.0:
  j .F.deallocate_node.epilogue                                         # ir inst 3 fin
.F.deallocate_node._2.if.else.0:
  j .F.deallocate_node._3.if.exit.0                                     # ir inst 4 fin
.F.deallocate_node._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  mv t5, a1                                                             # ir inst 6 fin
  slli t2, t5, 3
  add t4, t6, t2                                                        # ir inst 7 fin
  addi t6, t4, 4                                                        # ir inst 8 fin
  li t5, 16000
  add t5, a0, t5                                                        # ir inst 9 fin
  lw t4, 0(t5)                                                          # ir inst 10 fin
  sw t4, 0(t6)                                                          # ir inst 11 fin
  li t6, 16000
  add t6, a0, t6                                                        # ir inst 12 fin
  sw a1, 0(t6)                                                          # ir inst 13 fin
  li t6, 16004
  add t6, a0, t6                                                        # ir inst 14 fin
  li t5, 16004
  add t5, a0, t5                                                        # ir inst 15 fin
  lw t4, 0(t5)                                                          # ir inst 16 fin
  addi t5, t4, -1                                                       # ir inst 17 fin
  sw t5, 0(t6)                                                          # ir inst 18 fin
  j .F.deallocate_node.epilogue                                         # ir inst 19 fin
.F.deallocate_node.epilogue:
  ret

.globl .F.init_stack
.F.init_stack:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_stack._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.init_stack._1.array.cond.0                                       # ir inst 3 fin
.F.init_stack._1.array.cond.0:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F.init_stack._2.array.body.0
  j .F.init_stack._3.array.exit.0                                       # ir inst 6 fin
.F.init_stack._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F.init_stack._1.array.cond.0                                       # ir inst 10 fin
.F.init_stack._3.array.exit.0:
  addi t6, a0, 2000                                                     # ir inst 11 fin
  li t1, -1
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 2004                                                     # ir inst 13 fin
  li t1, 500
  mv t5, t1                                                             # ir inst 14 fin
  sw t5, 0(t6)                                                          # ir inst 15 fin
  j .F.init_stack.epilogue                                              # ir inst 16 fin
.F.init_stack.epilogue:
  ret

.globl .F.stack_push
.F.stack_push:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.stack_push._0.entry.0:
  addi t6, a0, 2000                                                     # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 2004                                                     # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
  addi t6, t4, -1                                                       # ir inst 5 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 6 fin
  bnez t4, .F.stack_push._1.if.then.0
  j .F.stack_push._2.if.else.0                                          # ir inst 7 fin
.F.stack_push._1.if.then.0:
  li a0, 0
  j .F.stack_push.epilogue                                              # ir inst 8 fin
.F.stack_push._2.if.else.0:
  j .F.stack_push._3.if.exit.0                                          # ir inst 9 fin
.F.stack_push._3.if.exit.0:
  addi t6, a0, 2000                                                     # ir inst 10 fin
  addi t5, a0, 2000                                                     # ir inst 11 fin
  lw t4, 0(t5)                                                          # ir inst 12 fin
  addi t5, t4, 1                                                        # ir inst 13 fin
  sw t5, 0(t6)                                                          # ir inst 14 fin
  addi t6, a0, 0                                                        # ir inst 15 fin
  addi t5, a0, 2000                                                     # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  mv t5, t4                                                             # ir inst 18 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  sw a1, 0(t4)                                                          # ir inst 20 fin
  li a0, 1
  j .F.stack_push.epilogue                                              # ir inst 21 fin
.F.stack_push.epilogue:
  ret

.globl .F.stack_pop
.F.stack_pop:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.stack_pop._0.entry.0:
  addi t6, a0, 2000                                                     # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 3 fin
  bnez t6, .F.stack_pop._1.if.then.0
  j .F.stack_pop._2.if.else.0                                           # ir inst 4 fin
.F.stack_pop._1.if.then.0:
  li a0, -999999
  j .F.stack_pop.epilogue                                               # ir inst 5 fin
.F.stack_pop._2.if.else.0:
  j .F.stack_pop._3.if.exit.0                                           # ir inst 6 fin
.F.stack_pop._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 7 fin
  addi t5, a0, 2000                                                     # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  mv t5, t4                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 11 fin
  lw t6, 0(t4)                                                          # ir inst 12 fin
  addi t5, a0, 2000                                                     # ir inst 13 fin
  addi t4, a0, 2000                                                     # ir inst 14 fin
  lw t3, 0(t4)                                                          # ir inst 15 fin
  addi t4, t3, -1                                                       # ir inst 16 fin
  sw t4, 0(t5)                                                          # ir inst 17 fin
  mv a0, t6
  j .F.stack_pop.epilogue                                               # ir inst 18 fin
.F.stack_pop.epilogue:
  ret

.globl .F.stack_is_empty
.F.stack_is_empty:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.stack_is_empty._0.entry.0:
  addi t6, a0, 2000                                                     # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.stack_is_empty.epilogue                                          # ir inst 4 fin
.F.stack_is_empty.epilogue:
  ret

.globl .F.init_queue
.F.init_queue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_queue._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.init_queue._1.array.cond.0                                       # ir inst 3 fin
.F.init_queue._1.array.cond.0:
  li t2, 500
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F.init_queue._2.array.body.0
  j .F.init_queue._3.array.exit.0                                       # ir inst 6 fin
.F.init_queue._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F.init_queue._1.array.cond.0                                       # ir inst 10 fin
.F.init_queue._3.array.exit.0:
  addi t6, a0, 2000                                                     # ir inst 11 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 2004                                                     # ir inst 13 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 14 fin
  addi t6, a0, 2008                                                     # ir inst 15 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 16 fin
  addi t6, a0, 2012                                                     # ir inst 17 fin
  li t1, 500
  mv t5, t1                                                             # ir inst 18 fin
  sw t5, 0(t6)                                                          # ir inst 19 fin
  j .F.init_queue.epilogue                                              # ir inst 20 fin
.F.init_queue.epilogue:
  ret

.globl .F.queue_enqueue
.F.queue_enqueue:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.queue_enqueue._0.entry.0:
  addi t6, a0, 2008                                                     # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  addi t6, a0, 2012                                                     # ir inst 3 fin
  lw t4, 0(t6)                                                          # ir inst 4 fin
  slt t0, t5, t4
  xori t6, t0, 1                                                        # ir inst 5 fin
  bnez t6, .F.queue_enqueue._1.if.then.0
  j .F.queue_enqueue._2.if.else.0                                       # ir inst 6 fin
.F.queue_enqueue._1.if.then.0:
  li a0, 0
  j .F.queue_enqueue.epilogue                                           # ir inst 7 fin
.F.queue_enqueue._2.if.else.0:
  j .F.queue_enqueue._3.if.exit.0                                       # ir inst 8 fin
.F.queue_enqueue._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 9 fin
  addi t5, a0, 2004                                                     # ir inst 10 fin
  lw t4, 0(t5)                                                          # ir inst 11 fin
  mv t5, t4                                                             # ir inst 12 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 13 fin
  sw a1, 0(t4)                                                          # ir inst 14 fin
  addi t6, a0, 2004                                                     # ir inst 15 fin
  addi t5, a0, 2004                                                     # ir inst 16 fin
  lw t4, 0(t5)                                                          # ir inst 17 fin
  addi t5, t4, 1                                                        # ir inst 18 fin
  addi t4, a0, 2012                                                     # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  rem t4, t5, t3                                                        # ir inst 21 fin
  sw t4, 0(t6)                                                          # ir inst 22 fin
  addi t6, a0, 2008                                                     # ir inst 23 fin
  addi t5, a0, 2008                                                     # ir inst 24 fin
  lw t4, 0(t5)                                                          # ir inst 25 fin
  addi t5, t4, 1                                                        # ir inst 26 fin
  sw t5, 0(t6)                                                          # ir inst 27 fin
  li a0, 1
  j .F.queue_enqueue.epilogue                                           # ir inst 28 fin
.F.queue_enqueue.epilogue:
  ret

.globl .F.queue_dequeue
.F.queue_dequeue:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.queue_dequeue._0.entry.0:
  addi t6, a0, 2008                                                     # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t0, t2, t5
  xori t6, t0, 1                                                        # ir inst 3 fin
  bnez t6, .F.queue_dequeue._1.if.then.0
  j .F.queue_dequeue._2.if.else.0                                       # ir inst 4 fin
.F.queue_dequeue._1.if.then.0:
  li a0, -999999
  j .F.queue_dequeue.epilogue                                           # ir inst 5 fin
.F.queue_dequeue._2.if.else.0:
  j .F.queue_dequeue._3.if.exit.0                                       # ir inst 6 fin
.F.queue_dequeue._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 7 fin
  addi t5, a0, 2000                                                     # ir inst 8 fin
  lw t4, 0(t5)                                                          # ir inst 9 fin
  mv t5, t4                                                             # ir inst 10 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 11 fin
  lw t6, 0(t4)                                                          # ir inst 12 fin
  addi t5, a0, 2000                                                     # ir inst 13 fin
  addi t4, a0, 2000                                                     # ir inst 14 fin
  lw t3, 0(t4)                                                          # ir inst 15 fin
  addi t4, t3, 1                                                        # ir inst 16 fin
  addi t3, a0, 2012                                                     # ir inst 17 fin
  lw s11, 0(t3)                                                         # ir inst 18 fin
  rem t3, t4, s11                                                       # ir inst 19 fin
  sw t3, 0(t5)                                                          # ir inst 20 fin
  addi t5, a0, 2008                                                     # ir inst 21 fin
  addi t4, a0, 2008                                                     # ir inst 22 fin
  lw t3, 0(t4)                                                          # ir inst 23 fin
  addi t4, t3, -1                                                       # ir inst 24 fin
  sw t4, 0(t5)                                                          # ir inst 25 fin
  mv a0, t6
  j .F.queue_dequeue.epilogue                                           # ir inst 26 fin
.F.queue_dequeue.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.queue_is_empty
.F.queue_is_empty:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.queue_is_empty._0.entry.0:
  addi t6, a0, 2008                                                     # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t2, 0
  slt t0, t2, t5
  xori t6, t0, 1                                                        # ir inst 3 fin
  mv a0, t6
  j .F.queue_is_empty.epilogue                                          # ir inst 4 fin
.F.queue_is_empty.epilogue:
  ret

.globl .F.hash_function
.F.hash_function:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.hash_function._0.entry.0:
  li t2, 31
  mul t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 17                                                       # ir inst 2 fin
  li t1, 127
  mv t6, t1                                                             # ir inst 3 fin
  rem t4, t5, t6                                                        # ir inst 4 fin
  li t2, 0
  slt t6, t4, t2                                                        # ir inst 5 fin
  bnez t6, .F.hash_function._1.if.then.0
  j .F.hash_function._2.if.else.0                                       # ir inst 6 fin
.F.hash_function._1.if.then.0:
  li t1, 127
  mv t6, t1                                                             # ir inst 7 fin
  add t5, t4, t6                                                        # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.hash_function._3.if.exit.0                                       # ir inst 9 fin
.F.hash_function._2.if.else.0:
# Phi connections
  mv t6, t4
  j .F.hash_function._3.if.exit.0                                       # ir inst 10 fin
.F.hash_function._3.if.exit.0:
  mv a0, t6
  j .F.hash_function.epilogue                                           # ir inst 12 fin
.F.hash_function.epilogue:
  ret

.globl .F.init_hash_table
.F.init_hash_table:
# spill func args num: 0,             range:    16576(sp) -    16576(sp)
# local var size: 16528,              range:       40(sp) -    16568(sp)
# return addr size: 8,                range:       32(sp) -       40(sp)
# callee save reg num: 0 / 12,        range:       32(sp) -       32(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -16576
  add sp, sp, t0
  sd ra, 32(sp)
.F.init_hash_table._0.entry.0:
  addi t1, sp, 40
  addi t6, t1, 0                                                        # ir inst 2 fin
  addi t5, t6, 0                                                        # ir inst 3 fin
# Phi connections
  li t6, 0
  j .F.init_hash_table._1.array.cond.0                                  # ir inst 4 fin
.F.init_hash_table._1.array.cond.0:
  li t2, 127
  slt t4, t6, t2                                                        # ir inst 6 fin
  bnez t4, .F.init_hash_table._2.array.body.0
  j .F.init_hash_table._3.array.exit.0                                  # ir inst 7 fin
.F.init_hash_table._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 8 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 9 fin
  addi t4, t6, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t4
  j .F.init_hash_table._1.array.cond.0                                  # ir inst 11 fin
.F.init_hash_table._3.array.exit.0:
  addi t1, sp, 40
  addi t6, t1, 508                                                      # ir inst 12 fin
  li t1, 16552
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 14 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 15 fin
  li t1, 16552
  add t1, sp, t1
  addi t5, t1, 4                                                        # ir inst 16 fin
  li t1, 0
  sw t1, 0(t5)                                                          # ir inst 17 fin
  li t1, 16552
  add t1, sp, t1
  addi t5, t1, 8                                                        # ir inst 18 fin
  li t1, -1
  sw t1, 0(t5)                                                          # ir inst 19 fin
  li t1, 16552
  add t1, sp, t1
  addi t5, t1, 12                                                       # ir inst 20 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 21 fin
  addi t5, t6, 0                                                        # ir inst 22 fin
# Phi connections
  li t6, 0
  j .F.init_hash_table._4.array.cond.1                                  # ir inst 23 fin
.F.init_hash_table._4.array.cond.1:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 25 fin
  bnez t4, .F.init_hash_table._5.array.body.1
  j .F.init_hash_table._6.array.exit.1                                  # ir inst 26 fin
.F.init_hash_table._5.array.body.1:
  slli t2, t6, 4
  add t4, t5, t2                                                        # ir inst 27 fin
# Start call preparation
  sd a0, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  li a2, 16
  li t1, 16552
  add t1, sp, t1
  mv a1, t1
  mv a0, t4
  call memcpy
  ld a0, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 28 fin
  addi t4, t6, 1                                                        # ir inst 29 fin
# Phi connections
  mv t6, t4
  j .F.init_hash_table._4.array.cond.1                                  # ir inst 30 fin
.F.init_hash_table._6.array.exit.1:
  addi t1, sp, 40
  li t6, 16508
  add t6, t1, t6                                                        # ir inst 31 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 32 fin
# Phi connections
  li t6, 0
  j .F.init_hash_table._7.while.cond.0                                  # ir inst 33 fin
.F.init_hash_table._7.while.cond.0:
  li t2, 1000
  sltu t5, t6, t2                                                       # ir inst 35 fin
  bnez t5, .F.init_hash_table._8.while.body.0
  j .F.init_hash_table._9.while.exit.0                                  # ir inst 36 fin
.F.init_hash_table._8.while.body.0:
  addi t1, sp, 40
  addi t5, t1, 508                                                      # ir inst 37 fin
  slli t2, t6, 4
  add t4, t5, t2                                                        # ir inst 38 fin
  addi t5, t4, 12                                                       # ir inst 39 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 40 fin
  addi t5, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t6, t5
  j .F.init_hash_table._7.while.cond.0                                  # ir inst 42 fin
.F.init_hash_table._9.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  li a2, 16512
  addi t1, sp, 40
  mv a1, t1
  call memcpy
  ld a0, 0(sp)
# ir inst 43 fin
  j .F.init_hash_table.epilogue                                         # ir inst 44 fin
.F.init_hash_table.epilogue:
  ld ra, 32(sp)
  li t0, 16576
  add sp, sp, t0
  ret

.globl .F.hash_table_insert
.F.hash_table_insert:
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
.F.hash_table_insert._0.entry.0:
  li t6, 16508
  add t6, a0, t6                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  li t1, 1000
  mv t6, t1                                                             # ir inst 3 fin
  slt t0, t5, t6
  xori t4, t0, 1                                                        # ir inst 4 fin
  bnez t4, .F.hash_table_insert._1.if.then.0
  j .F.hash_table_insert._2.if.else.0                                   # ir inst 5 fin
.F.hash_table_insert._1.if.then.0:
  li a0, 0
  j .F.hash_table_insert.epilogue                                       # ir inst 6 fin
.F.hash_table_insert._2.if.else.0:
  j .F.hash_table_insert._3.if.exit.0                                   # ir inst 7 fin
.F.hash_table_insert._3.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  mv a0, a1
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 8 fin
  addi t5, a0, 0                                                        # ir inst 9 fin
  mv t4, t6                                                             # ir inst 10 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 11 fin
  lw t5, 0(t3)                                                          # ir inst 12 fin
# Phi connections
  j .F.hash_table_insert._4.while.cond.0                                # ir inst 13 fin
.F.hash_table_insert._4.while.cond.0:
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 15 fin
  bnez t4, .F.hash_table_insert._5.while.body.0
  j .F.hash_table_insert._9.while.exit.0                                # ir inst 16 fin
.F.hash_table_insert._5.while.body.0:
  addi t4, a0, 508                                                      # ir inst 17 fin
  mv t3, t5                                                             # ir inst 18 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 19 fin
  addi t4, s11, 0                                                       # ir inst 20 fin
  lw t3, 0(t4)                                                          # ir inst 21 fin
  xor t0, t3, a1
  sltiu t4, t0, 1                                                       # ir inst 22 fin
  bnez t4, .F.hash_table_insert._6.if.then.1
  j .F.hash_table_insert._7.if.else.1                                   # ir inst 23 fin
.F.hash_table_insert._6.if.then.1:
  addi t4, a0, 508                                                      # ir inst 24 fin
  mv t3, t5                                                             # ir inst 25 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 26 fin
  addi t4, s11, 4                                                       # ir inst 27 fin
  sw a2, 0(t4)                                                          # ir inst 28 fin
  li a0, 1
  j .F.hash_table_insert.epilogue                                       # ir inst 29 fin
.F.hash_table_insert._7.if.else.1:
  j .F.hash_table_insert._8.if.exit.1                                   # ir inst 30 fin
.F.hash_table_insert._8.if.exit.1:
  addi t4, a0, 508                                                      # ir inst 31 fin
  mv t3, t5                                                             # ir inst 32 fin
  slli t2, t3, 4
  add t5, t4, t2                                                        # ir inst 33 fin
  addi t4, t5, 8                                                        # ir inst 34 fin
  lw t5, 0(t4)                                                          # ir inst 35 fin
# Phi connections
  j .F.hash_table_insert._4.while.cond.0                                # ir inst 36 fin
.F.hash_table_insert._9.while.exit.0:
# Phi connections
  li t5, 0
  j .F.hash_table_insert._10.while.cond.1                               # ir inst 37 fin
.F.hash_table_insert._10.while.cond.1:
  li t1, 1000
  mv t4, t1                                                             # ir inst 39 fin
  slt t3, t5, t4                                                        # ir inst 40 fin
  bnez t3, .F.hash_table_insert._11.lazy.then.0
  j .F.hash_table_insert._12.lazy.else.0                                # ir inst 41 fin
.F.hash_table_insert._11.lazy.then.0:
  addi t4, a0, 508                                                      # ir inst 42 fin
  mv t3, t5                                                             # ir inst 43 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 44 fin
  addi t4, s11, 12                                                      # ir inst 45 fin
  lb t3, 0(t4)                                                          # ir inst 46 fin
# Phi connections
  mv t4, t3
  j .F.hash_table_insert._13.lazy.exit.0                                # ir inst 47 fin
.F.hash_table_insert._12.lazy.else.0:
# Phi connections
  li t4, 0
  j .F.hash_table_insert._13.lazy.exit.0                                # ir inst 48 fin
.F.hash_table_insert._13.lazy.exit.0:
  bnez t4, .F.hash_table_insert._14.while.body.1
  j .F.hash_table_insert._15.while.exit.1                               # ir inst 50 fin
.F.hash_table_insert._14.while.body.1:
  addi t4, t5, 1                                                        # ir inst 51 fin
# Phi connections
  mv t5, t4
  j .F.hash_table_insert._10.while.cond.1                               # ir inst 52 fin
.F.hash_table_insert._15.while.exit.1:
  li t1, 1000
  mv t4, t1                                                             # ir inst 53 fin
  slt t0, t5, t4
  xori t3, t0, 1                                                        # ir inst 54 fin
  bnez t3, .F.hash_table_insert._16.if.then.2
  j .F.hash_table_insert._17.if.else.2                                  # ir inst 55 fin
.F.hash_table_insert._16.if.then.2:
  li a0, 0
  j .F.hash_table_insert.epilogue                                       # ir inst 56 fin
.F.hash_table_insert._17.if.else.2:
  j .F.hash_table_insert._18.if.exit.2                                  # ir inst 57 fin
.F.hash_table_insert._18.if.exit.2:
  addi t4, a0, 508                                                      # ir inst 58 fin
  mv t3, t5                                                             # ir inst 59 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 60 fin
  addi t4, s11, 0                                                       # ir inst 61 fin
  sw a1, 0(t4)                                                          # ir inst 62 fin
  addi t4, a0, 508                                                      # ir inst 63 fin
  mv t3, t5                                                             # ir inst 64 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 65 fin
  addi t4, s11, 4                                                       # ir inst 66 fin
  sw a2, 0(t4)                                                          # ir inst 67 fin
  addi t4, a0, 508                                                      # ir inst 68 fin
  mv t3, t5                                                             # ir inst 69 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 70 fin
  addi t4, s11, 8                                                       # ir inst 71 fin
  addi t3, a0, 0                                                        # ir inst 72 fin
  mv s11, t6                                                            # ir inst 73 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 74 fin
  lw t3, 0(s10)                                                         # ir inst 75 fin
  sw t3, 0(t4)                                                          # ir inst 76 fin
  addi t4, a0, 508                                                      # ir inst 77 fin
  mv t3, t5                                                             # ir inst 78 fin
  slli t2, t3, 4
  add s11, t4, t2                                                       # ir inst 79 fin
  addi t4, s11, 12                                                      # ir inst 80 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 81 fin
  addi t4, a0, 0                                                        # ir inst 82 fin
  mv t3, t6                                                             # ir inst 83 fin
  slli t2, t3, 2
  add t6, t4, t2                                                        # ir inst 84 fin
  sw t5, 0(t6)                                                          # ir inst 85 fin
  li t6, 16508
  add t6, a0, t6                                                        # ir inst 86 fin
  li t5, 16508
  add t5, a0, t5                                                        # ir inst 87 fin
  lw t4, 0(t5)                                                          # ir inst 88 fin
  addi t5, t4, 1                                                        # ir inst 89 fin
  sw t5, 0(t6)                                                          # ir inst 90 fin
  li a0, 1
  j .F.hash_table_insert.epilogue                                       # ir inst 91 fin
.F.hash_table_insert.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.hash_table_search
.F.hash_table_search:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.hash_table_search._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  mv a0, a1
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
  addi t5, a0, 0                                                        # ir inst 2 fin
  mv t4, t6                                                             # ir inst 3 fin
  slli t2, t4, 2
  add t6, t5, t2                                                        # ir inst 4 fin
  lw t5, 0(t6)                                                          # ir inst 5 fin
# Phi connections
  mv t6, t5
  j .F.hash_table_search._1.while.cond.0                                # ir inst 6 fin
.F.hash_table_search._1.while.cond.0:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 8 fin
  bnez t5, .F.hash_table_search._2.while.body.0
  j .F.hash_table_search._6.while.exit.0                                # ir inst 9 fin
.F.hash_table_search._2.while.body.0:
  addi t5, a0, 508                                                      # ir inst 10 fin
  mv t4, t6                                                             # ir inst 11 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 12 fin
  addi t5, t3, 0                                                        # ir inst 13 fin
  lw t4, 0(t5)                                                          # ir inst 14 fin
  xor t0, t4, a1
  sltiu t5, t0, 1                                                       # ir inst 15 fin
  bnez t5, .F.hash_table_search._3.if.then.0
  j .F.hash_table_search._4.if.else.0                                   # ir inst 16 fin
.F.hash_table_search._3.if.then.0:
  addi t5, a0, 508                                                      # ir inst 17 fin
  mv t4, t6                                                             # ir inst 18 fin
  slli t2, t4, 4
  add t3, t5, t2                                                        # ir inst 19 fin
  addi t5, t3, 4                                                        # ir inst 20 fin
  lw t4, 0(t5)                                                          # ir inst 21 fin
  mv a0, t4
  j .F.hash_table_search.epilogue                                       # ir inst 22 fin
.F.hash_table_search._4.if.else.0:
  j .F.hash_table_search._5.if.exit.0                                   # ir inst 23 fin
.F.hash_table_search._5.if.exit.0:
  addi t5, a0, 508                                                      # ir inst 24 fin
  mv t4, t6                                                             # ir inst 25 fin
  slli t2, t4, 4
  add t6, t5, t2                                                        # ir inst 26 fin
  addi t5, t6, 8                                                        # ir inst 27 fin
  lw t6, 0(t5)                                                          # ir inst 28 fin
# Phi connections
  j .F.hash_table_search._1.while.cond.0                                # ir inst 29 fin
.F.hash_table_search._6.while.exit.0:
  li a0, -999999
  j .F.hash_table_search.epilogue                                       # ir inst 30 fin
.F.hash_table_search.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.hash_table_delete
.F.hash_table_delete:
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
.F.hash_table_delete._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  mv a0, a1
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 1 fin
  addi t5, a0, 0                                                        # ir inst 2 fin
  mv t4, t6                                                             # ir inst 3 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 4 fin
  lw t5, 0(t3)                                                          # ir inst 5 fin
# Phi connections
  mv t4, t5
  li t5, -1
  j .F.hash_table_delete._1.while.cond.0                                # ir inst 6 fin
.F.hash_table_delete._1.while.cond.0:
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 9 fin
  bnez t3, .F.hash_table_delete._2.while.body.0
  j .F.hash_table_delete._9.while.exit.0                                # ir inst 10 fin
.F.hash_table_delete._2.while.body.0:
  addi t3, a0, 508                                                      # ir inst 11 fin
  mv s11, t4                                                            # ir inst 12 fin
  slli t2, s11, 4
  add s10, t3, t2                                                       # ir inst 13 fin
  addi t3, s10, 0                                                       # ir inst 14 fin
  lw s11, 0(t3)                                                         # ir inst 15 fin
  xor t0, s11, a1
  sltiu t3, t0, 1                                                       # ir inst 16 fin
  bnez t3, .F.hash_table_delete._3.if.then.0
  j .F.hash_table_delete._7.if.else.0                                   # ir inst 17 fin
.F.hash_table_delete._3.if.then.0:
  li t2, -1
  xor t0, t5, t2
  sltiu t3, t0, 1                                                       # ir inst 18 fin
  bnez t3, .F.hash_table_delete._4.if.then.1
  j .F.hash_table_delete._5.if.else.1                                   # ir inst 19 fin
.F.hash_table_delete._4.if.then.1:
  addi t3, a0, 0                                                        # ir inst 20 fin
  mv s11, t6                                                            # ir inst 21 fin
  slli t2, s11, 2
  add s10, t3, t2                                                       # ir inst 22 fin
  addi t3, a0, 508                                                      # ir inst 23 fin
  mv s11, t4                                                            # ir inst 24 fin
  slli t2, s11, 4
  add s9, t3, t2                                                        # ir inst 25 fin
  addi t3, s9, 8                                                        # ir inst 26 fin
  lw s11, 0(t3)                                                         # ir inst 27 fin
  sw s11, 0(s10)                                                        # ir inst 28 fin
  j .F.hash_table_delete._6.if.exit.1                                   # ir inst 29 fin
.F.hash_table_delete._5.if.else.1:
  addi t3, a0, 508                                                      # ir inst 30 fin
  mv s11, t5                                                            # ir inst 31 fin
  slli t2, s11, 4
  add t5, t3, t2                                                        # ir inst 32 fin
  addi t3, t5, 8                                                        # ir inst 33 fin
  addi t5, a0, 508                                                      # ir inst 34 fin
  mv s11, t4                                                            # ir inst 35 fin
  slli t2, s11, 4
  add s10, t5, t2                                                       # ir inst 36 fin
  addi t5, s10, 8                                                       # ir inst 37 fin
  lw s11, 0(t5)                                                         # ir inst 38 fin
  sw s11, 0(t3)                                                         # ir inst 39 fin
  j .F.hash_table_delete._6.if.exit.1                                   # ir inst 40 fin
.F.hash_table_delete._6.if.exit.1:
  addi t5, a0, 508                                                      # ir inst 41 fin
  mv t3, t4                                                             # ir inst 42 fin
  slli t2, t3, 4
  add s11, t5, t2                                                       # ir inst 43 fin
  addi t5, s11, 12                                                      # ir inst 44 fin
  li t1, 0
  sb t1, 0(t5)                                                          # ir inst 45 fin
  li t5, 16508
  add t5, a0, t5                                                        # ir inst 46 fin
  li t3, 16508
  add t3, a0, t3                                                        # ir inst 47 fin
  lw s11, 0(t3)                                                         # ir inst 48 fin
  addi t3, s11, -1                                                      # ir inst 49 fin
  sw t3, 0(t5)                                                          # ir inst 50 fin
  li a0, 1
  j .F.hash_table_delete.epilogue                                       # ir inst 51 fin
.F.hash_table_delete._7.if.else.0:
  j .F.hash_table_delete._8.if.exit.0                                   # ir inst 52 fin
.F.hash_table_delete._8.if.exit.0:
  addi t5, a0, 508                                                      # ir inst 53 fin
  mv t3, t4                                                             # ir inst 54 fin
  slli t2, t3, 4
  add s11, t5, t2                                                       # ir inst 55 fin
  addi t5, s11, 8                                                       # ir inst 56 fin
  lw t3, 0(t5)                                                          # ir inst 57 fin
# Phi connections
  mv t5, t4
  mv t4, t3
  j .F.hash_table_delete._1.while.cond.0                                # ir inst 58 fin
.F.hash_table_delete._9.while.exit.0:
  li a0, 0
  j .F.hash_table_delete.epilogue                                       # ir inst 59 fin
.F.hash_table_delete.epilogue:
  ld ra, 48(sp)
  ld s9, 24(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.init_list_manager
.F.init_list_manager:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_list_manager._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  addi t5, t6, 0                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.init_list_manager._1.array.cond.0                                # ir inst 3 fin
.F.init_list_manager._1.array.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 5 fin
  bnez t4, .F.init_list_manager._2.array.body.0
  j .F.init_list_manager._3.array.exit.0                                # ir inst 6 fin
.F.init_list_manager._2.array.body.0:
  slli t2, t6, 2
  add t4, t5, t2                                                        # ir inst 7 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t6, 1                                                        # ir inst 9 fin
# Phi connections
  mv t6, t4
  j .F.init_list_manager._1.array.cond.0                                # ir inst 10 fin
.F.init_list_manager._3.array.exit.0:
  addi t6, a0, 40                                                       # ir inst 11 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 12 fin
  addi t6, a0, 44                                                       # ir inst 13 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 14 fin
  j .F.init_list_manager.epilogue                                       # ir inst 15 fin
.F.init_list_manager.epilogue:
  ret

.globl .F.list_insert_head
.F.list_insert_head:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.list_insert_head._0.entry.0:
  li t2, 0
  slt t6, a2, t2                                                        # ir inst 1 fin
  bnez t6, .F.list_insert_head._1.lazy.then.0
  j .F.list_insert_head._2.lazy.else.0                                  # ir inst 2 fin
.F.list_insert_head._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.list_insert_head._3.lazy.exit.0                                  # ir inst 3 fin
.F.list_insert_head._2.lazy.else.0:
  li t2, 10
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.list_insert_head._3.lazy.exit.0                                  # ir inst 5 fin
.F.list_insert_head._3.lazy.exit.0:
  bnez t6, .F.list_insert_head._4.if.then.0
  j .F.list_insert_head._5.if.else.0                                    # ir inst 7 fin
.F.list_insert_head._4.if.then.0:
  li a0, 0
  j .F.list_insert_head.epilogue                                        # ir inst 8 fin
.F.list_insert_head._5.if.else.0:
  j .F.list_insert_head._6.if.exit.0                                    # ir inst 9 fin
.F.list_insert_head._6.if.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a0, a1
  mv a1, a3
  call .F.allocate_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 10 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  mv a0, a1
  mv a1, a3
  call .F.allocate_node
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
# ir inst 11 fin
  li t2, -1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 12 fin
  bnez t5, .F.list_insert_head._7.if.then.1
  j .F.list_insert_head._8.if.else.1                                    # ir inst 13 fin
.F.list_insert_head._7.if.then.1:
  li a0, 0
  j .F.list_insert_head.epilogue                                        # ir inst 14 fin
.F.list_insert_head._8.if.else.1:
  j .F.list_insert_head._9.if.exit.1                                    # ir inst 15 fin
.F.list_insert_head._9.if.exit.1:
  addi t5, a1, 0                                                        # ir inst 16 fin
  mv t4, t6                                                             # ir inst 17 fin
  slli t2, t4, 3
  add t3, t5, t2                                                        # ir inst 18 fin
  addi t5, t3, 4                                                        # ir inst 19 fin
  addi t4, a0, 0                                                        # ir inst 20 fin
  mv t3, a2                                                             # ir inst 21 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 22 fin
  lw t4, 0(s11)                                                         # ir inst 23 fin
  sw t4, 0(t5)                                                          # ir inst 24 fin
  addi t5, a0, 0                                                        # ir inst 25 fin
  mv t4, a2                                                             # ir inst 26 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 27 fin
  sw t6, 0(t3)                                                          # ir inst 28 fin
  addi t6, a0, 44                                                       # ir inst 29 fin
  addi t5, a0, 44                                                       # ir inst 30 fin
  lw t4, 0(t5)                                                          # ir inst 31 fin
  addi t5, t4, 1                                                        # ir inst 32 fin
  sw t5, 0(t6)                                                          # ir inst 33 fin
  li a0, 1
  j .F.list_insert_head.epilogue                                        # ir inst 34 fin
.F.list_insert_head.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.list_search
.F.list_search:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.list_search._0.entry.0:
  li t2, 0
  slt t6, a2, t2                                                        # ir inst 1 fin
  bnez t6, .F.list_search._1.lazy.then.0
  j .F.list_search._2.lazy.else.0                                       # ir inst 2 fin
.F.list_search._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.list_search._3.lazy.exit.0                                       # ir inst 3 fin
.F.list_search._2.lazy.else.0:
  li t2, 10
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.list_search._3.lazy.exit.0                                       # ir inst 5 fin
.F.list_search._3.lazy.exit.0:
  bnez t6, .F.list_search._4.if.then.0
  j .F.list_search._5.if.else.0                                         # ir inst 7 fin
.F.list_search._4.if.then.0:
  li a0, 0
  j .F.list_search.epilogue                                             # ir inst 8 fin
.F.list_search._5.if.else.0:
  j .F.list_search._6.if.exit.0                                         # ir inst 9 fin
.F.list_search._6.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 10 fin
  mv t5, a2                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  lw t6, 0(t4)                                                          # ir inst 13 fin
# Phi connections
  j .F.list_search._7.while.cond.0                                      # ir inst 14 fin
.F.list_search._7.while.cond.0:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 16 fin
  bnez t5, .F.list_search._8.while.body.0
  j .F.list_search._12.while.exit.0                                     # ir inst 17 fin
.F.list_search._8.while.body.0:
  addi t5, a1, 0                                                        # ir inst 18 fin
  mv t4, t6                                                             # ir inst 19 fin
  slli t2, t4, 3
  add t3, t5, t2                                                        # ir inst 20 fin
  addi t5, t3, 0                                                        # ir inst 21 fin
  lw t4, 0(t5)                                                          # ir inst 22 fin
  xor t0, t4, a3
  sltiu t5, t0, 1                                                       # ir inst 23 fin
  bnez t5, .F.list_search._9.if.then.1
  j .F.list_search._10.if.else.1                                        # ir inst 24 fin
.F.list_search._9.if.then.1:
  li a0, 1
  j .F.list_search.epilogue                                             # ir inst 25 fin
.F.list_search._10.if.else.1:
  j .F.list_search._11.if.exit.1                                        # ir inst 26 fin
.F.list_search._11.if.exit.1:
  addi t5, a1, 0                                                        # ir inst 27 fin
  mv t4, t6                                                             # ir inst 28 fin
  slli t2, t4, 3
  add t6, t5, t2                                                        # ir inst 29 fin
  addi t5, t6, 4                                                        # ir inst 30 fin
  lw t6, 0(t5)                                                          # ir inst 31 fin
# Phi connections
  j .F.list_search._7.while.cond.0                                      # ir inst 32 fin
.F.list_search._12.while.exit.0:
  li a0, 0
  j .F.list_search.epilogue                                             # ir inst 33 fin
.F.list_search.epilogue:
  ret

.globl .F.list_delete
.F.list_delete:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 2 / 12,        range:       40(sp) -       56(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.list_delete._0.entry.0:
  li t2, 0
  slt t6, a2, t2                                                        # ir inst 1 fin
  bnez t6, .F.list_delete._1.lazy.then.0
  j .F.list_delete._2.lazy.else.0                                       # ir inst 2 fin
.F.list_delete._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.list_delete._3.lazy.exit.0                                       # ir inst 3 fin
.F.list_delete._2.lazy.else.0:
  li t2, 10
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.list_delete._3.lazy.exit.0                                       # ir inst 5 fin
.F.list_delete._3.lazy.exit.0:
  bnez t6, .F.list_delete._4.if.then.0
  j .F.list_delete._5.if.else.0                                         # ir inst 7 fin
.F.list_delete._4.if.then.0:
  li a0, 0
  j .F.list_delete.epilogue                                             # ir inst 8 fin
.F.list_delete._5.if.else.0:
  j .F.list_delete._6.if.exit.0                                         # ir inst 9 fin
.F.list_delete._6.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 10 fin
  mv t5, a2                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  lw t6, 0(t4)                                                          # ir inst 13 fin
# Phi connections
  mv t5, t6
  li t6, -1
  j .F.list_delete._7.while.cond.0                                      # ir inst 14 fin
.F.list_delete._7.while.cond.0:
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 17 fin
  bnez t4, .F.list_delete._8.while.body.0
  j .F.list_delete._15.while.exit.0                                     # ir inst 18 fin
.F.list_delete._8.while.body.0:
  addi t4, a1, 0                                                        # ir inst 19 fin
  mv t3, t5                                                             # ir inst 20 fin
  slli t2, t3, 3
  add s11, t4, t2                                                       # ir inst 21 fin
  addi t4, s11, 0                                                       # ir inst 22 fin
  lw t3, 0(t4)                                                          # ir inst 23 fin
  xor t0, t3, a3
  sltiu t4, t0, 1                                                       # ir inst 24 fin
  bnez t4, .F.list_delete._9.if.then.1
  j .F.list_delete._13.if.else.1                                        # ir inst 25 fin
.F.list_delete._9.if.then.1:
  li t2, -1
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 26 fin
  bnez t4, .F.list_delete._10.if.then.2
  j .F.list_delete._11.if.else.2                                        # ir inst 27 fin
.F.list_delete._10.if.then.2:
  addi t4, a0, 0                                                        # ir inst 28 fin
  mv t3, a2                                                             # ir inst 29 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 30 fin
  addi t4, a1, 0                                                        # ir inst 31 fin
  mv t3, t5                                                             # ir inst 32 fin
  slli t2, t3, 3
  add s10, t4, t2                                                       # ir inst 33 fin
  addi t4, s10, 4                                                       # ir inst 34 fin
  lw t3, 0(t4)                                                          # ir inst 35 fin
  sw t3, 0(s11)                                                         # ir inst 36 fin
  j .F.list_delete._12.if.exit.2                                        # ir inst 37 fin
.F.list_delete._11.if.else.2:
  addi t4, a1, 0                                                        # ir inst 38 fin
  mv t3, t6                                                             # ir inst 39 fin
  slli t2, t3, 3
  add t6, t4, t2                                                        # ir inst 40 fin
  addi t4, t6, 4                                                        # ir inst 41 fin
  addi t6, a1, 0                                                        # ir inst 42 fin
  mv t3, t5                                                             # ir inst 43 fin
  slli t2, t3, 3
  add s11, t6, t2                                                       # ir inst 44 fin
  addi t6, s11, 4                                                       # ir inst 45 fin
  lw t3, 0(t6)                                                          # ir inst 46 fin
  sw t3, 0(t4)                                                          # ir inst 47 fin
  j .F.list_delete._12.if.exit.2                                        # ir inst 48 fin
.F.list_delete._12.if.exit.2:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd t5, 32(sp)
  mv a0, a1
  mv a1, t5
  call .F.deallocate_node
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld t5, 32(sp)
# ir inst 49 fin
  addi t6, a0, 44                                                       # ir inst 50 fin
  addi t4, a0, 44                                                       # ir inst 51 fin
  lw t3, 0(t4)                                                          # ir inst 52 fin
  addi t4, t3, -1                                                       # ir inst 53 fin
  sw t4, 0(t6)                                                          # ir inst 54 fin
  li a0, 1
  j .F.list_delete.epilogue                                             # ir inst 55 fin
.F.list_delete._13.if.else.1:
  j .F.list_delete._14.if.exit.1                                        # ir inst 56 fin
.F.list_delete._14.if.exit.1:
  addi t6, a1, 0                                                        # ir inst 57 fin
  mv t4, t5                                                             # ir inst 58 fin
  slli t2, t4, 3
  add t3, t6, t2                                                        # ir inst 59 fin
  addi t6, t3, 4                                                        # ir inst 60 fin
  lw t4, 0(t6)                                                          # ir inst 61 fin
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.list_delete._7.while.cond.0                                      # ir inst 62 fin
.F.list_delete._15.while.exit.0:
  li a0, 0
  j .F.list_delete.epilogue                                             # ir inst 63 fin
.F.list_delete.epilogue:
  ld ra, 56(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.list_length
.F.list_length:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.list_length._0.entry.0:
  li t2, 0
  slt t6, a2, t2                                                        # ir inst 1 fin
  bnez t6, .F.list_length._1.lazy.then.0
  j .F.list_length._2.lazy.else.0                                       # ir inst 2 fin
.F.list_length._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.list_length._3.lazy.exit.0                                       # ir inst 3 fin
.F.list_length._2.lazy.else.0:
  li t2, 10
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.list_length._3.lazy.exit.0                                       # ir inst 5 fin
.F.list_length._3.lazy.exit.0:
  bnez t6, .F.list_length._4.if.then.0
  j .F.list_length._5.if.else.0                                         # ir inst 7 fin
.F.list_length._4.if.then.0:
  li a0, 0
  j .F.list_length.epilogue                                             # ir inst 8 fin
.F.list_length._5.if.else.0:
  j .F.list_length._6.if.exit.0                                         # ir inst 9 fin
.F.list_length._6.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 10 fin
  mv t5, a2                                                             # ir inst 11 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 12 fin
  lw t6, 0(t4)                                                          # ir inst 13 fin
# Phi connections
  mv t5, t6
  li t6, 0
  j .F.list_length._7.while.cond.0                                      # ir inst 14 fin
.F.list_length._7.while.cond.0:
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 17 fin
  bnez t4, .F.list_length._8.while.body.0
  j .F.list_length._9.while.exit.0                                      # ir inst 18 fin
.F.list_length._8.while.body.0:
  addi t4, t6, 1                                                        # ir inst 19 fin
  addi t3, a1, 0                                                        # ir inst 20 fin
  mv s11, t5                                                            # ir inst 21 fin
  slli t2, s11, 3
  add t5, t3, t2                                                        # ir inst 22 fin
  addi t3, t5, 4                                                        # ir inst 23 fin
  lw t5, 0(t3)                                                          # ir inst 24 fin
# Phi connections
  mv t6, t4
  j .F.list_length._7.while.cond.0                                      # ir inst 25 fin
.F.list_length._9.while.exit.0:
  mv a0, t6
  j .F.list_length.epilogue                                             # ir inst 26 fin
.F.list_length.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.list_merge_sorted
.F.list_merge_sorted:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 0(sp)
  sd s8, 8(sp)
  sd s7, 16(sp)
  sd s9, 24(sp)
  sd s10, 32(sp)
.F.list_merge_sorted._0.entry.0:
  li t2, 0
  slt t6, a2, t2                                                        # ir inst 1 fin
  bnez t6, .F.list_merge_sorted._1.lazy.then.0
  j .F.list_merge_sorted._2.lazy.else.0                                 # ir inst 2 fin
.F.list_merge_sorted._1.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.list_merge_sorted._3.lazy.exit.0                                 # ir inst 3 fin
.F.list_merge_sorted._2.lazy.else.0:
  li t2, 10
  slt t0, a2, t2
  xori t6, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.list_merge_sorted._3.lazy.exit.0                                 # ir inst 5 fin
.F.list_merge_sorted._3.lazy.exit.0:
  bnez t6, .F.list_merge_sorted._4.lazy.then.1
  j .F.list_merge_sorted._5.lazy.else.1                                 # ir inst 7 fin
.F.list_merge_sorted._4.lazy.then.1:
# Phi connections
  li t6, 1
  j .F.list_merge_sorted._6.lazy.exit.1                                 # ir inst 8 fin
.F.list_merge_sorted._5.lazy.else.1:
  li t2, 0
  slt t6, a3, t2                                                        # ir inst 9 fin
# Phi connections
  j .F.list_merge_sorted._6.lazy.exit.1                                 # ir inst 10 fin
.F.list_merge_sorted._6.lazy.exit.1:
  bnez t6, .F.list_merge_sorted._7.lazy.then.2
  j .F.list_merge_sorted._8.lazy.else.2                                 # ir inst 12 fin
.F.list_merge_sorted._7.lazy.then.2:
# Phi connections
  li t6, 1
  j .F.list_merge_sorted._9.lazy.exit.2                                 # ir inst 13 fin
.F.list_merge_sorted._8.lazy.else.2:
  li t2, 10
  slt t0, a3, t2
  xori t6, t0, 1                                                        # ir inst 14 fin
# Phi connections
  j .F.list_merge_sorted._9.lazy.exit.2                                 # ir inst 15 fin
.F.list_merge_sorted._9.lazy.exit.2:
  bnez t6, .F.list_merge_sorted._10.lazy.then.3
  j .F.list_merge_sorted._11.lazy.else.3                                # ir inst 17 fin
.F.list_merge_sorted._10.lazy.then.3:
# Phi connections
  li t6, 1
  j .F.list_merge_sorted._12.lazy.exit.3                                # ir inst 18 fin
.F.list_merge_sorted._11.lazy.else.3:
  li t2, 0
  slt t6, a4, t2                                                        # ir inst 19 fin
# Phi connections
  j .F.list_merge_sorted._12.lazy.exit.3                                # ir inst 20 fin
.F.list_merge_sorted._12.lazy.exit.3:
  bnez t6, .F.list_merge_sorted._13.lazy.then.4
  j .F.list_merge_sorted._14.lazy.else.4                                # ir inst 22 fin
.F.list_merge_sorted._13.lazy.then.4:
# Phi connections
  li t6, 1
  j .F.list_merge_sorted._15.lazy.exit.4                                # ir inst 23 fin
.F.list_merge_sorted._14.lazy.else.4:
  li t2, 10
  slt t0, a4, t2
  xori t6, t0, 1                                                        # ir inst 24 fin
# Phi connections
  j .F.list_merge_sorted._15.lazy.exit.4                                # ir inst 25 fin
.F.list_merge_sorted._15.lazy.exit.4:
  bnez t6, .F.list_merge_sorted._16.if.then.0
  j .F.list_merge_sorted._17.if.else.0                                  # ir inst 27 fin
.F.list_merge_sorted._16.if.then.0:
  li a0, 0
  j .F.list_merge_sorted.epilogue                                       # ir inst 28 fin
.F.list_merge_sorted._17.if.else.0:
  j .F.list_merge_sorted._18.if.exit.0                                  # ir inst 29 fin
.F.list_merge_sorted._18.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 30 fin
  mv t5, a2                                                             # ir inst 31 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 32 fin
  lw t6, 0(t4)                                                          # ir inst 33 fin
  addi t5, a0, 0                                                        # ir inst 34 fin
  mv t4, a3                                                             # ir inst 35 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 36 fin
  lw t5, 0(t3)                                                          # ir inst 37 fin
  addi t4, a0, 0                                                        # ir inst 38 fin
  mv t3, a4                                                             # ir inst 39 fin
  slli t2, t3, 2
  add s11, t4, t2                                                       # ir inst 40 fin
  li t1, -1
  sw t1, 0(s11)                                                         # ir inst 41 fin
# Phi connections
  li t4, -1
  j .F.list_merge_sorted._19.while.cond.0                               # ir inst 42 fin
.F.list_merge_sorted._19.while.cond.0:
  li t2, -1
  xor t0, t6, t2
  sltu t3, zero, t0                                                     # ir inst 46 fin
  bnez t3, .F.list_merge_sorted._20.lazy.then.5
  j .F.list_merge_sorted._21.lazy.else.5                                # ir inst 47 fin
.F.list_merge_sorted._20.lazy.then.5:
  li t2, -1
  xor t0, t5, t2
  sltu t3, zero, t0                                                     # ir inst 48 fin
# Phi connections
  j .F.list_merge_sorted._22.lazy.exit.5                                # ir inst 49 fin
.F.list_merge_sorted._21.lazy.else.5:
# Phi connections
  li t3, 0
  j .F.list_merge_sorted._22.lazy.exit.5                                # ir inst 50 fin
.F.list_merge_sorted._22.lazy.exit.5:
  bnez t3, .F.list_merge_sorted._23.while.body.0
  j .F.list_merge_sorted._30.while.exit.0                               # ir inst 52 fin
.F.list_merge_sorted._23.while.body.0:
  addi t3, a1, 0                                                        # ir inst 53 fin
  mv s11, t6                                                            # ir inst 54 fin
  slli t2, s11, 3
  add s10, t3, t2                                                       # ir inst 55 fin
  addi t3, s10, 0                                                       # ir inst 56 fin
  lw s11, 0(t3)                                                         # ir inst 57 fin
  addi t3, a1, 0                                                        # ir inst 58 fin
  mv s10, t5                                                            # ir inst 59 fin
  slli t2, s10, 3
  add s9, t3, t2                                                        # ir inst 60 fin
  addi t3, s9, 0                                                        # ir inst 61 fin
  lw s10, 0(t3)                                                         # ir inst 62 fin
  slt t0, s10, s11
  xori t3, t0, 1                                                        # ir inst 63 fin
  bnez t3, .F.list_merge_sorted._24.if.then.1
  j .F.list_merge_sorted._25.if.else.1                                  # ir inst 64 fin
.F.list_merge_sorted._24.if.then.1:
  addi t3, a1, 0                                                        # ir inst 65 fin
  mv s11, t6                                                            # ir inst 66 fin
  slli t2, s11, 3
  add s10, t3, t2                                                       # ir inst 67 fin
  addi t3, s10, 4                                                       # ir inst 68 fin
  lw s11, 0(t3)                                                         # ir inst 69 fin
# Phi connections
  mv s10, t6
  mv t3, s11
  mv s11, t5
  j .F.list_merge_sorted._26.if.exit.1                                  # ir inst 70 fin
.F.list_merge_sorted._25.if.else.1:
  addi t3, a1, 0                                                        # ir inst 71 fin
  mv s11, t5                                                            # ir inst 72 fin
  slli t2, s11, 3
  add s10, t3, t2                                                       # ir inst 73 fin
  addi t3, s10, 4                                                       # ir inst 74 fin
  lw s11, 0(t3)                                                         # ir inst 75 fin
# Phi connections
  mv s10, t5
  mv t3, t6
  j .F.list_merge_sorted._26.if.exit.1                                  # ir inst 76 fin
.F.list_merge_sorted._26.if.exit.1:
  addi s9, a1, 0                                                        # ir inst 80 fin
  mv s8, s10                                                            # ir inst 81 fin
  slli t2, s8, 3
  add s7, s9, t2                                                        # ir inst 82 fin
  addi s9, s7, 4                                                        # ir inst 83 fin
  li t1, -1
  sw t1, 0(s9)                                                          # ir inst 84 fin
  addi s9, a0, 0                                                        # ir inst 85 fin
  mv s8, a4                                                             # ir inst 86 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 87 fin
  lw s9, 0(s7)                                                          # ir inst 88 fin
  li t2, -1
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 89 fin
  bnez s8, .F.list_merge_sorted._27.if.then.2
  j .F.list_merge_sorted._28.if.else.2                                  # ir inst 90 fin
.F.list_merge_sorted._27.if.then.2:
  addi s9, a0, 0                                                        # ir inst 91 fin
  mv s8, a4                                                             # ir inst 92 fin
  slli t2, s8, 2
  add s7, s9, t2                                                        # ir inst 93 fin
  sw s10, 0(s7)                                                         # ir inst 94 fin
# Phi connections
  j .F.list_merge_sorted._29.if.exit.2                                  # ir inst 95 fin
.F.list_merge_sorted._28.if.else.2:
  addi s9, a1, 0                                                        # ir inst 96 fin
  mv s8, t4                                                             # ir inst 97 fin
  slli t2, s8, 3
  add s7, s9, t2                                                        # ir inst 98 fin
  addi s9, s7, 4                                                        # ir inst 99 fin
  sw s10, 0(s9)                                                         # ir inst 100 fin
# Phi connections
  j .F.list_merge_sorted._29.if.exit.2                                  # ir inst 101 fin
.F.list_merge_sorted._29.if.exit.2:
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F.list_merge_sorted._19.while.cond.0                               # ir inst 103 fin
.F.list_merge_sorted._30.while.exit.0:
  li t2, -1
  xor t0, t6, t2
  sltu t3, zero, t0                                                     # ir inst 104 fin
  bnez t3, .F.list_merge_sorted._31.if.then.3
  j .F.list_merge_sorted._32.if.else.3                                  # ir inst 105 fin
.F.list_merge_sorted._31.if.then.3:
# Phi connections
  j .F.list_merge_sorted._33.if.exit.3                                  # ir inst 106 fin
.F.list_merge_sorted._32.if.else.3:
# Phi connections
  mv t6, t5
  j .F.list_merge_sorted._33.if.exit.3                                  # ir inst 107 fin
.F.list_merge_sorted._33.if.exit.3:
  li t2, -1
  xor t0, t6, t2
  sltu t5, zero, t0                                                     # ir inst 109 fin
  bnez t5, .F.list_merge_sorted._34.if.then.4
  j .F.list_merge_sorted._38.if.else.4                                  # ir inst 110 fin
.F.list_merge_sorted._34.if.then.4:
  li t2, -1
  xor t0, t4, t2
  sltu t5, zero, t0                                                     # ir inst 111 fin
  bnez t5, .F.list_merge_sorted._35.if.then.5
  j .F.list_merge_sorted._36.if.else.5                                  # ir inst 112 fin
.F.list_merge_sorted._35.if.then.5:
  addi t5, a1, 0                                                        # ir inst 113 fin
  mv t3, t4                                                             # ir inst 114 fin
  slli t2, t3, 3
  add t4, t5, t2                                                        # ir inst 115 fin
  addi t5, t4, 4                                                        # ir inst 116 fin
  sw t6, 0(t5)                                                          # ir inst 117 fin
  j .F.list_merge_sorted._37.if.exit.5                                  # ir inst 118 fin
.F.list_merge_sorted._36.if.else.5:
  addi t5, a0, 0                                                        # ir inst 119 fin
  mv t4, a4                                                             # ir inst 120 fin
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 121 fin
  sw t6, 0(t3)                                                          # ir inst 122 fin
  j .F.list_merge_sorted._37.if.exit.5                                  # ir inst 123 fin
.F.list_merge_sorted._37.if.exit.5:
  j .F.list_merge_sorted._39.if.exit.4                                  # ir inst 124 fin
.F.list_merge_sorted._38.if.else.4:
  j .F.list_merge_sorted._39.if.exit.4                                  # ir inst 125 fin
.F.list_merge_sorted._39.if.exit.4:
  addi t6, a0, 0                                                        # ir inst 126 fin
  mv t5, a2                                                             # ir inst 127 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 128 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 129 fin
  addi t6, a0, 0                                                        # ir inst 130 fin
  mv t5, a3                                                             # ir inst 131 fin
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 132 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 133 fin
  li a0, 1
  j .F.list_merge_sorted.epilogue                                       # ir inst 134 fin
.F.list_merge_sorted.epilogue:
  ld s11, 0(sp)
  ld s8, 8(sp)
  ld s7, 16(sp)
  ld s9, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.test_comprehensive_operations
.F.test_comprehensive_operations:
# spill func args num: 0,             range:    37056(sp) -    37056(sp)
# local var size: 36996,              range:       56(sp) -    37052(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 2 / 12,        range:       32(sp) -       48(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -37056
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.test_comprehensive_operations._0.entry.0:
# Start call preparation
  li a0, 19001
  call printlnInt
# ir inst 1 fin
# Start call preparation
  addi t1, sp, 56
  mv a0, t1
  call .F.init_memory_pool
# ir inst 3 fin
# Start call preparation
  li t1, 16068
  add t1, sp, t1
  mv a0, t1
  call .F.init_hash_table
# ir inst 5 fin
# Start call preparation
  li t1, 32580
  add t1, sp, t1
  mv a0, t1
  call .F.init_stack
# ir inst 7 fin
# Start call preparation
  li t1, 34588
  add t1, sp, t1
  mv a0, t1
  call .F.init_queue
# ir inst 9 fin
# Start call preparation
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.init_list_manager
# ir inst 11 fin
# Start call preparation
  li a0, 19002
  call printlnInt
# ir inst 12 fin
  li t1, 36652
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 14 fin
# Phi connections
  li t5, 0
  j .F.test_comprehensive_operations._1.array.cond.0                    # ir inst 15 fin
.F.test_comprehensive_operations._1.array.cond.0:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 17 fin
  bnez t4, .F.test_comprehensive_operations._2.array.body.0
  j .F.test_comprehensive_operations._3.array.exit.0                    # ir inst 18 fin
.F.test_comprehensive_operations._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 19 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  mv t5, t4
  j .F.test_comprehensive_operations._1.array.cond.0                    # ir inst 22 fin
.F.test_comprehensive_operations._3.array.exit.0:
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._4.while.cond.0                    # ir inst 23 fin
.F.test_comprehensive_operations._4.while.cond.0:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 25 fin
  bnez t5, .F.test_comprehensive_operations._5.while.body.0
  j .F.test_comprehensive_operations._9.while.exit.0                    # ir inst 26 fin
.F.test_comprehensive_operations._5.while.body.0:
  mv t5, t6                                                             # ir inst 27 fin
  slli t2, t5, 2
  li t1, 36652
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 28 fin
  li t2, 7
  mul t5, t6, t2                                                        # ir inst 29 fin
  addi t3, t5, 13                                                       # ir inst 30 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  addi t1, sp, 56
  mv a0, t1
  call .F.allocate_node
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 31 fin
  sw t5, 0(t4)                                                          # ir inst 32 fin
  mv t5, t6                                                             # ir inst 33 fin
  slli t2, t5, 2
  li t1, 36652
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 34 fin
  lw t5, 0(t4)                                                          # ir inst 35 fin
  li t2, -1
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 36 fin
  bnez t4, .F.test_comprehensive_operations._6.if.then.0
  j .F.test_comprehensive_operations._7.if.else.0                       # ir inst 37 fin
.F.test_comprehensive_operations._6.if.then.0:
# Start call preparation
  sd t6, 0(sp)
  li a0, 19901
  call printlnInt
  ld t6, 0(sp)
# ir inst 38 fin
  j .F.test_comprehensive_operations._8.if.exit.0                       # ir inst 39 fin
.F.test_comprehensive_operations._7.if.else.0:
  j .F.test_comprehensive_operations._8.if.exit.0                       # ir inst 40 fin
.F.test_comprehensive_operations._8.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 41 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._4.while.cond.0                    # ir inst 42 fin
.F.test_comprehensive_operations._9.while.exit.0:
  addi t1, sp, 56
  li t6, 16004
  add t6, t1, t6                                                        # ir inst 43 fin
  lw t5, 0(t6)                                                          # ir inst 44 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 45 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._10.while.cond.1                   # ir inst 46 fin
.F.test_comprehensive_operations._10.while.cond.1:
  li t2, 200
  slt t5, t6, t2                                                        # ir inst 48 fin
  bnez t5, .F.test_comprehensive_operations._11.while.body.1
  j .F.test_comprehensive_operations._18.while.exit.1                   # ir inst 49 fin
.F.test_comprehensive_operations._11.while.body.1:
  li t2, 127
  mul t5, t6, t2                                                        # ir inst 50 fin
  addi t4, t5, 1                                                        # ir inst 51 fin
  mul t5, t6, t6                                                        # ir inst 52 fin
  addi t3, t5, 17                                                       # ir inst 53 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a2, t3
  mv a1, t4
  li t1, 16068
  add t1, sp, t1
  mv a0, t1
  call .F.hash_table_insert
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 54 fin
  bnez t5, .F.test_comprehensive_operations._12.if.then.1
  j .F.test_comprehensive_operations._16.if.else.1                      # ir inst 55 fin
.F.test_comprehensive_operations._12.if.then.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  li t1, 16068
  add t1, sp, t1
  mv a0, t1
  call .F.hash_table_search
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 56 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a1, t4
  li t1, 16068
  add t1, sp, t1
  mv a0, t1
  call .F.hash_table_search
  mv t5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 57 fin
  xor t0, t5, t3
  sltu t4, zero, t0                                                     # ir inst 58 fin
  bnez t4, .F.test_comprehensive_operations._13.if.then.2
  j .F.test_comprehensive_operations._14.if.else.2                      # ir inst 59 fin
.F.test_comprehensive_operations._13.if.then.2:
# Start call preparation
  sd t6, 0(sp)
  li a0, 19902
  call printlnInt
  ld t6, 0(sp)
# ir inst 60 fin
  j .F.test_comprehensive_operations._15.if.exit.2                      # ir inst 61 fin
.F.test_comprehensive_operations._14.if.else.2:
  j .F.test_comprehensive_operations._15.if.exit.2                      # ir inst 62 fin
.F.test_comprehensive_operations._15.if.exit.2:
  j .F.test_comprehensive_operations._17.if.exit.1                      # ir inst 63 fin
.F.test_comprehensive_operations._16.if.else.1:
  j .F.test_comprehensive_operations._17.if.exit.1                      # ir inst 64 fin
.F.test_comprehensive_operations._17.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 65 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._10.while.cond.1                   # ir inst 66 fin
.F.test_comprehensive_operations._18.while.exit.1:
  li t1, 16068
  add t1, sp, t1
  li t6, 16508
  add t6, t1, t6                                                        # ir inst 67 fin
  lw t5, 0(t6)                                                          # ir inst 68 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 69 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._19.while.cond.2                   # ir inst 70 fin
.F.test_comprehensive_operations._19.while.cond.2:
  li t1, 500
  mv t5, t1                                                             # ir inst 72 fin
  addi t4, t5, 10                                                       # ir inst 73 fin
  slt t5, t6, t4                                                        # ir inst 74 fin
  bnez t5, .F.test_comprehensive_operations._20.while.body.2
  j .F.test_comprehensive_operations._85.critical_edge.0                # ir inst 75 fin
.F.test_comprehensive_operations._20.while.body.2:
  li t2, 3
  mul t5, t6, t2                                                        # ir inst 76 fin
  addi t4, t5, 7                                                        # ir inst 77 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t4
  li t1, 32580
  add t1, sp, t1
  mv a0, t1
  call .F.stack_push
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 78 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 79 fin
  bnez t4, .F.test_comprehensive_operations._21.if.then.3
  j .F.test_comprehensive_operations._22.if.else.3                      # ir inst 80 fin
.F.test_comprehensive_operations._21.if.then.3:
# Start call preparation
  sd t6, 0(sp)
  li a0, 19903
  call printlnInt
  ld t6, 0(sp)
# ir inst 81 fin
  j .F.test_comprehensive_operations._24.while.exit.2                   # ir inst 82 fin
.F.test_comprehensive_operations._22.if.else.3:
  j .F.test_comprehensive_operations._23.if.exit.3                      # ir inst 83 fin
.F.test_comprehensive_operations._23.if.exit.3:
  addi t5, t6, 1                                                        # ir inst 84 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._19.while.cond.2                   # ir inst 85 fin
.F.test_comprehensive_operations._24.while.exit.2:
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._25.while.cond.3                   # ir inst 86 fin
.F.test_comprehensive_operations._25.while.cond.3:
# Start call preparation
  sd t6, 0(sp)
  li t1, 32580
  add t1, sp, t1
  mv a0, t1
  call .F.stack_is_empty
  mv t5, a0
  ld t6, 0(sp)
# ir inst 88 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 89 fin
  bnez t4, .F.test_comprehensive_operations._26.while.body.3
  j .F.test_comprehensive_operations._30.while.exit.3                   # ir inst 90 fin
.F.test_comprehensive_operations._26.while.body.3:
# Start call preparation
  sd t6, 0(sp)
  li t1, 32580
  add t1, sp, t1
  mv a0, t1
  call .F.stack_pop
  mv t5, a0
  ld t6, 0(sp)
# ir inst 91 fin
  li t2, -999999
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 92 fin
  bnez t4, .F.test_comprehensive_operations._27.if.then.4
  j .F.test_comprehensive_operations._28.if.else.4                      # ir inst 93 fin
.F.test_comprehensive_operations._27.if.then.4:
  addi t5, t6, 1                                                        # ir inst 94 fin
# Phi connections
  j .F.test_comprehensive_operations._29.if.exit.4                      # ir inst 95 fin
.F.test_comprehensive_operations._28.if.else.4:
# Phi connections
  mv t5, t6
  j .F.test_comprehensive_operations._29.if.exit.4                      # ir inst 96 fin
.F.test_comprehensive_operations._29.if.exit.4:
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._25.while.cond.3                   # ir inst 98 fin
.F.test_comprehensive_operations._30.while.exit.3:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 99 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._31.while.cond.4                   # ir inst 100 fin
.F.test_comprehensive_operations._31.while.cond.4:
  li t1, 500
  mv t5, t1                                                             # ir inst 102 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 103 fin
  slt t5, t6, t4                                                        # ir inst 104 fin
  bnez t5, .F.test_comprehensive_operations._32.while.body.4
  j .F.test_comprehensive_operations._33.while.exit.4                   # ir inst 105 fin
.F.test_comprehensive_operations._32.while.body.4:
  li t2, 5
  mul t5, t6, t2                                                        # ir inst 106 fin
  addi t4, t5, 11                                                       # ir inst 107 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t4
  li t1, 34588
  add t1, sp, t1
  mv a0, t1
  call .F.queue_enqueue
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 108 fin
  addi t5, t6, 1                                                        # ir inst 109 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._31.while.cond.4                   # ir inst 110 fin
.F.test_comprehensive_operations._33.while.exit.4:
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._34.while.cond.5                   # ir inst 111 fin
.F.test_comprehensive_operations._34.while.cond.5:
  li t1, 500
  mv t5, t1                                                             # ir inst 113 fin
  li t2, 4
  div t4, t5, t2                                                        # ir inst 114 fin
  slt t5, t6, t4                                                        # ir inst 115 fin
  bnez t5, .F.test_comprehensive_operations._35.while.body.5
  j .F.test_comprehensive_operations._36.while.exit.5                   # ir inst 116 fin
.F.test_comprehensive_operations._35.while.body.5:
# Start call preparation
  sd t6, 0(sp)
  li t1, 34588
  add t1, sp, t1
  mv a0, t1
  call .F.queue_dequeue
  mv t5, a0
  ld t6, 0(sp)
# ir inst 117 fin
  addi t5, t6, 1                                                        # ir inst 118 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._34.while.cond.5                   # ir inst 119 fin
.F.test_comprehensive_operations._36.while.exit.5:
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._37.while.cond.6                   # ir inst 120 fin
.F.test_comprehensive_operations._37.while.cond.6:
  li t1, 500
  mv t5, t1                                                             # ir inst 122 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 123 fin
  slt t5, t6, t4                                                        # ir inst 124 fin
  bnez t5, .F.test_comprehensive_operations._38.while.body.6
  j .F.test_comprehensive_operations._42.while.exit.6                   # ir inst 125 fin
.F.test_comprehensive_operations._38.while.body.6:
  li t2, 7
  mul t5, t6, t2                                                        # ir inst 126 fin
  addi t4, t5, 23                                                       # ir inst 127 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a1, t4
  li t1, 34588
  add t1, sp, t1
  mv a0, t1
  call .F.queue_enqueue
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 128 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 129 fin
  bnez t4, .F.test_comprehensive_operations._39.if.then.5
  j .F.test_comprehensive_operations._40.if.else.5                      # ir inst 130 fin
.F.test_comprehensive_operations._39.if.then.5:
# Start call preparation
  sd t6, 0(sp)
  li a0, 19904
  call printlnInt
  ld t6, 0(sp)
# ir inst 131 fin
  j .F.test_comprehensive_operations._41.if.exit.5                      # ir inst 132 fin
.F.test_comprehensive_operations._40.if.else.5:
  j .F.test_comprehensive_operations._41.if.exit.5                      # ir inst 133 fin
.F.test_comprehensive_operations._41.if.exit.5:
  addi t5, t6, 1                                                        # ir inst 134 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._37.while.cond.6                   # ir inst 135 fin
.F.test_comprehensive_operations._42.while.exit.6:
  li t1, 34588
  add t1, sp, t1
  addi t6, t1, 2008                                                     # ir inst 136 fin
  lw t5, 0(t6)                                                          # ir inst 137 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 138 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._43.while.cond.7                   # ir inst 139 fin
.F.test_comprehensive_operations._43.while.cond.7:
  li t2, 5
  slt t5, t6, t2                                                        # ir inst 141 fin
  bnez t5, .F.test_comprehensive_operations._44.while.body.7
  j .F.test_comprehensive_operations._48.while.exit.7                   # ir inst 142 fin
.F.test_comprehensive_operations._44.while.body.7:
# Phi connections
  li t5, 0
  j .F.test_comprehensive_operations._45.while.cond.8                   # ir inst 143 fin
.F.test_comprehensive_operations._45.while.cond.8:
  li t2, 20
  slt t4, t5, t2                                                        # ir inst 145 fin
  bnez t4, .F.test_comprehensive_operations._46.while.body.8
  j .F.test_comprehensive_operations._47.while.exit.8                   # ir inst 146 fin
.F.test_comprehensive_operations._46.while.body.8:
  slli t4, t5, 1                                                        # ir inst 147 fin
  add t3, t4, t6                                                        # ir inst 148 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a3, t3
  mv a2, t6
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_insert_head
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 149 fin
  addi t4, t5, 1                                                        # ir inst 150 fin
# Phi connections
  mv t5, t4
  j .F.test_comprehensive_operations._45.while.cond.8                   # ir inst 151 fin
.F.test_comprehensive_operations._47.while.exit.8:
  addi t5, t6, 1                                                        # ir inst 152 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._43.while.cond.7                   # ir inst 153 fin
.F.test_comprehensive_operations._48.while.exit.7:
  li t1, 36604
  add t1, sp, t1
  addi t6, t1, 44                                                       # ir inst 154 fin
  lw t5, 0(t6)                                                          # ir inst 155 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 156 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_comprehensive_operations._49.while.cond.9                   # ir inst 157 fin
.F.test_comprehensive_operations._49.while.cond.9:
  li t2, 5
  slt t4, t5, t2                                                        # ir inst 160 fin
  bnez t4, .F.test_comprehensive_operations._50.while.body.9
  j .F.test_comprehensive_operations._57.while.exit.9                   # ir inst 161 fin
.F.test_comprehensive_operations._50.while.body.9:
# Phi connections
  li t3, 0
  mv t4, t6
  j .F.test_comprehensive_operations._51.while.cond.10                  # ir inst 162 fin
.F.test_comprehensive_operations._51.while.cond.10:
  li t2, 20
  slt s11, t3, t2                                                       # ir inst 165 fin
  bnez s11, .F.test_comprehensive_operations._52.while.body.10
  j .F.test_comprehensive_operations._56.while.exit.10                  # ir inst 166 fin
.F.test_comprehensive_operations._52.while.body.10:
  slli s11, t3, 1                                                       # ir inst 167 fin
  add s10, s11, t5                                                      # ir inst 168 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, s10
  mv a2, t5
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_search
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 169 fin
  bnez s11, .F.test_comprehensive_operations._53.if.then.6
  j .F.test_comprehensive_operations._54.if.else.6                      # ir inst 170 fin
.F.test_comprehensive_operations._53.if.then.6:
  addi s11, t4, 1                                                       # ir inst 171 fin
# Phi connections
  j .F.test_comprehensive_operations._55.if.exit.6                      # ir inst 172 fin
.F.test_comprehensive_operations._54.if.else.6:
# Phi connections
  mv s11, t4
  j .F.test_comprehensive_operations._55.if.exit.6                      # ir inst 173 fin
.F.test_comprehensive_operations._55.if.exit.6:
  addi s10, t3, 1                                                       # ir inst 175 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.test_comprehensive_operations._51.while.cond.10                  # ir inst 176 fin
.F.test_comprehensive_operations._56.while.exit.10:
  addi t3, t5, 1                                                        # ir inst 177 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.test_comprehensive_operations._49.while.cond.9                   # ir inst 178 fin
.F.test_comprehensive_operations._57.while.exit.9:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 179 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._58.while.cond.11                  # ir inst 180 fin
.F.test_comprehensive_operations._58.while.cond.11:
  li t2, 100
  slt t5, t6, t2                                                        # ir inst 182 fin
  bnez t5, .F.test_comprehensive_operations._59.while.body.11
  j .F.test_comprehensive_operations._66.while.exit.11                  # ir inst 183 fin
.F.test_comprehensive_operations._59.while.body.11:
  li t2, 2
  rem t5, t6, t2                                                        # ir inst 184 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 185 fin
  bnez t4, .F.test_comprehensive_operations._60.lazy.then.0
  j .F.test_comprehensive_operations._61.lazy.else.0                    # ir inst 186 fin
.F.test_comprehensive_operations._60.lazy.then.0:
  mv t5, t6                                                             # ir inst 187 fin
  slli t2, t5, 2
  li t1, 36652
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 188 fin
  lw t5, 0(t4)                                                          # ir inst 189 fin
  li t2, -1
  xor t0, t5, t2
  sltu t4, zero, t0                                                     # ir inst 190 fin
# Phi connections
  mv t5, t4
  j .F.test_comprehensive_operations._62.lazy.exit.0                    # ir inst 191 fin
.F.test_comprehensive_operations._61.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.test_comprehensive_operations._62.lazy.exit.0                    # ir inst 192 fin
.F.test_comprehensive_operations._62.lazy.exit.0:
  bnez t5, .F.test_comprehensive_operations._63.if.then.7
  j .F.test_comprehensive_operations._64.if.else.7                      # ir inst 194 fin
.F.test_comprehensive_operations._63.if.then.7:
  mv t5, t6                                                             # ir inst 195 fin
  slli t2, t5, 2
  li t1, 36652
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 196 fin
  lw t5, 0(t4)                                                          # ir inst 197 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a1, t5
  addi t1, sp, 56
  mv a0, t1
  call .F.deallocate_node
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 198 fin
  mv t5, t6                                                             # ir inst 199 fin
  slli t2, t5, 2
  li t1, 36652
  add t1, sp, t1
  add t4, t1, t2                                                        # ir inst 200 fin
  li t1, -1
  sw t1, 0(t4)                                                          # ir inst 201 fin
  j .F.test_comprehensive_operations._65.if.exit.7                      # ir inst 202 fin
.F.test_comprehensive_operations._64.if.else.7:
  j .F.test_comprehensive_operations._65.if.exit.7                      # ir inst 203 fin
.F.test_comprehensive_operations._65.if.exit.7:
  addi t5, t6, 1                                                        # ir inst 204 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._58.while.cond.11                  # ir inst 205 fin
.F.test_comprehensive_operations._66.while.exit.11:
  addi t1, sp, 56
  li t6, 16004
  add t6, t1, t6                                                        # ir inst 206 fin
  lw t5, 0(t6)                                                          # ir inst 207 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 208 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_comprehensive_operations._67.while.cond.12                  # ir inst 209 fin
.F.test_comprehensive_operations._67.while.cond.12:
  li t2, 60
  slt t4, t6, t2                                                        # ir inst 212 fin
  bnez t4, .F.test_comprehensive_operations._68.while.body.12
  j .F.test_comprehensive_operations._72.while.exit.12                  # ir inst 213 fin
.F.test_comprehensive_operations._68.while.body.12:
  li t2, 11
  mul t4, t6, t2                                                        # ir inst 214 fin
  addi t3, t4, 19                                                       # ir inst 215 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  addi t1, sp, 56
  mv a0, t1
  call .F.allocate_node
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 216 fin
  li t2, -1
  xor t0, t4, t2
  sltu t3, zero, t0                                                     # ir inst 217 fin
  bnez t3, .F.test_comprehensive_operations._69.if.then.8
  j .F.test_comprehensive_operations._70.if.else.8                      # ir inst 218 fin
.F.test_comprehensive_operations._69.if.then.8:
  addi t4, t5, 1                                                        # ir inst 219 fin
# Phi connections
  j .F.test_comprehensive_operations._71.if.exit.8                      # ir inst 220 fin
.F.test_comprehensive_operations._70.if.else.8:
# Phi connections
  mv t4, t5
  j .F.test_comprehensive_operations._71.if.exit.8                      # ir inst 221 fin
.F.test_comprehensive_operations._71.if.exit.8:
  addi t3, t6, 1                                                        # ir inst 223 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.test_comprehensive_operations._67.while.cond.12                  # ir inst 224 fin
.F.test_comprehensive_operations._72.while.exit.12:
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 225 fin
# Phi connections
  li t5, 0
  li t6, 0
  j .F.test_comprehensive_operations._73.while.cond.13                  # ir inst 226 fin
.F.test_comprehensive_operations._73.while.cond.13:
  li t2, 100
  slt t4, t5, t2                                                        # ir inst 229 fin
  bnez t4, .F.test_comprehensive_operations._74.while.body.13
  j .F.test_comprehensive_operations._78.while.exit.13                  # ir inst 230 fin
.F.test_comprehensive_operations._74.while.body.13:
  li t2, 127
  mul t4, t5, t2                                                        # ir inst 231 fin
  addi t3, t4, 1                                                        # ir inst 232 fin
# Start call preparation
  sd t3, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t3
  li t1, 16068
  add t1, sp, t1
  mv a0, t1
  call .F.hash_table_delete
  mv t4, a0
  ld t3, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 233 fin
  bnez t4, .F.test_comprehensive_operations._75.if.then.9
  j .F.test_comprehensive_operations._76.if.else.9                      # ir inst 234 fin
.F.test_comprehensive_operations._75.if.then.9:
  addi t4, t6, 1                                                        # ir inst 235 fin
# Phi connections
  j .F.test_comprehensive_operations._77.if.exit.9                      # ir inst 236 fin
.F.test_comprehensive_operations._76.if.else.9:
# Phi connections
  mv t4, t6
  j .F.test_comprehensive_operations._77.if.exit.9                      # ir inst 237 fin
.F.test_comprehensive_operations._77.if.exit.9:
  addi t3, t5, 1                                                        # ir inst 239 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.test_comprehensive_operations._73.while.cond.13                  # ir inst 240 fin
.F.test_comprehensive_operations._78.while.exit.13:
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 241 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._79.while.cond.14                  # ir inst 242 fin
.F.test_comprehensive_operations._79.while.cond.14:
  li t2, 50
  slt t5, t6, t2                                                        # ir inst 244 fin
  bnez t5, .F.test_comprehensive_operations._80.while.body.14
  j .F.test_comprehensive_operations._81.while.exit.14                  # ir inst 245 fin
.F.test_comprehensive_operations._80.while.body.14:
  li t2, 127
  mul t5, t6, t2                                                        # ir inst 246 fin
  addi t4, t5, 1                                                        # ir inst 247 fin
  mul t5, t6, t6                                                        # ir inst 248 fin
  mul t3, t5, t6                                                        # ir inst 249 fin
  addi t5, t3, 29                                                       # ir inst 250 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a2, t5
  mv a1, t4
  li t1, 16068
  add t1, sp, t1
  mv a0, t1
  call .F.hash_table_insert
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 251 fin
  addi t5, t6, 1                                                        # ir inst 252 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._79.while.cond.14                  # ir inst 253 fin
.F.test_comprehensive_operations._81.while.exit.14:
  li t1, 16068
  add t1, sp, t1
  li t6, 16508
  add t6, t1, t6                                                        # ir inst 254 fin
  lw t5, 0(t6)                                                          # ir inst 255 fin
# Start call preparation
  sd t5, 0(sp)
  mv a0, t5
  call printlnInt
  ld t5, 0(sp)
# ir inst 256 fin
# Phi connections
  li t6, 0
  j .F.test_comprehensive_operations._82.while.cond.15                  # ir inst 257 fin
.F.test_comprehensive_operations._82.while.cond.15:
  li t2, 15
  slt t5, t6, t2                                                        # ir inst 259 fin
  bnez t5, .F.test_comprehensive_operations._83.while.body.15
  j .F.test_comprehensive_operations._84.while.exit.15                  # ir inst 260 fin
.F.test_comprehensive_operations._83.while.body.15:
  slli t5, t6, 2                                                        # ir inst 261 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a3, t5
  li a2, 7
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_insert_head
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 262 fin
  slli t5, t6, 2                                                        # ir inst 263 fin
  addi t4, t5, 2                                                        # ir inst 264 fin
# Start call preparation
  sd t4, 0(sp)
  sd t6, 8(sp)
  mv a3, t4
  li a2, 8
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_insert_head
  mv t5, a0
  ld t4, 0(sp)
  ld t6, 8(sp)
# ir inst 265 fin
  addi t5, t6, 1                                                        # ir inst 266 fin
# Phi connections
  mv t6, t5
  j .F.test_comprehensive_operations._82.while.cond.15                  # ir inst 267 fin
.F.test_comprehensive_operations._84.while.exit.15:
# Start call preparation
  li a2, 7
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_length
  mv t6, a0
# ir inst 268 fin
# Start call preparation
  sd t6, 0(sp)
  li a2, 8
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_length
  mv t5, a0
  ld t6, 0(sp)
# ir inst 269 fin
  add t4, t6, t5                                                        # ir inst 270 fin
# Start call preparation
  sd t4, 0(sp)
  mv a0, t4
  call printlnInt
  ld t4, 0(sp)
# ir inst 271 fin
# Start call preparation
  li a4, 9
  li a3, 8
  li a2, 7
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_merge_sorted
  mv t6, a0
# ir inst 272 fin
# Start call preparation
  li a2, 9
  addi t1, sp, 56
  mv a1, t1
  li t1, 36604
  add t1, sp, t1
  mv a0, t1
  call .F.list_length
  mv t6, a0
# ir inst 273 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 274 fin
# Start call preparation
  li a0, 19999
  call printlnInt
# ir inst 275 fin
  j .F.test_comprehensive_operations.epilogue                           # ir inst 276 fin
.F.test_comprehensive_operations._85.critical_edge.0:
  j .F.test_comprehensive_operations._24.while.exit.2                   # ir inst 277 fin
.F.test_comprehensive_operations.epilogue:
  ld ra, 48(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  li t0, 37056
  add sp, sp, t0
  ret

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
  call .F.test_comprehensive_operations
# ir inst 1 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 2 fin
  j main.epilogue                                                       # ir inst 3 fin
main.epilogue:
  ld ra, 0(sp)
  addi sp, sp, 16
  ret
