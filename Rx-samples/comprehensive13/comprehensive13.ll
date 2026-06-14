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


%MathEngine = type { [100 x [100 x i32]], [100 x [100 x i32]], [100 x [100 x i32]], i32, [200 x i32], i32, [50 x i32], i32, [1000 x i32], i32, [10 x i32], [512 x i32], [512 x i32], i32, [1000 x i32], i32, [100 x [20 x i32]], [2000 x i32], i32, [10 x i32], [100 x i32], [50 x i32], i32 }

define void @_3MoxJ9jWv8O_new(%MathEngine* sret(%MathEngine) %0) {
_0.entry.0:
  %1 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                    ; inst 1
  %2 = alloca [100 x i32]                                                          ; inst 2
  %3 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 100                                                        ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %8 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i32 0    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 14
  %10 = icmp slt i32 %9, 100                                                       ; inst 15
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %11 = getelementptr [100 x i32], [100 x i32]* %8, i32 %9                         ; inst 17
  call void @memcpy([100 x i32]* %11, [100 x i32]* %2, i64 400)                    ; inst 18
  %12 = add i32 %9, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  %13 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 1                   ; inst 21
  %14 = alloca [100 x i32]                                                         ; inst 22
  %15 = getelementptr [100 x i32], [100 x i32]* %14, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 25
  %17 = icmp slt i32 %16, 100                                                      ; inst 26
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 28
  store i32 0, i32* %18                                                            ; inst 29
  %19 = add i32 %16, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %20 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %13, i32 0, i32 0  ; inst 32
  br label %_10.array.cond.3                                                       ; inst 33
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 34
  %22 = icmp slt i32 %21, 100                                                      ; inst 35
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 36
_11.array.body.3:
  %23 = getelementptr [100 x i32], [100 x i32]* %20, i32 %21                       ; inst 37
  call void @memcpy([100 x i32]* %23, [100 x i32]* %14, i64 400)                   ; inst 38
  %24 = add i32 %21, 1                                                             ; inst 39
  br label %_10.array.cond.3                                                       ; inst 40
_12.array.exit.3:
  %25 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 2                   ; inst 41
  %26 = alloca [100 x i32]                                                         ; inst 42
  %27 = getelementptr [100 x i32], [100 x i32]* %26, i32 0, i32 0                  ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %28 = phi i32 [0, %_12.array.exit.3], [%31, %_14.array.body.4]                   ; inst 45
  %29 = icmp slt i32 %28, 100                                                      ; inst 46
  br i1 %29, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %30 = getelementptr i32, i32* %27, i32 %28                                       ; inst 48
  store i32 0, i32* %30                                                            ; inst 49
  %31 = add i32 %28, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %32 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %25, i32 0, i32 0  ; inst 52
  br label %_16.array.cond.5                                                       ; inst 53
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 54
  %34 = icmp slt i32 %33, 100                                                      ; inst 55
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 56
_17.array.body.5:
  %35 = getelementptr [100 x i32], [100 x i32]* %32, i32 %33                       ; inst 57
  call void @memcpy([100 x i32]* %35, [100 x i32]* %26, i64 400)                   ; inst 58
  %36 = add i32 %33, 1                                                             ; inst 59
  br label %_16.array.cond.5                                                       ; inst 60
_18.array.exit.5:
  %37 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 61
  store i32 0, i32* %37                                                            ; inst 62
  %38 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 4                   ; inst 63
  %39 = getelementptr [200 x i32], [200 x i32]* %38, i32 0, i32 0                  ; inst 64
  br label %_19.array.cond.6                                                       ; inst 65
_19.array.cond.6:
  %40 = phi i32 [0, %_18.array.exit.5], [%43, %_20.array.body.6]                   ; inst 66
  %41 = icmp slt i32 %40, 200                                                      ; inst 67
  br i1 %41, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 68
_20.array.body.6:
  %42 = getelementptr i32, i32* %39, i32 %40                                       ; inst 69
  store i32 0, i32* %42                                                            ; inst 70
  %43 = add i32 %40, 1                                                             ; inst 71
  br label %_19.array.cond.6                                                       ; inst 72
_21.array.exit.6:
  %44 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 5                   ; inst 73
  store i32 0, i32* %44                                                            ; inst 74
  %45 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 6                   ; inst 75
  %46 = getelementptr [50 x i32], [50 x i32]* %45, i32 0, i32 0                    ; inst 76
  br label %_22.array.cond.7                                                       ; inst 77
_22.array.cond.7:
  %47 = phi i32 [0, %_21.array.exit.6], [%50, %_23.array.body.7]                   ; inst 78
  %48 = icmp slt i32 %47, 50                                                       ; inst 79
  br i1 %48, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 80
_23.array.body.7:
  %49 = getelementptr i32, i32* %46, i32 %47                                       ; inst 81
  store i32 0, i32* %49                                                            ; inst 82
  %50 = add i32 %47, 1                                                             ; inst 83
  br label %_22.array.cond.7                                                       ; inst 84
_24.array.exit.7:
  %51 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                   ; inst 85
  store i32 0, i32* %51                                                            ; inst 86
  %52 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                   ; inst 87
  %53 = getelementptr [1000 x i32], [1000 x i32]* %52, i32 0, i32 0                ; inst 88
  br label %_25.array.cond.8                                                       ; inst 89
_25.array.cond.8:
  %54 = phi i32 [0, %_24.array.exit.7], [%57, %_26.array.body.8]                   ; inst 90
  %55 = icmp slt i32 %54, 1000                                                     ; inst 91
  br i1 %55, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 92
_26.array.body.8:
  %56 = getelementptr i32, i32* %53, i32 %54                                       ; inst 93
  store i32 0, i32* %56                                                            ; inst 94
  %57 = add i32 %54, 1                                                             ; inst 95
  br label %_25.array.cond.8                                                       ; inst 96
_27.array.exit.8:
  %58 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 9                   ; inst 97
  store i32 0, i32* %58                                                            ; inst 98
  %59 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 10                  ; inst 99
  %60 = getelementptr [10 x i32], [10 x i32]* %59, i32 0, i32 0                    ; inst 100
  br label %_28.array.cond.9                                                       ; inst 101
_28.array.cond.9:
  %61 = phi i32 [0, %_27.array.exit.8], [%64, %_29.array.body.9]                   ; inst 102
  %62 = icmp slt i32 %61, 10                                                       ; inst 103
  br i1 %62, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 104
_29.array.body.9:
  %63 = getelementptr i32, i32* %60, i32 %61                                       ; inst 105
  store i32 0, i32* %63                                                            ; inst 106
  %64 = add i32 %61, 1                                                             ; inst 107
  br label %_28.array.cond.9                                                       ; inst 108
_30.array.exit.9:
  %65 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 109
  %66 = getelementptr [512 x i32], [512 x i32]* %65, i32 0, i32 0                  ; inst 110
  br label %_31.array.cond.10                                                      ; inst 111
_31.array.cond.10:
  %67 = phi i32 [0, %_30.array.exit.9], [%70, %_32.array.body.10]                  ; inst 112
  %68 = icmp slt i32 %67, 512                                                      ; inst 113
  br i1 %68, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 114
_32.array.body.10:
  %69 = getelementptr i32, i32* %66, i32 %67                                       ; inst 115
  store i32 0, i32* %69                                                            ; inst 116
  %70 = add i32 %67, 1                                                             ; inst 117
  br label %_31.array.cond.10                                                      ; inst 118
_33.array.exit.10:
  %71 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 119
  %72 = getelementptr [512 x i32], [512 x i32]* %71, i32 0, i32 0                  ; inst 120
  br label %_34.array.cond.11                                                      ; inst 121
_34.array.cond.11:
  %73 = phi i32 [0, %_33.array.exit.10], [%76, %_35.array.body.11]                 ; inst 122
  %74 = icmp slt i32 %73, 512                                                      ; inst 123
  br i1 %74, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 124
_35.array.body.11:
  %75 = getelementptr i32, i32* %72, i32 %73                                       ; inst 125
  store i32 0, i32* %75                                                            ; inst 126
  %76 = add i32 %73, 1                                                             ; inst 127
  br label %_34.array.cond.11                                                      ; inst 128
_36.array.exit.11:
  %77 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 13                  ; inst 129
  store i32 0, i32* %77                                                            ; inst 130
  %78 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                  ; inst 131
  %79 = getelementptr [1000 x i32], [1000 x i32]* %78, i32 0, i32 0                ; inst 132
  br label %_37.array.cond.12                                                      ; inst 133
_37.array.cond.12:
  %80 = phi i32 [0, %_36.array.exit.11], [%83, %_38.array.body.12]                 ; inst 134
  %81 = icmp slt i32 %80, 1000                                                     ; inst 135
  br i1 %81, label %_38.array.body.12, label %_39.array.exit.12                    ; inst 136
_38.array.body.12:
  %82 = getelementptr i32, i32* %79, i32 %80                                       ; inst 137
  store i32 0, i32* %82                                                            ; inst 138
  %83 = add i32 %80, 1                                                             ; inst 139
  br label %_37.array.cond.12                                                      ; inst 140
_39.array.exit.12:
  %84 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 141
  store i32 0, i32* %84                                                            ; inst 142
  %85 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 16                  ; inst 143
  %86 = alloca [20 x i32]                                                          ; inst 144
  %87 = getelementptr [20 x i32], [20 x i32]* %86, i32 0, i32 0                    ; inst 145
  br label %_40.array.cond.13                                                      ; inst 146
_40.array.cond.13:
  %88 = phi i32 [0, %_39.array.exit.12], [%91, %_41.array.body.13]                 ; inst 147
  %89 = icmp slt i32 %88, 20                                                       ; inst 148
  br i1 %89, label %_41.array.body.13, label %_42.array.exit.13                    ; inst 149
_41.array.body.13:
  %90 = getelementptr i32, i32* %87, i32 %88                                       ; inst 150
  store i32 0, i32* %90                                                            ; inst 151
  %91 = add i32 %88, 1                                                             ; inst 152
  br label %_40.array.cond.13                                                      ; inst 153
_42.array.exit.13:
  %92 = getelementptr [100 x [20 x i32]], [100 x [20 x i32]]* %85, i32 0, i32 0    ; inst 154
  br label %_43.array.cond.14                                                      ; inst 155
_43.array.cond.14:
  %93 = phi i32 [0, %_42.array.exit.13], [%96, %_44.array.body.14]                 ; inst 156
  %94 = icmp slt i32 %93, 100                                                      ; inst 157
  br i1 %94, label %_44.array.body.14, label %_45.array.exit.14                    ; inst 158
_44.array.body.14:
  %95 = getelementptr [20 x i32], [20 x i32]* %92, i32 %93                         ; inst 159
  call void @memcpy([20 x i32]* %95, [20 x i32]* %86, i64 80)                      ; inst 160
  %96 = add i32 %93, 1                                                             ; inst 161
  br label %_43.array.cond.14                                                      ; inst 162
_45.array.exit.14:
  %97 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 163
  %98 = getelementptr [2000 x i32], [2000 x i32]* %97, i32 0, i32 0                ; inst 164
  br label %_46.array.cond.15                                                      ; inst 165
_46.array.cond.15:
  %99 = phi i32 [0, %_45.array.exit.14], [%102, %_47.array.body.15]                ; inst 166
  %100 = icmp slt i32 %99, 2000                                                    ; inst 167
  br i1 %100, label %_47.array.body.15, label %_48.array.exit.15                   ; inst 168
_47.array.body.15:
  %101 = getelementptr i32, i32* %98, i32 %99                                      ; inst 169
  store i32 0, i32* %101                                                           ; inst 170
  %102 = add i32 %99, 1                                                            ; inst 171
  br label %_46.array.cond.15                                                      ; inst 172
_48.array.exit.15:
  %103 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                 ; inst 173
  store i32 0, i32* %103                                                           ; inst 174
  %104 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                 ; inst 175
  %105 = getelementptr [10 x i32], [10 x i32]* %104, i32 0, i32 0                  ; inst 176
  br label %_49.array.cond.16                                                      ; inst 177
_49.array.cond.16:
  %106 = phi i32 [0, %_48.array.exit.15], [%109, %_50.array.body.16]               ; inst 178
  %107 = icmp slt i32 %106, 10                                                     ; inst 179
  br i1 %107, label %_50.array.body.16, label %_51.array.exit.16                   ; inst 180
_50.array.body.16:
  %108 = getelementptr i32, i32* %105, i32 %106                                    ; inst 181
  store i32 0, i32* %108                                                           ; inst 182
  %109 = add i32 %106, 1                                                           ; inst 183
  br label %_49.array.cond.16                                                      ; inst 184
_51.array.exit.16:
  %110 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 20                 ; inst 185
  %111 = getelementptr [100 x i32], [100 x i32]* %110, i32 0, i32 0                ; inst 186
  br label %_52.array.cond.17                                                      ; inst 187
_52.array.cond.17:
  %112 = phi i32 [0, %_51.array.exit.16], [%115, %_53.array.body.17]               ; inst 188
  %113 = icmp slt i32 %112, 100                                                    ; inst 189
  br i1 %113, label %_53.array.body.17, label %_54.array.exit.17                   ; inst 190
_53.array.body.17:
  %114 = getelementptr i32, i32* %111, i32 %112                                    ; inst 191
  store i32 0, i32* %114                                                           ; inst 192
  %115 = add i32 %112, 1                                                           ; inst 193
  br label %_52.array.cond.17                                                      ; inst 194
_54.array.exit.17:
  %116 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                 ; inst 195
  %117 = getelementptr [50 x i32], [50 x i32]* %116, i32 0, i32 0                  ; inst 196
  br label %_55.array.cond.18                                                      ; inst 197
_55.array.cond.18:
  %118 = phi i32 [0, %_54.array.exit.17], [%121, %_56.array.body.18]               ; inst 198
  %119 = icmp slt i32 %118, 50                                                     ; inst 199
  br i1 %119, label %_56.array.body.18, label %_57.array.exit.18                   ; inst 200
_56.array.body.18:
  %120 = getelementptr i32, i32* %117, i32 %118                                    ; inst 201
  store i32 0, i32* %120                                                           ; inst 202
  %121 = add i32 %118, 1                                                           ; inst 203
  br label %_55.array.cond.18                                                      ; inst 204
_57.array.exit.18:
  %122 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                 ; inst 205
  store i32 0, i32* %122                                                           ; inst 206
  ret void                                                                         ; inst 207
}

define void @_3MoxJ9jWv8O_initialize_matrices(%MathEngine* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                    ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%14, %_5.while.exit.1]                           ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%13, %_4.while.body.1]                      ; inst 8
  %6 = icmp slt i32 %5, %1                                                         ; inst 9
  br i1 %6, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 10
_4.while.body.1:
  %7 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                    ; inst 11
  %8 = sext i32 %3 to i64                                                          ; inst 12
  %9 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %7, i32 0, i64 %8   ; inst 13
  %10 = sext i32 %5 to i64                                                         ; inst 14
  %11 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %10                 ; inst 15
  %12 = call i32 @getInt()                                                         ; inst 16
  store i32 %12, i32* %11                                                          ; inst 17
  %13 = add i32 %5, 1                                                              ; inst 18
  br label %_3.while.cond.1                                                        ; inst 19
_5.while.exit.1:
  %14 = add i32 %3, 1                                                              ; inst 20
  br label %_1.while.cond.0                                                        ; inst 21
_6.while.exit.0:
  br label %_7.while.cond.2                                                        ; inst 22
_7.while.cond.2:
  %15 = phi i32 [0, %_6.while.exit.0], [%26, %_11.while.exit.3]                    ; inst 23
  %16 = icmp slt i32 %15, %1                                                       ; inst 24
  br i1 %16, label %_8.while.body.2, label %_12.while.exit.2                       ; inst 25
_8.while.body.2:
  br label %_9.while.cond.3                                                        ; inst 26
_9.while.cond.3:
  %17 = phi i32 [0, %_8.while.body.2], [%25, %_10.while.body.3]                    ; inst 27
  %18 = icmp slt i32 %17, %1                                                       ; inst 28
  br i1 %18, label %_10.while.body.3, label %_11.while.exit.3                      ; inst 29
_10.while.body.3:
  %19 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 1                   ; inst 30
  %20 = sext i32 %15 to i64                                                        ; inst 31
  %21 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %19, i32 0, i64 %20 ; inst 32
  %22 = sext i32 %17 to i64                                                        ; inst 33
  %23 = getelementptr [100 x i32], [100 x i32]* %21, i32 0, i64 %22                ; inst 34
  %24 = call i32 @getInt()                                                         ; inst 35
  store i32 %24, i32* %23                                                          ; inst 36
  %25 = add i32 %17, 1                                                             ; inst 37
  br label %_9.while.cond.3                                                        ; inst 38
_11.while.exit.3:
  %26 = add i32 %15, 1                                                             ; inst 39
  br label %_7.while.cond.2                                                        ; inst 40
_12.while.exit.2:
  ret void                                                                         ; inst 41
}

define void @_3MoxJ9jWv8O_matrix_multiply(%MathEngine* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%40, %_8.while.exit.1]                           ; inst 2
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                    ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 7
_3.while.cond.1:
  %5 = phi i32 [0, %_2.while.body.0], [%39, %_7.while.exit.2]                      ; inst 8
  %6 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                    ; inst 9
  %7 = load i32, i32* %6                                                           ; inst 10
  %8 = icmp slt i32 %5, %7                                                         ; inst 11
  br i1 %8, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 12
_4.while.body.1:
  %9 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 2                    ; inst 13
  %10 = sext i32 %1 to i64                                                         ; inst 14
  %11 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %9, i32 0, i64 %10 ; inst 15
  %12 = sext i32 %5 to i64                                                         ; inst 16
  %13 = getelementptr [100 x i32], [100 x i32]* %11, i32 0, i64 %12                ; inst 17
  store i32 0, i32* %13                                                            ; inst 18
  br label %_5.while.cond.2                                                        ; inst 19
_5.while.cond.2:
  %14 = phi i32 [0, %_4.while.body.1], [%38, %_6.while.body.2]                     ; inst 20
  %15 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 21
  %16 = load i32, i32* %15                                                         ; inst 22
  %17 = icmp slt i32 %14, %16                                                      ; inst 23
  br i1 %17, label %_6.while.body.2, label %_7.while.exit.2                        ; inst 24
_6.while.body.2:
  %18 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 2                   ; inst 25
  %19 = sext i32 %1 to i64                                                         ; inst 26
  %20 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %18, i32 0, i64 %19 ; inst 27
  %21 = sext i32 %5 to i64                                                         ; inst 28
  %22 = getelementptr [100 x i32], [100 x i32]* %20, i32 0, i64 %21                ; inst 29
  %23 = load i32, i32* %22                                                         ; inst 30
  %24 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                   ; inst 31
  %25 = sext i32 %1 to i64                                                         ; inst 32
  %26 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %24, i32 0, i64 %25 ; inst 33
  %27 = sext i32 %14 to i64                                                        ; inst 34
  %28 = getelementptr [100 x i32], [100 x i32]* %26, i32 0, i64 %27                ; inst 35
  %29 = load i32, i32* %28                                                         ; inst 36
  %30 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 1                   ; inst 37
  %31 = sext i32 %14 to i64                                                        ; inst 38
  %32 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %30, i32 0, i64 %31 ; inst 39
  %33 = sext i32 %5 to i64                                                         ; inst 40
  %34 = getelementptr [100 x i32], [100 x i32]* %32, i32 0, i64 %33                ; inst 41
  %35 = load i32, i32* %34                                                         ; inst 42
  %36 = mul i32 %29, %35                                                           ; inst 43
  %37 = add i32 %23, %36                                                           ; inst 44
  store i32 %37, i32* %22                                                          ; inst 45
  %38 = add i32 %14, 1                                                             ; inst 46
  br label %_5.while.cond.2                                                        ; inst 47
_7.while.exit.2:
  %39 = add i32 %5, 1                                                              ; inst 48
  br label %_3.while.cond.1                                                        ; inst 49
_8.while.exit.1:
  %40 = add i32 %1, 1                                                              ; inst 50
  br label %_1.while.cond.0                                                        ; inst 51
_9.while.exit.0:
  ret void                                                                         ; inst 52
}

define i32 @_3MoxJ9jWv8O_calculate_determinant(%MathEngine* %0) {
_0.entry.0:
  %1 = alloca [100 x [100 x i32]]                                                  ; inst 1
  %2 = alloca [100 x i32]                                                          ; inst 2
  %3 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 5
  %5 = icmp slt i32 %4, 100                                                        ; inst 6
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 8
  store i32 0, i32* %6                                                             ; inst 9
  %7 = add i32 %4, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %8 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i32 0    ; inst 12
  br label %_4.array.cond.1                                                        ; inst 13
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 14
  %10 = icmp slt i32 %9, 100                                                       ; inst 15
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 16
_5.array.body.1:
  %11 = getelementptr [100 x i32], [100 x i32]* %8, i32 %9                         ; inst 17
  call void @memcpy([100 x i32]* %11, [100 x i32]* %2, i64 400)                    ; inst 18
  %12 = add i32 %9, 1                                                              ; inst 19
  br label %_4.array.cond.1                                                        ; inst 20
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 21
_7.while.cond.0:
  %13 = phi i32 [0, %_6.array.exit.1], [%32, %_11.while.exit.1]                    ; inst 22
  %14 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 23
  %15 = load i32, i32* %14                                                         ; inst 24
  %16 = icmp slt i32 %13, %15                                                      ; inst 25
  br i1 %16, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 26
_8.while.body.0:
  br label %_9.while.cond.1                                                        ; inst 27
_9.while.cond.1:
  %17 = phi i32 [0, %_8.while.body.0], [%31, %_10.while.body.1]                    ; inst 28
  %18 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 29
  %19 = load i32, i32* %18                                                         ; inst 30
  %20 = icmp slt i32 %17, %19                                                      ; inst 31
  br i1 %20, label %_10.while.body.1, label %_11.while.exit.1                      ; inst 32
_10.while.body.1:
  %21 = sext i32 %13 to i64                                                        ; inst 33
  %22 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %21 ; inst 34
  %23 = sext i32 %17 to i64                                                        ; inst 35
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 36
  %25 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                   ; inst 37
  %26 = sext i32 %13 to i64                                                        ; inst 38
  %27 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %25, i32 0, i64 %26 ; inst 39
  %28 = sext i32 %17 to i64                                                        ; inst 40
  %29 = getelementptr [100 x i32], [100 x i32]* %27, i32 0, i64 %28                ; inst 41
  %30 = load i32, i32* %29                                                         ; inst 42
  store i32 %30, i32* %24                                                          ; inst 43
  %31 = add i32 %17, 1                                                             ; inst 44
  br label %_9.while.cond.1                                                        ; inst 45
_11.while.exit.1:
  %32 = add i32 %13, 1                                                             ; inst 46
  br label %_7.while.cond.0                                                        ; inst 47
_12.while.exit.0:
  br label %_13.while.cond.2                                                       ; inst 48
_13.while.cond.2:
  %33 = phi i32 [1, %_12.while.exit.0], [%111, %_41.while.exit.5]                  ; inst 49
  %34 = phi i32 [0, %_12.while.exit.0], [%152, %_41.while.exit.5]                  ; inst 50
  %35 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 51
  %36 = load i32, i32* %35                                                         ; inst 52
  %37 = sub i32 %36, 1                                                             ; inst 53
  %38 = icmp slt i32 %34, %37                                                      ; inst 54
  br i1 %38, label %_14.while.body.2, label %_42.while.exit.2                      ; inst 55
_14.while.body.2:
  %39 = sext i32 %34 to i64                                                        ; inst 56
  %40 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %39 ; inst 57
  %41 = sext i32 %34 to i64                                                        ; inst 58
  %42 = getelementptr [100 x i32], [100 x i32]* %40, i32 0, i64 %41                ; inst 59
  %43 = load i32, i32* %42                                                         ; inst 60
  %44 = icmp slt i32 %43, 0                                                        ; inst 61
  br i1 %44, label %_15.if.then.0, label %_16.if.else.0                            ; inst 62
_15.if.then.0:
  %45 = sext i32 %34 to i64                                                        ; inst 63
  %46 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %45 ; inst 64
  %47 = sext i32 %34 to i64                                                        ; inst 65
  %48 = getelementptr [100 x i32], [100 x i32]* %46, i32 0, i64 %47                ; inst 66
  %49 = load i32, i32* %48                                                         ; inst 67
  %50 = sub i32 0, %49                                                             ; inst 68
  br label %_17.if.exit.0                                                          ; inst 69
_16.if.else.0:
  %51 = sext i32 %34 to i64                                                        ; inst 70
  %52 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %51 ; inst 71
  %53 = sext i32 %34 to i64                                                        ; inst 72
  %54 = getelementptr [100 x i32], [100 x i32]* %52, i32 0, i64 %53                ; inst 73
  %55 = load i32, i32* %54                                                         ; inst 74
  br label %_17.if.exit.0                                                          ; inst 75
_17.if.exit.0:
  %56 = phi i32 [%50, %_15.if.then.0], [%55, %_16.if.else.0]                       ; inst 76
  %57 = add i32 %34, 1                                                             ; inst 77
  br label %_18.while.cond.3                                                       ; inst 78
_18.while.cond.3:
  %58 = phi i32 [%57, %_17.if.exit.0], [%85, %_25.if.exit.2]                       ; inst 79
  %59 = phi i32 [%56, %_17.if.exit.0], [%83, %_25.if.exit.2]                       ; inst 80
  %60 = phi i32 [%34, %_17.if.exit.0], [%84, %_25.if.exit.2]                       ; inst 81
  %61 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 82
  %62 = load i32, i32* %61                                                         ; inst 83
  %63 = icmp slt i32 %58, %62                                                      ; inst 84
  br i1 %63, label %_19.while.body.3, label %_26.while.exit.3                      ; inst 85
_19.while.body.3:
  %64 = sext i32 %58 to i64                                                        ; inst 86
  %65 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %64 ; inst 87
  %66 = sext i32 %34 to i64                                                        ; inst 88
  %67 = getelementptr [100 x i32], [100 x i32]* %65, i32 0, i64 %66                ; inst 89
  %68 = load i32, i32* %67                                                         ; inst 90
  %69 = icmp slt i32 %68, 0                                                        ; inst 91
  br i1 %69, label %_20.if.then.1, label %_21.if.else.1                            ; inst 92
_20.if.then.1:
  %70 = sext i32 %58 to i64                                                        ; inst 93
  %71 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %70 ; inst 94
  %72 = sext i32 %34 to i64                                                        ; inst 95
  %73 = getelementptr [100 x i32], [100 x i32]* %71, i32 0, i64 %72                ; inst 96
  %74 = load i32, i32* %73                                                         ; inst 97
  %75 = sub i32 0, %74                                                             ; inst 98
  br label %_22.if.exit.1                                                          ; inst 99
_21.if.else.1:
  %76 = sext i32 %58 to i64                                                        ; inst 100
  %77 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %76 ; inst 101
  %78 = sext i32 %34 to i64                                                        ; inst 102
  %79 = getelementptr [100 x i32], [100 x i32]* %77, i32 0, i64 %78                ; inst 103
  %80 = load i32, i32* %79                                                         ; inst 104
  br label %_22.if.exit.1                                                          ; inst 105
_22.if.exit.1:
  %81 = phi i32 [%75, %_20.if.then.1], [%80, %_21.if.else.1]                       ; inst 106
  %82 = icmp sgt i32 %81, %59                                                      ; inst 107
  br i1 %82, label %_23.if.then.2, label %_24.if.else.2                            ; inst 108
_23.if.then.2:
  br label %_25.if.exit.2                                                          ; inst 109
_24.if.else.2:
  br label %_25.if.exit.2                                                          ; inst 110
_25.if.exit.2:
  %83 = phi i32 [%81, %_23.if.then.2], [%59, %_24.if.else.2]                       ; inst 111
  %84 = phi i32 [%58, %_23.if.then.2], [%60, %_24.if.else.2]                       ; inst 112
  %85 = add i32 %58, 1                                                             ; inst 113
  br label %_18.while.cond.3                                                       ; inst 114
_26.while.exit.3:
  %86 = icmp ne i32 %60, %34                                                       ; inst 115
  br i1 %86, label %_27.if.then.3, label %_31.if.else.3                            ; inst 116
_27.if.then.3:
  br label %_28.while.cond.4                                                       ; inst 117
_28.while.cond.4:
  %87 = phi i32 [0, %_27.if.then.3], [%109, %_29.while.body.4]                     ; inst 118
  %88 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 119
  %89 = load i32, i32* %88                                                         ; inst 120
  %90 = icmp slt i32 %87, %89                                                      ; inst 121
  br i1 %90, label %_29.while.body.4, label %_30.while.exit.4                      ; inst 122
_29.while.body.4:
  %91 = sext i32 %34 to i64                                                        ; inst 123
  %92 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %91 ; inst 124
  %93 = sext i32 %87 to i64                                                        ; inst 125
  %94 = getelementptr [100 x i32], [100 x i32]* %92, i32 0, i64 %93                ; inst 126
  %95 = load i32, i32* %94                                                         ; inst 127
  %96 = sext i32 %34 to i64                                                        ; inst 128
  %97 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %96 ; inst 129
  %98 = sext i32 %87 to i64                                                        ; inst 130
  %99 = getelementptr [100 x i32], [100 x i32]* %97, i32 0, i64 %98                ; inst 131
  %100 = sext i32 %60 to i64                                                       ; inst 132
  %101 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %100 ; inst 133
  %102 = sext i32 %87 to i64                                                       ; inst 134
  %103 = getelementptr [100 x i32], [100 x i32]* %101, i32 0, i64 %102             ; inst 135
  %104 = load i32, i32* %103                                                       ; inst 136
  store i32 %104, i32* %99                                                         ; inst 137
  %105 = sext i32 %60 to i64                                                       ; inst 138
  %106 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %105 ; inst 139
  %107 = sext i32 %87 to i64                                                       ; inst 140
  %108 = getelementptr [100 x i32], [100 x i32]* %106, i32 0, i64 %107             ; inst 141
  store i32 %95, i32* %108                                                         ; inst 142
  %109 = add i32 %87, 1                                                            ; inst 143
  br label %_28.while.cond.4                                                       ; inst 144
_30.while.exit.4:
  %110 = sub i32 0, %33                                                            ; inst 145
  br label %_32.if.exit.3                                                          ; inst 146
_31.if.else.3:
  br label %_32.if.exit.3                                                          ; inst 147
_32.if.exit.3:
  %111 = phi i32 [%110, %_30.while.exit.4], [%33, %_31.if.else.3]                  ; inst 148
  %112 = sext i32 %34 to i64                                                       ; inst 149
  %113 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %112 ; inst 150
  %114 = sext i32 %34 to i64                                                       ; inst 151
  %115 = getelementptr [100 x i32], [100 x i32]* %113, i32 0, i64 %114             ; inst 152
  %116 = load i32, i32* %115                                                       ; inst 153
  %117 = icmp eq i32 %116, 0                                                       ; inst 154
  br i1 %117, label %_33.if.then.4, label %_34.if.else.4                           ; inst 155
_33.if.then.4:
  ret i32 0                                                                        ; inst 156
_34.if.else.4:
  br label %_35.if.exit.4                                                          ; inst 157
_35.if.exit.4:
  %118 = add i32 %34, 1                                                            ; inst 158
  br label %_36.while.cond.5                                                       ; inst 159
_36.while.cond.5:
  %119 = phi i32 [%118, %_35.if.exit.4], [%151, %_40.while.exit.6]                 ; inst 160
  %120 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                  ; inst 161
  %121 = load i32, i32* %120                                                       ; inst 162
  %122 = icmp slt i32 %119, %121                                                   ; inst 163
  br i1 %122, label %_37.while.body.5, label %_41.while.exit.5                     ; inst 164
_37.while.body.5:
  %123 = sext i32 %119 to i64                                                      ; inst 165
  %124 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %123 ; inst 166
  %125 = sext i32 %34 to i64                                                       ; inst 167
  %126 = getelementptr [100 x i32], [100 x i32]* %124, i32 0, i64 %125             ; inst 168
  %127 = load i32, i32* %126                                                       ; inst 169
  %128 = sext i32 %34 to i64                                                       ; inst 170
  %129 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %128 ; inst 171
  %130 = sext i32 %34 to i64                                                       ; inst 172
  %131 = getelementptr [100 x i32], [100 x i32]* %129, i32 0, i64 %130             ; inst 173
  %132 = load i32, i32* %131                                                       ; inst 174
  %133 = sdiv i32 %127, %132                                                       ; inst 175
  br label %_38.while.cond.6                                                       ; inst 176
_38.while.cond.6:
  %134 = phi i32 [%34, %_37.while.body.5], [%150, %_39.while.body.6]               ; inst 177
  %135 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                  ; inst 178
  %136 = load i32, i32* %135                                                       ; inst 179
  %137 = icmp slt i32 %134, %136                                                   ; inst 180
  br i1 %137, label %_39.while.body.6, label %_40.while.exit.6                     ; inst 181
_39.while.body.6:
  %138 = sext i32 %119 to i64                                                      ; inst 182
  %139 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %138 ; inst 183
  %140 = sext i32 %134 to i64                                                      ; inst 184
  %141 = getelementptr [100 x i32], [100 x i32]* %139, i32 0, i64 %140             ; inst 185
  %142 = load i32, i32* %141                                                       ; inst 186
  %143 = sext i32 %34 to i64                                                       ; inst 187
  %144 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %143 ; inst 188
  %145 = sext i32 %134 to i64                                                      ; inst 189
  %146 = getelementptr [100 x i32], [100 x i32]* %144, i32 0, i64 %145             ; inst 190
  %147 = load i32, i32* %146                                                       ; inst 191
  %148 = mul i32 %133, %147                                                        ; inst 192
  %149 = sub i32 %142, %148                                                        ; inst 193
  store i32 %149, i32* %141                                                        ; inst 194
  %150 = add i32 %134, 1                                                           ; inst 195
  br label %_38.while.cond.6                                                       ; inst 196
_40.while.exit.6:
  %151 = add i32 %119, 1                                                           ; inst 197
  br label %_36.while.cond.5                                                       ; inst 198
_41.while.exit.5:
  %152 = add i32 %34, 1                                                            ; inst 199
  br label %_13.while.cond.2                                                       ; inst 200
_42.while.exit.2:
  br label %_43.while.cond.7                                                       ; inst 201
_43.while.cond.7:
  %153 = phi i32 [0, %_42.while.exit.2], [%164, %_44.while.body.7]                 ; inst 202
  %154 = phi i32 [1, %_42.while.exit.2], [%163, %_44.while.body.7]                 ; inst 203
  %155 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                  ; inst 204
  %156 = load i32, i32* %155                                                       ; inst 205
  %157 = icmp slt i32 %153, %156                                                   ; inst 206
  br i1 %157, label %_44.while.body.7, label %_45.while.exit.7                     ; inst 207
_44.while.body.7:
  %158 = sext i32 %153 to i64                                                      ; inst 208
  %159 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %1, i32 0, i64 %158 ; inst 209
  %160 = sext i32 %153 to i64                                                      ; inst 210
  %161 = getelementptr [100 x i32], [100 x i32]* %159, i32 0, i64 %160             ; inst 211
  %162 = load i32, i32* %161                                                       ; inst 212
  %163 = mul i32 %154, %162                                                        ; inst 213
  %164 = add i32 %153, 1                                                           ; inst 214
  br label %_43.while.cond.7                                                       ; inst 215
_45.while.exit.7:
  %165 = mul i32 %154, %33                                                         ; inst 216
  ret i32 %165                                                                     ; inst 217
}

define void @_3MoxJ9jWv8O_matrix_operations_suite(%MathEngine* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 3
  %3 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                    ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = icmp slt i32 %1, %4                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %6 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                    ; inst 8
  %7 = sext i32 %1 to i64                                                          ; inst 9
  %8 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %6, i32 0, i64 %7   ; inst 10
  %9 = sext i32 %1 to i64                                                          ; inst 11
  %10 = getelementptr [100 x i32], [100 x i32]* %8, i32 0, i64 %9                  ; inst 12
  %11 = load i32, i32* %10                                                         ; inst 13
  %12 = add i32 %2, %11                                                            ; inst 14
  %13 = add i32 %1, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  %14 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                  ; inst 17
  %15 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 18
  %16 = load i32, i32* %15                                                         ; inst 19
  %17 = sext i32 %16 to i64                                                        ; inst 20
  %18 = getelementptr [50 x i32], [50 x i32]* %14, i32 0, i64 %17                  ; inst 21
  store i32 %2, i32* %18                                                           ; inst 22
  %19 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 23
  %20 = load i32, i32* %19                                                         ; inst 24
  %21 = add i32 %20, 1                                                             ; inst 25
  store i32 %21, i32* %19                                                          ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_4.while.cond.1:
  %22 = phi i32 [0, %_3.while.exit.0], [%28, %_8.while.exit.2]                     ; inst 28
  %23 = phi i32 [0, %_3.while.exit.0], [%41, %_8.while.exit.2]                     ; inst 29
  %24 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 30
  %25 = load i32, i32* %24                                                         ; inst 31
  %26 = icmp slt i32 %23, %25                                                      ; inst 32
  br i1 %26, label %_5.while.body.1, label %_9.while.exit.1                        ; inst 33
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 34
_6.while.cond.2:
  %27 = phi i32 [0, %_5.while.body.1], [%40, %_7.while.body.2]                     ; inst 35
  %28 = phi i32 [%22, %_5.while.body.1], [%39, %_7.while.body.2]                   ; inst 36
  %29 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 37
  %30 = load i32, i32* %29                                                         ; inst 38
  %31 = icmp slt i32 %27, %30                                                      ; inst 39
  br i1 %31, label %_7.while.body.2, label %_8.while.exit.2                        ; inst 40
_7.while.body.2:
  %32 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                   ; inst 41
  %33 = sext i32 %23 to i64                                                        ; inst 42
  %34 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %32, i32 0, i64 %33 ; inst 43
  %35 = sext i32 %27 to i64                                                        ; inst 44
  %36 = getelementptr [100 x i32], [100 x i32]* %34, i32 0, i64 %35                ; inst 45
  %37 = load i32, i32* %36                                                         ; inst 46
  %38 = mul i32 %37, %37                                                           ; inst 47
  %39 = add i32 %28, %38                                                           ; inst 48
  %40 = add i32 %27, 1                                                             ; inst 49
  br label %_6.while.cond.2                                                        ; inst 50
_8.while.exit.2:
  %41 = add i32 %23, 1                                                             ; inst 51
  br label %_4.while.cond.1                                                        ; inst 52
_9.while.exit.1:
  %42 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                  ; inst 53
  %43 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 54
  %44 = load i32, i32* %43                                                         ; inst 55
  %45 = sext i32 %44 to i64                                                        ; inst 56
  %46 = getelementptr [50 x i32], [50 x i32]* %42, i32 0, i64 %45                  ; inst 57
  store i32 %22, i32* %46                                                          ; inst 58
  %47 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 59
  %48 = load i32, i32* %47                                                         ; inst 60
  %49 = add i32 %48, 1                                                             ; inst 61
  store i32 %49, i32* %47                                                          ; inst 62
  br label %_10.while.cond.3                                                       ; inst 63
_10.while.cond.3:
  %50 = phi i32 [0, %_9.while.exit.1], [%77, %_14.while.exit.4]                    ; inst 64
  %51 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 65
  %52 = load i32, i32* %51                                                         ; inst 66
  %53 = icmp slt i32 %50, %52                                                      ; inst 67
  br i1 %53, label %_11.while.body.3, label %_15.while.exit.3                      ; inst 68
_11.while.body.3:
  br label %_12.while.cond.4                                                       ; inst 69
_12.while.cond.4:
  %54 = phi i32 [0, %_11.while.body.3], [%76, %_13.while.body.4]                   ; inst 70
  %55 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 3                   ; inst 71
  %56 = load i32, i32* %55                                                         ; inst 72
  %57 = icmp slt i32 %54, %56                                                      ; inst 73
  br i1 %57, label %_13.while.body.4, label %_14.while.exit.4                      ; inst 74
_13.while.body.4:
  %58 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 2                   ; inst 75
  %59 = sext i32 %50 to i64                                                        ; inst 76
  %60 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %58, i32 0, i64 %59 ; inst 77
  %61 = sext i32 %54 to i64                                                        ; inst 78
  %62 = getelementptr [100 x i32], [100 x i32]* %60, i32 0, i64 %61                ; inst 79
  %63 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 0                   ; inst 80
  %64 = sext i32 %50 to i64                                                        ; inst 81
  %65 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %63, i32 0, i64 %64 ; inst 82
  %66 = sext i32 %54 to i64                                                        ; inst 83
  %67 = getelementptr [100 x i32], [100 x i32]* %65, i32 0, i64 %66                ; inst 84
  %68 = load i32, i32* %67                                                         ; inst 85
  %69 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 1                   ; inst 86
  %70 = sext i32 %50 to i64                                                        ; inst 87
  %71 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %69, i32 0, i64 %70 ; inst 88
  %72 = sext i32 %54 to i64                                                        ; inst 89
  %73 = getelementptr [100 x i32], [100 x i32]* %71, i32 0, i64 %72                ; inst 90
  %74 = load i32, i32* %73                                                         ; inst 91
  %75 = add i32 %68, %74                                                           ; inst 92
  store i32 %75, i32* %62                                                          ; inst 93
  %76 = add i32 %54, 1                                                             ; inst 94
  br label %_12.while.cond.4                                                       ; inst 95
_14.while.exit.4:
  %77 = add i32 %50, 1                                                             ; inst 96
  br label %_10.while.cond.3                                                       ; inst 97
_15.while.exit.3:
  ret void                                                                         ; inst 98
}

define void @_3MoxJ9jWv8O_initialize_polynomial(%MathEngine* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 5                    ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %4 = icmp sle i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 4                    ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [200 x i32], [200 x i32]* %5, i32 0, i64 %6                   ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define i32 @_3MoxJ9jWv8O_evaluate_polynomial(%MathEngine* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%15, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [1, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%13, %_2.while.body.0]                           ; inst 4
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 5                    ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = icmp sle i32 %2, %6                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  %8 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 4                    ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [200 x i32], [200 x i32]* %8, i32 0, i64 %9                  ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = mul i32 %11, %3                                                            ; inst 13
  %13 = add i32 %4, %12                                                            ; inst 14
  %14 = mul i32 %3, %1                                                             ; inst 15
  %15 = add i32 %2, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret i32 %4                                                                       ; inst 18
}

define void @_3MoxJ9jWv8O_find_polynomial_roots(%MathEngine* %0) {
_0.entry.0:
  %1 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                    ; inst 1
  store i32 0, i32* %1                                                             ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %2 = phi i32 [-10, %_0.entry.0], [%63, %_38.while.exit.1]                        ; inst 4
  %3 = icmp sle i32 %2, 10                                                         ; inst 5
  br i1 %3, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 6
_2.lazy.then.0:
  %4 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                    ; inst 7
  %5 = load i32, i32* %4                                                           ; inst 8
  %6 = icmp slt i32 %5, 50                                                         ; inst 9
  br label %_4.lazy.exit.0                                                         ; inst 10
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 11
_4.lazy.exit.0:
  %7 = phi i1 [%6, %_2.lazy.then.0], [0, %_3.lazy.else.0]                          ; inst 12
  br i1 %7, label %_5.while.body.0, label %_39.while.exit.0                        ; inst 13
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 14
_6.while.cond.1:
  %8 = phi i32 [0, %_5.while.body.0], [%62, %_37.if.exit.2]                        ; inst 15
  %9 = phi i32 [%2, %_5.while.body.0], [%15, %_37.if.exit.2]                       ; inst 16
  %10 = icmp slt i32 %8, 50                                                        ; inst 17
  br i1 %10, label %_7.while.body.1, label %_40.critical_edge.0                    ; inst 18
_7.while.body.1:
  %11 = call i32 @_3MoxJ9jWv8O_evaluate_polynomial(%MathEngine* %0, i32 %9)        ; inst 19
  %12 = call i32 @_3MoxJ9jWv8O_evaluate_polynomial_derivative(%MathEngine* %0, i32 %9) ; inst 20
  %13 = icmp eq i32 %12, 0                                                         ; inst 21
  br i1 %13, label %_8.if.then.0, label %_9.if.else.0                              ; inst 22
_8.if.then.0:
  br label %_38.while.exit.1                                                       ; inst 23
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 24
_10.if.exit.0:
  %14 = sdiv i32 %11, %12                                                          ; inst 25
  %15 = sub i32 %9, %14                                                            ; inst 26
  %16 = icmp sgt i32 %15, %9                                                       ; inst 27
  br i1 %16, label %_11.if.then.1, label %_12.if.else.1                            ; inst 28
_11.if.then.1:
  %17 = sub i32 %15, %9                                                            ; inst 29
  br label %_13.if.exit.1                                                          ; inst 30
_12.if.else.1:
  %18 = sub i32 %9, %15                                                            ; inst 31
  br label %_13.if.exit.1                                                          ; inst 32
_13.if.exit.1:
  %19 = phi i32 [%17, %_11.if.then.1], [%18, %_12.if.else.1]                       ; inst 33
  %20 = icmp sle i32 %19, 1                                                        ; inst 34
  br i1 %20, label %_14.if.then.2, label %_36.if.else.2                            ; inst 35
_14.if.then.2:
  %21 = call i32 @_3MoxJ9jWv8O_evaluate_polynomial(%MathEngine* %0, i32 %15)       ; inst 36
  %22 = icmp eq i32 %21, 0                                                         ; inst 37
  br i1 %22, label %_15.lazy.then.1, label %_16.lazy.else.1                        ; inst 38
_15.lazy.then.1:
  br label %_20.lazy.exit.1                                                        ; inst 39
_16.lazy.else.1:
  %23 = call i32 @_3MoxJ9jWv8O_evaluate_polynomial(%MathEngine* %0, i32 %15)       ; inst 40
  %24 = icmp slt i32 %23, 0                                                        ; inst 41
  br i1 %24, label %_17.if.then.4, label %_18.if.else.4                            ; inst 42
_17.if.then.4:
  %25 = call i32 @_3MoxJ9jWv8O_evaluate_polynomial(%MathEngine* %0, i32 %15)       ; inst 43
  %26 = sub i32 0, %25                                                             ; inst 44
  br label %_19.if.exit.4                                                          ; inst 45
_18.if.else.4:
  %27 = call i32 @_3MoxJ9jWv8O_evaluate_polynomial(%MathEngine* %0, i32 %15)       ; inst 46
  br label %_19.if.exit.4                                                          ; inst 47
_19.if.exit.4:
  %28 = phi i32 [%26, %_17.if.then.4], [%27, %_18.if.else.4]                       ; inst 48
  %29 = icmp sle i32 %28, 5                                                        ; inst 49
  br label %_20.lazy.exit.1                                                        ; inst 50
_20.lazy.exit.1:
  %30 = phi i1 [1, %_15.lazy.then.1], [%29, %_19.if.exit.4]                        ; inst 51
  br i1 %30, label %_21.if.then.3, label %_34.if.else.3                            ; inst 52
_21.if.then.3:
  br label %_22.while.cond.2                                                       ; inst 53
_22.while.cond.2:
  %31 = phi i32 [0, %_21.if.then.3], [%52, %_29.if.exit.6]                         ; inst 54
  %32 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                   ; inst 55
  %33 = load i32, i32* %32                                                         ; inst 56
  %34 = icmp slt i32 %31, %33                                                      ; inst 57
  br i1 %34, label %_23.while.body.2, label %_41.critical_edge.1                   ; inst 58
_23.while.body.2:
  %35 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 6                   ; inst 59
  %36 = sext i32 %31 to i64                                                        ; inst 60
  %37 = getelementptr [50 x i32], [50 x i32]* %35, i32 0, i64 %36                  ; inst 61
  %38 = load i32, i32* %37                                                         ; inst 62
  %39 = icmp sgt i32 %38, %15                                                      ; inst 63
  br i1 %39, label %_24.if.then.5, label %_25.if.else.5                            ; inst 64
_24.if.then.5:
  %40 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 6                   ; inst 65
  %41 = sext i32 %31 to i64                                                        ; inst 66
  %42 = getelementptr [50 x i32], [50 x i32]* %40, i32 0, i64 %41                  ; inst 67
  %43 = load i32, i32* %42                                                         ; inst 68
  %44 = sub i32 %43, %15                                                           ; inst 69
  br label %_26.if.exit.5                                                          ; inst 70
_25.if.else.5:
  %45 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 6                   ; inst 71
  %46 = sext i32 %31 to i64                                                        ; inst 72
  %47 = getelementptr [50 x i32], [50 x i32]* %45, i32 0, i64 %46                  ; inst 73
  %48 = load i32, i32* %47                                                         ; inst 74
  %49 = sub i32 %15, %48                                                           ; inst 75
  br label %_26.if.exit.5                                                          ; inst 76
_26.if.exit.5:
  %50 = phi i32 [%44, %_24.if.then.5], [%49, %_25.if.else.5]                       ; inst 77
  %51 = icmp sle i32 %50, 2                                                        ; inst 78
  br i1 %51, label %_27.if.then.6, label %_28.if.else.6                            ; inst 79
_27.if.then.6:
  br label %_30.while.exit.2                                                       ; inst 80
_28.if.else.6:
  br label %_29.if.exit.6                                                          ; inst 81
_29.if.exit.6:
  %52 = add i32 %31, 1                                                             ; inst 82
  br label %_22.while.cond.2                                                       ; inst 83
_30.while.exit.2:
  %53 = phi i1 [1, %_41.critical_edge.1], [0, %_27.if.then.6]                      ; inst 84
  br i1 %53, label %_31.if.then.7, label %_32.if.else.7                            ; inst 85
_31.if.then.7:
  %54 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 6                   ; inst 86
  %55 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                   ; inst 87
  %56 = load i32, i32* %55                                                         ; inst 88
  %57 = sext i32 %56 to i64                                                        ; inst 89
  %58 = getelementptr [50 x i32], [50 x i32]* %54, i32 0, i64 %57                  ; inst 90
  store i32 %15, i32* %58                                                          ; inst 91
  %59 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                   ; inst 92
  %60 = load i32, i32* %59                                                         ; inst 93
  %61 = add i32 %60, 1                                                             ; inst 94
  store i32 %61, i32* %59                                                          ; inst 95
  br label %_33.if.exit.7                                                          ; inst 96
_32.if.else.7:
  br label %_33.if.exit.7                                                          ; inst 97
_33.if.exit.7:
  br label %_35.if.exit.3                                                          ; inst 98
_34.if.else.3:
  br label %_35.if.exit.3                                                          ; inst 99
_35.if.exit.3:
  br label %_38.while.exit.1                                                       ; inst 100
_36.if.else.2:
  br label %_37.if.exit.2                                                          ; inst 101
_37.if.exit.2:
  %62 = add i32 %8, 1                                                              ; inst 102
  br label %_6.while.cond.1                                                        ; inst 103
_38.while.exit.1:
  %63 = add i32 %2, 7                                                              ; inst 104
  br label %_1.while.cond.0                                                        ; inst 105
_39.while.exit.0:
  ret void                                                                         ; inst 106
_40.critical_edge.0:
  br label %_38.while.exit.1                                                       ; inst 107
_41.critical_edge.1:
  br label %_30.while.exit.2                                                       ; inst 108
}

define i32 @_3MoxJ9jWv8O_evaluate_polynomial_derivative(%MathEngine* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [1, %_0.entry.0], [%16, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [1, %_0.entry.0], [%15, %_2.while.body.0]                           ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 4
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 5                    ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = icmp sle i32 %2, %6                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  %8 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 4                    ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [200 x i32], [200 x i32]* %8, i32 0, i64 %9                  ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = mul i32 %2, %11                                                            ; inst 13
  %13 = mul i32 %12, %3                                                            ; inst 14
  %14 = add i32 %4, %13                                                            ; inst 15
  %15 = mul i32 %3, %1                                                             ; inst 16
  %16 = add i32 %2, 1                                                              ; inst 17
  br label %_1.while.cond.0                                                        ; inst 18
_3.while.exit.0:
  ret i32 %4                                                                       ; inst 19
}

define void @_3MoxJ9jWv8O_initialize_function_data(%MathEngine* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 9                    ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                    ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [1000 x i32], [1000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define i32 @_3MoxJ9jWv8O_trapezoidal_integration(%MathEngine* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%21, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%20, %_2.while.body.0]                           ; inst 3
  %4 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 9                    ; inst 4
  %5 = load i32, i32* %4                                                           ; inst 5
  %6 = sub i32 %5, 1                                                               ; inst 6
  %7 = icmp slt i32 %2, %6                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  %8 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                    ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [1000 x i32], [1000 x i32]* %8, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                   ; inst 13
  %13 = add i32 %2, 1                                                              ; inst 14
  %14 = sext i32 %13 to i64                                                        ; inst 15
  %15 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i64 %14              ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = add i32 %11, %16                                                           ; inst 18
  %18 = mul i32 %17, %1                                                            ; inst 19
  %19 = sdiv i32 %18, 2                                                            ; inst 20
  %20 = add i32 %3, %19                                                            ; inst 21
  %21 = add i32 %2, 1                                                              ; inst 22
  br label %_1.while.cond.0                                                        ; inst 23
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 24
}

define i32 @_3MoxJ9jWv8O_simpson_integration(%MathEngine* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%28, %_2.while.body.0]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%27, %_2.while.body.0]                           ; inst 3
  %4 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 9                    ; inst 4
  %5 = load i32, i32* %4                                                           ; inst 5
  %6 = sub i32 %5, 2                                                               ; inst 6
  %7 = icmp slt i32 %2, %6                                                         ; inst 7
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 8
_2.while.body.0:
  %8 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                    ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [1000 x i32], [1000 x i32]* %8, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                   ; inst 13
  %13 = add i32 %2, 1                                                              ; inst 14
  %14 = sext i32 %13 to i64                                                        ; inst 15
  %15 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i64 %14              ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = mul i32 4, %16                                                             ; inst 18
  %18 = add i32 %11, %17                                                           ; inst 19
  %19 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 8                   ; inst 20
  %20 = add i32 %2, 2                                                              ; inst 21
  %21 = sext i32 %20 to i64                                                        ; inst 22
  %22 = getelementptr [1000 x i32], [1000 x i32]* %19, i32 0, i64 %21              ; inst 23
  %23 = load i32, i32* %22                                                         ; inst 24
  %24 = add i32 %18, %23                                                           ; inst 25
  %25 = mul i32 %1, %24                                                            ; inst 26
  %26 = sdiv i32 %25, 3                                                            ; inst 27
  %27 = add i32 %3, %26                                                            ; inst 28
  %28 = add i32 %2, 2                                                              ; inst 29
  br label %_1.while.cond.0                                                        ; inst 30
_3.while.exit.0:
  ret i32 %3                                                                       ; inst 31
}

define void @_3MoxJ9jWv8O_initialize_fft_data(%MathEngine* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 13                   ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                   ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [512 x i32], [512 x i32]* %5, i32 0, i64 %6                   ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                   ; inst 12
  %10 = sext i32 %3 to i64                                                         ; inst 13
  %11 = getelementptr [512 x i32], [512 x i32]* %9, i32 0, i64 %10                 ; inst 14
  store i32 0, i32* %11                                                            ; inst 15
  %12 = add i32 %3, 1                                                              ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_3.while.exit.0:
  ret void                                                                         ; inst 18
}

define void @_3MoxJ9jWv8O_compute_fft(%MathEngine* %0) {
_0.entry.0:
  %1 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 13                   ; inst 1
  %2 = load i32, i32* %1                                                           ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%12, %_8.if.exit.0]                              ; inst 4
  %4 = phi i32 [1, %_0.entry.0], [%42, %_8.if.exit.0]                              ; inst 5
  %5 = icmp slt i32 %4, %2                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 7
_2.while.body.0:
  %6 = sdiv i32 %2, 2                                                              ; inst 8
  br label %_3.while.cond.1                                                        ; inst 9
_3.while.cond.1:
  %7 = phi i32 [%3, %_2.while.body.0], [%10, %_4.while.body.1]                     ; inst 10
  %8 = phi i32 [%6, %_2.while.body.0], [%11, %_4.while.body.1]                     ; inst 11
  %9 = icmp sge i32 %7, %8                                                         ; inst 12
  br i1 %9, label %_4.while.body.1, label %_5.while.exit.1                         ; inst 13
_4.while.body.1:
  %10 = sub i32 %7, %8                                                             ; inst 14
  %11 = sdiv i32 %8, 2                                                             ; inst 15
  br label %_3.while.cond.1                                                        ; inst 16
_5.while.exit.1:
  %12 = add i32 %7, %8                                                             ; inst 17
  %13 = icmp slt i32 %4, %12                                                       ; inst 18
  br i1 %13, label %_6.if.then.0, label %_7.if.else.0                              ; inst 19
_6.if.then.0:
  %14 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 20
  %15 = sext i32 %4 to i64                                                         ; inst 21
  %16 = getelementptr [512 x i32], [512 x i32]* %14, i32 0, i64 %15                ; inst 22
  %17 = load i32, i32* %16                                                         ; inst 23
  %18 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 24
  %19 = sext i32 %4 to i64                                                         ; inst 25
  %20 = getelementptr [512 x i32], [512 x i32]* %18, i32 0, i64 %19                ; inst 26
  %21 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 27
  %22 = sext i32 %12 to i64                                                        ; inst 28
  %23 = getelementptr [512 x i32], [512 x i32]* %21, i32 0, i64 %22                ; inst 29
  %24 = load i32, i32* %23                                                         ; inst 30
  store i32 %24, i32* %20                                                          ; inst 31
  %25 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 32
  %26 = sext i32 %12 to i64                                                        ; inst 33
  %27 = getelementptr [512 x i32], [512 x i32]* %25, i32 0, i64 %26                ; inst 34
  store i32 %17, i32* %27                                                          ; inst 35
  %28 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 36
  %29 = sext i32 %4 to i64                                                         ; inst 37
  %30 = getelementptr [512 x i32], [512 x i32]* %28, i32 0, i64 %29                ; inst 38
  %31 = load i32, i32* %30                                                         ; inst 39
  %32 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 40
  %33 = sext i32 %4 to i64                                                         ; inst 41
  %34 = getelementptr [512 x i32], [512 x i32]* %32, i32 0, i64 %33                ; inst 42
  %35 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 43
  %36 = sext i32 %12 to i64                                                        ; inst 44
  %37 = getelementptr [512 x i32], [512 x i32]* %35, i32 0, i64 %36                ; inst 45
  %38 = load i32, i32* %37                                                         ; inst 46
  store i32 %38, i32* %34                                                          ; inst 47
  %39 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 48
  %40 = sext i32 %12 to i64                                                        ; inst 49
  %41 = getelementptr [512 x i32], [512 x i32]* %39, i32 0, i64 %40                ; inst 50
  store i32 %31, i32* %41                                                          ; inst 51
  br label %_8.if.exit.0                                                           ; inst 52
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 53
_8.if.exit.0:
  %42 = add i32 %4, 1                                                              ; inst 54
  br label %_1.while.cond.0                                                        ; inst 55
_9.while.exit.0:
  br label %_10.while.cond.2                                                       ; inst 56
_10.while.cond.2:
  %43 = phi i32 [2, %_9.while.exit.0], [%100, %_17.while.exit.3]                   ; inst 57
  %44 = icmp sle i32 %43, %2                                                       ; inst 58
  br i1 %44, label %_11.while.body.2, label %_18.while.exit.2                      ; inst 59
_11.while.body.2:
  %45 = sdiv i32 %43, 2                                                            ; inst 60
  %46 = sdiv i32 6283, %43                                                         ; inst 61
  br label %_12.while.cond.3                                                       ; inst 62
_12.while.cond.3:
  %47 = phi i32 [0, %_11.while.body.2], [%99, %_16.while.exit.4]                   ; inst 63
  %48 = icmp slt i32 %47, %2                                                       ; inst 64
  br i1 %48, label %_13.while.body.3, label %_17.while.exit.3                      ; inst 65
_13.while.body.3:
  br label %_14.while.cond.4                                                       ; inst 66
_14.while.cond.4:
  %49 = phi i32 [0, %_13.while.body.3], [%98, %_15.while.body.4]                   ; inst 67
  %50 = icmp slt i32 %49, %45                                                      ; inst 68
  br i1 %50, label %_15.while.body.4, label %_16.while.exit.4                      ; inst 69
_15.while.body.4:
  %51 = mul i32 %49, %46                                                           ; inst 70
  %52 = mul i32 %51, %51                                                           ; inst 71
  %53 = sdiv i32 %52, 2000                                                         ; inst 72
  %54 = sub i32 1000, %53                                                          ; inst 73
  %55 = mul i32 %51, %51                                                           ; inst 74
  %56 = sdiv i32 %55, 6000                                                         ; inst 75
  %57 = mul i32 %56, %51                                                           ; inst 76
  %58 = sub i32 %51, %57                                                           ; inst 77
  %59 = add i32 %47, %49                                                           ; inst 78
  %60 = sext i32 %59 to i64                                                        ; inst 79
  %61 = add i32 %47, %49                                                           ; inst 80
  %62 = add i32 %61, %45                                                           ; inst 81
  %63 = sext i32 %62 to i64                                                        ; inst 82
  %64 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 83
  %65 = getelementptr [512 x i32], [512 x i32]* %64, i32 0, i64 %60                ; inst 84
  %66 = load i32, i32* %65                                                         ; inst 85
  %67 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 86
  %68 = getelementptr [512 x i32], [512 x i32]* %67, i32 0, i64 %60                ; inst 87
  %69 = load i32, i32* %68                                                         ; inst 88
  %70 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 89
  %71 = getelementptr [512 x i32], [512 x i32]* %70, i32 0, i64 %63                ; inst 90
  %72 = load i32, i32* %71                                                         ; inst 91
  %73 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 92
  %74 = getelementptr [512 x i32], [512 x i32]* %73, i32 0, i64 %63                ; inst 93
  %75 = load i32, i32* %74                                                         ; inst 94
  %76 = sdiv i32 %72, 1000                                                         ; inst 95
  %77 = mul i32 %76, %54                                                           ; inst 96
  %78 = sdiv i32 %75, 1000                                                         ; inst 97
  %79 = mul i32 %78, %58                                                           ; inst 98
  %80 = sub i32 %77, %79                                                           ; inst 99
  %81 = sdiv i32 %72, 1000                                                         ; inst 100
  %82 = mul i32 %81, %58                                                           ; inst 101
  %83 = sdiv i32 %75, 1000                                                         ; inst 102
  %84 = mul i32 %83, %54                                                           ; inst 103
  %85 = add i32 %82, %84                                                           ; inst 104
  %86 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 105
  %87 = getelementptr [512 x i32], [512 x i32]* %86, i32 0, i64 %60                ; inst 106
  %88 = add i32 %66, %80                                                           ; inst 107
  store i32 %88, i32* %87                                                          ; inst 108
  %89 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 109
  %90 = getelementptr [512 x i32], [512 x i32]* %89, i32 0, i64 %60                ; inst 110
  %91 = add i32 %69, %85                                                           ; inst 111
  store i32 %91, i32* %90                                                          ; inst 112
  %92 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 113
  %93 = getelementptr [512 x i32], [512 x i32]* %92, i32 0, i64 %63                ; inst 114
  %94 = sub i32 %66, %80                                                           ; inst 115
  store i32 %94, i32* %93                                                          ; inst 116
  %95 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 117
  %96 = getelementptr [512 x i32], [512 x i32]* %95, i32 0, i64 %63                ; inst 118
  %97 = sub i32 %69, %85                                                           ; inst 119
  store i32 %97, i32* %96                                                          ; inst 120
  %98 = add i32 %49, 1                                                             ; inst 121
  br label %_14.while.cond.4                                                       ; inst 122
_16.while.exit.4:
  %99 = add i32 %47, %43                                                           ; inst 123
  br label %_12.while.cond.3                                                       ; inst 124
_17.while.exit.3:
  %100 = mul i32 %43, 2                                                            ; inst 125
  br label %_10.while.cond.2                                                       ; inst 126
_18.while.exit.2:
  ret void                                                                         ; inst 127
}

define void @_3MoxJ9jWv8O_generate_primes(%MathEngine* %0, i32 %1) {
_0.entry.0:
  %2 = alloca [10000 x i1]                                                         ; inst 1
  %3 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i32 0                  ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 4
  %5 = icmp slt i32 %4, 10000                                                      ; inst 5
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %6 = getelementptr i1, i1* %3, i32 %4                                            ; inst 7
  store i1 1, i1* %6                                                               ; inst 8
  %7 = add i32 %4, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  %8 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i64 0                  ; inst 11
  store i1 0, i1* %8                                                               ; inst 12
  %9 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i64 1                  ; inst 13
  store i1 0, i1* %9                                                               ; inst 14
  br label %_4.while.cond.0                                                        ; inst 15
_4.while.cond.0:
  %10 = phi i32 [2, %_3.array.exit.0], [%22, %_11.if.exit.0]                       ; inst 16
  %11 = mul i32 %10, %10                                                           ; inst 17
  %12 = icmp sle i32 %11, %1                                                       ; inst 18
  br i1 %12, label %_5.while.body.0, label %_12.while.exit.0                       ; inst 19
_5.while.body.0:
  %13 = sext i32 %10 to i64                                                        ; inst 20
  %14 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i64 %13               ; inst 21
  %15 = load i1, i1* %14                                                           ; inst 22
  br i1 %15, label %_6.if.then.0, label %_10.if.else.0                             ; inst 23
_6.if.then.0:
  %16 = mul i32 %10, %10                                                           ; inst 24
  br label %_7.while.cond.1                                                        ; inst 25
_7.while.cond.1:
  %17 = phi i32 [%16, %_6.if.then.0], [%21, %_8.while.body.1]                      ; inst 26
  %18 = icmp sle i32 %17, %1                                                       ; inst 27
  br i1 %18, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 28
_8.while.body.1:
  %19 = sext i32 %17 to i64                                                        ; inst 29
  %20 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i64 %19               ; inst 30
  store i1 0, i1* %20                                                              ; inst 31
  %21 = add i32 %17, %10                                                           ; inst 32
  br label %_7.while.cond.1                                                        ; inst 33
_9.while.exit.1:
  br label %_11.if.exit.0                                                          ; inst 34
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 35
_11.if.exit.0:
  %22 = add i32 %10, 1                                                             ; inst 36
  br label %_4.while.cond.0                                                        ; inst 37
_12.while.exit.0:
  %23 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 38
  store i32 0, i32* %23                                                            ; inst 39
  br label %_13.while.cond.2                                                       ; inst 40
_13.while.cond.2:
  %24 = phi i32 [2, %_12.while.exit.0], [%41, %_20.if.exit.1]                      ; inst 41
  %25 = icmp sle i32 %24, %1                                                       ; inst 42
  br i1 %25, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 43
_14.lazy.then.0:
  %26 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 44
  %27 = load i32, i32* %26                                                         ; inst 45
  %28 = icmp slt i32 %27, 1000                                                     ; inst 46
  br label %_16.lazy.exit.0                                                        ; inst 47
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 48
_16.lazy.exit.0:
  %29 = phi i1 [%28, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 49
  br i1 %29, label %_17.while.body.2, label %_21.while.exit.2                      ; inst 50
_17.while.body.2:
  %30 = sext i32 %24 to i64                                                        ; inst 51
  %31 = getelementptr [10000 x i1], [10000 x i1]* %2, i32 0, i64 %30               ; inst 52
  %32 = load i1, i1* %31                                                           ; inst 53
  br i1 %32, label %_18.if.then.1, label %_19.if.else.1                            ; inst 54
_18.if.then.1:
  %33 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                  ; inst 55
  %34 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 56
  %35 = load i32, i32* %34                                                         ; inst 57
  %36 = sext i32 %35 to i64                                                        ; inst 58
  %37 = getelementptr [1000 x i32], [1000 x i32]* %33, i32 0, i64 %36              ; inst 59
  store i32 %24, i32* %37                                                          ; inst 60
  %38 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 61
  %39 = load i32, i32* %38                                                         ; inst 62
  %40 = add i32 %39, 1                                                             ; inst 63
  store i32 %40, i32* %38                                                          ; inst 64
  br label %_20.if.exit.1                                                          ; inst 65
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 66
_20.if.exit.1:
  %41 = add i32 %24, 1                                                             ; inst 67
  br label %_13.while.cond.2                                                       ; inst 68
_21.while.exit.2:
  ret void                                                                         ; inst 69
}

define i32 @_3MoxJ9jWv8O_prime_factorize(%MathEngine* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%41, %_8.while.exit.1]                           ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%19, %_8.while.exit.1]                           ; inst 3
  %4 = phi i32 [%1, %_0.entry.0], [%20, %_8.while.exit.1]                          ; inst 4
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                   ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = icmp slt i32 %2, %6                                                         ; inst 7
  br i1 %7, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 8
_2.lazy.then.0:
  %8 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                   ; inst 9
  %9 = sext i32 %2 to i64                                                          ; inst 10
  %10 = getelementptr [1000 x i32], [1000 x i32]* %8, i32 0, i64 %9                ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                  ; inst 13
  %13 = sext i32 %2 to i64                                                         ; inst 14
  %14 = getelementptr [1000 x i32], [1000 x i32]* %12, i32 0, i64 %13              ; inst 15
  %15 = load i32, i32* %14                                                         ; inst 16
  %16 = mul i32 %11, %15                                                           ; inst 17
  %17 = icmp sle i32 %16, %4                                                       ; inst 18
  br label %_4.lazy.exit.0                                                         ; inst 19
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 20
_4.lazy.exit.0:
  %18 = phi i1 [%17, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 21
  br i1 %18, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 22
_5.while.body.0:
  br label %_6.while.cond.1                                                        ; inst 23
_6.while.cond.1:
  %19 = phi i32 [%3, %_5.while.body.0], [%35, %_7.while.body.1]                    ; inst 24
  %20 = phi i32 [%4, %_5.while.body.0], [%40, %_7.while.body.1]                    ; inst 25
  %21 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                  ; inst 26
  %22 = sext i32 %2 to i64                                                         ; inst 27
  %23 = getelementptr [1000 x i32], [1000 x i32]* %21, i32 0, i64 %22              ; inst 28
  %24 = load i32, i32* %23                                                         ; inst 29
  %25 = srem i32 %20, %24                                                          ; inst 30
  %26 = icmp eq i32 %25, 0                                                         ; inst 31
  br i1 %26, label %_7.while.body.1, label %_8.while.exit.1                        ; inst 32
_7.while.body.1:
  %27 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 16                  ; inst 33
  %28 = getelementptr [100 x [20 x i32]], [100 x [20 x i32]]* %27, i32 0, i64 0    ; inst 34
  %29 = sext i32 %19 to i64                                                        ; inst 35
  %30 = getelementptr [20 x i32], [20 x i32]* %28, i32 0, i64 %29                  ; inst 36
  %31 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                  ; inst 37
  %32 = sext i32 %2 to i64                                                         ; inst 38
  %33 = getelementptr [1000 x i32], [1000 x i32]* %31, i32 0, i64 %32              ; inst 39
  %34 = load i32, i32* %33                                                         ; inst 40
  store i32 %34, i32* %30                                                          ; inst 41
  %35 = add i32 %19, 1                                                             ; inst 42
  %36 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 14                  ; inst 43
  %37 = sext i32 %2 to i64                                                         ; inst 44
  %38 = getelementptr [1000 x i32], [1000 x i32]* %36, i32 0, i64 %37              ; inst 45
  %39 = load i32, i32* %38                                                         ; inst 46
  %40 = sdiv i32 %20, %39                                                          ; inst 47
  br label %_6.while.cond.1                                                        ; inst 48
_8.while.exit.1:
  %41 = add i32 %2, 1                                                              ; inst 49
  br label %_1.while.cond.0                                                        ; inst 50
_9.while.exit.0:
  %42 = icmp sgt i32 %4, 1                                                         ; inst 51
  br i1 %42, label %_10.if.then.0, label %_11.if.else.0                            ; inst 52
_10.if.then.0:
  %43 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 16                  ; inst 53
  %44 = getelementptr [100 x [20 x i32]], [100 x [20 x i32]]* %43, i32 0, i64 0    ; inst 54
  %45 = sext i32 %3 to i64                                                         ; inst 55
  %46 = getelementptr [20 x i32], [20 x i32]* %44, i32 0, i64 %45                  ; inst 56
  store i32 %4, i32* %46                                                           ; inst 57
  %47 = add i32 %3, 1                                                              ; inst 58
  br label %_12.if.exit.0                                                          ; inst 59
_11.if.else.0:
  br label %_12.if.exit.0                                                          ; inst 60
_12.if.exit.0:
  %48 = phi i32 [%47, %_10.if.then.0], [%3, %_11.if.else.0]                        ; inst 61
  ret i32 %48                                                                      ; inst 62
}

define void @_3MoxJ9jWv8O_initialize_data_series(%MathEngine* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                   ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  br label %_1.while.cond.0                                                        ; inst 3
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 4
  %4 = icmp slt i32 %3, %1                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                   ; inst 7
  %6 = sext i32 %3 to i64                                                          ; inst 8
  %7 = getelementptr [2000 x i32], [2000 x i32]* %5, i32 0, i64 %6                 ; inst 9
  %8 = call i32 @getInt()                                                          ; inst 10
  store i32 %8, i32* %7                                                            ; inst 11
  %9 = add i32 %3, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  ret void                                                                         ; inst 14
}

define void @_3MoxJ9jWv8O_calculate_moments(%MathEngine* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %2 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 3
  %3 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                   ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = icmp slt i32 %2, %4                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 7
_2.while.body.0:
  %6 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                   ; inst 8
  %7 = sext i32 %2 to i64                                                          ; inst 9
  %8 = getelementptr [2000 x i32], [2000 x i32]* %6, i32 0, i64 %7                 ; inst 10
  %9 = load i32, i32* %8                                                           ; inst 11
  %10 = add i32 %1, %9                                                             ; inst 12
  %11 = add i32 %2, 1                                                              ; inst 13
  br label %_1.while.cond.0                                                        ; inst 14
_3.while.exit.0:
  %12 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 15
  %13 = load i32, i32* %12                                                         ; inst 16
  %14 = sdiv i32 %1, %13                                                           ; inst 17
  %15 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 18
  %16 = getelementptr [10 x i32], [10 x i32]* %15, i32 0, i64 0                    ; inst 19
  store i32 %14, i32* %16                                                          ; inst 20
  br label %_4.while.cond.1                                                        ; inst 21
_4.while.cond.1:
  %17 = phi i32 [0, %_3.while.exit.0], [%35, %_5.while.body.1]                     ; inst 22
  %18 = phi i32 [0, %_3.while.exit.0], [%32, %_5.while.body.1]                     ; inst 23
  %19 = phi i32 [0, %_3.while.exit.0], [%34, %_5.while.body.1]                     ; inst 24
  %20 = phi i32 [0, %_3.while.exit.0], [%33, %_5.while.body.1]                     ; inst 25
  %21 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 26
  %22 = load i32, i32* %21                                                         ; inst 27
  %23 = icmp slt i32 %17, %22                                                      ; inst 28
  br i1 %23, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 29
_5.while.body.1:
  %24 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 30
  %25 = sext i32 %17 to i64                                                        ; inst 31
  %26 = getelementptr [2000 x i32], [2000 x i32]* %24, i32 0, i64 %25              ; inst 32
  %27 = load i32, i32* %26                                                         ; inst 33
  %28 = sub i32 %27, %14                                                           ; inst 34
  %29 = mul i32 %28, %28                                                           ; inst 35
  %30 = mul i32 %29, %28                                                           ; inst 36
  %31 = mul i32 %30, %28                                                           ; inst 37
  %32 = add i32 %18, %29                                                           ; inst 38
  %33 = add i32 %20, %30                                                           ; inst 39
  %34 = add i32 %19, %31                                                           ; inst 40
  %35 = add i32 %17, 1                                                             ; inst 41
  br label %_4.while.cond.1                                                        ; inst 42
_6.while.exit.1:
  %36 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 43
  %37 = getelementptr [10 x i32], [10 x i32]* %36, i32 0, i64 1                    ; inst 44
  %38 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 45
  %39 = load i32, i32* %38                                                         ; inst 46
  %40 = sdiv i32 %18, %39                                                          ; inst 47
  store i32 %40, i32* %37                                                          ; inst 48
  %41 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 49
  %42 = getelementptr [10 x i32], [10 x i32]* %41, i32 0, i64 2                    ; inst 50
  %43 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 51
  %44 = load i32, i32* %43                                                         ; inst 52
  %45 = sdiv i32 %20, %44                                                          ; inst 53
  store i32 %45, i32* %42                                                          ; inst 54
  %46 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 55
  %47 = getelementptr [10 x i32], [10 x i32]* %46, i32 0, i64 3                    ; inst 56
  %48 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 57
  %49 = load i32, i32* %48                                                         ; inst 58
  %50 = sdiv i32 %19, %49                                                          ; inst 59
  store i32 %50, i32* %47                                                          ; inst 60
  %51 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 61
  %52 = getelementptr [2000 x i32], [2000 x i32]* %51, i32 0, i64 0                ; inst 62
  %53 = load i32, i32* %52                                                         ; inst 63
  %54 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 64
  %55 = getelementptr [2000 x i32], [2000 x i32]* %54, i32 0, i64 0                ; inst 65
  %56 = load i32, i32* %55                                                         ; inst 66
  br label %_7.while.cond.2                                                        ; inst 67
_7.while.cond.2:
  %57 = phi i32 [%53, %_6.while.exit.1], [%72, %_14.if.exit.1]                     ; inst 68
  %58 = phi i32 [1, %_6.while.exit.1], [%83, %_14.if.exit.1]                       ; inst 69
  %59 = phi i32 [%56, %_6.while.exit.1], [%82, %_14.if.exit.1]                     ; inst 70
  %60 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 71
  %61 = load i32, i32* %60                                                         ; inst 72
  %62 = icmp slt i32 %58, %61                                                      ; inst 73
  br i1 %62, label %_8.while.body.2, label %_15.while.exit.2                       ; inst 74
_8.while.body.2:
  %63 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 75
  %64 = sext i32 %58 to i64                                                        ; inst 76
  %65 = getelementptr [2000 x i32], [2000 x i32]* %63, i32 0, i64 %64              ; inst 77
  %66 = load i32, i32* %65                                                         ; inst 78
  %67 = icmp slt i32 %66, %57                                                      ; inst 79
  br i1 %67, label %_9.if.then.0, label %_10.if.else.0                             ; inst 80
_9.if.then.0:
  %68 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 81
  %69 = sext i32 %58 to i64                                                        ; inst 82
  %70 = getelementptr [2000 x i32], [2000 x i32]* %68, i32 0, i64 %69              ; inst 83
  %71 = load i32, i32* %70                                                         ; inst 84
  br label %_11.if.exit.0                                                          ; inst 85
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 86
_11.if.exit.0:
  %72 = phi i32 [%71, %_9.if.then.0], [%57, %_10.if.else.0]                        ; inst 87
  %73 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 88
  %74 = sext i32 %58 to i64                                                        ; inst 89
  %75 = getelementptr [2000 x i32], [2000 x i32]* %73, i32 0, i64 %74              ; inst 90
  %76 = load i32, i32* %75                                                         ; inst 91
  %77 = icmp sgt i32 %76, %59                                                      ; inst 92
  br i1 %77, label %_12.if.then.1, label %_13.if.else.1                            ; inst 93
_12.if.then.1:
  %78 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 94
  %79 = sext i32 %58 to i64                                                        ; inst 95
  %80 = getelementptr [2000 x i32], [2000 x i32]* %78, i32 0, i64 %79              ; inst 96
  %81 = load i32, i32* %80                                                         ; inst 97
  br label %_14.if.exit.1                                                          ; inst 98
_13.if.else.1:
  br label %_14.if.exit.1                                                          ; inst 99
_14.if.exit.1:
  %82 = phi i32 [%81, %_12.if.then.1], [%59, %_13.if.else.1]                       ; inst 100
  %83 = add i32 %58, 1                                                             ; inst 101
  br label %_7.while.cond.2                                                        ; inst 102
_15.while.exit.2:
  %84 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 103
  %85 = getelementptr [10 x i32], [10 x i32]* %84, i32 0, i64 4                    ; inst 104
  store i32 %57, i32* %85                                                          ; inst 105
  %86 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 106
  %87 = getelementptr [10 x i32], [10 x i32]* %86, i32 0, i64 5                    ; inst 107
  store i32 %59, i32* %87                                                          ; inst 108
  %88 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 109
  %89 = getelementptr [10 x i32], [10 x i32]* %88, i32 0, i64 6                    ; inst 110
  %90 = sub i32 %59, %57                                                           ; inst 111
  store i32 %90, i32* %89                                                          ; inst 112
  ret void                                                                         ; inst 113
}

define void @_3MoxJ9jWv8O_perform_comprehensive_analysis(%MathEngine* %0) {
_0.entry.0:
  call void @_3MoxJ9jWv8O_matrix_multiply(%MathEngine* %0)                         ; inst 1
  %1 = call i32 @_3MoxJ9jWv8O_calculate_determinant(%MathEngine* %0)               ; inst 2
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                   ; inst 3
  %3 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                   ; inst 4
  %4 = load i32, i32* %3                                                           ; inst 5
  %5 = sext i32 %4 to i64                                                          ; inst 6
  %6 = getelementptr [50 x i32], [50 x i32]* %2, i32 0, i64 %5                     ; inst 7
  store i32 %1, i32* %6                                                            ; inst 8
  %7 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                   ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  %9 = add i32 %8, 1                                                               ; inst 11
  store i32 %9, i32* %7                                                            ; inst 12
  call void @_3MoxJ9jWv8O_matrix_operations_suite(%MathEngine* %0)                 ; inst 13
  call void @_3MoxJ9jWv8O_find_polynomial_roots(%MathEngine* %0)                   ; inst 14
  %10 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                  ; inst 15
  %11 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 16
  %12 = load i32, i32* %11                                                         ; inst 17
  %13 = sext i32 %12 to i64                                                        ; inst 18
  %14 = getelementptr [50 x i32], [50 x i32]* %10, i32 0, i64 %13                  ; inst 19
  %15 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                   ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  store i32 %16, i32* %14                                                          ; inst 22
  %17 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 23
  %18 = load i32, i32* %17                                                         ; inst 24
  %19 = add i32 %18, 1                                                             ; inst 25
  store i32 %19, i32* %17                                                          ; inst 26
  %20 = call i32 @_3MoxJ9jWv8O_trapezoidal_integration(%MathEngine* %0, i32 1)     ; inst 27
  %21 = call i32 @_3MoxJ9jWv8O_simpson_integration(%MathEngine* %0, i32 1)         ; inst 28
  %22 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 10                  ; inst 29
  %23 = getelementptr [10 x i32], [10 x i32]* %22, i32 0, i64 0                    ; inst 30
  store i32 %20, i32* %23                                                          ; inst 31
  %24 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 10                  ; inst 32
  %25 = getelementptr [10 x i32], [10 x i32]* %24, i32 0, i64 1                    ; inst 33
  store i32 %21, i32* %25                                                          ; inst 34
  call void @_3MoxJ9jWv8O_compute_fft(%MathEngine* %0)                             ; inst 35
  br label %_1.while.cond.0                                                        ; inst 36
_1.while.cond.0:
  %26 = phi i32 [0, %_0.entry.0], [%43, %_2.while.body.0]                          ; inst 37
  %27 = phi i32 [0, %_0.entry.0], [%42, %_2.while.body.0]                          ; inst 38
  %28 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 13                  ; inst 39
  %29 = load i32, i32* %28                                                         ; inst 40
  %30 = icmp slt i32 %26, %29                                                      ; inst 41
  br i1 %30, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 42
_2.while.body.0:
  %31 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 11                  ; inst 43
  %32 = sext i32 %26 to i64                                                        ; inst 44
  %33 = getelementptr [512 x i32], [512 x i32]* %31, i32 0, i64 %32                ; inst 45
  %34 = load i32, i32* %33                                                         ; inst 46
  %35 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 12                  ; inst 47
  %36 = sext i32 %26 to i64                                                        ; inst 48
  %37 = getelementptr [512 x i32], [512 x i32]* %35, i32 0, i64 %36                ; inst 49
  %38 = load i32, i32* %37                                                         ; inst 50
  %39 = mul i32 %34, %34                                                           ; inst 51
  %40 = mul i32 %38, %38                                                           ; inst 52
  %41 = add i32 %39, %40                                                           ; inst 53
  %42 = add i32 %27, %41                                                           ; inst 54
  %43 = add i32 %26, 1                                                             ; inst 55
  br label %_1.while.cond.0                                                        ; inst 56
_3.while.exit.0:
  %44 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                  ; inst 57
  %45 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 58
  %46 = load i32, i32* %45                                                         ; inst 59
  %47 = sext i32 %46 to i64                                                        ; inst 60
  %48 = getelementptr [50 x i32], [50 x i32]* %44, i32 0, i64 %47                  ; inst 61
  store i32 %27, i32* %48                                                          ; inst 62
  %49 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 63
  %50 = load i32, i32* %49                                                         ; inst 64
  %51 = add i32 %50, 1                                                             ; inst 65
  store i32 %51, i32* %49                                                          ; inst 66
  %52 = call i32 @_3MoxJ9jWv8O_prime_factorize(%MathEngine* %0, i32 12345)         ; inst 67
  %53 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                  ; inst 68
  %54 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 69
  %55 = load i32, i32* %54                                                         ; inst 70
  %56 = sext i32 %55 to i64                                                        ; inst 71
  %57 = getelementptr [50 x i32], [50 x i32]* %53, i32 0, i64 %56                  ; inst 72
  store i32 %52, i32* %57                                                          ; inst 73
  %58 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                  ; inst 74
  %59 = load i32, i32* %58                                                         ; inst 75
  %60 = add i32 %59, 1                                                             ; inst 76
  store i32 %60, i32* %58                                                          ; inst 77
  call void @_3MoxJ9jWv8O_calculate_moments(%MathEngine* %0)                       ; inst 78
  call void @_3MoxJ9jWv8O_output_comprehensive_results(%MathEngine* %0)            ; inst 79
  ret void                                                                         ; inst 80
}

define void @_3MoxJ9jWv8O_output_comprehensive_results(%MathEngine* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %2 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 22                   ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                   ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [50 x i32], [50 x i32]* %5, i32 0, i64 %6                     ; inst 9
  %8 = load i32, i32* %7                                                           ; inst 10
  call void @printlnInt(i32 %8)                                                    ; inst 11
  %9 = add i32 %1, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 14
_4.while.cond.1:
  %10 = phi i32 [0, %_3.while.exit.0], [%16, %_5.while.body.1]                     ; inst 15
  %11 = icmp slt i32 %10, 7                                                        ; inst 16
  br i1 %11, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 17
_5.while.body.1:
  %12 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 18
  %13 = sext i32 %10 to i64                                                        ; inst 19
  %14 = getelementptr [10 x i32], [10 x i32]* %12, i32 0, i64 %13                  ; inst 20
  %15 = load i32, i32* %14                                                         ; inst 21
  call void @printlnInt(i32 %15)                                                   ; inst 22
  %16 = add i32 %10, 1                                                             ; inst 23
  br label %_4.while.cond.1                                                        ; inst 24
_6.while.exit.1:
  %17 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 10                  ; inst 25
  %18 = getelementptr [10 x i32], [10 x i32]* %17, i32 0, i64 0                    ; inst 26
  %19 = load i32, i32* %18                                                         ; inst 27
  call void @printlnInt(i32 %19)                                                   ; inst 28
  %20 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 10                  ; inst 29
  %21 = getelementptr [10 x i32], [10 x i32]* %20, i32 0, i64 1                    ; inst 30
  %22 = load i32, i32* %21                                                         ; inst 31
  call void @printlnInt(i32 %22)                                                   ; inst 32
  br label %_7.while.cond.2                                                        ; inst 33
_7.while.cond.2:
  %23 = phi i32 [0, %_6.while.exit.1], [%33, %_11.while.body.2]                    ; inst 34
  %24 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 7                   ; inst 35
  %25 = load i32, i32* %24                                                         ; inst 36
  %26 = icmp slt i32 %23, %25                                                      ; inst 37
  br i1 %26, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 38
_8.lazy.then.0:
  %27 = icmp slt i32 %23, 5                                                        ; inst 39
  br label %_10.lazy.exit.0                                                        ; inst 40
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 41
_10.lazy.exit.0:
  %28 = phi i1 [%27, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 42
  br i1 %28, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 43
_11.while.body.2:
  %29 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 6                   ; inst 44
  %30 = sext i32 %23 to i64                                                        ; inst 45
  %31 = getelementptr [50 x i32], [50 x i32]* %29, i32 0, i64 %30                  ; inst 46
  %32 = load i32, i32* %31                                                         ; inst 47
  call void @printlnInt(i32 %32)                                                   ; inst 48
  %33 = add i32 %23, 1                                                             ; inst 49
  br label %_7.while.cond.2                                                        ; inst 50
_12.while.exit.2:
  %34 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 51
  %35 = load i32, i32* %34                                                         ; inst 52
  call void @printlnInt(i32 %35)                                                   ; inst 53
  %36 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 21                  ; inst 54
  %37 = getelementptr [50 x i32], [50 x i32]* %36, i32 0, i64 0                    ; inst 55
  %38 = load i32, i32* %37                                                         ; inst 56
  %39 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 57
  %40 = getelementptr [10 x i32], [10 x i32]* %39, i32 0, i64 0                    ; inst 58
  %41 = load i32, i32* %40                                                         ; inst 59
  %42 = add i32 %38, %41                                                           ; inst 60
  %43 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 10                  ; inst 61
  %44 = getelementptr [10 x i32], [10 x i32]* %43, i32 0, i64 0                    ; inst 62
  %45 = load i32, i32* %44                                                         ; inst 63
  %46 = add i32 %42, %45                                                           ; inst 64
  %47 = sdiv i32 %46, 3                                                            ; inst 65
  call void @printlnInt(i32 %47)                                                   ; inst 66
  ret void                                                                         ; inst 67
}

define void @main() {
_0.entry.0:
  %0 = alloca %MathEngine                                                          ; inst 1
  call void @_3MoxJ9jWv8O_new(%MathEngine* %0)                                     ; inst 2
  %1 = call i32 @getInt()                                                          ; inst 3
  call void @_3MoxJ9jWv8O_initialize_matrices(%MathEngine* %0, i32 %1)             ; inst 4
  %2 = call i32 @getInt()                                                          ; inst 5
  call void @_3MoxJ9jWv8O_initialize_polynomial(%MathEngine* %0, i32 %2)           ; inst 6
  %3 = call i32 @getInt()                                                          ; inst 7
  call void @_3MoxJ9jWv8O_initialize_function_data(%MathEngine* %0, i32 %3)        ; inst 8
  %4 = call i32 @getInt()                                                          ; inst 9
  call void @_3MoxJ9jWv8O_initialize_fft_data(%MathEngine* %0, i32 %4)             ; inst 10
  %5 = call i32 @getInt()                                                          ; inst 11
  call void @_3MoxJ9jWv8O_initialize_data_series(%MathEngine* %0, i32 %5)          ; inst 12
  %6 = call i32 @getInt()                                                          ; inst 13
  call void @_3MoxJ9jWv8O_generate_primes(%MathEngine* %0, i32 %6)                 ; inst 14
  call void @_3MoxJ9jWv8O_perform_comprehensive_analysis(%MathEngine* %0)          ; inst 15
  %7 = call i32 @getInt()                                                          ; inst 16
  br label %_1.while.cond.0                                                        ; inst 17
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%36, %_5.while.exit.1]                           ; inst 18
  %9 = phi i32 [0, %_0.entry.0], [%35, %_5.while.exit.1]                           ; inst 19
  %10 = icmp slt i32 %8, %7                                                        ; inst 20
  br i1 %10, label %_2.while.body.0, label %_6.while.exit.0                        ; inst 21
_2.while.body.0:
  %11 = mul i32 %8, 13                                                             ; inst 22
  %12 = add i32 %11, 7                                                             ; inst 23
  %13 = srem i32 %12, 100                                                          ; inst 24
  br label %_3.while.cond.1                                                        ; inst 25
_3.while.cond.1:
  %14 = phi i32 [0, %_2.while.body.0], [%27, %_4.while.body.1]                     ; inst 26
  %15 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 18                  ; inst 27
  %16 = load i32, i32* %15                                                         ; inst 28
  %17 = icmp slt i32 %14, %16                                                      ; inst 29
  br i1 %17, label %_4.while.body.1, label %_5.while.exit.1                        ; inst 30
_4.while.body.1:
  %18 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 31
  %19 = sext i32 %14 to i64                                                        ; inst 32
  %20 = getelementptr [2000 x i32], [2000 x i32]* %18, i32 0, i64 %19              ; inst 33
  %21 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 17                  ; inst 34
  %22 = sext i32 %14 to i64                                                        ; inst 35
  %23 = getelementptr [2000 x i32], [2000 x i32]* %21, i32 0, i64 %22              ; inst 36
  %24 = load i32, i32* %23                                                         ; inst 37
  %25 = add i32 %24, %13                                                           ; inst 38
  %26 = srem i32 %25, 10000                                                        ; inst 39
  store i32 %26, i32* %20                                                          ; inst 40
  %27 = add i32 %14, 1                                                             ; inst 41
  br label %_3.while.cond.1                                                        ; inst 42
_5.while.exit.1:
  call void @_3MoxJ9jWv8O_calculate_moments(%MathEngine* %0)                       ; inst 43
  %28 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 44
  %29 = getelementptr [10 x i32], [10 x i32]* %28, i32 0, i64 0                    ; inst 45
  %30 = load i32, i32* %29                                                         ; inst 46
  %31 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 19                  ; inst 47
  %32 = getelementptr [10 x i32], [10 x i32]* %31, i32 0, i64 1                    ; inst 48
  %33 = load i32, i32* %32                                                         ; inst 49
  %34 = add i32 %30, %33                                                           ; inst 50
  %35 = add i32 %9, %34                                                            ; inst 51
  %36 = add i32 %8, 1                                                              ; inst 52
  call void @printlnInt(i32 %36)                                                   ; inst 53
  br label %_1.while.cond.0                                                        ; inst 54
_6.while.exit.0:
  call void @printlnInt(i32 %9)                                                    ; inst 55
  %37 = getelementptr %MathEngine, %MathEngine* %0, i32 0, i32 15                  ; inst 56
  %38 = load i32, i32* %37                                                         ; inst 57
  %39 = mul i32 %9, %38                                                            ; inst 58
  %40 = add i32 %7, 1                                                              ; inst 59
  %41 = sdiv i32 %39, %40                                                          ; inst 60
  call void @printlnInt(i32 %41)                                                   ; inst 61
  call void @exit(i32 0)                                                           ; inst 62
  ret void                                                                         ; inst 63
}

