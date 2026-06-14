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


%Edge = type { i32, i32, i32, i32, i32 }
%Graph = type { i32, [2000 x %Edge], i32, [100 x [100 x i32]], [100 x i32], [100 x i32], [100 x i1], [100 x [100 x i32]], [100 x i32], [100 x i32], [100 x i1], [100 x i32], i32, i32, i32, [100 x i32], [100 x i32], i32 }
%GraphGenerator = type { i32 }

define i32 @pm_rand_update(i32 %0) {
_0.entry.0:
  %1 = sdiv i32 %0, 127773                                                         ; inst 1
  %2 = mul i32 %1, 127773                                                          ; inst 2
  %3 = sub i32 %0, %2                                                              ; inst 3
  %4 = mul i32 16807, %3                                                           ; inst 4
  %5 = mul i32 2836, %1                                                            ; inst 5
  %6 = sub i32 %4, %5                                                              ; inst 6
  %7 = icmp sle i32 %6, 0                                                          ; inst 7
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 8
_1.if.then.0:
  %8 = add i32 %6, 2147483647                                                      ; inst 9
  br label %_3.if.exit.0                                                           ; inst 10
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 11
_3.if.exit.0:
  %9 = phi i32 [%8, %_1.if.then.0], [%6, %_2.if.else.0]                            ; inst 12
  ret i32 %9                                                                       ; inst 13
}

define void @_6o7JjS3dq8i_new(%Edge* sret(%Edge) %0, i32 %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = getelementptr %Edge, %Edge* %0, i32 0, i32 0                                ; inst 1
  store i32 %1, i32* %5                                                            ; inst 2
  %6 = getelementptr %Edge, %Edge* %0, i32 0, i32 1                                ; inst 3
  store i32 %2, i32* %6                                                            ; inst 4
  %7 = getelementptr %Edge, %Edge* %0, i32 0, i32 2                                ; inst 5
  store i32 %3, i32* %7                                                            ; inst 6
  %8 = getelementptr %Edge, %Edge* %0, i32 0, i32 3                                ; inst 7
  store i32 %4, i32* %8                                                            ; inst 8
  %9 = getelementptr %Edge, %Edge* %0, i32 0, i32 4                                ; inst 9
  store i32 0, i32* %9                                                             ; inst 10
  ret void                                                                         ; inst 11
}

define void @_ac6K71PczTg_new(%Graph* sret(%Graph) %0, i32 %1) {
_0.entry.0:
  %2 = alloca %Graph                                                               ; inst 1
  %3 = getelementptr %Graph, %Graph* %2, i32 0, i32 0                              ; inst 2
  store i32 %1, i32* %3                                                            ; inst 3
  %4 = getelementptr %Graph, %Graph* %2, i32 0, i32 1                              ; inst 4
  %5 = alloca %Edge                                                                ; inst 5
  call void @_6o7JjS3dq8i_new(%Edge* %5, i32 0, i32 0, i32 0, i32 0)               ; inst 6
  %6 = getelementptr [2000 x %Edge], [2000 x %Edge]* %4, i32 0, i32 0              ; inst 7
  br label %_1.array.cond.0                                                        ; inst 8
_1.array.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%10, %_2.array.body.0]                           ; inst 9
  %8 = icmp slt i32 %7, 2000                                                       ; inst 10
  br i1 %8, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 11
_2.array.body.0:
  %9 = getelementptr %Edge, %Edge* %6, i32 %7                                      ; inst 12
  call void @memcpy(%Edge* %9, %Edge* %5, i64 20)                                  ; inst 13
  %10 = add i32 %7, 1                                                              ; inst 14
  br label %_1.array.cond.0                                                        ; inst 15
_3.array.exit.0:
  %11 = getelementptr %Graph, %Graph* %2, i32 0, i32 2                             ; inst 16
  store i32 0, i32* %11                                                            ; inst 17
  %12 = getelementptr %Graph, %Graph* %2, i32 0, i32 3                             ; inst 18
  %13 = alloca [100 x i32]                                                         ; inst 19
  %14 = getelementptr [100 x i32], [100 x i32]* %13, i32 0, i32 0                  ; inst 20
  br label %_4.array.cond.1                                                        ; inst 21
_4.array.cond.1:
  %15 = phi i32 [0, %_3.array.exit.0], [%18, %_5.array.body.1]                     ; inst 22
  %16 = icmp slt i32 %15, 100                                                      ; inst 23
  br i1 %16, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 24
_5.array.body.1:
  %17 = getelementptr i32, i32* %14, i32 %15                                       ; inst 25
  store i32 0, i32* %17                                                            ; inst 26
  %18 = add i32 %15, 1                                                             ; inst 27
  br label %_4.array.cond.1                                                        ; inst 28
_6.array.exit.1:
  %19 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %12, i32 0, i32 0  ; inst 29
  br label %_7.array.cond.2                                                        ; inst 30
_7.array.cond.2:
  %20 = phi i32 [0, %_6.array.exit.1], [%23, %_8.array.body.2]                     ; inst 31
  %21 = icmp slt i32 %20, 100                                                      ; inst 32
  br i1 %21, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 33
_8.array.body.2:
  %22 = getelementptr [100 x i32], [100 x i32]* %19, i32 %20                       ; inst 34
  call void @memcpy([100 x i32]* %22, [100 x i32]* %13, i64 400)                   ; inst 35
  %23 = add i32 %20, 1                                                             ; inst 36
  br label %_7.array.cond.2                                                        ; inst 37
_9.array.exit.2:
  %24 = getelementptr %Graph, %Graph* %2, i32 0, i32 4                             ; inst 38
  %25 = getelementptr [100 x i32], [100 x i32]* %24, i32 0, i32 0                  ; inst 39
  br label %_10.array.cond.3                                                       ; inst 40
_10.array.cond.3:
  %26 = phi i32 [0, %_9.array.exit.2], [%29, %_11.array.body.3]                    ; inst 41
  %27 = icmp slt i32 %26, 100                                                      ; inst 42
  br i1 %27, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 43
_11.array.body.3:
  %28 = getelementptr i32, i32* %25, i32 %26                                       ; inst 44
  store i32 0, i32* %28                                                            ; inst 45
  %29 = add i32 %26, 1                                                             ; inst 46
  br label %_10.array.cond.3                                                       ; inst 47
_12.array.exit.3:
  %30 = getelementptr %Graph, %Graph* %2, i32 0, i32 5                             ; inst 48
  %31 = getelementptr [100 x i32], [100 x i32]* %30, i32 0, i32 0                  ; inst 49
  br label %_13.array.cond.4                                                       ; inst 50
_13.array.cond.4:
  %32 = phi i32 [0, %_12.array.exit.3], [%35, %_14.array.body.4]                   ; inst 51
  %33 = icmp slt i32 %32, 100                                                      ; inst 52
  br i1 %33, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 53
_14.array.body.4:
  %34 = getelementptr i32, i32* %31, i32 %32                                       ; inst 54
  store i32 2147483647, i32* %34                                                   ; inst 55
  %35 = add i32 %32, 1                                                             ; inst 56
  br label %_13.array.cond.4                                                       ; inst 57
_15.array.exit.4:
  %36 = getelementptr %Graph, %Graph* %2, i32 0, i32 6                             ; inst 58
  %37 = getelementptr [100 x i1], [100 x i1]* %36, i32 0, i32 0                    ; inst 59
  br label %_16.array.cond.5                                                       ; inst 60
_16.array.cond.5:
  %38 = phi i32 [0, %_15.array.exit.4], [%41, %_17.array.body.5]                   ; inst 61
  %39 = icmp slt i32 %38, 100                                                      ; inst 62
  br i1 %39, label %_17.array.body.5, label %_18.array.exit.5                      ; inst 63
_17.array.body.5:
  %40 = getelementptr i1, i1* %37, i32 %38                                         ; inst 64
  store i1 0, i1* %40                                                              ; inst 65
  %41 = add i32 %38, 1                                                             ; inst 66
  br label %_16.array.cond.5                                                       ; inst 67
_18.array.exit.5:
  %42 = getelementptr %Graph, %Graph* %2, i32 0, i32 7                             ; inst 68
  %43 = alloca [100 x i32]                                                         ; inst 69
  %44 = getelementptr [100 x i32], [100 x i32]* %43, i32 0, i32 0                  ; inst 70
  br label %_19.array.cond.6                                                       ; inst 71
_19.array.cond.6:
  %45 = phi i32 [0, %_18.array.exit.5], [%48, %_20.array.body.6]                   ; inst 72
  %46 = icmp slt i32 %45, 100                                                      ; inst 73
  br i1 %46, label %_20.array.body.6, label %_21.array.exit.6                      ; inst 74
_20.array.body.6:
  %47 = getelementptr i32, i32* %44, i32 %45                                       ; inst 75
  store i32 2147483647, i32* %47                                                   ; inst 76
  %48 = add i32 %45, 1                                                             ; inst 77
  br label %_19.array.cond.6                                                       ; inst 78
_21.array.exit.6:
  %49 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %42, i32 0, i32 0  ; inst 79
  br label %_22.array.cond.7                                                       ; inst 80
_22.array.cond.7:
  %50 = phi i32 [0, %_21.array.exit.6], [%53, %_23.array.body.7]                   ; inst 81
  %51 = icmp slt i32 %50, 100                                                      ; inst 82
  br i1 %51, label %_23.array.body.7, label %_24.array.exit.7                      ; inst 83
_23.array.body.7:
  %52 = getelementptr [100 x i32], [100 x i32]* %49, i32 %50                       ; inst 84
  call void @memcpy([100 x i32]* %52, [100 x i32]* %43, i64 400)                   ; inst 85
  %53 = add i32 %50, 1                                                             ; inst 86
  br label %_22.array.cond.7                                                       ; inst 87
_24.array.exit.7:
  %54 = getelementptr %Graph, %Graph* %2, i32 0, i32 8                             ; inst 88
  %55 = getelementptr [100 x i32], [100 x i32]* %54, i32 0, i32 0                  ; inst 89
  br label %_25.array.cond.8                                                       ; inst 90
_25.array.cond.8:
  %56 = phi i32 [0, %_24.array.exit.7], [%59, %_26.array.body.8]                   ; inst 91
  %57 = icmp slt i32 %56, 100                                                      ; inst 92
  br i1 %57, label %_26.array.body.8, label %_27.array.exit.8                      ; inst 93
_26.array.body.8:
  %58 = getelementptr i32, i32* %55, i32 %56                                       ; inst 94
  store i32 0, i32* %58                                                            ; inst 95
  %59 = add i32 %56, 1                                                             ; inst 96
  br label %_25.array.cond.8                                                       ; inst 97
_27.array.exit.8:
  %60 = getelementptr %Graph, %Graph* %2, i32 0, i32 9                             ; inst 98
  %61 = getelementptr [100 x i32], [100 x i32]* %60, i32 0, i32 0                  ; inst 99
  br label %_28.array.cond.9                                                       ; inst 100
_28.array.cond.9:
  %62 = phi i32 [0, %_27.array.exit.8], [%65, %_29.array.body.9]                   ; inst 101
  %63 = icmp slt i32 %62, 100                                                      ; inst 102
  br i1 %63, label %_29.array.body.9, label %_30.array.exit.9                      ; inst 103
_29.array.body.9:
  %64 = getelementptr i32, i32* %61, i32 %62                                       ; inst 104
  store i32 0, i32* %64                                                            ; inst 105
  %65 = add i32 %62, 1                                                             ; inst 106
  br label %_28.array.cond.9                                                       ; inst 107
_30.array.exit.9:
  %66 = getelementptr %Graph, %Graph* %2, i32 0, i32 10                            ; inst 108
  %67 = getelementptr [100 x i1], [100 x i1]* %66, i32 0, i32 0                    ; inst 109
  br label %_31.array.cond.10                                                      ; inst 110
_31.array.cond.10:
  %68 = phi i32 [0, %_30.array.exit.9], [%71, %_32.array.body.10]                  ; inst 111
  %69 = icmp slt i32 %68, 100                                                      ; inst 112
  br i1 %69, label %_32.array.body.10, label %_33.array.exit.10                    ; inst 113
_32.array.body.10:
  %70 = getelementptr i1, i1* %67, i32 %68                                         ; inst 114
  store i1 0, i1* %70                                                              ; inst 115
  %71 = add i32 %68, 1                                                             ; inst 116
  br label %_31.array.cond.10                                                      ; inst 117
_33.array.exit.10:
  %72 = getelementptr %Graph, %Graph* %2, i32 0, i32 11                            ; inst 118
  %73 = getelementptr [100 x i32], [100 x i32]* %72, i32 0, i32 0                  ; inst 119
  br label %_34.array.cond.11                                                      ; inst 120
_34.array.cond.11:
  %74 = phi i32 [0, %_33.array.exit.10], [%77, %_35.array.body.11]                 ; inst 121
  %75 = icmp slt i32 %74, 100                                                      ; inst 122
  br i1 %75, label %_35.array.body.11, label %_36.array.exit.11                    ; inst 123
_35.array.body.11:
  %76 = getelementptr i32, i32* %73, i32 %74                                       ; inst 124
  store i32 0, i32* %76                                                            ; inst 125
  %77 = add i32 %74, 1                                                             ; inst 126
  br label %_34.array.cond.11                                                      ; inst 127
_36.array.exit.11:
  %78 = getelementptr %Graph, %Graph* %2, i32 0, i32 12                            ; inst 128
  store i32 0, i32* %78                                                            ; inst 129
  %79 = getelementptr %Graph, %Graph* %2, i32 0, i32 13                            ; inst 130
  store i32 0, i32* %79                                                            ; inst 131
  %80 = getelementptr %Graph, %Graph* %2, i32 0, i32 14                            ; inst 132
  store i32 0, i32* %80                                                            ; inst 133
  %81 = getelementptr %Graph, %Graph* %2, i32 0, i32 15                            ; inst 134
  %82 = getelementptr [100 x i32], [100 x i32]* %81, i32 0, i32 0                  ; inst 135
  br label %_37.array.cond.12                                                      ; inst 136
_37.array.cond.12:
  %83 = phi i32 [0, %_36.array.exit.11], [%86, %_38.array.body.12]                 ; inst 137
  %84 = icmp slt i32 %83, 100                                                      ; inst 138
  br i1 %84, label %_38.array.body.12, label %_39.array.exit.12                    ; inst 139
_38.array.body.12:
  %85 = getelementptr i32, i32* %82, i32 %83                                       ; inst 140
  store i32 0, i32* %85                                                            ; inst 141
  %86 = add i32 %83, 1                                                             ; inst 142
  br label %_37.array.cond.12                                                      ; inst 143
_39.array.exit.12:
  %87 = getelementptr %Graph, %Graph* %2, i32 0, i32 16                            ; inst 144
  %88 = getelementptr [100 x i32], [100 x i32]* %87, i32 0, i32 0                  ; inst 145
  br label %_40.array.cond.13                                                      ; inst 146
_40.array.cond.13:
  %89 = phi i32 [0, %_39.array.exit.12], [%92, %_41.array.body.13]                 ; inst 147
  %90 = icmp slt i32 %89, 100                                                      ; inst 148
  br i1 %90, label %_41.array.body.13, label %_42.array.exit.13                    ; inst 149
_41.array.body.13:
  %91 = getelementptr i32, i32* %88, i32 %89                                       ; inst 150
  store i32 0, i32* %91                                                            ; inst 151
  %92 = add i32 %89, 1                                                             ; inst 152
  br label %_40.array.cond.13                                                      ; inst 153
_42.array.exit.13:
  %93 = getelementptr %Graph, %Graph* %2, i32 0, i32 17                            ; inst 154
  store i32 0, i32* %93                                                            ; inst 155
  br label %_43.while.cond.0                                                       ; inst 156
_43.while.cond.0:
  %94 = phi i32 [0, %_42.array.exit.13], [%110, %_50.while.exit.1]                 ; inst 157
  %95 = icmp slt i32 %94, %1                                                       ; inst 158
  br i1 %95, label %_44.while.body.0, label %_51.while.exit.0                      ; inst 159
_44.while.body.0:
  br label %_45.while.cond.1                                                       ; inst 160
_45.while.cond.1:
  %96 = phi i32 [0, %_44.while.body.0], [%109, %_49.if.exit.0]                     ; inst 161
  %97 = icmp slt i32 %96, %1                                                       ; inst 162
  br i1 %97, label %_46.while.body.1, label %_50.while.exit.1                      ; inst 163
_46.while.body.1:
  %98 = icmp eq i32 %94, %96                                                       ; inst 164
  br i1 %98, label %_47.if.then.0, label %_48.if.else.0                            ; inst 165
_47.if.then.0:
  %99 = getelementptr %Graph, %Graph* %2, i32 0, i32 7                             ; inst 166
  %100 = sext i32 %94 to i64                                                       ; inst 167
  %101 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %99, i32 0, i64 %100 ; inst 168
  %102 = sext i32 %96 to i64                                                       ; inst 169
  %103 = getelementptr [100 x i32], [100 x i32]* %101, i32 0, i64 %102             ; inst 170
  store i32 0, i32* %103                                                           ; inst 171
  br label %_49.if.exit.0                                                          ; inst 172
_48.if.else.0:
  %104 = getelementptr %Graph, %Graph* %2, i32 0, i32 7                            ; inst 173
  %105 = sext i32 %94 to i64                                                       ; inst 174
  %106 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %104, i32 0, i64 %105 ; inst 175
  %107 = sext i32 %96 to i64                                                       ; inst 176
  %108 = getelementptr [100 x i32], [100 x i32]* %106, i32 0, i64 %107             ; inst 177
  store i32 2147483647, i32* %108                                                  ; inst 178
  br label %_49.if.exit.0                                                          ; inst 179
_49.if.exit.0:
  %109 = add i32 %96, 1                                                            ; inst 180
  br label %_45.while.cond.1                                                       ; inst 181
_50.while.exit.1:
  %110 = add i32 %94, 1                                                            ; inst 182
  br label %_43.while.cond.0                                                       ; inst 183
_51.while.exit.0:
  call void @memcpy(%Graph* %0, %Graph* %2, i64 123024)                            ; inst 184
  ret void                                                                         ; inst 185
}

define void @_ac6K71PczTg_add_edge(%Graph* %0, i32 %1, i32 %2, i32 %3, i32 %4) {
_0.entry.0:
  %5 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                              ; inst 1
  %6 = load i32, i32* %5                                                           ; inst 2
  %7 = icmp sge i32 %6, 2000                                                       ; inst 3
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 4
_1.if.then.0:
  ret void                                                                         ; inst 5
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 6
_3.if.exit.0:
  %8 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                              ; inst 7
  %9 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                              ; inst 8
  %10 = load i32, i32* %9                                                          ; inst 9
  %11 = sext i32 %10 to i64                                                        ; inst 10
  %12 = getelementptr [2000 x %Edge], [2000 x %Edge]* %8, i32 0, i64 %11           ; inst 11
  %13 = alloca %Edge                                                               ; inst 12
  call void @_6o7JjS3dq8i_new(%Edge* %13, i32 %1, i32 %2, i32 %3, i32 %4)          ; inst 13
  call void @memcpy(%Edge* %12, %Edge* %13, i64 20)                                ; inst 14
  %14 = getelementptr %Graph, %Graph* %0, i32 0, i32 4                             ; inst 15
  %15 = sext i32 %1 to i64                                                         ; inst 16
  %16 = getelementptr [100 x i32], [100 x i32]* %14, i32 0, i64 %15                ; inst 17
  %17 = load i32, i32* %16                                                         ; inst 18
  %18 = icmp slt i32 %17, 100                                                      ; inst 19
  br i1 %18, label %_4.if.then.1, label %_5.if.else.1                              ; inst 20
_4.if.then.1:
  %19 = getelementptr %Graph, %Graph* %0, i32 0, i32 3                             ; inst 21
  %20 = sext i32 %1 to i64                                                         ; inst 22
  %21 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %19, i32 0, i64 %20 ; inst 23
  %22 = getelementptr %Graph, %Graph* %0, i32 0, i32 4                             ; inst 24
  %23 = sext i32 %1 to i64                                                         ; inst 25
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = sext i32 %25 to i64                                                        ; inst 28
  %27 = getelementptr [100 x i32], [100 x i32]* %21, i32 0, i64 %26                ; inst 29
  store i32 %2, i32* %27                                                           ; inst 30
  %28 = getelementptr %Graph, %Graph* %0, i32 0, i32 4                             ; inst 31
  %29 = sext i32 %1 to i64                                                         ; inst 32
  %30 = getelementptr [100 x i32], [100 x i32]* %28, i32 0, i64 %29                ; inst 33
  %31 = load i32, i32* %30                                                         ; inst 34
  %32 = add i32 %31, 1                                                             ; inst 35
  store i32 %32, i32* %30                                                          ; inst 36
  br label %_6.if.exit.1                                                           ; inst 37
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 38
_6.if.exit.1:
  %33 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 39
  %34 = sext i32 %1 to i64                                                         ; inst 40
  %35 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %33, i32 0, i64 %34 ; inst 41
  %36 = sext i32 %2 to i64                                                         ; inst 42
  %37 = getelementptr [100 x i32], [100 x i32]* %35, i32 0, i64 %36                ; inst 43
  store i32 %3, i32* %37                                                           ; inst 44
  %38 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                             ; inst 45
  %39 = load i32, i32* %38                                                         ; inst 46
  %40 = add i32 %39, 1                                                             ; inst 47
  store i32 %40, i32* %38                                                          ; inst 48
  ret void                                                                         ; inst 49
}

define void @_ac6K71PczTg_dijkstra(%Graph* %0, i32 %1) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%12, %_2.while.body.0]                           ; inst 2
  %3 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                              ; inst 3
  %4 = load i32, i32* %3                                                           ; inst 4
  %5 = icmp slt i32 %2, %4                                                         ; inst 5
  br i1 %5, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %6 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                              ; inst 7
  %7 = sext i32 %2 to i64                                                          ; inst 8
  %8 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %7                   ; inst 9
  store i32 2147483647, i32* %8                                                    ; inst 10
  %9 = getelementptr %Graph, %Graph* %0, i32 0, i32 6                              ; inst 11
  %10 = sext i32 %2 to i64                                                         ; inst 12
  %11 = getelementptr [100 x i1], [100 x i1]* %9, i32 0, i64 %10                   ; inst 13
  store i1 0, i1* %11                                                              ; inst 14
  %12 = add i32 %2, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  %13 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                             ; inst 17
  %14 = sext i32 %1 to i64                                                         ; inst 18
  %15 = getelementptr [100 x i32], [100 x i32]* %13, i32 0, i64 %14                ; inst 19
  store i32 0, i32* %15                                                            ; inst 20
  br label %_4.while.cond.1                                                        ; inst 21
_4.while.cond.1:
  %16 = phi i32 [0, %_3.while.exit.0], [%48, %_26.while.exit.3]                    ; inst 22
  %17 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                             ; inst 23
  %18 = load i32, i32* %17                                                         ; inst 24
  %19 = icmp slt i32 %16, %18                                                      ; inst 25
  br i1 %19, label %_5.while.body.1, label %_28.critical_edge.0                    ; inst 26
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 27
_6.while.cond.2:
  %20 = phi i32 [2147483647, %_5.while.body.1], [%41, %_13.if.exit.0]              ; inst 28
  %21 = phi i32 [-1, %_5.while.body.1], [%42, %_13.if.exit.0]                      ; inst 29
  %22 = phi i32 [0, %_5.while.body.1], [%43, %_13.if.exit.0]                       ; inst 30
  %23 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                             ; inst 31
  %24 = load i32, i32* %23                                                         ; inst 32
  %25 = icmp slt i32 %22, %24                                                      ; inst 33
  br i1 %25, label %_7.while.body.2, label %_14.while.exit.2                       ; inst 34
_7.while.body.2:
  %26 = getelementptr %Graph, %Graph* %0, i32 0, i32 6                             ; inst 35
  %27 = sext i32 %22 to i64                                                        ; inst 36
  %28 = getelementptr [100 x i1], [100 x i1]* %26, i32 0, i64 %27                  ; inst 37
  %29 = load i1, i1* %28                                                           ; inst 38
  %30 = icmp eq i1 %29, 0                                                          ; inst 39
  br i1 %30, label %_8.lazy.then.0, label %_9.lazy.else.0                          ; inst 40
_8.lazy.then.0:
  %31 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                             ; inst 41
  %32 = sext i32 %22 to i64                                                        ; inst 42
  %33 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i64 %32                ; inst 43
  %34 = load i32, i32* %33                                                         ; inst 44
  %35 = icmp slt i32 %34, %20                                                      ; inst 45
  br label %_10.lazy.exit.0                                                        ; inst 46
_9.lazy.else.0:
  br label %_10.lazy.exit.0                                                        ; inst 47
_10.lazy.exit.0:
  %36 = phi i1 [%35, %_8.lazy.then.0], [0, %_9.lazy.else.0]                        ; inst 48
  br i1 %36, label %_11.if.then.0, label %_12.if.else.0                            ; inst 49
_11.if.then.0:
  %37 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                             ; inst 50
  %38 = sext i32 %22 to i64                                                        ; inst 51
  %39 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %38                ; inst 52
  %40 = load i32, i32* %39                                                         ; inst 53
  br label %_13.if.exit.0                                                          ; inst 54
_12.if.else.0:
  br label %_13.if.exit.0                                                          ; inst 55
_13.if.exit.0:
  %41 = phi i32 [%40, %_11.if.then.0], [%20, %_12.if.else.0]                       ; inst 56
  %42 = phi i32 [%22, %_11.if.then.0], [%21, %_12.if.else.0]                       ; inst 57
  %43 = add i32 %22, 1                                                             ; inst 58
  br label %_6.while.cond.2                                                        ; inst 59
_14.while.exit.2:
  %44 = icmp eq i32 %21, -1                                                        ; inst 60
  br i1 %44, label %_15.if.then.1, label %_16.if.else.1                            ; inst 61
_15.if.then.1:
  br label %_27.while.exit.1                                                       ; inst 62
_16.if.else.1:
  br label %_17.if.exit.1                                                          ; inst 63
_17.if.exit.1:
  %45 = getelementptr %Graph, %Graph* %0, i32 0, i32 6                             ; inst 64
  %46 = sext i32 %21 to i64                                                        ; inst 65
  %47 = getelementptr [100 x i1], [100 x i1]* %45, i32 0, i64 %46                  ; inst 66
  store i1 1, i1* %47                                                              ; inst 67
  %48 = add i32 %16, 1                                                             ; inst 68
  br label %_18.while.cond.3                                                       ; inst 69
_18.while.cond.3:
  %49 = phi i32 [0, %_17.if.exit.1], [%79, %_25.if.exit.2]                         ; inst 70
  %50 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                             ; inst 71
  %51 = load i32, i32* %50                                                         ; inst 72
  %52 = icmp slt i32 %49, %51                                                      ; inst 73
  br i1 %52, label %_19.while.body.3, label %_26.while.exit.3                      ; inst 74
_19.while.body.3:
  %53 = alloca %Edge                                                               ; inst 75
  %54 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 76
  %55 = sext i32 %49 to i64                                                        ; inst 77
  %56 = getelementptr [2000 x %Edge], [2000 x %Edge]* %54, i32 0, i64 %55          ; inst 78
  call void @memcpy(%Edge* %53, %Edge* %56, i64 20)                                ; inst 79
  %57 = getelementptr %Edge, %Edge* %53, i32 0, i32 0                              ; inst 80
  %58 = load i32, i32* %57                                                         ; inst 81
  %59 = icmp eq i32 %58, %21                                                       ; inst 82
  br i1 %59, label %_20.if.then.2, label %_24.if.else.2                            ; inst 83
_20.if.then.2:
  %60 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                             ; inst 84
  %61 = sext i32 %21 to i64                                                        ; inst 85
  %62 = getelementptr [100 x i32], [100 x i32]* %60, i32 0, i64 %61                ; inst 86
  %63 = load i32, i32* %62                                                         ; inst 87
  %64 = getelementptr %Edge, %Edge* %53, i32 0, i32 2                              ; inst 88
  %65 = load i32, i32* %64                                                         ; inst 89
  %66 = add i32 %63, %65                                                           ; inst 90
  %67 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                             ; inst 91
  %68 = getelementptr %Edge, %Edge* %53, i32 0, i32 1                              ; inst 92
  %69 = load i32, i32* %68                                                         ; inst 93
  %70 = sext i32 %69 to i64                                                        ; inst 94
  %71 = getelementptr [100 x i32], [100 x i32]* %67, i32 0, i64 %70                ; inst 95
  %72 = load i32, i32* %71                                                         ; inst 96
  %73 = icmp slt i32 %66, %72                                                      ; inst 97
  br i1 %73, label %_21.if.then.3, label %_22.if.else.3                            ; inst 98
_21.if.then.3:
  %74 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                             ; inst 99
  %75 = getelementptr %Edge, %Edge* %53, i32 0, i32 1                              ; inst 100
  %76 = load i32, i32* %75                                                         ; inst 101
  %77 = sext i32 %76 to i64                                                        ; inst 102
  %78 = getelementptr [100 x i32], [100 x i32]* %74, i32 0, i64 %77                ; inst 103
  store i32 %66, i32* %78                                                          ; inst 104
  br label %_23.if.exit.3                                                          ; inst 105
_22.if.else.3:
  br label %_23.if.exit.3                                                          ; inst 106
_23.if.exit.3:
  br label %_25.if.exit.2                                                          ; inst 107
_24.if.else.2:
  br label %_25.if.exit.2                                                          ; inst 108
_25.if.exit.2:
  %79 = add i32 %49, 1                                                             ; inst 109
  br label %_18.while.cond.3                                                       ; inst 110
_26.while.exit.3:
  br label %_4.while.cond.1                                                        ; inst 111
_27.while.exit.1:
  ret void                                                                         ; inst 112
_28.critical_edge.0:
  br label %_27.while.exit.1                                                       ; inst 113
}

define void @_ac6K71PczTg_floyd_warshall(%Graph* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i64 [0, %_0.entry.0], [%46, %_17.while.exit.1]                          ; inst 2
  %2 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                              ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = sext i32 %3 to i64                                                          ; inst 5
  %5 = icmp ult i64 %1, %4                                                         ; inst 6
  br i1 %5, label %_2.while.body.0, label %_18.while.exit.0                        ; inst 7
_2.while.body.0:
  br label %_3.while.cond.1                                                        ; inst 8
_3.while.cond.1:
  %6 = phi i64 [0, %_2.while.body.0], [%45, %_16.while.exit.2]                     ; inst 9
  %7 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                              ; inst 10
  %8 = load i32, i32* %7                                                           ; inst 11
  %9 = sext i32 %8 to i64                                                          ; inst 12
  %10 = icmp ult i64 %6, %9                                                        ; inst 13
  br i1 %10, label %_4.while.body.1, label %_17.while.exit.1                       ; inst 14
_4.while.body.1:
  br label %_5.while.cond.2                                                        ; inst 15
_5.while.cond.2:
  %11 = phi i64 [0, %_4.while.body.1], [%44, %_15.if.exit.0]                       ; inst 16
  %12 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                             ; inst 17
  %13 = load i32, i32* %12                                                         ; inst 18
  %14 = sext i32 %13 to i64                                                        ; inst 19
  %15 = icmp ult i64 %11, %14                                                      ; inst 20
  br i1 %15, label %_6.while.body.2, label %_16.while.exit.2                       ; inst 21
_6.while.body.2:
  %16 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 22
  %17 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %16, i32 0, i64 %6 ; inst 23
  %18 = getelementptr [100 x i32], [100 x i32]* %17, i32 0, i64 %1                 ; inst 24
  %19 = load i32, i32* %18                                                         ; inst 25
  %20 = icmp ne i32 %19, 2147483647                                                ; inst 26
  br i1 %20, label %_7.lazy.then.0, label %_8.lazy.else.0                          ; inst 27
_7.lazy.then.0:
  %21 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 28
  %22 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %21, i32 0, i64 %1 ; inst 29
  %23 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %11                ; inst 30
  %24 = load i32, i32* %23                                                         ; inst 31
  %25 = icmp ne i32 %24, 2147483647                                                ; inst 32
  br label %_9.lazy.exit.0                                                         ; inst 33
_8.lazy.else.0:
  br label %_9.lazy.exit.0                                                         ; inst 34
_9.lazy.exit.0:
  %26 = phi i1 [%25, %_7.lazy.then.0], [0, %_8.lazy.else.0]                        ; inst 35
  br i1 %26, label %_10.if.then.0, label %_14.if.else.0                            ; inst 36
_10.if.then.0:
  %27 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 37
  %28 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %27, i32 0, i64 %6 ; inst 38
  %29 = getelementptr [100 x i32], [100 x i32]* %28, i32 0, i64 %1                 ; inst 39
  %30 = load i32, i32* %29                                                         ; inst 40
  %31 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 41
  %32 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %31, i32 0, i64 %1 ; inst 42
  %33 = getelementptr [100 x i32], [100 x i32]* %32, i32 0, i64 %11                ; inst 43
  %34 = load i32, i32* %33                                                         ; inst 44
  %35 = add i32 %30, %34                                                           ; inst 45
  %36 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 46
  %37 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %36, i32 0, i64 %6 ; inst 47
  %38 = getelementptr [100 x i32], [100 x i32]* %37, i32 0, i64 %11                ; inst 48
  %39 = load i32, i32* %38                                                         ; inst 49
  %40 = icmp slt i32 %35, %39                                                      ; inst 50
  br i1 %40, label %_11.if.then.1, label %_12.if.else.1                            ; inst 51
_11.if.then.1:
  %41 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                             ; inst 52
  %42 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %41, i32 0, i64 %6 ; inst 53
  %43 = getelementptr [100 x i32], [100 x i32]* %42, i32 0, i64 %11                ; inst 54
  store i32 %35, i32* %43                                                          ; inst 55
  br label %_13.if.exit.1                                                          ; inst 56
_12.if.else.1:
  br label %_13.if.exit.1                                                          ; inst 57
_13.if.exit.1:
  br label %_15.if.exit.0                                                          ; inst 58
_14.if.else.0:
  br label %_15.if.exit.0                                                          ; inst 59
_15.if.exit.0:
  %44 = add i64 %11, 1                                                             ; inst 60
  br label %_5.while.cond.2                                                        ; inst 61
_16.while.exit.2:
  %45 = add i64 %6, 1                                                              ; inst 62
  br label %_3.while.cond.1                                                        ; inst 63
_17.while.exit.1:
  %46 = add i64 %1, 1                                                              ; inst 64
  br label %_1.while.cond.0                                                        ; inst 65
_18.while.exit.0:
  ret void                                                                         ; inst 66
}

define void @_ac6K71PczTg_tarjan_scc(%Graph* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                              ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %3                   ; inst 3
  %5 = getelementptr %Graph, %Graph* %0, i32 0, i32 13                             ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  store i32 %6, i32* %4                                                            ; inst 6
  %7 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                              ; inst 7
  %8 = sext i32 %1 to i64                                                          ; inst 8
  %9 = getelementptr [100 x i32], [100 x i32]* %7, i32 0, i64 %8                   ; inst 9
  %10 = getelementptr %Graph, %Graph* %0, i32 0, i32 13                            ; inst 10
  %11 = load i32, i32* %10                                                         ; inst 11
  store i32 %11, i32* %9                                                           ; inst 12
  %12 = getelementptr %Graph, %Graph* %0, i32 0, i32 13                            ; inst 13
  %13 = load i32, i32* %12                                                         ; inst 14
  %14 = add i32 %13, 1                                                             ; inst 15
  store i32 %14, i32* %12                                                          ; inst 16
  %15 = getelementptr %Graph, %Graph* %0, i32 0, i32 11                            ; inst 17
  %16 = getelementptr %Graph, %Graph* %0, i32 0, i32 12                            ; inst 18
  %17 = load i32, i32* %16                                                         ; inst 19
  %18 = sext i32 %17 to i64                                                        ; inst 20
  %19 = getelementptr [100 x i32], [100 x i32]* %15, i32 0, i64 %18                ; inst 21
  store i32 %1, i32* %19                                                           ; inst 22
  %20 = getelementptr %Graph, %Graph* %0, i32 0, i32 12                            ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = add i32 %21, 1                                                             ; inst 25
  store i32 %22, i32* %20                                                          ; inst 26
  %23 = getelementptr %Graph, %Graph* %0, i32 0, i32 10                            ; inst 27
  %24 = sext i32 %1 to i64                                                         ; inst 28
  %25 = getelementptr [100 x i1], [100 x i1]* %23, i32 0, i64 %24                  ; inst 29
  store i1 1, i1* %25                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_1.while.cond.0:
  %26 = phi i32 [0, %_0.entry.0], [%79, %_14.if.exit.0]                            ; inst 32
  %27 = getelementptr %Graph, %Graph* %0, i32 0, i32 4                             ; inst 33
  %28 = sext i32 %1 to i64                                                         ; inst 34
  %29 = getelementptr [100 x i32], [100 x i32]* %27, i32 0, i64 %28                ; inst 35
  %30 = load i32, i32* %29                                                         ; inst 36
  %31 = icmp slt i32 %26, %30                                                      ; inst 37
  br i1 %31, label %_2.while.body.0, label %_15.while.exit.0                       ; inst 38
_2.while.body.0:
  %32 = getelementptr %Graph, %Graph* %0, i32 0, i32 3                             ; inst 39
  %33 = sext i32 %1 to i64                                                         ; inst 40
  %34 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %32, i32 0, i64 %33 ; inst 41
  %35 = sext i32 %26 to i64                                                        ; inst 42
  %36 = getelementptr [100 x i32], [100 x i32]* %34, i32 0, i64 %35                ; inst 43
  %37 = load i32, i32* %36                                                         ; inst 44
  %38 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                             ; inst 45
  %39 = sext i32 %37 to i64                                                        ; inst 46
  %40 = getelementptr [100 x i32], [100 x i32]* %38, i32 0, i64 %39                ; inst 47
  %41 = load i32, i32* %40                                                         ; inst 48
  %42 = icmp eq i32 %41, -1                                                        ; inst 49
  br i1 %42, label %_3.if.then.0, label %_7.if.else.0                              ; inst 50
_3.if.then.0:
  call void @_ac6K71PczTg_tarjan_scc(%Graph* %0, i32 %37)                          ; inst 51
  %43 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 52
  %44 = sext i32 %37 to i64                                                        ; inst 53
  %45 = getelementptr [100 x i32], [100 x i32]* %43, i32 0, i64 %44                ; inst 54
  %46 = load i32, i32* %45                                                         ; inst 55
  %47 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 56
  %48 = sext i32 %1 to i64                                                         ; inst 57
  %49 = getelementptr [100 x i32], [100 x i32]* %47, i32 0, i64 %48                ; inst 58
  %50 = load i32, i32* %49                                                         ; inst 59
  %51 = icmp slt i32 %46, %50                                                      ; inst 60
  br i1 %51, label %_4.if.then.1, label %_5.if.else.1                              ; inst 61
_4.if.then.1:
  %52 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 62
  %53 = sext i32 %1 to i64                                                         ; inst 63
  %54 = getelementptr [100 x i32], [100 x i32]* %52, i32 0, i64 %53                ; inst 64
  %55 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 65
  %56 = sext i32 %37 to i64                                                        ; inst 66
  %57 = getelementptr [100 x i32], [100 x i32]* %55, i32 0, i64 %56                ; inst 67
  %58 = load i32, i32* %57                                                         ; inst 68
  store i32 %58, i32* %54                                                          ; inst 69
  br label %_6.if.exit.1                                                           ; inst 70
_5.if.else.1:
  br label %_6.if.exit.1                                                           ; inst 71
_6.if.exit.1:
  br label %_14.if.exit.0                                                          ; inst 72
_7.if.else.0:
  %59 = getelementptr %Graph, %Graph* %0, i32 0, i32 10                            ; inst 73
  %60 = sext i32 %37 to i64                                                        ; inst 74
  %61 = getelementptr [100 x i1], [100 x i1]* %59, i32 0, i64 %60                  ; inst 75
  %62 = load i1, i1* %61                                                           ; inst 76
  br i1 %62, label %_8.if.then.2, label %_12.if.else.2                             ; inst 77
_8.if.then.2:
  %63 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                             ; inst 78
  %64 = sext i32 %37 to i64                                                        ; inst 79
  %65 = getelementptr [100 x i32], [100 x i32]* %63, i32 0, i64 %64                ; inst 80
  %66 = load i32, i32* %65                                                         ; inst 81
  %67 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 82
  %68 = sext i32 %1 to i64                                                         ; inst 83
  %69 = getelementptr [100 x i32], [100 x i32]* %67, i32 0, i64 %68                ; inst 84
  %70 = load i32, i32* %69                                                         ; inst 85
  %71 = icmp slt i32 %66, %70                                                      ; inst 86
  br i1 %71, label %_9.if.then.3, label %_10.if.else.3                             ; inst 87
_9.if.then.3:
  %72 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 88
  %73 = sext i32 %1 to i64                                                         ; inst 89
  %74 = getelementptr [100 x i32], [100 x i32]* %72, i32 0, i64 %73                ; inst 90
  %75 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                             ; inst 91
  %76 = sext i32 %37 to i64                                                        ; inst 92
  %77 = getelementptr [100 x i32], [100 x i32]* %75, i32 0, i64 %76                ; inst 93
  %78 = load i32, i32* %77                                                         ; inst 94
  store i32 %78, i32* %74                                                          ; inst 95
  br label %_11.if.exit.3                                                          ; inst 96
_10.if.else.3:
  br label %_11.if.exit.3                                                          ; inst 97
_11.if.exit.3:
  br label %_13.if.exit.2                                                          ; inst 98
_12.if.else.2:
  br label %_13.if.exit.2                                                          ; inst 99
_13.if.exit.2:
  br label %_14.if.exit.0                                                          ; inst 100
_14.if.exit.0:
  %79 = add i32 %26, 1                                                             ; inst 101
  br label %_1.while.cond.0                                                        ; inst 102
_15.while.exit.0:
  %80 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                             ; inst 103
  %81 = sext i32 %1 to i64                                                         ; inst 104
  %82 = getelementptr [100 x i32], [100 x i32]* %80, i32 0, i64 %81                ; inst 105
  %83 = load i32, i32* %82                                                         ; inst 106
  %84 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                             ; inst 107
  %85 = sext i32 %1 to i64                                                         ; inst 108
  %86 = getelementptr [100 x i32], [100 x i32]* %84, i32 0, i64 %85                ; inst 109
  %87 = load i32, i32* %86                                                         ; inst 110
  %88 = icmp eq i32 %83, %87                                                       ; inst 111
  br i1 %88, label %_16.if.then.4, label %_23.if.else.4                            ; inst 112
_16.if.then.4:
  %89 = getelementptr %Graph, %Graph* %0, i32 0, i32 14                            ; inst 113
  %90 = load i32, i32* %89                                                         ; inst 114
  %91 = add i32 %90, 1                                                             ; inst 115
  store i32 %91, i32* %89                                                          ; inst 116
  br label %_17.while.cond.1                                                       ; inst 117
_17.while.cond.1:
  %92 = getelementptr %Graph, %Graph* %0, i32 0, i32 12                            ; inst 118
  %93 = load i32, i32* %92                                                         ; inst 119
  %94 = icmp sgt i32 %93, 0                                                        ; inst 120
  br i1 %94, label %_18.while.body.1, label %_25.critical_edge.0                   ; inst 121
_18.while.body.1:
  %95 = getelementptr %Graph, %Graph* %0, i32 0, i32 12                            ; inst 122
  %96 = load i32, i32* %95                                                         ; inst 123
  %97 = sub i32 %96, 1                                                             ; inst 124
  store i32 %97, i32* %95                                                          ; inst 125
  %98 = getelementptr %Graph, %Graph* %0, i32 0, i32 11                            ; inst 126
  %99 = getelementptr %Graph, %Graph* %0, i32 0, i32 12                            ; inst 127
  %100 = load i32, i32* %99                                                        ; inst 128
  %101 = sext i32 %100 to i64                                                      ; inst 129
  %102 = getelementptr [100 x i32], [100 x i32]* %98, i32 0, i64 %101              ; inst 130
  %103 = load i32, i32* %102                                                       ; inst 131
  %104 = getelementptr %Graph, %Graph* %0, i32 0, i32 10                           ; inst 132
  %105 = sext i32 %103 to i64                                                      ; inst 133
  %106 = getelementptr [100 x i1], [100 x i1]* %104, i32 0, i64 %105               ; inst 134
  store i1 0, i1* %106                                                             ; inst 135
  %107 = icmp eq i32 %103, %1                                                      ; inst 136
  br i1 %107, label %_19.if.then.5, label %_20.if.else.5                           ; inst 137
_19.if.then.5:
  br label %_22.while.exit.1                                                       ; inst 138
_20.if.else.5:
  br label %_21.if.exit.5                                                          ; inst 139
_21.if.exit.5:
  br label %_17.while.cond.1                                                       ; inst 140
_22.while.exit.1:
  br label %_24.if.exit.4                                                          ; inst 141
_23.if.else.4:
  br label %_24.if.exit.4                                                          ; inst 142
_24.if.exit.4:
  ret void                                                                         ; inst 143
_25.critical_edge.0:
  br label %_22.while.exit.1                                                       ; inst 144
}

define void @_ac6K71PczTg_find_all_scc(%Graph* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%14, %_2.while.body.0]                           ; inst 2
  %2 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                              ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                              ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %6                   ; inst 9
  store i32 -1, i32* %7                                                            ; inst 10
  %8 = getelementptr %Graph, %Graph* %0, i32 0, i32 8                              ; inst 11
  %9 = sext i32 %1 to i64                                                          ; inst 12
  %10 = getelementptr [100 x i32], [100 x i32]* %8, i32 0, i64 %9                  ; inst 13
  store i32 -1, i32* %10                                                           ; inst 14
  %11 = getelementptr %Graph, %Graph* %0, i32 0, i32 10                            ; inst 15
  %12 = sext i32 %1 to i64                                                         ; inst 16
  %13 = getelementptr [100 x i1], [100 x i1]* %11, i32 0, i64 %12                  ; inst 17
  store i1 0, i1* %13                                                              ; inst 18
  %14 = add i32 %1, 1                                                              ; inst 19
  br label %_1.while.cond.0                                                        ; inst 20
_3.while.exit.0:
  %15 = getelementptr %Graph, %Graph* %0, i32 0, i32 13                            ; inst 21
  store i32 0, i32* %15                                                            ; inst 22
  %16 = getelementptr %Graph, %Graph* %0, i32 0, i32 12                            ; inst 23
  store i32 0, i32* %16                                                            ; inst 24
  %17 = getelementptr %Graph, %Graph* %0, i32 0, i32 14                            ; inst 25
  store i32 0, i32* %17                                                            ; inst 26
  br label %_4.while.cond.1                                                        ; inst 27
_4.while.cond.1:
  %18 = phi i32 [0, %_3.while.exit.0], [%27, %_8.if.exit.0]                        ; inst 28
  %19 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                             ; inst 29
  %20 = load i32, i32* %19                                                         ; inst 30
  %21 = icmp slt i32 %18, %20                                                      ; inst 31
  br i1 %21, label %_5.while.body.1, label %_9.while.exit.1                        ; inst 32
_5.while.body.1:
  %22 = getelementptr %Graph, %Graph* %0, i32 0, i32 9                             ; inst 33
  %23 = sext i32 %18 to i64                                                        ; inst 34
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 35
  %25 = load i32, i32* %24                                                         ; inst 36
  %26 = icmp eq i32 %25, -1                                                        ; inst 37
  br i1 %26, label %_6.if.then.0, label %_7.if.else.0                              ; inst 38
_6.if.then.0:
  call void @_ac6K71PczTg_tarjan_scc(%Graph* %0, i32 %18)                          ; inst 39
  br label %_8.if.exit.0                                                           ; inst 40
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 41
_8.if.exit.0:
  %27 = add i32 %18, 1                                                             ; inst 42
  br label %_4.while.cond.1                                                        ; inst 43
_9.while.exit.1:
  ret void                                                                         ; inst 44
}

define i32 @_ac6K71PczTg_find_parent(%Graph* %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                             ; inst 1
  %3 = sext i32 %1 to i64                                                          ; inst 2
  %4 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %3                   ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = icmp ne i32 %5, %1                                                          ; inst 5
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 6
_1.if.then.0:
  %7 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                             ; inst 7
  %8 = sext i32 %1 to i64                                                          ; inst 8
  %9 = getelementptr [100 x i32], [100 x i32]* %7, i32 0, i64 %8                   ; inst 9
  %10 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                            ; inst 10
  %11 = sext i32 %1 to i64                                                         ; inst 11
  %12 = getelementptr [100 x i32], [100 x i32]* %10, i32 0, i64 %11                ; inst 12
  %13 = load i32, i32* %12                                                         ; inst 13
  %14 = call i32 @_ac6K71PczTg_find_parent(%Graph* %0, i32 %13)                    ; inst 14
  store i32 %14, i32* %9                                                           ; inst 15
  br label %_3.if.exit.0                                                           ; inst 16
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 17
_3.if.exit.0:
  %15 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                            ; inst 18
  %16 = sext i32 %1 to i64                                                         ; inst 19
  %17 = getelementptr [100 x i32], [100 x i32]* %15, i32 0, i64 %16                ; inst 20
  %18 = load i32, i32* %17                                                         ; inst 21
  ret i32 %18                                                                      ; inst 22
}

define void @_ac6K71PczTg_union_sets(%Graph* %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = call i32 @_ac6K71PczTg_find_parent(%Graph* %0, i32 %1)                      ; inst 1
  %4 = call i32 @_ac6K71PczTg_find_parent(%Graph* %0, i32 %2)                      ; inst 2
  %5 = icmp ne i32 %3, %4                                                          ; inst 3
  br i1 %5, label %_1.if.then.0, label %_8.if.else.0                               ; inst 4
_1.if.then.0:
  %6 = getelementptr %Graph, %Graph* %0, i32 0, i32 16                             ; inst 5
  %7 = sext i32 %3 to i64                                                          ; inst 6
  %8 = getelementptr [100 x i32], [100 x i32]* %6, i32 0, i64 %7                   ; inst 7
  %9 = load i32, i32* %8                                                           ; inst 8
  %10 = getelementptr %Graph, %Graph* %0, i32 0, i32 16                            ; inst 9
  %11 = sext i32 %4 to i64                                                         ; inst 10
  %12 = getelementptr [100 x i32], [100 x i32]* %10, i32 0, i64 %11                ; inst 11
  %13 = load i32, i32* %12                                                         ; inst 12
  %14 = icmp slt i32 %9, %13                                                       ; inst 13
  br i1 %14, label %_2.if.then.1, label %_3.if.else.1                              ; inst 14
_2.if.then.1:
  %15 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                            ; inst 15
  %16 = sext i32 %3 to i64                                                         ; inst 16
  %17 = getelementptr [100 x i32], [100 x i32]* %15, i32 0, i64 %16                ; inst 17
  store i32 %4, i32* %17                                                           ; inst 18
  br label %_7.if.exit.1                                                           ; inst 19
_3.if.else.1:
  %18 = getelementptr %Graph, %Graph* %0, i32 0, i32 16                            ; inst 20
  %19 = sext i32 %3 to i64                                                         ; inst 21
  %20 = getelementptr [100 x i32], [100 x i32]* %18, i32 0, i64 %19                ; inst 22
  %21 = load i32, i32* %20                                                         ; inst 23
  %22 = getelementptr %Graph, %Graph* %0, i32 0, i32 16                            ; inst 24
  %23 = sext i32 %4 to i64                                                         ; inst 25
  %24 = getelementptr [100 x i32], [100 x i32]* %22, i32 0, i64 %23                ; inst 26
  %25 = load i32, i32* %24                                                         ; inst 27
  %26 = icmp sgt i32 %21, %25                                                      ; inst 28
  br i1 %26, label %_4.if.then.2, label %_5.if.else.2                              ; inst 29
_4.if.then.2:
  %27 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                            ; inst 30
  %28 = sext i32 %4 to i64                                                         ; inst 31
  %29 = getelementptr [100 x i32], [100 x i32]* %27, i32 0, i64 %28                ; inst 32
  store i32 %3, i32* %29                                                           ; inst 33
  br label %_6.if.exit.2                                                           ; inst 34
_5.if.else.2:
  %30 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                            ; inst 35
  %31 = sext i32 %4 to i64                                                         ; inst 36
  %32 = getelementptr [100 x i32], [100 x i32]* %30, i32 0, i64 %31                ; inst 37
  store i32 %3, i32* %32                                                           ; inst 38
  %33 = getelementptr %Graph, %Graph* %0, i32 0, i32 16                            ; inst 39
  %34 = sext i32 %3 to i64                                                         ; inst 40
  %35 = getelementptr [100 x i32], [100 x i32]* %33, i32 0, i64 %34                ; inst 41
  %36 = load i32, i32* %35                                                         ; inst 42
  %37 = add i32 %36, 1                                                             ; inst 43
  store i32 %37, i32* %35                                                          ; inst 44
  br label %_6.if.exit.2                                                           ; inst 45
_6.if.exit.2:
  br label %_7.if.exit.1                                                           ; inst 46
_7.if.exit.1:
  br label %_9.if.exit.0                                                           ; inst 47
_8.if.else.0:
  br label %_9.if.exit.0                                                           ; inst 48
_9.if.exit.0:
  ret void                                                                         ; inst 49
}

define void @_ac6K71PczTg_kruskal_mst(%Graph* %0) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %1 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %2 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                              ; inst 3
  %3 = load i32, i32* %2                                                           ; inst 4
  %4 = icmp slt i32 %1, %3                                                         ; inst 5
  br i1 %4, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %5 = getelementptr %Graph, %Graph* %0, i32 0, i32 15                             ; inst 7
  %6 = sext i32 %1 to i64                                                          ; inst 8
  %7 = getelementptr [100 x i32], [100 x i32]* %5, i32 0, i64 %6                   ; inst 9
  store i32 %1, i32* %7                                                            ; inst 10
  %8 = getelementptr %Graph, %Graph* %0, i32 0, i32 16                             ; inst 11
  %9 = sext i32 %1 to i64                                                          ; inst 12
  %10 = getelementptr [100 x i32], [100 x i32]* %8, i32 0, i64 %9                  ; inst 13
  store i32 0, i32* %10                                                            ; inst 14
  %11 = add i32 %1, 1                                                              ; inst 15
  br label %_1.while.cond.0                                                        ; inst 16
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 17
_4.while.cond.1:
  %12 = phi i1 [0, %_3.while.exit.0], [%14, %_11.while.exit.2]                     ; inst 18
  %13 = icmp eq i1 %12, 0                                                          ; inst 19
  br i1 %13, label %_5.while.body.1, label %_12.while.exit.1                       ; inst 20
_5.while.body.1:
  br label %_6.while.cond.2                                                        ; inst 21
_6.while.cond.2:
  %14 = phi i1 [1, %_5.while.body.1], [%47, %_10.if.exit.0]                        ; inst 22
  %15 = phi i32 [0, %_5.while.body.1], [%48, %_10.if.exit.0]                       ; inst 23
  %16 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                             ; inst 24
  %17 = load i32, i32* %16                                                         ; inst 25
  %18 = sub i32 %17, 1                                                             ; inst 26
  %19 = icmp slt i32 %15, %18                                                      ; inst 27
  br i1 %19, label %_7.while.body.2, label %_11.while.exit.2                       ; inst 28
_7.while.body.2:
  %20 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 29
  %21 = sext i32 %15 to i64                                                        ; inst 30
  %22 = getelementptr [2000 x %Edge], [2000 x %Edge]* %20, i32 0, i64 %21          ; inst 31
  %23 = getelementptr %Edge, %Edge* %22, i32 0, i32 2                              ; inst 32
  %24 = load i32, i32* %23                                                         ; inst 33
  %25 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 34
  %26 = add i32 %15, 1                                                             ; inst 35
  %27 = sext i32 %26 to i64                                                        ; inst 36
  %28 = getelementptr [2000 x %Edge], [2000 x %Edge]* %25, i32 0, i64 %27          ; inst 37
  %29 = getelementptr %Edge, %Edge* %28, i32 0, i32 2                              ; inst 38
  %30 = load i32, i32* %29                                                         ; inst 39
  %31 = icmp sgt i32 %24, %30                                                      ; inst 40
  br i1 %31, label %_8.if.then.0, label %_9.if.else.0                              ; inst 41
_8.if.then.0:
  %32 = alloca %Edge                                                               ; inst 42
  %33 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 43
  %34 = sext i32 %15 to i64                                                        ; inst 44
  %35 = getelementptr [2000 x %Edge], [2000 x %Edge]* %33, i32 0, i64 %34          ; inst 45
  call void @memcpy(%Edge* %32, %Edge* %35, i64 20)                                ; inst 46
  %36 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 47
  %37 = sext i32 %15 to i64                                                        ; inst 48
  %38 = getelementptr [2000 x %Edge], [2000 x %Edge]* %36, i32 0, i64 %37          ; inst 49
  %39 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 50
  %40 = add i32 %15, 1                                                             ; inst 51
  %41 = sext i32 %40 to i64                                                        ; inst 52
  %42 = getelementptr [2000 x %Edge], [2000 x %Edge]* %39, i32 0, i64 %41          ; inst 53
  call void @memcpy(%Edge* %38, %Edge* %42, i64 20)                                ; inst 54
  %43 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 55
  %44 = add i32 %15, 1                                                             ; inst 56
  %45 = sext i32 %44 to i64                                                        ; inst 57
  %46 = getelementptr [2000 x %Edge], [2000 x %Edge]* %43, i32 0, i64 %45          ; inst 58
  call void @memcpy(%Edge* %46, %Edge* %32, i64 20)                                ; inst 59
  br label %_10.if.exit.0                                                          ; inst 60
_9.if.else.0:
  br label %_10.if.exit.0                                                          ; inst 61
_10.if.exit.0:
  %47 = phi i1 [0, %_8.if.then.0], [%14, %_9.if.else.0]                            ; inst 62
  %48 = add i32 %15, 1                                                             ; inst 63
  br label %_6.while.cond.2                                                        ; inst 64
_11.while.exit.2:
  br label %_4.while.cond.1                                                        ; inst 65
_12.while.exit.1:
  %49 = getelementptr %Graph, %Graph* %0, i32 0, i32 17                            ; inst 66
  store i32 0, i32* %49                                                            ; inst 67
  br label %_13.while.cond.3                                                       ; inst 68
_13.while.cond.3:
  %50 = phi i32 [0, %_12.while.exit.1], [%81, %_20.if.exit.1]                      ; inst 69
  %51 = phi i32 [0, %_12.while.exit.1], [%82, %_20.if.exit.1]                      ; inst 70
  %52 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                             ; inst 71
  %53 = load i32, i32* %52                                                         ; inst 72
  %54 = icmp slt i32 %51, %53                                                      ; inst 73
  br i1 %54, label %_14.lazy.then.0, label %_15.lazy.else.0                        ; inst 74
_14.lazy.then.0:
  %55 = getelementptr %Graph, %Graph* %0, i32 0, i32 0                             ; inst 75
  %56 = load i32, i32* %55                                                         ; inst 76
  %57 = sub i32 %56, 1                                                             ; inst 77
  %58 = icmp slt i32 %50, %57                                                      ; inst 78
  br label %_16.lazy.exit.0                                                        ; inst 79
_15.lazy.else.0:
  br label %_16.lazy.exit.0                                                        ; inst 80
_16.lazy.exit.0:
  %59 = phi i1 [%58, %_14.lazy.then.0], [0, %_15.lazy.else.0]                      ; inst 81
  br i1 %59, label %_17.while.body.3, label %_21.while.exit.3                      ; inst 82
_17.while.body.3:
  %60 = alloca %Edge                                                               ; inst 83
  %61 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 84
  %62 = sext i32 %51 to i64                                                        ; inst 85
  %63 = getelementptr [2000 x %Edge], [2000 x %Edge]* %61, i32 0, i64 %62          ; inst 86
  call void @memcpy(%Edge* %60, %Edge* %63, i64 20)                                ; inst 87
  %64 = getelementptr %Edge, %Edge* %60, i32 0, i32 0                              ; inst 88
  %65 = load i32, i32* %64                                                         ; inst 89
  %66 = call i32 @_ac6K71PczTg_find_parent(%Graph* %0, i32 %65)                    ; inst 90
  %67 = getelementptr %Edge, %Edge* %60, i32 0, i32 1                              ; inst 91
  %68 = load i32, i32* %67                                                         ; inst 92
  %69 = call i32 @_ac6K71PczTg_find_parent(%Graph* %0, i32 %68)                    ; inst 93
  %70 = icmp ne i32 %66, %69                                                       ; inst 94
  br i1 %70, label %_18.if.then.1, label %_19.if.else.1                            ; inst 95
_18.if.then.1:
  %71 = getelementptr %Edge, %Edge* %60, i32 0, i32 0                              ; inst 96
  %72 = load i32, i32* %71                                                         ; inst 97
  %73 = getelementptr %Edge, %Edge* %60, i32 0, i32 1                              ; inst 98
  %74 = load i32, i32* %73                                                         ; inst 99
  call void @_ac6K71PczTg_union_sets(%Graph* %0, i32 %72, i32 %74)                 ; inst 100
  %75 = getelementptr %Graph, %Graph* %0, i32 0, i32 17                            ; inst 101
  %76 = load i32, i32* %75                                                         ; inst 102
  %77 = getelementptr %Edge, %Edge* %60, i32 0, i32 2                              ; inst 103
  %78 = load i32, i32* %77                                                         ; inst 104
  %79 = add i32 %76, %78                                                           ; inst 105
  store i32 %79, i32* %75                                                          ; inst 106
  %80 = add i32 %50, 1                                                             ; inst 107
  br label %_20.if.exit.1                                                          ; inst 108
_19.if.else.1:
  br label %_20.if.exit.1                                                          ; inst 109
_20.if.exit.1:
  %81 = phi i32 [%80, %_18.if.then.1], [%50, %_19.if.else.1]                       ; inst 110
  %82 = add i32 %51, 1                                                             ; inst 111
  br label %_13.while.cond.3                                                       ; inst 112
_21.while.exit.3:
  ret void                                                                         ; inst 113
}

define i32 @_ac6K71PczTg_dfs_flow(%Graph* %0, i32 %1, i32 %2, i32 %3, i32 %4, [100 x i1]* %5) {
_0.entry.0:
  %6 = icmp eq i32 %3, %2                                                          ; inst 1
  br i1 %6, label %_1.if.then.0, label %_2.if.else.0                               ; inst 2
_1.if.then.0:
  ret i32 %4                                                                       ; inst 3
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 4
_3.if.exit.0:
  %7 = sext i32 %3 to i64                                                          ; inst 5
  %8 = getelementptr [100 x i1], [100 x i1]* %5, i32 0, i64 %7                     ; inst 6
  store i1 1, i1* %8                                                               ; inst 7
  br label %_4.while.cond.0                                                        ; inst 8
_4.while.cond.0:
  %9 = phi i32 [0, %_3.if.exit.0], [%71, %_29.if.exit.1]                           ; inst 9
  %10 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                             ; inst 10
  %11 = load i32, i32* %10                                                         ; inst 11
  %12 = icmp slt i32 %9, %11                                                       ; inst 12
  br i1 %12, label %_5.while.body.0, label %_30.while.exit.0                       ; inst 13
_5.while.body.0:
  %13 = alloca %Edge                                                               ; inst 14
  %14 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 15
  %15 = sext i32 %9 to i64                                                         ; inst 16
  %16 = getelementptr [2000 x %Edge], [2000 x %Edge]* %14, i32 0, i64 %15          ; inst 17
  call void @memcpy(%Edge* %13, %Edge* %16, i64 20)                                ; inst 18
  %17 = getelementptr %Edge, %Edge* %13, i32 0, i32 0                              ; inst 19
  %18 = load i32, i32* %17                                                         ; inst 20
  %19 = icmp eq i32 %18, %3                                                        ; inst 21
  br i1 %19, label %_6.lazy.then.0, label %_7.lazy.else.0                          ; inst 22
_6.lazy.then.0:
  %20 = getelementptr %Edge, %Edge* %13, i32 0, i32 1                              ; inst 23
  %21 = load i32, i32* %20                                                         ; inst 24
  %22 = sext i32 %21 to i64                                                        ; inst 25
  %23 = getelementptr [100 x i1], [100 x i1]* %5, i32 0, i64 %22                   ; inst 26
  %24 = load i1, i1* %23                                                           ; inst 27
  %25 = icmp eq i1 %24, 0                                                          ; inst 28
  br label %_8.lazy.exit.0                                                         ; inst 29
_7.lazy.else.0:
  br label %_8.lazy.exit.0                                                         ; inst 30
_8.lazy.exit.0:
  %26 = phi i1 [%25, %_6.lazy.then.0], [0, %_7.lazy.else.0]                        ; inst 31
  br i1 %26, label %_9.if.then.1, label %_28.if.else.1                             ; inst 32
_9.if.then.1:
  %27 = getelementptr %Edge, %Edge* %13, i32 0, i32 3                              ; inst 33
  %28 = load i32, i32* %27                                                         ; inst 34
  %29 = getelementptr %Edge, %Edge* %13, i32 0, i32 4                              ; inst 35
  %30 = load i32, i32* %29                                                         ; inst 36
  %31 = sub i32 %28, %30                                                           ; inst 37
  %32 = icmp sgt i32 %31, 0                                                        ; inst 38
  br i1 %32, label %_10.if.then.2, label %_26.if.else.2                            ; inst 39
_10.if.then.2:
  %33 = icmp slt i32 %4, %31                                                       ; inst 40
  br i1 %33, label %_11.if.then.3, label %_12.if.else.3                            ; inst 41
_11.if.then.3:
  br label %_13.if.exit.3                                                          ; inst 42
_12.if.else.3:
  br label %_13.if.exit.3                                                          ; inst 43
_13.if.exit.3:
  %34 = phi i32 [%4, %_11.if.then.3], [%31, %_12.if.else.3]                        ; inst 44
  %35 = getelementptr %Edge, %Edge* %13, i32 0, i32 1                              ; inst 45
  %36 = load i32, i32* %35                                                         ; inst 46
  %37 = call i32 @_ac6K71PczTg_dfs_flow(%Graph* %0, i32 %1, i32 %2, i32 %36, i32 %34, [100 x i1]* %5) ; inst 47
  %38 = icmp sgt i32 %37, 0                                                        ; inst 48
  br i1 %38, label %_14.if.then.4, label %_24.if.else.4                            ; inst 49
_14.if.then.4:
  %39 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 50
  %40 = sext i32 %9 to i64                                                         ; inst 51
  %41 = getelementptr [2000 x %Edge], [2000 x %Edge]* %39, i32 0, i64 %40          ; inst 52
  %42 = getelementptr %Edge, %Edge* %41, i32 0, i32 4                              ; inst 53
  %43 = load i32, i32* %42                                                         ; inst 54
  %44 = add i32 %43, %37                                                           ; inst 55
  store i32 %44, i32* %42                                                          ; inst 56
  br label %_15.while.cond.1                                                       ; inst 57
_15.while.cond.1:
  %45 = phi i32 [0, %_14.if.then.4], [%70, %_22.if.exit.5]                         ; inst 58
  %46 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                             ; inst 59
  %47 = load i32, i32* %46                                                         ; inst 60
  %48 = icmp slt i32 %45, %47                                                      ; inst 61
  br i1 %48, label %_16.while.body.1, label %_31.critical_edge.0                   ; inst 62
_16.while.body.1:
  %49 = alloca %Edge                                                               ; inst 63
  %50 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 64
  %51 = sext i32 %45 to i64                                                        ; inst 65
  %52 = getelementptr [2000 x %Edge], [2000 x %Edge]* %50, i32 0, i64 %51          ; inst 66
  call void @memcpy(%Edge* %49, %Edge* %52, i64 20)                                ; inst 67
  %53 = getelementptr %Edge, %Edge* %49, i32 0, i32 0                              ; inst 68
  %54 = load i32, i32* %53                                                         ; inst 69
  %55 = getelementptr %Edge, %Edge* %13, i32 0, i32 1                              ; inst 70
  %56 = load i32, i32* %55                                                         ; inst 71
  %57 = icmp eq i32 %54, %56                                                       ; inst 72
  br i1 %57, label %_17.lazy.then.1, label %_18.lazy.else.1                        ; inst 73
_17.lazy.then.1:
  %58 = getelementptr %Edge, %Edge* %49, i32 0, i32 1                              ; inst 74
  %59 = load i32, i32* %58                                                         ; inst 75
  %60 = getelementptr %Edge, %Edge* %13, i32 0, i32 0                              ; inst 76
  %61 = load i32, i32* %60                                                         ; inst 77
  %62 = icmp eq i32 %59, %61                                                       ; inst 78
  br label %_19.lazy.exit.1                                                        ; inst 79
_18.lazy.else.1:
  br label %_19.lazy.exit.1                                                        ; inst 80
_19.lazy.exit.1:
  %63 = phi i1 [%62, %_17.lazy.then.1], [0, %_18.lazy.else.1]                      ; inst 81
  br i1 %63, label %_20.if.then.5, label %_21.if.else.5                            ; inst 82
_20.if.then.5:
  %64 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                             ; inst 83
  %65 = sext i32 %45 to i64                                                        ; inst 84
  %66 = getelementptr [2000 x %Edge], [2000 x %Edge]* %64, i32 0, i64 %65          ; inst 85
  %67 = getelementptr %Edge, %Edge* %66, i32 0, i32 4                              ; inst 86
  %68 = load i32, i32* %67                                                         ; inst 87
  %69 = sub i32 %68, %37                                                           ; inst 88
  store i32 %69, i32* %67                                                          ; inst 89
  br label %_23.while.exit.1                                                       ; inst 90
_21.if.else.5:
  br label %_22.if.exit.5                                                          ; inst 91
_22.if.exit.5:
  %70 = add i32 %45, 1                                                             ; inst 92
  br label %_15.while.cond.1                                                       ; inst 93
_23.while.exit.1:
  ret i32 %37                                                                      ; inst 94
_24.if.else.4:
  br label %_25.if.exit.4                                                          ; inst 95
_25.if.exit.4:
  br label %_27.if.exit.2                                                          ; inst 96
_26.if.else.2:
  br label %_27.if.exit.2                                                          ; inst 97
_27.if.exit.2:
  br label %_29.if.exit.1                                                          ; inst 98
_28.if.else.1:
  br label %_29.if.exit.1                                                          ; inst 99
_29.if.exit.1:
  %71 = add i32 %9, 1                                                              ; inst 100
  br label %_4.while.cond.0                                                        ; inst 101
_30.while.exit.0:
  ret i32 0                                                                        ; inst 102
_31.critical_edge.0:
  br label %_23.while.exit.1                                                       ; inst 103
}

define i32 @_ac6K71PczTg_max_flow(%Graph* %0, i32 %1, i32 %2) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %3 = phi i32 [0, %_0.entry.0], [%11, %_2.while.body.0]                           ; inst 2
  %4 = getelementptr %Graph, %Graph* %0, i32 0, i32 2                              ; inst 3
  %5 = load i32, i32* %4                                                           ; inst 4
  %6 = icmp slt i32 %3, %5                                                         ; inst 5
  br i1 %6, label %_2.while.body.0, label %_3.while.exit.0                         ; inst 6
_2.while.body.0:
  %7 = getelementptr %Graph, %Graph* %0, i32 0, i32 1                              ; inst 7
  %8 = sext i32 %3 to i64                                                          ; inst 8
  %9 = getelementptr [2000 x %Edge], [2000 x %Edge]* %7, i32 0, i64 %8             ; inst 9
  %10 = getelementptr %Edge, %Edge* %9, i32 0, i32 4                               ; inst 10
  store i32 0, i32* %10                                                            ; inst 11
  %11 = add i32 %3, 1                                                              ; inst 12
  br label %_1.while.cond.0                                                        ; inst 13
_3.while.exit.0:
  br label %_4.while.cond.1                                                        ; inst 14
_4.while.cond.1:
  %12 = phi i32 [0, %_3.while.exit.0], [%24, %_11.if.exit.0]                       ; inst 15
  %13 = phi i32 [0, %_3.while.exit.0], [%23, %_11.if.exit.0]                       ; inst 16
  %14 = icmp slt i32 %12, 1000                                                     ; inst 17
  br i1 %14, label %_5.while.body.1, label %_13.critical_edge.0                    ; inst 18
_5.while.body.1:
  %15 = alloca [100 x i1]                                                          ; inst 19
  %16 = getelementptr [100 x i1], [100 x i1]* %15, i32 0, i32 0                    ; inst 20
  br label %_6.array.cond.0                                                        ; inst 21
_6.array.cond.0:
  %17 = phi i32 [0, %_5.while.body.1], [%20, %_7.array.body.0]                     ; inst 22
  %18 = icmp slt i32 %17, 100                                                      ; inst 23
  br i1 %18, label %_7.array.body.0, label %_8.array.exit.0                        ; inst 24
_7.array.body.0:
  %19 = getelementptr i1, i1* %16, i32 %17                                         ; inst 25
  store i1 0, i1* %19                                                              ; inst 26
  %20 = add i32 %17, 1                                                             ; inst 27
  br label %_6.array.cond.0                                                        ; inst 28
_8.array.exit.0:
  %21 = call i32 @_ac6K71PczTg_dfs_flow(%Graph* %0, i32 %1, i32 %2, i32 %1, i32 500, [100 x i1]* %15) ; inst 29
  %22 = icmp eq i32 %21, 0                                                         ; inst 30
  br i1 %22, label %_9.if.then.0, label %_10.if.else.0                             ; inst 31
_9.if.then.0:
  br label %_12.while.exit.1                                                       ; inst 32
_10.if.else.0:
  br label %_11.if.exit.0                                                          ; inst 33
_11.if.exit.0:
  %23 = add i32 %13, %21                                                           ; inst 34
  %24 = add i32 %12, 1                                                             ; inst 35
  br label %_4.while.cond.1                                                        ; inst 36
_12.while.exit.1:
  ret i32 %13                                                                      ; inst 37
_13.critical_edge.0:
  br label %_12.while.exit.1                                                       ; inst 38
}

define void @_ac6K71PczTg_analyze_graph(%Graph* %0, i32 %1, i32 %2) {
_0.entry.0:
  call void @_ac6K71PczTg_dijkstra(%Graph* %0, i32 %1)                             ; inst 1
  %3 = getelementptr %Graph, %Graph* %0, i32 0, i32 5                              ; inst 2
  %4 = sext i32 %2 to i64                                                          ; inst 3
  %5 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %4                   ; inst 4
  %6 = load i32, i32* %5                                                           ; inst 5
  call void @printlnInt(i32 %6)                                                    ; inst 6
  call void @_ac6K71PczTg_floyd_warshall(%Graph* %0)                               ; inst 7
  %7 = getelementptr %Graph, %Graph* %0, i32 0, i32 7                              ; inst 8
  %8 = sext i32 %1 to i64                                                          ; inst 9
  %9 = getelementptr [100 x [100 x i32]], [100 x [100 x i32]]* %7, i32 0, i64 %8   ; inst 10
  %10 = sext i32 %2 to i64                                                         ; inst 11
  %11 = getelementptr [100 x i32], [100 x i32]* %9, i32 0, i64 %10                 ; inst 12
  %12 = load i32, i32* %11                                                         ; inst 13
  call void @printlnInt(i32 %12)                                                   ; inst 14
  call void @_ac6K71PczTg_find_all_scc(%Graph* %0)                                 ; inst 15
  %13 = getelementptr %Graph, %Graph* %0, i32 0, i32 14                            ; inst 16
  %14 = load i32, i32* %13                                                         ; inst 17
  call void @printlnInt(i32 %14)                                                   ; inst 18
  call void @_ac6K71PczTg_kruskal_mst(%Graph* %0)                                  ; inst 19
  %15 = getelementptr %Graph, %Graph* %0, i32 0, i32 17                            ; inst 20
  %16 = load i32, i32* %15                                                         ; inst 21
  call void @printlnInt(i32 %16)                                                   ; inst 22
  %17 = call i32 @_ac6K71PczTg_max_flow(%Graph* %0, i32 %1, i32 %2)                ; inst 23
  call void @printlnInt(i32 %17)                                                   ; inst 24
  ret void                                                                         ; inst 25
}

define void @_fGZ7fiIE3um_new(%GraphGenerator* sret(%GraphGenerator) %0, i32 %1) {
_0.entry.0:
  %2 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0            ; inst 1
  store i32 %1, i32* %2                                                            ; inst 2
  ret void                                                                         ; inst 3
}

define i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0) {
_0.entry.0:
  %1 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0            ; inst 1
  %2 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0            ; inst 2
  %3 = load i32, i32* %2                                                           ; inst 3
  %4 = call i32 @pm_rand_update(i32 %3)                                            ; inst 4
  store i32 %4, i32* %1                                                            ; inst 5
  %5 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0            ; inst 6
  %6 = load i32, i32* %5                                                           ; inst 7
  %7 = icmp slt i32 %6, 0                                                          ; inst 8
  br i1 %7, label %_1.if.then.0, label %_2.if.else.0                               ; inst 9
_1.if.then.0:
  %8 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0            ; inst 10
  %9 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0            ; inst 11
  %10 = load i32, i32* %9                                                          ; inst 12
  %11 = sub i32 0, %10                                                             ; inst 13
  store i32 %11, i32* %8                                                           ; inst 14
  br label %_3.if.exit.0                                                           ; inst 15
_2.if.else.0:
  br label %_3.if.exit.0                                                           ; inst 16
_3.if.exit.0:
  %12 = getelementptr %GraphGenerator, %GraphGenerator* %0, i32 0, i32 0           ; inst 17
  %13 = load i32, i32* %12                                                         ; inst 18
  ret i32 %13                                                                      ; inst 19
}

define void @_fGZ7fiIE3um_generate_complex_graph(%GraphGenerator* %0, %Graph* %1, i32 %2) {
_0.entry.0:
  %3 = getelementptr %Graph, %Graph* %1, i32 0, i32 0                              ; inst 1
  %4 = load i32, i32* %3                                                           ; inst 2
  %5 = mul i32 %4, %4                                                              ; inst 3
  %6 = mul i32 %5, %2                                                              ; inst 4
  %7 = sdiv i32 %6, 100                                                            ; inst 5
  br label %_1.while.cond.0                                                        ; inst 6
_1.while.cond.0:
  %8 = phi i32 [0, %_0.entry.0], [%24, %_8.if.exit.0]                              ; inst 7
  %9 = icmp slt i32 %8, %7                                                         ; inst 8
  br i1 %9, label %_2.lazy.then.0, label %_3.lazy.else.0                           ; inst 9
_2.lazy.then.0:
  %10 = icmp slt i32 %8, 1800                                                      ; inst 10
  br label %_4.lazy.exit.0                                                         ; inst 11
_3.lazy.else.0:
  br label %_4.lazy.exit.0                                                         ; inst 12
_4.lazy.exit.0:
  %11 = phi i1 [%10, %_2.lazy.then.0], [0, %_3.lazy.else.0]                        ; inst 13
  br i1 %11, label %_5.while.body.0, label %_9.while.exit.0                        ; inst 14
_5.while.body.0:
  %12 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0)                    ; inst 15
  %13 = srem i32 %12, %4                                                           ; inst 16
  %14 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0)                    ; inst 17
  %15 = srem i32 %14, %4                                                           ; inst 18
  %16 = icmp ne i32 %13, %15                                                       ; inst 19
  br i1 %16, label %_6.if.then.0, label %_7.if.else.0                              ; inst 20
_6.if.then.0:
  %17 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0)                    ; inst 21
  %18 = srem i32 %17, 100                                                          ; inst 22
  %19 = add i32 %18, 1                                                             ; inst 23
  %20 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0)                    ; inst 24
  %21 = srem i32 %20, 50                                                           ; inst 25
  %22 = add i32 %21, 1                                                             ; inst 26
  call void @_ac6K71PczTg_add_edge(%Graph* %1, i32 %13, i32 %15, i32 %19, i32 %22) ; inst 27
  %23 = add i32 %8, 1                                                              ; inst 28
  br label %_8.if.exit.0                                                           ; inst 29
_7.if.else.0:
  br label %_8.if.exit.0                                                           ; inst 30
_8.if.exit.0:
  %24 = phi i32 [%23, %_6.if.then.0], [%8, %_7.if.else.0]                          ; inst 31
  br label %_1.while.cond.0                                                        ; inst 32
_9.while.exit.0:
  br label %_10.while.cond.1                                                       ; inst 33
_10.while.cond.1:
  %25 = phi i32 [0, %_9.while.exit.0], [%35, %_11.while.body.1]                    ; inst 34
  %26 = sub i32 %4, 1                                                              ; inst 35
  %27 = icmp slt i32 %25, %26                                                      ; inst 36
  br i1 %27, label %_11.while.body.1, label %_12.while.exit.1                      ; inst 37
_11.while.body.1:
  %28 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0)                    ; inst 38
  %29 = srem i32 %28, 20                                                           ; inst 39
  %30 = add i32 %29, 1                                                             ; inst 40
  %31 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %0)                    ; inst 41
  %32 = srem i32 %31, 30                                                           ; inst 42
  %33 = add i32 %32, 1                                                             ; inst 43
  %34 = add i32 %25, 1                                                             ; inst 44
  call void @_ac6K71PczTg_add_edge(%Graph* %1, i32 %25, i32 %34, i32 %30, i32 %33) ; inst 45
  %35 = add i32 %25, 1                                                             ; inst 46
  br label %_10.while.cond.1                                                       ; inst 47
_12.while.exit.1:
  ret void                                                                         ; inst 48
}

define void @main() {
_0.entry.0:
  %0 = call i32 @getInt()                                                          ; inst 1
  %1 = call i32 @getInt()                                                          ; inst 2
  %2 = call i32 @getInt()                                                          ; inst 3
  %3 = call i32 @getInt()                                                          ; inst 4
  %4 = call i32 @getInt()                                                          ; inst 5
  %5 = alloca %Graph                                                               ; inst 6
  call void @_ac6K71PczTg_new(%Graph* %5, i32 %0)                                  ; inst 7
  %6 = alloca %GraphGenerator                                                      ; inst 8
  call void @_fGZ7fiIE3um_new(%GraphGenerator* %6, i32 %4)                         ; inst 9
  call void @_fGZ7fiIE3um_generate_complex_graph(%GraphGenerator* %6, %Graph* %5, i32 %1) ; inst 10
  call void @_ac6K71PczTg_analyze_graph(%Graph* %5, i32 %2, i32 %3)                ; inst 11
  br label %_1.while.cond.0                                                        ; inst 12
_1.while.cond.0:
  %7 = phi i32 [0, %_0.entry.0], [%18, %_5.if.exit.0]                              ; inst 13
  %8 = icmp slt i32 %7, 10                                                         ; inst 14
  br i1 %8, label %_2.while.body.0, label %_6.while.exit.0                         ; inst 15
_2.while.body.0:
  %9 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %6)                     ; inst 16
  %10 = srem i32 %9, %0                                                            ; inst 17
  %11 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %6)                    ; inst 18
  %12 = srem i32 %11, %0                                                           ; inst 19
  %13 = icmp ne i32 %10, %12                                                       ; inst 20
  br i1 %13, label %_3.if.then.0, label %_4.if.else.0                              ; inst 21
_3.if.then.0:
  call void @_ac6K71PczTg_dijkstra(%Graph* %5, i32 %10)                            ; inst 22
  %14 = getelementptr %Graph, %Graph* %5, i32 0, i32 5                             ; inst 23
  %15 = sext i32 %12 to i64                                                        ; inst 24
  %16 = getelementptr [100 x i32], [100 x i32]* %14, i32 0, i64 %15                ; inst 25
  %17 = load i32, i32* %16                                                         ; inst 26
  call void @printlnInt(i32 %17)                                                   ; inst 27
  br label %_5.if.exit.0                                                           ; inst 28
_4.if.else.0:
  br label %_5.if.exit.0                                                           ; inst 29
_5.if.exit.0:
  %18 = add i32 %7, 1                                                              ; inst 30
  br label %_1.while.cond.0                                                        ; inst 31
_6.while.exit.0:
  br label %_7.while.cond.1                                                        ; inst 32
_7.while.cond.1:
  %19 = phi i32 [0, %_6.while.exit.0], [%25, %_8.while.body.1]                     ; inst 33
  %20 = phi i32 [0, %_6.while.exit.0], [%24, %_8.while.body.1]                     ; inst 34
  %21 = icmp slt i32 %19, 5                                                        ; inst 35
  br i1 %21, label %_8.while.body.1, label %_9.while.exit.1                        ; inst 36
_8.while.body.1:
  call void @_ac6K71PczTg_find_all_scc(%Graph* %5)                                 ; inst 37
  %22 = getelementptr %Graph, %Graph* %5, i32 0, i32 14                            ; inst 38
  %23 = load i32, i32* %22                                                         ; inst 39
  %24 = add i32 %20, %23                                                           ; inst 40
  %25 = add i32 %19, 1                                                             ; inst 41
  br label %_7.while.cond.1                                                        ; inst 42
_9.while.exit.1:
  call void @printlnInt(i32 %20)                                                   ; inst 43
  br label %_10.while.cond.2                                                       ; inst 44
_10.while.cond.2:
  %26 = phi i32 [0, %_9.while.exit.1], [%46, %_17.while.exit.3]                    ; inst 45
  %27 = phi i32 [0, %_9.while.exit.1], [%31, %_17.while.exit.3]                    ; inst 46
  %28 = icmp slt i32 %26, 3                                                        ; inst 47
  br i1 %28, label %_11.while.body.2, label %_18.while.exit.2                      ; inst 48
_11.while.body.2:
  call void @_ac6K71PczTg_kruskal_mst(%Graph* %5)                                  ; inst 49
  %29 = getelementptr %Graph, %Graph* %5, i32 0, i32 17                            ; inst 50
  %30 = load i32, i32* %29                                                         ; inst 51
  %31 = add i32 %27, %30                                                           ; inst 52
  br label %_12.while.cond.3                                                       ; inst 53
_12.while.cond.3:
  %32 = phi i32 [0, %_11.while.body.2], [%45, %_16.while.body.3]                   ; inst 54
  %33 = icmp slt i32 %32, 10                                                       ; inst 55
  br i1 %33, label %_13.lazy.then.0, label %_14.lazy.else.0                        ; inst 56
_13.lazy.then.0:
  %34 = getelementptr %Graph, %Graph* %5, i32 0, i32 2                             ; inst 57
  %35 = load i32, i32* %34                                                         ; inst 58
  %36 = icmp slt i32 %32, %35                                                      ; inst 59
  br label %_15.lazy.exit.0                                                        ; inst 60
_14.lazy.else.0:
  br label %_15.lazy.exit.0                                                        ; inst 61
_15.lazy.exit.0:
  %37 = phi i1 [%36, %_13.lazy.then.0], [0, %_14.lazy.else.0]                      ; inst 62
  br i1 %37, label %_16.while.body.3, label %_17.while.exit.3                      ; inst 63
_16.while.body.3:
  %38 = call i32 @_fGZ7fiIE3um_next_random(%GraphGenerator* %6)                    ; inst 64
  %39 = srem i32 %38, 50                                                           ; inst 65
  %40 = add i32 %39, 1                                                             ; inst 66
  %41 = getelementptr %Graph, %Graph* %5, i32 0, i32 1                             ; inst 67
  %42 = sext i32 %32 to i64                                                        ; inst 68
  %43 = getelementptr [2000 x %Edge], [2000 x %Edge]* %41, i32 0, i64 %42          ; inst 69
  %44 = getelementptr %Edge, %Edge* %43, i32 0, i32 2                              ; inst 70
  store i32 %40, i32* %44                                                          ; inst 71
  %45 = add i32 %32, 1                                                             ; inst 72
  br label %_12.while.cond.3                                                       ; inst 73
_17.while.exit.3:
  %46 = add i32 %26, 1                                                             ; inst 74
  br label %_10.while.cond.2                                                       ; inst 75
_18.while.exit.2:
  call void @printlnInt(i32 %27)                                                   ; inst 76
  %47 = mul i32 %20, %27                                                           ; inst 77
  %48 = add i32 %0, 1                                                              ; inst 78
  %49 = sdiv i32 %47, %48                                                          ; inst 79
  call void @printlnInt(i32 %49)                                                   ; inst 80
  call void @exit(i32 0)                                                           ; inst 81
  ret void                                                                         ; inst 82
}

