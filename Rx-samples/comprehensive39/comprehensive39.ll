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

define void @setup_fsm([8 x [3 x i64]]* %0, [8 x [3 x i32]]* %1) {
_0.entry.0:
  %2 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 0            ; inst 1
  %3 = getelementptr [3 x i64], [3 x i64]* %2, i32 0, i64 0                        ; inst 2
  store i64 1, i64* %3                                                             ; inst 3
  %4 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 0            ; inst 4
  %5 = getelementptr [3 x i64], [3 x i64]* %4, i32 0, i64 1                        ; inst 5
  store i64 2, i64* %5                                                             ; inst 6
  %6 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 0            ; inst 7
  %7 = getelementptr [3 x i64], [3 x i64]* %6, i32 0, i64 2                        ; inst 8
  store i64 0, i64* %7                                                             ; inst 9
  %8 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 0            ; inst 10
  %9 = getelementptr [3 x i32], [3 x i32]* %8, i32 0, i64 0                        ; inst 11
  store i32 1, i32* %9                                                             ; inst 12
  %10 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 0           ; inst 13
  %11 = getelementptr [3 x i32], [3 x i32]* %10, i32 0, i64 1                      ; inst 14
  store i32 0, i32* %11                                                            ; inst 15
  %12 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 0           ; inst 16
  %13 = getelementptr [3 x i32], [3 x i32]* %12, i32 0, i64 2                      ; inst 17
  store i32 -1, i32* %13                                                           ; inst 18
  %14 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 1           ; inst 19
  %15 = getelementptr [3 x i64], [3 x i64]* %14, i32 0, i64 0                      ; inst 20
  store i64 3, i64* %15                                                            ; inst 21
  %16 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 1           ; inst 22
  %17 = getelementptr [3 x i64], [3 x i64]* %16, i32 0, i64 1                      ; inst 23
  store i64 4, i64* %17                                                            ; inst 24
  %18 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 1           ; inst 25
  %19 = getelementptr [3 x i64], [3 x i64]* %18, i32 0, i64 2                      ; inst 26
  store i64 0, i64* %19                                                            ; inst 27
  %20 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 1           ; inst 28
  %21 = getelementptr [3 x i32], [3 x i32]* %20, i32 0, i64 0                      ; inst 29
  store i32 2, i32* %21                                                            ; inst 30
  %22 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 1           ; inst 31
  %23 = getelementptr [3 x i32], [3 x i32]* %22, i32 0, i64 1                      ; inst 32
  store i32 3, i32* %23                                                            ; inst 33
  %24 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 1           ; inst 34
  %25 = getelementptr [3 x i32], [3 x i32]* %24, i32 0, i64 2                      ; inst 35
  store i32 0, i32* %25                                                            ; inst 36
  %26 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 2           ; inst 37
  %27 = getelementptr [3 x i64], [3 x i64]* %26, i32 0, i64 0                      ; inst 38
  store i64 5, i64* %27                                                            ; inst 39
  %28 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 2           ; inst 40
  %29 = getelementptr [3 x i64], [3 x i64]* %28, i32 0, i64 1                      ; inst 41
  store i64 6, i64* %29                                                            ; inst 42
  %30 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 2           ; inst 43
  %31 = getelementptr [3 x i64], [3 x i64]* %30, i32 0, i64 2                      ; inst 44
  store i64 1, i64* %31                                                            ; inst 45
  %32 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 2           ; inst 46
  %33 = getelementptr [3 x i32], [3 x i32]* %32, i32 0, i64 0                      ; inst 47
  store i32 5, i32* %33                                                            ; inst 48
  %34 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 2           ; inst 49
  %35 = getelementptr [3 x i32], [3 x i32]* %34, i32 0, i64 1                      ; inst 50
  store i32 8, i32* %35                                                            ; inst 51
  %36 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 2           ; inst 52
  %37 = getelementptr [3 x i32], [3 x i32]* %36, i32 0, i64 2                      ; inst 53
  store i32 13, i32* %37                                                           ; inst 54
  %38 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 3           ; inst 55
  %39 = getelementptr [3 x i64], [3 x i64]* %38, i32 0, i64 0                      ; inst 56
  store i64 7, i64* %39                                                            ; inst 57
  %40 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 3           ; inst 58
  %41 = getelementptr [3 x i64], [3 x i64]* %40, i32 0, i64 1                      ; inst 59
  store i64 0, i64* %41                                                            ; inst 60
  %42 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 3           ; inst 61
  %43 = getelementptr [3 x i64], [3 x i64]* %42, i32 0, i64 2                      ; inst 62
  store i64 1, i64* %43                                                            ; inst 63
  %44 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 3           ; inst 64
  %45 = getelementptr [3 x i32], [3 x i32]* %44, i32 0, i64 0                      ; inst 65
  store i32 21, i32* %45                                                           ; inst 66
  %46 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 3           ; inst 67
  %47 = getelementptr [3 x i32], [3 x i32]* %46, i32 0, i64 1                      ; inst 68
  store i32 34, i32* %47                                                           ; inst 69
  %48 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 3           ; inst 70
  %49 = getelementptr [3 x i32], [3 x i32]* %48, i32 0, i64 2                      ; inst 71
  store i32 55, i32* %49                                                           ; inst 72
  %50 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 4           ; inst 73
  %51 = getelementptr [3 x i64], [3 x i64]* %50, i32 0, i64 0                      ; inst 74
  store i64 2, i64* %51                                                            ; inst 75
  %52 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 4           ; inst 76
  %53 = getelementptr [3 x i64], [3 x i64]* %52, i32 0, i64 1                      ; inst 77
  store i64 5, i64* %53                                                            ; inst 78
  %54 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 4           ; inst 79
  %55 = getelementptr [3 x i64], [3 x i64]* %54, i32 0, i64 2                      ; inst 80
  store i64 4, i64* %55                                                            ; inst 81
  %56 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 4           ; inst 82
  %57 = getelementptr [3 x i32], [3 x i32]* %56, i32 0, i64 0                      ; inst 83
  store i32 -1, i32* %57                                                           ; inst 84
  %58 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 4           ; inst 85
  %59 = getelementptr [3 x i32], [3 x i32]* %58, i32 0, i64 1                      ; inst 86
  store i32 -2, i32* %59                                                           ; inst 87
  %60 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 4           ; inst 88
  %61 = getelementptr [3 x i32], [3 x i32]* %60, i32 0, i64 2                      ; inst 89
  store i32 -3, i32* %61                                                           ; inst 90
  %62 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 5           ; inst 91
  %63 = getelementptr [3 x i64], [3 x i64]* %62, i32 0, i64 0                      ; inst 92
  store i64 6, i64* %63                                                            ; inst 93
  %64 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 5           ; inst 94
  %65 = getelementptr [3 x i64], [3 x i64]* %64, i32 0, i64 1                      ; inst 95
  store i64 7, i64* %65                                                            ; inst 96
  %66 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 5           ; inst 97
  %67 = getelementptr [3 x i64], [3 x i64]* %66, i32 0, i64 2                      ; inst 98
  store i64 3, i64* %67                                                            ; inst 99
  %68 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 5           ; inst 100
  %69 = getelementptr [3 x i32], [3 x i32]* %68, i32 0, i64 0                      ; inst 101
  store i32 10, i32* %69                                                           ; inst 102
  %70 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 5           ; inst 103
  %71 = getelementptr [3 x i32], [3 x i32]* %70, i32 0, i64 1                      ; inst 104
  store i32 20, i32* %71                                                           ; inst 105
  %72 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 5           ; inst 106
  %73 = getelementptr [3 x i32], [3 x i32]* %72, i32 0, i64 2                      ; inst 107
  store i32 30, i32* %73                                                           ; inst 108
  %74 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 6           ; inst 109
  %75 = getelementptr [3 x i64], [3 x i64]* %74, i32 0, i64 0                      ; inst 110
  store i64 0, i64* %75                                                            ; inst 111
  %76 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 6           ; inst 112
  %77 = getelementptr [3 x i64], [3 x i64]* %76, i32 0, i64 1                      ; inst 113
  store i64 1, i64* %77                                                            ; inst 114
  %78 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 6           ; inst 115
  %79 = getelementptr [3 x i64], [3 x i64]* %78, i32 0, i64 2                      ; inst 116
  store i64 2, i64* %79                                                            ; inst 117
  %80 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 6           ; inst 118
  %81 = getelementptr [3 x i32], [3 x i32]* %80, i32 0, i64 0                      ; inst 119
  store i32 40, i32* %81                                                           ; inst 120
  %82 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 6           ; inst 121
  %83 = getelementptr [3 x i32], [3 x i32]* %82, i32 0, i64 1                      ; inst 122
  store i32 50, i32* %83                                                           ; inst 123
  %84 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 6           ; inst 124
  %85 = getelementptr [3 x i32], [3 x i32]* %84, i32 0, i64 2                      ; inst 125
  store i32 60, i32* %85                                                           ; inst 126
  %86 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 7           ; inst 127
  %87 = getelementptr [3 x i64], [3 x i64]* %86, i32 0, i64 0                      ; inst 128
  store i64 4, i64* %87                                                            ; inst 129
  %88 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 7           ; inst 130
  %89 = getelementptr [3 x i64], [3 x i64]* %88, i32 0, i64 1                      ; inst 131
  store i64 3, i64* %89                                                            ; inst 132
  %90 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 7           ; inst 133
  %91 = getelementptr [3 x i64], [3 x i64]* %90, i32 0, i64 2                      ; inst 134
  store i64 5, i64* %91                                                            ; inst 135
  %92 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 7           ; inst 136
  %93 = getelementptr [3 x i32], [3 x i32]* %92, i32 0, i64 0                      ; inst 137
  store i32 70, i32* %93                                                           ; inst 138
  %94 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 7           ; inst 139
  %95 = getelementptr [3 x i32], [3 x i32]* %94, i32 0, i64 1                      ; inst 140
  store i32 80, i32* %95                                                           ; inst 141
  %96 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 7           ; inst 142
  %97 = getelementptr [3 x i32], [3 x i32]* %96, i32 0, i64 2                      ; inst 143
  store i32 90, i32* %97                                                           ; inst 144
  ret void                                                                         ; inst 145
}

define i32 @run_fsm([8 x [3 x i64]]* %0, [8 x [3 x i32]]* %1, [100 x i32]* %2, i64 %3) {
_0.entry.0:
  br label %_1.while.cond.0                                                        ; inst 1
_1.while.cond.0:
  %4 = phi i64 [0, %_0.entry.0], [%45, %_23.if.exit.0]                             ; inst 2
  %5 = phi i32 [0, %_0.entry.0], [%46, %_23.if.exit.0]                             ; inst 3
  %6 = phi i64 [0, %_0.entry.0], [%47, %_23.if.exit.0]                             ; inst 4
  %7 = icmp ult i64 %6, %3                                                         ; inst 5
  br i1 %7, label %_2.while.body.0, label %_24.while.exit.0                        ; inst 6
_2.while.body.0:
  %8 = getelementptr [100 x i32], [100 x i32]* %2, i32 0, i64 %6                   ; inst 7
  %9 = load i32, i32* %8                                                           ; inst 8
  %10 = icmp sge i32 %9, 0                                                         ; inst 9
  br i1 %10, label %_3.if.then.0, label %_22.if.else.0                             ; inst 10
_3.if.then.0:
  %11 = icmp slt i32 %9, 3                                                         ; inst 11
  br i1 %11, label %_4.if.then.1, label %_20.if.else.1                             ; inst 12
_4.if.then.1:
  %12 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %1, i32 0, i64 %4          ; inst 13
  %13 = sext i32 %9 to i64                                                         ; inst 14
  %14 = getelementptr [3 x i32], [3 x i32]* %12, i32 0, i64 %13                    ; inst 15
  %15 = load i32, i32* %14                                                         ; inst 16
  %16 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %0, i32 0, i64 %4          ; inst 17
  %17 = sext i32 %9 to i64                                                         ; inst 18
  %18 = getelementptr [3 x i64], [3 x i64]* %16, i32 0, i64 %17                    ; inst 19
  %19 = load i64, i64* %18                                                         ; inst 20
  %20 = icmp sgt i32 %15, 0                                                        ; inst 21
  br i1 %20, label %_5.if.then.2, label %_9.if.else.2                              ; inst 22
_5.if.then.2:
  %21 = urem i64 %4, 2                                                             ; inst 23
  %22 = icmp eq i64 %21, 0                                                         ; inst 24
  br i1 %22, label %_6.if.then.3, label %_7.if.else.3                              ; inst 25
_6.if.then.3:
  %23 = mul i32 %15, 2                                                             ; inst 26
  %24 = add i32 %5, %23                                                            ; inst 27
  br label %_8.if.exit.3                                                           ; inst 28
_7.if.else.3:
  %25 = add i32 %5, %15                                                            ; inst 29
  br label %_8.if.exit.3                                                           ; inst 30
_8.if.exit.3:
  %26 = phi i32 [%24, %_6.if.then.3], [%25, %_7.if.else.3]                         ; inst 31
  br label %_13.if.exit.2                                                          ; inst 32
_9.if.else.2:
  %27 = icmp sgt i32 %5, 100                                                       ; inst 33
  br i1 %27, label %_10.if.then.4, label %_11.if.else.4                            ; inst 34
_10.if.then.4:
  %28 = add i32 %5, %15                                                            ; inst 35
  br label %_12.if.exit.4                                                          ; inst 36
_11.if.else.4:
  %29 = sub i32 %5, %15                                                            ; inst 37
  br label %_12.if.exit.4                                                          ; inst 38
_12.if.exit.4:
  %30 = phi i32 [%28, %_10.if.then.4], [%29, %_11.if.else.4]                       ; inst 39
  br label %_13.if.exit.2                                                          ; inst 40
_13.if.exit.2:
  %31 = phi i32 [%26, %_8.if.exit.3], [%30, %_12.if.exit.4]                        ; inst 41
  br label %_14.while.cond.1                                                       ; inst 42
_14.while.cond.1:
  %32 = phi i32 [0, %_13.if.exit.2], [%40, %_18.if.exit.5]                         ; inst 43
  %33 = phi i32 [0, %_13.if.exit.2], [%41, %_18.if.exit.5]                         ; inst 44
  %34 = srem i32 %15, 10                                                           ; inst 45
  %35 = icmp slt i32 %33, %34                                                      ; inst 46
  br i1 %35, label %_15.while.body.1, label %_19.while.exit.1                      ; inst 47
_15.while.body.1:
  %36 = srem i32 %33, 2                                                            ; inst 48
  %37 = icmp eq i32 %36, 0                                                         ; inst 49
  br i1 %37, label %_16.if.then.5, label %_17.if.else.5                            ; inst 50
_16.if.then.5:
  %38 = add i32 %32, %33                                                           ; inst 51
  br label %_18.if.exit.5                                                          ; inst 52
_17.if.else.5:
  %39 = sub i32 %32, %33                                                           ; inst 53
  br label %_18.if.exit.5                                                          ; inst 54
_18.if.exit.5:
  %40 = phi i32 [%38, %_16.if.then.5], [%39, %_17.if.else.5]                       ; inst 55
  %41 = add i32 %33, 1                                                             ; inst 56
  br label %_14.while.cond.1                                                       ; inst 57
_19.while.exit.1:
  %42 = add i32 %31, %32                                                           ; inst 58
  br label %_21.if.exit.1                                                          ; inst 59
_20.if.else.1:
  br label %_21.if.exit.1                                                          ; inst 60
_21.if.exit.1:
  %43 = phi i64 [%19, %_19.while.exit.1], [%4, %_20.if.else.1]                     ; inst 61
  %44 = phi i32 [%42, %_19.while.exit.1], [%5, %_20.if.else.1]                     ; inst 62
  br label %_23.if.exit.0                                                          ; inst 63
_22.if.else.0:
  br label %_23.if.exit.0                                                          ; inst 64
_23.if.exit.0:
  %45 = phi i64 [%43, %_21.if.exit.1], [%4, %_22.if.else.0]                        ; inst 65
  %46 = phi i32 [%44, %_21.if.exit.1], [%5, %_22.if.else.0]                        ; inst 66
  %47 = add i64 %6, 1                                                              ; inst 67
  br label %_1.while.cond.0                                                        ; inst 68
_24.while.exit.0:
  ret i32 %5                                                                       ; inst 69
}

define void @generate_inputs([100 x i32]* sret([100 x i32]) %0, i32 %1, i32 %2) {
_0.entry.0:
  %3 = alloca [100 x i32]                                                          ; inst 1
  %4 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i32 0                    ; inst 2
  br label %_1.array.cond.0                                                        ; inst 3
_1.array.cond.0:
  %5 = phi i32 [0, %_0.entry.0], [%8, %_2.array.body.0]                            ; inst 4
  %6 = icmp slt i32 %5, 100                                                        ; inst 5
  br i1 %6, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 6
_2.array.body.0:
  %7 = getelementptr i32, i32* %4, i32 %5                                          ; inst 7
  store i32 0, i32* %7                                                             ; inst 8
  %8 = add i32 %5, 1                                                               ; inst 9
  br label %_1.array.cond.0                                                        ; inst 10
_3.array.exit.0:
  br label %_4.while.cond.0                                                        ; inst 11
_4.while.cond.0:
  %9 = phi i32 [%1, %_3.array.exit.0], [%13, %_5.while.body.0]                     ; inst 12
  %10 = phi i32 [0, %_3.array.exit.0], [%17, %_5.while.body.0]                     ; inst 13
  %11 = icmp slt i32 %10, %2                                                       ; inst 14
  br i1 %11, label %_5.while.body.0, label %_6.while.exit.0                        ; inst 15
_5.while.body.0:
  %12 = call i32 @pm_rand_update(i32 %9)                                           ; inst 16
  %13 = sdiv i32 %12, 65536                                                        ; inst 17
  %14 = sext i32 %10 to i64                                                        ; inst 18
  %15 = getelementptr [100 x i32], [100 x i32]* %3, i32 0, i64 %14                 ; inst 19
  %16 = srem i32 %13, 3                                                            ; inst 20
  store i32 %16, i32* %15                                                          ; inst 21
  %17 = add i32 %10, 1                                                             ; inst 22
  br label %_4.while.cond.0                                                        ; inst 23
_6.while.exit.0:
  call void @memcpy([100 x i32]* %0, [100 x i32]* %3, i64 400)                     ; inst 24
  ret void                                                                         ; inst 25
}

define void @main() {
_0.entry.0:
  %0 = alloca [100 x i32]                                                          ; inst 1
  %1 = alloca [100 x i32]                                                          ; inst 2
  %2 = alloca [100 x i32]                                                          ; inst 3
  %3 = alloca [8 x [3 x i64]]                                                      ; inst 4
  %4 = alloca [3 x i64]                                                            ; inst 5
  %5 = getelementptr [3 x i64], [3 x i64]* %4, i32 0, i32 0                        ; inst 6
  br label %_1.array.cond.0                                                        ; inst 7
_1.array.cond.0:
  %6 = phi i32 [0, %_0.entry.0], [%9, %_2.array.body.0]                            ; inst 8
  %7 = icmp slt i32 %6, 3                                                          ; inst 9
  br i1 %7, label %_2.array.body.0, label %_3.array.exit.0                         ; inst 10
_2.array.body.0:
  %8 = getelementptr i64, i64* %5, i32 %6                                          ; inst 11
  store i64 0, i64* %8                                                             ; inst 12
  %9 = add i32 %6, 1                                                               ; inst 13
  br label %_1.array.cond.0                                                        ; inst 14
_3.array.exit.0:
  %10 = getelementptr [8 x [3 x i64]], [8 x [3 x i64]]* %3, i32 0, i32 0           ; inst 15
  br label %_4.array.cond.1                                                        ; inst 16
_4.array.cond.1:
  %11 = phi i32 [0, %_3.array.exit.0], [%14, %_5.array.body.1]                     ; inst 17
  %12 = icmp slt i32 %11, 8                                                        ; inst 18
  br i1 %12, label %_5.array.body.1, label %_6.array.exit.1                        ; inst 19
_5.array.body.1:
  %13 = getelementptr [3 x i64], [3 x i64]* %10, i32 %11                           ; inst 20
  call void @memcpy([3 x i64]* %13, [3 x i64]* %4, i64 24)                         ; inst 21
  %14 = add i32 %11, 1                                                             ; inst 22
  br label %_4.array.cond.1                                                        ; inst 23
_6.array.exit.1:
  %15 = alloca [8 x [3 x i32]]                                                     ; inst 24
  %16 = alloca [3 x i32]                                                           ; inst 25
  %17 = getelementptr [3 x i32], [3 x i32]* %16, i32 0, i32 0                      ; inst 26
  br label %_7.array.cond.2                                                        ; inst 27
_7.array.cond.2:
  %18 = phi i32 [0, %_6.array.exit.1], [%21, %_8.array.body.2]                     ; inst 28
  %19 = icmp slt i32 %18, 3                                                        ; inst 29
  br i1 %19, label %_8.array.body.2, label %_9.array.exit.2                        ; inst 30
_8.array.body.2:
  %20 = getelementptr i32, i32* %17, i32 %18                                       ; inst 31
  store i32 0, i32* %20                                                            ; inst 32
  %21 = add i32 %18, 1                                                             ; inst 33
  br label %_7.array.cond.2                                                        ; inst 34
_9.array.exit.2:
  %22 = getelementptr [8 x [3 x i32]], [8 x [3 x i32]]* %15, i32 0, i32 0          ; inst 35
  br label %_10.array.cond.3                                                       ; inst 36
_10.array.cond.3:
  %23 = phi i32 [0, %_9.array.exit.2], [%26, %_11.array.body.3]                    ; inst 37
  %24 = icmp slt i32 %23, 8                                                        ; inst 38
  br i1 %24, label %_11.array.body.3, label %_12.array.exit.3                      ; inst 39
_11.array.body.3:
  %25 = getelementptr [3 x i32], [3 x i32]* %22, i32 %23                           ; inst 40
  call void @memcpy([3 x i32]* %25, [3 x i32]* %16, i64 12)                        ; inst 41
  %26 = add i32 %23, 1                                                             ; inst 42
  br label %_10.array.cond.3                                                       ; inst 43
_12.array.exit.3:
  call void @setup_fsm([8 x [3 x i64]]* %3, [8 x [3 x i32]]* %15)                  ; inst 44
  %27 = alloca [100 x i32]                                                         ; inst 45
  call void @generate_inputs([100 x i32]* %27, i32 42, i32 100)                    ; inst 46
  call void @memcpy([100 x i32]* %0, [100 x i32]* %27, i64 400)                    ; inst 47
  %28 = call i32 @run_fsm([8 x [3 x i64]]* %3, [8 x [3 x i32]]* %15, [100 x i32]* %0, i64 100) ; inst 48
  call void @printlnInt(i32 %28)                                                   ; inst 49
  %29 = alloca [100 x i32]                                                         ; inst 50
  call void @generate_inputs([100 x i32]* %29, i32 1337, i32 80)                   ; inst 51
  call void @memcpy([100 x i32]* %1, [100 x i32]* %29, i64 400)                    ; inst 52
  %30 = call i32 @run_fsm([8 x [3 x i64]]* %3, [8 x [3 x i32]]* %15, [100 x i32]* %1, i64 80) ; inst 53
  call void @printlnInt(i32 %30)                                                   ; inst 54
  %31 = alloca [100 x i32]                                                         ; inst 55
  %32 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i32 0                  ; inst 56
  br label %_13.array.cond.4                                                       ; inst 57
_13.array.cond.4:
  %33 = phi i32 [0, %_12.array.exit.3], [%36, %_14.array.body.4]                   ; inst 58
  %34 = icmp slt i32 %33, 100                                                      ; inst 59
  br i1 %34, label %_14.array.body.4, label %_15.array.exit.4                      ; inst 60
_14.array.body.4:
  %35 = getelementptr i32, i32* %32, i32 %33                                       ; inst 61
  store i32 0, i32* %35                                                            ; inst 62
  %36 = add i32 %33, 1                                                             ; inst 63
  br label %_13.array.cond.4                                                       ; inst 64
_15.array.exit.4:
  br label %_16.while.cond.0                                                       ; inst 65
_16.while.cond.0:
  %37 = phi i32 [0, %_15.array.exit.4], [%43, %_17.while.body.0]                   ; inst 66
  %38 = icmp slt i32 %37, 50                                                       ; inst 67
  br i1 %38, label %_17.while.body.0, label %_18.while.exit.0                      ; inst 68
_17.while.body.0:
  %39 = sext i32 %37 to i64                                                        ; inst 69
  %40 = getelementptr [100 x i32], [100 x i32]* %31, i32 0, i64 %39                ; inst 70
  %41 = mul i32 %37, %37                                                           ; inst 71
  %42 = srem i32 %41, 3                                                            ; inst 72
  store i32 %42, i32* %40                                                          ; inst 73
  %43 = add i32 %37, 1                                                             ; inst 74
  br label %_16.while.cond.0                                                       ; inst 75
_18.while.exit.0:
  call void @memcpy([100 x i32]* %2, [100 x i32]* %31, i64 400)                    ; inst 76
  %44 = call i32 @run_fsm([8 x [3 x i64]]* %3, [8 x [3 x i32]]* %15, [100 x i32]* %2, i64 50) ; inst 77
  call void @printlnInt(i32 %44)                                                   ; inst 78
  br label %_19.while.cond.1                                                       ; inst 79
_19.while.cond.1:
  %45 = phi i32 [0, %_18.while.exit.0], [%65, %_32.while.exit.2]                   ; inst 80
  %46 = phi i32 [0, %_18.while.exit.0], [%49, %_32.while.exit.2]                   ; inst 81
  %47 = icmp slt i32 %45, 10                                                       ; inst 82
  br i1 %47, label %_20.while.body.1, label %_33.while.exit.1                      ; inst 83
_20.while.body.1:
  br label %_21.while.cond.2                                                       ; inst 84
_21.while.cond.2:
  %48 = phi i32 [0, %_20.while.body.1], [%64, %_31.if.exit.0]                      ; inst 85
  %49 = phi i32 [%46, %_20.while.body.1], [%63, %_31.if.exit.0]                    ; inst 86
  %50 = icmp slt i32 %48, 10                                                       ; inst 87
  br i1 %50, label %_22.while.body.2, label %_32.while.exit.2                      ; inst 88
_22.while.body.2:
  %51 = srem i32 %45, 2                                                            ; inst 89
  %52 = icmp eq i32 %51, 0                                                         ; inst 90
  br i1 %52, label %_23.if.then.0, label %_27.if.else.0                            ; inst 91
_23.if.then.0:
  %53 = srem i32 %48, 3                                                            ; inst 92
  %54 = icmp eq i32 %53, 0                                                         ; inst 93
  br i1 %54, label %_24.if.then.1, label %_25.if.else.1                            ; inst 94
_24.if.then.1:
  %55 = add i32 %49, 1                                                             ; inst 95
  br label %_26.if.exit.1                                                          ; inst 96
_25.if.else.1:
  %56 = sub i32 %49, 1                                                             ; inst 97
  br label %_26.if.exit.1                                                          ; inst 98
_26.if.exit.1:
  %57 = phi i32 [%55, %_24.if.then.1], [%56, %_25.if.else.1]                       ; inst 99
  br label %_31.if.exit.0                                                          ; inst 100
_27.if.else.0:
  %58 = srem i32 %48, 2                                                            ; inst 101
  %59 = icmp eq i32 %58, 0                                                         ; inst 102
  br i1 %59, label %_28.if.then.2, label %_29.if.else.2                            ; inst 103
_28.if.then.2:
  %60 = add i32 %49, 2                                                             ; inst 104
  br label %_30.if.exit.2                                                          ; inst 105
_29.if.else.2:
  %61 = sub i32 %49, 2                                                             ; inst 106
  br label %_30.if.exit.2                                                          ; inst 107
_30.if.exit.2:
  %62 = phi i32 [%60, %_28.if.then.2], [%61, %_29.if.else.2]                       ; inst 108
  br label %_31.if.exit.0                                                          ; inst 109
_31.if.exit.0:
  %63 = phi i32 [%57, %_26.if.exit.1], [%62, %_30.if.exit.2]                       ; inst 110
  %64 = add i32 %48, 1                                                             ; inst 111
  br label %_21.while.cond.2                                                       ; inst 112
_32.while.exit.2:
  %65 = add i32 %45, 1                                                             ; inst 113
  br label %_19.while.cond.1                                                       ; inst 114
_33.while.exit.1:
  call void @printlnInt(i32 %46)                                                   ; inst 115
  %66 = icmp sgt i32 10, 20                                                        ; inst 116
  br i1 %66, label %_34.if.then.3, label %_38.if.else.3                            ; inst 117
_34.if.then.3:
  %67 = icmp sgt i32 20, 30                                                        ; inst 118
  br i1 %67, label %_35.if.then.4, label %_36.if.else.4                            ; inst 119
_35.if.then.4:
  call void @printlnInt(i32 1)                                                     ; inst 120
  br label %_37.if.exit.4                                                          ; inst 121
_36.if.else.4:
  call void @printlnInt(i32 2)                                                     ; inst 122
  br label %_37.if.exit.4                                                          ; inst 123
_37.if.exit.4:
  br label %_45.if.exit.3                                                          ; inst 124
_38.if.else.3:
  %68 = icmp slt i32 20, 30                                                        ; inst 125
  br i1 %68, label %_39.if.then.5, label %_43.if.else.5                            ; inst 126
_39.if.then.5:
  %69 = icmp slt i32 10, 30                                                        ; inst 127
  br i1 %69, label %_40.if.then.6, label %_41.if.else.6                            ; inst 128
_40.if.then.6:
  call void @printlnInt(i32 3)                                                     ; inst 129
  br label %_42.if.exit.6                                                          ; inst 130
_41.if.else.6:
  call void @printlnInt(i32 4)                                                     ; inst 131
  br label %_42.if.exit.6                                                          ; inst 132
_42.if.exit.6:
  br label %_44.if.exit.5                                                          ; inst 133
_43.if.else.5:
  call void @printlnInt(i32 5)                                                     ; inst 134
  br label %_44.if.exit.5                                                          ; inst 135
_44.if.exit.5:
  br label %_45.if.exit.3                                                          ; inst 136
_45.if.exit.3:
  br label %_46.while.cond.3                                                       ; inst 137
_46.while.cond.3:
  %70 = phi i32 [0, %_45.if.exit.3], [%95, %_62.if.exit.7]                         ; inst 138
  %71 = phi i32 [0, %_45.if.exit.3], [%96, %_62.if.exit.7]                         ; inst 139
  %72 = phi i32 [0, %_45.if.exit.3], [%97, %_62.if.exit.7]                         ; inst 140
  %73 = phi i32 [0, %_45.if.exit.3], [%98, %_62.if.exit.7]                         ; inst 141
  %74 = icmp slt i32 %73, 100                                                      ; inst 142
  br i1 %74, label %_47.while.body.3, label %_63.while.exit.3                      ; inst 143
_47.while.body.3:
  %75 = srem i32 %73, 6                                                            ; inst 144
  %76 = icmp eq i32 %75, 0                                                         ; inst 145
  br i1 %76, label %_48.if.then.7, label %_49.if.else.7                            ; inst 146
_48.if.then.7:
  %77 = add i32 %71, 1                                                             ; inst 147
  br label %_62.if.exit.7                                                          ; inst 148
_49.if.else.7:
  %78 = icmp eq i32 %75, 1                                                         ; inst 149
  br i1 %78, label %_50.if.then.8, label %_51.if.else.8                            ; inst 150
_50.if.then.8:
  %79 = sub i32 %71, 1                                                             ; inst 151
  br label %_61.if.exit.8                                                          ; inst 152
_51.if.else.8:
  %80 = icmp eq i32 %75, 2                                                         ; inst 153
  br i1 %80, label %_52.if.then.9, label %_53.if.else.9                            ; inst 154
_52.if.then.9:
  %81 = add i32 %72, %71                                                           ; inst 155
  br label %_60.if.exit.9                                                          ; inst 156
_53.if.else.9:
  %82 = icmp eq i32 %75, 3                                                         ; inst 157
  br i1 %82, label %_54.if.then.10, label %_55.if.else.10                          ; inst 158
_54.if.then.10:
  %83 = sub i32 %72, %71                                                           ; inst 159
  br label %_59.if.exit.10                                                         ; inst 160
_55.if.else.10:
  %84 = icmp eq i32 %75, 4                                                         ; inst 161
  br i1 %84, label %_56.if.then.11, label %_57.if.else.11                          ; inst 162
_56.if.then.11:
  %85 = add i32 %70, %72                                                           ; inst 163
  br label %_58.if.exit.11                                                         ; inst 164
_57.if.else.11:
  %86 = sub i32 %70, %72                                                           ; inst 165
  br label %_58.if.exit.11                                                         ; inst 166
_58.if.exit.11:
  %87 = phi i32 [%85, %_56.if.then.11], [%86, %_57.if.else.11]                     ; inst 167
  br label %_59.if.exit.10                                                         ; inst 168
_59.if.exit.10:
  %88 = phi i32 [%70, %_54.if.then.10], [%87, %_58.if.exit.11]                     ; inst 169
  %89 = phi i32 [%83, %_54.if.then.10], [%72, %_58.if.exit.11]                     ; inst 170
  br label %_60.if.exit.9                                                          ; inst 171
_60.if.exit.9:
  %90 = phi i32 [%70, %_52.if.then.9], [%88, %_59.if.exit.10]                      ; inst 172
  %91 = phi i32 [%81, %_52.if.then.9], [%89, %_59.if.exit.10]                      ; inst 173
  br label %_61.if.exit.8                                                          ; inst 174
_61.if.exit.8:
  %92 = phi i32 [%70, %_50.if.then.8], [%90, %_60.if.exit.9]                       ; inst 175
  %93 = phi i32 [%79, %_50.if.then.8], [%71, %_60.if.exit.9]                       ; inst 176
  %94 = phi i32 [%72, %_50.if.then.8], [%91, %_60.if.exit.9]                       ; inst 177
  br label %_62.if.exit.7                                                          ; inst 178
_62.if.exit.7:
  %95 = phi i32 [%70, %_48.if.then.7], [%92, %_61.if.exit.8]                       ; inst 179
  %96 = phi i32 [%77, %_48.if.then.7], [%93, %_61.if.exit.8]                       ; inst 180
  %97 = phi i32 [%72, %_48.if.then.7], [%94, %_61.if.exit.8]                       ; inst 181
  %98 = add i32 %73, 1                                                             ; inst 182
  br label %_46.while.cond.3                                                       ; inst 183
_63.while.exit.3:
  call void @printlnInt(i32 %71)                                                   ; inst 184
  call void @printlnInt(i32 %72)                                                   ; inst 185
  call void @printlnInt(i32 %70)                                                   ; inst 186
  %99 = icmp sgt i32 100, 50                                                       ; inst 187
  br i1 %99, label %_64.if.then.12, label %_68.if.else.12                          ; inst 188
_64.if.then.12:
  %100 = icmp sgt i32 200, 150                                                     ; inst 189
  br i1 %100, label %_65.if.then.13, label %_66.if.else.13                         ; inst 190
_65.if.then.13:
  call void @printlnInt(i32 301)                                                   ; inst 191
  br label %_67.if.exit.13                                                         ; inst 192
_66.if.else.13:
  br label %_67.if.exit.13                                                         ; inst 193
_67.if.exit.13:
  call void @printlnInt(i32 201)                                                   ; inst 194
  br label %_69.if.exit.12                                                         ; inst 195
_68.if.else.12:
  br label %_69.if.exit.12                                                         ; inst 196
_69.if.exit.12:
  call void @printlnInt(i32 101)                                                   ; inst 197
  br label %_70.while.cond.4                                                       ; inst 198
_70.while.cond.4:
  %101 = phi i32 [0, %_69.if.exit.12], [%103, %_71.while.body.4]                   ; inst 199
  %102 = icmp slt i32 %101, 1                                                      ; inst 200
  br i1 %102, label %_71.while.body.4, label %_72.while.exit.4                     ; inst 201
_71.while.body.4:
  %103 = add i32 %101, 1                                                           ; inst 202
  br label %_70.while.cond.4                                                       ; inst 203
_72.while.exit.4:
  br label %_73.while.cond.5                                                       ; inst 204
_73.while.cond.5:
  %104 = phi i32 [0, %_72.while.exit.4], [%107, %_77.if.exit.14]                   ; inst 205
  %105 = icmp slt i32 %104, 2                                                      ; inst 206
  br i1 %105, label %_74.while.body.5, label %_78.while.exit.5                     ; inst 207
_74.while.body.5:
  %106 = icmp eq i32 %104, 0                                                       ; inst 208
  br i1 %106, label %_75.if.then.14, label %_76.if.else.14                         ; inst 209
_75.if.then.14:
  call void @printlnInt(i32 790)                                                   ; inst 210
  br label %_77.if.exit.14                                                         ; inst 211
_76.if.else.14:
  br label %_77.if.exit.14                                                         ; inst 212
_77.if.exit.14:
  call void @printlnInt(i32 456)                                                   ; inst 213
  %107 = add i32 %104, 1                                                           ; inst 214
  br label %_73.while.cond.5                                                       ; inst 215
_78.while.exit.5:
  br label %_79.while.cond.6                                                       ; inst 216
_79.while.cond.6:
  %108 = phi i32 [0, %_78.while.exit.5], [%118, %_83.if.exit.15]                   ; inst 217
  %109 = phi i32 [0, %_78.while.exit.5], [%117, %_83.if.exit.15]                   ; inst 218
  %110 = icmp slt i32 %108, 10                                                     ; inst 219
  br i1 %110, label %_80.while.body.6, label %_84.while.exit.6                     ; inst 220
_80.while.body.6:
  %111 = mul i32 %108, %108                                                        ; inst 221
  %112 = srem i32 %108, 2                                                          ; inst 222
  %113 = icmp eq i32 %112, 0                                                       ; inst 223
  br i1 %113, label %_81.if.then.15, label %_82.if.else.15                         ; inst 224
_81.if.then.15:
  %114 = mul i32 %108, 2                                                           ; inst 225
  %115 = add i32 %109, %114                                                        ; inst 226
  br label %_83.if.exit.15                                                         ; inst 227
_82.if.else.15:
  br label %_83.if.exit.15                                                         ; inst 228
_83.if.exit.15:
  %116 = phi i32 [%115, %_81.if.then.15], [%109, %_82.if.else.15]                  ; inst 229
  %117 = add i32 %116, %111                                                        ; inst 230
  %118 = add i32 %108, 1                                                           ; inst 231
  br label %_79.while.cond.6                                                       ; inst 232
_84.while.exit.6:
  call void @printlnInt(i32 %109)                                                  ; inst 233
  call void @exit(i32 0)                                                           ; inst 234
  ret void                                                                         ; inst 235
}

