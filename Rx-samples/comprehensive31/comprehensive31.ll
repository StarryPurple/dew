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


%VM = type { i32, i32, [256 x i32], [1024 x i32] }

define void @main() {
_0.entry.0:
  %0 = alloca %VM                                                                  ; inst 1
  %1 = getelementptr %VM, %VM* %0, i32 0, i32 0                                    ; inst 2
  store i32 0, i32* %1                                                             ; inst 3
  %2 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 4
  %3 = trunc i64 256 to i32                                                        ; inst 5
  %4 = sub i32 %3, 1                                                               ; inst 6
  store i32 %4, i32* %2                                                            ; inst 7
  %5 = getelementptr %VM, %VM* %0, i32 0, i32 2                                    ; inst 8
  %6 = getelementptr [256 x i32], [256 x i32]* %5, i32 0, i32 0                    ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 11
  %8 = icmp slt i32 %7, 256                                                        ; inst 12
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 13
_2.array.body.0:
  %9 = getelementptr i32, i32* %6, i32 %7                                          ; inst 14
  store i32 0, i32* %9                                                             ; inst 15
  %10 = add i32 %7, 1                                                              ; inst 16
  br label %_1.array.cond.0                                                        ; inst 17
_3.array.exit.0:
  %11 = getelementptr %VM, %VM* %0, i32 0, i32 3                                   ; inst 18
  %12 = getelementptr [1024 x i32], [1024 x i32]* %11, i32 0, i32 0                ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_4.array.cond.1:
  %13 = phi i32 [0, %_3.array.exit.0], [%16, %_5.array.body.1]                     ; inst 21
  %14 = icmp slt i32 %13, 1024                                                     ; inst 22
  br i1 %14, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 23
_5.array.body.1:
  %15 = getelementptr i32, i32* %12, i32 %13                                       ; inst 24
  store i32 0, i32* %15                                                            ; inst 25
  %16 = add i32 %13, 1                                                             ; inst 26
  br label %_4.array.cond.1                                                        ; inst 27
_6.array.exit.1:
  call void @load_program(%VM* %0)                                                 ; inst 28
  call void @execute(%VM* %0)                                                      ; inst 29
  call void @printlnInt(i32 9999)                                                  ; inst 30
  call void @exit(i32 0)                                                           ; inst 31
  ret void                                                                         ; inst 32
}

define void @load_program(%VM* %0) {
_0.entry.0:
  %1 = alloca [1024 x i32]                                                         ; inst 1
  %2 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 1024                                                       ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = sext i32 0 to i64                                                           ; inst 11
  %8 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %7                 ; inst 12
  store i32 1, i32* %8                                                             ; inst 13
  %9 = sext i32 1 to i64                                                           ; inst 14
  %10 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %9                ; inst 15
  store i32 10, i32* %10                                                           ; inst 16
  %11 = sext i32 2 to i64                                                          ; inst 17
  %12 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %11               ; inst 18
  store i32 1, i32* %12                                                            ; inst 19
  %13 = sext i32 3 to i64                                                          ; inst 20
  %14 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %13               ; inst 21
  store i32 20, i32* %14                                                           ; inst 22
  %15 = sext i32 4 to i64                                                          ; inst 23
  %16 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %15               ; inst 24
  store i32 13, i32* %16                                                           ; inst 25
  %17 = sext i32 5 to i64                                                          ; inst 26
  %18 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %17               ; inst 27
  store i32 50, i32* %18                                                           ; inst 28
  %19 = sext i32 6 to i64                                                          ; inst 29
  %20 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %19               ; inst 30
  store i32 15, i32* %20                                                           ; inst 31
  %21 = sext i32 7 to i64                                                          ; inst 32
  %22 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %21               ; inst 33
  store i32 0, i32* %22                                                            ; inst 34
  %23 = sext i32 50 to i64                                                         ; inst 35
  %24 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %23               ; inst 36
  store i32 1, i32* %24                                                            ; inst 37
  %25 = sext i32 51 to i64                                                         ; inst 38
  %26 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %25               ; inst 39
  store i32 5, i32* %26                                                            ; inst 40
  %27 = sext i32 52 to i64                                                         ; inst 41
  %28 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %27               ; inst 42
  store i32 1, i32* %28                                                            ; inst 43
  %29 = sext i32 53 to i64                                                         ; inst 44
  %30 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %29               ; inst 45
  store i32 3, i32* %30                                                            ; inst 46
  %31 = sext i32 54 to i64                                                         ; inst 47
  %32 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %31               ; inst 48
  store i32 4, i32* %32                                                            ; inst 49
  %33 = sext i32 55 to i64                                                         ; inst 50
  %34 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %33               ; inst 51
  store i32 15, i32* %34                                                           ; inst 52
  %35 = sext i32 56 to i64                                                         ; inst 53
  %36 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %35               ; inst 54
  store i32 1, i32* %36                                                            ; inst 55
  %37 = sext i32 57 to i64                                                         ; inst 56
  %38 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %37               ; inst 57
  store i32 100, i32* %38                                                          ; inst 58
  %39 = sext i32 58 to i64                                                         ; inst 59
  %40 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %39               ; inst 60
  store i32 13, i32* %40                                                           ; inst 61
  %41 = sext i32 59 to i64                                                         ; inst 62
  %42 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %41               ; inst 63
  store i32 200, i32* %42                                                          ; inst 64
  %43 = sext i32 60 to i64                                                         ; inst 65
  %44 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %43               ; inst 66
  store i32 3, i32* %44                                                            ; inst 67
  %45 = sext i32 61 to i64                                                         ; inst 68
  %46 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %45               ; inst 69
  store i32 14, i32* %46                                                           ; inst 70
  %47 = sext i32 100 to i64                                                        ; inst 71
  %48 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %47               ; inst 72
  store i32 1, i32* %48                                                            ; inst 73
  %49 = sext i32 101 to i64                                                        ; inst 74
  %50 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %49               ; inst 75
  store i32 1, i32* %50                                                            ; inst 76
  %51 = sext i32 102 to i64                                                        ; inst 77
  %52 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %51               ; inst 78
  store i32 1, i32* %52                                                            ; inst 79
  %53 = sext i32 103 to i64                                                        ; inst 80
  %54 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %53               ; inst 81
  store i32 1, i32* %54                                                            ; inst 82
  br label %_4.while.cond.0                                                        ; inst 83
_4.while.cond.0:
  %55 = phi i32 [0, %_3.array.exit.0], [%86, %_5.while.body.0]                     ; inst 84
  %56 = phi i32 [104, %_3.array.exit.0], [%85, %_5.while.body.0]                   ; inst 85
  %57 = icmp slt i32 %55, 10                                                       ; inst 86
  br i1 %57, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 87
_5.while.body.0:
  %58 = sext i32 %56 to i64                                                        ; inst 88
  %59 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %58               ; inst 89
  store i32 3, i32* %59                                                            ; inst 90
  %60 = add i32 %56, 1                                                             ; inst 91
  %61 = sext i32 %60 to i64                                                        ; inst 92
  %62 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %61               ; inst 93
  store i32 1, i32* %62                                                            ; inst 94
  %63 = add i32 %60, 1                                                             ; inst 95
  %64 = sext i32 %63 to i64                                                        ; inst 96
  %65 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %64               ; inst 97
  %66 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 98
  %67 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 99
  %68 = load i32, i32* %67                                                         ; inst 100
  %69 = sext i32 %68 to i64                                                        ; inst 101
  %70 = getelementptr [256 x i32], [256 x i32]* %66, i32 0, i64 %69                ; inst 102
  %71 = load i32, i32* %70                                                         ; inst 103
  store i32 %71, i32* %65                                                          ; inst 104
  %72 = add i32 %63, 1                                                             ; inst 105
  %73 = sext i32 %72 to i64                                                        ; inst 106
  %74 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %73               ; inst 107
  store i32 1, i32* %74                                                            ; inst 108
  %75 = add i32 %72, 1                                                             ; inst 109
  %76 = sext i32 %75 to i64                                                        ; inst 110
  %77 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %76               ; inst 111
  %78 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 112
  %79 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 113
  %80 = load i32, i32* %79                                                         ; inst 114
  %81 = sub i32 %80, 1                                                             ; inst 115
  %82 = sext i32 %81 to i64                                                        ; inst 116
  %83 = getelementptr [256 x i32], [256 x i32]* %78, i32 0, i64 %82                ; inst 117
  %84 = load i32, i32* %83                                                         ; inst 118
  store i32 %84, i32* %77                                                          ; inst 119
  %85 = add i32 %75, 1                                                             ; inst 120
  %86 = add i32 %55, 1                                                             ; inst 121
  br label %_4.while.cond.0                                                        ; inst 122
_6.while.exit.0:
  %87 = sext i32 %56 to i64                                                        ; inst 123
  %88 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %87               ; inst 124
  store i32 2, i32* %88                                                            ; inst 125
  %89 = add i32 %56, 1                                                             ; inst 126
  %90 = sext i32 %89 to i64                                                        ; inst 127
  %91 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %90               ; inst 128
  store i32 15, i32* %91                                                           ; inst 129
  %92 = add i32 %89, 1                                                             ; inst 130
  %93 = sext i32 %92 to i64                                                        ; inst 131
  %94 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %93               ; inst 132
  store i32 14, i32* %94                                                           ; inst 133
  %95 = sext i32 200 to i64                                                        ; inst 134
  %96 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %95               ; inst 135
  store i32 1, i32* %96                                                            ; inst 136
  %97 = sext i32 201 to i64                                                        ; inst 137
  %98 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %97               ; inst 138
  store i32 10, i32* %98                                                           ; inst 139
  %99 = sext i32 202 to i64                                                        ; inst 140
  %100 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %99              ; inst 141
  store i32 1, i32* %100                                                           ; inst 142
  %101 = sext i32 203 to i64                                                       ; inst 143
  %102 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %101             ; inst 144
  store i32 0, i32* %102                                                           ; inst 145
  %103 = sext i32 204 to i64                                                       ; inst 146
  %104 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %103             ; inst 147
  store i32 1, i32* %104                                                           ; inst 148
  %105 = sext i32 205 to i64                                                       ; inst 149
  %106 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %105             ; inst 150
  store i32 1, i32* %106                                                           ; inst 151
  %107 = sext i32 206 to i64                                                       ; inst 152
  %108 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %107             ; inst 153
  store i32 1, i32* %108                                                           ; inst 154
  %109 = sext i32 207 to i64                                                       ; inst 155
  %110 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %109             ; inst 156
  %111 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 157
  %112 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 158
  %113 = load i32, i32* %112                                                       ; inst 159
  %114 = sub i32 %113, 2                                                           ; inst 160
  %115 = sext i32 %114 to i64                                                      ; inst 161
  %116 = getelementptr [256 x i32], [256 x i32]* %111, i32 0, i64 %115             ; inst 162
  %117 = load i32, i32* %116                                                       ; inst 163
  store i32 %117, i32* %110                                                        ; inst 164
  %118 = sext i32 208 to i64                                                       ; inst 165
  %119 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %118             ; inst 166
  store i32 1, i32* %119                                                           ; inst 167
  %120 = sext i32 209 to i64                                                       ; inst 168
  %121 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %120             ; inst 169
  %122 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 170
  %123 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 171
  %124 = load i32, i32* %123                                                       ; inst 172
  %125 = sub i32 %124, 2                                                           ; inst 173
  %126 = sext i32 %125 to i64                                                      ; inst 174
  %127 = getelementptr [256 x i32], [256 x i32]* %122, i32 0, i64 %126             ; inst 175
  %128 = load i32, i32* %127                                                       ; inst 176
  store i32 %128, i32* %121                                                        ; inst 177
  %129 = sext i32 210 to i64                                                       ; inst 178
  %130 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %129             ; inst 179
  store i32 3, i32* %130                                                           ; inst 180
  %131 = sext i32 211 to i64                                                       ; inst 181
  %132 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %131             ; inst 182
  store i32 2, i32* %132                                                           ; inst 183
  %133 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 184
  %134 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 185
  %135 = load i32, i32* %134                                                       ; inst 186
  %136 = sub i32 %135, 2                                                           ; inst 187
  %137 = sext i32 %136 to i64                                                      ; inst 188
  %138 = getelementptr [256 x i32], [256 x i32]* %133, i32 0, i64 %137             ; inst 189
  %139 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 190
  %140 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 191
  %141 = load i32, i32* %140                                                       ; inst 192
  %142 = sext i32 %141 to i64                                                      ; inst 193
  %143 = getelementptr [256 x i32], [256 x i32]* %139, i32 0, i64 %142             ; inst 194
  %144 = load i32, i32* %143                                                       ; inst 195
  store i32 %144, i32* %138                                                        ; inst 196
  %145 = sext i32 212 to i64                                                       ; inst 197
  %146 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %145             ; inst 198
  %147 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 199
  %148 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 200
  %149 = load i32, i32* %148                                                       ; inst 201
  %150 = sub i32 %149, 2                                                           ; inst 202
  %151 = sext i32 %150 to i64                                                      ; inst 203
  %152 = getelementptr [256 x i32], [256 x i32]* %147, i32 0, i64 %151             ; inst 204
  %153 = load i32, i32* %152                                                       ; inst 205
  store i32 %153, i32* %146                                                        ; inst 206
  %154 = sext i32 213 to i64                                                       ; inst 207
  %155 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %154             ; inst 208
  store i32 2, i32* %155                                                           ; inst 209
  %156 = sext i32 214 to i64                                                       ; inst 210
  %157 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %156             ; inst 211
  store i32 1, i32* %157                                                           ; inst 212
  %158 = sext i32 215 to i64                                                       ; inst 213
  %159 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %158             ; inst 214
  %160 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 215
  %161 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 216
  %162 = load i32, i32* %161                                                       ; inst 217
  %163 = sub i32 %162, 1                                                           ; inst 218
  %164 = sext i32 %163 to i64                                                      ; inst 219
  %165 = getelementptr [256 x i32], [256 x i32]* %160, i32 0, i64 %164             ; inst 220
  %166 = load i32, i32* %165                                                       ; inst 221
  store i32 %166, i32* %159                                                        ; inst 222
  %167 = sext i32 216 to i64                                                       ; inst 223
  %168 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %167             ; inst 224
  store i32 1, i32* %168                                                           ; inst 225
  %169 = sext i32 217 to i64                                                       ; inst 226
  %170 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %169             ; inst 227
  store i32 1, i32* %170                                                           ; inst 228
  %171 = sext i32 218 to i64                                                       ; inst 229
  %172 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %171             ; inst 230
  store i32 3, i32* %172                                                           ; inst 231
  %173 = sext i32 219 to i64                                                       ; inst 232
  %174 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %173             ; inst 233
  store i32 2, i32* %174                                                           ; inst 234
  %175 = sext i32 220 to i64                                                       ; inst 235
  %176 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %175             ; inst 236
  %177 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 237
  %178 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 238
  %179 = load i32, i32* %178                                                       ; inst 239
  %180 = sub i32 %179, 1                                                           ; inst 240
  %181 = sext i32 %180 to i64                                                      ; inst 241
  %182 = getelementptr [256 x i32], [256 x i32]* %177, i32 0, i64 %181             ; inst 242
  %183 = load i32, i32* %182                                                       ; inst 243
  store i32 %183, i32* %176                                                        ; inst 244
  %184 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 245
  %185 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 246
  %186 = load i32, i32* %185                                                       ; inst 247
  %187 = sub i32 %186, 1                                                           ; inst 248
  %188 = sext i32 %187 to i64                                                      ; inst 249
  %189 = getelementptr [256 x i32], [256 x i32]* %184, i32 0, i64 %188             ; inst 250
  %190 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 251
  %191 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 252
  %192 = load i32, i32* %191                                                       ; inst 253
  %193 = sext i32 %192 to i64                                                      ; inst 254
  %194 = getelementptr [256 x i32], [256 x i32]* %190, i32 0, i64 %193             ; inst 255
  %195 = load i32, i32* %194                                                       ; inst 256
  store i32 %195, i32* %189                                                        ; inst 257
  %196 = sext i32 221 to i64                                                       ; inst 258
  %197 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %196             ; inst 259
  store i32 2, i32* %197                                                           ; inst 260
  %198 = sext i32 222 to i64                                                       ; inst 261
  %199 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %198             ; inst 262
  store i32 1, i32* %199                                                           ; inst 263
  %200 = sext i32 223 to i64                                                       ; inst 264
  %201 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %200             ; inst 265
  %202 = getelementptr %VM, %VM* %0, i32 0, i32 2                                  ; inst 266
  %203 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 267
  %204 = load i32, i32* %203                                                       ; inst 268
  %205 = sext i32 %204 to i64                                                      ; inst 269
  %206 = getelementptr [256 x i32], [256 x i32]* %202, i32 0, i64 %205             ; inst 270
  %207 = load i32, i32* %206                                                       ; inst 271
  store i32 %207, i32* %201                                                        ; inst 272
  %208 = sext i32 224 to i64                                                       ; inst 273
  %209 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %208             ; inst 274
  store i32 1, i32* %209                                                           ; inst 275
  %210 = sext i32 225 to i64                                                       ; inst 276
  %211 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %210             ; inst 277
  store i32 10, i32* %211                                                          ; inst 278
  %212 = sext i32 226 to i64                                                       ; inst 279
  %213 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %212             ; inst 280
  store i32 8, i32* %213                                                           ; inst 281
  %214 = sext i32 227 to i64                                                       ; inst 282
  %215 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %214             ; inst 283
  store i32 12, i32* %215                                                          ; inst 284
  %216 = sext i32 228 to i64                                                       ; inst 285
  %217 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %216             ; inst 286
  store i32 206, i32* %217                                                         ; inst 287
  %218 = sext i32 229 to i64                                                       ; inst 288
  %219 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %218             ; inst 289
  store i32 2, i32* %219                                                           ; inst 290
  %220 = sext i32 230 to i64                                                       ; inst 291
  %221 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %220             ; inst 292
  store i32 2, i32* %221                                                           ; inst 293
  %222 = sext i32 231 to i64                                                       ; inst 294
  %223 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %222             ; inst 295
  store i32 14, i32* %223                                                          ; inst 296
  %224 = getelementptr %VM, %VM* %0, i32 0, i32 3                                  ; inst 297
  call void @memcpy([1024 x i32]* %224, [1024 x i32]* %1, i64 4096)                ; inst 298
  ret void                                                                         ; inst 299
}

define void @execute(%VM* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i1 [1, %_0.entry.0], [%84, %_68.if.exit.0]                              ; inst 2
  br i1 %1, label %_2.while.body.0, label %_69.while.exit.0                        ; inst 3
_2.while.body.0:
  %2 = call i32 @fetch(%VM* %0)                                                    ; inst 4
  %3 = icmp eq i32 %2, 0                                                           ; inst 5
  br i1 %3, label %_3.if.then.0, label %_4.if.else.0                               ; inst 6
_3.if.then.0:
  br label %_68.if.exit.0                                                          ; inst 7
_4.if.else.0:
  %4 = icmp eq i32 %2, 1                                                           ; inst 8
  br i1 %4, label %_5.if.then.1, label %_6.if.else.1                               ; inst 9
_5.if.then.1:
  %5 = call i32 @fetch(%VM* %0)                                                    ; inst 10
  call void @push(%VM* %0, i32 %5)                                                 ; inst 11
  br label %_67.if.exit.1                                                          ; inst 12
_6.if.else.1:
  %6 = icmp eq i32 %2, 2                                                           ; inst 13
  br i1 %6, label %_7.if.then.2, label %_8.if.else.2                               ; inst 14
_7.if.then.2:
  %7 = call i32 @pop(%VM* %0)                                                      ; inst 15
  br label %_66.if.exit.2                                                          ; inst 16
_8.if.else.2:
  %8 = icmp eq i32 %2, 3                                                           ; inst 17
  br i1 %8, label %_9.if.then.3, label %_10.if.else.3                              ; inst 18
_9.if.then.3:
  %9 = call i32 @pop(%VM* %0)                                                      ; inst 19
  %10 = call i32 @pop(%VM* %0)                                                     ; inst 20
  %11 = add i32 %10, %9                                                            ; inst 21
  call void @push(%VM* %0, i32 %11)                                                ; inst 22
  br label %_65.if.exit.3                                                          ; inst 23
_10.if.else.3:
  %12 = icmp eq i32 %2, 4                                                          ; inst 24
  br i1 %12, label %_11.if.then.4, label %_12.if.else.4                            ; inst 25
_11.if.then.4:
  %13 = call i32 @pop(%VM* %0)                                                     ; inst 26
  %14 = call i32 @pop(%VM* %0)                                                     ; inst 27
  %15 = sub i32 %14, %13                                                           ; inst 28
  call void @push(%VM* %0, i32 %15)                                                ; inst 29
  br label %_64.if.exit.4                                                          ; inst 30
_12.if.else.4:
  %16 = icmp eq i32 %2, 5                                                          ; inst 31
  br i1 %16, label %_13.if.then.5, label %_14.if.else.5                            ; inst 32
_13.if.then.5:
  %17 = call i32 @pop(%VM* %0)                                                     ; inst 33
  %18 = call i32 @pop(%VM* %0)                                                     ; inst 34
  %19 = mul i32 %18, %17                                                           ; inst 35
  call void @push(%VM* %0, i32 %19)                                                ; inst 36
  br label %_63.if.exit.5                                                          ; inst 37
_14.if.else.5:
  %20 = icmp eq i32 %2, 6                                                          ; inst 38
  br i1 %20, label %_15.if.then.6, label %_19.if.else.6                            ; inst 39
_15.if.then.6:
  %21 = call i32 @pop(%VM* %0)                                                     ; inst 40
  %22 = call i32 @pop(%VM* %0)                                                     ; inst 41
  %23 = icmp ne i32 %21, 0                                                         ; inst 42
  br i1 %23, label %_16.if.then.7, label %_17.if.else.7                            ; inst 43
_16.if.then.7:
  %24 = sdiv i32 %22, %21                                                          ; inst 44
  call void @push(%VM* %0, i32 %24)                                                ; inst 45
  br label %_18.if.exit.7                                                          ; inst 46
_17.if.else.7:
  call void @printlnInt(i32 -1)                                                    ; inst 47
  br label %_18.if.exit.7                                                          ; inst 48
_18.if.exit.7:
  %25 = phi i1 [%1, %_16.if.then.7], [0, %_17.if.else.7]                           ; inst 49
  br label %_62.if.exit.6                                                          ; inst 50
_19.if.else.6:
  %26 = icmp eq i32 %2, 7                                                          ; inst 51
  br i1 %26, label %_20.if.then.8, label %_24.if.else.8                            ; inst 52
_20.if.then.8:
  %27 = call i32 @pop(%VM* %0)                                                     ; inst 53
  %28 = call i32 @pop(%VM* %0)                                                     ; inst 54
  %29 = icmp eq i32 %28, %27                                                       ; inst 55
  br i1 %29, label %_21.if.then.9, label %_22.if.else.9                            ; inst 56
_21.if.then.9:
  br label %_23.if.exit.9                                                          ; inst 57
_22.if.else.9:
  br label %_23.if.exit.9                                                          ; inst 58
_23.if.exit.9:
  %30 = phi i32 [1, %_21.if.then.9], [0, %_22.if.else.9]                           ; inst 59
  call void @push(%VM* %0, i32 %30)                                                ; inst 60
  br label %_61.if.exit.8                                                          ; inst 61
_24.if.else.8:
  %31 = icmp eq i32 %2, 8                                                          ; inst 62
  br i1 %31, label %_25.if.then.10, label %_29.if.else.10                          ; inst 63
_25.if.then.10:
  %32 = call i32 @pop(%VM* %0)                                                     ; inst 64
  %33 = call i32 @pop(%VM* %0)                                                     ; inst 65
  %34 = icmp slt i32 %33, %32                                                      ; inst 66
  br i1 %34, label %_26.if.then.11, label %_27.if.else.11                          ; inst 67
_26.if.then.11:
  br label %_28.if.exit.11                                                         ; inst 68
_27.if.else.11:
  br label %_28.if.exit.11                                                         ; inst 69
_28.if.exit.11:
  %35 = phi i32 [1, %_26.if.then.11], [0, %_27.if.else.11]                         ; inst 70
  call void @push(%VM* %0, i32 %35)                                                ; inst 71
  br label %_60.if.exit.10                                                         ; inst 72
_29.if.else.10:
  %36 = icmp eq i32 %2, 9                                                          ; inst 73
  br i1 %36, label %_30.if.then.12, label %_34.if.else.12                          ; inst 74
_30.if.then.12:
  %37 = call i32 @pop(%VM* %0)                                                     ; inst 75
  %38 = call i32 @pop(%VM* %0)                                                     ; inst 76
  %39 = icmp sgt i32 %38, %37                                                      ; inst 77
  br i1 %39, label %_31.if.then.13, label %_32.if.else.13                          ; inst 78
_31.if.then.13:
  br label %_33.if.exit.13                                                         ; inst 79
_32.if.else.13:
  br label %_33.if.exit.13                                                         ; inst 80
_33.if.exit.13:
  %40 = phi i32 [1, %_31.if.then.13], [0, %_32.if.else.13]                         ; inst 81
  call void @push(%VM* %0, i32 %40)                                                ; inst 82
  br label %_59.if.exit.12                                                         ; inst 83
_34.if.else.12:
  %41 = icmp eq i32 %2, 10                                                         ; inst 84
  br i1 %41, label %_35.if.then.14, label %_36.if.else.14                          ; inst 85
_35.if.then.14:
  %42 = getelementptr %VM, %VM* %0, i32 0, i32 0                                   ; inst 86
  %43 = call i32 @fetch(%VM* %0)                                                   ; inst 87
  store i32 %43, i32* %42                                                          ; inst 88
  br label %_58.if.exit.14                                                         ; inst 89
_36.if.else.14:
  %44 = icmp eq i32 %2, 11                                                         ; inst 90
  br i1 %44, label %_37.if.then.15, label %_41.if.else.15                          ; inst 91
_37.if.then.15:
  %45 = call i32 @fetch(%VM* %0)                                                   ; inst 92
  %46 = call i32 @pop(%VM* %0)                                                     ; inst 93
  %47 = icmp eq i32 %46, 0                                                         ; inst 94
  br i1 %47, label %_38.if.then.16, label %_39.if.else.16                          ; inst 95
_38.if.then.16:
  %48 = getelementptr %VM, %VM* %0, i32 0, i32 0                                   ; inst 96
  store i32 %45, i32* %48                                                          ; inst 97
  br label %_40.if.exit.16                                                         ; inst 98
_39.if.else.16:
  br label %_40.if.exit.16                                                         ; inst 99
_40.if.exit.16:
  br label %_57.if.exit.15                                                         ; inst 100
_41.if.else.15:
  %49 = icmp eq i32 %2, 12                                                         ; inst 101
  br i1 %49, label %_42.if.then.17, label %_46.if.else.17                          ; inst 102
_42.if.then.17:
  %50 = call i32 @fetch(%VM* %0)                                                   ; inst 103
  %51 = call i32 @pop(%VM* %0)                                                     ; inst 104
  %52 = icmp ne i32 %51, 0                                                         ; inst 105
  br i1 %52, label %_43.if.then.18, label %_44.if.else.18                          ; inst 106
_43.if.then.18:
  %53 = getelementptr %VM, %VM* %0, i32 0, i32 0                                   ; inst 107
  store i32 %50, i32* %53                                                          ; inst 108
  br label %_45.if.exit.18                                                         ; inst 109
_44.if.else.18:
  br label %_45.if.exit.18                                                         ; inst 110
_45.if.exit.18:
  br label %_56.if.exit.17                                                         ; inst 111
_46.if.else.17:
  %54 = icmp eq i32 %2, 13                                                         ; inst 112
  br i1 %54, label %_47.if.then.19, label %_48.if.else.19                          ; inst 113
_47.if.then.19:
  %55 = call i32 @fetch(%VM* %0)                                                   ; inst 114
  %56 = getelementptr %VM, %VM* %0, i32 0, i32 0                                   ; inst 115
  %57 = load i32, i32* %56                                                         ; inst 116
  call void @push(%VM* %0, i32 %57)                                                ; inst 117
  %58 = getelementptr %VM, %VM* %0, i32 0, i32 0                                   ; inst 118
  store i32 %55, i32* %58                                                          ; inst 119
  br label %_55.if.exit.19                                                         ; inst 120
_48.if.else.19:
  %59 = icmp eq i32 %2, 14                                                         ; inst 121
  br i1 %59, label %_49.if.then.20, label %_50.if.else.20                          ; inst 122
_49.if.then.20:
  %60 = getelementptr %VM, %VM* %0, i32 0, i32 0                                   ; inst 123
  %61 = call i32 @pop(%VM* %0)                                                     ; inst 124
  store i32 %61, i32* %60                                                          ; inst 125
  br label %_54.if.exit.20                                                         ; inst 126
_50.if.else.20:
  %62 = icmp eq i32 %2, 15                                                         ; inst 127
  br i1 %62, label %_51.if.then.21, label %_52.if.else.21                          ; inst 128
_51.if.then.21:
  %63 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 129
  %64 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 130
  %65 = load i32, i32* %64                                                         ; inst 131
  %66 = sext i32 %65 to i64                                                        ; inst 132
  %67 = getelementptr [256 x i32], [256 x i32]* %63, i32 0, i64 %66                ; inst 133
  %68 = load i32, i32* %67                                                         ; inst 134
  call void @printlnInt(i32 %68)                                                   ; inst 135
  br label %_53.if.exit.21                                                         ; inst 136
_52.if.else.21:
  call void @printlnInt(i32 -2)                                                    ; inst 137
  br label %_53.if.exit.21                                                         ; inst 138
_53.if.exit.21:
  %69 = phi i1 [%1, %_51.if.then.21], [0, %_52.if.else.21]                         ; inst 139
  br label %_54.if.exit.20                                                         ; inst 140
_54.if.exit.20:
  %70 = phi i1 [%1, %_49.if.then.20], [%69, %_53.if.exit.21]                       ; inst 141
  br label %_55.if.exit.19                                                         ; inst 142
_55.if.exit.19:
  %71 = phi i1 [%1, %_47.if.then.19], [%70, %_54.if.exit.20]                       ; inst 143
  br label %_56.if.exit.17                                                         ; inst 144
_56.if.exit.17:
  %72 = phi i1 [%1, %_45.if.exit.18], [%71, %_55.if.exit.19]                       ; inst 145
  br label %_57.if.exit.15                                                         ; inst 146
_57.if.exit.15:
  %73 = phi i1 [%1, %_40.if.exit.16], [%72, %_56.if.exit.17]                       ; inst 147
  br label %_58.if.exit.14                                                         ; inst 148
_58.if.exit.14:
  %74 = phi i1 [%1, %_35.if.then.14], [%73, %_57.if.exit.15]                       ; inst 149
  br label %_59.if.exit.12                                                         ; inst 150
_59.if.exit.12:
  %75 = phi i1 [%1, %_33.if.exit.13], [%74, %_58.if.exit.14]                       ; inst 151
  br label %_60.if.exit.10                                                         ; inst 152
_60.if.exit.10:
  %76 = phi i1 [%1, %_28.if.exit.11], [%75, %_59.if.exit.12]                       ; inst 153
  br label %_61.if.exit.8                                                          ; inst 154
_61.if.exit.8:
  %77 = phi i1 [%1, %_23.if.exit.9], [%76, %_60.if.exit.10]                        ; inst 155
  br label %_62.if.exit.6                                                          ; inst 156
_62.if.exit.6:
  %78 = phi i1 [%25, %_18.if.exit.7], [%77, %_61.if.exit.8]                        ; inst 157
  br label %_63.if.exit.5                                                          ; inst 158
_63.if.exit.5:
  %79 = phi i1 [%1, %_13.if.then.5], [%78, %_62.if.exit.6]                         ; inst 159
  br label %_64.if.exit.4                                                          ; inst 160
_64.if.exit.4:
  %80 = phi i1 [%1, %_11.if.then.4], [%79, %_63.if.exit.5]                         ; inst 161
  br label %_65.if.exit.3                                                          ; inst 162
_65.if.exit.3:
  %81 = phi i1 [%1, %_9.if.then.3], [%80, %_64.if.exit.4]                          ; inst 163
  br label %_66.if.exit.2                                                          ; inst 164
_66.if.exit.2:
  %82 = phi i1 [%1, %_7.if.then.2], [%81, %_65.if.exit.3]                          ; inst 165
  br label %_67.if.exit.1                                                          ; inst 166
_67.if.exit.1:
  %83 = phi i1 [%1, %_5.if.then.1], [%82, %_66.if.exit.2]                          ; inst 167
  br label %_68.if.exit.0                                                          ; inst 168
_68.if.exit.0:
  %84 = phi i1 [0, %_3.if.then.0], [%83, %_67.if.exit.1]                           ; inst 169
  br label %_1.while.cond.0                                                        ; inst 170
_69.while.exit.0:
  ret void                                                                         ; inst 171
}

define i32 @fetch(%VM* %0) {
_0.entry.0:
  %1 = getelementptr %VM, %VM* %0, i32 0, i32 3                                    ; inst 1
  %2 = getelementptr %VM, %VM* %0, i32 0, i32 0                                    ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  %4 = sext i32 %3 to i64                                                          ; inst 4
  %5 = getelementptr [1024 x i32], [1024 x i32]* %1, i32 0, i64 %4                 ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = getelementptr %VM, %VM* %0, i32 0, i32 0                                    ; inst 7
  %8 = getelementptr %VM, %VM* %0, i32 0, i32 0                                    ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = add i32 %9, 1                                                              ; inst 10
  store i32 %10, i32* %7                                                           ; inst 11
  ret i32 %6                                                                       ; inst 12
}

define void @push(%VM* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 1
  %3 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 2
  %4 = load i32, i32* %3                                                           ; inst 3
  %5 = add i32 %4, 1                                                               ; inst 4
  %6 = trunc i64 256 to i32                                                        ; inst 5
  %7 = srem i32 %5, %6                                                             ; inst 6
  store i32 %7, i32* %2                                                            ; inst 7
  %8 = getelementptr %VM, %VM* %0, i32 0, i32 2                                    ; inst 8
  %9 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = sext i32 %10 to i64                                                        ; inst 11
  %12 = getelementptr [256 x i32], [256 x i32]* %8, i32 0, i64 %11                 ; inst 12
  store i32 %1, i32* %12                                                           ; inst 13
  ret void                                                                         ; inst 14
}

define i32 @pop(%VM* %0) {
_0.entry.0:
  %1 = getelementptr %VM, %VM* %0, i32 0, i32 2                                    ; inst 1
  %2 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  %4 = sext i32 %3 to i64                                                          ; inst 4
  %5 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %4                   ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 7
  %8 = getelementptr %VM, %VM* %0, i32 0, i32 1                                    ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = sub i32 %9, 1                                                              ; inst 10
  store i32 %10, i32* %7                                                           ; inst 11
  %11 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  %13 = icmp slt i32 %12, 0                                                        ; inst 14
  br i1 %13, label %_1.if.then.0, label %_2.if.else.0                              ; inst 15
_1.if.then.0:
  %14 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 16
  %15 = load i32, i32* %14                                                         ; inst 17
  %16 = trunc i64 256 to i32                                                       ; inst 18
  %17 = add i32 %15, %16                                                           ; inst 19
  store i32 %17, i32* %14                                                          ; inst 20
  br label %_3.if.exit.0                                                           ; inst 21
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 22
_3.if.exit.0:
  ret i32 %6                                                                       ; inst 23
}

define void @deep_recursive_test(%VM* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sle i32 %1, 0                                                          ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret void                                                                         ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  call void @push(%VM* %0, i32 %1)                                                 ; inst 5
  %3 = sub i32 %1, 1                                                               ; inst 6
  call void @deep_recursive_test(%VM* %0, i32 %3)                                  ; inst 7
  %4 = call i32 @pop(%VM* %0)                                                      ; inst 8
  %5 = add i32 %4, 1                                                               ; inst 9
  call void @push(%VM* %0, i32 %5)                                                 ; inst 10
  ret void                                                                         ; inst 11
}

define void @complex_stack_manipulation(%VM* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%3, %_2.while.body.0]                            ; inst 2
  %2 = icmp slt i32 %1, 20                                                         ; inst 3
  br i1 %2, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  call void @push(%VM* %0, i32 %1)                                                 ; inst 5
  %3 = add i32 %1, 1                                                               ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 8
_4.while.cond.1:
  %4 = phi i32 [0, %_3.while.exit.0], [%9, %_5.while.body.1]                       ; inst 9
  %5 = icmp slt i32 %4, 10                                                         ; inst 10
  br i1 %5, label %_5.while.body.1, label %_6.while.exit.1                         ; inst 11
_5.while.body.1:
  %6 = call i32 @pop(%VM* %0)                                                      ; inst 12
  %7 = call i32 @pop(%VM* %0)                                                      ; inst 13
  %8 = add i32 %6, %7                                                              ; inst 14
  call void @push(%VM* %0, i32 %8)                                                 ; inst 15
  %9 = add i32 %4, 1                                                               ; inst 16
  br label %_4.while.cond.1                                                        ; inst 17
_6.while.exit.1:
  %10 = call i32 @pop(%VM* %0)                                                     ; inst 18
  call void @printlnInt(i32 %10)                                                   ; inst 19
  ret void                                                                         ; inst 20
}

define void @run_fibonacci_in_vm(%VM* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [1024 x i32]                                                         ; inst 1
  %3 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 1024                                                       ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 7
  store i32 0, i32* %6                                                             ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = sext i32 0 to i64                                                           ; inst 11
  %9 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %8                 ; inst 12
  store i32 1, i32* %9                                                             ; inst 13
  %10 = sext i32 1 to i64                                                          ; inst 14
  %11 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %10               ; inst 15
  store i32 %1, i32* %11                                                           ; inst 16
  %12 = sext i32 2 to i64                                                          ; inst 17
  %13 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %12               ; inst 18
  store i32 13, i32* %13                                                           ; inst 19
  %14 = sext i32 3 to i64                                                          ; inst 20
  %15 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %14               ; inst 21
  store i32 10, i32* %15                                                           ; inst 22
  %16 = sext i32 4 to i64                                                          ; inst 23
  %17 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %16               ; inst 24
  store i32 15, i32* %17                                                           ; inst 25
  %18 = sext i32 5 to i64                                                          ; inst 26
  %19 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %18               ; inst 27
  store i32 0, i32* %19                                                            ; inst 28
  %20 = sext i32 10 to i64                                                         ; inst 29
  %21 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %20               ; inst 30
  store i32 1, i32* %21                                                            ; inst 31
  %22 = sext i32 11 to i64                                                         ; inst 32
  %23 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %22               ; inst 33
  %24 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 34
  %25 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 35
  %26 = load i32, i32* %25                                                         ; inst 36
  %27 = sext i32 %26 to i64                                                        ; inst 37
  %28 = getelementptr [256 x i32], [256 x i32]* %24, i32 0, i64 %27                ; inst 38
  %29 = load i32, i32* %28                                                         ; inst 39
  store i32 %29, i32* %23                                                          ; inst 40
  %30 = sext i32 12 to i64                                                         ; inst 41
  %31 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %30               ; inst 42
  store i32 1, i32* %31                                                            ; inst 43
  %32 = sext i32 13 to i64                                                         ; inst 44
  %33 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %32               ; inst 45
  store i32 2, i32* %33                                                            ; inst 46
  %34 = sext i32 14 to i64                                                         ; inst 47
  %35 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %34               ; inst 48
  store i32 8, i32* %35                                                            ; inst 49
  %36 = sext i32 15 to i64                                                         ; inst 50
  %37 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %36               ; inst 51
  store i32 11, i32* %37                                                           ; inst 52
  %38 = sext i32 16 to i64                                                         ; inst 53
  %39 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %38               ; inst 54
  store i32 30, i32* %39                                                           ; inst 55
  %40 = sext i32 17 to i64                                                         ; inst 56
  %41 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %40               ; inst 57
  store i32 1, i32* %41                                                            ; inst 58
  %42 = sext i32 18 to i64                                                         ; inst 59
  %43 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %42               ; inst 60
  %44 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 61
  %45 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 62
  %46 = load i32, i32* %45                                                         ; inst 63
  %47 = sext i32 %46 to i64                                                        ; inst 64
  %48 = getelementptr [256 x i32], [256 x i32]* %44, i32 0, i64 %47                ; inst 65
  %49 = load i32, i32* %48                                                         ; inst 66
  store i32 %49, i32* %43                                                          ; inst 67
  %50 = sext i32 19 to i64                                                         ; inst 68
  %51 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %50               ; inst 69
  store i32 1, i32* %51                                                            ; inst 70
  %52 = sext i32 20 to i64                                                         ; inst 71
  %53 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %52               ; inst 72
  store i32 1, i32* %53                                                            ; inst 73
  %54 = sext i32 21 to i64                                                         ; inst 74
  %55 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %54               ; inst 75
  store i32 4, i32* %55                                                            ; inst 76
  %56 = sext i32 22 to i64                                                         ; inst 77
  %57 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %56               ; inst 78
  store i32 13, i32* %57                                                           ; inst 79
  %58 = sext i32 23 to i64                                                         ; inst 80
  %59 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %58               ; inst 81
  store i32 10, i32* %59                                                           ; inst 82
  %60 = sext i32 24 to i64                                                         ; inst 83
  %61 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %60               ; inst 84
  store i32 1, i32* %61                                                            ; inst 85
  %62 = sext i32 25 to i64                                                         ; inst 86
  %63 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %62               ; inst 87
  %64 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 88
  %65 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 89
  %66 = load i32, i32* %65                                                         ; inst 90
  %67 = add i32 %66, 1                                                             ; inst 91
  %68 = sext i32 %67 to i64                                                        ; inst 92
  %69 = getelementptr [256 x i32], [256 x i32]* %64, i32 0, i64 %68                ; inst 93
  %70 = load i32, i32* %69                                                         ; inst 94
  store i32 %70, i32* %63                                                          ; inst 95
  %71 = sext i32 26 to i64                                                         ; inst 96
  %72 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %71               ; inst 97
  store i32 1, i32* %72                                                            ; inst 98
  %73 = sext i32 27 to i64                                                         ; inst 99
  %74 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %73               ; inst 100
  store i32 2, i32* %74                                                            ; inst 101
  %75 = sext i32 28 to i64                                                         ; inst 102
  %76 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %75               ; inst 103
  store i32 4, i32* %76                                                            ; inst 104
  %77 = sext i32 29 to i64                                                         ; inst 105
  %78 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %77               ; inst 106
  store i32 13, i32* %78                                                           ; inst 107
  %79 = sext i32 30 to i64                                                         ; inst 108
  %80 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %79               ; inst 109
  store i32 10, i32* %80                                                           ; inst 110
  %81 = sext i32 31 to i64                                                         ; inst 111
  %82 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %81               ; inst 112
  store i32 3, i32* %82                                                            ; inst 113
  %83 = sext i32 32 to i64                                                         ; inst 114
  %84 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %83               ; inst 115
  store i32 14, i32* %84                                                           ; inst 116
  %85 = sext i32 30 to i64                                                         ; inst 117
  %86 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %85               ; inst 118
  store i32 2, i32* %86                                                            ; inst 119
  %87 = sext i32 31 to i64                                                         ; inst 120
  %88 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %87               ; inst 121
  store i32 1, i32* %88                                                            ; inst 122
  %89 = sext i32 32 to i64                                                         ; inst 123
  %90 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %89               ; inst 124
  %91 = getelementptr %VM, %VM* %0, i32 0, i32 2                                   ; inst 125
  %92 = getelementptr %VM, %VM* %0, i32 0, i32 1                                   ; inst 126
  %93 = load i32, i32* %92                                                         ; inst 127
  %94 = sext i32 %93 to i64                                                        ; inst 128
  %95 = getelementptr [256 x i32], [256 x i32]* %91, i32 0, i64 %94                ; inst 129
  %96 = load i32, i32* %95                                                         ; inst 130
  store i32 %96, i32* %90                                                          ; inst 131
  %97 = sext i32 33 to i64                                                         ; inst 132
  %98 = getelementptr [1024 x i32], [1024 x i32]* %2, i32 0, i64 %97               ; inst 133
  store i32 14, i32* %98                                                           ; inst 134
  %99 = alloca [1024 x i32]                                                        ; inst 135
  %100 = getelementptr %VM, %VM* %0, i32 0, i32 3                                  ; inst 136
  call void @memcpy([1024 x i32]* %99, [1024 x i32]* %100, i64 4096)               ; inst 137
  %101 = getelementptr %VM, %VM* %0, i32 0, i32 0                                  ; inst 138
  %102 = load i32, i32* %101                                                       ; inst 139
  %103 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 140
  %104 = load i32, i32* %103                                                       ; inst 141
  %105 = getelementptr %VM, %VM* %0, i32 0, i32 3                                  ; inst 142
  call void @memcpy([1024 x i32]* %105, [1024 x i32]* %2, i64 4096)                ; inst 143
  %106 = getelementptr %VM, %VM* %0, i32 0, i32 0                                  ; inst 144
  store i32 0, i32* %106                                                           ; inst 145
  %107 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 146
  %108 = trunc i64 256 to i32                                                      ; inst 147
  %109 = sub i32 %108, 1                                                           ; inst 148
  store i32 %109, i32* %107                                                        ; inst 149
  call void @execute(%VM* %0)                                                      ; inst 150
  %110 = getelementptr %VM, %VM* %0, i32 0, i32 3                                  ; inst 151
  call void @memcpy([1024 x i32]* %110, [1024 x i32]* %99, i64 4096)               ; inst 152
  %111 = getelementptr %VM, %VM* %0, i32 0, i32 0                                  ; inst 153
  store i32 %102, i32* %111                                                        ; inst 154
  %112 = getelementptr %VM, %VM* %0, i32 0, i32 1                                  ; inst 155
  store i32 %104, i32* %112                                                        ; inst 156
  ret void                                                                         ; inst 157
}

define void @error_case_test(%VM* %0) {
_0.entry.0:
  %1 = alloca %VM                                                                  ; inst 1
  call void @memcpy(%VM* %1, %VM* %0, i64 5128)                                    ; inst 2
  %2 = getelementptr %VM, %VM* %1, i32 0, i32 1                                    ; inst 3
  %3 = getelementptr %VM, %VM* %1, i32 0, i32 1                                    ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = add i32 %4, 10                                                              ; inst 6
  store i32 %5, i32* %2                                                            ; inst 7
  %6 = getelementptr %VM, %VM* %1, i32 0, i32 1                                    ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = trunc i64 256 to i32                                                        ; inst 10
  %9 = icmp sgt i32 %7, %8                                                         ; inst 11
  br i1 %9, label %_1.if.then.0, label %_2.if.else.0                               ; inst 12
_1.if.then.0:
  call void @printlnInt(i32 -100)                                                  ; inst 13
  br label %_3.if.exit.0                                                           ; inst 14
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 15
_3.if.exit.0:
  %10 = getelementptr %VM, %VM* %1, i32 0, i32 1                                   ; inst 16
  %11 = trunc i64 256 to i32                                                       ; inst 17
  %12 = sub i32 %11, 10                                                            ; inst 18
  store i32 %12, i32* %10                                                          ; inst 19
  %13 = call i32 @pop(%VM* %1)                                                     ; inst 20
  call void @printlnInt(i32 %13)                                                   ; inst 21
  ret void                                                                         ; inst 22
}

define void @another_test_scenario() {
_0.entry.0:
  %0 = alloca %VM                                                                  ; inst 1
  %1 = alloca %VM                                                                  ; inst 2
  %2 = getelementptr %VM, %VM* %1, i32 0, i32 0                                    ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr %VM, %VM* %1, i32 0, i32 1                                    ; inst 5
  %4 = trunc i64 256 to i32                                                        ; inst 6
  %5 = sub i32 %4, 1                                                               ; inst 7
  store i32 %5, i32* %3                                                            ; inst 8
  %6 = getelementptr %VM, %VM* %1, i32 0, i32 2                                    ; inst 9
  %7 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i32 0                    ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_1.array.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%11, %_2.array.body.0]                           ; inst 12
  %9 = icmp slt i32 %8, 256                                                        ; inst 13
  br i1 %9, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 14
_2.array.body.0:
  %10 = getelementptr i32, i32* %7, i32 %8                                         ; inst 15
  store i32 0, i32* %10                                                            ; inst 16
  %11 = add i32 %8, 1                                                              ; inst 17
  br label %_1.array.cond.0                                                        ; inst 18
_3.array.exit.0:
  %12 = getelementptr %VM, %VM* %1, i32 0, i32 3                                   ; inst 19
  %13 = getelementptr [1024 x i32], [1024 x i32]* %12, i32 0, i32 0                ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_4.array.cond.1:
  %14 = phi i32 [0, %_3.array.exit.0], [%17, %_5.array.body.1]                     ; inst 22
  %15 = icmp slt i32 %14, 1024                                                     ; inst 23
  br i1 %15, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 24
_5.array.body.1:
  %16 = getelementptr i32, i32* %13, i32 %14                                       ; inst 25
  store i32 0, i32* %16                                                            ; inst 26
  %17 = add i32 %14, 1                                                             ; inst 27
  br label %_4.array.cond.1                                                        ; inst 28
_6.array.exit.1:
  call void @run_fibonacci_in_vm(%VM* %1, i32 15)                                  ; inst 29
  call void @complex_stack_manipulation(%VM* %1)                                   ; inst 30
  call void @deep_recursive_test(%VM* %1, i32 30)                                  ; inst 31
  call void @memcpy(%VM* %0, %VM* %1, i64 5128)                                    ; inst 32
  call void @error_case_test(%VM* %0)                                              ; inst 33
  ret void                                                                         ; inst 34
}

