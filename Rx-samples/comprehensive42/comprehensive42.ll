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



define void @init_heap([1024 x i32]* %0, i32* %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%9, %_2.while.body.0]                            ; inst 2
  %3 = icmp slt i32 %2, 64                                                         ; inst 3
  br i1 %3, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 4
_2.while.body.0:
  %4 = mul i32 %2, 16                                                              ; inst 5
  %5 = sext i32 %4 to i64                                                          ; inst 6
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %5                 ; inst 7
  %7 = add i32 %2, 1                                                               ; inst 8
  %8 = mul i32 %7, 16                                                              ; inst 9
  store i32 %8, i32* %6                                                            ; inst 10
  %9 = add i32 %2, 1                                                               ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_3.while.exit.0:
  %10 = sext i32 1008 to i64                                                       ; inst 13
  %11 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %10               ; inst 14
  store i32 -1, i32* %11                                                           ; inst 15
  store i32 0, i32* %1                                                             ; inst 16
  ret void                                                                         ; inst 17
}

define i32 @alloc([1024 x i32]* %0, i32* %1) {
_0.entry.0:
  %2 = load i32, i32* %1                                                           ; inst 1
  %3 = icmp eq i32 %2, -1                                                          ; inst 2
  br i1 %3, label %_1.if.then.0, label %_2.if.else.0                               ; inst 3
_1.if.then.0:
  ret i32 -1                                                                       ; inst 4
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 5
_3.if.exit.0:
  %4 = load i32, i32* %1                                                           ; inst 6
  %5 = sext i32 %4 to i64                                                          ; inst 7
  %6 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %5                 ; inst 8
  %7 = load i32, i32* %6                                                           ; inst 9
  store i32 %7, i32* %1                                                            ; inst 10
  %8 = sext i32 %4 to i64                                                          ; inst 11
  %9 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %8                 ; inst 12
  store i32 -2, i32* %9                                                            ; inst 13
  ret i32 %4                                                                       ; inst 14
}

define void @free([1024 x i32]* %0, i32* %1, i32 %2) {
_0.entry.0:
  %3 = sext i32 %2 to i64                                                          ; inst 1
  %4 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %3                 ; inst 2
  %5 = load i32, i32* %1                                                           ; inst 3
  store i32 %5, i32* %4                                                            ; inst 4
  store i32 %2, i32* %1                                                            ; inst 5
  ret void                                                                         ; inst 6
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
  %6 = alloca i32                                                                  ; inst 11
  store i32 0, i32* %6                                                             ; inst 12
  call void @init_heap([1024 x i32]* %0, i32* %6)                                  ; inst 13
  %7 = alloca [64 x i32]                                                           ; inst 14
  %8 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i32 0                      ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %9 = phi i32 [0, %_3.array.exit.0], [%12, %_5.array.body.1]                      ; inst 17
  %10 = icmp slt i32 %9, 64                                                        ; inst 18
  br i1 %10, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %11 = getelementptr i32, i32* %8, i32 %9                                         ; inst 20
  store i32 0, i32* %11                                                            ; inst 21
  %12 = add i32 %9, 1                                                              ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  br label %_7.while.cond.0                                                        ; inst 24
_7.while.cond.0:
  %13 = phi i32 [0, %_6.array.exit.1], [%19, %_11.if.exit.0]                       ; inst 25
  %14 = icmp slt i32 %13, 64                                                       ; inst 26
  br i1 %14, label %_8.while.body.0, label %_12.while.exit.0                       ; inst 27
_8.while.body.0:
  %15 = call i32 @alloc([1024 x i32]* %0, i32* %6)                                 ; inst 28
  %16 = icmp ne i32 %15, -1                                                        ; inst 29
  br i1 %16, label %_9.if.then.0, label %_10.if.else.0                             ; inst 30
_9.if.then.0:
  %17 = sext i32 %13 to i64                                                        ; inst 31
  %18 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %17                   ; inst 32
  store i32 %15, i32* %18                                                          ; inst 33
  br label %_11.if.exit.0                                                          ; inst 34
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 35
_11.if.exit.0:
  %19 = add i32 %13, 1                                                             ; inst 36
  br label %_7.while.cond.0                                                        ; inst 37
_12.while.exit.0:
  br label %_13.while.cond.1                                                       ; inst 38
_13.while.cond.1:
  %20 = phi i32 [0, %_12.while.exit.0], [%29, %_17.if.exit.1]                      ; inst 39
  %21 = icmp slt i32 %20, 32                                                       ; inst 40
  br i1 %21, label %_14.while.body.1, label %_18.while.exit.1                      ; inst 41
_14.while.body.1:
  %22 = srem i32 %20, 2                                                            ; inst 42
  %23 = icmp eq i32 %22, 0                                                         ; inst 43
  br i1 %23, label %_15.if.then.1, label %_16.if.else.1                            ; inst 44
_15.if.then.1:
  %24 = sext i32 %20 to i64                                                        ; inst 45
  %25 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %24                   ; inst 46
  %26 = load i32, i32* %25                                                         ; inst 47
  call void @free([1024 x i32]* %0, i32* %6, i32 %26)                              ; inst 48
  %27 = sext i32 %20 to i64                                                        ; inst 49
  %28 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %27                   ; inst 50
  store i32 -1, i32* %28                                                           ; inst 51
  br label %_17.if.exit.1                                                          ; inst 52
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 53
_17.if.exit.1:
  %29 = add i32 %20, 1                                                             ; inst 54
  br label %_13.while.cond.1                                                       ; inst 55
_18.while.exit.1:
  br label %_19.while.cond.2                                                       ; inst 56
_19.while.cond.2:
  %30 = phi i32 [0, %_18.while.exit.1], [%47, %_32.if.exit.2]                      ; inst 57
  %31 = icmp slt i32 %30, 16                                                       ; inst 58
  br i1 %31, label %_20.while.body.2, label %_33.while.exit.2                      ; inst 59
_20.while.body.2:
  %32 = call i32 @alloc([1024 x i32]* %0, i32* %6)                                 ; inst 60
  %33 = icmp ne i32 %32, -1                                                        ; inst 61
  br i1 %33, label %_21.if.then.2, label %_31.if.else.2                            ; inst 62
_21.if.then.2:
  br label %_22.while.cond.3                                                       ; inst 63
_22.while.cond.3:
  %34 = phi i32 [0, %_21.if.then.2], [%46, %_29.if.exit.3]                         ; inst 64
  %35 = phi i1 [0, %_21.if.then.2], [%45, %_29.if.exit.3]                          ; inst 65
  %36 = icmp slt i32 %34, 64                                                       ; inst 66
  br i1 %36, label %_23.while.body.3, label %_30.while.exit.3                      ; inst 67
_23.while.body.3:
  %37 = sext i32 %34 to i64                                                        ; inst 68
  %38 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %37                   ; inst 69
  %39 = load i32, i32* %38                                                         ; inst 70
  %40 = icmp eq i32 %39, -1                                                        ; inst 71
  br i1 %40, label %_24.lazy.then.0, label %_25.lazy.else.0                        ; inst 72
_24.lazy.then.0:
  %41 = icmp eq i1 %35, 0                                                          ; inst 73
  br label %_26.lazy.exit.0                                                        ; inst 74
_25.lazy.else.0:
  br label %_26.lazy.exit.0                                                        ; inst 75
_26.lazy.exit.0:
  %42 = phi i1 [%41, %_24.lazy.then.0], [0, %_25.lazy.else.0]                      ; inst 76
  br i1 %42, label %_27.if.then.3, label %_28.if.else.3                            ; inst 77
_27.if.then.3:
  %43 = sext i32 %34 to i64                                                        ; inst 78
  %44 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %43                   ; inst 79
  store i32 %32, i32* %44                                                          ; inst 80
  br label %_29.if.exit.3                                                          ; inst 81
_28.if.else.3:
  br label %_29.if.exit.3                                                          ; inst 82
_29.if.exit.3:
  %45 = phi i1 [1, %_27.if.then.3], [%35, %_28.if.else.3]                          ; inst 83
  %46 = add i32 %34, 1                                                             ; inst 84
  br label %_22.while.cond.3                                                       ; inst 85
_30.while.exit.3:
  br label %_32.if.exit.2                                                          ; inst 86
_31.if.else.2:
  br label %_32.if.exit.2                                                          ; inst 87
_32.if.exit.2:
  %47 = add i32 %30, 1                                                             ; inst 88
  br label %_19.while.cond.2                                                       ; inst 89
_33.while.exit.2:
  br label %_34.while.cond.4                                                       ; inst 90
_34.while.cond.4:
  %48 = phi i32 [0, %_33.while.exit.2], [%57, %_38.if.exit.4]                      ; inst 91
  %49 = phi i32 [0, %_33.while.exit.2], [%56, %_38.if.exit.4]                      ; inst 92
  %50 = icmp slt i32 %48, 64                                                       ; inst 93
  br i1 %50, label %_35.while.body.4, label %_39.while.exit.4                      ; inst 94
_35.while.body.4:
  %51 = sext i32 %48 to i64                                                        ; inst 95
  %52 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %51                   ; inst 96
  %53 = load i32, i32* %52                                                         ; inst 97
  %54 = icmp ne i32 %53, -1                                                        ; inst 98
  br i1 %54, label %_36.if.then.4, label %_37.if.else.4                            ; inst 99
_36.if.then.4:
  %55 = add i32 %49, 1                                                             ; inst 100
  br label %_38.if.exit.4                                                          ; inst 101
_37.if.else.4:
  br label %_38.if.exit.4                                                          ; inst 102
_38.if.exit.4:
  %56 = phi i32 [%55, %_36.if.then.4], [%49, %_37.if.else.4]                       ; inst 103
  %57 = add i32 %48, 1                                                             ; inst 104
  br label %_34.while.cond.4                                                       ; inst 105
_39.while.exit.4:
  %58 = icmp sgt i32 %49, 40                                                       ; inst 106
  br i1 %58, label %_40.if.then.5, label %_53.if.else.5                            ; inst 107
_40.if.then.5:
  %59 = load i32, i32* %6                                                          ; inst 108
  br label %_41.while.cond.5                                                       ; inst 109
_41.while.cond.5:
  %60 = phi i32 [%59, %_40.if.then.5], [%67, %_48.if.exit.6]                       ; inst 110
  %61 = phi i32 [0, %_40.if.then.5], [%72, %_48.if.exit.6]                         ; inst 111
  %62 = phi i32 [0, %_40.if.then.5], [%73, %_48.if.exit.6]                         ; inst 112
  %63 = icmp ne i32 %60, -1                                                        ; inst 113
  br i1 %63, label %_42.while.body.5, label %_49.while.exit.5                      ; inst 114
_42.while.body.5:
  %64 = add i32 %61, 1                                                             ; inst 115
  %65 = sext i32 %60 to i64                                                        ; inst 116
  %66 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %65               ; inst 117
  %67 = load i32, i32* %66                                                         ; inst 118
  %68 = add i32 %60, 16                                                            ; inst 119
  %69 = icmp ne i32 %67, %68                                                       ; inst 120
  br i1 %69, label %_43.if.then.6, label %_47.if.else.6                            ; inst 121
_43.if.then.6:
  %70 = icmp sgt i32 %64, %62                                                      ; inst 122
  br i1 %70, label %_44.if.then.7, label %_45.if.else.7                            ; inst 123
_44.if.then.7:
  br label %_46.if.exit.7                                                          ; inst 124
_45.if.else.7:
  br label %_46.if.exit.7                                                          ; inst 125
_46.if.exit.7:
  %71 = phi i32 [%64, %_44.if.then.7], [%62, %_45.if.else.7]                       ; inst 126
  br label %_48.if.exit.6                                                          ; inst 127
_47.if.else.6:
  br label %_48.if.exit.6                                                          ; inst 128
_48.if.exit.6:
  %72 = phi i32 [0, %_46.if.exit.7], [%64, %_47.if.else.6]                         ; inst 129
  %73 = phi i32 [%71, %_46.if.exit.7], [%62, %_47.if.else.6]                       ; inst 130
  br label %_41.while.cond.5                                                       ; inst 131
_49.while.exit.5:
  %74 = sub i32 64, %49                                                            ; inst 132
  %75 = icmp sgt i32 %74, 0                                                        ; inst 133
  br i1 %75, label %_50.if.then.8, label %_51.if.else.8                            ; inst 134
_50.if.then.8:
  %76 = mul i32 %62, 100                                                           ; inst 135
  %77 = sdiv i32 %76, %74                                                          ; inst 136
  br label %_52.if.exit.8                                                          ; inst 137
_51.if.else.8:
  br label %_52.if.exit.8                                                          ; inst 138
_52.if.exit.8:
  %78 = phi i32 [%77, %_50.if.then.8], [0, %_51.if.else.8]                         ; inst 139
  br label %_54.if.exit.5                                                          ; inst 140
_53.if.else.5:
  br label %_54.if.exit.5                                                          ; inst 141
_54.if.exit.5:
  %79 = phi i32 [%78, %_52.if.exit.8], [0, %_53.if.else.5]                         ; inst 142
  %80 = icmp slt i32 %49, 48                                                       ; inst 143
  br i1 %80, label %_55.if.then.9, label %_65.if.else.9                            ; inst 144
_55.if.then.9:
  br label %_56.while.cond.6                                                       ; inst 145
_56.while.cond.6:
  %81 = phi i32 [32, %_55.if.then.9], [%94, %_63.if.exit.10]                       ; inst 146
  %82 = icmp slt i32 %81, 64                                                       ; inst 147
  br i1 %82, label %_57.while.body.6, label %_64.while.exit.6                      ; inst 148
_57.while.body.6:
  %83 = srem i32 %81, 3                                                            ; inst 149
  %84 = icmp eq i32 %83, 0                                                         ; inst 150
  br i1 %84, label %_58.if.then.10, label %_62.if.else.10                          ; inst 151
_58.if.then.10:
  %85 = sext i32 %81 to i64                                                        ; inst 152
  %86 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %85                   ; inst 153
  %87 = load i32, i32* %86                                                         ; inst 154
  %88 = icmp ne i32 %87, -1                                                        ; inst 155
  br i1 %88, label %_59.if.then.11, label %_60.if.else.11                          ; inst 156
_59.if.then.11:
  %89 = sext i32 %81 to i64                                                        ; inst 157
  %90 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %89                   ; inst 158
  %91 = load i32, i32* %90                                                         ; inst 159
  call void @free([1024 x i32]* %0, i32* %6, i32 %91)                              ; inst 160
  %92 = sext i32 %81 to i64                                                        ; inst 161
  %93 = getelementptr [64 x i32], [64 x i32]* %7, i32 0, i64 %92                   ; inst 162
  store i32 -1, i32* %93                                                           ; inst 163
  br label %_61.if.exit.11                                                         ; inst 164
_60.if.else.11:
  br label %_61.if.exit.11                                                         ; inst 165
_61.if.exit.11:
  br label %_63.if.exit.10                                                         ; inst 166
_62.if.else.10:
  br label %_63.if.exit.10                                                         ; inst 167
_63.if.exit.10:
  %94 = add i32 %81, 1                                                             ; inst 168
  br label %_56.while.cond.6                                                       ; inst 169
_64.while.exit.6:
  br label %_66.if.exit.9                                                          ; inst 170
_65.if.else.9:
  br label %_66.if.exit.9                                                          ; inst 171
_66.if.exit.9:
  br label %_67.while.cond.7                                                       ; inst 172
_67.while.cond.7:
  %95 = phi i32 [0, %_66.if.exit.9], [%104, %_71.if.exit.12]                       ; inst 173
  %96 = phi i32 [0, %_66.if.exit.9], [%103, %_71.if.exit.12]                       ; inst 174
  %97 = icmp slt i32 %95, 1024                                                     ; inst 175
  br i1 %97, label %_68.while.body.7, label %_72.while.exit.7                      ; inst 176
_68.while.body.7:
  %98 = sext i32 %95 to i64                                                        ; inst 177
  %99 = getelementptr [1024 x i32], [1024 x i32]* %0, i32 0, i64 %98               ; inst 178
  %100 = load i32, i32* %99                                                        ; inst 179
  %101 = icmp eq i32 %100, -2                                                      ; inst 180
  br i1 %101, label %_69.if.then.12, label %_70.if.else.12                         ; inst 181
_69.if.then.12:
  %102 = add i32 %96, %95                                                          ; inst 182
  br label %_71.if.exit.12                                                         ; inst 183
_70.if.else.12:
  br label %_71.if.exit.12                                                         ; inst 184
_71.if.exit.12:
  %103 = phi i32 [%102, %_69.if.then.12], [%96, %_70.if.else.12]                   ; inst 185
  %104 = add i32 %95, 1                                                            ; inst 186
  br label %_67.while.cond.7                                                       ; inst 187
_72.while.exit.7:
  call void @printlnInt(i32 %79)                                                   ; inst 188
  call void @printlnInt(i32 %96)                                                   ; inst 189
  call void @exit(i32 0)                                                           ; inst 190
  ret void                                                                         ; inst 191
}

