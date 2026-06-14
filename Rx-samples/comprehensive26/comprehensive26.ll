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
  call void @printlnInt(i32 26000)                                                 ; inst 1
  call void @performBPlusTreeOperations(i32 500)                                   ; inst 2
  call void @performQueryExecutionTest(i32 1000)                                   ; inst 3
  call void @performTransactionProcessingTest(i32 50)                              ; inst 4
  call void @performBufferPoolTest(i32 100)                                        ; inst 5
  call void @performQueryOptimizationTest(i32 1000)                                ; inst 6
  call void @performHashTableTest(i32 1000)                                        ; inst 7
  call void @printlnInt(i32 26999)                                                 ; inst 8
  call void @exit(i32 0)                                                           ; inst 9
  ret void                                                                         ; inst 10
}

define void @performBPlusTreeOperations(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 26001)                                                 ; inst 1
  %1 = alloca [100 x [10 x i32]]                                                   ; inst 2
  %2 = alloca [10 x i32]                                                           ; inst 3
  %3 = getelementptr [10 x i32], [10 x i32]* %2, i32 0, i32 0                      ; inst 4
  br label %_1.array.cond.0                                                        ; inst 5
_1.array.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%7, %_2.array.body.0]                            ; inst 6
  %5 = icmp slt i32 %4, 10                                                         ; inst 7
  br i1 %5, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 8
_2.array.body.0:
  %6 = getelementptr i32, i32* %3, i32 %4                                          ; inst 9
  store i32 0, i32* %6                                                             ; inst 10
  %7 = add i32 %4, 1                                                               ; inst 11
  br label %_1.array.cond.0                                                        ; inst 12
_3.array.exit.0:
  %8 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i32 0      ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 100                                                       ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr [10 x i32], [10 x i32]* %8, i32 %9                           ; inst 18
  call void @memcpy([10 x i32]* %11, [10 x i32]* %2, i64 40)                       ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [100 x [11 x i32]]                                                  ; inst 22
  %14 = alloca [11 x i32]                                                          ; inst 23
  %15 = getelementptr [11 x i32], [11 x i32]* %14, i32 0, i32 0                    ; inst 24
  br label %_7.array.cond.2                                                        ; inst 25
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 26
  %17 = icmp slt i32 %16, 11                                                       ; inst 27
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 28
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 29
  store i32 -1, i32* %18                                                           ; inst 30
  %19 = add i32 %16, 1                                                             ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_9.array.exit.2:
  %20 = getelementptr [100 x [11 x i32]], [100 x [11 x i32]]* %13, i32 0, i32 0    ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 35
  %22 = icmp slt i32 %21, 100                                                      ; inst 36
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %23 = getelementptr [11 x i32], [11 x i32]* %20, i32 %21                         ; inst 38
  call void @memcpy([11 x i32]* %23, [11 x i32]* %14, i64 44)                      ; inst 39
  %24 = add i32 %21, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %25 = alloca [100 x i32]                                                         ; inst 42
  %26 = getelementptr [100 x i32], [100 x i32]* %25, i32 0, i32 0                  ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 45
  %28 = icmp slt i32 %27, 100                                                      ; inst 46
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %29 = getelementptr i32, i32* %26, i32 %27                                       ; inst 48
  store i32 -1, i32* %29                                                           ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %31 = alloca [100 x i1]                                                          ; inst 52
  %32 = getelementptr [100 x i1], [100 x i1]* %31, i32 0, i32 0                    ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 55
  %34 = icmp slt i32 %33, 100                                                      ; inst 56
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %35 = getelementptr i1, i1* %32, i32 %33                                         ; inst 58
  store i1 0, i1* %35                                                              ; inst 59
  %36 = add i32 %33, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  %37 = alloca [100 x i32]                                                         ; inst 62
  %38 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i32 0                  ; inst 63
  br label %_19.array.cond.6                                                       ; inst 64
_19.array.cond.6:
  %39 = phi i32 [0, %_18.array.exit.5], [%42, %_20.array.body.6]                   ; inst 65
  %40 = icmp slt i32 %39, 100                                                      ; inst 66
  br i1 %40, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 67
_20.array.body.6:
  %41 = getelementptr i32, i32* %38, i32 %39                                       ; inst 68
  store i32 0, i32* %41                                                            ; inst 69
  %42 = add i32 %39, 1                                                             ; inst 70
  br label %_19.array.cond.6                                                       ; inst 71
_21.array.exit.6:
  %43 = getelementptr [100 x i1], [100 x i1]* %31, i32 0, i64 0                    ; inst 72
  store i1 1, i1* %43                                                              ; inst 73
  %44 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 0                  ; inst 74
  store i32 0, i32* %44                                                            ; inst 75
  %45 = alloca [100 x i32]                                                         ; inst 76
  %46 = getelementptr [100 x i32], [100 x i32]* %45, i32 0, i32 0                  ; inst 77
  br label %_22.array.cond.7                                                       ; inst 78
_22.array.cond.7:
  %47 = phi i32 [0, %_21.array.exit.6], [%50, %_23.array.body.7]                   ; inst 79
  %48 = icmp slt i32 %47, 100                                                      ; inst 80
  br i1 %48, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 81
_23.array.body.7:
  %49 = getelementptr i32, i32* %46, i32 %47                                       ; inst 82
  store i32 0, i32* %49                                                            ; inst 83
  %50 = add i32 %47, 1                                                             ; inst 84
  br label %_22.array.cond.7                                                       ; inst 85
_24.array.exit.7:
  br label %_25.while.cond.0                                                       ; inst 86
_25.while.cond.0:
  %51 = phi i32 [0, %_24.array.exit.7], [%61, %_29.while.body.0]                   ; inst 87
  %52 = icmp slt i32 %51, %0                                                       ; inst 88
  br i1 %52, label %_26.lazy.then.0, label %_27.lazy.else.0                        ; inst 89
_26.lazy.then.0:
  %53 = icmp slt i32 %51, 100                                                      ; inst 90
  br label %_28.lazy.exit.0                                                        ; inst 91
_27.lazy.else.0:
  br label %_28.lazy.exit.0                                                        ; inst 92
_28.lazy.exit.0:
  %54 = phi i1 [%53, %_26.lazy.then.0], [0, %_27.lazy.else.0]                      ; inst 93
  br i1 %54, label %_29.while.body.0, label %_30.while.exit.0                      ; inst 94
_29.while.body.0:
  %55 = sext i32 %51 to i64                                                        ; inst 95
  %56 = getelementptr [100 x i32], [100 x i32]* %45, i32 0, i64 %55                ; inst 96
  %57 = mul i32 %51, 17                                                            ; inst 97
  %58 = add i32 %57, 23                                                            ; inst 98
  %59 = srem i32 %58, 997                                                          ; inst 99
  %60 = add i32 %59, 1                                                             ; inst 100
  store i32 %60, i32* %56                                                          ; inst 101
  %61 = add i32 %51, 1                                                             ; inst 102
  br label %_25.while.cond.0                                                       ; inst 103
_30.while.exit.0:
  br label %_31.while.cond.1                                                       ; inst 104
_31.while.cond.1:
  %62 = phi i32 [1, %_30.while.exit.0], [%236, %_89.if.exit.1]                     ; inst 105
  %63 = phi i32 [0, %_30.while.exit.0], [%237, %_89.if.exit.1]                     ; inst 106
  %64 = icmp slt i32 %63, %0                                                       ; inst 107
  br i1 %64, label %_32.lazy.then.1, label %_33.lazy.else.1                        ; inst 108
_32.lazy.then.1:
  %65 = icmp slt i32 %63, 100                                                      ; inst 109
  br label %_34.lazy.exit.1                                                        ; inst 110
_33.lazy.else.1:
  br label %_34.lazy.exit.1                                                        ; inst 111
_34.lazy.exit.1:
  %66 = phi i1 [%65, %_32.lazy.then.1], [0, %_33.lazy.else.1]                      ; inst 112
  br i1 %66, label %_35.while.body.1, label %_90.while.exit.1                      ; inst 113
_35.while.body.1:
  %67 = sext i32 %63 to i64                                                        ; inst 114
  %68 = getelementptr [100 x i32], [100 x i32]* %45, i32 0, i64 %67                ; inst 115
  %69 = load i32, i32* %68                                                         ; inst 116
  br label %_36.while.cond.2                                                       ; inst 117
_36.while.cond.2:
  %70 = phi i32 [0, %_35.while.body.1], [%94, %_43.while.exit.3]                   ; inst 118
  %71 = sext i32 %70 to i64                                                        ; inst 119
  %72 = getelementptr [100 x i1], [100 x i1]* %31, i32 0, i64 %71                  ; inst 120
  %73 = load i1, i1* %72                                                           ; inst 121
  %74 = icmp eq i1 %73, 0                                                          ; inst 122
  br i1 %74, label %_37.while.body.2, label %_44.while.exit.2                      ; inst 123
_37.while.body.2:
  br label %_38.while.cond.3                                                       ; inst 124
_38.while.cond.3:
  %75 = phi i32 [0, %_37.while.body.2], [%88, %_42.if.exit.0]                      ; inst 125
  %76 = phi i32 [0, %_37.while.body.2], [%89, %_42.if.exit.0]                      ; inst 126
  %77 = sext i32 %70 to i64                                                        ; inst 127
  %78 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %77                ; inst 128
  %79 = load i32, i32* %78                                                         ; inst 129
  %80 = icmp slt i32 %76, %79                                                      ; inst 130
  br i1 %80, label %_39.while.body.3, label %_43.while.exit.3                      ; inst 131
_39.while.body.3:
  %81 = sext i32 %70 to i64                                                        ; inst 132
  %82 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %81   ; inst 133
  %83 = sext i32 %76 to i64                                                        ; inst 134
  %84 = getelementptr [10 x i32], [10 x i32]* %82, i32 0, i64 %83                  ; inst 135
  %85 = load i32, i32* %84                                                         ; inst 136
  %86 = icmp sgt i32 %69, %85                                                      ; inst 137
  br i1 %86, label %_40.if.then.0, label %_41.if.else.0                            ; inst 138
_40.if.then.0:
  %87 = add i32 %76, 1                                                             ; inst 139
  br label %_42.if.exit.0                                                          ; inst 140
_41.if.else.0:
  br label %_42.if.exit.0                                                          ; inst 141
_42.if.exit.0:
  %88 = phi i32 [%87, %_40.if.then.0], [%75, %_41.if.else.0]                       ; inst 142
  %89 = add i32 %76, 1                                                             ; inst 143
  br label %_38.while.cond.3                                                       ; inst 144
_43.while.exit.3:
  %90 = sext i32 %70 to i64                                                        ; inst 145
  %91 = getelementptr [100 x [11 x i32]], [100 x [11 x i32]]* %13, i32 0, i64 %90  ; inst 146
  %92 = sext i32 %75 to i64                                                        ; inst 147
  %93 = getelementptr [11 x i32], [11 x i32]* %91, i32 0, i64 %92                  ; inst 148
  %94 = load i32, i32* %93                                                         ; inst 149
  br label %_36.while.cond.2                                                       ; inst 150
_44.while.exit.2:
  %95 = sext i32 %70 to i64                                                        ; inst 151
  %96 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %95                ; inst 152
  %97 = load i32, i32* %96                                                         ; inst 153
  %98 = icmp slt i32 %97, 9                                                        ; inst 154
  br i1 %98, label %_45.if.then.1, label %_55.if.else.1                            ; inst 155
_45.if.then.1:
  %99 = sext i32 %70 to i64                                                        ; inst 156
  %100 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %99               ; inst 157
  %101 = load i32, i32* %100                                                       ; inst 158
  br label %_46.while.cond.4                                                       ; inst 159
_46.while.cond.4:
  %102 = phi i32 [0, %_45.if.then.1], [%113, %_50.if.exit.2]                       ; inst 160
  %103 = sext i32 %70 to i64                                                       ; inst 161
  %104 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %103              ; inst 162
  %105 = load i32, i32* %104                                                       ; inst 163
  %106 = icmp slt i32 %102, %105                                                   ; inst 164
  br i1 %106, label %_47.while.body.4, label %_97.critical_edge.0                  ; inst 165
_47.while.body.4:
  %107 = sext i32 %70 to i64                                                       ; inst 166
  %108 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %107 ; inst 167
  %109 = sext i32 %102 to i64                                                      ; inst 168
  %110 = getelementptr [10 x i32], [10 x i32]* %108, i32 0, i64 %109               ; inst 169
  %111 = load i32, i32* %110                                                       ; inst 170
  %112 = icmp slt i32 %69, %111                                                    ; inst 171
  br i1 %112, label %_48.if.then.2, label %_49.if.else.2                           ; inst 172
_48.if.then.2:
  br label %_51.while.exit.4                                                       ; inst 173
_49.if.else.2:
  br label %_50.if.exit.2                                                          ; inst 174
_50.if.exit.2:
  %113 = add i32 %102, 1                                                           ; inst 175
  br label %_46.while.cond.4                                                       ; inst 176
_51.while.exit.4:
  %114 = phi i32 [%101, %_97.critical_edge.0], [%102, %_48.if.then.2]              ; inst 177
  %115 = sext i32 %70 to i64                                                       ; inst 178
  %116 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %115              ; inst 179
  %117 = load i32, i32* %116                                                       ; inst 180
  br label %_52.while.cond.5                                                       ; inst 181
_52.while.cond.5:
  %118 = phi i32 [%117, %_51.while.exit.4], [%130, %_53.while.body.5]              ; inst 182
  %119 = icmp sgt i32 %118, %114                                                   ; inst 183
  br i1 %119, label %_53.while.body.5, label %_54.while.exit.5                     ; inst 184
_53.while.body.5:
  %120 = sext i32 %70 to i64                                                       ; inst 185
  %121 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %120 ; inst 186
  %122 = sext i32 %118 to i64                                                      ; inst 187
  %123 = getelementptr [10 x i32], [10 x i32]* %121, i32 0, i64 %122               ; inst 188
  %124 = sext i32 %70 to i64                                                       ; inst 189
  %125 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %124 ; inst 190
  %126 = sext i32 %118 to i64                                                      ; inst 191
  %127 = sub i64 %126, 1                                                           ; inst 192
  %128 = getelementptr [10 x i32], [10 x i32]* %125, i32 0, i64 %127               ; inst 193
  %129 = load i32, i32* %128                                                       ; inst 194
  store i32 %129, i32* %123                                                        ; inst 195
  %130 = sub i32 %118, 1                                                           ; inst 196
  br label %_52.while.cond.5                                                       ; inst 197
_54.while.exit.5:
  %131 = sext i32 %70 to i64                                                       ; inst 198
  %132 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %131 ; inst 199
  %133 = sext i32 %114 to i64                                                      ; inst 200
  %134 = getelementptr [10 x i32], [10 x i32]* %132, i32 0, i64 %133               ; inst 201
  store i32 %69, i32* %134                                                         ; inst 202
  %135 = sext i32 %70 to i64                                                       ; inst 203
  %136 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %135              ; inst 204
  %137 = sext i32 %70 to i64                                                       ; inst 205
  %138 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %137              ; inst 206
  %139 = load i32, i32* %138                                                       ; inst 207
  %140 = add i32 %139, 1                                                           ; inst 208
  store i32 %140, i32* %136                                                        ; inst 209
  br label %_89.if.exit.1                                                          ; inst 210
_55.if.else.1:
  %141 = icmp slt i32 %62, 99                                                      ; inst 211
  br i1 %141, label %_56.if.then.3, label %_87.if.else.3                           ; inst 212
_56.if.then.3:
  %142 = add i32 %62, 1                                                            ; inst 213
  %143 = sext i32 %62 to i64                                                       ; inst 214
  %144 = getelementptr [100 x i1], [100 x i1]* %31, i32 0, i64 %143                ; inst 215
  store i1 1, i1* %144                                                             ; inst 216
  %145 = sext i32 %62 to i64                                                       ; inst 217
  %146 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %145              ; inst 218
  store i32 5, i32* %146                                                           ; inst 219
  %147 = sext i32 %62 to i64                                                       ; inst 220
  %148 = getelementptr [100 x i32], [100 x i32]* %25, i32 0, i64 %147              ; inst 221
  %149 = sext i32 %70 to i64                                                       ; inst 222
  %150 = getelementptr [100 x i32], [100 x i32]* %25, i32 0, i64 %149              ; inst 223
  %151 = load i32, i32* %150                                                       ; inst 224
  store i32 %151, i32* %148                                                        ; inst 225
  br label %_57.while.cond.6                                                       ; inst 226
_57.while.cond.6:
  %152 = phi i32 [0, %_56.if.then.3], [%169, %_58.while.body.6]                    ; inst 227
  %153 = icmp slt i32 %152, 5                                                      ; inst 228
  br i1 %153, label %_58.while.body.6, label %_59.while.exit.6                     ; inst 229
_58.while.body.6:
  %154 = sext i32 %62 to i64                                                       ; inst 230
  %155 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %154 ; inst 231
  %156 = sext i32 %152 to i64                                                      ; inst 232
  %157 = getelementptr [10 x i32], [10 x i32]* %155, i32 0, i64 %156               ; inst 233
  %158 = sext i32 %70 to i64                                                       ; inst 234
  %159 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %158 ; inst 235
  %160 = sext i32 %152 to i64                                                      ; inst 236
  %161 = add i64 %160, 5                                                           ; inst 237
  %162 = getelementptr [10 x i32], [10 x i32]* %159, i32 0, i64 %161               ; inst 238
  %163 = load i32, i32* %162                                                       ; inst 239
  store i32 %163, i32* %157                                                        ; inst 240
  %164 = sext i32 %70 to i64                                                       ; inst 241
  %165 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %164 ; inst 242
  %166 = sext i32 %152 to i64                                                      ; inst 243
  %167 = add i64 %166, 5                                                           ; inst 244
  %168 = getelementptr [10 x i32], [10 x i32]* %165, i32 0, i64 %167               ; inst 245
  store i32 0, i32* %168                                                           ; inst 246
  %169 = add i32 %152, 1                                                           ; inst 247
  br label %_57.while.cond.6                                                       ; inst 248
_59.while.exit.6:
  %170 = sext i32 %70 to i64                                                       ; inst 249
  %171 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %170              ; inst 250
  store i32 5, i32* %171                                                           ; inst 251
  %172 = sext i32 %62 to i64                                                       ; inst 252
  %173 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %172 ; inst 253
  %174 = getelementptr [10 x i32], [10 x i32]* %173, i32 0, i64 0                  ; inst 254
  %175 = load i32, i32* %174                                                       ; inst 255
  %176 = icmp slt i32 %69, %175                                                    ; inst 256
  br i1 %176, label %_60.if.then.4, label %_73.if.else.4                           ; inst 257
_60.if.then.4:
  br label %_61.while.cond.7                                                       ; inst 258
_61.while.cond.7:
  %177 = phi i32 [0, %_60.if.then.4], [%185, %_65.if.exit.5]                       ; inst 259
  %178 = icmp slt i32 %177, 5                                                      ; inst 260
  br i1 %178, label %_62.while.body.7, label %_98.critical_edge.1                  ; inst 261
_62.while.body.7:
  %179 = sext i32 %70 to i64                                                       ; inst 262
  %180 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %179 ; inst 263
  %181 = sext i32 %177 to i64                                                      ; inst 264
  %182 = getelementptr [10 x i32], [10 x i32]* %180, i32 0, i64 %181               ; inst 265
  %183 = load i32, i32* %182                                                       ; inst 266
  %184 = icmp slt i32 %69, %183                                                    ; inst 267
  br i1 %184, label %_63.if.then.5, label %_64.if.else.5                           ; inst 268
_63.if.then.5:
  br label %_66.while.exit.7                                                       ; inst 269
_64.if.else.5:
  br label %_65.if.exit.5                                                          ; inst 270
_65.if.exit.5:
  %185 = add i32 %177, 1                                                           ; inst 271
  br label %_61.while.cond.7                                                       ; inst 272
_66.while.exit.7:
  %186 = phi i32 [5, %_98.critical_edge.1], [%177, %_63.if.then.5]                 ; inst 273
  br label %_67.while.cond.8                                                       ; inst 274
_67.while.cond.8:
  %187 = phi i32 [4, %_66.while.exit.7], [%200, %_71.if.exit.6]                    ; inst 275
  %188 = icmp sge i32 %187, %186                                                   ; inst 276
  br i1 %188, label %_68.while.body.8, label %_99.critical_edge.2                  ; inst 277
_68.while.body.8:
  %189 = sext i32 %70 to i64                                                       ; inst 278
  %190 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %189 ; inst 279
  %191 = sext i32 %187 to i64                                                      ; inst 280
  %192 = add i64 %191, 1                                                           ; inst 281
  %193 = getelementptr [10 x i32], [10 x i32]* %190, i32 0, i64 %192               ; inst 282
  %194 = sext i32 %70 to i64                                                       ; inst 283
  %195 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %194 ; inst 284
  %196 = sext i32 %187 to i64                                                      ; inst 285
  %197 = getelementptr [10 x i32], [10 x i32]* %195, i32 0, i64 %196               ; inst 286
  %198 = load i32, i32* %197                                                       ; inst 287
  store i32 %198, i32* %193                                                        ; inst 288
  %199 = icmp eq i32 %187, 0                                                       ; inst 289
  br i1 %199, label %_69.if.then.6, label %_70.if.else.6                           ; inst 290
_69.if.then.6:
  br label %_72.while.exit.8                                                       ; inst 291
_70.if.else.6:
  br label %_71.if.exit.6                                                          ; inst 292
_71.if.exit.6:
  %200 = sub i32 %187, 1                                                           ; inst 293
  br label %_67.while.cond.8                                                       ; inst 294
_72.while.exit.8:
  %201 = sext i32 %70 to i64                                                       ; inst 295
  %202 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %201 ; inst 296
  %203 = sext i32 %186 to i64                                                      ; inst 297
  %204 = getelementptr [10 x i32], [10 x i32]* %202, i32 0, i64 %203               ; inst 298
  store i32 %69, i32* %204                                                         ; inst 299
  br label %_86.if.exit.4                                                          ; inst 300
_73.if.else.4:
  br label %_74.while.cond.9                                                       ; inst 301
_74.while.cond.9:
  %205 = phi i32 [0, %_73.if.else.4], [%213, %_78.if.exit.7]                       ; inst 302
  %206 = icmp slt i32 %205, 5                                                      ; inst 303
  br i1 %206, label %_75.while.body.9, label %_100.critical_edge.3                 ; inst 304
_75.while.body.9:
  %207 = sext i32 %62 to i64                                                       ; inst 305
  %208 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %207 ; inst 306
  %209 = sext i32 %205 to i64                                                      ; inst 307
  %210 = getelementptr [10 x i32], [10 x i32]* %208, i32 0, i64 %209               ; inst 308
  %211 = load i32, i32* %210                                                       ; inst 309
  %212 = icmp slt i32 %69, %211                                                    ; inst 310
  br i1 %212, label %_76.if.then.7, label %_77.if.else.7                           ; inst 311
_76.if.then.7:
  br label %_79.while.exit.9                                                       ; inst 312
_77.if.else.7:
  br label %_78.if.exit.7                                                          ; inst 313
_78.if.exit.7:
  %213 = add i32 %205, 1                                                           ; inst 314
  br label %_74.while.cond.9                                                       ; inst 315
_79.while.exit.9:
  %214 = phi i32 [5, %_100.critical_edge.3], [%205, %_76.if.then.7]                ; inst 316
  br label %_80.while.cond.10                                                      ; inst 317
_80.while.cond.10:
  %215 = phi i32 [4, %_79.while.exit.9], [%228, %_84.if.exit.8]                    ; inst 318
  %216 = icmp sge i32 %215, %214                                                   ; inst 319
  br i1 %216, label %_81.while.body.10, label %_101.critical_edge.4                ; inst 320
_81.while.body.10:
  %217 = sext i32 %62 to i64                                                       ; inst 321
  %218 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %217 ; inst 322
  %219 = sext i32 %215 to i64                                                      ; inst 323
  %220 = add i64 %219, 1                                                           ; inst 324
  %221 = getelementptr [10 x i32], [10 x i32]* %218, i32 0, i64 %220               ; inst 325
  %222 = sext i32 %62 to i64                                                       ; inst 326
  %223 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %222 ; inst 327
  %224 = sext i32 %215 to i64                                                      ; inst 328
  %225 = getelementptr [10 x i32], [10 x i32]* %223, i32 0, i64 %224               ; inst 329
  %226 = load i32, i32* %225                                                       ; inst 330
  store i32 %226, i32* %221                                                        ; inst 331
  %227 = icmp eq i32 %215, 0                                                       ; inst 332
  br i1 %227, label %_82.if.then.8, label %_83.if.else.8                           ; inst 333
_82.if.then.8:
  br label %_85.while.exit.10                                                      ; inst 334
_83.if.else.8:
  br label %_84.if.exit.8                                                          ; inst 335
_84.if.exit.8:
  %228 = sub i32 %215, 1                                                           ; inst 336
  br label %_80.while.cond.10                                                      ; inst 337
_85.while.exit.10:
  %229 = sext i32 %62 to i64                                                       ; inst 338
  %230 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %1, i32 0, i64 %229 ; inst 339
  %231 = sext i32 %214 to i64                                                      ; inst 340
  %232 = getelementptr [10 x i32], [10 x i32]* %230, i32 0, i64 %231               ; inst 341
  store i32 %69, i32* %232                                                         ; inst 342
  %233 = sext i32 %62 to i64                                                       ; inst 343
  %234 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %233              ; inst 344
  store i32 6, i32* %234                                                           ; inst 345
  br label %_86.if.exit.4                                                          ; inst 346
_86.if.exit.4:
  br label %_88.if.exit.3                                                          ; inst 347
_87.if.else.3:
  br label %_88.if.exit.3                                                          ; inst 348
_88.if.exit.3:
  %235 = phi i32 [%142, %_86.if.exit.4], [%62, %_87.if.else.3]                     ; inst 349
  br label %_89.if.exit.1                                                          ; inst 350
_89.if.exit.1:
  %236 = phi i32 [%62, %_54.while.exit.5], [%235, %_88.if.exit.3]                  ; inst 351
  %237 = add i32 %63, 1                                                            ; inst 352
  br label %_31.while.cond.1                                                       ; inst 353
_90.while.exit.1:
  br label %_91.while.cond.11                                                      ; inst 354
_91.while.cond.11:
  %238 = phi i32 [0, %_90.while.exit.1], [%255, %_95.while.body.11]                ; inst 355
  %239 = phi i32 [0, %_90.while.exit.1], [%254, %_95.while.body.11]                ; inst 356
  %240 = phi i32 [0, %_90.while.exit.1], [%256, %_95.while.body.11]                ; inst 357
  %241 = icmp slt i32 %240, 20                                                     ; inst 358
  br i1 %241, label %_92.lazy.then.2, label %_93.lazy.else.2                       ; inst 359
_92.lazy.then.2:
  %242 = icmp slt i32 %238, 100                                                    ; inst 360
  br label %_94.lazy.exit.2                                                        ; inst 361
_93.lazy.else.2:
  br label %_94.lazy.exit.2                                                        ; inst 362
_94.lazy.exit.2:
  %243 = phi i1 [%242, %_92.lazy.then.2], [0, %_93.lazy.else.2]                    ; inst 363
  br i1 %243, label %_95.while.body.11, label %_96.while.exit.11                   ; inst 364
_95.while.body.11:
  %244 = mul i32 %240, 13                                                          ; inst 365
  %245 = add i32 %244, 7                                                           ; inst 366
  %246 = srem i32 %245, 500                                                        ; inst 367
  %247 = add i32 %246, 1                                                           ; inst 368
  %248 = mul i32 %240, 3                                                           ; inst 369
  %249 = add i32 %248, 1                                                           ; inst 370
  %250 = srem i32 %249, 50                                                         ; inst 371
  %251 = add i32 %247, %250                                                        ; inst 372
  %252 = add i32 %251, 10                                                          ; inst 373
  %253 = call i32 @performRangeQuery([100 x [10 x i32]]* %1, [100 x [11 x i32]]* %13, [100 x i1]* %31, [100 x i32]* %37, i32 0, i32 %247, i32 %252) ; inst 374
  %254 = add i32 %239, %253                                                        ; inst 375
  %255 = add i32 %238, 1                                                           ; inst 376
  %256 = add i32 %240, 1                                                           ; inst 377
  br label %_91.while.cond.11                                                      ; inst 378
_96.while.exit.11:
  %257 = srem i32 %239, 10000                                                      ; inst 379
  call void @printlnInt(i32 %257)                                                  ; inst 380
  call void @printlnInt(i32 26002)                                                 ; inst 381
  ret void                                                                         ; inst 382
_97.critical_edge.0:
  br label %_51.while.exit.4                                                       ; inst 383
_98.critical_edge.1:
  br label %_66.while.exit.7                                                       ; inst 384
_99.critical_edge.2:
  br label %_72.while.exit.8                                                       ; inst 385
_100.critical_edge.3:
  br label %_79.while.exit.9                                                       ; inst 386
_101.critical_edge.4:
  br label %_85.while.exit.10                                                      ; inst 387
}

define i32 @performRangeQuery([100 x [10 x i32]]* %0, [100 x [11 x i32]]* %1, [100 x i1]* %2, [100 x i32]* %3, i32 %4, i32 %5, i32 %6) {
_0.entry.0:
  %7 = sext i32 %4 to i64                                                          ; inst 1
  %8 = getelementptr [100 x i1], [100 x i1]* %2, i32 0, i64 %7                     ; inst 2
  %9 = load i1, i1* %8                                                             ; inst 3
  br i1 %9, label %_1.if.then.0, label %_11.if.else.0                              ; inst 4
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 5
_2.while.cond.0:
  %10 = phi i32 [0, %_1.if.then.0], [%36, %_9.if.exit.1]                           ; inst 6
  %11 = phi i32 [0, %_1.if.then.0], [%35, %_9.if.exit.1]                           ; inst 7
  %12 = sext i32 %4 to i64                                                         ; inst 8
  %13 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %12                 ; inst 9
  %14 = load i32, i32* %13                                                         ; inst 10
  %15 = icmp slt i32 %10, %14                                                      ; inst 11
  br i1 %15, label %_3.while.body.0, label %_10.while.exit.0                       ; inst 12
_3.while.body.0:
  %16 = sext i32 %4 to i64                                                         ; inst 13
  %17 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %0, i32 0, i64 %16   ; inst 14
  %18 = sext i32 %10 to i64                                                        ; inst 15
  %19 = getelementptr [10 x i32], [10 x i32]* %17, i32 0, i64 %18                  ; inst 16
  %20 = load i32, i32* %19                                                         ; inst 17
  %21 = icmp sge i32 %20, %5                                                       ; inst 18
  br i1 %21, label %_4.lazy.then.0, label %_5.lazy.else.0                          ; inst 19
_4.lazy.then.0:
  %22 = sext i32 %4 to i64                                                         ; inst 20
  %23 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %0, i32 0, i64 %22   ; inst 21
  %24 = sext i32 %10 to i64                                                        ; inst 22
  %25 = getelementptr [10 x i32], [10 x i32]* %23, i32 0, i64 %24                  ; inst 23
  %26 = load i32, i32* %25                                                         ; inst 24
  %27 = icmp sle i32 %26, %6                                                       ; inst 25
  br label %_6.lazy.exit.0                                                         ; inst 26
_5.lazy.else.0:
  br label %_6.lazy.exit.0                                                         ; inst 27
_6.lazy.exit.0:
  %28 = phi i1 [%27, %_4.lazy.then.0], [0, %_5.lazy.else.0]                        ; inst 28
  br i1 %28, label %_7.if.then.1, label %_8.if.else.1                              ; inst 29
_7.if.then.1:
  %29 = sext i32 %4 to i64                                                         ; inst 30
  %30 = getelementptr [100 x [10 x i32]], [100 x [10 x i32]]* %0, i32 0, i64 %29   ; inst 31
  %31 = sext i32 %10 to i64                                                        ; inst 32
  %32 = getelementptr [10 x i32], [10 x i32]* %30, i32 0, i64 %31                  ; inst 33
  %33 = load i32, i32* %32                                                         ; inst 34
  %34 = add i32 %11, %33                                                           ; inst 35
  br label %_9.if.exit.1                                                           ; inst 36
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 37
_9.if.exit.1:
  %35 = phi i32 [%34, %_7.if.then.1], [%11, %_8.if.else.1]                         ; inst 38
  %36 = add i32 %10, 1                                                             ; inst 39
  br label %_2.while.cond.0                                                        ; inst 40
_10.while.exit.0:
  br label %_21.if.exit.0                                                          ; inst 41
_11.if.else.0:
  br label %_12.while.cond.1                                                       ; inst 42
_12.while.cond.1:
  %37 = phi i32 [0, %_11.if.else.0], [%63, %_19.if.exit.2]                         ; inst 43
  %38 = phi i32 [0, %_11.if.else.0], [%64, %_19.if.exit.2]                         ; inst 44
  %39 = sext i32 %4 to i64                                                         ; inst 45
  %40 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %39                 ; inst 46
  %41 = load i32, i32* %40                                                         ; inst 47
  %42 = icmp sle i32 %38, %41                                                      ; inst 48
  br i1 %42, label %_13.while.body.1, label %_20.while.exit.1                      ; inst 49
_13.while.body.1:
  %43 = sext i32 %4 to i64                                                         ; inst 50
  %44 = getelementptr [100 x [11 x i32]], [100 x [11 x i32]]* %1, i32 0, i64 %43   ; inst 51
  %45 = sext i32 %38 to i64                                                        ; inst 52
  %46 = getelementptr [11 x i32], [11 x i32]* %44, i32 0, i64 %45                  ; inst 53
  %47 = load i32, i32* %46                                                         ; inst 54
  %48 = icmp sge i32 %47, 0                                                        ; inst 55
  br i1 %48, label %_14.lazy.then.1, label %_15.lazy.else.1                        ; inst 56
_14.lazy.then.1:
  %49 = sext i32 %4 to i64                                                         ; inst 57
  %50 = getelementptr [100 x [11 x i32]], [100 x [11 x i32]]* %1, i32 0, i64 %49   ; inst 58
  %51 = sext i32 %38 to i64                                                        ; inst 59
  %52 = getelementptr [11 x i32], [11 x i32]* %50, i32 0, i64 %51                  ; inst 60
  %53 = load i32, i32* %52                                                         ; inst 61
  %54 = icmp slt i32 %53, 100                                                      ; inst 62
  br label %_16.lazy.exit.1                                                        ; inst 63
_15.lazy.else.1:
  br label %_16.lazy.exit.1                                                        ; inst 64
_16.lazy.exit.1:
  %55 = phi i1 [%54, %_14.lazy.then.1], [0, %_15.lazy.else.1]                      ; inst 65
  br i1 %55, label %_17.if.then.2, label %_18.if.else.2                            ; inst 66
_17.if.then.2:
  %56 = sext i32 %4 to i64                                                         ; inst 67
  %57 = getelementptr [100 x [11 x i32]], [100 x [11 x i32]]* %1, i32 0, i64 %56   ; inst 68
  %58 = sext i32 %38 to i64                                                        ; inst 69
  %59 = getelementptr [11 x i32], [11 x i32]* %57, i32 0, i64 %58                  ; inst 70
  %60 = load i32, i32* %59                                                         ; inst 71
  %61 = call i32 @performRangeQuery([100 x [10 x i32]]* %0, [100 x [11 x i32]]* %1, [100 x i1]* %2, [100 x i32]* %3, i32 %60, i32 %5, i32 %6) ; inst 72
  %62 = add i32 %37, %61                                                           ; inst 73
  br label %_19.if.exit.2                                                          ; inst 74
_18.if.else.2:
  br label %_19.if.exit.2                                                          ; inst 75
_19.if.exit.2:
  %63 = phi i32 [%62, %_17.if.then.2], [%37, %_18.if.else.2]                       ; inst 76
  %64 = add i32 %38, 1                                                             ; inst 77
  br label %_12.while.cond.1                                                       ; inst 78
_20.while.exit.1:
  br label %_21.if.exit.0                                                          ; inst 79
_21.if.exit.0:
  %65 = phi i32 [%11, %_10.while.exit.0], [%37, %_20.while.exit.1]                 ; inst 80
  ret i32 %65                                                                      ; inst 81
}

define void @performQueryExecutionTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 26003)                                                 ; inst 1
  %1 = alloca [200 x i32]                                                          ; inst 2
  %2 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 200                                                        ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [200 x i32]                                                          ; inst 12
  %8 = getelementptr [200 x i32], [200 x i32]* %7, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 200                                                       ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 0, i32* %11                                                            ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [200 x i32]                                                         ; inst 22
  %14 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 200                                                      ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %19 = alloca [200 x i32]                                                         ; inst 32
  %20 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 35
  %22 = icmp slt i32 %21, 200                                                      ; inst 36
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %23 = getelementptr i32, i32* %20, i32 %21                                       ; inst 38
  store i32 0, i32* %23                                                            ; inst 39
  %24 = add i32 %21, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  br label %_13.while.cond.0                                                       ; inst 42
_13.while.cond.0:
  %25 = phi i32 [0, %_12.array.exit.3], [%43, %_17.while.body.0]                   ; inst 43
  %26 = phi i32 [0, %_12.array.exit.3], [%42, %_17.while.body.0]                   ; inst 44
  %27 = icmp slt i32 %25, %0                                                       ; inst 45
  br i1 %27, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 46
_14.lazy.then.0:
  %28 = icmp slt i32 %25, 200                                                      ; inst 47
  br label %_16.lazy.exit.0                                                        ; inst 48
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 49
_16.lazy.exit.0:
  %29 = phi i1 [%28, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 50
  br i1 %29, label %_17.while.body.0, label %_18.while.exit.0                      ; inst 51
_17.while.body.0:
  %30 = sext i32 %25 to i64                                                        ; inst 52
  %31 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %30                 ; inst 53
  %32 = mul i32 %25, 3                                                             ; inst 54
  %33 = add i32 %32, 1                                                             ; inst 55
  %34 = srem i32 %33, 150                                                          ; inst 56
  %35 = add i32 %34, 1                                                             ; inst 57
  store i32 %35, i32* %31                                                          ; inst 58
  %36 = sext i32 %25 to i64                                                        ; inst 59
  %37 = getelementptr [200 x i32], [200 x i32]* %7, i32 0, i64 %36                 ; inst 60
  %38 = mul i32 %25, 7                                                             ; inst 61
  %39 = add i32 %38, 11                                                            ; inst 62
  %40 = srem i32 %39, 1000                                                         ; inst 63
  %41 = add i32 %40, 1                                                             ; inst 64
  store i32 %41, i32* %37                                                          ; inst 65
  %42 = add i32 %26, 1                                                             ; inst 66
  %43 = add i32 %25, 1                                                             ; inst 67
  br label %_13.while.cond.0                                                       ; inst 68
_18.while.exit.0:
  br label %_19.while.cond.1                                                       ; inst 69
_19.while.cond.1:
  %44 = phi i32 [0, %_18.while.exit.0], [%62, %_23.while.body.1]                   ; inst 70
  %45 = phi i32 [0, %_18.while.exit.0], [%61, %_23.while.body.1]                   ; inst 71
  %46 = icmp slt i32 %44, %0                                                       ; inst 72
  br i1 %46, label %_20.lazy.then.1, label %_21.lazy.else.1                        ; inst 73
_20.lazy.then.1:
  %47 = icmp slt i32 %44, 200                                                      ; inst 74
  br label %_22.lazy.exit.1                                                        ; inst 75
_21.lazy.else.1:
  br label %_22.lazy.exit.1                                                        ; inst 76
_22.lazy.exit.1:
  %48 = phi i1 [%47, %_20.lazy.then.1], [0, %_21.lazy.else.1]                      ; inst 77
  br i1 %48, label %_23.while.body.1, label %_24.while.exit.1                      ; inst 78
_23.while.body.1:
  %49 = sext i32 %44 to i64                                                        ; inst 79
  %50 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %49                ; inst 80
  %51 = mul i32 %44, 5                                                             ; inst 81
  %52 = add i32 %51, 3                                                             ; inst 82
  %53 = srem i32 %52, 180                                                          ; inst 83
  %54 = add i32 %53, 1                                                             ; inst 84
  store i32 %54, i32* %50                                                          ; inst 85
  %55 = sext i32 %44 to i64                                                        ; inst 86
  %56 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i64 %55                ; inst 87
  %57 = mul i32 %44, 11                                                            ; inst 88
  %58 = add i32 %57, 13                                                            ; inst 89
  %59 = srem i32 %58, 1200                                                         ; inst 90
  %60 = add i32 %59, 1                                                             ; inst 91
  store i32 %60, i32* %56                                                          ; inst 92
  %61 = add i32 %45, 1                                                             ; inst 93
  %62 = add i32 %44, 1                                                             ; inst 94
  br label %_19.while.cond.1                                                       ; inst 95
_24.while.exit.1:
  br label %_25.while.cond.2                                                       ; inst 96
_25.while.cond.2:
  %63 = phi i32 [0, %_24.while.exit.1], [%86, %_32.while.exit.3]                   ; inst 97
  %64 = phi i32 [0, %_24.while.exit.1], [%67, %_32.while.exit.3]                   ; inst 98
  %65 = icmp slt i32 %63, %26                                                      ; inst 99
  br i1 %65, label %_26.while.body.2, label %_33.while.exit.2                      ; inst 100
_26.while.body.2:
  br label %_27.while.cond.3                                                       ; inst 101
_27.while.cond.3:
  %66 = phi i32 [0, %_26.while.body.2], [%85, %_31.if.exit.0]                      ; inst 102
  %67 = phi i32 [%64, %_26.while.body.2], [%84, %_31.if.exit.0]                    ; inst 103
  %68 = icmp slt i32 %66, %45                                                      ; inst 104
  br i1 %68, label %_28.while.body.3, label %_32.while.exit.3                      ; inst 105
_28.while.body.3:
  %69 = sext i32 %63 to i64                                                        ; inst 106
  %70 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %69                 ; inst 107
  %71 = load i32, i32* %70                                                         ; inst 108
  %72 = sext i32 %66 to i64                                                        ; inst 109
  %73 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %72                ; inst 110
  %74 = load i32, i32* %73                                                         ; inst 111
  %75 = icmp eq i32 %71, %74                                                       ; inst 112
  br i1 %75, label %_29.if.then.0, label %_30.if.else.0                            ; inst 113
_29.if.then.0:
  %76 = sext i32 %63 to i64                                                        ; inst 114
  %77 = getelementptr [200 x i32], [200 x i32]* %7, i32 0, i64 %76                 ; inst 115
  %78 = load i32, i32* %77                                                         ; inst 116
  %79 = add i32 %67, %78                                                           ; inst 117
  %80 = sext i32 %66 to i64                                                        ; inst 118
  %81 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i64 %80                ; inst 119
  %82 = load i32, i32* %81                                                         ; inst 120
  %83 = add i32 %79, %82                                                           ; inst 121
  br label %_31.if.exit.0                                                          ; inst 122
_30.if.else.0:
  br label %_31.if.exit.0                                                          ; inst 123
_31.if.exit.0:
  %84 = phi i32 [%83, %_29.if.then.0], [%67, %_30.if.else.0]                       ; inst 124
  %85 = add i32 %66, 1                                                             ; inst 125
  br label %_27.while.cond.3                                                       ; inst 126
_32.while.exit.3:
  %86 = add i32 %63, 1                                                             ; inst 127
  br label %_25.while.cond.2                                                       ; inst 128
_33.while.exit.2:
  %87 = srem i32 %64, 10000                                                        ; inst 129
  call void @printlnInt(i32 %87)                                                   ; inst 130
  %88 = alloca [50 x [5 x i32]]                                                    ; inst 131
  %89 = alloca [5 x i32]                                                           ; inst 132
  %90 = getelementptr [5 x i32], [5 x i32]* %89, i32 0, i32 0                      ; inst 133
  br label %_34.array.cond.4                                                       ; inst 134
_34.array.cond.4:
  %91 = phi i32 [0, %_33.while.exit.2], [%94, %_35.array.body.4]                   ; inst 135
  %92 = icmp slt i32 %91, 5                                                        ; inst 136
  br i1 %92, label %_35.array.body.4, label %_36.array.exit.4                      ; inst 137
_35.array.body.4:
  %93 = getelementptr i32, i32* %90, i32 %91                                       ; inst 138
  store i32 -1, i32* %93                                                           ; inst 139
  %94 = add i32 %91, 1                                                             ; inst 140
  br label %_34.array.cond.4                                                       ; inst 141
_36.array.exit.4:
  %95 = getelementptr [50 x [5 x i32]], [50 x [5 x i32]]* %88, i32 0, i32 0        ; inst 142
  br label %_37.array.cond.5                                                       ; inst 143
_37.array.cond.5:
  %96 = phi i32 [0, %_36.array.exit.4], [%99, %_38.array.body.5]                   ; inst 144
  %97 = icmp slt i32 %96, 50                                                       ; inst 145
  br i1 %97, label %_38.array.body.5, label %_39.array.exit.5                      ; inst 146
_38.array.body.5:
  %98 = getelementptr [5 x i32], [5 x i32]* %95, i32 %96                           ; inst 147
  call void @memcpy([5 x i32]* %98, [5 x i32]* %89, i64 20)                        ; inst 148
  %99 = add i32 %96, 1                                                             ; inst 149
  br label %_37.array.cond.5                                                       ; inst 150
_39.array.exit.5:
  %100 = alloca [50 x [5 x i32]]                                                   ; inst 151
  %101 = alloca [5 x i32]                                                          ; inst 152
  %102 = getelementptr [5 x i32], [5 x i32]* %101, i32 0, i32 0                    ; inst 153
  br label %_40.array.cond.6                                                       ; inst 154
_40.array.cond.6:
  %103 = phi i32 [0, %_39.array.exit.5], [%106, %_41.array.body.6]                 ; inst 155
  %104 = icmp slt i32 %103, 5                                                      ; inst 156
  br i1 %104, label %_41.array.body.6, label %_42.array.exit.6                     ; inst 157
_41.array.body.6:
  %105 = getelementptr i32, i32* %102, i32 %103                                    ; inst 158
  store i32 0, i32* %105                                                           ; inst 159
  %106 = add i32 %103, 1                                                           ; inst 160
  br label %_40.array.cond.6                                                       ; inst 161
_42.array.exit.6:
  %107 = getelementptr [50 x [5 x i32]], [50 x [5 x i32]]* %100, i32 0, i32 0      ; inst 162
  br label %_43.array.cond.7                                                       ; inst 163
_43.array.cond.7:
  %108 = phi i32 [0, %_42.array.exit.6], [%111, %_44.array.body.7]                 ; inst 164
  %109 = icmp slt i32 %108, 50                                                     ; inst 165
  br i1 %109, label %_44.array.body.7, label %_45.array.exit.7                     ; inst 166
_44.array.body.7:
  %110 = getelementptr [5 x i32], [5 x i32]* %107, i32 %108                        ; inst 167
  call void @memcpy([5 x i32]* %110, [5 x i32]* %101, i64 20)                      ; inst 168
  %111 = add i32 %108, 1                                                           ; inst 169
  br label %_43.array.cond.7                                                       ; inst 170
_45.array.exit.7:
  %112 = alloca [50 x i32]                                                         ; inst 171
  %113 = getelementptr [50 x i32], [50 x i32]* %112, i32 0, i32 0                  ; inst 172
  br label %_46.array.cond.8                                                       ; inst 173
_46.array.cond.8:
  %114 = phi i32 [0, %_45.array.exit.7], [%117, %_47.array.body.8]                 ; inst 174
  %115 = icmp slt i32 %114, 50                                                     ; inst 175
  br i1 %115, label %_47.array.body.8, label %_48.array.exit.8                     ; inst 176
_47.array.body.8:
  %116 = getelementptr i32, i32* %113, i32 %114                                    ; inst 177
  store i32 0, i32* %116                                                           ; inst 178
  %117 = add i32 %114, 1                                                           ; inst 179
  br label %_46.array.cond.8                                                       ; inst 180
_48.array.exit.8:
  br label %_49.while.cond.4                                                       ; inst 181
_49.while.cond.4:
  %118 = phi i32 [0, %_48.array.exit.8], [%151, %_53.if.exit.1]                    ; inst 182
  %119 = icmp slt i32 %118, %26                                                    ; inst 183
  br i1 %119, label %_50.while.body.4, label %_54.while.exit.4                     ; inst 184
_50.while.body.4:
  %120 = sext i32 %118 to i64                                                      ; inst 185
  %121 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %120               ; inst 186
  %122 = load i32, i32* %121                                                       ; inst 187
  %123 = srem i32 %122, 50                                                         ; inst 188
  %124 = sext i32 %123 to i64                                                      ; inst 189
  %125 = getelementptr [50 x i32], [50 x i32]* %112, i32 0, i64 %124               ; inst 190
  %126 = load i32, i32* %125                                                       ; inst 191
  %127 = icmp slt i32 %126, 5                                                      ; inst 192
  br i1 %127, label %_51.if.then.1, label %_52.if.else.1                           ; inst 193
_51.if.then.1:
  %128 = sext i32 %123 to i64                                                      ; inst 194
  %129 = getelementptr [50 x i32], [50 x i32]* %112, i32 0, i64 %128               ; inst 195
  %130 = load i32, i32* %129                                                       ; inst 196
  %131 = sext i32 %123 to i64                                                      ; inst 197
  %132 = getelementptr [50 x [5 x i32]], [50 x [5 x i32]]* %88, i32 0, i64 %131    ; inst 198
  %133 = sext i32 %130 to i64                                                      ; inst 199
  %134 = getelementptr [5 x i32], [5 x i32]* %132, i32 0, i64 %133                 ; inst 200
  %135 = sext i32 %118 to i64                                                      ; inst 201
  %136 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %135               ; inst 202
  %137 = load i32, i32* %136                                                       ; inst 203
  store i32 %137, i32* %134                                                        ; inst 204
  %138 = sext i32 %123 to i64                                                      ; inst 205
  %139 = getelementptr [50 x [5 x i32]], [50 x [5 x i32]]* %100, i32 0, i64 %138   ; inst 206
  %140 = sext i32 %130 to i64                                                      ; inst 207
  %141 = getelementptr [5 x i32], [5 x i32]* %139, i32 0, i64 %140                 ; inst 208
  %142 = sext i32 %118 to i64                                                      ; inst 209
  %143 = getelementptr [200 x i32], [200 x i32]* %7, i32 0, i64 %142               ; inst 210
  %144 = load i32, i32* %143                                                       ; inst 211
  store i32 %144, i32* %141                                                        ; inst 212
  %145 = sext i32 %123 to i64                                                      ; inst 213
  %146 = getelementptr [50 x i32], [50 x i32]* %112, i32 0, i64 %145               ; inst 214
  %147 = sext i32 %123 to i64                                                      ; inst 215
  %148 = getelementptr [50 x i32], [50 x i32]* %112, i32 0, i64 %147               ; inst 216
  %149 = load i32, i32* %148                                                       ; inst 217
  %150 = add i32 %149, 1                                                           ; inst 218
  store i32 %150, i32* %146                                                        ; inst 219
  br label %_53.if.exit.1                                                          ; inst 220
_52.if.else.1:
  br label %_53.if.exit.1                                                          ; inst 221
_53.if.exit.1:
  %151 = add i32 %118, 1                                                           ; inst 222
  br label %_49.while.cond.4                                                       ; inst 223
_54.while.exit.4:
  br label %_55.while.cond.5                                                       ; inst 224
_55.while.cond.5:
  %152 = phi i32 [0, %_54.while.exit.4], [%186, %_62.while.exit.6]                 ; inst 225
  %153 = phi i32 [0, %_54.while.exit.4], [%160, %_62.while.exit.6]                 ; inst 226
  %154 = icmp slt i32 %152, %45                                                    ; inst 227
  br i1 %154, label %_56.while.body.5, label %_63.while.exit.5                     ; inst 228
_56.while.body.5:
  %155 = sext i32 %152 to i64                                                      ; inst 229
  %156 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %155              ; inst 230
  %157 = load i32, i32* %156                                                       ; inst 231
  %158 = srem i32 %157, 50                                                         ; inst 232
  br label %_57.while.cond.6                                                       ; inst 233
_57.while.cond.6:
  %159 = phi i32 [0, %_56.while.body.5], [%185, %_61.if.exit.2]                    ; inst 234
  %160 = phi i32 [%153, %_56.while.body.5], [%184, %_61.if.exit.2]                 ; inst 235
  %161 = sext i32 %158 to i64                                                      ; inst 236
  %162 = getelementptr [50 x i32], [50 x i32]* %112, i32 0, i64 %161               ; inst 237
  %163 = load i32, i32* %162                                                       ; inst 238
  %164 = icmp slt i32 %159, %163                                                   ; inst 239
  br i1 %164, label %_58.while.body.6, label %_62.while.exit.6                     ; inst 240
_58.while.body.6:
  %165 = sext i32 %158 to i64                                                      ; inst 241
  %166 = getelementptr [50 x [5 x i32]], [50 x [5 x i32]]* %88, i32 0, i64 %165    ; inst 242
  %167 = sext i32 %159 to i64                                                      ; inst 243
  %168 = getelementptr [5 x i32], [5 x i32]* %166, i32 0, i64 %167                 ; inst 244
  %169 = load i32, i32* %168                                                       ; inst 245
  %170 = sext i32 %152 to i64                                                      ; inst 246
  %171 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %170              ; inst 247
  %172 = load i32, i32* %171                                                       ; inst 248
  %173 = icmp eq i32 %169, %172                                                    ; inst 249
  br i1 %173, label %_59.if.then.2, label %_60.if.else.2                           ; inst 250
_59.if.then.2:
  %174 = sext i32 %158 to i64                                                      ; inst 251
  %175 = getelementptr [50 x [5 x i32]], [50 x [5 x i32]]* %100, i32 0, i64 %174   ; inst 252
  %176 = sext i32 %159 to i64                                                      ; inst 253
  %177 = getelementptr [5 x i32], [5 x i32]* %175, i32 0, i64 %176                 ; inst 254
  %178 = load i32, i32* %177                                                       ; inst 255
  %179 = add i32 %160, %178                                                        ; inst 256
  %180 = sext i32 %152 to i64                                                      ; inst 257
  %181 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i64 %180              ; inst 258
  %182 = load i32, i32* %181                                                       ; inst 259
  %183 = add i32 %179, %182                                                        ; inst 260
  br label %_61.if.exit.2                                                          ; inst 261
_60.if.else.2:
  br label %_61.if.exit.2                                                          ; inst 262
_61.if.exit.2:
  %184 = phi i32 [%183, %_59.if.then.2], [%160, %_60.if.else.2]                    ; inst 263
  %185 = add i32 %159, 1                                                           ; inst 264
  br label %_57.while.cond.6                                                       ; inst 265
_62.while.exit.6:
  %186 = add i32 %152, 1                                                           ; inst 266
  br label %_55.while.cond.5                                                       ; inst 267
_63.while.exit.5:
  %187 = srem i32 %153, 10000                                                      ; inst 268
  call void @printlnInt(i32 %187)                                                  ; inst 269
  call void @performTableSort([200 x i32]* %1, [200 x i32]* %7, i32 %26)           ; inst 270
  call void @performTableSort([200 x i32]* %13, [200 x i32]* %19, i32 %45)         ; inst 271
  br label %_64.while.cond.7                                                       ; inst 272
_64.while.cond.7:
  %188 = phi i32 [0, %_63.while.exit.5], [%222, %_74.if.exit.3]                    ; inst 273
  %189 = phi i32 [0, %_63.while.exit.5], [%223, %_74.if.exit.3]                    ; inst 274
  %190 = phi i32 [0, %_63.while.exit.5], [%224, %_74.if.exit.3]                    ; inst 275
  %191 = icmp slt i32 %189, %26                                                    ; inst 276
  br i1 %191, label %_65.lazy.then.2, label %_66.lazy.else.2                       ; inst 277
_65.lazy.then.2:
  %192 = icmp slt i32 %190, %45                                                    ; inst 278
  br label %_67.lazy.exit.2                                                        ; inst 279
_66.lazy.else.2:
  br label %_67.lazy.exit.2                                                        ; inst 280
_67.lazy.exit.2:
  %193 = phi i1 [%192, %_65.lazy.then.2], [0, %_66.lazy.else.2]                    ; inst 281
  br i1 %193, label %_68.while.body.7, label %_75.while.exit.7                     ; inst 282
_68.while.body.7:
  %194 = sext i32 %189 to i64                                                      ; inst 283
  %195 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %194               ; inst 284
  %196 = load i32, i32* %195                                                       ; inst 285
  %197 = sext i32 %190 to i64                                                      ; inst 286
  %198 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %197              ; inst 287
  %199 = load i32, i32* %198                                                       ; inst 288
  %200 = icmp eq i32 %196, %199                                                    ; inst 289
  br i1 %200, label %_69.if.then.3, label %_70.if.else.3                           ; inst 290
_69.if.then.3:
  %201 = sext i32 %189 to i64                                                      ; inst 291
  %202 = getelementptr [200 x i32], [200 x i32]* %7, i32 0, i64 %201               ; inst 292
  %203 = load i32, i32* %202                                                       ; inst 293
  %204 = add i32 %188, %203                                                        ; inst 294
  %205 = sext i32 %190 to i64                                                      ; inst 295
  %206 = getelementptr [200 x i32], [200 x i32]* %19, i32 0, i64 %205              ; inst 296
  %207 = load i32, i32* %206                                                       ; inst 297
  %208 = add i32 %204, %207                                                        ; inst 298
  %209 = add i32 %189, 1                                                           ; inst 299
  %210 = add i32 %190, 1                                                           ; inst 300
  br label %_74.if.exit.3                                                          ; inst 301
_70.if.else.3:
  %211 = sext i32 %189 to i64                                                      ; inst 302
  %212 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %211               ; inst 303
  %213 = load i32, i32* %212                                                       ; inst 304
  %214 = sext i32 %190 to i64                                                      ; inst 305
  %215 = getelementptr [200 x i32], [200 x i32]* %13, i32 0, i64 %214              ; inst 306
  %216 = load i32, i32* %215                                                       ; inst 307
  %217 = icmp slt i32 %213, %216                                                   ; inst 308
  br i1 %217, label %_71.if.then.4, label %_72.if.else.4                           ; inst 309
_71.if.then.4:
  %218 = add i32 %189, 1                                                           ; inst 310
  br label %_73.if.exit.4                                                          ; inst 311
_72.if.else.4:
  %219 = add i32 %190, 1                                                           ; inst 312
  br label %_73.if.exit.4                                                          ; inst 313
_73.if.exit.4:
  %220 = phi i32 [%218, %_71.if.then.4], [%189, %_72.if.else.4]                    ; inst 314
  %221 = phi i32 [%190, %_71.if.then.4], [%219, %_72.if.else.4]                    ; inst 315
  br label %_74.if.exit.3                                                          ; inst 316
_74.if.exit.3:
  %222 = phi i32 [%208, %_69.if.then.3], [%188, %_73.if.exit.4]                    ; inst 317
  %223 = phi i32 [%209, %_69.if.then.3], [%220, %_73.if.exit.4]                    ; inst 318
  %224 = phi i32 [%210, %_69.if.then.3], [%221, %_73.if.exit.4]                    ; inst 319
  br label %_64.while.cond.7                                                       ; inst 320
_75.while.exit.7:
  %225 = srem i32 %188, 10000                                                      ; inst 321
  call void @printlnInt(i32 %225)                                                  ; inst 322
  call void @printlnInt(i32 26004)                                                 ; inst 323
  ret void                                                                         ; inst 324
}

define void @performTableSort([200 x i32]* %0, [200 x i32]* %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%43, %_8.while.exit.1]                           ; inst 2
  %4 = sub i32 %2, 1                                                               ; inst 3
  %5 = icmp slt i32 %3, %4                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 6
_3.while.cond.1:
  %6 = phi i32 [0, %_2.while.body.0], [%42, %_7.if.exit.0]                         ; inst 7
  %7 = sub i32 %2, 1                                                               ; inst 8
  %8 = sub i32 %7, %3                                                              ; inst 9
  %9 = icmp slt i32 %6, %8                                                         ; inst 10
  br i1 %9, label %_4.while.body.1, label %_8.while.exit.1                         ; inst 11
_4.while.body.1:
  %10 = sext i32 %6 to i64                                                         ; inst 12
  %11 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %10                 ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = sext i32 %6 to i64                                                         ; inst 15
  %14 = add i64 %13, 1                                                             ; inst 16
  %15 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %14                 ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = icmp sgt i32 %12, %16                                                      ; inst 19
  br i1 %17, label %_5.if.then.0, label %_6.if.else.0                              ; inst 20
_5.if.then.0:
  %18 = sext i32 %6 to i64                                                         ; inst 21
  %19 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %18                 ; inst 22
  %20 = load i32, i32* %19                                                         ; inst 23
  %21 = sext i32 %6 to i64                                                         ; inst 24
  %22 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %21                 ; inst 25
  %23 = sext i32 %6 to i64                                                         ; inst 26
  %24 = add i64 %23, 1                                                             ; inst 27
  %25 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %24                 ; inst 28
  %26 = load i32, i32* %25                                                         ; inst 29
  store i32 %26, i32* %22                                                          ; inst 30
  %27 = sext i32 %6 to i64                                                         ; inst 31
  %28 = add i64 %27, 1                                                             ; inst 32
  %29 = getelementptr [200 x i32], [200 x i32]* %0, i32 0, i64 %28                 ; inst 33
  store i32 %20, i32* %29                                                          ; inst 34
  %30 = sext i32 %6 to i64                                                         ; inst 35
  %31 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %30                 ; inst 36
  %32 = load i32, i32* %31                                                         ; inst 37
  %33 = sext i32 %6 to i64                                                         ; inst 38
  %34 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %33                 ; inst 39
  %35 = sext i32 %6 to i64                                                         ; inst 40
  %36 = add i64 %35, 1                                                             ; inst 41
  %37 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %36                 ; inst 42
  %38 = load i32, i32* %37                                                         ; inst 43
  store i32 %38, i32* %34                                                          ; inst 44
  %39 = sext i32 %6 to i64                                                         ; inst 45
  %40 = add i64 %39, 1                                                             ; inst 46
  %41 = getelementptr [200 x i32], [200 x i32]* %1, i32 0, i64 %40                 ; inst 47
  store i32 %32, i32* %41                                                          ; inst 48
  br label %_7.if.exit.0                                                           ; inst 49
_6.if.else.0:
  br label %_7.if.exit.0                                                           ; inst 50
_7.if.exit.0:
  %42 = add i32 %6, 1                                                              ; inst 51
  br label %_3.while.cond.1                                                        ; inst 52
_8.while.exit.1:
  %43 = add i32 %3, 1                                                              ; inst 53
  br label %_1.while.cond.0                                                        ; inst 54
_9.while.exit.0:
  ret void                                                                         ; inst 55
}

define void @performTransactionProcessingTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 26005)                                                 ; inst 1
  %1 = alloca [50 x i32]                                                           ; inst 2
  %2 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i32 0                      ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 50                                                         ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 0, i32* %5                                                             ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [50 x i32]                                                           ; inst 12
  %8 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i32 0                      ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 50                                                        ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 0, i32* %11                                                            ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [50 x [10 x i32]]                                                   ; inst 22
  %14 = alloca [10 x i32]                                                          ; inst 23
  %15 = getelementptr [10 x i32], [10 x i32]* %14, i32 0, i32 0                    ; inst 24
  br label %_7.array.cond.2                                                        ; inst 25
_7.array.cond.2:
  %16 = phi i32 [0, %_6.array.exit.1], [%19, %_8.array.body.2]                     ; inst 26
  %17 = icmp slt i32 %16, 10                                                       ; inst 27
  br i1 %17, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 28
_8.array.body.2:
  %18 = getelementptr i32, i32* %15, i32 %16                                       ; inst 29
  store i32 -1, i32* %18                                                           ; inst 30
  %19 = add i32 %16, 1                                                             ; inst 31
  br label %_7.array.cond.2                                                        ; inst 32
_9.array.exit.2:
  %20 = getelementptr [50 x [10 x i32]], [50 x [10 x i32]]* %13, i32 0, i32 0      ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 35
  %22 = icmp slt i32 %21, 50                                                       ; inst 36
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %23 = getelementptr [10 x i32], [10 x i32]* %20, i32 %21                         ; inst 38
  call void @memcpy([10 x i32]* %23, [10 x i32]* %14, i64 40)                      ; inst 39
  %24 = add i32 %21, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %25 = alloca [50 x i32]                                                          ; inst 42
  %26 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i32 0                    ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 45
  %28 = icmp slt i32 %27, 50                                                       ; inst 46
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %29 = getelementptr i32, i32* %26, i32 %27                                       ; inst 48
  store i32 0, i32* %29                                                            ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %31 = alloca [100 x i32]                                                         ; inst 52
  %32 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i32 0                  ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 55
  %34 = icmp slt i32 %33, 100                                                      ; inst 56
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 58
  store i32 -1, i32* %35                                                           ; inst 59
  %36 = add i32 %33, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  %37 = alloca [100 x [5 x i32]]                                                   ; inst 62
  %38 = alloca [5 x i32]                                                           ; inst 63
  %39 = getelementptr [5 x i32], [5 x i32]* %38, i32 0, i32 0                      ; inst 64
  br label %_19.array.cond.6                                                       ; inst 65
_19.array.cond.6:
  %40 = phi i32 [0, %_18.array.exit.5], [%43, %_20.array.body.6]                   ; inst 66
  %41 = icmp slt i32 %40, 5                                                        ; inst 67
  br i1 %41, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 68
_20.array.body.6:
  %42 = getelementptr i32, i32* %39, i32 %40                                       ; inst 69
  store i32 -1, i32* %42                                                           ; inst 70
  %43 = add i32 %40, 1                                                             ; inst 71
  br label %_19.array.cond.6                                                       ; inst 72
_21.array.exit.6:
  %44 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %37, i32 0, i32 0      ; inst 73
  br label %_22.array.cond.7                                                       ; inst 74
_22.array.cond.7:
  %45 = phi i32 [0, %_21.array.exit.6], [%48, %_23.array.body.7]                   ; inst 75
  %46 = icmp slt i32 %45, 100                                                      ; inst 76
  br i1 %46, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 77
_23.array.body.7:
  %47 = getelementptr [5 x i32], [5 x i32]* %44, i32 %45                           ; inst 78
  call void @memcpy([5 x i32]* %47, [5 x i32]* %38, i64 20)                        ; inst 79
  %48 = add i32 %45, 1                                                             ; inst 80
  br label %_22.array.cond.7                                                       ; inst 81
_24.array.exit.7:
  %49 = alloca [100 x i32]                                                         ; inst 82
  %50 = getelementptr [100 x i32], [100 x i32]* %49, i32 0, i32 0                  ; inst 83
  br label %_25.array.cond.8                                                       ; inst 84
_25.array.cond.8:
  %51 = phi i32 [0, %_24.array.exit.7], [%54, %_26.array.body.8]                   ; inst 85
  %52 = icmp slt i32 %51, 100                                                      ; inst 86
  br i1 %52, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 87
_26.array.body.8:
  %53 = getelementptr i32, i32* %50, i32 %51                                       ; inst 88
  store i32 0, i32* %53                                                            ; inst 89
  %54 = add i32 %51, 1                                                             ; inst 90
  br label %_25.array.cond.8                                                       ; inst 91
_27.array.exit.8:
  %55 = alloca [50 x [50 x i1]]                                                    ; inst 92
  %56 = alloca [50 x i1]                                                           ; inst 93
  %57 = getelementptr [50 x i1], [50 x i1]* %56, i32 0, i32 0                      ; inst 94
  br label %_28.array.cond.9                                                       ; inst 95
_28.array.cond.9:
  %58 = phi i32 [0, %_27.array.exit.8], [%61, %_29.array.body.9]                   ; inst 96
  %59 = icmp slt i32 %58, 50                                                       ; inst 97
  br i1 %59, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 98
_29.array.body.9:
  %60 = getelementptr i1, i1* %57, i32 %58                                         ; inst 99
  store i1 0, i1* %60                                                              ; inst 100
  %61 = add i32 %58, 1                                                             ; inst 101
  br label %_28.array.cond.9                                                       ; inst 102
_30.array.exit.9:
  %62 = getelementptr [50 x [50 x i1]], [50 x [50 x i1]]* %55, i32 0, i32 0        ; inst 103
  br label %_31.array.cond.10                                                      ; inst 104
_31.array.cond.10:
  %63 = phi i32 [0, %_30.array.exit.9], [%66, %_32.array.body.10]                  ; inst 105
  %64 = icmp slt i32 %63, 50                                                       ; inst 106
  br i1 %64, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 107
_32.array.body.10:
  %65 = getelementptr [50 x i1], [50 x i1]* %62, i32 %63                           ; inst 108
  call void @memcpy([50 x i1]* %65, [50 x i1]* %56, i64 50)                        ; inst 109
  %66 = add i32 %63, 1                                                             ; inst 110
  br label %_31.array.cond.10                                                      ; inst 111
_33.array.exit.10:
  %67 = alloca [50 x i1]                                                           ; inst 112
  %68 = getelementptr [50 x i1], [50 x i1]* %67, i32 0, i32 0                      ; inst 113
  br label %_34.array.cond.11                                                      ; inst 114
_34.array.cond.11:
  %69 = phi i32 [0, %_33.array.exit.10], [%72, %_35.array.body.11]                 ; inst 115
  %70 = icmp slt i32 %69, 50                                                       ; inst 116
  br i1 %70, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 117
_35.array.body.11:
  %71 = getelementptr i1, i1* %68, i32 %69                                         ; inst 118
  store i1 0, i1* %71                                                              ; inst 119
  %72 = add i32 %69, 1                                                             ; inst 120
  br label %_34.array.cond.11                                                      ; inst 121
_36.array.exit.11:
  %73 = alloca [50 x i1]                                                           ; inst 122
  %74 = getelementptr [50 x i1], [50 x i1]* %73, i32 0, i32 0                      ; inst 123
  br label %_37.array.cond.12                                                      ; inst 124
_37.array.cond.12:
  %75 = phi i32 [0, %_36.array.exit.11], [%78, %_38.array.body.12]                 ; inst 125
  %76 = icmp slt i32 %75, 50                                                       ; inst 126
  br i1 %76, label %_38.array.body.12, label %_39.array.exit.12                    ; inst 127
_38.array.body.12:
  %77 = getelementptr i1, i1* %74, i32 %75                                         ; inst 128
  store i1 0, i1* %77                                                              ; inst 129
  %78 = add i32 %75, 1                                                             ; inst 130
  br label %_37.array.cond.12                                                      ; inst 131
_39.array.exit.12:
  br label %_40.while.cond.0                                                       ; inst 132
_40.while.cond.0:
  %79 = phi i32 [0, %_39.array.exit.12], [%89, %_92.while.exit.4]                  ; inst 133
  %80 = phi i32 [0, %_39.array.exit.12], [%180, %_92.while.exit.4]                 ; inst 134
  %81 = phi i32 [1, %_39.array.exit.12], [%201, %_92.while.exit.4]                 ; inst 135
  %82 = phi i32 [0, %_39.array.exit.12], [%202, %_92.while.exit.4]                 ; inst 136
  %83 = phi i32 [0, %_39.array.exit.12], [%181, %_92.while.exit.4]                 ; inst 137
  %84 = icmp slt i32 %82, 20                                                       ; inst 138
  br i1 %84, label %_41.lazy.then.0, label %_42.lazy.else.0                        ; inst 139
_41.lazy.then.0:
  %85 = icmp slt i32 %79, %0                                                       ; inst 140
  br label %_43.lazy.exit.0                                                        ; inst 141
_42.lazy.else.0:
  br label %_43.lazy.exit.0                                                        ; inst 142
_43.lazy.exit.0:
  %86 = phi i1 [%85, %_41.lazy.then.0], [0, %_42.lazy.else.0]                      ; inst 143
  br i1 %86, label %_44.while.body.0, label %_93.while.exit.0                      ; inst 144
_44.while.body.0:
  %87 = srem i32 %82, 3                                                            ; inst 145
  %88 = add i32 %87, 1                                                             ; inst 146
  br label %_45.while.cond.1                                                       ; inst 147
_45.while.cond.1:
  %89 = phi i32 [%79, %_44.while.body.0], [%102, %_52.if.exit.0]                   ; inst 148
  %90 = phi i32 [0, %_44.while.body.0], [%103, %_52.if.exit.0]                     ; inst 149
  %91 = icmp slt i32 %90, %88                                                      ; inst 150
  br i1 %91, label %_46.lazy.then.1, label %_47.lazy.else.1                        ; inst 151
_46.lazy.then.1:
  %92 = icmp slt i32 %89, %0                                                       ; inst 152
  br label %_48.lazy.exit.1                                                        ; inst 153
_47.lazy.else.1:
  br label %_48.lazy.exit.1                                                        ; inst 154
_48.lazy.exit.1:
  %93 = phi i1 [%92, %_46.lazy.then.1], [0, %_47.lazy.else.1]                      ; inst 155
  br i1 %93, label %_49.while.body.1, label %_53.while.exit.1                      ; inst 156
_49.while.body.1:
  %94 = icmp slt i32 %89, 50                                                       ; inst 157
  br i1 %94, label %_50.if.then.0, label %_51.if.else.0                            ; inst 158
_50.if.then.0:
  %95 = sext i32 %89 to i64                                                        ; inst 159
  %96 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %95                   ; inst 160
  store i32 1, i32* %96                                                            ; inst 161
  %97 = sext i32 %89 to i64                                                        ; inst 162
  %98 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %97                   ; inst 163
  store i32 %81, i32* %98                                                          ; inst 164
  %99 = sext i32 %89 to i64                                                        ; inst 165
  %100 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i64 %99                 ; inst 166
  store i32 0, i32* %100                                                           ; inst 167
  %101 = add i32 %89, 1                                                            ; inst 168
  br label %_52.if.exit.0                                                          ; inst 169
_51.if.else.0:
  br label %_52.if.exit.0                                                          ; inst 170
_52.if.exit.0:
  %102 = phi i32 [%101, %_50.if.then.0], [%89, %_51.if.else.0]                     ; inst 171
  %103 = add i32 %90, 1                                                            ; inst 172
  br label %_45.while.cond.1                                                       ; inst 173
_53.while.exit.1:
  br label %_54.while.cond.2                                                       ; inst 174
_54.while.cond.2:
  %104 = phi i32 [0, %_53.while.exit.1], [%174, %_73.if.exit.1]                    ; inst 175
  %105 = icmp slt i32 %104, %89                                                    ; inst 176
  br i1 %105, label %_55.while.body.2, label %_74.while.exit.2                     ; inst 177
_55.while.body.2:
  %106 = sext i32 %104 to i64                                                      ; inst 178
  %107 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %106                 ; inst 179
  %108 = load i32, i32* %107                                                       ; inst 180
  %109 = icmp eq i32 %108, 1                                                       ; inst 181
  br i1 %109, label %_56.if.then.1, label %_72.if.else.1                           ; inst 182
_56.if.then.1:
  %110 = add i32 %104, %82                                                         ; inst 183
  %111 = srem i32 %110, 3                                                          ; inst 184
  %112 = add i32 %111, 1                                                           ; inst 185
  br label %_57.while.cond.3                                                       ; inst 186
_57.while.cond.3:
  %113 = phi i32 [0, %_56.if.then.1], [%173, %_70.if.exit.2]                       ; inst 187
  %114 = icmp slt i32 %113, %112                                                   ; inst 188
  br i1 %114, label %_58.lazy.then.2, label %_59.lazy.else.2                       ; inst 189
_58.lazy.then.2:
  %115 = sext i32 %104 to i64                                                      ; inst 190
  %116 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i64 %115                ; inst 191
  %117 = load i32, i32* %116                                                       ; inst 192
  %118 = icmp slt i32 %117, 10                                                     ; inst 193
  br label %_60.lazy.exit.2                                                        ; inst 194
_59.lazy.else.2:
  br label %_60.lazy.exit.2                                                        ; inst 195
_60.lazy.exit.2:
  %119 = phi i1 [%118, %_58.lazy.then.2], [0, %_59.lazy.else.2]                    ; inst 196
  br i1 %119, label %_61.while.body.3, label %_71.while.exit.3                     ; inst 197
_61.while.body.3:
  %120 = mul i32 %104, 7                                                           ; inst 198
  %121 = mul i32 %113, 11                                                          ; inst 199
  %122 = add i32 %120, %121                                                        ; inst 200
  %123 = mul i32 %82, 3                                                            ; inst 201
  %124 = add i32 %122, %123                                                        ; inst 202
  %125 = srem i32 %124, 100                                                        ; inst 203
  %126 = sext i32 %125 to i64                                                      ; inst 204
  %127 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i64 %126              ; inst 205
  %128 = load i32, i32* %127                                                       ; inst 206
  %129 = icmp eq i32 %128, -1                                                      ; inst 207
  br i1 %129, label %_62.if.then.2, label %_63.if.else.2                           ; inst 208
_62.if.then.2:
  %130 = sext i32 %125 to i64                                                      ; inst 209
  %131 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i64 %130              ; inst 210
  store i32 %104, i32* %131                                                        ; inst 211
  %132 = sext i32 %104 to i64                                                      ; inst 212
  %133 = getelementptr [50 x [10 x i32]], [50 x [10 x i32]]* %13, i32 0, i64 %132  ; inst 213
  %134 = sext i32 %104 to i64                                                      ; inst 214
  %135 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i64 %134                ; inst 215
  %136 = load i32, i32* %135                                                       ; inst 216
  %137 = sext i32 %136 to i64                                                      ; inst 217
  %138 = getelementptr [10 x i32], [10 x i32]* %133, i32 0, i64 %137               ; inst 218
  store i32 %125, i32* %138                                                        ; inst 219
  %139 = sext i32 %104 to i64                                                      ; inst 220
  %140 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i64 %139                ; inst 221
  %141 = sext i32 %104 to i64                                                      ; inst 222
  %142 = getelementptr [50 x i32], [50 x i32]* %25, i32 0, i64 %141                ; inst 223
  %143 = load i32, i32* %142                                                       ; inst 224
  %144 = add i32 %143, 1                                                           ; inst 225
  store i32 %144, i32* %140                                                        ; inst 226
  br label %_70.if.exit.2                                                          ; inst 227
_63.if.else.2:
  %145 = sext i32 %125 to i64                                                      ; inst 228
  %146 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i64 %145              ; inst 229
  %147 = load i32, i32* %146                                                       ; inst 230
  %148 = icmp ne i32 %147, %104                                                    ; inst 231
  br i1 %148, label %_64.if.then.3, label %_68.if.else.3                           ; inst 232
_64.if.then.3:
  %149 = sext i32 %125 to i64                                                      ; inst 233
  %150 = getelementptr [100 x i32], [100 x i32]* %49, i32 0, i64 %149              ; inst 234
  %151 = load i32, i32* %150                                                       ; inst 235
  %152 = icmp slt i32 %151, 5                                                      ; inst 236
  br i1 %152, label %_65.if.then.4, label %_66.if.else.4                           ; inst 237
_65.if.then.4:
  %153 = sext i32 %125 to i64                                                      ; inst 238
  %154 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %37, i32 0, i64 %153  ; inst 239
  %155 = sext i32 %125 to i64                                                      ; inst 240
  %156 = getelementptr [100 x i32], [100 x i32]* %49, i32 0, i64 %155              ; inst 241
  %157 = load i32, i32* %156                                                       ; inst 242
  %158 = sext i32 %157 to i64                                                      ; inst 243
  %159 = getelementptr [5 x i32], [5 x i32]* %154, i32 0, i64 %158                 ; inst 244
  store i32 %104, i32* %159                                                        ; inst 245
  %160 = sext i32 %125 to i64                                                      ; inst 246
  %161 = getelementptr [100 x i32], [100 x i32]* %49, i32 0, i64 %160              ; inst 247
  %162 = sext i32 %125 to i64                                                      ; inst 248
  %163 = getelementptr [100 x i32], [100 x i32]* %49, i32 0, i64 %162              ; inst 249
  %164 = load i32, i32* %163                                                       ; inst 250
  %165 = add i32 %164, 1                                                           ; inst 251
  store i32 %165, i32* %161                                                        ; inst 252
  %166 = sext i32 %104 to i64                                                      ; inst 253
  %167 = getelementptr [50 x [50 x i1]], [50 x [50 x i1]]* %55, i32 0, i64 %166    ; inst 254
  %168 = sext i32 %125 to i64                                                      ; inst 255
  %169 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i64 %168              ; inst 256
  %170 = load i32, i32* %169                                                       ; inst 257
  %171 = sext i32 %170 to i64                                                      ; inst 258
  %172 = getelementptr [50 x i1], [50 x i1]* %167, i32 0, i64 %171                 ; inst 259
  store i1 1, i1* %172                                                             ; inst 260
  br label %_67.if.exit.4                                                          ; inst 261
_66.if.else.4:
  br label %_67.if.exit.4                                                          ; inst 262
_67.if.exit.4:
  br label %_69.if.exit.3                                                          ; inst 263
_68.if.else.3:
  br label %_69.if.exit.3                                                          ; inst 264
_69.if.exit.3:
  br label %_70.if.exit.2                                                          ; inst 265
_70.if.exit.2:
  %173 = add i32 %113, 1                                                           ; inst 266
  br label %_57.while.cond.3                                                       ; inst 267
_71.while.exit.3:
  br label %_73.if.exit.1                                                          ; inst 268
_72.if.else.1:
  br label %_73.if.exit.1                                                          ; inst 269
_73.if.exit.1:
  %174 = add i32 %104, 1                                                           ; inst 270
  br label %_54.while.cond.2                                                       ; inst 271
_74.while.exit.2:
  %175 = call i1 @detectDeadlock([50 x [50 x i1]]* %55, [50 x i1]* %67, [50 x i1]* %73, i32 %89) ; inst 272
  br i1 %175, label %_75.if.then.5, label %_79.if.else.5                           ; inst 273
_75.if.then.5:
  %176 = call i32 @findVictimTransaction([50 x i32]* %7, [50 x i32]* %1, i32 %89, i32 %81) ; inst 274
  %177 = icmp sge i32 %176, 0                                                      ; inst 275
  br i1 %177, label %_76.if.then.6, label %_77.if.else.6                           ; inst 276
_76.if.then.6:
  call void @abortTransaction(i32 %176, [50 x i32]* %1, [50 x [10 x i32]]* %13, [50 x i32]* %25, [100 x i32]* %31, [100 x [5 x i32]]* %37, [100 x i32]* %49, [50 x [50 x i1]]* %55) ; inst 277
  %178 = add i32 %80, 1                                                            ; inst 278
  br label %_78.if.exit.6                                                          ; inst 279
_77.if.else.6:
  br label %_78.if.exit.6                                                          ; inst 280
_78.if.exit.6:
  %179 = phi i32 [%178, %_76.if.then.6], [%80, %_77.if.else.6]                     ; inst 281
  br label %_80.if.exit.5                                                          ; inst 282
_79.if.else.5:
  br label %_80.if.exit.5                                                          ; inst 283
_80.if.exit.5:
  %180 = phi i32 [%179, %_78.if.exit.6], [%80, %_79.if.else.5]                     ; inst 284
  br label %_81.while.cond.4                                                       ; inst 285
_81.while.cond.4:
  %181 = phi i32 [%83, %_80.if.exit.5], [%199, %_91.if.exit.7]                     ; inst 286
  %182 = phi i32 [0, %_80.if.exit.5], [%200, %_91.if.exit.7]                       ; inst 287
  %183 = icmp slt i32 %182, %89                                                    ; inst 288
  br i1 %183, label %_82.while.body.4, label %_92.while.exit.4                     ; inst 289
_82.while.body.4:
  %184 = sext i32 %182 to i64                                                      ; inst 290
  %185 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %184                 ; inst 291
  %186 = load i32, i32* %185                                                       ; inst 292
  %187 = icmp eq i32 %186, 1                                                       ; inst 293
  br i1 %187, label %_83.lazy.then.3, label %_84.lazy.else.3                       ; inst 294
_83.lazy.then.3:
  %188 = sext i32 %182 to i64                                                      ; inst 295
  %189 = getelementptr [50 x i32], [50 x i32]* %7, i32 0, i64 %188                 ; inst 296
  %190 = load i32, i32* %189                                                       ; inst 297
  %191 = sub i32 %81, %190                                                         ; inst 298
  %192 = icmp sgt i32 %191, 3                                                      ; inst 299
  br label %_85.lazy.exit.3                                                        ; inst 300
_84.lazy.else.3:
  br label %_85.lazy.exit.3                                                        ; inst 301
_85.lazy.exit.3:
  %193 = phi i1 [%192, %_83.lazy.then.3], [0, %_84.lazy.else.3]                    ; inst 302
  br i1 %193, label %_86.if.then.7, label %_90.if.else.7                           ; inst 303
_86.if.then.7:
  %194 = add i32 %182, %82                                                         ; inst 304
  %195 = srem i32 %194, 4                                                          ; inst 305
  %196 = icmp eq i32 %195, 0                                                       ; inst 306
  br i1 %196, label %_87.if.then.8, label %_88.if.else.8                           ; inst 307
_87.if.then.8:
  call void @commitTransaction(i32 %182, [50 x i32]* %1, [50 x [10 x i32]]* %13, [50 x i32]* %25, [100 x i32]* %31, [100 x [5 x i32]]* %37, [100 x i32]* %49) ; inst 308
  %197 = add i32 %181, 1                                                           ; inst 309
  br label %_89.if.exit.8                                                          ; inst 310
_88.if.else.8:
  br label %_89.if.exit.8                                                          ; inst 311
_89.if.exit.8:
  %198 = phi i32 [%197, %_87.if.then.8], [%181, %_88.if.else.8]                    ; inst 312
  br label %_91.if.exit.7                                                          ; inst 313
_90.if.else.7:
  br label %_91.if.exit.7                                                          ; inst 314
_91.if.exit.7:
  %199 = phi i32 [%198, %_89.if.exit.8], [%181, %_90.if.else.7]                    ; inst 315
  %200 = add i32 %182, 1                                                           ; inst 316
  br label %_81.while.cond.4                                                       ; inst 317
_92.while.exit.4:
  %201 = add i32 %81, 1                                                            ; inst 318
  %202 = add i32 %82, 1                                                            ; inst 319
  br label %_40.while.cond.0                                                       ; inst 320
_93.while.exit.0:
  call void @printlnInt(i32 %83)                                                   ; inst 321
  call void @printlnInt(i32 %80)                                                   ; inst 322
  call void @printlnInt(i32 26006)                                                 ; inst 323
  ret void                                                                         ; inst 324
}

define i1 @detectDeadlock([50 x [50 x i1]]* %0, [50 x i1]* %1, [50 x i1]* %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%10, %_2.while.body.0]                           ; inst 2
  %5 = icmp slt i32 %4, %3                                                         ; inst 3
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %6 = sext i32 %4 to i64                                                          ; inst 5
  %7 = getelementptr [50 x i1], [50 x i1]* %1, i32 0, i64 %6                       ; inst 6
  store i1 0, i1* %7                                                               ; inst 7
  %8 = sext i32 %4 to i64                                                          ; inst 8
  %9 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %8                       ; inst 9
  store i1 0, i1* %9                                                               ; inst 10
  %10 = add i32 %4, 1                                                              ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 13
_4.while.cond.1:
  %11 = phi i32 [0, %_3.while.exit.0], [%18, %_11.if.exit.0]                       ; inst 14
  %12 = icmp slt i32 %11, %3                                                       ; inst 15
  br i1 %12, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 16
_5.while.body.1:
  %13 = sext i32 %11 to i64                                                        ; inst 17
  %14 = getelementptr [50 x i1], [50 x i1]* %1, i32 0, i64 %13                     ; inst 18
  %15 = load i1, i1* %14                                                           ; inst 19
  %16 = icmp eq i1 %15, 0                                                          ; inst 20
  br i1 %16, label %_6.if.then.0, label %_10.if.else.0                             ; inst 21
_6.if.then.0:
  %17 = call i1 @detectCycleDFS([50 x [50 x i1]]* %0, [50 x i1]* %1, [50 x i1]* %2, i32 %11, i32 %3) ; inst 22
  br i1 %17, label %_7.if.then.1, label %_8.if.else.1                              ; inst 23
_7.if.then.1:
  ret i1 1                                                                         ; inst 24
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 25
_9.if.exit.1:
  br label %_11.if.exit.0                                                          ; inst 26
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 27
_11.if.exit.0:
  %18 = add i32 %11, 1                                                             ; inst 28
  br label %_4.while.cond.1                                                        ; inst 29
_12.while.exit.1:
  ret i1 0                                                                         ; inst 30
}

define i1 @detectCycleDFS([50 x [50 x i1]]* %0, [50 x i1]* %1, [50 x i1]* %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = sext i32 %3 to i64                                                          ; inst 1
  %6 = getelementptr [50 x i1], [50 x i1]* %1, i32 0, i64 %5                       ; inst 2
  store i1 1, i1* %6                                                               ; inst 3
  %7 = sext i32 %3 to i64                                                          ; inst 4
  %8 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %7                       ; inst 5
  store i1 1, i1* %8                                                               ; inst 6
  br label %_1.while.cond.0                                                        ; inst 7
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%24, %_14.if.exit.0]                             ; inst 8
  %10 = icmp slt i32 %9, %4                                                        ; inst 9
  br i1 %10, label %_2.while.body.0, label %_15.while.exit.0                       ; inst 10
_2.while.body.0:
  %11 = sext i32 %3 to i64                                                         ; inst 11
  %12 = getelementptr [50 x [50 x i1]], [50 x [50 x i1]]* %0, i32 0, i64 %11       ; inst 12
  %13 = sext i32 %9 to i64                                                         ; inst 13
  %14 = getelementptr [50 x i1], [50 x i1]* %12, i32 0, i64 %13                    ; inst 14
  %15 = load i1, i1* %14                                                           ; inst 15
  br i1 %15, label %_3.if.then.0, label %_13.if.else.0                             ; inst 16
_3.if.then.0:
  %16 = sext i32 %9 to i64                                                         ; inst 17
  %17 = getelementptr [50 x i1], [50 x i1]* %1, i32 0, i64 %16                     ; inst 18
  %18 = load i1, i1* %17                                                           ; inst 19
  %19 = icmp eq i1 %18, 0                                                          ; inst 20
  br i1 %19, label %_4.if.then.1, label %_8.if.else.1                              ; inst 21
_4.if.then.1:
  %20 = call i1 @detectCycleDFS([50 x [50 x i1]]* %0, [50 x i1]* %1, [50 x i1]* %2, i32 %9, i32 %4) ; inst 22
  br i1 %20, label %_5.if.then.2, label %_6.if.else.2                              ; inst 23
_5.if.then.2:
  ret i1 1                                                                         ; inst 24
_6.if.else.2:
  br label %_7.if.exit.2                                                           ; inst 25
_7.if.exit.2:
  br label %_12.if.exit.1                                                          ; inst 26
_8.if.else.1:
  %21 = sext i32 %9 to i64                                                         ; inst 27
  %22 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %21                     ; inst 28
  %23 = load i1, i1* %22                                                           ; inst 29
  br i1 %23, label %_9.if.then.3, label %_10.if.else.3                             ; inst 30
_9.if.then.3:
  ret i1 1                                                                         ; inst 31
_10.if.else.3:
  br label %_11.if.exit.3                                                          ; inst 32
_11.if.exit.3:
  br label %_12.if.exit.1                                                          ; inst 33
_12.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 34
_13.if.else.0:
  br label %_14.if.exit.0                                                          ; inst 35
_14.if.exit.0:
  %24 = add i32 %9, 1                                                              ; inst 36
  br label %_1.while.cond.0                                                        ; inst 37
_15.while.exit.0:
  %25 = sext i32 %3 to i64                                                         ; inst 38
  %26 = getelementptr [50 x i1], [50 x i1]* %2, i32 0, i64 %25                     ; inst 39
  store i1 0, i1* %26                                                              ; inst 40
  ret i1 0                                                                         ; inst 41
}

define i32 @findVictimTransaction([50 x i32]* %0, [50 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%22, %_8.if.exit.0]                              ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%20, %_8.if.exit.0]                              ; inst 3
  %6 = phi i32 [-1, %_0.entry.0], [%21, %_8.if.exit.0]                             ; inst 4
  %7 = icmp slt i32 %4, %2                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = sext i32 %4 to i64                                                          ; inst 7
  %9 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %8                     ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = icmp eq i32 %10, 1                                                         ; inst 10
  br i1 %11, label %_3.lazy.then.0, label %_4.lazy.else.0                          ; inst 11
_3.lazy.then.0:
  %12 = sext i32 %4 to i64                                                         ; inst 12
  %13 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %12                   ; inst 13
  %14 = load i32, i32* %13                                                         ; inst 14
  %15 = icmp sgt i32 %14, %5                                                       ; inst 15
  br label %_5.lazy.exit.0                                                         ; inst 16
_4.lazy.else.0:
  br label %_5.lazy.exit.0                                                         ; inst 17
_5.lazy.exit.0:
  %16 = phi i1 [%15, %_3.lazy.then.0], [0, %_4.lazy.else.0]                        ; inst 18
  br i1 %16, label %_6.if.then.0, label %_7.if.else.0                              ; inst 19
_6.if.then.0:
  %17 = sext i32 %4 to i64                                                         ; inst 20
  %18 = getelementptr [50 x i32], [50 x i32]* %0, i32 0, i64 %17                   ; inst 21
  %19 = load i32, i32* %18                                                         ; inst 22
  br label %_8.if.exit.0                                                           ; inst 23
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 24
_8.if.exit.0:
  %20 = phi i32 [%19, %_6.if.then.0], [%5, %_7.if.else.0]                          ; inst 25
  %21 = phi i32 [%4, %_6.if.then.0], [%6, %_7.if.else.0]                           ; inst 26
  %22 = add i32 %4, 1                                                              ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_9.while.exit.0:
  ret i32 %6                                                                       ; inst 29
}

define void @abortTransaction(i32 %0, [50 x i32]* %1, [50 x [10 x i32]]* %2, [50 x i32]* %3, [100 x i32]* %4, [100 x [5 x i32]]* %5, [100 x i32]* %6, [50 x [50 x i1]]* %7) {
_0.entry.0:
  %8 = sext i32 %0 to i64                                                          ; inst 1
  %9 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %8                     ; inst 2
  store i32 3, i32* %9                                                             ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %10 = phi i32 [0, %_0.entry.0], [%55, %_8.if.exit.0]                             ; inst 5
  %11 = sext i32 %0 to i64                                                         ; inst 6
  %12 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %11                   ; inst 7
  %13 = load i32, i32* %12                                                         ; inst 8
  %14 = icmp slt i32 %10, %13                                                      ; inst 9
  br i1 %14, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 10
_2.while.body.0:
  %15 = sext i32 %0 to i64                                                         ; inst 11
  %16 = getelementptr [50 x [10 x i32]], [50 x [10 x i32]]* %2, i32 0, i64 %15     ; inst 12
  %17 = sext i32 %10 to i64                                                        ; inst 13
  %18 = getelementptr [10 x i32], [10 x i32]* %16, i32 0, i64 %17                  ; inst 14
  %19 = load i32, i32* %18                                                         ; inst 15
  %20 = sext i32 %19 to i64                                                        ; inst 16
  %21 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %20                 ; inst 17
  store i32 -1, i32* %21                                                           ; inst 18
  %22 = sext i32 %19 to i64                                                        ; inst 19
  %23 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %22                 ; inst 20
  %24 = load i32, i32* %23                                                         ; inst 21
  %25 = icmp sgt i32 %24, 0                                                        ; inst 22
  br i1 %25, label %_3.if.then.0, label %_7.if.else.0                              ; inst 23
_3.if.then.0:
  %26 = sext i32 %19 to i64                                                        ; inst 24
  %27 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %5, i32 0, i64 %26     ; inst 25
  %28 = getelementptr [5 x i32], [5 x i32]* %27, i32 0, i64 0                      ; inst 26
  %29 = load i32, i32* %28                                                         ; inst 27
  %30 = sext i32 %19 to i64                                                        ; inst 28
  %31 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %30                 ; inst 29
  store i32 %29, i32* %31                                                          ; inst 30
  br label %_4.while.cond.1                                                        ; inst 31
_4.while.cond.1:
  %32 = phi i32 [0, %_3.if.then.0], [%48, %_5.while.body.1]                        ; inst 32
  %33 = sext i32 %19 to i64                                                        ; inst 33
  %34 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %33                 ; inst 34
  %35 = load i32, i32* %34                                                         ; inst 35
  %36 = sub i32 %35, 1                                                             ; inst 36
  %37 = icmp slt i32 %32, %36                                                      ; inst 37
  br i1 %37, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 38
_5.while.body.1:
  %38 = sext i32 %19 to i64                                                        ; inst 39
  %39 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %5, i32 0, i64 %38     ; inst 40
  %40 = sext i32 %32 to i64                                                        ; inst 41
  %41 = getelementptr [5 x i32], [5 x i32]* %39, i32 0, i64 %40                    ; inst 42
  %42 = sext i32 %19 to i64                                                        ; inst 43
  %43 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %5, i32 0, i64 %42     ; inst 44
  %44 = sext i32 %32 to i64                                                        ; inst 45
  %45 = add i64 %44, 1                                                             ; inst 46
  %46 = getelementptr [5 x i32], [5 x i32]* %43, i32 0, i64 %45                    ; inst 47
  %47 = load i32, i32* %46                                                         ; inst 48
  store i32 %47, i32* %41                                                          ; inst 49
  %48 = add i32 %32, 1                                                             ; inst 50
  br label %_4.while.cond.1                                                        ; inst 51
_6.while.exit.1:
  %49 = sext i32 %19 to i64                                                        ; inst 52
  %50 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %49                 ; inst 53
  %51 = sext i32 %19 to i64                                                        ; inst 54
  %52 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %51                 ; inst 55
  %53 = load i32, i32* %52                                                         ; inst 56
  %54 = sub i32 %53, 1                                                             ; inst 57
  store i32 %54, i32* %50                                                          ; inst 58
  br label %_8.if.exit.0                                                           ; inst 59
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 60
_8.if.exit.0:
  %55 = add i32 %10, 1                                                             ; inst 61
  br label %_1.while.cond.0                                                        ; inst 62
_9.while.exit.0:
  br label %_10.while.cond.2                                                       ; inst 63
_10.while.cond.2:
  %56 = phi i32 [0, %_9.while.exit.0], [%66, %_11.while.body.2]                    ; inst 64
  %57 = icmp slt i32 %56, 50                                                       ; inst 65
  br i1 %57, label %_11.while.body.2, label %_12.while.exit.2                      ; inst 66
_11.while.body.2:
  %58 = sext i32 %0 to i64                                                         ; inst 67
  %59 = getelementptr [50 x [50 x i1]], [50 x [50 x i1]]* %7, i32 0, i64 %58       ; inst 68
  %60 = sext i32 %56 to i64                                                        ; inst 69
  %61 = getelementptr [50 x i1], [50 x i1]* %59, i32 0, i64 %60                    ; inst 70
  store i1 0, i1* %61                                                              ; inst 71
  %62 = sext i32 %56 to i64                                                        ; inst 72
  %63 = getelementptr [50 x [50 x i1]], [50 x [50 x i1]]* %7, i32 0, i64 %62       ; inst 73
  %64 = sext i32 %0 to i64                                                         ; inst 74
  %65 = getelementptr [50 x i1], [50 x i1]* %63, i32 0, i64 %64                    ; inst 75
  store i1 0, i1* %65                                                              ; inst 76
  %66 = add i32 %56, 1                                                             ; inst 77
  br label %_10.while.cond.2                                                       ; inst 78
_12.while.exit.2:
  %67 = sext i32 %0 to i64                                                         ; inst 79
  %68 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %67                   ; inst 80
  store i32 0, i32* %68                                                            ; inst 81
  ret void                                                                         ; inst 82
}

define void @commitTransaction(i32 %0, [50 x i32]* %1, [50 x [10 x i32]]* %2, [50 x i32]* %3, [100 x i32]* %4, [100 x [5 x i32]]* %5, [100 x i32]* %6) {
_0.entry.0:
  %7 = sext i32 %0 to i64                                                          ; inst 1
  %8 = getelementptr [50 x i32], [50 x i32]* %1, i32 0, i64 %7                     ; inst 2
  store i32 2, i32* %8                                                             ; inst 3
  br label %_1.while.cond.0                                                        ; inst 4
_1.while.cond.0:
  %9 = phi i32 [0, %_0.entry.0], [%54, %_8.if.exit.0]                              ; inst 5
  %10 = sext i32 %0 to i64                                                         ; inst 6
  %11 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %10                   ; inst 7
  %12 = load i32, i32* %11                                                         ; inst 8
  %13 = icmp slt i32 %9, %12                                                       ; inst 9
  br i1 %13, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 10
_2.while.body.0:
  %14 = sext i32 %0 to i64                                                         ; inst 11
  %15 = getelementptr [50 x [10 x i32]], [50 x [10 x i32]]* %2, i32 0, i64 %14     ; inst 12
  %16 = sext i32 %9 to i64                                                         ; inst 13
  %17 = getelementptr [10 x i32], [10 x i32]* %15, i32 0, i64 %16                  ; inst 14
  %18 = load i32, i32* %17                                                         ; inst 15
  %19 = sext i32 %18 to i64                                                        ; inst 16
  %20 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %19                 ; inst 17
  store i32 -1, i32* %20                                                           ; inst 18
  %21 = sext i32 %18 to i64                                                        ; inst 19
  %22 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %21                 ; inst 20
  %23 = load i32, i32* %22                                                         ; inst 21
  %24 = icmp sgt i32 %23, 0                                                        ; inst 22
  br i1 %24, label %_3.if.then.0, label %_7.if.else.0                              ; inst 23
_3.if.then.0:
  %25 = sext i32 %18 to i64                                                        ; inst 24
  %26 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %5, i32 0, i64 %25     ; inst 25
  %27 = getelementptr [5 x i32], [5 x i32]* %26, i32 0, i64 0                      ; inst 26
  %28 = load i32, i32* %27                                                         ; inst 27
  %29 = sext i32 %18 to i64                                                        ; inst 28
  %30 = getelementptr [100 x i32], [100 x i32]* %4, i32 0, i64 %29                 ; inst 29
  store i32 %28, i32* %30                                                          ; inst 30
  br label %_4.while.cond.1                                                        ; inst 31
_4.while.cond.1:
  %31 = phi i32 [0, %_3.if.then.0], [%47, %_5.while.body.1]                        ; inst 32
  %32 = sext i32 %18 to i64                                                        ; inst 33
  %33 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %32                 ; inst 34
  %34 = load i32, i32* %33                                                         ; inst 35
  %35 = sub i32 %34, 1                                                             ; inst 36
  %36 = icmp slt i32 %31, %35                                                      ; inst 37
  br i1 %36, label %_5.while.body.1, label %_6.while.exit.1                        ; inst 38
_5.while.body.1:
  %37 = sext i32 %18 to i64                                                        ; inst 39
  %38 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %5, i32 0, i64 %37     ; inst 40
  %39 = sext i32 %31 to i64                                                        ; inst 41
  %40 = getelementptr [5 x i32], [5 x i32]* %38, i32 0, i64 %39                    ; inst 42
  %41 = sext i32 %18 to i64                                                        ; inst 43
  %42 = getelementptr [100 x [5 x i32]], [100 x [5 x i32]]* %5, i32 0, i64 %41     ; inst 44
  %43 = sext i32 %31 to i64                                                        ; inst 45
  %44 = add i64 %43, 1                                                             ; inst 46
  %45 = getelementptr [5 x i32], [5 x i32]* %42, i32 0, i64 %44                    ; inst 47
  %46 = load i32, i32* %45                                                         ; inst 48
  store i32 %46, i32* %40                                                          ; inst 49
  %47 = add i32 %31, 1                                                             ; inst 50
  br label %_4.while.cond.1                                                        ; inst 51
_6.while.exit.1:
  %48 = sext i32 %18 to i64                                                        ; inst 52
  %49 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %48                 ; inst 53
  %50 = sext i32 %18 to i64                                                        ; inst 54
  %51 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %50                 ; inst 55
  %52 = load i32, i32* %51                                                         ; inst 56
  %53 = sub i32 %52, 1                                                             ; inst 57
  store i32 %53, i32* %49                                                          ; inst 58
  br label %_8.if.exit.0                                                           ; inst 59
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 60
_8.if.exit.0:
  %54 = add i32 %9, 1                                                              ; inst 61
  br label %_1.while.cond.0                                                        ; inst 62
_9.while.exit.0:
  %55 = sext i32 %0 to i64                                                         ; inst 63
  %56 = getelementptr [50 x i32], [50 x i32]* %3, i32 0, i64 %55                   ; inst 64
  store i32 0, i32* %56                                                            ; inst 65
  ret void                                                                         ; inst 66
}

define void @performBufferPoolTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 26007)                                                 ; inst 1
  %1 = alloca [100 x i32]                                                          ; inst 2
  %2 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 100                                                        ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 -1, i32* %5                                                            ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [100 x i1]                                                           ; inst 12
  %8 = getelementptr [100 x i1], [100 x i1]* %7, i32 0, i32 0                      ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 100                                                       ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i1, i1* %8, i32 %9                                           ; inst 18
  store i1 0, i1* %11                                                              ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca [100 x i32]                                                         ; inst 22
  %14 = getelementptr [100 x i32], [100 x i32]* %13, i32 0, i32 0                  ; inst 23
  br label %_7.array.cond.2                                                        ; inst 24
_7.array.cond.2:
  %15 = phi i32 [0, %_6.array.exit.1], [%18, %_8.array.body.2]                     ; inst 25
  %16 = icmp slt i32 %15, 100                                                      ; inst 26
  br i1 %16, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 27
_8.array.body.2:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 28
  store i32 0, i32* %17                                                            ; inst 29
  %18 = add i32 %15, 1                                                             ; inst 30
  br label %_7.array.cond.2                                                        ; inst 31
_9.array.exit.2:
  %19 = alloca [100 x i32]                                                         ; inst 32
  %20 = getelementptr [100 x i32], [100 x i32]* %19, i32 0, i32 0                  ; inst 33
  br label %_10.array.cond.3                                                       ; inst 34
_10.array.cond.3:
  %21 = phi i32 [0, %_9.array.exit.2], [%24, %_11.array.body.3]                    ; inst 35
  %22 = icmp slt i32 %21, 100                                                      ; inst 36
  br i1 %22, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 37
_11.array.body.3:
  %23 = getelementptr i32, i32* %20, i32 %21                                       ; inst 38
  store i32 0, i32* %23                                                            ; inst 39
  %24 = add i32 %21, 1                                                             ; inst 40
  br label %_10.array.cond.3                                                       ; inst 41
_12.array.exit.3:
  %25 = alloca [100 x i1]                                                          ; inst 42
  %26 = getelementptr [100 x i1], [100 x i1]* %25, i32 0, i32 0                    ; inst 43
  br label %_13.array.cond.4                                                       ; inst 44
_13.array.cond.4:
  %27 = phi i32 [0, %_12.array.exit.3], [%30, %_14.array.body.4]                   ; inst 45
  %28 = icmp slt i32 %27, 100                                                      ; inst 46
  br i1 %28, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 47
_14.array.body.4:
  %29 = getelementptr i1, i1* %26, i32 %27                                         ; inst 48
  store i1 0, i1* %29                                                              ; inst 49
  %30 = add i32 %27, 1                                                             ; inst 50
  br label %_13.array.cond.4                                                       ; inst 51
_15.array.exit.4:
  %31 = alloca [500 x i32]                                                         ; inst 52
  %32 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i32 0                  ; inst 53
  br label %_16.array.cond.5                                                       ; inst 54
_16.array.cond.5:
  %33 = phi i32 [0, %_15.array.exit.4], [%36, %_17.array.body.5]                   ; inst 55
  %34 = icmp slt i32 %33, 500                                                      ; inst 56
  br i1 %34, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 57
_17.array.body.5:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 58
  store i32 -1, i32* %35                                                           ; inst 59
  %36 = add i32 %33, 1                                                             ; inst 60
  br label %_16.array.cond.5                                                       ; inst 61
_18.array.exit.5:
  br label %_19.while.cond.0                                                       ; inst 62
_19.while.cond.0:
  %37 = phi i32 [0, %_18.array.exit.5], [%51, %_62.while.exit.1]                   ; inst 63
  %38 = phi i32 [0, %_18.array.exit.5], [%52, %_62.while.exit.1]                   ; inst 64
  %39 = phi i32 [0, %_18.array.exit.5], [%159, %_62.while.exit.1]                  ; inst 65
  %40 = phi i32 [0, %_18.array.exit.5], [%53, %_62.while.exit.1]                   ; inst 66
  %41 = phi i32 [1, %_18.array.exit.5], [%54, %_62.while.exit.1]                   ; inst 67
  %42 = phi i32 [0, %_18.array.exit.5], [%55, %_62.while.exit.1]                   ; inst 68
  %43 = phi i32 [0, %_18.array.exit.5], [%56, %_62.while.exit.1]                   ; inst 69
  %44 = icmp slt i32 %39, 30                                                       ; inst 70
  br i1 %44, label %_20.lazy.then.0, label %_21.lazy.else.0                        ; inst 71
_20.lazy.then.0:
  %45 = icmp slt i32 %38, 200                                                      ; inst 72
  br label %_22.lazy.exit.0                                                        ; inst 73
_21.lazy.else.0:
  br label %_22.lazy.exit.0                                                        ; inst 74
_22.lazy.exit.0:
  %46 = phi i1 [%45, %_20.lazy.then.0], [0, %_21.lazy.else.0]                      ; inst 75
  br i1 %46, label %_23.while.body.0, label %_63.while.exit.0                      ; inst 76
_23.while.body.0:
  %47 = srem i32 %39, 4                                                            ; inst 77
  %48 = srem i32 %39, 5                                                            ; inst 78
  %49 = add i32 %48, 3                                                             ; inst 79
  br label %_24.while.cond.1                                                       ; inst 80
_24.while.cond.1:
  %50 = phi i32 [0, %_23.while.body.0], [%158, %_61.if.exit.7]                     ; inst 81
  %51 = phi i32 [%37, %_23.while.body.0], [%140, %_61.if.exit.7]                   ; inst 82
  %52 = phi i32 [%38, %_23.while.body.0], [%157, %_61.if.exit.7]                   ; inst 83
  %53 = phi i32 [%40, %_23.while.body.0], [%141, %_61.if.exit.7]                   ; inst 84
  %54 = phi i32 [%41, %_23.while.body.0], [%156, %_61.if.exit.7]                   ; inst 85
  %55 = phi i32 [%42, %_23.while.body.0], [%142, %_61.if.exit.7]                   ; inst 86
  %56 = phi i32 [%43, %_23.while.body.0], [%143, %_61.if.exit.7]                   ; inst 87
  %57 = icmp slt i32 %50, %49                                                      ; inst 88
  br i1 %57, label %_25.lazy.then.1, label %_26.lazy.else.1                        ; inst 89
_25.lazy.then.1:
  %58 = icmp slt i32 %52, 200                                                      ; inst 90
  br label %_27.lazy.exit.1                                                        ; inst 91
_26.lazy.else.1:
  br label %_27.lazy.exit.1                                                        ; inst 92
_27.lazy.exit.1:
  %59 = phi i1 [%58, %_25.lazy.then.1], [0, %_26.lazy.else.1]                      ; inst 93
  br i1 %59, label %_28.while.body.1, label %_62.while.exit.1                      ; inst 94
_28.while.body.1:
  %60 = icmp eq i32 %47, 0                                                         ; inst 95
  br i1 %60, label %_29.if.then.0, label %_30.if.else.0                            ; inst 96
_29.if.then.0:
  %61 = mul i32 %39, 10                                                            ; inst 97
  %62 = add i32 %61, %50                                                           ; inst 98
  %63 = srem i32 %62, 400                                                          ; inst 99
  %64 = add i32 %63, 1                                                             ; inst 100
  br label %_37.if.exit.0                                                          ; inst 101
_30.if.else.0:
  %65 = icmp eq i32 %47, 1                                                         ; inst 102
  br i1 %65, label %_31.if.then.1, label %_32.if.else.1                            ; inst 103
_31.if.then.1:
  %66 = mul i32 %52, 17                                                            ; inst 104
  %67 = add i32 %66, 23                                                            ; inst 105
  %68 = srem i32 %67, 350                                                          ; inst 106
  %69 = add i32 %68, 1                                                             ; inst 107
  br label %_36.if.exit.1                                                          ; inst 108
_32.if.else.1:
  %70 = icmp eq i32 %47, 2                                                         ; inst 109
  br i1 %70, label %_33.if.then.2, label %_34.if.else.2                            ; inst 110
_33.if.then.2:
  %71 = mul i32 %52, 3                                                             ; inst 111
  %72 = srem i32 %71, 50                                                           ; inst 112
  %73 = add i32 %72, 1                                                             ; inst 113
  br label %_35.if.exit.2                                                          ; inst 114
_34.if.else.2:
  %74 = mul i32 %52, 7                                                             ; inst 115
  %75 = mul i32 %39, 11                                                            ; inst 116
  %76 = add i32 %74, %75                                                           ; inst 117
  %77 = srem i32 %76, 300                                                          ; inst 118
  %78 = add i32 %77, 1                                                             ; inst 119
  br label %_35.if.exit.2                                                          ; inst 120
_35.if.exit.2:
  %79 = phi i32 [%73, %_33.if.then.2], [%78, %_34.if.else.2]                       ; inst 121
  br label %_36.if.exit.1                                                          ; inst 122
_36.if.exit.1:
  %80 = phi i32 [%69, %_31.if.then.1], [%79, %_35.if.exit.2]                       ; inst 123
  br label %_37.if.exit.0                                                          ; inst 124
_37.if.exit.0:
  %81 = phi i32 [%64, %_29.if.then.0], [%80, %_36.if.exit.1]                       ; inst 125
  %82 = sext i32 %81 to i64                                                        ; inst 126
  %83 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 %82                ; inst 127
  %84 = load i32, i32* %83                                                         ; inst 128
  %85 = icmp sge i32 %84, 0                                                        ; inst 129
  br i1 %85, label %_38.lazy.then.2, label %_39.lazy.else.2                        ; inst 130
_38.lazy.then.2:
  %86 = sext i32 %84 to i64                                                        ; inst 131
  %87 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %86                 ; inst 132
  %88 = load i32, i32* %87                                                         ; inst 133
  %89 = icmp eq i32 %88, %81                                                       ; inst 134
  br label %_40.lazy.exit.2                                                        ; inst 135
_39.lazy.else.2:
  br label %_40.lazy.exit.2                                                        ; inst 136
_40.lazy.exit.2:
  %90 = phi i1 [%89, %_38.lazy.then.2], [0, %_39.lazy.else.2]                      ; inst 137
  br i1 %90, label %_41.if.then.3, label %_42.if.else.3                            ; inst 138
_41.if.then.3:
  %91 = add i32 %55, 1                                                             ; inst 139
  %92 = sext i32 %84 to i64                                                        ; inst 140
  %93 = getelementptr [100 x i32], [100 x i32]* %19, i32 0, i64 %92                ; inst 141
  store i32 %54, i32* %93                                                          ; inst 142
  %94 = sext i32 %84 to i64                                                        ; inst 143
  %95 = getelementptr [100 x i1], [100 x i1]* %25, i32 0, i64 %94                  ; inst 144
  store i1 1, i1* %95                                                              ; inst 145
  br label %_55.if.exit.3                                                          ; inst 146
_42.if.else.3:
  %96 = add i32 %56, 1                                                             ; inst 147
  %97 = call i32 @findFreeBufferSlot([100 x i32]* %1, i32 %0)                      ; inst 148
  %98 = icmp sge i32 %97, 0                                                        ; inst 149
  br i1 %98, label %_43.if.then.4, label %_44.if.else.4                            ; inst 150
_43.if.then.4:
  %99 = sext i32 %97 to i64                                                        ; inst 151
  %100 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %99                ; inst 152
  store i32 %81, i32* %100                                                         ; inst 153
  %101 = sext i32 %97 to i64                                                       ; inst 154
  %102 = getelementptr [100 x i1], [100 x i1]* %7, i32 0, i64 %101                 ; inst 155
  store i1 0, i1* %102                                                             ; inst 156
  %103 = sext i32 %97 to i64                                                       ; inst 157
  %104 = getelementptr [100 x i32], [100 x i32]* %13, i32 0, i64 %103              ; inst 158
  store i32 0, i32* %104                                                           ; inst 159
  %105 = sext i32 %97 to i64                                                       ; inst 160
  %106 = getelementptr [100 x i32], [100 x i32]* %19, i32 0, i64 %105              ; inst 161
  store i32 %54, i32* %106                                                         ; inst 162
  %107 = sext i32 %97 to i64                                                       ; inst 163
  %108 = getelementptr [100 x i1], [100 x i1]* %25, i32 0, i64 %107                ; inst 164
  store i1 1, i1* %108                                                             ; inst 165
  %109 = sext i32 %81 to i64                                                       ; inst 166
  %110 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 %109              ; inst 167
  store i32 %97, i32* %110                                                         ; inst 168
  br label %_54.if.exit.4                                                          ; inst 169
_44.if.else.4:
  %111 = call i32 @clockPageReplacement([100 x i32]* %1, [100 x i32]* %13, [100 x i1]* %25, i32 %53, i32 %0) ; inst 170
  %112 = icmp sge i32 %111, 0                                                      ; inst 171
  br i1 %112, label %_45.if.then.5, label %_52.if.else.5                           ; inst 172
_45.if.then.5:
  %113 = add i32 %111, 1                                                           ; inst 173
  %114 = srem i32 %113, %0                                                         ; inst 174
  %115 = sext i32 %111 to i64                                                      ; inst 175
  %116 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %115               ; inst 176
  %117 = load i32, i32* %116                                                       ; inst 177
  %118 = icmp sge i32 %117, 0                                                      ; inst 178
  br i1 %118, label %_46.lazy.then.3, label %_47.lazy.else.3                       ; inst 179
_46.lazy.then.3:
  %119 = icmp slt i32 %117, 500                                                    ; inst 180
  br label %_48.lazy.exit.3                                                        ; inst 181
_47.lazy.else.3:
  br label %_48.lazy.exit.3                                                        ; inst 182
_48.lazy.exit.3:
  %120 = phi i1 [%119, %_46.lazy.then.3], [0, %_47.lazy.else.3]                    ; inst 183
  br i1 %120, label %_49.if.then.6, label %_50.if.else.6                           ; inst 184
_49.if.then.6:
  %121 = sext i32 %117 to i64                                                      ; inst 185
  %122 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 %121              ; inst 186
  store i32 -1, i32* %122                                                          ; inst 187
  br label %_51.if.exit.6                                                          ; inst 188
_50.if.else.6:
  br label %_51.if.exit.6                                                          ; inst 189
_51.if.exit.6:
  %123 = add i32 %51, 1                                                            ; inst 190
  %124 = sext i32 %111 to i64                                                      ; inst 191
  %125 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %124               ; inst 192
  store i32 %81, i32* %125                                                         ; inst 193
  %126 = sext i32 %111 to i64                                                      ; inst 194
  %127 = getelementptr [100 x i1], [100 x i1]* %7, i32 0, i64 %126                 ; inst 195
  store i1 0, i1* %127                                                             ; inst 196
  %128 = sext i32 %111 to i64                                                      ; inst 197
  %129 = getelementptr [100 x i32], [100 x i32]* %13, i32 0, i64 %128              ; inst 198
  store i32 0, i32* %129                                                           ; inst 199
  %130 = sext i32 %111 to i64                                                      ; inst 200
  %131 = getelementptr [100 x i32], [100 x i32]* %19, i32 0, i64 %130              ; inst 201
  store i32 %54, i32* %131                                                         ; inst 202
  %132 = sext i32 %111 to i64                                                      ; inst 203
  %133 = getelementptr [100 x i1], [100 x i1]* %25, i32 0, i64 %132                ; inst 204
  store i1 1, i1* %133                                                             ; inst 205
  %134 = sext i32 %81 to i64                                                       ; inst 206
  %135 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 %134              ; inst 207
  store i32 %111, i32* %135                                                        ; inst 208
  br label %_53.if.exit.5                                                          ; inst 209
_52.if.else.5:
  br label %_53.if.exit.5                                                          ; inst 210
_53.if.exit.5:
  %136 = phi i32 [%123, %_51.if.exit.6], [%51, %_52.if.else.5]                     ; inst 211
  %137 = phi i32 [%114, %_51.if.exit.6], [%53, %_52.if.else.5]                     ; inst 212
  br label %_54.if.exit.4                                                          ; inst 213
_54.if.exit.4:
  %138 = phi i32 [%51, %_43.if.then.4], [%136, %_53.if.exit.5]                     ; inst 214
  %139 = phi i32 [%53, %_43.if.then.4], [%137, %_53.if.exit.5]                     ; inst 215
  br label %_55.if.exit.3                                                          ; inst 216
_55.if.exit.3:
  %140 = phi i32 [%51, %_41.if.then.3], [%138, %_54.if.exit.4]                     ; inst 217
  %141 = phi i32 [%53, %_41.if.then.3], [%139, %_54.if.exit.4]                     ; inst 218
  %142 = phi i32 [%91, %_41.if.then.3], [%55, %_54.if.exit.4]                      ; inst 219
  %143 = phi i32 [%56, %_41.if.then.3], [%96, %_54.if.exit.4]                      ; inst 220
  %144 = srem i32 %52, 3                                                           ; inst 221
  %145 = icmp eq i32 %144, 0                                                       ; inst 222
  br i1 %145, label %_56.lazy.then.4, label %_57.lazy.else.4                       ; inst 223
_56.lazy.then.4:
  %146 = sext i32 %81 to i64                                                       ; inst 224
  %147 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 %146              ; inst 225
  %148 = load i32, i32* %147                                                       ; inst 226
  %149 = icmp sge i32 %148, 0                                                      ; inst 227
  br label %_58.lazy.exit.4                                                        ; inst 228
_57.lazy.else.4:
  br label %_58.lazy.exit.4                                                        ; inst 229
_58.lazy.exit.4:
  %150 = phi i1 [%149, %_56.lazy.then.4], [0, %_57.lazy.else.4]                    ; inst 230
  br i1 %150, label %_59.if.then.7, label %_60.if.else.7                           ; inst 231
_59.if.then.7:
  %151 = sext i32 %81 to i64                                                       ; inst 232
  %152 = getelementptr [500 x i32], [500 x i32]* %31, i32 0, i64 %151              ; inst 233
  %153 = load i32, i32* %152                                                       ; inst 234
  %154 = sext i32 %153 to i64                                                      ; inst 235
  %155 = getelementptr [100 x i1], [100 x i1]* %7, i32 0, i64 %154                 ; inst 236
  store i1 1, i1* %155                                                             ; inst 237
  br label %_61.if.exit.7                                                          ; inst 238
_60.if.else.7:
  br label %_61.if.exit.7                                                          ; inst 239
_61.if.exit.7:
  %156 = add i32 %54, 1                                                            ; inst 240
  %157 = add i32 %52, 1                                                            ; inst 241
  %158 = add i32 %50, 1                                                            ; inst 242
  br label %_24.while.cond.1                                                       ; inst 243
_62.while.exit.1:
  %159 = add i32 %39, 1                                                            ; inst 244
  br label %_19.while.cond.0                                                       ; inst 245
_63.while.exit.0:
  %160 = mul i32 %42, 100                                                          ; inst 246
  %161 = add i32 %42, %43                                                          ; inst 247
  %162 = sdiv i32 %160, %161                                                       ; inst 248
  call void @printlnInt(i32 %42)                                                   ; inst 249
  call void @printlnInt(i32 %43)                                                   ; inst 250
  call void @printlnInt(i32 %162)                                                  ; inst 251
  call void @printlnInt(i32 %37)                                                   ; inst 252
  call void @printlnInt(i32 26008)                                                 ; inst 253
  ret void                                                                         ; inst 254
}

define i32 @findFreeBufferSlot([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%8, %_5.if.exit.0]                               ; inst 2
  %3 = icmp slt i32 %2, %1                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = sext i32 %2 to i64                                                          ; inst 5
  %5 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %4                   ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp eq i32 %6, -1                                                          ; inst 8
  br i1 %7, label %_3.if.then.0, label %_4.if.else.0                               ; inst 9
_3.if.then.0:
  ret i32 %2                                                                       ; inst 10
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 11
_5.if.exit.0:
  %8 = add i32 %2, 1                                                               ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_6.while.exit.0:
  ret i32 -1                                                                       ; inst 14
}

define i32 @clockPageReplacement([100 x i32]* %0, [100 x i32]* %1, [100 x i1]* %2, i32 %3, i32 %4) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%22, %_11.if.exit.2]                             ; inst 2
  %6 = phi i32 [%3, %_0.entry.0], [%19, %_11.if.exit.2]                            ; inst 3
  %7 = icmp slt i32 %5, 2                                                          ; inst 4
  br i1 %7, label %_2.while.body.0, label %_12.while.exit.0                        ; inst 5
_2.while.body.0:
  %8 = sext i32 %6 to i64                                                          ; inst 6
  %9 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %8                   ; inst 7
  %10 = load i32, i32* %9                                                          ; inst 8
  %11 = icmp eq i32 %10, 0                                                         ; inst 9
  br i1 %11, label %_3.if.then.0, label %_7.if.else.0                              ; inst 10
_3.if.then.0:
  %12 = sext i32 %6 to i64                                                         ; inst 11
  %13 = getelementptr [100 x i1], [100 x i1]* %2, i32 0, i64 %12                   ; inst 12
  %14 = load i1, i1* %13                                                           ; inst 13
  %15 = icmp eq i1 %14, 0                                                          ; inst 14
  br i1 %15, label %_4.if.then.1, label %_5.if.else.1                              ; inst 15
_4.if.then.1:
  ret i32 %6                                                                       ; inst 16
_5.if.else.1:
  %16 = sext i32 %6 to i64                                                         ; inst 17
  %17 = getelementptr [100 x i1], [100 x i1]* %2, i32 0, i64 %16                   ; inst 18
  store i1 0, i1* %17                                                              ; inst 19
  br label %_6.if.exit.1                                                           ; inst 20
_6.if.exit.1:
  br label %_8.if.exit.0                                                           ; inst 21
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 22
_8.if.exit.0:
  %18 = add i32 %6, 1                                                              ; inst 23
  %19 = srem i32 %18, %4                                                           ; inst 24
  %20 = icmp eq i32 %19, %3                                                        ; inst 25
  br i1 %20, label %_9.if.then.2, label %_10.if.else.2                             ; inst 26
_9.if.then.2:
  %21 = add i32 %5, 1                                                              ; inst 27
  br label %_11.if.exit.2                                                          ; inst 28
_10.if.else.2:
  br label %_11.if.exit.2                                                          ; inst 29
_11.if.exit.2:
  %22 = phi i32 [%21, %_9.if.then.2], [%5, %_10.if.else.2]                         ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 32
_13.while.cond.1:
  %23 = phi i32 [0, %_12.while.exit.0], [%29, %_17.if.exit.3]                      ; inst 33
  %24 = icmp slt i32 %23, %4                                                       ; inst 34
  br i1 %24, label %_14.while.body.1, label %_18.while.exit.1                      ; inst 35
_14.while.body.1:
  %25 = sext i32 %23 to i64                                                        ; inst 36
  %26 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %25                 ; inst 37
  %27 = load i32, i32* %26                                                         ; inst 38
  %28 = icmp eq i32 %27, 0                                                         ; inst 39
  br i1 %28, label %_15.if.then.3, label %_16.if.else.3                            ; inst 40
_15.if.then.3:
  ret i32 %23                                                                      ; inst 41
_16.if.else.3:
  br label %_17.if.exit.3                                                          ; inst 42
_17.if.exit.3:
  %29 = add i32 %23, 1                                                             ; inst 43
  br label %_13.while.cond.1                                                       ; inst 44
_18.while.exit.1:
  ret i32 -1                                                                       ; inst 45
}

define void @performQueryOptimizationTest(i32 %0) {
_0.entry.0:
  %1 = alloca [5 x i32]                                                            ; inst 1
  %2 = alloca [5 x i32]                                                            ; inst 2
  %3 = alloca [5 x i32]                                                            ; inst 3
  %4 = alloca [5 x i32]                                                            ; inst 4
  %5 = alloca [5 x i32]                                                            ; inst 5
  %6 = alloca [5 x i32]                                                            ; inst 6
  %7 = alloca [5 x [3 x i32]]                                                      ; inst 7
  %8 = alloca [5 x i32]                                                            ; inst 8
  call void @printlnInt(i32 26009)                                                 ; inst 9
  %9 = alloca [5 x i32]                                                            ; inst 10
  %10 = getelementptr [5 x i32], [5 x i32]* %9, i32 0, i32 0                       ; inst 11
  store i32 100, i32* %10                                                          ; inst 12
  %11 = getelementptr [5 x i32], [5 x i32]* %9, i32 0, i32 1                       ; inst 13
  store i32 200, i32* %11                                                          ; inst 14
  %12 = getelementptr [5 x i32], [5 x i32]* %9, i32 0, i32 2                       ; inst 15
  store i32 150, i32* %12                                                          ; inst 16
  %13 = getelementptr [5 x i32], [5 x i32]* %9, i32 0, i32 3                       ; inst 17
  store i32 300, i32* %13                                                          ; inst 18
  %14 = getelementptr [5 x i32], [5 x i32]* %9, i32 0, i32 4                       ; inst 19
  store i32 250, i32* %14                                                          ; inst 20
  %15 = alloca [5 x i32]                                                           ; inst 21
  %16 = getelementptr [5 x i32], [5 x i32]* %15, i32 0, i32 0                      ; inst 22
  store i32 10, i32* %16                                                           ; inst 23
  %17 = getelementptr [5 x i32], [5 x i32]* %15, i32 0, i32 1                      ; inst 24
  store i32 20, i32* %17                                                           ; inst 25
  %18 = getelementptr [5 x i32], [5 x i32]* %15, i32 0, i32 2                      ; inst 26
  store i32 15, i32* %18                                                           ; inst 27
  %19 = getelementptr [5 x i32], [5 x i32]* %15, i32 0, i32 3                      ; inst 28
  store i32 30, i32* %19                                                           ; inst 29
  %20 = getelementptr [5 x i32], [5 x i32]* %15, i32 0, i32 4                      ; inst 30
  store i32 25, i32* %20                                                           ; inst 31
  %21 = alloca [5 x [3 x i32]]                                                     ; inst 32
  %22 = alloca [3 x i32]                                                           ; inst 33
  %23 = getelementptr [3 x i32], [3 x i32]* %22, i32 0, i32 0                      ; inst 34
  store i32 10, i32* %23                                                           ; inst 35
  %24 = getelementptr [3 x i32], [3 x i32]* %22, i32 0, i32 1                      ; inst 36
  store i32 25, i32* %24                                                           ; inst 37
  %25 = getelementptr [3 x i32], [3 x i32]* %22, i32 0, i32 2                      ; inst 38
  store i32 50, i32* %25                                                           ; inst 39
  %26 = getelementptr [5 x [3 x i32]], [5 x [3 x i32]]* %21, i32 0, i32 0          ; inst 40
  br label %_1.array.cond.0                                                        ; inst 41
_1.array.cond.0:
  %27 = phi i32 [0, %_0.entry.0], [%30, %_2.array.body.0]                          ; inst 42
  %28 = icmp slt i32 %27, 5                                                        ; inst 43
  br i1 %28, label %_2.array.body.0, label %_3.array.exit.0                        ; inst 44
_2.array.body.0:
  %29 = getelementptr [3 x i32], [3 x i32]* %26, i32 %27                           ; inst 45
  call void @memcpy([3 x i32]* %29, [3 x i32]* %22, i64 12)                        ; inst 46
  %30 = add i32 %27, 1                                                             ; inst 47
  br label %_1.array.cond.0                                                        ; inst 48
_3.array.exit.0:
  %31 = alloca [20 x i32]                                                          ; inst 49
  %32 = getelementptr [20 x i32], [20 x i32]* %31, i32 0, i32 0                    ; inst 50
  br label %_4.array.cond.1                                                        ; inst 51
_4.array.cond.1:
  %33 = phi i32 [0, %_3.array.exit.0], [%36, %_5.array.body.1]                     ; inst 52
  %34 = icmp slt i32 %33, 20                                                       ; inst 53
  br i1 %34, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 54
_5.array.body.1:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 55
  store i32 0, i32* %35                                                            ; inst 56
  %36 = add i32 %33, 1                                                             ; inst 57
  br label %_4.array.cond.1                                                        ; inst 58
_6.array.exit.1:
  %37 = alloca [20 x i32]                                                          ; inst 59
  %38 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i32 0                    ; inst 60
  br label %_7.array.cond.2                                                        ; inst 61
_7.array.cond.2:
  %39 = phi i32 [0, %_6.array.exit.1], [%42, %_8.array.body.2]                     ; inst 62
  %40 = icmp slt i32 %39, 20                                                       ; inst 63
  br i1 %40, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 64
_8.array.body.2:
  %41 = getelementptr i32, i32* %38, i32 %39                                       ; inst 65
  store i32 0, i32* %41                                                            ; inst 66
  %42 = add i32 %39, 1                                                             ; inst 67
  br label %_7.array.cond.2                                                        ; inst 68
_9.array.exit.2:
  br label %_10.while.cond.0                                                       ; inst 69
_10.while.cond.0:
  %43 = phi i32 [0, %_9.array.exit.2], [%88, %_29.if.exit.3]                       ; inst 70
  %44 = phi i32 [0, %_9.array.exit.2], [%49, %_29.if.exit.3]                       ; inst 71
  %45 = icmp slt i32 %43, 10                                                       ; inst 72
  br i1 %45, label %_11.while.body.0, label %_30.while.exit.0                      ; inst 73
_11.while.body.0:
  %46 = srem i32 %43, 3                                                            ; inst 74
  %47 = add i32 %46, 2                                                             ; inst 75
  br label %_12.while.cond.1                                                       ; inst 76
_12.while.cond.1:
  %48 = phi i32 [-1, %_11.while.body.0], [%75, %_25.if.exit.2]                     ; inst 77
  %49 = phi i32 [%44, %_11.while.body.0], [%77, %_25.if.exit.2]                    ; inst 78
  %50 = phi i32 [999999, %_11.while.body.0], [%76, %_25.if.exit.2]                 ; inst 79
  %51 = phi i32 [0, %_11.while.body.0], [%78, %_25.if.exit.2]                      ; inst 80
  %52 = icmp slt i32 %51, 6                                                        ; inst 81
  br i1 %52, label %_13.lazy.then.0, label %_14.lazy.else.0                        ; inst 82
_13.lazy.then.0:
  %53 = icmp slt i32 %49, 20                                                       ; inst 83
  br label %_15.lazy.exit.0                                                        ; inst 84
_14.lazy.else.0:
  br label %_15.lazy.exit.0                                                        ; inst 85
_15.lazy.exit.0:
  %54 = phi i1 [%53, %_13.lazy.then.0], [0, %_14.lazy.else.0]                      ; inst 86
  br i1 %54, label %_16.while.body.1, label %_26.while.exit.1                      ; inst 87
_16.while.body.1:
  %55 = srem i32 %51, 3                                                            ; inst 88
  %56 = icmp eq i32 %55, 0                                                         ; inst 89
  br i1 %56, label %_17.if.then.0, label %_18.if.else.0                            ; inst 90
_17.if.then.0:
  call void @memcpy([5 x i32]* %1, [5 x i32]* %9, i64 20)                          ; inst 91
  call void @memcpy([5 x i32]* %2, [5 x i32]* %15, i64 20)                         ; inst 92
  %57 = call i32 @estimateNestedLoopCost([5 x i32]* %1, [5 x i32]* %2, i32 %47, i32 %43) ; inst 93
  %58 = sext i32 %49 to i64                                                        ; inst 94
  %59 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %58                  ; inst 95
  store i32 0, i32* %59                                                            ; inst 96
  br label %_22.if.exit.0                                                          ; inst 97
_18.if.else.0:
  %60 = srem i32 %51, 3                                                            ; inst 98
  %61 = icmp eq i32 %60, 1                                                         ; inst 99
  br i1 %61, label %_19.if.then.1, label %_20.if.else.1                            ; inst 100
_19.if.then.1:
  call void @memcpy([5 x i32]* %3, [5 x i32]* %9, i64 20)                          ; inst 101
  call void @memcpy([5 x i32]* %4, [5 x i32]* %15, i64 20)                         ; inst 102
  %62 = call i32 @estimateHashJoinCost([5 x i32]* %3, [5 x i32]* %4, i32 %47, i32 %43) ; inst 103
  %63 = sext i32 %49 to i64                                                        ; inst 104
  %64 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %63                  ; inst 105
  store i32 1, i32* %64                                                            ; inst 106
  br label %_21.if.exit.1                                                          ; inst 107
_20.if.else.1:
  call void @memcpy([5 x i32]* %5, [5 x i32]* %9, i64 20)                          ; inst 108
  call void @memcpy([5 x i32]* %6, [5 x i32]* %15, i64 20)                         ; inst 109
  %65 = call i32 @estimateSortMergeCost([5 x i32]* %5, [5 x i32]* %6, i32 %47, i32 %43) ; inst 110
  %66 = sext i32 %49 to i64                                                        ; inst 111
  %67 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %66                  ; inst 112
  store i32 2, i32* %67                                                            ; inst 113
  br label %_21.if.exit.1                                                          ; inst 114
_21.if.exit.1:
  %68 = phi i32 [%62, %_19.if.then.1], [%65, %_20.if.else.1]                       ; inst 115
  br label %_22.if.exit.0                                                          ; inst 116
_22.if.exit.0:
  %69 = phi i32 [%57, %_17.if.then.0], [%68, %_21.if.exit.1]                       ; inst 117
  call void @memcpy([5 x [3 x i32]]* %7, [5 x [3 x i32]]* %21, i64 60)             ; inst 118
  %70 = call i32 @selectOptimalIndex([5 x [3 x i32]]* %7, i32 %47, i32 %43)        ; inst 119
  %71 = add i32 %69, %70                                                           ; inst 120
  %72 = sext i32 %49 to i64                                                        ; inst 121
  %73 = getelementptr [20 x i32], [20 x i32]* %31, i32 0, i64 %72                  ; inst 122
  store i32 %71, i32* %73                                                          ; inst 123
  %74 = icmp slt i32 %71, %50                                                      ; inst 124
  br i1 %74, label %_23.if.then.2, label %_24.if.else.2                            ; inst 125
_23.if.then.2:
  br label %_25.if.exit.2                                                          ; inst 126
_24.if.else.2:
  br label %_25.if.exit.2                                                          ; inst 127
_25.if.exit.2:
  %75 = phi i32 [%49, %_23.if.then.2], [%48, %_24.if.else.2]                       ; inst 128
  %76 = phi i32 [%71, %_23.if.then.2], [%50, %_24.if.else.2]                       ; inst 129
  %77 = add i32 %49, 1                                                             ; inst 130
  %78 = add i32 %51, 1                                                             ; inst 131
  br label %_12.while.cond.1                                                       ; inst 132
_26.while.exit.1:
  %79 = icmp sge i32 %48, 0                                                        ; inst 133
  br i1 %79, label %_27.if.then.3, label %_28.if.else.3                            ; inst 134
_27.if.then.3:
  %80 = sext i32 %48 to i64                                                        ; inst 135
  %81 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %80                  ; inst 136
  %82 = load i32, i32* %81                                                         ; inst 137
  call void @memcpy([5 x i32]* %8, [5 x i32]* %9, i64 20)                          ; inst 138
  %83 = call i32 @simulatePlanExecution(i32 %82, [5 x i32]* %8, i32 %47)           ; inst 139
  %84 = sext i32 %48 to i64                                                        ; inst 140
  %85 = getelementptr [20 x i32], [20 x i32]* %31, i32 0, i64 %84                  ; inst 141
  %86 = load i32, i32* %85                                                         ; inst 142
  %87 = call i32 @calculateCostAccuracy(i32 %86, i32 %83)                          ; inst 143
  call void @printlnInt(i32 %87)                                                   ; inst 144
  br label %_29.if.exit.3                                                          ; inst 145
_28.if.else.3:
  br label %_29.if.exit.3                                                          ; inst 146
_29.if.exit.3:
  %88 = add i32 %43, 1                                                             ; inst 147
  br label %_10.while.cond.0                                                       ; inst 148
_30.while.exit.0:
  br label %_31.while.cond.2                                                       ; inst 149
_31.while.cond.2:
  %89 = phi i32 [0, %_30.while.exit.0], [%110, %_38.if.exit.4]                     ; inst 150
  %90 = phi i32 [0, %_30.while.exit.0], [%107, %_38.if.exit.4]                     ; inst 151
  %91 = phi i32 [0, %_30.while.exit.0], [%108, %_38.if.exit.4]                     ; inst 152
  %92 = phi i32 [0, %_30.while.exit.0], [%109, %_38.if.exit.4]                     ; inst 153
  %93 = icmp slt i32 %89, %44                                                      ; inst 154
  br i1 %93, label %_32.while.body.2, label %_39.while.exit.2                      ; inst 155
_32.while.body.2:
  %94 = sext i32 %89 to i64                                                        ; inst 156
  %95 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %94                  ; inst 157
  %96 = load i32, i32* %95                                                         ; inst 158
  %97 = icmp eq i32 %96, 0                                                         ; inst 159
  br i1 %97, label %_33.if.then.4, label %_34.if.else.4                            ; inst 160
_33.if.then.4:
  %98 = add i32 %92, 1                                                             ; inst 161
  br label %_38.if.exit.4                                                          ; inst 162
_34.if.else.4:
  %99 = sext i32 %89 to i64                                                        ; inst 163
  %100 = getelementptr [20 x i32], [20 x i32]* %37, i32 0, i64 %99                 ; inst 164
  %101 = load i32, i32* %100                                                       ; inst 165
  %102 = icmp eq i32 %101, 1                                                       ; inst 166
  br i1 %102, label %_35.if.then.5, label %_36.if.else.5                           ; inst 167
_35.if.then.5:
  %103 = add i32 %91, 1                                                            ; inst 168
  br label %_37.if.exit.5                                                          ; inst 169
_36.if.else.5:
  %104 = add i32 %90, 1                                                            ; inst 170
  br label %_37.if.exit.5                                                          ; inst 171
_37.if.exit.5:
  %105 = phi i32 [%90, %_35.if.then.5], [%104, %_36.if.else.5]                     ; inst 172
  %106 = phi i32 [%103, %_35.if.then.5], [%91, %_36.if.else.5]                     ; inst 173
  br label %_38.if.exit.4                                                          ; inst 174
_38.if.exit.4:
  %107 = phi i32 [%90, %_33.if.then.4], [%105, %_37.if.exit.5]                     ; inst 175
  %108 = phi i32 [%91, %_33.if.then.4], [%106, %_37.if.exit.5]                     ; inst 176
  %109 = phi i32 [%98, %_33.if.then.4], [%92, %_37.if.exit.5]                      ; inst 177
  %110 = add i32 %89, 1                                                            ; inst 178
  br label %_31.while.cond.2                                                       ; inst 179
_39.while.exit.2:
  call void @printlnInt(i32 %92)                                                   ; inst 180
  call void @printlnInt(i32 %91)                                                   ; inst 181
  call void @printlnInt(i32 %90)                                                   ; inst 182
  call void @printlnInt(i32 26010)                                                 ; inst 183
  ret void                                                                         ; inst 184
}

define i32 @estimateNestedLoopCost([5 x i32]* %0, [5 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%19, %_2.while.body.0]                           ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%18, %_2.while.body.0]                           ; inst 3
  %6 = sub i32 %2, 1                                                               ; inst 4
  %7 = icmp slt i32 %4, %6                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = srem i32 %4, 5                                                              ; inst 7
  %9 = add i32 %4, 1                                                               ; inst 8
  %10 = srem i32 %9, 5                                                             ; inst 9
  %11 = sext i32 %8 to i64                                                         ; inst 10
  %12 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i64 %11                     ; inst 11
  %13 = load i32, i32* %12                                                         ; inst 12
  %14 = sext i32 %10 to i64                                                        ; inst 13
  %15 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %14                     ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = mul i32 %13, %16                                                           ; inst 16
  %18 = add i32 %5, %17                                                            ; inst 17
  %19 = add i32 %4, 1                                                              ; inst 18
  br label %_1.while.cond.0                                                        ; inst 19
_3.while.exit.0:
  %20 = mul i32 %3, 100                                                            ; inst 20
  %21 = add i32 %5, %20                                                            ; inst 21
  ret i32 %21                                                                      ; inst 22
}

define i32 @estimateHashJoinCost([5 x i32]* %0, [5 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%24, %_2.while.body.0]                           ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%23, %_2.while.body.0]                           ; inst 3
  %6 = sub i32 %2, 1                                                               ; inst 4
  %7 = icmp slt i32 %4, %6                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = srem i32 %4, 5                                                              ; inst 7
  %9 = add i32 %4, 1                                                               ; inst 8
  %10 = srem i32 %9, 5                                                             ; inst 9
  %11 = sext i32 %8 to i64                                                         ; inst 10
  %12 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %11                     ; inst 11
  %13 = load i32, i32* %12                                                         ; inst 12
  %14 = add i32 %5, %13                                                            ; inst 13
  %15 = sext i32 %10 to i64                                                        ; inst 14
  %16 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %15                     ; inst 15
  %17 = load i32, i32* %16                                                         ; inst 16
  %18 = add i32 %14, %17                                                           ; inst 17
  %19 = sext i32 %8 to i64                                                         ; inst 18
  %20 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i64 %19                     ; inst 19
  %21 = load i32, i32* %20                                                         ; inst 20
  %22 = sdiv i32 %21, 10                                                           ; inst 21
  %23 = add i32 %18, %22                                                           ; inst 22
  %24 = add i32 %4, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_3.while.exit.0:
  %25 = mul i32 %3, 50                                                             ; inst 25
  %26 = add i32 %5, %25                                                            ; inst 26
  ret i32 %26                                                                      ; inst 27
}

define i32 @estimateSortMergeCost([5 x i32]* %0, [5 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%37, %_2.while.body.0]                           ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%36, %_2.while.body.0]                           ; inst 3
  %6 = sub i32 %2, 1                                                               ; inst 4
  %7 = icmp slt i32 %4, %6                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %8 = srem i32 %4, 5                                                              ; inst 7
  %9 = add i32 %4, 1                                                               ; inst 8
  %10 = srem i32 %9, 5                                                             ; inst 9
  %11 = sext i32 %8 to i64                                                         ; inst 10
  %12 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i64 %11                     ; inst 11
  %13 = load i32, i32* %12                                                         ; inst 12
  %14 = sext i32 %8 to i64                                                         ; inst 13
  %15 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i64 %14                     ; inst 14
  %16 = load i32, i32* %15                                                         ; inst 15
  %17 = call i32 @logBase2(i32 %16)                                                ; inst 16
  %18 = mul i32 %13, %17                                                           ; inst 17
  %19 = sext i32 %10 to i64                                                        ; inst 18
  %20 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i64 %19                     ; inst 19
  %21 = load i32, i32* %20                                                         ; inst 20
  %22 = sext i32 %10 to i64                                                        ; inst 21
  %23 = getelementptr [5 x i32], [5 x i32]* %0, i32 0, i64 %22                     ; inst 22
  %24 = load i32, i32* %23                                                         ; inst 23
  %25 = call i32 @logBase2(i32 %24)                                                ; inst 24
  %26 = mul i32 %21, %25                                                           ; inst 25
  %27 = add i32 %5, %18                                                            ; inst 26
  %28 = add i32 %27, %26                                                           ; inst 27
  %29 = sext i32 %8 to i64                                                         ; inst 28
  %30 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %29                     ; inst 29
  %31 = load i32, i32* %30                                                         ; inst 30
  %32 = add i32 %28, %31                                                           ; inst 31
  %33 = sext i32 %10 to i64                                                        ; inst 32
  %34 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %33                     ; inst 33
  %35 = load i32, i32* %34                                                         ; inst 34
  %36 = add i32 %32, %35                                                           ; inst 35
  %37 = add i32 %4, 1                                                              ; inst 36
  br label %_1.while.cond.0                                                        ; inst 37
_3.while.exit.0:
  %38 = mul i32 %3, 75                                                             ; inst 38
  %39 = add i32 %5, %38                                                            ; inst 39
  ret i32 %39                                                                      ; inst 40
}

define i32 @logBase2(i32 %0) {
_0.entry.0:
  %1 = icmp sle i32 %0, 1                                                          ; inst 1
  br i1 %1, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 1                                                                        ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %2 = icmp sle i32 %0, 2                                                          ; inst 5
  br i1 %2, label %_4.if.then.1, label %_5.if.else.1                               ; inst 6
_4.if.then.1:
  ret i32 1                                                                        ; inst 7
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 8
_6.if.exit.1:
  %3 = icmp sle i32 %0, 4                                                          ; inst 9
  br i1 %3, label %_7.if.then.2, label %_8.if.else.2                               ; inst 10
_7.if.then.2:
  ret i32 2                                                                        ; inst 11
_8.if.else.2:
  br label %_9.if.exit.2                                                           ; inst 12
_9.if.exit.2:
  %4 = icmp sle i32 %0, 8                                                          ; inst 13
  br i1 %4, label %_10.if.then.3, label %_11.if.else.3                             ; inst 14
_10.if.then.3:
  ret i32 3                                                                        ; inst 15
_11.if.else.3:
  br label %_12.if.exit.3                                                          ; inst 16
_12.if.exit.3:
  %5 = icmp sle i32 %0, 16                                                         ; inst 17
  br i1 %5, label %_13.if.then.4, label %_14.if.else.4                             ; inst 18
_13.if.then.4:
  ret i32 4                                                                        ; inst 19
_14.if.else.4:
  br label %_15.if.exit.4                                                          ; inst 20
_15.if.exit.4:
  %6 = icmp sle i32 %0, 32                                                         ; inst 21
  br i1 %6, label %_16.if.then.5, label %_17.if.else.5                             ; inst 22
_16.if.then.5:
  ret i32 5                                                                        ; inst 23
_17.if.else.5:
  br label %_18.if.exit.5                                                          ; inst 24
_18.if.exit.5:
  %7 = icmp sle i32 %0, 64                                                         ; inst 25
  br i1 %7, label %_19.if.then.6, label %_20.if.else.6                             ; inst 26
_19.if.then.6:
  ret i32 6                                                                        ; inst 27
_20.if.else.6:
  br label %_21.if.exit.6                                                          ; inst 28
_21.if.exit.6:
  %8 = icmp sle i32 %0, 128                                                        ; inst 29
  br i1 %8, label %_22.if.then.7, label %_23.if.else.7                             ; inst 30
_22.if.then.7:
  ret i32 7                                                                        ; inst 31
_23.if.else.7:
  br label %_24.if.exit.7                                                          ; inst 32
_24.if.exit.7:
  %9 = icmp sle i32 %0, 256                                                        ; inst 33
  br i1 %9, label %_25.if.then.8, label %_26.if.else.8                             ; inst 34
_25.if.then.8:
  ret i32 8                                                                        ; inst 35
_26.if.else.8:
  br label %_27.if.exit.8                                                          ; inst 36
_27.if.exit.8:
  ret i32 9                                                                        ; inst 37
}

define i32 @selectOptimalIndex([5 x [3 x i32]]* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%21, %_8.if.exit.0]                              ; inst 2
  %4 = phi i32 [0, %_0.entry.0], [%20, %_8.if.exit.0]                              ; inst 3
  %5 = icmp slt i32 %3, %1                                                         ; inst 4
  br i1 %5, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 5
_2.while.body.0:
  %6 = srem i32 %3, 5                                                              ; inst 6
  %7 = add i32 %2, %3                                                              ; inst 7
  %8 = srem i32 %7, 3                                                              ; inst 8
  %9 = sext i32 %6 to i64                                                          ; inst 9
  %10 = getelementptr [5 x [3 x i32]], [5 x [3 x i32]]* %0, i32 0, i64 %9          ; inst 10
  %11 = sext i32 %8 to i64                                                         ; inst 11
  %12 = getelementptr [3 x i32], [3 x i32]* %10, i32 0, i64 %11                    ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = icmp slt i32 %13, 20                                                       ; inst 14
  br i1 %14, label %_3.if.then.0, label %_4.if.else.0                              ; inst 15
_3.if.then.0:
  %15 = add i32 %4, 10                                                             ; inst 16
  br label %_8.if.exit.0                                                           ; inst 17
_4.if.else.0:
  %16 = icmp slt i32 %13, 40                                                       ; inst 18
  br i1 %16, label %_5.if.then.1, label %_6.if.else.1                              ; inst 19
_5.if.then.1:
  %17 = add i32 %4, 25                                                             ; inst 20
  br label %_7.if.exit.1                                                           ; inst 21
_6.if.else.1:
  %18 = add i32 %4, 50                                                             ; inst 22
  br label %_7.if.exit.1                                                           ; inst 23
_7.if.exit.1:
  %19 = phi i32 [%17, %_5.if.then.1], [%18, %_6.if.else.1]                         ; inst 24
  br label %_8.if.exit.0                                                           ; inst 25
_8.if.exit.0:
  %20 = phi i32 [%15, %_3.if.then.0], [%19, %_7.if.exit.1]                         ; inst 26
  %21 = add i32 %3, 1                                                              ; inst 27
  br label %_1.while.cond.0                                                        ; inst 28
_9.while.exit.0:
  ret i32 %4                                                                       ; inst 29
}

define i32 @simulatePlanExecution(i32 %0, [5 x i32]* %1, i32 %2) {
_0.entry.0:
  %3 = icmp eq i32 %0, 0                                                           ; inst 1
  br i1 %3, label %_1.if.then.0, label %_5.if.else.0                               ; inst 2
_1.if.then.0:
  br label %_2.while.cond.0                                                        ; inst 3
_2.while.cond.0:
  %4 = phi i32 [0, %_1.if.then.0], [%19, %_3.while.body.0]                         ; inst 4
  %5 = phi i32 [0, %_1.if.then.0], [%20, %_3.while.body.0]                         ; inst 5
  %6 = sub i32 %2, 1                                                               ; inst 6
  %7 = icmp slt i32 %5, %6                                                         ; inst 7
  br i1 %7, label %_3.while.body.0, label %_4.while.exit.0                         ; inst 8
_3.while.body.0:
  %8 = sext i32 %5 to i64                                                          ; inst 9
  %9 = urem i64 %8, 5                                                              ; inst 10
  %10 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %9                      ; inst 11
  %11 = load i32, i32* %10                                                         ; inst 12
  %12 = sext i32 %5 to i64                                                         ; inst 13
  %13 = add i64 %12, 1                                                             ; inst 14
  %14 = urem i64 %13, 5                                                            ; inst 15
  %15 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %14                     ; inst 16
  %16 = load i32, i32* %15                                                         ; inst 17
  %17 = mul i32 %11, %16                                                           ; inst 18
  %18 = sdiv i32 %17, 100                                                          ; inst 19
  %19 = add i32 %4, %18                                                            ; inst 20
  %20 = add i32 %5, 1                                                              ; inst 21
  br label %_2.while.cond.0                                                        ; inst 22
_4.while.exit.0:
  br label %_15.if.exit.0                                                          ; inst 23
_5.if.else.0:
  %21 = icmp eq i32 %0, 1                                                          ; inst 24
  br i1 %21, label %_6.if.then.1, label %_10.if.else.1                             ; inst 25
_6.if.then.1:
  br label %_7.while.cond.1                                                        ; inst 26
_7.while.cond.1:
  %22 = phi i32 [0, %_6.if.then.1], [%38, %_8.while.body.1]                        ; inst 27
  %23 = phi i32 [0, %_6.if.then.1], [%39, %_8.while.body.1]                        ; inst 28
  %24 = sub i32 %2, 1                                                              ; inst 29
  %25 = icmp slt i32 %23, %24                                                      ; inst 30
  br i1 %25, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 31
_8.while.body.1:
  %26 = sext i32 %23 to i64                                                        ; inst 32
  %27 = urem i64 %26, 5                                                            ; inst 33
  %28 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %27                     ; inst 34
  %29 = load i32, i32* %28                                                         ; inst 35
  %30 = sext i32 %23 to i64                                                        ; inst 36
  %31 = add i64 %30, 1                                                             ; inst 37
  %32 = urem i64 %31, 5                                                            ; inst 38
  %33 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %32                     ; inst 39
  %34 = load i32, i32* %33                                                         ; inst 40
  %35 = add i32 %22, %29                                                           ; inst 41
  %36 = add i32 %35, %34                                                           ; inst 42
  %37 = sdiv i32 %29, 10                                                           ; inst 43
  %38 = add i32 %36, %37                                                           ; inst 44
  %39 = add i32 %23, 1                                                             ; inst 45
  br label %_7.while.cond.1                                                        ; inst 46
_9.while.exit.1:
  br label %_14.if.exit.1                                                          ; inst 47
_10.if.else.1:
  br label %_11.while.cond.2                                                       ; inst 48
_11.while.cond.2:
  %40 = phi i32 [0, %_10.if.else.1], [%59, %_12.while.body.2]                      ; inst 49
  %41 = phi i32 [0, %_10.if.else.1], [%58, %_12.while.body.2]                      ; inst 50
  %42 = sub i32 %2, 1                                                              ; inst 51
  %43 = icmp slt i32 %40, %42                                                      ; inst 52
  br i1 %43, label %_12.while.body.2, label %_13.while.exit.2                      ; inst 53
_12.while.body.2:
  %44 = sext i32 %40 to i64                                                        ; inst 54
  %45 = urem i64 %44, 5                                                            ; inst 55
  %46 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %45                     ; inst 56
  %47 = load i32, i32* %46                                                         ; inst 57
  %48 = sext i32 %40 to i64                                                        ; inst 58
  %49 = add i64 %48, 1                                                             ; inst 59
  %50 = urem i64 %49, 5                                                            ; inst 60
  %51 = getelementptr [5 x i32], [5 x i32]* %1, i32 0, i64 %50                     ; inst 61
  %52 = load i32, i32* %51                                                         ; inst 62
  %53 = mul i32 %47, 2                                                             ; inst 63
  %54 = add i32 %41, %53                                                           ; inst 64
  %55 = mul i32 %52, 2                                                             ; inst 65
  %56 = add i32 %54, %55                                                           ; inst 66
  %57 = add i32 %56, %47                                                           ; inst 67
  %58 = add i32 %57, %52                                                           ; inst 68
  %59 = add i32 %40, 1                                                             ; inst 69
  br label %_11.while.cond.2                                                       ; inst 70
_13.while.exit.2:
  br label %_14.if.exit.1                                                          ; inst 71
_14.if.exit.1:
  %60 = phi i32 [%22, %_9.while.exit.1], [%41, %_13.while.exit.2]                  ; inst 72
  br label %_15.if.exit.0                                                          ; inst 73
_15.if.exit.0:
  %61 = phi i32 [%4, %_4.while.exit.0], [%60, %_14.if.exit.1]                      ; inst 74
  ret i32 %61                                                                      ; inst 75
}

define i32 @calculateCostAccuracy(i32 %0, i32 %1) {
_0.entry.0:
  %2 = icmp sgt i32 %0, %1                                                         ; inst 1
  br i1 %2, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  %3 = sub i32 %0, %1                                                              ; inst 3
  br label %_3.if.exit.0                                                           ; inst 4
_2.if.else.0:
  %4 = sub i32 %1, %0                                                              ; inst 5
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %5 = phi i32 [%3, %_1.if.then.0], [%4, %_2.if.else.0]                            ; inst 7
  %6 = mul i32 %5, 100                                                             ; inst 8
  %7 = sdiv i32 %6, %1                                                             ; inst 9
  %8 = sub i32 100, %7                                                             ; inst 10
  %9 = icmp slt i32 %8, 0                                                          ; inst 11
  br i1 %9, label %_4.if.then.1, label %_5.if.else.1                               ; inst 12
_4.if.then.1:
  br label %_6.if.exit.1                                                           ; inst 13
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 14
_6.if.exit.1:
  %10 = phi i32 [0, %_4.if.then.1], [%8, %_5.if.else.1]                            ; inst 15
  ret i32 %10                                                                      ; inst 16
}

define void @performHashTableTest(i32 %0) {
_0.entry.0:
  call void @printlnInt(i32 26011)                                                 ; inst 1
  %1 = alloca [500 x i32]                                                          ; inst 2
  %2 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i32 0                    ; inst 3
  br label %_1.array.cond.0                                                        ; inst 4
_1.array.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%6, %_2.array.body.0]                            ; inst 5
  %4 = icmp slt i32 %3, 500                                                        ; inst 6
  br i1 %4, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 7
_2.array.body.0:
  %5 = getelementptr i32, i32* %2, i32 %3                                          ; inst 8
  store i32 -1, i32* %5                                                            ; inst 9
  %6 = add i32 %3, 1                                                               ; inst 10
  br label %_1.array.cond.0                                                        ; inst 11
_3.array.exit.0:
  %7 = alloca [500 x i32]                                                          ; inst 12
  %8 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i32 0                    ; inst 13
  br label %_4.array.cond.1                                                        ; inst 14
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 15
  %10 = icmp slt i32 %9, 500                                                       ; inst 16
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 17
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 18
  store i32 0, i32* %11                                                            ; inst 19
  %12 = add i32 %9, 1                                                              ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_6.array.exit.1:
  %13 = alloca i32                                                                 ; inst 22
  store i32 0, i32* %13                                                            ; inst 23
  %14 = alloca [100 x [8 x i32]]                                                   ; inst 24
  %15 = alloca [8 x i32]                                                           ; inst 25
  %16 = getelementptr [8 x i32], [8 x i32]* %15, i32 0, i32 0                      ; inst 26
  br label %_7.array.cond.2                                                        ; inst 27
_7.array.cond.2:
  %17 = phi i32 [0, %_6.array.exit.1], [%20, %_8.array.body.2]                     ; inst 28
  %18 = icmp slt i32 %17, 8                                                        ; inst 29
  br i1 %18, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 30
_8.array.body.2:
  %19 = getelementptr i32, i32* %16, i32 %17                                       ; inst 31
  store i32 -1, i32* %19                                                           ; inst 32
  %20 = add i32 %17, 1                                                             ; inst 33
  br label %_7.array.cond.2                                                        ; inst 34
_9.array.exit.2:
  %21 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %14, i32 0, i32 0      ; inst 35
  br label %_10.array.cond.3                                                       ; inst 36
_10.array.cond.3:
  %22 = phi i32 [0, %_9.array.exit.2], [%25, %_11.array.body.3]                    ; inst 37
  %23 = icmp slt i32 %22, 100                                                      ; inst 38
  br i1 %23, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 39
_11.array.body.3:
  %24 = getelementptr [8 x i32], [8 x i32]* %21, i32 %22                           ; inst 40
  call void @memcpy([8 x i32]* %24, [8 x i32]* %15, i64 32)                        ; inst 41
  %25 = add i32 %22, 1                                                             ; inst 42
  br label %_10.array.cond.3                                                       ; inst 43
_12.array.exit.3:
  %26 = alloca [100 x [8 x i32]]                                                   ; inst 44
  %27 = alloca [8 x i32]                                                           ; inst 45
  %28 = getelementptr [8 x i32], [8 x i32]* %27, i32 0, i32 0                      ; inst 46
  br label %_13.array.cond.4                                                       ; inst 47
_13.array.cond.4:
  %29 = phi i32 [0, %_12.array.exit.3], [%32, %_14.array.body.4]                   ; inst 48
  %30 = icmp slt i32 %29, 8                                                        ; inst 49
  br i1 %30, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 50
_14.array.body.4:
  %31 = getelementptr i32, i32* %28, i32 %29                                       ; inst 51
  store i32 0, i32* %31                                                            ; inst 52
  %32 = add i32 %29, 1                                                             ; inst 53
  br label %_13.array.cond.4                                                       ; inst 54
_15.array.exit.4:
  %33 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %26, i32 0, i32 0      ; inst 55
  br label %_16.array.cond.5                                                       ; inst 56
_16.array.cond.5:
  %34 = phi i32 [0, %_15.array.exit.4], [%37, %_17.array.body.5]                   ; inst 57
  %35 = icmp slt i32 %34, 100                                                      ; inst 58
  br i1 %35, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 59
_17.array.body.5:
  %36 = getelementptr [8 x i32], [8 x i32]* %33, i32 %34                           ; inst 60
  call void @memcpy([8 x i32]* %36, [8 x i32]* %27, i64 32)                        ; inst 61
  %37 = add i32 %34, 1                                                             ; inst 62
  br label %_16.array.cond.5                                                       ; inst 63
_18.array.exit.5:
  %38 = alloca [100 x i32]                                                         ; inst 64
  %39 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i32 0                  ; inst 65
  br label %_19.array.cond.6                                                       ; inst 66
_19.array.cond.6:
  %40 = phi i32 [0, %_18.array.exit.5], [%43, %_20.array.body.6]                   ; inst 67
  %41 = icmp slt i32 %40, 100                                                      ; inst 68
  br i1 %41, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 69
_20.array.body.6:
  %42 = getelementptr i32, i32* %39, i32 %40                                       ; inst 70
  store i32 0, i32* %42                                                            ; inst 71
  %43 = add i32 %40, 1                                                             ; inst 72
  br label %_19.array.cond.6                                                       ; inst 73
_21.array.exit.6:
  br label %_22.while.cond.0                                                       ; inst 74
_22.while.cond.0:
  %44 = phi i32 [0, %_21.array.exit.6], [%123, %_53.if.exit.2]                     ; inst 75
  %45 = phi i32 [0, %_21.array.exit.6], [%125, %_53.if.exit.2]                     ; inst 76
  %46 = phi i32 [0, %_21.array.exit.6], [%124, %_53.if.exit.2]                     ; inst 77
  %47 = phi i32 [0, %_21.array.exit.6], [%118, %_53.if.exit.2]                     ; inst 78
  %48 = phi i32 [100, %_21.array.exit.6], [%119, %_53.if.exit.2]                   ; inst 79
  %49 = icmp slt i32 %45, %0                                                       ; inst 80
  br i1 %49, label %_23.lazy.then.0, label %_24.lazy.else.0                        ; inst 81
_23.lazy.then.0:
  %50 = icmp slt i32 %45, 400                                                      ; inst 82
  br label %_25.lazy.exit.0                                                        ; inst 83
_24.lazy.else.0:
  br label %_25.lazy.exit.0                                                        ; inst 84
_25.lazy.exit.0:
  %51 = phi i1 [%50, %_23.lazy.then.0], [0, %_24.lazy.else.0]                      ; inst 85
  br i1 %51, label %_26.while.body.0, label %_54.while.exit.0                      ; inst 86
_26.while.body.0:
  %52 = mul i32 %45, 17                                                            ; inst 87
  %53 = add i32 %52, 23                                                            ; inst 88
  %54 = srem i32 %53, 2000                                                         ; inst 89
  %55 = add i32 %54, 1                                                             ; inst 90
  %56 = mul i32 %45, 11                                                            ; inst 91
  %57 = add i32 %56, 7                                                             ; inst 92
  %58 = srem i32 %57, 1000                                                         ; inst 93
  %59 = add i32 %58, 1                                                             ; inst 94
  %60 = mul i32 %46, 100                                                           ; inst 95
  %61 = sdiv i32 %60, %48                                                          ; inst 96
  %62 = icmp sgt i32 %61, 70                                                       ; inst 97
  br i1 %62, label %_27.lazy.then.1, label %_28.lazy.else.1                        ; inst 98
_27.lazy.then.1:
  %63 = icmp slt i32 %48, 250                                                      ; inst 99
  br label %_29.lazy.exit.1                                                        ; inst 100
_28.lazy.else.1:
  br label %_29.lazy.exit.1                                                        ; inst 101
_29.lazy.exit.1:
  %64 = phi i1 [%63, %_27.lazy.then.1], [0, %_28.lazy.else.1]                      ; inst 102
  br i1 %64, label %_30.if.then.0, label %_49.if.else.0                            ; inst 103
_30.if.then.0:
  %65 = mul i32 %48, 2                                                             ; inst 104
  %66 = add i32 %47, 1                                                             ; inst 105
  %67 = alloca [500 x i32]                                                         ; inst 106
  %68 = getelementptr [500 x i32], [500 x i32]* %67, i32 0, i32 0                  ; inst 107
  br label %_31.array.cond.7                                                       ; inst 108
_31.array.cond.7:
  %69 = phi i32 [0, %_30.if.then.0], [%72, %_32.array.body.7]                      ; inst 109
  %70 = icmp slt i32 %69, 500                                                      ; inst 110
  br i1 %70, label %_32.array.body.7, label %_33.array.exit.7                      ; inst 111
_32.array.body.7:
  %71 = getelementptr i32, i32* %68, i32 %69                                       ; inst 112
  store i32 -1, i32* %71                                                           ; inst 113
  %72 = add i32 %69, 1                                                             ; inst 114
  br label %_31.array.cond.7                                                       ; inst 115
_33.array.exit.7:
  %73 = alloca [500 x i32]                                                         ; inst 116
  %74 = getelementptr [500 x i32], [500 x i32]* %73, i32 0, i32 0                  ; inst 117
  br label %_34.array.cond.8                                                       ; inst 118
_34.array.cond.8:
  %75 = phi i32 [0, %_33.array.exit.7], [%78, %_35.array.body.8]                   ; inst 119
  %76 = icmp slt i32 %75, 500                                                      ; inst 120
  br i1 %76, label %_35.array.body.8, label %_36.array.exit.8                      ; inst 121
_35.array.body.8:
  %77 = getelementptr i32, i32* %74, i32 %75                                       ; inst 122
  store i32 0, i32* %77                                                            ; inst 123
  %78 = add i32 %75, 1                                                             ; inst 124
  br label %_34.array.cond.8                                                       ; inst 125
_36.array.exit.8:
  br label %_37.while.cond.1                                                       ; inst 126
_37.while.cond.1:
  %79 = phi i32 [0, %_36.array.exit.8], [%95, %_38.while.body.1]                   ; inst 127
  %80 = icmp slt i32 %79, %48                                                      ; inst 128
  br i1 %80, label %_38.while.body.1, label %_39.while.exit.1                      ; inst 129
_38.while.body.1:
  %81 = sext i32 %79 to i64                                                        ; inst 130
  %82 = getelementptr [500 x i32], [500 x i32]* %67, i32 0, i64 %81                ; inst 131
  %83 = sext i32 %79 to i64                                                        ; inst 132
  %84 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %83                 ; inst 133
  %85 = load i32, i32* %84                                                         ; inst 134
  store i32 %85, i32* %82                                                          ; inst 135
  %86 = sext i32 %79 to i64                                                        ; inst 136
  %87 = getelementptr [500 x i32], [500 x i32]* %73, i32 0, i64 %86                ; inst 137
  %88 = sext i32 %79 to i64                                                        ; inst 138
  %89 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %88                 ; inst 139
  %90 = load i32, i32* %89                                                         ; inst 140
  store i32 %90, i32* %87                                                          ; inst 141
  %91 = sext i32 %79 to i64                                                        ; inst 142
  %92 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %91                 ; inst 143
  store i32 -1, i32* %92                                                           ; inst 144
  %93 = sext i32 %79 to i64                                                        ; inst 145
  %94 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %93                 ; inst 146
  store i32 0, i32* %94                                                            ; inst 147
  %95 = add i32 %79, 1                                                             ; inst 148
  br label %_37.while.cond.1                                                       ; inst 149
_39.while.exit.1:
  br label %_40.while.cond.2                                                       ; inst 150
_40.while.cond.2:
  %96 = phi i32 [%79, %_39.while.exit.1], [%102, %_41.while.body.2]                ; inst 151
  %97 = icmp slt i32 %96, %65                                                      ; inst 152
  br i1 %97, label %_41.while.body.2, label %_42.while.exit.2                      ; inst 153
_41.while.body.2:
  %98 = sext i32 %96 to i64                                                        ; inst 154
  %99 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %98                 ; inst 155
  store i32 -1, i32* %99                                                           ; inst 156
  %100 = sext i32 %96 to i64                                                       ; inst 157
  %101 = getelementptr [500 x i32], [500 x i32]* %7, i32 0, i64 %100               ; inst 158
  store i32 0, i32* %101                                                           ; inst 159
  %102 = add i32 %96, 1                                                            ; inst 160
  br label %_40.while.cond.2                                                       ; inst 161
_42.while.exit.2:
  br label %_43.while.cond.3                                                       ; inst 162
_43.while.cond.3:
  %103 = phi i32 [0, %_42.while.exit.2], [%116, %_47.if.exit.1]                    ; inst 163
  %104 = icmp slt i32 %103, %48                                                    ; inst 164
  br i1 %104, label %_44.while.body.3, label %_48.while.exit.3                     ; inst 165
_44.while.body.3:
  %105 = sext i32 %103 to i64                                                      ; inst 166
  %106 = getelementptr [500 x i32], [500 x i32]* %67, i32 0, i64 %105              ; inst 167
  %107 = load i32, i32* %106                                                       ; inst 168
  %108 = icmp ne i32 %107, -1                                                      ; inst 169
  br i1 %108, label %_45.if.then.1, label %_46.if.else.1                           ; inst 170
_45.if.then.1:
  %109 = sext i32 %103 to i64                                                      ; inst 171
  %110 = getelementptr [500 x i32], [500 x i32]* %67, i32 0, i64 %109              ; inst 172
  %111 = load i32, i32* %110                                                       ; inst 173
  %112 = sext i32 %103 to i64                                                      ; inst 174
  %113 = getelementptr [500 x i32], [500 x i32]* %73, i32 0, i64 %112              ; inst 175
  %114 = load i32, i32* %113                                                       ; inst 176
  %115 = call i1 @insertLinearProbing([500 x i32]* %1, [500 x i32]* %7, i32 %65, i32 %111, i32 %114, i32* %13, i32 0) ; inst 177
  br label %_47.if.exit.1                                                          ; inst 178
_46.if.else.1:
  br label %_47.if.exit.1                                                          ; inst 179
_47.if.exit.1:
  %116 = add i32 %103, 1                                                           ; inst 180
  br label %_43.while.cond.3                                                       ; inst 181
_48.while.exit.3:
  br label %_50.if.exit.0                                                          ; inst 182
_49.if.else.0:
  br label %_50.if.exit.0                                                          ; inst 183
_50.if.exit.0:
  %117 = phi i32 [0, %_48.while.exit.3], [%46, %_49.if.else.0]                     ; inst 184
  %118 = phi i32 [%66, %_48.while.exit.3], [%47, %_49.if.else.0]                   ; inst 185
  %119 = phi i32 [%65, %_48.while.exit.3], [%48, %_49.if.else.0]                   ; inst 186
  %120 = call i1 @insertLinearProbing([500 x i32]* %1, [500 x i32]* %7, i32 %119, i32 %55, i32 %59, i32* %13, i32 %117) ; inst 187
  br i1 %120, label %_51.if.then.2, label %_52.if.else.2                           ; inst 188
_51.if.then.2:
  %121 = add i32 %44, 1                                                            ; inst 189
  %122 = add i32 %117, 1                                                           ; inst 190
  br label %_53.if.exit.2                                                          ; inst 191
_52.if.else.2:
  br label %_53.if.exit.2                                                          ; inst 192
_53.if.exit.2:
  %123 = phi i32 [%121, %_51.if.then.2], [%44, %_52.if.else.2]                     ; inst 193
  %124 = phi i32 [%122, %_51.if.then.2], [%117, %_52.if.else.2]                    ; inst 194
  %125 = add i32 %45, 1                                                            ; inst 195
  br label %_22.while.cond.0                                                       ; inst 196
_54.while.exit.0:
  br label %_55.while.cond.4                                                       ; inst 197
_55.while.cond.4:
  %126 = phi i32 [0, %_54.while.exit.0], [%186, %_74.if.exit.4]                    ; inst 198
  %127 = phi i32 [0, %_54.while.exit.0], [%187, %_74.if.exit.4]                    ; inst 199
  %128 = icmp slt i32 %127, %0                                                     ; inst 200
  br i1 %128, label %_56.lazy.then.2, label %_57.lazy.else.2                       ; inst 201
_56.lazy.then.2:
  %129 = icmp slt i32 %127, 300                                                    ; inst 202
  br label %_58.lazy.exit.2                                                        ; inst 203
_57.lazy.else.2:
  br label %_58.lazy.exit.2                                                        ; inst 204
_58.lazy.exit.2:
  %130 = phi i1 [%129, %_56.lazy.then.2], [0, %_57.lazy.else.2]                    ; inst 205
  br i1 %130, label %_59.while.body.4, label %_75.while.exit.4                     ; inst 206
_59.while.body.4:
  %131 = mul i32 %127, 13                                                          ; inst 207
  %132 = add i32 %131, 31                                                          ; inst 208
  %133 = srem i32 %132, 1500                                                       ; inst 209
  %134 = add i32 %133, 1                                                           ; inst 210
  %135 = mul i32 %127, 19                                                          ; inst 211
  %136 = add i32 %135, 5                                                           ; inst 212
  %137 = srem i32 %136, 800                                                        ; inst 213
  %138 = add i32 %137, 1                                                           ; inst 214
  %139 = srem i32 %134, 100                                                        ; inst 215
  br label %_60.while.cond.5                                                       ; inst 216
_60.while.cond.5:
  %140 = phi i32 [0, %_59.while.body.4], [%157, %_67.if.exit.3]                    ; inst 217
  %141 = sext i32 %139 to i64                                                      ; inst 218
  %142 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %141              ; inst 219
  %143 = load i32, i32* %142                                                       ; inst 220
  %144 = icmp slt i32 %140, %143                                                   ; inst 221
  br i1 %144, label %_61.lazy.then.3, label %_62.lazy.else.3                       ; inst 222
_61.lazy.then.3:
  %145 = icmp slt i32 %140, 8                                                      ; inst 223
  br label %_63.lazy.exit.3                                                        ; inst 224
_62.lazy.else.3:
  br label %_63.lazy.exit.3                                                        ; inst 225
_63.lazy.exit.3:
  %146 = phi i1 [%145, %_61.lazy.then.3], [0, %_62.lazy.else.3]                    ; inst 226
  br i1 %146, label %_64.while.body.5, label %_85.critical_edge.0                  ; inst 227
_64.while.body.5:
  %147 = sext i32 %139 to i64                                                      ; inst 228
  %148 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %14, i32 0, i64 %147  ; inst 229
  %149 = sext i32 %140 to i64                                                      ; inst 230
  %150 = getelementptr [8 x i32], [8 x i32]* %148, i32 0, i64 %149                 ; inst 231
  %151 = load i32, i32* %150                                                       ; inst 232
  %152 = icmp eq i32 %151, %134                                                    ; inst 233
  br i1 %152, label %_65.if.then.3, label %_66.if.else.3                           ; inst 234
_65.if.then.3:
  %153 = sext i32 %139 to i64                                                      ; inst 235
  %154 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %26, i32 0, i64 %153  ; inst 236
  %155 = sext i32 %140 to i64                                                      ; inst 237
  %156 = getelementptr [8 x i32], [8 x i32]* %154, i32 0, i64 %155                 ; inst 238
  store i32 %138, i32* %156                                                        ; inst 239
  br label %_68.while.exit.5                                                       ; inst 240
_66.if.else.3:
  br label %_67.if.exit.3                                                          ; inst 241
_67.if.exit.3:
  %157 = add i32 %140, 1                                                           ; inst 242
  br label %_60.while.cond.5                                                       ; inst 243
_68.while.exit.5:
  %158 = phi i1 [0, %_85.critical_edge.0], [1, %_65.if.then.3]                     ; inst 244
  %159 = icmp eq i1 %158, 0                                                        ; inst 245
  br i1 %159, label %_69.lazy.then.4, label %_70.lazy.else.4                       ; inst 246
_69.lazy.then.4:
  %160 = sext i32 %139 to i64                                                      ; inst 247
  %161 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %160              ; inst 248
  %162 = load i32, i32* %161                                                       ; inst 249
  %163 = icmp slt i32 %162, 8                                                      ; inst 250
  br label %_71.lazy.exit.4                                                        ; inst 251
_70.lazy.else.4:
  br label %_71.lazy.exit.4                                                        ; inst 252
_71.lazy.exit.4:
  %164 = phi i1 [%163, %_69.lazy.then.4], [0, %_70.lazy.else.4]                    ; inst 253
  br i1 %164, label %_72.if.then.4, label %_73.if.else.4                           ; inst 254
_72.if.then.4:
  %165 = sext i32 %139 to i64                                                      ; inst 255
  %166 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %14, i32 0, i64 %165  ; inst 256
  %167 = sext i32 %139 to i64                                                      ; inst 257
  %168 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %167              ; inst 258
  %169 = load i32, i32* %168                                                       ; inst 259
  %170 = sext i32 %169 to i64                                                      ; inst 260
  %171 = getelementptr [8 x i32], [8 x i32]* %166, i32 0, i64 %170                 ; inst 261
  store i32 %134, i32* %171                                                        ; inst 262
  %172 = sext i32 %139 to i64                                                      ; inst 263
  %173 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %26, i32 0, i64 %172  ; inst 264
  %174 = sext i32 %139 to i64                                                      ; inst 265
  %175 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %174              ; inst 266
  %176 = load i32, i32* %175                                                       ; inst 267
  %177 = sext i32 %176 to i64                                                      ; inst 268
  %178 = getelementptr [8 x i32], [8 x i32]* %173, i32 0, i64 %177                 ; inst 269
  store i32 %138, i32* %178                                                        ; inst 270
  %179 = sext i32 %139 to i64                                                      ; inst 271
  %180 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %179              ; inst 272
  %181 = sext i32 %139 to i64                                                      ; inst 273
  %182 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %181              ; inst 274
  %183 = load i32, i32* %182                                                       ; inst 275
  %184 = add i32 %183, 1                                                           ; inst 276
  store i32 %184, i32* %180                                                        ; inst 277
  %185 = add i32 %126, 1                                                           ; inst 278
  br label %_74.if.exit.4                                                          ; inst 279
_73.if.else.4:
  br label %_74.if.exit.4                                                          ; inst 280
_74.if.exit.4:
  %186 = phi i32 [%185, %_72.if.then.4], [%126, %_73.if.else.4]                    ; inst 281
  %187 = add i32 %127, 1                                                           ; inst 282
  br label %_55.while.cond.4                                                       ; inst 283
_75.while.exit.4:
  br label %_76.while.cond.6                                                       ; inst 284
_76.while.cond.6:
  %188 = phi i32 [0, %_75.while.exit.4], [%204, %_83.if.exit.6]                    ; inst 285
  %189 = phi i32 [0, %_75.while.exit.4], [%203, %_83.if.exit.6]                    ; inst 286
  %190 = phi i32 [0, %_75.while.exit.4], [%199, %_83.if.exit.6]                    ; inst 287
  %191 = icmp slt i32 %188, 100                                                    ; inst 288
  br i1 %191, label %_77.while.body.6, label %_84.while.exit.6                     ; inst 289
_77.while.body.6:
  %192 = mul i32 %188, 23                                                          ; inst 290
  %193 = add i32 %192, 17                                                          ; inst 291
  %194 = srem i32 %193, 1000                                                       ; inst 292
  %195 = add i32 %194, 1                                                           ; inst 293
  %196 = call i32 @lookupLinearProbing([500 x i32]* %1, i32 %48, i32 %195)         ; inst 294
  %197 = icmp sge i32 %196, 0                                                      ; inst 295
  br i1 %197, label %_78.if.then.5, label %_79.if.else.5                           ; inst 296
_78.if.then.5:
  %198 = add i32 %190, 1                                                           ; inst 297
  br label %_80.if.exit.5                                                          ; inst 298
_79.if.else.5:
  br label %_80.if.exit.5                                                          ; inst 299
_80.if.exit.5:
  %199 = phi i32 [%198, %_78.if.then.5], [%190, %_79.if.else.5]                    ; inst 300
  %200 = call i32 @lookupChaining([100 x [8 x i32]]* %14, [100 x i32]* %38, i32 100, i32 %195) ; inst 301
  %201 = icmp sge i32 %200, 0                                                      ; inst 302
  br i1 %201, label %_81.if.then.6, label %_82.if.else.6                           ; inst 303
_81.if.then.6:
  %202 = add i32 %189, 1                                                           ; inst 304
  br label %_83.if.exit.6                                                          ; inst 305
_82.if.else.6:
  br label %_83.if.exit.6                                                          ; inst 306
_83.if.exit.6:
  %203 = phi i32 [%202, %_81.if.then.6], [%189, %_82.if.else.6]                    ; inst 307
  %204 = add i32 %188, 1                                                           ; inst 308
  br label %_76.while.cond.6                                                       ; inst 309
_84.while.exit.6:
  %205 = mul i32 %46, 100                                                          ; inst 310
  %206 = sdiv i32 %205, %48                                                        ; inst 311
  %207 = call i32 @calculateAverageChainLength([100 x i32]* %38, i32 100)          ; inst 312
  call void @printlnInt(i32 %44)                                                   ; inst 313
  call void @printlnInt(i32 %126)                                                  ; inst 314
  %208 = load i32, i32* %13                                                        ; inst 315
  call void @printlnInt(i32 %208)                                                  ; inst 316
  call void @printlnInt(i32 %190)                                                  ; inst 317
  call void @printlnInt(i32 %189)                                                  ; inst 318
  call void @printlnInt(i32 %206)                                                  ; inst 319
  call void @printlnInt(i32 %207)                                                  ; inst 320
  call void @printlnInt(i32 %47)                                                   ; inst 321
  call void @printlnInt(i32 26012)                                                 ; inst 322
  ret void                                                                         ; inst 323
_85.critical_edge.0:
  br label %_68.while.exit.5                                                       ; inst 324
}

define i1 @insertLinearProbing([500 x i32]* %0, [500 x i32]* %1, i32 %2, i32 %3, i32 %4, i32* %5, i32 %6) {
_0.entry.0:
  %7 = srem i32 %3, %2                                                             ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%29, %_8.if.exit.0]                              ; inst 3
  %9 = phi i32 [%7, %_0.entry.0], [%28, %_8.if.exit.0]                             ; inst 4
  %10 = icmp slt i32 %8, %2                                                        ; inst 5
  br i1 %10, label %_2.while.body.0, label %_9.while.exit.0                        ; inst 6
_2.while.body.0:
  %11 = sext i32 %9 to i64                                                         ; inst 7
  %12 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %11                 ; inst 8
  %13 = load i32, i32* %12                                                         ; inst 9
  %14 = icmp eq i32 %13, -1                                                        ; inst 10
  br i1 %14, label %_3.if.then.0, label %_4.if.else.0                              ; inst 11
_3.if.then.0:
  %15 = sext i32 %9 to i64                                                         ; inst 12
  %16 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %15                 ; inst 13
  store i32 %3, i32* %16                                                           ; inst 14
  %17 = sext i32 %9 to i64                                                         ; inst 15
  %18 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %17                 ; inst 16
  store i32 %4, i32* %18                                                           ; inst 17
  ret i1 1                                                                         ; inst 18
_4.if.else.0:
  %19 = sext i32 %9 to i64                                                         ; inst 19
  %20 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %19                 ; inst 20
  %21 = load i32, i32* %20                                                         ; inst 21
  %22 = icmp eq i32 %21, %3                                                        ; inst 22
  br i1 %22, label %_5.if.then.1, label %_6.if.else.1                              ; inst 23
_5.if.then.1:
  %23 = sext i32 %9 to i64                                                         ; inst 24
  %24 = getelementptr [500 x i32], [500 x i32]* %1, i32 0, i64 %23                 ; inst 25
  store i32 %4, i32* %24                                                           ; inst 26
  ret i1 1                                                                         ; inst 27
_6.if.else.1:
  %25 = load i32, i32* %5                                                          ; inst 28
  %26 = add i32 %25, 1                                                             ; inst 29
  store i32 %26, i32* %5                                                           ; inst 30
  %27 = add i32 %9, 1                                                              ; inst 31
  %28 = srem i32 %27, %2                                                           ; inst 32
  %29 = add i32 %8, 1                                                              ; inst 33
  br label %_7.if.exit.1                                                           ; inst 34
_7.if.exit.1:
  br label %_8.if.exit.0                                                           ; inst 35
_8.if.exit.0:
  br label %_1.while.cond.0                                                        ; inst 36
_9.while.exit.0:
  ret i1 0                                                                         ; inst 37
}

define i32 @lookupLinearProbing([500 x i32]* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = srem i32 %2, %1                                                             ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %4 = phi i32 [0, %_0.entry.0], [%17, %_8.if.exit.0]                              ; inst 3
  %5 = phi i32 [%3, %_0.entry.0], [%16, %_8.if.exit.0]                             ; inst 4
  %6 = icmp slt i32 %4, %1                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_9.while.exit.0                         ; inst 6
_2.while.body.0:
  %7 = sext i32 %5 to i64                                                          ; inst 7
  %8 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %7                   ; inst 8
  %9 = load i32, i32* %8                                                           ; inst 9
  %10 = icmp eq i32 %9, %2                                                         ; inst 10
  br i1 %10, label %_3.if.then.0, label %_4.if.else.0                              ; inst 11
_3.if.then.0:
  ret i32 %5                                                                       ; inst 12
_4.if.else.0:
  %11 = sext i32 %5 to i64                                                         ; inst 13
  %12 = getelementptr [500 x i32], [500 x i32]* %0, i32 0, i64 %11                 ; inst 14
  %13 = load i32, i32* %12                                                         ; inst 15
  %14 = icmp eq i32 %13, -1                                                        ; inst 16
  br i1 %14, label %_5.if.then.1, label %_6.if.else.1                              ; inst 17
_5.if.then.1:
  ret i32 -1                                                                       ; inst 18
_6.if.else.1:
  %15 = add i32 %5, 1                                                              ; inst 19
  %16 = srem i32 %15, %1                                                           ; inst 20
  %17 = add i32 %4, 1                                                              ; inst 21
  br label %_7.if.exit.1                                                           ; inst 22
_7.if.exit.1:
  br label %_8.if.exit.0                                                           ; inst 23
_8.if.exit.0:
  br label %_1.while.cond.0                                                        ; inst 24
_9.while.exit.0:
  ret i32 -1                                                                       ; inst 25
}

define i32 @lookupChaining([100 x [8 x i32]]* %0, [100 x i32]* %1, i32 %2, i32 %3) {
_0.entry.0:
  %4 = srem i32 %3, %2                                                             ; inst 1
  br label %_1.while.cond.0                                                        ; inst 2
_1.while.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%18, %_8.if.exit.0]                              ; inst 3
  %6 = sext i32 %4 to i64                                                          ; inst 4
  %7 = getelementptr [100 x i32], [100 x i32]* %1, i32 0, i64 %6                   ; inst 5
  %8 = load i32, i32* %7                                                           ; inst 6
  %9 = icmp slt i32 %5, %8                                                         ; inst 7
  br i1 %9, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 8
_2.lazy.then.0:
  %10 = icmp slt i32 %5, 8                                                         ; inst 9
  br label %_4.lazy.exit.0                                                         ; inst 10
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 11
_4.lazy.exit.0:
  %11 = phi i1 [%10, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 12
  br i1 %11, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 13
_5.while.body.0:
  %12 = sext i32 %4 to i64                                                         ; inst 14
  %13 = getelementptr [100 x [8 x i32]], [100 x [8 x i32]]* %0, i32 0, i64 %12     ; inst 15
  %14 = sext i32 %5 to i64                                                         ; inst 16
  %15 = getelementptr [8 x i32], [8 x i32]* %13, i32 0, i64 %14                    ; inst 17
  %16 = load i32, i32* %15                                                         ; inst 18
  %17 = icmp eq i32 %16, %3                                                        ; inst 19
  br i1 %17, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  ret i32 %5                                                                       ; inst 21
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 22
_8.if.exit.0:
  %18 = add i32 %5, 1                                                              ; inst 23
  br label %_1.while.cond.0                                                        ; inst 24
_9.while.exit.0:
  ret i32 -1                                                                       ; inst 25
}

define i32 @calculateAverageChainLength([100 x i32]* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%17, %_5.if.exit.0]                              ; inst 2
  %3 = phi i32 [0, %_0.entry.0], [%15, %_5.if.exit.0]                              ; inst 3
  %4 = phi i32 [0, %_0.entry.0], [%16, %_5.if.exit.0]                              ; inst 4
  %5 = icmp slt i32 %2, %1                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = sext i32 %2 to i64                                                          ; inst 7
  %7 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %6                   ; inst 8
  %8 = load i32, i32* %7                                                           ; inst 9
  %9 = icmp sgt i32 %8, 0                                                          ; inst 10
  br i1 %9, label %_3.if.then.0, label %_4.if.else.0                               ; inst 11
_3.if.then.0:
  %10 = sext i32 %2 to i64                                                         ; inst 12
  %11 = getelementptr [100 x i32], [100 x i32]* %0, i32 0, i64 %10                 ; inst 13
  %12 = load i32, i32* %11                                                         ; inst 14
  %13 = add i32 %4, %12                                                            ; inst 15
  %14 = add i32 %3, 1                                                              ; inst 16
  br label %_5.if.exit.0                                                           ; inst 17
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 18
_5.if.exit.0:
  %15 = phi i32 [%14, %_3.if.then.0], [%3, %_4.if.else.0]                          ; inst 19
  %16 = phi i32 [%13, %_3.if.then.0], [%4, %_4.if.else.0]                          ; inst 20
  %17 = add i32 %2, 1                                                              ; inst 21
  br label %_1.while.cond.0                                                        ; inst 22
_6.while.exit.0:
  %18 = icmp sgt i32 %3, 0                                                         ; inst 23
  br i1 %18, label %_7.if.then.1, label %_8.if.else.1                              ; inst 24
_7.if.then.1:
  %19 = sdiv i32 %4, %3                                                            ; inst 25
  br label %_9.if.exit.1                                                           ; inst 26
_8.if.else.1:
  br label %_9.if.exit.1                                                           ; inst 27
_9.if.exit.1:
  %20 = phi i32 [%19, %_7.if.then.1], [0, %_8.if.else.1]                           ; inst 28
  ret i32 %20                                                                      ; inst 29
}

