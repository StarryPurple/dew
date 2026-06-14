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



define void @load_program([256 x i32]* %0) {
_0.entry.0:
  %1 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 0                    ; inst 1
  store i32 1, i32* %1                                                             ; inst 2
  %2 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 1                    ; inst 3
  store i32 8, i32* %2                                                             ; inst 4
  %3 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 2                    ; inst 5
  store i32 1, i32* %3                                                             ; inst 6
  %4 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 3                    ; inst 7
  store i32 1, i32* %4                                                             ; inst 8
  %5 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 4                    ; inst 9
  store i32 15, i32* %5                                                            ; inst 10
  %6 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 5                    ; inst 11
  store i32 1, i32* %6                                                             ; inst 12
  %7 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 6                    ; inst 13
  store i32 1, i32* %7                                                             ; inst 14
  %8 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 7                    ; inst 15
  store i32 11, i32* %8                                                            ; inst 16
  %9 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 8                    ; inst 17
  store i32 9, i32* %9                                                             ; inst 18
  %10 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 9                   ; inst 19
  store i32 14, i32* %10                                                           ; inst 20
  %11 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 10                  ; inst 21
  store i32 7, i32* %11                                                            ; inst 22
  %12 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 11                  ; inst 23
  store i32 20, i32* %12                                                           ; inst 24
  %13 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 12                  ; inst 25
  store i32 5, i32* %13                                                            ; inst 26
  %14 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 13                  ; inst 27
  store i32 1, i32* %14                                                            ; inst 28
  %15 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 14                  ; inst 29
  store i32 -1, i32* %15                                                           ; inst 30
  %16 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 15                  ; inst 31
  store i32 3, i32* %16                                                            ; inst 32
  %17 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 16                  ; inst 33
  store i32 7, i32* %17                                                            ; inst 34
  %18 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 17                  ; inst 35
  store i32 4, i32* %18                                                            ; inst 36
  %19 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 18                  ; inst 37
  store i32 2, i32* %19                                                            ; inst 38
  %20 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 19                  ; inst 39
  store i32 7, i32* %20                                                            ; inst 40
  %21 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 20                  ; inst 41
  store i32 12, i32* %21                                                           ; inst 42
  %22 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 21                  ; inst 43
  store i32 13, i32* %22                                                           ; inst 44
  %23 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 22                  ; inst 45
  store i32 14, i32* %23                                                           ; inst 46
  br label %_1.while.cond.0                                                        ; inst 47
_1.while.cond.0:
  %24 = phi i32 [30, %_0.entry.0], [%37, %_2.while.body.0]                         ; inst 48
  %25 = icmp slt i32 %24, 250                                                      ; inst 49
  br i1 %25, label %_2.while.body.0, label %_3.while.exit.0                        ; inst 50
_2.while.body.0:
  %26 = sext i32 %24 to i64                                                        ; inst 51
  %27 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %26                 ; inst 52
  store i32 1, i32* %27                                                            ; inst 53
  %28 = sext i32 %24 to i64                                                        ; inst 54
  %29 = add i64 %28, 1                                                             ; inst 55
  %30 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %29                 ; inst 56
  store i32 %24, i32* %30                                                          ; inst 57
  %31 = sext i32 %24 to i64                                                        ; inst 58
  %32 = add i64 %31, 2                                                             ; inst 59
  %33 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %32                 ; inst 60
  store i32 15, i32* %33                                                           ; inst 61
  %34 = sext i32 %24 to i64                                                        ; inst 62
  %35 = add i64 %34, 3                                                             ; inst 63
  %36 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %35                 ; inst 64
  store i32 2, i32* %36                                                            ; inst 65
  %37 = add i32 %24, 4                                                             ; inst 66
  br label %_1.while.cond.0                                                        ; inst 67
_3.while.exit.0:
  ret void                                                                         ; inst 68
}

define void @self_modify_code([256 x i32]* %0, i32 %1) {
_0.entry.0:
  %2 = icmp sgt i32 %1, 10                                                         ; inst 1
  br i1 %2, label %_1.lazy.then.0, label %_2.lazy.else.0                           ; inst 2
_1.lazy.then.0:
  %3 = sext i32 %1 to i64                                                          ; inst 3
  %4 = sub i64 %3, 1                                                               ; inst 4
  %5 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %4                   ; inst 5
  %6 = load i32, i32* %5                                                           ; inst 6
  %7 = icmp eq i32 %6, 15                                                          ; inst 7
  br label %_3.lazy.exit.0                                                         ; inst 8
_2.lazy.else.0:
  br label %_3.lazy.exit.0                                                         ; inst 9
_3.lazy.exit.0:
  %8 = phi i1 [%7, %_1.lazy.then.0], [0, %_2.lazy.else.0]                          ; inst 10
  br i1 %8, label %_4.if.then.0, label %_5.if.else.0                               ; inst 11
_4.if.then.0:
  %9 = sext i32 %1 to i64                                                          ; inst 12
  %10 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %9                  ; inst 13
  store i32 2, i32* %10                                                            ; inst 14
  br label %_6.if.exit.0                                                           ; inst 15
_5.if.else.0:
  br label %_6.if.exit.0                                                           ; inst 16
_6.if.exit.0:
  ret void                                                                         ; inst 17
}

define void @main() {
_0.entry.0:
  %0 = alloca [256 x i32]                                                          ; inst 1
  %1 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %2 = phi i32 [0, %_0.entry.0], [%5, %_2.array.body.0]                            ; inst 4
  %3 = icmp slt i32 %2, 256                                                        ; inst 5
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
  call void @load_program([256 x i32]* %0)                                         ; inst 21
  br label %_7.while.cond.0                                                        ; inst 22
_7.while.cond.0:
  %12 = phi i32 [-1, %_6.array.exit.1], [%186, %_74.if.exit.20]                    ; inst 23
  %13 = phi i1 [0, %_6.array.exit.1], [%192, %_74.if.exit.20]                      ; inst 24
  %14 = phi i32 [0, %_6.array.exit.1], [%188, %_74.if.exit.20]                     ; inst 25
  %15 = icmp eq i1 %13, 0                                                          ; inst 26
  br i1 %15, label %_8.while.body.0, label %_75.while.exit.0                       ; inst 27
_8.while.body.0:
  %16 = sext i32 %14 to i64                                                        ; inst 28
  %17 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %16                 ; inst 29
  %18 = load i32, i32* %17                                                         ; inst 30
  %19 = add i32 %14, 1                                                             ; inst 31
  call void @self_modify_code([256 x i32]* %0, i32 %19)                            ; inst 32
  %20 = icmp eq i32 %18, 1                                                         ; inst 33
  br i1 %20, label %_9.if.then.0, label %_10.if.else.0                             ; inst 34
_9.if.then.0:
  %21 = sext i32 %19 to i64                                                        ; inst 35
  %22 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %21                 ; inst 36
  %23 = load i32, i32* %22                                                         ; inst 37
  %24 = add i32 %19, 1                                                             ; inst 38
  %25 = add i32 %12, 1                                                             ; inst 39
  %26 = sext i32 %25 to i64                                                        ; inst 40
  %27 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %26                 ; inst 41
  store i32 %23, i32* %27                                                          ; inst 42
  br label %_68.if.exit.0                                                          ; inst 43
_10.if.else.0:
  %28 = icmp eq i32 %18, 2                                                         ; inst 44
  br i1 %28, label %_11.if.then.1, label %_12.if.else.1                            ; inst 45
_11.if.then.1:
  %29 = sub i32 %12, 1                                                             ; inst 46
  br label %_67.if.exit.1                                                          ; inst 47
_12.if.else.1:
  %30 = icmp eq i32 %18, 3                                                         ; inst 48
  br i1 %30, label %_13.if.then.2, label %_14.if.else.2                            ; inst 49
_13.if.then.2:
  %31 = sext i32 %12 to i64                                                        ; inst 50
  %32 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %31                 ; inst 51
  %33 = load i32, i32* %32                                                         ; inst 52
  %34 = sub i32 %12, 1                                                             ; inst 53
  %35 = sext i32 %34 to i64                                                        ; inst 54
  %36 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %35                 ; inst 55
  %37 = load i32, i32* %36                                                         ; inst 56
  %38 = sext i32 %34 to i64                                                        ; inst 57
  %39 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %38                 ; inst 58
  %40 = add i32 %37, %33                                                           ; inst 59
  store i32 %40, i32* %39                                                          ; inst 60
  br label %_66.if.exit.2                                                          ; inst 61
_14.if.else.2:
  %41 = icmp eq i32 %18, 4                                                         ; inst 62
  br i1 %41, label %_15.if.then.3, label %_16.if.else.3                            ; inst 63
_15.if.then.3:
  %42 = sext i32 %12 to i64                                                        ; inst 64
  %43 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %42                 ; inst 65
  %44 = load i32, i32* %43                                                         ; inst 66
  %45 = sub i32 %12, 1                                                             ; inst 67
  %46 = sext i32 %45 to i64                                                        ; inst 68
  %47 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %46                 ; inst 69
  %48 = load i32, i32* %47                                                         ; inst 70
  %49 = sext i32 %45 to i64                                                        ; inst 71
  %50 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %49                 ; inst 72
  %51 = sub i32 %48, %44                                                           ; inst 73
  store i32 %51, i32* %50                                                          ; inst 74
  br label %_65.if.exit.3                                                          ; inst 75
_16.if.else.3:
  %52 = icmp eq i32 %18, 5                                                         ; inst 76
  br i1 %52, label %_17.if.then.4, label %_18.if.else.4                            ; inst 77
_17.if.then.4:
  %53 = sext i32 %12 to i64                                                        ; inst 78
  %54 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %53                 ; inst 79
  %55 = load i32, i32* %54                                                         ; inst 80
  %56 = sub i32 %12, 1                                                             ; inst 81
  %57 = sext i32 %56 to i64                                                        ; inst 82
  %58 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %57                 ; inst 83
  %59 = load i32, i32* %58                                                         ; inst 84
  %60 = sext i32 %56 to i64                                                        ; inst 85
  %61 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %60                 ; inst 86
  %62 = mul i32 %59, %55                                                           ; inst 87
  store i32 %62, i32* %61                                                          ; inst 88
  br label %_64.if.exit.4                                                          ; inst 89
_18.if.else.4:
  %63 = icmp eq i32 %18, 6                                                         ; inst 90
  br i1 %63, label %_19.if.then.5, label %_20.if.else.5                            ; inst 91
_19.if.then.5:
  %64 = sext i32 %12 to i64                                                        ; inst 92
  %65 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %64                 ; inst 93
  %66 = load i32, i32* %65                                                         ; inst 94
  %67 = sub i32 %12, 1                                                             ; inst 95
  %68 = sext i32 %67 to i64                                                        ; inst 96
  %69 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %68                 ; inst 97
  %70 = load i32, i32* %69                                                         ; inst 98
  %71 = sext i32 %67 to i64                                                        ; inst 99
  %72 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %71                 ; inst 100
  %73 = sdiv i32 %70, %66                                                          ; inst 101
  store i32 %73, i32* %72                                                          ; inst 102
  br label %_63.if.exit.5                                                          ; inst 103
_20.if.else.5:
  %74 = icmp eq i32 %18, 7                                                         ; inst 104
  br i1 %74, label %_21.if.then.6, label %_22.if.else.6                            ; inst 105
_21.if.then.6:
  %75 = sext i32 %19 to i64                                                        ; inst 106
  %76 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %75                 ; inst 107
  %77 = load i32, i32* %76                                                         ; inst 108
  br label %_62.if.exit.6                                                          ; inst 109
_22.if.else.6:
  %78 = icmp eq i32 %18, 8                                                         ; inst 110
  br i1 %78, label %_23.if.then.7, label %_27.if.else.7                            ; inst 111
_23.if.then.7:
  %79 = sext i32 %12 to i64                                                        ; inst 112
  %80 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %79                 ; inst 113
  %81 = load i32, i32* %80                                                         ; inst 114
  %82 = sub i32 %12, 1                                                             ; inst 115
  %83 = icmp eq i32 %81, 0                                                         ; inst 116
  br i1 %83, label %_24.if.then.8, label %_25.if.else.8                            ; inst 117
_24.if.then.8:
  %84 = sext i32 %19 to i64                                                        ; inst 118
  %85 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %84                 ; inst 119
  %86 = load i32, i32* %85                                                         ; inst 120
  br label %_26.if.exit.8                                                          ; inst 121
_25.if.else.8:
  %87 = add i32 %19, 1                                                             ; inst 122
  br label %_26.if.exit.8                                                          ; inst 123
_26.if.exit.8:
  %88 = phi i32 [%86, %_24.if.then.8], [%87, %_25.if.else.8]                       ; inst 124
  br label %_61.if.exit.7                                                          ; inst 125
_27.if.else.7:
  %89 = icmp eq i32 %18, 9                                                         ; inst 126
  br i1 %89, label %_28.if.then.9, label %_32.if.else.9                            ; inst 127
_28.if.then.9:
  %90 = sext i32 %12 to i64                                                        ; inst 128
  %91 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %90                 ; inst 129
  %92 = load i32, i32* %91                                                         ; inst 130
  %93 = sub i32 %12, 1                                                             ; inst 131
  %94 = icmp ne i32 %92, 0                                                         ; inst 132
  br i1 %94, label %_29.if.then.10, label %_30.if.else.10                          ; inst 133
_29.if.then.10:
  %95 = sext i32 %19 to i64                                                        ; inst 134
  %96 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i64 %95                 ; inst 135
  %97 = load i32, i32* %96                                                         ; inst 136
  br label %_31.if.exit.10                                                         ; inst 137
_30.if.else.10:
  %98 = add i32 %19, 1                                                             ; inst 138
  br label %_31.if.exit.10                                                         ; inst 139
_31.if.exit.10:
  %99 = phi i32 [%97, %_29.if.then.10], [%98, %_30.if.else.10]                     ; inst 140
  br label %_60.if.exit.9                                                          ; inst 141
_32.if.else.9:
  %100 = icmp eq i32 %18, 10                                                       ; inst 142
  br i1 %100, label %_33.if.then.11, label %_37.if.else.11                         ; inst 143
_33.if.then.11:
  %101 = sext i32 %12 to i64                                                       ; inst 144
  %102 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %101               ; inst 145
  %103 = load i32, i32* %102                                                       ; inst 146
  %104 = sub i32 %12, 1                                                            ; inst 147
  %105 = sext i32 %104 to i64                                                      ; inst 148
  %106 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %105               ; inst 149
  %107 = load i32, i32* %106                                                       ; inst 150
  %108 = icmp eq i32 %107, %103                                                    ; inst 151
  br i1 %108, label %_34.if.then.12, label %_35.if.else.12                         ; inst 152
_34.if.then.12:
  %109 = sext i32 %104 to i64                                                      ; inst 153
  %110 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %109               ; inst 154
  store i32 1, i32* %110                                                           ; inst 155
  br label %_36.if.exit.12                                                         ; inst 156
_35.if.else.12:
  %111 = sext i32 %104 to i64                                                      ; inst 157
  %112 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %111               ; inst 158
  store i32 0, i32* %112                                                           ; inst 159
  br label %_36.if.exit.12                                                         ; inst 160
_36.if.exit.12:
  br label %_59.if.exit.11                                                         ; inst 161
_37.if.else.11:
  %113 = icmp eq i32 %18, 11                                                       ; inst 162
  br i1 %113, label %_38.if.then.13, label %_42.if.else.13                         ; inst 163
_38.if.then.13:
  %114 = sext i32 %12 to i64                                                       ; inst 164
  %115 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %114               ; inst 165
  %116 = load i32, i32* %115                                                       ; inst 166
  %117 = sub i32 %12, 1                                                            ; inst 167
  %118 = sext i32 %117 to i64                                                      ; inst 168
  %119 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %118               ; inst 169
  %120 = load i32, i32* %119                                                       ; inst 170
  %121 = icmp slt i32 %120, %116                                                   ; inst 171
  br i1 %121, label %_39.if.then.14, label %_40.if.else.14                         ; inst 172
_39.if.then.14:
  %122 = sext i32 %117 to i64                                                      ; inst 173
  %123 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %122               ; inst 174
  store i32 1, i32* %123                                                           ; inst 175
  br label %_41.if.exit.14                                                         ; inst 176
_40.if.else.14:
  %124 = sext i32 %117 to i64                                                      ; inst 177
  %125 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %124               ; inst 178
  store i32 0, i32* %125                                                           ; inst 179
  br label %_41.if.exit.14                                                         ; inst 180
_41.if.exit.14:
  br label %_58.if.exit.13                                                         ; inst 181
_42.if.else.13:
  %126 = icmp eq i32 %18, 12                                                       ; inst 182
  br i1 %126, label %_43.if.then.15, label %_47.if.else.15                         ; inst 183
_43.if.then.15:
  %127 = sext i32 %12 to i64                                                       ; inst 184
  %128 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %127               ; inst 185
  %129 = load i32, i32* %128                                                       ; inst 186
  %130 = sub i32 %12, 1                                                            ; inst 187
  %131 = sext i32 %130 to i64                                                      ; inst 188
  %132 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %131               ; inst 189
  %133 = load i32, i32* %132                                                       ; inst 190
  %134 = icmp sgt i32 %133, %129                                                   ; inst 191
  br i1 %134, label %_44.if.then.16, label %_45.if.else.16                         ; inst 192
_44.if.then.16:
  %135 = sext i32 %130 to i64                                                      ; inst 193
  %136 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %135               ; inst 194
  store i32 1, i32* %136                                                           ; inst 195
  br label %_46.if.exit.16                                                         ; inst 196
_45.if.else.16:
  %137 = sext i32 %130 to i64                                                      ; inst 197
  %138 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %137               ; inst 198
  store i32 0, i32* %138                                                           ; inst 199
  br label %_46.if.exit.16                                                         ; inst 200
_46.if.exit.16:
  br label %_57.if.exit.15                                                         ; inst 201
_47.if.else.15:
  %139 = icmp eq i32 %18, 13                                                       ; inst 202
  br i1 %139, label %_48.if.then.17, label %_49.if.else.17                         ; inst 203
_48.if.then.17:
  %140 = sext i32 %12 to i64                                                       ; inst 204
  %141 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %140               ; inst 205
  %142 = load i32, i32* %141                                                       ; inst 206
  call void @printlnInt(i32 %142)                                                  ; inst 207
  br label %_56.if.exit.17                                                         ; inst 208
_49.if.else.17:
  %143 = icmp eq i32 %18, 14                                                       ; inst 209
  br i1 %143, label %_50.if.then.18, label %_51.if.else.18                         ; inst 210
_50.if.then.18:
  br label %_55.if.exit.18                                                         ; inst 211
_51.if.else.18:
  %144 = icmp eq i32 %18, 15                                                       ; inst 212
  br i1 %144, label %_52.if.then.19, label %_53.if.else.19                         ; inst 213
_52.if.then.19:
  %145 = sext i32 %12 to i64                                                       ; inst 214
  %146 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %145               ; inst 215
  %147 = load i32, i32* %146                                                       ; inst 216
  %148 = add i32 %12, 1                                                            ; inst 217
  %149 = sext i32 %148 to i64                                                      ; inst 218
  %150 = getelementptr [256 x i32], [256 x i32]* %6, i32 0, i64 %149               ; inst 219
  store i32 %147, i32* %150                                                        ; inst 220
  br label %_54.if.exit.19                                                         ; inst 221
_53.if.else.19:
  br label %_54.if.exit.19                                                         ; inst 222
_54.if.exit.19:
  %151 = phi i32 [%148, %_52.if.then.19], [%12, %_53.if.else.19]                   ; inst 223
  br label %_55.if.exit.18                                                         ; inst 224
_55.if.exit.18:
  %152 = phi i32 [%12, %_50.if.then.18], [%151, %_54.if.exit.19]                   ; inst 225
  %153 = phi i1 [1, %_50.if.then.18], [%13, %_54.if.exit.19]                       ; inst 226
  br label %_56.if.exit.17                                                         ; inst 227
_56.if.exit.17:
  %154 = phi i32 [%12, %_48.if.then.17], [%152, %_55.if.exit.18]                   ; inst 228
  %155 = phi i1 [%13, %_48.if.then.17], [%153, %_55.if.exit.18]                    ; inst 229
  br label %_57.if.exit.15                                                         ; inst 230
_57.if.exit.15:
  %156 = phi i32 [%130, %_46.if.exit.16], [%154, %_56.if.exit.17]                  ; inst 231
  %157 = phi i1 [%13, %_46.if.exit.16], [%155, %_56.if.exit.17]                    ; inst 232
  br label %_58.if.exit.13                                                         ; inst 233
_58.if.exit.13:
  %158 = phi i32 [%117, %_41.if.exit.14], [%156, %_57.if.exit.15]                  ; inst 234
  %159 = phi i1 [%13, %_41.if.exit.14], [%157, %_57.if.exit.15]                    ; inst 235
  br label %_59.if.exit.11                                                         ; inst 236
_59.if.exit.11:
  %160 = phi i32 [%104, %_36.if.exit.12], [%158, %_58.if.exit.13]                  ; inst 237
  %161 = phi i1 [%13, %_36.if.exit.12], [%159, %_58.if.exit.13]                    ; inst 238
  br label %_60.if.exit.9                                                          ; inst 239
_60.if.exit.9:
  %162 = phi i32 [%93, %_31.if.exit.10], [%160, %_59.if.exit.11]                   ; inst 240
  %163 = phi i1 [%13, %_31.if.exit.10], [%161, %_59.if.exit.11]                    ; inst 241
  %164 = phi i32 [%99, %_31.if.exit.10], [%19, %_59.if.exit.11]                    ; inst 242
  br label %_61.if.exit.7                                                          ; inst 243
_61.if.exit.7:
  %165 = phi i32 [%82, %_26.if.exit.8], [%162, %_60.if.exit.9]                     ; inst 244
  %166 = phi i1 [%13, %_26.if.exit.8], [%163, %_60.if.exit.9]                      ; inst 245
  %167 = phi i32 [%88, %_26.if.exit.8], [%164, %_60.if.exit.9]                     ; inst 246
  br label %_62.if.exit.6                                                          ; inst 247
_62.if.exit.6:
  %168 = phi i32 [%12, %_21.if.then.6], [%165, %_61.if.exit.7]                     ; inst 248
  %169 = phi i1 [%13, %_21.if.then.6], [%166, %_61.if.exit.7]                      ; inst 249
  %170 = phi i32 [%77, %_21.if.then.6], [%167, %_61.if.exit.7]                     ; inst 250
  br label %_63.if.exit.5                                                          ; inst 251
_63.if.exit.5:
  %171 = phi i32 [%67, %_19.if.then.5], [%168, %_62.if.exit.6]                     ; inst 252
  %172 = phi i1 [%13, %_19.if.then.5], [%169, %_62.if.exit.6]                      ; inst 253
  %173 = phi i32 [%19, %_19.if.then.5], [%170, %_62.if.exit.6]                     ; inst 254
  br label %_64.if.exit.4                                                          ; inst 255
_64.if.exit.4:
  %174 = phi i32 [%56, %_17.if.then.4], [%171, %_63.if.exit.5]                     ; inst 256
  %175 = phi i1 [%13, %_17.if.then.4], [%172, %_63.if.exit.5]                      ; inst 257
  %176 = phi i32 [%19, %_17.if.then.4], [%173, %_63.if.exit.5]                     ; inst 258
  br label %_65.if.exit.3                                                          ; inst 259
_65.if.exit.3:
  %177 = phi i32 [%45, %_15.if.then.3], [%174, %_64.if.exit.4]                     ; inst 260
  %178 = phi i1 [%13, %_15.if.then.3], [%175, %_64.if.exit.4]                      ; inst 261
  %179 = phi i32 [%19, %_15.if.then.3], [%176, %_64.if.exit.4]                     ; inst 262
  br label %_66.if.exit.2                                                          ; inst 263
_66.if.exit.2:
  %180 = phi i32 [%34, %_13.if.then.2], [%177, %_65.if.exit.3]                     ; inst 264
  %181 = phi i1 [%13, %_13.if.then.2], [%178, %_65.if.exit.3]                      ; inst 265
  %182 = phi i32 [%19, %_13.if.then.2], [%179, %_65.if.exit.3]                     ; inst 266
  br label %_67.if.exit.1                                                          ; inst 267
_67.if.exit.1:
  %183 = phi i32 [%29, %_11.if.then.1], [%180, %_66.if.exit.2]                     ; inst 268
  %184 = phi i1 [%13, %_11.if.then.1], [%181, %_66.if.exit.2]                      ; inst 269
  %185 = phi i32 [%19, %_11.if.then.1], [%182, %_66.if.exit.2]                     ; inst 270
  br label %_68.if.exit.0                                                          ; inst 271
_68.if.exit.0:
  %186 = phi i32 [%25, %_9.if.then.0], [%183, %_67.if.exit.1]                      ; inst 272
  %187 = phi i1 [%13, %_9.if.then.0], [%184, %_67.if.exit.1]                       ; inst 273
  %188 = phi i32 [%24, %_9.if.then.0], [%185, %_67.if.exit.1]                      ; inst 274
  %189 = icmp slt i32 %188, 0                                                      ; inst 275
  br i1 %189, label %_69.lazy.then.0, label %_70.lazy.else.0                       ; inst 276
_69.lazy.then.0:
  br label %_71.lazy.exit.0                                                        ; inst 277
_70.lazy.else.0:
  %190 = icmp sge i32 %188, 256                                                    ; inst 278
  br label %_71.lazy.exit.0                                                        ; inst 279
_71.lazy.exit.0:
  %191 = phi i1 [1, %_69.lazy.then.0], [%190, %_70.lazy.else.0]                    ; inst 280
  br i1 %191, label %_72.if.then.20, label %_73.if.else.20                         ; inst 281
_72.if.then.20:
  br label %_74.if.exit.20                                                         ; inst 282
_73.if.else.20:
  br label %_74.if.exit.20                                                         ; inst 283
_74.if.exit.20:
  %192 = phi i1 [1, %_72.if.then.20], [%187, %_73.if.else.20]                      ; inst 284
  br label %_7.while.cond.0                                                        ; inst 285
_75.while.exit.0:
  call void @exit(i32 0)                                                           ; inst 286
  ret void                                                                         ; inst 287
}

