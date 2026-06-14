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
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
main._0.entry.0:
# Start call preparation
  li a0, 42
  call printlnInt
# ir inst 1 fin
# Start call preparation
  call .F.run_cache_simulation
  mv t6, a0
# ir inst 2 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 3 fin
# Start call preparation
  call .F.run_memory_manager
  mv t6, a0
# ir inst 4 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 5 fin
# Start call preparation
  call .F.run_hash_table_tests
  mv t6, a0
# ir inst 6 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 7 fin
# Start call preparation
  call .F.run_priority_queue_tests
  mv t6, a0
# ir inst 8 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 9 fin
# Start call preparation
  call .F.run_integrated_system_test
  mv t6, a0
# ir inst 10 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call printlnInt
  ld t6, 0(sp)
# ir inst 11 fin
# Start call preparation
  li a0, 99
  call printlnInt
# ir inst 12 fin
# Start call preparation
  li a0, 0
  call exit
# ir inst 13 fin
  j main.epilogue                                                       # ir inst 14 fin
main.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.get_l1_cache_size
.F.get_l1_cache_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_l1_cache_size._0.entry.0:
  li a0, 64
  j .F.get_l1_cache_size.epilogue                                       # ir inst 1 fin
.F.get_l1_cache_size.epilogue:
  ret

.globl .F.get_l2_cache_size
.F.get_l2_cache_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_l2_cache_size._0.entry.0:
  li a0, 512
  j .F.get_l2_cache_size.epilogue                                       # ir inst 1 fin
.F.get_l2_cache_size.epilogue:
  ret

.globl .F.get_l3_cache_size
.F.get_l3_cache_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_l3_cache_size._0.entry.0:
  li a0, 2048
  j .F.get_l3_cache_size.epilogue                                       # ir inst 1 fin
.F.get_l3_cache_size.epilogue:
  ret

.globl .F.get_cache_line_size
.F.get_cache_line_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_cache_line_size._0.entry.0:
  li a0, 64
  j .F.get_cache_line_size.epilogue                                     # ir inst 1 fin
.F.get_cache_line_size.epilogue:
  ret

.globl .F.get_associativity
.F.get_associativity:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_associativity._0.entry.0:
  li a0, 4
  j .F.get_associativity.epilogue                                       # ir inst 1 fin
.F.get_associativity.epilogue:
  ret

.globl .F.get_page_size
.F.get_page_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_page_size._0.entry.0:
  li a0, 4096
  j .F.get_page_size.epilogue                                           # ir inst 1 fin
.F.get_page_size.epilogue:
  ret

.globl .F.get_heap_size
.F.get_heap_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_heap_size._0.entry.0:
  li a0, 65536
  j .F.get_heap_size.epilogue                                           # ir inst 1 fin
.F.get_heap_size.epilogue:
  ret

.globl .F.get_gc_threshold
.F.get_gc_threshold:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_gc_threshold._0.entry.0:
  li a0, 80
  j .F.get_gc_threshold.epilogue                                        # ir inst 1 fin
.F.get_gc_threshold.epilogue:
  ret

.globl .F.get_hash_table_size
.F.get_hash_table_size:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_hash_table_size._0.entry.0:
  li a0, 1024
  j .F.get_hash_table_size.epilogue                                     # ir inst 1 fin
.F.get_hash_table_size.epilogue:
  ret

.globl .F.get_max_probe_distance
.F.get_max_probe_distance:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.get_max_probe_distance._0.entry.0:
  li a0, 16
  j .F.get_max_probe_distance.epilogue                                  # ir inst 1 fin
.F.get_max_probe_distance.epilogue:
  ret

.globl .F.run_cache_simulation
.F.run_cache_simulation:
# spill func args num: 0,             range:    17472(sp) -    17472(sp)
# local var size: 17408,              range:       64(sp) -    17472(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -17472
  add sp, sp, t0
  sd s9, 32(sp)
  sd s11, 40(sp)
  sd s10, 48(sp)
  sd ra, 56(sp)
.F.run_cache_simulation._0.entry.0:
  addi t1, sp, 64
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.run_cache_simulation._1.array.cond.0                             # ir inst 3 fin
.F.run_cache_simulation._1.array.cond.0:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.run_cache_simulation._2.array.body.0
  j .F.run_cache_simulation._3.array.exit.0                             # ir inst 6 fin
.F.run_cache_simulation._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.run_cache_simulation._1.array.cond.0                             # ir inst 10 fin
.F.run_cache_simulation._3.array.exit.0:
  addi t1, sp, 1088
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j .F.run_cache_simulation._4.array.cond.1                             # ir inst 13 fin
.F.run_cache_simulation._4.array.cond.1:
  li t2, 4096
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, .F.run_cache_simulation._5.array.body.1
  j .F.run_cache_simulation._6.array.exit.1                             # ir inst 16 fin
.F.run_cache_simulation._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j .F.run_cache_simulation._4.array.cond.1                             # ir inst 20 fin
.F.run_cache_simulation._6.array.exit.1:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.run_cache_simulation._7.while.cond.0                             # ir inst 21 fin
.F.run_cache_simulation._7.while.cond.0:
  li t2, 10000
  slt s11, t4, t2                                                       # ir inst 26 fin
  bnez s11, .F.run_cache_simulation._8.while.body.0
  j .F.run_cache_simulation._12.while.exit.0                            # ir inst 27 fin
.F.run_cache_simulation._8.while.body.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.generate_memory_address
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 28 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 1088
  mv a2, t1
  addi t1, sp, 64
  mv a1, t1
  mv a0, s11
  call .F.simulate_cache_access
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 29 fin
  li t2, 0
  slt s9, t2, s10                                                       # ir inst 30 fin
  bnez s9, .F.run_cache_simulation._9.if.then.0
  j .F.run_cache_simulation._10.if.else.0                               # ir inst 31 fin
.F.run_cache_simulation._9.if.then.0:
  addi s10, t6, 1                                                       # ir inst 32 fin
# Phi connections
  mv s11, s10
  j .F.run_cache_simulation._11.if.exit.0                               # ir inst 33 fin
.F.run_cache_simulation._10.if.else.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 1088
  mv a2, t1
  addi t1, sp, 64
  mv a1, t1
  mv a0, s11
  call .F.simulate_cache_fill
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 34 fin
# Phi connections
  mv s11, t6
  j .F.run_cache_simulation._11.if.exit.0                               # ir inst 35 fin
.F.run_cache_simulation._11.if.exit.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t3
  addi t1, sp, 64
  mv a0, t1
  call .F.update_lru_counters_l1
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 37 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a1, t5
  addi t1, sp, 1088
  mv a0, t1
  call .F.update_lru_counters_l2
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 38 fin
  addi t5, t4, 1                                                        # ir inst 39 fin
# Phi connections
  mv t4, t5
  mv t5, t3
  mv t6, s11
  mv t3, s10
  j .F.run_cache_simulation._7.while.cond.0                             # ir inst 40 fin
.F.run_cache_simulation._12.while.exit.0:
  li t2, 1000
  mul t5, t6, t2                                                        # ir inst 41 fin
  li t2, 10000
  div t6, t5, t2                                                        # ir inst 42 fin
  mv a0, t6
  j .F.run_cache_simulation.epilogue                                    # ir inst 43 fin
.F.run_cache_simulation.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s11, 40(sp)
  ld s10, 48(sp)
  li t0, 17472
  add sp, sp, t0
  ret

.globl .F.generate_memory_address
.F.generate_memory_address:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.generate_memory_address._0.entry.0:
  li t2, 7
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.generate_memory_address._1.if.then.0
  j .F.generate_memory_address._2.if.else.0                             # ir inst 3 fin
.F.generate_memory_address._1.if.then.0:
  slli t5, a0, 2                                                        # ir inst 4 fin
  li t1, 268435456
  add t4, t1, t5                                                        # ir inst 5 fin
# Phi connections
  mv t6, t4
  j .F.generate_memory_address._21.if.exit.0                            # ir inst 6 fin
.F.generate_memory_address._2.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 7 fin
  bnez t5, .F.generate_memory_address._3.if.then.1
  j .F.generate_memory_address._4.if.else.1                             # ir inst 8 fin
.F.generate_memory_address._3.if.then.1:
  slli t5, a0, 6                                                        # ir inst 9 fin
  li t2, 8192
  rem t4, t5, t2                                                        # ir inst 10 fin
  li t1, 268435456
  add t5, t1, t4                                                        # ir inst 11 fin
# Phi connections
  mv t6, t5
  j .F.generate_memory_address._20.if.exit.1                            # ir inst 12 fin
.F.generate_memory_address._4.if.else.1:
  li t2, 2
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 13 fin
  bnez t5, .F.generate_memory_address._5.if.then.2
  j .F.generate_memory_address._6.if.else.2                             # ir inst 14 fin
.F.generate_memory_address._5.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.hash_function
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 15 fin
  li t2, 16384
  rem t4, t5, t2                                                        # ir inst 16 fin
  li t1, 268435456
  add t5, t1, t4                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.generate_memory_address._19.if.exit.2                            # ir inst 18 fin
.F.generate_memory_address._6.if.else.2:
  li t2, 3
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 19 fin
  bnez t5, .F.generate_memory_address._7.if.then.3
  j .F.generate_memory_address._8.if.else.3                             # ir inst 20 fin
.F.generate_memory_address._7.if.then.3:
  li t2, 128
  rem t5, a0, t2                                                        # ir inst 21 fin
  slli t4, t5, 2                                                        # ir inst 22 fin
  li t1, 268435456
  add t5, t1, t4                                                        # ir inst 23 fin
# Phi connections
  mv t6, t5
  j .F.generate_memory_address._18.if.exit.3                            # ir inst 24 fin
.F.generate_memory_address._8.if.else.3:
  li t2, 4
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 25 fin
  bnez t5, .F.generate_memory_address._9.if.then.4
  j .F.generate_memory_address._10.if.else.4                            # ir inst 26 fin
.F.generate_memory_address._9.if.then.4:
  li t2, 64
  div t5, a0, t2                                                        # ir inst 27 fin
  li t2, 64
  rem t4, a0, t2                                                        # ir inst 28 fin
  slli t3, t5, 12                                                       # ir inst 29 fin
  li t1, 268435456
  add t5, t1, t3                                                        # ir inst 30 fin
  slli t3, t4, 2                                                        # ir inst 31 fin
  add t4, t5, t3                                                        # ir inst 32 fin
# Phi connections
  mv t6, t4
  j .F.generate_memory_address._17.if.exit.4                            # ir inst 33 fin
.F.generate_memory_address._10.if.else.4:
  li t2, 5
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 34 fin
  bnez t5, .F.generate_memory_address._11.if.then.5
  j .F.generate_memory_address._15.if.else.5                            # ir inst 35 fin
.F.generate_memory_address._11.if.then.5:
# Phi connections
  mv t5, a0
  li t6, 1
  j .F.generate_memory_address._12.while.cond.0                         # ir inst 36 fin
.F.generate_memory_address._12.while.cond.0:
  li t2, 0
  slt t4, t2, t5                                                        # ir inst 39 fin
  bnez t4, .F.generate_memory_address._13.while.body.0
  j .F.generate_memory_address._14.while.exit.0                         # ir inst 40 fin
.F.generate_memory_address._13.while.body.0:
  slli t4, t6, 1                                                        # ir inst 41 fin
  li t2, 2
  div t3, t5, t2                                                        # ir inst 42 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.generate_memory_address._12.while.cond.0                         # ir inst 43 fin
.F.generate_memory_address._14.while.exit.0:
  mul t5, a0, t6                                                        # ir inst 44 fin
  li t2, 32768
  rem t6, t5, t2                                                        # ir inst 45 fin
  li t1, 268435456
  add t5, t1, t6                                                        # ir inst 46 fin
# Phi connections
  mv t6, t5
  j .F.generate_memory_address._16.if.exit.5                            # ir inst 47 fin
.F.generate_memory_address._15.if.else.5:
  li t2, 17
  mul t6, a0, t2                                                        # ir inst 48 fin
  mul t5, a0, a0                                                        # ir inst 49 fin
  add t4, t6, t5                                                        # ir inst 50 fin
  li t2, 65536
  rem t6, t4, t2                                                        # ir inst 51 fin
  li t1, 268435456
  add t5, t1, t6                                                        # ir inst 52 fin
# Phi connections
  mv t6, t5
  j .F.generate_memory_address._16.if.exit.5                            # ir inst 53 fin
.F.generate_memory_address._16.if.exit.5:
# Phi connections
  j .F.generate_memory_address._17.if.exit.4                            # ir inst 55 fin
.F.generate_memory_address._17.if.exit.4:
# Phi connections
  j .F.generate_memory_address._18.if.exit.3                            # ir inst 57 fin
.F.generate_memory_address._18.if.exit.3:
# Phi connections
  j .F.generate_memory_address._19.if.exit.2                            # ir inst 59 fin
.F.generate_memory_address._19.if.exit.2:
# Phi connections
  j .F.generate_memory_address._20.if.exit.1                            # ir inst 61 fin
.F.generate_memory_address._20.if.exit.1:
# Phi connections
  j .F.generate_memory_address._21.if.exit.0                            # ir inst 63 fin
.F.generate_memory_address._21.if.exit.0:
  mv a0, t6
  j .F.generate_memory_address.epilogue                                 # ir inst 65 fin
.F.generate_memory_address.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
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
  srai t6, a0, 16                                                       # ir inst 1 fin
  xor t5, a0, t6                                                        # ir inst 2 fin
  li t2, 32768
  rem t6, t5, t2                                                        # ir inst 3 fin
  li t2, 40763
  mul t5, t6, t2                                                        # ir inst 4 fin
  srai t6, t5, 16                                                       # ir inst 5 fin
  xor t4, t5, t6                                                        # ir inst 6 fin
  li t2, 32768
  rem t6, t4, t2                                                        # ir inst 7 fin
  li t2, 21311
  mul t5, t6, t2                                                        # ir inst 8 fin
  srai t6, t5, 16                                                       # ir inst 9 fin
  xor t4, t5, t6                                                        # ir inst 10 fin
  mv a0, t4
  j .F.hash_function.epilogue                                           # ir inst 11 fin
.F.hash_function.epilogue:
  ret

.globl .F.simulate_cache_access
.F.simulate_cache_access:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 3 / 12,        range:       56(sp) -       80(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s9, 56(sp)
  sd s10, 64(sp)
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.simulate_cache_access._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.get_cache_line_size
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
  div t5, a0, t6                                                        # ir inst 2 fin
  li t2, 16
  rem t6, t5, t2                                                        # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  call .F.get_cache_line_size
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 4 fin
  slli t4, t5, 4                                                        # ir inst 5 fin
  div t5, a0, t4                                                        # ir inst 6 fin
# Phi connections
  li t4, 0
  j .F.simulate_cache_access._1.while.cond.0                            # ir inst 7 fin
.F.simulate_cache_access._1.while.cond.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  call .F.get_associativity
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 9 fin
  slt s11, t4, t3                                                       # ir inst 10 fin
  bnez s11, .F.simulate_cache_access._2.while.body.0
  j .F.simulate_cache_access._9.while.exit.0                            # ir inst 11 fin
.F.simulate_cache_access._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  call .F.get_associativity
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 12 fin
  mul s11, t6, t3                                                       # ir inst 13 fin
  add t3, s11, t4                                                       # ir inst 14 fin
  slli s11, t3, 2                                                       # ir inst 15 fin
  mv t3, s11                                                            # ir inst 16 fin
  slli t2, t3, 2
  add s10, a1, t2                                                       # ir inst 17 fin
  lw t3, 0(s10)                                                         # ir inst 18 fin
  mv s10, s11                                                           # ir inst 19 fin
  addi s9, s10, 1                                                       # ir inst 20 fin
  slli t2, s9, 2
  add s10, a1, t2                                                       # ir inst 21 fin
  lw s9, 0(s10)                                                         # ir inst 22 fin
  li t2, 1
  xor t0, s9, t2
  sltiu s10, t0, 1                                                      # ir inst 23 fin
  bnez s10, .F.simulate_cache_access._3.lazy.then.0
  j .F.simulate_cache_access._4.lazy.else.0                             # ir inst 24 fin
.F.simulate_cache_access._3.lazy.then.0:
  xor t0, t3, t5
  sltiu s10, t0, 1                                                      # ir inst 25 fin
# Phi connections
  mv t3, s10
  j .F.simulate_cache_access._5.lazy.exit.0                             # ir inst 26 fin
.F.simulate_cache_access._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.simulate_cache_access._5.lazy.exit.0                             # ir inst 27 fin
.F.simulate_cache_access._5.lazy.exit.0:
  bnez t3, .F.simulate_cache_access._6.if.then.0
  j .F.simulate_cache_access._7.if.else.0                               # ir inst 29 fin
.F.simulate_cache_access._6.if.then.0:
  mv t3, s11                                                            # ir inst 30 fin
  addi s11, t3, 2                                                       # ir inst 31 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 32 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  call .F.get_current_timestamp
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 33 fin
  sw s11, 0(t3)                                                         # ir inst 34 fin
  li a0, 1
  j .F.simulate_cache_access.epilogue                                   # ir inst 35 fin
.F.simulate_cache_access._7.if.else.0:
  j .F.simulate_cache_access._8.if.exit.0                               # ir inst 36 fin
.F.simulate_cache_access._8.if.exit.0:
  addi t3, t4, 1                                                        # ir inst 37 fin
# Phi connections
  mv t4, t3
  j .F.simulate_cache_access._1.while.cond.0                            # ir inst 38 fin
.F.simulate_cache_access._9.while.exit.0:
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  call .F.get_cache_line_size
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 39 fin
  div t5, a0, t6                                                        # ir inst 40 fin
  li t2, 64
  rem t6, t5, t2                                                        # ir inst 41 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  call .F.get_cache_line_size
  mv t5, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 42 fin
  slli t4, t5, 6                                                        # ir inst 43 fin
  div t5, a0, t4                                                        # ir inst 44 fin
# Phi connections
  li t4, 0
  j .F.simulate_cache_access._10.while.cond.1                           # ir inst 45 fin
.F.simulate_cache_access._10.while.cond.1:
  li t2, 8
  slt t3, t4, t2                                                        # ir inst 47 fin
  bnez t3, .F.simulate_cache_access._11.while.body.1
  j .F.simulate_cache_access._18.while.exit.1                           # ir inst 48 fin
.F.simulate_cache_access._11.while.body.1:
  slli t3, t6, 3                                                        # ir inst 49 fin
  add s11, t3, t4                                                       # ir inst 50 fin
  slli t3, s11, 2                                                       # ir inst 51 fin
  mv s11, t3                                                            # ir inst 52 fin
  slli t2, s11, 2
  add s10, a2, t2                                                       # ir inst 53 fin
  lw s11, 0(s10)                                                        # ir inst 54 fin
  mv s10, t3                                                            # ir inst 55 fin
  addi s9, s10, 1                                                       # ir inst 56 fin
  slli t2, s9, 2
  add s10, a2, t2                                                       # ir inst 57 fin
  lw s9, 0(s10)                                                         # ir inst 58 fin
  li t2, 1
  xor t0, s9, t2
  sltiu s10, t0, 1                                                      # ir inst 59 fin
  bnez s10, .F.simulate_cache_access._12.lazy.then.1
  j .F.simulate_cache_access._13.lazy.else.1                            # ir inst 60 fin
.F.simulate_cache_access._12.lazy.then.1:
  xor t0, s11, t5
  sltiu s10, t0, 1                                                      # ir inst 61 fin
# Phi connections
  mv s11, s10
  j .F.simulate_cache_access._14.lazy.exit.1                            # ir inst 62 fin
.F.simulate_cache_access._13.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.simulate_cache_access._14.lazy.exit.1                            # ir inst 63 fin
.F.simulate_cache_access._14.lazy.exit.1:
  bnez s11, .F.simulate_cache_access._15.if.then.1
  j .F.simulate_cache_access._16.if.else.1                              # ir inst 65 fin
.F.simulate_cache_access._15.if.then.1:
  mv s11, t3                                                            # ir inst 66 fin
  addi t3, s11, 2                                                       # ir inst 67 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 68 fin
# Start call preparation
  sd a2, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  call .F.get_current_timestamp
  mv t3, a0
  ld a2, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 69 fin
  sw t3, 0(s11)                                                         # ir inst 70 fin
  li a0, 2
  j .F.simulate_cache_access.epilogue                                   # ir inst 71 fin
.F.simulate_cache_access._16.if.else.1:
  j .F.simulate_cache_access._17.if.exit.1                              # ir inst 72 fin
.F.simulate_cache_access._17.if.exit.1:
  addi t3, t4, 1                                                        # ir inst 73 fin
# Phi connections
  mv t4, t3
  j .F.simulate_cache_access._10.while.cond.1                           # ir inst 74 fin
.F.simulate_cache_access._18.while.exit.1:
  li a0, 0
  j .F.simulate_cache_access.epilogue                                   # ir inst 75 fin
.F.simulate_cache_access.epilogue:
  ld ra, 80(sp)
  ld s9, 56(sp)
  ld s10, 64(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.simulate_cache_fill
.F.simulate_cache_fill:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 1 / 12,        range:       56(sp) -       64(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.simulate_cache_fill._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  call .F.get_cache_line_size
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
# ir inst 1 fin
  div t5, a0, t6                                                        # ir inst 2 fin
  li t2, 16
  rem t6, t5, t2                                                        # ir inst 3 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t6, 24(sp)
  call .F.get_cache_line_size
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t6, 24(sp)
# ir inst 4 fin
  slli t4, t5, 4                                                        # ir inst 5 fin
  div t5, a0, t4                                                        # ir inst 6 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  mv a0, a1
  mv a1, t6
  call .F.find_lru_way_l1
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 7 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  call .F.get_associativity
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 8 fin
  mul s11, t6, t3                                                       # ir inst 9 fin
  add t6, s11, t4                                                       # ir inst 10 fin
  slli t4, t6, 2                                                        # ir inst 11 fin
  mv t6, t4                                                             # ir inst 12 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 13 fin
  sw t5, 0(t3)                                                          # ir inst 14 fin
  mv t6, t4                                                             # ir inst 15 fin
  addi t5, t6, 1                                                        # ir inst 16 fin
  slli t2, t5, 2
  add t6, a1, t2                                                        # ir inst 17 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 18 fin
  mv t6, t4                                                             # ir inst 19 fin
  addi t5, t6, 2                                                        # ir inst 20 fin
  slli t2, t5, 2
  add t6, a1, t2                                                        # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t4, 24(sp)
  sd t6, 32(sp)
  call .F.get_current_timestamp
  mv t5, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t4, 24(sp)
  ld t6, 32(sp)
# ir inst 22 fin
  sw t5, 0(t6)                                                          # ir inst 23 fin
  mv t6, t4                                                             # ir inst 24 fin
  addi t5, t6, 3                                                        # ir inst 25 fin
  slli t2, t5, 2
  add t6, a1, t2                                                        # ir inst 26 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  call .F.simulate_memory_read
  mv t5, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 27 fin
  sw t5, 0(t6)                                                          # ir inst 28 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  call .F.get_cache_line_size
  mv t6, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
# ir inst 29 fin
  div t5, a0, t6                                                        # ir inst 30 fin
  li t2, 64
  rem t6, t5, t2                                                        # ir inst 31 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t6, 16(sp)
  call .F.get_cache_line_size
  mv t5, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t6, 16(sp)
# ir inst 32 fin
  slli t4, t5, 6                                                        # ir inst 33 fin
  div t5, a0, t4                                                        # ir inst 34 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  mv a0, a2
  call .F.find_lru_way_l2
  mv t4, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 35 fin
  slli t3, t6, 3                                                        # ir inst 36 fin
  add t6, t3, t4                                                        # ir inst 37 fin
  slli t4, t6, 2                                                        # ir inst 38 fin
  mv t6, t4                                                             # ir inst 39 fin
  slli t2, t6, 2
  add t3, a2, t2                                                        # ir inst 40 fin
  sw t5, 0(t3)                                                          # ir inst 41 fin
  mv t6, t4                                                             # ir inst 42 fin
  addi t5, t6, 1                                                        # ir inst 43 fin
  slli t2, t5, 2
  add t6, a2, t2                                                        # ir inst 44 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 45 fin
  mv t6, t4                                                             # ir inst 46 fin
  addi t5, t6, 2                                                        # ir inst 47 fin
  slli t2, t5, 2
  add t6, a2, t2                                                        # ir inst 48 fin
# Start call preparation
  sd a0, 0(sp)
  sd a2, 8(sp)
  sd t4, 16(sp)
  sd t6, 24(sp)
  call .F.get_current_timestamp
  mv t5, a0
  ld a0, 0(sp)
  ld a2, 8(sp)
  ld t4, 16(sp)
  ld t6, 24(sp)
# ir inst 49 fin
  sw t5, 0(t6)                                                          # ir inst 50 fin
  mv t6, t4                                                             # ir inst 51 fin
  addi t5, t6, 3                                                        # ir inst 52 fin
  slli t2, t5, 2
  add t6, a2, t2                                                        # ir inst 53 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.simulate_memory_read
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 54 fin
  sw t5, 0(t6)                                                          # ir inst 55 fin
  li a0, 1
  j .F.simulate_cache_fill.epilogue                                     # ir inst 56 fin
.F.simulate_cache_fill.epilogue:
  ld ra, 64(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.find_lru_way_l1
.F.find_lru_way_l1:
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
.F.find_lru_way_l1._0.entry.0:
# Phi connections
  li t4, 2147483647
  li t5, 0
  li t6, 0
  j .F.find_lru_way_l1._1.while.cond.0                                  # ir inst 1 fin
.F.find_lru_way_l1._1.while.cond.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F.get_associativity
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 5 fin
  slt s11, t6, t3                                                       # ir inst 6 fin
  bnez s11, .F.find_lru_way_l1._2.while.body.0
  j .F.find_lru_way_l1._9.while.exit.0                                  # ir inst 7 fin
.F.find_lru_way_l1._2.while.body.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t4, 16(sp)
  sd t5, 24(sp)
  sd t6, 32(sp)
  call .F.get_associativity
  mv t3, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t4, 16(sp)
  ld t5, 24(sp)
  ld t6, 32(sp)
# ir inst 8 fin
  mul s11, a1, t3                                                       # ir inst 9 fin
  add t3, s11, t6                                                       # ir inst 10 fin
  slli s11, t3, 2                                                       # ir inst 11 fin
  mv t3, s11                                                            # ir inst 12 fin
  addi s10, t3, 2                                                       # ir inst 13 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 14 fin
  lw s10, 0(t3)                                                         # ir inst 15 fin
  mv t3, s11                                                            # ir inst 16 fin
  addi s11, t3, 1                                                       # ir inst 17 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 18 fin
  lw s11, 0(t3)                                                         # ir inst 19 fin
  li t2, 0
  xor t0, s11, t2
  sltiu t3, t0, 1                                                       # ir inst 20 fin
  bnez t3, .F.find_lru_way_l1._3.if.then.0
  j .F.find_lru_way_l1._4.if.else.0                                     # ir inst 21 fin
.F.find_lru_way_l1._3.if.then.0:
  mv a0, t6
  j .F.find_lru_way_l1.epilogue                                         # ir inst 22 fin
.F.find_lru_way_l1._4.if.else.0:
  j .F.find_lru_way_l1._5.if.exit.0                                     # ir inst 23 fin
.F.find_lru_way_l1._5.if.exit.0:
  slt t3, s10, t4                                                       # ir inst 24 fin
  bnez t3, .F.find_lru_way_l1._6.if.then.1
  j .F.find_lru_way_l1._7.if.else.1                                     # ir inst 25 fin
.F.find_lru_way_l1._6.if.then.1:
# Phi connections
  mv t3, s10
  mv t4, t6
  j .F.find_lru_way_l1._8.if.exit.1                                     # ir inst 26 fin
.F.find_lru_way_l1._7.if.else.1:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.find_lru_way_l1._8.if.exit.1                                     # ir inst 27 fin
.F.find_lru_way_l1._8.if.exit.1:
  addi s11, t6, 1                                                       # ir inst 30 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.find_lru_way_l1._1.while.cond.0                                  # ir inst 31 fin
.F.find_lru_way_l1._9.while.exit.0:
  mv a0, t5
  j .F.find_lru_way_l1.epilogue                                         # ir inst 32 fin
.F.find_lru_way_l1.epilogue:
  ld ra, 64(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.find_lru_way_l2
.F.find_lru_way_l2:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 0,                range:       16(sp) -       16(sp)
# callee save reg num: 2 / 12,        range:        0(sp) -       16(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s10, 0(sp)
  sd s11, 8(sp)
.F.find_lru_way_l2._0.entry.0:
# Phi connections
  li t4, 2147483647
  li t5, 0
  li t6, 0
  j .F.find_lru_way_l2._1.while.cond.0                                  # ir inst 1 fin
.F.find_lru_way_l2._1.while.cond.0:
  li t2, 8
  slt t3, t6, t2                                                        # ir inst 5 fin
  bnez t3, .F.find_lru_way_l2._2.while.body.0
  j .F.find_lru_way_l2._9.while.exit.0                                  # ir inst 6 fin
.F.find_lru_way_l2._2.while.body.0:
  slli t3, a1, 3                                                        # ir inst 7 fin
  add s11, t3, t6                                                       # ir inst 8 fin
  slli t3, s11, 2                                                       # ir inst 9 fin
  mv s11, t3                                                            # ir inst 10 fin
  addi s10, s11, 2                                                      # ir inst 11 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 12 fin
  lw s10, 0(s11)                                                        # ir inst 13 fin
  mv s11, t3                                                            # ir inst 14 fin
  addi t3, s11, 1                                                       # ir inst 15 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 16 fin
  lw t3, 0(s11)                                                         # ir inst 17 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 18 fin
  bnez s11, .F.find_lru_way_l2._3.if.then.0
  j .F.find_lru_way_l2._4.if.else.0                                     # ir inst 19 fin
.F.find_lru_way_l2._3.if.then.0:
  mv a0, t6
  j .F.find_lru_way_l2.epilogue                                         # ir inst 20 fin
.F.find_lru_way_l2._4.if.else.0:
  j .F.find_lru_way_l2._5.if.exit.0                                     # ir inst 21 fin
.F.find_lru_way_l2._5.if.exit.0:
  slt t3, s10, t4                                                       # ir inst 22 fin
  bnez t3, .F.find_lru_way_l2._6.if.then.1
  j .F.find_lru_way_l2._7.if.else.1                                     # ir inst 23 fin
.F.find_lru_way_l2._6.if.then.1:
# Phi connections
  mv t3, s10
  mv t4, t6
  j .F.find_lru_way_l2._8.if.exit.1                                     # ir inst 24 fin
.F.find_lru_way_l2._7.if.else.1:
# Phi connections
  mv t3, t4
  mv t4, t5
  j .F.find_lru_way_l2._8.if.exit.1                                     # ir inst 25 fin
.F.find_lru_way_l2._8.if.exit.1:
  addi s11, t6, 1                                                       # ir inst 28 fin
# Phi connections
  mv t5, t4
  mv t6, s11
  mv t4, t3
  j .F.find_lru_way_l2._1.while.cond.0                                  # ir inst 29 fin
.F.find_lru_way_l2._9.while.exit.0:
  mv a0, t5
  j .F.find_lru_way_l2.epilogue                                         # ir inst 30 fin
.F.find_lru_way_l2.epilogue:
  ld s10, 0(sp)
  ld s11, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.update_lru_counters_l1
.F.update_lru_counters_l1:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.update_lru_counters_l1._0.entry.0:
  addi t6, a1, 1                                                        # ir inst 1 fin
  mv a0, t6
  j .F.update_lru_counters_l1.epilogue                                  # ir inst 2 fin
.F.update_lru_counters_l1.epilogue:
  ret

.globl .F.update_lru_counters_l2
.F.update_lru_counters_l2:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.update_lru_counters_l2._0.entry.0:
  addi t6, a1, 1                                                        # ir inst 1 fin
  mv a0, t6
  j .F.update_lru_counters_l2.epilogue                                  # ir inst 2 fin
.F.update_lru_counters_l2.epilogue:
  ret

.globl .F.get_current_timestamp
.F.get_current_timestamp:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:       16(sp) -       16(sp)
# return addr size: 8,                range:        8(sp) -       16(sp)
# callee save reg num: 0 / 12,        range:        8(sp) -        8(sp)
# max caller save reg num: 1 / 12,    range:        0(sp) -        8(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd ra, 8(sp)
.F.get_current_timestamp._0.entry.0:
# Start call preparation
  li a0, 42
  call .F.hash_function
  mv t6, a0
# ir inst 1 fin
  li t2, 1000000
  rem t5, t6, t2                                                        # ir inst 2 fin
  mv a0, t5
  j .F.get_current_timestamp.epilogue                                   # ir inst 3 fin
.F.get_current_timestamp.epilogue:
  ld ra, 8(sp)
  addi sp, sp, 16
  ret

.globl .F.simulate_memory_read
.F.simulate_memory_read:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.simulate_memory_read._0.entry.0:
  li t2, 65536
  rem t6, a0, t2                                                        # ir inst 1 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.hash_function
  mv t5, a0
  ld t6, 0(sp)
# ir inst 2 fin
  mv a0, t5
  j .F.simulate_memory_read.epilogue                                    # ir inst 3 fin
.F.simulate_memory_read.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.run_memory_manager
.F.run_memory_manager:
# spill func args num: 0,             range:    98464(sp) -    98464(sp)
# local var size: 98368,              range:       96(sp) -    98464(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 7 / 12,        range:       32(sp) -       88(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -98464
  add sp, sp, t0
  sd s10, 32(sp)
  sd s9, 40(sp)
  sd s8, 48(sp)
  sd s5, 56(sp)
  sd s7, 64(sp)
  sd s6, 72(sp)
  sd s11, 80(sp)
  sd ra, 88(sp)
.F.run_memory_manager._0.entry.0:
  addi t1, sp, 96
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 8
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 96
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 16
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 96
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 32
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 96
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 64
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 96
  addi t6, t1, 16                                                       # ir inst 10 fin
  li t1, 128
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 96
  addi t6, t1, 20                                                       # ir inst 12 fin
  li t1, 256
  sw t1, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 96
  addi t6, t1, 24                                                       # ir inst 14 fin
  li t1, 512
  sw t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 96
  addi t6, t1, 28                                                       # ir inst 16 fin
  li t1, 1024
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 96
  addi t6, t1, 32                                                       # ir inst 18 fin
  li t1, 2048
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 96
  addi t6, t1, 36                                                       # ir inst 20 fin
  li t1, 4096
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 96
  addi t6, t1, 40                                                       # ir inst 22 fin
  li t1, 8192
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 96
  addi t6, t1, 44                                                       # ir inst 24 fin
  li t1, 16384
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t1, sp, 96
  addi t6, t1, 48                                                       # ir inst 26 fin
  li t1, 32768
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t1, sp, 96
  addi t6, t1, 52                                                       # ir inst 28 fin
  li t1, 65536
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t1, sp, 96
  addi t6, t1, 56                                                       # ir inst 30 fin
  li t1, 131072
  sw t1, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 96
  addi t6, t1, 60                                                       # ir inst 32 fin
  li t1, 262144
  sw t1, 0(t6)                                                          # ir inst 33 fin
  addi t1, sp, 160
  addi t6, t1, 0                                                        # ir inst 35 fin
# Phi connections
  li t5, 0
  j .F.run_memory_manager._1.array.cond.0                               # ir inst 36 fin
.F.run_memory_manager._1.array.cond.0:
  li t2, 16384
  slt t4, t5, t2                                                        # ir inst 38 fin
  bnez t4, .F.run_memory_manager._2.array.body.0
  j .F.run_memory_manager._3.array.exit.0                               # ir inst 39 fin
.F.run_memory_manager._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 40 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 41 fin
  addi t4, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t5, t4
  j .F.run_memory_manager._1.array.cond.0                               # ir inst 43 fin
.F.run_memory_manager._3.array.exit.0:
  li t1, 65696
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 45 fin
# Phi connections
  li t5, 0
  j .F.run_memory_manager._4.array.cond.1                               # ir inst 46 fin
.F.run_memory_manager._4.array.cond.1:
  li t2, 4096
  slt t4, t5, t2                                                        # ir inst 48 fin
  bnez t4, .F.run_memory_manager._5.array.body.1
  j .F.run_memory_manager._6.array.exit.1                               # ir inst 49 fin
.F.run_memory_manager._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 50 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 51 fin
  addi t4, t5, 1                                                        # ir inst 52 fin
# Phi connections
  mv t5, t4
  j .F.run_memory_manager._4.array.cond.1                               # ir inst 53 fin
.F.run_memory_manager._6.array.exit.1:
  li t1, 82080
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 55 fin
# Phi connections
  li t5, 0
  j .F.run_memory_manager._7.array.cond.2                               # ir inst 56 fin
.F.run_memory_manager._7.array.cond.2:
  li t2, 4096
  slt t4, t5, t2                                                        # ir inst 58 fin
  bnez t4, .F.run_memory_manager._8.array.body.2
  j .F.run_memory_manager._9.array.exit.2                               # ir inst 59 fin
.F.run_memory_manager._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 60 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 61 fin
  addi t4, t5, 1                                                        # ir inst 62 fin
# Phi connections
  mv t5, t4
  j .F.run_memory_manager._7.array.cond.2                               # ir inst 63 fin
.F.run_memory_manager._9.array.exit.2:
  li t1, 65696
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 64 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 65 fin
  li t1, 65696
  add t1, sp, t1
  addi t6, t1, 4                                                        # ir inst 66 fin
  li t1, 65536
  sw t1, 0(t6)                                                          # ir inst 67 fin
# Phi connections
  li s10, 0
  li s11, 1
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.run_memory_manager._10.while.cond.0                              # ir inst 68 fin
.F.run_memory_manager._10.while.cond.0:
  li t2, 10
  slt s9, s10, t2                                                       # ir inst 75 fin
  bnez s9, .F.run_memory_manager._11.while.body.0
  j .F.run_memory_manager._30.while.exit.0                              # ir inst 76 fin
.F.run_memory_manager._11.while.body.0:
  li t2, 16
  rem s9, s10, t2                                                       # ir inst 77 fin
  mv s8, s9                                                             # ir inst 78 fin
  slli t2, s8, 2
  addi t1, sp, 96
  add s9, t1, t2                                                        # ir inst 79 fin
  lw s8, 0(s9)                                                          # ir inst 80 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a5, s8
  mv a4, t3
  mv a3, s11
  li t1, 82080
  add t1, sp, t1
  mv a2, t1
  li t1, 65696
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 160
  mv a0, t1
  call .F.allocate_memory
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 81 fin
  li t2, 0
  slt t0, s9, t2
  xori s7, t0, 1                                                        # ir inst 82 fin
  bnez s7, .F.run_memory_manager._12.if.then.0
  j .F.run_memory_manager._13.if.else.0                                 # ir inst 83 fin
.F.run_memory_manager._12.if.then.0:
  addi s7, t4, 1                                                        # ir inst 84 fin
  addi s6, t3, 1                                                        # ir inst 85 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s8
  mv a0, s9
  call .F.simulate_memory_usage
  mv s5, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 86 fin
# Phi connections
  mv s8, s7
  mv s9, t5
  mv t3, t6
  mv s7, s6
  j .F.run_memory_manager._20.if.exit.0                                 # ir inst 87 fin
.F.run_memory_manager._13.if.else.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a4, t3
  mv a3, s11
  li t1, 82080
  add t1, sp, t1
  mv a2, t1
  li t1, 65696
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 160
  mv a0, t1
  call .F.run_garbage_collection
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 88 fin
  addi s7, t6, 1                                                        # ir inst 89 fin
  li t2, 0
  slt s6, t2, s9                                                        # ir inst 90 fin
  bnez s6, .F.run_memory_manager._14.if.then.1
  j .F.run_memory_manager._18.if.else.1                                 # ir inst 91 fin
.F.run_memory_manager._14.if.then.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a5, s8
  mv a4, t3
  mv a3, s11
  li t1, 82080
  add t1, sp, t1
  mv a2, t1
  li t1, 65696
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 160
  mv a0, t1
  call .F.allocate_memory
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 92 fin
  li t2, 0
  slt t0, s9, t2
  xori s8, t0, 1                                                        # ir inst 93 fin
  bnez s8, .F.run_memory_manager._15.if.then.2
  j .F.run_memory_manager._16.if.else.2                                 # ir inst 94 fin
.F.run_memory_manager._15.if.then.2:
  addi s9, t4, 1                                                        # ir inst 95 fin
  addi s8, t3, 1                                                        # ir inst 96 fin
# Phi connections
  mv s6, s8
  mv s8, s9
  mv s9, t5
  j .F.run_memory_manager._17.if.exit.2                                 # ir inst 97 fin
.F.run_memory_manager._16.if.else.2:
  addi s9, t5, 1                                                        # ir inst 98 fin
# Phi connections
  mv s6, t3
  mv s8, t4
  j .F.run_memory_manager._17.if.exit.2                                 # ir inst 99 fin
.F.run_memory_manager._17.if.exit.2:
# Phi connections
  mv t3, s9
  mv s9, s8
  mv s8, s6
  j .F.run_memory_manager._19.if.exit.1                                 # ir inst 103 fin
.F.run_memory_manager._18.if.else.1:
  addi s9, t5, 1                                                        # ir inst 104 fin
# Phi connections
  mv s8, t3
  mv t3, s9
  mv s9, t4
  j .F.run_memory_manager._19.if.exit.1                                 # ir inst 105 fin
.F.run_memory_manager._19.if.exit.1:
# Phi connections
  mv t0, s7
  mv s7, s8
  mv s8, s9
  mv s9, t3
  mv t3, t0
  j .F.run_memory_manager._20.if.exit.0                                 # ir inst 109 fin
.F.run_memory_manager._20.if.exit.0:
  li t2, 10
  rem s6, s10, t2                                                       # ir inst 114 fin
  li t2, 7
  xor t0, s6, t2
  sltiu s5, t0, 1                                                       # ir inst 115 fin
  bnez s5, .F.run_memory_manager._21.lazy.then.0
  j .F.run_memory_manager._22.lazy.else.0                               # ir inst 116 fin
.F.run_memory_manager._21.lazy.then.0:
  li t2, 0
  slt s6, t2, s7                                                        # ir inst 117 fin
# Phi connections
  j .F.run_memory_manager._23.lazy.exit.0                               # ir inst 118 fin
.F.run_memory_manager._22.lazy.else.0:
# Phi connections
  li s6, 0
  j .F.run_memory_manager._23.lazy.exit.0                               # ir inst 119 fin
.F.run_memory_manager._23.lazy.exit.0:
  bnez s6, .F.run_memory_manager._24.if.then.3
  j .F.run_memory_manager._28.if.else.3                                 # ir inst 121 fin
.F.run_memory_manager._24.if.then.3:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a4, s7
  mv a3, s11
  li t1, 82080
  add t1, sp, t1
  mv a2, t1
  li t1, 65696
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 160
  mv a0, t1
  call .F.free_random_block
  mv s6, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 122 fin
  li t2, 0
  slt s5, t2, s6                                                        # ir inst 123 fin
  bnez s5, .F.run_memory_manager._25.if.then.4
  j .F.run_memory_manager._26.if.else.4                                 # ir inst 124 fin
.F.run_memory_manager._25.if.then.4:
  addi s6, s7, -1                                                       # ir inst 125 fin
  addi s5, s11, 1                                                       # ir inst 126 fin
# Phi connections
  j .F.run_memory_manager._27.if.exit.4                                 # ir inst 127 fin
.F.run_memory_manager._26.if.else.4:
# Phi connections
  mv s5, s11
  mv s6, s7
  j .F.run_memory_manager._27.if.exit.4                                 # ir inst 128 fin
.F.run_memory_manager._27.if.exit.4:
# Phi connections
  mv s7, s5
  mv s11, s6
  j .F.run_memory_manager._29.if.exit.3                                 # ir inst 131 fin
.F.run_memory_manager._28.if.else.3:
# Phi connections
  mv t0, s7
  mv s7, s11
  mv s11, t0
  j .F.run_memory_manager._29.if.exit.3                                 # ir inst 132 fin
.F.run_memory_manager._29.if.exit.3:
  addi s6, s10, 1                                                       # ir inst 135 fin
# Phi connections
  mv s10, s6
  mv t4, s8
  mv t5, s9
  mv t6, t3
  mv t3, s11
  mv s11, s7
  j .F.run_memory_manager._10.while.cond.0                              # ir inst 136 fin
.F.run_memory_manager._30.while.exit.0:
  li t2, 1000
  mul t3, t4, t2                                                        # ir inst 137 fin
  add s11, t4, t5                                                       # ir inst 138 fin
  div t5, t3, s11                                                       # ir inst 139 fin
  add t4, t5, t6                                                        # ir inst 140 fin
  mv a0, t4
  j .F.run_memory_manager.epilogue                                      # ir inst 141 fin
.F.run_memory_manager.epilogue:
  ld ra, 88(sp)
  ld s10, 32(sp)
  ld s9, 40(sp)
  ld s8, 48(sp)
  ld s5, 56(sp)
  ld s7, 64(sp)
  ld s6, 72(sp)
  ld s11, 80(sp)
  li t0, 98464
  add sp, sp, t0
  ret

.globl .F.allocate_memory
.F.allocate_memory:
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
.F.allocate_memory._0.entry.0:
# Phi connections
  li t6, 0
  j .F.allocate_memory._1.while.cond.0                                  # ir inst 1 fin
.F.allocate_memory._1.while.cond.0:
  slt t5, t6, a3                                                        # ir inst 3 fin
  bnez t5, .F.allocate_memory._2.while.body.0
  j .F.allocate_memory._12.while.exit.0                                 # ir inst 4 fin
.F.allocate_memory._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t4, t5, 1                                                        # ir inst 6 fin
  slli t2, t4, 2
  add t5, a1, t2                                                        # ir inst 7 fin
  lw t4, 0(t5)                                                          # ir inst 8 fin
  mv t5, t6                                                             # ir inst 9 fin
  slli t3, t5, 1                                                        # ir inst 10 fin
  addi t5, t3, 1                                                        # ir inst 11 fin
  slli t2, t5, 2
  add t3, a1, t2                                                        # ir inst 12 fin
  lw t5, 0(t3)                                                          # ir inst 13 fin
  slt t0, t5, a5
  xori t3, t0, 1                                                        # ir inst 14 fin
  bnez t3, .F.allocate_memory._3.if.then.0
  j .F.allocate_memory._10.if.else.0                                    # ir inst 15 fin
.F.allocate_memory._3.if.then.0:
  mv t3, a4                                                             # ir inst 16 fin
  slli s11, t3, 1                                                       # ir inst 17 fin
  slli t2, s11, 2
  add t3, a2, t2                                                        # ir inst 18 fin
  sw t4, 0(t3)                                                          # ir inst 19 fin
  mv t3, a4                                                             # ir inst 20 fin
  slli s11, t3, 1                                                       # ir inst 21 fin
  addi t3, s11, 1                                                       # ir inst 22 fin
  slli t2, t3, 2
  add s11, a2, t2                                                       # ir inst 23 fin
  sw a5, 0(s11)                                                         # ir inst 24 fin
  xor t0, t5, a5
  sltiu t3, t0, 1                                                       # ir inst 25 fin
  bnez t3, .F.allocate_memory._4.if.then.1
  j .F.allocate_memory._8.if.else.1                                     # ir inst 26 fin
.F.allocate_memory._4.if.then.1:
# Phi connections
  mv t3, t6
  j .F.allocate_memory._5.while.cond.1                                  # ir inst 27 fin
.F.allocate_memory._5.while.cond.1:
  addi s11, a3, -1                                                      # ir inst 29 fin
  slt s10, t3, s11                                                      # ir inst 30 fin
  bnez s10, .F.allocate_memory._6.while.body.1
  j .F.allocate_memory._7.while.exit.1                                  # ir inst 31 fin
.F.allocate_memory._6.while.body.1:
  mv s11, t3                                                            # ir inst 32 fin
  slli s10, s11, 1                                                      # ir inst 33 fin
  slli t2, s10, 2
  add s11, a1, t2                                                       # ir inst 34 fin
  mv s10, t3                                                            # ir inst 35 fin
  addi s9, s10, 1                                                       # ir inst 36 fin
  slli s10, s9, 1                                                       # ir inst 37 fin
  slli t2, s10, 2
  add s9, a1, t2                                                        # ir inst 38 fin
  lw s10, 0(s9)                                                         # ir inst 39 fin
  sw s10, 0(s11)                                                        # ir inst 40 fin
  mv s11, t3                                                            # ir inst 41 fin
  slli s10, s11, 1                                                      # ir inst 42 fin
  addi s11, s10, 1                                                      # ir inst 43 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 44 fin
  mv s11, t3                                                            # ir inst 45 fin
  addi s9, s11, 1                                                       # ir inst 46 fin
  slli s11, s9, 1                                                       # ir inst 47 fin
  addi s9, s11, 1                                                       # ir inst 48 fin
  slli t2, s9, 2
  add s11, a1, t2                                                       # ir inst 49 fin
  lw s9, 0(s11)                                                         # ir inst 50 fin
  sw s9, 0(s10)                                                         # ir inst 51 fin
  addi s11, t3, 1                                                       # ir inst 52 fin
# Phi connections
  mv t3, s11
  j .F.allocate_memory._5.while.cond.1                                  # ir inst 53 fin
.F.allocate_memory._7.while.exit.1:
  j .F.allocate_memory._9.if.exit.1                                     # ir inst 54 fin
.F.allocate_memory._8.if.else.1:
  mv t3, t6                                                             # ir inst 55 fin
  slli s11, t3, 1                                                       # ir inst 56 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 57 fin
  add s11, t4, a5                                                       # ir inst 58 fin
  sw s11, 0(t3)                                                         # ir inst 59 fin
  mv t3, t6                                                             # ir inst 60 fin
  slli s11, t3, 1                                                       # ir inst 61 fin
  addi t3, s11, 1                                                       # ir inst 62 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 63 fin
  sub t3, t5, a5                                                        # ir inst 64 fin
  sw t3, 0(s11)                                                         # ir inst 65 fin
  j .F.allocate_memory._9.if.exit.1                                     # ir inst 66 fin
.F.allocate_memory._9.if.exit.1:
  mv a0, t4
  j .F.allocate_memory.epilogue                                         # ir inst 67 fin
.F.allocate_memory._10.if.else.0:
  j .F.allocate_memory._11.if.exit.0                                    # ir inst 68 fin
.F.allocate_memory._11.if.exit.0:
  addi t5, t6, 1                                                        # ir inst 69 fin
# Phi connections
  mv t6, t5
  j .F.allocate_memory._1.while.cond.0                                  # ir inst 70 fin
.F.allocate_memory._12.while.exit.0:
  li a0, -1
  j .F.allocate_memory.epilogue                                         # ir inst 71 fin
.F.allocate_memory.epilogue:
  ld s10, 0(sp)
  ld s9, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.simulate_memory_usage
.F.simulate_memory_usage:
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
.F.simulate_memory_usage._0.entry.0:
  add t6, a0, a1                                                        # ir inst 1 fin
  li t2, 5
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.simulate_memory_usage._1.if.then.0
  j .F.simulate_memory_usage._5.if.else.0                               # ir inst 4 fin
.F.simulate_memory_usage._1.if.then.0:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.simulate_memory_usage._2.while.cond.0                            # ir inst 5 fin
.F.simulate_memory_usage._2.while.cond.0:
  slt t3, t6, a1                                                        # ir inst 8 fin
  bnez t3, .F.simulate_memory_usage._3.while.body.0
  j .F.simulate_memory_usage._4.while.exit.0                            # ir inst 9 fin
.F.simulate_memory_usage._3.while.body.0:
  addi t3, t4, 1                                                        # ir inst 10 fin
  addi s11, t6, 4                                                       # ir inst 11 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.simulate_memory_usage._2.while.cond.0                            # ir inst 12 fin
.F.simulate_memory_usage._4.while.exit.0:
# Phi connections
  mv t6, t4
  j .F.simulate_memory_usage._24.if.exit.0                              # ir inst 13 fin
.F.simulate_memory_usage._5.if.else.0:
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 14 fin
  bnez t6, .F.simulate_memory_usage._6.if.then.1
  j .F.simulate_memory_usage._10.if.else.1                              # ir inst 15 fin
.F.simulate_memory_usage._6.if.then.1:
  li t2, 8
  div t6, a1, t2                                                        # ir inst 16 fin
# Phi connections
  li t3, 0
  li t4, 0
  j .F.simulate_memory_usage._7.while.cond.1                            # ir inst 17 fin
.F.simulate_memory_usage._7.while.cond.1:
  slt s11, t3, t6                                                       # ir inst 20 fin
  bnez s11, .F.simulate_memory_usage._8.while.body.1
  j .F.simulate_memory_usage._9.while.exit.1                            # ir inst 21 fin
.F.simulate_memory_usage._8.while.body.1:
  add s11, t3, a0                                                       # ir inst 22 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, s11
  call .F.hash_function
  mv s10, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 23 fin
  addi s11, t4, 1                                                       # ir inst 24 fin
  addi s10, t3, 1                                                       # ir inst 25 fin
# Phi connections
  mv t3, s10
  mv t4, s11
  j .F.simulate_memory_usage._7.while.cond.1                            # ir inst 26 fin
.F.simulate_memory_usage._9.while.exit.1:
# Phi connections
  mv t6, t4
  j .F.simulate_memory_usage._23.if.exit.1                              # ir inst 27 fin
.F.simulate_memory_usage._10.if.else.1:
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 28 fin
  bnez t6, .F.simulate_memory_usage._11.if.then.2
  j .F.simulate_memory_usage._15.if.else.2                              # ir inst 29 fin
.F.simulate_memory_usage._11.if.then.2:
# Phi connections
  li t4, 0
  li t6, 0
  j .F.simulate_memory_usage._12.while.cond.2                           # ir inst 30 fin
.F.simulate_memory_usage._12.while.cond.2:
  slt t3, t6, a1                                                        # ir inst 33 fin
  bnez t3, .F.simulate_memory_usage._13.while.body.2
  j .F.simulate_memory_usage._14.while.exit.2                           # ir inst 34 fin
.F.simulate_memory_usage._13.while.body.2:
  addi t3, t4, 1                                                        # ir inst 35 fin
  addi s11, t6, 16                                                      # ir inst 36 fin
# Phi connections
  mv t4, t3
  mv t6, s11
  j .F.simulate_memory_usage._12.while.cond.2                           # ir inst 37 fin
.F.simulate_memory_usage._14.while.exit.2:
# Phi connections
  mv t6, t4
  j .F.simulate_memory_usage._22.if.exit.2                              # ir inst 38 fin
.F.simulate_memory_usage._15.if.else.2:
  li t2, 3
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 39 fin
  bnez t6, .F.simulate_memory_usage._16.if.then.3
  j .F.simulate_memory_usage._20.if.else.3                              # ir inst 40 fin
.F.simulate_memory_usage._16.if.then.3:
  li t2, 4
  div t6, a1, t2                                                        # ir inst 41 fin
# Phi connections
  li t4, 0
  li t5, 0
  j .F.simulate_memory_usage._17.while.cond.3                           # ir inst 42 fin
.F.simulate_memory_usage._17.while.cond.3:
  slt t3, t5, t6                                                        # ir inst 45 fin
  bnez t3, .F.simulate_memory_usage._18.while.body.3
  j .F.simulate_memory_usage._19.while.exit.3                           # ir inst 46 fin
.F.simulate_memory_usage._18.while.body.3:
  addi t3, t4, 1                                                        # ir inst 47 fin
  addi s11, t5, 1                                                       # ir inst 48 fin
# Phi connections
  mv t4, t3
  mv t5, s11
  j .F.simulate_memory_usage._17.while.cond.3                           # ir inst 49 fin
.F.simulate_memory_usage._19.while.exit.3:
# Phi connections
  mv t6, t4
  j .F.simulate_memory_usage._21.if.exit.3                              # ir inst 50 fin
.F.simulate_memory_usage._20.if.else.3:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  call .F.simulate_complex_memory_pattern
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
# ir inst 51 fin
# Phi connections
  j .F.simulate_memory_usage._21.if.exit.3                              # ir inst 52 fin
.F.simulate_memory_usage._21.if.exit.3:
# Phi connections
  j .F.simulate_memory_usage._22.if.exit.2                              # ir inst 54 fin
.F.simulate_memory_usage._22.if.exit.2:
# Phi connections
  j .F.simulate_memory_usage._23.if.exit.1                              # ir inst 56 fin
.F.simulate_memory_usage._23.if.exit.1:
# Phi connections
  j .F.simulate_memory_usage._24.if.exit.0                              # ir inst 58 fin
.F.simulate_memory_usage._24.if.exit.0:
  mv a0, t6
  j .F.simulate_memory_usage.epilogue                                   # ir inst 60 fin
.F.simulate_memory_usage.epilogue:
  ld ra, 64(sp)
  ld s10, 48(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.simulate_complex_memory_pattern
.F.simulate_complex_memory_pattern:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       96(sp) -       96(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 5 / 12,        range:       48(sp) -       88(sp)
# max caller save reg num: 6 / 12,    range:        0(sp) -       48(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s7, 48(sp)
  sd s11, 56(sp)
  sd s8, 64(sp)
  sd s10, 72(sp)
  sd s9, 80(sp)
  sd ra, 88(sp)
.F.simulate_complex_memory_pattern._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.simulate_complex_memory_pattern._1.while.cond.0                  # ir inst 1 fin
.F.simulate_complex_memory_pattern._1.while.cond.0:
  li t2, 4
  slt t4, t5, t2                                                        # ir inst 4 fin
  bnez t4, .F.simulate_complex_memory_pattern._2.while.body.0
  j .F.simulate_complex_memory_pattern._18.while.exit.0                 # ir inst 5 fin
.F.simulate_complex_memory_pattern._2.while.body.0:
  li t2, 4
  div t4, a1, t2                                                        # ir inst 6 fin
  mul t3, t5, t4                                                        # ir inst 7 fin
  add s11, a0, t3                                                       # ir inst 8 fin
  li t2, 2
  rem t3, t5, t2                                                        # ir inst 9 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s10, t0, 1                                                      # ir inst 10 fin
  bnez s10, .F.simulate_complex_memory_pattern._3.if.then.0
  j .F.simulate_complex_memory_pattern._10.if.else.0                    # ir inst 11 fin
.F.simulate_complex_memory_pattern._3.if.then.0:
# Phi connections
  li s10, 0
  mv t3, t6
  j .F.simulate_complex_memory_pattern._4.while.cond.1                  # ir inst 12 fin
.F.simulate_complex_memory_pattern._4.while.cond.1:
  slt s9, s10, t4                                                       # ir inst 15 fin
  bnez s9, .F.simulate_complex_memory_pattern._5.while.body.1
  j .F.simulate_complex_memory_pattern._9.while.exit.1                  # ir inst 16 fin
.F.simulate_complex_memory_pattern._5.while.body.1:
  addi s9, t3, 1                                                        # ir inst 17 fin
  li t2, 64
  rem s8, s10, t2                                                       # ir inst 18 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 19 fin
  bnez s7, .F.simulate_complex_memory_pattern._6.if.then.1
  j .F.simulate_complex_memory_pattern._7.if.else.1                     # ir inst 20 fin
.F.simulate_complex_memory_pattern._6.if.then.1:
  add s8, s11, s10                                                      # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, s8
  call .F.compute_checksum
  mv s7, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 22 fin
  add s8, s9, s7                                                        # ir inst 23 fin
# Phi connections
  mv s9, s8
  j .F.simulate_complex_memory_pattern._8.if.exit.1                     # ir inst 24 fin
.F.simulate_complex_memory_pattern._7.if.else.1:
# Phi connections
  j .F.simulate_complex_memory_pattern._8.if.exit.1                     # ir inst 25 fin
.F.simulate_complex_memory_pattern._8.if.exit.1:
  addi s8, s10, 4                                                       # ir inst 27 fin
# Phi connections
  mv s10, s8
  mv t3, s9
  j .F.simulate_complex_memory_pattern._4.while.cond.1                  # ir inst 28 fin
.F.simulate_complex_memory_pattern._9.while.exit.1:
# Phi connections
  mv t4, t3
  j .F.simulate_complex_memory_pattern._17.if.exit.0                    # ir inst 29 fin
.F.simulate_complex_memory_pattern._10.if.else.0:
  addi t3, t4, -4                                                       # ir inst 30 fin
# Phi connections
  mv t4, t6
  j .F.simulate_complex_memory_pattern._11.while.cond.2                 # ir inst 31 fin
.F.simulate_complex_memory_pattern._11.while.cond.2:
  li t2, 0
  slt t0, t3, t2
  xori s10, t0, 1                                                       # ir inst 34 fin
  bnez s10, .F.simulate_complex_memory_pattern._12.while.body.2
  j .F.simulate_complex_memory_pattern._16.while.exit.2                 # ir inst 35 fin
.F.simulate_complex_memory_pattern._12.while.body.2:
  addi s10, t4, 1                                                       # ir inst 36 fin
  li t2, 128
  rem s9, t3, t2                                                        # ir inst 37 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 38 fin
  bnez s8, .F.simulate_complex_memory_pattern._13.if.then.2
  j .F.simulate_complex_memory_pattern._14.if.else.2                    # ir inst 39 fin
.F.simulate_complex_memory_pattern._13.if.then.2:
  add s9, s11, t3                                                       # ir inst 40 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd t3, 16(sp)
  sd t4, 24(sp)
  sd t5, 32(sp)
  sd t6, 40(sp)
  mv a0, s9
  call .F.compute_complex_function
  mv s8, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld t3, 16(sp)
  ld t4, 24(sp)
  ld t5, 32(sp)
  ld t6, 40(sp)
# ir inst 41 fin
  add s9, s10, s8                                                       # ir inst 42 fin
# Phi connections
  mv s10, s9
  j .F.simulate_complex_memory_pattern._15.if.exit.2                    # ir inst 43 fin
.F.simulate_complex_memory_pattern._14.if.else.2:
# Phi connections
  j .F.simulate_complex_memory_pattern._15.if.exit.2                    # ir inst 44 fin
.F.simulate_complex_memory_pattern._15.if.exit.2:
  addi s9, t3, -4                                                       # ir inst 46 fin
# Phi connections
  mv t3, s9
  mv t4, s10
  j .F.simulate_complex_memory_pattern._11.while.cond.2                 # ir inst 47 fin
.F.simulate_complex_memory_pattern._16.while.exit.2:
# Phi connections
  j .F.simulate_complex_memory_pattern._17.if.exit.0                    # ir inst 48 fin
.F.simulate_complex_memory_pattern._17.if.exit.0:
  addi t3, t5, 1                                                        # ir inst 50 fin
# Phi connections
  mv t5, t3
  mv t6, t4
  j .F.simulate_complex_memory_pattern._1.while.cond.0                  # ir inst 51 fin
.F.simulate_complex_memory_pattern._18.while.exit.0:
  mv a0, t6
  j .F.simulate_complex_memory_pattern.epilogue                         # ir inst 52 fin
.F.simulate_complex_memory_pattern.epilogue:
  ld ra, 88(sp)
  ld s7, 48(sp)
  ld s11, 56(sp)
  ld s8, 64(sp)
  ld s10, 72(sp)
  ld s9, 80(sp)
  addi sp, sp, 96
  ret

.globl .F.compute_checksum
.F.compute_checksum:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.compute_checksum._0.entry.0:
  slli t6, a0, 13                                                       # ir inst 1 fin
  xor t5, a0, t6                                                        # ir inst 2 fin
  srai t6, t5, 17                                                       # ir inst 3 fin
  xor t4, t5, t6                                                        # ir inst 4 fin
  slli t6, t4, 5                                                        # ir inst 5 fin
  xor t5, t4, t6                                                        # ir inst 6 fin
  li t2, 1000
  rem t6, t5, t2                                                        # ir inst 7 fin
  mv a0, t6
  j .F.compute_checksum.epilogue                                        # ir inst 8 fin
.F.compute_checksum.epilogue:
  ret

.globl .F.compute_complex_function
.F.compute_complex_function:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.compute_complex_function._0.entry.0:
# Phi connections
  mv t5, a0
  li t6, 0
  j .F.compute_complex_function._1.while.cond.0                         # ir inst 1 fin
.F.compute_complex_function._1.while.cond.0:
  li t2, 10
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.compute_complex_function._2.while.body.0
  j .F.compute_complex_function._3.while.exit.0                         # ir inst 5 fin
.F.compute_complex_function._2.while.body.0:
  li t2, 17
  mul t4, t5, t2                                                        # ir inst 6 fin
  addi t3, t4, 31                                                       # ir inst 7 fin
  li t2, 65537
  rem t4, t3, t2                                                        # ir inst 8 fin
  srai t3, t4, 8                                                        # ir inst 9 fin
  xor s11, t4, t3                                                       # ir inst 10 fin
  addi t4, t6, 1                                                        # ir inst 11 fin
# Phi connections
  mv t5, s11
  mv t6, t4
  j .F.compute_complex_function._1.while.cond.0                         # ir inst 12 fin
.F.compute_complex_function._3.while.exit.0:
  li t2, 100
  rem t6, t5, t2                                                        # ir inst 13 fin
  mv a0, t6
  j .F.compute_complex_function.epilogue                                # ir inst 14 fin
.F.compute_complex_function.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.run_garbage_collection
.F.run_garbage_collection:
# spill func args num: 0,             range:     4176(sp) -     4176(sp)
# local var size: 4096,               range:       72(sp) -     4168(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 3 / 12,        range:       40(sp) -       64(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -4176
  add sp, sp, t0
  sd s9, 40(sp)
  sd s11, 48(sp)
  sd s10, 56(sp)
  sd ra, 64(sp)
.F.run_garbage_collection._0.entry.0:
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.run_garbage_collection._1.array.cond.0                           # ir inst 3 fin
.F.run_garbage_collection._1.array.cond.0:
  li t2, 4096
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.run_garbage_collection._2.array.body.0
  j .F.run_garbage_collection._3.array.exit.0                           # ir inst 6 fin
.F.run_garbage_collection._2.array.body.0:
  add t4, t6, t5                                                        # ir inst 7 fin
  li t1, 0
  sb t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.run_garbage_collection._1.array.cond.0                           # ir inst 10 fin
.F.run_garbage_collection._3.array.exit.0:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a4, 24(sp)
  mv a1, a4
  mv a0, a2
  addi t1, sp, 72
  mv a2, t1
  call .F.mark_reachable_blocks
  mv t6, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a4, 24(sp)
# ir inst 11 fin
# Phi connections
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.run_garbage_collection._4.while.cond.0                           # ir inst 12 fin
.F.run_garbage_collection._4.while.cond.0:
  slt t3, t4, a4                                                        # ir inst 16 fin
  bnez t3, .F.run_garbage_collection._5.while.body.0
  j .F.run_garbage_collection._9.while.exit.0                           # ir inst 17 fin
.F.run_garbage_collection._5.while.body.0:
  mv t3, t4                                                             # ir inst 18 fin
  addi t1, sp, 72
  add s11, t1, t3                                                       # ir inst 19 fin
  lb t3, 0(s11)                                                         # ir inst 20 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 21 fin
  bnez s11, .F.run_garbage_collection._6.if.then.0
  j .F.run_garbage_collection._7.if.else.0                              # ir inst 22 fin
.F.run_garbage_collection._6.if.then.0:
  mv t3, t4                                                             # ir inst 23 fin
  slli s11, t3, 1                                                       # ir inst 24 fin
  slli t2, s11, 2
  add t3, a2, t2                                                        # ir inst 25 fin
  lw s11, 0(t3)                                                         # ir inst 26 fin
  mv t3, t4                                                             # ir inst 27 fin
  slli s10, t3, 1                                                       # ir inst 28 fin
  addi t3, s10, 1                                                       # ir inst 29 fin
  slli t2, t3, 2
  add s10, a2, t2                                                       # ir inst 30 fin
  lw t3, 0(s10)                                                         # ir inst 31 fin
  mv s10, a3                                                            # ir inst 32 fin
  slli s9, s10, 1                                                       # ir inst 33 fin
  slli t2, s9, 2
  add s10, a1, t2                                                       # ir inst 34 fin
  sw s11, 0(s10)                                                        # ir inst 35 fin
  mv s11, a3                                                            # ir inst 36 fin
  slli s10, s11, 1                                                      # ir inst 37 fin
  addi s11, s10, 1                                                      # ir inst 38 fin
  slli t2, s11, 2
  add s10, a1, t2                                                       # ir inst 39 fin
  sw t3, 0(s10)                                                         # ir inst 40 fin
  add s11, t6, t3                                                       # ir inst 41 fin
  addi t3, t5, 1                                                        # ir inst 42 fin
# Phi connections
  mv t0, s11
  mv s11, t3
  mv t3, t0
  j .F.run_garbage_collection._8.if.exit.0                              # ir inst 43 fin
.F.run_garbage_collection._7.if.else.0:
# Phi connections
  mv s11, t5
  mv t3, t6
  j .F.run_garbage_collection._8.if.exit.0                              # ir inst 44 fin
.F.run_garbage_collection._8.if.exit.0:
  addi s10, t4, 1                                                       # ir inst 47 fin
# Phi connections
  mv t4, s10
  mv t5, s11
  mv t6, t3
  j .F.run_garbage_collection._4.while.cond.0                           # ir inst 48 fin
.F.run_garbage_collection._9.while.exit.0:
  add t4, a3, t5                                                        # ir inst 49 fin
# Start call preparation
  sd a1, 0(sp)
  sd t4, 8(sp)
  sd t6, 16(sp)
  mv a0, a1
  mv a1, t4
  call .F.coalesce_free_blocks
  mv t5, a0
  ld a1, 0(sp)
  ld t4, 8(sp)
  ld t6, 16(sp)
# ir inst 50 fin
  add t4, t6, t5                                                        # ir inst 51 fin
  mv a0, t4
  j .F.run_garbage_collection.epilogue                                  # ir inst 52 fin
.F.run_garbage_collection.epilogue:
  ld ra, 64(sp)
  ld s9, 40(sp)
  ld s11, 48(sp)
  ld s10, 56(sp)
  li t0, 4176
  add sp, sp, t0
  ret

.globl .F.mark_reachable_blocks
.F.mark_reachable_blocks:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       72(sp) -       72(sp)
# return addr size: 8,                range:       64(sp) -       72(sp)
# callee save reg num: 1 / 12,        range:       56(sp) -       64(sp)
# max caller save reg num: 7 / 12,    range:        0(sp) -       56(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 56(sp)
  sd ra, 64(sp)
.F.mark_reachable_blocks._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.mark_reachable_blocks._1.while.cond.0                            # ir inst 1 fin
.F.mark_reachable_blocks._1.while.cond.0:
  slt t4, t6, a1                                                        # ir inst 4 fin
  bnez t4, .F.mark_reachable_blocks._2.while.body.0
  j .F.mark_reachable_blocks._6.while.exit.0                            # ir inst 5 fin
.F.mark_reachable_blocks._2.while.body.0:
  mv t4, t6                                                             # ir inst 6 fin
  slli t3, t4, 1                                                        # ir inst 7 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 8 fin
  lw t3, 0(t4)                                                          # ir inst 9 fin
  mv t4, t6                                                             # ir inst 10 fin
  slli s11, t4, 1                                                       # ir inst 11 fin
  addi t4, s11, 1                                                       # ir inst 12 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 13 fin
  lw t4, 0(s11)                                                         # ir inst 14 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd t3, 24(sp)
  sd t4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  mv a2, t6
  mv a1, t4
  mv a0, t3
  call .F.compute_reachability_score
  mv s11, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld t3, 24(sp)
  ld t4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 15 fin
  li t2, 50
  slt t4, t2, s11                                                       # ir inst 16 fin
  bnez t4, .F.mark_reachable_blocks._3.if.then.0
  j .F.mark_reachable_blocks._4.if.else.0                               # ir inst 17 fin
.F.mark_reachable_blocks._3.if.then.0:
  mv t4, t6                                                             # ir inst 18 fin
  add t3, a2, t4                                                        # ir inst 19 fin
  li t1, 1
  sb t1, 0(t3)                                                          # ir inst 20 fin
  addi t4, t5, 1                                                        # ir inst 21 fin
# Phi connections
  j .F.mark_reachable_blocks._5.if.exit.0                               # ir inst 22 fin
.F.mark_reachable_blocks._4.if.else.0:
# Phi connections
  mv t4, t5
  j .F.mark_reachable_blocks._5.if.exit.0                               # ir inst 23 fin
.F.mark_reachable_blocks._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 25 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.mark_reachable_blocks._1.while.cond.0                            # ir inst 26 fin
.F.mark_reachable_blocks._6.while.exit.0:
  mv a0, t5
  j .F.mark_reachable_blocks.epilogue                                   # ir inst 27 fin
.F.mark_reachable_blocks.epilogue:
  ld ra, 64(sp)
  ld s11, 56(sp)
  addi sp, sp, 80
  ret

.globl .F.compute_reachability_score
.F.compute_reachability_score:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.compute_reachability_score._0.entry.0:
  li t1, 100
  sub t6, t1, a2                                                        # ir inst 1 fin
  li t2, 64
  slt t0, a1, t2
  xori t5, t0, 1                                                        # ir inst 2 fin
  bnez t5, .F.compute_reachability_score._1.lazy.then.0
  j .F.compute_reachability_score._2.lazy.else.0                        # ir inst 3 fin
.F.compute_reachability_score._1.lazy.then.0:
  li t2, 4096
  slt t0, t2, a1
  xori t5, t0, 1                                                        # ir inst 4 fin
# Phi connections
  j .F.compute_reachability_score._3.lazy.exit.0                        # ir inst 5 fin
.F.compute_reachability_score._2.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.compute_reachability_score._3.lazy.exit.0                        # ir inst 6 fin
.F.compute_reachability_score._3.lazy.exit.0:
  bnez t5, .F.compute_reachability_score._4.if.then.0
  j .F.compute_reachability_score._5.if.else.0                          # ir inst 8 fin
.F.compute_reachability_score._4.if.then.0:
  addi t5, t6, 30                                                       # ir inst 9 fin
# Phi connections
  mv t6, t5
  j .F.compute_reachability_score._6.if.exit.0                          # ir inst 10 fin
.F.compute_reachability_score._5.if.else.0:
# Phi connections
  j .F.compute_reachability_score._6.if.exit.0                          # ir inst 11 fin
.F.compute_reachability_score._6.if.exit.0:
  li t2, 4096
  rem t5, a0, t2                                                        # ir inst 13 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 14 fin
  bnez t4, .F.compute_reachability_score._7.if.then.1
  j .F.compute_reachability_score._8.if.else.1                          # ir inst 15 fin
.F.compute_reachability_score._7.if.then.1:
  addi t5, t6, 20                                                       # ir inst 16 fin
# Phi connections
  mv t6, t5
  j .F.compute_reachability_score._9.if.exit.1                          # ir inst 17 fin
.F.compute_reachability_score._8.if.else.1:
# Phi connections
  j .F.compute_reachability_score._9.if.exit.1                          # ir inst 18 fin
.F.compute_reachability_score._9.if.exit.1:
  add t5, a0, a1                                                        # ir inst 20 fin
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t5
  call .F.hash_function
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 21 fin
  li t2, 40
  rem t5, t4, t2                                                        # ir inst 22 fin
  add t4, t6, t5                                                        # ir inst 23 fin
  mv a0, t4
  j .F.compute_reachability_score.epilogue                              # ir inst 24 fin
.F.compute_reachability_score.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.coalesce_free_blocks
.F.coalesce_free_blocks:
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
.F.coalesce_free_blocks._0.entry.0:
# Phi connections
  li t6, 0
  j .F.coalesce_free_blocks._1.while.cond.0                             # ir inst 1 fin
.F.coalesce_free_blocks._1.while.cond.0:
  addi t5, a1, -1                                                       # ir inst 3 fin
  slt t4, t6, t5                                                        # ir inst 4 fin
  bnez t4, .F.coalesce_free_blocks._2.while.body.0
  j .F.coalesce_free_blocks._9.while.exit.0                             # ir inst 5 fin
.F.coalesce_free_blocks._2.while.body.0:
# Phi connections
  li t5, 0
  j .F.coalesce_free_blocks._3.while.cond.1                             # ir inst 6 fin
.F.coalesce_free_blocks._3.while.cond.1:
  addi t4, a1, -1                                                       # ir inst 8 fin
  sub t3, t4, t6                                                        # ir inst 9 fin
  slt t4, t5, t3                                                        # ir inst 10 fin
  bnez t4, .F.coalesce_free_blocks._4.while.body.1
  j .F.coalesce_free_blocks._8.while.exit.1                             # ir inst 11 fin
.F.coalesce_free_blocks._4.while.body.1:
  mv t4, t5                                                             # ir inst 12 fin
  slli t3, t4, 1                                                        # ir inst 13 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 14 fin
  lw t3, 0(t4)                                                          # ir inst 15 fin
  mv t4, t5                                                             # ir inst 16 fin
  addi s11, t4, 1                                                       # ir inst 17 fin
  slli t4, s11, 1                                                       # ir inst 18 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 19 fin
  lw t4, 0(s11)                                                         # ir inst 20 fin
  slt s11, t4, t3                                                       # ir inst 21 fin
  bnez s11, .F.coalesce_free_blocks._5.if.then.0
  j .F.coalesce_free_blocks._6.if.else.0                                # ir inst 22 fin
.F.coalesce_free_blocks._5.if.then.0:
  mv t4, t5                                                             # ir inst 23 fin
  slli t3, t4, 1                                                        # ir inst 24 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 25 fin
  lw t3, 0(t4)                                                          # ir inst 26 fin
  mv t4, t5                                                             # ir inst 27 fin
  slli s11, t4, 1                                                       # ir inst 28 fin
  addi t4, s11, 1                                                       # ir inst 29 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  lw t4, 0(s11)                                                         # ir inst 31 fin
  mv s11, t5                                                            # ir inst 32 fin
  slli s10, s11, 1                                                      # ir inst 33 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 34 fin
  mv s10, t5                                                            # ir inst 35 fin
  addi s9, s10, 1                                                       # ir inst 36 fin
  slli s10, s9, 1                                                       # ir inst 37 fin
  slli t2, s10, 2
  add s9, a0, t2                                                        # ir inst 38 fin
  lw s10, 0(s9)                                                         # ir inst 39 fin
  sw s10, 0(s11)                                                        # ir inst 40 fin
  mv s11, t5                                                            # ir inst 41 fin
  slli s10, s11, 1                                                      # ir inst 42 fin
  addi s11, s10, 1                                                      # ir inst 43 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 44 fin
  mv s11, t5                                                            # ir inst 45 fin
  addi s9, s11, 1                                                       # ir inst 46 fin
  slli s11, s9, 1                                                       # ir inst 47 fin
  addi s9, s11, 1                                                       # ir inst 48 fin
  slli t2, s9, 2
  add s11, a0, t2                                                       # ir inst 49 fin
  lw s9, 0(s11)                                                         # ir inst 50 fin
  sw s9, 0(s10)                                                         # ir inst 51 fin
  mv s11, t5                                                            # ir inst 52 fin
  addi s10, s11, 1                                                      # ir inst 53 fin
  slli s11, s10, 1                                                      # ir inst 54 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 55 fin
  sw t3, 0(s10)                                                         # ir inst 56 fin
  mv t3, t5                                                             # ir inst 57 fin
  addi s11, t3, 1                                                       # ir inst 58 fin
  slli t3, s11, 1                                                       # ir inst 59 fin
  addi s11, t3, 1                                                       # ir inst 60 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 61 fin
  sw t4, 0(t3)                                                          # ir inst 62 fin
  j .F.coalesce_free_blocks._7.if.exit.0                                # ir inst 63 fin
.F.coalesce_free_blocks._6.if.else.0:
  j .F.coalesce_free_blocks._7.if.exit.0                                # ir inst 64 fin
.F.coalesce_free_blocks._7.if.exit.0:
  addi t4, t5, 1                                                        # ir inst 65 fin
# Phi connections
  mv t5, t4
  j .F.coalesce_free_blocks._3.while.cond.1                             # ir inst 66 fin
.F.coalesce_free_blocks._8.while.exit.1:
  addi t5, t6, 1                                                        # ir inst 67 fin
# Phi connections
  mv t6, t5
  j .F.coalesce_free_blocks._1.while.cond.0                             # ir inst 68 fin
.F.coalesce_free_blocks._9.while.exit.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.coalesce_free_blocks._10.while.cond.2                            # ir inst 69 fin
.F.coalesce_free_blocks._10.while.cond.2:
  addi t4, a1, -1                                                       # ir inst 72 fin
  slt t3, t5, t4                                                        # ir inst 73 fin
  bnez t3, .F.coalesce_free_blocks._11.while.body.2
  j .F.coalesce_free_blocks._18.while.exit.2                            # ir inst 74 fin
.F.coalesce_free_blocks._11.while.body.2:
  mv t4, t5                                                             # ir inst 75 fin
  slli t3, t4, 1                                                        # ir inst 76 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 77 fin
  lw t3, 0(t4)                                                          # ir inst 78 fin
  mv t4, t5                                                             # ir inst 79 fin
  slli s11, t4, 1                                                       # ir inst 80 fin
  addi t4, s11, 1                                                       # ir inst 81 fin
  slli t2, t4, 2
  add s11, a0, t2                                                       # ir inst 82 fin
  lw t4, 0(s11)                                                         # ir inst 83 fin
  mv s11, t5                                                            # ir inst 84 fin
  addi s10, s11, 1                                                      # ir inst 85 fin
  slli s11, s10, 1                                                      # ir inst 86 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 87 fin
  lw s11, 0(s10)                                                        # ir inst 88 fin
  add s10, t3, t4                                                       # ir inst 89 fin
  xor t0, s10, s11
  sltiu t3, t0, 1                                                       # ir inst 90 fin
  bnez t3, .F.coalesce_free_blocks._12.if.then.1
  j .F.coalesce_free_blocks._16.if.else.1                               # ir inst 91 fin
.F.coalesce_free_blocks._12.if.then.1:
  mv t3, t5                                                             # ir inst 92 fin
  slli s11, t3, 1                                                       # ir inst 93 fin
  addi t3, s11, 1                                                       # ir inst 94 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 95 fin
  mv t3, t5                                                             # ir inst 96 fin
  addi s10, t3, 1                                                       # ir inst 97 fin
  slli t3, s10, 1                                                       # ir inst 98 fin
  addi s10, t3, 1                                                       # ir inst 99 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 100 fin
  lw s10, 0(t3)                                                         # ir inst 101 fin
  add t3, t4, s10                                                       # ir inst 102 fin
  sw t3, 0(s11)                                                         # ir inst 103 fin
  addi t4, t5, 1                                                        # ir inst 104 fin
# Phi connections
  j .F.coalesce_free_blocks._13.while.cond.3                            # ir inst 105 fin
.F.coalesce_free_blocks._13.while.cond.3:
  addi t3, a1, -1                                                       # ir inst 107 fin
  slt s11, t4, t3                                                       # ir inst 108 fin
  bnez s11, .F.coalesce_free_blocks._14.while.body.3
  j .F.coalesce_free_blocks._15.while.exit.3                            # ir inst 109 fin
.F.coalesce_free_blocks._14.while.body.3:
  mv t3, t4                                                             # ir inst 110 fin
  slli s11, t3, 1                                                       # ir inst 111 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 112 fin
  mv s11, t4                                                            # ir inst 113 fin
  addi s10, s11, 1                                                      # ir inst 114 fin
  slli s11, s10, 1                                                      # ir inst 115 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 116 fin
  lw s11, 0(s10)                                                        # ir inst 117 fin
  sw s11, 0(t3)                                                         # ir inst 118 fin
  mv t3, t4                                                             # ir inst 119 fin
  slli s11, t3, 1                                                       # ir inst 120 fin
  addi t3, s11, 1                                                       # ir inst 121 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 122 fin
  mv t3, t4                                                             # ir inst 123 fin
  addi s10, t3, 1                                                       # ir inst 124 fin
  slli t3, s10, 1                                                       # ir inst 125 fin
  addi s10, t3, 1                                                       # ir inst 126 fin
  slli t2, s10, 2
  add t3, a0, t2                                                        # ir inst 127 fin
  lw s10, 0(t3)                                                         # ir inst 128 fin
  sw s10, 0(s11)                                                        # ir inst 129 fin
  addi t3, t4, 1                                                        # ir inst 130 fin
# Phi connections
  mv t4, t3
  j .F.coalesce_free_blocks._13.while.cond.3                            # ir inst 131 fin
.F.coalesce_free_blocks._15.while.exit.3:
  addi t4, t6, 1                                                        # ir inst 132 fin
# Phi connections
  mv t0, t4
  mv t4, t5
  mv t5, t0
  j .F.coalesce_free_blocks._17.if.exit.1                               # ir inst 133 fin
.F.coalesce_free_blocks._16.if.else.1:
  addi t4, t5, 1                                                        # ir inst 134 fin
# Phi connections
  mv t5, t6
  j .F.coalesce_free_blocks._17.if.exit.1                               # ir inst 135 fin
.F.coalesce_free_blocks._17.if.exit.1:
# Phi connections
  mv t6, t5
  mv t5, t4
  j .F.coalesce_free_blocks._10.while.cond.2                            # ir inst 138 fin
.F.coalesce_free_blocks._18.while.exit.2:
  mv a0, t6
  j .F.coalesce_free_blocks.epilogue                                    # ir inst 139 fin
.F.coalesce_free_blocks.epilogue:
  ld s9, 0(sp)
  ld s11, 8(sp)
  ld s10, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.free_random_block
.F.free_random_block:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       56(sp) -       56(sp)
# return addr size: 8,                range:       48(sp) -       56(sp)
# callee save reg num: 1 / 12,        range:       40(sp) -       48(sp)
# max caller save reg num: 5 / 12,    range:        0(sp) -       40(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s11, 40(sp)
  sd ra, 48(sp)
.F.free_random_block._0.entry.0:
  li t2, 0
  xor t0, a4, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.free_random_block._1.if.then.0
  j .F.free_random_block._2.if.else.0                                   # ir inst 2 fin
.F.free_random_block._1.if.then.0:
  li a0, 0
  j .F.free_random_block.epilogue                                       # ir inst 3 fin
.F.free_random_block._2.if.else.0:
  j .F.free_random_block._3.if.exit.0                                   # ir inst 4 fin
.F.free_random_block._3.if.exit.0:
# Start call preparation
  sd a1, 0(sp)
  sd a2, 8(sp)
  sd a3, 16(sp)
  sd a4, 24(sp)
  mv a0, a4
  call .F.hash_function
  mv t6, a0
  ld a1, 0(sp)
  ld a2, 8(sp)
  ld a3, 16(sp)
  ld a4, 24(sp)
# ir inst 5 fin
  rem t5, t6, a4                                                        # ir inst 6 fin
  mv t6, t5                                                             # ir inst 7 fin
  slli t4, t6, 1                                                        # ir inst 8 fin
  slli t2, t4, 2
  add t6, a2, t2                                                        # ir inst 9 fin
  lw t4, 0(t6)                                                          # ir inst 10 fin
  mv t6, t5                                                             # ir inst 11 fin
  slli t3, t6, 1                                                        # ir inst 12 fin
  addi t6, t3, 1                                                        # ir inst 13 fin
  slli t2, t6, 2
  add t3, a2, t2                                                        # ir inst 14 fin
  lw t6, 0(t3)                                                          # ir inst 15 fin
  mv t3, a3                                                             # ir inst 16 fin
  slli s11, t3, 1                                                       # ir inst 17 fin
  slli t2, s11, 2
  add t3, a1, t2                                                        # ir inst 18 fin
  sw t4, 0(t3)                                                          # ir inst 19 fin
  mv t4, a3                                                             # ir inst 20 fin
  slli t3, t4, 1                                                        # ir inst 21 fin
  addi t4, t3, 1                                                        # ir inst 22 fin
  slli t2, t4, 2
  add t3, a1, t2                                                        # ir inst 23 fin
  sw t6, 0(t3)                                                          # ir inst 24 fin
# Phi connections
  mv t6, t5
  j .F.free_random_block._4.while.cond.0                                # ir inst 25 fin
.F.free_random_block._4.while.cond.0:
  addi t5, a4, -1                                                       # ir inst 27 fin
  slt t4, t6, t5                                                        # ir inst 28 fin
  bnez t4, .F.free_random_block._5.while.body.0
  j .F.free_random_block._6.while.exit.0                                # ir inst 29 fin
.F.free_random_block._5.while.body.0:
  mv t5, t6                                                             # ir inst 30 fin
  slli t4, t5, 1                                                        # ir inst 31 fin
  slli t2, t4, 2
  add t5, a2, t2                                                        # ir inst 32 fin
  mv t4, t6                                                             # ir inst 33 fin
  addi t3, t4, 1                                                        # ir inst 34 fin
  slli t4, t3, 1                                                        # ir inst 35 fin
  slli t2, t4, 2
  add t3, a2, t2                                                        # ir inst 36 fin
  lw t4, 0(t3)                                                          # ir inst 37 fin
  sw t4, 0(t5)                                                          # ir inst 38 fin
  mv t5, t6                                                             # ir inst 39 fin
  slli t4, t5, 1                                                        # ir inst 40 fin
  addi t5, t4, 1                                                        # ir inst 41 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 42 fin
  mv t5, t6                                                             # ir inst 43 fin
  addi t3, t5, 1                                                        # ir inst 44 fin
  slli t5, t3, 1                                                        # ir inst 45 fin
  addi t3, t5, 1                                                        # ir inst 46 fin
  slli t2, t3, 2
  add t5, a2, t2                                                        # ir inst 47 fin
  lw t3, 0(t5)                                                          # ir inst 48 fin
  sw t3, 0(t4)                                                          # ir inst 49 fin
  addi t5, t6, 1                                                        # ir inst 50 fin
# Phi connections
  mv t6, t5
  j .F.free_random_block._4.while.cond.0                                # ir inst 51 fin
.F.free_random_block._6.while.exit.0:
  li a0, 1
  j .F.free_random_block.epilogue                                       # ir inst 52 fin
.F.free_random_block.epilogue:
  ld ra, 48(sp)
  ld s11, 40(sp)
  addi sp, sp, 64
  ret

.globl .F.run_hash_table_tests
.F.run_hash_table_tests:
# spill func args num: 0,             range:    16480(sp) -    16480(sp)
# local var size: 16384,              range:       96(sp) -    16480(sp)
# return addr size: 8,                range:       88(sp) -       96(sp)
# callee save reg num: 7 / 12,        range:       32(sp) -       88(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -16480
  add sp, sp, t0
  sd s10, 32(sp)
  sd s11, 40(sp)
  sd s9, 48(sp)
  sd s8, 56(sp)
  sd s7, 64(sp)
  sd s6, 72(sp)
  sd s5, 80(sp)
  sd ra, 88(sp)
.F.run_hash_table_tests._0.entry.0:
# Start call preparation
  call .F.get_hash_table_size
  mv t6, a0
# ir inst 1 fin
  addi t1, sp, 96
  addi t5, t1, 0                                                        # ir inst 3 fin
# Phi connections
  li t4, 0
  j .F.run_hash_table_tests._1.array.cond.0                             # ir inst 4 fin
.F.run_hash_table_tests._1.array.cond.0:
  li t2, 2048
  slt t3, t4, t2                                                        # ir inst 6 fin
  bnez t3, .F.run_hash_table_tests._2.array.body.0
  j .F.run_hash_table_tests._3.array.exit.0                             # ir inst 7 fin
.F.run_hash_table_tests._2.array.body.0:
  slli t2, t4, 2
  add t3, t5, t2                                                        # ir inst 8 fin
  li t1, 0
  sw t1, 0(t3)                                                          # ir inst 9 fin
  addi t3, t4, 1                                                        # ir inst 10 fin
# Phi connections
  mv t4, t3
  j .F.run_hash_table_tests._1.array.cond.0                             # ir inst 11 fin
.F.run_hash_table_tests._3.array.exit.0:
  li t1, 8288
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 13 fin
# Phi connections
  li t4, 0
  j .F.run_hash_table_tests._4.array.cond.1                             # ir inst 14 fin
.F.run_hash_table_tests._4.array.cond.1:
  li t2, 4096
  slt t3, t4, t2                                                        # ir inst 16 fin
  bnez t3, .F.run_hash_table_tests._5.array.body.1
  j .F.run_hash_table_tests._6.array.exit.1                             # ir inst 17 fin
.F.run_hash_table_tests._5.array.body.1:
  add t3, t5, t4                                                        # ir inst 18 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 19 fin
  addi t3, t4, 1                                                        # ir inst 20 fin
# Phi connections
  mv t4, t3
  j .F.run_hash_table_tests._4.array.cond.1                             # ir inst 21 fin
.F.run_hash_table_tests._6.array.exit.1:
  li t1, 12384
  add t1, sp, t1
  addi t5, t1, 0                                                        # ir inst 23 fin
# Phi connections
  li t4, 0
  j .F.run_hash_table_tests._7.array.cond.2                             # ir inst 24 fin
.F.run_hash_table_tests._7.array.cond.2:
  li t2, 4096
  slt t3, t4, t2                                                        # ir inst 26 fin
  bnez t3, .F.run_hash_table_tests._8.array.body.2
  j .F.run_hash_table_tests._9.array.exit.2                             # ir inst 27 fin
.F.run_hash_table_tests._8.array.body.2:
  add t3, t5, t4                                                        # ir inst 28 fin
  li t1, 0
  sb t1, 0(t3)                                                          # ir inst 29 fin
  addi t3, t4, 1                                                        # ir inst 30 fin
# Phi connections
  mv t4, t3
  j .F.run_hash_table_tests._7.array.cond.2                             # ir inst 31 fin
.F.run_hash_table_tests._9.array.exit.2:
# Phi connections
  li s10, 0
  li s11, 0
  li t3, 0
  li t4, 0
  li t5, 0
  j .F.run_hash_table_tests._10.while.cond.0                            # ir inst 32 fin
.F.run_hash_table_tests._10.while.cond.0:
  li t2, 8000
  slt s9, t5, t2                                                        # ir inst 38 fin
  bnez s9, .F.run_hash_table_tests._11.while.body.0
  j .F.run_hash_table_tests._33.while.exit.0                            # ir inst 39 fin
.F.run_hash_table_tests._11.while.body.0:
  li t2, 4
  rem s9, t5, t2                                                        # ir inst 40 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t5
  call .F.generate_hash_key
  mv s8, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 41 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t5
  call .F.generate_hash_value
  mv s7, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 42 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s6, t0, 1                                                       # ir inst 43 fin
  bnez s6, .F.run_hash_table_tests._12.lazy.then.0
  j .F.run_hash_table_tests._13.lazy.else.0                             # ir inst 44 fin
.F.run_hash_table_tests._12.lazy.then.0:
# Phi connections
  li s6, 1
  j .F.run_hash_table_tests._14.lazy.exit.0                             # ir inst 45 fin
.F.run_hash_table_tests._13.lazy.else.0:
  li t2, 1
  xor t0, s9, t2
  sltiu s6, t0, 1                                                       # ir inst 46 fin
# Phi connections
  j .F.run_hash_table_tests._14.lazy.exit.0                             # ir inst 47 fin
.F.run_hash_table_tests._14.lazy.exit.0:
  bnez s6, .F.run_hash_table_tests._15.if.then.0
  j .F.run_hash_table_tests._22.if.else.0                               # ir inst 49 fin
.F.run_hash_table_tests._15.if.then.0:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a5, s7
  mv a4, s8
  mv a3, t6
  li t1, 12384
  add t1, sp, t1
  mv a2, t1
  li t1, 8288
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call .F.hash_table_insert
  mv s6, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 50 fin
  li t2, 0
  slt t0, s6, t2
  xori s7, t0, 1                                                        # ir inst 51 fin
  bnez s7, .F.run_hash_table_tests._16.if.then.1
  j .F.run_hash_table_tests._20.if.else.1                               # ir inst 52 fin
.F.run_hash_table_tests._16.if.then.1:
  addi s7, s11, 1                                                       # ir inst 53 fin
  li t2, 0
  slt s5, t2, s6                                                        # ir inst 54 fin
  bnez s5, .F.run_hash_table_tests._17.if.then.2
  j .F.run_hash_table_tests._18.if.else.2                               # ir inst 55 fin
.F.run_hash_table_tests._17.if.then.2:
  add s5, t4, s6                                                        # ir inst 56 fin
# Phi connections
  mv s6, s5
  j .F.run_hash_table_tests._19.if.exit.2                               # ir inst 57 fin
.F.run_hash_table_tests._18.if.else.2:
# Phi connections
  mv s6, t4
  j .F.run_hash_table_tests._19.if.exit.2                               # ir inst 58 fin
.F.run_hash_table_tests._19.if.exit.2:
# Phi connections
  mv t0, s6
  mv s6, s7
  mv s7, t0
  j .F.run_hash_table_tests._21.if.exit.1                               # ir inst 60 fin
.F.run_hash_table_tests._20.if.else.1:
# Phi connections
  mv s6, s11
  mv s7, t4
  j .F.run_hash_table_tests._21.if.exit.1                               # ir inst 61 fin
.F.run_hash_table_tests._21.if.exit.1:
# Phi connections
  mv s8, t3
  mv s9, s7
  mv s7, s6
  mv s6, s10
  j .F.run_hash_table_tests._32.if.exit.0                               # ir inst 64 fin
.F.run_hash_table_tests._22.if.else.0:
  li t2, 2
  xor t0, s9, t2
  sltiu s7, t0, 1                                                       # ir inst 65 fin
  bnez s7, .F.run_hash_table_tests._23.if.then.3
  j .F.run_hash_table_tests._27.if.else.3                               # ir inst 66 fin
.F.run_hash_table_tests._23.if.then.3:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a4, s8
  mv a3, t6
  li t1, 12384
  add t1, sp, t1
  mv a2, t1
  li t1, 8288
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call .F.hash_table_lookup
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 67 fin
  li t2, 0
  slt t0, s9, t2
  xori s7, t0, 1                                                        # ir inst 68 fin
  bnez s7, .F.run_hash_table_tests._24.if.then.4
  j .F.run_hash_table_tests._25.if.else.4                               # ir inst 69 fin
.F.run_hash_table_tests._24.if.then.4:
  addi s9, s10, 1                                                       # ir inst 70 fin
# Phi connections
  j .F.run_hash_table_tests._26.if.exit.4                               # ir inst 71 fin
.F.run_hash_table_tests._25.if.else.4:
# Phi connections
  mv s9, s10
  j .F.run_hash_table_tests._26.if.exit.4                               # ir inst 72 fin
.F.run_hash_table_tests._26.if.exit.4:
# Phi connections
  mv s8, s9
  mv s9, t3
  j .F.run_hash_table_tests._31.if.exit.3                               # ir inst 74 fin
.F.run_hash_table_tests._27.if.else.3:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a4, s8
  mv a3, t6
  li t1, 12384
  add t1, sp, t1
  mv a2, t1
  li t1, 8288
  add t1, sp, t1
  mv a1, t1
  addi t1, sp, 96
  mv a0, t1
  call .F.hash_table_delete
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 75 fin
  li t2, 0
  slt s8, t2, s9                                                        # ir inst 76 fin
  bnez s8, .F.run_hash_table_tests._28.if.then.5
  j .F.run_hash_table_tests._29.if.else.5                               # ir inst 77 fin
.F.run_hash_table_tests._28.if.then.5:
  addi s9, t3, 1                                                        # ir inst 78 fin
# Phi connections
  j .F.run_hash_table_tests._30.if.exit.5                               # ir inst 79 fin
.F.run_hash_table_tests._29.if.else.5:
# Phi connections
  mv s9, t3
  j .F.run_hash_table_tests._30.if.exit.5                               # ir inst 80 fin
.F.run_hash_table_tests._30.if.exit.5:
# Phi connections
  mv s8, s10
  j .F.run_hash_table_tests._31.if.exit.3                               # ir inst 82 fin
.F.run_hash_table_tests._31.if.exit.3:
# Phi connections
  mv s6, s8
  mv s7, s11
  mv s8, s9
  mv s9, t4
  j .F.run_hash_table_tests._32.if.exit.0                               # ir inst 85 fin
.F.run_hash_table_tests._32.if.exit.0:
  addi s5, t5, 1                                                        # ir inst 90 fin
# Phi connections
  mv s10, s6
  mv s11, s7
  mv t3, s8
  mv t4, s9
  mv t5, s5
  j .F.run_hash_table_tests._10.while.cond.0                            # ir inst 91 fin
.F.run_hash_table_tests._33.while.exit.0:
  add t6, s11, s10                                                      # ir inst 92 fin
  add t5, t6, t3                                                        # ir inst 93 fin
  li t2, 10
  div t6, t4, t2                                                        # ir inst 94 fin
  sub t4, t5, t6                                                        # ir inst 95 fin
  mv a0, t4
  j .F.run_hash_table_tests.epilogue                                    # ir inst 96 fin
.F.run_hash_table_tests.epilogue:
  ld ra, 88(sp)
  ld s10, 32(sp)
  ld s11, 40(sp)
  ld s9, 48(sp)
  ld s8, 56(sp)
  ld s7, 64(sp)
  ld s6, 72(sp)
  ld s5, 80(sp)
  li t0, 16480
  add sp, sp, t0
  ret

.globl .F.generate_hash_key
.F.generate_hash_key:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.generate_hash_key._0.entry.0:
  li t2, 6
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.generate_hash_key._1.if.then.0
  j .F.generate_hash_key._2.if.else.0                                   # ir inst 3 fin
.F.generate_hash_key._1.if.then.0:
  j .F.generate_hash_key.epilogue                                       # ir inst 4 fin
.F.generate_hash_key._2.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 5 fin
  bnez t5, .F.generate_hash_key._3.if.then.1
  j .F.generate_hash_key._4.if.else.1                                   # ir inst 6 fin
.F.generate_hash_key._3.if.then.1:
  li t2, 17
  mul t5, a0, t2                                                        # ir inst 7 fin
  addi t4, t5, 31                                                       # ir inst 8 fin
  mv a0, t4
  j .F.generate_hash_key.epilogue                                       # ir inst 9 fin
.F.generate_hash_key._4.if.else.1:
  li t2, 2
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 10 fin
  bnez t5, .F.generate_hash_key._5.if.then.2
  j .F.generate_hash_key._6.if.else.2                                   # ir inst 11 fin
.F.generate_hash_key._5.if.then.2:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.hash_function
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 12 fin
  mv a0, t5
  j .F.generate_hash_key.epilogue                                       # ir inst 13 fin
.F.generate_hash_key._6.if.else.2:
  li t2, 3
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 14 fin
  bnez t5, .F.generate_hash_key._7.if.then.3
  j .F.generate_hash_key._8.if.else.3                                   # ir inst 15 fin
.F.generate_hash_key._7.if.then.3:
  mul t5, a0, a0                                                        # ir inst 16 fin
  li t2, 65536
  rem t4, t5, t2                                                        # ir inst 17 fin
  mv a0, t4
  j .F.generate_hash_key.epilogue                                       # ir inst 18 fin
.F.generate_hash_key._8.if.else.3:
  li t2, 4
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 19 fin
  bnez t5, .F.generate_hash_key._9.if.then.4
  j .F.generate_hash_key._10.if.else.4                                  # ir inst 20 fin
.F.generate_hash_key._9.if.then.4:
  li t2, 20
  rem t6, a0, t2                                                        # ir inst 21 fin
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.fibonacci_number
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 22 fin
  mv a0, t5
  j .F.generate_hash_key.epilogue                                       # ir inst 23 fin
.F.generate_hash_key._10.if.else.4:
# Start call preparation
  sd a0, 0(sp)
  call .F.generate_clustered_key
  mv t6, a0
  ld a0, 0(sp)
# ir inst 24 fin
  mv a0, t6
  j .F.generate_hash_key.epilogue                                       # ir inst 25 fin
.F.generate_hash_key._11.if.exit.4:
  j .F.generate_hash_key._12.if.exit.3                                  # ir inst 26 fin
.F.generate_hash_key._12.if.exit.3:
  j .F.generate_hash_key._13.if.exit.2                                  # ir inst 27 fin
.F.generate_hash_key._13.if.exit.2:
  j .F.generate_hash_key._14.if.exit.1                                  # ir inst 28 fin
.F.generate_hash_key._14.if.exit.1:
  j .F.generate_hash_key._15.if.exit.0                                  # ir inst 29 fin
.F.generate_hash_key._15.if.exit.0:
.F.generate_hash_key.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.generate_hash_value
.F.generate_hash_value:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generate_hash_value._0.entry.0:
  li t2, 13
  mul t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 7                                                        # ir inst 2 fin
  li t2, 1000000
  rem t6, t5, t2                                                        # ir inst 3 fin
  mv a0, t6
  j .F.generate_hash_value.epilogue                                     # ir inst 4 fin
.F.generate_hash_value.epilogue:
  ret

.globl .F.generate_clustered_key
.F.generate_clustered_key:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.generate_clustered_key._0.entry.0:
  li t2, 100
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 100
  rem t5, a0, t2                                                        # ir inst 2 fin
  li t2, 10000
  mul t4, t6, t2                                                        # ir inst 3 fin
  add t6, t4, t5                                                        # ir inst 4 fin
  mv a0, t6
  j .F.generate_clustered_key.epilogue                                  # ir inst 5 fin
.F.generate_clustered_key.epilogue:
  ret

.globl .F.fibonacci_number
.F.fibonacci_number:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.fibonacci_number._0.entry.0:
  li t2, 1
  slt t0, t2, a0
  xori t6, t0, 1                                                        # ir inst 1 fin
  bnez t6, .F.fibonacci_number._1.if.then.0
  j .F.fibonacci_number._2.if.else.0                                    # ir inst 2 fin
.F.fibonacci_number._1.if.then.0:
  j .F.fibonacci_number.epilogue                                        # ir inst 3 fin
.F.fibonacci_number._2.if.else.0:
  j .F.fibonacci_number._3.if.exit.0                                    # ir inst 4 fin
.F.fibonacci_number._3.if.exit.0:
# Phi connections
  li t4, 0
  li t5, 1
  li t6, 2
  j .F.fibonacci_number._4.while.cond.0                                 # ir inst 5 fin
.F.fibonacci_number._4.while.cond.0:
  slt t0, a0, t6
  xori t3, t0, 1                                                        # ir inst 9 fin
  bnez t3, .F.fibonacci_number._5.while.body.0
  j .F.fibonacci_number._6.while.exit.0                                 # ir inst 10 fin
.F.fibonacci_number._5.while.body.0:
  add t3, t4, t5                                                        # ir inst 11 fin
  addi t4, t6, 1                                                        # ir inst 12 fin
# Phi connections
  mv t6, t4
  mv t4, t5
  mv t5, t3
  j .F.fibonacci_number._4.while.cond.0                                 # ir inst 13 fin
.F.fibonacci_number._6.while.exit.0:
  mv a0, t5
  j .F.fibonacci_number.epilogue                                        # ir inst 14 fin
.F.fibonacci_number.epilogue:
  ret

.globl .F.hash_table_insert
.F.hash_table_insert:
# spill func args num: 0,             range:       96(sp) -       96(sp)
# local var size: 0,                  range:       88(sp) -       88(sp)
# return addr size: 8,                range:       80(sp) -       88(sp)
# callee save reg num: 1 / 12,        range:       72(sp) -       80(sp)
# max caller save reg num: 9 / 12,    range:        0(sp) -       72(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -96
  sd s11, 72(sp)
  sd ra, 80(sp)
.F.hash_table_insert._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  mv a0, a4
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
# ir inst 1 fin
  rem t5, t6, a3                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.hash_table_insert._1.while.cond.0                                # ir inst 3 fin
.F.hash_table_insert._1.while.cond.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd t5, 48(sp)
  sd t6, 56(sp)
  call .F.get_max_probe_distance
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld t5, 48(sp)
  ld t6, 56(sp)
# ir inst 5 fin
  slt t3, t6, t4                                                        # ir inst 6 fin
  bnez t3, .F.hash_table_insert._2.while.body.0
  j .F.hash_table_insert._12.while.exit.0                               # ir inst 7 fin
.F.hash_table_insert._2.while.body.0:
  mul t4, t6, t6                                                        # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  rem t4, t3, a3                                                        # ir inst 10 fin
  mv t3, t4                                                             # ir inst 11 fin
  add s11, a1, t3                                                       # ir inst 12 fin
  lb t3, 0(s11)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.hash_table_insert._3.lazy.then.0
  j .F.hash_table_insert._4.lazy.else.0                                 # ir inst 15 fin
.F.hash_table_insert._3.lazy.then.0:
# Phi connections
  li t3, 1
  j .F.hash_table_insert._5.lazy.exit.0                                 # ir inst 16 fin
.F.hash_table_insert._4.lazy.else.0:
  mv t3, t4                                                             # ir inst 17 fin
  add s11, a2, t3                                                       # ir inst 18 fin
  lb t3, 0(s11)                                                         # ir inst 19 fin
# Phi connections
  j .F.hash_table_insert._5.lazy.exit.0                                 # ir inst 20 fin
.F.hash_table_insert._5.lazy.exit.0:
  bnez t3, .F.hash_table_insert._6.if.then.0
  j .F.hash_table_insert._7.if.else.0                                   # ir inst 22 fin
.F.hash_table_insert._6.if.then.0:
  mv t3, t4                                                             # ir inst 23 fin
  slli s11, t3, 1                                                       # ir inst 24 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 25 fin
  sw a4, 0(t3)                                                          # ir inst 26 fin
  mv t3, t4                                                             # ir inst 27 fin
  slli s11, t3, 1                                                       # ir inst 28 fin
  addi t3, s11, 1                                                       # ir inst 29 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 30 fin
  sw a5, 0(s11)                                                         # ir inst 31 fin
  mv t3, t4                                                             # ir inst 32 fin
  add s11, a1, t3                                                       # ir inst 33 fin
  li t1, 1
  sb t1, 0(s11)                                                         # ir inst 34 fin
  mv t3, t4                                                             # ir inst 35 fin
  add s11, a2, t3                                                       # ir inst 36 fin
  li t1, 0
  sb t1, 0(s11)                                                         # ir inst 37 fin
  mv a0, t6
  j .F.hash_table_insert.epilogue                                       # ir inst 38 fin
.F.hash_table_insert._7.if.else.0:
  j .F.hash_table_insert._8.if.exit.0                                   # ir inst 39 fin
.F.hash_table_insert._8.if.exit.0:
  mv t3, t4                                                             # ir inst 40 fin
  slli s11, t3, 1                                                       # ir inst 41 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 42 fin
  lw s11, 0(t3)                                                         # ir inst 43 fin
  xor t0, s11, a4
  sltiu t3, t0, 1                                                       # ir inst 44 fin
  bnez t3, .F.hash_table_insert._9.if.then.1
  j .F.hash_table_insert._10.if.else.1                                  # ir inst 45 fin
.F.hash_table_insert._9.if.then.1:
  mv t3, t4                                                             # ir inst 46 fin
  slli t4, t3, 1                                                        # ir inst 47 fin
  addi t3, t4, 1                                                        # ir inst 48 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 49 fin
  sw a5, 0(t4)                                                          # ir inst 50 fin
  li a0, 0
  j .F.hash_table_insert.epilogue                                       # ir inst 51 fin
.F.hash_table_insert._10.if.else.1:
  j .F.hash_table_insert._11.if.exit.1                                  # ir inst 52 fin
.F.hash_table_insert._11.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 53 fin
# Phi connections
  mv t6, t4
  j .F.hash_table_insert._1.while.cond.0                                # ir inst 54 fin
.F.hash_table_insert._12.while.exit.0:
  li a0, -1
  j .F.hash_table_insert.epilogue                                       # ir inst 55 fin
.F.hash_table_insert.epilogue:
  ld ra, 80(sp)
  ld s11, 72(sp)
  addi sp, sp, 96
  ret

.globl .F.hash_table_lookup
.F.hash_table_lookup:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 1 / 12,        range:       64(sp) -       72(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.hash_table_lookup._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  mv a0, a4
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
# ir inst 1 fin
  rem t5, t6, a3                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.hash_table_lookup._1.while.cond.0                                # ir inst 3 fin
.F.hash_table_lookup._1.while.cond.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  call .F.get_max_probe_distance
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 5 fin
  slt t3, t6, t4                                                        # ir inst 6 fin
  bnez t3, .F.hash_table_lookup._2.while.body.0
  j .F.hash_table_lookup._18.while.exit.0                               # ir inst 7 fin
.F.hash_table_lookup._2.while.body.0:
  mul t4, t6, t6                                                        # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  rem t4, t3, a3                                                        # ir inst 10 fin
  mv t3, t4                                                             # ir inst 11 fin
  add s11, a1, t3                                                       # ir inst 12 fin
  lb t3, 0(s11)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.hash_table_lookup._3.lazy.then.0
  j .F.hash_table_lookup._4.lazy.else.0                                 # ir inst 15 fin
.F.hash_table_lookup._3.lazy.then.0:
  mv t3, t4                                                             # ir inst 16 fin
  add s11, a2, t3                                                       # ir inst 17 fin
  lb t3, 0(s11)                                                         # ir inst 18 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 19 fin
# Phi connections
  mv t3, s11
  j .F.hash_table_lookup._5.lazy.exit.0                                 # ir inst 20 fin
.F.hash_table_lookup._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.hash_table_lookup._5.lazy.exit.0                                 # ir inst 21 fin
.F.hash_table_lookup._5.lazy.exit.0:
  bnez t3, .F.hash_table_lookup._6.if.then.0
  j .F.hash_table_lookup._7.if.else.0                                   # ir inst 23 fin
.F.hash_table_lookup._6.if.then.0:
  li a0, -1
  j .F.hash_table_lookup.epilogue                                       # ir inst 24 fin
.F.hash_table_lookup._7.if.else.0:
  j .F.hash_table_lookup._8.if.exit.0                                   # ir inst 25 fin
.F.hash_table_lookup._8.if.exit.0:
  mv t3, t4                                                             # ir inst 26 fin
  add s11, a1, t3                                                       # ir inst 27 fin
  lb t3, 0(s11)                                                         # ir inst 28 fin
  bnez t3, .F.hash_table_lookup._9.lazy.then.1
  j .F.hash_table_lookup._10.lazy.else.1                                # ir inst 29 fin
.F.hash_table_lookup._9.lazy.then.1:
  mv t3, t4                                                             # ir inst 30 fin
  add s11, a2, t3                                                       # ir inst 31 fin
  lb t3, 0(s11)                                                         # ir inst 32 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 33 fin
# Phi connections
  mv t3, s11
  j .F.hash_table_lookup._11.lazy.exit.1                                # ir inst 34 fin
.F.hash_table_lookup._10.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.hash_table_lookup._11.lazy.exit.1                                # ir inst 35 fin
.F.hash_table_lookup._11.lazy.exit.1:
  bnez t3, .F.hash_table_lookup._12.lazy.then.2
  j .F.hash_table_lookup._13.lazy.else.2                                # ir inst 37 fin
.F.hash_table_lookup._12.lazy.then.2:
  mv t3, t4                                                             # ir inst 38 fin
  slli s11, t3, 1                                                       # ir inst 39 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 40 fin
  lw s11, 0(t3)                                                         # ir inst 41 fin
  xor t0, s11, a4
  sltiu t3, t0, 1                                                       # ir inst 42 fin
# Phi connections
  j .F.hash_table_lookup._14.lazy.exit.2                                # ir inst 43 fin
.F.hash_table_lookup._13.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.hash_table_lookup._14.lazy.exit.2                                # ir inst 44 fin
.F.hash_table_lookup._14.lazy.exit.2:
  bnez t3, .F.hash_table_lookup._15.if.then.1
  j .F.hash_table_lookup._16.if.else.1                                  # ir inst 46 fin
.F.hash_table_lookup._15.if.then.1:
  mv t3, t4                                                             # ir inst 47 fin
  slli t4, t3, 1                                                        # ir inst 48 fin
  addi t3, t4, 1                                                        # ir inst 49 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 50 fin
  lw t3, 0(t4)                                                          # ir inst 51 fin
  mv a0, t3
  j .F.hash_table_lookup.epilogue                                       # ir inst 52 fin
.F.hash_table_lookup._16.if.else.1:
  j .F.hash_table_lookup._17.if.exit.1                                  # ir inst 53 fin
.F.hash_table_lookup._17.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 54 fin
# Phi connections
  mv t6, t4
  j .F.hash_table_lookup._1.while.cond.0                                # ir inst 55 fin
.F.hash_table_lookup._18.while.exit.0:
  li a0, -1
  j .F.hash_table_lookup.epilogue                                       # ir inst 56 fin
.F.hash_table_lookup.epilogue:
  ld ra, 72(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.hash_table_delete
.F.hash_table_delete:
# spill func args num: 0,             range:       80(sp) -       80(sp)
# local var size: 0,                  range:       80(sp) -       80(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 1 / 12,        range:       64(sp) -       72(sp)
# max caller save reg num: 8 / 12,    range:        0(sp) -       64(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -80
  sd s11, 64(sp)
  sd ra, 72(sp)
.F.hash_table_delete._0.entry.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  mv a0, a4
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
# ir inst 1 fin
  rem t5, t6, a3                                                        # ir inst 2 fin
# Phi connections
  li t6, 0
  j .F.hash_table_delete._1.while.cond.0                                # ir inst 3 fin
.F.hash_table_delete._1.while.cond.0:
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd t5, 40(sp)
  sd t6, 48(sp)
  call .F.get_max_probe_distance
  mv t4, a0
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld t5, 40(sp)
  ld t6, 48(sp)
# ir inst 5 fin
  slt t3, t6, t4                                                        # ir inst 6 fin
  bnez t3, .F.hash_table_delete._2.while.body.0
  j .F.hash_table_delete._18.while.exit.0                               # ir inst 7 fin
.F.hash_table_delete._2.while.body.0:
  mul t4, t6, t6                                                        # ir inst 8 fin
  add t3, t5, t4                                                        # ir inst 9 fin
  rem t4, t3, a3                                                        # ir inst 10 fin
  mv t3, t4                                                             # ir inst 11 fin
  add s11, a1, t3                                                       # ir inst 12 fin
  lb t3, 0(s11)                                                         # ir inst 13 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 14 fin
  bnez s11, .F.hash_table_delete._3.lazy.then.0
  j .F.hash_table_delete._4.lazy.else.0                                 # ir inst 15 fin
.F.hash_table_delete._3.lazy.then.0:
  mv t3, t4                                                             # ir inst 16 fin
  add s11, a2, t3                                                       # ir inst 17 fin
  lb t3, 0(s11)                                                         # ir inst 18 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 19 fin
# Phi connections
  mv t3, s11
  j .F.hash_table_delete._5.lazy.exit.0                                 # ir inst 20 fin
.F.hash_table_delete._4.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.hash_table_delete._5.lazy.exit.0                                 # ir inst 21 fin
.F.hash_table_delete._5.lazy.exit.0:
  bnez t3, .F.hash_table_delete._6.if.then.0
  j .F.hash_table_delete._7.if.else.0                                   # ir inst 23 fin
.F.hash_table_delete._6.if.then.0:
  li a0, 0
  j .F.hash_table_delete.epilogue                                       # ir inst 24 fin
.F.hash_table_delete._7.if.else.0:
  j .F.hash_table_delete._8.if.exit.0                                   # ir inst 25 fin
.F.hash_table_delete._8.if.exit.0:
  mv t3, t4                                                             # ir inst 26 fin
  add s11, a1, t3                                                       # ir inst 27 fin
  lb t3, 0(s11)                                                         # ir inst 28 fin
  bnez t3, .F.hash_table_delete._9.lazy.then.1
  j .F.hash_table_delete._10.lazy.else.1                                # ir inst 29 fin
.F.hash_table_delete._9.lazy.then.1:
  mv t3, t4                                                             # ir inst 30 fin
  add s11, a2, t3                                                       # ir inst 31 fin
  lb t3, 0(s11)                                                         # ir inst 32 fin
  li t2, 0
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 33 fin
# Phi connections
  mv t3, s11
  j .F.hash_table_delete._11.lazy.exit.1                                # ir inst 34 fin
.F.hash_table_delete._10.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.hash_table_delete._11.lazy.exit.1                                # ir inst 35 fin
.F.hash_table_delete._11.lazy.exit.1:
  bnez t3, .F.hash_table_delete._12.lazy.then.2
  j .F.hash_table_delete._13.lazy.else.2                                # ir inst 37 fin
.F.hash_table_delete._12.lazy.then.2:
  mv t3, t4                                                             # ir inst 38 fin
  slli s11, t3, 1                                                       # ir inst 39 fin
  slli t2, s11, 2
  add t3, a0, t2                                                        # ir inst 40 fin
  lw s11, 0(t3)                                                         # ir inst 41 fin
  xor t0, s11, a4
  sltiu t3, t0, 1                                                       # ir inst 42 fin
# Phi connections
  j .F.hash_table_delete._14.lazy.exit.2                                # ir inst 43 fin
.F.hash_table_delete._13.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.hash_table_delete._14.lazy.exit.2                                # ir inst 44 fin
.F.hash_table_delete._14.lazy.exit.2:
  bnez t3, .F.hash_table_delete._15.if.then.1
  j .F.hash_table_delete._16.if.else.1                                  # ir inst 46 fin
.F.hash_table_delete._15.if.then.1:
  mv t3, t4                                                             # ir inst 47 fin
  add t4, a2, t3                                                        # ir inst 48 fin
  li t1, 1
  sb t1, 0(t4)                                                          # ir inst 49 fin
  li a0, 1
  j .F.hash_table_delete.epilogue                                       # ir inst 50 fin
.F.hash_table_delete._16.if.else.1:
  j .F.hash_table_delete._17.if.exit.1                                  # ir inst 51 fin
.F.hash_table_delete._17.if.exit.1:
  addi t4, t6, 1                                                        # ir inst 52 fin
# Phi connections
  mv t6, t4
  j .F.hash_table_delete._1.while.cond.0                                # ir inst 53 fin
.F.hash_table_delete._18.while.exit.0:
  li a0, 0
  j .F.hash_table_delete.epilogue                                       # ir inst 54 fin
.F.hash_table_delete.epilogue:
  ld ra, 72(sp)
  ld s11, 64(sp)
  addi sp, sp, 80
  ret

.globl .F.run_priority_queue_tests
.F.run_priority_queue_tests:
# spill func args num: 0,             range:     2128(sp) -     2128(sp)
# local var size: 2048,               range:       80(sp) -     2128(sp)
# return addr size: 8,                range:       72(sp) -       80(sp)
# callee save reg num: 5 / 12,        range:       32(sp) -       72(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -2128
  add sp, sp, t0
  sd s11, 32(sp)
  sd s7, 40(sp)
  sd s8, 48(sp)
  sd s10, 56(sp)
  sd s9, 64(sp)
  sd ra, 72(sp)
.F.run_priority_queue_tests._0.entry.0:
  addi t1, sp, 80
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j .F.run_priority_queue_tests._1.array.cond.0                         # ir inst 3 fin
.F.run_priority_queue_tests._1.array.cond.0:
  li t2, 512
  slt t4, t5, t2                                                        # ir inst 5 fin
  bnez t4, .F.run_priority_queue_tests._2.array.body.0
  j .F.run_priority_queue_tests._3.array.exit.0                         # ir inst 6 fin
.F.run_priority_queue_tests._2.array.body.0:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 7 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 8 fin
  addi t4, t5, 1                                                        # ir inst 9 fin
# Phi connections
  mv t5, t4
  j .F.run_priority_queue_tests._1.array.cond.0                         # ir inst 10 fin
.F.run_priority_queue_tests._3.array.exit.0:
# Phi connections
  li t3, 0
  li t4, 0
  li t5, 0
  li t6, 0
  j .F.run_priority_queue_tests._4.while.cond.0                         # ir inst 11 fin
.F.run_priority_queue_tests._4.while.cond.0:
  li t2, 6000
  slt s11, t4, t2                                                       # ir inst 16 fin
  bnez s11, .F.run_priority_queue_tests._5.while.body.0
  j .F.run_priority_queue_tests._42.while.exit.0                        # ir inst 17 fin
.F.run_priority_queue_tests._5.while.body.0:
  li t2, 5
  rem s11, t4, t2                                                       # ir inst 18 fin
  li t2, 0
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 19 fin
  bnez s10, .F.run_priority_queue_tests._6.lazy.then.0
  j .F.run_priority_queue_tests._7.lazy.else.0                          # ir inst 20 fin
.F.run_priority_queue_tests._6.lazy.then.0:
# Phi connections
  li s10, 1
  j .F.run_priority_queue_tests._8.lazy.exit.0                          # ir inst 21 fin
.F.run_priority_queue_tests._7.lazy.else.0:
  li t2, 1
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 22 fin
# Phi connections
  j .F.run_priority_queue_tests._8.lazy.exit.0                          # ir inst 23 fin
.F.run_priority_queue_tests._8.lazy.exit.0:
  bnez s10, .F.run_priority_queue_tests._9.lazy.then.1
  j .F.run_priority_queue_tests._10.lazy.else.1                         # ir inst 25 fin
.F.run_priority_queue_tests._9.lazy.then.1:
# Phi connections
  li s10, 1
  j .F.run_priority_queue_tests._11.lazy.exit.1                         # ir inst 26 fin
.F.run_priority_queue_tests._10.lazy.else.1:
  li t2, 2
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 27 fin
# Phi connections
  j .F.run_priority_queue_tests._11.lazy.exit.1                         # ir inst 28 fin
.F.run_priority_queue_tests._11.lazy.exit.1:
  bnez s10, .F.run_priority_queue_tests._12.if.then.0
  j .F.run_priority_queue_tests._22.if.else.0                           # ir inst 30 fin
.F.run_priority_queue_tests._12.if.then.0:
  li t2, 256
  slt s10, t6, t2                                                       # ir inst 31 fin
  bnez s10, .F.run_priority_queue_tests._13.if.then.1
  j .F.run_priority_queue_tests._20.if.else.1                           # ir inst 32 fin
.F.run_priority_queue_tests._13.if.then.1:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t4
  call .F.generate_priority
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 33 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, t4
  mv a2, s10
  mv a1, t6
  addi t1, sp, 80
  mv a0, t1
  call .F.priority_queue_insert
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 34 fin
  li t2, 0
  slt s10, t2, s9                                                       # ir inst 35 fin
  bnez s10, .F.run_priority_queue_tests._14.if.then.2
  j .F.run_priority_queue_tests._18.if.else.2                           # ir inst 36 fin
.F.run_priority_queue_tests._14.if.then.2:
  addi s10, t6, 1                                                       # ir inst 37 fin
  addi s9, t5, 1                                                        # ir inst 38 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s10
  addi t1, sp, 80
  mv a0, t1
  call .F.validate_heap_property
  mv s8, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 39 fin
  li t2, 0
  xor t0, s8, t2
  sltiu s7, t0, 1                                                       # ir inst 40 fin
  bnez s7, .F.run_priority_queue_tests._15.if.then.3
  j .F.run_priority_queue_tests._16.if.else.3                           # ir inst 41 fin
.F.run_priority_queue_tests._15.if.then.3:
  addi s8, t3, 1                                                        # ir inst 42 fin
# Phi connections
  j .F.run_priority_queue_tests._17.if.exit.3                           # ir inst 43 fin
.F.run_priority_queue_tests._16.if.else.3:
# Phi connections
  mv s8, t3
  j .F.run_priority_queue_tests._17.if.exit.3                           # ir inst 44 fin
.F.run_priority_queue_tests._17.if.exit.3:
# Phi connections
  j .F.run_priority_queue_tests._19.if.exit.2                           # ir inst 46 fin
.F.run_priority_queue_tests._18.if.else.2:
# Phi connections
  mv s8, t3
  mv s9, t5
  mv s10, t6
  j .F.run_priority_queue_tests._19.if.exit.2                           # ir inst 47 fin
.F.run_priority_queue_tests._19.if.exit.2:
# Phi connections
  j .F.run_priority_queue_tests._21.if.exit.1                           # ir inst 51 fin
.F.run_priority_queue_tests._20.if.else.1:
# Phi connections
  mv s8, t3
  mv s9, t5
  mv s10, t6
  j .F.run_priority_queue_tests._21.if.exit.1                           # ir inst 52 fin
.F.run_priority_queue_tests._21.if.exit.1:
# Phi connections
  mv s11, s9
  mv t6, s10
  mv s10, s8
  j .F.run_priority_queue_tests._41.if.exit.0                           # ir inst 56 fin
.F.run_priority_queue_tests._22.if.else.0:
  li t2, 3
  xor t0, s11, t2
  sltiu s10, t0, 1                                                      # ir inst 57 fin
  bnez s10, .F.run_priority_queue_tests._23.if.then.4
  j .F.run_priority_queue_tests._33.if.else.4                           # ir inst 58 fin
.F.run_priority_queue_tests._23.if.then.4:
  li t2, 0
  slt s11, t2, t6                                                       # ir inst 59 fin
  bnez s11, .F.run_priority_queue_tests._24.if.then.5
  j .F.run_priority_queue_tests._31.if.else.5                           # ir inst 60 fin
.F.run_priority_queue_tests._24.if.then.5:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, t6
  addi t1, sp, 80
  mv a0, t1
  call .F.priority_queue_extract_max
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 61 fin
  li t2, 0
  slt t0, s11, t2
  xori s10, t0, 1                                                       # ir inst 62 fin
  bnez s10, .F.run_priority_queue_tests._25.if.then.6
  j .F.run_priority_queue_tests._29.if.else.6                           # ir inst 63 fin
.F.run_priority_queue_tests._25.if.then.6:
  addi s11, t6, -1                                                      # ir inst 64 fin
  addi s10, t5, 1                                                       # ir inst 65 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a1, s11
  addi t1, sp, 80
  mv a0, t1
  call .F.validate_heap_property
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 66 fin
  li t2, 0
  xor t0, s9, t2
  sltiu s8, t0, 1                                                       # ir inst 67 fin
  bnez s8, .F.run_priority_queue_tests._26.if.then.7
  j .F.run_priority_queue_tests._27.if.else.7                           # ir inst 68 fin
.F.run_priority_queue_tests._26.if.then.7:
  addi s9, t3, 1                                                        # ir inst 69 fin
# Phi connections
  j .F.run_priority_queue_tests._28.if.exit.7                           # ir inst 70 fin
.F.run_priority_queue_tests._27.if.else.7:
# Phi connections
  mv s9, t3
  j .F.run_priority_queue_tests._28.if.exit.7                           # ir inst 71 fin
.F.run_priority_queue_tests._28.if.exit.7:
# Phi connections
  j .F.run_priority_queue_tests._30.if.exit.6                           # ir inst 73 fin
.F.run_priority_queue_tests._29.if.else.6:
# Phi connections
  mv s9, t3
  mv s10, t5
  mv s11, t6
  j .F.run_priority_queue_tests._30.if.exit.6                           # ir inst 74 fin
.F.run_priority_queue_tests._30.if.exit.6:
# Phi connections
  j .F.run_priority_queue_tests._32.if.exit.5                           # ir inst 78 fin
.F.run_priority_queue_tests._31.if.else.5:
# Phi connections
  mv s9, t3
  mv s10, t5
  mv s11, t6
  j .F.run_priority_queue_tests._32.if.exit.5                           # ir inst 79 fin
.F.run_priority_queue_tests._32.if.exit.5:
# Phi connections
  mv t6, s11
  mv s11, s10
  mv s10, s9
  j .F.run_priority_queue_tests._40.if.exit.4                           # ir inst 83 fin
.F.run_priority_queue_tests._33.if.else.4:
  li t2, 0
  slt s11, t2, t6                                                       # ir inst 84 fin
  bnez s11, .F.run_priority_queue_tests._34.if.then.8
  j .F.run_priority_queue_tests._38.if.else.8                           # ir inst 85 fin
.F.run_priority_queue_tests._34.if.then.8:
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  addi t1, sp, 80
  mv a0, t1
  call .F.priority_queue_peek
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 86 fin
  li t2, 0
  slt t0, s11, t2
  xori s10, t0, 1                                                       # ir inst 87 fin
  bnez s10, .F.run_priority_queue_tests._35.if.then.9
  j .F.run_priority_queue_tests._36.if.else.9                           # ir inst 88 fin
.F.run_priority_queue_tests._35.if.then.9:
  addi s11, t5, 1                                                       # ir inst 89 fin
# Phi connections
  j .F.run_priority_queue_tests._37.if.exit.9                           # ir inst 90 fin
.F.run_priority_queue_tests._36.if.else.9:
# Phi connections
  mv s11, t5
  j .F.run_priority_queue_tests._37.if.exit.9                           # ir inst 91 fin
.F.run_priority_queue_tests._37.if.exit.9:
# Phi connections
  j .F.run_priority_queue_tests._39.if.exit.8                           # ir inst 93 fin
.F.run_priority_queue_tests._38.if.else.8:
# Phi connections
  mv s11, t5
  j .F.run_priority_queue_tests._39.if.exit.8                           # ir inst 94 fin
.F.run_priority_queue_tests._39.if.exit.8:
# Phi connections
  mv s10, t3
  j .F.run_priority_queue_tests._40.if.exit.4                           # ir inst 96 fin
.F.run_priority_queue_tests._40.if.exit.4:
# Phi connections
  j .F.run_priority_queue_tests._41.if.exit.0                           # ir inst 100 fin
.F.run_priority_queue_tests._41.if.exit.0:
  addi s9, t4, 1                                                        # ir inst 104 fin
# Phi connections
  mv t3, s10
  mv t4, s9
  mv t5, s11
  j .F.run_priority_queue_tests._4.while.cond.0                         # ir inst 105 fin
.F.run_priority_queue_tests._42.while.exit.0:
  sub t6, t5, t3                                                        # ir inst 106 fin
  mv a0, t6
  j .F.run_priority_queue_tests.epilogue                                # ir inst 107 fin
.F.run_priority_queue_tests.epilogue:
  ld ra, 72(sp)
  ld s11, 32(sp)
  ld s7, 40(sp)
  ld s8, 48(sp)
  ld s10, 56(sp)
  ld s9, 64(sp)
  li t0, 2128
  add sp, sp, t0
  ret

.globl .F.generate_priority
.F.generate_priority:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       32(sp) -       32(sp)
# return addr size: 8,                range:       24(sp) -       32(sp)
# callee save reg num: 0 / 12,        range:       24(sp) -       24(sp)
# max caller save reg num: 3 / 12,    range:        0(sp) -       24(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 24(sp)
.F.generate_priority._0.entry.0:
  li t2, 4
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.generate_priority._1.if.then.0
  j .F.generate_priority._2.if.else.0                                   # ir inst 3 fin
.F.generate_priority._1.if.then.0:
  li t2, 1000
  rem t5, a0, t2                                                        # ir inst 4 fin
  mv a0, t5
  j .F.generate_priority.epilogue                                       # ir inst 5 fin
.F.generate_priority._2.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 6 fin
  bnez t5, .F.generate_priority._3.if.then.1
  j .F.generate_priority._4.if.else.1                                   # ir inst 7 fin
.F.generate_priority._3.if.then.1:
# Start call preparation
  sd a0, 0(sp)
  sd t6, 8(sp)
  call .F.hash_function
  mv t5, a0
  ld a0, 0(sp)
  ld t6, 8(sp)
# ir inst 8 fin
  li t2, 10000
  rem t4, t5, t2                                                        # ir inst 9 fin
  mv a0, t4
  j .F.generate_priority.epilogue                                       # ir inst 10 fin
.F.generate_priority._4.if.else.1:
  li t2, 2
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 11 fin
  bnez t5, .F.generate_priority._5.if.then.2
  j .F.generate_priority._6.if.else.2                                   # ir inst 12 fin
.F.generate_priority._5.if.then.2:
  mul t6, a0, a0                                                        # ir inst 13 fin
  li t2, 5000
  rem t5, t6, t2                                                        # ir inst 14 fin
  mv a0, t5
  j .F.generate_priority.epilogue                                       # ir inst 15 fin
.F.generate_priority._6.if.else.2:
  li t2, 15
  rem t6, a0, t2                                                        # ir inst 16 fin
# Start call preparation
  sd t6, 0(sp)
  mv a0, t6
  call .F.fibonacci_number
  mv t5, a0
  ld t6, 0(sp)
# ir inst 17 fin
  li t2, 10
  mul t6, t5, t2                                                        # ir inst 18 fin
  mv a0, t6
  j .F.generate_priority.epilogue                                       # ir inst 19 fin
.F.generate_priority._7.if.exit.2:
  j .F.generate_priority._8.if.exit.1                                   # ir inst 20 fin
.F.generate_priority._8.if.exit.1:
  j .F.generate_priority._9.if.exit.0                                   # ir inst 21 fin
.F.generate_priority._9.if.exit.0:
.F.generate_priority.epilogue:
  ld ra, 24(sp)
  addi sp, sp, 32
  ret

.globl .F.priority_queue_insert
.F.priority_queue_insert:
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
.F.priority_queue_insert._0.entry.0:
  mv t6, a1                                                             # ir inst 1 fin
  slli t5, t6, 1                                                        # ir inst 2 fin
  slli t2, t5, 2
  add t6, a0, t2                                                        # ir inst 3 fin
  sw a2, 0(t6)                                                          # ir inst 4 fin
  mv t6, a1                                                             # ir inst 5 fin
  slli t5, t6, 1                                                        # ir inst 6 fin
  addi t6, t5, 1                                                        # ir inst 7 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 8 fin
  sw a3, 0(t5)                                                          # ir inst 9 fin
# Phi connections
  mv t6, a1
  j .F.priority_queue_insert._1.while.cond.0                            # ir inst 10 fin
.F.priority_queue_insert._1.while.cond.0:
  li t2, 0
  slt t5, t2, t6                                                        # ir inst 12 fin
  bnez t5, .F.priority_queue_insert._2.while.body.0
  j .F.priority_queue_insert._7.critical_edge.0                         # ir inst 13 fin
.F.priority_queue_insert._2.while.body.0:
  addi t5, t6, -1                                                       # ir inst 14 fin
  li t2, 2
  div t4, t5, t2                                                        # ir inst 15 fin
  mv t5, t4                                                             # ir inst 16 fin
  slli t3, t5, 1                                                        # ir inst 17 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 18 fin
  lw t3, 0(t5)                                                          # ir inst 19 fin
  mv t5, t6                                                             # ir inst 20 fin
  slli s11, t5, 1                                                       # ir inst 21 fin
  slli t2, s11, 2
  add t5, a0, t2                                                        # ir inst 22 fin
  lw s11, 0(t5)                                                         # ir inst 23 fin
  slt t0, t3, s11
  xori t5, t0, 1                                                        # ir inst 24 fin
  bnez t5, .F.priority_queue_insert._3.if.then.0
  j .F.priority_queue_insert._4.if.else.0                               # ir inst 25 fin
.F.priority_queue_insert._3.if.then.0:
  j .F.priority_queue_insert._6.while.exit.0                            # ir inst 26 fin
.F.priority_queue_insert._4.if.else.0:
  j .F.priority_queue_insert._5.if.exit.0                               # ir inst 27 fin
.F.priority_queue_insert._5.if.exit.0:
  mv t5, t6                                                             # ir inst 28 fin
  slli t3, t5, 1                                                        # ir inst 29 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 30 fin
  lw t3, 0(t5)                                                          # ir inst 31 fin
  mv t5, t6                                                             # ir inst 32 fin
  slli s11, t5, 1                                                       # ir inst 33 fin
  addi t5, s11, 1                                                       # ir inst 34 fin
  slli t2, t5, 2
  add s11, a0, t2                                                       # ir inst 35 fin
  lw t5, 0(s11)                                                         # ir inst 36 fin
  mv s11, t6                                                            # ir inst 37 fin
  slli s10, s11, 1                                                      # ir inst 38 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 39 fin
  mv s10, t4                                                            # ir inst 40 fin
  slli s9, s10, 1                                                       # ir inst 41 fin
  slli t2, s9, 2
  add s10, a0, t2                                                       # ir inst 42 fin
  lw s9, 0(s10)                                                         # ir inst 43 fin
  sw s9, 0(s11)                                                         # ir inst 44 fin
  mv s11, t6                                                            # ir inst 45 fin
  slli t6, s11, 1                                                       # ir inst 46 fin
  addi s11, t6, 1                                                       # ir inst 47 fin
  slli t2, s11, 2
  add t6, a0, t2                                                        # ir inst 48 fin
  mv s11, t4                                                            # ir inst 49 fin
  slli s10, s11, 1                                                      # ir inst 50 fin
  addi s11, s10, 1                                                      # ir inst 51 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 52 fin
  lw s11, 0(s10)                                                        # ir inst 53 fin
  sw s11, 0(t6)                                                         # ir inst 54 fin
  mv t6, t4                                                             # ir inst 55 fin
  slli s11, t6, 1                                                       # ir inst 56 fin
  slli t2, s11, 2
  add t6, a0, t2                                                        # ir inst 57 fin
  sw t3, 0(t6)                                                          # ir inst 58 fin
  mv t6, t4                                                             # ir inst 59 fin
  slli t3, t6, 1                                                        # ir inst 60 fin
  addi t6, t3, 1                                                        # ir inst 61 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 62 fin
  sw t5, 0(t3)                                                          # ir inst 63 fin
# Phi connections
  mv t6, t4
  j .F.priority_queue_insert._1.while.cond.0                            # ir inst 64 fin
.F.priority_queue_insert._6.while.exit.0:
  li a0, 1
  j .F.priority_queue_insert.epilogue                                   # ir inst 65 fin
.F.priority_queue_insert._7.critical_edge.0:
  j .F.priority_queue_insert._6.while.exit.0                            # ir inst 66 fin
.F.priority_queue_insert.epilogue:
  ld s9, 0(sp)
  ld s10, 8(sp)
  ld s11, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.priority_queue_extract_max
.F.priority_queue_extract_max:
# spill func args num: 0,             range:       48(sp) -       48(sp)
# local var size: 0,                  range:       40(sp) -       40(sp)
# return addr size: 0,                range:       40(sp) -       40(sp)
# callee save reg num: 5 / 12,        range:        0(sp) -       40(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -48
  sd s11, 0(sp)
  sd s7, 8(sp)
  sd s8, 16(sp)
  sd s9, 24(sp)
  sd s10, 32(sp)
.F.priority_queue_extract_max._0.entry.0:
  li t2, 0
  xor t0, a1, t2
  sltiu t6, t0, 1                                                       # ir inst 1 fin
  bnez t6, .F.priority_queue_extract_max._1.if.then.0
  j .F.priority_queue_extract_max._2.if.else.0                          # ir inst 2 fin
.F.priority_queue_extract_max._1.if.then.0:
  li a0, -1
  j .F.priority_queue_extract_max.epilogue                              # ir inst 3 fin
.F.priority_queue_extract_max._2.if.else.0:
  j .F.priority_queue_extract_max._3.if.exit.0                          # ir inst 4 fin
.F.priority_queue_extract_max._3.if.exit.0:
  addi t6, a0, 0                                                        # ir inst 5 fin
  lw t5, 0(t6)                                                          # ir inst 6 fin
  addi t6, a0, 0                                                        # ir inst 7 fin
  mv t4, a1                                                             # ir inst 8 fin
  addi t3, t4, -1                                                       # ir inst 9 fin
  slli t4, t3, 1                                                        # ir inst 10 fin
  slli t2, t4, 2
  add t3, a0, t2                                                        # ir inst 11 fin
  lw t4, 0(t3)                                                          # ir inst 12 fin
  sw t4, 0(t6)                                                          # ir inst 13 fin
  addi t6, a0, 4                                                        # ir inst 14 fin
  mv t4, a1                                                             # ir inst 15 fin
  addi t3, t4, -1                                                       # ir inst 16 fin
  slli t4, t3, 1                                                        # ir inst 17 fin
  addi t3, t4, 1                                                        # ir inst 18 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 19 fin
  lw t3, 0(t4)                                                          # ir inst 20 fin
  sw t3, 0(t6)                                                          # ir inst 21 fin
  addi t6, a1, -1                                                       # ir inst 22 fin
# Phi connections
  li t4, 0
  j .F.priority_queue_extract_max._4.while.cond.0                       # ir inst 23 fin
.F.priority_queue_extract_max._4.while.cond.0:
  j .F.priority_queue_extract_max._5.while.body.0                       # ir inst 25 fin
.F.priority_queue_extract_max._5.while.body.0:
  slli t3, t4, 1                                                        # ir inst 26 fin
  addi s11, t3, 1                                                       # ir inst 27 fin
  slli t3, t4, 1                                                        # ir inst 28 fin
  addi s10, t3, 2                                                       # ir inst 29 fin
  slt t3, s11, t6                                                       # ir inst 30 fin
  bnez t3, .F.priority_queue_extract_max._6.lazy.then.0
  j .F.priority_queue_extract_max._7.lazy.else.0                        # ir inst 31 fin
.F.priority_queue_extract_max._6.lazy.then.0:
  mv t3, s11                                                            # ir inst 32 fin
  slli s9, t3, 1                                                        # ir inst 33 fin
  slli t2, s9, 2
  add t3, a0, t2                                                        # ir inst 34 fin
  lw s9, 0(t3)                                                          # ir inst 35 fin
  mv t3, t4                                                             # ir inst 36 fin
  slli s8, t3, 1                                                        # ir inst 37 fin
  slli t2, s8, 2
  add t3, a0, t2                                                        # ir inst 38 fin
  lw s8, 0(t3)                                                          # ir inst 39 fin
  slt t3, s8, s9                                                        # ir inst 40 fin
# Phi connections
  j .F.priority_queue_extract_max._8.lazy.exit.0                        # ir inst 41 fin
.F.priority_queue_extract_max._7.lazy.else.0:
# Phi connections
  li t3, 0
  j .F.priority_queue_extract_max._8.lazy.exit.0                        # ir inst 42 fin
.F.priority_queue_extract_max._8.lazy.exit.0:
  bnez t3, .F.priority_queue_extract_max._9.if.then.1
  j .F.priority_queue_extract_max._10.if.else.1                         # ir inst 44 fin
.F.priority_queue_extract_max._9.if.then.1:
# Phi connections
  mv t3, s11
  j .F.priority_queue_extract_max._11.if.exit.1                         # ir inst 45 fin
.F.priority_queue_extract_max._10.if.else.1:
# Phi connections
  mv t3, t4
  j .F.priority_queue_extract_max._11.if.exit.1                         # ir inst 46 fin
.F.priority_queue_extract_max._11.if.exit.1:
  slt s11, s10, t6                                                      # ir inst 48 fin
  bnez s11, .F.priority_queue_extract_max._12.lazy.then.1
  j .F.priority_queue_extract_max._13.lazy.else.1                       # ir inst 49 fin
.F.priority_queue_extract_max._12.lazy.then.1:
  mv s11, s10                                                           # ir inst 50 fin
  slli s9, s11, 1                                                       # ir inst 51 fin
  slli t2, s9, 2
  add s11, a0, t2                                                       # ir inst 52 fin
  lw s9, 0(s11)                                                         # ir inst 53 fin
  mv s11, t3                                                            # ir inst 54 fin
  slli s8, s11, 1                                                       # ir inst 55 fin
  slli t2, s8, 2
  add s11, a0, t2                                                       # ir inst 56 fin
  lw s8, 0(s11)                                                         # ir inst 57 fin
  slt s11, s8, s9                                                       # ir inst 58 fin
# Phi connections
  j .F.priority_queue_extract_max._14.lazy.exit.1                       # ir inst 59 fin
.F.priority_queue_extract_max._13.lazy.else.1:
# Phi connections
  li s11, 0
  j .F.priority_queue_extract_max._14.lazy.exit.1                       # ir inst 60 fin
.F.priority_queue_extract_max._14.lazy.exit.1:
  bnez s11, .F.priority_queue_extract_max._15.if.then.2
  j .F.priority_queue_extract_max._16.if.else.2                         # ir inst 62 fin
.F.priority_queue_extract_max._15.if.then.2:
# Phi connections
  mv t3, s10
  j .F.priority_queue_extract_max._17.if.exit.2                         # ir inst 63 fin
.F.priority_queue_extract_max._16.if.else.2:
# Phi connections
  j .F.priority_queue_extract_max._17.if.exit.2                         # ir inst 64 fin
.F.priority_queue_extract_max._17.if.exit.2:
  xor t0, t3, t4
  sltiu s11, t0, 1                                                      # ir inst 66 fin
  bnez s11, .F.priority_queue_extract_max._18.if.then.3
  j .F.priority_queue_extract_max._19.if.else.3                         # ir inst 67 fin
.F.priority_queue_extract_max._18.if.then.3:
  j .F.priority_queue_extract_max._21.while.exit.0                      # ir inst 68 fin
.F.priority_queue_extract_max._19.if.else.3:
  j .F.priority_queue_extract_max._20.if.exit.3                         # ir inst 69 fin
.F.priority_queue_extract_max._20.if.exit.3:
  mv s11, t4                                                            # ir inst 70 fin
  slli s10, s11, 1                                                      # ir inst 71 fin
  slli t2, s10, 2
  add s11, a0, t2                                                       # ir inst 72 fin
  lw s10, 0(s11)                                                        # ir inst 73 fin
  mv s11, t4                                                            # ir inst 74 fin
  slli s9, s11, 1                                                       # ir inst 75 fin
  addi s11, s9, 1                                                       # ir inst 76 fin
  slli t2, s11, 2
  add s9, a0, t2                                                        # ir inst 77 fin
  lw s11, 0(s9)                                                         # ir inst 78 fin
  mv s9, t4                                                             # ir inst 79 fin
  slli s8, s9, 1                                                        # ir inst 80 fin
  slli t2, s8, 2
  add s9, a0, t2                                                        # ir inst 81 fin
  mv s8, t3                                                             # ir inst 82 fin
  slli s7, s8, 1                                                        # ir inst 83 fin
  slli t2, s7, 2
  add s8, a0, t2                                                        # ir inst 84 fin
  lw s7, 0(s8)                                                          # ir inst 85 fin
  sw s7, 0(s9)                                                          # ir inst 86 fin
  mv s9, t4                                                             # ir inst 87 fin
  slli t4, s9, 1                                                        # ir inst 88 fin
  addi s9, t4, 1                                                        # ir inst 89 fin
  slli t2, s9, 2
  add t4, a0, t2                                                        # ir inst 90 fin
  mv s9, t3                                                             # ir inst 91 fin
  slli s8, s9, 1                                                        # ir inst 92 fin
  addi s9, s8, 1                                                        # ir inst 93 fin
  slli t2, s9, 2
  add s8, a0, t2                                                        # ir inst 94 fin
  lw s9, 0(s8)                                                          # ir inst 95 fin
  sw s9, 0(t4)                                                          # ir inst 96 fin
  mv t4, t3                                                             # ir inst 97 fin
  slli s9, t4, 1                                                        # ir inst 98 fin
  slli t2, s9, 2
  add t4, a0, t2                                                        # ir inst 99 fin
  sw s10, 0(t4)                                                         # ir inst 100 fin
  mv t4, t3                                                             # ir inst 101 fin
  slli s10, t4, 1                                                       # ir inst 102 fin
  addi t4, s10, 1                                                       # ir inst 103 fin
  slli t2, t4, 2
  add s10, a0, t2                                                       # ir inst 104 fin
  sw s11, 0(s10)                                                        # ir inst 105 fin
# Phi connections
  mv t4, t3
  j .F.priority_queue_extract_max._4.while.cond.0                       # ir inst 106 fin
.F.priority_queue_extract_max._21.while.exit.0:
  mv a0, t5
  j .F.priority_queue_extract_max.epilogue                              # ir inst 107 fin
.F.priority_queue_extract_max._22.critical_edge.0:
  j .F.priority_queue_extract_max._21.while.exit.0                      # ir inst 108 fin
.F.priority_queue_extract_max.epilogue:
  ld s11, 0(sp)
  ld s7, 8(sp)
  ld s8, 16(sp)
  ld s9, 24(sp)
  ld s10, 32(sp)
  addi sp, sp, 48
  ret

.globl .F.priority_queue_peek
.F.priority_queue_peek:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.priority_queue_peek._0.entry.0:
  addi t6, a0, 0                                                        # ir inst 1 fin
  lw t5, 0(t6)                                                          # ir inst 2 fin
  mv a0, t5
  j .F.priority_queue_peek.epilogue                                     # ir inst 3 fin
.F.priority_queue_peek.epilogue:
  ret

.globl .F.validate_heap_property
.F.validate_heap_property:
# spill func args num: 0,             range:       16(sp) -       16(sp)
# local var size: 0,                  range:        8(sp) -        8(sp)
# return addr size: 0,                range:        8(sp) -        8(sp)
# callee save reg num: 1 / 12,        range:        0(sp) -        8(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -16
  sd s11, 0(sp)
.F.validate_heap_property._0.entry.0:
# Phi connections
  li t6, 0
  j .F.validate_heap_property._1.while.cond.0                           # ir inst 1 fin
.F.validate_heap_property._1.while.cond.0:
  slt t5, t6, a1                                                        # ir inst 3 fin
  bnez t5, .F.validate_heap_property._2.while.body.0
  j .F.validate_heap_property._15.while.exit.0                          # ir inst 4 fin
.F.validate_heap_property._2.while.body.0:
  slli t5, t6, 1                                                        # ir inst 5 fin
  addi t4, t5, 1                                                        # ir inst 6 fin
  slli t5, t6, 1                                                        # ir inst 7 fin
  addi t3, t5, 2                                                        # ir inst 8 fin
  slt t5, t4, a1                                                        # ir inst 9 fin
  bnez t5, .F.validate_heap_property._3.lazy.then.0
  j .F.validate_heap_property._4.lazy.else.0                            # ir inst 10 fin
.F.validate_heap_property._3.lazy.then.0:
  mv t5, t6                                                             # ir inst 11 fin
  slli s11, t5, 1                                                       # ir inst 12 fin
  slli t2, s11, 2
  add t5, a0, t2                                                        # ir inst 13 fin
  lw s11, 0(t5)                                                         # ir inst 14 fin
  mv t5, t4                                                             # ir inst 15 fin
  slli t4, t5, 1                                                        # ir inst 16 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 17 fin
  lw t4, 0(t5)                                                          # ir inst 18 fin
  slt t5, s11, t4                                                       # ir inst 19 fin
# Phi connections
  j .F.validate_heap_property._5.lazy.exit.0                            # ir inst 20 fin
.F.validate_heap_property._4.lazy.else.0:
# Phi connections
  li t5, 0
  j .F.validate_heap_property._5.lazy.exit.0                            # ir inst 21 fin
.F.validate_heap_property._5.lazy.exit.0:
  bnez t5, .F.validate_heap_property._6.if.then.0
  j .F.validate_heap_property._7.if.else.0                              # ir inst 23 fin
.F.validate_heap_property._6.if.then.0:
  li a0, 0
  j .F.validate_heap_property.epilogue                                  # ir inst 24 fin
.F.validate_heap_property._7.if.else.0:
  j .F.validate_heap_property._8.if.exit.0                              # ir inst 25 fin
.F.validate_heap_property._8.if.exit.0:
  slt t5, t3, a1                                                        # ir inst 26 fin
  bnez t5, .F.validate_heap_property._9.lazy.then.1
  j .F.validate_heap_property._10.lazy.else.1                           # ir inst 27 fin
.F.validate_heap_property._9.lazy.then.1:
  mv t5, t6                                                             # ir inst 28 fin
  slli t4, t5, 1                                                        # ir inst 29 fin
  slli t2, t4, 2
  add t5, a0, t2                                                        # ir inst 30 fin
  lw t4, 0(t5)                                                          # ir inst 31 fin
  mv t5, t3                                                             # ir inst 32 fin
  slli t3, t5, 1                                                        # ir inst 33 fin
  slli t2, t3, 2
  add t5, a0, t2                                                        # ir inst 34 fin
  lw t3, 0(t5)                                                          # ir inst 35 fin
  slt t5, t4, t3                                                        # ir inst 36 fin
# Phi connections
  j .F.validate_heap_property._11.lazy.exit.1                           # ir inst 37 fin
.F.validate_heap_property._10.lazy.else.1:
# Phi connections
  li t5, 0
  j .F.validate_heap_property._11.lazy.exit.1                           # ir inst 38 fin
.F.validate_heap_property._11.lazy.exit.1:
  bnez t5, .F.validate_heap_property._12.if.then.1
  j .F.validate_heap_property._13.if.else.1                             # ir inst 40 fin
.F.validate_heap_property._12.if.then.1:
  li a0, 0
  j .F.validate_heap_property.epilogue                                  # ir inst 41 fin
.F.validate_heap_property._13.if.else.1:
  j .F.validate_heap_property._14.if.exit.1                             # ir inst 42 fin
.F.validate_heap_property._14.if.exit.1:
  addi t5, t6, 1                                                        # ir inst 43 fin
# Phi connections
  mv t6, t5
  j .F.validate_heap_property._1.while.cond.0                           # ir inst 44 fin
.F.validate_heap_property._15.while.exit.0:
  li a0, 1
  j .F.validate_heap_property.epilogue                                  # ir inst 45 fin
.F.validate_heap_property.epilogue:
  ld s11, 0(sp)
  addi sp, sp, 16
  ret

.globl .F.run_integrated_system_test
.F.run_integrated_system_test:
# spill func args num: 0,             range:       64(sp) -       64(sp)
# local var size: 0,                  range:       64(sp) -       64(sp)
# return addr size: 8,                range:       56(sp) -       64(sp)
# callee save reg num: 3 / 12,        range:       32(sp) -       56(sp)
# max caller save reg num: 4 / 12,    range:        0(sp) -       32(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -64
  sd s9, 32(sp)
  sd s10, 40(sp)
  sd s11, 48(sp)
  sd ra, 56(sp)
.F.run_integrated_system_test._0.entry.0:
# Phi connections
  li t5, 0
  li t6, 0
  j .F.run_integrated_system_test._1.while.cond.0                       # ir inst 1 fin
.F.run_integrated_system_test._1.while.cond.0:
  li t2, 1000
  slt t4, t6, t2                                                        # ir inst 4 fin
  bnez t4, .F.run_integrated_system_test._2.while.body.0
  j .F.run_integrated_system_test._6.while.exit.0                       # ir inst 5 fin
.F.run_integrated_system_test._2.while.body.0:
# Start call preparation
  sd t5, 0(sp)
  sd t6, 8(sp)
  mv a0, t6
  call .F.simulate_memory_pressure
  mv t4, a0
  ld t5, 0(sp)
  ld t6, 8(sp)
# ir inst 6 fin
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.simulate_cache_workload
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 7 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.simulate_hash_workload
  mv s11, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 8 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a0, t6
  call .F.simulate_queue_workload
  mv s10, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 9 fin
# Start call preparation
  sd t3, 0(sp)
  sd t4, 8(sp)
  sd t5, 16(sp)
  sd t6, 24(sp)
  mv a3, s10
  mv a2, s11
  mv a1, t3
  mv a0, t4
  call .F.compute_integrated_score
  mv s9, a0
  ld t3, 0(sp)
  ld t4, 8(sp)
  ld t5, 16(sp)
  ld t6, 24(sp)
# ir inst 10 fin
  add t4, t5, s9                                                        # ir inst 11 fin
  li t2, 100
  rem t3, t6, t2                                                        # ir inst 12 fin
  li t2, 99
  xor t0, t3, t2
  sltiu s11, t0, 1                                                      # ir inst 13 fin
  bnez s11, .F.run_integrated_system_test._3.if.then.0
  j .F.run_integrated_system_test._4.if.else.0                          # ir inst 14 fin
.F.run_integrated_system_test._3.if.then.0:
# Start call preparation
  sd t4, 0(sp)
  sd t5, 8(sp)
  sd t6, 16(sp)
  mv a0, t6
  call .F.simulate_system_adaptation
  mv t3, a0
  ld t4, 0(sp)
  ld t5, 8(sp)
  ld t6, 16(sp)
# ir inst 15 fin
  add s11, t4, t3                                                       # ir inst 16 fin
# Phi connections
  mv t4, s11
  j .F.run_integrated_system_test._5.if.exit.0                          # ir inst 17 fin
.F.run_integrated_system_test._4.if.else.0:
# Phi connections
  j .F.run_integrated_system_test._5.if.exit.0                          # ir inst 18 fin
.F.run_integrated_system_test._5.if.exit.0:
  addi t3, t6, 1                                                        # ir inst 20 fin
# Phi connections
  mv t5, t4
  mv t6, t3
  j .F.run_integrated_system_test._1.while.cond.0                       # ir inst 21 fin
.F.run_integrated_system_test._6.while.exit.0:
  li t2, 1000
  div t6, t5, t2                                                        # ir inst 22 fin
  mv a0, t6
  j .F.run_integrated_system_test.epilogue                              # ir inst 23 fin
.F.run_integrated_system_test.epilogue:
  ld ra, 56(sp)
  ld s9, 32(sp)
  ld s10, 40(sp)
  ld s11, 48(sp)
  addi sp, sp, 64
  ret

.globl .F.simulate_memory_pressure
.F.simulate_memory_pressure:
# spill func args num: 0,             range:       32(sp) -       32(sp)
# local var size: 0,                  range:       24(sp) -       24(sp)
# return addr size: 8,                range:       16(sp) -       24(sp)
# callee save reg num: 0 / 12,        range:       16(sp) -       16(sp)
# max caller save reg num: 2 / 12,    range:        0(sp) -       16(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -32
  sd ra, 16(sp)
.F.simulate_memory_pressure._0.entry.0:
  li t2, 3
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.simulate_memory_pressure._1.if.then.0
  j .F.simulate_memory_pressure._2.if.else.0                            # ir inst 3 fin
.F.simulate_memory_pressure._1.if.then.0:
  li t2, 20
  rem t5, a0, t2                                                        # ir inst 4 fin
  addi t4, t5, 50                                                       # ir inst 5 fin
  mv a0, t4
  j .F.simulate_memory_pressure.epilogue                                # ir inst 6 fin
.F.simulate_memory_pressure._2.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 7 fin
  bnez t5, .F.simulate_memory_pressure._3.if.then.1
  j .F.simulate_memory_pressure._4.if.else.1                            # ir inst 8 fin
.F.simulate_memory_pressure._3.if.then.1:
  li t2, 17
  mul t6, a0, t2                                                        # ir inst 9 fin
  li t2, 40
  rem t5, t6, t2                                                        # ir inst 10 fin
  addi t6, t5, 80                                                       # ir inst 11 fin
  mv a0, t6
  j .F.simulate_memory_pressure.epilogue                                # ir inst 12 fin
.F.simulate_memory_pressure._4.if.else.1:
# Start call preparation
  sd a0, 0(sp)
  call .F.hash_function
  mv t6, a0
  ld a0, 0(sp)
# ir inst 13 fin
  li t2, 30
  rem t5, t6, t2                                                        # ir inst 14 fin
  addi t6, t5, 110                                                      # ir inst 15 fin
  mv a0, t6
  j .F.simulate_memory_pressure.epilogue                                # ir inst 16 fin
.F.simulate_memory_pressure._5.if.exit.1:
  j .F.simulate_memory_pressure._6.if.exit.0                            # ir inst 17 fin
.F.simulate_memory_pressure._6.if.exit.0:
.F.simulate_memory_pressure.epilogue:
  ld ra, 16(sp)
  addi sp, sp, 32
  ret

.globl .F.simulate_cache_workload
.F.simulate_cache_workload:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulate_cache_workload._0.entry.0:
  li t2, 10
  div t6, a0, t2                                                        # ir inst 1 fin
  li t2, 4
  rem t5, t6, t2                                                        # ir inst 2 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 3 fin
  bnez t6, .F.simulate_cache_workload._1.if.then.0
  j .F.simulate_cache_workload._2.if.else.0                             # ir inst 4 fin
.F.simulate_cache_workload._1.if.then.0:
  li a0, 90
  j .F.simulate_cache_workload.epilogue                                 # ir inst 5 fin
.F.simulate_cache_workload._2.if.else.0:
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 6 fin
  bnez t6, .F.simulate_cache_workload._3.if.then.1
  j .F.simulate_cache_workload._4.if.else.1                             # ir inst 7 fin
.F.simulate_cache_workload._3.if.then.1:
  li a0, 80
  j .F.simulate_cache_workload.epilogue                                 # ir inst 8 fin
.F.simulate_cache_workload._4.if.else.1:
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 9 fin
  bnez t6, .F.simulate_cache_workload._5.if.then.2
  j .F.simulate_cache_workload._6.if.else.2                             # ir inst 10 fin
.F.simulate_cache_workload._5.if.then.2:
  li a0, 60
  j .F.simulate_cache_workload.epilogue                                 # ir inst 11 fin
.F.simulate_cache_workload._6.if.else.2:
  li t2, 23
  mul t6, a0, t2                                                        # ir inst 12 fin
  li t2, 30
  rem t5, t6, t2                                                        # ir inst 13 fin
  addi t6, t5, 70                                                       # ir inst 14 fin
  addi t5, t6, -15                                                      # ir inst 15 fin
  mv a0, t5
  j .F.simulate_cache_workload.epilogue                                 # ir inst 16 fin
.F.simulate_cache_workload._7.if.exit.2:
  j .F.simulate_cache_workload._8.if.exit.1                             # ir inst 17 fin
.F.simulate_cache_workload._8.if.exit.1:
  j .F.simulate_cache_workload._9.if.exit.0                             # ir inst 18 fin
.F.simulate_cache_workload._9.if.exit.0:
.F.simulate_cache_workload.epilogue:
  ret

.globl .F.simulate_hash_workload
.F.simulate_hash_workload:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulate_hash_workload._0.entry.0:
  li t2, 50
  rem t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 10                                                       # ir inst 2 fin
  li t2, 5
  div t6, t5, t2                                                        # ir inst 3 fin
  li t1, 80
  sub t5, t1, t6                                                        # ir inst 4 fin
  mv a0, t5
  j .F.simulate_hash_workload.epilogue                                  # ir inst 5 fin
.F.simulate_hash_workload.epilogue:
  ret

.globl .F.simulate_queue_workload
.F.simulate_queue_workload:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulate_queue_workload._0.entry.0:
  li t2, 200
  rem t6, a0, t2                                                        # ir inst 1 fin
  addi t5, t6, 50                                                       # ir inst 2 fin
  li t2, 5
  rem t6, a0, t2                                                        # ir inst 3 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 4 fin
  bnez t4, .F.simulate_queue_workload._1.if.then.0
  j .F.simulate_queue_workload._2.if.else.0                             # ir inst 5 fin
.F.simulate_queue_workload._1.if.then.0:
  li t2, 20
  div t4, t5, t2                                                        # ir inst 6 fin
  li t1, 85
  sub t3, t1, t4                                                        # ir inst 7 fin
  mv a0, t3
  j .F.simulate_queue_workload.epilogue                                 # ir inst 8 fin
.F.simulate_queue_workload._2.if.else.0:
  li t2, 1
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 9 fin
  bnez t4, .F.simulate_queue_workload._3.if.then.1
  j .F.simulate_queue_workload._4.if.else.1                             # ir inst 10 fin
.F.simulate_queue_workload._3.if.then.1:
  li t2, 15
  div t6, t5, t2                                                        # ir inst 11 fin
  li t1, 85
  sub t4, t1, t6                                                        # ir inst 12 fin
  mv a0, t4
  j .F.simulate_queue_workload.epilogue                                 # ir inst 13 fin
.F.simulate_queue_workload._4.if.else.1:
  li t2, 25
  div t6, t5, t2                                                        # ir inst 14 fin
  li t1, 85
  sub t5, t1, t6                                                        # ir inst 15 fin
  mv a0, t5
  j .F.simulate_queue_workload.epilogue                                 # ir inst 16 fin
.F.simulate_queue_workload._5.if.exit.1:
  j .F.simulate_queue_workload._6.if.exit.0                             # ir inst 17 fin
.F.simulate_queue_workload._6.if.exit.0:
.F.simulate_queue_workload.epilogue:
  ret

.globl .F.compute_integrated_score
.F.compute_integrated_score:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.compute_integrated_score._0.entry.0:
  li t2, 3
  mul t6, a0, t2                                                        # ir inst 1 fin
  slli t5, a1, 2                                                        # ir inst 2 fin
  add t4, t6, t5                                                        # ir inst 3 fin
  slli t6, a2, 1                                                        # ir inst 4 fin
  add t5, t4, t6                                                        # ir inst 5 fin
  add t6, t5, a3                                                        # ir inst 6 fin
  li t2, 10
  div t5, t6, t2                                                        # ir inst 7 fin
  li t2, 90
  slt t6, t2, t5                                                        # ir inst 8 fin
  bnez t6, .F.compute_integrated_score._1.if.then.0
  j .F.compute_integrated_score._2.if.else.0                            # ir inst 9 fin
.F.compute_integrated_score._1.if.then.0:
  addi t6, t5, 10                                                       # ir inst 10 fin
  mv a0, t6
  j .F.compute_integrated_score.epilogue                                # ir inst 11 fin
.F.compute_integrated_score._2.if.else.0:
  li t2, 40
  slt t6, t5, t2                                                        # ir inst 12 fin
  bnez t6, .F.compute_integrated_score._3.if.then.1
  j .F.compute_integrated_score._4.if.else.1                            # ir inst 13 fin
.F.compute_integrated_score._3.if.then.1:
  addi t6, t5, -10                                                      # ir inst 14 fin
  mv a0, t6
  j .F.compute_integrated_score.epilogue                                # ir inst 15 fin
.F.compute_integrated_score._4.if.else.1:
  mv a0, t5
  j .F.compute_integrated_score.epilogue                                # ir inst 16 fin
.F.compute_integrated_score._5.if.exit.1:
  j .F.compute_integrated_score._6.if.exit.0                            # ir inst 17 fin
.F.compute_integrated_score._6.if.exit.0:
.F.compute_integrated_score.epilogue:
  ret

.globl .F.simulate_system_adaptation
.F.simulate_system_adaptation:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.simulate_system_adaptation._0.entry.0:
  li t2, 300
  rem t6, a0, t2                                                        # ir inst 1 fin
  li t2, 299
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 2 fin
  bnez t5, .F.simulate_system_adaptation._1.if.then.0
  j .F.simulate_system_adaptation._2.if.else.0                          # ir inst 3 fin
.F.simulate_system_adaptation._1.if.then.0:
# Phi connections
  li t6, 5
  j .F.simulate_system_adaptation._3.if.exit.0                          # ir inst 4 fin
.F.simulate_system_adaptation._2.if.else.0:
# Phi connections
  li t6, 0
  j .F.simulate_system_adaptation._3.if.exit.0                          # ir inst 5 fin
.F.simulate_system_adaptation._3.if.exit.0:
  li t2, 500
  rem t5, a0, t2                                                        # ir inst 7 fin
  li t2, 499
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 8 fin
  bnez t4, .F.simulate_system_adaptation._4.if.then.1
  j .F.simulate_system_adaptation._5.if.else.1                          # ir inst 9 fin
.F.simulate_system_adaptation._4.if.then.1:
  addi t5, t6, 8                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.simulate_system_adaptation._6.if.exit.1                          # ir inst 11 fin
.F.simulate_system_adaptation._5.if.else.1:
# Phi connections
  j .F.simulate_system_adaptation._6.if.exit.1                          # ir inst 12 fin
.F.simulate_system_adaptation._6.if.exit.1:
  li t2, 700
  rem t5, a0, t2                                                        # ir inst 14 fin
  li t2, 699
  xor t0, t5, t2
  sltiu t4, t0, 1                                                       # ir inst 15 fin
  bnez t4, .F.simulate_system_adaptation._7.if.then.2
  j .F.simulate_system_adaptation._8.if.else.2                          # ir inst 16 fin
.F.simulate_system_adaptation._7.if.then.2:
  addi t5, t6, 3                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.simulate_system_adaptation._9.if.exit.2                          # ir inst 18 fin
.F.simulate_system_adaptation._8.if.else.2:
# Phi connections
  j .F.simulate_system_adaptation._9.if.exit.2                          # ir inst 19 fin
.F.simulate_system_adaptation._9.if.exit.2:
  mv a0, t6
  j .F.simulate_system_adaptation.epilogue                              # ir inst 21 fin
.F.simulate_system_adaptation.epilogue:
  ret
