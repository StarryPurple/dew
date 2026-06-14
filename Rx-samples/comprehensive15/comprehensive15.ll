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


%StringProcessor = type { [5000 x i32], i32, [50 x [200 x i32]], [50 x i32], i32, [5000 x i32], [5000 x i32], [5000 x i32], [200 x i32], [256 x i32], [200 x i32], [50 x i32], [5000 x i32], i32, i32, [500 x [500 x i32]], [256 x i32], [256 x [20 x i32]], [256 x i32], i32, i32, i32, i32, [50 x [100 x i32]], [50 x i32], [10 x i32], i32, i32 }
%RegexMatcher = type { [100 x i32], i32, [100 x [100 x i1]], i32, i1 }

define void @_14su0eKxQra_new(%StringProcessor* sret(%StringProcessor) %0) {
_0.entry.0:
  %1 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0          ; inst 1
  %2 = getelementptr [5000 x i32], [5000 x i32]* %1, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 5000                                                       ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 11
  store i32 0, i32* %7                                                             ; inst 12
  %8 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2          ; inst 13
  %9 = alloca [200 x i32]                                                          ; inst 14
  %10 = getelementptr [200 x i32], [200 x i32]* %9, i32 0, i32 0                   ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 17
  %12 = icmp slt i32 %11, 200                                                      ; inst 18
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %13 = getelementptr i32, i32* %10, i32 %11                                       ; inst 20
  store i32 0, i32* %13                                                            ; inst 21
  %14 = add i32 %11, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  %15 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %8, i32 0, i32 0     ; inst 24
  br label %_7.array.cond.2                                                        ; inst 25
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 26
  %17 = icmp slt i32 %16, 50                                                       ; inst 27
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 28
_8.array.body.2:
  %18 = getelementptr [200 x i32], [200 x i32]* %15, i32 %16                       ; inst 29
  call void @memcpy([200 x i32]* %18, [200 x i32]* %9, i64 800)                    ; inst 30
  %19 = add i32 %16, 1                                                             ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_9.array.exit.2:
  %20 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3         ; inst 33
  %21 = getelementptr [50 x i32], [50 x i32]* %20, i32 0, i32 0                    ; inst 34
  br label %_10.array.cond.3                                                       ; inst 35
_10.array.cond.3:
  %22 = phi i32 [0, %_9.array.exit.2], [%25, %_11.array.body.3]                    ; inst 36
  %23 = icmp slt i32 %22, 50                                                       ; inst 37
  br i1 %23, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 38
_11.array.body.3:
  %24 = getelementptr i32, i32* %21, i32 %22                                       ; inst 39
  store i32 0, i32* %24                                                            ; inst 40
  %25 = add i32 %22, 1                                                             ; inst 41
  br label %_10.array.cond.3                                                       ; inst 42
_12.array.exit.3:
  %26 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4         ; inst 43
  store i32 0, i32* %26                                                            ; inst 44
  %27 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 45
  %28 = getelementptr [5000 x i32], [5000 x i32]* %27, i32 0, i32 0                ; inst 46
  br label %_13.array.cond.4                                                       ; inst 47
_13.array.cond.4:
  %29 = phi i32 [0, %_12.array.exit.3], [%32, %_14.array.body.4]                   ; inst 48
  %30 = icmp slt i32 %29, 5000                                                     ; inst 49
  br i1 %30, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 50
_14.array.body.4:
  %31 = getelementptr i32, i32* %28, i32 %29                                       ; inst 51
  store i32 0, i32* %31                                                            ; inst 52
  %32 = add i32 %29, 1                                                             ; inst 53
  br label %_13.array.cond.4                                                       ; inst 54
_15.array.exit.4:
  %33 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 6         ; inst 55
  %34 = getelementptr [5000 x i32], [5000 x i32]* %33, i32 0, i32 0                ; inst 56
  br label %_16.array.cond.5                                                       ; inst 57
_16.array.cond.5:
  %35 = phi i32 [0, %_15.array.exit.4], [%38, %_17.array.body.5]                   ; inst 58
  %36 = icmp slt i32 %35, 5000                                                     ; inst 59
  br i1 %36, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 60
_17.array.body.5:
  %37 = getelementptr i32, i32* %34, i32 %35                                       ; inst 61
  store i32 0, i32* %37                                                            ; inst 62
  %38 = add i32 %35, 1                                                             ; inst 63
  br label %_16.array.cond.5                                                       ; inst 64
_18.array.exit.5:
  %39 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 7         ; inst 65
  %40 = getelementptr [5000 x i32], [5000 x i32]* %39, i32 0, i32 0                ; inst 66
  br label %_19.array.cond.6                                                       ; inst 67
_19.array.cond.6:
  %41 = phi i32 [0, %_18.array.exit.5], [%44, %_20.array.body.6]                   ; inst 68
  %42 = icmp slt i32 %41, 5000                                                     ; inst 69
  br i1 %42, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 70
_20.array.body.6:
  %43 = getelementptr i32, i32* %40, i32 %41                                       ; inst 71
  store i32 0, i32* %43                                                            ; inst 72
  %44 = add i32 %41, 1                                                             ; inst 73
  br label %_19.array.cond.6                                                       ; inst 74
_21.array.exit.6:
  %45 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8         ; inst 75
  %46 = getelementptr [200 x i32], [200 x i32]* %45, i32 0, i32 0                  ; inst 76
  br label %_22.array.cond.7                                                       ; inst 77
_22.array.cond.7:
  %47 = phi i32 [0, %_21.array.exit.6], [%50, %_23.array.body.7]                   ; inst 78
  %48 = icmp slt i32 %47, 200                                                      ; inst 79
  br i1 %48, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 80
_23.array.body.7:
  %49 = getelementptr i32, i32* %46, i32 %47                                       ; inst 81
  store i32 0, i32* %49                                                            ; inst 82
  %50 = add i32 %47, 1                                                             ; inst 83
  br label %_22.array.cond.7                                                       ; inst 84
_24.array.exit.7:
  %51 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 9         ; inst 85
  %52 = getelementptr [256 x i32], [256 x i32]* %51, i32 0, i32 0                  ; inst 86
  br label %_25.array.cond.8                                                       ; inst 87
_25.array.cond.8:
  %53 = phi i32 [0, %_24.array.exit.7], [%56, %_26.array.body.8]                   ; inst 88
  %54 = icmp slt i32 %53, 256                                                      ; inst 89
  br i1 %54, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 90
_26.array.body.8:
  %55 = getelementptr i32, i32* %52, i32 %53                                       ; inst 91
  store i32 0, i32* %55                                                            ; inst 92
  %56 = add i32 %53, 1                                                             ; inst 93
  br label %_25.array.cond.8                                                       ; inst 94
_27.array.exit.8:
  %57 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 10        ; inst 95
  %58 = getelementptr [200 x i32], [200 x i32]* %57, i32 0, i32 0                  ; inst 96
  br label %_28.array.cond.9                                                       ; inst 97
_28.array.cond.9:
  %59 = phi i32 [0, %_27.array.exit.8], [%62, %_29.array.body.9]                   ; inst 98
  %60 = icmp slt i32 %59, 200                                                      ; inst 99
  br i1 %60, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 100
_29.array.body.9:
  %61 = getelementptr i32, i32* %58, i32 %59                                       ; inst 101
  store i32 0, i32* %61                                                            ; inst 102
  %62 = add i32 %59, 1                                                             ; inst 103
  br label %_28.array.cond.9                                                       ; inst 104
_30.array.exit.9:
  %63 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 11        ; inst 105
  %64 = getelementptr [50 x i32], [50 x i32]* %63, i32 0, i32 0                    ; inst 106
  br label %_31.array.cond.10                                                      ; inst 107
_31.array.cond.10:
  %65 = phi i32 [0, %_30.array.exit.9], [%68, %_32.array.body.10]                  ; inst 108
  %66 = icmp slt i32 %65, 50                                                       ; inst 109
  br i1 %66, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 110
_32.array.body.10:
  %67 = getelementptr i32, i32* %64, i32 %65                                       ; inst 111
  store i32 0, i32* %67                                                            ; inst 112
  %68 = add i32 %65, 1                                                             ; inst 113
  br label %_31.array.cond.10                                                      ; inst 114
_33.array.exit.10:
  %69 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 12        ; inst 115
  %70 = getelementptr [5000 x i32], [5000 x i32]* %69, i32 0, i32 0                ; inst 116
  br label %_34.array.cond.11                                                      ; inst 117
_34.array.cond.11:
  %71 = phi i32 [0, %_33.array.exit.10], [%74, %_35.array.body.11]                 ; inst 118
  %72 = icmp slt i32 %71, 5000                                                     ; inst 119
  br i1 %72, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 120
_35.array.body.11:
  %73 = getelementptr i32, i32* %70, i32 %71                                       ; inst 121
  store i32 0, i32* %73                                                            ; inst 122
  %74 = add i32 %71, 1                                                             ; inst 123
  br label %_34.array.cond.11                                                      ; inst 124
_36.array.exit.11:
  %75 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 13        ; inst 125
  store i32 256, i32* %75                                                          ; inst 126
  %76 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 127
  store i32 10007, i32* %76                                                        ; inst 128
  %77 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 129
  %78 = alloca [500 x i32]                                                         ; inst 130
  %79 = getelementptr [500 x i32], [500 x i32]* %78, i32 0, i32 0                  ; inst 131
  br label %_37.array.cond.12                                                      ; inst 132
_37.array.cond.12:
  %80 = phi i32 [0, %_36.array.exit.11], [%83, %_38.array.body.12]                 ; inst 133
  %81 = icmp slt i32 %80, 500                                                      ; inst 134
  br i1 %81, label %_38.array.body.12, label %_39.array.exit.12                    ; inst 135
_38.array.body.12:
  %82 = getelementptr i32, i32* %79, i32 %80                                       ; inst 136
  store i32 0, i32* %82                                                            ; inst 137
  %83 = add i32 %80, 1                                                             ; inst 138
  br label %_37.array.cond.12                                                      ; inst 139
_39.array.exit.12:
  %84 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %77, i32 0, i32 0  ; inst 140
  br label %_40.array.cond.13                                                      ; inst 141
_40.array.cond.13:
  %85 = phi i32 [0, %_39.array.exit.12], [%88, %_41.array.body.13]                 ; inst 142
  %86 = icmp slt i32 %85, 500                                                      ; inst 143
  br i1 %86, label %_41.array.body.13, label %_42.array.exit.13                    ; inst 144
_41.array.body.13:
  %87 = getelementptr [500 x i32], [500 x i32]* %84, i32 %85                       ; inst 145
  call void @memcpy([500 x i32]* %87, [500 x i32]* %78, i64 2000)                  ; inst 146
  %88 = add i32 %85, 1                                                             ; inst 147
  br label %_40.array.cond.13                                                      ; inst 148
_42.array.exit.13:
  %89 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 16        ; inst 149
  %90 = getelementptr [256 x i32], [256 x i32]* %89, i32 0, i32 0                  ; inst 150
  br label %_43.array.cond.14                                                      ; inst 151
_43.array.cond.14:
  %91 = phi i32 [0, %_42.array.exit.13], [%94, %_44.array.body.14]                 ; inst 152
  %92 = icmp slt i32 %91, 256                                                      ; inst 153
  br i1 %92, label %_44.array.body.14, label %_45.array.exit.14                    ; inst 154
_44.array.body.14:
  %93 = getelementptr i32, i32* %90, i32 %91                                       ; inst 155
  store i32 0, i32* %93                                                            ; inst 156
  %94 = add i32 %91, 1                                                             ; inst 157
  br label %_43.array.cond.14                                                      ; inst 158
_45.array.exit.14:
  %95 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 17        ; inst 159
  %96 = alloca [20 x i32]                                                          ; inst 160
  %97 = getelementptr [20 x i32], [20 x i32]* %96, i32 0, i32 0                    ; inst 161
  br label %_46.array.cond.15                                                      ; inst 162
_46.array.cond.15:
  %98 = phi i32 [0, %_45.array.exit.14], [%101, %_47.array.body.15]                ; inst 163
  %99 = icmp slt i32 %98, 20                                                       ; inst 164
  br i1 %99, label %_47.array.body.15, label %_48.array.exit.15                    ; inst 165
_47.array.body.15:
  %100 = getelementptr i32, i32* %97, i32 %98                                      ; inst 166
  store i32 0, i32* %100                                                           ; inst 167
  %101 = add i32 %98, 1                                                            ; inst 168
  br label %_46.array.cond.15                                                      ; inst 169
_48.array.exit.15:
  %102 = getelementptr [256 x [20 x i32]], [256 x [20 x i32]]* %95, i32 0, i32 0   ; inst 170
  br label %_49.array.cond.16                                                      ; inst 171
_49.array.cond.16:
  %103 = phi i32 [0, %_48.array.exit.15], [%106, %_50.array.body.16]               ; inst 172
  %104 = icmp slt i32 %103, 256                                                    ; inst 173
  br i1 %104, label %_50.array.body.16, label %_51.array.exit.16                   ; inst 174
_50.array.body.16:
  %105 = getelementptr [20 x i32], [20 x i32]* %102, i32 %103                      ; inst 175
  call void @memcpy([20 x i32]* %105, [20 x i32]* %96, i64 80)                     ; inst 176
  %106 = add i32 %103, 1                                                           ; inst 177
  br label %_49.array.cond.16                                                      ; inst 178
_51.array.exit.16:
  %107 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 18       ; inst 179
  %108 = getelementptr [256 x i32], [256 x i32]* %107, i32 0, i32 0                ; inst 180
  br label %_52.array.cond.17                                                      ; inst 181
_52.array.cond.17:
  %109 = phi i32 [0, %_51.array.exit.16], [%112, %_53.array.body.17]               ; inst 182
  %110 = icmp slt i32 %109, 256                                                    ; inst 183
  br i1 %110, label %_53.array.body.17, label %_54.array.exit.17                   ; inst 184
_53.array.body.17:
  %111 = getelementptr i32, i32* %108, i32 %109                                    ; inst 185
  store i32 0, i32* %111                                                           ; inst 186
  %112 = add i32 %109, 1                                                           ; inst 187
  br label %_52.array.cond.17                                                      ; inst 188
_54.array.exit.17:
  %113 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19       ; inst 189
  store i32 0, i32* %113                                                           ; inst 190
  %114 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 20       ; inst 191
  store i32 0, i32* %114                                                           ; inst 192
  %115 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 21       ; inst 193
  store i32 0, i32* %115                                                           ; inst 194
  %116 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22       ; inst 195
  store i32 0, i32* %116                                                           ; inst 196
  %117 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 23       ; inst 197
  %118 = alloca [100 x i32]                                                        ; inst 198
  %119 = getelementptr [100 x i32], [100 x i32]* %118, i32 0, i32 0                ; inst 199
  br label %_55.array.cond.18                                                      ; inst 200
_55.array.cond.18:
  %120 = phi i32 [0, %_54.array.exit.17], [%123, %_56.array.body.18]               ; inst 201
  %121 = icmp slt i32 %120, 100                                                    ; inst 202
  br i1 %121, label %_56.array.body.18, label %_57.array.exit.18                   ; inst 203
_56.array.body.18:
  %122 = getelementptr i32, i32* %119, i32 %120                                    ; inst 204
  store i32 0, i32* %122                                                           ; inst 205
  %123 = add i32 %120, 1                                                           ; inst 206
  br label %_55.array.cond.18                                                      ; inst 207
_57.array.exit.18:
  %124 = getelementptr [50 x [100 x i32]], [50 x [100 x i32]]* %117, i32 0, i32 0  ; inst 208
  br label %_58.array.cond.19                                                      ; inst 209
_58.array.cond.19:
  %125 = phi i32 [0, %_57.array.exit.18], [%128, %_59.array.body.19]               ; inst 210
  %126 = icmp slt i32 %125, 50                                                     ; inst 211
  br i1 %126, label %_59.array.body.19, label %_60.array.exit.19                   ; inst 212
_59.array.body.19:
  %127 = getelementptr [100 x i32], [100 x i32]* %124, i32 %125                    ; inst 213
  call void @memcpy([100 x i32]* %127, [100 x i32]* %118, i64 400)                 ; inst 214
  %128 = add i32 %125, 1                                                           ; inst 215
  br label %_58.array.cond.19                                                      ; inst 216
_60.array.exit.19:
  %129 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 24       ; inst 217
  %130 = getelementptr [50 x i32], [50 x i32]* %129, i32 0, i32 0                  ; inst 218
  br label %_61.array.cond.20                                                      ; inst 219
_61.array.cond.20:
  %131 = phi i32 [0, %_60.array.exit.19], [%134, %_62.array.body.20]               ; inst 220
  %132 = icmp slt i32 %131, 50                                                     ; inst 221
  br i1 %132, label %_62.array.body.20, label %_63.array.exit.20                   ; inst 222
_62.array.body.20:
  %133 = getelementptr i32, i32* %130, i32 %131                                    ; inst 223
  store i32 0, i32* %133                                                           ; inst 224
  %134 = add i32 %131, 1                                                           ; inst 225
  br label %_61.array.cond.20                                                      ; inst 226
_63.array.exit.20:
  %135 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25       ; inst 227
  %136 = getelementptr [10 x i32], [10 x i32]* %135, i32 0, i32 0                  ; inst 228
  br label %_64.array.cond.21                                                      ; inst 229
_64.array.cond.21:
  %137 = phi i32 [0, %_63.array.exit.20], [%140, %_65.array.body.21]               ; inst 230
  %138 = icmp slt i32 %137, 10                                                     ; inst 231
  br i1 %138, label %_65.array.body.21, label %_66.array.exit.21                   ; inst 232
_65.array.body.21:
  %139 = getelementptr i32, i32* %136, i32 %137                                    ; inst 233
  store i32 0, i32* %139                                                           ; inst 234
  %140 = add i32 %137, 1                                                           ; inst 235
  br label %_64.array.cond.21                                                      ; inst 236
_66.array.exit.21:
  %141 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26       ; inst 237
  store i32 0, i32* %141                                                           ; inst 238
  %142 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 27       ; inst 239
  store i32 0, i32* %142                                                           ; inst 240
  ret void                                                                         ; inst 241
}

define void @_14su0eKxQra_initialize_text(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0          ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [5000 x i32], [5000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  call void @_14su0eKxQra_analyze_text_statistics(%StringProcessor* %0)            ; inst 14
  call void @_14su0eKxQra_build_suffix_array(%StringProcessor* %0)                 ; inst 15
  call void @_14su0eKxQra_compute_lcp_array(%StringProcessor* %0)                  ; inst 16
  call void @_14su0eKxQra_prepare_rabin_karp_hashes(%StringProcessor* %0)          ; inst 17
  ret void                                                                         ; inst 18
}

define void @_14su0eKxQra_add_pattern(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4          ; inst 1
  %3 = load i32, i32* %2                                                           ; inst 2
  %4 = icmp sge i32 %3, 50                                                         ; inst 3
  br i1 %4, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret void                                                                         ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4          ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  %7 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 9
  %8 = sext i32 %6 to i64                                                          ; inst 10
  %9 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %8                     ; inst 11
  store i32 %1, i32* %9                                                            ; inst 12
  br label %_4.while.cond.0                                                        ; inst 13
_4.while.cond.0:
  %10 = phi i32 [0, %_3.if.exit.0], [%18, %_5.while.body.0]                        ; inst 14
  %11 = icmp slt i32 %10, %1                                                       ; inst 15
  br i1 %11, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 16
_5.while.body.0:
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 17
  %13 = sext i32 %6 to i64                                                         ; inst 18
  %14 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %12, i32 0, i64 %13  ; inst 19
  %15 = sext i32 %10 to i64                                                        ; inst 20
  %16 = getelementptr [200 x i32], [200 x i32]* %14, i32 0, i64 %15                ; inst 21
  %17 = call i32 @getInt()                                                         ; inst 22
  store i32 %17, i32* %16                                                          ; inst 23
  %18 = add i32 %10, 1                                                             ; inst 24
  br label %_4.while.cond.0                                                        ; inst 25
_6.while.exit.0:
  call void @_14su0eKxQra_preprocess_kmp(%StringProcessor* %0, i32 %6)             ; inst 26
  call void @_14su0eKxQra_preprocess_boyer_moore(%StringProcessor* %0, i32 %6)     ; inst 27
  call void @_14su0eKxQra_compute_pattern_hash(%StringProcessor* %0, i32 %6)       ; inst 28
  %19 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4         ; inst 29
  %20 = load i32, i32* %19                                                         ; inst 30
  %21 = add i32 %20, 1                                                             ; inst 31
  store i32 %21, i32* %19                                                          ; inst 32
  ret void                                                                         ; inst 33
}

define void @_14su0eKxQra_analyze_text_statistics(%StringProcessor* %0) {
_0.entry.0:
  %1 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19         ; inst 1
  store i32 0, i32* %1                                                             ; inst 2
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 20         ; inst 3
  store i32 0, i32* %2                                                             ; inst 4
  %3 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 21         ; inst 5
  store i32 0, i32* %3                                                             ; inst 6
  %4 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22         ; inst 7
  store i32 0, i32* %4                                                             ; inst 8
  br label %_1.while.cond.0                                                        ; inst 9
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 10
  %6 = icmp slt i32 %5, 256                                                        ; inst 11
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 12
_2.while.body.0:
  %7 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 16         ; inst 13
  %8 = sext i32 %5 to i64                                                          ; inst 14
  %9 = getelementptr [256 x i32], [256 x i32]* %7, i32 0, i64 %8                   ; inst 15
  store i32 0, i32* %9                                                             ; inst 16
  %10 = add i32 %5, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 19
_4.while.cond.1:
  %11 = phi i32 [0, %_3.while.exit.0], [%52, %_32.if.exit.3]                       ; inst 20
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 21
  %13 = load i32, i32* %12                                                         ; inst 22
  %14 = icmp slt i32 %11, %13                                                      ; inst 23
  br i1 %14, label %_5.while.body.1, label %_33.while.exit.1                       ; inst 24
_5.while.body.1:
  %15 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 25
  %16 = sext i32 %11 to i64                                                        ; inst 26
  %17 = getelementptr [5000 x i32], [5000 x i32]* %15, i32 0, i64 %16              ; inst 27
  %18 = load i32, i32* %17                                                         ; inst 28
  %19 = icmp sge i32 %18, 0                                                        ; inst 29
  br i1 %19, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 30
_6.lazy.then.0:
  %20 = icmp slt i32 %18, 256                                                      ; inst 31
  br label %_8.lazy.exit.0                                                         ; inst 32
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 33
_8.lazy.exit.0:
  %21 = phi i1 [%20, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 34
  br i1 %21, label %_9.if.then.0, label %_10.if.else.0                             ; inst 35
_9.if.then.0:
  %22 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 16        ; inst 36
  %23 = sext i32 %18 to i64                                                        ; inst 37
  %24 = getelementptr [256 x i32], [256 x i32]* %22, i32 0, i64 %23                ; inst 38
  %25 = load i32, i32* %24                                                         ; inst 39
  %26 = add i32 %25, 1                                                             ; inst 40
  store i32 %26, i32* %24                                                          ; inst 41
  br label %_11.if.exit.0                                                          ; inst 42
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 43
_11.if.exit.0:
  %27 = icmp eq i32 %18, 32                                                        ; inst 44
  br i1 %27, label %_12.lazy.then.1, label %_13.lazy.else.1                        ; inst 45
_12.lazy.then.1:
  %28 = icmp sgt i32 %11, 0                                                        ; inst 46
  br label %_14.lazy.exit.1                                                        ; inst 47
_13.lazy.else.1:
  br label %_14.lazy.exit.1                                                        ; inst 48
_14.lazy.exit.1:
  %29 = phi i1 [%28, %_12.lazy.then.1], [0, %_13.lazy.else.1]                      ; inst 49
  br i1 %29, label %_15.lazy.then.2, label %_16.lazy.else.2                        ; inst 50
_15.lazy.then.2:
  %30 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 51
  %31 = sub i32 %11, 1                                                             ; inst 52
  %32 = sext i32 %31 to i64                                                        ; inst 53
  %33 = getelementptr [5000 x i32], [5000 x i32]* %30, i32 0, i64 %32              ; inst 54
  %34 = load i32, i32* %33                                                         ; inst 55
  %35 = icmp ne i32 %34, 32                                                        ; inst 56
  br label %_17.lazy.exit.2                                                        ; inst 57
_16.lazy.else.2:
  br label %_17.lazy.exit.2                                                        ; inst 58
_17.lazy.exit.2:
  %36 = phi i1 [%35, %_15.lazy.then.2], [0, %_16.lazy.else.2]                      ; inst 59
  br i1 %36, label %_18.if.then.1, label %_19.if.else.1                            ; inst 60
_18.if.then.1:
  %37 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19        ; inst 61
  %38 = load i32, i32* %37                                                         ; inst 62
  %39 = add i32 %38, 1                                                             ; inst 63
  store i32 %39, i32* %37                                                          ; inst 64
  br label %_20.if.exit.1                                                          ; inst 65
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 66
_20.if.exit.1:
  %40 = icmp eq i32 %18, 46                                                        ; inst 67
  br i1 %40, label %_21.lazy.then.3, label %_22.lazy.else.3                        ; inst 68
_21.lazy.then.3:
  br label %_23.lazy.exit.3                                                        ; inst 69
_22.lazy.else.3:
  %41 = icmp eq i32 %18, 33                                                        ; inst 70
  br label %_23.lazy.exit.3                                                        ; inst 71
_23.lazy.exit.3:
  %42 = phi i1 [1, %_21.lazy.then.3], [%41, %_22.lazy.else.3]                      ; inst 72
  br i1 %42, label %_24.lazy.then.4, label %_25.lazy.else.4                        ; inst 73
_24.lazy.then.4:
  br label %_26.lazy.exit.4                                                        ; inst 74
_25.lazy.else.4:
  %43 = icmp eq i32 %18, 63                                                        ; inst 75
  br label %_26.lazy.exit.4                                                        ; inst 76
_26.lazy.exit.4:
  %44 = phi i1 [1, %_24.lazy.then.4], [%43, %_25.lazy.else.4]                      ; inst 77
  br i1 %44, label %_27.if.then.2, label %_28.if.else.2                            ; inst 78
_27.if.then.2:
  %45 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 20        ; inst 79
  %46 = load i32, i32* %45                                                         ; inst 80
  %47 = add i32 %46, 1                                                             ; inst 81
  store i32 %47, i32* %45                                                          ; inst 82
  br label %_29.if.exit.2                                                          ; inst 83
_28.if.else.2:
  br label %_29.if.exit.2                                                          ; inst 84
_29.if.exit.2:
  %48 = icmp eq i32 %18, 10                                                        ; inst 85
  br i1 %48, label %_30.if.then.3, label %_31.if.else.3                            ; inst 86
_30.if.then.3:
  %49 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 21        ; inst 87
  %50 = load i32, i32* %49                                                         ; inst 88
  %51 = add i32 %50, 1                                                             ; inst 89
  store i32 %51, i32* %49                                                          ; inst 90
  br label %_32.if.exit.3                                                          ; inst 91
_31.if.else.3:
  br label %_32.if.exit.3                                                          ; inst 92
_32.if.exit.3:
  %52 = add i32 %11, 1                                                             ; inst 93
  br label %_4.while.cond.1                                                        ; inst 94
_33.while.exit.1:
  br label %_34.while.cond.2                                                       ; inst 95
_34.while.cond.2:
  %53 = phi i32 [0, %_33.while.exit.1], [%63, %_38.if.exit.4]                      ; inst 96
  %54 = icmp slt i32 %53, 256                                                      ; inst 97
  br i1 %54, label %_35.while.body.2, label %_39.while.exit.2                      ; inst 98
_35.while.body.2:
  %55 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 16        ; inst 99
  %56 = sext i32 %53 to i64                                                        ; inst 100
  %57 = getelementptr [256 x i32], [256 x i32]* %55, i32 0, i64 %56                ; inst 101
  %58 = load i32, i32* %57                                                         ; inst 102
  %59 = icmp sgt i32 %58, 0                                                        ; inst 103
  br i1 %59, label %_36.if.then.4, label %_37.if.else.4                            ; inst 104
_36.if.then.4:
  %60 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22        ; inst 105
  %61 = load i32, i32* %60                                                         ; inst 106
  %62 = add i32 %61, 1                                                             ; inst 107
  store i32 %62, i32* %60                                                          ; inst 108
  br label %_38.if.exit.4                                                          ; inst 109
_37.if.else.4:
  br label %_38.if.exit.4                                                          ; inst 110
_38.if.exit.4:
  %63 = add i32 %53, 1                                                             ; inst 111
  br label %_34.while.cond.2                                                       ; inst 112
_39.while.exit.2:
  %64 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 113
  %65 = load i32, i32* %64                                                         ; inst 114
  %66 = icmp sgt i32 %65, 0                                                        ; inst 115
  br i1 %66, label %_40.lazy.then.5, label %_41.lazy.else.5                        ; inst 116
_40.lazy.then.5:
  %67 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 117
  %68 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 118
  %69 = load i32, i32* %68                                                         ; inst 119
  %70 = sub i32 %69, 1                                                             ; inst 120
  %71 = sext i32 %70 to i64                                                        ; inst 121
  %72 = getelementptr [5000 x i32], [5000 x i32]* %67, i32 0, i64 %71              ; inst 122
  %73 = load i32, i32* %72                                                         ; inst 123
  %74 = icmp ne i32 %73, 32                                                        ; inst 124
  br label %_42.lazy.exit.5                                                        ; inst 125
_41.lazy.else.5:
  br label %_42.lazy.exit.5                                                        ; inst 126
_42.lazy.exit.5:
  %75 = phi i1 [%74, %_40.lazy.then.5], [0, %_41.lazy.else.5]                      ; inst 127
  br i1 %75, label %_43.if.then.5, label %_44.if.else.5                            ; inst 128
_43.if.then.5:
  %76 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19        ; inst 129
  %77 = load i32, i32* %76                                                         ; inst 130
  %78 = add i32 %77, 1                                                             ; inst 131
  store i32 %78, i32* %76                                                          ; inst 132
  br label %_45.if.exit.5                                                          ; inst 133
_44.if.else.5:
  br label %_45.if.exit.5                                                          ; inst 134
_45.if.exit.5:
  ret void                                                                         ; inst 135
}

define void @_14su0eKxQra_build_suffix_array(%StringProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%8, %_2.while.body.0]                            ; inst 2
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5          ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [5000 x i32], [5000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  store i32 %1, i32* %7                                                            ; inst 10
  %8 = add i32 %1, 1                                                               ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 13
_4.while.cond.1:
  %9 = phi i1 [0, %_3.while.exit.0], [%11, %_11.while.exit.2]                      ; inst 14
  %10 = icmp eq i1 %9, 0                                                           ; inst 15
  br i1 %10, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 16
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 17
_6.while.cond.2:
  %11 = phi i1 [1, %_5.while.body.1], [%44, %_10.if.exit.0]                        ; inst 18
  %12 = phi i32 [0, %_5.while.body.1], [%45, %_10.if.exit.0]                       ; inst 19
  %13 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 20
  %14 = load i32, i32* %13                                                         ; inst 21
  %15 = sub i32 %14, 1                                                             ; inst 22
  %16 = icmp slt i32 %12, %15                                                      ; inst 23
  br i1 %16, label %_7.while.body.2, label %_11.while.exit.2                       ; inst 24
_7.while.body.2:
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 25
  %18 = sext i32 %12 to i64                                                        ; inst 26
  %19 = getelementptr [5000 x i32], [5000 x i32]* %17, i32 0, i64 %18              ; inst 27
  %20 = load i32, i32* %19                                                         ; inst 28
  %21 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 29
  %22 = add i32 %12, 1                                                             ; inst 30
  %23 = sext i32 %22 to i64                                                        ; inst 31
  %24 = getelementptr [5000 x i32], [5000 x i32]* %21, i32 0, i64 %23              ; inst 32
  %25 = load i32, i32* %24                                                         ; inst 33
  %26 = call i32 @_14su0eKxQra_compare_suffixes(%StringProcessor* %0, i32 %20, i32 %25) ; inst 34
  %27 = icmp sgt i32 %26, 0                                                        ; inst 35
  br i1 %27, label %_8.if.then.0, label %_9.if.else.0                              ; inst 36
_8.if.then.0:
  %28 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 37
  %29 = sext i32 %12 to i64                                                        ; inst 38
  %30 = getelementptr [5000 x i32], [5000 x i32]* %28, i32 0, i64 %29              ; inst 39
  %31 = load i32, i32* %30                                                         ; inst 40
  %32 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 41
  %33 = sext i32 %12 to i64                                                        ; inst 42
  %34 = getelementptr [5000 x i32], [5000 x i32]* %32, i32 0, i64 %33              ; inst 43
  %35 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 44
  %36 = add i32 %12, 1                                                             ; inst 45
  %37 = sext i32 %36 to i64                                                        ; inst 46
  %38 = getelementptr [5000 x i32], [5000 x i32]* %35, i32 0, i64 %37              ; inst 47
  %39 = load i32, i32* %38                                                         ; inst 48
  store i32 %39, i32* %34                                                          ; inst 49
  %40 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 50
  %41 = add i32 %12, 1                                                             ; inst 51
  %42 = sext i32 %41 to i64                                                        ; inst 52
  %43 = getelementptr [5000 x i32], [5000 x i32]* %40, i32 0, i64 %42              ; inst 53
  store i32 %31, i32* %43                                                          ; inst 54
  br label %_10.if.exit.0                                                          ; inst 55
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 56
_10.if.exit.0:
  %44 = phi i1 [0, %_8.if.then.0], [%11, %_9.if.else.0]                            ; inst 57
  %45 = add i32 %12, 1                                                             ; inst 58
  br label %_6.while.cond.2                                                        ; inst 59
_11.while.exit.2:
  br label %_4.while.cond.1                                                        ; inst 60
_12.while.exit.1:
  br label %_13.while.cond.3                                                       ; inst 61
_13.while.cond.3:
  %46 = phi i32 [0, %_12.while.exit.1], [%57, %_14.while.body.3]                   ; inst 62
  %47 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 63
  %48 = load i32, i32* %47                                                         ; inst 64
  %49 = icmp slt i32 %46, %48                                                      ; inst 65
  br i1 %49, label %_14.while.body.3, label %_15.while.exit.3                      ; inst 66
_14.while.body.3:
  %50 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 7         ; inst 67
  %51 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 68
  %52 = sext i32 %46 to i64                                                        ; inst 69
  %53 = getelementptr [5000 x i32], [5000 x i32]* %51, i32 0, i64 %52              ; inst 70
  %54 = load i32, i32* %53                                                         ; inst 71
  %55 = sext i32 %54 to i64                                                        ; inst 72
  %56 = getelementptr [5000 x i32], [5000 x i32]* %50, i32 0, i64 %55              ; inst 73
  store i32 %46, i32* %56                                                          ; inst 74
  %57 = add i32 %46, 1                                                             ; inst 75
  br label %_13.while.cond.3                                                       ; inst 76
_15.while.exit.3:
  ret void                                                                         ; inst 77
}

define i32 @_14su0eKxQra_compare_suffixes(%StringProcessor* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%38, %_11.if.exit.0]                             ; inst 2
  %4 = add i32 %1, %3                                                              ; inst 3
  %5 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  %7 = icmp slt i32 %4, %6                                                         ; inst 6
  br i1 %7, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 7
_2.lazy.then.0:
  %8 = add i32 %2, %3                                                              ; inst 8
  %9 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = icmp slt i32 %8, %10                                                       ; inst 11
  br label %_4.lazy.exit.0                                                         ; inst 12
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 13
_4.lazy.exit.0:
  %12 = phi i1 [%11, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 14
  br i1 %12, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 15
_5.while.body.0:
  %13 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  %15 = add i32 %14, 1                                                             ; inst 18
  store i32 %15, i32* %13                                                          ; inst 19
  %16 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 20
  %17 = add i32 %1, %3                                                             ; inst 21
  %18 = sext i32 %17 to i64                                                        ; inst 22
  %19 = getelementptr [5000 x i32], [5000 x i32]* %16, i32 0, i64 %18              ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 25
  %22 = add i32 %2, %3                                                             ; inst 26
  %23 = sext i32 %22 to i64                                                        ; inst 27
  %24 = getelementptr [5000 x i32], [5000 x i32]* %21, i32 0, i64 %23              ; inst 28
  %25 = load i32, i32* %24                                                         ; inst 29
  %26 = icmp slt i32 %20, %25                                                      ; inst 30
  br i1 %26, label %_6.if.then.0, label %_7.if.else.0                              ; inst 31
_6.if.then.0:
  ret i32 -1                                                                       ; inst 32
_7.if.else.0:
  %27 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 33
  %28 = add i32 %1, %3                                                             ; inst 34
  %29 = sext i32 %28 to i64                                                        ; inst 35
  %30 = getelementptr [5000 x i32], [5000 x i32]* %27, i32 0, i64 %29              ; inst 36
  %31 = load i32, i32* %30                                                         ; inst 37
  %32 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 38
  %33 = add i32 %2, %3                                                             ; inst 39
  %34 = sext i32 %33 to i64                                                        ; inst 40
  %35 = getelementptr [5000 x i32], [5000 x i32]* %32, i32 0, i64 %34              ; inst 41
  %36 = load i32, i32* %35                                                         ; inst 42
  %37 = icmp sgt i32 %31, %36                                                      ; inst 43
  br i1 %37, label %_8.if.then.1, label %_9.if.else.1                              ; inst 44
_8.if.then.1:
  ret i32 1                                                                        ; inst 45
_9.if.else.1:
  br label %_10.if.exit.1                                                          ; inst 46
_10.if.exit.1:
  br label %_11.if.exit.0                                                          ; inst 47
_11.if.exit.0:
  %38 = add i32 %3, 1                                                              ; inst 48
  br label %_1.while.cond.0                                                        ; inst 49
_12.while.exit.0:
  %39 = add i32 %1, %3                                                             ; inst 50
  %40 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 51
  %41 = load i32, i32* %40                                                         ; inst 52
  %42 = icmp sge i32 %39, %41                                                      ; inst 53
  br i1 %42, label %_13.lazy.then.1, label %_14.lazy.else.1                        ; inst 54
_13.lazy.then.1:
  %43 = add i32 %2, %3                                                             ; inst 55
  %44 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 56
  %45 = load i32, i32* %44                                                         ; inst 57
  %46 = icmp sge i32 %43, %45                                                      ; inst 58
  br label %_15.lazy.exit.1                                                        ; inst 59
_14.lazy.else.1:
  br label %_15.lazy.exit.1                                                        ; inst 60
_15.lazy.exit.1:
  %47 = phi i1 [%46, %_13.lazy.then.1], [0, %_14.lazy.else.1]                      ; inst 61
  br i1 %47, label %_16.if.then.2, label %_17.if.else.2                            ; inst 62
_16.if.then.2:
  ret i32 0                                                                        ; inst 63
_17.if.else.2:
  %48 = add i32 %1, %3                                                             ; inst 64
  %49 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 65
  %50 = load i32, i32* %49                                                         ; inst 66
  %51 = icmp sge i32 %48, %50                                                      ; inst 67
  br i1 %51, label %_18.if.then.3, label %_19.if.else.3                            ; inst 68
_18.if.then.3:
  ret i32 -1                                                                       ; inst 69
_19.if.else.3:
  ret i32 1                                                                        ; inst 70
_20.if.exit.3:
  br label %_21.if.exit.2                                                          ; inst 71
_21.if.exit.2:
  unreachable                                                                      ; inst 72
}

define void @_14su0eKxQra_compute_lcp_array(%StringProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%14, %_3.if.then.0], [%57, %_17.if.exit.1]       ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [0, %_3.if.then.0], [%56, %_17.if.exit.1]         ; inst 3
  %3 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = icmp slt i32 %1, %4                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 7
_2.while.body.0:
  %6 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 7          ; inst 8
  %7 = sext i32 %1 to i64                                                          ; inst 9
  %8 = getelementptr [5000 x i32], [5000 x i32]* %6, i32 0, i64 %7                 ; inst 10
  %9 = load i32, i32* %8                                                           ; inst 11
  %10 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = sub i32 %11, 1                                                             ; inst 14
  %13 = icmp eq i32 %9, %12                                                        ; inst 15
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 16
_3.if.then.0:
  %14 = add i32 %1, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 19
_5.if.exit.0:
  %15 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 20
  %16 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 7         ; inst 21
  %17 = sext i32 %1 to i64                                                         ; inst 22
  %18 = getelementptr [5000 x i32], [5000 x i32]* %16, i32 0, i64 %17              ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = add i32 %19, 1                                                             ; inst 25
  %21 = sext i32 %20 to i64                                                        ; inst 26
  %22 = getelementptr [5000 x i32], [5000 x i32]* %15, i32 0, i64 %21              ; inst 27
  %23 = load i32, i32* %22                                                         ; inst 28
  br label %_6.while.cond.1                                                        ; inst 29
_6.while.cond.1:
  %24 = phi i32 [%2, %_5.if.exit.0], [%46, %_13.while.body.1]                      ; inst 30
  %25 = add i32 %1, %24                                                            ; inst 31
  %26 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 32
  %27 = load i32, i32* %26                                                         ; inst 33
  %28 = icmp slt i32 %25, %27                                                      ; inst 34
  br i1 %28, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 35
_7.lazy.then.0:
  %29 = add i32 %23, %24                                                           ; inst 36
  %30 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 37
  %31 = load i32, i32* %30                                                         ; inst 38
  %32 = icmp slt i32 %29, %31                                                      ; inst 39
  br label %_9.lazy.exit.0                                                         ; inst 40
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 41
_9.lazy.exit.0:
  %33 = phi i1 [%32, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 42
  br i1 %33, label %_10.lazy.then.1, label %_11.lazy.else.1                        ; inst 43
_10.lazy.then.1:
  %34 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 44
  %35 = add i32 %1, %24                                                            ; inst 45
  %36 = sext i32 %35 to i64                                                        ; inst 46
  %37 = getelementptr [5000 x i32], [5000 x i32]* %34, i32 0, i64 %36              ; inst 47
  %38 = load i32, i32* %37                                                         ; inst 48
  %39 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 49
  %40 = add i32 %23, %24                                                           ; inst 50
  %41 = sext i32 %40 to i64                                                        ; inst 51
  %42 = getelementptr [5000 x i32], [5000 x i32]* %39, i32 0, i64 %41              ; inst 52
  %43 = load i32, i32* %42                                                         ; inst 53
  %44 = icmp eq i32 %38, %43                                                       ; inst 54
  br label %_12.lazy.exit.1                                                        ; inst 55
_11.lazy.else.1:
  br label %_12.lazy.exit.1                                                        ; inst 56
_12.lazy.exit.1:
  %45 = phi i1 [%44, %_10.lazy.then.1], [0, %_11.lazy.else.1]                      ; inst 57
  br i1 %45, label %_13.while.body.1, label %_14.while.exit.1                      ; inst 58
_13.while.body.1:
  %46 = add i32 %24, 1                                                             ; inst 59
  br label %_6.while.cond.1                                                        ; inst 60
_14.while.exit.1:
  %47 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 6         ; inst 61
  %48 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 7         ; inst 62
  %49 = sext i32 %1 to i64                                                         ; inst 63
  %50 = getelementptr [5000 x i32], [5000 x i32]* %48, i32 0, i64 %49              ; inst 64
  %51 = load i32, i32* %50                                                         ; inst 65
  %52 = sext i32 %51 to i64                                                        ; inst 66
  %53 = getelementptr [5000 x i32], [5000 x i32]* %47, i32 0, i64 %52              ; inst 67
  store i32 %24, i32* %53                                                          ; inst 68
  %54 = icmp sgt i32 %24, 0                                                        ; inst 69
  br i1 %54, label %_15.if.then.1, label %_16.if.else.1                            ; inst 70
_15.if.then.1:
  %55 = sub i32 %24, 1                                                             ; inst 71
  br label %_17.if.exit.1                                                          ; inst 72
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 73
_17.if.exit.1:
  %56 = phi i32 [%55, %_15.if.then.1], [%24, %_16.if.else.1]                       ; inst 74
  %57 = add i32 %1, 1                                                              ; inst 75
  br label %_1.while.cond.0                                                        ; inst 76
_18.while.exit.0:
  ret void                                                                         ; inst 77
}

define void @_14su0eKxQra_preprocess_kmp(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %3                     ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8          ; inst 5
  %7 = getelementptr [200 x i32], [200 x i32]* %6, i32 0, i64 0                    ; inst 6
  store i32 0, i32* %7                                                             ; inst 7
  br label %_1.while.cond.0                                                        ; inst 8
_1.while.cond.0:
  %8 = phi i32 [1, %_0.entry.0], [%41, %_8.if.exit.0]                              ; inst 9
  %9 = phi i32 [0, %_0.entry.0], [%42, %_8.if.exit.0]                              ; inst 10
  %10 = icmp slt i32 %8, %5                                                        ; inst 11
  br i1 %10, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 12
_2.while.body.0:
  %11 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 13
  %12 = sext i32 %1 to i64                                                         ; inst 14
  %13 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %11, i32 0, i64 %12  ; inst 15
  %14 = sext i32 %8 to i64                                                         ; inst 16
  %15 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %14                ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 19
  %18 = sext i32 %1 to i64                                                         ; inst 20
  %19 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %17, i32 0, i64 %18  ; inst 21
  %20 = sext i32 %9 to i64                                                         ; inst 22
  %21 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i64 %20                ; inst 23
  %22 = load i32, i32* %21                                                         ; inst 24
  %23 = icmp eq i32 %16, %22                                                       ; inst 25
  br i1 %23, label %_3.if.then.0, label %_4.if.else.0                              ; inst 26
_3.if.then.0:
  %24 = add i32 %9, 1                                                              ; inst 27
  %25 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8         ; inst 28
  %26 = sext i32 %8 to i64                                                         ; inst 29
  %27 = getelementptr [200 x i32], [200 x i32]* %25, i32 0, i64 %26                ; inst 30
  store i32 %24, i32* %27                                                          ; inst 31
  %28 = add i32 %8, 1                                                              ; inst 32
  br label %_8.if.exit.0                                                           ; inst 33
_4.if.else.0:
  %29 = icmp ne i32 %9, 0                                                          ; inst 34
  br i1 %29, label %_5.if.then.1, label %_6.if.else.1                              ; inst 35
_5.if.then.1:
  %30 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8         ; inst 36
  %31 = sub i32 %9, 1                                                              ; inst 37
  %32 = sext i32 %31 to i64                                                        ; inst 38
  %33 = getelementptr [200 x i32], [200 x i32]* %30, i32 0, i64 %32                ; inst 39
  %34 = load i32, i32* %33                                                         ; inst 40
  br label %_7.if.exit.1                                                           ; inst 41
_6.if.else.1:
  %35 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8         ; inst 42
  %36 = sext i32 %8 to i64                                                         ; inst 43
  %37 = getelementptr [200 x i32], [200 x i32]* %35, i32 0, i64 %36                ; inst 44
  store i32 0, i32* %37                                                            ; inst 45
  %38 = add i32 %8, 1                                                              ; inst 46
  br label %_7.if.exit.1                                                           ; inst 47
_7.if.exit.1:
  %39 = phi i32 [%8, %_5.if.then.1], [%38, %_6.if.else.1]                          ; inst 48
  %40 = phi i32 [%34, %_5.if.then.1], [%9, %_6.if.else.1]                          ; inst 49
  br label %_8.if.exit.0                                                           ; inst 50
_8.if.exit.0:
  %41 = phi i32 [%28, %_3.if.then.0], [%39, %_7.if.exit.1]                         ; inst 51
  %42 = phi i32 [%24, %_3.if.then.0], [%40, %_7.if.exit.1]                         ; inst 52
  br label %_1.while.cond.0                                                        ; inst 53
_9.while.exit.0:
  ret void                                                                         ; inst 54
}

define void @_14su0eKxQra_preprocess_boyer_moore(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %3                     ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 6
  %7 = icmp slt i32 %6, 256                                                        ; inst 7
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  %8 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 9          ; inst 9
  %9 = sext i32 %6 to i64                                                          ; inst 10
  %10 = getelementptr [256 x i32], [256 x i32]* %8, i32 0, i64 %9                  ; inst 11
  store i32 -1, i32* %10                                                           ; inst 12
  %11 = add i32 %6, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 15
_4.while.cond.1:
  %12 = phi i32 [0, %_3.while.exit.0], [%26, %_11.if.exit.0]                       ; inst 16
  %13 = icmp slt i32 %12, %5                                                       ; inst 17
  br i1 %13, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 18
_5.while.body.1:
  %14 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 19
  %15 = sext i32 %1 to i64                                                         ; inst 20
  %16 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %14, i32 0, i64 %15  ; inst 21
  %17 = sext i32 %12 to i64                                                        ; inst 22
  %18 = getelementptr [200 x i32], [200 x i32]* %16, i32 0, i64 %17                ; inst 23
  %19 = load i32, i32* %18                                                         ; inst 24
  %20 = icmp sge i32 %19, 0                                                        ; inst 25
  br i1 %20, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 26
_6.lazy.then.0:
  %21 = icmp slt i32 %19, 256                                                      ; inst 27
  br label %_8.lazy.exit.0                                                         ; inst 28
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 29
_8.lazy.exit.0:
  %22 = phi i1 [%21, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 30
  br i1 %22, label %_9.if.then.0, label %_10.if.else.0                             ; inst 31
_9.if.then.0:
  %23 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 9         ; inst 32
  %24 = sext i32 %19 to i64                                                        ; inst 33
  %25 = getelementptr [256 x i32], [256 x i32]* %23, i32 0, i64 %24                ; inst 34
  store i32 %12, i32* %25                                                          ; inst 35
  br label %_11.if.exit.0                                                          ; inst 36
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 37
_11.if.exit.0:
  %26 = add i32 %12, 1                                                             ; inst 38
  br label %_4.while.cond.1                                                        ; inst 39
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 40
_13.while.cond.2:
  %27 = phi i32 [0, %_12.while.exit.1], [%32, %_14.while.body.2]                   ; inst 41
  %28 = icmp slt i32 %27, %5                                                       ; inst 42
  br i1 %28, label %_14.while.body.2, label %_15.while.exit.2                      ; inst 43
_14.while.body.2:
  %29 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 10        ; inst 44
  %30 = sext i32 %27 to i64                                                        ; inst 45
  %31 = getelementptr [200 x i32], [200 x i32]* %29, i32 0, i64 %30                ; inst 46
  store i32 %5, i32* %31                                                           ; inst 47
  %32 = add i32 %27, 1                                                             ; inst 48
  br label %_13.while.cond.2                                                       ; inst 49
_15.while.exit.2:
  ret void                                                                         ; inst 50
}

define void @_14su0eKxQra_compute_pattern_hash(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %3                     ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %6 = phi i32 [1, %_0.entry.0], [%32, %_5.if.exit.0]                              ; inst 6
  %7 = phi i32 [0, %_0.entry.0], [%23, %_5.if.exit.0]                              ; inst 7
  %8 = phi i32 [0, %_0.entry.0], [%33, %_5.if.exit.0]                              ; inst 8
  %9 = icmp slt i32 %8, %5                                                         ; inst 9
  br i1 %9, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 10
_2.while.body.0:
  %10 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 11
  %11 = sext i32 %1 to i64                                                         ; inst 12
  %12 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %10, i32 0, i64 %11  ; inst 13
  %13 = sext i32 %8 to i64                                                         ; inst 14
  %14 = getelementptr [200 x i32], [200 x i32]* %12, i32 0, i64 %13                ; inst 15
  %15 = load i32, i32* %14                                                         ; inst 16
  %16 = mul i32 %15, %6                                                            ; inst 17
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 18
  %18 = load i32, i32* %17                                                         ; inst 19
  %19 = srem i32 %16, %18                                                          ; inst 20
  %20 = add i32 %7, %19                                                            ; inst 21
  %21 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 22
  %22 = load i32, i32* %21                                                         ; inst 23
  %23 = srem i32 %20, %22                                                          ; inst 24
  %24 = sub i32 %5, 1                                                              ; inst 25
  %25 = icmp slt i32 %8, %24                                                       ; inst 26
  br i1 %25, label %_3.if.then.0, label %_4.if.else.0                              ; inst 27
_3.if.then.0:
  %26 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 13        ; inst 28
  %27 = load i32, i32* %26                                                         ; inst 29
  %28 = mul i32 %6, %27                                                            ; inst 30
  %29 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 31
  %30 = load i32, i32* %29                                                         ; inst 32
  %31 = srem i32 %28, %30                                                          ; inst 33
  br label %_5.if.exit.0                                                           ; inst 34
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 35
_5.if.exit.0:
  %32 = phi i32 [%31, %_3.if.then.0], [%6, %_4.if.else.0]                          ; inst 36
  %33 = add i32 %8, 1                                                              ; inst 37
  br label %_1.while.cond.0                                                        ; inst 38
_6.while.exit.0:
  %34 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 11        ; inst 39
  %35 = sext i32 %1 to i64                                                         ; inst 40
  %36 = getelementptr [50 x i32], [50 x i32]* %34, i32 0, i64 %35                  ; inst 41
  store i32 %7, i32* %36                                                           ; inst 42
  ret void                                                                         ; inst 43
}

define void @_14su0eKxQra_prepare_rabin_karp_hashes(%StringProcessor* %0) {
_0.entry.0:
  %1 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  %3 = icmp eq i32 %2, 0                                                           ; inst 3
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret void                                                                         ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %4 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 12         ; inst 7
  %5 = getelementptr [5000 x i32], [5000 x i32]* %4, i32 0, i64 0                  ; inst 8
  %6 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0          ; inst 9
  %7 = getelementptr [5000 x i32], [5000 x i32]* %6, i32 0, i64 0                  ; inst 10
  %8 = load i32, i32* %7                                                           ; inst 11
  %9 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14         ; inst 12
  %10 = load i32, i32* %9                                                          ; inst 13
  %11 = srem i32 %8, %10                                                           ; inst 14
  store i32 %11, i32* %5                                                           ; inst 15
  br label %_4.while.cond.0                                                        ; inst 16
_4.while.cond.0:
  %12 = phi i32 [1, %_3.if.exit.0], [%44, %_5.while.body.0]                        ; inst 17
  %13 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 18
  %14 = load i32, i32* %13                                                         ; inst 19
  %15 = icmp slt i32 %12, %14                                                      ; inst 20
  br i1 %15, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 21
_5.while.body.0:
  %16 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 12        ; inst 22
  %17 = sext i32 %12 to i64                                                        ; inst 23
  %18 = getelementptr [5000 x i32], [5000 x i32]* %16, i32 0, i64 %17              ; inst 24
  %19 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 12        ; inst 25
  %20 = sub i32 %12, 1                                                             ; inst 26
  %21 = sext i32 %20 to i64                                                        ; inst 27
  %22 = getelementptr [5000 x i32], [5000 x i32]* %19, i32 0, i64 %21              ; inst 28
  %23 = load i32, i32* %22                                                         ; inst 29
  %24 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 30
  %25 = load i32, i32* %24                                                         ; inst 31
  %26 = srem i32 %23, %25                                                          ; inst 32
  %27 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 13        ; inst 33
  %28 = load i32, i32* %27                                                         ; inst 34
  %29 = mul i32 %26, %28                                                           ; inst 35
  %30 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 36
  %31 = load i32, i32* %30                                                         ; inst 37
  %32 = srem i32 %29, %31                                                          ; inst 38
  %33 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 39
  %34 = sext i32 %12 to i64                                                        ; inst 40
  %35 = getelementptr [5000 x i32], [5000 x i32]* %33, i32 0, i64 %34              ; inst 41
  %36 = load i32, i32* %35                                                         ; inst 42
  %37 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 43
  %38 = load i32, i32* %37                                                         ; inst 44
  %39 = srem i32 %36, %38                                                          ; inst 45
  %40 = add i32 %32, %39                                                           ; inst 46
  %41 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 47
  %42 = load i32, i32* %41                                                         ; inst 48
  %43 = srem i32 %40, %42                                                          ; inst 49
  store i32 %43, i32* %18                                                          ; inst 50
  %44 = add i32 %12, 1                                                             ; inst 51
  br label %_4.while.cond.0                                                        ; inst 52
_6.while.exit.0:
  ret void                                                                         ; inst 53
}

define void @_14su0eKxQra_kmp_search(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %3                     ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 24         ; inst 5
  %7 = sext i32 %1 to i64                                                          ; inst 6
  %8 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i64 %7                     ; inst 7
  store i32 0, i32* %8                                                             ; inst 8
  %9 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = icmp sgt i32 %5, %10                                                       ; inst 11
  br i1 %11, label %_1.if.then.0, label %_2.if.else.0                              ; inst 12
_1.if.then.0:
  ret void                                                                         ; inst 13
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 14
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %12 = phi i32 [0, %_3.if.exit.0], [%87, %_23.if.exit.2]                          ; inst 16
  %13 = phi i32 [0, %_3.if.exit.0], [%88, %_23.if.exit.2]                          ; inst 17
  %14 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 18
  %15 = load i32, i32* %14                                                         ; inst 19
  %16 = icmp slt i32 %13, %15                                                      ; inst 20
  br i1 %16, label %_5.while.body.0, label %_24.while.exit.0                       ; inst 21
_5.while.body.0:
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 22
  %18 = load i32, i32* %17                                                         ; inst 23
  %19 = add i32 %18, 1                                                             ; inst 24
  store i32 %19, i32* %17                                                          ; inst 25
  %20 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 26
  %21 = sext i32 %1 to i64                                                         ; inst 27
  %22 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %20, i32 0, i64 %21  ; inst 28
  %23 = sext i32 %12 to i64                                                        ; inst 29
  %24 = getelementptr [200 x i32], [200 x i32]* %22, i32 0, i64 %23                ; inst 30
  %25 = load i32, i32* %24                                                         ; inst 31
  %26 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 32
  %27 = sext i32 %13 to i64                                                        ; inst 33
  %28 = getelementptr [5000 x i32], [5000 x i32]* %26, i32 0, i64 %27              ; inst 34
  %29 = load i32, i32* %28                                                         ; inst 35
  %30 = icmp eq i32 %25, %29                                                       ; inst 36
  br i1 %30, label %_6.if.then.1, label %_7.if.else.1                              ; inst 37
_6.if.then.1:
  %31 = add i32 %13, 1                                                             ; inst 38
  %32 = add i32 %12, 1                                                             ; inst 39
  br label %_8.if.exit.1                                                           ; inst 40
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 41
_8.if.exit.1:
  %33 = phi i32 [%32, %_6.if.then.1], [%12, %_7.if.else.1]                         ; inst 42
  %34 = phi i32 [%31, %_6.if.then.1], [%13, %_7.if.else.1]                         ; inst 43
  %35 = icmp eq i32 %33, %5                                                        ; inst 44
  br i1 %35, label %_9.if.then.2, label %_13.if.else.2                             ; inst 45
_9.if.then.2:
  %36 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 24        ; inst 46
  %37 = sext i32 %1 to i64                                                         ; inst 47
  %38 = getelementptr [50 x i32], [50 x i32]* %36, i32 0, i64 %37                  ; inst 48
  %39 = load i32, i32* %38                                                         ; inst 49
  %40 = icmp slt i32 %39, 100                                                      ; inst 50
  br i1 %40, label %_10.if.then.3, label %_11.if.else.3                            ; inst 51
_10.if.then.3:
  %41 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 23        ; inst 52
  %42 = sext i32 %1 to i64                                                         ; inst 53
  %43 = getelementptr [50 x [100 x i32]], [50 x [100 x i32]]* %41, i32 0, i64 %42  ; inst 54
  %44 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 24        ; inst 55
  %45 = sext i32 %1 to i64                                                         ; inst 56
  %46 = getelementptr [50 x i32], [50 x i32]* %44, i32 0, i64 %45                  ; inst 57
  %47 = load i32, i32* %46                                                         ; inst 58
  %48 = sext i32 %47 to i64                                                        ; inst 59
  %49 = getelementptr [100 x i32], [100 x i32]* %43, i32 0, i64 %48                ; inst 60
  %50 = sub i32 %34, %33                                                           ; inst 61
  store i32 %50, i32* %49                                                          ; inst 62
  br label %_12.if.exit.3                                                          ; inst 63
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 64
_12.if.exit.3:
  %51 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 24        ; inst 65
  %52 = sext i32 %1 to i64                                                         ; inst 66
  %53 = getelementptr [50 x i32], [50 x i32]* %51, i32 0, i64 %52                  ; inst 67
  %54 = load i32, i32* %53                                                         ; inst 68
  %55 = add i32 %54, 1                                                             ; inst 69
  store i32 %55, i32* %53                                                          ; inst 70
  %56 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8         ; inst 71
  %57 = sub i32 %33, 1                                                             ; inst 72
  %58 = sext i32 %57 to i64                                                        ; inst 73
  %59 = getelementptr [200 x i32], [200 x i32]* %56, i32 0, i64 %58                ; inst 74
  %60 = load i32, i32* %59                                                         ; inst 75
  br label %_23.if.exit.2                                                          ; inst 76
_13.if.else.2:
  %61 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 77
  %62 = load i32, i32* %61                                                         ; inst 78
  %63 = icmp slt i32 %34, %62                                                      ; inst 79
  br i1 %63, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 80
_14.lazy.then.0:
  %64 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 81
  %65 = sext i32 %1 to i64                                                         ; inst 82
  %66 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %64, i32 0, i64 %65  ; inst 83
  %67 = sext i32 %33 to i64                                                        ; inst 84
  %68 = getelementptr [200 x i32], [200 x i32]* %66, i32 0, i64 %67                ; inst 85
  %69 = load i32, i32* %68                                                         ; inst 86
  %70 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 87
  %71 = sext i32 %34 to i64                                                        ; inst 88
  %72 = getelementptr [5000 x i32], [5000 x i32]* %70, i32 0, i64 %71              ; inst 89
  %73 = load i32, i32* %72                                                         ; inst 90
  %74 = icmp ne i32 %69, %73                                                       ; inst 91
  br label %_16.lazy.exit.0                                                        ; inst 92
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 93
_16.lazy.exit.0:
  %75 = phi i1 [%74, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 94
  br i1 %75, label %_17.if.then.4, label %_21.if.else.4                            ; inst 95
_17.if.then.4:
  %76 = icmp ne i32 %33, 0                                                         ; inst 96
  br i1 %76, label %_18.if.then.5, label %_19.if.else.5                            ; inst 97
_18.if.then.5:
  %77 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 8         ; inst 98
  %78 = sub i32 %33, 1                                                             ; inst 99
  %79 = sext i32 %78 to i64                                                        ; inst 100
  %80 = getelementptr [200 x i32], [200 x i32]* %77, i32 0, i64 %79                ; inst 101
  %81 = load i32, i32* %80                                                         ; inst 102
  br label %_20.if.exit.5                                                          ; inst 103
_19.if.else.5:
  %82 = add i32 %34, 1                                                             ; inst 104
  br label %_20.if.exit.5                                                          ; inst 105
_20.if.exit.5:
  %83 = phi i32 [%81, %_18.if.then.5], [%33, %_19.if.else.5]                       ; inst 106
  %84 = phi i32 [%34, %_18.if.then.5], [%82, %_19.if.else.5]                       ; inst 107
  br label %_22.if.exit.4                                                          ; inst 108
_21.if.else.4:
  br label %_22.if.exit.4                                                          ; inst 109
_22.if.exit.4:
  %85 = phi i32 [%83, %_20.if.exit.5], [%33, %_21.if.else.4]                       ; inst 110
  %86 = phi i32 [%84, %_20.if.exit.5], [%34, %_21.if.else.4]                       ; inst 111
  br label %_23.if.exit.2                                                          ; inst 112
_23.if.exit.2:
  %87 = phi i32 [%60, %_12.if.exit.3], [%85, %_22.if.exit.4]                       ; inst 113
  %88 = phi i32 [%34, %_12.if.exit.3], [%86, %_22.if.exit.4]                       ; inst 114
  br label %_4.while.cond.0                                                        ; inst 115
_24.while.exit.0:
  ret void                                                                         ; inst 116
}

define void @_14su0eKxQra_boyer_moore_search(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %3                     ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 5
  %7 = load i32, i32* %6                                                           ; inst 6
  %8 = icmp sgt i32 %5, %7                                                         ; inst 7
  br i1 %8, label %_1.if.then.0, label %_2.if.else.0                               ; inst 8
_1.if.then.0:
  ret void                                                                         ; inst 9
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 10
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %9 = phi i32 [0, %_3.if.exit.0], [%59, %_20.if.exit.1]                           ; inst 12
  %10 = phi i32 [0, %_3.if.exit.0], [%60, %_20.if.exit.1]                          ; inst 13
  %11 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = sub i32 %12, %5                                                            ; inst 16
  %14 = icmp sle i32 %9, %13                                                       ; inst 17
  br i1 %14, label %_5.while.body.0, label %_21.while.exit.0                       ; inst 18
_5.while.body.0:
  %15 = sub i32 %5, 1                                                              ; inst 19
  br label %_6.while.cond.1                                                        ; inst 20
_6.while.cond.1:
  %16 = phi i32 [%15, %_5.while.body.0], [%31, %_10.while.body.1]                  ; inst 21
  %17 = icmp sge i32 %16, 0                                                        ; inst 22
  br i1 %17, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 23
_7.lazy.then.0:
  %18 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 24
  %19 = sext i32 %1 to i64                                                         ; inst 25
  %20 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %18, i32 0, i64 %19  ; inst 26
  %21 = sext i32 %16 to i64                                                        ; inst 27
  %22 = getelementptr [200 x i32], [200 x i32]* %20, i32 0, i64 %21                ; inst 28
  %23 = load i32, i32* %22                                                         ; inst 29
  %24 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 30
  %25 = add i32 %9, %16                                                            ; inst 31
  %26 = sext i32 %25 to i64                                                        ; inst 32
  %27 = getelementptr [5000 x i32], [5000 x i32]* %24, i32 0, i64 %26              ; inst 33
  %28 = load i32, i32* %27                                                         ; inst 34
  %29 = icmp eq i32 %23, %28                                                       ; inst 35
  br label %_9.lazy.exit.0                                                         ; inst 36
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 37
_9.lazy.exit.0:
  %30 = phi i1 [%29, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 38
  br i1 %30, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 39
_10.while.body.1:
  %31 = sub i32 %16, 1                                                             ; inst 40
  %32 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 41
  %33 = load i32, i32* %32                                                         ; inst 42
  %34 = add i32 %33, 1                                                             ; inst 43
  store i32 %34, i32* %32                                                          ; inst 44
  br label %_6.while.cond.1                                                        ; inst 45
_11.while.exit.1:
  %35 = icmp slt i32 %16, 0                                                        ; inst 46
  br i1 %35, label %_12.if.then.1, label %_16.if.else.1                            ; inst 47
_12.if.then.1:
  %36 = add i32 %10, 1                                                             ; inst 48
  %37 = add i32 %9, %5                                                             ; inst 49
  %38 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 50
  %39 = load i32, i32* %38                                                         ; inst 51
  %40 = icmp slt i32 %37, %39                                                      ; inst 52
  br i1 %40, label %_13.if.then.2, label %_14.if.else.2                            ; inst 53
_13.if.then.2:
  br label %_15.if.exit.2                                                          ; inst 54
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 55
_15.if.exit.2:
  %41 = phi i32 [%5, %_13.if.then.2], [1, %_14.if.else.2]                          ; inst 56
  %42 = add i32 %9, %41                                                            ; inst 57
  br label %_20.if.exit.1                                                          ; inst 58
_16.if.else.1:
  %43 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 9         ; inst 59
  %44 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 60
  %45 = add i32 %9, %16                                                            ; inst 61
  %46 = sext i32 %45 to i64                                                        ; inst 62
  %47 = getelementptr [5000 x i32], [5000 x i32]* %44, i32 0, i64 %46              ; inst 63
  %48 = load i32, i32* %47                                                         ; inst 64
  %49 = sext i32 %48 to i64                                                        ; inst 65
  %50 = getelementptr [256 x i32], [256 x i32]* %43, i32 0, i64 %49                ; inst 66
  %51 = load i32, i32* %50                                                         ; inst 67
  %52 = sub i32 %16, %51                                                           ; inst 68
  %53 = icmp sgt i32 %52, 1                                                        ; inst 69
  br i1 %53, label %_17.if.then.3, label %_18.if.else.3                            ; inst 70
_17.if.then.3:
  br label %_19.if.exit.3                                                          ; inst 71
_18.if.else.3:
  br label %_19.if.exit.3                                                          ; inst 72
_19.if.exit.3:
  %54 = phi i32 [%52, %_17.if.then.3], [1, %_18.if.else.3]                         ; inst 73
  %55 = add i32 %9, %54                                                            ; inst 74
  %56 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 75
  %57 = load i32, i32* %56                                                         ; inst 76
  %58 = add i32 %57, 1                                                             ; inst 77
  store i32 %58, i32* %56                                                          ; inst 78
  br label %_20.if.exit.1                                                          ; inst 79
_20.if.exit.1:
  %59 = phi i32 [%42, %_15.if.exit.2], [%55, %_19.if.exit.3]                       ; inst 80
  %60 = phi i32 [%36, %_15.if.exit.2], [%10, %_19.if.exit.3]                       ; inst 81
  br label %_4.while.cond.0                                                        ; inst 82
_21.while.exit.0:
  %61 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 83
  %62 = getelementptr [10 x i32], [10 x i32]* %61, i32 0, i64 1                    ; inst 84
  store i32 %10, i32* %62                                                          ; inst 85
  ret void                                                                         ; inst 86
}

define void @_14su0eKxQra_rabin_karp_search(%StringProcessor* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %3                     ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 11         ; inst 5
  %7 = sext i32 %1 to i64                                                          ; inst 6
  %8 = getelementptr [50 x i32], [50 x i32]* %6, i32 0, i64 %7                     ; inst 7
  %9 = load i32, i32* %8                                                           ; inst 8
  %10 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 9
  %11 = load i32, i32* %10                                                         ; inst 10
  %12 = icmp sgt i32 %5, %11                                                       ; inst 11
  br i1 %12, label %_1.if.then.0, label %_2.if.else.0                              ; inst 12
_1.if.then.0:
  ret void                                                                         ; inst 13
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 14
_3.if.exit.0:
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %13 = phi i32 [1, %_3.if.exit.0], [%37, %_8.if.exit.1]                           ; inst 16
  %14 = phi i32 [0, %_3.if.exit.0], [%28, %_8.if.exit.1]                           ; inst 17
  %15 = phi i32 [0, %_3.if.exit.0], [%38, %_8.if.exit.1]                           ; inst 18
  %16 = icmp slt i32 %15, %5                                                       ; inst 19
  br i1 %16, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 20
_5.while.body.0:
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 21
  %18 = sext i32 %15 to i64                                                        ; inst 22
  %19 = getelementptr [5000 x i32], [5000 x i32]* %17, i32 0, i64 %18              ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = mul i32 %20, %13                                                           ; inst 25
  %22 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 26
  %23 = load i32, i32* %22                                                         ; inst 27
  %24 = srem i32 %21, %23                                                          ; inst 28
  %25 = add i32 %14, %24                                                           ; inst 29
  %26 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 30
  %27 = load i32, i32* %26                                                         ; inst 31
  %28 = srem i32 %25, %27                                                          ; inst 32
  %29 = sub i32 %5, 1                                                              ; inst 33
  %30 = icmp slt i32 %15, %29                                                      ; inst 34
  br i1 %30, label %_6.if.then.1, label %_7.if.else.1                              ; inst 35
_6.if.then.1:
  %31 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 13        ; inst 36
  %32 = load i32, i32* %31                                                         ; inst 37
  %33 = mul i32 %13, %32                                                           ; inst 38
  %34 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 39
  %35 = load i32, i32* %34                                                         ; inst 40
  %36 = srem i32 %33, %35                                                          ; inst 41
  br label %_8.if.exit.1                                                           ; inst 42
_7.if.else.1:
  br label %_8.if.exit.1                                                           ; inst 43
_8.if.exit.1:
  %37 = phi i32 [%36, %_6.if.then.1], [%13, %_7.if.else.1]                         ; inst 44
  %38 = add i32 %15, 1                                                             ; inst 45
  br label %_4.while.cond.0                                                        ; inst 46
_9.while.exit.0:
  %39 = icmp eq i32 %14, %9                                                        ; inst 47
  br i1 %39, label %_10.if.then.2, label %_14.if.else.2                            ; inst 48
_10.if.then.2:
  %40 = call i1 @_14su0eKxQra_verify_match(%StringProcessor* %0, i32 0, i32 %1)    ; inst 49
  br i1 %40, label %_11.if.then.3, label %_12.if.else.3                            ; inst 50
_11.if.then.3:
  br label %_13.if.exit.3                                                          ; inst 51
_12.if.else.3:
  %41 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 27        ; inst 52
  %42 = load i32, i32* %41                                                         ; inst 53
  %43 = add i32 %42, 1                                                             ; inst 54
  store i32 %43, i32* %41                                                          ; inst 55
  br label %_13.if.exit.3                                                          ; inst 56
_13.if.exit.3:
  %44 = phi i32 [1, %_11.if.then.3], [0, %_12.if.else.3]                           ; inst 57
  br label %_15.if.exit.2                                                          ; inst 58
_14.if.else.2:
  br label %_15.if.exit.2                                                          ; inst 59
_15.if.exit.2:
  %45 = phi i32 [%44, %_13.if.exit.3], [0, %_14.if.else.2]                         ; inst 60
  br label %_16.while.cond.1                                                       ; inst 61
_16.while.cond.1:
  %46 = phi i32 [%14, %_15.if.exit.2], [%78, %_23.if.exit.4]                       ; inst 62
  %47 = phi i32 [%45, %_15.if.exit.2], [%88, %_23.if.exit.4]                       ; inst 63
  %48 = phi i32 [%5, %_15.if.exit.2], [%89, %_23.if.exit.4]                        ; inst 64
  %49 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 65
  %50 = load i32, i32* %49                                                         ; inst 66
  %51 = icmp slt i32 %48, %50                                                      ; inst 67
  br i1 %51, label %_17.while.body.1, label %_24.while.exit.1                      ; inst 68
_17.while.body.1:
  %52 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 69
  %53 = sub i32 %48, %5                                                            ; inst 70
  %54 = sext i32 %53 to i64                                                        ; inst 71
  %55 = getelementptr [5000 x i32], [5000 x i32]* %52, i32 0, i64 %54              ; inst 72
  %56 = load i32, i32* %55                                                         ; inst 73
  %57 = mul i32 %56, %13                                                           ; inst 74
  %58 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 75
  %59 = load i32, i32* %58                                                         ; inst 76
  %60 = srem i32 %57, %59                                                          ; inst 77
  %61 = sub i32 %46, %60                                                           ; inst 78
  %62 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 79
  %63 = load i32, i32* %62                                                         ; inst 80
  %64 = add i32 %61, %63                                                           ; inst 81
  %65 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 82
  %66 = load i32, i32* %65                                                         ; inst 83
  %67 = srem i32 %64, %66                                                          ; inst 84
  %68 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 13        ; inst 85
  %69 = load i32, i32* %68                                                         ; inst 86
  %70 = mul i32 %67, %69                                                           ; inst 87
  %71 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 88
  %72 = sext i32 %48 to i64                                                        ; inst 89
  %73 = getelementptr [5000 x i32], [5000 x i32]* %71, i32 0, i64 %72              ; inst 90
  %74 = load i32, i32* %73                                                         ; inst 91
  %75 = add i32 %70, %74                                                           ; inst 92
  %76 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 14        ; inst 93
  %77 = load i32, i32* %76                                                         ; inst 94
  %78 = srem i32 %75, %77                                                          ; inst 95
  %79 = icmp eq i32 %78, %9                                                        ; inst 96
  br i1 %79, label %_18.if.then.4, label %_22.if.else.4                            ; inst 97
_18.if.then.4:
  %80 = sub i32 %48, %5                                                            ; inst 98
  %81 = add i32 %80, 1                                                             ; inst 99
  %82 = call i1 @_14su0eKxQra_verify_match(%StringProcessor* %0, i32 %81, i32 %1)  ; inst 100
  br i1 %82, label %_19.if.then.5, label %_20.if.else.5                            ; inst 101
_19.if.then.5:
  %83 = add i32 %47, 1                                                             ; inst 102
  br label %_21.if.exit.5                                                          ; inst 103
_20.if.else.5:
  %84 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 27        ; inst 104
  %85 = load i32, i32* %84                                                         ; inst 105
  %86 = add i32 %85, 1                                                             ; inst 106
  store i32 %86, i32* %84                                                          ; inst 107
  br label %_21.if.exit.5                                                          ; inst 108
_21.if.exit.5:
  %87 = phi i32 [%83, %_19.if.then.5], [%47, %_20.if.else.5]                       ; inst 109
  br label %_23.if.exit.4                                                          ; inst 110
_22.if.else.4:
  br label %_23.if.exit.4                                                          ; inst 111
_23.if.exit.4:
  %88 = phi i32 [%87, %_21.if.exit.5], [%47, %_22.if.else.4]                       ; inst 112
  %89 = add i32 %48, 1                                                             ; inst 113
  br label %_16.while.cond.1                                                       ; inst 114
_24.while.exit.1:
  %90 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 115
  %91 = getelementptr [10 x i32], [10 x i32]* %90, i32 0, i64 2                    ; inst 116
  store i32 %47, i32* %91                                                          ; inst 117
  ret void                                                                         ; inst 118
}

define i1 @_14su0eKxQra_verify_match(%StringProcessor* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 3          ; inst 1
  %4 = sext i32 %2 to i64                                                          ; inst 2
  %5 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %4                     ; inst 3
  %6 = load i32, i32* %5                                                           ; inst 4
  br label %_1.while.cond.0                                                        ; inst 5
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%24, %_5.if.exit.0]                              ; inst 6
  %8 = icmp slt i32 %7, %6                                                         ; inst 7
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 8
_2.while.body.0:
  %9 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26         ; inst 9
  %10 = load i32, i32* %9                                                          ; inst 10
  %11 = add i32 %10, 1                                                             ; inst 11
  store i32 %11, i32* %9                                                           ; inst 12
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 13
  %13 = add i32 %1, %7                                                             ; inst 14
  %14 = sext i32 %13 to i64                                                        ; inst 15
  %15 = getelementptr [5000 x i32], [5000 x i32]* %12, i32 0, i64 %14              ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 2         ; inst 18
  %18 = sext i32 %2 to i64                                                         ; inst 19
  %19 = getelementptr [50 x [200 x i32]], [50 x [200 x i32]]* %17, i32 0, i64 %18  ; inst 20
  %20 = sext i32 %7 to i64                                                         ; inst 21
  %21 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i64 %20                ; inst 22
  %22 = load i32, i32* %21                                                         ; inst 23
  %23 = icmp ne i32 %16, %22                                                       ; inst 24
  br i1 %23, label %_3.if.then.0, label %_4.if.else.0                              ; inst 25
_3.if.then.0:
  ret i1 0                                                                         ; inst 26
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 27
_5.if.exit.0:
  %24 = add i32 %7, 1                                                              ; inst 28
  br label %_1.while.cond.0                                                        ; inst 29
_6.while.exit.0:
  ret i1 1                                                                         ; inst 30
}

define i32 @_14su0eKxQra_compute_edit_distance(%StringProcessor* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [500 x i32]                                                          ; inst 1
  %4 = getelementptr [500 x i32], [500 x i32]* %3, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 500                                                        ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 7
  store i32 0, i32* %7                                                             ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = alloca [500 x i32]                                                          ; inst 11
  %10 = getelementptr [500 x i32], [500 x i32]* %9, i32 0, i32 0                   ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 14
  %12 = icmp slt i32 %11, 500                                                      ; inst 15
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %13 = getelementptr i32, i32* %10, i32 %11                                       ; inst 17
  store i32 0, i32* %13                                                            ; inst 18
  %14 = add i32 %11, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %15 = phi i32 [0, %_6.array.exit.1], [%20, %_8.while.body.0]                     ; inst 22
  %16 = icmp slt i32 %15, %1                                                       ; inst 23
  br i1 %16, label %_8.while.body.0, label %_9.while.exit.0                        ; inst 24
_8.while.body.0:
  %17 = sext i32 %15 to i64                                                        ; inst 25
  %18 = getelementptr [500 x i32], [500 x i32]* %3, i32 0, i64 %17                 ; inst 26
  %19 = call i32 @getInt()                                                         ; inst 27
  store i32 %19, i32* %18                                                          ; inst 28
  %20 = add i32 %15, 1                                                             ; inst 29
  br label %_7.while.cond.0                                                        ; inst 30
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 31
_10.while.cond.1:
  %21 = phi i32 [0, %_9.while.exit.0], [%26, %_11.while.body.1]                    ; inst 32
  %22 = icmp slt i32 %21, %2                                                       ; inst 33
  br i1 %22, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 34
_11.while.body.1:
  %23 = sext i32 %21 to i64                                                        ; inst 35
  %24 = getelementptr [500 x i32], [500 x i32]* %9, i32 0, i64 %23                 ; inst 36
  %25 = call i32 @getInt()                                                         ; inst 37
  store i32 %25, i32* %24                                                          ; inst 38
  %26 = add i32 %21, 1                                                             ; inst 39
  br label %_10.while.cond.1                                                       ; inst 40
_12.while.exit.1:
  br label %_13.while.cond.2                                                       ; inst 41
_13.while.cond.2:
  %27 = phi i32 [0, %_12.while.exit.1], [%33, %_14.while.body.2]                   ; inst 42
  %28 = icmp sle i32 %27, %1                                                       ; inst 43
  br i1 %28, label %_14.while.body.2, label %_15.while.exit.2                      ; inst 44
_14.while.body.2:
  %29 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 45
  %30 = sext i32 %27 to i64                                                        ; inst 46
  %31 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %29, i32 0, i64 %30 ; inst 47
  %32 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 0                  ; inst 48
  store i32 %27, i32* %32                                                          ; inst 49
  %33 = add i32 %27, 1                                                             ; inst 50
  br label %_13.while.cond.2                                                       ; inst 51
_15.while.exit.2:
  br label %_16.while.cond.3                                                       ; inst 52
_16.while.cond.3:
  %34 = phi i32 [0, %_15.while.exit.2], [%40, %_17.while.body.3]                   ; inst 53
  %35 = icmp sle i32 %34, %2                                                       ; inst 54
  br i1 %35, label %_17.while.body.3, label %_18.while.exit.3                      ; inst 55
_17.while.body.3:
  %36 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 56
  %37 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %36, i32 0, i64 0  ; inst 57
  %38 = sext i32 %34 to i64                                                        ; inst 58
  %39 = getelementptr [500 x i32], [500 x i32]* %37, i32 0, i64 %38                ; inst 59
  store i32 %34, i32* %39                                                          ; inst 60
  %40 = add i32 %34, 1                                                             ; inst 61
  br label %_16.while.cond.3                                                       ; inst 62
_18.while.exit.3:
  br label %_19.while.cond.4                                                       ; inst 63
_19.while.cond.4:
  %41 = phi i32 [1, %_18.while.exit.3], [%104, %_35.while.exit.5]                  ; inst 64
  %42 = icmp sle i32 %41, %1                                                       ; inst 65
  br i1 %42, label %_20.while.body.4, label %_36.while.exit.4                      ; inst 66
_20.while.body.4:
  br label %_21.while.cond.5                                                       ; inst 67
_21.while.cond.5:
  %43 = phi i32 [1, %_20.while.body.4], [%103, %_34.if.exit.0]                     ; inst 68
  %44 = icmp sle i32 %43, %2                                                       ; inst 69
  br i1 %44, label %_22.while.body.5, label %_35.while.exit.5                      ; inst 70
_22.while.body.5:
  %45 = sub i32 %41, 1                                                             ; inst 71
  %46 = sext i32 %45 to i64                                                        ; inst 72
  %47 = getelementptr [500 x i32], [500 x i32]* %3, i32 0, i64 %46                 ; inst 73
  %48 = load i32, i32* %47                                                         ; inst 74
  %49 = sub i32 %43, 1                                                             ; inst 75
  %50 = sext i32 %49 to i64                                                        ; inst 76
  %51 = getelementptr [500 x i32], [500 x i32]* %9, i32 0, i64 %50                 ; inst 77
  %52 = load i32, i32* %51                                                         ; inst 78
  %53 = icmp eq i32 %48, %52                                                       ; inst 79
  br i1 %53, label %_23.if.then.0, label %_24.if.else.0                            ; inst 80
_23.if.then.0:
  %54 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 81
  %55 = sext i32 %41 to i64                                                        ; inst 82
  %56 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %54, i32 0, i64 %55 ; inst 83
  %57 = sext i32 %43 to i64                                                        ; inst 84
  %58 = getelementptr [500 x i32], [500 x i32]* %56, i32 0, i64 %57                ; inst 85
  %59 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 86
  %60 = sub i32 %41, 1                                                             ; inst 87
  %61 = sext i32 %60 to i64                                                        ; inst 88
  %62 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %59, i32 0, i64 %61 ; inst 89
  %63 = sub i32 %43, 1                                                             ; inst 90
  %64 = sext i32 %63 to i64                                                        ; inst 91
  %65 = getelementptr [500 x i32], [500 x i32]* %62, i32 0, i64 %64                ; inst 92
  %66 = load i32, i32* %65                                                         ; inst 93
  store i32 %66, i32* %58                                                          ; inst 94
  br label %_34.if.exit.0                                                          ; inst 95
_24.if.else.0:
  %67 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 96
  %68 = sext i32 %41 to i64                                                        ; inst 97
  %69 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %67, i32 0, i64 %68 ; inst 98
  %70 = sub i32 %43, 1                                                             ; inst 99
  %71 = sext i32 %70 to i64                                                        ; inst 100
  %72 = getelementptr [500 x i32], [500 x i32]* %69, i32 0, i64 %71                ; inst 101
  %73 = load i32, i32* %72                                                         ; inst 102
  %74 = add i32 %73, 1                                                             ; inst 103
  %75 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 104
  %76 = sub i32 %41, 1                                                             ; inst 105
  %77 = sext i32 %76 to i64                                                        ; inst 106
  %78 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %75, i32 0, i64 %77 ; inst 107
  %79 = sext i32 %43 to i64                                                        ; inst 108
  %80 = getelementptr [500 x i32], [500 x i32]* %78, i32 0, i64 %79                ; inst 109
  %81 = load i32, i32* %80                                                         ; inst 110
  %82 = add i32 %81, 1                                                             ; inst 111
  %83 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 112
  %84 = sub i32 %41, 1                                                             ; inst 113
  %85 = sext i32 %84 to i64                                                        ; inst 114
  %86 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %83, i32 0, i64 %85 ; inst 115
  %87 = sub i32 %43, 1                                                             ; inst 116
  %88 = sext i32 %87 to i64                                                        ; inst 117
  %89 = getelementptr [500 x i32], [500 x i32]* %86, i32 0, i64 %88                ; inst 118
  %90 = load i32, i32* %89                                                         ; inst 119
  %91 = add i32 %90, 1                                                             ; inst 120
  %92 = icmp slt i32 %74, %82                                                      ; inst 121
  br i1 %92, label %_25.if.then.1, label %_29.if.else.1                            ; inst 122
_25.if.then.1:
  %93 = icmp slt i32 %74, %91                                                      ; inst 123
  br i1 %93, label %_26.if.then.2, label %_27.if.else.2                            ; inst 124
_26.if.then.2:
  br label %_28.if.exit.2                                                          ; inst 125
_27.if.else.2:
  br label %_28.if.exit.2                                                          ; inst 126
_28.if.exit.2:
  %94 = phi i32 [%74, %_26.if.then.2], [%91, %_27.if.else.2]                       ; inst 127
  br label %_33.if.exit.1                                                          ; inst 128
_29.if.else.1:
  %95 = icmp slt i32 %82, %91                                                      ; inst 129
  br i1 %95, label %_30.if.then.3, label %_31.if.else.3                            ; inst 130
_30.if.then.3:
  br label %_32.if.exit.3                                                          ; inst 131
_31.if.else.3:
  br label %_32.if.exit.3                                                          ; inst 132
_32.if.exit.3:
  %96 = phi i32 [%82, %_30.if.then.3], [%91, %_31.if.else.3]                       ; inst 133
  br label %_33.if.exit.1                                                          ; inst 134
_33.if.exit.1:
  %97 = phi i32 [%94, %_28.if.exit.2], [%96, %_32.if.exit.3]                       ; inst 135
  %98 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15        ; inst 136
  %99 = sext i32 %41 to i64                                                        ; inst 137
  %100 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %98, i32 0, i64 %99 ; inst 138
  %101 = sext i32 %43 to i64                                                       ; inst 139
  %102 = getelementptr [500 x i32], [500 x i32]* %100, i32 0, i64 %101             ; inst 140
  store i32 %97, i32* %102                                                         ; inst 141
  br label %_34.if.exit.0                                                          ; inst 142
_34.if.exit.0:
  %103 = add i32 %43, 1                                                            ; inst 143
  br label %_21.while.cond.5                                                       ; inst 144
_35.while.exit.5:
  %104 = add i32 %41, 1                                                            ; inst 145
  br label %_19.while.cond.4                                                       ; inst 146
_36.while.exit.4:
  %105 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 15       ; inst 147
  %106 = sext i32 %1 to i64                                                        ; inst 148
  %107 = getelementptr [500 x [500 x i32]], [500 x [500 x i32]]* %105, i32 0, i64 %106 ; inst 149
  %108 = sext i32 %2 to i64                                                        ; inst 150
  %109 = getelementptr [500 x i32], [500 x i32]* %107, i32 0, i64 %108             ; inst 151
  %110 = load i32, i32* %109                                                       ; inst 152
  ret i32 %110                                                                     ; inst 153
}

define i32 @_14su0eKxQra_analyze_compression_potential(%StringProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%30, %_11.if.exit.0]                             ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%29, %_11.if.exit.0]                             ; inst 3
  %3 = icmp slt i32 %1, 256                                                        ; inst 4
  br i1 %3, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %4 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 16         ; inst 6
  %5 = sext i32 %1 to i64                                                          ; inst 7
  %6 = getelementptr [256 x i32], [256 x i32]* %4, i32 0, i64 %5                   ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = icmp sgt i32 %7, 0                                                          ; inst 10
  br i1 %8, label %_3.if.then.0, label %_10.if.else.0                              ; inst 11
_3.if.then.0:
  %9 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 16         ; inst 12
  %10 = sext i32 %1 to i64                                                         ; inst 13
  %11 = getelementptr [256 x i32], [256 x i32]* %9, i32 0, i64 %10                 ; inst 14
  %12 = load i32, i32* %11                                                         ; inst 15
  %13 = mul i32 %12, 1000                                                          ; inst 16
  %14 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  %16 = sdiv i32 %13, %15                                                          ; inst 19
  br label %_4.while.cond.1                                                        ; inst 20
_4.while.cond.1:
  %17 = phi i32 [%16, %_3.if.then.0], [%21, %_5.while.body.1]                      ; inst 21
  %18 = phi i32 [0, %_3.if.then.0], [%20, %_5.while.body.1]                        ; inst 22
  %19 = icmp sgt i32 %17, 1                                                        ; inst 23
  br i1 %19, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 24
_5.while.body.1:
  %20 = add i32 %18, 1                                                             ; inst 25
  %21 = sdiv i32 %17, 2                                                            ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_6.while.exit.1:
  %22 = mul i32 %12, %18                                                           ; inst 28
  %23 = add i32 %2, %22                                                            ; inst 29
  %24 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 18        ; inst 30
  %25 = sext i32 %1 to i64                                                         ; inst 31
  %26 = getelementptr [256 x i32], [256 x i32]* %24, i32 0, i64 %25                ; inst 32
  %27 = icmp sgt i32 %18, 0                                                        ; inst 33
  br i1 %27, label %_7.if.then.1, label %_8.if.else.1                              ; inst 34
_7.if.then.1:
  br label %_9.if.exit.1                                                           ; inst 35
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 36
_9.if.exit.1:
  %28 = phi i32 [%18, %_7.if.then.1], [1, %_8.if.else.1]                           ; inst 37
  store i32 %28, i32* %26                                                          ; inst 38
  br label %_11.if.exit.0                                                          ; inst 39
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 40
_11.if.exit.0:
  %29 = phi i32 [%23, %_9.if.exit.1], [%2, %_10.if.else.0]                         ; inst 41
  %30 = add i32 %1, 1                                                              ; inst 42
  br label %_1.while.cond.0                                                        ; inst 43
_12.while.exit.0:
  %31 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 44
  %32 = load i32, i32* %31                                                         ; inst 45
  %33 = mul i32 %32, 8                                                             ; inst 46
  %34 = sub i32 %33, %2                                                            ; inst 47
  ret i32 %34                                                                      ; inst 48
}

define i32 @_14su0eKxQra_find_longest_repeated_substring(%StringProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 3
  %3 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = sub i32 %4, 1                                                               ; inst 6
  %6 = icmp slt i32 %1, %5                                                         ; inst 7
  br i1 %6, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 8
_2.while.body.0:
  %7 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 6          ; inst 9
  %8 = sext i32 %1 to i64                                                          ; inst 10
  %9 = getelementptr [5000 x i32], [5000 x i32]* %7, i32 0, i64 %8                 ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  %11 = icmp sgt i32 %10, %2                                                       ; inst 13
  br i1 %11, label %_3.if.then.0, label %_4.if.else.0                              ; inst 14
_3.if.then.0:
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 6         ; inst 15
  %13 = sext i32 %1 to i64                                                         ; inst 16
  %14 = getelementptr [5000 x i32], [5000 x i32]* %12, i32 0, i64 %13              ; inst 17
  %15 = load i32, i32* %14                                                         ; inst 18
  br label %_5.if.exit.0                                                           ; inst 19
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 20
_5.if.exit.0:
  %16 = phi i32 [%15, %_3.if.then.0], [%2, %_4.if.else.0]                          ; inst 21
  %17 = add i32 %1, 1                                                              ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  ret i32 %2                                                                       ; inst 24
}

define void @_14su0eKxQra_perform_comprehensive_analysis(%StringProcessor* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%5, %_2.while.body.0]                            ; inst 2
  %2 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4          ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  call void @_14su0eKxQra_kmp_search(%StringProcessor* %0, i32 %1)                 ; inst 7
  call void @_14su0eKxQra_boyer_moore_search(%StringProcessor* %0, i32 %1)         ; inst 8
  call void @_14su0eKxQra_rabin_karp_search(%StringProcessor* %0, i32 %1)          ; inst 9
  %5 = add i32 %1, 1                                                               ; inst 10
  br label %_1.while.cond.0                                                        ; inst 11
_3.while.exit.0:
  %6 = call i32 @_14su0eKxQra_analyze_compression_potential(%StringProcessor* %0)  ; inst 12
  %7 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25         ; inst 13
  %8 = getelementptr [10 x i32], [10 x i32]* %7, i32 0, i64 3                      ; inst 14
  store i32 %6, i32* %8                                                            ; inst 15
  %9 = call i32 @_14su0eKxQra_find_longest_repeated_substring(%StringProcessor* %0) ; inst 16
  %10 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 17
  %11 = getelementptr [10 x i32], [10 x i32]* %10, i32 0, i64 4                    ; inst 18
  store i32 %9, i32* %11                                                           ; inst 19
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19        ; inst 20
  %13 = load i32, i32* %12                                                         ; inst 21
  %14 = icmp sgt i32 %13, 0                                                        ; inst 22
  br i1 %14, label %_4.if.then.0, label %_5.if.else.0                              ; inst 23
_4.if.then.0:
  %15 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 24
  %16 = load i32, i32* %15                                                         ; inst 25
  %17 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19        ; inst 26
  %18 = load i32, i32* %17                                                         ; inst 27
  %19 = sdiv i32 %16, %18                                                          ; inst 28
  br label %_6.if.exit.0                                                           ; inst 29
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 30
_6.if.exit.0:
  %20 = phi i32 [%19, %_4.if.then.0], [0, %_5.if.else.0]                           ; inst 31
  %21 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22        ; inst 32
  %22 = load i32, i32* %21                                                         ; inst 33
  %23 = mul i32 %22, 100                                                           ; inst 34
  %24 = sdiv i32 %23, 256                                                          ; inst 35
  %25 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 36
  %26 = getelementptr [10 x i32], [10 x i32]* %25, i32 0, i64 5                    ; inst 37
  store i32 %20, i32* %26                                                          ; inst 38
  %27 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 39
  %28 = getelementptr [10 x i32], [10 x i32]* %27, i32 0, i64 6                    ; inst 40
  store i32 %24, i32* %28                                                          ; inst 41
  ret void                                                                         ; inst 42
}

define void @_14su0eKxQra_output_results(%StringProcessor* %0) {
_0.entry.0:
  %1 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1          ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  call void @printlnInt(i32 %2)                                                    ; inst 3
  %3 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19         ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  call void @printlnInt(i32 %4)                                                    ; inst 6
  %5 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 20         ; inst 7
  %6 = load i32, i32* %5                                                           ; inst 8
  call void @printlnInt(i32 %6)                                                    ; inst 9
  %7 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 21         ; inst 10
  %8 = load i32, i32* %7                                                           ; inst 11
  call void @printlnInt(i32 %8)                                                    ; inst 12
  %9 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22         ; inst 13
  %10 = load i32, i32* %9                                                          ; inst 14
  call void @printlnInt(i32 %10)                                                   ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_1.while.cond.0:
  %11 = phi i32 [0, %_0.entry.0], [%19, %_2.while.body.0]                          ; inst 17
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4         ; inst 18
  %13 = load i32, i32* %12                                                         ; inst 19
  %14 = icmp slt i32 %11, %13                                                      ; inst 20
  br i1 %14, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 21
_2.while.body.0:
  %15 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 24        ; inst 22
  %16 = sext i32 %11 to i64                                                        ; inst 23
  %17 = getelementptr [50 x i32], [50 x i32]* %15, i32 0, i64 %16                  ; inst 24
  %18 = load i32, i32* %17                                                         ; inst 25
  call void @printlnInt(i32 %18)                                                   ; inst 26
  %19 = add i32 %11, 1                                                             ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_3.while.exit.0:
  %20 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 29
  %21 = load i32, i32* %20                                                         ; inst 30
  call void @printlnInt(i32 %21)                                                   ; inst 31
  %22 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 27        ; inst 32
  %23 = load i32, i32* %22                                                         ; inst 33
  call void @printlnInt(i32 %23)                                                   ; inst 34
  br label %_4.while.cond.1                                                        ; inst 35
_4.while.cond.1:
  %24 = phi i32 [0, %_3.while.exit.0], [%30, %_5.while.body.1]                     ; inst 36
  %25 = icmp slt i32 %24, 7                                                        ; inst 37
  br i1 %25, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 38
_5.while.body.1:
  %26 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 39
  %27 = sext i32 %24 to i64                                                        ; inst 40
  %28 = getelementptr [10 x i32], [10 x i32]* %26, i32 0, i64 %27                  ; inst 41
  %29 = load i32, i32* %28                                                         ; inst 42
  call void @printlnInt(i32 %29)                                                   ; inst 43
  %30 = add i32 %24, 1                                                             ; inst 44
  br label %_4.while.cond.1                                                        ; inst 45
_6.while.exit.1:
  br label %_7.while.cond.2                                                        ; inst 46
_7.while.cond.2:
  %31 = phi i32 [0, %_6.while.exit.1], [%41, %_11.while.body.2]                    ; inst 47
  %32 = icmp slt i32 %31, 10                                                       ; inst 48
  br i1 %32, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 49
_8.lazy.then.0:
  %33 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 50
  %34 = load i32, i32* %33                                                         ; inst 51
  %35 = icmp slt i32 %31, %34                                                      ; inst 52
  br label %_10.lazy.exit.0                                                        ; inst 53
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 54
_10.lazy.exit.0:
  %36 = phi i1 [%35, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 55
  br i1 %36, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 56
_11.while.body.2:
  %37 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 5         ; inst 57
  %38 = sext i32 %31 to i64                                                        ; inst 58
  %39 = getelementptr [5000 x i32], [5000 x i32]* %37, i32 0, i64 %38              ; inst 59
  %40 = load i32, i32* %39                                                         ; inst 60
  call void @printlnInt(i32 %40)                                                   ; inst 61
  %41 = add i32 %31, 1                                                             ; inst 62
  br label %_7.while.cond.2                                                        ; inst 63
_12.while.exit.2:
  %42 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 64
  %43 = load i32, i32* %42                                                         ; inst 65
  %44 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 4         ; inst 66
  %45 = load i32, i32* %44                                                         ; inst 67
  %46 = add i32 %45, 1                                                             ; inst 68
  %47 = sdiv i32 %43, %46                                                          ; inst 69
  %48 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22        ; inst 70
  %49 = load i32, i32* %48                                                         ; inst 71
  %50 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 19        ; inst 72
  %51 = load i32, i32* %50                                                         ; inst 73
  %52 = mul i32 %49, %51                                                           ; inst 74
  %53 = sdiv i32 %52, 100                                                          ; inst 75
  %54 = add i32 %47, %53                                                           ; inst 76
  %55 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 25        ; inst 77
  %56 = getelementptr [10 x i32], [10 x i32]* %55, i32 0, i64 3                    ; inst 78
  %57 = load i32, i32* %56                                                         ; inst 79
  %58 = add i32 %54, %57                                                           ; inst 80
  call void @printlnInt(i32 %58)                                                   ; inst 81
  ret void                                                                         ; inst 82
}

define void @_jssiMt4YUJe_new(%RegexMatcher* sret(%RegexMatcher) %0) {
_0.entry.0:
  %1 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 0                ; inst 1
  %2 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, 100                                                        ; inst 5
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 7
  store i32 0, i32* %5                                                             ; inst 8
  %6 = add i32 %3, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %7 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 1                ; inst 11
  store i32 0, i32* %7                                                             ; inst 12
  %8 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 2                ; inst 13
  %9 = alloca [100 x i1]                                                           ; inst 14
  %10 = getelementptr [100 x i1], [100 x i1]* %9, i32 0, i32 0                     ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 17
  %12 = icmp slt i32 %11, 100                                                      ; inst 18
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %13 = getelementptr i1, i1* %10, i32 %11                                         ; inst 20
  store i1 0, i1* %13                                                              ; inst 21
  %14 = add i32 %11, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  %15 = getelementptr [100 x [100 x i1]], [100 x [100 x i1]]* %8, i32 0, i32 0     ; inst 24
  br label %_7.array.cond.2                                                        ; inst 25
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 26
  %17 = icmp slt i32 %16, 100                                                      ; inst 27
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 28
_8.array.body.2:
  %18 = getelementptr [100 x i1], [100 x i1]* %15, i32 %16                         ; inst 29
  call void @memcpy([100 x i1]* %18, [100 x i1]* %9, i64 100)                      ; inst 30
  %19 = add i32 %16, 1                                                             ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_9.array.exit.2:
  %20 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 3               ; inst 33
  store i32 0, i32* %20                                                            ; inst 34
  %21 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 4               ; inst 35
  store i1 0, i1* %21                                                              ; inst 36
  ret void                                                                         ; inst 37
}

define void @_jssiMt4YUJe_compile_pattern(%RegexMatcher* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 1                ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 0                ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %6                   ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  call void @_jssiMt4YUJe_build_nfa(%RegexMatcher* %0)                             ; inst 14
  ret void                                                                         ; inst 15
}

define void @_jssiMt4YUJe_build_nfa(%RegexMatcher* %0) {
_0.entry.0:
  %1 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 3                ; inst 1
  %2 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 1                ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  %4 = add i32 %3, 1                                                               ; inst 4
  store i32 %4, i32* %1                                                            ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%17, %_5.while.exit.1]                           ; inst 7
  %6 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 3                ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  %8 = icmp slt i32 %5, %7                                                         ; inst 10
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 11
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 12
_3.while.cond.1:
  %9 = phi i32 [0, %_2.while.body.0], [%16, %_4.while.body.1]                      ; inst 13
  %10 = icmp slt i32 %9, 100                                                       ; inst 14
  br i1 %10, label %_4.while.body.1, label %_5.while.exit.1                        ; inst 15
_4.while.body.1:
  %11 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 2               ; inst 16
  %12 = sext i32 %5 to i64                                                         ; inst 17
  %13 = getelementptr [100 x [100 x i1]], [100 x [100 x i1]]* %11, i32 0, i64 %12  ; inst 18
  %14 = sext i32 %9 to i64                                                         ; inst 19
  %15 = getelementptr [100 x i1], [100 x i1]* %13, i32 0, i64 %14                  ; inst 20
  store i1 0, i1* %15                                                              ; inst 21
  %16 = add i32 %9, 1                                                              ; inst 22
  br label %_3.while.cond.1                                                        ; inst 23
_5.while.exit.1:
  %17 = add i32 %5, 1                                                              ; inst 24
  br label %_1.while.cond.0                                                        ; inst 25
_6.while.exit.0:
  br label %_7.while.cond.2                                                        ; inst 26
_7.while.cond.2:
  %18 = phi i32 [0, %_6.while.exit.0], [%34, %_14.if.exit.0]                       ; inst 27
  %19 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 1               ; inst 28
  %20 = load i32, i32* %19                                                         ; inst 29
  %21 = icmp slt i32 %18, %20                                                      ; inst 30
  br i1 %21, label %_8.while.body.2, label %_15.while.exit.2                       ; inst 31
_8.while.body.2:
  %22 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 0               ; inst 32
  %23 = sext i32 %18 to i64                                                        ; inst 33
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 34
  %25 = load i32, i32* %24                                                         ; inst 35
  %26 = icmp sge i32 %25, 0                                                        ; inst 36
  br i1 %26, label %_9.lazy.then.0, label %_10.lazy.else.0                         ; inst 37
_9.lazy.then.0:
  %27 = icmp slt i32 %25, 100                                                      ; inst 38
  br label %_11.lazy.exit.0                                                        ; inst 39
_10.lazy.else.0:
  br label %_11.lazy.exit.0                                                        ; inst 40
_11.lazy.exit.0:
  %28 = phi i1 [%27, %_9.lazy.then.0], [0, %_10.lazy.else.0]                       ; inst 41
  br i1 %28, label %_12.if.then.0, label %_13.if.else.0                            ; inst 42
_12.if.then.0:
  %29 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 2               ; inst 43
  %30 = sext i32 %18 to i64                                                        ; inst 44
  %31 = getelementptr [100 x [100 x i1]], [100 x [100 x i1]]* %29, i32 0, i64 %30  ; inst 45
  %32 = sext i32 %25 to i64                                                        ; inst 46
  %33 = getelementptr [100 x i1], [100 x i1]* %31, i32 0, i64 %32                  ; inst 47
  store i1 1, i1* %33                                                              ; inst 48
  br label %_14.if.exit.0                                                          ; inst 49
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 50
_14.if.exit.0:
  %34 = add i32 %18, 1                                                             ; inst 51
  br label %_7.while.cond.2                                                        ; inst 52
_15.while.exit.2:
  ret void                                                                         ; inst 53
}

define i1 @_jssiMt4YUJe_match_text(%RegexMatcher* %0, [5000 x i32]* %1, i32 %2) {
_0.entry.0:
  %3 = alloca [100 x i1]                                                           ; inst 1
  %4 = getelementptr [100 x i1], [100 x i1]* %3, i32 0, i32 0                      ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 100                                                        ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i1, i1* %4, i32 %5                                            ; inst 7
  store i1 0, i1* %7                                                               ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %9 = alloca [100 x i1]                                                           ; inst 11
  %10 = getelementptr [100 x i1], [100 x i1]* %9, i32 0, i32 0                     ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 14
  %12 = icmp slt i32 %11, 100                                                      ; inst 15
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %13 = getelementptr i1, i1* %10, i32 %11                                         ; inst 17
  store i1 0, i1* %13                                                              ; inst 18
  %14 = add i32 %11, 1                                                             ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %15 = getelementptr [100 x i1], [100 x i1]* %3, i32 0, i64 0                     ; inst 21
  store i1 1, i1* %15                                                              ; inst 22
  br label %_7.while.cond.0                                                        ; inst 23
_7.while.cond.0:
  %16 = phi i32 [0, %_6.array.exit.1], [%59, %_32.while.exit.3]                    ; inst 24
  %17 = icmp slt i32 %16, %2                                                       ; inst 25
  br i1 %17, label %_8.while.body.0, label %_33.while.exit.0                       ; inst 26
_8.while.body.0:
  %18 = sext i32 %16 to i64                                                        ; inst 27
  %19 = getelementptr [5000 x i32], [5000 x i32]* %1, i32 0, i64 %18               ; inst 28
  %20 = load i32, i32* %19                                                         ; inst 29
  br label %_9.while.cond.1                                                        ; inst 30
_9.while.cond.1:
  %21 = phi i32 [0, %_8.while.body.0], [%25, %_10.while.body.1]                    ; inst 31
  %22 = icmp slt i32 %21, 100                                                      ; inst 32
  br i1 %22, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 33
_10.while.body.1:
  %23 = sext i32 %21 to i64                                                        ; inst 34
  %24 = getelementptr [100 x i1], [100 x i1]* %9, i32 0, i64 %23                   ; inst 35
  store i1 0, i1* %24                                                              ; inst 36
  %25 = add i32 %21, 1                                                             ; inst 37
  br label %_9.while.cond.1                                                        ; inst 38
_11.while.exit.1:
  br label %_12.while.cond.2                                                       ; inst 39
_12.while.cond.2:
  %26 = phi i32 [0, %_11.while.exit.1], [%50, %_28.if.exit.0]                      ; inst 40
  %27 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 3               ; inst 41
  %28 = load i32, i32* %27                                                         ; inst 42
  %29 = icmp slt i32 %26, %28                                                      ; inst 43
  br i1 %29, label %_13.while.body.2, label %_29.while.exit.2                      ; inst 44
_13.while.body.2:
  %30 = sext i32 %26 to i64                                                        ; inst 45
  %31 = getelementptr [100 x i1], [100 x i1]* %3, i32 0, i64 %30                   ; inst 46
  %32 = load i1, i1* %31                                                           ; inst 47
  br i1 %32, label %_14.if.then.0, label %_27.if.else.0                            ; inst 48
_14.if.then.0:
  %33 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 1               ; inst 49
  %34 = load i32, i32* %33                                                         ; inst 50
  %35 = icmp slt i32 %26, %34                                                      ; inst 51
  br i1 %35, label %_15.lazy.then.0, label %_16.lazy.else.0                        ; inst 52
_15.lazy.then.0:
  %36 = icmp sge i32 %20, 0                                                        ; inst 53
  br label %_17.lazy.exit.0                                                        ; inst 54
_16.lazy.else.0:
  br label %_17.lazy.exit.0                                                        ; inst 55
_17.lazy.exit.0:
  %37 = phi i1 [%36, %_15.lazy.then.0], [0, %_16.lazy.else.0]                      ; inst 56
  br i1 %37, label %_18.lazy.then.1, label %_19.lazy.else.1                        ; inst 57
_18.lazy.then.1:
  %38 = icmp slt i32 %20, 100                                                      ; inst 58
  br label %_20.lazy.exit.1                                                        ; inst 59
_19.lazy.else.1:
  br label %_20.lazy.exit.1                                                        ; inst 60
_20.lazy.exit.1:
  %39 = phi i1 [%38, %_18.lazy.then.1], [0, %_19.lazy.else.1]                      ; inst 61
  br i1 %39, label %_21.lazy.then.2, label %_22.lazy.else.2                        ; inst 62
_21.lazy.then.2:
  %40 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 2               ; inst 63
  %41 = sext i32 %26 to i64                                                        ; inst 64
  %42 = getelementptr [100 x [100 x i1]], [100 x [100 x i1]]* %40, i32 0, i64 %41  ; inst 65
  %43 = sext i32 %20 to i64                                                        ; inst 66
  %44 = getelementptr [100 x i1], [100 x i1]* %42, i32 0, i64 %43                  ; inst 67
  %45 = load i1, i1* %44                                                           ; inst 68
  br label %_23.lazy.exit.2                                                        ; inst 69
_22.lazy.else.2:
  br label %_23.lazy.exit.2                                                        ; inst 70
_23.lazy.exit.2:
  %46 = phi i1 [%45, %_21.lazy.then.2], [0, %_22.lazy.else.2]                      ; inst 71
  br i1 %46, label %_24.if.then.1, label %_25.if.else.1                            ; inst 72
_24.if.then.1:
  %47 = add i32 %26, 1                                                             ; inst 73
  %48 = sext i32 %47 to i64                                                        ; inst 74
  %49 = getelementptr [100 x i1], [100 x i1]* %9, i32 0, i64 %48                   ; inst 75
  store i1 1, i1* %49                                                              ; inst 76
  br label %_26.if.exit.1                                                          ; inst 77
_25.if.else.1:
  br label %_26.if.exit.1                                                          ; inst 78
_26.if.exit.1:
  br label %_28.if.exit.0                                                          ; inst 79
_27.if.else.0:
  br label %_28.if.exit.0                                                          ; inst 80
_28.if.exit.0:
  %50 = add i32 %26, 1                                                             ; inst 81
  br label %_12.while.cond.2                                                       ; inst 82
_29.while.exit.2:
  br label %_30.while.cond.3                                                       ; inst 83
_30.while.cond.3:
  %51 = phi i32 [0, %_29.while.exit.2], [%58, %_31.while.body.3]                   ; inst 84
  %52 = icmp slt i32 %51, 100                                                      ; inst 85
  br i1 %52, label %_31.while.body.3, label %_32.while.exit.3                      ; inst 86
_31.while.body.3:
  %53 = sext i32 %51 to i64                                                        ; inst 87
  %54 = getelementptr [100 x i1], [100 x i1]* %3, i32 0, i64 %53                   ; inst 88
  %55 = sext i32 %51 to i64                                                        ; inst 89
  %56 = getelementptr [100 x i1], [100 x i1]* %9, i32 0, i64 %55                   ; inst 90
  %57 = load i1, i1* %56                                                           ; inst 91
  store i1 %57, i1* %54                                                            ; inst 92
  %58 = add i32 %51, 1                                                             ; inst 93
  br label %_30.while.cond.3                                                       ; inst 94
_32.while.exit.3:
  %59 = add i32 %16, 1                                                             ; inst 95
  br label %_7.while.cond.0                                                        ; inst 96
_33.while.exit.0:
  %60 = getelementptr %RegexMatcher, %RegexMatcher* %0, i32 0, i32 1               ; inst 97
  %61 = load i32, i32* %60                                                         ; inst 98
  %62 = sext i32 %61 to i64                                                        ; inst 99
  %63 = getelementptr [100 x i1], [100 x i1]* %3, i32 0, i64 %62                   ; inst 100
  %64 = load i1, i1* %63                                                           ; inst 101
  ret i1 %64                                                                       ; inst 102
}

define void @main() {
_0.entry.0:
  %0 = alloca %StringProcessor                                                     ; inst 1
  call void @_14su0eKxQra_new(%StringProcessor* %0)                                ; inst 2
  %1 = call i32 @getInt()                                                          ; inst 3
  call void @_14su0eKxQra_initialize_text(%StringProcessor* %0, i32 %1)            ; inst 4
  %2 = call i32 @getInt()                                                          ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.while.body.0]                            ; inst 7
  %4 = icmp slt i32 %3, %2                                                         ; inst 8
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 9
_2.while.body.0:
  %5 = call i32 @getInt()                                                          ; inst 10
  call void @_14su0eKxQra_add_pattern(%StringProcessor* %0, i32 %5)                ; inst 11
  %6 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  call void @_14su0eKxQra_perform_comprehensive_analysis(%StringProcessor* %0)     ; inst 14
  %7 = call i32 @getInt()                                                          ; inst 15
  %8 = call i32 @getInt()                                                          ; inst 16
  %9 = call i32 @_14su0eKxQra_compute_edit_distance(%StringProcessor* %0, i32 %7, i32 %8) ; inst 17
  call void @printlnInt(i32 %9)                                                    ; inst 18
  %10 = alloca %RegexMatcher                                                       ; inst 19
  call void @_jssiMt4YUJe_new(%RegexMatcher* %10)                                  ; inst 20
  %11 = call i32 @getInt()                                                         ; inst 21
  call void @_jssiMt4YUJe_compile_pattern(%RegexMatcher* %10, i32 %11)             ; inst 22
  %12 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 23
  %13 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 24
  %14 = load i32, i32* %13                                                         ; inst 25
  %15 = call i1 @_jssiMt4YUJe_match_text(%RegexMatcher* %10, [5000 x i32]* %12, i32 %14) ; inst 26
  br i1 %15, label %_4.if.then.0, label %_5.if.else.0                              ; inst 27
_4.if.then.0:
  br label %_6.if.exit.0                                                           ; inst 28
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 29
_6.if.exit.0:
  %16 = phi i32 [1, %_4.if.then.0], [0, %_5.if.else.0]                             ; inst 30
  call void @printlnInt(i32 %16)                                                   ; inst 31
  call void @_14su0eKxQra_output_results(%StringProcessor* %0)                     ; inst 32
  %17 = call i32 @getInt()                                                         ; inst 33
  br label %_7.while.cond.1                                                        ; inst 34
_7.while.cond.1:
  %18 = phi i32 [0, %_6.if.exit.0], [%56, %_23.while.exit.2]                       ; inst 35
  %19 = phi i32 [0, %_6.if.exit.0], [%55, %_23.while.exit.2]                       ; inst 36
  %20 = icmp slt i32 %18, %17                                                      ; inst 37
  br i1 %20, label %_8.while.body.1, label %_24.while.exit.1                       ; inst 38
_8.while.body.1:
  %21 = mul i32 %18, 7                                                             ; inst 39
  %22 = add i32 %21, 3                                                             ; inst 40
  %23 = srem i32 %22, 26                                                           ; inst 41
  br label %_9.while.cond.2                                                        ; inst 42
_9.while.cond.2:
  %24 = phi i32 [0, %_8.while.body.1], [%52, %_22.if.exit.1]                       ; inst 43
  %25 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 1         ; inst 44
  %26 = load i32, i32* %25                                                         ; inst 45
  %27 = icmp slt i32 %24, %26                                                      ; inst 46
  br i1 %27, label %_10.while.body.2, label %_23.while.exit.2                      ; inst 47
_10.while.body.2:
  %28 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 48
  %29 = sext i32 %24 to i64                                                        ; inst 49
  %30 = getelementptr [5000 x i32], [5000 x i32]* %28, i32 0, i64 %29              ; inst 50
  %31 = load i32, i32* %30                                                         ; inst 51
  %32 = icmp sge i32 %31, 65                                                       ; inst 52
  br i1 %32, label %_11.lazy.then.0, label %_12.lazy.else.0                        ; inst 53
_11.lazy.then.0:
  %33 = icmp sle i32 %31, 90                                                       ; inst 54
  br label %_13.lazy.exit.0                                                        ; inst 55
_12.lazy.else.0:
  br label %_13.lazy.exit.0                                                        ; inst 56
_13.lazy.exit.0:
  %34 = phi i1 [%33, %_11.lazy.then.0], [0, %_12.lazy.else.0]                      ; inst 57
  br i1 %34, label %_14.if.then.1, label %_15.if.else.1                            ; inst 58
_14.if.then.1:
  %35 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 59
  %36 = sext i32 %24 to i64                                                        ; inst 60
  %37 = getelementptr [5000 x i32], [5000 x i32]* %35, i32 0, i64 %36              ; inst 61
  %38 = sub i32 %31, 65                                                            ; inst 62
  %39 = add i32 %38, %23                                                           ; inst 63
  %40 = srem i32 %39, 26                                                           ; inst 64
  %41 = add i32 %40, 65                                                            ; inst 65
  store i32 %41, i32* %37                                                          ; inst 66
  br label %_22.if.exit.1                                                          ; inst 67
_15.if.else.1:
  %42 = icmp sge i32 %31, 97                                                       ; inst 68
  br i1 %42, label %_16.lazy.then.1, label %_17.lazy.else.1                        ; inst 69
_16.lazy.then.1:
  %43 = icmp sle i32 %31, 122                                                      ; inst 70
  br label %_18.lazy.exit.1                                                        ; inst 71
_17.lazy.else.1:
  br label %_18.lazy.exit.1                                                        ; inst 72
_18.lazy.exit.1:
  %44 = phi i1 [%43, %_16.lazy.then.1], [0, %_17.lazy.else.1]                      ; inst 73
  br i1 %44, label %_19.if.then.2, label %_20.if.else.2                            ; inst 74
_19.if.then.2:
  %45 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 0         ; inst 75
  %46 = sext i32 %24 to i64                                                        ; inst 76
  %47 = getelementptr [5000 x i32], [5000 x i32]* %45, i32 0, i64 %46              ; inst 77
  %48 = sub i32 %31, 97                                                            ; inst 78
  %49 = add i32 %48, %23                                                           ; inst 79
  %50 = srem i32 %49, 26                                                           ; inst 80
  %51 = add i32 %50, 97                                                            ; inst 81
  store i32 %51, i32* %47                                                          ; inst 82
  br label %_21.if.exit.2                                                          ; inst 83
_20.if.else.2:
  br label %_21.if.exit.2                                                          ; inst 84
_21.if.exit.2:
  br label %_22.if.exit.1                                                          ; inst 85
_22.if.exit.1:
  %52 = add i32 %24, 1                                                             ; inst 86
  br label %_9.while.cond.2                                                        ; inst 87
_23.while.exit.2:
  call void @_14su0eKxQra_analyze_text_statistics(%StringProcessor* %0)            ; inst 88
  %53 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22        ; inst 89
  %54 = load i32, i32* %53                                                         ; inst 90
  %55 = add i32 %19, %54                                                           ; inst 91
  %56 = add i32 %18, 1                                                             ; inst 92
  br label %_7.while.cond.1                                                        ; inst 93
_24.while.exit.1:
  call void @printlnInt(i32 %19)                                                   ; inst 94
  %57 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 26        ; inst 95
  %58 = load i32, i32* %57                                                         ; inst 96
  %59 = add i32 %58, %19                                                           ; inst 97
  %60 = getelementptr %StringProcessor, %StringProcessor* %0, i32 0, i32 22        ; inst 98
  %61 = load i32, i32* %60                                                         ; inst 99
  %62 = mul i32 %59, %61                                                           ; inst 100
  %63 = sdiv i32 %62, 100                                                          ; inst 101
  call void @printlnInt(i32 %63)                                                   ; inst 102
  call void @exit(i32 0)                                                           ; inst 103
  ret void                                                                         ; inst 104
}

