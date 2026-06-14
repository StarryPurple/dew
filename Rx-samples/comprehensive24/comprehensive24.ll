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



define void @main() {
_0.entry.0:
  call void @printlnInt(i32 42)                                                    ; inst 1
  %0 = alloca [16 x i32]                                                           ; inst 2
  %1 = getelementptr [16 x i32], [16 x i32]* %0, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 5
  %3 = icmp slt i32 %2, 16                                                         ; inst 6
  br i1 %3, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %4 = getelementptr i32, i32* %1, i32 %2                                          ; inst 8
  store i32 0, i32* %4                                                             ; inst 9
  %5 = add i32 %2, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %6 = alloca [16 x [16 x i32]]                                                    ; inst 12
  %7 = alloca [16 x i32]                                                           ; inst 13
  %8 = getelementptr [16 x i32], [16 x i32]* %7, i32 0, i32 0                      ; inst 14
  br label %_4.array.cond.1                                                        ; inst 15
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 16
  %10 = icmp slt i32 %9, 16                                                        ; inst 17
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 18
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 19
  store i32 0, i32* %11                                                            ; inst 20
  %12 = add i32 %9, 1                                                              ; inst 21
  br label %_4.array.cond.1                                                        ; inst 22
_6.array.exit.1:
  %13 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %6, i32 0, i32 0       ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %14 = phi i32 [0, %_6.array.exit.1], [%17, %_8.array.body.2]                     ; inst 25
  %15 = icmp slt i32 %14, 16                                                       ; inst 26
  br i1 %15, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %16 = getelementptr [16 x i32], [16 x i32]* %13, i32 %14                         ; inst 28
  call void @memcpy([16 x i32]* %16, [16 x i32]* %7, i64 64)                       ; inst 29
  %17 = add i32 %14, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %18 = alloca [64 x i32]                                                          ; inst 32
  %19 = getelementptr [64 x i32], [64 x i32]* %18, i32 0, i32 0                    ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %20 = phi i32 [0, %_9.array.exit.2], [%23, %_11.array.body.3]                    ; inst 35
  %21 = icmp slt i32 %20, 64                                                       ; inst 36
  br i1 %21, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %22 = getelementptr i32, i32* %19, i32 %20                                       ; inst 38
  store i32 0, i32* %22                                                            ; inst 39
  %23 = add i32 %20, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %24 = alloca [64 x i32]                                                          ; inst 42
  %25 = getelementptr [64 x i32], [64 x i32]* %24, i32 0, i32 0                    ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %26 = phi i32 [0, %_12.array.exit.3], [%29, %_14.array.body.4]                   ; inst 45
  %27 = icmp slt i32 %26, 64                                                       ; inst 46
  br i1 %27, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %28 = getelementptr i32, i32* %25, i32 %26                                       ; inst 48
  store i32 -1, i32* %28                                                           ; inst 49
  %29 = add i32 %26, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %30 = alloca [256 x i32]                                                         ; inst 52
  %31 = getelementptr [256 x i32], [256 x i32]* %30, i32 0, i32 0                  ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %32 = phi i32 [0, %_15.array.exit.4], [%35, %_17.array.body.5]                   ; inst 55
  %33 = icmp slt i32 %32, 256                                                      ; inst 56
  br i1 %33, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %34 = getelementptr i32, i32* %31, i32 %32                                       ; inst 58
  store i32 0, i32* %34                                                            ; inst 59
  %35 = add i32 %32, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  %36 = alloca [256 x i1]                                                          ; inst 62
  %37 = getelementptr [256 x i1], [256 x i1]* %36, i32 0, i32 0                    ; inst 63
  br label %_19.array.cond.6                                                       ; inst 64
_19.array.cond.6:
  %38 = phi i32 [0, %_18.array.exit.5], [%41, %_20.array.body.6]                   ; inst 65
  %39 = icmp slt i32 %38, 256                                                      ; inst 66
  br i1 %39, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 67
_20.array.body.6:
  %40 = getelementptr i1, i1* %37, i32 %38                                         ; inst 68
  store i1 0, i1* %40                                                              ; inst 69
  %41 = add i32 %38, 1                                                             ; inst 70
  br label %_19.array.cond.6                                                       ; inst 71
_21.array.exit.6:
  %42 = alloca [256 x i1]                                                          ; inst 72
  %43 = getelementptr [256 x i1], [256 x i1]* %42, i32 0, i32 0                    ; inst 73
  br label %_22.array.cond.7                                                       ; inst 74
_22.array.cond.7:
  %44 = phi i32 [0, %_21.array.exit.6], [%47, %_23.array.body.7]                   ; inst 75
  %45 = icmp slt i32 %44, 256                                                      ; inst 76
  br i1 %45, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 77
_23.array.body.7:
  %46 = getelementptr i1, i1* %43, i32 %44                                         ; inst 78
  store i1 0, i1* %46                                                              ; inst 79
  %47 = add i32 %44, 1                                                             ; inst 80
  br label %_22.array.cond.7                                                       ; inst 81
_24.array.exit.7:
  %48 = alloca i32                                                                 ; inst 82
  store i32 0, i32* %48                                                            ; inst 83
  %49 = alloca [1000 x i32]                                                        ; inst 84
  %50 = getelementptr [1000 x i32], [1000 x i32]* %49, i32 0, i32 0                ; inst 85
  br label %_25.array.cond.8                                                       ; inst 86
_25.array.cond.8:
  %51 = phi i32 [0, %_24.array.exit.7], [%54, %_26.array.body.8]                   ; inst 87
  %52 = icmp slt i32 %51, 1000                                                     ; inst 88
  br i1 %52, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 89
_26.array.body.8:
  %53 = getelementptr i32, i32* %50, i32 %51                                       ; inst 90
  store i32 0, i32* %53                                                            ; inst 91
  %54 = add i32 %51, 1                                                             ; inst 92
  br label %_25.array.cond.8                                                       ; inst 93
_27.array.exit.8:
  %55 = alloca [64 x [4 x i32]]                                                    ; inst 94
  %56 = alloca [4 x i32]                                                           ; inst 95
  %57 = getelementptr [4 x i32], [4 x i32]* %56, i32 0, i32 0                      ; inst 96
  br label %_28.array.cond.9                                                       ; inst 97
_28.array.cond.9:
  %58 = phi i32 [0, %_27.array.exit.8], [%61, %_29.array.body.9]                   ; inst 98
  %59 = icmp slt i32 %58, 4                                                        ; inst 99
  br i1 %59, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 100
_29.array.body.9:
  %60 = getelementptr i32, i32* %57, i32 %58                                       ; inst 101
  store i32 0, i32* %60                                                            ; inst 102
  %61 = add i32 %58, 1                                                             ; inst 103
  br label %_28.array.cond.9                                                       ; inst 104
_30.array.exit.9:
  %62 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %55, i32 0, i32 0        ; inst 105
  br label %_31.array.cond.10                                                      ; inst 106
_31.array.cond.10:
  %63 = phi i32 [0, %_30.array.exit.9], [%66, %_32.array.body.10]                  ; inst 107
  %64 = icmp slt i32 %63, 64                                                       ; inst 108
  br i1 %64, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 109
_32.array.body.10:
  %65 = getelementptr [4 x i32], [4 x i32]* %62, i32 %63                           ; inst 110
  call void @memcpy([4 x i32]* %65, [4 x i32]* %56, i64 16)                        ; inst 111
  %66 = add i32 %63, 1                                                             ; inst 112
  br label %_31.array.cond.10                                                      ; inst 113
_33.array.exit.10:
  %67 = alloca [64 x [4 x i32]]                                                    ; inst 114
  %68 = alloca [4 x i32]                                                           ; inst 115
  %69 = getelementptr [4 x i32], [4 x i32]* %68, i32 0, i32 0                      ; inst 116
  br label %_34.array.cond.11                                                      ; inst 117
_34.array.cond.11:
  %70 = phi i32 [0, %_33.array.exit.10], [%73, %_35.array.body.11]                 ; inst 118
  %71 = icmp slt i32 %70, 4                                                        ; inst 119
  br i1 %71, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 120
_35.array.body.11:
  %72 = getelementptr i32, i32* %69, i32 %70                                       ; inst 121
  store i32 -1, i32* %72                                                           ; inst 122
  %73 = add i32 %70, 1                                                             ; inst 123
  br label %_34.array.cond.11                                                      ; inst 124
_36.array.exit.11:
  %74 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %67, i32 0, i32 0        ; inst 125
  br label %_37.array.cond.12                                                      ; inst 126
_37.array.cond.12:
  %75 = phi i32 [0, %_36.array.exit.11], [%78, %_38.array.body.12]                 ; inst 127
  %76 = icmp slt i32 %75, 64                                                       ; inst 128
  br i1 %76, label %_38.array.body.12, label %_39.array.exit.12                    ; inst 129
_38.array.body.12:
  %77 = getelementptr [4 x i32], [4 x i32]* %74, i32 %75                           ; inst 130
  call void @memcpy([4 x i32]* %77, [4 x i32]* %68, i64 16)                        ; inst 131
  %78 = add i32 %75, 1                                                             ; inst 132
  br label %_37.array.cond.12                                                      ; inst 133
_39.array.exit.12:
  %79 = alloca [64 x [4 x i1]]                                                     ; inst 134
  %80 = alloca [4 x i1]                                                            ; inst 135
  %81 = getelementptr [4 x i1], [4 x i1]* %80, i32 0, i32 0                        ; inst 136
  br label %_40.array.cond.13                                                      ; inst 137
_40.array.cond.13:
  %82 = phi i32 [0, %_39.array.exit.12], [%85, %_41.array.body.13]                 ; inst 138
  %83 = icmp slt i32 %82, 4                                                        ; inst 139
  br i1 %83, label %_41.array.body.13, label %_42.array.exit.13                    ; inst 140
_41.array.body.13:
  %84 = getelementptr i1, i1* %81, i32 %82                                         ; inst 141
  store i1 0, i1* %84                                                              ; inst 142
  %85 = add i32 %82, 1                                                             ; inst 143
  br label %_40.array.cond.13                                                      ; inst 144
_42.array.exit.13:
  %86 = getelementptr [64 x [4 x i1]], [64 x [4 x i1]]* %79, i32 0, i32 0          ; inst 145
  br label %_43.array.cond.14                                                      ; inst 146
_43.array.cond.14:
  %87 = phi i32 [0, %_42.array.exit.13], [%90, %_44.array.body.14]                 ; inst 147
  %88 = icmp slt i32 %87, 64                                                       ; inst 148
  br i1 %88, label %_44.array.body.14, label %_45.array.exit.14                    ; inst 149
_44.array.body.14:
  %89 = getelementptr [4 x i1], [4 x i1]* %86, i32 %87                             ; inst 150
  call void @memcpy([4 x i1]* %89, [4 x i1]* %80, i64 4)                           ; inst 151
  %90 = add i32 %87, 1                                                             ; inst 152
  br label %_43.array.cond.14                                                      ; inst 153
_45.array.exit.14:
  %91 = alloca [64 x [4 x i32]]                                                    ; inst 154
  %92 = alloca [4 x i32]                                                           ; inst 155
  %93 = getelementptr [4 x i32], [4 x i32]* %92, i32 0, i32 0                      ; inst 156
  br label %_46.array.cond.15                                                      ; inst 157
_46.array.cond.15:
  %94 = phi i32 [0, %_45.array.exit.14], [%97, %_47.array.body.15]                 ; inst 158
  %95 = icmp slt i32 %94, 4                                                        ; inst 159
  br i1 %95, label %_47.array.body.15, label %_48.array.exit.15                    ; inst 160
_47.array.body.15:
  %96 = getelementptr i32, i32* %93, i32 %94                                       ; inst 161
  store i32 0, i32* %96                                                            ; inst 162
  %97 = add i32 %94, 1                                                             ; inst 163
  br label %_46.array.cond.15                                                      ; inst 164
_48.array.exit.15:
  %98 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %91, i32 0, i32 0        ; inst 165
  br label %_49.array.cond.16                                                      ; inst 166
_49.array.cond.16:
  %99 = phi i32 [0, %_48.array.exit.15], [%102, %_50.array.body.16]                ; inst 167
  %100 = icmp slt i32 %99, 64                                                      ; inst 168
  br i1 %100, label %_50.array.body.16, label %_51.array.exit.16                   ; inst 169
_50.array.body.16:
  %101 = getelementptr [4 x i32], [4 x i32]* %98, i32 %99                          ; inst 170
  call void @memcpy([4 x i32]* %101, [4 x i32]* %92, i64 16)                       ; inst 171
  %102 = add i32 %99, 1                                                            ; inst 172
  br label %_49.array.cond.16                                                      ; inst 173
_51.array.exit.16:
  %103 = alloca [128 x [8 x i32]]                                                  ; inst 174
  %104 = alloca [8 x i32]                                                          ; inst 175
  %105 = getelementptr [8 x i32], [8 x i32]* %104, i32 0, i32 0                    ; inst 176
  br label %_52.array.cond.17                                                      ; inst 177
_52.array.cond.17:
  %106 = phi i32 [0, %_51.array.exit.16], [%109, %_53.array.body.17]               ; inst 178
  %107 = icmp slt i32 %106, 8                                                      ; inst 179
  br i1 %107, label %_53.array.body.17, label %_54.array.exit.17                   ; inst 180
_53.array.body.17:
  %108 = getelementptr i32, i32* %105, i32 %106                                    ; inst 181
  store i32 0, i32* %108                                                           ; inst 182
  %109 = add i32 %106, 1                                                           ; inst 183
  br label %_52.array.cond.17                                                      ; inst 184
_54.array.exit.17:
  %110 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %103, i32 0, i32 0    ; inst 185
  br label %_55.array.cond.18                                                      ; inst 186
_55.array.cond.18:
  %111 = phi i32 [0, %_54.array.exit.17], [%114, %_56.array.body.18]               ; inst 187
  %112 = icmp slt i32 %111, 128                                                    ; inst 188
  br i1 %112, label %_56.array.body.18, label %_57.array.exit.18                   ; inst 189
_56.array.body.18:
  %113 = getelementptr [8 x i32], [8 x i32]* %110, i32 %111                        ; inst 190
  call void @memcpy([8 x i32]* %113, [8 x i32]* %104, i64 32)                      ; inst 191
  %114 = add i32 %111, 1                                                           ; inst 192
  br label %_55.array.cond.18                                                      ; inst 193
_57.array.exit.18:
  %115 = alloca [128 x [8 x i32]]                                                  ; inst 194
  %116 = alloca [8 x i32]                                                          ; inst 195
  %117 = getelementptr [8 x i32], [8 x i32]* %116, i32 0, i32 0                    ; inst 196
  br label %_58.array.cond.19                                                      ; inst 197
_58.array.cond.19:
  %118 = phi i32 [0, %_57.array.exit.18], [%121, %_59.array.body.19]               ; inst 198
  %119 = icmp slt i32 %118, 8                                                      ; inst 199
  br i1 %119, label %_59.array.body.19, label %_60.array.exit.19                   ; inst 200
_59.array.body.19:
  %120 = getelementptr i32, i32* %117, i32 %118                                    ; inst 201
  store i32 -1, i32* %120                                                          ; inst 202
  %121 = add i32 %118, 1                                                           ; inst 203
  br label %_58.array.cond.19                                                      ; inst 204
_60.array.exit.19:
  %122 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %115, i32 0, i32 0    ; inst 205
  br label %_61.array.cond.20                                                      ; inst 206
_61.array.cond.20:
  %123 = phi i32 [0, %_60.array.exit.19], [%126, %_62.array.body.20]               ; inst 207
  %124 = icmp slt i32 %123, 128                                                    ; inst 208
  br i1 %124, label %_62.array.body.20, label %_63.array.exit.20                   ; inst 209
_62.array.body.20:
  %125 = getelementptr [8 x i32], [8 x i32]* %122, i32 %123                        ; inst 210
  call void @memcpy([8 x i32]* %125, [8 x i32]* %116, i64 32)                      ; inst 211
  %126 = add i32 %123, 1                                                           ; inst 212
  br label %_61.array.cond.20                                                      ; inst 213
_63.array.exit.20:
  %127 = alloca [128 x [8 x i1]]                                                   ; inst 214
  %128 = alloca [8 x i1]                                                           ; inst 215
  %129 = getelementptr [8 x i1], [8 x i1]* %128, i32 0, i32 0                      ; inst 216
  br label %_64.array.cond.21                                                      ; inst 217
_64.array.cond.21:
  %130 = phi i32 [0, %_63.array.exit.20], [%133, %_65.array.body.21]               ; inst 218
  %131 = icmp slt i32 %130, 8                                                      ; inst 219
  br i1 %131, label %_65.array.body.21, label %_66.array.exit.21                   ; inst 220
_65.array.body.21:
  %132 = getelementptr i1, i1* %129, i32 %130                                      ; inst 221
  store i1 0, i1* %132                                                             ; inst 222
  %133 = add i32 %130, 1                                                           ; inst 223
  br label %_64.array.cond.21                                                      ; inst 224
_66.array.exit.21:
  %134 = getelementptr [128 x [8 x i1]], [128 x [8 x i1]]* %127, i32 0, i32 0      ; inst 225
  br label %_67.array.cond.22                                                      ; inst 226
_67.array.cond.22:
  %135 = phi i32 [0, %_66.array.exit.21], [%138, %_68.array.body.22]               ; inst 227
  %136 = icmp slt i32 %135, 128                                                    ; inst 228
  br i1 %136, label %_68.array.body.22, label %_69.array.exit.22                   ; inst 229
_68.array.body.22:
  %137 = getelementptr [8 x i1], [8 x i1]* %134, i32 %135                          ; inst 230
  call void @memcpy([8 x i1]* %137, [8 x i1]* %128, i64 8)                         ; inst 231
  %138 = add i32 %135, 1                                                           ; inst 232
  br label %_67.array.cond.22                                                      ; inst 233
_69.array.exit.22:
  %139 = alloca [128 x [8 x i32]]                                                  ; inst 234
  %140 = alloca [8 x i32]                                                          ; inst 235
  %141 = getelementptr [8 x i32], [8 x i32]* %140, i32 0, i32 0                    ; inst 236
  br label %_70.array.cond.23                                                      ; inst 237
_70.array.cond.23:
  %142 = phi i32 [0, %_69.array.exit.22], [%145, %_71.array.body.23]               ; inst 238
  %143 = icmp slt i32 %142, 8                                                      ; inst 239
  br i1 %143, label %_71.array.body.23, label %_72.array.exit.23                   ; inst 240
_71.array.body.23:
  %144 = getelementptr i32, i32* %141, i32 %142                                    ; inst 241
  store i32 0, i32* %144                                                           ; inst 242
  %145 = add i32 %142, 1                                                           ; inst 243
  br label %_70.array.cond.23                                                      ; inst 244
_72.array.exit.23:
  %146 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %139, i32 0, i32 0    ; inst 245
  br label %_73.array.cond.24                                                      ; inst 246
_73.array.cond.24:
  %147 = phi i32 [0, %_72.array.exit.23], [%150, %_74.array.body.24]               ; inst 247
  %148 = icmp slt i32 %147, 128                                                    ; inst 248
  br i1 %148, label %_74.array.body.24, label %_75.array.exit.24                   ; inst 249
_74.array.body.24:
  %149 = getelementptr [8 x i32], [8 x i32]* %146, i32 %147                        ; inst 250
  call void @memcpy([8 x i32]* %149, [8 x i32]* %140, i64 32)                      ; inst 251
  %150 = add i32 %147, 1                                                           ; inst 252
  br label %_73.array.cond.24                                                      ; inst 253
_75.array.exit.24:
  %151 = alloca [16 x i32]                                                         ; inst 254
  %152 = getelementptr [16 x i32], [16 x i32]* %151, i32 0, i32 0                  ; inst 255
  br label %_76.array.cond.25                                                      ; inst 256
_76.array.cond.25:
  %153 = phi i32 [0, %_75.array.exit.24], [%156, %_77.array.body.25]               ; inst 257
  %154 = icmp slt i32 %153, 16                                                     ; inst 258
  br i1 %154, label %_77.array.body.25, label %_78.array.exit.25                   ; inst 259
_77.array.body.25:
  %155 = getelementptr i32, i32* %152, i32 %153                                    ; inst 260
  store i32 -1, i32* %155                                                          ; inst 261
  %156 = add i32 %153, 1                                                           ; inst 262
  br label %_76.array.cond.25                                                      ; inst 263
_78.array.exit.25:
  %157 = alloca [16 x i32]                                                         ; inst 264
  %158 = getelementptr [16 x i32], [16 x i32]* %157, i32 0, i32 0                  ; inst 265
  br label %_79.array.cond.26                                                      ; inst 266
_79.array.cond.26:
  %159 = phi i32 [0, %_78.array.exit.25], [%162, %_80.array.body.26]               ; inst 267
  %160 = icmp slt i32 %159, 16                                                     ; inst 268
  br i1 %160, label %_80.array.body.26, label %_81.array.exit.26                   ; inst 269
_80.array.body.26:
  %161 = getelementptr i32, i32* %158, i32 %159                                    ; inst 270
  store i32 -1, i32* %161                                                          ; inst 271
  %162 = add i32 %159, 1                                                           ; inst 272
  br label %_79.array.cond.26                                                      ; inst 273
_81.array.exit.26:
  %163 = alloca [16 x i1]                                                          ; inst 274
  %164 = getelementptr [16 x i1], [16 x i1]* %163, i32 0, i32 0                    ; inst 275
  br label %_82.array.cond.27                                                      ; inst 276
_82.array.cond.27:
  %165 = phi i32 [0, %_81.array.exit.26], [%168, %_83.array.body.27]               ; inst 277
  %166 = icmp slt i32 %165, 16                                                     ; inst 278
  br i1 %166, label %_83.array.body.27, label %_84.array.exit.27                   ; inst 279
_83.array.body.27:
  %167 = getelementptr i1, i1* %164, i32 %165                                      ; inst 280
  store i1 0, i1* %167                                                             ; inst 281
  %168 = add i32 %165, 1                                                           ; inst 282
  br label %_82.array.cond.27                                                      ; inst 283
_84.array.exit.27:
  %169 = alloca [16 x i32]                                                         ; inst 284
  %170 = getelementptr [16 x i32], [16 x i32]* %169, i32 0, i32 0                  ; inst 285
  br label %_85.array.cond.28                                                      ; inst 286
_85.array.cond.28:
  %171 = phi i32 [0, %_84.array.exit.27], [%174, %_86.array.body.28]               ; inst 287
  %172 = icmp slt i32 %171, 16                                                     ; inst 288
  br i1 %172, label %_86.array.body.28, label %_87.array.exit.28                   ; inst 289
_86.array.body.28:
  %173 = getelementptr i32, i32* %170, i32 %171                                    ; inst 290
  store i32 0, i32* %173                                                           ; inst 291
  %174 = add i32 %171, 1                                                           ; inst 292
  br label %_85.array.cond.28                                                      ; inst 293
_87.array.exit.28:
  %175 = alloca [64 x i32]                                                         ; inst 294
  %176 = getelementptr [64 x i32], [64 x i32]* %175, i32 0, i32 0                  ; inst 295
  br label %_88.array.cond.29                                                      ; inst 296
_88.array.cond.29:
  %177 = phi i32 [0, %_87.array.exit.28], [%180, %_89.array.body.29]               ; inst 297
  %178 = icmp slt i32 %177, 64                                                     ; inst 298
  br i1 %178, label %_89.array.body.29, label %_90.array.exit.29                   ; inst 299
_89.array.body.29:
  %179 = getelementptr i32, i32* %176, i32 %177                                    ; inst 300
  store i32 0, i32* %179                                                           ; inst 301
  %180 = add i32 %177, 1                                                           ; inst 302
  br label %_88.array.cond.29                                                      ; inst 303
_90.array.exit.29:
  %181 = alloca i32                                                                ; inst 304
  store i32 64, i32* %181                                                          ; inst 305
  br label %_91.while.cond.0                                                       ; inst 306
_91.while.cond.0:
  %182 = phi i32 [0, %_90.array.exit.29], [%188, %_92.while.body.0]                ; inst 307
  %183 = icmp slt i32 %182, 64                                                     ; inst 308
  br i1 %183, label %_92.while.body.0, label %_93.while.exit.0                     ; inst 309
_92.while.body.0:
  %184 = sext i32 %182 to i64                                                      ; inst 310
  %185 = getelementptr [64 x i32], [64 x i32]* %175, i32 0, i64 %184               ; inst 311
  store i32 %182, i32* %185                                                        ; inst 312
  %186 = sext i32 %182 to i64                                                      ; inst 313
  %187 = getelementptr [64 x i32], [64 x i32]* %18, i32 0, i64 %186                ; inst 314
  store i32 0, i32* %187                                                           ; inst 315
  %188 = add i32 %182, 1                                                           ; inst 316
  br label %_91.while.cond.0                                                       ; inst 317
_93.while.exit.0:
  br label %_94.while.cond.1                                                       ; inst 318
_94.while.cond.1:
  %189 = phi i32 [0, %_93.while.exit.0], [%270, %_143.if.exit.13]                  ; inst 319
  %190 = phi i32 [0, %_93.while.exit.0], [%209, %_143.if.exit.13]                  ; inst 320
  %191 = phi i32 [50, %_93.while.exit.0], [%296, %_143.if.exit.13]                 ; inst 321
  %192 = phi i32 [0, %_93.while.exit.0], [%271, %_143.if.exit.13]                  ; inst 322
  %193 = phi i32 [0, %_93.while.exit.0], [%248, %_143.if.exit.13]                  ; inst 323
  %194 = phi i32 [0, %_93.while.exit.0], [%272, %_143.if.exit.13]                  ; inst 324
  %195 = phi i32 [0, %_93.while.exit.0], [%299, %_143.if.exit.13]                  ; inst 325
  %196 = phi i32 [0, %_93.while.exit.0], [%205, %_143.if.exit.13]                  ; inst 326
  %197 = phi i32 [0, %_93.while.exit.0], [%249, %_143.if.exit.13]                  ; inst 327
  %198 = phi i32 [0, %_93.while.exit.0], [%273, %_143.if.exit.13]                  ; inst 328
  %199 = phi i32 [0, %_93.while.exit.0], [%274, %_143.if.exit.13]                  ; inst 329
  %200 = icmp slt i32 %195, 5000                                                   ; inst 330
  br i1 %200, label %_95.while.body.1, label %_144.while.exit.1                    ; inst 331
_95.while.body.1:
  %201 = add i32 %199, 1                                                           ; inst 332
  %202 = call i32 @generate_memory_access_pattern(i32 %195, i32 5000)              ; inst 333
  %203 = sdiv i32 %202, 4096                                                       ; inst 334
  %204 = srem i32 %202, 4096                                                       ; inst 335
  %205 = add i32 %196, 1                                                           ; inst 336
  %206 = sext i32 %190 to i64                                                      ; inst 337
  %207 = getelementptr [1000 x i32], [1000 x i32]* %49, i32 0, i64 %206            ; inst 338
  store i32 %203, i32* %207                                                        ; inst 339
  %208 = add i32 %190, 1                                                           ; inst 340
  %209 = srem i32 %208, 1000                                                       ; inst 341
  %210 = call i1 @lookup_tlb(i32 %203, [16 x i32]* %151, [16 x i1]* %163)          ; inst 342
  br i1 %210, label %_96.if.then.0, label %_97.if.else.0                           ; inst 343
_96.if.then.0:
  %211 = add i32 %193, 1                                                           ; inst 344
  br label %_107.if.exit.0                                                         ; inst 345
_97.if.else.0:
  %212 = sdiv i32 %203, 16                                                         ; inst 346
  %213 = srem i32 %203, 16                                                         ; inst 347
  %214 = sext i32 %212 to i64                                                      ; inst 348
  %215 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %6, i32 0, i64 %214   ; inst 349
  %216 = sext i32 %213 to i64                                                      ; inst 350
  %217 = getelementptr [16 x i32], [16 x i32]* %215, i32 0, i64 %216               ; inst 351
  %218 = load i32, i32* %217                                                       ; inst 352
  %219 = icmp sgt i32 %218, 0                                                      ; inst 353
  br i1 %219, label %_98.if.then.1, label %_99.if.else.1                           ; inst 354
_98.if.then.1:
  %220 = sub i32 %218, 1                                                           ; inst 355
  %221 = sext i32 %203 to i64                                                      ; inst 356
  %222 = getelementptr [256 x i1], [256 x i1]* %36, i32 0, i64 %221                ; inst 357
  store i1 1, i1* %222                                                             ; inst 358
  %223 = sext i32 %203 to i64                                                      ; inst 359
  %224 = getelementptr [256 x i32], [256 x i32]* %30, i32 0, i64 %223              ; inst 360
  store i32 %201, i32* %224                                                        ; inst 361
  call void @update_tlb(i32 %203, i32 %220, [16 x i32]* %151, [16 x i32]* %157, [16 x i1]* %163, [16 x i32]* %169) ; inst 362
  br label %_106.if.exit.1                                                         ; inst 363
_99.if.else.1:
  %225 = add i32 %197, 1                                                           ; inst 364
  %226 = load i32, i32* %181                                                       ; inst 365
  %227 = icmp sgt i32 %226, 0                                                      ; inst 366
  br i1 %227, label %_100.if.then.2, label %_101.if.else.2                         ; inst 367
_100.if.then.2:
  %228 = call i32 @allocate_free_frame([64 x i32]* %175, i32* %181, [64 x i32]* %18) ; inst 368
  br label %_102.if.exit.2                                                         ; inst 369
_101.if.else.2:
  %229 = call i32 @page_replacement_algorithm([16 x [16 x i32]]* %6, [64 x i32]* %24, [256 x i1]* %36, [256 x i1]* %42, i32* %48, [256 x i32]* %30, [1000 x i32]* %49, i32 %209, i32 %191, i32 %201, i32 %195) ; inst 370
  br label %_102.if.exit.2                                                         ; inst 371
_102.if.exit.2:
  %230 = phi i32 [%228, %_100.if.then.2], [%229, %_101.if.else.2]                  ; inst 372
  %231 = icmp sge i32 %230, 0                                                      ; inst 373
  br i1 %231, label %_103.if.then.3, label %_104.if.else.3                         ; inst 374
_103.if.then.3:
  %232 = sext i32 %212 to i64                                                      ; inst 375
  %233 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %6, i32 0, i64 %232   ; inst 376
  %234 = sext i32 %213 to i64                                                      ; inst 377
  %235 = getelementptr [16 x i32], [16 x i32]* %233, i32 0, i64 %234               ; inst 378
  %236 = add i32 %230, 1                                                           ; inst 379
  store i32 %236, i32* %235                                                        ; inst 380
  %237 = sext i32 %230 to i64                                                      ; inst 381
  %238 = getelementptr [64 x i32], [64 x i32]* %24, i32 0, i64 %237                ; inst 382
  store i32 %203, i32* %238                                                        ; inst 383
  %239 = sext i32 %203 to i64                                                      ; inst 384
  %240 = getelementptr [256 x i1], [256 x i1]* %36, i32 0, i64 %239                ; inst 385
  store i1 1, i1* %240                                                             ; inst 386
  %241 = sext i32 %203 to i64                                                      ; inst 387
  %242 = getelementptr [256 x i32], [256 x i32]* %30, i32 0, i64 %241              ; inst 388
  store i32 %201, i32* %242                                                        ; inst 389
  %243 = sext i32 %230 to i64                                                      ; inst 390
  %244 = getelementptr [64 x i32], [64 x i32]* %18, i32 0, i64 %243                ; inst 391
  store i32 1, i32* %244                                                           ; inst 392
  call void @update_tlb(i32 %203, i32 %230, [16 x i32]* %151, [16 x i32]* %157, [16 x i1]* %163, [16 x i32]* %169) ; inst 393
  br label %_105.if.exit.3                                                         ; inst 394
_104.if.else.3:
  br label %_105.if.exit.3                                                         ; inst 395
_105.if.exit.3:
  br label %_106.if.exit.1                                                         ; inst 396
_106.if.exit.1:
  %245 = phi i32 [%197, %_98.if.then.1], [%225, %_105.if.exit.3]                   ; inst 397
  %246 = phi i32 [%220, %_98.if.then.1], [%230, %_105.if.exit.3]                   ; inst 398
  %247 = add i32 %201, 100                                                         ; inst 399
  br label %_107.if.exit.0                                                         ; inst 400
_107.if.exit.0:
  %248 = phi i32 [%211, %_96.if.then.0], [%193, %_106.if.exit.1]                   ; inst 401
  %249 = phi i32 [%197, %_96.if.then.0], [%245, %_106.if.exit.1]                   ; inst 402
  %250 = phi i32 [%201, %_96.if.then.0], [%247, %_106.if.exit.1]                   ; inst 403
  %251 = phi i32 [-1, %_96.if.then.0], [%246, %_106.if.exit.1]                     ; inst 404
  %252 = icmp sge i32 %251, 0                                                      ; inst 405
  br i1 %252, label %_108.if.then.4, label %_115.if.else.4                         ; inst 406
_108.if.then.4:
  %253 = mul i32 %251, 4096                                                        ; inst 407
  %254 = add i32 %253, %204                                                        ; inst 408
  %255 = call i1 @access_l1_cache(i32 %254, [64 x [4 x i32]]* %55, [64 x [4 x i32]]* %67, [64 x [4 x i1]]* %79, [64 x [4 x i32]]* %91, i32 %250) ; inst 409
  br i1 %255, label %_109.if.then.5, label %_110.if.else.5                         ; inst 410
_109.if.then.5:
  %256 = add i32 %198, 1                                                           ; inst 411
  br label %_114.if.exit.5                                                         ; inst 412
_110.if.else.5:
  %257 = add i32 %194, 1                                                           ; inst 413
  %258 = call i1 @access_l2_cache(i32 %254, [128 x [8 x i32]]* %103, [128 x [8 x i32]]* %115, [128 x [8 x i1]]* %127, [128 x [8 x i32]]* %139, i32 %250) ; inst 414
  br i1 %258, label %_111.if.then.6, label %_112.if.else.6                         ; inst 415
_111.if.then.6:
  %259 = add i32 %192, 1                                                           ; inst 416
  br label %_113.if.exit.6                                                         ; inst 417
_112.if.else.6:
  %260 = add i32 %189, 1                                                           ; inst 418
  %261 = add i32 %250, 200                                                         ; inst 419
  br label %_113.if.exit.6                                                         ; inst 420
_113.if.exit.6:
  %262 = phi i32 [%189, %_111.if.then.6], [%260, %_112.if.else.6]                  ; inst 421
  %263 = phi i32 [%259, %_111.if.then.6], [%192, %_112.if.else.6]                  ; inst 422
  %264 = phi i32 [%250, %_111.if.then.6], [%261, %_112.if.else.6]                  ; inst 423
  br label %_114.if.exit.5                                                         ; inst 424
_114.if.exit.5:
  %265 = phi i32 [%189, %_109.if.then.5], [%262, %_113.if.exit.6]                  ; inst 425
  %266 = phi i32 [%192, %_109.if.then.5], [%263, %_113.if.exit.6]                  ; inst 426
  %267 = phi i32 [%194, %_109.if.then.5], [%257, %_113.if.exit.6]                  ; inst 427
  %268 = phi i32 [%256, %_109.if.then.5], [%198, %_113.if.exit.6]                  ; inst 428
  %269 = phi i32 [%250, %_109.if.then.5], [%264, %_113.if.exit.6]                  ; inst 429
  br label %_116.if.exit.4                                                         ; inst 430
_115.if.else.4:
  br label %_116.if.exit.4                                                         ; inst 431
_116.if.exit.4:
  %270 = phi i32 [%265, %_114.if.exit.5], [%189, %_115.if.else.4]                  ; inst 432
  %271 = phi i32 [%266, %_114.if.exit.5], [%192, %_115.if.else.4]                  ; inst 433
  %272 = phi i32 [%267, %_114.if.exit.5], [%194, %_115.if.else.4]                  ; inst 434
  %273 = phi i32 [%268, %_114.if.exit.5], [%198, %_115.if.else.4]                  ; inst 435
  %274 = phi i32 [%269, %_114.if.exit.5], [%250, %_115.if.else.4]                  ; inst 436
  %275 = srem i32 %195, 4                                                          ; inst 437
  %276 = icmp eq i32 %275, 0                                                       ; inst 438
  br i1 %276, label %_117.lazy.then.0, label %_118.lazy.else.0                     ; inst 439
_117.lazy.then.0:
  %277 = icmp slt i32 %203, 256                                                    ; inst 440
  br label %_119.lazy.exit.0                                                       ; inst 441
_118.lazy.else.0:
  br label %_119.lazy.exit.0                                                       ; inst 442
_119.lazy.exit.0:
  %278 = phi i1 [%277, %_117.lazy.then.0], [0, %_118.lazy.else.0]                  ; inst 443
  br i1 %278, label %_120.if.then.7, label %_121.if.else.7                         ; inst 444
_120.if.then.7:
  %279 = sext i32 %203 to i64                                                      ; inst 445
  %280 = getelementptr [256 x i1], [256 x i1]* %42, i32 0, i64 %279                ; inst 446
  store i1 1, i1* %280                                                             ; inst 447
  br label %_122.if.exit.7                                                         ; inst 448
_121.if.else.7:
  br label %_122.if.exit.7                                                         ; inst 449
_122.if.exit.7:
  %281 = srem i32 %195, 500                                                        ; inst 450
  %282 = icmp eq i32 %281, 0                                                       ; inst 451
  br i1 %282, label %_123.if.then.8, label %_127.if.else.8                         ; inst 452
_123.if.then.8:
  %283 = call i32 @analyze_memory_fragmentation([64 x i32]* %18, i32 64)           ; inst 453
  %284 = icmp sgt i32 %283, 30                                                     ; inst 454
  br i1 %284, label %_124.if.then.9, label %_125.if.else.9                         ; inst 455
_124.if.then.9:
  call void @compact_memory([16 x [16 x i32]]* %6, [64 x i32]* %24, [64 x i32]* %18, [64 x i32]* %175, i32* %181, i32 64) ; inst 456
  br label %_126.if.exit.9                                                         ; inst 457
_125.if.else.9:
  br label %_126.if.exit.9                                                         ; inst 458
_126.if.exit.9:
  br label %_128.if.exit.8                                                         ; inst 459
_127.if.else.8:
  br label %_128.if.exit.8                                                         ; inst 460
_128.if.exit.8:
  %285 = srem i32 %195, 100                                                        ; inst 461
  %286 = icmp eq i32 %285, 0                                                       ; inst 462
  br i1 %286, label %_129.if.then.10, label %_139.if.else.10                       ; inst 463
_129.if.then.10:
  %287 = call i32 @calculate_working_set_size([1000 x i32]* %49, i32 %209, i32 %191) ; inst 464
  %288 = icmp sgt i32 %287, 40                                                     ; inst 465
  br i1 %288, label %_130.if.then.11, label %_131.if.else.11                       ; inst 466
_130.if.then.11:
  %289 = add i32 %191, 5                                                           ; inst 467
  br label %_138.if.exit.11                                                        ; inst 468
_131.if.else.11:
  %290 = icmp slt i32 %287, 20                                                     ; inst 469
  br i1 %290, label %_132.lazy.then.1, label %_133.lazy.else.1                     ; inst 470
_132.lazy.then.1:
  %291 = icmp sgt i32 %191, 10                                                     ; inst 471
  br label %_134.lazy.exit.1                                                       ; inst 472
_133.lazy.else.1:
  br label %_134.lazy.exit.1                                                       ; inst 473
_134.lazy.exit.1:
  %292 = phi i1 [%291, %_132.lazy.then.1], [0, %_133.lazy.else.1]                  ; inst 474
  br i1 %292, label %_135.if.then.12, label %_136.if.else.12                       ; inst 475
_135.if.then.12:
  %293 = sub i32 %191, 5                                                           ; inst 476
  br label %_137.if.exit.12                                                        ; inst 477
_136.if.else.12:
  br label %_137.if.exit.12                                                        ; inst 478
_137.if.exit.12:
  %294 = phi i32 [%293, %_135.if.then.12], [%191, %_136.if.else.12]                ; inst 479
  br label %_138.if.exit.11                                                        ; inst 480
_138.if.exit.11:
  %295 = phi i32 [%289, %_130.if.then.11], [%294, %_137.if.exit.12]                ; inst 481
  br label %_140.if.exit.10                                                        ; inst 482
_139.if.else.10:
  br label %_140.if.exit.10                                                        ; inst 483
_140.if.exit.10:
  %296 = phi i32 [%295, %_138.if.exit.11], [%191, %_139.if.else.10]                ; inst 484
  %297 = srem i32 %195, 200                                                        ; inst 485
  %298 = icmp eq i32 %297, 0                                                       ; inst 486
  br i1 %298, label %_141.if.then.13, label %_142.if.else.13                       ; inst 487
_141.if.then.13:
  call void @adjust_cache_policies([64 x [4 x i32]]* %91, [128 x [8 x i32]]* %139, i32 %273, i32 %272, i32 %271, i32 %270) ; inst 488
  br label %_143.if.exit.13                                                        ; inst 489
_142.if.else.13:
  br label %_143.if.exit.13                                                        ; inst 490
_143.if.exit.13:
  %299 = add i32 %195, 1                                                           ; inst 491
  br label %_94.while.cond.1                                                       ; inst 492
_144.while.exit.1:
  %300 = mul i32 %197, 100                                                         ; inst 493
  %301 = sdiv i32 %300, %196                                                       ; inst 494
  %302 = mul i32 %198, 100                                                         ; inst 495
  %303 = sdiv i32 %302, %196                                                       ; inst 496
  %304 = mul i32 %192, 100                                                         ; inst 497
  %305 = sdiv i32 %304, %196                                                       ; inst 498
  %306 = mul i32 %193, 100                                                         ; inst 499
  %307 = sdiv i32 %306, %196                                                       ; inst 500
  %308 = load i32, i32* %181                                                       ; inst 501
  %309 = sub i32 64, %308                                                          ; inst 502
  %310 = mul i32 %309, 100                                                         ; inst 503
  %311 = sdiv i32 %310, 64                                                         ; inst 504
  %312 = call i32 @calculate_average_memory_access_time(i32 %198, i32 %194, i32 %192, i32 %189, i32 %197) ; inst 505
  %313 = call i32 @analyze_memory_fragmentation([64 x i32]* %18, i32 64)           ; inst 506
  call void @printlnInt(i32 %301)                                                  ; inst 507
  call void @printlnInt(i32 %303)                                                  ; inst 508
  call void @printlnInt(i32 %305)                                                  ; inst 509
  call void @printlnInt(i32 %307)                                                  ; inst 510
  call void @printlnInt(i32 %311)                                                  ; inst 511
  call void @printlnInt(i32 %312)                                                  ; inst 512
  call void @printlnInt(i32 %313)                                                  ; inst 513
  call void @printlnInt(i32 %191)                                                  ; inst 514
  call void @exit(i32 0)                                                           ; inst 515
  ret void                                                                         ; inst 516
}

define i32 @generate_memory_access_pattern(i32 %0, i32 %1) {
_0.entry.0:
  %2 = sdiv i32 %0, 100                                                            ; inst 1
  %3 = srem i32 %2, 6                                                              ; inst 2
  %4 = icmp eq i32 %3, 0                                                           ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  %5 = mul i32 %0, 64                                                              ; inst 5
  %6 = srem i32 %5, 1048576                                                        ; inst 6
  br label %_18.if.exit.0                                                          ; inst 7
_2.if.else.0:
  %7 = icmp eq i32 %3, 1                                                           ; inst 8
  br i1 %7, label %_3.if.then.1, label %_4.if.else.1                               ; inst 9
_3.if.then.1:
  %8 = mul i32 %0, 17                                                              ; inst 10
  %9 = add i32 %8, 23                                                              ; inst 11
  %10 = mul i32 %9, 131                                                            ; inst 12
  %11 = add i32 %10, 47                                                            ; inst 13
  %12 = srem i32 %11, 1048576                                                      ; inst 14
  br label %_17.if.exit.1                                                          ; inst 15
_4.if.else.1:
  %13 = icmp eq i32 %3, 2                                                          ; inst 16
  br i1 %13, label %_5.if.then.2, label %_6.if.else.2                              ; inst 17
_5.if.then.2:
  %14 = mul i32 %0, 512                                                            ; inst 18
  %15 = srem i32 %14, 1048576                                                      ; inst 19
  br label %_16.if.exit.2                                                          ; inst 20
_6.if.else.2:
  %16 = icmp eq i32 %3, 3                                                          ; inst 21
  br i1 %16, label %_7.if.then.3, label %_11.if.else.3                             ; inst 22
_7.if.then.3:
  %17 = sdiv i32 %0, 50                                                            ; inst 23
  %18 = mul i32 %17, 8192                                                          ; inst 24
  %19 = srem i32 %18, 1048576                                                      ; inst 25
  %20 = mul i32 %0, 7                                                              ; inst 26
  %21 = srem i32 %20, 10                                                           ; inst 27
  %22 = icmp slt i32 %21, 8                                                        ; inst 28
  br i1 %22, label %_8.if.then.4, label %_9.if.else.4                              ; inst 29
_8.if.then.4:
  %23 = mul i32 %0, 3                                                              ; inst 30
  %24 = srem i32 %23, 1024                                                         ; inst 31
  %25 = add i32 %19, %24                                                           ; inst 32
  br label %_10.if.exit.4                                                          ; inst 33
_9.if.else.4:
  %26 = mul i32 %0, 19                                                             ; inst 34
  %27 = add i32 %26, 37                                                            ; inst 35
  %28 = mul i32 %27, 113                                                           ; inst 36
  %29 = srem i32 %28, 1048576                                                      ; inst 37
  br label %_10.if.exit.4                                                          ; inst 38
_10.if.exit.4:
  %30 = phi i32 [%25, %_8.if.then.4], [%29, %_9.if.else.4]                         ; inst 39
  br label %_15.if.exit.3                                                          ; inst 40
_11.if.else.3:
  %31 = icmp eq i32 %3, 4                                                          ; inst 41
  br i1 %31, label %_12.if.then.5, label %_13.if.else.5                            ; inst 42
_12.if.then.5:
  %32 = sdiv i32 %0, 200                                                           ; inst 43
  %33 = mul i32 %32, 16384                                                         ; inst 44
  %34 = srem i32 %33, 1048576                                                      ; inst 45
  %35 = mul i32 %0, 5                                                              ; inst 46
  %36 = srem i32 %35, 4096                                                         ; inst 47
  %37 = add i32 %34, %36                                                           ; inst 48
  br label %_14.if.exit.5                                                          ; inst 49
_13.if.else.5:
  %38 = mul i32 %0, 97                                                             ; inst 50
  %39 = add i32 %38, 113                                                           ; inst 51
  %40 = mul i32 %39, 211                                                           ; inst 52
  %41 = add i32 %40, 307                                                           ; inst 53
  %42 = srem i32 %41, 1048576                                                      ; inst 54
  br label %_14.if.exit.5                                                          ; inst 55
_14.if.exit.5:
  %43 = phi i32 [%37, %_12.if.then.5], [%42, %_13.if.else.5]                       ; inst 56
  br label %_15.if.exit.3                                                          ; inst 57
_15.if.exit.3:
  %44 = phi i32 [%30, %_10.if.exit.4], [%43, %_14.if.exit.5]                       ; inst 58
  br label %_16.if.exit.2                                                          ; inst 59
_16.if.exit.2:
  %45 = phi i32 [%15, %_5.if.then.2], [%44, %_15.if.exit.3]                        ; inst 60
  br label %_17.if.exit.1                                                          ; inst 61
_17.if.exit.1:
  %46 = phi i32 [%12, %_3.if.then.1], [%45, %_16.if.exit.2]                        ; inst 62
  br label %_18.if.exit.0                                                          ; inst 63
_18.if.exit.0:
  %47 = phi i32 [%6, %_1.if.then.0], [%46, %_17.if.exit.1]                         ; inst 64
  ret i32 %47                                                                      ; inst 65
}

define i1 @lookup_tlb(i32 %0, [16 x i32]* %1, [16 x i1]* %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%13, %_8.if.exit.0]                              ; inst 2
  %4 = icmp slt i32 %3, 16                                                         ; inst 3
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 4
_2.while.body.0:
  %5 = sext i32 %3 to i64                                                          ; inst 5
  %6 = getelementptr [16 x i1], [16 x i1]* %2, i32 0, i64 %5                       ; inst 6
  %7 = load i1, i1* %6                                                             ; inst 7
  br i1 %7, label %_3.lazy.then.0, label %_4.lazy.else.0                           ; inst 8
_3.lazy.then.0:
  %8 = sext i32 %3 to i64                                                          ; inst 9
  %9 = getelementptr [16 x i32], [16 x i32]* %1, i32 0, i64 %8                     ; inst 10
  %10 = load i32, i32* %9                                                          ; inst 11
  %11 = icmp eq i32 %10, %0                                                        ; inst 12
  br label %_5.lazy.exit.0                                                         ; inst 13
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 14
_5.lazy.exit.0:
  %12 = phi i1 [%11, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 15
  br i1 %12, label %_6.if.then.0, label %_7.if.else.0                              ; inst 16
_6.if.then.0:
  ret i1 1                                                                         ; inst 17
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 18
_8.if.exit.0:
  %13 = add i32 %3, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_9.while.exit.0:
  ret i1 0                                                                         ; inst 21
}

define void @update_tlb(i32 %0, i32 %1, [16 x i32]* %2, [16 x i32]* %3, [16 x i1]* %4, [16 x i32]* %5) {
_0.entry.0:
  %6 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 0                      ; inst 1
  %7 = load i32, i32* %6                                                           ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %8 = phi i32 [1, %_0.entry.0], [%21, %_5.if.exit.0]                              ; inst 4
  %9 = phi i32 [0, %_0.entry.0], [%19, %_5.if.exit.0]                              ; inst 5
  %10 = phi i32 [%7, %_0.entry.0], [%20, %_5.if.exit.0]                            ; inst 6
  %11 = icmp slt i32 %8, 16                                                        ; inst 7
  br i1 %11, label %_2.while.body.0, label %_6.while.exit.0                        ; inst 8
_2.while.body.0:
  %12 = sext i32 %8 to i64                                                         ; inst 9
  %13 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 %12                   ; inst 10
  %14 = load i32, i32* %13                                                         ; inst 11
  %15 = icmp slt i32 %14, %10                                                      ; inst 12
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 13
_3.if.then.0:
  %16 = sext i32 %8 to i64                                                         ; inst 14
  %17 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 %16                   ; inst 15
  %18 = load i32, i32* %17                                                         ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %19 = phi i32 [%8, %_3.if.then.0], [%9, %_4.if.else.0]                           ; inst 19
  %20 = phi i32 [%18, %_3.if.then.0], [%10, %_4.if.else.0]                         ; inst 20
  %21 = add i32 %8, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  %22 = sext i32 %9 to i64                                                         ; inst 23
  %23 = getelementptr [16 x i32], [16 x i32]* %2, i32 0, i64 %22                   ; inst 24
  store i32 %0, i32* %23                                                           ; inst 25
  %24 = sext i32 %9 to i64                                                         ; inst 26
  %25 = getelementptr [16 x i32], [16 x i32]* %3, i32 0, i64 %24                   ; inst 27
  store i32 %1, i32* %25                                                           ; inst 28
  %26 = sext i32 %9 to i64                                                         ; inst 29
  %27 = getelementptr [16 x i1], [16 x i1]* %4, i32 0, i64 %26                     ; inst 30
  store i1 1, i1* %27                                                              ; inst 31
  br label %_7.while.cond.1                                                        ; inst 32
_7.while.cond.1:
  %28 = phi i32 [0, %_6.while.exit.0], [%39, %_11.if.exit.1]                       ; inst 33
  %29 = icmp slt i32 %28, 16                                                       ; inst 34
  br i1 %29, label %_8.while.body.1, label %_12.while.exit.1                       ; inst 35
_8.while.body.1:
  %30 = icmp eq i32 %28, %9                                                        ; inst 36
  br i1 %30, label %_9.if.then.1, label %_10.if.else.1                             ; inst 37
_9.if.then.1:
  %31 = sext i32 %28 to i64                                                        ; inst 38
  %32 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 %31                   ; inst 39
  store i32 1000, i32* %32                                                         ; inst 40
  br label %_11.if.exit.1                                                          ; inst 41
_10.if.else.1:
  %33 = sext i32 %28 to i64                                                        ; inst 42
  %34 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 %33                   ; inst 43
  %35 = sext i32 %28 to i64                                                        ; inst 44
  %36 = getelementptr [16 x i32], [16 x i32]* %5, i32 0, i64 %35                   ; inst 45
  %37 = load i32, i32* %36                                                         ; inst 46
  %38 = sub i32 %37, 1                                                             ; inst 47
  store i32 %38, i32* %34                                                          ; inst 48
  br label %_11.if.exit.1                                                          ; inst 49
_11.if.exit.1:
  %39 = add i32 %28, 1                                                             ; inst 50
  br label %_7.while.cond.1                                                        ; inst 51
_12.while.exit.1:
  ret void                                                                         ; inst 52
}

define i32 @allocate_free_frame([64 x i32]* %0, i32* %1, [64 x i32]* %2) {
_0.entry.0:
  %3 = load i32, i32* %1                                                           ; inst 1
  %4 = icmp sle i32 %3, 0                                                          ; inst 2
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 -1                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %5 = load i32, i32* %1                                                           ; inst 6
  %6 = sub i32 %5, 1                                                               ; inst 7
  store i32 %6, i32* %1                                                            ; inst 8
  %7 = load i32, i32* %1                                                           ; inst 9
  %8 = sext i32 %7 to i64                                                          ; inst 10
  %9 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %8                     ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  %11 = sext i32 %10 to i64                                                        ; inst 13
  %12 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %11                   ; inst 14
  store i32 1, i32* %12                                                            ; inst 15
  ret i32 %10                                                                      ; inst 16
}

define i32 @page_replacement_algorithm([16 x [16 x i32]]* %0, [64 x i32]* %1, [256 x i1]* %2, [256 x i1]* %3, i32* %4, [256 x i32]* %5, [1000 x i32]* %6, i32 %7, i32 %8, i32 %9, i32 %10) {
_0.entry.0:
  %11 = sdiv i32 %10, 50                                                           ; inst 1
  %12 = srem i32 %11, 4                                                            ; inst 2
  %13 = icmp eq i32 %12, 0                                                         ; inst 3
  br i1 %13, label %_1.if.then.0, label %_2.if.else.0                              ; inst 4
_1.if.then.0:
  %14 = call i32 @enhanced_clock_replacement([64 x i32]* %1, [256 x i1]* %2, [256 x i1]* %3, i32* %4) ; inst 5
  br label %_9.if.exit.0                                                           ; inst 6
_2.if.else.0:
  %15 = icmp eq i32 %12, 1                                                         ; inst 7
  br i1 %15, label %_3.if.then.1, label %_4.if.else.1                              ; inst 8
_3.if.then.1:
  %16 = call i32 @lru_replacement([64 x i32]* %1, [256 x i32]* %5, i32 %9)         ; inst 9
  br label %_8.if.exit.1                                                           ; inst 10
_4.if.else.1:
  %17 = icmp eq i32 %12, 2                                                         ; inst 11
  br i1 %17, label %_5.if.then.2, label %_6.if.else.2                              ; inst 12
_5.if.then.2:
  %18 = call i32 @working_set_replacement([64 x i32]* %1, [1000 x i32]* %6, i32 %7, i32 %8) ; inst 13
  br label %_7.if.exit.2                                                           ; inst 14
_6.if.else.2:
  %19 = call i32 @adaptive_replacement([64 x i32]* %1, [256 x i1]* %2, [256 x i1]* %3, [256 x i32]* %5, i32 %9, [1000 x i32]* %6, i32 %7, i32 %8) ; inst 15
  br label %_7.if.exit.2                                                           ; inst 16
_7.if.exit.2:
  %20 = phi i32 [%18, %_5.if.then.2], [%19, %_6.if.else.2]                         ; inst 17
  br label %_8.if.exit.1                                                           ; inst 18
_8.if.exit.1:
  %21 = phi i32 [%16, %_3.if.then.1], [%20, %_7.if.exit.2]                         ; inst 19
  br label %_9.if.exit.0                                                           ; inst 20
_9.if.exit.0:
  %22 = phi i32 [%14, %_1.if.then.0], [%21, %_8.if.exit.1]                         ; inst 21
  ret i32 %22                                                                      ; inst 22
}

define i32 @enhanced_clock_replacement([64 x i32]* %0, [256 x i1]* %1, [256 x i1]* %2, i32* %3) {
_0.entry.0:
  %4 = load i32, i32* %3                                                           ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%35, %_20.if.exit.3]                             ; inst 3
  %6 = icmp slt i32 %5, 3                                                          ; inst 4
  br i1 %6, label %_2.while.body.0, label %_21.while.exit.0                        ; inst 5
_2.while.body.0:
  %7 = load i32, i32* %3                                                           ; inst 6
  %8 = sext i32 %7 to i64                                                          ; inst 7
  %9 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %8                     ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = icmp sge i32 %10, 0                                                        ; inst 10
  br i1 %11, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 11
_3.lazy.then.0:
  %12 = icmp slt i32 %10, 256                                                      ; inst 12
  br label %_5.lazy.exit.0                                                         ; inst 13
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 14
_5.lazy.exit.0:
  %13 = phi i1 [%12, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 15
  br i1 %13, label %_6.if.then.0, label %_16.if.else.0                             ; inst 16
_6.if.then.0:
  %14 = sext i32 %10 to i64                                                        ; inst 17
  %15 = getelementptr [256 x i1], [256 x i1]* %1, i32 0, i64 %14                   ; inst 18
  %16 = load i1, i1* %15                                                           ; inst 19
  %17 = icmp eq i1 %16, 0                                                          ; inst 20
  br i1 %17, label %_7.if.then.1, label %_14.if.else.1                             ; inst 21
_7.if.then.1:
  %18 = sext i32 %10 to i64                                                        ; inst 22
  %19 = getelementptr [256 x i1], [256 x i1]* %2, i32 0, i64 %18                   ; inst 23
  %20 = load i1, i1* %19                                                           ; inst 24
  %21 = icmp eq i1 %20, 0                                                          ; inst 25
  br i1 %21, label %_8.lazy.then.1, label %_9.lazy.else.1                          ; inst 26
_8.lazy.then.1:
  br label %_10.lazy.exit.1                                                        ; inst 27
_9.lazy.else.1:
  %22 = icmp sge i32 %5, 2                                                         ; inst 28
  br label %_10.lazy.exit.1                                                        ; inst 29
_10.lazy.exit.1:
  %23 = phi i1 [1, %_8.lazy.then.1], [%22, %_9.lazy.else.1]                        ; inst 30
  br i1 %23, label %_11.if.then.2, label %_12.if.else.2                            ; inst 31
_11.if.then.2:
  %24 = load i32, i32* %3                                                          ; inst 32
  %25 = add i32 %24, 1                                                             ; inst 33
  %26 = srem i32 %25, 64                                                           ; inst 34
  store i32 %26, i32* %3                                                           ; inst 35
  ret i32 %7                                                                       ; inst 36
_12.if.else.2:
  br label %_13.if.exit.2                                                          ; inst 37
_13.if.exit.2:
  br label %_15.if.exit.1                                                          ; inst 38
_14.if.else.1:
  %27 = sext i32 %10 to i64                                                        ; inst 39
  %28 = getelementptr [256 x i1], [256 x i1]* %1, i32 0, i64 %27                   ; inst 40
  store i1 0, i1* %28                                                              ; inst 41
  br label %_15.if.exit.1                                                          ; inst 42
_15.if.exit.1:
  br label %_17.if.exit.0                                                          ; inst 43
_16.if.else.0:
  br label %_17.if.exit.0                                                          ; inst 44
_17.if.exit.0:
  %29 = load i32, i32* %3                                                          ; inst 45
  %30 = add i32 %29, 1                                                             ; inst 46
  %31 = srem i32 %30, 64                                                           ; inst 47
  store i32 %31, i32* %3                                                           ; inst 48
  %32 = load i32, i32* %3                                                          ; inst 49
  %33 = icmp eq i32 %32, %4                                                        ; inst 50
  br i1 %33, label %_18.if.then.3, label %_19.if.else.3                            ; inst 51
_18.if.then.3:
  %34 = add i32 %5, 1                                                              ; inst 52
  br label %_20.if.exit.3                                                          ; inst 53
_19.if.else.3:
  br label %_20.if.exit.3                                                          ; inst 54
_20.if.exit.3:
  %35 = phi i32 [%34, %_18.if.then.3], [%5, %_19.if.else.3]                        ; inst 55
  br label %_1.while.cond.0                                                        ; inst 56
_21.while.exit.0:
  %36 = load i32, i32* %3                                                          ; inst 57
  %37 = load i32, i32* %3                                                          ; inst 58
  %38 = add i32 %37, 1                                                             ; inst 59
  %39 = srem i32 %38, 64                                                           ; inst 60
  store i32 %39, i32* %3                                                           ; inst 61
  ret i32 %36                                                                      ; inst 62
}

define i32 @lru_replacement([64 x i32]* %0, [256 x i32]* %1, i32 %2) {
_0.entry.0:
  %3 = add i32 %2, 1                                                               ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%25, %_11.if.exit.0]                             ; inst 3
  %5 = phi i32 [%3, %_0.entry.0], [%23, %_11.if.exit.0]                            ; inst 4
  %6 = phi i32 [0, %_0.entry.0], [%24, %_11.if.exit.0]                             ; inst 5
  %7 = icmp slt i32 %4, 64                                                         ; inst 6
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  %8 = sext i32 %4 to i64                                                          ; inst 8
  %9 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %8                     ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = icmp sge i32 %10, 0                                                        ; inst 11
  br i1 %11, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 12
_3.lazy.then.0:
  %12 = icmp slt i32 %10, 256                                                      ; inst 13
  br label %_5.lazy.exit.0                                                         ; inst 14
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 15
_5.lazy.exit.0:
  %13 = phi i1 [%12, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 16
  br i1 %13, label %_6.if.then.0, label %_10.if.else.0                             ; inst 17
_6.if.then.0:
  %14 = sext i32 %10 to i64                                                        ; inst 18
  %15 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %14                 ; inst 19
  %16 = load i32, i32* %15                                                         ; inst 20
  %17 = icmp slt i32 %16, %5                                                       ; inst 21
  br i1 %17, label %_7.if.then.1, label %_8.if.else.1                              ; inst 22
_7.if.then.1:
  %18 = sext i32 %10 to i64                                                        ; inst 23
  %19 = getelementptr [256 x i32], [256 x i32]* %1, i32 0, i64 %18                 ; inst 24
  %20 = load i32, i32* %19                                                         ; inst 25
  br label %_9.if.exit.1                                                           ; inst 26
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 27
_9.if.exit.1:
  %21 = phi i32 [%20, %_7.if.then.1], [%5, %_8.if.else.1]                          ; inst 28
  %22 = phi i32 [%4, %_7.if.then.1], [%6, %_8.if.else.1]                           ; inst 29
  br label %_11.if.exit.0                                                          ; inst 30
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 31
_11.if.exit.0:
  %23 = phi i32 [%21, %_9.if.exit.1], [%5, %_10.if.else.0]                         ; inst 32
  %24 = phi i32 [%22, %_9.if.exit.1], [%6, %_10.if.else.0]                         ; inst 33
  %25 = add i32 %4, 1                                                              ; inst 34
  br label %_1.while.cond.0                                                        ; inst 35
_12.while.exit.0:
  ret i32 %6                                                                       ; inst 36
}

define i32 @working_set_replacement([64 x i32]* %0, [1000 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = alloca [256 x i1]                                                           ; inst 1
  %5 = getelementptr [256 x i1], [256 x i1]* %4, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 4
  %7 = icmp slt i32 %6, 256                                                        ; inst 5
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %8 = getelementptr i1, i1* %5, i32 %6                                            ; inst 7
  store i1 0, i1* %8                                                               ; inst 8
  %9 = add i32 %6, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %10 = icmp sge i32 %2, %3                                                        ; inst 11
  br i1 %10, label %_4.if.then.0, label %_5.if.else.0                              ; inst 12
_4.if.then.0:
  %11 = sub i32 %2, %3                                                             ; inst 13
  br label %_6.if.exit.0                                                           ; inst 14
_5.if.else.0:
  %12 = sub i32 %3, %2                                                             ; inst 15
  %13 = sub i32 1000, %12                                                          ; inst 16
  br label %_6.if.exit.0                                                           ; inst 17
_6.if.exit.0:
  %14 = phi i32 [%11, %_4.if.then.0], [%13, %_5.if.else.0]                         ; inst 18
  br label %_7.while.cond.0                                                        ; inst 19
_7.while.cond.0:
  %15 = phi i32 [0, %_6.if.exit.0], [%31, %_20.if.exit.1]                          ; inst 20
  %16 = phi i32 [%14, %_6.if.exit.0], [%30, %_20.if.exit.1]                        ; inst 21
  %17 = icmp slt i32 %15, %3                                                       ; inst 22
  br i1 %17, label %_8.while.body.0, label %_21.while.exit.0                       ; inst 23
_8.while.body.0:
  %18 = icmp sge i32 %16, 0                                                        ; inst 24
  br i1 %18, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 25
_9.lazy.then.0:
  %19 = icmp slt i32 %16, 1000                                                     ; inst 26
  br label %_11.lazy.exit.0                                                        ; inst 27
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 28
_11.lazy.exit.0:
  %20 = phi i1 [%19, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 29
  br i1 %20, label %_12.if.then.1, label %_19.if.else.1                            ; inst 30
_12.if.then.1:
  %21 = sext i32 %16 to i64                                                        ; inst 31
  %22 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i64 %21               ; inst 32
  %23 = load i32, i32* %22                                                         ; inst 33
  %24 = icmp sge i32 %23, 0                                                        ; inst 34
  br i1 %24, label %_13.lazy.then.1, label %_14.lazy.else.1                        ; inst 35
_13.lazy.then.1:
  %25 = icmp slt i32 %23, 256                                                      ; inst 36
  br label %_15.lazy.exit.1                                                        ; inst 37
_14.lazy.else.1:
  br label %_15.lazy.exit.1                                                        ; inst 38
_15.lazy.exit.1:
  %26 = phi i1 [%25, %_13.lazy.then.1], [0, %_14.lazy.else.1]                      ; inst 39
  br i1 %26, label %_16.if.then.2, label %_17.if.else.2                            ; inst 40
_16.if.then.2:
  %27 = sext i32 %23 to i64                                                        ; inst 41
  %28 = getelementptr [256 x i1], [256 x i1]* %4, i32 0, i64 %27                   ; inst 42
  store i1 1, i1* %28                                                              ; inst 43
  br label %_18.if.exit.2                                                          ; inst 44
_17.if.else.2:
  br label %_18.if.exit.2                                                          ; inst 45
_18.if.exit.2:
  br label %_20.if.exit.1                                                          ; inst 46
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 47
_20.if.exit.1:
  %29 = add i32 %16, 1                                                             ; inst 48
  %30 = srem i32 %29, 1000                                                         ; inst 49
  %31 = add i32 %15, 1                                                             ; inst 50
  br label %_7.while.cond.0                                                        ; inst 51
_21.while.exit.0:
  br label %_22.while.cond.1                                                       ; inst 52
_22.while.cond.1:
  %32 = phi i32 [0, %_21.while.exit.0], [%45, %_32.if.exit.3]                      ; inst 53
  %33 = icmp slt i32 %32, 64                                                       ; inst 54
  br i1 %33, label %_23.while.body.1, label %_33.while.exit.1                      ; inst 55
_23.while.body.1:
  %34 = sext i32 %32 to i64                                                        ; inst 56
  %35 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %34                   ; inst 57
  %36 = load i32, i32* %35                                                         ; inst 58
  %37 = icmp sge i32 %36, 0                                                        ; inst 59
  br i1 %37, label %_24.lazy.then.2, label %_25.lazy.else.2                        ; inst 60
_24.lazy.then.2:
  %38 = icmp slt i32 %36, 256                                                      ; inst 61
  br label %_26.lazy.exit.2                                                        ; inst 62
_25.lazy.else.2:
  br label %_26.lazy.exit.2                                                        ; inst 63
_26.lazy.exit.2:
  %39 = phi i1 [%38, %_24.lazy.then.2], [0, %_25.lazy.else.2]                      ; inst 64
  br i1 %39, label %_27.lazy.then.3, label %_28.lazy.else.3                        ; inst 65
_27.lazy.then.3:
  %40 = sext i32 %36 to i64                                                        ; inst 66
  %41 = getelementptr [256 x i1], [256 x i1]* %4, i32 0, i64 %40                   ; inst 67
  %42 = load i1, i1* %41                                                           ; inst 68
  %43 = icmp eq i1 %42, 0                                                          ; inst 69
  br label %_29.lazy.exit.3                                                        ; inst 70
_28.lazy.else.3:
  br label %_29.lazy.exit.3                                                        ; inst 71
_29.lazy.exit.3:
  %44 = phi i1 [%43, %_27.lazy.then.3], [0, %_28.lazy.else.3]                      ; inst 72
  br i1 %44, label %_30.if.then.3, label %_31.if.else.3                            ; inst 73
_30.if.then.3:
  ret i32 %32                                                                      ; inst 74
_31.if.else.3:
  br label %_32.if.exit.3                                                          ; inst 75
_32.if.exit.3:
  %45 = add i32 %32, 1                                                             ; inst 76
  br label %_22.while.cond.1                                                       ; inst 77
_33.while.exit.1:
  %46 = mul i32 %2, 7                                                              ; inst 78
  %47 = srem i32 %46, 64                                                           ; inst 79
  ret i32 %47                                                                      ; inst 80
}

define i32 @adaptive_replacement([64 x i32]* %0, [256 x i1]* %1, [256 x i1]* %2, [256 x i32]* %3, i32 %4, [1000 x i32]* %5, i32 %6, i32 %7) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%44, %_20.if.exit.0]                             ; inst 2
  %9 = phi i32 [0, %_0.entry.0], [%42, %_20.if.exit.0]                             ; inst 3
  %10 = phi i32 [-1, %_0.entry.0], [%43, %_20.if.exit.0]                           ; inst 4
  %11 = icmp slt i32 %8, 64                                                        ; inst 5
  br i1 %11, label %_2.while.body.0, label %_21.while.exit.0                       ; inst 6
_2.while.body.0:
  %12 = sext i32 %8 to i64                                                         ; inst 7
  %13 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %12                   ; inst 8
  %14 = load i32, i32* %13                                                         ; inst 9
  %15 = icmp sge i32 %14, 0                                                        ; inst 10
  br i1 %15, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 11
_3.lazy.then.0:
  %16 = icmp slt i32 %14, 256                                                      ; inst 12
  br label %_5.lazy.exit.0                                                         ; inst 13
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 14
_5.lazy.exit.0:
  %17 = phi i1 [%16, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 15
  br i1 %17, label %_6.if.then.0, label %_19.if.else.0                             ; inst 16
_6.if.then.0:
  %18 = sext i32 %14 to i64                                                        ; inst 17
  %19 = getelementptr [256 x i32], [256 x i32]* %3, i32 0, i64 %18                 ; inst 18
  %20 = load i32, i32* %19                                                         ; inst 19
  %21 = sub i32 %4, %20                                                            ; inst 20
  %22 = sdiv i32 %21, 10                                                           ; inst 21
  %23 = sext i32 %14 to i64                                                        ; inst 22
  %24 = getelementptr [256 x i1], [256 x i1]* %1, i32 0, i64 %23                   ; inst 23
  %25 = load i1, i1* %24                                                           ; inst 24
  %26 = icmp eq i1 %25, 0                                                          ; inst 25
  br i1 %26, label %_7.if.then.1, label %_8.if.else.1                              ; inst 26
_7.if.then.1:
  %27 = add i32 %22, 50                                                            ; inst 27
  br label %_9.if.exit.1                                                           ; inst 28
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 29
_9.if.exit.1:
  %28 = phi i32 [%27, %_7.if.then.1], [%22, %_8.if.else.1]                         ; inst 30
  %29 = sext i32 %14 to i64                                                        ; inst 31
  %30 = getelementptr [256 x i1], [256 x i1]* %2, i32 0, i64 %29                   ; inst 32
  %31 = load i1, i1* %30                                                           ; inst 33
  %32 = icmp eq i1 %31, 0                                                          ; inst 34
  br i1 %32, label %_10.if.then.2, label %_11.if.else.2                            ; inst 35
_10.if.then.2:
  %33 = add i32 %28, 30                                                            ; inst 36
  br label %_12.if.exit.2                                                          ; inst 37
_11.if.else.2:
  br label %_12.if.exit.2                                                          ; inst 38
_12.if.exit.2:
  %34 = phi i32 [%33, %_10.if.then.2], [%28, %_11.if.else.2]                       ; inst 39
  %35 = call i1 @check_working_set_membership(i32 %14, [1000 x i32]* %5, i32 %6, i32 %7) ; inst 40
  %36 = icmp eq i1 %35, 0                                                          ; inst 41
  br i1 %36, label %_13.if.then.3, label %_14.if.else.3                            ; inst 42
_13.if.then.3:
  %37 = add i32 %34, 40                                                            ; inst 43
  br label %_15.if.exit.3                                                          ; inst 44
_14.if.else.3:
  br label %_15.if.exit.3                                                          ; inst 45
_15.if.exit.3:
  %38 = phi i32 [%37, %_13.if.then.3], [%34, %_14.if.else.3]                       ; inst 46
  %39 = icmp sgt i32 %38, %10                                                      ; inst 47
  br i1 %39, label %_16.if.then.4, label %_17.if.else.4                            ; inst 48
_16.if.then.4:
  br label %_18.if.exit.4                                                          ; inst 49
_17.if.else.4:
  br label %_18.if.exit.4                                                          ; inst 50
_18.if.exit.4:
  %40 = phi i32 [%8, %_16.if.then.4], [%9, %_17.if.else.4]                         ; inst 51
  %41 = phi i32 [%38, %_16.if.then.4], [%10, %_17.if.else.4]                       ; inst 52
  br label %_20.if.exit.0                                                          ; inst 53
_19.if.else.0:
  br label %_20.if.exit.0                                                          ; inst 54
_20.if.exit.0:
  %42 = phi i32 [%40, %_18.if.exit.4], [%9, %_19.if.else.0]                        ; inst 55
  %43 = phi i32 [%41, %_18.if.exit.4], [%10, %_19.if.else.0]                       ; inst 56
  %44 = add i32 %8, 1                                                              ; inst 57
  br label %_1.while.cond.0                                                        ; inst 58
_21.while.exit.0:
  ret i32 %9                                                                       ; inst 59
}

define i1 @check_working_set_membership(i32 %0, [1000 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = icmp sge i32 %2, %3                                                         ; inst 1
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %5 = sub i32 %2, %3                                                              ; inst 3
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  %6 = sub i32 %3, %2                                                              ; inst 5
  %7 = sub i32 1000, %6                                                            ; inst 6
  br label %_3.if.exit.0                                                           ; inst 7
_3.if.exit.0:
  %8 = phi i32 [%5, %_1.if.then.0], [%7, %_2.if.else.0]                            ; inst 8
  br label %_4.while.cond.0                                                        ; inst 9
_4.while.cond.0:
  %9 = phi i32 [%8, %_3.if.exit.0], [%21, %_14.if.exit.1]                          ; inst 10
  %10 = phi i32 [0, %_3.if.exit.0], [%22, %_14.if.exit.1]                          ; inst 11
  %11 = icmp slt i32 %10, %3                                                       ; inst 12
  br i1 %11, label %_5.while.body.0, label %_15.while.exit.0                       ; inst 13
_5.while.body.0:
  %12 = icmp sge i32 %9, 0                                                         ; inst 14
  br i1 %12, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 15
_6.lazy.then.0:
  %13 = icmp slt i32 %9, 1000                                                      ; inst 16
  br label %_8.lazy.exit.0                                                         ; inst 17
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 18
_8.lazy.exit.0:
  %14 = phi i1 [%13, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 19
  br i1 %14, label %_9.lazy.then.1, label %_10.lazy.else.1                         ; inst 20
_9.lazy.then.1:
  %15 = sext i32 %9 to i64                                                         ; inst 21
  %16 = getelementptr [1000 x i32], [1000 x i32]* %1, i32 0, i64 %15               ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  %18 = icmp eq i32 %17, %0                                                        ; inst 24
  br label %_11.lazy.exit.1                                                        ; inst 25
_10.lazy.else.1:
  br label %_11.lazy.exit.1                                                        ; inst 26
_11.lazy.exit.1:
  %19 = phi i1 [%18, %_9.lazy.then.1], [0, %_10.lazy.else.1]                       ; inst 27
  br i1 %19, label %_12.if.then.1, label %_13.if.else.1                            ; inst 28
_12.if.then.1:
  ret i1 1                                                                         ; inst 29
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 30
_14.if.exit.1:
  %20 = add i32 %9, 1                                                              ; inst 31
  %21 = srem i32 %20, 1000                                                         ; inst 32
  %22 = add i32 %10, 1                                                             ; inst 33
  br label %_4.while.cond.0                                                        ; inst 34
_15.while.exit.0:
  ret i1 0                                                                         ; inst 35
}

define i1 @access_l1_cache(i32 %0, [64 x [4 x i32]]* %1, [64 x [4 x i32]]* %2, [64 x [4 x i1]]* %3, [64 x [4 x i32]]* %4, i32 %5) {
_0.entry.0:
  %6 = sdiv i32 %0, 64                                                             ; inst 1
  %7 = srem i32 %6, 64                                                             ; inst 2
  %8 = sdiv i32 %0, 64                                                             ; inst 3
  %9 = sdiv i32 %8, 64                                                             ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %10 = phi i32 [0, %_0.entry.0], [%24, %_8.if.exit.0]                             ; inst 6
  %11 = icmp slt i32 %10, 4                                                        ; inst 7
  br i1 %11, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 8
_2.while.body.0:
  %12 = sext i32 %7 to i64                                                         ; inst 9
  %13 = getelementptr [64 x [4 x i1]], [64 x [4 x i1]]* %3, i32 0, i64 %12         ; inst 10
  %14 = sext i32 %10 to i64                                                        ; inst 11
  %15 = getelementptr [4 x i1], [4 x i1]* %13, i32 0, i64 %14                      ; inst 12
  %16 = load i1, i1* %15                                                           ; inst 13
  br i1 %16, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 14
_3.lazy.then.0:
  %17 = sext i32 %7 to i64                                                         ; inst 15
  %18 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %2, i32 0, i64 %17       ; inst 16
  %19 = sext i32 %10 to i64                                                        ; inst 17
  %20 = getelementptr [4 x i32], [4 x i32]* %18, i32 0, i64 %19                    ; inst 18
  %21 = load i32, i32* %20                                                         ; inst 19
  %22 = icmp eq i32 %21, %9                                                        ; inst 20
  br label %_5.lazy.exit.0                                                         ; inst 21
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 22
_5.lazy.exit.0:
  %23 = phi i1 [%22, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 23
  br i1 %23, label %_6.if.then.0, label %_7.if.else.0                              ; inst 24
_6.if.then.0:
  call void @update_cache_lru([64 x [4 x i32]]* %4, i32 %7, i32 %10, i32 %5, i32 4) ; inst 25
  ret i1 1                                                                         ; inst 26
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 27
_8.if.exit.0:
  %24 = add i32 %10, 1                                                             ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_9.while.exit.0:
  %25 = call i32 @find_lru_way([64 x [4 x i32]]* %4, i32 %7, i32 4)                ; inst 30
  %26 = sext i32 %7 to i64                                                         ; inst 31
  %27 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %2, i32 0, i64 %26       ; inst 32
  %28 = sext i32 %25 to i64                                                        ; inst 33
  %29 = getelementptr [4 x i32], [4 x i32]* %27, i32 0, i64 %28                    ; inst 34
  store i32 %9, i32* %29                                                           ; inst 35
  %30 = sext i32 %7 to i64                                                         ; inst 36
  %31 = getelementptr [64 x [4 x i1]], [64 x [4 x i1]]* %3, i32 0, i64 %30         ; inst 37
  %32 = sext i32 %25 to i64                                                        ; inst 38
  %33 = getelementptr [4 x i1], [4 x i1]* %31, i32 0, i64 %32                      ; inst 39
  store i1 1, i1* %33                                                              ; inst 40
  call void @update_cache_lru([64 x [4 x i32]]* %4, i32 %7, i32 %25, i32 %5, i32 4) ; inst 41
  ret i1 0                                                                         ; inst 42
}

define i1 @access_l2_cache(i32 %0, [128 x [8 x i32]]* %1, [128 x [8 x i32]]* %2, [128 x [8 x i1]]* %3, [128 x [8 x i32]]* %4, i32 %5) {
_0.entry.0:
  %6 = sdiv i32 %0, 64                                                             ; inst 1
  %7 = srem i32 %6, 128                                                            ; inst 2
  %8 = sdiv i32 %0, 64                                                             ; inst 3
  %9 = sdiv i32 %8, 128                                                            ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %10 = phi i32 [0, %_0.entry.0], [%24, %_8.if.exit.0]                             ; inst 6
  %11 = icmp slt i32 %10, 8                                                        ; inst 7
  br i1 %11, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 8
_2.while.body.0:
  %12 = sext i32 %7 to i64                                                         ; inst 9
  %13 = getelementptr [128 x [8 x i1]], [128 x [8 x i1]]* %3, i32 0, i64 %12       ; inst 10
  %14 = sext i32 %10 to i64                                                        ; inst 11
  %15 = getelementptr [8 x i1], [8 x i1]* %13, i32 0, i64 %14                      ; inst 12
  %16 = load i1, i1* %15                                                           ; inst 13
  br i1 %16, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 14
_3.lazy.then.0:
  %17 = sext i32 %7 to i64                                                         ; inst 15
  %18 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %2, i32 0, i64 %17     ; inst 16
  %19 = sext i32 %10 to i64                                                        ; inst 17
  %20 = getelementptr [8 x i32], [8 x i32]* %18, i32 0, i64 %19                    ; inst 18
  %21 = load i32, i32* %20                                                         ; inst 19
  %22 = icmp eq i32 %21, %9                                                        ; inst 20
  br label %_5.lazy.exit.0                                                         ; inst 21
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 22
_5.lazy.exit.0:
  %23 = phi i1 [%22, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 23
  br i1 %23, label %_6.if.then.0, label %_7.if.else.0                              ; inst 24
_6.if.then.0:
  call void @update_cache_lru_8way([128 x [8 x i32]]* %4, i32 %7, i32 %10, i32 %5) ; inst 25
  ret i1 1                                                                         ; inst 26
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 27
_8.if.exit.0:
  %24 = add i32 %10, 1                                                             ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_9.while.exit.0:
  %25 = call i32 @find_lru_way_8([128 x [8 x i32]]* %4, i32 %7)                    ; inst 30
  %26 = sext i32 %7 to i64                                                         ; inst 31
  %27 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %2, i32 0, i64 %26     ; inst 32
  %28 = sext i32 %25 to i64                                                        ; inst 33
  %29 = getelementptr [8 x i32], [8 x i32]* %27, i32 0, i64 %28                    ; inst 34
  store i32 %9, i32* %29                                                           ; inst 35
  %30 = sext i32 %7 to i64                                                         ; inst 36
  %31 = getelementptr [128 x [8 x i1]], [128 x [8 x i1]]* %3, i32 0, i64 %30       ; inst 37
  %32 = sext i32 %25 to i64                                                        ; inst 38
  %33 = getelementptr [8 x i1], [8 x i1]* %31, i32 0, i64 %32                      ; inst 39
  store i1 1, i1* %33                                                              ; inst 40
  call void @update_cache_lru_8way([128 x [8 x i32]]* %4, i32 %7, i32 %25, i32 %5) ; inst 41
  ret i1 0                                                                         ; inst 42
}

define void @update_cache_lru([64 x [4 x i32]]* %0, i32 %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = sext i32 %1 to i64                                                          ; inst 1
  %6 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %0, i32 0, i64 %5         ; inst 2
  %7 = sext i32 %2 to i64                                                          ; inst 3
  %8 = getelementptr [4 x i32], [4 x i32]* %6, i32 0, i64 %7                       ; inst 4
  store i32 %3, i32* %8                                                            ; inst 5
  ret void                                                                         ; inst 6
}

define void @update_cache_lru_8way([128 x [8 x i32]]* %0, i32 %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = sext i32 %1 to i64                                                          ; inst 1
  %5 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %0, i32 0, i64 %4       ; inst 2
  %6 = sext i32 %2 to i64                                                          ; inst 3
  %7 = getelementptr [8 x i32], [8 x i32]* %5, i32 0, i64 %6                       ; inst 4
  store i32 %3, i32* %7                                                            ; inst 5
  ret void                                                                         ; inst 6
}

define i32 @find_lru_way([64 x [4 x i32]]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = sext i32 %1 to i64                                                          ; inst 1
  %4 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %0, i32 0, i64 %3         ; inst 2
  %5 = getelementptr [4 x i32], [4 x i32]* %4, i32 0, i64 0                        ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %7 = phi i32 [%6, %_0.entry.0], [%22, %_5.if.exit.0]                             ; inst 6
  %8 = phi i32 [0, %_0.entry.0], [%23, %_5.if.exit.0]                              ; inst 7
  %9 = phi i32 [1, %_0.entry.0], [%24, %_5.if.exit.0]                              ; inst 8
  %10 = icmp slt i32 %9, %2                                                        ; inst 9
  br i1 %10, label %_2.while.body.0, label %_6.while.exit.0                        ; inst 10
_2.while.body.0:
  %11 = sext i32 %1 to i64                                                         ; inst 11
  %12 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %0, i32 0, i64 %11       ; inst 12
  %13 = sext i32 %9 to i64                                                         ; inst 13
  %14 = getelementptr [4 x i32], [4 x i32]* %12, i32 0, i64 %13                    ; inst 14
  %15 = load i32, i32* %14                                                         ; inst 15
  %16 = icmp slt i32 %15, %7                                                       ; inst 16
  br i1 %16, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %17 = sext i32 %1 to i64                                                         ; inst 18
  %18 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %0, i32 0, i64 %17       ; inst 19
  %19 = sext i32 %9 to i64                                                         ; inst 20
  %20 = getelementptr [4 x i32], [4 x i32]* %18, i32 0, i64 %19                    ; inst 21
  %21 = load i32, i32* %20                                                         ; inst 22
  br label %_5.if.exit.0                                                           ; inst 23
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 24
_5.if.exit.0:
  %22 = phi i32 [%21, %_3.if.then.0], [%7, %_4.if.else.0]                          ; inst 25
  %23 = phi i32 [%9, %_3.if.then.0], [%8, %_4.if.else.0]                           ; inst 26
  %24 = add i32 %9, 1                                                              ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_6.while.exit.0:
  ret i32 %8                                                                       ; inst 29
}

define i32 @find_lru_way_8([128 x [8 x i32]]* %0, i32 %1) {
_0.entry.0:
  %2 = sext i32 %1 to i64                                                          ; inst 1
  %3 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %0, i32 0, i64 %2       ; inst 2
  %4 = getelementptr [8 x i32], [8 x i32]* %3, i32 0, i64 0                        ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i32 [1, %_0.entry.0], [%23, %_5.if.exit.0]                              ; inst 6
  %7 = phi i32 [%5, %_0.entry.0], [%21, %_5.if.exit.0]                             ; inst 7
  %8 = phi i32 [0, %_0.entry.0], [%22, %_5.if.exit.0]                              ; inst 8
  %9 = icmp slt i32 %6, 8                                                          ; inst 9
  br i1 %9, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 10
_2.while.body.0:
  %10 = sext i32 %1 to i64                                                         ; inst 11
  %11 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %0, i32 0, i64 %10     ; inst 12
  %12 = sext i32 %6 to i64                                                         ; inst 13
  %13 = getelementptr [8 x i32], [8 x i32]* %11, i32 0, i64 %12                    ; inst 14
  %14 = load i32, i32* %13                                                         ; inst 15
  %15 = icmp slt i32 %14, %7                                                       ; inst 16
  br i1 %15, label %_3.if.then.0, label %_4.if.else.0                              ; inst 17
_3.if.then.0:
  %16 = sext i32 %1 to i64                                                         ; inst 18
  %17 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %0, i32 0, i64 %16     ; inst 19
  %18 = sext i32 %6 to i64                                                         ; inst 20
  %19 = getelementptr [8 x i32], [8 x i32]* %17, i32 0, i64 %18                    ; inst 21
  %20 = load i32, i32* %19                                                         ; inst 22
  br label %_5.if.exit.0                                                           ; inst 23
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 24
_5.if.exit.0:
  %21 = phi i32 [%20, %_3.if.then.0], [%7, %_4.if.else.0]                          ; inst 25
  %22 = phi i32 [%6, %_3.if.then.0], [%8, %_4.if.else.0]                           ; inst 26
  %23 = add i32 %6, 1                                                              ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_6.while.exit.0:
  ret i32 %8                                                                       ; inst 29
}

define i32 @analyze_memory_fragmentation([64 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%21, %_11.if.exit.0]                             ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%18, %_11.if.exit.0]                             ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%19, %_11.if.exit.0]                             ; inst 4
  %5 = phi i32 [0, %_0.entry.0], [%20, %_11.if.exit.0]                             ; inst 5
  %6 = icmp slt i32 %2, %1                                                         ; inst 6
  br i1 %6, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 7
_2.while.body.0:
  %7 = sext i32 %2 to i64                                                          ; inst 8
  %8 = getelementptr [64 x i32], [64 x i32]* %0, i32 0, i64 %7                     ; inst 9
  %9 = load i32, i32* %8                                                           ; inst 10
  %10 = icmp eq i32 %9, 0                                                          ; inst 11
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 12
_3.if.then.0:
  %11 = add i32 %4, 1                                                              ; inst 13
  %12 = add i32 %3, 1                                                              ; inst 14
  br label %_11.if.exit.0                                                          ; inst 15
_4.if.else.0:
  %13 = icmp sgt i32 %4, 0                                                         ; inst 16
  br i1 %13, label %_5.if.then.1, label %_9.if.else.1                              ; inst 17
_5.if.then.1:
  %14 = icmp sgt i32 %4, %5                                                        ; inst 18
  br i1 %14, label %_6.if.then.2, label %_7.if.else.2                              ; inst 19
_6.if.then.2:
  br label %_8.if.exit.2                                                           ; inst 20
_7.if.else.2:
  br label %_8.if.exit.2                                                           ; inst 21
_8.if.exit.2:
  %15 = phi i32 [%4, %_6.if.then.2], [%5, %_7.if.else.2]                           ; inst 22
  br label %_10.if.exit.1                                                          ; inst 23
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 24
_10.if.exit.1:
  %16 = phi i32 [0, %_8.if.exit.2], [%4, %_9.if.else.1]                            ; inst 25
  %17 = phi i32 [%15, %_8.if.exit.2], [%5, %_9.if.else.1]                          ; inst 26
  br label %_11.if.exit.0                                                          ; inst 27
_11.if.exit.0:
  %18 = phi i32 [%12, %_3.if.then.0], [%3, %_10.if.exit.1]                         ; inst 28
  %19 = phi i32 [%11, %_3.if.then.0], [%16, %_10.if.exit.1]                        ; inst 29
  %20 = phi i32 [%5, %_3.if.then.0], [%17, %_10.if.exit.1]                         ; inst 30
  %21 = add i32 %2, 1                                                              ; inst 31
  br label %_1.while.cond.0                                                        ; inst 32
_12.while.exit.0:
  %22 = icmp sgt i32 %4, 0                                                         ; inst 33
  br i1 %22, label %_13.if.then.3, label %_17.if.else.3                            ; inst 34
_13.if.then.3:
  %23 = icmp sgt i32 %4, %5                                                        ; inst 35
  br i1 %23, label %_14.if.then.4, label %_15.if.else.4                            ; inst 36
_14.if.then.4:
  br label %_16.if.exit.4                                                          ; inst 37
_15.if.else.4:
  br label %_16.if.exit.4                                                          ; inst 38
_16.if.exit.4:
  %24 = phi i32 [%4, %_14.if.then.4], [%5, %_15.if.else.4]                         ; inst 39
  br label %_18.if.exit.3                                                          ; inst 40
_17.if.else.3:
  br label %_18.if.exit.3                                                          ; inst 41
_18.if.exit.3:
  %25 = phi i32 [%24, %_16.if.exit.4], [%5, %_17.if.else.3]                        ; inst 42
  %26 = icmp eq i32 %3, 0                                                          ; inst 43
  br i1 %26, label %_19.if.then.5, label %_20.if.else.5                            ; inst 44
_19.if.then.5:
  br label %_21.if.exit.5                                                          ; inst 45
_20.if.else.5:
  %27 = mul i32 %25, 100                                                           ; inst 46
  %28 = sdiv i32 %27, %3                                                           ; inst 47
  %29 = sub i32 100, %28                                                           ; inst 48
  br label %_21.if.exit.5                                                          ; inst 49
_21.if.exit.5:
  %30 = phi i32 [0, %_19.if.then.5], [%29, %_20.if.else.5]                         ; inst 50
  ret i32 %30                                                                      ; inst 51
}

define void @compact_memory([16 x [16 x i32]]* %0, [64 x i32]* %1, [64 x i32]* %2, [64 x i32]* %3, i32* %4, i32 %5) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%36, %_14.if.exit.0]                             ; inst 2
  %7 = phi i32 [0, %_0.entry.0], [%37, %_14.if.exit.0]                             ; inst 3
  %8 = icmp slt i32 %7, %5                                                         ; inst 4
  br i1 %8, label %_2.while.body.0, label %_15.while.exit.0                        ; inst 5
_2.while.body.0:
  %9 = sext i32 %7 to i64                                                          ; inst 6
  %10 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %9                    ; inst 7
  %11 = load i32, i32* %10                                                         ; inst 8
  %12 = icmp eq i32 %11, 1                                                         ; inst 9
  br i1 %12, label %_3.if.then.0, label %_13.if.else.0                             ; inst 10
_3.if.then.0:
  %13 = icmp ne i32 %7, %6                                                         ; inst 11
  br i1 %13, label %_4.if.then.1, label %_11.if.else.1                             ; inst 12
_4.if.then.1:
  %14 = sext i32 %7 to i64                                                         ; inst 13
  %15 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %14                   ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = sext i32 %6 to i64                                                         ; inst 16
  %18 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %17                   ; inst 17
  store i32 %16, i32* %18                                                          ; inst 18
  %19 = sext i32 %7 to i64                                                         ; inst 19
  %20 = getelementptr [64 x i32], [64 x i32]* %1, i32 0, i64 %19                   ; inst 20
  store i32 -1, i32* %20                                                           ; inst 21
  %21 = sext i32 %6 to i64                                                         ; inst 22
  %22 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %21                   ; inst 23
  store i32 1, i32* %22                                                            ; inst 24
  %23 = sext i32 %7 to i64                                                         ; inst 25
  %24 = getelementptr [64 x i32], [64 x i32]* %2, i32 0, i64 %23                   ; inst 26
  store i32 0, i32* %24                                                            ; inst 27
  %25 = icmp sge i32 %16, 0                                                        ; inst 28
  br i1 %25, label %_5.lazy.then.0, label %_6.lazy.else.0                          ; inst 29
_5.lazy.then.0:
  %26 = icmp slt i32 %16, 256                                                      ; inst 30
  br label %_7.lazy.exit.0                                                         ; inst 31
_6.lazy.else.0:
  br label %_7.lazy.exit.0                                                         ; inst 32
_7.lazy.exit.0:
  %27 = phi i1 [%26, %_5.lazy.then.0], [0, %_6.lazy.else.0]                        ; inst 33
  br i1 %27, label %_8.if.then.2, label %_9.if.else.2                              ; inst 34
_8.if.then.2:
  %28 = sdiv i32 %16, 16                                                           ; inst 35
  %29 = srem i32 %16, 16                                                           ; inst 36
  %30 = sext i32 %28 to i64                                                        ; inst 37
  %31 = getelementptr [16 x [16 x i32]], [16 x [16 x i32]]* %0, i32 0, i64 %30     ; inst 38
  %32 = sext i32 %29 to i64                                                        ; inst 39
  %33 = getelementptr [16 x i32], [16 x i32]* %31, i32 0, i64 %32                  ; inst 40
  %34 = add i32 %6, 1                                                              ; inst 41
  store i32 %34, i32* %33                                                          ; inst 42
  br label %_10.if.exit.2                                                          ; inst 43
_9.if.else.2:
  br label %_10.if.exit.2                                                          ; inst 44
_10.if.exit.2:
  br label %_12.if.exit.1                                                          ; inst 45
_11.if.else.1:
  br label %_12.if.exit.1                                                          ; inst 46
_12.if.exit.1:
  %35 = add i32 %6, 1                                                              ; inst 47
  br label %_14.if.exit.0                                                          ; inst 48
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 49
_14.if.exit.0:
  %36 = phi i32 [%35, %_12.if.exit.1], [%6, %_13.if.else.0]                        ; inst 50
  %37 = add i32 %7, 1                                                              ; inst 51
  br label %_1.while.cond.0                                                        ; inst 52
_15.while.exit.0:
  %38 = sub i32 %5, %6                                                             ; inst 53
  store i32 %38, i32* %4                                                           ; inst 54
  br label %_16.while.cond.1                                                       ; inst 55
_16.while.cond.1:
  %39 = phi i32 [0, %_15.while.exit.0], [%45, %_17.while.body.1]                   ; inst 56
  %40 = load i32, i32* %4                                                          ; inst 57
  %41 = icmp slt i32 %39, %40                                                      ; inst 58
  br i1 %41, label %_17.while.body.1, label %_18.while.exit.1                      ; inst 59
_17.while.body.1:
  %42 = sext i32 %39 to i64                                                        ; inst 60
  %43 = getelementptr [64 x i32], [64 x i32]* %3, i32 0, i64 %42                   ; inst 61
  %44 = add i32 %6, %39                                                            ; inst 62
  store i32 %44, i32* %43                                                          ; inst 63
  %45 = add i32 %39, 1                                                             ; inst 64
  br label %_16.while.cond.1                                                       ; inst 65
_18.while.exit.1:
  ret void                                                                         ; inst 66
}

define i32 @calculate_working_set_size([1000 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [256 x i1]                                                           ; inst 1
  %4 = getelementptr [256 x i1], [256 x i1]* %3, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 256                                                        ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i1, i1* %4, i32 %5                                            ; inst 7
  store i1 0, i1* %7                                                               ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = icmp sge i32 %1, %2                                                         ; inst 11
  br i1 %9, label %_4.if.then.0, label %_5.if.else.0                               ; inst 12
_4.if.then.0:
  %10 = sub i32 %1, %2                                                             ; inst 13
  br label %_6.if.exit.0                                                           ; inst 14
_5.if.else.0:
  %11 = sub i32 %2, %1                                                             ; inst 15
  %12 = sub i32 1000, %11                                                          ; inst 16
  br label %_6.if.exit.0                                                           ; inst 17
_6.if.exit.0:
  %13 = phi i32 [%10, %_4.if.then.0], [%12, %_5.if.else.0]                         ; inst 18
  br label %_7.while.cond.0                                                        ; inst 19
_7.while.cond.0:
  %14 = phi i32 [0, %_6.if.exit.0], [%36, %_23.if.exit.1]                          ; inst 20
  %15 = phi i32 [0, %_6.if.exit.0], [%39, %_23.if.exit.1]                          ; inst 21
  %16 = phi i32 [%13, %_6.if.exit.0], [%38, %_23.if.exit.1]                        ; inst 22
  %17 = icmp slt i32 %15, %2                                                       ; inst 23
  br i1 %17, label %_8.while.body.0, label %_24.while.exit.0                       ; inst 24
_8.while.body.0:
  %18 = icmp sge i32 %16, 0                                                        ; inst 25
  br i1 %18, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 26
_9.lazy.then.0:
  %19 = icmp slt i32 %16, 1000                                                     ; inst 27
  br label %_11.lazy.exit.0                                                        ; inst 28
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 29
_11.lazy.exit.0:
  %20 = phi i1 [%19, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 30
  br i1 %20, label %_12.if.then.1, label %_22.if.else.1                            ; inst 31
_12.if.then.1:
  %21 = sext i32 %16 to i64                                                        ; inst 32
  %22 = getelementptr [1000 x i32], [1000 x i32]* %0, i32 0, i64 %21               ; inst 33
  %23 = load i32, i32* %22                                                         ; inst 34
  %24 = icmp sge i32 %23, 0                                                        ; inst 35
  br i1 %24, label %_13.lazy.then.1, label %_14.lazy.else.1                        ; inst 36
_13.lazy.then.1:
  %25 = icmp slt i32 %23, 256                                                      ; inst 37
  br label %_15.lazy.exit.1                                                        ; inst 38
_14.lazy.else.1:
  br label %_15.lazy.exit.1                                                        ; inst 39
_15.lazy.exit.1:
  %26 = phi i1 [%25, %_13.lazy.then.1], [0, %_14.lazy.else.1]                      ; inst 40
  br i1 %26, label %_16.lazy.then.2, label %_17.lazy.else.2                        ; inst 41
_16.lazy.then.2:
  %27 = sext i32 %23 to i64                                                        ; inst 42
  %28 = getelementptr [256 x i1], [256 x i1]* %3, i32 0, i64 %27                   ; inst 43
  %29 = load i1, i1* %28                                                           ; inst 44
  %30 = icmp eq i1 %29, 0                                                          ; inst 45
  br label %_18.lazy.exit.2                                                        ; inst 46
_17.lazy.else.2:
  br label %_18.lazy.exit.2                                                        ; inst 47
_18.lazy.exit.2:
  %31 = phi i1 [%30, %_16.lazy.then.2], [0, %_17.lazy.else.2]                      ; inst 48
  br i1 %31, label %_19.if.then.2, label %_20.if.else.2                            ; inst 49
_19.if.then.2:
  %32 = sext i32 %23 to i64                                                        ; inst 50
  %33 = getelementptr [256 x i1], [256 x i1]* %3, i32 0, i64 %32                   ; inst 51
  store i1 1, i1* %33                                                              ; inst 52
  %34 = add i32 %14, 1                                                             ; inst 53
  br label %_21.if.exit.2                                                          ; inst 54
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 55
_21.if.exit.2:
  %35 = phi i32 [%34, %_19.if.then.2], [%14, %_20.if.else.2]                       ; inst 56
  br label %_23.if.exit.1                                                          ; inst 57
_22.if.else.1:
  br label %_23.if.exit.1                                                          ; inst 58
_23.if.exit.1:
  %36 = phi i32 [%35, %_21.if.exit.2], [%14, %_22.if.else.1]                       ; inst 59
  %37 = add i32 %16, 1                                                             ; inst 60
  %38 = srem i32 %37, 1000                                                         ; inst 61
  %39 = add i32 %15, 1                                                             ; inst 62
  br label %_7.while.cond.0                                                        ; inst 63
_24.while.exit.0:
  ret i32 %14                                                                      ; inst 64
}

define void @adjust_cache_policies([64 x [4 x i32]]* %0, [128 x [8 x i32]]* %1, i32 %2, i32 %3, i32 %4, i32 %5) {
_0.entry.0:
  %6 = add i32 %2, %3                                                              ; inst 1
  %7 = icmp sgt i32 %6, 0                                                          ; inst 2
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  %8 = mul i32 %2, 100                                                             ; inst 4
  %9 = add i32 %2, %3                                                              ; inst 5
  %10 = sdiv i32 %8, %9                                                            ; inst 6
  br label %_3.if.exit.0                                                           ; inst 7
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 8
_3.if.exit.0:
  %11 = phi i32 [%10, %_1.if.then.0], [0, %_2.if.else.0]                           ; inst 9
  %12 = add i32 %4, %5                                                             ; inst 10
  %13 = icmp sgt i32 %12, 0                                                        ; inst 11
  br i1 %13, label %_4.if.then.1, label %_5.if.else.1                              ; inst 12
_4.if.then.1:
  %14 = mul i32 %4, 100                                                            ; inst 13
  %15 = add i32 %4, %5                                                             ; inst 14
  %16 = sdiv i32 %14, %15                                                          ; inst 15
  br label %_6.if.exit.1                                                           ; inst 16
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 17
_6.if.exit.1:
  %17 = phi i32 [%16, %_4.if.then.1], [0, %_5.if.else.1]                           ; inst 18
  %18 = icmp slt i32 %11, 70                                                       ; inst 19
  br i1 %18, label %_7.if.then.2, label %_14.if.else.2                             ; inst 20
_7.if.then.2:
  br label %_8.while.cond.0                                                        ; inst 21
_8.while.cond.0:
  %19 = phi i32 [0, %_7.if.then.2], [%34, %_12.while.exit.1]                       ; inst 22
  %20 = icmp slt i32 %19, 64                                                       ; inst 23
  br i1 %20, label %_9.while.body.0, label %_13.while.exit.0                       ; inst 24
_9.while.body.0:
  br label %_10.while.cond.1                                                       ; inst 25
_10.while.cond.1:
  %21 = phi i32 [0, %_9.while.body.0], [%33, %_11.while.body.1]                    ; inst 26
  %22 = icmp slt i32 %21, 4                                                        ; inst 27
  br i1 %22, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 28
_11.while.body.1:
  %23 = sext i32 %19 to i64                                                        ; inst 29
  %24 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %0, i32 0, i64 %23       ; inst 30
  %25 = sext i32 %21 to i64                                                        ; inst 31
  %26 = getelementptr [4 x i32], [4 x i32]* %24, i32 0, i64 %25                    ; inst 32
  %27 = sext i32 %19 to i64                                                        ; inst 33
  %28 = getelementptr [64 x [4 x i32]], [64 x [4 x i32]]* %0, i32 0, i64 %27       ; inst 34
  %29 = sext i32 %21 to i64                                                        ; inst 35
  %30 = getelementptr [4 x i32], [4 x i32]* %28, i32 0, i64 %29                    ; inst 36
  %31 = load i32, i32* %30                                                         ; inst 37
  %32 = sub i32 %31, 10                                                            ; inst 38
  store i32 %32, i32* %26                                                          ; inst 39
  %33 = add i32 %21, 1                                                             ; inst 40
  br label %_10.while.cond.1                                                       ; inst 41
_12.while.exit.1:
  %34 = add i32 %19, 1                                                             ; inst 42
  br label %_8.while.cond.0                                                        ; inst 43
_13.while.exit.0:
  br label %_15.if.exit.2                                                          ; inst 44
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 45
_15.if.exit.2:
  %35 = icmp slt i32 %17, 60                                                       ; inst 46
  br i1 %35, label %_16.if.then.3, label %_23.if.else.3                            ; inst 47
_16.if.then.3:
  br label %_17.while.cond.2                                                       ; inst 48
_17.while.cond.2:
  %36 = phi i32 [0, %_16.if.then.3], [%51, %_21.while.exit.3]                      ; inst 49
  %37 = icmp slt i32 %36, 128                                                      ; inst 50
  br i1 %37, label %_18.while.body.2, label %_22.while.exit.2                      ; inst 51
_18.while.body.2:
  br label %_19.while.cond.3                                                       ; inst 52
_19.while.cond.3:
  %38 = phi i32 [0, %_18.while.body.2], [%50, %_20.while.body.3]                   ; inst 53
  %39 = icmp slt i32 %38, 8                                                        ; inst 54
  br i1 %39, label %_20.while.body.3, label %_21.while.exit.3                      ; inst 55
_20.while.body.3:
  %40 = sext i32 %36 to i64                                                        ; inst 56
  %41 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %1, i32 0, i64 %40     ; inst 57
  %42 = sext i32 %38 to i64                                                        ; inst 58
  %43 = getelementptr [8 x i32], [8 x i32]* %41, i32 0, i64 %42                    ; inst 59
  %44 = sext i32 %36 to i64                                                        ; inst 60
  %45 = getelementptr [128 x [8 x i32]], [128 x [8 x i32]]* %1, i32 0, i64 %44     ; inst 61
  %46 = sext i32 %38 to i64                                                        ; inst 62
  %47 = getelementptr [8 x i32], [8 x i32]* %45, i32 0, i64 %46                    ; inst 63
  %48 = load i32, i32* %47                                                         ; inst 64
  %49 = sub i32 %48, 15                                                            ; inst 65
  store i32 %49, i32* %43                                                          ; inst 66
  %50 = add i32 %38, 1                                                             ; inst 67
  br label %_19.while.cond.3                                                       ; inst 68
_21.while.exit.3:
  %51 = add i32 %36, 1                                                             ; inst 69
  br label %_17.while.cond.2                                                       ; inst 70
_22.while.exit.2:
  br label %_24.if.exit.3                                                          ; inst 71
_23.if.else.3:
  br label %_24.if.exit.3                                                          ; inst 72
_24.if.exit.3:
  ret void                                                                         ; inst 73
}

define i32 @calculate_average_memory_access_time(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = add i32 %0, %1                                                              ; inst 1
  %6 = icmp eq i32 %5, 0                                                           ; inst 2
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 0                                                                        ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %7 = mul i32 %2, 11                                                              ; inst 6
  %8 = add i32 %0, %7                                                              ; inst 7
  %9 = mul i32 %3, 111                                                             ; inst 8
  %10 = add i32 %8, %9                                                             ; inst 9
  %11 = mul i32 %4, 10000                                                          ; inst 10
  %12 = add i32 %10, %11                                                           ; inst 11
  %13 = sdiv i32 %12, %5                                                           ; inst 12
  ret i32 %13                                                                      ; inst 13
}

