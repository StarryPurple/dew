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

.globl .F.init_vm
.F.init_vm:
# spill func args num: 0,             range:        0(sp) -        0(sp)
# local var size: 0,                  range:        0(sp) -        0(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
.F.init_vm._0.entry.0:
# Phi connections
  li t6, 0
  j .F.init_vm._1.while.cond.0                                          # ir inst 1 fin
.F.init_vm._1.while.cond.0:
  li t2, 16
  slt t5, t6, t2                                                        # ir inst 3 fin
  bnez t5, .F.init_vm._2.while.body.0
  j .F.init_vm._3.while.exit.0                                          # ir inst 4 fin
.F.init_vm._2.while.body.0:
  mv t5, t6                                                             # ir inst 5 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 6 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 7 fin
  addi t5, t6, 1                                                        # ir inst 8 fin
# Phi connections
  mv t6, t5
  j .F.init_vm._1.while.cond.0                                          # ir inst 9 fin
.F.init_vm._3.while.exit.0:
# Phi connections
  li t6, 0
  j .F.init_vm._4.while.cond.1                                          # ir inst 10 fin
.F.init_vm._4.while.cond.1:
  li t2, 2048
  slt t5, t6, t2                                                        # ir inst 12 fin
  bnez t5, .F.init_vm._5.while.body.1
  j .F.init_vm._6.while.exit.1                                          # ir inst 13 fin
.F.init_vm._5.while.body.1:
  mv t5, t6                                                             # ir inst 14 fin
  slli t2, t5, 2
  add t4, a1, t2                                                        # ir inst 15 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 16 fin
  addi t5, t6, 1                                                        # ir inst 17 fin
# Phi connections
  mv t6, t5
  j .F.init_vm._4.while.cond.1                                          # ir inst 18 fin
.F.init_vm._6.while.exit.1:
# Phi connections
  li t6, 0
  j .F.init_vm._7.while.cond.2                                          # ir inst 19 fin
.F.init_vm._7.while.cond.2:
  li t2, 256
  slt t5, t6, t2                                                        # ir inst 21 fin
  bnez t5, .F.init_vm._8.while.body.2
  j .F.init_vm._9.while.exit.2                                          # ir inst 22 fin
.F.init_vm._8.while.body.2:
  mv t5, t6                                                             # ir inst 23 fin
  slli t2, t5, 2
  add t4, a2, t2                                                        # ir inst 24 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 25 fin
  addi t5, t6, 1                                                        # ir inst 26 fin
# Phi connections
  mv t6, t5
  j .F.init_vm._7.while.cond.2                                          # ir inst 27 fin
.F.init_vm._9.while.exit.2:
  li t1, 0
  sw t1, 0(a3)                                                          # ir inst 28 fin
  li t1, 256
  sw t1, 0(a4)                                                          # ir inst 29 fin
  li t1, 0
  sb t1, 0(a5)                                                          # ir inst 30 fin
  li t1, 0
  sb t1, 0(a6)                                                          # ir inst 31 fin
  li t1, 0
  sb t1, 0(a7)                                                          # ir inst 32 fin
  j .F.init_vm.epilogue                                                 # ir inst 33 fin
.F.init_vm.epilogue:
  ret

.globl .F.load_program
.F.load_program:
# spill func args num: 0,             range:      672(sp) -      672(sp)
# local var size: 672,                range:        0(sp) -      672(sp)
# return addr size: 0,                range:        0(sp) -        0(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  addi sp, sp, -672
.F.load_program._0.entry.0:
  addi t1, sp, 0
  addi t6, t1, 0                                                        # ir inst 2 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 3 fin
  addi t1, sp, 0
  addi t6, t1, 4                                                        # ir inst 4 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 5 fin
  addi t1, sp, 0
  addi t6, t1, 8                                                        # ir inst 6 fin
  li t1, 15
  sw t1, 0(t6)                                                          # ir inst 7 fin
  addi t1, sp, 0
  addi t6, t1, 12                                                       # ir inst 8 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 9 fin
  addi t1, sp, 0
  addi t6, t1, 16                                                       # ir inst 10 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 11 fin
  addi t1, sp, 0
  addi t6, t1, 20                                                       # ir inst 12 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 13 fin
  addi t1, sp, 0
  addi t6, t1, 24                                                       # ir inst 14 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 15 fin
  addi t1, sp, 0
  addi t6, t1, 28                                                       # ir inst 16 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 17 fin
  addi t1, sp, 0
  addi t6, t1, 32                                                       # ir inst 18 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 19 fin
  addi t1, sp, 0
  addi t6, t1, 36                                                       # ir inst 20 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 21 fin
  addi t1, sp, 0
  addi t6, t1, 40                                                       # ir inst 22 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 23 fin
  addi t1, sp, 0
  addi t6, t1, 44                                                       # ir inst 24 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 25 fin
  addi t1, sp, 0
  addi t6, t1, 48                                                       # ir inst 26 fin
  li t1, 25
  sw t1, 0(t6)                                                          # ir inst 27 fin
  addi t1, sp, 0
  addi t6, t1, 52                                                       # ir inst 28 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 29 fin
  addi t1, sp, 0
  addi t6, t1, 56                                                       # ir inst 30 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 31 fin
  addi t1, sp, 0
  addi t6, t1, 60                                                       # ir inst 32 fin
  li t1, 18
  sw t1, 0(t6)                                                          # ir inst 33 fin
  addi t1, sp, 0
  addi t6, t1, 64                                                       # ir inst 34 fin
  li t1, 36
  sw t1, 0(t6)                                                          # ir inst 35 fin
  addi t1, sp, 0
  addi t6, t1, 68                                                       # ir inst 36 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 37 fin
  addi t1, sp, 0
  addi t6, t1, 72                                                       # ir inst 38 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 39 fin
  addi t1, sp, 0
  addi t6, t1, 76                                                       # ir inst 40 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 41 fin
  addi t1, sp, 0
  addi t6, t1, 80                                                       # ir inst 42 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 43 fin
  addi t1, sp, 0
  addi t6, t1, 84                                                       # ir inst 44 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 45 fin
  addi t1, sp, 0
  addi t6, t1, 88                                                       # ir inst 46 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 47 fin
  addi t1, sp, 0
  addi t6, t1, 92                                                       # ir inst 48 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 49 fin
  addi t1, sp, 0
  addi t6, t1, 96                                                       # ir inst 50 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 51 fin
  addi t1, sp, 0
  addi t6, t1, 100                                                      # ir inst 52 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 53 fin
  addi t1, sp, 0
  addi t6, t1, 104                                                      # ir inst 54 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 55 fin
  addi t1, sp, 0
  addi t6, t1, 108                                                      # ir inst 56 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 57 fin
  addi t1, sp, 0
  addi t6, t1, 112                                                      # ir inst 58 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 59 fin
  addi t1, sp, 0
  addi t6, t1, 116                                                      # ir inst 60 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 61 fin
  addi t1, sp, 0
  addi t6, t1, 120                                                      # ir inst 62 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 63 fin
  addi t1, sp, 0
  addi t6, t1, 124                                                      # ir inst 64 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 65 fin
  addi t1, sp, 0
  addi t6, t1, 128                                                      # ir inst 66 fin
  li t1, 25
  sw t1, 0(t6)                                                          # ir inst 67 fin
  addi t1, sp, 0
  addi t6, t1, 132                                                      # ir inst 68 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 69 fin
  addi t1, sp, 0
  addi t6, t1, 136                                                      # ir inst 70 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 71 fin
  addi t1, sp, 0
  addi t6, t1, 140                                                      # ir inst 72 fin
  li t1, 19
  sw t1, 0(t6)                                                          # ir inst 73 fin
  addi t1, sp, 0
  addi t6, t1, 144                                                      # ir inst 74 fin
  li t1, 21
  sw t1, 0(t6)                                                          # ir inst 75 fin
  addi t1, sp, 0
  addi t6, t1, 148                                                      # ir inst 76 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 77 fin
  addi t1, sp, 0
  addi t6, t1, 152                                                      # ir inst 78 fin
  li t1, 26
  sw t1, 0(t6)                                                          # ir inst 79 fin
  addi t1, sp, 0
  addi t6, t1, 156                                                      # ir inst 80 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 81 fin
  addi t1, sp, 0
  addi t6, t1, 160                                                      # ir inst 82 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 83 fin
  addi t1, sp, 0
  addi t6, t1, 164                                                      # ir inst 84 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 85 fin
  addi t1, sp, 0
  addi t6, t1, 168                                                      # ir inst 86 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 87 fin
  addi t1, sp, 0
  addi t6, t1, 172                                                      # ir inst 88 fin
  li t1, 10
  sw t1, 0(t6)                                                          # ir inst 89 fin
  addi t1, sp, 0
  addi t6, t1, 176                                                      # ir inst 90 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 91 fin
  addi t1, sp, 0
  addi t6, t1, 180                                                      # ir inst 92 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 93 fin
  addi t1, sp, 0
  addi t6, t1, 184                                                      # ir inst 94 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 95 fin
  addi t1, sp, 0
  addi t6, t1, 188                                                      # ir inst 96 fin
  li t1, 22
  sw t1, 0(t6)                                                          # ir inst 97 fin
  addi t1, sp, 0
  addi t6, t1, 192                                                      # ir inst 98 fin
  li t1, 81
  sw t1, 0(t6)                                                          # ir inst 99 fin
  addi t1, sp, 0
  addi t6, t1, 196                                                      # ir inst 100 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 101 fin
  addi t1, sp, 0
  addi t6, t1, 200                                                      # ir inst 102 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 103 fin
  addi t1, sp, 0
  addi t6, t1, 204                                                      # ir inst 104 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 105 fin
  addi t1, sp, 0
  addi t6, t1, 208                                                      # ir inst 106 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 107 fin
  addi t1, sp, 0
  addi t6, t1, 212                                                      # ir inst 108 fin
  li t1, 26
  sw t1, 0(t6)                                                          # ir inst 109 fin
  addi t1, sp, 0
  addi t6, t1, 216                                                      # ir inst 110 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 111 fin
  addi t1, sp, 0
  addi t6, t1, 220                                                      # ir inst 112 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 113 fin
  addi t1, sp, 0
  addi t6, t1, 224                                                      # ir inst 114 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 115 fin
  addi t1, sp, 0
  addi t6, t1, 228                                                      # ir inst 116 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 117 fin
  addi t1, sp, 0
  addi t6, t1, 232                                                      # ir inst 118 fin
  li t1, 12345
  sw t1, 0(t6)                                                          # ir inst 119 fin
  addi t1, sp, 0
  addi t6, t1, 236                                                      # ir inst 120 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 121 fin
  addi t1, sp, 0
  addi t6, t1, 240                                                      # ir inst 122 fin
  li t1, 6
  sw t1, 0(t6)                                                          # ir inst 123 fin
  addi t1, sp, 0
  addi t6, t1, 244                                                      # ir inst 124 fin
  li t1, 54321
  sw t1, 0(t6)                                                          # ir inst 125 fin
  addi t1, sp, 0
  addi t6, t1, 248                                                      # ir inst 126 fin
  li t1, 7
  sw t1, 0(t6)                                                          # ir inst 127 fin
  addi t1, sp, 0
  addi t6, t1, 252                                                      # ir inst 128 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 129 fin
  addi t1, sp, 0
  addi t6, t1, 256                                                      # ir inst 130 fin
  li t1, 6
  sw t1, 0(t6)                                                          # ir inst 131 fin
  addi t1, sp, 0
  addi t6, t1, 260                                                      # ir inst 132 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 133 fin
  addi t1, sp, 0
  addi t6, t1, 264                                                      # ir inst 134 fin
  li t1, 26
  sw t1, 0(t6)                                                          # ir inst 135 fin
  addi t1, sp, 0
  addi t6, t1, 268                                                      # ir inst 136 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 137 fin
  addi t1, sp, 0
  addi t6, t1, 272                                                      # ir inst 138 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 139 fin
  addi t1, sp, 0
  addi t6, t1, 276                                                      # ir inst 140 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 141 fin
  addi t1, sp, 0
  addi t6, t1, 280                                                      # ir inst 142 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 143 fin
  addi t1, sp, 0
  addi t6, t1, 284                                                      # ir inst 144 fin
  li t1, 12345
  sw t1, 0(t6)                                                          # ir inst 145 fin
  addi t1, sp, 0
  addi t6, t1, 288                                                      # ir inst 146 fin
  li t1, 8
  sw t1, 0(t6)                                                          # ir inst 147 fin
  addi t1, sp, 0
  addi t6, t1, 292                                                      # ir inst 148 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 149 fin
  addi t1, sp, 0
  addi t6, t1, 296                                                      # ir inst 150 fin
  li t1, 6
  sw t1, 0(t6)                                                          # ir inst 151 fin
  addi t1, sp, 0
  addi t6, t1, 300                                                      # ir inst 152 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 153 fin
  addi t1, sp, 0
  addi t6, t1, 304                                                      # ir inst 154 fin
  li t1, 26
  sw t1, 0(t6)                                                          # ir inst 155 fin
  addi t1, sp, 0
  addi t6, t1, 308                                                      # ir inst 156 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 157 fin
  addi t1, sp, 0
  addi t6, t1, 312                                                      # ir inst 158 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 159 fin
  addi t1, sp, 0
  addi t6, t1, 316                                                      # ir inst 160 fin
  li t1, 11
  sw t1, 0(t6)                                                          # ir inst 161 fin
  addi t1, sp, 0
  addi t6, t1, 320                                                      # ir inst 162 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 163 fin
  addi t1, sp, 0
  addi t6, t1, 324                                                      # ir inst 164 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 165 fin
  addi t1, sp, 0
  addi t6, t1, 328                                                      # ir inst 166 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 167 fin
  addi t1, sp, 0
  addi t6, t1, 332                                                      # ir inst 168 fin
  li t1, 26
  sw t1, 0(t6)                                                          # ir inst 169 fin
  addi t1, sp, 0
  addi t6, t1, 336                                                      # ir inst 170 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 171 fin
  addi t1, sp, 0
  addi t6, t1, 340                                                      # ir inst 172 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 173 fin
  addi t1, sp, 0
  addi t6, t1, 344                                                      # ir inst 174 fin
  li t1, 12
  sw t1, 0(t6)                                                          # ir inst 175 fin
  addi t1, sp, 0
  addi t6, t1, 348                                                      # ir inst 176 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 177 fin
  addi t1, sp, 0
  addi t6, t1, 352                                                      # ir inst 178 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 179 fin
  addi t1, sp, 0
  addi t6, t1, 356                                                      # ir inst 180 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 181 fin
  addi t1, sp, 0
  addi t6, t1, 360                                                      # ir inst 182 fin
  li t1, 26
  sw t1, 0(t6)                                                          # ir inst 183 fin
  addi t1, sp, 0
  addi t6, t1, 364                                                      # ir inst 184 fin
  li t1, 5
  sw t1, 0(t6)                                                          # ir inst 185 fin
  addi t1, sp, 0
  addi t6, t1, 368                                                      # ir inst 186 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 187 fin
  addi t1, sp, 0
  addi t6, t1, 372                                                      # ir inst 188 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 189 fin
  addi t1, sp, 0
  addi t6, t1, 376                                                      # ir inst 190 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 191 fin
  addi t1, sp, 0
  addi t6, t1, 380                                                      # ir inst 192 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 193 fin
  addi t1, sp, 0
  addi t6, t1, 384                                                      # ir inst 194 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 195 fin
  addi t1, sp, 0
  addi t6, t1, 388                                                      # ir inst 196 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 197 fin
  addi t1, sp, 0
  addi t6, t1, 392                                                      # ir inst 198 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 199 fin
  addi t1, sp, 0
  addi t6, t1, 396                                                      # ir inst 200 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 201 fin
  addi t1, sp, 0
  addi t6, t1, 400                                                      # ir inst 202 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 203 fin
  addi t1, sp, 0
  addi t6, t1, 404                                                      # ir inst 204 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 205 fin
  addi t1, sp, 0
  addi t6, t1, 408                                                      # ir inst 206 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 207 fin
  addi t1, sp, 0
  addi t6, t1, 412                                                      # ir inst 208 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 209 fin
  addi t1, sp, 0
  addi t6, t1, 416                                                      # ir inst 210 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 211 fin
  addi t1, sp, 0
  addi t6, t1, 420                                                      # ir inst 212 fin
  li t1, 15
  sw t1, 0(t6)                                                          # ir inst 213 fin
  addi t1, sp, 0
  addi t6, t1, 424                                                      # ir inst 214 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 215 fin
  addi t1, sp, 0
  addi t6, t1, 428                                                      # ir inst 216 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 217 fin
  addi t1, sp, 0
  addi t6, t1, 432                                                      # ir inst 218 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 219 fin
  addi t1, sp, 0
  addi t6, t1, 436                                                      # ir inst 220 fin
  li t1, 25
  sw t1, 0(t6)                                                          # ir inst 221 fin
  addi t1, sp, 0
  addi t6, t1, 440                                                      # ir inst 222 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 223 fin
  addi t1, sp, 0
  addi t6, t1, 444                                                      # ir inst 224 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 225 fin
  addi t1, sp, 0
  addi t6, t1, 448                                                      # ir inst 226 fin
  li t1, 20
  sw t1, 0(t6)                                                          # ir inst 227 fin
  addi t1, sp, 0
  addi t6, t1, 452                                                      # ir inst 228 fin
  li t1, 108
  sw t1, 0(t6)                                                          # ir inst 229 fin
  addi t1, sp, 0
  addi t6, t1, 456                                                      # ir inst 230 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 231 fin
  addi t1, sp, 0
  addi t6, t1, 460                                                      # ir inst 232 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 233 fin
  addi t1, sp, 0
  addi t6, t1, 464                                                      # ir inst 234 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 235 fin
  addi t1, sp, 0
  addi t6, t1, 468                                                      # ir inst 236 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 237 fin
  addi t1, sp, 0
  addi t6, t1, 472                                                      # ir inst 238 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 239 fin
  addi t1, sp, 0
  addi t6, t1, 476                                                      # ir inst 240 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 241 fin
  addi t1, sp, 0
  addi t6, t1, 480                                                      # ir inst 242 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 243 fin
  addi t1, sp, 0
  addi t6, t1, 484                                                      # ir inst 244 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 245 fin
  addi t1, sp, 0
  addi t6, t1, 488                                                      # ir inst 246 fin
  li t1, 22
  sw t1, 0(t6)                                                          # ir inst 247 fin
  addi t1, sp, 0
  addi t6, t1, 492                                                      # ir inst 248 fin
  li t1, 81
  sw t1, 0(t6)                                                          # ir inst 249 fin
  addi t1, sp, 0
  addi t6, t1, 496                                                      # ir inst 250 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 251 fin
  addi t1, sp, 0
  addi t6, t1, 500                                                      # ir inst 252 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 253 fin
  addi t1, sp, 0
  addi t6, t1, 504                                                      # ir inst 254 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 255 fin
  addi t1, sp, 0
  addi t6, t1, 508                                                      # ir inst 256 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 257 fin
  addi t1, sp, 0
  addi t6, t1, 512                                                      # ir inst 258 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 259 fin
  addi t1, sp, 0
  addi t6, t1, 516                                                      # ir inst 260 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 261 fin
  addi t1, sp, 0
  addi t6, t1, 520                                                      # ir inst 262 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 263 fin
  addi t1, sp, 0
  addi t6, t1, 524                                                      # ir inst 264 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 265 fin
  addi t1, sp, 0
  addi t6, t1, 528                                                      # ir inst 266 fin
  li t1, 13
  sw t1, 0(t6)                                                          # ir inst 267 fin
  addi t1, sp, 0
  addi t6, t1, 532                                                      # ir inst 268 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 269 fin
  addi t1, sp, 0
  addi t6, t1, 536                                                      # ir inst 270 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 271 fin
  addi t1, sp, 0
  addi t6, t1, 540                                                      # ir inst 272 fin
  li t1, 22
  sw t1, 0(t6)                                                          # ir inst 273 fin
  addi t1, sp, 0
  addi t6, t1, 544                                                      # ir inst 274 fin
  li t1, 81
  sw t1, 0(t6)                                                          # ir inst 275 fin
  addi t1, sp, 0
  addi t6, t1, 548                                                      # ir inst 276 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 277 fin
  addi t1, sp, 0
  addi t6, t1, 552                                                      # ir inst 278 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 279 fin
  addi t1, sp, 0
  addi t6, t1, 556                                                      # ir inst 280 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 281 fin
  addi t1, sp, 0
  addi t6, t1, 560                                                      # ir inst 282 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 283 fin
  addi t1, sp, 0
  addi t6, t1, 564                                                      # ir inst 284 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 285 fin
  addi t1, sp, 0
  addi t6, t1, 568                                                      # ir inst 286 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 287 fin
  addi t1, sp, 0
  addi t6, t1, 572                                                      # ir inst 288 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 289 fin
  addi t1, sp, 0
  addi t6, t1, 576                                                      # ir inst 290 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 291 fin
  addi t1, sp, 0
  addi t6, t1, 580                                                      # ir inst 292 fin
  li t1, 17
  sw t1, 0(t6)                                                          # ir inst 293 fin
  addi t1, sp, 0
  addi t6, t1, 584                                                      # ir inst 294 fin
  li t1, 114
  sw t1, 0(t6)                                                          # ir inst 295 fin
  addi t1, sp, 0
  addi t6, t1, 588                                                      # ir inst 296 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 297 fin
  addi t1, sp, 0
  addi t6, t1, 592                                                      # ir inst 298 fin
  li t1, 15
  sw t1, 0(t6)                                                          # ir inst 299 fin
  addi t1, sp, 0
  addi t6, t1, 596                                                      # ir inst 300 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 301 fin
  addi t1, sp, 0
  addi t6, t1, 600                                                      # ir inst 302 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 303 fin
  addi t1, sp, 0
  addi t6, t1, 604                                                      # ir inst 304 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 305 fin
  addi t1, sp, 0
  addi t6, t1, 608                                                      # ir inst 306 fin
  li t1, 16
  sw t1, 0(t6)                                                          # ir inst 307 fin
  addi t1, sp, 0
  addi t6, t1, 612                                                      # ir inst 308 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 309 fin
  addi t1, sp, 0
  addi t6, t1, 616                                                      # ir inst 310 fin
  li t1, 1
  sw t1, 0(t6)                                                          # ir inst 311 fin
  addi t1, sp, 0
  addi t6, t1, 620                                                      # ir inst 312 fin
  li t1, 4
  sw t1, 0(t6)                                                          # ir inst 313 fin
  addi t1, sp, 0
  addi t6, t1, 624                                                      # ir inst 314 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 315 fin
  addi t1, sp, 0
  addi t6, t1, 628                                                      # ir inst 316 fin
  li t1, 3
  sw t1, 0(t6)                                                          # ir inst 317 fin
  addi t1, sp, 0
  addi t6, t1, 632                                                      # ir inst 318 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 319 fin
  addi t1, sp, 0
  addi t6, t1, 636                                                      # ir inst 320 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 321 fin
  addi t1, sp, 0
  addi t6, t1, 640                                                      # ir inst 322 fin
  li t1, 2
  sw t1, 0(t6)                                                          # ir inst 323 fin
  addi t1, sp, 0
  addi t6, t1, 644                                                      # ir inst 324 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 325 fin
  addi t1, sp, 0
  addi t6, t1, 648                                                      # ir inst 326 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 327 fin
  addi t1, sp, 0
  addi t6, t1, 652                                                      # ir inst 328 fin
  li t1, 14
  sw t1, 0(t6)                                                          # ir inst 329 fin
  addi t1, sp, 0
  addi t6, t1, 656                                                      # ir inst 330 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 331 fin
  addi t1, sp, 0
  addi t6, t1, 660                                                      # ir inst 332 fin
  li t1, 23
  sw t1, 0(t6)                                                          # ir inst 333 fin
  addi t1, sp, 0
  addi t6, t1, 664                                                      # ir inst 334 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 335 fin
  addi t1, sp, 0
  addi t6, t1, 668                                                      # ir inst 336 fin
  li t1, 0
  sw t1, 0(t6)                                                          # ir inst 337 fin
# Phi connections
  li t6, 0
  j .F.load_program._1.while.cond.0                                     # ir inst 338 fin
.F.load_program._1.while.cond.0:
  li t2, 168
  slt t5, t6, t2                                                        # ir inst 340 fin
  bnez t5, .F.load_program._2.while.body.0
  j .F.load_program._3.while.exit.0                                     # ir inst 341 fin
.F.load_program._2.while.body.0:
  mv t5, t6                                                             # ir inst 342 fin
  slli t2, t5, 2
  add t4, a0, t2                                                        # ir inst 343 fin
  mv t5, t6                                                             # ir inst 344 fin
  slli t2, t5, 2
  addi t1, sp, 0
  add t3, t1, t2                                                        # ir inst 345 fin
  lw t5, 0(t3)                                                          # ir inst 346 fin
  sw t5, 0(t4)                                                          # ir inst 347 fin
  addi t5, t6, 1                                                        # ir inst 348 fin
# Phi connections
  mv t6, t5
  j .F.load_program._1.while.cond.0                                     # ir inst 349 fin
.F.load_program._3.while.exit.0:
  j .F.load_program.epilogue                                            # ir inst 350 fin
.F.load_program.epilogue:
  addi sp, sp, 672
  ret

.globl .F.fetch_decode_execute
.F.fetch_decode_execute:
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
.F.fetch_decode_execute._0.entry.0:
  j .F.fetch_decode_execute._1.while.cond.0                             # ir inst 1 fin
.F.fetch_decode_execute._1.while.cond.0:
  lb t6, 0(a7)                                                          # ir inst 2 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 3 fin
  bnez t5, .F.fetch_decode_execute._2.while.body.0
  j .F.fetch_decode_execute._156.while.exit.0                           # ir inst 4 fin
.F.fetch_decode_execute._2.while.body.0:
  lw t6, 0(a3)                                                          # ir inst 5 fin
  li t2, 0
  slt t5, t6, t2                                                        # ir inst 6 fin
  bnez t5, .F.fetch_decode_execute._3.lazy.then.0
  j .F.fetch_decode_execute._4.lazy.else.0                              # ir inst 7 fin
.F.fetch_decode_execute._3.lazy.then.0:
# Phi connections
  li t6, 1
  j .F.fetch_decode_execute._5.lazy.exit.0                              # ir inst 8 fin
.F.fetch_decode_execute._4.lazy.else.0:
  lw t6, 0(a3)                                                          # ir inst 9 fin
  li t2, 2048
  slt t0, t6, t2
  xori t5, t0, 1                                                        # ir inst 10 fin
# Phi connections
  mv t6, t5
  j .F.fetch_decode_execute._5.lazy.exit.0                              # ir inst 11 fin
.F.fetch_decode_execute._5.lazy.exit.0:
  bnez t6, .F.fetch_decode_execute._6.if.then.0
  j .F.fetch_decode_execute._7.if.else.0                                # ir inst 13 fin
.F.fetch_decode_execute._6.if.then.0:
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 14 fin
  j .F.fetch_decode_execute._8.if.exit.0                                # ir inst 15 fin
.F.fetch_decode_execute._7.if.else.0:
  j .F.fetch_decode_execute._8.if.exit.0                                # ir inst 16 fin
.F.fetch_decode_execute._8.if.exit.0:
  lb t6, 0(a7)                                                          # ir inst 17 fin
  li t2, 1
  xor t0, t6, t2
  sltiu t5, t0, 1                                                       # ir inst 18 fin
  bnez t5, .F.fetch_decode_execute._9.if.then.1
  j .F.fetch_decode_execute._10.if.else.1                               # ir inst 19 fin
.F.fetch_decode_execute._9.if.then.1:
  j .F.fetch_decode_execute._155.if.exit.1                              # ir inst 20 fin
.F.fetch_decode_execute._10.if.else.1:
  lw t6, 0(a3)                                                          # ir inst 21 fin
  mv t5, t6                                                             # ir inst 22 fin
  slli t2, t5, 2
  add t6, a1, t2                                                        # ir inst 23 fin
  lw t5, 0(t6)                                                          # ir inst 24 fin
  lw t6, 0(a3)                                                          # ir inst 25 fin
  addi t4, t6, 1                                                        # ir inst 26 fin
  sw t4, 0(a3)                                                          # ir inst 27 fin
  li t2, 0
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 28 fin
  bnez t6, .F.fetch_decode_execute._11.if.then.2
  j .F.fetch_decode_execute._12.if.else.2                               # ir inst 29 fin
.F.fetch_decode_execute._11.if.then.2:
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 30 fin
  j .F.fetch_decode_execute._154.if.exit.2                              # ir inst 31 fin
.F.fetch_decode_execute._12.if.else.2:
  li t2, 1
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 32 fin
  bnez t6, .F.fetch_decode_execute._13.if.then.3
  j .F.fetch_decode_execute._14.if.else.3                               # ir inst 33 fin
.F.fetch_decode_execute._13.if.then.3:
  lw t6, 0(a3)                                                          # ir inst 34 fin
  mv t4, t6                                                             # ir inst 35 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 36 fin
  lw t4, 0(t6)                                                          # ir inst 37 fin
  lw t6, 0(a3)                                                          # ir inst 38 fin
  mv t3, t6                                                             # ir inst 39 fin
  addi t6, t3, 1                                                        # ir inst 40 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 41 fin
  lw t6, 0(t3)                                                          # ir inst 42 fin
  mv t3, t4                                                             # ir inst 43 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 44 fin
  mv t3, t6                                                             # ir inst 45 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 46 fin
  lw t3, 0(t6)                                                          # ir inst 47 fin
  sw t3, 0(t4)                                                          # ir inst 48 fin
  lw t6, 0(a3)                                                          # ir inst 49 fin
  addi t4, t6, 2                                                        # ir inst 50 fin
  sw t4, 0(a3)                                                          # ir inst 51 fin
  j .F.fetch_decode_execute._153.if.exit.3                              # ir inst 52 fin
.F.fetch_decode_execute._14.if.else.3:
  li t2, 2
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 53 fin
  bnez t6, .F.fetch_decode_execute._15.if.then.4
  j .F.fetch_decode_execute._16.if.else.4                               # ir inst 54 fin
.F.fetch_decode_execute._15.if.then.4:
  lw t6, 0(a3)                                                          # ir inst 55 fin
  mv t4, t6                                                             # ir inst 56 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 57 fin
  lw t4, 0(t6)                                                          # ir inst 58 fin
  lw t6, 0(a3)                                                          # ir inst 59 fin
  mv t3, t6                                                             # ir inst 60 fin
  addi t6, t3, 1                                                        # ir inst 61 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 62 fin
  lw t6, 0(t3)                                                          # ir inst 63 fin
  mv t3, t4                                                             # ir inst 64 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 65 fin
  sw t6, 0(t4)                                                          # ir inst 66 fin
  lw t6, 0(a3)                                                          # ir inst 67 fin
  addi t4, t6, 2                                                        # ir inst 68 fin
  sw t4, 0(a3)                                                          # ir inst 69 fin
  j .F.fetch_decode_execute._152.if.exit.4                              # ir inst 70 fin
.F.fetch_decode_execute._16.if.else.4:
  li t2, 3
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 71 fin
  bnez t6, .F.fetch_decode_execute._17.if.then.5
  j .F.fetch_decode_execute._36.if.else.5                               # ir inst 72 fin
.F.fetch_decode_execute._17.if.then.5:
  lw t6, 0(a3)                                                          # ir inst 73 fin
  mv t4, t6                                                             # ir inst 74 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 75 fin
  lw t4, 0(t6)                                                          # ir inst 76 fin
  lw t6, 0(a3)                                                          # ir inst 77 fin
  mv t3, t6                                                             # ir inst 78 fin
  addi t6, t3, 1                                                        # ir inst 79 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 80 fin
  lw t6, 0(t3)                                                          # ir inst 81 fin
  mv t3, t4                                                             # ir inst 82 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 83 fin
  lw t3, 0(s11)                                                         # ir inst 84 fin
  mv s11, t6                                                            # ir inst 85 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 86 fin
  lw s11, 0(s10)                                                        # ir inst 87 fin
  add s10, t3, s11                                                      # ir inst 88 fin
  mv t3, t4                                                             # ir inst 89 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 90 fin
  lw t3, 0(s11)                                                         # ir inst 91 fin
  li t2, 0
  slt s11, t2, t3                                                       # ir inst 92 fin
  bnez s11, .F.fetch_decode_execute._18.lazy.then.1
  j .F.fetch_decode_execute._19.lazy.else.1                             # ir inst 93 fin
.F.fetch_decode_execute._18.lazy.then.1:
  mv t3, t6                                                             # ir inst 94 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 95 fin
  lw t3, 0(s11)                                                         # ir inst 96 fin
  li t2, 0
  slt s11, t2, t3                                                       # ir inst 97 fin
# Phi connections
  mv t3, s11
  j .F.fetch_decode_execute._20.lazy.exit.1                             # ir inst 98 fin
.F.fetch_decode_execute._19.lazy.else.1:
# Phi connections
  li t3, 0
  j .F.fetch_decode_execute._20.lazy.exit.1                             # ir inst 99 fin
.F.fetch_decode_execute._20.lazy.exit.1:
  bnez t3, .F.fetch_decode_execute._21.lazy.then.2
  j .F.fetch_decode_execute._22.lazy.else.2                             # ir inst 101 fin
.F.fetch_decode_execute._21.lazy.then.2:
  li t2, 0
  slt t3, s10, t2                                                       # ir inst 102 fin
# Phi connections
  j .F.fetch_decode_execute._23.lazy.exit.2                             # ir inst 103 fin
.F.fetch_decode_execute._22.lazy.else.2:
# Phi connections
  li t3, 0
  j .F.fetch_decode_execute._23.lazy.exit.2                             # ir inst 104 fin
.F.fetch_decode_execute._23.lazy.exit.2:
  bnez t3, .F.fetch_decode_execute._24.if.then.6
  j .F.fetch_decode_execute._25.if.else.6                               # ir inst 106 fin
.F.fetch_decode_execute._24.if.then.6:
  li t1, 1
  sb t1, 0(a6)                                                          # ir inst 107 fin
  j .F.fetch_decode_execute._35.if.exit.6                               # ir inst 108 fin
.F.fetch_decode_execute._25.if.else.6:
  mv t3, t4                                                             # ir inst 109 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 110 fin
  lw t3, 0(s11)                                                         # ir inst 111 fin
  li t2, 0
  slt s11, t3, t2                                                       # ir inst 112 fin
  bnez s11, .F.fetch_decode_execute._26.lazy.then.3
  j .F.fetch_decode_execute._27.lazy.else.3                             # ir inst 113 fin
.F.fetch_decode_execute._26.lazy.then.3:
  mv t3, t6                                                             # ir inst 114 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 115 fin
  lw t3, 0(t6)                                                          # ir inst 116 fin
  li t2, 0
  slt t6, t3, t2                                                        # ir inst 117 fin
# Phi connections
  j .F.fetch_decode_execute._28.lazy.exit.3                             # ir inst 118 fin
.F.fetch_decode_execute._27.lazy.else.3:
# Phi connections
  li t6, 0
  j .F.fetch_decode_execute._28.lazy.exit.3                             # ir inst 119 fin
.F.fetch_decode_execute._28.lazy.exit.3:
  bnez t6, .F.fetch_decode_execute._29.lazy.then.4
  j .F.fetch_decode_execute._30.lazy.else.4                             # ir inst 121 fin
.F.fetch_decode_execute._29.lazy.then.4:
  li t2, 0
  slt t6, t2, s10                                                       # ir inst 122 fin
# Phi connections
  j .F.fetch_decode_execute._31.lazy.exit.4                             # ir inst 123 fin
.F.fetch_decode_execute._30.lazy.else.4:
# Phi connections
  li t6, 0
  j .F.fetch_decode_execute._31.lazy.exit.4                             # ir inst 124 fin
.F.fetch_decode_execute._31.lazy.exit.4:
  bnez t6, .F.fetch_decode_execute._32.if.then.7
  j .F.fetch_decode_execute._33.if.else.7                               # ir inst 126 fin
.F.fetch_decode_execute._32.if.then.7:
  li t1, 1
  sb t1, 0(a6)                                                          # ir inst 127 fin
  j .F.fetch_decode_execute._34.if.exit.7                               # ir inst 128 fin
.F.fetch_decode_execute._33.if.else.7:
  li t1, 0
  sb t1, 0(a6)                                                          # ir inst 129 fin
  j .F.fetch_decode_execute._34.if.exit.7                               # ir inst 130 fin
.F.fetch_decode_execute._34.if.exit.7:
  j .F.fetch_decode_execute._35.if.exit.6                               # ir inst 131 fin
.F.fetch_decode_execute._35.if.exit.6:
  mv t6, t4                                                             # ir inst 132 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 133 fin
  sw s10, 0(t4)                                                         # ir inst 134 fin
  li t2, 0
  xor t0, s10, t2
  sltiu t6, t0, 1                                                       # ir inst 135 fin
  sb t6, 0(a5)                                                          # ir inst 136 fin
  lw t6, 0(a3)                                                          # ir inst 137 fin
  addi t4, t6, 2                                                        # ir inst 138 fin
  sw t4, 0(a3)                                                          # ir inst 139 fin
  j .F.fetch_decode_execute._151.if.exit.5                              # ir inst 140 fin
.F.fetch_decode_execute._36.if.else.5:
  li t2, 4
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 141 fin
  bnez t6, .F.fetch_decode_execute._37.if.then.8
  j .F.fetch_decode_execute._56.if.else.8                               # ir inst 142 fin
.F.fetch_decode_execute._37.if.then.8:
  lw t6, 0(a3)                                                          # ir inst 143 fin
  mv t4, t6                                                             # ir inst 144 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 145 fin
  lw t4, 0(t6)                                                          # ir inst 146 fin
  lw t6, 0(a3)                                                          # ir inst 147 fin
  mv t3, t6                                                             # ir inst 148 fin
  addi t6, t3, 1                                                        # ir inst 149 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 150 fin
  lw t6, 0(t3)                                                          # ir inst 151 fin
  mv t3, t4                                                             # ir inst 152 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 153 fin
  lw t3, 0(s11)                                                         # ir inst 154 fin
  mv s11, t6                                                            # ir inst 155 fin
  slli t2, s11, 2
  add s10, a0, t2                                                       # ir inst 156 fin
  lw s11, 0(s10)                                                        # ir inst 157 fin
  sub s10, t3, s11                                                      # ir inst 158 fin
  mv t3, t4                                                             # ir inst 159 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 160 fin
  lw t3, 0(s11)                                                         # ir inst 161 fin
  li t2, 0
  slt s11, t2, t3                                                       # ir inst 162 fin
  bnez s11, .F.fetch_decode_execute._38.lazy.then.5
  j .F.fetch_decode_execute._39.lazy.else.5                             # ir inst 163 fin
.F.fetch_decode_execute._38.lazy.then.5:
  mv t3, t6                                                             # ir inst 164 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 165 fin
  lw t3, 0(s11)                                                         # ir inst 166 fin
  li t2, 0
  slt s11, t3, t2                                                       # ir inst 167 fin
# Phi connections
  mv t3, s11
  j .F.fetch_decode_execute._40.lazy.exit.5                             # ir inst 168 fin
.F.fetch_decode_execute._39.lazy.else.5:
# Phi connections
  li t3, 0
  j .F.fetch_decode_execute._40.lazy.exit.5                             # ir inst 169 fin
.F.fetch_decode_execute._40.lazy.exit.5:
  bnez t3, .F.fetch_decode_execute._41.lazy.then.6
  j .F.fetch_decode_execute._42.lazy.else.6                             # ir inst 171 fin
.F.fetch_decode_execute._41.lazy.then.6:
  li t2, 0
  slt t3, s10, t2                                                       # ir inst 172 fin
# Phi connections
  j .F.fetch_decode_execute._43.lazy.exit.6                             # ir inst 173 fin
.F.fetch_decode_execute._42.lazy.else.6:
# Phi connections
  li t3, 0
  j .F.fetch_decode_execute._43.lazy.exit.6                             # ir inst 174 fin
.F.fetch_decode_execute._43.lazy.exit.6:
  bnez t3, .F.fetch_decode_execute._44.if.then.9
  j .F.fetch_decode_execute._45.if.else.9                               # ir inst 176 fin
.F.fetch_decode_execute._44.if.then.9:
  li t1, 1
  sb t1, 0(a6)                                                          # ir inst 177 fin
  j .F.fetch_decode_execute._55.if.exit.9                               # ir inst 178 fin
.F.fetch_decode_execute._45.if.else.9:
  mv t3, t4                                                             # ir inst 179 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 180 fin
  lw t3, 0(s11)                                                         # ir inst 181 fin
  li t2, 0
  slt s11, t3, t2                                                       # ir inst 182 fin
  bnez s11, .F.fetch_decode_execute._46.lazy.then.7
  j .F.fetch_decode_execute._47.lazy.else.7                             # ir inst 183 fin
.F.fetch_decode_execute._46.lazy.then.7:
  mv t3, t6                                                             # ir inst 184 fin
  slli t2, t3, 2
  add t6, a0, t2                                                        # ir inst 185 fin
  lw t3, 0(t6)                                                          # ir inst 186 fin
  li t2, 0
  slt t6, t2, t3                                                        # ir inst 187 fin
# Phi connections
  j .F.fetch_decode_execute._48.lazy.exit.7                             # ir inst 188 fin
.F.fetch_decode_execute._47.lazy.else.7:
# Phi connections
  li t6, 0
  j .F.fetch_decode_execute._48.lazy.exit.7                             # ir inst 189 fin
.F.fetch_decode_execute._48.lazy.exit.7:
  bnez t6, .F.fetch_decode_execute._49.lazy.then.8
  j .F.fetch_decode_execute._50.lazy.else.8                             # ir inst 191 fin
.F.fetch_decode_execute._49.lazy.then.8:
  li t2, 0
  slt t6, t2, s10                                                       # ir inst 192 fin
# Phi connections
  j .F.fetch_decode_execute._51.lazy.exit.8                             # ir inst 193 fin
.F.fetch_decode_execute._50.lazy.else.8:
# Phi connections
  li t6, 0
  j .F.fetch_decode_execute._51.lazy.exit.8                             # ir inst 194 fin
.F.fetch_decode_execute._51.lazy.exit.8:
  bnez t6, .F.fetch_decode_execute._52.if.then.10
  j .F.fetch_decode_execute._53.if.else.10                              # ir inst 196 fin
.F.fetch_decode_execute._52.if.then.10:
  li t1, 1
  sb t1, 0(a6)                                                          # ir inst 197 fin
  j .F.fetch_decode_execute._54.if.exit.10                              # ir inst 198 fin
.F.fetch_decode_execute._53.if.else.10:
  li t1, 0
  sb t1, 0(a6)                                                          # ir inst 199 fin
  j .F.fetch_decode_execute._54.if.exit.10                              # ir inst 200 fin
.F.fetch_decode_execute._54.if.exit.10:
  j .F.fetch_decode_execute._55.if.exit.9                               # ir inst 201 fin
.F.fetch_decode_execute._55.if.exit.9:
  mv t6, t4                                                             # ir inst 202 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 203 fin
  sw s10, 0(t4)                                                         # ir inst 204 fin
  li t2, 0
  xor t0, s10, t2
  sltiu t6, t0, 1                                                       # ir inst 205 fin
  sb t6, 0(a5)                                                          # ir inst 206 fin
  lw t6, 0(a3)                                                          # ir inst 207 fin
  addi t4, t6, 2                                                        # ir inst 208 fin
  sw t4, 0(a3)                                                          # ir inst 209 fin
  j .F.fetch_decode_execute._150.if.exit.8                              # ir inst 210 fin
.F.fetch_decode_execute._56.if.else.8:
  li t2, 5
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 211 fin
  bnez t6, .F.fetch_decode_execute._57.if.then.11
  j .F.fetch_decode_execute._58.if.else.11                              # ir inst 212 fin
.F.fetch_decode_execute._57.if.then.11:
  lw t6, 0(a3)                                                          # ir inst 213 fin
  mv t4, t6                                                             # ir inst 214 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 215 fin
  lw t4, 0(t6)                                                          # ir inst 216 fin
  lw t6, 0(a3)                                                          # ir inst 217 fin
  mv t3, t6                                                             # ir inst 218 fin
  addi t6, t3, 1                                                        # ir inst 219 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 220 fin
  lw t6, 0(t3)                                                          # ir inst 221 fin
  mv t3, t4                                                             # ir inst 222 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 223 fin
  mv t3, t4                                                             # ir inst 224 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 225 fin
  lw t3, 0(s10)                                                         # ir inst 226 fin
  mv s10, t6                                                            # ir inst 227 fin
  slli t2, s10, 2
  add t6, a0, t2                                                        # ir inst 228 fin
  lw s10, 0(t6)                                                         # ir inst 229 fin
  mul t6, t3, s10                                                       # ir inst 230 fin
  sw t6, 0(s11)                                                         # ir inst 231 fin
  mv t6, t4                                                             # ir inst 232 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 233 fin
  lw t6, 0(t4)                                                          # ir inst 234 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 235 fin
  sb t4, 0(a5)                                                          # ir inst 236 fin
  lw t6, 0(a3)                                                          # ir inst 237 fin
  addi t4, t6, 2                                                        # ir inst 238 fin
  sw t4, 0(a3)                                                          # ir inst 239 fin
  j .F.fetch_decode_execute._149.if.exit.11                             # ir inst 240 fin
.F.fetch_decode_execute._58.if.else.11:
  li t2, 6
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 241 fin
  bnez t6, .F.fetch_decode_execute._59.if.then.12
  j .F.fetch_decode_execute._63.if.else.12                              # ir inst 242 fin
.F.fetch_decode_execute._59.if.then.12:
  lw t6, 0(a3)                                                          # ir inst 243 fin
  mv t4, t6                                                             # ir inst 244 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 245 fin
  lw t4, 0(t6)                                                          # ir inst 246 fin
  lw t6, 0(a3)                                                          # ir inst 247 fin
  mv t3, t6                                                             # ir inst 248 fin
  addi t6, t3, 1                                                        # ir inst 249 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 250 fin
  lw t6, 0(t3)                                                          # ir inst 251 fin
  mv t3, t6                                                             # ir inst 252 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 253 fin
  lw t3, 0(s11)                                                         # ir inst 254 fin
  li t2, 0
  xor t0, t3, t2
  sltu s11, zero, t0                                                    # ir inst 255 fin
  bnez s11, .F.fetch_decode_execute._60.if.then.13
  j .F.fetch_decode_execute._61.if.else.13                              # ir inst 256 fin
.F.fetch_decode_execute._60.if.then.13:
  mv t3, t4                                                             # ir inst 257 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 258 fin
  mv t3, t4                                                             # ir inst 259 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 260 fin
  lw t3, 0(s10)                                                         # ir inst 261 fin
  mv s10, t6                                                            # ir inst 262 fin
  slli t2, s10, 2
  add t6, a0, t2                                                        # ir inst 263 fin
  lw s10, 0(t6)                                                         # ir inst 264 fin
  div t6, t3, s10                                                       # ir inst 265 fin
  sw t6, 0(s11)                                                         # ir inst 266 fin
  j .F.fetch_decode_execute._62.if.exit.13                              # ir inst 267 fin
.F.fetch_decode_execute._61.if.else.13:
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 268 fin
  j .F.fetch_decode_execute._62.if.exit.13                              # ir inst 269 fin
.F.fetch_decode_execute._62.if.exit.13:
  mv t6, t4                                                             # ir inst 270 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 271 fin
  lw t6, 0(t4)                                                          # ir inst 272 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 273 fin
  sb t4, 0(a5)                                                          # ir inst 274 fin
  lw t6, 0(a3)                                                          # ir inst 275 fin
  addi t4, t6, 2                                                        # ir inst 276 fin
  sw t4, 0(a3)                                                          # ir inst 277 fin
  j .F.fetch_decode_execute._148.if.exit.12                             # ir inst 278 fin
.F.fetch_decode_execute._63.if.else.12:
  li t2, 7
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 279 fin
  bnez t6, .F.fetch_decode_execute._64.if.then.14
  j .F.fetch_decode_execute._65.if.else.14                              # ir inst 280 fin
.F.fetch_decode_execute._64.if.then.14:
  lw t6, 0(a3)                                                          # ir inst 281 fin
  mv t4, t6                                                             # ir inst 282 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 283 fin
  lw t4, 0(t6)                                                          # ir inst 284 fin
  lw t6, 0(a3)                                                          # ir inst 285 fin
  mv t3, t6                                                             # ir inst 286 fin
  addi t6, t3, 1                                                        # ir inst 287 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 288 fin
  lw t6, 0(t3)                                                          # ir inst 289 fin
  mv t3, t4                                                             # ir inst 290 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 291 fin
  mv t3, t4                                                             # ir inst 292 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 293 fin
  lw t3, 0(s10)                                                         # ir inst 294 fin
  mv s10, t6                                                            # ir inst 295 fin
  slli t2, s10, 2
  add t6, a0, t2                                                        # ir inst 296 fin
  lw s10, 0(t6)                                                         # ir inst 297 fin
  and t6, t3, s10                                                       # ir inst 298 fin
  sw t6, 0(s11)                                                         # ir inst 299 fin
  mv t6, t4                                                             # ir inst 300 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 301 fin
  lw t6, 0(t4)                                                          # ir inst 302 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 303 fin
  sb t4, 0(a5)                                                          # ir inst 304 fin
  lw t6, 0(a3)                                                          # ir inst 305 fin
  addi t4, t6, 2                                                        # ir inst 306 fin
  sw t4, 0(a3)                                                          # ir inst 307 fin
  j .F.fetch_decode_execute._147.if.exit.14                             # ir inst 308 fin
.F.fetch_decode_execute._65.if.else.14:
  li t2, 8
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 309 fin
  bnez t6, .F.fetch_decode_execute._66.if.then.15
  j .F.fetch_decode_execute._67.if.else.15                              # ir inst 310 fin
.F.fetch_decode_execute._66.if.then.15:
  lw t6, 0(a3)                                                          # ir inst 311 fin
  mv t4, t6                                                             # ir inst 312 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 313 fin
  lw t4, 0(t6)                                                          # ir inst 314 fin
  lw t6, 0(a3)                                                          # ir inst 315 fin
  mv t3, t6                                                             # ir inst 316 fin
  addi t6, t3, 1                                                        # ir inst 317 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 318 fin
  lw t6, 0(t3)                                                          # ir inst 319 fin
  mv t3, t4                                                             # ir inst 320 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 321 fin
  mv t3, t4                                                             # ir inst 322 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 323 fin
  lw t3, 0(s10)                                                         # ir inst 324 fin
  mv s10, t6                                                            # ir inst 325 fin
  slli t2, s10, 2
  add t6, a0, t2                                                        # ir inst 326 fin
  lw s10, 0(t6)                                                         # ir inst 327 fin
  or t6, t3, s10                                                        # ir inst 328 fin
  sw t6, 0(s11)                                                         # ir inst 329 fin
  mv t6, t4                                                             # ir inst 330 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 331 fin
  lw t6, 0(t4)                                                          # ir inst 332 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 333 fin
  sb t4, 0(a5)                                                          # ir inst 334 fin
  lw t6, 0(a3)                                                          # ir inst 335 fin
  addi t4, t6, 2                                                        # ir inst 336 fin
  sw t4, 0(a3)                                                          # ir inst 337 fin
  j .F.fetch_decode_execute._146.if.exit.15                             # ir inst 338 fin
.F.fetch_decode_execute._67.if.else.15:
  li t2, 9
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 339 fin
  bnez t6, .F.fetch_decode_execute._68.if.then.16
  j .F.fetch_decode_execute._69.if.else.16                              # ir inst 340 fin
.F.fetch_decode_execute._68.if.then.16:
  lw t6, 0(a3)                                                          # ir inst 341 fin
  mv t4, t6                                                             # ir inst 342 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 343 fin
  lw t4, 0(t6)                                                          # ir inst 344 fin
  lw t6, 0(a3)                                                          # ir inst 345 fin
  mv t3, t6                                                             # ir inst 346 fin
  addi t6, t3, 1                                                        # ir inst 347 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 348 fin
  lw t6, 0(t3)                                                          # ir inst 349 fin
  mv t3, t4                                                             # ir inst 350 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 351 fin
  mv t3, t4                                                             # ir inst 352 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 353 fin
  lw t3, 0(s10)                                                         # ir inst 354 fin
  mv s10, t6                                                            # ir inst 355 fin
  slli t2, s10, 2
  add t6, a0, t2                                                        # ir inst 356 fin
  lw s10, 0(t6)                                                         # ir inst 357 fin
  xor t6, t3, s10                                                       # ir inst 358 fin
  sw t6, 0(s11)                                                         # ir inst 359 fin
  mv t6, t4                                                             # ir inst 360 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 361 fin
  lw t6, 0(t4)                                                          # ir inst 362 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 363 fin
  sb t4, 0(a5)                                                          # ir inst 364 fin
  lw t6, 0(a3)                                                          # ir inst 365 fin
  addi t4, t6, 2                                                        # ir inst 366 fin
  sw t4, 0(a3)                                                          # ir inst 367 fin
  j .F.fetch_decode_execute._145.if.exit.16                             # ir inst 368 fin
.F.fetch_decode_execute._69.if.else.16:
  li t2, 10
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 369 fin
  bnez t6, .F.fetch_decode_execute._70.if.then.17
  j .F.fetch_decode_execute._71.if.else.17                              # ir inst 370 fin
.F.fetch_decode_execute._70.if.then.17:
  lw t6, 0(a3)                                                          # ir inst 371 fin
  mv t4, t6                                                             # ir inst 372 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 373 fin
  lw t4, 0(t6)                                                          # ir inst 374 fin
  mv t6, t4                                                             # ir inst 375 fin
  slli t2, t6, 2
  add t3, a0, t2                                                        # ir inst 376 fin
  mv t6, t4                                                             # ir inst 377 fin
  slli t2, t6, 2
  add s11, a0, t2                                                       # ir inst 378 fin
  lw t6, 0(s11)                                                         # ir inst 379 fin
  li t2, 0
  xor t0, t6, t2
  sltiu s11, t0, 1                                                      # ir inst 380 fin
  mv t6, s11                                                            # ir inst 381 fin
  sw t6, 0(t3)                                                          # ir inst 382 fin
  mv t6, t4                                                             # ir inst 383 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 384 fin
  lw t6, 0(t4)                                                          # ir inst 385 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 386 fin
  sb t4, 0(a5)                                                          # ir inst 387 fin
  lw t6, 0(a3)                                                          # ir inst 388 fin
  addi t4, t6, 1                                                        # ir inst 389 fin
  sw t4, 0(a3)                                                          # ir inst 390 fin
  j .F.fetch_decode_execute._144.if.exit.17                             # ir inst 391 fin
.F.fetch_decode_execute._71.if.else.17:
  li t2, 11
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 392 fin
  bnez t6, .F.fetch_decode_execute._72.if.then.18
  j .F.fetch_decode_execute._73.if.else.18                              # ir inst 393 fin
.F.fetch_decode_execute._72.if.then.18:
  lw t6, 0(a3)                                                          # ir inst 394 fin
  mv t4, t6                                                             # ir inst 395 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 396 fin
  lw t4, 0(t6)                                                          # ir inst 397 fin
  lw t6, 0(a3)                                                          # ir inst 398 fin
  mv t3, t6                                                             # ir inst 399 fin
  addi t6, t3, 1                                                        # ir inst 400 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 401 fin
  lw t6, 0(t3)                                                          # ir inst 402 fin
  mv t3, t4                                                             # ir inst 403 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 404 fin
  mv t3, t4                                                             # ir inst 405 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 406 fin
  lw t3, 0(s10)                                                         # ir inst 407 fin
  sll s10, t3, t6                                                       # ir inst 408 fin
  sw s10, 0(s11)                                                        # ir inst 409 fin
  mv t6, t4                                                             # ir inst 410 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 411 fin
  lw t6, 0(t4)                                                          # ir inst 412 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 413 fin
  sb t4, 0(a5)                                                          # ir inst 414 fin
  lw t6, 0(a3)                                                          # ir inst 415 fin
  addi t4, t6, 2                                                        # ir inst 416 fin
  sw t4, 0(a3)                                                          # ir inst 417 fin
  j .F.fetch_decode_execute._143.if.exit.18                             # ir inst 418 fin
.F.fetch_decode_execute._73.if.else.18:
  li t2, 12
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 419 fin
  bnez t6, .F.fetch_decode_execute._74.if.then.19
  j .F.fetch_decode_execute._75.if.else.19                              # ir inst 420 fin
.F.fetch_decode_execute._74.if.then.19:
  lw t6, 0(a3)                                                          # ir inst 421 fin
  mv t4, t6                                                             # ir inst 422 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 423 fin
  lw t4, 0(t6)                                                          # ir inst 424 fin
  lw t6, 0(a3)                                                          # ir inst 425 fin
  mv t3, t6                                                             # ir inst 426 fin
  addi t6, t3, 1                                                        # ir inst 427 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 428 fin
  lw t6, 0(t3)                                                          # ir inst 429 fin
  mv t3, t4                                                             # ir inst 430 fin
  slli t2, t3, 2
  add s11, a0, t2                                                       # ir inst 431 fin
  mv t3, t4                                                             # ir inst 432 fin
  slli t2, t3, 2
  add s10, a0, t2                                                       # ir inst 433 fin
  lw t3, 0(s10)                                                         # ir inst 434 fin
  sra s10, t3, t6                                                       # ir inst 435 fin
  sw s10, 0(s11)                                                        # ir inst 436 fin
  mv t6, t4                                                             # ir inst 437 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 438 fin
  lw t6, 0(t4)                                                          # ir inst 439 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 440 fin
  sb t4, 0(a5)                                                          # ir inst 441 fin
  lw t6, 0(a3)                                                          # ir inst 442 fin
  addi t4, t6, 2                                                        # ir inst 443 fin
  sw t4, 0(a3)                                                          # ir inst 444 fin
  j .F.fetch_decode_execute._142.if.exit.19                             # ir inst 445 fin
.F.fetch_decode_execute._75.if.else.19:
  li t2, 13
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 446 fin
  bnez t6, .F.fetch_decode_execute._76.if.then.20
  j .F.fetch_decode_execute._77.if.else.20                              # ir inst 447 fin
.F.fetch_decode_execute._76.if.then.20:
  lw t6, 0(a3)                                                          # ir inst 448 fin
  mv t4, t6                                                             # ir inst 449 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 450 fin
  lw t4, 0(t6)                                                          # ir inst 451 fin
  lw t6, 0(a4)                                                          # ir inst 452 fin
  addi t3, t6, -1                                                       # ir inst 453 fin
  sw t3, 0(a4)                                                          # ir inst 454 fin
  lw t6, 0(a4)                                                          # ir inst 455 fin
  mv t3, t6                                                             # ir inst 456 fin
  slli t2, t3, 2
  add t6, a2, t2                                                        # ir inst 457 fin
  mv t3, t4                                                             # ir inst 458 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 459 fin
  lw t3, 0(t4)                                                          # ir inst 460 fin
  sw t3, 0(t6)                                                          # ir inst 461 fin
  lw t6, 0(a3)                                                          # ir inst 462 fin
  addi t4, t6, 1                                                        # ir inst 463 fin
  sw t4, 0(a3)                                                          # ir inst 464 fin
  j .F.fetch_decode_execute._141.if.exit.20                             # ir inst 465 fin
.F.fetch_decode_execute._77.if.else.20:
  li t2, 14
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 466 fin
  bnez t6, .F.fetch_decode_execute._78.if.then.21
  j .F.fetch_decode_execute._79.if.else.21                              # ir inst 467 fin
.F.fetch_decode_execute._78.if.then.21:
  lw t6, 0(a3)                                                          # ir inst 468 fin
  mv t4, t6                                                             # ir inst 469 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 470 fin
  lw t4, 0(t6)                                                          # ir inst 471 fin
  mv t6, t4                                                             # ir inst 472 fin
  slli t2, t6, 2
  add t4, a0, t2                                                        # ir inst 473 fin
  lw t6, 0(a4)                                                          # ir inst 474 fin
  mv t3, t6                                                             # ir inst 475 fin
  slli t2, t3, 2
  add t6, a2, t2                                                        # ir inst 476 fin
  lw t3, 0(t6)                                                          # ir inst 477 fin
  sw t3, 0(t4)                                                          # ir inst 478 fin
  lw t6, 0(a4)                                                          # ir inst 479 fin
  addi t4, t6, 1                                                        # ir inst 480 fin
  sw t4, 0(a4)                                                          # ir inst 481 fin
  lw t6, 0(a3)                                                          # ir inst 482 fin
  addi t4, t6, 1                                                        # ir inst 483 fin
  sw t4, 0(a3)                                                          # ir inst 484 fin
  j .F.fetch_decode_execute._140.if.exit.21                             # ir inst 485 fin
.F.fetch_decode_execute._79.if.else.21:
  li t2, 15
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 486 fin
  bnez t6, .F.fetch_decode_execute._80.if.then.22
  j .F.fetch_decode_execute._87.if.else.22                              # ir inst 487 fin
.F.fetch_decode_execute._80.if.then.22:
  lw t6, 0(a3)                                                          # ir inst 488 fin
  mv t4, t6                                                             # ir inst 489 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 490 fin
  lw t4, 0(t6)                                                          # ir inst 491 fin
  lw t6, 0(a3)                                                          # ir inst 492 fin
  mv t3, t6                                                             # ir inst 493 fin
  addi t6, t3, 1                                                        # ir inst 494 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 495 fin
  lw t6, 0(t3)                                                          # ir inst 496 fin
  lw t3, 0(a3)                                                          # ir inst 497 fin
  mv s11, t3                                                            # ir inst 498 fin
  addi t3, s11, 2                                                       # ir inst 499 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 500 fin
  lw t3, 0(s11)                                                         # ir inst 501 fin
  mv s11, t6                                                            # ir inst 502 fin
  slli t2, s11, 2
  add t6, a0, t2                                                        # ir inst 503 fin
  lw s11, 0(t6)                                                         # ir inst 504 fin
  add t6, s11, t3                                                       # ir inst 505 fin
  li t2, 0
  slt t0, t6, t2
  xori t3, t0, 1                                                        # ir inst 506 fin
  bnez t3, .F.fetch_decode_execute._81.lazy.then.9
  j .F.fetch_decode_execute._82.lazy.else.9                             # ir inst 507 fin
.F.fetch_decode_execute._81.lazy.then.9:
  li t2, 2048
  slt t3, t6, t2                                                        # ir inst 508 fin
# Phi connections
  j .F.fetch_decode_execute._83.lazy.exit.9                             # ir inst 509 fin
.F.fetch_decode_execute._82.lazy.else.9:
# Phi connections
  li t3, 0
  j .F.fetch_decode_execute._83.lazy.exit.9                             # ir inst 510 fin
.F.fetch_decode_execute._83.lazy.exit.9:
  bnez t3, .F.fetch_decode_execute._84.if.then.23
  j .F.fetch_decode_execute._85.if.else.23                              # ir inst 512 fin
.F.fetch_decode_execute._84.if.then.23:
  mv t3, t4                                                             # ir inst 513 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 514 fin
  mv t3, t6                                                             # ir inst 515 fin
  slli t2, t3, 2
  add t6, a1, t2                                                        # ir inst 516 fin
  lw t3, 0(t6)                                                          # ir inst 517 fin
  sw t3, 0(t4)                                                          # ir inst 518 fin
  j .F.fetch_decode_execute._86.if.exit.23                              # ir inst 519 fin
.F.fetch_decode_execute._85.if.else.23:
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 520 fin
  j .F.fetch_decode_execute._86.if.exit.23                              # ir inst 521 fin
.F.fetch_decode_execute._86.if.exit.23:
  lw t6, 0(a3)                                                          # ir inst 522 fin
  addi t4, t6, 3                                                        # ir inst 523 fin
  sw t4, 0(a3)                                                          # ir inst 524 fin
  j .F.fetch_decode_execute._139.if.exit.22                             # ir inst 525 fin
.F.fetch_decode_execute._87.if.else.22:
  li t2, 16
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 526 fin
  bnez t6, .F.fetch_decode_execute._88.if.then.24
  j .F.fetch_decode_execute._95.if.else.24                              # ir inst 527 fin
.F.fetch_decode_execute._88.if.then.24:
  lw t6, 0(a3)                                                          # ir inst 528 fin
  mv t4, t6                                                             # ir inst 529 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 530 fin
  lw t4, 0(t6)                                                          # ir inst 531 fin
  lw t6, 0(a3)                                                          # ir inst 532 fin
  mv t3, t6                                                             # ir inst 533 fin
  addi t6, t3, 1                                                        # ir inst 534 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 535 fin
  lw t6, 0(t3)                                                          # ir inst 536 fin
  lw t3, 0(a3)                                                          # ir inst 537 fin
  mv s11, t3                                                            # ir inst 538 fin
  addi t3, s11, 2                                                       # ir inst 539 fin
  slli t2, t3, 2
  add s11, a1, t2                                                       # ir inst 540 fin
  lw t3, 0(s11)                                                         # ir inst 541 fin
  mv s11, t6                                                            # ir inst 542 fin
  slli t2, s11, 2
  add t6, a0, t2                                                        # ir inst 543 fin
  lw s11, 0(t6)                                                         # ir inst 544 fin
  add t6, s11, t3                                                       # ir inst 545 fin
  li t2, 0
  slt t0, t6, t2
  xori t3, t0, 1                                                        # ir inst 546 fin
  bnez t3, .F.fetch_decode_execute._89.lazy.then.10
  j .F.fetch_decode_execute._90.lazy.else.10                            # ir inst 547 fin
.F.fetch_decode_execute._89.lazy.then.10:
  li t2, 2048
  slt t3, t6, t2                                                        # ir inst 548 fin
# Phi connections
  j .F.fetch_decode_execute._91.lazy.exit.10                            # ir inst 549 fin
.F.fetch_decode_execute._90.lazy.else.10:
# Phi connections
  li t3, 0
  j .F.fetch_decode_execute._91.lazy.exit.10                            # ir inst 550 fin
.F.fetch_decode_execute._91.lazy.exit.10:
  bnez t3, .F.fetch_decode_execute._92.if.then.25
  j .F.fetch_decode_execute._93.if.else.25                              # ir inst 552 fin
.F.fetch_decode_execute._92.if.then.25:
  mv t3, t6                                                             # ir inst 553 fin
  slli t2, t3, 2
  add t6, a1, t2                                                        # ir inst 554 fin
  mv t3, t4                                                             # ir inst 555 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 556 fin
  lw t3, 0(t4)                                                          # ir inst 557 fin
  sw t3, 0(t6)                                                          # ir inst 558 fin
  j .F.fetch_decode_execute._94.if.exit.25                              # ir inst 559 fin
.F.fetch_decode_execute._93.if.else.25:
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 560 fin
  j .F.fetch_decode_execute._94.if.exit.25                              # ir inst 561 fin
.F.fetch_decode_execute._94.if.exit.25:
  lw t6, 0(a3)                                                          # ir inst 562 fin
  addi t4, t6, 3                                                        # ir inst 563 fin
  sw t4, 0(a3)                                                          # ir inst 564 fin
  j .F.fetch_decode_execute._138.if.exit.24                             # ir inst 565 fin
.F.fetch_decode_execute._95.if.else.24:
  li t2, 17
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 566 fin
  bnez t6, .F.fetch_decode_execute._96.if.then.26
  j .F.fetch_decode_execute._97.if.else.26                              # ir inst 567 fin
.F.fetch_decode_execute._96.if.then.26:
  lw t6, 0(a3)                                                          # ir inst 568 fin
  mv t4, t6                                                             # ir inst 569 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 570 fin
  lw t4, 0(t6)                                                          # ir inst 571 fin
  sw t4, 0(a3)                                                          # ir inst 572 fin
  j .F.fetch_decode_execute._137.if.exit.26                             # ir inst 573 fin
.F.fetch_decode_execute._97.if.else.26:
  li t2, 18
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 574 fin
  bnez t6, .F.fetch_decode_execute._98.if.then.27
  j .F.fetch_decode_execute._102.if.else.27                             # ir inst 575 fin
.F.fetch_decode_execute._98.if.then.27:
  lb t6, 0(a5)                                                          # ir inst 576 fin
  bnez t6, .F.fetch_decode_execute._99.if.then.28
  j .F.fetch_decode_execute._100.if.else.28                             # ir inst 577 fin
.F.fetch_decode_execute._99.if.then.28:
  lw t6, 0(a3)                                                          # ir inst 578 fin
  mv t4, t6                                                             # ir inst 579 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 580 fin
  lw t4, 0(t6)                                                          # ir inst 581 fin
  sw t4, 0(a3)                                                          # ir inst 582 fin
  j .F.fetch_decode_execute._101.if.exit.28                             # ir inst 583 fin
.F.fetch_decode_execute._100.if.else.28:
  lw t6, 0(a3)                                                          # ir inst 584 fin
  addi t4, t6, 1                                                        # ir inst 585 fin
  sw t4, 0(a3)                                                          # ir inst 586 fin
  j .F.fetch_decode_execute._101.if.exit.28                             # ir inst 587 fin
.F.fetch_decode_execute._101.if.exit.28:
  j .F.fetch_decode_execute._136.if.exit.27                             # ir inst 588 fin
.F.fetch_decode_execute._102.if.else.27:
  li t2, 19
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 589 fin
  bnez t6, .F.fetch_decode_execute._103.if.then.29
  j .F.fetch_decode_execute._107.if.else.29                             # ir inst 590 fin
.F.fetch_decode_execute._103.if.then.29:
  lb t6, 0(a5)                                                          # ir inst 591 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 592 fin
  bnez t4, .F.fetch_decode_execute._104.if.then.30
  j .F.fetch_decode_execute._105.if.else.30                             # ir inst 593 fin
.F.fetch_decode_execute._104.if.then.30:
  lw t6, 0(a3)                                                          # ir inst 594 fin
  mv t4, t6                                                             # ir inst 595 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 596 fin
  lw t4, 0(t6)                                                          # ir inst 597 fin
  sw t4, 0(a3)                                                          # ir inst 598 fin
  j .F.fetch_decode_execute._106.if.exit.30                             # ir inst 599 fin
.F.fetch_decode_execute._105.if.else.30:
  lw t6, 0(a3)                                                          # ir inst 600 fin
  addi t4, t6, 1                                                        # ir inst 601 fin
  sw t4, 0(a3)                                                          # ir inst 602 fin
  j .F.fetch_decode_execute._106.if.exit.30                             # ir inst 603 fin
.F.fetch_decode_execute._106.if.exit.30:
  j .F.fetch_decode_execute._135.if.exit.29                             # ir inst 604 fin
.F.fetch_decode_execute._107.if.else.29:
  li t2, 20
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 605 fin
  bnez t6, .F.fetch_decode_execute._108.if.then.31
  j .F.fetch_decode_execute._112.if.else.31                             # ir inst 606 fin
.F.fetch_decode_execute._108.if.then.31:
  lb t6, 0(a6)                                                          # ir inst 607 fin
  bnez t6, .F.fetch_decode_execute._109.if.then.32
  j .F.fetch_decode_execute._110.if.else.32                             # ir inst 608 fin
.F.fetch_decode_execute._109.if.then.32:
  lw t6, 0(a3)                                                          # ir inst 609 fin
  mv t4, t6                                                             # ir inst 610 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 611 fin
  lw t4, 0(t6)                                                          # ir inst 612 fin
  sw t4, 0(a3)                                                          # ir inst 613 fin
  j .F.fetch_decode_execute._111.if.exit.32                             # ir inst 614 fin
.F.fetch_decode_execute._110.if.else.32:
  lw t6, 0(a3)                                                          # ir inst 615 fin
  addi t4, t6, 1                                                        # ir inst 616 fin
  sw t4, 0(a3)                                                          # ir inst 617 fin
  j .F.fetch_decode_execute._111.if.exit.32                             # ir inst 618 fin
.F.fetch_decode_execute._111.if.exit.32:
  j .F.fetch_decode_execute._134.if.exit.31                             # ir inst 619 fin
.F.fetch_decode_execute._112.if.else.31:
  li t2, 21
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 620 fin
  bnez t6, .F.fetch_decode_execute._113.if.then.33
  j .F.fetch_decode_execute._117.if.else.33                             # ir inst 621 fin
.F.fetch_decode_execute._113.if.then.33:
  lb t6, 0(a6)                                                          # ir inst 622 fin
  li t2, 0
  xor t0, t6, t2
  sltiu t4, t0, 1                                                       # ir inst 623 fin
  bnez t4, .F.fetch_decode_execute._114.if.then.34
  j .F.fetch_decode_execute._115.if.else.34                             # ir inst 624 fin
.F.fetch_decode_execute._114.if.then.34:
  lw t6, 0(a3)                                                          # ir inst 625 fin
  mv t4, t6                                                             # ir inst 626 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 627 fin
  lw t4, 0(t6)                                                          # ir inst 628 fin
  sw t4, 0(a3)                                                          # ir inst 629 fin
  j .F.fetch_decode_execute._116.if.exit.34                             # ir inst 630 fin
.F.fetch_decode_execute._115.if.else.34:
  lw t6, 0(a3)                                                          # ir inst 631 fin
  addi t4, t6, 1                                                        # ir inst 632 fin
  sw t4, 0(a3)                                                          # ir inst 633 fin
  j .F.fetch_decode_execute._116.if.exit.34                             # ir inst 634 fin
.F.fetch_decode_execute._116.if.exit.34:
  j .F.fetch_decode_execute._133.if.exit.33                             # ir inst 635 fin
.F.fetch_decode_execute._117.if.else.33:
  li t2, 22
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 636 fin
  bnez t6, .F.fetch_decode_execute._118.if.then.35
  j .F.fetch_decode_execute._119.if.else.35                             # ir inst 637 fin
.F.fetch_decode_execute._118.if.then.35:
  lw t6, 0(a4)                                                          # ir inst 638 fin
  addi t4, t6, -1                                                       # ir inst 639 fin
  sw t4, 0(a4)                                                          # ir inst 640 fin
  lw t6, 0(a4)                                                          # ir inst 641 fin
  mv t4, t6                                                             # ir inst 642 fin
  slli t2, t4, 2
  add t6, a2, t2                                                        # ir inst 643 fin
  lw t4, 0(a3)                                                          # ir inst 644 fin
  addi t3, t4, 1                                                        # ir inst 645 fin
  sw t3, 0(t6)                                                          # ir inst 646 fin
  lw t6, 0(a3)                                                          # ir inst 647 fin
  mv t4, t6                                                             # ir inst 648 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 649 fin
  lw t4, 0(t6)                                                          # ir inst 650 fin
  sw t4, 0(a3)                                                          # ir inst 651 fin
  j .F.fetch_decode_execute._132.if.exit.35                             # ir inst 652 fin
.F.fetch_decode_execute._119.if.else.35:
  li t2, 23
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 653 fin
  bnez t6, .F.fetch_decode_execute._120.if.then.36
  j .F.fetch_decode_execute._121.if.else.36                             # ir inst 654 fin
.F.fetch_decode_execute._120.if.then.36:
  lw t6, 0(a4)                                                          # ir inst 655 fin
  mv t4, t6                                                             # ir inst 656 fin
  slli t2, t4, 2
  add t6, a2, t2                                                        # ir inst 657 fin
  lw t4, 0(t6)                                                          # ir inst 658 fin
  sw t4, 0(a3)                                                          # ir inst 659 fin
  lw t6, 0(a4)                                                          # ir inst 660 fin
  addi t4, t6, 1                                                        # ir inst 661 fin
  sw t4, 0(a4)                                                          # ir inst 662 fin
  j .F.fetch_decode_execute._131.if.exit.36                             # ir inst 663 fin
.F.fetch_decode_execute._121.if.else.36:
  li t2, 24
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 664 fin
  bnez t6, .F.fetch_decode_execute._122.if.then.37
  j .F.fetch_decode_execute._123.if.else.37                             # ir inst 665 fin
.F.fetch_decode_execute._122.if.then.37:
  lw t6, 0(a3)                                                          # ir inst 666 fin
  mv t4, t6                                                             # ir inst 667 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 668 fin
  lw t4, 0(t6)                                                          # ir inst 669 fin
  lw t6, 0(a3)                                                          # ir inst 670 fin
  mv t3, t6                                                             # ir inst 671 fin
  addi t6, t3, 1                                                        # ir inst 672 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 673 fin
  lw t6, 0(t3)                                                          # ir inst 674 fin
  mv t3, t4                                                             # ir inst 675 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 676 fin
  lw t3, 0(t4)                                                          # ir inst 677 fin
  mv t4, t6                                                             # ir inst 678 fin
  slli t2, t4, 2
  add t6, a0, t2                                                        # ir inst 679 fin
  lw t4, 0(t6)                                                          # ir inst 680 fin
  xor t0, t3, t4
  sltiu t6, t0, 1                                                       # ir inst 681 fin
  sb t6, 0(a5)                                                          # ir inst 682 fin
  slt t6, t3, t4                                                        # ir inst 683 fin
  sb t6, 0(a6)                                                          # ir inst 684 fin
  lw t6, 0(a3)                                                          # ir inst 685 fin
  addi t4, t6, 2                                                        # ir inst 686 fin
  sw t4, 0(a3)                                                          # ir inst 687 fin
  j .F.fetch_decode_execute._130.if.exit.37                             # ir inst 688 fin
.F.fetch_decode_execute._123.if.else.37:
  li t2, 25
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 689 fin
  bnez t6, .F.fetch_decode_execute._124.if.then.38
  j .F.fetch_decode_execute._125.if.else.38                             # ir inst 690 fin
.F.fetch_decode_execute._124.if.then.38:
  lw t6, 0(a3)                                                          # ir inst 691 fin
  mv t4, t6                                                             # ir inst 692 fin
  slli t2, t4, 2
  add t6, a1, t2                                                        # ir inst 693 fin
  lw t4, 0(t6)                                                          # ir inst 694 fin
  lw t6, 0(a3)                                                          # ir inst 695 fin
  mv t3, t6                                                             # ir inst 696 fin
  addi t6, t3, 1                                                        # ir inst 697 fin
  slli t2, t6, 2
  add t3, a1, t2                                                        # ir inst 698 fin
  lw t6, 0(t3)                                                          # ir inst 699 fin
  mv t3, t4                                                             # ir inst 700 fin
  slli t2, t3, 2
  add t4, a0, t2                                                        # ir inst 701 fin
  lw t3, 0(t4)                                                          # ir inst 702 fin
  xor t0, t3, t6
  sltiu t4, t0, 1                                                       # ir inst 703 fin
  sb t4, 0(a5)                                                          # ir inst 704 fin
  slt t4, t3, t6                                                        # ir inst 705 fin
  sb t4, 0(a6)                                                          # ir inst 706 fin
  lw t6, 0(a3)                                                          # ir inst 707 fin
  addi t4, t6, 2                                                        # ir inst 708 fin
  sw t4, 0(a3)                                                          # ir inst 709 fin
  j .F.fetch_decode_execute._129.if.exit.38                             # ir inst 710 fin
.F.fetch_decode_execute._125.if.else.38:
  li t2, 26
  xor t0, t5, t2
  sltiu t6, t0, 1                                                       # ir inst 711 fin
  bnez t6, .F.fetch_decode_execute._126.if.then.39
  j .F.fetch_decode_execute._127.if.else.39                             # ir inst 712 fin
.F.fetch_decode_execute._126.if.then.39:
  lw t6, 0(a3)                                                          # ir inst 713 fin
  mv t5, t6                                                             # ir inst 714 fin
  slli t2, t5, 2
  add t6, a1, t2                                                        # ir inst 715 fin
  lw t5, 0(t6)                                                          # ir inst 716 fin
  mv t6, t5                                                             # ir inst 717 fin
  slli t2, t6, 2
  add t5, a0, t2                                                        # ir inst 718 fin
  lw t6, 0(t5)                                                          # ir inst 719 fin
# Start call preparation
  sd a0, 0(sp)
  sd a1, 8(sp)
  sd a2, 16(sp)
  sd a3, 24(sp)
  sd a4, 32(sp)
  sd a5, 40(sp)
  sd a6, 48(sp)
  sd a7, 56(sp)
  sd t6, 64(sp)
  mv a0, t6
  call printlnInt
  ld a0, 0(sp)
  ld a1, 8(sp)
  ld a2, 16(sp)
  ld a3, 24(sp)
  ld a4, 32(sp)
  ld a5, 40(sp)
  ld a6, 48(sp)
  ld a7, 56(sp)
  ld t6, 64(sp)
# ir inst 720 fin
  lw t6, 0(a3)                                                          # ir inst 721 fin
  addi t5, t6, 1                                                        # ir inst 722 fin
  sw t5, 0(a3)                                                          # ir inst 723 fin
  j .F.fetch_decode_execute._128.if.exit.39                             # ir inst 724 fin
.F.fetch_decode_execute._127.if.else.39:
  li t1, 1
  sb t1, 0(a7)                                                          # ir inst 725 fin
  j .F.fetch_decode_execute._128.if.exit.39                             # ir inst 726 fin
.F.fetch_decode_execute._128.if.exit.39:
  j .F.fetch_decode_execute._129.if.exit.38                             # ir inst 727 fin
.F.fetch_decode_execute._129.if.exit.38:
  j .F.fetch_decode_execute._130.if.exit.37                             # ir inst 728 fin
.F.fetch_decode_execute._130.if.exit.37:
  j .F.fetch_decode_execute._131.if.exit.36                             # ir inst 729 fin
.F.fetch_decode_execute._131.if.exit.36:
  j .F.fetch_decode_execute._132.if.exit.35                             # ir inst 730 fin
.F.fetch_decode_execute._132.if.exit.35:
  j .F.fetch_decode_execute._133.if.exit.33                             # ir inst 731 fin
.F.fetch_decode_execute._133.if.exit.33:
  j .F.fetch_decode_execute._134.if.exit.31                             # ir inst 732 fin
.F.fetch_decode_execute._134.if.exit.31:
  j .F.fetch_decode_execute._135.if.exit.29                             # ir inst 733 fin
.F.fetch_decode_execute._135.if.exit.29:
  j .F.fetch_decode_execute._136.if.exit.27                             # ir inst 734 fin
.F.fetch_decode_execute._136.if.exit.27:
  j .F.fetch_decode_execute._137.if.exit.26                             # ir inst 735 fin
.F.fetch_decode_execute._137.if.exit.26:
  j .F.fetch_decode_execute._138.if.exit.24                             # ir inst 736 fin
.F.fetch_decode_execute._138.if.exit.24:
  j .F.fetch_decode_execute._139.if.exit.22                             # ir inst 737 fin
.F.fetch_decode_execute._139.if.exit.22:
  j .F.fetch_decode_execute._140.if.exit.21                             # ir inst 738 fin
.F.fetch_decode_execute._140.if.exit.21:
  j .F.fetch_decode_execute._141.if.exit.20                             # ir inst 739 fin
.F.fetch_decode_execute._141.if.exit.20:
  j .F.fetch_decode_execute._142.if.exit.19                             # ir inst 740 fin
.F.fetch_decode_execute._142.if.exit.19:
  j .F.fetch_decode_execute._143.if.exit.18                             # ir inst 741 fin
.F.fetch_decode_execute._143.if.exit.18:
  j .F.fetch_decode_execute._144.if.exit.17                             # ir inst 742 fin
.F.fetch_decode_execute._144.if.exit.17:
  j .F.fetch_decode_execute._145.if.exit.16                             # ir inst 743 fin
.F.fetch_decode_execute._145.if.exit.16:
  j .F.fetch_decode_execute._146.if.exit.15                             # ir inst 744 fin
.F.fetch_decode_execute._146.if.exit.15:
  j .F.fetch_decode_execute._147.if.exit.14                             # ir inst 745 fin
.F.fetch_decode_execute._147.if.exit.14:
  j .F.fetch_decode_execute._148.if.exit.12                             # ir inst 746 fin
.F.fetch_decode_execute._148.if.exit.12:
  j .F.fetch_decode_execute._149.if.exit.11                             # ir inst 747 fin
.F.fetch_decode_execute._149.if.exit.11:
  j .F.fetch_decode_execute._150.if.exit.8                              # ir inst 748 fin
.F.fetch_decode_execute._150.if.exit.8:
  j .F.fetch_decode_execute._151.if.exit.5                              # ir inst 749 fin
.F.fetch_decode_execute._151.if.exit.5:
  j .F.fetch_decode_execute._152.if.exit.4                              # ir inst 750 fin
.F.fetch_decode_execute._152.if.exit.4:
  j .F.fetch_decode_execute._153.if.exit.3                              # ir inst 751 fin
.F.fetch_decode_execute._153.if.exit.3:
  j .F.fetch_decode_execute._154.if.exit.2                              # ir inst 752 fin
.F.fetch_decode_execute._154.if.exit.2:
  j .F.fetch_decode_execute._155.if.exit.1                              # ir inst 753 fin
.F.fetch_decode_execute._155.if.exit.1:
  j .F.fetch_decode_execute._1.while.cond.0                             # ir inst 754 fin
.F.fetch_decode_execute._156.while.exit.0:
  j .F.fetch_decode_execute.epilogue                                    # ir inst 755 fin
.F.fetch_decode_execute.epilogue:
  ld ra, 88(sp)
  ld s10, 72(sp)
  ld s11, 80(sp)
  addi sp, sp, 96
  ret

.globl main
main:
# spill func args num: 0,             range:     9312(sp) -     9312(sp)
# local var size: 9291,               range:        8(sp) -     9299(sp)
# return addr size: 8,                range:        0(sp) -        8(sp)
# callee save reg num: 0 / 12,        range:        0(sp) -        0(sp)
# max caller save reg num: 0 / 12,    range:        0(sp) -        0(sp)
# spill area size: 0,                 range:        0(sp) -        0(sp)
  li t0, -9312
  add sp, sp, t0
  sd ra, 0(sp)
main._0.entry.0:
  addi t1, sp, 8
  addi t6, t1, 0                                                        # ir inst 2 fin
# Phi connections
  li t5, 0
  j main._1.array.cond.0                                                # ir inst 3 fin
main._1.array.cond.0:
  li t2, 16
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
  addi t1, sp, 72
  addi t6, t1, 0                                                        # ir inst 12 fin
# Phi connections
  li t5, 0
  j main._4.array.cond.1                                                # ir inst 13 fin
main._4.array.cond.1:
  li t2, 2048
  slt t4, t5, t2                                                        # ir inst 15 fin
  bnez t4, main._5.array.body.1
  j main._6.array.exit.1                                                # ir inst 16 fin
main._5.array.body.1:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 17 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 18 fin
  addi t4, t5, 1                                                        # ir inst 19 fin
# Phi connections
  mv t5, t4
  j main._4.array.cond.1                                                # ir inst 20 fin
main._6.array.exit.1:
  li t1, 8264
  add t1, sp, t1
  addi t6, t1, 0                                                        # ir inst 22 fin
# Phi connections
  li t5, 0
  j main._7.array.cond.2                                                # ir inst 23 fin
main._7.array.cond.2:
  li t2, 256
  slt t4, t5, t2                                                        # ir inst 25 fin
  bnez t4, main._8.array.body.2
  j main._9.array.exit.2                                                # ir inst 26 fin
main._8.array.body.2:
  slli t2, t5, 2
  add t4, t6, t2                                                        # ir inst 27 fin
  li t1, 0
  sw t1, 0(t4)                                                          # ir inst 28 fin
  addi t4, t5, 1                                                        # ir inst 29 fin
# Phi connections
  mv t5, t4
  j main._7.array.cond.2                                                # ir inst 30 fin
main._9.array.exit.2:
# alloca %18
  li t2, 9288
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 32 fin
# alloca %19
  li t2, 9292
  add t2, sp, t2
  li t1, 0
  sw t1, 0(t2)                                                          # ir inst 34 fin
# alloca %20
  li t2, 9296
  add t2, sp, t2
  li t1, 0
  sb t1, 0(t2)                                                          # ir inst 36 fin
# alloca %21
  li t2, 9297
  add t2, sp, t2
  li t1, 0
  sb t1, 0(t2)                                                          # ir inst 38 fin
# alloca %22
  li t2, 9298
  add t2, sp, t2
  li t1, 0
  sb t1, 0(t2)                                                          # ir inst 40 fin
# Start call preparation
  li t1, 9298
  add t1, sp, t1
  mv a7, t1
  li t1, 9297
  add t1, sp, t1
  mv a6, t1
  li t1, 9296
  add t1, sp, t1
  mv a5, t1
  li t1, 9292
  add t1, sp, t1
  mv a4, t1
  li t1, 9288
  add t1, sp, t1
  mv a3, t1
  li t1, 8264
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 72
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.init_vm
# ir inst 41 fin
# Start call preparation
  addi t1, sp, 72
  mv a0, t1
  call .F.load_program
# ir inst 42 fin
# Start call preparation
  li t1, 9298
  add t1, sp, t1
  mv a7, t1
  li t1, 9297
  add t1, sp, t1
  mv a6, t1
  li t1, 9296
  add t1, sp, t1
  mv a5, t1
  li t1, 9292
  add t1, sp, t1
  mv a4, t1
  li t1, 9288
  add t1, sp, t1
  mv a3, t1
  li t1, 8264
  add t1, sp, t1
  mv a2, t1
  addi t1, sp, 72
  mv a1, t1
  addi t1, sp, 8
  mv a0, t1
  call .F.fetch_decode_execute
# ir inst 43 fin
  li t1, 9298
  add t1, sp, t1
  lb t6, 0(t1)                                                          # ir inst 44 fin
  bnez t6, main._10.if.then.0
  j main._11.if.else.0                                                  # ir inst 45 fin
main._10.if.then.0:
# Start call preparation
  li a0, 1337
  call printlnInt
# ir inst 46 fin
  j main._12.if.exit.0                                                  # ir inst 47 fin
main._11.if.else.0:
# Start call preparation
  li a0, 9999
  call printlnInt
# ir inst 48 fin
  j main._12.if.exit.0                                                  # ir inst 49 fin
main._12.if.exit.0:
# Start call preparation
  li a0, 0
  call exit
# ir inst 50 fin
  j main.epilogue                                                       # ir inst 51 fin
main.epilogue:
  ld ra, 0(sp)
  li t0, 9312
  add sp, sp, t0
  ret
