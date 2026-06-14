@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare void @memcpy(ptr, ptr, i64)
declare i32 @printf(ptr, ...)
declare i32 @scanf(ptr, ...)

define void @printInt(i32 %0) {
  call i32 (ptr, ...) @printf(ptr @.str, i32 %0)
  ret void
}

define void @printlnInt(i32 %0) {
  call i32 (ptr, ...) @printf(ptr @.str.1, i32 %0)
  ret void
}

define i32 @getInt() {
  %1 = alloca i32, align 4
  %2 = call i32 (ptr, ...) @scanf(ptr @.str, ptr %1)
  %3 = load i32, ptr %1, align 4
  ret i32 %3
}

define void @exit(i32 %0) {
  ret void
}



define void @push_stack([256 x i32]* %0, i32* %1, i32 %2) {
_0.entry.0:
  %3 = load i32, i32* %1                                                           ; inst 1
  %4 = icmp slt i32 %3, 255                                                        ; inst 2
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %5 = load i32, i32* %1                                                           ; inst 4
  %6 = add i32 %5, 1                                                               ; inst 5
  store i32 %6, i32* %1                                                            ; inst 6
  %7 = load i32, i32* %1                                                           ; inst 7
  %8 = sext i32 %7 to i64                                                          ; inst 8
  %9 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %8                   ; inst 9
  store i32 %2, i32* %9                                                            ; inst 10
  br label %_3.if.exit.0                                                           ; inst 11
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 12
_3.if.exit.0:
  ret void                                                                         ; inst 13
}

define i32 @pop_stack([256 x i32]* %0, i32* %1) {
_0.entry.0:
  %2 = load i32, i32* %1                                                           ; inst 1
  %3 = icmp sgt i32 %2, -1                                                         ; inst 2
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %4 = load i32, i32* %1                                                           ; inst 4
  %5 = sext i32 %4 to i64                                                          ; inst 5
  %6 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %5                   ; inst 6
  %7 = load i32, i32* %6                                                           ; inst 7
  %8 = load i32, i32* %1                                                           ; inst 8
  %9 = sub i32 %8, 1                                                               ; inst 9
  store i32 %9, i32* %1                                                            ; inst 10
  ret i32 %7                                                                       ; inst 11
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 12
_3.if.exit.0:
  ret i32 0                                                                        ; inst 13
}

define void @load_program([1024 x i32]* %0) {
_0.entry.0:
  %1 = sext i32 0 to i64                                                           ; inst 1
  %2 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %1                 ; inst 2
  store i32 1, i32* %2                                                             ; inst 3
  %3 = sext i32 1 to i64                                                           ; inst 4
  %4 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %3                 ; inst 5
  store i32 10, i32* %4                                                            ; inst 6
  %5 = sext i32 2 to i64                                                           ; inst 7
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %5                 ; inst 8
  store i32 13, i32* %6                                                            ; inst 9
  %7 = sext i32 3 to i64                                                           ; inst 10
  %8 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %7                 ; inst 11
  store i32 256, i32* %8                                                           ; inst 12
  %9 = sext i32 4 to i64                                                           ; inst 13
  %10 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %9                ; inst 14
  store i32 1, i32* %10                                                            ; inst 15
  %11 = sext i32 5 to i64                                                          ; inst 16
  %12 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %11               ; inst 17
  store i32 1, i32* %12                                                            ; inst 18
  %13 = sext i32 6 to i64                                                          ; inst 19
  %14 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %13               ; inst 20
  store i32 13, i32* %14                                                           ; inst 21
  %15 = sext i32 7 to i64                                                          ; inst 22
  %16 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %15               ; inst 23
  store i32 257, i32* %16                                                          ; inst 24
  %17 = sext i32 8 to i64                                                          ; inst 25
  %18 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %17               ; inst 26
  store i32 1, i32* %18                                                            ; inst 27
  %19 = sext i32 9 to i64                                                          ; inst 28
  %20 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %19               ; inst 29
  store i32 1, i32* %20                                                            ; inst 30
  %21 = sext i32 10 to i64                                                         ; inst 31
  %22 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %21               ; inst 32
  store i32 13, i32* %22                                                           ; inst 33
  %23 = sext i32 11 to i64                                                         ; inst 34
  %24 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %23               ; inst 35
  store i32 258, i32* %24                                                          ; inst 36
  %25 = sext i32 12 to i64                                                         ; inst 37
  %26 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %25               ; inst 38
  store i32 14, i32* %26                                                           ; inst 39
  %27 = sext i32 13 to i64                                                         ; inst 40
  %28 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %27               ; inst 41
  store i32 256, i32* %28                                                          ; inst 42
  %29 = sext i32 14 to i64                                                         ; inst 43
  %30 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %29               ; inst 44
  store i32 1, i32* %30                                                            ; inst 45
  %31 = sext i32 15 to i64                                                         ; inst 46
  %32 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %31               ; inst 47
  store i32 1, i32* %32                                                            ; inst 48
  %33 = sext i32 16 to i64                                                         ; inst 49
  %34 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %33               ; inst 50
  store i32 4, i32* %34                                                            ; inst 51
  %35 = sext i32 17 to i64                                                         ; inst 52
  %36 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %35               ; inst 53
  store i32 15, i32* %36                                                           ; inst 54
  %37 = sext i32 18 to i64                                                         ; inst 55
  %38 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %37               ; inst 56
  store i32 13, i32* %38                                                           ; inst 57
  %39 = sext i32 19 to i64                                                         ; inst 58
  %40 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %39               ; inst 59
  store i32 256, i32* %40                                                          ; inst 60
  %41 = sext i32 20 to i64                                                         ; inst 61
  %42 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %41               ; inst 62
  store i32 9, i32* %42                                                            ; inst 63
  %43 = sext i32 21 to i64                                                         ; inst 64
  %44 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %43               ; inst 65
  store i32 50, i32* %44                                                           ; inst 66
  %45 = sext i32 22 to i64                                                         ; inst 67
  %46 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %45               ; inst 68
  store i32 14, i32* %46                                                           ; inst 69
  %47 = sext i32 23 to i64                                                         ; inst 70
  %48 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %47               ; inst 71
  store i32 257, i32* %48                                                          ; inst 72
  %49 = sext i32 24 to i64                                                         ; inst 73
  %50 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %49               ; inst 74
  store i32 14, i32* %50                                                           ; inst 75
  %51 = sext i32 25 to i64                                                         ; inst 76
  %52 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %51               ; inst 77
  store i32 258, i32* %52                                                          ; inst 78
  %53 = sext i32 26 to i64                                                         ; inst 79
  %54 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %53               ; inst 80
  store i32 3, i32* %54                                                            ; inst 81
  %55 = sext i32 27 to i64                                                         ; inst 82
  %56 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %55               ; inst 83
  store i32 15, i32* %56                                                           ; inst 84
  %57 = sext i32 28 to i64                                                         ; inst 85
  %58 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %57               ; inst 86
  store i32 13, i32* %58                                                           ; inst 87
  %59 = sext i32 29 to i64                                                         ; inst 88
  %60 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %59               ; inst 89
  store i32 257, i32* %60                                                          ; inst 90
  %61 = sext i32 30 to i64                                                         ; inst 91
  %62 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %61               ; inst 92
  store i32 2, i32* %62                                                            ; inst 93
  %63 = sext i32 31 to i64                                                         ; inst 94
  %64 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %63               ; inst 95
  store i32 14, i32* %64                                                           ; inst 96
  %65 = sext i32 32 to i64                                                         ; inst 97
  %66 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %65               ; inst 98
  store i32 257, i32* %66                                                          ; inst 99
  %67 = sext i32 33 to i64                                                         ; inst 100
  %68 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %67               ; inst 101
  store i32 13, i32* %68                                                           ; inst 102
  %69 = sext i32 34 to i64                                                         ; inst 103
  %70 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %69               ; inst 104
  store i32 258, i32* %70                                                          ; inst 105
  %71 = sext i32 35 to i64                                                         ; inst 106
  %72 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %71               ; inst 107
  store i32 8, i32* %72                                                            ; inst 108
  %73 = sext i32 36 to i64                                                         ; inst 109
  %74 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %73               ; inst 110
  store i32 12, i32* %74                                                           ; inst 111
  %75 = sext i32 37 to i64                                                         ; inst 112
  %76 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %75               ; inst 113
  store i32 14, i32* %76                                                           ; inst 114
  %77 = sext i32 38 to i64                                                         ; inst 115
  %78 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %77               ; inst 116
  store i32 258, i32* %78                                                          ; inst 117
  %79 = sext i32 39 to i64                                                         ; inst 118
  %80 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %79               ; inst 119
  store i32 7, i32* %80                                                            ; inst 120
  %81 = sext i32 40 to i64                                                         ; inst 121
  %82 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %81               ; inst 122
  store i32 0, i32* %82                                                            ; inst 123
  br label %_1.while.cond.0                                                        ; inst 124
_1.while.cond.0:
  %83 = phi i32 [0, %_0.entry.0], [%108, %_2.while.body.0]                         ; inst 125
  %84 = icmp slt i32 %83, 20                                                       ; inst 126
  br i1 %84, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 127
_2.while.body.0:
  %85 = mul i32 %83, 10                                                            ; inst 128
  %86 = add i32 100, %85                                                           ; inst 129
  %87 = sext i32 %86 to i64                                                        ; inst 130
  %88 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %87               ; inst 131
  store i32 1, i32* %88                                                            ; inst 132
  %89 = sext i32 %86 to i64                                                        ; inst 133
  %90 = add i64 %89, 1                                                             ; inst 134
  %91 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %90               ; inst 135
  store i32 %83, i32* %91                                                          ; inst 136
  %92 = sext i32 %86 to i64                                                        ; inst 137
  %93 = add i64 %92, 2                                                             ; inst 138
  %94 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %93               ; inst 139
  store i32 1, i32* %94                                                            ; inst 140
  %95 = sext i32 %86 to i64                                                        ; inst 141
  %96 = add i64 %95, 3                                                             ; inst 142
  %97 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %96               ; inst 143
  %98 = add i32 %83, 1                                                             ; inst 144
  store i32 %98, i32* %97                                                          ; inst 145
  %99 = sext i32 %86 to i64                                                        ; inst 146
  %100 = add i64 %99, 4                                                            ; inst 147
  %101 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %100             ; inst 148
  store i32 5, i32* %101                                                           ; inst 149
  %102 = sext i32 %86 to i64                                                       ; inst 150
  %103 = add i64 %102, 5                                                           ; inst 151
  %104 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %103             ; inst 152
  store i32 7, i32* %104                                                           ; inst 153
  %105 = sext i32 %86 to i64                                                       ; inst 154
  %106 = add i64 %105, 6                                                           ; inst 155
  %107 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %106             ; inst 156
  store i32 2, i32* %107                                                           ; inst 157
  %108 = add i32 %83, 1                                                            ; inst 158
  br label %_1.while.cond.0                                                        ; inst 159
_3.while.exit.0:
  %109 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 99               ; inst 160
  store i32 8, i32* %109                                                           ; inst 161
  %110 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 100              ; inst 162
  store i32 100, i32* %110                                                         ; inst 163
  %111 = sext i32 400 to i64                                                       ; inst 164
  %112 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %111             ; inst 165
  store i32 13, i32* %112                                                          ; inst 166
  %113 = sext i32 401 to i64                                                       ; inst 167
  %114 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %113             ; inst 168
  store i32 500, i32* %114                                                         ; inst 169
  %115 = sext i32 402 to i64                                                       ; inst 170
  %116 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %115             ; inst 171
  store i32 14, i32* %116                                                          ; inst 172
  %117 = sext i32 403 to i64                                                       ; inst 173
  %118 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %117             ; inst 174
  store i32 500, i32* %118                                                         ; inst 175
  %119 = sext i32 404 to i64                                                       ; inst 176
  %120 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %119             ; inst 177
  store i32 1, i32* %120                                                           ; inst 178
  %121 = sext i32 405 to i64                                                       ; inst 179
  %122 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %121             ; inst 180
  store i32 1, i32* %122                                                           ; inst 181
  %123 = sext i32 406 to i64                                                       ; inst 182
  %124 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %123             ; inst 183
  store i32 12, i32* %124                                                          ; inst 184
  %125 = sext i32 407 to i64                                                       ; inst 185
  %126 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %125             ; inst 186
  store i32 9, i32* %126                                                           ; inst 187
  %127 = sext i32 408 to i64                                                       ; inst 188
  %128 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %127             ; inst 189
  store i32 420, i32* %128                                                         ; inst 190
  %129 = sext i32 409 to i64                                                       ; inst 191
  %130 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %129             ; inst 192
  store i32 1, i32* %130                                                           ; inst 193
  %131 = sext i32 410 to i64                                                       ; inst 194
  %132 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %131             ; inst 195
  store i32 1, i32* %132                                                           ; inst 196
  %133 = sext i32 411 to i64                                                       ; inst 197
  %134 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %133             ; inst 198
  store i32 8, i32* %134                                                           ; inst 199
  %135 = sext i32 412 to i64                                                       ; inst 200
  %136 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %135             ; inst 201
  store i32 500, i32* %136                                                         ; inst 202
  %137 = sext i32 412 to i64                                                       ; inst 203
  %138 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %137             ; inst 204
  store i32 14, i32* %138                                                          ; inst 205
  %139 = sext i32 413 to i64                                                       ; inst 206
  %140 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %139             ; inst 207
  store i32 500, i32* %140                                                         ; inst 208
  %141 = sext i32 414 to i64                                                       ; inst 209
  %142 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %141             ; inst 210
  store i32 1, i32* %142                                                           ; inst 211
  %143 = sext i32 415 to i64                                                       ; inst 212
  %144 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %143             ; inst 213
  store i32 1, i32* %144                                                           ; inst 214
  %145 = sext i32 416 to i64                                                       ; inst 215
  %146 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %145             ; inst 216
  store i32 4, i32* %146                                                           ; inst 217
  %147 = sext i32 417 to i64                                                       ; inst 218
  %148 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %147             ; inst 219
  store i32 8, i32* %148                                                           ; inst 220
  %149 = sext i32 417 to i64                                                       ; inst 221
  %150 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %149             ; inst 222
  store i32 400, i32* %150                                                         ; inst 223
  %151 = sext i32 600 to i64                                                       ; inst 224
  %152 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %151             ; inst 225
  store i32 13, i32* %152                                                          ; inst 226
  %153 = sext i32 601 to i64                                                       ; inst 227
  %154 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %153             ; inst 228
  store i32 700, i32* %154                                                         ; inst 229
  %155 = sext i32 602 to i64                                                       ; inst 230
  %156 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %155             ; inst 231
  store i32 14, i32* %156                                                          ; inst 232
  %157 = sext i32 603 to i64                                                       ; inst 233
  %158 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %157             ; inst 234
  store i32 700, i32* %158                                                         ; inst 235
  %159 = sext i32 604 to i64                                                       ; inst 236
  %160 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %159             ; inst 237
  store i32 1, i32* %160                                                           ; inst 238
  %161 = sext i32 605 to i64                                                       ; inst 239
  %162 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %161             ; inst 240
  store i32 2, i32* %162                                                           ; inst 241
  %163 = sext i32 606 to i64                                                       ; inst 242
  %164 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %163             ; inst 243
  store i32 12, i32* %164                                                          ; inst 244
  %165 = sext i32 607 to i64                                                       ; inst 245
  %166 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %165             ; inst 246
  store i32 9, i32* %166                                                           ; inst 247
  %167 = sext i32 608 to i64                                                       ; inst 248
  %168 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %167             ; inst 249
  store i32 612, i32* %168                                                         ; inst 250
  %169 = sext i32 609 to i64                                                       ; inst 251
  %170 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %169             ; inst 252
  store i32 14, i32* %170                                                          ; inst 253
  %171 = sext i32 610 to i64                                                       ; inst 254
  %172 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %171             ; inst 255
  store i32 700, i32* %172                                                         ; inst 256
  %173 = sext i32 611 to i64                                                       ; inst 257
  %174 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %173             ; inst 258
  store i32 8, i32* %174                                                           ; inst 259
  %175 = sext i32 612 to i64                                                       ; inst 260
  %176 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %175             ; inst 261
  store i32 800, i32* %176                                                         ; inst 262
  %177 = sext i32 612 to i64                                                       ; inst 263
  %178 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %177             ; inst 264
  store i32 14, i32* %178                                                          ; inst 265
  %179 = sext i32 613 to i64                                                       ; inst 266
  %180 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %179             ; inst 267
  store i32 700, i32* %180                                                         ; inst 268
  %181 = sext i32 614 to i64                                                       ; inst 269
  %182 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %181             ; inst 270
  store i32 1, i32* %182                                                           ; inst 271
  %183 = sext i32 615 to i64                                                       ; inst 272
  %184 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %183             ; inst 273
  store i32 1, i32* %184                                                           ; inst 274
  %185 = sext i32 616 to i64                                                       ; inst 275
  %186 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %185             ; inst 276
  store i32 4, i32* %186                                                           ; inst 277
  %187 = sext i32 617 to i64                                                       ; inst 278
  %188 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %187             ; inst 279
  store i32 8, i32* %188                                                           ; inst 280
  %189 = sext i32 618 to i64                                                       ; inst 281
  %190 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %189             ; inst 282
  store i32 600, i32* %190                                                         ; inst 283
  %191 = sext i32 619 to i64                                                       ; inst 284
  %192 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %191             ; inst 285
  store i32 14, i32* %192                                                          ; inst 286
  %193 = sext i32 620 to i64                                                       ; inst 287
  %194 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %193             ; inst 288
  store i32 700, i32* %194                                                         ; inst 289
  %195 = sext i32 621 to i64                                                       ; inst 290
  %196 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %195             ; inst 291
  store i32 1, i32* %196                                                           ; inst 292
  %197 = sext i32 622 to i64                                                       ; inst 293
  %198 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %197             ; inst 294
  store i32 2, i32* %198                                                           ; inst 295
  %199 = sext i32 623 to i64                                                       ; inst 296
  %200 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %199             ; inst 297
  store i32 4, i32* %200                                                           ; inst 298
  %201 = sext i32 624 to i64                                                       ; inst 299
  %202 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %201             ; inst 300
  store i32 8, i32* %202                                                           ; inst 301
  %203 = sext i32 625 to i64                                                       ; inst 302
  %204 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %203             ; inst 303
  store i32 600, i32* %204                                                         ; inst 304
  %205 = sext i32 626 to i64                                                       ; inst 305
  %206 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %205             ; inst 306
  store i32 3, i32* %206                                                           ; inst 307
  %207 = sext i32 627 to i64                                                       ; inst 308
  %208 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %207             ; inst 309
  store i32 8, i32* %208                                                           ; inst 310
  %209 = sext i32 628 to i64                                                       ; inst 311
  %210 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %209             ; inst 312
  store i32 800, i32* %210                                                         ; inst 313
  ret void                                                                         ; inst 314
}

define void @execute_cycle([1024 x i32]* %0, i32* %1, [256 x i32]* %2, i32* %3, i1* %4) {
_0.entry.0:
  %5 = load i32, i32* %1                                                           ; inst 1
  %6 = sext i32 %5 to i64                                                          ; inst 2
  %7 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %6                 ; inst 3
  %8 = load i32, i32* %7                                                           ; inst 4
  %9 = load i32, i32* %1                                                           ; inst 5
  %10 = add i32 %9, 1                                                              ; inst 6
  store i32 %10, i32* %1                                                           ; inst 7
  %11 = icmp eq i32 %8, 0                                                          ; inst 8
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 9
_1.if.then.0:
  store i1 0, i1* %4                                                               ; inst 10
  br label %_63.if.exit.0                                                          ; inst 11
_2.if.else.0:
  %12 = icmp eq i32 %8, 1                                                          ; inst 12
  br i1 %12, label %_3.if.then.1, label %_4.if.else.1                              ; inst 13
_3.if.then.1:
  %13 = load i32, i32* %1                                                          ; inst 14
  %14 = sext i32 %13 to i64                                                        ; inst 15
  %15 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %14               ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = load i32, i32* %1                                                          ; inst 18
  %18 = add i32 %17, 1                                                             ; inst 19
  store i32 %18, i32* %1                                                           ; inst 20
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %16)                         ; inst 21
  br label %_62.if.exit.1                                                          ; inst 22
_4.if.else.1:
  %19 = icmp eq i32 %8, 2                                                          ; inst 23
  br i1 %19, label %_5.if.then.2, label %_6.if.else.2                              ; inst 24
_5.if.then.2:
  %20 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 25
  br label %_61.if.exit.2                                                          ; inst 26
_6.if.else.2:
  %21 = icmp eq i32 %8, 3                                                          ; inst 27
  br i1 %21, label %_7.if.then.3, label %_8.if.else.3                              ; inst 28
_7.if.then.3:
  %22 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 29
  %23 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 30
  %24 = add i32 %23, %22                                                           ; inst 31
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %24)                         ; inst 32
  br label %_60.if.exit.3                                                          ; inst 33
_8.if.else.3:
  %25 = icmp eq i32 %8, 4                                                          ; inst 34
  br i1 %25, label %_9.if.then.4, label %_10.if.else.4                             ; inst 35
_9.if.then.4:
  %26 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 36
  %27 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 37
  %28 = sub i32 %27, %26                                                           ; inst 38
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %28)                         ; inst 39
  br label %_59.if.exit.4                                                          ; inst 40
_10.if.else.4:
  %29 = icmp eq i32 %8, 5                                                          ; inst 41
  br i1 %29, label %_11.if.then.5, label %_12.if.else.5                            ; inst 42
_11.if.then.5:
  %30 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 43
  %31 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 44
  %32 = mul i32 %31, %30                                                           ; inst 45
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %32)                         ; inst 46
  br label %_58.if.exit.5                                                          ; inst 47
_12.if.else.5:
  %33 = icmp eq i32 %8, 6                                                          ; inst 48
  br i1 %33, label %_13.if.then.6, label %_17.if.else.6                            ; inst 49
_13.if.then.6:
  %34 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 50
  %35 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 51
  %36 = icmp ne i32 %34, 0                                                         ; inst 52
  br i1 %36, label %_14.if.then.7, label %_15.if.else.7                            ; inst 53
_14.if.then.7:
  %37 = sdiv i32 %35, %34                                                          ; inst 54
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %37)                         ; inst 55
  br label %_16.if.exit.7                                                          ; inst 56
_15.if.else.7:
  store i1 0, i1* %4                                                               ; inst 57
  br label %_16.if.exit.7                                                          ; inst 58
_16.if.exit.7:
  br label %_57.if.exit.6                                                          ; inst 59
_17.if.else.6:
  %38 = icmp eq i32 %8, 7                                                          ; inst 60
  br i1 %38, label %_18.if.then.8, label %_19.if.else.8                            ; inst 61
_18.if.then.8:
  %39 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 62
  call void @printlnInt(i32 %39)                                                   ; inst 63
  br label %_56.if.exit.8                                                          ; inst 64
_19.if.else.8:
  %40 = icmp eq i32 %8, 8                                                          ; inst 65
  br i1 %40, label %_20.if.then.9, label %_21.if.else.9                            ; inst 66
_20.if.then.9:
  %41 = load i32, i32* %1                                                          ; inst 67
  %42 = sext i32 %41 to i64                                                        ; inst 68
  %43 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %42               ; inst 69
  %44 = load i32, i32* %43                                                         ; inst 70
  store i32 %44, i32* %1                                                           ; inst 71
  br label %_55.if.exit.9                                                          ; inst 72
_21.if.else.9:
  %45 = icmp eq i32 %8, 9                                                          ; inst 73
  br i1 %45, label %_22.if.then.10, label %_26.if.else.10                          ; inst 74
_22.if.then.10:
  %46 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 75
  %47 = icmp eq i32 %46, 0                                                         ; inst 76
  br i1 %47, label %_23.if.then.11, label %_24.if.else.11                          ; inst 77
_23.if.then.11:
  %48 = load i32, i32* %1                                                          ; inst 78
  %49 = sext i32 %48 to i64                                                        ; inst 79
  %50 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %49               ; inst 80
  %51 = load i32, i32* %50                                                         ; inst 81
  store i32 %51, i32* %1                                                           ; inst 82
  br label %_25.if.exit.11                                                         ; inst 83
_24.if.else.11:
  %52 = load i32, i32* %1                                                          ; inst 84
  %53 = add i32 %52, 1                                                             ; inst 85
  store i32 %53, i32* %1                                                           ; inst 86
  br label %_25.if.exit.11                                                         ; inst 87
_25.if.exit.11:
  br label %_54.if.exit.10                                                         ; inst 88
_26.if.else.10:
  %54 = icmp eq i32 %8, 10                                                         ; inst 89
  br i1 %54, label %_27.if.then.12, label %_31.if.else.12                          ; inst 90
_27.if.then.12:
  %55 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 91
  %56 = icmp ne i32 %55, 0                                                         ; inst 92
  br i1 %56, label %_28.if.then.13, label %_29.if.else.13                          ; inst 93
_28.if.then.13:
  %57 = load i32, i32* %1                                                          ; inst 94
  %58 = sext i32 %57 to i64                                                        ; inst 95
  %59 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %58               ; inst 96
  %60 = load i32, i32* %59                                                         ; inst 97
  store i32 %60, i32* %1                                                           ; inst 98
  br label %_30.if.exit.13                                                         ; inst 99
_29.if.else.13:
  %61 = load i32, i32* %1                                                          ; inst 100
  %62 = add i32 %61, 1                                                             ; inst 101
  store i32 %62, i32* %1                                                           ; inst 102
  br label %_30.if.exit.13                                                         ; inst 103
_30.if.exit.13:
  br label %_53.if.exit.12                                                         ; inst 104
_31.if.else.12:
  %63 = icmp eq i32 %8, 11                                                         ; inst 105
  br i1 %63, label %_32.if.then.14, label %_36.if.else.14                          ; inst 106
_32.if.then.14:
  %64 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 107
  %65 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 108
  %66 = icmp eq i32 %65, %64                                                       ; inst 109
  br i1 %66, label %_33.if.then.15, label %_34.if.else.15                          ; inst 110
_33.if.then.15:
  call void @push_stack([256 x i32]* %2, i32* %3, i32 1)                           ; inst 111
  br label %_35.if.exit.15                                                         ; inst 112
_34.if.else.15:
  call void @push_stack([256 x i32]* %2, i32* %3, i32 0)                           ; inst 113
  br label %_35.if.exit.15                                                         ; inst 114
_35.if.exit.15:
  br label %_52.if.exit.14                                                         ; inst 115
_36.if.else.14:
  %67 = icmp eq i32 %8, 12                                                         ; inst 116
  br i1 %67, label %_37.if.then.16, label %_41.if.else.16                          ; inst 117
_37.if.then.16:
  %68 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 118
  %69 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 119
  %70 = icmp slt i32 %69, %68                                                      ; inst 120
  br i1 %70, label %_38.if.then.17, label %_39.if.else.17                          ; inst 121
_38.if.then.17:
  call void @push_stack([256 x i32]* %2, i32* %3, i32 1)                           ; inst 122
  br label %_40.if.exit.17                                                         ; inst 123
_39.if.else.17:
  call void @push_stack([256 x i32]* %2, i32* %3, i32 0)                           ; inst 124
  br label %_40.if.exit.17                                                         ; inst 125
_40.if.exit.17:
  br label %_51.if.exit.16                                                         ; inst 126
_41.if.else.16:
  %71 = icmp eq i32 %8, 13                                                         ; inst 127
  br i1 %71, label %_42.if.then.18, label %_43.if.else.18                          ; inst 128
_42.if.then.18:
  %72 = load i32, i32* %1                                                          ; inst 129
  %73 = sext i32 %72 to i64                                                        ; inst 130
  %74 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %73               ; inst 131
  %75 = load i32, i32* %74                                                         ; inst 132
  %76 = load i32, i32* %1                                                          ; inst 133
  %77 = add i32 %76, 1                                                             ; inst 134
  store i32 %77, i32* %1                                                           ; inst 135
  %78 = call i32 @pop_stack([256 x i32]* %2, i32* %3)                              ; inst 136
  %79 = sext i32 %75 to i64                                                        ; inst 137
  %80 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %79               ; inst 138
  store i32 %78, i32* %80                                                          ; inst 139
  br label %_50.if.exit.18                                                         ; inst 140
_43.if.else.18:
  %81 = icmp eq i32 %8, 14                                                         ; inst 141
  br i1 %81, label %_44.if.then.19, label %_45.if.else.19                          ; inst 142
_44.if.then.19:
  %82 = load i32, i32* %1                                                          ; inst 143
  %83 = sext i32 %82 to i64                                                        ; inst 144
  %84 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %83               ; inst 145
  %85 = load i32, i32* %84                                                         ; inst 146
  %86 = load i32, i32* %1                                                          ; inst 147
  %87 = add i32 %86, 1                                                             ; inst 148
  store i32 %87, i32* %1                                                           ; inst 149
  %88 = sext i32 %85 to i64                                                        ; inst 150
  %89 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %88               ; inst 151
  %90 = load i32, i32* %89                                                         ; inst 152
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %90)                         ; inst 153
  br label %_49.if.exit.19                                                         ; inst 154
_45.if.else.19:
  %91 = icmp eq i32 %8, 15                                                         ; inst 155
  br i1 %91, label %_46.if.then.20, label %_47.if.else.20                          ; inst 156
_46.if.then.20:
  %92 = load i32, i32* %3                                                          ; inst 157
  %93 = sext i32 %92 to i64                                                        ; inst 158
  %94 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i64 %93                 ; inst 159
  %95 = load i32, i32* %94                                                         ; inst 160
  call void @push_stack([256 x i32]* %2, i32* %3, i32 %95)                         ; inst 161
  br label %_48.if.exit.20                                                         ; inst 162
_47.if.else.20:
  br label %_48.if.exit.20                                                         ; inst 163
_48.if.exit.20:
  br label %_49.if.exit.19                                                         ; inst 164
_49.if.exit.19:
  br label %_50.if.exit.18                                                         ; inst 165
_50.if.exit.18:
  br label %_51.if.exit.16                                                         ; inst 166
_51.if.exit.16:
  br label %_52.if.exit.14                                                         ; inst 167
_52.if.exit.14:
  br label %_53.if.exit.12                                                         ; inst 168
_53.if.exit.12:
  br label %_54.if.exit.10                                                         ; inst 169
_54.if.exit.10:
  br label %_55.if.exit.9                                                          ; inst 170
_55.if.exit.9:
  br label %_56.if.exit.8                                                          ; inst 171
_56.if.exit.8:
  br label %_57.if.exit.6                                                          ; inst 172
_57.if.exit.6:
  br label %_58.if.exit.5                                                          ; inst 173
_58.if.exit.5:
  br label %_59.if.exit.4                                                          ; inst 174
_59.if.exit.4:
  br label %_60.if.exit.3                                                          ; inst 175
_60.if.exit.3:
  br label %_61.if.exit.2                                                          ; inst 176
_61.if.exit.2:
  br label %_62.if.exit.1                                                          ; inst 177
_62.if.exit.1:
  br label %_63.if.exit.0                                                          ; inst 178
_63.if.exit.0:
  ret void                                                                         ; inst 179
}

define void @main() {
_0.entry.0:
  %0 = alloca [1024 x i32]                                                         ; inst 1
  %1 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 1024                                                       ; inst 5
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  %5 = add i32 %2, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %6 = alloca [256 x i32]                                                          ; inst 11
  %7 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i32 0                    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %8 = phi i32 [0, %_3.array.exit.0], [%11, %_5.array.body.1]                      ; inst 14
  %9 = icmp slt i32 %8, 256                                                        ; inst 15
  br i1 %9, label %_5.array.body.1, label %_6.array.exit.1                         ; inst 16
_5.array.body.1:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 17
  store i32 0, i32* %10                                                            ; inst 18
  %11 = add i32 %8, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %12 = alloca i32                                                                 ; inst 21
  store i32 0, i32* %12                                                            ; inst 22
  %13 = alloca i32                                                                 ; inst 23
  store i32 -1, i32* %13                                                           ; inst 24
  %14 = alloca i1                                                                  ; inst 25
  store i1 1, i1* %14                                                              ; inst 26
  call void @load_program([1024 x i32]* %0)                                        ; inst 27
  br label %_7.while.cond.0                                                        ; inst 28
_7.while.cond.0:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_11.if.exit.0]                       ; inst 29
  %16 = load i1, i1* %14                                                           ; inst 30
  br i1 %16, label %_8.while.body.0, label %_25.critical_edge.0                    ; inst 31
_8.while.body.0:
  %17 = icmp sgt i32 %15, 5000                                                     ; inst 32
  br i1 %17, label %_9.if.then.0, label %_10.if.else.0                             ; inst 33
_9.if.then.0:
  br label %_12.while.exit.0                                                       ; inst 34
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 35
_11.if.exit.0:
  call void @execute_cycle([1024 x i32]* %0, i32* %12, [256 x i32]* %6, i32* %13, i1* %14) ; inst 36
  %18 = add i32 %15, 1                                                             ; inst 37
  br label %_7.while.cond.0                                                        ; inst 38
_12.while.exit.0:
  call void @printlnInt(i32 %15)                                                   ; inst 39
  %19 = load i32, i32* %13                                                         ; inst 40
  call void @printlnInt(i32 %19)                                                   ; inst 41
  br label %_13.while.cond.1                                                       ; inst 42
_13.while.cond.1:
  %20 = phi i32 [0, %_12.while.exit.0], [%27, %_14.while.body.1]                   ; inst 43
  %21 = phi i32 [0, %_12.while.exit.0], [%26, %_14.while.body.1]                   ; inst 44
  %22 = icmp slt i32 %20, 256                                                      ; inst 45
  br i1 %22, label %_14.while.body.1, label %_15.while.exit.1                      ; inst 46
_14.while.body.1:
  %23 = sext i32 %20 to i64                                                        ; inst 47
  %24 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %23                 ; inst 48
  %25 = load i32, i32* %24                                                         ; inst 49
  %26 = add i32 %21, %25                                                           ; inst 50
  %27 = add i32 %20, 1                                                             ; inst 51
  br label %_13.while.cond.1                                                       ; inst 52
_15.while.exit.1:
  call void @printlnInt(i32 %21)                                                   ; inst 53
  store i32 100, i32* %12                                                          ; inst 54
  store i32 -1, i32* %13                                                           ; inst 55
  store i1 1, i1* %14                                                              ; inst 56
  br label %_16.while.cond.2                                                       ; inst 57
_16.while.cond.2:
  %28 = phi i32 [0, %_15.while.exit.1], [%31, %_20.if.exit.1]                      ; inst 58
  %29 = load i1, i1* %14                                                           ; inst 59
  br i1 %29, label %_17.while.body.2, label %_26.critical_edge.1                   ; inst 60
_17.while.body.2:
  %30 = icmp sgt i32 %28, 100                                                      ; inst 61
  br i1 %30, label %_18.if.then.1, label %_19.if.else.1                            ; inst 62
_18.if.then.1:
  br label %_21.while.exit.2                                                       ; inst 63
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 64
_20.if.exit.1:
  call void @execute_cycle([1024 x i32]* %0, i32* %12, [256 x i32]* %6, i32* %13, i1* %14) ; inst 65
  %31 = add i32 %28, 1                                                             ; inst 66
  br label %_16.while.cond.2                                                       ; inst 67
_21.while.exit.2:
  br label %_22.while.cond.3                                                       ; inst 68
_22.while.cond.3:
  %32 = phi i32 [0, %_21.while.exit.2], [%34, %_23.while.body.3]                   ; inst 69
  %33 = icmp slt i32 %32, 10                                                       ; inst 70
  br i1 %33, label %_23.while.body.3, label %_24.while.exit.3                      ; inst 71
_23.while.body.3:
  %34 = add i32 %32, 1                                                             ; inst 72
  br label %_22.while.cond.3                                                       ; inst 73
_24.while.exit.3:
  call void @printlnInt(i32 1)                                                     ; inst 74
  call void @exit(i32 0)                                                           ; inst 75
  ret void                                                                         ; inst 76
_25.critical_edge.0:
  br label %_12.while.exit.0                                                       ; inst 77
_26.critical_edge.1:
  br label %_21.while.exit.2                                                       ; inst 78
}

